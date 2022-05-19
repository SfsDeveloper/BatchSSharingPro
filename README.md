# BatchSSharingPro
Batch file for using the application *"SSharing Pro"* on the command line. *"SSharing Pro"* is (k, n) Threshold Secret Sharing Scheme Utility.<br>

# About *"SSharing Pro"*
*"SSharing Pro"* is (k, n) Threshold Secret Sharing Scheme Utility.<br>
*"SSharing Pro"* is paid. There is a free trial period.<br>
<br>
There is also a free version of "SSharing Free".<br>
However, the free version cannot be used from the command line.

# See also
See also below for *"SSharing Pro"*. <br>
[*"SSharing Pro"* Official Page](https://www.sfellow.co.jp/EN/product/SSharing/)

# Detail
*"SSharing Pro"* is an application that runs on Windows. <br>
It will be installed in `C:\Program Files\WindowsApps`, but if you try to run an application in this folder on the command line, you will not be able to specify the EXE file directly. <br>
There are the following restrictions when running from the command line:

1. Long command <br>
When running from the command line, you must type: <br>
This is a very long and annoying command. <br>
`start shell:AppsFolder\PackageFamilyName!ApplicationId`<br>
Note : The "PackageFamilyName" and "ApplicationId" are different for each application.

1. The current directory is fixed <br>
The current directory will always be `C:\WINDOWS\system32`. For those who have used the command line until now, this is a difficult environment to use.

1. Do not wait for processing to complete <br>
If you run it in a batch file, proceed to the next step without waiting for the process to complete. Even if you create a batch file that copies the shared file after share, it will try to copy the shared file before the share process is finished. This will not copy the shared files successfully. This drastically reduces the effectiveness of the batch file.

We have prepared a PowerShell script `SSharing.ps1` to solve these problems.

# Special options
The above 2 and 3 cannot be solved only by scripts and batch files. *"SSharing Pro"* has special options to deal with these.

### -cur option<br>
This is an option to specify the current directory. <br>
`SSharing.ps1` specifies the directory where the script was executed in the -cur option.

### -event option <br>
This is an option to synchronize with *"SSharing Pro"*. <br>
`SSharing.ps1` doesn't finish processing until *"SSharing Pro"* is complete.<br>
Follow the steps below to synchronize with *"SSharing Pro"*. <br>
The event name "xxx" can be freely selected.

 1. Creating an Event named "xxx".<br>
 1. Creating a Mutex named "xxx_2".<br>
 1. Run *"SSharing Pro"* with the option "-event xxx".<br>
 1. Waiting for Event.<br>
 1. Waiting for Mutex.<br>
 


# How to use "SSharing.ps1"
If you want to share `_ReadMe.txt`, enter the following at the command line:
```
powershell -Command "& './SSharing.ps1'" -cmd -encode -en_n 5 -en_k 3 _ReadMe.txt
```

Note: Place the following files in the current directory and execute. <br>
SSharing.ps1<br>
_ReadMe.txt

# Batch Files
### Base
In the "Base" folder, we have prepared a batch file for each *"SSharing Pro"* option. <br>
If you don't know how to specify the options, copy them from these files and use them.
  
### VariousUses
In the "VariousUses" folder, we have prepared a more advanced batch file according to the purpose.
  
- Daily<br>
Embed the date and time in the output file name. <br>
This is useful if you want to perform a share for daily backup purposes.
    
- Distribute<br>
Share the "Data" folder into three, move one to the `W drive` and the other to the `Y drive`. <br>
You can also retrieve and reconstruct shared files from the `W drive` and `Y drive`.
    
- Drag<br>
Share and reconstruct by dragging to a batch file.

- Folder<br>
Share and reconstruct specific folders by double-clicking on the batch file.

# Lisence
MIT License
