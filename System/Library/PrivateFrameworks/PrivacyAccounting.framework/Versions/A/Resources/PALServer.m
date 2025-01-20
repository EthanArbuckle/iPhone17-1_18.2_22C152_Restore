@interface PALServer
- (BMStoreConfig)storeConfig;
- (BOOL)canChangeTestingSettingsForConnection:(id)a3;
- (BOOL)canPruneEventsForConnection:(id)a3 withError:(id *)a4;
- (BOOL)canReadEventsForConnection:(id)a3;
- (BOOL)canToggleLoggingEnabledForConnection:(id)a3;
- (BOOL)canWriteEvent:(id)a3 forConnection:(id)a4 withError:(id *)a5;
- (BOOL)isDeviceUnlocked;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)logAccess:(id)a3 error:(id *)a4;
- (BOOL)preflight;
- (BOOL)runPreflightTask:(int64_t)a3 error:(id *)a4;
- (NSArray)allStreams;
- (NSSet)sessions;
- (NSString)enablementChangedNotificationName;
- (NSXPCListener)listener;
- (OS_dispatch_queue)queue;
- (OS_os_log)log;
- (PALAccessorResolver)accessorResolver;
- (PALPaths)paths;
- (PALServer)initWithListener:(id)a3 maxStoreSize:(unint64_t)a4;
- (PALServer)initWithListener:(id)a3 paths:(id)a4 settings:(id)a5 maxStoreSize:(unint64_t)a6;
- (PALServerDelegate)delegate;
- (PALSettings)settings;
- (double)finalizeAllIncompleteAccessIntervalsSince:(double)a3;
- (id)publisherForAllSince:(double)a3;
- (id)streamFor:(Class)a3;
- (void)_pruneEventsMatchingPredicate:(id)a3 withCancellationToken:(id)a4 completion:(id)a5;
- (void)addSession:(id)a3;
- (void)applicationDidUninstall:(id)a3;
- (void)dealloc;
- (void)disableLogging;
- (void)enableLogging;
- (void)exportToFileHandle:(id)a3 completion:(id)a4;
- (void)gatherAndSendDailyAnalyticsWithCancellationToken:(id)a3 completion:(id)a4;
- (void)observeAppUninstallsWithAppUninstallObserver:(id)a3;
- (void)process:(id)a3 didUpdateFromPreviousState:(id)a4 toState:(id)a5;
- (void)pruneEventsFromAccessor:(id)a3 withCancellationToken:(id)a4 completion:(id)a5;
- (void)pruneEventsFromStartTime:(double)a3 toEndTime:(double)a4 withCancellationToken:(id)a5 completion:(id)a6;
- (void)removeSession:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEnablementChangedNotificationName:(id)a3;
- (void)updateProcessMonitorConfiguration;
@end

@implementation PALServer

- (PALServer)initWithListener:(id)a3 maxStoreSize:(unint64_t)a4
{
  id v6 = a3;
  v7 = [PALPaths alloc];
  v8 = +[PALPaths defaultRootDirectory];
  v9 = [(PALPaths *)v7 initWithRootDirectory:v8];

  v10 = +[PALSettings sharedSettings];
  v11 = [(PALServer *)self initWithListener:v6 paths:v9 settings:v10 maxStoreSize:a4];

  return v11;
}

