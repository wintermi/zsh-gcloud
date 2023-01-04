#!/usr/bin/env zsh
# shellcheck disable=SC1090

# Exit if the 'gcloud' command can not be found
if ! (( $+commands[gcloud] )); then
    echo "ERROR: 'gcloud' command not found"
    return
fi

# Identify location of completion include file, which is different depending on the OS type
if [[ "$OSTYPE" == "darwin"* ]]; then
    local COMPLETION_INCLUDE="/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
else
    local COMPLETION_INCLUDE="/usr/share/google-cloud-sdk/completion.zsh.inc"
fi

# If the completion include file exists, source it
if [[ -f "$COMPLETION_INCLUDE" ]]; then
    source "$COMPLETION_INCLUDE"
fi
