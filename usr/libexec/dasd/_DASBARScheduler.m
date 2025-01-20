@interface _DASBARScheduler
+ (id)barSchedulerWithScheduler:(id)a3;
- (BOOL)appUsesBackgroundTaskScheduler:(id)a3;
- (BOOL)applicationStateRequiresImmediateDelivery:(id)a3;
- (BOOL)backgroundAppRefreshEnabled;
- (BOOL)backgroundAppRefreshEnabledForApp:(id)a3;
- (BOOL)backgroundLaunchAllowedForApp:(id)a3;
- (BOOL)backgroundLaunchAllowedForBGTaskActivity:(id)a3;
- (BOOL)barEnabled;
- (BOOL)barWiFiOnly;
- (BOOL)isBAREnabledOnWiFiOnly;
- (BOOL)isNewsstandApp:(id)a3;
- (BOOL)pushLaunchAllowedForApp:(id)a3 immediately:(BOOL *)a4;
- (NSMutableDictionary)appToMinimumLaunchDelay;
- (NSMutableDictionary)appsToPendingTasks;
- (NSMutableSet)appsLaunchedInLastFourteenDays;
- (NSMutableSet)appsLaunchedInLastThreeDays;
- (NSMutableSet)disallowedApps;
- (NSMutableSet)fetchEnabledApps;
- (NSMutableSet)killedApps;
- (NSMutableSet)newsstandApps;
- (NSMutableSet)pushEnabledApps;
- (NSSet)foregroundApps;
- (NSUserDefaults)barPreferences;
- (NSUserDefaults)delayPreferences;
- (NSUserDefaults)killedAppPreferences;
- (NSUserDefaults)lastLaunchPreferences;
- (OS_dispatch_queue)queue;
- (OS_dispatch_queue)schedulingQueue;
- (OS_dispatch_source)appUpdateTimer;
- (OS_os_log)log;
- (SBSApplicationUserQuitMonitor)quitMonitor;
- (_DASActivityGroup)barGroup;
- (_DASBARScheduler)initWithScheduler:(id)a3;
- (_DASDaemon)scheduler;
- (_DKKnowledgeQuerying)knowledgeStore;
- (double)minimumDelayBetweenLaunchesForApp:(id)a3;
- (id)appsLaunchedInLastDays:(int)a3;
- (id)queueAppsEligibleForBackgroundFetchInSet:(id)a3;
- (id)queueAppsWithDelaySpecifiedInSet:(id)a3;
- (id)queueObtainAppsEligibleForBackgroundFetch;
- (id)queuePendingRefreshes;
- (id)topNAppsUserHasLaunchedInSet:(id)a3;
- (int)barSettingsChangedToken;
- (void)applicationsDidInstall:(id)a3;
- (void)applicationsDidUninstall:(id)a3;
- (void)cancelActivitiesForAllApps;
- (void)createBARApplicationGroup;
- (void)dealloc;
- (void)determineAppsWithBackgroundRunningModes;
- (void)disableAppRefreshForApps:(id)a3;
- (void)handleAppsForegrounded:(id)a3;
- (void)queueCancelActivitiesForAllApps;
- (void)queueCancelActivitiesForApps:(id)a3;
- (void)queueHandleAppKilled:(id)a3;
- (void)queueHandleAppsKilled:(id)a3;
- (void)queueHandleAppsRevived:(id)a3;
- (void)queueHandleAppsUninstalled:(id)a3;
- (void)queueHandleBARSettingsChangedNotification:(BOOL)a3;
- (void)queueReloadRequestedDelays;
- (void)queueScheduleActivitiesForEligibleApps:(id)a3 withDelay:(BOOL)a4;
- (void)queueScheduleActivityForApp:(id)a3 startingAfter:(id)a4;
- (void)queueStartIfBAREnabled;
- (void)queueUpdateLastLaunchTimesToDate:(id)a3 forApps:(id)a4;
- (void)queue_cancelBackgroundTasksForUnusedApps;
- (void)quitMonitor:(id)a3 userClosedLastSceneOfApplicationWithBundleID:(id)a4;
- (void)recordBARState;
- (void)registerForAppKilledNotifications;
- (void)registerForBARNotifications;
- (void)reloadRequestedDelays;
- (void)setAppToMinimumLaunchDelay:(id)a3;
- (void)setAppUpdateTimer:(id)a3;
- (void)setAppsLaunchedInLastFourteenDays:(id)a3;
- (void)setAppsLaunchedInLastThreeDays:(id)a3;
- (void)setAppsToPendingTasks:(id)a3;
- (void)setBarEnabled:(BOOL)a3;
- (void)setBarGroup:(id)a3;
- (void)setBarPreferences:(id)a3;
- (void)setBarSettingsChangedToken:(int)a3;
- (void)setBarWiFiOnly:(BOOL)a3;
- (void)setDelayPreferences:(id)a3;
- (void)setDisallowedApps:(id)a3;
- (void)setFetchEnabledApps:(id)a3;
- (void)setForegroundApps:(id)a3;
- (void)setKilledAppPreferences:(id)a3;
- (void)setKilledApps:(id)a3;
- (void)setKnowledgeStore:(id)a3;
- (void)setLastLaunchPreferences:(id)a3;
- (void)setLog:(id)a3;
- (void)setMinimumBackgroundFetchInterval:(double)a3 forApp:(id)a4;
- (void)setNewsstandApps:(id)a3;
- (void)setPushEnabledApps:(id)a3;
- (void)setQueue:(id)a3;
- (void)setQuitMonitor:(id)a3;
- (void)setScheduler:(id)a3;
- (void)setSchedulingQueue:(id)a3;
- (void)start;
- (void)startIfBAREnabled;
@end

@implementation _DASBARScheduler

- (void)setMinimumBackgroundFetchInterval:(double)a3 forApp:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004C9C;
  block[3] = &unk_100175B58;
  id v10 = v6;
  v11 = self;
  double v12 = a3;
  id v8 = v6;
  dispatch_sync(queue, block);
}

- (id)queueAppsWithDelaySpecifiedInSet:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = [v4 mutableCopy];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v15 = v4;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v16 objects:v22 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v17;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          double v12 = [(NSMutableDictionary *)self->_appToMinimumLaunchDelay valueForKey:v11];

          if (!v12)
          {
            log = self->_log;
            if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v21 = v11;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "No delay specified for %@", buf, 0xCu);
            }
            [v5 removeObject:v11];
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v16 objects:v22 count:16];
      }
      while (v8);
    }

    id v4 = v15;
  }
  else
  {
    id v5 = v4;
  }

  return v5;
}

