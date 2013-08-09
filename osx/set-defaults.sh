# Sets reasonable OS X defaults.
#
# The original idea (and a couple settings) were grabbed from:
#   https://raw.github.com/holman/dotfiles/master/osx/set-defaults.sh
#
# Run ./set-defaults.sh and you'll be good to go.

# Show hidden files
# defaults write com.apple.Finder AppleShowAllFiles YES

# Hide Safari's bookmark bar.
defaults write com.apple.Safari ShowFavoritesBar -bool false

# Set up Safari for development.
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" -bool true
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true
