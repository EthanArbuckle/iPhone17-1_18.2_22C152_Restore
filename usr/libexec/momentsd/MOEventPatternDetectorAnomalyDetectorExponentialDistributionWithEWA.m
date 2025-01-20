@interface MOEventPatternDetectorAnomalyDetectorExponentialDistributionWithEWA
- (BOOL)configure:(id)a3;
- (MOEventPatternDetectorAnomalyDetectorExponentialDistributionWithEWA)init;
- (NSDictionary)EWADict;
- (id)_createAnomalyEventFromEvent:(id)a3 andFeature:(id)a4 andThreshold:(double)a5;
- (id)extractAnomalyEventsFrom:(id)a3 withFeatures:(id)a4;
- (id)getAnomalyDetectorDict;
- (void)_updateFeatureGroupEWADict:(id)a3 withCurrentFeature:(id)a4 andCurrentEvent:(id)a5 andCurrentEventTimeStamp:(double)a6;
- (void)setEWADict:(id)a3;
@end

@implementation MOEventPatternDetectorAnomalyDetectorExponentialDistributionWithEWA

- (MOEventPatternDetectorAnomalyDetectorExponentialDistributionWithEWA)init
{
  v13.receiver = self;
  v13.super_class = (Class)MOEventPatternDetectorAnomalyDetectorExponentialDistributionWithEWA;
  v2 = [(MOEventPatternDetectorAnomalyDetectorExponentialDistributionWithEWA *)&v13 init];
  v3 = (MOEventPatternDetectorAnomalyDetectorExponentialDistributionWithEWA *)v2;
  if (v2)
  {
    __asm { FMOV            V0.2D, #-1.0 }
    *(_OWORD *)(v2 + 8) = _Q0;
    *((_DWORD *)v2 + 6) = -1;
    *((_OWORD *)v2 + 2) = _Q0;
    *((void *)v2 + 6) = 0xBFF0000000000000;
    uint64_t v9 = +[NSCalendar currentCalendar];
    cal = v3->_cal;
    v3->_cal = (NSCalendar *)v9;

    v11 = v3;
  }

  return v3;
}

- (id)extractAnomalyEventsFrom:(id)a3 withFeatures:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [objc_alloc((Class)NSCalendar) initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
  if (self->_tukeyFactorForExponentialDistributionOutlier == -1.0
    || self->_minimumFeatureSizeForPersonalizedThreshold == -1.0
    || self->_minimumFeatureNumberForPersonalizedThreshold == -1
    || self->_maximumThreshold == -1.0
    || self->_minimumThreshold == -1.0
    || self->_betaForEWAUpdate == -1.0)
  {
    uint64_t v9 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[MOEventPatternDetectorAnomalyDetectorExponentialDistributionWithEWA extractAnomalyEventsFrom:withFeatures:](v9);
    }
    id v10 = 0;
    goto LABEL_6;
  }
  uint64_t v9 = +[NSDate date];
  id v12 = [objc_alloc((Class)NSCalendar) initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
  objc_super v13 = [v12 components:28 fromDate:v9];
  [v13 setHour:3];
  v99 = v13;
  v100 = v12;
  v109 = [v12 dateFromComponents:v13];
  v107 = objc_opt_new();
  if (![v6 count])
  {
LABEL_80:
    id v96 = [(NSMutableDictionary *)self->_anomalyEWADictionariesForDetector copy];
    [(MOEventPatternDetectorAnomalyDetectorExponentialDistributionWithEWA *)self setEWADict:v96];

    v48 = v107;
    id v10 = v107;
    goto LABEL_84;
  }
  uint64_t v14 = 0;
  v98 = v112;
  id v101 = v7;
  v102 = v8;
  while (1)
  {
    v15 = [v6 objectAtIndex:v14];
    uint64_t v106 = v14;
    v108 = [v7 objectAtIndex:v14];
    v16 = [v15 firstObject];
    id v17 = [v16 category];

    v110 = v15;
    v18 = [v15 firstObject];
    v19 = v18;
    if (v17 == (id)2)
    {
      v20 = [v18 workoutType];
      int v21 = 1;
      CFStringRef v22 = @"MOEventCategoryWorkout";
    }
    else
    {
      id v23 = [v18 category];

      if (v23 == (id)16)
      {
        v19 = [v15 firstObject];
        v20 = +[MOEventMotionActivity descriptionOfMotionType:](MOEventMotionActivity, "descriptionOfMotionType:", [v19 motionType]);
        int v21 = 1;
        CFStringRef v22 = @"MOEventCategoryMotionActivity";
      }
      else
      {
        v24 = [v15 firstObject];
        id v25 = [v24 category];

        v26 = [v15 firstObject];
        v19 = v26;
        if (v25 == (id)10)
        {
          v27 = [v26 interactionScoredContact];
          v28 = [v27 contact];
          uint64_t v29 = [v28 identifier];

          v20 = (void *)v29;
          int v21 = 1;
          CFStringRef v22 = @"MOEventCategorySignificantContact";
        }
        else
        {
          if ([v26 category] == (id)1 && self->_anomalyFeatureType == 4)
          {
            v30 = [v15 firstObject];
            v31 = [v30 pCount];
            unsigned int v32 = [v31 intValue];

            if ((v32 & 0x80000000) == 0)
            {
              v33 = [v15 firstObject];
              v34 = [v33 startDate];
              id v8 = v102;
              v19 = [v102 components:512 fromDate:v34];

              v35 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v19 weekday]);
              v20 = [v35 stringValue];

              int v21 = 1;
              CFStringRef v22 = @"MOEventCategoryProx";
              goto LABEL_35;
            }
          }
          else
          {
          }
          v36 = [v15 firstObject];
          if ([v36 category] == (id)1 && self->_anomalyFeatureType == 4)
          {
            v37 = [v15 firstObject];
            v38 = [v37 densityScore];
            [v38 doubleValue];
            double v40 = v39;

            id v8 = v102;
            if (v40 >= 0.0)
            {
              v41 = [v15 firstObject];
              v42 = [v41 startDate];
              v19 = [v102 components:512 fromDate:v42];

              v43 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v19 weekday]);
              v20 = [v43 stringValue];

              int v21 = 1;
              CFStringRef v22 = @"MOEventCategoryPeopleDensityEvent";
              goto LABEL_35;
            }
          }
          else
          {

            id v8 = v102;
          }
          v19 = [v15 firstObject];
          if ([v19 category] == (id)1)
          {
            unint64_t anomalyFeatureType = self->_anomalyFeatureType;

            if (anomalyFeatureType != 5)
            {
              v20 = 0;
              int v21 = 0;
              CFStringRef v22 = 0;
              v48 = v107;
              goto LABEL_36;
            }
            v45 = [v15 firstObject];
            v46 = [v45 startDate];
            v19 = [v8 components:512 fromDate:v46];

            v47 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v19 weekday]);
            v20 = [v47 stringValue];

            int v21 = 1;
            CFStringRef v22 = @"MOEventTimeAtHomeAnomaly";
          }
          else
          {
            v20 = 0;
            int v21 = 0;
            CFStringRef v22 = 0;
          }
        }
      }
    }
