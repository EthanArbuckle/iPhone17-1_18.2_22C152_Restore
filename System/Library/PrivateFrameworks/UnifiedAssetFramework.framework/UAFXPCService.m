@interface UAFXPCService
+ (BOOL)_isOnDemandAssetSubscriptionAllowed;
+ (void)daemonLaunchTasks;
- (BOOL)_assistantEnabledChanged;
- (BOOL)_assistantLanguageChanged;
- (BOOL)_dictationEnabledChanged;
- (BOOL)_gmsEnabledChanged;
- (BOOL)_systemLanguageChanged;
- (BOOL)assistantEnabled;
- (BOOL)dictationEnabled;
- (BOOL)gmsEnabled;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSString)assistantLanguage;
- (NSString)systemLanguage;
- (UAFXPCService)init;
- (UAFXPCService)initWithMachServiceName:(id)a3;
- (UAFXPCService)initWithXPCListener:(id)a3;
- (void)_assistantGMSAvailabilityUpdate;
- (void)_assistantLanguageUpdate;
- (void)_assistantPreferencesUpdate;
- (void)_invalidate;
- (void)_startObservers;
- (void)_stopObservers;
- (void)_systemLanguageUpdate;
- (void)_updateAssetUtilitiesLanguage;
- (void)_updateAssistantSubscription;
- (void)_updateGMSSiriLanguageSubscription;
- (void)_updateMorphunSystemLanguageSubscription;
- (void)_updateNLSystemLanguageSubscription;
- (void)checkAssetStatus:(id)a3;
- (void)configureCacheDeleteWithConfig:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)diagnosticInformation:(id)a3;
- (void)diskSpaceNeededInBytesForLanguage:(id)a3 forClient:(unint64_t)a4 completion:(id)a5;
- (void)downloadDictationAssetsForLanguage:(id)a3;
- (void)downloadSiriAssets;
- (void)downloadSiriAssetsOverCellular;
- (void)invalidate;
- (void)lockLatestAtomicInstance:(id)a3 completion:(id)a4;
- (void)operationWithConfig:(id)a3 completion:(id)a4;
- (void)postAssetNotificationIfNeeded;
- (void)postDictationAssetNotificationForLanguage:(id)a3;
- (void)runUpdates;
- (void)start;
- (void)startAsync;
- (void)stop;
- (void)stopAsync;
- (void)subscribeWithConfig:(id)a3 completion:(id)a4;
- (void)subscriptionsForSubscriber:(id)a3 completion:(id)a4;
- (void)unsubscribeWithConfig:(id)a3 completion:(id)a4;
@end

@implementation UAFXPCService

+ (void)daemonLaunchTasks
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v2 = UAFGetLogCategory((void **)&UAFLogContextXPCService);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    v7 = "+[UAFXPCService daemonLaunchTasks]";
    _os_log_impl(&dword_23797A000, v2, OS_LOG_TYPE_DEFAULT, "%s Running UAF daemon launch tasks", (uint8_t *)&v6, 0xCu);
  }

  v3 = +[UAFSubscriptionStoreManager writeManager];
  [v3 performDbUpgradeToVersion:1];

  if (!+[UAFCommonUtilities isGameModeEnabled])
  {
    v4 = +[UAFSubscriptionStoreManager writeManager];
    v5 = +[UAFConfigurationManager defaultManager];
    +[UAFAssetSetManager configureAssetDelivery:v4 configurationManager:v5 lockIfUnchanged:0];
  }
}

- (UAFXPCService)init
{
  return [(UAFXPCService *)self initWithMachServiceName:@"com.apple.siri.uaf.service"];
}

- (UAFXPCService)initWithMachServiceName:(id)a3
{
  v4 = (objc_class *)MEMORY[0x263F08D88];
  id v5 = a3;
  int v6 = (void *)[[v4 alloc] initWithMachServiceName:v5];

  v7 = [(UAFXPCService *)self initWithXPCListener:v6];
  return v7;
}

- (UAFXPCService)initWithXPCListener:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)UAFXPCService;
  int v6 = [(UAFXPCService *)&v15 init];
  if (v6)
  {
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v8 = dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_USER_INTERACTIVE, 0);

    v9 = [v5 serviceName];
    v10 = [v9 stringByAppendingString:@".queue"];

    id v11 = v10;
    dispatch_queue_t v12 = dispatch_queue_create((const char *)[v11 cStringUsingEncoding:1], v8);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v12;

    objc_storeStrong((id *)&v6->_xpcListener, a3);
    [(NSXPCListener *)v6->_xpcListener _setQueue:v6->_queue];
    [(NSXPCListener *)v6->_xpcListener setDelegate:v6];
    +[UAFAutoAssetManager observeAllAssetSets];
  }
  return v6;
}

- (void)dealloc
{
  [(UAFXPCService *)self _invalidate];
  v3.receiver = self;
  v3.super_class = (Class)UAFXPCService;
  [(UAFXPCService *)&v3 dealloc];
}

- (void)invalidate
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __27__UAFXPCService_invalidate__block_invoke;
  block[3] = &unk_264CEAB50;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __27__UAFXPCService_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)_invalidate
{
  [(UAFXPCService *)self stop];
  xpcListener = self->_xpcListener;
  if (xpcListener)
  {
    [(NSXPCListener *)xpcListener invalidate];
    v4 = self->_xpcListener;
    self->_xpcListener = 0;
  }
}

- (void)startAsync
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __27__UAFXPCService_startAsync__block_invoke;
  block[3] = &unk_264CEAB50;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __27__UAFXPCService_startAsync__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) start];
}

- (void)start
{
  [(UAFXPCService *)self runUpdates];
  xpcListener = self->_xpcListener;

  [(NSXPCListener *)xpcListener resume];
}

