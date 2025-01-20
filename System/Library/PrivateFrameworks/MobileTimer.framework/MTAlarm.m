@interface MTAlarm
+ (BOOL)_date:(id)a3 isOnDay:(int64_t)a4 calendar:(id)a5;
+ (BOOL)_isInternalBuild;
+ (BOOL)supportsSecureCoding;
+ (MTAlarm)alarmWithHour:(unint64_t)a3 minute:(unint64_t)a4;
+ (id)alarm;
+ (id)mostRecentlyUpdatedAlarmForAlarms:(id)a3;
+ (id)propertiesAffectingBedtime;
+ (id)propertiesAffectingNotification;
+ (id)propertiesAffectingSessions;
+ (id)propertiesAffectingSnooze;
+ (id)propertiesAffectingSync;
+ (id)propertiesAffectingWaketime;
+ (id)sleepAlarm;
+ (id)sleepAlarmWithHour:(int64_t)a3 minute:(int64_t)a4;
+ (id)sleepAlarmWithHour:(int64_t)a3 minute:(int64_t)a4 bedtimeHour:(int64_t)a5 bedtimeMinute:(int64_t)a6;
+ (id)sleepAlarmWithHour:(int64_t)a3 minute:(int64_t)a4 year:(int64_t)a5 month:(int64_t)a6 day:(int64_t)a7 bedtimeHour:(int64_t)a8 bedtimeMinute:(int64_t)a9;
+ (id)sleepAlarmWithId:(id)a3;
+ (id)sleepAlarmWithSchedule:(unint64_t)a3;
+ (id)sleepScheduleString:(unint64_t)byte7;
+ (unint64_t)defaultSleepModeOptions;
- (BOOL)_isEqualToAlarm:(id)a3 checkLastModified:(BOOL)a4;
- (BOOL)allowsSnooze;
- (BOOL)confirmedLastBedtimeReminder;
- (BOOL)isBedtimeSnoozed;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualIgnoringLastModifiedDate:(id)a3;
- (BOOL)isEqualToAlarm:(id)a3;
- (BOOL)isFiring;
- (BOOL)isSingleTimeAlarm;
- (BOOL)isSleepAlarm;
- (BOOL)isSnoozed;
- (BOOL)isValidDateComponent:(int64_t)a3;
- (BOOL)overridesAlarm:(id)a3 trigger:(id)a4 calendar:(id)a5;
- (BOOL)overridesNextAlarm:(id)a3 date:(id)a4 calendar:(id)a5;
- (BOOL)overridesScheduledObject:(id)a3 calendar:(id)a4;
- (BOOL)repeats;
- (BOOL)shouldBeScheduled;
- (BOOL)shouldBypassWidgetReload;
- (BOOL)sleepMode;
- (BOOL)sleepSchedule;
- (BOOL)sleepTracking;
- (BOOL)timeInBedTracking;
- (MTAlarm)init;
- (MTAlarm)initWithCurrentTimeFromCurrentDateProvider:(id)a3;
- (MTAlarm)initWithHour:(unint64_t)a3 minute:(unint64_t)a4;
- (MTAlarm)initWithHour:(unint64_t)a3 minute:(unint64_t)a4 currentDateProvider:(id)a5;
- (MTAlarm)initWithIdentifier:(id)a3;
- (MTIntentAlarm)intentAlarm;
- (MTSound)sound;
- (NSDate)bedtimeDismissedDate;
- (NSDate)bedtimeFiredDate;
- (NSDate)bedtimeSnoozeFireDate;
- (NSDate)bypassReloadDate;
- (NSDate)dismissedDate;
- (NSDate)firedDate;
- (NSDate)keepOffUntilDate;
- (NSDate)lastModifiedDate;
- (NSDate)nextFireDate;
- (NSDate)overriddenForDate;
- (NSDate)snoozeFireDate;
- (NSDictionary)siriContext;
- (NSNumber)bedtimeReminder;
- (NSString)description;
- (NSString)displayTitle;
- (NSString)title;
- (NSURL)alarmURL;
- (NSUUID)alarmID;
- (double)sleepDurationSeconds;
- (id)_earliestTriggerDateForDate:(id)a3;
- (id)_initCommon;
- (id)_nextDateHelperWithDate:(id)a3 calendar:(id)a4;
- (id)alarmIDIntentObject;
- (id)alarmIDString;
- (id)alarmIntentDisplayString;
- (id)bedtimeComponents;
- (id)currentDateProvider;
- (id)dateComponents;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)initFromDeserializer:(id)a3;
- (id)intentLabel;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)nextExpectedBedtimeDateAfterDate:(id)a3;
- (id)nextExpectedWakeUpDateAfterDate:(id)a3;
- (id)nextFireDateAfterDate:(id)a3;
- (id)nextFireDateAfterDate:(id)a3 includeBedtimeNotification:(BOOL)a4;
- (id)nextTrigger;
- (id)nextTriggerAfterDate:(id)a3;
- (id)nextTriggerAfterDate:(id)a3 includeBedtimeNotification:(BOOL)a4;
- (id)nextTriggerAfterDate:(id)a3 includeSnooze:(BOOL)a4 includeBedtimeNotification:(BOOL)a5;
- (id)nextTriggerAfterDate:(id)a3 ofType:(unint64_t)a4;
- (id)nextTriggersAfterDate:(id)a3;
- (id)nextTriggersAfterDate:(id)a3 includeBedtime:(BOOL)a4;
- (id)nextTriggersAfterDate:(id)a3 includeSnooze:(BOOL)a4 includeBedtimeNotification:(BOOL)a5;
- (id)nextTriggersAfterDate:(id)a3 inclusionOptions:(unint64_t)a4;
- (id)singleTimeOverrideDateInCalendar:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)timeObject;
- (id)upcomingTriggersAfterDate:(id)a3;
- (int64_t)compare:(id)a3;
- (unint64_t)bedtimeDismissedAction;
- (unint64_t)bedtimeHour;
- (unint64_t)bedtimeMinute;
- (unint64_t)bedtimeReminderMinutes;
- (unint64_t)day;
- (unint64_t)dismissedAction;
- (unint64_t)hash;
- (unint64_t)hour;
- (unint64_t)minute;
- (unint64_t)month;
- (unint64_t)onboardingVersion;
- (unint64_t)repeatSchedule;
- (unint64_t)sleepDuration;
- (unint64_t)sleepModeOptions;
- (unint64_t)year;
- (void)_copyStateOntoAlarm:(id)a3;
- (void)_updatePropertiesFromDeserializer:(id)a3;
- (void)resetSnoozeFireDate;
- (void)serializeWithSerializer:(id)a3;
- (void)setAllowsSnooze:(BOOL)a3;
- (void)setBedtimeDismissedAction:(unint64_t)a3;
- (void)setBedtimeDismissedDate:(id)a3;
- (void)setBedtimeFiredDate:(id)a3;
- (void)setBedtimeHour:(unint64_t)a3;
- (void)setBedtimeMinute:(unint64_t)a3;
- (void)setBedtimeReminder:(id)a3;
- (void)setBedtimeReminderMinutes:(unint64_t)a3;
- (void)setBedtimeSnoozeFireDate:(id)a3;
- (void)setBypassReloadDate:(id)a3;
- (void)setCurrentDateProvider:(id)a3;
- (void)setDay:(unint64_t)a3;
- (void)setDismissedAction:(unint64_t)a3;
- (void)setDismissedDate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFiredDate:(id)a3;
- (void)setHour:(unint64_t)a3;
- (void)setKeepOffUntilDate:(id)a3;
- (void)setLastModifiedDate:(id)a3;
- (void)setMinute:(unint64_t)a3;
- (void)setMonth:(unint64_t)a3;
- (void)setOnboardingVersion:(unint64_t)a3;
- (void)setOverriddenForDate:(id)a3;
- (void)setRepeatSchedule:(unint64_t)a3;
- (void)setSiriContext:(id)a3;
- (void)setSleepAlarm:(BOOL)a3;
- (void)setSleepMode:(BOOL)a3;
- (void)setSleepModeOptions:(unint64_t)a3;
- (void)setSleepSchedule:(BOOL)a3;
- (void)setSleepTracking:(BOOL)a3;
- (void)setSnoozeFireDate:(id)a3;
- (void)setSound:(id)a3;
- (void)setTimeInBedTracking:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)setYear:(unint64_t)a3;
@end

@implementation MTAlarm

- (NSString)description
{
  return (NSString *)[(MTAlarm *)self descriptionWithMultilinePrefix:0];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(MTAlarm *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)initFromDeserializer:(id)a3
{
  id v4 = a3;
  id v5 = [(MTAlarm *)self _initCommon];
  v6 = v5;
  if (v5) {
    [v5 _updatePropertiesFromDeserializer:v4];
  }

  return v6;
}

- (id)_initCommon
{
  v6.receiver = self;
  v6.super_class = (Class)MTAlarm;
  v2 = [(MTAlarm *)&v6 init];
  uint64_t v3 = MTCurrentDateProvider();
  id v4 = (void *)*((void *)v2 + 27);
  *((void *)v2 + 27) = v3;

  *(int64x2_t *)(v2 + 40) = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  *((void *)v2 + 7) = 0x7FFFFFFFFFFFFFFFLL;
  return v2;
}

- (void)_updatePropertiesFromDeserializer:(id)a3
{
  uint64_t v126 = *MEMORY[0x1E4F143B8];
  id v121 = a3;
  id v4 = [v121 mtCoder];
  if ([v4 mtType] != 3)
  {
    BOOL v8 = 0;
    BOOL v9 = 0;
    char v10 = 0;
    uint64_t v119 = 0;
    uint64_t v120 = 0;
    BOOL v11 = 0;
    BOOL v12 = 0;
    char v13 = 0;
    char v14 = 0;
    goto LABEL_103;
  }
  [v4 decodeFloatForKey:@"MTAlarmDataVersion"];
  float v6 = v5;
  if (v5 >= 1.2)
  {
    int v7 = 0;
  }
  else
  {
    self->_BOOL enabled = [v4 decodeBoolForKey:@"MTAlarmActive"];
    int v7 = 1;
  }
  if (v6 < 1.3)
  {
    v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTAlarmID"];
    alarmID = self->_alarmID;
    self->_alarmID = v15;
  }
  if (v6 < 1.4 && v6 >= 1.2)
  {
    self->_BOOL enabled = [v4 decodeIntegerForKey:@"MTAlarmActive"] != 0;
    int v7 = 1;
  }
  v17 = &off_19CD53000;
  if (v6 < 1.6)
  {
    char v20 = [v4 decodeBoolForKey:@"MTAlarmIsSleep"];
    self->_BOOL sleepAlarm = v20;
    if (v20)
    {
      int v19 = 0;
    }
    else
    {
      v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTAlarmSound"];
      v23 = [[MTSound alloc] initWithSound:v22 usingVolume:0];
      sound = self->_sound;
      self->_sound = v23;

      int v19 = 1;
    }
    if (v6 >= 1.8 || !self->_sleepAlarm) {
      goto LABEL_25;
    }
  }
  else
  {
    if (v6 >= 1.8)
    {
      if (v6 >= 1.9)
      {
        int v19 = 0;
        if (v6 >= 2.2)
        {
          uint64_t v118 = 0;
          char v38 = 0;
          int v40 = 0;
          char v117 = 0;
          BOOL v39 = 0;
          int v21 = 0;
          if (v6 < 2.3) {
            goto LABEL_56;
          }
          goto LABEL_74;
        }
        goto LABEL_43;
      }
      int v21 = 0;
      goto LABEL_31;
    }
    int v18 = [v4 decodeBoolForKey:@"MTAlarmIsSleep"];
    self->_BOOL sleepAlarm = v18;
    if (!v18)
    {
      int v21 = 1;
      if (v6 >= 1.9)
      {
        int v19 = 0;
        goto LABEL_36;
      }
      goto LABEL_31;
    }
    int v19 = 0;
    char v20 = 1;
  }
  v25 = MTLogForCategory(3);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v26 = +[MTPairedDevicePreferences sharedInstance];
    *(_DWORD *)buf = 67109120;
    int v123 = [v26 pushAlertsEnabled];
    _os_log_impl(&dword_19CC95000, v25, OS_LOG_TYPE_DEFAULT, "[Migration] (1.8) pushAlertsEnabled: %d", buf, 8u);
  }
LABEL_25:
  if (v6 >= 1.9)
  {
    int v21 = 1;
    goto LABEL_36;
  }
  if (v20)
  {
    int v21 = 1;
LABEL_31:
    v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTAlarmSound"];

    goto LABEL_32;
  }
  v27 = self->_sound;
  int v21 = 1;
LABEL_32:
  if ([(MTSound *)v27 soundType] == 1)
  {
    uint64_t v28 = *MEMORY[0x1E4FAF638];
    v29 = [(MTSound *)v27 vibrationIdentifier];
    v30 = [(MTSound *)v27 soundVolume];
    uint64_t v31 = v28;
    v17 = &off_19CD53000;
    v32 = +[MTSound toneSoundWithIdentifier:v31 vibrationIdentifer:v29 volume:v30];
    objc_storeStrong((id *)&self->_sound, v32);
  }
  else
  {
    v33 = v27;
    v29 = self->_sound;
    self->_sound = v33;
  }

  int v19 = 1;
LABEL_36:
  if (v6 < 2.2)
  {
    if (v21)
    {
      if (self->_sleepAlarm)
      {
LABEL_39:
        if (v7)
        {
          self->_BOOL sleepSchedule = self->_enabled;
LABEL_46:
          if ([v4 decodeBoolForKey:@"MTAlarmSleepModeDetectionKey"]) {
            self->_sleepModeOptions = 32;
          }
          int v7 = 1;
          self->_timeInBedTracking = 1;
          uint64_t v118 = 0x100000001;
          goto LABEL_49;
        }
        char v35 = [v4 decodeBoolForKey:@"MTAlarmEnabled"];
        BOOL sleepAlarm = self->_sleepAlarm;
        self->_BOOL enabled = v35;
        self->_BOOL sleepSchedule = v35;
        if (sleepAlarm) {
          goto LABEL_46;
        }
        int v7 = 1;
        uint64_t v118 = 1;
LABEL_49:
        int v21 = 1;
        goto LABEL_50;
      }
LABEL_44:
      uint64_t v118 = 0;
      goto LABEL_49;
    }
LABEL_43:
    int v34 = [v4 decodeBoolForKey:@"MTAlarmIsSleep"];
    self->_BOOL sleepAlarm = v34;
    if (v34) {
      goto LABEL_39;
    }
    goto LABEL_44;
  }
  uint64_t v118 = 0;
LABEL_50:
  if (v6 < *((float *)v17 + 769))
  {
    if (v21)
    {
      char v37 = self->_sleepAlarm;
      goto LABEL_57;
    }
LABEL_56:
    char v37 = [v4 decodeBoolForKey:@"MTAlarmIsSleep"];
LABEL_57:
    int v40 = HIDWORD(v118);
    self->_BOOL sleepAlarm = v37;
    v41 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTAlarmDismissDate"];
    p_dismissedDate = &self->_dismissedDate;
    dismissedDate = self->_dismissedDate;
    self->_dismissedDate = v41;

    self->_dismissedAction = 0;
    BOOL v39 = self->_sleepAlarm;
    if (!v39)
    {
      char v117 = 0;
      char v38 = 1;
      int v21 = 1;
      goto LABEL_74;
    }
    v44 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTAlarmWakeupForSleepTracking"];
    v45 = v44;
    if (!v44) {
      v45 = *p_dismissedDate;
    }
    objc_storeStrong((id *)&self->_dismissedDate, v45);
    self->_dismissedAction = 5;
    if ([(NSDate *)v44 mtIsAfterDate:self->_dismissedDate]) {
      v46 = v44;
    }
    else {
      v46 = 0;
    }
    objc_storeStrong((id *)&self->_keepOffUntilDate, v46);
    v47 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTAlarmBedtimeForSleepTracking"];
    objc_storeStrong((id *)&self->_bedtimeDismissedDate, v47);
    unint64_t v48 = 1;
    if (v47) {
      unint64_t v48 = 2;
    }
    self->_bedtimeDismissedAction = v48;
    char v49 = [v4 decodeBoolForKey:@"MTAlarmFiring"];
    v50 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTAlarmFireDate"];
    firedDate = self->_firedDate;
    self->_firedDate = v50;

    if ((v49 & 1) == 0)
    {
      v52 = self->_firedDate;
      if (v52)
      {
        if (!*p_dismissedDate)
        {
LABEL_70:
          objc_storeStrong((id *)&self->_bedtimeFiredDate, v52);
          v53 = self->_firedDate;
          self->_firedDate = 0;

          char v117 = 1;
LABEL_72:

          char v38 = 1;
          BOOL v39 = 1;
          int v21 = 1;
          int v40 = HIDWORD(v118);
          goto LABEL_74;
        }
        if (-[NSDate mtIsAfterDate:](self->_firedDate, "mtIsAfterDate:"))
        {
          v52 = self->_firedDate;
          goto LABEL_70;
        }
      }
    }
    char v117 = 0;
    goto LABEL_72;
  }
  char v38 = 0;
  char v117 = 0;
  BOOL v39 = 0;
  int v40 = HIDWORD(v118);
LABEL_74:
  BYTE4(v120) = v39;
  BOOL v54 = v6 < 2.4;
  BYTE4(v119) = v38;
  if (v6 < 2.4)
  {
    unint64_t v55 = [v4 decodeIntegerForKey:@"MTAlarmOnboardingVersion"];
    self->_onboardingVersion = v55;
    if (!v55)
    {
      self->_sleepModeOptions = [(id)objc_opt_class() defaultSleepModeOptions];
      int v40 = 1;
    }
  }
  if (v6 < 2.5
    && (unint64_t v56 = [v4 decodeIntegerForKey:@"MTAlarmOnboardingVersion"],
        self->_onboardingVersion = v56,
        BOOL v54 = 1,
        v56))
  {
    self->_sleepMode = 1;
    self->_sleepModeOptions = [(id)objc_opt_class() defaultSleepModeOptions];
    int v40 = 1;
    LOBYTE(v119) = 1;
  }
  else
  {
    LOBYTE(v119) = 0;
  }
  if (v6 < 2.6)
  {
    if (v21)
    {
      if (self->_sleepAlarm)
      {
LABEL_84:
        int v57 = v40;
        int v58 = [v4 decodeBoolForKey:@"MTAlarmEnabled"];
        int v59 = [v4 decodeBoolForKey:@"MTAlarmSleepScheduleKey"];
        v60 = MTLogForCategory(3);
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109376;
          int v123 = v58;
          __int16 v124 = 1024;
          BOOL v125 = v59;
          _os_log_impl(&dword_19CC95000, v60, OS_LOG_TYPE_DEFAULT, "[Migration] (2.6) old enabled: %d, sleepSchedule: %d", buf, 0xEu);
        }

        self->_BOOL enabled = v58 | v59;
        self->_BOOL sleepSchedule = v58 | v59;
        v61 = MTLogForCategory(3);
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
        {
          BOOL enabled = self->_enabled;
          BOOL sleepSchedule = self->_sleepSchedule;
          *(_DWORD *)buf = 67109376;
          int v123 = enabled;
          __int16 v124 = 1024;
          BOOL v125 = sleepSchedule;
          _os_log_impl(&dword_19CC95000, v61, OS_LOG_TYPE_DEFAULT, "[Migration] (2.6) new enabled: %d, sleepSchedule: %d", buf, 0xEu);
        }

        LODWORD(v118) = 1;
        int v21 = 1;
        int v7 = 1;
        int v40 = v57;
        goto LABEL_91;
      }
    }
    else
    {
      int v64 = [v4 decodeBoolForKey:@"MTAlarmIsSleep"];
      self->_BOOL sleepAlarm = v64;
      if (v64) {
        goto LABEL_84;
      }
    }
    int v21 = 1;
  }
