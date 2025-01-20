@interface MTTimer
+ (BOOL)isActiveTimer:(id)a3;
+ (BOOL)stateChangeIsAllowableFromState:(unint64_t)a3 toState:(unint64_t)a4;
+ (BOOL)supportsSecureCoding;
+ (id)_timerTimeForState:(unint64_t)a3 remainingTime:(double)a4 currentDateProvider:(id)a5;
+ (id)currentTimerFromTimers:(id)a3;
+ (id)descriptionForState:(unint64_t)a3;
+ (id)firstActiveTimerFromTimers:(id)a3;
+ (id)propertiesAffectingSessions;
- (BOOL)_isEqualToTimer:(id)a3 checkLastModified:(BOOL)a4;
- (BOOL)hasDefaultTitle;
- (BOOL)isCurrentTimer;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualIgnoringLastModifiedDate:(id)a3;
- (BOOL)isEqualToTimer:(id)a3;
- (BOOL)isFiring;
- (BOOL)shouldBeScheduled;
- (MTSound)sound;
- (MTTimer)initWithIdentifier:(id)a3;
- (MTTimer)initWithState:(unint64_t)a3 duration:(double)a4;
- (MTTimer)initWithState:(unint64_t)a3 duration:(double)a4 currentDateProvider:(id)a5;
- (MTTimerTime)fireTime;
- (NSDate)dismissedDate;
- (NSDate)fireDate;
- (NSDate)firedDate;
- (NSDate)lastModifiedDate;
- (NSDictionary)siriContext;
- (NSDictionary)timerContext;
- (NSString)description;
- (NSString)displayTitle;
- (NSString)timerIDString;
- (NSString)title;
- (NSURL)timerURL;
- (NSUUID)timerID;
- (double)duration;
- (double)remainingTime;
- (id)_initCommon;
- (id)currentDateProvider;
- (id)initFromDeserializer:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)nextTrigger;
- (id)nextTriggerAfterDate:(id)a3;
- (id)timerByRestarting;
- (id)timerByUpdatingWithState:(unint64_t)a3;
- (id)upcomingTriggersAfterDate:(id)a3;
- (int64_t)compare:(id)a3;
- (int64_t)type;
- (unint64_t)hash;
- (unint64_t)state;
- (void)_copyStateOntoTimer:(id)a3;
- (void)_setDuration:(double)a3;
- (void)serializeWithSerializer:(id)a3;
- (void)setCurrentDateProvider:(id)a3;
- (void)setDismissedDate:(id)a3;
- (void)setDuration:(double)a3;
- (void)setFireTime:(id)a3;
- (void)setFiredDate:(id)a3;
- (void)setLastModifiedDate:(id)a3;
- (void)setSiriContext:(id)a3;
- (void)setSound:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setTimerContext:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation MTTimer

- (id)initFromDeserializer:(id)a3
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  v4 = [a3 mtCoder];
  id v5 = [(MTTimer *)self _initCommon];
  if (!v5) {
    goto LABEL_41;
  }
  if ([v4 mtType] == 3)
  {
    [v4 decodeFloatForKey:@"MTTimerDataVersion"];
    float v7 = v6;
    if (v6 < 1.3)
    {
      uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTTimerID"];
      v9 = (void *)*((void *)v5 + 1);
      *((void *)v5 + 1) = v8;
    }
    if (v7 >= 1.4)
    {
      if (v7 < 1.5) {
        goto LABEL_18;
      }
      int v16 = 0;
    }
    else
    {
      v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTTimerSound"];
      v11 = [v10 soundVolume];

      if (v11)
      {
        v12 = [v10 toneIdentifier];
        v13 = [v10 vibrationIdentifier];
        uint64_t v14 = +[MTSound toneSoundWithIdentifier:v12 vibrationIdentifer:v13 volume:0];
        v15 = (void *)*((void *)v5 + 8);
        *((void *)v5 + 8) = v14;

        int v16 = 1;
      }
      else
      {
        int v16 = 0;
      }

      if (v7 < 1.5)
      {
        if (v11)
        {
          id v18 = *((id *)v5 + 8);
          goto LABEL_19;
        }
LABEL_18:
        id v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTTimerSound"];
LABEL_19:
        v20 = v18;
        v21 = [v18 toneIdentifier];
        uint64_t v22 = +[MTSound toneSoundWithIdentifier:v21 vibrationIdentifer:0 volume:0];
        v23 = (void *)*((void *)v5 + 8);
        *((void *)v5 + 8) = v22;

        if (v7 >= 1.6)
        {
LABEL_25:
          int v16 = 1;
          goto LABEL_26;
        }
        goto LABEL_20;
      }
    }
    if (v7 >= 1.6)
    {
LABEL_26:
      v30 = MTLogForCategory(4);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543618;
        id v70 = v5;
        __int16 v71 = 2048;
        double v72 = v7;
        _os_log_impl(&dword_19CC95000, v30, OS_LOG_TYPE_INFO, "%{public}@ read data version: %f", buf, 0x16u);
      }

      BOOL v17 = v16 != 0;
      goto LABEL_29;
    }
    if (!v16)
    {
      id v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTTimerSound"];
LABEL_21:
      v24 = v19;
      if ([v19 soundType] == 1)
      {
        uint64_t v25 = *MEMORY[0x1E4FAF638];
        v26 = [v24 soundVolume];
        uint64_t v27 = +[MTSound toneSoundWithIdentifier:v25 vibrationIdentifer:0 volume:v26];
        v28 = (void *)*((void *)v5 + 8);
        *((void *)v5 + 8) = v27;
      }
      else
      {
        id v29 = v24;
        v26 = (void *)*((void *)v5 + 8);
        *((void *)v5 + 8) = v29;
      }

      goto LABEL_25;
    }