- (void)_startObservers
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  objc_super v3 = UAFGetLogCategory((void **)&UAFLogContextXPCService);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    id v11 = "-[UAFXPCService _startObservers]";
    _os_log_impl(&dword_23797A000, v3, OS_LOG_TYPE_DEFAULT, "%s Starting observers", (uint8_t *)&v10, 0xCu);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  getAFLanguageCodeDidChangeDarwinNotification_0();
  id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_AFLanguageDidChangeCallback_0, v5, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

  int v6 = CFNotificationCenterGetDarwinNotifyCenter();
  getkAFPreferencesDidChangeDarwinNotification_0();
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  CFNotificationCenterAddObserver(v6, self, (CFNotificationCallback)_AFPreferencesDidChangeCallback_0, v7, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

  uint64_t v8 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v8, self, (CFNotificationCallback)_LanguageChangedCallback, @"com.apple.language.changed", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v9 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v9, self, (CFNotificationCallback)_GMSAvailabilityDidChangeCallback, @"com.apple.gms.availability.notification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)stopAsync
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __26__UAFXPCService_stopAsync__block_invoke;
  block[3] = &unk_264CEAB50;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __26__UAFXPCService_stopAsync__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) stop];
}

- (void)stop
{
  [(UAFXPCService *)self _stopObservers];
  xpcListener = self->_xpcListener;

  [(NSXPCListener *)xpcListener suspend];
}

- (void)_stopObservers
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  objc_super v3 = UAFGetLogCategory((void **)&UAFLogContextXPCService);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315138;
    v13 = "-[UAFXPCService _stopObservers]";
    _os_log_impl(&dword_23797A000, v3, OS_LOG_TYPE_DEFAULT, "%s Stopping observers", (uint8_t *)&v12, 0xCu);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  getAFLanguageCodeDidChangeDarwinNotification_0();
  id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, v5, 0);

  int v6 = CFNotificationCenterGetDarwinNotifyCenter();
  getkAFPreferencesDidChangeDarwinNotification_0();
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  CFNotificationCenterRemoveObserver(v6, self, v7, 0);

  uint64_t v8 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v8, self, @"com.apple.language.changed", 0);
  v9 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v9, self, @"com.apple.gms.availability.notification", 0);
  id platformAssetSetObserver = self->_platformAssetSetObserver;
  if (platformAssetSetObserver)
  {
    id v11 = +[UAFAssetSetManager sharedManager];
    [v11 removeObserver:self->_platformAssetSetObserver];

    id platformAssetSetObserver = self->_platformAssetSetObserver;
  }
  self->_id platformAssetSetObserver = 0;
}

- (void)runUpdates
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __27__UAFXPCService_runUpdates__block_invoke;
  v9[3] = &unk_264CEACE0;
  objc_copyWeak(&v10, &location);
  v9[4] = self;
  objc_super v3 = (void (**)(void))MEMORY[0x237E26D50](v9);
  if ([MEMORY[0x263F61E30] isClassCLocked])
  {
    v4 = UAFGetLogCategory((void **)&UAFLogContextXPCService);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "-[UAFXPCService runUpdates]";
      _os_log_impl(&dword_23797A000, v4, OS_LOG_TYPE_DEFAULT, "%s Device is locked, scheduling subscription update for unlock", buf, 0xCu);
    }

    id v5 = (void *)MEMORY[0x263F61E30];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __27__UAFXPCService_runUpdates__block_invoke_326;
    v7[3] = &unk_264CEB800;
    uint64_t v8 = v3;
    [v5 runBlockWhenDeviceIsClassCUnlocked:v7];
  }
  else
  {
    int v6 = UAFGetLogCategory((void **)&UAFLogContextXPCService);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "-[UAFXPCService runUpdates]";
      _os_log_impl(&dword_23797A000, v6, OS_LOG_TYPE_DEFAULT, "%s Device is unlocked, running subscription update", buf, 0xCu);
    }

    v3[2](v3);
  }

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __27__UAFXPCService_runUpdates__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    *((unsigned char *)WeakRetained + 40) = +[UAFCommonUtilities isDictationEnabled];
    *((unsigned char *)WeakRetained + 41) = +[UAFCommonUtilities isAssistantEnabled];
    uint64_t v3 = +[UAFCommonUtilities currentAssistantLanguage];
    v4 = (void *)*((void *)WeakRetained + 6);
    *((void *)WeakRetained + 6) = v3;

    *((unsigned char *)WeakRetained + 42) = +[UAFCommonUtilities gmsWantsAssets];
    uint64_t v5 = +[UAFCommonUtilities systemLanguage];
    int v6 = (void *)*((void *)WeakRetained + 7);
    *((void *)WeakRetained + 7) = v5;

    [WeakRetained _updateAssistantSubscription];
    [WeakRetained _updateMorphunSystemLanguageSubscription];
    [WeakRetained _updateGMSSiriLanguageSubscription];
    [*(id *)(a1 + 32) _updateNLSystemLanguageSubscription];
    if (!*(void *)(*(void *)(a1 + 32) + 24))
    {
      uint64_t v7 = +[UAFManagedSubscriptions managePlatformSubscription];
      uint64_t v8 = *(void *)(a1 + 32);
      v9 = *(void **)(v8 + 24);
      *(void *)(v8 + 24) = v7;
    }
    +[UAFManagedSubscriptions manageSummarizationKitSubscription];
    +[UAFXPCService daemonLaunchTasks];
    [WeakRetained _startObservers];
    id v10 = objc_alloc_init(UAFAssetUtilitiesService);
    id v11 = (void *)*((void *)WeakRetained + 4);
    *((void *)WeakRetained + 4) = v10;

    [*((id *)WeakRetained + 4) switchLanguage:*((void *)WeakRetained + 6)];
    [*((id *)WeakRetained + 4) startObserver];
    int v12 = UAFGetLogCategory((void **)&UAFLogContextXPCService);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315138;
      uint64_t v14 = "-[UAFXPCService runUpdates]_block_invoke";
      _os_log_impl(&dword_23797A000, v12, OS_LOG_TYPE_DEFAULT, "%s Posting notification of subscription availability", (uint8_t *)&v13, 0xCu);
    }

    notify_post((const char *)kUAFStartedNotification);
  }
}

