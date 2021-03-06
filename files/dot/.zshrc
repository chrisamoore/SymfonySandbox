set -o vi

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="cam"

# ZSH_THEME="crcandy"
# Example aliases
txtund=$(tput sgr 0 1)          # Underline
txtbld=$(tput bold)             # Bold
bldred=${txtbld}$(tput setaf 1) #  red
bldblu=${txtbld}$(tput setaf 4) #  blue
bldwht=${txtbld}$(tput setaf 7) #  white
txtrst=$(tput sgr0)             # Reset
info=${bldwht}*${txtrst}        # Feedback
pass=${bldblu}*${txtrst}
warn=${bldred}*${txtrst}
ques=${bldblu}?${txtrst}

alias rm='rm -i'
alias df='df -h'

# cd
alias ..='cd ..'
alias resetdb='php /vagrant/Symfony/app/console doctrine:database:drop --force && php /vagrant/Symfony/app/console doctrine:database:create && php /vagrant/Symfony/app/console doctrine:schema:create && yes | php /vagrant/Symfony/app/console doctrine:fixtures:load'
alias ls="/bin/ls $LS_OPTIONS"
alias ll='ls -l'
alias lsd='ls -ld'
alias la='ls -a'
alias lf='ls -F'
alias lr='ls -alFRt'
alias lx='ls -xF'
alias llar='ls -laFR'
alias lt='ls -lartF'
alias lrt='ls -lrt'
alias t='tree'
alias sf='/vagrant/Symfony/app/console'
alias phpunit_cov='/vagrant/Symfony/bin/phpunit -c /vagrant/Symfony/app/ --coverage-html /vagrant/vhosts/code_coverage '
alias phpunit='bin/phpunit -c app'
alias php_turbo='php -c /vagrant/bin/memory_boost.ini'
alias composer_turbo='/usr/bin/php -c /vagrant/bin/memory_boost.ini /usr/local/bin/composer'

alias home='cd ${HOME}'
alias up='cd ..'
alias web='cd /vagrant/Symfony'
alias mt='multitail -CS php'
alias logs='mt /vagrant/logs/nginx/*.log'
alias dot='cp /vagrant/files/dot/.zshrc ~/.zshrc && . ~/.zshrc'

alias kill_supervisord="sudo unlink /tmp/supervisor.sock"
alias bounce='sudo service nginx restart && sudo service php-fpm restart'
alias cache_clear='rm -rf /vagrant/Symfony/app/cache/* /vagrant/Symfony/app/logs/*'
alias grok='/vagrant/bin/ngrok -authtoken fVVLLIi6noAoJOIfmuLU -subdomain sandbox 80'

# DIRS
alias etc='cd /etc/'
alias mt='multitail -CS php'

#git
  alias showbranches='git for-each-ref --sort=-committerdate refs/heads/'
  #tagging Reference a Commit
    function tag(){
      if [ -z $1 ]
      then
        echo -e "\033[1;31mPlease specify a tag name and a message."
      else
        git blame $1
      fi
      git tag -a $1 -m $2
    }
  #list tags (brief)
   alias describe='git describe --tags'
  #list tag (bexpanded)
    function show(){
      if [ -z $1 ]
      then
        echo -e "\033[1;31mPlease specify a tag name."
      else
      git show $1
      fi
    }

  #Remove tag (bexpanded)
    function kill_tag(){
      if [ -z $1 ]
      then
        echo -e "\033[1;31mPlease specify a tag name."
      else
      git tag $1 -d
      git push origin :refs/tags/$1
      fi
    }

  #add tags to repo -> then sync
   alias push_tags='git push --tags'

  #stashing
    #list Local Changes
      alias stashes='git stash list'
    #Save Local Changes
     alias stash='git stash save "msg"'

  #blame Who Did What when and where
    function blame(){
      if [ -z $1 ]
      then
        echo -e "\033[1;31mPlease Specify a file."
      else
        git blame $1
      fi
    }
  #branching
    #create new branch
      function branch(){
        if [ -z $1 ]
        then
          echo -e "\033[1;31mPlease specify a branch name."
        else
        git checkout -b $1
        fi
      }
    #switch to branch
      function checkout(){
         if [ -z $1 ]
          then
            echo -e "\033[1;31mPlease specify a branch name."
          else
          git checkout $1
          fi
      }
    #merge branch
      function merge(){
         if [ -z $1 ]
        then
          echo -e "\033[1;31mPlease specify a branch name."
        else
          git merge $1

          fi
        }


  #committing
    #Git pull w/o commit
    alias no_commit='git pull --no-commit'

    function commit(){
       if [ -z $1 ]
        then
          echo -e "\033[1;31mPlease specify a branch name."
        else
        git commit -am "$1"
        echo "Committed to [repoName]"
        fi
      }
  #Statuses
    alias status='git status'
    #Git Log
      function git_log(){
        git log --oneline --graph --all --decorate
      }

RPROMPT='$(battery_charge)'

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git, git-extras, battery, brew, cloudapp, colorize, composer, emoji-clock, history, history-substring-search, node, osx, redis-cli, supervisor, vagrant, zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

#PATHS
export PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:

# Sexy Bash Prompt, inspired by "Extravagant Zsh Prompt"
# Screenshot: http://img.gf3.ca/d54942f474256ec26a49893681c49b5a.png
# A big thanks to \amethyst on Freenode
export EDITOR='subl -w'

if [[ $COLORTERM = gnome-* && $TERM = xterm ]]  && infocmp gnome-256color >/dev/null 2>&1; then export TERM=gnome-256color
elif infocmp xterm-256color >/dev/null 2>&1; then export TERM=xterm-256color
fi

if tput setaf 1 &> /dev/null; then
    tput sgr0
    if [[ $(tput colors) -ge 256 ]] 2>/dev/null; then
      MAGENTA=$(tput setaf 9)
      ORANGE=$(tput setaf 172)
      GREEN=$(tput setaf 190)
      PURPLE=$(tput setaf 141)
      WHITE=$(tput setaf 256)
    else
      MAGENTA=$(tput setaf 5)
      ORANGE=$(tput setaf 4)
      GREEN=$(tput setaf 2)
      PURPLE=$(tput setaf 1)
      WHITE=$(tput setaf 7)
    fi
    BOLD=$(tput bold)
    RESET=$(tput sgr0)
else
    MAGENTA="\033[1;31m"
    ORANGE="\033[1;33m"
    GREEN="\033[1;32m"
    PURPLE="\033[1;35m"
    WHITE="\033[1;37m"
    BOLD=""
    RESET="\033[m"
fi

parse_git_dirty () {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*)"
}
parse_git_branch () {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}

 #PS1="\[${BOLD}${MAGENTA}\]\u \[$WHITE\]at \[$ORANGE\]\h \[$WHITE\]in \[$GREEN\]\w\[$WHITE\]\$([[ -n \$(git branch 2> /dev/null) ]] && echo \" on \")\[$PURPLE\]\$(parse_git_branch)\[$WHITE\]\n\$ \[$RESET\]"