LABEL_20:
    id v19 = *((id *)v5 + 8);
    goto LABEL_21;
  }
  BOOL v17 = 0;
LABEL_29:
  if (!*((void *)v5 + 1))
  {
    id v31 = objc_alloc(MEMORY[0x1E4F29128]);
    v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTTimerID"];
    uint64_t v33 = [v31 initWithUUIDString:v32];
    v34 = (void *)*((void *)v5 + 1);
    *((void *)v5 + 1) = v33;
  }
  v35 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTTimerState"];
  *((void *)v5 + 2) = [v35 unsignedIntegerValue];

  if (*((void *)v5 + 2) >= 4uLL)
  {
    NSLog(&cfstr_StateMustBeAVa_0.isa, *((void *)v5 + 2));
    *((void *)v5 + 2) = 0;
  }
  [v4 decodeDoubleForKey:@"MTTimerDuration"];
  *((void *)v5 + 3) = v36;
  v37 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTTimerFireTimerClass"];
  v38 = (objc_class *)objc_opt_class();
  v39 = NSStringFromClass(v38);
  int v40 = [v37 isEqualToString:v39];

  if (v40
    || (v41 = (objc_class *)objc_opt_class(),
        NSStringFromClass(v41),
        v42 = objc_claimAutoreleasedReturnValue(),
        int v43 = [v37 isEqualToString:v42],
        v42,
        v43))
  {
    uint64_t v44 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTTimerFireTime"];
    v45 = *((void *)v5 + 9);
    *((void *)v5 + 9) = v44;
  }
  else
  {
    v45 = MTLogForCategory(4);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
      -[MTTimer initFromDeserializer:]((uint64_t)v37, v45);
    }
  }

  uint64_t v46 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTTimerTitle"];
  v47 = (void *)*((void *)v5 + 7);
  *((void *)v5 + 7) = v46;

  uint64_t v48 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTTimerLastModifiedDate"];
  v49 = (void *)*((void *)v5 + 5);
  *((void *)v5 + 5) = v48;

  uint64_t v50 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTTimerFiredDate"];
  v51 = (void *)*((void *)v5 + 4);
  *((void *)v5 + 4) = v50;

  uint64_t v52 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTTimerDismissedDate"];
  v53 = (void *)*((void *)v5 + 6);
  *((void *)v5 + 6) = v52;

  if (!v17)
  {
    uint64_t v54 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTTimerSound"];
    v55 = (void *)*((void *)v5 + 8);
    *((void *)v5 + 8) = v54;
  }
  v56 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v57 = objc_opt_class();
  uint64_t v58 = objc_opt_class();
  v59 = objc_msgSend(v56, "setWithObjects:", v57, v58, objc_opt_class(), 0);
  uint64_t v60 = [v4 decodeObjectOfClasses:v59 forKey:@"MTTimerSiriContext"];
  v61 = (void *)*((void *)v5 + 10);
  *((void *)v5 + 10) = v60;

  v62 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v63 = objc_opt_class();
  uint64_t v64 = objc_opt_class();
  v65 = objc_msgSend(v62, "setWithObjects:", v63, v64, objc_opt_class(), 0);
  uint64_t v66 = [v4 decodeObjectOfClasses:v65 forKey:@"MTTimerContext"];
  v67 = (void *)*((void *)v5 + 11);
  *((void *)v5 + 11) = v66;

LABEL_41:
  return v5;
}

- (id)_initCommon
{
  v7.receiver = self;
  v7.super_class = (Class)MTTimer;
  v2 = [(MTTimer *)&v7 init];
  v3 = MTCurrentDateProvider();
  uint64_t v4 = [v3 copy];
  id currentDateProvider = v2->_currentDateProvider;
  v2->_id currentDateProvider = (id)v4;

  return v2;
}

- (BOOL)isCurrentTimer
{
  v2 = [(MTTimer *)self title];
  char v3 = [v2 isEqualToString:@"CURRENT_TIMER"];

  return v3;
}

