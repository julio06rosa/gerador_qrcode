# PLANO DE GERENCIAMENTO DE CONFIGURAÇÃO (GCS)

## Projeto: Gerador de QR Code
**Autor:** Júlio César Duarte da Rosa  
**Repositório:** https://github.com/julio06rosa/gerador_qrcode  
**Versão do plano:** 1.0  
**Data:** 28/10/2026  
**Disciplina:** Gerência de Configuração de Software / DevOps - Atividade Avaliativa N2 - P2

---

## 1. Introdução

### 1.1 Finalidade
Este Plano de Gerenciamento de Configuração (GCS) estabelece as práticas de controle de versão, organização do repositório, revisão de código, integração contínua, ambientes e rastreabilidade adotadas no projeto **Gerador de QR Code**.

O objetivo é assegurar que alterações no software sejam identificadas, revisadas, testadas e integradas de forma controlada, mantendo a branch principal estável e criando evidências verificáveis no GitHub.

### 1.2 Escopo
O plano abrange o aplicativo Flutter que gera QR Codes a partir de textos ou links informados pelo usuário. O projeto utiliza Flutter e Dart, a biblioteca `qr_flutter`, testes automatizados e GitHub Actions.

São abrangidos:
- código-fonte em `lib/`;
- testes automatizados em `test/`;
- arquivos de configuração Flutter;
- dependências declaradas em `pubspec.yaml` e `pubspec.lock`;
- configurações específicas de plataforma;
- workflows em `.github/workflows/`;
- documentação do projeto;
- regras de proteção da branch `main`;
- GitHub Environments `staging` e `production`;
- evidências de revisão por pares e recusa de push direto.

### 1.3 Identificação do projeto
| Campo | Definição |
|---|---|
| Projeto | Gerador de QR Code |
| Responsável | Júlio César Duarte da Rosa |
| Repositório | `julio06rosa/gerador_qrcode` |
| Plataforma | Flutter / Dart |
| Versão atual | `1.0.0+1` |
| Dependência principal | `qr_flutter: ^4.1.0` |
| Controle de versão | Git + GitHub |
| CI | GitHub Actions |
| Branch principal | `main` |
| Modelo de trabalho | GitHub Flow simplificado |

---

## 2. Papéis e responsabilidades

| Papel | Responsável | Responsabilidades |
|---|---|---|
| Responsável pelo projeto | Júlio César Duarte da Rosa | Manter o repositório, organizar branches, revisar configurações e controlar releases. |
| Desenvolvedor | Júlio César Duarte da Rosa | Implementar funcionalidades, correções e testes. |
| Responsável por GCS/DevOps | Júlio César Duarte da Rosa | Manter GitHub Actions, proteção da `main`, environments e regras do fluxo. |
| Revisor por par | Colaborador da disciplina com acesso **Write** | Revisar Pull Requests e registrar aprovação antes do merge. |
| Revisor de produção | Júlio César Duarte da Rosa | Aprovar obrigatoriamente promoções destinadas ao environment `production`. |

A revisão por pares deve ser realizada por outro integrante com acesso de escrita ao repositório. O autor da mudança não deve utilizar sua própria aprovação como substituição da revisão por par.

---

## 3. Ferramentas e itens de configuração

### 3.1 Ferramentas
| Categoria | Ferramenta | Finalidade |
|---|---|---|
| Controle de versão | Git | Versionamento local e histórico de alterações |
| Hospedagem do repositório | GitHub | Repositório remoto, PRs, colaboradores e auditoria |
| Framework | Flutter | Desenvolvimento multiplataforma |
| Linguagem | Dart | Implementação do aplicativo |
| Biblioteca principal | `qr_flutter` | Geração e renderização do QR Code |
| Testes | `flutter_test` | Testes automatizados |
| Análise estática | `flutter analyze` | Verificação de problemas e padrões do código |
| CI | GitHub Actions | Execução automática de análise, testes e build |
| Artefato | APK release | Resultado de build armazenado pelo workflow |

