@interface HDSPAnalyticsDailyReportBuilder
+ (unint64_t)_stageDurationPercentage:(double)a3 ofTotalDuration:(double)a4;
- ($0AC6E346AE4835514AAA8AC86D8F4844)morningIndexRange;
- (BOOL)_changedSchedule:(id)a3 withinNumberOfDays:(unint64_t)a4 currentDate:(id)a5 calendar:(id)a6;
- (BOOL)_didInteractWithWindDownActionsWithinLastTwoDays;
- (BOOL)_woreWatchToSleepLastNight;
- (HDSPAnalyticsDailyReportBuilder)initWithEnvironment:(id)a3 daySummaries:(id)a4 breathingDisturbanceSamples:(id)a5 sleepApneaEventSamples:(id)a6 sleepApneaFeatureStatus:(id)a7 morningIndexRange:(id)a8;
- (HDSPAnalyticsDailyReportBuilder)initWithEnvironment:(id)a3 daySummaries:(id)a4 morningIndexRange:(id)a5;
- (HDSPEnvironment)environment;
- (HDSPSleepApneaAnalyticsBuilder)sleepApneaAnalyticsBuilder;
- (NSArray)daySummaries;
- (double)_bucketedSleepDurationLastNight;
- (double)_lastNightsDurationForSleepStage:(int64_t)a3;
- (double)_sleepDurationLastNightIncludingAwake:(BOOL)a3;
- (id)_biologicalSex;
- (id)_dailyReportEvent;
- (id)_dateOfLastSuccessfulBreathingDisturbanceAnalysis;
- (id)_userAgeForCurrentDate:(id)a3;
- (id)_weeksSinceOnboardDate:(id)a3 currentDate:(id)a4 calendar:(id)a5;
- (id)_windDownEvents;
- (id)analyticsManager;
- (id)analyticsStore;
- (id)buildReports;
- (id)currentDate;
- (id)healthStore;
- (id)sleepFocusConfiguration;
- (id)sleepSchedule;
- (id)sleepSettings;
- (int64_t)_daysWatchWornToSleepOverLastNumberOfDays:(int64_t)a3 excludeWeekdays:(BOOL)a4 calendar:(id)a5;
@end

@implementation HDSPAnalyticsDailyReportBuilder

- (HDSPAnalyticsDailyReportBuilder)initWithEnvironment:(id)a3 daySummaries:(id)a4 morningIndexRange:(id)a5
{
  int64_t var1 = a5.var1;
  int64_t var0 = a5.var0;
  id v9 = a3;
  id v10 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HDSPAnalyticsDailyReportBuilder;
  v11 = [(HDSPAnalyticsDailyReportBuilder *)&v18 init];
  v12 = v11;
  v13 = 0;
  if (v10 && v11)
  {
    if (var0 == *MEMORY[0x263F094E8] && var1 == *(void *)(MEMORY[0x263F094E8] + 8))
    {
      v13 = 0;
    }
    else
    {
      objc_storeWeak((id *)&v11->_environment, v9);
      uint64_t v15 = [v10 copy];
      daySummaries = v12->_daySummaries;
      v12->_daySummaries = (NSArray *)v15;

      v12->_morningIndexRange.start = var0;
      v12->_morningIndexRange.duration = var1;
      v13 = v12;
    }
  }

  return v13;
}

- (HDSPAnalyticsDailyReportBuilder)initWithEnvironment:(id)a3 daySummaries:(id)a4 breathingDisturbanceSamples:(id)a5 sleepApneaEventSamples:(id)a6 sleepApneaFeatureStatus:(id)a7 morningIndexRange:(id)a8
{
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v24 = a4;
  id v16 = a3;
  v17 = [HDSPSleepApneaAnalyticsBuilder alloc];
  objc_super v18 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
  v19 = [(HDSPAnalyticsDailyReportBuilder *)self _dateOfLastSuccessfulBreathingDisturbanceAnalysis];
  v20 = -[HDSPSleepApneaAnalyticsBuilder initWithBreathingDisturbanceSamples:sleepApneaEventSamples:sleepApneaFeatureStatus:morningIndexRange:gregorianCalendar:dateOfLastAnalysis:currentDateProvider:](v17, "initWithBreathingDisturbanceSamples:sleepApneaEventSamples:sleepApneaFeatureStatus:morningIndexRange:gregorianCalendar:dateOfLastAnalysis:currentDateProvider:", v15, v14, v13, a8.var0, a8.var1, v18, v19, &__block_literal_global_2);

  sleepApneaAnalyticsBuilder = self->_sleepApneaAnalyticsBuilder;
  self->_sleepApneaAnalyticsBuilder = v20;

  v22 = -[HDSPAnalyticsDailyReportBuilder initWithEnvironment:daySummaries:morningIndexRange:](self, "initWithEnvironment:daySummaries:morningIndexRange:", v16, v24, a8.var0, a8.var1);
  return v22;
}

