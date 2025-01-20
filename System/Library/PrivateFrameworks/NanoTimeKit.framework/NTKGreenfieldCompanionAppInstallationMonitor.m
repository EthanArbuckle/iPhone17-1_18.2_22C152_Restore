@interface NTKGreenfieldCompanionAppInstallationMonitor
+ (id)sharedMonitor;
- (NTKGreenfieldCompanionAppInstallationMonitor)init;
- (id)_existingPlaceholderItemIds;
- (id)_queue_calculatePendingRemovalItemIdsWithExistingPlaceholderIds:(id)a3;
- (id)_queue_fetchInstalledWatchAppsItemIds;
- (id)_queue_fetchNotInstalledWatchAppStatus;
- (void)_existingPlaceholderItemIds;
- (void)_reloadInstallingAppsOnPhoneAndWatch;
- (void)_removePlaceholderComplicationWithItemIds:(id)a3;
- (void)_toggleObserving;
- (void)applicationInstallsDidCancel:(id)a3;
- (void)applicationInstallsDidStart:(id)a3;
- (void)applicationsDidFailToInstall:(id)a3;
- (void)applicationsDidInstall:(id)a3;
- (void)dealloc;
- (void)fetchInstalledAppsOnWatchWithCompletionBlock:(id)a3;
- (void)handleAddFaceManagerDidUpdateFaceLibrary;
- (void)start;
@end

@implementation NTKGreenfieldCompanionAppInstallationMonitor

- (void)start
{
  if (!self->_isRunning)
  {
    v3 = [MEMORY[0x1E4F19A30] currentDevice];
    v4 = +[NTKCompanionFaceCollectionsManager sharedInstance];
    v5 = [v4 sharedFaceCollectionForDevice:v3 forCollectionIdentifier:@"LibraryFaces"];
    library = self->_library;
    self->_library = v5;

    if ([(NTKFaceCollection *)self->_library hasLoaded]) {
      [(NTKGreenfieldCompanionAppInstallationMonitor *)self _toggleObserving];
    }
    else {
      [(NTKFaceCollection *)self->_library addObserver:self];
    }
    self->_isRunning = 1;
    v7 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1BC5A9000, v7, OS_LOG_TYPE_DEFAULT, "NTKGreenfieldCompanionAppInstallationMonitor: started", v8, 2u);
    }
  }
}

void __61__NTKGreenfieldCompanionAppInstallationMonitor_sharedMonitor__block_invoke()
{
  v0 = objc_alloc_init(NTKGreenfieldCompanionAppInstallationMonitor);
  v1 = (void *)sharedMonitor_monitor;
  sharedMonitor_monitor = (uint64_t)v0;
}