uint64_t __27__UAFXPCService_runUpdates__block_invoke_326(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = UAFGetLogCategory((void **)&UAFLogContextXPCService);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    uint64_t v5 = "-[UAFXPCService runUpdates]_block_invoke";
    _os_log_impl(&dword_23797A000, v2, OS_LOG_TYPE_DEFAULT, "%s Device has been unlocked, running subscription update", (uint8_t *)&v4, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)subscribeWithConfig:(id)a3 completion:(id)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = (void (**)(id, void *))a4;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v7 = [v5 objectForKeyedSubscript:@"Subscriptions"];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v40 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v27;
    while (2)
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v20 = (void *)MEMORY[0x263F087E8];
          uint64_t v38 = *MEMORY[0x263F08320];
          v21 = [NSString stringWithFormat:@"Configuration key %@ is not an NSArray of %@", @"Subscriptions", objc_opt_class()];
          v39 = v21;
          v22 = [NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
          uint64_t v15 = [v20 errorWithDomain:@"com.apple.UnifiedAssetFramework" code:-1 userInfo:v22];

          v23 = UAFGetLogCategory((void **)&UAFLogContextXPCService);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            v24 = objc_opt_class();
            *(_DWORD *)buf = 136315650;
            v33 = "-[UAFXPCService subscribeWithConfig:completion:]";
            __int16 v34 = 2112;
            v35 = @"Subscriptions";
            __int16 v36 = 2112;
            v37 = v24;
            id v25 = v24;
            _os_log_error_impl(&dword_23797A000, v23, OS_LOG_TYPE_ERROR, "%s Configuration key %@ is not an NSArray of %@", buf, 0x20u);
          }
          v6[2](v6, v15);
          goto LABEL_17;
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v26 objects:v40 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  uint64_t v7 = [v5 objectForKeyedSubscript:@"Subscriber"];
  int v12 = [v5 objectForKeyedSubscript:@"Subscriptions"];
  int v13 = [v5 objectForKeyedSubscript:@"Subscriber"];
  BOOL v14 = +[UAFAssetSetManager subscribe:v13 subscriptions:v12 storeManager:0 configurationManager:0 userInitiated:1];

  uint64_t v15 = 0;
  if (!v14)
  {
    v16 = (void *)MEMORY[0x263F087E8];
    uint64_t v30 = *MEMORY[0x263F08320];
    v17 = [NSString stringWithFormat:@"Failed to subscribe to subscriptions %@ for subscriber %@", v12, v7];
    v31 = v17;
    v18 = [NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    uint64_t v15 = [v16 errorWithDomain:@"com.apple.UnifiedAssetFramework" code:-1 userInfo:v18];

    v19 = UAFGetLogCategory((void **)&UAFLogContextXPCService);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v33 = "-[UAFXPCService subscribeWithConfig:completion:]";
      __int16 v34 = 2112;
      v35 = v12;
      __int16 v36 = 2112;
      v37 = v7;
      _os_log_error_impl(&dword_23797A000, v19, OS_LOG_TYPE_ERROR, "%s Failed to subscribe to subscriptions %@ for subscriber %@", buf, 0x20u);
    }
  }
  v6[2](v6, v15);

LABEL_17:
}

- (void)unsubscribeWithConfig:(id)a3 completion:(id)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = (void (**)(id, void *))a4;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v7 = [v5 objectForKeyedSubscript:@"Subscriptions"];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v40 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v27;
    while (2)
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v20 = (void *)MEMORY[0x263F087E8];
          uint64_t v38 = *MEMORY[0x263F08320];
          v21 = [NSString stringWithFormat:@"Configuration key %@ is not an NSArray of %@", @"Subscriptions", objc_opt_class()];
          v39 = v21;
          v22 = [NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
          uint64_t v15 = [v20 errorWithDomain:@"com.apple.UnifiedAssetFramework" code:-1 userInfo:v22];

          v23 = UAFGetLogCategory((void **)&UAFLogContextXPCService);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            v24 = objc_opt_class();
            *(_DWORD *)buf = 136315650;
            v33 = "-[UAFXPCService unsubscribeWithConfig:completion:]";
            __int16 v34 = 2112;
            v35 = @"Subscriptions";
            __int16 v36 = 2112;
            v37 = v24;
            id v25 = v24;
            _os_log_error_impl(&dword_23797A000, v23, OS_LOG_TYPE_ERROR, "%s Configuration key %@ is not an NSArray of %@", buf, 0x20u);
          }
          v6[2](v6, v15);
          goto LABEL_17;
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v26 objects:v40 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  uint64_t v7 = [v5 objectForKeyedSubscript:@"Subscriber"];
  int v12 = [v5 objectForKeyedSubscript:@"Subscriptions"];
  int v13 = [v5 objectForKeyedSubscript:@"Subscriber"];
  BOOL v14 = +[UAFAssetSetManager unsubscribe:v13 subscriptions:v12 storeManager:0 configurationManager:0 userInitiated:1];

  uint64_t v15 = 0;
  if (!v14)
  {
    v16 = (void *)MEMORY[0x263F087E8];
    uint64_t v30 = *MEMORY[0x263F08320];
    v17 = [NSString stringWithFormat:@"Failed to unsubscribe from subscriptions %@ for subscriber %@", v12, v7];
    v31 = v17;
    v18 = [NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    uint64_t v15 = [v16 errorWithDomain:@"com.apple.UnifiedAssetFramework" code:-1 userInfo:v18];

    v19 = UAFGetLogCategory((void **)&UAFLogContextXPCService);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v33 = "-[UAFXPCService unsubscribeWithConfig:completion:]";
      __int16 v34 = 2112;
      v35 = v12;
      __int16 v36 = 2112;
      v37 = v7;
      _os_log_error_impl(&dword_23797A000, v19, OS_LOG_TYPE_ERROR, "%s Failed to unsubscribe from subscriptions %@ for subscriber %@", buf, 0x20u);
    }
  }
  v6[2](v6, v15);

LABEL_17:
}

