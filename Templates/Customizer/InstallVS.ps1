write-host 'Install VS Pro'
New-Item -Path "C:\" -Name vstempinstall -ItemType Directory #-ErrorAction SilentlyContinue
$LocalPath = 'C:\vstempinstall'
$VSProURL="https://aka.ms/vs/17/release/vs_professional.exe"
$installerFile="vs_professional.exe"
$outputPath = $LocalPath + '\' + $installerFile
Invoke-WebRequest -Uri $VSProURL -OutFile $outputPath
#set-Location $LocalPath
#$workloadArgument = @(
#   
#    '--add Microsoft.Net.Component.4.7.1.SDK'
#    '--add Microsoft.VisualStudio.Component.Windows10SDK.17134'
#    '--add Microsoft.Net.Component.4.7.1.TargetingPack'
#) 
$workloadArgument = @(
    '--add Microsoft.VisualStudio.Component.Roslyn.Compiler'
) 

$optionsAddLayout          = [string]::Join(" ", $workloadArgument )
$optionsQuiet              = "--quiet"
#$optionsLayout             = "--layout $downloadPath"
#$optionsIncludeRecommended = "--includeRecommended"

$vsOptions = @(
    $optionsAddLayout,
    $optionsQuiet
)

Start-Process -FilePath $outputPath -ArgumentList $vsOptions -Wait

Remove-item $LocalPath -Force -Verbose -Recurse