- (NTKGreenfieldCompanionAppInstallationMonitor)init
{
  v6.receiver = self;
  v6.super_class = (Class)NTKGreenfieldCompanionAppInstallationMonitor;
  v2 = [(NTKGreenfieldCompanionAppInstallationMonitor *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.nanotimekit.NTKGreenfieldCompanionAppInstallationMonitor", 0);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

+ (id)sharedMonitor
{
  if (sharedMonitor_onceToken != -1) {
    dispatch_once(&sharedMonitor_onceToken, &__block_literal_global_57);
  }
  v2 = (void *)sharedMonitor_monitor;

  return v2;
}

- (void)dealloc
{
  [(NTKFaceCollection *)self->_library removeObserver:self];
  dispatch_queue_t v3 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v3 removeObserver:self];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v5.receiver = self;
  v5.super_class = (Class)NTKGreenfieldCompanionAppInstallationMonitor;
  [(NTKGreenfieldCompanionAppInstallationMonitor *)&v5 dealloc];
}

- (void)fetchInstalledAppsOnWatchWithCompletionBlock:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __93__NTKGreenfieldCompanionAppInstallationMonitor_fetchInstalledAppsOnWatchWithCompletionBlock___block_invoke;
  block[3] = &unk_1E62C0718;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(serialQueue, block);
}

void __93__NTKGreenfieldCompanionAppInstallationMonitor_fetchInstalledAppsOnWatchWithCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__23;
  v57 = __Block_byref_object_dispose__23;
  id v58 = 0;
  v51[0] = 0;
  v51[1] = v51;
  v51[2] = 0x3032000000;
  v51[3] = __Block_byref_object_copy__23;
  v51[4] = __Block_byref_object_dispose__23;
  id v52 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__23;
  v49 = __Block_byref_object_dispose__23;
  id v50 = [MEMORY[0x1E4F1CA80] set];
  v2 = [MEMORY[0x1E4F19A30] currentDevice];
  dispatch_queue_t v3 = [v2 nrDevice];

  id v4 = [MEMORY[0x1E4F4AC68] sharedDeviceConnection];
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __93__NTKGreenfieldCompanionAppInstallationMonitor_fetchInstalledAppsOnWatchWithCompletionBlock___block_invoke_10;
  v40[3] = &unk_1E62C3E30;
  id v6 = v5;
  v41 = v6;
  v42 = &v53;
  v43 = v51;
  v44 = &v45;
  [v4 enumerateInstalledApplicationsOnPairedDevice:v3 withBlock:v40];
  dispatch_time_t v7 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v6, v7);
  if (!v54[5])
  {
    if ([(id)v46[5] count])
    {
      v9 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = v46[5];
        *(_DWORD *)buf = 138412290;
        uint64_t v60 = v10;
        _os_log_impl(&dword_1BC5A9000, v9, OS_LOG_TYPE_DEFAULT, "(NTKGreenfieldCompanionAppInstallationMonitor) Started SAD ItemID lookup %@:", buf, 0xCu);
      }

      dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
      v12 = (void *)MEMORY[0x1E4F4BBD8];
      v13 = [(id)v46[5] allObjects];
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __93__NTKGreenfieldCompanionAppInstallationMonitor_fetchInstalledAppsOnWatchWithCompletionBlock___block_invoke_14;
      v32[3] = &unk_1E62C3E58;
      v34 = &v53;
      v35 = v51;
      v36 = &v45;
      id v6 = v11;
      v33 = v6;
      [v12 lookupItemIDsForDeletableSystemAppsForWatchWithBundleIDs:v13 withResultHandler:v32];

      dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
      if (v54[5])
      {
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __93__NTKGreenfieldCompanionAppInstallationMonitor_fetchInstalledAppsOnWatchWithCompletionBlock___block_invoke_16;
        v29[3] = &unk_1E62C3280;
        id v30 = *(id *)(a1 + 32);
        v31 = &v53;
        dispatch_async(MEMORY[0x1E4F14428], v29);

        id v8 = v33;
        goto LABEL_3;
      }
    }
    if ([(id)v46[5] count])
    {
      dispatch_semaphore_t v14 = dispatch_semaphore_create(0);

      v15 = (void *)MEMORY[0x1E4F4BBE0];
      v16 = [(id)v46[5] allObjects];
      id v8 = [v15 queryForBundleIDs:v16];

      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __93__NTKGreenfieldCompanionAppInstallationMonitor_fetchInstalledAppsOnWatchWithCompletionBlock___block_invoke_2;
      v25[3] = &unk_1E62C3E80;
      v27 = &v53;
      v28 = v51;
      id v6 = v14;
      v26 = v6;
      [v8 executeQueryWithResultHandler:v25];
      dispatch_time_t v17 = dispatch_time(0, 5000000000);
      dispatch_semaphore_wait(v6, v17);
      if (v54[5])
      {
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __93__NTKGreenfieldCompanionAppInstallationMonitor_fetchInstalledAppsOnWatchWithCompletionBlock___block_invoke_3;
        v22[3] = &unk_1E62C3280;
        id v23 = *(id *)(a1 + 32);
        v24 = &v53;
        dispatch_async(MEMORY[0x1E4F14428], v22);

        goto LABEL_3;
      }
    }
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __93__NTKGreenfieldCompanionAppInstallationMonitor_fetchInstalledAppsOnWatchWithCompletionBlock___block_invoke_4;
    v18[3] = &unk_1E62C3EA8;
    id v19 = *(id *)(a1 + 32);
    v20 = v51;
    v21 = &v45;
    dispatch_async(MEMORY[0x1E4F14428], v18);
    id v8 = v19;
    goto LABEL_3;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __93__NTKGreenfieldCompanionAppInstallationMonitor_fetchInstalledAppsOnWatchWithCompletionBlock___block_invoke_12;
  block[3] = &unk_1E62C3280;
  id v38 = *(id *)(a1 + 32);
  v39 = &v53;
  dispatch_async(MEMORY[0x1E4F14428], block);
  id v8 = v38;
