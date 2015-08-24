#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.12.0
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
#include <IE.au3>

Global $ie = _IECreate("http://0.facebook.com");
Global $attempt = 2

Global $username[$attempt]
Global $password[$attempt]

$username[0] = "mahmudkuet11@gmail.com"
$username[1] = "angel.brishty@yahoo.com"

$password[0] = ""
$password[1] = ""

Do

   $attempt -= 1

   Local $email = _IEGetObjByName($ie, "email");
   _IEFormElementSetValue($email, $username[$attempt]);

   Local $pass = _IEGetObjByName($ie, "pass");
   _IEFormElementSetValue($pass, $password[$attempt]);

   Local $login = _IEGetObjByName($ie, "login");
   _IEAction($login, "click");

   _IELoadWait($ie);check if there is any problem without this satatement

   _IENavigate($ie, "https://0.facebook.com/photo.php?fbid=736194079769587&id=100001370046855&set=a.115026041886397.27030.100001370046855&refid=17&_ft_&__tn__=E");
   _IELoadWait($ie);

   Local $like_btn = getObjByClass($ie, "span", "bc", "Like");
   _IEAction($like_btn, "click");
   _IELoadWait($ie);
   Sleep(5000)

   _IENavigate($ie, "https://0.facebook.com");
   _IELoadWait($ie);
   Sleep(1000)

   Local $logout_btn = getObjByClass($ie, "a", "fi", ".*Log Out.*");
   _IEAction($logout_btn, "click");
   _IELoadWait($ie);
   Sleep(1000)

   _IENavigate($ie, "https://0.facebook.com");
   _IELoadWait($ie);

   Sleep(1000);

Until $attempt = 0


Func getObjByClass($ie_arg, $tag_arg, $class_arg, $innerText_arg)
   $tags = $ie_arg.document.GetElementsByTagName($tag_arg);
   for $tag in $tags
	  $class_value = $tag.className;
	  If $class_value = $class_value Then
		 If StringRegExp($tag.innerText, $innerText_arg) Then
			return $tag
		 EndIf
	  EndIf
   Next
EndFunc