- (PALServer)initWithListener:(id)a3 paths:(id)a4 settings:(id)a5 maxStoreSize:(unint64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v42.receiver = self;
  v42.super_class = (Class)PALServer;
  v14 = [(PALServer *)&v42 init];
  if (v14)
  {
    os_log_t v15 = os_log_create("com.apple.PrivacyAccounting", "PALServer");
    log = v14->_log;
    v14->_log = (OS_os_log *)v15;

    PARegisterUserInfoValueProviderForPAErrorDomain();
    v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v18 = dispatch_queue_create("com.apple.privacyaccounting.server", v17);
    serverQueue = v14->_serverQueue;
    v14->_serverQueue = (OS_dispatch_queue *)v18;

    [v11 _setQueue:v14->_serverQueue];
    [v11 setDelegate:v14];
    objc_storeStrong((id *)&v14->_listener, a3);
    objc_storeStrong((id *)&v14->_paths, a4);
    v20 = [(PALPaths *)v14->_paths biomeDirectory];
    v21 = (BMStoreConfig *)+[BMStoreConfig newPrivateStreamDefaultConfigurationWithStoreBasePath:v20 protectionClass:2];
    storeConfig = v14->_storeConfig;
    v14->_storeConfig = v21;

    objc_storeStrong((id *)&v14->_settings, a5);
    id v23 = [objc_alloc((Class)BMPruningPolicy) initPruneOnAccess:1 filterByAgeOnRead:0 maxAge:a6 >> 2 maxStreamSize:0.0];
    [(BMStoreConfig *)v14->_storeConfig setPruningPolicy:v23];
    v24 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v25 = dispatch_queue_create("com.apple.privacyaccounting.sessions", v24);
    sessionsQueue = v14->_sessionsQueue;
    v14->_sessionsQueue = (OS_dispatch_queue *)v25;

    uint64_t v27 = +[NSMutableSet set];
    sessions = v14->_sessions;
    v14->_sessions = (NSMutableSet *)v27;

    v29 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v30 = dispatch_queue_create("com.apple.privacyaccounting.background", v29);
    backgroundQueue = v14->_backgroundQueue;
    v14->_backgroundQueue = (OS_dispatch_queue *)v30;

    v32 = [PALAccessorResolver alloc];
    settings = v14->_settings;
    v34 = objc_opt_new();
    v35 = [[PALApplicationMetadataResolver alloc] initWithSettings:v14->_settings];
    v36 = [(PALAccessorResolver *)v32 initWithSettings:settings tccAttributionResolver:v34 applicationMetadataResolver:v35];
    accessorResolver = v14->_accessorResolver;
    v14->_accessorResolver = v36;

    v14->_didRunPreflightTasks = 0;
    v14->_keybagChangeNotificationToken = -1;
    uint64_t v38 = +[RBSProcessMonitor monitor];
    processMonitor = v14->_processMonitor;
    v14->_processMonitor = (RBSProcessMonitor *)v38;

    enablementChangedNotificationName = v14->_enablementChangedNotificationName;
    v14->_enablementChangedNotificationName = (NSString *)@"com.apple.PrivacyAccounting.toggled";
  }
  return v14;
}

- (OS_dispatch_queue)queue
{
  return self->_serverQueue;
}

- (void)observeAppUninstallsWithAppUninstallObserver:(id)a3
{
  objc_storeStrong((id *)&self->_appUninstallObserver, a3);
  id v5 = a3;
  [v5 setDelegate:self];
  [v5 startObserving];
}

- (BOOL)canReadEventsForConnection:(id)a3
{
  return sub_10000AC50(a3, @"com.apple.private.privacy.accounting.read");
}

- (BOOL)canWriteEvent:(id)a3 forConnection:(id)a4 withError:(id *)a5
{
  unsigned __int8 v6 = sub_10000AC50(a4, @"com.apple.private.privacy.accounting.write");
  BOOL v7 = v6;
  if (a5 && (v6 & 1) == 0)
  {
    CFStringRef v10 = @"PAMissingEntitlement";
    CFStringRef v11 = @"com.apple.private.privacy.accounting.write";
    v8 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
    *a5 = +[NSError errorWithDomain:@"PAErrorDomain" code:9 userInfo:v8];
  }
  return v7;
}

