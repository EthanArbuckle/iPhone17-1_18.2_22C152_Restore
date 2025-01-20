@interface SPSecureLocationsManager
+ (id)exportedInterface;
+ (id)remoteInterface;
- (FMXPCServiceDescription)serviceDescription;
- (FMXPCSession)session;
- (OS_dispatch_queue)queue;
- (SPRetryCount)stewieRetryCount;
- (SPSecureLocationsManager)init;
- (SPSecureLocationsXPCProtocol)proxy;
- (id)clearCacheUpdates;
- (id)locationUpdates;
- (id)stewieUpdateBlock;
- (int64_t)lastUpdatedStewieState;
- (void)clearLocationsForFailedSubscriptions:(id)a3;
- (void)currentStewieStateWithCompletion:(id)a3;
- (void)fetchConfigFromServerWithCompletion:(id)a3;
- (void)interruptionHandler:(id)a3;
- (void)invalidationHandler:(id)a3;
- (void)isLocationPublishingDeviceWithCompletion:(id)a3;
- (void)latestLocationFromCacheForId:(id)a3 completion:(id)a4;
- (void)performKeyRollWithCompletion:(id)a3;
- (void)publishCurrentLocationToStewieWithReason:(int64_t)a3 completion:(id)a4;
- (void)publishLocation:(id)a3 completion:(id)a4;
- (void)receivedLocationCommand:(id)a3 completion:(id)a4;
- (void)receivedLocationPayload:(id)a3 completion:(id)a4;
- (void)receivedUpdatedLocations:(id)a3;
- (void)setClearCacheUpdates:(id)a3;
- (void)setLastUpdatedStewieState:(int64_t)a3;
- (void)setLocationUpdateBlock:(id)a3;
- (void)setLocationUpdates:(id)a3;
- (void)setProxy:(id)a3;
- (void)setQueue:(id)a3;
- (void)setServiceDescription:(id)a3;
- (void)setSession:(id)a3;
- (void)setStewieRetryCount:(id)a3;
- (void)setStewieUpdateBlock:(id)a3;
- (void)shareCurrentKeyWithId:(id)a3 completion:(id)a4;
- (void)shareCurrentKeyWithId:(id)a3 idsHandles:(id)a4 completion:(id)a5;
- (void)shouldStartLocationMonitorWithCompletion:(id)a3;
- (void)simulateFeatureDisabled:(BOOL)a3 completion:(id)a4;
- (void)startMonitoringFailedSubscriptions:(id)a3;
- (void)startMonitoringStewieStateWithBlock:(id)a3 completion:(id)a4;
- (void)stewiePublishStateWithCompletion:(id)a3;
- (void)stewieServiceStateChanged:(int64_t)a3;
- (void)stopMonitoringStewieStateWithCompletion:(id)a3;
- (void)subscribeAndFetchLocationForIds:(id)a3 clientApp:(id)a4 completion:(id)a5;
- (void)subscribeAndFetchLocationForIds:(id)a3 context:(id)a4 completion:(id)a5;
- (void)triggerStewieProactiveNotification;
- (void)unsubscribeForId:(id)a3 clientApp:(id)a4 completion:(id)a5;
- (void)unsubscribeForIds:(id)a3 context:(id)a4 completion:(id)a5;
- (void)updateLocationCacheWith:(id)a3 completion:(id)a4;
@end

@implementation SPSecureLocationsManager

- (SPSecureLocationsManager)init
{
  v24.receiver = self;
  v24.super_class = (Class)SPSecureLocationsManager;
  v2 = [(SPSecureLocationsManager *)&v24 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.findmy.SPSecureLocationsManagerQueue", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = objc_alloc_init(SPRetryCount);
    stewieRetryCount = v2->_stewieRetryCount;
    v2->_stewieRetryCount = v6;

    objc_initWeak(&location, v2);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __32__SPSecureLocationsManager_init__block_invoke;
    aBlock[3] = &unk_1E601B7B8;
    objc_copyWeak(&v22, &location);
    v8 = _Block_copy(aBlock);
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    v18 = __32__SPSecureLocationsManager_init__block_invoke_2;
    v19 = &unk_1E601B7B8;
    objc_copyWeak(&v20, &location);
    v9 = _Block_copy(&v16);
    id v10 = objc_alloc(MEMORY[0x1E4F61588]);
    v11 = +[SPSecureLocationsManager exportedInterface];
    v12 = +[SPSecureLocationsManager remoteInterface];
    uint64_t v13 = objc_msgSend(v10, "initWithMachServiceName:options:exportedObject:exportedInterface:remoteObjectInterface:interruptionHandler:invalidationHandler:", @"com.apple.icloud.searchpartyd.securelocations", 0, v2, v11, v12, v8, v9, v16, v17, v18, v19);
    serviceDescription = v2->_serviceDescription;
    v2->_serviceDescription = (FMXPCServiceDescription *)v13;

    [(SPSecureLocationsManager *)v2 setLastUpdatedStewieState:0];
    objc_destroyWeak(&v20);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __32__SPSecureLocationsManager_init__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained interruptionHandler:v3];
}

void __32__SPSecureLocationsManager_init__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained invalidationHandler:v3];
}

- (void)interruptionHandler:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = LogCategory_SecureLocations();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v4;
    _os_log_impl(&dword_1B2FD8000, v5, OS_LOG_TYPE_DEFAULT, "SPSecureLocationsManager interruptionHandler %@", buf, 0xCu);
  }

  v6 = [(SPSecureLocationsManager *)self stewieUpdateBlock];

  if (v6)
  {
    objc_initWeak((id *)buf, self);
    [(SPRetryCount *)self->_stewieRetryCount decayWaitInterval];
    dispatch_time_t v8 = dispatch_time(0, (uint64_t)(v7 * 1000000000.0));
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    v11 = __48__SPSecureLocationsManager_interruptionHandler___block_invoke;
    v12 = &unk_1E601BB38;
    objc_copyWeak(&v14, (id *)buf);
    id v13 = v4;
    dispatch_after(v8, MEMORY[0x1E4F14428], &v9);
    [(SPRetryCount *)self->_stewieRetryCount increment];

    objc_destroyWeak(&v14);
    objc_destroyWeak((id *)buf);
  }
}

