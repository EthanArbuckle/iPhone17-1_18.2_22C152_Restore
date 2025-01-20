@interface _DASDaemonClient
+ (id)clientForDaemon:(id)a3 withConnection:(id)a4 isRestricted:(BOOL)a5;
- (BOOL)activityCompletedInternal:(id)a3;
- (BOOL)hasEntitlementForCustomIconBundleIdentifier;
- (BOOL)hasEntitlementForProgressTask;
- (BOOL)restricted;
- (NSMutableSet)delayedStartTasks;
- (NSMutableSet)runningBGTasks;
- (NSMutableSet)startedTasks;
- (NSMutableSet)submittedTasks;
- (NSString)applicationBundleIdentifier;
- (NSString)mainApplicationBundleIdentifier;
- (NSXPCConnection)connection;
- (_DASDaemon)daemon;
- (_DASDaemonClient)initWithDaemon:(id)a3 withConnection:(id)a4 isRestricted:(BOOL)a5;
- (id)activityNamesFromActivities:(id)a3;
- (id)bundleIdentifierFromTeamAppTuple:(id)a3;
- (id)unlockedActivitiesWithNames:(id)a3 inSet:(id)a4;
- (id)unsafe_applicationBundleIdentifier;
- (id)unsafe_mainApplicationBundleIdentifier;
- (os_unfair_lock_s)lock;
- (void)_resetWidgetBudgets;
- (void)acknowledgeSystemTaskLaunchWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)acknowledgeSystemTaskSuspensionWithIdentifier:(id)a3 retryAfter:(double)a4 completionHandler:(id)a5;
- (void)activity:(id)a3 blockedOnPolicies:(id)a4;
- (void)activity:(id)a3 runWithoutHonoringPolicies:(id)a4;
- (void)activityCanceled:(id)a3;
- (void)activityCompleted:(id)a3;
- (void)activityContainsOverrides:(id)a3 handler:(id)a4;
- (void)activityRunStatisticsWithHandler:(id)a3;
- (void)activityStarted:(id)a3;
- (void)activityStartedWithParameters:(id)a3;
- (void)activityStoppedWithParameters:(id)a3;
- (void)addPauseExceptParameter:(id)a3 handler:(id)a4;
- (void)allBudgetsWithHandler:(id)a3;
- (void)backgroundAppRefreshEnabledForApp:(id)a3 withHandler:(id)a4;
- (void)balanceForBudgetWithName:(id)a3 withHandler:(id)a4;
- (void)blockingPoliciesWithParameters:(id)a3 handler:(id)a4;
- (void)cancelActivities:(id)a3;
- (void)cancelAllActivities;
- (void)cancelAllTaskRequestsWithCompletionHandler:(id)a3;
- (void)cancelTaskRequestWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)clasStatusWithHandler:(id)a3;
- (void)completeSystemTaskWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)completeTaskRequest:(id)a3 completionHandler:(id)a4;
- (void)createActivityGroup:(id)a3;
- (void)currentPredictionsWithHandler:(id)a3;
- (void)dealloc;
- (void)decrementBy:(double)a3 forBudgetWithName:(id)a4;
- (void)deferActivities:(id)a3 withHandler:(id)a4;
- (void)delayedRunningActivitiesWithHandler:(id)a3;
- (void)delayedStartActivities:(id)a3;
- (void)deleteLimitForActivity:(id)a3 forLimiterWithName:(id)a4 handler:(id)a5;
- (void)disableAppRefreshForApps:(id)a3;
- (void)enableTaskRegistryMode:(BOOL)a3 processes:(id)a4 handler:(id)a5;
- (void)endLaunchWithReason:(id)a3 forApp:(id)a4;
- (void)enterTestModeWithParameters:(id)a3 reset:(BOOL)a4 handler:(id)a5;
- (void)establishConnection:(id)a3;
- (void)evaluateAllActivities:(id)a3 handler:(id)a4;
- (void)evaluatePolicies:(id)a3 handler:(id)a4;
- (void)forceResetOfResultIdentifier:(id)a3;
- (void)forceRunActivities:(id)a3;
- (void)getActivityTimelines:(id)a3 timeFilter:(id)a4 bgsqlData:(id)a5 handler:(id)a6;
- (void)getBuddyEvents:(id)a3 bgsqlData:(id)a4 handler:(id)a5;
- (void)getConditionsPenalties:(id)a3 handler:(id)a4;
- (void)getDeviceConditionTimelines:(id)a3 bgsqlData:(id)a4 handler:(id)a5;
- (void)getElapsedRuntimes:(id)a3 timeFilter:(id)a4 bgsqlData:(id)a5 handler:(id)a6;
- (void)getEstimatedMADCompletionTimes:(id)a3 endDate:(id)a4 bgsqlData:(id)a5 handler:(id)a6;
- (void)getEstimatedRuntimes:(id)a3 timeFilter:(id)a4 bgsqlData:(id)a5 handler:(id)a6;
- (void)getFeatureTimelines:(id)a3 timeFilter:(id)a4 bgsqlData:(id)a5 handler:(id)a6;
- (void)getInstallTimeline:(id)a3 bgsqlData:(id)a4 handler:(id)a5;
- (void)getLimiterResponseForActivity:(id)a3 handler:(id)a4;
- (void)getPendingTaskRequestsWithCompletionHandler:(id)a3;
- (void)getRuntimeLimit:(id)a3 handler:(id)a4;
- (void)handleClientInterruption;
- (void)handleClientLedSystemTaskExpirationWithIdentifier:(id)a3 retryAfter:(double)a4 completionHandler:(id)a5;
- (void)handleEligibleActivities:(id)a3;
- (void)handleLaunchFromDaemonForActivities:(id)a3;
- (void)handleRunningActivities:(id)a3;
- (void)inspect:(id)a3 withHandler:(id)a4;
- (void)pauseWithParameters:(id)a3 handler:(id)a4;
- (void)policiesWithHandler:(id)a3;
- (void)prewarmApplication:(id)a3;
- (void)prewarmSuspendWithHandler:(id)a3;
- (void)queryDependenciesOfTaskIdentifier:(id)a3 withHandler:(id)a4;
- (void)queryStatusOfResultIdentifier:(id)a3 withHandler:(id)a4;
- (void)removeKnownActivitiesFromSet:(id)a3;
- (void)reportCustomCheckpoint:(unint64_t)a3 forTask:(id)a4 withHandler:(id)a5;
- (void)reportFeatureCheckpoint:(unint64_t)a3 forFeature:(unint64_t)a4 withHandler:(id)a5;
- (void)reportSystemTaskWithIdentifier:(id)a3 consumedResults:(id)a4 completionHandler:(id)a5;
- (void)reportSystemTaskWithIdentifier:(id)a3 producedResults:(id)a4 completionHandler:(id)a5;
- (void)reportSystemWorkload:(unint64_t)a3 ofCategory:(unint64_t)a4 withHandler:(id)a5;
- (void)reportTaskWorkloadProgress:(id)a3 target:(unint64_t)a4 completed:(unint64_t)a5 category:(unint64_t)a6 subCategory:(id)a7 completionHandler:(id)a8;
- (void)resetFastPassActivities:(id)a3 resetAll:(BOOL)a4 withHandler:(id)a5;
- (void)resetResultsForIdentifier:(id)a3 byTaskWithIdentifier:(id)a4 completionHandler:(id)a5;
- (void)resubmitRunningTasks:(id)a3;
- (void)resumeTaskSchedulingWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)runActivities:(id)a3;
- (void)runActivitiesWithDelayedStart:(id)a3;
- (void)runActivitiesWithUrgency:(int64_t)a3 activities:(id)a4;
- (void)runProceedableActivities:(id)a3 handler:(id)a4;
- (void)runningActivitiesWithHandler:(id)a3;
- (void)runningGroupActivitiesWithHandler:(id)a3;
- (void)scoresForActivityWithName:(id)a3 withHandler:(id)a4;
- (void)setApplicationBundleIdentifier:(id)a3;
- (void)setBalance:(double)a3 forBudgetWithName:(id)a4;
- (void)setCapacity:(double)a3 forBudgetWithName:(id)a4;
- (void)setConnection:(id)a3;
- (void)setDaemon:(id)a3;
- (void)setDelayedStartTasks:(id)a3;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)setMainApplicationBundleIdentifier:(id)a3;
- (void)setMinimumBackgroundFetchInterval:(double)a3 forApp:(id)a4;
- (void)setRestricted:(BOOL)a3;
- (void)setRunningBGTasks:(id)a3;
- (void)setStartedTasks:(id)a3;
- (void)setSubmittedTasks:(id)a3;
- (void)startedActivities:(id)a3;
- (void)statisticsWithHandler:(id)a3;
- (void)submitActivities:(id)a3;
- (void)submitActivitiesInternal:(id)a3;
- (void)submitActivity:(id)a3;
- (void)submitActivity:(id)a3 inGroup:(id)a4;
- (void)submitActivity:(id)a3 inGroup:(id)a4 withHandler:(id)a5;
- (void)submitActivity:(id)a3 inGroupWithName:(id)a4;
- (void)submitActivityInternal:(id)a3;
- (void)submitRateLimitConfiguration:(id)a3 handler:(id)a4;
- (void)submitTaskRequest:(id)a3 withHandler:(id)a4;
- (void)submitTaskRequestWithIdentifier:(id)a3 descriptor:(id)a4 completionHandler:(id)a5;
- (void)submittedActivitiesWithHandler:(id)a3;
- (void)suspendActivities:(id)a3;
- (void)unregisterSystemTaskWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)updateActivity:(id)a3 withParameters:(id)a4;
- (void)updateLimit:(double)a3 forActivity:(id)a4 forLimiterWithName:(id)a5 handler:(id)a6;
- (void)updateOngoingTask:(id)a3 completionHandler:(id)a4;
- (void)updateProgressForOngoingTask:(id)a3 completionHandler:(id)a4;
- (void)updateSystemConstraintsWithParameters:(id)a3;
- (void)updateTaskRequestWithIdentifier:(id)a3 descriptor:(id)a4 completionHandler:(id)a5;
- (void)validateCTBGTaskRequestWithActivity:(id)a3;
- (void)willExpireBGTaskActivities:(id)a3;
@end

