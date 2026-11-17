# mirror-earendil-works

OCX mirror for [Earendil Works](https://github.com/earendil-works) tooling. One
repository, one spec directory per package.

| Package | Spec | Publishes to | Announced as | Upstream SPDX |
|---|---|---|---|---|
| [pi](https://github.com/earendil-works/pi) | [`pi/mirror.yml`](pi/mirror.yml) | `ghcr.io/ocx-contrib/earendil-works/pi` | [`ocx.sh/earendil-works/pi`](https://index.ocx.sh/earendil-works/pi) | `MIT` |

Each upstream release is discovered, re-bundled, smoke-tested per
`(version, platform)` and only then pushed with cascade tags, after which the
result is announced into the OCX index.

## Layout

```
pi/
├── mirror.yml          the spec — never at the repo root
├── metadata.json       bundle interface
├── CATALOG.md          → ocx package describe
├── logo.svg / logo.png describe assets, 512px PNG
└── tests/smoke.star    Starlark smoke test
```

## Editing

Edit the spec, then regenerate CI naming **every** spec (the generated
workflows are never hand-edited; `verify-generated.yml` fails on drift):

```sh
ocx-mirror package validate pi/mirror.yml
ocx-mirror package pipeline generate ci --spec pi/mirror.yml
```

Pushes go straight to `main`.
