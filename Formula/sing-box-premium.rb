class SingBoxPremium < Formula
  desc "Universal proxy platform (sing-box) with premium features"
  homepage "https://github.com/sb-community/sing-box-premium"
  version "202504201540"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/sb-community/sing-box-premium/releases/download/202504201540/sing-box-release-darwin-arm64.tar.gz"
    sha256 "5483acf5ccfbb9bc0e86dac8a4d94efc004d77777c0f19a5341df6ebe6cfe90e"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/sb-community/sing-box-premium/releases/download/202504201540/sing-box-release-darwin-amd64.tar.gz"
    sha256 "3572ef2a7174fdd7043f1813dac880607bea285709ecdc67487f7757fe770baf"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/sb-community/sing-box-premium/releases/download/202504201540/sing-box-release-linux-amd64.tar.gz"
    sha256 "f1e5500d9789e2c3f9244b17b9d52acca578f9b63bca971a84f86402a83e0e83"
  elsif OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/sb-community/sing-box-premium/releases/download/202504201540/sing-box-release-linux-armv8.tar.gz"
    sha256 "a9194326d0f568ddd1b6471a124469910478959364695b96b7741eb058e413c4"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/sb-community/sing-box-premium/releases/download/202504201540/sing-box-release-linux-armv7.tar.gz"
    sha256 "0ef59d7c762af309398f7a4e99dffb2df3a7f15633466a7d5c5b9169a798eea2"
  end

  def install
    bin.install "sing-box-premium" => "sing-box"
  end

  service do
    run [opt_bin/"sing-box", "run", "--config", etc/"sing-box/config.json"]
    run_type :immediate
    keep_alive true
    require_root true
    working_dir var
    log_path var/"log/sing-box.log"
    error_log_path var/"log/sing-box.log"
  end

  test do
    assert_match "sing-box", shell_output("#{bin}/sing-box --help")
  end
end
