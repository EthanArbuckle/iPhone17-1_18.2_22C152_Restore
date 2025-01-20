@interface MOEventPatternDetectorTimeOfDayRoutineDetector
- (BOOL)_routineStartCheck:(id)a3;
- (BOOL)configure:(id)a3;
- (MOEventPatternDetectorTimeOfDayRoutineDetector)init;
- (id)_dailyRoutineCheck:(id)a3;
- (id)_detectDailyRoutine:(id)a3;
- (id)_findHabitualTime:(id)a3;
- (id)_findTopNRoutines:(id)a3 withN:(int64_t)a4;
- (id)extractRoutineEventsFrom:(id)a3 withFeatures:(id)a4;
@end

@implementation MOEventPatternDetectorTimeOfDayRoutineDetector

- (MOEventPatternDetectorTimeOfDayRoutineDetector)init
{
  v11.receiver = self;
  v11.super_class = (Class)MOEventPatternDetectorTimeOfDayRoutineDetector;
  v2 = [(MOEventPatternDetectorTimeOfDayRoutineDetector *)&v11 init];
  v3 = v2;
  if (v2)
  {
    *(void *)&v2->_routineConsistencyThreshold = -1;
    __asm { FMOV            V0.2D, #-1.0 }
    *(_OWORD *)&v2->_routineStdThreshold = _Q0;
    *(_OWORD *)&v2->_routineEnvelope = _Q0;
    v2->_routineDetectionSlidingWinStepSize = -1.0;
    v2->_maxNumDailyDetections = -1;
    *(_OWORD *)&v2->_lastWindowEnd = _Q0;
    v9 = v2;
  }

  return v3;
}

- (id)extractRoutineEventsFrom:(id)a3 withFeatures:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_routineConsistencyThreshold == -1
    || self->_intraWeekFreqThreshold == -1
    || self->_routineDetectionSlidingWinSize == -1.0
    || self->_lastWindowEnd == -1.0
    || self->_lastWindowStartThreshold == -1.0
    || self->_maxNumDailyDetections == -1)
  {
    v8 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[MOEventPatternDetectorTimeOfDayRoutineDetector extractRoutineEventsFrom:withFeatures:](v8);
    }

    id v82 = 0;
  }
  else
  {
    id v82 = (id)objc_opt_new();
    if ([v7 count])
    {
      uint64_t v10 = 0;
      objc_super v11 = NSAssertionHandler_ptr;
      v91 = self;
      v75 = v7;
      id v76 = v6;
      while (1)
      {
        v12 = [v7 objectAtIndex:v10];
        id v13 = [v12 mutableCopy];

        uint64_t v77 = v10;
        v80 = [v6 objectAtIndex:v10];
        v79 = [v80 firstObject];
        v81 = v13;
        v14 = [(MOEventPatternDetectorTimeOfDayRoutineDetector *)self _detectDailyRoutine:v13];
        if ([v14 count]) {
          break;
        }
LABEL_47:

        uint64_t v10 = v77 + 1;
        id v7 = v75;
        id v6 = v76;
        if ((unint64_t)[v75 count] <= v77 + 1) {
          goto LABEL_9;
        }
      }
      uint64_t v15 = 0;
      v78 = v14;
      while (1)
      {
        uint64_t v90 = v15;
        v16 = [v14 objectAtIndex:v15];
        v17 = [v16 valueForKey:@"habitualTime"];
        v89 = v16;
        v93 = [v16 valueForKey:@"numHits"];
        v94 = v17;
        [v17 floatValue];
        float v19 = self->_routineEnvelope + v18;
        [v17 floatValue];
        float v21 = v20 - self->_routineEnvelope;
        v22 = +[NSPredicate predicateWithFormat:@"(hrFromMidnight >= %f) AND (hrFromMidnight < %f)", v21, v19];
        v23 = [v81 filteredArrayUsingPredicate:v22];

        v95 = [v23 valueForKey:@"eventIdentifier"];
        v24 = [v23 valueForKey:@"weekOfYear"];
        v25 = +[NSString stringWithFormat:@"@distinctUnionOfObjects.%@", @"self"];
        v87 = v24;
        v92 = [v24 valueForKeyPath:v25];

        v26 = [MOEvent alloc];
        v27 = [v11[49] UUID];
        v28 = [v23 lastObject];
        v29 = [v28 valueForKey:@"startDate"];
        v30 = [v23 lastObject];
        v31 = [v30 valueForKey:@"endDate"];
        v32 = +[NSDate date];
        v33 = -[MOEvent initWithEventIdentifier:startDate:endDate:creationDate:provider:category:](v26, "initWithEventIdentifier:startDate:endDate:creationDate:provider:category:", v27, v29, v31, v32, 5, [v79 category]);

        v34 = +[NSDate dateWithTimeIntervalSinceNow:2419200.0];
        v86 = v33;
        [(MOEvent *)v33 setExpirationDate:v34];

        v35 = objc_opt_new();
        [v35 setObject:&off_1002F4A90 forKeyedSubscript:@"kEventPatternType"];
        v36 = +[NSNumber numberWithUnsignedInteger:v91->_routineFeatureType];
        [v35 setObject:v36 forKeyedSubscript:@"kEventPatternRoutineFeatureType"];

        [v35 setObject:v95 forKeyedSubscript:@"kEventPatternRoutineEventIdentifierList"];
        [v35 setObject:v94 forKeyedSubscript:@"kEventPatternRoutineTimeOfDay"];
        [v35 setObject:v93 forKeyedSubscript:@"kEventPatternRoutineNumHits"];
        [v35 setObject:0 forKeyedSubscript:@"kEventPatternRoutineDayOfWeek"];
        [v35 setObject:v92 forKeyedSubscript:@"kEventPatternRoutineDetectedWeeks"];
        v37 = +[NSNumber numberWithBool:[(MOEventPatternDetectorTimeOfDayRoutineDetector *)v91 _routineStartCheck:v92]];
        [v35 setObject:v37 forKeyedSubscript:@"kEventPatternRoutineStartingRoutine"];

        v38 = [v23 valueForKey:@"workoutType"];
        v39 = +[NSSet setWithArray:v38];

        v88 = v23;
        v84 = v39;
        if ([v39 count] == (id)1)
        {
          v40 = [v23 lastObject];
          v41 = [v40 valueForKey:@"workoutType"];
          [v35 setObject:v41 forKeyedSubscript:@"kEventPatternOverallWorkoutType"];
        }
        else
        {
          [v35 setObject:@"multipleWorkoutType" forKeyedSubscript:@"kEventPatternOverallWorkoutType"];
        }
        v42 = objc_opt_new();
        long long v101 = 0u;
        long long v102 = 0u;
        long long v103 = 0u;
        long long v104 = 0u;
        id v43 = v95;
        id v44 = [v43 countByEnumeratingWithState:&v101 objects:v108 count:16];
        if (v44)
        {
          id v45 = v44;
          uint64_t v46 = *(void *)v102;
          do
          {
            for (i = 0; i != v45; i = (char *)i + 1)
            {
              if (*(void *)v102 != v46) {
                objc_enumerationMutation(v43);
              }
              uint64_t v48 = *(void *)(*((void *)&v101 + 1) + 8 * i);
              id v49 = +[NSUUID UUID];
              [v42 addObject:v49];
            }
            id v45 = [v43 countByEnumeratingWithState:&v101 objects:v108 count:16];
          }
          while (v45);
        }
        v85 = v35;
        v83 = v43;

        v50 = +[NSPredicate predicateWithFormat:@"eventIdentifier IN %@", v42];
        v51 = [v80 filteredArrayUsingPredicate:v50];

        v96 = objc_opt_new();
        long long v97 = 0u;
        long long v98 = 0u;
        long long v99 = 0u;
        long long v100 = 0u;
        id v52 = v51;
        id v53 = [v52 countByEnumeratingWithState:&v97 objects:v107 count:16];
        if (v53) {
          break;
        }
LABEL_42:

        v14 = v78;
        if ([v96 count])
        {
          v73 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
          if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
          {
            id v74 = [v96 count];
            *(_DWORD *)buf = 134217984;
            id v106 = v74;
            _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_INFO, "Routine identified %lu workouts", buf, 0xCu);
          }

          [v85 setObject:v96 forKeyedSubscript:@"kEventResourcePatternWorkoutInfoDictArray"];
        }
        [(MOEvent *)v86 setPatterns:v85];
        [v82 addObject:v86];

        uint64_t v15 = v90 + 1;
        self = v91;
        objc_super v11 = NSAssertionHandler_ptr;
        if ((unint64_t)[v78 count] <= v90 + 1) {
          goto LABEL_47;
        }
      }
      id v54 = v53;
      uint64_t v55 = *(void *)v98;
LABEL_29:
      uint64_t v56 = 0;
      while (1)
      {
        if (*(void *)v98 != v55) {
          objc_enumerationMutation(v52);
        }
        v57 = *(void **)(*((void *)&v97 + 1) + 8 * v56);
        if ([v57 category] != (id)2) {
          goto LABEL_40;
        }
        uint64_t v58 = [v57 startDate];
        if (!v58) {
          goto LABEL_40;
        }
        v59 = (void *)v58;
        uint64_t v60 = [v57 endDate];
        if (!v60) {
          goto LABEL_39;
        }
        v61 = (void *)v60;
        uint64_t v62 = [v57 workoutType];
        if (!v62) {
          break;
        }
        v63 = (void *)v62;
        v64 = [v57 identifierFromProvider];

        if (v64)
        {
          v59 = objc_opt_new();
          v65 = [v57 identifierFromProvider];
          [v59 setObject:v65 forKey:@"kEventResourcePatternWorkoutIdentifierFromProvider"];

          v66 = [v57 startDate];
          [v66 timeIntervalSince1970];
          v67 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          [v59 setObject:v67 forKey:@"kEventResourcePatternWorkoutStartDate"];

          v68 = [v57 endDate];
          [v68 timeIntervalSince1970];
          v69 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          [v59 setObject:v69 forKey:@"kEventResourcePatternWorkoutEndDate"];

          v70 = [v57 workoutEvent];
          v71 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v70 isIndoors]);
          [v59 setObject:v71 forKey:@"kEventResourcePatternWorkoutIsIndoors"];

          v72 = [v57 workoutType];
          [v59 setObject:v72 forKey:@"kEventResourcePatternWorkoutType"];

          [v96 addObject:v59];
LABEL_39:
        }
