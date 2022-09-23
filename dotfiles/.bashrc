# $HOME/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -al'

EDITOR="vim"
VISUAL="vim"


# prompt colors
c1="\[\033[38;5;240m\]"
c2="\[\033[38;5;245m\]"
c3="\[\033[38;5;0m\]"
r="\[\033[0m\]"

# prompt formatting
PS1="\n${c3}┌────[${c2}\u${c3}@${c2}\h${c3}]─[${c2}\w${c3}]\n${c3}└─\$ ${r}"

# default prompt
#PS1='[\u@\h \W]\$ '


cd $HOME
