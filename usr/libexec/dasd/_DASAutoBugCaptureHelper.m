@interface _DASAutoBugCaptureHelper
+ (BOOL)isActivitySignificantlyOverdue:(id)a3 now:(id)a4;
+ (void)checkAllTasksForBGSystemTask:(id)a3;
+ (void)schedule;
+ (void)triggerABCCaseForActivities:(id)a3;
@end

@implementation _DASAutoBugCaptureHelper

+ (BOOL)isActivitySignificantlyOverdue:(id)a3 now:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = +[_DASDaemonLogger logForCategory:@"abcHelper"];
  v8 = v7;
  if (!v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      sub_1000F9684();
    }
    goto LABEL_14;
  }
  if (!v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      sub_1000F96B8();
    }
    goto LABEL_14;
  }
  if (![v5 significantlyOverdueAtDate:v6])
  {
LABEL_14:
    BOOL v17 = 0;
    goto LABEL_15;
  }
  uint64_t v9 = [v5 submitDate];
  if (v9)
  {
    v10 = (void *)v9;
    v11 = [v5 submitDate];
    [v6 timeIntervalSinceDate:v11];
    double v13 = v12;

    if (v13 > 2073600.0)
    {
      v14 = v8;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = [v5 submitDate];
        v16 = [v5 startBefore];
        int v19 = 138413058;
        id v20 = v5;
        __int16 v21 = 2112;
        v22 = v15;
        __int16 v23 = 2112;
        v24 = v16;
        __int16 v25 = 2112;
        id v26 = v6;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Activity %@ significantly overdue, submit: %@, startBefore: %@, now: %@", (uint8_t *)&v19, 0x2Au);
      }
    }
  }
  BOOL v17 = 1;
LABEL_15:

  return v17;
}

+ (void)triggerABCCaseForActivities:(id)a3
{
  id v3 = a3;
  v4 = +[_DASDaemonLogger logForCategory:@"abcHelper"];
  id v5 = v4;
  if (v3)
  {
    __int16 v23 = v4;
    id v6 = objc_alloc_init((Class)NSMutableArray);
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v7 = v3;
    id v8 = [v7 countByEnumeratingWithState:&v27 objects:v40 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v28;
      do
      {
        v11 = 0;
        do
        {
          if (*(void *)v28 != v10) {
            objc_enumerationMutation(v7);
          }
          double v12 = [*(id *)(*((void *)&v27 + 1) + 8 * (void)v11) name];
          [v6 addObject:v12];

          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v27 objects:v40 count:16];
      }
      while (v9);
    }

    double v13 = [v6 componentsJoinedByString:@","];
    id v14 = objc_alloc_init((Class)SDRDiagnosticReporter);
    v15 = [v14 signatureWithDomain:@"Duet" type:@"Activities Significantly Overdue" subType:@"Multiple Activities" subtypeContext:0 detectedProcess:@"dasd" triggerThresholdValues:0];
    uint64_t v38 = kSymptomDiagnosticKeyPayloadDEParameters;
    v35 = v13;
    CFStringRef v36 = @"com.apple.das.DASDaemon.DuetDiagnosticExtension";
    CFStringRef v34 = @"kDASActivityNames";
    v16 = +[NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
    v37 = v16;
    BOOL v17 = +[NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
    v39 = v17;
    v18 = +[NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];

    CFStringRef v31 = @"kDASActivityNames";
    v32 = v13;
    int v19 = +[NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
    v33 = v19;
    id v20 = +[NSArray arrayWithObjects:&v33 count:1];

    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100084D38;
    v24[3] = &unk_100176FB0;
    id v5 = v23;
    __int16 v21 = v23;
    __int16 v25 = v21;
    id v26 = v13;
    id v22 = v13;
    if (([v14 snapshotWithSignature:v15 duration:v20 events:v18 payload:0 actions:v24 reply:0.0] & 1) == 0&& os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
    {
      sub_1000F9720();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    sub_1000F96EC();
  }
}

+ (void)checkAllTasksForBGSystemTask:(id)a3
{
  id v3 = a3;
  v4 = +[_DASDaemonLogger logForCategory:@"abcHelper"];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Checking activities for significantly overdue tasks", buf, 2u);
  }
  if (v3)
  {
    *(void *)buf = 0;
    long long v30 = buf;
    uint64_t v31 = 0x2020000000;
    char v32 = 0;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10008526C;
    v26[3] = &unk_100175598;
    long long v28 = buf;
    id v5 = v4;
    long long v27 = v5;
    [v3 setExpirationHandler:v26];
    id v19 = objc_alloc_init((Class)NSMutableArray);
    id v20 = +[NSDate date];
    id v6 = +[_DASDaemon sharedInstance];
    id v7 = [v6 allPendingTasks];

    BOOL v17 = v4;
    v18 = v3;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v8 = v7;
    id v9 = [v8 countByEnumeratingWithState:&v22 objects:v35 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v23;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v23 != v10) {
            objc_enumerationMutation(v8);
          }
          double v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          if ((objc_msgSend(v12, "userRequestedBackupTask", v17) & 1) != 0
            || [v12 beforeDaysFirstActivity])
          {
            if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)v33 = 138412290;
              id v34 = v12;
              _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Ignoring activity that is allowed to be overdue: %@", v33, 0xCu);
            }
          }
          else
          {
            if ([(id)objc_opt_class() isActivitySignificantlyOverdue:v12 now:v20]) {
              [v19 addObject:v12];
            }
            if (v30[24]) {
              goto LABEL_18;
            }
          }
        }
        id v9 = [v8 countByEnumeratingWithState:&v22 objects:v35 count:16];
      }
      while (v9);
    }
LABEL_18:

    v4 = v17;
    id v3 = v18;
    if (v30[24])
    {
      id v21 = 0;
      unsigned __int8 v13 = [v18 setTaskExpiredWithRetryAfter:&v21 error:0.0];
      id v14 = v21;
      if ((v13 & 1) == 0)
      {
        v15 = v5;
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        {
          v16 = [v18 identifier];
          sub_1000F98A4(v16, (uint64_t)v14, v33, v15);
        }

        [v18 setTaskCompleted];
      }
    }
    else
    {
      if ([v19 count])
      {
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v33 = 138412290;
          id v34 = v19;
          _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Found significantly overdue activities:\n%@", v33, 0xCu);
        }
        [(id)objc_opt_class() triggerABCCaseForActivities:v19];
      }
      [v18 setTaskCompleted:v17];
    }

    _Block_object_dispose(buf, 8);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    sub_1000F9870();
  }
}

+ (void)schedule
{
  id v3 = +[_DASDaemonLogger logForCategory:@"abcHelper"];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_1000F990C();
  }
  v4 = +[BGSystemTaskScheduler sharedScheduler];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000853CC;
  v6[3] = &unk_100176FD8;
  id v7 = v3;
  id v8 = a1;
  id v5 = v3;
  [v4 registerForTaskWithIdentifier:@"com.apple.dasd.overdueCheck" usingQueue:0 launchHandler:v6];
}

@end