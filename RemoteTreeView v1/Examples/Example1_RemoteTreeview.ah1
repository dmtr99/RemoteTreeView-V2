#NoEnv
#SingleInstance force
SetBatchLines -1
ListLines Off
SendMode Input
SetWorkingDir %A_ScriptDir%
#Requires AutoHotkey v1.1.33+

; Autoexecute
#Include ..\RemoteTreeView.ah1
	
	Run Explore C:\

	WinId := WinActive("A")
	ControlGet TVId, Hwnd, , SysTreeView321, % "ahk_id " WinId
	MyTV := new RemoteTreeView(TVId)
	msgbox, % MyTV.GetControlContent()
	MyTV.SetSelectionByText("Documents",true,2)
	hItem = 0  ; Causes the loop's first iteration to start the search at the top of the tree.
	Data := ""
	Loop
	{
		hItem := MyTV.GetNext(hItem, "Full")
		if not hItem  ; No more items in tree.
			break
		ItemText := MyTV.GetText(hItem)
		Data .=  hItem "`t" ItemText "`n"
		; MsgBox The next Item is %hItem%, whose text is "%ItemText%".
	}
	MsgBox % Data
return


