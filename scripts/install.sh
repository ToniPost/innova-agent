#!/bin/bash
# © 2026 Antonio Postiguillo Moscardó — Todos los derechos reservados.
# INNOVA Agent v3.0 — Instalador oficial
# Parte del ecosistema innovaia.org

set -e

RED='\033[0;31m'
GOLD='\033[0;33m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
NC='\033[0m'

echo -e "${GOLD}"
echo "╔══════════════════════════════════════════════════════════╗"
echo "║                                                          ║"
echo "║   🦅  INNOVA AGENT v3.0  —  instalador oficial            ║"
echo "║   El agente de IA autónomo más avanzado jamás creado       ║"
echo "║                                                          ║"
echo "║   © 2026 Antonio Postiguillo Moscardó                     ║"
echo "║   innovaia.org — Ciberseguridad · IA · Desarrollo · Cloud ║"
echo "║                                                          ║"
echo "╚══════════════════════════════════════════════════════════╝"
echo -e "${NC}"

# Detectar SO
OS=$(uname -s)
ARCH=$(uname -m)
echo -e "${CYAN}[*] Detectando sistema...${NC}"
echo "    OS: $OS | Arquitectura: $ARCH"

# Verificar Python
echo -e "${CYAN}[*] Verificando Python...${NC}"
if command -v python3 &>/dev/null; then
    PYTHON=$(command -v python3)
    PYTHON_VERSION=$($PYTHON --version 2>&1 | awk '{print $2}')
    echo -e "    ${GREEN}✓${NC} Python $PYTHON_VERSION encontrado"
else
    echo -e "${RED}[!] Python 3.11+ requerido. Instalando...${NC}"
    exit 1
fi

# Verificar pip
if command -v pip3 &>/dev/null; then
    PIP=$(command -v pip3)
else
    echo -e "${RED}[!] pip no encontrado. Instalando...${NC}"
    $PYTHON -m ensurepip --upgrade
fi

# Crear entorno virtual
echo -e "${CYAN}[*] Creando entorno virtual...${NC}"
$PYTHON -m venv ~/.innova-agent/venv
source ~/.innova-agent/venv/bin/activate

# Instalar INNOVA Agent
echo -e "${CYAN}[*] Instalando INNOVA Agent v3.0...${NC}"
pip install innova-agent --upgrade 2>/dev/null || pip install -e . 2>/dev/null

# Verificar instalación
echo -e "${CYAN}[*] Verificando instalación...${NC}"
innova-agent --version

# Configurar directorios
echo -e "${CYAN}[*] Configurando directorios...${NC}"
mkdir -p ~/.innova-agent/{config,memory,skills,logs,sessions}

# Configurar API keys
echo -e "${GOLD}"
echo "╔══════════════════════════════════════════════════════════╗"
echo "║  🔑  Configuración de proveedores                         ║"
echo "╚══════════════════════════════════════════════════════════╝"
echo -e "${NC}"

read -p "DeepSeek API Key (enter para saltar): " DEEPSEEK_KEY
[ -n "$DEEPSEEK_KEY" ] && innova-agent config set providers.deepseek.api_key "$DEEPSEEK_KEY"

read -p "OpenAI API Key (enter para saltar): " OPENAI_KEY  
[ -n "$OPENAI_KEY" ] && innova-agent config set providers.openai.api_key "$OPENAI_KEY"

read -p "Anthropic API Key (enter para saltar): " ANTHROPIC_KEY
[ -n "$ANTHROPIC_KEY" ] && innova-agent config set providers.anthropic.api_key "$ANTHROPIC_KEY"

echo ""
echo -e "${GREEN}╔══════════════════════════════════════════════════════════╗"
echo "║  ✅  INNOVA Agent v3.0 instalado correctamente            ║"
echo "║                                                          ║"
echo "║  Comandos:                                                ║"
echo "║    innova-agent chat          — Modo conversacional        ║"
echo "║    innova-agent serve         — Dashboard + API            ║"
echo "║    innova-agent swarm         — Multi-agente               ║"
echo "║    innova-agent audit <url>   — Auditoría de seguridad     ║"
echo "║    innova-agent ghost         — Modo fantasma              ║"
echo "║    innova-agent dream         — Modo creativo              ║"
echo "║                                                          ║"
echo "║  Dashboard: http://localhost:8080                         ║"
echo "║  Docs:      https://innovaia.org/docs/innova-agent        ║"
echo "║                                                          ║"
echo "║  🦅  innovaia.org — El futuro es nuestro                  ║"
echo "╚══════════════════════════════════════════════════════════╝"
echo -e "${NC}"
