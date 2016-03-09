#!/bin/bash

# Quickly set up an environment for working on web development ideas:
# At the command line, type: "quickhtml [name]"
# creates a folder [name], containing css/[name].css, js/[name].js,
# and index.html, which has a head with links to the above files, and a body

# After creating this stuff, it opens index.html in a browser
# If you don't want this, just get rid of the 'open "$1/index.html"' command at the end.



# Check that exactly one argument is given
if [[ "$#" -ne 1 ]]; then
    echo "There must be one and only one argument: the name of the project"
    exit
fi

# Check the argument is alphanumeric and begins with a letter
if  [[ "$1" =~ [^a-zA-Z0-9] ]]; then
    echo "The project name must be alphanumeric"
    exit
fi

# Set some usefule variables
informative_comment_1="This project created by $USER at $(date), using"
informative_comment_2="Robert de Lisle's (robert_delisle44@hotmail.com) 'biolerplate' function. Enjoy."

init_dir=$(pwd)

# Make the top-level folder then enter it
mkdir "$1" && cd "$1"

# Make the css folder and enter it
mkdir "css" && cd "css"

# Make a css file beginning with an informative comment, then return to top-level folder
printf "/*\n * $informative_comment_1\n * $informative_comment_2\n */\n" > "$1.css" && cd ".."

# Make the js folder and enter it
mkdir "js" && cd "js"

# Make a js file beginning with an informative comment, then return to top-level folder
printf "/*\n * $informative_comment_1\n * $informative_comment_2\n */\n" > "$1.js" && cd ".."

# Make index.html beginning with an informative comment
printf "<!--\n$informative_comment_1\n$informative_comment_2\n -->\n\n" > "index.html"

# Give it boilerplate html and a greeting message and link it to the necessary files
printf "<!DOCTYPE html>\n<html>\n\t<head>\n\t\t<title>$1</title>\n" >> "index.html"
printf "\t\t<link rel='stylesheet' type='text/css' href='css/$1.css'>\n" >> "index.html"
printf "\t\t<script type='text/javascript' src='js/$1.js'></script>\n" >> "index.html"
printf "\t</head>\n\t<body>\n" >> "index.html"
printf "\t\t<h1>$1</h1>\n\t\t<p>Hello, here's your html. Enjoy it.</p>\n" >> "index.html"
printf "\t</body>\n</html>\n" >> "index.html"

# Move back to parent of top-level folder
cd "$init_dir"

# Open index.html, displaying the greeting message
open "$1/index.html"
