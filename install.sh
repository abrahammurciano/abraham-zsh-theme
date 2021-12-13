echo "To enable the theme add the following to your .zshrc:"
if [[ -n $ZSH ]]; then
  THEME_DIR="$ZSH/themes/"
  echo "ZSH_THEME=\"abraham\""
else
  THEME_DIR="./"
  echo source `readlink $THEME_DIR`/abraham.zsh-theme
fi
curl -So "$THEME_DIR/abraham.zsh-theme" https://raw.githubusercontent.com/abrahammurciano/abraham-zsh-theme/master/abraham.zsh-theme