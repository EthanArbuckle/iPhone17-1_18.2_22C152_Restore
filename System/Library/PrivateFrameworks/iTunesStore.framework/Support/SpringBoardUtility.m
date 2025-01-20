@interface SpringBoardUtility
+ (BOOL)_hasEntitlements:(id)a3;
+ (id)sharedInstance;
+ (void)_sendUnentitledResponseToMessage:(id)a3 connection:(id)a4;
+ (void)dequeueAlertWithMessage:(id)a3 connection:(id)a4;
+ (void)observeXPCServer:(id)a3;
+ (void)registerPluginConnectionWithMessage:(id)a3 connection:(id)a4;
+ (void)restartApplicationWithMessage:(id)a3 connection:(id)a4;
+ (void)testBadgingWithMessage:(id)a3 connection:(id)a4;
+ (void)testLockscreenAccountSheetWithMessage:(id)a3 connection:(id)a4;
+ (void)testPluginAlertWithMessage:(id)a3 connection:(id)a4;
- (BOOL)_getProcessID:(int *)a3 forApplicationIdentifier:(id)a4;
- (BOOL)isScreenLocked;
- (BOOL)launchApplicationWithIdentifier:(id)a3 options:(id)a4 error:(id *)a5;
- (NSString)frontmostClientIdentifier;
- (SpringBoardUtility)init;
- (id)_applicationStateMonitor;
- (id)_getApplicationInfoForIdentifier:(id)a3 key:(id)a4;
- (id)copyBundleInfoValueForKey:(id)a3 PID:(int)a4;
- (unsigned)applicationStateForIdentifier:(id)a3;
- (unsigned)mostElevatedApplicationStateForPID:(int)a3;
- (void)_dequeueAlertWithMessage:(id)a3 connection:(id)a4;
- (void)_disconnectPluginConnection:(id)a3;
- (void)_fireDeferredPluginBlocksWithConnection:(id)a3;
- (void)_registerPluginConnectionWithMessage:(id)a3;
- (void)_requestPluginConnectionWithCompletionBlock:(id)a3;
- (void)_setApplicationState:(unsigned int)a3 forClientID:(id)a4;
- (void)_setApplicationStatesWithDictionary:(id)a3;
- (void)_timeoutPluginConnection;
- (void)activateAlertWithDescription:(id)a3 options:(id)a4 completionBlock:(id)a5;
- (void)beginGeneratingStateChangeNotificationsForIdentifiers:(id)a3;
- (void)beginGeneratingStateChangeNotificationsWithCompletionBlock:(id)a3;
- (void)dealloc;
- (void)endGeneratingStateChangeNotifications;
- (void)endGeneratingStateChangeNotificationsForIdentifiers:(id)a3;
- (void)removeDefaultPNGSnapshotsForIdentifier:(id)a3;
- (void)resetEnabledRemoteNotificationTypes;
- (void)sendPluginMessage:(id)a3;
- (void)sendPluginMessage:(id)a3 withReplyBlock:(id)a4;
- (void)setBadgeValue:(id)a3 forIdentifier:(id)a4;
- (void)suspendFrontApplication;
- (void)wakeAppUsingRequest:(id)a3;
@end

@implementation SpringBoardUtility

- (void)endGeneratingStateChangeNotificationsForIdentifiers:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100005740;
  v7[3] = &unk_1003A3268;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)_setApplicationState:(unsigned int)a3 forClientID:(id)a4
{
  id v6 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000052C4;
  block[3] = &unk_1003A7508;
  unsigned int v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(dispatchQueue, block);
}

- (unsigned)applicationStateForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  int v14 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003F3C;
  block[3] = &unk_1003A7300;
  block[4] = self;
  id v9 = v4;
  id v10 = &v11;
  id v6 = v4;
  dispatch_sync(dispatchQueue, block);
  LODWORD(dispatchQueue) = *((_DWORD *)v12 + 6);

  _Block_object_dispose(&v11, 8);
  return dispatchQueue;
}

