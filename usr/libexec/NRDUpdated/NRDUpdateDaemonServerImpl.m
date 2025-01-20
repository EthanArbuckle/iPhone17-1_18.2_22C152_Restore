@interface NRDUpdateDaemonServerImpl
+ (id)sharedInstance;
- (BOOL)_isBrainRelaunchRequired:(id)a3;
- (BOOL)allowBackgroundActivity;
- (BOOL)isConnectionEntitled:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NRDUpdateDCore)core;
- (NRDUpdateDaemonServerImpl)init;
- (NSError)completedWithError;
- (NSError)needsRelaunchError;
- (OS_dispatch_queue)updateQueue;
- (void)getNRDUpdateBrainEndpoint:(id)a3;
- (void)requestExit:(int)a3 reason:(id)a4;
- (void)requestExit:(int)a3 reason:(id)a4 relaunchError:(id)a5;
- (void)runUntilExit;
- (void)setCompletedWithError:(id)a3;
- (void)setCore:(id)a3;
- (void)setNeedsRelaunchError:(id)a3;
- (void)setUpdateQueue:(id)a3;
- (void)update:(id)a3;
- (void)updateCompleted:(id)a3;
- (void)updateHelper:(id)a3 callback:(id)a4;
@end

@implementation NRDUpdateDaemonServerImpl

+ (id)sharedInstance
{
  if (sharedInstance_pred != -1) {
    dispatch_once(&sharedInstance_pred, &__block_literal_global_2);
  }
  v2 = (void *)sharedInstance___instance;

  return v2;
}

void __43__NRDUpdateDaemonServerImpl_sharedInstance__block_invoke(id a1)
{
  v2 = objc_alloc_init(NRDUpdateDaemonServerImpl);
  v3 = (void *)sharedInstance___instance;
  sharedInstance___instance = (uint64_t)v2;
}

