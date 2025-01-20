@interface HDSPSleepApneaAnalyticsBuilder
- ($0AC6E346AE4835514AAA8AC86D8F4844)morningIndexRange;
- (BOOL)_areHealthNotificationsAuthorized;
- (BOOL)_isEnabledBD;
- (BOOL)_isOnboardedBD;
- (HDSPSleepApneaAnalyticsBuilder)initWithBreathingDisturbanceSamples:(id)a3 sleepApneaEventSamples:(id)a4 sleepApneaFeatureStatus:(id)a5 morningIndexRange:(id)a6 gregorianCalendar:(id)a7 dateOfLastAnalysis:(id)a8 currentDateProvider:(id)a9;
- (HKFeatureStatus)sleepApneaFeatureStatus;
- (NSArray)breathingDisturbanceSamples;
- (NSArray)sleepApneaEventSamples;
- (NSCalendar)gregorianCalendar;
- (NSDate)dateOfLastAnalysis;
- (id)_breathingDisturbanceSamplesInPastNight;
- (id)_maxBDValueInPast30Days;
- (id)_maxTimeBetweenBDSessionsPastNight:(id)a3;
- (id)_meanTimeBetweenBDSessionsPastNight:(id)a3;
- (id)_minTimeBetweenBDSessionsPastNight:(id)a3;
- (id)_numBDNotifications:(id)a3;
- (id)_numBDValuesInPast30Days;
- (id)_numBDValuesInPastNight:(id)a3;
- (id)_numDaysSinceLastAnalysis;
- (id)_numDaysSinceLastBDNotification;
- (id)_numSleepDaysWithBDsOverThresholdLast30Days;
- (id)_numSleepDaysWithMultipleBDsInTheLast30Days;
- (id)_numSleepSessionsWithBDsOverThresholdLast30Days;
- (id)_onboardedCountryCode;
- (id)_sleepApneaEventSamplesInPastNights:(int64_t)a3;
- (id)_timesBetweenBDSessions:(id)a3;
- (id)_weeksSinceOnboardedBD;
- (id)currentDateProvider;
- (void)_calculateBreathingDisturbanceValueDependentMetrics;
- (void)updateDailyReportWithSleepApneaAnalytics:(id)a3;
@end

@implementation HDSPSleepApneaAnalyticsBuilder

- (HDSPSleepApneaAnalyticsBuilder)initWithBreathingDisturbanceSamples:(id)a3 sleepApneaEventSamples:(id)a4 sleepApneaFeatureStatus:(id)a5 morningIndexRange:(id)a6 gregorianCalendar:(id)a7 dateOfLastAnalysis:(id)a8 currentDateProvider:(id)a9
{
  int64_t var1 = a6.var1;
  int64_t var0 = a6.var0;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  v36.receiver = self;
  v36.super_class = (Class)HDSPSleepApneaAnalyticsBuilder;
  v21 = [(HDSPSleepApneaAnalyticsBuilder *)&v36 init];
  if (v21)
  {
    uint64_t v22 = [v15 copy];
    breathingDisturbanceSamples = v21->_breathingDisturbanceSamples;
    v21->_breathingDisturbanceSamples = (NSArray *)v22;

    uint64_t v24 = [v16 copy];
    sleepApneaEventSamples = v21->_sleepApneaEventSamples;
    v21->_sleepApneaEventSamples = (NSArray *)v24;

    uint64_t v26 = [v17 copy];
    sleepApneaFeatureStatus = v21->_sleepApneaFeatureStatus;
    v21->_sleepApneaFeatureStatus = (HKFeatureStatus *)v26;

    v21->_morningIndexRange.start = var0;
    v21->_morningIndexRange.duration = var1;
    uint64_t v28 = [v18 copy];
    gregorianCalendar = v21->_gregorianCalendar;
    v21->_gregorianCalendar = (NSCalendar *)v28;

    uint64_t v30 = [v20 copy];
    id currentDateProvider = v21->_currentDateProvider;
    v21->_id currentDateProvider = (id)v30;

    if (v19)
    {
      uint64_t v32 = [v19 copy];
      dateOfLastAnalysis = v21->_dateOfLastAnalysis;
      v21->_dateOfLastAnalysis = (NSDate *)v32;
    }
    v34 = v21;
  }

  return v21;
}

