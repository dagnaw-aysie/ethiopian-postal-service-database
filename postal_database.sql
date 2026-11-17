-- ==========================================
-- Ethiopian Postal Service Relational Database
-- Built with PostgreSQL
-- Author: Dagnaw Aysie
-- ==========================================

-- 1. Create Tables (Schema)
CREATE TABLE post_offices (
    office_id SERIAL PRIMARY KEY,
    office_name VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL,
    region VARCHAR(50) NOT NULL,
    postal_code VARCHAR(10) UNIQUE NOT NULL
);

CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    phone_number VARCHAR(20) UNIQUE NOT NULL,
    city VARCHAR(50) NOT NULL
);

CREATE TABLE parcels (
    parcel_id SERIAL PRIMARY KEY,
    tracking_number VARCHAR(20) UNIQUE NOT NULL,
    sender_id INT REFERENCES customers(customer_id),
    receiver_id INT REFERENCES customers(customer_id),
    origin_office_id INT REFERENCES post_offices(office_id),
    destination_office_id INT REFERENCES post_offices(office_id),
    service_type VARCHAR(30),
    weight_kg DECIMAL(6, 2),
    shipping_cost_etb DECIMAL(10, 2),
    current_status VARCHAR(30)
);

-- 2. Insert Sample Data
INSERT INTO post_offices (office_name, city, region, postal_code) VALUES
('Addis Ababa Main', 'Addis Ababa', 'Addis Ababa', '1000'),
('Bole Branch', 'Addis Ababa', 'Addis Ababa', '1001'),
('Bahir Dar Branch', 'Bahir Dar', 'Amhara', '6000'),
('Hawassa Branch', 'Hawassa', 'Sidama', '7000');

INSERT INTO customers (full_name, phone_number, city) VALUES
('Abebe Kebede', '+251911234567', 'Addis Ababa'),
('Tigist Alemu', '+251922345678', 'Bahir Dar'),
('Meron Hailu', '+251944567890', 'Hawassa');

INSERT INTO parcels (tracking_number, sender_id, receiver_id, origin_office_id, destination_office_id, service_type, weight_kg, shipping_cost_etb, current_status) VALUES
('ET100200301', 1, 2, 2, 3, 'EMS', 2.50, 450.00, 'Delivered'),
('ET100200302', 3, 1, 4, 1, 'Standard', 5.00, 300.00, 'In Transit');

-- 3. Analytical Query (Parcel Tracking Report)
SELECT 
    p.tracking_number,
    s.full_name AS sender,
    r.full_name AS receiver,
    o1.city AS from_city,
    o2.city AS to_city,
    p.service_type,
    p.shipping_cost_etb,
    p.current_status
FROM parcels p
JOIN customers s ON p.sender_id = s.customer_id
JOIN customers r ON p.receiver_id = r.customer_id
JOIN post_offices o1 ON p.origin_office_id = o1.office_id
JOIN post_offices o2 ON p.destination_office_id = o2.office_id;
