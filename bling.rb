class Bling < Formula
  desc "bling things to your co-workers"
  homepage "https://github.com/TRUMPTOWERS/trump/bling"
  version "v0.1"
  url "https://github.com/TRUMPTOWERS/trump/archive/0.1.tar.gz"
  sha256 "de3ec26e33c427ec6194e6acdf6d8d3a953189aa67b729986a47f12a412fd319"
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
