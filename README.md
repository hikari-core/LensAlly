# LensAlly

A code intelligence engine that brings clarity to complex codebases.

Point it at any codebase and ask natural language questions — how things work, where concepts live, what patterns exist, how the architecture connects. LensAlly indexes code semantically, retrieves the right context, and delivers accurate, grounded answers with citations to actual source files.

Whether you need a deep implementation detail or a high-level architectural overview, LensAlly adjusts the focus to what you need.

## How It Works

1. **Ingest** — LensAlly reads a codebase and splits it into meaningful chunks (by function, class, and module boundaries).
2. **Embed** — Each chunk is converted into a vector representation that captures its semantic meaning.
3. **Store** — Chunks and their vectors are stored in PostgreSQL with pgvector for fast similarity search.
4. **Query** — When you ask a question, LensAlly finds the most relevant chunks and generates an accurate, grounded answer via LLM.
5. **Cite** — Every answer includes references to the exact files and locations it drew from.

## Tech Stack

| Layer | Technology |
|---|---|
| Frontend | Next.js + TypeScript |
| Backend | Python + FastAPI |
| Vector Store | PostgreSQL + pgvector |
| LLM | Anthropic Claude API |
| Embeddings | OpenAI Embeddings API |
| Database (local) | Docker |

## Getting Started

### Prerequisites

- [Docker](https://docs.docker.com/get-docker/) installed and running
- [Python 3.11+](https://www.python.org/downloads/)
- [Node.js 18+](https://nodejs.org/)
- [Anthropic API key](https://console.anthropic.com/)
- [OpenAI API key](https://platform.openai.com/api-keys)

### Setup

1. Clone the repository:

```bash
git clone https://github.com/YOUR_USERNAME/lensally.git
cd lensally
```

2. Create your environment file:

```bash
cp .env.example .env
```

3. Edit `.env` and fill in your credentials (database password, API keys).

4. Start the database:

```bash
docker-compose up -d
```

5. Verify the database is running:

```bash
docker-compose ps
```

## Project Structure

```
lensally/
├── docker-compose.yml
├── scripts/
│   └── init-db.sql
├── .env.example
├── .gitignore
└── README.md
```

> This structure will grow as development progresses.

## Architecture

LensAlly is designed as two separate layers:

- **Engine** — the FastAPI backend that handles code ingestion, embeddings, retrieval, and LLM-powered answers. This holds all the intelligence.
- **Surfaces** — the different ways people interact with the engine. V1 exposes a web app (React/Next.js). Future versions will add an MCP server for in-editor use.

The engine holds all the intelligence. The surfaces are thin clients that call it. Adding a new surface requires zero changes to the core logic.