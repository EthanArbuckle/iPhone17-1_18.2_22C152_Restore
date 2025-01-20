@interface WBSOnDiskDataCache
- (BOOL)isInMemoryCacheEnabled;
- (BOOL)isTerminating;
- (NSURL)cacheDirectoryURL;
- (WBSDataCacheDelegate)dataCacheDelegate;
- (WBSOnDiskDataCache)init;
- (WBSOnDiskDataCache)initWithCacheDirectoryURL:(id)a3;
- (id)_cacheSettingsFileURL;
- (id)_diskAccessQueueName;
- (id)_fileLocationForKeyString:(id)a3;
- (id)_internalQueueName;
- (id)requestEntryForKeyString:(id)a3;
- (id)settingForKey:(id)a3;
- (int64_t)_internalEntryStateForKeyString:(id)a3;
- (int64_t)entryStateForKeyString:(id)a3;
- (void)_didFailToLoadEntryForKeyString:(id)a3 error:(id)a4;
- (void)_didLoadEntry:(id)a3 forKeyString:(id)a4;
- (void)_dispatchDiskAccessBlock:(id)a3;
- (void)_internalQueueDispatchAsync:(id)a3;
- (void)_internalQueueDispatchSync:(id)a3;
- (void)_notifyDidFinishSettingUp;
- (void)getEntryURLForKeyString:(id)a3 completionHandler:(id)a4;
- (void)removeEntriesForKeyStrings:(id)a3 completionHandler:(id)a4;
- (void)removeEntriesForKeyStringsNotIncludedIn:(id)a3 completionHandler:(id)a4;
- (void)reset;
- (void)savePendingChangesBeforeTearDown;
- (void)setDataCacheDelegate:(id)a3;
- (void)setEntry:(id)a3 forKeyString:(id)a4 completionHandler:(id)a5;
- (void)setIsInMemoryCacheEnabled:(BOOL)a3;
- (void)setSetting:(id)a3 forKey:(id)a4;
- (void)setUp;
@end

@implementation WBSOnDiskDataCache

void __27__WBSOnDiskDataCache_setUp__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 32);
  *(void *)(v3 + 32) = v2;

  v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  id v6 = [*(id *)(a1 + 32) _diskAccessQueueName];
  dispatch_queue_t v7 = dispatch_queue_create((const char *)[v6 UTF8String], v5);
  uint64_t v8 = *(void *)(a1 + 32);
  v9 = *(void **)(v8 + 8);
  *(void *)(v8 + 8) = v7;

  id v10 = objc_alloc(MEMORY[0x1E4F982D0]);
  v11 = [*(id *)(a1 + 32) _cacheSettingsFileURL];
  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 16);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __27__WBSOnDiskDataCache_setUp__block_invoke_2;
  v18[3] = &unk_1E5E439B8;
  objc_copyWeak(&v19, (id *)(a1 + 40));
  uint64_t v13 = [v10 initWithName:@"SiteMetadataCacheSetting" fileURL:v11 dataSourceQueue:v12 dataSourceBlock:v18];
  uint64_t v14 = *(void *)(a1 + 32);
  v15 = *(void **)(v14 + 56);
  *(void *)(v14 + 56) = v13;

  v16 = *(void **)(a1 + 32);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __27__WBSOnDiskDataCache_setUp__block_invoke_12;
  v17[3] = &unk_1E5E408C0;
  v17[4] = v16;
  [v16 _dispatchDiskAccessBlock:v17];
  objc_destroyWeak(&v19);
}

- (id)_cacheSettingsFileURL
{
  return [(NSURL *)self->_cacheDirectoryURL URLByAppendingPathComponent:@"Settings.plist" isDirectory:0];
}

- (void)_dispatchDiskAccessBlock:(id)a3
{
  id v4 = a3;
  if (!self->_terminating) {
    operator new();
  }
}

- (id)_diskAccessQueueName
{
  uint64_t v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"com.apple.Safari.%@.%p.diskAccessQueue", v5, self];

  return v6;
}

