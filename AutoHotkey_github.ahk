; IMPORTANT INFO ABOUT GETTING STARTED: Lines that start with a
; semicolon, such as this one, are comments.  They are not executed.

; This script has a special filename and path because it is automatically
; launched when you run the program directly.  Also, any text file whose
; name ends in .ahk is associated with the program, which means that it
; can be launched simply by double-clicking it.  You can have as many .ahk
; files as you want, located in any folder.  You can also run more than
; one .ahk file simultaneously and each will get its own tray icon.

; SAMPLE HOTKEYS: Below are two sample hotkeys.  The first is Win+Z and it
; launches a web site in the default browser.  The second is Control+Alt+N
; and it launches a new Notepad window (or activates an existing one).  To
; try out these hotkeys, run AutoHotkey again, which will load this file.

#z::Run www.autohotkey.com

; Note: From now on whenever you run AutoHotkey directly, this script
; will be loaded.  So feel free to customize it to suit your needs.

; Please read the QUICK-START TUTORIAL near the top of the help file.
; It explains how to perform common automation tasks such as sending
; keystrokes and mouse clicks.  It also explains more about hotkeys.

; ====MY STUFF====
; Changing default trigger characters to tab and space only
	#Hotstring b EndChars  `t

; Customer Portal URL
	:r:;sl::https://control.softlayer.com/

; Signature - *Update it to your name*
	::;sig::
	SendInput,
	(
	Thank you,
	
	YourNameHere
	Customer Support Technician
	IBM Bluemix Cloud (SoftLayer)
	)
	Return


; Generic "hello" for tickets.  Leaves cursor between the hello and your signature so you can start typing or paste your reply.  [[[Be sure to update the signature to your name]]]
	::;hello::
	SendInput, Hello,
	SendInput, {Enter 4}
	(
	Thank you,
	
	YourNameHere
	Customer Support Technician
	IBM Bluemix Cloud (SoftLayer)
	)
	SendInput, {Up 6}
	Return

; Personalized ticket hello.  Takes clipboard contents (customer first name) and pastes it into the "hello" portion and trims any trailing spaces and then adds the sig.  Also leaves the cursor in the middle of the reply so you can paste your reply  [[[Be sure to update the signature to your name]]]
	:*:;helloname::
	name := Trim(clipboard," `t`r`n")
	SendInput % "Hello " name ","
	SendInput, {Enter 4}
	(
	Thank you,
	
	YourNameHere
	Customer Support Technician
	IBM Bluemix Cloud (SoftLayer)
	)
	SendInput, {Up 6}
	Return


; ===Chat replies===
	::;is::Is there anything else I may assist you with?
	::;one::One moment while I research this please.
	::;inactive::This chat will be closed due to inactivity.  If you need further assistance please re-enter our live chat via http://www.softlayer.com/ using the live chat tab.
	::;close::Was there anything else I may assist you with? Do you feel that I've done everything I can to address your concerns today?
	::;verify::In order to access your server and continue troubleshooting, can you answer the following security question please. 
	::;standby::Please stand by and thank you for your patience.

; ===Other replies===
; Ask cust if they have any other questions
	:*:;if::If you have any further questions please let us know and we'll be happy to assist.

; Sorry
	::;sorry::I apologize for any inconvenience this has caused.

; Explain how to update their password.
	::;uppass::Please update your server password by logging into your customer portal and going to Devices > Device List > clicking on the Device name > clicking on the Passwords tab and updating the password to the current version.



; alt+m - "hotkey" for opening verse mail url in chrome.  [[[Edit the file location of chrome on your comp as needed!]]]
	!m::
	Run "C:\Users\YourCompLogin\AppData\Local\Google\Chrome\Application\chrome.exe" 		"https://mail.notes.na.collabserv.com/verse"
	Return

; alt+i - "hotkey" for opening minimal layout IMS ticket group in new tab [[[Edit the file location of chrome on your comp as needed!]]] 
	!i::
	Run "C:\Users\YourCompLogin\AppData\Local\Google\Chrome\Application\chrome.exe" 		"https://internal.softlayer.com/Dashboard/ticketGroup?layout=minimal"
	Return

; alt+y - Open assigned and yellow tickets in new chrome tab. [[[Edit the file location of chrome on your comp as needed!]]]
	!y::
	Run "C:\Users\YourCompLogin\AppData\Local\Google\Chrome\Application\chrome.exe" "https://internal.softlayer.com/Ticket/ticketSearch?data[Tickets][topSearch][hideAutoClose]=1&data[Tickets][topSearch][searchField]=employee&data[Tickets][topSearch][searchContent]=YourCompLogin&data[Tickets][topSearch][searchStatus]=yellow&data[Tickets][topSearch][supportClassification]=ALL&data[Tickets][topSearch][sortDirection]=ASC&layout=minimal"
	Return

