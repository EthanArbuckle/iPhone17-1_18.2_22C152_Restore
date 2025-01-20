@interface JSABridge
+ (JSABridge)sharedInstance;
- (AMSPromise)packagePromise;
- (AMSPromise)templateRegistrationPromise;
- (BOOL)hasStarted;
- (BOOL)isLoadingScript;
- (BOOL)isScriptLoaded;
- (JSABridge)init;
- (JSABridgeDataSource)dataSource;
- (JSABridgeTemplateBundleRegistering)templateBundleRegistrar;
- (JSAEnvironment)environment;
- (JSAPackage)currentPackage;
- (JSAPackageProvisioner)launchPackageProvisioner;
- (JSAPendingExecutionRecordQueue)generalExecutionRecordQueue;
- (JSAPendingExecutionRecordQueue)launchExecutionRecordQueue;
- (JSAWindowManager)windowManager;
- (NSDate)lastScriptCacheDate;
- (NSString)pendingPackageVersion;
- (OS_dispatch_queue)accessQueue;
- (OS_dispatch_queue)bootstrapQueue;
- (id)_beforeJSAppLaunchBlock;
- (void)bootstrapWithObjectRegistrations:(id)a3;
- (void)checkForUpgradeWithCompletion:(id)a3;
- (void)enqueueBlock:(id)a3 file:(id)a4 line:(int64_t)a5;
- (void)enqueueBlockForInitialLaunch:(id)a3 file:(id)a4 line:(int64_t)a5;
- (void)enqueueBlockPrefersSync:(id)a3 file:(id)a4 line:(int64_t)a5;
- (void)enqueueManagedValueCall:(id)a3 arguments:(id)a4 file:(id)a5 line:(int64_t)a6;
- (void)enqueueManagedValueInvocation:(id)a3 method:(id)a4 arguments:(id)a5 file:(id)a6 line:(int64_t)a7;
- (void)enqueueValueCall:(id)a3 arguments:(id)a4 file:(id)a5 line:(int64_t)a6;
- (void)enqueueValueInvocation:(id)a3 method:(id)a4 arguments:(id)a5 file:(id)a6 line:(int64_t)a7;
- (void)initializeEnvironmentWithDataSource:(id)a3 completion:(id)a4;
- (void)setAccessQueue:(id)a3;
- (void)setBootstrapQueue:(id)a3;
- (void)setCurrentPackage:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setGeneralExecutionRecordQueue:(id)a3;
- (void)setHasStarted:(BOOL)a3;
- (void)setIsLoadingScript:(BOOL)a3;
- (void)setIsScriptLoaded:(BOOL)a3;
- (void)setLastScriptCacheDate:(id)a3;
- (void)setLaunchExecutionRecordQueue:(id)a3;
- (void)setLaunchPackageProvisioner:(id)a3;
- (void)setPackagePromise:(id)a3;
- (void)setPendingPackageVersion:(id)a3;
- (void)setTemplateBundleRegistrar:(id)a3;
- (void)setTemplateRegistrationPromise:(id)a3;
- (void)setWindowManager:(id)a3;
- (void)set_beforeJSAppLaunchBlock:(id)a3;
- (void)setupWithPackage:(id)a3 completion:(id)a4;
- (void)startProvisioningPackage;
- (void)upgradePackage:(id)a3 completion:(id)a4;
@end

@implementation JSABridge

- (JSABridge)init
{
  v18.receiver = self;
  v18.super_class = (Class)JSABridge;
  v2 = [(JSABridge *)&v18 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v5 = dispatch_queue_create("JSABridge.accessQueue", v4);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v5;

    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v9 = dispatch_queue_create("JSABridge.accessQueue", v8);
    bootstrapQueue = v2->_bootstrapQueue;
    v2->_bootstrapQueue = (OS_dispatch_queue *)v9;

    v11 = objc_alloc_init(JSAPendingExecutionRecordQueue);
    launchExecutionRecordQueue = v2->_launchExecutionRecordQueue;
    v2->_launchExecutionRecordQueue = v11;

    v13 = objc_alloc_init(JSAPendingExecutionRecordQueue);
    generalExecutionRecordQueue = v2->_generalExecutionRecordQueue;
    v2->_generalExecutionRecordQueue = v13;

    v15 = [[JSAPackageProvisioner alloc] initWithLaunching:1 onQueue:v2->_bootstrapQueue];
    launchPackageProvisioner = v2->_launchPackageProvisioner;
    v2->_launchPackageProvisioner = v15;
  }
  return v2;
}

