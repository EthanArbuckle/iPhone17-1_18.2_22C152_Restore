@interface ICQUsageStorageCache
- (ICQUsageStorageCache)init;
- (float)sizeForMediaQuery:(id)a3 withGroupingType:(int64_t)a4 storingInCache:(id)a5 withKey:(id)a6;
- (float)specialStorageUsageForBundleID:(id)a3;
- (id)checkAndFixUpVersion:(id)a3;
- (id)mediaCollectionForKey:(id)a3;
- (void)cancelUsageDataPopulation;
- (void)populateMediaCache;
- (void)populateUsageAppsCacheWithHandler:(id)a3;
- (void)populateUsageBundlesCacheWithHandler:(id)a3;
- (void)populateUsageDataWithProgressBlock:(id)a3;
- (void)removeMediaCollectionCacheForKey:(id)a3;
@end

@implementation ICQUsageStorageCache

- (ICQUsageStorageCache)init
{
  v6.receiver = self;
  v6.super_class = (Class)ICQUsageStorageCache;
  v2 = [(ICQUsageStorageCache *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.preferences.usage_storage_monitor", 0);
    cache_operation_queue = v2->_cache_operation_queue;
    v2->_cache_operation_queue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (void)populateUsageDataWithProgressBlock:(id)a3
{
  id v4 = a3;
  if (!v4) {
    -[ICQUsageStorageCache populateUsageDataWithProgressBlock:]();
  }
  v5 = v4;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = __Block_byref_object_copy__7;
  v14[4] = __Block_byref_object_dispose__7;
  id v15 = (id)objc_opt_new();
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = __Block_byref_object_copy__7;
  v12[4] = __Block_byref_object_dispose__7;
  id v13 = (id)objc_opt_new();
  cache_operation_queue = self->_cache_operation_queue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __59__ICQUsageStorageCache_populateUsageDataWithProgressBlock___block_invoke;
  v8[3] = &unk_264923330;
  v10 = v14;
  v11 = v12;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(cache_operation_queue, v8);

  _Block_object_dispose(v12, 8);
  _Block_object_dispose(v14, 8);
}

void __59__ICQUsageStorageCache_populateUsageDataWithProgressBlock___block_invoke(void *a1)
{
  v2 = dispatch_group_create();
  dispatch_queue_t v3 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__ICQUsageStorageCache_populateUsageDataWithProgressBlock___block_invoke_2;
  block[3] = &unk_264921C80;
  block[4] = a1[4];
  dispatch_group_async(v2, v3, block);

  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __59__ICQUsageStorageCache_populateUsageDataWithProgressBlock___block_invoke_3;
  v23[3] = &unk_264923290;
  uint64_t v4 = a1[6];
  v23[4] = a1[4];
  v23[5] = v4;
  dispatch_group_async(v2, v3, v23);

  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __59__ICQUsageStorageCache_populateUsageDataWithProgressBlock___block_invoke_6;
  v22[3] = &unk_264923290;
  uint64_t v5 = a1[7];
  v22[4] = a1[4];
  v22[5] = v5;
  dispatch_group_async(v2, v3, v22);

  dispatch_time_t v6 = dispatch_time(0, 3000000000);
  if (dispatch_group_wait(v2, v6))
  {
    id v7 = MEMORY[0x263EF83A0];
    do
    {
      uint64_t v8 = a1[4];
      if (!*(unsigned char *)(v8 + 48))
      {
        id v9 = (void *)[*(id *)(v8 + 16) copy];
        v18[0] = MEMORY[0x263EF8330];
        v18[1] = 3221225472;
        v18[2] = __59__ICQUsageStorageCache_populateUsageDataWithProgressBlock___block_invoke_9;
        v18[3] = &unk_2649232E0;
        v10 = (void *)a1[5];
        v18[4] = a1[4];
        id v11 = v10;
        long long v21 = *((_OWORD *)a1 + 3);
        id v19 = v9;
        id v20 = v11;
        id v12 = v9;
        dispatch_async(v7, v18);
      }
      dispatch_time_t v13 = dispatch_time(0, 3000000000);
    }
    while (dispatch_group_wait(v2, v13));
  }
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __59__ICQUsageStorageCache_populateUsageDataWithProgressBlock___block_invoke_10;
  v15[3] = &unk_264923308;
  v14 = (void *)a1[5];
  v15[4] = a1[4];
  id v16 = v14;
  long long v17 = *((_OWORD *)a1 + 3);
  dispatch_async(MEMORY[0x263EF83A0], v15);
}

uint64_t __59__ICQUsageStorageCache_populateUsageDataWithProgressBlock___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) populateMediaCache];
}

