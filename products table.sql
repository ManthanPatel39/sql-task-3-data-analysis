use ecommerce_db;
 CREATE TABLE IF NOT EXISTS products1 (
    StockCode VARCHAR(20) PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50)
);
INSERT INTO products (StockCode, ProductName, Category) VALUES
('85123A', 'Hanging Heart Lantern', 'Home Decor'),
('71053',  'White Metal Lantern', 'Home Decor'),
('84406B', 'Cupid Coat Hanger', 'Accessories'),
('84029G', 'Union Flag Hot Water Bottle', 'Winter Essentials'),
('84029E', 'Woolly Hottie Heart', 'Winter Essentials');
