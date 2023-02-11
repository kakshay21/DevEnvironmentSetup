# dotfiles

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
