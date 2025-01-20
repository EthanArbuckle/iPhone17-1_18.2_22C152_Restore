@interface Alarm
+ (BOOL)verifyDaySetting:(id)a3 withMessageList:(id)a4;
+ (BOOL)verifyHourSetting:(id)a3 withMessageList:(id)a4;
+ (BOOL)verifyIdSetting:(id)a3 withMessageList:(id)a4;
+ (BOOL)verifyMinuteSetting:(id)a3 withMessageList:(id)a4;
+ (BOOL)verifySettings:(id)a3;
+ (id)timeComparator;
- (Alarm)editingProxy;
- (Alarm)init;
- (Alarm)initWithSettings:(id)a3;
- (AlarmDelegate)delegate;
- (BOOL)allowsSnooze;
- (BOOL)forceActiveForMigration;
- (BOOL)isActive;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSleepAlarm;
- (BOOL)isSnoozed;
- (BOOL)repeats;
- (NSArray)repeatDays;
- (NSDate)lastModified;
- (NSDictionary)settings;
- (NSNumber)bedtimeReminderMinutes;
- (NSNumber)soundVolume;
- (NSString)alarmID;
- (NSString)sound;
- (NSString)title;
- (NSString)uiTitle;
- (NSString)vibrationID;
- (NSURL)alarmIDURL;
- (id)_newBaseDateComponentsForDay:(int64_t)a3;
- (id)debugDescription;
- (id)description;
- (id)nowDateForOffsetCalculation;
- (id)timeZoneForOffsetCalculation;
- (int64_t)bedtimeHour;
- (int64_t)bedtimeMinute;
- (int64_t)compareTime:(id)a3;
- (int64_t)soundType;
- (unint64_t)hash;
- (unsigned)daySetting;
- (unsigned)hour;
- (unsigned)minute;
- (unsigned)revision;
- (void)applyChangesFromEditingProxy;
- (void)applySettings:(id)a3;
- (void)dropEditingProxy;
- (void)markModified;
- (void)prepareEditingProxy;
- (void)refreshActiveState;
- (void)setAlarmID:(id)a3;
- (void)setAlarmIDURL:(id)a3;
- (void)setAllowsSnooze:(BOOL)a3;
- (void)setBedtimeHour:(int64_t)a3;
- (void)setBedtimeMinute:(int64_t)a3;
- (void)setBedtimeReminderMinutes:(id)a3;
- (void)setDaySetting:(unsigned int)a3;
- (void)setDelegate:(id)a3;
- (void)setForceActiveForMigration:(BOOL)a3;
- (void)setHour:(unsigned int)a3;
- (void)setIsSleepAlarm:(BOOL)a3;
- (void)setMinute:(unsigned int)a3;
- (void)setSound:(id)a3 ofType:(int64_t)a4;
- (void)setSoundVolume:(id)a3;
- (void)setTitle:(id)a3;
- (void)setVibrationID:(id)a3;
@end

@implementation Alarm

- (Alarm)init
{
  return [(Alarm *)self initWithSettings:0];
}

- (Alarm)initWithSettings:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)Alarm;
  v5 = [(Alarm *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F1C9C8] distantPast];
    lastModified = v5->_lastModified;
    v5->_lastModified = (NSDate *)v6;

    v5->_revision = 0;
    [(Alarm *)v5 applySettings:v4];
    v8 = v5;
  }

  return v5;
}