+ (JSABridge)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_23964;
  block[3] = &unk_B2510;
  block[4] = a1;
  if (qword_CE3E0 != -1) {
    dispatch_once(&qword_CE3E0, block);
  }
  v2 = (void *)qword_CE3E8;

  return (JSABridge *)v2;
}

- (void)bootstrapWithObjectRegistrations:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = JSALog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = +[NSBundle mainBundle];
    v7 = [v6 bundleIdentifier];
    *(_DWORD *)buf = 138543362;
    v13 = v7;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "JSABridge bootstrapping for %{public}@", buf, 0xCu);
  }
  bootstrapQueue = self->_bootstrapQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_23AF8;
  v10[3] = &unk_B2050;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  dispatch_sync(bootstrapQueue, v10);
}

- (void)initializeEnvironmentWithDataSource:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  +[JSAMetricsAppLaunchEvent markJSBootstrapStartTime];
  v8 = JSALog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = +[NSBundle mainBundle];
    v10 = [v9 bundleIdentifier];
    *(_DWORD *)buf = 138543362;
    v24 = v10;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "JSABridge initializing environment for %{public}@", buf, 0xCu);
  }
  +[JSAHarConfiguration setup];
  id v11 = +[NSUserDefaults standardUserDefaults];
  unsigned int v12 = [v11 BOOLForKey:@"BKHotReloadEnabled"];

  if (v12)
  {
    v13 = +[JSAHotReloadController sharedController];
    [v13 startWithCompletion:0];
  }
  [(JSABridge *)self setDataSource:v6];
  v14 = [v6 windowProviderForBridge:self];
  v15 = [[JSAWindowManager alloc] initWithWindowProvider:v14];
  [(JSABridge *)self setWindowManager:v15];

  v16 = objc_opt_new();
  [(JSABridge *)self setPackagePromise:v16];

  bootstrapQueue = self->_bootstrapQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_23D90;
  block[3] = &unk_B3230;
  id v21 = v6;
  id v22 = v7;
  block[4] = self;
  id v18 = v6;
  id v19 = v7;
  dispatch_async(bootstrapQueue, block);
}

- (void)startProvisioningPackage
{
  v3 = JSALog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)dispatch_queue_t v5 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Start provisioning package for launch", v5, 2u);
  }

  id v4 = [(JSABridge *)self launchPackageProvisioner];
  [v4 provisionWithCompletionHandler:&stru_B3270];
}

- (void)checkForUpgradeWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = [[JSAPackageProvisioner alloc] initWithLaunching:0];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_24380;
  v7[3] = &unk_B3298;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(JSAPackageProvisioner *)v5 provisionWithCompletionHandler:v7];
}

- (void)upgradePackage:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = v6;
    id v9 = JSALog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = [v8 version];
      *(_DWORD *)buf = 136446466;
      v23 = "-[JSABridge upgradePackage:completion:]";
      __int16 v24 = 2114;
      v25 = v10;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "%{public}s upgrading to given package with version %{public}@", buf, 0x16u);
    }
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_2487C;
    v19[3] = &unk_B2650;
    id v20 = v8;
    id v21 = v7;
    id v11 = v7;
    unsigned int v12 = (JSAPackageProvisioner *)v8;
    [(JSABridge *)self setupWithPackage:v12 completion:v19];

    v13 = v20;
  }
  else
  {
    v14 = JSALog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = [(JSABridge *)self pendingPackageVersion];
      *(_DWORD *)buf = 136446466;
      v23 = "-[JSABridge upgradePackage:completion:]";
      __int16 v24 = 2114;
      v25 = v15;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "%{public}s upgrading to pending package with last known version %{public}@", buf, 0x16u);
    }
    unsigned int v12 = [[JSAPackageProvisioner alloc] initWithLaunching:0];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_24978;
    v17[3] = &unk_B3298;
    v17[4] = self;
    id v18 = v7;
    id v16 = v7;
    [(JSAPackageProvisioner *)v12 provisionWithCompletionHandler:v17];
    v13 = v18;
  }
}

