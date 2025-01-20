@interface NTKCompanionAppLibrary
+ (id)sharedAppLibrary;
- (BOOL)appConduitLoaded;
- (BOOL)isRemovedSystemApp:(id)a3;
- (BOOL)isRestrictedSystemApp:(id)a3;
- (CLKDevice)device;
- (NSArray)allApps;
- (NSArray)firstPartyApps;
- (NSArray)thirdPartyApps;
- (NSArray)watchSystemApps;
- (NSHashTable)changeObservers;
- (NSIndexSet)disabledComplicationTypesCache;
- (NSMutableArray)prewarmCallbacks;
- (NSRecursiveLock)internalLock;
- (NSSet)installedSystemApplicationIdentifiers;
- (NTKCompanionAppLibrary)init;
- (OS_dispatch_queue)appProcessingQueue;
- (OS_dispatch_queue)observerCallbackQueue;
- (OS_dispatch_queue)updateProcessingQueue;
- (id)disabledComplicationTypes;
- (void)_load;
- (void)_loadApps;
- (void)_loadWatchApps;
- (void)_notifyAppAdded:(id)a3;
- (void)_notifyAppIconUpdated:(id)a3;
- (void)_notifyAppRemoved:(id)a3;
- (void)_notifyAppUpdated:(id)a3;
- (void)_queue_loadApps;
- (void)addObserver:(id)a3;
- (void)applicationDatabaseResyncedForDeviceWithPairingID:(id)a3;
- (void)applicationsInstalled:(id)a3 onDeviceWithPairingID:(id)a4;
- (void)applicationsUninstalled:(id)a3 onDeviceWithPairingID:(id)a4;
- (void)applicationsUpdated:(id)a3 onDeviceWithPairingID:(id)a4;
- (void)dealloc;
- (void)prewarmCompanionDaemonWithCompletion:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setAllApps:(id)a3;
- (void)setAppConduitLoaded:(BOOL)a3;
- (void)setAppProcessingQueue:(id)a3;
- (void)setChangeObservers:(id)a3;
- (void)setDevice:(id)a3;
- (void)setDisabledComplicationTypesCache:(id)a3;
- (void)setFirstPartyApps:(id)a3;
- (void)setInstalledSystemApplicationIdentifiers:(id)a3;
- (void)setInternalLock:(id)a3;
- (void)setObserverCallbackQueue:(id)a3;
- (void)setPrewarmCallbacks:(id)a3;
- (void)setThirdPartyApps:(id)a3;
- (void)setUpdateProcessingQueue:(id)a3;
- (void)setWatchSystemApps:(id)a3;
@end

@implementation NTKCompanionAppLibrary

+ (id)sharedAppLibrary
{
  if (sharedAppLibrary_onceToken != -1) {
    dispatch_once(&sharedAppLibrary_onceToken, &__block_literal_global_71);
  }
  v2 = (void *)sharedAppLibrary_appLibrary;

  return v2;
}

void __42__NTKCompanionAppLibrary_sharedAppLibrary__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)sharedAppLibrary_appLibrary;
  sharedAppLibrary_appLibrary = v0;
}

- (NTKCompanionAppLibrary)init
{
  v14.receiver = self;
  v14.super_class = (Class)NTKCompanionAppLibrary;
  v2 = [(NTKCompanionAppLibrary *)&v14 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F28FD0]);
    [(NTKCompanionAppLibrary *)v2 setInternalLock:v3];

    v4 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, -1);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.ntk.companionapplibrary.updates", v4);
    [(NTKCompanionAppLibrary *)v2 setUpdateProcessingQueue:v5];

    dispatch_queue_t v6 = dispatch_queue_create("com.apple.ntk.companionapplibrary.observercallback", v4);
    [(NTKCompanionAppLibrary *)v2 setObserverCallbackQueue:v6];

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.ntk.companionapplibrary.appconduit", v4);
    [(NTKCompanionAppLibrary *)v2 setAppProcessingQueue:v7];

    v8 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
    [(NTKCompanionAppLibrary *)v2 setChangeObservers:v8];

    v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 addObserver:v2 selector:sel__activeDeviceChanged name:*MEMORY[0x1E4F19620] object:0];

    [(NTKCompanionAppLibrary *)v2 _load];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_handleAppConduitApplicationsChangedNotification_0, (CFStringRef)*MEMORY[0x1E4F4AC38], v2, (CFNotificationSuspensionBehavior)0);
    v11 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    [v11 addObserver:v2];

    v12 = [MEMORY[0x1E4F4AC68] sharedDeviceConnection];
    [v12 addObserver:v2];
  }
  return v2;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F19620] object:0];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x1E4F4AC38], self);
  dispatch_queue_t v5 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v5 removeObserver:self];

  dispatch_queue_t v6 = [MEMORY[0x1E4F4AC68] sharedDeviceConnection];
  [v6 removeObserver:self];

  v7.receiver = self;
  v7.super_class = (Class)NTKCompanionAppLibrary;
  [(NTKCompanionAppLibrary *)&v7 dealloc];
}

