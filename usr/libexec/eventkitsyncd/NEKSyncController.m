@interface NEKSyncController
- (BOOL)_canUseDataTransfer;
- (BOOL)_clearToDeltaSync;
- (BOOL)_shouldFakeFailure;
- (BOOL)isCurrentlySyncing;
- (BOOL)isPerformingBackupResetSync;
- (BOOL)service:(id)a3 startSession:(id)a4 error:(id *)a5;
- (NEKStore)eventStore;
- (NEKStore)reminderStore;
- (NEKSyncController)initWithEnvironment:(id)a3;
- (NEKSyncControllerDelegate)delegate;
- (char)activityIdentifier:(id)a3;
- (char)activitySubsystem:(id)a3;
- (double)_fullSessionTimeout;
- (double)_nextDelay:(int64_t)a3;
- (double)getFailureProbablity;
- (double)getFixedRetryInternal;
- (double)getMaximumSessionTimeout;
- (double)getMinimumSessionTimeout;
- (id)environment;
- (id)service:(id)a3 willPreferSession:(id)a4 overSession:(id)a5;
- (int64_t)_faultCount;
- (int64_t)maxDeltaRetries;
- (void)_deleteSYObject:(id)a3 eventStore:(id)a4 reminderStore:(id)a5;
- (void)_recvSessionEnded:(id)a3 error:(id)a4;
- (void)_retrySession:(id)a3;
- (void)_retrySync;
- (void)_sendSessionEnded:(id)a3 error:(id)a4;
- (void)_setClipping:(id)a3;
- (void)_setFaultCount:(int64_t)a3;
- (void)_startRecvSession:(id)a3 results:(StartSessionResults *)a4;
- (void)_startSendSession:(id)a3 results:(StartSessionResults *)a4;
- (void)activityDefer:(id)a3;
- (void)activityRun:(id)a3;
- (void)bumpFaultsAndScheduleRetry;
- (void)changeObserverDidObserveChanges:(id)a3;
- (void)changeObserverDidObserveTruncation:(id)a3;
- (void)clearRemoteBuildVersion;
- (void)clearRetryState;
- (void)createOrUpdateSYObject:(id)a3 eventStore:(id)a4 reminderStore:(id)a5 session:(id)a6;
- (void)deleteSYObject:(id)a3 eventStore:(id)a4 reminderStore:(id)a5;
- (void)prepDatabasesForResetSync;
- (void)recordSuccessForSession:(id)a3 receiving:(BOOL)a4;
- (void)scheduleRetry;
- (void)service:(id)a3 sessionEnded:(id)a4 error:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setIsPerformingBackupResetSync:(BOOL)a3;
- (void)setNeedsFullSync;
- (void)setNeedsMigrationSync;
- (void)setNeedsNightlySync;
- (void)setNeedsReunionSync;
- (void)start;
- (void)tc_advanceChangeNumber;
- (void)tc_requestDelta;
- (void)tc_setAutomaticSync:(BOOL)a3;
- (void)tc_setFailureProbablity:(double)a3;
- (void)tc_setFixedRetryInternal:(double)a3;
- (void)tc_setMaximumSessionTimeout:(double)a3;
- (void)tc_setMinimumSessionTimeout:(double)a3;
- (void)tc_setNominal;
- (void)tc_setObjectDelay:(double)a3;
- (void)tc_status:(id)a3;
@end

@implementation NEKSyncController

- (NEKSyncController)initWithEnvironment:(id)a3
{
  id v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)NEKSyncController;
  v5 = [(NEKSyncController *)&v41 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_environment, v4);
    v6->_syServiceLock._os_unfair_lock_opaque = 0;
    uint64_t v7 = sub_100006A20("NEK.sessionIdle");
    sessionIdleQueue = v6->_sessionIdleQueue;
    v6->_sessionIdleQueue = (OS_dispatch_queue *)v7;

    v9 = [(NEKSyncController *)v6 environment];
    uint64_t v10 = +[NEKStore storeForEventWithEnvironment:v9];
    eventStore = v6->_eventStore;
    v6->_eventStore = (NEKStore *)v10;

    if ([v4 isReminderKitEnabled])
    {
      v12 = [(NEKSyncController *)v6 environment];
      uint64_t v13 = +[NEKStore storeForReminderWithEnvironment:v12];
      reminderStore = v6->_reminderStore;
      v6->_reminderStore = (NEKStore *)v13;
    }
    else
    {
      v12 = v6->_reminderStore;
      v6->_reminderStore = 0;
    }

    v15 = [[NEKStatTracker alloc] initWithEnvironment:v4 name:@"resetSync" defaultMean:600.0 defaultStddev:20.0];
    resetTimeoutTracker = v6->_resetTimeoutTracker;
    v6->_resetTimeoutTracker = v15;

    v17 = [[NEKStatTracker alloc] initWithEnvironment:v4 name:@"deltaSync" defaultMean:300.0 defaultStddev:20.0];
    deltaTimeoutTracker = v6->_deltaTimeoutTracker;
    v6->_deltaTimeoutTracker = v17;

    v19 = [[NEKStatTracker alloc] initWithEnvironment:v4 name:@"nightlySync" defaultMean:300.0 defaultStddev:20.0];
    nightlyTimeoutTracker = v6->_nightlyTimeoutTracker;
    v6->_nightlyTimeoutTracker = v19;

    [(NEKStatTracker *)v6->_resetTimeoutTracker load];
    [(NEKStatTracker *)v6->_deltaTimeoutTracker load];
    [(NEKStatTracker *)v6->_nightlyTimeoutTracker load];
    [(NEKSyncController *)v6 _setClipping:v6->_resetTimeoutTracker];
    [(NEKSyncController *)v6 _setClipping:v6->_deltaTimeoutTracker];
    [(NEKSyncController *)v6 _setClipping:v6->_nightlyTimeoutTracker];
    v6->_isNightlySync = 0;
    v21 = [(NEKStore *)v6->_eventStore changeObserver];
    [v21 setDelegate:v6];

    v22 = [(NEKStore *)v6->_reminderStore changeObserver];
    [v22 setDelegate:v6];

    v23 = [NEKRPCEndpoint alloc];
    id v24 = [v4 isReminderKitEnabled];
    v25 = [v4 clientName];
    v26 = [(NEKRPCEndpoint *)v23 initWithReminderKitEnabled:v24 clientName:v25];
    rpcEndpoint = v6->_rpcEndpoint;
    v6->_rpcEndpoint = v26;

    v28 = [[NEKTestControl alloc] initWithEnvironment:v4];
    testingControl = v6->_testingControl;
    v6->_testingControl = v28;

    LODWORD(v24) = [v4 isReminderKitEnabled];
    v30 = *(NSObject **)(qword_1000C6CA8 + 8);
    BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
    if (v24)
    {
      if (v31)
      {
        *(_WORD *)v40 = 0;
        v32 = "ReminderKit enabled.";
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, v32, v40, 2u);
      }
    }
    else if (v31)
    {
      *(_WORD *)v40 = 0;
      v32 = "ReminderKit disabled.";
      goto LABEL_10;
    }
    v33 = [[NEKAnalyticsDriver alloc] initWithSyncController:v6];
    analyticsDriver = v6->_analyticsDriver;
    v6->_analyticsDriver = v33;

    v35 = [[NDTActivity alloc] initWithDelegate:v6];
    activity = v6->_activity;
    v6->_activity = v35;

    v37 = [[NEKServicesServer alloc] initWithEnvironment:v4];
    servicesServer = v6->_servicesServer;
    v6->_servicesServer = v37;
  }
  return v6;
}

- (void)_setClipping:(id)a3
{
  id v8 = a3;
  [(NEKSyncController *)self getMinimumSessionTimeout];
  double v5 = v4;
  [(NEKSyncController *)self getMaximumSessionTimeout];
  double v7 = v6;
  [v8 setMinTimeout:v5];
  [v8 setMaxTimeout:v7];
}

- (BOOL)_canUseDataTransfer
{
  v2 = +[SYDevice targetableDevice];
  v3 = [v2 systemBuildVersion];

  double v4 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Remote system build version: %{public}@", (uint8_t *)&v8, 0xCu);
  }
  double v5 = +[NEKCapabilities instance];
  unsigned __int8 v6 = [v5 canUseDataTransfer];

  return v6;
}

