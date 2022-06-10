# frd-latex
repo to process Freud XML/TEIs into PDFs via LaTex


## how it works

* copy XML/TEIs you'd like to process into `to_process` and run `./makepdf.sh`, which will
  * convert all `*.xml` files in `to_process` into LaTeX files (stored temporarily into the repo's root directory)
  * run `latexmk -xelatex  -output-directory="./tmp"`meaning converting the LaTeX files into PDFs
  * clean up a bit, meaning
    * moving the original XMLs into `./processed`,
    * moving the LaTeX files into `./tex`
    * moving the PDFs into `./pdf`
    * and delete all helper files

The repo is set up to run locally (tested on linux) as well via GitHub-Actions but you'll need to install any needed packages for LaTeX, Java, etc. yourself. Have a look at [.github/workflows/to_pdf.yml](https://github.com/freud-digital/frd-latex/blob/f1f135b1a23a044d5fa9abb0fd87a3e53ce1c65d/.github/workflows/to_pdf.yml#L14) to see what needs to be installed