### 3.2 Itens de configuração formais
São considerados itens de configuração:
- `lib/main.dart` e demais arquivos-fonte;
- `test/` e seus testes automatizados;
- `pubspec.yaml`;
- `pubspec.lock`;
- `analysis_options.yaml`;
- `.github/workflows/flutter-ci.yml`;
- diretórios de plataforma (`android/`, `ios/`, `web/`, `windows/`, `linux/`, `macos/`);
- `README.md`;
- este plano de GCS;
- evidências acadêmicas relacionadas à proteção da `main`, revisão e environments.

Alterações nesses itens devem ser rastreáveis por commits e, após a ativação da proteção da branch, integradas à `main` por Pull Request.

---

## 4. Estrutura do repositório

```text
gerador_qrcode/
├── .github/
│   └── workflows/
│       └── flutter-ci.yml
├── android/
├── ios/
├── lib/
│   └── main.dart
├── linux/
├── macos/
├── test/
│   └── widget_test.dart
├── web/
├── windows/
├── analysis_options.yaml
├── pubspec.yaml
├── pubspec.lock
├── README.md
└── docs/
    └── PLANO_GCS.md
```

A pasta `docs/` é utilizada para documentação de GCS e pode também armazenar evidências da atividade.

---

## 5. Estratégia de branching e versionamento

### 5.1 Branches
O projeto utiliza GitHub Flow simplificado:

- `main`: branch principal, destinada a conter código estável e integrado;
- `feature/<descricao>`: desenvolvimento de funcionalidades;
- `fix/<descricao>`: correções;
- `docs/<descricao>`: documentação e ajustes de processo;
- `hotfix/<descricao>`: correção urgente, ainda sujeita a revisão.

Exemplos:
- `feature/melhorar-geracao-qrcode`
- `fix/validacao-campo-vazio`
- `docs/plano-gcs`

### 5.2 Commits
Recomenda-se Conventional Commits:
- `feat: ...`
- `fix: ...`
- `test: ...`
- `docs: ...`
- `chore: ...`
- `refactor: ...`

Exemplo:
```text
docs: adiciona plano de gerenciamento de configuracao
```

### 5.3 Versionamento
O projeto adota versionamento semântico, mantendo a versão Flutter em `pubspec.yaml`.

Versão atual: `1.0.0+1`.

---

## 6. Proteção da branch main e Pull Requests

A branch `main` deverá permanecer protegida por regra de branch/ruleset.

Requisitos mínimos:
1. exigir Pull Request antes do merge;
2. exigir pelo menos **1 aprovação**;
3. utilizar revisão por outro colaborador;
4. impedir que o fluxo normal de desenvolvimento seja realizado por push direto na `main`;
5. manter as verificações de CI associadas aos Pull Requests.

### 6.1 Evidência de recusa de push direto
Após a regra ser configurada, deverá ser executada uma tentativa deliberada de push direto para `main`.

Exemplo:
```bash
git checkout main
git pull
echo "evidencia de protecao" >> evidencia-main.txt
git add evidencia-main.txt
git commit -m "test: tentativa de push direto na main"
git push origin main
```

O push deverá ser recusado pela proteção configurada. A mensagem de erro apresentada no terminal deve ser registrada em captura de tela como evidência acadêmica.

---

## 7. Revisão por pares

Um colega da disciplina deverá ser adicionado ao repositório como colaborador com acesso **Write**.

Fluxo:
1. criar uma branch;
2. realizar uma alteração;
3. enviar a branch ao GitHub;
4. abrir Pull Request para `main`;
5. solicitar revisão ao colaborador;
6. receber pelo menos uma aprovação;
7. somente depois efetuar o merge.

A aprovação registrada no Pull Request constitui evidência rastreável da revisão por pares.

---

## 8. Integração Contínua (CI)

O projeto possui workflow de GitHub Actions para `push` e `pull_request` direcionados à `main`.

### 8.1 Etapas do pipeline
O workflow executa:
1. checkout do código;
2. configuração do Flutter;
3. `flutter pub get`;
4. `flutter analyze`;
5. `flutter test`;
6. `flutter build apk --release`;
7. upload do APK como artefato `gerador-qrcode-apk`.

