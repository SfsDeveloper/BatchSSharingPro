echo off
set year=%date:~0,4%
set month=%date:~5,2%
set day=%date:~8,2%

set hour=%time:~0,2%
set hour=%hour: =0%
set minute=%time:~3,2%
set second=%time:~6,2%

echo powershell -Command "& '%~dp0SSharing.ps1'" -cmd -default -encode -en_report -en_n 5 -en_k 3 -en_title Share_%year%%month%%month%_%hour%%minute%%second% -pause_n '\"%~dp0Share\"'
powershell -Command "& '%~dp0SSharing.ps1'" -cmd -default -encode -en_report -en_n 5 -en_k 3 -en_title Share_%year%%month%%month%_%hour%%minute%%second% -pause_n '\"%~dp0Share\"'
pause
