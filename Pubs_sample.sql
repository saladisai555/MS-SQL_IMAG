CREATE TABLE publishers (
    pub_id CHAR(4) PRIMARY KEY,
    pub_name VARCHAR(40),
    city VARCHAR(20),
    states CHAR(2),
    country VARCHAR(30) DEFAULT 'USA'
);


CREATE TABLE authors (
    au_id VARCHAR(11) PRIMARY KEY,
    au_lname VARCHAR(40) NOT NULL,
    au_fname VARCHAR(20) NOT NULL,
    phone CHAR(12),
    address VARCHAR(40),
    city VARCHAR(20),
    state CHAR(2),
    zip CHAR(5),
    contract BIT
);

CREATE TABLE titles (
    title_id VARCHAR(6) PRIMARY KEY,
    tile varchar(80),
    type char(12),
    pub_id char(4) FOREIGN KEY REFERENCES publishers(pub_id),
    price MONEY,
    advance MONEY,
    royality INT,
    ytd_sales INT,
    notes VARCHAR(200),
    pubdate DATETIME
);

CREATE TABLE titleauthor (
    au_id VARCHAR(11) FOREIGN KEY REFERENCES authors(au_id),
    title_id VARCHAR(6) FOREIGN KEY REFERENCES titles(title_id),
    au_ord TINYINT,
    royaltyper INT,
    PRIMARY KEY(au_id,title_id)
);

CREATE TABLE products (
    prod_id VARCHAR(10) PRIMARY KEY,
    prod_name VARCHAR(50),
    price MONEY,
    qoh INT
);

INSERT INTO publishers(pub_id,pub_name,city,states,country) VALUES
('0736','New Age Books','Boston','MA','USA'),
('0877', 'Binnet & Hardley', 'Washington', 'DC', 'USA'),
('1389', 'Algodata Infosystems', 'Berkeley', 'CA', 'USA'),
('9999', 'Lucerne Publishing', 'Paris', NULL, 'France');

INSERT INTO authors(au_id,au_lname,au_fname,city,[state],contract) VALUES
('111-11-1111', 'Smith', 'Sam', 'Menlo Park', 'CA', 1),
('222-22-2222', 'Straight', 'Dean', 'Oakland', 'CA', 1),
('333-33-3333', 'Stringer', 'Sarah', 'Menlo Park', 'CA', 1),
('444-44-4444', 'MacFeather', 'Stearns', 'Menlo Park', 'CA', 1),
('555-55-5555', 'Karsen', 'Livia', 'Oakland', 'CA', 1);

INSERT INTO titles (title_id, title, type, pub_id, price, royalty, ytd_sales, pubdate) VALUES 
('BU1111', 'Cooking with Computers', 'business', '1389', 11.95, 10, 4000, '1991-06-09'),
('MC2222', 'Silicon Valley Gastronomic Treats', 'mod_cook', '0877', 19.99, 12, 2045, '1991-06-09'),
('PS1372', 'Computer Phobic Individuals', 'psychology', '0877', 21.59, 10, 375, '2021-10-21'),
('PC1035', 'But Is It User Friendly?', 'popular_comp', '1389', 22.95, 16, 8780, '1991-06-30'),
('BU2075', 'You Can Combat Computer Stress', 'business', '0736', 2.99, 24, 18722, '1991-06-30'),
('TC3218', 'Onions Leeks and Garlic', 'psychology', '0877', 20.95, 10, 8754, '2021-10-21'),
('UN3333', 'The Unknown Project', 'undecided', '9999', NULL, NULL, 0, '2024-01-01');

INSERT INTO titleauthor (au_id, title_id, au_ord, royaltyper) VALUES 
('111-11-1111', 'BU1111', 1, 60),
('222-22-2222', 'BU1111', 2, 40),
('111-11-1111', 'MC2222', 1, 100),
('333-33-3333', 'PS1372', 1, 100),
('444-44-4444', 'PC1035', 1, 100),
('555-55-5555', 'BU2075', 1, 100),
('111-11-1111', 'TC3218', 1, 100);

INSERT INTO products (prodid, prodname, price, qoh) VALUES 
('PRD01', 'Keyboard', 45.00, 100),
('PRD02', 'Mouse', 25.00, 150);


























