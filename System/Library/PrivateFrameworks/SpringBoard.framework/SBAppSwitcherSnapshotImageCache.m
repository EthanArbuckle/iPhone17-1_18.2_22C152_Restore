@interface SBAppSwitcherSnapshotImageCache
- (BOOL)_isValidAppLayout:(id)a3 withSnapshot:(id)a4 givenCachableAppLayouts:(id)a5;
- (BOOL)_isValidSnapshotRequest:(id)a3;
- (BOOL)_keepGoingForRequest:(id)a3;
- (BOOL)reloadsSnapshotsForActiveInterfaceOrientationChange;
- (NSArray)cachableAppLayouts;
- (NSArray)fullSizeCachableAppLayouts;
- (NSString)debugName;
- (NSString)description;
- (SBAppSwitcherSnapshotImageCache)init;
- (SBAppSwitcherSnapshotImageCache)initWithDelegate:(id)a3;
- (SBAppSwitcherSnapshotImageCacheDelegate)delegate;
- (id)_cachableAppLayoutsRequiringFullSizeSnapshots;
- (id)_createSnapshotRequestWithDisplayItem:(id)a3 inAppLayout:(id)a4 forFullSizeSnapshot:(BOOL)a5;
- (id)_initWithDelegate:(id)a3 iconController:(id)a4 applicationController:(id)a5 orientationLockManager:(id)a6 settings:(id)a7;
- (id)_representedApplicationSceneEntityForDisplayItem:(id)a3;
- (int64_t)_orientationForAppLayout:(id)a3;
- (void)_addCacheEntryForImage:(id)a3 fromRequest:(id)a4;
- (void)_addObserver:(id)a3 forDisplayItem:(id)a4 inAppLayout:(id)a5;
- (void)_asynchronouslyLoadSnapshotFromRequest:(id)a3;
- (void)_cacheSnapshotForRequest:(id)a3 withDisplayItem:(id)a4 inAppLayout:(id)a5;
- (void)_createDownscaledVariantForRequest:(id)a3 snapshot:(id)a4 displayItem:(id)a5 sceneHandle:(id)a6 application:(id)a7;
- (void)_enqueueNextSnapshotRequestIfNecessary;
- (void)_enqueueSnapshotRequestsForCachableAppLayouts:(id)a3 forFullSizeSnapshots:(BOOL)a4;
- (void)_loadSnapshotForRequest:(id)a3 withDisplayItem:(id)a4 inAppLayout:(id)a5;
- (void)_purgeAllSnapshotRequests;
- (void)_purgeAllSnapshots;
- (void)_purgeLowPriorityFullSizeSnapshotRequests;
- (void)_purgeLowPriorityFullSizeSnapshots;
- (void)_purgeLowPrioritySnapshotRequests;
- (void)_purgeLowPrioritySnapshots;
- (void)_purgeSnapshotRequest:(id)a3 withReason:(id)a4;
- (void)_purgeSnapshotRequestsForDisplayItem:(id)a3 withReason:(id)a4;
- (void)_purgeSnapshotsForKey:(id)a3;
- (void)_setShouldPurgeNilEntry:(BOOL)a3;
- (void)_setSnapshotNeedsUpdateForDisplayItem:(id)a3;
- (void)_snapshotChanged:(id)a3;
- (void)_snapshotImage:(id)a3 finishedLoadingForRequest:(id)a4;
- (void)_updateActiveOrientationObservingIfNeeded;
- (void)_updateCache;
- (void)_updateCacheForDisplayItem:(id)a3;
- (void)_updateObserversForDisplayItem:(id)a3 inAppLayout:(id)a4 withCacheEntry:(id)a5;
- (void)activeInterfaceOrientationDidChangeToOrientation:(int64_t)a3 willAnimateWithDuration:(double)a4 fromOrientation:(int64_t)a5;
- (void)addSnapshotUpdateObserver:(id)a3 forDisplayItem:(id)a4 inAppLayout:(id)a5;
- (void)dealloc;
- (void)reloadSnapshotsForInterfaceStyleChange:(int64_t)a3;
- (void)removeSnapshotObserver:(id)a3;
- (void)setCachableAppLayouts:(id)a3;
- (void)setDebugName:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFullSizeCachableAppLayouts:(id)a3;
- (void)setReloadsSnapshotsForActiveInterfaceOrientationChange:(BOOL)a3;
@end

@implementation SBAppSwitcherSnapshotImageCache

- (void)setFullSizeCachableAppLayouts:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssertMain();
  controlQueue = self->_controlQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__SBAppSwitcherSnapshotImageCache_setFullSizeCachableAppLayouts___block_invoke;
  v7[3] = &unk_1E6AF5290;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(controlQueue, v7);
}

- (void)setCachableAppLayouts:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssertMain();
  controlQueue = self->_controlQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__SBAppSwitcherSnapshotImageCache_setCachableAppLayouts___block_invoke;
  v7[3] = &unk_1E6AF5290;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(controlQueue, v7);
}

uint64_t __57__SBAppSwitcherSnapshotImageCache_setCachableAppLayouts___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 32);
  uint64_t result = BSEqualArrays();
  if ((result & 1) == 0)
  {
    uint64_t v4 = [*(id *)(a1 + 40) copy];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 128);
    *(void *)(v5 + 128) = v4;

    v7 = SBLogSwitcherSnapshotCache();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __57__SBAppSwitcherSnapshotImageCache_setCachableAppLayouts___block_invoke_cold_1();
    }

    return [*v2 _updateCache];
  }
  return result;
}

uint64_t __65__SBAppSwitcherSnapshotImageCache_setFullSizeCachableAppLayouts___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 32);
  uint64_t result = BSEqualArrays();
  if ((result & 1) == 0)
  {
    uint64_t v4 = [*(id *)(a1 + 40) copy];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 136);
    *(void *)(v5 + 136) = v4;

    v7 = SBLogSwitcherSnapshotCache();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __65__SBAppSwitcherSnapshotImageCache_setFullSizeCachableAppLayouts___block_invoke_cold_1();
    }

    return [*v2 _updateCache];
  }
  return result;
}

- (void)_addObserver:(id)a3 forDisplayItem:(id)a4 inAppLayout:(id)a5
{
  id v12 = a3;
  id v8 = a5;
  id v9 = a4;
  BSDispatchQueueAssert();
  v10 = [[_SBAppSwitcherSnapshotCacheKey alloc] initWithDisplayItem:v9 inAppLayout:v8];

  v11 = [(NSMutableDictionary *)self->_cacheEntryUpdateObservers objectForKey:v10];
  if (!v11)
  {
    v11 = [MEMORY[0x1E4F1CA80] set];
    [(NSMutableDictionary *)self->_cacheEntryUpdateObservers setObject:v11 forKey:v10];
  }
  [v11 addObject:v12];
}

- (void)addSnapshotUpdateObserver:(id)a3 forDisplayItem:(id)a4 inAppLayout:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  BSDispatchQueueAssertMain();
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
LABEL_13:
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"SBAppSwitcherSnapshotImageCache.m", 346, @"Invalid parameter not satisfying: %@", @"item != nil" object file lineNumber description];

    if (v11) {
      goto LABEL_4;
    }
LABEL_14:
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"SBAppSwitcherSnapshotImageCache.m", 347, @"Invalid parameter not satisfying: %@", @"appLayout != nil" object file lineNumber description];

    goto LABEL_4;
  }
  v19 = [MEMORY[0x1E4F28B00] currentHandler];
  [v19 handleFailureInMethod:a2, self, @"SBAppSwitcherSnapshotImageCache.m", 345, @"Invalid parameter not satisfying: %@", @"observer != nil" object file lineNumber description];

  if (!v10) {
    goto LABEL_13;
  }
LABEL_3:
  if (!v11) {
    goto LABEL_14;
  }
LABEL_4:
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x2020000000;
  char v46 = 0;
  controlQueue = self->_controlQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__SBAppSwitcherSnapshotImageCache_addSnapshotUpdateObserver_forDisplayItem_inAppLayout___block_invoke;
  block[3] = &unk_1E6B07AE0;
  v42 = &v43;
  block[4] = self;
  id v13 = v11;
  id v39 = v13;
  id v14 = v9;
  id v40 = v14;
  id v15 = v10;
  id v41 = v15;
  dispatch_sync(controlQueue, block);
  if ([(SBAppSwitcherSettings *)self->_settings shouldSimplifyForOptions:1]
    || !*((unsigned char *)v44 + 24))
  {
    v18 = SBLogSwitcherSnapshotCache();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      -[SBAppSwitcherSnapshotImageCache addSnapshotUpdateObserver:forDisplayItem:inAppLayout:]();
    }
  }
  else
  {
    v16 = [[_SBAppSwitcherSnapshotCacheKey alloc] initWithDisplayItem:v15 inAppLayout:v13];
    uint64_t v32 = 0;
    v33 = &v32;
    uint64_t v34 = 0x3032000000;
    v35 = __Block_byref_object_copy__84;
    v36 = __Block_byref_object_dispose__84;
    id v37 = 0;
    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x2020000000;
    char v31 = 0;
    v17 = self->_controlQueue;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __88__SBAppSwitcherSnapshotImageCache_addSnapshotUpdateObserver_forDisplayItem_inAppLayout___block_invoke_2;
    v22[3] = &unk_1E6B07B08;
    v26 = &v32;
    v22[4] = self;
    v18 = v16;
    v23 = v18;
    id v24 = v13;
    id v25 = v15;
    v27 = &v28;
    dispatch_sync(v17, v22);
    if (*((unsigned char *)v29 + 24)) {
      [v14 didUpdateCacheEntry:v33[5]];
    }

    _Block_object_dispose(&v28, 8);
    _Block_object_dispose(&v32, 8);
  }
  _Block_object_dispose(&v43, 8);
}

uint64_t __88__SBAppSwitcherSnapshotImageCache_addSnapshotUpdateObserver_forDisplayItem_inAppLayout___block_invoke(void *a1)
{
  *(unsigned char *)(*(void *)(a1[8] + 8) + 24) = [*(id *)(a1[4] + 128) containsObject:a1[5]];
  uint64_t v2 = a1[6];
  uint64_t v3 = a1[7];
  uint64_t v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  return [v4 _addObserver:v2 forDisplayItem:v3 inAppLayout:v5];
}

