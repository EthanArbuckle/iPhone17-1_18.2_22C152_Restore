@interface _DASEnergyUsageTracker
+ (BOOL)shouldTrackActivity:(id)a3;
+ (id)instanceWithReportingHandler:(id)a3;
+ (id)sharedInstance;
- (BOOL)initialReading;
- (NSCountedSet)startedActivities;
- (NSMutableDictionary)bundleToProcessesMap;
- (NSMutableSet)startedDASActivities;
- (NSString)pllReportID;
- (OS_os_log)log;
- (PLDiscretionaryEnergyMonitor)energyMonitor;
- (_CDContext)context;
- (_DASEnergyUsageTracker)init;
- (double)accountedNewEnergy:(id)a3;
- (double)dailyBudget;
- (double)discEnergyConsumed;
- (double)energyConsumed:(id)a3;
- (double)energyConsumedFrom:(double)a3;
- (id)bundleInformationWithNetworkQuality:(id)a3;
- (id)handler;
- (id)nameStringForActivity:(id)a3;
- (id)trackingBundlesWithParameters:(id)a3;
- (void)energyConsumptionHandler:(id)a3;
- (void)initializePluginTrigger;
- (void)setBundleToProcessesMap:(id)a3;
- (void)setContext:(id)a3;
- (void)setDiscEnergyConsumed:(double)a3;
- (void)setEnergyMonitor:(id)a3;
- (void)setHandler:(id)a3;
- (void)setInitialReading:(BOOL)a3;
- (void)setLog:(id)a3;
- (void)setPllReportID:(id)a3;
- (void)setStartedActivities:(id)a3;
- (void)setStartedDASActivities:(id)a3;
- (void)startTrackingActivity:(id)a3;
- (void)startTrackingActivityWithParameters:(id)a3;
- (void)stopTrackingActivity:(id)a3;
- (void)stopTrackingActivityWithParameters:(id)a3;
@end

@implementation _DASEnergyUsageTracker

- (void)startTrackingActivityWithParameters:(id)a3
{
  id v4 = a3;
  context = self->_context;
  v6 = +[_CDContextQueries keyPathForPluginStatus];
  v7 = [(_CDContext *)context objectForKeyedSubscript:v6];
  unsigned __int8 v8 = [v7 BOOLValue];

  if ((v8 & 1) == 0
    && +[_DASEnergyBudgetPolicy budgetIsPositive:self->_context])
  {
    v9 = [(_DASEnergyUsageTracker *)self trackingBundlesWithParameters:v4];
    if (v9)
    {
      v10 = self->_startedActivities;
      objc_sync_enter(v10);
      startedActivities = self->_startedActivities;
      v12 = [v9 objectAtIndexedSubscript:0];
      [(NSCountedSet *)startedActivities addObject:v12];

      objc_sync_exit(v10);
      v13 = +[NSSet setWithArray:v9];
      v14 = +[NSMutableDictionary dictionary];
      [v14 setObject:v13 forKeyedSubscript:@"involvedIdentifiers"];
      [v14 setObject:&__kCFBooleanTrue forKeyedSubscript:@"selfBudgeted"];
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        v16 = log;
        v17 = [v9 objectAtIndexedSubscript:0];
        int v20 = 138412546;
        v21 = v17;
        __int16 v22 = 2112;
        id v23 = v4;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Report to PowerLog start tracking activity %@ from parameters %@", (uint8_t *)&v20, 0x16u);
      }
      energyMonitor = self->_energyMonitor;
      v19 = [v9 objectAtIndexedSubscript:0];
      [(PLDiscretionaryEnergyMonitor *)energyMonitor reportStartEvent:v19 withInfo:v14];
    }
  }
}

