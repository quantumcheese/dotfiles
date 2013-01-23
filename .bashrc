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
PS1_BASE="[\[${BOLD}${BLUE}\]\T\[${NO_COLOR}\] : \[${BOLD}${YELLOW}\]\u\[${NO_COLOR}\]@\[${BOLD}${RED}\]\W\[${NO_COLOR}\]]"
GIT_PROMPT="${HOME}/bin/git/git-prompt.sh"
if [ -x "${GIT_PROMPT}" ]; then
    . "${GIT_PROMPT}"
    PS1_BASE="${PS1_BASE}\[${BOLD}${CYAN}\]\$(__git_ps1 )\[${NO_COLOR}\]"
fi
export PS1="${PS1_BASE}\$ "
export PS2="\e[1;35m$PS2\e[0m"

alias screendr='screen -D -R'
alias screenr='screen -r'

bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'