- (id)_initWithDelegate:(id)a3 iconController:(id)a4 applicationController:(id)a5 orientationLockManager:(id)a6 settings:(id)a7
{
  id v13 = a3;
  id v31 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  BSDispatchQueueAssertMain();
  if (!v13)
  {
    uint64_t v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2, self, @"SBAppSwitcherSnapshotImageCache.m", 197, @"Invalid parameter not satisfying: %@", @"delegate != nil" object file lineNumber description];
  }
  v32.receiver = self;
  v32.super_class = (Class)SBAppSwitcherSnapshotImageCache;
  v17 = [(SBAppSwitcherSnapshotImageCache *)&v32 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_iconController, a4);
    objc_storeStrong((id *)&v18->_applicationController, a5);
    objc_storeStrong((id *)&v18->_orientationLockManager, a6);
    uint64_t v19 = [MEMORY[0x1E4F1CA60] dictionary];
    cachedSnapshots = v18->_cachedSnapshots;
    v18->_cachedSnapshots = (NSMutableDictionary *)v19;

    uint64_t v21 = [MEMORY[0x1E4F1CA60] dictionary];
    cacheEntryUpdateObservers = v18->_cacheEntryUpdateObservers;
    v18->_cacheEntryUpdateObservers = (NSMutableDictionary *)v21;

    uint64_t v23 = [MEMORY[0x1E4F1CA60] dictionary];
    snapshotRequestsCurrentlyBeingLoaded = v18->_snapshotRequestsCurrentlyBeingLoaded;
    v18->_snapshotRequestsCurrentlyBeingLoaded = (NSMutableDictionary *)v23;

    v18->_lastKnownInterfaceOrientation = 0;
    uint64_t v25 = BSDispatchQueueCreateWithQualityOfService();
    snapshotQueue = v18->_snapshotQueue;
    v18->_snapshotQueue = (OS_dispatch_queue *)v25;

    uint64_t Serial = BSDispatchQueueCreateSerial();
    controlQueue = v18->_controlQueue;
    v18->_controlQueue = (OS_dispatch_queue *)Serial;

    objc_storeStrong((id *)&v18->_settings, a7);
    v18->_shouldPurgeNilEntries = 1;
    v18->_reloadsSnapshotsForActiveInterfaceOrientationChange = 1;
    [(SBAppSwitcherSnapshotImageCache *)v18 setDelegate:v13];
  }

  return v18;
}

- (SBAppSwitcherSnapshotImageCache)initWithDelegate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[SBIconController sharedInstance];
  id v6 = +[SBApplicationController sharedInstance];
  v7 = +[SBOrientationLockManager sharedInstance];
  id v8 = +[SBAppSwitcherDomain rootSettings];
  id v9 = [(SBAppSwitcherSnapshotImageCache *)self _initWithDelegate:v4 iconController:v5 applicationController:v6 orientationLockManager:v7 settings:v8];

  return v9;
}

- (SBAppSwitcherSnapshotImageCache)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];

  return 0;
}

- (void)dealloc
{
  [(BSInvalidatable *)self->_stateCaptureInvalidatable invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBAppSwitcherSnapshotImageCache;
  [(SBAppSwitcherSnapshotImageCache *)&v3 dealloc];
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssertMain();
  objc_storeWeak((id *)&self->_delegate, v4);

  uint64_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v6 = v5;
  if (v4)
  {
    [v5 addObserver:self selector:sel__snapshotChanged_ name:@"SBApplicationSnapshotChangedNotification" object:0];
    [(id)SBApp addActiveOrientationObserver:self];
  }
  else
  {
    [v5 removeObserver:self];
    [(id)SBApp removeActiveOrientationObserver:self];
  }
}

- (void)setDebugName:(id)a3
{
  id v5 = a3;
  if (![(NSString *)self->_debugName isEqualToString:v5])
  {
    objc_storeStrong((id *)&self->_debugName, a3);
    [(BSInvalidatable *)self->_stateCaptureInvalidatable invalidate];
    if (v5)
    {
      objc_initWeak(&location, self);
      id v6 = [NSString stringWithFormat:@"SpringBoard - FluidSwitcher Snapshot Cache - %@", v5];
      objc_copyWeak(&v9, &location);
      BSLogAddStateCaptureBlockWithTitle();
      v7 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
      stateCaptureInvalidatable = self->_stateCaptureInvalidatable;
      self->_stateCaptureInvalidatable = v7;

      objc_destroyWeak(&v9);
      objc_destroyWeak(&location);
    }
  }
}

id __48__SBAppSwitcherSnapshotImageCache_setDebugName___block_invoke(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v27 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v23 = WeakRetained;
    id v2 = WeakRetained[3];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v26 = v2;
    id obj = [v2 allKeys];
    uint64_t v28 = [obj countByEnumeratingWithState:&v31 objects:v37 count:16];
    if (v28)
    {
      uint64_t v25 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v32 != v25) {
            objc_enumerationMutation(obj);
          }
          uint64_t v30 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          id v4 = [v26 objectForKey:v23];
          id v5 = [v4 snapshot];
          uint64_t v6 = [v5 userInterfaceStyle];

          v7 = @"Light";
          if (v6 == 2) {
            v7 = @"Dark";
          }
          if (!v6) {
            v7 = @"Unspecified";
          }
          v35[0] = @"size";
          v29 = v7;
          id v8 = [v4 snapshot];
          [v8 naturalSize];
          id v9 = NSStringFromSize(v40);
          v36[0] = v9;
          v35[1] = @"orientation";
          id v10 = [v4 snapshot];
          [v10 interfaceOrientation];
          id v11 = SBFStringForBSInterfaceOrientation();
          v36[1] = v11;
          v36[2] = v29;
          v35[2] = @"userInterfaceStyle";
          v35[3] = @"fromFullSizeRequest";
          id v12 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "fromFullSizeSnapshotRequest"));
          v36[3] = v12;
          v35[4] = @"path";
          id v13 = [v4 snapshot];
          uint64_t v14 = [v13 path];
          id v15 = (void *)v14;
          id v16 = @"n/a";
          if (v14) {
            id v16 = (__CFString *)v14;
          }
          v36[4] = v16;
          v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:5];

          v18 = [v30 displayItem];

          if ([v18 type] && objc_msgSend(v18, "type") != 5)
          {
            uint64_t v19 = [v18 bundleIdentifier];
          }
          else
          {
            uint64_t v19 = [v18 uniqueIdentifier];
          }
          v20 = (void *)v19;
          [v27 setObject:v17 forKey:v19];
        }
        uint64_t v28 = [obj countByEnumeratingWithState:&v31 objects:v37 count:16];
      }
      while (v28);
    }

    uint64_t v21 = [v27 description];

    WeakRetained = v23;
  }
  else
  {
    uint64_t v21 = 0;
  }

  return v21;
}

- (void)setReloadsSnapshotsForActiveInterfaceOrientationChange:(BOOL)a3
{
  if (self->_reloadsSnapshotsForActiveInterfaceOrientationChange != a3)
  {
    self->_reloadsSnapshotsForActiveInterfaceOrientationChange = a3;
    [(SBAppSwitcherSnapshotImageCache *)self _updateActiveOrientationObservingIfNeeded];
  }
}

- (NSArray)cachableAppLayouts
{
  BSDispatchQueueAssertMain();
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__84;
  id v11 = __Block_byref_object_dispose__84;
  id v12 = 0;
  controlQueue = self->_controlQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__SBAppSwitcherSnapshotImageCache_cachableAppLayouts__block_invoke;
  v6[3] = &unk_1E6AF4B88;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(controlQueue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __53__SBAppSwitcherSnapshotImageCache_cachableAppLayouts__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 128) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSArray)fullSizeCachableAppLayouts
{
  BSDispatchQueueAssertMain();
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__84;
  id v11 = __Block_byref_object_dispose__84;
  id v12 = 0;
  controlQueue = self->_controlQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__SBAppSwitcherSnapshotImageCache_fullSizeCachableAppLayouts__block_invoke;
  v6[3] = &unk_1E6AF4B88;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(controlQueue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __61__SBAppSwitcherSnapshotImageCache_fullSizeCachableAppLayouts__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 136) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)_updateCacheForDisplayItem:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssertMain();
  id v5 = SBLogSwitcherSnapshotCache();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[SBAppSwitcherSnapshotImageCache _updateCacheForDisplayItem:]();
  }

  controlQueue = self->_controlQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __62__SBAppSwitcherSnapshotImageCache__updateCacheForDisplayItem___block_invoke;
  v8[3] = &unk_1E6AF5290;
  id v9 = v4;
  id v10 = self;
  id v7 = v4;
  dispatch_sync(controlQueue, v8);
}

uint64_t __62__SBAppSwitcherSnapshotImageCache__updateCacheForDisplayItem___block_invoke(uint64_t a1)
{
  uint64_t v2 = SBLogSwitcherSnapshotCache();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __62__SBAppSwitcherSnapshotImageCache__updateCacheForDisplayItem___block_invoke_cold_1();
  }

  [*(id *)(a1 + 40) _purgeSnapshotRequestsForDisplayItem:*(void *)(a1 + 32) withReason:@"Was requested to update cache for display item"];
  [*(id *)(a1 + 40) _setSnapshotNeedsUpdateForDisplayItem:*(void *)(a1 + 32)];
  return [*(id *)(a1 + 40) _enqueueNextSnapshotRequestIfNecessary];
}

void __88__SBAppSwitcherSnapshotImageCache_addSnapshotUpdateObserver_forDisplayItem_inAppLayout___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = a1 + 32;
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKey:*(void *)(a1 + 40)];
  uint64_t v4 = *(void *)(*(void *)(v2 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  uint64_t v6 = *(void **)(*(void *)(*(void *)(v2 + 32) + 8) + 40);
  if (v6)
  {
    id v7 = [v6 appLayout];
    if ([v7 isEqual:*(void *)(a1 + 48)])
    {
      id v8 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) displayItem];
      int v9 = [v8 isEqual:*(void *)(a1 + 56)];

      if (v9)
      {
        id v10 = SBLogSwitcherSnapshotCache();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          __88__SBAppSwitcherSnapshotImageCache_addSnapshotUpdateObserver_forDisplayItem_inAppLayout___block_invoke_2_cold_2();
        }

        *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
        return;
      }
    }
    else
    {
    }
    id v12 = SBLogSwitcherSnapshotCache();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      __88__SBAppSwitcherSnapshotImageCache_addSnapshotUpdateObserver_forDisplayItem_inAppLayout___block_invoke_2_cold_3();
    }

    [*(id *)(a1 + 32) _purgeSnapshotsForKey:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) _enqueueNextSnapshotRequestIfNecessary];
  }
  else
  {
    id v11 = SBLogSwitcherSnapshotCache();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      __88__SBAppSwitcherSnapshotImageCache_addSnapshotUpdateObserver_forDisplayItem_inAppLayout___block_invoke_2_cold_1();
    }
  }
}

- (void)removeSnapshotObserver:(id)a3
{
  id v5 = a3;
  BSDispatchQueueAssertMain();
  if (!v5)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"SBAppSwitcherSnapshotImageCache.m", 382, @"Invalid parameter not satisfying: %@", @"observer != nil" object file lineNumber description];
  }
  controlQueue = self->_controlQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__SBAppSwitcherSnapshotImageCache_removeSnapshotObserver___block_invoke;
  block[3] = &unk_1E6AF5290;
  block[4] = self;
  id v10 = v5;
  id v7 = v5;
  dispatch_sync(controlQueue, block);
}

void __58__SBAppSwitcherSnapshotImageCache_removeSnapshotObserver___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 32);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __58__SBAppSwitcherSnapshotImageCache_removeSnapshotObserver___block_invoke_2;
  v14[3] = &unk_1E6B07B30;
  id v15 = *(id *)(a1 + 40);
  id v4 = v2;
  id v16 = v4;
  [v3 enumerateKeysAndObjectsUsingBlock:v14];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "removeObjectForKey:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v17 count:16];
    }
    while (v7);
  }
}

