# pi/tests/smoke.star — asserts the contract, never help/version prose.

TOOL = "pi.exe" if ocx.target_platform.os == ocx.os.Windows else "pi"

# ── Tier 1 + 2: liveness + version SHAPE ────────────────────────────────────
r_version = ocx.run(TOOL, "--version")
expect.ok(r_version)
expect.matches(r_version.stdout, r"\d+\.\d+\.\d+")

# ── Tier 3: hermetic functional op — export a session file to HTML ──────────
# Needs no credentials or network (--offline), and reads the bundled
# export-html/ template + vendor JS beside the binary: a truncated archive
# (missing export-html/vendor/marked.min.js) fails here with ENOENT, exit 1.
ocx.write_file(
    "session.jsonl",
    "\n".join([
        '{"type":"session","version":3,"id":"0f8c2b1e-0000-4000-8000-000000000001","timestamp":"2026-01-01T00:00:00.000Z","cwd":"/tmp"}',
        '{"type":"message","id":"a1b2c3d4","parentId":null,"timestamp":"2026-01-01T00:00:01.000Z","message":{"role":"user","content":"hello","timestamp":1767225601000}}',
    ]) + "\n",
)
r_export = ocx.run(TOOL, "--offline", "--export", "session.jsonl", "out.html")
expect.ok(r_export)
html = ocx.read_file("out.html")
# The session payload slot and the inlined highlight.js (vendor asset) are
# both present only when the bundled template rendered.
expect.contains(html, 'id="session-data"')
expect.contains(html, "hljs")
