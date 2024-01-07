CREATE database mentormind;
USE mentormind;
-- Create Patient table
CREATE TABLE Patient (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    firstName VARCHAR(255) NOT NULL,
    lastName VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    phoneNumber VARCHAR(20)
);

-- Create Test table
CREATE TABLE Test (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    testName VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2)
);

-- Create TestOrder table
CREATE TABLE TestOrder (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    patient_id BIGINT NOT NULL,
    orderDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(50),
    FOREIGN KEY (patient_id) REFERENCES Patient(id)
);

-- Create TestOrderTests table for the many-to-many relationship between TestOrder and Test
CREATE TABLE TestOrderTests (
    test_order_id BIGINT NOT NULL,
    test_id BIGINT NOT NULL,
    PRIMARY KEY (test_order_id, test_id),
    FOREIGN KEY (test_order_id) REFERENCES TestOrder(id),
    FOREIGN KEY (test_id) REFERENCES Test(id)
);

-- Create Prescription table
CREATE TABLE Prescription (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    test_order_id BIGINT NOT NULL,
    prescriptionFilePath VARCHAR(255) NOT NULL,
    prescriptionDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    comments TEXT,
    FOREIGN KEY (test_order_id) REFERENCES TestOrder(id)
);




