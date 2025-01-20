@interface _DASENManager
+ (id)activeENApplication;
+ (id)enTaskIdentifiersForApplication:(id)a3;
+ (id)manager;
+ (void)launchApplication:(id)a3;
+ (void)runPeriodicRelaunchTask;
+ (void)schedulePeriodicRelaunchTask;
- (BOOL)isPossibleENActivity:(id)a3;
- (_DASENManager)init;
- (int)token;
- (unint64_t)launchIntervalForENApplication:(id)a3;
- (void)handleActiveAppChanged;
- (void)performIfENActive:(id)a3;
- (void)setIsENActivity:(id)a3;
- (void)setToken:(int)a3;
@end

@implementation _DASENManager

- (_DASENManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)_DASENManager;
  v2 = [(_DASENManager *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v2->_token = -1;
    v4 = dispatch_get_global_queue(-2, 0);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000D82C8;
    handler[3] = &unk_1001759D0;
    v7 = v3;
    notify_register_dispatch("com.apple.ExposureNotification.trackedAppChanged", &v3->_token, v4, handler);
  }
  return v3;
}

+ (id)manager
{
  id v2 = objc_alloc_init((Class)objc_opt_class());

  return v2;
}

+ (id)activeENApplication
{
  id v2 = objc_alloc_init((Class)ENManager);
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = sub_1000D84F0;
  v17 = sub_1000D8500;
  id v18 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000D8508;
  v9[3] = &unk_1001781A0;
  id v4 = v2;
  id v10 = v4;
  v12 = &v13;
  v5 = v3;
  v11 = v5;
  [v4 activateWithCompletionHandler:v9];
  dispatch_time_t v6 = dispatch_time(0, 10000000000);
  dispatch_semaphore_wait(v5, v6);
  id v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);

  return v7;
}

+ (id)enTaskIdentifiersForApplication:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v3 allowPlaceholder:0 error:0];
  v5 = [v4 compatibilityObject];

  dispatch_time_t v6 = +[NSMutableArray array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = [v5 backgroundTaskSchedulerPermittedIdentifiers];
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v12 hasSuffix:@"exposure-notification"]) {
          [v6 addObject:v12];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  return v6;
}

+ (void)launchApplication:(id)a3
{
  id v20 = a3;
  [(id)objc_opt_class() enTaskIdentifiersForApplication:v20];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v19 = *(void *)v22;
    uint64_t v18 = _DASLaunchReasonBackgroundProcessing;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v22 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        id v7 = +[_DASDaemonLogger logForCategory:@"exposure-notification"];
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v26 = v6;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Submitting relaunch for %{public}@", buf, 0xCu);
        }

        id v8 = +[NSString stringWithFormat:@"bgProcessing-%@", v6];
        uint64_t v9 = _DASSchedulingPriorityUtility;
        uint64_t v10 = _DASActivityDurationShort;
        v11 = +[NSDate date];
        v12 = +[NSDate dateWithTimeIntervalSinceNow:60.0];
        uint64_t v13 = +[_DASActivity applicationLaunchActivityWithName:v8 priority:v9 forApplication:v20 withReason:v18 duration:v10 startingAfter:v11 startingBefore:v12];

        [v13 setClientProvidedIdentifier:v6];
        long long v14 = +[NSDate date];
        [v13 setClientProvidedStartDate:v14];

        [v13 setRequiresNetwork:1];
        [v13 setRequiresPlugin:0];
        [v13 setIsContactTracingBackgroundActivity:1];
        long long v15 = +[NSDate date];
        [v13 setSubmitDate:v15];

        long long v16 = +[_DASDaemon sharedInstance];
        [v16 submitActivity:v13];
      }
      id v4 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v4);
  }
}

+ (void)runPeriodicRelaunchTask
{
  id v2 = [(id)objc_opt_class() activeENApplication];
  id v3 = +[_DASDaemonLogger logForCategory:@"exposure-notification"];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100100110((uint64_t)v2, v3);
  }

  if (v2)
  {
    id v4 = +[_DASDaemonLogger logForCategory:@"exposure-notification"];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138543362;
      uint64_t v6 = v2;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Creating EN relaunch task for %{public}@", (uint8_t *)&v5, 0xCu);
    }

    [(id)objc_opt_class() launchApplication:v2];
  }
}

