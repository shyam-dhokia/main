USE GWS
go


-- 1. Update ETHNOS reference keys to business keys
Select DISTINCT ethnos From GWS.dbo.[CleanData]

IF OBJECT_ID('dbo.DimEthnos') IS NOT NULL
BEGIN
     DROP TABLE dbo.DimEthnos
END

SELECT DISTINCT
     ETHNOS as ID
     ,CASE
     WHEN ETHNOS = 'H' THEN 'Indian (Asian or Asian British)'
                  WHEN ETHNOS = 'A' THEN 'British (White)'
                  WHEN ETHNOS = 'K' THEN 'Bangladeshi (Asian or Asian British)'
				  WHEN ETHNOS = 'N' THEN 'African (Black or Black British)'
				  WHEN ETHNOS = 'D' THEN 'White and Black Caribbean ([Mixed])'
				  WHEN ETHNOS = 'F' THEN 'White and Asian ([Mixed])'
				  WHEN ETHNOS = 'L' THEN 'Any other Asian background'
				  WHEN ETHNOS = 'B' THEN 'Irish (White)'
     END AS DESCRIPTION

INTO dbo.DimEthnos
FROM GWS.dbo.['RawData']

SELECT * FROM DimEthnos 


-- 2. Update EPITYPE reference keys to business keys

Select DISTINCT epitype From GWS.dbo.[CleanData]

IF OBJECT_ID('dbo.DimEpitype') IS NOT NULL
BEGIN
     DROP TABLE dbo.DimEpitype
END

SELECT DISTINCT
     epitype as ID
     ,CASE
     WHEN epitype = '1' THEN 'General episode'
                  WHEN epitype = '2' THEN 'Delivery episode'
                  WHEN epitype = '3' THEN 'Birth episode'
				  WHEN epitype = '4' THEN 'Formally detained under the provisions of mental health legislation'
				  WHEN epitype = '5' THEN 'Other delivery event'
				  WHEN epitype = '6' THEN 'Other birth event'
     END AS DESCRIPTION

INTO dbo.DimEpitype
FROM GWS.dbo.['RawData']

SELECT * FROM DimEpitype


-- 3. Update ADMINCAT reference keys to business keys

Select DISTINCT admincat From GWS.dbo.[CleanData]

IF OBJECT_ID('dbo.DimAdmincat') IS NOT NULL
BEGIN
     DROP TABLE dbo.DimAdmincat
END

SELECT DISTINCT
     admincat as ID
     ,CASE
     WHEN admincat = '1' THEN 'NHS Patient'
                  WHEN admincat = '2' THEN 'Private Patient'
                  WHEN admincat = '3' THEN 'Amenity Patient'
				  WHEN admincat = '4' THEN 'Category II Patient'
				  WHEN admincat = '98' THEN 'Not Applicable'
				  WHEN admincat = '99' THEN 'Not Known'
     END AS DESCRIPTION

INTO dbo.DimAdmincat
FROM GWS.dbo.['RawData']

SELECT * FROM DimAdmincat


-- 4. Update ADMINCATST reference keys to business keys

Select DISTINCT admincatst From GWS.dbo.[CleanData]

IF OBJECT_ID('dbo.DimAdmincatst') IS NOT NULL
BEGIN
     DROP TABLE dbo.DimAdmincatst
END

SELECT DISTINCT
     admincatst as ID
     ,CASE
     WHEN admincatst = '1' THEN 'NHS Patient'
                  WHEN admincatst = '2' THEN 'Private Patient'
                  WHEN admincatst = '3' THEN 'Amenity Patient'
				  WHEN admincatst = '4' THEN 'Category II Patient'
				  WHEN admincatst = '98' THEN 'Not Applicable'
				  WHEN admincatst = '99' THEN 'Not Known'
     END AS DESCRIPTION

INTO dbo.DimAdmincatst
FROM GWS.dbo.['RawData']

SELECT * FROM DimAdmincatst


-- 5. Update CATEGORY reference keys to business keys

Select DISTINCT category From GWS.dbo.[CleanData]

IF OBJECT_ID('dbo.DimCategory') IS NOT NULL
BEGIN
     DROP TABLE dbo.DimCategory
END

