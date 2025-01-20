@interface STUsageManager
+ (id)usageGenesisDate;
+ (int64_t)_notificationDelayForDateComponentForDSID:(id)a3 maximumDelay:(unsigned int)a4;
- (BOOL)_updateContext:(id)a3 lastWeekScreenTime:(double)a4 weekBeforeLastScreenTime:(double)a5;
- (BOOL)isScreenTimeEnabled;
- (BOOL)resetTimelinesOnNextRollup;
- (NSBackgroundActivityScheduler)hourlyUsageRollupActivity;
- (NSDate)lastCoreDuetQueryDate;
- (NSDate)usageGenesisDate;
- (NSFetchedResultsController)usageRequestsFetchedResultsController;
- (NSOperationQueue)rollupOperationQueue;
- (OS_dispatch_queue)rollupQueue;
- (STPersistenceControllerProtocol)persistenceController;
- (STUsageManager)initWithPersistenceController:(id)a3;
- (STUsageManager)initWithPersistenceController:(id)a3 usageReporter:(id)a4;
- (STXPCEventObserver)weeklyAlarmObserver;
- (USUsageReporter)usageReporter;
- (id)_dateComponentsForNextWeeklyNotification;
- (void)_addDuetNotificationObservers;
- (void)_duetKnowledgeStorageDidTombstoneEventsNotification:(id)a3;
- (void)_postNotification:(id)a3 rollupError:(id)a4 calendar:(id)a5 startOfLastWeek:(id)a6 completionHandler:(id)a7;
- (void)_purgeAllUsage:(BOOL)a3 completionHandler:(id)a4;
- (void)_purgeUsageOperation:(id)a3 cancelledDidChange:(BOOL)a4;
- (void)_purgeUsageOperation:(id)a3 executingDidChange:(BOOL)a4;
- (void)_purgeUsageOperation:(id)a3 finishedDidChange:(BOOL)a4;
- (void)_removeDuetNotificationObservers;
- (void)_resetUsageAndRollupWithCompletionHandler:(id)a3;
- (void)_rollupIfNeeded;
- (void)_rollupOperation:(id)a3 cancelledDidChange:(BOOL)a4;
- (void)_rollupOperation:(id)a3 executingDidChange:(BOOL)a4;
- (void)_rollupOperation:(id)a3 finishedDidChange:(BOOL)a4;
- (void)_rollupUsageWithOperation:(id)a3 completionHandler:(id)a4;
- (void)_scheduleNextWeeklyReportNotificationAfterRollup:(BOOL)a3;
- (void)_unscheduleNextWeeklyReportNotification;
- (void)_usageOperationDidFinish:(id)a3 completion:(id)a4;
- (void)controllerDidChangeContent:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)performWeeklyRollupWithCompletionHandler:(id)a3;
- (void)resume;
- (void)rollupUsageForDuration:(int64_t)a3 isBackgroundTask:(BOOL)a4 isRecomputingUsage:(BOOL)a5 completionHandler:(id)a6;
- (void)setLastCoreDuetQueryDate:(id)a3;
- (void)setPersistenceController:(id)a3;
- (void)setResetTimelinesOnNextRollup:(BOOL)a3;
- (void)setRollupOperationQueue:(id)a3;
- (void)setRollupQueue:(id)a3;
- (void)setScreenTimeEnabled:(BOOL)a3;
- (void)setUsageGenesisDate:(id)a3;
- (void)setUsageReporter:(id)a3;
- (void)setUsageRequestsFetchedResultsController:(id)a3;
- (void)setWeeklyAlarmObserver:(id)a3;
@end

@implementation STUsageManager