LABEL_40:
        if (v54 == (id)++v56)
        {
          id v54 = [v52 countByEnumeratingWithState:&v97 objects:v107 count:16];
          if (!v54) {
            goto LABEL_42;
          }
          goto LABEL_29;
        }
      }

      goto LABEL_39;
    }
  }
LABEL_9:

  return v82;
}

- (BOOL)_routineStartCheck:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSCalendar) initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
  v5 = +[NSDate date];
  *(float *)&double v6 = (float)(uint64_t)[v4 component:0x2000 fromDate:v5];
  id v7 = +[NSNumber numberWithFloat:v6];

  v8 = objc_opt_new();
  [v8 addObject:v7];
  v9 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v7 intValue] - 1);
  [v8 addObject:v9];

  uint64_t v10 = +[NSSet setWithArray:v8];
  objc_super v11 = +[NSSet setWithArray:v3];

  LOBYTE(v3) = [v10 isEqualToSet:v11];
  return (char)v3;
}

- (id)_findHabitualTime:(id)a3
{
  id v4 = a3;
  v5 = [v4 valueForKey:@"hrFromMidnight"];
  double v6 = +[NSExpression expressionForConstantValue:v5];
  v31 = v6;
  id v7 = +[NSArray arrayWithObjects:&v31 count:1];
  v8 = +[NSExpression expressionForFunction:@"average:" arguments:v7];

  v9 = [v8 expressionValueWithObject:0 context:0];
  uint64_t v10 = +[NSExpression expressionForConstantValue:v5];
  v30 = v10;
  objc_super v11 = +[NSArray arrayWithObjects:&v30 count:1];
  v12 = +[NSExpression expressionForFunction:@"stddev:" arguments:v11];

  id v13 = [v12 expressionValueWithObject:0 context:0];
  [v13 floatValue];
  if (self->_routineStdThreshold >= v14)
  {
    id v24 = v9;
  }
  else
  {
    [v13 floatValue];
    v27 = +[NSNumber numberWithDouble:self->_routineStdFilterMultiplier * v15];
    v16 = +[NSPredicate predicateWithFormat:@"(abs(hrFromMidnight-%@) < %@)", v9, v27];
    v26 = [v4 filteredArrayUsingPredicate:v16];

    [v26 valueForKey:@"hrFromMidnight"];
    v17 = id v28 = v4;
    float v18 = +[NSExpression expressionForConstantValue:v17];
    v29 = v18;
    +[NSArray arrayWithObjects:&v29 count:1];
    float v19 = v5;
    float v20 = v9;
    v22 = float v21 = v8;
    v23 = +[NSExpression expressionForFunction:@"average:" arguments:v22];

    v8 = v21;
    v9 = v20;
    v5 = v19;

    id v24 = [v23 expressionValueWithObject:0 context:0];

    id v4 = v28;
  }

  return v24;
}

