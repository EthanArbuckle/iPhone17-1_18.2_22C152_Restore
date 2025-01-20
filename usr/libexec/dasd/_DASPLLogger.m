@interface _DASPLLogger
+ (id)sharedInstance;
- (BOOL)didCoalesceWithPrevious:(id)a3;
- (BOOL)powerLogExists;
- (BOOL)shouldLogActivity:(id)a3;
- (BOOL)shouldLogAppPrediction:(id)a3;
- (BOOL)shouldLogPrediction:(id)a3;
- (NSArray)triggers;
- (NSDate)lastCoalesced;
- (NSMutableArray)activities;
- (NSMutableDictionary)activityToLifeCycle;
- (NSMutableDictionary)appPredictions;
- (NSMutableDictionary)multiplier;
- (NSMutableDictionary)predictions;
- (NSMutableDictionary)triggerReport;
- (NSUserDefaults)defaults;
- (OS_dispatch_queue)syncQueue;
- (OS_dispatch_source)dailyPeriodTimer;
- (OS_dispatch_source)longPeriodTimer;
- (OS_dispatch_source)shortPeriodTimer;
- (_DASPLLogger)init;
- (double)newDurationForStartDates:(id)a3 withPreviousDurations:(id)a4;
- (id)commaDelimitedEntriesFrom:(id)a3;
- (id)createRecordFromActivity:(id)a3;
- (id)getCurrentBootSessionUUID;
- (id)getValuesFromTimeline:(id)a3 valueMultiplier:(id)a4;
- (id)numberFromDouble:(double)a3;
- (id)processNameFromPID:(int)a3;
- (int)appPredictionCount;
- (int)droppedCount;
- (int)eventsCoalesced;
- (int)taskCount;
- (os_unfair_lock_s)lock;
- (unint64_t)uptime;
- (void)logActivities;
- (void)logDailyActivities;
- (void)logPredictions;
- (void)logToPowerLogTrigger:(id)a3 withStatus:(BOOL)a4;
- (void)recordActivity:(id)a3;
- (void)recordActivityLifeCycleEnd:(id)a3;
- (void)recordActivityLifeCycleStart:(id)a3;
- (void)recordActivityLifeCycleSuspend:(id)a3;
- (void)recordAppPrediction:(id)a3 app:(id)a4;
- (void)recordCAEventsForActivity:(id)a3 withParams:(id)a4;
- (void)recordPrediction:(id)a3 key:(id)a4 valueMultiplier:(int)a5;
- (void)reportNewStatus:(BOOL)a3 forTrigger:(id)a4;
- (void)resetTriggerReport;
- (void)sendAnalyticsEventForStream:(id)a3 withActivity:(id)a4 withMetricValueKey:(id)a5 withMetricValue:(id)a6;
- (void)setActivities:(id)a3;
- (void)setActivityToLifeCycle:(id)a3;
- (void)setAppPredictionCount:(int)a3;
- (void)setAppPredictions:(id)a3;
- (void)setDailyPeriodTimer:(id)a3;
- (void)setDefaults:(id)a3;
- (void)setDroppedCount:(int)a3;
- (void)setEventsCoalesced:(int)a3;
- (void)setLastCoalesced:(id)a3;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)setLongPeriodTimer:(id)a3;
- (void)setMultiplier:(id)a3;
- (void)setPowerLogExists:(BOOL)a3;
- (void)setPredictions:(id)a3;
- (void)setShortPeriodTimer:(id)a3;
- (void)setSyncQueue:(id)a3;
- (void)setTaskCount:(int)a3;
- (void)setTriggerReport:(id)a3;
- (void)setTriggers:(id)a3;
- (void)setupTimers;
- (void)updateDataDurationWithTrigger:(id)a3 andState:(BOOL)a4;
- (void)updateEnergyDurationWithTrigger:(id)a3 andState:(BOOL)a4;
@end

@implementation _DASPLLogger

- (_DASPLLogger)init
{
  v37.receiver = self;
  v37.super_class = (Class)_DASPLLogger;
  v2 = [(_DASPLLogger *)&v37 init];
  if (!v2)
  {
LABEL_13:
    v25 = v2;
    goto LABEL_14;
  }
  BOOL v3 = dlopen_preflight("/System/Library/PrivateFrameworks/PowerLog.framework/PowerLog");
  v2->_powerLogExists = v3;
  if (v3)
  {
    v2->_taskCount = 0;
    v2->_droppedCount = 0;
    v2->_eventsCoalesced = 0;
    uint64_t v4 = +[NSDate distantPast];
    lastCoalesced = v2->_lastCoalesced;
    v2->_lastCoalesced = (NSDate *)v4;

    uint64_t v6 = +[NSMutableArray array];
    activities = v2->_activities;
    v2->_activities = (NSMutableArray *)v6;

    uint64_t v8 = +[NSMutableDictionary dictionary];
    predictions = v2->_predictions;
    v2->_predictions = (NSMutableDictionary *)v8;

    uint64_t v10 = +[NSMutableDictionary dictionary];
    appPredictions = v2->_appPredictions;
    v2->_appPredictions = (NSMutableDictionary *)v10;

    uint64_t v12 = +[NSMutableDictionary dictionary];
    multiplier = v2->_multiplier;
    v2->_multiplier = (NSMutableDictionary *)v12;

    v2->_lock._os_unfair_lock_opaque = 0;
    v14 = (NSUserDefaults *)[objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.duetactivityscheduler"];
    defaults = v2->_defaults;
    v2->_defaults = v14;

    uint64_t v16 = +[NSMutableDictionary dictionary];
    triggerReport = v2->_triggerReport;
    v2->_triggerReport = (NSMutableDictionary *)v16;

    uint64_t v18 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", off_1001C3970, off_1001C3978, off_1001C3980, off_1001C3988, 0);
    triggers = v2->_triggers;
    v2->_triggers = (NSArray *)v18;

    [(_DASPLLogger *)v2 resetTriggerReport];
    v20 = +[NSString stringWithFormat:@"%@Available", off_1001C3970];
    v21 = [(NSMutableDictionary *)v2->_triggerReport objectForKeyedSubscript:v20];
    if (v21)
    {
      v22 = [(NSMutableDictionary *)v2->_triggerReport objectForKeyedSubscript:v20];
      id v23 = [v22 BOOLValue];
    }
    else
    {
      id v23 = 0;
    }

    [(_DASPLLogger *)v2 logToPowerLogTrigger:off_1001C3970 withStatus:v23];
    v26 = +[NSString stringWithFormat:@"%@Available", off_1001C3978];

    v27 = [(NSMutableDictionary *)v2->_triggerReport objectForKeyedSubscript:v26];
    if (v27)
    {
      v28 = [(NSMutableDictionary *)v2->_triggerReport objectForKeyedSubscript:v26];
      id v29 = [v28 BOOLValue];
    }
    else
    {
      id v29 = 0;
    }

    [(_DASPLLogger *)v2 logToPowerLogTrigger:off_1001C3978 withStatus:v29];
    [(_DASPLLogger *)v2 setupTimers];
    *(_DWORD *)buf = 0;
    syncQueue = v2->_syncQueue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000EA3E8;
    handler[3] = &unk_1001759D0;
    v31 = v2;
    v36 = v31;
    notify_register_dispatch("com.apple.dasd.plloger.logActivities", (int *)buf, syncQueue, handler);
    uint64_t v32 = +[NSMutableDictionary dictionary];
    activityToLifeCycle = v31->_activityToLifeCycle;
    v31->_activityToLifeCycle = (NSMutableDictionary *)v32;

    goto LABEL_13;
  }
  v24 = +[_DASDaemonLogger logForCategory:@"PowerLog"];
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v39 = "/System/Library/PrivateFrameworks/PowerLog.framework/PowerLog";
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Powerlog library at %s does not exist", buf, 0xCu);
  }

  v25 = 0;
LABEL_14:

  return v25;
}

