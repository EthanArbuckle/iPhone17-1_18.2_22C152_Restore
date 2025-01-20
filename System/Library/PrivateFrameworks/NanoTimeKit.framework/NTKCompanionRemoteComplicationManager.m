@interface NTKCompanionRemoteComplicationManager
+ (id)sharedInstance;
- (BOOL)fetchingApps;
- (BOOL)isComplicationAvailable:(id)a3 forFamilies:(id)a4;
- (BOOL)loaded;
- (BOOL)vendorExistsWithClientIdentifier:(id)a3 appBundleIdentifier:(id)a4;
- (BOOL)wantsAppFetch;
- (CLKDevice)device;
- (NSDictionary)installedComplications;
- (NSDictionary)syncedComplications;
- (NTKCompanionRemoteComplicationManager)init;
- (NTKComplicationCollection)remoteComplications;
- (OS_dispatch_queue)serialQueue;
- (id)_safeComplications;
- (id)_safeInstalledComplications;
- (id)itemIdForVendorWithClientIdentifier:(id)a3;
- (id)localizedAppNameForClientIdentifier:(id)a3;
- (os_unfair_lock_s)installedComplicationsLock;
- (os_unfair_lock_s)remoteComplicationsLock;
- (os_unfair_lock_s)syncedComplicationsLock;
- (void)_fetchInstalledApps;
- (void)_load;
- (void)_queryInstalledApps;
- (void)_queue_reloadApps;
- (void)_reloadApps;
- (void)dealloc;
- (void)enumerateComplicationDescriptorsForClientIdentifier:(id)a3 family:(int64_t)a4 withBlock:(id)a5;
- (void)enumerateComplicationDescriptorsForClientIdentifier:(id)a3 withBlock:(id)a4;
- (void)enumerateEnabledVendorsForComplicationFamily:(int64_t)a3 withBlock:(id)a4;
- (void)notifyAppForClientIdentifier:(id)a3 ofSharedComplicationDescriptors:(id)a4 withCompletion:(id)a5;
- (void)setDevice:(id)a3;
- (void)setFetchingApps:(BOOL)a3;
- (void)setInstalledComplications:(id)a3;
- (void)setLoaded:(BOOL)a3;
- (void)setRemoteComplications:(id)a3;
- (void)setSerialQueue:(id)a3;
- (void)setSyncedComplications:(id)a3;
- (void)setWantsAppFetch:(BOOL)a3;
@end

@implementation NTKCompanionRemoteComplicationManager

- (void)_load
{
  p_remoteComplicationsLock = &self->_remoteComplicationsLock;
  os_unfair_lock_lock(&self->_remoteComplicationsLock);
  v4 = [MEMORY[0x1E4F19A30] currentDevice];
  [(NTKCompanionRemoteComplicationManager *)self setDevice:v4];

  [(NTKComplicationCollection *)self->_remoteComplications removeObserver:self];
  v5 = [MEMORY[0x1E4F19A30] currentDevice];
  v6 = +[NTKCompanionComplicationCollectionManager sharedComplicationCollectionForDevice:v5];
  [(NTKCompanionRemoteComplicationManager *)self setRemoteComplications:v6];

  [(NTKComplicationCollection *)self->_remoteComplications addObserver:self];
  os_unfair_lock_unlock(p_remoteComplicationsLock);
  [(NTKCompanionRemoteComplicationManager *)self _fetchInstalledApps];
}

- (void)setRemoteComplications:(id)a3
{
}

- (void)setDevice:(id)a3
{
}

- (BOOL)loaded
{
  return self->_loaded;
}

void __55__NTKCompanionRemoteComplicationManager_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = v0;
}

- (NTKCompanionRemoteComplicationManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)NTKCompanionRemoteComplicationManager;
  v2 = [(NTKCompanionRemoteComplicationManager *)&v8 init];
  v3 = v2;
  if (v2)
  {
    *(void *)&v2->_installedComplicationsLock._os_unfair_lock_opaque = 0;
    v2->_remoteComplicationsLock._os_unfair_lock_opaque = 0;
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.ntk.companionremotecomplicationmanager.updates", 0);
    [(NTKCompanionRemoteComplicationManager *)v3 setSerialQueue:v4];

    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v3 selector:sel__activeDeviceChanged name:*MEMORY[0x1E4F19620] object:0];
    [v5 addObserver:v3 selector:sel__appStartedInstall name:@"NTKCompanion3rdPartyAppInstallStartedNotification" object:0];
    [v5 addObserver:v3 selector:sel__fetchInstalledApps name:@"NTKSystemAppStateChangedNotification" object:0];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)_handleAppConduitApplicationsChangedNotification, (CFStringRef)*MEMORY[0x1E4F4AC38], v3, (CFNotificationSuspensionBehavior)0);
    [(NTKCompanionRemoteComplicationManager *)v3 _load];
  }
  return v3;
}

- (void)setSerialQueue:(id)a3
{
}

- (void)_fetchInstalledApps
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  p_remoteComplicationsLock = &self->_remoteComplicationsLock;
  os_unfair_lock_lock(&self->_remoteComplicationsLock);
  dispatch_queue_t v4 = [(NTKCompanionRemoteComplicationManager *)self remoteComplications];
  int v5 = [v4 hasLoaded];

  os_unfair_lock_unlock(p_remoteComplicationsLock);
  if (v5)
  {
    os_unfair_lock_lock(p_remoteComplicationsLock);
    if (self->_fetchingApps)
    {
      v6 = _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        BOOL wantsAppFetch = self->_wantsAppFetch;
        v8[0] = 67109120;
        v8[1] = wantsAppFetch;
        _os_log_impl(&dword_1BC5A9000, v6, OS_LOG_TYPE_DEFAULT, "NTKCompanionRemoteComplicationManager: Attempted to fetch installed apps while already retrieving installed apps! Deferring until after the first operation completes... (previously defered=%d)", (uint8_t *)v8, 8u);
      }

      self->_BOOL wantsAppFetch = 1;
      os_unfair_lock_unlock(p_remoteComplicationsLock);
    }
    else
    {
      os_unfair_lock_unlock(p_remoteComplicationsLock);
      [(NTKCompanionRemoteComplicationManager *)self _queryInstalledApps];
    }
  }
}

- (NTKComplicationCollection)remoteComplications
{
  return self->_remoteComplications;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_21);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F19620] object:0];
  [v3 removeObserver:self name:@"NTKCompanion3rdPartyAppInstallStartedNotification" object:0];
  [v3 removeObserver:self name:@"NTKSystemAppStateChangedNotification" object:0];
  [(NTKComplicationCollection *)self->_remoteComplications removeObserver:self];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x1E4F4AC38], self);

  v5.receiver = self;
  v5.super_class = (Class)NTKCompanionRemoteComplicationManager;
  [(NTKCompanionRemoteComplicationManager *)&v5 dealloc];
}

