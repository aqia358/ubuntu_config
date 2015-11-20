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
alias tt="echo test"
alias java7="export JAVA_HOME=/usr/java/jdk"
alias java6="export JAVA_HOME=/usr/java/jdk1.6"

# maven
MAVEN_HOME=/usr/local/apache-maven-3.3.3
export MAVEN_HOME
export PATH=${PATH}:${MAVEN_HOME}/bin:/home/disk/liuhl/mongodb/bin;

# alias tmux="tmux -2"
# android sdk
# export ANDROID_HOME=/home/android-sdk-linux
# export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

# storm
STORM_HOME=/home/disk/apache-storm-0.9.5
export STORM_HOME
export PATH=${PATH}:${STORM_HOME}:${STORM_HOME}/bin

