CREATE DATABASE warehouse_accounting;

CREATE TABLE transfer_to_implementation ( 
    id INT NOT NULL , 
    id_contract INT NOT NULL , 
    date DATE NOT NULL , 
    PRIMARY KEY (id)
    UNIQUE (id_contract)
);

CREATE TABLE obtaining_finished_products ( 
    id INT NOT NULL , 
    id_contract INT NOT NULL , 
    date DATE NOT NULL , 
    PRIMARY KEY (id)
    UNIQUE (id_contract)
    FOREIGN KEY (id) REFERENCES transfer_to_implementation(id_contract) ON DELETE CASCADE
);

CREATE TABLE transfer_to_production ( 
    id INT NOT NULL , 
    id_contract INT NOT NULL , 
    date DATE NOT NULL , 
    PRIMARY KEY (id)
    UNIQUE (id_contract)
    FOREIGN KEY (id) REFERENCES obtaining_finished_products(id_contract) ON DELETE CASCADE
);

CREATE TABLE data_of_receiving ( 
    id INT NOT NULL , 
    id_contract INT NOT NULL , 
    date DATE NOT NULL , 
    PRIMARY KEY (id)
    UNIQUE (id_contract)
    FOREIGN KEY (id) REFERENCES transfer_to_production(id_contract) ON DELETE CASCADE
);

CREATE TABLE provider ( 
    id INT NOT NULL , 
    id_contract INT NOT NULL ,
    name TEXT NOT NULL , 
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES data_of_receiving(id_contract) ON DELETE CASCADE
);

CREATE TABLE contract ( 
    id INT NOT NULL , 
    name TEXT NOT NULL , 
    raw_or_materials_and_semi-finished products TEXT NOT NULL ,
    price INT NOT NULL , 
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES provider(id_contract) ON DELETE CASCADE
);