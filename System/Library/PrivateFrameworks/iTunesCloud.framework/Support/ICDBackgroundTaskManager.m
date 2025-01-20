@interface ICDBackgroundTaskManager
- (BOOL)_cellularDataAllowed;
- (ICDAccountManaging)accountManager;
- (ICDBackgroundTaskManager)initWithAccountManager:(id)a3 handlerCoordinator:(id)a4;
- (ICDHandlerCoordinating)handlerCoordinator;
- (NSMutableSet)currentTasks;
- (id)_deferredPushActivityCriteriaForTask:(id)a3 startTime:(int64_t)a4 gracePeriod:(int64_t)a5;
- (id)_periodicPollingActivityCriteriaWithRefreshInterval:(int64_t)a3 gracePeriod:(int64_t)a4;
- (id)_taskWithName:(id)a3;
- (id)activityCriteriaForTask:(id)a3 startTimeInSeconds:(int64_t)a4;
- (int64_t)_deferredPushGracePeriodSeconds;
- (int64_t)_pollingGracePeriodSecondsForRefreshInterval:(int64_t)a3;
- (int64_t)_pollingRefreshIntervalSecondsUsingBag:(id)a3;
- (void)_handleJaliscoDeferredPushUpdateTask:(id)a3 completion:(id)a4;
- (void)_handleSagaDeferredPushUpdateTask:(id)a3 completion:(id)a4;
- (void)_handleTask:(id)a3 completion:(id)a4;
- (void)_restoreCurrentTasks;
- (void)_saveCurrentTasks;
- (void)_scheduleTask:(id)a3 withStartTime:(int64_t)a4;
- (void)_startTask:(id)a3;
- (void)_stopTask:(id)a3;
- (void)_unscheduleTask:(id)a3;
- (void)scheduleTaskOfType:(int64_t)a3 forConfiguration:(id)a4;
- (void)startPeriodicPolling;
@end

@implementation ICDBackgroundTaskManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTasks, 0);
  objc_storeStrong((id *)&self->_handlerCoordinator, 0);

  objc_storeStrong((id *)&self->_accountManager, 0);
}

- (NSMutableSet)currentTasks
{
  return self->_currentTasks;
}

- (ICDHandlerCoordinating)handlerCoordinator
{
  return self->_handlerCoordinator;
}

- (ICDAccountManaging)accountManager
{
  return self->_accountManager;
}

- (void)_handleJaliscoDeferredPushUpdateTask:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = os_log_create("com.apple.amp.itunescloudd", "BackgroundTasks");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 type];
    CFStringRef v10 = @"com.apple.itunescloudd.deferredPushUpdate.jalisco";
    if (!v9) {
      CFStringRef v10 = @"com.apple.itunescloudd.deferredPushUpdate.saga";
    }
    *(_DWORD *)buf = 134218242;
    v19 = self;
    __int16 v20 = 2114;
    CFStringRef v21 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "ICDBackgroundTaskManager %p - Job Fired: jaliscoDeferredPushUpate [%{public}@]", buf, 0x16u);
  }

  v11 = [v6 configuration];
  v12 = +[BaseRequestHandler handlerForConfiguration:v11];
  v13 = [v6 configuration];
  v14 = [v13 clientIdentity];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100130838;
  v16[3] = &unk_1001BF2B0;
  v16[4] = self;
  id v17 = v7;
  id v15 = v7;
  [v12 updateJaliscoLibraryWithClientIdentity:v14 forReason:1000 completionHandler:v16];
}