uint64_t __59__ICQUsageStorageCache_populateUsageDataWithProgressBlock___block_invoke_3(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __59__ICQUsageStorageCache_populateUsageDataWithProgressBlock___block_invoke_4;
  v2[3] = &unk_264923268;
  return [*(id *)(a1 + 32) populateUsageAppsCacheWithHandler:v2];
}

BOOL __59__ICQUsageStorageCache_populateUsageDataWithProgressBlock___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __59__ICQUsageStorageCache_populateUsageDataWithProgressBlock___block_invoke_5;
  v8[3] = &unk_264922780;
  uint64_t v4 = *(void *)(a1 + 40);
  id v9 = v3;
  uint64_t v10 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v8);
  BOOL v6 = *(unsigned char *)(*(void *)(a1 + 32) + 48) == 0;

  return v6;
}

uint64_t __59__ICQUsageStorageCache_populateUsageDataWithProgressBlock___block_invoke_5(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:*(void *)(a1 + 32)];
}

uint64_t __59__ICQUsageStorageCache_populateUsageDataWithProgressBlock___block_invoke_6(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __59__ICQUsageStorageCache_populateUsageDataWithProgressBlock___block_invoke_7;
  v2[3] = &unk_2649232B8;
  return [*(id *)(a1 + 32) populateUsageBundlesCacheWithHandler:v2];
}

BOOL __59__ICQUsageStorageCache_populateUsageDataWithProgressBlock___block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __59__ICQUsageStorageCache_populateUsageDataWithProgressBlock___block_invoke_8;
  v8[3] = &unk_264922780;
  uint64_t v4 = *(void *)(a1 + 40);
  id v9 = v3;
  uint64_t v10 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v8);
  BOOL v6 = *(unsigned char *)(*(void *)(a1 + 32) + 48) == 0;

  return v6;
}

uint64_t __59__ICQUsageStorageCache_populateUsageDataWithProgressBlock___block_invoke_8(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:*(void *)(a1 + 32)];
}

void __59__ICQUsageStorageCache_populateUsageDataWithProgressBlock___block_invoke_9(void *a1)
{
  if (!*(unsigned char *)(a1[4] + 48))
  {
    (*(void (**)(void))(a1[6] + 16))();
    uint64_t v2 = objc_opt_new();
    uint64_t v3 = *(void *)(a1[7] + 8);
    uint64_t v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;

    uint64_t v5 = objc_opt_new();
    uint64_t v6 = *(void *)(a1[8] + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
}

void __59__ICQUsageStorageCache_populateUsageDataWithProgressBlock___block_invoke_10(void *a1)
{
  uint64_t v1 = a1[4];
  if (!*(unsigned char *)(v1 + 48))
  {
    uint64_t v2 = a1[5];
    uint64_t v3 = *(void *)(*(void *)(a1[6] + 8) + 40);
    uint64_t v4 = *(void *)(*(void *)(a1[7] + 8) + 40);
    id v5 = (id)[*(id *)(v1 + 16) copy];
    (*(void (**)(uint64_t, uint64_t, uint64_t, id, uint64_t))(v2 + 16))(v2, v3, v4, v5, 1);
  }
}

- (void)cancelUsageDataPopulation
{
  self->_cacheUpdateCancelled = 1;
  cache_operation_queue = self->_cache_operation_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__ICQUsageStorageCache_cancelUsageDataPopulation__block_invoke;
  block[3] = &unk_264921C80;
  block[4] = self;
  dispatch_async(cache_operation_queue, block);
}

uint64_t __49__ICQUsageStorageCache_cancelUsageDataPopulation__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 48) = 0;
  return result;
}

