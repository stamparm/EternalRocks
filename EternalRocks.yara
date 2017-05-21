rule EternalRocks_UpdateInstaller
{
    strings:
        $s0 = "C:\\Users\\tmc\\Documents\\" ascii
        $s1 = "C:\\Users\\tmc\\Documents\\" wide
        $s2 = "20b70e57-1c2e-4de9-99e5-69f369006912" fullword wide
        $s3 = "{8F6F0AC4-B9A1-45fd-A8CF-727220DE8F}" fullword wide
        $s4 = "ubgdgno5eswkhmpy.onion" fullword wide
        $s5 = "Wrote SVCHOST to File System" fullword wide
        $s6 = "Going to copy SharpZLib now" fullword wide
        $s7 = "Already Copied Task Scheduler" fullword wide
        $s8 = "required.glo" fullword wide
        $s9 = "\\Tor\\tor.exe \"Microsoft Update Installer\" ENABLE" fullword wide
        $s10 = "C:\\Program Files\\Microsoft Updates" fullword wide
        $s11 = "MicroBotMassiveNet" fullword ascii
   
    condition:
        uint16(0) == 0x5a4d and 2 of them
}

rule EternalRocks_TorUnzip
{
    strings:
        $s0 = "c:\\Program Files\\Microsoft Updates\\temp\\tor.zip" wide
        $s1 = "C:\\Users\\tmc\\Documents\\TorUnzip\\Project1.vbp" wide
        $s2 = "TorUnzip" fullword ascii
        $s3 = "WindowsUnZip" fullword ascii
   
    condition:
        uint16(0) == 0x5a4d and 3 of them
}

rule EternalRocks_svchost
{
    strings:
        $s0 = "Microsoft.Win32.TaskScheduler" fullword ascii
        $s1 = "svchost.exe" fullword ascii
        $s2 = "svchost.exe" fullword wide
        $s3 = "ConfusedByAttribute" fullword ascii
        $s4 = "ICSharpCode.SharpZipLib" fullword ascii
        $s5 = "Microsoft 2017" fullword ascii
    condition:
        uint16(0) == 0x5a4d and all of them
}

rule EternalRocks_taskhost_final
{
    strings:
        $s0 = "EternalRocks" fullword wide
        $s1 = "EternalRocks" fullword ascii
        $s2 = "20D5CCEE9C91A1E61F72F46FA117B93FB006DB51" fullword ascii
        $s5 = "4086658a-cbbb-11cf-b604-00c04fd8d565" fullword ascii
   
    condition:
        uint16(0) == 0x5a4d and 3 of them
}

rule EternalRocks_shadowbrokers
{
    strings:
        $s0 = "eternalblue" fullword ascii
        $s1 = "eternalchampion" fullword ascii
        $s2 = "eternalromance" fullword ascii
        $s3 = "eternalsynergy" fullword ascii
        $s4 = "shellcode" ascii
        $s5 = ".inconfig.xml" ascii

    condition:
        uint16(0) == 0x4b50 and all of them
}