SELECT DISTINCT
     Category as ID
     ,CASE
     WHEN category = '10' THEN 'NHS Patient: Not Formally Detained'
                  WHEN category = '11' THEN 'NHS Patient:Formally Detained under Part II'
                  WHEN category = '12' THEN 'NHS Patient:Formally Detained under Part III'
				  WHEN category = '20' THEN 'Private patient: Not Formally Detained'
				  WHEN category = '21' THEN 'Private Patient:Formally Detained under Part II'
				  WHEN category = '22' THEN 'Private Patient:Formally Detained under Part III'
				  WHEN category = '30' THEN 'Amenity patient: Not Formally Detained'
				  WHEN category = '31' THEN 'Amenity patient: Formally Detained under Part II'
				  WHEN category = '32' THEN 'Amenity patient: Formally Detained under Part III'
     END AS DESCRIPTION

INTO dbo.DimCategory
FROM GWS.dbo.['RawData']

SELECT * FROM DimCategory


-- 6. Update LEGLCAT reference keys to business keys

Select DISTINCT leglcat From GWS.dbo.[CleanData]

IF OBJECT_ID('dbo.DimLeglcat') IS NOT NULL
BEGIN
     DROP TABLE dbo.DimLeglcat
END

SELECT DISTINCT
     leglcat as ID
     ,CASE
     WHEN leglcat = '01' THEN 'Informal'
                  WHEN leglcat = '02' THEN 'Formally detained under the Mental Health Act, Section 2'
                  WHEN leglcat = '03' THEN 'Formally detained under the Mental Health Act, Section 3'
				  WHEN leglcat = '04' THEN 'Formally detained under the Mental Health Act, Section 4'
				  WHEN leglcat = '05' THEN 'Formally detained under the Mental Health Act, Section 5(2)'
				  WHEN leglcat = '06' THEN 'Formally detained under the Mental Health Act, Section 5(4)'
				  WHEN leglcat = '07' THEN 'Formally detained under the Mental Health Act, Section 35'
				  WHEN leglcat = '08' THEN 'Formally detained under the Mental Health Act, Section 36'
				  WHEN leglcat = '09' THEN 'Formally detained under the Mental Health Act, Section 37 (Section 41 restrictions)'
				  WHEN leglcat = '10' THEN 'ormally detained under the Mental Health Act, Section 37 excluding Section 37(4)'
                  WHEN leglcat = '11' THEN 'Formally detained under the Mental Health Act, Section 37(4)'
				  WHEN leglcat = '12' THEN 'Formally detained under the Mental Health Act, Section 38'
				  WHEN leglcat = '13' THEN 'Formally detained under the Mental Health Act, Section 44'
				  WHEN leglcat = '14' THEN 'Formally detained under the Mental Health Act, Section 46'
				  WHEN leglcat = '15' THEN 'Formally detained under the Mental Health Act, Section 47 (Section 49 restrictions)'
				  WHEN leglcat = '16' THEN 'Formally detained under the Mental Health Act, Section 47' 
				  WHEN leglcat = '17' THEN 'Formally detained under the Mental Health Act, Section 48 (Section 49 restrictions)' 
				  WHEN leglcat = '18' THEN 'Formally detained under the Mental Health Act, Section 48' 
				  WHEN leglcat = '19' THEN 'Formally detained under the Mental Health Act, Section 135' 
				  WHEN leglcat = '20' THEN 'Formally detained under the Mental Health Act, Section 136' 
				  WHEN leglcat = '21' THEN 'Formally detained under the previous legislation (fifth schedule)'
				  WHEN leglcat = '22' THEN 'Formally detained under Criminal Procedure (Insanity) Act 1964 as amended by the Criminal Procedures (Insanity and Unfitness to Plead) Act 1991'
				  WHEN leglcat = '23' THEN 'Formally detained under other acts'
				  WHEN leglcat = '24' THEN 'Supervised discharge under the Mental Health (Patients in the Community) Act 1995'
				  WHEN leglcat = '25' THEN 'Formally detained under the Mental Health Act, Section 45A'
				  WHEN leglcat = '26' THEN 'Not Applicable'
				  WHEN leglcat = '27' THEN 'Not Known'
	 END AS DESCRIPTION

