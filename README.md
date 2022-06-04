# EDUCATIONAL DATA MINING FOR STUDENT’S UNIVERSITY SELECTION IN UNITED STATES

PROBLEM DEFINITION :
This research aims solutions for Educational Data Mining problems by applying descriptive and 
predictive techniques such as hierarchical clustering, k-means clustering, Decision Trees, and 
regression analysis. This research will assist in presenting effective algorithms for students, 
universities, and government authorities in order to simplify the admission process and 
increase university enrolment numbers
Due to the rapid increase in the cost of living on campus, the admission yield of the certain 
university is dropped, and due to the availability of a large number of universities students are 
facing issues while selecting universities as per their requirements. Government officials can 
work on certain aid to boost enrolment in such universities and students can target the desired 
university.

DATASET : University Admissions (https://www.kaggle.com/datasets/samsonqian/college-admissions) 
It is a publicly available dataset on university admissions in the United States. The collection 
includes information including over 1517 universities it has more than 100 columns. Its 
characteristics allow you to obtain insights into admission data for each university from various 
perspectives: from the number of applicants, how many students offered admissions, how 
many actually enrolled, the total price for in-state or out-of-state students to live on campus, 
total part-time enrolment as well as full-time enrolment, grant aid or a loan aid, etc. 

3.1 DATA SET PRE-PROCESSING :
Before analysis of any data set, it should first be pre-processed. This implies that perhaps the 
information should be outlined with a particular goal in mind in order for a conclusion to be 
obtained.
i. Columns like “Level of the institution”, “Tribal college” were removed because all record 
has common data so it’s not going to help for any kind of discovery. 
ii. Derived one column to store a Boolean flag to identify a university or a college that is historically 
black.
iii. Some columns have less relevance to targeted knowledge discovery so removed
iv. “FIPS state code” column has same data as “State abbreviation” column so removed this 
column in data pre-processing
v. Some universities do not have any value in the required column so removed these entries
