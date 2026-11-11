# install.ps1 - liga este repositorio ao ~/.claude
# Uso: powershell -ExecutionPolicy Bypass -File .\install.ps1
# Pode rodar quantas vezes quiser (idempotente).

$repo   = $PSScriptRoot
$claude = Join-Path $HOME ".claude"
New-Item -ItemType Directory -Force $claude | Out-Null

# Pastas: viram "junctions" (atalhos de pasta que nao precisam de admin).
# Editar em ~/.claude/rules ou no repo da no mesmo, porque e a mesma pasta.
foreach ($dir in "rules", "agents", "skills", "commands") {
    $source = Join-Path $repo $dir
    $target = Join-Path $claude $dir
    New-Item -ItemType Directory -Force $source | Out-Null

    if (Test-Path $target) {
        $item = Get-Item $target -Force
        if ($item.LinkType -eq "Junction") {
            Write-Host "Ja ligado: $target"
            continue
        }
        # Pasta real existente: guarda um backup em vez de apagar
        $backup = "$target.backup-$(Get-Date -Format yyyyMMdd-HHmmss)"
        Move-Item $target $backup
        Write-Host "Backup criado: $backup" -ForegroundColor Yellow
    }

    New-Item -ItemType Junction -Path $target -Target $source | Out-Null
    Write-Host "Ligado: $target -> $source" -ForegroundColor Green
}

# Arquivos soltos: sao copiados (edite no repo e rode o script de novo)
foreach ($file in "CLAUDE.md") {
    $source = Join-Path $repo $file
    $target = Join-Path $claude $file
    if (-not (Test-Path $source)) { continue }

    if ((Test-Path $target) -and ((Get-FileHash $source).Hash -ne (Get-FileHash $target).Hash)) {
        $backup = "$target.backup-$(Get-Date -Format yyyyMMdd-HHmmss)"
        Copy-Item $target $backup
        Write-Host "Backup criado: $backup" -ForegroundColor Yellow
    }
    Copy-Item $source $target -Force
    Write-Host "Copiado: $file" -ForegroundColor Green
}

Write-Host "`nPronto. Abra uma sessao nova do Claude Code." -ForegroundColor Cyan