LABEL_3:

  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(v51, 8);

  _Block_object_dispose(&v53, 8);
}

uint64_t __93__NTKGreenfieldCompanionAppInstallationMonitor_fetchInstalledAppsOnWatchWithCompletionBlock___block_invoke_10(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5 = a2;
  unint64_t v6 = a3;
  dispatch_time_t v7 = (void *)v6;
  if (v5 | v6)
  {
    if (v6)
    {
      id v8 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __93__NTKGreenfieldCompanionAppInstallationMonitor_fetchInstalledAppsOnWatchWithCompletionBlock___block_invoke_10_cold_1();
      }

      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
      goto LABEL_6;
    }
    dispatch_semaphore_t v11 = [(id)v5 storeMetadata];
    v12 = [v11 itemID];

    if (v12)
    {
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v12];
LABEL_15:

      uint64_t v9 = 1;
      goto LABEL_7;
    }
    v13 = [(id)v5 bundleIdentifier];

    if (v13)
    {
      dispatch_semaphore_t v14 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      uint64_t v15 = [(id)v5 bundleIdentifier];
    }
    else
    {
      v16 = [(id)v5 companionAppBundleID];

      if (!v16) {
        goto LABEL_15;
      }
      dispatch_semaphore_t v14 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      uint64_t v15 = [(id)v5 companionAppBundleID];
    }
    dispatch_time_t v17 = (void *)v15;
    [v14 addObject:v15];

    goto LABEL_15;
  }
LABEL_6:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  uint64_t v9 = 0;
LABEL_7:

  return v9;
}

uint64_t __93__NTKGreenfieldCompanionAppInstallationMonitor_fetchInstalledAppsOnWatchWithCompletionBlock___block_invoke_12(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 0, 0, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

void __93__NTKGreenfieldCompanionAppInstallationMonitor_fetchInstalledAppsOnWatchWithCompletionBlock___block_invoke_14(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  dispatch_time_t v7 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __93__NTKGreenfieldCompanionAppInstallationMonitor_fetchInstalledAppsOnWatchWithCompletionBlock___block_invoke_14_cold_1((uint64_t)v6, v8);
    }

    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    id v10 = v6;
    dispatch_semaphore_t v11 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v10;
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v5;
      _os_log_impl(&dword_1BC5A9000, v8, OS_LOG_TYPE_DEFAULT, "(NTKGreenfieldCompanionAppInstallationMonitor) Completed SAD ItemID lookup finished with result %@:", buf, 0xCu);
    }

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    dispatch_semaphore_t v11 = objc_msgSend(v5, "allKeys", 0);
    uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v19 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          dispatch_time_t v17 = [v5 objectForKeyedSubscript:v16];
          if (v17)
          {
            [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v17];
            [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) removeObject:v16];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v13);
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __93__NTKGreenfieldCompanionAppInstallationMonitor_fetchInstalledAppsOnWatchWithCompletionBlock___block_invoke_16(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 0, 0, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

void __93__NTKGreenfieldCompanionAppInstallationMonitor_fetchInstalledAppsOnWatchWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  else
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v5);
          }
          dispatch_semaphore_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if ([v11 storeItemID] >= 1)
          {
            uint64_t v12 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
            uint64_t v13 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v11, "storeItemID"));
            [v12 addObject:v13];
          }
        }
        uint64_t v8 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __93__NTKGreenfieldCompanionAppInstallationMonitor_fetchInstalledAppsOnWatchWithCompletionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 0, 0, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

