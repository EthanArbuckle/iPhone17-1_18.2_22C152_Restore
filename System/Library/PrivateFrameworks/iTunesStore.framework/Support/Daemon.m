@interface Daemon
+ (id)daemon;
- (AMSBagValue)changeLanguageURL;
- (AMSBagValue)trustedDomains;
- (Daemon)init;
- (id)addObserverForBackgroundTaskWithIdentifierPrefix:(id)a3 withBlock:(id)a4;
- (id)cachedObjectForKey:(id)a3;
- (void)_expireCachedObjectForKey:(id)a3;
- (void)_finishProtectionClassCMigrationIfNeeded;
- (void)_getShowingDialogWithMessage:(id)a3 connection:(id)a4;
- (void)_handleWakeWithName:(const char *)a3 job:(id)a4;
- (void)_initBackgroundTaskAgent;
- (void)_networkUsageStateChangeNotification:(id)a3;
- (void)_observeNotifications;
- (void)_operationCountChanged:(id)a3;
- (void)_reloadOperationKeepAliveTransaction;
- (void)_reloadWiFiManager;
- (void)_setGlobalState;
- (void)_warmUpSharedURLCache;
- (void)addBackgroundTaskWithRequest:(id)a3;
- (void)addKeepAliveOperationQueue:(id)a3;
- (void)batterySaverWatcherDidChangeState:(id)a3;
- (void)beginShowingDialog;
- (void)cacheObject:(id)a3 withKey:(id)a4 expirationInterval:(double)a5;
- (void)cancelBackgroundTaskWithIdentifier:(id)a3;
- (void)dealloc;
- (void)endShowingDialog;
- (void)keepAliveWithAssertion:(id)a3 block:(id)a4;
- (void)releaseKeepAliveAssertion:(id)a3;
- (void)removeBackgroundTaskObserver:(id)a3;
- (void)removeCachedObjectForKey:(id)a3;
- (void)removeKeepAliveOperationQueue:(id)a3;
- (void)start;
- (void)takeKeepAliveAssertion:(id)a3;
@end

@implementation Daemon

- (void)takeKeepAliveAssertion:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000AAE0;
  v4[3] = &unk_1003A3380;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

+ (id)daemon
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10014807C;
  block[3] = &unk_1003A33A8;
  block[4] = a1;
  if (qword_100401EE0 != -1) {
    dispatch_once(&qword_100401EE0, block);
  }
  return (id)qword_100401ED8;
}

- (void)releaseKeepAliveAssertion:(id)a3
{
  dispatch_time_t v5 = dispatch_time(0, 15000000000);
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100148F98;
  v7[3] = &unk_1003A3380;
  v7[4] = self;
  v7[5] = a3;
  dispatch_after(v5, dispatchQueue, v7);
}