- (void)configureCacheDeleteWithConfig:(id)a3 completion:(id)a4
{
  v50[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = (void (**)(id, void *))a4;
  uint64_t v7 = [v5 objectForKeyedSubscript:@"CacheDeleteDisabled"];
  if (!v7
    || (uint64_t v8 = (void *)v7,
        [v5 objectForKeyedSubscript:@"CacheDeleteDisabled"],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v9,
        v8,
        (isKindOfClass & 1) == 0))
  {
    v22 = (void *)MEMORY[0x263F087E8];
    uint64_t v49 = *MEMORY[0x263F08320];
    v23 = [NSString stringWithFormat:@"Configuration key %@ is not an %@", @"CacheDeleteDisabled", objc_opt_class()];
    v50[0] = v23;
    v24 = [NSDictionary dictionaryWithObjects:v50 forKeys:&v49 count:1];
    id v25 = [v22 errorWithDomain:@"com.apple.UnifiedAssetFramework" code:-1 userInfo:v24];

    long long v26 = UAFGetLogCategory((void **)&UAFLogContextXPCService);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v44 = "-[UAFXPCService configureCacheDeleteWithConfig:completion:]";
      __int16 v45 = 2112;
      v46 = @"CacheDeleteDisabled";
      __int16 v47 = 2112;
      id v48 = (id)objc_opt_class();
      id v27 = v48;
LABEL_12:
      _os_log_error_impl(&dword_23797A000, v26, OS_LOG_TYPE_ERROR, "%s Configuration key %@ is not an %@", buf, 0x20u);
    }
LABEL_13:

    v6[2](v6, v25);
    goto LABEL_14;
  }
  uint64_t v11 = [v5 objectForKeyedSubscript:@"AutoAssetType"];
  if (!v11
    || (int v12 = (void *)v11,
        [v5 objectForKeyedSubscript:@"AutoAssetType"],
        int v13 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char v14 = objc_opt_isKindOfClass(),
        v13,
        v12,
        (v14 & 1) == 0))
  {
    long long v28 = (void *)MEMORY[0x263F087E8];
    uint64_t v41 = *MEMORY[0x263F08320];
    long long v29 = [NSString stringWithFormat:@"Configuration key %@ is not an %@", @"AutoAssetType", objc_opt_class()];
    v42 = v29;
    uint64_t v30 = [NSDictionary dictionaryWithObjects:&v42 forKeys:&v41 count:1];
    id v25 = [v28 errorWithDomain:@"com.apple.UnifiedAssetFramework" code:-1 userInfo:v30];

    long long v26 = UAFGetLogCategory((void **)&UAFLogContextXPCService);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v31 = objc_opt_class();
      *(_DWORD *)buf = 136315650;
      v44 = "-[UAFXPCService configureCacheDeleteWithConfig:completion:]";
      __int16 v45 = 2112;
      v46 = @"AutoAssetType";
      __int16 v47 = 2112;
      id v48 = v31;
      id v27 = v31;
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  uint64_t v15 = [v5 objectForKeyedSubscript:@"AssetSpecifier"];
  if (v15
    && (v16 = (void *)v15,
        [v5 objectForKeyedSubscript:@"AssetSpecifier"],
        v17 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char v18 = objc_opt_isKindOfClass(),
        v17,
        v16,
        (v18 & 1) != 0))
  {
    v19 = [v5 objectForKeyedSubscript:@"CacheDeleteDisabled"];
    v20 = [v5 objectForKeyedSubscript:@"AutoAssetType"];
    v21 = [v5 objectForKeyedSubscript:@"AssetSpecifier"];
    +[UAFAssetSetManager disableCacheDelete:forAutoAssetType:autoAssetSpecifier:](UAFAssetSetManager, "disableCacheDelete:forAutoAssetType:autoAssetSpecifier:", [v19 BOOLValue], v20, v21);
    v6[2](v6, 0);
  }
  else
  {
    v32 = (void *)MEMORY[0x263F087E8];
    uint64_t v39 = *MEMORY[0x263F08320];
    v33 = [NSString stringWithFormat:@"Configuration key %@ is not an %@", @"AssetSpecifier", objc_opt_class(), v39];
    v40 = v33;
    __int16 v34 = [NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
    v35 = [v32 errorWithDomain:@"com.apple.UnifiedAssetFramework" code:-1 userInfo:v34];

    __int16 v36 = UAFGetLogCategory((void **)&UAFLogContextXPCService);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      v37 = objc_opt_class();
      *(_DWORD *)buf = 136315650;
      v44 = "-[UAFXPCService configureCacheDeleteWithConfig:completion:]";
      __int16 v45 = 2112;
      v46 = @"AssetSpecifier";
      __int16 v47 = 2112;
      id v48 = v37;
      id v38 = v37;
      _os_log_error_impl(&dword_23797A000, v36, OS_LOG_TYPE_ERROR, "%s Configuration key %@ is not an %@", buf, 0x20u);
    }
    v6[2](v6, v35);
  }
LABEL_14:
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  if (a4) {
    BOOL v4 = self->_xpcListener == a3;
  }
  else {
    BOOL v4 = 0;
  }
  BOOL v5 = v4;
  if (v4)
  {
    id v7 = a4;
    [v7 setRemoteObjectInterface:0];
    uint64_t v8 = +[UAFXPCProxyServiceInterface defaultInterface];
    [v7 setExportedInterface:v8];

    [v7 setExportedObject:self];
    [v7 resume];
  }
  return v5;
}

- (void)operationWithConfig:(id)a3 completion:(id)a4
{
  v65[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  if (!v6)
  {
    uint64_t v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v64 = *MEMORY[0x263F08320];
    int v12 = [NSString stringWithFormat:@"Missing configuration dictionary"];
    v65[0] = v12;
    int v13 = [NSDictionary dictionaryWithObjects:v65 forKeys:&v64 count:1];
    id v9 = [v11 errorWithDomain:@"com.apple.UnifiedAssetFramework" code:-1 userInfo:v13];

    char v14 = UAFGetLogCategory((void **)&UAFLogContextXPCService);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v55 = "-[UAFXPCService operationWithConfig:completion:]";
      _os_log_error_impl(&dword_23797A000, v14, OS_LOG_TYPE_ERROR, "%s Missing configuration dictionary", buf, 0xCu);
    }

    goto LABEL_8;
  }
  id v53 = 0;
  BOOL v8 = +[UAFConfiguration isValidValue:v6 key:@"Operation" kind:objc_opt_class() required:1 error:&v53];
  id v9 = v53;
  if (!v8)
  {
LABEL_8:
    v7[2](v7, v9);
    goto LABEL_9;
  }
  uint64_t v10 = [v6 objectForKeyedSubscript:@"Operation"];
  if ([v10 isEqualToString:@"Subscribe"])
  {
  }
  else
  {
    uint64_t v15 = [v6 objectForKeyedSubscript:@"Operation"];
    int v16 = [v15 isEqualToString:@"Unsubscribe"];

    if (!v16) {
      goto LABEL_13;
    }
  }
  id v52 = v9;
  BOOL v17 = +[UAFConfiguration isValidValue:v6 key:@"Subscriber" kind:objc_opt_class() required:1 error:&v52];
  id v18 = v52;

  if (!v17)
  {
    v7[2](v7, v18);
    id v9 = v18;
    goto LABEL_9;
  }
  id v51 = v18;
  BOOL v19 = +[UAFConfiguration isValidValue:v6 key:@"Subscriptions" kind:objc_opt_class() required:1 error:&v51];
  id v9 = v51;

  if (!v19) {
    goto LABEL_8;
  }
LABEL_13:
  v20 = [v6 objectForKeyedSubscript:@"Operation"];
  int v21 = [v20 isEqualToString:@"Subscribe"];

  if (v21)
  {
    [(UAFXPCService *)self subscribeWithConfig:v6 completion:v7];
    goto LABEL_9;
  }
  v22 = [v6 objectForKeyedSubscript:@"Operation"];
  int v23 = [v22 isEqualToString:@"Unsubscribe"];

  if (v23)
  {
    [(UAFXPCService *)self unsubscribeWithConfig:v6 completion:v7];
    goto LABEL_9;
  }
  v24 = [v6 objectForKeyedSubscript:@"Operation"];
  int v25 = [v24 isEqualToString:@"ConfigureCacheDelete"];

  if (v25)
  {
    [(UAFXPCService *)self configureCacheDeleteWithConfig:v6 completion:v7];
    goto LABEL_9;
  }
  long long v26 = [v6 objectForKeyedSubscript:@"Operation"];
  int v27 = [v26 isEqualToString:@"ConfigureAssetDelivery"];

  if (!v27)
  {
    v32 = (void *)MEMORY[0x263F087E8];
    if (v9)
    {
      v62[0] = *MEMORY[0x263F08320];
      v33 = NSString;
      __int16 v34 = [v6 objectForKeyedSubscript:@"Operation"];
      v35 = [v33 stringWithFormat:@"Configuration key %@ is set to invalid value \"%@\", @"Operation"", v34];
      v62[1] = *MEMORY[0x263F08608];
      v63[0] = v35;
      v63[1] = v9;
      __int16 v36 = [NSDictionary dictionaryWithObjects:v63 forKeys:v62 count:2];
      uint64_t v37 = [v32 errorWithDomain:@"com.apple.UnifiedAssetFramework" code:-1 userInfo:v36];

      id v9 = (id)v37;
    }
    else
    {
      uint64_t v60 = *MEMORY[0x263F08320];
      id v38 = NSString;
      __int16 v34 = [v6 objectForKeyedSubscript:@"Operation"];
      v35 = [v38 stringWithFormat:@"Configuration key %@ is set to invalid value \"%@\", @"Operation"", v34];
      v61 = v35;
      __int16 v36 = [NSDictionary dictionaryWithObjects:&v61 forKeys:&v60 count:1];
      id v9 = [v32 errorWithDomain:@"com.apple.UnifiedAssetFramework" code:-1 userInfo:v36];
    }

    uint64_t v39 = UAFGetLogCategory((void **)&UAFLogContextXPCService);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      __int16 v47 = [v6 objectForKeyedSubscript:@"Operation"];
      *(_DWORD *)buf = 136315650;
      v55 = "-[UAFXPCService operationWithConfig:completion:]";
      __int16 v56 = 2112;
      v57 = @"Operation";
      __int16 v58 = 2112;
      v59 = v47;
      _os_log_error_impl(&dword_23797A000, v39, OS_LOG_TYPE_ERROR, "%s Configuration key %@ is set to invalid value \"%@\"", buf, 0x20u);
    }
    goto LABEL_8;
  }
  long long v28 = [v6 objectForKeyedSubscript:@"LockIfUnchanged"];
  if (v28)
  {
    long long v29 = [v6 objectForKeyedSubscript:@"LockIfUnchanged"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v31 = [v6 objectForKeyedSubscript:@"LockIfUnchanged"];
      LOBYTE(v28) = [v31 BOOLValue];
    }
    else
    {
      LOBYTE(v28) = 0;
    }
  }
  uint64_t v40 = [v6 objectForKeyedSubscript:@"UserInitiated"];
  if (v40
    && (uint64_t v41 = (void *)v40,
        [v6 objectForKeyedSubscript:@"UserInitiated"],
        v42 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char v43 = objc_opt_isKindOfClass(),
        v42,
        v41,
        (v43 & 1) != 0))
  {
    v44 = [v6 objectForKeyedSubscript:@"UserInitiated"];
    char v45 = [v44 BOOLValue];
  }
  else
  {
    char v45 = 1;
  }
  v46 = +[UAFAssetSetManager getSerialQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__UAFXPCService_operationWithConfig_completion___block_invoke;
  block[3] = &__block_descriptor_34_e5_v8__0l;
  char v49 = (char)v28;
  char v50 = v45;
  dispatch_sync(v46, block);

  v7[2](v7, 0);
LABEL_9:
}

uint64_t __48__UAFXPCService_operationWithConfig_completion___block_invoke(uint64_t a1)
{
  return +[UAFAssetSetManager configureAssetDelivery:0 configurationManager:0 lockIfUnchanged:*(unsigned __int8 *)(a1 + 32) subscriptions:0 assetSetUsages:0 userInitiated:*(unsigned __int8 *)(a1 + 33)];
}

- (void)diagnosticInformation:(id)a3
{
  id v6 = 0;
  uint64_t v3 = (void (**)(id, void *, id))a3;
  BOOL v4 = +[UAFAssetSetManager generateInformationWithError:&v6];
  id v5 = v6;
  v3[2](v3, v4, v5);
}

- (void)lockLatestAtomicInstance:(id)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = (void (**)(id, id))a4;
  id v7 = objc_alloc(MEMORY[0x263F55980]);
  BOOL v8 = +[UAFAutoAssetManager getConcurrentQueue];
  id v14 = 0;
  id v9 = (void *)[v7 initUsingClientDomain:@"com.apple.UnifiedAssetFramework" forClientName:@"manager" forAssetSetIdentifier:v5 comprisedOfEntries:0 completingFromQueue:v8 error:&v14];
  id v10 = v14;

  if (v10)
  {
    uint64_t v11 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      int v16 = "-[UAFXPCService lockLatestAtomicInstance:completion:]";
      __int16 v17 = 2114;
      id v18 = v5;
      __int16 v19 = 2114;
      id v20 = v10;
      _os_log_error_impl(&dword_23797A000, v11, OS_LOG_TYPE_ERROR, "%s Could not initialize auto asset set %{public}@ for updating: %{public}@", buf, 0x20u);
    }

    v6[2](v6, v10);
  }
  else if (v9)
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __53__UAFXPCService_lockLatestAtomicInstance_completion___block_invoke;
    v12[3] = &unk_264CEB038;
    int v13 = v6;
    +[UAFAutoAssetManager lockLatestAssetSet:v9 completion:v12];
  }
  else
  {
    v6[2](v6, 0);
  }
}

