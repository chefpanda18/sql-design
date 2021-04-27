DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE regions
(
    id SERIAL PRIMARY KEY,
    name TEXT,
)

CREATE TABLE users
(
    id SERIAL PRIMARY KEY,
    username TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL,
    preferred_region TEXT,
)

CREATE TABLE posts
(
    id SERIAL PRIMARY KEY,
    title TEXT,
    description TEXT,
    location TEXT,
    user_id INTEGER REFERENCES users ON DELETE CASCADE,
    region_id INTEGER REFERENCES regions ON DELETE CASCADE,
    category_id INTEGER REFERENCES categories ON DELETE CASCADE
)

CREATE TABLE categories
(
    id SERIAL PRIMARY KEY,
    name TEXT
)