- (STUsageManager)initWithPersistenceController:(id)a3 usageReporter:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v27.receiver = self;
  v27.super_class = (Class)STUsageManager;
  v9 = [(STUsageManager *)&v27 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_usageReporter, a4);
    objc_storeStrong((id *)&v10->_persistenceController, a3);
    v11 = (NSBackgroundActivityScheduler *)[objc_alloc((Class)NSBackgroundActivityScheduler) initWithIdentifier:@"com.apple.ScreenTimeAgent.activity.hourly-usage-rollup"];
    hourlyUsageRollupActivity = v10->_hourlyUsageRollupActivity;
    v10->_hourlyUsageRollupActivity = v11;

    dispatch_queue_t v13 = dispatch_queue_create("com.apple.ScreenTimeAgent.usage-rollup", 0);
    rollupQueue = v10->_rollupQueue;
    v10->_rollupQueue = (OS_dispatch_queue *)v13;

    uint64_t v15 = objc_opt_new();
    rollupOperationQueue = v10->_rollupOperationQueue;
    v10->_rollupOperationQueue = (NSOperationQueue *)v15;

    [(NSOperationQueue *)v10->_rollupOperationQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v10->_rollupOperationQueue setName:@"com.apple.ScreenTimeAgent.usage-rollup"];
    uint64_t v17 = objc_opt_new();
    queuedRollupOperations = v10->_queuedRollupOperations;
    v10->_queuedRollupOperations = (NSMutableArray *)v17;

    uint64_t v19 = objc_opt_new();
    queuedPurgeUsageOperations = v10->_queuedPurgeUsageOperations;
    v10->_queuedPurgeUsageOperations = (NSMutableArray *)v19;

    v21 = +[STXPCEventDispatcher alarmEventDispatcher];
    uint64_t v22 = [v21 registerObserverWithIdentifier:@"Weekly Usage Report"];
    weeklyAlarmObserver = v10->_weeklyAlarmObserver;
    v10->_weeklyAlarmObserver = (STXPCEventObserver *)v22;

    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100095084;
    v25[3] = &unk_1002FB278;
    v26 = v10;
    [(STXPCEventObserver *)v10->_weeklyAlarmObserver setHandler:v25];
  }
  return v10;
}

- (STUsageManager)initWithPersistenceController:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  v6 = [(STUsageManager *)self initWithPersistenceController:v4 usageReporter:v5];

  return v6;
}

+ (id)usageGenesisDate
{
  v2 = +[NSUserDefaults standardUserDefaults];
  v3 = [v2 objectForKey:@"UsageGenesisDate"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (NSDate)usageGenesisDate
{
  return (NSDate *)+[STUsageManager usageGenesisDate];
}

- (void)setUsageGenesisDate:(id)a3
{
  id v5 = a3;
  v3 = +[NSUserDefaults standardUserDefaults];
  id v4 = v3;
  if (v5) {
    [v3 setObject:v5 forKey:@"UsageGenesisDate"];
  }
  else {
    [v3 removeObjectForKey:@"UsageGenesisDate"];
  }
}

- (void)setScreenTimeEnabled:(BOOL)a3
{
  if (self->_screenTimeEnabled != a3)
  {
    self->_screenTimeEnabled = a3;
    id v5 = [(STUsageManager *)self rollupQueue];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100095360;
    v6[3] = &unk_1002FE880;
    v6[4] = self;
    BOOL v7 = a3;
    dispatch_async(v5, v6);
  }
}

- (void)resume
{
  v3 = [(STUsageManager *)self persistenceController];
  id v4 = [v3 viewContext];

  if (_os_feature_enabled_impl())
  {
    id v24 = 0;
    id v5 = +[LegacyUsageShutdownScheduler isLegacyUsageDisabledWithContext:v4 error:&v24];
    id v6 = v24;
    if (v5)
    {
      if ([v5 BOOLValue])
      {
        BOOL v7 = +[STLog usage];
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "resume :: Legacy usage is disabled skipping usage rollup", buf, 2u);
        }

        +[LegacyUsageShutdownScheduler deregisterSystemTask];
        goto LABEL_19;
      }
    }
    else
    {
      id v8 = +[STLog usage];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_1002687DC();
      }
    }
  }
  v9 = [(STUsageManager *)self usageRequestsFetchedResultsController];

  if (!v9)
  {
    v10 = +[STUsageRequest fetchRequestForLocalUsageRequests];
    v11 = +[NSPredicate predicateWithFormat:@"%K != %K", @"requestedDate", @"acknowledgedDate"];
    v12 = [v10 predicate];
    v26[0] = v12;
    v26[1] = v11;
    dispatch_queue_t v13 = +[NSArray arrayWithObjects:v26 count:2];
    v14 = +[NSCompoundPredicate andPredicateWithSubpredicates:v13];
    [v10 setPredicate:v14];

    uint64_t v15 = +[NSSortDescriptor sortDescriptorWithKey:@"requestedDate" ascending:1];
    v25 = v15;
    v16 = +[NSArray arrayWithObjects:&v25 count:1];
    [v10 setSortDescriptors:v16];

    id v17 = [objc_alloc((Class)NSFetchedResultsController) initWithFetchRequest:v10 managedObjectContext:v4 sectionNameKeyPath:0 cacheName:0];
    [(STUsageManager *)self setUsageRequestsFetchedResultsController:v17];
    [v17 setDelegate:self];
    v18 = [(STUsageManager *)self usageRequestsFetchedResultsController];
    id v22 = 0;
    LODWORD(v13) = [v18 performFetch:&v22];
    id v19 = v22;

    if (v13)
    {
      [(STUsageManager *)self _rollupIfNeeded];
    }
    else
    {
      v20 = +[STLog usage];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_100268774();
      }
    }
  }
  id v6 = [(STUsageManager *)self hourlyUsageRollupActivity];
  [v6 setRepeats:1];
  [v6 setInterval:(double)XPC_ACTIVITY_INTERVAL_1_HOUR];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000959AC;
  v21[3] = &unk_1002FE8A8;
  v21[4] = self;
  [v6 scheduleWithBlock:v21];