- (void)start
{
  p_syServiceLock = &self->_syServiceLock;
  os_unfair_lock_lock(&self->_syServiceLock);
  if (!self->_queue)
  {
    sub_100006A20("NEK.SYService");
    double v4 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
    queue = self->_queue;
    self->_queue = v4;

    unsigned __int8 v6 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      double v7 = self->_queue;
      *(_DWORD *)buf = 134217984;
      v34 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "New NEK.SYService queue: %p", buf, 0xCu);
    }
  }
  if (self->_syncService)
  {
    int v8 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      syncService = self->_syncService;
      *(_DWORD *)buf = 134217984;
      v34 = syncService;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Shutting down existing SYService: %p", buf, 0xCu);
    }
    uint64_t v10 = self->_syncService;
    self->_syncService = 0;
  }
  uint64_t v31 = SYServiceOptionDiskBufferProtectionClass;
  v32 = &off_1000AF230;
  v11 = +[NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
  v12 = (SYService *)[objc_alloc((Class)SYService) initWithService:@"com.apple.private.alloy.eventkitsync" priority:0 qos:21 asMasterStore:1 options:v11];
  uint64_t v13 = self->_syncService;
  self->_syncService = v12;

  uint64_t v29 = IDSSendMessageOptionAllowCloudDeliveryKey;
  v30 = &__kCFBooleanTrue;
  v14 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
  [(SYService *)self->_syncService setOptions:v14];

  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"internal_forceFileTransfer", @"com.apple.EventKitSync", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat && AppBooleanValue
    || (+[NEKCapabilities instance],
        v16 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v17 = [v16 canUseDataTransfer],
        v16,
        (v17 & 1) == 0))
  {
    v20 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Selecting file transfer engine", buf, 2u);
    }
    [(SYService *)self->_syncService setEngineType:2];
    BOOL v19 = 0;
  }
  else
  {
    v18 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Selecting data messaging engine", buf, 2u);
    }
    [(SYService *)self->_syncService setSendingBufferCap:0x10000];
    BOOL v19 = 1;
  }
  self->_wasUsingDataTransfer = v19;
  [(SYService *)self->_syncService setDelegate:self queue:self->_queue];
  v21 = self->_syncService;
  id v27 = 0;
  unsigned __int8 v22 = [(SYService *)v21 resume:&v27];
  id v23 = v27;
  id v24 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (v22)
  {
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = self->_syncService;
      *(_DWORD *)buf = 134217984;
      v34 = v25;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Started new SYService: %p", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    sub_10006EED4((uint64_t)v23, v24);
  }
  os_unfair_lock_unlock(p_syServiceLock);
  v26 = [(NEKSyncController *)self environment];
  [v26 syncCoordinator];

  [(NEKSyncController *)self setNeedsMigrationSync];
}

- (id)environment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);

  return WeakRetained;
}

- (void)setNeedsFullSync
{
  v3 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned __int8 v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Enqueueing a full sync", v6, 2u);
  }
  double v4 = [(NEKSyncController *)self environment];
  double v5 = [v4 tinyStore];

  [v5 setIntegerValue:1 forKey:@"RetryMustBeReset"];
  [(SYService *)self->_syncService setNeedsResetSync];
}

- (void)setNeedsReunionSync
{
  int64_t v3 = [(NEKSyncController *)self _faultCount];
  int64_t v4 = [(NEKSyncController *)self maxDeltaRetries];
  double v5 = *(NSObject **)(qword_1000C6CA8 + 8);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3 >= v4)
  {
    if (v6)
    {
      *(_WORD *)int v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Reunion sync with faults- Forcing full sync", v8, 2u);
    }
    [(NEKSyncController *)self setNeedsFullSync];
  }
  else
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Enqueueing a delta reunion sync", buf, 2u);
    }
    double v7 = +[NSNotificationCenter defaultCenter];
    [v7 postNotificationName:@"NEKDatabaseChangedExternallyNotification" object:self];
  }
}

- (void)setNeedsNightlySync
{
  if ([(NEKSyncController *)self _faultCount])
  {
    int64_t v3 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Nightly sync requested but we have faults. Ignoring request.", v5, 2u);
    }
  }
  else
  {
    self->_isNightlySync = 1;
    int64_t v4 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Poking CS for nightly sync", buf, 2u);
    }
    [(SYService *)self->_syncService setHasChangesAvailable];
  }
}

- (void)setNeedsMigrationSync
{
  int64_t v3 = [(NEKSyncController *)self environment];
  int64_t v4 = [v3 tinyStore];

  double v5 = [(NEKSyncController *)self environment];
  BOOL v6 = [v5 syncCoordinator];
  unsigned int v7 = [v6 okToPerformDeltaSync];

  if (!v7)
  {
    v12 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    __int16 v16 = 0;
    uint64_t v13 = "Migration check dropped.";
    v14 = (uint8_t *)&v16;
    v15 = v12;
LABEL_10:
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v13, v14, 2u);
    goto LABEL_11;
  }
  id v8 = [v4 getIntegerValueForKey:@"MigrationSyncCount" default:0];
  unsigned int v9 = _os_feature_enabled_impl();
  uint64_t v10 = *(NSObject **)(qword_1000C6CA8 + 8);
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if ((uint64_t)v8 >= v9)
  {
    if (!v11) {
      goto LABEL_11;
    }
    *(_WORD *)unsigned __int8 v17 = 0;
    uint64_t v13 = "Migration number is fine, no migration sync needed.";
    v14 = v17;
    v15 = v10;
    goto LABEL_10;
  }
  if (v11)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Requested migration sync", buf, 2u);
  }
  [(NEKSyncController *)self setNeedsFullSync];
LABEL_11:
}

- (void)_retrySync
{
  int64_t v3 = [(NEKSyncController *)self environment];
  int64_t v4 = [v3 tinyStore];

  uint64_t v5 = [(NEKSyncController *)self _faultCount];
  id v6 = [v4 getIntegerValueForKey:@"RetryMustBeReset" default:0];
  [v4 getDoubleValueForKey:@"deferUntil" default:-1.0];
  double v8 = v7;
  double Current = CFAbsoluteTimeGetCurrent();
  int64_t v10 = [(NEKSyncController *)self maxDeltaRetries];
  if (v6) {
    BOOL v11 = 0;
  }
  else {
    BOOL v11 = v5 < v10;
  }
  if (v11)
  {
    unsigned __int8 v17 = *(NSObject **)(qword_1000C6CA8 + 8);
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if (v5 < 1)
    {
      if (Current >= v8)
      {
        if (v18)
        {
          LOWORD(v21) = 0;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "_retrySync called but we have no faults. We're perfect!", (uint8_t *)&v21, 2u);
        }
        [(NDTActivity *)self->_activity completeAndFireNever];
      }
      else
      {
        if (v18)
        {
          LOWORD(v21) = 0;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Retrying a deferral.", (uint8_t *)&v21, 2u);
        }
        [(SYService *)self->_syncService setHasChangesAvailable];
      }
    }
    else
    {
      if (v18)
      {
        int v21 = 67109120;
        int v22 = v5;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Retrying a failed sync (%d) (delta)", (uint8_t *)&v21, 8u);
      }
      BOOL v19 = +[NSNotificationCenter defaultCenter];
      [v19 postNotificationName:@"NEKDatabaseChangedExternallyNotification" object:0];
    }
  }
  else
  {
    uint64_t v12 = [(SYService *)self->_syncService currentSession];
    if (v12
      && (uint64_t v13 = (void *)v12,
          [(SYService *)self->_syncService currentSession],
          v14 = objc_claimAutoreleasedReturnValue(),
          unsigned int v15 = [v14 isResetSync],
          v14,
          v13,
          v15))
    {
      __int16 v16 = *(NSObject **)(qword_1000C6CA8 + 8);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v21) = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Looks like I could use a reset but it turns out we're already standing right in the middle of one, so let's just move on.", (uint8_t *)&v21, 2u);
      }
    }
    else
    {
      v20 = *(NSObject **)(qword_1000C6CA8 + 8);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        int v21 = 67109120;
        int v22 = v5;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Retrying a failed sync (%d) (reset)", (uint8_t *)&v21, 8u);
      }
      [(SYService *)self->_syncService setNeedsResetSync];
    }
  }
}