@implementation _DASDaemonClient

- (void)submitActivity:(id)a3
{
  id v5 = a3;
  if (self->_restricted)
  {
    v6 = +[_DASDaemonLogger logForCategory:@"bar"];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000FF63C(a2);
    }

    [(NSXPCConnection *)self->_connection invalidate];
  }
  else
  {
    [(_DASDaemonClient *)self submitActivityInternal:v5];
    [(_DASDaemon *)self->_daemon submitActivity:v5];
  }
}

- (void)submitActivityInternal:(id)a3
{
  id v5 = a3;
  v4 = self->_submittedTasks;
  objc_sync_enter(v4);
  [v5 setUserIdentifier:-[NSXPCConnection effectiveUserIdentifier](self->_connection, "effectiveUserIdentifier")];
  [v5 setPid:-[NSXPCConnection processIdentifier](self->_connection, "processIdentifier")];
  [(_DASDaemonClient *)self setApplicationURLForActivity:v5];
  [(NSMutableSet *)self->_submittedTasks _DAS_addOrReplaceObject:v5];
  objc_sync_exit(v4);
}

- (void)setMinimumBackgroundFetchInterval:(double)a3 forApp:(id)a4
{
}

- (void)activityStartedWithParameters:(id)a3
{
}

- (_DASDaemonClient)initWithDaemon:(id)a3 withConnection:(id)a4 isRestricted:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v29.receiver = self;
  v29.super_class = (Class)_DASDaemonClient;
  v11 = [(_DASDaemonClient *)&v29 init];
  v12 = v11;
  if (v11)
  {
    v11->_restricted = a5;
    objc_storeStrong((id *)&v11->_daemon, a3);
    objc_storeStrong((id *)&v12->_connection, a4);
    if (qword_1001C4400 != -1) {
      dispatch_once(&qword_1001C4400, &stru_100178128);
    }
    [(NSXPCConnection *)v12->_connection setRemoteObjectInterface:qword_1001C4408];
    if (qword_1001C4410 != -1) {
      dispatch_once(&qword_1001C4410, &stru_100178148);
    }
    [(NSXPCConnection *)v12->_connection setExportedInterface:qword_1001C4418];
    [(NSXPCConnection *)v12->_connection setExportedObject:v12];
    [(NSXPCConnection *)v12->_connection resume];
    objc_initWeak(&location, v12);
    connection = v12->_connection;
    v23 = _NSConcreteStackBlock;
    uint64_t v24 = 3221225472;
    v25 = sub_1000D16E4;
    v26 = &unk_1001753B0;
    objc_copyWeak(&v27, &location);
    [(NSXPCConnection *)connection setInvalidationHandler:&v23];
    uint64_t v14 = +[NSMutableSet set];
    submittedTasks = v12->_submittedTasks;
    v12->_submittedTasks = (NSMutableSet *)v14;

    uint64_t v16 = +[NSMutableSet set];
    startedTasks = v12->_startedTasks;
    v12->_startedTasks = (NSMutableSet *)v16;

    uint64_t v18 = +[NSMutableSet set];
    delayedStartTasks = v12->_delayedStartTasks;
    v12->_delayedStartTasks = (NSMutableSet *)v18;

    uint64_t v20 = +[NSMutableSet set];
    runningBGTasks = v12->_runningBGTasks;
    v12->_runningBGTasks = (NSMutableSet *)v20;

    v12->_lock._os_unfair_lock_opaque = 0;
    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }

  return v12;
}

+ (id)clientForDaemon:(id)a3 withConnection:(id)a4 isRestricted:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = a3;
  id v9 = [[_DASDaemonClient alloc] initWithDaemon:v8 withConnection:v7 isRestricted:v5];

  return v9;
}

- (void)removeKnownActivitiesFromSet:(id)a3
{
  id v4 = a3;
  BOOL v5 = self->_submittedTasks;
  objc_sync_enter(v5);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v6 = self->_submittedTasks;
  id v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        [v4 removeObject:*(void *)(*((void *)&v10 + 1) + 8 * (void)v9) (void)v10];
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (id)unlockedActivitiesWithNames:(id)a3 inSet:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 count];
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v15[3] = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000D1A00;
  v11[3] = &unk_1001780E0;
  id v8 = v5;
  id v12 = v8;
  long long v13 = v15;
  id v14 = v7;
  id v9 = [v6 objectsPassingTest:v11];

  _Block_object_dispose(v15, 8);

  return v9;
}

- (void)handleClientInterruption
{
  [(_DASDaemonClient *)self cancelAllActivities];
  id v3 = [(_DASDaemonClient *)self daemon];
  [v3 removeClient:self];
}

- (id)activityNamesFromActivities:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = +[NSMutableArray array];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = v3;
    id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          long long v10 = [[*(id *)(*((void *)&v13 + 1) + 8 * i) name:v13];
          [v4 addObject:v10];
        }
        id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }

    long long v11 = +[NSArray arrayWithArray:v4];
  }
  else
  {
    long long v11 = 0;
  }

  return v11;
}

- (void)runActivitiesWithDelayedStart:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableSet set];
  id v6 = self->_submittedTasks;
  objc_sync_enter(v6);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        if (-[NSMutableSet containsObject:](self->_submittedTasks, "containsObject:", v11, (void)v15))
        {
          [v5 addObject:v11];
          [(NSMutableSet *)self->_submittedTasks removeObject:v11];
        }
      }
      id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  objc_sync_exit(v6);
  if ([v5 count])
  {
    id v12 = self->_delayedStartTasks;
    objc_sync_enter(v12);
    [(NSMutableSet *)self->_delayedStartTasks _DAS_unionSetOverridingExisting:v5];
    objc_sync_exit(v12);

    long long v13 = [(NSXPCConnection *)self->_connection remoteObjectProxy];
    long long v14 = +[NSSet setWithSet:v5];
    [v13 runActivitiesWithDelayedStart:v14];
  }
}

- (void)runActivities:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableSet set];
  id v6 = self->_submittedTasks;
  objc_sync_enter(v6);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        if (-[NSMutableSet containsObject:](self->_submittedTasks, "containsObject:", v11, (void)v14))
        {
          [v5 addObject:v11];
          [(NSMutableSet *)self->_submittedTasks removeObject:v11];
        }
      }
      id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  objc_sync_exit(v6);
  if ([v5 count])
  {
    [(_DASDaemonClient *)self handleRunningActivities:v5];
    id v12 = [(NSXPCConnection *)self->_connection remoteObjectProxy];
    long long v13 = +[NSSet setWithSet:v5];
    [v12 runActivities:v13];
  }
}

- (void)suspendActivities:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableSet set];
  id v6 = self->_startedTasks;
  objc_sync_enter(v6);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        if (-[NSMutableSet containsObject:](self->_startedTasks, "containsObject:", v11, (void)v14)) {
          [v5 addObject:v11];
        }
      }
      id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  objc_sync_exit(v6);
  if ([v5 count])
  {
    id v12 = [(NSXPCConnection *)self->_connection remoteObjectProxy];
    long long v13 = +[NSSet setWithSet:v7];
    [v12 suspendActivities:v13];
  }
}

- (void)cancelActivities:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableSet set];
  id v6 = self->_submittedTasks;
  objc_sync_enter(v6);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v25;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        if ([(NSMutableSet *)self->_submittedTasks containsObject:v11])
        {
          [v5 addObject:v11];
          [(NSMutableSet *)self->_submittedTasks removeObject:v11];
        }
      }
      id v8 = [v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v8);
  }

  objc_sync_exit(v6);
  id v12 = self->_delayedStartTasks;
  objc_sync_enter(v12);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v13 = v7;
  id v14 = [v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v21;
    do
    {
      for (j = 0; j != v14; j = (char *)j + 1)
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v13);
        }
        uint64_t v17 = *(void *)(*((void *)&v20 + 1) + 8 * (void)j);
        if (-[NSMutableSet containsObject:](self->_delayedStartTasks, "containsObject:", v17, (void)v20))
        {
          [v5 addObject:v17];
          [(NSMutableSet *)self->_delayedStartTasks removeObject:v17];
        }
      }
      id v14 = [v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v14);
  }

  objc_sync_exit(v12);
  if ([v5 count])
  {
    long long v18 = [(NSXPCConnection *)self->_connection remoteObjectProxy];
    v19 = +[NSSet setWithSet:v13];
    [v18 cancelActivities:v19];
  }
}

- (void)activity:(id)a3 blockedOnPolicies:(id)a4
{
  connection = self->_connection;
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NSXPCConnection *)connection remoteObjectProxy];
  [v8 activity:v7 blockedOnPolicies:v6];
}

- (void)activity:(id)a3 runWithoutHonoringPolicies:(id)a4
{
  connection = self->_connection;
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NSXPCConnection *)connection remoteObjectProxy];
  [v8 activity:v7 runWithoutHonoringPolicies:v6];
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)_DASDaemonClient;
  [(_DASDaemonClient *)&v3 dealloc];
}

- (void)submitActivitiesInternal:(id)a3
{
  id v4 = a3;
  id v5 = self->_submittedTasks;
  objc_sync_enter(v5);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v13;
    do
    {
      long long v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v10);
        [v11 setUserIdentifier:-[NSXPCConnection effectiveUserIdentifier](self->_connection, "effectiveUserIdentifier", (void)v12)];
        [v11 setPid:-[NSXPCConnection processIdentifier](self->_connection, "processIdentifier")];
        [(_DASDaemonClient *)self setApplicationURLForActivity:v11];
        [(NSMutableSet *)self->_submittedTasks _DAS_addOrReplaceObject:v11];
        long long v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  objc_sync_exit(v5);
}