- (_DASEnergyUsageTracker)init
{
  v20.receiver = self;
  v20.super_class = (Class)_DASEnergyUsageTracker;
  v2 = [(_DASEnergyUsageTracker *)&v20 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.duetactivityscheduler", "energybudgeting");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    uint64_t v5 = +[NSCountedSet set];
    startedActivities = v2->_startedActivities;
    v2->_startedActivities = (NSCountedSet *)v5;

    uint64_t v7 = +[NSMutableSet set];
    startedDASActivities = v2->_startedDASActivities;
    v2->_startedDASActivities = (NSMutableSet *)v7;

    v2->_initialReading = 1;
    uint64_t v9 = +[NSMutableDictionary dictionary];
    bundleToProcessesMap = v2->_bundleToProcessesMap;
    v2->_bundleToProcessesMap = (NSMutableDictionary *)v9;

    uint64_t v11 = +[_CDClientContext userContext];
    context = v2->_context;
    v2->_context = (_CDContext *)v11;

    id v13 = objc_alloc((Class)PLDiscretionaryEnergyMonitor);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100020BCC;
    v18[3] = &unk_100175710;
    v14 = v2;
    v19 = v14;
    v15 = (PLDiscretionaryEnergyMonitor *)[v13 initWithCompletionBlock:v18];
    energyMonitor = v14->_energyMonitor;
    v14->_energyMonitor = v15;

    [(_DASEnergyUsageTracker *)v14 initializePluginTrigger];
  }
  return v2;
}

+ (id)sharedInstance
{
  if (qword_1001C3AF8 != -1) {
    dispatch_once(&qword_1001C3AF8, &stru_100175730);
  }
  v2 = (void *)qword_1001C3B00;

  return v2;
}

+ (id)instanceWithReportingHandler:(id)a3
{
  id v3 = a3;
  id v4 = +[_DASEnergyUsageTracker sharedInstance];
  [v4 setHandler:v3];

  return v4;
}

+ (BOOL)shouldTrackActivity:(id)a3
{
  id v3 = a3;
  id v4 = +[_CDClientContext userContext];
  if (+[_DASPhotosPolicy isActivity:v3 consideredNonDiscretionary:v4])
  {
    goto LABEL_10;
  }
  uint64_t v5 = +[_CDContextQueries keyPathForPluginStatus];
  v6 = [v4 objectForKeyedSubscript:v5];
  unsigned __int8 v7 = [v6 BOOLValue];

  if (v7) {
    goto LABEL_10;
  }
  id v8 = [v3 schedulingPriority];
  if (v8 != (id)_DASSchedulingPriorityUtility) {
    goto LABEL_7;
  }
  uint64_t v9 = [v3 widgetID];

  if (v9) {
    goto LABEL_10;
  }
  if (!+[_DASEnergyBudgetPolicy budgetIsPositive:v4])
  {
LABEL_7:
    uint64_t v11 = [v3 launchReason];
    unsigned int v12 = [v11 isEqualToString:_DASLaunchReasonBackgroundRemoteNotification];

    if (!v12) {
      goto LABEL_9;
    }
    id v13 = v3;
    objc_sync_enter(v13);
    v14 = [v13 policyResponseMetadata];
    v15 = [v14 objectForKeyedSubscript:@"Application Policy"];
    unsigned __int8 v16 = [v15 reason];

    objc_sync_exit(v13);
    if ((v16 & 2) == 0)
    {
LABEL_9:
      unsigned __int8 v10 = [v3 budgeted];
      goto LABEL_11;
    }
LABEL_10:
    unsigned __int8 v10 = 0;
    goto LABEL_11;
  }
  unsigned __int8 v10 = 1;
LABEL_11:

  return v10;
}

- (void)energyConsumptionHandler:(id)a3
{
  [(_DASEnergyUsageTracker *)self energyConsumed:a3];
  if (v4 > 0.0)
  {
    double v5 = v4;
    v6 = [(_DASEnergyUsageTracker *)self handler];
    v6[2](v5);
  }
}

- (void)initializePluginTrigger
{
  id v3 = +[_CDContextQueries keyPathForPluginStatus];
  context = self->_context;
  energyMonitor = self->_energyMonitor;
  v6 = +[_CDContextQueries keyPathForPluginStatus];
  unsigned __int8 v7 = [(_CDContext *)context objectForKeyedSubscript:v6];
  -[PLDiscretionaryEnergyMonitor reportChargingStatus:](energyMonitor, "reportChargingStatus:", [v7 BOOLValue]);

  id v8 = +[_CDContextualPredicate predicateForChangeAtKeyPath:v3];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100021020;
  v10[3] = &unk_100175758;
  v10[4] = self;
  uint64_t v9 = +[_CDContextualChangeRegistration localWakingRegistrationWithIdentifier:@"com.apple.das.energytracker" contextualPredicate:v8 clientIdentifier:@"com.apple.dasd.contextstore-registration" callback:v10];

  [(_CDContext *)self->_context registerCallback:v9];
}