- (void)populateUsageBundlesCacheWithHandler:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!self->_usageBundlesCache)
  {
    usageBundlesManager = self->_usageBundlesManager;
    if (!usageBundlesManager)
    {
      uint64_t v6 = (PSUsageBundleManager *)objc_alloc_init(MEMORY[0x263F5FD08]);
      id v7 = self->_usageBundlesManager;
      self->_usageBundlesManager = v6;

      usageBundlesManager = self->_usageBundlesManager;
    }
    [(PSUsageBundleManager *)usageBundlesManager vendUsageBundleAppsWithHandler:v4];
    if (!self->_cacheUpdateCancelled)
    {
      uint64_t v8 = [(PSUsageBundleManager *)self->_usageBundlesManager allUsageBundleApps];
      usageBundlesCache = self->_usageBundlesCache;
      self->_usageBundlesCache = v8;

      uint64_t v10 = ICQUSLogForCategory(0);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = self->_usageBundlesCache;
        int v12 = 138412290;
        dispatch_time_t v13 = v11;
        _os_log_impl(&dword_22C821000, v10, OS_LOG_TYPE_DEFAULT, "Populating usage bundles cache with %@", (uint8_t *)&v12, 0xCu);
      }
    }
  }
}

- (void)removeMediaCollectionCacheForKey:(id)a3
{
}

- (id)mediaCollectionForKey:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_mediaCache objectForKey:a3];
}

- (float)sizeForMediaQuery:(id)a3 withGroupingType:(int64_t)a4 storingInCache:(id)a5 withKey:(id)a6
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  int v12 = [MEMORY[0x263F11E60] predicateWithValue:MEMORY[0x263EFFA88] forProperty:*MEMORY[0x263F11308]];
  [v9 addFilterPredicate:v12];

  dispatch_time_t v13 = objc_opt_new();
  if (a4)
  {
    [v9 setGroupingType:a4];
    id v14 = [v9 collections];
    if ([v14 count])
    {
      v43 = v13;
      id v44 = v11;
      id v45 = v10;
      id v46 = v9;
      id v15 = [MEMORY[0x263EFF980] array];
      long long v56 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      obuint64_t j = v14;
      uint64_t v16 = [obj countByEnumeratingWithState:&v56 objects:v62 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v57;
        uint64_t v19 = *MEMORY[0x263F11298];
        float v20 = 0.0;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v57 != v18) {
              objc_enumerationMutation(obj);
            }
            v22 = *(void **)(*((void *)&v56 + 1) + 8 * i);
            long long v52 = 0u;
            long long v53 = 0u;
            long long v54 = 0u;
            long long v55 = 0u;
            v23 = [v22 items];
            uint64_t v24 = [v23 countByEnumeratingWithState:&v52 objects:v61 count:16];
            if (v24)
            {
              uint64_t v25 = v24;
              uint64_t v26 = *(void *)v53;
              float v27 = 0.0;
              do
              {
                for (uint64_t j = 0; j != v25; ++j)
                {
                  if (*(void *)v53 != v26) {
                    objc_enumerationMutation(v23);
                  }
                  v29 = [*(id *)(*((void *)&v52 + 1) + 8 * j) valueForProperty:v19];
                  [v29 floatValue];
                  float v27 = v27 + v30;
                }
                uint64_t v25 = [v23 countByEnumeratingWithState:&v52 objects:v61 count:16];
              }
              while (v25);
            }
            else
            {
              float v27 = 0.0;
            }

            float v20 = v20 + v27;
            *(float *)&double v31 = v27;
            v32 = [NSNumber numberWithFloat:v31];
            [v15 addObject:v32];
          }
          uint64_t v17 = [obj countByEnumeratingWithState:&v56 objects:v62 count:16];
        }
        while (v17);
      }
      else
      {
        float v20 = 0.0;
      }
      id v14 = obj;

      dispatch_time_t v13 = v43;
      [v43 setGrouped:1];
      [v43 setItems:obj];
      *(float *)&double v40 = v20;
      [v43 setTotalSize:v40];
      [v43 setItemSizes:v15];

      id v10 = v45;
      id v9 = v46;
      id v11 = v44;
      goto LABEL_34;
    }