- (Daemon)init
{
  v22.receiver = self;
  v22.super_class = (Class)Daemon;
  v2 = [(Daemon *)&v22 init];
  v3 = v2;
  if (v2)
  {
    [(Daemon *)v2 _warmUpSharedURLCache];
    v3->_backgroundTaskObservers = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v3->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.itunesstored.Daemon", 0);
    v3->_keepAliveTransactions = (NSCountedSet *)objc_alloc_init((Class)NSCountedSet);
    v3->_keepAliveTransactionStore = (NSMutableDictionary *)objc_opt_new();
    v3->_satisfiedWakeRequests = (OS_xpc_object *)xpc_dictionary_create(0, 0, 0);
    v4 = +[NSNotificationCenter defaultCenter];
    [(NSNotificationCenter *)v4 addObserver:v3 selector:"_networkUsageStateChangeNotification:" name:ISNetworkUsageStateChangedNotification object:0];
    id v5 = +[ISOperationQueue mainQueue];
    [(NSNotificationCenter *)v4 addObserver:v3 selector:"_operationCountChanged:" name:ISOperationQueueOperationCountChangedNotification object:v5];
    v3->_keepAliveOperationQueues = (NSMutableSet *)objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithObjects:", v5, 0);
    dispatchQueue = v3->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100147DE4;
    block[3] = &unk_1003A33A8;
    block[4] = v3;
    dispatch_async(dispatchQueue, block);
    v7 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, (dispatch_queue_t)v3->_dispatchQueue);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100147DEC;
    handler[3] = &unk_1003A33A8;
    handler[4] = v3;
    dispatch_source_set_event_handler(v7, handler);
    dispatch_resume(v7);
    v8 = +[NSFileManager defaultManager];
    v25[0] = CPSharedResourcesDirectory();
    v25[1] = @"Library";
    v25[2] = @"Caches";
    v25[3] = @"com.apple.storeServices.watchAnalytics";
    v9 = +[NSString pathWithComponents:](NSString, "pathWithComponents:", +[NSArray arrayWithObjects:v25 count:4]);
    if ([(NSFileManager *)v8 fileExistsAtPath:v9])
    {
      id v10 = +[SSLogConfig sharedDaemonConfig];
      if (!v10) {
        id v10 = +[SSLogConfig sharedConfig];
      }
      unsigned int v11 = [v10 shouldLog];
      if ([v10 shouldLogToDisk]) {
        int v12 = v11 | 2;
      }
      else {
        int v12 = v11;
      }
      if (os_log_type_enabled((os_log_t)[v10 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
        int v13 = v12;
      }
      else {
        int v13 = v12 & 2;
      }
      if (v13)
      {
        int v23 = 138543362;
        v24 = v9;
        LODWORD(v19) = 12;
        v18 = &v23;
        uint64_t v14 = _os_log_send_and_compose_impl();
        if (v14)
        {
          v15 = (void *)v14;
          v16 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v14, 4, &v23, v19);
          free(v15);
          v18 = (int *)v16;
          SSFileLog();
        }
      }
      -[NSFileManager removeItemAtPath:error:](v8, "removeItemAtPath:error:", v9, 0, v18);
    }
  }
  return v3;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [(NSNotificationCenter *)v3 removeObserver:self name:SSAccountStoreChangedNotification object:0];
  [(NSNotificationCenter *)v3 removeObserver:self name:ISNetworkUsageStateChangedNotification object:0];
  [(NSNotificationCenter *)v3 removeObserver:self name:ISOperationQueueOperationCountChangedNotification object:0];
  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue) {
    dispatch_release(dispatchQueue);
  }
  satisfiedWakeRequests = self->_satisfiedWakeRequests;
  if (satisfiedWakeRequests) {
    xpc_release(satisfiedWakeRequests);
  }
  jetsamSource = self->_jetsamSource;
  if (jetsamSource)
  {
    dispatch_source_cancel((dispatch_source_t)jetsamSource);
    dispatch_release((dispatch_object_t)self->_jetsamSource);
  }
  sigTermSource = self->_sigTermSource;
  if (sigTermSource)
  {
    dispatch_source_cancel((dispatch_source_t)sigTermSource);
    dispatch_release((dispatch_object_t)self->_sigTermSource);
  }

  v8.receiver = self;
  v8.super_class = (Class)Daemon;
  [(Daemon *)&v8 dealloc];
}

