
@echo off
cls
echo Welcome to TheSimpleCalculator! Press any key to continue.
PAUSE>NUL

:beginning
cls
echo.
echo Operations
echo 1. Addition
echo 2. Subtraction
echo 3. Multiplication
echo 4. Division
echo.5. Factorial
echo 6. Print or do operations with numbers from _ to _ with step of _. 
echo.7. Print multiples of _.

echo.
echo Please choose from the list.

choice /c 12345678 /n 
IF ERRORLEVEL 7 goto seven
IF ERRORLEVEL 6 goto six
IF ERRORLEVEL 5 goto five
IF ERRORLEVEL 4 goto four
IF ERRORLEVEL 3 goto three
IF ERRORLEVEL 2 goto two
IF ERRORLEVEL 1 goto one

:one
cls
echo.
echo ADDITION
goto choose_numbers

:two
cls
echo SUBTRACTION
goto choose_numbers

:three
cls
echo MULTIPLICATION
goto choose_numbers

:four
cls
echo DIVISION
goto choose_numbers

:five
SETLOCAL ENABLEDELAYEDEXPANSION
cls
echo ENTER NUMBER TO FACTOR (max number: 31)
SET /P num=
cls
echo ENTERED NUMBER:
echo %num%
echo.

set fact=1

for /l %%i in (%num%, -1, 1) do (

if %%i==%num% (set factstring=%%i)
if NOT %%i==%num% (set factstring=!factstring!*%%i)
set /a fact=%%i*!fact!
)

SETLOCAL DISABLEDELAYEDEXPANSION
echo %num%!=%factstring%=%fact%
echo.
echo factorial of %num% is %fact%
goto more

:six
cls
echo From (enter number):
set /p startnum=
echo To (enter number):
set /p endnum=
echo With the step of (enter number):
set /p step=
echo P - to print
echo A - to add 
echo M - to multiply
choice /c pam /n 
IF ERRORLEVEL 3 goto m
IF ERRORLEVEL 2 goto a
IF ERRORLEVEL 1 goto p
:p
cls
echo Numbers from %startnum% to %endnum% with the step of %step%:
FOR /l %%a in (%startnum%, %step%, %endnum%) DO echo %%a
echo Would you like to do an operation with these numbers? Y - yes, N - no.
choice /c yn /n
IF ERRORLEVEL 2 goto more
IF ERRORLEVEL 1 goto aorm
:aorm
choice /c am /n /m "A - to add, M - to multiply
IF ERRORLEVEL 2 goto m
IF ERRORLEVEL 1 goto a
:a
echo ADDITION (of numbers from %startnum% to %endnum% with the step of %step%):
set sum=0
FOR /l %%a in (%startnum%, %step%, %endnum%) DO (set /a sum=%%a+sum)
echo %sum%
goto more
:m
echo MULTIPLICATION (of numbers from %startnum% to %endnum% with the step of %step%):
set mul=1
FOR /l %%a in (%startnum%, %step%, %endnum%) DO (set /a mul=mul*%%a)
echo %mul%
goto more


:seven
cls
echo Print multiples of _ (enter number)
set /p mulof=
echo Print multiples of %mulof% to _ (enter number)
set /p endnum=
cls 
echo Multiples of %mulof% from %startnum% to %endnum%:
FOR /l %%a in (%mulof%, %mulof%, %endnum%) DO echo %%a
goto more


:choose_numbers
echo.
echo First number
set /p num1=
echo Second number
set /p num2=
echo.

IF ERRORLEVEL 4 goto div
IF ERRORLEVEL 3 goto mul
IF ERRORLEVEL 2 goto sub
IF ERRORLEVEL 1 goto add

:add
set /a answer= %num1% + %num2%
echo %num1% + %num2% = %answer%
goto more

:sub
set /a answer= %num1% - %num2%
echo %num1% - %num2% = %answer%
goto more

:mul
set /a answer= %num1% * %num2%
echo %num1% * %num2% = %answer%
goto more

:div
set /a answer= %num1% / %num2%
echo %num1% / %num2% = %answer%
set /a remainder=%num1% %% %num2%
echo Remainder: %remainder%
goto more

:more
echo.
echo Would you like to do another (different) operation?
echo If yes, press Y. If no, press N.
choice /c yn /n 
IF ERRORLEVEL 2 goto thanks
IF ERRORLEVEL 1 goto beginning

:thanks
echo.
echo Thank you for using TheSimpleCalculator!
:end