void __48__SPSecureLocationsManager_interruptionHandler___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained stewieUpdateBlock];
  id v4 = LogCategory_SecureLocations();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      uint64_t v6 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      uint64_t v10 = @"stewie:";
      __int16 v11 = 2112;
      uint64_t v12 = v6;
      _os_log_impl(&dword_1B2FD8000, v4, OS_LOG_TYPE_DEFAULT, "SPSecureLocationsManager: %@ - Will Re-subscribe liteloc due to interruption %@", buf, 0x16u);
    }

    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __48__SPSecureLocationsManager_interruptionHandler___block_invoke_146;
    v8[3] = &unk_1E601B598;
    v8[4] = WeakRetained;
    [WeakRetained startMonitoringStewieStateWithBlock:v3 completion:v8];
  }
  else
  {
    if (v5)
    {
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      uint64_t v10 = @"stewie:";
      __int16 v11 = 2112;
      uint64_t v12 = v7;
      _os_log_impl(&dword_1B2FD8000, v4, OS_LOG_TYPE_DEFAULT, "SPSecureLocationsManager: %@ - not re-subscribing. %@", buf, 0x16u);
    }
  }
}

void __48__SPSecureLocationsManager_interruptionHandler___block_invoke_146(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = LogCategory_SecureLocations();
  BOOL v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __48__SPSecureLocationsManager_interruptionHandler___block_invoke_146_cold_1((uint64_t)v3, v5);
    }
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      uint64_t v7 = @"stewie:";
      _os_log_impl(&dword_1B2FD8000, v5, OS_LOG_TYPE_DEFAULT, "SPSecureLocationsManager: %@ - Did re-subscribed litloc update", (uint8_t *)&v6, 0xCu);
    }

    BOOL v5 = [*(id *)(a1 + 32) stewieRetryCount];
    [v5 reset];
  }
}

- (void)invalidationHandler:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = LogCategory_SecureLocations();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_1B2FD8000, v4, OS_LOG_TYPE_DEFAULT, "SPSecureLocationsManager invalidationHandler %@", (uint8_t *)&v5, 0xCu);
  }
}

- (SPSecureLocationsXPCProtocol)proxy
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [(SPSecureLocationsManager *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(SPSecureLocationsManager *)self session];

  if (!v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F61590]);
    id v6 = [(SPSecureLocationsManager *)self serviceDescription];
    uint64_t v7 = (void *)[v5 initWithServiceDescription:v6];
    [(SPSecureLocationsManager *)self setSession:v7];

    uint64_t v8 = LogCategory_SecureLocations();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [(SPSecureLocationsManager *)self serviceDescription];
      uint64_t v10 = [v9 machService];
      int v15 = 138412290;
      id v16 = v10;
      _os_log_impl(&dword_1B2FD8000, v8, OS_LOG_TYPE_DEFAULT, "SPSecureLocationsManager: Establishing XPC connection to %@", (uint8_t *)&v15, 0xCu);
    }
    __int16 v11 = [(SPSecureLocationsManager *)self session];
    [v11 resume];
  }
  uint64_t v12 = [(SPSecureLocationsManager *)self session];
  uint64_t v13 = [v12 proxy];

  return (SPSecureLocationsXPCProtocol *)v13;
}

+ (id)exportedInterface
{
  if (exportedInterface_onceToken_3 != -1) {
    dispatch_once(&exportedInterface_onceToken_3, &__block_literal_global_5);
  }
  v2 = (void *)exportedInterface_interface_3;

  return v2;
}

void __45__SPSecureLocationsManager_exportedInterface__block_invoke()
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0B35670];
  v1 = (void *)exportedInterface_interface_3;
  exportedInterface_interface_3 = v0;

  v2 = (void *)exportedInterface_interface_3;
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v6 count:3];
  id v5 = objc_msgSend(v3, "setWithArray:", v4, v6, v7);
  [v2 setClasses:v5 forSelector:sel_receivedUpdatedLocations_ argumentIndex:0 ofReply:0];
}

+ (id)remoteInterface
{
  if (remoteInterface_onceToken_3 != -1) {
    dispatch_once(&remoteInterface_onceToken_3, &__block_literal_global_198);
  }
  v2 = (void *)remoteInterface_remoteInterface;

  return v2;
}

void __43__SPSecureLocationsManager_remoteInterface__block_invoke()
{
  v18[4] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0B440B0];
  v1 = (void *)remoteInterface_remoteInterface;
  remoteInterface_remoteInterface = v0;

  v2 = (void *)remoteInterface_remoteInterface;
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  v18[0] = objc_opt_class();
  v18[1] = objc_opt_class();
  v18[2] = objc_opt_class();
  v18[3] = objc_opt_class();
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:4];
  id v5 = [v3 setWithArray:v4];
  [v2 setClasses:v5 forSelector:sel_subscribeAndFetchLocationForIds_context_completion_ argumentIndex:0 ofReply:1];

  uint64_t v6 = (void *)remoteInterface_remoteInterface;
  uint64_t v7 = (void *)MEMORY[0x1E4F1CAD0];
  v17[0] = objc_opt_class();
  v17[1] = objc_opt_class();
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  uint64_t v9 = [v7 setWithArray:v8];
  [v6 setClasses:v9 forSelector:sel_latestLocationFromCacheForId_completion_ argumentIndex:0 ofReply:1];

  uint64_t v10 = (void *)remoteInterface_remoteInterface;
  __int16 v11 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:3];
  uint64_t v13 = objc_msgSend(v11, "setWithArray:", v12, v14, v15);
  [v10 setClasses:v13 forSelector:sel_updateLocationCacheWith_completion_ argumentIndex:0 ofReply:0];
}