- (void)addBackgroundTaskWithRequest:(id)a3
{
  id v5 = [a3 requestIdentifier];
  if (v5)
  {
    id v6 = v5;
    v7 = (const char *)[v5 UTF8String];
    id v8 = [a3 copyBackgroundTaskAgentJob];
    if (v8)
    {
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_1001482F0;
      handler[3] = &unk_1003A7B38;
      handler[4] = self;
      void handler[5] = v6;
      handler[6] = v8;
      xpc_activity_register(v7, v8, handler);
      id v9 = +[SSLogConfig sharedConfig];
      unsigned int v10 = [v9 shouldLog];
      if ([v9 shouldLogToDisk]) {
        int v11 = v10 | 2;
      }
      else {
        int v11 = v10;
      }
      if (os_log_type_enabled((os_log_t)[v9 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
        int v12 = v11;
      }
      else {
        int v12 = v11 & 2;
      }
      if (v12)
      {
        int v21 = 138543362;
        id v22 = v6;
        LODWORD(v19) = 12;
        goto LABEL_19;
      }
    }
    else
    {
      id v13 = +[SSLogConfig sharedConfig];
      unsigned int v14 = [v13 shouldLog];
      if ([v13 shouldLogToDisk]) {
        int v15 = v14 | 2;
      }
      else {
        int v15 = v14;
      }
      if (os_log_type_enabled((os_log_t)[v13 OSLogObject], OS_LOG_TYPE_ERROR)) {
        int v16 = v15;
      }
      else {
        int v16 = v15 & 2;
      }
      if (v16)
      {
        int v21 = 138543362;
        id v22 = v6;
        LODWORD(v19) = 12;
LABEL_19:
        uint64_t v17 = _os_log_send_and_compose_impl();
        if (v17)
        {
          v18 = (void *)v17;
          +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v17, 4, &v21, v19);
          free(v18);
          SSFileLog();
        }
      }
    }
  }
}

- (void)addKeepAliveOperationQueue:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001483E0;
  v4[3] = &unk_1003A3380;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

- (id)addObserverForBackgroundTaskWithIdentifierPrefix:(id)a3 withBlock:(id)a4
{
  id v6 = [a4 copy];
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100148504;
  block[3] = &unk_1003A7080;
  block[4] = self;
  void block[5] = a3;
  block[6] = v6;
  dispatch_sync(dispatchQueue, block);
  return v6;
}

- (void)beginShowingDialog
{
  notify_post((const char *)[kITunesDaemonWillDisplayDialog UTF8String]);
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100148850;
  block[3] = &unk_1003A33A8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (id)cachedObjectForKey:(id)a3
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3052000000;
  unsigned int v10 = sub_100148958;
  int v11 = sub_100148968;
  uint64_t v12 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100148974;
  block[3] = &unk_1003A7030;
  block[4] = self;
  void block[5] = a3;
  block[6] = &v7;
  dispatch_sync(dispatchQueue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)cacheObject:(id)a3 withKey:(id)a4 expirationInterval:(double)a5
{
  dispatchQueue = self->_dispatchQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100148A30;
  v6[3] = &unk_1003A7BB0;
  v6[4] = a3;
  v6[5] = self;
  v6[6] = a4;
  *(double *)&v6[7] = a5;
  dispatch_async(dispatchQueue, v6);
}

- (void)cancelBackgroundTaskWithIdentifier:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100148C80;
  v4[3] = &unk_1003A3380;
  v4[4] = a3;
  v4[5] = self;
  dispatch_async(dispatchQueue, v4);
}

- (void)endShowingDialog
{
  notify_post((const char *)[kITunesDaemonDidDismissDialog UTF8String]);
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100148E70;
  block[3] = &unk_1003A33A8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)keepAliveWithAssertion:(id)a3 block:(id)a4
{
  -[Daemon takeKeepAliveAssertion:](self, "takeKeepAliveAssertion:");
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100148F24;
  block[3] = &unk_1003A3438;
  void block[5] = a3;
  block[6] = a4;
  block[4] = self;
  dispatch_async(global_queue, block);
}

- (void)removeBackgroundTaskObserver:(id)a3
{
  if (a3)
  {
    dispatchQueue = self->_dispatchQueue;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_100149088;
    v4[3] = &unk_1003A3380;
    v4[4] = self;
    v4[5] = a3;
    dispatch_async(dispatchQueue, v4);
  }
}

- (void)removeCachedObjectForKey:(id)a3
{
  if (a3)
  {
    dispatchQueue = self->_dispatchQueue;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_100149204;
    v4[3] = &unk_1003A3380;
    v4[4] = self;
    v4[5] = a3;
    dispatch_async(dispatchQueue, v4);
  }
}

- (void)removeKeepAliveOperationQueue:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100149284;
  v4[3] = &unk_1003A3380;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

- (void)start
{
  id v3 = +[SSLogConfig sharedDaemonConfig];
  if (!v3) {
    id v3 = +[SSLogConfig sharedConfig];
  }
  unsigned int v4 = [v3 shouldLog];
  if ([v3 shouldLogToDisk]) {
    int v5 = v4 | 2;
  }
  else {
    int v5 = v4;
  }
  if (!os_log_type_enabled((os_log_t)[v3 OSLogObject], OS_LOG_TYPE_INFO)) {
    v5 &= 2u;
  }
  if (v5)
  {
    int v43 = 138412802;
    uint64_t v44 = objc_opt_class();
    __int16 v45 = 2080;
    v46 = "Nov 10 2024";
    __int16 v47 = 2080;
    v48 = "03:44:13";
    LODWORD(v36) = 32;
    v34 = &v43;
    uint64_t v6 = _os_log_send_and_compose_impl();
    if (v6)
    {
      uint64_t v7 = (void *)v6;
      id v8 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v6, 4, &v43, v36);
      free(v7);
      v34 = (int *)v8;
      SSFileLog();
    }
  }
  xpc_track_activity();
  [(Daemon *)self _finishProtectionClassCMigrationIfNeeded];
  [(Daemon *)self _setGlobalState];
  [(Daemon *)self _initBackgroundTaskAgent];
  [(Daemon *)self _observeNotifications];
  +[UserNotificationManager sharedManager];
  id v9 = +[SSXPCServer mainServer];
  id v10 = +[DownloadController controller];
  [v10 observeXPCServer:v9];
  id v11 = +[MicroPaymentQueue paymentQueue];
  [v11 observeXPCServer:v9];
  +[AccountPasswordSettingsController observeXPCServer:v9];
  +[AppReceiptController observeXPCServer:v9];
  +[DaemonBiometricKeychain observeXPCServer:v9];
  +[DaemonBiometricStore observeXPCServer:v9];
  +[DirectUploadController observeXPCServer:v9];
  +[DistributedNotificationCenter observeXPCServer:v9];
  +[ErrorHandlerManager observeXPCServer:v9];
  +[EventDispatcher observeXPCServer:v9];
  +[KeyValueStore observeXPCServer:v9];
  +[IPodLibrary observeXPCServer:v9];
  [+[MetricsController sharedInstance] observeXPCServer:v9];
  +[PurchaseController observeXPCServer:v9];
  +[PurchaseManifest observeXPCServer:v9];
  [+[PushNotificationController sharedInstance] observeXPCServer:v9];
  +[SoftwareUpdatesStore observeXPCServer:v9];
  +[SpringBoardUtility observeXPCServer:v9];
  +[StoreDownloadQueue observeXPCServer:v9];
  +[StorePreorderQueue observeXPCServer:v9];
  [+[StoreServicesRequestQueue sharedInstance] observeXPCServer:v9];
  +[NetworkRequestQueue observeXPCServer:v9];
  [v9 addObserver:self selector:"_getShowingDialogWithMessage:connection:" forMessage:131];
  id v12 = +[SSLogConfig sharedDaemonConfig];
  if (!v12) {
    id v12 = +[SSLogConfig sharedConfig];
  }
  unsigned int v13 = objc_msgSend(v12, "shouldLog", v34);
  if ([v12 shouldLogToDisk]) {
    int v14 = v13 | 2;
  }
  else {
    int v14 = v13;
  }
  if (!os_log_type_enabled((os_log_t)[v12 OSLogObject], OS_LOG_TYPE_INFO)) {
    v14 &= 2u;
  }
  if (v14)
  {
    uint64_t v15 = objc_opt_class();
    int v43 = 138412290;
    uint64_t v44 = v15;
    LODWORD(v36) = 12;
    v35 = &v43;
    uint64_t v16 = _os_log_send_and_compose_impl();
    if (v16)
    {
      uint64_t v17 = (void *)v16;
      v18 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v16, 4, &v43, v36);
      free(v17);
      v35 = (int *)v18;
      SSFileLog();
    }
  }
  objc_msgSend(v9, "start", v35);
  [(Daemon *)self takeKeepAliveAssertion:@"com.apple.itunesstored.launch"];
  dispatch_time_t v19 = dispatch_time(0, 10000000000);
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100149A28;
  block[3] = &unk_1003A33A8;
  block[4] = self;
  dispatch_after(v19, dispatchQueue, block);
  [v10 start];
  [v11 start];
  objc_msgSend(+[PurchaseController sharedController](PurchaseController, "sharedController"), "start");
  objc_msgSend(+[AppReceiptController sharedController](AppReceiptController, "sharedController"), "start");
  objc_msgSend(+[DirectUploadController sharedController](DirectUploadController, "sharedController"), "start");
  [+[CacheDeleteCoordinator sharedInstance] updatePurgeableStorage];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  bagTimers = self->_bagTimers;
  id v22 = [(NSMutableArray *)bagTimers countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v38;
    do
    {
      for (i = 0; i != v23; i = (char *)i + 1)
      {
        if (*(void *)v38 != v24) {
          objc_enumerationMutation(bagTimers);
        }
        [*(id *)(*((void *)&v37 + 1) + 8 * i) start];
      }
      id v23 = [(NSMutableArray *)bagTimers countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v23);
  }
  +[ExplicitPreferenceManager sharedManager];
  v26 = [[BatterySaverWatcher alloc] initWithDelegate:self];
  self->_batterySaverWatcher = v26;
  [(Daemon *)self batterySaverWatcherDidChangeState:v26];
  +[PurchaseActionsManager registerInstallAttributionDatabaseCleanTask];
  +[PurchaseActionsManager registerInstallAttributionPingbackRetryTask];
  [+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults") registerDefaults:+[NSDictionary dictionaryWithContentsOfURL:](NSDictionary, "dictionaryWithContentsOfURL:", [+[NSBundle mainBundle] URLForResource:@"Defaults" withExtension:@"plist"])];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, kSSDaemonLaunchedNotification, 0, 0, 1u);
  id v28 = +[SSLogConfig sharedDaemonConfig];
  if (!v28) {
    id v28 = +[SSLogConfig sharedConfig];
  }
  unsigned int v29 = [v28 shouldLog];
  if ([v28 shouldLogToDisk]) {
    int v30 = v29 | 2;
  }
  else {
    int v30 = v29;
  }
  if (!os_log_type_enabled((os_log_t)[v28 OSLogObject], OS_LOG_TYPE_INFO)) {
    v30 &= 2u;
  }
  if (v30)
  {
    uint64_t v31 = objc_opt_class();
    int v43 = 138412290;
    uint64_t v44 = v31;
    LODWORD(v36) = 12;
    uint64_t v32 = _os_log_send_and_compose_impl();
    if (v32)
    {
      v33 = (void *)v32;
      +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v32, 4, &v43, v36);
      free(v33);
      SSFileLog();
    }
  }
}

