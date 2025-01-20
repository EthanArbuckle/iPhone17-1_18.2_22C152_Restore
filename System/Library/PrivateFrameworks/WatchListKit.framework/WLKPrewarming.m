@interface WLKPrewarming
+ (id)sharedInstance;
- (WLKPrewarming)init;
- (id)_connection;
- (id)_init;
- (void)_onQueue_prewarmDevice;
- (void)_prefetchAppLibrary;
- (void)_prefetchIfNeeded:(id)a3 alwaysPrefetchConfig:(BOOL)a4;
- (void)_prewarmConfigurationWithConfigCachePolicy:(unint64_t)a3;
- (void)prewarm;
- (void)prewarmDevice;
- (void)prewarmDeviceAndNetwork;
- (void)prewarmSubscriptionData;
- (void)prewarmWithConfigCachePolicy:(unint64_t)a3;
@end

@implementation WLKPrewarming

void __40__WLKPrewarming_prewarmSubscriptionData__block_invoke(uint64_t a1)
{
  v2 = WLKStartupSignpostLogObject();
  if (os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA2E8000, v2, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Subscriptions.Fetch", "", buf, 2u);
  }

  v3 = +[WLKSubscriptionStore sharedInstance];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __40__WLKPrewarming_prewarmSubscriptionData__block_invoke_25;
  v4[3] = &unk_1E620C548;
  v4[4] = *(void *)(a1 + 32);
  [v3 fetchSubscriptionData:0 completion:v4];
}

void __36__WLKPrewarming__prefetchAppLibrary__block_invoke()
{
  v0 = WLKStartupSignpostLogObject();
  os_signpost_id_t v1 = os_signpost_id_generate(v0);

  v2 = WLKStartupSignpostLogObject();
  v3 = v2;
  if (v1 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA2E8000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v1, "Config.prefetchAppLibrary", "", buf, 2u);
  }

  id v4 = +[WLKAppLibrary defaultAppLibrary];
  v5 = WLKStartupSignpostLogObject();
  v6 = v5;
  if (v1 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v9 = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA2E8000, v6, OS_SIGNPOST_INTERVAL_END, v1, "Config.prefetchAppLibrary", "", v9, 2u);
  }

  v7 = WLKSystemLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1BA2E8000, v7, OS_LOG_TYPE_DEFAULT, "WLKPrewarming - prefetchAppLibrary end", v8, 2u);
  }
}

void __60__WLKPrewarming__prewarmConfigurationWithConfigCachePolicy___block_invoke_13(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = WLKSystemLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v18[0]) = 0;
    _os_log_impl(&dword_1BA2E8000, v4, OS_LOG_TYPE_DEFAULT, "WLKPrewarming - done fetching config", (uint8_t *)v18, 2u);
  }

  v5 = WLKStartupSignpostLogObject();
  if (os_signpost_enabled(v5))
  {
    LOWORD(v18[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA2E8000, v5, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Config.Fetch", "", (uint8_t *)v18, 2u);
  }

  unsigned int v6 = (*(void *)(a1 + 48) < 6uLL) & (0x32u >> *(void *)(a1 + 48));
  v7 = +[WLKLaunchConfiguration sharedInstance];
  uint64_t v8 = [v7 alwaysPrefetchAppConfiguration];

  int v9 = [v3 isFromDiskCache];
  v10 = WLKSystemLogObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v18[0] = 67109632;
    v18[1] = v9;
    __int16 v19 = 1024;
    unsigned int v20 = v6;
    __int16 v21 = 1024;
    int v22 = v8;
    _os_log_impl(&dword_1BA2E8000, v10, OS_LOG_TYPE_DEFAULT, "WLKPrewarming - Check prefetching: isFromDiskCache: %d, doesPolicyAllowInvalidConfig: %d, alwaysPrefetchConfig: %d", (uint8_t *)v18, 0x14u);
  }

  if ((v9 & (v6 | v8)) == 1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _prefetchIfNeeded:v3 alwaysPrefetchConfig:v8];
  }
  v12 = WLKStartupSignpostLogObject();
  if (os_signpost_enabled(v12))
  {
    LOWORD(v18[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA2E8000, v12, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "WLKPrewarming.Daemon", "", (uint8_t *)v18, 2u);
  }

  v13 = [*(id *)(a1 + 32) _connection];
  v14 = [v13 remoteObjectProxyWithErrorHandler:&__block_literal_global_18_0];

  [v14 ping];
  [v14 checkPendingPlaybackReports];
  v15 = WLKStartupSignpostLogObject();
  if (os_signpost_enabled(v15))
  {
    LOWORD(v18[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA2E8000, v15, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "WLKPrewarming.Daemon", "", (uint8_t *)v18, 2u);
  }

  v16 = WLKStartupSignpostLogObject();
  if (os_signpost_enabled(v16))
  {
    LOWORD(v18[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA2E8000, v16, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "WLKPrewarming", "", (uint8_t *)v18, 2u);
  }

  v17 = WLKSystemLogObject();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v18[0]) = 0;
    _os_log_impl(&dword_1BA2E8000, v17, OS_LOG_TYPE_DEFAULT, "WLKPrewarming - end prewarm", (uint8_t *)v18, 2u);
  }
}