- (void)updateDailyReportWithSleepApneaAnalytics:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_opt_class();
    id v7 = v6;
    v8 = [(HDSPSleepApneaAnalyticsBuilder *)self breathingDisturbanceSamples];
    int v32 = 138543618;
    v33 = v6;
    __int16 v34 = 2050;
    uint64_t v35 = [v8 count];
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Building daily analytics report from %{public}lu bd samples", (uint8_t *)&v32, 0x16u);
  }
  v9 = objc_msgSend(NSNumber, "numberWithBool:", -[HDSPSleepApneaAnalyticsBuilder _isEnabledBD](self, "_isEnabledBD"));
  [v4 setIsOnboardedBD:v9];

  v10 = [(HDSPSleepApneaAnalyticsBuilder *)self _onboardedCountryCode];
  [v4 setBDOnboardingCountryCode:v10];

  v11 = objc_msgSend(NSNumber, "numberWithBool:", -[HDSPSleepApneaAnalyticsBuilder _areHealthNotificationsAuthorized](self, "_areHealthNotificationsAuthorized"));
  [v4 setAreHealthNotificationsAuthorized:v11];

  v12 = [(HDSPSleepApneaAnalyticsBuilder *)self _breathingDisturbanceSamplesInPastNight];
  v13 = [(HDSPSleepApneaAnalyticsBuilder *)self _sleepApneaEventSamplesInPastNights:0];
  v14 = [(HDSPSleepApneaAnalyticsBuilder *)self _sleepApneaEventSamplesInPastNights:30];
  id v15 = [(HDSPSleepApneaAnalyticsBuilder *)self _sleepApneaEventSamplesInPastNights:180];
  id v16 = [(HDSPSleepApneaAnalyticsBuilder *)self _timesBetweenBDSessions:v12];
  id v17 = [(HDSPSleepApneaAnalyticsBuilder *)self _numBDValuesInPastNight:v12];
  [v4 setNumBDValuesInPastNight:v17];

  id v18 = [(HDSPSleepApneaAnalyticsBuilder *)self _numBDNotifications:v13];
  [v4 setNumBDNotificationsInPastNight:v18];

  id v19 = [(HDSPSleepApneaAnalyticsBuilder *)self _numBDNotifications:v14];
  [v4 setNumBDNotificationsInPast30Nights:v19];

  id v20 = [(HDSPSleepApneaAnalyticsBuilder *)self _numBDNotifications:v15];
  [v4 setNumBDNotificationsInPast180Nights:v20];

  v21 = [(HDSPSleepApneaAnalyticsBuilder *)self _meanTimeBetweenBDSessionsPastNight:v16];
  [v4 setMeanTimeBetweenBDSessionsPastNight:v21];

  uint64_t v22 = [(HDSPSleepApneaAnalyticsBuilder *)self _minTimeBetweenBDSessionsPastNight:v16];
  [v4 setMinTimeBetweenBDSessionsPastNight:v22];

  v23 = [(HDSPSleepApneaAnalyticsBuilder *)self _maxTimeBetweenBDSessionsPastNight:v16];
  [v4 setMaxTimeBetweenBDSessionsPastNight:v23];

  uint64_t v24 = [(HDSPSleepApneaAnalyticsBuilder *)self _numBDValuesInPast30Days];
  [v4 setNumBDValuesInPast30Days:v24];

  [(HDSPSleepApneaAnalyticsBuilder *)self _calculateBreathingDisturbanceValueDependentMetrics];
  v25 = [(HDSPSleepApneaAnalyticsBuilder *)self _numSleepDaysWithBDsOverThresholdLast30Days];
  [v4 setNumSleepDaysWithBDsOverThresholdLast30Days:v25];

  uint64_t v26 = [(HDSPSleepApneaAnalyticsBuilder *)self _numSleepDaysWithMultipleBDsInTheLast30Days];
  [v4 setNumSleepDaysWithMultipleBDinPast30Days:v26];

  v27 = [(HDSPSleepApneaAnalyticsBuilder *)self _numSleepSessionsWithBDsOverThresholdLast30Days];
  [v4 setNumSleepSessionsWithBDsOverThresholdLast30Days:v27];

  uint64_t v28 = [(HDSPSleepApneaAnalyticsBuilder *)self _maxBDValueInPast30Days];
  [v4 setMaxBDValueInPast30Days:v28];

  v29 = [(HDSPSleepApneaAnalyticsBuilder *)self _numDaysSinceLastBDNotification];
  [v4 setNumDaysSinceLastBDNotification:v29];

  uint64_t v30 = [(HDSPSleepApneaAnalyticsBuilder *)self _numDaysSinceLastAnalysis];
  [v4 setNumDaysSinceLastAnalysis:v30];

  v31 = [(HDSPSleepApneaAnalyticsBuilder *)self _weeksSinceOnboardedBD];
  [v4 setWeeksSinceOnboardedBD:v31];
}