LABEL_19:
}

- (void)rollupUsageForDuration:(int64_t)a3 isBackgroundTask:(BOOL)a4 isRecomputingUsage:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  v10 = (void (**)(id, void))a6;
  if (_os_feature_enabled_impl())
  {
    v11 = [(STUsageManager *)self persistenceController];
    id v12 = [v11 newBackgroundContext];

    id v33 = 0;
    dispatch_queue_t v13 = +[LegacyUsageShutdownScheduler isLegacyUsageDisabledWithContext:v12 error:&v33];
    id v14 = v33;
    if (v13)
    {
      if ([(STRollupUsageOperation *)v13 BOOLValue])
      {
        uint64_t v15 = +[STLog usage];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "rollupUsageForDuration :: Legacy usage is disabled skipping usage rollup", buf, 2u);
        }

        v10[2](v10, 0);
LABEL_27:

        goto LABEL_28;
      }
    }
    else
    {
      v16 = +[STLog usage];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_100268914();
      }
    }
    id v31 = v14;
    unsigned int v17 = +[LegacyUsageShutdownScheduler scheduleSystemTaskAndReturnError:&v31];
    id v18 = v31;

    id v19 = +[STLog usage];
    v20 = v19;
    if (v17)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Successfully scheduled legacy usage shutdown task", buf, 2u);
      }
    }
    else if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      sub_1002688AC();
    }
  }
  id v14 = [(STUsageManager *)self usageGenesisDate];
  if (v14)
  {
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100095FE0;
    v29[3] = &unk_1002FE8C8;
    v29[4] = a3;
    BOOL v30 = v7;
    id v12 = +[NSPredicate predicateWithBlock:v29];
    v21 = self->_queuedRollupOperations;
    objc_sync_enter(v21);
    id v22 = [(NSMutableArray *)self->_queuedRollupOperations filteredArrayUsingPredicate:v12];
    dispatch_queue_t v13 = [v22 lastObject];

    if (v13)
    {
      objc_sync_exit(v21);

      v23 = +[STLog usage];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Last rollup usage operation hasn't had a chance to run, ignoring new request", buf, 2u);
      }

      if (v10)
      {
        id v24 = objc_retainBlock(v10);
        v25 = [(STUsageManager *)self rollupQueue];
        [(STRollupUsageOperation *)v13 addTarget:self selector:"_usageOperationDidFinish:completion:" forOperationEvents:6 userInfo:v24 delegateQueue:v25];
      }
    }
    else
    {
      v26 = [STRollupUsageOperation alloc];
      objc_super v27 = [(STUsageManager *)self persistenceController];
      dispatch_queue_t v13 = [(STRollupUsageOperation *)v26 initWithPersistenceController:v27 genesisDate:v14 duration:a3 isBackgroundTask:v7 isRecomputingUsage:v6];

      [(NSMutableArray *)self->_queuedRollupOperations addObject:v13];
      objc_sync_exit(v21);

      v28 = +[STLog usage];
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "Adding rollup usage operation...", buf, 2u);
      }

      [(STUsageManager *)self _rollupUsageWithOperation:v13 completionHandler:v10];
    }
    goto LABEL_27;
  }
  if (v10)
  {
    id v12 = +[NSError errorWithDomain:STErrorDomain code:7 userInfo:0];
    ((void (**)(id, id))v10)[2](v10, v12);
LABEL_28:
  }
}

