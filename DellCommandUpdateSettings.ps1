$path = "C:\temp"
If(!(test-path -PathType container $path))
{
      New-Item -ItemType Directory -Path $path
}

$url = "http://ibschoolsnz.org.nz/DellCommandUpdateSettings.xml"
$outpath = "c:/temp/DellCommandUpdateSettings.xml"
Invoke-WebRequest -Uri $url -OutFile $outpath

$wc = New-Object System.Net.WebClient
$wc.DownloadFile($url, $outpath)

CD 'C:\Program Files\Dell\CommandUpdate'
.\dcu-cli.exe /configure -importSettings=C:\temp\DellCommandUpdateSettings.xml 

