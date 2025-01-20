@interface STCloudMirroringMonitor
- (BOOL)_safetySyncNeeded;
- (BOOL)isCloudKitSyncingEnabled;
- (NSOperationQueue)syncOperationQueue;
- (NSTimer)historyAnalyzerTimer;
- (NSTimer)safetySyncTimer;
- (OS_os_transaction)historyAnalyzerTransaction;
- (STCloudMirroringMonitor)initWithPersistenceController:(id)a3;
- (STDaemonPersistenceController)persistenceController;
- (double)_nextSafetySyncInterval;
- (id)_cloudKitTopicName;
- (id)fetchCurrentCloudKitSyncingStatus;
- (id)forceMirroringSync;
- (id)startCloudKitSyncing;
- (id)stopCloudKitSyncing;
- (id)storeChangeNotificationToken;
- (int64_t)_safetySyncStaleSeconds;
- (void)_analyzeLocalChanges;
- (void)_checkForNextSync;
- (void)_loadCloudPersistentStore;
- (void)_operation:(id)a3 cancelledDidChange:(BOOL)a4;
- (void)_operation:(id)a3 executingDidChange:(BOOL)a4;
- (void)_operation:(id)a3 finishedDidChange:(BOOL)a4;
- (void)_persistentStoreDidChange:(id)a3;
- (void)_registerForNotificationsThatTriggerCloudKitSyncs;
- (void)_removeCloudPersistentStore;
- (void)_scheduleHistoryAnalyzerTimer;
- (void)_setSafetySyncTimer;
- (void)_startSafetySyncChecks;
- (void)_stopSafetySyncChecks;
- (void)_unloadCloudPersistentStore;
- (void)_unregisterForNotificationsThatTriggerCloudKitSyncs;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)receivedNotification:(id)a3;
- (void)receivedToken:(id)a3;
- (void)setCloudKitSyncingEnabled:(BOOL)a3;
- (void)setHistoryAnalyzerTimer:(id)a3;
- (void)setHistoryAnalyzerTransaction:(id)a3;
- (void)setSafetySyncTimer:(id)a3;
- (void)setStoreChangeNotificationToken:(id)a3;
- (void)setSyncOperationQueue:(id)a3;
@end

@implementation STCloudMirroringMonitor

- (STCloudMirroringMonitor)initWithPersistenceController:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)STCloudMirroringMonitor;
  v6 = [(STCloudMirroringMonitor *)&v17 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_persistenceController, a3);
    uint64_t v8 = objc_opt_new();
    syncOperationQueue = v7->_syncOperationQueue;
    v7->_syncOperationQueue = (NSOperationQueue *)v8;

    [(NSOperationQueue *)v7->_syncOperationQueue setName:@"com.apple.ScreenTimeAgent.cloudkit"];
    [(NSOperationQueue *)v7->_syncOperationQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v7->_syncOperationQueue setQualityOfService:17];
    uint64_t v10 = objc_opt_new();
    queuedSyncOperations = v7->_queuedSyncOperations;
    v7->_queuedSyncOperations = (NSMutableSet *)v10;

    uint64_t v12 = objc_opt_new();
    executingSyncOperations = v7->_executingSyncOperations;
    v7->_executingSyncOperations = (NSMutableSet *)v12;

    uint64_t v14 = objc_opt_new();
    syncingEnabledLock = v7->_syncingEnabledLock;
    v7->_syncingEnabledLock = v14;
  }
  return v7;
}

- (id)startCloudKitSyncing
{
  [(STCloudMirroringMonitor *)self setCloudKitSyncingEnabled:1];
  v2 = [STPromise alloc];
  v3 = +[STResult success];
  v4 = [(STPromise *)v2 initWithResolution:v3 onQueue:&_dispatch_main_q];

  return v4;
}

- (id)stopCloudKitSyncing
{
  [(STCloudMirroringMonitor *)self setCloudKitSyncingEnabled:0];
  v2 = [STPromise alloc];
  v3 = +[STResult success];
  v4 = [(STPromise *)v2 initWithResolution:v3 onQueue:&_dispatch_main_q];

  return v4;
}

- (id)fetchCurrentCloudKitSyncingStatus
{
  v2 = +[NSNumber numberWithBool:[(STCloudMirroringMonitor *)self isCloudKitSyncingEnabled]];
  v3 = +[STResult success:v2];

  v4 = [[STPromise alloc] initWithResolution:v3 onQueue:&_dispatch_main_q];
  return v4;
}

