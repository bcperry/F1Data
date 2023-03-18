@echo OFF
rem Created by Blaine Perry
rem 01DEC2022

rem This file will create a python virtual environment with the necessary packages for the demystify AI professional development

rem start by defining some variables
set ENVNAME=venv

rem virtual environment creation (if needed) in the same directory as this .bat file
if exist %ENVNAME%\Scripts\activate (

    rem the environment exists, so activate it
    echo Environment exists
    call %ENVNAME%\Scripts\activate

    ) else (

        rem Start by installing and updating some packages in base python (if not installed)
        rem Note: We cant use pip directly due to firewall issues, so use explicitly declare the trusted hosts
        python -m pip install --user virtualenv
        python -m pip install --upgrade pip

        rem create the environment
        python -m venv %ENVNAME%

        rem Now, activate the environment
        call %ENVNAME%\Scripts\activate

        )
    rem install required packages in the environment through the requirements file
    python -m pip install --upgrade pip
    python -m pip install -r requirements.txt


rem Run jupyter lab from the virtual environment
rem call jupyter lab