- (void)_handleSagaDeferredPushUpdateTask:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = os_log_create("com.apple.amp.itunescloudd", "BackgroundTasks");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 type];
    CFStringRef v10 = @"com.apple.itunescloudd.deferredPushUpdate.jalisco";
    if (!v9) {
      CFStringRef v10 = @"com.apple.itunescloudd.deferredPushUpdate.saga";
    }
    *(_DWORD *)buf = 134218242;
    v19 = self;
    __int16 v20 = 2114;
    CFStringRef v21 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "ICDBackgroundTaskManager %p - Job Fired: sagaDeferredPushUpate [%{public}@]", buf, 0x16u);
  }

  v11 = [v6 configuration];
  v12 = +[BaseRequestHandler handlerForConfiguration:v11];
  v13 = [v6 configuration];
  v14 = [v13 clientIdentity];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100130B44;
  v16[3] = &unk_1001BF2B0;
  v16[4] = self;
  id v17 = v7;
  id v15 = v7;
  [v12 updateSagaLibraryWithClientIdentity:v14 forReason:1000 allowNoisyAuthPrompt:0 isExplicitUserAction:0 completionHandler:v16];
}

- (id)_deferredPushActivityCriteriaForTask:(id)a3 startTime:(int64_t)a4 gracePeriod:(int64_t)a5
{
  id v9 = [a3 configuration];
  CFStringRef v10 = [v9 userIdentity];
  v11 = [v10 accountDSID];

  if (!v11)
  {
    v14 = +[NSAssertionHandler currentHandler];
    [v14 handleFailureInMethod:a2, self, @"ICDBackgroundTaskManager.m", 366, @"Invalid parameter not satisfying: %@", @"task.configuration.userIdentity.accountDSID != nil" object file lineNumber description];
  }
  xpc_object_t v12 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v12, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
  xpc_dictionary_set_BOOL(v12, XPC_ACTIVITY_REPEATING, 0);
  xpc_dictionary_set_int64(v12, XPC_ACTIVITY_DELAY, a4);
  xpc_dictionary_set_int64(v12, XPC_ACTIVITY_GRACE_PERIOD, a5);
  xpc_dictionary_set_BOOL(v12, XPC_ACTIVITY_REQUIRE_SCREEN_SLEEP, 0);

  return v12;
}

- (int64_t)_deferredPushGracePeriodSeconds
{
  return XPC_ACTIVITY_INTERVAL_1_HOUR;
}

- (id)_periodicPollingActivityCriteriaWithRefreshInterval:(int64_t)a3 gracePeriod:(int64_t)a4
{
  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v6, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
  xpc_dictionary_set_BOOL(v6, XPC_ACTIVITY_REPEATING, 1);
  xpc_dictionary_set_int64(v6, XPC_ACTIVITY_INTERVAL, a3);
  xpc_dictionary_set_int64(v6, XPC_ACTIVITY_GRACE_PERIOD, a4);
  xpc_dictionary_set_BOOL(v6, XPC_ACTIVITY_REQUIRE_SCREEN_SLEEP, 0);

  return v6;
}

- (int64_t)_pollingGracePeriodSecondsForRefreshInterval:(int64_t)a3
{
  if (XPC_ACTIVITY_INTERVAL_1_DAY <= a3) {
    v3 = (int64_t *)&XPC_ACTIVITY_INTERVAL_1_HOUR;
  }
  else {
    v3 = (int64_t *)&XPC_ACTIVITY_INTERVAL_15_MIN;
  }
  return *v3;
}

- (int64_t)_pollingRefreshIntervalSecondsUsingBag:(id)a3
{
  v4 = [a3 dictionaryForBagKey:@"purchase-daap"];
  v5 = ICGetCloudDAAPClientPrefix();
  xpc_object_t v6 = [v5 stringByAppendingString:@"forced-refresh-frequency-minutes"];

  id v7 = [v4 objectForKeyedSubscript:v6];
  v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [v4 objectForKeyedSubscript:@"forced-refresh-frequency-minutes"];
  }
  CFStringRef v10 = v9;

  if (_NSIsNSNumber()) {
    int64_t v11 = 60 * (void)[v10 longLongValue];
  }
  else {
    int64_t v11 = XPC_ACTIVITY_INTERVAL_7_DAYS;
  }
  xpc_object_t v12 = +[ICDefaults standardDefaults];
  unsigned __int8 v13 = [v12 bypassBagSanityChecks];

  if ((v13 & 1) == 0 && v11 < XPC_ACTIVITY_INTERVAL_1_DAY)
  {
    v14 = os_log_create("com.apple.amp.itunescloudd", "BackgroundTasks");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 134218240;
      id v17 = self;
      __int16 v18 = 2048;
      int64_t v19 = XPC_ACTIVITY_INTERVAL_1_DAY;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "ICDBackgroundTaskManager %p - startPeriodicPolling -  Adjusting bag refresh interval of %lldmin --> 7 days", (uint8_t *)&v16, 0x16u);
    }

    int64_t v11 = XPC_ACTIVITY_INTERVAL_1_DAY;
  }

  return v11;
}

