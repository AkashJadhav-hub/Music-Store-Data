-- Create table: employee
CREATE TABLE employee (
    employee_id NUMBER PRIMARY KEY,
    last_name VARCHAR2(50) NOT NULL,
    first_name VARCHAR2(50) NOT NULL,
    title VARCHAR2(50),
    reports_to NUMBER,
    birthdate DATE,
    hire_date DATE,
    address VARCHAR2(100),
    city VARCHAR2(50),
    state VARCHAR2(50),
    country VARCHAR2(50),
    postal_code VARCHAR2(20),
    phone VARCHAR2(20),
    fax VARCHAR2(20),
    email VARCHAR2(100),
    CONSTRAINT fk_reports_to FOREIGN KEY (reports_to) REFERENCES employee(employee_id)
);
----------------------------------------------------------------------------------------------------------------------
-- Create table: customer
CREATE TABLE customer (
    customer_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(50) NOT NULL,
    last_name VARCHAR2(50) NOT NULL,
    company VARCHAR2(50),
    address VARCHAR2(100),
    city VARCHAR2(50),
    state VARCHAR2(50),
    country VARCHAR2(50),
    postal_code VARCHAR2(20),
    phone VARCHAR2(20),
    fax VARCHAR2(20),
    email VARCHAR2(100),
    support_rep_id NUMBER,
    CONSTRAINT fk_support_rep FOREIGN KEY (support_rep_id) REFERENCES employee(employee_id)
);
---------------------------------------------------------------------------------------------------------------------
-- Create table: invoice
CREATE TABLE invoice (
    invoice_id NUMBER PRIMARY KEY,
    customer_id NUMBER NOT NULL,
    invoice_date DATE NOT NULL,
    billing_address VARCHAR2(100),
    billing_city VARCHAR2(50),
    billing_state VARCHAR2(50),
    billing_country VARCHAR2(50),
    billing_postal_code VARCHAR2(20),
    total NUMBER NOT NULL,
    CONSTRAINT fk_customer FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);
-----------------------------------------------------------------------------------------------------------------------
-- Create table: invoice_line
CREATE TABLE invoice_line (
    invoice_line_id NUMBER PRIMARY KEY,
    invoice_id NUMBER NOT NULL,
    track_id NUMBER NOT NULL,
    unit_price NUMBER NOT NULL,
    quantity NUMBER NOT NULL,
    CONSTRAINT fk_invoice FOREIGN KEY (invoice_id) REFERENCES invoice(invoice_id),
    CONSTRAINT fk_track FOREIGN KEY (track_id) REFERENCES track(track_id)
);
-------------------------------------------------------------------------------------------------------------------------
-- Create table: playlist
CREATE TABLE playlist (
    playlist_id NUMBER PRIMARY KEY,
    name VARCHAR2(50)
);
-------------------------------------------------------------------------------------------------------------------------
-- Create table: playlist_track
CREATE TABLE playlist_track (
    playlist_id NUMBER NOT NULL,
    track_id NUMBER NOT NULL,
    CONSTRAINT pk_playlist_track PRIMARY KEY (playlist_id, track_id),
    CONSTRAINT fk_playlist FOREIGN KEY (playlist_id) REFERENCES playlist(playlist_id),
    CONSTRAINT fk_track_playlist FOREIGN KEY (track_id) REFERENCES track(track_id)
);
------------------------------------------------------------------------------------------------------------------------
-- Create table: track
CREATE TABLE track (
    track_id NUMBER PRIMARY KEY,
    name VARCHAR2(200) NOT NULL,
    album_id NUMBER,
    media_type_id NUMBER NOT NULL,
    genre_id NUMBER,
    composer VARCHAR2(200),
    milliseconds NUMBER NOT NULL,
    bytes NUMBER,
    unit_price NUMBER NOT NULL,
    CONSTRAINT fk_album FOREIGN KEY (album_id) REFERENCES album(album_id),
    CONSTRAINT fk_media_type FOREIGN KEY (media_type_id) REFERENCES media_type(media_type_id),
    CONSTRAINT fk_genre FOREIGN KEY (genre_id) REFERENCES genre(genre_id)
);
---------------------------------------------------------------------------------------------------------------------------------
-- Create table: album
CREATE TABLE album (
    album_id NUMBER PRIMARY KEY,
    title VARCHAR2(200) NOT NULL,
    artist_id NUMBER NOT NULL,
    CONSTRAINT fk_artist FOREIGN KEY (artist_id) REFERENCES artist(artist_id)
);
---------------------------------------------------------------------------------------------------------------------------------
-- Create table: artist
CREATE TABLE artist (
    artist_id NUMBER PRIMARY KEY,
    name VARCHAR2(200)
);
--------------------------------------------------------------------------------------------------------------------------------------
-- Create table: media_type
CREATE TABLE media_type (
    media_type_id NUMBER PRIMARY KEY,
    name VARCHAR2(50)
);
--------------------------------------------------------------------------------------------------------------------------------------
-- Create table: genre
CREATE TABLE genre (
    genre_id NUMBER PRIMARY KEY,
    name VARCHAR2(50)
);
------------------------------------------------------------------------------------------------------------------------------------
select * from customer;
desc customer;