LABEL_91:
  LOBYTE(v120) = v54;
  if (v6 >= 3.0)
  {
    char v13 = 0;
    goto LABEL_99;
  }
  if (!v21)
  {
    int v69 = [v4 decodeBoolForKey:@"MTAlarmIsSleep"];
    self->_BOOL sleepAlarm = v69;
    if (v69) {
      goto LABEL_94;
    }
LABEL_97:
    char v13 = 0;
    goto LABEL_98;
  }
  if (!self->_sleepAlarm) {
    goto LABEL_97;
  }
LABEL_94:
  v65 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTAlarmRepeatSchedule"];
  self->_repeatSchedule = [v65 unsignedIntegerValue];

  v66 = +[MTAlarm sleepScheduleString:self->_repeatSchedule];
  v67 = (NSUUID *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v66];
  v68 = self->_alarmID;
  self->_alarmID = v67;

  char v13 = 1;
LABEL_98:
  int v21 = 1;
LABEL_99:
  BOOL v12 = v40 != 0;
  BOOL v11 = v118 != 0;
  BOOL v9 = v21 != 0;
  BOOL v8 = v19 != 0;
  if (!v7)
  {
    char v10 = BYTE4(v118);
    char v14 = v117;
LABEL_103:
    self->_BOOL enabled = [v4 decodeBoolForKey:@"MTAlarmEnabled"];
    if (v9) {
      goto LABEL_105;
    }
    goto LABEL_104;
  }
  char v10 = BYTE4(v118);
  char v14 = v117;
  if (v21) {
    goto LABEL_105;
  }
LABEL_104:
  self->_BOOL sleepAlarm = [v4 decodeBoolForKey:@"MTAlarmIsSleep"];
LABEL_105:
  if (!v8)
  {
    v70 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTAlarmSound"];
    v71 = self->_sound;
    self->_sound = v70;
  }
  self->_sleepTracking = [v4 decodeBoolForKey:@"MTAlarmSleepTrackingKey"];
  if ((v10 & 1) == 0) {
    self->_timeInBedTracking = [v4 decodeBoolForKey:@"MTAlarmTimeInBedTrackingKey"];
  }
  if (v119)
  {
    if (v11) {
      goto LABEL_111;
    }
  }
  else
  {
    self->_sleepMode = [v4 decodeBoolForKey:@"MTAlarmBedtimeDoNotDisturb"];
    if (v11)
    {
LABEL_111:
      if (v12) {
        goto LABEL_113;
      }
      goto LABEL_112;
    }
  }
  self->_BOOL sleepSchedule = [v4 decodeBoolForKey:@"MTAlarmSleepScheduleKey"];
  if (!v12) {
LABEL_112:
  }
    self->_sleepModeOptions = [v4 decodeIntegerForKey:@"MTAlarmBedtimeDoNotDisturbOptions"];
LABEL_113:
  if ((v119 & 0x100000000) == 0)
  {
    v72 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTAlarmDismissDate"];
    v73 = self->_dismissedDate;
    self->_dismissedDate = v72;

    self->_dismissedAction = [v4 decodeIntegerForKey:@"MTAlarmDismissAction"];
    v74 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTAlarmBedtimeDismissDate"];
    bedtimeDismissedDate = self->_bedtimeDismissedDate;
    self->_bedtimeDismissedDate = v74;

    self->_bedtimeDismissedAction = [v4 decodeIntegerForKey:@"MTAlarmBedtimeDismissAction"];
    v76 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTAlarmKeepOffUntilDate"];
    keepOffUntilDate = self->_keepOffUntilDate;
    self->_keepOffUntilDate = v76;
  }
  if ((v120 & 1) == 0) {
    self->_onboardingVersion = [v4 decodeIntegerForKey:@"MTAlarmOnboardingVersion"];
  }
  if ((v120 & 0x100000000) != 0)
  {
    if (v14) {
      goto LABEL_119;
    }
  }
  else
  {
    v113 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTAlarmFireDate"];
    v114 = self->_firedDate;
    self->_firedDate = v113;

    if (v14)
    {
LABEL_119:
      if (v13) {
        goto LABEL_121;
      }
      goto LABEL_120;
    }
  }
  v115 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTAlarmBedtimeFireDate"];
  bedtimeFiredDate = self->_bedtimeFiredDate;
  self->_bedtimeFiredDate = v115;

  if ((v13 & 1) == 0)
  {
LABEL_120:
    v78 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTAlarmRepeatSchedule"];
    self->_repeatSchedule = [v78 unsignedIntegerValue];
  }
LABEL_121:
  if (!self->_alarmID)
  {
    id v79 = objc_alloc(MEMORY[0x1E4F29128]);
    v80 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTAlarmID"];
    v81 = (NSUUID *)[v79 initWithUUIDString:v80];
    v82 = self->_alarmID;
    self->_alarmID = v81;
  }
  v83 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTAlarmHour"];
  self->_hour = [v83 integerValue];

  v84 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTAlarmMinute"];
  self->_minute = [v84 integerValue];

  v85 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTAlarmBedtimeHour"];
  self->_bedtimeHour = [v85 integerValue];

  v86 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTAlarmBedtimeMinute"];
  self->_bedtimeMinute = [v86 integerValue];

  v87 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTAlarmDay"];
  unint64_t v88 = [v87 integerValue];

  if ([(MTAlarm *)self isValidDateComponent:v88]) {
    self->_day = v88;
  }
  v89 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTAlarmMonth"];
  unint64_t v90 = [v89 integerValue];

  if ([(MTAlarm *)self isValidDateComponent:v90]) {
    self->_month = v90;
  }
  v91 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTAlarmYear"];
  unint64_t v92 = [v91 integerValue];

  if ([(MTAlarm *)self isValidDateComponent:v92]) {
    self->_year = v92;
  }
  v93 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTAlarmBedtimeReminderMinutes"];
  bedtimeReminder = self->_bedtimeReminder;
  self->_bedtimeReminder = v93;

  self->_allowsSnooze = [v4 decodeBoolForKey:@"MTAlarmAllowsSnooze"];
  v95 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTAlarmSnoozeFireDate"];
  snoozeFireDate = self->_snoozeFireDate;
  self->_snoozeFireDate = v95;

  v97 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTAlarmBedtimeSnoozeFireDate"];
  bedtimeSnoozeFireDate = self->_bedtimeSnoozeFireDate;
  self->_bedtimeSnoozeFireDate = v97;

  v99 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTAlarmLastModifiedDate"];
  lastModifiedDate = self->_lastModifiedDate;
  self->_lastModifiedDate = v99;

  v101 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTAlarmTitle"];
  title = self->_title;
  self->_title = v101;

  v103 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTAlarmOverriddenForDate"];
  overriddenForDate = self->_overriddenForDate;
  self->_overriddenForDate = v103;

  v105 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v106 = objc_opt_class();
  uint64_t v107 = objc_opt_class();
  v108 = objc_msgSend(v105, "setWithObjects:", v106, v107, objc_opt_class(), 0);
  v109 = [v4 decodeObjectOfClasses:v108 forKey:@"MTAlarmSiriContext"];
  siriContext = self->_siriContext;
  self->_siriContext = v109;

  v111 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTAlarmBypassReloadDate"];
  bypassReloadDate = self->_bypassReloadDate;
  self->_bypassReloadDate = v111;
}

