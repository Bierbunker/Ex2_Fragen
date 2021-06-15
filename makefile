image := image
output := output

source := $(wildcard *.tex)
target := $(patsubst %.tex,${output}/%.pdf,${source})

images := $(shell find ${image} -type f -name "*")

${target}: ${source} ${images}
	@mkdir -p ${output}
	@texfot pdflatex --output-directory=${output} $<
	@texfot pdflatex --output-directory=${output} $<

force:
	@rm -f ${target}
	@${MAKE} ${target}
