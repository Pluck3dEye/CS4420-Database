-- Larger sample data for partnership_db (one university unit)
USE partnership_db;
SET FOREIGN_KEY_CHECKS=0;
DELETE FROM Feedback;
DELETE FROM Payment;
DELETE FROM Invoice;
DELETE FROM Contribution;
DELETE FROM EventParticipants;
DELETE FROM Agreement;
DELETE FROM ContactPoint;
DELETE FROM PartnerAffiliation;
DELETE FROM CollaborationEvent;
DELETE FROM Partner;
DELETE FROM OrganizationalUnit;
SET FOREIGN_KEY_CHECKS=1;

INSERT INTO OrganizationalUnit (unit_id, name, unit_type, description) VALUES
  (1, 'Example University', 'University', 'Main university unit (single university for this DB).'),
  (2, 'Faculty of Engineering', 'Faculty', 'Engineering faculty.'),
  (3, 'Faculty of Science', 'Faculty', 'Science faculty.'),
  (4, 'Faculty of Business', 'Faculty', 'Business school.'),
  (5, 'Department of Computer Science', 'Department', 'CS department under Faculty of Science.'),
  (6, 'Department of Electrical Engineering', 'Department', 'EE department under Faculty of Engineering.'),
  (7, 'AI & Robotics Lab', 'Lab', 'Research lab focusing on AI/Robotics.'),
  (8, 'Sustainability Research Center', 'Center', 'Interdisciplinary sustainability center.'),
  (9, 'Entrepreneurship & Innovation Office', 'Center', 'Supports industry partnerships and startups.');

INSERT INTO Partner (partner_id, name, partner_type, status, website, industry, notes) VALUES
  (1, 'ACME Robotics Co., Ltd.', 'Company', 'Active', 'https://acmerobotics.example', 'Robotics', 'Industry partner for robotics research.'),
  (2, 'GreenGrid Energy PCL', 'Company', 'Active', 'https://greengrid.example', 'Energy', 'Renewable energy partner.'),
  (3, 'Bangkok Tech Alumni Association', 'Association', 'Active', NULL, 'Non-profit', 'Alumni network and mentoring.'),
  (4, 'City Hospital Network', 'Organization', 'Active', 'https://cityhospital.example', 'Healthcare', 'Clinical collaboration partner.'),
  (5, 'FutureFin Bank', 'Company', 'Active', 'https://futurefin.example', 'Finance', 'Fintech collaboration and sponsorship.'),
  (6, 'DataCloud Solutions', 'Company', 'Active', 'https://datacloud.example', 'Cloud', 'Cloud credits and workshops.'),
  (7, 'National Research Council', 'Government', 'Active', NULL, 'Government', 'Funding and policy collaboration.'),
  (8, 'NanoMaterials Startup', 'Startup', 'Prospect', 'https://nanomat.example', 'Materials', 'Potential research commercialization partner.'),
  (9, 'OpenEd Foundation', 'Non-profit', 'Active', 'https://opened.example', 'Education', 'Supports outreach and scholarships.');

INSERT INTO CollaborationEvent (event_id, primary_partner_id, title, description, event_type, location, start_date, end_date, participants_count, estimated_value, notes) VALUES
  (1, 1, 'Robotics Capstone Showcase 2026', 'Student showcase with industry judging.', 'Workshop', 'Main Auditorium', '2026-02-10', '2026-02-10', 150, 25000.00, 'Annual capstone demo day.'),
  (2, 2, 'Sustainable Microgrid Pilot Kickoff', 'Kickoff meeting for campus microgrid pilot.', 'Meeting', 'Energy Lab', '2026-03-05', '2026-03-05', 35, 120000.00, 'Project kickoff.'),
  (3, 6, 'Cloud & Data Engineering Bootcamp', 'Hands-on training on cloud data pipelines.', 'Training', 'Innovation Hub', '2026-01-20', '2026-01-22', 80, 40000.00, '3-day bootcamp.'),
  (4, 5, 'FinTech Case Competition', 'Case competition sponsored by FutureFin.', 'Competition', 'Business School Hall', '2026-04-15', '2026-04-16', 120, 60000.00, 'Regional student competition.'),
  (5, 4, 'Clinical AI Research Roundtable', 'Roundtable on AI applications in healthcare.', 'Roundtable', 'Medical Campus', '2026-05-12', '2026-05-12', 40, 30000.00, 'Invite-only roundtable.');