- (void)_rollupUsageWithOperation:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  BOOL v7 = (void (**)(id, void))a4;
  if (_os_feature_enabled_impl())
  {
    id v8 = [(STUsageManager *)self persistenceController];
    id v9 = [v8 newBackgroundContext];

    id v22 = 0;
    v10 = +[LegacyUsageShutdownScheduler isLegacyUsageDisabledWithContext:v9 error:&v22];
    id v11 = v22;
    if (v10)
    {
      if ([v10 BOOLValue])
      {
        id v12 = +[STLog usage];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "_rollupUsageWithOperation :: Legacy usage is disabled skipping usage rollup", buf, 2u);
        }

        if (v7) {
          v7[2](v7, 0);
        }

        goto LABEL_21;
      }
    }
    else
    {
      dispatch_queue_t v13 = +[STLog usage];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_10026897C();
      }
    }
    id v20 = v11;
    unsigned int v14 = +[LegacyUsageShutdownScheduler scheduleSystemTaskAndReturnError:&v20];
    id v15 = v20;

    v16 = +[STLog usage];
    unsigned int v17 = v16;
    if (v14)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Successfully scheduled legacy usage shutdown task", buf, 2u);
      }
    }
    else if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      sub_1002688AC();
    }
  }
  [v6 addObserver:self forKeyPath:@"cancelled" options:1 context:"KVOContextSTUsageManager"];
  [v6 addObserver:self forKeyPath:@"executing" options:1 context:"KVOContextSTUsageManager"];
  [v6 addObserver:self forKeyPath:@"finished" options:1 context:"KVOContextSTUsageManager"];
  if (v7)
  {
    id v18 = objc_retainBlock(v7);
    id v19 = [(STUsageManager *)self rollupQueue];
    [v6 addTarget:self selector:"_usageOperationDidFinish:completion:" forOperationEvents:6 userInfo:v18 delegateQueue:v19];
  }
  id v11 = [(STUsageManager *)self rollupOperationQueue];
  [v11 addOperation:v6];
LABEL_21:
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (a6 == "KVOContextSTUsageManager")
  {
    if ([v11 isEqualToString:@"cancelled"])
    {
      unsigned int v14 = [v13 objectForKeyedSubscript:NSKeyValueChangeNewKey];
      id v15 = +[NSNull null];

      if (v14 == v15)
      {

        unsigned int v14 = 0;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        -[STUsageManager _rollupOperation:cancelledDidChange:](self, "_rollupOperation:cancelledDidChange:", v12, [v14 BOOLValue]);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v18 = +[NSAssertionHandler currentHandler];
          [v18 handleFailureInMethod:a2, self, @"STUsageManager.m", 367, @"Unexpected operation %@", v12 object file lineNumber description];
        }
        -[STUsageManager _purgeUsageOperation:cancelledDidChange:](self, "_purgeUsageOperation:cancelledDidChange:", v12, [v14 BOOLValue]);
      }
    }
    else if ([v11 isEqualToString:@"executing"])
    {
      unsigned int v14 = [v13 objectForKeyedSubscript:NSKeyValueChangeNewKey];
      v16 = +[NSNull null];

      if (v14 == v16)
      {

        unsigned int v14 = 0;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        -[STUsageManager _rollupOperation:executingDidChange:](self, "_rollupOperation:executingDidChange:", v12, [v14 BOOLValue]);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v19 = +[NSAssertionHandler currentHandler];
          [v19 handleFailureInMethod:a2, self, @"STUsageManager.m", 378, @"Unexpected operation %@", v12 object file lineNumber description];
        }
        -[STUsageManager _purgeUsageOperation:executingDidChange:](self, "_purgeUsageOperation:executingDidChange:", v12, [v14 BOOLValue]);
      }
    }
    else
    {
      if (![v11 isEqualToString:@"finished"]) {
        goto LABEL_28;
      }
      unsigned int v14 = [v13 objectForKeyedSubscript:NSKeyValueChangeNewKey];
      unsigned int v17 = +[NSNull null];

      if (v14 == v17)
      {

        unsigned int v14 = 0;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        -[STUsageManager _rollupOperation:finishedDidChange:](self, "_rollupOperation:finishedDidChange:", v12, [v14 BOOLValue]);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v20 = +[NSAssertionHandler currentHandler];
          [v20 handleFailureInMethod:a2, self, @"STUsageManager.m", 389, @"Unexpected operation %@", v12 object file lineNumber description];
        }
        -[STUsageManager _purgeUsageOperation:finishedDidChange:](self, "_purgeUsageOperation:finishedDidChange:", v12, [v14 BOOLValue]);
      }
    }

    goto LABEL_28;
  }
  v21.receiver = self;
  v21.super_class = (Class)STUsageManager;
  [(STUsageManager *)&v21 observeValueForKeyPath:v11 ofObject:v12 change:v13 context:a6];
LABEL_28:
}

- (void)_rollupOperation:(id)a3 cancelledDidChange:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4)
  {
    id v8 = v6;
    BOOL v7 = self->_queuedRollupOperations;
    objc_sync_enter(v7);
    [(NSMutableArray *)self->_queuedRollupOperations removeObject:v8];
    objc_sync_exit(v7);

    id v6 = v8;
  }
}

- (void)_rollupOperation:(id)a3 executingDidChange:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4)
  {
    id v8 = v6;
    BOOL v7 = self->_queuedRollupOperations;
    objc_sync_enter(v7);
    [(NSMutableArray *)self->_queuedRollupOperations removeObject:v8];
    objc_sync_exit(v7);

    id v6 = v8;
  }
}

