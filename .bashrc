[[ -n $TERM ]] && {
    RED=$(      tput setaf 1 || tput AF 1  )
    GREEN=$(    tput setaf 2 || tput AF 2  )
    YELLOW=$(   tput setaf 3 || tput AF 3  )
    BLUE=$(     tput setaf 4 || tput AF 4  )
    MAGENTA=$(  tput setaf 5 || tput AF 5  )
    CYAN=$(     tput setaf 6 || tput AF 6  )
    BOLD=$(     tput bold    || tput md    )
    NO_COLOR=$( tput sgr0    || tput me    )
}
PS1_BASE="[\[${BOLD}${MAGENTA}\]\T\[${NO_COLOR}\] : \[${BOLD}${YELLOW}\]\u\[${NO_COLOR}\]@\[${BOLD}${RED}\]\W\[${NO_COLOR}\]]"
GIT_PROMPT="${HOME}/bin/git/git-prompt.sh"
if [ -x "${GIT_PROMPT}" ]; then
    . "${GIT_PROMPT}"
    PS1_BASE="${PS1_BASE}\[${BOLD}${CYAN}\]\$(__git_ps1 )\[${NO_COLOR}\]"
fi
export PS1="${PS1_BASE}\n\
\[${BOLD}${BLUE}\] └─ \$\[${NO_COLOR}\] "
export PS2="${GREEN}${PS2}${NO_COLOR}"
export PS4="[\[${MAGENTA}\]\T\[${NO_COLOR}\]]${PS4}"

export HISTCONTROL=ignoreboth

export PATH="${HOME}/bin:${PATH}"

GIT_COMPLETE="${HOME}/bin/git/git-completion.bash"
if [ -f "${GIT_COMPLETE}" ]; then
    . "${GIT_COMPLETE}"
fi

alias screendr='screen -D -R'
alias screenr='screen -r'
alias gits='git s'

alias cdd='cd ${OLDPWD}'

bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'