- (void)setupTimers
{
  BOOL v3 = (const char *)[@"com.apple.duetactivityschedulerpowerlog.hourlysyncqueue" UTF8String];
  uint64_t v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v5 = (OS_dispatch_queue *)dispatch_queue_create(v3, v4);
  syncQueue = self->_syncQueue;
  self->_syncQueue = v5;

  v7 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_syncQueue);
  shortPeriodTimer = self->_shortPeriodTimer;
  self->_shortPeriodTimer = v7;

  dispatch_set_qos_class_fallback();
  v9 = self->_shortPeriodTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000EA7D8;
  handler[3] = &unk_1001754F8;
  void handler[4] = self;
  dispatch_source_set_event_handler(v9, handler);
  uint64_t v10 = self->_shortPeriodTimer;
  dispatch_time_t v11 = dispatch_walltime(0, 817405952);
  dispatch_source_set_timer(v10, v11, 0x34630B8A000uLL, 0x45D964B800uLL);
  dispatch_resume((dispatch_object_t)self->_shortPeriodTimer);
  uint64_t v12 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_syncQueue);
  longPeriodTimer = self->_longPeriodTimer;
  self->_longPeriodTimer = v12;

  dispatch_set_qos_class_fallback();
  v14 = self->_longPeriodTimer;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1000EA7E0;
  v31[3] = &unk_1001754F8;
  v31[4] = self;
  dispatch_source_set_event_handler(v14, v31);
  v15 = self->_longPeriodTimer;
  dispatch_time_t v16 = dispatch_walltime(0, -1025343488);
  dispatch_source_set_timer(v15, v16, 0xD18C2E28000uLL, 0x45D964B800uLL);
  dispatch_resume((dispatch_object_t)self->_longPeriodTimer);
  v17 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_syncQueue);
  dailyPeriodTimer = self->_dailyPeriodTimer;
  self->_dailyPeriodTimer = v17;

  v19 = [(NSUserDefaults *)self->_defaults objectForKey:@"nextTriggerReport"];

  defaults = self->_defaults;
  if (v19)
  {
    [(NSUserDefaults *)self->_defaults doubleForKey:@"nextTriggerReport"];
    v21 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
    [v21 timeIntervalSinceNow];
    double v22 = 0.0;
    if (v23 > 0.0)
    {
      [v21 timeIntervalSinceNow];
      double v22 = v24;
    }
  }
  else
  {
    double v22 = 86400.0;
    v21 = +[NSDate dateWithTimeIntervalSinceNow:86400.0];
    [v21 timeIntervalSinceReferenceDate];
    -[NSUserDefaults setDouble:forKey:](defaults, "setDouble:forKey:", @"nextTriggerReport");
  }

  v25 = +[_DASDaemonLogger logForCategory:@"PowerLog"];
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    v26 = +[NSNumber numberWithDouble:v22 / 60.0];
    *(_DWORD *)buf = 138412290;
    v34 = v26;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Will report in %@ minutes", buf, 0xCu);
  }
  v27 = self->_dailyPeriodTimer;
  dispatch_time_t v28 = dispatch_walltime(0, (uint64_t)(v22 * 1000000000.0));
  dispatch_source_set_timer(v27, v28, 0x4E94914F0000uLL, 0x45D964B800uLL);
  id v29 = self->_dailyPeriodTimer;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1000EA7E8;
  v30[3] = &unk_1001754F8;
  v30[4] = self;
  dispatch_source_set_event_handler(v29, v30);
  dispatch_activate((dispatch_object_t)self->_dailyPeriodTimer);
}

- (id)getCurrentBootSessionUUID
{
  size_t size = 0;
  sysctlbyname("kern.bootsessionuuid", 0, &size, 0, 0);
  v2 = malloc_type_malloc(size, 0xB1462270uLL);
  sysctlbyname("kern.bootsessionuuid", v2, &size, 0, 0);
  BOOL v3 = +[NSString stringWithUTF8String:v2];
  free(v2);

  return v3;
}

- (void)resetTriggerReport
{
  uint64_t v3 = [(NSUserDefaults *)self->_defaults objectForKey:@"triggerReport"];
  uint64_t v4 = [(_DASPLLogger *)self getCurrentBootSessionUUID];
  uint64_t v5 = [(NSUserDefaults *)self->_defaults stringForKey:@"lastBootUUID"];
  uint64_t v6 = +[_DASDaemonLogger logForCategory:@"PowerLog"];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v33 = v4;
    __int16 v34 = 2112;
    uint64_t v35 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Current Boot UUID is %@, Previous was %@", buf, 0x16u);
  }

  v25 = v4;
  v26 = (void *)v3;
  double v24 = (void *)v5;
  if (v3 && [v4 isEqualToString:v5])
  {
    [(NSMutableDictionary *)self->_triggerReport setDictionary:v3];
  }
  else
  {
    [(NSUserDefaults *)self->_defaults setObject:v4 forKey:@"lastBootUUID"];
    [(NSMutableDictionary *)self->_triggerReport removeAllObjects];
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v7 = self->_triggers;
  id v8 = [(NSArray *)v7 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v28;
    do
    {
      dispatch_time_t v11 = 0;
      do
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v27 + 1) + 8 * (void)v11);
        if ([v12 isEqualToString:off_1001C3970])
        {
          v13 = +[_CDClientContext userContext];
          v14 = +[_CDContextQueries keyPathForEnergyBudgetRemainingStatus];
          v15 = [v13 objectForKeyedSubscript:v14];
          uint64_t v16 = (uint64_t)[v15 BOOLValue];

LABEL_19:
          goto LABEL_20;
        }
        if ([v12 isEqualToString:off_1001C3978])
        {
          v13 = +[_CDClientContext userContext];
          uint64_t v17 = +[_CDContextQueries keyPathForNetworkingBudgetRemainingStatus];
LABEL_18:
          uint64_t v18 = (void *)v17;
          v19 = [v13 objectForKeyedSubscript:v17];
          uint64_t v16 = (uint64_t)[v19 BOOLValue];

          goto LABEL_19;
        }
        if ([v12 isEqualToString:off_1001C3980])
        {
          v13 = +[_CDClientContext userContext];
          uint64_t v17 = +[_CDContextQueries keyPathForPluginStatus];
          goto LABEL_18;
        }
        if ([v12 isEqualToString:off_1001C3988])
        {
          v13 = +[_CDClientContext userContext];
          uint64_t v16 = (uint64_t)+[_CDNetworkContext wifiQuality:v13] > 20;
          goto LABEL_19;
        }
        uint64_t v16 = 1;
LABEL_20:
        v20 = +[NSString stringWithFormat:@"%@Available", v12, v24, v25, v26, (void)v27];
        v21 = [(NSMutableDictionary *)self->_triggerReport objectForKeyedSubscript:v20];
        unsigned int v22 = [v21 BOOLValue];

        if (v16 != v22) {
          [(_DASPLLogger *)self reportNewStatus:v16 forTrigger:v12];
        }

        dispatch_time_t v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v23 = [(NSArray *)v7 countByEnumeratingWithState:&v27 objects:v31 count:16];
      id v9 = v23;
    }
    while (v23);
  }

  [(NSUserDefaults *)self->_defaults setObject:self->_triggerReport forKey:@"triggerReport"];
}

