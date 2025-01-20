@interface STBundleManager
+ (id)_defaultBundleRecordDirectoriesForClass:(Class)a3;
+ (id)_defaultBundleRecordIdentifierAllowListForClass:(Class)a3;
- (Class)bundleRecordClass;
- (NSSet)recordIdentifiers;
- (STBundleManager)initWithBundleRecordClass:(Class)a3;
- (id)_initWithBundleRecordClass:(Class)a3 directoryURLs:(id)a4 allowedBundleRecordIdentifiers:(id)a5;
- (id)_queue_loadAllBundleRecords;
- (id)bundleRecordForRecordIdentifier:(id)a3;
- (void)_queue_prepareInternalPreferences;
- (void)_queue_registerForInternalPreferenceChanges;
- (void)_queue_runBlockOnObservers:(id)a3;
- (void)_queue_setIgnoreAllowedList:(BOOL)a3;
- (void)_queue_unregisterForInternalPreferenceChanges;
- (void)_queue_updateAllBundleRecords;
- (void)_queue_updateAllBundleRecordsForAllBundleRecords:(id)a3;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
@end

@implementation STBundleManager

- (id)_initWithBundleRecordClass:(Class)a3 directoryURLs:(id)a4 allowedBundleRecordIdentifiers:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v28.receiver = self;
  v28.super_class = (Class)STBundleManager;
  v10 = [(STBundleManager *)&v28 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_bundleRecordClass, a3);
    uint64_t v12 = [v8 copy];
    directoryURLs = v11->_directoryURLs;
    v11->_directoryURLs = (NSArray *)v12;

    uint64_t v14 = [v9 copy];
    allowedBundleRecordIdentifiers = v11->_allowedBundleRecordIdentifiers;
    v11->_allowedBundleRecordIdentifiers = (NSSet *)v14;

    uint64_t v16 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
    queue_observers = v11->_queue_observers;
    v11->_queue_observers = (NSHashTable *)v16;

    v18 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v19 = dispatch_queue_create("com.apple.SystemStatus.BundleManager.work", v18);
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v19;

    v21 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v22 = dispatch_queue_create("com.apple.SystemStatus.BundleManager.callout", v21);
    callOutQueue = v11->_callOutQueue;
    v11->_callOutQueue = (OS_dispatch_queue *)v22;

    v24 = v11->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __91__STBundleManager__initWithBundleRecordClass_directoryURLs_allowedBundleRecordIdentifiers___block_invoke;
    block[3] = &unk_1E6B633E8;
    v27 = v11;
    dispatch_sync(v24, block);
  }
  return v11;
}

uint64_t __91__STBundleManager__initWithBundleRecordClass_directoryURLs_allowedBundleRecordIdentifiers___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_prepareInternalPreferences");
  objc_msgSend(*(id *)(a1 + 32), "_queue_updateAllBundleRecords");
  v2 = *(void **)(a1 + 32);

  return objc_msgSend(v2, "_queue_registerForInternalPreferenceChanges");
}

- (STBundleManager)initWithBundleRecordClass:(Class)a3
{
  v5 = [(id)objc_opt_class() _defaultBundleRecordDirectoriesForClass:a3];
  v6 = [(id)objc_opt_class() _defaultBundleRecordIdentifierAllowListForClass:a3];
  v7 = [(STBundleManager *)self _initWithBundleRecordClass:a3 directoryURLs:v5 allowedBundleRecordIdentifiers:v6];

  return v7;
}

+ (id)_defaultBundleRecordDirectoriesForClass:(Class)a3
{
  v4 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 8uLL, 1);
  if (MEMORY[0x1E0164160]("+[STBundleManager _defaultBundleRecordDirectoriesForClass:]"))
  {
    v5 = +[STSystemStatusDefaults standardDefaults];
    int v6 = [v5 shouldEnableInternalBundles];

    if (v6)
    {
      v7 = [NSString pathWithComponents:&unk_1F336D278];
      uint64_t v8 = [v4 arrayByAddingObject:v7];

      v4 = (void *)v8;
    }
  }
  id v9 = [(objc_class *)a3 recordType];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __59__STBundleManager__defaultBundleRecordDirectoriesForClass___block_invoke;
  v13[3] = &unk_1E6B63960;
  id v14 = v9;
  id v10 = v9;
  v11 = objc_msgSend(v4, "bs_map:", v13);

  return v11;
}

id __59__STBundleManager__defaultBundleRecordDirectoriesForClass___block_invoke(uint64_t a1, void *a2)
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F1CB10];
  id v4 = a2;
  v5 = BSSystemRootDirectory();
  v9[0] = v5;
  v9[1] = v4;
  v9[2] = @"SystemStatus";
  v9[3] = @"Bundles";
  v9[4] = *(void *)(a1 + 32);
  int v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];
  v7 = [v3 fileURLWithPathComponents:v6];

  return v7;
}