- (NSArray)thirdPartyApps
{
  [(NSRecursiveLock *)self->_internalLock lock];
  id v3 = self->_thirdPartyApps;
  [(NSRecursiveLock *)self->_internalLock unlock];

  return v3;
}

- (id)disabledComplicationTypes
{
  id v3 = [(NTKCompanionAppLibrary *)self device];
  [(NSRecursiveLock *)self->_internalLock lock];
  v4 = self->_disabledComplicationTypesCache;
  if (!v4)
  {
    _NTKDisabledComplicationTypesForDevice(v3);
    v4 = (NSIndexSet *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v5 = (NSIndexSet *)[(NSIndexSet *)v4 copy];
    disabledComplicationTypesCache = self->_disabledComplicationTypesCache;
    self->_disabledComplicationTypesCache = v5;
  }
  [(NSRecursiveLock *)self->_internalLock unlock];

  return v4;
}

- (void)prewarmCompanionDaemonWithCompletion:(id)a3
{
  v4 = (void (**)(void))a3;
  if (v4)
  {
    v13 = v4;
    dispatch_queue_t v5 = [(NTKCompanionAppLibrary *)self device];
    dispatch_queue_t v6 = [v5 nrDevice];

    if (v6)
    {
      [(NSRecursiveLock *)self->_internalLock lock];
      objc_super v7 = self->_allApps;
      prewarmCallbacks = self->_prewarmCallbacks;
      if (!prewarmCallbacks)
      {
        v9 = [MEMORY[0x1E4F1CA48] array];
        v10 = self->_prewarmCallbacks;
        self->_prewarmCallbacks = v9;

        prewarmCallbacks = self->_prewarmCallbacks;
      }
      v11 = (void *)[v13 copy];
      v12 = _Block_copy(v11);
      [(NSMutableArray *)prewarmCallbacks addObject:v12];

      [(NSRecursiveLock *)self->_internalLock unlock];
      if (v7) {
        v13[2]();
      }
    }
    else
    {
      v13[2]();
    }
    v4 = v13;
  }
}

- (void)_load
{
  id v3 = [MEMORY[0x1E4F19A30] currentDevice];
  [(NTKCompanionAppLibrary *)self setDevice:v3];

  [(NTKCompanionAppLibrary *)self _loadApps];
}

- (BOOL)isRestrictedSystemApp:(id)a3
{
  id v4 = a3;
  if ([(CLKDevice *)self->_device isRunningGraceOrLater])
  {
    char v5 = 0;
  }
  else
  {
    dispatch_queue_t v6 = +[NTKSystemAppStateCache sharedInstance];
    char v5 = [v6 isRestrictedSystemApp:v4];
  }
  return v5;
}

- (BOOL)isRemovedSystemApp:(id)a3
{
  id v4 = a3;
  if ([(CLKDevice *)self->_device isRunningGraceOrLater])
  {
    device = self->_device;
    if (!device
      || ([(CLKDevice *)device nrDevice],
          dispatch_queue_t v6 = objc_claimAutoreleasedReturnValue(),
          v6,
          !v6))
    {
      LOBYTE(v9) = 0;
      goto LABEL_9;
    }
    [(NSRecursiveLock *)self->_internalLock lock];
    objc_super v7 = self->_installedSystemApplicationIdentifiers;
    BOOL appConduitLoaded = self->_appConduitLoaded;
    [(NSRecursiveLock *)self->_internalLock unlock];
    if (appConduitLoaded) {
      int v9 = ![(NSSet *)v7 containsObject:v4];
    }
    else {
      LOBYTE(v9) = 0;
    }
  }
  else
  {
    objc_super v7 = +[NTKSystemAppStateCache sharedInstance];
    LOBYTE(v9) = [(NSSet *)v7 isRemovedSystemApp:v4];
  }

LABEL_9:
  return v9;
}

- (void)applicationsInstalled:(id)a3 onDeviceWithPairingID:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  device = self->_device;
  id v8 = a4;
  int v9 = [(CLKDevice *)device nrDevice];
  v10 = [v9 pairingID];
  int v11 = [v10 isEqual:v8];

  if (v11) {
    [(NTKCompanionAppLibrary *)self _loadApps];
  }
  v12 = _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = [v6 description];
    int v14 = 138412290;
    v15 = v13;
    _os_log_impl(&dword_1BC5A9000, v12, OS_LOG_TYPE_DEFAULT, "NTKCompanionAppLibrary: ACXDeviceConnnectionDelegate: Received installed applications: %@", (uint8_t *)&v14, 0xCu);
  }
}

