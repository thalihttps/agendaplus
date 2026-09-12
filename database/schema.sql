-- Estrutura do Banco de Dados AgendaPlus (MySQL / PostgreSQL)

CREATE TABLE users (
    id VARCHAR(50) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role ENUM('client', 'provider') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE services (
    id VARCHAR(50) PRIMARY KEY,
    provider_name VARCHAR(100) NOT NULL,
    title VARCHAR(150) NOT NULL,
    category VARCHAR(50) NOT NULL,
    city VARCHAR(50) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    description TEXT
);

CREATE TABLE appointments (
    id VARCHAR(50) PRIMARY KEY,
    service_id VARCHAR(50) REFERENCES services(id),
    client_id VARCHAR(50) REFERENCES users(id),
    date DATE NOT NULL,
    time VARCHAR(10) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    status VARCHAR(20) DEFAULT 'CONFIRMADO',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
