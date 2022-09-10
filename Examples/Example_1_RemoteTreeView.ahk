#Requires AutoHotkey v2.0-beta
#SingleInstance force

#Include ..\RemoteTreeView.ahk

TargetFolder := "Documents"

Run("Explore C:\")
Sleep(1000)
WinWaitActive("ahk_class CabinetWClass", , 10)
if !WinWaitActive("ahk_class CabinetWClass", , 10)
    Exit

WinId := WinActive("A")
TVId := ControlGetHwnd("SysTreeView321", "ahk_id " WinId)
MyTV := RemoteTreeView(TVId)
MyTV.Wait()
; Display the content of the treeview
MsgBox("MyTV.GetControlContent():`n`n" MyTV.GetControlContent())

; Set selection to Documents and activate it
if MyTV.SetSelectionByText(TargetFolder){
    MsgBox("The folder [" TargetFolder "] is now selected`nThis script will exit")
} else {
    MsgBox("The folder [" TargetFolder "] was not found`nThis script will exit")
}

return

Escape::{
    ExitApp
}