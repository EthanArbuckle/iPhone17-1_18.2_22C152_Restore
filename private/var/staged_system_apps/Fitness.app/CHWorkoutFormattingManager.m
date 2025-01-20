@interface CHWorkoutFormattingManager
- (BOOL)hasAverageCadenceForWorkout:(id)a3 workoutActivity:(id)a4;
- (BOOL)hasAverageCyclingPowerForWorkout:(id)a3 workoutActivity:(id)a4;
- (BOOL)hasAverageCyclingSpeedForWorkout:(id)a3 workoutActivity:(id)a4;
- (BOOL)hasAveragePowerForWorkout:(id)a3 workoutActivity:(id)a4;
- (BOOL)hasConnectedGymVendorIconForWorkout:(id)a3;
- (BOOL)hasDistanceForWorkout:(id)a3 workoutActivity:(id)a4;
- (BOOL)hasElevationAscendedDataForWorkout:(id)a3 workoutActivity:(id)a4;
- (BOOL)hasFlightsClimbedForWorkout:(id)a3 workoutActivity:(id)a4;
- (BOOL)hasGroundElevationDataForWorkout:(id)a3 workoutActivity:(id)a4;
- (BOOL)hasStepCountForWorkout:(id)a3 workoutActivity:(id)a4;
- (BOOL)hasWeatherConditionForWorkout:(id)a3 workoutActivity:(id)a4;
- (BOOL)isIndoorCyclingForWorkout:(id)a3 workoutActivity:(id)a4;
- (BOOL)nonZeroMetadataExistsInWorkout:(id)a3 orWorkoutActivity:(id)a4 withKey:(id)a5;
- (BOOL)shouldFakeData;
- (BOOL)shouldShowDistanceForWorkout:(id)a3 workoutActivity:(id)a4;
- (BOOL)supportsDistanceForWorkout:(id)a3 workoutActivity:(id)a4;
- (BOOL)supportsDownhillRunsCountForWorkout:(id)a3 workoutActivity:(id)a4;
- (BOOL)supportsElevationAscendedForWorkout:(id)a3 workoutActivity:(id)a4;
- (BOOL)supportsElevationDescendedForWorkout:(id)a3 workoutActivity:(id)a4;
- (BOOL)supportsPaceForWorkout:(id)a3 workoutActivity:(id)a4;
- (BOOL)workoutHasGoalCompletionEvent:(id)a3;
- (BOOL)workoutWasInDayTime:(id)a3;
- (CHWorkoutDataCalculator)dataCalculator;
- (CHWorkoutFormattingManager)initWithFitnessUIFormattingManager:(id)a3 healthStore:(id)a4;
- (FIUIFormattingManager)formattingManager;
- (double)averageCyclingPowerForWorkout:(id)a3 workoutActivity:(id)a4;
- (double)averageCyclingSpeedForWorkout:(id)a3 workoutActivity:(id)a4;
- (float)_groundElevationHeight;
- (id)_activeEnergyInfoForWorkout:(id)a3;
- (id)_distanceInfoForWorkout:(id)a3;
- (id)_durationInfoForWorkout:(id)a3;
- (id)_formattedDateForDetailWithWorkout:(id)a3;
- (id)_formattedDateForListViewWithWorkout:(id)a3;
- (id)_formattedDescriptionForDayViewWithWorkout:(id)a3;
- (id)_formattedDescriptionForListViewWithWorkout:(id)a3;
- (id)_formattedGoalForDetailViewWithWorkout:(id)a3;
- (id)_formattedValueString:(id)a3 withUnitString:(id)a4 paceFormat:(int64_t)a5 context:(id)a6 color:(id)a7;
- (id)_goalCompletionEventsForWorkout:(id)a3;
- (id)_goalStringForWorkout:(id)a3 outValue:(id *)a4;
- (id)_groundElevationFont;
- (id)_maxDepthInfoForDive:(id)a3;
- (id)_paceUnitForActivityType:(id)a3 paceFormat:(int64_t)a4;
- (id)_ringImageForWorkout:(id)a3 context:(id)a4;
- (id)_shareIconForWorkout:(id)a3 routeImage:(id)a4;
- (id)_shareValueForWorkout:(id)a3;
- (id)_underwaterTimeInfoForDive:(id)a3;
- (id)_workoutTypeInfoForWorkout:(id)a3;
- (id)airQualityIndexForWorkout:(id)a3 workoutActivity:(id)a4;
- (id)defaultCircularRingImageForContext:(id)a3;
- (id)fakeLocationDataForWorkout:(id)a3;
- (id)formattedActiveEnergyForWorkout:(id)a3 workoutActivity:(id)a4 context:(id)a5;
- (id)formattedAverageCadenceForWorkout:(id)a3 workoutActivity:(id)a4 context:(id)a5;
- (id)formattedAveragePowerForWorkout:(id)a3 workoutActivity:(id)a4 context:(id)a5;
- (id)formattedAveragePowerStringFor:(double)a3 context:(id)a4;
- (id)formattedAverageSwimPaceWithDuration:(id)a3 context:(id)a4;
- (id)formattedCount:(int64_t)a3 color:(id)a4 context:(id)a5;
- (id)formattedDateForWorkout:(id)a3 context:(id)a4;
- (id)formattedDescriptionForWorkout:(id)a3 context:(id)a4;
- (id)formattedDistanceByStrokeStyle:(id)a3 isPoolSwim:(BOOL)a4 context:(id)a5;
- (id)formattedDistanceForWorkout:(id)a3 workoutActivity:(id)a4 context:(id)a5;
- (id)formattedDownhillRunsCount:(int64_t)a3 context:(id)a4;
- (id)formattedDurationForWorkout:(id)a3 workoutActivity:(id)a4 context:(id)a5;
- (id)formattedElapsedTimeForWorkout:(id)a3 workoutActivity:(id)a4 context:(id)a5;
- (id)formattedElevation:(id)a3 context:(id)a4;
- (id)formattedElevationGainForWorkout:(id)a3 workoutActivity:(id)a4 context:(id)a5;
- (id)formattedEnergyBurn:(id)a3 context:(id)a4;
- (id)formattedFlightsClimbedForWorkout:(id)a3 workoutActivity:(id)a4 context:(id)a5;
- (id)formattedGoalCompletedDurationForWorkout:(id)a3 context:(id)a4;
- (id)formattedGoalForWorkout:(id)a3 context:(id)a4;
- (id)formattedGroundElevationGainForWorkout:(id)a3 workoutActivity:(id)a4 context:(id)a5;
- (id)formattedHeartRate:(id)a3 context:(id)a4;
- (id)formattedLapCountForWorkout:(id)a3 workoutActivity:(id)a4 context:(id)a5;
- (id)formattedPaceOrSpeedForWorkout:(id)a3 workoutActivity:(id)a4 context:(id)a5;
- (id)formattedPaceOrSpeedWithDistance:(id)a3 overDuration:(double)a4 activityType:(id)a5 context:(id)a6;
- (id)formattedPoolLengthForWorkout:(id)a3 workoutActivity:(id)a4 context:(id)a5;
- (id)formattedPowerStringFor:(double)a3;
- (id)formattedRacePaceOrSpeedForWorkout:(id)a3 metersPerSecond:(id)a4 context:(id)a5;
- (id)formattedRaceTimeForWorkout:(id)a3 workoutActivity:(id)a4 context:(id)a5;
- (id)formattedStepCountForWorkout:(id)a3 workoutActivity:(id)a4 context:(id)a5;
- (id)formattedSwimmingStrokeTypeForWorkout:(id)a3 context:(id)a4;
- (id)formattedTimeRangeForWorkout:(id)a3 workoutActivity:(id)a4 context:(id)a5;
- (id)formattedTotalEnergyForWorkout:(id)a3 workoutActivity:(id)a4 context:(id)a5;
- (id)formattedTypeForWorkout:(id)a3 workoutActivity:(id)a4 context:(id)a5;
- (id)locationForWorkout:(id)a3 workoutActivity:(id)a4;
- (id)shareImageForWorkout:(id)a3 routeImage:(id)a4;
- (id)shareTextForWorkout:(id)a3;
- (id)timeZoneForWorkout:(id)a3;
- (id)waterTemperatureForWorkout:(id)a3 workoutActivity:(id)a4;
- (id)weatherHumidityForWorkout:(id)a3 workoutActivity:(id)a4;
- (id)weatherTemperatureForWorkout:(id)a3 workoutActivity:(id)a4;
- (void)_fetchIconForConnectedGymWorkout:(id)a3 context:(id)a4 completion:(id)a5;
- (void)_fetchIconForFirstPartyWorkout:(id)a3 context:(id)a4 completion:(id)a5;
- (void)_fetchIconForThirdPartyWorkout:(id)a3 context:(id)a4 completion:(id)a5;
- (void)_fetchPhoneIconForWorkout:(id)a3 context:(id)a4 completion:(id)a5;
- (void)_fetchRingImageForWorkout:(id)a3 context:(id)a4 completion:(id)a5;
- (void)_fetchWatchIconForWorkout:(id)a3 context:(id)a4 completion:(id)a5;
- (void)_formattedDistanceStringForWorkout:(id)a3 distanceString:(id *)a4 unitString:(id *)a5;
- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4;
- (void)fetchIconImageForWorkout:(id)a3 context:(id)a4 completion:(id)a5;
- (void)setFormattingManager:(id)a3;
- (void)setShouldFakeData:(BOOL)a3;
- (void)updateHiddenAppBundleIds;
@end

@implementation CHWorkoutFormattingManager

- (CHWorkoutFormattingManager)initWithFitnessUIFormattingManager:(id)a3 healthStore:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)CHWorkoutFormattingManager;
  v9 = [(CHWorkoutFormattingManager *)&v21 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_formattingManager, a3);
    objc_storeStrong((id *)&v10->_healthStore, a4);
    v11 = (ARUIRingsViewRenderer *)[objc_alloc((Class)ARUIRingsViewRenderer) initWithMaximumRingCount:1];
    renderer = v10->_renderer;
    v10->_renderer = v11;

    v13 = [CHWorkoutDataCalculator alloc];
    v14 = [v7 unitManager];
    v15 = [(CHWorkoutDataCalculator *)v13 initWithHealthStore:v8 unitManager:v14];
    dataCalculator = v10->_dataCalculator;
    v10->_dataCalculator = v15;

    v17 = +[NSUserDefaults standardUserDefaults];
    -[CHWorkoutDataCalculator setShouldUseFakeSegmentMarkers:](v10->_dataCalculator, "setShouldUseFakeSegmentMarkers:", [v17 BOOLForKey:@"fakeSegments"]);

    v18 = +[APSubject subjectMonitorRegistry];
    id v19 = [v18 addMonitor:v10];

    [(CHWorkoutFormattingManager *)v10 updateHiddenAppBundleIds];
  }

  return v10;
}

- (void)updateHiddenAppBundleIds
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = +[APApplication hiddenApplications];
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [*(id *)(*((void *)&v12 + 1) + 8 * (void)v8) bundleIdentifier];
        [v3 addObject:v9];

        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  v10 = (NSArray *)[v3 copy];
  hiddenApplicationBundleIds = self->_hiddenApplicationBundleIds;
  self->_hiddenApplicationBundleIds = v10;
}

- (id)fakeLocationDataForWorkout:(id)a3
{
  id v3 = a3;
  v4 = +[NSBundle mainBundle];
  id v5 = [v4 pathForResource:@"CityRunFakedLocationCoordinates" ofType:@"json"];

  id v6 = +[NSData dataWithContentsOfFile:v5];
  if (v6)
  {
    id v23 = 0;
    uint64_t v7 = +[NSJSONSerialization JSONObjectWithData:v6 options:4 error:&v23];
    id v8 = v23;
    id v9 = [v7 count];
    v10 = [v3 endDate];
    v11 = [v3 startDate];
    [v10 timeIntervalSinceDate:v11];
    double v13 = v12 / (double)(uint64_t)v9;

    id v14 = objc_alloc_init((Class)NSMutableArray);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000EF778;
    v19[3] = &unk_1008AB978;
    id v20 = v3;
    double v22 = v13;
    id v15 = v14;
    id v21 = v15;
    [v7 enumerateObjectsUsingBlock:v19];
    v16 = v21;
    id v17 = v15;
  }
  else
  {
    id v17 = &__NSArray0__struct;
  }

  return v17;
}

- (BOOL)workoutHasGoalCompletionEvent:(id)a3
{
  id v3 = [(CHWorkoutFormattingManager *)self _goalCompletionEventsForWorkout:a3];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (id)_goalCompletionEventsForWorkout:(id)a3
{
  id v3 = [a3 workoutEvents];
  BOOL v4 = +[NSPredicate predicateWithBlock:&stru_1008AB9B8];
  id v5 = [v3 filteredArrayUsingPredicate:v4];

  return v5;
}

- (id)formattedDescriptionForWorkout:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 isEqualToString:@"DayViewDisplayContext"])
  {
    uint64_t v8 = [(CHWorkoutFormattingManager *)self _formattedDescriptionForDayViewWithWorkout:v6];
LABEL_5:
    id v9 = (void *)v8;
    goto LABEL_7;
  }
  if ([v7 isEqualToString:@"WorkoutsListDisplayContext"])
  {
    uint64_t v8 = [(CHWorkoutFormattingManager *)self _formattedDescriptionForListViewWithWorkout:v6];
    goto LABEL_5;
  }
  id v9 = 0;
LABEL_7:

  return v9;
}

