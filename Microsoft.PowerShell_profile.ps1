# Oh My Posh Setup
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\catppuccin_mocha.omp.json" | Invoke-Expression

# zoxide (Ctrl+D for Directory Fuzzy Search and `z <folder>` to jump anywhere)
Invoke-Expression (& { (zoxide init powershell | Out-String) })

# PSReadLine setup
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle InlineView
Set-PSReadLineOption -EditMode Windows
Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadLineOption -MaximumHistoryCount 10000
Set-PSReadLineOption -HistoryNoDuplicates
Set-PSReadLineKeyHandler -Key UpArrow   -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-PSReadLineKeyHandler -Key Tab       -Function MenuComplete
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteCharOrExit

# fzf (Ctrl+T for Files and Ctrl+R for History Fuzzy Search)
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'

# Modules
Import-Module posh-git
Import-Module Terminal-Icons
Import-Module CompletionPredictor
Import-Module PSFzf

# Aliases
Set-Alias ll eza
Set-Alias cat bat -Option AllScope
function .. { Set-Location .. }
function ... { Set-Location ../.. }
function gs { git status }
function which($name) { Get-Command $name | Select-Object -ExpandProperty Definition }