uint64_t __27__WBSOnDiskDataCache_setUp__block_invoke_2_15(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 48), *(id *)(a1 + 40));
  id v2 = *(void **)(a1 + 32);
  return [v2 _notifyDidFinishSettingUp];
}

- (void)removeEntriesForKeyStringsNotIncludedIn:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!self->_terminating)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __80__WBSOnDiskDataCache_removeEntriesForKeyStringsNotIncludedIn_completionHandler___block_invoke;
    v8[3] = &unk_1E5E41018;
    id v9 = v6;
    id v10 = self;
    id v11 = v7;
    [(WBSOnDiskDataCache *)self _dispatchDiskAccessBlock:v8];
  }
}

uint64_t __47__WBSOnDiskDataCache__dispatchDiskAccessBlock___block_invoke(uint64_t a1)
{
  v1 = *(id **)(a1 + 40);
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (v1)
  {
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v1);
    JUMPOUT(0x1AD114BD0);
  }
  return result;
}

void __27__WBSOnDiskDataCache_setUp__block_invoke_12(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1E4F1C9B8];
  uint64_t v3 = [*(id *)(a1 + 32) _cacheSettingsFileURL];
  id v4 = [v2 dataWithContentsOfURL:v3];

  if (v4)
  {
    v5 = [MEMORY[0x1E4F28F98] propertyListWithData:v4 options:0 format:0 error:0];
    id v6 = (void *)[v5 mutableCopy];
  }
  else
  {
    id v6 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];

    id v6 = (void *)v7;
  }
  uint64_t v8 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __27__WBSOnDiskDataCache_setUp__block_invoke_2_15;
  v10[3] = &unk_1E5E407D0;
  v10[4] = v8;
  id v11 = v6;
  id v9 = v6;
  [v8 _internalQueueDispatchAsync:v10];
}

- (void)setUp
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __27__WBSOnDiskDataCache_setUp__block_invoke;
  v3[3] = &unk_1E5E439E0;
  v3[4] = self;
  objc_copyWeak(&v4, &location);
  [(WBSOnDiskDataCache *)self _internalQueueDispatchAsync:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)_internalQueueDispatchAsync:(id)a3
{
}

void __80__WBSOnDiskDataCache_removeEntriesForKeyStringsNotIncludedIn_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = objc_msgSend(*(id *)(a1 + 32), "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_27);
  uint64_t v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v4 = [v3 enumeratorAtURL:*(void *)(*(void *)(a1 + 40) + 80) includingPropertiesForKeys:0 options:7 errorHandler:0];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "lastPathComponent", (void)v14);
        char v11 = [v2 containsObject:v10];

        if ((v11 & 1) == 0)
        {
          uint64_t v12 = [MEMORY[0x1E4F28CB8] defaultManager];
          objc_msgSend(v12, "safari_removeFileAtURL:error:", v9, 0);
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  uint64_t v13 = *(void *)(a1 + 48);
  if (v13) {
    (*(void (**)(void))(v13 + 16))();
  }
}

void __48__WBSOnDiskDataCache_setIsInMemoryCacheEnabled___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 65))
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1C998]);
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 24);
    *(void *)(v4 + 24) = v3;
  }
  else
  {
    id v5 = *(void **)(v1 + 24);
    *(void *)(v1 + 24) = 0;
  }
}

- (void)_notifyDidFinishSettingUp
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataCacheDelegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained dataCacheDidSetUp:self];
  }
}

- (void)setIsInMemoryCacheEnabled:(BOOL)a3
{
  if (self->_isInMemoryCacheEnabled != a3)
  {
    self->_isInMemoryCacheEnabled = a3;
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __48__WBSOnDiskDataCache_setIsInMemoryCacheEnabled___block_invoke;
    v3[3] = &unk_1E5E408C0;
    v3[4] = self;
    [(WBSOnDiskDataCache *)self _internalQueueDispatchSync:v3];
  }
}