- (void)serializeWithSerializer:(id)a3
{
  id v28 = [a3 mtCoder];
  if ([v28 mtType] == 2)
  {
    LODWORD(v4) = 3.0;
    [v28 encodeFloat:@"MTAlarmDataVersion" forKey:v4];
  }
  float v5 = [(MTAlarm *)self alarmIDString];
  [v28 encodeObject:v5 forKey:@"MTAlarmID"];

  float v6 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[MTAlarm hour](self, "hour"));
  [v28 encodeObject:v6 forKey:@"MTAlarmHour"];

  int v7 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[MTAlarm minute](self, "minute"));
  [v28 encodeObject:v7 forKey:@"MTAlarmMinute"];

  BOOL v8 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[MTAlarm bedtimeHour](self, "bedtimeHour"));
  [v28 encodeObject:v8 forKey:@"MTAlarmBedtimeHour"];

  BOOL v9 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[MTAlarm bedtimeMinute](self, "bedtimeMinute"));
  [v28 encodeObject:v9 forKey:@"MTAlarmBedtimeMinute"];

  char v10 = [(MTAlarm *)self bedtimeReminder];
  [v28 encodeObject:v10 forKey:@"MTAlarmBedtimeReminderMinutes"];

  objc_msgSend(v28, "encodeBool:forKey:", -[MTAlarm sleepMode](self, "sleepMode"), @"MTAlarmBedtimeDoNotDisturb");
  objc_msgSend(v28, "encodeInteger:forKey:", -[MTAlarm sleepModeOptions](self, "sleepModeOptions"), @"MTAlarmBedtimeDoNotDisturbOptions");
  objc_msgSend(v28, "encodeBool:forKey:", -[MTAlarm sleepTracking](self, "sleepTracking"), @"MTAlarmSleepTrackingKey");
  if ([(MTAlarm *)self isValidDateComponent:[(MTAlarm *)self day]])
  {
    BOOL v11 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[MTAlarm day](self, "day"));
    [v28 encodeObject:v11 forKey:@"MTAlarmDay"];
  }
  if ([(MTAlarm *)self isValidDateComponent:[(MTAlarm *)self month]])
  {
    BOOL v12 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[MTAlarm month](self, "month"));
    [v28 encodeObject:v12 forKey:@"MTAlarmMonth"];
  }
  if ([(MTAlarm *)self isValidDateComponent:[(MTAlarm *)self year]])
  {
    char v13 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[MTAlarm year](self, "year"));
    [v28 encodeObject:v13 forKey:@"MTAlarmYear"];
  }
  objc_msgSend(v28, "encodeBool:forKey:", -[MTAlarm timeInBedTracking](self, "timeInBedTracking"), @"MTAlarmTimeInBedTrackingKey");
  objc_msgSend(v28, "encodeBool:forKey:", -[MTAlarm sleepSchedule](self, "sleepSchedule"), @"MTAlarmSleepScheduleKey");
  char v14 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[MTAlarm repeatSchedule](self, "repeatSchedule"));
  [v28 encodeObject:v14 forKey:@"MTAlarmRepeatSchedule"];

  objc_msgSend(v28, "encodeBool:forKey:", -[MTAlarm isEnabled](self, "isEnabled"), @"MTAlarmEnabled");
  objc_msgSend(v28, "encodeBool:forKey:", -[MTAlarm isSleepAlarm](self, "isSleepAlarm"), @"MTAlarmIsSleep");
  objc_msgSend(v28, "encodeBool:forKey:", -[MTAlarm allowsSnooze](self, "allowsSnooze"), @"MTAlarmAllowsSnooze");
  v15 = [(MTAlarm *)self snoozeFireDate];
  [v28 encodeObject:v15 forKey:@"MTAlarmSnoozeFireDate"];

  v16 = [(MTAlarm *)self bedtimeSnoozeFireDate];
  [v28 encodeObject:v16 forKey:@"MTAlarmBedtimeSnoozeFireDate"];

  v17 = [(MTAlarm *)self firedDate];
  [v28 encodeObject:v17 forKey:@"MTAlarmFireDate"];

  int v18 = [(MTAlarm *)self dismissedDate];
  [v28 encodeObject:v18 forKey:@"MTAlarmDismissDate"];

  objc_msgSend(v28, "encodeInteger:forKey:", -[MTAlarm dismissedAction](self, "dismissedAction"), @"MTAlarmDismissAction");
  int v19 = [(MTAlarm *)self lastModifiedDate];
  [v28 encodeObject:v19 forKey:@"MTAlarmLastModifiedDate"];

  char v20 = [(MTAlarm *)self bedtimeFiredDate];
  [v28 encodeObject:v20 forKey:@"MTAlarmBedtimeFireDate"];

  int v21 = [(MTAlarm *)self bedtimeDismissedDate];
  [v28 encodeObject:v21 forKey:@"MTAlarmBedtimeDismissDate"];

  objc_msgSend(v28, "encodeInteger:forKey:", -[MTAlarm bedtimeDismissedAction](self, "bedtimeDismissedAction"), @"MTAlarmBedtimeDismissAction");
  v22 = [(MTAlarm *)self keepOffUntilDate];
  [v28 encodeObject:v22 forKey:@"MTAlarmKeepOffUntilDate"];

  v23 = [(MTAlarm *)self title];
  [v28 encodeObject:v23 forKey:@"MTAlarmTitle"];

  v24 = [(MTAlarm *)self sound];
  [v28 encodeObject:v24 forKey:@"MTAlarmSound"];

  objc_msgSend(v28, "encodeInteger:forKey:", -[MTAlarm onboardingVersion](self, "onboardingVersion"), @"MTAlarmOnboardingVersion");
  if ([v28 mtType] != 2)
  {
    v25 = [(MTAlarm *)self overriddenForDate];
    [v28 encodeObject:v25 forKey:@"MTAlarmOverriddenForDate"];
  }
  v26 = [(MTAlarm *)self siriContext];
  [v28 encodeObject:v26 forKey:@"MTAlarmSiriContext"];

  if ([v28 mtType] != 2)
  {
    v27 = [(MTAlarm *)self bypassReloadDate];
    [v28 encodeObject:v27 forKey:@"MTAlarmBypassReloadDate"];
  }
}

- (BOOL)isValidDateComponent:(int64_t)a3
{
  return (unint64_t)(a3 - 1) < 0x7FFFFFFFFFFFFFFELL;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  double v4 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  float v5 = [(MTAlarm *)self alarmID];
  id v6 = (id)[v4 appendObject:v5 withName:@"id"];

  id v7 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", -[MTAlarm isSleepAlarm](self, "isSleepAlarm"), @"sleep", 1);
  id v8 = (id)objc_msgSend(v4, "appendBool:withName:", -[MTAlarm isEnabled](self, "isEnabled"), @"enabled");
  id v9 = (id)objc_msgSend(v4, "appendInteger:withName:", -[MTAlarm hour](self, "hour"), @"hour");
  id v10 = (id)objc_msgSend(v4, "appendInteger:withName:", -[MTAlarm minute](self, "minute"), @"minute");
  if ([(MTAlarm *)self day] != 0x7FFFFFFFFFFFFFFFLL) {
    id v11 = (id)objc_msgSend(v4, "appendInteger:withName:", -[MTAlarm day](self, "day"), @"day");
  }
  if ([(MTAlarm *)self month] != 0x7FFFFFFFFFFFFFFFLL) {
    id v12 = (id)objc_msgSend(v4, "appendInteger:withName:", -[MTAlarm month](self, "month"), @"month");
  }
  if ([(MTAlarm *)self year] != 0x7FFFFFFFFFFFFFFFLL) {
    id v13 = (id)objc_msgSend(v4, "appendInteger:withName:", -[MTAlarm year](self, "year"), @"year");
  }
  char v14 = MTAlarmRepeatString([(MTAlarm *)self repeatSchedule]);
  [v4 appendString:v14 withName:@"schedule" skipIfEmpty:1];

  id v15 = (id)objc_msgSend(v4, "appendBool:withName:", -[MTAlarm allowsSnooze](self, "allowsSnooze"), @"allowsSnooze");
  id v16 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", -[MTAlarm isSnoozed](self, "isSnoozed"), @"isSnoozed", 1);
  id v17 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", -[MTAlarm isFiring](self, "isFiring"), @"isFiring", 1);
  int v18 = [(MTAlarm *)self title];
  [v4 appendString:v18 withName:@"title" skipIfEmpty:1];

  int v19 = [(MTAlarm *)self siriContext];
  id v20 = (id)[v4 appendObject:v19 withName:@"siriContext" skipIfNil:1];

  int v21 = [(MTAlarm *)self bypassReloadDate];
  id v22 = (id)[v4 appendBool:v21 != 0 withName:@"bypassReloadDate" ifEqualTo:1];

  return v4;
}

- (BOOL)isSleepAlarm
{
  return self->_sleepAlarm;
}

- (NSString)title
{
  return self->_title;
}

- (NSUUID)alarmID
{
  return self->_alarmID;
}

- (unint64_t)repeatSchedule
{
  return self->_repeatSchedule;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(MTAlarm *)self hour];
  if (v5 < [v4 hour]) {
    goto LABEL_2;
  }
  unint64_t v7 = [(MTAlarm *)self hour];
  if (v7 > [v4 hour]) {
    goto LABEL_4;
  }
  unint64_t v9 = [(MTAlarm *)self minute];
  if (v9 < [v4 minute])
  {
LABEL_2:
    int64_t v6 = -1;
    goto LABEL_5;
  }
  unint64_t v10 = [(MTAlarm *)self minute];
  if (v10 > [v4 minute])
  {
LABEL_4:
    int64_t v6 = 1;
    goto LABEL_5;
  }
  id v11 = [(MTAlarm *)self displayTitle];
  id v12 = [v4 displayTitle];
  int64_t v6 = [v11 compare:v12];

  if (!v6)
  {
    id v13 = [(MTAlarm *)self alarmID];
    char v14 = [v13 UUIDString];
    id v15 = [v4 alarmID];
    id v16 = [v15 UUIDString];
    int64_t v6 = [v14 compare:v16];
  }
LABEL_5:

  return v6;
}

- (unint64_t)hour
{
  return self->_hour;
}

- (unint64_t)minute
{
  return self->_minute;
}

- (unint64_t)year
{
  return self->_year;
}

- (NSDictionary)siriContext
{
  return self->_siriContext;
}

- (unint64_t)month
{
  return self->_month;
}

- (unint64_t)day
{
  return self->_day;
}

- (NSDate)bypassReloadDate
{
  return self->_bypassReloadDate;
}

- (BOOL)allowsSnooze
{
  return self->_allowsSnooze;
}

- (BOOL)isSnoozed
{
  v2 = [(MTAlarm *)self snoozeFireDate];
  BOOL v3 = v2 != 0;

  return v3;
}

- (NSDate)snoozeFireDate
{
  return self->_snoozeFireDate;
}

- (BOOL)isFiring
{
  if ([(MTAlarm *)self isSleepAlarm] && ![(MTAlarm *)self isEnabled])
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    BOOL v3 = [(MTAlarm *)self firedDate];
    if (v3)
    {
      id v4 = [(MTAlarm *)self dismissedDate];
      if (v4)
      {
        unint64_t v5 = [(MTAlarm *)self firedDate];
        int64_t v6 = [(MTAlarm *)self dismissedDate];
        if ([v5 mtIsAfterDate:v6]) {
          BOOL v7 = ![(MTAlarm *)self isSnoozed];
        }
        else {
          LOBYTE(v7) = 0;
        }
      }
      else
      {
        BOOL v7 = ![(MTAlarm *)self isSnoozed];
      }
    }
    else
    {
      LOBYTE(v7) = 0;
    }
  }
  return v7;
}

- (NSDate)firedDate
{
  return self->_firedDate;
}

- (BOOL)timeInBedTracking
{
  return self->_timeInBedTracking;
}

- (MTSound)sound
{
  return self->_sound;
}

- (BOOL)sleepTracking
{
  return self->_sleepTracking;
}

- (BOOL)sleepSchedule
{
  return self->_sleepSchedule;
}

- (BOOL)sleepMode
{
  return self->_sleepMode;
}

- (unint64_t)sleepModeOptions
{
  return self->_sleepModeOptions;
}

- (NSDate)overriddenForDate
{
  return self->_overriddenForDate;
}

- (unint64_t)onboardingVersion
{
  return self->_onboardingVersion;
}

- (NSDate)lastModifiedDate
{
  return self->_lastModifiedDate;
}

- (NSDate)keepOffUntilDate
{
  return self->_keepOffUntilDate;
}

- (NSDate)dismissedDate
{
  return self->_dismissedDate;
}

- (unint64_t)dismissedAction
{
  return self->_dismissedAction;
}

- (NSDate)bedtimeSnoozeFireDate
{
  return self->_bedtimeSnoozeFireDate;
}

- (NSNumber)bedtimeReminder
{
  return self->_bedtimeReminder;
}

- (unint64_t)bedtimeMinute
{
  return self->_bedtimeMinute;
}

- (unint64_t)bedtimeHour
{
  return self->_bedtimeHour;
}

- (NSDate)bedtimeFiredDate
{
  return self->_bedtimeFiredDate;
}

- (NSDate)bedtimeDismissedDate
{
  return self->_bedtimeDismissedDate;
}

- (unint64_t)bedtimeDismissedAction
{
  return self->_bedtimeDismissedAction;
}

- (id)alarmIDString
{
  v2 = [(MTAlarm *)self alarmID];
  BOOL v3 = [v2 UUIDString];

  return v3;
}

- (NSString)displayTitle
{
  v2 = [(MTAlarm *)self title];
  BOOL v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    unint64_t v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v4 = [v5 localizedStringForKey:@"ALARM_DEFAULT_TITLE" value:&stru_1EEDE16C8 table:@"Localizable"];
  }
  return (NSString *)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)shouldBeScheduled
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if ([(MTAlarm *)self isSleepAlarm])
  {
    if ([(MTAlarm *)self sleepSchedule])
    {
      return 1;
    }
    else
    {
      id v4 = MTLogForCategory(3);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v5 = [(MTAlarm *)self alarmID];
        int v6 = 138543362;
        BOOL v7 = v5;
        _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_DEFAULT, "Not scheduling %{public}@ because sleep schedule is disabled", (uint8_t *)&v6, 0xCu);
      }
      return 0;
    }
  }
  else
  {
    return [(MTAlarm *)self isEnabled];
  }
}

- (id)upcomingTriggersAfterDate:(id)a3
{
  id v4 = [(MTAlarm *)self nextTriggersAfterDate:a3 includeBedtime:1];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__MTAlarm_MTScheduling__upcomingTriggersAfterDate___block_invoke;
  v7[3] = &unk_1E59163F0;
  v7[4] = self;
  unint64_t v5 = objc_msgSend(v4, "na_filter:", v7);

  return v5;
}

uint64_t __51__MTAlarm_MTScheduling__upcomingTriggersAfterDate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([*(id *)(a1 + 32) isSleepAlarm]
    && [v3 isForAlert]
    && ([*(id *)(a1 + 32) isSingleTimeAlarm] & 1) == 0
    && ([*(id *)(a1 + 32) isEnabled] & 1) == 0)
  {
    unint64_t v5 = MTLogForCategory(3);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = [*(id *)(a1 + 32) alarmID];
      int v8 = 138543362;
      unint64_t v9 = v6;
      _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_DEFAULT, "Not scheduling alarm %{public}@ because it's disabled", (uint8_t *)&v8, 0xCu);
    }
    goto LABEL_12;
  }
  if ([v3 isBedtimeRelated] && (MTShouldHandleForBedtime() & 1) == 0)
  {
    unint64_t v5 = MTLogForCategory(3);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_DEFAULT, "Not scheduling bedtime triggers", (uint8_t *)&v8, 2u);
    }