uint64_t __161__HDSPAnalyticsDailyReportBuilder_initWithEnvironment_daySummaries_breathingDisturbanceSamples_sleepApneaEventSamples_sleepApneaFeatureStatus_morningIndexRange___block_invoke()
{
  return [MEMORY[0x263EFF910] now];
}

- (id)buildReports
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  v2 = HKSPLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = objc_opt_class();
    id v4 = v3;
    v5 = [(HDSPAnalyticsDailyReportBuilder *)self daySummaries];
    uint64_t v6 = [v5 count];
    [(HDSPAnalyticsDailyReportBuilder *)self morningIndexRange];
    v7 = NSStringFromHKDayIndexRange();
    *(_DWORD *)buf = 138543874;
    v30 = v3;
    __int16 v31 = 2050;
    uint64_t v32 = v6;
    __int16 v33 = 2114;
    v34 = v7;
    _os_log_impl(&dword_221A52000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Building daily analytics report from %{public}lu summaries in range %{public}@", buf, 0x20u);
  }
  if (HKShowSensitiveLogItems())
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v8 = [(HDSPAnalyticsDailyReportBuilder *)self daySummaries];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v25 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = HKSPLogForCategory();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            id v14 = objc_opt_class();
            id v15 = v14;
            id v16 = HKSensitiveLogItem();
            *(_DWORD *)buf = 138543618;
            v30 = v14;
            __int16 v31 = 2114;
            uint64_t v32 = (uint64_t)v16;
            _os_log_impl(&dword_221A52000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Summary: %{public}@", buf, 0x16u);
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v10);
    }
  }
  id v17 = objc_alloc_init(MEMORY[0x263EFF980]);
  objc_super v18 = [(HDSPAnalyticsDailyReportBuilder *)self _dailyReportEvent];
  [v17 addObject:v18];

  v19 = [(HDSPAnalyticsDailyReportBuilder *)self _windDownEvents];
  [v17 addObjectsFromArray:v19];

  v20 = [(HDSPAnalyticsDailyReportBuilder *)self analyticsStore];
  [v20 markAllActionsAsCollected];

  v21 = (void *)[v17 copy];

  return v21;
}

- (id)currentDate
{
  v2 = [(HDSPAnalyticsDailyReportBuilder *)self environment];
  v3 = [v2 currentDateProvider];
  id v4 = v3[2]();

  return v4;
}

- (id)healthStore
{
  v2 = [(HDSPAnalyticsDailyReportBuilder *)self environment];
  v3 = [v2 healthStoreProvider];
  id v4 = [v3 healthStore];

  return v4;
}

- (id)sleepSchedule
{
  v2 = [(HDSPAnalyticsDailyReportBuilder *)self environment];
  v3 = [v2 sleepScheduleModelManager];
  id v4 = [v3 sleepSchedule];

  return v4;
}

- (id)sleepSettings
{
  v2 = [(HDSPAnalyticsDailyReportBuilder *)self environment];
  v3 = [v2 sleepScheduleModelManager];
  id v4 = [v3 sleepSettings];

  return v4;
}

- (id)sleepFocusConfiguration
{
  v2 = [(HDSPAnalyticsDailyReportBuilder *)self environment];
  v3 = [v2 sleepModeManager];
  id v4 = [v3 sleepFocusModeBridge];
  v5 = [v4 sleepFocusConfiguration:0];

  return v5;
}

- (id)analyticsManager
{
  v2 = [(HDSPAnalyticsDailyReportBuilder *)self environment];
  v3 = [v2 analyticsManager];
  id v4 = [v3 analyticsManager];

  return v4;
}

- (id)analyticsStore
{
  v2 = [(HDSPAnalyticsDailyReportBuilder *)self analyticsManager];
  v3 = [v2 analyticsStore];

  return v3;
}