- (void)applicationsUpdated:(id)a3 onDeviceWithPairingID:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  device = self->_device;
  id v8 = a4;
  int v9 = [(CLKDevice *)device nrDevice];
  v10 = [v9 pairingID];
  int v11 = [v10 isEqual:v8];

  if (v11) {
    [(NTKCompanionAppLibrary *)self _loadApps];
  }
  v12 = _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = [v6 description];
    int v14 = 138412290;
    v15 = v13;
    _os_log_impl(&dword_1BC5A9000, v12, OS_LOG_TYPE_DEFAULT, "NTKCompanionAppLibrary: ACXDeviceConnnectionDelegate: Received updated applications: %@", (uint8_t *)&v14, 0xCu);
  }
}

- (void)applicationsUninstalled:(id)a3 onDeviceWithPairingID:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  device = self->_device;
  id v8 = a4;
  int v9 = [(CLKDevice *)device nrDevice];
  v10 = [v9 pairingID];
  int v11 = [v10 isEqual:v8];

  if (v11) {
    [(NTKCompanionAppLibrary *)self _loadApps];
  }
  v12 = _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = [v6 description];
    int v14 = 138412290;
    v15 = v13;
    _os_log_impl(&dword_1BC5A9000, v12, OS_LOG_TYPE_DEFAULT, "NTKCompanionAppLibrary: ACXDeviceConnnectionDelegate: Received uninstalled applications: %@", (uint8_t *)&v14, 0xCu);
  }
}

- (void)applicationDatabaseResyncedForDeviceWithPairingID:(id)a3
{
  device = self->_device;
  id v5 = a3;
  id v6 = [(CLKDevice *)device nrDevice];
  objc_super v7 = [v6 pairingID];
  int v8 = [v7 isEqual:v5];

  if (v8) {
    [(NTKCompanionAppLibrary *)self _loadApps];
  }
  int v9 = _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1BC5A9000, v9, OS_LOG_TYPE_DEFAULT, "NTKCompanionAppLibrary: ACXDeviceConnnectionDelegate: Application database did resync", v10, 2u);
  }
}

- (void)addObserver:(id)a3
{
  internalLock = self->_internalLock;
  id v5 = a3;
  [(NSRecursiveLock *)internalLock lock];
  [(NSHashTable *)self->_changeObservers addObject:v5];

  id v6 = self->_internalLock;

  [(NSRecursiveLock *)v6 unlock];
}

- (void)removeObserver:(id)a3
{
  internalLock = self->_internalLock;
  id v5 = a3;
  [(NSRecursiveLock *)internalLock lock];
  [(NSHashTable *)self->_changeObservers removeObject:v5];

  id v6 = self->_internalLock;

  [(NSRecursiveLock *)v6 unlock];
}

- (void)_notifyAppAdded:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(NSRecursiveLock *)self->_internalLock lock];
  id v5 = (void *)[(NSHashTable *)self->_changeObservers copy];
  [(NSRecursiveLock *)self->_internalLock unlock];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * v10);
        if (objc_opt_respondsToSelector())
        {
          observerCallbackQueue = self->_observerCallbackQueue;
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __42__NTKCompanionAppLibrary__notifyAppAdded___block_invoke;
          block[3] = &unk_1E62C04F0;
          block[4] = v11;
          block[5] = self;
          id v14 = v4;
          dispatch_async(observerCallbackQueue, block);
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
}

uint64_t __42__NTKCompanionAppLibrary__notifyAppAdded___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) appLibrary:*(void *)(a1 + 40) didAddApp:*(void *)(a1 + 48)];
}

- (void)_notifyAppUpdated:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(NSRecursiveLock *)self->_internalLock lock];
  id v5 = (void *)[(NSHashTable *)self->_changeObservers copy];
  [(NSRecursiveLock *)self->_internalLock unlock];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * v10);
        if (objc_opt_respondsToSelector())
        {
          observerCallbackQueue = self->_observerCallbackQueue;
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __44__NTKCompanionAppLibrary__notifyAppUpdated___block_invoke;
          block[3] = &unk_1E62C04F0;
          block[4] = v11;
          block[5] = self;
          id v14 = v4;
          dispatch_async(observerCallbackQueue, block);
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
}

uint64_t __44__NTKCompanionAppLibrary__notifyAppUpdated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) appLibrary:*(void *)(a1 + 40) didUpdateApp:*(void *)(a1 + 48)];
}

