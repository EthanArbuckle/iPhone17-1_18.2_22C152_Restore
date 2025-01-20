@interface CHMoveModeUtilities
+ (void)saveActivityMoveModeAndDefaultGoalSamplesForActivityMoveMode:(int64_t)a3 healthStore:(id)a4 formattingManager:(id)a5;
@end

@implementation CHMoveModeUtilities

+ (void)saveActivityMoveModeAndDefaultGoalSamplesForActivityMoveMode:(int64_t)a3 healthStore:(id)a4 formattingManager:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [objc_alloc((Class)FIActivitySettingsController) initWithHealthStore:v7];
  [v9 populateExistingCharacteristics];
  [v9 biologicalSex];
  [v9 weight];
  if (a3 == 2) {
    v10 = {;
  }
    v11 = +[HKUnit gramUnitWithMetricPrefix:9];
    [v10 doubleValueForUnit:v11];

    v12 = [v9 height];
    v13 = +[HKUnit meterUnitWithMetricPrefix:7];
    [v12 doubleValueForUnit:v13];

    v14 = [v9 dateOfBirth];
    FIAgeInYearsForDateOfBirth();

    [v9 wheelchairUse];
    FICMotionConditionForWheelchairUse();
    FIUIActivityLevelsForFitnessJr();
  }
  else {
    v15 = {;
  }
    v16 = [v9 leanBodyMass];
    v17 = [v9 height];
    v18 = [v9 dateOfBirth];
    [v9 wheelchairUse];
    FIUICalculateBMR();

    FIUIActivityLevelsForBMR();
  v19 = };

  v20 = +[NSCalendar currentCalendar];
  v21 = +[NSDate date];
  v22 = [v20 hk_startOfDateByAddingDays:1 toDate:v21];

  v23 = [v20 components:_HKRequiredCalendarUnitsForCacheIndexDateComponents fromDate:v22];
  v24 = FIActivityMoveModeChangeSampleForDateComponents();
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1001289FC;
  v28[3] = &unk_1008ACE38;
  id v29 = v19;
  id v30 = v7;
  id v31 = v22;
  int64_t v32 = a3;
  id v25 = v22;
  id v26 = v7;
  id v27 = v19;
  [v26 saveObject:v24 withCompletion:v28];
}

@end