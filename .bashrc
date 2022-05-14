# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -halF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#=================add by bash-it install=============================

# Path to the bash it configuration
export BASH_IT="/home/mi/.bash_it"

# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_IT_THEME='codeword'  #'standard'  #'primer'  #'powerline-plain'

# (Advanced): Change this to the name of your remote repo if you
# cloned bash-it with a remote other than origin such as `bash-it`.
# export BASH_IT_REMOTE='bash-it'

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@git.domain.com'

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli
export TODO="t"

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=false

# Set Xterm/screen/Tmux title with only a short hostname.
# Uncomment this (or set SHORT_HOSTNAME to something else),
# Will otherwise fall back on $HOSTNAME.
#export SHORT_HOSTNAME=$(hostname -s)

# Set Xterm/screen/Tmux title with only a short username.
# Uncomment this (or set SHORT_USER to something else),
# Will otherwise fall back on $USER.
#export SHORT_USER=${USER:0:8}

# Set Xterm/screen/Tmux title with shortened command and directory.
# Uncomment this to set.
#export SHORT_TERM_LINE=true

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/djl/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

# (Advanced): Uncomment this to make Bash-it reload itself automatically
# after enabling or disabling aliases, plugins, and completions.
# export BASH_IT_AUTOMATIC_RELOAD_AFTER_CONFIG_CHANGE=1

# Uncomment this to make Bash-it create alias reload.
# export BASH_IT_RELOAD_LEGACY=1

# Load Bash It
source "$BASH_IT"/bash_it.sh



#========== add by K ============================================
#PATH=~/bin:$PATH
PATH=$PATH:/home/mi/Downloads/android-studio/bin
PATH=$PATH:/home/mi/bin/platform-tools

#xinput --set-prop "pointer:PixArt HP USB Optical Mouse" "Device Accel Constant Deceleration" 1.5
#xinput --set-prop "pointer:GTech MI wireless mouse" "Device Accel Constant Deceleration" 1.5

#export HISTCONTROL=ignoredups

export USE_CCACHE=1

#====alias=====
alias d='cd ..'
alias d-='cd -'
alias d.='cd ../..'
alias d..='cd ../../..'
alias d...='cd ../../../..'
alias d....='cd ../../../../..'
alias d.....='cd ../../../../../..'
alias d......='cd ../../../../../../..'
alias ktag='ctags -R --c++-kinds=+p --fields=+iaS --extra=+q '

#alias kcs='find `pwd` -name "*.[ch]" -o -name "*.cpp" -o -name "*.java" > cscope.files && cscope -Cbk -i cscope.files'
function kcs()
{
	echo > cscope.files
	for dir in "$@"; do
		fullpath=`realpath $dir`
		echo $fullpath
		find $fullpath -name "*.[ch]" -o -name "*.cpp" -o -name "*.java" >> cscope.files
	done

	cscope -Cbk -i cscope.files
}

function ksi-files()
{
	find `pwd` -name "*.[ch]" -o -name "*.cpp" | sed 's/\/home\/mi/Z:/'
}

function ktmux-fix-dislay()
{
	export DISPLAY="`tmux show-env | sed -n 's/^DISPLAY=//p'`"
}

alias mv='mv -i'
alias cp='cp -i'

alias v='gvim'

function vi_with_name()
{
	cmdl=$1
    serv=$2
    shift
	shift
    test_result=`$cmdl --servername $serv --remote-expr 0 2>/dev/null`
    if [ "$test_result" ]; then
        $cmdl --servername $serv --remote-silent $@
    else
        $cmdl --servername $serv $@
    fi
}

function gvim_with_name()
{
    serv=$1
    shift
    test_result=`gvim --servername $serv --remote-expr 0 2>/dev/null`
    if [ "$test_result" ]; then
        gvim --servername $serv --remote-silent $@
    else
        gvim --servername $serv $@
    fi
}

function setadb()
{
	num=$1
	if [ "$1" == "0" ]; then
		unset ANDROID_SERIAL 
		echo "unset ANDROID_SERIAL"
	else
		serial=$(adb devices | awk "/device$/{i++}i==$num{print \$1; exit}")
		export ANDROID_SERIAL=$serial
		echo set ANDROID_SERIAL to $serial
	fi
}
function getadb()
{
	echo ANDROID_SERIAL is $ANDROID_SERIAL
	backlightLevel=`adb shell settings get system screen_brightness`
	#adb shell settings put system screen_brightness 1000
	#sleep 3
	adb shell settings put system screen_brightness 0
	sleep 3
	adb shell settings put system screen_brightness $backlightLevel
}