LABEL_29:
    float v20 = 0.0;
    goto LABEL_34;
  }
  id v14 = [v9 items];
  if (![v14 count]) {
    goto LABEL_29;
  }
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v14 = v14;
  uint64_t v33 = [v14 countByEnumeratingWithState:&v48 objects:v60 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v49;
    uint64_t v36 = *MEMORY[0x263F11298];
    float v20 = 0.0;
    do
    {
      for (uint64_t k = 0; k != v34; ++k)
      {
        if (*(void *)v49 != v35) {
          objc_enumerationMutation(v14);
        }
        v38 = [*(id *)(*((void *)&v48 + 1) + 8 * k) valueForProperty:v36];
        [v38 floatValue];
        float v20 = v20 + v39;
      }
      uint64_t v34 = [v14 countByEnumeratingWithState:&v48 objects:v60 count:16];
    }
    while (v34);
  }
  else
  {
    float v20 = 0.0;
  }

  [v13 setItems:v14];
  *(float *)&double v41 = v20;
  [v13 setTotalSize:v41];
LABEL_34:

  [v10 setObject:v13 forKey:v11];
  return v20;
}

- (void)populateMediaCache
{
  if (!self->_mediaCache)
  {
    uint64_t v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    mediaCache = self->_mediaCache;
    self->_mediaCache = v3;

    [MEMORY[0x263F11E68] setFilteringDisabled:1];
    id v5 = (void *)MEMORY[0x263F11E40];
    uint64_t v6 = [MEMORY[0x263F11E40] deviceMediaLibrary];
    id v7 = [v6 libraryDataProvider];
    [v5 reloadDynamicPropertiesForLibraryDataProvider:v7];

    uint64_t v8 = [MEMORY[0x263F11E68] ITunesUAudioQuery];
    [(ICQUsageStorageCache *)self sizeForMediaQuery:v8 withGroupingType:1 storingInCache:self->_mediaCache withKey:@"audiocourses"];

    if (self->_cacheUpdateCancelled)
    {
      id v9 = self->_mediaCache;
      self->_mediaCache = 0;
    }
    else
    {
      id v10 = objc_alloc(MEMORY[0x263F11E68]);
      id v11 = (void *)MEMORY[0x263EFFA08];
      int v12 = (void *)MEMORY[0x263F11E60];
      dispatch_time_t v13 = [NSNumber numberWithInteger:4096];
      uint64_t v14 = *MEMORY[0x263F11358];
      id v15 = [v12 predicateWithValue:v13 forProperty:*MEMORY[0x263F11358]];
      uint64_t v16 = [v11 setWithObject:v15];
      uint64_t v17 = (void *)[v10 initWithFilterPredicates:v16];

      [(ICQUsageStorageCache *)self sizeForMediaQuery:v17 withGroupingType:1 storingInCache:self->_mediaCache withKey:@"videocourses"];
      if (self->_cacheUpdateCancelled)
      {
        uint64_t v18 = self->_mediaCache;
        self->_mediaCache = 0;
      }
      else
      {
        id v19 = objc_alloc(MEMORY[0x263F11E68]);
        float v20 = (void *)MEMORY[0x263EFFA08];
        long long v21 = (void *)MEMORY[0x263F11E60];
        v22 = [NSNumber numberWithInteger:2];
        v23 = [v21 predicateWithValue:v22 forProperty:v14];
        uint64_t v24 = [v20 setWithObject:v23];
        uint64_t v25 = (void *)[v19 initWithFilterPredicates:v24];

        [(ICQUsageStorageCache *)self sizeForMediaQuery:v25 withGroupingType:7 storingInCache:self->_mediaCache withKey:@"audiopodcasts"];
        if (self->_cacheUpdateCancelled) {
          goto LABEL_11;
        }
        uint64_t v26 = [MEMORY[0x263F11E68] videoPodcastsQuery];
        [(ICQUsageStorageCache *)self sizeForMediaQuery:v26 withGroupingType:7 storingInCache:self->_mediaCache withKey:@"videopodcasts"];

        if (self->_cacheUpdateCancelled
          || ([MEMORY[0x263F11E68] audiobooksQuery],
              float v27 = objc_claimAutoreleasedReturnValue(),
              [(ICQUsageStorageCache *)self sizeForMediaQuery:v27 withGroupingType:10 storingInCache:self->_mediaCache withKey:@"audiobooks"], v27, self->_cacheUpdateCancelled))
        {
LABEL_11:
          v28 = self->_mediaCache;
          self->_mediaCache = 0;
        }
        else
        {
          dispatch_semaphore_t v29 = dispatch_semaphore_create(0);
          dispatch_queue_t v30 = dispatch_queue_create(0, 0);
          v32[0] = 0;
          v32[1] = v32;
          v32[2] = 0x2020000000;
          v32[3] = 0;
          double v31 = v29;
          ALGetLibrarySizes();
          dispatch_semaphore_wait(v31, 0xFFFFFFFFFFFFFFFFLL);

          _Block_object_dispose(v32, 8);
        }
      }
    }
  }
}