- (BOOL)allowBackgroundActivity
{
  return edt_supports_recoveryos(0, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
}

- (void)runUntilExit
{
  unsigned int v3 = [(NRDUpdateDaemonServerImpl *)self allowBackgroundActivity];
  +[NSXPCListener enableTransactions];
  dispatch_queue_t v5 = dispatch_queue_create("com.apple.NRDUpdated.connectionQueue", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
  uint64_t v6 = (void *)__connectionQueue;
  __connectionQueue = (uint64_t)v5;

  id v7 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.mobile.NRDUpdated"];
  v8 = (void *)__listener;
  __listener = (uint64_t)v7;

  [(id)__listener setDelegate:self];
  [(id)__listener _setQueue:__connectionQueue];
  id v9 = [objc_alloc((Class)NSBackgroundActivityScheduler) initWithIdentifier:@"com.apple.mobile.NRDUpdated-RecoveryOSUpdateBrain_download"];
  [v9 setPreregistered:1];
  v10 = [v9 description];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = __41__NRDUpdateDaemonServerImpl_runUntilExit__block_invoke;
  v27[3] = &unk_100018870;
  char v28 = v3;
  v27[4] = self;
  v11 = objc_retainBlock(v27);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = __41__NRDUpdateDaemonServerImpl_runUntilExit__block_invoke_294;
  v24[3] = &unk_100018898;
  id v12 = v10;
  id v25 = v12;
  v26 = @"com.apple.mobile.NRDUpdated-RecoveryOSUpdateBrain_download";
  [v9 setCheckInHandler:v24];
  if (v3)
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = __41__NRDUpdateDaemonServerImpl_runUntilExit__block_invoke_295;
    v20[3] = &unk_1000188C0;
    id v21 = v12;
    v22 = @"com.apple.mobile.NRDUpdated-RecoveryOSUpdateBrain_download";
    v23 = v11;
    [v9 scheduleWithBlock:v20];
  }
  v13 = dispatch_get_global_queue(17, 0);
  v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  v17 = __41__NRDUpdateDaemonServerImpl_runUntilExit__block_invoke_297;
  v18 = &unk_1000188E8;
  id v19 = v11;
  v14 = v11;
  dispatch_async(v13, &v15);

  [(NRDUpdateDaemonServerImpl *)self _run];
}

void __41__NRDUpdateDaemonServerImpl_runUntilExit__block_invoke(uint64_t a1)
{
  v1[0] = _NSConcreteStackBlock;
  v1[1] = 3221225472;
  v1[2] = __41__NRDUpdateDaemonServerImpl_runUntilExit__block_invoke_2;
  v1[3] = &unk_100018870;
  char v2 = *(unsigned char *)(a1 + 40);
  v1[4] = *(void *)(a1 + 32);
  if (__listener_block_invoke_onceToken != -1) {
    dispatch_once(&__listener_block_invoke_onceToken, v1);
  }
}

id __41__NRDUpdateDaemonServerImpl_runUntilExit__block_invoke_2(uint64_t a1)
{
  CFBooleanRef v2 = (const __CFBoolean *)MGCopyAnswer();
  if (v2 != kCFBooleanFalse) {
    goto LABEL_3;
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  *(_OWORD *)buf = 0u;
  long long v19 = 0u;
  size_t v17 = 256;
  if (sysctlbyname("kern.bootargs", buf, &v17, 0, 0))
  {
LABEL_3:
    CFRelease(v2);
    unsigned int v3 = (unsigned char *)(a1 + 40);
    if (*(unsigned char *)(a1 + 40)) {
      goto LABEL_4;
    }
LABEL_18:
    v10 = nrdSharedLogger();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v11 = "Skipping RecoveryOSUpdateBrain launch on startup because background activity is not allowed.";
      goto LABEL_20;
    }
    goto LABEL_21;
  }
  v13 = strstr((char *)buf, "msu_nrd_brain_no_launch=1");
  CFRelease(v2);
  unsigned int v3 = (unsigned char *)(a1 + 40);
  if (!*(unsigned char *)(a1 + 40)) {
    goto LABEL_18;
  }
  if (v13)
  {
    v10 = nrdSharedLogger();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v11 = "Skipping RecoveryOSUpdateBrain launch on startup due to nvram boot-arg msu_nrd_brain_no_launch=1";
LABEL_20:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v11, buf, 2u);
    }
LABEL_21:

    goto LABEL_22;
  }
LABEL_4:
  uint64_t v4 = +[NSUserDefaults standardUserDefaults];
  uint64_t v5 = [v4 objectForKey:@"EnableUpdateOnLaunch"];
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    id v7 = +[NSUserDefaults standardUserDefaults];
    unsigned int v8 = [v7 BOOLForKey:@"EnableUpdateOnLaunch"];

    if (!v8)
    {
      id v9 = nrdSharedLogger();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Skipping RecoveryOSUpdateBrain launch on startup", buf, 2u);
      }

      v10 = nrdSharedLogger();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_21;
      }
      *(_WORD *)buf = 0;
      v11 = "To enable RecoveryOSUpdateBrain launch on startup set the following for the 'mobile' user: defaults write co"
            "m.apple.mobile.NRDUpdated EnableUpdateOnLaunch -BOOL YES";
      goto LABEL_20;
    }
  }
  else
  {
  }
  id v12 = nrdSharedLogger();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Attempting RecoveryOSUpdateBrain download/launch on startup", buf, 2u);
  }

  [*(id *)(a1 + 32) update:&__block_literal_global_293];
LABEL_22:
  if (*v3)
  {
    v14 = [*(id *)(a1 + 32) core];
    [v14 scheduleNRDUpdateBrainReScan:1];

    v15 = [*(id *)(a1 + 32) core];
    [v15 scheduleNRDUpdateBrainPeriodicScan];
  }
  return [(id)__listener resume];
}

void __41__NRDUpdateDaemonServerImpl_runUntilExit__block_invoke_290(id a1, NSError *a2)
{
  CFBooleanRef v2 = a2;
  unsigned int v3 = nrdSharedLogger();
  uint64_t v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __41__NRDUpdateDaemonServerImpl_runUntilExit__block_invoke_290_cold_1((uint64_t)v2, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "RecoveryOSUpdateBrain launch completed successfully", v11, 2u);
  }
}