- (BOOL)isCloudKitSyncingEnabled
{
  v2 = self;
  v3 = self->_syncingEnabledLock;
  objc_sync_enter(v3);
  LOBYTE(v2) = v2->_cloudKitSyncingEnabled;
  objc_sync_exit(v3);

  return (char)v2;
}

- (void)setCloudKitSyncingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = self->_syncingEnabledLock;
  objc_sync_enter(v5);
  if (self->_cloudKitSyncingEnabled != v3)
  {
    self->_cloudKitSyncingEnabled = v3;
    if (v3)
    {
      v6 = +[STLog mirroring];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Starting iCloud mirroring", buf, 2u);
      }

      v7 = [(STCloudMirroringMonitor *)self syncOperationQueue];
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_10001158C;
      v12[3] = &unk_1002FB6A8;
      v12[4] = self;
      [v7 addOperationWithBlock:v12];

      [(STCloudMirroringMonitor *)self _startSafetySyncChecks];
    }
    else
    {
      uint64_t v8 = +[STLog mirroring];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Stopping iCloud mirroring", buf, 2u);
      }

      v9 = [(STCloudMirroringMonitor *)self syncOperationQueue];
      [v9 cancelAllOperations];

      uint64_t v10 = [(STCloudMirroringMonitor *)self syncOperationQueue];
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_100011594;
      v11[3] = &unk_1002FB6A8;
      v11[4] = self;
      [v10 addOperationWithBlock:v11];

      [(STCloudMirroringMonitor *)self _stopSafetySyncChecks];
    }
  }
  objc_sync_exit(v5);
}

- (void)_loadCloudPersistentStore
{
  BOOL v3 = +[STPersistenceConfiguration persistentStoreDescriptionForConfigurationName:STPersistenceConfigurationNameCloud type:NSSQLiteStoreType];
  [v3 setShouldAddStoreAsynchronously:0];
  v4 = +[STLog mirroring];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Loading CloudKit mirroring persistent store and CKContainer", buf, 2u);
  }

  id v5 = objc_opt_new();
  [v5 setUseZoneWidePCS:1];
  id v6 = objc_alloc((Class)NSCloudKitMirroringDelegateOptions);
  v7 = +[CKContainer remotemanagement_mirroringContainerIdentifier];
  id v8 = [v6 initWithContainerIdentifier:v7];

  [v8 setUseDeviceToDeviceEncryption:1];
  [v8 setContainerOptions:v5];
  id v9 = [objc_alloc((Class)NSCloudKitMirroringDelegate) initWithOptions:v8];
  [v3 setOption:v9 forMirroringKey:NSPersistentStoreMirroringDelegateOptionKey];
  uint64_t v10 = [(STCloudMirroringMonitor *)self persistenceController];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100011764;
  v11[3] = &unk_1002FB738;
  v11[4] = self;
  [v10 loadPersistentStoreDescription:v3 completionHandler:v11];
}

- (void)_unloadCloudPersistentStore
{
  BOOL v3 = +[STLog mirroring];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Unloading CloudKit mirroring persistent store and CKContainer", buf, 2u);
  }

  [(STCloudMirroringMonitor *)self _unregisterForNotificationsThatTriggerCloudKitSyncs];
  v4 = [(STCloudMirroringMonitor *)self persistenceController];
  id v8 = 0;
  unsigned __int8 v5 = [v4 unloadCloudPersistentStoreWithError:&v8];
  id v6 = v8;

  if ((v5 & 1) == 0)
  {
    v7 = +[STLog mirroring];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      sub_10025B88C();
    }
  }
}

- (void)_removeCloudPersistentStore
{
  BOOL v3 = +[STLog mirroring];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Removing CloudKit mirroring persistent store and CKContainer", buf, 2u);
  }

  [(STCloudMirroringMonitor *)self _unregisterForNotificationsThatTriggerCloudKitSyncs];
  v4 = [(STCloudMirroringMonitor *)self persistenceController];
  id v8 = 0;
  unsigned __int8 v5 = [v4 removeCloudPersistentStoreWithError:&v8];
  id v6 = v8;

  if ((v5 & 1) == 0)
  {
    v7 = +[STLog mirroring];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      sub_10025B8F4();
    }
  }
}