- (void)_queryInstalledApps
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  os_unfair_lock_lock(&self->_remoteComplicationsLock);
  *(_WORD *)&self->_fetchingApps = 1;
  os_unfair_lock_unlock(&self->_remoteComplicationsLock);
  dispatch_queue_t v4 = _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1BC5A9000, v4, OS_LOG_TYPE_DEFAULT, "NTKCompanionRemoteComplicationManager: Fetching installed apps for remote complication manager...", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__NTKCompanionRemoteComplicationManager__queryInstalledApps__block_invoke;
  aBlock[3] = &unk_1E62C1A70;
  objc_copyWeak(&v30, buf);
  aBlock[4] = self;
  id v5 = v3;
  id v29 = v5;
  v6 = (void (**)(void))_Block_copy(aBlock);
  os_unfair_lock_lock(&self->_remoteComplicationsLock);
  int v7 = [(CLKDevice *)self->_device isRunningGraceOrLater];
  objc_super v8 = [(CLKDevice *)self->_device nrDevice];
  os_unfair_lock_unlock(&self->_remoteComplicationsLock);
  uint64_t v9 = [v8 pairingID];
  if (v8)
  {
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __60__NTKCompanionRemoteComplicationManager__queryInstalledApps__block_invoke_2_17;
    v26[3] = &unk_1E62C1A98;
    v26[4] = self;
    id v27 = v5;
    v10 = _Block_copy(v26);
    v11 = dispatch_group_create();
    dispatch_group_enter(v11);
    dispatch_group_notify(v11, (dispatch_queue_t)self->_serialQueue, v6);
    dispatch_group_enter(v11);
    v12 = [MEMORY[0x1E4F4AC68] sharedDeviceConnection];
    if (v7)
    {
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __60__NTKCompanionRemoteComplicationManager__queryInstalledApps__block_invoke_2_22;
      v21[3] = &unk_1E62C1AC0;
      char v25 = v7;
      id v22 = v9;
      v23 = v11;
      id v24 = v10;
      [v12 enumerateInstalledApplicationsOnPairedDevice:v8 withBlock:v21];
      v13 = &v22;
      v14 = (id *)&v23;
      v15 = &v24;
    }
    else
    {
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __60__NTKCompanionRemoteComplicationManager__queryInstalledApps__block_invoke_24;
      v16[3] = &unk_1E62C1B10;
      id v17 = v9;
      v18 = v11;
      id v19 = v8;
      id v20 = v10;
      [v12 enumerateLocallyAvailableApplicationsForPairedDevice:v19 options:3 withBlock:v16];
      v13 = &v17;
      v14 = (id *)&v18;
      v15 = &v19;

      v12 = v20;
    }

    dispatch_group_leave(v11);
  }
  else
  {
    v6[2](v6);
  }

  objc_destroyWeak(&v30);
  objc_destroyWeak(buf);
}

void __60__NTKCompanionRemoteComplicationManager__queryInstalledApps__block_invoke(id *a1)
{
  WeakRetained = (char *)objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    os_unfair_lock_lock((os_unfair_lock_t)a1[4] + 4);
    v3 = (void *)[a1[5] copy];
    [a1[4] setInstalledComplications:v3];

    os_unfair_lock_unlock((os_unfair_lock_t)a1[4] + 4);
    objc_msgSend(a1[4], "_queue_reloadApps");
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__NTKCompanionRemoteComplicationManager__queryInstalledApps__block_invoke_2;
    block[3] = &unk_1E62BFF20;
    block[4] = a1[4];
    dispatch_async(MEMORY[0x1E4F14428], block);
    os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 4);
    if (WeakRetained[10])
    {
      os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 4);
      dispatch_queue_t v4 = _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BC5A9000, v4, OS_LOG_TYPE_DEFAULT, "NTKCompanionRemoteComplicationManager: Finished fetching apps, but beginning a backlogged refresh", buf, 2u);
      }

      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __60__NTKCompanionRemoteComplicationManager__queryInstalledApps__block_invoke_16;
      v7[3] = &unk_1E62BFF20;
      v7[4] = WeakRetained;
      id v5 = (void *)MEMORY[0x1E4F14428];
      dispatch_async(MEMORY[0x1E4F14428], v7);
    }
    else
    {
      v6 = _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BC5A9000, v6, OS_LOG_TYPE_DEFAULT, "NTKCompanionRemoteComplicationManager: Finished fetching apps", buf, 2u);
      }

      *(_WORD *)(WeakRetained + 9) = 0;
      os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 4);
    }
  }
}

void __60__NTKCompanionRemoteComplicationManager__queryInstalledApps__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 8))
  {
    *(unsigned char *)(v1 + 8) = 1;
    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 postNotificationName:@"NTKCompanionRemoteComplicationManagerDidLoadNotification" object:*(void *)(a1 + 32)];
  }
}

uint64_t __60__NTKCompanionRemoteComplicationManager__queryInstalledApps__block_invoke_16(uint64_t a1)
{
  return [*(id *)(a1 + 32) _queryInstalledApps];
}

