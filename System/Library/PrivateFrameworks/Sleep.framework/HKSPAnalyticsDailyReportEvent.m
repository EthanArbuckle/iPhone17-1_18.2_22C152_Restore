@interface HKSPAnalyticsDailyReportEvent
- (BOOL)alarmFriday;
- (BOOL)alarmMonday;
- (BOOL)alarmSaturday;
- (BOOL)alarmSunday;
- (BOOL)alarmThursday;
- (BOOL)alarmTuesday;
- (BOOL)alarmWednesday;
- (BOOL)bedTimeWindDownRemindersEnabled;
- (BOOL)chargeRemindersEnabled;
- (BOOL)didWearWatchToSleepLastNight;
- (BOOL)hasSleepFocusConfigured;
- (BOOL)interactedWithWindDownLast24Hrs;
- (BOOL)isDefaultScheduleFriday;
- (BOOL)isDefaultScheduleMonday;
- (BOOL)isDefaultScheduleSaturday;
- (BOOL)isDefaultScheduleSunday;
- (BOOL)isDefaultScheduleThursday;
- (BOOL)isDefaultScheduleTuesday;
- (BOOL)isDefaultScheduleWednesday;
- (BOOL)isImproveHealthAndActivitySubmissionAllowed;
- (BOOL)scheduleChangePast24Hours;
- (BOOL)scheduleChangePast7days;
- (BOOL)scheduleDisabled;
- (BOOL)scheduleFriday;
- (BOOL)scheduleMigration;
- (BOOL)scheduleMonday;
- (BOOL)scheduleSaturday;
- (BOOL)scheduleSunday;
- (BOOL)scheduleThursday;
- (BOOL)scheduleTuesday;
- (BOOL)scheduleWednesday;
- (BOOL)scheduledSleepModeEnabled;
- (BOOL)timeInBedTrackingEnabled;
- (BOOL)useSleepScreen;
- (BOOL)wakeUpResultsEnabled;
- (BOOL)watchSleepTrackingEnabled;
- (NSArray)keysRequiringIHAGating;
- (NSDictionary)eventPayload;
- (NSNumber)areHealthNotificationsAuthorized;
- (NSNumber)isOnboardedBD;
- (NSNumber)maxBDValueInPast30Days;
- (NSNumber)maxTimeBetweenBDSessionsPastNight;
- (NSNumber)meanTimeBetweenBDSessionsPastNight;
- (NSNumber)minTimeBetweenBDSessionsPastNight;
- (NSNumber)numBDNotificationsInPast180Nights;
- (NSNumber)numBDNotificationsInPast30Nights;
- (NSNumber)numBDNotificationsInPastNight;
- (NSNumber)numBDValuesInPast30Days;
- (NSNumber)numBDValuesInPastNight;
- (NSNumber)numDaysSinceLastAnalysis;
- (NSNumber)numDaysSinceLastBDNotification;
- (NSNumber)numSleepDaysWithBDsOverThresholdLast30Days;
- (NSNumber)numSleepDaysWithMultipleBDinPast30Days;
- (NSNumber)numSleepSessionsWithBDsOverThresholdLast30Days;
- (NSNumber)stddevActualTimeAsleep;
- (NSNumber)stddevActualVsScheduledTimeAsleep;
- (NSNumber)stddevScheduledTimeAsleep;
- (NSNumber)userAge;
- (NSNumber)weeksSinceOnboardedBD;
- (NSNumber)weeksSinceOnboardedSleepSchedule;
- (NSNumber)weeksSinceOnboardedSleepTracking;
- (NSNumber)weeksSinceOnboardedWindDownActions;
- (NSString)BDOnboardingCountryCode;
- (NSString)activeWatchProductType;
- (NSString)biologicalSex;
- (NSString)eventName;
- (NSString)hapticToneIdentifierFriday;
- (NSString)hapticToneIdentifierMonday;
- (NSString)hapticToneIdentifierSaturday;
- (NSString)hapticToneIdentifierSunday;
- (NSString)hapticToneIdentifierThursday;
- (NSString)hapticToneIdentifierTuesday;
- (NSString)hapticToneIdentifierWednesday;
- (double)sleepDurationLastNight;
- (double)sleepGoal;
- (double)sleepStagePercentAwakeLastNight;
- (double)sleepStagePercentCoreLastNight;
- (double)sleepStagePercentDeepLastNight;
- (double)sleepStagePercentRemLastNight;
- (int64_t)daysWornWatchToSleepInLast30Days;
- (int64_t)daysWornWatchToSleepInLast7Days;
- (int64_t)maxSleepCoachingVersionOnboarded;
- (int64_t)maxSleepTrackingVersionOnboarded;
- (int64_t)weekendDaysWornWatchToSleepInLast7Days;
- (void)setActiveWatchProductType:(id)a3;
- (void)setAlarmFriday:(BOOL)a3;
- (void)setAlarmMonday:(BOOL)a3;
- (void)setAlarmSaturday:(BOOL)a3;
- (void)setAlarmSunday:(BOOL)a3;
- (void)setAlarmThursday:(BOOL)a3;
- (void)setAlarmTuesday:(BOOL)a3;
- (void)setAlarmWednesday:(BOOL)a3;
- (void)setAreHealthNotificationsAuthorized:(id)a3;
- (void)setBDOnboardingCountryCode:(id)a3;
- (void)setBedTimeWindDownRemindersEnabled:(BOOL)a3;
- (void)setBiologicalSex:(id)a3;
- (void)setChargeRemindersEnabled:(BOOL)a3;
- (void)setDaysWornWatchToSleepInLast30Days:(int64_t)a3;
- (void)setDaysWornWatchToSleepInLast7Days:(int64_t)a3;
- (void)setDidWearWatchToSleepLastNight:(BOOL)a3;
- (void)setHapticToneIdentifierFriday:(id)a3;
- (void)setHapticToneIdentifierMonday:(id)a3;
- (void)setHapticToneIdentifierSaturday:(id)a3;
- (void)setHapticToneIdentifierSunday:(id)a3;
- (void)setHapticToneIdentifierThursday:(id)a3;
- (void)setHapticToneIdentifierTuesday:(id)a3;
- (void)setHapticToneIdentifierWednesday:(id)a3;
- (void)setHasSleepFocusConfigured:(BOOL)a3;
- (void)setInteractedWithWindDownLast24Hrs:(BOOL)a3;
- (void)setIsDefaultScheduleFriday:(BOOL)a3;
- (void)setIsDefaultScheduleMonday:(BOOL)a3;
- (void)setIsDefaultScheduleSaturday:(BOOL)a3;
- (void)setIsDefaultScheduleSunday:(BOOL)a3;
- (void)setIsDefaultScheduleThursday:(BOOL)a3;
- (void)setIsDefaultScheduleTuesday:(BOOL)a3;
- (void)setIsDefaultScheduleWednesday:(BOOL)a3;
- (void)setIsImproveHealthAndActivitySubmissionAllowed:(BOOL)a3;
- (void)setIsOnboardedBD:(id)a3;
- (void)setMaxBDValueInPast30Days:(id)a3;
- (void)setMaxSleepCoachingVersionOnboarded:(int64_t)a3;
- (void)setMaxSleepTrackingVersionOnboarded:(int64_t)a3;
- (void)setMaxTimeBetweenBDSessionsPastNight:(id)a3;
- (void)setMeanTimeBetweenBDSessionsPastNight:(id)a3;
- (void)setMinTimeBetweenBDSessionsPastNight:(id)a3;
- (void)setNumBDNotificationsInPast180Nights:(id)a3;
- (void)setNumBDNotificationsInPast30Nights:(id)a3;
- (void)setNumBDNotificationsInPastNight:(id)a3;
- (void)setNumBDValuesInPast30Days:(id)a3;
- (void)setNumBDValuesInPastNight:(id)a3;
- (void)setNumDaysSinceLastAnalysis:(id)a3;
- (void)setNumDaysSinceLastBDNotification:(id)a3;
- (void)setNumSleepDaysWithBDsOverThresholdLast30Days:(id)a3;
- (void)setNumSleepDaysWithMultipleBDinPast30Days:(id)a3;
- (void)setNumSleepSessionsWithBDsOverThresholdLast30Days:(id)a3;
- (void)setScheduleChangePast24Hours:(BOOL)a3;
- (void)setScheduleChangePast7days:(BOOL)a3;
- (void)setScheduleDisabled:(BOOL)a3;
- (void)setScheduleFriday:(BOOL)a3;
- (void)setScheduleMigration:(BOOL)a3;
- (void)setScheduleMonday:(BOOL)a3;
- (void)setScheduleSaturday:(BOOL)a3;
- (void)setScheduleSunday:(BOOL)a3;
- (void)setScheduleThursday:(BOOL)a3;
- (void)setScheduleTuesday:(BOOL)a3;
- (void)setScheduleWednesday:(BOOL)a3;
- (void)setScheduledSleepModeEnabled:(BOOL)a3;
- (void)setSleepDurationLastNight:(double)a3;
- (void)setSleepGoal:(double)a3;
- (void)setSleepStagePercentAwakeLastNight:(double)a3;
- (void)setSleepStagePercentCoreLastNight:(double)a3;
- (void)setSleepStagePercentDeepLastNight:(double)a3;
- (void)setSleepStagePercentRemLastNight:(double)a3;
- (void)setStddevActualTimeAsleep:(id)a3;
- (void)setStddevActualVsScheduledTimeAsleep:(id)a3;
- (void)setStddevScheduledTimeAsleep:(id)a3;
- (void)setTimeInBedTrackingEnabled:(BOOL)a3;
- (void)setUseSleepScreen:(BOOL)a3;
- (void)setUserAge:(id)a3;
- (void)setWakeUpResultsEnabled:(BOOL)a3;
- (void)setWatchSleepTrackingEnabled:(BOOL)a3;
- (void)setWeekendDaysWornWatchToSleepInLast7Days:(int64_t)a3;
- (void)setWeeksSinceOnboardedBD:(id)a3;
- (void)setWeeksSinceOnboardedSleepSchedule:(id)a3;
- (void)setWeeksSinceOnboardedSleepTracking:(id)a3;
- (void)setWeeksSinceOnboardedWindDownActions:(id)a3;
@end