void __60__WLKPrewarming__prewarmConfigurationWithConfigCachePolicy___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = WLKStartupSignpostLogObject();
  if (os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA2E8000, v2, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "WLKPrewarming", "", buf, 2u);
  }

  id v3 = WLKSystemLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 134217984;
    uint64_t v14 = v4;
    _os_log_impl(&dword_1BA2E8000, v3, OS_LOG_TYPE_DEFAULT, "WLKPrewarming - Start prewarm, configCachePolicy = %lu", buf, 0xCu);
  }

  v5 = WLKStartupSignpostLogObject();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA2E8000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "LocationManager.init", "", buf, 2u);
  }

  id v6 = +[WLKLocationManager defaultLocationManager];
  v7 = WLKStartupSignpostLogObject();
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA2E8000, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "LocationManager.init", "", buf, 2u);
  }

  uint64_t v8 = WLKStartupSignpostLogObject();
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA2E8000, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Config.Fetch", "", buf, 2u);
  }

  int v9 = +[WLKConfigurationManager sharedInstance];
  v10 = *(void **)(a1 + 48);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __60__WLKPrewarming__prewarmConfigurationWithConfigCachePolicy___block_invoke_13;
  v11[3] = &unk_1E620C4D8;
  v12[1] = v10;
  objc_copyWeak(v12, (id *)(a1 + 40));
  v11[4] = *(void *)(a1 + 32);
  [v9 fetchConfigurationWithOptions:0 cachePolicy:v10 queryParameters:0 completion:v11];

  objc_destroyWeak(v12);
}

void __56__WLKPrewarming__prefetchIfNeeded_alwaysPrefetchConfig___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 40)) {
    uint64_t v1 = 3;
  }
  else {
    uint64_t v1 = 0;
  }
  if (*(unsigned char *)(a1 + 40) || (uint64_t v8 = *(void **)(a1 + 32)) == 0 || ([v8 isValid] & 1) == 0)
  {
    v2 = WLKSystemLogObject();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v11 = v1;
      _os_log_impl(&dword_1BA2E8000, v2, OS_LOG_TYPE_DEFAULT, "WLKPrewarming - Prefetching the configuration, cachePolicy=%lu", buf, 0xCu);
    }

    id v3 = WLKStartupSignpostLogObject();
    os_signpost_id_t v4 = os_signpost_id_generate(v3);

    v5 = WLKStartupSignpostLogObject();
    id v6 = v5;
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BA2E8000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "Config.SilentFetch", "", buf, 2u);
    }

    v7 = +[WLKConfigurationManager sharedInstance];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __56__WLKPrewarming__prefetchIfNeeded_alwaysPrefetchConfig___block_invoke_23;
    v9[3] = &__block_descriptor_40_e52_v24__0__WLKServerConfigurationResponse_8__NSError_16l;
    v9[4] = v4;
    [v7 fetchConfigurationWithOptions:0 cachePolicy:v1 queryParameters:0 completion:v9];
  }
}

- (void)_prefetchIfNeeded:(id)a3 alwaysPrefetchConfig:(BOOL)a4
{
  id v6 = a3;
  prefetchQueue = self->_prefetchQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__WLKPrewarming__prefetchIfNeeded_alwaysPrefetchConfig___block_invoke;
  v9[3] = &unk_1E620BB88;
  BOOL v11 = a4;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(prefetchQueue, v9);
}