- (void)submitActivities:(id)a3
{
  id v5 = a3;
  if (self->_restricted)
  {
    id v6 = +[_DASDaemonLogger logForCategory:@"bar"];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000FF63C(a2);
    }

    [(NSXPCConnection *)self->_connection invalidate];
  }
  else
  {
    [(_DASDaemonClient *)self submitActivitiesInternal:v5];
    [(_DASDaemon *)self->_daemon submitActivities:v5];
  }
}

- (void)handleEligibleActivities:(id)a3
{
}

- (void)handleRunningActivities:(id)a3
{
  id v5 = a3;
  id v4 = self->_startedTasks;
  objc_sync_enter(v4);
  [(NSMutableSet *)self->_startedTasks _DAS_unionSetOverridingExisting:v5];
  objc_sync_exit(v4);

  [(_DASDaemon *)self->_daemon handleRunningActivities:v5];
}

- (void)startedActivities:(id)a3
{
  id v5 = a3;
  if (self->_restricted)
  {
    id v6 = +[_DASDaemonLogger logForCategory:@"bar"];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000FF6C0(a2);
    }

    [(NSXPCConnection *)self->_connection invalidate];
  }
  else
  {
    id v7 = +[NSSet setWithArray:v5];
    id v8 = self->_startedTasks;
    objc_sync_enter(v8);
    [(NSMutableSet *)self->_startedTasks unionSet:v7];
    objc_sync_exit(v8);

    uint64_t v9 = self;
    objc_sync_enter(v9);
    [(_DASDaemon *)v9->_daemon startedActivities:v7];
    objc_sync_exit(v9);
  }
}

- (void)delayedStartActivities:(id)a3
{
  id v5 = a3;
  if (self->_restricted)
  {
    id v6 = +[_DASDaemonLogger logForCategory:@"bar"];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000FF748(a2);
    }

    [(NSXPCConnection *)self->_connection invalidate];
  }
  else
  {
    id v7 = +[NSSet setWithArray:v5];
    id v8 = self->_delayedStartTasks;
    objc_sync_enter(v8);
    [(NSMutableSet *)self->_delayedStartTasks unionSet:v7];
    objc_sync_exit(v8);
  }
}

- (void)activityStarted:(id)a3
{
  id v5 = a3;
  if (self->_restricted)
  {
    id v6 = +[_DASDaemonLogger logForCategory:@"bar"];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000FF7D0(a2);
    }

    [(NSXPCConnection *)self->_connection invalidate];
  }
  else
  {
    id v7 = self->_delayedStartTasks;
    objc_sync_enter(v7);
    if ([(NSMutableSet *)self->_delayedStartTasks containsObject:v5])
    {
      [(NSMutableSet *)self->_delayedStartTasks removeObject:v5];
      objc_sync_exit(v7);

      id v8 = self->_startedTasks;
      objc_sync_enter(v8);
      [(NSMutableSet *)self->_startedTasks _DAS_addOrReplaceObject:v5];
      objc_sync_exit(v8);

      uint64_t v9 = self;
      objc_sync_enter(v9);
      [(_DASDaemon *)v9->_daemon activityStarted:v5];
      objc_sync_exit(v9);
    }
    else
    {
      long long v10 = +[_DASDaemonLogger defaultCategory];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = [v5 shortDescription];
        int v12 = 138412290;
        long long v13 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Can't start %@!,not scheduled to run!", (uint8_t *)&v12, 0xCu);
      }
      objc_sync_exit(v7);
    }
  }
}

- (BOOL)activityCompletedInternal:(id)a3
{
  id v4 = a3;
  id v5 = self->_startedTasks;
  objc_sync_enter(v5);
  unsigned int v6 = [(NSMutableSet *)self->_startedTasks containsObject:v4];
  if (v6)
  {
    [(NSMutableSet *)self->_startedTasks removeObject:v4];
  }
  else
  {
    id v7 = +[_DASDaemonLogger defaultCategory];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [v4 shortDescription];
      int v12 = 138412290;
      long long v13 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Can't complete, %@ - not running, cancelling instead!", (uint8_t *)&v12, 0xCu);
    }
  }
  objc_sync_exit(v5);

  uint64_t v9 = self->_submittedTasks;
  objc_sync_enter(v9);
  [(NSMutableSet *)self->_submittedTasks removeObject:v4];
  objc_sync_exit(v9);

  long long v10 = self->_delayedStartTasks;
  objc_sync_enter(v10);
  [(NSMutableSet *)self->_delayedStartTasks removeObject:v4];
  objc_sync_exit(v10);

  return v6;
}

- (void)activityCompleted:(id)a3
{
  id v5 = a3;
  if (self->_restricted)
  {
    unsigned int v6 = +[_DASDaemonLogger logForCategory:@"bar"];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000FF858(a2);
    }

    [(NSXPCConnection *)self->_connection invalidate];
  }
  else
  {
    unsigned int v7 = [(_DASDaemonClient *)self activityCompletedInternal:v5];
    id v8 = self;
    objc_sync_enter(v8);
    daemon = v8->_daemon;
    if (v7) {
      [(_DASDaemon *)daemon activityCompleted:v5];
    }
    else {
      [(_DASDaemon *)daemon activityCanceled:v5];
    }
    objc_sync_exit(v8);
  }
}

- (void)cancelAllActivities
{
  objc_super v3 = +[NSMutableSet set];
  id v4 = self->_submittedTasks;
  objc_sync_enter(v4);
  [v3 unionSet:self->_submittedTasks];
  [(NSMutableSet *)self->_submittedTasks removeAllObjects];
  objc_sync_exit(v4);

  id v5 = self->_startedTasks;
  objc_sync_enter(v5);
  [v3 unionSet:self->_startedTasks];
  [(NSMutableSet *)self->_startedTasks removeAllObjects];
  objc_sync_exit(v5);

  unsigned int v6 = self->_delayedStartTasks;
  objc_sync_enter(v6);
  [v3 unionSet:self->_delayedStartTasks];
  [(NSMutableSet *)self->_delayedStartTasks removeAllObjects];
  objc_sync_exit(v6);

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v3;
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v13;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (!objc_msgSend(v11, "requestsApplicationLaunch", (void)v12)
          || ([v11 shouldBePersisted] & 1) == 0)
        {
          [(_DASDaemon *)self->_daemon activityCanceled:v11];
        }
      }
      id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)activityCanceled:(id)a3
{
  id v5 = a3;
  unsigned int v6 = v5;
  if (self->_restricted && ([v5 isContinuedProcessingTask] & 1) == 0)
  {
    uint64_t v11 = +[_DASDaemonLogger logForCategory:@"bar"];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1000FF8E0(a2);
    }

    [(NSXPCConnection *)self->_connection invalidate];
  }
  else
  {
    id v7 = self->_startedTasks;
    objc_sync_enter(v7);
    [(NSMutableSet *)self->_startedTasks removeObject:v6];
    objc_sync_exit(v7);

    id v8 = self->_submittedTasks;
    objc_sync_enter(v8);
    [(NSMutableSet *)self->_submittedTasks removeObject:v6];
    objc_sync_exit(v8);

    uint64_t v9 = self->_delayedStartTasks;
    objc_sync_enter(v9);
    [(NSMutableSet *)self->_delayedStartTasks removeObject:v6];
    objc_sync_exit(v9);

    long long v10 = self;
    objc_sync_enter(v10);
    [(_DASDaemon *)v10->_daemon activityCanceled:v6];
    objc_sync_exit(v10);
  }
}

- (void)updateActivity:(id)a3 withParameters:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = self;
  objc_sync_enter(v7);
  [(_DASDaemon *)v7->_daemon updateActivity:v8 withParameters:v6];
  objc_sync_exit(v7);
}

- (void)_resetWidgetBudgets
{
  objc_super v3 = +[NSXPCConnection currentConnection];
  id v4 = [v3 valueForEntitlement:@"com.apple.dasd.widgetBudgetReset"];
  unsigned int v5 = [v4 BOOLValue];

  if (v5)
  {
    daemon = self->_daemon;
    [(_DASDaemon *)daemon _resetWidgetBudgets];
  }
  else
  {
    id v7 = +[_DASDaemonLogger logForCategory:@"misuse"];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = +[NSXPCConnection currentConnection];
      int v9 = 138543362;
      long long v10 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Please file a bug for – client %{public}@ attempted to reset widget budgets but lacked appropriate entitlement", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)updateSystemConstraintsWithParameters:(id)a3
{
}

- (void)createActivityGroup:(id)a3
{
  id v5 = a3;
  if (self->_restricted)
  {
    id v6 = +[_DASDaemonLogger logForCategory:@"bar"];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000FF63C(a2);
    }

    [(NSXPCConnection *)self->_connection invalidate];
  }
  else
  {
    id v7 = [(NSXPCConnection *)self->_connection valueForEntitlement:@"com.apple.networkd.configure_connection_pool"];
    if ([v7 BOOLValue])
    {
      [(_DASDaemon *)self->_daemon createActivityGroup:v5];
    }
    else
    {
      id v8 = +[_DASDaemonLogger defaultCategory];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Unentitled client tried to create an Activity Group. Dropping on the floor", v9, 2u);
      }
    }
  }
}

- (void)submitActivity:(id)a3 inGroupWithName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (self->_restricted)
  {
    int v9 = +[_DASDaemonLogger logForCategory:@"bar"];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000FF63C(a2);
    }

    [(NSXPCConnection *)self->_connection invalidate];
  }
  else
  {
    [(_DASDaemonClient *)self submitActivityInternal:v7];
    [(_DASDaemon *)self->_daemon submitActivity:v7 inGroupWithName:v8];
  }
}

- (void)submitActivity:(id)a3 inGroup:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (self->_restricted)
  {
    int v9 = +[_DASDaemonLogger logForCategory:@"bar"];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000FF63C(a2);
    }

    [(NSXPCConnection *)self->_connection invalidate];
  }
  else
  {
    [(_DASDaemonClient *)self submitActivityInternal:v7];
    [(_DASDaemon *)self->_daemon submitActivity:v7 inGroup:v8];
  }
}

