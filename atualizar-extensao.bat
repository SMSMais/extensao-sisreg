@echo off
setlocal enabledelayedexpansion
chcp 65001 >nul

rem ============================================================
rem  SMSMais - Extensao SISREG
rem  Baixa (primeira vez) ou atualiza (git pull) a extensao,
rem  numa pasta fixa no cliente. Rode este .bat sempre que
rem  quiser pegar a versao mais nova.
rem ============================================================

set "REPO=https://github.com/SMSMais/extensao-sisreg.git"
set "DEST=C:\SMSMais\extensao-sisreg"

where git >nul 2>nul
if errorlevel 1 (
  echo.
  echo [ERRO] Git nao encontrado.
  echo Instale o Git para Windows: https://git-scm.com/download/win
  echo Depois rode este arquivo de novo.
  echo.
  pause
  exit /b 1
)

if exist "%DEST%\.git" (
  echo Atualizando a extensao em "%DEST%" ...
  git -C "%DEST%" pull --ff-only
) else (
  echo Baixando a extensao para "%DEST%" ...
  if not exist "C:\SMSMais" mkdir "C:\SMSMais"
  git clone "%REPO%" "%DEST%"
)

if errorlevel 1 (
  echo.
  echo [ERRO] Falha ao baixar/atualizar. Verifique a internet e tente de novo.
  echo.
  pause
  exit /b 1
)

echo.
echo ============================================================
echo  Extensao pronta em: %DEST%
echo.
echo  PRIMEIRA VEZ (instalar no Chrome):
echo    1) Abra:  chrome://extensions
echo    2) Ligue "Modo do desenvolvedor" (canto superior direito)
echo    3) Clique "Carregar sem compactacao"
echo    4) Escolha a pasta:  %DEST%
echo.
echo  DEPOIS DE ATUALIZAR (rodar este .bat de novo):
echo    - Em chrome://extensions, clique no botao recarregar (o circulo)
echo      no card da extensao. Se estiver com o SISREG aberto, de F5.
echo ============================================================
echo.
pause
