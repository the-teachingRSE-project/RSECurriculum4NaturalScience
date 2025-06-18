.DEFAULT_GOAL := index.pdf

TMPDIR := /tmp/latexmk-rse-curriculum

lni.bbx:
	wget -LO ${@} https://raw.githubusercontent.com/gi-ev/biblatex-lni/refs/tags/v0.7/LNI.bbx

lni.cbx:
	wget -LO ${@} https://raw.githubusercontent.com/gi-ev/biblatex-lni/refs/tags/v0.7/LNI.cbx

%.pdf: %.qmd my-paper.bib quarto-swt-template.tex lni.bbx lni.cbx Makefile
	@rm -rf ${TMPDIR}
	@mkdir -p ${TMPDIR}
	pandoc \
	    --standalone \
	    --bibliography=my-paper.bib \
	    --biblatex \
	    --template=quarto-swt-template.tex \
	    -M classoption="twocolumn, german, biblatex" \
	    -f markdown \
	    -M date="`date "+%F"`" \
	    -M datexmp="`date "+%F"`" \
	    -M linkcolor=darkgray \
	    -V hyperrefoptions=pdfa \
	    -V colorlinks=true \
	    -V papersize=a4 \
	    -V biblio-style=lni \
	    -o ${TMPDIR}/"${@:.pdf=}.tex" \
	    "${<}"
	latexmk \
	    -pdflatex -bibtex -aux-directory=${TMPDIR} \
	    -jobname="${@:.pdf=}" "${TMPDIR}/${@:.pdf=}.tex"