- (void)_rollupOperation:(id)a3 finishedDidChange:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4)
  {
    BOOL v7 = self->_queuedRollupOperations;
    objc_sync_enter(v7);
    [(NSMutableArray *)self->_queuedRollupOperations removeObject:v6];
    objc_sync_exit(v7);

    [v6 removeObserver:self forKeyPath:@"cancelled" context:"KVOContextSTUsageManager"];
    [v6 removeObserver:self forKeyPath:@"executing" context:"KVOContextSTUsageManager"];
    [v6 removeObserver:self forKeyPath:@"finished" context:"KVOContextSTUsageManager"];
    if ([(STUsageManager *)self resetTimelinesOnNextRollup])
    {
      [(STUsageManager *)self setResetTimelinesOnNextRollup:0];
      id v8 = +[STLog usage];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Reloading Widget Timelines - Usage Rollup Occurred", v12, 2u);
      }

      id v9 = [objc_alloc((Class)CHSTimelineController) initWithExtensionBundleIdentifier:@"com.apple.ScreenTimeWidgetApplication" kind:@"com.apple.ScreenTimeWidgetApplication.ScreenTimeWidgetExtension"];
      v10 = [v9 reloadTimelineWithReason:@"Usage Rollup Occurred"];
      if (v10)
      {
        id v11 = +[STLog usage];
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          sub_100268660();
        }
      }
    }
  }
}

- (void)_purgeAllUsage:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  BOOL v7 = self->_queuedPurgeUsageOperations;
  objc_sync_enter(v7);
  id v8 = (char *)[(NSMutableArray *)self->_queuedPurgeUsageOperations count];
  if (!v8)
  {
    id v13 = [STPurgeUsageOperation alloc];
    unsigned int v14 = [(STUsageManager *)self persistenceController];
    id v9 = [(STPurgeUsageOperation *)v13 initWithPersistenceController:v14 purgeAllUsage:v4];

    [(NSMutableArray *)self->_queuedPurgeUsageOperations addObject:v9];
    objc_sync_exit(v7);

    id v15 = +[STLog usage];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Adding purge usage operation...", buf, 2u);
    }

    if (v6)
    {
      id v16 = objc_retainBlock(v6);
      unsigned int v17 = [(STUsageManager *)self rollupQueue];
      [(STPurgeUsageOperation *)v9 addTarget:self selector:"_usageOperationDidFinish:completion:" forOperationEvents:6 userInfo:v16 delegateQueue:v17];
    }
    [(STPurgeUsageOperation *)v9 addObserver:self forKeyPath:@"cancelled" options:1 context:"KVOContextSTUsageManager"];
    [(STPurgeUsageOperation *)v9 addObserver:self forKeyPath:@"executing" options:1 context:"KVOContextSTUsageManager"];
    [(STPurgeUsageOperation *)v9 addObserver:self forKeyPath:@"finished" options:1 context:"KVOContextSTUsageManager"];
    id v18 = [(STUsageManager *)self rollupOperationQueue];
    [v18 cancelAllOperations];

    id v11 = [(STUsageManager *)self rollupOperationQueue];
    [v11 addOperation:v9];
    goto LABEL_11;
  }
  id v9 = [(NSMutableArray *)self->_queuedPurgeUsageOperations objectAtIndexedSubscript:v8 - 1];
  objc_sync_exit(v7);

  v10 = +[STLog usage];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v19 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Last purge usage operation hasn't had a chance to run, ignoring new request", v19, 2u);
  }

  if (v6)
  {
    id v11 = objc_retainBlock(v6);
    id v12 = [(STUsageManager *)self rollupQueue];
    [(STPurgeUsageOperation *)v9 addTarget:self selector:"_usageOperationDidFinish:completion:" forOperationEvents:6 userInfo:v11 delegateQueue:v12];

LABEL_11:
  }
}

- (void)_purgeUsageOperation:(id)a3 cancelledDidChange:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4)
  {
    id v8 = v6;
    BOOL v7 = self->_queuedPurgeUsageOperations;
    objc_sync_enter(v7);
    [(NSMutableArray *)self->_queuedPurgeUsageOperations removeObject:v8];
    objc_sync_exit(v7);

    id v6 = v8;
  }
}

- (void)_purgeUsageOperation:(id)a3 executingDidChange:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4)
  {
    id v8 = v6;
    BOOL v7 = self->_queuedPurgeUsageOperations;
    objc_sync_enter(v7);
    [(NSMutableArray *)self->_queuedPurgeUsageOperations removeObject:v8];
    objc_sync_exit(v7);

    id v6 = v8;
  }
}