- (void)_internalQueueDispatchSync:(id)a3
{
}

- (void)setDataCacheDelegate:(id)a3
{
}

- (WBSOnDiskDataCache)initWithCacheDirectoryURL:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)WBSOnDiskDataCache;
  uint64_t v6 = [(WBSOnDiskDataCache *)&v17 init];
  if (v6)
  {
    uint64_t v7 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    id v8 = [(WBSOnDiskDataCache *)v6 _internalQueueName];
    dispatch_queue_t v9 = dispatch_queue_create((const char *)[v8 UTF8String], v7);
    internalQueue = v6->_internalQueue;
    v6->_internalQueue = (OS_dispatch_queue *)v9;

    objc_storeStrong((id *)&v6->_cacheDirectoryURL, a3);
    v6->_isInMemoryCacheEnabled = 1;
    char v11 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    entriesForKeyStringsCache = v6->_entriesForKeyStringsCache;
    v6->_entriesForKeyStringsCache = v11;

    uint64_t v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    missingEntryKeyStrings = v6->_missingEntryKeyStrings;
    v6->_missingEntryKeyStrings = v13;

    long long v15 = v6;
  }

  return v6;
}

- (id)_internalQueueName
{
  id v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"com.apple.Safari.%@.%p.internalQueue", v5, self];

  return v6;
}

- (WBSOnDiskDataCache)init
{
  return 0;
}

id __27__WBSOnDiskDataCache_setUp__block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained[6];
  id v9 = 0;
  id v3 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v2 format:200 options:0 error:&v9];
  id v4 = v9;
  if (!v3)
  {
    id v5 = (id)WBS_LOG_CHANNEL_PREFIXSiteMetadata();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = WeakRetained[6];
      uint64_t v7 = objc_msgSend(v4, "safari_privacyPreservingDescription");
      __27__WBSOnDiskDataCache_setUp__block_invoke_2_cold_1(v6, v7, buf, v5);
    }
  }
  return v3;
}

- (void)savePendingChangesBeforeTearDown
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__WBSOnDiskDataCache_savePendingChangesBeforeTearDown__block_invoke;
  block[3] = &unk_1E5E408C0;
  block[4] = self;
  dispatch_barrier_sync(internalQueue, block);
  dispatch_sync((dispatch_queue_t)self->_diskAccessQueue, &__block_literal_global_27);
}

uint64_t __54__WBSOnDiskDataCache_savePendingChangesBeforeTearDown__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 64) = 1;
  return [*(id *)(*(void *)(a1 + 32) + 56) completePendingWriteSynchronously];
}

- (void)reset
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __27__WBSOnDiskDataCache_reset__block_invoke;
  v2[3] = &unk_1E5E408C0;
  v2[4] = self;
  [(WBSOnDiskDataCache *)self _internalQueueDispatchAsync:v2];
}

void __27__WBSOnDiskDataCache_reset__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 48) removeAllObjects];
  [*(id *)(*(void *)(a1 + 32) + 40) removeAllObjects];
  [*(id *)(*(void *)(a1 + 32) + 32) removeAllObjects];
  [*(id *)(*(void *)(a1 + 32) + 24) removeAllObjects];
  uint64_t v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __27__WBSOnDiskDataCache_reset__block_invoke_2;
  v4[3] = &unk_1E5E408C0;
  v4[4] = v2;
  [v2 _dispatchDiskAccessBlock:v4];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 72));
  if (objc_opt_respondsToSelector()) {
    [WeakRetained dataCacheDidReset:*(void *)(a1 + 32)];
  }
}