- (void)logDailyActivities
{
  v2 = self;
  objc_sync_enter(v2);
  AnalyticsSendEventLazy();
  defaults = v2->_defaults;
  uint64_t v4 = +[NSDate dateWithTimeIntervalSinceNow:86400.0];
  [v4 timeIntervalSinceReferenceDate];
  -[NSUserDefaults setDouble:forKey:](defaults, "setDouble:forKey:", @"nextTriggerReport");

  [(_DASPLLogger *)v2 resetTriggerReport];
  objc_sync_exit(v2);
}

- (double)newDurationForStartDates:(id)a3 withPreviousDurations:(id)a4
{
  id v5 = a3;
  [a4 doubleValue];
  double v7 = v6;
  if ([v5 count])
  {
    id v8 = [v5 lastObject];
    [v8 timeIntervalSinceNow];
    double v10 = v9;

    if (v10 < 0.0) {
      double v7 = v7 - v10;
    }
  }

  return v7;
}

- (void)updateEnergyDurationWithTrigger:(id)a3 andState:(BOOL)a4
{
  unsigned int v4 = a4;
  id v20 = a3;
  unsigned int v6 = v4;
  if (([v20 isEqualToString:off_1001C3970] & 1) == 0)
  {
    double v7 = [(NSMutableDictionary *)self->_triggerReport objectForKeyedSubscript:@"energyAvailable"];
    unsigned int v6 = [v7 BOOLValue];
  }
  if (([v20 isEqualToString:off_1001C3980] & 1) == 0)
  {
    id v8 = [(NSMutableDictionary *)self->_triggerReport objectForKeyedSubscript:@"pluginAvailable"];
    unsigned int v4 = [v8 BOOLValue];
  }
  if ((v4 & v6 & 1) == 0)
  {
    double v9 = +[NSString stringWithFormat:@"%@ActualUnavailableStartDates", @"energy"];
    double v10 = +[NSString stringWithFormat:@"%@ActualUnavailableDuration", @"energy"];
    dispatch_time_t v11 = [(NSMutableDictionary *)self->_triggerReport objectForKeyedSubscript:v9];
    if (v11)
    {
      uint64_t v12 = [(NSMutableDictionary *)self->_triggerReport objectForKeyedSubscript:v9];
      id v13 = [v12 mutableCopy];
    }
    else
    {
      id v13 = +[NSMutableArray array];
    }

    if (v6 == v4)
    {
      if ((v4 | v6))
      {
        v19 = 0;
LABEL_15:
        [v13 addObject:v19];
        [(NSMutableDictionary *)self->_triggerReport setObject:v13 forKeyedSubscript:v9];

        goto LABEL_16;
      }
      uint64_t v18 = +[NSDate date];
    }
    else
    {
      v14 = [(NSMutableDictionary *)self->_triggerReport objectForKeyedSubscript:v10];
      [(_DASPLLogger *)self newDurationForStartDates:v13 withPreviousDurations:v14];
      double v16 = v15;

      uint64_t v17 = +[NSNumber numberWithDouble:v16];
      [(NSMutableDictionary *)self->_triggerReport setObject:v17 forKeyedSubscript:v10];

      uint64_t v18 = +[NSDate distantFuture];
    }
    v19 = (void *)v18;
    goto LABEL_15;
  }
LABEL_16:
}

- (void)updateDataDurationWithTrigger:(id)a3 andState:(BOOL)a4
{
  unsigned int v4 = a4;
  id v20 = a3;
  unsigned int v6 = v4;
  if (([v20 isEqualToString:off_1001C3978] & 1) == 0)
  {
    double v7 = [(NSMutableDictionary *)self->_triggerReport objectForKeyedSubscript:@"dataAvailable"];
    unsigned int v6 = [v7 BOOLValue];
  }
  if (([v20 isEqualToString:off_1001C3988] & 1) == 0)
  {
    id v8 = [(NSMutableDictionary *)self->_triggerReport objectForKeyedSubscript:@"wifiAvailable"];
    unsigned int v4 = [v8 BOOLValue];
  }
  if ((v4 & v6 & 1) == 0)
  {
    double v9 = +[NSString stringWithFormat:@"%@ActualUnavailableStartDates", @"data"];
    double v10 = +[NSString stringWithFormat:@"%@ActualUnavailableDuration", @"data"];
    dispatch_time_t v11 = [(NSMutableDictionary *)self->_triggerReport objectForKeyedSubscript:v9];
    if (v11)
    {
      uint64_t v12 = [(NSMutableDictionary *)self->_triggerReport objectForKeyedSubscript:v9];
      id v13 = [v12 mutableCopy];
    }
    else
    {
      id v13 = +[NSMutableArray array];
    }

    if (v6 == v4)
    {
      if ((v4 | v6))
      {
        v19 = 0;
LABEL_15:
        [v13 addObject:v19];
        [(NSMutableDictionary *)self->_triggerReport setObject:v13 forKeyedSubscript:v9];

        goto LABEL_16;
      }
      uint64_t v18 = +[NSDate date];
    }
    else
    {
      v14 = [(NSMutableDictionary *)self->_triggerReport objectForKeyedSubscript:v10];
      [(_DASPLLogger *)self newDurationForStartDates:v13 withPreviousDurations:v14];
      double v16 = v15;

      uint64_t v17 = +[NSNumber numberWithDouble:v16];
      [(NSMutableDictionary *)self->_triggerReport setObject:v17 forKeyedSubscript:v10];

      uint64_t v18 = +[NSDate distantFuture];
    }
    v19 = (void *)v18;
    goto LABEL_15;
  }
LABEL_16:
}