- (void)_notifyAppRemoved:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(NSRecursiveLock *)self->_internalLock lock];
  id v5 = (void *)[(NSHashTable *)self->_changeObservers copy];
  [(NSRecursiveLock *)self->_internalLock unlock];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * v10);
        if (objc_opt_respondsToSelector())
        {
          observerCallbackQueue = self->_observerCallbackQueue;
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __44__NTKCompanionAppLibrary__notifyAppRemoved___block_invoke;
          block[3] = &unk_1E62C04F0;
          block[4] = v11;
          block[5] = self;
          id v14 = v4;
          dispatch_async(observerCallbackQueue, block);
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
}

uint64_t __44__NTKCompanionAppLibrary__notifyAppRemoved___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) appLibrary:*(void *)(a1 + 40) didRemoveApp:*(void *)(a1 + 48)];
}

- (void)_notifyAppIconUpdated:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(NSRecursiveLock *)self->_internalLock lock];
  id v5 = (void *)[(NSHashTable *)self->_changeObservers copy];
  [(NSRecursiveLock *)self->_internalLock unlock];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * v10);
        if (objc_opt_respondsToSelector())
        {
          observerCallbackQueue = self->_observerCallbackQueue;
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __48__NTKCompanionAppLibrary__notifyAppIconUpdated___block_invoke;
          block[3] = &unk_1E62C04F0;
          block[4] = v11;
          block[5] = self;
          id v14 = v4;
          dispatch_async(observerCallbackQueue, block);
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
}

uint64_t __48__NTKCompanionAppLibrary__notifyAppIconUpdated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) appLibrary:*(void *)(a1 + 40) didUpdateAppIcon:*(void *)(a1 + 48)];
}

- (void)_loadApps
{
  updateProcessingQueue = self->_updateProcessingQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__NTKCompanionAppLibrary__loadApps__block_invoke;
  block[3] = &unk_1E62BFF20;
  block[4] = self;
  dispatch_async(updateProcessingQueue, block);
}

uint64_t __35__NTKCompanionAppLibrary__loadApps__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_loadApps");
}

- (void)_loadWatchApps
{
  id v3 = [(CLKDevice *)self->_device nrDevice];
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F1CA80] set];
    id v5 = [MEMORY[0x1E4F1CA48] array];
    id v6 = [MEMORY[0x1E4F1CA48] array];
    int v7 = [(CLKDevice *)self->_device isRunningGraceOrLater];
    dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __40__NTKCompanionAppLibrary__loadWatchApps__block_invoke_2;
    aBlock[3] = &unk_1E62C44A0;
    aBlock[4] = self;
    id v23 = v5;
    id v30 = v23;
    char v35 = v7;
    id v9 = v6;
    id v31 = v9;
    id v10 = v4;
    id v32 = v10;
    uint64_t v11 = v8;
    v33 = v11;
    id v12 = v3;
    id v34 = v12;
    v13 = _Block_copy(aBlock);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __40__NTKCompanionAppLibrary__loadWatchApps__block_invoke_37;
    v27[3] = &unk_1E62C44C8;
    v27[4] = self;
    id v14 = v13;
    id v28 = v14;
    long long v15 = _Block_copy(v27);
    [(NSRecursiveLock *)self->_internalLock lock];
    self->_BOOL appConduitLoaded = 0;
    disabledComplicationTypesCache = self->_disabledComplicationTypesCache;
    self->_disabledComplicationTypesCache = 0;

    [(NSRecursiveLock *)self->_internalLock unlock];
    long long v17 = _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v18)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BC5A9000, v17, OS_LOG_TYPE_DEFAULT, "Loading apps on watch…", buf, 2u);
      }

      v19 = objc_msgSend(MEMORY[0x1E4F4AC68], "sharedDeviceConnection", v23);
      [v19 enumerateInstalledApplicationsOnPairedDevice:v12 withBlock:v15];

      dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
      uint64_t v20 = _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      *(_WORD *)buf = 0;
      v21 = "Apps on watch loaded.";
    }
    else
    {
      if (v18)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BC5A9000, v17, OS_LOG_TYPE_DEFAULT, "Loading possible 3rd party apps from phone…", buf, 2u);
      }

      v22 = objc_msgSend(MEMORY[0x1E4F4AC68], "sharedDeviceConnection", v23);
      [v22 enumerateLocallyAvailableApplicationsForPairedDevice:v12 options:3 withBlock:v15];

      dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
      uint64_t v20 = _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      *(_WORD *)buf = 0;
      v21 = "Possible 3rd party apps on watch loaded.";
    }
    _os_log_impl(&dword_1BC5A9000, v20, OS_LOG_TYPE_DEFAULT, v21, buf, 2u);
LABEL_13:

    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __40__NTKCompanionAppLibrary__loadWatchApps__block_invoke_40;
    v25[3] = &unk_1E62BFF20;
    v25[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], v25);

    goto LABEL_14;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__NTKCompanionAppLibrary__loadWatchApps__block_invoke;
  block[3] = &unk_1E62BFF20;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