- (void)setupWithPackage:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = JSALog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v31 = v6;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "JSABridge loadScriptFromPackage: %@", buf, 0xCu);
  }

  [(JSABridge *)self setIsLoadingScript:1];
  id v9 = [(JSABridge *)self currentPackage];

  if (v9)
  {
    v10 = +[AMSPromise promiseWithResult:v6];
    [(JSABridge *)self setPackagePromise:v10];
  }
  else
  {
    id v11 = [(JSABridge *)self packagePromise];
    unsigned __int8 v12 = [v11 isFinished];

    if (v12) {
      goto LABEL_8;
    }
    v10 = [(JSABridge *)self packagePromise];
    [v10 finishWithResult:v6];
  }

LABEL_8:
  [(JSABridge *)self setCurrentPackage:v6];
  unsigned int v13 = [(JSABridge *)self isScriptLoaded];
  if (v13) {
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_B32B8);
  }
  id v14 = objc_alloc_init((Class)AMSPromise);
  [(JSABridge *)self setTemplateRegistrationPromise:v14];
  v15 = [(JSABridge *)self templateBundleRegistrar];
  if (!v15)
  {
    id v16 = JSALog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      sub_85A60();
    }
  }
  if (v13) {
    intptr_t v17 = 25;
  }
  else {
    intptr_t v17 = 33;
  }
  id v18 = dispatch_get_global_queue(v17, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_24F88;
  block[3] = &unk_B2560;
  block[4] = self;
  id v19 = v6;
  id v28 = v19;
  id v29 = v14;
  id v20 = v14;
  dispatch_async(v18, block);

  id v21 = [(JSABridge *)self environment];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_25000;
  v24[3] = &unk_B32E0;
  v24[4] = self;
  id v25 = v19;
  id v26 = v7;
  id v22 = v7;
  id v23 = v19;
  [v21 loadScriptFromPackage:v23 completion:v24];
}

- (void)enqueueBlock:(id)a3 file:(id)a4 line:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    v10 = JSALog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = objc_retainBlock(v8);
      int v14 = 138543874;
      id v15 = v11;
      __int16 v16 = 2114;
      id v17 = v9;
      __int16 v18 = 2048;
      int64_t v19 = a5;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "JSABridge enqueue block '%{public}@' from %{public}@:%li", (uint8_t *)&v14, 0x20u);
    }
    unsigned __int8 v12 = [[JSAPendingExecutionRecord alloc] initWithBlock:v8];
    unsigned int v13 = [(JSABridge *)self generalExecutionRecordQueue];
    [v13 enqueueRecord:v12];

    sub_25188(self, 0);
  }
}

- (void)enqueueBlockPrefersSync:(id)a3 file:(id)a4 line:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    v10 = JSALog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = objc_retainBlock(v8);
      int v14 = 138543874;
      id v15 = v11;
      __int16 v16 = 2114;
      id v17 = v9;
      __int16 v18 = 2048;
      int64_t v19 = a5;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "JSABridge enqueue block sync '%{public}@' from %{public}@:%li", (uint8_t *)&v14, 0x20u);
    }
    unsigned __int8 v12 = [[JSAPendingExecutionRecord alloc] initWithBlock:v8];
    unsigned int v13 = [(JSABridge *)self generalExecutionRecordQueue];
    [v13 enqueueRecord:v12];

    sub_25188(self, 1);
  }
}