- (id)_applicationStateMonitor
{
  applicationStateMonitor = self->_applicationStateMonitor;
  if (!applicationStateMonitor)
  {
    objc_initWeak(&location, self);
    id v4 = (BKSApplicationStateMonitor *)[objc_alloc((Class)BKSApplicationStateMonitor) initWithBundleIDs:0 states:0];
    v5 = self->_applicationStateMonitor;
    self->_applicationStateMonitor = v4;

    id v6 = self->_applicationStateMonitor;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100005E10;
    v8[3] = &unk_1003A74B8;
    objc_copyWeak(&v9, &location);
    [(BKSApplicationStateMonitor *)v6 setHandler:v8];
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
    applicationStateMonitor = self->_applicationStateMonitor;
  }

  return applicationStateMonitor;
}

- (unsigned)mostElevatedApplicationStateForPID:(int)a3
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  int v11 = 0;
  springBoardQueue = self->_springBoardQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006D08;
  block[3] = &unk_1003A73F0;
  block[4] = self;
  void block[5] = &v8;
  int v7 = a3;
  dispatch_sync(springBoardQueue, block);
  unsigned int v4 = *((_DWORD *)v9 + 6);
  _Block_object_dispose(&v8, 8);
  return v4;
}

- (id)copyBundleInfoValueForKey:(id)a3 PID:(int)a4
{
  id v6 = a3;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = sub_100135530;
  v23 = sub_100135540;
  id v24 = 0;
  springBoardQueue = self->_springBoardQueue;
  int v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  uint64_t v13 = sub_100006D68;
  int v14 = &unk_1003A7378;
  v15 = self;
  v17 = &v19;
  id v8 = v6;
  id v16 = v8;
  int v18 = a4;
  dispatch_sync(springBoardQueue, &v11);
  id v9 = objc_msgSend((id)v20[5], "copy", v11, v12, v13, v14, v15);

  _Block_object_dispose(&v19, 8);
  return v9;
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100134B28;
  block[3] = &unk_1003A31A0;
  block[4] = a1;
  if (qword_100401EC0 != -1) {
    dispatch_once(&qword_100401EC0, block);
  }
  v2 = (void *)qword_100401EB8;

  return v2;
}

- (void)beginGeneratingStateChangeNotificationsForIdentifiers:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100005A80;
  v7[3] = &unk_1003A3268;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (SpringBoardUtility)init
{
  v12.receiver = self;
  v12.super_class = (Class)SpringBoardUtility;
  v2 = [(SpringBoardUtility *)&v12 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.itunesstore.SpringBoardUtility", 0);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.itunesstore.SpringBoardUtility.springboard", 0);
    springBoardQueue = v2->_springBoardQueue;
    v2->_springBoardQueue = (OS_dispatch_queue *)v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.itunesstore.notifications", 0);
    notificationQueue = v2->_notificationQueue;
    v2->_notificationQueue = (OS_dispatch_queue *)v7;

    id v9 = v2->_notificationQueue;
    uint64_t v10 = dispatch_get_global_queue(0, 0);
    dispatch_set_target_queue(v9, v10);
  }
  return v2;
}

- (void)dealloc
{
  [(BKSApplicationStateMonitor *)self->_applicationStateMonitor setHandler:0];
  [(BKSApplicationStateMonitor *)self->_applicationStateMonitor invalidate];
  pluginConnectionTimeout = self->_pluginConnectionTimeout;
  if (pluginConnectionTimeout) {
    dispatch_source_cancel((dispatch_source_t)pluginConnectionTimeout);
  }
  [(SSXPCConnection *)self->_pluginConnection setDisconnectBlock:0];
  v4.receiver = self;
  v4.super_class = (Class)SpringBoardUtility;
  [(SpringBoardUtility *)&v4 dealloc];
}

- (void)activateAlertWithDescription:(id)a3 options:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatchQueue = self->_dispatchQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100134C54;
  v15[3] = &unk_1003A72D8;
  v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v8;
  id v13 = v9;
  id v14 = v10;
  dispatch_async(dispatchQueue, v15);
}