uint64_t __53__UAFXPCService_lockLatestAtomicInstance_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)subscriptionsForSubscriber:(id)a3 completion:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = (void (**)(id, void *, id))a4;
  id v7 = +[UAFSubscriptionStoreManager defaultManager];
  id v11 = 0;
  BOOL v8 = [v7 getSubscriptions:v5 error:&v11];
  id v9 = v11;

  id v10 = UAFGetLogCategory((void **)&UAFLogContextClient);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    int v13 = "-[UAFXPCService subscriptionsForSubscriber:completion:]";
    __int16 v14 = 2114;
    id v15 = v5;
    __int16 v16 = 2114;
    id v17 = v9;
    _os_log_impl(&dword_23797A000, v10, OS_LOG_TYPE_DEFAULT, "%s Subscriber: %{public}@, error: %{public}@", buf, 0x20u);
  }

  v6[2](v6, v8, v9);
}

- (void)downloadSiriAssets
{
}

- (void)downloadSiriAssetsOverCellular
{
}

- (void)postAssetNotificationIfNeeded
{
}

- (void)downloadDictationAssetsForLanguage:(id)a3
{
}

- (void)postDictationAssetNotificationForLanguage:(id)a3
{
}

- (void)checkAssetStatus:(id)a3
{
}

- (void)diskSpaceNeededInBytesForLanguage:(id)a3 forClient:(unint64_t)a4 completion:(id)a5
{
}

