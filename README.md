# ds2rse
Holds the paper project for INFORMATIK 2025 for comparative analysis of DS competencies and RSE competencies

## HOW TO CONTRIBUTE

- edit index.qmd following quarto markdown rules
- in the add further bib-files
- in authors.tex you can add yourself
- NOTE: if you have problems with the quarto pipeline, just add the content to index.qmd file and I will check this out

## HOW to run

- install quarto with tinytex extension
- run quarto render index.qmd --to pdf (should produce a pdf in LNI format)
- debug problems in generated index.tex file
- have a look at syntax_example.qmd for the most important quarto stuff


## Content TODOs

- write general text comparing DS and RSE
- write chapter comparing the research process differences (DS is more in analysis part, RSE ?)
- list main competences in DS (https://gi.de/fileadmin/GI/Hauptseite/Service/Publikationen/Empfehlungen/Empfehlungen_Masterstdiengaenge_DataScience_2021.pdf)
- compare competences in https://github.com/juliandehne/RSE-Masters/blob/tschira-funding/curriculum.txt 
- get in touch with literature and flesh out ideas

## Technical TODOs

- add deRSE bibliography as submodule
- check that the LNI-template complies to the LNI-format and generates the correct latex
    - have a look at https://quarto.org/docs/journals/templates.html
    - and LNI overleaf examples
- investigate edge cases of quarto features and how they are translated to latex

## Known Problems

- I had to install ngerman manually with tinytex (first finding out where quarto put the tinytex executables)
- Crossreferencing chapters does not work (for figures it does for some reason)