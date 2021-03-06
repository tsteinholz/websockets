export PYTHONASYNCIODEBUG=1
export PYTHONPATH=src

style:
	isort --recursive src tests
	black src tests
	flake8 src tests
	mypy --strict src

test:
	python -W default -m unittest

coverage:
	python -m coverage erase
	python -W default -m coverage run -m unittest
	python -m coverage html
	python -m coverage report --show-missing --fail-under=100

clean:
	find . -name '*.pyc' -o -name '*.so' -delete
	find . -name __pycache__ -delete
	rm -rf .coverage build compliance/reports dist docs/_build htmlcov MANIFEST src/websockets.egg-info
