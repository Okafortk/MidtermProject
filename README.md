# File Analyze Script

## Overview
This script is a good way to quickly analyze text files, which it gives you a breakdown of the number of lines, words, and characters. It can also be used to filter and count words that start with a specific letter.

## Why is it needed

It is useful to check the size of a file or just get a quick overview of your word count. The filtering feature with regex helps you dig a bit deeper by counting only the words that start with a letter of your choice.

## How Does It Work

- Use the `-f` option to specify the text file you want to analyze.
- Use the `-s` option to filter and count words that start with a specific letter (e.g., count words starting with "a").
- The script will then show you how many lines, words, characters, and filtered words are in your file.

## Example

To run the script, open your terminal and type:

./file-analyze.sh -f /path/to/your/file.txt -s /the letter you want to filter

./file-analyze.sh -f testfile.txt -s a 