void __58__SBAppSwitcherSnapshotImageCache_removeSnapshotObserver___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a3;
  [v6 removeObject:v5];
  uint64_t v7 = [v6 count];

  if (!v7) {
    [*(id *)(a1 + 40) addObject:v8];
  }
}

- (NSString)description
{
  uint64_t v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = [(SBAppSwitcherSnapshotImageCache *)self cachableAppLayouts];
  id v5 = (id)[v3 appendObject:v4 withName:@"cachableAppLayouts"];

  id v6 = [(SBAppSwitcherSnapshotImageCache *)self fullSizeCachableAppLayouts];
  id v7 = (id)[v3 appendObject:v6 withName:@"fullSizeCachableAppLayouts"];

  id v8 = (id)[v3 appendObject:self->_cachedSnapshots withName:@"cachedSnapshots" skipIfNil:0];
  id v9 = (id)[v3 appendObject:self->_snapshotRequestsCurrentlyBeingLoaded withName:@"displayItemsCurrentlyBeingLoaded" skipIfNil:0];
  long long v10 = [v3 build];

  return (NSString *)v10;
}

- (id)_representedApplicationSceneEntityForDisplayItem:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 type];
  id v6 = [v4 uniqueIdentifier];
  if (v5 == 5)
  {
    id v8 = +[SBApplicationController sharedInstance];
    uint64_t v9 = [v8 webApplication];
  }
  else
  {
    if (v5)
    {
      long long v10 = 0;
      goto LABEL_7;
    }
    applicationController = self->_applicationController;
    id v8 = [v4 bundleIdentifier];
    uint64_t v9 = [(SBApplicationController *)applicationController applicationWithBundleIdentifier:v8];
  }
  long long v10 = (void *)v9;

LABEL_7:
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  long long v12 = [WeakRetained sceneHandleProviderForImageCache:self];
  if (v12 || !v10)
  {
    id v15 = [WeakRetained displayIdentityForImageCache:self];
    uint64_t v14 = [[SBDeviceApplicationSceneEntity alloc] initWithApplication:v10 uniqueIdentifier:v6 sceneHandleProvider:v12 displayIdentity:v15];
  }
  else
  {
    long long v13 = SBLogSwitcherSnapshotCache();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      v17 = (objc_class *)objc_opt_class();
      uint64_t v18 = NSStringFromClass(v17);
      debugName = self->_debugName;
      v20 = [v10 bundleIdentifier];
      int v21 = 138413314;
      v22 = v18;
      __int16 v23 = 2048;
      id v24 = self;
      __int16 v25 = 2114;
      id v26 = debugName;
      __int16 v27 = 2114;
      uint64_t v28 = v20;
      __int16 v29 = 2114;
      id v30 = v4;
      _os_log_fault_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_FAULT, "[rdar://100644371 defensive fix] <%@ %p %{public}@> got nil sceneHandleProvider and non-nil application %{public}@ for displayItem %{public}@; returning nil to avoid a crash",
        (uint8_t *)&v21,
        0x34u);
    }
    uint64_t v14 = 0;
  }

  return v14;
}

- (void)_setShouldPurgeNilEntry:(BOOL)a3
{
  controlQueue = self->_controlQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __59__SBAppSwitcherSnapshotImageCache__setShouldPurgeNilEntry___block_invoke;
  v4[3] = &unk_1E6AF5D38;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(controlQueue, v4);
}

uint64_t __59__SBAppSwitcherSnapshotImageCache__setShouldPurgeNilEntry___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 88) = *(unsigned char *)(result + 40);
  return result;
}

- (void)reloadSnapshotsForInterfaceStyleChange:(int64_t)a3
{
  BSDispatchQueueAssertMain();
  BOOL v5 = SBLogSwitcherSnapshotCache();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[SBAppSwitcherSnapshotImageCache reloadSnapshotsForInterfaceStyleChange:]();
  }

  controlQueue = self->_controlQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__SBAppSwitcherSnapshotImageCache_reloadSnapshotsForInterfaceStyleChange___block_invoke;
  v7[3] = &unk_1E6AF4A70;
  v7[4] = self;
  void v7[5] = a3;
  dispatch_sync(controlQueue, v7);
}

uint64_t __74__SBAppSwitcherSnapshotImageCache_reloadSnapshotsForInterfaceStyleChange___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 64) = *(void *)(a1 + 40);
  [*(id *)(a1 + 32) _purgeAllSnapshots];
  [*(id *)(a1 + 32) _purgeAllSnapshotRequests];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 _enqueueNextSnapshotRequestIfNecessary];
}

- (void)_snapshotChanged:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssertMain();
  BOOL v5 = [v4 userInfo];
  id v6 = [v4 object];

  if (v6 && v5)
  {
    id v7 = [v5 objectForKey:@"SBApplicationSnapshotChangedSceneIdentifierUserInfoKey"];
    if ([v6 isWebApplication])
    {
      id v8 = +[SBDisplayItem webAppDisplayItemWithWebAppIdentifier:v7];
    }
    else
    {
      uint64_t v9 = [v6 bundleIdentifier];
      id v8 = +[SBDisplayItem displayItemWithType:0 bundleIdentifier:v9 uniqueIdentifier:v7];
    }
    long long v10 = SBLogSwitcherSnapshotCache();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[SBAppSwitcherSnapshotImageCache _snapshotChanged:]();
    }

    [(SBAppSwitcherSnapshotImageCache *)self _updateCacheForDisplayItem:v8];
  }
}

- (void)_updateObserversForDisplayItem:(id)a3 inAppLayout:(id)a4 withCacheEntry:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BSDispatchQueueAssertMain();
  long long v11 = SBLogSwitcherSnapshotCache();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[SBAppSwitcherSnapshotImageCache _updateObserversForDisplayItem:inAppLayout:withCacheEntry:]();
  }

  long long v12 = [[_SBAppSwitcherSnapshotCacheKey alloc] initWithDisplayItem:v8 inAppLayout:v9];
  uint64_t v26 = 0;
  __int16 v27 = &v26;
  uint64_t v28 = 0x3032000000;
  __int16 v29 = __Block_byref_object_copy__84;
  id v30 = __Block_byref_object_dispose__84;
  id v31 = 0;
  controlQueue = self->_controlQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __93__SBAppSwitcherSnapshotImageCache__updateObserversForDisplayItem_inAppLayout_withCacheEntry___block_invoke;
  block[3] = &unk_1E6AF6380;
  __int16 v25 = &v26;
  block[4] = self;
  uint64_t v14 = v12;
  id v24 = v14;
  dispatch_sync(controlQueue, block);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v15 = (id)v27[5];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v19 objects:v32 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v20;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(v15);
        }
        objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v18++), "didUpdateCacheEntry:", v10, (void)v19);
      }
      while (v16 != v18);
      uint64_t v16 = [v15 countByEnumeratingWithState:&v19 objects:v32 count:16];
    }
    while (v16);
  }

  _Block_object_dispose(&v26, 8);
}

void __93__SBAppSwitcherSnapshotImageCache__updateObserversForDisplayItem_inAppLayout_withCacheEntry___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 32) objectForKey:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)_cacheSnapshotForRequest:(id)a3 withDisplayItem:(id)a4 inAppLayout:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BSDispatchQueueAssertMain();
  long long v11 = SBLogSwitcherSnapshotCache();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[SBAppSwitcherSnapshotImageCache _cacheSnapshotForRequest:withDisplayItem:inAppLayout:].cold.4();
  }

  long long v12 = [v8 appLayout];

  if (v12)
  {
    long long v13 = [v8 snapshot];
    uint64_t v14 = v13;
    if (v13)
    {
      id v15 = [v13 cachedImageForInterfaceOrientation:0];
      uint64_t v16 = v15;
      if (v15)
      {
        controlQueue = self->_controlQueue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __88__SBAppSwitcherSnapshotImageCache__cacheSnapshotForRequest_withDisplayItem_inAppLayout___block_invoke;
        block[3] = &unk_1E6AF4E00;
        block[4] = self;
        id v30 = v15;
        id v31 = v8;
        dispatch_sync(controlQueue, block);
        uint64_t v18 = SBLogSwitcherSnapshotCache();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
          -[SBAppSwitcherSnapshotImageCache _cacheSnapshotForRequest:withDisplayItem:inAppLayout:]();
        }
      }
      else
      {
        objc_initWeak(&location, self);
        snapshotQueue = self->_snapshotQueue;
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __88__SBAppSwitcherSnapshotImageCache__cacheSnapshotForRequest_withDisplayItem_inAppLayout___block_invoke_258;
        v25[3] = &unk_1E6AF5AF0;
        objc_copyWeak(&v27, &location);
        id v26 = v8;
        dispatch_async(snapshotQueue, v25);
        long long v22 = SBLogSwitcherSnapshotCache();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
          -[SBAppSwitcherSnapshotImageCache _cacheSnapshotForRequest:withDisplayItem:inAppLayout:]();
        }

        objc_destroyWeak(&v27);
        objc_destroyWeak(&location);
      }
    }
    else
    {
      long long v19 = self->_controlQueue;
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __88__SBAppSwitcherSnapshotImageCache__cacheSnapshotForRequest_withDisplayItem_inAppLayout___block_invoke_259;
      v23[3] = &unk_1E6AF5290;
      v23[4] = self;
      id v24 = v8;
      dispatch_sync(v19, v23);
      long long v20 = SBLogSwitcherSnapshotCache();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        -[SBAppSwitcherSnapshotImageCache _cacheSnapshotForRequest:withDisplayItem:inAppLayout:]();
      }
    }
  }
}

uint64_t __88__SBAppSwitcherSnapshotImageCache__cacheSnapshotForRequest_withDisplayItem_inAppLayout___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _snapshotImage:*(void *)(a1 + 40) finishedLoadingForRequest:*(void *)(a1 + 48)];
}