- (id)topNAppsUserHasLaunchedInSet:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v51 = (void *)os_transaction_create();
    id v5 = +[NSMutableArray array];
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v63 objects:v72 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v64;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v64 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = +[_DKQuery predicateForEventsWithStringValue:*(void *)(*((void *)&v63 + 1) + 8 * i)];
          [v5 addObject:v11];
        }
        id v8 = [v6 countByEnumeratingWithState:&v63 objects:v72 count:16];
      }
      while (v8);
    }

    double v12 = +[NSDate date];
    uint64_t v13 = [v12 dateByAddingTimeInterval:-1209600.0];
    v49 = +[_DKEventQuery predicateForEventsOfMinimumDuration:10.0];
    v71[0] = v49;
    v14 = +[NSCompoundPredicate orPredicateWithSubpredicates:v5];
    v71[1] = v14;
    id v15 = +[NSArray arrayWithObjects:v71 count:2];
    uint64_t v16 = +[NSCompoundPredicate andPredicateWithSubpredicates:v15];

    long long v17 = +[_DKSystemEventStreams appInFocusStream];
    v50 = (void *)v13;
    id v18 = [objc_alloc((Class)NSDateInterval) initWithStartDate:v13 endDate:v12];
    v48 = (void *)v16;
    long long v19 = +[_DKHistogramQuery histogramQueryForStream:v17 interval:v18 withPredicate:v16];

    v20 = [(_DKKnowledgeQuerying *)self->_knowledgeStore executeQuery:v19 error:0];
    uint64_t v21 = [v20 countDictionary];

    if (!v21) {
      uint64_t v21 = &__NSDictionary0__struct;
    }
    if ((unint64_t)[v21 count] > 0x32)
    {
      v44 = v19;
      v45 = v12;
      id v46 = v4;
      v25 = [v21 allKeys];
      id v26 = [v25 mutableCopy];

      v61[0] = _NSConcreteStackBlock;
      v61[1] = 3221225472;
      v61[2] = sub_100090888;
      v61[3] = &unk_100176080;
      v43 = v21;
      id v62 = v21;
      [v26 sortUsingComparator:v61];
      v27 = +[NSMutableSet set];
      long long v57 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      id v28 = v26;
      id v29 = [v28 countByEnumeratingWithState:&v57 objects:v70 count:16];
      if (v29)
      {
        id v30 = v29;
        int v31 = 0;
        uint64_t v32 = *(void *)v58;
LABEL_16:
        uint64_t v33 = 0;
        while (1)
        {
          if (*(void *)v58 != v32) {
            objc_enumerationMutation(v28);
          }
          v34 = *(void **)(*((void *)&v57 + 1) + 8 * v33);
          if ([v6 containsObject:v34])
          {
            v35 = [v34 dk_dedup];
            [v27 addObject:v35];

            if (++v31 == 50) {
              break;
            }
          }
          if (v30 == (id)++v33)
          {
            id v30 = [v28 countByEnumeratingWithState:&v57 objects:v70 count:16];
            if (v30) {
              goto LABEL_16;
            }
            break;
          }
        }
      }

      id v23 = [v27 mutableCopy];
      double v12 = v45;
      id v4 = v46;
      uint64_t v21 = v43;
      long long v19 = v44;
    }
    else
    {
      v22 = [v21 allKeys];
      id v23 = +[NSMutableSet setWithArray:v22];

      [v23 intersectSet:v6];
    }

    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v24 = v23;
    id v36 = [v24 countByEnumeratingWithState:&v53 objects:v69 count:16];
    if (v36)
    {
      id v37 = v36;
      uint64_t v38 = *(void *)v54;
      do
      {
        for (j = 0; j != v37; j = (char *)j + 1)
        {
          if (*(void *)v54 != v38) {
            objc_enumerationMutation(v24);
          }
          log = self->_log;
          if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v41 = *(void *)(*((void *)&v53 + 1) + 8 * (void)j);
            *(_DWORD *)buf = 138412290;
            uint64_t v68 = v41;
            _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEBUG, "User has launched: %@", buf, 0xCu);
          }
        }
        id v37 = [v24 countByEnumeratingWithState:&v53 objects:v69 count:16];
      }
      while (v37);
    }
  }
  else
  {
    id v24 = v4;
  }

  return v24;
}

- (void)queueUpdateLastLaunchTimesToDate:(id)a3 forApps:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NSUserDefaults *)self->_lastLaunchPreferences dictionaryForKey:@"launches"];
  long long v19 = v8;
  if (v8)
  {
    id v9 = [v8 mutableCopy];
  }
  else
  {
    id v9 = +[NSMutableDictionary dictionary];
  }
  id v10 = v9;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v11 = v7;
  id v12 = [v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
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
        uint64_t v16 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if ([(NSMutableSet *)self->_fetchEnabledApps containsObject:v16])
        {
          log = self->_log;
          if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            id v25 = v11;
            __int16 v26 = 2112;
            id v27 = v6;
            _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEBUG, "Updating last launch time for %@ to %@", buf, 0x16u);
          }
          id v18 = [v16 dk_dedup];
          [v10 setObject:v6 forKeyedSubscript:v18];
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v13);
  }

  [(NSUserDefaults *)self->_lastLaunchPreferences setObject:v10 forKey:@"launches"];
}

- (void)queueHandleAppsRevived:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableSet set];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v19 objects:v25 count:16];
  id v9 = v6;
  if (!v7) {
    goto LABEL_14;
  }
  id v10 = v7;
  char v11 = 0;
  uint64_t v12 = *(void *)v20;
  *(void *)&long long v8 = 138412290;
  long long v18 = v8;
  do
  {
    for (i = 0; i != v10; i = (char *)i + 1)
    {
      if (*(void *)v20 != v12) {
        objc_enumerationMutation(v6);
      }
      uint64_t v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
      if (-[NSMutableSet containsObject:](self->_killedApps, "containsObject:", v14, v18, (void)v19))
      {
        log = self->_log;
        if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v18;
          id v24 = v14;
          _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEBUG, "App revived: %@", buf, 0xCu);
        }
        [(NSMutableSet *)self->_killedApps removeObject:v14];
        uint64_t v16 = [v14 dk_dedup];
        [v5 addObject:v16];

        char v11 = 1;
      }
    }
    id v10 = [v6 countByEnumeratingWithState:&v19 objects:v25 count:16];
  }
  while (v10);

  if (v11)
  {
    killedAppPreferences = self->_killedAppPreferences;
    id v9 = [(NSMutableSet *)self->_killedApps allObjects];
    [(NSUserDefaults *)killedAppPreferences setObject:v9 forKey:@"killed"];
LABEL_14:
  }
}

- (id)queueAppsEligibleForBackgroundFetchInSet:(id)a3
{
  id v4 = [a3 mutableCopy];
  [v4 intersectSet:self->_fetchEnabledApps];
  [v4 minusSet:self->_killedApps];
  [v4 minusSet:self->_disallowedApps];
  id v5 = [(_DASBARScheduler *)self queueAppsWithDelaySpecifiedInSet:v4];
  id v6 = [(_DASBARScheduler *)self topNAppsUserHasLaunchedInSet:v5];

  id v7 = +[NSMutableSet set];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = [*(id *)(*((void *)&v15 + 1) + 8 * i) dk_dedup:v15];
        [v7 addObject:v13];
      }
      id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v7;
}

