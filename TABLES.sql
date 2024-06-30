CREATE TABLE Users (
    id SERIAL PRIMARY KEY,
    login VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

-- Создание таблицы Categories
CREATE TABLE Categories (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    parent_id INTEGER REFERENCES Categories(id) ON DELETE CASCADE,
    user_id INTEGER NOT NULL REFERENCES Users(id)
);

-- Создание таблицы Notes
CREATE TABLE Notes (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    category_id INTEGER NOT NULL REFERENCES Categories(id) ON DELETE CASCADE,
    creation_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    amount INTEGER NOT NULL
);