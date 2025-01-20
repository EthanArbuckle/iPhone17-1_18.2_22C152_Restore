@interface OSIntelligenceAnalyticsManager
+ (id)currentBootSessionUUID;
+ (id)log;
+ (id)logWithCategory:(id)a3;
+ (id)sharedInstanceWithTrialClient:(id)a3 withNamespace:(id)a4;
+ (int)bucketLuxValue:(int)a3;
- (NSDate)enabledDate;
- (NSMutableDictionary)analytics;
- (NSMutableDictionary)currentData;
- (NSMutableDictionary)interruptionMetrics;
- (NSString)trialNamespace;
- (NSUserDefaults)defaults;
- (OSIAlarmMonitor)alarmMonitor;
- (OSIAmbientLightMonitor)lightMonitor;
- (OSIMotionMonitor)motionMonitor;
- (OSIntelligenceAnalyticsManager)initWithTrialClient:(id)a3 withNamespace:(id)a4;
- (OS_dispatch_queue)queue;
- (TRIClient)trialClient;
- (void)handleNewExitState;
- (void)handleNewInterruptNotificationStart:(BOOL)a3;
- (void)handleNewSPNState:(unint64_t)a3;
- (void)queryHistoricalInactivityState;
- (void)saveNextAlarmInterval:(id)a3 nextDNDInterval:(id)a4 predictionInterval:(id)a5 recommendedWait:(id)a6 deadlineSetter:(id)a7 modelConfidenceLevel:(int64_t)a8 withPredictor:(id)a9;
- (void)setAlarmMonitor:(id)a3;
- (void)setAnalytics:(id)a3;
- (void)setCurrentData:(id)a3;
- (void)setDefaults:(id)a3;
- (void)setEnabledDate:(id)a3;
- (void)setInterruptionMetrics:(id)a3;
- (void)setLightMonitor:(id)a3;
- (void)setMotionMonitor:(id)a3;
- (void)setQueue:(id)a3;
- (void)setTrialClient:(id)a3;
- (void)setTrialNamespace:(id)a3;
@end

@implementation OSIntelligenceAnalyticsManager

+ (id)logWithCategory:(id)a3
{
  id v3 = +[NSString stringWithFormat:@"inactivity.%@", a3];
  os_log_t v4 = os_log_create("com.apple.osintelligence", (const char *)[v3 UTF8String]);

  return v4;
}

+ (id)log
{
  return [a1 logWithCategory:@"inactivity.analytics"];
}

+ (id)currentBootSessionUUID
{
  size_t size = 0;
  sysctlbyname("kern.bootsessionuuid", 0, &size, 0, 0);
  v2 = malloc_type_malloc(size, 0x71284021uLL);
  sysctlbyname("kern.bootsessionuuid", v2, &size, 0, 0);
  id v3 = +[NSString stringWithUTF8String:v2];
  free(v2);

  return v3;
}

