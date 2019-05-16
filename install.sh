#!/usr/bin/env bash
mv ~/.vimrc ~/.vimrc.bak
mv ~/.vim ~/.vim.bak

mkdir -p ~/.vim/.backup ~/.vim/.swp ~/.vim/.undo

mkdir -p ~/tmp
cd ~/tmp

git clone https://github.com/maverick9000/vim

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

ln -s $SCRIPTPATH/vimrc ~/.vimrc

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo 'run this inside vim => :PlugInstall'
rm -rf ~/tmp/vim
