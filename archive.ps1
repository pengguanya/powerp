$source = "C:\Users\pengg3\Documents" 
$out = "G:\My Drive\peng\learning\programming\powershell\testout"
$groups = Get-ChildItem -Recurse $source | Where { ! $_.PSIsContainer } | group {"{0:yyyy}_{0:MM}" -f $_.CreationTime} 

ForEach ($group in $groups) {
    ForEach($file in $group.Group){
        & "C:\Program Files\7-Zip\7z.exe" u -mx9 -t7z -m0=lzma2 (Join-Path $out ($group.Name + ".7z")) $file.FullName
    }
}
