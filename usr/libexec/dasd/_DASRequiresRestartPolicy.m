@interface _DASRequiresRestartPolicy
+ (id)policyInstance;
- (BOOL)appliesToActivity:(id)a3;
- (BOOL)cacheSleepPeriod:(id)a3 end:(id)a4 period1:(id *)a5 period2:(id *)a6;
- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4;
- (NSArray)triggers;
- (NSDate)lastCacheDate;
- (NSString)policyDescription;
- (NSString)policyName;
- (_CDContextualKeyPath)deviceAssertionsHeld;
- (_CDContextualKeyPath)inUseStatus;
- (_CDContextualKeyPath)nextWakeRequest;
- (_CDDateRange)deviceRestartPeriod1;
- (_CDDateRange)deviceRestartPeriod2;
- (_DASRequiresRestartPolicy)init;
- (double)minDurationAfterLastUserInteraction;
- (double)minDurationBeforeNextScheduledWake;
- (double)weightForActivity:(id)a3;
- (id)blockReasons:(id)a3;
- (id)defaultDeviceRestartDateRangeWithDate:(id)a3;
- (id)getRebootForecastPeriod;
- (id)initializeTriggers;
- (id)responseForActivity:(id)a3 withState:(id)a4;
- (void)getDeviceRestartForecast;
- (void)reportAnalyticsWithStartDate:(id)a3 isDefaultTime:(BOOL)a4;
- (void)setDeviceAssertionsHeld:(id)a3;
- (void)setDeviceRestartPeriod1:(id)a3;
- (void)setDeviceRestartPeriod2:(id)a3;
- (void)setInUseStatus:(id)a3;
- (void)setLastCacheDate:(id)a3;
- (void)setMinDurationAfterLastUserInteraction:(double)a3;
- (void)setMinDurationBeforeNextScheduledWake:(double)a3;
- (void)setNextWakeRequest:(id)a3;
- (void)setPolicyDescription:(id)a3;
- (void)setPolicyName:(id)a3;
- (void)setTriggers:(id)a3;
@end

@implementation _DASRequiresRestartPolicy

- (BOOL)appliesToActivity:(id)a3
{
  id v3 = a3;
  if ([v3 triggersRestart]) {
    unsigned __int8 v4 = 1;
  }
  else {
    unsigned __int8 v4 = [v3 requiresSignificantUserInactivity];
  }

  return v4;
}

- (id)initializeTriggers
{
  v13 = +[_CDContextualPredicate predicateForChangeAtKeyPath:self->_deviceAssertionsHeld];
  v11 = +[_CDContextualPredicate predicateForChangeAtKeyPath:self->_inUseStatus];
  v12 = +[_CDContextualPredicate predicateForChangeAtKeyPath:self->_nextWakeRequest];
  id v3 = +[_CDContextQueries keyPathForBacklightOnStatus];
  v10 = +[_CDContextualPredicate predicateForChangeAtKeyPath:v3];

  v20[0] = @"identifier";
  v20[1] = @"predicate";
  v21[0] = @"com.apple.duetactivityscheduler.restartpolicy.assertionsheld";
  v21[1] = v13;
  v20[2] = @"deviceSet";
  v20[3] = @"mustWake";
  v21[2] = &off_100186E68;
  v21[3] = &__kCFBooleanTrue;
  unsigned __int8 v4 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:4];
  v22[0] = v4;
  v18[0] = @"identifier";
  v18[1] = @"predicate";
  v19[0] = @"com.apple.duetactivityscheduler.restartpolicy.inusestatus";
  v19[1] = v11;
  v18[2] = @"deviceSet";
  v18[3] = @"mustWake";
  v19[2] = &off_100186E68;
  v19[3] = &__kCFBooleanTrue;
  v5 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:4];
  v22[1] = v5;
  v16[0] = @"identifier";
  v16[1] = @"predicate";
  v17[0] = @"com.apple.das.restartpolicy.backlightOn";
  v17[1] = v10;
  v16[2] = @"deviceSet";
  v16[3] = @"mustWake";
  v17[2] = &off_100186E68;
  v17[3] = &__kCFBooleanFalse;
  v6 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:4];
  v22[2] = v6;
  v14[0] = @"identifier";
  v14[1] = @"predicate";
  v15[0] = @"com.apple.duetactivityscheduler.restartpolicy.wakerequest";
  v15[1] = v12;
  v14[2] = @"deviceSet";
  v14[3] = @"mustWake";
  v15[2] = &off_100186E68;
  v15[3] = &__kCFBooleanTrue;
  v7 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:4];
  v22[3] = v7;
  v8 = +[NSArray arrayWithObjects:v22 count:4];

  return v8;
}