- (void)_purgeUsageOperation:(id)a3 finishedDidChange:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4)
  {
    id v8 = v6;
    BOOL v7 = self->_queuedPurgeUsageOperations;
    objc_sync_enter(v7);
    [(NSMutableArray *)self->_queuedPurgeUsageOperations removeObject:v8];
    objc_sync_exit(v7);

    [v8 removeObserver:self forKeyPath:@"cancelled" context:"KVOContextSTUsageManager"];
    [v8 removeObserver:self forKeyPath:@"executing" context:"KVOContextSTUsageManager"];
    [v8 removeObserver:self forKeyPath:@"finished" context:"KVOContextSTUsageManager"];
    id v6 = v8;
  }
}

- (void)_usageOperationDidFinish:(id)a3 completion:(id)a4
{
  id v12 = a3;
  id v5 = (void (**)(id, uint64_t))a4;
  id v6 = [v12 error];
  BOOL v7 = [v6 domain];
  if ([v7 isEqualToString:CATErrorDomain])
  {
    id v8 = [v12 error];
    id v9 = [v8 code];

    if (v9 == (id)404)
    {
      uint64_t v10 = +[NSError errorWithDomain:STErrorDomain code:7 userInfo:0];
      goto LABEL_6;
    }
  }
  else
  {
  }
  uint64_t v10 = [v12 error];
LABEL_6:
  id v11 = (void *)v10;
  v5[2](v5, v10);
}

- (void)_addDuetNotificationObservers
{
  v3 = +[NSDistributedNotificationCenter defaultCenter];
  uint64_t v4 = _DKKnowledgeStorageDidTombstoneEventsNotification;
  id v5 = +[_DKSystemEventStreams appUsageStream];
  id v6 = [v5 name];
  [v3 addObserver:self selector:"_duetKnowledgeStorageDidTombstoneEventsNotification:" name:v4 object:v6];

  BOOL v7 = +[NSDistributedNotificationCenter defaultCenter];
  id v8 = +[_DKSystemEventStreams appWebUsageStream];
  id v9 = [v8 name];
  [v7 addObserver:self selector:"_duetKnowledgeStorageDidTombstoneEventsNotification:" name:v4 object:v9];

  id v12 = +[NSDistributedNotificationCenter defaultCenter];
  uint64_t v10 = +[_DKSystemEventStreams notificationUsageStream];
  id v11 = [v10 name];
  [v12 addObserver:self selector:"_duetKnowledgeStorageDidTombstoneEventsNotification:" name:v4 object:v11];
}

- (void)_removeDuetNotificationObservers
{
  v3 = +[NSDistributedNotificationCenter defaultCenter];
  uint64_t v4 = _DKKnowledgeStorageDidTombstoneEventsNotification;
  id v5 = +[_DKSystemEventStreams appUsageStream];
  id v6 = [v5 name];
  [v3 removeObserver:self name:v4 object:v6];

  BOOL v7 = +[NSDistributedNotificationCenter defaultCenter];
  id v8 = +[_DKSystemEventStreams appWebUsageStream];
  id v9 = [v8 name];
  [v7 removeObserver:self name:v4 object:v9];

  id v12 = +[NSDistributedNotificationCenter defaultCenter];
  uint64_t v10 = +[_DKSystemEventStreams notificationUsageStream];
  id v11 = [v10 name];
  [v12 removeObserver:self name:v4 object:v11];
}

- (void)_duetKnowledgeStorageDidTombstoneEventsNotification:(id)a3
{
  id v4 = a3;
  id v5 = +[STLog usage];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1002689E4(v4);
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000972E8;
  v7[3] = &unk_1002FC888;
  id v8 = v4;
  id v6 = v4;
  [(STUsageManager *)self _resetUsageAndRollupWithCompletionHandler:v7];
}

- (void)_resetUsageAndRollupWithCompletionHandler:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000973D4;
  v4[3] = &unk_1002FE8F0;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(STUsageManager *)v5 _purgeAllUsage:0 completionHandler:v4];
}

