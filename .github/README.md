## Theo's Dotfiles

This repo stores my dotfiles for bash, vim, etc.  

I followed [these instructions](https://www.atlassian.com/git/tutorials/dotfiles) to set this up to track the files in $HOME directly without symlinking or copying. Also see [here](https://news.ycombinator.com/item?id=11071754) and [here](https://github.com/Siilwyn/my-dotfiles/tree/master/.my-dotfiles).  

Steps followed:  

```sh
cd $HOME
git init --bare .dotfilesgit
alias dotfilesgit='/usr/bin/git --git-dir=$HOME/.dotfilesgit/ --work-tree=$HOME'
#don't show everything in HOME as untracked when we do dotfilesgit status
dotfilesgit config --local status.showUntrackedFiles no
#for each file
dotfilesgit add .bashrc
#then
dotfilesgit commit
dotfilesgit remote add origin <my-github-repo-url>
dotfilesgit push
```

To replicate this on a new machine:  

```sh
git clone --separate-git-dir=$HOME/.dotfilesgit https://github.com/theopauw/dotfiles .dotfilesgittmp
rsync --recursive --verbose --exclude '.git' .dotfilesgittmp/ $HOME/
rm --recursive .dotfilesgittmp/
```

Vim: I am deliberately not including the installation script for vim-plug. To use plugins, [download plug.vim](https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim) and put it in the "autoload" directory. Shortcut:   

```sh
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