; alt+n - Open new and yellow support tickets from IMS in new chrome tab. [[[Edit the file location of chrome on your comp as needed!]]]
	!n::
	Run "C:\Users\YourCompLogin\AppData\Local\Google\Chrome\Application\chrome.exe" 	"https://internal.softlayer.com/Ticket/ticketSearch?data[Tickets][topSearch][hideAutoClose]=1&data[Tickets][topSearch][searchField]=department&data[Tickets][topSearch][searchContent]=Support&data[Tickets][topSearch][searchStatus]=yellow&data[Tickets][topSearch][supportClassification]=ALL&data[Tickets][topSearch][sortField]=modifyDate&data[Tickets][topSearch][sortDirection]=ASC&layout=minimal"
	Return


; alt+t - Open my assigned tix in a new chrome tab.  Useful to see which have AC7 or need to be unassigned at the end of a shift [[[Edit the file location of chrome on your comp as needed!]]]
	!t::
	Run "C:\Users\YourCompLogin\AppData\Local\Google\Chrome\Application\chrome.exe" 		"https://internal.softlayer.com/Ticket/ticketSearch?data[Tickets][topSearch][searchField]=employee&data[Tickets][topSearch][searchContent]=YourCompLogin&data[Tickets][topSearch][searchStatus]=1004&data[Tickets][topSearch][supportClassification]=ALL&data[Tickets][topSearch][sortDirection]=ASC&layout=minimal"
	Return


; ¯\_(:D)_/¯
	::;ehh::
	Send {U+00AF}
	SendRaw \_(
	Send {U+30C4}
	SendRaw )_/
	Send {U+00AF}
	Return

; Domain reseller credits - Copy the customers domain username into clipboard and this will paste it into the reply and leave your cursor next the $AMOUNT so you can update it to the amount they added.  [[[Be sure to update the signature to your name]]]
	::;credits::
	SendInput, Hello,
	SendInput, {Enter 2}
	(
	Your credit of $AMOUNT has been added to your reseller account with the username: %clipboard%. If you have any further questions please let us know and we'll be happy to assist.

	Thank you,

	YourNameHere
	Customer Support Technician
	IBM Bluemix Cloud (SoftLayer)
	)
	SendInput, {Home}
	SendInput, {Up 8}
	SendInput, ^{Right 3}
	SendInput, +{Right 6}
	Return

; Auto-close confirmation for tickets
	::;ac7::This ticket will be set to auto-close in one week.  If you have any further questions please let us know and we'll be happy to assist.

; Ctrl+Alt+p  Run hou02 shelladmin in Putty  [[[Update this to your putty location and session name]]]
	^!p::
	Run "C:\Program Files (x86)\PuTTY\putty.exe" -load "shelladminhou0201"
	Return

; Ctrl+Alt+t  Run tsstesting.com root in Putty  [[[Update this to your putty location and session name]]]
	^!t::
	Run "C:\Program Files (x86)\PuTTY\putty.exe" -load "YourCompLogin.tsstesting.com - root"
	Return

; Ctrl+Alt+r  Run RDP JumpBox  [[[Update this to your RDP location and session name]]]
	^!r::
	Run "C:\Windows\System32\mstsc.exe" /v:Winadmindal1001
	Return

; Change vim colorscheme [[[For any vim users that want to know how to update the color scheme to a color more readable than dark blue]]]
	:rb:;colo::colo desert

; Alt+a - Snippet - To use this make a title for the section you want to section off like "SHELL FSCK" and hightlight it.  This will take the clipboard contents and create a section with that title and you can paste the contents you need to section off from there.
	!=::
	Send ^c
	snippet := "===== ^v ====="
	SendInput % snippet
	Send {Enter 3}
	SendInput % snippet
	Send {Up 1}
	Return
	
; Security question  - Expects that you have copied a security question and pastes it after asking them to answer the security question.
	::;security:: In order to disclose this information can you please provide the answer to the following security question?  ^v

; Trello user story boilerplate
	::;story::
	Send,
	(
		AS A: 

		I NEED: 
 
		SO THAT: 
	)
	Send {Up 4}
	Send {Space}
	Return

; KVM paste - If you want need to "paste" something into KVM and can't due to the keyboard you can replace this gibberish with, for example a password, and use the ahk to write it out for you instead of typing it out.
	:*r:;kvm::fsdkjfldskjflj


; View link
	::;view::
	SendInput, https://internal.softlayer.com/Ticket/ticketPreview/%clipboard%
	Return