void __60__NTKCompanionRemoteComplicationManager__queryInstalledApps__block_invoke_2_17(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  dispatch_queue_t v4 = [v3 companionAppBundleID];
  if ([v4 length])
  {
    id v18 = 0;
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v4 allowPlaceholder:1 error:&v18];
    id v6 = v18;
    if (!v5)
    {
      int v7 = _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __60__NTKCompanionRemoteComplicationManager__queryInstalledApps__block_invoke_2_17_cold_1((uint64_t)v4);
      }
    }
    objc_super v8 = [v5 applicationState];
    int v9 = [v8 isRestricted];

    if (v9)
    {
      v10 = [v3 bundleIdentifier];
      v11 = _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v20 = v10;
        __int16 v21 = 2112;
        id v22 = v4;
        _os_log_impl(&dword_1BC5A9000, v11, OS_LOG_TYPE_DEFAULT, "Complication: Restricted app with bundleID: %@ - %@ on companion", buf, 0x16u);
      }

      goto LABEL_14;
    }
  }
  v12 = [v3 watchKitAppExtensionBundleID];
  if (v12 || ([v3 bundleIdentifier], (v12 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v13 = *(NSObject **)(*(void *)(a1 + 32) + 56);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __60__NTKCompanionRemoteComplicationManager__queryInstalledApps__block_invoke_19;
    v14[3] = &unk_1E62C04F0;
    id v15 = *(id *)(a1 + 40);
    id v16 = v12;
    id v17 = v3;
    id v6 = v12;
    dispatch_sync(v13, v14);

    id v5 = v15;
LABEL_14:
  }
}

uint64_t __60__NTKCompanionRemoteComplicationManager__queryInstalledApps__block_invoke_19(uint64_t a1)
{
  return [*(id *)(a1 + 32) setObject:*(void *)(a1 + 48) forKeyedSubscript:*(void *)(a1 + 40)];
}

uint64_t __60__NTKCompanionRemoteComplicationManager__queryInstalledApps__block_invoke_2_22(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = v6;
  if (v5)
  {
    objc_super v8 = (void *)MEMORY[0x1C1875BE0]();
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    if (v6 && *(unsigned char *)(a1 + 56))
    {
      int v9 = _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __60__NTKCompanionRemoteComplicationManager__queryInstalledApps__block_invoke_2_22_cold_1(a1);
      }
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }

  return 1;
}

uint64_t __60__NTKCompanionRemoteComplicationManager__queryInstalledApps__block_invoke_24(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = v6;
  if (v5)
  {
    objc_super v8 = [v5 bundleIdentifier];
    if (v8)
    {
      dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
      int v9 = [MEMORY[0x1E4F4AC68] sharedDeviceConnection];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __60__NTKCompanionRemoteComplicationManager__queryInstalledApps__block_invoke_25;
      v13[3] = &unk_1E62C1AE8;
      uint64_t v10 = *(void *)(a1 + 48);
      id v16 = *(id *)(a1 + 56);
      id v14 = v5;
      id v15 = *(id *)(a1 + 40);
      [v9 applicationIsInstalledOnPairedDevice:v10 withBundleID:v8 completion:v13];
    }
  }
  else
  {
    if (v6)
    {
      v11 = _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __60__NTKCompanionRemoteComplicationManager__queryInstalledApps__block_invoke_2_22_cold_1(a1);
      }
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }

  return 1;
}

void __60__NTKCompanionRemoteComplicationManager__queryInstalledApps__block_invoke_25(uint64_t a1, int a2, void *a3)
{
  id v6 = a3;
  if (a2)
  {
    id v5 = (void *)MEMORY[0x1C1875BE0]();
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (void)_queue_reloadApps
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v3 = [(NTKCompanionRemoteComplicationManager *)self _safeInstalledComplications];
  v62 = [MEMORY[0x1E4F1CA60] dictionary];
  os_unfair_lock_lock(&self->_remoteComplicationsLock);
  dispatch_queue_t v4 = self->_remoteComplications;
  v50 = self;
  id v5 = [(NTKCompanionRemoteComplicationManager *)self device];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"A7ECBEFE-1F57-4037-8007-469E4BF74064"];
  int v58 = [v5 supportsCapability:v6];

  int v7 = v4;
  os_unfair_lock_unlock(&self->_remoteComplicationsLock);
  [(NTKComplicationCollection *)v4 clients];
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [obj countByEnumeratingWithState:&v76 objects:v86 count:16];
  v53 = v4;
  v54 = v3;
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v60 = *(void *)v77;
    do
    {
      uint64_t v10 = 0;
      id v56 = (id)v9;
      do
      {
        if (*(void *)v77 != v60) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v76 + 1) + 8 * v10);
        v12 = [MEMORY[0x1E4F1CA48] array];
        v13 = [v3 objectForKeyedSubscript:v11];
        if (v13)
        {
          if (v58)
          {
            id v14 = [(NTKComplicationCollection *)v7 complicationDescriptorsForClientIdentifier:v11];
            long long v72 = 0u;
            long long v73 = 0u;
            long long v74 = 0u;
            long long v75 = 0u;
            uint64_t v15 = [v14 countByEnumeratingWithState:&v72 objects:v85 count:16];
            if (v15)
            {
              uint64_t v16 = v15;
              uint64_t v17 = *(void *)v73;
              do
              {
                for (uint64_t i = 0; i != v16; ++i)
                {
                  if (*(void *)v73 != v17) {
                    objc_enumerationMutation(v14);
                  }
                  id v19 = [[NTKCompanionSyncedComplication alloc] initWithRemoteApplication:v13 descriptor:*(void *)(*((void *)&v72 + 1) + 8 * i)];
                  [v12 addObject:v19];
                }
                uint64_t v16 = [v14 countByEnumeratingWithState:&v72 objects:v85 count:16];
              }
              while (v16);
              int v7 = v53;
              id v3 = v54;
              uint64_t v9 = (uint64_t)v56;
            }
          }
          else
          {
            id v20 = [MEMORY[0x1E4F196C8] legacyComplicationDescriptor];
            __int16 v21 = [(NTKComplicationCollection *)v7 supportedTemplateFamiliesForClientIdentifier:v11 descriptor:v20];
            id v14 = [MEMORY[0x1E4F196C8] legacyComplicationDescriptorWithSupportedFamilies:v21];

            id v22 = [[NTKCompanionSyncedComplication alloc] initWithRemoteApplication:v13 descriptor:v14];
            [v12 addObject:v22];

            uint64_t v9 = (uint64_t)v56;
          }

          uint64_t v23 = (void *)[v12 copy];
          [v62 setObject:v23 forKeyedSubscript:v11];
        }
        ++v10;
      }
      while (v10 != v9);
      uint64_t v9 = [obj countByEnumeratingWithState:&v76 objects:v86 count:16];
    }
    while (v9);
  }
  if ((v58 & 1) == 0)
  {
    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    id v57 = [v3 allKeys];
    uint64_t v24 = [v57 countByEnumeratingWithState:&v68 objects:v84 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v69;
      uint64_t v51 = *(void *)v69;
      do
      {
        uint64_t v27 = 0;
        uint64_t v52 = v25;
        do
        {
          if (*(void *)v69 != v26) {
            objc_enumerationMutation(v57);
          }
          uint64_t v28 = *(void *)(*((void *)&v68 + 1) + 8 * v27);
          id v29 = [v62 allKeys];
          char v30 = [v29 containsObject:v28];

          if ((v30 & 1) == 0)
          {
            uint64_t v61 = [v54 objectForKeyedSubscript:v28];
            v31 = +[NTKCompanionAppLibrary sharedAppLibrary];
            long long v64 = 0u;
            long long v65 = 0u;
            long long v66 = 0u;
            long long v67 = 0u;
            v59 = v31;
            v32 = [v31 allApps];
            uint64_t v33 = [v32 countByEnumeratingWithState:&v64 objects:v83 count:16];
            if (v33)
            {
              uint64_t v34 = v33;
              uint64_t v35 = *(void *)v65;
LABEL_29:
              uint64_t v36 = 0;
              while (1)
              {
                if (*(void *)v65 != v35) {
                  objc_enumerationMutation(v32);
                }
                v37 = *(void **)(*((void *)&v64 + 1) + 8 * v36);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v38 = v37;
                  v39 = [v38 complicationClientIdentifier];
                  char v40 = [v39 isEqualToString:v28];

                  if (v40)
                  {

                    uint64_t v26 = v51;
                    uint64_t v25 = v52;
                    v41 = (void *)v61;
                    if (!v38) {
                      goto LABEL_43;
                    }
                    v42 = (void *)MEMORY[0x1E4F196C8];
                    v43 = [v38 supportedFamilies];
                    v44 = [v42 legacyComplicationDescriptorWithSupportedFamilies:v43];

                    v45 = [[NTKCompanionSyncedComplication alloc] initWithRemoteApplication:v61 descriptor:v44];
                    v82 = v45;
                    v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v82 count:1];
                    [v62 setObject:v46 forKeyedSubscript:v28];

                    goto LABEL_42;
                  }
                }
                if (v34 == ++v36)
                {
                  uint64_t v34 = [v32 countByEnumeratingWithState:&v64 objects:v83 count:16];
                  if (v34) {
                    goto LABEL_29;
                  }
                  id v38 = v32;
                  uint64_t v26 = v51;
                  uint64_t v25 = v52;
                  goto LABEL_41;
                }
              }
            }
            id v38 = v32;
LABEL_41:
            v41 = (void *)v61;
LABEL_42:

LABEL_43:
          }
          ++v27;
        }
        while (v27 != v25);
        uint64_t v25 = [v57 countByEnumeratingWithState:&v68 objects:v84 count:16];
      }
      while (v25);
    }

    int v7 = v53;
    id v3 = v54;
  }
  v47 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v81 = v62;
    _os_log_impl(&dword_1BC5A9000, v47, OS_LOG_TYPE_DEFAULT, "Complications did change: %@", buf, 0xCu);
  }

  os_unfair_lock_lock(&v50->_syncedComplicationsLock);
  uint64_t v48 = [v62 copy];
  syncedComplications = v50->_syncedComplications;
  v50->_syncedComplications = (NSDictionary *)v48;

  os_unfair_lock_unlock(&v50->_syncedComplicationsLock);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__NTKCompanionRemoteComplicationManager__queue_reloadApps__block_invoke;
  block[3] = &unk_1E62BFF20;
  block[4] = v50;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __58__NTKCompanionRemoteComplicationManager__queue_reloadApps__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"NTKRemoteComplicationProviderComplicationsDidChange" object:*(void *)(a1 + 32)];
}