- (void)queueScheduleActivitiesForEligibleApps:(id)a3 withDelay:(BOOL)a4
{
  id v6 = a3;
  long long v17 = (void *)os_transaction_create();
  long long v18 = v6;
  id v7 = [(_DASBARScheduler *)self queueAppsEligibleForBackgroundFetchInSet:v6];
  id v8 = +[NSDate date];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      id v13 = 0;
      do
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v19 + 1) + 8 * (void)v13);
        if (a4)
        {
          long long v15 = [(NSMutableDictionary *)self->_appToMinimumLaunchDelay objectForKeyedSubscript:*(void *)(*((void *)&v19 + 1) + 8 * (void)v13)];
          [v15 doubleValue];
          long long v16 = [v8 dateByAddingTimeInterval:];
          [(_DASBARScheduler *)self queueScheduleActivityForApp:v14 startingAfter:v16];
        }
        else
        {
          [(_DASBARScheduler *)self queueScheduleActivityForApp:*(void *)(*((void *)&v19 + 1) + 8 * (void)v13) startingAfter:v8];
        }
        id v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v11);
  }
}

- (void)queueCancelActivitiesForApps:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableArray array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v12 = [(NSMutableDictionary *)self->_appsToPendingTasks objectForKeyedSubscript:v11];
        if (v12)
        {
          [v5 addObject:v12];
          [(NSMutableDictionary *)self->_appsToPendingTasks removeObjectForKey:v11];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }

  schedulingQueue = self->_schedulingQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000884C;
  v15[3] = &unk_100175570;
  id v16 = v5;
  long long v17 = self;
  id v14 = v5;
  dispatch_async(schedulingQueue, v15);
}

- (void)handleAppsForegrounded:(id)a3
{
  id v4 = a3;
  id v5 = (void *)os_transaction_create();
  id v7 = +[NSDate date];
  id v8 = +[NSMutableSet set];
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D454;
  block[3] = &unk_100175CF0;
  id v10 = v5;
  id v15 = v10;
  id v16 = self;
  id v11 = v4;
  id v17 = v11;
  id v18 = v8;
  id v19 = v7;
  id v12 = v7;
  id v13 = v8;
  dispatch_sync(queue, block);
}

- (_DASBARScheduler)initWithScheduler:(id)a3
{
  id v5 = a3;
  v45.receiver = self;
  v45.super_class = (Class)_DASBARScheduler;
  id v6 = [(_DASBARScheduler *)&v45 init];
  if (v6)
  {
    id v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.backgroundAppRefresh.syncQueue", v7);
    uint64_t v9 = (void *)*((void *)v6 + 4);
    *((void *)v6 + 4) = v8;

    id v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.backgroundAppRefresh.schedulingQueue", v10);
    id v12 = (void *)*((void *)v6 + 5);
    *((void *)v6 + 5) = v11;

    dispatch_source_t v13 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, *((dispatch_queue_t *)v6 + 4));
    id v14 = (void *)*((void *)v6 + 6);
    *((void *)v6 + 6) = v13;

    dispatch_set_qos_class_fallback();
    objc_storeStrong((id *)v6 + 7, a3);
    uint64_t v15 = +[NSMutableDictionary dictionary];
    id v16 = (void *)*((void *)v6 + 22);
    *((void *)v6 + 22) = v15;

    uint64_t v17 = +[_DASDaemonLogger logForCategory:@"bar"];
    id v18 = (void *)*((void *)v6 + 23);
    *((void *)v6 + 23) = v17;

    uint64_t v19 = +[_DASPredictionManager sharedKnowledgeStore];
    long long v20 = (void *)*((void *)v6 + 3);
    *((void *)v6 + 3) = v19;

    uint64_t v21 = +[NSMutableSet set];
    long long v22 = (void *)*((void *)v6 + 13);
    *((void *)v6 + 13) = v21;

    uint64_t v23 = +[NSMutableSet set];
    id v24 = (void *)*((void *)v6 + 14);
    *((void *)v6 + 14) = v23;

    uint64_t v25 = +[NSMutableSet set];
    __int16 v26 = (void *)*((void *)v6 + 15);
    *((void *)v6 + 15) = v25;

    uint64_t v27 = +[NSMutableSet set];
    id v28 = (void *)*((void *)v6 + 18);
    *((void *)v6 + 18) = v27;

    uint64_t v29 = +[NSMutableSet set];
    id v30 = (void *)*((void *)v6 + 19);
    *((void *)v6 + 19) = v29;

    uint64_t v31 = +[NSMutableSet set];
    uint64_t v32 = (void *)*((void *)v6 + 16);
    *((void *)v6 + 16) = v31;

    uint64_t v33 = +[NSMutableSet set];
    v34 = (void *)*((void *)v6 + 17);
    *((void *)v6 + 17) = v33;

    id v35 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.mt"];
    id v36 = (void *)*((void *)v6 + 9);
    *((void *)v6 + 9) = v35;

    id v37 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.mt.launchDelay"];
    uint64_t v38 = (void *)*((void *)v6 + 10);
    *((void *)v6 + 10) = v37;

    id v39 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.mt.lastLaunch"];
    v40 = (void *)*((void *)v6 + 11);
    *((void *)v6 + 11) = v39;

    id v41 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.mt.killed"];
    v42 = (void *)*((void *)v6 + 12);
    *((void *)v6 + 12) = v41;

    [v6 registerForAppKilledNotifications];
    [v6 reloadRequestedDelays];
    v43 = +[LSApplicationWorkspace defaultWorkspace];
    [v43 addObserver:v6];
  }
  return (_DASBARScheduler *)v6;
}

+ (id)barSchedulerWithScheduler:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)objc_opt_class()) initWithScheduler:v3];

  return v4;
}

- (void)dealloc
{
  int barSettingsChangedToken = self->_barSettingsChangedToken;
  if (barSettingsChangedToken) {
    notify_cancel(barSettingsChangedToken);
  }
  v4.receiver = self;
  v4.super_class = (Class)_DASBARScheduler;
  [(_DASBARScheduler *)&v4 dealloc];
}

- (id)queueObtainAppsEligibleForBackgroundFetch
{
  [(_DASBARScheduler *)self determineAppsWithBackgroundRunningModes];
  id v3 = [(_DASBARScheduler *)self queueAppsEligibleForBackgroundFetchInSet:self->_fetchEnabledApps];
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Apps Eligible: %@", (uint8_t *)&v6, 0xCu);
  }

  return v3;
}

