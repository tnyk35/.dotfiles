#!/bin/bash

# submoduleを更新
cd $HOME/dotfiles
git submodule init
git submodule update

# シンボリックリンクの設定
DOT_FILES=(.vimrc .oh-my-zsh .tmux.conf .zshrc oh-my-zsh)

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done