@implementation HKSPAnalyticsDailyReportEvent

- (NSString)eventName
{
  return (NSString *)@"com.apple.SleepHealth.Daily";
}

- (NSDictionary)eventPayload
{
  v146[47] = *MEMORY[0x1E4F143B8];
  id v134 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v145[0] = @"bedTimeWindDownRemindersEnabled";
  v144 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[HKSPAnalyticsDailyReportEvent bedTimeWindDownRemindersEnabled](self, "bedTimeWindDownRemindersEnabled"));
  v146[0] = v144;
  v145[1] = @"chargeRemindersEnabled";
  v143 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[HKSPAnalyticsDailyReportEvent chargeRemindersEnabled](self, "chargeRemindersEnabled"));
  v146[1] = v143;
  v145[2] = @"isIHA";
  v142 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[HKSPAnalyticsDailyReportEvent isImproveHealthAndActivitySubmissionAllowed](self, "isImproveHealthAndActivitySubmissionAllowed"));
  v146[2] = v142;
  v145[3] = @"scheduleChangePast24Hours";
  v141 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[HKSPAnalyticsDailyReportEvent scheduleChangePast24Hours](self, "scheduleChangePast24Hours"));
  v146[3] = v141;
  v145[4] = @"scheduleChangePast7days";
  v140 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[HKSPAnalyticsDailyReportEvent scheduleChangePast7days](self, "scheduleChangePast7days"));
  v146[4] = v140;
  v145[5] = @"scheduleDisabled";
  v139 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[HKSPAnalyticsDailyReportEvent scheduleDisabled](self, "scheduleDisabled"));
  v146[5] = v139;
  v145[6] = @"scheduledSleepModeEnabled";
  v138 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[HKSPAnalyticsDailyReportEvent scheduledSleepModeEnabled](self, "scheduledSleepModeEnabled"));
  v146[6] = v138;
  v145[7] = @"scheduleMigration";
  v137 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[HKSPAnalyticsDailyReportEvent scheduleMigration](self, "scheduleMigration"));
  v146[7] = v137;
  v145[8] = @"sleepGoal";
  v3 = (void *)MEMORY[0x1E4F28ED0];
  [(HKSPAnalyticsDailyReportEvent *)self sleepGoal];
  v136 = objc_msgSend(v3, "numberWithDouble:");
  v146[8] = v136;
  v145[9] = @"timeInBedTrackingEnabled";
  v135 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[HKSPAnalyticsDailyReportEvent timeInBedTrackingEnabled](self, "timeInBedTrackingEnabled"));
  v146[9] = v135;
  v145[10] = @"wakeUpResultsEnabled";
  v133 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[HKSPAnalyticsDailyReportEvent wakeUpResultsEnabled](self, "wakeUpResultsEnabled"));
  v146[10] = v133;
  v145[11] = @"watchSleepTrackingEnabled";
  v132 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[HKSPAnalyticsDailyReportEvent watchSleepTrackingEnabled](self, "watchSleepTrackingEnabled"));
  v146[11] = v132;
  v145[12] = @"interactedWithWindDownLast24Hrs";
  v131 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[HKSPAnalyticsDailyReportEvent interactedWithWindDownLast24Hrs](self, "interactedWithWindDownLast24Hrs"));
  v146[12] = v131;
  v145[13] = @"useSleepScreen";
  v130 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[HKSPAnalyticsDailyReportEvent useSleepScreen](self, "useSleepScreen"));
  v146[13] = v130;
  v145[14] = @"maxSleepTrackingVersionOnboarded";
  v129 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", -[HKSPAnalyticsDailyReportEvent maxSleepTrackingVersionOnboarded](self, "maxSleepTrackingVersionOnboarded"));
  v146[14] = v129;
  v145[15] = @"maxSleepCoachingVersionOnboarded";
  v128 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", -[HKSPAnalyticsDailyReportEvent maxSleepCoachingVersionOnboarded](self, "maxSleepCoachingVersionOnboarded"));
  v146[15] = v128;
  v145[16] = @"hasSleepFocusConfigured";
  v127 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[HKSPAnalyticsDailyReportEvent hasSleepFocusConfigured](self, "hasSleepFocusConfigured"));
  v146[16] = v127;
  v145[17] = @"alarmFriday";
  v126 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[HKSPAnalyticsDailyReportEvent alarmFriday](self, "alarmFriday"));
  v146[17] = v126;
  v145[18] = @"alarmMonday";
  v125 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[HKSPAnalyticsDailyReportEvent alarmMonday](self, "alarmMonday"));
  v146[18] = v125;
  v145[19] = @"alarmSaturday";
  v124 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[HKSPAnalyticsDailyReportEvent alarmSaturday](self, "alarmSaturday"));
  v146[19] = v124;
  v145[20] = @"alarmSunday";
  v123 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[HKSPAnalyticsDailyReportEvent alarmSunday](self, "alarmSunday"));
  v146[20] = v123;
  v145[21] = @"alarmThursday";
  v122 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[HKSPAnalyticsDailyReportEvent alarmThursday](self, "alarmThursday"));
  v146[21] = v122;
  v145[22] = @"alarmTuesday";
  v121 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[HKSPAnalyticsDailyReportEvent alarmTuesday](self, "alarmTuesday"));
  v146[22] = v121;
  v145[23] = @"alarmWednesday";
  v120 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[HKSPAnalyticsDailyReportEvent alarmWednesday](self, "alarmWednesday"));
  v146[23] = v120;
  v145[24] = @"scheduleFriday";
  v119 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[HKSPAnalyticsDailyReportEvent scheduleFriday](self, "scheduleFriday"));
  v146[24] = v119;
  v145[25] = @"scheduleMonday";
  v118 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[HKSPAnalyticsDailyReportEvent scheduleMonday](self, "scheduleMonday"));
  v146[25] = v118;
  v145[26] = @"scheduleSaturday";
  v117 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[HKSPAnalyticsDailyReportEvent scheduleSaturday](self, "scheduleSaturday"));
  v146[26] = v117;
  v145[27] = @"scheduleSunday";
  v116 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[HKSPAnalyticsDailyReportEvent scheduleSunday](self, "scheduleSunday"));
  v146[27] = v116;
  v145[28] = @"scheduleThursday";
  v115 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[HKSPAnalyticsDailyReportEvent scheduleThursday](self, "scheduleThursday"));
  v146[28] = v115;
  v145[29] = @"scheduleTuesday";
  v114 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[HKSPAnalyticsDailyReportEvent scheduleTuesday](self, "scheduleTuesday"));
  v146[29] = v114;
  v145[30] = @"scheduleWednesday";
  v113 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[HKSPAnalyticsDailyReportEvent scheduleWednesday](self, "scheduleWednesday"));
  v146[30] = v113;
  v145[31] = @"defaultScheduleFriday";
  v4 = (void *)MEMORY[0x1E4F28ED0];
  if ([(HKSPAnalyticsDailyReportEvent *)self scheduleFriday]) {
    BOOL v5 = [(HKSPAnalyticsDailyReportEvent *)self isDefaultScheduleFriday];
  }
  else {
    BOOL v5 = 0;
  }
  v112 = [v4 numberWithInt:v5];
  v146[31] = v112;
  v145[32] = @"defaultScheduleMonday";
  v6 = (void *)MEMORY[0x1E4F28ED0];
  if ([(HKSPAnalyticsDailyReportEvent *)self scheduleMonday]) {
    BOOL v7 = [(HKSPAnalyticsDailyReportEvent *)self isDefaultScheduleMonday];
  }
  else {
    BOOL v7 = 0;
  }
  v111 = [v6 numberWithInt:v7];
  v146[32] = v111;
  v145[33] = @"defaultScheduleSaturday";
  v8 = (void *)MEMORY[0x1E4F28ED0];
  if ([(HKSPAnalyticsDailyReportEvent *)self scheduleSaturday]) {
    BOOL v9 = [(HKSPAnalyticsDailyReportEvent *)self isDefaultScheduleSaturday];
  }
  else {
    BOOL v9 = 0;
  }
  v110 = [v8 numberWithInt:v9];
  v146[33] = v110;
  v145[34] = @"defaultScheduleSunday";
  v10 = (void *)MEMORY[0x1E4F28ED0];
  if ([(HKSPAnalyticsDailyReportEvent *)self scheduleSunday]) {
    BOOL v11 = [(HKSPAnalyticsDailyReportEvent *)self isDefaultScheduleSunday];
  }
  else {
    BOOL v11 = 0;
  }
  v109 = [v10 numberWithInt:v11];
  v146[34] = v109;
  v145[35] = @"defaultScheduleThursday";
  v12 = (void *)MEMORY[0x1E4F28ED0];
  if ([(HKSPAnalyticsDailyReportEvent *)self scheduleThursday]) {
    BOOL v13 = [(HKSPAnalyticsDailyReportEvent *)self isDefaultScheduleThursday];
  }
  else {
    BOOL v13 = 0;
  }
  v108 = [v12 numberWithInt:v13];
  v146[35] = v108;
  v145[36] = @"defaultScheduleTuesday";
  v14 = (void *)MEMORY[0x1E4F28ED0];
  if ([(HKSPAnalyticsDailyReportEvent *)self scheduleTuesday]) {
    BOOL v15 = [(HKSPAnalyticsDailyReportEvent *)self isDefaultScheduleTuesday];
  }
  else {
    BOOL v15 = 0;
  }
  v107 = [v14 numberWithInt:v15];
  v146[36] = v107;
  v145[37] = @"defaultScheduleWednesday";
  v16 = (void *)MEMORY[0x1E4F28ED0];
  if ([(HKSPAnalyticsDailyReportEvent *)self scheduleWednesday]) {
    BOOL v17 = [(HKSPAnalyticsDailyReportEvent *)self isDefaultScheduleWednesday];
  }
  else {
    BOOL v17 = 0;
  }
  v106 = [v16 numberWithInt:v17];
  v146[37] = v106;
  v145[38] = @"daysWornWatchToSleepInLast7Days";
  v105 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", -[HKSPAnalyticsDailyReportEvent daysWornWatchToSleepInLast7Days](self, "daysWornWatchToSleepInLast7Days"));
  v146[38] = v105;
  v145[39] = @"daysWornWatchToSleepInLast30Days";
  v104 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", -[HKSPAnalyticsDailyReportEvent daysWornWatchToSleepInLast30Days](self, "daysWornWatchToSleepInLast30Days"));
  v146[39] = v104;
  v145[40] = @"weekendDaysWornWatchToSleepInLast7Days";
  v18 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", -[HKSPAnalyticsDailyReportEvent weekendDaysWornWatchToSleepInLast7Days](self, "weekendDaysWornWatchToSleepInLast7Days"));
  v146[40] = v18;
  v145[41] = @"didWearWatchToSleepLastNight";
  v19 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[HKSPAnalyticsDailyReportEvent didWearWatchToSleepLastNight](self, "didWearWatchToSleepLastNight"));
  v146[41] = v19;
  v145[42] = @"sleepDurationLastNight";
  v20 = (void *)MEMORY[0x1E4F28ED0];
  [(HKSPAnalyticsDailyReportEvent *)self sleepDurationLastNight];
  v21 = objc_msgSend(v20, "numberWithDouble:");
  v146[42] = v21;
  v145[43] = @"sleepStagePercentAwakeLastNight";
  v22 = (void *)MEMORY[0x1E4F28ED0];
  [(HKSPAnalyticsDailyReportEvent *)self sleepStagePercentAwakeLastNight];
  v23 = objc_msgSend(v22, "numberWithDouble:");
  v146[43] = v23;
  v145[44] = @"sleepStagePercentRemLastNight";
  v24 = (void *)MEMORY[0x1E4F28ED0];
  [(HKSPAnalyticsDailyReportEvent *)self sleepStagePercentRemLastNight];
  v25 = objc_msgSend(v24, "numberWithDouble:");
  v146[44] = v25;
  v145[45] = @"sleepStagePercentCoreLastNight";
  v26 = (void *)MEMORY[0x1E4F28ED0];
  [(HKSPAnalyticsDailyReportEvent *)self sleepStagePercentCoreLastNight];
  v27 = objc_msgSend(v26, "numberWithDouble:");
  v146[45] = v27;
  v145[46] = @"sleepStagePercentDeepLastNight";
  v28 = (void *)MEMORY[0x1E4F28ED0];
  [(HKSPAnalyticsDailyReportEvent *)self sleepStagePercentDeepLastNight];
  v29 = objc_msgSend(v28, "numberWithDouble:");
  v146[46] = v29;
  v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v146 forKeys:v145 count:47];
  v31 = (void *)[v134 initWithDictionary:v30];

  v32 = [(HKSPAnalyticsDailyReportEvent *)self userAge];

  if (v32)
  {
    v33 = [(HKSPAnalyticsDailyReportEvent *)self userAge];
    [v31 setObject:v33 forKeyedSubscript:@"userAge"];
  }
  v34 = [(HKSPAnalyticsDailyReportEvent *)self biologicalSex];

  if (v34)
  {
    v35 = [(HKSPAnalyticsDailyReportEvent *)self biologicalSex];
    [v31 setObject:v35 forKeyedSubscript:@"biologicalSex"];
  }
  v36 = [(HKSPAnalyticsDailyReportEvent *)self hapticToneIdentifierFriday];

  if (v36)
  {
    v37 = [(HKSPAnalyticsDailyReportEvent *)self hapticToneIdentifierFriday];
    [v31 setObject:v37 forKeyedSubscript:@"hapticToneIdentifierFriday"];
  }
  v38 = [(HKSPAnalyticsDailyReportEvent *)self hapticToneIdentifierMonday];

  if (v38)
  {
    v39 = [(HKSPAnalyticsDailyReportEvent *)self hapticToneIdentifierMonday];
    [v31 setObject:v39 forKeyedSubscript:@"hapticToneIdentifierMonday"];
  }
  v40 = [(HKSPAnalyticsDailyReportEvent *)self hapticToneIdentifierSaturday];

  if (v40)
  {
    v41 = [(HKSPAnalyticsDailyReportEvent *)self hapticToneIdentifierSaturday];
    [v31 setObject:v41 forKeyedSubscript:@"hapticToneIdentifierSaturday"];
  }
  v42 = [(HKSPAnalyticsDailyReportEvent *)self hapticToneIdentifierSunday];

  if (v42)
  {
    v43 = [(HKSPAnalyticsDailyReportEvent *)self hapticToneIdentifierSunday];
    [v31 setObject:v43 forKeyedSubscript:@"hapticToneIdentifierSunday"];
  }
  v44 = [(HKSPAnalyticsDailyReportEvent *)self hapticToneIdentifierThursday];

  if (v44)
  {
    v45 = [(HKSPAnalyticsDailyReportEvent *)self hapticToneIdentifierThursday];
    [v31 setObject:v45 forKeyedSubscript:@"hapticToneIdentifierThursday"];
  }
  v46 = [(HKSPAnalyticsDailyReportEvent *)self hapticToneIdentifierTuesday];

  if (v46)
  {
    v47 = [(HKSPAnalyticsDailyReportEvent *)self hapticToneIdentifierTuesday];
    [v31 setObject:v47 forKeyedSubscript:@"hapticToneIdentifierTuesday"];
  }
  v48 = [(HKSPAnalyticsDailyReportEvent *)self hapticToneIdentifierWednesday];

  if (v48)
  {
    v49 = [(HKSPAnalyticsDailyReportEvent *)self hapticToneIdentifierWednesday];
    [v31 setObject:v49 forKeyedSubscript:@"hapticToneIdentifierWednesday"];
  }
  v50 = [(HKSPAnalyticsDailyReportEvent *)self activeWatchProductType];

  if (v50)
  {
    v51 = [(HKSPAnalyticsDailyReportEvent *)self activeWatchProductType];
    [v31 setObject:v51 forKeyedSubscript:@"activeWatchProductType"];
  }
  v52 = [(HKSPAnalyticsDailyReportEvent *)self weeksSinceOnboardedSleepSchedule];

  if (v52)
  {
    v53 = [(HKSPAnalyticsDailyReportEvent *)self weeksSinceOnboardedSleepSchedule];
    [v31 setObject:v53 forKeyedSubscript:@"weeksSinceOnboardedSleepSchedule"];
  }
  v54 = [(HKSPAnalyticsDailyReportEvent *)self weeksSinceOnboardedSleepTracking];

  if (v54)
  {
    v55 = [(HKSPAnalyticsDailyReportEvent *)self weeksSinceOnboardedSleepTracking];
    [v31 setObject:v55 forKeyedSubscript:@"weeksSinceOnboardedSleepTracking"];
  }
  v56 = [(HKSPAnalyticsDailyReportEvent *)self weeksSinceOnboardedWindDownActions];

  if (v56)
  {
    v57 = [(HKSPAnalyticsDailyReportEvent *)self weeksSinceOnboardedWindDownActions];
    [v31 setObject:v57 forKeyedSubscript:@"weeksSinceOnboardedWindDownActions"];
  }
  v58 = [(HKSPAnalyticsDailyReportEvent *)self stddevActualTimeAsleep];

  if (v58)
  {
    v59 = [(HKSPAnalyticsDailyReportEvent *)self stddevActualTimeAsleep];
    [v31 setObject:v59 forKeyedSubscript:@"stddevActualTimeAsleep"];
  }
  v60 = [(HKSPAnalyticsDailyReportEvent *)self stddevScheduledTimeAsleep];

  if (v60)
  {
    v61 = [(HKSPAnalyticsDailyReportEvent *)self stddevScheduledTimeAsleep];
    [v31 setObject:v61 forKeyedSubscript:@"stddevScheduledTimeAsleep"];
  }
  v62 = [(HKSPAnalyticsDailyReportEvent *)self stddevActualVsScheduledTimeAsleep];

  if (v62)
  {
    v63 = [(HKSPAnalyticsDailyReportEvent *)self stddevActualVsScheduledTimeAsleep];
    [v31 setObject:v63 forKeyedSubscript:@"stddevActualVsScheduledTimeAsleep"];
  }
  v64 = [(HKSPAnalyticsDailyReportEvent *)self isOnboardedBD];

  if (v64)
  {
    v65 = (void *)MEMORY[0x1E4F28ED0];
    v66 = [(HKSPAnalyticsDailyReportEvent *)self isOnboardedBD];
    v67 = objc_msgSend(v65, "numberWithBool:", objc_msgSend(v66, "BOOLValue"));
    [v31 setObject:v67 forKeyedSubscript:@"isOnboardedBD"];
  }
  v68 = [(HKSPAnalyticsDailyReportEvent *)self meanTimeBetweenBDSessionsPastNight];

  if (v68)
  {
    v69 = [(HKSPAnalyticsDailyReportEvent *)self meanTimeBetweenBDSessionsPastNight];
    [v31 setObject:v69 forKeyedSubscript:@"meanTimeBetweenSessionsPastNight"];
  }
  v70 = [(HKSPAnalyticsDailyReportEvent *)self maxTimeBetweenBDSessionsPastNight];

  if (v70)
  {
    v71 = [(HKSPAnalyticsDailyReportEvent *)self maxTimeBetweenBDSessionsPastNight];
    [v31 setObject:v71 forKeyedSubscript:@"maxTimeBetweenSessionsPastNight"];
  }
  v72 = [(HKSPAnalyticsDailyReportEvent *)self minTimeBetweenBDSessionsPastNight];

  if (v72)
  {
    v73 = [(HKSPAnalyticsDailyReportEvent *)self minTimeBetweenBDSessionsPastNight];
    [v31 setObject:v73 forKeyedSubscript:@"minTimeBetweenSessionsPastNight"];
  }
  v74 = [(HKSPAnalyticsDailyReportEvent *)self numBDValuesInPastNight];

  if (v74)
  {
    v75 = [(HKSPAnalyticsDailyReportEvent *)self numBDValuesInPastNight];
    [v31 setObject:v75 forKeyedSubscript:@"numBDValuesInPastNight"];
  }
  v76 = [(HKSPAnalyticsDailyReportEvent *)self numBDValuesInPast30Days];

  if (v76)
  {
    v77 = [(HKSPAnalyticsDailyReportEvent *)self numBDValuesInPast30Days];
    [v31 setObject:v77 forKeyedSubscript:@"numBDValuesInPast30Days"];
  }
  v78 = [(HKSPAnalyticsDailyReportEvent *)self numSleepSessionsWithBDsOverThresholdLast30Days];

  if (v78)
  {
    v79 = [(HKSPAnalyticsDailyReportEvent *)self numSleepSessionsWithBDsOverThresholdLast30Days];
    [v31 setObject:v79 forKeyedSubscript:@"numSleepSessionsWithBDsOverThresholdLast30Days"];
  }
  v80 = [(HKSPAnalyticsDailyReportEvent *)self maxBDValueInPast30Days];

  if (v80)
  {
    v81 = [(HKSPAnalyticsDailyReportEvent *)self maxBDValueInPast30Days];
    [v31 setObject:v81 forKeyedSubscript:@"maxBDValueInPast30Days"];
  }
  v82 = [(HKSPAnalyticsDailyReportEvent *)self numSleepDaysWithBDsOverThresholdLast30Days];

  if (v82)
  {
    v83 = [(HKSPAnalyticsDailyReportEvent *)self numSleepDaysWithBDsOverThresholdLast30Days];
    [v31 setObject:v83 forKeyedSubscript:@"numSleepDaysWithBDsOverThresholdLast30Days"];
  }
  v84 = [(HKSPAnalyticsDailyReportEvent *)self numSleepDaysWithMultipleBDinPast30Days];

  if (v84)
  {
    v85 = [(HKSPAnalyticsDailyReportEvent *)self numSleepDaysWithMultipleBDinPast30Days];
    [v31 setObject:v85 forKeyedSubscript:@"numSleepDaysWithMultipleBDinPast30Days"];
  }
  v86 = [(HKSPAnalyticsDailyReportEvent *)self BDOnboardingCountryCode];

  if (v86)
  {
    v87 = [(HKSPAnalyticsDailyReportEvent *)self BDOnboardingCountryCode];
    [v31 setObject:v87 forKeyedSubscript:@"BDOnboardingCountryCode"];
  }
  v88 = [(HKSPAnalyticsDailyReportEvent *)self weeksSinceOnboardedBD];

  if (v88)
  {
    v89 = [(HKSPAnalyticsDailyReportEvent *)self weeksSinceOnboardedBD];
    [v31 setObject:v89 forKeyedSubscript:@"weeksSinceOnboardedBD"];
  }
  v90 = [(HKSPAnalyticsDailyReportEvent *)self areHealthNotificationsAuthorized];

  if (v90)
  {
    v91 = [(HKSPAnalyticsDailyReportEvent *)self areHealthNotificationsAuthorized];
    [v31 setObject:v91 forKeyedSubscript:@"areHealthNotificationsAuthorized"];
  }
  v92 = [(HKSPAnalyticsDailyReportEvent *)self numBDNotificationsInPastNight];

  if (v92)
  {
    v93 = [(HKSPAnalyticsDailyReportEvent *)self numBDNotificationsInPastNight];
    [v31 setObject:v93 forKeyedSubscript:@"numBDNotificationsInPastNight"];
  }
  v94 = [(HKSPAnalyticsDailyReportEvent *)self numBDNotificationsInPast30Nights];

  if (v94)
  {
    v95 = [(HKSPAnalyticsDailyReportEvent *)self numBDNotificationsInPast30Nights];
    [v31 setObject:v95 forKeyedSubscript:@"numBDNotificationsInPast30Nights"];
  }
  v96 = [(HKSPAnalyticsDailyReportEvent *)self numBDNotificationsInPast180Nights];

  if (v96)
  {
    v97 = [(HKSPAnalyticsDailyReportEvent *)self numBDNotificationsInPast180Nights];
    [v31 setObject:v97 forKeyedSubscript:@"numBDNotificationsInPast180Nights"];
  }
  v98 = [(HKSPAnalyticsDailyReportEvent *)self numDaysSinceLastBDNotification];

  if (v98)
  {
    v99 = [(HKSPAnalyticsDailyReportEvent *)self numDaysSinceLastBDNotification];
    [v31 setObject:v99 forKeyedSubscript:@"numDaysSinceLastBDNotification"];
  }
  v100 = [(HKSPAnalyticsDailyReportEvent *)self numDaysSinceLastAnalysis];

  if (v100)
  {
    v101 = [(HKSPAnalyticsDailyReportEvent *)self numDaysSinceLastAnalysis];
    [v31 setObject:v101 forKeyedSubscript:@"numDaysSinceLastAnalysis"];
  }
  v102 = v31;

  return v102;
}

