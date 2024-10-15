#!/bin/bash

# Function to display help information
usage() {
  echo "Usage: $0 [-f filename] [-s letter] [-h]"
  echo "-f    Specify the text file you want to analyze."
  echo "-s    Specify a letter to filter words that start with it."
  echo "-h    Show this help message if you're confused."
  exit 1
}

# Check if there are no arguments; if so, show usage
if [ "$#" -eq 0 ]; then
  usage
fi

# Initialize variables
filter_letter=""

# Parse command-line options
while getopts ":f:s:h" opt; do
  case ${opt} in
    f )
      filename="$OPTARG"
      # Check if the specified file exists
      if [ ! -f "$filename" ]; then
        echo "Error: Oops, the file '$filename' doesn't seem to exist."
        exit 1
      fi
      ;;
    s )
      filter_letter="$OPTARG"
      # Ensure a single character is provided for filtering
      if [[ ! "$filter_letter" =~ ^[a-zA-Z]$ ]]; then
        echo "Error: The filter option requires a single letter."
        exit 1
      fi
      ;;
    h )
      usage
      ;;
    \? )
      echo "Invalid option: -$OPTARG. Just use -h if you're lost." >&2
      usage
      ;;
  esac
done

# Function to analyze the specified file
analyze_file() {
  local file="$1"
  lines=$(wc -l < "$file")
  words=$(wc -w < "$file")
  characters=$(wc -c < "$file")

  # Count words that start with the specified letter if provided
  if [ -n "$filter_letter" ]; then
    filtered_words=$(grep -o "\b$filter_letter[a-zA-Z]*" "$file" | wc -l)
    echo "Filtered words that start with '$filter_letter': $filtered_words"
  fi

  # Output the results in a friendly manner
  echo "Analysis of $file:"
  echo "Lines: $lines"
  echo "Words: $words"
  echo "Characters: $characters"
}

# Call the analysis function
analyze_file "$filename"