void __42__ICQUsageStorageCache_populateMediaCache__block_invoke(void *a1, uint64_t a2, unint64_t a3)
{
  if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    uint64_t v6 = objc_alloc_init(ICQUsageMediaCollection);
    id v7 = [MEMORY[0x263EFF8C0] array];
    [(ICQUsageMediaCollection *)v6 setItems:v7];

    uint64_t v8 = a2 - 1;
    if ((unint64_t)(a2 - 1) >= 8 || ((0x8Bu >> v8) & 1) == 0) {
      __42__ICQUsageStorageCache_populateMediaCache__block_invoke_cold_1();
    }
    [*(id *)(a1[4] + 16) setObject:v6 forKey:off_2649233C8[v8]];
    *(float *)&double v9 = (float)a3;
    [(ICQUsageMediaCollection *)v6 setTotalSize:v9];
  }
  *(void *)(*(void *)(a1[6] + 8) + 24) |= a2;
  if (*(void *)(*(void *)(a1[6] + 8) + 24) == 15)
  {
    id v10 = a1[5];
    dispatch_semaphore_signal(v10);
  }
}

- (id)checkAndFixUpVersion:(id)a3
{
  uint64_t v3 = (__CFString *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [(__CFString *)v3 stringValue];
LABEL_6:

    uint64_t v3 = v4;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || ![(__CFString *)v3 length])
  {
    id v4 = &stru_26DFF2C90;
    goto LABEL_6;
  }
LABEL_7:
  return v3;
}

