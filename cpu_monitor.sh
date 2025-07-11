#!/bin/bash

THRESHOLD=1
idle=$(top -bn1 | grep "Cpu(s)" | awk '{print $8}')
usage=$(echo "100 - $idle" | bc)

if (( $(echo "$usage > $THRESHOLD" | bc -l) )); then
    echo "Warning: CPU usage is at $usage%" | s-nail -s "⚠️ High CPU Usage Alert: $usage%" yuviyuvaraj7639@gmail.com
fi

