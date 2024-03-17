source <(kubectl completion bash)
USE_GKE_GCLOUD_AUTH_PLUGIN=True

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

WARP_THEMES_DIR="$HOME/.warp/themes"

source "$HOME/.starship_bash.sh"
