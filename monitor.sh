#!/bin/bash

PROCESSES=("nginx" "mysql" "docker")

LOG_FILE="./logs/process_monitor.log"

echo "Czas | Proces | PID | CPU% | RAM%" >> "$LOG_FILE"

for PROC in "${PROCESSES[@]}"; do 
    PID=$(pgrep -x "$PROC")

    if [ -n "$PID"]; then
        CPU=$(ps -p "$PID" -o %cpu --no--headers | awk '{print $1}')
        MEM=$(ps -p "$PID" -o %mem --no-headers | awk '{print $1}')
        echo "$(date '+%Y-%m-%d %H:%M:%S') | $PROC | $PID | $CPU | $MEM" >> "$LOG_FILE"
    else
        echo "$(date '+%Y-%m-%d %H:%M:%S') | $PROC | Not Running" >> "$LOG_FILE"
    fi
done