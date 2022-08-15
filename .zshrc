# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"
POWERLEVEL9K_MODE="awesome-patched"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=7

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  docker-compose
  zsh-saml2aws
  ruby
  asdf
  zsh-osx-keychain # https://github.com/onyxraven/zsh-osx-keychain
  brew
  zsh-syntax-highlighting
)

# USER CONFIGURATION
# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='code'
# else
#   export EDITOR='mvim'
# fi
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

# ALIASES
source $HOME/.zsh_secrets # sensitive exports
source $HOME/.shell-aliases
source $HOME/.shell-aliases-ibotta

# KEYMAPS
bindkey "\e\e[D" backward-word
bindkey "\e\e[C" forward-word

# EXPORTS
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"


export AWS_SESSION_TTL=12h
export AWS_FEDERATION_TOKEN_TTL=12h
export AWS_ASSUME_ROLE_TTL=1h
export AWS_DEFAULT_REGION=us-east-1
export AWS_REGION=$AWS_DEFAULT_REGION

export AWS_POLL_DELAY_SECONDS=30
export AWS_MAX_ATTEMPTS=3000
# export AWS_TIMEOUT_SECONDS=3000

# export PATH="/Users/danbeerman/.gem/ruby/2.3.0/bin:$PATH"
export GOPATH=~/go

complete -o nospace -C /usr/local/Cellar/tfenv/1.0.2/versions/0.11.10/terraform terraform


# M1 things
# A CA file has been bootstrapped using certificates from the system
# keychain. To add additional certificates, place .pem files in
#   /opt/homebrew/etc/openssl@3/certs

# and run
#   /opt/homebrew/opt/openssl@3/bin/c_rehash
# source: https://github.com/rbenv/ruby-build/discussions/1853
#  For compilers to find openssl@3 you may need to set:
# export LDFLAGS="-L/opt/homebrew/opt/openssl@3/lib"
# export CPPFLAGS="-I/opt/homebrew/opt/openssl@3/include"
# export PATH="/opt/homebrew/opt/openssl@3/bin:$PATH"
# # For pkg-config to find openssl@3 you may need to set:
# export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl@3/lib/pkgconfig"
PATH="/usr/local/opt/openssl@1.1/bin:$PATH" \
LDFLAGS="-L$(brew --prefix)/opt/openssl@1.1/lib" \
CPPFLAGS="-I$(brew --prefix)/opt/openssl@1.1/include" \
PKG_CONFIG_PATH="$(brew --prefix)/opt/openssl@1.1/lib/pkgconfig" \
# Homebrew on the M1, where things install to /opt/homebrew
export PATH=/opt/homebrew/bin:$PATH

# Initialize pyenv + rbenv on shell start
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"

eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"

PATH="$HOME/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="$HOME/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="$HOME/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"$HOME/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"; export PERL_MM_OPT;

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!! (thx internet... I kind of doubt it... but w/e)
# todo - switch java to asdf!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Autocompletes, etc
autoload -U +X bashcompinit && bashcompinit
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source /opt/homebrew/opt/powerlevel10k/powerlevel10k.zsh-theme