LABEL_12:

    uint64_t v4 = 0;
    goto LABEL_13;
  }
  uint64_t v4 = 1;
LABEL_13:

  return v4;
}

- (BOOL)overridesScheduledObject:(id)a3 calendar:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int v8 = [v7 scheduleable];
  unint64_t v9 = [v7 trigger];

  LOBYTE(v7) = [(MTAlarm *)self overridesAlarm:v8 trigger:v9 calendar:v6];
  return (char)v7;
}

- (id)alarmIntentDisplayString
{
  id v3 = [(MTAlarm *)self title];
  if (!v3)
  {
    if (![(MTAlarm *)self isSleepAlarm]
      || (uint64_t v4 = NSString,
          [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()],
          unint64_t v5 = objc_claimAutoreleasedReturnValue(),
          [v4 deferredLocalizedIntentsStringWithFormat:@"BED_TIME" fromTable:0 bundle:v5],
          id v3 = objc_claimAutoreleasedReturnValue(),
          v5,
          !v3))
    {
      id v6 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
      unint64_t v7 = [(MTAlarm *)self hour];
      unint64_t v8 = [(MTAlarm *)self minute];
      unint64_t v9 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:0.0];
      uint64_t v10 = [v6 dateBySettingHour:v7 minute:v8 second:0 ofDate:v9 options:0];

      id v3 = [MEMORY[0x1E4F28C10] localizedStringFromDate:v10 dateStyle:0 timeStyle:1];

      if (!v3)
      {
        id v3 = [(MTAlarm *)self displayTitle];
      }
    }
  }
  return v3;
}

- (id)alarmIDIntentObject
{
  id v3 = [(MTAlarm *)self alarmIDString];

  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F30568]);
    unint64_t v5 = [(MTAlarm *)self alarmIDString];
    id v6 = [(MTAlarm *)self alarmIntentDisplayString];
    unint64_t v7 = (void *)[v4 initWithIdentifier:v5 displayString:v6];
  }
  else
  {
    unint64_t v7 = 0;
  }
  return v7;
}

- (id)intentLabel
{
  id v3 = [(MTAlarm *)self title];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    unint64_t v5 = [(MTAlarm *)self title];
  }
  else
  {
    unint64_t v5 = 0;
  }
  return v5;
}

- (id)timeObject
{
  id v3 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
  unint64_t v4 = [(MTAlarm *)self hour];
  unint64_t v5 = [(MTAlarm *)self minute];
  id v6 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:0.0];
  unint64_t v7 = [v3 dateBySettingHour:v4 minute:v5 second:0 ofDate:v6 options:0];

  unint64_t v8 = [MEMORY[0x1E4F28C10] localizedStringFromDate:v7 dateStyle:0 timeStyle:1];
  id v9 = objc_alloc(MEMORY[0x1E4F30568]);
  uint64_t v10 = NSString;
  [v7 timeIntervalSinceReferenceDate];
  id v12 = objc_msgSend(v10, "stringWithFormat:", @"%f", v11);
  id v13 = (void *)[v9 initWithIdentifier:v12 displayString:v8];

  return v13;
}

- (MTIntentAlarm)intentAlarm
{
  id v3 = [(MTAlarm *)self alarmIDString];

  if (v3)
  {
    unint64_t v4 = [MTIntentAlarm alloc];
    unint64_t v5 = [(MTAlarm *)self alarmIDString];
    id v6 = [(MTAlarm *)self alarmIntentDisplayString];
    id v3 = [(MTIntentAlarm *)v4 initWithIdentifier:v5 displayString:v6];

    unint64_t v7 = [(MTAlarm *)self dateComponents];
    [(MTIntentAlarm *)v3 setDateComponents:v7];

    unint64_t v8 = [(MTAlarm *)self displayTitle];
    [(MTIntentAlarm *)v3 setLabel:v8];

    id v9 = MTRepeatDaysForAlarmRepeatSchedule([(MTAlarm *)self repeatSchedule]);
    [(MTIntentAlarm *)v3 setRepeatSchedule:v9];
  }
  return v3;
}

- (id)nextExpectedWakeUpDateAfterDate:(id)a3
{
  return 0;
}

- (id)nextExpectedBedtimeDateAfterDate:(id)a3
{
  return 0;
}

- (BOOL)confirmedLastBedtimeReminder
{
  id v3 = [(MTAlarm *)self bedtimeDismissedDate];
  if (v3 && [(MTAlarm *)self bedtimeDismissedAction] == 2)
  {
    unint64_t v4 = [(MTAlarm *)self firedDate];
    if (v4)
    {
      unint64_t v5 = [(MTAlarm *)self bedtimeDismissedDate];
      id v6 = [(MTAlarm *)self firedDate];
      char v7 = [v5 mtIsAfterOrSameAsDate:v6];
    }
    else
    {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

+ (id)alarm
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

+ (MTAlarm)alarmWithHour:(unint64_t)a3 minute:(unint64_t)a4
{
  unint64_t v4 = (void *)[objc_alloc((Class)a1) initWithHour:a3 minute:a4];
  return (MTAlarm *)v4;
}

+ (id)sleepAlarm
{
  return (id)[a1 sleepAlarmWithSchedule:127];
}

+ (id)sleepAlarmWithSchedule:(unint64_t)a3
{
  unint64_t v5 = +[MTAlarm sleepScheduleString:](MTAlarm, "sleepScheduleString:");
  id v6 = [a1 sleepAlarmWithId:v5];
  [v6 setRepeatSchedule:a3];

  return v6;
}

+ (id)sleepAlarmWithId:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [a1 alarm];
  if (v4)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v4];
    char v7 = (void *)v5[2];
    v5[2] = v6;
  }
  [v5 setSleepAlarm:1];
  unint64_t v8 = +[MTSound defaultSoundForCategory:3];
  [v5 setSound:v8];

  [v5 setRepeatSchedule:127];
  [v5 setBedtimeReminderMinutes:15];
  [v5 setSleepSchedule:1];
  objc_msgSend(v5, "setSleepModeOptions:", objc_msgSend((id)objc_opt_class(), "defaultSleepModeOptions"));

  return v5;
}

+ (id)sleepAlarmWithHour:(int64_t)a3 minute:(int64_t)a4
{
  uint64_t v6 = [a1 sleepAlarm];
  [v6 setHour:a3];
  [v6 setMinute:a4];
  return v6;
}

+ (id)sleepAlarmWithHour:(int64_t)a3 minute:(int64_t)a4 bedtimeHour:(int64_t)a5 bedtimeMinute:(int64_t)a6
{
  unint64_t v8 = [a1 sleepAlarmWithHour:a3 minute:a4];
  [v8 setBedtimeHour:a5];
  [v8 setBedtimeMinute:a6];
  return v8;
}

+ (id)sleepAlarmWithHour:(int64_t)a3 minute:(int64_t)a4 year:(int64_t)a5 month:(int64_t)a6 day:(int64_t)a7 bedtimeHour:(int64_t)a8 bedtimeMinute:(int64_t)a9
{
  if (a5 == 0x7FFFFFFFFFFFFFFFLL || a6 == 0x7FFFFFFFFFFFFFFFLL || a7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v17 = objc_msgSend(a1, "sleepAlarmWithHour:minute:bedtimeHour:bedtimeMinute:", a3, a4, a8, a9, a7);
  }
  else
  {
    id v17 = [a1 sleepAlarmWithSchedule:0];
    [v17 setHour:a3];
    [v17 setMinute:a4];
    [v17 setYear:a5];
    [v17 setMonth:a6];
    [v17 setDay:a7];
    [v17 setBedtimeHour:a8];
    [v17 setBedtimeMinute:a9];
  }
  return v17;
}

- (MTAlarm)initWithIdentifier:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(MTAlarm *)self _initCommon];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    alarmID = v5->_alarmID;
    v5->_alarmID = (NSUUID *)v6;
  }
  return v5;
}

- (MTAlarm)init
{
  id v3 = MTCurrentDateProvider();
  id v4 = [(MTAlarm *)self initWithCurrentTimeFromCurrentDateProvider:v3];

  return v4;
}

- (MTAlarm)initWithCurrentTimeFromCurrentDateProvider:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1C9A8];
  unint64_t v5 = (void (**)(void))a3;
  uint64_t v6 = [v4 currentCalendar];
  char v7 = v5[2](v5);
  unint64_t v8 = [v6 components:96 fromDate:v7];

  id v9 = -[MTAlarm initWithHour:minute:currentDateProvider:](self, "initWithHour:minute:currentDateProvider:", [v8 hour], objc_msgSend(v8, "minute"), v5);
  return v9;
}

- (MTAlarm)initWithHour:(unint64_t)a3 minute:(unint64_t)a4
{
  char v7 = MTCurrentDateProvider();
  unint64_t v8 = [(MTAlarm *)self initWithHour:a3 minute:a4 currentDateProvider:v7];

  return v8;
}

- (MTAlarm)initWithHour:(unint64_t)a3 minute:(unint64_t)a4 currentDateProvider:(id)a5
{
  id v8 = a5;
  v17.receiver = self;
  v17.super_class = (Class)MTAlarm;
  id v9 = [(MTAlarm *)&v17 init];
  if (v9)
  {
    uint64_t v10 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v11 = (void *)*((void *)v9 + 2);
    *((void *)v9 + 2) = v10;

    *((void *)v9 + 3) = a3;
    *((void *)v9 + 4) = a4;
    *(int64x2_t *)(v9 + 40) = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    *((void *)v9 + 7) = 0x7FFFFFFFFFFFFFFFLL;
    v9[12] = 1;
    v9[14] = 1;
    uint64_t v12 = +[MTSound defaultSoundForCategory:0];
    id v13 = (void *)*((void *)v9 + 15);
    *((void *)v9 + 15) = v12;

    uint64_t v14 = [v8 copy];
    id v15 = (void *)*((void *)v9 + 27);
    *((void *)v9 + 27) = v14;
  }
  return (MTAlarm *)v9;
}

+ (unint64_t)defaultSleepModeOptions
{
  return 49;
}

- (unint64_t)bedtimeReminderMinutes
{
  return [(NSNumber *)self->_bedtimeReminder unsignedIntegerValue];
}

- (void)setBedtimeReminderMinutes:(unint64_t)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a3];
  bedtimeReminder = self->_bedtimeReminder;
  self->_bedtimeReminder = v4;
  MEMORY[0x1F41817F8](v4, bedtimeReminder);
}

+ (BOOL)_isInternalBuild
{
  if (_isInternalBuild_onceToken != -1) {
    dispatch_once(&_isInternalBuild_onceToken, &__block_literal_global_48);
  }
  return _isInternalBuild_isInternal;
}

uint64_t __27__MTAlarm__isInternalBuild__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  _isInternalBuild_isInternal = result;
  return result;
}

+ (id)sleepScheduleString:(unint64_t)byte7
{
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFUUIDRef v4 = CFUUIDCreateWithBytes((CFAllocatorRef)*MEMORY[0x1E4F1CF80], byte7, byte7, byte7, byte7, byte7, byte7, byte7, byte7, byte7, byte7, byte7, byte7, byte7, byte7, byte7, byte7);
  unint64_t v5 = (__CFString *)CFUUIDCreateString(v3, v4);
  return v5;
}

- (id)dateComponents
{
  CFAllocatorRef v3 = objc_opt_new();
  objc_msgSend(v3, "setHour:", -[MTAlarm hour](self, "hour"));
  objc_msgSend(v3, "setMinute:", -[MTAlarm minute](self, "minute"));
  objc_msgSend(v3, "setDay:", -[MTAlarm day](self, "day"));
  objc_msgSend(v3, "setMonth:", -[MTAlarm month](self, "month"));
  objc_msgSend(v3, "setYear:", -[MTAlarm year](self, "year"));
  [v3 setSecond:0];
  return v3;
}

- (id)bedtimeComponents
{
  CFAllocatorRef v3 = objc_opt_new();
  objc_msgSend(v3, "setHour:", -[MTAlarm bedtimeHour](self, "bedtimeHour"));
  objc_msgSend(v3, "setMinute:", -[MTAlarm bedtimeMinute](self, "bedtimeMinute"));
  [v3 setSecond:0];
  return v3;
}

- (NSURL)alarmURL
{
  id v2 = [(MTAlarm *)self alarmID];
  CFAllocatorRef v3 = [v2 UUIDString];
  CFUUIDRef v4 = [@"x-apple-clock:alarm?id=" stringByAppendingString:v3];

  unint64_t v5 = [MEMORY[0x1E4F1CB10] URLWithString:v4];

  return (NSURL *)v5;
}

- (BOOL)repeats
{
  return [(MTAlarm *)self repeatSchedule] != 0;
}

- (BOOL)isBedtimeSnoozed
{
  id v2 = [(MTAlarm *)self bedtimeSnoozeFireDate];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)resetSnoozeFireDate
{
  [(MTAlarm *)self setSnoozeFireDate:0];
  BOOL v3 = [(MTAlarm *)self lastModifiedDate];
  [(MTAlarm *)self setDismissedDate:v3];

  [(MTAlarm *)self setDismissedAction:6];
}

- (void)setTitle:(id)a3
{
  id v7 = a3;
  if ([v7 length])
  {
    CFUUIDRef v4 = v7;
  }
  else
  {

    CFUUIDRef v4 = 0;
  }
  id v8 = v4;
  unint64_t v5 = (NSString *)[v4 copy];
  title = self->_title;
  self->_title = v5;
}

- (unint64_t)sleepDuration
{
  [(MTAlarm *)self sleepDurationSeconds];
  return (unint64_t)(v2 / 60.0);
}

- (double)sleepDurationSeconds
{
  if (![(MTAlarm *)self isSleepAlarm]) {
    return 0.0;
  }
  BOOL v3 = objc_opt_new();
  objc_msgSend(v3, "setHour:", -[MTAlarm bedtimeHour](self, "bedtimeHour"));
  objc_msgSend(v3, "setMinute:", -[MTAlarm bedtimeMinute](self, "bedtimeMinute"));
  CFUUIDRef v4 = objc_opt_new();
  objc_msgSend(v4, "setHour:", -[MTAlarm hour](self, "hour"));
  objc_msgSend(v4, "setMinute:", -[MTAlarm minute](self, "minute"));
  unint64_t v5 = (*((void (**)(void))self->_currentDateProvider + 2))();
  [v4 mtTimeIntervalSinceComponents:v3 now:v5];
  double v7 = v6;

  return v7;
}