- (void)createOrUpdateSYObject:(id)a3 eventStore:(id)a4 reminderStore:(id)a5 session:(id)a6
{
  id v47 = a3;
  id v46 = a4;
  id v45 = a5;
  id v48 = a6;
  int64_t v10 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v11 = v10;
    uint64_t v12 = NSStringFromSelector(a2);
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&buf, 0xCu);
  }
  v50 = [v47 objectAtIndexedSubscript:0];
  v49 = [v48 delegate];
  int64_t v13 = +[NDTPerf wallTime];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    reminderStore = self->_reminderStore;
    id v15 = v50;
    [(NEKStore *)reminderStore updateSource:v15 store:v45];
    [(NEKStore *)self->_eventStore updateSource:v15 store:v46];

    [v49 setStoreUpdateTimeNs:((char *)[NDTPerf wallTime](NDTPerf, "wallTime")+ (void)objc_msgSend(v49, "storeUpdateTimeNs")- v13)];
    goto LABEL_52;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v16 = v50;
    unsigned __int8 v17 = [v16 attributes];
    BOOL v18 = v17 == 0;

    if (v18)
    {
      if (([v16 isDefaultTaskCalendar] & 1) == 0
        && ([v16 isDefaultEventCalendar] & 1) == 0)
      {
        v44 = *(NSObject **)(qword_1000C6CA8 + 8);
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
          sub_10006EF4C(v44, v16);
        }
        goto LABEL_51;
      }
      v39 = *(NSObject **)(qword_1000C6CA8 + 8);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Attempting to set a default calendar or list", (uint8_t *)&buf, 2u);
      }
    }
    else
    {
      BOOL v19 = [v16 attributes];
      unsigned int v20 = [v19 supportedEntityTypes];

      int v21 = [(NEKSyncController *)self environment];
      unsigned __int8 v22 = [v21 isReminderKitEnabled];

      if (*(_DWORD *)&v22 & (v20 >> 1))
      {
        id v23 = *(NSObject **)(qword_1000C6CA8 + 8);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Handling task list.", (uint8_t *)&buf, 2u);
        }
        [(NEKStore *)self->_reminderStore updateCalendar:v16 store:v45];
        goto LABEL_51;
      }
      v40 = [(NEKSyncController *)self environment];
      unsigned __int8 v41 = [v40 isReminderKitEnabled];
      if (v20) {
        unsigned __int8 v42 = 0;
      }
      else {
        unsigned __int8 v42 = v41;
      }

      v43 = *(NSObject **)(qword_1000C6CA8 + 8);
      if (v42)
      {
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
          sub_10006F02C(v43, v16);
        }
        goto LABEL_51;
      }
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Handling calendar.", (uint8_t *)&buf, 2u);
      }
    }
    [(NEKStore *)self->_eventStore updateCalendar:v16 store:v46];
LABEL_51:
    [v49 setCalendarUpdateTimeNs:[NDTPerf wallTime]+[NDTPerf wallTime]-[v49 calendarUpdateTimeNs]];

    goto LABEL_52;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v24 = [(NEKSyncController *)self environment];
    unsigned __int8 v25 = [v24 isReminderKitEnabled];

    if ((v25 & 1) == 0)
    {
      [(NEKStore *)self->_eventStore updateICS:v47 store:v46 session:v48];
      [v49 setEventUpdateTimeNs:+[NDTPerf wallTime](NDTPerf, "wallTime")+[v49 eventUpdateTimeNs]-v13];
      goto LABEL_52;
    }
    v26 = +[NSMutableArray array];
    v51 = +[NSMutableArray array];
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id obj = v47;
    id v27 = [obj countByEnumeratingWithState:&v56 objects:v63 count:16];
    if (!v27) {
      goto LABEL_27;
    }
    uint64_t v28 = *(void *)v57;
    while (1)
    {
      for (i = 0; i != v27; i = (char *)i + 1)
      {
        if (*(void *)v57 != v28) {
          objc_enumerationMutation(obj);
        }
        v30 = *(void **)(*((void *)&v56 + 1) + 8 * i);
        *(void *)&long long buf = 0;
        *((void *)&buf + 1) = &buf;
        uint64_t v61 = 0x2020000000;
        uint64_t v62 = 0;
        v55[0] = _NSConcreteStackBlock;
        v55[1] = 3221225472;
        v55[2] = sub_10003F32C;
        v55[3] = &unk_1000A9978;
        v55[4] = v30;
        v55[5] = &buf;
        [v30 enumerateCalendarItemIdentifiersUsingBlock:v55];
        uint64_t v31 = [(NEKSyncController *)self environment];
        if ([v31 isReminderKitEnabled])
        {
          BOOL v32 = *(void *)(*((void *)&buf + 1) + 24) == 2;

          v33 = v51;
          if (v32) {
            goto LABEL_25;
          }
        }
        else
        {
        }
        v33 = v26;
        if (*(void *)(*((void *)&buf + 1) + 24) == 3)
        {
          v34 = *(NSObject **)(qword_1000C6CA8 + 8);
          BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);
          v33 = v26;
          if (v35)
          {
            *(_WORD *)v54 = 0;
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Assuming mixed entity NEKICSWrapper comes from EventKit", v54, 2u);
            v33 = v26;
          }
        }
LABEL_25:
        [v33 addObject:v30];
        _Block_object_dispose(&buf, 8);
      }
      id v27 = [obj countByEnumeratingWithState:&v56 objects:v63 count:16];
      if (!v27)
      {
LABEL_27:

        if ([v26 count])
        {
          int64_t v36 = +[NDTPerf wallTime];
          [(NEKStore *)self->_eventStore updateICS:v26 store:v46 session:v48];
          [v49 setEventUpdateTimeNs:([NDTPerf wallTime](NDTPerf, "wallTime")+ [v49 eventUpdateTimeNs])- v36];
        }
        if ([v51 count])
        {
          int64_t v37 = +[NDTPerf wallTime];
          [(NEKStore *)self->_reminderStore updateICS:v51 store:v45 session:v48];
          [v49 setReminderUpdateTimeNs:([NDTPerf wallTime](NDTPerf, "wallTime")+ [v49 reminderUpdateTimeNs])- v37];
        }

        goto LABEL_52;
      }
    }
  }
  v38 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
    sub_10006F124(v38);
  }
LABEL_52:
}

- (void)_deleteSYObject:(id)a3 eventStore:(id)a4 reminderStore:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v12 = *(void **)(qword_1000C6CA8 + 8);
  if (isKindOfClass)
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_DEFAULT))
    {
      int64_t v13 = v12;
      v14 = sub_10002D3E0(v8);
      int v21 = 138543362;
      unsigned __int8 v22 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Got a deletion wrapper from SYStore: %{public}@", (uint8_t *)&v21, 0xCu);
    }
    id v15 = v8;
    id v16 = [(NEKSyncController *)self environment];
    if ([v16 isReminderKitEnabled])
    {
      unsigned int v17 = [v15 type];

      if (v17 == 3) {
        goto LABEL_12;
      }
    }
    else
    {
    }
    BOOL v18 = [(NEKSyncController *)self eventStore];
    [v18 deleteItem:v15 store:v9];

    BOOL v19 = [(NEKSyncController *)self environment];
    if (![v19 isReminderKitEnabled])
    {
LABEL_13:

      goto LABEL_14;
    }
    unsigned int v20 = [v15 type];

    if (v20 == 3)
    {
LABEL_14:

      goto LABEL_15;
    }
LABEL_12:
    BOOL v19 = [(NEKSyncController *)self reminderStore];
    [v19 deleteItem:v15 store:v10];
    goto LABEL_13;
  }
  if (os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_ERROR)) {
    sub_10006F1C8(v12);
  }
LABEL_15:
}

- (void)deleteSYObject:(id)a3 eventStore:(id)a4 reminderStore:(id)a5
{
}

- (int64_t)maxDeltaRetries
{
  Boolean keyExistsAndHasValidFormat = 0;
  int64_t result = CFPreferencesGetAppIntegerValue(@"maxDeltaRetries", @"com.apple.EventKitSync", &keyExistsAndHasValidFormat);
  if (!keyExistsAndHasValidFormat) {
    return 1000000;
  }
  return result;
}

- (int64_t)_faultCount
{
  v2 = [(NEKSyncController *)self environment];
  int64_t v3 = [v2 tinyStore];
  id v4 = [v3 getIntegerValueForKey:@"FaultCount" default:0];

  return (int64_t)v4;
}

- (void)_setFaultCount:(int64_t)a3
{
  id v5 = [(NEKSyncController *)self environment];
  id v4 = [v5 tinyStore];
  [v4 setIntegerValue:a3 forKey:@"FaultCount"];
}

- (BOOL)isCurrentlySyncing
{
  return self->_syncSession != 0;
}

- (void)_retrySession:(id)a3
{
  unsigned int v4 = [a3 isResetSync];
  syncService = self->_syncService;
  if (v4)
  {
    [(SYService *)syncService setNeedsResetSync];
  }
  else
  {
    [(SYService *)syncService setHasChangesAvailable];
  }
}

