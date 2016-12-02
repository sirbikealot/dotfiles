## General Terminal settings
unset MAILCHECK
export EDITOR="vim"
export PATH="/usr/local/bin:$PATH"

## Load the default .profile
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile"

## Bash prompt ##
export PS1="[\D{%G%b%d %T}] \W $ "

## CA Certs ##
export SSL_CERT_FILE=/usr/local/etc/openssl/certs/cacert.pem

## CLI Vim navigation and editing ##
set -o vi

## chruby
source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh
# See https://github.com/postmodern/chruby
# See also https://gistlog.co/daqo/db4de42c9dea0a7d2a03
# and http://ryanbigg.com/2015/06/mac-os-x-ruby-ruby-install-chruby-and-you/

## Postgres ##
export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin"
export PGDATA=/usr/local/var/postgres
export PGHOST=/tmp

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

## NVM
export NVM_DIR="/Users/SamShiffman/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
