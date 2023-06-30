# Makefile
# 
# Converts Markdown to other formats (HTML, PDF, DOCX, EPUB) using Pandoc
# <http://johnmacfarlane.net/pandoc/>
#
# Run "make" (or "make all") to convert to all other formats
#
# Run "make clean" to delete converted files

# Convert all files in this directory that have a .md suffix
## Markdown extension (e.g. md, markdown, mdown).
# 
# [Converting Markdown to Beautiful PDF with Pandoc - jdhao's digital space](https://jdhao.github.io/2019/05/30/markdown2pdf_pandoc/)

MEXT = md

SOURCE_DOCS := $(wildcard *.$(MEXT))

## Location of Pandoc support files.
BUILD = /Users/will/Dropbox/zettelkasten/Writing/Build
TPLT = /Users/will/Dropbox/zettelkasten/Writing/Build/Templates
LATEX = /Users/will/Dropbox/zettelkasten/Writing/Build/LATEX

## Project name
PROJ = $(shell basename $(CURDIR))

## Location of your working bibliography file
## BIB = $(CURDIR)/$(PROJ).bib
BIB = /Users/will/Dropbox/Apps/Zotero/library.bib

## CSL stylesheet (located in the csl folder of the BUILD directory).
CSL = mla

EXPORTED_DOCS=\
 $(SOURCE_DOCS:.md=.html) \
 $(SOURCE_DOCS:.md=.pdf) \
 $(SOURCE_DOCS:.md=.docx) \
 $(SOURCE_DOCS:.md=.epub)

HTML=$(SOURCE_DOCS:.md=.html)
PDFS=$(SOURCE_DOCS:.md=.pdf)
DOCX=$(SOURCE_DOCS:.md=.docx)
EPUB=$(SOURCE_DOCS:.md=.epub)

RM=/bin/rm -f
MV=/bin/mv

PANDOC=/usr/local/bin/pandoc

PANDOC_OPTIONS=-s -C

PANDOC_HTML_OPTIONS=\
 --to html5\
 --csl=$(TPLT)/$(CSL).csl\
 --bibliography=$(BIB)\
 --resource-path=$(BUILD)
PANDOC_PDF_OPTIONS=\
 --pdf-engine=xelatex\
 --csl=$(TPLT)/$(CSL).csl\
 --bibliography=$(BIB)\
 -V colorlinks\
 -V urlcolor=NavyBlue\
 -V toccolor=red\
 -V mainfont="Times New Roman"\
 --resource-path=$(BUILD)
PANDOC_DOCX_OPTIONS=\
 --csl=$(TPLT)/$(CSL).csl\
 --bibliography=$(BIB)\
 --reference-doc=$(TPLT)/ref.docx\
 --lua-filter=$(LATEX)/pagebreak.lua\
 --resource-path=$(BUILD)
PANDOC_EPUB_OPTIONS=--to epub3\
 --csl=$(TPLT)/$(CSL).csl\
 --bibliography=$(BIB)\
 --resource-path=$(BUILD)

# Pattern-matching Rules

%.html : %.md
	$(PANDOC) $(PANDOC_OPTIONS) $(PANDOC_HTML_OPTIONS) -o $@ $<

%.pdf : %.md
	$(PANDOC) $(PANDOC_OPTIONS) $(PANDOC_PDF_OPTIONS) -o $@ $<
	
%.docx : %.md
	$(PANDOC) $(PANDOC_OPTIONS) $(PANDOC_DOCX_OPTIONS) -o $@ $<

%.epub : %.md
	$(PANDOC) $(PANDOC_OPTIONS) $(PANDOC_EPUB_OPTIONS) -o $@ $<


# Targets and dependencies

.PHONY: all clean

all : clean $(EXPORTED_DOCS) stage
html : cleanhtml $(HTML) stage
pdf : cleanpdf $(PDFS) stage
docx : cleandocx $(DOCX) stage
epub : cleanepub $(EPUB) stage


clean : cleanhtml cleanpdf cleandocx cleanepub


cleanpdf:	
	rm -f _stage/*.pdf	

cleandocx:	
	rm -f _stage/*.docx

cleanhtml:	
	rm -f _stage/*.html

cleanepub:	
	rm -f _stage/*.epub

stage:
	- $(MV) $(EXPORTED_DOCS) _stage
	