- (void)applySettings:(id)a3
{
  v32[14] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v31[0] = @"alarmId";
  v31[1] = @"hour";
  v32[0] = &stru_1EEDE16C8;
  v32[1] = &unk_1EEE11CE8;
  v31[2] = @"minute";
  v31[3] = @"allowsSnooze";
  v32[2] = &unk_1EEE11CE8;
  v32[3] = MEMORY[0x1E4F1CC28];
  v31[4] = @"isSleepAlarm";
  v31[5] = @"bedtimeHour";
  v32[4] = MEMORY[0x1E4F1CC28];
  v32[5] = &unk_1EEE11CE8;
  v31[6] = @"bedtimeMinute";
  v31[7] = @"daySetting";
  v32[6] = &unk_1EEE11CE8;
  v32[7] = &unk_1EEE11CE8;
  v31[8] = @"title";
  v31[9] = @"soundType";
  v32[8] = &stru_1EEDE16C8;
  v32[9] = &unk_1EEE11D00;
  v31[10] = @"sound";
  v31[11] = @"vibe";
  v32[10] = &stru_1EEDE16C8;
  v32[11] = &stru_1EEDE16C8;
  v32[12] = self->_lastModified;
  v31[12] = @"lastModified";
  v31[13] = @"revision";
  v5 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:self->_revision];
  v32[13] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:14];
  v7 = (NSMutableDictionary *)[v6 mutableCopy];
  settings = self->_settings;
  self->_settings = v7;

  if (v4)
  {
    v9 = [v4 objectForKey:@"alarmId"];
    alarmID = self->_alarmID;
    self->_alarmID = v9;

    [(NSMutableDictionary *)self->_settings setObject:self->_alarmID forKey:@"alarmId"];
    v11 = [v4 objectForKey:@"hour"];
    -[Alarm setHour:](self, "setHour:", [v11 unsignedIntValue]);

    v12 = [v4 objectForKey:@"minute"];
    -[Alarm setMinute:](self, "setMinute:", [v12 unsignedIntValue]);

    v13 = [v4 objectForKey:@"allowsSnooze"];
    -[Alarm setAllowsSnooze:](self, "setAllowsSnooze:", [v13 BOOLValue]);

    v14 = [v4 objectForKey:@"soundType"];
    if (!v14)
    {
      v14 = [MEMORY[0x1E4F28ED0] numberWithInt:1];
    }
    v15 = [v4 objectForKey:@"sound"];
    -[Alarm setSound:ofType:](self, "setSound:ofType:", v15, (int)[v14 intValue]);

    v16 = [v4 objectForKey:@"soundVolume"];
    [(Alarm *)self setSoundVolume:v16];

    v17 = [v4 objectForKey:@"vibe"];
    [(Alarm *)self setVibrationID:v17];

    v18 = [v4 objectForKey:@"title"];
    [(Alarm *)self setTitle:v18];

    v19 = [v4 objectForKey:@"daySetting"];
    -[Alarm setDaySetting:](self, "setDaySetting:", [v19 unsignedIntValue]);

    v20 = [v4 objectForKey:@"isSleepAlarm"];
    -[Alarm setIsSleepAlarm:](self, "setIsSleepAlarm:", [v20 BOOLValue]);

    v21 = [v4 objectForKey:@"bedtimeReminderMinutes"];
    [(Alarm *)self setBedtimeReminderMinutes:v21];

    v22 = [v4 objectForKey:@"bedtimeHour"];
    -[Alarm setBedtimeHour:](self, "setBedtimeHour:", [v22 integerValue]);

    v23 = [v4 objectForKey:@"bedtimeMinute"];
    -[Alarm setBedtimeMinute:](self, "setBedtimeMinute:", [v23 integerValue]);

    v24 = [v4 objectForKey:@"lastModified"];

    if (v24)
    {
      v25 = [v4 objectForKey:@"lastModified"];
      lastModified = self->_lastModified;
      self->_lastModified = v25;

      [(NSMutableDictionary *)self->_settings setObject:self->_lastModified forKey:@"lastModified"];
    }
    v27 = [v4 objectForKey:@"revision"];

    if (v27)
    {
      v28 = [v4 objectForKey:@"revision"];
      self->_revision = [v28 unsignedIntValue];

      v29 = self->_settings;
      v30 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:self->_revision];
      [(NSMutableDictionary *)v29 setObject:v30 forKey:@"revision"];
    }
  }
}