- (_DASRequiresRestartPolicy)init
{
  v16.receiver = self;
  v16.super_class = (Class)_DASRequiresRestartPolicy;
  v2 = [(_DASRequiresRestartPolicy *)&v16 init];
  id v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)@"Restart Required Activities Policy";

    uint64_t v5 = +[_CDContextQueries keyPathForDeviceAssertionsHeldStatus];
    deviceAssertionsHeld = v3->_deviceAssertionsHeld;
    v3->_deviceAssertionsHeld = (_CDContextualKeyPath *)v5;

    uint64_t v7 = +[_CDContextQueries keyPathForInUseStatus];
    inUseStatus = v3->_inUseStatus;
    v3->_inUseStatus = (_CDContextualKeyPath *)v7;

    uint64_t v9 = +[_CDContextQueries keyPathForNextUserVisibleWakeDate];
    nextWakeRequest = v3->_nextWakeRequest;
    v3->_nextWakeRequest = (_CDContextualKeyPath *)v9;

    *(_OWORD *)&v3->_minDurationAfterLastUserInteraction = xmmword_100126C90;
    uint64_t v11 = +[NSDate distantPast];
    lastCacheDate = v3->_lastCacheDate;
    v3->_lastCacheDate = (NSDate *)v11;

    [(_DASRequiresRestartPolicy *)v3 getDeviceRestartForecast];
    uint64_t v13 = [(_DASRequiresRestartPolicy *)v3 initializeTriggers];
    triggers = v3->_triggers;
    v3->_triggers = (NSArray *)v13;
  }
  return v3;
}

+ (id)policyInstance
{
  if (qword_1001C3FE0 != -1) {
    dispatch_once(&qword_1001C3FE0, &stru_100176788);
  }
  v2 = (void *)qword_1001C3FE8;

  return v2;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToString:@"com.apple.duetactivityscheduler.restartpolicy.assertionsheld"])
  {
    deviceAssertionsHeld = self->_deviceAssertionsHeld;
  }
  else
  {
    if (![v6 isEqualToString:@"com.apple.duetactivityscheduler.restartpolicy.inusestatus"])
    {
      unsigned __int8 v10 = [v6 isEqualToString:@"com.apple.das.restartpolicy.backlightOn"];
      goto LABEL_7;
    }
    deviceAssertionsHeld = self->_inUseStatus;
  }
  uint64_t v9 = [v7 objectForKeyedSubscript:deviceAssertionsHeld];
  unsigned __int8 v10 = [v9 BOOLValue];

LABEL_7:
  return v10;
}

- (double)weightForActivity:(id)a3
{
  return 1.0;
}

- (BOOL)cacheSleepPeriod:(id)a3 end:(id)a4 period1:(id *)a5 period2:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = +[NSDate date];
  BOOL v12 = 0;
  if (v9 && v10)
  {
    if ([v9 compare:v10] == (id)-1
      && [v9 compare:v10] == (id)-1
      && [v11 compare:v10] == (id)-1)
    {
      if (*a6)
      {
        v14 = [*a6 endDate];
        id v15 = [v11 compare:v14];

        if (v15 == (id)1)
        {
          id v16 = *a6;
          *a6 = 0;
        }
      }
      if (!*a5
        || ([*a5 endDate],
            v17 = objc_claimAutoreleasedReturnValue(),
            id v18 = [v11 compare:v17],
            v17,
            v18 == (id)1))
      {
        objc_storeStrong(a5, *a6);
        id v19 = *a6;
        *a6 = 0;
      }
      if (!*a6)
      {
        v20 = +[_CDDateRange periodWithStart:v9 end:v10];
        id v21 = *a6;
        *a6 = v20;
      }
      if (!*a5)
      {
        objc_storeStrong(a5, *a6);
        id v22 = *a6;
        *a6 = 0;
      }
      v23 = +[_DASDaemonLogger defaultCategory];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        id v24 = *a5;
        int v25 = 138412290;
        id v26 = v24;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Using restart times of %@", (uint8_t *)&v25, 0xCu);
      }

      BOOL v12 = 1;
    }
    else
    {
      BOOL v12 = 0;
    }
  }

  return v12;
}