- (id)service:(id)a3 willPreferSession:(id)a4 overSession:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 136446722;
    id v23 = "NEKSyncController.m";
    __int16 v24 = 1024;
    LODWORD(v25[0]) = 549;
    WORD2(v25[0]) = 2080;
    *(void *)((char *)v25 + 6) = "-[NEKSyncController service:willPreferSession:overSession:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}s:%d %s --mark--", (uint8_t *)&v22, 0x1Cu);
  }
  if ([v10 isResetSync])
  {
    uint64_t v12 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Decided to prefer reset session over delta.", (uint8_t *)&v22, 2u);
    }
    int64_t v13 = v9;
  }
  else
  {
    int64_t v13 = v10;
    id v10 = v9;
  }
  if ([v13 isSending])
  {
    [(NEKSyncController *)self _retrySession:v13];
    v14 = [v13 delegate];
    id v15 = [v14 progressLiar];
    preemptedSessionProgressLiar = self->_preemptedSessionProgressLiar;
    self->_preemptedSessionProgressLiar = v15;

    [(NEKProgressLiar *)self->_preemptedSessionProgressLiar pause];
  }
  unsigned int v17 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v18 = v17;
    BOOL v19 = [v10 identifier];
    unsigned int v20 = [v13 identifier];
    int v22 = 138543618;
    id v23 = v19;
    __int16 v24 = 2114;
    v25[0] = v20;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Winning session: %{public}@, losing session: %{public}@", (uint8_t *)&v22, 0x16u);
  }

  return v10;
}

- (BOOL)_clearToDeltaSync
{
  int64_t v3 = [(NEKSyncController *)self environment];
  unsigned int v4 = [v3 tinyStore];

  uint64_t v5 = [(NEKSyncController *)self _faultCount];
  BOOL v6 = ![v4 getIntegerValueForKey:@"RetryMustBeReset" default:0]
    && v5 < [(NEKSyncController *)self maxDeltaRetries];

  return v6;
}

- (void)tc_status:(id)a3
{
  unsigned int v4 = (void (**)(id, void *))a3;
  uint64_t v5 = [(NEKSyncController *)self environment];
  id v22 = [v5 tinyStore];

  id v6 = [v22 getIntegerValueForKey:@"tc_automaticSync" default:1];
  [v22 getDoubleValueForKey:@"lastSuccessfulStamp" default:0.0];
  double v8 = v7;
  if (v7 != 0.0)
  {
    id v9 = +[NSDate date];
    [v9 timeIntervalSinceReferenceDate];
    double v8 = v8 - v10;
  }
  id v11 = [v22 getIntegerValueForKey:@"FaultCount" default:0];
  [v22 getDoubleValueForKey:@"tc_objectDelay" default:0.0];
  uint64_t v13 = v12;
  v14 = objc_opt_new();
  [v14 appendFormat:@"Object delay: %.3f\n", v13];
  [v14 appendFormat:@"Fault count: %d\n", v11];
  unsigned int v15 = [(NEKSyncController *)self isCurrentlySyncing];
  id v16 = "No";
  if (v15) {
    id v16 = "Yes";
  }
  [v14 appendFormat:@"Currently syncing: %s\n", v16];
  unsigned int v17 = "Enabled";
  if (!v6) {
    unsigned int v17 = "Disabled";
  }
  [v14 appendFormat:@"Automatic sync: %s\n", v17];
  [v14 appendString:@"Last successful sync sent: "];
  if (v8 == 0.0) {
    [v14 appendString:@"N/A\n"];
  }
  else {
    [v14 appendFormat:@"%f\n", *(void *)&v8];
  }
  [(NEKSyncController *)self getMinimumSessionTimeout];
  [v14 appendFormat:@"Minimum session timeout: %.3f\n", v18];
  [(NEKSyncController *)self getMaximumSessionTimeout];
  [v14 appendFormat:@"Maximum session timeout: %.3f\n", v19];
  [(NEKSyncController *)self getFailureProbablity];
  [v14 appendFormat:@"Probability of failure: %.3f\n", v20];
  [(NEKSyncController *)self getFixedRetryInternal];
  [v14 appendFormat:@"Fixed retry interval: %.3f\n", v21];
  v4[2](v4, v14);
}

- (void)tc_setNominal
{
  [(NEKSyncController *)self tc_setAutomaticSync:1];
  [(NEKSyncController *)self tc_setObjectDelay:0.0];
  [(NEKSyncController *)self tc_setMinimumSessionTimeout:-1.0];
  [(NEKSyncController *)self tc_setMaximumSessionTimeout:-1.0];
  [(NEKSyncController *)self tc_setFailureProbablity:0.0];

  [(NEKSyncController *)self tc_setFixedRetryInternal:-1.0];
}

- (void)tc_setAutomaticSync:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v4 = [(NEKSyncController *)self environment];
  id v5 = [v4 tinyStore];

  [v5 setIntegerValue:v3 forKey:@"tc_automaticSync"];
}

- (void)tc_advanceChangeNumber
{
  id v2 = +[NSNotificationCenter defaultCenter];
  [v2 postNotificationName:@"NEKBlindChangeNumberAdvance" object:0];
}

- (void)tc_setObjectDelay:(double)a3
{
  id v5 = [(NEKSyncController *)self environment];
  unsigned int v4 = [v5 tinyStore];
  [v4 setDoubleValue:@"tc_objectDelay" forKey:a3];
}

- (void)tc_requestDelta
{
}

- (void)tc_setMinimumSessionTimeout:(double)a3
{
  uint64_t v4 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  if (a3 <= 0.0) {
    id v5 = 0;
  }
  else {
    id v5 = (const void *)v4;
  }

  CFPreferencesSetAppValue(@"minSessionTimeout", v5, @"com.apple.EventKitSync");
}

- (void)tc_setMaximumSessionTimeout:(double)a3
{
  uint64_t v4 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  if (a3 <= 0.0) {
    id v5 = 0;
  }
  else {
    id v5 = (const void *)v4;
  }

  CFPreferencesSetAppValue(@"maxSessionTimeout", v5, @"com.apple.EventKitSync");
}

- (void)tc_setFailureProbablity:(double)a3
{
  uint64_t v4 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  if (a3 <= 0.0) {
    id v5 = &off_1000AF2B0;
  }
  else {
    id v5 = (_UNKNOWN **)v4;
  }

  CFPreferencesSetAppValue(@"internal_probabilityOfSyncFailure", v5, @"com.apple.EventKitSync");
}

- (void)tc_setFixedRetryInternal:(double)a3
{
  uint64_t v4 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  if (a3 <= 0.0) {
    id v5 = 0;
  }
  else {
    id v5 = (const void *)v4;
  }

  CFPreferencesSetAppValue(@"internal_retryInterval", v5, @"com.apple.EventKitSync");
}

- (double)getMinimumSessionTimeout
{
  id v2 = (_UNKNOWN **)CFPreferencesCopyAppValue(@"minSessionTimeout", @"com.apple.EventKitSync");
  if (v2) {
    BOOL v3 = v2;
  }
  else {
    BOOL v3 = &off_1000AF2C0;
  }
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (double)getMaximumSessionTimeout
{
  id v2 = (_UNKNOWN **)CFPreferencesCopyAppValue(@"maxSessionTimeout", @"com.apple.EventKitSync");
  if (v2) {
    BOOL v3 = v2;
  }
  else {
    BOOL v3 = &off_1000AF2D0;
  }
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (double)getFailureProbablity
{
  id v2 = (_UNKNOWN **)CFPreferencesCopyAppValue(@"internal_probabilityOfSyncFailure", @"com.apple.EventKitSync");
  if (v2) {
    BOOL v3 = v2;
  }
  else {
    BOOL v3 = &off_1000AF2B0;
  }
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (double)getFixedRetryInternal
{
  id v2 = (_UNKNOWN **)CFPreferencesCopyAppValue(@"internal_retryInterval", @"com.apple.EventKitSync");
  if (v2) {
    BOOL v3 = v2;
  }
  else {
    BOOL v3 = &off_1000AF2E0;
  }
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (BOOL)service:(id)a3 startSession:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  double v10 = self->_sessionIdleQueue;
  id v11 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = v11;
    uint64_t v13 = [v9 valueForKey:@"identifier"];
    if ([v9 isSending]) {
      CFStringRef v14 = @"sending";
    }
    else {
      CFStringRef v14 = @"receiving";
    }
    unsigned int v15 = [v9 isResetSync];
    CFStringRef v16 = @"delta";
    *(_DWORD *)long long buf = 136446978;
    *(void *)&uint8_t buf[4] = "-[NEKSyncController service:startSession:error:]";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v13;
    if (v15) {
      CFStringRef v16 = @"reset";
    }
    __int16 v41 = 2114;
    CFStringRef v42 = v14;
    __int16 v43 = 2114;
    CFStringRef v44 = v16;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}s %{public}@ #%{public}@ #%{public}@", buf, 0x2Au);
  }
  if (atomic_fetch_add(&self->_sessionDepth, 1u))
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_ERROR)) {
      sub_10006F270();
    }
    abort();
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000405E8;
  block[3] = &unk_1000A8B90;
  unsigned int v17 = v10;
  int64_t v37 = v17;
  dispatch_barrier_sync(v17, block);
  *(_OWORD *)long long buf = xmmword_10009BAF0;
  uint64_t v18 = objc_alloc_init(NEKSyncSession);
  syncSession = self->_syncSession;
  self->_syncSession = v18;

  uint64_t v20 = [(NEKSyncController *)self environment];
  [(NEKSyncSession *)self->_syncSession setEnvironment:v20];

  uint64_t v21 = objc_alloc_init(NDTPerf);
  [(NEKSyncSession *)self->_syncSession setPerfomanceTracker:v21];

  id v22 = [(NEKSyncController *)self environment];
  id v23 = [v22 tinyStore];
  [v23 getDoubleValueForKey:@"tc_objectDelay" default:0.0];
  [(NEKSyncSession *)self->_syncSession setObjectDelayUs:(uint64_t)(v24 * 1000000.0)];

  if ([v9 isSending]) {
    [(NEKSyncController *)self _startSendSession:v9 results:buf];
  }
  else {
    [(NEKSyncController *)self _startRecvSession:v9 results:buf];
  }
  if (a5) {
    *a5 = *(id *)&buf[8];
  }
  unsigned __int8 v25 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v38 = 67109120;
    int v39 = buf[0];
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "StartSession result: %d", v38, 8u);
  }
  v26 = self->_syncSession;
  if (buf[0])
  {
    [v9 setDelegate:v26];
    id v27 = objc_alloc_init(NEKProtobufSerializer);
    [v9 setSerializer:v27];

    [v9 setCanRestart:0];
    [v9 setCanRollback:0];
    uint64_t v28 = [(NEKSyncController *)self environment];
    uint64_t v29 = [v28 recordMap];
    [v29 begin];

    kdebug_trace();
  }
  else
  {
    self->_syncSession = 0;

    if (buf[1])
    {
      v30 = *(NSObject **)(qword_1000C6CA8 + 8);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v38 = 0;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "No session created so declaring completion to PSYSync", v38, 2u);
      }
      uint64_t v31 = [(NEKSyncController *)self environment];
      BOOL v32 = [v31 syncCoordinator];
      v33 = [v32 session];
      [v33 syncDidComplete];
    }
    atomic_fetch_add(&self->_sessionDepth, 0xFFFFFFFF);
    dispatch_resume(v17);
  }
  BOOL v34 = buf[0] != 0;

  return v34;
}