- (void)prepareEditingProxy
{
  [(Alarm *)self dropEditingProxy];
  v3 = objc_alloc_init(Alarm);
  editingProxy = self->_editingProxy;
  self->_editingProxy = v3;

  v5 = self->_editingProxy;
  uint64_t v6 = [(Alarm *)self settings];
  [(Alarm *)v5 applySettings:v6];

  self->_editingProxy->_pretendActiveIfProxy = [(Alarm *)self isActive];
  id v10 = [NSString stringWithFormat:@"%@::%@", @"AlarmEditingProxyID", self->_alarmID];
  [(Alarm *)self->_editingProxy setAlarmID:v10];
  v7 = self->_editingProxy;
  settings = v7->_settings;
  v9 = [(Alarm *)v7 alarmID];
  [(NSMutableDictionary *)settings setObject:v9 forKey:@"alarmId"];

  [(Alarm *)self->_editingProxy setAlarmIDURL:0];
}

- (void)applyChangesFromEditingProxy
{
  [(Alarm *)self setHour:[(Alarm *)self->_editingProxy hour]];
  [(Alarm *)self setMinute:[(Alarm *)self->_editingProxy minute]];
  [(Alarm *)self setDaySetting:[(Alarm *)self->_editingProxy daySetting]];
  [(Alarm *)self setAllowsSnooze:[(Alarm *)self->_editingProxy allowsSnooze]];
  v3 = [(Alarm *)self->_editingProxy sound];
  [(Alarm *)self setSound:v3 ofType:[(Alarm *)self->_editingProxy soundType]];

  id v4 = [(Alarm *)self->_editingProxy vibrationID];
  [(Alarm *)self setVibrationID:v4];

  id v5 = [(Alarm *)self->_editingProxy title];
  [(Alarm *)self setTitle:v5];
}

- (void)dropEditingProxy
{
  self->_editingProxy = 0;
  MEMORY[0x1F41817F8]();
}

+ (BOOL)verifyIdSetting:(id)a3 withMessageList:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v8 = @"Settings :: ID is wrong type";
LABEL_6:
    [v6 addObject:v8];
    BOOL v7 = 0;
    goto LABEL_7;
  }
  if (![v5 length])
  {
    v8 = @"Settings :: ID is invalid";
    goto LABEL_6;
  }
  BOOL v7 = 1;
LABEL_7:

  return v7;
}

+ (BOOL)verifyHourSetting:(id)a3 withMessageList:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (([v5 intValue] & 0x80000000) == 0 && (int)objc_msgSend(v5, "intValue") < 24)
    {
      BOOL v8 = 1;
      goto LABEL_7;
    }
    BOOL v7 = @"Settings :: hour is invalid";
  }
  else
  {
    BOOL v7 = @"Settings :: hour is wrong type";
  }
  [v6 addObject:v7];
  BOOL v8 = 0;
LABEL_7:

  return v8;
}

+ (BOOL)verifyMinuteSetting:(id)a3 withMessageList:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (([v5 intValue] & 0x80000000) == 0 && (int)objc_msgSend(v5, "intValue") < 60)
    {
      BOOL v8 = 1;
      goto LABEL_7;
    }
    BOOL v7 = @"Settings :: minute is invalid";
  }
  else
  {
    BOOL v7 = @"Settings :: minute is wrong type";
  }
  [v6 addObject:v7];
  BOOL v8 = 0;
LABEL_7:

  return v8;
}

+ (BOOL)verifyDaySetting:(id)a3 withMessageList:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v8 = @"Settings :: day setting is wrong type";
LABEL_6:
    [v6 addObject:v8];
    BOOL v7 = 0;
    goto LABEL_7;
  }
  if ([v5 unsignedIntValue] >= 0x80)
  {
    BOOL v8 = @"Settings :: day setting is invalid";
    goto LABEL_6;
  }
  BOOL v7 = 1;
LABEL_7:

  return v7;
}