INSERT INTO PartnerAffiliation (partner_id, unit_id, start_date, remarks, status, notes) VALUES
  (1, 7, '2025-09-01', 'Robotics research sponsorship', 'Active', 'MOU signed; ongoing projects.'),
  (1, 2, '2025-10-15', 'Industry advisory for engineering faculty', 'Active', 'Guest lectures and curriculum input.'),
  (2, 8, '2025-08-20', 'Microgrid pilot collaboration', 'Active', 'Joint grant proposal.'),
  (2, 6, '2025-11-01', 'Smart grid curriculum support', 'Active', 'Equipment donation planned.'),
  (3, 9, '2025-06-10', 'Mentorship program', 'Active', 'Monthly mentoring sessions.'),
  (4, 3, '2025-07-05', 'Clinical data collaboration', 'Active', 'Ethics approvals in progress.'),
  (5, 4, '2025-12-01', 'FinTech sponsorship', 'Active', 'Funds for competition.'),
  (6, 5, '2025-05-18', 'Cloud credits for CS courses', 'Active', 'Annual cloud credits.'),
  (6, 9, '2025-05-18', 'Workshops for startups', 'Active', 'Quarterly workshops.'),
  (7, 1, '2024-01-10', 'National program coordination', 'Active', 'Policy alignment.'),
  (8, 3, '2025-09-25', 'Materials research exploration', 'Prospect', 'Pilot study.'),
  (9, 1, '2023-03-01', 'Outreach and scholarships', 'Active', 'Community outreach.');

INSERT INTO Agreement (agreement_id, title, partner_id, unit_id, agreement_type, start_date, end_date, status, file_link, notes) VALUES
  (1, 'Robotics Lab Sponsorship Agreement', 1, 7, 'Sponsorship', '2025-09-01', '2027-08-31', 'Active', '/files/agreements/robotics_sponsor.pdf', 'Annual sponsorship + equipment.'),
  (2, 'Engineering Advisory MOU', 1, 2, 'MOU', '2025-10-15', '2026-10-14', 'Active', '/files/agreements/eng_advisory_mou.pdf', 'Advisory board participation.'),
  (3, 'Campus Microgrid Pilot Agreement', 2, 8, 'Project', '2025-08-20', '2026-12-31', 'Active', '/files/agreements/microgrid_pilot.pdf', 'Pilot implementation on campus.'),
  (4, 'Smart Grid Equipment Donation Letter', 2, 6, 'Donation', '2025-11-01', '2026-11-01', 'Active', '/files/agreements/smartgrid_donation.pdf', 'Donation of lab equipment.'),
  (5, 'FinTech Competition Sponsorship', 5, 4, 'Sponsorship', '2025-12-01', '2026-12-31', 'Active', '/files/agreements/fintech_sponsor.pdf', 'Cash + mentors.'),
  (6, 'Cloud Credits & Training Agreement', 6, 5, 'Service', '2025-05-18', '2026-05-17', 'Active', '/files/agreements/cloud_credits.pdf', 'Credits + bootcamp support.'),
  (7, 'University Outreach Partnership', 9, 1, 'Partnership', '2023-03-01', '2026-02-28', 'Active', '/files/agreements/opened_outreach.pdf', 'Scholarships and outreach.');

INSERT INTO ContactPoint (contact_id, partner_id, name, email, phone, position, is_primary_contact) VALUES
  (1, 1, 'Narin S.', 'narin@acmerobotics.example', '+66-2-555-0101', 'Partnership Manager', 1),
  (2, 1, 'Kanya P.', 'kanya@acmerobotics.example', '+66-2-555-0102', 'Senior Engineer', 0),
  (3, 2, 'Somchai K.', 'somchai@greengrid.example', '+66-2-555-0201', 'Project Lead', 1),
  (4, 3, 'Wipa S.', 'wipa@alumni.example', '+66-2-555-0301', 'Program Coordinator', 1),
  (5, 4, 'Dr. Arun T.', 'arun@cityhospital.example', '+66-2-555-0401', 'Research Director', 1),
  (6, 5, 'Ploy R.', 'ploy@futurefin.example', '+66-2-555-0501', 'CSR Manager', 1),
  (7, 6, 'Minh N.', 'minh@datacloud.example', '+66-2-555-0601', 'Solutions Architect', 1),
  (8, 7, 'Suda L.', 'suda@nrc.example', '+66-2-555-0701', 'Grants Officer', 1),
  (9, 9, 'Chai C.', 'chai@opened.example', '+66-2-555-0901', 'Program Officer', 1);

INSERT INTO EventParticipants (event_id, participant_partner_id) VALUES
  (1, 1),
  (1, 3),
  (1, 6),
  (2, 2),
  (2, 7),
  (3, 6),
  (3, 3),
  (4, 5),
  (4, 3),
  (4, 9),
  (5, 4),
  (5, 7),
  (5, 6);