- (void)serializeWithSerializer:(id)a3
{
  id v18 = [a3 mtCoder];
  if ([v18 mtType] == 2)
  {
    LODWORD(v4) = 1070386381;
    [v18 encodeFloat:@"MTTimerDataVersion" forKey:v4];
  }
  id v5 = [(MTTimer *)self timerIDString];
  [v18 encodeObject:v5 forKey:@"MTTimerID"];

  float v6 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[MTTimer state](self, "state"));
  [v18 encodeObject:v6 forKey:@"MTTimerState"];

  [(MTTimer *)self duration];
  objc_msgSend(v18, "encodeDouble:forKey:", @"MTTimerDuration");
  objc_super v7 = [(MTTimer *)self fireTime];
  uint64_t v8 = (objc_class *)objc_opt_class();
  v9 = NSStringFromClass(v8);
  [v18 encodeObject:v9 forKey:@"MTTimerFireTimerClass"];

  v10 = [(MTTimer *)self fireTime];
  [v18 encodeObject:v10 forKey:@"MTTimerFireTime"];

  v11 = [(MTTimer *)self title];
  [v18 encodeObject:v11 forKey:@"MTTimerTitle"];

  v12 = [(MTTimer *)self lastModifiedDate];
  [v18 encodeObject:v12 forKey:@"MTTimerLastModifiedDate"];

  v13 = [(MTTimer *)self firedDate];
  [v18 encodeObject:v13 forKey:@"MTTimerFiredDate"];

  uint64_t v14 = [(MTTimer *)self dismissedDate];
  [v18 encodeObject:v14 forKey:@"MTTimerDismissedDate"];

  v15 = [(MTTimer *)self sound];
  [v18 encodeObject:v15 forKey:@"MTTimerSound"];

  int v16 = [(MTTimer *)self siriContext];
  [v18 encodeObject:v16 forKey:@"MTTimerSiriContext"];

  BOOL v17 = [(MTTimer *)self timerContext];
  [v18 encodeObject:v17 forKey:@"MTTimerContext"];
}

- (MTTimerTime)fireTime
{
  return self->_fireTime;
}

- (NSString)timerIDString
{
  v2 = [(MTTimer *)self timerID];
  char v3 = [v2 UUIDString];

  return (NSString *)v3;
}

- (NSDate)lastModifiedDate
{
  return self->_lastModifiedDate;
}

- (NSString)description
{
  int v16 = NSString;
  uint64_t v15 = objc_opt_class();
  char v3 = [(MTTimer *)self timerID];
  double v4 = [(MTTimer *)self title];
  id v5 = +[MTTimer descriptionForState:[(MTTimer *)self state]];
  [(MTTimer *)self duration];
  uint64_t v7 = (int)v6;
  uint64_t v8 = [(MTTimer *)self firedDate];
  v9 = [(MTTimer *)self dismissedDate];
  v10 = [(MTTimer *)self sound];
  v11 = [(MTTimer *)self siriContext];
  v12 = [(MTTimer *)self timerContext];
  v13 = [v16 stringWithFormat:@"<%@:%p TimerID: %@, Title: %@, state:%@, duration:%d, firedDate: %@, dismissedDate: %@, sound: %@, siriContext: %@>, timerContext: %@>", v15, self, v3, v4, v5, v7, v8, v9, v10, v11, v12];

  return (NSString *)v13;
}

- (unint64_t)state
{
  return self->_state;
}

- (NSString)title
{
  return self->_title;
}

- (NSUUID)timerID
{
  return self->_timerID;
}

- (MTSound)sound
{
  return self->_sound;
}

- (NSDictionary)siriContext
{
  return self->_siriContext;
}

- (NSDate)firedDate
{
  return self->_firedDate;
}

- (double)duration
{
  return self->_duration;
}

- (NSDate)dismissedDate
{
  return self->_dismissedDate;
}

+ (id)descriptionForState:(unint64_t)a3
{
  if (a3 > 3) {
    return @"Invalid State";
  }
  else {
    return off_1E5918150[a3];
  }
}

uint64_t __34__MTTimer_currentTimerFromTimers___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isCurrentTimer];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)currentTimerFromTimers:(id)a3
{
  id v3 = a3;
  double v4 = objc_msgSend(v3, "na_firstObjectPassingTest:", &__block_literal_global_48);
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [v3 firstObject];
  }
  uint64_t v7 = v6;

  return v7;
}

- (BOOL)shouldBeScheduled
{
  return [(MTTimer *)self state] == 3;
}

- (id)upcomingTriggersAfterDate:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(MTTimer *)self nextTriggerAfterDate:a3];
  double v4 = (void *)v3;
  if (v3)
  {
    v7[0] = v3;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  }
  else
  {
    id v5 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v5;
}