+ (BOOL)verifySettings:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:5];
  id v5 = v4;
  if (v3)
  {
    id v6 = [v3 objectForKey:@"alarmId"];
    BOOL v7 = +[Alarm verifyIdSetting:v6 withMessageList:v5];

    BOOL v8 = [v3 objectForKey:@"hour"];
    BOOL v9 = +[Alarm verifyHourSetting:v8 withMessageList:v5];

    id v10 = [v3 objectForKey:@"minute"];
    BOOL v11 = +[Alarm verifyMinuteSetting:v10 withMessageList:v5];

    v12 = [v3 objectForKey:@"daySetting"];
    LODWORD(v10) = +[Alarm verifyDaySetting:v12 withMessageList:v5];

    if (v10 && v11 && v9 && v7)
    {
      BOOL v13 = 1;
      goto LABEL_20;
    }
    id v22 = v3;
    v14 = [NSString stringWithFormat:@"Settings :: settings %@", v3];
    [v5 addObject:v14];
  }
  else
  {
    id v22 = 0;
    [v4 addObject:@"Settings is nil"];
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v15 = v5;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v24;
    v19 = (atomic_uint *)MEMORY[0x1E4F4BE80];
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(v15);
        }
        NSLog(&stru_1EEDE1DC8.isa, *(void *)(*((void *)&v23 + 1) + 8 * i));
        if (__shouldLog && (int)atomic_load_explicit(v19, memory_order_acquire) >= 6) {
          _CPLog();
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v17);
  }

  BOOL v13 = 0;
  id v3 = v22;
LABEL_20:

  return v13;
}

- (id)nowDateForOffsetCalculation
{
  return (id)[MEMORY[0x1E4F1C9C8] date];
}

- (id)timeZoneForOffsetCalculation
{
  return (id)[MEMORY[0x1E4F1CAF0] defaultTimeZone];
}

- (id)_newBaseDateComponentsForDay:(int64_t)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v4 setYear:2014];
  [v4 setMonth:1];
  [v4 setWeekdayOrdinal:1];
  if ((unint64_t)a3 < 7) {
    int64_t v5 = a3 + 1;
  }
  else {
    int64_t v5 = 1;
  }
  [v4 setWeekday:v5];
  return v4;
}

- (void)refreshActiveState
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained alarmDidUpdate:self];
}

- (void)markModified
{
  id v3 = (NSDate *)objc_alloc_init(MEMORY[0x1E4F1C9C8]);
  lastModified = self->_lastModified;
  self->_lastModified = v3;

  ++self->_revision;
  [(NSMutableDictionary *)self->_settings setObject:self->_lastModified forKey:@"lastModified"];
  settings = self->_settings;
  id v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:self->_revision];
  [(NSMutableDictionary *)settings setObject:v6 forKey:@"revision"];
}

+ (id)timeComparator
{
  return &__block_literal_global_0;
}

uint64_t __23__Alarm_timeComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unsigned int v6 = [v4 hour];
  if (v6 > [v5 hour]) {
    goto LABEL_5;
  }
  unsigned int v7 = [v4 hour];
  if (v7 < [v5 hour])
  {
    uint64_t v8 = -1;
    goto LABEL_6;
  }
  unsigned int v9 = [v4 minute];
  if (v9 > [v5 minute])
  {
LABEL_5:
    uint64_t v8 = 1;
    goto LABEL_6;
  }
  unsigned int v11 = [v4 minute];
  if (v11 >= [v5 minute]) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = -1;
  }
LABEL_6:

  return v8;
}