LABEL_14:
}

void __40__NTKCompanionAppLibrary__loadWatchApps__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"NTKSystemAppStateChangedNotification" object:*(void *)(a1 + 32)];
}

void __40__NTKCompanionAppLibrary__loadWatchApps__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    int v7 = [v5 bundleIdentifier];
    if ([*(id *)(a1 + 56) containsObject:v7])
    {
      dispatch_semaphore_t v8 = _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v54 = v7;
        _os_log_impl(&dword_1BC5A9000, v8, OS_LOG_TYPE_DEFAULT, "Already added app with bundleID: %@", buf, 0xCu);
      }
      goto LABEL_41;
    }
    dispatch_semaphore_t v8 = [v5 companionAppBundleID];
    if ([v8 length])
    {
      uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v8 allowPlaceholder:1 error:0];
      id v12 = [v11 applicationState];
      int v13 = [v12 isRestricted];

      if (v13)
      {
        id v14 = _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v54 = v7;
          __int16 v55 = 2112;
          v56 = v8;
          _os_log_impl(&dword_1BC5A9000, v14, OS_LOG_TYPE_DEFAULT, "App is restricted with bundleID: %@ - %@ on companion", buf, 0x16u);
        }

        goto LABEL_40;
      }
    }
    uint64_t v11 = +[NTKCompanion1stPartyApp appForBundleIdentifier:v7];
    if (v11)
    {
      v29 = _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v54 = v7;
        _os_log_impl(&dword_1BC5A9000, v29, OS_LOG_TYPE_DEFAULT, "1st party app with bundleID: %@", buf, 0xCu);
      }

      [*(id *)(a1 + 56) addObject:v7];
      [*(id *)(a1 + 48) addObject:v11];
      goto LABEL_40;
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __40__NTKCompanionAppLibrary__loadWatchApps__block_invoke_29;
    aBlock[3] = &unk_1E62C4478;
    aBlock[4] = *(void *)(a1 + 32);
    id v30 = v7;
    v50 = v30;
    id v51 = *(id *)(a1 + 40);
    id v52 = *(id *)(a1 + 56);
    id v31 = (uint64_t (**)(void *, id))_Block_copy(aBlock);
    if (*(unsigned char *)(a1 + 80))
    {
      id v32 = [v5 complicationPrincipalClass];

      if (v32)
      {
        v33 = _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v54 = "-[NTKCompanionAppLibrary _loadWatchApps]_block_invoke_2";
          id v34 = "%s - processRemoteApplication non-nil principal class";
LABEL_37:
          _os_log_impl(&dword_1BC5A9000, v33, OS_LOG_TYPE_DEFAULT, v34, buf, 0xCu);
          goto LABEL_38;
        }
        goto LABEL_38;
      }
      v39 = +[NTKBundleComplicationManager sharedManager];
      int v40 = [v39 bundleComplicationExistsForAppBundleIdentifier:v30];

      if (v40)
      {
        v33 = _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v54 = "-[NTKCompanionAppLibrary _loadWatchApps]_block_invoke";
          id v34 = "%s - processRemoteApplication bundleComplicationExistsForAppBundleIdentifier";
          goto LABEL_37;
        }
LABEL_38:

        id v44 = (id)v31[2](v31, v5);
        goto LABEL_39;
      }
      v41 = [*(id *)(a1 + 32) device];
      v42 = NTKComplicationTypesForDeviceWithBundleID(v41, v30);
      uint64_t v43 = [v42 count];

      if (v43)
      {
        v33 = _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v54 = "-[NTKCompanionAppLibrary _loadWatchApps]_block_invoke";
          id v34 = "%s - processRemoteApplication NTKComplicationTypesForDeviceWithBundleID > 0";
          goto LABEL_37;
        }
        goto LABEL_38;
      }
    }
    else
    {
      dispatch_semaphore_t v35 = dispatch_semaphore_create(0);
      v36 = [MEMORY[0x1E4F4AC68] sharedDeviceConnection];
      uint64_t v37 = *(void *)(a1 + 72);
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __40__NTKCompanionAppLibrary__loadWatchApps__block_invoke_32;
      v45[3] = &unk_1E62C1AE8;
      v48 = v31;
      id v46 = v5;
      dispatch_semaphore_t v47 = v35;
      v38 = v35;
      [v36 applicationIsInstalledOnPairedDevice:v37 withBundleID:v30 completion:v45];

      dispatch_semaphore_wait(v38, 0xFFFFFFFFFFFFFFFFLL);
    }
LABEL_39:

LABEL_40:
LABEL_41:

    goto LABEL_42;
  }
  id v9 = _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
  id v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __40__NTKCompanionAppLibrary__loadWatchApps__block_invoke_2_cold_1((uint64_t)v6, v10);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v54 = "-[NTKCompanionAppLibrary _loadWatchApps]_block_invoke";
    _os_log_impl(&dword_1BC5A9000, v10, OS_LOG_TYPE_DEFAULT, "%s - processRemoteApplication non-error completion", buf, 0xCu);
  }

  [*(id *)(*(void *)(a1 + 32) + 72) lock];
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = v6 == 0;
  uint64_t v15 = *(void *)(a1 + 32);
  long long v16 = *(void **)(v15 + 56);
  *(void *)(v15 + 56) = 0;

  uint64_t v17 = [*(id *)(a1 + 40) copy];
  uint64_t v18 = *(void *)(a1 + 32);
  v19 = *(void **)(v18 + 24);
  *(void *)(v18 + 24) = v17;

  if (*(unsigned char *)(a1 + 80))
  {
    uint64_t v20 = [*(id *)(a1 + 48) copy];
    uint64_t v21 = *(void *)(a1 + 32);
    v22 = *(void **)(v21 + 40);
    *(void *)(v21 + 40) = v20;

    uint64_t v23 = [*(id *)(a1 + 56) copy];
  }
  else
  {
    uint64_t v24 = *(void *)(a1 + 32);
    v25 = *(void **)(v24 + 40);
    *(void *)(v24 + 40) = MEMORY[0x1E4F1CBF0];

    uint64_t v23 = [MEMORY[0x1E4F1CAD0] set];
  }
  uint64_t v26 = *(void *)(a1 + 32);
  v27 = *(void **)(v26 + 48);
  *(void *)(v26 + 48) = v23;

  [*(id *)(*(void *)(a1 + 32) + 72) unlock];
  id v28 = _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v54 = "-[NTKCompanionAppLibrary _loadWatchApps]_block_invoke";
    _os_log_impl(&dword_1BC5A9000, v28, OS_LOG_TYPE_DEFAULT, "%s - processRemoteApplication signaling", buf, 0xCu);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 64));
LABEL_42:
}

id __40__NTKCompanionAppLibrary__loadWatchApps__block_invoke_29(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) device];
  id v5 = +[NTKCompanion3rdPartyApp companion3rdPartyRemoteApp:v3 device:v4];

  id v6 = _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
  int v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      int v10 = 138412290;
      uint64_t v11 = v8;
      _os_log_impl(&dword_1BC5A9000, v7, OS_LOG_TYPE_DEFAULT, "Adding app with bundleID: %@", (uint8_t *)&v10, 0xCu);
    }

    int v7 = *(id *)(a1 + 32);
    objc_sync_enter(v7);
    [*(id *)(a1 + 48) addObject:v5];
    objc_sync_exit(v7);
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __40__NTKCompanionAppLibrary__loadWatchApps__block_invoke_29_cold_1(v3, v7);
  }

  [*(id *)(a1 + 56) addObject:*(void *)(a1 + 40)];

  return v5;
}

intptr_t __40__NTKCompanionAppLibrary__loadWatchApps__block_invoke_32(uint64_t a1, int a2)
{
  if (a2) {
    id v3 = (id)(*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  id v4 = *(NSObject **)(a1 + 40);

  return dispatch_semaphore_signal(v4);
}

uint64_t __40__NTKCompanionAppLibrary__loadWatchApps__block_invoke_37(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  int v7 = _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v18 = "-[NTKCompanionAppLibrary _loadWatchApps]_block_invoke";
    _os_log_impl(&dword_1BC5A9000, v7, OS_LOG_TYPE_DEFAULT, "%s - handleRemoteApplication", buf, 0xCu);
  }

  uint64_t v8 = *(NSObject **)(*(void *)(a1 + 32) + 96);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__NTKCompanionAppLibrary__loadWatchApps__block_invoke_38;
  block[3] = &unk_1E62C22B8;
  id v9 = *(id *)(a1 + 40);
  id v15 = v6;
  id v16 = v9;
  id v14 = v5;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v8, block);

  return 1;
}

uint64_t __40__NTKCompanionAppLibrary__loadWatchApps__block_invoke_38(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __40__NTKCompanionAppLibrary__loadWatchApps__block_invoke_40(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"NTKSystemAppStateChangedNotification" object:*(void *)(a1 + 32)];
}

