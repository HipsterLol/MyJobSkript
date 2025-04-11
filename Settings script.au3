#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=icon.ico
#AutoIt3Wrapper_Res_Comment=Приложение настройки Windows
#AutoIt3Wrapper_Res_Description=Приложение настройки Windows
#AutoIt3Wrapper_Res_Fileversion=2.0.0.0
#AutoIt3Wrapper_Res_ProductName=Settings script
#AutoIt3Wrapper_Res_ProductVersion=2.0.0.0
#AutoIt3Wrapper_Res_LegalCopyright=© Likijihy 2025
#AutoIt3Wrapper_Res_Language=1049
#AutoIt3Wrapper_Res_requestedExecutionLevel=requireAdministrator
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

#include <GUIConstantsEx.au3>
#include <ButtonConstants.au3>


;  Create the main window
Local $mainWindow = GUICreate('"Сборник скриптов для настройки ПК" by Likijihy', 560,200)


;  Create an inscription and stylize it
local $label = GUICtrlCreateLabel("Для выполнения команды нажмите на одну из кнопок ниже:", 30, 20, 1000)

GUICtrlSetFont($label, 14, 700, 0, "Times New Roman")


;  Create and add buttons

local $arrayBtnText[4] = ["Установить Активацию NumPad'a при запуске Windows", "Установить Отключение авторизации после выхода из спящего режима", "Установить Фикс ошибки принтера", "Отключить навсегда обновления Windows 10"]
local $arrayBtnID[UBound($arrayBtnText)]

for $i = 0 to UBound($arrayBtnText) - 1
	$arrayBtnID[$i] = GUICtrlCreateButton($i + 1 & ". " & $arrayBtnText[$i], 30, 60 + $i * 30)
Next

;  Create the main window
GUISetState(@SW_SHOW, $mainWindow)

; Main event loop
While 1
    Switch GUIGetMsg()
        Case $GUI_EVENT_CLOSE  ;  Closing a window
            ExitLoop

        Case $arrayBtnID[0]  ;    First button event
			RegWrite("HKEY_USERS\Control Panel\Keyboard", "InitialKeyboardIndicators", "REG_SZ", "2")
			RegWrite("HKEY_CURENT_USERS\Control Panel\Keyboard", "InitialKeyboardIndicators", "REG_SZ", "2")
			MsgBox(64, "Успех", "Скрипт успешно установлен!")

        Case $arrayBtnID[1]  ;  Second button event
			RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51", "DCSettingIndex", "REG_DWORD", "0x00000000")
			RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51", "ACSettingIndex", "REG_DWORD", "0x00000000")
			RegWrite("HKEY_CURENT_USERS\Control Panel\Desktop", "DelayLockInterval", "REG_DWORD", "0x00000000")
			RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System", "AllowDomainDelayLock", "REG_DWORD", "0x00000001")
			MsgBox(64, "Успех", "Скрипт успешно установлен!")

        Case $arrayBtnID[2]  ;  Third button event
			RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Print", "RpcAuthnLevelPrivacyEnabled", "REG_DWORD", "0x00000000")
			MsgBox(64, "Успех", "Скрипт успешно установлен!")

        Case $arrayBtnID[3]  ;  Fourth button event
			RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU", "NoAutoUpdate", "REG_DWORD", "0x00000001")
			MsgBox(64, "Успех", "Скрипт успешно установлен!")

	EndSwitch
	Sleep(500)S
WEnd

GUIDelete($mainWindow)  ; Kill GUI