- (id)_dailyReportEvent
{
  uint64_t v3 = [(HDSPAnalyticsDailyReportBuilder *)self currentDate];
  id v4 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
  v5 = (void *)MEMORY[0x263F75F50];
  uint64_t v6 = [(HDSPAnalyticsDailyReportBuilder *)self daySummaries];
  uint64_t v7 = [(HDSPAnalyticsDailyReportBuilder *)self morningIndexRange];
  v82 = objc_msgSend(v5, "sleepMetricsForDaySummaries:inMorningIndexRange:", v6, v7, v8);

  id v9 = objc_alloc_init(MEMORY[0x263F75D98]);
  uint64_t v10 = [(HDSPAnalyticsDailyReportBuilder *)self sleepSchedule];
  uint64_t v11 = [(HDSPAnalyticsDailyReportBuilder *)self sleepSettings];
  v12 = [(HDSPAnalyticsDailyReportBuilder *)self analyticsManager];
  objc_msgSend(v9, "setIsImproveHealthAndActivitySubmissionAllowed:", objc_msgSend(v12, "isImproveHealthAndActivitySubmissionAllowed"));

  id v13 = [(HDSPAnalyticsDailyReportBuilder *)self _userAgeForCurrentDate:v3];
  [v9 setUserAge:v13];

  id v14 = [(HDSPAnalyticsDailyReportBuilder *)self _biologicalSex];
  [v9 setBiologicalSex:v14];

  id v15 = [MEMORY[0x263F75DA0] activePairedWatchProductType];
  [v9 setActiveWatchProductType:v15];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  id v17 = [WeakRetained sleepScheduleModelManager];
  objc_super v18 = [v17 sleepEventRecord];

  v19 = [v18 sleepCoachingOnboardingFirstCompletedDate];
  uint64_t v20 = [(HDSPAnalyticsDailyReportBuilder *)self _weeksSinceOnboardDate:v19 currentDate:v3 calendar:v4];

  v21 = [v18 sleepTrackingOnboardingFirstCompletedDate];
  uint64_t v22 = [(HDSPAnalyticsDailyReportBuilder *)self _weeksSinceOnboardDate:v21 currentDate:v3 calendar:v4];

  v23 = [v18 sleepWindDownShortcutsOnboardingFirstCompletedDate];
  v76 = (void *)v3;
  uint64_t v24 = [(HDSPAnalyticsDailyReportBuilder *)self _weeksSinceOnboardDate:v23 currentDate:v3 calendar:v4];

  [v9 setWeeksSinceOnboardedSleepSchedule:v20];
  v78 = (void *)v22;
  [v9 setWeeksSinceOnboardedSleepTracking:v22];
  v77 = (void *)v24;
  [v9 setWeeksSinceOnboardedWindDownActions:v24];
  if (v20) {
    uint64_t v25 = 0;
  }
  else {
    uint64_t v25 = [v10 hasOccurrences];
  }
  [v9 setScheduleMigration:v25];
  [v10 sleepDurationGoal];
  objc_msgSend(v9, "setSleepGoal:");
  objc_msgSend(v9, "setWatchSleepTrackingEnabled:", objc_msgSend(v11, "sleepTracking"));
  objc_msgSend(v9, "setTimeInBedTrackingEnabled:", objc_msgSend(v11, "timeInBedTracking"));
  objc_msgSend(v9, "setBedTimeWindDownRemindersEnabled:", objc_msgSend(v11, "bedtimeReminders"));
  objc_msgSend(v9, "setWakeUpResultsEnabled:", objc_msgSend(v11, "wakeUpResults"));
  objc_msgSend(v9, "setScheduledSleepModeEnabled:", objc_msgSend(v11, "scheduledSleepMode"));
  objc_msgSend(v9, "setChargeRemindersEnabled:", objc_msgSend(v11, "chargingReminders"));
  objc_msgSend(v9, "setInteractedWithWindDownLast24Hrs:", -[HDSPAnalyticsDailyReportBuilder _didInteractWithWindDownActionsWithinLastTwoDays](self, "_didInteractWithWindDownActionsWithinLastTwoDays"));
  objc_msgSend(v9, "setUseSleepScreen:", ((unint64_t)objc_msgSend(v11, "sleepModeOptions") >> 14) & 1);
  objc_msgSend(v9, "setMaxSleepCoachingVersionOnboarded:", objc_msgSend(v18, "sleepCoachingOnboardingCompletedVersion"));
  objc_msgSend(v9, "setMaxSleepTrackingVersionOnboarded:", objc_msgSend(v18, "sleepTrackingOnboardingCompletedVersion"));
  long long v26 = [(HDSPAnalyticsDailyReportBuilder *)self sleepFocusConfiguration];
  v80 = v18;
  v81 = v11;
  v79 = (void *)v20;
  v75 = v26;
  if ([v26 hasSleepFocusMode]) {
    BOOL v27 = [v26 state] != 1;
  }
  else {
    BOOL v27 = 0;
  }
  [v9 setHasSleepFocusConfigured:v27];
  v28 = [v10 occurrenceOnDay:2];
  [v9 setScheduleMonday:v28 != 0];
  v29 = [v28 alarmConfiguration];
  objc_msgSend(v9, "setAlarmMonday:", objc_msgSend(v29, "isEnabled"));

  v30 = [v28 alarmConfiguration];
  __int16 v31 = [v30 toneIdentifier];
  [v9 setHapticToneIdentifierMonday:v31];

  v74 = v28;
  objc_msgSend(v9, "setIsDefaultScheduleMonday:", objc_msgSend(v28, "usesDefaultBedtimeAndWakeUpComponents"));
  uint64_t v32 = [v10 occurrenceOnDay:3];
  [v9 setScheduleTuesday:v32 != 0];
  __int16 v33 = [v32 alarmConfiguration];
  objc_msgSend(v9, "setAlarmTuesday:", objc_msgSend(v33, "isEnabled"));

  v34 = [v32 alarmConfiguration];
  uint64_t v35 = [v34 toneIdentifier];
  [v9 setHapticToneIdentifierTuesday:v35];

  v73 = v32;
  objc_msgSend(v9, "setIsDefaultScheduleTuesday:", objc_msgSend(v32, "usesDefaultBedtimeAndWakeUpComponents"));
  v36 = [v10 occurrenceOnDay:4];
  [v9 setScheduleWednesday:v36 != 0];
  v37 = [v36 alarmConfiguration];
  objc_msgSend(v9, "setAlarmWednesday:", objc_msgSend(v37, "isEnabled"));

  v38 = [v36 alarmConfiguration];
  [v38 toneIdentifier];
  v40 = v39 = v10;
  [v9 setHapticToneIdentifierWednesday:v40];

  v72 = v36;
  objc_msgSend(v9, "setIsDefaultScheduleWednesday:", objc_msgSend(v36, "usesDefaultBedtimeAndWakeUpComponents"));
  v41 = [v39 occurrenceOnDay:5];
  [v9 setScheduleThursday:v41 != 0];
  v42 = [v41 alarmConfiguration];
  objc_msgSend(v9, "setAlarmThursday:", objc_msgSend(v42, "isEnabled"));

  v43 = [v41 alarmConfiguration];
  v44 = [v43 toneIdentifier];
  [v9 setHapticToneIdentifierThursday:v44];

  v70 = v41;
  objc_msgSend(v9, "setIsDefaultScheduleThursday:", objc_msgSend(v41, "usesDefaultBedtimeAndWakeUpComponents"));
  v45 = [v39 occurrenceOnDay:6];
  [v9 setScheduleFriday:v45 != 0];
  v46 = [v45 alarmConfiguration];
  objc_msgSend(v9, "setAlarmFriday:", objc_msgSend(v46, "isEnabled"));

  v47 = [v45 alarmConfiguration];
  v48 = [v47 toneIdentifier];
  [v9 setHapticToneIdentifierFriday:v48];

  v69 = v45;
  objc_msgSend(v9, "setIsDefaultScheduleFriday:", objc_msgSend(v45, "usesDefaultBedtimeAndWakeUpComponents"));
  v49 = [v39 occurrenceOnDay:7];
  [v9 setScheduleSaturday:v49 != 0];
  v50 = [v49 alarmConfiguration];
  objc_msgSend(v9, "setAlarmSaturday:", objc_msgSend(v50, "isEnabled"));

  v51 = [v49 alarmConfiguration];
  v52 = [v51 toneIdentifier];
  [v9 setHapticToneIdentifierSaturday:v52];

  objc_msgSend(v9, "setIsDefaultScheduleSaturday:", objc_msgSend(v49, "usesDefaultBedtimeAndWakeUpComponents"));
  v53 = [v39 occurrenceOnDay:1];
  [v9 setScheduleSunday:v53 != 0];
  v54 = [v53 alarmConfiguration];
  objc_msgSend(v9, "setAlarmSunday:", objc_msgSend(v54, "isEnabled"));

  v55 = [v53 alarmConfiguration];
  v56 = [v55 toneIdentifier];
  [v9 setHapticToneIdentifierSunday:v56];

  objc_msgSend(v9, "setIsDefaultScheduleSunday:", objc_msgSend(v53, "usesDefaultBedtimeAndWakeUpComponents"));
  objc_msgSend(v9, "setScheduleDisabled:", objc_msgSend(v39, "isEnabled") ^ 1);
  objc_msgSend(v9, "setScheduleChangePast24Hours:", -[HDSPAnalyticsDailyReportBuilder _changedSchedule:withinNumberOfDays:currentDate:calendar:](self, "_changedSchedule:withinNumberOfDays:currentDate:calendar:", v39, 1, v76, v4));
  v71 = v39;
  objc_msgSend(v9, "setScheduleChangePast7days:", -[HDSPAnalyticsDailyReportBuilder _changedSchedule:withinNumberOfDays:currentDate:calendar:](self, "_changedSchedule:withinNumberOfDays:currentDate:calendar:", v39, 7, v76, v4));
  v57 = [v82 standardDeviationActualTimeAsleep];
  [v9 setStddevActualTimeAsleep:v57];

  v58 = [v82 standardDeviationScheduledTimeAsleep];
  [v9 setStddevScheduledTimeAsleep:v58];

  v59 = [v82 standardDeviationActualVsScheduledTimeAsleep];
  [v9 setStddevActualVsScheduledTimeAsleep:v59];

  objc_msgSend(v9, "setDaysWornWatchToSleepInLast7Days:", -[HDSPAnalyticsDailyReportBuilder _daysWatchWornToSleepOverLastNumberOfDays:excludeWeekdays:calendar:](self, "_daysWatchWornToSleepOverLastNumberOfDays:excludeWeekdays:calendar:", 7, 0, v4));
  objc_msgSend(v9, "setDaysWornWatchToSleepInLast30Days:", -[HDSPAnalyticsDailyReportBuilder _daysWatchWornToSleepOverLastNumberOfDays:excludeWeekdays:calendar:](self, "_daysWatchWornToSleepOverLastNumberOfDays:excludeWeekdays:calendar:", 30, 0, v4));
  objc_msgSend(v9, "setWeekendDaysWornWatchToSleepInLast7Days:", -[HDSPAnalyticsDailyReportBuilder _daysWatchWornToSleepOverLastNumberOfDays:excludeWeekdays:calendar:](self, "_daysWatchWornToSleepOverLastNumberOfDays:excludeWeekdays:calendar:", 7, 1, v4));
  objc_msgSend(v9, "setDidWearWatchToSleepLastNight:", -[HDSPAnalyticsDailyReportBuilder _woreWatchToSleepLastNight](self, "_woreWatchToSleepLastNight"));
  [(HDSPAnalyticsDailyReportBuilder *)self _bucketedSleepDurationLastNight];
  objc_msgSend(v9, "setSleepDurationLastNight:");
  [(HDSPAnalyticsDailyReportBuilder *)self _sleepDurationLastNightIncludingAwake:1];
  v60 = objc_opt_class();
  [(HDSPAnalyticsDailyReportBuilder *)self _lastNightsDurationForSleepStage:2];
  objc_msgSend(v9, "setSleepStagePercentAwakeLastNight:", (double)(unint64_t)objc_msgSend(v60, "_stageDurationPercentage:ofTotalDuration:"));
  v61 = objc_opt_class();
  [(HDSPAnalyticsDailyReportBuilder *)self _lastNightsDurationForSleepStage:5];
  objc_msgSend(v9, "setSleepStagePercentRemLastNight:", (double)(unint64_t)objc_msgSend(v61, "_stageDurationPercentage:ofTotalDuration:"));
  v62 = objc_opt_class();
  [(HDSPAnalyticsDailyReportBuilder *)self _lastNightsDurationForSleepStage:3];
  objc_msgSend(v9, "setSleepStagePercentCoreLastNight:", (double)(unint64_t)objc_msgSend(v62, "_stageDurationPercentage:ofTotalDuration:"));
  v63 = objc_opt_class();
  [(HDSPAnalyticsDailyReportBuilder *)self _lastNightsDurationForSleepStage:4];
  objc_msgSend(v9, "setSleepStagePercentDeepLastNight:", (double)(unint64_t)objc_msgSend(v63, "_stageDurationPercentage:ofTotalDuration:"));
  id v64 = objc_loadWeakRetained((id *)&self->_environment);
  v65 = [v64 behavior];
  v66 = [v65 features];
  int v67 = [v66 nebula];

  if (v67) {
    [(HDSPSleepApneaAnalyticsBuilder *)self->_sleepApneaAnalyticsBuilder updateDailyReportWithSleepApneaAnalytics:v9];
  }

  return v9;
}