- (void)_registerForNotificationsThatTriggerCloudKitSyncs
{
  BOOL v3 = +[STNotificationManager sharedNotificationManager];
  v4 = [(STCloudMirroringMonitor *)self _cloudKitTopicName];
  [v3 registerWithTopic:v4 delegate:self];

  unsigned __int8 v5 = +[NSNotificationCenter defaultCenter];
  id v6 = [(STCloudMirroringMonitor *)self persistenceController];
  v7 = [v6 persistentContainer];
  id v8 = [v7 persistentStoreCoordinator];
  id v9 = +[NSOperationQueue mainQueue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100011BE0;
  v11[3] = &unk_1002FB760;
  v11[4] = self;
  uint64_t v10 = [v5 addObserverForName:NSPersistentStoreRemoteChangeNotification object:v8 queue:v9 usingBlock:v11];

  [(STCloudMirroringMonitor *)self setStoreChangeNotificationToken:v10];
}

- (void)_unregisterForNotificationsThatTriggerCloudKitSyncs
{
  BOOL v3 = +[STNotificationManager sharedNotificationManager];
  v4 = [(STCloudMirroringMonitor *)self _cloudKitTopicName];
  [v3 registerWithTopic:v4 delegate:self];

  unsigned __int8 v5 = +[NSNotificationCenter defaultCenter];
  id v6 = [(STCloudMirroringMonitor *)self storeChangeNotificationToken];
  [v5 removeObserver:v6];

  [(STCloudMirroringMonitor *)self setStoreChangeNotificationToken:0];
}

- (id)_cloudKitTopicName
{
  MainBundle = CFBundleGetMainBundle();
  return +[NSString stringWithFormat:@"com.apple.icloud-container.%@", CFBundleGetIdentifier(MainBundle)];
}

- (void)_analyzeLocalChanges
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if ([(STCloudMirroringMonitor *)self isCloudKitSyncingEnabled])
  {
    BOOL v3 = [(STCloudMirroringMonitor *)self historyAnalyzerTimer];
    v4 = v3;
    if (v3)
    {
      [v3 invalidate];
      [(STCloudMirroringMonitor *)self setHistoryAnalyzerTimer:0];
    }
    unsigned __int8 v5 = [(STCloudMirroringMonitor *)self syncOperationQueue];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100011DB8;
    v6[3] = &unk_1002FB6A8;
    v6[4] = self;
    [v5 addOperationWithBlock:v6];
  }
}

- (void)_scheduleHistoryAnalyzerTimer
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  BOOL v3 = [(STCloudMirroringMonitor *)self historyAnalyzerTimer];
  if (v3)
  {
    v4 = +[STLog mirroring];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_10025BAA0();
    }

    [v3 invalidate];
  }
  else
  {
    unsigned __int8 v5 = (void *)os_transaction_create();
    [(STCloudMirroringMonitor *)self setHistoryAnalyzerTransaction:v5];

    id v6 = +[STLog mirroring];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_10025BA6C();
    }
  }
  v7 = +[NSTimer scheduledTimerWithTimeInterval:self target:"_analyzeLocalChanges" selector:0 userInfo:0 repeats:4.0];
  [(STCloudMirroringMonitor *)self setHistoryAnalyzerTimer:v7];
}

