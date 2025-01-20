@interface HDMHMentalHealthDailyAnalyticsEvent
- (BOOL)isEventSubmissionIHAGated;
- (HDMHMentalHealthDailyAnalyticsEvent)initWithProfile:(id)a3 settingsManager:(id)a4 userDefaults:(id)a5;
- (NSString)eventName;
- (id)_IHAGatedDemographicsFieldsWithDataSource:(id)a3;
- (id)_determineDaysSinceLastSampleWithSampleType:(id)a3 dataSource:(id)a4;
- (id)_enumeratorForPastNDays:(int64_t)a3 withDataSource:(id)a4 forSampleType:(id)a5 withExtraPredicate:(id)a6;
- (id)_featureStatusForFeatureIdentifier:(id)a3 dataSource:(id)a4 error:(id *)a5;
- (id)_fetchDeviceContextAnalytics;
- (id)_hasLaunchedHealthAppInInterval:(int64_t)a3 withDataSource:(id)a4;
- (id)_hasLoggedStateOfMindInPastNDays:(int64_t)a3 withDataSource:(id)a4;
- (id)_healthAppLastOpenedDate;
- (id)_isFeatureEnabledForFeatureIdentifier:(id)a3 dataSource:(id)a4 featureAvailabilityContext:(id)a5;
- (id)_isFeatureOnboardedForFeatureIdentifier:(id)a3 dataSource:(id)a4;
- (id)_numAssessmentsCompletedWithDataSource:(id)a3;
- (id)_numAssessmentsInPastNDays:(int64_t)a3 withDataSource:(id)a4;
- (id)_numDailyStateOfMindLogsInPastNDays:(int64_t)a3 withDataSource:(id)a4;
- (id)_numDaysStateOfMindLoggedInPast30DaysWithDataSource:(id)a3;
- (id)_numDaysStateOfMindLoggedInPastDayWithDataSource:(id)a3;
- (id)_stateOfMindDaySummaryEnumeratorForPastNDays:(int64_t)a3 withDataSource:(id)a4;
- (id)_weeksSinceLastHealthAppLaunchWithDataSource:(id)a3;
- (id)_weeksSinceOnboardingWithDataSource:(id)a3;
- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4;
- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4;
- (int64_t)_bucketedWeeksSinceDate:(id)a3 dataSource:(id)a4;
- (int64_t)numberOfDaysBetweenStartDate:(id)a3 endDate:(id)a4 withCalendar:(id)a5;
@end

@implementation HDMHMentalHealthDailyAnalyticsEvent

- (HDMHMentalHealthDailyAnalyticsEvent)initWithProfile:(id)a3 settingsManager:(id)a4 userDefaults:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HDMHMentalHealthDailyAnalyticsEvent;
  v11 = [(HDMHMentalHealthDailyAnalyticsEvent *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_profile, v8);
    objc_storeStrong((id *)&v12->_settingsManager, a4);
    objc_storeStrong((id *)&v12->_userDefaults, a5);
  }

  return v12;
}

- (NSString)eventName
{
  return (NSString *)@"com.apple.health.mentalhealth.daily";
}

- (BOOL)isEventSubmissionIHAGated
{
  return 0;
}

- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  v5 = (void *)MEMORY[0x263EFF9A0];
  id v6 = a3;
  v7 = [v5 dictionary];
  id v8 = [v6 environmentDataSource];
  id v9 = [v8 activePairedDeviceProductType];
  [v7 setObject:v9 forKeyedSubscript:*MEMORY[0x263F091C0]];

  id v10 = [v6 environmentDataSource];
  v11 = [v10 activePairedDeviceOSBuildNumber];
  [v7 setObject:v11 forKeyedSubscript:*MEMORY[0x263F091B8]];

  v12 = [(HDMHMentalHealthDailyAnalyticsEvent *)self _fetchDeviceContextAnalytics];
  [v7 addEntriesFromDictionary:v12];

  v13 = NSNumber;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v15 = [WeakRetained notificationManager];
  v16 = objc_msgSend(v13, "numberWithBool:", objc_msgSend(v15, "areHealthNotificationsAuthorized"));
  [v7 setObject:v16 forKeyedSubscript:*MEMORY[0x263F091D0]];

  v17 = NSNumber;
  v18 = [v6 environmentDataSource];
  v19 = objc_msgSend(v17, "numberWithBool:", objc_msgSend(v18, "isImproveHealthAndActivityEnabled"));
  [v7 setObject:v19 forKeyedSubscript:*MEMORY[0x263F09200]];

  v20 = [(HDMHMentalHealthDailyAnalyticsEvent *)self _hasLaunchedHealthAppInInterval:7 withDataSource:v6];
  [v7 setObject:v20 forKeyedSubscript:@"hasLaunchedHealthAppInLastWeek"];

  v21 = [(HDMHMentalHealthDailyAnalyticsEvent *)self _hasLaunchedHealthAppInInterval:30 withDataSource:v6];
  [v7 setObject:v21 forKeyedSubscript:@"hasLaunchedHealthAppInLastMonth"];

  v22 = [(HDMHMentalHealthDailyAnalyticsEvent *)self _weeksSinceLastHealthAppLaunchWithDataSource:v6];
  [v7 setObject:v22 forKeyedSubscript:@"weeksSinceLastHealthAppLaunch"];

  v23 = [(HDMHMentalHealthDailyAnalyticsEvent *)self _isFeatureOnboardedForFeatureIdentifier:*MEMORY[0x263F09800] dataSource:v6];
  [v7 setObject:v23 forKeyedSubscript:@"isOnboarded"];

  v24 = [(HDMHMentalHealthDailyAnalyticsEvent *)self _weeksSinceOnboardingWithDataSource:v6];
  [v7 setObject:v24 forKeyedSubscript:@"weeksSinceOnboarded"];

  uint64_t v25 = *MEMORY[0x263F097C0];
  v26 = [(HDMHMentalHealthDailyAnalyticsEvent *)self _isFeatureOnboardedForFeatureIdentifier:*MEMORY[0x263F097C0] dataSource:v6];
  [v7 setObject:v26 forKeyedSubscript:@"wereAssessmentsDelivered"];

  v27 = objc_msgSend(NSNumber, "numberWithBool:", -[HKMHSettingsManager hasAnyStateOfMindReminderEnabled](self->_settingsManager, "hasAnyStateOfMindReminderEnabled"));
  [v7 setObject:v27 forKeyedSubscript:@"hasStateOfMindNotificationEnabled"];

  v28 = objc_msgSend(NSNumber, "numberWithBool:", -[HKMHSettingsManager middayNotificationsEnabled](self->_settingsManager, "middayNotificationsEnabled"));
  [v7 setObject:v28 forKeyedSubscript:@"hasStateOfMindMidDayNotificationEnabled"];

  v29 = objc_msgSend(NSNumber, "numberWithBool:", -[HKMHSettingsManager endOfDayNotificationsEnabled](self->_settingsManager, "endOfDayNotificationsEnabled"));
  [v7 setObject:v29 forKeyedSubscript:@"hasStateOfMindEndOfDayNotificationEnabled"];

  v30 = NSNumber;
  v31 = [(HKMHSettingsManager *)self->_settingsManager customReminderSchedule];
  v32 = objc_msgSend(v30, "numberWithInt:", objc_msgSend(v31, "count") != 0);
  [v7 setObject:v32 forKeyedSubscript:@"hasStateOfMindCustomNotificationEnabled"];

  uint64_t v33 = *MEMORY[0x263F09600];
  v34 = [(HDMHMentalHealthDailyAnalyticsEvent *)self _isFeatureEnabledForFeatureIdentifier:v25 dataSource:v6 featureAvailabilityContext:*MEMORY[0x263F09600]];
  [v7 setObject:v34 forKeyedSubscript:@"hasScheduledQuestionnairesEnabled"];

  v35 = [(HDMHMentalHealthDailyAnalyticsEvent *)self _isFeatureEnabledForFeatureIdentifier:*MEMORY[0x263F09808] dataSource:v6 featureAvailabilityContext:v33];
  [v7 setObject:v35 forKeyedSubscript:@"hasUnpleasantLoggingPatternsEnabled"];

  v36 = [(HDMHMentalHealthDailyAnalyticsEvent *)self _hasLoggedStateOfMindInPastNDays:30 withDataSource:v6];
  [v7 setObject:v36 forKeyedSubscript:@"hasLoggedStateOfMindInPast30Days"];

  v37 = [(HDMHMentalHealthDailyAnalyticsEvent *)self _hasLoggedStateOfMindInPastNDays:7 withDataSource:v6];

  [v7 setObject:v37 forKeyedSubscript:@"hasLoggedStateOfMindInPast7Days"];
  return v7;
}

- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  v5 = (void *)MEMORY[0x263EFF9A0];
  id v6 = a3;
  v7 = [v5 dictionary];
  id v8 = [(HDMHMentalHealthDailyAnalyticsEvent *)self _IHAGatedDemographicsFieldsWithDataSource:v6];
  [v7 addEntriesFromDictionary:v8];

  id v9 = [(HDMHMentalHealthDailyAnalyticsEvent *)self _numDaysStateOfMindLoggedInPast30DaysWithDataSource:v6];
  [v7 addEntriesFromDictionary:v9];

  id v10 = [(HDMHMentalHealthDailyAnalyticsEvent *)self _numDaysStateOfMindLoggedInPastDayWithDataSource:v6];
  [v7 addEntriesFromDictionary:v10];

  v11 = [MEMORY[0x263F0A6E8] stateOfMindType];
  v12 = [(HDMHMentalHealthDailyAnalyticsEvent *)self _determineDaysSinceLastSampleWithSampleType:v11 dataSource:v6];
  [v7 setObject:v12 forKeyedSubscript:@"daysSinceLastStateOfMindLogged"];

  v13 = [(HDMHMentalHealthDailyAnalyticsEvent *)self _numAssessmentsCompletedWithDataSource:v6];
  [v7 addEntriesFromDictionary:v13];

  objc_super v14 = [MEMORY[0x263F0A6F8] scoredAssessmentTypeForIdentifier:*MEMORY[0x263F09F90]];
  v15 = [(HDMHMentalHealthDailyAnalyticsEvent *)self _determineDaysSinceLastSampleWithSampleType:v14 dataSource:v6];

  v16 = [MEMORY[0x263F0A6F8] scoredAssessmentTypeForIdentifier:*MEMORY[0x263F09F98]];
  v17 = [(HDMHMentalHealthDailyAnalyticsEvent *)self _determineDaysSinceLastSampleWithSampleType:v16 dataSource:v6];

  if (v15 >= v17) {
    v18 = v17;
  }
  else {
    v18 = v15;
  }
  id v19 = v18;
  [v7 setObject:v19 forKeyedSubscript:@"daysSinceLastAssessment"];

  return v7;
}

- (id)_fetchDeviceContextAnalytics
{
  v31[4] = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v3 = [WeakRetained deviceContextManager];
  v4 = [v3 numberOfDeviceContextsPerDeviceType:0];

  if (v4)
  {
    uint64_t v5 = [v4 objectForKeyedSubscript:&unk_2704B1358];
    id v6 = (void *)v5;
    if (v5) {
      v7 = (void *)v5;
    }
    else {
      v7 = &unk_2704B1370;
    }
    id v8 = v7;

    uint64_t v9 = [v4 objectForKeyedSubscript:&unk_2704B1388];
    id v10 = (void *)v9;
    if (v9) {
      v11 = (void *)v9;
    }
    else {
      v11 = &unk_2704B1370;
    }
    id v12 = v11;

    uint64_t v13 = [v4 objectForKeyedSubscript:&unk_2704B13A0];
    objc_super v14 = (void *)v13;
    if (v13) {
      v15 = (void *)v13;
    }
    else {
      v15 = &unk_2704B1370;
    }
    id v16 = v15;

    uint64_t v17 = [v4 objectForKeyedSubscript:&unk_2704B13B8];
    v18 = (void *)v17;
    if (v17) {
      id v19 = (void *)v17;
    }
    else {
      id v19 = &unk_2704B1370;
    }
    id v20 = v19;

    uint64_t v21 = *MEMORY[0x263F091F0];
    v26[0] = *MEMORY[0x263F091E0];
    v26[1] = v21;
    v29[0] = v8;
    v29[1] = v16;
    uint64_t v27 = *MEMORY[0x263F091F8];
    uint64_t v28 = v27;
    v29[2] = v12;
    v29[3] = v20;
    v22 = [NSDictionary dictionaryWithObjects:v29 forKeys:v26 count:4];
  }
  else
  {
    uint64_t v23 = *MEMORY[0x263F091F0];
    v30[0] = *MEMORY[0x263F091E0];
    v30[1] = v23;
    v31[0] = &unk_2704B1340;
    v31[1] = &unk_2704B1340;
    uint64_t v24 = *MEMORY[0x263F091E8];
    v30[2] = *MEMORY[0x263F091F8];
    v30[3] = v24;
    v31[2] = &unk_2704B1340;
    v31[3] = &unk_2704B1340;
    v22 = [NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:4];
  }

  return v22;
}

