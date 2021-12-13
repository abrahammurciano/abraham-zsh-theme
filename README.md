# abraham.zsh-theme

A ZSH theme based on [Agnoster](https://github.com/agnoster/agnoster-zsh-theme)

# Installation

Run this command.

```
zsh -c "$(curl -fsSL https://raw.githubusercontent.com/abrahammurciano/abraham-zsh-theme/master/install.sh)"
```

If you have [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh), set the following in your `.zshrc`:

```
ZSH_THEME="abraham"
```
Otherwise, add the following line to your `.zshrc`:
```
source path/to/abraham.zsh-theme
```

## Settings

To hide the username part of the prompt for a default user, add this line to your `~/.zprofile`:
```
export DEFAULT_USER=yourusername
```

To disable the git part of the prompt (e.g. if you work with massive git repos), add this line to your `~/.zprofile`:
```
export ABRAHAM_PROMPT_SEGMENTS=( "${ABRAHAM_PROMPT_SEGMENTS[@]/(prompt_git)}" )
```
Other parts of the prompt can be removed in the same manner.

# Compatibility

**NOTE:** In all likelihood, you will need to install a [Powerline-patched font](https://github.com/Lokaltog/powerline-fonts) for this theme to render correctly.

To test if your terminal and font support it, check that all the necessary characters are supported by copying the following command to your terminal: 
```echo "\ue0b0 \u00b1 \ue0a0 \u27a6 \u2718 \u26a1 \u2699"```
The result should look like this:

![Character Example](https://gist.githubusercontent.com/agnoster/3712874/raw/characters.png)

## What does it show?

- If the previous command failed (Colour changes to red)
- Show if you are SSH'ed into the computer
- User @ Hostname (if user is not DEFAULT_USER, which can then be set in your profile)
- Git status (unless PROMPT_HIDE_GIT is set to 1. This can be set in your profile)
  - Branch () or detached head (➦)
  - Current branch / SHA1 in detached head state
  - Dirty working directory (±, color change)
- Working directory
- Elevated (root) privileges (⚡)

![Screenshot](https://gist.githubusercontent.com/agnoster/3712874/raw/screenshot.png)

## Customize your prompt view

By default prompt has these segments: `prompt_status`, `prompt_context`, `prompt_virtualenv`, `prompt_dir`, `prompt_git`, `prompt_end` in that particular order.

If you want to add, change the order or remove some segments of the prompt, you can use array environment variable named `AGNOSTER_PROMPT_SEGMENTS`.

Examples:
- Show all segments of the prompt with indices:
```
echo "${(F)AGNOSTER_PROMPT_SEGMENTS[@]}" | cat -n
```
- Add the new segment of the prompt to the beginning:
```
AGNOSTER_PROMPT_SEGMENTS=("prompt_git" "${AGNOSTER_PROMPT_SEGMENTS[@]}")
```
- Add the new segment of the prompt to the end:
```
AGNOSTER_PROMPT_SEGMENTS+="prompt_end"
```
- Insert the new segment of the prompt = `PROMPT_SEGMENT_NAME` on the particular position = `PROMPT_SEGMENT_POSITION`:
```
PROMPT_SEGMENT_POSITION=5 PROMPT_SEGMENT_NAME="prompt_end";\
AGNOSTER_PROMPT_SEGMENTS=("${AGNOSTER_PROMPT_SEGMENTS[@]:0:$PROMPT_SEGMENT_POSITION-1}" "$PROMPT_SEGMENT_NAME" "${AGNOSTER_PROMPT_SEGMENTS[@]:$PROMPT_SEGMENT_POSITION-1}");\
unset PROMPT_SEGMENT_POSITION PROMPT_SEGMENT_NAME
```
- Swap segments 4th and 5th:
```
SWAP_SEGMENTS=(4 5);\
TMP_VAR="$AGNOSTER_PROMPT_SEGMENTS[$SWAP_SEGMENTS[1]]"; AGNOSTER_PROMPT_SEGMENTS[$SWAP_SEGMENTS[1]]="$AGNOSTER_PROMPT_SEGMENTS[$SWAP_SEGMENTS[2]]"; AGNOSTER_PROMPT_SEGMENTS[$SWAP_SEGMENTS[2]]="$TMP_VAR"
unset SWAP_SEGMENTS TMP_VAR
```
- Remove the 5th segment:
```
AGNOSTER_PROMPT_SEGMENTS[5]=
```

A small demo of the dummy custom prompt segment, which has been created with help of the built-in `prompt_segment()` function from Agnoster theme:
```
# prompt_segment() - Takes two arguments, background and foreground.
# Both can be omitted, rendering default background/foreground.

customize_agnoster() {
  prompt_segment 'red' '' ' ⚙ ⚡⚡⚡ ⚙  '
}
```
![Customization demo](https://github.com/apodkutin/agnoster-zsh-theme/raw/customize-prompt/agnoster_customization.gif)