- (void)_queue_loadApps
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_updateProcessingQueue);
  [(NSRecursiveLock *)self->_internalLock lock];
  id v3 = self->_allApps;
  [(NSRecursiveLock *)self->_internalLock unlock];
  [(NTKCompanionAppLibrary *)self _loadWatchApps];
  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x3032000000;
  id v52 = __Block_byref_object_copy__25;
  v53 = __Block_byref_object_dispose__25;
  id v54 = 0;
  [(NSRecursiveLock *)self->_internalLock lock];
  id v4 = [(NTKCompanionAppLibrary *)self device];
  id v5 = +[NTKCompanion1stPartyApp allAppsForDevice:v4];

  uint64_t v6 = [v5 indexesOfObjectsPassingTest:&__block_literal_global_43];
  int v7 = [v5 objectsAtIndexes:v6];
  firstPartyApps = self->_firstPartyApps;
  self->_firstPartyApps = v7;

  uint64_t v9 = [(NSArray *)self->_thirdPartyApps mutableCopy];
  id v10 = (void *)v50[5];
  v50[5] = v9;

  [(id)v50[5] addObjectsFromArray:self->_firstPartyApps];
  [(id)v50[5] addObjectsFromArray:self->_watchSystemApps];
  [(NSRecursiveLock *)self->_internalLock unlock];
  id v11 = (void *)v50[5];
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __41__NTKCompanionAppLibrary__queue_loadApps__block_invoke_2;
  v48[3] = &unk_1E62C4510;
  v48[4] = self;
  [v11 enumerateObjectsUsingBlock:v48];
  uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
  int v13 = [MEMORY[0x1E4F1CA48] array];
  id v14 = [MEMORY[0x1E4F1CA48] array];
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __41__NTKCompanionAppLibrary__queue_loadApps__block_invoke_3;
  v45[3] = &unk_1E62C4538;
  dispatch_semaphore_t v47 = &v49;
  id v15 = v14;
  id v46 = v15;
  [(NSArray *)v3 enumerateObjectsUsingBlock:v45];
  id v16 = (void *)v50[5];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __41__NTKCompanionAppLibrary__queue_loadApps__block_invoke_4;
  v41[3] = &unk_1E62C4560;
  id v31 = v3;
  v42 = v31;
  id v17 = v13;
  id v43 = v17;
  id v18 = v12;
  id v44 = v18;
  [v16 enumerateObjectsUsingBlock:v41];
  [(NSRecursiveLock *)self->_internalLock lock];
  uint64_t v19 = (NSArray *)[(id)v50[5] copy];
  allApps = self->_allApps;
  self->_allApps = v19;

  uint64_t v21 = (void *)[(NSMutableArray *)self->_prewarmCallbacks copy];
  prewarmCallbacks = self->_prewarmCallbacks;
  self->_prewarmCallbacks = 0;

  [(NSRecursiveLock *)self->_internalLock unlock];
  id v32 = v17;
  uint64_t v23 = (void *)v6;
  uint64_t v24 = v5;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v25 = v21;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v37 objects:v55 count:16];
  if (v26)
  {
    uint64_t v27 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v38 != v27) {
          objc_enumerationMutation(v25);
        }
        uint64_t v29 = *(void *)(*((void *)&v37 + 1) + 8 * i);
        observerCallbackQueue = self->_observerCallbackQueue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __41__NTKCompanionAppLibrary__queue_loadApps__block_invoke_5;
        block[3] = &unk_1E62C0718;
        void block[4] = v29;
        dispatch_async(observerCallbackQueue, block);
      }
      uint64_t v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v37, v55, 16, v31);
    }
    while (v26);
  }

  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __41__NTKCompanionAppLibrary__queue_loadApps__block_invoke_6;
  v35[3] = &unk_1E62C4510;
  v35[4] = self;
  [v15 enumerateObjectsUsingBlock:v35];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __41__NTKCompanionAppLibrary__queue_loadApps__block_invoke_7;
  v34[3] = &unk_1E62C4510;
  v34[4] = self;
  [v32 enumerateObjectsUsingBlock:v34];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __41__NTKCompanionAppLibrary__queue_loadApps__block_invoke_8;
  v33[3] = &unk_1E62C4510;
  v33[4] = self;
  [v18 enumerateObjectsUsingBlock:v33];

  _Block_object_dispose(&v49, 8);
}

uint64_t __41__NTKCompanionAppLibrary__queue_loadApps__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 containerApplicationIdentifier];
  if (v2)
  {
    id v3 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v2 allowPlaceholder:1 error:0];
    id v4 = [v3 applicationState];
    uint64_t v5 = [v4 isRestricted] ^ 1;
  }
  else
  {
    uint64_t v5 = 1;
  }

  return v5;
}

uint64_t __41__NTKCompanionAppLibrary__queue_loadApps__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setDelegate:*(void *)(a1 + 32)];
}

void __41__NTKCompanionAppLibrary__queue_loadApps__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "containsObject:") & 1) == 0) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

