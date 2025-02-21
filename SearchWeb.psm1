function Search-Web {
    <#
    .SYNOPSIS
    Use powershell to search the web from the terminal.
.DESCRIPTION
Search the web from the terminal
.PARAMETER Query
Search query string.
.PARAMETER Engine
Which search engine to use to web search. Current choices are brave, duckduckgo

.NOTES
To add to startup script.
#>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, Position = 0, HelpMessage = "Search query string.")]
        [Alias('Q')]
        [ValidateNotNullOrEmpty()]
        [string]$Query,

        [Parameter(Position = 1, HelpMessage = "Which search engine to use")]
        [ValidateSet("duckduckgo", "brave")]
        [string] $Engine = "duckduckgo"
    )

    # Encode the query string properly.
    $encodedQuery = [System.Web.HttpUtility]::UrlEncode($Query)

    Write-Verbose "`$encodedQuery=$encodedQuery"

    if ($Engine -eq "brave") {
        $url = "https://search.brave.com/search?q=$encodedQuery"
    }
    else {
        $url = "https://duckduckgo.com/?q=$encodedQuery"
    }
    <#
    switch ($Engine) {
        "duckduckgo" {
        }
        "brave" {}
        default {}
    }
#>

    Write-Verbose "`$url=$url"

    Start-Process $url

}

Export-ModuleMember -Function @("Search-Web")

