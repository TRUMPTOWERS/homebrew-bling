class Bling < Formula
  desc "bling things to your co-workers; does not support ipv6"
  homepage "https://github.com/TRUMPTOWERS/trump/bling"
  version "v0.2"
  url "https://github.com/TRUMPTOWERS/trump/archive/0.2.tar.gz"
  sha256 "b5a5989f4985696ffae9dcadc49466b7b3fbdc3bcddeab08b611685cfa2cda12"
  head "https://github.com/TRUMPTOWERS/trump.git"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    mkdir_p buildpath/"src/github.com/TRUMPTOWERS/"
    ln_sf buildpath, buildpath/"src/github.com/TRUMPTOWERS/trump"
    cd "src/github.com/TRUMPTOWERS/trump/bling" do
      system "go", "build", "-o", bin/"bling"
    end
  end

  test do
    system bin/"bling", "-h"
  end
end
