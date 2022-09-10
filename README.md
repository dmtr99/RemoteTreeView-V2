# RemoteTreeView-V2
Class to access data from external TreeView Control, Written in V2

The most interesting methods are:

MyTV.GetControlContent()                                         
=> returns the treeViewContent with tabs for the children

MyTV.SetSelectionByText(text, defaultAction := true, index := 1)  
=> selects the item with that text and presses Enter
