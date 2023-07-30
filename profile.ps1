Set-Alias -Name touch -Value New-Item

function prompt {
	$CmdPromptUser = [Security.Principal.WindowsIdentity]::GetCurrent();
	$CmdPromptCurrentFolder = Split-Path -Path $pwd -Leaf
	$Date = Get-Date -Format 'dddd HH:mm'
	$CurrentGitBranch= &git rev-parse --abbrev-ref HEAD

	 
	$FileCharacter = $([char]::ConvertFromUtf32(0x1F4C1))
	$BranchCharacter = $([char]::ConvertFromUtf32(0x2A1A))
	$UserCharacter = $([char]::ConvertFromUtf32(0x267F))
		
	Write-Host ""
	Write-Host " $UserCharacter$($CmdPromptUser.Name.split("\")[1]) " -BackgroundColor DarkBlue -ForegroundColor White -NoNewline
	
	If ($CmdPromptCurrentFolder -like "*:*") {
		Write-Host " $CmdPromptCurrentFolder "  -ForegroundColor White -BackgroundColor DarkGray -NoNewline
	} else {
		Write-Host " $FileCharacter$CmdPromptCurrentFolder "  -ForegroundColor White -BackgroundColor DarkGray -NoNewline
	}
	
	If ($CurrentGitBranch -notlike " ") {
		Write-Host " $BranchCharacter" -ForegroundColor Yellow -BackgroundColor Green -NoNewline
		Write-Host "$CurrentGitBranch " -ForegroundColor White -BackgroundColor Green -NoNewline
	}
    Write-Host " $date " -ForegroundColor White
    return "> "
}