- (int64_t)_daysWatchWornToSleepOverLastNumberOfDays:(int64_t)a3 excludeWeekdays:(BOOL)a4 calendar:(id)a5
{
  id v8 = a5;
  id v9 = v8;
  int64_t duration = self->_morningIndexRange.duration;
  int64_t v11 = self->_morningIndexRange.start + duration - 1;
  if (duration <= 0) {
    int64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  }
  int64_t v12 = v11 - a3 + 1;
  id v13 = objc_msgSend(v8, "hk_weekendDays");
  daySummaries = self->_daySummaries;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __102__HDSPAnalyticsDailyReportBuilder__daysWatchWornToSleepOverLastNumberOfDays_excludeWeekdays_calendar___block_invoke;
  v20[3] = &unk_2645D9858;
  int64_t v23 = v12;
  int64_t v24 = a3;
  BOOL v25 = a4;
  id v21 = v9;
  id v22 = v13;
  id v15 = v13;
  id v16 = v9;
  id v17 = [(NSArray *)daySummaries hk_filter:v20];
  int64_t v18 = [v17 count];

  return v18;
}

uint64_t __102__HDSPAnalyticsDailyReportBuilder__daysWatchWornToSleepOverLastNumberOfDays_excludeWeekdays_calendar___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 morningIndex];
  uint64_t v5 = *(void *)(a1 + 48);
  BOOL v6 = __OFSUB__(v4, v5);
  uint64_t v7 = v4 - v5;
  BOOL v8 = v7 < 0 == v6 && v7 < *(void *)(a1 + 56);
  if (v8 && [v3 containsPeriodsWithAppleSleepTrackingData])
  {
    if (*(unsigned char *)(a1 + 64))
    {
      id v9 = *(void **)(a1 + 32);
      uint64_t v10 = [v3 dateInterval];
      int64_t v11 = [v10 endDate];
      uint64_t v12 = [v9 component:512 fromDate:v11];

      id v13 = *(void **)(a1 + 40);
      id v14 = [NSNumber numberWithInteger:v12];
      uint64_t v15 = [v13 containsObject:v14];
    }
    else
    {
      uint64_t v15 = 1;
    }
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

- (BOOL)_woreWatchToSleepLastNight
{
  int64_t duration = self->_morningIndexRange.duration;
  int64_t v3 = self->_morningIndexRange.start + duration - 1;
  if (duration <= 0) {
    int64_t v3 = 0x7FFFFFFFFFFFFFFFLL;
  }
  daySummaries = self->_daySummaries;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __61__HDSPAnalyticsDailyReportBuilder__woreWatchToSleepLastNight__block_invoke;
  v8[3] = &__block_descriptor_48_e27_B16__0__HKSleepDaySummary_8l;
  v8[4] = v3;
  v8[5] = 1;
  uint64_t v5 = [(NSArray *)daySummaries na_firstObjectPassingTest:v8];
  char v6 = [v5 containsPeriodsWithAppleSleepTrackingData];

  return v6;
}

BOOL __61__HDSPAnalyticsDailyReportBuilder__woreWatchToSleepLastNight__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 morningIndex];
  uint64_t v4 = *(void *)(a1 + 32);
  BOOL v5 = __OFSUB__(v3, v4);
  uint64_t v6 = v3 - v4;
  return v6 < 0 == v5 && v6 < *(void *)(a1 + 40);
}