+ (id)propertiesAffectingSessions
{
  if (propertiesAffectingSessions_onceToken != -1) {
    dispatch_once(&propertiesAffectingSessions_onceToken, &__block_literal_global_17);
  }
  v2 = (void *)propertiesAffectingSessions_propertiesAffectingSessions;
  return v2;
}

void __50__MTTimer_Properties__propertiesAffectingSessions__block_invoke()
{
  v4[4] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = @"MTTimerState";
  v4[1] = @"MTTimerFireTimerClass";
  v4[2] = @"MTTimerFireTime";
  v4[3] = @"MTTimerTitle";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:4];
  uint64_t v2 = [v0 setWithArray:v1];
  uint64_t v3 = (void *)propertiesAffectingSessions_propertiesAffectingSessions;
  propertiesAffectingSessions_propertiesAffectingSessions = v2;
}

- (MTTimer)initWithState:(unint64_t)a3 duration:(double)a4
{
  uint64_t v7 = MTCurrentDateProvider();
  uint64_t v8 = [(MTTimer *)self initWithState:a3 duration:v7 currentDateProvider:a4];

  return v8;
}

- (MTTimer)initWithState:(unint64_t)a3 duration:(double)a4 currentDateProvider:(id)a5
{
  id v8 = a5;
  v19.receiver = self;
  v19.super_class = (Class)MTTimer;
  v9 = [(MTTimer *)&v19 init];
  if (v9)
  {
    uint64_t v10 = [MEMORY[0x1E4F29128] UUID];
    timerID = v9->_timerID;
    v9->_timerID = (NSUUID *)v10;

    v9->_state = a3;
    if (a3 >= 4)
    {
      NSLog(&cfstr_StateMustBeAVa.isa, a3);
      v9->_state = 0;
    }
    v9->_duration = a4;
    uint64_t v12 = [v8 copy];
    id currentDateProvider = v9->_currentDateProvider;
    v9->_id currentDateProvider = (id)v12;

    uint64_t v14 = [(id)objc_opt_class() _timerTimeForState:a3 remainingTime:v9->_currentDateProvider currentDateProvider:a4];
    fireTime = v9->_fireTime;
    v9->_fireTime = (MTTimerTime *)v14;

    uint64_t v16 = +[MTSound defaultSoundForCategory:1];
    sound = v9->_sound;
    v9->_sound = (MTSound *)v16;
  }
  return v9;
}

- (MTTimer)initWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(MTTimer *)self _initCommon];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    timerID = v5->_timerID;
    v5->_timerID = (NSUUID *)v6;
  }
  return v5;
}

+ (id)firstActiveTimerFromTimers:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(a1, "isActiveTimer:", v9, (void)v12))
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

+ (BOOL)isActiveTimer:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 state] == 3 || objc_msgSend(v3, "state") == 2;

  return v4;
}

- (NSURL)timerURL
{
  uint64_t v2 = [(MTTimer *)self timerID];
  id v3 = [v2 UUIDString];
  BOOL v4 = [@"x-apple-clock:timer?id=" stringByAppendingString:v3];

  uint64_t v5 = [MEMORY[0x1E4F1CB10] URLWithString:v4];

  return (NSURL *)v5;
}

- (double)remainingTime
{
  uint64_t v2 = [(MTTimer *)self fireTime];
  [v2 remainingTime];
  double v4 = v3;

  return v4;
}

- (NSDate)fireDate
{
  if ([(MTTimer *)self state] == 3)
  {
    double v3 = (*((void (**)(void))self->_currentDateProvider + 2))();
    [(MTTimer *)self remainingTime];
    double v4 = objc_msgSend(v3, "dateByAddingTimeInterval:");
  }
  else
  {
    double v4 = 0;
  }
  return (NSDate *)v4;
}

- (NSString)displayTitle
{
  if ([(MTTimer *)self hasDefaultTitle])
  {
    double v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    double v4 = [v3 localizedStringForKey:@"TIMER_DEFAULT_TITLE" value:&stru_1EEDE16C8 table:@"Localizable"];
  }
  else
  {
    double v4 = [(MTTimer *)self title];
  }
  return (NSString *)v4;
}

- (BOOL)hasDefaultTitle
{
  double v3 = [(MTTimer *)self title];
  if ([v3 isEqualToString:@"CURRENT_TIMER"])
  {
    BOOL v4 = 1;
  }
  else
  {
    uint64_t v5 = [(MTTimer *)self title];
    if ([v5 length])
    {
      uint64_t v6 = [(MTTimer *)self title];
      BOOL v4 = v6 == 0;
    }
    else
    {
      BOOL v4 = 1;
    }
  }
  return v4;
}

- (id)timerByRestarting
{
  uint64_t v2 = [(MTTimer *)self timerByUpdatingWithState:1];
  double v3 = [v2 timerByUpdatingWithState:3];

  return v3;
}