- (NSDate)nextFireDate
{
  double v2 = [(MTAlarm *)self nextTrigger];
  BOOL v3 = [v2 triggerDate];

  return (NSDate *)v3;
}

- (id)nextFireDateAfterDate:(id)a3
{
  return [(MTAlarm *)self nextFireDateAfterDate:a3 includeBedtimeNotification:0];
}

- (id)nextFireDateAfterDate:(id)a3 includeBedtimeNotification:(BOOL)a4
{
  CFUUIDRef v4 = [(MTAlarm *)self nextTriggerAfterDate:a3 includeBedtimeNotification:a4];
  unint64_t v5 = [v4 triggerDate];

  return v5;
}

- (id)nextTrigger
{
  BOOL v3 = (*((void (**)(void))self->_currentDateProvider + 2))();
  CFUUIDRef v4 = [(MTAlarm *)self nextTriggerAfterDate:v3];

  return v4;
}

- (id)nextTriggerAfterDate:(id)a3
{
  return [(MTAlarm *)self nextTriggerAfterDate:a3 includeBedtimeNotification:0];
}

- (id)nextTriggerAfterDate:(id)a3 includeBedtimeNotification:(BOOL)a4
{
  return [(MTAlarm *)self nextTriggerAfterDate:a3 includeSnooze:1 includeBedtimeNotification:a4];
}

- (id)nextTriggerAfterDate:(id)a3 includeSnooze:(BOOL)a4 includeBedtimeNotification:(BOOL)a5
{
  unint64_t v5 = [(MTAlarm *)self nextTriggersAfterDate:a3 includeSnooze:a4 includeBedtimeNotification:a5];
  double v6 = [v5 firstObject];

  return v6;
}

- (id)nextTriggerAfterDate:(id)a3 ofType:(unint64_t)a4
{
  unint64_t v5 = [(MTAlarm *)self nextTriggersAfterDate:a3 inclusionOptions:1];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __39__MTAlarm_nextTriggerAfterDate_ofType___block_invoke;
  v8[3] = &__block_descriptor_40_e19_B16__0__MTTrigger_8l;
  v8[4] = a4;
  double v6 = objc_msgSend(v5, "na_firstObjectPassingTest:", v8);

  return v6;
}

BOOL __39__MTAlarm_nextTriggerAfterDate_ofType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 triggerType] == *(void *)(a1 + 32);
}

- (id)nextTriggersAfterDate:(id)a3
{
  return [(MTAlarm *)self nextTriggersAfterDate:a3 includeBedtime:0];
}

- (id)nextTriggersAfterDate:(id)a3 includeBedtime:(BOOL)a4
{
  return [(MTAlarm *)self nextTriggersAfterDate:a3 inclusionOptions:1];
}

- (id)nextTriggersAfterDate:(id)a3 includeSnooze:(BOOL)a4 includeBedtimeNotification:(BOOL)a5
{
  return -[MTAlarm nextTriggersAfterDate:inclusionOptions:](self, "nextTriggersAfterDate:inclusionOptions:", a3, a4, a5);
}

- (id)nextTriggersAfterDate:(id)a3 inclusionOptions:(unint64_t)a4
{
  char v4 = a4;
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = MTLogForCategory(3);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [(MTAlarm *)self alarmID];
    int v48 = 138543618;
    char v49 = v8;
    __int16 v50 = 2114;
    *(void *)v51 = v6;
    _os_log_impl(&dword_19CC95000, v7, OS_LOG_TYPE_DEFAULT, "Date before computing earlierst trigger date for %{public}@: %{public}@", (uint8_t *)&v48, 0x16u);
  }
  id v9 = [(MTAlarm *)self _earliestTriggerDateForDate:v6];

  uint64_t v10 = MTLogForCategory(3);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [(MTAlarm *)self alarmID];
    int v48 = 138543618;
    char v49 = v11;
    __int16 v50 = 2114;
    *(void *)v51 = v9;
    _os_log_impl(&dword_19CC95000, v10, OS_LOG_TYPE_DEFAULT, "Computing next fire date for %{public}@ after %{public}@", (uint8_t *)&v48, 0x16u);
  }
  uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
  id v13 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
  uint64_t v14 = MTLogForCategory(3);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = [(MTAlarm *)self alarmID];
    BOOL v16 = [(MTAlarm *)self isSnoozed];
    BOOL v17 = [(MTAlarm *)self repeats];
    int v48 = 138543874;
    char v49 = v15;
    __int16 v50 = 1024;
    *(_DWORD *)v51 = v16;
    *(_WORD *)&v51[4] = 1024;
    *(_DWORD *)&v51[6] = v17;
    _os_log_impl(&dword_19CC95000, v14, OS_LOG_TYPE_DEFAULT, "Alarm %{public}@ is snoozed:%d, repeats: %d", (uint8_t *)&v48, 0x18u);
  }
  if ([(MTAlarm *)self isSnoozed] && ![(MTAlarm *)self repeats])
  {
    int v18 = 0;
  }
  else
  {
    if ([(MTAlarm *)self isSingleTimeAlarm])
    {
      int v18 = [(MTAlarm *)self singleTimeOverrideDateInCalendar:v13];
      int v19 = MTLogForCategory(3);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        id v20 = [(MTAlarm *)self alarmID];
        int v48 = 138543618;
        char v49 = v20;
        __int16 v50 = 2114;
        *(void *)v51 = v18;
        _os_log_impl(&dword_19CC95000, v19, OS_LOG_TYPE_DEFAULT, "Alarm %{public}@ override alarm date: %{public}@", (uint8_t *)&v48, 0x16u);
      }
      uint64_t v21 = +[MTTrigger triggerWithDate:triggerType:isPastOverrideEvent:](MTTrigger, "triggerWithDate:triggerType:isPastOverrideEvent:", v18, 4, [v9 mtIsAfterOrSameAsDate:v18]);
    }
    else
    {
      int v18 = [(MTAlarm *)self _nextDateHelperWithDate:v9 calendar:v13];
      id v22 = MTLogForCategory(3);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = [(MTAlarm *)self alarmID];
        int v48 = 138543618;
        char v49 = v23;
        __int16 v50 = 2114;
        *(void *)v51 = v18;
        _os_log_impl(&dword_19CC95000, v22, OS_LOG_TYPE_DEFAULT, "Alarm %{public}@ next alarm date: %{public}@", (uint8_t *)&v48, 0x16u);
      }
      if ([(MTAlarm *)self isSleepAlarm]) {
        uint64_t v24 = 4;
      }
      else {
        uint64_t v24 = 0;
      }
      uint64_t v21 = +[MTTrigger triggerWithDate:v18 triggerType:v24];
    }
    v25 = (void *)v21;
    v26 = MTLogForCategory(3);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = [(MTAlarm *)self alarmID];
      int v48 = 138543618;
      char v49 = v27;
      __int16 v50 = 2114;
      *(void *)v51 = v25;
      _os_log_impl(&dword_19CC95000, v26, OS_LOG_TYPE_DEFAULT, "Alarm %{public}@ alarm trigger: %{public}@", (uint8_t *)&v48, 0x16u);
    }
    [v12 addObject:v25];
    id v28 = MTLogForCategory(3);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v29 = [(MTAlarm *)self alarmID];
      int v48 = 138543874;
      char v49 = v29;
      __int16 v50 = 2114;
      *(void *)v51 = v18;
      *(_WORD *)&v51[8] = 2114;
      v52 = v9;
      _os_log_impl(&dword_19CC95000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@ has next fire date %{public}@ after %{public}@", (uint8_t *)&v48, 0x20u);
    }
  }
  uint64_t v30 = v4 & 1;
  uint64_t v31 = MTLogForCategory(3);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    v32 = [(MTAlarm *)self alarmID];
    int v48 = 138543618;
    char v49 = v32;
    __int16 v50 = 1024;
    *(_DWORD *)v51 = v30;
    _os_log_impl(&dword_19CC95000, v31, OS_LOG_TYPE_DEFAULT, "Alarm %{public}@ include snooze: %d", (uint8_t *)&v48, 0x12u);
  }
  if (v30 && [(MTAlarm *)self isSnoozed])
  {
    v33 = [(MTAlarm *)self snoozeFireDate];
    char v34 = [v33 mtIsBeforeOrSameAsDate:v9];

    char v35 = MTLogForCategory(3);
    BOOL v36 = os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT);
    if (v34)
    {
      if (!v36)
      {
LABEL_39:

        goto LABEL_40;
      }
      char v37 = [(MTAlarm *)self snoozeFireDate];
      char v38 = [(MTAlarm *)self alarmID];
      int v48 = 138543618;
      char v49 = v37;
      __int16 v50 = 2114;
      *(void *)v51 = v38;
      _os_log_impl(&dword_19CC95000, v35, OS_LOG_TYPE_DEFAULT, "Snooze has already fired (%{public}@) for alert %{public}@", (uint8_t *)&v48, 0x16u);
    }
    else
    {
      if (v36)
      {
        BOOL v39 = [(MTAlarm *)self snoozeFireDate];
        int v40 = [(MTAlarm *)self alarmID];
        int v48 = 138543618;
        char v49 = v39;
        __int16 v50 = 2114;
        *(void *)v51 = v40;
        _os_log_impl(&dword_19CC95000, v35, OS_LOG_TYPE_DEFAULT, "Snooze hasn't fired yet (%{public}@) for alert %{public}@", (uint8_t *)&v48, 0x16u);
      }
      char v35 = [(MTAlarm *)self snoozeFireDate];
      if ([(MTAlarm *)self isSleepAlarm]) {
        uint64_t v41 = 5;
      }
      else {
        uint64_t v41 = 1;
      }
      char v37 = +[MTTrigger triggerWithDate:v35 triggerType:v41];
      [v12 addObject:v37];
    }

    goto LABEL_39;
  }
LABEL_40:
  [v12 sortUsingComparator:&__block_literal_global_72];
  v42 = MTLogForCategory(3);
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    v43 = [(MTAlarm *)self alarmID];
    int v48 = 138543618;
    char v49 = v43;
    __int16 v50 = 2114;
    *(void *)v51 = v12;
    _os_log_impl(&dword_19CC95000, v42, OS_LOG_TYPE_DEFAULT, "Alarm %{public}@ candidate triggers after sorting: %{public}@", (uint8_t *)&v48, 0x16u);
  }
  v44 = [v12 firstObject];
  v45 = MTLogForCategory(3);
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    v46 = [(MTAlarm *)self alarmID];
    int v48 = 138543618;
    char v49 = v46;
    __int16 v50 = 2114;
    *(void *)v51 = v44;
    _os_log_impl(&dword_19CC95000, v45, OS_LOG_TYPE_DEFAULT, "%{public}@ has next trigger %{public}@", (uint8_t *)&v48, 0x16u);
  }
  return v12;
}

uint64_t __50__MTAlarm_nextTriggersAfterDate_inclusionOptions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  unint64_t v5 = [a2 triggerDate];
  id v6 = [v4 triggerDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (id)_earliestTriggerDateForDate:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = objc_opt_new();
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __39__MTAlarm__earliestTriggerDateForDate___block_invoke;
  v23[3] = &unk_1E5916A60;
  id v6 = v4;
  id v24 = v6;
  v25 = self;
  id v7 = v5;
  id v26 = v7;
  id v8 = (void (**)(void, void, void))MEMORY[0x19F3A0FB0](v23);
  id v9 = [(MTAlarm *)self dismissedDate];
  ((void (**)(void, __CFString *, void *))v8)[2](v8, @"dismissed", v9);

  uint64_t v10 = [(MTAlarm *)self bedtimeDismissedDate];
  ((void (**)(void, __CFString *, void *))v8)[2](v8, @"bedtime dismissed", v10);

  uint64_t v11 = [(MTAlarm *)self firedDate];
  ((void (**)(void, __CFString *, void *))v8)[2](v8, @"fired", v11);

  uint64_t v12 = [(MTAlarm *)self bedtimeFiredDate];
  ((void (**)(void, __CFString *, void *))v8)[2](v8, @"bedtime fired", v12);

  id v13 = [(MTAlarm *)self keepOffUntilDate];
  ((void (**)(void, __CFString *, void *))v8)[2](v8, @"keep off until", v13);

  uint64_t v14 = [(MTAlarm *)self lastModifiedDate];
  ((void (**)(void, __CFString *, void *))v8)[2](v8, @"modified", v14);

  id v15 = [(MTAlarm *)self overriddenForDate];
  ((void (**)(void, __CFString *, void *))v8)[2](v8, @"overriden for date", v15);

  uint64_t v16 = [MEMORY[0x1E4F1C9C8] mtLatest:v7];
  BOOL v17 = (void *)v16;
  if (v16) {
    int v18 = (void *)v16;
  }
  else {
    int v18 = v6;
  }
  id v19 = v18;

  id v20 = MTLogForCategory(3);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v21 = [(MTAlarm *)self alarmID];
    *(_DWORD *)buf = 138543618;
    id v28 = v21;
    __int16 v29 = 2114;
    id v30 = v19;
    _os_log_impl(&dword_19CC95000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ earliest trigger date: %{public}@", buf, 0x16u);
  }
  return v19;
}

void __39__MTAlarm__earliestTriggerDateForDate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v6)
  {
    id v9 = MTLogForCategory(3);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [*(id *)(a1 + 40) alarmID];
      int v15 = 138543874;
      uint64_t v16 = v13;
      __int16 v17 = 2114;
      id v18 = v5;
      __int16 v19 = 2114;
      id v20 = 0;
      uint64_t v14 = "%{public}@ %{public}@ %{public}@ is nil";
LABEL_10:
      _os_log_impl(&dword_19CC95000, v9, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v15, 0x20u);
    }
