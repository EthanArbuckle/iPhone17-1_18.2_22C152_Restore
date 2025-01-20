@interface CloudBackgroundTaskManager
+ (id)sharedTaskManager;
- (BOOL)_cellularDataAllowedForJaliscoApps;
- (BOOL)_cellularDataAllowedForJaliscoMedia;
- (CloudBackgroundTaskManager)init;
- (double)_throttledDeferredEvaluateKeepLocalTime;
- (id)_baseBtaJobForDeferredPush;
- (id)_baseBtaJobForPeriodicPollCellularDataAllowed:(BOOL)a3;
- (id)_homeSharingPrefsNumberForKey:(id)a3;
- (id)_nextEvaluateSyncRulesOperationTimeKey;
- (id)_nextEvaluateSyncRulesThrottleOperationTimeKey;
- (id)_nextJaliscoAppsPollTimeKey;
- (id)_nextJaliscoMediaPollTimeKey;
- (void)_handleJaliscoMediaDeferredPushUpdateJobSatisfied:(BOOL)a3 invalidRequest:(BOOL)a4;
- (void)_handleJaliscoMediaPeriodicPollJobSatisfied:(BOOL)a3 invalidRequest:(BOOL)a4;
- (void)_handleJobNamed:(const char *)a3 satisfied:(BOOL)a4 invalid:(BOOL)a5;
- (void)_handleSagaDeferredPushUpdateJobSatisfied:(BOOL)a3 invalidRequest:(BOOL)a4;
- (void)_initializeBTAHandlers;
- (void)_scheduleJobNamed:(const char *)a3 withStartTime:(id)a4 baseBtaJob:(id)a5;
- (void)_setHomeSharingPrefsNumber:(id)a3 forKey:(id)a4;
- (void)_unscheduleJobNamed:(const char *)a3;
- (void)scheduleJaliscoMediaDeferredPushUpate;
- (void)scheduleJaliscoMediaPeriodicPoll;
- (void)scheduleSagaDeferredPushUpate;
- (void)unscheduleJaliscoMediaDeferredPushUpate;
- (void)unscheduleJaliscoMediaPeriodicPoll;
- (void)unscheduleSagaDeferredPushUpate;
@end

@implementation CloudBackgroundTaskManager

- (void).cxx_destruct
{
}

- (BOOL)_cellularDataAllowedForJaliscoMedia
{
  v2 = +[ICCloudAvailabilityController sharedController];
  unsigned int v3 = [v2 isCellularDataRestrictedForVideos];

  if (!v3) {
    return 1;
  }
  v4 = +[ICCloudAvailabilityController sharedController];
  unsigned __int8 v5 = [v4 isCellularDataRestrictedForMusic];

  return v5 ^ 1;
}

- (BOOL)_cellularDataAllowedForJaliscoApps
{
  v2 = +[ICCloudAvailabilityController sharedController];
  char v3 = [v2 isCellularDataRestrictedForStoreApps] ^ 1;

  return v3;
}

- (id)_nextJaliscoAppsPollTimeKey
{
  return @"NextJaliscoAppsPeriodicPollTime";
}

- (id)_nextJaliscoMediaPollTimeKey
{
  return @"NextJaliscoLibraryPeriodicPollTime";
}

- (id)_nextEvaluateSyncRulesThrottleOperationTimeKey
{
  return @"NextEvaluateSyncRulesThrottleOperationTime";
}

- (id)_nextEvaluateSyncRulesOperationTimeKey
{
  return @"NextEvaluateSyncRulesOperationTime";
}

- (double)_throttledDeferredEvaluateKeepLocalTime
{
  char v3 = [(CloudBackgroundTaskManager *)self _nextEvaluateSyncRulesThrottleOperationTimeKey];
  v4 = [(CloudBackgroundTaskManager *)self _homeSharingPrefsNumberForKey:v3];

  if (v4)
  {
    [v4 doubleValue];
    double v6 = v5;
  }
  else
  {
    v7 = +[NSDate date];
    [v7 timeIntervalSinceReferenceDate];
    double v6 = v8;
  }
  return v6;
}