- (double)_bucketedSleepDurationLastNight
{
  [(HDSPAnalyticsDailyReportBuilder *)self _sleepDurationLastNightIncludingAwake:0];
  double v3 = v2 / 60.0;
  unint64_t v4 = (unint64_t)v3 / 0x3C;
  unint64_t v5 = (unint64_t)v3 % 0x3C;
  double v6 = dbl_221AD6290[v5 < 0x2D];
  if (v5 < 0xF) {
    double v6 = 0.0;
  }
  return v6 + (double)v4 * 3600.0;
}

- (double)_sleepDurationLastNightIncludingAwake:(BOOL)a3
{
  int64_t duration = self->_morningIndexRange.duration;
  int64_t v5 = self->_morningIndexRange.start + duration - 1;
  if (duration <= 0) {
    int64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }
  daySummaries = self->_daySummaries;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __73__HDSPAnalyticsDailyReportBuilder__sleepDurationLastNightIncludingAwake___block_invoke;
  v16[3] = &__block_descriptor_48_e27_B16__0__HKSleepDaySummary_8l;
  v16[4] = v5;
  v16[5] = 1;
  uint64_t v7 = [(NSArray *)daySummaries na_firstObjectPassingTest:v16];
  uint64_t v12 = 0;
  id v13 = (double *)&v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __73__HDSPAnalyticsDailyReportBuilder__sleepDurationLastNightIncludingAwake___block_invoke_2;
  v10[3] = &unk_2645D98C8;
  BOOL v11 = a3;
  v10[4] = &v12;
  objc_msgSend(v7, "hdsp_enumerateFirstPartyWatchSleepTrackingSegmentsWithBlock:", v10);
  double v8 = v13[3];
  _Block_object_dispose(&v12, 8);

  return v8;
}