- (void)receivedUpdatedLocations:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__SPSecureLocationsManager_receivedUpdatedLocations___block_invoke;
  v6[3] = &unk_1E601B920;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  _os_activity_initiate(&dword_1B2FD8000, "SPSecureLocationsManager.receivedUpdatedLocations", OS_ACTIVITY_FLAG_DEFAULT, v6);
}

void __53__SPSecureLocationsManager_receivedUpdatedLocations___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = LogCategory_SecureLocations();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) count];
    *(_DWORD *)buf = 134217984;
    uint64_t v10 = v3;
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "receivedUpdatedLocations %lu", buf, 0xCu);
  }

  id v4 = [*(id *)(a1 + 40) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__SPSecureLocationsManager_receivedUpdatedLocations___block_invoke_242;
  block[3] = &unk_1E601B920;
  int8x16_t v6 = *(int8x16_t *)(a1 + 32);
  id v5 = (id)v6.i64[0];
  int8x16_t v8 = vextq_s8(v6, v6, 8uLL);
  dispatch_async(v4, block);
}

void __53__SPSecureLocationsManager_receivedUpdatedLocations___block_invoke_242(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) locationUpdates];

  if (v2)
  {
    id v4 = [*(id *)(a1 + 32) locationUpdates];
    v4[2](v4, *(void *)(a1 + 40));
  }
  else
  {
    uint64_t v3 = LogCategory_SecureLocations();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B2FD8000, v3, OS_LOG_TYPE_DEFAULT, "SPSecureLocationsManager - received updated locations but no registered block", buf, 2u);
    }
  }
}

- (void)stewieServiceStateChanged:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __54__SPSecureLocationsManager_stewieServiceStateChanged___block_invoke;
  v3[3] = &unk_1E601BB60;
  v3[4] = self;
  v3[5] = a3;
  _os_activity_initiate(&dword_1B2FD8000, "SPSecureLocationsManager.liteLocationServiceStateChanged", OS_ACTIVITY_FLAG_DEFAULT, v3);
}

void __54__SPSecureLocationsManager_stewieServiceStateChanged___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = LogCategory_SecureLocations();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    int8x16_t v8 = @"stewie:";
    __int16 v9 = 2048;
    uint64_t v10 = v3;
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "SPSecureLocationsManager %@ serviceStateChanged %ld", buf, 0x16u);
  }

  id v4 = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__SPSecureLocationsManager_stewieServiceStateChanged___block_invoke_243;
  v6[3] = &unk_1E601BB60;
  uint64_t v5 = *(void *)(a1 + 40);
  void v6[4] = *(void *)(a1 + 32);
  v6[5] = v5;
  dispatch_async(v4, v6);
}

void __54__SPSecureLocationsManager_stewieServiceStateChanged___block_invoke_243(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) stewieUpdateBlock];

  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    if (v3 == [*(id *)(a1 + 32) lastUpdatedStewieState])
    {
      id v4 = LogCategory_SecureLocations();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = *(void *)(a1 + 40);
        int v10 = 138412546;
        uint64_t v11 = @"stewie:";
        __int16 v12 = 2048;
        uint64_t v13 = v5;
        _os_log_impl(&dword_1B2FD8000, v4, OS_LOG_TYPE_DEFAULT, "SPSecureLocationsManager %@  not notifying client since state is same as last %ld", (uint8_t *)&v10, 0x16u);
      }
    }
    else
    {
      id v7 = [*(id *)(a1 + 32) stewieUpdateBlock];
      v7[2](v7, *(void *)(a1 + 40));

      int8x16_t v8 = *(void **)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
      [v8 setLastUpdatedStewieState:v9];
    }
  }
  else
  {
    int8x16_t v6 = LogCategory_SecureLocations();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      uint64_t v11 = @"stewie:";
      _os_log_impl(&dword_1B2FD8000, v6, OS_LOG_TYPE_DEFAULT, "SPSecureLocationsManager %@ received updated state but no registered client block", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)clearLocationsForFailedSubscriptions:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__SPSecureLocationsManager_clearLocationsForFailedSubscriptions___block_invoke;
  v6[3] = &unk_1E601B920;
  id v7 = v4;
  int8x16_t v8 = self;
  id v5 = v4;
  _os_activity_initiate(&dword_1B2FD8000, "SPSecureLocationsManager.clearLocationsForFailedSubscriptions", OS_ACTIVITY_FLAG_DEFAULT, v6);
}

void __65__SPSecureLocationsManager_clearLocationsForFailedSubscriptions___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = LogCategory_SecureLocations();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) count];
    *(_DWORD *)buf = 134217984;
    uint64_t v10 = v3;
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "clearLocationsForFailedSubscriptions %lu", buf, 0xCu);
  }

  id v4 = [*(id *)(a1 + 40) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__SPSecureLocationsManager_clearLocationsForFailedSubscriptions___block_invoke_244;
  block[3] = &unk_1E601B920;
  int8x16_t v6 = *(int8x16_t *)(a1 + 32);
  id v5 = (id)v6.i64[0];
  int8x16_t v8 = vextq_s8(v6, v6, 8uLL);
  dispatch_async(v4, block);
}

void __65__SPSecureLocationsManager_clearLocationsForFailedSubscriptions___block_invoke_244(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) clearCacheUpdates];

  if (v2)
  {
    id v4 = [*(id *)(a1 + 32) clearCacheUpdates];
    v4[2](v4, *(void *)(a1 + 40));
  }
  else
  {
    uint64_t v3 = LogCategory_SecureLocations();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B2FD8000, v3, OS_LOG_TYPE_DEFAULT, "SPSecureLocationsManager - received updated cache state and attempted to clear locations but no registered block", buf, 2u);
    }
  }
}

- (void)setLocationUpdateBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__SPSecureLocationsManager_setLocationUpdateBlock___block_invoke;
  v6[3] = &unk_1E601B828;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  _os_activity_initiate(&dword_1B2FD8000, "SPSecureLocationsManager.setLocationUpdateBlock", OS_ACTIVITY_FLAG_DEFAULT, v6);
}

