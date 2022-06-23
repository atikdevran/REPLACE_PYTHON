.PHONY: check clean fmt lint test

check: lint test

fmt:
	black replace.py

lint:
	black --check --diff --quiet replace.py
	pylint replace.py

test: clitest
	bash ./clitest --progress none src

clitest:
	curl --location --remote-name --silent \
	https://raw.githubusercontent.com/atikdevran/clitest/main/clitest

clean:
	rm -f clitest
