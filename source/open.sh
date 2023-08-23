#!/bin/bash

file_path="$1"

if [ -f "$file_path" ]; then
    file_dir=$(dirname "$file_path")
    open -R "$file_path"
else
    echo "$file_path is not a file"
fi