- (id)_homeSharingPrefsNumberForKey:(id)a3
{
  char v3 = (void *)CFPreferencesCopyAppValue((CFStringRef)a3, @"com.apple.homesharing");

  return v3;
}

- (void)_setHomeSharingPrefsNumber:(id)a3 forKey:(id)a4
{
  CFPreferencesSetAppValue((CFStringRef)a4, a3, @"com.apple.homesharing");

  CFPreferencesAppSynchronize(@"com.apple.homesharing");
}

- (id)_baseBtaJobForPeriodicPollCellularDataAllowed:(BOOL)a3
{
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v4, kBackgroundTaskAgentNetworkRequired, 1);
  xpc_dictionary_set_BOOL(v4, kBackgroundTaskAgentCellularAllowed, a3);
  xpc_dictionary_set_int64(v4, kBackgroundTaskAgentPowerPluggedinTime, 0);

  return v4;
}

- (id)_baseBtaJobForDeferredPush
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v2, kBackgroundTaskAgentNetworkRequired, 1);
  xpc_dictionary_set_BOOL(v2, kBackgroundTaskAgentCellularAllowed, 0);

  return v2;
}

- (void)_handleJobNamed:(const char *)a3 satisfied:(BOOL)a4 invalid:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  v9 = (const char *)NSMapGet(self->_jobNameToSelectorMap, +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:"));
  if (v9)
  {
    objc_msgSend(self, v9, v6, v5);
  }
  else
  {
    v10 = os_log_create("com.apple.amp.itunescloudd", "XPC");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136446210;
      v12 = a3;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "No handler for BTA job named: %{public}s", (uint8_t *)&v11, 0xCu);
    }

    [(CloudBackgroundTaskManager *)self _unscheduleJobNamed:a3];
  }
}

- (void)_unscheduleJobNamed:(const char *)a3
{
  xpc_object_t v4 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v5 = "no-name";
    if (a3) {
      BOOL v5 = a3;
    }
    int v6 = 136446210;
    v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Removing Job: %{public}s", (uint8_t *)&v6, 0xCu);
  }

  BackgroundTaskAgentRemoveJob();
}

- (void)_scheduleJobNamed:(const char *)a3 withStartTime:(id)a4 baseBtaJob:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = +[NSDate date];
  [v9 timeIntervalSinceReferenceDate];
  double v11 = v10;

  if (v7)
  {
    [v7 doubleValue];
    if (v11 < v12) {
      double v11 = v12;
    }
  }
  else
  {
    double v11 = v11 + 3600.0;
  }
  xpc_dictionary_set_double(v8, kBackgroundTaskAgentJobWindowStartTime, v11);
  xpc_dictionary_set_double(v8, kBackgroundTaskAgentJobWindowEndTime, v11 + 604800.0);
  v13 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = "no-name";
    if (a3) {
      v14 = a3;
    }
    int v15 = 136446466;
    v16 = v14;
    __int16 v17 = 2048;
    double v18 = v11;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Add Job: %{public}s -- Start time: %0.2f", (uint8_t *)&v15, 0x16u);
  }

  BackgroundTaskAgentAddJob();
}