- (id)_formattedDescriptionForDayViewWithWorkout:(id)a3
{
  id v4 = a3;
  if ([v4 workoutActivityType] == (id)84)
  {
    formattingManager = self->_formattingManager;
    [v4 duration];
    id v6 = -[FIUIFormattingManager stringWithDuration:durationFormat:](formattingManager, "stringWithDuration:durationFormat:", 3);
    id v7 = FILocalizedActivityNameWithWorkout();

    uint64_t v8 = +[NSString stringWithFormat:@"%@ %@", v6, v7];

    id v9 = [objc_alloc((Class)NSMutableAttributedString) initWithString:v8];
  }
  else
  {
    id v6 = +[CHWorkoutDisplayContext displayContextWithName:@"DayViewDisplayContext"];
    v10 = self->_formattingManager;
    id v21 = &stru_1008D8AB8;
    v11 = [(FIUIFormattingManager *)v10 localizedGoalDescriptionForWorkout:v4 withValue:&v21 appendActivityType:1];

    double v12 = v21;
    id v9 = [objc_alloc((Class)NSMutableAttributedString) initWithString:v11];
    id v13 = [v11 length];
    id v14 = +[UIColor labelColor];
    [v9 addAttribute:NSForegroundColorAttributeName value:v14 range:0];

    id v15 = [v6 goalDescriptionFont];
    [v9 addAttribute:NSFontAttributeName value:v15 range:0];

    if ([(__CFString *)v12 length])
    {
      id v16 = [v11 rangeOfString:v12];
      uint64_t v18 = v17;
      id v19 = [v6 valueFont];
      [v9 addAttribute:NSFontAttributeName value:v19 range:v16, v18];
    }
  }

  return v9;
}

- (id)_formattedDescriptionForListViewWithWorkout:(id)a3
{
  id v3 = a3;
  v26 = +[CHWorkoutDisplayContext displayContextWithName:@"WorkoutsListDisplayContext"];
  id v4 = [v26 dateFont];
  [v4 pointSize];
  double v22 = +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:");

  id v23 = [v26 dateFont];
  id v5 = +[CHListAndDetailViewDateFormatter listViewDateFormatter];
  v24 = v3;
  id v6 = [v3 startDate];
  id v21 = [v5 stringFromDate:v6];

  id v7 = [v3 fiui_activityType];
  [v7 effectiveTypeIdentifier];
  [v7 swimmingLocationType];
  [v7 isIndoor];
  uint64_t v8 = FILocalizedNameForActivityType();
  id v9 = [@" " stringByAppendingString:v8];
  id v20 = [v9 stringByAppendingString:@"\n"];

  id v10 = objc_alloc((Class)NSMutableAttributedString);
  v29[0] = NSFontAttributeName;
  v29[1] = NSForegroundColorAttributeName;
  v30[0] = v22;
  v11 = +[UIColor labelColor];
  v30[1] = v11;
  double v12 = +[NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:2];
  id v13 = [v10 initWithString:v21 attributes:v12];

  id v14 = objc_alloc((Class)NSAttributedString);
  v27[1] = NSForegroundColorAttributeName;
  v28[0] = v23;
  v27[0] = NSFontAttributeName;
  id v15 = +[UIColor labelColor];
  v28[1] = v15;
  id v16 = +[NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];
  id v17 = [v14 initWithString:v20 attributes:v16];
  [v13 appendAttributedString:v17];

  uint64_t v18 = [(CHWorkoutFormattingManager *)self formattedGoalForWorkout:v24 context:@"WorkoutsListDisplayContext"];

  [v13 appendAttributedString:v18];

  return v13;
}

- (id)formattedDateForWorkout:(id)a3 context:(id)a4
{
  id v6 = a3;
  if ([a4 isEqualToString:@"WorkoutsListDisplayContext"]) {
    [(CHWorkoutFormattingManager *)self _formattedDateForListViewWithWorkout:v6];
  }
  else {
  id v7 = [(CHWorkoutFormattingManager *)self _formattedDateForDetailWithWorkout:v6];
  }

  return v7;
}

- (id)_formattedDateForDetailWithWorkout:(id)a3
{
  id v3 = a3;
  id v4 = +[CHWorkoutDisplayContext displayContextWithName:@"WorkoutDetailDisplayContext"];
  id v5 = +[CHListAndDetailViewDateFormatter detailViewDateFormatter];
  id v6 = [v3 startDate];

  id v7 = [v5 stringFromDate:v6];

  id v8 = objc_alloc((Class)NSAttributedString);
  NSAttributedStringKey v13 = NSFontAttributeName;
  id v9 = [v4 dateFont];
  id v14 = v9;
  id v10 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  id v11 = [v8 initWithString:v7 attributes:v10];

  return v11;
}

- (id)_formattedDateForListViewWithWorkout:(id)a3
{
  id v3 = a3;
  id v4 = +[CHWorkoutDisplayContext displayContextWithName:@"WorkoutsListDisplayContext"];
  id v5 = [v3 startDate];

  id v6 = [v4 dateFont];
  id v7 = +[CHListAndDetailViewDateFormatter formattedListStringForDate:v5 font:v6];

  return v7;
}

- (id)formattedTypeForWorkout:(id)a3 workoutActivity:(id)a4 context:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = +[CHWorkoutDisplayContext displayContextWithName:a5];
  if (v8)
  {
    id v10 = [v8 workoutConfiguration];
    [v10 activityType];

    id v11 = [v8 workoutConfiguration];
    [v11 swimmingLocationType];

    double v12 = [v8 workoutConfiguration];
    [v12 locationType];

    NSAttributedStringKey v13 = FILocalizedNameForActivityType();
  }
  else
  {
    id v14 = [v7 metadata];
    NSAttributedStringKey v13 = [v14 objectForKeyedSubscript:HKMetadataKeyWorkoutBrandName];

    if (![v13 length])
    {
      id v15 = [v7 fiui_activityType];
      [v15 effectiveTypeIdentifier];
      [v15 swimmingLocationType];
      [v15 isIndoor];
      uint64_t v16 = FILocalizedNameForActivityType();

      NSAttributedStringKey v13 = (void *)v16;
    }
  }
  id v17 = objc_alloc_init((Class)NSMutableParagraphStyle);
  LODWORD(v18) = 1.0;
  [v17 setHyphenationFactor:v18];
  id v19 = [v9 workoutTypeFont];
  id v20 = objc_alloc((Class)NSAttributedString);
  v26[0] = v19;
  v25[0] = NSFontAttributeName;
  v25[1] = NSForegroundColorAttributeName;
  id v21 = +[UIColor labelColor];
  v25[2] = NSParagraphStyleAttributeName;
  v26[1] = v21;
  v26[2] = v17;
  double v22 = +[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:3];
  id v23 = [v20 initWithString:v13 attributes:v22];

  return v23;
}

- (id)formattedSwimmingStrokeTypeForWorkout:(id)a3 context:(id)a4
{
  id v5 = a4;
  if (objc_msgSend(a3, "fiui_strokeStyle"))
  {
    id v6 = +[CHWorkoutDisplayContext displayContextWithName:v5];
    id v7 = FILocalizedStrokeStyleName();
    id v8 = [v6 dateFont];
    id v9 = objc_alloc((Class)NSAttributedString);
    v14[0] = NSFontAttributeName;
    v14[1] = NSForegroundColorAttributeName;
    v15[0] = v8;
    id v10 = +[UIColor labelColor];
    v15[1] = v10;
    id v11 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
    id v12 = [v9 initWithString:v7 attributes:v11];
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (id)formattedDistanceByStrokeStyle:(id)a3 isPoolSwim:(BOOL)a4 context:(id)a5
{
  BOOL v33 = a4;
  id v6 = a3;
  v30 = +[CHWorkoutDisplayContext displayContextWithName:a5];
  id v7 = [v6 allKeys];
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_1000F09E0;
  v41[3] = &unk_1008AB9E0;
  id v34 = v6;
  id v42 = v34;
  id v8 = [v7 sortedArrayUsingComparator:v41];

  id v9 = objc_alloc_init((Class)NSMutableString);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v10 = v8;
  id v35 = [v10 countByEnumeratingWithState:&v37 objects:v45 count:16];
  if (v35)
  {
    uint64_t v31 = *(void *)v38;
    do
    {
      for (i = 0; i != v35; i = (char *)i + 1)
      {
        if (*(void *)v38 != v31) {
          objc_enumerationMutation(v10);
        }
        id v12 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        NSAttributedStringKey v13 = [v34 objectForKeyedSubscript:v12];
        [v12 integerValue];
        id v14 = FILocalizedStrokeStyleName();
        if (v33)
        {
          id v15 = [(CHWorkoutFormattingManager *)self formattingManager];
          uint64_t v16 = +[HKUnit meterUnit];
          [v13 doubleValueForUnit:v16];
          [v15 localizedStringWithDistanceInMeters:3 distanceType:1 unitStyle:5];
        }
        else
        {
          uint64_t v36 = 0;
          id v15 = [(CHWorkoutFormattingManager *)self formattingManager];
          uint64_t v16 = +[HKUnit meterUnit];
          [v13 doubleValueForUnit:v16];
          [v15 localizedNaturalScaleStringWithDistanceInMeters:4 distanceType:1 unitStyle:&v36];
        id v17 = };

        double v18 = +[NSBundle mainBundle];
        uint64_t v19 = [v18 localizedStringForKey:@"SWIMMING_STROKE_STYLE_DISTANCE_%@_%@" value:&stru_1008D8AB8 table:@"Localizable"];
        id v20 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v19, v14, v17);

        id v21 = [v10 firstObject];
        LOBYTE(v19) = [v12 isEqualToNumber:v21];

        if ((v19 & 1) == 0) {
          [v9 appendString:@"\n"];
        }
        [v9 appendString:v20];
      }
      id v35 = [v10 countByEnumeratingWithState:&v37 objects:v45 count:16];
    }
    while (v35);
  }
  double v22 = v10;

  id v23 = [v30 dateFont];
  id v24 = objc_alloc((Class)NSAttributedString);
  id v25 = [objc_alloc((Class)NSString) initWithString:v9];
  v43[0] = NSFontAttributeName;
  v43[1] = NSForegroundColorAttributeName;
  v44[0] = v23;
  v26 = +[UIColor labelColor];
  v44[1] = v26;
  v27 = +[NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:2];
  id v28 = [v24 initWithString:v25 attributes:v27];

  return v28;
}

- (id)formattedTimeRangeForWorkout:(id)a3 workoutActivity:(id)a4 context:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v25 = +[CHWorkoutDisplayContext displayContextWithName:a5];
  id v9 = [v25 dateFont];
  id v10 = +[UIColor secondaryLabelColor];
  if (v8) {
    id v11 = v8;
  }
  else {
    id v11 = v7;
  }
  id v12 = [v11 startDate];
  NSAttributedStringKey v13 = +[CHListAndDetailViewDateFormatter timeDateFormatter];
  id v14 = [v13 stringFromDate:v12];

  id v24 = v7;
  if (v8) {
    id v15 = v8;
  }
  else {
    id v15 = v7;
  }
  uint64_t v16 = [v15 endDate];
  id v17 = +[CHListAndDetailViewDateFormatter timeDateFormatter];
  double v18 = [v17 stringFromDate:v16];

  uint64_t v19 = +[NSString stringWithFormat:@"%@–%@", v14, v18];
  id v20 = objc_alloc((Class)NSAttributedString);
  v26[0] = NSFontAttributeName;
  v26[1] = NSForegroundColorAttributeName;
  v27[0] = v9;
  v27[1] = v10;
  id v21 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:2];
  id v22 = [v20 initWithString:v19 attributes:v21];

  return v22;
}

- (id)defaultCircularRingImageForContext:(id)a3
{
  id v3 = +[CHWorkoutDisplayContext displayContextWithName:a3];
  [v3 ringDiameter];
  id v4 = FIUICircularWorkoutGradientImage();

  return v4;
}

- (id)_ringImageForWorkout:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 fiui_completionFactor];
  double v9 = v8;
  id v10 = +[ARUIMetricColors metricColorsForWorkout:v6];
  if ([v6 shouldUseCircularGradientImage])
  {
    id v11 = [v10 gradientDarkColor];
    id v12 = [v10 gradientLightColor];
    [v7 ringDiameter];
    NSAttributedStringKey v13 = FIUICircularGradientImage();

    goto LABEL_6;
  }
  if (![v6 _goalType])
  {
    uint64_t v19 = +[CHWorkoutDisplayContext _dayViewDisplayContext];
    if ((id)v19 == v7)
    {
    }
    else
    {
      id v20 = (void *)v19;
      id v21 = +[CHWorkoutDisplayContext _friendDetailDisplayContext];

      if (v21 != v7)
      {
        [v7 ringDiameter];
        uint64_t v17 = FIUICircularWorkoutGradientImage();
        goto LABEL_5;
      }
    }
  }
  [v7 ringDiameter];
  double v15 = v14;
  [v7 ringThickness];
  uint64_t v17 = +[RingViewFactory workoutRingWithPercent:v10 colors:self->_renderer diameter:v9 thickness:v15 renderer:v16];
LABEL_5:
  NSAttributedStringKey v13 = (void *)v17;
LABEL_6:

  return v13;
}

- (void)_fetchRingImageForWorkout:(id)a3 context:(id)a4 completion:(id)a5
{
  double v8 = (void (**)(id, id))a5;
  id v9 = [(CHWorkoutFormattingManager *)self _ringImageForWorkout:a3 context:a4];
  v8[2](v8, v9);
}

- (void)_fetchWatchIconForWorkout:(id)a3 context:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc_init(CHWatchIconParameters);
  id v11 = [v9 sourceRevision];

  id v12 = [v11 source];
  NSAttributedStringKey v13 = [v12 bundleIdentifier];
  [(CHIconParameters *)v10 setBundleID:v13];

  [v8 appIconWidth];
  double v15 = v14;

  [(CHIconParameters *)v10 setPreferredAppStoreIconWidth:v15];
  [(CHWatchIconParameters *)v10 setIconVariant2x:32771];
  [(CHWatchIconParameters *)v10 setIconVariant3x:32771];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000F103C;
  v17[3] = &unk_1008ABA08;
  id v18 = v7;
  id v16 = v7;
  +[CHIconCache fetchWatchIconWithParameters:v10 completion:v17];
}

