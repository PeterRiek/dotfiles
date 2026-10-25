#!/bin/bash
CFG_FILE="$HOME/.config/niri/cfg/input.kdl"

# Check if the mouse is currently disabled
if grep -q "off // mouse-toggle" "$CFG_FILE" 2>/dev/null; then
    sed -i '/off \/\/ mouse-toggle/d' "$CFG_FILE"
    notify-send "Mouse" "Mouse Enabled" --icon=input-mouse
else
    sed -i '/touchpad {/a\        off // mouse-toggle' "$CFG_FILE"
    sed -i '/mouse {/a\        off // mouse-toggle' "$CFG_FILE"
    notify-send "Mouse" "Mouse Disabled" --icon=input-mouse
fi

niri msg action load-config-file