INTO dbo.DimLeglcat
FROM GWS.dbo.['RawData']

SELECT * FROM DimLeglcat

-- 7. Update ADMIMETH reference keys to business keys


Select DISTINCT admimeth From GWS.dbo.[CleanData]

IF OBJECT_ID('dbo.DimAdmimeth') IS NOT NULL
BEGIN
     DROP TABLE dbo.DimAdmimeth
END

SELECT DISTINCT
     admimeth as ID
     ,CASE
     WHEN admimeth = '11' THEN 'Waiting List'
                  WHEN admimeth = '12' THEN 'Booked'
                  WHEN admimeth = '13' THEN 'Planned'
				  WHEN admimeth = '21' THEN 'Accident and emergency or dental casualty department of the Health Care Provider'
				  WHEN admimeth = '22' THEN 'General Practitioner: after a request for immediate admission has been made direct to a Hospital Provider'
				  WHEN admimeth = '23' THEN 'Bed bureau'
				  WHEN admimeth = '24' THEN 'Consultant Clinic, of this or another Health Care Provider'
				  WHEN admimeth = '25' THEN 'Admission via Mental Health Crisis Resolution Team'
				  WHEN admimeth = '2A' THEN 'Accident and Emergency Department of another provider where the patient had not been admitted'
				  WHEN admimeth = '2B' THEN 'Transfer of an admitted patient from another Hospital Provider in an emergency'
                  WHEN admimeth = '2C' THEN 'Baby born at home as intended'
				  WHEN admimeth = '2D' THEN 'Other emergency admission'
				  WHEN admimeth = '28' THEN 'Other means'
				  WHEN admimeth = '31' THEN 'Admitted ante-partum'
				  WHEN admimeth = '32' THEN 'Admitted post-partum '

	 END AS DESCRIPTION

INTO dbo.DimAdmimeth
FROM GWS.dbo.['RawData']

SELECT * FROM DimAdmimeth


-- 8. Update ADMIMETH reference keys to business keys
SELECT * FROM GWS.dbo.['RawData']
Select DISTINCT admisorc From GWS.dbo.[CleanData]

IF OBJECT_ID('dbo.DimAdmisorc') IS NOT NULL
BEGIN
     DROP TABLE dbo.DimAdmisorc
END

SELECT DISTINCT
     admisorc as ID
     ,CASE
     WHEN admisorc = '19' THEN 'The usual place of residence'
                  WHEN admisorc = '29' THEN 'Temporary place of residence'
                  WHEN admisorc = '48' THEN 'High security psychiatric hospital'
				  WHEN admisorc = '53' THEN 'NHS other hospital provider: ward for patients who are mentally ill or have learning disabilities'
				  WHEN admisorc = '54' THEN 'NHS run Care Home'
				  WHEN admisorc = '66' THEN 'Local authority foster care, but not in residential accommodation'
				  WHEN admisorc = '69' THEN 'Local authority home or care'
				  WHEN admisorc = '87' THEN 'Non-NHS run hospital'
				 
     END AS DESCRIPTION

INTO dbo.DimAdmisorc
FROM GWS.dbo.['RawData']

SELECT * FROM DimAdmisorc


-- 9. Update CLASSPAT reference keys to business keys
SELECT * FROM GWS.dbo.['RawData']
Select DISTINCT classpat From GWS.dbo.[CleanData]

IF OBJECT_ID('dbo.DimClasspat') IS NOT NULL
BEGIN
     DROP TABLE dbo.DimClasspat
END

SELECT DISTINCT
     classpat as ID
     ,CASE
     WHEN classpat = '1' THEN 'Ordinary admission'
                  WHEN classpat = '2' THEN 'Day case admission'
                  WHEN classpat = '3' THEN 'Regular day attender'
				  WHEN classpat = '4' THEN 'Regular night attender'
				  WHEN classpat = '5' THEN 'Mothers and babies using only delivery facilities'
				  WHEN classpat = '8' THEN 'Not Applicable'
				  WHEN classpat = '9' THEN 'Not Known'
     END AS DESCRIPTION

INTO dbo.DimClasspat
FROM GWS.dbo.['RawData']