uint64_t __93__NTKGreenfieldCompanionAppInstallationMonitor_fetchInstalledAppsOnWatchWithCompletionBlock___block_invoke_4(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[4] + 16))(a1[4], *(void *)(*(void *)(a1[5] + 8) + 40), *(void *)(*(void *)(a1[6] + 8) + 40), 0);
}

- (void)handleAddFaceManagerDidUpdateFaceLibrary
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if ([(NTKFaceCollection *)self->_library hasLoaded])
  {
    [(NTKGreenfieldCompanionAppInstallationMonitor *)self _toggleObserving];
  }
}

- (void)_toggleObserving
{
}

- (void)_reloadInstallingAppsOnPhoneAndWatch
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  dispatch_queue_t v3 = [(NTKGreenfieldCompanionAppInstallationMonitor *)self _existingPlaceholderItemIds];
  serialQueue = self->_serialQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __84__NTKGreenfieldCompanionAppInstallationMonitor__reloadInstallingAppsOnPhoneAndWatch__block_invoke;
  v6[3] = &unk_1E62C09C0;
  v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(serialQueue, v6);
}

void __84__NTKGreenfieldCompanionAppInstallationMonitor__reloadInstallingAppsOnPhoneAndWatch__block_invoke(uint64_t a1)
{
  v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_calculatePendingRemovalItemIdsWithExistingPlaceholderIds:", *(void *)(a1 + 40));
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __84__NTKGreenfieldCompanionAppInstallationMonitor__reloadInstallingAppsOnPhoneAndWatch__block_invoke_2;
  v4[3] = &unk_1E62C09C0;
  v4[4] = *(void *)(a1 + 32);
  id v5 = v2;
  id v3 = v2;
  dispatch_async(MEMORY[0x1E4F14428], v4);
}

uint64_t __84__NTKGreenfieldCompanionAppInstallationMonitor__reloadInstallingAppsOnPhoneAndWatch__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removePlaceholderComplicationWithItemIds:*(void *)(a1 + 40)];
}

- (id)_queue_fetchInstalledWatchAppsItemIds
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  uint64_t v14 = 0;
  long long v15 = &v14;
  uint64_t v16 = 0x3032000000;
  long long v17 = __Block_byref_object_copy__23;
  long long v18 = __Block_byref_object_dispose__23;
  id v19 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __85__NTKGreenfieldCompanionAppInstallationMonitor__queue_fetchInstalledWatchAppsItemIds__block_invoke;
  dispatch_semaphore_t v11 = &unk_1E62C3ED0;
  uint64_t v13 = &v14;
  id v4 = v3;
  uint64_t v12 = v4;
  [(NTKGreenfieldCompanionAppInstallationMonitor *)self fetchInstalledAppsOnWatchWithCompletionBlock:&v8];
  dispatch_time_t v5 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v4, v5);
  id v6 = objc_msgSend((id)v15[5], "copy", v8, v9, v10, v11);

  _Block_object_dispose(&v14, 8);

  return v6;
}

