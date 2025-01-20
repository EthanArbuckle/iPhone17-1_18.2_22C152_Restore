@interface NEKAnalyticsDriver
- (BOOL)_shouldNotifyForDrift:(id)a3 orDuplication:(id)a4 forDiagnosticTimestamp:(double)a5;
- (IDSService)service;
- (NDTActivity)activity;
- (NEKAnalyticsDriver)initWithSyncController:(id)a3;
- (char)activityIdentifier:(id)a3;
- (char)activitySubsystem:(id)a3;
- (id)_runDuplicateChecker;
- (id)_runOccurrenceCacheDumper;
- (void)_sendMessage:(id)a3;
- (void)activityRun:(id)a3;
- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)setActivity:(id)a3;
- (void)setService:(id)a3;
@end

@implementation NEKAnalyticsDriver

- (NEKAnalyticsDriver)initWithSyncController:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)NEKAnalyticsDriver;
  v5 = [(NEKAnalyticsDriver *)&v18 init];
  if (v5)
  {
    v6 = +[NSCalendar autoupdatingCurrentCalendar];
    v7 = +[NSDate now];
    uint64_t v8 = [v6 dateByAddingUnit:64 value:30 toDate:v7 options:0];
    minimumDateThreshold = v5->_minimumDateThreshold;
    v5->_minimumDateThreshold = (NSDate *)v8;

    objc_storeWeak((id *)&v5->_syncController, v4);
    v10 = [[NDTActivity alloc] initWithDelegate:v5];
    activity = v5->_activity;
    v5->_activity = v10;

    v12 = (IDSService *)[objc_alloc((Class)IDSService) initWithService:@"com.apple.private.alloy.internal.watch.calendar.analytics"];
    service = v5->_service;
    v5->_service = v12;

    v14 = sub_100006A20("com.apple.internal.watch.calendar.analytics");
    [(IDSService *)v5->_service addDelegate:v5 queue:v14];
    v15 = objc_alloc_init(NEKNotificationCenter);
    notificationCenter = v5->_notificationCenter;
    v5->_notificationCenter = v15;
  }
  return v5;
}

- (void)_sendMessage:(id)a3
{
  id v4 = a3;
  v22[0] = IDSSendMessageOptionTimeoutKey;
  v22[1] = IDSSendMessageOptionFireAndForgetKey;
  v23[0] = &off_1000AF218;
  v23[1] = &__kCFBooleanTrue;
  v5 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];
  v6 = [(NEKAnalyticsDriver *)self service];
  v7 = +[NSSet setWithObject:IDSDefaultPairedDevice];
  id v14 = 0;
  id v15 = 0;
  unsigned int v8 = [v6 sendData:v4 toDestinations:v7 priority:200 options:v5 identifier:&v15 error:&v14];
  id v9 = v15;
  id v10 = v14;

  v11 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    unsigned int v13 = [v4 length];
    *(_DWORD *)buf = 67109634;
    unsigned int v17 = v13;
    __int16 v18 = 2114;
    id v19 = v9;
    __int16 v20 = 1024;
    unsigned int v21 = v8;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Sending analytics blob (%d bytes), IDS identifier %{public}@, result: %d", buf, 0x18u);
  }
}

- (id)_runDuplicateChecker
{
  return 0;
}

- (id)_runOccurrenceCacheDumper
{
  return 0;
}

- (char)activityIdentifier:(id)a3
{
  return "com.apple.internal.eventkitsync.checker";
}

- (void)activityRun:(id)a3
{
}

- (char)activitySubsystem:(id)a3
{
  return "com.apple.eventkitsync";
}

- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10 = a6;
  id v11 = a7;
  id v12 = a5;
  unsigned int v13 = [[NEKPBDailyAnalytics alloc] initWithData:v12];

  id v14 = [v11 originalGUID];

  id v15 = +[NSDate now];
  LODWORD(v11) = [v15 isBeforeDate:self->_minimumDateThreshold];

  if (!v11)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_syncController);
    unsigned int v23 = [WeakRetained isCurrentlySyncing];

    if (v23)
    {
      v24 = *(NSObject **)(qword_1000C6CA8 + 8);
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_INFO)) {
        goto LABEL_20;
      }
      int v37 = 138412290;
      *(void *)v38 = v14;
      __int16 v18 = "Active sync session - ignoring incomingData for drift or duplication with IDS identifier: %@";
      id v19 = v24;
      os_log_type_t v20 = OS_LOG_TYPE_INFO;
    }
    else
    {
      v25 = *(NSObject **)(qword_1000C6CA8 + 8);
      if (v13)
      {
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          int v37 = 138412290;
          *(void *)v38 = v14;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Deserialized analytics data from watch with IDS identifier: %@", (uint8_t *)&v37, 0xCu);
        }
        v26 = +[NSDate date];
        [v26 timeIntervalSinceReferenceDate];
        double v28 = v27;

        v29 = [(NEKPBDailyAnalytics *)v13 duplicateCheck];
        v30 = +[NEKDuplicationResults duplicateResultsFromCheck:v29 withDiagnosticTimestamp:v28];

        v31 = [(NEKPBDailyAnalytics *)v13 occurrenceCache];
        v32 = +[NEKDriftResults driftResultsForCache:v31 withDiagnosticTimestamp:v28];

        +[NEKAnalyticsReporter saveSyncReportForDrift:v32 andDuplication:v30];
        +[NEKAnalyticsReporter sendAnalyticsForDrift:v32 andDuplication:v30];
        unsigned int v33 = [(NEKAnalyticsDriver *)self _shouldNotifyForDrift:v32 orDuplication:v30 forDiagnosticTimestamp:v28];
        unsigned int v34 = +[FeatureFlags sendDiagnosticNotificaton];
        unsigned int v35 = v34;
        if (v33 && v34)
        {
          [(NEKNotificationCenter *)self->_notificationCenter requestDiagnosticNotificationForDeviceID:v10];
        }
        else
        {
          v36 = *(NSObject **)(qword_1000C6CA8 + 8);
          if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
          {
            int v37 = 67109376;
            *(_DWORD *)v38 = v33;
            *(_WORD *)&v38[4] = 1024;
            *(_DWORD *)&v38[6] = v35;
            _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "Skipping notification, newDriftOrDuplicatesFound: [%{BOOL}d] sendDiagnosticNotificationEnabled: [%{BOOL}d]", (uint8_t *)&v37, 0xEu);
          }
        }

        goto LABEL_20;
      }
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_20;
      }
      int v37 = 138412290;
      *(void *)v38 = v14;
      __int16 v18 = "Failed to deserialize analytics data from watch with IDS identifier: %@";
      id v19 = v25;
      os_log_type_t v20 = OS_LOG_TYPE_DEFAULT;
    }
    uint32_t v21 = 12;
    goto LABEL_16;
  }
  v16 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    minimumDateThreshold = self->_minimumDateThreshold;
    int v37 = 138412546;
    *(void *)v38 = minimumDateThreshold;
    *(_WORD *)&v38[8] = 2112;
    v39 = v14;
    __int16 v18 = "Minimum date threshold not met [%@] - ignoring incoming data for drift or duplication with IDS identifier: %@";
    id v19 = v16;
    os_log_type_t v20 = OS_LOG_TYPE_INFO;
    uint32_t v21 = 22;
LABEL_16:
    _os_log_impl((void *)&_mh_execute_header, v19, v20, v18, (uint8_t *)&v37, v21);
  }
LABEL_20:
}

- (BOOL)_shouldNotifyForDrift:(id)a3 orDuplication:(id)a4 forDiagnosticTimestamp:(double)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = +[NEKEnvironment instance];
  id v10 = [v9 tinyStore];

  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"internal_forceDiagnosticNotification", @"com.apple.EventKitSync", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat && AppBooleanValue)
  {
    id v12 = *(NSObject **)(qword_1000C6CA8 + 8);
    LOBYTE(v13) = 1;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      id v14 = "Forcing diagnostic notification";
      id v15 = v12;
      uint32_t v16 = 2;
LABEL_17:
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, v14, buf, v16);
    }
  }
  else
  {
    [v10 getDoubleValueForKey:@"diagnosticNotificationIgnoreUntil" default:*(double *)&qword_1000C6598];
    if (v17 <= a5)
    {
      [v10 getDoubleValueForKey:@"diagnosticLastChecked" default:*(double *)&qword_1000C6598];
      double v20 = v19;
      double v21 = *(double *)&qword_1000C6598;
      [v10 setDoubleValue:@"diagnosticLastChecked" forKey:a5];
      [v7 firstFoundTimestamp];
      double v23 = v22;
      BOOL v24 = v22 > v20;
      [v8 firstFoundTimestamp];
      double v26 = v25;
      int v27 = v25 > v20 || v24;
      if (v20 == v21) {
        LODWORD(v13) = 0;
      }
      else {
        LODWORD(v13) = v27;
      }
      double v28 = *(NSObject **)(qword_1000C6CA8 + 8);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109888;
        *(_DWORD *)v32 = v13;
        *(_WORD *)&v32[4] = 1024;
        *(_DWORD *)&v32[6] = v20 == v21;
        __int16 v33 = 1024;
        BOOL v34 = v23 > v20;
        __int16 v35 = 1024;
        BOOL v36 = v26 > v20;
        id v14 = "New drift or duplicates found: [%{BOOL}d] firstTimeDiagnosticsRun: [%{BOOL}d] newDrift: [%{BOOL}d] newDupl"
              "icates: [%{BOOL}d]";
        id v15 = v28;
        uint32_t v16 = 26;
        goto LABEL_17;
      }
    }
    else
    {
      unsigned int v13 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
      __int16 v18 = *(NSObject **)(qword_1000C6CA8 + 8);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v32 = v13;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Ignoring diagnostic notification until: %@", buf, 0xCu);
      }

      LOBYTE(v13) = 0;
    }
  }

  return (char)v13;
}

- (NDTActivity)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
}

- (IDSService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_minimumDateThreshold, 0);
  objc_destroyWeak((id *)&self->_syncController);

  objc_storeStrong((id *)&self->_notificationCenter, 0);
}

@end