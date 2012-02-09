# ---------------------------------------------------------------------------
# Options                                                                   -
# ---------------------------------------------------------------------------
setopt auto_cd # instead of cd dirname, dirname will do just fine
setopt rm_star_wait # 10 second wait to delete everything!
setopt share_history # Share history between shells
setopt autolist

# Enable ls colors
if [ "$DISABLE_LS_COLORS" != "true" ]
then
  # Find the option for using colors in ls, depending on the version: Linux or BSD
  ls --color -d . &>/dev/null 2>&1 && alias ls='ls --color=tty' || alias ls='ls -G'
fi

# Setup the prompt with pretty colors
setopt prompt_subst

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# ---------------------------------------------------------------------------
# Exports                                                                   -
# ---------------------------------------------------------------------------
export EDITOR=vim
export SVN_EDITOR=vim  
export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/us/X11/bin:/usr/local/git/bin:$HOME/.rbenv/bin:$PATH:$HOME/.scripts
export NODE_PATH="/usr/local/lib/node"
source $HOME/.private-zshrc
source $HOME/.dotfiles/.zsh-theme
# ---------------------------------------------------------------------------
# Aliases                                                                   -
# ---------------------------------------------------------------------------
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# List direcory contents
alias lsa='ls -lah'
alias l='ls -la'
alias ll='ls -l'
alias sl=ls # often screw this up
alias mv='nocorrect mv'       # no spelling correction on mv
alias cp='nocorrect cp'       # no spelling correction on cp
alias mkdir='nocorrect mkdir' # no spelling correction on mkdir
alias yuicompress="echo \"Changing to YUICompressor directory\"; cd ~/Tools/YUICompressor/build; echo \"Usage: java -jar yuicompressor-x.y.z.jar [input file] -o [output file]\""
alias o="open ."
alias reload=". ~/.zshrc"
alias eap="sudo vim /private/etc/apache2/httpd.conf"
alias apacherestart="sudo /usr/sbin/apachectl restart"
alias ip="ipconfig getifaddr en0"
alias shipit="svn info | ack URL | cut -f2 -d' ' | pbcopy; cd ~/Shippable;"

# RUBY ///////////
alias be="bundle exec"

# SVN ////////////
alias sl="svn log | sed -n '/lance.becker/,/----$/ p' "
alias lc="svn log -l 1"

# GIT ////////////
alias g='git'    
alias gs='git status'
alias gl='git log'
alias ga='git add .'
alias gc='git commit'
alias gca='git commit -a'
alias gco='git checkout'
alias gm='git merge'
alias gb='git branch'
alias gbn='git checkout -b'
alias gd='clear && git diff'
alias gdm='git diff | mate'       
alias gll='git log --graph --pretty="format:%C(yellow)%h%Cblue%d%Creset %s %C(white) %an, %ar%Creset"'
# 

# ---------------------------------------------------------------------------
# RBENV 
# ---------------------------------------------------------------------------
eval "$(rbenv init -)"