- (void)_fetchPhoneIconForWorkout:(id)a3 context:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc_init(CHPhoneIconParameters);
  id v11 = [v9 sourceRevision];

  id v12 = [v11 source];
  NSAttributedStringKey v13 = [v12 bundleIdentifier];
  [(CHIconParameters *)v10 setBundleID:v13];

  [v8 appIconWidth];
  double v15 = v14;

  [(CHIconParameters *)v10 setPreferredAppStoreIconWidth:v15];
  [(CHPhoneIconParameters *)v10 setAppIconFormat:2];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000F11A4;
  v17[3] = &unk_1008ABA08;
  id v18 = v7;
  id v16 = v7;
  +[CHIconCache fetchPhoneIconWithParameters:v10 completion:v17];
}

- (void)_fetchIconForConnectedGymWorkout:(id)a3 context:(id)a4 completion:(id)a5
{
  id v12 = a3;
  id v8 = (void (**)(id, void *))a5;
  id v9 = +[CHWorkoutDisplayContext displayContextWithName:a4];
  id v10 = [v12 device];
  [v9 gymKitIconWidth];
  id v11 = +[HKUIConnectedGymIconUtilties iconForConnectedGymDevice:preferredIconWidth:](HKUIConnectedGymIconUtilties, "iconForConnectedGymDevice:preferredIconWidth:", v10);

  if (!v11)
  {
    id v11 = [(CHWorkoutFormattingManager *)self _ringImageForWorkout:v12 context:v9];
  }
  v8[2](v8, v11);
}

- (void)_fetchIconForFirstPartyWorkout:(id)a3 context:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = +[CHWorkoutDisplayContext displayContextWithName:a4];
  id v11 = [v8 sourceRevision];
  id v12 = [v11 source];
  if ([v12 _isAppleWatch])
  {
  }
  else
  {
    unsigned __int8 v13 = [v8 _isWatchWorkout];

    if ((v13 & 1) == 0)
    {
      double v14 = objc_opt_new();
      [v14 setBundleID:@"com.apple.Health"];
      [v10 appIconWidth];
      [v14 setPreferredAppStoreIconWidth:];
      [v14 setAppIconFormat:2];
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      void v15[2] = sub_1000F1428;
      v15[3] = &unk_1008ABA08;
      id v16 = v9;
      +[CHIconCache fetchPhoneIconWithParameters:v14 completion:v15];

      goto LABEL_6;
    }
  }
  [(CHWorkoutFormattingManager *)self _fetchRingImageForWorkout:v8 context:v10 completion:v9];
LABEL_6:
}

- (void)_fetchIconForThirdPartyWorkout:(id)a3 context:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = +[CHWorkoutDisplayContext displayContextWithName:a4];
  if ([v9 _isWatchWorkout]) {
    [(CHWorkoutFormattingManager *)self _fetchWatchIconForWorkout:v9 context:v10 completion:v8];
  }
  else {
    [(CHWorkoutFormattingManager *)self _fetchPhoneIconForWorkout:v9 context:v10 completion:v8];
  }
}

- (BOOL)hasConnectedGymVendorIconForWorkout:(id)a3
{
  id v3 = a3;
  id v4 = +[CHWorkoutDisplayContext displayContextWithName:@"WorkoutDetailDisplayContext"];
  id v5 = [v3 device];

  [v4 gymKitIconWidth];
  id v6 = +[HKUIConnectedGymIconUtilties iconForConnectedGymDevice:preferredIconWidth:](HKUIConnectedGymIconUtilties, "iconForConnectedGymDevice:preferredIconWidth:", v5);

  return v6 != 0;
}

- (id)_groundElevationFont
{
  return +[UIFont fu_mediumFontOfSize:13.0];
}

- (float)_groundElevationHeight
{
  return 13.0;
}

- (void)fetchIconImageForWorkout:(id)a3 context:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (objc_msgSend(v8, "fiui_isConnectedGymWorkout"))
  {
    [(CHWorkoutFormattingManager *)self _fetchIconForConnectedGymWorkout:v8 context:v9 completion:v10];
  }
  else
  {
    id v11 = [v8 sourceRevision];
    id v12 = [v11 source];
    unsigned int v13 = [v12 _hasFirstPartyBundleID];

    if (!v13)
    {
      hiddenApplicationBundleIds = self->_hiddenApplicationBundleIds;
      double v15 = [v8 sourceRevision];
      id v16 = [v15 source];
      uint64_t v17 = [v16 bundleIdentifier];
      LODWORD(hiddenApplicationBundleIds) = [(NSArray *)hiddenApplicationBundleIds containsObject:v17];

      if (!hiddenApplicationBundleIds)
      {
        [(CHWorkoutFormattingManager *)self _fetchIconForThirdPartyWorkout:v8 context:v9 completion:v10];
        goto LABEL_9;
      }
      _HKInitializeLogging();
      id v18 = HKLogWorkouts;
      if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEBUG)) {
        sub_10071BDC4(v18);
      }
    }
    [(CHWorkoutFormattingManager *)self _fetchIconForFirstPartyWorkout:v8 context:v9 completion:v10];
  }
LABEL_9:
}

- (id)_goalStringForWorkout:(id)a3 outValue:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 workoutActivityType];
  formattingManager = self->_formattingManager;
  if (v7 == (id)84) {
    [(FIUIFormattingManager *)formattingManager localizedGoalDescriptionForDive:v6 healthStore:self->_healthStore outValue:a4];
  }
  else {
  id v9 = [(FIUIFormattingManager *)formattingManager localizedGoalDescriptionForWorkout:v6 withValue:a4 appendActivityType:0];
  }

  return v9;
}

- (id)formattedGoalForWorkout:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 isEqualToString:@"WorkoutDetailDisplayContext"])
  {
    id v8 = [(CHWorkoutFormattingManager *)self _formattedGoalForDetailViewWithWorkout:v6];
  }
  else
  {
    id v9 = +[CHWorkoutDisplayContext displayContextWithName:v7];
    v30 = &stru_1008D8AB8;
    id v10 = [(CHWorkoutFormattingManager *)self _goalStringForWorkout:v6 outValue:&v30];
    v29 = v30;
    id v11 = objc_alloc((Class)NSMutableAttributedString);
    id v12 = [v10 localizedUppercaseString];
    id v8 = [v11 initWithString:v12];

    id v13 = [v10 length];
    double v14 = +[ARUIMetricColors metricColorsForWorkout:v6];
    double v15 = [v14 nonGradientTextColor];
    if ([v7 isEqualToString:@"DayViewDisplayContext"])
    {
      uint64_t v16 = +[UIColor labelColor];

      double v15 = (void *)v16;
    }
    [v8 addAttribute:NSForegroundColorAttributeName value:v15 range:0];
    uint64_t v17 = [v9 goalDescriptionFont];
    [v8 addAttribute:NSFontAttributeName value:v17 range:0];

    id v18 = v29;
    if ([(__CFString *)v29 length])
    {
      id v19 = [v10 rangeOfString:v29];
      uint64_t v21 = v20;
      [v9 valueFont];
      id v28 = v6;
      id v22 = v10;
      id v23 = v14;
      v25 = id v24 = v9;
      id v26 = v19;
      id v18 = v29;
      [v8 addAttribute:NSFontAttributeName value:v25 range:v26];

      id v9 = v24;
      double v14 = v23;
      id v10 = v22;
      id v6 = v28;
    }
  }

  return v8;
}

- (id)_formattedGoalForDetailViewWithWorkout:(id)a3
{
  id v3 = a3;
  id v4 = +[CHWorkoutDisplayContext _workoutDetailDisplayContext];
  id v5 = [v4 dateFont];
  id v6 = +[ARUIMetricColors keyColors];
  id v7 = [v6 nonGradientTextColor];

  [v3 fiui_completionFactor];
  id v9 = +[NSNumber numberWithDouble:round(v8 * 100.0) / 100.0];
  id v10 = +[FIUIFormattingManager percentStringWithNumber:v9];

  id v11 = +[NSBundle mainBundle];
  id v12 = [v11 localizedStringForKey:@"WORKOUT_COMPLETION_FORMAT_%@" value:&stru_1008D8AB8 table:@"Localizable"];
  id v13 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v12, v10);

  double v14 = +[ARUIMetricColors metricColorsForWorkout:v3];
  double v15 = [v14 nonGradientTextColor];

  id v16 = [v3 _goalType];
  if (!v16)
  {
    uint64_t v17 = FIUIBundle();
    uint64_t v18 = [v17 localizedStringForKey:@"WORKOUT_OPEN_GOAL" value:&stru_1008D8AB8 table:@"Localizable"];

    id v13 = (void *)v18;
  }
  id v19 = objc_alloc((Class)NSAttributedString);
  v23[0] = NSFontAttributeName;
  v23[1] = NSForegroundColorAttributeName;
  v24[0] = v5;
  v24[1] = v15;
  uint64_t v20 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];
  id v21 = [v19 initWithString:v13 attributes:v20];

  return v21;
}

- (id)formattedHeartRate:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = +[CHWorkoutDisplayContext displayContextWithName:a4];
  if ((uint64_t)[v5 integerValue] < 1)
  {
    id v24 = objc_alloc((Class)NSAttributedString);
    id v23 = +[NSBundle mainBundle];
    double v8 = [v23 localizedStringForKey:@"WORKOUT_EMPTY_VALUE" value:&stru_1008D8AB8 table:@"Localizable"];
    v29[0] = NSFontAttributeName;
    id v10 = [v6 valueFont];
    v30[0] = v10;
    v29[1] = NSForegroundColorAttributeName;
    id v21 = +[ARUIMetricColors heartRateColors];
    id v25 = [v21 nonGradientTextColor];
    v30[1] = v25;
    id v26 = +[NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:2];
    id v17 = [v24 initWithString:v8 attributes:v26];
  }
  else
  {
    uint64_t v28 = +[NSNumberFormatter localizedStringFromNumber:v5 numberStyle:0];
    id v7 = +[NSBundle mainBundle];
    double v8 = [v7 localizedStringForKey:@"BPM" value:&stru_1008D8AB8 table:@"Localizable"];

    id v9 = [v6 unitFormatString];
    id v10 = +[NSString stringWithValidatedFormat:v9, @"%@%@", 0, v28, v8 validFormatSpecifiers error];

    id v11 = objc_alloc((Class)NSMutableAttributedString);
    v31[0] = NSFontAttributeName;
    id v12 = [v6 valueFont];
    v32[0] = v12;
    v31[1] = NSForegroundColorAttributeName;
    +[ARUIMetricColors heartRateColors];
    v14 = id v13 = v5;
    double v15 = [v14 nonGradientTextColor];
    v32[1] = v15;
    id v16 = +[NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:2];
    id v17 = [v11 initWithString:v10 attributes:v16];

    id v18 = [v10 rangeOfString:v8];
    uint64_t v20 = v19;
    id v21 = [v6 goalDescriptionFont];
    uint64_t v22 = v20;
    id v5 = v13;
    id v23 = (void *)v28;
    [v17 addAttribute:NSFontAttributeName value:v21 range:v18, v22];
  }

  return v17;
}

- (id)formattedEnergyBurn:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = +[CHWorkoutDisplayContext displayContextWithName:a4];
  id v23 = [(FIUIFormattingManager *)self->_formattingManager localizedStringWithActiveEnergy:v6];

  double v8 = [(FIUIFormattingManager *)self->_formattingManager localizedShortActiveEnergyUnitString];
  id v9 = [v8 localizedUppercaseString];

  id v10 = [v7 unitFormatString];
  id v11 = +[NSString stringWithValidatedFormat:v10, @"%@%@", 0, v23, v9 validFormatSpecifiers error];

  id v22 = [v11 rangeOfString:v9];
  uint64_t v13 = v12;
  id v14 = objc_alloc((Class)NSMutableAttributedString);
  v24[0] = NSFontAttributeName;
  double v15 = [v7 valueFont];
  v25[0] = v15;
  v24[1] = NSForegroundColorAttributeName;
  id v16 = +[ARUIMetricColors energyColors];
  id v17 = [v16 nonGradientTextColor];
  v25[1] = v17;
  id v18 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:2];
  id v19 = [v14 initWithString:v11 attributes:v18];

  uint64_t v20 = [v7 goalDescriptionFont];
  [v19 addAttribute:NSFontAttributeName value:v20 range:v22];

  return v19;
}

