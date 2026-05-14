-- =============================================================================
-- Database Initialization
-- =============================================================================
-- This script runs automatically on first container startup.
-- It enables the pgvector extension required for vector similarity search.
-- =============================================================================
 
CREATE EXTENSION IF NOT EXISTS vector;