+ (void)schedulePeriodicRelaunchTask
{
  id v3 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.duetactivityscheduler"];
  int v4 = [v3 integerForKey:@"enRelaunchInterval"];
  if (v4 <= 0) {
    int v5 = 86400;
  }
  else {
    int v5 = v4;
  }
  uint64_t v6 = +[_DASDaemonLogger logForCategory:@"exposure-notification"];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v19) = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Preferred interval is %d", buf, 8u);
  }

  id v7 = +[BGSystemTaskScheduler sharedScheduler];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000D8FF0;
  v17[3] = &unk_100177270;
  v17[4] = a1;
  [v7 registerForTaskWithIdentifier:off_1001C3838 usingQueue:0 launchHandler:v17];

  id v8 = +[BGSystemTaskScheduler sharedScheduler];
  uint64_t v9 = [v8 taskRequestForIdentifier:off_1001C3838];

  if (!v9)
  {
    id v10 = objc_alloc((Class)BGRepeatingSystemTaskRequest);
    id v11 = [v10 initWithIdentifier:off_1001C3838];
    [v11 setPriority:2];
    [v11 setInterval:(double)v5];
    v12 = +[BGSystemTaskScheduler sharedScheduler];
    id v16 = 0;
    unsigned __int8 v13 = [v12 submitTaskRequest:v11 error:&v16];
    id v14 = v16;

    if ((v13 & 1) == 0)
    {
      long long v15 = +[_DASDaemonLogger logForCategory:@"exposure-notification"];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v19 = v14;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Failed to submit task with error: %@", buf, 0xCu);
      }
    }
  }
}

- (void)performIfENActive:(id)a3
{
  id v3 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000D90FC;
  v6[3] = &unk_1001781C8;
  id v7 = objc_alloc_init((Class)ENManager);
  id v8 = v3;
  id v4 = v3;
  id v5 = v7;
  [v5 activateWithCompletionHandler:v6];
}

- (unint64_t)launchIntervalForENApplication:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)ENManager);
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000D9364;
  v12[3] = &unk_1001781F0;
  id v6 = v3;
  id v13 = v6;
  id v16 = &v17;
  id v7 = v4;
  id v14 = v7;
  id v8 = v5;
  long long v15 = v8;
  [v7 exposureNotificationGetStatusForBundleIdentifier:v6 completion:v12];
  dispatch_time_t v9 = dispatch_time(0, 10000000000);
  dispatch_semaphore_wait(v8, v9);
  unint64_t v10 = v18[3];

  _Block_object_dispose(&v17, 8);
  return v10;
}

- (void)handleActiveAppChanged
{
  v32 = +[_DASDaemon sharedInstance];
  id v3 = [v32 allPendingBackgroundTasks];
  id v4 = +[_DASDaemonLogger logForCategory:@"exposure-notification"];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v40 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v35 objects:v43 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v36;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v36 != v8) {
          objc_enumerationMutation(v5);
        }
        unint64_t v10 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        if ([(_DASENManager *)self isPossibleENActivity:v10])
        {
          id v11 = [v10 relatedApplications];
          v12 = [v11 firstObject];
          unint64_t v13 = [(_DASENManager *)self launchIntervalForENApplication:v12];

          id v14 = +[_DASDaemonLogger logForCategory:@"exposure-notification"];
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v40 = v10;
            _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Considering: %@", buf, 0xCu);
          }

          unsigned int v15 = [v10 isContactTracingBackgroundActivity];
          if (v13)
          {
            if (v15) {
              continue;
            }
            [v10 setIsContactTracingBackgroundActivity:1];
            id v16 = [v10 submitDate];

            if (!v16)
            {
              uint64_t v17 = +[_DASDaemonLogger logForCategory:@"exposure-notification"];
              if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
                sub_100100214(&v33, v34, v17);
              }

              uint64_t v18 = +[NSDate dateWithTimeIntervalSinceNow:-3600.0];
              [v10 setSubmitDate:v18];
            }
            uint64_t v19 = [v10 submitDate];
            uint64_t v20 = [v19 dateByAddingTimeInterval:(double)v13];

            uint64_t v21 = [v10 clientProvidedStartDate];
            if (v21)
            {
              long long v22 = (void *)v21;
              long long v23 = [v10 clientProvidedStartDate];
              [v23 timeIntervalSinceDate:v20];
              double v25 = v24;

              if (v25 > 0.0)
              {
                uint64_t v26 = [v10 clientProvidedStartDate];

                uint64_t v20 = v26;
              }
            }
            [v10 setStartAfter:v20];
            v27 = [v10 startAfter];
            v28 = [v27 dateByAddingTimeInterval:3600.0];
            [v10 setStartBefore:v28];

            v29 = +[_DASDaemonLogger logForCategory:@"exposure-notification"];
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              v30 = [v10 debugDescription];
              *(_DWORD *)buf = 138543618;
              v40 = v10;
              __int16 v41 = 2112;
              v42 = v30;
              _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%{public}@ now an EN app %@", buf, 0x16u);
            }
