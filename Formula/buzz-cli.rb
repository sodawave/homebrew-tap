class BuzzCli < Formula
  desc "Agent-first CLI for the Buzz relay"
  homepage "https://github.com/block/buzz"
  # Tracks the sodawave/buzz fork branch `cli-version` (block/buzz main + the
  # --version flag commit) until the change lands upstream.
  url "https://github.com/sodawave/buzz.git",
      revision: "ddc56af5f1346cb54b0c50d605226d43a554b8c0"
  version "0.1.0"
  license "Apache-2.0"

  depends_on "rust" => :build

  on_linux do
    # aws-lc-sys (rustls provider) falls back to a cmake-based build when its
    # prebuilt bindings do not cover the target.
    depends_on "cmake" => :build
  end

  def install
    cd "crates/buzz-cli" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/buzz --version")
  end
end
