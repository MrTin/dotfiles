setup: tweaks ruby brew git symlinks zsh presto

tweaks:
	# Gatekeeper (allow installs from anywhere)
	sudo spctl --master-disable

	# OSX Dark theme
	sudo defaults write /Library/Preferences/.GlobalPreferences.plist _HIEnableThemeSwitchHotKey -bool true

	# Disk image verification
	defaults write com.apple.frameworks.diskimages skip-verify -bool YES

	# Quarantine downloaded objects
	defaults write com.apple.LaunchServices LSQuarantine -bool NO

	# Chrome: Disable left and right swiping gestures
	defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool FALSE

	# Chrome: Disable pinch to zoom gesture
	defaults write com.google.Chrome PinchToChangeFontSizeDisabled -bool TRUE

ruby:
	curl -sSL https://get.rvm.io | bash -s stable --ruby
	gem install bundler

brew:
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew tap Homebrew/bundle
	brew bundle

git:
	# Configure commit details
	git config --global user.name "Martin Samami"
	git config --global user.email "martin@digitalkookie.io"

	# Add aliases
	git config --global alias.co checkout
	git config --global alias.br branch
	git config --global alias.ci 'commit -m'
	git config --global alias.st status
	git config --global alias.a add

symlinks:
	ln -s "$(shell pwd)/.bashrc" "${HOME}/.bashrc"

zsh:
	# Use zsh as default
	chsh -s /bin/zsh

presto:
	./install_prezto.sh
