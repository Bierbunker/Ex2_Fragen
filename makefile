# directories
image := image
output := output

# input files
source := katalog.tex
images := $(shell find image -type f -name "*")

# output file
target := $(patsubst %.tex,${output}/%.pdf,${source})

${target}: ${source} ${images}
	@mkdir -p ${output}
	@texfot.exe pdflatex --output-directory=${output} $<
	@texfot.exe pdflatex --output-directory=${output} $<

force:
	@rm -f ${target}
	@${MAKE} ${target}

clean:
	@rm -rf ${output}