- (id)forceMirroringSync
{
  if ([(STCloudMirroringMonitor *)self isCloudKitSyncingEnabled])
  {
    BOOL v3 = +[STLog mirroring];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Triggering mirroring operation", v17, 2u);
    }

    v4 = self->_queuedSyncOperations;
    objc_sync_enter(v4);
    if ([(NSMutableSet *)self->_queuedSyncOperations count])
    {
      BOOL v5 = 0;
      id v6 = 0;
    }
    else
    {
      id v9 = [STCoreDataCloudKitMirroringSyncOperation alloc];
      uint64_t v10 = [(STCloudMirroringMonitor *)self persistenceController];
      id v6 = [(STCoreDataCloudKitMirroringSyncOperation *)v9 initWithPersistenceController:v10];

      [(NSMutableSet *)self->_queuedSyncOperations addObject:v6];
      BOOL v5 = [(NSMutableSet *)self->_executingSyncOperations count] == 0;
    }
    objc_sync_exit(v4);

    if (v6)
    {
      if (v5)
      {
        v11 = +[NSUserDefaults standardUserDefaults];
        uint64_t v12 = objc_opt_new();
        [v11 setObject:v12 forKey:@"LastSyncDate"];
      }
      [(STCoreDataCloudKitMirroringSyncOperation *)v6 addObserver:self forKeyPath:@"cancelled" options:1 context:"KVOContextSTCloudMirroringMonitor"];
      [(STCoreDataCloudKitMirroringSyncOperation *)v6 addObserver:self forKeyPath:@"executing" options:1 context:"KVOContextSTCloudMirroringMonitor"];
      [(STCoreDataCloudKitMirroringSyncOperation *)v6 addObserver:self forKeyPath:@"finished" options:1 context:"KVOContextSTCloudMirroringMonitor"];
      v13 = [(STCloudMirroringMonitor *)self syncOperationQueue];
      [v13 addOperation:v6];
    }
    else
    {
      v13 = +[STLog mirroring];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        sub_10025BAD4();
      }
    }

    uint64_t v14 = [STPromise alloc];
    v15 = +[STResult success];
    id v8 = [(STPromise *)v14 initWithResolution:v15 onQueue:&_dispatch_main_q];
  }
  else
  {
    v7 = [STPromise alloc];
    id v6 = +[STResult success];
    id v8 = [(STPromise *)v7 initWithResolution:v6 onQueue:&_dispatch_main_q];
  }

  return v8;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a6 == "KVOContextSTCloudMirroringMonitor")
  {
    if ([v10 isEqualToString:@"cancelled"])
    {
      v13 = [v12 objectForKeyedSubscript:NSKeyValueChangeNewKey];
      uint64_t v14 = +[NSNull null];

      if (v13 == v14)
      {

        v13 = 0;
      }
      -[STCloudMirroringMonitor _operation:cancelledDidChange:](self, "_operation:cancelledDidChange:", v11, [v13 BOOLValue]);
    }
    else if ([v10 isEqualToString:@"executing"])
    {
      v13 = [v12 objectForKeyedSubscript:NSKeyValueChangeNewKey];
      v15 = +[NSNull null];

      if (v13 == v15)
      {

        v13 = 0;
      }
      -[STCloudMirroringMonitor _operation:executingDidChange:](self, "_operation:executingDidChange:", v11, [v13 BOOLValue]);
    }
    else
    {
      if (![v10 isEqualToString:@"finished"]) {
        goto LABEL_16;
      }
      v13 = [v12 objectForKeyedSubscript:NSKeyValueChangeNewKey];
      v16 = +[NSNull null];

      if (v13 == v16)
      {

        v13 = 0;
      }
      -[STCloudMirroringMonitor _operation:finishedDidChange:](self, "_operation:finishedDidChange:", v11, [v13 BOOLValue]);
    }

    goto LABEL_16;
  }
  v17.receiver = self;
  v17.super_class = (Class)STCloudMirroringMonitor;
  [(STCloudMirroringMonitor *)&v17 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
LABEL_16:
}

- (void)_operation:(id)a3 cancelledDidChange:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4)
  {
    id v8 = v6;
    v7 = self->_queuedSyncOperations;
    objc_sync_enter(v7);
    [(NSMutableSet *)self->_queuedSyncOperations removeObject:v8];
    [(NSMutableSet *)self->_executingSyncOperations removeObject:v8];
    objc_sync_exit(v7);

    id v6 = v8;
  }
}

- (void)_operation:(id)a3 executingDidChange:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  id v6 = self->_queuedSyncOperations;
  objc_sync_enter(v6);
  if (v4)
  {
    [(NSMutableSet *)self->_queuedSyncOperations removeObject:v7];
    [(NSMutableSet *)self->_executingSyncOperations addObject:v7];
  }
  else
  {
    [(NSMutableSet *)self->_executingSyncOperations removeObject:v7];
  }
  objc_sync_exit(v6);
}