- (void)_formattedDistanceStringForWorkout:(id)a3 distanceString:(id *)a4 unitString:(id *)a5
{
  id v8 = a3;
  uint64_t v34 = 0;
  id v9 = [v8 fiui_activityType];
  uint64_t v10 = FIUIDistanceTypeForActivityType();

  id v11 = AKAccountManager_ptr;
  if ([v8 workoutActivityType] == (id)82)
  {
    uint64_t v27 = v10;
    uint64_t v28 = a4;
    v29 = a5;
    uint64_t v12 = +[HKUnit meterUnit];
    uint64_t v13 = +[HKQuantity quantityWithUnit:v12 doubleValue:0.0];

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v14 = [v8 workoutActivities];
    id v15 = [v14 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v31;
      do
      {
        id v18 = 0;
        id v19 = v13;
        do
        {
          if (*(void *)v31 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v20 = *(void **)(*((void *)&v30 + 1) + 8 * (void)v18);
          id v21 = [v20 distanceType];
          id v22 = [v20 statisticsForType:v21];

          id v23 = [v22 sumQuantity];
          uint64_t v13 = [v19 _quantityByAddingQuantity:v23];

          id v18 = (char *)v18 + 1;
          id v19 = v13;
        }
        while (v16 != v18);
        id v16 = [v14 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v16);
    }

    a4 = v28;
    a5 = v29;
    uint64_t v10 = v27;
    id v11 = AKAccountManager_ptr;
  }
  else
  {
    uint64_t v13 = [v8 fiui_totalDistance];
  }
  formattingManager = self->_formattingManager;
  id v25 = [v11[156] meterUnit];
  [v13 doubleValueForUnit:v25];
  -[FIUIFormattingManager localizedNaturalScaleStringWithDistanceInMeters:distanceType:unitStyle:usedUnit:](formattingManager, "localizedNaturalScaleStringWithDistanceInMeters:distanceType:unitStyle:usedUnit:", v10, 0, &v34);
  *a4 = (id)objc_claimAutoreleasedReturnValue();

  id v26 = [(FIUIFormattingManager *)self->_formattingManager localizedShortUnitStringForDistanceUnit:v34];
  *a5 = [v26 localizedUppercaseString];
}

- (id)formattedRacePaceOrSpeedForWorkout:(id)a3 metersPerSecond:(id)a4 context:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [v10 fiui_activityType];
  uint64_t v12 = FIUIPaceFormatForWorkoutActivityType();
  uint64_t v13 = FIUIDistanceTypeForActivityType();
  uint64_t v14 = +[HKUnit meterUnit];
  [v9 doubleValue];
  double v16 = v15;

  uint64_t v17 = +[HKQuantity quantityWithUnit:v14 doubleValue:v16];

  id v18 = [(FIUIFormattingManager *)self->_formattingManager localizedPaceStringWithDistance:v17 overDuration:v12 paceFormat:v13 distanceType:1.0];
  id v19 = [(CHWorkoutFormattingManager *)self _paceUnitForActivityType:v11 paceFormat:v12];
  LOBYTE(v14) = [v10 didWinRace];

  if (v14) {
    +[ARUIMetricColors raceAheadColors];
  }
  else {
  uint64_t v20 = +[ARUIMetricColors raceBehindColors];
  }
  id v21 = [v20 nonGradientTextColor];
  id v22 = [(CHWorkoutFormattingManager *)self _formattedValueString:v18 withUnitString:v19 paceFormat:v12 context:v8 color:v21];

  return v22;
}

- (id)formattedGoalCompletedDurationForWorkout:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = +[CHWorkoutDisplayContext displayContextWithName:a4];
  id v8 = [(CHWorkoutFormattingManager *)self _goalCompletionEventsForWorkout:v6];
  if ([v8 count])
  {
    id v9 = [v8 objectAtIndexedSubscript:0];
    [v9 fiui_distanceGoalCompletionTime];
    double v11 = v10;

    uint64_t v12 = [(FIUIFormattingManager *)self->_formattingManager stringWithDuration:2 durationFormat:v11];
    id v13 = objc_alloc((Class)NSAttributedString);
    v20[0] = NSFontAttributeName;
    uint64_t v14 = [v7 valueFont];
    v21[0] = v14;
    v20[1] = NSForegroundColorAttributeName;
    double v15 = +[ARUIMetricColors metricColorsForWorkout:v6];
    double v16 = [v15 nonGradientTextColor];
    v21[1] = v16;
    uint64_t v17 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];
    id v18 = [v13 initWithString:v12 attributes:v17];
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

- (BOOL)nonZeroMetadataExistsInWorkout:(id)a3 orWorkoutActivity:(id)a4 withKey:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v8)
  {
    double v10 = [v8 metadata];
    double v11 = [v10 objectForKeyedSubscript:v9];
    if (v11)
    {
      uint64_t v12 = [v8 metadata];
      id v13 = [v12 objectForKeyedSubscript:v9];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        double v15 = v8;
LABEL_8:
        double v10 = [v15 metadata];
        id v19 = [v10 objectForKeyedSubscript:v9];
        LOBYTE(v11) = [v19 fiui_isNonzero];

        goto LABEL_9;
      }
      goto LABEL_10;
    }
  }
  else
  {
    double v10 = [v7 metadata];
    double v11 = [v10 objectForKeyedSubscript:v9];
    if (v11)
    {
      double v16 = [v7 metadata];
      uint64_t v17 = [v16 objectForKeyedSubscript:v9];
      objc_opt_class();
      char v18 = objc_opt_isKindOfClass();

      if (v18)
      {
        double v15 = v7;
        goto LABEL_8;
      }
LABEL_10:
      LOBYTE(v11) = 0;
      goto LABEL_11;
    }
  }
LABEL_9:

LABEL_11:
  return (char)v11;
}

- (BOOL)hasAverageCadenceForWorkout:(id)a3 workoutActivity:(id)a4
{
  return [(CHWorkoutFormattingManager *)self nonZeroMetadataExistsInWorkout:a3 orWorkoutActivity:a4 withKey:_HKPrivateMetadataKeyWorkoutAverageCadence];
}

- (BOOL)hasAveragePowerForWorkout:(id)a3 workoutActivity:(id)a4
{
  return [(CHWorkoutFormattingManager *)self nonZeroMetadataExistsInWorkout:a3 orWorkoutActivity:a4 withKey:_HKPrivateMetadataKeyWorkoutAveragePower];
}

- (BOOL)hasAverageCyclingPowerForWorkout:(id)a3 workoutActivity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 fiui_activityType];
  id v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    [v6 fiui_activityType];
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  double v11 = v10;

  if ([v11 identifier] == (id)13) {
    BOOL v12 = [(CHWorkoutFormattingManager *)self nonZeroMetadataExistsInWorkout:v6 orWorkoutActivity:v7 withKey:_HKPrivateMetadataKeyWorkoutAveragePower];
  }
  else {
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)isIndoorCyclingForWorkout:(id)a3 workoutActivity:(id)a4
{
  id v5 = a3;
  id v6 = [a4 fiui_activityType];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    [v5 fiui_activityType];
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v9 = v8;

  if ([v9 identifier] == (id)13) {
    unsigned __int8 v10 = [v9 isIndoor];
  }
  else {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (BOOL)hasAverageCyclingSpeedForWorkout:(id)a3 workoutActivity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 fiui_activityType];
  id v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    [v6 fiui_activityType];
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  double v11 = v10;

  if ([v11 identifier] == (id)13) {
    BOOL v12 = [(CHWorkoutFormattingManager *)self nonZeroMetadataExistsInWorkout:v6 orWorkoutActivity:v7 withKey:_HKPrivateMetadataKeyWorkoutAveragePace];
  }
  else {
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)hasDistanceForWorkout:(id)a3 workoutActivity:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = AKAccountManager_ptr;
  id v8 = +[HKUnit meterUnit];
  id v9 = +[HKQuantity quantityWithUnit:v8 doubleValue:0.0];

  if (v6)
  {
    id v10 = [v6 distanceType];
    double v11 = [v6 statisticsForType:v10];

    uint64_t v12 = [v11 sumQuantity];

LABEL_13:
    id v9 = (void *)v12;
    goto LABEL_14;
  }
  if ([v5 workoutActivityType] != (id)82)
  {
    uint64_t v12 = [v5 fiui_totalDistance];

    goto LABEL_13;
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v13 = [v5 workoutActivities];
  id v14 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v28;
    do
    {
      uint64_t v17 = 0;
      char v18 = v9;
      do
      {
        if (*(void *)v28 != v16) {
          objc_enumerationMutation(v13);
        }
        id v19 = *(void **)(*((void *)&v27 + 1) + 8 * (void)v17);
        uint64_t v20 = [v19 distanceType];
        id v21 = [v19 statisticsForType:v20];

        id v22 = [v21 sumQuantity];
        id v9 = [v18 _quantityByAddingQuantity:v22];

        uint64_t v17 = (char *)v17 + 1;
        char v18 = v9;
      }
      while (v15 != v17);
      id v15 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v15);
  }

  id v7 = AKAccountManager_ptr;
LABEL_14:
  id v23 = [v7[156] meterUnit];
  [v9 doubleValueForUnit:v23];
  BOOL v25 = v24 > 0.0;

  return v25;
}

- (BOOL)hasElevationAscendedDataForWorkout:(id)a3 workoutActivity:(id)a4
{
  uint64_t v6 = _HKPrivateMetadataKeyWorkoutElevationAscended;
  id v7 = a4;
  id v8 = a3;
  LOBYTE(v6) = [(CHWorkoutFormattingManager *)self nonZeroMetadataExistsInWorkout:v8 orWorkoutActivity:v7 withKey:v6];
  LOBYTE(self) = [(CHWorkoutFormattingManager *)self nonZeroMetadataExistsInWorkout:v8 orWorkoutActivity:v7 withKey:HKMetadataKeyElevationAscended];

  return v6 | self;
}

- (BOOL)hasFlightsClimbedForWorkout:(id)a3 workoutActivity:(id)a4
{
  id v5 = a4;
  if (v5)
  {
    id v6 = [objc_alloc((Class)HKQuantityType) initWithIdentifier:HKQuantityTypeIdentifierFlightsClimbed];
    id v7 = [v5 statisticsForType:v6];
    BOOL v8 = v7 != 0;
  }
  else
  {
    id v6 = [a3 totalFlightsClimbed];
    id v7 = +[HKUnit countUnit];
    [v6 doubleValueForUnit:v7];
    BOOL v8 = v9 > 0.0;
  }

  return v8;
}

- (BOOL)hasGroundElevationDataForWorkout:(id)a3 workoutActivity:(id)a4
{
  return [(CHWorkoutFormattingManager *)self nonZeroMetadataExistsInWorkout:a3 orWorkoutActivity:a4 withKey:NLWorkoutMetadataKeyMaxGroundElevation];
}

- (BOOL)hasStepCountForWorkout:(id)a3 workoutActivity:(id)a4
{
  return [(CHWorkoutFormattingManager *)self nonZeroMetadataExistsInWorkout:a3 orWorkoutActivity:a4 withKey:_HKPrivateMetadataKeyWorkoutStepCount];
}

- (BOOL)shouldShowDistanceForWorkout:(id)a3 workoutActivity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [v6 sourceRevision];
  double v9 = [v8 source];
  unsigned int v10 = [v9 _hasFirstPartyBundleID];

  if (v10
    && ![(CHWorkoutFormattingManager *)self supportsDistanceForWorkout:v6 workoutActivity:v7])
  {
    BOOL v11 = 0;
  }
  else
  {
    BOOL v11 = [(CHWorkoutFormattingManager *)self hasDistanceForWorkout:v6 workoutActivity:v7];
  }

  return v11;
}

- (BOOL)supportsDistanceForWorkout:(id)a3 workoutActivity:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init((Class)NSMutableSet);
  long long v31 = v6;
  BOOL v8 = [v6 fiui_activityType];
  double v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    [v5 fiui_activityType];
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  BOOL v11 = v10;

  long long v30 = v11;
  if ([v11 identifier] == (id)82)
  {
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    uint64_t v12 = [v5 workoutActivities];
    id v13 = [v12 countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v38;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v38 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = [*(id *)(*((void *)&v37 + 1) + 8 * i) fiui_activityType];
          if ([v17 effectiveTypeIdentifier] != (id)83) {
            [v7 addObject:v17];
          }
        }
        id v14 = [v12 countByEnumeratingWithState:&v37 objects:v42 count:16];
      }
      while (v14);
    }
  }
  else
  {
    [v7 addObject:v11];
  }
  id v18 = +[FIUIWorkoutDefaultMetricsProvider metricsVersionForWorkout:v5];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v7;
  id v19 = [obj countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v34;
    int v22 = 1;
    do
    {
      for (j = 0; j != v20; j = (char *)j + 1)
      {
        if (*(void *)v34 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v24 = *(void *)(*((void *)&v33 + 1) + 8 * (void)j);
        id v25 = objc_alloc((Class)FIUIWorkoutDefaultMetricsProvider);
        id v26 = [v5 _activityMoveMode];
        uint64_t v27 = FIUIDeviceSupportsElevationGain();
        id v28 = [v25 initWithMetricsVersion:v18 activityType:v24 activityMoveMode:v26 deviceSupportsElevationMetrics:v27 deviceSupportsGroundElevationMetrics:FIUIDeviceSupportsGroundElevation()];
        v22 &= [v28 isMetricTypeSupported:1 isMachineWorkout:[v5 fiui_isConnectedGymWorkout] activityType:v24];
      }
      id v20 = [obj countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v20);
  }
  else
  {
    LOBYTE(v22) = 1;
  }

  return v22;
}

- (BOOL)supportsPaceForWorkout:(id)a3 workoutActivity:(id)a4
{
  id v5 = a3;
  id v6 = v5;
  if (a4) {
    id v5 = a4;
  }
  id v7 = [v5 fiui_activityType];
  id v8 = +[FIUIWorkoutDefaultMetricsProvider metricsVersionForWorkout:v6];
  id v9 = objc_alloc((Class)FIUIWorkoutDefaultMetricsProvider);
  id v10 = [v6 _activityMoveMode];
  uint64_t v11 = FIUIDeviceSupportsElevationGain();
  id v12 = [v9 initWithMetricsVersion:v8 activityType:v7 activityMoveMode:v10 deviceSupportsElevationMetrics:v11 deviceSupportsGroundElevationMetrics:FIUIDeviceSupportsGroundElevation()];
  id v13 = [v6 fiui_isConnectedGymWorkout];

  unsigned __int8 v14 = [v12 isMetricTypeSupported:8 isMachineWorkout:v13 activityType:v7];
  return v14;
}

- (BOOL)supportsElevationAscendedForWorkout:(id)a3 workoutActivity:(id)a4
{
  if (a4) {
    id v4 = a4;
  }
  else {
    id v4 = a3;
  }
  id v5 = [v4 fiui_activityType:a3];
  unsigned __int8 v6 = [v5 bridge_supportsElevationAscendedInSummary];

  return v6;
}

- (BOOL)supportsElevationDescendedForWorkout:(id)a3 workoutActivity:(id)a4
{
  if (a4) {
    id v4 = a4;
  }
  else {
    id v4 = a3;
  }
  id v5 = [v4 fiui_activityType:a3];
  unsigned __int8 v6 = [v5 bridge_supportsElevationDescendedInSummary];

  return v6;
}

- (BOOL)supportsDownhillRunsCountForWorkout:(id)a3 workoutActivity:(id)a4
{
  if (a4) {
    id v4 = a4;
  }
  else {
    id v4 = a3;
  }
  id v5 = [v4 fiui_activityType:a3];
  BOOL v6 = +[CHWorkoutDownhillRun supportsActivityType:](CHWorkoutDownhillRun, "supportsActivityType:", [v5 effectiveTypeIdentifier]);

  return v6;
}

- (id)formattedActiveEnergyForWorkout:(id)a3 workoutActivity:(id)a4 context:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (v8)
  {
    id v10 = [objc_alloc((Class)HKQuantityType) initWithIdentifier:HKQuantityTypeIdentifierActiveEnergyBurned];
    uint64_t v11 = [v8 statisticsForType:v10];
    id v12 = [v11 sumQuantity];
  }
  else
  {
    id v12 = [a3 totalEnergyBurned];
  }
  id v13 = [(CHWorkoutFormattingManager *)self formattedEnergyBurn:v12 context:a5];

  return v13;
}

