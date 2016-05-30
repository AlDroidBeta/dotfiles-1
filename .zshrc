#############
# OH-MY-ZSH #
#############
export ZSH=$HOME/.oh-my-zsh

# Themes
if [ -z $DISPLAY ]; then
	ZSH_THEME="gentoo"
else
	ZSH_THEME="agnoster-mod"
fi


DISABLE_AUTO_UPDATE="true"
COMPLETION_WAITING_DOTS="true"

# Plugins
plugins=(git sudo systemd zsh-syntax-highlighting)

export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin/core_perl:/usr/bin:$HOME/scripts"

source $ZSH/oh-my-zsh.sh

# highlighting rules
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
ZSH_HIGHLIGHT_STYLES[alias]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[function]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[command]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=green'
ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[path]='fg=blue,bold'
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=blue,bold'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=cyan,bold'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=cyan,bold'
#############


##################
#     ALIAS      #
##################
alias -r sudo='sudo '
alias -g gp='| grep'
alias -g lss='| less'
alias -r l='ls -lah --group-directories-first'

alias -r rf='rm -rf'
alias -r mkdir='mkdir -p'
alias -r dd="dd status=progress"

alias -r S='pacaur -S'
alias -r Ss='pacaur -Ss'
alias -r Syu='pacaur -Syu'
alias -r Rns='pacaur -Rns'

alias -r cal='cal -m3'
alias -r t='tree -C'
alias -r wanip='curl ipinfo.io/ip'
alias -r lanip='ip addr show wlp2s0 | /usr/bin/grep -Po "inet \K[\d.]+"'

alias -r pastebin="curl -F c=@- https://ptpb.pw"
alias -r pastefile="curl -F c=@- https://ptpb.pw <"

alias -r share='ip addr; webfsd -Fdp 8000'
alias -r clip='xclip -selection clipboard'

alias -r qr='qrencode -t UTF8'
alias -r qrclip='xclip -o | qrencode -t UTF8'

alias -r mnt='udisksctl mount -b'
alias -r umnt='udisksctl unmount -b'

alias -r histclean='sort -t ";" -k 2 -u ~/.zsh_history | sort -o ~/.zsh_history'

# commit all changes with generic commit message for minor changes
alias -r commit='git commit -am "unimportant changes"'

setopt dotglob
function duf() { cd $1; du -sch * | sort -h; cd - > /dev/null}
##################


##################
#    VARIABLE    #
##################

if [ -e /usr/share/terminfo/x/xterm-256color ] && [ "$COLORTERM" = "xfce4-terminal" ]; then
    export TERM='xterm-256color'
fi

export EDITOR='vim'
export PKGDEST="/var/cache/pacman/pkg/aur"
##################

# warn me if more than one user is logged in
if [ $(who|wc -l) -gt 1 ]; then
	echo -e "Warning! More than one user logged in:"
	who
fi

# auto tmux attach
#if [ "$TERM" != 'screen' ]; then
#	tmux has-session && exec tmux attach || exec tmux
#fi