void __51__SPSecureLocationsManager_setLocationUpdateBlock___block_invoke(uint64_t a1)
{
  v2 = LogCategory_SecureLocations();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "setLocationUpdateBlock called", buf, 2u);
  }

  uint64_t v3 = [*(id *)(a1 + 32) queue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__SPSecureLocationsManager_setLocationUpdateBlock___block_invoke_245;
  v5[3] = &unk_1E601B828;
  id v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  dispatch_async(v3, v5);
}

uint64_t __51__SPSecureLocationsManager_setLocationUpdateBlock___block_invoke_245(uint64_t a1)
{
  return [*(id *)(a1 + 32) setLocationUpdates:*(void *)(a1 + 40)];
}

- (void)startMonitoringFailedSubscriptions:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__SPSecureLocationsManager_startMonitoringFailedSubscriptions___block_invoke;
  v6[3] = &unk_1E601B828;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  _os_activity_initiate(&dword_1B2FD8000, "SPSecureLocationsManager.startMonitoringForFailedSubscriptions", OS_ACTIVITY_FLAG_DEFAULT, v6);
}

void __63__SPSecureLocationsManager_startMonitoringFailedSubscriptions___block_invoke(uint64_t a1)
{
  v2 = LogCategory_SecureLocations();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "startMonitoringForFailedSubscriptions called", buf, 2u);
  }

  uint64_t v3 = [*(id *)(a1 + 32) queue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63__SPSecureLocationsManager_startMonitoringFailedSubscriptions___block_invoke_246;
  v5[3] = &unk_1E601B828;
  id v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  dispatch_async(v3, v5);
}

uint64_t __63__SPSecureLocationsManager_startMonitoringFailedSubscriptions___block_invoke_246(uint64_t a1)
{
  return [*(id *)(a1 + 32) setClearCacheUpdates:*(void *)(a1 + 40)];
}

- (void)subscribeAndFetchLocationForIds:(id)a3 clientApp:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __81__SPSecureLocationsManager_subscribeAndFetchLocationForIds_clientApp_completion___block_invoke;
  v14[3] = &unk_1E601BBB0;
  id v15 = v9;
  uint64_t v16 = self;
  id v17 = v8;
  id v18 = v10;
  id v11 = v10;
  id v12 = v8;
  id v13 = v9;
  _os_activity_initiate(&dword_1B2FD8000, "SPSecureLocationsManager.subscribeAndFetch", OS_ACTIVITY_FLAG_DEFAULT, v14);
}

void __81__SPSecureLocationsManager_subscribeAndFetchLocationForIds_clientApp_completion___block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(SPSecureLocationsSubscriptionContext);
  [(SPSecureLocationsSubscriptionContext *)v2 setClientApp:*(void *)(a1 + 32)];
  [(SPSecureLocationsSubscriptionContext *)v2 setSubscriptionMode:0];
  [(SPSecureLocationsSubscriptionContext *)v2 setFetchMode:1];
  uint64_t v3 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __81__SPSecureLocationsManager_subscribeAndFetchLocationForIds_clientApp_completion___block_invoke_2;
  v5[3] = &unk_1E601BB88;
  id v6 = *(id *)(a1 + 56);
  [v3 subscribeAndFetchLocationForIds:v4 context:v2 completion:v5];
}

void __81__SPSecureLocationsManager_subscribeAndFetchLocationForIds_clientApp_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 locations];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);
}

- (void)subscribeAndFetchLocationForIds:(id)a3 context:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __79__SPSecureLocationsManager_subscribeAndFetchLocationForIds_context_completion___block_invoke;
  v14[3] = &unk_1E601BBB0;
  id v15 = v8;
  id v16 = v9;
  id v17 = self;
  id v18 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  _os_activity_initiate(&dword_1B2FD8000, "SPSecureLocationsManager.subscribeAndFetchWithContext", OS_ACTIVITY_FLAG_DEFAULT, v14);
}

void __79__SPSecureLocationsManager_subscribeAndFetchLocationForIds_context_completion___block_invoke(id *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = LogCategory_SecureLocations();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = a1[4];
    id v4 = a1[5];
    *(_DWORD *)buf = 138412546;
    id v11 = v3;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "subscribeAndFetchLocationForIds %@ context %@", buf, 0x16u);
  }

  id v5 = [a1[6] queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __79__SPSecureLocationsManager_subscribeAndFetchLocationForIds_context_completion___block_invoke_248;
  v6[3] = &unk_1E601BBB0;
  void v6[4] = a1[6];
  id v7 = a1[4];
  id v8 = a1[5];
  id v9 = a1[7];
  dispatch_async(v5, v6);
}

void __79__SPSecureLocationsManager_subscribeAndFetchLocationForIds_context_completion___block_invoke_248(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) proxy];
  [v2 subscribeAndFetchLocationForIds:*(void *)(a1 + 40) context:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

- (void)unsubscribeForId:(id)a3 clientApp:(id)a4 completion:(id)a5
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init(SPSecureLocationsSubscriptionContext);
  [(SPSecureLocationsSubscriptionContext *)v11 setClientApp:v9];

  [(SPSecureLocationsSubscriptionContext *)v11 setSubscriptionMode:0];
  v13[0] = v10;
  __int16 v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];

  [(SPSecureLocationsManager *)self unsubscribeForIds:v12 context:v11 completion:v8];
}

- (void)unsubscribeForIds:(id)a3 context:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __65__SPSecureLocationsManager_unsubscribeForIds_context_completion___block_invoke;
  v14[3] = &unk_1E601BBB0;
  id v15 = v8;
  id v16 = v9;
  id v17 = self;
  id v18 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  _os_activity_initiate(&dword_1B2FD8000, "SPSecureLocationsManager.unsubscribeWithContext", OS_ACTIVITY_FLAG_DEFAULT, v14);
}

void __65__SPSecureLocationsManager_unsubscribeForIds_context_completion___block_invoke(id *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = LogCategory_SecureLocations();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = a1[4];
    id v4 = a1[5];
    *(_DWORD *)buf = 138412546;
    id v11 = v3;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "UnsubscribeForIds %@ with context %@", buf, 0x16u);
  }

  id v5 = [a1[6] queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__SPSecureLocationsManager_unsubscribeForIds_context_completion___block_invoke_249;
  v6[3] = &unk_1E601BBB0;
  void v6[4] = a1[6];
  id v7 = a1[4];
  id v8 = a1[5];
  id v9 = a1[7];
  dispatch_async(v5, v6);
}

