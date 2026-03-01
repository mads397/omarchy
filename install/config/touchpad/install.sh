#!/bin/bash

# Install polkit rule for touchpad toggle (allows wheel group to toggle without password)

sudo tee /usr/share/polkit-1/rules.d/50-omarchy-touchpad-toggle.rules >/dev/null <<'EOF'
polkit.addRule(function(action, subject) {
    if (action.id == "org.freedesktop.policykit.exec" &&
        subject.isInGroup("wheel")) {
        var program = action.lookup("program");
        if (program && program.indexOf("/default/touchpad/toggle-impl") !== -1) {
            return polkit.Result.YES;
        }
    }
});
EOF