void __88__SBAppSwitcherSnapshotImageCache__cacheSnapshotForRequest_withDisplayItem_inAppLayout___block_invoke_258(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _asynchronouslyLoadSnapshotFromRequest:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

uint64_t __88__SBAppSwitcherSnapshotImageCache__cacheSnapshotForRequest_withDisplayItem_inAppLayout___block_invoke_259(uint64_t a1)
{
  return [*(id *)(a1 + 32) _snapshotImage:0 finishedLoadingForRequest:*(void *)(a1 + 40)];
}

- (void)_loadSnapshotForRequest:(id)a3 withDisplayItem:(id)a4 inAppLayout:(id)a5
{
  uint64_t v122 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BSDispatchQueueAssertMain();
  long long v11 = SBLogSwitcherSnapshotCache();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[SBAppSwitcherSnapshotImageCache _loadSnapshotForRequest:withDisplayItem:inAppLayout:].cold.4();
  }

  uint64_t v98 = 0;
  v99 = &v98;
  uint64_t v100 = 0x2020000000;
  char v101 = 1;
  controlQueue = self->_controlQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__SBAppSwitcherSnapshotImageCache__loadSnapshotForRequest_withDisplayItem_inAppLayout___block_invoke;
  block[3] = &unk_1E6AF6380;
  v97 = &v98;
  block[4] = self;
  id v13 = v8;
  id v96 = v13;
  dispatch_sync(controlQueue, block);
  if (*((unsigned char *)v99 + 24))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v15 = [(SBAppSwitcherSnapshotImageCache *)self _representedApplicationSceneEntityForDisplayItem:v9];
    uint64_t v16 = v15;
    v81 = v15;
    if (!v15)
    {
      id v27 = self->_controlQueue;
      v92[0] = MEMORY[0x1E4F143A8];
      v92[1] = 3221225472;
      v92[2] = __87__SBAppSwitcherSnapshotImageCache__loadSnapshotForRequest_withDisplayItem_inAppLayout___block_invoke_260;
      v92[3] = &unk_1E6AF4E00;
      v92[4] = self;
      id v93 = v9;
      id v94 = v13;
      dispatch_sync(v27, v92);

LABEL_51:
      goto LABEL_52;
    }
    v85 = [v15 sceneHandle];
    v84 = [v16 application];
    v80 = [WeakRetained displayIdentityForImageCache:self];
    uint64_t v17 = [MEMORY[0x1E4F62420] sharedInstance];
    v79 = [v17 configurationForIdentity:v80];

    uint64_t v18 = [(SBAppSwitcherSnapshotImageCache *)self _orientationForAppLayout:v10];
    char v19 = [v85 _mainSceneSupportsInterfaceOrientation:v18];
    if (v18) {
      char v20 = v19;
    }
    else {
      char v20 = 0;
    }
    if ((v20 & 1) == 0 || [v84 classicAppPhoneAppRunningOnPad]) {
      uint64_t v18 = [v85 activationInterfaceOrientationForOrientation:v18];
    }
    if ([v84 isClassic])
    {
      long long v21 = [MEMORY[0x1E4F42D90] mainScreen];
      long long v22 = [v21 displayConfiguration];
      [v84 defaultLaunchingSizeForDisplayConfiguration:v22];
      double v24 = v23;
      double v26 = v25;
    }
    else if (WeakRetained)
    {
      -[NSObject snapshotSizeForItemWithRole:inAppLayout:interfaceOrientation:inImageCache:](WeakRetained, "snapshotSizeForItemWithRole:inAppLayout:interfaceOrientation:inImageCache:", [v10 layoutRoleForItem:v9], v10, v18, self);
      double v24 = v28;
      double v26 = v29;
    }
    else
    {
      id v30 = SBLogSwitcherSnapshotCache();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        debugName = self->_debugName;
        *(_DWORD *)buf = 138543362;
        v103 = debugName;
        _os_log_impl(&dword_1D85BA000, v30, OS_LOG_TYPE_DEFAULT, "[%{public}@] failing to retrieve a snapshot due to nil delegate", buf, 0xCu);
      }

      double v24 = *MEMORY[0x1E4F1DB30];
      double v26 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    }
    int v32 = [v13 loadFullSizeSnapshot];
    uint64_t v33 = @"downscaled";
    if (v32) {
      uint64_t v33 = 0;
    }
    v83 = v33;
    v78 = objc_msgSend(v85, "displayEdgeInfoForLayoutEnvironment:", objc_msgSend(v10, "environment"));
    char v76 = v32;
    [v79 pointScale];
    double v35 = v34;
    v36 = +[SBDefaults localDefaults];
    id v37 = [v36 appSwitcherDefaults];
    uint64_t v38 = objc_msgSend(v84, "bestSnapshotWithImageName:sceneHandle:variantID:scale:referenceSize:requireExactSize:contentTypeMask:statusBarStateMask:launchingOrientation:contentOverridesContext:userInterfaceStyle:displayEdgeInfo:", @"SBSuspendSnapshot", v85, v83, objc_msgSend(v37, "chamoisWindowingEnabled") ^ 1, -1, -5, v35, v24, v26, v18, 0, self->_lastKnownUserInterfaceStyle, v78);

    id v39 = [[_SBAppSwitcherSnapshotCacheKey alloc] initWithDisplayItem:v9 inAppLayout:v10];
    v77 = v39;
    if (!v38)
    {
      v66 = self->_controlQueue;
      v86[0] = MEMORY[0x1E4F143A8];
      v86[1] = 3221225472;
      v86[2] = __87__SBAppSwitcherSnapshotImageCache__loadSnapshotForRequest_withDisplayItem_inAppLayout___block_invoke_268;
      v86[3] = &unk_1E6AF4E00;
      v86[4] = self;
      id v87 = v9;
      id v88 = v13;
      dispatch_sync(v66, v86);

LABEL_50:
      goto LABEL_51;
    }
    NSSize v40 = [(NSMutableDictionary *)self->_cachedSnapshots objectForKey:v39];
    v82 = [v40 snapshot];

    id v41 = [v82 variantID];
    v42 = [v38 variantID];
    if (([v41 isEqualToString:v42] & 1) == 0)
    {
      uint64_t v43 = [v38 variantID];
      v44 = [v82 variantWithIdentifier:v43];
      BOOL v45 = v44 == 0;

      if (v45) {
        goto LABEL_28;
      }
      id v41 = [v38 variantID];
      [v82 variantWithIdentifier:v41];
      v82 = v42 = v82;
    }

LABEL_28:
    if (v82
      && ([v82 identifier],
          char v46 = objc_claimAutoreleasedReturnValue(),
          [v38 identifier],
          v47 = objc_claimAutoreleasedReturnValue(),
          char v48 = [v46 isEqual:v47],
          v47,
          v46,
          (v48 & 1) != 0))
    {
      v49 = self->_controlQueue;
      v89[0] = MEMORY[0x1E4F143A8];
      v89[1] = 3221225472;
      v89[2] = __87__SBAppSwitcherSnapshotImageCache__loadSnapshotForRequest_withDisplayItem_inAppLayout___block_invoke_267;
      v89[3] = &unk_1E6AF4E00;
      v89[4] = self;
      id v90 = v13;
      v91 = v77;
      dispatch_sync(v49, v89);
    }
    else
    {
      v50 = SBLogSwitcherSnapshotCache();
      BOOL v51 = os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG);

      if (v51)
      {
        uint64_t v72 = [v13 sequenceID];
        v52 = [v85 application];
        v53 = [v52 bundleIdentifier];
        v54 = [v53 componentsSeparatedByString:@"."];
        v75 = [v54 lastObject];

        v55 = [v9 uniqueIdentifier];
        v56 = [v85 sceneIfExists];

        v123.width = v24;
        v123.height = v26;
        v57 = NSStringFromSize(v123);
        int64_t lastKnownUserInterfaceStyle = self->_lastKnownUserInterfaceStyle;
        v59 = @"Light";
        if (lastKnownUserInterfaceStyle == 2) {
          v59 = @"Dark";
        }
        if (lastKnownUserInterfaceStyle) {
          v60 = v59;
        }
        else {
          v60 = @"Unspecified";
        }
        v73 = v60;
        v74 = v83;
        v61 = SBLogSwitcherSnapshotCache();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
        {
          v71 = v57;
          v69 = self->_debugName;
          int v70 = [v13 loadFullSizeSnapshot];
          *(_DWORD *)buf = 138545666;
          v103 = v69;
          __int16 v104 = 2114;
          v105 = v75;
          __int16 v106 = 2048;
          v57 = v71;
          uint64_t v107 = v72;
          __int16 v108 = 1024;
          int v109 = v70;
          __int16 v110 = 2114;
          v111 = v55;
          __int16 v112 = 1024;
          BOOL v113 = v56 != 0;
          __int16 v114 = 2114;
          v115 = v71;
          __int16 v116 = 2114;
          v117 = v73;
          __int16 v118 = 2114;
          v119 = v74;
          __int16 v120 = 1024;
          BOOL v121 = v82 != 0;
          _os_log_debug_impl(&dword_1D85BA000, v61, OS_LOG_TYPE_DEBUG, "\n|\n|— [%{public}@] [Loading] request for %{public}@:\n|\n|     sequence : %lu \n|   fullscreen : %{BOOL}u \n| itemUniqueID : %{public}@ \n|     hasScene : %{BOOL}u \n|         size : %{public}@ \n|        style : %{public}@ \n|      variant : %{public}@ \n|     hadEntry : %{BOOL}u \n|", buf, 0x5Au);
        }
      }
      [v38 contentType];
      char v62 = XBApplicationSnapshotContentTypeMaskForContentType();
      if (v83
        && (char v63 = v62,
            [v38 variantID],
            v64 = objc_claimAutoreleasedReturnValue(),
            char v65 = [v64 isEqualToString:v83],
            v64,
            !(v76 & 1 | ((v63 & 6) == 0) | v65 & 1)))
      {
        v67 = SBLogSwitcherSnapshotCache();
        if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG)) {
          -[SBAppSwitcherSnapshotImageCache _loadSnapshotForRequest:withDisplayItem:inAppLayout:]();
        }

        [(SBAppSwitcherSnapshotImageCache *)self _createDownscaledVariantForRequest:v13 snapshot:v38 displayItem:v9 sceneHandle:v85 application:v84];
        v68 = SBLogSwitcherSnapshotCache();
        if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG)) {
          -[SBAppSwitcherSnapshotImageCache _loadSnapshotForRequest:withDisplayItem:inAppLayout:]();
        }
      }
      else
      {
        [v13 setSnapshot:v38];
        [(SBAppSwitcherSnapshotImageCache *)self _cacheSnapshotForRequest:v13 withDisplayItem:v9 inAppLayout:v10];
      }
    }

    goto LABEL_50;
  }
  id WeakRetained = SBLogSwitcherSnapshotCache();
  if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEBUG)) {
    -[SBAppSwitcherSnapshotImageCache _loadSnapshotForRequest:withDisplayItem:inAppLayout:]((uint64_t)self->_debugName, (uint64_t)buf, [v13 sequenceID], WeakRetained);
  }
LABEL_52:

  _Block_object_dispose(&v98, 8);
}

uint64_t __87__SBAppSwitcherSnapshotImageCache__loadSnapshotForRequest_withDisplayItem_inAppLayout___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _isValidSnapshotRequest:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    id v3 = *(void **)(a1 + 32);
    return [v3 _enqueueNextSnapshotRequestIfNecessary];
  }
  return result;
}

uint64_t __87__SBAppSwitcherSnapshotImageCache__loadSnapshotForRequest_withDisplayItem_inAppLayout___block_invoke_260(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = SBLogSwitcherSnapshotCache();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 152);
    int v6 = 138543618;
    uint64_t v7 = v4;
    __int16 v8 = 2114;
    uint64_t v9 = v3;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got nil applicationSceneEntity for displayItem [%{public}@]; failing early",
      (uint8_t *)&v6,
      0x16u);
  }

  return [*(id *)(a1 + 32) _snapshotImage:0 finishedLoadingForRequest:*(void *)(a1 + 48)];
}

