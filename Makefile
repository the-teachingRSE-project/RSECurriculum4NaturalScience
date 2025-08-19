.DEFAULT_GOAL := index.pdf

TMPDIR := /tmp/latexmk-rse-curriculum

lni.bbx:
	wget -LO ${@} https://raw.githubusercontent.com/gi-ev/biblatex-lni/refs/tags/v0.7/LNI.bbx

lni.cbx:
	wget -LO ${@} https://raw.githubusercontent.com/gi-ev/biblatex-lni/refs/tags/v0.7/LNI.cbx

%-pandoc.pdf: %.qmd
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
	    -V build-without-quarto=true \
	    -o ${TMPDIR}/"${@:.pdf=}.tex" \
	    "${<}"
	latexmk \
	    -pdflatex -bibtex -aux-directory=${TMPDIR} \
	    -jobname="${@:.pdf=}" "${TMPDIR}/${@:.pdf=}.tex"

%-quarto.pdf: %.qmd
	quarto render "${<}" --to pdf --output "${@}"

%.pdf: %.qmd my-paper.bib quarto-swt-template.tex lni.bbx lni.cbx Makefile
	@if command -v quarto >/dev/null 2>&1; then\
	  make "${@:.pdf=}-quarto.pdf";\
	  mv "${@:.pdf=}-quarto.pdf" "${@}";\
	else \
	  make "${@:.pdf=}-pandoc.pdf";\
	  mv "${@:.pdf=}-pandoc.pdf" "${@}";\
	fi
