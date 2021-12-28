PAPER = nlpproject
TEX = $(wildcard *.tex)
BIB = aaai22.bib
FIGS = $(wildcard figs/*.pdf figs/*.png graphs/*.pdf graphs/*.png)

.PHONY: all clean
.NOTPARALLEL: $(PAPER).pdf

all:	$(PAPER).pdf

$(PAPER).pdf: $(TEX) $(BIB) $(FIGS)
	echo $(FIGS)
	pdflatex $(PAPER)
	bibtex $(PAPER)
	pdflatex $(PAPER)
	pdflatex $(PAPER)
	rm $(PAPER).aux
	rm $(PAPER).bbl
	rm $(PAPER).blg

#graph:
#	make -C graphs

clean:
	rm -f *.dvi $(PAPER).ps *.aux *.bbl *.blg *.log *.out $(PAPER).pdf
#	make -C graphs clean

pclean:
	rm -f *.dvi $(PAPER).ps *.aux *.bbl *.blg *.log *.out $(PAPER).pdf
