# dotfiles

## Install Xcode command line
```
xcode-select --install
```

## Install OhMyZsh
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestion
```
Add `zsh-autosuggestions` in plugins

## Installing Brew
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" && (echo; echo 'eval "$(/usr/local/bin/brew shellenv)"') >> ~/.zshrc
```

## Add SSH key to Github
see: https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
```
ssh-keygen -t ed25519 -C "your_email@example.com"
eval "$(ssh-agent -s)"
touch ~/.ssh/config
```
Add these in the config file
```
Host github.com
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_ed25519
```

```
ssh-add --apple-use-keychain ~/.ssh/id_ed25519
pbcopy < ~/.ssh/id_ed25519.pub
```

Paste the ssh key on Github: https://github.com/settings/keys

## Install Packer

```
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```
## Copy config

```
cp -r .config/nvim ~/.config/nvim
```

## Install Plugins

### Open packer.lua
```
nvim ~/.config/nvim/lua/kakshay/packer.lua
```

### source the file and sync Plugins
```
:so 
:PackerCompile
:PackerSync
```
