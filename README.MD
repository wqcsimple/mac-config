1. 让终端和Finder显示目录路径
defaults write com.apple.finder _FXShowPosixPathInTitle -bool YES
killall Finder

2. mac关闭自动生成DS_store
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool TRUE