- (void)_startSendSession:(id)a3 results:(StartSessionResults *)a4
{
  id v6 = a3;
  double v7 = objc_alloc_init(NEKResultsFetcher);
  id v8 = [(NEKStore *)self->_eventStore changeObserver];
  [(NEKResultsFetcher *)v7 setEventChangeObserver:v8];

  id v9 = [(NEKStore *)self->_reminderStore changeObserver];
  [(NEKResultsFetcher *)v7 setReminderChangeObserver:v9];

  double v10 = [(NEKSyncController *)self eventStore];
  [(NEKResultsFetcher *)v7 setNekEventStore:v10];

  id v11 = [(NEKSyncController *)self reminderStore];
  [(NEKResultsFetcher *)v7 setNekReminderStore:v11];

  uint64_t v12 = [(NEKSyncController *)self environment];
  uint64_t v13 = [v12 tinyStore];
  [v13 getDoubleValueForKey:@"RetryDueDate" default:-1.0];
  double v15 = v14;

  BOOL v16 = v15 != -1.0 && v15 < CFAbsoluteTimeGetCurrent();
  v71[0] = _NSConcreteStackBlock;
  v71[1] = 3221225472;
  v71[2] = sub_10004109C;
  v71[3] = &unk_1000A99A0;
  v71[4] = self;
  v71[5] = a4;
  unsigned int v17 = objc_retainBlock(v71);
  if ([v6 isResetSync])
  {
    uint64_t v18 = [[NEKResultsPipe alloc] initWithFIFOLength:8 name:@"ResetSyncPipe"];
    [(NEKResultsFetcher *)v7 fetchEverythingIntoPipe:v18];
    [(NEKSyncSession *)self->_syncSession setChangeSupplier:v18];
    resetTimeoutTracker = self->_resetTimeoutTracker;
LABEL_8:
    [(NEKSyncSession *)self->_syncSession setStatsTracker:resetTimeoutTracker];
LABEL_9:

    uint64_t v20 = [(NEKSyncSession *)self->_syncSession changeSupplier];
    uint64_t v21 = [v20 completion];
    id completion = self->_completion;
    self->_id completion = v21;

    id v23 = [(NEKSyncSession *)self->_syncSession changeSupplier];
    [v23 sealCompletions];

    [(NEKSyncSession *)self->_syncSession setStart:CFAbsoluteTimeGetCurrent()];
    [(NEKSyncController *)self _fullSessionTimeout];
    [v6 setFullSessionTimeout:];
    double v24 = sub_1000410CC();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      [v6 fullSessionTimeout];
      *(_DWORD *)long long buf = 134217984;
      *(void *)v76 = v25;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Session timeout: %.02f", buf, 0xCu);
    }

    if (self->_preemptedSessionProgressLiar)
    {
      -[NEKSyncSession setProgressLiar:](self->_syncSession, "setProgressLiar:");
      v26 = [(NEKSyncSession *)self->_syncSession progressLiar];
      [v26 resume];

      preemptedSessionProgressLiar = self->_preemptedSessionProgressLiar;
      self->_preemptedSessionProgressLiar = 0;
    }
    else
    {
      uint64_t v28 = [NEKProgressLiar alloc];
      [v6 fullSessionTimeout];
      double v30 = v29;
      uint64_t v31 = [(NEKSyncController *)self environment];
      BOOL v32 = [v31 syncCoordinator];
      v33 = [v32 session];
      BOOL v34 = [(NEKProgressLiar *)v28 initWithSpan:v33 session:v30];
      [(NEKSyncSession *)self->_syncSession setProgressLiar:v34];

      preemptedSessionProgressLiar = [(NEKSyncSession *)self->_syncSession progressLiar];
      [preemptedSessionProgressLiar start];
    }

    [v6 setMaxConcurrentMessages:2];
    [v6 setPerMessageTimeout:300.0];
    BOOL v35 = sub_1000410CC();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      [v6 perMessageTimeout];
      *(_DWORD *)long long buf = 67109120;
      *(_DWORD *)v76 = (int)v36;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "perMessageTimeout: %d", buf, 8u);
    }

    v73 = off_1000C6960;
    v72 = off_1000C6968;
    int64_t v37 = +[NSArray arrayWithObjects:&v72 count:1];
    v74 = v37;
    v38 = +[NSDictionary dictionaryWithObjects:&v74 forKeys:&v73 count:1];
    [v6 setSessionMetadata:v38];

    +[NEKCalendarID resetLocalCalendarCache];
    goto LABEL_17;
  }
  if (self->_isNightlySync)
  {
    uint64_t v18 = [[NEKResultsPipe alloc] initWithFIFOLength:8 name:@"NightlySyncPipe"];
    [(NEKResultsFetcher *)v7 fetchNightlyIntoPipe:v18];
    [(NEKSyncSession *)self->_syncSession setChangeSupplier:v18];
    resetTimeoutTracker = self->_nightlyTimeoutTracker;
    goto LABEL_8;
  }
  if ([(NEKSyncController *)self _clearToDeltaSync])
  {
    v40 = [(NEKSyncController *)self environment];
    __int16 v41 = [v40 tinyStore];
    [v41 getDoubleValueForKey:@"deferUntil" default:1.79769313e308];
    double v43 = v42;

    BOOL v44 = v43 > CFAbsoluteTimeGetCurrent() && [(NEKSyncController *)self _faultCount] == 0;
    uint64_t v18 = [[NEKResultsPipe alloc] initWithFIFOLength:8 name:@"DeltaSyncPipe"];
    id v46 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 67109120;
      *(_DWORD *)v76 = v44;
      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Deferrability: %d", buf, 8u);
    }
    [(NEKResultsFetcher *)v7 fetchChangesIntoPipe:v18, v44, @"deferUntil" deferrable];
    if ([(NEKResultsPipe *)v18 isTruncated])
    {
      if (os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_ERROR)) {
        sub_10006F2A4();
      }
      [(NDTResultsFIFO *)v18 terminateIfNotFinished];
      ((void (*)(void *))v17[2])(v17);
    }
    else
    {
      [(NEKSyncSession *)self->_syncSession setStatsTracker:self->_deltaTimeoutTracker];
      if ([(NEKResultsPipe *)v18 isEffectivelyEmpty])
      {
        v49 = *(NSObject **)(qword_1000C6CA8 + 8);
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "Change set was empty, not starting a sync session.", buf, 2u);
        }
        [(NDTResultsFIFO *)v18 terminateIfNotFinished];
        v50 = [(NEKResultsPipe *)v18 completion];

        if (v50)
        {
          v51 = [(NEKResultsPipe *)v18 completion];
          v51[2]();
        }
      }
      else
      {
        if (![(NEKResultsPipe *)v18 isDeferrable])
        {
          if (![(NEKResultsPipe *)v18 changesAffectNext24hrs])
          {
            v63 = *(NSObject **)(qword_1000C6CA8 + 8);
            if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)long long buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "No changes in the next 24hrs, adding nonwaking push priority for IDS session", buf, 2u);
            }
            v64 = [v6 options];
            id v65 = [v64 mutableCopy];
            v66 = v65;
            if (v65) {
              id v67 = v65;
            }
            else {
              id v67 = (id)objc_opt_new();
            }
            v68 = v67;

            [v68 setObject:&__kCFBooleanTrue forKey:IDSSendMessageOptionNonWakingKey];
            [v68 setObject:&off_1000AF248 forKey:IDSSendMessageOptionPushPriorityKey];
            id v69 = [v68 copy];
            [v6 setOptions:v69];
          }
          [(NEKSyncSession *)self->_syncSession setChangeSupplier:v18];
          [(NEKSyncSession *)self->_syncSession setFetcher:v7];
          goto LABEL_9;
        }
        v52 = *(NSObject **)(qword_1000C6CA8 + 8);
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "Change set is deferrable, not starting session.", buf, 2u);
        }
        v53 = [(NEKSyncController *)self environment];
        v54 = [v53 tinyStore];
        [v54 getDoubleValueForKey:v70 default:-1.0];
        double v56 = v55;

        if (v56 == -1.0)
        {
          long long v57 = [(NEKSyncController *)self environment];
          long long v58 = [v57 tinyStore];
          [v58 setDoubleValue:v70 forKey:CFAbsoluteTimeGetCurrent() + 300.0];

          [(NEKSyncController *)self scheduleDeferredRetry];
        }
        [(NDTResultsFIFO *)v18 terminateIfNotFinished];
      }
      a4->var0 = 0;
    }

    goto LABEL_17;
  }
  if (v16)
  {
    id v45 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Retry is overdue and we need a reset. Forcing things along.", buf, 2u);
    }
    ((void (*)(void *))v17[2])(v17);
  }
  else
  {
    id v47 = *(NSObject **)(qword_1000C6CA8 + 8);
    BOOL v48 = os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT);
    if (v15 == -1.0)
    {
      if (v48)
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "We were denied delta sync effort but there is no backup due date. Scheduling retry based on current faultCount/connectedState", buf, 2u);
      }
      ((void (*)(void *))v17[2])(v17);
      [(NEKSyncController *)self scheduleRetry];
    }
    else
    {
      if (v48)
      {
        long long v59 = v47;
        unsigned int v60 = [v6 isResetSync];
        BOOL isNightlySync = self->_isNightlySync;
        unsigned int v62 = [(NEKSyncController *)self _clearToDeltaSync];
        *(_DWORD *)long long buf = 67109632;
        *(_DWORD *)v76 = v60;
        *(_WORD *)&v76[4] = 1024;
        *(_DWORD *)&v76[6] = isNightlySync;
        __int16 v77 = 1024;
        unsigned int v78 = v62;
        _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "Sync request ignored: isReset: %d isNightly: %d clearToDelta: %d", buf, 0x14u);
      }
      [(NEKSyncController *)self scheduleRetry];
      a4->var0 = 0;
    }
  }