- (id)defaultDeviceRestartDateRangeWithDate:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = +[NSCalendar currentCalendar];
  uint64_t v5 = [v4 components:30 fromDate:v3];
  [v5 setHour:4];
  [v5 setMinute:0];
  [v5 setSecond:0];
  id v6 = [v4 dateFromComponents:v5];
  [v6 timeIntervalSinceDate:v3];
  double v8 = v7;

  if (v8 < 0.0)
  {
    uint64_t v9 = [v6 dateByAddingTimeInterval:86400.0];

    id v6 = (void *)v9;
  }
  id v10 = [v6 dateByAddingTimeInterval:(double)arc4random_uniform(0xE10u) + -8100.0];
  uint64_t v11 = +[_CDDateRange periodWithStart:v10 end:v6];

  return v11;
}

- (void)reportAnalyticsWithStartDate:(id)a3 isDefaultTime:(BOOL)a4
{
  id v5 = a3;
  id v4 = v5;
  AnalyticsSendEventLazy();
}

- (void)getDeviceRestartForecast
{
  id v3 = +[NSDate date];
  id v4 = [(_DASRequiresRestartPolicy *)self lastCacheDate];
  [v3 timeIntervalSinceDate:v4];
  double v6 = v5;

  if (v6 >= 14400.0)
  {
    double v7 = (void *)os_transaction_create();
    id v9 = objc_alloc_init((Class)_CDSleepForAutoSu);
    id v10 = [v9 getUnlockAndSoftwareUpdateTimes];

    if (v10)
    {
      uint64_t v11 = [v10 objectForKeyedSubscript:kCDSleepAutoSuSuStartKey];
      BOOL v12 = [v11 dateByAddingTimeInterval:(double)arc4random_uniform(0x384u)];

      uint64_t v13 = [v10 objectForKeyedSubscript:kCDSleepAutoSuExpirationTimeKey];
      [(_DASRequiresRestartPolicy *)self reportAnalyticsWithStartDate:v12 isDefaultTime:0];
      if ([(_DASRequiresRestartPolicy *)self cacheSleepPeriod:v12 end:v13 period1:&self->_deviceRestartPeriod1 period2:&self->_deviceRestartPeriod2])
      {
        [(_DASRequiresRestartPolicy *)self setLastCacheDate:v3];
      }
    }
    else
    {
      v14 = +[_DASDaemonLogger defaultCategory];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_1000F6AD0(v14);
      }

      id v15 = [(_DASRequiresRestartPolicy *)self defaultDeviceRestartDateRangeWithDate:v3];
      deviceRestartPeriod1 = self->_deviceRestartPeriod1;
      self->_deviceRestartPeriod1 = v15;

      [(_DASRequiresRestartPolicy *)self setLastCacheDate:v3];
      v17 = +[_DASDaemonLogger defaultCategory];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        id v18 = self->_deviceRestartPeriod1;
        int v19 = 138412290;
        v20 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Using restart times of %@", (uint8_t *)&v19, 0xCu);
      }

      BOOL v12 = [(_CDDateRange *)self->_deviceRestartPeriod1 startDate];
      [(_DASRequiresRestartPolicy *)self reportAnalyticsWithStartDate:v12 isDefaultTime:1];
    }
  }
}

