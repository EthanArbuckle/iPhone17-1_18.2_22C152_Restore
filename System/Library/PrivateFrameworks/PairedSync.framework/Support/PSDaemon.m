@interface PSDaemon
+ (id)sharedInstance;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)shouldAcceptNewClientConnection:(id)a3;
- (BOOL)shouldAcceptNewProgressConnection:(id)a3;
- (BOOL)shouldAcceptNewToolConnection:(id)a3;
- (BOOL)shouldRelaunch;
- (PSDaemon)init;
- (void)_acquireStayAliveTransaction;
- (void)_clearStayAliveTransaction;
- (void)_registerForNotifications;
- (void)addLoggersIfNeeded;
- (void)run;
- (void)setShouldRelaunch:(BOOL)a3;
- (void)sigTermHandler;
- (void)syncInitiatorStateChangedTo:(unint64_t)a3;
@end

@implementation PSDaemon

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000E628;
  block[3] = &unk_10002C778;
  block[4] = a1;
  if (qword_1000384D0 != -1) {
    dispatch_once(&qword_1000384D0, block);
  }
  v2 = (void *)qword_1000384C8;

  return v2;
}

- (PSDaemon)init
{
  v27.receiver = self;
  v27.super_class = (Class)PSDaemon;
  v2 = [(PSDaemon *)&v27 init];
  v3 = v2;
  if (v2)
  {
    v2->_stayAliveTransactionLock._os_unfair_lock_opaque = 0;
    id v4 = +[PSDSyncInitiator sharedSyncInitiator];
    uint64_t v5 = objc_opt_new();
    syncRestrictionNotifier = v3->_syncRestrictionNotifier;
    v3->_syncRestrictionNotifier = (PSDSyncRestrictionNotifier *)v5;

    [(PSDaemon *)v3 addLoggersIfNeeded];
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.pairedsyncd.notificationq", v7);
    notificationQueue = v3->_notificationQueue;
    v3->_notificationQueue = (OS_dispatch_queue *)v8;

    [(PSDaemon *)v3 _registerForNotifications];
    v10 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.pairedsyncd.tool"];
    toolListener = v3->_toolListener;
    v3->_toolListener = v10;

    [(NSXPCListener *)v3->_toolListener setDelegate:v3];
    [(NSXPCListener *)v3->_toolListener resume];
    v12 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.pairedsyncd.connection"];
    clientListener = v3->_clientListener;
    v3->_clientListener = v12;

    [(NSXPCListener *)v3->_clientListener setDelegate:v3];
    [(NSXPCListener *)v3->_clientListener resume];
    id v14 = +[PSDSyncStateManager sharedSyncStateManager];
    v15 = objc_alloc_init(PSDWatchSyncStateObserver);
    watchSyncStateObserver = v3->_watchSyncStateObserver;
    v3->_watchSyncStateObserver = v15;

    v17 = objc_alloc_init(PSDSwitchAssertionManager);
    switchAssertionManager = v3->_switchAssertionManager;
    v3->_switchAssertionManager = v17;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, PSYDaemonDidLaunchDarwinNotification, 0, 0, 1u);
    v20 = +[PSDSyncInitiator sharedSyncInitiator];
    [v20 resume];

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000E8AC;
    block[3] = &unk_10002C840;
    v21 = v3;
    v26 = v21;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    id v22 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.pairedsyncd.progress"];
    id v23 = v21[2];
    v21[2] = v22;

    [v21[2] setDelegate:v21];
    [v21[2] resume];
  }
  return v3;
}

- (void)run
{
  id v2 = +[NSRunLoop mainRunLoop];
  [v2 run];
}

- (void)_acquireStayAliveTransaction
{
  p_stayAliveTransactionLock = &self->_stayAliveTransactionLock;
  os_unfair_lock_lock(&self->_stayAliveTransactionLock);
  id v4 = (OS_os_transaction *)os_transaction_create();
  syncingStayAliveTransaction = self->_syncingStayAliveTransaction;
  self->_syncingStayAliveTransaction = v4;

  os_unfair_lock_unlock(p_stayAliveTransactionLock);
}

- (void)_clearStayAliveTransaction
{
  p_stayAliveTransactionLock = &self->_stayAliveTransactionLock;
  os_unfair_lock_lock(&self->_stayAliveTransactionLock);
  syncingStayAliveTransaction = self->_syncingStayAliveTransaction;
  self->_syncingStayAliveTransaction = 0;

  os_unfair_lock_unlock(p_stayAliveTransactionLock);
}

- (void)setShouldRelaunch:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = psd_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    v7 = psd_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v8 = @"NO";
      if (v3) {
        CFStringRef v8 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      CFStringRef v13 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "PSDaemon setting shouldRelaunch=%@", buf, 0xCu);
    }
  }
  notificationQueue = self->_notificationQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000EB30;
  v10[3] = &unk_10002CB18;
  v10[4] = self;
  BOOL v11 = v3;
  dispatch_sync((dispatch_queue_t)notificationQueue, v10);
}

- (BOOL)shouldRelaunch
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  notificationQueue = self->_notificationQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000EDBC;
  v5[3] = &unk_10002CB40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)notificationQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)sigTermHandler
{
  BOOL shouldNotDieSuddenly = self->_shouldNotDieSuddenly;
  id v4 = psd_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (!shouldNotDieSuddenly)
  {
    if (v5)
    {
      v7 = psd_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v8 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "PSDaemon has received a SIGTERM, and is idle, exiting", v8, 2u);
      }
    }
    exit(0);
  }
  if (v5)
  {
    uint64_t v6 = psd_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PSDaemon has received a SIGTERM, but is not completed updating file for relaunch, not exiting for now", buf, 2u);
    }
  }
  self->_exitPending = 1;
}