- (id)timerByUpdatingWithState:(unint64_t)a3
{
  BOOL v4 = (void *)[(MTTimer *)self mutableCopy];
  [v4 setState:a3];
  return v4;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MTTimer *)self fireTime];
  uint64_t v6 = [v4 fireTime];
  int64_t v7 = [v5 compare:v6];

  if (!v7)
  {
    id v8 = [(MTTimer *)self displayTitle];
    v9 = [v4 displayTitle];
    int64_t v7 = [v8 compare:v9];

    if (!v7)
    {
      id v10 = [(MTTimer *)self timerIDString];
      v11 = [v4 timerIDString];
      int64_t v7 = [v10 compare:v11];
    }
  }

  return v7;
}

- (id)nextTrigger
{
  double v3 = (*((void (**)(void))self->_currentDateProvider + 2))();
  id v4 = [(MTTimer *)self nextTriggerAfterDate:v3];

  return v4;
}

- (id)nextTriggerAfterDate:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(MTTimer *)self lastModifiedDate];
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    int64_t v7 = [(MTTimer *)self lastModifiedDate];
    int v8 = [v7 mtIsAfterDate:v4];

    if (v8)
    {
      v9 = MTLogForCategory(4);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = [(MTTimer *)self timerID];
        v11 = [(MTTimer *)self lastModifiedDate];
        *(_DWORD *)buf = 138543874;
        int v43 = v10;
        __int16 v44 = 2114;
        id v45 = v4;
        __int16 v46 = 2114;
        v47 = v11;
        _os_log_impl(&dword_19CC95000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ modified after %{public}@ (%{public}@)", buf, 0x20u);
      }
      uint64_t v12 = [(MTTimer *)self lastModifiedDate];

      id v4 = (id)v12;
    }
  }
  uint64_t v13 = [(MTTimer *)self firedDate];
  if (v13)
  {
    long long v14 = (void *)v13;
    long long v15 = [(MTTimer *)self firedDate];
    int v16 = [v15 mtIsAfterDate:v4];

    if (v16)
    {
      uint64_t v17 = MTLogForCategory(4);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        id v18 = [(MTTimer *)self timerID];
        objc_super v19 = [(MTTimer *)self firedDate];
        *(_DWORD *)buf = 138543874;
        int v43 = v18;
        __int16 v44 = 2114;
        id v45 = v4;
        __int16 v46 = 2114;
        v47 = v19;
        _os_log_impl(&dword_19CC95000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ already fired after %{public}@ (%{public}@)", buf, 0x20u);
      }
      uint64_t v20 = [(MTTimer *)self firedDate];

      id v4 = (id)v20;
    }
  }
  uint64_t v21 = [(MTTimer *)self dismissedDate];
  if (v21)
  {
    uint64_t v22 = (void *)v21;
    v23 = [(MTTimer *)self dismissedDate];
    int v24 = [v23 mtIsAfterDate:v4];

    if (v24)
    {
      uint64_t v25 = MTLogForCategory(4);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v26 = [(MTTimer *)self timerID];
        uint64_t v27 = [(MTTimer *)self dismissedDate];
        *(_DWORD *)buf = 138543874;
        int v43 = v26;
        __int16 v44 = 2114;
        id v45 = v4;
        __int16 v46 = 2114;
        v47 = v27;
        _os_log_impl(&dword_19CC95000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ already dismissed after %{public}@ (%{public}@)", buf, 0x20u);
      }
      uint64_t v28 = [(MTTimer *)self dismissedDate];

      id v4 = (id)v28;
    }
  }
  id v29 = MTLogForCategory(4);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
    [(MTTimer *)self nextTriggerAfterDate:v29];
  }

  if ([(MTTimer *)self state] == 3)
  {
    uint64_t v30 = objc_opt_class();
    id v31 = [(MTTimer *)self fireTime];
    if (v31)
    {
      if (objc_opt_isKindOfClass()) {
        v32 = v31;
      }
      else {
        v32 = 0;
      }
      id v33 = v32;
      if (!v33)
      {
        v34 = [MEMORY[0x1E4F28B00] currentHandler];
        v35 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
        [v34 handleFailureInFunction:v35, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v30, objc_opt_class() file lineNumber description];
      }
    }
    else
    {
      id v33 = 0;
    }

    v37 = [v33 date];
    if ([v37 mtIsAfterOrSameAsDate:v4])
    {
      uint64_t v36 = +[MTTrigger triggerWithDate:v37 triggerType:0];
    }
    else
    {
      v38 = MTLogForCategory(4);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        int v43 = v37;
        __int16 v44 = 2114;
        id v45 = v4;
        _os_log_impl(&dword_19CC95000, v38, OS_LOG_TYPE_DEFAULT, "Next trigger date %{public}@ is prior to requested date %{public}@", buf, 0x16u);
      }

      uint64_t v36 = 0;
    }
  }
  else
  {
    uint64_t v36 = 0;
  }
  v39 = MTLogForCategory(4);
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    int v40 = [(MTTimer *)self timerID];
    *(_DWORD *)buf = 138543618;
    int v43 = v40;
    __int16 v44 = 2114;
    id v45 = v36;
    _os_log_impl(&dword_19CC95000, v39, OS_LOG_TYPE_DEFAULT, "%{public}@ has next trigger %{public}@", buf, 0x16u);
  }
  return v36;
}