- (id)bundleInformationWithNetworkQuality:(id)a3
{
  id v3 = a3;
  double v4 = +[_CDClientContext userContext];
  if (+[_CDNetworkContext cellInterfaceUp:v4])
  {
    double v5 = (char *)+[_CDNetworkContext cellInterfaceClass:v4]
       - 1;
    if ((unint64_t)v5 > 2) {
      CFStringRef v6 = @"Unknown";
    }
    else {
      CFStringRef v6 = *(&off_100175778 + (void)v5);
    }
    [v3 setObject:v6 forKeyedSubscript:@"cell"];
    uint64_t v7 = (uint64_t)+[_CDNetworkContext cellQuality:v4];
  }
  else
  {
    [v3 setObject:@"Wifi" forKeyedSubscript:@"wifi"];
    uint64_t v7 = (uint64_t)+[_CDNetworkContext wifiQuality:v4];
  }
  if (v7 > 49)
  {
    if (v7 != 100)
    {
      if (v7 == 50)
      {
        CFStringRef v8 = @"Fair";
        goto LABEL_17;
      }
      goto LABEL_14;
    }
    CFStringRef v8 = @"Best";
  }
  else
  {
    if (v7)
    {
      if (v7 == 20)
      {
        CFStringRef v8 = @"Poor";
        goto LABEL_17;
      }
LABEL_14:
      CFStringRef v8 = @"Unknown";
      goto LABEL_17;
    }
    CFStringRef v8 = @"None";
  }
LABEL_17:
  [v3 setObject:v8 forKeyedSubscript:@"quality"];

  return v3;
}

- (double)energyConsumed:(id)a3
{
  id v4 = a3;
  double v5 = [v4 objectForKeyedSubscript:@"BLMUUIDForDuet"];
  CFStringRef v6 = [v4 objectForKeyedSubscript:@"BLMEnergyForDuet"];
  uint64_t v7 = [v4 objectForKeyedSubscript:@"totalAccumulatedEnergy"];
  CFStringRef v8 = [v4 objectForKeyedSubscript:@"BLMEnergyResponseTimestamp"];

  if (v4 && v6 && v5 && v7)
  {
    pllReportID = self->_pllReportID;
    if (!pllReportID || ([(NSString *)pllReportID isEqual:v5] & 1) == 0)
    {
      self->_discEnergyConsumed = 0.0;
      objc_storeStrong((id *)&self->_pllReportID, v5);
    }
    [(_DASEnergyUsageTracker *)self accountedNewEnergy:v6];
    double v11 = v10;
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = log;
      v14 = +[NSNumber numberWithDouble:v11];
      [v8 timeIntervalSinceNow];
      unsigned __int8 v16 = +[NSNumber numberWithDouble:v15 / -60.0];
      int v21 = 138412802;
      __int16 v22 = v7;
      __int16 v23 = 2112;
      v24 = v14;
      __int16 v25 = 2112;
      v26 = v16;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "PowerLog Accounting (incl fast accounting): %@, Slow Accounting is at %@, last accounted %@ minutes ago", (uint8_t *)&v21, 0x20u);
    }
    [v7 doubleValue];
    -[_DASEnergyUsageTracker energyConsumedFrom:](self, "energyConsumedFrom:");
    double v18 = v17;
  }
  else
  {
    double v18 = 0.0;
    if (self->_initialReading)
    {
      v19 = self->_log;
      if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v21) = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v19, OS_LOG_TYPE_DEFAULT, "PowerLog Update: Received empty report for initial reading. Will try again later", (uint8_t *)&v21, 2u);
      }
    }
  }

  return v18;
}

- (double)energyConsumedFrom:(double)a3
{
  if (self->_initialReading)
  {
    self->_double discEnergyConsumed = a3;
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
    {
      double discEnergyConsumed = self->_discEnergyConsumed;
      int v10 = 134217984;
      double v11 = discEnergyConsumed;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "PowerLog: Initial Discretionary Energy Readings: %lf", (uint8_t *)&v10, 0xCu);
    }
    self->_initialReading = 0;
    return 0.0;
  }
  else
  {
    double v8 = a3 - self->_discEnergyConsumed;
    double result = 0.0;
    if (v8 >= 0.0)
    {
      self->_double discEnergyConsumed = a3;
      uint64_t v9 = self->_log;
      if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 134217984;
        double v11 = v8;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v9, OS_LOG_TYPE_DEFAULT, "PowerLog Update: Discretionary energy consumed since last read: %.2f", (uint8_t *)&v10, 0xCu);
      }
      return v8;
    }
  }
  return result;
}