LABEL_11:

    goto LABEL_12;
  }
  int v8 = [v6 mtIsAfterDate:*(void *)(a1 + 32)];
  id v9 = MTLogForCategory(3);
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (!v8)
  {
    if (v10)
    {
      id v13 = [*(id *)(a1 + 40) alarmID];
      int v15 = 138543874;
      uint64_t v16 = v13;
      __int16 v17 = 2114;
      id v18 = v5;
      __int16 v19 = 2114;
      id v20 = v7;
      uint64_t v14 = "%{public}@ %{public}@ %{public}@";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (v10)
  {
    uint64_t v11 = [*(id *)(a1 + 40) alarmID];
    uint64_t v12 = *(void **)(a1 + 32);
    int v15 = 138544130;
    uint64_t v16 = v11;
    __int16 v17 = 2114;
    id v18 = v5;
    __int16 v19 = 2114;
    id v20 = v12;
    __int16 v21 = 2114;
    id v22 = v7;
    _os_log_impl(&dword_19CC95000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@ after %{public}@ (%{public}@)", (uint8_t *)&v15, 0x2Au);
  }
  [*(id *)(a1 + 48) addObject:v7];
LABEL_12:
}

- (id)_nextDateHelperWithDate:(id)a3 calendar:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(MTAlarm *)self dateComponents];
  if ([(MTAlarm *)self repeats] && [(MTAlarm *)self repeatSchedule] != 127)
  {
    uint64_t v21 = 0;
    id v22 = &v21;
    uint64_t v23 = 0x3032000000;
    id v24 = __Block_byref_object_copy__7;
    v25 = __Block_byref_object_dispose__7;
    id v26 = [MEMORY[0x1E4F1C9C8] distantFuture];
    uint64_t v9 = [(MTAlarm *)self repeatSchedule];
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    int v15 = __44__MTAlarm__nextDateHelperWithDate_calendar___block_invoke;
    uint64_t v16 = &unk_1E5916A88;
    __int16 v17 = self;
    id v18 = v6;
    id v10 = v7;
    id v19 = v10;
    id v20 = &v21;
    MTAlarmRepeatScheduleEnumerateDays(v9, &v13);
    objc_msgSend(v8, "setWeekday:", objc_msgSend(v10, "component:fromDate:", 512, v22[5], v13, v14, v15, v16, v17));

    _Block_object_dispose(&v21, 8);
  }
  uint64_t v11 = [v7 mtNextDateAfterDate:v6 matchingComponents:v8];

  return v11;
}

void __44__MTAlarm__nextDateHelperWithDate_calendar___block_invoke(uint64_t a1, unint64_t a2)
{
  if (![(id)objc_opt_class() _date:*(void *)(a1 + 40) isOnDay:a2 calendar:*(void *)(a1 + 48)])
  {
LABEL_5:
    if (a2 < 7) {
      unint64_t v6 = a2 + 1;
    }
    else {
      unint64_t v6 = 0;
    }
    id v5 = [*(id *)(a1 + 48) mtNextDateAfterDate:*(void *)(a1 + 40) matchingUnit:512 value:v6];
    goto LABEL_9;
  }
  id v4 = [*(id *)(a1 + 48) components:30 fromDate:*(void *)(a1 + 40)];
  objc_msgSend(v4, "setHour:", objc_msgSend(*(id *)(a1 + 32), "hour"));
  objc_msgSend(v4, "setMinute:", objc_msgSend(*(id *)(a1 + 32), "minute"));
  id v10 = [*(id *)(a1 + 48) dateFromComponents:v4];
  if ([v10 mtIsBeforeOrSameAsDate:*(void *)(a1 + 40)])
  {

    goto LABEL_5;
  }

  id v5 = v10;
  if (!v10) {
    goto LABEL_5;
  }
LABEL_9:
  id v11 = v5;
  uint64_t v7 = [v5 earlierDate:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
  uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

- (BOOL)isSingleTimeAlarm
{
  return ![(MTAlarm *)self repeatSchedule] && [(MTAlarm *)self year] != 0x7FFFFFFFFFFFFFFFLL;
}

- (id)singleTimeOverrideDateInCalendar:(id)a3
{
  id v5 = a3;
  if (![(MTAlarm *)self isSingleTimeAlarm])
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"MTAlarm.m" lineNumber:670 description:@"Must be a single time override"];
  }
  unint64_t v6 = [(MTAlarm *)self dateComponents];
  uint64_t v7 = [v5 dateFromComponents:v6];

  return v7;
}

- (BOOL)overridesNextAlarm:(id)a3 date:(id)a4 calendar:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a3;
  if (![(MTAlarm *)self isSingleTimeAlarm])
  {
    int v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"MTAlarm.m" lineNumber:676 description:@"Must be a single time override"];
  }
  uint64_t v12 = [(MTAlarm *)self nextTriggerAfterDate:v9 ofType:4];
  BOOL v13 = [(MTAlarm *)self overridesAlarm:v11 trigger:v12 calendar:v10];

  return v13;
}

- (BOOL)overridesAlarm:(id)a3 trigger:(id)a4 calendar:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  if (![(MTAlarm *)self isSingleTimeAlarm])
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"MTAlarm.m" lineNumber:682 description:@"Must be a single time override"];
  }
  id v10 = [(MTAlarm *)self singleTimeOverrideDateInCalendar:v8];
  id v11 = [v9 triggerDate];

  char v12 = [v8 isDate:v10 inSameDayAsDate:v11];
  return v12;
}

+ (BOOL)_date:(id)a3 isOnDay:(int64_t)a4 calendar:(id)a5
{
  if ((unint64_t)a4 < 7) {
    int64_t v5 = a4 + 1;
  }
  else {
    int64_t v5 = 0;
  }
  return v5 == [a5 component:512 fromDate:a3];
}

+ (id)mostRecentlyUpdatedAlarmForAlarms:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = a3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (!v4)
  {
    unint64_t v6 = 0;
    goto LABEL_19;
  }
  uint64_t v5 = v4;
  unint64_t v6 = 0;
  uint64_t v7 = *(void *)v19;
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v19 != v7) {
        objc_enumerationMutation(obj);
      }
      id v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
      if (!v6) {
        goto LABEL_14;
      }
      id v10 = [v6 lastModifiedDate];
      if (!v10)
      {
        uint64_t v14 = [v9 lastModifiedDate];
        BOOL v3 = v14;
        if (v14)
        {

LABEL_14:
          id v15 = v9;

          unint64_t v6 = v15;
          continue;
        }
      }
      id v11 = [v9 lastModifiedDate];
      char v12 = [v6 lastModifiedDate];
      int v13 = [v11 mtIsAfterDate:v12];

      if (!v10)
      {

        if ((v13 & 1) == 0) {
          continue;
        }
        goto LABEL_14;
      }

      if (v13) {
        goto LABEL_14;
      }
    }
    uint64_t v5 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  }
  while (v5);
LABEL_19:

  return v6;
}

- (unint64_t)hash
{
  double v2 = [(MTAlarm *)self alarmID];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    unint64_t v6 = v5;
  }
  else {
    unint64_t v6 = 0;
  }
  id v7 = v6;

  if (v7) {
    BOOL v8 = [(MTAlarm *)self isEqualToAlarm:v7];
  }
  else {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)isEqualIgnoringLastModifiedDate:(id)a3
{
  return [(MTAlarm *)self _isEqualToAlarm:a3 checkLastModified:0];
}

- (BOOL)isEqualToAlarm:(id)a3
{
  return [(MTAlarm *)self _isEqualToAlarm:a3 checkLastModified:1];
}