void __85__NTKGreenfieldCompanionAppInstallationMonitor__queue_fetchInstalledWatchAppsItemIds__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_queue_fetchNotInstalledWatchAppStatus
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  dispatch_semaphore_t v3 = [MEMORY[0x1E4F4AC68] sharedDeviceConnection];
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  dispatch_time_t v5 = [MEMORY[0x1E4F19A30] currentDevice];
  id v6 = [v5 nrDevice];

  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __86__NTKGreenfieldCompanionAppInstallationMonitor__queue_fetchNotInstalledWatchAppStatus__block_invoke;
  long long v15 = &unk_1E62C3EF8;
  dispatch_semaphore_t v16 = v4;
  id v17 = v2;
  id v7 = v2;
  uint64_t v8 = v4;
  [v3 enumerateLocallyAvailableApplicationsForPairedDevice:v6 options:1 withBlock:&v12];
  dispatch_time_t v9 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v8, v9);
  id v10 = objc_msgSend(v7, "copy", v12, v13, v14, v15);

  return v10;
}

uint64_t __86__NTKGreenfieldCompanionAppInstallationMonitor__queue_fetchNotInstalledWatchAppStatus__block_invoke(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5 = a2;
  unint64_t v6 = a3;
  id v7 = (void *)v6;
  if (!(v5 | v6))
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
LABEL_7:
    uint64_t v9 = 0;
    goto LABEL_8;
  }
  if (v6)
  {
    uint64_t v8 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __93__NTKGreenfieldCompanionAppInstallationMonitor_fetchInstalledAppsOnWatchWithCompletionBlock___block_invoke_10_cold_1();
    }

    goto LABEL_7;
  }
  dispatch_semaphore_t v11 = [(id)v5 storeMetadata];
  uint64_t v12 = [v11 itemID];

  if (v12)
  {
    uint64_t v13 = [(id)v5 deviceStatus];
    [*(id *)(a1 + 40) setObject:v13 forKeyedSubscript:v12];
  }
  uint64_t v9 = 1;
LABEL_8:

  return v9;
}

- (id)_queue_calculatePendingRemovalItemIdsWithExistingPlaceholderIds:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  unint64_t v5 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[NTKGreenfieldCompanionAppInstallationMonitor _queue_calculatePendingRemovalItemIdsWithExistingPlaceholderIds:]((uint64_t)v4, v5);
  }

  id v24 = [(NTKGreenfieldCompanionAppInstallationMonitor *)self _queue_fetchInstalledWatchAppsItemIds];
  unint64_t v6 = [(NTKGreenfieldCompanionAppInstallationMonitor *)self _queue_fetchNotInstalledWatchAppStatus];
  id v23 = [MEMORY[0x1E4F1CA80] set];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v4;
  uint64_t v7 = [obj countByEnumeratingWithState:&v25 objects:v35 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v26;
    *(void *)&long long v8 = 138412802;
    long long v21 = v8;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F223C8]), "initWithStoreItemIdentifier:error:", objc_msgSend(v12, "unsignedLongLongValue"), 0);
        uint64_t v14 = [v13 applicationState];
        int v15 = [v24 containsObject:v12];
        uint64_t v16 = [v6 objectForKeyedSubscript:v12];
        id v17 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v21;
          uint64_t v30 = v14;
          __int16 v31 = 1024;
          int v32 = v15;
          __int16 v33 = 2112;
          uint64_t v34 = v16;
          _os_log_impl(&dword_1BC5A9000, v17, OS_LOG_TYPE_DEFAULT, "NTKGreenfieldCompanionAppInstallationMonitor: enumerateInstalledApplicationsOnPairedDevice: decision time:\n\t[phoneAppState=%@]\n\t[installedOnWatch=%d]\n\t[watchAppStatus=%@\n", buf, 0x1Cu);
        }

        if ((v15 & 1) != 0
          || !(v14 | v16)
          || v16 && (unint64_t v18 = [(id)v16 installStatus], v18 <= 4) && v18 != 1)
        {
          objc_msgSend(v23, "addObject:", v12, v21);
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v25 objects:v35 count:16];
    }
    while (v9);
  }

  id v19 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v30 = (uint64_t)v23;
    _os_log_impl(&dword_1BC5A9000, v19, OS_LOG_TYPE_DEFAULT, "NTKGreenfieldCompanionAppInstallationMonitor: calculated removal ids: %@", buf, 0xCu);
  }

  return v23;
}