- (id)formattedAverageCadenceForWorkout:(id)a3 workoutActivity:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(CHWorkoutFormattingManager *)self hasAverageCadenceForWorkout:v8 workoutActivity:v9])
  {
    id v36 = v8;
    if (v9)
    {
      [v9 fiui_averageCadence];
      double v12 = v11;
      id v13 = [v9 workoutConfiguration];
      id v14 = [v13 activityType];
    }
    else
    {
      [v8 fiui_averageCadence];
      double v12 = v16;
      id v14 = [v8 workoutActivityType];
    }
    uint64_t v17 = +[NSNumber numberWithDouble:v12];
    long long v34 = +[FIUIFormattingManager stringWithNumber:v17 decimalPrecision:1];

    id v18 = [(id)objc_opt_class() localizedShortCadenceUnitStringForActivityType:v14];
    id v19 = [v18 localizedUppercaseString];

    id v20 = +[CHWorkoutDisplayContext displayContextWithName:v10];
    uint64_t v21 = [v20 unitFormatString];
    int v22 = +[NSString stringWithValidatedFormat:v21, @"%@%@", 0, v34, v19 validFormatSpecifiers error];

    id v23 = objc_alloc((Class)NSMutableAttributedString);
    v37[0] = NSFontAttributeName;
    uint64_t v24 = [v20 valueFont];
    v38[0] = v24;
    v37[1] = NSForegroundColorAttributeName;
    id v25 = +[ARUIMetricColors cadenceColors];
    [v25 nonGradientTextColor];
    v26 = id v35 = v10;
    v38[1] = v26;
    uint64_t v27 = +[NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:2];
    id v15 = [v23 initWithString:v22 attributes:v27];

    id v28 = [v22 rangeOfString:v19];
    uint64_t v30 = v29;
    long long v31 = [v20 goalDescriptionFont];
    uint64_t v32 = v30;
    id v10 = v35;
    [v15 addAttribute:NSFontAttributeName value:v31 range:v28, v32];

    id v8 = v36;
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (double)averageCyclingPowerForWorkout:(id)a3 workoutActivity:(id)a4
{
  id v5 = a4;
  if (v5)
  {
    id v6 = [objc_alloc((Class)HKQuantityType) initWithIdentifier:HKQuantityTypeIdentifierCyclingPower];
    id v7 = [v5 statisticsForType:v6];
    id v8 = [v7 averageQuantity];
    [v8 _value];
    double v10 = v9;
  }
  else
  {
    [a3 fiui_averagePower];
    double v10 = v11;
  }

  return v10;
}

- (double)averageCyclingSpeedForWorkout:(id)a3 workoutActivity:(id)a4
{
  id v5 = a4;
  if (v5)
  {
    id v6 = [objc_alloc((Class)HKQuantityType) initWithIdentifier:HKQuantityTypeIdentifierCyclingSpeed];
    id v7 = [v5 statisticsForType:v6];
    id v8 = [v7 averageQuantity];
    [v8 _value];
    double v10 = v9;
  }
  else
  {
    [a3 fiui_averagePace];
    double v10 = v11;
  }

  return v10;
}

- (id)formattedAveragePowerForWorkout:(id)a3 workoutActivity:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(CHWorkoutFormattingManager *)self hasAveragePowerForWorkout:v8 workoutActivity:v9])
  {
    if (v9)
    {
      double v11 = [v9 fiui_activityType];
      id v12 = [v11 identifier];

      id v13 = (id *)&HKQuantityTypeIdentifierCyclingPower;
      if (v12 != (id)13) {
        id v13 = (id *)&HKQuantityTypeIdentifierRunningPower;
      }
      id v14 = *v13;
      id v15 = [objc_alloc((Class)HKQuantityType) initWithIdentifier:v14];

      double v16 = [v9 statisticsForType:v15];
      uint64_t v17 = [v16 averageQuantity];
      [v17 _value];
      double v19 = v18;
    }
    else
    {
      [v8 fiui_averagePower];
      double v19 = v21;
    }
    id v20 = [(CHWorkoutFormattingManager *)self formattedAveragePowerStringFor:v10 context:v19];
  }
  else
  {
    id v20 = 0;
  }

  return v20;
}

- (id)formattedAveragePowerStringFor:(double)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = [(CHWorkoutFormattingManager *)self formattedPowerStringFor:a3];
  id v8 = [(id)objc_opt_class() localizedShortPowerUnitString];
  id v9 = [v8 localizedUppercaseString];

  id v10 = +[CHWorkoutDisplayContext displayContextWithName:v6];

  double v11 = [v10 unitFormatString];
  id v12 = +[NSString stringWithValidatedFormat:v11, @"%@%@", 0, v7, v9 validFormatSpecifiers error];

  id v13 = objc_alloc((Class)NSMutableAttributedString);
  v24[0] = NSFontAttributeName;
  id v14 = [v10 valueFont];
  v25[0] = v14;
  v24[1] = NSForegroundColorAttributeName;
  id v15 = +[ARUIMetricColors powerColors];
  double v16 = [v15 nonGradientTextColor];
  v25[1] = v16;
  uint64_t v17 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:2];
  id v18 = [v13 initWithString:v12 attributes:v17];

  id v19 = [v12 rangeOfString:v9];
  uint64_t v21 = v20;
  int v22 = [v10 goalDescriptionFont];
  [v18 addAttribute:NSFontAttributeName value:v22 range:v19, v21];

  return v18;
}

- (id)formattedPowerStringFor:(double)a3
{
  id v3 = +[NSNumber numberWithDouble:floor(a3)];
  id v4 = +[NSNumberFormatter localizedStringFromNumber:v3 numberStyle:0];

  return v4;
}

- (id)formattedDistanceForWorkout:(id)a3 workoutActivity:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = +[CHWorkoutDisplayContext displayContextWithName:a5];
  v52 = v9;
  v53 = v8;
  if (v9)
  {
    double v11 = [v9 distanceType];
    id v12 = [v9 statisticsForType:v11];

    id v13 = [v12 sumQuantity];
    id v14 = [v9 fiui_activityType];
    uint64_t v15 = FIUIDistanceTypeForActivityType();

    uint64_t v60 = 0;
    formattingManager = self->_formattingManager;
    uint64_t v17 = +[HKUnit meterUnit];
    [v13 doubleValueForUnit:v17];
    -[FIUIFormattingManager localizedNaturalScaleStringWithDistanceInMeters:distanceType:unitStyle:usedUnit:](formattingManager, "localizedNaturalScaleStringWithDistanceInMeters:distanceType:unitStyle:usedUnit:", v15, 0, &v60);
    id v18 = (id)objc_claimAutoreleasedReturnValue();

    id v19 = [(FIUIFormattingManager *)self->_formattingManager localizedShortUnitStringForDistanceUnit:v60];
    id v20 = [v19 localizedUppercaseString];
  }
  else if ([v8 workoutActivityType] == (id)82)
  {
    v50 = v10;
    uint64_t v21 = +[HKUnit meterUnit];
    int v22 = +[HKQuantity quantityWithUnit:v21 doubleValue:0.0];

    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v23 = [v8 workoutActivities];
    id v24 = [v23 countByEnumeratingWithState:&v56 objects:v63 count:16];
    if (v24)
    {
      id v25 = v24;
      uint64_t v26 = *(void *)v57;
      do
      {
        uint64_t v27 = 0;
        id v28 = v22;
        do
        {
          if (*(void *)v57 != v26) {
            objc_enumerationMutation(v23);
          }
          uint64_t v29 = *(void **)(*((void *)&v56 + 1) + 8 * (void)v27);
          uint64_t v30 = [v29 distanceType];
          long long v31 = [v29 statisticsForType:v30];

          uint64_t v32 = [v31 sumQuantity];
          int v22 = [v28 _quantityByAddingQuantity:v32];

          uint64_t v27 = (char *)v27 + 1;
          id v28 = v22;
        }
        while (v25 != v27);
        id v25 = [v23 countByEnumeratingWithState:&v56 objects:v63 count:16];
      }
      while (v25);
    }

    uint64_t v60 = 0;
    long long v33 = self->_formattingManager;
    long long v34 = +[HKUnit meterUnit];
    [v22 doubleValueForUnit:v34];
    -[FIUIFormattingManager localizedNaturalScaleStringWithDistanceInMeters:distanceType:unitStyle:usedUnit:](v33, "localizedNaturalScaleStringWithDistanceInMeters:distanceType:unitStyle:usedUnit:", 1, 0, &v60);
    id v18 = (id)objc_claimAutoreleasedReturnValue();

    id v35 = [(FIUIFormattingManager *)self->_formattingManager localizedShortUnitStringForDistanceUnit:v60];
    id v20 = [v35 localizedUppercaseString];

    id v10 = v50;
  }
  else
  {
    id v54 = 0;
    id v55 = 0;
    [(CHWorkoutFormattingManager *)self _formattedDistanceStringForWorkout:v8 distanceString:&v55 unitString:&v54];
    id v18 = v55;
    id v20 = v54;
  }
  id v36 = [v10 unitFormatString];
  long long v37 = +[NSString stringWithValidatedFormat:v36, @"%@%@", 0, v18, v20 validFormatSpecifiers error];

  id v38 = [v37 rangeOfString:v20];
  uint64_t v49 = v39;
  id v51 = v38;
  id v40 = objc_alloc((Class)NSMutableAttributedString);
  v61[0] = NSFontAttributeName;
  v41 = [v10 valueFont];
  v62[0] = v41;
  v61[1] = NSForegroundColorAttributeName;
  id v42 = +[ARUIMetricColors distanceColors];
  [v42 nonGradientTextColor];
  v44 = v43 = v18;
  v62[1] = v44;
  v45 = +[NSDictionary dictionaryWithObjects:v62 forKeys:v61 count:2];
  id v46 = [v40 initWithString:v37 attributes:v45];

  v47 = [v10 goalDescriptionFont];
  [v46 addAttribute:NSFontAttributeName value:v47 range:v51];

  return v46;
}

- (id)formattedDurationForWorkout:(id)a3 workoutActivity:(id)a4 context:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = +[CHWorkoutDisplayContext displayContextWithName:a5];
  if (v8) {
    [v8 duration];
  }
  else {
    [v9 fiui_duration];
  }
  double v12 = v11;
  id v13 = [v9 workoutActivityType];

  if (v12 < 3600.0 && v13 == (id)84) {
    uint64_t v15 = 3;
  }
  else {
    uint64_t v15 = 2;
  }
  double v16 = [(FIUIFormattingManager *)self->_formattingManager stringWithDuration:v15 durationFormat:v12];
  id v17 = objc_alloc((Class)NSAttributedString);
  v24[0] = NSFontAttributeName;
  id v18 = [v10 valueFont];
  v25[0] = v18;
  v24[1] = NSForegroundColorAttributeName;
  id v19 = +[ARUIMetricColors elapsedTimeColors];
  id v20 = [v19 nonGradientTextColor];
  v25[1] = v20;
  uint64_t v21 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:2];
  id v22 = [v17 initWithString:v16 attributes:v21];

  return v22;
}

- (id)formattedElapsedTimeForWorkout:(id)a3 workoutActivity:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = +[CHWorkoutDisplayContext displayContextWithName:a5];
  if (v9) {
    double v11 = v9;
  }
  else {
    double v11 = v8;
  }
  [v11 elapsedTime];
  double v12 = -[FIUIFormattingManager stringWithDuration:durationFormat:](self->_formattingManager, "stringWithDuration:durationFormat:", 2);
  id v13 = objc_alloc((Class)NSAttributedString);
  v20[0] = NSFontAttributeName;
  id v14 = [v10 valueFont];
  v21[0] = v14;
  v20[1] = NSForegroundColorAttributeName;
  uint64_t v15 = +[ARUIMetricColors elapsedTimeColors];
  double v16 = [v15 nonGradientTextColor];
  v21[1] = v16;
  id v17 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];
  id v18 = [v13 initWithString:v12 attributes:v17];

  return v18;
}

