# 環境変数
export LANG=ja_JP.UTF-8

# 直前のコマンドの重複を削除
# setopt hist_ignore_dups
# 同じコマンドをヒストリに残さない
# setopt hist_ignore_all_dups
# 同時に起動したzshの間でヒストリを共有
setopt share_history
# 開始と終了を記録
setopt EXTENDED_HISTORY
# historyを共有
setopt share_history

# 補完機能を有効にする
autoload -Uz compinit
compinit -u
if [ -e /usr/local/share/zsh-completions ]; then
  fpath=(/usr/local/share/zsh-completions $fpath)
fi

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# 補完候補を詰めて表示
setopt list_packed
# 補完候補一覧をカラー表示
zstyle ':completion:*' list-colors ''

# 前方予測
# autoload predict-on
# predict-on
# zstyle ':predict' verbose true

# for git
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{magenta}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{yellow}+"
zstyle ':vcs_info:*' formats "%F{cyan}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd() { vcs_info }
# 1行プロンプト
# PROMPT='%c $ '
# 複数行プロンプト
PROMPT='
 %F{blue}[%~] -- %*%f
$ '
RPROMPT='${vcs_info_msg_0_}'

# listにカラーを
export LSCOLORS=exfxcxdxbxegedabagaca

# alias
alias ls='ls -aF'
alias ll='ls -l'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias vi='vim'
alias cat='cat -n'
alias tree="pwd;find ./ | sort | sed '1d;s/^\.//;s/\/\([^/]*\)$/|--\1/;s/\/[^/|]*/| /g'"
alias pbcopy='xsel --clipboard --input'

# コマンドのスペルを訂正
setopt correct
# ビープ音を鳴らさない
setopt no_beep