+ (BOOL)_isOnDemandAssetSubscriptionAllowed
{
  return 1;
}

- (BOOL)_dictationEnabledChanged
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  int dictationEnabled = self->_dictationEnabled;
  int v4 = +[UAFCommonUtilities isDictationEnabled];
  self->_int dictationEnabled = v4;
  id v5 = UAFGetLogCategory((void **)&UAFLogContextXPCService);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (dictationEnabled == v4)
  {
    if (v6)
    {
      id v9 = @"enabled";
      if (!self->_dictationEnabled) {
        id v9 = @"disabled";
      }
      int v11 = 136315394;
      int v12 = "-[UAFXPCService _dictationEnabledChanged]";
      __int16 v13 = 2114;
      __int16 v14 = v9;
      BOOL v8 = "%s Not updating Dictation enablement as it is unchanged from : %{public}@";
      goto LABEL_10;
    }
  }
  else if (v6)
  {
    id v7 = @"enabled";
    if (!self->_dictationEnabled) {
      id v7 = @"disabled";
    }
    int v11 = 136315394;
    int v12 = "-[UAFXPCService _dictationEnabledChanged]";
    __int16 v13 = 2114;
    __int16 v14 = v7;
    BOOL v8 = "%s Dictation enablement changed to : %{public}@";
LABEL_10:
    _os_log_impl(&dword_23797A000, v5, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v11, 0x16u);
  }

  return dictationEnabled != v4;
}

- (BOOL)_assistantEnabledChanged
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  int assistantEnabled = self->_assistantEnabled;
  int v4 = +[UAFCommonUtilities isAssistantEnabled];
  self->_int assistantEnabled = v4;
  id v5 = UAFGetLogCategory((void **)&UAFLogContextXPCService);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (assistantEnabled == v4)
  {
    if (v6)
    {
      id v9 = @"enabled";
      if (!self->_assistantEnabled) {
        id v9 = @"disabled";
      }
      int v11 = 136315394;
      int v12 = "-[UAFXPCService _assistantEnabledChanged]";
      __int16 v13 = 2114;
      __int16 v14 = v9;
      BOOL v8 = "%s Not updating Assistant enablement as it is unchanged from : %{public}@";
      goto LABEL_10;
    }
  }
  else if (v6)
  {
    id v7 = @"enabled";
    if (!self->_assistantEnabled) {
      id v7 = @"disabled";
    }
    int v11 = 136315394;
    int v12 = "-[UAFXPCService _assistantEnabledChanged]";
    __int16 v13 = 2114;
    __int16 v14 = v7;
    BOOL v8 = "%s Assistant enablement changed to : %{public}@";
LABEL_10:
    _os_log_impl(&dword_23797A000, v5, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v11, 0x16u);
  }

  return assistantEnabled != v4;
}