- (void)_registerForNotifications
{
  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)self->_notificationQueue, &stru_10002CB80);
  char v3 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, (dispatch_queue_t)&_dispatch_main_q);
  sigTermSource = self->_sigTermSource;
  self->_sigTermSource = v3;

  dispatch_source_set_event_handler((dispatch_source_t)self->_sigTermSource, &stru_10002CBA0);
  BOOL v5 = self->_sigTermSource;

  dispatch_activate(v5);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v6 = (NSXPCListener *)a3;
  id v7 = a4;
  if (self->_toolListener == v6)
  {
    unsigned __int8 v9 = [(PSDaemon *)self shouldAcceptNewToolConnection:v7];
LABEL_8:
    BOOL v8 = v9;
    goto LABEL_9;
  }
  if (self->_progressListener == v6)
  {
    unsigned __int8 v9 = [(PSDaemon *)self shouldAcceptNewProgressConnection:v7];
    goto LABEL_8;
  }
  if (self->_clientListener == v6)
  {
    unsigned __int8 v9 = [(PSDaemon *)self shouldAcceptNewClientConnection:v7];
    goto LABEL_8;
  }
  BOOL v8 = 0;
LABEL_9:

  return v8;
}

- (BOOL)shouldAcceptNewToolConnection:(id)a3
{
  id v3 = a3;
  id v4 = [v3 valueForEntitlement:@"com.apple.pairedsync.tool"];
  unsigned int v5 = [v4 BOOLValue];

  if (v5)
  {
    uint64_t v6 = PSYToolInterfaceXPCInterface();
    [v3 setExportedInterface:v6];

    id v7 = objc_alloc_init(PSDToolConnection);
    [v3 setExportedObject:v7];

    [v3 resume];
  }
  else
  {
    [v3 invalidate];
    BOOL v8 = psd_log();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

    if (v9)
    {
      v10 = psd_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138543362;
        id v13 = v3;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Tool connection %{public}@ is missing entitlement", (uint8_t *)&v12, 0xCu);
      }
    }
  }

  return v5;
}

- (BOOL)shouldAcceptNewProgressConnection:(id)a3
{
  id v3 = a3;
  id v4 = [[PSDSyncSessionObserver alloc] initWithXPCConnection:v3];

  return 1;
}

- (BOOL)shouldAcceptNewClientConnection:(id)a3
{
  id v3 = a3;
  id v4 = [v3 valueForEntitlement:@"com.apple.pairedsync.client"];
  unsigned int v5 = [v4 BOOLValue];

  if (v5)
  {
    uint64_t v9 = 0;
    v10 = &v9;
    uint64_t v11 = 0x3032000000;
    int v12 = sub_10000F41C;
    id v13 = sub_10000F42C;
    id v14 = objc_alloc_init(PSDClientConnection);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10000F434;
    v8[3] = &unk_10002CBC8;
    v8[4] = &v9;
    [v3 setInvalidationHandler:v8];
    uint64_t v6 = PSYConnectionXPCInterface();
    [v3 setExportedInterface:v6];

    [v3 setExportedObject:v10[5]];
    [v3 resume];
    _Block_object_dispose(&v9, 8);
  }
  else
  {
    [v3 invalidate];
  }

  return v5;
}

- (void)addLoggersIfNeeded
{
  id v3 = +[NSMutableArray array];
  id v4 = objc_alloc_init(PSDSchedulerIDSObserver);
  [(NSArray *)v3 addObject:v4];

  unsigned int v5 = +[PSDSchedulerCoreAnalyticsLogger defaultLogger];
  [(NSArray *)v3 addObject:v5];

  uint64_t v6 = objc_alloc_init(PSDSchedulerPowerLogger);
  [(NSArray *)v3 addObject:v6];

  id v7 = +[PSDSchedulerAWDLogger defaultLogger];
  [(NSArray *)v3 addObject:v7];

  [(NSArray *)v3 enumerateObjectsUsingBlock:&stru_10002CC08];
  loggers = self->_loggers;
  self->_loggers = v3;
}

- (void)syncInitiatorStateChangedTo:(unint64_t)a3
{
  unsigned int v5 = psd_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = psd_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v13 = "-[PSDaemon syncInitiatorStateChangedTo:]";
      __int16 v14 = 2048;
      unint64_t v15 = a3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: state=%ld", buf, 0x16u);
    }
  }
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    BOOL v8 = +[PSYRegistrySingleton registry];
    uint64_t v9 = [v8 pairingID];

    v10 = +[PSDSyncStateManager sharedSyncStateManager];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10000F71C;
    v11[3] = &unk_10002C840;
    v11[4] = self;
    [v10 setSyncCompleteForPairingID:v9 withBlock:v11];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sigTermSource, 0);
  objc_storeStrong((id *)&self->_syncingStayAliveTransaction, 0);
  objc_storeStrong((id *)&self->_switchAssertionManager, 0);
  objc_storeStrong((id *)&self->_syncRestrictionNotifier, 0);
  objc_storeStrong((id *)&self->_watchSyncStateObserver, 0);
  objc_storeStrong((id *)&self->_loggers, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_clientListener, 0);
  objc_storeStrong((id *)&self->_progressListener, 0);

  objc_storeStrong((id *)&self->_toolListener, 0);
}

@end