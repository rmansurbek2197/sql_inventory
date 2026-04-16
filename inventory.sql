CREATE TABLE products (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    sku TEXT UNIQUE,
    stock_quantity INTEGER DEFAULT 0,
    price REAL
);

CREATE TABLE warehouses (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    location TEXT
);

CREATE TABLE stock_movements (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    product_id INTEGER,
    warehouse_id INTEGER,
    quantity_change INTEGER,
    type TEXT, -- IN / OUT
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY(product_id) REFERENCES products(id),
    FOREIGN KEY(warehouse_id) REFERENCES warehouses(id)
);

CREATE INDEX idx_sku ON products(sku);