LABEL_17:
}

- (void)_startRecvSession:(id)a3 results:(StartSessionResults *)a4
{
  id v6 = off_1000C6960;
  double v7 = off_1000C6968;
  id v4 = a3;
  double v5 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  [v4 setSessionMetadata:v5];
}

- (double)_fullSessionTimeout
{
  BOOL v3 = [(NEKSyncSession *)self->_syncSession statsTracker];
  [v3 nextTimeout];
  double v5 = v4;

  id v6 = sub_1000410CC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    double v7 = [(NEKSyncSession *)self->_syncSession statsTracker];
    [v7 mean];
    uint64_t v9 = v8;
    double v10 = [(NEKSyncSession *)self->_syncSession statsTracker];
    [v10 stddev];
    *(_DWORD *)long long buf = 134218240;
    uint64_t v20 = v9;
    __int16 v21 = 2048;
    uint64_t v22 = v11;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Before timeout stats: x=%.02f sigma=%f", buf, 0x16u);
  }
  double v12 = fmin(v5, 14400.0);

  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"internal_enableLongTimeouts", @"com.apple.EventKitSync", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat && AppBooleanValue)
  {
    double v14 = sub_1000410CC();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Comically long session timeouts enabled!", buf, 2u);
    }

    double v12 = 144000.0;
  }
  int v15 = CFPreferencesGetAppBooleanValue(@"internal_enableShortTimeouts", @"com.apple.EventKitSync", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat && v15)
  {
    BOOL v16 = sub_1000410CC();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Comically short session timeouts enabled!", buf, 2u);
    }

    return 30.0;
  }
  return v12;
}

- (BOOL)_shouldFakeFailure
{
  BOOL result = 0;
  if (os_variant_has_internal_diagnostics())
  {
    [(NEKSyncController *)self getFailureProbablity];
    double v4 = v3;
    uint32_t v5 = arc4random();
    if (scalbn((double)v5, -32) < v4) {
      return 1;
    }
  }
  return result;
}

- (double)_nextDelay:(int64_t)a3
{
  [(NEKSyncController *)self getFixedRetryInternal];
  if (result <= 0.0) {
    return fmin(pow(1.5, (double)(a3 - 1)) * 60.0, 5400.0);
  }
  return result;
}

- (void)scheduleRetry
{
  double v3 = [(NEKSyncController *)self environment];
  id v8 = [v3 tinyStore];

  uint64_t v4 = [(NEKSyncController *)self _faultCount];
  if (v4 >= 1)
  {
    uint64_t v5 = v4;
    if ([(SYService *)self->_syncService targetIsConnected])
    {
      [(NEKSyncController *)self _nextDelay:v5];
      double v7 = v6;
      [v8 setDoubleValue:@"RetryDueDate" forKey:v6 + CFAbsoluteTimeGetCurrent()];
      [(NDTActivity *)self->_activity completeAndFireIn:(uint64_t)v7];
    }
    else
    {
      [v8 setDoubleValue:@"RetryDueDate" forKey:-1.0];
      [(NDTActivity *)self->_activity completeAndFireOnConnection];
    }
  }
}

- (void)activityRun:(id)a3
{
}

- (void)activityDefer:(id)a3
{
  uint64_t v4 = [(SYService *)self->_syncService currentSession];

  if (v4)
  {
    uint64_t v5 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "XPC activity deferral requested.", v7, 2u);
    }
    double v6 = [(SYService *)self->_syncService currentSession];
    [v6 cancel];

    [(NEKSyncController *)self bumpFaultsAndScheduleRetry];
  }
}

- (char)activitySubsystem:(id)a3
{
  return "com.apple.eventkitsync";
}

- (char)activityIdentifier:(id)a3
{
  return "com.apple.eventkitsync.retrysync";
}

- (void)clearRemoteBuildVersion
{
  p_syServiceLock = &self->_syServiceLock;
  os_unfair_lock_lock(&self->_syServiceLock);
  self->_wasUsingDataTransfer ^= 1u;
  os_unfair_lock_unlock(p_syServiceLock);
  uint64_t v4 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Remote engine requirement zapped.", v5, 2u);
  }
}

- (void)clearRetryState
{
  double v3 = [(NEKSyncController *)self environment];
  id v4 = [v3 tinyStore];

  [(NEKSyncController *)self _setFaultCount:0];
  [v4 setIntegerValue:0 forKey:@"RetryMustBeReset"];
  [v4 setDoubleValue:@"RetryDueDate" forKey:-1.0];
}

- (void)bumpFaultsAndScheduleRetry
{
  [(NEKSyncController *)self _setFaultCount:(char *)[(NEKSyncController *)self _faultCount] + 1];

  [(NEKSyncController *)self scheduleRetry];
}