- (void)beginGeneratingStateChangeNotificationsWithCompletionBlock:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100135240;
  v7[3] = &unk_1003A31F0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)endGeneratingStateChangeNotifications
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001355BC;
  block[3] = &unk_1003A3140;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (NSString)frontmostClientIdentifier
{
  uint64_t v6 = 0;
  dispatch_queue_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_100135530;
  id v10 = sub_100135540;
  id v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100135800;
  v5[3] = &unk_1003A51F8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

- (BOOL)isScreenLocked
{
  return 0;
}

- (BOOL)launchApplicationWithIdentifier:(id)a3 options:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = sub_100135530;
  v28 = sub_100135540;
  id v29 = 0;
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  id v10 = +[FBSSystemService sharedService];
  id v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472;
  v20 = sub_100135B14;
  uint64_t v21 = &unk_1003A73C8;
  v23 = &v24;
  id v11 = v9;
  v22 = v11;
  [v10 openApplication:v7 options:v8 withResult:&v18];

  dispatch_time_t v12 = dispatch_time(0, 30000000000);
  dispatch_semaphore_wait(v11, v12);
  id v13 = objc_msgSend((id)v25[5], "domain", v18, v19, v20, v21);
  unsigned int v14 = [v13 isEqualToString:FBSOpenApplicationErrorDomain];

  id v15 = (id)v25[5];
  if (v14) {
    id v15 = [v15 code];
  }
  BOOL v16 = v15 == 0;
  if (a5 && v15) {
    *a5 = (id) v25[5];
  }

  _Block_object_dispose(&v24, 8);
  return v16;
}

- (void)removeDefaultPNGSnapshotsForIdentifier:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"com.apple.MobileStore"] & 1) != 0
    || [v3 isEqualToString:@"com.apple.AppStore"])
  {
    id v4 = CPSharedResourcesDirectory();
    if (!v4) {
      goto LABEL_20;
    }
LABEL_6:
    id v8 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", v4, @"Library", @"Caches", @"Snapshots", v3, 0);
    dispatch_semaphore_t v9 = +[NSString pathWithComponents:v8];
    if (!v9)
    {
LABEL_19:

      goto LABEL_20;
    }
    id v10 = +[SSLogConfig sharedDaemonConfig];
    if (!v10)
    {
      id v10 = +[SSLogConfig sharedConfig];
    }
    unsigned int v11 = [v10 shouldLog];
    if ([v10 shouldLogToDisk]) {
      int v12 = v11 | 2;
    }
    else {
      int v12 = v11;
    }
    id v13 = [v10 OSLogObject];
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO)) {
      v12 &= 2u;
    }
    if (v12)
    {
      int v18 = 138412546;
      id v19 = (id)objc_opt_class();
      __int16 v20 = 2112;
      uint64_t v21 = v9;
      id v14 = v19;
      LODWORD(v17) = 22;
      id v15 = (void *)_os_log_send_and_compose_impl();

      if (!v15)
      {
LABEL_18:

        id v16 = objc_alloc_init((Class)NSFileManager);
        [v16 removeItemAtPath:v9 error:0];

        goto LABEL_19;
      }
      id v13 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v15, 4, &v18, v17);
      free(v15);
      SSFileLog();
    }

    goto LABEL_18;
  }
  uint64_t v6 = +[LSApplicationProxy applicationProxyForIdentifier:v3];
  id v7 = [v6 bundleContainerURL];
  id v4 = [v7 path];

  if (v4) {
    goto LABEL_6;
  }
LABEL_20:
}

- (void)resetEnabledRemoteNotificationTypes
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100135E94;
  block[3] = &unk_1003A3140;
  block[4] = self;
  dispatch_sync(dispatchQueue, block);
}

- (void)setBadgeValue:(id)a3 forIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = objc_alloc_init((Class)NSNumberFormatter);
      [v8 setNumberStyle:1];
      id v7 = [v8 stringFromNumber:v5];

      goto LABEL_17;
    }
    dispatch_semaphore_t v9 = +[SSLogConfig sharedDaemonConfig];
    if (!v9)
    {
      dispatch_semaphore_t v9 = +[SSLogConfig sharedConfig];
    }
    unsigned int v10 = [v9 shouldLog];
    if ([v9 shouldLogToDisk]) {
      int v11 = v10 | 2;
    }
    else {
      int v11 = v10;
    }
    int v12 = [v9 OSLogObject];
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO)) {
      v11 &= 2u;
    }
    if (v11)
    {
      *(_DWORD *)int v18 = 138412802;
      *(void *)&v18[4] = objc_opt_class();
      *(_WORD *)&v18[12] = 2112;
      *(void *)&v18[14] = v6;
      *(_WORD *)&v18[22] = 2112;
      id v19 = v5;
      id v13 = *(id *)&v18[4];
      LODWORD(v17) = 32;
      id v14 = (void *)_os_log_send_and_compose_impl();

      if (!v14)
      {
LABEL_16:

        id v7 = 0;
        goto LABEL_17;
      }
      int v12 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v14, 4, v18, v17, *(_OWORD *)v18, *(void *)&v18[16], v19);
      free(v14);
      SSFileLog();
    }

    goto LABEL_16;
  }
  id v7 = v5;