- (void)submitActivity:(id)a3 inGroup:(id)a4 withHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  long long v10 = (void (**)(id, BOOL, void))a5;
  [v8 setUserIdentifier:-[NSXPCConnection effectiveUserIdentifier](self->_connection, "effectiveUserIdentifier")];
  [v8 setPid:-[NSXPCConnection processIdentifier](self->_connection, "processIdentifier")];
  [(_DASDaemonClient *)self setApplicationURLForActivity:v8];
  uint64_t v11 = self->_submittedTasks;
  objc_sync_enter(v11);
  [(NSMutableSet *)self->_submittedTasks _DAS_addOrReplaceObject:v8];
  objc_sync_exit(v11);

  uint64_t v22 = 0;
  long long v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = sub_1000D38C0;
  long long v20 = sub_1000D38D0;
  id v21 = 0;
  daemon = self->_daemon;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000D38D8;
  v15[3] = &unk_100178108;
  void v15[4] = &v22;
  v15[5] = &v16;
  [(_DASDaemon *)daemon submitActivity:v8 inGroup:v9 withHandler:v15];
  if (*((unsigned char *)v23 + 24))
  {
    BOOL v13 = 1;
  }
  else
  {
    long long v14 = self;
    objc_sync_enter(v14);
    [(NSMutableSet *)self->_submittedTasks removeObject:v8];
    objc_sync_exit(v14);

    BOOL v13 = *((unsigned char *)v23 + 24) != 0;
  }
  v10[2](v10, v13, v17[5]);
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
}

- (void)endLaunchWithReason:(id)a3 forApp:(id)a4
{
  if (self->_restricted)
  {
    id v6 = +[_DASDaemonLogger logForCategory:@"bar", a4];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000FF63C(a2);
    }

    [(NSXPCConnection *)self->_connection invalidate];
  }
  else
  {
    daemon = self->_daemon;
    [(_DASDaemon *)daemon endLaunchWithReason:a3 forApp:a4];
  }
}

- (void)backgroundAppRefreshEnabledForApp:(id)a3 withHandler:(id)a4
{
  if (self->_restricted)
  {
    id v6 = +[_DASDaemonLogger logForCategory:@"bar", a4];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000FF63C(a2);
    }

    [(NSXPCConnection *)self->_connection invalidate];
  }
  else
  {
    daemon = self->_daemon;
    [(_DASDaemon *)daemon backgroundAppRefreshEnabledForApp:a3 withHandler:a4];
  }
}

- (void)disableAppRefreshForApps:(id)a3
{
  if (self->_restricted)
  {
    id v5 = +[_DASDaemonLogger logForCategory:@"bar"];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000FF63C(a2);
    }

    [(NSXPCConnection *)self->_connection invalidate];
  }
  else
  {
    daemon = self->_daemon;
    [(_DASDaemon *)daemon disableAppRefreshForApps:a3];
  }
}

- (id)bundleIdentifierFromTeamAppTuple:(id)a3
{
  id v3 = a3;
  if ([v3 hasPrefix:@"com.apple."])
  {
    id v4 = v3;
  }
  else if ((unint64_t)[v3 length] > 0xA)
  {
    __chkstk_darwin();
    [v3 getCharacters:v18 range:0, 10];
    for (uint64_t i = 0; i != 20; i += 2)
    {
      int v7 = *(unsigned __int16 *)&v18[i];
      if ((v7 - 65) >= 0x1A && (v7 - 48) >= 0xA)
      {
        id v9 = +[_DASDaemonLogger logForCategory:@"BackgroundTasks"];
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          sub_1000FFA0C();
        }
        goto LABEL_19;
      }
    }
    if ([v3 characterAtIndex:10] == 46)
    {
      id v4 = [v3 substringFromIndex:11];
      goto LABEL_20;
    }
    id v9 = +[_DASDaemonLogger logForCategory:@"BackgroundTasks"];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000FF9D4(v9, v10, v11, v12, v13, v14, v15, v16);
    }
LABEL_19:

    id v4 = 0;
  }
  else
  {
    id v5 = +[_DASDaemonLogger logForCategory:@"BackgroundTasks"];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000FF968();
    }

    id v4 = 0;
  }
LABEL_20:

  return v4;
}

- (id)unsafe_applicationBundleIdentifier
{
  p_applicationBundleIdentifier = &self->_applicationBundleIdentifier;
  applicationBundleIdentifier = self->_applicationBundleIdentifier;
  if (!applicationBundleIdentifier)
  {
    id v5 = [(NSXPCConnection *)self->_connection valueForEntitlement:@"application-identifier"];
    uint64_t v6 = [(_DASDaemonClient *)self bundleIdentifierFromTeamAppTuple:v5];
    int v7 = (void *)v6;
    if (v6) {
      id v8 = (__CFString *)v6;
    }
    else {
      id v8 = &stru_100179948;
    }
    objc_storeStrong((id *)p_applicationBundleIdentifier, v8);

    applicationBundleIdentifier = self->_applicationBundleIdentifier;
  }
  id v9 = [(NSString *)applicationBundleIdentifier length];
  if (v9) {
    id v9 = *p_applicationBundleIdentifier;
  }

  return v9;
}

- (NSString)applicationBundleIdentifier
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(_DASDaemonClient *)self unsafe_applicationBundleIdentifier];
  os_unfair_lock_unlock(p_lock);

  return (NSString *)v4;
}

- (BOOL)hasEntitlementForProgressTask
{
  id v3 = [(NSXPCConnection *)self->_connection valueForEntitlement:@"com.apple.das.private.bgtask.continuedprocessing"];
  if ([v3 BOOLValue])
  {
    unsigned __int8 v4 = 1;
  }
  else
  {
    id v5 = [(NSXPCConnection *)self->_connection valueForEntitlement:@"com.apple.developer.web-browser-engine.networking"];
    unsigned __int8 v4 = [v5 BOOLValue];
  }
  return v4;
}

- (BOOL)hasEntitlementForCustomIconBundleIdentifier
{
  id v3 = [(NSXPCConnection *)self->_connection valueForEntitlement:@"com.apple.das.private.bgtask.continuedprocessing.iconBundleIdentifier"];
  if ([v3 BOOLValue])
  {
    unsigned __int8 v4 = 1;
  }
  else
  {
    id v5 = [(NSXPCConnection *)self->_connection valueForEntitlement:@"com.apple.developer.web-browser-engine.networking"];
    unsigned __int8 v4 = [v5 BOOLValue];
  }
  return v4;
}

- (id)unsafe_mainApplicationBundleIdentifier
{
  p_mainApplicationBundleIdentifier = (id *)&self->_mainApplicationBundleIdentifier;
  mainApplicationBundleIdentifier = self->_mainApplicationBundleIdentifier;
  if (mainApplicationBundleIdentifier)
  {
LABEL_16:
    if ([(NSString *)mainApplicationBundleIdentifier length]) {
      id v19 = *p_mainApplicationBundleIdentifier;
    }
    else {
      id v19 = 0;
    }
    id v14 = v19;
    goto LABEL_20;
  }
  id v5 = [(NSXPCConnection *)self->_connection _xpcConnection];
  int is_extension = xpc_connection_is_extension();

  if (!is_extension)
  {
    uint64_t v15 = [(_DASDaemonClient *)self unsafe_applicationBundleIdentifier];
LABEL_12:
    if (v15) {
      uint64_t v18 = v15;
    }
    else {
      uint64_t v18 = &stru_100179948;
    }
    objc_storeStrong(p_mainApplicationBundleIdentifier, v18);

    mainApplicationBundleIdentifier = (NSString *)*p_mainApplicationBundleIdentifier;
    goto LABEL_16;
  }
  int v7 = +[RBSProcessIdentifier identifierWithPid:[(NSXPCConnection *)self->_connection processIdentifier]];
  id v21 = 0;
  id v8 = +[RBSProcessHandle handleForIdentifier:v7 error:&v21];
  id v9 = v21;
  if (v8) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 0;
  }
  if (v10)
  {
    uint64_t v16 = [v8 hostProcess];
    uint64_t v17 = [v16 bundle];
    uint64_t v15 = [v17 identifier];

    goto LABEL_12;
  }
  uint64_t v11 = v9;
  uint64_t v12 = +[_DASDaemonLogger defaultCategory];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    sub_1000FFA78();
  }

  id v13 = *p_mainApplicationBundleIdentifier;
  id *p_mainApplicationBundleIdentifier = &stru_100179948;

  id v14 = 0;
LABEL_20:

  return v14;
}

- (NSString)mainApplicationBundleIdentifier
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unsigned __int8 v4 = [(_DASDaemonClient *)self unsafe_mainApplicationBundleIdentifier];
  os_unfair_lock_unlock(p_lock);

  return (NSString *)v4;
}

- (void)validateCTBGTaskRequestWithActivity:(id)a3
{
  daemon = self->_daemon;
  id v4 = a3;
  id v5 = [(_DASDaemon *)daemon enManager];
  [v5 setIsENActivity:v4];
}