- (void)_reloadApps
{
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__NTKCompanionRemoteComplicationManager__reloadApps__block_invoke;
  block[3] = &unk_1E62BFF20;
  block[4] = self;
  dispatch_async(serialQueue, block);
}

uint64_t __52__NTKCompanionRemoteComplicationManager__reloadApps__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchInstalledApps];
}

- (id)_safeComplications
{
  p_syncedComplicationsLock = &self->_syncedComplicationsLock;
  os_unfair_lock_lock(&self->_syncedComplicationsLock);
  dispatch_queue_t v4 = self->_syncedComplications;
  os_unfair_lock_unlock(p_syncedComplicationsLock);
  return v4;
}

- (id)_safeInstalledComplications
{
  p_installedComplicationsLock = &self->_installedComplicationsLock;
  os_unfair_lock_lock(&self->_installedComplicationsLock);
  dispatch_queue_t v4 = self->_installedComplications;
  os_unfair_lock_unlock(p_installedComplicationsLock);
  return v4;
}

- (void)enumerateEnabledVendorsForComplicationFamily:(int64_t)a3 withBlock:(id)a4
{
  id v6 = a4;
  int v7 = [(NTKCompanionRemoteComplicationManager *)self _safeComplications];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __96__NTKCompanionRemoteComplicationManager_enumerateEnabledVendorsForComplicationFamily_withBlock___block_invoke;
  aBlock[3] = &unk_1E62C1B38;
  id v14 = v6;
  int64_t v15 = a3;
  id v8 = v6;
  uint64_t v9 = _Block_copy(aBlock);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __96__NTKCompanionRemoteComplicationManager_enumerateEnabledVendorsForComplicationFamily_withBlock___block_invoke_2;
  v11[3] = &unk_1E62C1B60;
  id v12 = v9;
  id v10 = v9;
  [v7 enumerateKeysAndObjectsUsingBlock:v11];
}