- (id)formattedRaceTimeForWorkout:(id)a3 workoutActivity:(id)a4 context:(id)a5
{
  id v7 = a3;
  id v8 = +[CHWorkoutDisplayContext displayContextWithName:a5];
  [v7 raceTime];
  id v9 = -[FIUIFormattingManager stringWithDuration:durationFormat:](self->_formattingManager, "stringWithDuration:durationFormat:", 2);
  unsigned __int8 v10 = [v7 didWinRace];

  if (v10) {
    +[ARUIMetricColors raceAheadColors];
  }
  else {
  double v11 = +[ARUIMetricColors raceBehindColors];
  }
  id v12 = objc_alloc((Class)NSAttributedString);
  v18[0] = NSFontAttributeName;
  id v13 = [v8 valueFont];
  v19[0] = v13;
  v18[1] = NSForegroundColorAttributeName;
  id v14 = [v11 nonGradientTextColor];
  v19[1] = v14;
  uint64_t v15 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];
  id v16 = [v12 initWithString:v9 attributes:v15];

  return v16;
}

- (id)formattedElevationGainForWorkout:(id)a3 workoutActivity:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9)
  {
    double v11 = [v9 metadata];
    id v12 = [v11 objectForKeyedSubscript:HKMetadataKeyElevationAscended];

    if (v12) {
      goto LABEL_7;
    }
    id v13 = v9;
  }
  else
  {
    id v14 = [v8 metadata];
    id v12 = [v14 objectForKeyedSubscript:HKMetadataKeyElevationAscended];

    if (v12) {
      goto LABEL_7;
    }
    id v13 = v8;
  }
  uint64_t v15 = [v13 metadata];
  id v12 = [v15 objectForKeyedSubscript:_HKPrivateMetadataKeyWorkoutElevationAscended];

LABEL_7:
  id v16 = [(CHWorkoutFormattingManager *)self formattedElevation:v12 context:v10];

  return v16;
}

- (id)formattedElevation:(id)a3 context:(id)a4
{
  formattingManager = self->_formattingManager;
  id v7 = a4;
  id v8 = a3;
  id v9 = [(FIUIFormattingManager *)formattingManager unitManager];
  id v10 = [v9 userDistanceElevationUnit];

  double v11 = +[CHWorkoutDisplayContext displayContextWithName:v7];

  id v12 = self->_formattingManager;
  id v13 = +[HKUnit meterUnit];
  [v8 doubleValueForUnit:v13];
  double v15 = v14;

  long long v31 = [(FIUIFormattingManager *)v12 localizedStringWithDistanceInMeters:v10 distanceUnit:0 unitStyle:1 decimalPrecision:v15];

  id v16 = [(FIUIFormattingManager *)self->_formattingManager localizedShortUnitStringForDistanceUnit:v10];
  id v17 = [v16 localizedUppercaseString];

  id v18 = [v11 unitFormatString];
  id v19 = +[NSString stringWithValidatedFormat:v18, @"%@%@", 0, v31, v17 validFormatSpecifiers error];

  id v20 = [v19 rangeOfString:v17];
  uint64_t v22 = v21;
  id v23 = +[ARUIMetricColors elevationColors];
  id v24 = [v23 nonGradientTextColor];

  id v25 = objc_alloc((Class)NSMutableAttributedString);
  v32[0] = NSFontAttributeName;
  uint64_t v26 = [v11 valueFont];
  v32[1] = NSForegroundColorAttributeName;
  v33[0] = v26;
  v33[1] = v24;
  uint64_t v27 = +[NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:2];
  id v28 = [v25 initWithString:v19 attributes:v27];

  uint64_t v29 = [v11 goalDescriptionFont];
  [v28 addAttribute:NSFontAttributeName value:v29 range:v20, v22];

  return v28;
}

- (id)formattedFlightsClimbedForWorkout:(id)a3 workoutActivity:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(CHWorkoutFormattingManager *)self hasFlightsClimbedForWorkout:v8 workoutActivity:v9])
  {
    if (v9)
    {
      id v11 = [objc_alloc((Class)HKQuantityType) initWithIdentifier:HKQuantityTypeIdentifierFlightsClimbed];
      id v12 = [v9 statisticsForType:v11];
      id v13 = [v12 sumQuantity];
      [v13 _value];
      double v15 = v14;
    }
    else
    {
      id v11 = [v8 totalFlightsClimbed];
      id v12 = +[HKUnit countUnit];
      [v11 doubleValueForUnit:v12];
      double v15 = v17;
    }

    id v18 = +[NSNumber numberWithDouble:v15];
    id v19 = +[NSNumberFormatter localizedStringFromNumber:v18 numberStyle:0];

    id v20 = +[CHWorkoutDisplayContext displayContextWithName:v10];
    id v21 = objc_alloc((Class)NSAttributedString);
    v27[0] = NSFontAttributeName;
    uint64_t v22 = [v20 valueFont];
    v28[0] = v22;
    v27[1] = NSForegroundColorAttributeName;
    id v23 = +[ARUIMetricColors flightsClimbedColors];
    id v24 = [v23 nonGradientTextColor];
    v28[1] = v24;
    id v25 = +[NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];
    id v16 = [v21 initWithString:v19 attributes:v25];
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

- (id)formattedGroundElevationGainForWorkout:(id)a3 workoutActivity:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9)
  {
    id v11 = [v9 metadata];
    id v12 = [v11 objectForKeyedSubscript:NLWorkoutMetadataKeyMaxGroundElevation];

    id v13 = v9;
  }
  else
  {
    double v14 = [v8 metadata];
    id v12 = [v14 objectForKeyedSubscript:NLWorkoutMetadataKeyMaxGroundElevation];

    id v13 = v8;
  }
  double v15 = [v13 metadata];
  id v16 = [v15 objectForKeyedSubscript:NLWorkoutMetadataKeyMinGroundElevation];

  if (v12) {
    BOOL v17 = v16 == 0;
  }
  else {
    BOOL v17 = 1;
  }
  if (v17)
  {
    id v39 = 0;
  }
  else
  {
    uint64_t v50 = 0;
    id v48 = v8;
    id v18 = +[HKUnit meterUnit];
    [v12 doubleValueForUnit:v18];
    double v20 = v19;

    uint64_t v49 = [(FIUIFormattingManager *)self->_formattingManager localizedNaturalScaleStringWithDistanceInMeters:5 distanceType:0 unitStyle:&v50 usedUnit:v20];
    id v21 = +[HKUnit meterUnit];
    [v16 doubleValueForUnit:v21];
    double v23 = v22;

    [(FIUIFormattingManager *)self->_formattingManager localizedNaturalScaleStringWithDistanceInMeters:5 distanceType:0 unitStyle:&v50 usedUnit:v23];
    v43 = id v45 = v9;
    [(FIUIFormattingManager *)self->_formattingManager localizedShortUnitStringForDistanceUnit:v50];
    id v24 = v44 = v16;
    id v42 = [(CHWorkoutFormattingManager *)self _groundElevationFont];
    id v41 = objc_alloc_init((Class)NSMutableParagraphStyle);
    [(CHWorkoutFormattingManager *)self _groundElevationHeight];
    [v41 setMaximumLineHeight:v25];
    [(CHWorkoutFormattingManager *)self _groundElevationHeight];
    [v41 setMinimumLineHeight:v26];
    id v47 = v10;
    FIUIBundle();
    uint64_t v27 = v46 = v12;
    id v28 = [v27 localizedStringForKey:@"SUMMARY_GROUND_ELEVATION_MIN" value:&stru_1008D8AB8 table:@"Localizable"];
    uint64_t v29 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v28, v43, v24);

    uint64_t v30 = FIUIBundle();
    long long v31 = [v30 localizedStringForKey:@"SUMMARY_GROUND_ELEVATION_MAX" value:&stru_1008D8AB8 table:@"Localizable"];
    uint64_t v32 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v31, v49, v24);

    long long v33 = +[NSString localizedStringWithFormat:@"%@\n%@", v32, v29];
    id v34 = objc_alloc((Class)NSMutableAttributedString);
    id v35 = [v33 localizedUppercaseString];
    v52[0] = v42;
    v51[0] = NSFontAttributeName;
    v51[1] = NSForegroundColorAttributeName;
    id v36 = +[ARUIMetricColors elevationColors];
    long long v37 = [v36 nonGradientTextColor];
    v51[2] = NSParagraphStyleAttributeName;
    v52[1] = v37;
    v52[2] = v41;
    id v38 = +[NSDictionary dictionaryWithObjects:v52 forKeys:v51 count:3];
    id v39 = [v34 initWithString:v35 attributes:v38];

    id v10 = v47;
    id v12 = v46;

    id v8 = v48;
    id v16 = v44;

    id v9 = v45;
  }

  return v39;
}

- (id)formattedLapCountForWorkout:(id)a3 workoutActivity:(id)a4 context:(id)a5
{
  id v8 = a5;
  if (a4) {
    id v9 = a4;
  }
  else {
    id v9 = a3;
  }
  id v10 = [v9 workoutEvents];
  id v11 = +[NSPredicate predicateWithBlock:&stru_1008ABA28];
  id v12 = [v10 filteredArrayUsingPredicate:v11];
  id v13 = [v12 count];

  double v14 = +[ARUIMetricColors lapColors];
  double v15 = [v14 nonGradientTextColor];

  id v16 = [(CHWorkoutFormattingManager *)self formattedCount:v13 color:v15 context:v8];

  return v16;
}

- (id)formattedDownhillRunsCount:(int64_t)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = +[ARUIMetricColors lapColors];
  id v8 = [v7 nonGradientTextColor];

  id v9 = [(CHWorkoutFormattingManager *)self formattedCount:a3 color:v8 context:v6];

  return v9;
}

- (id)formattedCount:(int64_t)a3 color:(id)a4 context:(id)a5
{
  if (a3)
  {
    id v7 = a5;
    id v8 = a4;
    id v9 = +[NSNumber numberWithInteger:a3];
    id v10 = +[NSNumberFormatter localizedStringFromNumber:v9 numberStyle:0];

    id v11 = +[CHWorkoutDisplayContext displayContextWithName:v7];

    id v12 = objc_alloc((Class)NSAttributedString);
    v17[0] = NSFontAttributeName;
    id v13 = [v11 valueFont];
    v17[1] = NSForegroundColorAttributeName;
    v18[0] = v13;
    v18[1] = v8;
    double v14 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];

    id v15 = [v12 initWithString:v10 attributes:v14];
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (id)formattedPaceOrSpeedForWorkout:(id)a3 workoutActivity:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v9 fiui_activityType];
  id v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    [v8 fiui_activityType];
    id v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  double v14 = v13;

  if (v9)
  {
    id v15 = [v9 distanceType];
    id v16 = [v9 statisticsForType:v15];

    BOOL v17 = [v16 sumQuantity];
    [v9 duration];
    double v19 = v18;
  }
  else if (((objc_msgSend(v8, "fiui_isConnectedGymWorkout") & 1) != 0 {
          || [v14 identifier] == (id)13 && objc_msgSend(v14, "isIndoor"))
  }
         && objc_msgSend(v8, "fiui_hasAveragePace"))
  {
    [v8 fiui_averagePace];
    double v21 = v20;
    double v22 = +[HKUnit meterUnit];
    BOOL v17 = +[HKQuantity quantityWithUnit:v22 doubleValue:v21];

    double v19 = 1.0;
  }
  else
  {
    BOOL v17 = [v8 totalDistance];
    [v8 duration];
    double v19 = v23;
  }
  id v24 = [(CHWorkoutFormattingManager *)self formattedPaceOrSpeedWithDistance:v17 overDuration:v14 activityType:v10 context:v19];

  return v24;
}

- (id)formattedPaceOrSpeedWithDistance:(id)a3 overDuration:(double)a4 activityType:(id)a5 context:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  uint64_t v13 = FIUIPaceFormatForWorkoutActivityType();
  double v14 = [(FIUIFormattingManager *)self->_formattingManager localizedPaceStringWithDistance:v12 overDuration:v13 paceFormat:FIUIDistanceTypeForActivityType() distanceType:a4];

  id v15 = [(CHWorkoutFormattingManager *)self _paceUnitForActivityType:v11 paceFormat:v13];

  id v16 = +[ARUIMetricColors paceColors];
  BOOL v17 = [v16 nonGradientTextColor];

  double v18 = [(CHWorkoutFormattingManager *)self _formattedValueString:v14 withUnitString:v15 paceFormat:v13 context:v10 color:v17];

  return v18;
}

- (id)formattedAverageSwimPaceWithDuration:(id)a3 context:(id)a4
{
  formattingManager = self->_formattingManager;
  id v7 = a4;
  [a3 doubleValue];
  id v8 = -[FIUIFormattingManager stringWithDuration:durationFormat:](formattingManager, "stringWithDuration:durationFormat:", 1);
  id v9 = [(FIUIFormattingManager *)self->_formattingManager unitManager];
  id v10 = [v9 userLapLengthHKUnit];

  id v11 = [(FIUIFormattingManager *)self->_formattingManager localizedShortUnitStringForDistanceUnit:FIUIDistanceUnitForHKUnit()];
  uint64_t v12 = FIUINumberOfUnitsInPaceForPaceFormat();
  uint64_t v13 = [v11 localizedLowercaseString];

  double v14 = +[NSBundle mainBundle];
  id v15 = [v14 localizedStringForKey:@"PACE_MANY_UNIT_FORMAT" value:&stru_1008D8AB8 table:@"Localizable"];
  id v16 = +[NSNumber numberWithUnsignedInteger:v12];
  BOOL v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v15, v16, v13);

  double v18 = +[ARUIMetricColors paceColors];
  double v19 = [v18 nonGradientTextColor];

  double v20 = [(CHWorkoutFormattingManager *)self _formattedValueString:v8 withUnitString:v17 paceFormat:2 context:v7 color:v19];

  return v20;
}

