# Ethiopian Postal Service Relational Database

A relational database management system designed for the **Ethiopian Postal Service** using **PostgreSQL**. This project models real-world postal operations, including branch management, customer registration, parcel tracking, and inter-city logistics across Ethiopia.

## Database Architecture (Schema)
The database consists of three core normalized tables connected via Primary and Foreign Keys:
* **`post_offices`**: Stores branch details, cities, regions, and Ethiopian postal codes.
* **`customers`**: Manages sender and receiver contact information and locations.
* **`parcels`**: Tracks shipment details, service types (`EMS`, `Standard`), weight, cost in ETB, and delivery status.

## Key Features & SQL Skills Demonstrated
* **Relational Modeling**: Enforced data integrity using `PRIMARY KEY`, `FOREIGN KEY`, `UNIQUE`, and `NOT NULL` constraints.
* **Multi-Table Joins**: Complex `JOIN` queries combining sender, receiver, origin branch, and destination branch details into a unified tracking report.
* **Live Interactive Demo**: Tested and verified on PostgreSQL. [View Live Database on DB Fiddle](https://db-fiddle.com)

## How to Run
1. Open the [`postal_database.sql`](./postal_database.sql) file in this repository.
2. Copy the SQL script and execute it in any PostgreSQL environment (pgAdmin, DBeaver, or DB Fiddle).

---
**Author:** Dagnaw Aysie  
**GitHub:** [dagnaw-aysie](https://github.com)