- (id)_connection
{
  connection = self->_connection;
  if (!connection)
  {
    os_signpost_id_t v4 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.watchlistd.xpc" options:0];
    v5 = self->_connection;
    self->_connection = v4;

    id v6 = self->_connection;
    v7 = WLKConnectionClientInterface();
    [(NSXPCConnection *)v6 setExportedInterface:v7];

    [(NSXPCConnection *)self->_connection setExportedObject:self];
    id v8 = self->_connection;
    int v9 = WLKConnectionServerInterface();
    [(NSXPCConnection *)v8 setRemoteObjectInterface:v9];

    [(NSXPCConnection *)self->_connection setInterruptionHandler:&__block_literal_global_38];
    objc_initWeak(&location, self);
    id v10 = self->_connection;
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    uint64_t v14 = __28__WLKPrewarming__connection__block_invoke_39;
    uint64_t v15 = &unk_1E620A550;
    objc_copyWeak(&v16, &location);
    [(NSXPCConnection *)v10 setInvalidationHandler:&v12];
    [(NSXPCConnection *)self->_connection resume];
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
    connection = self->_connection;
  }

  return connection;
}

void __40__WLKPrewarming_prewarmSubscriptionData__block_invoke_25(uint64_t a1, void *a2, void *a3)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v13 = @"WLKPrewarmSubscriptionDataNotificationErrorKey";
    v7 = +[WLKSanitizer sanitizeError:v6];
    v14[0] = v7;
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
  }
  else
  {
    id v8 = 0;
  }
  int v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v9 postNotificationName:@"WLKPrewarmSubscriptionDataDidComplete" object:*(void *)(a1 + 32) userInfo:v8];

  id v10 = WLKSystemLogObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl(&dword_1BA2E8000, v10, OS_LOG_TYPE_DEFAULT, "WLKPrewarming - done refreshing subs", v12, 2u);
  }

  BOOL v11 = WLKStartupSignpostLogObject();
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)uint64_t v12 = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA2E8000, v11, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Subscriptions.Fetch", "", v12, 2u);
  }
}

uint64_t __31__WLKPrewarming_sharedInstance__block_invoke()
{
  sharedInstance___sharedInstance_1 = [[WLKPrewarming alloc] _init];

  return MEMORY[0x1F41817F8]();
}

- (id)_init
{
  v9.receiver = self;
  v9.super_class = (Class)WLKPrewarming;
  v2 = [(WLKPrewarming *)&v9 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.watchlistkit.prewarm", 0);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v3;

    id v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.watchlistkit.prefetch", v5);
    prefetchQueue = v2->_prefetchQueue;
    v2->_prefetchQueue = (OS_dispatch_queue *)v6;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance___once_4 != -1) {
    dispatch_once(&sharedInstance___once_4, &__block_literal_global_53);
  }
  v2 = (void *)sharedInstance___sharedInstance_1;

  return v2;
}

- (void)prewarmWithConfigCachePolicy:(unint64_t)a3
{
  [(WLKPrewarming *)self _prewarmConfigurationWithConfigCachePolicy:a3];

  [(WLKPrewarming *)self _prefetchAppLibrary];
}

- (void)_prewarmConfigurationWithConfigCachePolicy:(unint64_t)a3
{
  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__WLKPrewarming__prewarmConfigurationWithConfigCachePolicy___block_invoke;
  v6[3] = &unk_1E620C500;
  v7[1] = (id)a3;
  objc_copyWeak(v7, &location);
  v6[4] = self;
  dispatch_async(workQueue, v6);
  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

- (void)prewarmSubscriptionData
{
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__WLKPrewarming_prewarmSubscriptionData__block_invoke;
  block[3] = &unk_1E620A708;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)_prefetchAppLibrary
{
  v2 = WLKSystemLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)os_signpost_id_t v4 = 0;
    _os_log_impl(&dword_1BA2E8000, v2, OS_LOG_TYPE_DEFAULT, "WLKPrewarming - prefetchAppLibrary begin", v4, 2u);
  }

  dispatch_queue_t v3 = dispatch_get_global_queue(17, 0);
  dispatch_async(v3, &__block_literal_global_21_0);
}

- (WLKPrewarming)init
{
  dispatch_queue_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  id v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The %@ initializer is not available.", v5 format];

  return 0;
}

- (void)prewarm
{
}

void __60__WLKPrewarming__prewarmConfigurationWithConfigCachePolicy___block_invoke_15(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  dispatch_queue_t v3 = WLKSystemLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_1BA2E8000, v3, OS_LOG_TYPE_DEFAULT, "WLKPrewarming - Error: Unable to communicate with the remote object proxy (%@)", (uint8_t *)&v4, 0xCu);
  }
}

