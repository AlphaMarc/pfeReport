#!/bin/bash

if [ $# -ne 1 ]
then
    echo "ERROR: should have the name of the .tex file you want to compile without extension"
fi

base=`basename -s .tex $1`

echo "compiling with pdflatex "$base.tex
pdflatex -synctex=1 -interaction=nonstopmode $base.tex
bibtex $base.aux
pdflatex -synctex=1 -interaction=nonstopmode $base.tex
pdflatex -synctex=1 -interaction=nonstopmode $base.tex
 
echo "opening "$base.pdf
evince $base.pdf