void __41__NTKCompanionAppLibrary__queue_loadApps__block_invoke_4(id *a1, void *a2)
{
  id v8 = a2;
  uint64_t v3 = objc_msgSend(a1[4], "indexOfObject:");
  if (v3 == 0x7FFFFFFFFFFFFFFFLL
    || ([a1[4] objectAtIndex:v3], (uint64_t v4 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    [a1[6] addObject:v8];
  }
  else
  {
    uint64_t v5 = (void *)v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v8;
    }
    else {
      id v7 = 0;
    }
    if ([v7 applicationHasBeenUpdated:v6]) {
      [a1[5] addObject:v8];
    }
  }
}

uint64_t __41__NTKCompanionAppLibrary__queue_loadApps__block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __41__NTKCompanionAppLibrary__queue_loadApps__block_invoke_6(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _notifyAppRemoved:a2];
}

uint64_t __41__NTKCompanionAppLibrary__queue_loadApps__block_invoke_7(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _notifyAppUpdated:a2];
}

uint64_t __41__NTKCompanionAppLibrary__queue_loadApps__block_invoke_8(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _notifyAppAdded:a2];
}

- (NSArray)allApps
{
  [(NSRecursiveLock *)self->_internalLock lock];
  uint64_t v3 = self->_allApps;
  [(NSRecursiveLock *)self->_internalLock unlock];

  return v3;
}

- (void)setAllApps:(id)a3
{
}

- (void)setThirdPartyApps:(id)a3
{
}

- (NSArray)firstPartyApps
{
  return self->_firstPartyApps;
}

- (void)setFirstPartyApps:(id)a3
{
}

- (NSArray)watchSystemApps
{
  return self->_watchSystemApps;
}

- (void)setWatchSystemApps:(id)a3
{
}

- (NSSet)installedSystemApplicationIdentifiers
{
  return self->_installedSystemApplicationIdentifiers;
}

- (void)setInstalledSystemApplicationIdentifiers:(id)a3
{
}

- (BOOL)appConduitLoaded
{
  return self->_appConduitLoaded;
}

- (void)setAppConduitLoaded:(BOOL)a3
{
  self->_BOOL appConduitLoaded = a3;
}

- (NSIndexSet)disabledComplicationTypesCache
{
  return self->_disabledComplicationTypesCache;
}

- (void)setDisabledComplicationTypesCache:(id)a3
{
}

- (NSHashTable)changeObservers
{
  return self->_changeObservers;
}

- (void)setChangeObservers:(id)a3
{
}

- (NSRecursiveLock)internalLock
{
  return self->_internalLock;
}

- (void)setInternalLock:(id)a3
{
}

- (OS_dispatch_queue)updateProcessingQueue
{
  return self->_updateProcessingQueue;
}

- (void)setUpdateProcessingQueue:(id)a3
{
}

- (OS_dispatch_queue)observerCallbackQueue
{
  return self->_observerCallbackQueue;
}

- (void)setObserverCallbackQueue:(id)a3
{
}

- (OS_dispatch_queue)appProcessingQueue
{
  return self->_appProcessingQueue;
}

- (void)setAppProcessingQueue:(id)a3
{
}

- (NSMutableArray)prewarmCallbacks
{
  return self->_prewarmCallbacks;
}

- (void)setPrewarmCallbacks:(id)a3
{
}

- (CLKDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_prewarmCallbacks, 0);
  objc_storeStrong((id *)&self->_appProcessingQueue, 0);
  objc_storeStrong((id *)&self->_observerCallbackQueue, 0);
  objc_storeStrong((id *)&self->_updateProcessingQueue, 0);
  objc_storeStrong((id *)&self->_internalLock, 0);
  objc_storeStrong((id *)&self->_changeObservers, 0);
  objc_storeStrong((id *)&self->_disabledComplicationTypesCache, 0);
  objc_storeStrong((id *)&self->_installedSystemApplicationIdentifiers, 0);
  objc_storeStrong((id *)&self->_watchSystemApps, 0);
  objc_storeStrong((id *)&self->_firstPartyApps, 0);
  objc_storeStrong((id *)&self->_thirdPartyApps, 0);

  objc_storeStrong((id *)&self->_allApps, 0);
}

void __40__NTKCompanionAppLibrary__loadWatchApps__block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BC5A9000, a2, OS_LOG_TYPE_ERROR, "Could not enumerate applications with complications. Third party applications may be missing from Gallery. Error: %@", (uint8_t *)&v2, 0xCu);
}

void __40__NTKCompanionAppLibrary__loadWatchApps__block_invoke_29_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 bundleIdentifier];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_1BC5A9000, a2, OS_LOG_TYPE_ERROR, "Failed to create application object for watch application with bundleId: %@. It will not be displayed in Gallery.", (uint8_t *)&v4, 0xCu);
}

@end