alias kag='ag -U --ignore tuning'

alias vs='gvim_with_name s'
alias va='gvim_with_name a'
alias vb='gvim_with_name b'
alias vc='gvim_with_name c'

alias vis='vi_with_name vim s'
alias via='vi_with_name vim a'
alias vib='vi_with_name vim b'
alias vic='vi_with_name vim c'

alias q='exit'
alias r='repo'
alias rs='repo sync -fc -q --no-tags'
alias ru='repo upload --cbr'

alias si='nohup env LANG=zh_CN.UTF-8 wine "c:/Program Files (x86)/Source Insight 3/Insight3.exe" >/dev/null 2>&1 &'
alias npp='nohup env LANG=zh_CN.UTF-8 wine "c:/Program Files/Notepad++/notepad++.exe" >/dev/null 2>&1 &'
alias si4='nohup wine "c:/Program Files (x86)/Source Insight 4.0/sourceinsight4.exe" &'
alias plantuml='nohup java -DPLANTUML_LIMIT_SIZE=12288 -jar ~/bin/plantuml.jar -gui &'

alias mivpn='/opt/cisco/anyconnect/bin/vpn connect v.mioffice.cn'
alias vpnui='/opt/cisco/anyconnect/bin/vpnui'

alias zc='fasd_cd -d `pwd`'

function camlx()
{
	adb shell cat /vendor/etc/camera/camxoverridesettings$1.txt
}
function camsx()
{
	adb shell "echo $2 >> /vendor/etc/camera/camxoverridesettings$1.txt"
	adb shell cat /vendor/etc/camera/camxoverridesettings$1.txt | tail -1
}
function camdx()
{
	adb shell "sed -i '/$2.*/d' /vendor/etc/camera/camxoverridesettings$1.txt"
}
function campullx()
{
	adb pull /vendor/etc/camera/camxoverridesettings$1.txt
}
function campushx()
{
	adb push camxoverridesettings$1.txt /vendor/etc/camera/
}

alias caml='camlx ""'
alias cams='camsx ""'
alias camd='camdx ""'
alias campull='campullx ""'
alias campush='campushx ""'

alias camlp="camlx OfPro"
alias camsp="camsx OfPro"
alias camdp="camdx OfPro"
alias campullp="campullx OfPro"
alias campushp="campushx OfPro"

alias camlu="camlx OfUltra"
alias camsu="camsx OfUltra"
alias camdu="camdx OfUltra"
alias campullu="campullx OfUltra"
alias campushu="campushx OfUltra"


function camlogclear()
{
	adb shell rm /data/vendor/camera/Camx_OfflineLog* > /dev/null 2>&1
	adb shell rm /data/vendor/camera/offlinelog/* > /dev/null 2>&1
}
function camlogpull()
{
	project=$1
	output=$2

	dir=$(mktemp -d camlog.XXXXXXXX)
	echo $dir $project $output

	if [ -d ./$dir ]; then
		adb shell ls /data/vendor/camera/Camx_OfflineLog* | xargs -I {} adb pull {} $dir/ > /dev/null 2>&1
		#adb pull /data/vendor/camera $dir
		python ~/proj/$project/vendor/qcom/proprietary/chi-cdk/tools/binary_log/merge_text_logs.py -o $output -d $dir
		rm -rf ./$dir
	fi
}

function mypull()
{
	adb shell ls $1 | xargs -I {} adb pull {} ./
}

function pull-img()
{
	mypull /sdcard/DCIM/Camera/*$1*
}
function pull-dump()
{
	mypull /data/vendor/camera/$1
}

function myfetch()
{
	if [ "$1" == "-h" ] || [ "$1" == "help" ]; then
		echo "myfetch remote branch [--unshallow ...]"
		return
	fi

	repo=$1
	branch=$2
	shift; shift;

	echo "repo=$repo branch=$branch args=$@"
	echo "git fetch $@ $repo $branch:refs/remotes/$repo/$branch"
	git fetch $@ $repo $branch:refs/remotes/$repo/$branch
}

function winpath()
{
    echo $(pwd)\\$1 | sed 's/\//\\/g' | sed 's/\\home\\mi/z:/'
}

set completion-ignore-case on
export FUSION_PATH=/home/mi/buildtool/fusion/tools
alias adb="while true; do adb start-server; [[ $? -eq 0 ]] && break; done && adb"
alias adbd="adb devices"
alias adbl="adb devices -l"
