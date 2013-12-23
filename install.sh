#!/bin/bash
function create_install_dir() {
  echo "Cloning into .vbox_start_headless"
  hash git > /dev/null && /usr/bin/env git clone https://github.com/fnitschmann/VBoxStartHeadless.git ~/.vbox_start_headless || {
    echo "git is not installed on your system!"
    exit
  }
}

function back_up_bash_profile() {
  cp ~/.bash_profile ~/.bash_profile.back-up
}

function  back_up_zshrc() {
  cp ~/.zshrc ~/.zshrc.back-up
}

if [[ -d ~/.vbox_start_headless ]]; then
  rm -rf ~/.vbox_start_headless
fi

create_install_dir

if [[ ! -d ~/bin ]]; then
  echo "Creating ~/bin"
  mkdir ~/bin
  chmod 740 ~/bin
fi

if [[ ! -f ~/bin/vbox_start_headless ]]; then
  echo "Creating ~/bin/vbox_start_headless"
  cp ~/.vbox_start_headless/vbox_start_headless ~/bin
  chmod 740 ~/bin/vbox_start_headless
fi

# This is just a back-up function, it should never be the case that .bash_profile is not available
if [[ ! -f ~/.bash_profile ]]; then
  echo "Creating ~/.bash_profile"
  touch ~/.bash_profile
  chmod 644 ~/.bash_profile
fi

alias_cmd="alias VBoxStartHeadless=\"~/bin/vbox_start_headless\""

# bash
if ! grep -q "$alias_cmd" ~/.bash_profile; then
  echo "Updating .bash_profile"
  back_up_bash_profile
  echo "$alias_cmd" >> ~/.bash_profile
  source ~/.bash_profile
fi

# zsh
if [[ -f ~/.zshrc ]] && ! grep -q "$alias_cmd" ~/.zshrc; then
  echo "Updating .zshrc"
  back_up_zshrc
  echo "$alias_cmd" >> ~/.zshrc
  source ~/.zshrc
fi

rm -rf ~/.vbox_start_headless

exit
