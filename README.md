# claude-setup

Minha configuração global do Claude Code, versionada para ser a mesma em qualquer máquina.

## O que tem aqui

| Caminho | O que é |
| --- | --- |
| `CLAUDE.md` | Instruções globais: como eu trabalho, idioma, ambiente Windows/PowerShell e regras antes de mudar código. |
| `rules/ecc/` | Padrões de código, testes, segurança e performance, separados em `common`, `typescript`, `react` e `web`. |
| `install.ps1` | Script que liga este repositório à pasta `~/.claude`. |

## Instalação (Windows)

```powershell
git clone https://github.com/guilhermesantossousadev/claude-setup.git
cd claude-setup
powershell -ExecutionPolicy Bypass -File .\install.ps1
```

O script:

- cria *junctions* de `rules`, `agents`, `skills` e `commands` dentro de `~/.claude`, apontando para este repositório (não precisa de admin). Editar em qualquer um dos dois lugares altera a mesma pasta;
- copia o `CLAUDE.md` para `~/.claude`;
- faz backup (`*.backup-AAAAMMDD-HHMMSS`) de qualquer pasta ou arquivo que já exista antes de substituir;
- pode ser executado várias vezes sem efeito colateral.

Depois de rodar, abra uma sessão nova do Claude Code.

## O que nunca é versionado

Credenciais, histórico e estado local do Claude Code (`.credentials.json`, `.claude.json`, `settings.local.json`, `projects/`, `todos/` etc.). As regras estão no `.gitignore`.