SELECT * FROM DimClasspat


-- 10. Update EPISTAT reference keys to business keys
SELECT * FROM GWS.dbo.['RawData']
Select DISTINCT epistat From GWS.dbo.[CleanData]

IF OBJECT_ID('dbo.DimEpistat') IS NOT NULL
BEGIN
     DROP TABLE dbo.DimEpistat
END

SELECT DISTINCT
     epistat as ID
     ,CASE
     WHEN epistat = '1' THEN 'Unfinished'
                  WHEN epistat = '3' THEN 'Finished'
                  WHEN epistat = '9' THEN 'Derived unfinished (not present on processed data)'
			
     END AS DESCRIPTION

INTO dbo.DimEpistat
FROM GWS.dbo.['RawData']

SELECT * FROM DimEpistat

-- Join all new reference tables to original dataset

UPDATE ['RawData'] SET epitype =  DimEpitype.[DESCRIPTION]
FROM ['RawData'] JOIN DimEpitype ON epitype = DimEpitype.ID

UPDATE ['RawData'] SET epistat =  DimEpistat.[DESCRIPTION]
FROM ['RawData'] JOIN DimEpistat ON epistat = DimEpistat.ID

UPDATE ['RawData'] SET admincat =  DimAdmincat.[DESCRIPTION]
FROM ['RawData'] JOIN DimAdmincat ON admincat = DimAdmincat.ID

UPDATE ['RawData'] SET admincatst =  DimAdmincatst.[DESCRIPTION]
FROM ['RawData'] JOIN DimAdmincatst ON admincatst = DimAdmincatst.ID

UPDATE ['RawData'] SET category =  DimCategory.[DESCRIPTION]
FROM ['RawData'] JOIN DimCategory ON category = DimCategory.ID

UPDATE ['RawData'] SET ethnos =  DimEthnos.[DESCRIPTION]
FROM ['RawData'] JOIN DimEthnos ON ethnos = DimEthnos.ID

UPDATE ['RawData'] SET leglcat =  DimLeglcat.[DESCRIPTION]
FROM ['RawData'] JOIN DimLeglcat ON leglcat = DimLeglcat.ID

UPDATE ['RawData'] SET admimeth =  DimAdmimeth.[DESCRIPTION]
FROM ['RawData'] JOIN DimAdmimeth ON admimeth = DimAdmimeth.ID

UPDATE ['RawData'] SET admisorc =  DimAdmisorc.[DESCRIPTION]
FROM ['RawData'] JOIN DimAdmisorc ON admisorc = DimAdmisorc.ID

UPDATE ['RawData'] SET classpat =  DimClasspat.[DESCRIPTION]
FROM ['RawData'] JOIN DimClasspat ON classpat = DimClasspat.ID

-- Select query to return cleansed dataset, which encorporates the business keys created above. NULL values also addressed and removed. 
SELECT
	episode
	, cast(epistart AS DATE) epistart
	, cast(epiend AS DATE) epiend
	, case WHEN epitype IS NULL THEN 'General Episode' ELSE epitype end epitype
	, case WHEN sex = 1 THEN 'Male' 
		   WHEN sex = 2 THEN 'Female' 
		   ELSE 'Not Specified' 
			end sex
	, case WHEN bedyear IS NULL THEN datediff(dd, epistart, epiend) ELSE bedyear end bedyear
	, epidur
	, epistat
	, activage
	, admiage
	, admincat
	, admincatst
	, category
	, cast(dob AS DATE) DoB
	, endage
	, case WHEN ethnos IS NULL THEN 'Unknown' ELSE ethnos end ethnos
	, hesid
	, leglcat
	, lopatid
	, case WHEN newnhsno IS NULL THEN '0000000001' ELSE newnhsno end newnhsno
	, startage
	, cast(admistart AS DATE) admistart
	, case WHEN admimeth IS NULL THEN 'Unknown' ELSE admimeth end admimeth
	, admisorc
	, case WHEN elecdate IS NULL THEN '1900-01-01' ELSE elecdate end elecdate 
	, elecdur
	, classpat
	, diag_01
FROM GWS.dbo.['RawData']

-- SELECT Distinct FROM GWS.dbo.['RawData']  