- (BOOL)canPruneEventsForConnection:(id)a3 withError:(id *)a4
{
  unsigned __int8 v5 = sub_10000AC50(a3, @"com.apple.private.privacy.accounting.prune");
  BOOL v6 = v5;
  if (a4 && (v5 & 1) == 0)
  {
    CFStringRef v9 = @"PAMissingEntitlement";
    CFStringRef v10 = @"com.apple.private.privacy.accounting.prune";
    BOOL v7 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
    *a4 = +[NSError errorWithDomain:@"PAErrorDomain" code:9 userInfo:v7];
  }
  return v6;
}

- (BOOL)canToggleLoggingEnabledForConnection:(id)a3
{
  return sub_10000AC50(a3, @"com.apple.private.privacy.accounting.toggle");
}

- (BOOL)canChangeTestingSettingsForConnection:(id)a3
{
  return sub_10000AC50(a3, @"com.apple.private.privacy.accounting.testing.settings");
}

- (BOOL)isDeviceUnlocked
{
  int v2 = MKBGetDeviceLockState();
  return !v2 || v2 == 3;
}

- (BOOL)preflight
{
  v3 = (void *)os_transaction_create();
  if (self->_didRunPreflightTasks)
  {
    BOOL v4 = 1;
  }
  else
  {
    if ([(PALServer *)self isDeviceUnlocked])
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Device unlocked; running preflight tasks",
          (uint8_t *)buf,
          2u);
      }
      uint64_t v6 = 0;
      while ([(PALServer *)self runPreflightTask:kPALAllPreflightTasks[v6] error:0])
      {
        if (++v6 == 3)
        {
          notify_cancel(self->_keybagChangeNotificationToken);
          BOOL v4 = 1;
          self->_didRunPreflightTasks = 1;
          goto LABEL_16;
        }
      }
    }
    else if (self->_keybagChangeNotificationToken == -1)
    {
      objc_initWeak(buf, self);
      BOOL v7 = (const char *)kMobileKeyBagLockStatusNotifyToken;
      serverQueue = self->_serverQueue;
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_10000B090;
      handler[3] = &unk_100018A80;
      objc_copyWeak(&v13, buf);
      uint32_t v9 = notify_register_dispatch(v7, &self->_keybagChangeNotificationToken, serverQueue, handler);
      if (v9)
      {
        CFStringRef v10 = self->_log;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          sub_10000DE6C(v9, v10);
        }
      }
      objc_destroyWeak(&v13);
      objc_destroyWeak(buf);
    }
    BOOL v4 = 0;
  }
LABEL_16:

  return v4;
}

- (BOOL)runPreflightTask:(int64_t)a3 error:(id *)a4
{
  BOOL v7 = [(PALServer *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    v8 = [(PALServer *)self delegate];
    unsigned int v9 = [v8 server:self shouldRunPreflightTask:a3];

    if (!v9) {
      goto LABEL_21;
    }
  }
  else
  {
  }
  switch(a3)
  {
    case 2:
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = log;
        v14 = [(PALServer *)self settings];
        [v14 lastPreflightCheck];
        int v30 = 134217984;
        double v31 = v15;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Finalizing incomplete access intervals; startTime=%f",
          (uint8_t *)&v30,
          0xCu);
      }
      v16 = [(PALServer *)self settings];
      [v16 lastPreflightCheck];
      -[PALServer finalizeAllIncompleteAccessIntervalsSince:](self, "finalizeAllIncompleteAccessIntervalsSince:");
      double v18 = v17;

      v19 = [(PALServer *)self settings];
      [v19 lastPreflightCheck];
      double v21 = v20;

      if (v21 == v18) {
        goto LABEL_21;
      }
      v22 = self->_log;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        int v30 = 134217984;
        double v31 = v18;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Updating last successful preflight check; timestamp=%f",
          (uint8_t *)&v30,
          0xCu);
      }
      id v23 = [(PALServer *)self settings];
      [v23 setLastPreflightCheck:v18];
      goto LABEL_20;
    case 1:
      v24 = self->_log;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        paths = self->_paths;
        v26 = v24;
        double v27 = [(PALPaths *)paths settingsFile];
        int v30 = 138543362;
        double v31 = v27;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Migrating from legacy settings file=%{public}@", (uint8_t *)&v30, 0xCu);
      }
      settings = self->_settings;
      id v23 = [(PALPaths *)self->_paths settingsFile];
      [(PALSettings *)settings migrateSettingsFromFile:v23];
