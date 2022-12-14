CREATE DATABASE fitnessNow_db;
CREATE USER 'webapp'@'%' IDENTIFIED BY 'abc123';
GRANT ALL PRIVILEGES ON fitnessNow_db.* TO 'webapp'@'%';
FLUSH PRIVILEGES;

USE fitnessNow_db;


CREATE TABLE Nutritionists (
    nutritionistID INTEGER PRIMARY KEY NOT NULL,
    name VARCHAR(20) NOT NULL,
    firstName VARCHAR(20) NOT NULL,
    lastName VARCHAR(20) NOT NULL,
    email VARCHAR(40) NOT NULL UNIQUE
);

CREATE TABLE PersonalTrainers (
    trainerID INTEGER PRIMARY KEY NOT NULL,
    name VARCHAR(20) NOT NULL,
    firstName VARCHAR(20) NOT NULL,
    lastName VARCHAR(20) NOT NULL,
    email VARCHAR(40) NOT NULL UNIQUE
);

CREATE TABLE DietPlan (
    dietPlanID INTEGER PRIMARY KEY NOT NULL,
    nutritionistID INTEGER NOT NULL,
    dietaryRestrictions VARCHAR(40),
    dailyCalorieGoal INTEGER,
    FOREIGN KEY (nutritionistID) REFERENCES Nutritionists(nutritionistID)
);

CREATE TABLE MondayDiet (
    dietPlanID INTEGER PRIMARY KEY,
    breakfast VARCHAR(40),
    lunch VARCHAR(40),
    dinner VARCHAR(40),
    totalCalories integer,
    FOREIGN KEY (dietPlanID) REFERENCES DietPlan(dietPlanID)
);

CREATE TABLE TuesdayDiet (
    dietPlanID INTEGER PRIMARY KEY,
    breakfast VARCHAR(40),
    lunch VARCHAR(40),
    dinner VARCHAR(40),
    totalCalories integer,
    FOREIGN KEY (dietPlanID) REFERENCES DietPlan(dietPlanID)
);

CREATE TABLE WednesdayDiet (
    dietPlanID INTEGER PRIMARY KEY,
    breakfast VARCHAR(40),
    lunch VARCHAR(40),
    dinner VARCHAR(40),
    totalCalories integer,
    FOREIGN KEY (dietPlanID) REFERENCES DietPlan(dietPlanID)
);

CREATE TABLE ThursdayDiet (
    dietPlanID INTEGER PRIMARY KEY,
    breakfast VARCHAR(40),
    lunch VARCHAR(40),
    dinner VARCHAR(40),
    totalCalories integer,
    FOREIGN KEY (dietPlanID) REFERENCES DietPlan(dietPlanID)
);

CREATE TABLE FridayDiet (
    dietPlanID INTEGER PRIMARY KEY,
    breakfast VARCHAR(40),
    lunch VARCHAR(40),
    dinner VARCHAR(40),
    totalCalories integer,
    FOREIGN KEY (dietPlanID) REFERENCES DietPlan(dietPlanID)
);

CREATE TABLE SaturdayDiet (
    dietPlanID INTEGER PRIMARY KEY,
    breakfast VARCHAR(40),
    lunch VARCHAR(40),
    dinner VARCHAR(40),
    totalCalories integer,
    FOREIGN KEY (dietPlanID) REFERENCES DietPlan(dietPlanID)
);

CREATE TABLE SundayDiet (
    dietPlanID INTEGER PRIMARY KEY,
    breakfast VARCHAR(40),
    lunch VARCHAR(40),
    dinner VARCHAR(40),
    totalCalories integer,
    FOREIGN KEY (dietPlanID) REFERENCES DietPlan(dietPlanID)
);

CREATE TABLE FitnessPlan (
    fitnessPlanID INTEGER PRIMARY KEY NOT NULL,
    trainerID INTEGER NOT NULL,
    numRestDays INTEGER,
    numTrainingDays INTEGER,
    FOREIGN KEY (trainerID) REFERENCES PersonalTrainers(trainerID)
);

CREATE TABLE MondayFitnessPlan (
    fitnessPlanID INTEGER PRIMARY KEY,
    warmupPlan VARCHAR(100),
    liftingPlan VARCHAR(100),
    cardioPlan VARCHAR(100),
    FOREIGN KEY (fitnessPlanID) REFERENCES FitnessPlan(fitnessPlanID)
);

CREATE TABLE TuesdayFitnessPlan (
    fitnessPlanID INTEGER PRIMARY KEY,
    warmupPlan VARCHAR(100),
    liftingPlan VARCHAR(100),
    cardioPlan VARCHAR(100),
    FOREIGN KEY (fitnessPlanID) REFERENCES FitnessPlan(fitnessPlanID)
);

