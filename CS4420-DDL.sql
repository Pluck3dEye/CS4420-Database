CREATE DATABASE IF NOT EXISTS partnership_db;
USE partnership_db;

DROP TABLE IF EXISTS Feedback;
DROP TABLE IF EXISTS Payment;
DROP TABLE IF EXISTS Invoice;
DROP TABLE IF EXISTS Contribution;
DROP TABLE IF EXISTS EventParticipants;
DROP TABLE IF EXISTS Agreement;
DROP TABLE IF EXISTS ContactPoint;
DROP TABLE IF EXISTS PartnerAffiliation;
DROP TABLE IF EXISTS CollaborationEvent;
DROP TABLE IF EXISTS Partner;
DROP TABLE IF EXISTS OrganizationalUnit;

-- Core entities
CREATE TABLE OrganizationalUnit (
  unit_id   INT AUTO_INCREMENT PRIMARY KEY,
  name      VARCHAR(255) NOT NULL,
  unit_type ENUM('University','Faculty','Department','Lab','Center'),
  description TEXT,
,  UNIQUE (name, unit_type)
);

CREATE TABLE Partner (
  partner_id   INT AUTO_INCREMENT PRIMARY KEY,
  name         VARCHAR(255) NOT NULL,
  partner_type ENUM('Company','Non-profit','Government','Startup','Association','Organization','Individual','Other'),
  status       ENUM('Prospect','Active','Inactive','Suspended'),
  website      VARCHAR(255),
  industry     VARCHAR(100),
  tax_code     VARCHAR(100),
  notes        TEXT
);

CREATE TABLE CollaborationEvent (
  event_id             INT AUTO_INCREMENT PRIMARY KEY,
  primary_partner_id   INT NOT NULL,
  title                VARCHAR(255) NOT NULL,
  description          TEXT,
  event_type           ENUM('Meeting','Workshop','Training','Competition','Roundtable','Conference','Other'),
  location             VARCHAR(255),
  start_date           DATE,
  end_date             DATE,
  CONSTRAINT fk_event_primary_partner
    FOREIGN KEY (primary_partner_id)
    REFERENCES Partner(partner_id)
    ON DELETE RESTRICT
);

CREATE TABLE PartnerAffiliation (
  affiliation_id INT AUTO_INCREMENT PRIMARY KEY,
  partner_id     INT NOT NULL,
  unit_id        INT NOT NULL,
  start_date     DATE NOT NULL,
  remarks        TEXT,
  UNIQUE KEY uq_affiliation_partner_unit (partner_id, unit_id),
  CONSTRAINT fk_affiliation_partner
    FOREIGN KEY (partner_id)
    REFERENCES Partner(partner_id)
    ON DELETE CASCADE,
  CONSTRAINT fk_affiliation_unit
    FOREIGN KEY (unit_id)
    REFERENCES OrganizationalUnit(unit_id)
    ON DELETE CASCADE
);


CREATE TABLE Agreement (
  agreement_id   INT AUTO_INCREMENT PRIMARY KEY,
  title          VARCHAR(255) NOT NULL,
  affiliation_id INT NOT NULL,
  agreement_type ENUM('MoUs','Contracts','LoIs'),
  status         ENUM('Prospect','Active','Inactive','Suspended'),
  start_date     DATE,
  end_date       DATE,
  file_link      VARCHAR(255),
  CONSTRAINT fk_agreement_affiliation
    FOREIGN KEY (affiliation_id)
    REFERENCES PartnerAffiliation(affiliation_id)
    ON DELETE CASCADE
);


CREATE TABLE ContactPoint (
  contact_id          INT AUTO_INCREMENT PRIMARY KEY,
  partner_id          INT NOT NULL,
  name                VARCHAR(255),
  email               VARCHAR(255),
  phone               VARCHAR(50),
  position            VARCHAR(100),
  is_primary_contact  BOOLEAN DEFAULT FALSE,
  UNIQUE (partner_id, email),
  CONSTRAINT fk_contact_partner
    FOREIGN KEY (partner_id)
    REFERENCES Partner(partner_id)
    ON DELETE CASCADE
);

CREATE TABLE EventParticipants (
  event_id                INT NOT NULL,
  participant_partner_id  INT NOT NULL,
  PRIMARY KEY (event_id, participant_partner_id),
  CONSTRAINT fk_ep_event
    FOREIGN KEY (event_id)
    REFERENCES CollaborationEvent(event_id)
    ON DELETE CASCADE,
  CONSTRAINT fk_ep_partner
    FOREIGN KEY (participant_partner_id)
    REFERENCES Partner(partner_id)
    ON DELETE CASCADE
);

CREATE TABLE Contribution (
  contribution_id   INT AUTO_INCREMENT PRIMARY KEY,
  partner_id        INT NOT NULL,
  event_id          INT,
  contribution_type VARCHAR(100),
  description       TEXT,
  estimated_value   DECIMAL(12,2),
  notes             TEXT,
  CONSTRAINT fk_contrib_partner
    FOREIGN KEY (partner_id)
    REFERENCES Partner(partner_id)
    ON DELETE CASCADE,
  CONSTRAINT fk_contrib_event
    FOREIGN KEY (event_id)
    REFERENCES CollaborationEvent(event_id)
    ON DELETE RESTRICT
);

CREATE TABLE Invoice (
  invoice_id        INT AUTO_INCREMENT PRIMARY KEY,
  event_id          INT NOT NULL,
  issue_date        DATE NOT NULL,
  amount            DECIMAL(12,2) NOT NULL,
  status      		ENUM('Unpaid','Paid','Cancelled'),
  reference_number  VARCHAR(100),
  notes             TEXT,
  CONSTRAINT fk_invoice_event
    FOREIGN KEY (event_id)
    REFERENCES CollaborationEvent(event_id)
    ON DELETE CASCADE
);

CREATE TABLE Payment (
  invoice_id         INT PRIMARY KEY,
  payment_date       DATE NOT NULL,
  amount             DECIMAL(12,2) NOT NULL,
  payment_method     ENUM('Cash','Bank Transfer','E-Wallet'),
  payment_reference  VARCHAR(100),
  CONSTRAINT fk_payment_invoice
    FOREIGN KEY (invoice_id)
    REFERENCES Invoice(invoice_id)
    ON DELETE CASCADE
);

CREATE TABLE Feedback (
  feedback_id    INT AUTO_INCREMENT PRIMARY KEY,
  event_id       INT NOT NULL,
  rater_unit_id  INT NOT NULL,
  rating         INT,
  comments       TEXT,
  feedback_date  DATE,
  CONSTRAINT fk_feedback_event
    FOREIGN KEY (event_id)
    REFERENCES CollaborationEvent(event_id)
    ON DELETE CASCADE,
  CONSTRAINT fk_feedback_rater_unit
    FOREIGN KEY (rater_unit_id)
    REFERENCES OrganizationalUnit(unit_id)
    ON DELETE CASCADE
);