- (OSIntelligenceAnalyticsManager)initWithTrialClient:(id)a3 withNamespace:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v38.receiver = self;
  v38.super_class = (Class)OSIntelligenceAnalyticsManager;
  v9 = [(OSIntelligenceAnalyticsManager *)&v38 init];
  if (v9)
  {
    v10 = (NSUserDefaults *)[objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.powerd.smartpowernap"];
    defaults = v9->_defaults;
    v9->_defaults = v10;

    v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.SPN.queue", v12);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v13;

    v15 = objc_alloc_init(OSIAmbientLightMonitor);
    lightMonitor = v9->_lightMonitor;
    v9->_lightMonitor = v15;

    v17 = objc_alloc_init(OSIAlarmMonitor);
    alarmMonitor = v9->_alarmMonitor;
    v9->_alarmMonitor = v17;

    v19 = objc_alloc_init(OSIMotionMonitor);
    motionMonitor = v9->_motionMonitor;
    v9->_motionMonitor = v19;

    objc_storeStrong((id *)&v9->_trialClient, a3);
    objc_storeStrong((id *)&v9->_trialNamespace, a4);
    v21 = [(NSUserDefaults *)v9->_defaults stringForKey:@"lastBootUUID"];
    v22 = +[OSIntelligenceAnalyticsManager currentBootSessionUUID];
    [(NSUserDefaults *)v9->_defaults setObject:v22 forKey:@"lastBootUUID"];
    char v23 = [v22 isEqualToString:v21] ^ 1;
    v24 = [(OSIntelligenceAnalyticsManager *)v9 queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100020670;
    block[3] = &unk_100064F08;
    v25 = v9;
    v36 = v25;
    char v37 = v23;
    dispatch_sync(v24, block);

    int out_token = 0;
    v26 = dispatch_get_global_queue(-32768, 0);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10002090C;
    handler[3] = &unk_100064800;
    v27 = v25;
    v33 = v27;
    notify_register_dispatch("com.apple.powerd.smartpowernap", &out_token, v26, handler);

    int v31 = 0;
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100020A70;
    v29[3] = &unk_100064800;
    v30 = v27;
    notify_register_dispatch("com.apple.powerd.smartpowernap.interruption", &v31, v26, v29);
  }
  return v9;
}

+ (id)sharedInstanceWithTrialClient:(id)a3 withNamespace:(id)a4
{
  id v6 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100020CD8;
  block[3] = &unk_100064F58;
  id v14 = a4;
  id v15 = a1;
  id v13 = v6;
  uint64_t v7 = qword_10007A890;
  id v8 = v14;
  id v9 = v6;
  if (v7 != -1) {
    dispatch_once(&qword_10007A890, block);
  }
  id v10 = (id)qword_10007A898;

  return v10;
}

- (void)handleNewSPNState:(unint64_t)a3
{
  v5 = +[NSDate now];
  id v6 = v5;
  switch(a3)
  {
    case 0uLL:
      id v10 = [(NSMutableDictionary *)self->_analytics objectForKeyedSubscript:@"disabledDate"];

      if (!v10) {
        [(OSIntelligenceAnalyticsManager *)self handleNewExitState];
      }
      v11 = [(NSMutableDictionary *)self->_analytics objectForKeyedSubscript:@"transientDisabledDate"];

      if (v11)
      {
        v12 = [(NSMutableDictionary *)self->_analytics objectForKeyedSubscript:@"transientDisabledDate"];
        [(NSMutableDictionary *)self->_analytics setObject:v12 forKeyedSubscript:@"disabledDate"];

        analytics = self->_analytics;
        goto LABEL_11;
      }
      [v6 timeIntervalSinceReferenceDate];
      id v13 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      id v14 = self->_analytics;
      CFStringRef v15 = @"disabledDate";
      goto LABEL_14;
    case 1uLL:
      [v5 timeIntervalSinceReferenceDate];
      id v13 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      id v14 = self->_analytics;
      CFStringRef v15 = @"transientDisabledDate";
LABEL_14:
      [(NSMutableDictionary *)v14 setObject:v13 forKeyedSubscript:v15];

      break;
    case 2uLL:
      uint64_t v7 = [(NSMutableDictionary *)self->_analytics objectForKeyedSubscript:@"transientDisabledDate"];

      if (!v7)
      {
        [v6 timeIntervalSinceReferenceDate];
        v16 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        [(NSMutableDictionary *)self->_analytics setObject:v16 forKeyedSubscript:@"enabledDate"];

        v17 = [(NSMutableDictionary *)self->_currentData objectForKeyedSubscript:@"recommendedWait"];
        [(NSMutableDictionary *)self->_analytics setObject:v17 forKeyedSubscript:@"recommendedWait"];

        v18 = [(NSMutableDictionary *)self->_currentData objectForKeyedSubscript:@"nextAlarmInterval"];
        [(NSMutableDictionary *)self->_analytics setObject:v18 forKeyedSubscript:@"nextAlarmInterval"];

        v19 = [(NSMutableDictionary *)self->_currentData objectForKeyedSubscript:@"nextDNDInterval"];
        [(NSMutableDictionary *)self->_analytics setObject:v19 forKeyedSubscript:@"nextDNDInterval"];

        v20 = [(NSMutableDictionary *)self->_currentData objectForKeyedSubscript:@"prediction"];
        [(NSMutableDictionary *)self->_analytics setObject:v20 forKeyedSubscript:@"prediction"];

        v21 = [(NSMutableDictionary *)self->_currentData objectForKeyedSubscript:@"predictorType"];
        [(NSMutableDictionary *)self->_analytics setObject:v21 forKeyedSubscript:@"predictorType"];

        v22 = [(NSMutableDictionary *)self->_currentData objectForKeyedSubscript:@"queryingMechanism"];
        [(NSMutableDictionary *)self->_analytics setObject:v22 forKeyedSubscript:@"queryingMechanism"];

        char v23 = [(NSMutableDictionary *)self->_currentData objectForKeyedSubscript:@"longThreshold"];
        [(NSMutableDictionary *)self->_analytics setObject:v23 forKeyedSubscript:@"longThreshold"];

        v24 = [(NSMutableDictionary *)self->_currentData objectForKeyedSubscript:@"deadlineSetter"];
        [(NSMutableDictionary *)self->_analytics setObject:v24 forKeyedSubscript:@"deadlineSetter"];

        v25 = [(NSMutableDictionary *)self->_currentData objectForKeyedSubscript:@"modelConfidenceLevel"];
        [(NSMutableDictionary *)self->_analytics setObject:v25 forKeyedSubscript:@"modelConfidenceLevel"];

        [(NSMutableDictionary *)self->_analytics setObject:0 forKeyedSubscript:@"transientDisabledDate"];
        [(NSMutableDictionary *)self->_analytics setObject:0 forKeyedSubscript:@"disabledDate"];
        [(NSMutableDictionary *)self->_analytics setObject:&off_100068DF8 forKeyedSubscript:@"interruptionCount"];
        if (+[_OSInactivityPredictor isDeviceRarelyUsedRecently])
        {
          CFStringRef v26 = @"mostly idle";
        }
        else
        {
          CFStringRef v26 = @"rarely idle";
        }
        [(NSMutableDictionary *)self->_analytics setObject:v26 forKeyedSubscript:@"deviceIdleFrequency"];
        v27 = +[NSNumber numberWithInt:[(OSIAmbientLightMonitor *)self->_lightMonitor currentAmbientLightLevel]];
        [(NSMutableDictionary *)self->_analytics setObject:v27 forKeyedSubscript:@"startLuxValue"];

        v28 = [(TRIClient *)self->_trialClient levelForFactor:@"stationaryLookback" withNamespaceName:self->_trialNamespace];
        [v28 doubleValue];
        double v30 = v29;

        [(OSIMotionMonitor *)self->_motionMonitor percentStationaryOverDuration:v30];
        int v31 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        [(NSMutableDictionary *)self->_analytics setObject:v31 forKeyedSubscript:@"startMotionValue"];

        currentData = self->_currentData;
        self->_currentData = 0;

        [(NSUserDefaults *)self->_defaults removeObjectForKey:@"currentData"];
        break;
      }
      id v8 = [(NSMutableDictionary *)self->_analytics objectForKeyedSubscript:@"transientDisabledDate"];

      if (v8)
      {
        analytics = self->_analytics;
LABEL_11:
        [(NSMutableDictionary *)analytics setObject:0 forKeyedSubscript:@"transientDisabledDate"];
      }
      break;
  }
  v33 = +[OSIntelligenceAnalyticsManager log];
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    v34 = +[NSNumber numberWithUnsignedLongLong:a3];
    v35 = self->_analytics;
    int v36 = 138412546;
    char v37 = v34;
    __int16 v38 = 2112;
    v39 = v35;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "SPN state %@ - analytics is %@", (uint8_t *)&v36, 0x16u);
  }
  [(NSUserDefaults *)self->_defaults setObject:self->_analytics forKey:@"analytics"];
}

