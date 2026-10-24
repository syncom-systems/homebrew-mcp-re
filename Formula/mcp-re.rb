# SPDX-License-Identifier: Apache-2.0
class McpRe < Formula
  desc "Runtime evidence for MCP tool calls: signed-call proxy and client"
  homepage "https://github.com/syncom-systems/mcp-re"
  url "https://github.com/syncom-systems/mcp-re/releases/download/v0.19.0/mcp-re-0.19.0-darwin-arm64.tar.gz"
  sha256 "114fccf642056646e65ff6bc0739c70588404bd95f163fdb219f5634a73ab832"
  license "Apache-2.0"

  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "bin/mcp-re-proxy", "bin/mcp-re-client"
    pkgshare.install "RELEASE.json"
    doc.install "LICENSE", "NOTICE.md", "THIRD_PARTY.md"
  end

  test do
    release = JSON.parse((pkgshare/"RELEASE.json").read)
    assert_equal version.to_s, release.fetch("version")
    assert_equal "darwin-arm64", release.fetch("target")
    assert_match "--config", shell_output("#{bin}/mcp-re-client --help")
    # Both binaries refuse to start without their required configuration.
    assert_match "missing required", shell_output("#{bin}/mcp-re-proxy 2>&1", 1)
    assert_match "--config is required", shell_output("#{bin}/mcp-re-client 2>&1", 1)
  end
end
