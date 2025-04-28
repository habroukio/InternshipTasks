#!/bin/bash

# Handle --help
if [[ "$1" == "--help" ]]; then
  echo "Usage: ./mygrep.sh [options] search_string filename"
  echo "Options:"
  echo "  -n    Show line numbers"
  echo "  -v    Invert match (show lines that do NOT match)"
  echo "  --help Show this help message"
  exit 0
fi

# Default option values
show_line_numbers=false
invert_match=false

# Parse options (-n, -v)
while getopts ":nv" opt; do
  case $opt in
    n) show_line_numbers=true ;;
    v) invert_match=true ;;
    \?) echo "Invalid option: -$OPTARG" >&2
        exit 1 ;;
  esac
done

# Move the arguments after options
shift $((OPTIND -1))

# Check if search string and filename are provided
if [[ $# -lt 2 ]]; then
  echo "Error: Missing search string or filename."
  echo "Use --help for usage."
  exit 1
fi

search_string=$1
filename=$2

# Check if file exists
if [[ ! -f "$filename" ]]; then
  echo "Error: File '$filename' not found."
  exit 1
fi

# Read file line by line
line_number=0

while IFS= read -r line; do
  ((line_number++))

  if echo "$line" | grep -i -q "$search_string"; then
    matched=true
  else
    matched=false
  fi

  # Invert match if needed
  if $invert_match; then
    if $matched; then
      matched=false
    else
      matched=true
    fi
  fi

  # Print if match is found
  if $matched; then
    if $show_line_numbers; then
      echo "${line_number}:$line"
    else
      echo "$line"
    fi
  fi

done < "$filename"