drop table employee;

select * from employee;


DROP TABLE employee CASCADE CONSTRAINTS;


select * from employee;


INSERT INTO employee (
    employee_id, last_name, first_name, title, reports_to, birthdate, hire_date,
    address, city, state, country, postal_code, phone, fax, email
) VALUES (
    1, 'Smith', 'John', 'Manager', NULL, TO_DATE('1980-01-15', 'YYYY-MM-DD'),
    TO_DATE('2005-06-23', 'YYYY-MM-DD'), '123 Elm St', 'Seattle', 'WA', 'USA',
    '98101', '555-1234', NULL, 'john.smith@example.com'
);

INSERT INTO employee (
    employee_id, last_name, first_name, title, reports_to, birthdate, hire_date,
    address, city, state, country, postal_code, phone, fax, email
) VALUES (
    2, 'Johnson', 'Mary', 'Developer', 1, TO_DATE('1985-03-22', 'YYYY-MM-DD'),
    TO_DATE('2010-09-15', 'YYYY-MM-DD'), '456 Oak St', 'Portland', 'OR', 'USA',
    '97209', '555-5678', NULL, 'mary.johnson@example.com'
);

INSERT INTO employee (
    employee_id, last_name, first_name, title, reports_to, birthdate, hire_date, address, city, state, country, postal_code, phone, fax, email
) VALUES (
    3, 'Peacock', 'Jane', 'Sales Support Agent', 2, TO_DATE('1973-08-29', 'YYYY-MM-DD'), TO_DATE('2017-04-01', 'YYYY-MM-DD'), '1111 6 Ave SW', 'Calgary', 'AB', 'Canada', 'T2P 5M5', '+1 (403) 262-3443', '+1 (403) 262-6712', 'jane@chinookcorp.com'
);

INSERT INTO employee (
    employee_id, last_name, first_name, title, reports_to, birthdate, hire_date, address, city, state, country, postal_code, phone, fax, email
) VALUES (
    4, 'Park', 'Margaret', 'Sales Support Agent', 2, TO_DATE('1947-09-19', 'YYYY-MM-DD'), TO_DATE('2017-05-03', 'YYYY-MM-DD'), '683 10 Street SW', 'Calgary', 'AB', 'Canada', 'T2P 5G3', '+1 (403) 263-4423', '+1 (403) 263-4289', 'margaret@chinookcorp.com'
);

INSERT INTO employee (
    employee_id, last_name, first_name, title, reports_to, birthdate, hire_date, address, city, state, country, postal_code, phone, fax, email
) VALUES (
    5, 'Johnson', 'Steve', 'Sales Support Agent', 2, TO_DATE('1965-03-03', 'YYYY-MM-DD'), TO_DATE('2017-10-17', 'YYYY-MM-DD'), '7727B 41 Ave', 'Calgary', 'AB', 'Canada', 'T3B 1Y7', '1 (780) 836-9987', '1 (780) 836-9543', 'steve@chinookcorp.com'
);

INSERT INTO employee (
    employee_id, last_name, first_name, title, reports_to, birthdate, hire_date, address, city, state, country, postal_code, phone, fax, email
) VALUES (
    6, 'Mitchell', 'Michael', 'IT Manager', 1, TO_DATE('1973-07-01', 'YYYY-MM-DD'), TO_DATE('2016-10-17', 'YYYY-MM-DD'), '5827 Bowness Road NW', 'Calgary', 'AB', 'Canada', 'T3B 0C5', '+1 (403) 246-9887', '+1 (403) 246-9899', 'michael@chinookcorp.com'
);