- (id)_paceUnitForActivityType:(id)a3 paceFormat:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = FIUIDistanceTypeForActivityType();
  if (a4 == 4)
  {
    id v8 = [(FIUIFormattingManager *)self->_formattingManager localizedSpeedUnitStringForActivityType:v6];
  }
  else
  {
    uint64_t v9 = v7;
    id v10 = [v6 identifier];

    formattingManager = self->_formattingManager;
    uint64_t v12 = [(FIUIFormattingManager *)formattingManager unitManager];
    uint64_t v13 = v12;
    if (v10 == (id)46)
    {
      uint64_t v14 = [v12 userLapLengthHKUnit];

      id v8 = [(FIUIFormattingManager *)self->_formattingManager localizedShortUnitStringForDistanceUnit:FIUIDistanceUnitForHKUnit()];
      uint64_t v13 = (void *)v14;
    }
    else
    {
      id v15 = -[FIUIFormattingManager localizedShortUnitStringForDistanceUnit:](formattingManager, "localizedShortUnitStringForDistanceUnit:", [v12 paceDistanceUnitForDistanceType:v9]);
      id v8 = [v15 localizedUppercaseString];
    }
    if ((unint64_t)(a4 - 2) >= 2)
    {
      if (a4 != 1) {
        goto LABEL_11;
      }
      id v6 = +[NSBundle mainBundle];
      double v20 = [v6 localizedStringForKey:@"FITNESS_PACE_UNIT_FORMAT_%@" value:&stru_1008D8AB8 table:@"Localizable"];
      uint64_t v21 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v20, v8);

      id v8 = (void *)v21;
    }
    else
    {
      uint64_t v16 = FIUINumberOfUnitsInPaceForPaceFormat();
      BOOL v17 = [v8 localizedLowercaseString];

      id v6 = +[NSBundle mainBundle];
      double v18 = [v6 localizedStringForKey:@"PACE_MANY_UNIT_FORMAT" value:&stru_1008D8AB8 table:@"Localizable"];
      double v19 = +[NSNumber numberWithUnsignedInteger:v16];
      id v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v18, v19, v17);
    }
  }

LABEL_11:

  return v8;
}

- (id)_formattedValueString:(id)a3 withUnitString:(id)a4 paceFormat:(int64_t)a5 context:(id)a6 color:(id)a7
{
  id v11 = a7;
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = +[CHWorkoutDisplayContext displayContextWithName:a6];
  id v15 = [v14 goalDescriptionFont];
  if ((a5 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    uint64_t v16 = [v14 pace100UnitFont];

    id v15 = (void *)v16;
  }
  BOOL v17 = [v14 unitFormatString];
  double v18 = +[NSString stringWithValidatedFormat:v17, @"%@%@", 0, v13, v12 validFormatSpecifiers error];

  id v19 = [v18 rangeOfString:v12];
  uint64_t v21 = v20;

  id v22 = [v18 rangeOfString:v13];
  uint64_t v30 = v23;
  id v31 = v22;

  id v24 = objc_alloc((Class)NSMutableAttributedString);
  v32[0] = NSFontAttributeName;
  float v25 = [v14 valueFont];
  v32[1] = NSForegroundColorAttributeName;
  v33[0] = v25;
  v33[1] = v11;
  float v26 = +[NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:2];
  id v27 = [v24 initWithString:v18 attributes:v26];

  [v27 addAttribute:NSFontAttributeName value:v15 range:v19];
  UIUserInterfaceLayoutDirection v28 = +[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:0];

  if (v28 == UIUserInterfaceLayoutDirectionRightToLeft) {
    [v27 addAttribute:NSWritingDirectionAttributeName value:&off_1008DE960 range:v31];
  }

  return v27;
}

- (id)formattedPoolLengthForWorkout:(id)a3 workoutActivity:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9)
  {
    id v11 = [v9 workoutConfiguration];
    id v12 = [v11 lapLength];

    if (v12)
    {
      id v40 = v8;
      uint64_t v41 = 0;
      id v39 = v9;
      id v13 = v9;
LABEL_6:
      [v13 fiui_activityType];
      v38 = id v36 = v12;
      uint64_t v15 = FIUIDistanceTypeForActivityType();
      formattingManager = self->_formattingManager;
      BOOL v17 = +[HKUnit meterUnit];
      [v12 doubleValueForUnit:v17];
      long long v37 = -[FIUIFormattingManager localizedNaturalScaleStringWithDistanceInMeters:distanceType:unitStyle:usedUnit:](formattingManager, "localizedNaturalScaleStringWithDistanceInMeters:distanceType:unitStyle:usedUnit:", v15, 0, &v41);

      double v18 = [(FIUIFormattingManager *)self->_formattingManager localizedShortUnitStringForDistanceUnit:v41];
      id v19 = [v18 localizedUppercaseString];

      uint64_t v20 = +[CHWorkoutDisplayContext displayContextWithName:v10];
      uint64_t v21 = [v20 unitFormatString];
      id v22 = +[NSString stringWithValidatedFormat:v21, @"%@%@", 0, v37, v19 validFormatSpecifiers error];

      id v23 = [v22 rangeOfString:v19];
      uint64_t v34 = v24;
      id v35 = v23;
      id v25 = objc_alloc((Class)NSMutableAttributedString);
      v42[0] = NSFontAttributeName;
      float v26 = [v20 valueFont];
      v43[0] = v26;
      v42[1] = NSForegroundColorAttributeName;
      id v27 = +[ARUIMetricColors lapColors];
      UIUserInterfaceLayoutDirection v28 = [v27 nonGradientTextColor];
      v43[1] = v28;
      +[NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:2];
      uint64_t v30 = v29 = v10;
      id v31 = [v25 initWithString:v22 attributes:v30];

      id v10 = v29;
      uint64_t v32 = [v20 goalDescriptionFont];
      [v31 addAttribute:NSFontAttributeName value:v32 range:v35];

      id v9 = v39;
      id v8 = v40;
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v14 = [v8 fiui_lapLength];
    if (v14)
    {
      id v12 = (void *)v14;
      id v39 = 0;
      id v40 = v8;
      uint64_t v41 = 0;
      id v13 = v8;
      goto LABEL_6;
    }
  }
  id v31 = 0;
LABEL_8:

  return v31;
}

- (id)formattedStepCountForWorkout:(id)a3 workoutActivity:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(CHWorkoutFormattingManager *)self hasStepCountForWorkout:v8 workoutActivity:v9])
  {
    if (v9) {
      id v11 = v9;
    }
    else {
      id v11 = v8;
    }
    [v11 fiui_totalStepCount];
    id v13 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    uint64_t v14 = +[NSNumberFormatter localizedStringFromNumber:v13 numberStyle:0];

    uint64_t v15 = +[CHWorkoutDisplayContext displayContextWithName:v10];
    id v16 = objc_alloc((Class)NSAttributedString);
    v22[0] = NSFontAttributeName;
    BOOL v17 = [v15 valueFont];
    v23[0] = v17;
    v22[1] = NSForegroundColorAttributeName;
    double v18 = +[ARUIMetricColors stepColors];
    id v19 = [v18 nonGradientTextColor];
    v23[1] = v19;
    uint64_t v20 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];
    id v12 = [v16 initWithString:v14 attributes:v20];
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (id)formattedTotalEnergyForWorkout:(id)a3 workoutActivity:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    uint64_t v21 = self;
    id v10 = a5;
    id v11 = [objc_alloc((Class)HKQuantityType) initWithIdentifier:HKQuantityTypeIdentifierActiveEnergyBurned];
    id v12 = [v9 statisticsForType:v11];
    id v13 = [v12 sumQuantity];
    id v14 = [objc_alloc((Class)HKQuantityType) initWithIdentifier:HKQuantityTypeIdentifierBasalEnergyBurned];
    uint64_t v15 = [v9 statisticsForType:v14];
    id v16 = [v15 sumQuantity];
    BOOL v17 = [v13 _quantityByAddingQuantity:v16];

    self = v21;
  }
  else
  {
    id v18 = a5;
    id v11 = [v8 totalEnergyBurned];
    id v12 = [v8 _totalBasalEnergyBurned];
    BOOL v17 = [v11 _quantityByAddingQuantity:v12];
  }

  id v19 = [(CHWorkoutFormattingManager *)self formattedEnergyBurn:v17 context:a5];

  return v19;
}

- (id)weatherTemperatureForWorkout:(id)a3 workoutActivity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(CHWorkoutFormattingManager *)self shouldFakeData])
  {
    id v8 = +[HKUnit degreeFahrenheitUnit];
    uint64_t v9 = +[HKQuantity quantityWithUnit:v8 doubleValue:72.0];
  }
  else
  {
    if (v7) {
      id v10 = v7;
    }
    else {
      id v10 = v6;
    }
    id v8 = [v10 metadata];
    uint64_t v9 = [v8 objectForKeyedSubscript:HKMetadataKeyWeatherTemperature];
  }
  id v11 = (void *)v9;

  return v11;
}

- (id)waterTemperatureForWorkout:(id)a3 workoutActivity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(CHWorkoutFormattingManager *)self shouldFakeData])
  {
    id v8 = +[HKUnit degreeCelsiusUnit];
    uint64_t v9 = +[HKQuantity quantityWithUnit:v8 doubleValue:18.0];
  }
  else
  {
    if (v7) {
      id v10 = v7;
    }
    else {
      id v10 = v6;
    }
    id v8 = [v10 metadata];
    uint64_t v9 = [v8 objectForKeyedSubscript:NLPrivateMetadataKeyAverageWaterTemperature];
  }
  id v11 = (void *)v9;

  return v11;
}

- (id)weatherHumidityForWorkout:(id)a3 workoutActivity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(CHWorkoutFormattingManager *)self shouldFakeData])
  {
    id v8 = +[HKUnit percentUnit];
    uint64_t v9 = +[HKQuantity quantityWithUnit:v8 doubleValue:0.23];
  }
  else
  {
    if (v7) {
      id v10 = v7;
    }
    else {
      id v10 = v6;
    }
    id v8 = [v10 metadata];
    uint64_t v9 = [v8 objectForKeyedSubscript:HKMetadataKeyWeatherHumidity];
  }
  id v11 = (void *)v9;

  return v11;
}

- (id)airQualityIndexForWorkout:(id)a3 workoutActivity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(CHWorkoutFormattingManager *)self shouldFakeData])
  {
    id v8 = +[NSNumber numberWithInt:34];
  }
  else
  {
    if (v7) {
      uint64_t v9 = v7;
    }
    else {
      uint64_t v9 = v6;
    }
    id v10 = [v9 metadata];
    id v8 = [v10 objectForKeyedSubscript:NLPrivateMetadataKeyAirQualityIndex];
  }

  return v8;
}

- (id)timeZoneForWorkout:(id)a3
{
  id v4 = a3;
  if ([(CHWorkoutFormattingManager *)self shouldFakeData])
  {
    id v5 = +[NSTimeZone systemTimeZone];
  }
  else
  {
    id v6 = [v4 metadata];
    id v7 = [v6 objectForKeyedSubscript:HKMetadataKeyTimeZone];

    if (v7)
    {
      id v5 = +[NSTimeZone timeZoneWithName:v7];
    }
    else
    {
      id v5 = 0;
    }
  }

  return v5;
}

- (BOOL)workoutWasInDayTime:(id)a3
{
  id v4 = a3;
  id v5 = [v4 metadata];
  id v6 = [v5 objectForKeyedSubscript:_HKPrivateMetadataKeyWorkoutDaytime];

  if (v6)
  {
    unsigned __int8 v7 = [v6 BOOLValue];
  }
  else
  {
    id v8 = [(CHWorkoutFormattingManager *)self timeZoneForWorkout:v4];
    uint64_t v9 = +[NSCalendar currentCalendar];
    id v10 = v9;
    if (v8) {
      [v9 setTimeZone:v8];
    }
    id v11 = [v4 startDate];
    id v12 = (char *)[v10 component:32 fromDate:v11];

    unsigned __int8 v7 = (unint64_t)(v12 - 6) < 0xD;
  }

  return v7;
}

- (id)locationForWorkout:(id)a3 workoutActivity:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unsigned __int8 v7 = v6;
  if (v6)
  {
    id v8 = [v6 metadata];
    uint64_t v9 = [v8 objectForKeyedSubscript:_HKPrivateMetadataKeyWorkoutWeatherLocationCoordinatesLatitude];

    id v10 = v7;
  }
  else
  {
    id v11 = [v5 metadata];
    uint64_t v9 = [v11 objectForKeyedSubscript:_HKPrivateMetadataKeyWorkoutWeatherLocationCoordinatesLatitude];

    id v10 = v5;
  }
  id v12 = [v10 metadata];
  id v13 = [v12 objectForKeyedSubscript:_HKPrivateMetadataKeyWorkoutWeatherLocationCoordinatesLongitude];

  if (v9) {
    BOOL v14 = v13 == 0;
  }
  else {
    BOOL v14 = 1;
  }
  if (v14)
  {
    id v19 = 0;
  }
  else
  {
    id v15 = objc_alloc((Class)CLLocation);
    [v9 doubleValue];
    double v17 = v16;
    [v13 doubleValue];
    id v19 = [v15 initWithLatitude:v17 longitude:v18];
  }

  return v19;
}

