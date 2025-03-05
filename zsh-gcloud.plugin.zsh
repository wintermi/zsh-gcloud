#!/usr/bin/env zsh
# shellcheck disable=SC1090

# Exit if the 'gcloud' command can not be found
if ! (( $+commands[gcloud] )); then
    return
fi

# Identify the location of the Google Cloud SDK installed: dir containing "bin/gcloud"
local SDK_PATH=$(dirname $(dirname $(which gcloud)))

# If the Google Cloud SDK path was found
if [[ ! -z "$SDK_PATH" ]]; then
    # If the path include file exists, source it
    if [[ -f "$SDK_PATH/path.zsh.inc" ]]; then
        typeset -TUx PATH path
        source "$SDK_PATH/path.zsh.inc"
    fi

    # If the completion include file exists, source it
    if [[ -f "$SDK_PATH/completion.zsh.inc" ]]; then
        source "$SDK_PATH/completion.zsh.inc"
    fi
fi
