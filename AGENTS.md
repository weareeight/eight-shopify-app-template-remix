# AI Code Generation Instructions

This document provides comprehensive instructions for AI code generation tools working on this Shopify app template built with React Router v7, TypeScript, and Prisma.

## Project Overview

This is a Shopify app template using:
- **Framework**: React Router v7 (file-based routing)
- **Language**: TypeScript with strict mode
- **Database**: Prisma ORM
- **Linting**: Biome (replaces ESLint + Prettier)
- **Build Tool**: Vite
- **Package Manager**: Bun (with npm fallback)
- **Node Version**: >=20.10

## Code Style & Formatting

### Biome Configuration
The project uses [`biome.json`](biome.json) for linting and formatting:

- **Indentation**: 4 spaces
- **Line Width**: 120 characters
- **Quote Style**: Single quotes for JS/TS, double quotes for JSX
- **Semicolons**: Always required
- **Import Organization**: Automatic with custom grouping

### Key Linting Rules
- `useImportType`: Prefer type imports (`import type`)
- `useExhaustiveDependencies`: Warn on missing React hook dependencies
- `noArrayIndexKey`: Warn against using array indices as React keys
- `useKeyWithClickEvents`: Info level for accessibility

### Running Linting
```bash
npm run lint          # Check for issues
biome check --write   # Fix auto-fixable issues
```

## File Structure & Routing

### App Directory Structure
```
app/
├── routes/           # File-based routing
│   ├── app._index.tsx    # Main app page
│   ├── app.tsx           # App layout
│   ├── auth.$.tsx        # Auth catch-all
│   └── _index/           # Public pages
├── db.server.ts      # Database utilities
├── shopify.server.ts # Shopify integration
└── root.tsx          # Root component
```

### Route Conventions
- `app.*` routes require authentication
- `_index` routes are public
- Use `.server.ts` suffix for server-only code
- Follow React Router v7 file-based routing conventions

## TypeScript Configuration

### Key Settings from [`tsconfig.json`](tsconfig.json:1)
- **Target**: ES2022
- **Module**: ESNext with Bundler resolution
- **JSX**: react-jsx (automatic runtime)
- **Strict Mode**: Enabled
- **Base URL**: Project root with path mapping

### Type Definitions
- Shopify types: `@shopify/app-bridge-types`, `@shopify/app-bridge-ui-types`
- React Router types: `@react-router/node`
- Vite client types: `vite/client`

## Database & Prisma

### Schema Location
Database schema: [`prisma/schema.prisma`](prisma/schema.prisma)

### Common Commands
```bash
npm run migrate        # Deploy migrations and generate client
npm run migrate:create # Create new migration
npm run migrate:show   # Show migration status
```

### Database Usage
- Import client: `import { prisma } from "~/db.server"`
- Always use `.server.ts` files for database operations
- Follow Prisma best practices for queries

## Shopify Integration

### Key Files
- [`app/shopify.server.ts`](app/shopify.server.ts): Shopify configuration
- [`shopify.app.toml`](shopify.app.toml): App configuration
- [`shopify.web.toml`](shopify.web.toml): Web configuration

### Authentication
- Use `@shopify/shopify-app-react-router` for auth handling
- Session storage via Prisma adapter
- App Bridge for frontend integration

## Development Workflow

### Available Scripts
```bash
npm run dev           # Start development server
npm run dev:local     # Start with Zellij layout
npm run dev:db        # Start database
npm run build         # Build for production
npm run typecheck     # Type checking
```

### Environment Setup
1. Configure Shopify app credentials
2. Set up database connection
3. Run migrations: `npm run migrate`
4. Start development: `npm run dev`

## MCP (Model Context Protocol) Usage

### File Reading Strategy
- Read related files together (max 5 per request)
- Prioritize configuration files for context
- Use [`search_files`](.) for pattern matching across codebase
- Use [`list_code_definition_names`](.) for code structure overview

### Code Modification Approach
1. **Read First**: Always read existing files before modifications
2. **Targeted Edits**: Use `apply_diff` for surgical changes
3. **New Files**: Use `write_to_file` for new file creation
4. **Batch Operations**: Group related changes together

### Testing Changes
1. Run linting: `npm run lint`
2. Type check: `npm run typecheck`
3. Test locally: `npm run dev`
4. Use browser automation for UI testing

## Best Practices for AI Code Generation

### Code Quality
- Follow existing code patterns and conventions
- Maintain TypeScript strict mode compliance
- Use proper error handling and validation
- Implement proper loading states for async operations

### React Router v7 Patterns
- Use file-based routing conventions
- Implement proper data loading with loaders
- Handle form submissions with actions
- Use proper error boundaries

### Shopify App Patterns
- Implement proper webhook handling
- Use App Bridge components when possible
- Follow Shopify design system guidelines
- Handle app installation/uninstallation properly

### Database Operations
- Use Prisma client properly
- Implement proper error handling
- Use transactions for complex operations
- Follow database naming conventions

### Security Considerations
- Validate all inputs
- Use proper authentication checks
- Sanitize data before database operations
- Follow Shopify security best practices

## Common Pitfalls to Avoid

1. **Import Issues**: Always use proper import types and organize imports
2. **Route Conflicts**: Be careful with route naming and nesting
3. **Server/Client Code**: Keep server code in `.server.ts` files
4. **Database Connections**: Don't create multiple Prisma instances
5. **Type Safety**: Don't use `any` types, prefer proper typing

## Debugging & Troubleshooting

### Linting Issues
```bash
biome check --write   # Auto-fix issues
biome check --verbose # Detailed error info
```

### Type Errors
```bash
npm run typecheck     # Check types
tsc --noEmit --verbose # Detailed type info
```

### Database Issues
```bash
npm run migrate:show  # Check migration status
prisma db push        # Push schema changes (dev only)
```

### Development Server Issues
- Check port conflicts (default: 3000)
- Verify environment variables
- Check Shopify app configuration
- Review console logs for errors

## Additional Resources

- [React Router v7 Documentation](https://reactrouter.com)
- [Shopify App Development](https://shopify.dev/docs/apps)
- [Biome Documentation](https://biomejs.dev)
- [Prisma Documentation](https://prisma.io/docs)
- [TypeScript Handbook](https://typescriptlang.org/docs)

---

*This document should be updated as the project evolves and new patterns emerge.*