- (BOOL)_isOnboardedBD
{
  v3 = [(HDSPSleepApneaAnalyticsBuilder *)self sleepApneaFeatureStatus];

  if (!v3) {
    return 0;
  }
  id v4 = [(HDSPSleepApneaAnalyticsBuilder *)self sleepApneaFeatureStatus];
  char v5 = [v4 isOnboardingRecordPresent];

  return v5;
}

- (BOOL)_areHealthNotificationsAuthorized
{
  id v2 = objc_alloc(MEMORY[0x263F1DFB0]);
  v3 = (void *)[v2 initWithBundleIdentifier:*MEMORY[0x263F0AD08]];
  id v4 = [v3 notificationSettings];

  LOBYTE(v3) = [v4 authorizationStatus] == 2;
  return (char)v3;
}

- (BOOL)_isEnabledBD
{
  v3 = [(HDSPSleepApneaAnalyticsBuilder *)self sleepApneaFeatureStatus];

  if (!v3) {
    return 0;
  }
  id v4 = [(HDSPSleepApneaAnalyticsBuilder *)self sleepApneaFeatureStatus];
  char v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F09600]];
  char v6 = [v5 isRequirementSatisfiedWithIdentifier:*MEMORY[0x263F09678]];

  return v6;
}

- (id)_onboardedCountryCode
{
  v3 = [(HDSPSleepApneaAnalyticsBuilder *)self sleepApneaFeatureStatus];

  if (v3 && [(HDSPSleepApneaAnalyticsBuilder *)self _isOnboardedBD])
  {
    id v4 = [(HDSPSleepApneaAnalyticsBuilder *)self sleepApneaFeatureStatus];
    char v5 = [v4 onboardingRecord];
    char v6 = [v5 onboardedCountryCodesForOnboardingState];
    id v7 = [v6 allObjects];
    v8 = [v7 firstObject];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_numBDValuesInPastNight:(id)a3
{
  id v4 = a3;
  if ([(HDSPSleepApneaAnalyticsBuilder *)self _isOnboardedBD])
  {
    char v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "count"));
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (id)_numBDNotifications:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(HDSPSleepApneaAnalyticsBuilder *)self _isOnboardedBD];
  char v6 = 0;
  if (v4 && v5)
  {
    char v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "count"));
  }

  return v6;
}