LABEL_35:
    v48 = v107;

LABEL_36:
    unint64_t v49 = self->_anomalyFeatureType;
    if (v49 > 5) {
      break;
    }
    int v50 = v20 ? v21 : 0;
    if (((0x37u >> v49) & 1) == 0 || !v50) {
      break;
    }
    uint64_t v51 = +[NSString stringWithFormat:@"%@_%@_%@", v22, v20, off_1002CA520[v49], v98];
    v52 = objc_opt_new();
    v53 = [(NSMutableDictionary *)self->_anomalyEWADictionariesForDetector objectForKey:v51];
    v104 = (void *)v51;
    v105 = v20;
    v103 = v53;
    if (v53)
    {
      id v54 = [v53 mutableCopy];

      v52 = v54;
    }
    else
    {
      [v52 setObject:&off_1002F48B0 forKeyedSubscript:@"EWAForAnomalyValue"];
      [v52 setObject:&off_1002F48C8 forKeyedSubscript:@"EWAForAnomalyFeatureCountUntilMinimum"];
      [v52 setObject:&__kCFBooleanFalse forKeyedSubscript:@"EWAForAnomalyFeatureCountMeetsMinimum"];
      [v52 setObject:&off_1002F48C8 forKeyedSubscript:@"EWAForAnomalyLastUpdateTime"];
    }
    v55 = v108;
    if ([v108 count])
    {
      uint64_t v56 = 0;
      while (1)
      {
        v57 = [v110 objectAtIndex:v56];
        if ([v57 category] != (id)10 && objc_msgSend(v57, "category") != (id)1) {
          break;
        }
        v58 = [v57 endDate];
        unsigned int v59 = [v58 isOnOrBefore:v109];

        if (v59) {
          break;
        }
LABEL_70:

        if ((unint64_t)[v55 count] <= ++v56) {
          goto LABEL_75;
        }
      }
      v60 = [v55 objectAtIndex:v56];
      v61 = [v57 startDate];
      [v61 timeIntervalSinceReferenceDate];
      double v63 = v62;

      double maximumThreshold = self->_maximumThreshold;
      if (!self->_anomalyFeatureType)
      {
        [v60 doubleValue];
        if (v65 == -1.0)
        {
          v66 = [v52 objectForKeyedSubscript:@"EWAForAnomalyLastUpdateTime"];
          [v66 doubleValue];
          if (v67 != 0.0)
          {
            v68 = [v52 objectForKeyedSubscript:@"EWAForAnomalyLastUpdateTime"];
            [v68 doubleValue];
            double v70 = v69;

            if (v63 <= v70)
            {
              v55 = v108;
              goto LABEL_57;
            }
            v66 = [v52 objectForKeyedSubscript:@"EWAForAnomalyLastUpdateTime"];
            [v66 doubleValue];
            uint64_t v72 = +[NSNumber numberWithDouble:v63 - v71];

            v60 = (void *)v72;
            v55 = v108;
          }
        }
      }
LABEL_57:
      v73 = [v52 objectForKeyedSubscript:@"EWAForAnomalyLastUpdateTime"];
      [v73 doubleValue];
      double v75 = v74;

      if (v63 > v75)
      {
        v76 = [v52 objectForKeyedSubscript:@"EWAForAnomalyValue"];
        [v76 doubleValue];
        if (v77 <= -1.0)
        {
        }
        else
        {
          v78 = [v52 objectForKeyedSubscript:@"EWAForAnomalyFeatureCountMeetsMinimum"];
          unsigned int v79 = [v78 BOOLValue];

          if (v79)
          {
            double tukeyFactorForExponentialDistributionOutlier = self->_tukeyFactorForExponentialDistributionOutlier;
            v81 = [v52 objectForKeyedSubscript:@"EWAForAnomalyValue"];
            [v81 doubleValue];
            double v83 = tukeyFactorForExponentialDistributionOutlier * v82;

            double v84 = self->_maximumThreshold;
            if (v84 >= v83) {
              double v84 = v83;
            }
            if (self->_minimumThreshold >= v84) {
              double maximumThreshold = self->_minimumThreshold;
            }
            else {
              double maximumThreshold = v84;
            }
          }
        }
        [v60 doubleValue];
        v55 = v108;
        if (v85 > maximumThreshold)
        {
          v86 = [(MOEventPatternDetectorAnomalyDetectorExponentialDistributionWithEWA *)self _createAnomalyEventFromEvent:v57 andFeature:v60 andThreshold:maximumThreshold];
          [v107 addObject:v86];
        }
      }
      if (!self->_anomalyFeatureType)
      {
        [v60 doubleValue];
        if (v87 == -1.0)
        {
          v88 = [v52 objectForKeyedSubscript:@"EWAForAnomalyLastUpdateTime"];
          [v88 doubleValue];
          double v90 = v89;

          if (v90 == 0.0)
          {
            v91 = [(MOEventPatternDetectorAnomalyDetectorExponentialDistributionWithEWA *)self _createAnomalyEventFromEvent:v57 andFeature:v60 andThreshold:maximumThreshold];
            [v107 addObject:v91];
          }
        }
      }
      [(MOEventPatternDetectorAnomalyDetectorExponentialDistributionWithEWA *)self _updateFeatureGroupEWADict:v52 withCurrentFeature:v60 andCurrentEvent:v57 andCurrentEventTimeStamp:v63];

      goto LABEL_70;
    }