### 8.2 Quality Gate
Para uma alteração ser considerada apta ao merge:
- `flutter analyze` não deve apresentar erro bloqueante;
- `flutter test` deve concluir com sucesso;
- o build de release deve ser concluído;
- o Pull Request deve possuir a aprovação exigida pela proteção da `main`.

---

## 9. Ambientes

O repositório deverá possuir dois GitHub Environments:

### 9.1 `staging`
Finalidade:
- representar o ambiente de homologação/validação;
- receber validações antes de qualquer promoção considerada de produção.

### 9.2 `production`
Finalidade:
- representar o ambiente final/estável;
- exigir aprovação manual antes de uma ação de produção;
- possuir **Júlio César Duarte da Rosa** como revisor obrigatório (`Required reviewer`).

---

## 10. Entrega e promoção

```text
Branch de trabalho
      ↓
Pull Request
      ↓
CI: analyze + test + build
      ↓
Revisão por par
      ↓
Merge na main
      ↓
staging
      ↓
Aprovação obrigatória do responsável
      ↓
production
```

Mesmo que o aplicativo ainda não possua publicação automatizada em loja, os environments são mantidos como mecanismos formais de controle e preparação para futuras etapas de CD.

---

## 11. Baselines e releases

Uma baseline corresponde a um estado estável do projeto identificado por:
- commit integrado na `main`;
- execução bem-sucedida do CI;
- versão definida no `pubspec.yaml`;
- opcionalmente, tag Git no padrão `vX.Y.Z`.

Exemplo:
```text
v1.0.0
```

---

## 12. Controle de mudanças

O fluxo normal de mudança será:

```text
necessidade de alteração
→ branch específica
→ desenvolvimento
→ commit
→ push da branch
→ Pull Request
→ CI
→ revisão por par
→ aprovação
→ merge na main
```

Mudanças no próprio processo de GCS, workflow de CI, dependências e arquivos de configuração seguem o mesmo princípio.

---

## 13. Auditoria e rastreabilidade

São utilizados como registros de auditoria:
- histórico de commits;
- histórico de Pull Requests;
- aprovação do revisor;
- execução dos workflows do GitHub Actions;
- artefatos de build;
- configurações dos Environments;
- regras de proteção da `main`;
- tags e releases;
- capturas de tela exigidas pela atividade.

---

## 14. Evidências da Atividade Avaliativa N2 - P2

| Item avaliado | Evidência esperada |
|---|---|
| Organização do repositório | Estrutura do projeto e documentação versionada |
| Plano de GCS publicado | `docs/PLANO_GCS.md` dentro do repositório |
| Repositório acessível | Link do repositório disponível ao professor |
| Recusa de push direto na `main` | Print do terminal mostrando a rejeição do push |
| Par de revisão com escrita | Colaborador configurado com acesso de escrita |
| Revisão por par | Pull Request com aprovação registrada |
| Environment `staging` | Environment criado no GitHub |
| Environment `production` | Environment criado no GitHub |
| Revisor obrigatório de produção | Júlio César Duarte da Rosa configurado como Required reviewer |

### Checklist final
- [x] Plano de GCS criado em branch de documentação
- [ ] Plano de GCS integrado à `main`
- [ ] Repositório acessível ao professor
- [ ] `main` protegida
- [ ] Pull Request obrigatório
- [ ] Pelo menos 1 aprovação obrigatória
- [ ] Tentativa de push direto recusada e registrada
- [ ] Colega adicionado com acesso de escrita
- [ ] Pull Request revisado pelo colega
- [ ] Environment `staging` criado
- [ ] Environment `production` criado
- [ ] Júlio configurado como revisor obrigatório de `production`

---

## 15. Referências do projeto
- Repositório: https://github.com/julio06rosa/gerador_qrcode
- README, `pubspec.yaml`, testes automatizados e workflow de CI do próprio projeto.
- Documentação oficial do Flutter.
- Documentação oficial do Dart.
- Documentação oficial do GitHub Actions.
- Documentação oficial do GitHub sobre Pull Requests, branch protection e Environments.

---

**Aprovação do plano:** Júlio César Duarte da Rosa  
**Versão:** 1.0  
**Data:** 28/10/2026