- (id)_IHAGatedDemographicsFieldsWithDataSource:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v5 = [v3 healthDataSource];
  id v6 = [v5 biologicalSexWithError:0];

  if (v6)
  {
    v7 = HKAnalyticsPropertyValueForBiologicalSex();
    [v4 setObject:v7 forKeyedSubscript:*MEMORY[0x263F091D8]];
  }
  else
  {
    [v4 setObject:*MEMORY[0x263F09208] forKeyedSubscript:*MEMORY[0x263F091D8]];
  }
  id v8 = [v3 healthDataSource];
  uint64_t v9 = [v3 environmentDataSource];
  id v10 = [v9 currentDate];
  v11 = [v8 ageWithCurrentDate:v10 error:0];

  if (v11) {
    id v12 = v11;
  }
  else {
    id v12 = &unk_2704B1340;
  }
  [v4 setObject:v12 forKeyedSubscript:*MEMORY[0x263F091C8]];
  uint64_t v13 = (void *)[v4 copy];

  return v13;
}

- (id)_featureStatusForFeatureIdentifier:(id)a3 dataSource:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = [a4 healthDataSource];
  uint64_t v9 = [v8 featureStatusProviderForIdentifier:v7];

  id v10 = [v9 featureStatusWithError:a5];

  return v10;
}

- (id)_isFeatureOnboardedForFeatureIdentifier:(id)a3 dataSource:(id)a4
{
  v4 = [(HDMHMentalHealthDailyAnalyticsEvent *)self _featureStatusForFeatureIdentifier:a3 dataSource:a4 error:0];
  uint64_t v5 = v4;
  if (v4)
  {
    objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "isOnboardingRecordPresent"));
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v6 = (id)*MEMORY[0x263F091A8];
  }
  id v7 = v6;

  return v7;
}

- (id)_isFeatureEnabledForFeatureIdentifier:(id)a3 dataSource:(id)a4 featureAvailabilityContext:(id)a5
{
  id v8 = a5;
  uint64_t v9 = [(HDMHMentalHealthDailyAnalyticsEvent *)self _featureStatusForFeatureIdentifier:a3 dataSource:a4 error:0];
  id v10 = v9;
  if (v9)
  {
    v11 = [v9 objectForKeyedSubscript:v8];
    uint64_t v12 = [v11 isRequirementSatisfiedWithIdentifier:*MEMORY[0x263F09678]];

    id v13 = [NSNumber numberWithBool:v12];
  }
  else
  {
    id v13 = (id)*MEMORY[0x263F091A8];
  }
  objc_super v14 = v13;

  return v14;
}

- (id)_hasLaunchedHealthAppInInterval:(int64_t)a3 withDataSource:(id)a4
{
  id v6 = a4;
  id v7 = [(HDMHMentalHealthDailyAnalyticsEvent *)self _healthAppLastOpenedDate];
  if (v7)
  {
    id v8 = [v6 environmentDataSource];
    uint64_t v9 = [v8 currentDate];

    id v10 = [v6 environmentDataSource];
    v11 = [v10 calendarCache];
    uint64_t v12 = [v11 currentCalendar];

    int64_t v13 = [(HDMHMentalHealthDailyAnalyticsEvent *)self numberOfDaysBetweenStartDate:v7 endDate:v9 withCalendar:v12];
    BOOL v14 = v13 > -1 && v13 <= a3;
    v15 = (void *)MEMORY[0x263EFFA80];
    if (v14) {
      v15 = (void *)MEMORY[0x263EFFA88];
    }
    id v16 = v15;
  }
  else
  {
    id v16 = (id)*MEMORY[0x263F091A8];
  }

  return v16;
}

- (id)_weeksSinceLastHealthAppLaunchWithDataSource:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HDMHMentalHealthDailyAnalyticsEvent *)self _healthAppLastOpenedDate];
  if (v5)
  {
    objc_msgSend(NSNumber, "numberWithInteger:", -[HDMHMentalHealthDailyAnalyticsEvent _bucketedWeeksSinceDate:dataSource:](self, "_bucketedWeeksSinceDate:dataSource:", v5, v4));
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v6 = (id)*MEMORY[0x263F091B0];
  }
  id v7 = v6;

  return v7;
}

