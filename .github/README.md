## Theo's Dotfiles

This repo stores my dotfiles for bash, vim, etc.

I followed [these instructions](https://www.atlassian.com/git/tutorials/dotfiles) to set this up to track the files in $HOME directly without symlinking or copying. Some steps are necessary to use this on a new machine, see the article.

Vim: I am deliberately not including the installation script for vim-plug. To use plugins, [download plug.vim](https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim) and put it in the "autoload" directory. Shortcut: 

```sh
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