- (void)determineAppsWithBackgroundRunningModes
{
  uint64_t v29 = +[NSMutableSet set];
  id v24 = (void *)os_transaction_create();
  id v3 = +[LSApplicationRecord enumeratorWithOptions:0];
  uint64_t v4 = [v3 nextObject];
  if (v4)
  {
    id v5 = (void *)v4;
    uint64_t v25 = v3;
    while (1)
    {
      if (([v5 isLaunchProhibited] & 1) == 0)
      {
        id v7 = [v5 applicationState];
        unsigned __int8 v8 = [v7 isRestricted];

        if ((v8 & 1) == 0) {
          break;
        }
      }
LABEL_23:
      uint64_t v22 = [v3 nextObject];

      id v5 = (void *)v22;
      if (!v22) {
        goto LABEL_24;
      }
    }
    __int16 v26 = v6;
    uint64_t v9 = [v5 UIBackgroundModes];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v10 = [v9 countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (!v10) {
      goto LABEL_22;
    }
    id v11 = v10;
    uint64_t v12 = *(void *)v31;
LABEL_7:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v31 != v12) {
        objc_enumerationMutation(v9);
      }
      id v14 = *(void **)(*((void *)&v30 + 1) + 8 * v13);
      if ([v14 isEqualToString:@"fetch"]
        && ![(_DASBARScheduler *)self appUsesBackgroundTaskScheduler:v5])
      {
        uint64_t v19 = self->_log;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          log = v19;
          uint64_t v27 = [v5 localizedName];
          uint64_t v21 = [v5 bundleIdentifier];
          *(_DWORD *)buf = 138412546;
          id v35 = v27;
          __int16 v36 = 2112;
          id v37 = v21;
          _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%@ (%@) eligible for BAR", buf, 0x16u);
        }
        long long v20 = [v5 bundleIdentifier];
        id v16 = [v20 dk_dedup];

        [v29 addObject:v16];
        p_fetchEnabledApps = &self->_fetchEnabledApps;
        goto LABEL_19;
      }
      if ([v14 isEqualToString:@"remote-notification"]) {
        break;
      }
      if ([v14 isEqualToString:@"newsstand"])
      {
        id v18 = [v5 bundleIdentifier];
        id v16 = [v18 dk_dedup];

        p_fetchEnabledApps = &self->_newsstandApps;
        goto LABEL_19;
      }
LABEL_20:
      if (v11 == (id)++v13)
      {
        id v11 = [v9 countByEnumeratingWithState:&v30 objects:v38 count:16];
        if (!v11)
        {
LABEL_22:

          id v3 = v25;
          int v6 = v26;
          goto LABEL_23;
        }
        goto LABEL_7;
      }
    }
    uint64_t v15 = [v5 bundleIdentifier];
    id v16 = [v15 dk_dedup];

    p_fetchEnabledApps = &self->_pushEnabledApps;
LABEL_19:
    [(NSMutableSet *)*p_fetchEnabledApps addObject:v16];

    goto LABEL_20;
  }
LABEL_24:
}

- (BOOL)isBAREnabledOnWiFiOnly
{
  id v3 = (void *)os_transaction_create();
  LOBYTE(self) = [(NSUserDefaults *)self->_barPreferences BOOLForKey:@"WiFiOnly"];

  return (char)self;
}

- (void)queueHandleBARSettingsChangedNotification:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)os_transaction_create();
  unsigned int v7 = [(_DASBARScheduler *)self isBAREnabledOnWiFiOnly];
  int v8 = v7;
  if (self->_barEnabled || !v3)
  {
    if (!self->_barEnabled || v3)
    {
      char v13 = !self->_barEnabled || !v3;
      if ((v13 & 1) == 0)
      {
        int barWiFiOnly = self->_barWiFiOnly;
        if (barWiFiOnly != v7)
        {
          log = self->_log;
          if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEBUG)) {
            sub_1000FB3A4(v8, log);
          }
          self->_int barWiFiOnly = v8;
        }
        id v16 = [(NSUserDefaults *)self->_barPreferences dictionaryForKey:@"KeepAppsUpToDateAppList"];
        id v17 = [v16 mutableCopy];

        id v18 = +[NSMutableSet set];
        +[NSMutableSet set];
        v59[0] = _NSConcreteStackBlock;
        v59[1] = 3221225472;
        v59[2] = sub_100090F58;
        v59[3] = &unk_100176AF0;
        id v19 = (id)objc_claimAutoreleasedReturnValue();
        id v60 = v19;
        id v20 = v18;
        id v61 = v20;
        [v17 enumerateKeysAndObjectsUsingBlock:v59];
        if ([v20 count])
        {
          if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
            sub_1000FB33C();
          }
          [(_DASBARScheduler *)self queueCancelActivitiesForApps:v20];
          [(_DASDaemon *)self->_scheduler cancelPushLaunchTasksForApps:v20];
          [(_DASDaemon *)self->_scheduler cancelBackgroundTasksForApps:v20];
          [(NSMutableSet *)self->_disallowedApps unionSet:v20];
        }
        if ([v19 count])
        {
          if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
            sub_1000FB2D4();
          }
          uint64_t v21 = [(_DASBARScheduler *)self queuePendingRefreshes];
          [v19 minusSet:v21];
          [(NSMutableSet *)self->_disallowedApps minusSet:v19];
          [(_DASBARScheduler *)self queueScheduleActivitiesForEligibleApps:v19 withDelay:1];
        }
        if (barWiFiOnly != v8)
        {
          id v46 = v20;
          id v47 = v19;
          id v48 = v17;
          v49 = v6;
          v50 = v5;
          uint64_t v22 = [(_DASBARScheduler *)self queuePendingRefreshes];
          long long v55 = 0u;
          long long v56 = 0u;
          long long v57 = 0u;
          long long v58 = 0u;
          id v23 = [v22 countByEnumeratingWithState:&v55 objects:v67 count:16];
          if (v23)
          {
            id v24 = v23;
            uint64_t v25 = *(void *)v56;
            do
            {
              __int16 v26 = 0;
              do
              {
                if (*(void *)v56 != v25) {
                  objc_enumerationMutation(v22);
                }
                uint64_t v27 = *(void *)(*((void *)&v55 + 1) + 8 * (void)v26);
                BOOL v28 = self->_barWiFiOnly;
                uint64_t v29 = [(NSMutableDictionary *)self->_appsToPendingTasks objectForKeyedSubscript:v27];
                [v29 setRequiresInexpensiveNetworking:v28];

                long long v30 = self->_log;
                if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
                {
                  appsToPendingTasks = self->_appsToPendingTasks;
                  long long v32 = v30;
                  uint64_t v33 = [(NSMutableDictionary *)appsToPendingTasks objectForKeyedSubscript:v27];
                  v34 = (void *)v33;
                  CFStringRef v35 = @"requires";
                  if (!self->_barWiFiOnly) {
                    CFStringRef v35 = @"does not require";
                  }
                  *(_DWORD *)buf = 138412546;
                  uint64_t v64 = v33;
                  __int16 v65 = 2112;
                  CFStringRef v66 = v35;
                  _os_log_debug_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "Activity %@ now %@ inexepensive networking", buf, 0x16u);
                }
                __int16 v26 = (char *)v26 + 1;
              }
              while (v24 != v26);
              id v36 = [v22 countByEnumeratingWithState:&v55 objects:v67 count:16];
              id v24 = v36;
            }
            while (v36);
          }
          id v37 = [(_DASDaemon *)self->_scheduler allPendingPushLaunchTasks];
          long long v51 = 0u;
          long long v52 = 0u;
          long long v53 = 0u;
          long long v54 = 0u;
          id v38 = [v37 countByEnumeratingWithState:&v51 objects:v62 count:16];
          if (v38)
          {
            id v39 = v38;
            uint64_t v40 = *(void *)v52;
            do
            {
              id v41 = 0;
              do
              {
                if (*(void *)v52 != v40) {
                  objc_enumerationMutation(v37);
                }
                v42 = *(void **)(*((void *)&v51 + 1) + 8 * (void)v41);
                [v42 setRequiresInexpensiveNetworking:self->_barWiFiOnly];
                v43 = self->_log;
                if (os_log_type_enabled((os_log_t)v43, OS_LOG_TYPE_DEBUG))
                {
                  CFStringRef v44 = @"requires";
                  if (!self->_barWiFiOnly) {
                    CFStringRef v44 = @"does not require";
                  }
                  *(_DWORD *)buf = 138412546;
                  uint64_t v64 = (uint64_t)v42;
                  __int16 v65 = 2112;
                  CFStringRef v66 = v44;
                  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v43, OS_LOG_TYPE_DEBUG, "Activity %@ now %@ inexepensive networking", buf, 0x16u);
                }
                id v41 = (char *)v41 + 1;
              }
              while (v39 != v41);
              id v45 = [v37 countByEnumeratingWithState:&v51 objects:v62 count:16];
              id v39 = v45;
            }
            while (v45);
          }

          int v6 = v49;
          id v5 = v50;
          id v19 = v47;
          id v17 = v48;
          id v20 = v46;
        }
      }
    }
    else
    {
      id v10 = self->_log;
      if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v10, OS_LOG_TYPE_DEFAULT, "BAR now disabled", buf, 2u);
      }
      self->_barEnabled = 0;
      [(_DASBARScheduler *)self queueCancelActivitiesForAllApps];
      [(_DASDaemon *)self->_scheduler cancelAllBackgroundTasks];
      dispatch_suspend((dispatch_object_t)self->_appUpdateTimer);
    }
  }
  else
  {
    id v11 = self->_log;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v11, OS_LOG_TYPE_DEFAULT, "BAR now enabled", buf, 2u);
    }
    self->_barEnabled = 1;
    self->_int barWiFiOnly = v8;
    [(_DASBARScheduler *)self queueStartIfBAREnabled];
  }
  [(_DASBARScheduler *)self recordBARState];
}

