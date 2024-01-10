#1. 
SELECT P.PatientID, P.FirstName, P.LastName, P.DateOfBirth, P.Gender, C.CityName FROM Patients P
JOIN City C ON P.CityID = C.CityID;

#2.
SELECT MaskType, COUNT(*) AS UsageCount FROM Mask
JOIN COVID_Result ON Mask.MaskID = COVID_Result.MaskID GROUP BY MaskType ORDER BY UsageCount ;

#3.
SELECT VaccineName, COUNT(*) AS UsageCount FROM Vaccination JOIN COVID_Result ON Vaccination.VaccineID = COVID_Result.VaccineID GROUP BY VaccineName;

#4.
SELECT AVG(DATEDIFF(CURDATE(), DateOfBirth)/365) AS
AverageAge FROM Patients WHERE COVID = TRUE;

#5.
SELECT P.PatientID, P.FirstName, P.LastName, CR.Recovered_flag FROM Patients P
JOIN COVID_Result CR ON P.PatientID = CR.PatientID;

#6.
SELECT SUM(TotalCases) AS TotalCases, SUM(TotalDeaths) AS TotalDeaths, SUM(TotalRecovered) AS TotalRecovered
FROM Statistics;

#7.
SELECT	R.RegionName, COUNT(H.HospitalID) AS TotalHospitals FROM Region R
LEFT JOIN City C ON
R.RegionID = C.RegionID LEFT JOIN Hospitals H ON C.CityID = H.CityID GROUP
BY R.RegionName ORDER BY
TotalHospitals
DESC limit 1;

#8.
SELECT P.PatientID, P.FirstName, P.LastName FROM Patients P
JOIN COVID_Result CR ON P.PatientID = CR.PatientID WHERE CR.Recovered_flag = false;

#9.
SELECT HospitalName, COUNT(cr.PatientID) AS RecoveredPatients FROM Hospitals
LEFT JOIN COVID_Result cr ON Hospitals.HospitalID = cr.HospitalID
WHERE 
cr.Recovered_flag = 'Y' GROUP BY
HospitalName ORDER BY
RecoveredPatients DESC LIMIT 1;

#10.
SELECT h.HospitalName, tm.TestName FROM Hospitals h
JOIN TestingMethod tm ON h.TestID = tm.TestID ORDER BY h.HospitalName;

#11.
SELECT FirstName, LastName FROM Patients
WHERE
PatientID IN ( SELECT
PatientID FROM
COVID_Result
WHERE VaccineID IS NOT NULL);

#12.
SELECT P.PatientID, P.FirstName, P.LastName, CF.FeedbackText FROM Patients P
JOIN CommunityFeedback CF ON P.PatientID = CF.PatientID;