- (NSArray)keysRequiringIHAGating
{
  return (NSArray *)&unk_1EFE65138;
}

- (BOOL)isImproveHealthAndActivitySubmissionAllowed
{
  return self->_isImproveHealthAndActivitySubmissionAllowed;
}

- (void)setIsImproveHealthAndActivitySubmissionAllowed:(BOOL)a3
{
  self->_isImproveHealthAndActivitySubmissionAllowed = a3;
}

- (NSNumber)userAge
{
  return self->_userAge;
}

- (void)setUserAge:(id)a3
{
}

- (NSString)biologicalSex
{
  return self->_biologicalSex;
}

- (void)setBiologicalSex:(id)a3
{
}

- (NSNumber)weeksSinceOnboardedSleepSchedule
{
  return self->_weeksSinceOnboardedSleepSchedule;
}

- (void)setWeeksSinceOnboardedSleepSchedule:(id)a3
{
}

- (NSNumber)weeksSinceOnboardedSleepTracking
{
  return self->_weeksSinceOnboardedSleepTracking;
}

- (void)setWeeksSinceOnboardedSleepTracking:(id)a3
{
}

- (NSNumber)weeksSinceOnboardedWindDownActions
{
  return self->_weeksSinceOnboardedWindDownActions;
}

- (void)setWeeksSinceOnboardedWindDownActions:(id)a3
{
}