- (void)reportNewStatus:(BOOL)a3 forTrigger:(id)a4
{
  BOOL v5 = a3;
  id v7 = a4;
  id v8 = self;
  objc_sync_enter(v8);
  v31 = +[NSString stringWithFormat:@"%@Available", v7];
  double v9 = [(NSMutableDictionary *)v8->_triggerReport objectForKeyedSubscript:v31];
  if (v9)
  {
    double v10 = [(NSMutableDictionary *)v8->_triggerReport objectForKeyedSubscript:v31];
    unsigned int v11 = [v10 BOOLValue];

    if (v11 == v5) {
      goto LABEL_31;
    }
  }
  uint64_t v12 = +[NSString stringWithFormat:@"%@EstimatedUnavailableStartDates", v7];
  id v13 = [(NSMutableDictionary *)v8->_triggerReport objectForKeyedSubscript:v12];
  if (v13)
  {
    v14 = [(NSMutableDictionary *)v8->_triggerReport objectForKeyedSubscript:v12];
    id v15 = [v14 mutableCopy];
  }
  else
  {
    id v15 = +[NSMutableArray array];
  }

  if (v5) {
    CFStringRef v16 = @"%@AvailableCount";
  }
  else {
    CFStringRef v16 = @"%@UnavailableCount";
  }
  uint64_t v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v16, v7);
  uint64_t v18 = [(NSMutableDictionary *)v8->_triggerReport objectForKeyedSubscript:v17];
  if (v18)
  {
    unsigned int v4 = [(NSMutableDictionary *)v8->_triggerReport objectForKeyedSubscript:v17];
    +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v4 intValue] + 1);
    v19 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = &off_100187780;
  }
  [(NSMutableDictionary *)v8->_triggerReport setObject:v19 forKeyedSubscript:v17];
  if (v18)
  {
  }
  if (v5)
  {
    id v20 = +[NSString stringWithFormat:@"%@EstimatedUnavailableDuration", v7];
    v21 = [(NSMutableDictionary *)v8->_triggerReport objectForKeyedSubscript:v20];
    [(_DASPLLogger *)v8 newDurationForStartDates:v15 withPreviousDurations:v21];
    double v23 = v22;

    double v24 = +[NSNumber numberWithDouble:v23];
    [(NSMutableDictionary *)v8->_triggerReport setObject:v24 forKeyedSubscript:v20];

    v25 = +[NSDate distantFuture];
    [v15 addObject:v25];
  }
  else
  {
    id v20 = +[NSDate date];
    [v15 addObject:v20];
  }

  [(NSMutableDictionary *)v8->_triggerReport setObject:v15 forKeyedSubscript:v12];
  if (([v7 isEqualToString:off_1001C3970] & 1) != 0
    || [v7 isEqualToString:off_1001C3980])
  {
    [(_DASPLLogger *)v8 updateEnergyDurationWithTrigger:v7 andState:v5];
  }
  if (([v7 isEqualToString:off_1001C3978] & 1) != 0
    || [v7 isEqualToString:off_1001C3988])
  {
    [(_DASPLLogger *)v8 updateDataDurationWithTrigger:v7 andState:v5];
  }
  if ([v7 isEqualToString:off_1001C3970])
  {
    v26 = &off_1001C3970;
LABEL_27:
    [(_DASPLLogger *)v8 logToPowerLogTrigger:*v26 withStatus:v5];
    goto LABEL_28;
  }
  if ([v7 isEqualToString:off_1001C3978])
  {
    v26 = &off_1001C3978;
    goto LABEL_27;
  }
LABEL_28:
  long long v27 = +[NSNumber numberWithBool:v5];
  [(NSMutableDictionary *)v8->_triggerReport setObject:v27 forKeyedSubscript:v31];

  [(NSUserDefaults *)v8->_defaults setObject:v8->_triggerReport forKey:@"triggerReport"];
  long long v28 = +[_DASDaemonLogger logForCategory:@"PowerLog"];
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    long long v29 = +[NSNumber numberWithBool:v5];
    triggerReport = v8->_triggerReport;
    *(_DWORD *)buf = 138412802;
    v33 = v29;
    __int16 v34 = 2112;
    id v35 = v7;
    __int16 v36 = 2112;
    objc_super v37 = triggerReport;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Recording %@ for trigger %@. Updated report is %@", buf, 0x20u);
  }
LABEL_31:

  objc_sync_exit(v8);
}

- (void)logToPowerLogTrigger:(id)a3 withStatus:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = (__CFString *)a3;
  unsigned int v6 = +[NSMutableDictionary dictionary];
  id v7 = +[_DASDaemonLogger logForCategory:@"PowerLog"];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = +[NSNumber numberWithBool:v4];
    *(_DWORD *)buf = 138412546;
    v14 = v5;
    __int16 v15 = 2112;
    CFStringRef v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Recording trigger %@ budget available %@ to PowerLog", buf, 0x16u);
  }
  double v10 = +[NSString stringWithFormat:@"%@Available", v5];
  unsigned int v11 = +[NSNumber numberWithBool:v4];
  [v6 setObject:v11 forKeyedSubscript:v10];

  if (off_1001C3970 == v5 || off_1001C3978 == v5)
  {
    PLLogRegisteredEvent();
  }
  else
  {
    uint64_t v12 = +[_DASDaemonLogger logForCategory:@"PowerLog"];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100100FC4((uint64_t)v5, v12);
    }
  }
}

- (void)logActivities
{
  uint64_t v3 = +[NSMutableDictionary dictionary];
  BOOL v4 = +[_DASDaemon sharedInstance];
  id v5 = [v4 submittedTaskCount];

  v13[0] = @"queuedTasks";
  unsigned int v6 = +[NSNumber numberWithUnsignedInteger:v5];
  v13[1] = @"eventsCoalesced";
  v14[0] = v6;
  id v7 = +[NSNumber numberWithInt:self->_eventsCoalesced];
  v14[1] = v7;
  id v8 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];

  double v10 = self->_activities;
  objc_sync_enter(v10);
  [v3 setObject:self->_activities forKeyedSubscript:@"dasTasks"];
  unsigned int v11 = +[NSNumber numberWithInt:self->_droppedCount];
  [v3 setObject:v11 forKeyedSubscript:@"droppedCount"];

  uint64_t v12 = +[_DASDaemonLogger logForCategory:@"powerlog"];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_10010103C((uint64_t)v3, v12);
  }

  PLLogRegisteredEvent();
  PLLogRegisteredEvent();
  [(NSMutableArray *)self->_activities removeAllObjects];
  self->_taskCount = 0;
  self->_droppedCount = 0;
  self->_eventsCoalesced = 0;
  objc_sync_exit(v10);
}

- (void)logPredictions
{
  BOOL v4 = +[NSMutableDictionary dictionary];
  id v5 = +[NSMutableArray array];
  unsigned int v6 = self->_predictions;
  objc_sync_enter(v6);
  predictions = self->_predictions;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000EC1FC;
  v17[3] = &unk_100178618;
  v17[4] = self;
  id v8 = v4;
  id v18 = v8;
  [(NSMutableDictionary *)predictions enumerateKeysAndObjectsUsingBlock:v17];
  unint64_t v9 = (unint64_t)[(NSMutableDictionary *)self->_predictions count];
  [(NSMutableDictionary *)self->_predictions removeAllObjects];

  objc_sync_exit(v6);
  double v10 = self->_appPredictions;
  objc_sync_enter(v10);
  appPredictions = self->_appPredictions;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  void v14[2] = sub_1000EC2B0;
  v14[3] = &unk_100178640;
  v14[4] = self;
  __int16 v15 = &off_100187798;
  id v12 = v5;
  id v16 = v12;
  [(NSMutableDictionary *)appPredictions enumerateKeysAndObjectsUsingBlock:v14];
  unint64_t v13 = (unint64_t)[(NSMutableDictionary *)self->_appPredictions count];
  [(NSMutableDictionary *)self->_appPredictions removeAllObjects];
  self->_appPredictionCount = 0;

  objc_sync_exit(v10);
  [v8 setObject:v12 forKeyedSubscript:@"applicationUsagePrediction"];
  if (v9 | v13) {
    PLLogRegisteredEvent();
  }
}

+ (id)sharedInstance
{
  if (qword_1001C4540 != -1) {
    dispatch_once(&qword_1001C4540, &stru_100178660);
  }
  v2 = (void *)qword_1001C4548;

  return v2;
}