- (id)_healthAppLastOpenedDate
{
  return (id)[(NSUserDefaults *)self->_userDefaults hk_dateForKey:*MEMORY[0x263F0ACF0]];
}

- (id)_stateOfMindDaySummaryEnumeratorForPastNDays:(int64_t)a3 withDataSource:(id)a4
{
  id v6 = a4;
  id v7 = [v6 environmentDataSource];
  id v8 = [v7 currentDate];

  uint64_t v9 = [v6 environmentDataSource];

  id v10 = [v9 calendarCache];
  v11 = [v10 currentCalendar];

  uint64_t v12 = objc_msgSend(v8, "hk_dayIndexWithCalendar:", v11) - a3;
  int64_t v13 = [HDMHDaySummaryEnumerator alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  LOBYTE(v17) = 1;
  v15 = -[HDMHDaySummaryEnumerator initWithProfile:dayIndexRange:gregorianCalendar:predicate:pendingDailyStateOfMind:ascending:](v13, "initWithProfile:dayIndexRange:gregorianCalendar:predicate:pendingDailyStateOfMind:ascending:", WeakRetained, v12, a3, v11, 0, 0, v17);

  return v15;
}

- (id)_numDaysStateOfMindLoggedInPast30DaysWithDataSource:(id)a3
{
  v40[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(HDMHMentalHealthDailyAnalyticsEvent *)self _stateOfMindDaySummaryEnumeratorForPastNDays:30 withDataSource:v4];
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x2020000000;
  uint64_t v36 = 0;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  uint64_t v32 = 0;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  uint64_t v28 = 0;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  v15[8] = &v21;
  id v16 = 0;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __91__HDMHMentalHealthDailyAnalyticsEvent__numDaysStateOfMindLoggedInPast30DaysWithDataSource___block_invoke;
  v15[3] = &unk_2653F0770;
  v15[4] = &v17;
  v15[5] = &v33;
  v15[6] = &v29;
  v15[7] = &v25;
  char v6 = [v5 enumerateWithError:&v16 handler:v15];
  id v7 = v16;
  if (v18[3] <= 29) {
    v22[3] = 0;
  }
  if (v6)
  {
    v37[0] = @"numDaysDailyStateOfMindLoggedPast30Days";
    id v8 = [NSNumber numberWithInteger:v34[3]];
    v38[0] = v8;
    v37[1] = @"numDaysMomentaryStateOfMindLoggedPast30Days";
    uint64_t v9 = [NSNumber numberWithInteger:v30[3]];
    v38[1] = v9;
    v37[2] = @"numMomentaryStateOfMindLogsPerDayPast30DaysMax";
    id v10 = [NSNumber numberWithInteger:v26[3]];
    v38[2] = v10;
    v37[3] = @"numMomentaryStateOfMindLogsPerDayPast30DaysMin";
    v11 = [NSNumber numberWithInteger:v22[3]];
    v38[3] = v11;
    uint64_t v12 = [NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:4];
  }
  else
  {
    uint64_t v13 = *MEMORY[0x263F091B0];
    v39[0] = @"numDaysDailyStateOfMindLoggedPast30Days";
    v39[1] = @"numDaysMomentaryStateOfMindLoggedPast30Days";
    v40[0] = v13;
    v40[1] = v13;
    v39[2] = @"numMomentaryStateOfMindLogsPerDayPast30DaysMax";
    v39[3] = @"numMomentaryStateOfMindLogsPerDayPast30DaysMin";
    v40[2] = v13;
    v40[3] = v13;
    uint64_t v12 = [NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:4];
  }

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);

  return v12;
}

void __91__HDMHMentalHealthDailyAnalyticsEvent__numDaysStateOfMindLoggedInPast30DaysWithDataSource___block_invoke(void *a1, void *a2)
{
  ++*(void *)(*(void *)(a1[4] + 8) + 24);
  id v3 = a2;
  id v4 = [v3 dailyStateOfMind];

  if (v4) {
    ++*(void *)(*(void *)(a1[5] + 8) + 24);
  }
  uint64_t v5 = [v3 momentaryStatesOfMind];

  unint64_t v6 = [v5 count];
  if (v6) {
    ++*(void *)(*(void *)(a1[6] + 8) + 24);
  }
  uint64_t v7 = *(void *)(a1[7] + 8);
  unint64_t v8 = *(void *)(v7 + 24);
  if (v8 <= v6) {
    unint64_t v8 = v6;
  }
  *(void *)(v7 + 24) = v8;
  uint64_t v9 = *(void *)(a1[8] + 8);
  unint64_t v10 = *(void *)(v9 + 24);
  if (v10 >= v6) {
    unint64_t v10 = v6;
  }
  *(void *)(v9 + 24) = v10;
}