uint64_t __87__SBAppSwitcherSnapshotImageCache__loadSnapshotForRequest_withDisplayItem_inAppLayout___block_invoke_267(uint64_t a1)
{
  uint64_t v2 = SBLogSwitcherSnapshotCache();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __87__SBAppSwitcherSnapshotImageCache__loadSnapshotForRequest_withDisplayItem_inAppLayout___block_invoke_267_cold_1(a1, v2);
  }

  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKey:*(void *)(a1 + 48)];
  int v4 = [v3 fromFullSizeSnapshotRequest];

  if (v4) {
    [*(id *)(a1 + 40) setLoadFullSizeSnapshot:1];
  }
  BOOL v5 = *(void **)(a1 + 40);
  int v6 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKey:*(void *)(a1 + 48)];
  uint64_t v7 = [v6 snapshot];
  [v5 setSnapshot:v7];

  __int16 v8 = *(id **)(a1 + 32);
  uint64_t v9 = [v8[3] objectForKey:*(void *)(a1 + 48)];
  uint64_t v10 = [v9 snapshotImage];
  [v8 _snapshotImage:v10 finishedLoadingForRequest:*(void *)(a1 + 40)];

  return [*(id *)(a1 + 32) _enqueueNextSnapshotRequestIfNecessary];
}

uint64_t __87__SBAppSwitcherSnapshotImageCache__loadSnapshotForRequest_withDisplayItem_inAppLayout___block_invoke_268(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = SBLogSwitcherSnapshotCache();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 152);
    int v6 = 138543618;
    uint64_t v7 = v4;
    __int16 v8 = 2114;
    uint64_t v9 = v3;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] failed to retrieve a snapshot for display item [%{public}@]", (uint8_t *)&v6, 0x16u);
  }

  return [*(id *)(a1 + 32) _snapshotImage:0 finishedLoadingForRequest:*(void *)(a1 + 48)];
}

- (void)_createDownscaledVariantForRequest:(id)a3 snapshot:(id)a4 displayItem:(id)a5 sceneHandle:(id)a6 application:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  BSDispatchQueueAssertMain();
  objc_initWeak(&location, self);
  uint64_t v17 = [v12 appLayout];
  uint64_t v18 = [v17 layoutRoleForItem:v14];
  char v19 = [(SBAppSwitcherSnapshotImageCache *)self delegate];
  [v19 scaleForDownscaledSnapshotsForLayoutRole:v18 inAppLayout:v17 inImageCache:self];
  double v21 = v20;

  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __115__SBAppSwitcherSnapshotImageCache__createDownscaledVariantForRequest_snapshot_displayItem_sceneHandle_application___block_invoke;
  v25[3] = &unk_1E6B07B80;
  objc_copyWeak(&v29, &location);
  id v22 = v12;
  id v26 = v22;
  id v23 = v13;
  id v27 = v23;
  id v24 = v14;
  id v28 = v24;
  [v16 createDownscaledVariantForSnapshot:v23 sceneHandle:v15 scaleFactor:v25 didSaveImage:v21];

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);
}

void __115__SBAppSwitcherSnapshotImageCache__createDownscaledVariantForRequest_snapshot_displayItem_sceneHandle_application___block_invoke(id *a1, char a2)
{
  uint64_t v4 = a1 + 7;
  id WeakRetained = (NSObject **)objc_loadWeakRetained(a1 + 7);
  int v6 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v7 = WeakRetained[2];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __115__SBAppSwitcherSnapshotImageCache__createDownscaledVariantForRequest_snapshot_displayItem_sceneHandle_application___block_invoke_2;
    v8[3] = &unk_1E6B07B58;
    void v8[4] = WeakRetained;
    id v9 = a1[4];
    id v10 = a1[5];
    char v13 = a2;
    objc_copyWeak(&v12, v4);
    id v11 = a1[6];
    dispatch_sync(v7, v8);

    objc_destroyWeak(&v12);
  }
}

void __115__SBAppSwitcherSnapshotImageCache__createDownscaledVariantForRequest_snapshot_displayItem_sceneHandle_application___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _isValidSnapshotRequest:*(void *)(a1 + 40)])
  {
    if ([*(id *)(a1 + 48) isValid] && *(unsigned char *)(a1 + 72))
    {
      v3[0] = MEMORY[0x1E4F143A8];
      v3[1] = 3221225472;
      v3[2] = __115__SBAppSwitcherSnapshotImageCache__createDownscaledVariantForRequest_snapshot_displayItem_sceneHandle_application___block_invoke_3;
      v3[3] = &unk_1E6AF5AF0;
      objc_copyWeak(&v5, (id *)(a1 + 64));
      id v4 = *(id *)(a1 + 56);
      dispatch_async(MEMORY[0x1E4F14428], v3);

      objc_destroyWeak(&v5);
    }
    else
    {
      uint64_t v2 = SBLogSwitcherSnapshotCache();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
        __115__SBAppSwitcherSnapshotImageCache__createDownscaledVariantForRequest_snapshot_displayItem_sceneHandle_application___block_invoke_2_cold_1();
      }

      [*(id *)(a1 + 32) _snapshotImage:0 finishedLoadingForRequest:*(void *)(a1 + 40)];
    }
  }
}

void __115__SBAppSwitcherSnapshotImageCache__createDownscaledVariantForRequest_snapshot_displayItem_sceneHandle_application___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _updateCacheForDisplayItem:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

- (void)_updateActiveOrientationObservingIfNeeded
{
  BOOL v3 = [(SBAppSwitcherSnapshotImageCache *)self reloadsSnapshotsForActiveInterfaceOrientationChange];
  id v4 = (void *)SBApp;
  if (v3)
  {
    [v4 addActiveOrientationObserver:self];
  }
  else
  {
    [v4 removeActiveOrientationObserver:self];
  }
}

- (void)activeInterfaceOrientationDidChangeToOrientation:(int64_t)a3 willAnimateWithDuration:(double)a4 fromOrientation:(int64_t)a5
{
  BSDispatchQueueAssertMain();
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  char v11 = 1;
  controlQueue = self->_controlQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __124__SBAppSwitcherSnapshotImageCache_activeInterfaceOrientationDidChangeToOrientation_willAnimateWithDuration_fromOrientation___block_invoke;
  v9[3] = &unk_1E6AF8508;
  v9[5] = v10;
  v9[6] = a3;
  v9[4] = self;
  *(double *)&v9[7] = a4;
  dispatch_sync(controlQueue, v9);
  _Block_object_dispose(v10, 8);
}

void __124__SBAppSwitcherSnapshotImageCache_activeInterfaceOrientationDidChangeToOrientation_willAnimateWithDuration_fromOrientation___block_invoke(uint64_t a1)
{
  unint64_t v2 = *(void *)(*(void *)(a1 + 32) + 56);
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 48);
    if ((unint64_t)(v3 - 1) >= 2)
    {
      if (((v3 - 3) | (v2 - 3)) >= 2) {
        goto LABEL_7;
      }
    }
    else if (v2 > 2)
    {
      goto LABEL_7;
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
LABEL_7:
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    id v4 = SBLogSwitcherSnapshotCache();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __124__SBAppSwitcherSnapshotImageCache_activeInterfaceOrientationDidChangeToOrientation_willAnimateWithDuration_fromOrientation___block_invoke_cold_1();
    }

    *(void *)(*(void *)(a1 + 32) + 56) = *(void *)(a1 + 48);
    [*(id *)(a1 + 32) _purgeAllSnapshots];
    [*(id *)(a1 + 32) _purgeAllSnapshotRequests];
    objc_initWeak(&location, *(id *)(a1 + 32));
    dispatch_time_t v5 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 56) * 1000000000.0));
    int v6 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __124__SBAppSwitcherSnapshotImageCache_activeInterfaceOrientationDidChangeToOrientation_willAnimateWithDuration_fromOrientation___block_invoke_270;
    v7[3] = &unk_1E6AF4B10;
    objc_copyWeak(&v8, &location);
    dispatch_after(v5, v6, v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __124__SBAppSwitcherSnapshotImageCache_activeInterfaceOrientationDidChangeToOrientation_willAnimateWithDuration_fromOrientation___block_invoke_270(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _enqueueNextSnapshotRequestIfNecessary];
    id WeakRetained = v2;
  }
}

- (int64_t)_orientationForAppLayout:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssertMain();
  dispatch_time_t v5 = [(SBAppSwitcherSnapshotImageCache *)self delegate];
  int64_t v6 = [v5 orientationForSnapshotOfAppLayout:v4 inImageCache:self];

  return v6;
}

- (void)_updateCache
{
  BSDispatchQueueAssert();
  [(SBAppSwitcherSnapshotImageCache *)self _purgeLowPriorityFullSizeSnapshots];
  [(SBAppSwitcherSnapshotImageCache *)self _purgeLowPriorityFullSizeSnapshotRequests];
  [(SBAppSwitcherSnapshotImageCache *)self _purgeLowPrioritySnapshots];
  [(SBAppSwitcherSnapshotImageCache *)self _purgeLowPrioritySnapshotRequests];
  [(SBAppSwitcherSnapshotImageCache *)self _enqueueNextSnapshotRequestIfNecessary];
}

- (void)_purgeSnapshotRequest:(id)a3 withReason:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  BSDispatchQueueAssert();
  id v8 = SBLogSwitcherSnapshotCache();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    debugName = self->_debugName;
    int v12 = 138543874;
    char v13 = debugName;
    __int16 v14 = 2114;
    id v15 = v7;
    __int16 v16 = 2048;
    uint64_t v17 = [v6 sequenceID];
    _os_log_debug_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEBUG, "\n|\n|— [%{public}@] [Purging] [%{public}@] sequenceID: %lu\n|", (uint8_t *)&v12, 0x20u);
  }

  snapshotRequestsCurrentlyBeingLoaded = self->_snapshotRequestsCurrentlyBeingLoaded;
  id v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "sequenceID"));
  [(NSMutableDictionary *)snapshotRequestsCurrentlyBeingLoaded removeObjectForKey:v10];
}

- (void)_purgeSnapshotRequestsForDisplayItem:(id)a3 withReason:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  BSDispatchQueueAssert();
  id v8 = SBLogSwitcherSnapshotCache();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[SBAppSwitcherSnapshotImageCache _purgeSnapshotRequestsForDisplayItem:withReason:]();
  }

  snapshotRequestsCurrentlyBeingLoaded = self->_snapshotRequestsCurrentlyBeingLoaded;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __83__SBAppSwitcherSnapshotImageCache__purgeSnapshotRequestsForDisplayItem_withReason___block_invoke;
  v17[3] = &unk_1E6B07BA8;
  id v10 = v6;
  id v18 = v10;
  char v11 = [(NSMutableDictionary *)snapshotRequestsCurrentlyBeingLoaded keysOfEntriesPassingTest:v17];
  if ([v11 count])
  {
    int v12 = SBLogSwitcherSnapshotCache();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      debugName = self->_debugName;
      __int16 v16 = [v11 allObjects];
      *(_DWORD *)buf = 138543874;
      double v20 = debugName;
      __int16 v21 = 2114;
      id v22 = v7;
      __int16 v23 = 2114;
      id v24 = v16;
      _os_log_debug_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEBUG, "\n|\n|— [%{public}@] [Purging] [%{public}@] sequenceID-s: %{public}@\n|", buf, 0x20u);
    }
    char v13 = self->_snapshotRequestsCurrentlyBeingLoaded;
    __int16 v14 = [v11 allObjects];
    [(NSMutableDictionary *)v13 removeObjectsForKeys:v14];
  }
}