- (BOOL)_gmsEnabledChanged
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  int gmsEnabled = self->_gmsEnabled;
  int v4 = +[UAFCommonUtilities gmsWantsAssets];
  self->_int gmsEnabled = v4;
  id v5 = UAFGetLogCategory((void **)&UAFLogContextXPCService);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (gmsEnabled == v4)
  {
    if (v6)
    {
      id v9 = @"enabled";
      if (!self->_gmsEnabled) {
        id v9 = @"disabled";
      }
      int v11 = 136315394;
      int v12 = "-[UAFXPCService _gmsEnabledChanged]";
      __int16 v13 = 2114;
      __int16 v14 = v9;
      BOOL v8 = "%s Not updating GMS enablement as it is unchanged from : %{public}@";
      goto LABEL_10;
    }
  }
  else if (v6)
  {
    id v7 = @"enabled";
    if (!self->_gmsEnabled) {
      id v7 = @"disabled";
    }
    int v11 = 136315394;
    int v12 = "-[UAFXPCService _gmsEnabledChanged]";
    __int16 v13 = 2114;
    __int16 v14 = v7;
    BOOL v8 = "%s GMS enablement changed to : %{public}@";
LABEL_10:
    _os_log_impl(&dword_23797A000, v5, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v11, 0x16u);
  }

  return gmsEnabled != v4;
}

- (BOOL)_assistantLanguageChanged
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v3 = self->_assistantLanguage;
  int v4 = +[UAFCommonUtilities currentAssistantLanguage];
  assistantLanguage = self->_assistantLanguage;
  self->_assistantLanguage = v4;

  BOOL v6 = self->_assistantLanguage;
  if (v3)
  {
    if ([(NSString *)v3 isEqualToString:v6])
    {
LABEL_3:
      id v7 = UAFGetLogCategory((void **)&UAFLogContextXPCService);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v8 = self->_assistantLanguage;
        int v12 = 136315394;
        __int16 v13 = "-[UAFXPCService _assistantLanguageChanged]";
        __int16 v14 = 2114;
        uint64_t v15 = v8;
        _os_log_impl(&dword_23797A000, v7, OS_LOG_TYPE_DEFAULT, "%s Not updating Assistant language as value is unchanged from : %{public}@", (uint8_t *)&v12, 0x16u);
      }
      BOOL v9 = 0;
      goto LABEL_10;
    }
  }
  else if (!v6)
  {
    goto LABEL_3;
  }
  id v7 = UAFGetLogCategory((void **)&UAFLogContextXPCService);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = self->_assistantLanguage;
    int v12 = 136315394;
    __int16 v13 = "-[UAFXPCService _assistantLanguageChanged]";
    __int16 v14 = 2114;
    uint64_t v15 = v10;
    _os_log_impl(&dword_23797A000, v7, OS_LOG_TYPE_DEFAULT, "%s Assistant language changed to : %{public}@", (uint8_t *)&v12, 0x16u);
  }
  BOOL v9 = 1;
LABEL_10:

  return v9;
}

- (BOOL)_systemLanguageChanged
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v3 = self->_systemLanguage;
  int v4 = +[UAFCommonUtilities systemLanguage];
  systemLanguage = self->_systemLanguage;
  self->_systemLanguage = v4;

  BOOL v6 = self->_systemLanguage;
  if (v3)
  {
    if ([(NSString *)v3 isEqualToString:v6])
    {
LABEL_3:
      id v7 = UAFGetLogCategory((void **)&UAFLogContextXPCService);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v8 = self->_systemLanguage;
        int v12 = 136315394;
        __int16 v13 = "-[UAFXPCService _systemLanguageChanged]";
        __int16 v14 = 2114;
        uint64_t v15 = v8;
        _os_log_impl(&dword_23797A000, v7, OS_LOG_TYPE_DEFAULT, "%s Not updating system language as value is unchanged from : %{public}@", (uint8_t *)&v12, 0x16u);
      }
      BOOL v9 = 0;
      goto LABEL_10;
    }
  }
  else if (!v6)
  {
    goto LABEL_3;
  }
  id v7 = UAFGetLogCategory((void **)&UAFLogContextXPCService);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = self->_systemLanguage;
    int v12 = 136315394;
    __int16 v13 = "-[UAFXPCService _systemLanguageChanged]";
    __int16 v14 = 2114;
    uint64_t v15 = v10;
    _os_log_impl(&dword_23797A000, v7, OS_LOG_TYPE_DEFAULT, "%s System language changed to : %{public}@", (uint8_t *)&v12, 0x16u);
  }
  BOOL v9 = 1;
LABEL_10:

  return v9;
}

- (void)_updateAssistantSubscription
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v3 = self->_assistantLanguage;
  int v4 = v3;
  if (!self->_assistantEnabled)
  {

    int v4 = 0;
  }
  if (+[UAFCommonUtilities deviceSupportAssistantEngine](UAFCommonUtilities, "deviceSupportAssistantEngine")|| +[UAFCommonUtilities gmsWantsAssets])
  {
    id v5 = @"assistantengine";
    uint64_t v6 = 3;
  }
  else if (+[UAFCommonUtilities deviceSupportFullUOD])
  {
    uint64_t v6 = 0;
    id v5 = @"full";
  }
  else
  {
    if (!+[UAFCommonUtilities deviceSupportAndUseHybridASR])
    {
      id v5 = @"legacy";
      uint64_t v6 = 2;
      goto LABEL_10;
    }
    id v5 = @"hybrid";
    uint64_t v6 = 1;
  }
  if (!+[UAFXPCService _isOnDemandAssetSubscriptionAllowed])
  {
    id v7 = UAFGetLogCategory((void **)&UAFLogContextXPCService);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315138;
      id v10 = "-[UAFXPCService _updateAssistantSubscription]";
      _os_log_impl(&dword_23797A000, v7, OS_LOG_TYPE_DEFAULT, "%s Assistant Subscription not allowed", (uint8_t *)&v9, 0xCu);
    }

    int v4 = 0;
  }
