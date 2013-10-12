# Load aliases
. ~/.aliases/general.aliases.bash

# Quickly navigate your filesystem from the command-line
#
# See: http://jeroenjanssens.com/2013/08/16/quickly-navigate-your-filesystem-from-the-command-line.html
#
# Examples
#  $ cd ~/some/very/deep/often-used/directory
#  $ mark deep
#  $ jump deep
#  $ umark deep
#  $ marks
#  	deep -> /home/johndoe/some/very/deep/often-used/directory
#	foo -> /usr/bin/foo/bar

export MARKPATH=$HOME/.marks

function jump { 
    cd -P "$MARKPATH/$1" 2>/dev/null || echo "No such mark: $1"
}

function mark { 
    mkdir -p "$MARKPATH"; ln -s "$(pwd)" "$MARKPATH/$1"
}

function unmark { 
    rm -i "$MARKPATH/$1"
}

function marks {
    \ls -l "$MARKPATH" | tail -n +2 | sed 's/  / /g' | cut -d' ' -f9- | awk -F ' -> ' '{printf "%-10s -> %s\n", $1, $2}'
}

_completemarks() {
  local curw=${COMP_WORDS[COMP_CWORD]}
  local wordlist=$(find $MARKPATH -type l -exec basename {} \;)
  COMPREPLY=($(compgen -W '${wordlist[@]}' -- "$curw"))
  return 0
}

complete -F _completemarks jump unmark

# Use PHP version from homebrew
export PATH="$(brew --prefix)/bin:$PATH"
export PATH="$(brew --prefix php54)/bin:$PATH"

# Setup node.js and NPM paths
export NODE_PATH="/usr/local/lib/node"
export PATH="/usr/local/share/npm/bin:$PATH"