- (void)submitTaskRequest:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  int v7 = (void (**)(id, void *))a4;
  id v8 = +[_DASActivity validateBGTaskRequestWithActivity:v6];
  if (!v8)
  {
    uint64_t v23 = _DASActivitySchedulerErrorDomain;
    uint64_t v24 = 3;
    goto LABEL_58;
  }
  id v9 = [v6 launchReason];
  unsigned int v10 = [v9 isEqualToString:_DASLaunchReasonHealthResearch];

  if (v10)
  {
    uint64_t v11 = [(NSXPCConnection *)self->_connection valueForEntitlement:@"com.apple.developer.backgroundtasks.healthresearch"];
    uint64_t v12 = v11;
    if (!v11 || ([v11 BOOLValue] & 1) == 0)
    {
      char v25 = +[_DASDaemonLogger logForCategory:@"BackgroundTasks"];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        sub_1000FFB04();
      }

      uint64_t v17 = +[NSError errorWithDomain:_DASActivitySchedulerErrorDomain code:0 userInfo:0];
      v7[2](v7, v17);
      goto LABEL_54;
    }
  }
  unsigned int v13 = [v6 isContinuedProcessingTask];
  if (v13)
  {
    if ([(_DASDaemonClient *)self hasEntitlementForProgressTask])
    {
      uint64_t v14 = [v6 clientProvidedIconBundleIdentifier];
      if (!v14) {
        goto LABEL_10;
      }
      uint64_t v15 = (void *)v14;
      unsigned __int8 v16 = [(_DASDaemonClient *)self hasEntitlementForCustomIconBundleIdentifier];

      if (v16) {
        goto LABEL_10;
      }
      long long v27 = +[_DASDaemonLogger logForCategory:@"BackgroundTasks"];
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        sub_1000FFEF4();
      }
    }
    else
    {
      long long v27 = +[_DASDaemonLogger logForCategory:@"BackgroundTasks"];
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        sub_1000FFF88();
      }
    }

    uint64_t v23 = _DASActivitySchedulerErrorDomain;
    uint64_t v24 = 0;
LABEL_58:
    uint64_t v12 = +[NSError errorWithDomain:v23 code:v24 userInfo:0];
    v7[2](v7, v12);
    goto LABEL_59;
  }
LABEL_10:
  uint64_t v12 = [(_DASDaemonClient *)self applicationBundleIdentifier];
  uint64_t v17 = [(_DASDaemonClient *)self mainApplicationBundleIdentifier];
  if (v13)
  {
    uint64_t v18 = +[_DASDaemonLogger logForCategory:@"BackgroundTasks"];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      sub_1000FFDE0();
    }

    if (v12)
    {
      id v19 = [(_DASDaemon *)self->_daemon context];
      long long v20 = +[_DASApplicationPolicy focalApplicationsWithContext:v19];

      if (([v20 containsObject:v17] & 1) == 0)
      {
        id v21 = +[_DASDaemonLogger logForCategory:@"BackgroundTasks"];
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          sub_1000FFD74();
        }

        uint64_t v22 = +[NSError errorWithDomain:_DASActivitySchedulerErrorDomain code:0 userInfo:0];
        v7[2](v7, v22);

        goto LABEL_53;
      }
    }
    else
    {
      long long v20 = +[_DASDaemonLogger logForCategory:@"BackgroundTasks"];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_1000FFD3C(v20, v28, v29, v30, v31, v32, v33, v34);
      }
    }
  }
  else
  {
    long long v26 = +[_DASDaemonLogger logForCategory:@"BackgroundTasks"];
    long long v20 = v26;
    if (!v12)
    {
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        sub_1000FFE48(v20, v46, v47, v48, v49, v50, v51, v52);
      }

      uint64_t v38 = _DASActivitySchedulerErrorDomain;
      uint64_t v39 = 1;
      goto LABEL_52;
    }
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
      sub_1000FFE80();
    }
  }

  v35 = [v8 clientProvidedIdentifier];
  if (![v35 hasPrefix:@"com.apple."])
  {

    goto LABEL_35;
  }
  unsigned __int8 v36 = [v12 hasPrefix:@"com.apple."];

  if (v36)
  {
LABEL_35:
    if (v17)
    {
      v54 = v17;
      v40 = +[NSArray arrayWithObjects:&v54 count:1];
      [v8 setRelatedApplications:v40];
    }
    if ((v13 & 1) == 0) {
      [v8 setRequestsApplicationLaunch:1];
    }
    [v8 setUserIdentifier:-[NSXPCConnection effectiveUserIdentifier](self->_connection, "effectiveUserIdentifier")];
    [(_DASDaemonClient *)self validateCTBGTaskRequestWithActivity:v8];
    daemon = self->_daemon;
    id v53 = 0;
    unsigned __int8 v42 = [(_DASDaemon *)daemon canSubmitValidatedTaskRequest:v8 withError:&v53];
    long long v20 = v53;
    v43 = +[_DASDaemonLogger logForCategory:@"BackgroundTasks"];
    v44 = v43;
    if (v42)
    {
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG)) {
        sub_1000FFB98();
      }

      if (v13) {
        [(_DASDaemonClient *)self submitActivityInternal:v8];
      }
      [(_DASDaemon *)self->_daemon submitActivity:v8];
      v45 = 0;
    }
    else
    {
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
        sub_1000FFC00();
      }

      v45 = v20;
    }
    v7[2](v7, v45);
    goto LABEL_53;
  }
  v37 = +[_DASDaemonLogger logForCategory:@"BackgroundTasks"];
  if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
    sub_1000FFC78((uint64_t)v12, v8, v37);
  }

  uint64_t v38 = _DASActivitySchedulerErrorDomain;
  uint64_t v39 = 3;
LABEL_52:
  long long v20 = +[NSError errorWithDomain:v38 code:v39 userInfo:0];
  v7[2](v7, v20);
LABEL_53:

LABEL_54:
LABEL_59:
}

- (void)getPendingTaskRequestsWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  id v5 = [(_DASDaemonClient *)self mainApplicationBundleIdentifier];
  if (v5)
  {
    [(_DASDaemon *)self->_daemon getPendingTaskRequestsForApplication:v5 withCompletionHandler:v4];
  }
  else
  {
    id v6 = +[_DASDaemonLogger logForCategory:@"BackgroundTasks"];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "App missing application-identifier", v7, 2u);
    }

    v4[2](v4, &__NSArray0__struct);
  }
}

- (void)cancelTaskRequestWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  int v7 = (void (**)(void))a4;
  id v8 = [(_DASDaemonClient *)self mainApplicationBundleIdentifier];
  if (v8)
  {
    [(_DASDaemon *)self->_daemon cancelTaskRequestWithIdentifier:v6 forApplication:v8];
  }
  else
  {
    id v9 = +[_DASDaemonLogger logForCategory:@"BackgroundTasks"];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "App missing application-identifier", v10, 2u);
    }
  }
  v7[2](v7);
}

- (void)cancelAllTaskRequestsWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(void))a3;
  id v5 = [(_DASDaemonClient *)self mainApplicationBundleIdentifier];
  if (v5)
  {
    [(_DASDaemon *)self->_daemon cancelAllTaskRequestsForApplication:v5];
  }
  else
  {
    id v6 = +[_DASDaemonLogger logForCategory:@"BackgroundTasks"];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "App missing application-identifier", v7, 2u);
    }
  }
  v4[2](v4);
}

- (void)handleLaunchFromDaemonForActivities:(id)a3
{
  id v4 = a3;
  id v5 = +[_DASDaemonLogger logForCategory:@"BackgroundTasks"];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = self;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Telling client %@ to handle activities: %@", (uint8_t *)&v8, 0x16u);
  }

  id v6 = self->_runningBGTasks;
  objc_sync_enter(v6);
  [(NSMutableSet *)self->_runningBGTasks unionSet:v4];
  objc_sync_exit(v6);

  int v7 = [(NSXPCConnection *)self->_connection remoteObjectProxy];
  [v7 handleLaunchFromDaemonForActivities:v4];
}

- (void)willExpireBGTaskActivities:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableSet set];
  id v6 = self->_runningBGTasks;
  objc_sync_enter(v6);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        if (-[NSMutableSet containsObject:](self->_runningBGTasks, "containsObject:", v11, (void)v14)) {
          [v5 addObject:v11];
        }
      }
      id v8 = [v7 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v8);
  }

  objc_sync_exit(v6);
  if ([v5 count])
  {
    uint64_t v12 = +[_DASDaemonLogger logForCategory:@"BackgroundTasks"];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v19 = self;
      __int16 v20 = 2112;
      id v21 = v5;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Warning client %@ for activities about to expire: %@", buf, 0x16u);
    }

    unsigned int v13 = [(NSXPCConnection *)self->_connection remoteObjectProxy];
    [v13 willExpireBGTaskActivities:v5];
  }
}

- (void)establishConnection:(id)a3
{
  id v4 = a3;
  id v5 = +[_DASDaemonLogger logForCategory:@"BackgroundTasks"];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Establishing connection from client: %@", (uint8_t *)&v6, 0xCu);
  }

  [(_DASDaemon *)self->_daemon establishConnectionFromClient:self withCompletionHandler:v4];
}

- (void)completeTaskRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  id v8 = +[_DASDaemonLogger logForCategory:@"BackgroundTasks"];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    unsigned int v13 = self;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Completing for client %@ task request %@", (uint8_t *)&v12, 0x16u);
  }

  uint64_t v9 = [(_DASDaemonClient *)self mainApplicationBundleIdentifier];
  if (v9 || ([v6 isContinuedProcessingTask] & 1) != 0)
  {
    __int16 v10 = self->_runningBGTasks;
    objc_sync_enter(v10);
    [(NSMutableSet *)self->_runningBGTasks removeObject:v6];
    objc_sync_exit(v10);

    if ([v6 isContinuedProcessingTask]) {
      [(_DASDaemonClient *)self activityCompletedInternal:v6];
    }
    [(_DASDaemon *)self->_daemon completeTaskRequest:v6 forApplication:v9];
  }
  else
  {
    uint64_t v11 = +[_DASDaemonLogger logForCategory:@"BackgroundTasks"];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "App missing application-identifier", (uint8_t *)&v12, 2u);
    }
  }
  v7[2](v7);
}

- (void)updateOngoingTask:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  id v8 = +[_DASDaemonLogger logForCategory:@"BackgroundTasks"];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v10 = 138412290;
    id v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Updating task request %@", (uint8_t *)&v10, 0xCu);
  }

  if ([(_DASDaemonClient *)self hasEntitlementForProgressTask])
  {
    [(_DASDaemon *)self->_daemon updateOngoingTask:v6 completionHandler:v7];
  }
  else
  {
    uint64_t v9 = +[_DASDaemonLogger logForCategory:@"BackgroundTasks"];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Missing valid entitlement", (uint8_t *)&v10, 2u);
    }

    v7[2](v7);
  }
}

