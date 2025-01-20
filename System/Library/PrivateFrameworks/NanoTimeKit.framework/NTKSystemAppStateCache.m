@interface NTKSystemAppStateCache
+ (id)sharedInstance;
- (BOOL)isRemovedSystemApp:(id)a3;
- (BOOL)isRestrictedSystemApp:(id)a3;
- (NTKSystemAppStateCache)init;
- (id)_queue_cachedAppStateBundleId;
- (id)_queue_removedSystemApps;
- (id)_queue_restrictedSystemApps;
- (id)removedSystemApps;
- (id)restrictedSystemApps;
- (void)_deviceDidPair;
- (void)_queue_applicationsDidChange:(id)a3 state:(unint64_t)a4;
- (void)_queue_deviceDidPair;
- (void)_queue_initializeRemovedSystemApps;
- (void)_queue_initializeRestrictedSystemApps;
- (void)_queue_tinCanSettingsChanged;
- (void)_queue_verifyStateForAppBundleId:(id)a3;
- (void)_tinCanSettingsChanged;
- (void)applicationInstallsDidStart:(id)a3;
- (void)applicationStateDidChange:(id)a3;
- (void)applicationsDidInstall:(id)a3;
- (void)applicationsDidUninstall:(id)a3;
- (void)dealloc;
- (void)prewarmGizmoDaemon;
@end

@implementation NTKSystemAppStateCache

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_14 != -1) {
    dispatch_once(&sharedInstance_onceToken_14, &__block_literal_global_103);
  }
  v2 = (void *)sharedInstance___sharedInstance_4;
  return v2;
}

void __40__NTKSystemAppStateCache_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(NTKSystemAppStateCache);
  v1 = (void *)sharedInstance___sharedInstance_4;
  sharedInstance___sharedInstance_4 = (uint64_t)v0;
}

- (NTKSystemAppStateCache)init
{
  v10.receiver = self;
  v10.super_class = (Class)NTKSystemAppStateCache;
  v2 = [(NTKSystemAppStateCache *)&v10 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.nanotimekit.systemappstatecache.internalqueue", 0);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v3;

    v5 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    [v5 addObserver:v2];

    tinCanBundleID = v2->_tinCanBundleID;
    v2->_tinCanBundleID = (NSString *)@"com.apple.facetime";

    v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:v2 selector:sel__tinCanSettingsChanged name:@"NTKCTinCanSettingsChangedNotification" object:0];

    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 addObserver:v2 selector:sel__deviceDidPair name:*MEMORY[0x1E4F79EA0] object:0];
  }
  return v2;
}

- (void)dealloc
{
  dispatch_queue_t v3 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v3 removeObserver:self];

  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self name:@"NTKCTinCanSettingsChangedNotification" object:0];

  v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self name:*MEMORY[0x1E4F79EA0] object:0];

  v6.receiver = self;
  v6.super_class = (Class)NTKSystemAppStateCache;
  [(NTKSystemAppStateCache *)&v6 dealloc];
}

- (void)prewarmGizmoDaemon
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__NTKSystemAppStateCache_prewarmGizmoDaemon__block_invoke;
  block[3] = &unk_1E62BFF20;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