- (void)performWeeklyRollupWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(STUsageManager *)self usageGenesisDate];
  if (v5)
  {
    id v6 = +[NSCalendar currentCalendar];
    BOOL v7 = objc_opt_new();
    objc_super v21 = [v6 startOfDayForDate:v7];
    id v8 = objc_msgSend(v6, "nextDateAfterDate:matchingUnit:value:options:", v21, 512, objc_msgSend(v6, "firstWeekday"), 260);
    id v9 = v5;
    id v22 = v4;
    if ([v9 compare:v8] == (id)-1)
    {
      id v10 = v8;

      id v9 = v10;
    }
    id v11 = (void *)os_transaction_create();
    id v12 = [STRollupUsageOperation alloc];
    id v13 = [(STUsageManager *)self persistenceController];
    unsigned int v14 = [(STRollupUsageOperation *)v12 initWithPersistenceController:v13 genesisDate:v9 duration:60 isBackgroundTask:0 isRecomputingUsage:0];

    id v15 = self->_queuedRollupOperations;
    objc_sync_enter(v15);
    [(NSMutableArray *)self->_queuedRollupOperations addObject:v14];
    objc_sync_exit(v15);

    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1000976F0;
    v23[3] = &unk_1002FE918;
    v23[4] = self;
    id v24 = v6;
    id v25 = v7;
    id v26 = v8;
    id v4 = v22;
    id v27 = v11;
    id v28 = v22;
    id v16 = v11;
    id v17 = v8;
    id v18 = v7;
    id v19 = v6;
    [(STUsageManager *)self _rollupUsageWithOperation:v14 completionHandler:v23];
  }
  else
  {
    id v20 = +[NSError errorWithDomain:STErrorDomain code:7 userInfo:0];
    (*((void (**)(id, void *))v4 + 2))(v4, v20);
  }
}

- (void)_scheduleNextWeeklyReportNotificationAfterRollup:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[NSCalendar currentCalendar];
  id v6 = objc_opt_new();
  if (v3)
  {
    uint64_t v7 = [v5 dateByAddingUnit:16 value:1 toDate:v6 options:0];

    id v6 = (void *)v7;
  }
  id v8 = [(STUsageManager *)self _dateComponentsForNextWeeklyNotification];
  id v9 = +[NSUserDefaults standardUserDefaults];
  id v10 = [v9 objectForKey:@"TestForceRescheduleWeeklyReport"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned int v11 = [v10 BOOLValue];
  }
  else {
    unsigned int v11 = 0;
  }
  id v12 = [v5 nextDateAfterDate:v6 matchingComponents:v8 options:1024];
  id v13 = +[NSDate dateWithTimeInterval:v12 sinceDate:(double)(-300 - arc4random_uniform(0x6F54u))];

  unsigned int v14 = [(STUsageManager *)self weeklyAlarmObserver];
  id v15 = [v14 configuration];

  id v16 = [v15 objectForKeyedSubscript:@"Date"];
  if (v16)
  {
    if ([v5 isDate:v16 inSameDayAsDate:v13])
    {
      if (!v11)
      {
LABEL_9:
        id v17 = +[STLog usage];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
          sub_100268B30();
        }
        goto LABEL_17;
      }
    }
    else
    {
      if ([v16 compare:v13] == (id)-1) {
        char v18 = 1;
      }
      else {
        char v18 = v11;
      }
      if ((v18 & 1) == 0) {
        goto LABEL_9;
      }
    }
  }
  CFStringRef v28 = @"Date";
  v29 = v13;
  id v19 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
  id v20 = [(STUsageManager *)self weeklyAlarmObserver];
  [v20 setConfiguration:v19];

  id v17 = +[STLog usage];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    [v13 timeIntervalSince1970];
    double v22 = v21;
    [v6 timeIntervalSince1970];
    int v24 = 134218242;
    uint64_t v25 = (uint64_t)(v22 - v23);
    __int16 v26 = 2114;
    id v27 = v13;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Scheduled next weekly report rollup in %lld seconds, at %{public}@", (uint8_t *)&v24, 0x16u);
  }
LABEL_17:
}

+ (int64_t)_notificationDelayForDateComponentForDSID:(id)a3 maximumDelay:(unsigned int)a4
{
  unint64_t v5 = (unint64_t)[a3 unsignedIntegerValue];
  if (v5) {
    return v5 % a4;
  }
  else {
    return arc4random_uniform(a4);
  }
}

- (id)_dateComponentsForNextWeeklyNotification
{
  v2 = objc_opt_new();
  BOOL v3 = +[NSCalendar currentCalendar];
  objc_msgSend(v2, "setWeekday:", objc_msgSend(v3, "firstWeekday"));

  [v2 setHour:9];
  id v4 = +[NSUserDefaults standardUserDefaults];
  unint64_t v5 = [v4 objectForKey:@"TestWeeklyReportDay"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v2, "setWeekday:", objc_msgSend(v5, "integerValue"));
  }
  id v6 = +[NSUserDefaults standardUserDefaults];
  uint64_t v7 = [v6 objectForKey:@"TestWeeklyReportHour"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v2, "setHour:", objc_msgSend(v7, "integerValue"));
  }

  return v2;
}

- (void)_unscheduleNextWeeklyReportNotification
{
  v2 = [(STUsageManager *)self weeklyAlarmObserver];
  [v2 setConfiguration:0];

  BOOL v3 = +[STLog usage];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Unscheduled next weekly report rollup", v4, 2u);
  }
}