BOOL __73__HDSPAnalyticsDailyReportBuilder__sleepDurationLastNightIncludingAwake___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 morningIndex];
  uint64_t v4 = *(void *)(a1 + 32);
  BOOL v5 = __OFSUB__(v3, v4);
  uint64_t v6 = v3 - v4;
  return v6 < 0 == v5 && v6 < *(void *)(a1 + 40);
}

void __73__HDSPAnalyticsDailyReportBuilder__sleepDurationLastNightIncludingAwake___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = HKCategoryValueSleepAnalysisAsleepValues();
  BOOL v5 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "category"));
  if ([v4 containsObject:v5])
  {

    goto LABEL_5;
  }
  if (!*(unsigned char *)(a1 + 40))
  {

    goto LABEL_7;
  }
  uint64_t v6 = [v3 category];

  if (v6 == 2)
  {
LABEL_5:
    uint64_t v4 = [v3 sampleIntervals];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __73__HDSPAnalyticsDailyReportBuilder__sleepDurationLastNightIncludingAwake___block_invoke_3;
    v7[3] = &unk_2645D98A0;
    v7[4] = *(void *)(a1 + 32);
    [v4 enumerateObjectsUsingBlock:v7];
LABEL_7:
  }
}

double __73__HDSPAnalyticsDailyReportBuilder__sleepDurationLastNightIncludingAwake___block_invoke_3(uint64_t a1, void *a2)
{
  [a2 duration];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  double result = v4 + *(double *)(v3 + 24);
  *(double *)(v3 + 24) = result;
  return result;
}