void __41__NRDUpdateDaemonServerImpl_runUntilExit__block_invoke_294(uint64_t a1)
{
  CFBooleanRef v2 = nrdSharedLogger();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v8 = 138543618;
    uint64_t v9 = v3;
    __int16 v10 = 2114;
    uint64_t v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Activity %{public}@ \"%{public}@\" check-in.", (uint8_t *)&v8, 0x16u);
  }

  uint64_t v5 = nrdSharedLogger();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    int v8 = 138543618;
    uint64_t v9 = v6;
    __int16 v10 = 2114;
    uint64_t v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Activity %{public}@ \"%{public}@\" check-in complete.", (uint8_t *)&v8, 0x16u);
  }
}

void __41__NRDUpdateDaemonServerImpl_runUntilExit__block_invoke_295(void *a1, void *a2)
{
  uint64_t v3 = a2;
  uint64_t v4 = nrdSharedLogger();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = a1[4];
    uint64_t v6 = a1[5];
    int v10 = 138543618;
    uint64_t v11 = v5;
    __int16 v12 = 2114;
    uint64_t v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Activity %{public}@ \"%{public}@\" fired.", (uint8_t *)&v10, 0x16u);
  }

  (*(void (**)(void))(a1[6] + 16))();
  uint64_t v7 = nrdSharedLogger();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = a1[4];
    uint64_t v9 = a1[5];
    int v10 = 138543618;
    uint64_t v11 = v8;
    __int16 v12 = 2114;
    uint64_t v13 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Activity %{public}@ \"%{public}@\" completed.", (uint8_t *)&v10, 0x16u);
  }

  v3[2](v3, 1);
}

void __41__NRDUpdateDaemonServerImpl_runUntilExit__block_invoke_297(uint64_t a1)
{
  CFBooleanRef v2 = nrdSharedLogger();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Startup task executing", buf, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v3 = nrdSharedLogger();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Startup task execution complete.", v4, 2u);
  }
}

- (NRDUpdateDaemonServerImpl)init
{
  v8.receiver = self;
  v8.super_class = (Class)NRDUpdateDaemonServerImpl;
  CFBooleanRef v2 = [(NRDUpdateDaemonServerImpl *)&v8 init];
  if (v2)
  {
    id v3 = [(id)objc_opt_new() initWithDelegate:v2];
    [(NRDUpdateDaemonServerImpl *)v2 setCore:v3];
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.NRDUpdateDServer.update", 0);
    [(NRDUpdateDaemonServerImpl *)v2 setUpdateQueue:v4];

    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    updateSemaphore = v2->_updateSemaphore;
    v2->_updateSemaphore = (OS_dispatch_semaphore *)v5;
  }
  return v2;
}

- (void)updateHelper:(id)a3 callback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(NRDUpdateDaemonServerImpl *)self updateQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __51__NRDUpdateDaemonServerImpl_updateHelper_callback___block_invoke;
  block[3] = &unk_100018910;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __51__NRDUpdateDaemonServerImpl_updateHelper_callback___block_invoke(uint64_t a1)
{
  id v7 = [*(id *)(a1 + 32) needsRelaunchError];
  if (v7)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v2 = *(void *)(a1 + 40);
    id v3 = [*(id *)(a1 + 32) core];
    [v3 setUpdateOptions:v2];

    dispatch_queue_t v4 = [*(id *)(a1 + 32) core];
    [v4 performUpdate:0];

    dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 8), 0xFFFFFFFFFFFFFFFFLL);
    uint64_t v5 = *(void *)(a1 + 48);
    id v6 = [*(id *)(a1 + 32) completedWithError];
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
  }
}

- (void)update:(id)a3
{
}