- (BOOL)isFiring
{
  if ([(MTTimer *)self state] == 3) {
    return 0;
  }
  id v4 = [(MTTimer *)self firedDate];
  if (v4)
  {
    uint64_t v5 = [(MTTimer *)self dismissedDate];
    if (v5)
    {
      uint64_t v6 = [(MTTimer *)self firedDate];
      int64_t v7 = [(MTTimer *)self dismissedDate];
      char v3 = [v6 mtIsAfterDate:v7];
    }
    else
    {
      char v3 = 1;
    }
  }
  else
  {
    char v3 = 0;
  }

  return v3;
}

+ (BOOL)stateChangeIsAllowableFromState:(unint64_t)a3 toState:(unint64_t)a4
{
  if (a3 == 2 && a4 == 2) {
    return 1;
  }
  return a3 == 3 || a4 != 2;
}

- (void)setState:(unint64_t)a3
{
  if (a3 < 4)
  {
    if (self->_state != a3)
    {
      uint64_t v5 = [(MTTimer *)self fireTime];
      [v5 remainingTime];
      double v7 = v6;

      if (a3 == 1)
      {
        [(MTTimer *)self duration];
        double v7 = v8;
      }
      v9 = [(id)objc_opt_class() _timerTimeForState:a3 remainingTime:self->_currentDateProvider currentDateProvider:v7];
      [(MTTimer *)self setFireTime:v9];

      self->_state = a3;
    }
  }
  else
  {
    NSLog(&cfstr_StateMustBeAVa.isa, a2, a3);
  }
}

- (void)setSound:(id)a3
{
  id v4 = (MTSound *)a3;
  if (self->_sound != v4)
  {
    if (!v4)
    {
      id v4 = +[MTSound defaultSoundForCategory:1];
    }
    double v7 = v4;
    uint64_t v5 = (MTSound *)[(MTSound *)v4 copy];
    sound = self->_sound;
    self->_sound = v5;

    id v4 = v7;
  }
}

- (void)setDuration:(double)a3
{
  if ([(MTTimer *)self state] != 1) {
    NSLog(&cfstr_TimerDurationC.isa);
  }
  if ([(MTTimer *)self state] == 1)
  {
    if (a3 > 0.0)
    {
      [(MTTimer *)self _setDuration:a3];
    }
    else
    {
      NSLog(&cfstr_TimerDurationM.isa);
    }
  }
}

- (void)_setDuration:(double)a3
{
  if (self->_duration != a3)
  {
    self->_duration = a3;
    if ([(MTTimer *)self state] == 1)
    {
      id v4 = [(id)objc_opt_class() _timerTimeForState:1 remainingTime:self->_currentDateProvider currentDateProvider:self->_duration];
      [(MTTimer *)self setFireTime:v4];
    }
  }
}

- (unint64_t)hash
{
  uint64_t v2 = [(MTTimer *)self timerID];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    double v6 = v5;
  }
  else {
    double v6 = 0;
  }
  id v7 = v6;

  if (v7) {
    BOOL v8 = [(MTTimer *)self isEqualToTimer:v7];
  }
  else {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)isEqualIgnoringLastModifiedDate:(id)a3
{
  return [(MTTimer *)self _isEqualToTimer:a3 checkLastModified:0];
}

- (BOOL)isEqualToTimer:(id)a3
{
  return [(MTTimer *)self _isEqualToTimer:a3 checkLastModified:1];
}