- (id)shareImageForWorkout:(id)a3 routeImage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CHWorkoutFormattingManager *)self _shareIconForWorkout:v6 routeImage:v7];
  id v9 = objc_alloc_init((Class)NSMutableArray);
  id v10 = [(CHWorkoutFormattingManager *)self _workoutTypeInfoForWorkout:v6];
  [v9 addObject:v10];
  unsigned int v11 = [(CHWorkoutFormattingManager *)self shouldShowDistanceForWorkout:v6 workoutActivity:0];
  id v12 = [v6 _activityMoveMode];
  if ([v6 workoutActivityType] == (id)84)
  {
    id v13 = [(CHWorkoutFormattingManager *)self _underwaterTimeInfoForDive:v6];
    [v9 addObject:v13];
    uint64_t v14 = [(CHWorkoutFormattingManager *)self _maxDepthInfoForDive:v6];
LABEL_3:
    id v15 = (void *)v14;
    [v9 addObject:v14];

    goto LABEL_15;
  }
  if (v12 == (id)2) {
    char v16 = v11;
  }
  else {
    char v16 = 1;
  }
  if (v16)
  {
    if (v12 != (id)2)
    {
      id v13 = [(CHWorkoutFormattingManager *)self _activeEnergyInfoForWorkout:v6];
      [v9 addObject:v13];
      if (v11) {
        [(CHWorkoutFormattingManager *)self _distanceInfoForWorkout:v6];
      }
      else {
      uint64_t v14 = [(CHWorkoutFormattingManager *)self _durationInfoForWorkout:v6];
      }
      goto LABEL_3;
    }
    uint64_t v17 = [(CHWorkoutFormattingManager *)self _distanceInfoForWorkout:v6];
  }
  else
  {
    uint64_t v17 = [(CHWorkoutFormattingManager *)self _durationInfoForWorkout:v6];
  }
  id v13 = (void *)v17;
  [v9 addObject:v17];
LABEL_15:

  double v18 = [CHSharingImageWorkoutConfiguration alloc];
  id v19 = [v9 copy];
  uint64_t v20 = [(CHSharingImageWorkoutConfiguration *)v18 initWithIconImage:v8 routeImage:v7 metricTitleAndValueInfo:v19];

  uint64_t v21 = sub_100133A28(v20);

  return v21;
}

- (id)shareTextForWorkout:(id)a3
{
  id v4 = a3;
  id v5 = [(CHWorkoutFormattingManager *)self _shareValueForWorkout:v4];
  id v6 = [(FIUIFormattingManager *)self->_formattingManager localizedShareTextWithWorkout:v4 shareValue:v5];

  return v6;
}

- (id)_shareValueForWorkout:(id)a3
{
  id v4 = a3;
  if ([(CHWorkoutFormattingManager *)self supportsDistanceForWorkout:v4 workoutActivity:0])
  {
    [(CHWorkoutFormattingManager *)self _distanceInfoForWorkout:v4];
  }
  else
  {
    [(CHWorkoutFormattingManager *)self _durationInfoForWorkout:v4];
  id v5 = };

  id v6 = [v5 value];

  return v6;
}

- (id)_workoutTypeInfoForWorkout:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(CHSharingImageTitleAndValueInfo);
  id v5 = [v3 metadata];
  id v6 = [v5 objectForKeyedSubscript:HKMetadataKeyWorkoutBrandName];

  if (![v6 length])
  {
    id v7 = [v3 fiui_activityType];
    [v7 effectiveTypeIdentifier];
    [v7 swimmingLocationType];
    [v7 isIndoor];
    uint64_t v8 = FILocalizedNameForActivityType();

    id v6 = (void *)v8;
  }
  [(CHSharingImageTitleAndValueInfo *)v4 setTitle:v6];

  return v4;
}

- (id)_durationInfoForWorkout:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(CHSharingImageTitleAndValueInfo);
  id v6 = +[NSBundle mainBundle];
  id v7 = [v6 localizedStringForKey:@"TOTAL_TIME" value:&stru_1008D8AB8 table:@"Localizable"];
  [(CHSharingImageTitleAndValueInfo *)v5 setTitle:v7];

  formattingManager = self->_formattingManager;
  [v4 duration];
  double v10 = v9;

  unsigned int v11 = [(FIUIFormattingManager *)formattingManager stringWithDuration:3 durationFormat:v10];
  [(CHSharingImageTitleAndValueInfo *)v5 setValue:v11];

  id v12 = +[ARUIMetricColors elapsedTimeColors];
  id v13 = [v12 nonGradientTextColor];
  [(CHSharingImageTitleAndValueInfo *)v5 setValueColor:v13];

  return v5;
}

- (id)_distanceInfoForWorkout:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(CHSharingImageTitleAndValueInfo);
  id v6 = +[NSBundle mainBundle];
  id v7 = [v6 localizedStringForKey:@"WORKOUT_DISTANCE_TITLE" value:&stru_1008D8AB8 table:@"Localizable"];
  [(CHSharingImageTitleAndValueInfo *)v5 setTitle:v7];

  id v15 = 0;
  id v16 = 0;
  [(CHWorkoutFormattingManager *)self _formattedDistanceStringForWorkout:v4 distanceString:&v16 unitString:&v15];

  id v8 = v16;
  id v9 = v15;
  double v10 = [v9 uppercaseString];
  unsigned int v11 = +[NSString stringWithFormat:@"%@ %@", v8, v10];
  [(CHSharingImageTitleAndValueInfo *)v5 setValue:v11];

  [(CHSharingImageTitleAndValueInfo *)v5 setUnit:v9];
  id v12 = +[ARUIMetricColors distanceColors];
  id v13 = [v12 nonGradientTextColor];
  [(CHSharingImageTitleAndValueInfo *)v5 setValueColor:v13];

  return v5;
}

- (id)_maxDepthInfoForDive:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(CHSharingImageTitleAndValueInfo);
  id v6 = +[NSBundle mainBundle];
  id v7 = [v6 localizedStringForKey:@"UNDERWATER_DIVE_MAX_DEPTH" value:&stru_1008D8AB8 table:@"Localizable"];
  [(CHSharingImageTitleAndValueInfo *)v5 setTitle:v7];

  formattingManager = self->_formattingManager;
  CFStringRef v13 = &stru_1008D8AB8;
  id v9 = [(FIUIFormattingManager *)formattingManager localizedGoalDescriptionForWorkout:v4 withValue:&v13 appendActivityType:0];

  [(CHSharingImageTitleAndValueInfo *)v5 setValue:v9];
  double v10 = +[ARUIMetricColors diveColors];
  unsigned int v11 = [v10 nonGradientTextColor];
  [(CHSharingImageTitleAndValueInfo *)v5 setValueColor:v11];

  return v5;
}

- (id)_underwaterTimeInfoForDive:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(CHSharingImageTitleAndValueInfo);
  id v6 = +[NSBundle mainBundle];
  id v7 = [v6 localizedStringForKey:@"TOTAL_TIME" value:&stru_1008D8AB8 table:@"Localizable"];
  [(CHSharingImageTitleAndValueInfo *)v5 setTitle:v7];

  formattingManager = self->_formattingManager;
  [v4 duration];
  double v10 = v9;

  unsigned int v11 = [(FIUIFormattingManager *)formattingManager stringWithDuration:3 durationFormat:v10];
  [(CHSharingImageTitleAndValueInfo *)v5 setValue:v11];

  id v12 = +[ARUIMetricColors elapsedTimeColors];
  CFStringRef v13 = [v12 nonGradientTextColor];
  [(CHSharingImageTitleAndValueInfo *)v5 setValueColor:v13];

  return v5;
}

- (id)_activeEnergyInfoForWorkout:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(CHSharingImageTitleAndValueInfo);
  id v6 = +[NSBundle mainBundle];
  id v7 = [(FIUIFormattingManager *)self->_formattingManager localizationKeyForEnergyBaseKey:@"WORKOUT_ACTIVE_ENERGY_TITLE"];
  id v8 = [v6 localizedStringForKey:v7 value:&stru_1008D8AB8 table:@"Localizable"];
  [(CHSharingImageTitleAndValueInfo *)v5 setTitle:v8];

  formattingManager = self->_formattingManager;
  double v10 = [v4 totalEnergyBurned];

  unsigned int v11 = [(FIUIFormattingManager *)formattingManager localizedStringWithActiveEnergy:v10];

  id v12 = [(FIUIFormattingManager *)self->_formattingManager localizedShortActiveEnergyUnitString];
  CFStringRef v13 = [v12 localizedUppercaseString];

  uint64_t v14 = +[CHWorkoutDisplayContext displayContextWithName:@"WorkoutDetailDisplayContext"];
  id v15 = [v14 unitFormatString];
  id v16 = +[NSString stringWithValidatedFormat:v15, @"%@%@", 0, v11, v13 validFormatSpecifiers error];

  [(CHSharingImageTitleAndValueInfo *)v5 setValue:v16];
  [(CHSharingImageTitleAndValueInfo *)v5 setUnit:v13];
  uint64_t v17 = +[ARUIMetricColors energyColors];
  double v18 = [v17 nonGradientTextColor];
  [(CHSharingImageTitleAndValueInfo *)v5 setValueColor:v18];

  return v5;
}

- (id)_shareIconForWorkout:(id)a3 routeImage:(id)a4
{
  id v6 = a3;
  if (objc_msgSend(v6, "fiui_isConnectedGymWorkout")) {
    unsigned __int8 v7 = [(CHWorkoutFormattingManager *)self hasConnectedGymVendorIconForWorkout:v6];
  }
  else {
    unsigned __int8 v7 = 0;
  }
  id v8 = [v6 sourceRevision];
  double v9 = [v8 source];
  unsigned int v10 = [v9 _hasFirstPartyBundleID];

  unsigned int v11 = [v6 sourceRevision];
  id v12 = [v11 source];
  if ([v12 _isAppleWatch]) {
    unsigned int v13 = 1;
  }
  else {
    unsigned int v13 = [v6 _isWatchWorkout];
  }

  id v14 = [v6 workoutActivityType];
  if (v7) {
    int v15 = 0;
  }
  else {
    int v15 = v10 & v13;
  }
  id v16 = objc_alloc_init((Class)UIImageView);
  [v16 setTranslatesAutoresizingMaskIntoConstraints:0];
  if (v14 == (id)84)
  {
    uint64_t v17 = +[ARUIMetricColors diveColors];
    double v18 = [v17 nonGradientTextColor];

    id v19 = FIUICircularImage();
    [v16 setImage:v19];
  }
  else if (v15)
  {
    uint64_t v20 = +[UIColor colorWithRed:0.28627451 green:0.37254902 blue:0.145098039 alpha:1.0];
    uint64_t v21 = v20;
    if (a4)
    {
      id v22 = v20;
    }
    else
    {
      id v23 = +[ARUIMetricColors briskColors];
      id v22 = [v23 nonGradientTextColor];
    }
    uint64_t v24 = FIUICircularImage();
    [v16 setImage:v24];
  }
  else
  {
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_1000F7978;
    v40[3] = &unk_1008ABA50;
    id v41 = v16;
    [(CHWorkoutFormattingManager *)self fetchIconImageForWorkout:v6 context:@"WorkoutDetailDisplayContext" completion:v40];
  }
  id v25 = +[FIUIWorkoutActivityType activityTypeWithWorkout:v6];
  float v26 = FIUIStaticWorkoutIconImage();
  id v27 = [v26 imageWithRenderingMode:2];

  id v28 = objc_alloc_init((Class)UIImageView);
  [v28 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v28 setImage:v27];
  id v29 = [v16 image];
  [v29 size];
  CGFloat v31 = v30;
  uint64_t v32 = [v16 image];
  [v32 size];
  v43.width = v31;
  UIGraphicsBeginImageContextWithOptions(v43, 0, 0.0);

  if (v14 == (id)84)
  {
    long long v33 = +[ARUIMetricColors diveColors];
    [v33 valueDisplayColor];
  }
  else
  {
    long long v33 = +[ARUIMetricColors briskColors];
    [v33 nonGradientTextColor];
  uint64_t v34 = };
  [v34 setFill];
  if (((a4 == 0) & v15) != 0) {
    double v35 = 0.2;
  }
  else {
    double v35 = 1.0;
  }
  id v36 = [v16 image];
  [v36 drawAtPoint:0 blendMode:0.0 alpha:0.0];

  if (v15)
  {
    long long v37 = [v28 image];
    [v37 drawInRect:0 blendMode:3.0 alpha:3.0];
  }
  id v38 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v38;
}

- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4
{
  _HKInitializeLogging();
  id v5 = HKLogWorkouts;
  if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[AppProtection] appProtectionSubjectsChanged", buf, 2u);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F7A4C;
  block[3] = &unk_1008ABA78;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (CHWorkoutDataCalculator)dataCalculator
{
  return self->_dataCalculator;
}

- (BOOL)shouldFakeData
{
  return self->_shouldFakeData;
}

- (void)setShouldFakeData:(BOOL)a3
{
  self->_shouldFakeData = a3;
}

- (FIUIFormattingManager)formattingManager
{
  return self->_formattingManager;
}

- (void)setFormattingManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formattingManager, 0);
  objc_storeStrong((id *)&self->_dataCalculator, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_hiddenApplicationBundleIds, 0);

  objc_storeStrong((id *)&self->_renderer, 0);
}

- (BOOL)hasWeatherConditionForWorkout:(id)a3 workoutActivity:(id)a4
{
  uint64_t v7 = sub_1000AFA94(&qword_10095B468);
  __chkstk_darwin(v7 - 8);
  double v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = a3;
  id v11 = a4;
  id v12 = self;
  sub_1003ED80C(v10, a4, (uint64_t)v9);
  uint64_t v13 = type metadata accessor for WeatherCondition();
  LOBYTE(a4) = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48))(v9, 1, v13) != 1;
  sub_10008DB18((uint64_t)v9, &qword_10095B468);

  return (char)a4;
}

@end