+ (id)_defaultBundleRecordIdentifierAllowListForClass:(Class)a3
{
  id v4 = [(objc_class *)a3 recordType];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__STBundleManager__defaultBundleRecordIdentifierAllowListForClass___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (qword_1EB5A3558 != -1) {
    dispatch_once(&qword_1EB5A3558, block);
  }
  v5 = [(id)_MergedGlobals_7 objectForKey:v4];
  int v6 = [MEMORY[0x1E4F1CAD0] setWithArray:v5];

  return v6;
}

void __67__STBundleManager__defaultBundleRecordIdentifierAllowListForClass___block_invoke()
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v1 = [v0 URLForResource:@"BundleAllowList" withExtension:@"plist"];

  id v8 = 0;
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithContentsOfURL:v1 error:&v8];
  id v3 = v8;
  id v4 = v3;
  if (v2) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5)
  {
    id v7 = v2;
    int v6 = _MergedGlobals_7;
    _MergedGlobals_7 = (uint64_t)v7;
  }
  else
  {
    int v6 = STSystemStatusLogBundleLoading();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = v4;
      _os_log_error_impl(&dword_1D9514000, v6, OS_LOG_TYPE_ERROR, "Unable to load bundle allow list: %@", buf, 0xCu);
    }
  }
}

- (id)bundleRecordForRecordIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__1;
  uint64_t v16 = __Block_byref_object_dispose__1;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__STBundleManager_bundleRecordForRecordIdentifier___block_invoke;
  block[3] = &unk_1E6B63170;
  id v10 = v4;
  uint64_t v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

void __51__STBundleManager_bundleRecordForRecordIdentifier___block_invoke(void *a1)
{
  id v5 = [*(id *)(a1[4] + 56) objectForKey:a1[5]];
  uint64_t v2 = [v5 copyWithZone:0];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSSet)recordIdentifiers
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__1;
  id v10 = __Block_byref_object_dispose__1;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__STBundleManager_recordIdentifiers__block_invoke;
  v5[3] = &unk_1E6B639A8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSSet *)v3;
}

void __36__STBundleManager_recordIdentifiers__block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1CAD0];
  id v6 = [*(id *)(*(void *)(a1 + 32) + 56) allKeys];
  uint64_t v3 = [v2 setWithArray:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __31__STBundleManager_addObserver___block_invoke;
  v7[3] = &unk_1E6B63080;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __31__STBundleManager_addObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 64) addObject:*(void *)(a1 + 40)];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __34__STBundleManager_removeObserver___block_invoke;
  v7[3] = &unk_1E6B63080;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __34__STBundleManager_removeObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 64) removeObject:*(void *)(a1 + 40)];
}

- (void)_queue_runBlockOnObservers:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = [(NSHashTable *)self->_queue_observers allObjects];
  callOutQueue = self->_callOutQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __46__STBundleManager__queue_runBlockOnObservers___block_invoke;
  v9[3] = &unk_1E6B639D0;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(callOutQueue, v9);
}

uint64_t __46__STBundleManager__queue_runBlockOnObservers___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "bs_each:", *(void *)(a1 + 40));
}

- (void)_queue_updateAllBundleRecords
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = [(STBundleManager *)self _queue_loadAllBundleRecords];
  [(STBundleManager *)self _queue_updateAllBundleRecordsForAllBundleRecords:v3];
}

- (id)_queue_loadAllBundleRecords
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = [(NSArray *)self->_directoryURLs bs_mapNoNulls:&__block_literal_global_8];
  id v4 = objc_msgSend(v3, "bs_flatten");
  id v5 = objc_msgSend(v4, "bs_filter:", &__block_literal_global_34);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __46__STBundleManager__queue_loadAllBundleRecords__block_invoke_3;
  v8[3] = &unk_1E6B63A38;
  v8[4] = self;
  id v6 = objc_msgSend(v5, "bs_mapNoNulls:", v8);

  return v6;
}

id __46__STBundleManager__queue_loadAllBundleRecords__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F28CB8];
  id v3 = a2;
  id v4 = [v2 defaultManager];
  id v5 = [v4 contentsOfDirectoryAtURL:v3 includingPropertiesForKeys:0 options:1 error:0];

  return v5;
}

BOOL __46__STBundleManager__queue_loadAllBundleRecords__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 pathExtension];
  BOOL v3 = [v2 caseInsensitiveCompare:@"bundle"] == 0;

  return v3;
}