- (double)dailyBudget
{
  +[PLDiscretionaryEnergyMonitor getDiscretionaryEnergyBudget];
  log = self->_log;
  if (v3 <= 0.0)
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      sub_1000F34A8((os_log_t)log);
    }
    log = self->_log;
    double v5 = 250.0;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 134217984;
      uint64_t v9 = 0x406F400000000000;
      CFStringRef v6 = "energy daily budget is %f";
      goto LABEL_8;
    }
  }
  else
  {
    double v5 = v3;
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 134217984;
      uint64_t v9 = *(void *)&v5;
      CFStringRef v6 = "PLEnergyMonitor energy daily budget is %f";
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v8, 0xCu);
    }
  }
  return v5;
}

- (id)nameStringForActivity:(id)a3
{
  id v3 = a3;
  id v4 = [v3 name];
  if (v4)
  {
    double v5 = [v3 uuid];

    if (v5)
    {
      CFStringRef v6 = [v3 name];
      uint64_t v7 = [v3 uuid];
      int v8 = [v7 UUIDString];
      uint64_t v9 = [v8 substringToIndex:6];
      id v4 = +[NSString stringWithFormat:@"%@:%@", v6, v9];
    }
    else
    {
      id v4 = 0;
    }
  }

  return v4;
}

- (void)startTrackingActivity:(id)a3
{
  id v4 = a3;
  if (+[_DASEnergyUsageTracker shouldTrackActivity:v4])
  {
    double v5 = +[_DASSystemBudgetManager identifierWithActivity:v4];
    CFStringRef v6 = +[_DASSystemBudgetManager involvedProcessesForActivity:v4 withIdentifier:v5];
    if ([v6 count])
    {
      uint64_t v7 = [(_DASEnergyUsageTracker *)self nameStringForActivity:v4];
      if (v7)
      {
        int v8 = self->_startedDASActivities;
        objc_sync_enter(v8);
        [(NSMutableSet *)self->_startedDASActivities addObject:v4];
        objc_sync_exit(v8);

        uint64_t v9 = +[NSMutableDictionary dictionary];
        [v9 setObject:v6 forKeyedSubscript:@"involvedIdentifiers"];
        if ([v4 requiresNetwork])
        {
          [v9 setObject:&__kCFBooleanTrue forKeyedSubscript:@"requiresNetwork"];
          uint64_t v10 = [(_DASEnergyUsageTracker *)self bundleInformationWithNetworkQuality:v9];

          uint64_t v9 = (void *)v10;
        }
        log = self->_log;
        if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v12 = log;
          id v13 = [v4 bundleId];
          v14 = [v4 relatedApplications];
          double v15 = [v4 involvedProcesses];
          int v30 = 138413314;
          v31 = v7;
          __int16 v32 = 2112;
          v33 = v13;
          __int16 v34 = 2112;
          v35 = v14;
          __int16 v36 = 2112;
          v37 = v15;
          __int16 v38 = 2112;
          v39 = v9;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Report to PowerLog start tracking activity (from daemon) %@ with bundle name %@, relatedApplications %@, and involvedProcesses %@ with info %@", (uint8_t *)&v30, 0x34u);
        }
        [(PLDiscretionaryEnergyMonitor *)self->_energyMonitor reportStartEvent:v7 withInfo:v9];
      }
      else
      {
        __int16 v23 = self->_log;
        if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_ERROR)) {
          sub_1000F3558((uint64_t)v4, v23, v24, v25, v26, v27, v28, v29);
        }
      }
    }
    else
    {
      unsigned __int8 v16 = self->_log;
      if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR)) {
        sub_1000F34EC((uint64_t)v4, v16, v17, v18, v19, v20, v21, v22);
      }
    }
  }
}

