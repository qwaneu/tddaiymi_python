#!/bin/bash

export PYTHONPATH=tests:src
python -m venv venv
. venv/bin/activate
pip install -r requirements.txt
if [[ "$1" == "watch" ]]
then
   shift
   pytest-watch -- $@
else
   pytest --junitxml=reports/test-report.xml $@
fi