- (void)updateProgressForOngoingTask:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  id v8 = +[_DASDaemonLogger logForCategory:@"BackgroundTasks"];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = [v6 progress];
    int v11 = 138412546;
    int v12 = v9;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Updating progress %@ for task request %@", (uint8_t *)&v11, 0x16u);
  }
  if ([(_DASDaemonClient *)self hasEntitlementForProgressTask])
  {
    [(_DASDaemon *)self->_daemon updateProgressForOngoingTask:v6 completionHandler:v7];
  }
  else
  {
    int v10 = +[_DASDaemonLogger logForCategory:@"BackgroundTasks"];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Missing valid entitlement", (uint8_t *)&v11, 2u);
    }

    v7[2](v7);
  }
}

- (void)acknowledgeSystemTaskLaunchWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[_DASBGSystemTaskHelper sharedInstance];
  [v8 acknowledgeSystemTaskLaunchWithIdentifier:v7 withPID:-[NSXPCConnection processIdentifier](self->_connection, "processIdentifier") withUID:-[NSXPCConnection effectiveUserIdentifier](self->_connection, "effectiveUserIdentifier") completionHandler:v6];
}

- (void)acknowledgeSystemTaskSuspensionWithIdentifier:(id)a3 retryAfter:(double)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = +[_DASBGSystemTaskHelper sharedInstance];
  [v10 acknowledgeSystemTaskSuspensionWithIdentifier:v9 withPID:[self->_connection processIdentifier] withUID:[self->_connection effectiveUserIdentifier] retryAfter:v8 completionHandler:a4];
}

- (void)handleClientLedSystemTaskExpirationWithIdentifier:(id)a3 retryAfter:(double)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = +[_DASBGSystemTaskHelper sharedInstance];
  [v10 handleClientLedSystemTaskExpirationWithIdentifier:v9 withPID:[self->_connection processIdentifier] withUID:[self->_connection effectiveUserIdentifier] retryAfter:v8 completionHandler:a4];
}

- (void)submitTaskRequestWithIdentifier:(id)a3 descriptor:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = +[_DASBGSystemTaskHelper sharedInstance];
  [v11 submitTaskRequestWithIdentifier:v10 descriptor:v9 withPID:[self->_connection processIdentifier] withUID:[self->_connection effectiveUserIdentifier] completionHandler:v8];
}

- (void)updateTaskRequestWithIdentifier:(id)a3 descriptor:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = +[_DASBGSystemTaskHelper sharedInstance];
  [v11 updateTaskRequestWithIdentifier:v10 descriptor:v9 withPID:[self->_connection processIdentifier] withUID:[self->_connection effectiveUserIdentifier] completionHandler:v8];
}

- (void)completeSystemTaskWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[_DASBGSystemTaskHelper sharedInstance];
  [v8 completeSystemTaskWithIdentifier:v7 withPID:[self->_connection processIdentifier] withUID:[self->_connection effectiveUserIdentifier] completionHandler:v6];
}

- (void)resumeTaskSchedulingWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[_DASBGSystemTaskHelper sharedInstance];
  [v8 resumeTaskSchedulingWithIdentifier:v7 withPID:[self->_connection processIdentifier] withUID:[self->_connection effectiveUserIdentifier] completionHandler:v6];
}

- (void)unregisterSystemTaskWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[_DASBGSystemTaskHelper sharedInstance];
  [v8 unregisterSystemTaskWithIdentifier:v7 withPID:[self->_connection processIdentifier] withUID:[self->_connection effectiveUserIdentifier] completionHandler:v6];
}

- (void)reportSystemTaskWithIdentifier:(id)a3 producedResults:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = +[_DASBGSystemTaskHelper sharedInstance];
  [v11 reportSystemTaskWithIdentifier:v10 producedResults:v9 withPID:[self->_connection processIdentifier] withUID:[self->_connection effectiveUserIdentifier] completionHandler:v8];
}

- (void)reportSystemTaskWithIdentifier:(id)a3 consumedResults:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = +[_DASBGSystemTaskHelper sharedInstance];
  [v11 reportSystemTaskWithIdentifier:v10 consumedResults:v9 withPID:[self->_connection processIdentifier] withUID:[self->_connection effectiveUserIdentifier] completionHandler:v8];
}

- (void)resetResultsForIdentifier:(id)a3 byTaskWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = +[_DASBGSystemTaskHelper sharedInstance];
  [v11 resetResultsForIdentifier:v10 byTaskWithIdentifier:v9 withPID:[self->_connection processIdentifier] withUID:[self->_connection effectiveUserIdentifier] completionHandler:v8];
}

- (void)reportTaskWorkloadProgress:(id)a3 target:(unint64_t)a4 completed:(unint64_t)a5 category:(unint64_t)a6 subCategory:(id)a7 completionHandler:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a3;
  id v19 = +[_DASBGSystemTaskHelper sharedInstance];
  uint64_t v17 = [(NSXPCConnection *)self->_connection processIdentifier];
  LODWORD(v18) = [(NSXPCConnection *)self->_connection effectiveUserIdentifier];
  [v19 recordTaskWorkloadProgress:v16 target:a4 completed:a5 category:a6 subCategory:v15 withPID:v17 withUID:v18 completionHandler:v14];
}

- (void)resetFastPassActivities:(id)a3 resetAll:(BOOL)a4 withHandler:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v8 = a3;
  id v9 = +[_DASBGSystemTaskHelper sharedInstance];
  [v9 resetFastPassActivities:v8 resetAll:v5 withHandler:v7];
}

- (void)inspect:(id)a3 withHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[_DASBGSystemTaskHelper sharedInstance];
  [v7 inspect:v6 withHandler:v5];
}

- (void)resubmitRunningTasks:(id)a3
{
  id v4 = a3;
  id v5 = +[_DASBGSystemTaskHelper sharedInstance];
  [v5 resubmitRunningTasks:v4 withPID:[self->_connection processIdentifier] withUID:[self->_connection effectiveUserIdentifier]];
}

- (void)submittedActivitiesWithHandler:(id)a3
{
  if (self->_restricted)
  {
    id v5 = +[_DASDaemonLogger logForCategory:@"bar"];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000FF63C(a2);
    }

    [(NSXPCConnection *)self->_connection invalidate];
  }
  else
  {
    daemon = self->_daemon;
    [(_DASDaemon *)daemon submittedActivitiesWithHandler:a3];
  }
}

- (void)delayedRunningActivitiesWithHandler:(id)a3
{
  if (self->_restricted)
  {
    id v5 = +[_DASDaemonLogger logForCategory:@"bar"];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000FF63C(a2);
    }

    [(NSXPCConnection *)self->_connection invalidate];
  }
  else
  {
    daemon = self->_daemon;
    [(_DASDaemon *)daemon delayedRunningActivitiesWithHandler:a3];
  }
}

- (void)runningActivitiesWithHandler:(id)a3
{
  if (self->_restricted)
  {
    id v5 = +[_DASDaemonLogger logForCategory:@"bar"];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000FF63C(a2);
    }

    [(NSXPCConnection *)self->_connection invalidate];
  }
  else
  {
    daemon = self->_daemon;
    [(_DASDaemon *)daemon runningActivitiesWithHandler:a3];
  }
}

- (void)runningGroupActivitiesWithHandler:(id)a3
{
  if (self->_restricted)
  {
    id v5 = +[_DASDaemonLogger logForCategory:@"bar"];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000FF63C(a2);
    }

    [(NSXPCConnection *)self->_connection invalidate];
  }
  else
  {
    daemon = self->_daemon;
    [(_DASDaemon *)daemon runningGroupActivitiesWithHandler:a3];
  }
}

- (void)scoresForActivityWithName:(id)a3 withHandler:(id)a4
{
  if (self->_restricted)
  {
    id v6 = +[_DASDaemonLogger logForCategory:@"bar", a4];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000FF63C(a2);
    }

    [(NSXPCConnection *)self->_connection invalidate];
  }
  else
  {
    daemon = self->_daemon;
    [(_DASDaemon *)daemon scoresForActivityWithName:a3 withHandler:a4];
  }
}

- (void)activityRunStatisticsWithHandler:(id)a3
{
  if (self->_restricted)
  {
    id v5 = +[_DASDaemonLogger logForCategory:@"bar"];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000FF63C(a2);
    }

    [(NSXPCConnection *)self->_connection invalidate];
  }
  else
  {
    daemon = self->_daemon;
    [(_DASDaemon *)daemon activityRunStatisticsWithHandler:a3];
  }
}

- (void)forceRunActivities:(id)a3
{
  if (self->_restricted)
  {
    id v5 = +[_DASDaemonLogger logForCategory:@"bar"];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000FF63C(a2);
    }

    [(NSXPCConnection *)self->_connection invalidate];
  }
  else
  {
    daemon = self->_daemon;
    [(_DASDaemon *)daemon forceRunActivities:a3];
  }
}

- (void)runActivitiesWithUrgency:(int64_t)a3 activities:(id)a4
{
  if (self->_restricted)
  {
    id v6 = +[_DASDaemonLogger logForCategory:@"bar", a4];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000FF63C(a2);
    }

    [(NSXPCConnection *)self->_connection invalidate];
  }
  else
  {
    daemon = self->_daemon;
    [(_DASDaemon *)daemon runActivitiesWithUrgency:a3 activities:a4];
  }
}

- (void)deferActivities:(id)a3 withHandler:(id)a4
{
  if (self->_restricted)
  {
    id v6 = +[_DASDaemonLogger logForCategory:@"bar", a4];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000FF63C(a2);
    }

    [(NSXPCConnection *)self->_connection invalidate];
  }
  else
  {
    daemon = self->_daemon;
    [(_DASDaemon *)daemon deferActivities:a3 withHandler:a4];
  }
}

- (void)currentPredictionsWithHandler:(id)a3
{
  if (self->_restricted)
  {
    id v5 = +[_DASDaemonLogger logForCategory:@"bar"];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000FF63C(a2);
    }

    [(NSXPCConnection *)self->_connection invalidate];
  }
  else
  {
    daemon = self->_daemon;
    [(_DASDaemon *)daemon currentPredictionsWithHandler:a3];
  }
}

