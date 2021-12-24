@echo off
goto :start

File: rotate.cmd
Description: Rotate files while keeping last X days
Syntax: rotate.cmd
Version: 1.0.2021.12.24.1358
Author: Ken Teague
Email: kteague at pobox dot com
License: Creative Commons Zero v1.0 Universal

Shamelessly ripped from: https://superuser.com/questions/1514204/batch-script-for-renaming-a-daily-backup-file

All credit goes to josibu: https://superuser.com/users/496532/josibu

Changelog:
  2021-12-24 @ 1358
    * Initial release


:start
:: Adjust these variables to your liking
::  Drive letter where the data is stored
set _drive=D:
::  Path to the data
set _path=\Backup
::  Number of backups to keep
set _days=14
::  Keyword in filename to look for (when renaming the file)
set _keyword=output
::  DO NOT EDIT ANYTHING BELOW THIS LINE UNLESS YOU KNOW WHAT YOU'RE DOING!!


::  Rename file to current date/time
%_drive%
cd "%_path%"
for %%f in (*%_keyword%*) do rename "%%f" "AutoBackup%date:~10,4%%date:~6,2%/%date:~4,2%.*"


::  Purge old files
ForFiles /p "%_drive%%_path%" /s /d -%_days% /c "cmd /c del @file"