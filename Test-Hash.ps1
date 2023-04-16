param (
    [Parameter(Mandatory=$true)][String]$fileDir,
    [Parameter(Mandatory=$true)][String]$hash,
    [String]$algorithm = "SHA256"
)

[Bool]$doesMatch = $false

<# Get the file hashes
    Get-FileHash will return the hash of the specified file using the supplied algorithm.
    The supported algorithms include:
        - SHA1
        - SHA256 (Default)
        - SHA384
        - SHA512
        - MD5
#>

$file = Get-ChildItem -Path $fileDir
[Microsoft.PowerShell.Commands.FileHashInfo] $fileHashInfo = Get-FileHash $file -Algorithm $algorithm

# Extract the hash info for message output purproses
[String] $fileHash = $fileHashInfo.Hash

if ( $fileHash -eq $hash ) { $doesMatch = $true }

Write-Output "Does Source File: $file Hash: $fileHash match $hash ? $doesMatch"