- (id)getRebootForecastPeriod
{
  return self->_deviceRestartPeriod1;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(_DASRequiresRestartPolicy *)self getDeviceRestartForecast];
  double v8 = [[_DASPolicyResponseRationale alloc] initWithPolicyName:self->_policyName];
  id v9 = +[NSDate date];
  if ([v6 isSoftwareUpdateActivity]) {
    goto LABEL_3;
  }
  id v10 = [v6 name];
  unsigned __int8 v11 = [v10 isEqualToString:@"com.apple.dasd.dataCollectiontask.dummyAutoSU"];

  if (v11) {
    goto LABEL_3;
  }
  if ([(_CDDateRange *)self->_deviceRestartPeriod1 contains:v9])
  {
    v27 = +[_DASDaemon sharedInstance];
    v28 = [v27 allPendingRestartTasks];

    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v29 = v28;
    id v30 = [v29 countByEnumeratingWithState:&v54 objects:v58 count:16];
    if (v30)
    {
      id v31 = v30;
      uint64_t v32 = *(void *)v55;
      while (2)
      {
        for (i = 0; i != v31; i = (char *)i + 1)
        {
          if (*(void *)v55 != v32) {
            objc_enumerationMutation(v29);
          }
          if ([*(id *)(*((void *)&v54 + 1) + 8 * i) isSoftwareUpdateActivity])
          {
            v44 = +[NSPredicate predicateWithFormat:@"PendingSoftwareUpdate == 1"];
            [(_DASPolicyResponseRationale *)v8 addRationaleWithCondition:v44];

            v43 = +[_DASPolicyResponse policyResponseWithDecision:33 validityDuration:v8 rationale:(double)0x384uLL];

            goto LABEL_66;
          }
        }
        id v31 = [v29 countByEnumeratingWithState:&v54 objects:v58 count:16];
        if (v31) {
          continue;
        }
        break;
      }
    }

LABEL_3:
    BOOL v12 = [v7 objectForKeyedSubscript:self->_nextWakeRequest];
    uint64_t v13 = +[_CDContextQueries keyPathForBacklightOnStatus];
    v14 = [v7 objectForKeyedSubscript:v13];

    v53 = [v7 objectForKeyedSubscript:self->_deviceAssertionsHeld];
    id v15 = [v7 objectForKeyedSubscript:self->_inUseStatus];
    id v16 = +[_CDContextQueries keyPathForLastUseDate];
    v17 = [v7 objectForKeyedSubscript:v16];

    if (v12)
    {
      [v12 timeIntervalSinceDate:v9];
      BOOL v50 = v18 < 3600.0;
      if (v14)
      {
LABEL_5:
        unsigned int v19 = [v14 BOOLValue];
        goto LABEL_8;
      }
    }
    else
    {
      BOOL v50 = 0;
      if (v14) {
        goto LABEL_5;
      }
    }
    unsigned int v19 = 0;
LABEL_8:
    v51 = v14;
    if (v53)
    {
      unsigned int v20 = [v53 BOOLValue];
      if (v15)
      {
LABEL_10:
        unsigned int v21 = [v15 BOOLValue];
        goto LABEL_13;
      }
    }
    else
    {
      unsigned int v20 = 0;
      if (v15) {
        goto LABEL_10;
      }
    }
    unsigned int v21 = 0;
LABEL_13:
    if (v17)
    {
      [v9 timeIntervalSinceDate:v17];
      double v23 = v22;
    }
    else
    {
      double v23 = 900.0;
    }
    v52 = v9;
    if (([v6 triggersRestart] & v20) == 1)
    {
      [(_DASPolicyResponseRationale *)v8 addRationaleForCondition:@"Is any Assertion Held?" withRequiredValue:0.0 withCurrentValue:1.0];
      [(_DASPolicyResponseRationale *)v8 setResponseOptions:(unint64_t)[(_DASPolicyResponseRationale *)v8 responseOptions] | 0x80];
      uint64_t v24 = 33;
    }
    else
    {
      uint64_t v24 = 0;
    }
    unsigned __int8 v25 = [v15 unsignedLongLongValue];
    if ((v25 & 0x40) != 0) {
      unsigned int v26 = 0;
    }
    else {
      unsigned int v26 = v19;
    }
    if (v26 == 1)
    {
      [(_DASPolicyResponseRationale *)v8 addRationaleForCondition:@"Backlight On" withRequiredValue:0.0 withCurrentValue:1.0];
      [(_DASPolicyResponseRationale *)v8 setResponseOptions:(unint64_t)[(_DASPolicyResponseRationale *)v8 responseOptions] | 2];
      uint64_t v24 = 33;
    }
    if (!v21) {
      goto LABEL_54;
    }
    [(_DASPolicyResponseRationale *)v8 addRationaleForCondition:@"Is User active?" withRequiredValue:0.0 withCurrentValue:1.0];
    if (v25)
    {
      uint64_t v24 = 33;
      uint64_t v34 = 4;
    }
    else if ((v25 & 4) != 0)
    {
      uint64_t v24 = 33;
      uint64_t v34 = 8;
    }
    else if ((v25 & 8) != 0)
    {
      uint64_t v24 = 33;
      uint64_t v34 = 16;
    }
    else if ((v25 & 0x10) != 0)
    {
      uint64_t v24 = 33;
      uint64_t v34 = 32;
    }
    else if ((v25 & 0x20) != 0)
    {
      uint64_t v24 = 33;
      uint64_t v34 = 64;
    }
    else
    {
      if ((v25 & 0x40) == 0)
      {
        uint64_t v24 = 33;
LABEL_54:
        if (v50)
        {
          [v12 timeIntervalSinceDate:v52];
          [(_DASPolicyResponseRationale *)v8 addRationaleForCondition:@"Minimum seconds without any scheduled wake" withRequiredValue:3600.0 withCurrentValue:v45];
          [(_DASPolicyResponseRationale *)v8 setResponseOptions:(unint64_t)[(_DASPolicyResponseRationale *)v8 responseOptions] | 1];
          uint64_t v24 = 33;
        }
        if (v23 < 900.0)
        {
          -[_DASPolicyResponseRationale addRationaleForCondition:withRequiredValue:withCurrentValue:](v8, "addRationaleForCondition:withRequiredValue:withCurrentValue:", @"Minimum seconds since user was last active");
          [(_DASPolicyResponseRationale *)v8 setResponseOptions:(unint64_t)[(_DASPolicyResponseRationale *)v8 responseOptions] | 0x100];
          uint64_t v24 = 33;
        }
        if ([v6 triggersRestart])
        {
          if (+[_DASConfig requiresStrictDarkBoot])
          {
            if (([v6 isSoftwareUpdateActivity] & 1) == 0)
            {
              v46 = [v6 name];
              unsigned __int8 v47 = [v46 isEqualToString:@"com.apple.dasd.dataCollectiontask.dummyAutoSU"];

              if ((v47 & 1) == 0)
              {
                v48 = +[_DASBacklightStateMonitor sharedInstance];
                if (([v48 isBacklightOff] & 1) == 0)
                {
                  [(_DASPolicyResponseRationale *)v8 addRationaleForCondition:@"Backlight On" withRequiredValue:0.0 withCurrentValue:1.0];
                  [(_DASPolicyResponseRationale *)v8 setResponseOptions:(unint64_t)[(_DASPolicyResponseRationale *)v8 responseOptions] | 2];
                  uint64_t v24 = 33;
                }
              }
            }
          }
        }
        v43 = +[_DASPolicyResponse policyResponseWithDecision:v24 validityDuration:v8 rationale:(double)0x384uLL];

        id v9 = v52;
        goto LABEL_66;
      }
      [(_DASPolicyResponseRationale *)v8 addRationaleForCondition:@"Is device on night stand?" withRequiredValue:0.0 withCurrentValue:0.0];
      uint64_t v24 = 0;
      uint64_t v34 = 512;
    }
    [(_DASPolicyResponseRationale *)v8 setResponseOptions:[(_DASPolicyResponseRationale *)v8 responseOptions] | v34];
    goto LABEL_54;
  }
  v35 = +[NSPredicate predicateWithFormat:@"DeviceRestartPeriodNotInRange == 1"];
  [(_DASPolicyResponseRationale *)v8 addRationaleWithCondition:v35];

  deviceRestartPeriod1 = self->_deviceRestartPeriod1;
  if (deviceRestartPeriod1)
  {
    v37 = [(_CDDateRange *)deviceRestartPeriod1 startDate];
    [v6 setStartAfter:v37];

    v38 = [v6 startBefore];
    v39 = [v6 startAfter];
    [v38 timeIntervalSinceDate:v39];
    double v41 = v40;

    if (v41 < 0.0)
    {
      v42 = [(_CDDateRange *)self->_deviceRestartPeriod1 endDate];
      [v6 setStartBefore:v42];
    }
  }
  v43 = +[_DASPolicyResponse policyResponseWithDecision:33 validityDuration:v8 rationale:(double)0x384uLL];