- (AMSBagValue)changeLanguageURL
{
  id v2 = objc_alloc_init((Class)ISLoadURLBagOperation);
  id v3 = objc_alloc_init((Class)AMSBinaryPromise);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100149CB8;
  v17[3] = &unk_1003A33A8;
  v17[4] = v3;
  [v2 setCompletionBlock:v17];
  id v4 = +[ISOperationQueue mainQueue];
  id v22 = v2;
  objc_msgSend(v4, "addOperations:waitUntilFinished:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v22, 1), 1);
  uint64_t v16 = 0;
  if ([v3 resultWithTimeout:&v16 error:60.0]) {
    return (AMSBagValue *)+[AMSBagValue frozenBagValueWithKey:value:valueType:](AMSBagValue, "frozenBagValueWithKey:value:valueType:", @"change-language", objc_msgSend(objc_msgSend(v2, "URLBag"), "urlForKey:", @"change-language"), 5);
  }
  id v6 = +[SSLogConfig sharedDaemonConfig];
  if (!v6) {
    id v6 = +[SSLogConfig sharedConfig];
  }
  unsigned int v7 = [v6 shouldLog];
  if ([v6 shouldLogToDisk]) {
    int v8 = v7 | 2;
  }
  else {
    int v8 = v7;
  }
  if (!os_log_type_enabled((os_log_t)[v6 OSLogObject], OS_LOG_TYPE_ERROR)) {
    v8 &= 2u;
  }
  if (v8)
  {
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = AMSLogableError();
    int v18 = 138543618;
    uint64_t v19 = v9;
    __int16 v20 = 2114;
    uint64_t v21 = v10;
    LODWORD(v15) = 22;
    int v14 = &v18;
    uint64_t v11 = _os_log_send_and_compose_impl();
    if (v11)
    {
      id v12 = (void *)v11;
      unsigned int v13 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v11, 4, &v18, v15);
      free(v12);
      int v14 = (int *)v13;
      SSFileLog();
    }
  }
  return (AMSBagValue *)+[AMSBagValue failingBagValueWithKey:@"change-language", 5, v16, v14 valueType error];
}

