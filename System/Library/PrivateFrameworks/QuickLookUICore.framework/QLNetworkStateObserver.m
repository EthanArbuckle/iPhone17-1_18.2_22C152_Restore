@interface QLNetworkStateObserver
+ (BOOL)networkAccessShouldGoThroughCloudDocsDaemon;
+ (BOOL)usingRemoteNetworkObserver;
+ (id)sharedInstance;
- (BOOL)isConnected;
- (BOOL)isWifiCapable;
- (QLNetworkStateListener)remoteObserver;
- (QLNetworkStateObserver)init;
- (unint64_t)networkState;
- (void)_commonInit;
- (void)_setNetworkState:(unint64_t)a3;
- (void)_unregisterReachability;
- (void)_update;
- (void)_updateCompletionBlocks;
- (void)_updateNetworkActivityIndicator;
- (void)_updateNetworkStateWithFlags:(unsigned int)a3;
- (void)_updateNetworkStateWithNotifyToken:(int)a3;
- (void)_updateRemoteObserver;
- (void)airplaneModeChanged;
- (void)dealloc;
- (void)networkStateWithCompletionBlock:(id)a3;
- (void)popOperation;
- (void)pushOperation;
- (void)setNetworkState:(unint64_t)a3;
- (void)setRemoteObserver:(id)a3;
- (void)startObserving;
- (void)stopObserving;
- (void)updateState:(unint64_t)a3;
@end

@implementation QLNetworkStateObserver

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__QLNetworkStateObserver_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance__sharedInstance;
  return v2;
}

uint64_t __40__QLNetworkStateObserver_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance__sharedInstance = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x1F41817F8]();
}

- (QLNetworkStateObserver)init
{
  v5.receiver = self;
  v5.super_class = (Class)QLNetworkStateObserver;
  v2 = [(QLNetworkStateObserver *)&v5 init];
  v3 = v2;
  if (v2) {
    [(QLNetworkStateObserver *)v2 _commonInit];
  }
  return v3;
}

- (void)_commonInit
{
  v3 = (NSMutableArray *)objc_opt_new();
  completionBlocks = self->_completionBlocks;
  self->_completionBlocks = v3;

  self->_iCloudDriveReachabilityToken = -1;
  if (!+[QLNetworkStateObserver usingRemoteNetworkObserver])
  {
    objc_super v5 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.quicklook.networkwatcher", 0);
    queue = self->_queue;
    self->_queue = v5;

    v7 = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __37__QLNetworkStateObserver__commonInit__block_invoke;
    block[3] = &unk_1E6DD3DB8;
    block[4] = self;
    dispatch_sync(v7, block);
    [(QLNetworkStateObserver *)self startObserving];
  }
}

uint64_t __37__QLNetworkStateObserver__commonInit__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F4BE78]);
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 80);
  *(void *)(v3 + 80) = v2;

  objc_super v5 = *(void **)(*(void *)(a1 + 32) + 80);
  return objc_msgSend(v5, "setDelegate:");
}

- (void)setRemoteObserver:(id)a3
{
  objc_storeStrong((id *)&self->_remoteObserver, a3);
  [(QLNetworkStateObserver *)self _updateRemoteObserver];
}

- (void)pushOperation
{
  obj = self;
  objc_sync_enter(obj);
  ++obj->_stack;
  [(QLNetworkStateObserver *)obj _updateNetworkActivityIndicator];
  objc_sync_exit(obj);
}

- (void)popOperation
{
  obj = self;
  objc_sync_enter(obj);
  --obj->_stack;
  [(QLNetworkStateObserver *)obj _updateNetworkActivityIndicator];
  objc_sync_exit(obj);
}

- (void)_updateNetworkStateWithNotifyToken:(int)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t state64 = 0;
  uint32_t state = notify_get_state(a3, &state64);
  if (state)
  {
    uint32_t v5 = state;
    v6 = (NSObject **)MEMORY[0x1E4F945F0];
    v7 = *MEMORY[0x1E4F945F0];
    if (!*MEMORY[0x1E4F945F0])
    {
      QLSInitLogging();
      v7 = *v6;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      uint32_t v10 = v5;
      _os_log_impl(&dword_1E2805000, v7, OS_LOG_TYPE_DEFAULT, "Could not get state of the CloudDocs availability notification: error %u #Downloading", buf, 8u);
    }
    [(QLNetworkStateObserver *)self _setNetworkState:0];
  }
  else
  {
    [(QLNetworkStateObserver *)self _updateNetworkStateWithFlags:state64];
  }
}