- (int64_t)compareTime:(id)a3
{
  id v4 = a3;
  id v5 = +[Alarm timeComparator];
  int64_t v6 = ((uint64_t (**)(void, Alarm *, id))v5)[2](v5, self, v4);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    unsigned int hour = self->_hour;
    if (hour != [v6 hour]
      || (unsigned int minute = self->_minute, minute != [v6 minute]))
    {
      BOOL v12 = 0;
LABEL_17:

      goto LABEL_18;
    }
    title = self->_title;
    id v10 = [v6 title];
    if (title == v10
      || (unsigned int v11 = self->_title,
          [v6 title],
          id v3 = objc_claimAutoreleasedReturnValue(),
          [(NSString *)v11 isEqualToString:v3]))
    {
      sound = self->_sound;
      v14 = [v6 sound];
      if ([(NSString *)sound isEqualToString:v14]
        && (int v15 = -[Alarm isActive](self, "isActive"), v15 == [v6 isActive])
        && (unsigned int daySetting = self->_daySetting, daySetting == [v6 daySetting]))
      {
        int allowsSnooze = self->_allowsSnooze;
        BOOL v12 = allowsSnooze == [v6 allowsSnooze];
      }
      else
      {
        BOOL v12 = 0;
      }

      if (title == v10) {
        goto LABEL_16;
      }
    }
    else
    {
      BOOL v12 = 0;
    }

LABEL_16:
    goto LABEL_17;
  }
  BOOL v12 = 0;
LABEL_18:

  return v12;
}

- (unint64_t)hash
{
  v2 = [(Alarm *)self alarmID];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSString)alarmID
{
  alarmID = self->_alarmID;
  if (!alarmID)
  {
    CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFUUIDRef v5 = CFUUIDCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
    CFUUIDCreateString(v4, v5);
    id v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    unsigned int v7 = self->_alarmID;
    self->_alarmID = v6;

    [(NSMutableDictionary *)self->_settings setObject:self->_alarmID forKey:@"alarmId"];
    CFRelease(v5);
    alarmID = self->_alarmID;
  }
  return alarmID;
}

- (NSURL)alarmIDURL
{
  alarmIDURL = self->_alarmIDURL;
  if (!alarmIDURL)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F1CB10]);
    CFUUIDRef v5 = [(Alarm *)self alarmID];
    id v6 = [@"x-apple-clock:alarm?id=" stringByAppendingString:v5];
    unsigned int v7 = (NSURL *)[v4 initWithString:v6];
    uint64_t v8 = self->_alarmIDURL;
    self->_alarmIDURL = v7;

    alarmIDURL = self->_alarmIDURL;
  }
  return alarmIDURL;
}

- (NSDictionary)settings
{
  v2 = (void *)[(NSMutableDictionary *)self->_settings copy];
  return (NSDictionary *)v2;
}

- (void)setHour:(unsigned int)a3
{
  self->_unsigned int hour = a3;
  settings = self->_settings;
  objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInt:");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(NSMutableDictionary *)settings setObject:v4 forKey:@"hour"];
}

- (void)setMinute:(unsigned int)a3
{
  self->_unsigned int minute = a3;
  settings = self->_settings;
  objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInt:");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(NSMutableDictionary *)settings setObject:v4 forKey:@"minute"];
}

- (BOOL)isActive
{
  if (self->_forceActiveForMigration) {
    return 1;
  }
  if (self->_pretendActiveIfProxy) {
    return [(NSString *)self->_alarmID hasPrefix:@"AlarmEditingProxyID"];
  }
  return 0;
}

- (void)setIsSleepAlarm:(BOOL)a3
{
  self->_isSleepAlarm = a3;
  settings = self->_settings;
  objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(NSMutableDictionary *)settings setObject:v4 forKey:@"isSleepAlarm"];
}

- (NSNumber)bedtimeReminderMinutes
{
  return (NSNumber *)[(NSMutableDictionary *)self->_settings objectForKey:@"bedtimeReminderMinutes"];
}

- (void)setBedtimeReminderMinutes:(id)a3
{
  settings = self->_settings;
  if (a3) {
    [(NSMutableDictionary *)settings setObject:a3 forKey:@"bedtimeReminderMinutes"];
  }
  else {
    [(NSMutableDictionary *)settings removeObjectForKey:@"bedtimeReminderMinutes"];
  }
}