LABEL_17:
  id v15 = objc_alloc_init((Class)ISSetApplicationBadgeOperation);
  [v15 setBadgeValue:v7];
  [v15 setBundleIdentifier:v6];
  id v16 = +[ISOperationQueue mainQueue];
  [v16 addOperation:v15];
}

- (void)suspendFrontApplication
{
}

- (void)wakeAppUsingRequest:(id)a3
{
  id v4 = a3;
  id v5 = +[Daemon daemon];
  [v5 takeKeepAliveAssertion:@"AppWakeup"];
  springBoardQueue = self->_springBoardQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100136200;
  block[3] = &unk_1003A4298;
  id v10 = v4;
  int v11 = self;
  id v12 = v5;
  id v7 = v5;
  id v8 = v4;
  dispatch_async(springBoardQueue, block);
}

- (void)_dequeueAlertWithMessage:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100136C0C;
  block[3] = &unk_1003A4298;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

+ (void)dequeueAlertWithMessage:(id)a3 connection:(id)a4
{
  xpc_object_t original = a3;
  id v6 = (_xpc_connection_s *)a4;
  if (SSXPCConnectionHasEntitlement())
  {
    reply = [a1 sharedInstance];
    [reply _dequeueAlertWithMessage:original connection:v6];
  }
  else
  {
    reply = xpc_dictionary_create_reply(original);
    xpc_connection_send_message(v6, reply);
  }
}

+ (void)observeXPCServer:(id)a3
{
  id v4 = a3;
  [v4 addObserver:a1 selector:"dequeueAlertWithMessage:connection:" forMessage:142];
  [v4 addObserver:a1 selector:"registerPluginConnectionWithMessage:connection:" forMessage:2000];
  [v4 addObserver:a1 selector:"testBadgingWithMessage:connection:" forMessage:752];
  [v4 addObserver:a1 selector:"testLockscreenAccountSheetWithMessage:connection:" forMessage:750];
  [v4 addObserver:a1 selector:"testPluginAlertWithMessage:connection:" forMessage:751];
  [v4 addObserver:a1 selector:"restartApplicationWithMessage:connection:" forMessage:165];
}

+ (void)restartApplicationWithMessage:(id)a3 connection:(id)a4
{
  xpc_object_t original = a3;
  id v6 = (_xpc_connection_s *)a4;
  id v7 = [[XPCClient alloc] initWithInputConnection:v6];
  if ([a1 _hasEntitlements:v6])
  {
    id v8 = [(XPCClient *)v7 clientIdentifier];
    id v9 = objc_alloc_init((Class)BKSSystemService);
    [v9 terminateApplication:v8 forReason:5 andReport:0 withDescription:0];
    [v9 openApplication:v8 options:0 withResult:0];
    xpc_object_t reply = xpc_dictionary_create_reply(original);
    xpc_connection_send_message(v6, reply);
  }
  else
  {
    [a1 _sendUnentitledResponseToMessage:original connection:v6];
  }
}

+ (void)registerPluginConnectionWithMessage:(id)a3 connection:(id)a4
{
  id v5 = a3;
  id v6 = [a1 sharedInstance];
  [v6 _registerPluginConnectionWithMessage:v5];
}

+ (void)testBadgingWithMessage:(id)a3 connection:(id)a4
{
  id v5 = a3;
  objc_opt_class();
  id v6 = (void *)SSXPCDictionaryCopyObjectWithClass();
  objc_opt_class();
  id v7 = (void *)SSXPCDictionaryCopyObjectWithClass();

  id v8 = +[SSLogConfig sharedDaemonConfig];
  if (!v8)
  {
    id v8 = +[SSLogConfig sharedConfig];
  }
  unsigned int v9 = [v8 shouldLog];
  if ([v8 shouldLogToDisk]) {
    int v10 = v9 | 2;
  }
  else {
    int v10 = v9;
  }
  int v11 = [v8 OSLogObject];
  if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    v10 &= 2u;
  }
  if (!v10) {
    goto LABEL_11;
  }
  *(_DWORD *)id v16 = 138412802;
  *(void *)&v16[4] = objc_opt_class();
  *(_WORD *)&v16[12] = 2112;
  *(void *)&v16[14] = v6;
  *(_WORD *)&v16[22] = 2112;
  uint64_t v17 = v7;
  id v12 = *(id *)&v16[4];
  LODWORD(v15) = 32;
  id v13 = (void *)_os_log_send_and_compose_impl();

  if (v13)
  {
    int v11 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v13, 4, v16, v15, *(_OWORD *)v16, *(void *)&v16[16], v17);
    free(v13);
    SSFileLog();