- (void)startObserving
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __40__QLNetworkStateObserver_startObserving__block_invoke;
  v2[3] = &unk_1E6DD3DB8;
  v2[4] = self;
  QLRunInBackgroundThread(v2);
}

void __40__QLNetworkStateObserver_startObserving__block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  int v3 = [(id)objc_opt_class() networkAccessShouldGoThroughCloudDocsDaemon];
  uint64_t v4 = *(void *)(a1 + 32);
  if (!v3)
  {
    if (*(void *)(v4 + 64)) {
      goto LABEL_25;
    }
    *(void *)(v4 + 32) = v4;
    *(void *)(*(void *)(a1 + 32) + 64) = SCNetworkReachabilityCreateWithName(0, "apple.com");
    uint64_t v13 = *(void *)(a1 + 32);
    v14 = *(const __SCNetworkReachability **)(v13 + 64);
    if (v14)
    {
      if (SCNetworkReachabilitySetCallback(v14, (SCNetworkReachabilityCallBack)_reachabilityDidChange, (SCNetworkReachabilityContext *)(v13 + 24))&& SCNetworkReachabilitySetDispatchQueue(*(SCNetworkReachabilityRef *)(*(void *)(a1 + 32) + 64), *(dispatch_queue_t *)(*(void *)(a1 + 32) + 16)))
      {
        goto LABEL_25;
      }
      v15 = (NSObject **)MEMORY[0x1E4F945F0];
      v16 = *MEMORY[0x1E4F945F0];
      if (!*MEMORY[0x1E4F945F0])
      {
        QLSInitLogging();
        v16 = *v15;
      }
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
LABEL_22:
        *(_DWORD *)(*(void *)(a1 + 32) + 76) = 0;
        [*(id *)(a1 + 32) _setNetworkState:2];
        goto LABEL_25;
      }
      LOWORD(location[0]) = 0;
      v17 = "Couldn't set reachability callback or queue #Downloading";
      v18 = v16;
      os_log_type_t v19 = OS_LOG_TYPE_ERROR;
    }
    else
    {
      v20 = (NSObject **)MEMORY[0x1E4F945F0];
      v21 = *MEMORY[0x1E4F945F0];
      if (!*MEMORY[0x1E4F945F0])
      {
        QLSInitLogging();
        v21 = *v20;
      }
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_22;
      }
      LOWORD(location[0]) = 0;
      v17 = "Couldn't create reachability object #Downloading";
      v18 = v21;
      os_log_type_t v19 = OS_LOG_TYPE_DEFAULT;
    }
    _os_log_impl(&dword_1E2805000, v18, v19, v17, (uint8_t *)location, 2u);
    goto LABEL_22;
  }
  if ((*(_DWORD *)(v4 + 72) & 0x80000000) != 0)
  {
    objc_initWeak(location, (id)v4);
    BRNotificationNameForServerAvailabilityChanges_delayInitStub(v5);
    id v6 = objc_claimAutoreleasedReturnValue();
    v7 = (const char *)[v6 UTF8String];
    uint64_t v8 = *(void *)(a1 + 32);
    v9 = *(NSObject **)(v8 + 16);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __40__QLNetworkStateObserver_startObserving__block_invoke_2;
    handler[3] = &unk_1E6DD3DE0;
    objc_copyWeak(&v23, location);
    uint32_t v10 = notify_register_dispatch(v7, (int *)(v8 + 72), v9, handler);

    if (v10)
    {
      uint64_t v11 = (NSObject **)MEMORY[0x1E4F945F0];
      v12 = *MEMORY[0x1E4F945F0];
      if (!*MEMORY[0x1E4F945F0])
      {
        QLSInitLogging();
        v12 = *v11;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        uint32_t v26 = v10;
        _os_log_impl(&dword_1E2805000, v12, OS_LOG_TYPE_DEFAULT, "Could not register for the CloudDocs availability notification: error %u #Downloading", buf, 8u);
      }
      [*(id *)(a1 + 32) _setNetworkState:0];
    }
    else
    {
      [*(id *)(a1 + 32) _updateNetworkStateWithNotifyToken:*(unsigned int *)(*(void *)(a1 + 32) + 72)];
    }
    objc_destroyWeak(&v23);
    objc_destroyWeak(location);
  }
LABEL_25:
  objc_sync_exit(v2);
}

void __40__QLNetworkStateObserver_startObserving__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateNetworkStateWithNotifyToken:a2];
}