- (BOOL)_isEqualToAlarm:(id)a3 checkLastModified:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [v6 alarmID];
  BOOL v8 = [(MTAlarm *)self alarmID];
  if (v7 != v8)
  {
    id v9 = [v6 alarmID];
    v133 = [(MTAlarm *)self alarmID];
    v134 = v9;
    if (!objc_msgSend(v9, "isEqual:")) {
      goto LABEL_10;
    }
  }
  uint64_t v10 = [v6 hour];
  if (v10 != [(MTAlarm *)self hour]
    || (uint64_t v11 = [v6 minute], v11 != -[MTAlarm minute](self, "minute"))
    || (uint64_t v12 = [v6 bedtimeHour], v12 != -[MTAlarm bedtimeHour](self, "bedtimeHour"))
    || (uint64_t v13 = [v6 bedtimeMinute], v13 != -[MTAlarm bedtimeMinute](self, "bedtimeMinute")))
  {
LABEL_10:
    memset((char *)v137 + 4, 0, 48);
    long long v135 = 0uLL;
    BOOL v4 = 0;
    int v17 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    memset(v136, 0, sizeof(v136));
    int v21 = 0;
    int v22 = 0;
    LOBYTE(v137[0]) = 0;
    goto LABEL_11;
  }
  uint64_t v14 = [v6 bedtimeReminder];
  v131 = [(MTAlarm *)self bedtimeReminder];
  v132 = (void *)v14;
  BOOL v15 = v14 != (void)v131;
  if ((void *)v14 != v131)
  {
    uint64_t v16 = [v6 bedtimeReminder];
    v129 = [(MTAlarm *)self bedtimeReminder];
    v130 = v16;
    if (!objc_msgSend(v16, "isEqual:"))
    {
      long long v135 = 0uLL;
      BOOL v4 = 0;
      v137[0] = 0;
      memset(&v137[2], 0, 32);
      int v17 = 0;
      int v18 = 0;
      int v19 = 0;
      int v20 = 0;
      memset(v136, 0, sizeof(v136));
      int v21 = 0;
      int v22 = 0;
      v137[1] = 1;
      LODWORD(v137[6]) = 1;
      goto LABEL_11;
    }
  }
  int v33 = [v6 sleepMode];
  LODWORD(v137[6]) = v15;
  if (v33 != [(MTAlarm *)self sleepMode]
    || (uint64_t v34 = [v6 sleepModeOptions], v34 != -[MTAlarm sleepModeOptions](self, "sleepModeOptions"))
    || (int v35 = [v6 sleepTracking], v35 != -[MTAlarm sleepTracking](self, "sleepTracking"))
    || (uint64_t v36 = [v6 day], v36 != -[MTAlarm day](self, "day"))
    || (uint64_t v37 = [v6 month], v37 != -[MTAlarm month](self, "month"))
    || (uint64_t v38 = [v6 year], v38 != -[MTAlarm year](self, "year")))
  {
    long long v135 = 0uLL;
    BOOL v4 = 0;
    v137[0] = 0;
    memset(&v137[2], 0, 32);
    int v17 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    memset(v136, 0, sizeof(v136));
    int v21 = 0;
    int v22 = 0;
    v137[1] = 1;
    goto LABEL_11;
  }
  uint64_t v39 = [v6 overriddenForDate];
  uint64_t v40 = [(MTAlarm *)self overriddenForDate];
  BOOL v41 = v39 != v40;
  v127 = (void *)v40;
  v128 = (void *)v39;
  if (v39 == v40)
  {
    HIDWORD(v137[5]) = 0;
  }
  else
  {
    v42 = [v6 overriddenForDate];
    BOOL v125 = [(MTAlarm *)self overriddenForDate];
    uint64_t v126 = v42;
    if (!objc_msgSend(v42, "isEqual:"))
    {
      BOOL v4 = 0;
      v137[0] = 0;
      memset((char *)&v137[1] + 4, 0, 32);
      int v17 = 0;
      int v18 = 0;
      int v19 = 0;
      int v20 = 0;
      memset(v136, 0, sizeof(v136));
      int v21 = 0;
      int v22 = 0;
      LODWORD(v137[1]) = 1;
      long long v135 = 1uLL;
      HIDWORD(v137[5]) = 1;
      goto LABEL_11;
    }
    HIDWORD(v137[5]) = v41;
  }
  int v43 = [v6 timeInBedTracking];
  if (v43 != [(MTAlarm *)self timeInBedTracking]
    || (int v44 = [v6 sleepSchedule], v44 != -[MTAlarm sleepSchedule](self, "sleepSchedule"))
    || (uint64_t v45 = [v6 repeatSchedule], v45 != -[MTAlarm repeatSchedule](self, "repeatSchedule")))
  {
    BOOL v4 = 0;
    v137[0] = 0;
    memset((char *)&v137[1] + 4, 0, 32);
    int v17 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    memset(v136, 0, sizeof(v136));
    int v21 = 0;
    int v22 = 0;
    LODWORD(v137[1]) = 1;
    long long v135 = 1uLL;
    goto LABEL_11;
  }
  v77 = v6;
  int v46 = [v6 isEnabled];
  if (v46 != [(MTAlarm *)self isEnabled]
    || (int v47 = [v6 isSleepAlarm], v47 != -[MTAlarm isSleepAlarm](self, "isSleepAlarm"))
    || (int v48 = [v6 allowsSnooze], v48 != -[MTAlarm allowsSnooze](self, "allowsSnooze"))
    || (uint64_t v49 = [v6 onboardingVersion], v49 != -[MTAlarm onboardingVersion](self, "onboardingVersion"))
    || (uint64_t v50 = [v6 dismissedAction], v50 != -[MTAlarm dismissedAction](self, "dismissedAction"))
    || (uint64_t v51 = [v6 bedtimeDismissedAction],
        v51 != [(MTAlarm *)self bedtimeDismissedAction]))
  {
    BOOL v4 = 0;
    v137[0] = 0;
    memset((char *)&v137[1] + 4, 0, 32);
    int v17 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    memset(v136, 0, sizeof(v136));
    int v21 = 0;
    int v22 = 0;
    LODWORD(v137[1]) = 1;
    long long v135 = 1uLL;
    goto LABEL_96;
  }
  uint64_t v52 = [v6 snoozeFireDate];
  int v123 = [(MTAlarm *)self snoozeFireDate];
  __int16 v124 = (void *)v52;
  LODWORD(v137[5]) = v52 != (void)v123;
  if ((void *)v52 != v123)
  {
    uint64_t v53 = [v6 snoozeFireDate];
    uint64_t v119 = [(MTAlarm *)self snoozeFireDate];
    uint64_t v120 = v53;
    if (!objc_msgSend(v53, "isEqual:"))
    {
      *(void *)v136 = 0;
      *(void *)&v136[8] = 0;
      BOOL v4 = 0;
      v137[0] = 0;
      int v17 = 0;
      int v18 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      LODWORD(v137[1]) = 1;
      memset((char *)&v137[1] + 4, 0, 28);
      long long v135 = 1uLL;
      *(_DWORD *)&v136[16] = 1;
      LODWORD(v137[5]) = 1;
LABEL_96:
      id v6 = v77;
      goto LABEL_11;
    }
  }
  uint64_t v54 = [v6 bedtimeSnoozeFireDate];
  id v121 = [(MTAlarm *)self bedtimeSnoozeFireDate];
  v122 = (void *)v54;
  HIDWORD(v137[4]) = v54 != (void)v121;
  if ((void *)v54 != v121)
  {
    unint64_t v55 = [v6 bedtimeSnoozeFireDate];
    v115 = [(MTAlarm *)self bedtimeSnoozeFireDate];
    v116 = v55;
    if (!objc_msgSend(v55, "isEqual:"))
    {
      *(void *)&v136[4] = 0;
      BOOL v4 = 0;
      v137[0] = 0;
      int v17 = 0;
      memset((char *)&v137[1] + 4, 0, 24);
      int v18 = 0;
      int v19 = 0;
      int v20 = 0;
      *(_DWORD *)v136 = 0;
      int v21 = 0;
      int v22 = 0;
      LODWORD(v137[1]) = 1;
      long long v135 = 1uLL;
      *(void *)&v136[12] = 0x100000001;
      HIDWORD(v137[4]) = 1;
      goto LABEL_96;
    }
  }
  uint64_t v56 = [v6 firedDate];
  char v117 = [(MTAlarm *)self firedDate];
  uint64_t v118 = (void *)v56;
  LODWORD(v137[4]) = v56 != (void)v117;
  if ((void *)v56 != v117)
  {
    int v57 = [v6 firedDate];
    v113 = [(MTAlarm *)self firedDate];
    v114 = v57;
    if (!objc_msgSend(v57, "isEqual:"))
    {
      BOOL v4 = 0;
      v137[0] = 0;
      int v17 = 0;
      int v18 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      LODWORD(v137[1]) = 1;
      memset((char *)&v137[1] + 4, 0, 20);
      long long v135 = 1uLL;
      *(_DWORD *)&v136[8] = 0;
      *(void *)&v136[12] = 0x100000001;
      *(void *)v136 = 0x100000000;
      LODWORD(v137[4]) = 1;
      goto LABEL_96;
    }
  }
  uint64_t v58 = [v6 dismissedDate];
  v111 = [(MTAlarm *)self dismissedDate];
  v112 = (void *)v58;
  HIDWORD(v137[3]) = v58 != (void)v111;
  if ((void *)v58 != v111)
  {
    int v59 = [v6 dismissedDate];
    v109 = [(MTAlarm *)self dismissedDate];
    v110 = v59;
    if (!objc_msgSend(v59, "isEqual:"))
    {
      BOOL v4 = 0;
      v137[0] = 0;
      *(void *)((char *)&v135 + 4) = 0;
      *(void *)((char *)&v137[1] + 4) = 0;
      *(void *)((char *)&v137[2] + 4) = 0;
      int v17 = 0;
      int v18 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      LODWORD(v137[1]) = 1;
      LODWORD(v135) = 1;
      *(_DWORD *)&v136[16] = 1;
      *(_DWORD *)&v136[8] = 0;
      *(_DWORD *)&v136[12] = 1;
      *(_DWORD *)v136 = 0;
      *(_DWORD *)&v136[4] = 1;
      HIDWORD(v135) = 1;
      HIDWORD(v137[3]) = 1;
      goto LABEL_96;
    }
  }
  if (v4)
  {
    uint64_t v60 = [v6 lastModifiedDate];
    uint64_t v107 = [(MTAlarm *)self lastModifiedDate];
    v108 = (void *)v60;
    if ((void *)v60 == v107)
    {
      HIDWORD(v137[0]) = 0;
      uint64_t v107 = (void *)v60;
    }
    else
    {
      v61 = [v77 lastModifiedDate];
      v103 = [(MTAlarm *)self lastModifiedDate];
      v104 = v61;
      LODWORD(v137[1]) = 1;
      if (!objc_msgSend(v61, "isEqual:"))
      {
        *(void *)((char *)&v135 + 4) = 0;
        *(void *)((char *)&v137[1] + 4) = 0;
        *(void *)((char *)&v137[2] + 4) = 0;
        int v17 = 0;
        int v18 = 0;
        int v19 = 0;
        int v20 = 0;
        int v21 = 0;
        int v22 = 0;
        LODWORD(v135) = 1;
        *(_DWORD *)&v136[16] = 1;
        LOBYTE(v137[0]) = 0;
        *(_DWORD *)&v136[8] = 0;
        *(_DWORD *)&v136[12] = 1;
        *(_DWORD *)v136 = 0;
        *(_DWORD *)&v136[4] = 1;
        HIDWORD(v135) = 1;
        BOOL v4 = 1;
        HIDWORD(v137[0]) = 1;
        goto LABEL_96;
      }
      HIDWORD(v137[0]) = 1;
    }
  }
  else
  {
    HIDWORD(v137[0]) = 0;
  }
  uint64_t v62 = [v77 bedtimeFiredDate];
  v105 = [(MTAlarm *)self bedtimeFiredDate];
  uint64_t v106 = (void *)v62;
  LODWORD(v137[3]) = v62 != (void)v105;
  if ((void *)v62 != v105)
  {
    v63 = [v77 bedtimeFiredDate];
    v101 = [(MTAlarm *)self bedtimeFiredDate];
    v102 = v63;
    if (!objc_msgSend(v63, "isEqual:"))
    {
      int v17 = 0;
      int v18 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      *(_OWORD *)&v137[1] = 1uLL;
      *(void *)&long long v135 = 1;
      LOBYTE(v137[0]) = 0;
      *(_DWORD *)&v136[8] = 0;
      *(void *)&v136[12] = 0x100000001;
      *(void *)v136 = 0x100000000;
      *((void *)&v135 + 1) = 0x100000001;
      LODWORD(v137[3]) = 1;
      goto LABEL_96;
    }
  }
  uint64_t v64 = [v77 bedtimeDismissedDate];
  v99 = [(MTAlarm *)self bedtimeDismissedDate];
  v100 = (void *)v64;
  HIDWORD(v137[2]) = v64 != (void)v99;
  if ((void *)v64 != v99)
  {
    v65 = [v77 bedtimeDismissedDate];
    v97 = [(MTAlarm *)self bedtimeDismissedDate];
    v98 = v65;
    if (!objc_msgSend(v65, "isEqual:"))
    {
      int v17 = 0;
      *(void *)((char *)&v137[1] + 4) = 0;
      int v18 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      LODWORD(v137[1]) = 1;
      *(void *)&long long v135 = 0x100000001;
      LOBYTE(v137[0]) = 0;
      *(_DWORD *)&v136[8] = 0;
      *(void *)&v136[12] = 0x100000001;
      *(void *)v136 = 0x100000000;
      *((void *)&v135 + 1) = 0x100000001;
      HIDWORD(v137[2]) = 1;
      goto LABEL_96;
    }
  }
  uint64_t v66 = [v77 keepOffUntilDate];
  v95 = [(MTAlarm *)self keepOffUntilDate];
  v96 = (void *)v66;
  LODWORD(v137[2]) = v66 != (void)v95;
  if ((void *)v66 != v95)
  {
    v67 = [v77 keepOffUntilDate];
    v93 = [(MTAlarm *)self keepOffUntilDate];
    v94 = v67;
    if (!objc_msgSend(v67, "isEqual:"))
    {
      int v18 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      LODWORD(v137[1]) = 1;
      *(void *)((char *)&v137[1] + 4) = 0x100000000;
      *(void *)&long long v135 = 0x100000001;
      LOBYTE(v137[0]) = 0;
      *(_DWORD *)&v136[8] = 0;
      *(void *)&v136[12] = 0x100000001;
      *(void *)v136 = 0x100000000;
      *((void *)&v135 + 1) = 0x100000001;
      int v17 = 1;
      goto LABEL_96;
    }
  }
  uint64_t v68 = [v77 title];
  v91 = [(MTAlarm *)self title];
  unint64_t v92 = (void *)v68;
  HIDWORD(v137[1]) = v68 != (void)v91;
  if ((void *)v68 != v91)
  {
    int v69 = [v77 title];
    v89 = [(MTAlarm *)self title];
    unint64_t v90 = v69;
    if (!objc_msgSend(v69, "isEqual:"))
    {
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      v137[1] = 0x100000001;
      *(void *)&long long v135 = 0x100000001;
      LOBYTE(v137[0]) = 0;
      *(_DWORD *)&v136[8] = 0;
      *(void *)&v136[12] = 0x100000001;
      *(void *)v136 = 0x100000000;
      *((void *)&v135 + 1) = 0x100000001;
      int v17 = 1;
      int v18 = 1;
      goto LABEL_96;
    }
  }
  uint64_t v70 = [v77 sound];
  v87 = [(MTAlarm *)self sound];
  unint64_t v88 = (void *)v70;
  *(_DWORD *)&v136[8] = v70 != (void)v87;
  if ((void *)v70 != v87)
  {
    v71 = [v77 sound];
    v85 = [(MTAlarm *)self sound];
    v86 = v71;
    if (!objc_msgSend(v71, "isEqual:"))
    {
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      LODWORD(v137[1]) = 1;
      *(void *)&long long v135 = 0x100000001;
      LOBYTE(v137[0]) = 0;
      *(void *)&v136[12] = 0x100000001;
      *(void *)v136 = 0x100000000;
      *((void *)&v135 + 1) = 0x100000001;
      int v17 = 1;
      int v18 = 1;
      int v19 = 1;
      *(_DWORD *)&v136[8] = 1;
      goto LABEL_96;
    }
  }
  uint64_t v72 = [v77 siriContext];
  v83 = [(MTAlarm *)self siriContext];
  v84 = (void *)v72;
  *(_DWORD *)v136 = v72 != (void)v83;
  if ((void *)v72 != v83)
  {
    v73 = [v77 siriContext];
    v81 = [(MTAlarm *)self siriContext];
    v82 = v73;
    if (!objc_msgSend(v73, "isEqual:"))
    {
      int v21 = 0;
      int v22 = 0;
      LODWORD(v137[1]) = 1;
      *(void *)&long long v135 = 0x100000001;
      LOBYTE(v137[0]) = 0;
      *(void *)&v136[12] = 0x100000001;
      *((void *)&v135 + 1) = 0x100000001;
      int v17 = 1;
      int v18 = 1;
      int v19 = 1;
      int v20 = 1;
      *(void *)v136 = 0x100000001;
      goto LABEL_96;
    }
  }
  uint64_t v74 = [v77 bypassReloadDate];
  id v79 = [(MTAlarm *)self bypassReloadDate];
  v80 = (void *)v74;
  if ((void *)v74 == v79)
  {
    int v22 = 0;
    LODWORD(v137[1]) = 1;
    *(void *)&long long v135 = 0x100000001;
    *(void *)&v136[12] = 0x100000001;
    *(_DWORD *)&v136[4] = 1;
    *((void *)&v135 + 1) = 0x100000001;
    int v17 = 1;
    int v18 = 1;
    int v19 = 1;
    int v20 = 1;
    id v79 = (void *)v74;
    int v21 = 1;
    LOBYTE(v137[0]) = 1;
    goto LABEL_96;
  }
  id v6 = v77;
  v75 = [v77 bypassReloadDate];
  self = [(MTAlarm *)self bypassReloadDate];
  v78 = v75;
  char v76 = [v75 isEqual:self];
  int v22 = 1;
  LODWORD(v137[1]) = 1;
  *(void *)&long long v135 = 0x100000001;
  LOBYTE(v137[0]) = v76;
  *(void *)&v136[12] = 0x100000001;
  *(_DWORD *)&v136[4] = 1;
  *((void *)&v135 + 1) = 0x100000001;
  int v17 = 1;
  int v18 = 1;
  int v19 = 1;
  int v20 = 1;
  int v21 = 1;
LABEL_11:
  if (v22)
  {
    id v23 = v6;
    int v24 = v19;
    v25 = v8;
    id v26 = v7;
    int v27 = v18;
    int v28 = v20;
    BOOL v29 = v4;
    int v30 = v17;
    int v31 = v21;

    int v21 = v31;
    int v17 = v30;
    BOOL v4 = v29;
    int v20 = v28;
    int v18 = v27;
    id v7 = v26;
    BOOL v8 = v25;
    int v19 = v24;
    id v6 = v23;
  }
  if (v21)
  {
  }
  if (*(_DWORD *)v136)
  {
  }
  if (v20)
  {
  }
  if (*(_DWORD *)&v136[8])
  {
  }
  if (v19)
  {
  }
  if (HIDWORD(v137[1]))
  {
  }
  if (v18)
  {
  }
  if (LODWORD(v137[2]))
  {
  }
  if (v17)
  {
  }
  if (HIDWORD(v137[2]))
  {
  }
  if (DWORD1(v135))
  {
  }
  if (LODWORD(v137[3]))
  {
  }
  if (DWORD2(v135))
  {
  }
  if (HIDWORD(v137[0]))
  {
  }
  if (v4)
  {
  }
  if (HIDWORD(v137[3]))
  {
  }
  if (HIDWORD(v135))
  {
  }
  if (LODWORD(v137[4]))
  {
  }
  if (*(_DWORD *)&v136[4])
  {
  }
  if (HIDWORD(v137[4]))
  {
  }
  if (*(_DWORD *)&v136[12])
  {
  }
  if (LODWORD(v137[5]))
  {
  }
  if (*(_DWORD *)&v136[16])
  {
  }
  if (HIDWORD(v137[5]))
  {
  }
  if (v135)
  {
  }
  if (LODWORD(v137[6]))
  {
  }
  if (LODWORD(v137[1]))
  {
  }
  if (v7 != v8)
  {
  }
  return v137[0];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  BOOL v4 = +[MTMutableAlarm allocWithZone:a3];
  id v5 = [(MTAlarm *)self alarmID];
  id v6 = [(MTAlarm *)v4 initWithIdentifier:v5];

  [(MTAlarm *)self _copyStateOntoAlarm:v6];
  return v6;
}

