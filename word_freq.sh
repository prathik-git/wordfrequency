#!/bin/bash

# Read the input file and split it into an array of words
words=($(cat input.txt | tr '[:upper:]' '[:lower:]' | tr -d '[:punct:]' | tr ' ' '\n'))

# Loop through the array of words and count the frequency of each word
declare -A word_count
for word in "${words[@]}"
do
    if [[ ${word_count[$word]+_} ]]
    then
        ((word_count[$word]++))
    else
        word_count[$word]=1
    fi
done

# Print the frequency of each word
for word in "${!word_count[@]}"
do
    echo "$word: ${word_count[$word]}"
done