void __44__NTKSystemAppStateCache_prewarmGizmoDaemon__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_removedSystemApps");
  dispatch_queue_t v3 = objc_msgSend(*(id *)(a1 + 32), "_queue_restrictedSystemApps");
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  v5 = (void *)CFPreferencesCopyAppValue(@"SystemAppCacheRemovedApps", @"com.apple.NanoTimeKit.daemon");
  objc_super v6 = [v4 setWithArray:v5];

  v7 = (void *)MEMORY[0x1E4F1CAD0];
  v8 = (void *)CFPreferencesCopyAppValue(@"SystemAppCacheRestrictedApps", @"com.apple.NanoTimeKit.daemon");
  v9 = [v7 setWithArray:v8];

  if ([v2 isEqualToSet:v6])
  {
    if ([v3 isEqualToSet:v9]) {
      goto LABEL_11;
    }
  }
  else
  {
    objc_super v10 = _NTKLoggingObjectForDomain(0, (uint64_t)"NTKLoggingDomainDefault");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      v14 = v6;
      _os_log_impl(&dword_1BC5A9000, v10, OS_LOG_TYPE_DEFAULT, "removed system apps changed while daemon was not running, previous set: %@", (uint8_t *)&v13, 0xCu);
    }

    CFPreferencesSetAppValue(@"SystemAppCacheRemovedApps", (CFPropertyListRef)[v2 allObjects], @"com.apple.NanoTimeKit.daemon");
    if ([v3 isEqualToSet:v9]) {
      goto LABEL_10;
    }
  }
  v11 = _NTKLoggingObjectForDomain(0, (uint64_t)"NTKLoggingDomainDefault");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    v14 = v9;
    _os_log_impl(&dword_1BC5A9000, v11, OS_LOG_TYPE_DEFAULT, "restricted system apps changed while daemon was not running, previous set: %@", (uint8_t *)&v13, 0xCu);
  }

  CFPreferencesSetAppValue(@"SystemAppCacheRestrictedApps", (CFPropertyListRef)[v3 allObjects], @"com.apple.NanoTimeKit.daemon");
LABEL_10:
  CFPreferencesAppSynchronize(@"com.apple.NanoTimeKit.daemon");
  v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v12 postNotificationName:@"NTKSystemAppStateChangedWhileDaemonNotRunningNotification" object:*(void *)(a1 + 32)];

LABEL_11:
  xpc_set_event_stream_handler("com.apple.distnoted.matching", 0, &__block_literal_global_305);
}

- (BOOL)isRemovedSystemApp:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__NTKSystemAppStateCache_isRemovedSystemApp___block_invoke;
  block[3] = &unk_1E62C5D00;
  block[4] = self;
  id v9 = v4;
  objc_super v10 = &v11;
  id v6 = v4;
  dispatch_sync(internalQueue, block);
  LOBYTE(internalQueue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)internalQueue;
}

void __45__NTKSystemAppStateCache_isRemovedSystemApp___block_invoke(uint64_t a1)
{
  v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_cachedAppStateBundleId");
  char v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0) {
    objc_msgSend(*(id *)(a1 + 32), "_queue_verifyStateForAppBundleId:", *(void *)(a1 + 40));
  }
  objc_msgSend(*(id *)(a1 + 32), "_queue_removedSystemApps");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v4 containsObject:*(void *)(a1 + 40)];
}

- (BOOL)isRestrictedSystemApp:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__NTKSystemAppStateCache_isRestrictedSystemApp___block_invoke;
  block[3] = &unk_1E62C5D00;
  block[4] = self;
  id v9 = v4;
  objc_super v10 = &v11;
  id v6 = v4;
  dispatch_sync(internalQueue, block);
  LOBYTE(internalQueue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)internalQueue;
}

void __48__NTKSystemAppStateCache_isRestrictedSystemApp___block_invoke(uint64_t a1)
{
  v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_cachedAppStateBundleId");
  char v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0) {
    objc_msgSend(*(id *)(a1 + 32), "_queue_verifyStateForAppBundleId:", *(void *)(a1 + 40));
  }
  objc_msgSend(*(id *)(a1 + 32), "_queue_restrictedSystemApps");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v4 containsObject:*(void *)(a1 + 40)];
}

- (id)restrictedSystemApps
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__31;
  objc_super v10 = __Block_byref_object_dispose__31;
  id v11 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__NTKSystemAppStateCache_restrictedSystemApps__block_invoke;
  v5[3] = &unk_1E62C3040;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __46__NTKSystemAppStateCache_restrictedSystemApps__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_restrictedSystemApps");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)removedSystemApps
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__31;
  objc_super v10 = __Block_byref_object_dispose__31;
  id v11 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__NTKSystemAppStateCache_removedSystemApps__block_invoke;
  v5[3] = &unk_1E62C3040;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __43__NTKSystemAppStateCache_removedSystemApps__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_removedSystemApps");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)applicationStateDidChange:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__NTKSystemAppStateCache_applicationStateDidChange___block_invoke;
  v7[3] = &unk_1E62C09C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