- (void)registerForBARNotifications
{
  uint64_t v4 = [(NSUserDefaults *)self->_barPreferences dictionaryForKey:@"KeepAppsUpToDateAppList"];
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100091110;
  block[3] = &unk_100175570;
  id v11 = v4;
  uint64_t v12 = self;
  id v6 = v4;
  dispatch_sync(queue, block);

  unsigned int v7 = (const char *)[@"kKeepAppsUpToDateEnabledChangedNotification" UTF8String];
  int v8 = self->_queue;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100091234;
  handler[3] = &unk_1001759D0;
  handler[4] = self;
  notify_register_dispatch(v7, &self->_barSettingsChangedToken, v8, handler);
  [(_DASBARScheduler *)self recordBARState];
}

- (void)registerForAppKilledNotifications
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100091330;
  block[3] = &unk_1001754F8;
  void block[4] = self;
  dispatch_sync(queue, block);
  uint64_t v4 = (SBSApplicationUserQuitMonitor *)[objc_alloc((Class)SBSApplicationUserQuitMonitor) initWithDelegate:self];
  quitMonitor = self->_quitMonitor;
  self->_quitMonitor = v4;
}

- (void)queueHandleAppKilled:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
    sub_1000FB4F8();
  }
  if (([(NSMutableSet *)self->_killedApps containsObject:v4] & 1) == 0)
  {
    id v5 = [v4 dk_dedup];
    id v6 = +[NSSet setWithObject:v5];

    [(NSMutableSet *)self->_killedApps unionSet:v6];
    killedAppPreferences = self->_killedAppPreferences;
    int v8 = [(NSMutableSet *)self->_killedApps allObjects];
    [(NSUserDefaults *)killedAppPreferences setObject:v8 forKey:@"killed"];

    [(_DASBARScheduler *)self queueCancelActivitiesForApps:v6];
    schedulingQueue = self->_schedulingQueue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000915D8;
    v11[3] = &unk_100175570;
    v11[4] = self;
    id v12 = v6;
    id v10 = v6;
    dispatch_async(schedulingQueue, v11);
  }
}

- (void)queueHandleAppsKilled:(id)a3
{
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
    char v8 = 1;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (([(NSMutableSet *)self->_killedApps containsObject:v10] & 1) == 0)
        {
          killedApps = self->_killedApps;
          id v12 = [v10 dk_dedup];
          [(NSMutableSet *)killedApps addObject:v12];

          char v8 = 0;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
    if ((v8 & 1) == 0)
    {
      killedAppPreferences = self->_killedAppPreferences;
      id v14 = [(NSMutableSet *)self->_killedApps allObjects];
      [(NSUserDefaults *)killedAppPreferences setObject:v14 forKey:@"killed"];

      [(_DASBARScheduler *)self queueCancelActivitiesForApps:v4];
      [(_DASDaemon *)self->_scheduler cancelAppRefreshTasksForApps:v4];
    }
  }
}

- (void)queueHandleAppsUninstalled:(id)a3
{
  id v4 = a3;
  [(_DASBARScheduler *)self queueCancelActivitiesForApps:v4];
  schedulingQueue = self->_schedulingQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100091988;
  block[3] = &unk_100175570;
  void block[4] = self;
  id v6 = v4;
  id v22 = v6;
  dispatch_async(schedulingQueue, block);
  [(NSMutableSet *)self->_fetchEnabledApps minusSet:v6];
  [(NSMutableSet *)self->_pushEnabledApps minusSet:v6];
  [(NSMutableSet *)self->_newsstandApps minusSet:v6];
  uint64_t v7 = [(NSUserDefaults *)self->_barPreferences dictionaryForKey:@"KeepAppsUpToDateAppList"];
  id v8 = [v7 mutableCopy];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        -[NSMutableDictionary removeObjectForKey:](self->_appToMinimumLaunchDelay, "removeObjectForKey:", v14, (void)v17);
        [v8 removeObjectForKey:v14];
      }
      id v11 = [v9 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v11);
  }

  barPreferences = self->_barPreferences;
  id v16 = [v8 copy];
  [(NSUserDefaults *)barPreferences setObject:v16 forKey:@"KeepAppsUpToDateAppList"];

  [(NSUserDefaults *)self->_delayPreferences setObject:self->_appToMinimumLaunchDelay forKey:@"delays"];
  [(_DASBARScheduler *)self queueUpdateLastLaunchTimesToDate:0 forApps:v9];
  [(_DASBARScheduler *)self queueHandleAppsRevived:v9];
}

- (void)applicationsDidUninstall:(id)a3
{
  id v4 = a3;
  id v5 = (void *)os_transaction_create();
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100091A4C;
  v8[3] = &unk_100175570;
  id v9 = v4;
  id v10 = self;
  id v7 = v4;
  dispatch_sync(queue, v8);
}

- (void)applicationsDidInstall:(id)a3
{
  id v4 = a3;
  id v5 = (void *)os_transaction_create();
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100091C4C;
  block[3] = &unk_100175548;
  id v10 = v5;
  id v11 = v4;
  uint64_t v12 = self;
  id v7 = v4;
  id v8 = v5;
  dispatch_sync(queue, block);
}