- (void)_copyStateOntoAlarm:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "setHour:", -[MTAlarm hour](self, "hour"));
  objc_msgSend(v4, "setMinute:", -[MTAlarm minute](self, "minute"));
  objc_msgSend(v4, "setBedtimeHour:", -[MTAlarm bedtimeHour](self, "bedtimeHour"));
  objc_msgSend(v4, "setBedtimeMinute:", -[MTAlarm bedtimeMinute](self, "bedtimeMinute"));
  id v5 = [(MTAlarm *)self bedtimeReminder];
  [v4 setBedtimeReminder:v5];

  objc_msgSend(v4, "setSleepMode:", -[MTAlarm sleepMode](self, "sleepMode"));
  objc_msgSend(v4, "setSleepModeOptions:", -[MTAlarm sleepModeOptions](self, "sleepModeOptions"));
  objc_msgSend(v4, "setSleepTracking:", -[MTAlarm sleepTracking](self, "sleepTracking"));
  objc_msgSend(v4, "setDay:", -[MTAlarm day](self, "day"));
  objc_msgSend(v4, "setMonth:", -[MTAlarm month](self, "month"));
  objc_msgSend(v4, "setYear:", -[MTAlarm year](self, "year"));
  objc_msgSend(v4, "setTimeInBedTracking:", -[MTAlarm timeInBedTracking](self, "timeInBedTracking"));
  objc_msgSend(v4, "setSleepSchedule:", -[MTAlarm sleepSchedule](self, "sleepSchedule"));
  objc_msgSend(v4, "setRepeatSchedule:", -[MTAlarm repeatSchedule](self, "repeatSchedule"));
  objc_msgSend(v4, "setEnabled:", -[MTAlarm isEnabled](self, "isEnabled"));
  objc_msgSend(v4, "setSleepAlarm:", -[MTAlarm isSleepAlarm](self, "isSleepAlarm"));
  objc_msgSend(v4, "setAllowsSnooze:", -[MTAlarm allowsSnooze](self, "allowsSnooze"));
  id v6 = [(MTAlarm *)self snoozeFireDate];
  [v4 setSnoozeFireDate:v6];

  id v7 = [(MTAlarm *)self bedtimeSnoozeFireDate];
  [v4 setBedtimeSnoozeFireDate:v7];

  BOOL v8 = [(MTAlarm *)self firedDate];
  [v4 setFiredDate:v8];

  id v9 = [(MTAlarm *)self dismissedDate];
  [v4 setDismissedDate:v9];

  objc_msgSend(v4, "setDismissedAction:", -[MTAlarm dismissedAction](self, "dismissedAction"));
  uint64_t v10 = [(MTAlarm *)self lastModifiedDate];
  [v4 setLastModifiedDate:v10];

  uint64_t v11 = [(MTAlarm *)self bedtimeFiredDate];
  [v4 setBedtimeFiredDate:v11];

  uint64_t v12 = [(MTAlarm *)self bedtimeDismissedDate];
  [v4 setBedtimeDismissedDate:v12];

  objc_msgSend(v4, "setBedtimeDismissedAction:", -[MTAlarm bedtimeDismissedAction](self, "bedtimeDismissedAction"));
  uint64_t v13 = [(MTAlarm *)self keepOffUntilDate];
  [v4 setKeepOffUntilDate:v13];

  uint64_t v14 = [(MTAlarm *)self overriddenForDate];
  [v4 setOverriddenForDate:v14];

  BOOL v15 = [(MTAlarm *)self title];
  [v4 setTitle:v15];

  uint64_t v16 = [(MTAlarm *)self sound];
  [v4 setSound:v16];

  objc_msgSend(v4, "setOnboardingVersion:", -[MTAlarm onboardingVersion](self, "onboardingVersion"));
  int v17 = [(MTAlarm *)self currentDateProvider];
  [v4 setCurrentDateProvider:v17];

  int v18 = [(MTAlarm *)self siriContext];
  [v4 setSiriContext:v18];

  id v19 = [(MTAlarm *)self bypassReloadDate];
  [v4 setBypassReloadDate:v19];
}

- (id)succinctDescription
{
  double v2 = [(MTAlarm *)self succinctDescriptionBuilder];
  unint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  unint64_t v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = [(MTAlarm *)self alarmID];
  id v5 = (id)[v3 appendObject:v4 withName:@"id"];

  id v6 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[MTAlarm isSleepAlarm](self, "isSleepAlarm"), @"sleep", 1);
  id v7 = (id)objc_msgSend(v3, "appendBool:withName:", -[MTAlarm isEnabled](self, "isEnabled"), @"enabled");
  return v3;
}

- (BOOL)shouldBypassWidgetReload
{
  unint64_t v3 = [(MTAlarm *)self bypassReloadDate];

  if (!v3) {
    return 0;
  }
  id v4 = [(MTAlarm *)self bypassReloadDate];
  id v5 = [v4 dateByAddingTimeInterval:10.0];

  id v6 = (*((void (**)(void))self->_currentDateProvider + 2))();
  LOBYTE(v4) = [v6 mtIsBeforeDate:v5];

  return (char)v4;
}

- (void)setHour:(unint64_t)a3
{
  self->_hour = a3;
}

- (void)setMinute:(unint64_t)a3
{
  self->_minute = a3;
}

- (void)setDay:(unint64_t)a3
{
  self->_day = a3;
}

- (void)setMonth:(unint64_t)a3
{
  self->_month = a3;
}

- (void)setYear:(unint64_t)a3
{
  self->_year = a3;
}

- (void)setBedtimeHour:(unint64_t)a3
{
  self->_bedtimeHour = a3;
}

- (void)setBedtimeMinute:(unint64_t)a3
{
  self->_bedtimeMinute = a3;
}

- (void)setBedtimeReminder:(id)a3
{
}

- (void)setSleepSchedule:(BOOL)a3
{
  self->_BOOL sleepSchedule = a3;
}

- (void)setSleepMode:(BOOL)a3
{
  self->_sleepMode = a3;
}

- (void)setSleepModeOptions:(unint64_t)a3
{
  self->_sleepModeOptions = a3;
}

- (void)setSleepTracking:(BOOL)a3
{
  self->_sleepTracking = a3;
}

- (void)setTimeInBedTracking:(BOOL)a3
{
  self->_timeInBedTracking = a3;
}

- (void)setRepeatSchedule:(unint64_t)a3
{
  self->_repeatSchedule = a3;
}

- (void)setEnabled:(BOOL)a3
{
  self->_BOOL enabled = a3;
}

- (void)setSleepAlarm:(BOOL)a3
{
  self->_BOOL sleepAlarm = a3;
}

- (void)setAllowsSnooze:(BOOL)a3
{
  self->_allowsSnooze = a3;
}

- (void)setLastModifiedDate:(id)a3
{
}

- (void)setSound:(id)a3
{
}

- (void)setOverriddenForDate:(id)a3
{
}

- (void)setSnoozeFireDate:(id)a3
{
}

- (void)setBedtimeSnoozeFireDate:(id)a3
{
}

- (void)setFiredDate:(id)a3
{
}

- (void)setDismissedDate:(id)a3
{
}

- (void)setDismissedAction:(unint64_t)a3
{
  self->_dismissedAction = a3;
}

- (void)setBedtimeFiredDate:(id)a3
{
}

- (void)setBedtimeDismissedDate:(id)a3
{
}

- (void)setBedtimeDismissedAction:(unint64_t)a3
{
  self->_bedtimeDismissedAction = a3;
}

- (void)setKeepOffUntilDate:(id)a3
{
}

- (void)setOnboardingVersion:(unint64_t)a3
{
  self->_onboardingVersion = a3;
}

- (id)currentDateProvider
{
  return self->_currentDateProvider;
}

- (void)setCurrentDateProvider:(id)a3
{
}

- (void)setSiriContext:(id)a3
{
}

- (void)setBypassReloadDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bypassReloadDate, 0);
  objc_storeStrong((id *)&self->_siriContext, 0);
  objc_storeStrong(&self->_currentDateProvider, 0);
  objc_storeStrong((id *)&self->_keepOffUntilDate, 0);
  objc_storeStrong((id *)&self->_bedtimeDismissedDate, 0);
  objc_storeStrong((id *)&self->_bedtimeFiredDate, 0);
  objc_storeStrong((id *)&self->_dismissedDate, 0);
  objc_storeStrong((id *)&self->_firedDate, 0);
  objc_storeStrong((id *)&self->_bedtimeSnoozeFireDate, 0);
  objc_storeStrong((id *)&self->_snoozeFireDate, 0);
  objc_storeStrong((id *)&self->_overriddenForDate, 0);
  objc_storeStrong((id *)&self->_sound, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_lastModifiedDate, 0);
  objc_storeStrong((id *)&self->_bedtimeReminder, 0);
  objc_storeStrong((id *)&self->_alarmID, 0);
}

+ (id)propertiesAffectingWaketime
{
  if (propertiesAffectingWaketime_onceToken != -1) {
    dispatch_once(&propertiesAffectingWaketime_onceToken, &__block_literal_global_50);
  }
  double v2 = (void *)propertiesAffectingWaketime_propertiesAffectingWaketime;
  return v2;
}

void __50__MTAlarm_Properties__propertiesAffectingWaketime__block_invoke()
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = @"MTAlarmHour";
  v4[1] = @"MTAlarmMinute";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
  uint64_t v2 = [v0 setWithArray:v1];
  unint64_t v3 = (void *)propertiesAffectingWaketime_propertiesAffectingWaketime;
  propertiesAffectingWaketime_propertiesAffectingWaketime = v2;
}

+ (id)propertiesAffectingBedtime
{
  if (propertiesAffectingBedtime_onceToken != -1) {
    dispatch_once(&propertiesAffectingBedtime_onceToken, &__block_literal_global_124);
  }
  uint64_t v2 = (void *)propertiesAffectingBedtime_propertiesAffectingBedtime;
  return v2;
}

void __49__MTAlarm_Properties__propertiesAffectingBedtime__block_invoke()
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = @"MTAlarmBedtimeHour";
  v4[1] = @"MTAlarmBedtimeMinute";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
  uint64_t v2 = [v0 setWithArray:v1];
  unint64_t v3 = (void *)propertiesAffectingBedtime_propertiesAffectingBedtime;
  propertiesAffectingBedtime_propertiesAffectingBedtime = v2;
}

+ (id)propertiesAffectingSnooze
{
  if (propertiesAffectingSnooze_onceToken != -1) {
    dispatch_once(&propertiesAffectingSnooze_onceToken, &__block_literal_global_126);
  }
  uint64_t v2 = (void *)propertiesAffectingSnooze_propertiesAffectingSnooze;
  return v2;
}

void __48__MTAlarm_Properties__propertiesAffectingSnooze__block_invoke()
{
  v4[4] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = @"MTAlarmHour";
  v4[1] = @"MTAlarmMinute";
  v4[2] = @"MTAlarmAllowsSnooze";
  void v4[3] = @"MTAlarmDismissDate";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:4];
  uint64_t v2 = [v0 setWithArray:v1];
  unint64_t v3 = (void *)propertiesAffectingSnooze_propertiesAffectingSnooze;
  propertiesAffectingSnooze_propertiesAffectingSnooze = v2;
}

+ (id)propertiesAffectingNotification
{
  if (propertiesAffectingNotification_onceToken != -1) {
    dispatch_once(&propertiesAffectingNotification_onceToken, &__block_literal_global_128);
  }
  uint64_t v2 = (void *)propertiesAffectingNotification_propertiesAffectingNotification;
  return v2;
}

void __54__MTAlarm_Properties__propertiesAffectingNotification__block_invoke()
{
  v4[21] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = @"MTAlarmHour";
  v4[1] = @"MTAlarmMinute";
  v4[2] = @"MTAlarmBedtimeHour";
  void v4[3] = @"MTAlarmBedtimeMinute";
  v4[4] = @"MTAlarmRepeatSchedule";
  void v4[5] = @"MTAlarmEnabled";
  v4[6] = @"MTAlarmBedtimeReminderMinutes";
  v4[7] = @"MTAlarmBedtimeDoNotDisturb";
  v4[8] = @"MTAlarmBedtimeDoNotDisturbOptions";
  v4[9] = @"MTAlarmSleepScheduleKey";
  v4[10] = @"MTAlarmTimeInBedTrackingKey";
  v4[11] = @"MTAlarmSleepTrackingKey";
  v4[12] = @"MTAlarmBedtimeForSleepTracking";
  v4[13] = @"MTAlarmWakeupForSleepTracking";
  v4[14] = @"MTAlarmIsSleep";
  v4[15] = @"MTAlarmAllowsSnooze";
  v4[16] = @"MTAlarmSnoozeFireDate";
  v4[17] = @"MTAlarmBedtimeSnoozeFireDate";
  v4[18] = @"MTAlarmTitle";
  v4[19] = @"MTAlarmSound";
  v4[20] = @"MTAlarmOnboardingVersion";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:21];
  uint64_t v2 = [v0 setWithArray:v1];
  unint64_t v3 = (void *)propertiesAffectingNotification_propertiesAffectingNotification;
  propertiesAffectingNotification_propertiesAffectingNotification = v2;
}

+ (id)propertiesAffectingSync
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__MTAlarm_Properties__propertiesAffectingSync__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (propertiesAffectingSync_onceToken != -1) {
    dispatch_once(&propertiesAffectingSync_onceToken, block);
  }
  uint64_t v2 = (void *)propertiesAffectingSync_propertiesAffectingSync;
  return v2;
}

void __46__MTAlarm_Properties__propertiesAffectingSync__block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = [*(id *)(a1 + 32) propertiesAffectingNotification];
  uint64_t v2 = [v1 setWithSet:v4];
  unint64_t v3 = (void *)propertiesAffectingSync_propertiesAffectingSync;
  propertiesAffectingSync_propertiesAffectingSync = v2;
}

+ (id)propertiesAffectingSessions
{
  if (propertiesAffectingSessions_onceToken_0 != -1) {
    dispatch_once(&propertiesAffectingSessions_onceToken_0, &__block_literal_global_130);
  }
  uint64_t v2 = (void *)propertiesAffectingSessions_propertiesAffectingSnooze;
  return v2;
}

void __50__MTAlarm_Properties__propertiesAffectingSessions__block_invoke()
{
  v4[12] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = @"MTAlarmHour";
  v4[1] = @"MTAlarmMinute";
  v4[2] = @"MTAlarmRepeatSchedule";
  void v4[3] = @"MTAlarmEnabled";
  v4[4] = @"MTAlarmAllowsSnooze";
  void v4[5] = @"MTAlarmSnoozeFireDate";
  v4[6] = @"MTAlarmBedtimeSnoozeFireDate";
  v4[7] = @"MTAlarmTitle";
  v4[8] = @"MTAlarmSound";
  v4[9] = @"MTAlarmOnboardingVersion";
  v4[10] = @"MTAlarmFiring";
  v4[11] = @"MTAlarmDismissDate";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:12];
  uint64_t v2 = [v0 setWithArray:v1];
  unint64_t v3 = (void *)propertiesAffectingSessions_propertiesAffectingSnooze;
  propertiesAffectingSessions_propertiesAffectingSnooze = v2;
}

@end