- (void)queryHistoricalInactivityState
{
  id v3 = +[NSDate now];
  os_log_t v4 = [v3 dateByAddingTimeInterval:-3600.0];
  v5 = [v3 dateByAddingTimeInterval:-88200.0];
  id v6 = [v3 dateByAddingTimeInterval:-84600.0];
  uint64_t v7 = +[_OSLockHistory sharedInstance];
  id v8 = [v7 unlockEventsIntersectingDateRangeFrom:v5 to:v6];
  +[OSIntelligenceUtilities sumDurationsOfEvents:v8 intersectingDateRangeFrom:v5 to:v6];
  double v10 = v9;
  v11 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v8 count]);
  [(NSMutableDictionary *)self->_analytics setObject:v11 forKeyedSubscript:@"activityCountYesterday"];

  v12 = +[NSNumber numberWithDouble:v10];
  [(NSMutableDictionary *)self->_analytics setObject:v12 forKeyedSubscript:@"activityDurationYesterday"];

  id v13 = +[OSIntelligenceAnalyticsManager log];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    char v23 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v8 count]);
    v22 = +[NSNumber numberWithDouble:v10];
    *(_DWORD *)buf = 138413058;
    v25 = v5;
    __int16 v26 = 2112;
    v27 = v6;
    __int16 v28 = 2112;
    double v29 = v23;
    __int16 v30 = 2112;
    int v31 = v22;
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Activity yesterday same hour (%@ - %@) count = %@, cumulative duration = %@.", buf, 0x2Au);
  }
  id v14 = [v7 unlockEventsIntersectingDateRangeFrom:v4 to:v3];
  +[OSIntelligenceUtilities sumDurationsOfEvents:v14 intersectingDateRangeFrom:v4 to:v3];
  double v16 = v15;
  v17 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v14 count]);
  [(NSMutableDictionary *)self->_analytics setObject:v17 forKeyedSubscript:@"activityCountLastHour"];

  v18 = +[NSNumber numberWithDouble:v16];
  [(NSMutableDictionary *)self->_analytics setObject:v18 forKeyedSubscript:@"activityDurationLastHour"];

  v19 = +[OSIntelligenceAnalyticsManager log];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    v20 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v14 count]);
    v21 = +[NSNumber numberWithDouble:v16];
    *(_DWORD *)buf = 138413058;
    v25 = v4;
    __int16 v26 = 2112;
    v27 = v3;
    __int16 v28 = 2112;
    double v29 = v20;
    __int16 v30 = 2112;
    int v31 = v21;
    _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "Activity last hour (%@ - %@) count = %@, cumulative duration = %@.", buf, 0x2Au);
  }
}