- (void)stopTrackingActivity:(id)a3
{
  id v4 = a3;
  uint64_t v26 = [(_DASEnergyUsageTracker *)self nameStringForActivity:v4];
  if (v26)
  {
    obj = self->_startedDASActivities;
    objc_sync_enter(obj);
    id v5 = [(NSMutableSet *)self->_startedDASActivities mutableCopy];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v6 = v5;
    id v7 = [v6 countByEnumeratingWithState:&v27 objects:v37 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v28;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v28 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          double v11 = [v4 uuid:obj];
          unsigned int v12 = [v10 uuid];
          unsigned int v13 = [v11 isEqual:v12];

          if (v13)
          {
            [(NSMutableSet *)self->_startedDASActivities removeObject:v10];

            objc_sync_exit(obj);
            v14 = +[NSMutableDictionary dictionary];
            if ([v4 requiresNetwork]) {
              [v14 setObject:&__kCFBooleanTrue forKeyedSubscript:@"requiresNetwork"];
            }
            log = self->_log;
            if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
            {
              unsigned __int8 v16 = log;
              uint64_t v17 = [v4 bundleId];
              *(_DWORD *)buf = 138412802;
              __int16 v32 = v26;
              __int16 v33 = 2112;
              __int16 v34 = v17;
              __int16 v35 = 2112;
              __int16 v36 = v14;
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Report to PowerLog stop tracking activity (from daemon) %@ with bundle name %@ and info %@", buf, 0x20u);
            }
            [(PLDiscretionaryEnergyMonitor *)self->_energyMonitor reportStopEvent:v26 withInfo:v14];

            goto LABEL_18;
          }
        }
        id v7 = [v6 countByEnumeratingWithState:&v27 objects:v37 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

    objc_sync_exit(obj);
  }
  else
  {
    uint64_t v18 = self->_log;
    if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_ERROR)) {
      sub_1000F35C4((uint64_t)v4, v18, v19, v20, v21, v22, v23, v24);
    }
  }
LABEL_18:
}

- (double)accountedNewEnergy:(id)a3
{
  id v3 = a3;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (!v4)
  {
    double v10 = 0.0;
    goto LABEL_23;
  }
  id v6 = v4;
  uint64_t v7 = *(void *)v28;
  double v8 = 0.0;
  CFStringRef v9 = @"bundleID";
  *(void *)&long long v5 = 134217984;
  long long v25 = v5;
  double v10 = 0.0;
  do
  {
    for (i = 0; i != v6; i = (char *)i + 1)
    {
      CFStringRef v12 = v9;
      if (*(void *)v28 != v7) {
        objc_enumerationMutation(v3);
      }
      unsigned int v13 = *(void **)(*((void *)&v27 + 1) + 8 * i);
      v14 = [v13 objectForKeyedSubscript:@"updateType" withDefault:v25];
      unsigned int v15 = [v14 unsignedCharValue];

      unsigned __int8 v16 = [v13 objectForKeyedSubscript:@"energy"];
      [v16 doubleValue];
      double v18 = v17;

      if (v18 <= 0.0) {
        goto LABEL_17;
      }
      CFStringRef v9 = v12;
      if (v15 != 2)
      {
        if (v15 != 1) {
          continue;
        }
        double v10 = v10 + v18;
        uint64_t v19 = [v13 objectForKeyedSubscript:v12];
        if ([v19 compare:@"cloudphotod"])
        {
          uint64_t v20 = [v13 objectForKeyedSubscript:v12];
          id v21 = [v20 compare:@"assetsd"];

          if (!v21) {
LABEL_16:
          }
            double v8 = v8 + v18;
LABEL_17:
          CFStringRef v9 = v12;
          continue;
        }

        goto LABEL_16;
      }
      log = self->_log;
      if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = v25;
        double v32 = v18;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "PowerLog Update: Complications energy %.2f", buf, 0xCu);
      }
      double v10 = v10 + v18;
    }
    id v6 = [v3 countByEnumeratingWithState:&v27 objects:v33 count:16];
  }
  while (v6);
  if (v8 > 2.22507386e-308)
  {
    LODWORD(v23) = llround(v8);
    +[_DASMetricRecorder setValue:v23 forKey:@"com.apple.duet.energy.hyperion.approximatetotal"];
  }
LABEL_23:

  return v10;
}