- (BOOL)_isBrainRelaunchRequired:(id)a3
{
  id v3 = a3;
  if (!v3) {
    return 0;
  }
  dispatch_queue_t v4 = v3;
  do
  {
    uint64_t v5 = [v4 domain];
    if ([v5 isEqualToString:@"NRDUpdateErrorDomain"])
    {
      id v6 = [v4 code];

      if (v6 == (id)112)
      {
        BOOL v9 = 1;
        goto LABEL_10;
      }
    }
    else
    {
    }
    id v7 = [v4 userInfo];
    uint64_t v8 = [v7 objectForKeyedSubscript:NSUnderlyingErrorKey];

    dispatch_queue_t v4 = (void *)v8;
  }
  while (v8);
  BOOL v9 = 0;
LABEL_10:

  return v9;
}

- (void)updateCompleted:(id)a3
{
  id v4 = a3;
  [(NRDUpdateDaemonServerImpl *)self setCompletedWithError:v4];
  uint64_t v5 = nrdSharedLogger();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[NRDUpdateDaemonServerImpl updateCompleted:]((uint64_t)v4, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "update completed successfully", v13, 2u);
  }

  if ([(NRDUpdateDaemonServerImpl *)self _isBrainRelaunchRequired:v4]) {
    [(NRDUpdateDaemonServerImpl *)self requestExit:0 reason:@"NRD brain has downloaded a new brain (via NSError)" relaunchError:v4];
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_updateSemaphore);
}

- (void)requestExit:(int)a3 reason:(id)a4
{
}

- (void)requestExit:(int)a3 reason:(id)a4 relaunchError:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = nrdSharedLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v17 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Daemon exit requested for reason: %{public}@", buf, 0xCu);
  }

  if (v9) {
    [(NRDUpdateDaemonServerImpl *)self setNeedsRelaunchError:v9];
  }
  uint64_t v11 = [(NRDUpdateDaemonServerImpl *)self updateQueue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __62__NRDUpdateDaemonServerImpl_requestExit_reason_relaunchError___block_invoke;
  v13[3] = &unk_100018938;
  int v15 = a3;
  id v14 = v8;
  id v12 = v8;
  dispatch_async(v11, v13);
}

void __62__NRDUpdateDaemonServerImpl_requestExit_reason_relaunchError___block_invoke(uint64_t a1)
{
  sleep(1u);
  uint64_t v2 = nrdSharedLogger();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(_DWORD *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 32);
    v5[0] = 67109378;
    v5[1] = v3;
    __int16 v6 = 2114;
    uint64_t v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Exiting with status:%d for reason:%{public}@", (uint8_t *)v5, 0x12u);
  }

  exit(*(_DWORD *)(a1 + 40));
}

- (void)getNRDUpdateBrainEndpoint:(id)a3
{
  uint64_t v4 = (void (**)(id, void, void *))a3;
  uint64_t v5 = [(NRDUpdateDaemonServerImpl *)self core];

  if (!v5)
  {
    NSErrorUserInfoKey v15 = NSDebugDescriptionErrorKey;
    CFStringRef v16 = @"core is not initialized";
    uint64_t v10 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    uint64_t v11 = 604;
LABEL_6:
    id v12 = +[NSError errorWithDomain:@"NRDUpdatedDomain" code:v11 userInfo:v10];
    v4[2](v4, 0, v12);

    goto LABEL_7;
  }
  __int16 v6 = [(NRDUpdateDaemonServerImpl *)self core];
  uint64_t v7 = [v6 runningBrain];

  if (!v7)
  {
    NSErrorUserInfoKey v13 = NSDebugDescriptionErrorKey;
    CFStringRef v14 = @"no running brain";
    uint64_t v10 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    uint64_t v11 = 605;
    goto LABEL_6;
  }
  id v8 = [(NRDUpdateDaemonServerImpl *)self core];
  id v9 = [v8 runningBrain];
  [v9 getListenerEndpoint:v4];

LABEL_7:
}

