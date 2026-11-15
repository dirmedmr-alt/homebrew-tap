cask "ai-access-auditor" do
  version "1.0.16"
  sha256 "a8dc138f550d47ee8672d8f16a56f407574b44446cade865e1adc49613b1eee7"

  url "https://github.com/dirmedmr-alt/ai-access-auditor/releases/download/v#{version}/AI-Access-Auditor-#{version}.dmg"
  name "AI Access Auditor"
  desc "Shows what your AI agents can access, asks before they act, and lets you take it back"
  homepage "https://dirmedmr-alt.github.io/ai-access-auditor/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "AI Access Auditor.app"

  uninstall launchctl: "local.ai-access-auditor",
            quit:      "local.ai-access-auditor"

  zap trash: [
    "~/.ai-access-audit",
    "~/Library/Caches/local.ai-access-auditor",
    "~/Library/HTTPStorages/local.ai-access-auditor",
    "~/Library/LaunchAgents/local.ai-access-auditor.plist",
    "~/Library/Preferences/local.ai-access-auditor.plist",
    "~/Library/WebKit/local.ai-access-auditor",
  ]
end
