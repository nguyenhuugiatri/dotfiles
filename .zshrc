# ============================== ENVIRONMENT ===============================
export ZSH="$HOME/.oh-my-zsh"
export PATH="/opt/homebrew/bin:$PATH"

# Editor
export VISUAL=vim
export EDITOR=$VISUAL

# PNPM
export PNPM_HOME="$HOME/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"

# Bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Go
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"

# Ruby
export LC_ALL=en_US.UTF-8
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

# # Java
export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home

# # Android SDK
export ANDROID_HOME="$HOME/Library/Android/sdk"

# # Android tools vào PATH
export PATH="$PATH:$ANDROID_HOME/emulator"
export PATH="$PATH:$ANDROID_HOME/platform-tools"

# History
HISTFILE="$HOME/.cache/zsh_history"
HISTSIZE=5000
SAVEHIST=5000
HIST_STAMPS=mm/dd/yyyy
LESSHISTFILE=-

# Color scheme (dark/light)
COLOR_SCHEME=dark

# ============================== TOOLCHAINS ================================
# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"

# Bun completions
[ -s "$BUN_INSTALL/_bun" ] && source "$BUN_INSTALL/_bun"

# Rbenv
eval "$(rbenv init -)"

# ============================== OH-MY-ZSH ================================
source $ZSH/oh-my-zsh.sh
plugins=(git)

# ============================== ZSH SETTINGS ==============================
unsetopt NO_BEEP NO_MATCH
setopt AUTO_CD BEEP NOMATCH NOTIFY INC_APPEND_HISTORY SHARE_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST HIST_IGNORE_DUPS HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS HIST_SAVE_NO_DUPS HIST_REDUCE_BLANKS HIST_VERIFY
setopt HIST_BEEP INTERACTIVE_COMMENTS MAGIC_EQUAL_SUBST NULL_GLOB

DISABLE_UPDATE_PROMPT=true
ZLE_RPROMPT_INDENT=0

# Keybindings
bindkey '^[[2~' overwrite-mode
bindkey '^[[3~' delete-char
bindkey '^[[H' beginning-of-line
bindkey '^[[1~' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^[[4~' end-of-line
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word
bindkey '^[[3;5~' kill-word
bindkey '^[[5~' beginning-of-buffer-or-history
bindkey '^[[6~' end-of-buffer-or-history

# ============================== ALIASES ===================================
# vi
# command -v vim >/dev/null && alias vi='nvim' && alias vim='nvim'

# ls & tree
command -v lsd >/dev/null && alias ls='lsd --group-dirs first' && alias tree='lsd --tree'

# top
command -v ytop >/dev/null && alias top='ytop --per-cpu'

# bat
if command -v bat >/dev/null; then
  alias bat='bat --theme=ansi-$([ "$COLOR_SCHEME" = "light" ] && echo "light" || echo "dark")'
  alias cat='bat --pager=never'
  alias less='bat'
fi

# ============================== UI / UX ===================================
# iTerm2 tab title
function title_text { echo -ne "\033]0;$*\007"; }
title_text "Lem's iTerm2"

# man page colors
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

# Powerlevel10k
source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme
POWERLEVEL9K_MODE=nerdfont-complete
s=' ' # fix too wide icons
POWERLEVEL9K_MODE=nerdfont-complete
POWERLEVEL9K_SHORTEN_STRATEGY=truncate_beginning
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_OS_ICON_CONTENT_EXPANSION='${P9K_CONTENT} $(whoami | grep -v "^root\$")'
POWERLEVEL9K_OS_ICON_BACKGROUND=red
POWERLEVEL9K_OS_ICON_FOREGROUND=white
POWERLEVEL9K_ROOT_INDICATOR_BACKGROUND=black
POWERLEVEL9K_ROOT_INDICATOR_FOREGROUND=red
POWERLEVEL9K_SSH_BACKGROUND=white
POWERLEVEL9K_SSH_FOREGROUND=blue
POWERLEVEL9K_FOLDER_ICON=
POWERLEVEL9K_DIR_BACKGROUND=blue
POWERLEVEL9K_DIR_FOREGROUND=black
POWERLEVEL9K_DIR_WRITABLE_BACKGROUND=black
POWERLEVEL9K_DIR_WRITABLE_FOREGROUND=red
POWERLEVEL9K_VCS_CLEAN_FOREGROUND=black
POWERLEVEL9K_VCS_CLEAN_BACKGROUND=green
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND=black
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND=yellow
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND=white
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND=black
POWERLEVEL9K_VCS_UNTRACKED_ICON=●
POWERLEVEL9K_VCS_UNSTAGED_ICON=±
POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON=↓
POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON=↑
POWERLEVEL9K_VCS_COMMIT_ICON=$s
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_STATUS_OK_IN_NON_VERBOSE=true
POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=0
POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND=black
POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND=blue
POWERLEVEL9K_COMMAND_BACKGROUND_JOBS_BACKGROUND=black
POWERLEVEL9K_COMMAND_BACKGROUND_JOBS_FOREGROUND=cyan
POWERLEVEL9K_TIME_ICON=
POWERLEVEL9K_TIME_FORMAT='%D{%I:%M}'
POWERLEVEL9K_TIME_BACKGROUND=black
POWERLEVEL9K_TIME_FOREGROUND=white
POWERLEVEL9K_RAM_ICON=
POWERLEVEL9K_RAM_FOREGROUND=black
POWERLEVEL9K_RAM_BACKGROUND=yellow
POWERLEVEL9K_VI_MODE_FOREGROUND=black
POWERLEVEL9K_VI_COMMAND_MODE_STRING=NORMAL
POWERLEVEL9K_VI_MODE_NORMAL_BACKGROUND=green
POWERLEVEL9K_VI_VISUAL_MODE_STRING=VISUAL
POWERLEVEL9K_VI_MODE_VISUAL_BACKGROUND=blue
POWERLEVEL9K_VI_OVERWRITE_MODE_STRING=OVERTYPE
POWERLEVEL9K_VI_MODE_OVERWRITE_BACKGROUND=red
POWERLEVEL9K_VI_INSERT_MODE_STRING=
POWERLEVEL9K_LEFT_PROMPT_FIRST_SEGMENT_START_SYMBOL='\uE0B2'
#POWERLEVEL9K_RIGHT_PROMPT_LAST_SEGMENT_END_SYMBOL='\uE0B0'
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX='%F{blue}╭─'
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX='%F{blue}╰─ '
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon root_indicator ssh dir dir_writable vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vi_mode status command_execution_time background_jobs time ram)
ZLE_RPROMPT_INDENT=0

# ============================== EXTRA PLUGINS =============================
# z
[ -f $(brew --prefix)/etc/profile.d/z.sh ] && source $(brew --prefix)/etc/profile.d/z.sh

# colorls
source /opt/homebrew/lib/ruby/gems/3.4.0/gems/colorls-1.5.0/lib/tab_complete.sh

# https://github.com/zsh-users/zsh-syntax-highlighting?tab=readme-ov-file#why-must-zsh-syntax-highlightingzsh-be-sourced-at-the-end-of-the-zshrc-file
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#ccc'

# bun completions
[ -s "/Users/tri.huugia.nguyen/.bun/_bun" ] && source "/Users/tri.huugia.nguyen/.bun/_bun"