- (BOOL)_cellularDataAllowed
{
  v2 = +[ICCloudAvailabilityController sharedController];
  unsigned int v3 = [v2 isCellularDataRestrictedForMusic];

  if (!v3) {
    return 1;
  }
  v4 = +[ICCloudAvailabilityController sharedController];
  unsigned __int8 v5 = [v4 isCellularDataRestrictedForVideos];

  return v5 ^ 1;
}

- (id)activityCriteriaForTask:(id)a3 startTimeInSeconds:(int64_t)a4
{
  id v6 = a3;
  if ((unint64_t)[v6 type] > 1)
  {
    id v7 = 0;
  }
  else
  {
    id v7 = [(ICDBackgroundTaskManager *)self _deferredPushActivityCriteriaForTask:v6 startTime:a4 gracePeriod:[(ICDBackgroundTaskManager *)self _deferredPushGracePeriodSeconds]];
  }

  return v7;
}

- (void)_handleTask:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [v8 type];
  if (v7 == (id)1)
  {
    [(ICDBackgroundTaskManager *)self _handleJaliscoDeferredPushUpdateTask:v8 completion:v6];
  }
  else if (!v7)
  {
    [(ICDBackgroundTaskManager *)self _handleSagaDeferredPushUpdateTask:v8 completion:v6];
  }
}

- (id)_taskWithName:(id)a3
{
  id v5 = a3;
  id v6 = [(ICDBackgroundTaskManager *)self currentTasks];
  objc_sync_enter(v6);
  id v7 = [(ICDBackgroundTaskManager *)self currentTasks];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001313A8;
  v13[3] = &unk_1001BF288;
  id v8 = v5;
  id v14 = v8;
  id v9 = [v7 objectsPassingTest:v13];

  objc_sync_exit(v6);
  if ((unint64_t)[v9 count] >= 2)
  {
    xpc_object_t v12 = +[NSAssertionHandler currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"ICDBackgroundTaskManager.m" lineNumber:277 description:@"More tasks than expected have the same name"];
  }
  CFStringRef v10 = [v9 anyObject];

  return v10;
}

- (void)_unscheduleTask:(id)a3
{
  id v4 = a3;
  id v5 = os_log_create("com.apple.amp.itunescloudd", "BackgroundTasks");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v4 name];
    id v7 = (void *)v6;
    CFStringRef v8 = @"no-name";
    if (v6) {
      CFStringRef v8 = (const __CFString *)v6;
    }
    int v10 = 134218242;
    int64_t v11 = self;
    __int16 v12 = 2112;
    CFStringRef v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "ICDBackgroundTaskManager %p - Unregistering task: %@", (uint8_t *)&v10, 0x16u);
  }
  id v9 = [v4 name];
  xpc_activity_unregister((const char *)[v9 UTF8String]);
}