void __27__WBSOnDiskDataCache_reset__block_invoke_2(uint64_t a1)
{
  v12[4] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 80);
  v12[0] = 0;
  char v4 = [v2 removeItemAtURL:v3 error:v12];
  id v5 = v12[0];
  uint64_t v6 = v5;
  if ((v4 & 1) == 0)
  {
    id v10 = (id)WBS_LOG_CHANNEL_PREFIXSiteMetadata();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __27__WBSOnDiskDataCache_reset__block_invoke_2_cold_2();
    }
    goto LABEL_9;
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 80);
  id v11 = v5;
  char v8 = [v2 createDirectoryAtURL:v7 withIntermediateDirectories:1 attributes:0 error:&v11];
  id v9 = v11;

  if ((v8 & 1) == 0)
  {
    id v10 = (id)WBS_LOG_CHANNEL_PREFIXSiteMetadata();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v9, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __27__WBSOnDiskDataCache_reset__block_invoke_2_cold_1();
    }
    uint64_t v6 = v9;
LABEL_9:

    goto LABEL_10;
  }
  uint64_t v6 = v9;
LABEL_10:
}

- (id)settingForKey:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_terminating)
  {
    id v6 = 0;
  }
  else
  {
    uint64_t v11 = 0;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x3032000000;
    long long v14 = __Block_byref_object_copy__17;
    long long v15 = __Block_byref_object_dispose__17;
    id v16 = 0;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __36__WBSOnDiskDataCache_settingForKey___block_invoke;
    v8[3] = &unk_1E5E43A08;
    id v10 = &v11;
    void v8[4] = self;
    id v9 = v4;
    [(WBSOnDiskDataCache *)self _internalQueueDispatchSync:v8];
    id v6 = (id)v12[5];

    _Block_object_dispose(&v11, 8);
  }

  return v6;
}

void __36__WBSOnDiskDataCache_settingForKey___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 48) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)setSetting:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!self->_terminating)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __40__WBSOnDiskDataCache_setSetting_forKey___block_invoke;
    v8[3] = &unk_1E5E40820;
    id v9 = v6;
    id v10 = self;
    id v11 = v7;
    [(WBSOnDiskDataCache *)self _internalQueueDispatchAsync:v8];
  }
}

uint64_t __40__WBSOnDiskDataCache_setSetting_forKey___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = *(void **)(a1[5] + 48);
  if (v2) {
    uint64_t result = [v3 setObject:v2 forKeyedSubscript:a1[6]];
  }
  else {
    uint64_t result = [v3 removeObjectForKey:a1[6]];
  }
  uint64_t v5 = a1[5];
  if (!*(unsigned char *)(v5 + 64))
  {
    id v6 = *(void **)(v5 + 56);
    return [v6 scheduleWrite];
  }
  return result;
}

- (id)requestEntryForKeyString:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (self->_terminating)
  {
    id v6 = 0;
  }
  else
  {
    uint64_t v11 = 0;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x3032000000;
    long long v14 = __Block_byref_object_copy__17;
    long long v15 = __Block_byref_object_dispose__17;
    id v16 = 0;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __47__WBSOnDiskDataCache_requestEntryForKeyString___block_invoke;
    v8[3] = &unk_1E5E43A08;
    id v10 = &v11;
    void v8[4] = self;
    id v9 = v4;
    [(WBSOnDiskDataCache *)self _internalQueueDispatchSync:v8];
    id v6 = (id)v12[5];

    _Block_object_dispose(&v11, 8);
  }

  return v6;
}

void __47__WBSOnDiskDataCache_requestEntryForKeyString___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKey:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)
    && ([*(id *)(*(void *)(a1 + 32) + 32) containsObject:*(void *)(a1 + 40)] & 1) == 0)
  {
    [*(id *)(*(void *)(a1 + 32) + 32) addObject:*(void *)(a1 + 40)];
    uint64_t v5 = *(void **)(a1 + 32);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __47__WBSOnDiskDataCache_requestEntryForKeyString___block_invoke_2;
    v6[3] = &unk_1E5E407D0;
    v6[4] = v5;
    id v7 = *(id *)(a1 + 40);
    [v5 _dispatchDiskAccessBlock:v6];
  }
}