- (id)appsLaunchedInLastDays:(int)a3
{
  id v5 = (void *)os_transaction_create();
  id v6 = +[NSMutableDictionary dictionary];
  id v7 = +[NSDate date];
  [v7 timeIntervalSinceReferenceDate];
  uint64_t v9 = v8;
  id v10 = [v7 dateByAddingTimeInterval:(double)(-86400 * a3)];
  [v10 timeIntervalSinceReferenceDate];
  double v12 = v11;

  char v13 = +[BMStreams appLaunch];
  uint64_t v14 = [v13 publisherFromStartTime:v12];
  long long v15 = [v14 filterWithIsIncluded:&stru_100177410];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10009212C;
  v23[3] = &unk_100177438;
  v23[4] = self;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10009219C;
  v20[3] = &unk_100175DA0;
  uint64_t v22 = v9;
  id v21 = v6;
  id v16 = v6;
  id v17 = [v15 sinkWithCompletion:v23 receiveInput:v20];

  id v18 = [v16 copy];

  return v18;
}

- (void)queue_cancelBackgroundTasksForUnusedApps
{
  BOOL v3 = [(_DASBARScheduler *)self appsLaunchedInLastDays:14];
  [(NSMutableSet *)self->_appsLaunchedInLastFourteenDays removeAllObjects];
  [(NSMutableSet *)self->_appsLaunchedInLastThreeDays removeAllObjects];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000923D4;
  v8[3] = &unk_100175498;
  void v8[4] = self;
  [v3 enumerateKeysAndObjectsUsingBlock:v8];
  schedulingQueue = self->_schedulingQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009244C;
  block[3] = &unk_100175570;
  void block[4] = self;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(schedulingQueue, block);
}

- (id)queuePendingRefreshes
{
  BOOL v3 = +[NSMutableSet set];
  id v4 = [(NSMutableDictionary *)self->_appsToPendingTasks allKeys];
  [v3 addObjectsFromArray:v4];

  return v3;
}

- (void)queueCancelActivitiesForAllApps
{
  BOOL v3 = [(NSMutableDictionary *)self->_appsToPendingTasks allValues];
  [(NSMutableDictionary *)self->_appsToPendingTasks removeAllObjects];
  schedulingQueue = self->_schedulingQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000926DC;
  v6[3] = &unk_100175570;
  id v7 = v3;
  uint64_t v8 = self;
  id v5 = v3;
  dispatch_async(schedulingQueue, v6);
}

- (void)cancelActivitiesForAllApps
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100092854;
  block[3] = &unk_1001754F8;
  void block[4] = self;
  dispatch_sync(queue, block);
}

- (void)queueScheduleActivityForApp:(id)a3 startingAfter:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v25 = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "Scheduling refresh for %@", buf, 0xCu);
  }
  if ([v6 isEqualToString:@"com.apple.purplebuddy"])
  {
    uint64_t v9 = self->_log;
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR)) {
      sub_1000FB604((os_log_t)v9);
    }
  }
  else
  {
    id v10 = [(NSMutableDictionary *)self->_appToMinimumLaunchDelay objectForKeyedSubscript:v6];

    if (v10)
    {
      double v11 = +[NSString stringWithFormat:@"%@%@", @"com.apple.fetch.", v6];
      uint64_t v12 = _DASSchedulingPriorityBackground;
      uint64_t v13 = _DASLaunchReasonBackgroundFetch;
      uint64_t v14 = _DASActivityDurationVeryShort;
      long long v15 = [v7 dateByAddingTimeInterval:86400.0];
      id v16 = +[_DASActivity applicationLaunchActivityWithName:v11 priority:v12 forApplication:v6 withReason:v13 duration:v14 startingAfter:v7 startingBefore:v15];

      [v16 setShouldBePersisted:0];
      [v16 setRequiresNetwork:1];
      [v16 setRequiresInexpensiveNetworking:self->_barWiFiOnly];
      [v16 setTransferSize:_DASActivityTransferSizeSmall];
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_100092B40;
      v22[3] = &unk_100177488;
      v22[4] = self;
      id v17 = v6;
      id v23 = v17;
      [v16 setStartHandler:v22];
      [(NSMutableDictionary *)self->_appsToPendingTasks setObject:v16 forKeyedSubscript:v17];
      schedulingQueue = self->_schedulingQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100092CD4;
      block[3] = &unk_100175570;
      void block[4] = self;
      id v21 = v16;
      id v19 = v16;
      dispatch_async(schedulingQueue, block);
    }
  }
}

- (void)createBARApplicationGroup
{
  BOOL v3 = +[_DASActivityGroup groupWithName:@"com.apple.backgroundAppRefresh" maxConcurrent:3];
  barGroup = self->_barGroup;
  self->_barGroup = v3;

  schedulingQueue = self->_schedulingQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100092D84;
  block[3] = &unk_1001754F8;
  void block[4] = self;
  dispatch_async(schedulingQueue, block);
}

- (void)queueStartIfBAREnabled
{
  [(_DASBARScheduler *)self queueReloadRequestedDelays];
  [(_DASBARScheduler *)self createBARApplicationGroup];
  BOOL v3 = [(_DASBARScheduler *)self queueObtainAppsEligibleForBackgroundFetch];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 8 * (void)v7);
        uint64_t v9 = +[NSDate date];
        [(_DASBARScheduler *)self queueScheduleActivityForApp:v8 startingAfter:v9];

        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }
  appUpdateTimer = self->_appUpdateTimer;
  dispatch_time_t v11 = dispatch_walltime(0, 1000000000);
  dispatch_source_set_timer(appUpdateTimer, v11, 0x9D29229E000uLL, 0x19254D3800uLL);
  uint64_t v12 = self->_appUpdateTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100092F58;
  handler[3] = &unk_1001754F8;
  handler[4] = self;
  dispatch_source_set_event_handler(v12, handler);
  dispatch_resume((dispatch_object_t)self->_appUpdateTimer);
}

- (void)startIfBAREnabled
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100093138;
  block[3] = &unk_1001754F8;
  void block[4] = self;
  dispatch_sync(queue, block);
}

- (void)recordBARState
{
  if (self->_barEnabled)
  {
    if (self->_barWiFiOnly) {
      uint64_t v2 = 2;
    }
    else {
      uint64_t v2 = 3;
    }
  }
  else
  {
    uint64_t v2 = 1;
  }
  +[_DASMetricRecorder setValue:v2 forKey:@"com.apple.dasd.barEnabled"];
}

- (void)start
{
  id v4 = +[MCProfileConnection sharedConnection];
  [(_DASBARScheduler *)self registerForBARNotifications];
  unsigned int v5 = [v4 isAutomaticAppUpdatesAllowed];
  log = self->_log;
  BOOL v7 = os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "BAR enabled", buf, 2u);
    }
    self->_barEnabled = 1;
    self->_int barWiFiOnly = [(_DASBARScheduler *)self isBAREnabledOnWiFiOnly];
    [(_DASBARScheduler *)self startIfBAREnabled];
  }
  else if (v7)
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "BAR disabled", v8, 2u);
  }
}

- (BOOL)backgroundLaunchAllowedForApp:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100093354;
  block[3] = &unk_100175B30;
  id v9 = v4;
  id v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

- (BOOL)applicationStateRequiresImmediateDelivery:(id)a3
{
  id v4 = a3;
  unsigned int v5 = +[RBSProcessPredicate predicateMatchingBundleIdentifier:v4];
  id v12 = 0;
  id v6 = +[RBSProcessHandle handleForPredicate:v5 error:&v12];
  id v7 = v12;

  if (v7)
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      sub_1000FB758();
    }
    BOOL v8 = 0;
  }
  else
  {
    id v9 = [v6 currentState];
    if ([v9 isDebugging])
    {
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
        sub_1000FB6F0();
      }
      BOOL v8 = 1;
    }
    else if ([v9 taskState] == 4)
    {
      log = self->_log;
      BOOL v8 = 1;
      if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v14 = v4;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "Remote Notification: %@ - Running", buf, 0xCu);
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  return v8;
}

