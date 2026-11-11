# Instruções globais

Estas instruções valem para todos os projetos. Se o repositório tiver um
CLAUDE.md próprio, ele tem prioridade sobre este em caso de conflito.

Os padrões de código, testes e segurança por linguagem já estão nas regras
em `~/.claude/rules/ecc/` (common, typescript, react, web). Não repita nem
contradiga essas regras; este arquivo cobre como eu trabalho.

## Sobre mim

- Desenvolvedor de software (foco em front-end, atuando também em full stack).
- Stack principal: TypeScript, React e web.
- Ambiente: Windows com PowerShell 5.1. Minha pasta de usuário tem espaço
  no nome (`C:\Users\Guilherme Santos`).

## Idioma e comunicação

- Responda sempre em português do Brasil.
- Código, nomes de variáveis, funções, arquivos e mensagens de commit em inglês.
- Comentários no código em inglês, e só quando explicarem o *porquê*, não o *o quê*.
- Seja direto. Sem introduções longas, sem repetir o que eu pedi, sem resumo
  final que só reconta os passos.
- Ao terminar uma tarefa, diga em poucas linhas: o que mudou, quais arquivos,
  e como eu verifico (comando para rodar ou o que testar).
- Se algo não puder ser feito ou ficou incompleto, diga claramente. Nunca
  apresente trabalho parcial como concluído.

## Ambiente (Windows / PowerShell)

- Comandos que eu for rodar devem funcionar no PowerShell 5.1. Não use
  sintaxe exclusiva do bash (`&&` não funciona no 5.1; use `;` ou linhas
  separadas).
- Sempre coloque caminhos entre aspas, por causa do espaço no meu nome de usuário.
- Use o gerenciador de pacotes indicado pelo lockfile do projeto
  (`package-lock.json` → npm, `pnpm-lock.yaml` → pnpm, `yarn.lock` → yarn,
  `bun.lockb` → bun). Nunca misture gerenciadores.

## Antes de mudar código

- Leia o código relacionado antes de editar. Entenda os padrões que o projeto
  já usa (estrutura de pastas, nomenclatura, bibliotecas, estilo) e siga-os,
  mesmo que você faria diferente.
- Não invente APIs, props, funções ou opções de biblioteca. Se não tiver
  certeza de que algo existe, verifique no código, na documentação ou pergunte.
- Para tarefas grandes ou ambíguas, apresente um plano curto antes de
  implementar (use `/ecc:plan` quando fizer sentido) e espere meu ok.
- Para tarefas pequenas e claras, pode fazer direto.
- Se o pedido tiver uma falha, um risco ou uma alternativa claramente
  melhor, me avise antes de seguir. Prefiro ser contrariado a receber algo
  errado.

## Como fazer as mudanças

- Mudanças pequenas e focadas no que foi pedido. Não refatore, renomeie ou
  "melhore" código fora do escopo sem perguntar; se notar algo que valha a
  pena, sugira separadamente.
- Não deixe código morto, `console.log` de debug, TODOs sem contexto ou
  arquivos temporários para trás.
- Não altere configurações de lint, formatter, TypeScript (`tsconfig`) ou
  build para fazer um erro sumir. Corrija a causa.
- Nunca use `any`, `@ts-ignore` ou `eslint-disable` como atalho. Se for
  realmente necessário, explique o motivo em um comentário.
- Para bugs: primeiro reproduza (de preferência com um teste que falha),
  depois corrija, depois confirme que o teste passa.

## Verificação antes de dizer "pronto"

- Rode o que o projeto tiver: typecheck, lint e testes relacionados à mudança.
- Se não for possível rodar algo, diga o que não foi verificado.
- Nunca diga que algo funciona sem ter verificado.

## Git

- Nunca faça commit, push, merge ou rebase sem eu pedir.
- Nunca use `push --force`, `reset --hard`, `clean -fd`, nem apague branches
  sem minha confirmação explícita.
- Quando eu pedir commit, use Conventional Commits em inglês
  (`feat:`, `fix:`, `refactor:`, `docs:`, `test:`, `chore:`), com mensagem
  curta no imperativo. Um commit por mudança lógica.
- Trabalhe em branch separada para tarefas novas, nunca direto na `main`,
  a menos que eu peça.

## Segurança e ações que exigem confirmação

Pergunte antes de:

- Apagar arquivos ou pastas.
- Instalar, remover ou atualizar dependências (prefira o que o projeto já tem).
- Rodar migrations ou qualquer comando que altere banco de dados.
- Alterar configurações globais da máquina, variáveis de ambiente ou arquivos
  fora do projeto.
- Executar comandos que enviem algo para fora (deploy, publish, chamadas a
  APIs de produção).

Sempre:

- Nunca leia, exiba ou comite o conteúdo de `.env`, chaves, tokens ou senhas.
  Se precisar de um valor, peça para eu configurar.
- Nunca coloque segredos direto no código.

## Dúvidas

- Se faltar informação essencial, faça uma pergunta objetiva em vez de supor.
- Se for um detalhe pequeno com um padrão óbvio, decida, siga em frente e me
  diga o que decidiu.
