               _   __(_)___ ___  / __(_) /__  _____
              | | / / / __ `__ \/ /_/ / / _ \/ ___/
              | |/ / / / / / / / __/ / /  __(__  )
              |___/_/_/ /_/ /_/_/ /_/_/\___/____/

This is the personal ~/.vim dir with a highly optimized vimrc config file.

# Installation

## Backup

    mkdir ~/.vim.bak; mv ~/.vim ~/.vim.bak; mv ~/.vimrc ~/.vim.bak

## Clone the repo

    git clone https://github.com/Ayppo/vimfiles.git ~/.vim

## Symlinking vimrc

    ln -s ~/.vim/vimrc ~/.vimrc

## Install Plugins

    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    vim +PlugInstall +qall

### Enjoy it.