- (BOOL)pushLaunchAllowedForApp:(id)a3 immediately:(BOOL *)a4
{
  id v6 = a3;
  if (a4)
  {
    *a4 = 0;
    if ([(_DASBARScheduler *)self applicationStateRequiresImmediateDelivery:v6])
    {
      BOOL v7 = 1;
      *a4 = 1;
      goto LABEL_18;
    }
  }
  else if ([(_DASBARScheduler *)self applicationStateRequiresImmediateDelivery:v6])
  {
    BOOL v7 = 1;
    goto LABEL_18;
  }
  if (self->_barEnabled)
  {
    *(void *)&long long v25 = 0;
    *((void *)&v25 + 1) = &v25;
    uint64_t v26 = 0x2020000000;
    char v27 = 1;
    queue = self->_queue;
    long long v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472;
    long long v17 = sub_1000937C8;
    id v18 = &unk_1001774B0;
    id v21 = &v25;
    id v19 = self;
    id v9 = v6;
    id v20 = v9;
    uint64_t v22 = a4;
    dispatch_sync(queue, &v15);
    if (a4 && *a4
      || (+[_APRSPrewarmInterface sharedInstance](_APRSPrewarmInterface, "sharedInstance", v15, v16, v17, v18, v19), id v10 = objc_claimAutoreleasedReturnValue(), v11 = [v10 hasPrewarmAssertionForApplication:v9], v10, !v11))
    {
      BOOL v7 = *(unsigned char *)(*((void *)&v25 + 1) + 24) != 0;
    }
    else
    {
      log = self->_log;
      if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v24 = v9;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "Remote Notification: %@ - Prewarm Assertion", buf, 0xCu);
      }
      BOOL v7 = 0;
    }

    _Block_object_dispose(&v25, 8);
  }
  else
  {
    uint64_t v13 = self->_log;
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_INFO))
    {
      LODWORD(v25) = 138412290;
      *(void *)((char *)&v25 + 4) = v6;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v13, OS_LOG_TYPE_INFO, "Remote Notification: %@ - BAR Disabled", (uint8_t *)&v25, 0xCu);
    }
    BOOL v7 = 0;
  }
LABEL_18:

  return v7;
}

- (BOOL)isNewsstandApp:(id)a3
{
  id v4 = a3;
  unsigned int v5 = v4;
  if (v4)
  {
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2020000000;
    char v15 = 0;
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100093AF8;
    block[3] = &unk_100175B30;
    unsigned int v11 = &v12;
    void block[4] = self;
    id v10 = v4;
    dispatch_sync(queue, block);
    BOOL v7 = *((unsigned char *)v13 + 24) != 0;

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)quitMonitor:(id)a3 userClosedLastSceneOfApplicationWithBundleID:(id)a4
{
  id v6 = a4;
  BOOL v7 = v6;
  if (self->_quitMonitor == a3)
  {
    queue = self->_queue;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100093BE4;
    v9[3] = &unk_100175570;
    v9[4] = self;
    id v10 = v6;
    dispatch_sync(queue, v9);
  }
}

- (void)reloadRequestedDelays
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100093C64;
  block[3] = &unk_1001754F8;
  void block[4] = self;
  dispatch_sync(queue, block);
}

- (void)queueReloadRequestedDelays
{
  id v4 = [(NSUserDefaults *)self->_delayPreferences dictionaryForKey:@"delays"];
  +[NSMutableDictionary dictionary];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100093D80;
  v8[3] = &unk_100175498;
  unsigned int v5 = (NSMutableDictionary *)(id)objc_claimAutoreleasedReturnValue();
  id v9 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:v8];
  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
    sub_1000FB7CC();
  }
  appToMinimumLaunchDelay = self->_appToMinimumLaunchDelay;
  self->_appToMinimumLaunchDelay = v5;
  BOOL v7 = v5;
}

- (double)minimumDelayBetweenLaunchesForApp:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = (double *)&v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0x7FEFFFFFFFFFFFFFLL;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100093ECC;
  block[3] = &unk_100175948;
  void block[4] = self;
  id v10 = v4;
  unsigned int v11 = &v12;
  id v6 = v4;
  dispatch_sync(queue, block);
  double v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (BOOL)backgroundAppRefreshEnabled
{
  return self->_barEnabled;
}

- (BOOL)backgroundAppRefreshEnabledForApp:(id)a3
{
  if (!self->_barEnabled) {
    return 0;
  }
  barPreferences = self->_barPreferences;
  id v4 = a3;
  unsigned int v5 = [(NSUserDefaults *)barPreferences dictionaryForKey:@"KeepAppsUpToDateAppList"];
  id v6 = [v5 objectForKeyedSubscript:v4];

  if (v6) {
    unsigned __int8 v7 = [v6 BOOLValue];
  }
  else {
    unsigned __int8 v7 = 1;
  }

  return v7;
}

- (void)disableAppRefreshForApps:(id)a3
{
  id v4 = a3;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Disabling BAR for %@", (uint8_t *)&v6, 0xCu);
  }
  [(_DASBARScheduler *)self queueHandleAppsKilled:v4];
}