- (BOOL)isConnectionEntitled:(id)a3
{
  int v3 = [a3 valueForEntitlement:@"com.apple.private.allow-NRDUpdated"];
  if (!v3)
  {
    uint64_t v5 = nrdSharedLogger();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[NRDUpdateDaemonServerImpl isConnectionEntitled:](v5, v6, v7, v8, v9, v10, v11, v12);
    }
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v5 = nrdSharedLogger();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[NRDUpdateDaemonServerImpl isConnectionEntitled:](v5, v13, v14, v15, v16, v17, v18, v19);
    }
    goto LABEL_11;
  }
  if (([v3 BOOLValue] & 1) == 0)
  {
    uint64_t v5 = nrdSharedLogger();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[NRDUpdateDaemonServerImpl isConnectionEntitled:](v5, v20, v21, v22, v23, v24, v25, v26);
    }
LABEL_11:

    BOOL v4 = 0;
    goto LABEL_12;
  }
  BOOL v4 = 1;
LABEL_12:

  return v4;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  uint64_t v6 = nrdSharedLogger();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "shouldAcceptNewConnection", buf, 2u);
  }

  BOOL v7 = [(NRDUpdateDaemonServerImpl *)self isConnectionEntitled:v5];
  if (v7)
  {
    [v5 _setQueue:__connectionQueue];
    [v5 setInterruptionHandler:&__block_literal_global_322];
    [v5 setInvalidationHandler:&__block_literal_global_325];
    uint64_t v8 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___NRDUpdatedProtocol];
    [v5 setExportedInterface:v8];
    [v5 setExportedObject:self];
    [v5 resume];
    uint64_t v9 = nrdSharedLogger();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "shouldAcceptNewConnection resumed", v19, 2u);
    }
  }
  else
  {
    uint64_t v10 = nrdSharedLogger();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[NRDUpdateDaemonServerImpl listener:shouldAcceptNewConnection:](v10, v11, v12, v13, v14, v15, v16, v17);
    }

    [v5 invalidate];
  }

  return v7;
}

void __64__NRDUpdateDaemonServerImpl_listener_shouldAcceptNewConnection___block_invoke(id a1)
{
  v1 = nrdSharedLogger();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __64__NRDUpdateDaemonServerImpl_listener_shouldAcceptNewConnection___block_invoke_cold_1(v1, v2, v3, v4, v5, v6, v7, v8);
  }
}

void __64__NRDUpdateDaemonServerImpl_listener_shouldAcceptNewConnection___block_invoke_323(id a1)
{
  v1 = nrdSharedLogger();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __64__NRDUpdateDaemonServerImpl_listener_shouldAcceptNewConnection___block_invoke_323_cold_1(v1, v2, v3, v4, v5, v6, v7, v8);
  }
}

- (NRDUpdateDCore)core
{
  return self->_core;
}

- (void)setCore:(id)a3
{
}

- (OS_dispatch_queue)updateQueue
{
  return self->_updateQueue;
}

- (void)setUpdateQueue:(id)a3
{
}

- (NSError)completedWithError
{
  return self->_completedWithError;
}

- (void)setCompletedWithError:(id)a3
{
}

- (NSError)needsRelaunchError
{
  return self->_needsRelaunchError;
}

- (void)setNeedsRelaunchError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_needsRelaunchError, 0);
  objc_storeStrong((id *)&self->_completedWithError, 0);
  objc_storeStrong((id *)&self->_updateQueue, 0);
  objc_storeStrong((id *)&self->_core, 0);

  objc_storeStrong((id *)&self->_updateSemaphore, 0);
}

void __41__NRDUpdateDaemonServerImpl_runUntilExit__block_invoke_290_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)updateCompleted:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)isConnectionEntitled:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)isConnectionEntitled:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)isConnectionEntitled:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)listener:(uint64_t)a3 shouldAcceptNewConnection:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __64__NRDUpdateDaemonServerImpl_listener_shouldAcceptNewConnection___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __64__NRDUpdateDaemonServerImpl_listener_shouldAcceptNewConnection___block_invoke_323_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end