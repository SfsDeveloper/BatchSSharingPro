rem Not : If you want to add <\> to the end of the relative path as in the following sample, write <\\>.

powershell -Command "& '%~dp0SSharing.ps1'" -cmd -default -encode -en_report -en_n 5 -en_k 3 -en_folder "abc\def\\" -pause_n -en_openfolder '\"%1\"'
pause
