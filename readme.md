This repository contains my dotvim configuration files and plugins install as
git submodules and using the [pathogen](https://github.com/tpope/vim-pathogen) extension

This information comes from a [vimcast](http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/)

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

## how to update on other machine (provided that we have already cloned this repository)

```git
git pull origin master
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