uint64_t __52__NTKSystemAppStateCache_applicationStateDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_applicationsDidChange:state:", *(void *)(a1 + 40), 2);
}

- (void)applicationsDidInstall:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__NTKSystemAppStateCache_applicationsDidInstall___block_invoke;
  v7[3] = &unk_1E62C09C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

uint64_t __49__NTKSystemAppStateCache_applicationsDidInstall___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_applicationsDidChange:state:", *(void *)(a1 + 40), 0);
}

- (void)applicationsDidUninstall:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__NTKSystemAppStateCache_applicationsDidUninstall___block_invoke;
  v7[3] = &unk_1E62C09C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

uint64_t __51__NTKSystemAppStateCache_applicationsDidUninstall___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_applicationsDidChange:state:", *(void *)(a1 + 40), 1);
}

- (void)applicationInstallsDidStart:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__NTKSystemAppStateCache_applicationInstallsDidStart___block_invoke;
  v7[3] = &unk_1E62C09C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

uint64_t __54__NTKSystemAppStateCache_applicationInstallsDidStart___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_applicationsDidChange:state:", *(void *)(a1 + 40), 3);
}

- (void)_tinCanSettingsChanged
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__NTKSystemAppStateCache__tinCanSettingsChanged__block_invoke;
  block[3] = &unk_1E62BFF20;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

uint64_t __48__NTKSystemAppStateCache__tinCanSettingsChanged__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_tinCanSettingsChanged");
}

- (void)_deviceDidPair
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__NTKSystemAppStateCache__deviceDidPair__block_invoke;
  block[3] = &unk_1E62BFF20;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

uint64_t __40__NTKSystemAppStateCache__deviceDidPair__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_deviceDidPair");
}

- (void)_queue_initializeRestrictedSystemApps
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (NSMutableSet *)objc_opt_new();
  restrictedSystemApps = self->_restrictedSystemApps;
  self->_restrictedSystemApps = v3;

  id v5 = NTKBundleIDToComplicationTypesMappingForGloryDevices();
  id v6 = [v5 allKeys];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __63__NTKSystemAppStateCache__queue_initializeRestrictedSystemApps__block_invoke;
  v9[3] = &unk_1E62C0188;
  v9[4] = self;
  [v6 enumerateObjectsUsingBlock:v9];
  v7 = _NTKLoggingObjectForDomain(0, (uint64_t)"NTKLoggingDomainDefault");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = self->_restrictedSystemApps;
    *(_DWORD *)buf = 138412290;
    id v11 = v8;
    _os_log_impl(&dword_1BC5A9000, v7, OS_LOG_TYPE_DEFAULT, "restricted system app set initialized: %@", buf, 0xCu);
  }
}

uint64_t __63__NTKSystemAppStateCache__queue_initializeRestrictedSystemApps__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_verifyStateForAppBundleId:", a2);
}

- (void)_queue_initializeRemovedSystemApps
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (NSMutableSet *)objc_opt_new();
  removedSystemApps = self->_removedSystemApps;
  self->_removedSystemApps = v3;

  id v5 = NTKBundleIDToComplicationTypesMappingForGloryDevices();
  id v6 = [v5 allKeys];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__NTKSystemAppStateCache__queue_initializeRemovedSystemApps__block_invoke;
  v9[3] = &unk_1E62C0188;
  v9[4] = self;
  [v6 enumerateObjectsUsingBlock:v9];
  v7 = _NTKLoggingObjectForDomain(0, (uint64_t)"NTKLoggingDomainDefault");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = self->_removedSystemApps;
    *(_DWORD *)buf = 138412290;
    id v11 = v8;
    _os_log_impl(&dword_1BC5A9000, v7, OS_LOG_TYPE_DEFAULT, "removed system app set initialized: %@", buf, 0xCu);
  }
}

