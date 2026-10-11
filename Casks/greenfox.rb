cask "greenfox" do
  version "0.7.4"
  sha256 "919a5aec1cf5fee4f9c91b7ccf8b4b71fbbba52c5ad8f89887513608c555bb61"

  url "https://github.com/xxxvlddd/greenfox/releases/download/v#{version}/GREENFOX-arm64.dmg"
  name "GREENFOX"
  desc "Home bookkeeping with daily spending limit and forecasts"
  homepage "https://github.com/xxxvlddd/greenfox"

  livecheck do
    url :url
    strategy :github_latest
  end

  # GREENFOX updates itself (signed releases, checked once a day).
  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :monterey

  app "GREENFOX.app"

  # The app is ad-hoc signed (no paid Apple Developer ID), so Gatekeeper would
  # block the first launch of a quarantined copy. Homebrew quarantines
  # downloads; remove the flag so the app opens normally.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/GREENFOX.app"], must_succeed: false
  end

  zap trash: [
    "~/Library/Application Support/GREENFOX",
    "~/Library/Application Support/GREENFOX — песочница",
    "~/Library/Preferences/ru.local.finances.plist",
    "~/Library/Saved Application State/ru.local.finances.savedState",
  ]
end