uint64_t __96__NTKCompanionRemoteComplicationManager_enumerateEnabledVendorsForComplicationFamily_withBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_queue_t v4 = [v3 descriptor];
  id v5 = [v4 supportedFamilies];

  uint64_t v12 = *(void *)(a1 + 40);
  while (1)
  {
    id v6 = [NSNumber numberWithInteger:v12];
    uint64_t v7 = [v5 containsObject:v6];

    if (v7) {
      break;
    }
    if ((NTKFallbackComplicationFamilyForFamily(v12, &v12) & 1) == 0) {
      goto LABEL_6;
    }
  }
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = [v3 clientIdentifier];
  id v10 = [v3 appBundleIdentifier];
  (*(void (**)(uint64_t, void *, void *))(v8 + 16))(v8, v9, v10);

LABEL_6:
  return v7;
}

void __96__NTKCompanionRemoteComplicationManager_enumerateEnabledVendorsForComplicationFamily_withBlock___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v10 != v7) {
        objc_enumerationMutation(v4);
      }
      if ((*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32))) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v6) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (id)itemIdForVendorWithClientIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NTKCompanionRemoteComplicationManager *)self _safeInstalledComplications];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  uint64_t v7 = [v6 storeMetadata];
  uint64_t v8 = [v7 itemID];

  return v8;
}