- (id)_numDaysStateOfMindLoggedInPastDayWithDataSource:(id)a3
{
  v22[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(HDMHMentalHealthDailyAnalyticsEvent *)self _stateOfMindDaySummaryEnumeratorForPastNDays:1 withDataSource:v4];
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  v13[4] = &v15;
  id v14 = 0;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __88__HDMHMentalHealthDailyAnalyticsEvent__numDaysStateOfMindLoggedInPastDayWithDataSource___block_invoke;
  v13[3] = &unk_2653F0798;
  char v6 = [v5 enumerateWithError:&v14 handler:v13];
  id v7 = v14;
  unint64_t v8 = [(HDMHMentalHealthDailyAnalyticsEvent *)self _numDailyStateOfMindLogsInPastNDays:1 withDataSource:v4];
  if (v6)
  {
    v19[0] = @"numMomentaryStateOfMindLogsPastDay";
    uint64_t v9 = [NSNumber numberWithInteger:v16[3]];
    v19[1] = @"numDailyStateOfMindLogsPastDay";
    v20[0] = v9;
    v20[1] = v8;
    unint64_t v10 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
  }
  else
  {
    uint64_t v11 = *MEMORY[0x263F091B0];
    v21[0] = @"numMomentaryStateOfMindLogsPastDay";
    v21[1] = @"numDailyStateOfMindLogsPastDay";
    v22[0] = v11;
    v22[1] = v11;
    unint64_t v10 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
  }

  _Block_object_dispose(&v15, 8);
  return v10;
}

void __88__HDMHMentalHealthDailyAnalyticsEvent__numDaysStateOfMindLoggedInPastDayWithDataSource___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 momentaryStatesOfMind];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 count];
}

- (id)_hasLoggedStateOfMindInPastNDays:(int64_t)a3 withDataSource:(id)a4
{
  id v6 = a4;
  id v7 = [(HDMHMentalHealthDailyAnalyticsEvent *)self _stateOfMindDaySummaryEnumeratorForPastNDays:a3 withDataSource:v6];
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__4;
  uint64_t v18 = __Block_byref_object_dispose__4;
  id v19 = (id)MEMORY[0x263EFFA80];
  v12[4] = &v14;
  id v13 = 0;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __87__HDMHMentalHealthDailyAnalyticsEvent__hasLoggedStateOfMindInPastNDays_withDataSource___block_invoke;
  v12[3] = &unk_2653F0798;
  LODWORD(self) = [v7 enumerateWithError:&v13 handler:v12];
  id v8 = v13;
  uint64_t v9 = (id *)(v15 + 5);
  if (!self) {
    uint64_t v9 = (id *)MEMORY[0x263F091A8];
  }
  id v10 = *v9;

  _Block_object_dispose(&v14, 8);
  return v10;
}

void __87__HDMHMentalHealthDailyAnalyticsEvent__hasLoggedStateOfMindInPastNDays_withDataSource___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [v7 dailyStateOfMind];
  if (v3)
  {
  }
  else
  {
    id v4 = [v7 momentaryStatesOfMind];

    if (!v4) {
      goto LABEL_5;
    }
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = MEMORY[0x263EFFA88];

LABEL_5:
}

- (id)_enumeratorForPastNDays:(int64_t)a3 withDataSource:(id)a4 forSampleType:(id)a5 withExtraPredicate:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = [v12 environmentDataSource];
  uint64_t v14 = [v13 calendarCache];
  uint64_t v15 = [v14 currentCalendar];

  uint64_t v16 = [v12 environmentDataSource];

  uint64_t v17 = [v16 currentDate];

  uint64_t v18 = [v15 dateByAddingUnit:16 value:-a3 toDate:v17 options:0];
  id v19 = objc_alloc(MEMORY[0x263F08798]);
  uint64_t v20 = (void *)[v19 initWithStartDate:v18 duration:(double)(*MEMORY[0x263F09218] * a3)];
  uint64_t v21 = objc_msgSend((id)objc_msgSend(v11, "dataObjectClass"), "hd_dataEntityClass");
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  uint64_t v23 = [v21 entityEnumeratorWithProfile:WeakRetained];

  uint64_t v24 = (void *)MEMORY[0x263F434D0];
  uint64_t v25 = HDSampleEntityPredicateForDateInterval();

  v26 = [v24 compoundPredicateWithPredicate:v25 otherPredicate:v10];

  [v23 setPredicate:v26];
  return v23;
}

