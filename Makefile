.PHONY: check-make
check-make:
	-checkmake Makefile

.PHONY: all
all:
	@echo No Default Target

VENV=/tmp/venvs/sandbox_TurboGears2
BIN=${VENV}/bin
PYTHON=${BIN}/python3
PIP=${BIN}/pip

.PHONY: null
null:
	@echo No Default Target

.PHONY: venv
venv: ${PYTHON}

${PYTHON}:
	git submodule update --init
	python3 -mvenv ${VENV}
	${PIP} install --upgrade wheel setuptools pip
	${PIP} install -r requirements.txt

.PHONY: clean
clean:
	git clean -xfdn
	-rm -rf ${VENV}

.PHONY: test
test:
	${BIN}/pytest
