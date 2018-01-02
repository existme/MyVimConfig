#compdef takenote 

# dir=$( find -L "$HOME/notes/" -print 2> /dev/null | fzf-tmux +m ) 
#zle reset-prompt 
#compadd $dir
# comparguments (arg|ARG)/:arg:
# zstyle ":completion:*:descriptions" format "%B%d%b"
# _arguments "1: :(World)"\
#     "2:Countries:(France Germany Italy)"\
#     "*:Cities:((Paris\:France Berlin:\Germany Rome:\Italy))"
# TRAPWINCH() {
#    zle && { zle reset-prompt; zle -R }
# }
# echo $dir
# vared fzf-file-widget

# _takenote()
# {
#       local cur dir
#       COMPREPLY=()
#       cur="${COMP_WORDS[COMP_CWORD]}"
#       dir=$( find -L "$HOME/notes/" -print 2> /dev/null | fzf-tmux +m ) 
#       local opts="$dir"
#       COMPREPLY=( $(compgen -f  -- ${cur}) )
#       # zle-line-finish
#  
#       return 0
# }
#
# complete -F _takenote takenote
zstyle ':completion:*' verbose yes
local curcontext="$curcontext" line state ret=1
local all=$(find -L "$HOME/notes/" -print 2> /dev/null)
local dir=$( find -L "$HOME/notes/" -print 2> /dev/null | fzf-tmux +m ) 
SUFFIX=$dir
# emulate -L zsh
# _message Reza     #works!
comp=$dir
# local id=10
# _description $dir id 'action'
# _describe -t values value dir
eval "$_comp_setup"
zle -R "takenote "
# echo -n -e "${bR}Editing${bW}... $BUFFER$cZ "
REPLY=$dir
nmatches=1
compstate[insert]=3
compstate[match]=$dir
# echo $compstate
_lastcomp=( $dir 0 $dir 1 ) 
# RBUFFER=$dir
# compadd $dir 
words[2]=$dir
# compadd  $dir
compadd -U -i "$IPREFIX" -I "$ISUFFIX" -f -Q - $dir
return 1