void __65__SPSecureLocationsManager_unsubscribeForIds_context_completion___block_invoke_249(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) proxy];
  id v3 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __65__SPSecureLocationsManager_unsubscribeForIds_context_completion___block_invoke_2;
  v5[3] = &unk_1E601BBD8;
  id v6 = v3;
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  [v2 unsubscribeForIds:v6 context:v4 completion:v5];
}

void __65__SPSecureLocationsManager_unsubscribeForIds_context_completion___block_invoke_2(void *a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = LogCategory_SecureLocations();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __65__SPSecureLocationsManager_unsubscribeForIds_context_completion___block_invoke_2_cold_1((uint64_t)a1, (uint64_t)v3, v5);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = a1[4];
    uint64_t v7 = a1[5];
    int v8 = 138412546;
    uint64_t v9 = v6;
    __int16 v10 = 2112;
    uint64_t v11 = v7;
    _os_log_impl(&dword_1B2FD8000, v5, OS_LOG_TYPE_DEFAULT, "UnsubscribeForIds %@ with context %@ completed successfully", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(a1[6] + 16))();
}

- (void)latestLocationFromCacheForId:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  activity_block[2] = __68__SPSecureLocationsManager_latestLocationFromCacheForId_completion___block_invoke;
  activity_block[3] = &unk_1E601B878;
  id v11 = v6;
  uint64_t v12 = self;
  id v13 = v7;
  id v8 = v7;
  id v9 = v6;
  _os_activity_initiate(&dword_1B2FD8000, "SPSecureLocationsManager.latestKnownLocationFromCache", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __68__SPSecureLocationsManager_latestLocationFromCacheForId_completion___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = LogCategory_SecureLocations();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v11 = v3;
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "latestLocationFromCache %@", buf, 0xCu);
  }

  uint64_t v4 = [*(id *)(a1 + 40) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__SPSecureLocationsManager_latestLocationFromCacheForId_completion___block_invoke_250;
  block[3] = &unk_1E601B878;
  int8x16_t v6 = *(int8x16_t *)(a1 + 32);
  id v5 = (id)v6.i64[0];
  int8x16_t v8 = vextq_s8(v6, v6, 8uLL);
  id v9 = *(id *)(a1 + 48);
  dispatch_async(v4, block);
}

void __68__SPSecureLocationsManager_latestLocationFromCacheForId_completion___block_invoke_250(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) proxy];
  [v2 latestLocationFromCacheForId:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)updateLocationCacheWith:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  activity_block[2] = __63__SPSecureLocationsManager_updateLocationCacheWith_completion___block_invoke;
  activity_block[3] = &unk_1E601BC00;
  uint64_t v12 = self;
  id v13 = v7;
  id v11 = v6;
  id v8 = v7;
  id v9 = v6;
  _os_activity_initiate(&dword_1B2FD8000, "SPSecureLocationsManager.updateLatestLocationCacheWith", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __63__SPSecureLocationsManager_updateLocationCacheWith_completion___block_invoke(id *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = LogCategory_SecureLocations();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [a1[4] count];
    *(_DWORD *)buf = 134217984;
    uint64_t v11 = v3;
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "updateLatestLocationCacheWith %lu", buf, 0xCu);
  }

  if ([a1[4] count])
  {
    uint64_t v4 = [a1[5] queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__SPSecureLocationsManager_updateLocationCacheWith_completion___block_invoke_251;
    block[3] = &unk_1E601B878;
    int8x16_t v6 = *((int8x16_t *)a1 + 2);
    id v5 = (id)v6.i64[0];
    int8x16_t v8 = vextq_s8(v6, v6, 8uLL);
    id v9 = a1[6];
    dispatch_async(v4, block);
  }
  else
  {
    (*((void (**)(void))a1[6] + 2))();
  }
}

void __63__SPSecureLocationsManager_updateLocationCacheWith_completion___block_invoke_251(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) proxy];
  [v2 updateLocationCacheWith:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)publishLocation:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  int8x16_t v8 = LogCategory_SecureLocations();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2FD8000, v8, OS_LOG_TYPE_DEFAULT, "publishLocation ", buf, 2u);
  }

  v7[2](v7, 0);
  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  activity_block[2] = __55__SPSecureLocationsManager_publishLocation_completion___block_invoke;
  activity_block[3] = &unk_1E601B878;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  _os_activity_initiate(&dword_1B2FD8000, "SPSecureLocationsManager.subscribeAndFetch", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __55__SPSecureLocationsManager_publishLocation_completion___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = LogCategory_SecureLocations();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v11 = v3;
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "publishLocation %@", buf, 0xCu);
  }

  uint64_t v4 = [*(id *)(a1 + 40) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__SPSecureLocationsManager_publishLocation_completion___block_invoke_252;
  block[3] = &unk_1E601B878;
  int8x16_t v6 = *(int8x16_t *)(a1 + 32);
  id v5 = (id)v6.i64[0];
  int8x16_t v8 = vextq_s8(v6, v6, 8uLL);
  id v9 = *(id *)(a1 + 48);
  dispatch_async(v4, block);
}

void __55__SPSecureLocationsManager_publishLocation_completion___block_invoke_252(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) proxy];
  [v2 publishLocation:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)receivedLocationPayload:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int8x16_t v8 = LogCategory_SecureLocations();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2FD8000, v8, OS_LOG_TYPE_DEFAULT, "Received location payload", buf, 2u);
  }

  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  activity_block[2] = __63__SPSecureLocationsManager_receivedLocationPayload_completion___block_invoke;
  activity_block[3] = &unk_1E601B878;
  activity_void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  _os_activity_initiate(&dword_1B2FD8000, "SPSecureLocationsManager.receivedLocationPayload", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __63__SPSecureLocationsManager_receivedLocationPayload_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__SPSecureLocationsManager_receivedLocationPayload_completion___block_invoke_2;
  block[3] = &unk_1E601B878;
  uint64_t v3 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v5 = v3;
  id v6 = *(id *)(a1 + 48);
  dispatch_async(v2, block);
}