void __60__NTKSystemAppStateCache__queue_initializeRemovedSystemApps__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (![v7 isEqualToString:@"com.apple.Health"])
  {
    if (![v7 isEqualToString:*(void *)(*(void *)(a1 + 32) + 40)])
    {
      objc_msgSend(*(id *)(a1 + 32), "_queue_verifyStateForAppBundleId:", v7);
      goto LABEL_8;
    }
    id v5 = +[NTKCTinCanSettings sharedInstance];
    char v6 = [v5 tinCanEnabled];

    id v4 = v7;
    if (v6) {
      goto LABEL_9;
    }
LABEL_6:
    [*(id *)(*(void *)(a1 + 32) + 16) addObject:v7];
LABEL_8:
    id v4 = v7;
    goto LABEL_9;
  }
  char v3 = [MEMORY[0x1E4F2B0F8] isElectrocardiogramSupportedOnActiveWatch];
  id v4 = v7;
  if ((v3 & 1) == 0) {
    goto LABEL_6;
  }
LABEL_9:
}

- (void)_queue_verifyStateForAppBundleId:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(NTKSystemAppStateCache *)self _queue_cachedAppStateBundleId];
  [v5 addObject:v4];

  id v18 = 0;
  char v6 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v4 allowPlaceholder:1 error:&v18];
  id v7 = v18;
  if (v6)
  {
    id v8 = [v6 applicationState];
    char v9 = [v8 isInstalled];

    if ((v9 & 1) == 0)
    {
      objc_super v10 = [v6 applicationState];
      char v11 = [v10 isPlaceholder];

      uint64_t v12 = _NTKLoggingObjectForDomain(0, (uint64_t)"NTKLoggingDomainDefault");
      BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
      if (v11)
      {
        if (v13)
        {
          *(_DWORD *)buf = 138412290;
          id v20 = v4;
          _os_log_impl(&dword_1BC5A9000, v12, OS_LOG_TYPE_DEFAULT, "found placeholder for system app (%@)", buf, 0xCu);
        }
      }
      else
      {
        if (v13)
        {
          *(_DWORD *)buf = 138412290;
          id v20 = v4;
          _os_log_impl(&dword_1BC5A9000, v12, OS_LOG_TYPE_DEFAULT, "system app (%@) is not installed", buf, 0xCu);
        }

        [(NSMutableSet *)self->_removedSystemApps addObject:v4];
      }
    }
    uint64_t v15 = [v6 applicationState];
    int v16 = [v15 isRestricted];

    if (v16)
    {
      [(NSMutableSet *)self->_restrictedSystemApps addObject:v4];
      v17 = _NTKLoggingObjectForDomain(0, (uint64_t)"NTKLoggingDomainDefault");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v20 = v4;
        _os_log_impl(&dword_1BC5A9000, v17, OS_LOG_TYPE_DEFAULT, "system app (%@) is restricted", buf, 0xCu);
      }
    }
  }
  else
  {
    char v14 = _NTKLoggingObjectForDomain(0, (uint64_t)"NTKLoggingDomainDefault");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v4;
      _os_log_impl(&dword_1BC5A9000, v14, OS_LOG_TYPE_DEFAULT, "system app (%@) does not have a record", buf, 0xCu);
    }

    [(NSMutableSet *)self->_removedSystemApps addObject:v4];
  }
}

- (void)_queue_applicationsDidChange:(id)a3 state:(unint64_t)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = a3;
  uint64_t v6 = [obj countByEnumeratingWithState:&v39 objects:v45 count:16];
  if (!v6) {
    goto LABEL_37;
  }
  uint64_t v8 = v6;
  char v9 = 0;
  uint64_t v10 = *(void *)v40;
  *(void *)&long long v7 = 138412290;
  long long v36 = v7;
