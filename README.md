# frd-latex
repo to process Freud XML/TEIs into PDFs via LaTex


## how it work

* copy XML/TEIs you'd like to process into `to_process` and run `./makepdf.sh`, which will
  * convert all `*.xml` files in `to_process` into LaTeX files (stored temporarily into the repo's root directory)
  * run `latexmk -xelatex  -output-directory="./tmp"`meaning converting the LaTeX files into PDFs
  * clean up a bit, meaning
    * moving the original XMLs into `./processed`,
    * moving the LaTeX files into `./tex`
    * moving the PDFs into `./pdf`
    * and delete all helper files

The repo is set up to run locally (tested on ubuntu) as well via GitHub-Actions