- (void)_scheduleTask:(id)a3 withStartTime:(int64_t)a4
{
  id v6 = a3;
  id v7 = [v6 name];
  CFStringRef v8 = os_log_create("com.apple.amp.itunescloudd", "BackgroundTasks");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218242;
    int64_t v19 = self;
    __int16 v20 = 2112;
    CFStringRef v21 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "ICDBackgroundTaskManager %p - scheduleTask - taskName=%@", buf, 0x16u);
  }

  id v9 = [(ICDBackgroundTaskManager *)self activityCriteriaForTask:v6 startTimeInSeconds:a4];
  objc_initWeak((id *)buf, self);
  id v10 = v7;
  int64_t v11 = (const char *)[v10 UTF8String];
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1001316F0;
  handler[3] = &unk_1001BF260;
  objc_copyWeak(&v17, (id *)buf);
  id v12 = v10;
  id v15 = v12;
  id v13 = v6;
  id v16 = v13;
  xpc_activity_register(v11, v9, handler);

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);
}

- (void)_stopTask:(id)a3
{
  id v6 = a3;
  id v4 = [(ICDBackgroundTaskManager *)self currentTasks];
  objc_sync_enter(v4);
  id v5 = [(ICDBackgroundTaskManager *)self currentTasks];
  [v5 removeObject:v6];

  [(ICDBackgroundTaskManager *)self _saveCurrentTasks];
  objc_sync_exit(v4);

  [(ICDBackgroundTaskManager *)self _unscheduleTask:v6];
}

- (void)_startTask:(id)a3
{
  id v6 = a3;
  id v4 = [(ICDBackgroundTaskManager *)self currentTasks];
  objc_sync_enter(v4);
  id v5 = [(ICDBackgroundTaskManager *)self currentTasks];
  [v5 addObject:v6];

  [(ICDBackgroundTaskManager *)self _saveCurrentTasks];
  objc_sync_exit(v4);

  if ((unint64_t)[v6 type] < 2) {
    [(ICDBackgroundTaskManager *)self _scheduleTask:v6 withStartTime:XPC_ACTIVITY_INTERVAL_1_MIN];
  }
}

- (void)_saveCurrentTasks
{
  unsigned int v3 = [(ICDBackgroundTaskManager *)self currentTasks];
  id v4 = [v3 copy];
  id v12 = 0;
  id v5 = +[NSKeyedArchiver archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v12];
  id v6 = v12;

  id v7 = os_log_create("com.apple.amp.itunescloudd", "BackgroundTasks");
  CFStringRef v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      id v14 = self;
      __int16 v15 = 2114;
      id v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "ICDBackgroundTaskManager %p - _saveCurrentTasks - Saving current tasks failed - error=%{public}@", buf, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      id v9 = [(ICDBackgroundTaskManager *)self currentTasks];
      id v10 = [v9 count];
      int64_t v11 = [(ICDBackgroundTaskManager *)self currentTasks];
      *(_DWORD *)buf = 134218498;
      id v14 = self;
      __int16 v15 = 2048;
      id v16 = v10;
      __int16 v17 = 2112;
      __int16 v18 = v11;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "ICDBackgroundTaskManager %p - _saveCurrentTasks - State saved [%lu tasks] - tasks=%@", buf, 0x20u);
    }
    CFStringRef v8 = +[ICDDefaults daemonDefaults];
    [v8 setPendingBackgroundTasksData:v5];
  }
}

