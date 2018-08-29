#!/bin/bash

# Set variables for python versions. Could probably be done cleaner, but this works.
PYTHON_VERSION_1=`python -c 'import sys; version=sys.version_info[:3]; print("{0}".format(version[0]))' || { echo "no py"; }`
PYTHON_VERSION_2=`python -c 'import sys; version=sys.version_info[:3]; print("{0}".format(version[1]))' || { echo "no py"; }`
PYTHON_VERSION_3=`python -c 'import sys; version=sys.version_info[:3]; print("{0}".format(version[2]))' || { echo "no py"; }`
PYTHON3_VERSION_1=`python3 -c 'import sys; version=sys.version_info[:3]; print("{0}".format(version[1]))' || { echo "no py3"; }`
PYTHON3_VERSION_2=`python3 -c 'import sys; version=sys.version_info[:3]; print("{0}".format(version[2]))' || { echo "no py3"; }`
PYTHON35_VERSION_1=`python3.5 -c 'import sys; version=sys.version_info[:3]; print("{0}".format(version[1]))' || { echo "no py35"; }`
PYTHON35_VERSION_2=`python3.5 -c 'import sys; version=sys.version_info[:3]; print("{0}".format(version[2]))' || { echo "no py35"; }`
PYTHON36_VERSION=`python3.6 -c 'import sys; version=sys.version_info[:3]; print("{0}".format(version[1]))' || { echo "no py36"; }`
PYTHON37_VERSION=`python3.7 -c 'import sys; version=sys.version_info[:3]; print("{0}".format(version[1]))' || { echo "no py37"; }`


if [ "$PYTHON_VERSION_1" -eq "3" ]; then # Python = 3
    if [ "$PYTHON_VERSION_2" -eq "5" ]; then # Python = 3.5
        if [ "$PYTHON_VERSION_3" -ge "3" ]; then # Python = 3.5.3
            python run.py
            exit
        fi
    elif [ "$PYTHON_VERSION_2" -ge "6" ]; then # Python >= 3.6
        python run.py
        exit
    fi
fi

if [ "$PYTHON3_VERSION_1" -eq "5" ]; then # Python3 = 3.5
    if [ "$PYTHON3_VERSION_2" -ge "3" ]; then # Python3 >= 3.5.3
            python3 run.py
            exit
    fi
fi

if [ "$PYTHON3_VERSION_1" -ge "6" ]; then # Python3 >= 3.6
    python3 run.py
    exit
fi

if [ "$PYTHON35_VERSION_2" -ge "3" ]; then # Python3.5 > 3.5.3
    python3.5 run.py
    exit
fi

if [ "$PYTHON36_VERSION" -eq "6" ]; then # Python3.6 = 3.6
    python3.6 run.py
    exit
fi

if [ "$PYTHON37_VERSION" -eq "7" ]; then # Python3.7 = 3.7
    python3.7 run.py
    exit
fi

echo "You are running an unsupported Python version."
echo "Please use a version of Python above 3.5.2."