- (void)_postNotification:(id)a3 rollupError:(id)a4 calendar:(id)a5 startOfLastWeek:(id)a6 completionHandler:(id)a7
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a7;
  id v13 = objc_alloc((Class)STUsageDetailsViewModelCoordinator);
  unsigned int v14 = [(STUsageManager *)self persistenceController];
  id v15 = [v13 initForLocalDeviceWithPersistenceController:v14 selectedUsageReportType:0 usageContext:2];

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10009802C;
  v20[3] = &unk_1002FE940;
  id v21 = v15;
  id v22 = v11;
  id v23 = v10;
  id v24 = v12;
  id v16 = v10;
  id v17 = v11;
  id v18 = v15;
  id v19 = v12;
  [v18 loadViewModelWithCompletionHandler:v20];
}

- (BOOL)_updateContext:(id)a3 lastWeekScreenTime:(double)a4 weekBeforeLastScreenTime:(double)a5
{
  id v7 = a3;
  if (a4 <= 1.0)
  {
    id v9 = +[STLog userNotifications];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "There wasn't enough screen time to show a weekly report notification", v11, 2u);
    }
  }
  else
  {
    if (a4 - a5 == 0.0) {
      double v8 = 0.0;
    }
    else {
      double v8 = (a4 - a5) / a5;
    }
    id v9 = +[NSNumber numberWithDouble:a4];
    [v7 setDeltaScreenTimeUsage:v9 totalUsage:v8];
  }

  return a4 > 1.0;
}

- (void)controllerDidChangeContent:(id)a3
{
  id v4 = a3;
  id v5 = [(STUsageManager *)self usageRequestsFetchedResultsController];

  if (v5 == v4)
  {
    [(STUsageManager *)self _rollupIfNeeded];
  }
}

- (void)_rollupIfNeeded
{
  BOOL v3 = [(STUsageManager *)self usageRequestsFetchedResultsController];
  id v4 = [v3 fetchedObjects];
  id v5 = [v4 firstObject];
  id v6 = [v5 objectID];

  if (v6)
  {
    id v7 = [(STUsageManager *)self persistenceController];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000984F0;
    v8[3] = &unk_1002FB788;
    id v9 = v6;
    id v10 = self;
    [v7 performBackgroundTaskAndWait:v8];
  }
}

- (BOOL)isScreenTimeEnabled
{
  return self->_screenTimeEnabled;
}

- (STPersistenceControllerProtocol)persistenceController
{
  return self->_persistenceController;
}

- (void)setPersistenceController:(id)a3
{
}

- (USUsageReporter)usageReporter
{
  return self->_usageReporter;
}

- (void)setUsageReporter:(id)a3
{
}

- (NSBackgroundActivityScheduler)hourlyUsageRollupActivity
{
  return (NSBackgroundActivityScheduler *)objc_getProperty(self, a2, 48, 1);
}

- (STXPCEventObserver)weeklyAlarmObserver
{
  return self->_weeklyAlarmObserver;
}

- (void)setWeeklyAlarmObserver:(id)a3
{
}

- (OS_dispatch_queue)rollupQueue
{
  return self->_rollupQueue;
}

- (void)setRollupQueue:(id)a3
{
}

- (NSOperationQueue)rollupOperationQueue
{
  return self->_rollupOperationQueue;
}

- (void)setRollupOperationQueue:(id)a3
{
}

- (NSDate)lastCoreDuetQueryDate
{
  return self->_lastCoreDuetQueryDate;
}

- (void)setLastCoreDuetQueryDate:(id)a3
{
}

- (BOOL)resetTimelinesOnNextRollup
{
  return self->_resetTimelinesOnNextRollup;
}

- (void)setResetTimelinesOnNextRollup:(BOOL)a3
{
  self->_resetTimelinesOnNextRollup = a3;
}

- (NSFetchedResultsController)usageRequestsFetchedResultsController
{
  return self->_usageRequestsFetchedResultsController;
}

- (void)setUsageRequestsFetchedResultsController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usageRequestsFetchedResultsController, 0);
  objc_storeStrong((id *)&self->_lastCoreDuetQueryDate, 0);
  objc_storeStrong((id *)&self->_rollupOperationQueue, 0);
  objc_storeStrong((id *)&self->_rollupQueue, 0);
  objc_storeStrong((id *)&self->_weeklyAlarmObserver, 0);
  objc_storeStrong((id *)&self->_hourlyUsageRollupActivity, 0);
  objc_storeStrong((id *)&self->_usageReporter, 0);
  objc_storeStrong((id *)&self->_persistenceController, 0);
  objc_storeStrong((id *)&self->_queuedPurgeUsageOperations, 0);
  objc_storeStrong((id *)&self->_queuedRollupOperations, 0);
}

@end