- (void)service:(id)a3 sessionEnded:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  double v10 = (__CFString *)a5;
  kdebug_trace();
  uint64_t v11 = (void *)os_transaction_create();
  double v12 = self->_syncSession;
  uint64_t v13 = [(NEKSyncSession *)v12 changeSupplier];
  [v13 terminateIfNotFinished];

  double v14 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = v14;
    BOOL v16 = [(NEKSyncSession *)v12 changeSupplier];
    *(_DWORD *)long long buf = 138543362;
    v33 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "This pipe better be dead: %{public}@", buf, 0xCu);
  }
  if (v9)
  {
    id v17 = [v8 currentSession];

    if (v17 == v9)
    {
      __int16 v21 = *(NSObject **)(qword_1000C6CA8 + 8);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v31 = v21;
        uint64_t v22 = [v9 valueForKey:@"identifier"];
        if ([v9 isSending]) {
          CFStringRef v23 = @"sending";
        }
        else {
          CFStringRef v23 = @"receiving";
        }
        unsigned int v24 = [v9 isResetSync];
        CFStringRef v25 = @"delta";
        *(_DWORD *)long long buf = 136446978;
        v33 = "-[NEKSyncController service:sessionEnded:error:]";
        __int16 v34 = 2114;
        BOOL v35 = v22;
        if (v24) {
          CFStringRef v25 = @"reset";
        }
        __int16 v36 = 2114;
        CFStringRef v37 = v23;
        __int16 v38 = 2114;
        CFStringRef v39 = v25;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%{public}s %{public}@ #%{public}@ #%{public}@", buf, 0x2Au);
      }
      if ([v9 isSending]) {
        [(NEKSyncController *)self _sendSessionEnded:v9 error:v10];
      }
      else {
        [(NEKSyncController *)self _recvSessionEnded:v9 error:v10];
      }
    }
    else
    {
      uint64_t v18 = [v8 currentSession];

      uint64_t v19 = *(NSObject **)(qword_1000C6CA8 + 8);
      if (v18)
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          log = v19;
          os_log_t v30 = [v8 currentSession];
          uint64_t v28 = [v30 identifier];
          uint64_t v20 = [v9 identifier];
          *(_DWORD *)long long buf = 138543874;
          v33 = v28;
          __int16 v34 = 2114;
          BOOL v35 = v20;
          __int16 v36 = 2114;
          CFStringRef v37 = v10;
          _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Current session [%{public}@] != ending session [%{public}@]. Error: %{public}@ Dropping notificaiton on floor.", buf, 0x20u);
        }
      }
      else if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "service.currentSession is nil, clearing user session.", buf, 2u);
      }
    }
  }
  else if (os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_ERROR))
  {
    sub_10006F30C();
  }
  [v9 setDelegate:0];
  [(NEKSyncSession *)v12 setChangeSupplier:0];
  syncSession = self->_syncSession;
  self->_syncSession = 0;

  id v27 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Resuming session idle queue", buf, 2u);
  }
  if (atomic_fetch_add(&self->_sessionDepth, 0xFFFFFFFF) != 1)
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_ERROR)) {
      sub_10006F2D8();
    }
    abort();
  }
  dispatch_resume((dispatch_object_t)self->_sessionIdleQueue);
}

- (void)_sendSessionEnded:(id)a3 error:(id)a4
{
  id v6 = a3;
  double v7 = (__CFString *)a4;
  id v8 = [v6 delegate];
  id v9 = [(NEKSyncController *)self environment];
  v73 = [v9 tinyStore];

  double v10 = [v8 perfomanceTracker];
  v72 = +[NDTPerf nowMinusPrevious:v10];

  uint64_t v11 = [v8 progressLiar];
  [v11 doneForRealNotifyingPairedSync:1];

  [(NDTActivity *)self->_activity completeAndFireNever];
  double v12 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v13 = @"None";
    if (v7) {
      CFStringRef v13 = v7;
    }
    *(_DWORD *)long long buf = 138543362;
    *(void *)&uint8_t buf[4] = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Send complete with error: %{public}@", buf, 0xCu);
  }
  double v14 = sub_100042778();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = [v6 identifier];
    if (v7) {
      CFStringRef v16 = v7;
    }
    else {
      CFStringRef v16 = @"None";
    }
    [v72 cpuTimeMs];
    *(_DWORD *)long long buf = 138543874;
    *(void *)&uint8_t buf[4] = v15;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v16;
    *(_WORD *)&unsigned char buf[22] = 2048;
    v84 = v17;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "SendingSession: %{public}@ error: %{public}@ cpuTime: %.02fms", buf, 0x20u);
  }
  if (v7 || [(NEKSyncController *)self _shouldFakeFailure])
  {
    id completion = self->_completion;
    self->_id completion = 0;

    uint64_t v19 = [(NEKSyncController *)self environment];
    uint64_t v20 = [v19 recordMap];
    [v20 rollback];

    *(void *)long long buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    v84 = sub_1000427CC;
    v85 = sub_1000427F8;
    id v86 = 0;
    v78[0] = _NSConcreteStackBlock;
    v78[1] = 3221225472;
    v78[2] = sub_100042800;
    v78[3] = &unk_1000A9A08;
    v78[4] = buf;
    __int16 v21 = objc_retainBlock(v78);
    uint64_t v22 = *(void **)(*(void *)&buf[8] + 40);
    *(void *)(*(void *)&buf[8] + 40) = v21;

    CFStringRef v23 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_10006F340(v7 == 0, v23);
    }
    if (([v6 isResetSync] & 1) != 0 || self->_isNightlySync)
    {
      unsigned int v24 = *(NSObject **)(qword_1000C6CA8 + 8);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        if (self->_isNightlySync) {
          CFStringRef v25 = "nightly";
        }
        else {
          CFStringRef v25 = "reset";
        }
        *(_DWORD *)v79 = 136446210;
        v80 = v25;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Failed session was a %{public}s so setting up retry to be a reset.", v79, 0xCu);
      }
      self->_BOOL isNightlySync = 0;
      [v73 setIntegerValue:1 forKey:@"RetryMustBeReset"];
      if ([(__CFString *)v7 code] != (id)-128)
      {
        uint64_t v26 = *(void *)(*(void *)&buf[8] + 40);
        v77[1] = _NSConcreteStackBlock;
        v77[2] = (id)3221225472;
        v77[3] = sub_10004285C;
        v77[4] = &unk_1000A8B90;
        v77[5] = self;
        (*(void (**)(void))(v26 + 16))();
      }
    }
    if (v7)
    {
      id v27 = [v8 changeSupplier];
      [v27 setError:v7];
    }
    if ([(__CFString *)v7 code] == (id)-128)
    {
      uint64_t v28 = *(NSObject **)(qword_1000C6CA8 + 8);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v79 = 0;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "SYErrorCanceled (deferral/collision)", v79, 2u);
      }
    }
    else
    {
      if ([(__CFString *)v7 code] == (id)2023)
      {
        objc_initWeak((id *)v79, self);
        uint64_t v29 = *(void *)(*(void *)&buf[8] + 40);
        v75[0] = _NSConcreteStackBlock;
        v75[1] = 3221225472;
        v75[2] = sub_100042868;
        v75[3] = &unk_1000A9140;
        objc_copyWeak(v77, (id *)v79);
        id v76 = v6;
        (*(void (**)(uint64_t, void *))(v29 + 16))(v29, v75);
        os_log_t v30 = *(NSObject **)(qword_1000C6CA8 + 8);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v74 = 0;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "LostCollisionTest error, retry should already be scheduled.", v74, 2u);
        }

        objc_destroyWeak(v77);
        objc_destroyWeak((id *)v79);
        goto LABEL_39;
      }
      if ([(__CFString *)v7 code] == (id)2007 || [(__CFString *)v7 code] == (id)23)
      {
        uint64_t v31 = [v8 statsTracker];
        [v31 updateFailure];

        BOOL v32 = [v8 statsTracker];
        [v32 save];

        v33 = sub_1000410CC();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v34 = [v8 statsTracker];
          [v34 mean];
          __int16 v36 = v35;
          CFStringRef v37 = [v8 statsTracker];
          [v37 stddev];
          *(_DWORD *)v79 = 134218240;
          v80 = v36;
          __int16 v81 = 2048;
          uint64_t v82 = v38;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Post failure update sync timings: x=%.02f sigma=%f", v79, 0x16u);
        }
      }
    }
    (*(void (**)(void))(*(void *)(*(void *)&buf[8] + 40) + 16))();