- (void)saveNextAlarmInterval:(id)a3 nextDNDInterval:(id)a4 predictionInterval:(id)a5 recommendedWait:(id)a6 deadlineSetter:(id)a7 modelConfidenceLevel:(int64_t)a8 withPredictor:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a9;
  currentData = self->_currentData;
  if (currentData)
  {
    v22 = currentData;
  }
  else
  {
    v22 = +[NSMutableDictionary dictionary];
  }
  char v23 = self->_currentData;
  self->_currentData = v22;

  [(NSMutableDictionary *)self->_currentData setObject:v15 forKeyedSubscript:@"nextAlarmInterval"];
  [(NSMutableDictionary *)self->_currentData setObject:v16 forKeyedSubscript:@"nextDNDInterval"];
  [(NSMutableDictionary *)self->_currentData setObject:v17 forKeyedSubscript:@"prediction"];
  [(NSMutableDictionary *)self->_currentData setObject:v18 forKeyedSubscript:@"recommendedWait"];
  v24 = [v20 predictorType];
  [(NSMutableDictionary *)self->_currentData setObject:v24 forKeyedSubscript:@"predictorType"];

  v25 = [v20 queryingMechanism];
  [(NSMutableDictionary *)self->_currentData setObject:v25 forKeyedSubscript:@"queryingMechanism"];

  [v20 longThreshold];
  __int16 v26 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [(NSMutableDictionary *)self->_currentData setObject:v26 forKeyedSubscript:@"longThreshold"];

  v27 = [v20 modelVersion];
  [(NSMutableDictionary *)self->_currentData setObject:v27 forKeyedSubscript:@"modelVersion"];

  [(NSMutableDictionary *)self->_currentData setObject:v19 forKeyedSubscript:@"deadlineSetter"];
  __int16 v28 = +[NSNumber numberWithInteger:a8];
  [(NSMutableDictionary *)self->_currentData setObject:v28 forKeyedSubscript:@"modelConfidenceLevel"];

  [(NSUserDefaults *)self->_defaults setObject:self->_currentData forKey:@"currentData"];
  double v29 = +[OSIntelligenceAnalyticsManager log];
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v30 = self->_currentData;
    int v31 = 138412290;
    v32 = v30;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Saving prediction state %@", (uint8_t *)&v31, 0xCu);
  }
}

- (void)handleNewInterruptNotificationStart:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = +[NSDate now];
  [v5 timeIntervalSinceReferenceDate];
  p_analytics = &self->_analytics;
  analytics = self->_analytics;
  if (!v3)
  {
    double v18 = v6;
    id v19 = [(NSMutableDictionary *)analytics objectForKeyedSubscript:@"interruption"];

    if (!v19) {
      goto LABEL_67;
    }
    v12 = [(NSMutableDictionary *)*p_analytics objectForKeyedSubscript:@"interruption"];
    id v20 = [v12 objectForKeyedSubscript:@"interruptStartInterval"];

    if (!v20)
    {
      v41 = +[OSIntelligenceAnalyticsManager log];
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
        sub_100042CB8(v41);
      }
      goto LABEL_66;
    }
    v21 = +[NSMutableDictionary dictionary];
    v22 = [v12 objectForKeyedSubscript:@"interruptStartInterval"];
    [v22 doubleValue];
    double v24 = v23;

    v25 = +[NSNumber numberWithDouble:v18 - v24];
    [v21 setObject:v25 forKeyedSubscript:@"interruptionDuration"];

    uint64_t v26 = [(NSMutableDictionary *)*p_analytics objectForKeyedSubscript:@"recommendedWait"];
    v27 = (void *)v26;
    __int16 v28 = &off_100068E10;
    if (v26) {
      __int16 v28 = (_UNKNOWN **)v26;
    }
    double v29 = v28;

    [v29 doubleValue];
    double v31 = v30;

    v32 = [(NSMutableDictionary *)*p_analytics objectForKeyedSubscript:@"enabledDate"];
    v33 = [(NSMutableDictionary *)*p_analytics objectForKeyedSubscript:@"prediction"];
    v110 = v32;
    if (v32)
    {
      [v32 doubleValue];
      double v35 = v34 - v31;
      double v36 = (v24 - (v34 - v31)) / 3600.0;
      float v37 = v36;
      *(float *)&double v36 = v37;
      __int16 v38 = +[NSNumber numberWithFloat:v36];
      [v21 setObject:v38 forKeyedSubscript:@"intrTimeSinceInactivityStart"];

      if (v33)
      {
        [v33 doubleValue];
        *(float *)&double v39 = v37 / ((v39 - v35) / 3600.0);
        if (*(float *)&v39 >= 0.0)
        {
          v40 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
          [v21 setObject:v40 forKeyedSubscript:@"intrPctInSession"];
        }
        else
        {
          v40 = +[OSIntelligenceAnalyticsManager log];
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
            sub_100042CFC((uint64_t *)&self->_analytics, v40);
          }
        }

        goto LABEL_24;
      }
    }
    else
    {
      [v21 setObject:&off_100068E28 forKeyedSubscript:@"intrTimeSinceInactivityStart"];
      if (v33)
      {
LABEL_24:
        [v33 doubleValue];
        double v44 = (v43 - v24) / 3600.0;
        *(float *)&double v44 = v44;
        v45 = +[NSNumber numberWithFloat:v44];
        [v21 setObject:v45 forKeyedSubscript:@"intrTimeUntilPredictionEnd"];

        goto LABEL_25;
      }
    }
    [v21 setObject:&off_100068E28 forKeyedSubscript:@"intrTimeUntilPredictionEnd"];