- (id)_dailyRoutineCheck:(id)a3
{
  id v4 = a3;
  v5 = [v4 valueForKey:@"weekOfYear"];
  double v6 = +[NSString stringWithFormat:@"@distinctUnionOfObjects.%@", @"self"];
  float v20 = v5;
  id v7 = [v5 valueForKeyPath:v6];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = v7;
  id v8 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = 0;
    uint64_t v11 = *(void *)v23;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = +[NSPredicate predicateWithFormat:@"(weekOfYear == %@)", *(void *)(*((void *)&v22 + 1) + 8 * i)];
        float v14 = [v4 filteredArrayUsingPredicate:v13];

        float v15 = [v14 valueForKey:@"weekday"];
        v16 = +[NSString stringWithFormat:@"@distinctUnionOfObjects.%@", @"self"];
        v17 = [v15 valueForKeyPath:v16];

        if ((unint64_t)[v17 count] >= self->_intraWeekFreqThreshold)
        {
          uint64_t v18 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v10 intValue] + 1);

          uint64_t v10 = (void *)v18;
        }
      }
      id v9 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v9);
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)_detectDailyRoutine:(id)a3
{
  id v51 = a3;
  id v4 = NSAssertionHandler_ptr;
  v5 = +[NSNumber numberWithDouble:self->_routineDetectionSlidingWinSize];
  v50 = +[NSMutableArray array];
  [v5 floatValue];
  if (self->_lastWindowEnd > v6)
  {
    do
    {
      id v7 = v4[32];
      [v5 floatValue];
      id v9 = [v7 numberWithDouble:v8 - self->_routineDetectionSlidingWinSize];
      [v9 floatValue];
      double v11 = v10;
      double lastWindowStartThreshold = self->_lastWindowStartThreshold;
      if (lastWindowStartThreshold <= v10)
      {
        id v13 = +[NSPredicate predicateWithFormat:@"habitualTime < %f", *(void *)&self->_routineEnvelope];
        float v14 = [v50 filteredArrayUsingPredicate:v13];

        if ([v14 count])
        {
          float v15 = [v14 objectAtIndex:0];
          v16 = [v15 objectForKeyedSubscript:@"habitualTime"];
          [v16 floatValue];
          uint64_t v18 = +[NSNumber numberWithDouble:v17 - self->_routineEnvelope + 24.0];

          v5 = v15;
          id v4 = NSAssertionHandler_ptr;
        }
        else
        {
          uint64_t v18 = [v4[32] numberWithDouble:self->_lastWindowEnd];
        }

        v5 = (void *)v18;
      }
      float v19 = +[NSPredicate predicateWithFormat:@"(hrFromMidnight >= %@) AND (hrFromMidnight < %@)", v9, v5];
      float v20 = [v51 filteredArrayUsingPredicate:v19];

      if ([v20 count])
      {
        float v21 = [(MOEventPatternDetectorTimeOfDayRoutineDetector *)self _findHabitualTime:v20];
        [v21 floatValue];
        double v23 = v22;
        [v5 floatValue];
        if (v24 - self->_routineDetectionSlidingWinStepSize < v23 && lastWindowStartThreshold > v11)
        {
          v37 = v4[32];
          [v21 floatValue];
          uint64_t v34 = [v37 numberWithDouble:self->_routineDetectionSlidingWinSize * 0.5 + v38];
          v31 = v5;
        }
        else
        {
          [v21 floatValue];
          float v27 = self->_routineEnvelope + v26;
          [v21 floatValue];
          float v29 = v28 - self->_routineEnvelope;
          v30 = +[NSPredicate predicateWithFormat:@"(hrFromMidnight >= %f) AND (hrFromMidnight < %f)", v29, v27];
          v31 = [v51 filteredArrayUsingPredicate:v30];

          v32 = [(MOEventPatternDetectorTimeOfDayRoutineDetector *)self _dailyRoutineCheck:v31];
          if ((int)[v32 intValue] >= self->_routineConsistencyThreshold)
          {
            id v49 = [v31 valueForKey:@"weekday"];
            v39 = +[NSString stringWithFormat:@"@distinctUnionOfObjects.%@", @"self"];
            v40 = [v49 valueForKeyPath:v39];

            [v21 floatValue];
            uint64_t v34 = +[NSNumber numberWithDouble:self->_routineDetectionSlidingWinSize + v41 + self->_routineEnvelope * 2.0];

            v52[0] = @"habitualTime";
            v52[1] = @"numHits";
            v53[0] = v21;
            v42 = v40;
            id v43 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v40 count]);
            v53[1] = v43;
            id v44 = +[NSDictionary dictionaryWithObjects:v53 forKeys:v52 count:2];
            [v50 addObject:v44];

            v5 = v49;
          }
          else
          {
            [v5 floatValue];
            uint64_t v34 = +[NSNumber numberWithDouble:self->_routineDetectionSlidingWinStepSize + v33];
          }

          id v4 = NSAssertionHandler_ptr;
        }

        v5 = (void *)v34;
      }
      else
      {
        v35 = v4[32];
        [v5 floatValue];
        [v35 numberWithDouble:self->_routineDetectionSlidingWinStepSize + v36];
        v5 = float v21 = v5;
      }

      [v5 floatValue];
    }
    while (self->_lastWindowEnd > v45 && lastWindowStartThreshold > v11);
  }
  v47 = [(MOEventPatternDetectorTimeOfDayRoutineDetector *)self _findTopNRoutines:v50 withN:self->_maxNumDailyDetections];

  return v47;
}