- (double)_lastNightsDurationForSleepStage:(int64_t)a3
{
  int64_t duration = self->_morningIndexRange.duration;
  int64_t v5 = self->_morningIndexRange.start + duration - 1;
  if (duration <= 0) {
    int64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }
  daySummaries = self->_daySummaries;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __68__HDSPAnalyticsDailyReportBuilder__lastNightsDurationForSleepStage___block_invoke;
  v15[3] = &__block_descriptor_48_e27_B16__0__HKSleepDaySummary_8l;
  v15[4] = v5;
  v15[5] = 1;
  uint64_t v7 = [(NSArray *)daySummaries na_firstObjectPassingTest:v15];
  uint64_t v11 = 0;
  uint64_t v12 = (double *)&v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __68__HDSPAnalyticsDailyReportBuilder__lastNightsDurationForSleepStage___block_invoke_2;
  v10[3] = &unk_2645D98F0;
  v10[4] = &v11;
  void v10[5] = a3;
  objc_msgSend(v7, "hdsp_enumerateFirstPartyWatchSleepTrackingSegmentsWithBlock:", v10);
  double v8 = v12[3];
  _Block_object_dispose(&v11, 8);

  return v8;
}

BOOL __68__HDSPAnalyticsDailyReportBuilder__lastNightsDurationForSleepStage___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 morningIndex];
  uint64_t v4 = *(void *)(a1 + 32);
  BOOL v5 = __OFSUB__(v3, v4);
  uint64_t v6 = v3 - v4;
  return v6 < 0 == v5 && v6 < *(void *)(a1 + 40);
}

void __68__HDSPAnalyticsDailyReportBuilder__lastNightsDurationForSleepStage___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 category] == *(void *)(a1 + 40))
  {
    uint64_t v4 = [v3 sampleIntervals];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __68__HDSPAnalyticsDailyReportBuilder__lastNightsDurationForSleepStage___block_invoke_3;
    v5[3] = &unk_2645D98A0;
    v5[4] = *(void *)(a1 + 32);
    [v4 enumerateObjectsUsingBlock:v5];
  }
}

double __68__HDSPAnalyticsDailyReportBuilder__lastNightsDurationForSleepStage___block_invoke_3(uint64_t a1, void *a2)
{
  [a2 duration];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  double result = v4 + *(double *)(v3 + 24);
  *(double *)(v3 + 24) = result;
  return result;
}

+ (unint64_t)_stageDurationPercentage:(double)a3 ofTotalDuration:(double)a4
{
  if (a4 <= 0.0) {
    return 0;
  }
  else {
    return vcvtad_u64_f64(a3 / a4 * 100.0);
  }
}

- (id)_windDownEvents
{
  uint64_t v3 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
  double v4 = [(HDSPAnalyticsDailyReportBuilder *)self analyticsStore];
  BOOL v5 = [v4 uncollectedWindDownActions];

  uint64_t v6 = [MEMORY[0x263F75DA0] activePairedWatchProductType];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  double v8 = [WeakRetained sleepScheduleModelManager];
  id v9 = [v8 sleepEventRecord];

  uint64_t v10 = [v9 sleepWindDownShortcutsOnboardingFirstCompletedDate];
  uint64_t v11 = [(HDSPAnalyticsDailyReportBuilder *)self currentDate];
  uint64_t v12 = [(HDSPAnalyticsDailyReportBuilder *)self _weeksSinceOnboardDate:v10 currentDate:v11 calendar:v3];

  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __50__HDSPAnalyticsDailyReportBuilder__windDownEvents__block_invoke;
  v17[3] = &unk_2645D9918;
  id v18 = v6;
  id v19 = v12;
  id v13 = v12;
  id v14 = v6;
  uint64_t v15 = objc_msgSend(v5, "na_map:", v17);

  return v15;
}

id __50__HDSPAnalyticsDailyReportBuilder__windDownEvents__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (objc_class *)MEMORY[0x263F75DB8];
  id v4 = a2;
  BOOL v5 = (void *)[[v3 alloc] initWithWindDownEventData:v4 watchProductType:*(void *)(a1 + 32) weeksSinceOnboarded:*(void *)(a1 + 40)];

  return v5;
}

- (id)_dateOfLastSuccessfulBreathingDisturbanceAnalysis
{
  id v3 = objc_alloc(MEMORY[0x263F0A470]);
  uint64_t v4 = *MEMORY[0x263F75EF8];
  BOOL v5 = [(HDSPAnalyticsDailyReportBuilder *)self healthStore];
  uint64_t v6 = (void *)[v3 initWithCategory:2 domainName:v4 healthStore:v5];

  uint64_t v7 = [v6 dateForKey:*MEMORY[0x263F75EE0] error:0];

  return v7;
}

- (BOOL)_didInteractWithWindDownActionsWithinLastTwoDays
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v3 = [(HDSPAnalyticsDailyReportBuilder *)self currentDate];
  uint64_t v4 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
  uint64_t v5 = objc_msgSend(v3, "hk_morningIndexWithCalendar:", v4) - 2;

  uint64_t v6 = [(HDSPAnalyticsDailyReportBuilder *)self analyticsStore];
  uint64_t v7 = [v6 windDownActionsAfterMorningIndex:v5];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  double v8 = [v7 allValues];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        id v14 = v13;
        uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v22;
          while (2)
          {
            for (uint64_t j = 0; j != v16; ++j)
            {
              if (*(void *)v22 != v17) {
                objc_enumerationMutation(v14);
              }
              if ([*(id *)(*((void *)&v21 + 1) + 8 * j) wasUsed])
              {

                BOOL v19 = 1;
                goto LABEL_19;
              }
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
            if (v16) {
              continue;
            }
            break;
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
      BOOL v19 = 0;
    }
    while (v10);
  }
  else
  {
    BOOL v19 = 0;
  }
