@interface APDailyReportActivity
- (APXPCActivityCriteria)criteria;
- (BOOL)_isEventDatabaseStorageEnabled;
- (BOOL)runActivity:(id)a3;
- (NSString)taskID;
- (double)_timeIntervalToTomorrow;
- (int)_deliveryLeeway;
- (int64_t)_delay;
- (void)_dropExpiredEventTables;
- (void)_sendEventDatabaseCoreAnalytics;
- (void)terminateActivity:(id)a3;
@end

@implementation APDailyReportActivity

- (NSString)taskID
{
  return (NSString *)@"com.apple.ap.promotedcontentd.dailyreport";
}

- (APXPCActivityCriteria)criteria
{
  id v3 = objc_alloc_init((Class)APXPCActivityCriteria);
  [v3 setRequiresNetworkConnectivity:0];
  [v3 setIsRepeating:0];
  [v3 setGracePeriod:3600];
  [v3 setIsCPUIntensive:0];
  [v3 setPriority:XPC_ACTIVITY_PRIORITY_MAINTENANCE];
  [v3 setRequireSleep:1];
  [v3 setDelay:-[APDailyReportActivity _delay](self, "_delay")];
  [v3 setRequireClassCData:1];

  return (APXPCActivityCriteria *)v3;
}

- (BOOL)runActivity:(id)a3
{
  id v4 = a3;
  v5 = APLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Daily Report Activity Started.", v9, 2u);
  }

  PreparePastDueReports();
  PrepareReports();
  [(APDailyReportActivity *)self _dropExpiredEventTables];
  [(APDailyReportActivity *)self _sendEventDatabaseCoreAnalytics];
  v6 = objc_alloc_init(APSigningObservabilityCorrespondent);
  [(APSigningObservabilityCorrespondent *)v6 submitReport];
  v7 = +[APDatabaseManager mainDatabase];
  [v7 incrementalVacuumIfNeeded];

  [v4 schedule];
  return 0;
}

- (void)terminateActivity:(id)a3
{
  id v3 = APLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Daily Report Activity Terminated.", v4, 2u);
  }
}

- (int64_t)_delay
{
  [(APDailyReportActivity *)self _timeIntervalToTomorrow];
  return (uint64_t)(v3
                 + (double)(arc4random_uniform([(APDailyReportActivity *)self _deliveryLeeway]) + 1));
}

- (int)_deliveryLeeway
{
  v2 = +[APConfigurationMediator configurationForClass:objc_opt_class() usingCache:0];
  double v3 = [v2 deliveryLeeway];

  if (v3)
  {
    id v4 = [v2 deliveryLeeway];
    int v5 = [v4 intValue];
  }
  else
  {
    int v5 = 10800;
  }

  return v5;
}

- (double)_timeIntervalToTomorrow
{
  id v2 = [objc_alloc((Class)NSCalendar) initWithCalendarIdentifier:NSGregorianCalendar];
  double v3 = +[NSTimeZone localTimeZone];
  [v2 setTimeZone:v3];
  id v4 = objc_alloc_init((Class)NSDateComponents);
  [v4 setHour:0];
  [v4 setMinute:0];
  [v4 setSecond:0];
  [v4 setTimeZone:v3];
  int v5 = +[NSDate date];
  v6 = [v2 nextDateAfterDate:v5 matchingComponents:v4 options:2];
  [v6 timeIntervalSinceDate:v5];
  double v8 = v7;

  return v8;
}

- (void)_dropExpiredEventTables
{
  if ([(APDailyReportActivity *)self _isEventDatabaseStorageEnabled])
  {
    id v2 = +[APDatabaseManager mainDatabase];
    double v3 = [v2 getTableForClass:objc_opt_class()];

    if (v3)
    {
      if ([v3 dropExpiredEventTables])
      {
        id v4 = +[APDatabaseManager mainDatabase];
        int v5 = [v4 getTableForClass:objc_opt_class()];

        if ([v5 deleteAdInstancesWithNoEvents])
        {
          v6 = APLogForCategory();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Event Database expiration of data completed successfully.", buf, 2u);
          }

          goto LABEL_14;
        }
      }
      int v5 = APLogForCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        __int16 v9 = 0;
        double v7 = "Event Database expiration of data completed with error.";
        double v8 = (uint8_t *)&v9;
        goto LABEL_13;
      }
    }
    else
    {
      int v5 = APLogForCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        __int16 v11 = 0;
        double v7 = "Daily Activity did not get Event Table instance, drop events failed.";
        double v8 = (uint8_t *)&v11;
LABEL_13:
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, v7, v8, 2u);
      }
    }
LABEL_14:
  }
}

- (BOOL)_isEventDatabaseStorageEnabled
{
  id v2 = +[APConfigurationMediator configurationForClass:objc_opt_class()];
  double v3 = [v2 isEventDatabaseStorageEnabled];

  if (v3)
  {
    id v4 = [v2 isEventDatabaseStorageEnabled];
    unsigned int v5 = [v4 BOOLValue];
  }
  else
  {
    unsigned int v5 = 1;
  }
  v6 = APLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    CFStringRef v7 = @"DISABLED";
    if (v5) {
      CFStringRef v7 = @"ENABLED";
    }
    int v9 = 138543362;
    CFStringRef v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[Event Database] Event storage is: %{public}@", (uint8_t *)&v9, 0xCu);
  }

  return v5;
}

- (void)_sendEventDatabaseCoreAnalytics
{
  if (+[APSystemInternal isAppleInternalInstall])
  {
    id v2 = +[APDatabaseManager mainDatabase];
    double v3 = [v2 getTableForClass:objc_opt_class()];

    if (v3)
    {
      id v4 = [v3 allEvents];

      if (v4)
      {
        unsigned int v5 = [v3 allEvents];
        id v6 = [v5 count];

        CFStringRef v7 = +[APDatabasePath pathForName:@"APDatabase"];
        double v8 = +[NSFileManager defaultManager];
        int v9 = [v7 databaseFilePath];
        id v19 = 0;
        CFStringRef v10 = [v8 attributesOfItemAtPath:v9 error:&v19];
        id v11 = v19;
        unint64_t v12 = (unint64_t)[v10 fileSize];

        if (v11)
        {
          v13 = APLogForCategory();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            v14 = [v11 description];
            *(_DWORD *)buf = 138543362;
            v23 = v14;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Daily Activity couldn't get file size, error: %{public}@", buf, 0xCu);
          }
        }
        else
        {
          v20[0] = @"DBFilesize";
          v16 = +[NSNumber numberWithUnsignedLongLong:v12 / 0x3E8];
          v20[1] = @"TotalEvents";
          v21[0] = v16;
          v17 = +[NSNumber numberWithUnsignedInteger:v6];
          v21[1] = v17;
          v13 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];

          v18 = APLogForCategory();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            v23 = v13;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Event Database Core Analytics, payload: %{public}@", buf, 0xCu);
          }

          +[APAnalytics sendEvent:@"EventCollectionDatabase" customPayload:v13];
        }

        goto LABEL_16;
      }
      CFStringRef v7 = APLogForCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v15 = "Daily Activity did not get All Events array. Event DB CA failed.";
        goto LABEL_11;
      }
    }
    else
    {
      CFStringRef v7 = APLogForCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v15 = "Daily Activity did not get Event Table instance, Event DB CA failed.";
LABEL_11:
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, v15, buf, 2u);
      }
    }
LABEL_16:
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->criteria, 0);

  objc_storeStrong((id *)&self->taskID, 0);
}

@end