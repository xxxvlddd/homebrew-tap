cask "greenfox" do
  version "0.7.5"
  sha256 "20136514366afd74846d1f73ef64a8d1c1bf0479471ad1b38d03a764a02d93f8"

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