LABEL_19:

  return v19;
}

- (BOOL)_changedSchedule:(id)a3 withinNumberOfDays:(unint64_t)a4 currentDate:(id)a5 calendar:(id)a6
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = [v9 lastModifiedDate];

  if (v12)
  {
    id v13 = [v9 lastModifiedDate];
    int v14 = objc_msgSend(v13, "hksp_isAfterDate:", v10);

    if (!v14)
    {
      uint64_t v17 = [v9 lastModifiedDate];
      id v18 = [v11 components:16 fromDate:v17 toDate:v10 options:0];

      BOOL v16 = [v18 day] <= a4;
      goto LABEL_8;
    }
    uint64_t v15 = HKSPLogForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v21 = 138543362;
      id v22 = (id)objc_opt_class();
      id v20 = v22;
      _os_log_error_impl(&dword_221A52000, v15, OS_LOG_TYPE_ERROR, "[%{public}@] Schedule's last modified date occurred after the current date", (uint8_t *)&v21, 0xCu);
    }
  }
  BOOL v16 = 0;
LABEL_8:

  return v16;
}

- (id)_weeksSinceOnboardDate:(id)a3 currentDate:(id)a4 calendar:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v7)
  {
LABEL_6:
    id v11 = 0;
    goto LABEL_8;
  }
  if (objc_msgSend(v7, "hksp_isAfterDate:", v8))
  {
    id v10 = HKSPLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v17 = 138543362;
      id v18 = (id)objc_opt_class();
      id v16 = v18;
      _os_log_error_impl(&dword_221A52000, v10, OS_LOG_TYPE_ERROR, "[%{public}@] Onboard date occurred after the current date", (uint8_t *)&v17, 0xCu);
    }
    goto LABEL_6;
  }
  uint64_t v12 = [v9 startOfDayForDate:v7];
  id v13 = [v9 startOfDayForDate:v8];
  int v14 = [v9 components:0x2000 fromDate:v12 toDate:v13 options:0];
  id v11 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v14, "weekOfYear"));

LABEL_8:

  return v11;
}

- (id)_biologicalSex
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  double v2 = [(HDSPAnalyticsDailyReportBuilder *)self healthStore];
  id v11 = 0;
  id v3 = [v2 biologicalSexWithError:&v11];
  id v4 = v11;

  if (v4)
  {
    uint64_t v5 = HKSPLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v9 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      id v13 = v9;
      __int16 v14 = 2114;
      id v15 = v4;
      id v10 = v9;
      _os_log_error_impl(&dword_221A52000, v5, OS_LOG_TYPE_ERROR, "[%{public}@] Unable access biological sex due to error: %{public}@", buf, 0x16u);
    }
    goto LABEL_7;
  }
  unint64_t v6 = [v3 biologicalSex];
  if (v6 > 3)
  {
LABEL_7:
    id v7 = 0;
    goto LABEL_8;
  }
  id v7 = off_2645D9988[v6];
LABEL_8:

  return v7;
}

- (id)_userAgeForCurrentDate:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(HDSPAnalyticsDailyReportBuilder *)self healthStore];
  id v14 = 0;
  unint64_t v6 = [v5 dateOfBirthComponentsWithError:&v14];
  id v7 = v14;

  if (v7)
  {
    id v8 = HKSPLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      uint64_t v16 = v12;
      __int16 v17 = 2114;
      id v18 = v7;
      id v13 = v12;
      _os_log_error_impl(&dword_221A52000, v8, OS_LOG_TYPE_ERROR, "[%{public}@] Unable access age due to error: %{public}@", buf, 0x16u);
    }
    id v9 = 0;
  }
  else
  {
    uint64_t v10 = objc_msgSend(v6, "hk_ageWithCurrentDate:", v4);
    id v9 = [NSNumber numberWithInteger:v10];
  }

  return v9;
}

- (HDSPEnvironment)environment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);

  return (HDSPEnvironment *)WeakRetained;
}

- (NSArray)daySummaries
{
  return self->_daySummaries;
}

- (HDSPSleepApneaAnalyticsBuilder)sleepApneaAnalyticsBuilder
{
  return self->_sleepApneaAnalyticsBuilder;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)morningIndexRange
{
  int64_t duration = self->_morningIndexRange.duration;
  int64_t start = self->_morningIndexRange.start;
  result.int64_t var1 = duration;
  result.int64_t var0 = start;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sleepApneaAnalyticsBuilder, 0);
  objc_storeStrong((id *)&self->_daySummaries, 0);

  objc_destroyWeak((id *)&self->_environment);
}

@end