- (void)enumerateComplicationDescriptorsForClientIdentifier:(id)a3 withBlock:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *, unsigned char *))a4;
  uint64_t v8 = [(NTKCompanionRemoteComplicationManager *)self _safeComplications];
  long long v9 = [v8 objectForKeyedSubscript:v6];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
LABEL_3:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v19 != v13) {
        objc_enumerationMutation(v10);
      }
      int64_t v15 = *(void **)(*((void *)&v18 + 1) + 8 * v14);
      char v17 = 0;
      uint64_t v16 = [v15 descriptor];
      v7[2](v7, v16, &v17);

      if (v17) {
        break;
      }
      if (v12 == ++v14)
      {
        uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v12) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)enumerateComplicationDescriptorsForClientIdentifier:(id)a3 family:(int64_t)a4 withBlock:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  long long v9 = (void (**)(id, void *))a5;
  id v10 = [(NTKCompanionRemoteComplicationManager *)self _safeComplications];
  id v22 = v8;
  uint64_t v11 = [v10 objectForKeyedSubscript:v8];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v11;
  uint64_t v12 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        char v17 = [v16 descriptor];
        long long v18 = [v17 supportedFamilies];
        long long v19 = [NSNumber numberWithInteger:a4];
        int v20 = [v18 containsObject:v19];

        if (v20)
        {
          long long v21 = [v16 descriptor];
          v9[2](v9, v21);
        }
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v13);
  }
}

- (void)notifyAppForClientIdentifier:(id)a3 ofSharedComplicationDescriptors:(id)a4 withCompletion:(id)a5
{
}

- (BOOL)vendorExistsWithClientIdentifier:(id)a3 appBundleIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NTKCompanionRemoteComplicationManager *)self _safeComplications];
  long long v9 = [v8 objectForKeyedSubscript:v7];

  id v10 = [v9 firstObject];

  uint64_t v11 = [v10 appBundleIdentifier];
  char v12 = [v11 isEqualToString:v6];

  return v12;
}

- (BOOL)isComplicationAvailable:(id)a3 forFamilies:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = CLKLoggingObjectForDomain();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v6;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v7;
    _os_log_impl(&dword_1BC5A9000, v8, OS_LOG_TYPE_DEFAULT, "Checking if complication is available %@ for families %@", buf, 0x16u);
  }

  long long v9 = [MEMORY[0x1E4F1CAD0] setWithArray:v7];
  *(void *)buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  char v20 = 0;
  id v10 = [v6 clientIdentifier];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __77__NTKCompanionRemoteComplicationManager_isComplicationAvailable_forFamilies___block_invoke;
  v15[3] = &unk_1E62C1BB0;
  id v11 = v6;
  id v16 = v11;
  id v12 = v9;
  id v17 = v12;
  long long v18 = buf;
  [(NTKCompanionRemoteComplicationManager *)self enumerateComplicationDescriptorsForClientIdentifier:v10 withBlock:v15];

  BOOL v13 = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;
  _Block_object_dispose(buf, 8);

  return v13;
}