LABEL_25:
          }
          else
          {
            if (!v15) {
              continue;
            }
            [v10 setIsContactTracingBackgroundActivity:0];
            uint64_t v20 = +[_DASDaemonLogger logForCategory:@"exposure-notification"];
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              v29 = [v10 debugDescription];
              *(_DWORD *)buf = 138543618;
              v40 = v10;
              __int16 v41 = 2112;
              v42 = v29;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ no longer an EN app %@", buf, 0x16u);
              goto LABEL_25;
            }
          }

          v31 = [v32 store];
          [v31 saveActivity:v10];

          continue;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v35 objects:v43 count:16];
    }
    while (v7);
  }
}

- (BOOL)isPossibleENActivity:(id)a3
{
  id v3 = a3;
  id v4 = [v3 launchReason];
  if ([v4 isEqualToString:_DASLaunchReasonBackgroundProcessing])
  {
    id v5 = [v3 clientProvidedIdentifier];
    unsigned __int8 v6 = [v5 hasSuffix:@"exposure-notification"];
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (void)setIsENActivity:(id)a3
{
  id v4 = a3;
  [v4 setIsContactTracingBackgroundActivity:0];
  if (!+[_DASConfig isiPhone])
  {
    id v14 = +[_DASDaemonLogger logForCategory:@"exposure-notification"];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      LOWORD(v19) = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Exposure Notification not supported on non-iPhone device", (uint8_t *)&v19, 2u);
    }
    goto LABEL_12;
  }
  if ([(_DASENManager *)self isPossibleENActivity:v4])
  {
    id v5 = [v4 relatedApplications];
    unsigned __int8 v6 = [v5 firstObject];
    unint64_t v7 = [(_DASENManager *)self launchIntervalForENApplication:v6];
    double v8 = (double)v7;

    if (v7)
    {
      dispatch_time_t v9 = +[NSDate now];
      unint64_t v10 = [v9 dateByAddingTimeInterval:v8];

      id v11 = [v4 clientProvidedStartDate];
      if (v11)
      {
        v12 = [v4 clientProvidedStartDate];
        unint64_t v13 = [v12 laterDate:v10];
        [v4 setStartAfter:v13];
      }
      else
      {
        [v4 setStartAfter:v10];
      }

      unsigned int v15 = [v4 startAfter];
      id v16 = [v15 dateByAddingTimeInterval:3600.0];
      [v4 setStartBefore:v16];

      [v4 setIsContactTracingBackgroundActivity:1];
    }
    id v14 = +[_DASDaemonLogger logForCategory:@"exposure-notification"];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v17 = [v4 isContactTracingBackgroundActivity];
      uint64_t v18 = [v4 startAfter];
      int v19 = 138544130;
      id v20 = v4;
      __int16 v21 = 2048;
      double v22 = v8 / 60.0;
      __int16 v23 = 1024;
      unsigned int v24 = v17;
      __int16 v25 = 2114;
      uint64_t v26 = v18;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Activity: %{public}@, Interval=%.0lf, isCTBackgroundActivity=%u, Eligible=%{public}@", (uint8_t *)&v19, 0x26u);
    }
LABEL_12:
  }
}

- (int)token
{
  return self->_token;
}

- (void)setToken:(int)a3
{
  self->_token = a3;
}

@end