- (BOOL)didCoalesceWithPrevious:(id)a3
{
  id v4 = a3;
  if ([v4 requiresNetwork])
  {
    id v5 = self->_lastCoalesced;
    objc_sync_enter(v5);
    unsigned int v6 = [v4 startDate];
    if (v6)
    {
      id v7 = [v4 startDate];
      [v7 timeIntervalSinceDate:self->_lastCoalesced];
      BOOL v9 = v8 < 10.0;
    }
    else
    {
      BOOL v9 = 0;
    }

    double v10 = [v4 startDate];
    lastCoalesced = self->_lastCoalesced;
    self->_lastCoalesced = v10;

    objc_sync_exit(v5);
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)shouldLogActivity:(id)a3
{
  id v4 = a3;
  id v5 = [v4 startDate];
  if (v5)
  {
    unsigned int v6 = +[NSDate date];
    id v7 = [v4 startDate];
    [v6 timeIntervalSinceDate:v7];
    BOOL v10 = v8 > 5.0
       && (id v9 = [v4 schedulingPriority], (unint64_t)v9 < _DASSchedulingPriorityUserInitiated)
       && self->_taskCount < 100;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)shouldLogPrediction:(id)a3
{
  if (!a3) {
    return 0;
  }
  uint64_t v3 = [a3 startDate];
  [v3 timeIntervalSinceNow];
  BOOL v5 = v4 <= 64800.0;

  return v5;
}

- (BOOL)shouldLogAppPrediction:(id)a3
{
  if (self->_appPredictionCount > 19) {
    return 0;
  }
  else {
    return [(_DASPLLogger *)self shouldLogPrediction:a3];
  }
}

- (void)recordActivity:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v7 = v4;
    BOOL v5 = self->_activities;
    objc_sync_enter(v5);
    if ([(_DASPLLogger *)self shouldLogActivity:v7])
    {
      unsigned int v6 = [(_DASPLLogger *)self createRecordFromActivity:v7];
      [(NSMutableArray *)self->_activities addObject:v6];
      ++self->_taskCount;
    }
    else
    {
      ++self->_droppedCount;
    }
    if ([(_DASPLLogger *)self didCoalesceWithPrevious:v7]) {
      ++self->_eventsCoalesced;
    }
    objc_sync_exit(v5);

    id v4 = v7;
  }
}

- (id)getValuesFromTimeline:(id)a3 valueMultiplier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v7 doubleValue];
  double v10 = v9;
  unsigned int v11 = +[NSDate dateWithTimeIntervalSinceNow:14400.0];
  id v12 = +[_DASPredictionManager getValuesForPrediction:v6 tillEndDate:v11 withIntervals:900.0];

  if (v12)
  {
    unint64_t v13 = +[NSMutableArray arrayWithArray:v12];
    if ([v13 count])
    {
      unint64_t v14 = 0;
      do
      {
        __int16 v15 = [v13 objectAtIndexedSubscript:v14];
        unsigned int v16 = [v15 intValue];

        if (v16 != -1)
        {
          uint64_t v17 = [v13 objectAtIndexedSubscript:v14];
          [v17 doubleValue];
          v19 = [(_DASPLLogger *)self numberFromDouble:v10 * v18];
          [v13 setObject:v19 atIndexedSubscript:v14];
        }
        ++v14;
      }
      while (v14 < (unint64_t)[v13 count]);
    }
  }
  else
  {
    unint64_t v13 = 0;
  }

  return v13;
}

- (void)recordPrediction:(id)a3 key:(id)a4 valueMultiplier:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v11 = a3;
  id v8 = a4;
  if ([(_DASPLLogger *)self shouldLogPrediction:v11])
  {
    double v9 = self->_predictions;
    objc_sync_enter(v9);
    [(NSMutableDictionary *)self->_predictions setObject:v11 forKeyedSubscript:v8];
    double v10 = +[NSNumber numberWithInt:v5];
    [(NSMutableDictionary *)self->_multiplier setObject:v10 forKeyedSubscript:v8];

    objc_sync_exit(v9);
  }
}

- (void)recordAppPrediction:(id)a3 app:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if ([(_DASPLLogger *)self shouldLogAppPrediction:v8])
  {
    id v7 = self->_appPredictions;
    objc_sync_enter(v7);
    [(NSMutableDictionary *)self->_appPredictions setObject:v8 forKeyedSubscript:v6];
    ++self->_appPredictionCount;
    objc_sync_exit(v7);
  }
}

- (id)numberFromDouble:(double)a3
{
  return +[NSNumber numberWithInt:((int)(a3 * 100.0) / 100)];
}

- (id)commaDelimitedEntriesFrom:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = [v3 sortedArrayUsingSelector:"caseInsensitiveCompare:"];
    uint64_t v5 = [v4 firstObject];
    id v6 = +[NSMutableString stringWithString:v5];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = v4;
    id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if (([v12 isEqualToString:v5] & 1) == 0)
          {
            unint64_t v13 = +[NSString stringWithFormat:@", %@", v12];
            [v6 appendString:v13];
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)createRecordFromActivity:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[NSDate date];
  id v6 = [v4 startDate];
  [v5 timeIntervalSinceDate:v6];
  double v8 = v7;

  id v9 = +[NSMutableDictionary dictionary];
  uint64_t v10 = [v4 name];
  [v9 setObject:v10 forKeyedSubscript:@"taskName"];

  id v11 = -[_DASPLLogger numberFromDouble:](self, "numberFromDouble:", (double)(unint64_t)[v4 schedulingPriority]);
  [v9 setObject:v11 forKeyedSubscript:@"priority"];

  id v12 = [v4 startAfter];
  [v9 setObject:v12 forKeyedSubscript:@"startTime"];

  unint64_t v13 = [v4 startDate];
  [v9 setObject:v13 forKeyedSubscript:@"timeWhenRun"];

  unint64_t v14 = [v4 startBefore];
  [v9 setObject:v14 forKeyedSubscript:@"endTime"];

  long long v15 = [(_DASPLLogger *)self numberFromDouble:v8];
  [v9 setObject:v15 forKeyedSubscript:@"duration"];

  [v4 predictedOptimalScore];
  long long v17 = [(_DASPLLogger *)self numberFromDouble:v16 * 100.0];
  [v9 setObject:v17 forKeyedSubscript:@"optimalScore"];

  id v18 = v4;
  objc_sync_enter(v18);
  v19 = [v18 policyResponseMetadata];
  id v20 = [v19 objectForKeyedSubscript:@"scoreWhenRun"];

  if (v20)
  {
    [v20 score];
    double v22 = v21;
    double v23 = [(_DASPLLogger *)self numberFromDouble:v21 * 100.0];
    [v9 setObject:v23 forKeyedSubscript:@"scoreWhenRun"];

    double v24 = [v18 policyResponseMetadata];
    [v24 removeObjectForKey:@"scoreWhenRun"];
  }
  else
  {
    double v22 = -1.0;
    [v9 setObject:&off_1001877B0 forKeyedSubscript:@"scoreWhenRun"];
  }

  objc_sync_exit(v18);
  [v18 predictedOptimalScore];
  v26 = [(_DASPLLogger *)self numberFromDouble:v22 / v25 * 100.0];
  [v9 setObject:v26 forKeyedSubscript:@"optimalScorePercentage"];

  if ([v18 requiresPlugin]) {
    long long v27 = &__kCFBooleanTrue;
  }
  else {
    long long v27 = &__kCFBooleanFalse;
  }
  [v9 setObject:v27 forKeyedSubscript:@"requiresPlugin"];
  if ([v18 requiresInexpensiveNetworking]) {
    long long v28 = &__kCFBooleanTrue;
  }
  else {
    long long v28 = &__kCFBooleanFalse;
  }
  [v9 setObject:v28 forKeyedSubscript:@"requiresInexpensiveNetworking"];
  if ([v18 transferSize])
  {
    long long v29 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v18 transferSize]);
    [v9 setObject:v29 forKeyedSubscript:@"networkTaskSize"];
  }
  if ([v18 requiresDeviceInactivity]) {
    long long v30 = &__kCFBooleanTrue;
  }
  else {
    long long v30 = &__kCFBooleanFalse;
  }
  [v9 setObject:v30 forKeyedSubscript:@"requiresDeviceInactivity"];
  if ([v18 cpuIntensive]) {
    v31 = &__kCFBooleanTrue;
  }
  else {
    v31 = &__kCFBooleanFalse;
  }
  [v9 setObject:v31 forKeyedSubscript:@"isCpuIntensive"];
  if ([v18 memoryIntensive]) {
    uint64_t v32 = &__kCFBooleanTrue;
  }
  else {
    uint64_t v32 = &__kCFBooleanFalse;
  }
  [v9 setObject:v32 forKeyedSubscript:@"isMemoryIntensive"];
  if ([v18 aneIntensive]) {
    v33 = &__kCFBooleanTrue;
  }
  else {
    v33 = &__kCFBooleanFalse;
  }
  [v9 setObject:v33 forKeyedSubscript:@"isANEIntensive"];
  if ([v18 gpuIntensive]) {
    __int16 v34 = &__kCFBooleanTrue;
  }
  else {
    __int16 v34 = &__kCFBooleanFalse;
  }
  [v9 setObject:v34 forKeyedSubscript:@"isGPUIntensive"];
  id v35 = [v18 bundleId];

  if (v35)
  {
    __int16 v36 = [v18 bundleId];
    [v9 setObject:v36 forKeyedSubscript:@"bundleID"];
  }
  objc_super v37 = [v18 relatedApplications];
  v38 = [(_DASPLLogger *)self commaDelimitedEntriesFrom:v37];

  if (v38) {
    [v9 setObject:v38 forKeyedSubscript:@"application"];
  }
  v39 = [v18 involvedProcesses];
  v40 = [(_DASPLLogger *)self commaDelimitedEntriesFrom:v39];

  if (v40) {
    [v9 setObject:v40 forKeyedSubscript:@"involvedProcesses"];
  }
  id v41 = v18;
  objc_sync_enter(v41);
  v42 = [v41 policyResponseMetadata];
  id v43 = [v42 count];

  if (v43)
  {
    v44 = [v41 policyResponseMetadata];
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_1000ED1D4;
    v46[3] = &unk_100178688;
    id v47 = v9;
    v48 = self;
    [v44 enumerateKeysAndObjectsUsingBlock:v46];
  }
  objc_sync_exit(v41);

  return v9;
}