LABEL_75:
    v92 = [v52 objectForKeyedSubscript:@"EWAForAnomalyValue"];
    [v92 doubleValue];
    double v94 = v93;

    if (v94 > -1.0)
    {
      id v95 = [v52 copy];
      [(NSMutableDictionary *)self->_anomalyEWADictionariesForDetector setObject:v95 forKeyedSubscript:v104];
    }
    uint64_t v14 = v106 + 1;
    id v7 = v101;
    id v8 = v102;
    if ((unint64_t)[v6 count] <= v106 + 1) {
      goto LABEL_80;
    }
  }
  v97 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
  if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR)) {
    -[MOEventPatternDetectorAnomalyDetectorExponentialDistributionWithEWA extractAnomalyEventsFrom:withFeatures:](&buf, v98, v97);
  }

  id v10 = 0;
LABEL_84:

LABEL_6:

  return v10;
}

- (id)_createAnomalyEventFromEvent:(id)a3 andFeature:(id)a4 andThreshold:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [v8 startDate];
  v11 = [v8 endDate];
  if ([v8 timeAtHomeSubType] == (id)1)
  {
    cal = self->_cal;
    objc_super v13 = [v8 startDate];
    uint64_t v14 = [(NSCalendar *)cal components:28 fromDate:v13];

    [v14 setHour:3];
    uint64_t v15 = [(NSCalendar *)self->_cal dateFromComponents:v14];

    v16 = [(NSCalendar *)self->_cal dateFromComponents:v14];
    uint64_t v17 = [v16 dateByAddingTimeInterval:86400.0];

    v11 = (void *)v17;
    id v10 = (void *)v15;
  }
  v18 = [MOEvent alloc];
  v19 = +[NSUUID UUID];
  v20 = +[NSDate date];
  int v21 = -[MOEvent initWithEventIdentifier:startDate:endDate:creationDate:provider:category:](v18, "initWithEventIdentifier:startDate:endDate:creationDate:provider:category:", v19, v10, v11, v20, 5, [v8 category]);

  CFStringRef v22 = [v8 expirationDate];
  [(MOEvent *)v21 setExpirationDate:v22];

  if ([v8 timeAtHomeSubType] == (id)1 || objc_msgSend(v8, "timeAtHomeSubType") == (id)3) {
    -[MOEvent setTimeAtHomeSubType:](v21, "setTimeAtHomeSubType:", [v8 timeAtHomeSubType]);
  }
  id v23 = objc_opt_new();
  [v23 setObject:&off_1002F48E0 forKeyedSubscript:@"kEventPatternType"];
  v24 = +[NSNumber numberWithUnsignedInteger:self->_anomalyFeatureType];
  [v23 setObject:v24 forKeyedSubscript:@"kEventPatternAnomalyFeatureType"];

  id v25 = [v8 eventIdentifier];
  v26 = [v25 UUIDString];
  [v23 setObject:v26 forKeyedSubscript:@"kEventPatternAnomalousEventIdentifier"];

  [v9 doubleValue];
  double v28 = v27;

  uint64_t v29 = +[NSNumber numberWithDouble:v28];
  [v23 setObject:v29 forKeyedSubscript:@"kEventPatternFeatureValue"];

  v30 = +[NSNumber numberWithDouble:a5];
  [v23 setObject:v30 forKeyedSubscript:@"kEventPatternThresholdValue"];

  if ([v8 category] == (id)10)
  {
    v31 = [v8 interactionScoredContact];
    unsigned int v32 = [v31 contact];
    v33 = [v32 identifier];
    [v23 setObject:v33 forKeyedSubscript:@"kEventPatternInteractionScoredContactIdentifier"];
  }
  if ([v8 category] == (id)2)
  {
    v34 = [v8 workoutType];
    if (v34) {
      [v8 workoutType];
    }
    else {
    v35 = +[NSNull null];
    }
    [v23 setObject:v35 forKeyedSubscript:@"kEventPatternAnomalyWorkoutType"];
  }
  if ([v8 category] == (id)16)
  {
    v36 = [v8 workoutType];
    if (v36) {
      [v8 workoutType];
    }
    else {
    v37 = +[NSNull null];
    }
    [v23 setObject:v37 forKeyedSubscript:@"kEventPatternAnomalyWorkoutType"];

    v38 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v8 motionType]);
    [v23 setObject:v38 forKeyedSubscript:@"kEventPatternAnomalyMotionType"];
  }
  uint64_t v39 = [v8 pCount];
  if (v39)
  {
    double v40 = (void *)v39;
    v41 = [v8 pCount];
    unsigned int v42 = [v41 intValue];

    if ((v42 & 0x80000000) == 0)
    {
      v43 = [v8 pCount];
      [v23 setObject:v43 forKeyedSubscript:@"kEventPatternAnomalyPcount"];
    }
  }
  uint64_t v44 = [v8 densityScore];
  if (v44)
  {
    v45 = (void *)v44;
    v46 = [v8 densityScore];
    unsigned int v47 = [v46 intValue];

    if ((v47 & 0x80000000) == 0)
    {
      v48 = [v8 densityScore];
      [v23 setObject:v48 forKeyedSubscript:@"kEventPatternAnomalyDensityScore"];
    }
  }
  [(MOEvent *)v21 setPatterns:v23];

  return v21;
}