- (BOOL)_isEqualToTimer:(id)a3 checkLastModified:(BOOL)a4
{
  BOOL v5 = a4;
  id v7 = a3;
  BOOL v8 = [(MTTimer *)self timerID];
  v9 = [v7 timerID];
  if ([v8 isEqual:v9])
  {
    unint64_t v10 = [(MTTimer *)self state];
    if (v10 == [v7 state])
    {
      [(MTTimer *)self duration];
      double v12 = round(v11);
      [v7 duration];
      if (v12 == round(v13))
      {
        long long v14 = [(MTTimer *)self fireTime];
        long long v15 = [v7 fireTime];
        if (v14 != v15)
        {
          int v16 = [(MTTimer *)self fireTime];
          id v4 = [v7 fireTime];
          double v72 = v16;
          if (![v16 isEqual:v4])
          {
            char v17 = 0;
            goto LABEL_55;
          }
        }
        objc_super v19 = [(MTTimer *)self title];
        uint64_t v71 = [v7 title];
        if (v19 != (void *)v71)
        {
          uint64_t v20 = [(MTTimer *)self title];
          v69 = [v7 title];
          id v70 = v20;
          if (![v20 isEqual:v69])
          {
            char v17 = 0;
            uint64_t v21 = (void *)v71;
            goto LABEL_53;
          }
        }
        v68 = v15;
        uint64_t v22 = v14;
        v23 = v4;
        if (v5)
        {
          uint64_t v24 = [v7 lastModifiedDate];
          uint64_t v25 = [(MTTimer *)self lastModifiedDate];
          v59 = (void *)v24;
          if (v24 == v25)
          {
            int v65 = 0;
            uint64_t v58 = (void *)v24;
          }
          else
          {
            uint64_t v58 = (void *)v25;
            v26 = [v7 lastModifiedDate];
            uint64_t v27 = [(MTTimer *)self lastModifiedDate];
            uint64_t v57 = v26;
            if (([v26 isEqual:v27] & 1) == 0)
            {

              char v17 = 0;
              uint64_t v21 = (void *)v71;
              id v4 = v23;
              long long v14 = v22;
              long long v15 = v68;
              if (v19 == (void *)v71)
              {
LABEL_54:

                if (v14 == v15)
                {
LABEL_56:

                  goto LABEL_8;
                }
LABEL_55:

                goto LABEL_56;
              }
LABEL_53:

              goto LABEL_54;
            }
            v51 = v27;
            int v65 = 1;
          }
        }
        else
        {
          int v65 = 0;
        }
        uint64_t v28 = [(MTTimer *)self firedDate];
        uint64_t v66 = [v7 firedDate];
        v67 = v23;
        if (v28 == v66)
        {
          uint64_t v60 = v28;
        }
        else
        {
          id v29 = [(MTTimer *)self firedDate];
          v62 = [v7 firedDate];
          uint64_t v63 = v29;
          if (!objc_msgSend(v29, "isEqual:"))
          {
            char v17 = 0;
            long long v14 = v22;
            long long v15 = v68;
            id v33 = v66;
            goto LABEL_46;
          }
          uint64_t v60 = v28;
        }
        long long v14 = v22;
        long long v15 = v68;
        uint64_t v30 = [(MTTimer *)self dismissedDate];
        uint64_t v61 = [v7 dismissedDate];
        uint64_t v64 = (void *)v30;
        if (v30 != v61)
        {
          id v31 = [(MTTimer *)self dismissedDate];
          v53 = [v7 dismissedDate];
          uint64_t v54 = v31;
          if (![v31 isEqual:v53])
          {
            char v17 = 0;
            v32 = (void *)v61;
LABEL_44:

LABEL_45:
            uint64_t v28 = v60;
            id v33 = v66;
            if (v60 == v66)
            {

              if (v65)
              {
LABEL_47:

                id v4 = v67;
                if (!v5)
                {
LABEL_52:
                  uint64_t v21 = (void *)v71;
                  if (v19 == (void *)v71) {
                    goto LABEL_54;
                  }
                  goto LABEL_53;
                }
LABEL_51:

                goto LABEL_52;
              }
LABEL_50:
              id v4 = v67;
              if (!v5) {
                goto LABEL_52;
              }
              goto LABEL_51;
            }
LABEL_46:

            if (v65) {
              goto LABEL_47;
            }
            goto LABEL_50;
          }
        }
        v34 = [(MTTimer *)self sound];
        uint64_t v55 = [v7 sound];
        v56 = v34;
        if (v34 != (void *)v55)
        {
          v35 = [(MTTimer *)self sound];
          uint64_t v48 = [v7 sound];
          v49 = v35;
          if (!objc_msgSend(v35, "isEqual:"))
          {
            char v17 = 0;
            uint64_t v36 = (void *)v55;
LABEL_42:

LABEL_43:
            v32 = (void *)v61;
            if (v64 == (void *)v61) {
              goto LABEL_45;
            }
            goto LABEL_44;
          }
        }
        uint64_t v37 = [(MTTimer *)self siriContext];
        uint64_t v50 = [v7 siriContext];
        uint64_t v52 = (void *)v37;
        if (v37 == v50)
        {
          id v45 = v19;
        }
        else
        {
          v38 = [(MTTimer *)self siriContext];
          __int16 v46 = [v7 siriContext];
          v47 = v38;
          if (!objc_msgSend(v38, "isEqual:"))
          {
            char v17 = 0;
            int v43 = (void *)v50;
            goto LABEL_40;
          }
          id v45 = v19;
        }
        v39 = [(MTTimer *)self timerContext];
        uint64_t v40 = [v7 timerContext];
        if (v39 == (void *)v40)
        {

          char v17 = 1;
        }
        else
        {
          v41 = (void *)v40;
          __int16 v44 = [(MTTimer *)self timerContext];
          v42 = [v7 timerContext];
          char v17 = [v44 isEqual:v42];
        }
        int v43 = (void *)v50;
        objc_super v19 = v45;
        if (v52 == (void *)v50)
        {
LABEL_41:

          uint64_t v36 = (void *)v55;
          v34 = v56;
          if (v56 == (void *)v55) {
            goto LABEL_43;
          }
          goto LABEL_42;
        }
LABEL_40:

        goto LABEL_41;
      }
    }
  }
  char v17 = 0;
LABEL_8:

  return v17;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[MTMutableTimer allocWithZone:a3];
  BOOL v5 = [(MTTimer *)self timerID];
  double v6 = [(MTTimer *)v4 initWithIdentifier:v5];

  [(MTTimer *)self _copyStateOntoTimer:v6];
  return v6;
}