- (int64_t)bedtimeHour
{
  v2 = [(NSMutableDictionary *)self->_settings objectForKey:@"bedtimeHour"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (void)setBedtimeHour:(int64_t)a3
{
  settings = self->_settings;
  id v4 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
  [(NSMutableDictionary *)settings setObject:v4 forKey:@"bedtimeHour"];
}

- (int64_t)bedtimeMinute
{
  v2 = [(NSMutableDictionary *)self->_settings objectForKey:@"bedtimeMinute"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (void)setBedtimeMinute:(int64_t)a3
{
  settings = self->_settings;
  id v4 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
  [(NSMutableDictionary *)settings setObject:v4 forKey:@"bedtimeMinute"];
}

- (BOOL)repeats
{
  return self->_daySetting != 0;
}

- (NSArray)repeatDays
{
  repeatDays = self->_repeatDays;
  if (!repeatDays)
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:7];
    for (uint64_t i = 0; i != 7; ++i)
    {
      if ((self->_daySetting & RepeatDayMap[i]) != 0)
      {
        id v6 = [MEMORY[0x1E4F28ED0] numberWithInt:i];
        [v4 addObject:v6];
      }
    }
    unsigned int v7 = (NSArray *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v4];
    uint64_t v8 = self->_repeatDays;
    self->_repeatDays = v7;

    repeatDays = self->_repeatDays;
  }
  return repeatDays;
}

- (void)setDaySetting:(unsigned int)a3
{
  self->_unsigned int daySetting = a3;
  settings = self->_settings;
  CFUUIDRef v5 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInt:");
  [(NSMutableDictionary *)settings setObject:v5 forKey:@"daySetting"];

  repeatDays = self->_repeatDays;
  self->_repeatDays = 0;
}

- (void)setAllowsSnooze:(BOOL)a3
{
  self->_int allowsSnooze = a3;
  settings = self->_settings;
  objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(NSMutableDictionary *)settings setObject:v4 forKey:@"allowsSnooze"];
}

- (void)setSound:(id)a3 ofType:(int64_t)a4
{
  obj = (NSString *)a3;
  if ([(NSString *)obj length])
  {
    id v6 = obj;
  }
  else
  {

    id v6 = 0;
  }
  if (!v6) {
    a4 = 0;
  }
  if (v6 != self->_sound)
  {
    objc_storeStrong((id *)&self->_sound, v6);
    if (self->_sound) {
      sound = (__CFString *)self->_sound;
    }
    else {
      sound = &stru_1EEDE16C8;
    }
    [(NSMutableDictionary *)self->_settings setObject:sound forKey:@"sound"];
  }
  if (a4 != self->_soundType)
  {
    self->_soundType = a4;
    settings = self->_settings;
    unsigned int v9 = [MEMORY[0x1E4F28ED0] numberWithInt:a4];
    [(NSMutableDictionary *)settings setObject:v9 forKey:@"soundType"];
  }
  MEMORY[0x1F41817F8]();
}

- (void)setSoundVolume:(id)a3
{
  id v5 = a3;
  id v9 = v5;
  if (v5)
  {
    [v5 floatValue];
    if (v6 < 0.0 || ([v9 floatValue], v8 > 1.0))
    {
      unsigned int v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:a2, self, @"Alarm.m", 494, @"Invalid parameter not satisfying: %@", @"volumeIsValid" object file lineNumber description];
    }
    [(NSMutableDictionary *)self->_settings setObject:v9 forKey:@"soundVolume"];
  }
  else
  {
    [(NSMutableDictionary *)self->_settings removeObjectForKey:@"soundVolume"];
  }
}

- (NSNumber)soundVolume
{
  return (NSNumber *)[(NSMutableDictionary *)self->_settings objectForKeyedSubscript:@"soundVolume"];
}

- (NSString)vibrationID
{
  vibrationID = self->_vibrationID;
  if (vibrationID)
  {
    int64_t v3 = vibrationID;
  }
  else
  {
    id v4 = [MEMORY[0x1E4FAF5F8] sharedVibrationManager];
    int64_t v3 = [v4 defaultVibrationIdentifierForAlertType:13];
  }
  return v3;
}

