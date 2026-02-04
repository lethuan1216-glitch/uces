# UCES - Universal Claude Enhancement System

> Transform your Claude Code CLI into a production-grade development powerhouse.

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Claude Code](https://img.shields.io/badge/Claude-Code-purple.svg)](https://claude.ai)

## What is UCES?

UCES is a battle-tested configuration framework that supercharges Claude Code with:

- **Smart Routing** - Automatically dispatches tasks to specialized skill modules
- **Zero-Tolerance Mode** - Eliminates incomplete code, placeholder implementations, and technical debt
- **Skill Modules** - Domain-specific knowledge packs for UI, API, Mobile, DevOps, and more
- **Automation Hooks** - Pre/post execution scripts for validation, formatting, and safety checks
- **Session Intelligence** - Remembers project context and learnings across sessions

## Installation

### One-Line Install

```bash
curl -fsSL https://raw.githubusercontent.com/eticmedya/uces/main/setup.sh | bash
```

### Manual Installation

```bash
git clone https://github.com/eticmedya/uces.git
cd uces
chmod +x setup.sh
./setup.sh
```

## Architecture

```
~/.claude/
├── CLAUDE.md              # Core directives
├── CONVENTIONS.md         # Code quality rules
├── config.json            # Runtime configuration
├── skills/                # Skill modules
│   ├── ui/               # React, Next.js, Tailwind
│   ├── api/              # REST, GraphQL, Webhooks
│   ├── native/           # React Native, Expo
│   ├── debug/            # Testing, debugging
│   ├── guard/            # Security, authentication
│   ├── architect/        # System design, planning
│   ├── data/             # Analytics, queries
│   └── devops/           # CI/CD, deployment
├── hooks/                 # Automation scripts
│   ├── init.sh           # Session initialization
│   ├── validate.sh       # Pre-execution checks
│   ├── format.sh         # Post-edit formatting
│   └── commit-check.sh   # Pre-commit validation
└── modules/               # Extension modules
```

## Skill Modules

| Module | Triggers | Description |
|--------|----------|-------------|
| `ui` | component, page, form, button, React, Tailwind | Frontend development with React/Next.js |
| `api` | endpoint, route, database, REST, GraphQL | Backend APIs and server logic |
| `native` | mobile, Expo, React Native, iOS, Android | Cross-platform mobile apps |
| `debug` | bug, error, fix, test, failing | Debugging and test automation |
| `guard` | auth, security, permission, OWASP | Security hardening and auth flows |
| `architect` | design, plan, architecture, PRD | System design and technical specs |
| `data` | analytics, metrics, query, dashboard | Data analysis and reporting |
| `devops` | deploy, CI/CD, Docker, pipeline | Infrastructure and deployment |

## Zero-Tolerance Mode

UCES enforces production-quality standards:

### Prohibited Patterns
```
[X] Mock data in production code
[X] TODO/FIXME comments
[X] Empty event handlers
[X] Missing error boundaries
[X] Untyped variables (any)
[X] Console.log for error handling
```

### Required Patterns
```
[✓] Real API/database integration
[✓] Complete error handling (loading, error, empty, success)
[✓] User-facing feedback for all actions
[✓] Type-safe implementations
[✓] Verified working state before completion
```

## Smart Routing

UCES automatically routes your requests:

```
"Create a login form"     → ui module
"Add user endpoint"       → api module
"Fix the crash on iOS"    → native + debug modules
"Review security"         → guard module
"Plan the new feature"    → architect module
```

## Automation Hooks

### Session Start
- Detects project stack (Next.js, Expo, Node, etc.)
- Loads previous session learnings
- Shows git status and recent activity

### Pre-Execution
- Validates file paths
- Checks for dangerous operations
- Warns about breaking changes

### Post-Edit
- Auto-formats with project config
- Runs type checking
- Detects anti-patterns

### Pre-Commit
- TypeScript validation
- Security scanning
- Test execution

## Configuration

Edit `~/.claude/config.json`:

```json
{
  "zeroTolerance": true,
  "autoFormat": true,
  "typeCheck": true,
  "securityScan": true,
  "sessionMemory": true
}
```

## Supported Stacks

**Web**
- Next.js 14/15, React 18/19
- TypeScript (strict mode)
- Tailwind CSS 3/4
- shadcn/ui, Radix UI
- Prisma, Drizzle, Supabase
- React Query, Zustand

**Mobile**
- Expo SDK 50+
- React Native
- NativeWind
- Expo Router

**Backend**
- Node.js, Bun
- tRPC, REST, GraphQL
- PostgreSQL, MongoDB
- Redis, Supabase

## Session Memory

UCES learns as you work:

```bash
# Automatically logged discoveries:
- "Auth middleware in /lib/auth"
- "Uses Zustand for global state"
- "API routes require userId check"
```

Previous learnings are restored on session start.

## Contributing

Contributions welcome! Please read [CONTRIBUTING.md](CONTRIBUTING.md) first.

## License

MIT License - see [LICENSE](LICENSE) for details.

---

**Built for developers who ship.**
