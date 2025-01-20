@interface MOEventPatternDetectorAnomalyDetectorExponentialDistribution
- (BOOL)configure:(id)a3;
- (MOEventPatternDetectorAnomalyDetectorExponentialDistribution)init;
- (id)extractAnomalyEventsFrom:(id)a3 withFeatures:(id)a4;
@end

@implementation MOEventPatternDetectorAnomalyDetectorExponentialDistribution

- (MOEventPatternDetectorAnomalyDetectorExponentialDistribution)init
{
  v11.receiver = self;
  v11.super_class = (Class)MOEventPatternDetectorAnomalyDetectorExponentialDistribution;
  v2 = [(MOEventPatternDetectorAnomalyDetectorExponentialDistribution *)&v11 init];
  v3 = (MOEventPatternDetectorAnomalyDetectorExponentialDistribution *)v2;
  if (v2)
  {
    __asm { FMOV            V0.2D, #-1.0 }
    *(_OWORD *)(v2 + 8) = _Q0;
    *((_DWORD *)v2 + 6) = -1;
    *((_OWORD *)v2 + 2) = _Q0;
    v9 = v2;
  }

  return v3;
}

- (id)extractAnomalyEventsFrom:(id)a3 withFeatures:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_tukeyFactorForExponentialDistributionOutlier == -1.0
    || self->_minimumFeatureSizeForPersonalizedThreshold == -1.0
    || self->_minimumFeatureNumberForPersonalizedThreshold == -1
    || self->_maximumThreshold == -1.0
    || self->_minimumThreshold == -1.0)
  {
    v8 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[MOEventPatternDetectorAnomalyDetectorExponentialDistribution extractAnomalyEventsFrom:withFeatures:](v8);
    }

    v9 = 0;
  }
  else
  {
    v84 = objc_opt_new();
    uint64_t v11 = +[NSDate date];
    id v12 = [objc_alloc((Class)NSCalendar) initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    v79 = (void *)v11;
    v13 = [v12 components:28 fromDate:v11];
    [v13 setHour:3];
    v77 = v13;
    v78 = v12;
    v88 = [v12 dateFromComponents:v13];
    v91 = [v88 dateByAddingTimeInterval:-86400.0];
    if ([v6 count])
    {
      uint64_t v14 = 0;
      v81 = v6;
      id v80 = v7;
      v83 = self;
      while (1)
      {
        v15 = [v6 objectAtIndex:v14];
        v16 = [v7 objectAtIndex:v14];
        uint64_t v82 = v14;
        if ([v16 count])
        {
          unint64_t v17 = 0;
          uint64_t v89 = 0;
          v18 = 0;
          v19 = 0;
          double v20 = 0.0;
          do
          {
            v21 = [v15 objectAtIndex:v17];
            v22 = [v16 objectAtIndex:v17];
            v23 = [v21 startDate];
            id v24 = [v23 compare:v91];

            if (v24 == (id)-1)
            {
              ++HIDWORD(v89);
              [v22 doubleValue];
              if (v25 >= self->_minimumFeatureSizeForPersonalizedThreshold)
              {
                if (!v89)
                {
                  uint64_t v26 = [v21 startDate];

                  v18 = (void *)v26;
                }
                [v22 doubleValue];
                double v20 = v20 + v27;
                LODWORD(v89) = v89 + 1;
                uint64_t v28 = [v21 startDate];

                v19 = (void *)v28;
              }
            }

            ++v17;
          }
          while ((unint64_t)[v16 count] > v17);
        }
        else
        {
          v19 = 0;
          v18 = 0;
          uint64_t v89 = 0;
          double v20 = 0.0;
        }
        double maximumThreshold = self->_maximumThreshold;
        int v30 = v89;
        v86 = v18;
        v85 = v19;
        if ((int)v89 >= self->_minimumFeatureNumberForPersonalizedThreshold)
        {
          if (self->_anomalyFeatureType == 6) {
            int v30 = 3;
          }
          LODWORD(v89) = v30;
          double v31 = self->_tukeyFactorForExponentialDistributionOutlier * (v20 / (double)v30);
          if (maximumThreshold < v31) {
            double v31 = self->_maximumThreshold;
          }
          if (self->_minimumThreshold >= v31) {
            double maximumThreshold = self->_minimumThreshold;
          }
          else {
            double maximumThreshold = v31;
          }
        }
        if ([v15 count]) {
          break;
        }
LABEL_69:

        uint64_t v14 = v82 + 1;
        id v6 = v81;
        id v7 = v80;
        if ((unint64_t)[v81 count] <= v82 + 1) {
          goto LABEL_70;
        }
      }
      unint64_t v32 = 0;
      int v33 = 0;
      v90 = v15;
      while (1)
      {
        v34 = [v15 objectAtIndex:v32];
        v35 = [v16 objectAtIndex:v32];
        v36 = [v34 startDate];
        if ([(MOEvent *)v36 compare:v91] != (id)1) {
          goto LABEL_64;
        }
        v37 = [v34 startDate];
        id v38 = [v37 compare:v88];

        if (v38 == (id)-1)
        {
          if (self->_anomalyFeatureType) {
            goto LABEL_37;
          }
          if (!(HIDWORD(v89) | v33) || ([v35 doubleValue], v40 > maximumThreshold))
          {
LABEL_41:
            int v87 = v33 + 1;
            v41 = [MOEvent alloc];
            v42 = +[NSUUID UUID];
            v43 = [v34 startDate];
            v44 = [v34 endDate];
            v45 = +[NSDate date];
            v36 = -[MOEvent initWithEventIdentifier:startDate:endDate:creationDate:provider:category:](v41, "initWithEventIdentifier:startDate:endDate:creationDate:provider:category:", v42, v43, v44, v45, 5, [v34 category]);

            v46 = [v34 endDate];
            v47 = [v46 dateByAddingTimeInterval:2419200.0];
            [(MOEvent *)v36 setExpirationDate:v47];

            if ([v34 timeAtHomeSubType]) {
              -[MOEvent setTimeAtHomeSubType:](v36, "setTimeAtHomeSubType:", [v34 timeAtHomeSubType]);
            }
            v48 = objc_opt_new();
            [v48 setObject:&off_1002F42F8 forKeyedSubscript:@"kEventPatternType"];
            self = v83;
            v49 = +[NSNumber numberWithUnsignedInteger:v83->_anomalyFeatureType];
            [v48 setObject:v49 forKeyedSubscript:@"kEventPatternAnomalyFeatureType"];

            v50 = [v34 eventIdentifier];
            v51 = [v50 UUIDString];
            [v48 setObject:v51 forKeyedSubscript:@"kEventPatternAnomalousEventIdentifier"];

            [v35 doubleValue];
            v52 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
            [v48 setObject:v52 forKeyedSubscript:@"kEventPatternFeatureValue"];

            v53 = +[NSNumber numberWithDouble:maximumThreshold];
            [v48 setObject:v53 forKeyedSubscript:@"kEventPatternThresholdValue"];

            [v86 timeIntervalSinceReferenceDate];
            v54 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
            [v48 setObject:v54 forKeyedSubscript:@"kEventPatternThresholdRangeStartDate"];

            [v85 timeIntervalSinceReferenceDate];
            v55 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
            [v48 setObject:v55 forKeyedSubscript:@"kEventPatternThresholdRangeEndDate"];

            v56 = +[NSNumber numberWithInt:v89];
            [v48 setObject:v56 forKeyedSubscript:@"kEventPatternThresholdNumFeatures"];

            if ([v34 category] == (id)2)
            {
              v57 = [v34 workoutType];
              if (v57) {
                [v34 workoutType];
              }
              else {
              v58 = +[NSNull null];
              }
              [v48 setObject:v58 forKeyedSubscript:@"kEventPatternAnomalyWorkoutType"];
            }
            if ([v34 category] == (id)16)
            {
              v59 = [v34 workoutType];
              if (v59) {
                [v34 workoutType];
              }
              else {
              v60 = +[NSNull null];
              }
              [v48 setObject:v60 forKeyedSubscript:@"kEventPatternAnomalyWorkoutType"];

              v61 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v34 motionType]);
              [v48 setObject:v61 forKeyedSubscript:@"kEventPatternAnomalyMotionType"];
            }
            uint64_t v62 = [v34 pCount];
            if (v62)
            {
              v63 = (void *)v62;
              v64 = [v34 pCount];
              unsigned int v65 = [v64 intValue];

              if ((v65 & 0x80000000) == 0)
              {
                v66 = [v34 pCount];
                [v48 setObject:v66 forKeyedSubscript:@"kEventPatternAnomalyPcount"];
              }
            }
            uint64_t v67 = [v34 densityScore];
            if (v67)
            {
              v68 = (void *)v67;
              v69 = [v34 densityScore];
              unsigned int v70 = [v69 intValue];

              if ((v70 & 0x80000000) == 0)
              {
                v71 = [v34 densityScore];
                [v48 setObject:v71 forKeyedSubscript:@"kEventPatternAnomalyDensityScore"];
              }
            }
            if ([v34 category] == (id)10)
            {
              v72 = [v34 interactionScoredContact];
              v73 = [v72 contact];
              v74 = [v73 identifier];
              [v48 setObject:v74 forKeyedSubscript:@"kEventPatternInteractionScoredContactIdentifier"];
            }
            if ([v34 category] == (id)24)
            {
              v75 = [v34 stateOfMindEvent];
              [v75 valenceClassification];
              v76 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
              [v48 setObject:v76 forKeyedSubscript:@"kEventPatternAnomalyStateOfMind"];
            }
            [(MOEvent *)v36 setPatterns:v48];
            [v84 addObject:v36];

            int v33 = v87;
LABEL_64:

            goto LABEL_65;
          }
          if (self->_anomalyFeatureType)
          {
LABEL_37:
            [v35 doubleValue];
            if (v39 > maximumThreshold) {
              goto LABEL_41;
            }
          }
          ++v33;
        }
LABEL_65:

        ++v32;
        v15 = v90;
        if ((unint64_t)[v90 count] <= v32) {
          goto LABEL_69;
        }
      }
    }
