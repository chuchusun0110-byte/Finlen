$ErrorActionPreference = "Stop"
$ProjectRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$Python = Join-Path $ProjectRoot ".venv\Scripts\python.exe"
if (-not (Test-Path $Python)) {
  python -m venv (Join-Path $ProjectRoot ".venv")
  & $Python -m pip install --upgrade pip
  & $Python -m pip install -r (Join-Path $ProjectRoot "requirements.txt")
}
Set-Location $ProjectRoot
& $Python -m uvicorn app.main:app --reload --host 127.0.0.1 --port 8000

