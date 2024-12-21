#!/bin/bash
LOG_FILE="/data/local/tmp/fstrim_last_run.log"

CURRENT_DATE=$(date +%Y-%m-%d)

if [ -f "$LOG_FILE" ]; then
    LAST_RUN_DATE=$(cat "$LOG_FILE")
    if [ "$LAST_RUN_DATE" == "$CURRENT_DATE" ]; then
        echo "fstrim already executed today. Exiting."
        exit 0
    fi
fi

echo "Running fstrim on /data and /cache..."
fstrim -v /data
fstrim -v /cache

echo "$CURRENT_DATE" > "$LOG_FILE"
echo "fstrim executed successfully."