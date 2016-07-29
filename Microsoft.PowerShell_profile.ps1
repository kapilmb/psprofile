# Set the prompt
Function Get-Prompt1
{
    $maxPathLength = 16

    $sb = [System.Text.StringBuilder]::new()
    $sb.Append("PS ") | Out-Null
    if ($pwd.Path.Length -gt $maxPathLength)
    {
        $sb.Append([System.IO.Path]::GetPathRoot($pwd)) | Out-Null
        $sb.Append("...") | Out-Null
        $sb.Append([System.IO.Path]::DirectorySeparatorChar) | Out-Null
        $sb.Append([System.IO.Path]::GetFileName($pwd)) | Out-Null
    }
    else
    {
        $sb.Append($pwd.Path) | Out-Null
    }
    $sb.Append("> ") | Out-Null
    $sb.ToString()
}

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