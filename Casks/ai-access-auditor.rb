cask "ai-access-auditor" do
  version "1.0.8"
  sha256 "204732b9cc91439504b4d53d7e64cf4fce4b5da7f6e105d645fc9fef88622cd8"

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
