#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

F12::
    Suspend, Off
    Reload

Return

`::
    Suspend, Toggle
    
    If (A_IsSuspended == False)
    {
        MsgBox, Script ON
    }
    Else
    {
        MsgBox, Script OFF
    }

Return

looping := False
salvaging := False
dropping := False

XButton1::
    looping := !looping
    
Return

XButton1 Up::
    While (looping == True)
    {
        Send, {a}
        Send, {s}
        Send, {d}
        Send, {f}

        If (GetKeyState("XButton2", "P") == 1)
        {
            Send, {ShiftUp}
            Click
        }
        Else
        {
            Send, {ShiftDown}
        }

        Sleep, 60
    }

    Send, {ShiftUp}

Return

MButton::
    Send, {t}
    Send, {c}

Return

XButton2::
    If (looping == False){
        salvaging := True
        
        While (salvaging == True)
        {
            Send, {Click Left}
            Sleep, 100
            Send, {Enter}
        }

    }

Return

XButton2 Up::
    salvaging := False

Return

2::
    dropping := True

    While (dropping == True)
    {
        Send, {Click Right}
    }

Return

2 Up::
    dropping := False

Return