LABEL_39:
    (*(void (**)(void))(*(void *)(*(void *)&buf[8] + 40) + 16))();
    CFStringRef v39 = [(NEKSyncController *)self environment];
    v40 = [v39 analytics];
    [v40 recordSessionType:3];

    _Block_object_dispose(buf, 8);
    goto LABEL_40;
  }
  [(NEKSyncController *)self recordSuccessForSession:v6 receiving:0];
  id v45 = (void (**)(void))self->_completion;
  if (v45)
  {
    v45[2]();
    id v46 = self->_completion;
    self->_id completion = 0;
  }
  id v47 = [(NEKSyncController *)self environment];
  BOOL v48 = [v47 recordMap];
  [v48 commit];

  v49 = [(NEKSyncController *)self environment];
  v50 = [v49 tinyStore];
  [v50 deleteValueForKey:@"deferUntil"];

  v51 = [(NEKSyncController *)self environment];
  v52 = [v51 tinyStore];
  v53 = +[NSDate date];
  [v53 timeIntervalSinceReferenceDate];
  [v52 setDoubleValue:@"lastSuccessfulStamp" forKey:];

  if ([v6 isResetSync])
  {
    v54 = [(NEKSyncController *)self environment];
    double v55 = [v54 tinyStore];
    [v55 setIntegerValue:_os_feature_enabled_impl() forKey:@"MigrationSyncCount"];
  }
  if (self->_isNightlySync && ([v6 isResetSync] & 1) == 0)
  {
    double v56 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "Following nightly sync with request for delta", buf, 2u);
    }
    [(SYService *)self->_syncService setHasChangesAvailable];
  }
  self->_BOOL isNightlySync = 0;
  [(NEKSyncController *)self clearRetryState];
  [v8 start];
  double v58 = v57;
  double Current = CFAbsoluteTimeGetCurrent();
  unsigned int v60 = [v8 statsTracker];
  double v61 = Current - v58;
  [v60 updateSuccess:v61];

  unsigned int v62 = [v8 statsTracker];
  [v62 save];

  v63 = sub_1000410CC();
  if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
  {
    v64 = [v8 statsTracker];
    [v64 mean];
    uint64_t v66 = v65;
    id v67 = [v8 statsTracker];
    [v67 stddev];
    *(_DWORD *)long long buf = 134218496;
    *(double *)&uint8_t buf[4] = v61;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v66;
    *(_WORD *)&unsigned char buf[22] = 2048;
    v84 = v68;
    _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "Post success update sync timings: elapsed=%.02f x=%.02f sigma=%f", buf, 0x20u);
  }
  id v69 = [(NEKSyncController *)self environment];
  uint64_t v70 = [v69 analytics];
  if ([v6 isResetSync]) {
    uint64_t v71 = 1;
  }
  else {
    uint64_t v71 = 2;
  }
  [v70 recordSessionType:v71];

LABEL_40:
  __int16 v41 = [v8 fetcher];

  if (v41)
  {
    double v42 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Before join.", buf, 2u);
    }
    double v43 = [v8 fetcher];
    [v43 join];

    BOOL v44 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "After join.", buf, 2u);
    }
    [v8 setFetcher:0];
  }
}

- (void)_recvSessionEnded:(id)a3 error:(id)a4
{
  id v6 = a3;
  double v7 = (__CFString *)a4;
  id v8 = [v6 delegate];
  id v9 = [v8 perfomanceTracker];
  double v10 = +[NDTPerf nowMinusPrevious:v9];

  uint64_t v11 = sub_100042778();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    double v12 = [v6 identifier];
    if (v7) {
      CFStringRef v13 = v7;
    }
    else {
      CFStringRef v13 = @"None";
    }
    [v10 cpuTimeMs];
    int v26 = 138543874;
    unint64_t v27 = (unint64_t)v12;
    __int16 v28 = 2114;
    unint64_t v29 = (unint64_t)v13;
    __int16 v30 = 2048;
    unint64_t v31 = v14;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "ReceivingSession: %{public}@ error: %{public}@ cpuTime: %.02fms", (uint8_t *)&v26, 0x20u);
  }
  int v15 = sub_100042778();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v16 = (unint64_t)[v8 storeUpdateTimeNs] / 0xF4240;
    unint64_t v17 = (unint64_t)[v8 calendarUpdateTimeNs] / 0xF4240;
    unint64_t v18 = (unint64_t)[v8 eventUpdateTimeNs] / 0xF4240;
    unint64_t v19 = (unint64_t)[v8 reminderUpdateTimeNs];
    int v26 = 134218752;
    unint64_t v27 = v16;
    __int16 v28 = 2048;
    unint64_t v29 = v17;
    __int16 v30 = 2048;
    unint64_t v31 = v18;
    __int16 v32 = 2048;
    unint64_t v33 = v19 / 0xF4240;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Session walltime breakdown (ms): %llu store, %llu calendar, %llu events, %llu reminders.", (uint8_t *)&v26, 0x2Au);
  }

  if (v7)
  {
    uint64_t v20 = [(NEKSyncController *)self environment];
    __int16 v21 = [v20 recordMap];
    [v21 rollback];
  }
  else
  {
    [(NEKSyncController *)self recordSuccessForSession:v6 receiving:1];
    if (CFPreferencesGetAppBooleanValue(@"internal_dumpRecordMap", @"com.apple.EventKitSync", 0) == 1
      && os_variant_has_internal_diagnostics())
    {
      uint64_t v22 = [(NEKSyncController *)self environment];
      CFStringRef v23 = [v22 recordMap];
      [v23 dumpToLog];
    }
    [v6 isResetSync];
    uint64_t v20 = [(NEKSyncController *)self environment];
    __int16 v21 = [v20 recordMap];
    [v21 commit];
  }

  unsigned int v24 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    if (v7) {
      CFStringRef v25 = v7;
    }
    else {
      CFStringRef v25 = @"None";
    }
    int v26 = 138543362;
    unint64_t v27 = (unint64_t)v25;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Recv complete with error: %{public}@", (uint8_t *)&v26, 0xCu);
  }
}

- (void)recordSuccessForSession:(id)a3 receiving:(BOOL)a4
{
  BOOL v4 = a4;
  if ([a3 isResetSync])
  {
    id v11 = [(NEKSyncController *)self environment];
    id v6 = [v11 tinyStore];
    double v7 = +[NSDate date];
    [v7 timeIntervalSinceReferenceDate];
    id v8 = off_1000A8D00;
    id v9 = off_1000A8D08;
  }
  else
  {
    BOOL isNightlySync = self->_isNightlySync;
    id v11 = [(NEKSyncController *)self environment];
    id v6 = [v11 tinyStore];
    double v7 = +[NSDate date];
    [v7 timeIntervalSinceReferenceDate];
    if (isNightlySync)
    {
      id v8 = off_1000A8CF0;
      id v9 = off_1000A8CF8;
    }
    else
    {
      id v8 = off_1000A8CE0;
      id v9 = off_1000A8CE8;
    }
  }
  if (!v4) {
    id v8 = v9;
  }
  [v6 setDoubleValue:*v8 forKey:x0];
}

- (void)prepDatabasesForResetSync
{
  double v3 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Remove all items", v7, 2u);
  }
  BOOL v4 = [(NEKSyncController *)self environment];
  uint64_t v5 = [v4 recordMap];
  [v5 removeAllRecords];

  [(NEKStore *)self->_reminderStore removeAllItems];
  id v6 = [(NEKStore *)self->_eventStore changeObserver];
  [v6 restartTrackingChanges];
}

- (void)changeObserverDidObserveChanges:(id)a3
{
  BOOL v4 = [(NEKSyncController *)self environment];
  uint64_t v5 = [v4 tinyStore];

  id v6 = [v5 getIntegerValueForKey:@"tc_automaticSync" default:1];
  double v7 = *(NSObject **)(qword_1000C6CA8 + 8);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Poking CS for delta sync", buf, 2u);
    }
    [(SYService *)self->_syncService setHasChangesAvailable];
  }
  else if (v8)
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Delta sync request suppressed", v9, 2u);
  }
}

- (void)changeObserverDidObserveTruncation:(id)a3
{
  BOOL v4 = [(NEKSyncController *)self environment];
  uint64_t v5 = [v4 tinyStore];

  id v6 = [v5 getIntegerValueForKey:@"tc_automaticSync" default:1];
  double v7 = *(NSObject **)(qword_1000C6CA8 + 8);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Change log truncation is making us request a reset", buf, 2u);
    }
    [(NEKSyncController *)self setNeedsFullSync];
  }
  else if (v8)
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Reset sync request suppressed", v9, 2u);
  }
}

- (NEKSyncControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NEKSyncControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NEKStore)eventStore
{
  return self->_eventStore;
}

- (NEKStore)reminderStore
{
  return self->_reminderStore;
}

- (BOOL)isPerformingBackupResetSync
{
  return self->_isPerformingBackupResetSync;
}

- (void)setIsPerformingBackupResetSync:(BOOL)a3
{
  self->_isPerformingBackupResetSync = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_servicesServer, 0);
  objc_destroyWeak((id *)&self->_environment);
  objc_storeStrong((id *)&self->_testingControl, 0);
  objc_storeStrong((id *)&self->_preemptedSessionProgressLiar, 0);
  objc_storeStrong((id *)&self->_rpcEndpoint, 0);
  objc_storeStrong((id *)&self->_nightlyTimeoutTracker, 0);
  objc_storeStrong((id *)&self->_deltaTimeoutTracker, 0);
  objc_storeStrong((id *)&self->_resetTimeoutTracker, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_analyticsDriver, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_syncSession, 0);
  objc_storeStrong((id *)&self->_reminderStore, 0);
  objc_storeStrong((id *)&self->_eventStore, 0);
  objc_storeStrong((id *)&self->_sessionIdleQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_syncService, 0);
}

@end