- (void)_initializeBTAHandlers
{
  char v3 = (NSMapTable *)[objc_alloc((Class)NSMapTable) initWithKeyOptions:0 valueOptions:258 capacity:7];
  jobNameToSelectorMap = self->_jobNameToSelectorMap;
  self->_jobNameToSelectorMap = v3;

  NSMapInsert(self->_jobNameToSelectorMap, @"com.apple.itunescloudd.deferredPushUpdate.saga", "_handleSagaDeferredPushUpdateJobSatisfied:invalidRequest:");
  NSMapInsert(self->_jobNameToSelectorMap, @"com.apple.itunescloudd.periodicPoll.jaliscoMedia", "_handleJaliscoMediaPeriodicPollJobSatisfied:invalidRequest:");
  NSMapInsert(self->_jobNameToSelectorMap, @"com.apple.itunescloudd.deferredPushUpdate.jaliscoMedia", "_handleJaliscoMediaDeferredPushUpdateJobSatisfied:invalidRequest:");
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10010A424;
  v6[3] = &unk_1001BE430;
  v6[4] = self;
  BOOL v5 = objc_retainBlock(v6);
  BackgroundTaskAgentInit();
}

- (void)_handleJaliscoMediaDeferredPushUpdateJobSatisfied:(BOOL)a3 invalidRequest:(BOOL)a4
{
  BOOL v4 = a3;
  int v6 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Job Fired: JaliscoMediaDeferredPushUpate (satisfied = %d)", buf, 8u);
  }

  if (v4)
  {
    id v7 = objc_alloc_init((Class)ICConnectionConfiguration);
    id v8 = +[BaseRequestHandler handlerForConfiguration:v7];
    v9 = [v7 clientIdentity];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10010A8E0;
    v12[3] = &unk_1001BE408;
    v12[4] = self;
    [v8 updateJaliscoLibraryWithClientIdentity:v9 forReason:1000 completionHandler:v12];
  }
  else
  {
    double v10 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Jalisco media deferred push update job was not satisfied, trying again in an hour.", buf, 2u);
    }

    id v7 = +[NSDate date];
    [v7 timeIntervalSinceReferenceDate];
    id v8 = +[NSNumber numberWithDouble:v11 + 3600.0];
    v9 = [(CloudBackgroundTaskManager *)self _baseBtaJobForDeferredPush];
    [(CloudBackgroundTaskManager *)self _scheduleJobNamed:"com.apple.itunescloudd.deferredPushUpdate.jaliscoMedia" withStartTime:v8 baseBtaJob:v9];
  }
}

- (void)_handleJaliscoMediaPeriodicPollJobSatisfied:(BOOL)a3 invalidRequest:(BOOL)a4
{
  BOOL v4 = a3;
  int v6 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Job Fired: JaliscoMediaPeriodicPoll (satisfied = %d)", buf, 8u);
  }

  if (v4)
  {
    id v7 = objc_alloc_init((Class)ICConnectionConfiguration);
    id v8 = +[BaseRequestHandler handlerForConfiguration:v7];
    v9 = MSVTCCIdentityForCurrentProcess();
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10010AC7C;
    v15[3] = &unk_1001BE408;
    v15[4] = self;
    [v8 updateJaliscoLibraryWithClientIdentity:v9 forReason:4 completionHandler:v15];
  }
  else
  {
    double v10 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Jalisco media periodic poll update job was not satisfied, trying again tomorrow.", buf, 2u);
    }

    id v11 = objc_alloc((Class)NSNumber);
    double v12 = +[NSDate date];
    [v12 timeIntervalSinceReferenceDate];
    id v7 = [v11 initWithDouble:v13 + 86400.0];

    BOOL v14 = [(CloudBackgroundTaskManager *)self _nextJaliscoMediaPollTimeKey];
    [(CloudBackgroundTaskManager *)self _setHomeSharingPrefsNumber:v7 forKey:v14];

    id v8 = [(CloudBackgroundTaskManager *)self _baseBtaJobForPeriodicPollCellularDataAllowed:[(CloudBackgroundTaskManager *)self _cellularDataAllowedForJaliscoMedia]];
    [(CloudBackgroundTaskManager *)self _scheduleJobNamed:"com.apple.itunescloudd.periodicPoll.jaliscoMedia" withStartTime:v7 baseBtaJob:v8];
  }
}

