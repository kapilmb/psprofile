# Set the prompt
Function Get-Prompt
{
    $sb = [System.Text.StringBuilder]::new()
    $sb.Append([Environment]::NewLine)
    $sb.Append("{0}" -f $pwd.Path)
    $sb.Append([Environment]::NewLine)
    $sb.Append("PS> ")
    $sb.ToString()
}

$prompFunc = Get-Item -Path Function:\Get-Prompt
Set-Item -Path Function:\prompt -Value $prompFunc
Remove-Item -Path Function:\Get-Prompt
Remove-Item -Path Function:\Get-Prompt1

# Sets the mode to emacs
Set-PSReadlineOption -EditMode Emacs