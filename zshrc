####################################
#           oh-my-zsh              #
####################################
# source ~/.oh-my-zsh/templates/zshrc.zsh-template

# my modified zshrc
#
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins+=(git git-extras node npm pip python sudo safe-paste)

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

####################################
#       end oh-my-zsh              #
####################################

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=3000
SAVEHIST=3000
bindkey -v
bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit promptinit colors
compinit
promptinit
colors
# source ~/.zsh/git-prompt/zshrc.sh
# End of lines added by compinstall
#
#PS1="${GREEN}%n@${ORANGE}%T %D ${BLUE}~ %# ${NORM}"
#PROMPT='%B%{$fg[green]%}%n@%m%{$reset_color%} %B%{$fg[blue]%}%1~$(git_super_status)>%{$reset_color%}'
RPROMPT="%B%{$fg[blue]%}%~%{$reset_color%} %{$fg[green]%}[%?]%{$reset_color%}%{$fg[blue]%}%T%{$reset_color%}"
source ~/config/alias
source ~/.profile

EDITOR=vim

fpath=(~/.zsh $fpath)

##################################################################
# Stuff to make my life easier

# allow approximate
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

# tab completion for PID :D
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always

# cd not select parent dir
zstyle ':completion:*:cd:*' ignore-parents parent pwd

# W. G. Scott ~/.zshrc
 
###########################################
#    X11 and $DISPLAY control             #
###########################################	

# Do this ONLY for OS X earlier than 10.5.  
	
# Now set the DISPLAY variable, if needed.  If X11.app is running,
# we deduce and construct the DISPLAY value from the process. If
# this doesn't work (no X11.app running), we give up and dumbly set the
# value to :0.0.  
		
if [[ -z $DISPLAY  && $(sw_vers -productVersion) < 10.5    && -z $SSH_CONNECTION && -o interactive ]]; then

    disp_no=($( ps -wwx | grep -F X11.app | awk '{print $NF}' | grep -e ":[0-9]"  ))

    if [[ -n $disp_no ]];then
        export DISPLAY=${disp_no}.0
		# Colorful output tells us that the smart method has worked
		print "\e[1mDISPLAY\e[0m \e[36mhas been set to\e[0m \e[1m$DISPLAY \e[0m"
    else
		# FAILSAFE: dumb setting of DISPLAY gives a monochromatic message
        export DISPLAY=:0.0
		print "DISPLAY has been set to $DISPLAY" 
    fi

fi

#### nvm
[ -s ~/.nvm/nvm.sh ] && source ~/.nvm/nvm.sh

#### nvm
[ -s "/home/gl/.nvm/nvm.sh" ] && . "/home/gl/.nvm/nvm.sh" # This loads nvm
[[ -s "/Users/gl/.gvm/scripts/gvm" ]] && source "/Users/gl/.gvm/scripts/gvm" && gvm use 1
export GOPATH=~/gowork:$GOPATH