void __56__WLKPrewarming__prefetchIfNeeded_alwaysPrefetchConfig___block_invoke_23(uint64_t a1)
{
  id v2 = WLKStartupSignpostLogObject();
  dispatch_queue_t v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 32);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA2E8000, v3, OS_SIGNPOST_INTERVAL_END, v4, "Config.SilentFetch", "", buf, 2u);
  }

  id v5 = WLKSystemLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_1BA2E8000, v5, OS_LOG_TYPE_DEFAULT, "WLKPrewarming - Done silent fetching", v6, 2u);
  }
}

- (void)prewarmDevice
{
  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __30__WLKPrewarming_prewarmDevice__block_invoke;
  v4[3] = &unk_1E620A550;
  objc_copyWeak(&v5, &location);
  dispatch_async(workQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __30__WLKPrewarming_prewarmDevice__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WLKStartupSignpostLogObject();
  if (os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA2E8000, v2, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "WLKPrewarming.Device", "", buf, 2u);
  }

  dispatch_queue_t v3 = WLKSystemLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_1BA2E8000, v3, OS_LOG_TYPE_DEFAULT, "WLKPrewarming - start prewarmDevice", v8, 2u);
  }

  objc_msgSend(WeakRetained, "_onQueue_prewarmDevice");
  os_signpost_id_t v4 = WLKStartupSignpostLogObject();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA2E8000, v4, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "WLKPrewarming.Device", "", v7, 2u);
  }

  id v5 = WLKSystemLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_1BA2E8000, v5, OS_LOG_TYPE_DEFAULT, "WLKPrewarming - end prewarmDevice", v6, 2u);
  }
}

- (void)_onQueue_prewarmDevice
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  id v2 = +[WLKConfigurationManager sharedInstance];
  id v3 = +[WLKAppLibrary defaultAppLibrary];
}

- (void)prewarmDeviceAndNetwork
{
  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __40__WLKPrewarming_prewarmDeviceAndNetwork__block_invoke;
  v4[3] = &unk_1E620A550;
  objc_copyWeak(&v5, &location);
  dispatch_async(workQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __40__WLKPrewarming_prewarmDeviceAndNetwork__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WLKStartupSignpostLogObject();
  if (os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA2E8000, v2, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "WLKPrewarming.nonPersonalized.start", "", buf, 2u);
  }

  id v3 = WLKSystemLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BA2E8000, v3, OS_LOG_TYPE_DEFAULT, "WLKPrewarming - start prewarmNonPersonalized", buf, 2u);
  }

  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  id v5 = WLKStartupSignpostLogObject();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA2E8000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "WLKPrewarming.nonPersonalized.bag.start", "", buf, 2u);
  }

  uint64_t v6 = objc_opt_class();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __40__WLKPrewarming_prewarmDeviceAndNetwork__block_invoke_31;
  v11[3] = &unk_1E620BC28;
  v7 = v4;
  uint64_t v12 = v7;
  [v6 isFullTVAppEnabledwithCompletion:v11];
  objc_msgSend(WeakRetained, "_onQueue_prewarmDevice");
  dispatch_time_t v8 = dispatch_time(0, 10000000000);
  dispatch_semaphore_wait(v7, v8);
  objc_super v9 = WLKStartupSignpostLogObject();
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA2E8000, v9, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "WLKPrewarming.nonPersonalized.end", "", buf, 2u);
  }

  id v10 = WLKSystemLogObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BA2E8000, v10, OS_LOG_TYPE_DEFAULT, "WLKPrewarming - end prewarmNonPersonalized", buf, 2u);
  }
}

intptr_t __40__WLKPrewarming_prewarmDeviceAndNetwork__block_invoke_31(uint64_t a1)
{
  id v2 = WLKStartupSignpostLogObject();
  if (os_signpost_enabled(v2))
  {
    *(_WORD *)dispatch_semaphore_t v4 = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA2E8000, v2, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "WLKPrewarming.nonPersonalized.bag.end", "", v4, 2u);
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __28__WLKPrewarming__connection__block_invoke()
{
  v0 = WLKSystemLogObject();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl(&dword_1BA2E8000, v0, OS_LOG_TYPE_DEFAULT, "WLKPrewarming - Connection interrupted.", v1, 2u);
  }
}

void __28__WLKPrewarming__connection__block_invoke_39(uint64_t a1)
{
  id v2 = WLKSystemLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_1BA2E8000, v2, OS_LOG_TYPE_DEFAULT, "WLKPrewarming - Connection invalidated.", v6, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  dispatch_semaphore_t v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = (void *)*((void *)WeakRetained + 3);
    *((void *)WeakRetained + 3) = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_prefetchQueue, 0);

  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end