- (NSString)activeWatchProductType
{
  return self->_activeWatchProductType;
}

- (void)setActiveWatchProductType:(id)a3
{
}

- (double)sleepGoal
{
  return self->_sleepGoal;
}

- (void)setSleepGoal:(double)a3
{
  self->_sleepGoal = a3;
}

- (BOOL)watchSleepTrackingEnabled
{
  return self->_watchSleepTrackingEnabled;
}

- (void)setWatchSleepTrackingEnabled:(BOOL)a3
{
  self->_watchSleepTrackingEnabled = a3;
}

- (BOOL)timeInBedTrackingEnabled
{
  return self->_timeInBedTrackingEnabled;
}

- (void)setTimeInBedTrackingEnabled:(BOOL)a3
{
  self->_timeInBedTrackingEnabled = a3;
}

- (BOOL)bedTimeWindDownRemindersEnabled
{
  return self->_bedTimeWindDownRemindersEnabled;
}

- (void)setBedTimeWindDownRemindersEnabled:(BOOL)a3
{
  self->_bedTimeWindDownRemindersEnabled = a3;
}

- (BOOL)wakeUpResultsEnabled
{
  return self->_wakeUpResultsEnabled;
}

- (void)setWakeUpResultsEnabled:(BOOL)a3
{
  self->_wakeUpResultsEnabled = a3;
}