- (AMSBagValue)trustedDomains
{
  id v2 = objc_alloc_init((Class)ISLoadURLBagOperation);
  id v3 = objc_alloc_init((Class)AMSBinaryPromise);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100149F40;
  v17[3] = &unk_1003A33A8;
  v17[4] = v3;
  [v2 setCompletionBlock:v17];
  id v4 = +[ISOperationQueue mainQueue];
  id v22 = v2;
  objc_msgSend(v4, "addOperations:waitUntilFinished:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v22, 1), 1);
  uint64_t v16 = 0;
  if ([v3 resultWithTimeout:&v16 error:60.0]) {
    return (AMSBagValue *)+[AMSBagValue frozenBagValueWithKey:value:valueType:](AMSBagValue, "frozenBagValueWithKey:value:valueType:", @"trustedDomains", objc_msgSend(objc_msgSend(v2, "URLBag"), "valueForKey:", @"trustedDomains"), 0);
  }
  id v6 = +[SSLogConfig sharedDaemonConfig];
  if (!v6) {
    id v6 = +[SSLogConfig sharedConfig];
  }
  unsigned int v7 = [v6 shouldLog];
  if ([v6 shouldLogToDisk]) {
    int v8 = v7 | 2;
  }
  else {
    int v8 = v7;
  }
  if (!os_log_type_enabled((os_log_t)[v6 OSLogObject], OS_LOG_TYPE_ERROR)) {
    v8 &= 2u;
  }
  if (v8)
  {
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = AMSLogableError();
    int v18 = 138543618;
    uint64_t v19 = v9;
    __int16 v20 = 2114;
    uint64_t v21 = v10;
    LODWORD(v15) = 22;
    int v14 = &v18;
    uint64_t v11 = _os_log_send_and_compose_impl();
    if (v11)
    {
      id v12 = (void *)v11;
      unsigned int v13 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v11, 4, &v18, v15);
      free(v12);
      int v14 = (int *)v13;
      SSFileLog();
    }
  }
  return (AMSBagValue *)+[AMSBagValue failingBagValueWithKey:@"trustedDomains", 0, v16, v14 valueType error];
}