- (BOOL)appUsesBackgroundTaskScheduler:(id)a3
{
  BOOL v3 = [a3 backgroundTaskSchedulerPermittedIdentifiers];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (BOOL)backgroundLaunchAllowedForBGTaskActivity:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 launchReason];
  uint64_t v6 = _DASLaunchReasonBackgroundProcessing;
  if ([v5 isEqualToString:_DASLaunchReasonBackgroundProcessing]) {
    goto LABEL_4;
  }
  id v7 = [v4 launchReason];
  if ([v7 isEqualToString:_DASLaunchReasonHealthResearch])
  {

LABEL_4:
    goto LABEL_5;
  }
  id v23 = [v4 launchReason];
  unsigned __int8 v24 = [v23 isEqualToString:_DASLaunchReasonBackgroundRefresh];

  if (v24)
  {
LABEL_5:
    BOOL v8 = (void *)os_transaction_create();
    id v9 = [v4 relatedApplications];
    id v10 = [v9 firstObject];

    id v11 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v10 allowPlaceholder:0 error:0];
    uint64_t v12 = [v11 applicationState];
    unsigned __int8 v13 = [v12 isValid];

    if ((v13 & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
        sub_1000FBA94();
      }
      goto LABEL_33;
    }
    uint64_t v14 = [v11 applicationState];
    unsigned __int8 v15 = [v14 isInstalled];

    if ((v15 & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
        sub_1000FB9FC();
      }
      goto LABEL_33;
    }
    uint64_t v16 = [v4 launchReason];
    uint64_t v17 = _DASLaunchReasonHealthResearch;
    if (([v16 isEqualToString:_DASLaunchReasonHealthResearch] & 1) != 0
      || ([v4 isContactTracingBackgroundActivity] & 1) != 0)
    {
    }
    else
    {
      unsigned __int8 v31 = [(_DASBARScheduler *)self backgroundLaunchAllowedForApp:v10];

      if ((v31 & 1) == 0)
      {
        if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
          sub_1000FB964();
        }
        goto LABEL_33;
      }
    }
    id v18 = [v4 launchReason];
    unsigned int v19 = [v18 isEqualToString:_DASLaunchReasonBackgroundRefresh];

    if (v19)
    {
      id v20 = [v11 UIBackgroundModes];
      id v21 = v20;
      CFStringRef v22 = @"fetch";
    }
    else
    {
      long long v30 = [v4 launchReason];
      if ([v30 isEqualToString:v6])
      {
      }
      else
      {
        long long v32 = [v4 launchReason];
        unsigned int v33 = [v32 isEqualToString:v17];

        if (!v33)
        {
LABEL_31:
          if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
            sub_1000FB8CC();
          }
LABEL_33:
          BOOL v29 = 0;
LABEL_34:

          goto LABEL_35;
        }
      }
      id v20 = [v11 UIBackgroundModes];
      id v21 = v20;
      CFStringRef v22 = @"processing";
    }
    unsigned __int8 v34 = [v20 containsObject:v22];

    if (v34)
    {
      CFStringRef v35 = [v4 clientProvidedIdentifier];
      if (v35
        && ([v11 backgroundTaskSchedulerPermittedIdentifiers],
            id v36 = objc_claimAutoreleasedReturnValue(),
            unsigned __int8 v37 = [v36 containsObject:v35],
            v36,
            (v37 & 1) != 0))
      {
        BOOL v29 = 1;
      }
      else
      {
        if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
          sub_1000FB834();
        }
        BOOL v29 = 0;
      }

      goto LABEL_34;
    }
    goto LABEL_31;
  }
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v26 = log;
    char v27 = [v4 name];
    BOOL v28 = [v4 launchReason];
    int v39 = 138543618;
    uint64_t v40 = v27;
    __int16 v41 = 2114;
    v42 = v28;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Activity %{public}@ launch reason %{public}@ is not a BGTask reason. Allowing background launch.", (uint8_t *)&v39, 0x16u);
  }
  BOOL v29 = 1;
LABEL_35:

  return v29;
}

- (BOOL)barEnabled
{
  return self->_barEnabled;
}

- (void)setBarEnabled:(BOOL)a3
{
  self->_barEnabled = a3;
}

- (BOOL)barWiFiOnly
{
  return self->_barWiFiOnly;
}

- (void)setBarWiFiOnly:(BOOL)a3
{
  self->_int barWiFiOnly = a3;
}

- (SBSApplicationUserQuitMonitor)quitMonitor
{
  return self->_quitMonitor;
}

- (void)setQuitMonitor:(id)a3
{
}

- (_DKKnowledgeQuerying)knowledgeStore
{
  return self->_knowledgeStore;
}

- (void)setKnowledgeStore:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)schedulingQueue
{
  return self->_schedulingQueue;
}

- (void)setSchedulingQueue:(id)a3
{
}

- (OS_dispatch_source)appUpdateTimer
{
  return self->_appUpdateTimer;
}

- (void)setAppUpdateTimer:(id)a3
{
}

- (int)barSettingsChangedToken
{
  return self->_barSettingsChangedToken;
}

- (void)setBarSettingsChangedToken:(int)a3
{
  self->_int barSettingsChangedToken = a3;
}

- (_DASDaemon)scheduler
{
  return self->_scheduler;
}

- (void)setScheduler:(id)a3
{
}

- (_DASActivityGroup)barGroup
{
  return self->_barGroup;
}

- (void)setBarGroup:(id)a3
{
}

- (NSUserDefaults)barPreferences
{
  return self->_barPreferences;
}

- (void)setBarPreferences:(id)a3
{
}

- (NSUserDefaults)delayPreferences
{
  return self->_delayPreferences;
}

- (void)setDelayPreferences:(id)a3
{
}

- (NSUserDefaults)lastLaunchPreferences
{
  return self->_lastLaunchPreferences;
}

- (void)setLastLaunchPreferences:(id)a3
{
}

- (NSUserDefaults)killedAppPreferences
{
  return self->_killedAppPreferences;
}

- (void)setKilledAppPreferences:(id)a3
{
}

- (NSMutableSet)fetchEnabledApps
{
  return self->_fetchEnabledApps;
}

- (void)setFetchEnabledApps:(id)a3
{
}

- (NSMutableSet)pushEnabledApps
{
  return self->_pushEnabledApps;
}

- (void)setPushEnabledApps:(id)a3
{
}

- (NSMutableSet)newsstandApps
{
  return self->_newsstandApps;
}

- (void)setNewsstandApps:(id)a3
{
}

- (NSMutableSet)disallowedApps
{
  return self->_disallowedApps;
}

- (void)setDisallowedApps:(id)a3
{
}

- (NSMutableSet)killedApps
{
  return self->_killedApps;
}

- (void)setKilledApps:(id)a3
{
}

- (NSMutableSet)appsLaunchedInLastFourteenDays
{
  return self->_appsLaunchedInLastFourteenDays;
}

- (void)setAppsLaunchedInLastFourteenDays:(id)a3
{
}

- (NSMutableSet)appsLaunchedInLastThreeDays
{
  return self->_appsLaunchedInLastThreeDays;
}

- (void)setAppsLaunchedInLastThreeDays:(id)a3
{
}

- (NSSet)foregroundApps
{
  return self->_foregroundApps;
}

- (void)setForegroundApps:(id)a3
{
}

- (NSMutableDictionary)appToMinimumLaunchDelay
{
  return self->_appToMinimumLaunchDelay;
}

- (void)setAppToMinimumLaunchDelay:(id)a3
{
}

- (NSMutableDictionary)appsToPendingTasks
{
  return self->_appsToPendingTasks;
}

- (void)setAppsToPendingTasks:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_appsToPendingTasks, 0);
  objc_storeStrong((id *)&self->_appToMinimumLaunchDelay, 0);
  objc_storeStrong((id *)&self->_foregroundApps, 0);
  objc_storeStrong((id *)&self->_appsLaunchedInLastThreeDays, 0);
  objc_storeStrong((id *)&self->_appsLaunchedInLastFourteenDays, 0);
  objc_storeStrong((id *)&self->_killedApps, 0);
  objc_storeStrong((id *)&self->_disallowedApps, 0);
  objc_storeStrong((id *)&self->_newsstandApps, 0);
  objc_storeStrong((id *)&self->_pushEnabledApps, 0);
  objc_storeStrong((id *)&self->_fetchEnabledApps, 0);
  objc_storeStrong((id *)&self->_killedAppPreferences, 0);
  objc_storeStrong((id *)&self->_lastLaunchPreferences, 0);
  objc_storeStrong((id *)&self->_delayPreferences, 0);
  objc_storeStrong((id *)&self->_barPreferences, 0);
  objc_storeStrong((id *)&self->_barGroup, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_appUpdateTimer, 0);
  objc_storeStrong((id *)&self->_schedulingQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_knowledgeStore, 0);

  objc_storeStrong((id *)&self->_quitMonitor, 0);
}

@end