- (void)_updateFeatureGroupEWADict:(id)a3 withCurrentFeature:(id)a4 andCurrentEvent:(id)a5 andCurrentEventTimeStamp:(double)a6
{
  id v40 = a3;
  id v10 = a4;
  id v11 = a5;
  [v10 doubleValue];
  if (v12 >= self->_minimumFeatureSizeForPersonalizedThreshold)
  {
    objc_super v13 = [v40 objectForKeyedSubscript:@"EWAForAnomalyLastUpdateTime"];
    [v13 doubleValue];
    double v15 = v14;

    if (v15 < a6)
    {
      if ([v11 category] == (id)2
        || [v11 category] == (id)10
        || [v11 category] == (id)16)
      {
        v16 = [v11 eventIdentifier];
        uint64_t v17 = [v16 UUIDString];
        [v40 setObject:v17 forKeyedSubscript:@"EWAEventUUID"];
      }
      if ([v11 category] == (id)2)
      {
        v18 = [v11 identifierFromProvider];
        [v40 setObject:v18 forKeyedSubscript:@"EWAEventProviderUUID"];
      }
      v19 = [v40 objectForKeyedSubscript:@"EWAForAnomalyValue"];
      [v19 doubleValue];
      double v21 = v20;

      if (v21 == -1.0)
      {
        [v10 doubleValue];
        CFStringRef v22 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        [v40 setObject:v22 forKeyedSubscript:@"EWAForAnomalyValue"];
      }
      else
      {
        id v23 = [v40 objectForKeyedSubscript:@"EWAForAnomalyLastUpdateTime"];
        [v23 doubleValue];
        long double v25 = (a6 - v24) / 86400.0;

        double v26 = pow(self->_betaForEWAUpdate, v25);
        CFStringRef v22 = [v40 objectForKeyedSubscript:@"EWAForAnomalyValue"];
        [v22 doubleValue];
        double v28 = v27;
        [v10 doubleValue];
        v30 = +[NSNumber numberWithDouble:(1.0 - v26) * v29 + v26 * v28];
        [v40 setObject:v30 forKeyedSubscript:@"EWAForAnomalyValue"];
      }
      v31 = [v11 endDate];
      [v31 timeIntervalSinceReferenceDate];
      unsigned int v32 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [v40 setObject:v32 forKeyedSubscript:@"EWAForAnomalyLastUpdateTime"];

      v33 = [v40 objectForKeyedSubscript:@"EWAForAnomalyFeatureCountUntilMinimum"];
      LODWORD(v31) = [v33 intValue];
      int minimumFeatureNumberForPersonalizedThreshold = self->_minimumFeatureNumberForPersonalizedThreshold;

      if ((int)v31 < minimumFeatureNumberForPersonalizedThreshold)
      {
        v35 = [v40 objectForKeyedSubscript:@"EWAForAnomalyFeatureCountUntilMinimum"];
        v36 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v35 intValue] + 1);
        [v40 setObject:v36 forKeyedSubscript:@"EWAForAnomalyFeatureCountUntilMinimum"];
      }
      v37 = [v40 objectForKeyedSubscript:@"EWAForAnomalyFeatureCountUntilMinimum"];
      signed int v38 = [v37 intValue];
      int v39 = self->_minimumFeatureNumberForPersonalizedThreshold;

      if (v38 >= v39) {
        [v40 setObject:&__kCFBooleanTrue forKeyedSubscript:@"EWAForAnomalyFeatureCountMeetsMinimum"];
      }
    }
  }
}