- (void)batterySaverWatcherDidChangeState:(id)a3
{
  unsigned int v3 = [a3 batterySaverEnabled];
  id v4 = +[SSLogConfig sharedDaemonConfig];
  id v5 = v4;
  if (v3)
  {
    if (!v4) {
      id v5 = +[SSLogConfig sharedConfig];
    }
    unsigned int v6 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v7 = v6 | 2;
    }
    else {
      int v7 = v6;
    }
    if (!os_log_type_enabled((os_log_t)[v5 OSLogObject], OS_LOG_TYPE_INFO)) {
      v7 &= 2u;
    }
    if (v7)
    {
      int v18 = 138412290;
      uint64_t v19 = objc_opt_class();
      LODWORD(v17) = 12;
      uint64_t v16 = &v18;
      uint64_t v8 = _os_log_send_and_compose_impl();
      if (v8)
      {
        uint64_t v9 = (void *)v8;
        uint64_t v10 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v8, 4, &v18, v17);
        free(v9);
        uint64_t v16 = (int *)v10;
        SSFileLog();
      }
    }
    objc_msgSend(+[StoreDownloadQueue sharedDownloadQueue](StoreDownloadQueue, "sharedDownloadQueue", v16), "disableAutomaticDownloadsWithReason:", @"battery saver mode started");
  }
  else
  {
    if (!v4) {
      id v5 = +[SSLogConfig sharedConfig];
    }
    unsigned int v11 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v12 = v11 | 2;
    }
    else {
      int v12 = v11;
    }
    if (!os_log_type_enabled((os_log_t)[v5 OSLogObject], OS_LOG_TYPE_INFO)) {
      v12 &= 2u;
    }
    if (v12)
    {
      int v18 = 138412290;
      uint64_t v19 = objc_opt_class();
      LODWORD(v17) = 12;
      uint64_t v16 = &v18;
      uint64_t v13 = _os_log_send_and_compose_impl();
      if (v13)
      {
        int v14 = (void *)v13;
        uint64_t v15 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v13, 4, &v18, v17);
        free(v14);
        uint64_t v16 = (int *)v15;
        SSFileLog();
      }
    }
    objc_msgSend(+[StoreDownloadQueue sharedDownloadQueue](StoreDownloadQueue, "sharedDownloadQueue", v16), "enableAutomaticDownloadsWithReason:", @"battery saver mode ended");
  }
}

- (void)_getShowingDialogWithMessage:(id)a3 connection:(id)a4
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10014A238;
  block[3] = &unk_1003A3410;
  block[4] = a3;
  void block[5] = self;
  block[6] = a4;
  dispatch_async(dispatchQueue, block);
}

- (void)_networkUsageStateChangeNotification:(id)a3
{
  if ([+[ISNetworkObserver sharedInstance] isUsingNetwork])
  {
    [(Daemon *)self _reloadWiFiManager];
  }
  else
  {
    dispatch_time_t v4 = dispatch_time(0, 5000000000);
    dispatchQueue = self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10014A368;
    block[3] = &unk_1003A33A8;
    block[4] = self;
    dispatch_after(v4, dispatchQueue, block);
  }
}

- (void)_operationCountChanged:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10014A3E4;
  block[3] = &unk_1003A33A8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_expireCachedObjectForKey:(id)a3
{
  id v5 = -[NSMutableDictionary objectForKey:](self->_cachedObjects, "objectForKey:");
  if (v5)
  {
    [v5 setExpirationTimer:0];
    cachedObjects = self->_cachedObjects;
    [(NSMutableDictionary *)cachedObjects removeObjectForKey:a3];
  }
}