id __46__STBundleManager__queue_loadAllBundleRecords__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(*(void *)(a1 + 32) + 8) bundleRecordForBundleAtURL:v3];
  id v5 = v4;
  uint64_t v6 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v6 + 72)
    || (id v7 = *(void **)(v6 + 24),
        [v4 recordIdentifier],
        id v8 = objc_claimAutoreleasedReturnValue(),
        LODWORD(v7) = [v7 containsObject:v8],
        v8,
        v7))
  {
    id v9 = STSystemStatusLogBundleLoading();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v14 = 138543618;
      id v15 = v3;
      __int16 v16 = 2114;
      id v17 = v5;
      _os_log_impl(&dword_1D9514000, v9, OS_LOG_TYPE_INFO, "Loaded bundle at %{public}@:\n%{public}@", (uint8_t *)&v14, 0x16u);
    }
    id v10 = v5;
  }
  else
  {
    if (!MEMORY[0x1E0164160]("-[STBundleManager _queue_loadAllBundleRecords]_block_invoke"))
    {
      id v10 = 0;
      goto LABEL_7;
    }
    id v9 = STSystemStatusLogBundleLoading();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v13 = [v5 recordIdentifier];
      int v14 = 138543618;
      id v15 = v3;
      __int16 v16 = 2114;
      id v17 = v13;
      _os_log_error_impl(&dword_1D9514000, v9, OS_LOG_TYPE_ERROR, "Not loading bundle at %{public}@, either add %{public}@ to the allow list, or configure SystemStatus for debugging.", (uint8_t *)&v14, 0x16u);
    }
    id v10 = 0;
  }

LABEL_7:
  id v11 = v10;

  return v11;
}

- (void)_queue_updateAllBundleRecordsForAllBundleRecords:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v12 = [v11 recordIdentifier];
        [v5 setObject:v11 forKey:v12];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  if ((BSEqualObjects() & 1) == 0)
  {
    v13 = (NSDictionary *)[v5 copy];
    queue_allBundleRecordsByIdentifier = self->_queue_allBundleRecordsByIdentifier;
    self->_queue_allBundleRecordsByIdentifier = v13;

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __68__STBundleManager__queue_updateAllBundleRecordsForAllBundleRecords___block_invoke;
    v15[3] = &unk_1E6B63A60;
    v15[4] = self;
    [(STBundleManager *)self _queue_runBlockOnObservers:v15];
  }
}

uint64_t __68__STBundleManager__queue_updateAllBundleRecordsForAllBundleRecords___block_invoke(uint64_t a1, void *a2)
{
  return [a2 recordBundlesChangedForBundleManager:*(void *)(a1 + 32)];
}

- (void)_queue_prepareInternalPreferences
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (MEMORY[0x1E0164160]("-[STBundleManager _queue_prepareInternalPreferences]"))
  {
    id v3 = +[STSystemStatusDefaults standardDefaults];
    self->_queue_ignoreAllowList = [v3 shouldEnableUnknownBundles];
  }
  else
  {
    self->_queue_ignoreAllowList = 0;
  }
}

- (void)_queue_registerForInternalPreferenceChanges
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_initWeak(&location, self);
  id v3 = +[STSystemStatusDefaults standardDefaults];
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__STBundleManager__queue_registerForInternalPreferenceChanges__block_invoke;
  v7[3] = &unk_1E6B630F8;
  objc_copyWeak(&v8, &location);
  id v5 = [v3 observeDefault:@"shouldEnableUnknownBundles" onQueue:queue withBlock:v7];
  internalDefaultsObserver = self->_internalDefaultsObserver;
  self->_internalDefaultsObserver = v5;

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __62__STBundleManager__queue_registerForInternalPreferenceChanges__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = +[STSystemStatusDefaults standardDefaults];
  objc_msgSend(WeakRetained, "_queue_setIgnoreAllowedList:", objc_msgSend(v1, "shouldEnableUnknownBundles"));
}

- (void)_queue_unregisterForInternalPreferenceChanges
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  internalDefaultsObserver = self->_internalDefaultsObserver;

  [(BSDefaultObserver *)internalDefaultsObserver invalidate];
}

- (void)_queue_setIgnoreAllowedList:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (MEMORY[0x1E0164160]("-[STBundleManager _queue_setIgnoreAllowedList:]")
    && self->_queue_ignoreAllowList != v3)
  {
    self->_queue_ignoreAllowList = v3;
    id v5 = STSystemStatusLogBundleLoading();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = @"Disabling";
      if (v3) {
        id v6 = @"Enabling";
      }
      int v7 = 138412290;
      id v8 = v6;
      _os_log_impl(&dword_1D9514000, v5, OS_LOG_TYPE_DEFAULT, "%@ bundles which are not on the allow list and re-scanning...", (uint8_t *)&v7, 0xCu);
    }

    [(STBundleManager *)self _queue_updateAllBundleRecords];
  }
}

- (Class)bundleRecordClass
{
  return self->_bundleRecordClass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue_observers, 0);
  objc_storeStrong((id *)&self->_queue_allBundleRecordsByIdentifier, 0);
  objc_storeStrong((id *)&self->_internalDefaultsObserver, 0);
  objc_storeStrong((id *)&self->_callOutQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_allowedBundleRecordIdentifiers, 0);
  objc_storeStrong((id *)&self->_directoryURLs, 0);

  objc_storeStrong((id *)&self->_bundleRecordClass, 0);
}

@end