- (id)_numAssessmentsInPastNDays:(int64_t)a3 withDataSource:(id)a4
{
  v25[2] = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x263F0A6F8] scoredAssessmentTypeForIdentifier:*MEMORY[0x263F09F98]];
  id v8 = [(HDMHMentalHealthDailyAnalyticsEvent *)self _enumeratorForPastNDays:a3 withDataSource:v6 forSampleType:v7 withExtraPredicate:0];

  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  v14[5] = &v16;
  id v15 = 0;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __81__HDMHMentalHealthDailyAnalyticsEvent__numAssessmentsInPastNDays_withDataSource___block_invoke;
  v14[3] = &unk_2653F07C0;
  v14[4] = &v20;
  LOBYTE(v7) = [v8 enumerateWithError:&v15 handler:v14];
  id v9 = v15;
  if (v7)
  {
    id v10 = [NSNumber numberWithInteger:v21[3]];
    v24[0] = v10;
    id v11 = [NSNumber numberWithInteger:v17[3]];
    v24[1] = v11;
    id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:2];
  }
  else
  {
    v25[0] = *MEMORY[0x263F091B0];
    v25[1] = v25[0];
    id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:2];
  }

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);

  return v12;
}

uint64_t __81__HDMHMentalHealthDailyAnalyticsEvent__numAssessmentsInPastNDays_withDataSource___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }

  return 1;
}

- (id)_numAssessmentsCompletedWithDataSource:(id)a3
{
  v14[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(HDMHMentalHealthDailyAnalyticsEvent *)self _numAssessmentsInPastNDays:30 withDataSource:v4];
  id v6 = [(HDMHMentalHealthDailyAnalyticsEvent *)self _numAssessmentsInPastNDays:180 withDataSource:v4];

  v13[0] = @"numDepressionAssessmentsCompletedPast30Days";
  uint64_t v7 = [v5 objectAtIndexedSubscript:0];
  v14[0] = v7;
  v13[1] = @"numAnxietyAssessmentsCompletedPast30Days";
  id v8 = [v5 objectAtIndexedSubscript:1];
  v14[1] = v8;
  v13[2] = @"numDepressionAssessmentsCompletedPast180Days";
  id v9 = [v6 objectAtIndexedSubscript:0];
  v14[2] = v9;
  v13[3] = @"numAnxietyAssessmentsCompletedPast180Days";
  id v10 = [v6 objectAtIndexedSubscript:1];
  v14[3] = v10;
  id v11 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:4];

  return v11;
}

- (id)_numDailyStateOfMindLogsInPastNDays:(int64_t)a3 withDataSource:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x263F43370] predicateForReflectiveInterval:2 equals:1];
  id v8 = [MEMORY[0x263F0A6E8] stateOfMindType];
  id v9 = [(HDMHMentalHealthDailyAnalyticsEvent *)self _enumeratorForPastNDays:a3 withDataSource:v6 forSampleType:v8 withExtraPredicate:v7];

  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  v17[4] = &v19;
  id v18 = 0;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __90__HDMHMentalHealthDailyAnalyticsEvent__numDailyStateOfMindLogsInPastNDays_withDataSource___block_invoke;
  v17[3] = &unk_2653F07E8;
  char v10 = [v9 enumerateWithError:&v18 handler:v17];
  id v11 = v18;
  if (v11)
  {
    _HKInitializeLogging();
    id v12 = (id)*MEMORY[0x263F09938];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = objc_opt_class();
      [(HDMHMentalHealthDailyAnalyticsEvent *)v13 _numDailyStateOfMindLogsInPastNDays:(uint64_t)v23 withDataSource:v12];
    }
  }
  if (v10)
  {
    id v14 = [NSNumber numberWithInteger:v20[3]];
  }
  else
  {
    id v14 = (id)*MEMORY[0x263F091B0];
  }
  id v15 = v14;

  _Block_object_dispose(&v19, 8);
  return v15;
}