- (id)_existingPlaceholderItemIds
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (![(NTKFaceCollection *)self->_library hasLoaded]) {
    -[NTKGreenfieldCompanionAppInstallationMonitor _existingPlaceholderItemIds]();
  }
  dispatch_semaphore_t v3 = [MEMORY[0x1E4F1CA80] set];
  if ([(NTKFaceCollection *)self->_library numberOfFaces])
  {
    unint64_t v4 = 0;
    do
    {
      unint64_t v5 = [(NTKFaceCollection *)self->_library faceAtIndex:v4];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __75__NTKGreenfieldCompanionAppInstallationMonitor__existingPlaceholderItemIds__block_invoke;
      v9[3] = &unk_1E62C18C8;
      id v10 = v5;
      id v11 = v3;
      id v6 = v5;
      [v6 enumerateComplicationSlotsWithBlock:v9];

      ++v4;
    }
    while ([(NTKFaceCollection *)self->_library numberOfFaces] > v4);
  }
  uint64_t v7 = (void *)[v3 copy];

  return v7;
}

void __75__NTKGreenfieldCompanionAppInstallationMonitor__existingPlaceholderItemIds__block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) complicationForSlot:a2];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    dispatch_semaphore_t v3 = [v4 appStoreItemId];
    [*(id *)(a1 + 40) addObject:v3];
  }
}

- (void)_removePlaceholderComplicationWithItemIds:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (![(NTKFaceCollection *)self->_library hasLoaded]) {
    -[NTKGreenfieldCompanionAppInstallationMonitor _removePlaceholderComplicationWithItemIds:]();
  }
  if ([(NTKFaceCollection *)self->_library numberOfFaces])
  {
    unint64_t v5 = 0;
    do
    {
      id v6 = [(NTKFaceCollection *)self->_library faceAtIndex:v5];
      uint64_t v14 = 0;
      int v15 = &v14;
      uint64_t v16 = 0x2020000000;
      char v17 = 0;
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __90__NTKGreenfieldCompanionAppInstallationMonitor__removePlaceholderComplicationWithItemIds___block_invoke;
      v10[3] = &unk_1E62C2F60;
      id v7 = v6;
      id v11 = v7;
      id v12 = v4;
      uint64_t v13 = &v14;
      [v7 enumerateComplicationSlotsWithBlock:v10];
      if (*((unsigned char *)v15 + 24)) {
        [v7 _updateComplicationTombstones];
      }

      _Block_object_dispose(&v14, 8);
      ++v5;
    }
    while ([(NTKFaceCollection *)self->_library numberOfFaces] > v5);
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __90__NTKGreenfieldCompanionAppInstallationMonitor__removePlaceholderComplicationWithItemIds___block_invoke_29;
  v9[3] = &unk_1E62BFF20;
  void v9[4] = self;
  long long v8 = (void *)MEMORY[0x1E4F14428];
  dispatch_async(MEMORY[0x1E4F14428], v9);
}

void __90__NTKGreenfieldCompanionAppInstallationMonitor__removePlaceholderComplicationWithItemIds___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) complicationForSlot:v3];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [v5 appStoreItemId];
    if ([*(id *)(a1 + 40) containsObject:v6])
    {
      id v7 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 138412546;
        id v11 = v3;
        __int16 v12 = 2112;
        uint64_t v13 = v6;
        _os_log_impl(&dword_1BC5A9000, v7, OS_LOG_TYPE_DEFAULT, "NTKGreenfieldCompanionAppInstallationMonitor: _removePlaceholderComplicationWithItemIds: need to remove: slot:%@ itemId: %@ ", (uint8_t *)&v10, 0x16u);
      }

      long long v8 = [v5 complication];
      uint64_t v9 = +[NTKComplicationTombstone tombstoneWithComplication:v8];
      [*(id *)(a1 + 32) setComplication:v9 forSlot:v3];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
  }
}