- (void)statisticsWithHandler:(id)a3
{
  if (self->_restricted)
  {
    id v5 = +[_DASDaemonLogger logForCategory:@"bar"];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000FF63C(a2);
    }

    [(NSXPCConnection *)self->_connection invalidate];
  }
  else
  {
    daemon = self->_daemon;
    [(_DASDaemon *)daemon statisticsWithHandler:a3];
  }
}

- (void)forceResetOfResultIdentifier:(id)a3
{
  id v5 = a3;
  if (self->_restricted)
  {
    id v6 = +[_DASDaemonLogger logForCategory:@"dependencies"];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000FF63C(a2);
    }

    [(NSXPCConnection *)self->_connection invalidate];
  }
  else
  {
    id v7 = +[_DASActivityDependencyManager sharedInstance];
    [v7 dastool_forceResetOfResultIdentifier:v5];
  }
}

- (void)queryStatusOfResultIdentifier:(id)a3 withHandler:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void *))a4;
  if (self->_restricted)
  {
    id v9 = +[_DASDaemonLogger logForCategory:@"dependencies"];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000FF63C(a2);
    }

    [(NSXPCConnection *)self->_connection invalidate];
  }
  else
  {
    id v10 = +[_DASActivityDependencyManager sharedInstance];
    id v11 = [v10 dastool_queryStatusOfResultIdentifier:v7];

    v8[2](v8, v11);
  }
}

- (void)queryDependenciesOfTaskIdentifier:(id)a3 withHandler:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void *))a4;
  if (self->_restricted)
  {
    id v9 = +[_DASDaemonLogger logForCategory:@"dependencies"];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000FF63C(a2);
    }

    [(NSXPCConnection *)self->_connection invalidate];
  }
  else
  {
    id v10 = [(_DASDaemon *)self->_daemon getActivityWithName:v7];
    if (v10)
    {
      id v23 = v7;
      id v11 = +[NSMutableDictionary dictionary];
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      int v12 = [v10 dependencies];
      id v13 = [v12 countByEnumeratingWithState:&v24 objects:v32 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v25;
        do
        {
          for (uint64_t i = 0; i != v14; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v25 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = *(void **)(*((void *)&v24 + 1) + 8 * i);
            uint64_t v18 = +[_DASDaemonLogger logForCategory:@"dependencies"];
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v31 = v17;
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "dependency: %@", buf, 0xCu);
            }

            id v19 = [v17 dictionary];
            [v11 addEntriesFromDictionary:v19];
          }
          id v14 = [v12 countByEnumeratingWithState:&v24 objects:v32 count:16];
        }
        while (v14);
      }

      v28[0] = @"activityIdentifier";
      __int16 v20 = [v10 name];
      v28[1] = @"dependencies";
      v29[0] = v20;
      v29[1] = v11;
      id v21 = +[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:2];
      v8[2](v8, v21);

      id v7 = v23;
    }
    else
    {
      uint64_t v22 = +[_DASDaemonLogger logForCategory:@"dependencies"];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_10010001C();
      }

      v8[2](v8, 0);
    }
  }
}

- (void)deleteLimitForActivity:(id)a3 forLimiterWithName:(id)a4 handler:(id)a5
{
  if (self->_restricted)
  {
    id v7 = +[_DASDaemonLogger logForCategory:@"budgeting", a4, a5];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000FF63C(a2);
    }

    [(NSXPCConnection *)self->_connection invalidate];
  }
  else
  {
    daemon = self->_daemon;
    [(_DASDaemon *)daemon deleteLimitForActivity:a3 forLimiterWithName:a4 handler:a5];
  }
}

- (void)updateLimit:(double)a3 forActivity:(id)a4 forLimiterWithName:(id)a5 handler:(id)a6
{
  if (self->_restricted)
  {
    id v8 = +[_DASDaemonLogger logForCategory:@"budgeting", a5, a6, a3];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000FF63C(a2);
    }

    [(NSXPCConnection *)self->_connection invalidate];
  }
  else
  {
    daemon = self->_daemon;
    [(_DASDaemon *)daemon updateLimit:a4 forActivity:a5 forLimiterWithName:a6 handler:a3];
  }
}

- (void)getLimiterResponseForActivity:(id)a3 handler:(id)a4
{
  if (self->_restricted)
  {
    id v6 = +[_DASDaemonLogger logForCategory:@"budgeting", a4];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000FF63C(a2);
    }

    [(NSXPCConnection *)self->_connection invalidate];
  }
  else
  {
    daemon = self->_daemon;
    [(_DASDaemon *)daemon getLimiterResponseForActivity:a3 handler:a4];
  }
}

- (void)getRuntimeLimit:(id)a3 handler:(id)a4
{
  if (self->_restricted)
  {
    id v6 = +[_DASDaemonLogger logForCategory:@"budgeting", a4];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000FF63C(a2);
    }

    [(NSXPCConnection *)self->_connection invalidate];
  }
  else
  {
    daemon = self->_daemon;
    [(_DASDaemon *)daemon getRuntimeLimit:a3 handler:a4];
  }
}

- (void)getElapsedRuntimes:(id)a3 timeFilter:(id)a4 bgsqlData:(id)a5 handler:(id)a6
{
  if (self->_restricted)
  {
    id v8 = +[_DASDaemonLogger logForCategory:@"latency", a4, a5, a6];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000FF63C(a2);
    }

    [(NSXPCConnection *)self->_connection invalidate];
  }
  else
  {
    daemon = self->_daemon;
    [(_DASDaemon *)daemon getElapsedRuntimes:a3 timeFilter:a4 bgsqlData:a5 handler:a6];
  }
}

- (void)getEstimatedRuntimes:(id)a3 timeFilter:(id)a4 bgsqlData:(id)a5 handler:(id)a6
{
  if (self->_restricted)
  {
    id v8 = +[_DASDaemonLogger logForCategory:@"latency", a4, a5, a6];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000FF63C(a2);
    }

    [(NSXPCConnection *)self->_connection invalidate];
  }
  else
  {
    daemon = self->_daemon;
    [(_DASDaemon *)daemon getEstimatedRuntimes:a3 timeFilter:a4 bgsqlData:a5 handler:a6];
  }
}

- (void)getConditionsPenalties:(id)a3 handler:(id)a4
{
  if (self->_restricted)
  {
    id v6 = +[_DASDaemonLogger logForCategory:@"latency", a4];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000FF63C(a2);
    }

    [(NSXPCConnection *)self->_connection invalidate];
  }
  else
  {
    daemon = self->_daemon;
    [(_DASDaemon *)daemon getConditionsPenalties:a3 handler:a4];
  }
}

- (void)getFeatureTimelines:(id)a3 timeFilter:(id)a4 bgsqlData:(id)a5 handler:(id)a6
{
  if (self->_restricted)
  {
    id v8 = +[_DASDaemonLogger logForCategory:@"latency", a4, a5, a6];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000FF63C(a2);
    }

    [(NSXPCConnection *)self->_connection invalidate];
  }
  else
  {
    daemon = self->_daemon;
    [(_DASDaemon *)daemon getFeatureTimelines:a3 timeFilter:a4 bgsqlData:a5 handler:a6];
  }
}

- (void)getActivityTimelines:(id)a3 timeFilter:(id)a4 bgsqlData:(id)a5 handler:(id)a6
{
  if (self->_restricted)
  {
    id v8 = +[_DASDaemonLogger logForCategory:@"latency", a4, a5, a6];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000FF63C(a2);
    }

    [(NSXPCConnection *)self->_connection invalidate];
  }
  else
  {
    daemon = self->_daemon;
    [(_DASDaemon *)daemon getActivityTimelines:a3 timeFilter:a4 bgsqlData:a5 handler:a6];
  }
}

- (void)getDeviceConditionTimelines:(id)a3 bgsqlData:(id)a4 handler:(id)a5
{
  if (self->_restricted)
  {
    id v7 = +[_DASDaemonLogger logForCategory:@"latency", a4, a5];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000FF63C(a2);
    }

    [(NSXPCConnection *)self->_connection invalidate];
  }
  else
  {
    daemon = self->_daemon;
    [(_DASDaemon *)daemon getDeviceConditionTimelines:a3 bgsqlData:a4 handler:a5];
  }
}

- (void)getInstallTimeline:(id)a3 bgsqlData:(id)a4 handler:(id)a5
{
  if (self->_restricted)
  {
    id v7 = +[_DASDaemonLogger logForCategory:@"latency", a4, a5];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000FF63C(a2);
    }

    [(NSXPCConnection *)self->_connection invalidate];
  }
  else
  {
    daemon = self->_daemon;
    [(_DASDaemon *)daemon getInstallTimeline:a3 bgsqlData:a4 handler:a5];
  }
}

- (void)getBuddyEvents:(id)a3 bgsqlData:(id)a4 handler:(id)a5
{
  if (self->_restricted)
  {
    id v7 = +[_DASDaemonLogger logForCategory:@"latency", a4, a5];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000FF63C(a2);
    }

    [(NSXPCConnection *)self->_connection invalidate];
  }
  else
  {
    daemon = self->_daemon;
    [(_DASDaemon *)daemon getBuddyEvents:a3 bgsqlData:a4 handler:a5];
  }
}

- (void)getEstimatedMADCompletionTimes:(id)a3 endDate:(id)a4 bgsqlData:(id)a5 handler:(id)a6
{
  if (self->_restricted)
  {
    id v8 = +[_DASDaemonLogger logForCategory:@"latency", a4, a5, a6];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000FF63C(a2);
    }

    [(NSXPCConnection *)self->_connection invalidate];
  }
  else
  {
    daemon = self->_daemon;
    [(_DASDaemon *)daemon getEstimatedMADCompletionTimes:a3 endDate:a4 bgsqlData:a5 handler:a6];
  }
}