- (BOOL)scheduledSleepModeEnabled
{
  return self->_scheduledSleepModeEnabled;
}

- (void)setScheduledSleepModeEnabled:(BOOL)a3
{
  self->_scheduledSleepModeEnabled = a3;
}

- (BOOL)chargeRemindersEnabled
{
  return self->_chargeRemindersEnabled;
}

- (void)setChargeRemindersEnabled:(BOOL)a3
{
  self->_chargeRemindersEnabled = a3;
}

- (BOOL)scheduleDisabled
{
  return self->_scheduleDisabled;
}

- (void)setScheduleDisabled:(BOOL)a3
{
  self->_scheduleDisabled = a3;
}

- (BOOL)scheduleMigration
{
  return self->_scheduleMigration;
}

- (void)setScheduleMigration:(BOOL)a3
{
  self->_scheduleMigration = a3;
}

- (BOOL)scheduleChangePast24Hours
{
  return self->_scheduleChangePast24Hours;
}

- (void)setScheduleChangePast24Hours:(BOOL)a3
{
  self->_scheduleChangePast24Hours = a3;
}

- (BOOL)scheduleChangePast7days
{
  return self->_scheduleChangePast7days;
}

- (void)setScheduleChangePast7days:(BOOL)a3
{
  self->_scheduleChangePast7days = a3;
}