uint64_t __90__NTKGreenfieldCompanionAppInstallationMonitor__removePlaceholderComplicationWithItemIds___block_invoke_29(uint64_t a1)
{
  return [*(id *)(a1 + 32) _toggleObserving];
}

- (void)applicationInstallsDidStart:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_1BC5A9000, v5, OS_LOG_TYPE_DEFAULT, "NTKGreenfieldCompanionAppInstallationMonitor: applicationInstallsDidStart: %@", buf, 0xCu);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__NTKGreenfieldCompanionAppInstallationMonitor_applicationInstallsDidStart___block_invoke;
  block[3] = &unk_1E62BFF20;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __76__NTKGreenfieldCompanionAppInstallationMonitor_applicationInstallsDidStart___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadInstallingAppsOnPhoneAndWatch];
}

- (void)applicationsDidInstall:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_1BC5A9000, v5, OS_LOG_TYPE_DEFAULT, "NTKGreenfieldCompanionAppInstallationMonitor: applicationsDidInstall: %@", buf, 0xCu);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__NTKGreenfieldCompanionAppInstallationMonitor_applicationsDidInstall___block_invoke;
  block[3] = &unk_1E62BFF20;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __71__NTKGreenfieldCompanionAppInstallationMonitor_applicationsDidInstall___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadInstallingAppsOnPhoneAndWatch];
}

- (void)applicationsDidFailToInstall:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_1BC5A9000, v5, OS_LOG_TYPE_DEFAULT, "NTKGreenfieldCompanionAppInstallationMonitor: applicationsDidFailToInstall: %@", buf, 0xCu);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__NTKGreenfieldCompanionAppInstallationMonitor_applicationsDidFailToInstall___block_invoke;
  block[3] = &unk_1E62BFF20;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __77__NTKGreenfieldCompanionAppInstallationMonitor_applicationsDidFailToInstall___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadInstallingAppsOnPhoneAndWatch];
}

- (void)applicationInstallsDidCancel:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_1BC5A9000, v5, OS_LOG_TYPE_DEFAULT, "NTKGreenfieldCompanionAppInstallationMonitor: applicationInstallsDidCancel: %@", buf, 0xCu);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__NTKGreenfieldCompanionAppInstallationMonitor_applicationInstallsDidCancel___block_invoke;
  block[3] = &unk_1E62BFF20;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __77__NTKGreenfieldCompanionAppInstallationMonitor_applicationInstallsDidCancel___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadInstallingAppsOnPhoneAndWatch];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_library, 0);

  objc_storeStrong((id *)&self->_serialQueue, 0);
}

void __93__NTKGreenfieldCompanionAppInstallationMonitor_fetchInstalledAppsOnWatchWithCompletionBlock___block_invoke_10_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_1BC5A9000, v0, v1, "NTKGreenfieldCompanionAppInstallationMonitor: enumerateInstalledApplicationsOnPairedDevice: exiting loop, error: %@, app: %@");
}

void __93__NTKGreenfieldCompanionAppInstallationMonitor_fetchInstalledAppsOnWatchWithCompletionBlock___block_invoke_14_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BC5A9000, a2, OS_LOG_TYPE_ERROR, "(NTKGreenfieldCompanionAppInstallationMonitor) Completed SAD ItemID lookup finished with error %@:", (uint8_t *)&v2, 0xCu);
}

- (void)_queue_calculatePendingRemovalItemIdsWithExistingPlaceholderIds:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BC5A9000, a2, OS_LOG_TYPE_ERROR, "NTKGreenfieldCompanionAppInstallationMonitor: _queue_updateWithExistingPlaceholderIds: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_existingPlaceholderItemIds
{
}

- (void)_removePlaceholderComplicationWithItemIds:.cold.1()
{
}

@end