- (void)enqueueBlockForInitialLaunch:(id)a3 file:(id)a4 line:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    v10 = JSALog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = objc_retainBlock(v8);
      int v17 = 138543874;
      id v18 = v11;
      __int16 v19 = 2114;
      id v20 = v9;
      __int16 v21 = 2048;
      int64_t v22 = a5;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "JSABridge enqueue block for initial launch '%{public}@' from %{public}@:%li", (uint8_t *)&v17, 0x20u);
    }
    unsigned __int8 v12 = [(JSABridge *)self launchExecutionRecordQueue];
    unsigned int v13 = v12;
    if (v12)
    {
      id v14 = v12;
    }
    else
    {
      id v14 = [(JSABridge *)self generalExecutionRecordQueue];
    }
    id v15 = v14;

    __int16 v16 = [[JSAPendingExecutionRecord alloc] initWithBlock:v8];
    [v15 enqueueRecord:v16];
    sub_25188(self, 0);
  }
}

- (void)enqueueValueCall:(id)a3 arguments:(id)a4 file:(id)a5 line:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10)
  {
    unsigned int v13 = JSALog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 134349826;
      id v17 = v10;
      __int16 v18 = 2048;
      id v19 = [v11 count];
      __int16 v20 = 2114;
      id v21 = v12;
      __int16 v22 = 2048;
      int64_t v23 = a6;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "JSABridge enqueue value call '%{public}p' with %lu args from %{public}@:%li", (uint8_t *)&v16, 0x2Au);
    }

    id v14 = [[JSAPendingExecutionRecord alloc] initWithValue:v10 method:0 arguments:v11 type:2];
    id v15 = [(JSABridge *)self generalExecutionRecordQueue];
    [v15 enqueueRecord:v14];

    sub_25188(self, 0);
  }
}

- (void)enqueueValueInvocation:(id)a3 method:(id)a4 arguments:(id)a5 file:(id)a6 line:(int64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (v12)
  {
    int v16 = JSALog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 134350082;
      id v20 = v12;
      __int16 v21 = 2114;
      id v22 = v13;
      __int16 v23 = 2048;
      id v24 = [v14 count];
      __int16 v25 = 2114;
      id v26 = v15;
      __int16 v27 = 2048;
      int64_t v28 = a7;
      _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "JSABridge enqueue value invocation '%{public}p' for '%{public}@' with %lu args from %{public}@:%li", (uint8_t *)&v19, 0x34u);
    }

    id v17 = [[JSAPendingExecutionRecord alloc] initWithValue:v12 method:v13 arguments:v14 type:3];
    __int16 v18 = [(JSABridge *)self generalExecutionRecordQueue];
    [v18 enqueueRecord:v17];

    sub_25188(self, 0);
  }
}

- (void)enqueueManagedValueCall:(id)a3 arguments:(id)a4 file:(id)a5 line:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10)
  {
    id v13 = JSALog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 134349826;
      id v17 = v10;
      __int16 v18 = 2048;
      id v19 = [v11 count];
      __int16 v20 = 2114;
      id v21 = v12;
      __int16 v22 = 2048;
      int64_t v23 = a6;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "JSABridge enqueue managed value call '%{public}p' with %lu args from %{public}@:%li", (uint8_t *)&v16, 0x2Au);
    }

    id v14 = [[JSAPendingExecutionRecord alloc] initWithManagedValue:v10 method:0 arguments:v11 type:2];
    id v15 = [(JSABridge *)self generalExecutionRecordQueue];
    [v15 enqueueRecord:v14];

    sub_25188(self, 0);
  }
}

- (void)enqueueManagedValueInvocation:(id)a3 method:(id)a4 arguments:(id)a5 file:(id)a6 line:(int64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (v12)
  {
    int v16 = JSALog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 134350082;
      id v20 = v12;
      __int16 v21 = 2114;
      id v22 = v13;
      __int16 v23 = 2048;
      id v24 = [v14 count];
      __int16 v25 = 2114;
      id v26 = v15;
      __int16 v27 = 2048;
      int64_t v28 = a7;
      _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "JSABridge enqueue managed value invocation '%{public}p' for '%{public}@' with %lu args from %{public}@:%li", (uint8_t *)&v19, 0x34u);
    }

    id v17 = [[JSAPendingExecutionRecord alloc] initWithManagedValue:v12 method:v13 arguments:v14 type:3];
    __int16 v18 = [(JSABridge *)self generalExecutionRecordQueue];
    [v18 enqueueRecord:v17];

    sub_25188(self, 0);
  }
}

