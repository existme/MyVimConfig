# Setup fzf
# ---------
export FZF_COMPLETION_TRIGGER='~~'
if [[ ! "$PATH" == *$SCRIPTPATH/zsh/completion/plugins/fzf/bin* ]]; then
  export PATH="$PATH:$SCRIPTPATH/zsh/completion/plugins/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$SCRIPTPATH/zsh/completion/plugins/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "$SCRIPTPATH/zsh/completion/plugins/fzf/shell/key-bindings.zsh"

local color00='#282828'
local color01='#3c3836'
local color02='#504945'
local color03='#665c54'
local color04='#bdae93'
local color05='#d5c4a1'
local color06='#ebdbb2'
local color07='#fbf1c7'
local color08='#fb4934'
local color09='#fe8019'
local color0A='#fabd2f'
local color0B='#b8bb26'
local color0C='#8ec07c'
local color0D='#83a598'
local color0E='#d3869b'
local color0F='#d65d0e'
export FZF_DEFAULT_COMMAND="fd --hidden --exclude .git"
export FZF_DEFAULT_OPTS="
  --height 40% --border
  --color=bg+:$color01,bg:$color00,spinner:$color0C,hl:$color0D
  --color=fg:$color07,header:$color0D,info:$color0A,pointer:$color0C
  --color=marker:$color0C,fg+:$color06,prompt:$color0A,hl+:$color08
  --preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'
  --bind 'f2:execute(vim -)+abort'
"
# see man page: https://www.mankier.com/1/fzf#Key_Bindings
#fzf --bind 'f2:execute(less -f {}),ctrl-y:execute-silent(echo {} | pbcopy)+abort'
# FZF configuration                                                              
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
#export FZF_CTRL_T_OPTS="--select-1 --exit-0"                                    
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'" 
