class Passgen < Formula
  include Language::Python::Virtualenv

  desc "A customizable password generator CLI tool"
  homepage "https://github.com/tukuyomil032/CLI-passgen"
  url "https://github.com/tukuyomil032/CLI-passgen/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "f46feefe9fe16e5b525fc7386def7772c0aad33392254110a2f22ce990c41d84"
  license "MIT"

  depends_on "python@3.11"

  def install
    virtualenv_create(libexec, "python3.11")
    virtualenv_install_with_resources
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/passgen --version")
  end
end