LABEL_25:
    v109 = v33;
    v46 = [v12 objectForKeyedSubscript:@"intrLuxValue"];
    v111 = v12;
    if (v46)
    {
      v47 = [v12 objectForKeyedSubscript:@"intrLuxValue"];
      v48 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v47 intValue]);
      [v21 setObject:v48 forKeyedSubscript:@"intrLuxValue"];
    }
    else
    {
      [v21 setObject:&off_100068E28 forKeyedSubscript:@"intrLuxValue"];
    }

    v49 = [(NSMutableDictionary *)*p_analytics objectForKeyedSubscript:@"nextAlarmInterval"];

    if (v49)
    {
      v50 = [(NSMutableDictionary *)*p_analytics objectForKeyedSubscript:@"nextAlarmInterval"];
      [v50 doubleValue];
      double v52 = v51;

      double v53 = (v52 - v24) / 3600.0;
      *(float *)&double v53 = v53;
      v54 = +[NSNumber numberWithFloat:v53];
      [v21 setObject:v54 forKeyedSubscript:@"intrTimeUntilNextAlarm"];
    }
    else
    {
      [v21 setObject:&off_100068E28 forKeyedSubscript:@"intrTimeUntilNextAlarm"];
    }
    v55 = [(NSMutableDictionary *)*p_analytics objectForKeyedSubscript:@"nextDNDInterval"];
    v108 = v55;
    if (v55)
    {
      [v55 doubleValue];
      double v57 = (v56 - v24) / 3600.0;
      *(float *)&double v57 = v57;
      v58 = +[NSNumber numberWithFloat:v57];
      [v21 setObject:v58 forKeyedSubscript:@"intrTimeUntilEndOfDnd"];
    }
    else
    {
      [v21 setObject:&off_100068E28 forKeyedSubscript:@"intrTimeUntilEndOfDnd"];
    }
    uint64_t v59 = [(NSMutableDictionary *)self->_analytics objectForKeyedSubscript:@"activityCountYesterday"];
    v60 = (void *)v59;
    if (v59) {
      v61 = (_UNKNOWN **)v59;
    }
    else {
      v61 = &off_100068E28;
    }
    [v21 setObject:v61 forKeyedSubscript:@"intrActivityCountYesterdaySameHour"];

    uint64_t v62 = [(NSMutableDictionary *)self->_analytics objectForKeyedSubscript:@"activityDurationYesterday"];
    v63 = (void *)v62;
    if (v62) {
      v64 = (_UNKNOWN **)v62;
    }
    else {
      v64 = &off_100068E28;
    }
    [v21 setObject:v64 forKeyedSubscript:@"intrActivityDurationYesterdaySameHour"];

    uint64_t v65 = [(NSMutableDictionary *)self->_analytics objectForKeyedSubscript:@"activityCountLastHour"];
    v66 = (void *)v65;
    if (v65) {
      v67 = (_UNKNOWN **)v65;
    }
    else {
      v67 = &off_100068E28;
    }
    [v21 setObject:v67 forKeyedSubscript:@"intrActivityCountLastHour"];

    uint64_t v68 = [(NSMutableDictionary *)self->_analytics objectForKeyedSubscript:@"activityDurationLastHour"];
    v69 = (void *)v68;
    if (v68) {
      v70 = (_UNKNOWN **)v68;
    }
    else {
      v70 = &off_100068E28;
    }
    [v21 setObject:v70 forKeyedSubscript:@"intrActivityDurationLastHour"];

    v71 = [(NSMutableDictionary *)self->_analytics objectForKeyedSubscript:@"predictorType"];
    [v21 setObject:v71 forKeyedSubscript:@"predictorType"];

    v72 = [(NSMutableDictionary *)self->_analytics objectForKeyedSubscript:@"longThreshold"];
    [v21 setObject:v72 forKeyedSubscript:@"longThreshold"];

    v73 = [(TRIClient *)self->_trialClient treatmentIdWithNamespaceName:self->_trialNamespace];
    v74 = [v73 description];

    if (v74) {
      CFStringRef v75 = v74;
    }
    else {
      CFStringRef v75 = @"None";
    }
    [v21 setObject:v75 forKeyedSubscript:@"treatmentId"];
    v76 = [(TRIClient *)self->_trialClient rolloutIdentifiersWithNamespaceName:self->_trialNamespace];
    v77 = [v76 description];

    if (v77) {
      CFStringRef v78 = v77;
    }
    else {
      CFStringRef v78 = @"None";
    }
    [v21 setObject:v78 forKeyedSubscript:@"rolloutId"];
    v79 = [(TRIClient *)self->_trialClient experimentIdentifiersWithNamespaceName:self->_trialNamespace];
    uint64_t v80 = [v79 description];

    v107 = (void *)v80;
    if (v80) {
      CFStringRef v81 = (const __CFString *)v80;
    }
    else {
      CFStringRef v81 = @"None";
    }
    [v21 setObject:v81 forKeyedSubscript:@"experimentId"];
    v82 = [(NSMutableDictionary *)self->_analytics objectForKeyedSubscript:@"interruptionCount"];
    [v21 setObject:v82 forKeyedSubscript:@"interruptionIndex"];

    uint64_t v83 = [(NSMutableDictionary *)self->_analytics objectForKeyedSubscript:@"modelVersion"];
    v84 = (void *)v83;
    if (v83) {
      CFStringRef v85 = (const __CFString *)v83;
    }
    else {
      CFStringRef v85 = @"None";
    }
    [v21 setObject:v85 forKeyedSubscript:@"modelVersion"];

    [v21 setObject:@"ospredictiond" forKeyedSubscript:@"processName"];
    v86 = [(NSMutableDictionary *)self->_analytics objectForKeyedSubscript:@"deviceIdleFrequency"];
    [v21 setObject:v86 forKeyedSubscript:@"deviceIdleFrequency"];

    v87 = [(NSMutableDictionary *)self->_analytics objectForKeyedSubscript:@"queryingMechanism"];
    [v21 setObject:v87 forKeyedSubscript:@"queryType"];

    v88 = +[NSMutableDictionary dictionary];
    v89 = [v21 objectForKeyedSubscript:@"interruptionDuration"];
    [v88 setObject:v89 forKeyedSubscript:@"interruptionDuration"];

    v90 = [v21 objectForKeyedSubscript:@"intrLuxValue"];
    [v88 setObject:v90 forKeyedSubscript:@"intrLuxValue"];

    v91 = [v21 objectForKeyedSubscript:@"intrTimeUntilNextAlarm"];
    [v91 doubleValue];
    v93 = +[NSNumber numberWithDouble:round(v92)];
    [v88 setObject:v93 forKeyedSubscript:@"intrTimeUntilNextAlarm"];

    v94 = [v21 objectForKeyedSubscript:@"intrTimeUntilEndOfDnd"];
    [v94 doubleValue];
    v96 = +[NSNumber numberWithDouble:round(v95)];
    [v88 setObject:v96 forKeyedSubscript:@"intrTimeUntilEndOfDnd"];

    v97 = [v21 objectForKeyedSubscript:@"intrActivityDurationYesterdaySameHour"];
    [v88 setObject:v97 forKeyedSubscript:@"intrActivityDurationYesterdaySameHour"];

    v98 = [v21 objectForKeyedSubscript:@"intrActivityDurationLastHour"];
    [v88 setObject:v98 forKeyedSubscript:@"intrActivityDurationLastHour"];

    v99 = [v21 objectForKeyedSubscript:@"intrActivityCountYesterdaySameHour"];
    [v88 setObject:v99 forKeyedSubscript:@"intrActivityCountYesterdaySameHour"];

    v100 = [v21 objectForKeyedSubscript:@"intrActivityCountLastHour"];
    [v88 setObject:v100 forKeyedSubscript:@"intrActivityCountLastHour"];

    v101 = [v21 objectForKeyedSubscript:@"deviceIdleFrequency"];
    if ([v101 isEqualToString:@"rarely idle"]) {
      v102 = &off_100068DF8;
    }
    else {
      v102 = &off_100068E40;
    }
    [v88 setObject:v102 forKeyedSubscript:@"deviceIdleFrequency"];

    v41 = v21;
    AnalyticsSendEventLazy();
    id v103 = [v88 copy];
    PLLogRegisteredEvent();

    v104 = +[OSIntelligenceAnalyticsManager log];
    if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
    {
      v105 = *p_analytics;
      *(_DWORD *)buf = 138412546;
      v113 = v41;
      __int16 v114 = 2112;
      v115 = v105;
      _os_log_impl((void *)&_mh_execute_header, v104, OS_LOG_TYPE_DEFAULT, "Logging CA %@ from %@", buf, 0x16u);
    }

    v106 = [(id)objc_opt_class() logWithCategory:@"powerlog"];
    if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v113 = v88;
      _os_log_impl((void *)&_mh_execute_header, v106, OS_LOG_TYPE_DEFAULT, "Logging to Power Log: %@", buf, 0xCu);
    }

    [(NSMutableDictionary *)self->_analytics setObject:0 forKeyedSubscript:@"interruption"];
    [(NSUserDefaults *)self->_defaults setObject:self->_analytics forKey:@"analytics"];

    v12 = v111;
    goto LABEL_66;
  }
  uint64_t v9 = [(NSMutableDictionary *)analytics objectForKeyedSubscript:@"enabledDate"];
  if (v9)
  {
    double v10 = (void *)v9;
    v11 = [(NSMutableDictionary *)*p_analytics objectForKeyedSubscript:@"interruption"];

    if (!v11)
    {
      v12 = +[NSMutableDictionary dictionary];
      [v5 timeIntervalSinceReferenceDate];
      id v13 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [v12 setObject:v13 forKeyedSubscript:@"interruptStartInterval"];

      id v14 = +[NSNumber numberWithInt:[(OSIAmbientLightMonitor *)self->_lightMonitor currentAmbientLightLevel]];
      [v12 setObject:v14 forKeyedSubscript:@"intrLuxValue"];

      [(NSMutableDictionary *)self->_analytics setObject:v12 forKeyedSubscript:@"interruption"];
      id v15 = [(NSMutableDictionary *)self->_analytics objectForKeyedSubscript:@"interruptionCount"];
      if (v15)
      {
        id v16 = [(NSMutableDictionary *)*p_analytics objectForKeyedSubscript:@"interruptionCount"];
        uint64_t v17 = [v16 intValue] + 1;
      }
      else
      {
        uint64_t v17 = 1;
      }

      v42 = +[NSNumber numberWithInt:v17];
      [(NSMutableDictionary *)self->_analytics setObject:v42 forKeyedSubscript:@"interruptionCount"];

      [(NSUserDefaults *)self->_defaults setObject:self->_analytics forKey:@"interruption"];
      [(OSIntelligenceAnalyticsManager *)self queryHistoricalInactivityState];
      v41 = +[OSIntelligenceAnalyticsManager log];
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v113 = v12;
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Start interrupt with interrupt states %@", buf, 0xCu);
      }
LABEL_66:
    }
  }
