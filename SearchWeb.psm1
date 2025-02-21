function Search-Web {
    <#
    .SYNOPSIS
    Use powershell to search the web from the terminal.
.DESCRIPTION
Search the web from the terminal
.PARAMETER Query
Search query string.
.NOTES
To add to startup script.
#>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, HelpMessage = "Search query string.")]
        [ValidateNotNullOrEmpty()]
        [string]$Query
    )

    # Encode the query string properly.
    $encodedQuery = [System.Web.HttpUtility]::UrlEncode($Query)

    Write-Verbose "`$encodedQuery=$encodedQuery"

    $url = "https://duckduckgo.com/?q=$encodedQuery"

    Write-Verbose "`$url=$url"

    Start-Process $url

}

Export-ModuleMember -Function @("Search-Web")