uint64_t __83__SBAppSwitcherSnapshotImageCache__purgeSnapshotRequestsForDisplayItem_withReason___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  dispatch_time_t v5 = [*(id *)(a1 + 32) uniqueIdentifier];

  if (v5)
  {
    id v6 = [v4 displayItem];
    uint64_t v7 = [v6 isEqual:*(void *)(a1 + 32)];
  }
  else
  {
    id v8 = [*(id *)(a1 + 32) bundleIdentifier];

    if (!v8)
    {
      uint64_t v7 = 0;
      goto LABEL_6;
    }
    id v6 = [v4 displayItem];
    id v9 = [v6 bundleIdentifier];
    id v10 = [*(id *)(a1 + 32) bundleIdentifier];
    uint64_t v7 = [v9 isEqual:v10];
  }
LABEL_6:

  return v7;
}

- (void)_purgeSnapshotsForKey:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssert();
  dispatch_time_t v5 = SBLogSwitcherSnapshotCache();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[SBAppSwitcherSnapshotImageCache _purgeSnapshotsForKey:]();
  }

  id v6 = [v4 displayItem];
  uint64_t v7 = [v6 uniqueIdentifier];

  if (v7)
  {
    id v8 = SBLogSwitcherSnapshotCache();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      [(SBAppSwitcherSnapshotImageCache *)(uint64_t)self _purgeSnapshotsForKey:v8];
    }

    [(NSMutableDictionary *)self->_cachedSnapshots removeObjectForKey:v4];
  }
  else
  {
    id v9 = [v6 bundleIdentifier];

    if (v9)
    {
      cachedSnapshots = self->_cachedSnapshots;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __57__SBAppSwitcherSnapshotImageCache__purgeSnapshotsForKey___block_invoke;
      v15[3] = &unk_1E6B07BD0;
      id v16 = v6;
      char v11 = [(NSMutableDictionary *)cachedSnapshots keysOfEntriesPassingTest:v15];
      if ([v11 count])
      {
        int v12 = SBLogSwitcherSnapshotCache();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
          -[SBAppSwitcherSnapshotImageCache _purgeSnapshotsForKey:]();
        }

        char v13 = self->_cachedSnapshots;
        __int16 v14 = [v11 allObjects];
        [(NSMutableDictionary *)v13 removeObjectsForKeys:v14];
      }
    }
  }
}

uint64_t __57__SBAppSwitcherSnapshotImageCache__purgeSnapshotsForKey___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 displayItem];
  id v4 = [v3 bundleIdentifier];
  dispatch_time_t v5 = [*(id *)(a1 + 32) bundleIdentifier];
  uint64_t v6 = [v4 isEqualToString:v5];

  return v6;
}

- (void)_purgeLowPrioritySnapshotRequests
{
  OUTLINED_FUNCTION_3_6(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_1(&dword_1D85BA000, v0, v1, "[%{public}@] purge low priority snapshot requests", v2, v3, v4, v5, v6);
}

uint64_t __68__SBAppSwitcherSnapshotImageCache__purgeLowPrioritySnapshotRequests__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a3;
  uint8_t v6 = [v5 appLayout];
  uint64_t v7 = [v5 snapshot];

  uint64_t v8 = [v4 _isValidAppLayout:v6 withSnapshot:v7 givenCachableAppLayouts:*(void *)(*(void *)(a1 + 32) + 128)] ^ 1;
  return v8;
}

- (void)_purgeLowPrioritySnapshots
{
  OUTLINED_FUNCTION_3_6(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_1(&dword_1D85BA000, v0, v1, "[%{public}@] purge low priority snapshots", v2, v3, v4, v5, v6);
}

uint64_t __61__SBAppSwitcherSnapshotImageCache__purgeLowPrioritySnapshots__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = *(void **)(a1 + 32);
  uint8_t v6 = [v4 appLayout];
  uint64_t v7 = [v4 snapshot];
  int v8 = [v5 _isValidAppLayout:v6 withSnapshot:v7 givenCachableAppLayouts:*(void *)(*(void *)(a1 + 32) + 128)];

  if (*(unsigned char *)(*(void *)(a1 + 32) + 88))
  {
    id v9 = [v4 snapshotImage];
    BOOL v10 = v9 == 0;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v8 ^ 1 | v10;
}

- (void)_purgeLowPriorityFullSizeSnapshotRequests
{
  OUTLINED_FUNCTION_3_6(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_1(&dword_1D85BA000, v0, v1, "[%{public}@] purge full size snapshot requests", v2, v3, v4, v5, v6);
}

uint64_t __76__SBAppSwitcherSnapshotImageCache__purgeLowPriorityFullSizeSnapshotRequests__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if ([v4 loadFullSizeSnapshot])
  {
    uint64_t v5 = *(void **)(a1 + 32);
    uint8_t v6 = [v4 appLayout];
    uint64_t v7 = [v5 containsObject:v6] ^ 1;
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (void)_purgeLowPriorityFullSizeSnapshots
{
  OUTLINED_FUNCTION_3_6(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_1(&dword_1D85BA000, v0, v1, "[%{public}@] purge full size snapshots", v2, v3, v4, v5, v6);
}

uint64_t __69__SBAppSwitcherSnapshotImageCache__purgeLowPriorityFullSizeSnapshots__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if ([v4 fromFullSizeSnapshotRequest])
  {
    uint64_t v5 = *(void **)(a1 + 32);
    uint8_t v6 = [v4 appLayout];
    int v7 = [v5 containsObject:v6];

    if (*(unsigned char *)(*(void *)(a1 + 40) + 88))
    {
      int v8 = [v4 snapshotImage];
      BOOL v9 = v8 == 0;
    }
    else
    {
      BOOL v9 = 0;
    }
    uint64_t v10 = v7 ^ 1 | v9;
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (void)_setSnapshotNeedsUpdateForDisplayItem:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BSDispatchQueueAssert();
  uint64_t v5 = SBLogSwitcherSnapshotCache();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[SBAppSwitcherSnapshotImageCache _setSnapshotNeedsUpdateForDisplayItem:]();
  }

  uint8_t v6 = [v4 uniqueIdentifier];

  if (v6)
  {
    cachedSnapshots = self->_cachedSnapshots;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __73__SBAppSwitcherSnapshotImageCache__setSnapshotNeedsUpdateForDisplayItem___block_invoke;
    v23[3] = &unk_1E6B07BD0;
    int v8 = &v24;
    id v24 = v4;
    BOOL v9 = v23;
  }
  else
  {
    uint64_t v10 = [v4 bundleIdentifier];

    if (!v10) {
      goto LABEL_8;
    }
    cachedSnapshots = self->_cachedSnapshots;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __73__SBAppSwitcherSnapshotImageCache__setSnapshotNeedsUpdateForDisplayItem___block_invoke_2;
    v21[3] = &unk_1E6B07BD0;
    int v8 = &v22;
    id v22 = v4;
    BOOL v9 = v21;
  }
  uint64_t v10 = [(NSMutableDictionary *)cachedSnapshots keysOfEntriesPassingTest:v9];

LABEL_8:
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = -[NSMutableDictionary objectForKey:](self->_cachedSnapshots, "objectForKey:", *(void *)(*((void *)&v17 + 1) + 8 * v15), (void)v17);
        [v16 setNeedsUpdate:1];

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v13);
  }
}

uint64_t __73__SBAppSwitcherSnapshotImageCache__setSnapshotNeedsUpdateForDisplayItem___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 displayItem];
  uint64_t v5 = [v4 isEqual:*(void *)(a1 + 32)];

  return v5;
}

uint64_t __73__SBAppSwitcherSnapshotImageCache__setSnapshotNeedsUpdateForDisplayItem___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 displayItem];
  id v4 = [v3 bundleIdentifier];
  uint64_t v5 = [*(id *)(a1 + 32) bundleIdentifier];
  uint64_t v6 = [v4 isEqualToString:v5];

  return v6;
}

- (BOOL)_isValidAppLayout:(id)a3 withSnapshot:(id)a4 givenCachableAppLayouts:(id)a5
{
  id v6 = a5;
  id v7 = a3;
  BSDispatchQueueAssert();
  char v8 = [v6 containsObject:v7];

  return v8;
}

- (void)_purgeAllSnapshotRequests
{
  OUTLINED_FUNCTION_3_6(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_1(&dword_1D85BA000, v0, v1, "[%{public}@] purge all snapshot requests", v2, v3, v4, v5, v6);
}

- (void)_purgeAllSnapshots
{
  OUTLINED_FUNCTION_3_6(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_1(&dword_1D85BA000, v0, v1, "[%{public}@] purge all cached snapshots", v2, v3, v4, v5, v6);
}

- (void)_enqueueNextSnapshotRequestIfNecessary
{
  OUTLINED_FUNCTION_3_6(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_1(&dword_1D85BA000, v0, v1, "[%{public}@] enqueue snapshot request load if necessary", v2, v3, v4, v5, v6);
}

- (void)_enqueueSnapshotRequestsForCachableAppLayouts:(id)a3 forFullSizeSnapshots:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint8_t v6 = (void *)[a3 mutableCopy];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __102__SBAppSwitcherSnapshotImageCache__enqueueSnapshotRequestsForCachableAppLayouts_forFullSizeSnapshots___block_invoke_2;
  v32[3] = &unk_1E6B07C40;
  v32[4] = self;
  id v33 = &__block_literal_global_261;
  BOOL v34 = v4;
  id v7 = [v6 indexesOfObjectsPassingTest:v32];
  [v6 removeObjectsAtIndexes:v7];
  if ([v6 count])
  {
    long long v18 = v7;
    long long v19 = v6;
    char v8 = [v6 firstObject];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id obj = [v8 allItems];
    uint64_t v9 = [obj countByEnumeratingWithState:&v28 objects:v35 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v21 = *(void *)v29;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v29 != v21) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void *)(*((void *)&v28 + 1) + 8 * v11);
          uint64_t v13 = [[_SBAppSwitcherSnapshotCacheKey alloc] initWithDisplayItem:v12 inAppLayout:v8];
          uint64_t v14 = [(NSMutableDictionary *)self->_cachedSnapshots objectForKey:v13];
          char v15 = __102__SBAppSwitcherSnapshotImageCache__enqueueSnapshotRequestsForCachableAppLayouts_forFullSizeSnapshots___block_invoke((uint64_t)v14, v14, v4);

          if ((v15 & 1) == 0)
          {
            id v16 = [(SBAppSwitcherSnapshotImageCache *)self _createSnapshotRequestWithDisplayItem:v12 inAppLayout:v8 forFullSizeSnapshot:v4];
            objc_initWeak(&location, self);
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __102__SBAppSwitcherSnapshotImageCache__enqueueSnapshotRequestsForCachableAppLayouts_forFullSizeSnapshots___block_invoke_3;
            block[3] = &unk_1E6AFF9F8;
            objc_copyWeak(&v26, &location);
            id v23 = v16;
            uint64_t v24 = v12;
            id v25 = v8;
            id v17 = v16;
            dispatch_async(MEMORY[0x1E4F14428], block);

            objc_destroyWeak(&v26);
            objc_destroyWeak(&location);
          }

          ++v11;
        }
        while (v10 != v11);
        uint64_t v10 = [obj countByEnumeratingWithState:&v28 objects:v35 count:16];
      }
      while (v10);
    }

    id v7 = v18;
    uint8_t v6 = v19;
  }
}