void __47__WBSOnDiskDataCache_requestEntryForKeyString___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _fileLocationForKeyString:*(void *)(a1 + 40)];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v2];
  }
  else
  {
    uint64_t v3 = 0;
  }
  id v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__WBSOnDiskDataCache_requestEntryForKeyString___block_invoke_3;
  v6[3] = &unk_1E5E40820;
  v6[4] = v4;
  id v7 = v3;
  id v8 = *(id *)(a1 + 40);
  id v5 = v3;
  [v4 _internalQueueDispatchAsync:v6];
}

uint64_t __47__WBSOnDiskDataCache_requestEntryForKeyString___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didLoadEntry:*(void *)(a1 + 40) forKeyString:*(void *)(a1 + 48)];
}

- (void)getEntryURLForKeyString:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (self->_terminating)
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
  else
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __64__WBSOnDiskDataCache_getEntryURLForKeyString_completionHandler___block_invoke;
    v9[3] = &unk_1E5E41018;
    v9[4] = self;
    id v10 = v6;
    id v11 = v8;
    [(WBSOnDiskDataCache *)self _dispatchDiskAccessBlock:v9];
  }
}

void __64__WBSOnDiskDataCache_getEntryURLForKeyString_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _fileLocationForKeyString:*(void *)(a1 + 40)];
  uint64_t v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v4 = [v2 path];
  char v5 = [v3 fileExistsAtPath:v4];

  if ((v5 & 1) == 0)
  {

    uint64_t v2 = 0;
  }
  id v6 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__WBSOnDiskDataCache_getEntryURLForKeyString_completionHandler___block_invoke_2;
  v8[3] = &unk_1E5E410B8;
  id v10 = *(id *)(a1 + 48);
  id v7 = v2;
  id v9 = v7;
  [v6 _internalQueueDispatchAsync:v8];
}

uint64_t __64__WBSOnDiskDataCache_getEntryURLForKeyString_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)setEntry:(id)a3 forKeyString:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!self->_terminating)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __62__WBSOnDiskDataCache_setEntry_forKeyString_completionHandler___block_invoke;
    v11[3] = &unk_1E5E43A30;
    v11[4] = self;
    id v12 = v9;
    id v14 = v10;
    id v13 = v8;
    [(WBSOnDiskDataCache *)self _dispatchDiskAccessBlock:v11];
  }
}

void __62__WBSOnDiskDataCache_setEntry_forKeyString_completionHandler___block_invoke(id *a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1[4] _fileLocationForKeyString:a1[5]];
  uint64_t v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v4 = [v2 URLByDeletingLastPathComponent];
  id v25 = 0;
  char v5 = [v3 createDirectoryAtURL:v4 withIntermediateDirectories:1 attributes:0 error:&v25];
  id v6 = v25;

  if ((v5 & 1) == 0)
  {
    id v12 = (id)WBS_LOG_CHANNEL_PREFIXSiteMetadata();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __27__WBSOnDiskDataCache_reset__block_invoke_2_cold_1();
    }

    id v13 = a1[4];
    id v14 = (id *)v24;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __62__WBSOnDiskDataCache_setEntry_forKeyString_completionHandler___block_invoke_19;
    v24[3] = &unk_1E5E40FA0;
    v24[4] = v13;
    v24[5] = a1[5];
    v24[6] = v6;
    v24[7] = a1[7];
    [v13 _internalQueueDispatchAsync:v24];
    goto LABEL_12;
  }
  id v7 = (id)WBS_LOG_CHANNEL_PREFIXSiteMetadata();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v17 = a1[6];
    uint64_t v18 = [v17 length];
    *(_DWORD *)buf = 134218498;
    id v27 = v17;
    __int16 v28 = 2048;
    uint64_t v29 = v18;
    __int16 v30 = 2112;
    v31 = v2;
    _os_log_debug_impl(&dword_1ABB70000, v7, OS_LOG_TYPE_DEBUG, "Saving entry %p <entry data length = %zu> to location %@", buf, 0x20u);
  }

  if (([a1[6] writeToURL:v2 atomically:1] & 1) == 0)
  {
    long long v15 = (id)WBS_LOG_CHANNEL_PREFIXSiteMetadata();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __62__WBSOnDiskDataCache_setEntry_forKeyString_completionHandler___block_invoke_cold_1();
    }

    id v16 = a1[4];
    id v14 = (id *)v23;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __62__WBSOnDiskDataCache_setEntry_forKeyString_completionHandler___block_invoke_20;
    v23[3] = &unk_1E5E40FA0;
    v23[4] = v16;
    v23[5] = a1[5];
    v23[6] = v6;
    v23[7] = a1[7];
    [v16 _internalQueueDispatchAsync:v23];