LABEL_11:
  }
  id v14 = [a1 sharedInstance];
  [v14 setBadgeValue:v7 forIdentifier:v6];
}

+ (void)testLockscreenAccountSheetWithMessage:(id)a3 connection:(id)a4
{
  id v6 = (id)SSXPCCreateMessageDictionary();
  id v5 = [a1 sharedInstance];
  [v5 sendPluginMessage:v6];
}

+ (void)testPluginAlertWithMessage:(id)a3 connection:(id)a4
{
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  [v4 setObject:@"ServiceTouchIDAlertViewController" forKey:SBSUIRemoteAlertOptionViewControllerClass];
  id v5 = objc_alloc_init((Class)SSDialog);
  [v5 setMessage:@"account@example.com"];
  [v5 setTitle:@"Touch ID"];
  id v6 = +[SSDialogButton buttonWithTitle:@"Use Password"];
  v11[0] = v6;
  id v7 = +[SSDialogButton buttonWithTitle:@"Cancel"];
  v11[1] = v7;
  id v8 = +[NSArray arrayWithObjects:v11 count:2];
  [v5 setButtons:v8];

  unsigned int v9 = +[SpringBoardUtility sharedInstance];
  int v10 = [v5 dialogDictionary];
  [v9 activateAlertWithDescription:v4 options:v10 completionBlock:0];
}

- (void)sendPluginMessage:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001375A4;
  v5[3] = &unk_1003A7440;
  id v6 = a3;
  id v4 = v6;
  [(SpringBoardUtility *)self _requestPluginConnectionWithCompletionBlock:v5];
}

- (void)sendPluginMessage:(id)a3 withReplyBlock:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100137670;
  v8[3] = &unk_1003A7490;
  id v9 = a3;
  id v10 = a4;
  id v6 = v9;
  id v7 = v10;
  [(SpringBoardUtility *)self _requestPluginConnectionWithCompletionBlock:v8];
}

- (void)_disconnectPluginConnection:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100137828;
  v7[3] = &unk_1003A3268;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)_fireDeferredPluginBlocksWithConnection:(id)a3
{
  id v4 = a3;
  pluginConnectionTimeout = self->_pluginConnectionTimeout;
  if (pluginConnectionTimeout)
  {
    dispatch_source_cancel((dispatch_source_t)pluginConnectionTimeout);
    id v6 = self->_pluginConnectionTimeout;
    self->_pluginConnectionTimeout = 0;
  }
  id v7 = [(NSMutableArray *)self->_pluginDeferredBlocks copy];
  [(NSMutableArray *)self->_pluginDeferredBlocks removeAllObjects];
  notificationQueue = self->_notificationQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  void v11[2] = sub_100137AD0;
  v11[3] = &unk_1003A3268;
  id v12 = v7;
  id v13 = v4;
  id v9 = v4;
  id v10 = v7;
  dispatch_async(notificationQueue, v11);
}

- (id)_getApplicationInfoForIdentifier:(id)a3 key:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v19 = 0;
  __int16 v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = sub_100135530;
  v23 = sub_100135540;
  id v24 = 0;
  id v8 = [(SpringBoardUtility *)self _applicationStateMonitor];
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100137D74;
  v15[3] = &unk_1003A74E0;
  int v18 = &v19;
  id v10 = v7;
  id v16 = v10;
  int v11 = v9;
  uint64_t v17 = v11;
  [v8 applicationInfoForApplication:v6 completion:v15];
  dispatch_time_t v12 = dispatch_time(0, 30000000000);
  dispatch_semaphore_wait(v11, v12);
  id v13 = (id)v20[5];

  _Block_object_dispose(&v19, 8);

  return v13;
}

