This repository contains my dotvim configuration files and plugins install as
git submodules and using the [pathogen](https://github.com/tpope/vim-pathogen) extension

## how to add other plugins using submodule
```git
cd ~/.vim
mkdir -p ~/.vim/bundle
git submodule add http://github.com/tpope/vim-fugitive.git bundle/fugitive
git add .
git commit -m "Install Fugitive.vim bundle as a submodule."
```

## how to install on other machine
```git
cd ~
git clone https://git.framasoft.org/7ahiry/dotvim.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/gvimrc ~/.gvimrc
cd ~/.vim
git submodule init
git submodule update
```

## upgrading a bundle
```git
cd ~/.vim/bundle/fugitive
git pull origin master
```

## upgrading all bundles
```git
git submodule foreach git pull origin master
```