void __63__SPSecureLocationsManager_receivedLocationPayload_completion___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) proxy];
  [v2 receivedLocationPayload:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)receivedLocationCommand:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int8x16_t v8 = LogCategory_SecureLocations();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2FD8000, v8, OS_LOG_TYPE_DEFAULT, "Received location command", buf, 2u);
  }

  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  activity_block[2] = __63__SPSecureLocationsManager_receivedLocationCommand_completion___block_invoke;
  activity_block[3] = &unk_1E601B878;
  activity_void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  _os_activity_initiate(&dword_1B2FD8000, "SPSecureLocationsManager.receivedLocationCommand", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __63__SPSecureLocationsManager_receivedLocationCommand_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__SPSecureLocationsManager_receivedLocationCommand_completion___block_invoke_2;
  block[3] = &unk_1E601B878;
  uint64_t v3 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v5 = v3;
  id v6 = *(id *)(a1 + 48);
  dispatch_async(v2, block);
}

void __63__SPSecureLocationsManager_receivedLocationCommand_completion___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) proxy];
  [v2 receivedLocationCommand:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)shouldStartLocationMonitorWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = LogCategory_SecureLocations();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2FD8000, v5, OS_LOG_TYPE_DEFAULT, "Received location command", buf, 2u);
  }

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__SPSecureLocationsManager_shouldStartLocationMonitorWithCompletion___block_invoke;
  v7[3] = &unk_1E601B828;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  _os_activity_initiate(&dword_1B2FD8000, "SPSecureLocationsManager.hasLocationSubscribers", OS_ACTIVITY_FLAG_DEFAULT, v7);
}

void __69__SPSecureLocationsManager_shouldStartLocationMonitorWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) queue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __69__SPSecureLocationsManager_shouldStartLocationMonitorWithCompletion___block_invoke_2;
  v4[3] = &unk_1E601B828;
  uint64_t v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  dispatch_async(v2, v4);
}

void __69__SPSecureLocationsManager_shouldStartLocationMonitorWithCompletion___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) proxy];
  [v2 shouldStartLocationMonitorWithCompletion:*(void *)(a1 + 40)];
}

- (void)publishCurrentLocationToStewieWithReason:(int64_t)a3 completion:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  char v7 = _os_feature_enabled_impl();
  id v8 = LogCategory_SecureLocations();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      *(_DWORD *)buf = 138412546;
      id v15 = @"stewie:";
      __int16 v16 = 2048;
      int64_t v17 = a3;
      _os_log_impl(&dword_1B2FD8000, v8, OS_LOG_TYPE_DEFAULT, "Framework API: %@ publishCurrentLocationWithReason %ld", buf, 0x16u);
    }

    activity_block[0] = MEMORY[0x1E4F143A8];
    activity_block[1] = 3221225472;
    activity_block[2] = __80__SPSecureLocationsManager_publishCurrentLocationToStewieWithReason_completion___block_invoke;
    activity_block[3] = &unk_1E601BC28;
    activity_void block[4] = self;
    int64_t v13 = a3;
    id v12 = v6;
    _os_activity_initiate(&dword_1B2FD8000, "SPSecureLocationsManager.publishCurrentLiteLocationWithReason", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
  }
  else
  {
    if (v9)
    {
      *(_DWORD *)buf = 138412290;
      id v15 = @"stewie:";
      _os_log_impl(&dword_1B2FD8000, v8, OS_LOG_TYPE_DEFAULT, "%@ feature disabled", buf, 0xCu);
    }

    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"com.apple.findmy.SPSecureLocations.StewieErrorDomain" code:3 userInfo:0];
    (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v10);
  }
}

void __80__SPSecureLocationsManager_publishCurrentLocationToStewieWithReason_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__SPSecureLocationsManager_publishCurrentLocationToStewieWithReason_completion___block_invoke_2;
  block[3] = &unk_1E601BC28;
  id v4 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  void block[4] = *(void *)(a1 + 32);
  uint64_t v7 = v3;
  id v6 = v4;
  dispatch_async(v2, block);
}

void __80__SPSecureLocationsManager_publishCurrentLocationToStewieWithReason_completion___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) proxy];
  [v2 publishCurrentLocationToStewieWithReason:*(void *)(a1 + 48) completion:*(void *)(a1 + 40)];
}

- (void)startMonitoringStewieStateWithBlock:(id)a3 completion:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  char v8 = _os_feature_enabled_impl();
  BOOL v9 = LogCategory_SecureLocations();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      *(_DWORD *)buf = 138412290;
      __int16 v16 = @"stewie:";
      _os_log_impl(&dword_1B2FD8000, v9, OS_LOG_TYPE_DEFAULT, "Framework API: %@ startMonitoringState", buf, 0xCu);
    }

    if (v6)
    {
      activity_block[0] = MEMORY[0x1E4F143A8];
      activity_block[1] = 3221225472;
      activity_block[2] = __75__SPSecureLocationsManager_startMonitoringStewieStateWithBlock_completion___block_invoke;
      activity_block[3] = &unk_1E601BC50;
      activity_void block[4] = self;
      id v13 = v6;
      id v14 = v7;
      _os_activity_initiate(&dword_1B2FD8000, "SPSecureLocationsManager.startMonitoringLiteLocationState", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
    }
  }
  else
  {
    if (v10)
    {
      *(_DWORD *)buf = 138412290;
      __int16 v16 = @"stewie:";
      _os_log_impl(&dword_1B2FD8000, v9, OS_LOG_TYPE_DEFAULT, "%@ feature disabled", buf, 0xCu);
    }

    uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"com.apple.findmy.SPSecureLocations.StewieErrorDomain" code:3 userInfo:0];
    (*((void (**)(id, void *))v7 + 2))(v7, v11);
    if (v6) {
      (*((void (**)(id, uint64_t))v6 + 2))(v6, 7);
    }
  }
}