- (id)_findTopNRoutines:(id)a3 withN:(int64_t)a4
{
  id v5 = a3;
  float v6 = +[NSSortDescriptor sortDescriptorWithKey:@"numHits" ascending:0];
  float v27 = v6;
  id v7 = +[NSArray arrayWithObjects:&v27 count:1];
  [v5 sortUsingDescriptors:v7];

  float v8 = [v5 valueForKey:@"numHits"];
  float v24 = v5;
  id v9 = [v5 valueForKey:@"habitualTime"];
  id v10 = [v8 count];
  if ((unint64_t)v10 >= a4) {
    int64_t v11 = a4;
  }
  else {
    int64_t v11 = (int64_t)v10;
  }
  double v23 = v8;
  v12 = [v8 subarrayWithRange:0, v11];
  id v13 = [v9 count];
  if ((unint64_t)v13 >= a4) {
    int64_t v14 = a4;
  }
  else {
    int64_t v14 = (int64_t)v13;
  }
  float v22 = v9;
  float v15 = [v9 subarrayWithRange:0, v14];
  v16 = +[NSMutableArray array];
  if ([v15 count])
  {
    unint64_t v17 = 0;
    do
    {
      v25[0] = @"habitualTime";
      uint64_t v18 = [v15 objectAtIndexedSubscript:v17];
      v25[1] = @"numHits";
      v26[0] = v18;
      float v19 = [v12 objectAtIndexedSubscript:v17];
      v26[1] = v19;
      float v20 = +[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:2];
      [v16 addObject:v20];

      ++v17;
    }
    while (v17 < (unint64_t)[v15 count]);
  }

  return v16;
}

