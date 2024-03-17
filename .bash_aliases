# Bash aliases contains all aliases that will be
# created during a process or session.
#
# Author: Daniel Kurniadi

# ----------------------------------
# EXA
# ----------------------------------
alias l='exa -a --icons'
alias la='exa -a'
alias ll='exa -lah'
alias ls='exa -a --color=auto --icons'

# ----------------------------------
# TMUX
# ----------------------------------
export TERM=xterm-256color
export LC_ALL="en_US.UTF-8"

# ----------------------------------
# GO
# ----------------------------------
GOPATH=$HOME/go

export PATH="$PATH:$GOPATH/bin"
export GOPATH="$GOPATH:$HOME/go"

