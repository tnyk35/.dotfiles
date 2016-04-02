#!/bin/bash

DOT_FILES=(.vimrc .oh-my-zsh .tmux.conf .zshrc)

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done