- (BOOL)interactedWithWindDownLast24Hrs
{
  return self->_interactedWithWindDownLast24Hrs;
}

- (void)setInteractedWithWindDownLast24Hrs:(BOOL)a3
{
  self->_interactedWithWindDownLast24Hrs = a3;
}

- (BOOL)useSleepScreen
{
  return self->_useSleepScreen;
}

- (void)setUseSleepScreen:(BOOL)a3
{
  self->_useSleepScreen = a3;
}

- (int64_t)maxSleepTrackingVersionOnboarded
{
  return self->_maxSleepTrackingVersionOnboarded;
}

- (void)setMaxSleepTrackingVersionOnboarded:(int64_t)a3
{
  self->_maxSleepTrackingVersionOnboarded = a3;
}

- (int64_t)maxSleepCoachingVersionOnboarded
{
  return self->_maxSleepCoachingVersionOnboarded;
}

- (void)setMaxSleepCoachingVersionOnboarded:(int64_t)a3
{
  self->_maxSleepCoachingVersionOnboarded = a3;
}

- (BOOL)hasSleepFocusConfigured
{
  return self->_hasSleepFocusConfigured;
}

- (void)setHasSleepFocusConfigured:(BOOL)a3
{
  self->_hasSleepFocusConfigured = a3;
}

- (BOOL)alarmFriday
{
  return self->_alarmFriday;
}

- (void)setAlarmFriday:(BOOL)a3
{
  self->_alarmFriday = a3;
}

- (BOOL)alarmMonday
{
  return self->_alarmMonday;
}

- (void)setAlarmMonday:(BOOL)a3
{
  self->_alarmMonday = a3;
}

- (BOOL)alarmSaturday
{
  return self->_alarmSaturday;
}

- (void)setAlarmSaturday:(BOOL)a3
{
  self->_alarmSaturday = a3;
}

- (BOOL)alarmSunday
{
  return self->_alarmSunday;
}

- (void)setAlarmSunday:(BOOL)a3
{
  self->_alarmSunday = a3;
}

- (BOOL)alarmThursday
{
  return self->_alarmThursday;
}

- (void)setAlarmThursday:(BOOL)a3
{
  self->_alarmThursday = a3;
}

- (BOOL)alarmTuesday
{
  return self->_alarmTuesday;
}

- (void)setAlarmTuesday:(BOOL)a3
{
  self->_alarmTuesday = a3;
}

- (BOOL)alarmWednesday
{
  return self->_alarmWednesday;
}

- (void)setAlarmWednesday:(BOOL)a3
{
  self->_alarmWednesday = a3;
}

- (BOOL)scheduleFriday
{
  return self->_scheduleFriday;
}

