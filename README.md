# SMSMais · Extensão SISREG

Extensão de navegador (Chrome) que registra no SMSMais as operações feitas no SISREG, para
atualizar a base em tempo quase real. **Só observa** o SISREG — nunca dispara requisição para lá.

Este repositório é o **ponto de distribuição** da extensão para as máquinas do piloto.

## Instalar / atualizar (jeito fácil — `.bat`)

1. Baixe o arquivo **`atualizar-extensao.bat`** deste repositório
   ([link direto](https://raw.githubusercontent.com/SMSMais/extensao-sisreg/main/atualizar-extensao.bat)).
2. Dê **dois cliques** nele. Ele baixa (ou atualiza) a extensão em `C:\SMSMais\extensao-sisreg`.
   - Precisa do [Git para Windows](https://git-scm.com/download/win) instalado.
3. **Na primeira vez**, carregue no Chrome:
   - Abra `chrome://extensions`
   - Ligue o **Modo do desenvolvedor** (canto superior direito)
   - **Carregar sem compactação** → escolha a pasta `C:\SMSMais\extensao-sisreg`
4. **Para atualizar depois:** rode o `.bat` de novo (faz `git pull`) e, em `chrome://extensions`,
   clique no **↻** (recarregar) do card da extensão. Se o SISREG estiver aberto, dê **F5**.

O `.bat` pode ficar na área de trabalho; ele sempre cuida da mesma pasta `C:\SMSMais\extensao-sisreg`.

## O que a extensão faz

- Exige login no **SMSMais** para liberar o SISREG (a tela fica borrada até entrar).
- Mostra um selo discreto com um LED de status (conectado / enviando / registrado).
- Registra as operações do SISREG e envia para o SMSMais, autenticando com o **seu** login.

Nenhuma senha do SISREG sai da máquina: a extensão só observa e mascara campos sensíveis.

## Sem `.bat` (manual)

```
git clone https://github.com/SMSMais/extensao-sisreg.git C:\SMSMais\extensao-sisreg
```

Para atualizar: `git -C C:\SMSMais\extensao-sisreg pull` e recarregue no Chrome.