- (void)_copyStateOntoTimer:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(MTTimer *)self currentDateProvider];
  [v4 setCurrentDateProvider:v5];

  double v6 = [(MTTimer *)self fireTime];
  [v4 setFireTime:v6];

  [(MTTimer *)self duration];
  objc_msgSend(v4, "_setDuration:");
  objc_msgSend(v4, "setState:", -[MTTimer state](self, "state"));
  id v7 = [(MTTimer *)self title];
  [v4 setTitle:v7];

  BOOL v8 = [(MTTimer *)self lastModifiedDate];
  [v4 setLastModifiedDate:v8];

  v9 = [(MTTimer *)self firedDate];
  [v4 setFiredDate:v9];

  unint64_t v10 = [(MTTimer *)self dismissedDate];
  [v4 setDismissedDate:v10];

  double v11 = [(MTTimer *)self sound];
  [v4 setSound:v11];

  double v12 = [(MTTimer *)self siriContext];
  [v4 setSiriContext:v12];

  id v13 = [(MTTimer *)self timerContext];
  [v4 setTimerContext:v13];
}

+ (id)_timerTimeForState:(unint64_t)a3 remainingTime:(double)a4 currentDateProvider:(id)a5
{
  id v7 = (void (**)(void))a5;
  switch(a3)
  {
    case 0uLL:
    case 4uLL:
      NSLog(&cfstr_UnexpectedTime_0.isa, a3);
      a3 = 0;
      break;
    case 1uLL:
    case 2uLL:
      a3 = [[MTTimerTimeInterval alloc] initWithTimeInterval:a4];
      break;
    case 3uLL:
      BOOL v8 = [MTTimerDate alloc];
      v9 = (void *)MEMORY[0x1E4F1C9C8];
      unint64_t v10 = v7[2](v7);
      double v11 = [v9 dateWithTimeInterval:v10 sinceDate:a4];
      a3 = [(MTTimerDate *)v8 initWithDate:v11 currentDateProvider:v7];

      break;
    default:
      break;
  }

  return (id)a3;
}

- (void)setFiredDate:(id)a3
{
}

- (void)setLastModifiedDate:(id)a3
{
}

- (void)setDismissedDate:(id)a3
{
}

- (void)setTitle:(id)a3
{
}

- (void)setFireTime:(id)a3
{
}

- (void)setSiriContext:(id)a3
{
}

- (NSDictionary)timerContext
{
  return self->_timerContext;
}

- (void)setTimerContext:(id)a3
{
}

- (id)currentDateProvider
{
  return self->_currentDateProvider;
}

- (void)setCurrentDateProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_currentDateProvider, 0);
  objc_storeStrong((id *)&self->_timerContext, 0);
  objc_storeStrong((id *)&self->_siriContext, 0);
  objc_storeStrong((id *)&self->_fireTime, 0);
  objc_storeStrong((id *)&self->_sound, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_dismissedDate, 0);
  objc_storeStrong((id *)&self->_lastModifiedDate, 0);
  objc_storeStrong((id *)&self->_firedDate, 0);
  objc_storeStrong((id *)&self->_timerID, 0);
}

- (int64_t)type
{
  uint64_t v2 = [(MTTimer *)self siriContext];
  int64_t v3 = MTIntentsTimerTypeFromSiriContext(v2);

  return v3;
}

- (void)nextTriggerAfterDate:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [a1 timerID];
  int v6 = 138543618;
  id v7 = v5;
  __int16 v8 = 2114;
  uint64_t v9 = a2;
  _os_log_debug_impl(&dword_19CC95000, a3, OS_LOG_TYPE_DEBUG, "Computing next fire date for %{public}@ after %{public}@", (uint8_t *)&v6, 0x16u);
}

- (void)initFromDeserializer:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19CC95000, a2, OS_LOG_TYPE_ERROR, "Illegal fire time class %{public}@", (uint8_t *)&v2, 0xCu);
}

@end