# Homebrew tap for MCP-RE

[MCP-RE](https://github.com/syncom-systems/mcp-re) (MCP Runtime Evidence) installs two
executables: `mcp-re-proxy`, the server-side policy-enforcement proxy, and `mcp-re-client`,
the client-side ambassador.

```sh
brew install syncom-systems/mcp-re/mcp-re      # taps and installs
brew upgrade mcp-re
brew uninstall mcp-re
brew untap syncom-systems/mcp-re
```

Apple Silicon macOS only. Intel Macs and Linux are not supported by this tap; Linux users
take the binary archive or the container image from the
[release](https://github.com/syncom-systems/mcp-re/releases).

## Where the formula comes from

`Formula/mcp-re.rb` is not written by hand. The release workflow in the main repository
builds the Apple Silicon archive with Bazel, attests it, and attaches a rendered
`mcp-re.rb` to the release. The `update` workflow in this repository fetches that file
from the newest release, and commits it only after

- the formula and the archive both pass `gh attestation verify` against the main repository,
- the formula's `sha256` equals the release's `SHA256SUMS` entry for the archive,
- `brew audit --strict`, `brew install`, `brew test` and an upgrade from the previously
  published formula succeed on a clean macOS runner.

The formula installs the released binary. It never compiles MCP-RE.

## Verify what you installed

```sh
cat "$(brew --prefix mcp-re)/share/mcp-re/RELEASE.json"   # version, source revision, binary hashes
```

Licensed under Apache-2.0, as is MCP-RE.