- (BOOL)configure:(id)a3
{
  id v4 = a3;
  id v5 = [v4 count];
  if (v5)
  {
    id v6 = [v4 objectForKey:@"TukeyFactorForExponentialDistributionOutlier"];

    if (v6)
    {
      id v7 = [v4 objectForKeyedSubscript:@"TukeyFactorForExponentialDistributionOutlier"];
      [v7 doubleValue];
      self->_double tukeyFactorForExponentialDistributionOutlier = v8;
    }
    else
    {
      id v9 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[MOEventPatternDetectorAnomalyDetectorExponentialDistributionWithEWA configure:]();
      }
    }
    id v10 = [v4 objectForKey:@"MaximumThreshold"];

    if (v10)
    {
      id v11 = [v4 objectForKeyedSubscript:@"MaximumThreshold"];
      [v11 doubleValue];
      self->_double maximumThreshold = v12;
    }
    else
    {
      id v11 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[MOEventPatternDetectorAnomalyDetectorExponentialDistributionWithEWA configure:]();
      }
    }

    objc_super v13 = [v4 objectForKey:@"MinimumThreshold"];

    if (v13)
    {
      double v14 = [v4 objectForKeyedSubscript:@"MinimumThreshold"];
      [v14 doubleValue];
      self->_minimumThreshold = v15;
    }
    else
    {
      double v14 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[MOEventPatternDetectorAnomalyDetectorExponentialDistributionWithEWA configure:]();
      }
    }

    v16 = [v4 objectForKey:@"MinimumFeatureNumberForPersonalizedThreshold"];

    if (v16)
    {
      uint64_t v17 = [v4 objectForKeyedSubscript:@"MinimumFeatureNumberForPersonalizedThreshold"];
      self->_int minimumFeatureNumberForPersonalizedThreshold = [v17 intValue];
    }
    else
    {
      uint64_t v17 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[MOEventPatternDetectorAnomalyDetectorExponentialDistributionWithEWA configure:]();
      }
    }

    v18 = [v4 objectForKey:@"MinimumFeatureSizeForPersonalizedThreshold"];

    if (v18)
    {
      v19 = [v4 objectForKeyedSubscript:@"MinimumFeatureSizeForPersonalizedThreshold"];
      [v19 doubleValue];
      self->_minimumFeatureSizeForPersonalizedThreshold = v20;
    }
    else
    {
      v19 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[MOEventPatternDetectorAnomalyDetectorExponentialDistributionWithEWA configure:]();
      }
    }

    double v21 = [v4 objectForKey:@"BetaForEWAUpdate"];

    if (v21)
    {
      CFStringRef v22 = [v4 objectForKeyedSubscript:@"BetaForEWAUpdate"];
      [v22 doubleValue];
      self->_betaForEWAUpdate = v23;
    }
    else
    {
      CFStringRef v22 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[MOEventPatternDetectorAnomalyDetectorExponentialDistributionWithEWA configure:]();
      }
    }

    double v24 = [v4 objectForKey:@"AnomalyFeatureType"];

    if (v24)
    {
      long double v25 = [v4 objectForKeyedSubscript:@"AnomalyFeatureType"];
      self->_unint64_t anomalyFeatureType = (int)[v25 intValue];
    }
    else
    {
      long double v25 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        -[MOEventPatternDetectorAnomalyDetectorExponentialDistributionWithEWA configure:]();
      }
    }

    double v26 = [v4 objectForKey:@"AnomalyEWADictionariesForDetector"];

    if (v26)
    {
      double v27 = [v4 objectForKeyedSubscript:@"AnomalyEWADictionariesForDetector"];
      anomalyEWADictionariesForDetector = self->_anomalyEWADictionariesForDetector;
      self->_anomalyEWADictionariesForDetector = v27;

      double v29 = (NSDictionary *)[(NSMutableDictionary *)self->_anomalyEWADictionariesForDetector copy];
      p_super = &self->_EWADict->super;
      self->_EWADict = v29;
    }
    else
    {
      p_super = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
        -[MOEventPatternDetectorAnomalyDetectorExponentialDistributionWithEWA configure:]();
      }
    }
  }
  return v5 != 0;
}

- (id)getAnomalyDetectorDict
{
  return self->_EWADict;
}

- (NSDictionary)EWADict
{
  return self->_EWADict;
}

- (void)setEWADict:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_EWADict, 0);
  objc_storeStrong((id *)&self->_cal, 0);

  objc_storeStrong((id *)&self->_anomalyEWADictionariesForDetector, 0);
}

- (void)extractAnomalyEventsFrom:(os_log_t)log withFeatures:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Exponential distribution with EWA configuration not set", v1, 2u);
}

- (void)extractAnomalyEventsFrom:(os_log_t)log withFeatures:.cold.2(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *uint8_t buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "All required keys for saving EWA are not present", buf, 2u);
}

- (void)configure:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Configuration property not set for exponential distribution with EWA: %@", v2, v3, v4, v5, v6);
}

@end