class Buzz < Formula
  desc "Agent-first CLI for the Buzz relay"
  homepage "https://github.com/block/buzz"
  url "https://github.com/block/buzz.git",
      revision: "5bd9d2c5d2912d9c8dbdcdf710d643a1d8ad91a2"
  version "0.1.0"
  license "Apache-2.0"

  depends_on "rust" => :build

  on_linux do
    # aws-lc-sys (rustls provider) falls back to a cmake-based build when its
    # prebuilt bindings do not cover the target.
    depends_on "cmake" => :build
  end

  def install
    system "cargo", "build", "--release", "--locked", "-p", "buzz-cli"
    bin.install "target/release/buzz"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/buzz --version")
  end
end