- (float)specialStorageUsageForBundleID:(id)a3
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v3 = a3;
  float v4 = 0.0;
  if (![v3 isEqualToString:*MEMORY[0x263F5FF48]]) {
    goto LABEL_43;
  }
  id v42 = objc_alloc_init(MEMORY[0x263F08850]);
  id v5 = [v42 URLForDirectory:13 inDomain:1 appropriateForURL:0 create:1 error:0];
  uint64_t v6 = [v5 path];

  id v7 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v8 = [v7 bundleIdentifier];
  double v9 = (void *)v8;
  if (v8) {
    id v10 = (__CFString *)v8;
  }
  else {
    id v10 = &stru_26DFF2C90;
  }
  id v11 = [v6 stringByAppendingPathComponent:v10];

  double v41 = v11;
  double v40 = [v11 stringByAppendingPathComponent:@"iBooksSizingCache.plist"];
  int v12 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithContentsOfFile:");
  dispatch_time_t v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    id v14 = [MEMORY[0x263EFF9A0] dictionary];
  }
  id v44 = v14;

  id v15 = [MEMORY[0x263EFF9C0] set];
  [v42 enumeratorAtPath:@"/var/mobile/Media/Books"];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = [v16 countByEnumeratingWithState:&v49 objects:v54 count:16];
  obuint64_t j = v16;
  if (!v17)
  {
LABEL_31:

    goto LABEL_33;
  }
  uint64_t v18 = v17;
  id v39 = v3;
  uint64_t v19 = 0;
  id v16 = 0;
  uint64_t v20 = *(void *)v50;
  do
  {
    for (uint64_t i = 0; i != v18; ++i)
    {
      if (*(void *)v50 != v20) {
        objc_enumerationMutation(obj);
      }
      v22 = *(void **)(*((void *)&v49 + 1) + 8 * i);
      v23 = objc_msgSend(@"/var/mobile/Media/Books", "stringByAppendingPathComponent:", v22, v39);
      if (v16 && ([v22 hasPrefix:v16] & 1) == 0)
      {
        uint64_t v24 = [NSNumber numberWithUnsignedLongLong:v19];
        [v44 setObject:v24 forKey:v16];

        uint64_t v19 = 0;
        id v16 = 0;
      }
      uint64_t v25 = [v22 pathExtension];
      if (([v25 isEqualToString:@"epub"] & 1) != 0
        || [v25 isEqualToString:@"ibooks"])
      {
        [v15 addObject:v22];
        uint64_t v26 = [v44 objectForKey:v22];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          unint64_t v27 = [v26 unsignedLongLongValue];
          [obj skipDescendants];

          goto LABEL_27;
        }
        if (v16) {
          -[ICQUsageStorageCache specialStorageUsageForBundleID:]();
        }
        if (v19) {
          -[ICQUsageStorageCache specialStorageUsageForBundleID:]();
        }
        id v16 = v22;
      }
      v28 = [v42 attributesOfItemAtPath:v23 error:0];
      unint64_t v27 = [v28 fileSize];

      if (v16) {
        unint64_t v29 = v27;
      }
      else {
        unint64_t v29 = 0;
      }
      v19 += v29;
LABEL_27:
      float v4 = v4 + (float)v27;
    }
    uint64_t v18 = [obj countByEnumeratingWithState:&v49 objects:v54 count:16];
  }
  while (v18);

  if (v16)
  {
    dispatch_queue_t v30 = [NSNumber numberWithUnsignedLongLong:v19];
    [v44 setObject:v30 forKey:v16];

    id v3 = v39;
    goto LABEL_31;
  }
  id v3 = v39;
LABEL_33:
  double v31 = [MEMORY[0x263EFF980] array];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v32 = v44;
  uint64_t v33 = [v32 countByEnumeratingWithState:&v45 objects:v53 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v46;
    do
    {
      for (uint64_t j = 0; j != v34; ++j)
      {
        if (*(void *)v46 != v35) {
          objc_enumerationMutation(v32);
        }
        uint64_t v37 = *(void *)(*((void *)&v45 + 1) + 8 * j);
        if (([v15 containsObject:v37] & 1) == 0) {
          [v31 addObject:v37];
        }
      }
      uint64_t v34 = [v32 countByEnumeratingWithState:&v45 objects:v53 count:16];
    }
    while (v34);
  }

  [v32 removeObjectsForKeys:v31];
  [v32 writeToFile:v40 atomically:1];

LABEL_43:
  return v4;
}

- (void)populateUsageAppsCacheWithHandler:(id)a3
{
  id v4 = a3;
  if (!self->_appsCache)
  {
    id v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    appsCache = self->_appsCache;
    self->_appsCache = v5;

    id v7 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263F5FF48], *MEMORY[0x263F5FF40], 0);
    uint64_t v8 = objc_opt_new();
    double v9 = [MEMORY[0x263F01880] defaultWorkspace];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __58__ICQUsageStorageCache_populateUsageAppsCacheWithHandler___block_invoke;
    v26[3] = &unk_264923380;
    id v10 = v8;
    id v27 = v10;
    [v9 enumerateBundlesOfType:1 block:v26];

    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x2020000000;
    char v25 = 0;
    size_t v11 = [v10 count];
    int v12 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __58__ICQUsageStorageCache_populateUsageAppsCacheWithHandler___block_invoke_2;
    block[3] = &unk_2649233A8;
    long long v21 = &v22;
    id v13 = v10;
    id v17 = v13;
    id v14 = v7;
    id v18 = v14;
    uint64_t v19 = self;
    id v20 = v4;
    dispatch_apply(v11, v12, block);

    if (*((unsigned char *)v23 + 24))
    {
      id v15 = self->_appsCache;
      self->_appsCache = 0;
    }
    _Block_object_dispose(&v22, 8);
  }
}