LABEL_12:
    id v9 = v14 + 5;
    id v10 = v14 + 6;
    id v11 = v14 + 7;
    goto LABEL_13;
  }
  id v8 = a1[4];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __62__WBSOnDiskDataCache_setEntry_forKeyString_completionHandler___block_invoke_2;
  v19[3] = &unk_1E5E40FA0;
  v19[4] = v8;
  id v20 = a1[6];
  id v21 = a1[5];
  id v22 = a1[7];
  [v8 _internalQueueDispatchAsync:v19];
  id v9 = &v20;
  id v10 = &v21;
  id v11 = &v22;
LABEL_13:
}

uint64_t __62__WBSOnDiskDataCache_setEntry_forKeyString_completionHandler___block_invoke_19(uint64_t a1)
{
  [*(id *)(a1 + 32) _didFailToLoadEntryForKeyString:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
  uint64_t result = *(void *)(a1 + 56);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t __62__WBSOnDiskDataCache_setEntry_forKeyString_completionHandler___block_invoke_20(uint64_t a1)
{
  [*(id *)(a1 + 32) _didFailToLoadEntryForKeyString:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
  uint64_t result = *(void *)(a1 + 56);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t __62__WBSOnDiskDataCache_setEntry_forKeyString_completionHandler___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _didLoadEntry:*(void *)(a1 + 40) forKeyString:*(void *)(a1 + 48)];
  uint64_t result = *(void *)(a1 + 56);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)_didLoadEntry:(id)a3 forKeyString:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v9)
  {
    [(NSCache *)self->_entriesForKeyStringsCache setObject:v9 forKey:v6];
    [(NSMutableSet *)self->_missingEntryKeyStrings removeObject:v7];
  }
  else
  {
    [(NSMutableSet *)self->_missingEntryKeyStrings addObject:v6];
  }
  [(NSMutableSet *)self->_pendingKeyStringRequests removeObject:v7];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataCacheDelegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained dataCache:self didLoadEntry:v9 forKeyString:v7];
  }
}

- (void)_didFailToLoadEntryForKeyString:(id)a3 error:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  [(NSMutableSet *)self->_missingEntryKeyStrings addObject:v8];
  [(NSMutableSet *)self->_pendingKeyStringRequests removeObject:v8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataCacheDelegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained dataCache:self didFailToLoadEntryForKeyString:v8 error:v6];
  }
}

- (void)removeEntriesForKeyStrings:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!self->_terminating)
  {
    id v8 = (void *)[v6 copy];

    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __67__WBSOnDiskDataCache_removeEntriesForKeyStrings_completionHandler___block_invoke;
    v9[3] = &unk_1E5E41018;
    id v6 = v8;
    id v10 = v6;
    id v11 = self;
    id v12 = v7;
    [(WBSOnDiskDataCache *)self _dispatchDiskAccessBlock:v9];
  }
}

void __67__WBSOnDiskDataCache_removeEntriesForKeyStrings_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v18;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v18 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void *)(*((void *)&v17 + 1) + 8 * v5);
        id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
        id v8 = [*(id *)(a1 + 40) _fileLocationForKeyString:v6];
        objc_msgSend(v7, "safari_removeFileAtURL:error:", v8, 0);

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v3);
  }

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __67__WBSOnDiskDataCache_removeEntriesForKeyStrings_completionHandler___block_invoke_2;
  v13[3] = &unk_1E5E41018;
  id v9 = *(void **)(a1 + 40);
  id v10 = *(id *)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 40);
  id v12 = *(void **)(a1 + 48);
  id v14 = v10;
  uint64_t v15 = v11;
  id v16 = v12;
  [v9 _internalQueueDispatchAsync:v13];
}