- (void)recordActivityLifeCycleStart:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = [v4 pid];
    if (v6)
    {
      id v7 = v6;
      double v8 = [(_DASPLLogger *)self processNameFromPID:v6];
      if (![(__CFString *)v8 length])
      {
        id v9 = +[_DASDaemonLogger logForCategory:@"powerlog"];
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          LODWORD(v18[0]) = 67109378;
          DWORD1(v18[0]) = v7;
          WORD4(v18[0]) = 2114;
          *(void *)((char *)v18 + 10) = v5;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Failed to resolve process name for PID %d for activity %{public}@", (uint8_t *)v18, 0x12u);
        }
      }
      p_lock = &self->_lock;
      os_unfair_lock_lock(&self->_lock);
      id v11 = +[NSMutableDictionary dictionary];
      id v12 = +[NSNumber numberWithUnsignedLongLong:[(_DASPLLogger *)self uptime]];
      [v11 setObject:v12 forKeyedSubscript:@"UptimeAtStart"];

      unint64_t v13 = +[NSDate now];
      [v11 setObject:v13 forKeyedSubscript:@"WalltimeAtStart"];

      unint64_t v14 = +[NSNumber numberWithInt:v7];
      [v11 setObject:v14 forKeyedSubscript:@"PID"];

      [v11 setObject:v8 forKeyedSubscript:@"ProcessName"];
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v19 = 0u;
      memset(v18, 0, sizeof(v18));
      if (!proc_pid_rusage((int)v7, 6, (rusage_info_t *)v18))
      {
        long long v15 = +[NSNumber numberWithUnsignedLongLong:*((void *)&v19 + 1)];
        [v11 setObject:v15 forKeyedSubscript:@"BilledEnergyAtStart"];
      }
      activityToLifeCycle = self->_activityToLifeCycle;
      long long v17 = [v5 description];
      [(NSMutableDictionary *)activityToLifeCycle setObject:v11 forKeyedSubscript:v17];

      os_unfair_lock_unlock(p_lock);
    }
    else
    {
      id v11 = +[_DASDaemonLogger logForCategory:@"powerlog"];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        LODWORD(v18[0]) = 138543362;
        *(void *)((char *)v18 + 4) = v5;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "No PID for activity %{public}@", (uint8_t *)v18, 0xCu);
      }
      double v8 = &stru_100179948;
    }
  }
}

- (void)recordActivityLifeCycleSuspend:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    p_lock = &self->_lock;
    id v17 = v4;
    os_unfair_lock_lock(&self->_lock);
    activityToLifeCycle = self->_activityToLifeCycle;
    id v7 = [v17 description];
    double v8 = [(NSMutableDictionary *)activityToLifeCycle objectForKeyedSubscript:v7];

    if (v8)
    {
      id v9 = +[NSNumber numberWithUnsignedLongLong:[(_DASPLLogger *)self uptime]];
      uint64_t v10 = self->_activityToLifeCycle;
      id v11 = [v17 description];
      id v12 = [(NSMutableDictionary *)v10 objectForKeyedSubscript:v11];
      [v12 setObject:v9 forKeyedSubscript:@"UptimeAtSuspension"];

      unint64_t v13 = +[NSDate now];
      unint64_t v14 = self->_activityToLifeCycle;
      long long v15 = [v17 description];
      double v16 = [(NSMutableDictionary *)v14 objectForKeyedSubscript:v15];
      [v16 setObject:v13 forKeyedSubscript:@"WalltimeAtSuspension"];
    }
    os_unfair_lock_unlock(p_lock);
    id v4 = v17;
  }
}