uint64_t __102__SBAppSwitcherSnapshotImageCache__enqueueSnapshotRequestsForCachableAppLayouts_forFullSizeSnapshots___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v4 = a2;
  uint64_t v5 = v4;
  if (v4 && ([v4 needsUpdate] & 1) == 0) {
    uint64_t v6 = [v5 fromFullSizeSnapshotRequest] | a3 ^ 1;
  }
  else {
    uint64_t v6 = 0;
  }

  return v6;
}

uint64_t __102__SBAppSwitcherSnapshotImageCache__enqueueSnapshotRequestsForCachableAppLayouts_forFullSizeSnapshots___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = objc_msgSend(v3, "allItems", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    LODWORD(v8) = 1;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = [[_SBAppSwitcherSnapshotCacheKey alloc] initWithDisplayItem:*(void *)(*((void *)&v13 + 1) + 8 * i) inAppLayout:v3];
        uint64_t v11 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKey:v10];
        uint64_t v8 = v8 & (*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))();
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v8 = 1;
  }

  return v8;
}

void __102__SBAppSwitcherSnapshotImageCache__enqueueSnapshotRequestsForCachableAppLayouts_forFullSizeSnapshots___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _loadSnapshotForRequest:*(void *)(a1 + 32) withDisplayItem:*(void *)(a1 + 40) inAppLayout:*(void *)(a1 + 48)];
    id WeakRetained = v3;
  }
}

- (id)_createSnapshotRequestWithDisplayItem:(id)a3 inAppLayout:(id)a4 forFullSizeSnapshot:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  BSDispatchQueueAssert();
  ++self->_snapshotRequestSequenceID;
  uint64_t v10 = [[_SBAppSwitcherSnapshotImageCacheRequest alloc] initWithSequenceID:self->_snapshotRequestSequenceID];
  [(_SBAppSwitcherSnapshotImageCacheRequest *)v10 setDisplayItem:v9];

  [(_SBAppSwitcherSnapshotImageCacheRequest *)v10 setAppLayout:v8];
  [(_SBAppSwitcherSnapshotImageCacheRequest *)v10 setLoadFullSizeSnapshot:v5];
  snapshotRequestsCurrentlyBeingLoaded = self->_snapshotRequestsCurrentlyBeingLoaded;
  uint64_t v12 = [NSNumber numberWithUnsignedInteger:self->_snapshotRequestSequenceID];
  [(NSMutableDictionary *)snapshotRequestsCurrentlyBeingLoaded setObject:v10 forKey:v12];

  return v10;
}

- (BOOL)_isValidSnapshotRequest:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssert();
  snapshotRequestsCurrentlyBeingLoaded = self->_snapshotRequestsCurrentlyBeingLoaded;
  uint64_t v6 = NSNumber;
  uint64_t v7 = [v4 sequenceID];

  id v8 = [v6 numberWithUnsignedInteger:v7];
  id v9 = [(NSMutableDictionary *)snapshotRequestsCurrentlyBeingLoaded objectForKey:v8];
  LOBYTE(snapshotRequestsCurrentlyBeingLoaded) = v9 != 0;

  return (char)snapshotRequestsCurrentlyBeingLoaded;
}

- (id)_cachableAppLayoutsRequiringFullSizeSnapshots
{
  BSDispatchQueueAssert();
  queue_fullSizeCachableAppLayouts = self->_queue_fullSizeCachableAppLayouts;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __80__SBAppSwitcherSnapshotImageCache__cachableAppLayoutsRequiringFullSizeSnapshots__block_invoke;
  v6[3] = &unk_1E6AF4B60;
  v6[4] = self;
  id v4 = [(NSArray *)queue_fullSizeCachableAppLayouts bs_filter:v6];
  return v4;
}

uint64_t __80__SBAppSwitcherSnapshotImageCache__cachableAppLayoutsRequiringFullSizeSnapshots__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 128) containsObject:a2];
}

- (void)_snapshotImage:(id)a3 finishedLoadingForRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BSDispatchQueueAssert();
  id v8 = SBLogSwitcherSnapshotCache();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[SBAppSwitcherSnapshotImageCache _snapshotImage:finishedLoadingForRequest:]((uint64_t)self, (uint64_t)v7, v8);
  }

  id v9 = [v7 displayItem];
  BOOL v10 = [(SBAppSwitcherSnapshotImageCache *)self _isValidSnapshotRequest:v7];
  uint64_t v11 = @"invalid";
  if (v10) {
    uint64_t v11 = @"valid";
  }
  uint64_t v12 = [NSString stringWithFormat:@"Finished loading %@ request", v11];
  [(SBAppSwitcherSnapshotImageCache *)self _purgeSnapshotRequest:v7 withReason:v12];

  if (v10)
  {
    [(SBAppSwitcherSnapshotImageCache *)self _addCacheEntryForImage:v6 fromRequest:v7];
    long long v13 = [_SBAppSwitcherSnapshotCacheKey alloc];
    long long v14 = [v7 appLayout];
    long long v15 = [(_SBAppSwitcherSnapshotCacheKey *)v13 initWithDisplayItem:v9 inAppLayout:v14];

    long long v16 = [(NSMutableDictionary *)self->_cachedSnapshots objectForKey:v15];
    [v16 setNeedsUpdate:0];
    objc_initWeak(&location, self);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __76__SBAppSwitcherSnapshotImageCache__snapshotImage_finishedLoadingForRequest___block_invoke;
    block[3] = &unk_1E6AFF9F8;
    objc_copyWeak(&v22, &location);
    id v19 = v9;
    id v20 = v7;
    id v21 = v16;
    id v17 = v16;
    dispatch_async(MEMORY[0x1E4F14428], block);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
  [(SBAppSwitcherSnapshotImageCache *)self _enqueueNextSnapshotRequestIfNecessary];
}

void __76__SBAppSwitcherSnapshotImageCache__snapshotImage_finishedLoadingForRequest___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    uint64_t v2 = *(void *)(a1 + 32);
    id v3 = [*(id *)(a1 + 40) appLayout];
    [WeakRetained _updateObserversForDisplayItem:v2 inAppLayout:v3 withCacheEntry:*(void *)(a1 + 48)];
  }
}

- (void)_addCacheEntryForImage:(id)a3 fromRequest:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  BSDispatchQueueAssert();
  id v8 = SBLogSwitcherSnapshotCache();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[SBAppSwitcherSnapshotImageCache _addCacheEntryForImage:fromRequest:]();
  }

  id v9 = [v7 appLayout];
  BOOL v10 = [v7 displayItem];
  uint64_t v11 = objc_alloc_init(SBAppSwitcherSnapshotCacheEntry);
  [(SBAppSwitcherSnapshotCacheEntry *)v11 setAppLayout:v9];
  [(SBAppSwitcherSnapshotCacheEntry *)v11 setDisplayItem:v10];
  uint64_t v12 = [v7 snapshot];
  [(SBAppSwitcherSnapshotCacheEntry *)v11 setSnapshot:v12];

  [(SBAppSwitcherSnapshotCacheEntry *)v11 setSnapshotImage:v6];
  -[SBAppSwitcherSnapshotCacheEntry setFromFullSizeSnapshotRequest:](v11, "setFromFullSizeSnapshotRequest:", [v7 loadFullSizeSnapshot]);
  long long v13 = [[_SBAppSwitcherSnapshotCacheKey alloc] initWithDisplayItem:v10 inAppLayout:v9];
  [(NSMutableDictionary *)self->_cachedSnapshots setObject:v11 forKey:v13];
  long long v14 = SBLogSwitcherSnapshotCache();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    debugName = self->_debugName;
    long long v16 = [v7 displayItem];
    int v17 = 138543874;
    uint64_t v18 = debugName;
    __int16 v19 = 2114;
    id v20 = v6;
    __int16 v21 = 2114;
    id v22 = v16;
    _os_log_debug_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEBUG, "[%{public}@] cached image %{public}@ for display item [%{public}@]", (uint8_t *)&v17, 0x20u);
  }
}

- (BOOL)_keepGoingForRequest:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_snapshotQueue);
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  controlQueue = self->_controlQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__SBAppSwitcherSnapshotImageCache__keepGoingForRequest___block_invoke;
  block[3] = &unk_1E6AF6380;
  id v9 = v4;
  BOOL v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(controlQueue, block);
  LOBYTE(v4) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

uint64_t __56__SBAppSwitcherSnapshotImageCache__keepGoingForRequest___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _isValidSnapshotRequest:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (void)_asynchronouslyLoadSnapshotFromRequest:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_snapshotQueue);
  BOOL v5 = SBLogSwitcherSnapshotCache();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[SBAppSwitcherSnapshotImageCache _asynchronouslyLoadSnapshotFromRequest:].cold.4();
  }

  if (![(SBAppSwitcherSnapshotImageCache *)self _keepGoingForRequest:v4])
  {
    id v8 = SBLogSwitcherSnapshotCache();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[SBAppSwitcherSnapshotImageCache _asynchronouslyLoadSnapshotFromRequest:]();
    }
    goto LABEL_11;
  }
  id v6 = [v4 snapshot];
  id v7 = [v6 imageForInterfaceOrientation:0];

  id v8 = SBLogSwitcherSnapshotCache();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
  if (!v7)
  {
    if (v9) {
      -[SBAppSwitcherSnapshotImageCache _asynchronouslyLoadSnapshotFromRequest:]();
    }
LABEL_11:
    id v7 = 0;
    goto LABEL_12;
  }
  if (v9) {
    -[SBAppSwitcherSnapshotImageCache _asynchronouslyLoadSnapshotFromRequest:]();
  }
LABEL_12:

  objc_initWeak(&location, self);
  controlQueue = self->_controlQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __74__SBAppSwitcherSnapshotImageCache__asynchronouslyLoadSnapshotFromRequest___block_invoke;
  v13[3] = &unk_1E6AFB8D8;
  objc_copyWeak(&v16, &location);
  id v14 = v7;
  id v15 = v4;
  id v11 = v4;
  id v12 = v7;
  dispatch_async(controlQueue, v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __74__SBAppSwitcherSnapshotImageCache__asynchronouslyLoadSnapshotFromRequest___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _snapshotImage:*(void *)(a1 + 32) finishedLoadingForRequest:*(void *)(a1 + 40)];
    id WeakRetained = v3;
  }
}

- (SBAppSwitcherSnapshotImageCacheDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBAppSwitcherSnapshotImageCacheDelegate *)WeakRetained;
}

- (BOOL)reloadsSnapshotsForActiveInterfaceOrientationChange
{
  return self->_reloadsSnapshotsForActiveInterfaceOrientationChange;
}