- (void)_operation:(id)a3 finishedDidChange:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4)
  {
    id v7 = self->_queuedSyncOperations;
    objc_sync_enter(v7);
    [(NSMutableSet *)self->_queuedSyncOperations removeObject:v6];
    [(NSMutableSet *)self->_executingSyncOperations removeObject:v6];
    objc_sync_exit(v7);

    [v6 removeObserver:self forKeyPath:@"cancelled" context:"KVOContextSTCloudMirroringMonitor"];
    [v6 removeObserver:self forKeyPath:@"executing" context:"KVOContextSTCloudMirroringMonitor"];
    [v6 removeObserver:self forKeyPath:@"finished" context:"KVOContextSTCloudMirroringMonitor"];
    id v8 = [v6 error];
    if (([v6 isCancelled] & 1) == 0
      && v8
      && [(STCloudMirroringMonitor *)self isCloudKitSyncingEnabled])
    {
      id v9 = +[STLog mirroring];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10025BB48();
      }

      if ([v8 code] == (id)101)
      {
        id v10 = +[STLog mirroring];
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          sub_10025BB08();
        }

        [(STCloudMirroringMonitor *)self _removeCloudPersistentStore];
        [(STCloudMirroringMonitor *)self _loadCloudPersistentStore];
      }
    }
  }
}

- (void)_startSafetySyncChecks
{
  BOOL v3 = +[STLog mirroring];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10025BBBC();
  }

  [(STCloudMirroringMonitor *)self _checkForNextSync];
}

- (void)_stopSafetySyncChecks
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  BOOL v3 = +[STLog mirroring];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10025BBF0();
  }

  BOOL v4 = [(STCloudMirroringMonitor *)self safetySyncTimer];
  BOOL v5 = v4;
  if (v4)
  {
    [v4 invalidate];
    [(STCloudMirroringMonitor *)self setSafetySyncTimer:0];
  }
  id v6 = +[NSUserDefaults standardUserDefaults];
  [v6 removeObjectForKey:@"LastSyncDate"];
}

- (void)_setSafetySyncTimer
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  [(STCloudMirroringMonitor *)self _nextSafetySyncInterval];
  double v4 = v3;
  BOOL v5 = [(STCloudMirroringMonitor *)self safetySyncTimer];
  id v6 = +[STLog mirroring];
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_10025BC24(v7);
    }

    [v5 invalidate];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = +[NSNumber numberWithDouble:v4];
      int v12 = 138543362;
      v13 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Scheduling safety sync timer for %{public}@ seconds from now", (uint8_t *)&v12, 0xCu);
    }
  }
  id v9 = +[NSTimer scheduledTimerWithTimeInterval:self target:"_checkForNextSync" selector:0 userInfo:0 repeats:v4];
  [(STCloudMirroringMonitor *)self setSafetySyncTimer:v9];

  if (v4 / 10.0 <= 3600.0) {
    double v10 = v4 / 10.0;
  }
  else {
    double v10 = 3600.0;
  }
  id v11 = [(STCloudMirroringMonitor *)self safetySyncTimer];
  [v11 setTolerance:v10];
}

- (void)_checkForNextSync
{
  double v3 = +[NSUserDefaults standardUserDefaults];
  double v4 = [v3 objectForKey:@"LastSyncDate"];

  unsigned int v5 = [(STCloudMirroringMonitor *)self _safetySyncNeeded];
  id v6 = +[STLog mirroring];
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v7) {
      sub_10025BCC0();
    }

    id v8 = [(STCloudMirroringMonitor *)self forceMirroringSync];
  }
  else
  {
    if (v7) {
      sub_10025BD28();
    }
  }
  [(STCloudMirroringMonitor *)self _setSafetySyncTimer];
}

- (double)_nextSafetySyncInterval
{
  uint64_t v3 = +[NSUserDefaults standardUserDefaults];
  double v4 = [(id)v3 objectForKey:@"LastSyncDate"];

  objc_opt_class();
  LOBYTE(v3) = objc_opt_isKindOfClass();
  uint64_t v5 = [(STCloudMirroringMonitor *)self _safetySyncStaleSeconds];
  uint64_t v6 = v5;
  if (v3)
  {
    [v4 timeIntervalSinceNow];
    char v8 = (v6 + (uint64_t)v7 < 0) ^ __OFADD__(v6, (uint64_t)v7);
    double v9 = (double)(v6 + (uint64_t)v7);
    if (v8) {
      double v10 = 60.0;
    }
    else {
      double v10 = v9;
    }
  }
  else
  {
    double v10 = (double)v5;
  }

  return v10;
}

