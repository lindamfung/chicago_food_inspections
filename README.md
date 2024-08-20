# Chicago Food Inspections
## Data Engineering Final Project: Putting It All Together

### Objectives

- Understanding data and articulation of business case
- End to end process of gathering, preparing and storing data in a relational database
- Analyzing data and creating reports and dashboards to enable business decision
making

### Project

The goal behind the final project is to ‘put it all together’ by developing a coherent, concise,
and realistic analysis in the form of a report or presentation to an executive audience (your
client). The project will provide you with the opportunity to apply your knowledge and
understanding of data collection, design and implementation of a database, analysis and
visualization, and providing recommendations to your client.

### Submissions

Following artifacts would be developed by the student:
- Enhanced Entity Relatonship (EER) model using My Sql workbench
- SQL script file containing all important analysis queries
- Visualization Dashboards/Reports – Tableau, Excel or PowerBI, etc. (raw files)
- Project Report (as pptx or pdf)

### Project Report

The project report should contain the following sections and be written for the intended
executive audience in mind:
- Executive summary
- Research objective(s)
  - The problem to be solved and data you plan on using
- Methodology and various tools used in the process
  - At least 5 relational database tables (3NF+), EER diagram
  - Potentially use a No-SQL database to completement the relational database
- Data analysis and Visualization
  - Insights using at least 4 moderately complex SQL queries
  - Insights using at least 4 reports and a dashboard/storyboard
- Recommendations
  - Corrective measures and scope for improvement
- Lessons Learned

### Data

Download the following public data sets from https://data.cityofchicago.org/. Use the export
to CSV feature to download the data.

**Food Inspections**

https://data.cityofchicago.org/Health-Human-Services/Food-Inspections/4ijn-s7e5

**Business Licences**

https://data.cityofchicago.org/Community-Economic-Development/Business-Licenses/r5kzchrr

### Project Stages

#### BUSINESS PROBLEM

1. Understand and formulate business problem
  - Extract (download) the data from the city of chicago data portal
  - Analyze the business problem, available data
  - What are some of the key business questions one can ask from this data ?
  - How would you slice and dice the data to best address business questions ?

#### DATA MODELING

2. Create conceputal model (entities, relationships)
  - What are the high level entities and relationships between them ?
3. Create the logical model (add attributes) and perfom normalization if needed
  - What are the the attributes of these entities ?
  - Identify opportunities for normalization (3NF) if any
  - Identify primary keys, foreign keys and other constraints
  - Identify and model look-up/reference tables that contain static values (E.g.
County/City, etc.)
4. Create and finalize physical model (add datatypes)
  - Identify MySQL data types and column sizes that are most appropriate for the
attributes
  - Create the EER model using MySQL workbench

#### DATABASE CREATION

5. Create tables in the database
  - Create an empty database schema named “Food_Inspections”
  - Use Forward Engineering to create tables from the EER model in this database
schema
6. Prepare raw data for loading into tables
  - Remove columns that are not useful for your analysis
  - Remove rows/columns with too many missing values
  - Clean up data if there are quality issues
7. Load data into tables
  - Write SQL scripts or use the CSV import feature to load raw data into tables
  - Vaildate that the data has been correctly loaded such as dates, primary keys, etc.
  - If there are issues fix the SQL scripts and re-import the data

#### ANALYTICS

8. Develop SQL queries that answer your business questions
9. Connect BI/visualization tool to database
  - How do you create insightful visualizations from this dataset ?
  - Design reports and dashboards that can answer business questions
10. Document findings and recommendations
  - Create final project report 
