#!/bin/bash

PROCESSES=("nginx" "mysql" "docker")


SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LOG_DIR="$SCRIPT_DIR/logs"
LOG_FILE="$LOG_DIR/process_monitor.log"

mkdir -p "$LOG_DIR"

if [ ! -f "$LOG_FILE" ]; then
    echo "Czas | Proces | PID | CPU% | RAM%" > "$LOG_FILE"
fi

for PROC in "${PROCESSES[@]}"; do
    PID=$(pgrep -x "$PROC")

    if [ -n "$PID" ]; then
        CPU=$(ps -p "$PID" -o %cpu --no-headers | awk '{print $1}')
        MEM=$(ps -p "$PID" -o %mem --no-headers | awk '{print $1}')
        echo "$(date '+%Y-%m-%d %H:%M:%S') | $PROC | $PID | $CPU | $MEM" >> "$LOG_FILE"
    else
        echo "$(date '+%Y-%m-%d %H:%M:%S') | $PROC | Not Running" >> "$LOG_FILE"
    fi
done
