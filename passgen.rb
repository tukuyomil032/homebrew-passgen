class Passgen < Formula
  include Language::Python::Virtualenv

  desc "A customizable password generator CLI tool"
  homepage "https://github.com/tukuyomil032/CLI-passgen"
  version "1.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tukuyomil032/CLI-passgen/releases/download/v1.0.0/passgen-macos-arm64.tar.gz"
      sha256 "e2ece368d1c115bc3f9522c8251d04cb43e6e62510a9b0f6017aa9546f924fd4"
    end

    on_intel do
      url "https://github.com/tukuyomil032/CLI-passgen/releases/download/v1.0.0/passgen-macos-amd64.tar.gz"
      sha256 "0aabcf32395add6c88d3d60799f2b01cb823e2ffe3e00ffe905f492ed9692d9f"
    end
  end

  on_linux do
    url "https://github.com/tukuyomil032/CLI-passgen/archive/refs/tags/v1.0.0.tar.gz"
    sha256 "e6f8db65c7dca50cf5a656df9b88285569d9cf054cbebf14d2ebf6dd988f13cf"
    depends_on "python@3.11"
  end

  def install
    if OS.mac?
      # The tar.gz release should contain the single `passgen` executable at top level.
      bin.install "passgen"
    else
      virtualenv_create(libexec, "python3.11")
      virtualenv_install_with_resources
    end
  end

  test do
    # Basic smoke test: check `--help` or `--version` output contains expected token.
    assert_match "passgen", shell_output("#{bin}/passgen --help")
  end
end