- (void)setScheduleFriday:(BOOL)a3
{
  self->_scheduleFriday = a3;
}

- (BOOL)scheduleMonday
{
  return self->_scheduleMonday;
}

- (void)setScheduleMonday:(BOOL)a3
{
  self->_scheduleMonday = a3;
}

- (BOOL)scheduleSaturday
{
  return self->_scheduleSaturday;
}

- (void)setScheduleSaturday:(BOOL)a3
{
  self->_scheduleSaturday = a3;
}

- (BOOL)scheduleSunday
{
  return self->_scheduleSunday;
}

- (void)setScheduleSunday:(BOOL)a3
{
  self->_scheduleSunday = a3;
}

- (BOOL)scheduleThursday
{
  return self->_scheduleThursday;
}

- (void)setScheduleThursday:(BOOL)a3
{
  self->_scheduleThursday = a3;
}

- (BOOL)scheduleTuesday
{
  return self->_scheduleTuesday;
}

- (void)setScheduleTuesday:(BOOL)a3
{
  self->_scheduleTuesday = a3;
}

- (BOOL)scheduleWednesday
{
  return self->_scheduleWednesday;
}

- (void)setScheduleWednesday:(BOOL)a3
{
  self->_scheduleWednesday = a3;
}

- (NSString)hapticToneIdentifierFriday
{
  return self->_hapticToneIdentifierFriday;
}

- (void)setHapticToneIdentifierFriday:(id)a3
{
}

- (NSString)hapticToneIdentifierMonday
{
  return self->_hapticToneIdentifierMonday;
}

- (void)setHapticToneIdentifierMonday:(id)a3
{
}

- (NSString)hapticToneIdentifierSaturday
{
  return self->_hapticToneIdentifierSaturday;
}

- (void)setHapticToneIdentifierSaturday:(id)a3
{
}

- (NSString)hapticToneIdentifierSunday
{
  return self->_hapticToneIdentifierSunday;
}

- (void)setHapticToneIdentifierSunday:(id)a3
{
}

- (NSString)hapticToneIdentifierThursday
{
  return self->_hapticToneIdentifierThursday;
}

- (void)setHapticToneIdentifierThursday:(id)a3
{
}

- (NSString)hapticToneIdentifierTuesday
{
  return self->_hapticToneIdentifierTuesday;
}

- (void)setHapticToneIdentifierTuesday:(id)a3
{
}

- (NSString)hapticToneIdentifierWednesday
{
  return self->_hapticToneIdentifierWednesday;
}

- (void)setHapticToneIdentifierWednesday:(id)a3
{
}

- (BOOL)isDefaultScheduleFriday
{
  return self->_isDefaultScheduleFriday;
}

- (void)setIsDefaultScheduleFriday:(BOOL)a3
{
  self->_isDefaultScheduleFriday = a3;
}

- (BOOL)isDefaultScheduleMonday
{
  return self->_isDefaultScheduleMonday;
}

- (void)setIsDefaultScheduleMonday:(BOOL)a3
{
  self->_isDefaultScheduleMonday = a3;
}

- (BOOL)isDefaultScheduleSaturday
{
  return self->_isDefaultScheduleSaturday;
}

- (void)setIsDefaultScheduleSaturday:(BOOL)a3
{
  self->_isDefaultScheduleSaturday = a3;
}

- (BOOL)isDefaultScheduleSunday
{
  return self->_isDefaultScheduleSunday;
}

- (void)setIsDefaultScheduleSunday:(BOOL)a3
{
  self->_isDefaultScheduleSunday = a3;
}

- (BOOL)isDefaultScheduleThursday
{
  return self->_isDefaultScheduleThursday;
}

- (void)setIsDefaultScheduleThursday:(BOOL)a3
{
  self->_isDefaultScheduleThursday = a3;
}

- (BOOL)isDefaultScheduleTuesday
{
  return self->_isDefaultScheduleTuesday;
}

- (void)setIsDefaultScheduleTuesday:(BOOL)a3
{
  self->_isDefaultScheduleTuesday = a3;
}

- (BOOL)isDefaultScheduleWednesday
{
  return self->_isDefaultScheduleWednesday;
}

- (void)setIsDefaultScheduleWednesday:(BOOL)a3
{
  self->_isDefaultScheduleWednesday = a3;
}

- (NSNumber)stddevActualTimeAsleep
{
  return self->_stddevActualTimeAsleep;
}

- (void)setStddevActualTimeAsleep:(id)a3
{
}

- (NSNumber)stddevScheduledTimeAsleep
{
  return self->_stddevScheduledTimeAsleep;
}

- (void)setStddevScheduledTimeAsleep:(id)a3
{
}

- (NSNumber)stddevActualVsScheduledTimeAsleep
{
  return self->_stddevActualVsScheduledTimeAsleep;
}

- (void)setStddevActualVsScheduledTimeAsleep:(id)a3
{
}

- (int64_t)daysWornWatchToSleepInLast7Days
{
  return self->_daysWornWatchToSleepInLast7Days;
}

- (void)setDaysWornWatchToSleepInLast7Days:(int64_t)a3
{
  self->_daysWornWatchToSleepInLast7Days = a3;
}

- (int64_t)daysWornWatchToSleepInLast30Days
{
  return self->_daysWornWatchToSleepInLast30Days;
}

- (void)setDaysWornWatchToSleepInLast30Days:(int64_t)a3
{
  self->_daysWornWatchToSleepInLast30Days = a3;
}

- (int64_t)weekendDaysWornWatchToSleepInLast7Days
{
  return self->_weekendDaysWornWatchToSleepInLast7Days;
}

- (void)setWeekendDaysWornWatchToSleepInLast7Days:(int64_t)a3
{
  self->_weekendDaysWornWatchToSleepInLast7Days = a3;
}

- (BOOL)didWearWatchToSleepLastNight
{
  return self->_didWearWatchToSleepLastNight;
}

- (void)setDidWearWatchToSleepLastNight:(BOOL)a3
{
  self->_didWearWatchToSleepLastNight = a3;
}

- (double)sleepDurationLastNight
{
  return self->_sleepDurationLastNight;
}

- (void)setSleepDurationLastNight:(double)a3
{
  self->_sleepDurationLastNight = a3;
}

- (double)sleepStagePercentAwakeLastNight
{
  return self->_sleepStagePercentAwakeLastNight;
}

- (void)setSleepStagePercentAwakeLastNight:(double)a3
{
  self->_sleepStagePercentAwakeLastNight = a3;
}

- (double)sleepStagePercentRemLastNight
{
  return self->_sleepStagePercentRemLastNight;
}

- (void)setSleepStagePercentRemLastNight:(double)a3
{
  self->_sleepStagePercentRemLastNight = a3;
}

- (double)sleepStagePercentCoreLastNight
{
  return self->_sleepStagePercentCoreLastNight;
}

- (void)setSleepStagePercentCoreLastNight:(double)a3
{
  self->_sleepStagePercentCoreLastNight = a3;
}