LABEL_66:

  return v43;
}

- (id)blockReasons:(id)a3
{
  id v4 = a3;
  double v5 = +[NSMutableArray array];
  id v6 = [v4 rationale];
  unsigned __int8 v7 = [v6 responseOptions];

  if (v7)
  {
    double v8 = +[NSString stringWithFormat:@"%@::WakeScheduled", self->_policyName];
    [v5 addObject:v8];
  }
  id v9 = [v4 rationale];
  unsigned __int8 v10 = [v9 responseOptions];

  if ((v10 & 2) != 0)
  {
    unsigned __int8 v11 = +[NSString stringWithFormat:@"%@::BacklightOn", self->_policyName];
    [v5 addObject:v11];
  }
  BOOL v12 = [v4 rationale];
  unsigned __int8 v13 = [v12 responseOptions];

  if ((v13 & 4) != 0)
  {
    v14 = +[NSString stringWithFormat:@"%@::UserPresentActive", self->_policyName];
    [v5 addObject:v14];
  }
  id v15 = [v4 rationale];
  unsigned __int8 v16 = [v15 responseOptions];

  if ((v16 & 8) != 0)
  {
    v17 = +[NSString stringWithFormat:@"%@::UserPresentPassiveWithDisplay", self->_policyName];
    [v5 addObject:v17];
  }
  double v18 = [v4 rationale];
  unsigned __int8 v19 = [v18 responseOptions];

  if ((v19 & 0x10) != 0)
  {
    unsigned int v20 = +[NSString stringWithFormat:@"%@::UserPresentPassiveWithoutDisplay", self->_policyName];
    [v5 addObject:v20];
  }
  unsigned int v21 = [v4 rationale];
  unsigned __int8 v22 = [v21 responseOptions];

  if ((v22 & 0x20) != 0)
  {
    double v23 = +[NSString stringWithFormat:@"%@::UserRemoteClientActive", self->_policyName];
    [v5 addObject:v23];
  }
  uint64_t v24 = [v4 rationale];
  unsigned __int8 v25 = [v24 responseOptions];

  if ((v25 & 0x40) != 0)
  {
    unsigned int v26 = +[NSString stringWithFormat:@"%@::UserNotificationActive", self->_policyName];
    [v5 addObject:v26];
  }
  v27 = [v4 rationale];
  unsigned __int8 v28 = [v27 responseOptions];

  if ((v28 & 0x80) != 0)
  {
    id v29 = +[NSString stringWithFormat:@"%@::AssertionsHeld", self->_policyName];
    [v5 addObject:v29];
  }
  id v30 = [v4 rationale];
  unsigned __int16 v31 = (unsigned __int16)[v30 responseOptions];

  if ((v31 & 0x100) != 0)
  {
    uint64_t v32 = +[NSString stringWithFormat:@"%@::UserActiveRecently", self->_policyName];
    [v5 addObject:v32];
  }

  return v5;
}

