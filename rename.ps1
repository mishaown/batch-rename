# USA DATE TIME
# --------------------------------------------
$shell = New-Object -ComObject shell.application
Get-ChildItem | ForEach{
$folder = $shell.NameSpace($_.DirectoryName)
$RawDate = ($folder.GetDetailsOf($folder.ParseName($_.Name),12) -Replace "[^\w /:]")
$datetime = [DateTime]($RawDate)
$DateTaken = $datetime.ToString("yyyy-MM-dd HH.mm")
Rename-Item $_.FullName ($DateTaken + $_.Extension)}

# UK DATE TIME
# --------------------------------------------------
$shell = New-Object -ComObject shell.application
$ukCulture = [Globalization.CultureInfo]'en-GB'
Get-ChildItem | ForEach{
$folder = $shell.NameSpace($_.DirectoryName)
$RawDate = ($folder.GetDetailsOf($folder.ParseName($_.Name),12) -Replace "[^\w /:]")
$datetime = [DateTime]::Parse($RawDate,$ukCulture) 
$DateTaken = $datetime.ToString("yyyy-MM-dd HH.mm")
Rename-Item $_.FullName ($DateTaken + $_.Extension)}

# Multiple File US TIMEZONE
# --------------------------------------------------------
$shell = New-Object -ComObject shell.application
Get-ChildItem | ForEach{
$folderpath = $_.DirectoryName
$folder = $shell.NameSpace($_.DirectoryName)
$RawDate = ($folder.GetDetailsOf($folder.ParseName($_.Name),12) -Replace "[^\w /:]")
$datetime = [DateTime]($RawDate)
$DateTaken = $datetime.ToString("yyyy-MM-dd HH.mm")
$number = 1
$newpath = $folderpath + "\" + $DateTaken + "_" + $number + ".jpg"
If(Test-Path -Path $newpath){
while ((Test-Path -Path $newpath) -eq $true)
    {$newpath = Join-Path $folderpath ($DateTaken + "_" + $number + $_.Extension)
     $number+=1}
     Rename-Item $_.pspath -NewName $newpath}
else {Rename-Item $_.pspath -NewName $newpath} }

# Multiple File UK TIMEZONE
# --------------------------------------------------------
$shell = New-Object -ComObject shell.application
$ukCulture = [Globalization.CultureInfo]'en-GB'
Get-ChildItem | ForEach{
$folderpath = $_.DirectoryName
$folder = $shell.NameSpace($_.DirectoryName)
$RawDate = ($folder.GetDetailsOf($folder.ParseName($_.Name),12) -Replace "[^\w /:]")
$datetime = [DateTime]::Parse($RawDate,$ukCulture)
$DateTaken = $datetime.ToString("yyyy-MM-dd HH.mm")
$number = 1
$newpath = $folderpath + "\" + $DateTaken + "_" + $number + ".jpg"
If(Test-Path -Path $newpath){
while ((Test-Path -Path $newpath) -eq $true)
    {$newpath = Join-Path $folderpath ($DateTaken + "_" + $number + $_.Extension)
     $number+=1}
     Rename-Item $_.pspath -NewName $newpath}
else {Rename-Item $_.pspath -NewName $newpath} }