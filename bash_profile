alias go_home="cd ~"
alias go_etl="go_home; cd repos/etl/"
alias reload_profile=". ~/.bash_profile"
alias go_sleep="pmset sleepnow"
alias go_mssql="go_home; cd repos/mssql/"
alias go_aops="go_home; cd repos/Analytics-Ops/"
alias ls="exa -la"
alias go_postgresql="go_home; cd repos/postgresql/"
alias go_petl="go_home; cd repos/pentaho_etl/"
alias go_control="go_home; cd repos/control"
alias cl="clear"
·
ssh-add -L &> /dev/null
if [ $? -eq 1 ]; then
  ssh-add
fi

if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
    source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi
·
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi
·
·
# Git branch in prompt.
·
parse_git_branch() {
·
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
·
}

·
#export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch \W\[\033[1;36])\[\033[32m\] $ "
# Git branch in prompt.
export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "
·
if ! ssh-add -L >/dev/null; then
  ssh-add -K
fi

#vhawkins ~ instead of computer name
export PS1="\\u \\W\$(parse_git_branch) $ "


eval "$(rbenv init -)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

export CLICOLOR=1
export TERM=xterm-256color