INSERT INTO employee (
    employee_id, last_name, first_name, title, reports_to, birthdate, hire_date, address, city, state, country, postal_code, phone, fax, email
) VALUES (
    7, 'King', 'Robert', 'IT Staff', 6, TO_DATE('1970-05-29', 'YYYY-MM-DD'), TO_DATE('2017-01-02', 'YYYY-MM-DD'), '590 Columbia Boulevard West', 'Lethbridge', 'AB', 'Canada', 'T1K 5N8', '+1 (403) 456-9986', '+1 (403) 456-8485', 'robert@chinookcorp.com'
);

INSERT INTO employee (
    employee_id, last_name, first_name, title, reports_to, birthdate, hire_date, address, city, state, country, postal_code, phone, fax, email
) VALUES (
    8, 'Callahan', 'Laura', 'IT Staff', 6, TO_DATE('1968-01-09', 'YYYY-MM-DD'), TO_DATE('2017-03-04', 'YYYY-MM-DD'), '923 7 ST NW', 'Lethbridge', 'AB', 'Canada', 'T1H 1Y8', '+1 (403) 467-3351', '+1 (403) 467-8772', 'laura@chinookcorp.com'
);

INSERT INTO employee (
    employee_id, last_name, first_name, title, reports_to, birthdate, hire_date, address, city, state, country, postal_code, phone, fax, email
) VALUES (
    9, 'Madan', 'Mohan', 'Senior General Manager', NULL, TO_DATE('1961-01-26', 'YYYY-MM-DD'), TO_DATE('2016-01-14', 'YYYY-MM-DD'), '1008 Vrinda Ave MT', 'Edmonton', 'AB', 'Canada', 'T5K 2N1', '+1 (780) 428-9482', '+1 (780) 428-3457', 'madan.mohan@chinookcorp.com'
);

select * from employee;

COMMIT;


-------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------


 Question Set 1 - Easy

--  1. Who is the senior most employee based on job title?
->
     SELECT first_name, last_name, title FROM employee WHERE title = 'Senior General Manager';
     
--  2. Which countries have the most invoices?
->
WITH CTE AS(SELECT billing_country , COUNT(invoice_id)cnt , dense_rank() OVER(ORDER BY COUNT(invoice_id) DESC)ran FROM invoice
GROUP BY billing_country) SELECT billing_country , cnt FROM CTE WHERE ran = 1;

--  3. What are the top 3 values of total invoice?
->     
     WITH CTE AS(SELECT total, dense_rank() OVER(ORDER BY total DESC)ran FROM invoice) SELECT DISTINCT(total)Top_3_values FROM CTE
WHERE ran IN(1,2,3) ORDER BY total DESC;

--  4. Which city has the best customers? We would like to throw a promotional Music Festival in the city we made the most money.
--       Write a query that returns one city that has the highest sum of invoice totals. Return both the city name & sum of all invoice totals.
->
SELECT billing_city, SUM(total) AS TotalRevenue FROM invoice GROUP BY billing_city ORDER BY TotalRevenue DESC FETCH FIRST 1 ROWS ONLY;


SELECT * FROM INVOICE;

--  5. Who is the best customer? The customer who has spent the most money will be declared the best customer.
--      Write a query that returns the person who has spent the most money.
->
     SELECT customer_id, Cust_Name,TotalSpent FROM ( SELECT C.customer_id, first_name || ' ' || last_name AS Cust_Name, SUM(I.total) AS TotalSpent
    FROM customer C   INNER JOIN invoice I ON C.customer_id = I.customer_id  GROUP BY C.customer_id, C.first_name, C.last_name
    ORDER BY TotalSpent DESC ) WHERE ROWNUM = 1;

SELECT * FROM CUSTOMER;
commit;

-----------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------


Question Set 2 - Moderate :-

--  1. Write a query to return the email, first name, last name, & Genre of all Rock Music listeners.
--      Return your list ordered alphabetically by email starting with A.
->
SELECT DISTINCT C.first_name, C.last_name, C.email, (G.name)genre_name
FROM customer C
INNER JOIN invoice I
ON C.customer_id = I.customer_id
INNER JOIN invoice_line IL
ON I.invoice_id = IL.invoice_id
INNER JOIN track T
ON IL.track_id = T.track_id
INNER JOIN genre G
ON T.genre_id = G.genre_id
WHERE G.name = 'Rock'
ORDER BY C.email;

