class Circle < Formula
  desc "Command-line client for CircleCI"
  homepage "https://github.com/kevinburke/go-circle"

  url "https://github.com/kevinburke/go-circle/archive/0.25.tar.gz"
  sha256 "2be3c05f01d2967ef9fc5f5bd04148bda98f558c5db997b268046b9030abeb4f"
  head "https://github.com/kevinburke/go-circle"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath

    circle_path = buildpath/"src/github.com/kevinburke/go-circle"
    circle_path.install Dir["*"]
    cd circle_path do
      system "go", "build", "-o", bin/"circle", "./circle"
    end
  end

  test do
    assert_match "circle version 0.25", shell_output("#{bin}/circle version 2>&1", 1)
  end
end
