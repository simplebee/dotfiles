# **********************************************************
# tilix fix
# **********************************************************

# https://github.com/gnunn1/tilix/wiki/VTE-Configuration-Issue
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
  source /etc/profile.d/vte.sh
fi

# **********************************************************
# slow paste fix
# **********************************************************

# https://github.com/zsh-users/zsh-autosuggestions/issues/238#issuecomment-389324292
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish

# **********************************************************
# powerlevel9k
# **********************************************************

POWERLEVEL9K_INSTALLATION_PATH=$ANTIGEN_BUNDLES/bhilburn/powerlevel9k # place before antigen theme

DEFAULT_USER=$USER
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="> "
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs time)

# **********************************************************
# antigen
# **********************************************************

source $HOME/.antigen/antigen.zsh

# loads oh-my-zsh/lib
# oh-my-zsh config options see "oh-my-zsh/templates/zshrc.zsh-template"
antigen use oh-my-zsh

# bundles from oh-my-zsh/plugins
antigen bundle autojump

# bundles from github
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting # load last bundle

# load theme
antigen theme bhilburn/powerlevel9k powerlevel9k

# done with antigen
antigen apply

# **********************************************************
# nvm
# **********************************************************

# https://github.com/creationix/nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# **********************************************************
# alias
# **********************************************************

# folder
alias p="cd ~/projects/personal"

# general
alias uu="sudo apt update && sudo apt upgrade"

# git
alias gst="git status"
alias gss="git status -s"
alias glg="git log"
alias gl='git log --pretty=format:"%C(auto)%h %C(blue)%ad%x09%C(green)%an%x09%C(reset)%s%C(auto)%d" --graph --date=short'
alias ga="git add"
alias gaa="git add --all"
alias gc="git cz" # use commitizen
# alias gc="git commit"
# alias gcm="git commit -m"
# alias gcam="git commit -a -m"
alias gco="git checkout"
alias gcob="git checkout -b"
alias gcom="git checkout master"
alias gba="git branch -a"
alias gbd="git branch -d"

# npm
alias ns="npm start"
alias nr="npm run"
