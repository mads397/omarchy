#!/bin/bash

PATHS_CACHE="/run/touchpad_inhibited_paths"

if [[ -f $PATHS_CACHE ]]; then
  inhibited_file=$(head -n 1 "$PATHS_CACHE")

  if [[ -n $inhibited_file ]] && [[ -f $inhibited_file ]]; then
    state=$(cat "$inhibited_file" 2>/dev/null)
    if [[ $state == "1" ]]; then
      echo '{"text": "󰤳", "tooltip": "Touchpad disabled", "class": "disabled"}'
    else
      echo '{"text": "󰟸", "tooltip": "Touchpad enabled", "class": "enabled"}'
    fi
    exit 0
  fi
fi

echo '{"text": "󰟸", "tooltip": "Touchpad enabled", "class": "enabled"}'