LABEL_67:
}

- (void)handleNewExitState
{
  BOOL v3 = [(NSMutableDictionary *)self->_analytics objectForKeyedSubscript:@"prediction"];
  os_log_t v4 = v3;
  if (v3)
  {
    [v3 doubleValue];
    v5 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
    [v5 timeIntervalSinceNow];
    double v7 = v6;
    id v8 = [(NSMutableDictionary *)self->_analytics objectForKeyedSubscript:@"enabledDate"];

    if (v8)
    {
      uint64_t v9 = +[NSMutableDictionary dictionary];
      [v9 setObject:&off_100068DF8 forKeyedSubscript:@"suppressedDurationWithAlarm"];
      [v9 setObject:&off_100068DF8 forKeyedSubscript:@"suppressedDurationWithDND"];
      [v9 setObject:&off_100068DF8 forKeyedSubscript:@"suppressedDurationWithNoSignal"];
      double v10 = [(NSMutableDictionary *)self->_analytics objectForKeyedSubscript:@"deadlineSetter"];
      [v9 setObject:v10 forKeyedSubscript:@"deadlineSetter"];

      v11 = +[NSNumber numberWithBool:v7 > 0.0];
      [v9 setObject:v11 forKeyedSubscript:@"overPredicted"];

      v12 = +[NSNumber numberWithInt:v7 <= 0.0];
      [v9 setObject:v12 forKeyedSubscript:@"underPredicted"];

      [v9 setObject:&__kCFBooleanFalse forKeyedSubscript:@"overPredictedWithAlarm"];
      [v9 setObject:&__kCFBooleanFalse forKeyedSubscript:@"overPredictedWithDND"];
      [v9 setObject:&__kCFBooleanFalse forKeyedSubscript:@"overPredictedWithNoSignal"];
      id v13 = [(NSMutableDictionary *)self->_analytics objectForKeyedSubscript:@"predictorType"];
      [v9 setObject:v13 forKeyedSubscript:@"predictorType"];

      id v14 = [(NSMutableDictionary *)self->_analytics objectForKeyedSubscript:@"queryingMechanism"];
      [v9 setObject:v14 forKeyedSubscript:@"queryType"];

      id v15 = [(NSMutableDictionary *)self->_analytics objectForKeyedSubscript:@"longThreshold"];
      [v9 setObject:v15 forKeyedSubscript:@"longThreshold"];

      id v16 = [(TRIClient *)self->_trialClient treatmentIdWithNamespaceName:self->_trialNamespace];
      uint64_t v17 = [v16 description];

      if (v17) {
        CFStringRef v18 = v17;
      }
      else {
        CFStringRef v18 = @"None";
      }
      [v9 setObject:v18 forKeyedSubscript:@"treatmentId"];
      id v19 = [(TRIClient *)self->_trialClient rolloutIdentifiersWithNamespaceName:self->_trialNamespace];
      id v20 = [v19 description];

      if (v20) {
        CFStringRef v21 = v20;
      }
      else {
        CFStringRef v21 = @"None";
      }
      [v9 setObject:v21 forKeyedSubscript:@"rolloutId"];
      v22 = [(TRIClient *)self->_trialClient experimentIdentifiersWithNamespaceName:self->_trialNamespace];
      double v23 = [v22 description];

      if (v23) {
        CFStringRef v24 = (const __CFString *)v23;
      }
      else {
        CFStringRef v24 = @"None";
      }
      [v9 setObject:v24 forKeyedSubscript:@"experimentId"];
      v25 = [(NSMutableDictionary *)self->_analytics objectForKeyedSubscript:@"modelConfidenceLevel"];
      [v9 setObject:v25 forKeyedSubscript:@"modelConfidenceLevel"];

      uint64_t v26 = [(NSMutableDictionary *)self->_analytics objectForKeyedSubscript:@"startLuxValue"];
      if (v26)
      {
        v27 = [(NSMutableDictionary *)self->_analytics objectForKeyedSubscript:@"startLuxValue"];
        uint64_t v28 = (uint64_t)[v27 intValue];
      }
      else
      {
        uint64_t v28 = 0xFFFFFFFFLL;
      }

      double v29 = +[NSNumber numberWithInt:v28];
      [v9 setObject:v29 forKeyedSubscript:@"entryAmbientLightLevel"];

      uint64_t v30 = [(NSMutableDictionary *)self->_analytics objectForKeyedSubscript:@"startMotionValue"];
      double v31 = (void *)v30;
      if (v30) {
        v32 = (_UNKNOWN **)v30;
      }
      else {
        v32 = &off_100068E28;
      }
      [v9 setObject:v32 forKeyedSubscript:@"entryStationaryLevel" atIndex:v5];

      v33 = [(NSMutableDictionary *)self->_analytics objectForKeyedSubscript:@"recommendedWait"];
      [v9 setObject:v33 forKeyedSubscript:@"eligibleTimeout"];

      double v34 = [(NSMutableDictionary *)self->_analytics objectForKeyedSubscript:@"deviceIdleFrequency"];
      [v9 setObject:v34 forKeyedSubscript:@"deviceIdleFrequency"];

      double v35 = [(NSMutableDictionary *)self->_analytics objectForKeyedSubscript:@"recommendedWait"];
      [v9 setObject:v35 forKeyedSubscript:@"eligibleTimeout"];

      uint64_t v36 = [(NSMutableDictionary *)self->_analytics objectForKeyedSubscript:@"modelVersion"];
      float v37 = (void *)v36;
      if (v36) {
        CFStringRef v38 = (const __CFString *)v36;
      }
      else {
        CFStringRef v38 = @"None";
      }
      [v9 setObject:v38 forKeyedSubscript:@"modelVersion"];

      [v9 setObject:@"ospredictiond" forKeyedSubscript:@"processName"];
      double v39 = [(NSMutableDictionary *)self->_analytics objectForKeyedSubscript:@"enabledDate"];
      [v39 doubleValue];
      double v41 = v40;

      v42 = +[NSDate dateWithTimeIntervalSinceReferenceDate:v41];
      [v42 timeIntervalSinceNow];
      float v44 = v43 / -3600.0;
      v45 = [(NSMutableDictionary *)self->_analytics objectForKeyedSubscript:@"nextAlarmInterval"];

      if (v45)
      {
        *(float *)&double v46 = v44;
        v47 = +[NSNumber numberWithFloat:v46];
        [v9 setObject:v47 forKeyedSubscript:@"suppressedDurationWithAlarm"];

        v48 = +[NSNumber numberWithBool:v7 > 0.0];
        CFStringRef v49 = @"overPredictedWithAlarm";
      }
      else
      {
        v50 = [(NSMutableDictionary *)self->_analytics objectForKeyedSubscript:@"nextDNDInterval"];

        *(float *)&double v51 = v44;
        double v52 = +[NSNumber numberWithFloat:v51];
        if (v50)
        {
          [v9 setObject:v52 forKeyedSubscript:@"suppressedDurationWithDND"];

          v48 = +[NSNumber numberWithBool:v7 > 0.0];
          CFStringRef v49 = @"overPredictedWithDND";
        }
        else
        {
          [v9 setObject:v52 forKeyedSubscript:@"suppressedDurationWithNoSignal"];

          v48 = +[NSNumber numberWithBool:v7 > 0.0];
          CFStringRef v49 = @"overPredictedWithNoSignal";
        }
      }
      [v9 setObject:v48 forKeyedSubscript:v49];

      double v53 = +[OSIntelligenceAnalyticsManager log];
      v5 = v55;
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v58 = v9;
        _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "Logging SPN Exit Metrics %@", buf, 0xCu);
      }

      double v56 = v9;
      id v54 = v9;
      AnalyticsSendEventLazy();
    }
    else
    {
      double v23 = +[OSIntelligenceAnalyticsManager log];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        sub_100042D78(v23);
      }
    }
  }
}