CREATE TABLE WednesdayFitnessPlan (
    fitnessPlanID INTEGER PRIMARY KEY,
    warmupPlan VARCHAR(100),
    liftingPlan VARCHAR(100),
    cardioPlan VARCHAR(100),
    FOREIGN KEY (fitnessPlanID) REFERENCES FitnessPlan(fitnessPlanID)
);

CREATE TABLE ThursdayFitnessPlan (
    fitnessPlanID INTEGER PRIMARY KEY,
    warmupPlan VARCHAR(100),
    liftingPlan VARCHAR(100),
    cardioPlan VARCHAR(100),
    FOREIGN KEY (fitnessPlanID) REFERENCES FitnessPlan(fitnessPlanID)
);

CREATE TABLE FridayFitnessPlan (
    fitnessPlanID INTEGER PRIMARY KEY,
    warmupPlan VARCHAR(100),
    liftingPlan VARCHAR(100),
    cardioPlan VARCHAR(100),
    FOREIGN KEY (fitnessPlanID) REFERENCES FitnessPlan(fitnessPlanID)
);

CREATE TABLE SaturdayFitnessPlan (
    fitnessPlanID INTEGER PRIMARY KEY,
    warmupPlan VARCHAR(100),
    liftingPlan VARCHAR(100),
    cardioPlan VARCHAR(100),
    FOREIGN KEY (fitnessPlanID) REFERENCES FitnessPlan(fitnessPlanID)
);

CREATE TABLE SundayFitnessPlan (
    fitnessPlanID INTEGER PRIMARY KEY,
    warmupPlan VARCHAR(100),
    liftingPlan VARCHAR(100),
    cardioPlan VARCHAR(100),
    FOREIGN KEY (fitnessPlanID) REFERENCES FitnessPlan(fitnessPlanID)
);

CREATE TABLE Users (
    ID INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
    name VARCHAR(20) NOT NULL,
    firstName VARCHAR(20) NOT NULL,
    lastName VARCHAR(20) NOT NULL,
    email VARCHAR(60) NOT NULL UNIQUE,
    dietGoal VARCHAR(30),
    fitnessGoal VARCHAR(30),
    gender VARCHAR(20),
    weight INTEGER NOT NULL,
    age INTEGER NOT NULL,
    heightInches INTEGER,
    fitnessPlanID INTEGER,
    dietPlanID INTEGER,
    nutritionistID INTEGER,
    trainerID INTEGER,
    FOREIGN KEY (nutritionistID) REFERENCES Nutritionists(nutritionistID),
    FOREIGN KEY (trainerID) REFERENCES PersonalTrainers(trainerID),
    FOREIGN KEY (dietPlanID) REFERENCES DietPlan(dietPlanID),
    FOREIGN KEY (fitnessPlanID) REFERENCES FitnessPlan(fitnessPlanID)
);

INSERT INTO Nutritionists
    (nutritionistID, name, firstName, lastName, email)
VALUES
    (1, 'Gordon Ramsay', 'Gordon', 'Ramsay', 'gordon@gmail.com'),
    (2, 'Rachel Lee', 'Rachel', 'Lee', 'rachel@gmail.com');

INSERT INTO PersonalTrainers
    (trainerID, name, firstName, lastName, email)
VALUES
    (1, 'Chris Bumstead', 'Chris', 'Bumstead', 'chris@gmail.com'),
    (2, 'Stephanie Buttermore', 'Stephanie', 'Buttermore', 'stephanie@gmail.com');

INSERT INTO DietPlan
    (dietPlanID, nutritionistID, dietaryRestrictions, dailyCalorieGoal)
VALUES
    (1, 1, 'None', 2400),
    (2, 1, 'Tree nut allergy', 2000),
    (3, 2, 'Vegetarian', 2200);

INSERT INTO FitnessPlan
    (fitnessPlanID, trainerID, numRestDays, numTrainingDays)
VALUES
    (1, 1, 3, 4),
    (2, 2, 4, 3),
    (3, 2, 3, 4);

INSERT INTO Users
    (name, firstName, lastName, email, dietGoal, fitnessGoal, gender, weight, age, heightInches, fitnessPlanID, dietPlanID, nutritionistID, trainerID)
VALUES
    ('Calvin Him', 'Calvin', 'Him', 'calvin@gmail.com', 'eat at caloric maintenance', 'lose fat and build muscle', 'Male', 161, 23, 67, 1, 1, 1, 1),
    ('John Smith', 'John', 'Smith', 'john@gmail.com', 'eat at 10% caloric deficit', 'lose fat', 'Male', 190, 21, 69, 2, 2, 2, 2),
    ('Jane Doe', 'Jane', 'Doe', 'jane@gmail.com', 'eat at 10% caloric surplus', 'build muscle', 'Female', 100, 22, 64, 3, 3, 2, 2);