- (NSString)debugName
{
  return self->_debugName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugName, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue_fullSizeCachableAppLayouts, 0);
  objc_storeStrong((id *)&self->_queue_cachableAppLayouts, 0);
  objc_storeStrong((id *)&self->_orientationLockManager, 0);
  objc_storeStrong((id *)&self->_applicationController, 0);
  objc_storeStrong((id *)&self->_iconController, 0);
  objc_storeStrong((id *)&self->_stateCaptureInvalidatable, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_snapshotRequestsCurrentlyBeingLoaded, 0);
  objc_storeStrong((id *)&self->_cacheEntryUpdateObservers, 0);
  objc_storeStrong((id *)&self->_cachedSnapshots, 0);
  objc_storeStrong((id *)&self->_controlQueue, 0);
  objc_storeStrong((id *)&self->_snapshotQueue, 0);
}

void __57__SBAppSwitcherSnapshotImageCache_setCachableAppLayouts___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_7_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_1(&dword_1D85BA000, v0, v1, "[%{public}@] Updating cache because there are new cachable app layouts.", v2, v3, v4, v5, v6);
}

void __65__SBAppSwitcherSnapshotImageCache_setFullSizeCachableAppLayouts___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_7_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_1(&dword_1D85BA000, v0, v1, "[%{public}@] Updating cache because there are new full size cachable app layouts.", v2, v3, v4, v5, v6);
}

- (void)_updateCacheForDisplayItem:.cold.1()
{
  OUTLINED_FUNCTION_3_6(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_1(&dword_1D85BA000, v0, v1, "[%{public}@] cache update requested for display item", v2, v3, v4, v5, v6);
}

void __62__SBAppSwitcherSnapshotImageCache__updateCacheForDisplayItem___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_1(&dword_1D85BA000, v0, v1, "[Updating] cache since snapshot changed for display item %{public}@", v2, v3, v4, v5, v6);
}

- (void)addSnapshotUpdateObserver:forDisplayItem:inAppLayout:.cold.1()
{
  OUTLINED_FUNCTION_3_6(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_23();
  OUTLINED_FUNCTION_2(&dword_1D85BA000, v0, v1, "[%{public}@] display item %{public}@ is not one of the cachable one.");
}

void __88__SBAppSwitcherSnapshotImageCache_addSnapshotUpdateObserver_forDisplayItem_inAppLayout___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_8(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_15();
  OUTLINED_FUNCTION_2(&dword_1D85BA000, v0, v1, "[%{public}@] cache miss: no cache entry yet for %{public}@");
}

void __88__SBAppSwitcherSnapshotImageCache_addSnapshotUpdateObserver_forDisplayItem_inAppLayout___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_7_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_15();
  OUTLINED_FUNCTION_2(&dword_1D85BA000, v0, v1, "[%{public}@] cache hit for %{public}@");
}

void __88__SBAppSwitcherSnapshotImageCache_addSnapshotUpdateObserver_forDisplayItem_inAppLayout___block_invoke_2_cold_3()
{
  OUTLINED_FUNCTION_8(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_15();
  OUTLINED_FUNCTION_2(&dword_1D85BA000, v0, v1, "[%{public}@] cache miss: invalid cache entry for %{public}@");
}

- (void)reloadSnapshotsForInterfaceStyleChange:.cold.1()
{
  OUTLINED_FUNCTION_3_6(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_2(&dword_1D85BA000, v0, v1, "[%{public}@] reloading snapshots for user interface style: %lu");
}

- (void)_snapshotChanged:.cold.1()
{
  OUTLINED_FUNCTION_3_6(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_23();
  OUTLINED_FUNCTION_2(&dword_1D85BA000, v0, v1, "[%{public}@] snapshot changed notification received for display item %{public}@");
}

- (void)_updateObserversForDisplayItem:inAppLayout:withCacheEntry:.cold.1()
{
  OUTLINED_FUNCTION_3_6(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_1(&dword_1D85BA000, v0, v1, "[%{public}@] call completion block for display item", v2, v3, v4, v5, v6);
}

- (void)_cacheSnapshotForRequest:withDisplayItem:inAppLayout:.cold.1()
{
  OUTLINED_FUNCTION_3_6(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_23();
  OUTLINED_FUNCTION_2(&dword_1D85BA000, v0, v1, "[%{public}@] no snapshot (or default image) for [%{public}@]");
}

- (void)_cacheSnapshotForRequest:withDisplayItem:inAppLayout:.cold.2()
{
  OUTLINED_FUNCTION_3_6(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_23();
  OUTLINED_FUNCTION_2(&dword_1D85BA000, v0, v1, "[%{public}@] async snapshot load kicked off for %{public}@");
}

- (void)_cacheSnapshotForRequest:withDisplayItem:inAppLayout:.cold.3()
{
  OUTLINED_FUNCTION_3_6(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_23();
  OUTLINED_FUNCTION_2(&dword_1D85BA000, v0, v1, "[%{public}@] image loaded from existing XB cache %{public}@");
}

- (void)_cacheSnapshotForRequest:withDisplayItem:inAppLayout:.cold.4()
{
  OUTLINED_FUNCTION_3_6(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_1(&dword_1D85BA000, v0, v1, "[%{public}@] cache snapshot for request", v2, v3, v4, v5, v6);
}

- (void)_loadSnapshotForRequest:(uint64_t)a3 withDisplayItem:(NSObject *)a4 inAppLayout:.cold.1(uint64_t a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a2 = 138543618;
  *(void *)(a2 + 4) = a1;
  *(_WORD *)(a2 + 12) = 2048;
  *(void *)(a2 + 14) = a3;
  OUTLINED_FUNCTION_4_5(&dword_1D85BA000, a4, a3, "[%{public}@] load snapshot request is no more valid, sequenceID: %lu", (uint8_t *)a2);
}

- (void)_loadSnapshotForRequest:withDisplayItem:inAppLayout:.cold.2()
{
  OUTLINED_FUNCTION_3_6(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_23();
  OUTLINED_FUNCTION_2(&dword_1D85BA000, v0, v1, "[%{public}@] stopping default App Layouts loading cycle, waiting for downscaled snapshot request to complete for [%{public}@]");
}

- (void)_loadSnapshotForRequest:withDisplayItem:inAppLayout:.cold.3()
{
  OUTLINED_FUNCTION_3_6(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_1(&dword_1D85BA000, v0, v1, "[%{public}@] creating downscaled default snapshot request for default app layout", v2, v3, v4, v5, v6);
}

- (void)_loadSnapshotForRequest:withDisplayItem:inAppLayout:.cold.4()
{
  OUTLINED_FUNCTION_3_6(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_2(&dword_1D85BA000, v0, v1, "[%{public}@] load snapshot request: %@");
}

void __87__SBAppSwitcherSnapshotImageCache__loadSnapshotForRequest_withDisplayItem_inAppLayout___block_invoke_267_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 152);
  uint64_t v4 = [*(id *)(a1 + 40) sequenceID];
  int v6 = 138543618;
  uint64_t v7 = v3;
  __int16 v8 = 2048;
  uint64_t v9 = v4;
  OUTLINED_FUNCTION_4_5(&dword_1D85BA000, a2, v5, "\n|\n|— [%{public}@] [Loading] request was matched by already cached entry. Request sequenceID: %lu\n|", (uint8_t *)&v6);
}

void __115__SBAppSwitcherSnapshotImageCache__createDownscaledVariantForRequest_snapshot_displayItem_sceneHandle_application___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_8(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_15();
  OUTLINED_FUNCTION_2(&dword_1D85BA000, v0, v1, "[%{public}@] failed to create default App Layouts downscaled variant for [%{public}@]");
}

void __124__SBAppSwitcherSnapshotImageCache_activeInterfaceOrientationDidChangeToOrientation_willAnimateWithDuration_fromOrientation___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_7_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_2(&dword_1D85BA000, v0, v1, "[%{public}@] updating snapshots for new interface orientation %ld");
}

- (void)_purgeSnapshotRequestsForDisplayItem:withReason:.cold.1()
{
  OUTLINED_FUNCTION_3_6(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_1(&dword_1D85BA000, v0, v1, "[%{public}@] purge snapshot requests for display item", v2, v3, v4, v5, v6);
}

- (void)_purgeSnapshotsForKey:.cold.1()
{
  OUTLINED_FUNCTION_3_6(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_23();
  OUTLINED_FUNCTION_2(&dword_1D85BA000, v0, v1, "\n|\n|— [%{public}@] [Purging] displayItems: %{public}@\n|");
}

- (void)_purgeSnapshotsForKey:(NSObject *)a3 .cold.2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v4 = objc_msgSend((id)OUTLINED_FUNCTION_9_0(a1, a2), "uniqueIdentifier");
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_4_5(&dword_1D85BA000, a3, v5, "\n|\n|— [%{public}@] [Purging] displayItem with uniqueID: %{public}@\n|", v6);
}

- (void)_purgeSnapshotsForKey:.cold.3()
{
  OUTLINED_FUNCTION_3_6(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_1(&dword_1D85BA000, v0, v1, "[%{public}@] purge snapshots for display item", v2, v3, v4, v5, v6);
}

- (void)_setSnapshotNeedsUpdateForDisplayItem:.cold.1()
{
  OUTLINED_FUNCTION_3_6(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_1(&dword_1D85BA000, v0, v1, "[%{public}@] set snapshots need update for display item", v2, v3, v4, v5, v6);
}

- (void)_snapshotImage:(NSObject *)a3 finishedLoadingForRequest:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = objc_msgSend((id)OUTLINED_FUNCTION_9_0(a1, a2), "succinctDescription");
  int v7 = 138543618;
  uint64_t v8 = v3;
  __int16 v9 = 2112;
  uint64_t v10 = v5;
  OUTLINED_FUNCTION_4_5(&dword_1D85BA000, a3, v6, "[%{public}@] finished loading snapshot request %@", (uint8_t *)&v7);
}

- (void)_addCacheEntryForImage:fromRequest:.cold.1()
{
  OUTLINED_FUNCTION_3_6(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_2(&dword_1D85BA000, v0, v1, "[%{public}@] updating cache entry for completed snapshot request %@");
}

- (void)_asynchronouslyLoadSnapshotFromRequest:.cold.1()
{
  OUTLINED_FUNCTION_3_6(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_23();
  OUTLINED_FUNCTION_2(&dword_1D85BA000, v0, v1, "[%{public}@] loaded snapshot image for [%{public}@]");
}

- (void)_asynchronouslyLoadSnapshotFromRequest:.cold.2()
{
  OUTLINED_FUNCTION_3_6(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_23();
  OUTLINED_FUNCTION_2(&dword_1D85BA000, v0, v1, "[%{public}@] failed to load snapshot image for [%{public}@]");
}

- (void)_asynchronouslyLoadSnapshotFromRequest:.cold.3()
{
  OUTLINED_FUNCTION_3_6(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_23();
  OUTLINED_FUNCTION_2(&dword_1D85BA000, v0, v1, "[%{public}@] couldn't load image since request is no more valid [%{public}@]");
}

- (void)_asynchronouslyLoadSnapshotFromRequest:.cold.4()
{
  OUTLINED_FUNCTION_3_6(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_23();
  OUTLINED_FUNCTION_2(&dword_1D85BA000, v0, v1, "[%{public}@] async snapshot image loading for request %{public}@");
}

@end