uint64_t __67__WBSOnDiskDataCache_removeEntriesForKeyStrings_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*(void *)(a1 + 40) + 24), "removeObjectForKey:", *(void *)(*((void *)&v7 + 1) + 8 * v5++), (void)v7);
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }

  [*(id *)(*(void *)(a1 + 40) + 40) addObjectsFromArray:*(void *)(a1 + 32)];
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

id __80__WBSOnDiskDataCache_removeEntriesForKeyStringsNotIncludedIn_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = objc_msgSend(a2, "safari_md5Hash");
  return v2;
}

- (int64_t)entryStateForKeyString:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __45__WBSOnDiskDataCache_entryStateForKeyString___block_invoke;
  v8[3] = &unk_1E5E43A08;
  id v9 = v4;
  long long v10 = &v11;
  void v8[4] = self;
  id v5 = v4;
  [(WBSOnDiskDataCache *)self _internalQueueDispatchSync:v8];
  int64_t v6 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

uint64_t __45__WBSOnDiskDataCache_entryStateForKeyString___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _internalEntryStateForKeyString:*(void *)(a1 + 40)];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (int64_t)_internalEntryStateForKeyString:(id)a3
{
  id v4 = a3;
  if ([(NSMutableSet *)self->_missingEntryKeyStrings containsObject:v4])
  {
    int64_t v5 = 1;
  }
  else
  {
    int64_t v6 = [(NSCache *)self->_entriesForKeyStringsCache objectForKey:v4];
    int64_t v5 = 2 * (v6 != 0);
  }
  return v5;
}

- (id)_fileLocationForKeyString:(id)a3
{
  cacheDirectoryURL = self->_cacheDirectoryURL;
  id v4 = objc_msgSend(a3, "safari_md5Hash");
  int64_t v5 = [(NSURL *)cacheDirectoryURL URLByAppendingPathComponent:v4 isDirectory:0];

  return v5;
}

- (BOOL)isTerminating
{
  return self->_terminating;
}

- (WBSDataCacheDelegate)dataCacheDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataCacheDelegate);
  return (WBSDataCacheDelegate *)WeakRetained;
}

- (BOOL)isInMemoryCacheEnabled
{
  return self->_isInMemoryCacheEnabled;
}

- (NSURL)cacheDirectoryURL
{
  return self->_cacheDirectoryURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheDirectoryURL, 0);
  objc_destroyWeak((id *)&self->_dataCacheDelegate);
  objc_storeStrong((id *)&self->_cacheSettingsWriter, 0);
  objc_storeStrong((id *)&self->_cacheSettings, 0);
  objc_storeStrong((id *)&self->_missingEntryKeyStrings, 0);
  objc_storeStrong((id *)&self->_pendingKeyStringRequests, 0);
  objc_storeStrong((id *)&self->_entriesForKeyStringsCache, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_diskAccessQueue, 0);
}

void __27__WBSOnDiskDataCache_setUp__block_invoke_2_cold_1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138740227;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1ABB70000, log, OS_LOG_TYPE_ERROR, "Could not generate plist data with cache settings: %{sensitive}@, error: %{public}@", buf, 0x16u);
}

void __27__WBSOnDiskDataCache_reset__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_2(&dword_1ABB70000, v3, v4, "Error \"%{public}@\" trying to create entry cache folder.", v5);
}

void __27__WBSOnDiskDataCache_reset__block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_2(&dword_1ABB70000, v3, v4, "Error \"%{public}@\" trying to delete entry cache folder.", v5);
}

void __62__WBSOnDiskDataCache_setEntry_forKeyString_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_2(&dword_1ABB70000, v3, v4, "Error \"%{public}@\" trying to write entry cache folder.", v5);
}

@end