- (id)trackingBundlesWithParameters:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:kDASBudgetKeyBundleIDs];
  long long v5 = [v3 objectForKeyedSubscript:kDASBudgetKeyPIDs];
  id v6 = [v3 objectForKeyedSubscript:kDASBudgetKeyProcessNames];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v25 = v6;
    uint64_t v7 = +[NSArray arrayWithObjects:&v25 count:1];

    id v6 = (void *)v7;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      id v6 = 0;
    }
  }
  if ([v4 count])
  {
    id v8 = v4;
LABEL_9:
    CFStringRef v9 = v8;
    goto LABEL_10;
  }
  if ([v6 count])
  {
    id v8 = v6;
    goto LABEL_9;
  }
  if ([v5 count])
  {
    uint64_t v19 = v4;
    CFStringRef v9 = +[NSMutableArray array];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    double v18 = v5;
    id v11 = v5;
    id v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v21;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v21 != v14) {
            objc_enumerationMutation(v11);
          }
          unsigned __int8 v16 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          double v17 = [_DASUtils processNameFromPID:](_DASUtils, objc_msgSend(v16, "intValue", v18));
          if (v17) {
            [v9 addObject:v16];
          }
        }
        id v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v13);
    }

    long long v5 = v18;
    id v4 = v19;
  }
  else
  {
    CFStringRef v9 = 0;
  }
LABEL_10:

  return v9;
}

- (void)stopTrackingActivityWithParameters:(id)a3
{
  id v4 = a3;
  long long v5 = [(_DASEnergyUsageTracker *)self trackingBundlesWithParameters:v4];
  if (v5)
  {
    id v6 = self->_startedActivities;
    objc_sync_enter(v6);
    startedActivities = self->_startedActivities;
    id v8 = [v5 objectAtIndexedSubscript:0];
    LODWORD(startedActivities) = [(NSCountedSet *)startedActivities containsObject:v8];

    if (startedActivities)
    {
      CFStringRef v9 = self->_startedActivities;
      double v10 = [v5 objectAtIndexedSubscript:0];
      [(NSCountedSet *)v9 removeObject:v10];

      objc_sync_exit(v6);
      id v11 = +[NSMutableDictionary dictionary];
      [v11 setObject:&__kCFBooleanTrue forKeyedSubscript:@"selfBudgeted"];
      log = self->_log;
      if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138412546;
        unsigned __int8 v16 = v5;
        __int16 v17 = 2112;
        id v18 = v4;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Report to PowerLog stop tracking activity %@ from parameters %@", (uint8_t *)&v15, 0x16u);
      }
      energyMonitor = self->_energyMonitor;
      uint64_t v14 = [v5 objectAtIndexedSubscript:0];
      [(PLDiscretionaryEnergyMonitor *)energyMonitor reportStopEvent:v14 withInfo:v11];
    }
    else
    {
      objc_sync_exit(v6);
    }
  }
}

- (BOOL)initialReading
{
  return self->_initialReading;
}

- (void)setInitialReading:(BOOL)a3
{
  self->_initialReading = a3;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (NSCountedSet)startedActivities
{
  return self->_startedActivities;
}

- (void)setStartedActivities:(id)a3
{
}

- (NSMutableSet)startedDASActivities
{
  return self->_startedDASActivities;
}

- (void)setStartedDASActivities:(id)a3
{
}

- (NSMutableDictionary)bundleToProcessesMap
{
  return self->_bundleToProcessesMap;
}

- (void)setBundleToProcessesMap:(id)a3
{
}

- (_CDContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (PLDiscretionaryEnergyMonitor)energyMonitor
{
  return self->_energyMonitor;
}

- (void)setEnergyMonitor:(id)a3
{
}

- (NSString)pllReportID
{
  return self->_pllReportID;
}

- (void)setPllReportID:(id)a3
{
}

- (double)discEnergyConsumed
{
  return self->_discEnergyConsumed;
}

- (void)setDiscEnergyConsumed:(double)a3
{
  self->_double discEnergyConsumed = a3;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_pllReportID, 0);
  objc_storeStrong((id *)&self->_energyMonitor, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_bundleToProcessesMap, 0);
  objc_storeStrong((id *)&self->_startedDASActivities, 0);
  objc_storeStrong((id *)&self->_startedActivities, 0);

  objc_storeStrong((id *)&self->_log, 0);
}

@end