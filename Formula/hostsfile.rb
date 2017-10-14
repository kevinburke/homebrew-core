class Hostsfile < Formula
  desc "CLI for manipulating /etc/hosts files"
  homepage "https://github.com/kevinburke/hostsfile"

  url "https://github.com/kevinburke/hostsfile/archive/1.4.tar.gz"
  sha256 "6702d19c45d0f3474d3a528cff7da67ad6e7fb912e027c910b1887961a24ecb2"
  license "MIT"
  head "https://github.com/kevinburke/hostsfile"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath

    lib_path = buildpath/"src/github.com/kevinburke/hostsfile"
    lib_path.install Dir["*"]
    cd lib_path do
      system "go", "build", "-o", bin/"hostsfile", "."
    end
  end

  test do
    assert_match "hostsfile version 1.4", shell_output("#{bin}/hostsfile version 2>&1", 2)
  end
end