- (void)_restoreCurrentTasks
{
  unsigned int v3 = +[ICDDefaults daemonDefaults];
  id v4 = [v3 pendingBackgroundTasksData];

  if (v4)
  {
    uint64_t v5 = objc_opt_class();
    id v6 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v5, objc_opt_class(), 0);
    id v13 = 0;
    id v7 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v6 fromData:v4 error:&v13];
    CFStringRef v8 = v13;
    id v9 = os_log_create("com.apple.amp.itunescloudd", "BackgroundTasks");
    currentTasks = (NSMutableSet *)v9;
    if (v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218242;
        __int16 v15 = self;
        __int16 v16 = 2114;
        __int16 v17 = v8;
        _os_log_impl((void *)&_mh_execute_header, &currentTasks->super.super, OS_LOG_TYPE_ERROR, "ICDBackgroundTaskManager %p - _restoreCurrentTasks - Restoring current tasks failed - error=%{public}@", buf, 0x16u);
      }
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        int64_t v11 = [v7 count];
        *(_DWORD *)buf = 134218498;
        __int16 v15 = self;
        __int16 v16 = 2048;
        __int16 v17 = v11;
        __int16 v18 = 2112;
        int64_t v19 = v7;
        _os_log_impl((void *)&_mh_execute_header, &currentTasks->super.super, OS_LOG_TYPE_DEBUG, "ICDBackgroundTaskManager %p - _restoreCurrentTasks - State restored [%lu tasks] - tasks=%@", buf, 0x20u);
      }

      id v12 = (NSMutableSet *)[v7 mutableCopy];
      currentTasks = self->_currentTasks;
      self->_currentTasks = v12;
    }
  }
  else
  {
    CFStringRef v8 = os_log_create("com.apple.amp.itunescloudd", "BackgroundTasks");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      __int16 v15 = self;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "ICDBackgroundTaskManager %p - _restoreCurrentTasks - No state to restore", buf, 0xCu);
    }
  }
}

- (void)scheduleTaskOfType:(int64_t)a3 forConfiguration:(id)a4
{
  uint64_t v5 = +[_ICDBackgroundTask taskWithType:a3 configuration:a4];
  id v6 = os_log_create("com.apple.amp.itunescloudd", "BackgroundTasks");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v5 name];
    CFStringRef v8 = [(ICDBackgroundTaskManager *)self currentTasks];
    int v13 = 134218498;
    id v14 = self;
    __int16 v15 = 2114;
    __int16 v16 = v7;
    __int16 v17 = 2112;
    __int16 v18 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "ICDBackgroundTaskManager %p - scheduleTaskOfType:forConfiguration: - newTask=%{public}@ - currentTasks=%@", (uint8_t *)&v13, 0x20u);
  }
  id v9 = [v5 name];
  id v10 = [(ICDBackgroundTaskManager *)self _taskWithName:v9];

  if (v10)
  {
    int64_t v11 = os_log_create("com.apple.amp.itunescloudd", "BackgroundTasks");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [v5 name];
      int v13 = 134218242;
      id v14 = self;
      __int16 v15 = 2114;
      __int16 v16 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "ICDBackgroundTaskManager %p - scheduleTaskOfType:forConfiguration: - Task already on-going [%{public}@]", (uint8_t *)&v13, 0x16u);
    }
  }
  else
  {
    [(ICDBackgroundTaskManager *)self _startTask:v5];
  }
}

- (void)startPeriodicPolling
{
  unsigned int v3 = os_log_create("com.apple.amp.itunescloudd", "BackgroundTasks");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    int v13 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "ICDBackgroundTaskManager %p - startPeriodicPolling", buf, 0xCu);
  }

  id v4 = [objc_alloc((Class)MSVXPCTransaction) initWithName:@"ICDBackgroundTaskManager - Polling setup - LoadBag"];
  [v4 beginTransaction];
  id v5 = objc_alloc((Class)ICStoreRequestContext);
  id v6 = +[ICUserIdentity activeAccount];
  id v7 = [v5 initWithIdentity:v6];

  CFStringRef v8 = +[ICURLBagProvider sharedBagProvider];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10013237C;
  v10[3] = &unk_1001BF210;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  [v8 getBagForRequestContext:v7 withCompletionHandler:v10];
}

- (ICDBackgroundTaskManager)initWithAccountManager:(id)a3 handlerCoordinator:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ICDBackgroundTaskManager;
  id v9 = [(ICDBackgroundTaskManager *)&v14 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_handlerCoordinator, a4);
    objc_storeStrong((id *)&v10->_accountManager, a3);
    id v11 = (NSMutableSet *)[objc_alloc((Class)NSMutableSet) initWithCapacity:7];
    currentTasks = v10->_currentTasks;
    v10->_currentTasks = v11;

    [(ICDBackgroundTaskManager *)v10 _restoreCurrentTasks];
  }

  return v10;
}

@end