- (BOOL)_safetySyncNeeded
{
  uint64_t v3 = +[NSUserDefaults standardUserDefaults];
  double v4 = [v3 objectForKey:@"LastSyncDate"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v4 timeIntervalSinceNow];
    BOOL v6 = v5 < 0.0 && -v5 > (double)[(STCloudMirroringMonitor *)self _safetySyncStaleSeconds];
  }
  else
  {
    BOOL v6 = 1;
  }

  return v6;
}

- (int64_t)_safetySyncStaleSeconds
{
  v2 = +[NSUserDefaults standardUserDefaults];
  uint64_t v3 = [v2 objectForKey:@"TestMirroringStaleSeconds"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int64_t v4 = (int64_t)[v3 integerValue];
  }
  else {
    int64_t v4 = 86400;
  }

  return v4;
}

- (void)_persistentStoreDidChange:(id)a3
{
  id v4 = a3;
  double v5 = +[STLog mirroring];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10025BD90();
  }

  BOOL v6 = [v4 userInfo];
  double v7 = [v6 objectForKeyedSubscript:NSStoreUUIDKey];

  char v8 = [(STCloudMirroringMonitor *)self persistenceController];
  double v9 = [v8 persistentContainer];
  double v10 = [v9 persistentStoreCoordinator];
  id v11 = [v10 persistentStoreForIdentifier:v7];

  int v12 = [v11 configurationName];
  if (([v12 isEqualToString:STPersistenceConfigurationNameLocal] & 1) != 0
    || ([(STCloudMirroringMonitor *)self persistenceController],
        v13 = objc_claimAutoreleasedReturnValue(),
        [v13 localStore],
        uint64_t v14 = objc_claimAutoreleasedReturnValue(),
        v14,
        v13,
        v11 == v14))
  {
    [(STCloudMirroringMonitor *)self _scheduleHistoryAnalyzerTimer];
  }
  else if (([v12 isEqualToString:STPersistenceConfigurationNameCloud] & 1) == 0)
  {
    v15 = [(STCloudMirroringMonitor *)self persistenceController];
    v16 = [v15 cloudStore];

    if (v11 != v16)
    {
      objc_super v17 = +[STLog mirroring];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v18 = [v11 configurationName];
        int v19 = 138412546;
        v20 = v11;
        __int16 v21 = 2112;
        v22 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Notification from unknown store %@ named %@", (uint8_t *)&v19, 0x16u);
      }
    }
  }
}

- (void)receivedNotification:(id)a3
{
  id v4 = +[STLog mirroring];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10025BDF8();
  }

  id v5 = [(STCloudMirroringMonitor *)self forceMirroringSync];
}

- (void)receivedToken:(id)a3
{
  uint64_t v3 = +[STLog mirroring];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10025BE2C();
  }
}

- (STDaemonPersistenceController)persistenceController
{
  return self->_persistenceController;
}

- (NSTimer)historyAnalyzerTimer
{
  return self->_historyAnalyzerTimer;
}

- (void)setHistoryAnalyzerTimer:(id)a3
{
}

- (OS_os_transaction)historyAnalyzerTransaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 56, 1);
}

- (void)setHistoryAnalyzerTransaction:(id)a3
{
}

- (NSTimer)safetySyncTimer
{
  return self->_safetySyncTimer;
}

- (void)setSafetySyncTimer:(id)a3
{
}

- (NSOperationQueue)syncOperationQueue
{
  return self->_syncOperationQueue;
}

- (void)setSyncOperationQueue:(id)a3
{
}

- (id)storeChangeNotificationToken
{
  return self->_storeChangeNotificationToken;
}

- (void)setStoreChangeNotificationToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_storeChangeNotificationToken, 0);
  objc_storeStrong((id *)&self->_syncOperationQueue, 0);
  objc_storeStrong((id *)&self->_safetySyncTimer, 0);
  objc_storeStrong((id *)&self->_historyAnalyzerTransaction, 0);
  objc_storeStrong((id *)&self->_historyAnalyzerTimer, 0);
  objc_storeStrong((id *)&self->_persistenceController, 0);
  objc_storeStrong((id *)&self->_executingSyncOperations, 0);
  objc_storeStrong((id *)&self->_queuedSyncOperations, 0);
  objc_storeStrong((id *)&self->_syncingEnabledLock, 0);
}

@end