#!/bin/bash

KEYWORD="nnUNetv2_train"

echo "🔍 Searching for processes containing \"$KEYWORD\"..."
PROCESSES=$(ps -ef | grep "$KEYWORD" | grep -v grep)

if [ -z "$PROCESSES" ]; then
    echo "❗ No processes found containing \"$KEYWORD\"."
    exit 0
else
    echo "✅ Found the following processes:"
    echo "$PROCESSES"
fi

# Extract unique parent PIDs, excluding PPID=1
PIDS=$(echo "$PROCESSES" | awk '{print $2}' | sort -u)

echo "🔪 The following processes will be terminated:"
echo "$PIDS"

for pid in $PIDS; do
    kill -9 "$pid" 2>/dev/null
done

# Give the system a moment to clean up
sleep 1

# Re-check if any matching processes remain
echo "🔄 Rechecking process status..."
REMAINING=$(ps -ef | grep "$KEYWORD" | grep -v grep)

if [ -z "$REMAINING" ]; then
    echo "✅ All processes containing \"$KEYWORD\" have been successfully terminated."
else
    echo "🔍 Remaining processes containing \"$KEYWORD\":"
    echo "$REMAINING"
fi