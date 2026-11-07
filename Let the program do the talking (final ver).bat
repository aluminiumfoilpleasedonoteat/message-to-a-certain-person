@echo off
chcp 65001 >nul
powershell -NoProfile -ExecutionPolicy Bypass -Command "$s=[IO.File]::ReadAllText('%~f0',[Text.Encoding]::UTF8); Invoke-Expression (($s -split '\r?\n#PS#\r?\n')[1])"
exit /b
#PS#
$from = "YOUR NAME HERE"

[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$Host.UI.RawUI.WindowTitle = "Let the program do the talking"

function Typewrite($text, $delay = 45, $color = "White") {
    foreach ($ch in $text.ToCharArray()) {
        Write-Host -NoNewline $ch -ForegroundColor $color
        Start-Sleep -Milliseconds $delay
    }
}
function Say($text, $delay, $pause, $color = "White") {
    Typewrite ($text + "`n") $delay $color
    Start-Sleep -Milliseconds $pause
}
function Center($text, $delay = 80, $color = "White") {
    $w = $Host.UI.RawUI.WindowSize.Width
    $pad = [Math]::Max(0, [int](($w - $text.Length) / 2))
    Typewrite ((" " * $pad) + $text + "`n") $delay $color
}
function Beep($f, $d) {
    try { [Console]::Beep($f, $d) } catch { }
}
function Finish() {
    Write-Host ""
    Read-Host "(Press Enter to close)" | Out-Null
    exit
}

Clear-Host
Typewrite "Hi, I have something to say$([char]0x2014)just to clear my head and so you actually know.`n"
Start-Sleep -Milliseconds 800
Typewrite "Do you want to read it? (yes/no): "
$a = Read-Host
if ($a -ne "yes") { Typewrite "Okay... maybe next time.`n"; Finish }
Typewrite "Are you sure? There's no going back. (yes/no): "
$a = Read-Host
if ($a -ne "yes") { Typewrite "That's okay. Take your time.`n"; Finish }

Write-Host ""
Start-Sleep -Milliseconds 600
Say "Compiling file..." 25 900 "Cyan"
Say "warning: variable 'excuses' is unused" 25 900 "Yellow"
Say "error: undefined reference to 'saying_it_out_loud" 25 900 "Red"
Say "Build failed. Sending the message regardless." 25 1200 "Green"
Write-Host ""

Typewrite "Loading courage...`n" 40 "DarkGray"
for ($i = 0; $i -le 20; $i++) {
    $pct = $i * 5
    Write-Host -NoNewline ("`r[" + ("#" * $i) + ("-" * (20 - $i)) + "] $pct%") -ForegroundColor Cyan
    Start-Sleep -Milliseconds 120
}
Write-Host ""
Start-Sleep -Milliseconds 900
Clear-Host
Start-Sleep -Milliseconds 500

Say "I know I'm a tsun, yes, I'm fully aware of that, and it's absolute hell for me to express my feelings. Expressing myself felt like showing weakness, but holding it all in just made everything worse lol." 40 1200
Say "Please read it and take it into consideration because CODING IS A REAL TRAGEDY, and i wrote this myself too hehe" 40 1200
Say "So what's the point of all this? It's a confession, obviously." 45 1500
Say "If I'm being completely honest, I do like you. And no, I really hate (I guess?, a strong word if I might say so) the way you go around adding strangers just to look for a lover." 40 1500
Say "I$([char]0x2019)d hate to admit it, it$([char]0x2019)s been driving me crazy in my head for a while, but I do like you." 45 1500 "Magenta"
Beep 880 150
Say "A lot." 140 1800 "Red"
Say "You're the only one who completely captures my thoughts." 55 1500
Say "Not just as a friend." 60 900
Say "Not as a random title." 60 900
Say "I want to be the one by your side." 60 1400 
Say "I don't even care what it's called anymore, I just want to be yours and vice versa." 50 2000

Clear-Host
Start-Sleep -Milliseconds 800
Center "Why do you?" 90 "White"
Start-Sleep -Milliseconds 1500
Center "Because it$([char]0x2019)s you." 100 "Magenta"
Beep 660 200
Start-Sleep -Milliseconds 2500
Clear-Host
Start-Sleep -Milliseconds 600

Say "I like your intelligence." 60 800 "Yellow"
Say "Your personality." 60 800 "Yellow"
Say "Your quirks." 60 800 "Yellow"
Say "Your flaws." 60 800 "Yellow"
Say "Literally everything about you." 70 1500 "Yellow"
Say "That's why you've been my exception for so damn long." 55 1500
Say "I like the way you smile, the way you talk (even if other people find it hard to listen to or triggering, it's cute$([char]0x2014)at least to me)." 45 2000

Write-Host ""
Typewrite "I'm not saying this expecting a guaranteed `"yes`", I just needed to empty my mind and stop overthinking every single second. Take it or leave it.`n"
Write-Host ""
Start-Sleep -Milliseconds 1000
Typewrite "Your answer: " 60 "Cyan"
$reply = Read-Host
Write-Host ""
Start-Sleep -Milliseconds 600
if ($reply.Trim() -eq "") {
    Typewrite "...No rush. Thank you for reading.`n" 60 
} else {
    Typewrite "Noted. Thank you for reading.`n" 60 "Magenta"
}

Finish