void __77__NTKCompanionRemoteComplicationManager_isComplicationAvailable_forFamilies___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  id v6 = [*(id *)(a1 + 32) complicationDescriptor];
  int v7 = [v5 isEqual:v6];

  if (v7)
  {
    uint64_t v12 = 0;
    BOOL v13 = &v12;
    uint64_t v14 = 0x2020000000;
    char v15 = 0;
    id v8 = [v5 supportedFamilies];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __77__NTKCompanionRemoteComplicationManager_isComplicationAvailable_forFamilies___block_invoke_2;
    v9[3] = &unk_1E62C1B88;
    id v10 = *(id *)(a1 + 40);
    id v11 = &v12;
    [v8 enumerateObjectsUsingBlock:v9];

    if (*((unsigned char *)v13 + 24))
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      *a3 = 1;
    }

    _Block_object_dispose(&v12, 8);
  }
}

uint64_t __77__NTKCompanionRemoteComplicationManager_isComplicationAvailable_forFamilies___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [*(id *)(a1 + 32) containsObject:a2];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (id)localizedAppNameForClientIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(NTKCompanionRemoteComplicationManager *)self _safeComplications];
  id v6 = [v5 objectForKeyedSubscript:v4];
  int v7 = [v6 firstObject];

  if (!v7)
  {
    id v8 = [(NTKCompanionRemoteComplicationManager *)self _safeInstalledComplications];
    long long v9 = [v8 objectForKeyedSubscript:v4];
    id v10 = [NTKCompanionSyncedComplication alloc];
    id v11 = [MEMORY[0x1E4F196C8] legacyComplicationDescriptor];
    int v7 = [(NTKCompanionSyncedComplication *)v10 initWithRemoteApplication:v9 descriptor:v11];
  }
  uint64_t v12 = [(NTKCompanionSyncedComplication *)v7 localizedName];

  return v12;
}

- (void)setLoaded:(BOOL)a3
{
  self->_loaded = a3;
}

- (CLKDevice)device
{
  return self->_device;
}

- (os_unfair_lock_s)remoteComplicationsLock
{
  return self->_remoteComplicationsLock;
}

- (NSDictionary)installedComplications
{
  return self->_installedComplications;
}

- (void)setInstalledComplications:(id)a3
{
}

- (os_unfair_lock_s)installedComplicationsLock
{
  return self->_installedComplicationsLock;
}

- (NSDictionary)syncedComplications
{
  return self->_syncedComplications;
}

- (void)setSyncedComplications:(id)a3
{
}

- (os_unfair_lock_s)syncedComplicationsLock
{
  return self->_syncedComplicationsLock;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (BOOL)fetchingApps
{
  return self->_fetchingApps;
}

- (void)setFetchingApps:(BOOL)a3
{
  self->_fetchingApps = a3;
}

- (BOOL)wantsAppFetch
{
  return self->_wantsAppFetch;
}

- (void)setWantsAppFetch:(BOOL)a3
{
  self->_BOOL wantsAppFetch = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_syncedComplications, 0);
  objc_storeStrong((id *)&self->_installedComplications, 0);
  objc_storeStrong((id *)&self->_remoteComplications, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

void __60__NTKCompanionRemoteComplicationManager__queryInstalledApps__block_invoke_2_17_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3(&dword_1BC5A9000, v1, v2, "Could not check restrictions for app with bundleID: %@ - %@", (void)v3, DWORD2(v3));
}

void __60__NTKCompanionRemoteComplicationManager__queryInstalledApps__block_invoke_2_22_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 32);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3(&dword_1BC5A9000, v1, v2, "Couldn't fetch apps on device %@: %@", (void)v3, DWORD2(v3));
}

@end