void __75__SPSecureLocationsManager_startMonitoringStewieStateWithBlock_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__SPSecureLocationsManager_startMonitoringStewieStateWithBlock_completion___block_invoke_2;
  block[3] = &unk_1E601BC50;
  uint64_t v3 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v5 = v3;
  id v6 = *(id *)(a1 + 48);
  dispatch_async(v2, block);
}

void __75__SPSecureLocationsManager_startMonitoringStewieStateWithBlock_completion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setStewieUpdateBlock:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setLastUpdatedStewieState:0];
  id v2 = [*(id *)(a1 + 32) proxy];
  [v2 startMonitoringStewieStateWithCompletion:*(void *)(a1 + 48)];
}

- (void)stopMonitoringStewieStateWithCompletion:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = _os_feature_enabled_impl();
  id v6 = LogCategory_SecureLocations();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      *(_DWORD *)buf = 138412290;
      id v12 = @"stewie:";
      _os_log_impl(&dword_1B2FD8000, v6, OS_LOG_TYPE_DEFAULT, "Framework API: %@ stopMonitoringState", buf, 0xCu);
    }

    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __68__SPSecureLocationsManager_stopMonitoringStewieStateWithCompletion___block_invoke;
    v9[3] = &unk_1E601B828;
    v9[4] = self;
    id v10 = v4;
    _os_activity_initiate(&dword_1B2FD8000, "SPSecureLocationsManager.stopMonitoringLiteLocationState", OS_ACTIVITY_FLAG_DEFAULT, v9);
  }
  else
  {
    if (v7)
    {
      *(_DWORD *)buf = 138412290;
      id v12 = @"stewie:";
      _os_log_impl(&dword_1B2FD8000, v6, OS_LOG_TYPE_DEFAULT, "%@ feature disabled", buf, 0xCu);
    }

    char v8 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"com.apple.findmy.SPSecureLocations.StewieErrorDomain" code:3 userInfo:0];
    (*((void (**)(id, void *))v4 + 2))(v4, v8);
  }
}

void __68__SPSecureLocationsManager_stopMonitoringStewieStateWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) queue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __68__SPSecureLocationsManager_stopMonitoringStewieStateWithCompletion___block_invoke_2;
  v4[3] = &unk_1E601B828;
  uint64_t v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  dispatch_async(v2, v4);
}

void __68__SPSecureLocationsManager_stopMonitoringStewieStateWithCompletion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setStewieUpdateBlock:0];
  id v2 = [*(id *)(a1 + 32) proxy];
  [v2 stopMonitoringStewieStateWithCompletion:*(void *)(a1 + 40)];
}

- (void)currentStewieStateWithCompletion:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = _os_feature_enabled_impl();
  id v6 = LogCategory_SecureLocations();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      *(_DWORD *)buf = 138412290;
      id v12 = @"stewie:";
      _os_log_impl(&dword_1B2FD8000, v6, OS_LOG_TYPE_DEFAULT, "Framework API: %@ currentStateWithCompletion", buf, 0xCu);
    }

    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __61__SPSecureLocationsManager_currentStewieStateWithCompletion___block_invoke;
    v9[3] = &unk_1E601B828;
    v9[4] = self;
    id v10 = v4;
    _os_activity_initiate(&dword_1B2FD8000, "SPSecureLocationsManager", OS_ACTIVITY_FLAG_DEFAULT, v9);
  }
  else
  {
    if (v7)
    {
      *(_DWORD *)buf = 138412290;
      id v12 = @"stewie:";
      _os_log_impl(&dword_1B2FD8000, v6, OS_LOG_TYPE_DEFAULT, "%@ feature disabled", buf, 0xCu);
    }

    char v8 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"com.apple.findmy.SPSecureLocations.StewieErrorDomain" code:3 userInfo:0];
    (*((void (**)(id, uint64_t, void *))v4 + 2))(v4, 7, v8);
  }
}

void __61__SPSecureLocationsManager_currentStewieStateWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) queue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __61__SPSecureLocationsManager_currentStewieStateWithCompletion___block_invoke_2;
  v4[3] = &unk_1E601B828;
  uint64_t v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  dispatch_async(v2, v4);
}

void __61__SPSecureLocationsManager_currentStewieStateWithCompletion___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) proxy];
  [v2 currentStewieStateWithCompletion:*(void *)(a1 + 40)];
}

- (void)stewiePublishStateWithCompletion:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = _os_feature_enabled_impl();
  id v6 = LogCategory_SecureLocations();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      *(_DWORD *)buf = 138412290;
      id v12 = @"stewie:";
      _os_log_impl(&dword_1B2FD8000, v6, OS_LOG_TYPE_DEFAULT, "Framework API: %@ publishStateWithCompletion ", buf, 0xCu);
    }

    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __61__SPSecureLocationsManager_stewiePublishStateWithCompletion___block_invoke;
    v9[3] = &unk_1E601B828;
    v9[4] = self;
    id v10 = v4;
    _os_activity_initiate(&dword_1B2FD8000, "SPSecureLocationsManager.liteLocationPublishState", OS_ACTIVITY_FLAG_DEFAULT, v9);
  }
  else
  {
    if (v7)
    {
      *(_DWORD *)buf = 138412290;
      id v12 = @"stewie:";
      _os_log_impl(&dword_1B2FD8000, v6, OS_LOG_TYPE_DEFAULT, "%@ feature disabled", buf, 0xCu);
    }

    char v8 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"com.apple.findmy.SPSecureLocations.StewieErrorDomain" code:3 userInfo:0];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v8);
  }
}

void __61__SPSecureLocationsManager_stewiePublishStateWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) queue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __61__SPSecureLocationsManager_stewiePublishStateWithCompletion___block_invoke_2;
  v4[3] = &unk_1E601B828;
  uint64_t v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  dispatch_async(v2, v4);
}

