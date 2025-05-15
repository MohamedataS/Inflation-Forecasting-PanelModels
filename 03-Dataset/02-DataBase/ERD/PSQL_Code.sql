
CREATE DATABASE "MacroEcoDB"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LOCALE_PROVIDER = 'libc'
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

-- ======================================================

BEGIN;  -- Start a transaction block

-- Table: Countries
CREATE TABLE IF NOT EXISTS "Countries" (
    "WEO_Country_Code" VARCHAR NOT NULL,  -- Unique country identifier
    "ISO" VARCHAR NOT NULL,                        -- ISO Alpha-3 code
    "Country" VARCHAR NOT NULL,                    -- Full country name
    CONSTRAINT "Countries_pkey" PRIMARY KEY ("WEO_Country_Code")  -- Primary key constraint
);


-- Table: Subjects
CREATE TABLE IF NOT EXISTS "Subjects" (
    "WEO_Subject_Code" VARCHAR NOT NULL,  -- Unique subject code
    "Subject_Descriptor" VARCHAR,         -- Description of the subject
    "Subject_Notes" text,                 -- Notes or definitions for the subject
    "Units" VARCHAR,                      -- Unit of measurement (e.g., USD, %)
    "Scale" VARCHAR,                      -- Scale of the data (e.g., Billions)
    CONSTRAINT "Subjects_pkey" PRIMARY KEY ("WEO_Subject_Code")  -- Primary key constraint
);


-- Table: Country_Subject_Notes
CREATE TABLE IF NOT EXISTS "Country_Subject_Notes" (
    "WEO_Country_Code" VARCHAR NOT NULL,  -- References Countries table
    "WEO_Subject_Code" VARCHAR NOT NULL,  -- References Subjects table
    "Country_Series_Specific_Notes" text,  -- Notes specific to this country-subject
    "Estimates_Start_After" integer,       -- Year after which values are estimated
    CONSTRAINT "Country_Subject_Notes_pkey" PRIMARY KEY ("WEO_Country_Code", "WEO_Subject_Code"),  -- Composite PK
    CONSTRAINT "Country_Subject_Notes_Country_fkey" FOREIGN KEY ("WEO_Country_Code") REFERENCES "Countries" ("WEO_Country_Code"),
    CONSTRAINT "Country_Subject_Notes_Subject_fkey" FOREIGN KEY ("WEO_Subject_Code") REFERENCES "Subjects" ("WEO_Subject_Code")
);

-- Table: Years
CREATE TABLE IF NOT EXISTS "Years" (
    "Year" integer NOT NULL,                                -- Calendar year
    CONSTRAINT "Years_pkey" PRIMARY KEY ("Year")            -- Primary key
);

-- Table: WEO_Data_Countries
CREATE TABLE IF NOT EXISTS "WEO_Data_Countries" (
    "WEO_Country_Code" VARCHAR NOT NULL,   -- Country reference
    "WEO_Subject_Code" VARCHAR NOT NULL,   -- Subject reference
    "Year" integer NOT NULL,               -- Year reference
    "Value" double precision,              -- Observed or estimated value
    CONSTRAINT "WEO_Data_Countries_pkey" PRIMARY KEY ("WEO_Country_Code", "Year", "WEO_Subject_Code"),  -- Composite PK
    CONSTRAINT "WEO_Data_Countries_Country_fkey" FOREIGN KEY ("WEO_Country_Code") REFERENCES "Countries" ("WEO_Country_Code"),
    CONSTRAINT "WEO_Data_Countries_Year_fkey" FOREIGN KEY ("Year") REFERENCES "Years" ("Year"),
    CONSTRAINT "WEO_Data_Countries_Subject_fkey" FOREIGN KEY ("WEO_Subject_Code") REFERENCES "Subjects" ("WEO_Subject_Code")
);

-- ========================================================

-- Table: Country_Groups
CREATE TABLE IF NOT EXISTS "Country_Groups" (
    "WEO_Country_Group_Code" VARCHAR NOT NULL,  -- Group code (e.g., ALL, G7)
    "Country_Group_ID" VARCHAR,                -- Internal identifier (optional)
    "Country_Group_Name" VARCHAR,              -- Full name of the group
    CONSTRAINT "Country_Groups_pkey" PRIMARY KEY ("WEO_Country_Group_Code")  -- Primary key
);

-- Table: Groups_Subject_Notes
CREATE TABLE IF NOT EXISTS "Groups_Subject_Notes" (
    "WEO_Country_Group_Code" VARCHAR NOT NULL,  -- Reference to Country Groups
    "WEO_Subject_Code" VARCHAR NOT NULL,        -- Reference to Subjects
    "Country_Series_Specific_Notes" text,       -- Notes related to this group-subject pair
    "Estimates_Start_After" integer,            -- Starting year for estimates
    CONSTRAINT "Groups_Subject_Notes_pkey" PRIMARY KEY ("WEO_Country_Group_Code", "WEO_Subject_Code"),  -- Composite PK
    CONSTRAINT "Groups_Subject_Notes_Group_fkey" FOREIGN KEY ("WEO_Country_Group_Code") REFERENCES "Country_Groups" ("WEO_Country_Group_Code"),
    CONSTRAINT "Groups_Subject_Notes_Subject_fkey" FOREIGN KEY ("WEO_Subject_Code") REFERENCES "Subjects" ("WEO_Subject_Code")
);

-- Table: Country_Classes
CREATE TABLE IF NOT EXISTS "Country_Classes" (
    "WEO_Country_Code" VARCHAR NOT NULL,        -- Country reference
    "WEO_Country_Group_Code" VARCHAR NOT NULL,           -- Group code reference
    "Value" boolean,                              -- Indicates membership (true/false)
    CONSTRAINT "Country_Classes_pkey" PRIMARY KEY ("WEO_Country_Code", "Classification_Type"),  -- Composite PK
    CONSTRAINT "Country_Classes_Country_fkey" FOREIGN KEY ("WEO_Country_Code") REFERENCES "Countries" ("WEO_Country_Code"),
    CONSTRAINT "Country_Classes_Group_fkey" FOREIGN KEY ("WEO_Country_Group_Code") REFERENCES "Country_Groups" ("WEO_Country_Group_Code")
);

-- Table: Country_Data_Group
CREATE TABLE IF NOT EXISTS "Country_Data_Group" (
    "WEO_Country_Group_Code" VARCHAR NOT NULL,  -- Group code
    "WEO_Subject_Code" VARCHAR NOT NULL,        -- Subject reference
    "Year" integer NOT NULL,                    -- Reference to year
    "Value" double precision,                   -- Value for this group-year-subject
    CONSTRAINT "Country_Data_Group_pkey" PRIMARY KEY ("WEO_Country_Group_Code", "Year", "WEO_Subject_Code"),  -- Composite PK
    CONSTRAINT "Country_Data_Group_Group_fkey" FOREIGN KEY ("WEO_Country_Group_Code") REFERENCES "Country_Groups" ("WEO_Country_Group_Code"),
    CONSTRAINT "Country_Data_Group_Year_fkey" FOREIGN KEY ("Year") REFERENCES "Years" ("Year"),
    CONSTRAINT "Country_Data_Group_Subject_fkey" FOREIGN KEY ("WEO_Subject_Code") REFERENCES "Subjects" ("WEO_Subject_Code")
);

END;  -- End transaction block