LABEL_20:

LABEL_21:
      unsigned __int8 v10 = 1;
      return v10 & 1;
    case 0:
      CFStringRef v11 = self->_log;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v30) = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Creating storage directories", (uint8_t *)&v30, 2u);
      }
      unsigned __int8 v10 = [(PALPaths *)self->_paths createDirectories:a4];
      break;
  }
  return v10 & 1;
}

- (id)publisherForAllSince:(double)a3
{
  unsigned __int8 v5 = +[NSMutableArray array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = [(PALServer *)self allStreams];
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        CFStringRef v11 = [*(id *)(*((void *)&v14 + 1) + 8 * i) publisherFromStartTime:a3];
        [v5 addObject:v11];
      }
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  id v12 = [objc_alloc((Class)BPSOrderedMerge) initWithPublishers:v5 comparator:&stru_100018AC0];

  return v12;
}

- (double)finalizeAllIncompleteAccessIntervalsSince:(double)a3
{
  unsigned __int8 v5 = -[PALServer publisherForAllSince:](self, "publisherForAllSince:");
  uint64_t v18 = 0;
  v19 = (double *)&v18;
  uint64_t v20 = 0x2020000000;
  double v21 = a3;
  uint64_t v14 = 0;
  long long v15 = &v14;
  uint64_t v16 = 0x2020000000;
  int v17 = 0;
  uint64_t v6 = +[PAAccessPublisherPipelines ongoingAccessRecordsFromPublisher:v5];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000B7B0;
  v13[3] = &unk_100018AE8;
  v13[4] = self;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000B814;
  v12[3] = &unk_100018B10;
  v12[4] = self;
  v12[5] = &v14;
  v12[6] = &v18;
  id v7 = [v6 sinkWithCompletion:v13 receiveInput:v12];

  id v8 = [(PALServer *)self log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = *((_DWORD *)v15 + 6);
    *(_DWORD *)buf = 67109120;
    int v23 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Finalized %d incomplete intervals", buf, 8u);
  }

  double v10 = v19[3];
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);

  return v10;
}

- (void)enableLogging
{
  [(PALSettings *)self->_settings setLoggingEnabled:1];
  id v3 = [(PALServer *)self enablementChangedNotificationName];
  notify_post((const char *)[v3 UTF8String]);

  BOOL v4 = [(PALServer *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    uint64_t v6 = [(PALServer *)self delegate];
    [v6 server:self didSetLoggingEnabled:1];
  }
  id v7 = [(PALServer *)self log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Logging Enabled", v8, 2u);
  }
}

- (void)disableLogging
{
  [(PALSettings *)self->_settings setLoggingEnabled:0];
  accessEventStream = self->_accessEventStream;
  self->_accessEventStream = 0;

  tccAccessEventStream = self->_tccAccessEventStream;
  self->_tccAccessEventStream = 0;

  locationAccessEventStream = self->_locationAccessEventStream;
  self->_locationAccessEventStream = 0;

  replayKitAccessEventStream = self->_replayKitAccessEventStream;
  self->_replayKitAccessEventStream = 0;

  outOfProcessPickerAccessEventStream = self->_outOfProcessPickerAccessEventStream;
  self->_outOfProcessPickerAccessEventStream = 0;

  [(PALPaths *)self->_paths removeBiomeDirectory];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = self->_sessions;
  id v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v14 = [v13 queue];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10000BC90;
        block[3] = &unk_100018B38;
        block[4] = v13;
        dispatch_async(v14, block);
      }
      id v10 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v10);
  }

  id v15 = [(PALServer *)self enablementChangedNotificationName];
  notify_post((const char *)[v15 UTF8String]);

  uint64_t v16 = [(PALServer *)self delegate];
  char v17 = objc_opt_respondsToSelector();

  if (v17)
  {
    uint64_t v18 = [(PALServer *)self delegate];
    [v18 server:self didSetLoggingEnabled:0];
  }
  v19 = [(PALServer *)self log];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v20 = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Disabled logging and deleted all data", v20, 2u);
  }
}

