# SearchWeb

Search the web from the terminal using Powershell.

## What is it

A super simple powershell module which contains a function that can be run from the terminal. Executing the function will use the `Start-Process` cmdlet on a url string which will open the default browser on the url.
Specifically uses `duckduckgo.com` as the search engine but can be configured to use a different one.

## How to use it

`Import-Module ./SearchWeb.psd1`

Then simply use the function like so - `Search-Web -Query "funny dogs"`

## Other notes

Don't worry about whether the input is properly encoded. It uses the UrlEncode function from the `System.Web.HttpUtility` dotnet class which encodes the string into proper characters. Feel free to add punctuation or spaces to your search query and it will process just the same.