- (void)recordActivityLifeCycleEnd:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lock);
    activityToLifeCycle = self->_activityToLifeCycle;
    id v6 = [v4 description];
    id v7 = [(NSMutableDictionary *)activityToLifeCycle objectForKeyedSubscript:v6];

    if (v7)
    {
      double v8 = [v7 objectForKeyedSubscript:@"PID"];
      id v9 = [v8 intValue];

      uint64_t v10 = [v7 objectForKeyedSubscript:@"ProcessName"];
      id v11 = (void *)v10;
      id v12 = &stru_100179948;
      if (v10) {
        id v12 = (__CFString *)v10;
      }
      v78 = v12;

      unint64_t v13 = [v7 objectForKeyedSubscript:@"UptimeAtStart"];
      unint64_t v14 = [v13 unsignedLongValue];

      v80 = [v7 objectForKeyedSubscript:@"WalltimeAtStart"];
      long long v15 = [v7 objectForKeyedSubscript:@"UptimeAtSuspension"];
      double v16 = [v15 unsignedLongValue];

      v79 = [v7 objectForKeyedSubscript:@"WalltimeAtSuspension"];
      id v17 = [v7 objectForKeyedSubscript:@"BilledEnergyAtStart"];
      id v18 = [v17 unsignedLongValue];

      if (v9 && v18)
      {
        long long v108 = 0u;
        long long v109 = 0u;
        long long v106 = 0u;
        long long v107 = 0u;
        long long v104 = 0u;
        long long v105 = 0u;
        long long v102 = 0u;
        long long v103 = 0u;
        long long v100 = 0u;
        long long v101 = 0u;
        long long v98 = 0u;
        long long v99 = 0u;
        long long v96 = 0u;
        long long v97 = 0u;
        long long v94 = 0u;
        long long v95 = 0u;
        long long v92 = 0u;
        long long v93 = 0u;
        long long v90 = 0u;
        long long v91 = 0u;
        long long v88 = 0u;
        long long v89 = 0u;
        long long v86 = 0u;
        long long v87 = 0u;
        long long v84 = 0u;
        long long v85 = 0u;
        long long v82 = 0u;
        long long v83 = 0u;
        *(_OWORD *)buffer = 0u;
        proc_pid_rusage((int)v9, 6, buffer);
      }
      long long v19 = self->_activityToLifeCycle;
      long long v20 = [v4 description];
      [(NSMutableDictionary *)v19 removeObjectForKey:v20];

      os_unfair_lock_unlock(&self->_lock);
      long long v21 = +[NSDate date];
      long long v22 = [v4 startDate];
      long long v23 = [v4 startBefore];
      [v22 timeIntervalSinceDate:v23];
      double v25 = v24;

      long long v26 = +[NSMutableDictionary dictionary];
      long long v27 = [v4 name];
      [v26 setObject:v27 forKeyedSubscript:@"Name"];

      long long v28 = -[_DASPLLogger numberFromDouble:](self, "numberFromDouble:", (double)(unint64_t)[v4 schedulingPriority]);
      [v26 setObject:v28 forKeyedSubscript:@"Priority"];

      long long v29 = +[NSNumber numberWithInt:v9];
      [v26 setObject:v29 forKeyedSubscript:@"PID"];

      [v26 setObject:v78 forKeyedSubscript:@"ProcessName"];
      long long v30 = [v4 groupName];
      [v26 setObject:v30 forKeyedSubscript:@"GroupName"];

      [v26 setObject:v80 forKeyedSubscript:@"StartDate"];
      [v26 setObject:v21 forKeyedSubscript:@"EndDate"];
      [v21 timeIntervalSinceDate:v80];
      double v32 = v31;
      double v33 = (double)(((unsigned char *)[(_DASPLLogger *)self uptime] - v14) / 0x3B9ACA00uLL);
      if (v32 < v33) {
        double v33 = v32;
      }
      __int16 v34 = +[NSNumber numberWithUnsignedLongLong:(unint64_t)fmax(v33, 0.0)];
      [v26 setObject:v34 forKeyedSubscript:@"Duration"];

      if (v79)
      {
        [v26 setObject:v79 forKeyedSubscript:@"SuspendRequestDate"];
        id v35 = +[NSNumber numberWithUnsignedLongLong:((unsigned char *)[(_DASPLLogger *)self uptime] - v16) / 0x3B9ACA00uLL];
        [v26 setObject:v35 forKeyedSubscript:@"SuspensionDelay"];

        __int16 v36 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v4 lastDenialValue]);
        [v26 setObject:v36 forKeyedSubscript:@"SuspensionReason"];
      }
      objc_super v37 = [v4 startAfter:5.0];
      [v26 setObject:v37 forKeyedSubscript:@"ScheduleAfterDate"];

      v38 = [v4 startBefore];
      [v26 setObject:v38 forKeyedSubscript:@"ScheduleBeforeDate"];

      v39 = +[NSNumber numberWithBool:v25 > 5.0];
      [v26 setObject:v39 forKeyedSubscript:@"BeyondDeadline"];

      [v4 interval];
      v40 = -[_DASPLLogger numberFromDouble:](self, "numberFromDouble:");
      [v26 setObject:v40 forKeyedSubscript:@"Interval"];

      id v41 = [v4 fileProtection];
      v42 = [v41 description];
      [v26 setObject:v42 forKeyedSubscript:@"FileProtection"];

      id v43 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 cpuIntensive]);
      [v26 setObject:v43 forKeyedSubscript:@"IsCPUIntensive"];

      v44 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 memoryIntensive]);
      [v26 setObject:v44 forKeyedSubscript:@"IsMemoryIntensive"];

      v45 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 aneIntensive]);
      [v26 setObject:v45 forKeyedSubscript:@"IsANEIntensive"];

      v46 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 gpuIntensive]);
      [v26 setObject:v46 forKeyedSubscript:@"IsGPUIntensive"];

      id v47 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 requiresPlugin]);
      [v26 setObject:v47 forKeyedSubscript:@"RequiresPlugin"];

      v48 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 requiresNetwork]);
      [v26 setObject:v48 forKeyedSubscript:@"RequiresNetwork"];

      v49 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 requiresInexpensiveNetworking]);
      [v26 setObject:v49 forKeyedSubscript:@"RequiresInexpensiveNetworking"];

      v50 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 requiresUnconstrainedNetworking]);
      [v26 setObject:v50 forKeyedSubscript:@"RequiresUnconstrainedNetworking"];

      v51 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 requiresDeviceInactivity]);
      [v26 setObject:v51 forKeyedSubscript:@"RequiresDeviceInactivity"];

      v52 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 requiresSignificantUserInactivity]);
      [v26 setObject:v52 forKeyedSubscript:@"RequiresSignificantUserInactivity"];

      v53 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 triggersRestart]);
      [v26 setObject:v53 forKeyedSubscript:@"TriggersRestart"];

      [v26 setObject:&off_100187768 forKeyedSubscript:@"Energy"];
      v54 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v4 transferSize]);
      [v26 setObject:v54 forKeyedSubscript:@"NetworkTaskSize"];

      [v4 predictedOptimalScore];
      v56 = [(_DASPLLogger *)self numberFromDouble:v55 * 100.0];
      [v26 setObject:v56 forKeyedSubscript:@"OptimalScore"];

      v57 = [v4 limitationResponse];
      id v58 = [v57 count];

      if (v58)
      {
        v59 = [v4 limitationResponse];
        id v60 = +[_DASLimiterResponse bitmaskFromResponses:v59];

        v61 = +[NSNumber numberWithUnsignedInteger:v60];
        [v26 setObject:v61 forKeyedSubscript:@"Limitations"];
      }
      id v62 = v4;
      objc_sync_enter(v62);
      v63 = [v62 policyResponseMetadata];
      v64 = [v63 objectForKeyedSubscript:@"scoreWhenRun"];

      if (v64)
      {
        [v64 score];
        double v66 = v65;
        v67 = [(_DASPLLogger *)self numberFromDouble:v65 * 100.0];
        [v26 setObject:v67 forKeyedSubscript:@"ScoreWhenRun"];
      }
      else
      {
        double v66 = -1.0;
        [v26 setObject:&off_1001877B0 forKeyedSubscript:@"ScoreWhenRun"];
      }

      objc_sync_exit(v62);
      [v62 predictedOptimalScore];
      v69 = [(_DASPLLogger *)self numberFromDouble:v66 / v68 * 100.0];
      [v26 setObject:v69 forKeyedSubscript:@"OptimalScorePercentage"];

      v70 = [v62 bundleId];

      if (v70)
      {
        v71 = [v62 bundleId];
        [v26 setObject:v71 forKeyedSubscript:@"BundleID"];
      }
      v72 = [v62 relatedApplications];
      v73 = [(_DASPLLogger *)self commaDelimitedEntriesFrom:v72];

      if (v73) {
        [v26 setObject:v73 forKeyedSubscript:@"Application"];
      }
      v74 = [v62 involvedProcesses];
      v75 = [(_DASPLLogger *)self commaDelimitedEntriesFrom:v74];

      if (v75) {
        [v26 setObject:v75 forKeyedSubscript:@"InvolvedProcesses"];
      }
      v76 = +[_DASDaemonLogger logForCategory:@"powerlog"];
      if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG)) {
        sub_1001010B4((uint64_t)v26, v76);
      }

      PLLogRegisteredEvent();
      v77 = +[_DASPPSDataManager sharedInstance];
      [v77 sendDataToPPS:v26 subsystem:@"BackgroundProcessing" category:@"DASActivityLifecycle"];

      [(_DASPLLogger *)self recordCAEventsForActivity:v62 withParams:v26];
    }
    else
    {
      os_unfair_lock_unlock(&self->_lock);
    }
  }
}