- (double)sleepStagePercentDeepLastNight
{
  return self->_sleepStagePercentDeepLastNight;
}

- (void)setSleepStagePercentDeepLastNight:(double)a3
{
  self->_sleepStagePercentDeepLastNight = a3;
}

- (NSNumber)isOnboardedBD
{
  return self->_isOnboardedBD;
}

- (void)setIsOnboardedBD:(id)a3
{
}

- (NSNumber)meanTimeBetweenBDSessionsPastNight
{
  return self->_meanTimeBetweenBDSessionsPastNight;
}

- (void)setMeanTimeBetweenBDSessionsPastNight:(id)a3
{
}

- (NSNumber)maxTimeBetweenBDSessionsPastNight
{
  return self->_maxTimeBetweenBDSessionsPastNight;
}

- (void)setMaxTimeBetweenBDSessionsPastNight:(id)a3
{
}

- (NSNumber)minTimeBetweenBDSessionsPastNight
{
  return self->_minTimeBetweenBDSessionsPastNight;
}

- (void)setMinTimeBetweenBDSessionsPastNight:(id)a3
{
}

- (NSNumber)numBDValuesInPastNight
{
  return self->_numBDValuesInPastNight;
}

- (void)setNumBDValuesInPastNight:(id)a3
{
}

- (NSNumber)numBDValuesInPast30Days
{
  return self->_numBDValuesInPast30Days;
}

- (void)setNumBDValuesInPast30Days:(id)a3
{
}

- (NSNumber)numSleepSessionsWithBDsOverThresholdLast30Days
{
  return self->_numSleepSessionsWithBDsOverThresholdLast30Days;
}

- (void)setNumSleepSessionsWithBDsOverThresholdLast30Days:(id)a3
{
}

- (NSNumber)maxBDValueInPast30Days
{
  return self->_maxBDValueInPast30Days;
}

- (void)setMaxBDValueInPast30Days:(id)a3
{
}

- (NSNumber)numSleepDaysWithBDsOverThresholdLast30Days
{
  return self->_numSleepDaysWithBDsOverThresholdLast30Days;
}

- (void)setNumSleepDaysWithBDsOverThresholdLast30Days:(id)a3
{
}

- (NSNumber)numSleepDaysWithMultipleBDinPast30Days
{
  return self->_numSleepDaysWithMultipleBDinPast30Days;
}

- (void)setNumSleepDaysWithMultipleBDinPast30Days:(id)a3
{
}

- (NSString)BDOnboardingCountryCode
{
  return self->_BDOnboardingCountryCode;
}

- (void)setBDOnboardingCountryCode:(id)a3
{
}

- (NSNumber)weeksSinceOnboardedBD
{
  return self->_weeksSinceOnboardedBD;
}

- (void)setWeeksSinceOnboardedBD:(id)a3
{
}

- (NSNumber)areHealthNotificationsAuthorized
{
  return self->_areHealthNotificationsAuthorized;
}

- (void)setAreHealthNotificationsAuthorized:(id)a3
{
}

- (NSNumber)numBDNotificationsInPastNight
{
  return self->_numBDNotificationsInPastNight;
}

- (void)setNumBDNotificationsInPastNight:(id)a3
{
}

- (NSNumber)numBDNotificationsInPast30Nights
{
  return self->_numBDNotificationsInPast30Nights;
}

- (void)setNumBDNotificationsInPast30Nights:(id)a3
{
}

- (NSNumber)numBDNotificationsInPast180Nights
{
  return self->_numBDNotificationsInPast180Nights;
}

- (void)setNumBDNotificationsInPast180Nights:(id)a3
{
}

- (NSNumber)numDaysSinceLastBDNotification
{
  return self->_numDaysSinceLastBDNotification;
}

- (void)setNumDaysSinceLastBDNotification:(id)a3
{
}

- (NSNumber)numDaysSinceLastAnalysis
{
  return self->_numDaysSinceLastAnalysis;
}

- (void)setNumDaysSinceLastAnalysis:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numDaysSinceLastAnalysis, 0);
  objc_storeStrong((id *)&self->_numDaysSinceLastBDNotification, 0);
  objc_storeStrong((id *)&self->_numBDNotificationsInPast180Nights, 0);
  objc_storeStrong((id *)&self->_numBDNotificationsInPast30Nights, 0);
  objc_storeStrong((id *)&self->_numBDNotificationsInPastNight, 0);
  objc_storeStrong((id *)&self->_areHealthNotificationsAuthorized, 0);
  objc_storeStrong((id *)&self->_weeksSinceOnboardedBD, 0);
  objc_storeStrong((id *)&self->_BDOnboardingCountryCode, 0);
  objc_storeStrong((id *)&self->_numSleepDaysWithMultipleBDinPast30Days, 0);
  objc_storeStrong((id *)&self->_numSleepDaysWithBDsOverThresholdLast30Days, 0);
  objc_storeStrong((id *)&self->_maxBDValueInPast30Days, 0);
  objc_storeStrong((id *)&self->_numSleepSessionsWithBDsOverThresholdLast30Days, 0);
  objc_storeStrong((id *)&self->_numBDValuesInPast30Days, 0);
  objc_storeStrong((id *)&self->_numBDValuesInPastNight, 0);
  objc_storeStrong((id *)&self->_minTimeBetweenBDSessionsPastNight, 0);
  objc_storeStrong((id *)&self->_maxTimeBetweenBDSessionsPastNight, 0);
  objc_storeStrong((id *)&self->_meanTimeBetweenBDSessionsPastNight, 0);
  objc_storeStrong((id *)&self->_isOnboardedBD, 0);
  objc_storeStrong((id *)&self->_stddevActualVsScheduledTimeAsleep, 0);
  objc_storeStrong((id *)&self->_stddevScheduledTimeAsleep, 0);
  objc_storeStrong((id *)&self->_stddevActualTimeAsleep, 0);
  objc_storeStrong((id *)&self->_hapticToneIdentifierWednesday, 0);
  objc_storeStrong((id *)&self->_hapticToneIdentifierTuesday, 0);
  objc_storeStrong((id *)&self->_hapticToneIdentifierThursday, 0);
  objc_storeStrong((id *)&self->_hapticToneIdentifierSunday, 0);
  objc_storeStrong((id *)&self->_hapticToneIdentifierSaturday, 0);
  objc_storeStrong((id *)&self->_hapticToneIdentifierMonday, 0);
  objc_storeStrong((id *)&self->_hapticToneIdentifierFriday, 0);
  objc_storeStrong((id *)&self->_activeWatchProductType, 0);
  objc_storeStrong((id *)&self->_weeksSinceOnboardedWindDownActions, 0);
  objc_storeStrong((id *)&self->_weeksSinceOnboardedSleepTracking, 0);
  objc_storeStrong((id *)&self->_weeksSinceOnboardedSleepSchedule, 0);
  objc_storeStrong((id *)&self->_biologicalSex, 0);
  objc_storeStrong((id *)&self->_userAge, 0);
}

@end