- (BOOL)configure:(id)a3
{
  id v4 = a3;
  id v5 = [v4 count];
  if (v5)
  {
    float v6 = [v4 objectForKey:@"RoutineConsistencyThreshold"];

    if (v6)
    {
      id v7 = [v4 objectForKeyedSubscript:@"RoutineConsistencyThreshold"];
      self->_routineConsistencyThreshold = [v7 intValue];
    }
    else
    {
      float v8 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[MOEventPatternDetectorTimeOfDayRoutineDetector configure:]();
      }
    }
    id v9 = [v4 objectForKey:@"IntraWeekFreqThreshold"];

    if (v9)
    {
      id v10 = [v4 objectForKeyedSubscript:@"IntraWeekFreqThreshold"];
      self->_intraWeekFreqThreshold = [v10 intValue];
    }
    else
    {
      id v10 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[MOEventPatternDetectorTimeOfDayRoutineDetector configure:]();
      }
    }

    int64_t v11 = [v4 objectForKey:@"RoutineStdThreshold"];

    if (v11)
    {
      v12 = [v4 objectForKeyedSubscript:@"RoutineStdThreshold"];
      [v12 doubleValue];
      self->_routineStdThreshold = v13;
    }
    else
    {
      v12 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[MOEventPatternDetectorTimeOfDayRoutineDetector configure:]();
      }
    }

    int64_t v14 = [v4 objectForKey:@"RoutineStdFilterMultiplier"];

    if (v14)
    {
      float v15 = [v4 objectForKeyedSubscript:@"RoutineStdFilterMultiplier"];
      [v15 doubleValue];
      self->_routineStdFilterMultiplier = v16;
    }
    else
    {
      float v15 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[MOEventPatternDetectorTimeOfDayRoutineDetector configure:]();
      }
    }

    unint64_t v17 = [v4 objectForKey:@"RoutineEnvelope"];

    if (v17)
    {
      uint64_t v18 = [v4 objectForKeyedSubscript:@"RoutineEnvelope"];
      [v18 doubleValue];
      self->_routineEnvelope = v19;
    }
    else
    {
      uint64_t v18 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[MOEventPatternDetectorTimeOfDayRoutineDetector configure:]();
      }
    }

    float v20 = [v4 objectForKey:@"RoutineDetectionSlidingWinSize"];

    if (v20)
    {
      float v21 = [v4 objectForKeyedSubscript:@"RoutineDetectionSlidingWinSize"];
      [v21 doubleValue];
      self->_routineDetectionSlidingWinSize = v22;
    }
    else
    {
      float v21 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[MOEventPatternDetectorTimeOfDayRoutineDetector configure:]();
      }
    }

    double v23 = [v4 objectForKey:@"RoutineDetectionSlidingWinStepSize"];

    if (v23)
    {
      float v24 = [v4 objectForKeyedSubscript:@"RoutineDetectionSlidingWinStepSize"];
      [v24 doubleValue];
      self->_routineDetectionSlidingWinStepSize = v25;
    }
    else
    {
      float v24 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        -[MOEventPatternDetectorTimeOfDayRoutineDetector configure:]();
      }
    }

    float v26 = [v4 objectForKey:@"MaxNumDailyDetections"];

    if (v26)
    {
      float v27 = [v4 objectForKeyedSubscript:@"MaxNumDailyDetections"];
      self->_maxNumDailyDetections = [v27 intValue];
    }
    else
    {
      float v27 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        -[MOEventPatternDetectorTimeOfDayRoutineDetector configure:]();
      }
    }

    float v28 = [v4 objectForKey:@"LastWindowEnd"];

    if (v28)
    {
      float v29 = [v4 objectForKeyedSubscript:@"LastWindowEnd"];
      [v29 doubleValue];
      self->_lastWindowEnd = v30;
    }
    else
    {
      float v29 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        -[MOEventPatternDetectorTimeOfDayRoutineDetector configure:]();
      }
    }

    v31 = [v4 objectForKey:@"LastWindowStartThreshold"];

    if (v31)
    {
      v32 = [v4 objectForKeyedSubscript:@"LastWindowStartThreshold"];
      [v32 doubleValue];
      self->_double lastWindowStartThreshold = v33;
    }
    else
    {
      v32 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        -[MOEventPatternDetectorTimeOfDayRoutineDetector configure:]();
      }
    }

    uint64_t v34 = [v4 objectForKey:@"RoutineFeatureType"];

    if (v34)
    {
      v35 = [v4 objectForKeyedSubscript:@"RoutineFeatureType"];
      self->_routineFeatureType = (int)[v35 intValue];
    }
    else
    {
      v35 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        -[MOEventPatternDetectorTimeOfDayRoutineDetector configure:]();
      }
    }
  }
  return v5 != 0;
}

- (void)extractRoutineEventsFrom:(os_log_t)log withFeatures:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Routine configuration not set", v1, 2u);
}

- (void)configure:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Configuration property not set for routine detection: %@", v2, v3, v4, v5, v6);
}

@end