- (void)_handleSagaDeferredPushUpdateJobSatisfied:(BOOL)a3 invalidRequest:(BOOL)a4
{
  BOOL v4 = a3;
  int v6 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Job Fired: SagaDeferredPushUpate (satisfied = %d)", buf, 8u);
  }

  if (v4)
  {
    id v7 = objc_alloc_init((Class)ICConnectionConfiguration);
    id v8 = +[BaseRequestHandler handlerForConfiguration:v7];
    v9 = MSVTCCIdentityForCurrentProcess();
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10010B298;
    v12[3] = &unk_1001BE408;
    v12[4] = self;
    [v8 updateSagaLibraryWithClientIdentity:v9 forReason:1000 allowNoisyAuthPrompt:0 isExplicitUserAction:0 completionHandler:v12];
  }
  else
  {
    double v10 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Saga deferred push update job not satisfied, trying again in an hour.", buf, 2u);
    }

    id v7 = +[NSDate date];
    [v7 timeIntervalSinceReferenceDate];
    id v8 = +[NSNumber numberWithDouble:v11 + 3600.0];
    v9 = [(CloudBackgroundTaskManager *)self _baseBtaJobForDeferredPush];
    [(CloudBackgroundTaskManager *)self _scheduleJobNamed:"com.apple.itunescloudd.deferredPushUpdate.saga" withStartTime:v8 baseBtaJob:v9];
  }
}

- (void)unscheduleJaliscoMediaDeferredPushUpate
{
}

- (void)scheduleJaliscoMediaDeferredPushUpate
{
  id v5 = +[NSDate date];
  [v5 timeIntervalSinceReferenceDate];
  char v3 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  BOOL v4 = [(CloudBackgroundTaskManager *)self _baseBtaJobForDeferredPush];
  [(CloudBackgroundTaskManager *)self _scheduleJobNamed:"com.apple.itunescloudd.deferredPushUpdate.jaliscoMedia" withStartTime:v3 baseBtaJob:v4];
}

- (void)unscheduleJaliscoMediaPeriodicPoll
{
}

- (void)scheduleJaliscoMediaPeriodicPoll
{
  id v5 = [(CloudBackgroundTaskManager *)self _nextJaliscoMediaPollTimeKey];
  char v3 = [(CloudBackgroundTaskManager *)self _homeSharingPrefsNumberForKey:v5];
  BOOL v4 = [(CloudBackgroundTaskManager *)self _baseBtaJobForPeriodicPollCellularDataAllowed:[(CloudBackgroundTaskManager *)self _cellularDataAllowedForJaliscoMedia]];
  [(CloudBackgroundTaskManager *)self _scheduleJobNamed:"com.apple.itunescloudd.periodicPoll.jaliscoMedia" withStartTime:v3 baseBtaJob:v4];
}

- (void)unscheduleSagaDeferredPushUpate
{
}

- (void)scheduleSagaDeferredPushUpate
{
  id v5 = +[NSDate date];
  [v5 timeIntervalSinceReferenceDate];
  char v3 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  BOOL v4 = [(CloudBackgroundTaskManager *)self _baseBtaJobForDeferredPush];
  [(CloudBackgroundTaskManager *)self _scheduleJobNamed:"com.apple.itunescloudd.deferredPushUpdate.saga" withStartTime:v3 baseBtaJob:v4];
}

- (CloudBackgroundTaskManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)CloudBackgroundTaskManager;
  xpc_object_t v2 = [(CloudBackgroundTaskManager *)&v5 init];
  char v3 = v2;
  if (v2) {
    [(CloudBackgroundTaskManager *)v2 _initializeBTAHandlers];
  }
  return v3;
}

+ (id)sharedTaskManager
{
  if (qword_1001F3A60 != -1) {
    dispatch_once(&qword_1001F3A60, &stru_1001BE3E0);
  }
  xpc_object_t v2 = (void *)qword_1001F3A58;

  return v2;
}

@end