+ (int)bucketLuxValue:(int)a3
{
  if (a3 < 0x3D) {
    int v3 = 6;
  }
  else {
    int v3 = 7;
  }
  if (a3 >= 0x29) {
    int v4 = v3;
  }
  else {
    int v4 = 5;
  }
  if (a3 >= 0x15) {
    int v5 = v4;
  }
  else {
    int v5 = 4;
  }
  if (a3 >= 0xB) {
    int v6 = v5;
  }
  else {
    int v6 = 3;
  }
  if (a3 >= 6) {
    int v7 = v6;
  }
  else {
    int v7 = 2;
  }
  if (a3) {
    int v8 = v7;
  }
  else {
    int v8 = 1;
  }
  if (a3 >= 0) {
    return v8;
  }
  else {
    return 0;
  }
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
}

- (NSMutableDictionary)analytics
{
  return self->_analytics;
}

- (void)setAnalytics:(id)a3
{
}

- (NSMutableDictionary)currentData
{
  return self->_currentData;
}

- (void)setCurrentData:(id)a3
{
}

- (NSMutableDictionary)interruptionMetrics
{
  return self->_interruptionMetrics;
}

- (void)setInterruptionMetrics:(id)a3
{
}

- (NSDate)enabledDate
{
  return self->_enabledDate;
}