- (id)_numBDValuesInPast30Days
{
  if ([(HDSPSleepApneaAnalyticsBuilder *)self _isOnboardedBD]
    && ([(HDSPSleepApneaAnalyticsBuilder *)self breathingDisturbanceSamples],
        v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    id v4 = NSNumber;
    BOOL v5 = [(HDSPSleepApneaAnalyticsBuilder *)self breathingDisturbanceSamples];
    char v6 = objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)_meanTimeBetweenBDSessionsPastNight:(id)a3
{
  id v4 = a3;
  if (-[HDSPSleepApneaAnalyticsBuilder _isOnboardedBD](self, "_isOnboardedBD") && [v4 count])
  {
    BOOL v5 = [v4 valueForKeyPath:@"@avg.doubleValue"];
    [v5 doubleValue];
    double v7 = v6;

    v8 = [NSNumber numberWithDouble:v7 / 3600.0];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_maxTimeBetweenBDSessionsPastNight:(id)a3
{
  id v4 = a3;
  if (-[HDSPSleepApneaAnalyticsBuilder _isOnboardedBD](self, "_isOnboardedBD") && [v4 count])
  {
    BOOL v5 = [v4 valueForKeyPath:@"@max.doubleValue"];
    [v5 doubleValue];
    double v7 = v6;

    v8 = [NSNumber numberWithDouble:v7 / 3600.0];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_minTimeBetweenBDSessionsPastNight:(id)a3
{
  id v4 = a3;
  if (-[HDSPSleepApneaAnalyticsBuilder _isOnboardedBD](self, "_isOnboardedBD") && [v4 count])
  {
    BOOL v5 = [v4 valueForKeyPath:@"@min.doubleValue"];
    [v5 doubleValue];
    double v7 = v6;

    v8 = [NSNumber numberWithDouble:v7 / 3600.0];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_numSleepSessionsWithBDsOverThresholdLast30Days
{
  if ([(HDSPSleepApneaAnalyticsBuilder *)self _isOnboardedBD]
    && ([(HDSPSleepApneaAnalyticsBuilder *)self breathingDisturbanceSamples],
        v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v3)
    && ([(HDSPSleepApneaAnalyticsBuilder *)self breathingDisturbanceSamples],
        id v4 = objc_claimAutoreleasedReturnValue(),
        uint64_t v5 = [v4 count],
        v4,
        v5))
  {
    double v6 = [NSNumber numberWithInteger:self->_numSleepSessionsWithBDsOverThresholdLast30Days];
  }
  else
  {
    double v6 = 0;
  }

  return v6;
}

- (id)_maxBDValueInPast30Days
{
  if ([(HDSPSleepApneaAnalyticsBuilder *)self _isOnboardedBD]
    && ([(HDSPSleepApneaAnalyticsBuilder *)self breathingDisturbanceSamples],
        v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v3)
    && ([(HDSPSleepApneaAnalyticsBuilder *)self breathingDisturbanceSamples],
        id v4 = objc_claimAutoreleasedReturnValue(),
        uint64_t v5 = [v4 count],
        v4,
        v5))
  {
    double v6 = [NSNumber numberWithDouble:self->_maximumBDValueInPast30Days];
  }
  else
  {
    double v6 = 0;
  }

  return v6;
}

- (id)_numSleepDaysWithBDsOverThresholdLast30Days
{
  if ([(HDSPSleepApneaAnalyticsBuilder *)self _isOnboardedBD]
    && ([(HDSPSleepApneaAnalyticsBuilder *)self breathingDisturbanceSamples],
        v3 = objc_claimAutoreleasedReturnValue(),
        uint64_t v4 = [v3 count],
        v3,
        v4))
  {
    uint64_t v5 = [NSNumber numberWithInteger:self->_numSleepDaysWithBDsOverThresholdLast30Days];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)_numSleepDaysWithMultipleBDsInTheLast30Days
{
  if ([(HDSPSleepApneaAnalyticsBuilder *)self _isOnboardedBD]
    && ([(HDSPSleepApneaAnalyticsBuilder *)self breathingDisturbanceSamples],
        v3 = objc_claimAutoreleasedReturnValue(),
        uint64_t v4 = [v3 count],
        v3,
        v4))
  {
    uint64_t v5 = [NSNumber numberWithInteger:self->_numSleepDaysWithMultipleBDsInLast30Days];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)_timesBetweenBDSessions:(id)a3
{
  id v3 = a3;
  if ((unint64_t)[v3 count] <= 1)
  {
    id v12 = objc_alloc_init(MEMORY[0x263EFF8C0]);
  }
  else
  {
    id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
    if ((unint64_t)[v3 count] >= 2)
    {
      unint64_t v5 = 1;
      do
      {
        double v6 = [v3 objectAtIndexedSubscript:v5 - 1];
        double v7 = [v6 endDate];

        v8 = [v3 objectAtIndexedSubscript:v5];
        v9 = [v8 startDate];

        [v9 timeIntervalSinceDate:v7];
        if (v10 < 0.0) {
          double v10 = 0.0;
        }
        v11 = [NSNumber numberWithDouble:v10];
        [v4 addObject:v11];

        ++v5;
      }
      while ([v3 count] > v5);
    }
    id v12 = (id)[v4 copy];
  }

  return v12;
}

- (id)_weeksSinceOnboardedBD
{
  if ([(HDSPSleepApneaAnalyticsBuilder *)self _isOnboardedBD])
  {
    id v3 = [(HDSPSleepApneaAnalyticsBuilder *)self sleepApneaFeatureStatus];
    id v4 = [v3 onboardingRecord];
    unint64_t v5 = [v4 earliestDateOfAnyOnboardingCompletion];

    if (v5)
    {
      double v6 = [(HDSPSleepApneaAnalyticsBuilder *)self currentDateProvider];
      double v7 = v6[2]();

      v8 = [(HDSPSleepApneaAnalyticsBuilder *)self gregorianCalendar];
      v9 = [v8 components:0x2000 fromDate:v5 toDate:v7 options:0];

      uint64_t v10 = [v9 weekOfYear];
      uint64_t v11 = v10;
      if (v10 >= 100) {
        uint64_t v11 = 10 * ((v10 + 5) / 10);
      }
      id v12 = [NSNumber numberWithInteger:v11];
    }
    else
    {
      id v12 = 0;
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (void)_calculateBreathingDisturbanceValueDependentMetrics
{
  id v2 = self;
  uint64_t v66 = *MEMORY[0x263EF8340];
  if ([(HDSPSleepApneaAnalyticsBuilder *)self _isOnboardedBD])
  {
    id v3 = [(HDSPSleepApneaAnalyticsBuilder *)v2 breathingDisturbanceSamples];

    if (v3)
    {
      id v4 = [(HDSPSleepApneaAnalyticsBuilder *)v2 breathingDisturbanceSamples];
      uint64_t v5 = [v4 count];

      if (v5)
      {
        double v6 = HKAppleSleepingBreathingDisturbancesMinimumQuantityForClassification();
        double v7 = [MEMORY[0x263F0A830] countUnit];
        [v6 doubleValueForUnit:v7];
        double v9 = v8;

        id v10 = objc_alloc(MEMORY[0x263EFF9A0]);
        uint64_t v11 = [(HDSPSleepApneaAnalyticsBuilder *)v2 breathingDisturbanceSamples];
        id v12 = objc_msgSend(v10, "initWithCapacity:", objc_msgSend(v11, "count"));

        long long v61 = 0u;
        long long v62 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        obuint64_t j = [(HDSPSleepApneaAnalyticsBuilder *)v2 breathingDisturbanceSamples];
        uint64_t v13 = [obj countByEnumeratingWithState:&v59 objects:v65 count:16];
        v50 = v2;
        if (v13)
        {
          uint64_t v14 = v13;
          int64_t v15 = 0;
          id v48 = *(id *)v60;
          double v16 = 2.22507386e-308;
          do
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(id *)v60 != v48) {
                objc_enumerationMutation(obj);
              }
              id v18 = *(void **)(*((void *)&v59 + 1) + 8 * i);
              id v19 = [v18 quantity];
              [v19 _value];
              double v21 = v20;

              if (v21 >= v9) {
                ++v15;
              }
              if (v21 > v16) {
                double v16 = v21;
              }
              uint64_t v22 = NSNumber;
              v23 = [v18 endDate];
              uint64_t v24 = [(HDSPSleepApneaAnalyticsBuilder *)v2 gregorianCalendar];
              v25 = objc_msgSend(v22, "numberWithInteger:", objc_msgSend(v23, "hk_morningIndexWithCalendar:", v24));

              uint64_t v26 = [v12 objectForKeyedSubscript:v25];
              if (!v26)
              {
                id v27 = objc_alloc_init(MEMORY[0x263EFF980]);
                [v12 setObject:v27 forKeyedSubscript:v25];
              }
              uint64_t v28 = [v12 objectForKeyedSubscript:v25];
              v29 = NSNumber;
              uint64_t v30 = [v18 quantity];
              [v30 _value];
              v31 = objc_msgSend(v29, "numberWithDouble:");
              [v28 addObject:v31];

              id v2 = v50;
            }
            uint64_t v14 = [obj countByEnumeratingWithState:&v59 objects:v65 count:16];
          }
          while (v14);
        }
        else
        {
          int64_t v15 = 0;
          double v16 = 2.22507386e-308;
        }

        v2->_numSleepSessionsWithBDsOverThresholdLast30Days = v15;
        v2->_maximumBDValueInPast30Days = v16;
        long long v55 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        id v49 = [v12 allKeys];
        uint64_t v32 = [v49 countByEnumeratingWithState:&v55 objects:v64 count:16];
        if (v32)
        {
          uint64_t v33 = v32;
          int64_t v34 = 0;
          int64_t v35 = 0;
          uint64_t v36 = *(void *)v56;
          do
          {
            for (uint64_t j = 0; j != v33; ++j)
            {
              if (*(void *)v56 != v36) {
                objc_enumerationMutation(v49);
              }
              v38 = (void *)MEMORY[0x263EFF8C0];
              v39 = [v12 objectForKeyedSubscript:*(void *)(*((void *)&v55 + 1) + 8 * j)];
              v40 = [v38 arrayWithArray:v39];

              if ((unint64_t)[v40 count] > 1) {
                ++v34;
              }
              long long v51 = 0u;
              long long v52 = 0u;
              long long v53 = 0u;
              long long v54 = 0u;
              id v41 = v40;
              uint64_t v42 = [v41 countByEnumeratingWithState:&v51 objects:v63 count:16];
              if (v42)
              {
                uint64_t v43 = v42;
                uint64_t v44 = *(void *)v52;
                while (2)
                {
                  for (uint64_t k = 0; k != v43; ++k)
                  {
                    if (*(void *)v52 != v44) {
                      objc_enumerationMutation(v41);
                    }
                    [*(id *)(*((void *)&v51 + 1) + 8 * k) doubleValue];
                    if (v46 > v9)
                    {
                      ++v35;
                      goto LABEL_36;
                    }
                  }
                  uint64_t v43 = [v41 countByEnumeratingWithState:&v51 objects:v63 count:16];
                  if (v43) {
                    continue;
                  }
                  break;
                }
              }
LABEL_36:
            }
            uint64_t v33 = [v49 countByEnumeratingWithState:&v55 objects:v64 count:16];
          }
          while (v33);
        }
        else
        {
          int64_t v34 = 0;
          int64_t v35 = 0;
        }

        v50->_numSleepDaysWithMultipleBDsInLast30Days = v34;
        v50->_numSleepDaysWithBDsOverThresholdLast30Days = v35;
      }
    }
  }
}

- (id)_breathingDisturbanceSamplesInPastNight
{
  id v3 = [(HDSPSleepApneaAnalyticsBuilder *)self breathingDisturbanceSamples];

  if (v3)
  {
    uint64_t v4 = [(HDSPSleepApneaAnalyticsBuilder *)self morningIndexRange];
    if (v5 <= 0) {
      uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v6 = v5 + v4 - 1;
    }
    double v7 = [(HDSPSleepApneaAnalyticsBuilder *)self breathingDisturbanceSamples];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __73__HDSPSleepApneaAnalyticsBuilder__breathingDisturbanceSamplesInPastNight__block_invoke;
    v10[3] = &unk_2645D9260;
    v10[4] = self;
    v10[5] = v6;
    objc_msgSend(v7, "hk_filter:", v10);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v8 = objc_alloc_init(MEMORY[0x263EFF8C0]);
  }

  return v8;
}

BOOL __73__HDSPSleepApneaAnalyticsBuilder__breathingDisturbanceSamplesInPastNight__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 endDate];
  uint64_t v4 = [*(id *)(a1 + 32) gregorianCalendar];
  BOOL v5 = objc_msgSend(v3, "hk_morningIndexWithCalendar:", v4) == *(void *)(a1 + 40);

  return v5;
}

- (id)_sleepApneaEventSamplesInPastNights:(int64_t)a3
{
  if (![(HDSPSleepApneaAnalyticsBuilder *)self _isOnboardedBD]) {
    goto LABEL_7;
  }
  BOOL v5 = [(HDSPSleepApneaAnalyticsBuilder *)self sleepApneaEventSamples];

  if (!v5)
  {
    id v11 = objc_alloc_init(MEMORY[0x263EFF8C0]);
    goto LABEL_9;
  }
  if (a3 < 0)
  {
LABEL_7:
    id v11 = 0;
    goto LABEL_9;
  }
  uint64_t v6 = [(HDSPSleepApneaAnalyticsBuilder *)self morningIndexRange];
  uint64_t v8 = v7 + v6 - 1;
  if (v7 <= 0) {
    uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v9 = v8 - a3;
  id v10 = [(HDSPSleepApneaAnalyticsBuilder *)self sleepApneaEventSamples];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __70__HDSPSleepApneaAnalyticsBuilder__sleepApneaEventSamplesInPastNights___block_invoke;
  v13[3] = &unk_2645D9260;
  v13[4] = self;
  v13[5] = v9;
  objc_msgSend(v10, "hk_filter:", v13);
  id v11 = (id)objc_claimAutoreleasedReturnValue();

LABEL_9:

  return v11;
}

BOOL __70__HDSPSleepApneaAnalyticsBuilder__sleepApneaEventSamplesInPastNights___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 endDate];
  uint64_t v4 = [*(id *)(a1 + 32) gregorianCalendar];
  BOOL v5 = objc_msgSend(v3, "hk_morningIndexWithCalendar:", v4) >= *(void *)(a1 + 40);

  return v5;
}

- (id)_numDaysSinceLastBDNotification
{
  if ([(HDSPSleepApneaAnalyticsBuilder *)self _isOnboardedBD]
    && ([(HDSPSleepApneaAnalyticsBuilder *)self sleepApneaEventSamples],
        id v3 = objc_claimAutoreleasedReturnValue(),
        uint64_t v4 = [v3 count],
        v3,
        v4))
  {
    BOOL v5 = [(HDSPSleepApneaAnalyticsBuilder *)self gregorianCalendar];
    uint64_t v6 = [(HDSPSleepApneaAnalyticsBuilder *)self sleepApneaEventSamples];
    uint64_t v7 = [v6 lastObject];
    uint64_t v8 = [v7 _creationDate];
    uint64_t v9 = [(HDSPSleepApneaAnalyticsBuilder *)self currentDateProvider];
    id v10 = v9[2]();
    id v11 = [v5 components:16 fromDate:v8 toDate:v10 options:0];

    id v12 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v11, "day"));
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (id)_numDaysSinceLastAnalysis
{
  if ([(HDSPSleepApneaAnalyticsBuilder *)self _isOnboardedBD]
    && ([(HDSPSleepApneaAnalyticsBuilder *)self dateOfLastAnalysis],
        id v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    uint64_t v4 = [(HDSPSleepApneaAnalyticsBuilder *)self gregorianCalendar];
    BOOL v5 = [(HDSPSleepApneaAnalyticsBuilder *)self dateOfLastAnalysis];
    uint64_t v6 = [(HDSPSleepApneaAnalyticsBuilder *)self currentDateProvider];
    uint64_t v7 = v6[2]();
    uint64_t v8 = [v4 components:16 fromDate:v5 toDate:v7 options:0];

    uint64_t v9 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v8, "day"));
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (NSArray)breathingDisturbanceSamples
{
  return self->_breathingDisturbanceSamples;
}

- (NSArray)sleepApneaEventSamples
{
  return self->_sleepApneaEventSamples;
}

- (HKFeatureStatus)sleepApneaFeatureStatus
{
  return self->_sleepApneaFeatureStatus;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)morningIndexRange
{
  int64_t duration = self->_morningIndexRange.duration;
  int64_t start = self->_morningIndexRange.start;
  result.int64_t var1 = duration;
  result.int64_t var0 = start;
  return result;
}

- (NSCalendar)gregorianCalendar
{
  return self->_gregorianCalendar;
}

- (NSDate)dateOfLastAnalysis
{
  return self->_dateOfLastAnalysis;
}

- (id)currentDateProvider
{
  return self->_currentDateProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_currentDateProvider, 0);
  objc_storeStrong((id *)&self->_dateOfLastAnalysis, 0);
  objc_storeStrong((id *)&self->_gregorianCalendar, 0);
  objc_storeStrong((id *)&self->_sleepApneaFeatureStatus, 0);
  objc_storeStrong((id *)&self->_sleepApneaEventSamples, 0);

  objc_storeStrong((id *)&self->_breathingDisturbanceSamples, 0);
}

@end