- (JSAPendingExecutionRecordQueue)generalExecutionRecordQueue
{
  return self->_generalExecutionRecordQueue;
}

- (JSAEnvironment)environment
{
  if (qword_CE3F0 != -1) {
    dispatch_once(&qword_CE3F0, &stru_B3300);
  }
  v2 = (void *)qword_CE3F8;

  return (JSAEnvironment *)v2;
}

- (JSAWindowManager)windowManager
{
  return (JSAWindowManager *)objc_getProperty(self, a2, 16, 1);
}

- (void)setWindowManager:(id)a3
{
}

- (JSAPackage)currentPackage
{
  return (JSAPackage *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCurrentPackage:(id)a3
{
}

- (AMSPromise)packagePromise
{
  return (AMSPromise *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPackagePromise:(id)a3
{
}

- (AMSPromise)templateRegistrationPromise
{
  return (AMSPromise *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTemplateRegistrationPromise:(id)a3
{
}

- (NSString)pendingPackageVersion
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPendingPackageVersion:(id)a3
{
}

- (JSABridgeTemplateBundleRegistering)templateBundleRegistrar
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_templateBundleRegistrar);

  return (JSABridgeTemplateBundleRegistering *)WeakRetained;
}

- (void)setTemplateBundleRegistrar:(id)a3
{
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (void)setAccessQueue:(id)a3
{
}

- (OS_dispatch_queue)bootstrapQueue
{
  return self->_bootstrapQueue;
}

- (void)setBootstrapQueue:(id)a3
{
}

- (JSAPendingExecutionRecordQueue)launchExecutionRecordQueue
{
  return self->_launchExecutionRecordQueue;
}

- (void)setLaunchExecutionRecordQueue:(id)a3
{
}

- (void)setGeneralExecutionRecordQueue:(id)a3
{
}

- (JSABridgeDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (JSABridgeDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (id)_beforeJSAppLaunchBlock
{
  return self->__beforeJSAppLaunchBlock;
}

- (void)set_beforeJSAppLaunchBlock:(id)a3
{
}

- (NSDate)lastScriptCacheDate
{
  return (NSDate *)objc_getProperty(self, a2, 112, 1);
}

- (void)setLastScriptCacheDate:(id)a3
{
}

- (JSAPackageProvisioner)launchPackageProvisioner
{
  return (JSAPackageProvisioner *)objc_getProperty(self, a2, 120, 1);
}

- (void)setLaunchPackageProvisioner:(id)a3
{
}

- (BOOL)hasStarted
{
  return self->_hasStarted;
}

- (void)setHasStarted:(BOOL)a3
{
  self->_hasStarted = a3;
}

- (BOOL)isLoadingScript
{
  return self->_isLoadingScript;
}

- (void)setIsLoadingScript:(BOOL)a3
{
  self->_isLoadingScript = a3;
}

- (BOOL)isScriptLoaded
{
  return self->_isScriptLoaded;
}

- (void)setIsScriptLoaded:(BOOL)a3
{
  self->_isScriptLoaded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchPackageProvisioner, 0);
  objc_storeStrong((id *)&self->_lastScriptCacheDate, 0);
  objc_storeStrong(&self->__beforeJSAppLaunchBlock, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_generalExecutionRecordQueue, 0);
  objc_storeStrong((id *)&self->_launchExecutionRecordQueue, 0);
  objc_storeStrong((id *)&self->_bootstrapQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_destroyWeak((id *)&self->_templateBundleRegistrar);
  objc_storeStrong((id *)&self->_pendingPackageVersion, 0);
  objc_storeStrong((id *)&self->_templateRegistrationPromise, 0);
  objc_storeStrong((id *)&self->_packagePromise, 0);
  objc_storeStrong((id *)&self->_currentPackage, 0);

  objc_storeStrong((id *)&self->_windowManager, 0);
}

@end