- (id)streamFor:(Class)a3
{
  if ((Class)objc_opt_class() == a3)
  {
    uint64_t v6 = 40;
  }
  else if ((Class)objc_opt_class() == a3)
  {
    uint64_t v6 = 48;
  }
  else if ((Class)objc_opt_class() == a3)
  {
    uint64_t v6 = 56;
  }
  else if ((Class)objc_opt_class() == a3)
  {
    uint64_t v6 = 64;
  }
  else
  {
    if ((Class)objc_opt_class() != a3)
    {
      id v5 = 0;
      goto LABEL_15;
    }
    uint64_t v6 = 72;
  }
  id v7 = *(Class *)((char *)&self->super.isa + v6);
  if (!v7)
  {
    id v8 = objc_alloc((Class)BMStoreStream);
    id v9 = [(objc_class *)a3 valueForKey:@"eventStreamIdentifier"];
    id v10 = (objc_class *)[v8 initWithPrivateStreamIdentifier:v9 storeConfig:self->_storeConfig];
    uint64_t v11 = *(Class *)((char *)&self->super.isa + v6);
    *(Class *)((char *)&self->super.isa + v6) = v10;

    id v7 = *(Class *)((char *)&self->super.isa + v6);
  }
  id v5 = v7;
LABEL_15:

  return v5;
}

- (NSArray)allStreams
{
  id v3 = +[PAAccess allAccessClasses];
  BOOL v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);
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
        id v10 = -[PALServer streamFor:](self, "streamFor:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        [v4 addObject:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  id v11 = [v4 copy];

  return (NSArray *)v11;
}

- (BOOL)logAccess:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(PALServer *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v8 = [(PALServer *)self delegate];
    unsigned int v9 = [v8 server:self shouldLogAccess:v6 error:a4];

    if (!v9) {
      goto LABEL_24;
    }
  }
  else
  {
  }
  if (![(PALSettings *)self->_settings loggingEnabled])
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
    {
      sub_10000E0B4();
      if (a4) {
        goto LABEL_12;
      }
    }
    else if (a4)
    {
LABEL_12:
      +[NSError errorWithDomain:@"PAErrorDomain" code:2 userInfo:0];
      BOOL v12 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_25;
    }
LABEL_24:
    BOOL v12 = 0;
    goto LABEL_25;
  }
  settings = self->_settings;
  id v11 = [v6 category];
  LODWORD(settings) = [(PALSettings *)settings persistenceEnabledForCategory:v11];

  if (!settings)
  {
LABEL_9:
    BOOL v12 = 1;
    goto LABEL_25;
  }
  if (![(PALSettings *)self->_settings assetIdentifiersPersistenceEnabled])
  {
    if ([v6 kind] == (id)4) {
      goto LABEL_9;
    }
    long long v13 = [v6 assetIdentifiers];
    id v14 = [v13 count];

    if (v14)
    {
      long long v15 = +[NSSet set];
      id v16 = [v6 copyWithNewAssetIdentifiers:v15];

      id v6 = v16;
    }
  }
  char v17 = [(PALServer *)self streamFor:objc_opt_class()];
  uint64_t v18 = v17;
  BOOL v12 = v17 != 0;
  if (v17)
  {
    v19 = [v17 source];
    [v19 sendEvent:v6];

    uint64_t v20 = [(PALServer *)self delegate];
    char v21 = objc_opt_respondsToSelector();

    if (v21)
    {
      long long v22 = [(PALServer *)self delegate];
      [v22 server:self didLogAccess:v6];
    }
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
      sub_10000E04C();
    }
  }
  else if (a4)
  {
    *a4 = +[NSError errorWithDomain:@"PAErrorDomain" code:6 userInfo:0];
  }