INSERT INTO Contribution (contribution_id, partner_id, event_id, contribution_type, description, amount, notes) VALUES
  (1, 1, 1, 'In-kind', 'Provided 3 robot kits for demos', 15000.00, 'Delivered before event.'),
  (2, 3, 1, 'Service', 'Provided volunteer judges', 0.00, '5 judges from alumni.'),
  (3, 6, 1, 'In-kind', 'Cloud compute credits for demo apps', 5000.00, 'Credits valid 6 months.'),
  (4, 2, 2, 'Funding', 'Pilot project funding tranche 1', 80000.00, 'Grant disbursement.'),
  (5, 7, 2, 'Funding', 'Matching funds for microgrid study', 40000.00, 'Pending paperwork.'),
  (6, 6, 3, 'Service', 'Trainers for bootcamp', 0.00, '2 trainers provided.'),
  (7, 6, 3, 'In-kind', 'Cloud credits for participants', 10000.00, 'Per-student credits.'),
  (8, 5, 4, 'Funding', 'Prize pool sponsorship', 30000.00, 'Prizes + logistics.'),
  (9, 3, 4, 'Service', 'Mentors for case competition', 0.00, 'Alumni mentors.'),
  (10, 9, 4, 'Funding', 'Scholarships for participants', 10000.00, 'Scholarships awarded.'),
  (11, 4, 5, 'Data', 'De-identified dataset access', 0.00, 'Subject to ethics approval.'),
  (12, 7, NULL, 'Funding', 'General partnership grant', 50000.00, 'Not tied to a specific event.');

INSERT INTO Invoice (invoice_id, event_id, issue_date, amount, status, reference_number, notes) VALUES
  (1, 1, '2026-02-15', 12000.00, 'Paid', 'INV-2026-0001', 'Sponsorship billing (partial).'),
  (2, 1, '2026-02-20', 8000.00, 'Paid', 'INV-2026-0002', 'Equipment support.'),
  (3, 2, '2026-03-10', 60000.00, 'Paid', 'INV-2026-0003', 'Microgrid pilot tranche.'),
  (4, 2, '2026-03-20', 20000.00, 'Paid', 'INV-2026-0004', 'Consulting and site prep.'),
  (5, 3, '2026-01-25', 15000.00, 'Paid', 'INV-2026-0005', 'Bootcamp sponsorship.'),
  (6, 4, '2026-04-20', 30000.00, 'Paid', 'INV-2026-0006', 'Competition sponsorship.'),
  (7, 4, '2026-04-25', 5000.00, 'Paid', 'INV-2026-0007', 'Marketing & venue.'),
  (8, 5, '2026-05-20', 10000.00, 'Paid', 'INV-2026-0008', 'Roundtable support.');

INSERT INTO Payment (invoice_id, payment_date, amount, payment_method, payment_reference) VALUES
  (1, '2026-02-28', 12000.00, 'Bank Transfer', 'PAY-0001'),
  (2, '2026-03-05', 8000.00, 'Bank Transfer', 'PAY-0002'),
  (3, '2026-03-25', 60000.00, 'Bank Transfer', 'PAY-0003'),
  (4, '2026-04-01', 20000.00, 'Credit Card', 'PAY-0004'),
  (5, '2026-02-05', 15000.00, 'Bank Transfer', 'PAY-0005'),
  (6, '2026-05-01', 30000.00, 'Bank Transfer', 'PAY-0006'),
  (7, '2026-05-10', 5000.00, 'Bank Transfer', 'PAY-0007'),
  (8, '2026-06-01', 10000.00, 'Bank Transfer', 'PAY-0008');

INSERT INTO Feedback (feedback_id, event_id, rater_unit_id, rating, comments, feedback_date) VALUES
  (1, 1, 2, 5, 'Excellent engagement with industry judges.', '2026-02-11'),
  (2, 1, 2, 4, 'Would like more time for demos.', '2026-02-12'),
  (3, 1, 5, 5, 'Strong student outcomes.', '2026-02-13'),
  (4, 2, 8, 4, 'Good kickoff; clarify milestones next meeting.', '2026-03-06'),
  (5, 2, 6, 4, 'Need more technical documentation.', '2026-03-07'),
  (6, 3, 9, 5, 'Bootcamp was very helpful for startups.', '2026-01-23'),
  (7, 3, 5, 4, 'Add more hands-on labs.', '2026-01-24'),
  (8, 4, 4, 5, 'Great participation from sponsors and students.', '2026-04-17'),
  (9, 4, 9, 4, 'More outreach to underclassmen next year.', '2026-04-18'),
  (10, 5, 3, 4, 'Useful discussion; share minutes promptly.', '2026-05-13'),
  (11, 5, 8, 5, 'High impact topics; plan follow-up session.', '2026-05-14');