LABEL_3:
  uint64_t v11 = 0;
  while (2)
  {
    if (*(void *)v40 != v10) {
      objc_enumerationMutation(obj);
    }
    uint64_t v12 = *(void **)(*((void *)&v39 + 1) + 8 * v11);
    BOOL v13 = objc_msgSend(v12, "applicationIdentifier", v36);
    switch(a4)
    {
      case 0uLL:
        char v14 = [(NTKSystemAppStateCache *)self _queue_removedSystemApps];
        int v15 = [v14 containsObject:v13];

        if (v15)
        {
          int v16 = [(NTKSystemAppStateCache *)self _queue_removedSystemApps];
          [v16 removeObject:v13];

          v17 = _NTKLoggingObjectForDomain(0, (uint64_t)"NTKLoggingDomainDefault");
          if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_31;
          }
          *(_DWORD *)buf = v36;
          v44 = v13;
          id v18 = v17;
          v19 = "system app (%@) was installed";
          goto LABEL_30;
        }
        goto LABEL_33;
      case 1uLL:
        v25 = [(NTKSystemAppStateCache *)self _queue_removedSystemApps];
        char v26 = [v25 containsObject:v13];

        if ((v26 & 1) == 0)
        {
          v27 = [(NTKSystemAppStateCache *)self _queue_removedSystemApps];
          [v27 addObject:v13];

          v17 = _NTKLoggingObjectForDomain(0, (uint64_t)"NTKLoggingDomainDefault");
          if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_31;
          }
          *(_DWORD *)buf = v36;
          v44 = v13;
          id v18 = v17;
          v19 = "system app (%@) was uninstalled";
          goto LABEL_30;
        }
        goto LABEL_33;
      case 2uLL:
        id v20 = [v12 appState];
        int v21 = [v20 isRestricted];

        v22 = [(NTKSystemAppStateCache *)self _queue_restrictedSystemApps];
        int v23 = [v22 containsObject:v13];

        if (v21)
        {
          if ((v23 & 1) == 0)
          {
            v24 = [(NTKSystemAppStateCache *)self _queue_restrictedSystemApps];
            [v24 addObject:v13];

            v17 = _NTKLoggingObjectForDomain(0, (uint64_t)"NTKLoggingDomainDefault");
            if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_31;
            }
            *(_DWORD *)buf = v36;
            v44 = v13;
            id v18 = v17;
            v19 = "system app (%@) restricted";
            goto LABEL_30;
          }
        }
        else if (v23)
        {
          v34 = [(NTKSystemAppStateCache *)self _queue_restrictedSystemApps];
          [v34 removeObject:v13];

          v17 = _NTKLoggingObjectForDomain(0, (uint64_t)"NTKLoggingDomainDefault");
          if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_31;
          }
          *(_DWORD *)buf = v36;
          v44 = v13;
          id v18 = v17;
          v19 = "system app (%@) un-restricted";
          goto LABEL_30;
        }
        goto LABEL_33;
      case 3uLL:
        v28 = [(NTKSystemAppStateCache *)self _queue_removedSystemApps];
        int v29 = [v28 containsObject:v13];

        if (v29)
        {
          v30 = [(NTKSystemAppStateCache *)self _queue_removedSystemApps];
          [v30 removeObject:v13];
        }
        v31 = [(NTKSystemAppStateCache *)self _queue_restrictedSystemApps];
        int v32 = [v31 containsObject:v13];

        if (v32)
        {
          v33 = [(NTKSystemAppStateCache *)self _queue_restrictedSystemApps];
          [v33 removeObject:v13];
        }
        else if (!v29)
        {
          v17 = _NTKLoggingObjectForDomain(0, (uint64_t)"NTKLoggingDomainDefault");
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v36;
            v44 = v13;
            id v18 = v17;
            v19 = "system app (%@) install started";
LABEL_30:
            _os_log_impl(&dword_1BC5A9000, v18, OS_LOG_TYPE_DEFAULT, v19, buf, 0xCu);
          }
LABEL_31:

          goto LABEL_32;
        }
        v35 = _NTKLoggingObjectForDomain(0, (uint64_t)"NTKLoggingDomainDefault");
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v36;
          v44 = v13;
          _os_log_impl(&dword_1BC5A9000, v35, OS_LOG_TYPE_DEFAULT, "system app (%@) install started and was previously removed or restricted, re-evaluating", buf, 0xCu);
        }

        [(NTKSystemAppStateCache *)self _queue_verifyStateForAppBundleId:v13];
LABEL_32:
        char v9 = 1;
        goto LABEL_33;
      default:
LABEL_33:

        if (v8 != ++v11) {
          continue;
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v39 objects:v45 count:16];
        if (v8) {
          goto LABEL_3;
        }
        if (v9)
        {
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __61__NTKSystemAppStateCache__queue_applicationsDidChange_state___block_invoke;
          block[3] = &unk_1E62BFF20;
          block[4] = self;
          dispatch_async(MEMORY[0x1E4F14428], block);
        }
LABEL_37:

        return;
    }
  }
}

void __61__NTKSystemAppStateCache__queue_applicationsDidChange_state___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"NTKSystemAppStateChangedNotification" object:*(void *)(a1 + 32)];
}

- (void)_queue_tinCanSettingsChanged
{
  char v3 = +[NTKCTinCanSettings sharedInstance];
  int v4 = [v3 tinCanEnabled];

  id v5 = [(NTKSystemAppStateCache *)self _queue_removedSystemApps];
  int v6 = [v5 containsObject:self->_tinCanBundleID];
  if (v4)
  {
    if (v6)
    {
      [v5 removeObject:self->_tinCanBundleID];
LABEL_6:
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __54__NTKSystemAppStateCache__queue_tinCanSettingsChanged__block_invoke;
      block[3] = &unk_1E62BFF20;
      block[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
  else if ((v6 & 1) == 0)
  {
    [v5 addObject:self->_tinCanBundleID];
    goto LABEL_6;
  }
}

void __54__NTKSystemAppStateCache__queue_tinCanSettingsChanged__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"NTKSystemAppStateChangedNotification" object:*(void *)(a1 + 32)];
}

- (void)_queue_deviceDidPair
{
  if ([MEMORY[0x1E4F2B0F8] isElectrocardiogramSupportedOnActiveWatch]
    && [(NSMutableSet *)self->_removedSystemApps containsObject:@"com.apple.Health"])
  {
    [(NSMutableSet *)self->_removedSystemApps removeObject:@"com.apple.Health"];
LABEL_7:
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__NTKSystemAppStateCache__queue_deviceDidPair__block_invoke;
    block[3] = &unk_1E62BFF20;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
    return;
  }
  if (([MEMORY[0x1E4F2B0F8] isElectrocardiogramSupportedOnActiveWatch] & 1) == 0
    && ([(NSMutableSet *)self->_removedSystemApps containsObject:@"com.apple.Health"] & 1) == 0)
  {
    [(NSMutableSet *)self->_removedSystemApps addObject:@"com.apple.Health"];
    goto LABEL_7;
  }
}

void __46__NTKSystemAppStateCache__queue_deviceDidPair__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"NTKSystemAppStateChangedNotification" object:*(void *)(a1 + 32)];
}

- (id)_queue_removedSystemApps
{
  removedSystemApps = self->_removedSystemApps;
  if (!removedSystemApps)
  {
    [(NTKSystemAppStateCache *)self _queue_initializeRemovedSystemApps];
    removedSystemApps = self->_removedSystemApps;
  }
  return removedSystemApps;
}

- (id)_queue_cachedAppStateBundleId
{
  cachedAppStateBundleId = self->_cachedAppStateBundleId;
  if (!cachedAppStateBundleId)
  {
    int v4 = (NSMutableSet *)objc_opt_new();
    id v5 = self->_cachedAppStateBundleId;
    self->_cachedAppStateBundleId = v4;

    cachedAppStateBundleId = self->_cachedAppStateBundleId;
  }
  return cachedAppStateBundleId;
}

- (id)_queue_restrictedSystemApps
{
  restrictedSystemApps = self->_restrictedSystemApps;
  if (!restrictedSystemApps)
  {
    [(NTKSystemAppStateCache *)self _queue_initializeRestrictedSystemApps];
    restrictedSystemApps = self->_restrictedSystemApps;
  }
  return restrictedSystemApps;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tinCanBundleID, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_cachedAppStateBundleId, 0);
  objc_storeStrong((id *)&self->_removedSystemApps, 0);
  objc_storeStrong((id *)&self->_restrictedSystemApps, 0);
}

@end