- (void)stopObserving
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __39__QLNetworkStateObserver_stopObserving__block_invoke;
  v2[3] = &unk_1E6DD3DB8;
  v2[4] = self;
  QLRunInBackgroundThread(v2);
}

void __39__QLNetworkStateObserver_stopObserving__block_invoke(uint64_t a1)
{
  id obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  [*(id *)(a1 + 32) _unregisterReachability];
  int v2 = *(_DWORD *)(*(void *)(a1 + 32) + 72);
  if (v2 >= 1)
  {
    notify_cancel(v2);
    *(_DWORD *)(*(void *)(a1 + 32) + 72) = -1;
  }
  objc_sync_exit(obj);
}

- (void)_unregisterReachability
{
  reachability = self->_reachability;
  if (reachability)
  {
    SCNetworkReachabilitySetCallback(reachability, 0, 0);
    SCNetworkReachabilitySetDispatchQueue(self->_reachability, 0);
    CFRelease(self->_reachability);
    self->_reachability = 0;
    self->_reachabilityFlags = 0;
    self->_networkState = 0;
  }
}

- (void)dealloc
{
  [(QLNetworkStateObserver *)self _unregisterReachability];
  v3.receiver = self;
  v3.super_class = (Class)QLNetworkStateObserver;
  [(QLNetworkStateObserver *)&v3 dealloc];
}

- (BOOL)isConnected
{
  return [(QLNetworkStateObserver *)self networkState] == 4
      || [(QLNetworkStateObserver *)self networkState] == 3;
}

- (BOOL)isWifiCapable
{
  if (MGGetBoolAnswer()) {
    return 1;
  }
  return MGGetBoolAnswer();
}

- (void)_update
{
  SCNetworkReachabilityFlags flags = 0;
  if (SCNetworkReachabilityGetFlags(self->_reachability, &flags)) {
    [(QLNetworkStateObserver *)self _updateNetworkStateWithFlags:flags];
  }
}

- (void)_updateNetworkActivityIndicator
{
  id v3 = [MEMORY[0x1E4F42738] sharedApplication];
  [v3 setNetworkActivityIndicatorVisible:self->_stack != 0];
}

- (void)_setNetworkState:(unint64_t)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (self->_networkState != a3)
  {
    self->_unint64_t networkState = a3;
    uint64_t v4 = (NSObject **)MEMORY[0x1E4F945F0];
    double v5 = *MEMORY[0x1E4F945F0];
    if (!*MEMORY[0x1E4F945F0])
    {
      QLSInitLogging();
      double v5 = *v4;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      unint64_t networkState = self->_networkState;
      if (networkState > 4) {
        v7 = @"Undefined QLNetworkState";
      }
      else {
        v7 = off_1E6DD3E28[networkState];
      }
      *(_DWORD *)v9 = 138412290;
      *(void *)&v9[4] = v7;
      uint64_t v8 = v5;
      _os_log_impl(&dword_1E2805000, v8, OS_LOG_TYPE_INFO, "Network state changed to %@ #Downloading", v9, 0xCu);
    }
    [(QLNetworkStateObserver *)self _updateRemoteObserver];
  }
}

- (void)_updateNetworkStateWithFlags:(unsigned int)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __55__QLNetworkStateObserver__updateNetworkStateWithFlags___block_invoke;
  v4[3] = &unk_1E6DD3E08;
  v4[4] = self;
  unsigned int v5 = a3;
  dispatch_async(queue, v4);
}

uint64_t __55__QLNetworkStateObserver__updateNetworkStateWithFlags___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  *(_DWORD *)(*(void *)(a1 + 32) + 76) = *(_DWORD *)(a1 + 40);
  int v2 = (NSObject **)MEMORY[0x1E4F945F0];
  id v3 = *MEMORY[0x1E4F945F0];
  if (!*MEMORY[0x1E4F945F0])
  {
    QLSInitLogging();
    id v3 = *v2;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = *(_DWORD *)(a1 + 40);
    v9[0] = 67109120;
    v9[1] = v4;
    _os_log_impl(&dword_1E2805000, v3, OS_LOG_TYPE_INFO, "Network reachability flags changed to 0x%x #Downloading", (uint8_t *)v9, 8u);
  }
  int v5 = *(_DWORD *)(a1 + 40);
  if ((v5 & 2) != 0)
  {
    v7 = *(void **)(a1 + 32);
    if ((v5 & 0x40000) != 0) {
      uint64_t v6 = 4;
    }
    else {
      uint64_t v6 = 3;
    }
  }
  else
  {
    [*(id *)(*(void *)(a1 + 32) + 80) refresh];
    if ([*(id *)(*(void *)(a1 + 32) + 80) airplaneMode]) {
      uint64_t v6 = 1;
    }
    else {
      uint64_t v6 = 2;
    }
    v7 = *(void **)(a1 + 32);
  }
  return [v7 _setNetworkState:v6];
}