-- 2. Let's invite the artists who have written the most rock music in our dataset. Write a query that returns the Artist name and total track
--    count of the top 10 rock bands.
->
SELECT A.name AS ArtistName, COUNT(P.playlist_id) AS total_track_count
FROM artist A
INNER JOIN album AL
ON A.artist_id = AL.artist_id
INNER JOIN track T
ON AL.album_id = T.album_id
INNER JOIN playlist_track P
ON T.track_id = P.track_id
INNER JOIN genre G
ON T.genre_id = G.genre_id
WHERE G.name = 'Rock'
GROUP BY A.name
ORDER BY total_track_count DESC
FETCH FIRST 10 ROWS ONLY;


-- 3. Return all the track names that have a song length longer than the average song length. Return the Name and Milliseconds for each track.
--    Order by the song length with the longest songs listed first.
->  
SELECT name, milliseconds
FROM track
WHERE milliseconds > (SELECT AVG(milliseconds) FROM track)
ORDER BY milliseconds DESC;


------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------


Question Set 3 - Advance :-

--  1. Find how much amount spent by each customer on artists? Write a query to return customer name, artist name and total spent.
->
     SELECT 
    C.first_name || ' ' || C.last_name AS cust_name,
    A.name AS artist_name,
    SUM(IL.unit_price * IL.quantity) AS total_spent,
    SUM(SUM(IL.unit_price * IL.quantity)) OVER () AS total_spend
FROM 
    customer C
INNER JOIN 
    invoice I ON C.customer_id = I.customer_id
INNER JOIN 
    invoice_line IL ON I.invoice_id = IL.invoice_id
INNER JOIN 
    track T ON IL.track_id = T.track_id
INNER JOIN 
    album AL ON T.album_id = AL.album_id
INNER JOIN 
    artist A ON AL.artist_id = A.artist_id
GROUP BY 
    C.first_name, C.last_name, A.name
ORDER BY 
    total_spent DESC;

--  2. We want to find out the most popular music Genre for each country. We determine the most popular genre as the genre with the 
--      highest amount of purchases. 
->
         WITH CTE AS(
SELECT (I.billing_country)Country, (G.name)Genre_name, SUM(IL.quantity)No_of_purchase, DENSE_RANK() OVER(PARTITION BY I.billing_country ORDER BY SUM(IL.quantity) DESC)ran
FROM invoice I
INNER JOIN invoice_line IL
ON I.invoice_id = IL.invoice_id
INNER JOIN track T
ON IL.track_id = T.track_id
INNER JOIN genre G
ON T.genre_id = G.genre_id
GROUP BY I.billing_country, G.name)

SELECT Country, Genre_name FROM CTE
WHERE ran = 1;

--  3. Write a query that returns each country along with the top Genre. For countries where the maximum number of purchases is shared
--       return all Genres.
->
       WITH GenrePurchases AS (
    SELECT 
        C.country,
        G.name AS genre_name,
        COUNT(*) AS purchase_count
    FROM 
        customer C
    INNER JOIN 
        invoice I ON C.customer_id = I.customer_id
    INNER JOIN 
        invoice_line IL ON I.invoice_id = IL.invoice_id
    INNER JOIN 
        track T ON IL.track_id = T.track_id
    INNER JOIN 
        genre G ON T.genre_id = G.genre_id
    GROUP BY 
        C.country, G.name
),
MaxPurchases AS (
    SELECT 
        country,
        MAX(purchase_count) AS max_purchase_count
    FROM 
        GenrePurchases
    GROUP BY 
        country
)
SELECT 
    GP.country,
    GP.genre_name,
    GP.purchase_count
FROM 
    GenrePurchases GP
JOIN 
    MaxPurchases MP
ON 
    GP.country = MP.country AND GP.purchase_count = MP.max_purchase_count
ORDER BY 
    GP.country, GP.genre_name;

-- 4.Write a query that determines the customer that has spent the most on music for each country. Write a query that returns the country
     along with the top customer and how much they spent. For countries where the top amount spent is shared, provide all customers who spent this amount.
->
WITH CTE AS (
    SELECT 
        I.billing_country AS country,
        C.first_name || ' ' || C.last_name AS cust_name,
        SUM(I.total) AS total_spendings,
        DENSE_RANK() OVER (PARTITION BY I.billing_country ORDER BY SUM(I.total) DESC) AS ran
    FROM 
        customer C
    INNER JOIN 
        invoice I ON C.customer_id = I.customer_id
    GROUP BY 
        I.billing_country, C.first_name, C.last_name
)
SELECT 
    country, 
    cust_name, 
    total_spendings
FROM 
    CTE
WHERE 
    ran = 1;

--------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------
commit;