LABEL_70:

    v9 = v84;
  }

  return v9;
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
      self->_tukeyFactorForExponentialDistributionOutlier = v8;
    }
    else
    {
      v9 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[MOEventPatternDetectorAnomalyDetectorExponentialDistribution configure:]();
      }
    }
    v10 = [v4 objectForKey:@"MaximumThreshold"];

    if (v10)
    {
      uint64_t v11 = [v4 objectForKeyedSubscript:@"MaximumThreshold"];
      [v11 doubleValue];
      self->_double maximumThreshold = v12;
    }
    else
    {
      uint64_t v11 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[MOEventPatternDetectorAnomalyDetectorExponentialDistribution configure:]();
      }
    }

    v13 = [v4 objectForKey:@"MinimumThreshold"];

    if (v13)
    {
      uint64_t v14 = [v4 objectForKeyedSubscript:@"MinimumThreshold"];
      [v14 doubleValue];
      self->_minimumThreshold = v15;
    }
    else
    {
      uint64_t v14 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[MOEventPatternDetectorAnomalyDetectorExponentialDistribution configure:]();
      }
    }

    v16 = [v4 objectForKey:@"MinimumFeatureNumberForPersonalizedThreshold"];

    if (v16)
    {
      unint64_t v17 = [v4 objectForKeyedSubscript:@"MinimumFeatureNumberForPersonalizedThreshold"];
      self->_minimumFeatureNumberForPersonalizedThreshold = [v17 intValue];
    }
    else
    {
      unint64_t v17 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[MOEventPatternDetectorAnomalyDetectorExponentialDistribution configure:]();
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
        -[MOEventPatternDetectorAnomalyDetectorExponentialDistribution configure:]();
      }
    }

    v21 = [v4 objectForKey:@"AnomalyFeatureType"];

    if (v21)
    {
      v22 = [v4 objectForKeyedSubscript:@"AnomalyFeatureType"];
      self->_anomalyFeatureType = (int)[v22 intValue];
    }
    else
    {
      v22 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[MOEventPatternDetectorAnomalyDetectorExponentialDistribution configure:]();
      }
    }
  }
  return v5 != 0;
}

- (void)extractAnomalyEventsFrom:(os_log_t)log withFeatures:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Exponential distribution configuration not set", v1, 2u);
}

- (void)configure:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Configuration property not set for exponential distribution: %@", v2, v3, v4, v5, v6);
}

@end