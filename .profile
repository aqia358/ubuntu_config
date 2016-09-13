# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
	# include .bashrc if it exists
	if [ -f "$HOME/.bashrc" ]; then
		. "$HOME/.bashrc"
	fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
	PATH="$HOME/bin:$PATH"
fi

# liuhl setting

export PS1="\[\e[31;1m\]\u @ \[\e[34;1m\]\h \[\e[36;1m\]\w \[\e[33;1m\]\t $ \[\e[37;1m\]\n"
alias grep='grep --color'
# alias ssh='TERM=screen ssh'
alias ss='ssh liuhongliang@nb089x.corp.youdao.com'
alias cc='cd /home/disk/codespace'
alias java6='java6(){ export JAVA_HOME=/usr/java/jdk; export PATH=$JAVA_HOME/bin:$PATH; export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar;};java6;'
alias java7='java7(){ export JAVA_HOME=/global/share/jdk1.7.0_71/; export PATH=$JAVA_HOME/bin:$PATH; export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar;};java7;'
alias java8='java8(){ export JAVA_HOME=/global/share/jdk1.8.0_40/; export PATH=$JAVA_HOME/bin:$PATH; export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar;};java8;'

# alias tmux="tmux -2"
# android sdk
# export ANDROID_HOME=/home/android-sdk-linux
# export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

#!/bin/sh
# This script creates monthly backups of the bash history file. Make sure you have
# HISTSIZE set to large number (more than number of commands you can type in every
# month). It keeps last 200 commands when it "rotates" history file every month.
# Typical usage in a bash profile:
#
# HISTSIZE=90000
# source ~/bin/history-backup
#
# And to search whole history use:
# grep xyz -h --color ~/.bash_history.*
#

KEEP=200
BASH_HIST=~/.bash_history
BACKUP=$BASH_HIST.$(date +%y%m)

if [ -s "$BASH_HIST" -a "$BASH_HIST" -nt "$BACKUP" ]; then
	# history file is newer then backup
	if [[ -f $BACKUP ]]; then
		# there is already a backup
		cp -f $BASH_HIST $BACKUP
	else
		# create new backup, leave last few commands and reinitialize
		mv -f $BASH_HIST $BACKUP
		tail -n$KEEP $BACKUP > $BASH_HIST
		history -r
	fi
fi

