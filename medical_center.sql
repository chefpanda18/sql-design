DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE medical_centers
(
    id SERIAL PRIMARY KEY,
    name TEXT,
    doctor_id INTEGER REFERENCES doctors ON DELETE CASCADE
)

CREATE TABLE doctors
(
    id SERIAL PRIMARY KEY,
    dr_first_name TEXT,
    dr_last_name TEXT,
    patient_id INTEGER REFERENCES patients ON DELETE CASCADE
)

CREATE TABLE visits
(
    id SERIAL PRIMARY KEY,
    doctor_id INTEGER REFERENCES doctors ON DELETE CASCADE,
    patient_id INTEGER REFERENCES patients ON DELETE CASCADE,
    date DATE
)

CREATE TABLE patients
(
    id SERIAL PRIMARY KEY,
    p_first_name TEXT,
    p_last_name TEXT,
    doctor_id INTEGER REFERENCES doctors ON DELETE CASCADE,
    disease_id INTEGER REFERENCES diseases ON DELETE CASCADE
)

CREATE TABLE diagnoses
(
    id SERIAL PRIMARY KEY,
    visit_id INTEGER REFERENCES visits ON DELETE CASCADE
)

CREATE TABLE diseases
(
    id SERIAL PRIMARY KEY,
    disease_name TEXT,
    description TEXT
)