uint64_t __58__ICQUsageStorageCache_populateUsageAppsCacheWithHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

void __58__ICQUsageStorageCache_populateUsageAppsCacheWithHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
    return;
  }
  id v4 = (void *)MEMORY[0x230F70810]();
  id v5 = [*(id *)(a1 + 32) objectAtIndex:a2];
  uint64_t v6 = [v5 bundleIdentifier];
  id v7 = [v5 applicationType];
  if ([v7 isEqualToString:*MEMORY[0x263F01848]])
  {

    goto LABEL_5;
  }
  char v8 = [*(id *)(a1 + 40) containsObject:v6];

  if (v8)
  {
LABEL_5:
    double v9 = objc_alloc_init(ICQUsageApp);
    [*(id *)(*(void *)(a1 + 48) + 24) addObject:v9];
    id v10 = [v5 localizedNameForContext:0];
    size_t v11 = (void *)MEMORY[0x263F086E0];
    int v12 = [v5 bundleURL];
    id v13 = [v11 bundleWithURL:v12];

    id v14 = [v13 localizedInfoDictionary];
    id v15 = [v14 objectForKey:*MEMORY[0x263EFFAA0]];
    id v16 = [*(id *)(a1 + 48) checkAndFixUpVersion:v15];

    uint64_t v34 = v4;
    if (![v16 length])
    {
      id v17 = [v5 shortVersionString];

      id v16 = [*(id *)(a1 + 48) checkAndFixUpVersion:v17];

      if (![v16 length])
      {
        id v18 = [v5 bundleVersion];

        id v16 = [*(id *)(a1 + 48) checkAndFixUpVersion:v18];
      }
    }
    uint64_t v19 = [v5 diskUsage];
    id v20 = [v19 staticUsage];
    [v20 floatValue];
    int v22 = v21;

    v23 = [v5 diskUsage];
    uint64_t v24 = [v23 dynamicUsage];
    [v24 floatValue];
    int v26 = v25;

    [*(id *)(a1 + 48) specialStorageUsageForBundleID:v6];
    int v28 = v27;
    [(ICQUsageApp *)v9 setName:v10];
    [(ICQUsageApp *)v9 setBundleIdentifier:v6];
    [(ICQUsageApp *)v9 setBundleVersion:v16];
    LODWORD(v29) = v22;
    [(ICQUsageApp *)v9 setStaticSize:v29];
    LODWORD(v30) = v26;
    [(ICQUsageApp *)v9 setDynamicSize:v30];
    LODWORD(v31) = v28;
    [(ICQUsageApp *)v9 setSpecialSize:v31];
    id v32 = [v5 applicationType];
    -[ICQUsageApp setSystemApp:](v9, "setSystemApp:", [v32 isEqualToString:*MEMORY[0x263F01838]]);

    uint64_t v33 = *(void *)(a1 + 56);
    if (v33 && ((*(uint64_t (**)(uint64_t, ICQUsageApp *))(v33 + 16))(v33, v9) & 1) == 0) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    }

    id v4 = v34;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache_operation_queue, 0);
  objc_storeStrong((id *)&self->_usageBundlesCache, 0);
  objc_storeStrong((id *)&self->_appsCache, 0);
  objc_storeStrong((id *)&self->_mediaCache, 0);
  objc_storeStrong((id *)&self->_usageBundlesManager, 0);
}

- (void)populateUsageDataWithProgressBlock:.cold.1()
{
}

void __42__ICQUsageStorageCache_populateMediaCache__block_invoke_cold_1()
{
}

- (void)specialStorageUsageForBundleID:.cold.1()
{
}

- (void)specialStorageUsageForBundleID:.cold.2()
{
}

@end