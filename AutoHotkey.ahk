;Filemaker and Editor HotKey Actions
;Replicates QuickCursor on Mac OSX



;Win-e 
#e::
Clip = %Clipboard%
Clipboard =
FName = FMPro_Clip_001.fmfn
FileDelete, C:\Users\rkantor\Documents\RJK\%FName%
Send, ^a
KeyWait, a
Send, ^c
ClipWait
Loop, parse, clipboard, `n, `r  ; Specifying `n prior to `r allows both Windows and Unix files to be parsed.
{
    FileAppend, %A_LoopField% `n, C:\Users\rkantor\Documents\RJK\%FName%
    
}

Run, C:\Program Files (x86)\IDM Computer Solutions\UltraEdit\Uedit32.exe C:\Users\rkantor\Documents\RJK\%FName%
Clipboard = %Clip%
return

;Win-f
#f::
Clip = %Clipboard%
Clipboard =
Send, ^s
Send, ^a
KeyWait, a
Send, ^c
ClipWait
Send, !x

IfWinExist, Edit Custom Function
{
  WinActivate, Edit Custom Function
  ControlFocus, Edit3
  Send, ^a
  Keywait, a
  Send, ^v
  Sleep 100
}


IfWinExist, Specify Calculation

{
  WinActivate, Specify Calculation
  ControlFocus, Edit1
  Send, ^a
  Keywait, a
  Send, ^v
  Sleep 100
}

IfWinExist, Edit Expression

{
  WinActivate, Edit Expression
  ControlFocus, Edit1
  Send, ^a
  Keywait, a
  Send, ^v
  Sleep 100
}
Clipboard = %Clip%
return



; SAMPLE HOTKEYS: Below are two sample hotkeys.  The first is Win+Z and it
; launches a web site in the default browser.  The second is Control+Alt+N
; and it launches a new Notepad window (or activates an existing one).  To
; try out these hotkeys, run AutoHotkey again, which will load this file.

#z::Run www.autohotkey.com

^!n::
IfWinExist Untitled - Notepad
	WinActivate
else
	Run Notepad
return

