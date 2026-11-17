# NOTICE

This repository packages and redistributes upstream software published by
[Earendil Works](https://github.com/earendil-works). The Apache-2.0 license in
[`LICENSE`](LICENSE) covers the OCX pipeline files authored here. It does
**not** cover any upstream-derived asset — each package's redistributed bytes
carry their own license, recorded below.

Each package's logo reproduces the **upstream project's own mark** (the pi.dev
favicon, `src/favicon.svg` in `earendil-works/pi-website`, MIT), unmodified
apart from scaling, solely to identify the software being mirrored. No
endorsement or affiliation is implied, and no trademark right is claimed.

| Package | GHCR path | Upstream SPDX |
|---|---|---|
| `pi` | `ghcr.io/ocx-contrib/earendil-works/pi` | `MIT` |

---

## `pi`

Upstream: <https://github.com/earendil-works/pi>
Published to `ghcr.io/ocx-contrib/earendil-works/pi`.

| Component | SPDX | Holder |
|---|---|---|
| pi (`pi`) | **MIT** | Copyright (c) 2025 Mario Zechner |

Verified with `gh api repos/earendil-works/pi/license --jq .license.spdx_id`,
which answers `MIT`, and against the `LICENSE` file at the repository root.

The MIT license grants redistribution in source and object form on the single
condition that the copyright and permission notice accompany copies. No
upstream artifact is modified; release archives are republished byte-for-byte
inside an OCX bundle. The bun-compiled binary embeds third-party JavaScript
dependencies under their own licenses, as distributed by upstream.
