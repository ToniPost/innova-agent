# © 2026 Antonio Postiguillo Moscardó — Todos los derechos reservados.
# NOVA Agent v2.0 — Proprietary Software
"""
Tool Registry - All available tools for Hermes Mejorado
"""

TOOL_REGISTRY = {
    "terminal": {
        "name": "terminal",
        "description": "Execute shell commands on the system",
        "category": "system",
        "requires_auth": False,
        "security_level": "high"
    },
    "file": {
        "name": "file",
        "description": "Read, write, search, and patch files",
        "category": "system",
        "requires_auth": False,
        "security_level": "medium"
    },
    "web": {
        "name": "web",
        "description": "Web search and content extraction",
        "category": "network",
        "requires_auth": False,
        "security_level": "low"
    },
    "browser": {
        "name": "browser",
        "description": "Browser automation with CDP",
        "category": "network",
        "requires_auth": False,
        "security_level": "medium"
    },
    "vision": {
        "name": "vision",
        "description": "Image and video analysis",
        "category": "media",
        "requires_auth": False,
        "security_level": "low"
    },
    "memory": {
        "name": "memory",
        "description": "Persistent cross-session memory with vector search",
        "category": "core",
        "requires_auth": False,
        "security_level": "low"
    },
    "security_audit": {
        "name": "security_audit",
        "description": "Full security audit: web, network, OSINT",
        "category": "security",
        "requires_auth": False,
        "security_level": "critical"
    },
    "delegation": {
        "name": "delegation",
        "description": "Delegate tasks to sub-agents",
        "category": "core",
        "requires_auth": False,
        "security_level": "medium"
    },
    "cron": {
        "name": "cron",
        "description": "Schedule recurring tasks",
        "category": "core",
        "requires_auth": False,
        "security_level": "low"
    },
    "tts": {
        "name": "tts",
        "description": "Text-to-speech with 8+ providers",
        "category": "media",
        "requires_auth": False,
        "security_level": "low"
    },
    "messaging": {
        "name": "messaging",
        "description": "Cross-platform messaging: Telegram, WhatsApp, Discord, Slack, Signal",
        "category": "communication",
        "requires_auth": True,
        "security_level": "high"
    },
    "email": {
        "name": "email",
        "description": "Send and receive emails via SMTP/IMAP",
        "category": "communication",
        "requires_auth": True,
        "security_level": "high"
    }
}

def get_tools_by_category(category: str) -> dict:
    """Filter tools by category"""
    return {k: v for k, v in TOOL_REGISTRY.items() if v["category"] == category}

def get_safe_tools() -> dict:
    """Return only low/medium risk tools"""
    return {k: v for k, v in TOOL_REGISTRY.items() if v["security_level"] != "critical"}

def tool_exists(name: str) -> bool:
    """Check if a tool is registered"""
    return name in TOOL_REGISTRY