- (NSString)policyName
{
  return self->_policyName;
}

- (void)setPolicyName:(id)a3
{
}

- (NSString)policyDescription
{
  return self->_policyDescription;
}

- (void)setPolicyDescription:(id)a3
{
}

- (_CDContextualKeyPath)deviceAssertionsHeld
{
  return self->_deviceAssertionsHeld;
}

- (void)setDeviceAssertionsHeld:(id)a3
{
}

- (_CDContextualKeyPath)inUseStatus
{
  return self->_inUseStatus;
}

- (void)setInUseStatus:(id)a3
{
}

- (_CDContextualKeyPath)nextWakeRequest
{
  return self->_nextWakeRequest;
}

- (void)setNextWakeRequest:(id)a3
{
}

- (NSArray)triggers
{
  return self->_triggers;
}

- (void)setTriggers:(id)a3
{
}

- (NSDate)lastCacheDate
{
  return (NSDate *)objc_getProperty(self, a2, 56, 1);
}

- (void)setLastCacheDate:(id)a3
{
}

- (_CDDateRange)deviceRestartPeriod1
{
  return self->_deviceRestartPeriod1;
}

- (void)setDeviceRestartPeriod1:(id)a3
{
}

- (_CDDateRange)deviceRestartPeriod2
{
  return self->_deviceRestartPeriod2;
}

- (void)setDeviceRestartPeriod2:(id)a3
{
}

- (double)minDurationAfterLastUserInteraction
{
  return self->_minDurationAfterLastUserInteraction;
}

- (void)setMinDurationAfterLastUserInteraction:(double)a3
{
  self->_minDurationAfterLastUserInteraction = a3;
}

- (double)minDurationBeforeNextScheduledWake
{
  return self->_minDurationBeforeNextScheduledWake;
}

- (void)setMinDurationBeforeNextScheduledWake:(double)a3
{
  self->_minDurationBeforeNextScheduledWake = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceRestartPeriod2, 0);
  objc_storeStrong((id *)&self->_deviceRestartPeriod1, 0);
  objc_storeStrong((id *)&self->_lastCacheDate, 0);
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_storeStrong((id *)&self->_nextWakeRequest, 0);
  objc_storeStrong((id *)&self->_inUseStatus, 0);
  objc_storeStrong((id *)&self->_deviceAssertionsHeld, 0);
  objc_storeStrong((id *)&self->_policyDescription, 0);

  objc_storeStrong((id *)&self->_policyName, 0);
}

@end