LABEL_25:
  return v12;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  BOOL v6 = [(PALServer *)self preflight];
  if (v6)
  {
    id v7 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___PASessionProtocol];
    [v5 setExportedInterface:v7];
    uint64_t v8 = [[PALSession alloc] initWithServer:self targetQueue:self->_sessionsQueue connection:v5];
    [v5 setExportedObject:v8];
    [(PALServer *)self addSession:v8];
    [v5 resume];
  }
  else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG))
  {
    sub_10000E11C();
  }

  return v6;
}

- (void)addSession:(id)a3
{
  [(NSMutableSet *)self->_sessions addObject:a3];

  [(PALServer *)self updateProcessMonitorConfiguration];
}

- (void)removeSession:(id)a3
{
  [(NSMutableSet *)self->_sessions removeObject:a3];

  [(PALServer *)self updateProcessMonitorConfiguration];
}

- (void)updateProcessMonitorConfiguration
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serverQueue);
  id v3 = +[NSMutableArray arrayWithCapacity:[(NSMutableSet *)self->_sessions count]];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  BOOL v4 = self->_sessions;
  id v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        unsigned int v9 = [*(id *)(*((void *)&v17 + 1) + 8 * (void)v8) connection];
        id v10 = +[RBSProcessIdentifier identifierWithPid:](RBSProcessIdentifier, "identifierWithPid:", [v9 processIdentifier]);

        if (v10)
        {
          id v11 = +[RBSProcessPredicate predicateMatchingIdentifier:v10];
          [v3 addObject:v11];
        }
        uint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }

  processMonitor = self->_processMonitor;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10000C504;
  v14[3] = &unk_100018B88;
  id v15 = v3;
  id v16 = self;
  id v13 = v3;
  [(RBSProcessMonitor *)processMonitor updateConfiguration:v14];
}