void __61__SPSecureLocationsManager_stewiePublishStateWithCompletion___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) proxy];
  [v2 stewiePublishStateWithCompletion:*(void *)(a1 + 40)];
}

- (void)triggerStewieProactiveNotification
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  char v3 = _os_feature_enabled_impl();
  id v4 = LogCategory_SecureLocations();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_DWORD *)buf = 138412290;
      char v8 = @"stewie:";
      _os_log_impl(&dword_1B2FD8000, v4, OS_LOG_TYPE_DEFAULT, "Framework API: %@ triggerStewieProactiveNotification ", buf, 0xCu);
    }

    activity_block[0] = MEMORY[0x1E4F143A8];
    activity_block[1] = 3221225472;
    activity_block[2] = __62__SPSecureLocationsManager_triggerStewieProactiveNotification__block_invoke;
    activity_block[3] = &unk_1E601B790;
    activity_void block[4] = self;
    _os_activity_initiate(&dword_1B2FD8000, "SPSecureLocationsManager.triggerStewieProactiveNotification", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
  }
  else
  {
    if (v5)
    {
      *(_DWORD *)buf = 138412290;
      char v8 = @"stewie:";
      _os_log_impl(&dword_1B2FD8000, v4, OS_LOG_TYPE_DEFAULT, "%@ feature disabled", buf, 0xCu);
    }
  }
}

void __62__SPSecureLocationsManager_triggerStewieProactiveNotification__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__SPSecureLocationsManager_triggerStewieProactiveNotification__block_invoke_2;
  block[3] = &unk_1E601B790;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(v2, block);
}

void __62__SPSecureLocationsManager_triggerStewieProactiveNotification__block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) proxy];
  [v1 triggerStewieProactiveNotification];
}

- (void)shareCurrentKeyWithId:(id)a3 idsHandles:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(SPSecureLocationsManager *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __72__SPSecureLocationsManager_shareCurrentKeyWithId_idsHandles_completion___block_invoke;
  v15[3] = &unk_1E601BBB0;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __72__SPSecureLocationsManager_shareCurrentKeyWithId_idsHandles_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) proxy];
  [v2 shareCurrentKeyWithId:*(void *)(a1 + 40) idsHandles:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

- (void)shareCurrentKeyWithId:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SPSecureLocationsManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__SPSecureLocationsManager_shareCurrentKeyWithId_completion___block_invoke;
  block[3] = &unk_1E601B878;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __61__SPSecureLocationsManager_shareCurrentKeyWithId_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) proxy];
  [v2 shareCurrentKeyWithId:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)performKeyRollWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SPSecureLocationsManager *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__SPSecureLocationsManager_performKeyRollWithCompletion___block_invoke;
  v7[3] = &unk_1E601B828;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __57__SPSecureLocationsManager_performKeyRollWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) proxy];
  [v2 performKeyRollWithCompletion:*(void *)(a1 + 40)];
}

- (void)isLocationPublishingDeviceWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SPSecureLocationsManager *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__SPSecureLocationsManager_isLocationPublishingDeviceWithCompletion___block_invoke;
  v7[3] = &unk_1E601B828;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __69__SPSecureLocationsManager_isLocationPublishingDeviceWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) proxy];
  [v2 isLocationPublishingDeviceWithCompletion:*(void *)(a1 + 40)];
}

- (void)fetchConfigFromServerWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SPSecureLocationsManager *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__SPSecureLocationsManager_fetchConfigFromServerWithCompletion___block_invoke;
  v7[3] = &unk_1E601B828;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __64__SPSecureLocationsManager_fetchConfigFromServerWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) proxy];
  [v2 fetchConfigFromServerWithCompletion:*(void *)(a1 + 40)];
}

- (void)simulateFeatureDisabled:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [(SPSecureLocationsManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__SPSecureLocationsManager_simulateFeatureDisabled_completion___block_invoke;
  block[3] = &unk_1E601BC78;
  BOOL v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

void __63__SPSecureLocationsManager_simulateFeatureDisabled_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) proxy];
  [v2 simulateFeatureDisabled:*(unsigned __int8 *)(a1 + 48) completion:*(void *)(a1 + 40)];
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (FMXPCServiceDescription)serviceDescription
{
  return self->_serviceDescription;
}

- (void)setServiceDescription:(id)a3
{
}

- (FMXPCSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (void)setProxy:(id)a3
{
}

- (id)locationUpdates
{
  return self->_locationUpdates;
}

- (void)setLocationUpdates:(id)a3
{
}

- (id)clearCacheUpdates
{
  return self->_clearCacheUpdates;
}

- (void)setClearCacheUpdates:(id)a3
{
}

- (id)stewieUpdateBlock
{
  return self->_stewieUpdateBlock;
}

- (void)setStewieUpdateBlock:(id)a3
{
}

- (int64_t)lastUpdatedStewieState
{
  return self->_lastUpdatedStewieState;
}

- (void)setLastUpdatedStewieState:(int64_t)a3
{
  self->_lastUpdatedStewieState = a3;
}

- (SPRetryCount)stewieRetryCount
{
  return self->_stewieRetryCount;
}

- (void)setStewieRetryCount:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stewieRetryCount, 0);
  objc_storeStrong(&self->_stewieUpdateBlock, 0);
  objc_storeStrong(&self->_clearCacheUpdates, 0);
  objc_storeStrong(&self->_locationUpdates, 0);
  objc_storeStrong((id *)&self->_proxy, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_serviceDescription, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

void __48__SPSecureLocationsManager_interruptionHandler___block_invoke_146_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 138412546;
  char v3 = @"stewie:";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_1B2FD8000, a2, OS_LOG_TYPE_ERROR, "SPSecureLocationsManager: %@ - Error re-subscribing litloc update %@", (uint8_t *)&v2, 0x16u);
}

void __65__SPSecureLocationsManager_unsubscribeForIds_context_completion___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  int v5 = 138412802;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_error_impl(&dword_1B2FD8000, log, OS_LOG_TYPE_ERROR, "UnsubscribeForIds %@ with context %@ failed with error %@", (uint8_t *)&v5, 0x20u);
}

@end