- (void)allBudgetsWithHandler:(id)a3
{
  if (self->_restricted)
  {
    id v5 = +[_DASDaemonLogger logForCategory:@"budgeting"];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000FF63C(a2);
    }

    [(NSXPCConnection *)self->_connection invalidate];
  }
  else
  {
    daemon = self->_daemon;
    [(_DASDaemon *)daemon allBudgetsWithHandler:a3];
  }
}

- (void)balanceForBudgetWithName:(id)a3 withHandler:(id)a4
{
  if (self->_restricted)
  {
    id v6 = +[_DASDaemonLogger logForCategory:@"budgeting", a4];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000FF63C(a2);
    }

    [(NSXPCConnection *)self->_connection invalidate];
  }
  else
  {
    daemon = self->_daemon;
    [(_DASDaemon *)daemon balanceForBudgetWithName:a3 withHandler:a4];
  }
}

- (void)setBalance:(double)a3 forBudgetWithName:(id)a4
{
  if (self->_restricted)
  {
    id v6 = +[_DASDaemonLogger logForCategory:@"budgeting", a3];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000FF63C(a2);
    }

    [(NSXPCConnection *)self->_connection invalidate];
  }
  else
  {
    daemon = self->_daemon;
    [(_DASDaemon *)daemon setBalance:a4 forBudgetWithName:a3];
  }
}

- (void)decrementBy:(double)a3 forBudgetWithName:(id)a4
{
  if (self->_restricted)
  {
    id v6 = +[_DASDaemonLogger logForCategory:@"budgeting", a3];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000FF63C(a2);
    }

    [(NSXPCConnection *)self->_connection invalidate];
  }
  else
  {
    daemon = self->_daemon;
    [(_DASDaemon *)daemon decrementBy:a4 forBudgetWithName:a3];
  }
}

- (void)setCapacity:(double)a3 forBudgetWithName:(id)a4
{
  if (self->_restricted)
  {
    id v6 = +[_DASDaemonLogger logForCategory:@"budgeting", a3];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000FF63C(a2);
    }

    [(NSXPCConnection *)self->_connection invalidate];
  }
  else
  {
    daemon = self->_daemon;
    [(_DASDaemon *)daemon setCapacity:a4 forBudgetWithName:a3];
  }
}

- (void)policiesWithHandler:(id)a3
{
  if (self->_restricted)
  {
    id v5 = +[_DASDaemonLogger logForCategory:@"bar"];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000FF63C(a2);
    }

    [(NSXPCConnection *)self->_connection invalidate];
  }
  else
  {
    daemon = self->_daemon;
    [(_DASDaemon *)daemon policiesWithHandler:a3];
  }
}

- (void)clasStatusWithHandler:(id)a3
{
  if (self->_restricted)
  {
    id v5 = +[_DASDaemonLogger logForCategory:@"clas"];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000FF63C(a2);
    }

    [(NSXPCConnection *)self->_connection invalidate];
  }
  else
  {
    daemon = self->_daemon;
    [(_DASDaemon *)daemon clasStatusWithHandler:a3];
  }
}

- (void)evaluatePolicies:(id)a3 handler:(id)a4
{
  if (self->_restricted)
  {
    id v6 = +[_DASDaemonLogger logForCategory:@"bar", a4];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000FF63C(a2);
    }

    [(NSXPCConnection *)self->_connection invalidate];
  }
  else
  {
    daemon = self->_daemon;
    [(_DASDaemon *)daemon evaluatePolicies:a3 handler:a4];
  }
}

- (void)evaluateAllActivities:(id)a3 handler:(id)a4
{
  if (self->_restricted)
  {
    id v6 = +[_DASDaemonLogger logForCategory:@"bar", a4];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000FF63C(a2);
    }

    [(NSXPCConnection *)self->_connection invalidate];
  }
  else
  {
    daemon = self->_daemon;
    [(_DASDaemon *)daemon evaluateAllActivities:a3 handler:a4];
  }
}

- (void)runProceedableActivities:(id)a3 handler:(id)a4
{
  if (self->_restricted)
  {
    id v6 = +[_DASDaemonLogger logForCategory:@"bar", a4];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000FF63C(a2);
    }

    [(NSXPCConnection *)self->_connection invalidate];
  }
  else
  {
    daemon = self->_daemon;
    [(_DASDaemon *)daemon runProceedableActivities:a3 handler:a4];
  }
}

- (void)activityContainsOverrides:(id)a3 handler:(id)a4
{
  if (self->_restricted)
  {
    id v6 = +[_DASDaemonLogger logForCategory:@"bar", a4];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000FF63C(a2);
    }

    [(NSXPCConnection *)self->_connection invalidate];
  }
  else
  {
    daemon = self->_daemon;
    [(_DASDaemon *)daemon activityContainsOverrides:a3 handler:a4];
  }
}

- (void)blockingPoliciesWithParameters:(id)a3 handler:(id)a4
{
  if (self->_restricted)
  {
    id v6 = +[_DASDaemonLogger logForCategory:@"bar", a4];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000FF63C(a2);
    }

    [(NSXPCConnection *)self->_connection invalidate];
  }
  else
  {
    daemon = self->_daemon;
    [(_DASDaemon *)daemon blockingPoliciesWithParameters:a3 handler:a4];
  }
}

- (void)enterTestModeWithParameters:(id)a3 reset:(BOOL)a4 handler:(id)a5
{
  if (self->_restricted)
  {
    id v7 = +[_DASDaemonLogger logForCategory:@"bar", a4, a5];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000FF63C(a2);
    }

    [(NSXPCConnection *)self->_connection invalidate];
  }
  else
  {
    daemon = self->_daemon;
    [(_DASDaemon *)daemon enterTestModeWithParameters:a3 reset:a4 handler:a5];
  }
}

- (void)enableTaskRegistryMode:(BOOL)a3 processes:(id)a4 handler:(id)a5
{
  if (self->_restricted)
  {
    id v7 = +[_DASDaemonLogger logForCategory:@"bar", a4, a5];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000FF63C(a2);
    }

    [(NSXPCConnection *)self->_connection invalidate];
  }
  else
  {
    daemon = self->_daemon;
    [(_DASDaemon *)daemon enableTaskRegistryMode:a3 processes:a4 handler:a5];
  }
}

- (void)submitRateLimitConfiguration:(id)a3 handler:(id)a4
{
  if (self->_restricted)
  {
    id v6 = +[_DASDaemonLogger logForCategory:@"bar", a4];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000FF63C(a2);
    }

    [(NSXPCConnection *)self->_connection invalidate];
  }
  else
  {
    daemon = self->_daemon;
    [(_DASDaemon *)daemon submitRateLimitConfiguration:a3 handler:a4];
  }
}

- (void)pauseWithParameters:(id)a3 handler:(id)a4
{
  if (self->_restricted)
  {
    id v6 = +[_DASDaemonLogger logForCategory:@"bar", a4];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000FF63C(a2);
    }

    [(NSXPCConnection *)self->_connection invalidate];
  }
  else
  {
    daemon = self->_daemon;
    [(_DASDaemon *)daemon pauseWithParameters:a3 handler:a4];
  }
}

- (void)addPauseExceptParameter:(id)a3 handler:(id)a4
{
  if (self->_restricted)
  {
    id v6 = +[_DASDaemonLogger logForCategory:@"bar", a4];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000FF63C(a2);
    }

    [(NSXPCConnection *)self->_connection invalidate];
  }
  else
  {
    daemon = self->_daemon;
    [(_DASDaemon *)daemon addPauseExceptParameter:a3 handler:a4];
  }
}

- (void)reportSystemWorkload:(unint64_t)a3 ofCategory:(unint64_t)a4 withHandler:(id)a5
{
}

- (void)reportFeatureCheckpoint:(unint64_t)a3 forFeature:(unint64_t)a4 withHandler:(id)a5
{
}

- (void)reportCustomCheckpoint:(unint64_t)a3 forTask:(id)a4 withHandler:(id)a5
{
}

- (void)activityStoppedWithParameters:(id)a3
{
}

- (void)prewarmApplication:(id)a3
{
  if (self->_restricted)
  {
    id v5 = +[_DASDaemonLogger logForCategory:@"bar"];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000FF63C(a2);
    }

    [(NSXPCConnection *)self->_connection invalidate];
  }
  else
  {
    daemon = self->_daemon;
    [(_DASDaemon *)daemon prewarmApplication:a3];
  }
}

- (void)prewarmSuspendWithHandler:(id)a3
{
  id v5 = (void (**)(id, void))a3;
  id v4 = [(_DASDaemonClient *)self mainApplicationBundleIdentifier];
  if (!v4) {
    v5[2](v5, 0);
  }
  [(_DASDaemon *)self->_daemon prewarmSuspendApplication:v4 withHandler:v5];
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (NSMutableSet)submittedTasks
{
  return self->_submittedTasks;
}

- (void)setSubmittedTasks:(id)a3
{
}

- (NSMutableSet)delayedStartTasks
{
  return self->_delayedStartTasks;
}

- (void)setDelayedStartTasks:(id)a3
{
}

- (NSMutableSet)startedTasks
{
  return self->_startedTasks;
}

- (void)setStartedTasks:(id)a3
{
}

- (void)setApplicationBundleIdentifier:(id)a3
{
}

- (void)setMainApplicationBundleIdentifier:(id)a3
{
}

- (_DASDaemon)daemon
{
  return self->_daemon;
}

- (void)setDaemon:(id)a3
{
}

- (NSMutableSet)runningBGTasks
{
  return self->_runningBGTasks;
}

- (void)setRunningBGTasks:(id)a3
{
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (BOOL)restricted
{
  return self->_restricted;
}

- (void)setRestricted:(BOOL)a3
{
  self->_restricted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runningBGTasks, 0);
  objc_storeStrong((id *)&self->_daemon, 0);
  objc_storeStrong((id *)&self->_mainApplicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_startedTasks, 0);
  objc_storeStrong((id *)&self->_delayedStartTasks, 0);
  objc_storeStrong((id *)&self->_submittedTasks, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end