- (void)_handleWakeWithName:(const char *)a3 job:(id)a4
{
  id v7 = [objc_alloc((Class)NSString) initWithUTF8String:a3];
  id v8 = +[SSLogConfig sharedDaemonConfig];
  if (!v8) {
    id v8 = +[SSLogConfig sharedConfig];
  }
  unsigned int v9 = [v8 shouldLog];
  if ([v8 shouldLogToDisk]) {
    int v10 = v9 | 2;
  }
  else {
    int v10 = v9;
  }
  if (!os_log_type_enabled((os_log_t)[v8 OSLogObject], OS_LOG_TYPE_INFO)) {
    v10 &= 2u;
  }
  if (v10)
  {
    int v30 = 138412546;
    uint64_t v31 = objc_opt_class();
    __int16 v32 = 2080;
    v33 = a3;
    LODWORD(v22) = 22;
    uint64_t v21 = &v30;
    uint64_t v11 = _os_log_send_and_compose_impl();
    if (v11)
    {
      int v12 = (void *)v11;
      uint64_t v13 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v11, 4, &v30, v22);
      free(v12);
      uint64_t v21 = (int *)v13;
      SSFileLog();
    }
  }
  id v14 = objc_alloc_init((Class)NSMutableSet);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  backgroundTaskObservers = self->_backgroundTaskObservers;
  id v16 = [(NSMutableDictionary *)backgroundTaskObservers countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v26;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v26 != v18) {
          objc_enumerationMutation(backgroundTaskObservers);
        }
        uint64_t v20 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        if (objc_msgSend(v7, "hasPrefix:", v20, v21)) {
          objc_msgSend(v14, "unionSet:", -[NSMutableDictionary objectForKey:](self->_backgroundTaskObservers, "objectForKey:", v20));
        }
      }
      id v17 = [(NSMutableDictionary *)backgroundTaskObservers countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v17);
  }
  if (objc_msgSend(v14, "count", v21))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10014A71C;
    block[3] = &unk_1003A6F80;
    block[4] = v14;
    void block[5] = v7;
    block[6] = a4;
    dispatch_queue_t v24 = dispatch_queue_create("com.apple.itunesstored.Daemon.observers", 0);
    dispatch_async(v24, block);
  }

  xpc_dictionary_set_value(self->_satisfiedWakeRequests, a3, a4);
}

- (void)_initBackgroundTaskAgent
{
  self->_bagTimers = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  id v3 = +[URLBagTimer subscriptionRenewTimer];
  [v3 setEventBlock:&stru_1003A7BD0];
  [v3 setPreconditionsBlock:&stru_1003A7C10];
  bagTimers = self->_bagTimers;

  [(NSMutableArray *)bagTimers addObject:v3];
}

- (void)_finishProtectionClassCMigrationIfNeeded
{
  if (!+[ISFileProtectionClassMigrator isMigrationNeeded])return; {
  if (MKBDeviceUnlockedSinceBoot() == 1)
  }
    goto LABEL_3;
  int out_token = -1;
  dispatchQueue = self->_dispatchQueue;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10014ADFC;
  handler[3] = &unk_1003A7C58;
  int v18 = -1;
  uint32_t v8 = notify_register_dispatch("com.apple.mobile.keybagd.first_unlock", &out_token, dispatchQueue, handler);
  if (!v8)
  {
    if (MKBDeviceUnlockedSinceBoot() != 1) {
      return;
    }
LABEL_3:
    if ((+[ISFileProtectionClassMigrator migrate] & 1) == 0)
    {
      id v3 = +[SSLogConfig sharedDaemonConfig];
      if (!v3) {
        id v3 = +[SSLogConfig sharedConfig];
      }
      int v4 = [v3 shouldLog];
      int v5 = [v3 shouldLogToDisk] ? v4 | 2 : v4;
      if (os_log_type_enabled((os_log_t)[v3 OSLogObject], OS_LOG_TYPE_ERROR) ? v5 : v5 & 2)
      {
        LOWORD(v20[0]) = 0;
        LODWORD(v16) = 2;
        goto LABEL_25;
      }
    }
    return;
  }
  uint32_t v9 = v8;
  id v10 = +[SSLogConfig sharedDaemonConfig];
  if (!v10) {
    id v10 = +[SSLogConfig sharedConfig];
  }
  unsigned int v11 = [v10 shouldLog];
  if ([v10 shouldLogToDisk]) {
    int v12 = v11 | 2;
  }
  else {
    int v12 = v11;
  }
  if (os_log_type_enabled((os_log_t)[v10 OSLogObject], OS_LOG_TYPE_ERROR)) {
    int v13 = v12;
  }
  else {
    int v13 = v12 & 2;
  }
  if (v13)
  {
    v20[0] = 67109120;
    v20[1] = v9;
    LODWORD(v16) = 8;
LABEL_25:
    uint64_t v14 = _os_log_send_and_compose_impl();
    if (v14)
    {
      uint64_t v15 = (void *)v14;
      +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v14, 4, v20, v16);
      free(v15);
      SSFileLog();
    }
  }
}

