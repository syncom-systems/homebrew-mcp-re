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

`Formula/mcp-re.rb` is not written by hand. The `update` workflow in this repository takes
the newest release of the main repository, checks that its Apple Silicon archive passes
`gh attestation verify` and matches the release's `SHA256SUMS`, renders the main
repository's formula template (`packaging/homebrew/mcp-re.rb.in`) with that version and
checksum, and commits the result only after `brew audit --strict`, `brew install`,
`brew test` and an upgrade from the previously published formula succeed on a clean macOS
runner.

The formula installs the released binary. It never compiles MCP-RE.

## Verify what you installed

```sh
cat "$(brew --prefix mcp-re)/share/mcp-re/RELEASE.json"   # version, source revision, binary hashes
```

Licensed under Apache-2.0, as is MCP-RE.