- (void)setVibrationID:(id)a3
{
  obj = (NSString *)a3;
  id v4 = [MEMORY[0x1E4FAF5F8] sharedVibrationManager];
  if ([v4 vibrationWithIdentifierIsValid:obj])
  {
    id v5 = obj;
    if (obj) {
      goto LABEL_6;
    }
  }
  else
  {
  }
  id v5 = [v4 defaultVibrationIdentifierForAlertType:13];
LABEL_6:
  obja = v5;
  if (v5 != self->_vibrationID)
  {
    objc_storeStrong((id *)&self->_vibrationID, v5);
    [(NSMutableDictionary *)self->_settings setObject:self->_vibrationID forKey:@"vibe"];
  }
}

- (NSString)uiTitle
{
  title = self->_title;
  if (title)
  {
    int64_t v3 = title;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    int64_t v3 = [v4 localizedStringForKey:@"ALARM_DEFAULT_TITLE" value:&stru_1EEDE16C8 table:0];
  }
  return v3;
}

- (void)setTitle:(id)a3
{
  unsigned int v7 = (NSString *)a3;
  if ([(NSString *)v7 length])
  {
    id v4 = v7;
  }
  else
  {

    id v4 = 0;
  }
  p_title = &self->_title;
  if (v4 != self->_title)
  {
    float v8 = v4;
    objc_storeStrong((id *)p_title, v4);
    if (self->_title) {
      title = (__CFString *)self->_title;
    }
    else {
      title = &stru_1EEDE16C8;
    }
    p_title = (NSString **)[(NSMutableDictionary *)self->_settings setObject:title forKey:@"title"];
    id v4 = v8;
  }
  MEMORY[0x1F41817F8](p_title, v4);
}

- (id)debugDescription
{
  int64_t v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)Alarm;
  id v4 = [(Alarm *)&v7 description];
  id v5 = [v3 stringWithFormat:@"%@ %d:%02d 0x%04X \"%@\" %@ <%@ #%i> %@", v4, self->_hour, self->_minute, self->_daySetting, self->_title, self->_sound, self->_lastModified, self->_revision, self->_alarmID];

  return v5;
}

- (id)description
{
  return (id)[(NSMutableDictionary *)self->_settings description];
}

- (Alarm)editingProxy
{
  return self->_editingProxy;
}

- (void)setAlarmID:(id)a3
{
}

- (void)setAlarmIDURL:(id)a3
{
}

- (BOOL)isSnoozed
{
  return self->_snoozed;
}

- (BOOL)isSleepAlarm
{
  return self->_isSleepAlarm;
}

- (unsigned)hour
{
  return self->_hour;
}

- (unsigned)minute
{
  return self->_minute;
}

- (unsigned)daySetting
{
  return self->_daySetting;
}

- (BOOL)allowsSnooze
{
  return self->_allowsSnooze;
}

- (int64_t)soundType
{
  return self->_soundType;
}

- (NSString)sound
{
  return self->_sound;
}

- (NSString)title
{
  return self->_title;
}

- (NSDate)lastModified
{
  return self->_lastModified;
}

- (unsigned)revision
{
  return self->_revision;
}

- (AlarmDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AlarmDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)forceActiveForMigration
{
  return self->_forceActiveForMigration;
}

- (void)setForceActiveForMigration:(BOOL)a3
{
  self->_forceActiveForMigration = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_sound, 0);
  objc_storeStrong((id *)&self->_alarmIDURL, 0);
  objc_storeStrong((id *)&self->_alarmID, 0);
  objc_storeStrong((id *)&self->_vibrationID, 0);
  objc_storeStrong((id *)&self->_repeatDays, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_editingProxy, 0);
  objc_storeStrong((id *)&self->_lastModified, 0);
}

@end