- (void)_observeNotifications
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFStringRef v4 = (const __CFString *)off_100401458();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)sub_10014B0A0, v4, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  int v5 = +[NSNotificationCenter defaultCenter];
  [(NSNotificationCenter *)v5 addObserverForName:SSDeviceStoreFrontChangedNotification object:0 queue:0 usingBlock:&stru_1003A7C98];
  [(NSNotificationCenter *)v5 addObserverForName:SSAccountStoreChangedNotification object:0 queue:0 usingBlock:&stru_1003A7CB8];
  unsigned int v6 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_memorypressure, 0, 2uLL, 0);
  self->_jetsamSource = v6;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10014BA68;
  handler[3] = &unk_1003A33A8;
  void handler[4] = self;
  dispatch_source_set_event_handler((dispatch_source_t)v6, handler);
  dispatch_resume((dispatch_object_t)self->_jetsamSource);
  xpc_set_event_stream_handler("com.apple.distnoted.matching", (dispatch_queue_t)&_dispatch_main_q, &stru_1003A7CD8);
  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)&_dispatch_main_q, &stru_1003A7CF8);
  xpc_set_event_stream_handler(kNSURLSessionLaunchOnDemandNotificationName, (dispatch_queue_t)&_dispatch_main_q, &stru_1003A7D18);
}

- (void)_reloadOperationKeepAliveTransaction
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  keepAliveOperationQueues = self->_keepAliveOperationQueues;
  id v4 = [(NSMutableSet *)keepAliveOperationQueues countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(keepAliveOperationQueues);
        }
        if ((uint64_t)[*(id *)(*((void *)&v8 + 1) + 8 * i) operationCount] > 0)
        {
          if (!self->_aliveForOperationQueues)
          {
            self->_aliveForOperationQueues = 1;
            [(Daemon *)self takeKeepAliveAssertion:@"com.apple.itunesstored.keepQueuesAlive"];
          }
          return;
        }
      }
      id v5 = [(NSMutableSet *)keepAliveOperationQueues countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  if (self->_aliveForOperationQueues)
  {
    self->_aliveForOperationQueues = 0;
    [(Daemon *)self releaseKeepAliveAssertion:@"com.apple.itunesstored.keepQueuesAlive"];
  }
}

- (void)_reloadWiFiManager
{
  if ([+[ISNetworkObserver sharedInstance] isUsingNetwork])uint64_t v2 = 2; {
  else
  }
    uint64_t v2 = 1;
  id v3 = +[WiFiManager sharedWiFiManager];

  [v3 setClientType:v2];
}

- (void)_setGlobalState
{
  SSSetIsDaemon();
  +[SSSQLiteDatabase _setTakesTaskCompletionAssertions:0];
  id v3 = objc_alloc_init((Class)SSLogFileOptions);
  [v3 setLogFileBaseName:@"itunesstored"];
  objc_msgSend(v3, "setLogDirectoryPath:", objc_msgSend(objc_msgSend(objc_msgSend((id)CPSharedResourcesDirectory(), "stringByAppendingPathComponent:", @"Library"), "stringByAppendingPathComponent:", @"Logs"), "stringByAppendingPathComponent:", @"com.apple.itunesstored"));
  SSDebugSetFileLoggingOptions();

  id v4 = [+[ISDevice sharedInstance] copyProtocolConditionalContext];
  +[SSProtocolConditionalEvaluator setDefaultConditionalContext:v4];

  +[ISNetworkObserver sharedInstance];

  [(Daemon *)self _reloadWiFiManager];
}

- (void)_warmUpSharedURLCache
{
}

@end