- (BOOL)_getProcessID:(int *)a3 forApplicationIdentifier:(id)a4
{
  id v5 = [(SpringBoardUtility *)self _getApplicationInfoForIdentifier:a4 key:BKSApplicationStateProcessIDKey];
  char v6 = objc_opt_respondsToSelector();
  char v7 = v6;
  if (a3 && (v6 & 1) != 0) {
    *a3 = [v5 intValue];
  }

  return v7 & 1;
}

+ (BOOL)_hasEntitlements:(id)a3
{
  return SSXPCConnectionHasEntitlement();
}

- (void)_registerPluginConnectionWithMessage:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100137F20;
  v7[3] = &unk_1003A3268;
  id v8 = v4;
  dispatch_semaphore_t v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)_requestPluginConnectionWithCompletionBlock:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10013833C;
  v7[3] = &unk_1003A31F0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

+ (void)_sendUnentitledResponseToMessage:(id)a3 connection:(id)a4
{
  id v5 = (_xpc_connection_s *)a4;
  id v6 = a3;
  char v7 = +[SSLogConfig sharedDaemonConfig];
  if (!v7)
  {
    char v7 = +[SSLogConfig sharedConfig];
  }
  unsigned int v8 = [v7 shouldLog];
  if ([v7 shouldLogToDisk]) {
    int v9 = v8 | 2;
  }
  else {
    int v9 = v8;
  }
  id v10 = [v7 OSLogObject];
  if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    v9 &= 2u;
  }
  if (!v9) {
    goto LABEL_11;
  }
  LODWORD(v16) = 138412290;
  *(void *)((char *)&v16 + 4) = objc_opt_class();
  id v11 = *(id *)((char *)&v16 + 4);
  LODWORD(v15) = 12;
  dispatch_time_t v12 = (void *)_os_log_send_and_compose_impl();

  if (v12)
  {
    id v10 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4, &v16, v15, v16);
    free(v12);
    SSFileLog();
LABEL_11:
  }
  xpc_object_t reply = xpc_dictionary_create_reply(v6);

  id v14 = SSError();
  SSXPCDictionarySetCFObject();
  SSXPCDictionarySetCFObject();
  xpc_connection_send_message(v5, reply);
}

- (void)_setApplicationStatesWithDictionary:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001389BC;
  v7[3] = &unk_1003A3268;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)_timeoutPluginConnection
{
  id v3 = +[SSLogConfig sharedDaemonConfig];
  if (!v3)
  {
    id v3 = +[SSLogConfig sharedConfig];
  }
  unsigned int v4 = [v3 shouldLog];
  if ([v3 shouldLogToDisk]) {
    int v5 = v4 | 2;
  }
  else {
    int v5 = v4;
  }
  id v6 = [v3 OSLogObject];
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
    v5 &= 2u;
  }
  if (!v5) {
    goto LABEL_11;
  }
  char v7 = objc_opt_class();
  pluginConnection = self->_pluginConnection;
  *(_DWORD *)dispatch_time_t v12 = 138412546;
  *(void *)&v12[4] = v7;
  *(_WORD *)&v12[12] = 2112;
  *(void *)&v12[14] = pluginConnection;
  id v9 = v7;
  LODWORD(v11) = 22;
  id v10 = (void *)_os_log_send_and_compose_impl();

  if (v10)
  {
    id v6 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v10, 4, v12, v11, *(_OWORD *)v12, *(void *)&v12[16]);
    free(v10);
    SSFileLog();
LABEL_11:
  }
  [(SpringBoardUtility *)self _fireDeferredPluginBlocksWithConnection:self->_pluginConnection];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateCache, 0);
  objc_storeStrong((id *)&self->_springBoardQueue, 0);
  objc_storeStrong((id *)&self->_pluginDeferredBlocks, 0);
  objc_storeStrong((id *)&self->_pluginConnectionTimeout, 0);
  objc_storeStrong((id *)&self->_pluginConnection, 0);
  objc_storeStrong((id *)&self->_pendingAlerts, 0);
  objc_storeStrong((id *)&self->_observedApplicationIdentifiers, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_enabledRemoteNotificationTypes, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);

  objc_storeStrong((id *)&self->_applicationStateMonitor, 0);
}

@end