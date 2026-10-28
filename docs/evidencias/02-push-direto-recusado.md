# Evidência - Push direto recusado na `main`

Data: 28/10/2026  
Projeto: **Gerador de QR Code**  
Repositório: `julio06rosa/gerador_qrcode`

Foi realizada uma tentativa deliberada de push direto para a branch protegida `main` utilizando um GitHub Codespace.

## Comandos utilizados

```bash
git switch main
git pull origin main
git commit --allow-empty -m "test: tentativa de push direto na main"
git push origin main
```

## Resultado obtido

O GitHub recusou a atualização direta da branch `main` com a seguinte mensagem:

```text
remote: error: GH006: Protected branch update failed for refs/heads/main.
remote: - Changes must be made through a pull request.
! [remote rejected] main -> main (protected branch hook declined)
error: failed to push some refs to 'https://github.com/julio06rosa/gerador_qrcode'
```

## Conclusão

A evidência demonstra que a branch `main` está protegida e que alterações devem ser integradas por Pull Request, conforme definido no Plano de Gerenciamento de Configuração.

A captura de tela correspondente deve ser adicionada nesta mesma pasta como `02-push-direto-recusado.png`.
