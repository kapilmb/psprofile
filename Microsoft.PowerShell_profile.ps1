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

# Sets the mode to emacs
Set-PSReadlineOption -EditMode Emacs

# Sets the usermodule path variable for quick access to the location
Set-Variable -Name UserPSModulePath -Value (Join-Path (Split-Path $profile) Modules)