- (void)recordCAEventsForActivity:(id)a3 withParams:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  id v7 = [v18 startDate];
  double v8 = [v18 startBefore];
  [v7 timeIntervalSinceDate:v8];
  uint64_t v10 = (uint64_t)v9;

  id v11 = +[NSNumber numberWithInteger:v10 & ~(v10 >> 63)];
  [(_DASPLLogger *)self sendAnalyticsEventForStream:@"com.apple.dasd.metrics.starvation_durations" withActivity:v18 withMetricValueKey:@"TimeInSeconds" withMetricValue:v11];

  id v12 = [v6 objectForKeyedSubscript:@"Duration"];
  uint64_t v13 = (int)[v12 intValue];

  unint64_t v14 = +[NSNumber numberWithInteger:v13];
  [(_DASPLLogger *)self sendAnalyticsEventForStream:@"com.apple.dasd.metrics.runtime_durations" withActivity:v18 withMetricValueKey:@"TimeInSeconds" withMetricValue:v14];

  long long v15 = [v18 suspendRequestDate];

  if (v15) {
    [(_DASPLLogger *)self sendAnalyticsEventForStream:@"com.apple.dasd.metrics.suspension_count" withActivity:v18 withMetricValueKey:@"Occurrences" withMetricValue:&off_100187780];
  }
  double v16 = [v6 objectForKeyedSubscript:@"BeyondDeadline"];
  unsigned int v17 = [v16 BOOLValue];

  if (v17) {
    [(_DASPLLogger *)self sendAnalyticsEventForStream:@"com.apple.dasd.metrics.starvation_count" withActivity:v18 withMetricValueKey:@"Occurrences" withMetricValue:&off_100187780];
  }
  [(_DASPLLogger *)self sendAnalyticsEventForStream:@"com.apple.dasd.metrics.run_count" withActivity:v18 withMetricValueKey:@"Occurrences" withMetricValue:&off_100187780];
}

- (void)sendAnalyticsEventForStream:(id)a3 withActivity:(id)a4 withMetricValueKey:(id)a5 withMetricValue:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = a3;
  uint64_t v13 = +[_DASActivity prettySchedulingPriorityDescription:](_DASActivity, "prettySchedulingPriorityDescription:", [v9 schedulingPriority]);
  unint64_t v14 = [v9 fileProtection];
  long long v15 = +[_DASFileProtection complete];
  unsigned __int8 v16 = [v14 isEqual:v15];

  if (v16)
  {
    CFStringRef v17 = @"Fa";
  }
  else
  {
    id v18 = [v9 fileProtection];
    long long v19 = +[_DASFileProtection completeUnlessOpen];
    unsigned __int8 v20 = [v18 isEqual:v19];

    if (v20)
    {
      CFStringRef v17 = @"Fb";
    }
    else
    {
      long long v21 = [v9 fileProtection];
      long long v22 = +[_DASFileProtection none];
      unsigned int v23 = [v21 isEqual:v22];

      if (v23) {
        CFStringRef v17 = @"-";
      }
      else {
        CFStringRef v17 = @"Fc";
      }
    }
  }
  +[_DASTrialManager sharedInstanceForNamespace:@"COREOS_DAS"];
  long long v29 = v13;
  long long v30 = v9;
  double v31 = (__CFString *)v17;
  double v32 = v10;
  __int16 v34 = v33 = v11;
  id v24 = v34;
  id v25 = v11;
  id v26 = v10;
  id v27 = v9;
  id v28 = v13;
  AnalyticsSendEventLazy();
}

- (unint64_t)uptime
{
  return clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
}

- (id)processNameFromPID:(int)a3
{
  memset(v5, 0, sizeof(v5));
  proc_name(a3, v5, 0x200u);
  id v3 = +[NSString stringWithUTF8String:v5];

  return v3;
}

- (OS_dispatch_source)shortPeriodTimer
{
  return self->_shortPeriodTimer;
}

- (void)setShortPeriodTimer:(id)a3
{
}

- (OS_dispatch_source)longPeriodTimer
{
  return self->_longPeriodTimer;
}

- (void)setLongPeriodTimer:(id)a3
{
}

- (OS_dispatch_source)dailyPeriodTimer
{
  return self->_dailyPeriodTimer;
}

- (void)setDailyPeriodTimer:(id)a3
{
}

- (OS_dispatch_queue)syncQueue
{
  return self->_syncQueue;
}

- (void)setSyncQueue:(id)a3
{
}

- (NSDate)lastCoalesced
{
  return self->_lastCoalesced;
}

- (void)setLastCoalesced:(id)a3
{
}

- (NSMutableDictionary)multiplier
{
  return self->_multiplier;
}

- (void)setMultiplier:(id)a3
{
}

- (int)eventsCoalesced
{
  return self->_eventsCoalesced;
}

- (void)setEventsCoalesced:(int)a3
{
  self->_eventsCoalesced = a3;
}

- (BOOL)powerLogExists
{
  return self->_powerLogExists;
}

- (void)setPowerLogExists:(BOOL)a3
{
  self->_powerLogExists = a3;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (NSMutableDictionary)triggerReport
{
  return self->_triggerReport;
}

- (void)setTriggerReport:(id)a3
{
}

- (NSArray)triggers
{
  return self->_triggers;
}

- (void)setTriggers:(id)a3
{
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
}

- (NSMutableDictionary)activityToLifeCycle
{
  return self->_activityToLifeCycle;
}

- (void)setActivityToLifeCycle:(id)a3
{
}

- (int)taskCount
{
  return self->_taskCount;
}

- (void)setTaskCount:(int)a3
{
  self->_taskCount = a3;
}

- (int)appPredictionCount
{
  return self->_appPredictionCount;
}

- (void)setAppPredictionCount:(int)a3
{
  self->_appPredictionCount = a3;
}

- (int)droppedCount
{
  return self->_droppedCount;
}

- (void)setDroppedCount:(int)a3
{
  self->_droppedCount = a3;
}

- (NSMutableArray)activities
{
  return self->_activities;
}

- (void)setActivities:(id)a3
{
}

- (NSMutableDictionary)predictions
{
  return self->_predictions;
}

- (void)setPredictions:(id)a3
{
}

- (NSMutableDictionary)appPredictions
{
  return self->_appPredictions;
}

- (void)setAppPredictions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appPredictions, 0);
  objc_storeStrong((id *)&self->_predictions, 0);
  objc_storeStrong((id *)&self->_activities, 0);
  objc_storeStrong((id *)&self->_activityToLifeCycle, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_storeStrong((id *)&self->_triggerReport, 0);
  objc_storeStrong((id *)&self->_multiplier, 0);
  objc_storeStrong((id *)&self->_lastCoalesced, 0);
  objc_storeStrong((id *)&self->_syncQueue, 0);
  objc_storeStrong((id *)&self->_dailyPeriodTimer, 0);
  objc_storeStrong((id *)&self->_longPeriodTimer, 0);

  objc_storeStrong((id *)&self->_shortPeriodTimer, 0);
}

@end