- (void)setNetworkState:(unint64_t)a3
{
  self->_unint64_t networkState = a3;
  if (a3) {
    [(QLNetworkStateObserver *)self _updateCompletionBlocks];
  }
}

- (void)networkStateWithCompletionBlock:(id)a3
{
  int v4 = (void (**)(id, unint64_t))a3;
  if (v4)
  {
    uint64_t v8 = v4;
    if ([(QLNetworkStateObserver *)self networkState])
    {
      v8[2](v8, self->_networkState);
    }
    else
    {
      int v5 = self->_completionBlocks;
      objc_sync_enter(v5);
      completionBlocks = self->_completionBlocks;
      v7 = (void *)MEMORY[0x1E4E5A320](v8);
      [(NSMutableArray *)completionBlocks addObject:v7];

      objc_sync_exit(v5);
    }
    int v4 = v8;
  }
}

- (void)_updateCompletionBlocks
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = self->_completionBlocks;
  objc_sync_enter(v3);
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  int v4 = self->_completionBlocks;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        (*(void (**)(void, unint64_t))(*(void *)(*((void *)&v8 + 1) + 8 * v7) + 16))(*(void *)(*((void *)&v8 + 1) + 8 * v7), [(QLNetworkStateObserver *)self networkState]);
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [(NSMutableArray *)self->_completionBlocks removeAllObjects];
  objc_sync_exit(v3);
}

- (void)airplaneModeChanged
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__QLNetworkStateObserver_airplaneModeChanged__block_invoke;
  block[3] = &unk_1E6DD3DB8;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __45__QLNetworkStateObserver_airplaneModeChanged__block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(*(void *)(a1 + 32) + 80) airplaneMode];
  id v3 = *(void **)(a1 + 32);
  if (v2)
  {
    return [v3 _setNetworkState:1];
  }
  else
  {
    return [v3 _update];
  }
}

- (void)updateState:(unint64_t)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (NSObject **)MEMORY[0x1E4F945F0];
  uint64_t v6 = *MEMORY[0x1E4F945F0];
  if (!*MEMORY[0x1E4F945F0])
  {
    QLSInitLogging();
    uint64_t v6 = *v5;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    if (a3 > 4) {
      uint64_t v7 = @"Undefined QLNetworkState";
    }
    else {
      uint64_t v7 = off_1E6DD3E28[a3];
    }
    *(_DWORD *)long long v9 = 138412290;
    *(void *)&v9[4] = v7;
    long long v8 = v6;
    _os_log_impl(&dword_1E2805000, v8, OS_LOG_TYPE_INFO, "Network state update from host %@ #Downloading", v9, 0xCu);
  }
  -[QLNetworkStateObserver _setNetworkState:](self, "_setNetworkState:", a3, *(_OWORD *)v9);
}

+ (BOOL)usingRemoteNetworkObserver
{
  int v2 = [MEMORY[0x1E4F28B50] mainBundle];
  id v3 = [v2 bundleIdentifier];

  int v4 = _os_feature_enabled_impl();
  uint64_t v5 = &kQuickLookUIExtensionIdentifier;
  if (!v4) {
    uint64_t v5 = kQLPreviewExtensionIdentifier;
  }
  char v6 = [v3 isEqualToString:*v5];

  return v6;
}

+ (BOOL)networkAccessShouldGoThroughCloudDocsDaemon
{
  int v2 = [MEMORY[0x1E4F28B50] mainBundle];
  id v3 = [v2 bundleIdentifier];
  char v4 = [v3 isEqualToString:@"com.apple.iCloudDriveApp"];

  return v4;
}

- (void)_updateRemoteObserver
{
  remoteObserver = self->_remoteObserver;
  unint64_t v3 = [(QLNetworkStateObserver *)self networkState];
  [(QLNetworkStateListener *)remoteObserver updateState:v3];
}

- (unint64_t)networkState
{
  return self->_networkState;
}

- (QLNetworkStateListener)remoteObserver
{
  return self->_remoteObserver;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteObserver, 0);
  objc_storeStrong((id *)&self->_completionBlocks, 0);
  objc_storeStrong((id *)&self->_radiosPreferences, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end