LABEL_10:
  BOOL v8 = UAFGetLogCategory((void **)&UAFLogContextXPCService);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315650;
    id v10 = "-[UAFXPCService _updateAssistantSubscription]";
    __int16 v11 = 2114;
    int v12 = v4;
    __int16 v13 = 2114;
    __int16 v14 = v5;
    _os_log_impl(&dword_23797A000, v8, OS_LOG_TYPE_DEFAULT, "%s Siri configured for: language %{public}@, mode: %{public}@", (uint8_t *)&v9, 0x20u);
  }

  +[UAFManagedSubscriptions manageAssistantSubscription:v4 withMode:v6];
}

- (void)_updateAssetUtilitiesLanguage
{
  uint64_t v3 = self->_assistantLanguage;
  int v4 = v3;
  if (!self->_assistantEnabled)
  {

    int v4 = 0;
  }
  id v5 = v4;
  [(UAFAssetUtilitiesService *)self->_assetUtilitiesService switchLanguage:v4];
}

- (void)_updateMorphunSystemLanguageSubscription
{
  if (self->_assistantEnabled)
  {
    id v2 = [MEMORY[0x263EFF960] currentLocale];
    +[UAFManagedSubscriptions manageMorphunSystemLocaleSubscription:v2];
  }
  else
  {
    +[UAFManagedSubscriptions manageMorphunSystemLocaleSubscription:0];
  }
}

- (void)_updateGMSSiriLanguageSubscription
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v3 = UAFGetLogCategory((void **)&UAFLogContextXPCService);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    BOOL gmsEnabled = self->_gmsEnabled;
    assistantLanguage = self->_assistantLanguage;
    int v6 = 136315650;
    id v7 = "-[UAFXPCService _updateGMSSiriLanguageSubscription]";
    __int16 v8 = 1024;
    BOOL v9 = gmsEnabled;
    __int16 v10 = 2112;
    __int16 v11 = assistantLanguage;
    _os_log_impl(&dword_23797A000, v3, OS_LOG_TYPE_DEFAULT, "%s Siri IE is now: wants assets: %d, language: %@", (uint8_t *)&v6, 0x1Cu);
  }

  +[UAFManagedSubscriptions manageGMSSiriLanguageSubscription:self->_gmsEnabled language:self->_assistantLanguage];
}

- (void)_updateNLSystemLanguageSubscription
{
}

- (void)_assistantLanguageUpdate
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = UAFGetLogCategory((void **)&UAFLogContextXPCService);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "-[UAFXPCService _assistantLanguageUpdate]";
    _os_log_impl(&dword_23797A000, v3, OS_LOG_TYPE_DEFAULT, "%s Processing update to assistant language", (uint8_t *)&v4, 0xCu);
  }

  if ([(UAFXPCService *)self _assistantLanguageChanged])
  {
    [(UAFXPCService *)self _updateAssistantSubscription];
    [(UAFXPCService *)self _updateAssetUtilitiesLanguage];
    [(UAFXPCService *)self _updateGMSSiriLanguageSubscription];
  }
}

- (void)_assistantPreferencesUpdate
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v3 = UAFGetLogCategory((void **)&UAFLogContextXPCService);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    __int16 v8 = "-[UAFXPCService _assistantPreferencesUpdate]";
    _os_log_impl(&dword_23797A000, v3, OS_LOG_TYPE_DEFAULT, "%s Processing update to assistant preferences", (uint8_t *)&v7, 0xCu);
  }

  [(UAFXPCService *)self _dictationEnabledChanged];
  BOOL v4 = [(UAFXPCService *)self _assistantEnabledChanged];
  BOOL v5 = [(UAFXPCService *)self _assistantLanguageChanged];
  BOOL v6 = v5;
  if (v4 || v5)
  {
    if (v4) {
      [(UAFXPCService *)self _updateMorphunSystemLanguageSubscription];
    }
    if (v6) {
      [(UAFXPCService *)self _updateGMSSiriLanguageSubscription];
    }
    [(UAFXPCService *)self _updateAssistantSubscription];
    [(UAFXPCService *)self _updateAssetUtilitiesLanguage];
  }
}

- (void)_assistantGMSAvailabilityUpdate
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = UAFGetLogCategory((void **)&UAFLogContextXPCService);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    BOOL v5 = "-[UAFXPCService _assistantGMSAvailabilityUpdate]";
    _os_log_impl(&dword_23797A000, v3, OS_LOG_TYPE_DEFAULT, "%s Processing update to gms availability", (uint8_t *)&v4, 0xCu);
  }

  if ([(UAFXPCService *)self _gmsEnabledChanged])
  {
    [(UAFXPCService *)self _updateAssistantSubscription];
    [(UAFXPCService *)self _updateGMSSiriLanguageSubscription];
  }
}

- (void)_systemLanguageUpdate
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = UAFGetLogCategory((void **)&UAFLogContextXPCService);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    BOOL v5 = "-[UAFXPCService _systemLanguageUpdate]";
    _os_log_impl(&dword_23797A000, v3, OS_LOG_TYPE_DEFAULT, "%s Processing update to system language", (uint8_t *)&v4, 0xCu);
  }

  if ([(UAFXPCService *)self _systemLanguageChanged])
  {
    [(UAFXPCService *)self _updateNLSystemLanguageSubscription];
    [(UAFXPCService *)self _updateMorphunSystemLanguageSubscription];
  }
}

- (BOOL)dictationEnabled
{
  return self->_dictationEnabled;
}

- (BOOL)assistantEnabled
{
  return self->_assistantEnabled;
}

- (BOOL)gmsEnabled
{
  return self->_gmsEnabled;
}

- (NSString)assistantLanguage
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)systemLanguage
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemLanguage, 0);
  objc_storeStrong((id *)&self->_assistantLanguage, 0);
  objc_storeStrong((id *)&self->_assetUtilitiesService, 0);
  objc_storeStrong(&self->_platformAssetSetObserver, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end