- (void)process:(id)a3 didUpdateFromPreviousState:(id)a4 toState:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([a4 taskState] != 3 && objc_msgSend(v9, "taskState") == 3)
  {
    objc_initWeak(&location, self);
    serverQueue = self->_serverQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000C7B4;
    block[3] = &unk_100018BB0;
    objc_copyWeak(&v13, &location);
    id v12 = v8;
    dispatch_async(serverQueue, block);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

- (void)_pruneEventsMatchingPredicate:(id)a3 withCancellationToken:(id)a4 completion:(id)a5
{
  id v39 = a3;
  id v38 = a4;
  v35 = (void (**)(id, void *))a5;
  v37 = self;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serverQueue);
  v34 = (void *)os_transaction_create();
  v36 = +[NSMutableArray array];
  uint64_t v57 = 0;
  v58 = &v57;
  uint64_t v59 = 0x2020000000;
  int v60 = 0;
  id v8 = +[NSMutableSet set];
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v9 = [(PALServer *)self allStreams];
  id v10 = [v9 countByEnumeratingWithState:&v53 objects:v71 count:16];
  if (v10)
  {
    uint64_t v12 = *(void *)v54;
    *(void *)&long long v11 = 138543618;
    long long v33 = v11;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v54 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        *(void *)v68 = 0;
        *(void *)&long long v69 = v68;
        *((void *)&v69 + 1) = 0x2020000000;
        char v70 = 0;
        id v52 = 0;
        v46[0] = _NSConcreteStackBlock;
        v46[1] = 3221225472;
        v46[2] = sub_10000D0B8;
        v46[3] = &unk_100018BD8;
        id v47 = v38;
        v50 = v68;
        id v48 = v39;
        id v49 = v8;
        v51 = &v57;
        unsigned __int8 v15 = [v14 pruneEventsWithError:&v52 predicateBlock:v46];
        id v16 = v52;
        if ((v15 & 1) == 0)
        {
          long long v17 = [(PALServer *)self log];
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            long long v18 = [v14 identifier];
            *(_DWORD *)buf = v33;
            v65 = v18;
            __int16 v66 = 2114;
            id v67 = v16;
            _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Pruning failed for stream %{public}@ with error: %{public}@", buf, 0x16u);
          }
          [v36 addObject:v16];
        }
        if (*(unsigned char *)(v69 + 24))
        {
          long long v19 = +[NSError errorWithDomain:@"PAErrorDomain" code:15 userInfo:0];
          [v36 addObject:v19];

          _Block_object_dispose(v68, 8);
          goto LABEL_15;
        }

        _Block_object_dispose(v68, 8);
      }
      id v10 = [v9 countByEnumeratingWithState:&v53 objects:v71 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_15:

  long long v20 = [(PALServer *)self log];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    int v21 = *((_DWORD *)v58 + 6);
    *(_DWORD *)v68 = 67109378;
    *(_DWORD *)&v68[4] = v21;
    LOWORD(v69) = 2112;
    *(void *)((char *)&v69 + 2) = v39;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Pruned %d events matching predicate: %@", v68, 0x12u);
  }

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v22 = self->_sessions;
  id v23 = [(NSMutableSet *)v22 countByEnumeratingWithState:&v42 objects:v63 count:16];
  if (v23)
  {
    uint64_t v24 = *(void *)v43;
    id v9 = &unk_100018710;
    do
    {
      for (j = 0; j != v23; j = (char *)j + 1)
      {
        if (*(void *)v43 != v24) {
          objc_enumerationMutation(v22);
        }
        v26 = *(void **)(*((void *)&v42 + 1) + 8 * (void)j);
        double v27 = objc_msgSend(v26, "queue", v33);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10000D1F4;
        block[3] = &unk_100018710;
        void block[4] = v26;
        id v41 = v8;
        dispatch_async(v27, block);
      }
      id v23 = [(NSMutableSet *)v22 countByEnumeratingWithState:&v42 objects:v63 count:16];
    }
    while (v23);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&v37->_delegate);
  char v29 = objc_opt_respondsToSelector();

  if (v29)
  {
    id v30 = objc_loadWeakRetained((id *)&v37->_delegate);
    [v30 serverDidPruneAccesses:v37];
  }
  id v31 = objc_msgSend(v36, "count", v33);
  if (v31)
  {
    NSErrorUserInfoKey v61 = NSMultipleUnderlyingErrorsKey;
    v62 = v36;
    id v9 = +[NSDictionary dictionaryWithObjects:&v62 forKeys:&v61 count:1];
    v32 = +[NSError errorWithDomain:@"PAErrorDomain" code:8 userInfo:v9];
  }
  else
  {
    v32 = 0;
  }
  v35[2](v35, v32);
  if (v31)
  {
  }
  _Block_object_dispose(&v57, 8);
}

- (void)pruneEventsFromStartTime:(double)a3 toEndTime:(double)a4 withCancellationToken:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  uint64_t v12 = +[NSNumber numberWithDouble:a3];
  v16[0] = v12;
  id v13 = +[NSNumber numberWithDouble:a4];
  v16[1] = v13;
  id v14 = +[NSArray arrayWithObjects:v16 count:2];
  unsigned __int8 v15 = +[NSPredicate predicateWithFormat:@"timestamp BETWEEN %@", v14];

  [(PALServer *)self _pruneEventsMatchingPredicate:v15 withCancellationToken:v11 completion:v10];
}

- (void)pruneEventsFromAccessor:(id)a3 withCancellationToken:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  +[NSPredicate predicateWithFormat:@"eventBody.accessor = %@", a3];
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [(PALServer *)self _pruneEventsMatchingPredicate:v10 withCancellationToken:v9 completion:v8];
}

