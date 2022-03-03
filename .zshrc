# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

HISTFILE="$HOME/.zsh_history"
HISTSIZE=3000
SAVEHIST=3000
export PROMPT_EOL_MARK=''

# sshd_status=$(service ssh status)
# if [[ $sshd_status = *"is not running"* ]]; then
#   sudo service ssh --full-restart
# fi

export PATH=/home/snowzhao/.local/bin:$PATH

alias n="nvim"
alias ls="lsd"
alias la="ls -a"
alias ll='ls -alF'
alias lt='ls --tree'
alias du="dua"

alias cat='bat --paging=never'
export MANPAGER="zsh -c 'col -bx | bat -l man -p'"

function to {
	if [ $# -ge 2 ]; then
		echo "Too Many Arguments"
		return
	elif [ $# -eq 0 ]; then
		echo "Usage: to <dirname>"
		return
	fi
	mkdir $1 -p
	cd $1
}
source /etc/zsh_command_not_found

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk

zinit ice lucid wait='0' atload='_zsh_autosuggest_start'
zinit light zsh-users/zsh-autosuggestions

#zinit ice lucid wait='0' atinit='zpcompinit'
zinit light zdharma-continuum/fast-syntax-highlighting

zinit ice depth=1; zinit light romkatv/powerlevel10k

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# function login_git {
# 	cd ~/.ssh
# 	eval "$(ssh-agent -s)"
# 	ssh-add github
# 	cd -
# }