uint64_t __90__HDMHMentalHealthDailyAnalyticsEvent__numDailyStateOfMindLogsInPastNDays_withDataSource___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  return 1;
}

- (id)_determineDaysSinceLastSampleWithSampleType:(id)a3 dataSource:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v6 environmentDataSource];
  id v9 = [v8 currentDate];

  char v10 = [v6 environmentDataSource];

  id v11 = [v10 calendarCache];
  id v12 = [v11 currentCalendar];

  id v13 = (void *)MEMORY[0x263F43318];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v22 = 0;
  id v15 = [v13 mostRecentSampleWithType:v7 profile:WeakRetained encodingOptions:0 predicate:0 anchor:0 error:&v22];

  id v16 = v22;
  if (v16
    && (_HKInitializeLogging(),
        uint64_t v17 = (void *)*MEMORY[0x263F09938],
        os_log_type_enabled((os_log_t)*MEMORY[0x263F09938], OS_LOG_TYPE_ERROR)))
  {
    -[HDMHMentalHealthDailyAnalyticsEvent _determineDaysSinceLastSampleWithSampleType:dataSource:](v17, (uint64_t)self, (uint64_t)v16);
    if (v15) {
      goto LABEL_4;
    }
  }
  else if (v15)
  {
LABEL_4:
    id v18 = NSNumber;
    uint64_t v19 = [v15 startDate];
    objc_msgSend(v18, "numberWithInteger:", -[HDMHMentalHealthDailyAnalyticsEvent numberOfDaysBetweenStartDate:endDate:withCalendar:](self, "numberOfDaysBetweenStartDate:endDate:withCalendar:", v19, v9, v12));
    id v20 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_7;
  }
  id v20 = (id)*MEMORY[0x263F091B0];
LABEL_7:

  return v20;
}

- (int64_t)numberOfDaysBetweenStartDate:(id)a3 endDate:(id)a4 withCalendar:(id)a5
{
  uint64_t v5 = [a5 components:16 fromDate:a3 toDate:a4 options:0];
  int64_t v6 = [v5 day];

  return v6;
}

- (id)_weeksSinceOnboardingWithDataSource:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HDMHMentalHealthDailyAnalyticsEvent *)self _featureStatusForFeatureIdentifier:*MEMORY[0x263F09800] dataSource:v4 error:0];
  int64_t v6 = v5;
  if (v5)
  {
    if ([v5 isOnboardingRecordPresent])
    {
      id v7 = NSNumber;
      id v8 = [v6 onboardingRecord];
      id v9 = [v8 onboardingCompletion];
      char v10 = [v9 completionDate];
      objc_msgSend(v7, "numberWithInteger:", -[HDMHMentalHealthDailyAnalyticsEvent _bucketedWeeksSinceDate:dataSource:](self, "_bucketedWeeksSinceDate:dataSource:", v10, v4));
      id v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v11 = 0;
    }
  }
  else
  {
    id v11 = (id)*MEMORY[0x263F091A8];
  }

  return v11;
}

- (int64_t)_bucketedWeeksSinceDate:(id)a3 dataSource:(id)a4
{
  id v5 = a3;
  int64_t v6 = [a4 environmentDataSource];
  id v7 = [v6 bucketedNumberOfWeeksSinceDate:v5];

  id v8 = (void *)*MEMORY[0x263F091B0];
  if (v7) {
    id v8 = v7;
  }
  id v9 = v8;

  int64_t v10 = [v9 integerValue];
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_settingsManager, 0);
  objc_destroyWeak((id *)&self->_profile);
}

- (void)_numDailyStateOfMindLogsInPastNDays:(uint64_t)a3 withDataSource:(NSObject *)a4 .cold.1(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138543618;
  *(void *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(void *)(a3 + 14) = a2;
  id v6 = a1;
  _os_log_error_impl(&dword_255F2E000, a4, OS_LOG_TYPE_ERROR, "[%{public}@] Error retrieving daily state of mind logs: %@", (uint8_t *)a3, 0x16u);
}

- (void)_determineDaysSinceLastSampleWithSampleType:(uint64_t)a3 dataSource:.cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a1;
  int v6 = 138543618;
  id v7 = (id)objc_opt_class();
  __int16 v8 = 2112;
  uint64_t v9 = a3;
  id v5 = v7;
  _os_log_error_impl(&dword_255F2E000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] Error retrieving days since last sample: %@", (uint8_t *)&v6, 0x16u);
}

@end