- (void)setEnabledDate:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OSIAmbientLightMonitor)lightMonitor
{
  return self->_lightMonitor;
}

- (void)setLightMonitor:(id)a3
{
}

- (OSIAlarmMonitor)alarmMonitor
{
  return self->_alarmMonitor;
}

- (void)setAlarmMonitor:(id)a3
{
}

- (OSIMotionMonitor)motionMonitor
{
  return self->_motionMonitor;
}

- (void)setMotionMonitor:(id)a3
{
}

- (TRIClient)trialClient
{
  return self->_trialClient;
}

- (void)setTrialClient:(id)a3
{
}

- (NSString)trialNamespace
{
  return self->_trialNamespace;
}

- (void)setTrialNamespace:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialNamespace, 0);
  objc_storeStrong((id *)&self->_trialClient, 0);
  objc_storeStrong((id *)&self->_motionMonitor, 0);
  objc_storeStrong((id *)&self->_alarmMonitor, 0);
  objc_storeStrong((id *)&self->_lightMonitor, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_enabledDate, 0);
  objc_storeStrong((id *)&self->_interruptionMetrics, 0);
  objc_storeStrong((id *)&self->_currentData, 0);
  objc_storeStrong((id *)&self->_analytics, 0);

  objc_storeStrong((id *)&self->_defaults, 0);
}

@end