- (void)applicationDidUninstall:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000D474;
  v4[3] = &unk_100018C00;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(PALServer *)v5 pruneEventsFromAccessor:v3 withCancellationToken:0 completion:v4];
}

- (void)exportToFileHandle:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serverQueue);
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = sub_10000D720;
  v25[4] = sub_10000D730;
  id v26 = (id)os_transaction_create();
  id v8 = [(PALServer *)self publisherForAllSince:0.0];
  id v9 = +[PAAccessPublisherPipelines accessPublisherWithoutUnknownCategoryAccesses:v8];

  [(PALAccessorResolver *)self->_accessorResolver applicationMetadataResolver];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10000D738;
  v23[3] = &unk_100018C28;
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v24 = v10;
  id v11 = objc_retainBlock(v23);
  uint64_t v12 = +[PAAccessPublisherPipelines accessPublisherWithoutHiddenOrMissingApps:v9 withBundleLookup:v11];

  backgroundQueue = self->_backgroundQueue;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10000D744;
  v17[3] = &unk_100018C50;
  id v18 = v6;
  long long v19 = self;
  id v20 = v12;
  id v21 = v7;
  long long v22 = v25;
  id v14 = v12;
  id v15 = v7;
  id v16 = v6;
  dispatch_async(backgroundQueue, v17);

  _Block_object_dispose(v25, 8);
}

- (void)gatherAndSendDailyAnalyticsWithCancellationToken:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serverQueue);
  if (AnalyticsIsEventUsed())
  {
    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x3032000000;
    v17[3] = sub_10000D720;
    void v17[4] = sub_10000D730;
    id v18 = (id)os_transaction_create();
    id v8 = [(PALServer *)self publisherForAllSince:0.0];
    backgroundQueue = self->_backgroundQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000DA8C;
    block[3] = &unk_100018CA0;
    void block[4] = self;
    id v13 = v8;
    id v14 = v6;
    id v15 = v7;
    id v16 = v17;
    id v10 = v8;
    dispatch_async(backgroundQueue, block);

    _Block_object_dispose(v17, 8);
  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG)) {
      sub_10000E2DC(log);
    }
    (*((void (**)(id, uint64_t))v7 + 2))(v7, 1);
  }
}

- (void)dealloc
{
  notify_cancel(self->_keybagChangeNotificationToken);
  [(RBSProcessMonitor *)self->_processMonitor invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PALServer;
  [(PALServer *)&v3 dealloc];
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (PALPaths)paths
{
  return self->_paths;
}

- (BMStoreConfig)storeConfig
{
  return self->_storeConfig;
}

- (PALSettings)settings
{
  return self->_settings;
}

- (OS_os_log)log
{
  return self->_log;
}

- (PALAccessorResolver)accessorResolver
{
  return self->_accessorResolver;
}

- (NSString)enablementChangedNotificationName
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (void)setEnablementChangedNotificationName:(id)a3
{
}

- (PALServerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PALServerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSSet)sessions
{
  return &self->_sessions->super;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_enablementChangedNotificationName, 0);
  objc_storeStrong((id *)&self->_accessorResolver, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_storeConfig, 0);
  objc_storeStrong((id *)&self->_paths, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_processMonitor, 0);
  objc_storeStrong((id *)&self->_appUninstallObserver, 0);
  objc_storeStrong((id *)&self->_outOfProcessPickerAccessEventStream, 0);
  objc_storeStrong((id *)&self->_replayKitAccessEventStream, 0);
  objc_storeStrong((id *)&self->_locationAccessEventStream, 0);
  objc_storeStrong((id *)&self->_tccAccessEventStream, 0);
  objc_storeStrong((id *)&self->_accessEventStream, 0);
  objc_storeStrong((id *)&self->_backgroundQueue, 0);
  objc_storeStrong((id *)&self->_sessions, 0);
  objc_storeStrong((id *)&self->_sessionsQueue, 0);

  objc_storeStrong((id *)&self->_serverQueue, 0);
}

@end