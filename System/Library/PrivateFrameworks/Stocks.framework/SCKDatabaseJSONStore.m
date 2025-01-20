@interface SCKDatabaseJSONStore
+ (id)preferredFileURLForSchema:(id)a3 parentDirectoryURL:(id)a4;
- (BOOL)_reloadIfNeededFromFileURL:(id)a3;
- (BOOL)flushToDiskWithTimeout:(double)a3;
- (BOOL)havePendingChanges;
- (BOOL)isCloudBackupEnabled;
- (BOOL)loadedFromDisk;
- (CKServerChangeToken)serverChangeToken;
- (NSDate)lastDirtyDate;
- (NSDate)lastSyncDate;
- (NSFileCoordinator)fileCoordinator;
- (NSHashTable)observers;
- (NSMutableDictionary)foreignZoneDictsByName;
- (NSMutableDictionary)zoneStoresByName;
- (NSOperationQueue)presentedItemOperationQueue;
- (NSSet)allowedCommandClasses;
- (NSURL)presentedItemURL;
- (NSURL)storeURL;
- (OS_dispatch_queue)accessQueue;
- (OS_dispatch_queue)workQueue;
- (OS_dispatch_source)changeListenerSource;
- (SCKDatabaseJSONStore)initWithSchema:(id)a3 fileURL:(id)a4;
- (SCKDatabaseJSONStore)initWithSchema:(id)a3 fileURL:(id)a4 allowedCommands:(id)a5;
- (SCKDatabaseJSONStore)initWithSchema:(id)a3 parentDirectoryURL:(id)a4;
- (SCKDatabaseJSONStore)initWithSchema:(id)a3 parentDirectoryURL:(id)a4 allowedCommands:(id)a5;
- (SCKOperationThrottler)saveThrottler;
- (id)_decodeCodableObjectOfClass:(Class)a3 from:(id)a4 error:(id *)a5;
- (id)_decodeCodableObjectOfClasses:(id)a3 from:(id)a4 error:(id *)a5;
- (id)_decodeDate:(id)a3;
- (id)_encodeCodableObject:(id)a3;
- (id)_encodeDate:(id)a3;
- (id)zoneStoreForSchema:(id)a3;
- (unint64_t)diskReadCount;
- (unint64_t)diskWriteCount;
- (unsigned)lastKnownStoreChangeTag;
- (void)_applyCloudBackupEnabledPropertyToStoreURL;
- (void)_listenForChangesToFileURL:(id)a3;
- (void)_loadFromFileURL:(id)a3;
- (void)_saveIfNeededToFileURL:(id)a3;
- (void)_saveToFileURL:(id)a3;
- (void)addObserver:(id)a3;
- (void)operationThrottlerPerformOperation:(id)a3;
- (void)readWithAccessor:(id)a3;
- (void)readZone:(id)a3 withAccessor:(id)a4;
- (void)reloadWithAccessor:(id)a3;
- (void)removeObserver:(id)a3;
- (void)savePresentedItemChangesWithCompletionHandler:(id)a3;
- (void)setAccessQueue:(id)a3;
- (void)setAllowedCommandClasses:(id)a3;
- (void)setChangeListenerSource:(id)a3;
- (void)setCloudBackupEnabled:(BOOL)a3;
- (void)setFileCoordinator:(id)a3;
- (void)setForeignZoneDictsByName:(id)a3;
- (void)setHavePendingChanges:(BOOL)a3;
- (void)setLastDirtyDate:(id)a3;
- (void)setLastKnownStoreChangeTag:(unsigned int)a3;
- (void)setLastSyncDate:(id)a3;
- (void)setLoadedFromDisk:(BOOL)a3;
- (void)setObservers:(id)a3;
- (void)setSaveThrottler:(id)a3;
- (void)setServerChangeToken:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)setZoneStoresByName:(id)a3;
- (void)writeWithAccessor:(id)a3;
- (void)writeZone:(id)a3 withAccessor:(id)a4;
@end

@implementation SCKDatabaseJSONStore

+ (id)preferredFileURLForSchema:(id)a3 parentDirectoryURL:(id)a4
{
  v5 = NSString;
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 name];
  uint64_t v9 = [v7 environment];

  v10 = @"sandbox";
  if (v9 == 1) {
    v10 = @"production";
  }
  v11 = [v5 stringWithFormat:@"%@-%@-dbstore.json", v8, v10];

  v12 = [v6 URLByAppendingPathComponent:v11];

  return v12;
}

- (SCKDatabaseJSONStore)initWithSchema:(id)a3 fileURL:(id)a4 allowedCommands:(id)a5
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v51.receiver = self;
  v51.super_class = (Class)SCKDatabaseJSONStore;
  v11 = [(SCKDatabaseJSONStore *)&v51 init];
  v12 = v11;
  if (v11)
  {
    id v46 = v9;
    objc_storeStrong((id *)&v11->_storeURL, a4);
    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    zoneStoresByName = v12->_zoneStoresByName;
    v12->_zoneStoresByName = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    foreignZoneDictsByName = v12->_foreignZoneDictsByName;
    v12->_foreignZoneDictsByName = v15;

    uint64_t v17 = [objc_alloc(MEMORY[0x263F088B0]) initWithOptions:517 capacity:0];
    observers = v12->_observers;
    v12->_observers = (NSHashTable *)v17;

    v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v20 = dispatch_queue_create("SCKDatabaseJSONStore.access", v19);
    accessQueue = v12->_accessQueue;
    v12->_accessQueue = (OS_dispatch_queue *)v20;

    v22 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v23 = dispatch_queue_attr_make_with_qos_class(v22, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v24 = dispatch_queue_create("SCKDatabaseJSONStore.work", v23);
    workQueue = v12->_workQueue;
    v12->_workQueue = (OS_dispatch_queue *)v24;

    v26 = [[SCKOperationThrottler alloc] initWithDelegate:v12 updateQueue:v12->_workQueue];
    saveThrottler = v12->_saveThrottler;
    v12->_saveThrottler = v26;

    uint64_t v28 = [objc_alloc(MEMORY[0x263F08830]) initWithFilePresenter:v12];
    fileCoordinator = v12->_fileCoordinator;
    v12->_fileCoordinator = (NSFileCoordinator *)v28;

    objc_storeStrong((id *)&v12->_presentedItemURL, v12->_storeURL);
    uint64_t v30 = objc_opt_new();
    presentedItemOperationQueue = v12->_presentedItemOperationQueue;
    v12->_presentedItemOperationQueue = (NSOperationQueue *)v30;

    [(NSOperationQueue *)v12->_presentedItemOperationQueue setMaxConcurrentOperationCount:1];
    if ([v10 count]) {
      [MEMORY[0x263EFFA08] setWithArray:v10];
    }
    else {
    uint64_t v32 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
    }
    allowedCommandClasses = v12->_allowedCommandClasses;
    v12->_allowedCommandClasses = (NSSet *)v32;

    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    v34 = [v8 zoneSchemas];
    uint64_t v35 = [v34 countByEnumeratingWithState:&v47 objects:v52 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v48;
      do
      {
        for (uint64_t i = 0; i != v36; ++i)
        {
          if (*(void *)v48 != v37) {
            objc_enumerationMutation(v34);
          }
          v39 = *(void **)(*((void *)&v47 + 1) + 8 * i);
          v40 = [SCKZoneJSONStore alloc];
          v41 = [v39 zoneName];
          v42 = [(SCKZoneJSONStore *)v40 initWithZoneName:v41 serverRecords:0 lastSyncDate:0 lastDirtyDate:0 serverChangeToken:0 pendingCommands:0];

          v43 = [(SCKDatabaseJSONStore *)v12 zoneStoresByName];
          v44 = [v39 zoneName];
          [v43 setObject:v42 forKeyedSubscript:v44];
        }
        uint64_t v36 = [v34 countByEnumeratingWithState:&v47 objects:v52 count:16];
      }
      while (v36);
    }

    [(SCKDatabaseJSONStore *)v12 _listenForChangesToFileURL:v12->_storeURL];
    id v9 = v46;
  }

  return v12;
}

- (SCKDatabaseJSONStore)initWithSchema:(id)a3 parentDirectoryURL:(id)a4 allowedCommands:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [(id)objc_opt_class() preferredFileURLForSchema:v10 parentDirectoryURL:v9];

  v12 = [(SCKDatabaseJSONStore *)self initWithSchema:v10 fileURL:v11 allowedCommands:v8];
  return v12;
}

- (SCKDatabaseJSONStore)initWithSchema:(id)a3 fileURL:(id)a4
{
  return [(SCKDatabaseJSONStore *)self initWithSchema:a3 fileURL:a4 allowedCommands:0];
}

- (SCKDatabaseJSONStore)initWithSchema:(id)a3 parentDirectoryURL:(id)a4
{
  return [(SCKDatabaseJSONStore *)self initWithSchema:a3 parentDirectoryURL:a4 allowedCommands:0];
}

- (id)zoneStoreForSchema:(id)a3
{
  id v4 = a3;
  v5 = [(SCKDatabaseJSONStore *)self zoneStoresByName];
  id v6 = [v4 zoneName];

  id v7 = [v5 objectForKeyedSubscript:v6];

  return v7;
}

- (void)setCloudBackupEnabled:(BOOL)a3
{
  self->_cloudBackupEnabled = a3;
  [(SCKDatabaseJSONStore *)self _applyCloudBackupEnabledPropertyToStoreURL];
}

- (void)readWithAccessor:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  v5 = [(SCKDatabaseJSONStore *)self accessQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__SCKDatabaseJSONStore_readWithAccessor___block_invoke;
  block[3] = &unk_26467D9C0;
  block[4] = self;
  id v6 = v4;
  id v14 = v6;
  v15 = &v16;
  dispatch_sync(v5, block);

  if (!*((unsigned char *)v17 + 24))
  {
    id v7 = [(SCKDatabaseJSONStore *)self fileCoordinator];
    id v8 = [(SCKDatabaseJSONStore *)self storeURL];
    id v12 = 0;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __41__SCKDatabaseJSONStore_readWithAccessor___block_invoke_2;
    v10[3] = &unk_26467DA10;
    v10[4] = self;
    id v11 = v6;
    [v7 coordinateReadingItemAtURL:v8 options:0 error:&v12 byAccessor:v10];
    id v9 = v12;
  }
  _Block_object_dispose(&v16, 8);
}

uint64_t __41__SCKDatabaseJSONStore_readWithAccessor___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) loadedFromDisk];
  if (result)
  {
    uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  return result;
}

void __41__SCKDatabaseJSONStore_readWithAccessor___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) accessQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__SCKDatabaseJSONStore_readWithAccessor___block_invoke_3;
  block[3] = &unk_26467D9E8;
  v5 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_sync(v4, block);
}

uint64_t __41__SCKDatabaseJSONStore_readWithAccessor___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) _reloadIfNeededFromFileURL:*(void *)(a1 + 40)];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v2();
}

- (void)writeWithAccessor:(id)a3
{
  id v4 = a3;
  v5 = [(SCKDatabaseJSONStore *)self fileCoordinator];
  id v6 = [(SCKDatabaseJSONStore *)self storeURL];
  id v11 = v4;
  id v12 = 0;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __42__SCKDatabaseJSONStore_writeWithAccessor___block_invoke;
  v10[3] = &unk_26467DA10;
  v10[4] = self;
  id v7 = v4;
  [v5 coordinateReadingItemAtURL:v6 options:0 error:&v12 byAccessor:v10];
  id v8 = v12;

  id v9 = [(SCKDatabaseJSONStore *)self saveThrottler];
  [v9 tickle];
}

void __42__SCKDatabaseJSONStore_writeWithAccessor___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) accessQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__SCKDatabaseJSONStore_writeWithAccessor___block_invoke_2;
  block[3] = &unk_26467D9E8;
  v5 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_sync(v4, block);
}

uint64_t __42__SCKDatabaseJSONStore_writeWithAccessor___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _reloadIfNeededFromFileURL:*(void *)(a1 + 40)];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  uint64_t result = [*(id *)(a1 + 32) havePendingChanges];
  if ((result & 1) == 0)
  {
    [*(id *)(a1 + 32) setHavePendingChanges:1];
    id v3 = (void *)MEMORY[0x263F08830];
    uint64_t v4 = *(void *)(a1 + 32);
    return [v3 addFilePresenter:v4];
  }
  return result;
}

- (void)reloadWithAccessor:(id)a3
{
  id v4 = a3;
  v5 = [(SCKDatabaseJSONStore *)self fileCoordinator];
  id v6 = [(SCKDatabaseJSONStore *)self storeURL];
  id v11 = 0;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __43__SCKDatabaseJSONStore_reloadWithAccessor___block_invoke;
  v9[3] = &unk_26467DA10;
  v9[4] = self;
  id v10 = v4;
  id v7 = v4;
  [v5 coordinateReadingItemAtURL:v6 options:0 error:&v11 byAccessor:v9];
  id v8 = v11;
}

void __43__SCKDatabaseJSONStore_reloadWithAccessor___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) accessQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__SCKDatabaseJSONStore_reloadWithAccessor___block_invoke_2;
  block[3] = &unk_26467D9E8;
  v5 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_sync(v4, block);
}

uint64_t __43__SCKDatabaseJSONStore_reloadWithAccessor___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _reloadIfNeededFromFileURL:*(void *)(a1 + 40)];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v2();
}

- (void)readZone:(id)a3 withAccessor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __46__SCKDatabaseJSONStore_readZone_withAccessor___block_invoke;
  v10[3] = &unk_26467DA38;
  id v11 = v6;
  id v12 = v7;
  v10[4] = self;
  id v8 = v6;
  id v9 = v7;
  [(SCKDatabaseJSONStore *)self readWithAccessor:v10];
}

void __46__SCKDatabaseJSONStore_readZone_withAccessor___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 48);
  id v2 = [*(id *)(a1 + 32) zoneStoreForSchema:*(void *)(a1 + 40)];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)writeZone:(id)a3 withAccessor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __47__SCKDatabaseJSONStore_writeZone_withAccessor___block_invoke;
  v10[3] = &unk_26467DA38;
  id v11 = v6;
  id v12 = v7;
  v10[4] = self;
  id v8 = v6;
  id v9 = v7;
  [(SCKDatabaseJSONStore *)self writeWithAccessor:v10];
}

void __47__SCKDatabaseJSONStore_writeZone_withAccessor___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 48);
  id v2 = [*(id *)(a1 + 32) zoneStoreForSchema:*(void *)(a1 + 40)];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(SCKDatabaseJSONStore *)self observers];
  [v5 addObject:v4];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(SCKDatabaseJSONStore *)self observers];
  [v5 removeObject:v4];
}

- (void)operationThrottlerPerformOperation:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134217984;
    id v6 = self;
    _os_log_impl(&dword_222ED9000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%p JSON store will flush changes to disk", (uint8_t *)&v5, 0xCu);
  }
  id v4 = [(SCKDatabaseJSONStore *)self storeURL];
  [(SCKDatabaseJSONStore *)self _saveIfNeededToFileURL:v4];
}

- (void)savePresentedItemChangesWithCompletionHandler:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, void))a3;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    uint64_t v7 = self;
    _os_log_impl(&dword_222ED9000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%p JSON store will flush changes to disk for another reader", (uint8_t *)&v6, 0xCu);
  }
  int v5 = [(SCKDatabaseJSONStore *)self storeURL];
  [(SCKDatabaseJSONStore *)self _saveIfNeededToFileURL:v5];

  v4[2](v4, 0);
}

- (BOOL)flushToDiskWithTimeout:(double)a3
{
  id v4 = [(SCKDatabaseJSONStore *)self storeURL];
  [(SCKDatabaseJSONStore *)self _saveIfNeededToFileURL:v4];

  return 1;
}

- (void)_saveToFileURL:(id)a3
{
  uint64_t v78 = *MEMORY[0x263EF8340];
  id v50 = a3;
  id v4 = [MEMORY[0x263EFF980] array];
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  int v5 = [(SCKDatabaseJSONStore *)self foreignZoneDictsByName];
  int v6 = [v5 allValues];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v70 objects:v77 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v71;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v71 != v9) {
          objc_enumerationMutation(v6);
        }
        [v4 addObject:*(void *)(*((void *)&v70 + 1) + 8 * i)];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v70 objects:v77 count:16];
    }
    while (v8);
  }

  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v11 = [(SCKDatabaseJSONStore *)self zoneStoresByName];
  id v12 = [v11 allValues];

  obuint64_t j = v12;
  uint64_t v54 = [v12 countByEnumeratingWithState:&v66 objects:v76 count:16];
  if (v54)
  {
    uint64_t v52 = *(void *)v67;
    uint64_t v53 = v4;
    do
    {
      for (uint64_t j = 0; j != v54; ++j)
      {
        if (*(void *)v67 != v52) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v66 + 1) + 8 * j);
        v15 = [MEMORY[0x263EFF980] array];
        long long v62 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        uint64_t v16 = [v14 serverRecords];
        uint64_t v17 = [v16 countByEnumeratingWithState:&v62 objects:v75 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v63;
          do
          {
            for (uint64_t k = 0; k != v18; ++k)
            {
              if (*(void *)v63 != v19) {
                objc_enumerationMutation(v16);
              }
              v21 = [(SCKDatabaseJSONStore *)self _encodeCodableObject:*(void *)(*((void *)&v62 + 1) + 8 * k)];
              [v15 addObject:v21];
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v62 objects:v75 count:16];
          }
          while (v18);
        }

        v22 = [MEMORY[0x263EFF980] array];
        long long v58 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        v23 = [v14 pendingCommands];
        uint64_t v24 = [v23 countByEnumeratingWithState:&v58 objects:v74 count:16];
        if (v24)
        {
          uint64_t v25 = v24;
          uint64_t v26 = *(void *)v59;
          do
          {
            for (uint64_t m = 0; m != v25; ++m)
            {
              if (*(void *)v59 != v26) {
                objc_enumerationMutation(v23);
              }
              uint64_t v28 = [(SCKDatabaseJSONStore *)self _encodeCodableObject:*(void *)(*((void *)&v58 + 1) + 8 * m)];
              [v22 addObject:v28];
            }
            uint64_t v25 = [v23 countByEnumeratingWithState:&v58 objects:v74 count:16];
          }
          while (v25);
        }

        v29 = [MEMORY[0x263EFF9A0] dictionary];
        uint64_t v30 = [v14 zoneName];
        [v29 setObject:v30 forKeyedSubscript:@"name"];

        [v29 setObject:v15 forKeyedSubscript:@"serverRecords"];
        [v29 setObject:v22 forKeyedSubscript:@"pendingCommands"];
        v31 = [v14 lastSyncDate];
        uint64_t v32 = [(SCKDatabaseJSONStore *)self _encodeDate:v31];
        [v29 setObject:v32 forKeyedSubscript:@"lastSyncDate"];

        v33 = [v14 lastDirtyDate];
        v34 = [(SCKDatabaseJSONStore *)self _encodeDate:v33];
        [v29 setObject:v34 forKeyedSubscript:@"lastDirtyDate"];

        uint64_t v35 = [v14 serverChangeToken];
        uint64_t v36 = [(SCKDatabaseJSONStore *)self _encodeCodableObject:v35];
        [v29 setObject:v36 forKeyedSubscript:@"serverChangeToken"];

        id v4 = v53;
        [v53 addObject:v29];
      }
      uint64_t v54 = [obj countByEnumeratingWithState:&v66 objects:v76 count:16];
    }
    while (v54);
  }

  uint64_t v37 = [MEMORY[0x263EFF9A0] dictionary];
  v38 = [(SCKDatabaseJSONStore *)self lastSyncDate];
  v39 = [(SCKDatabaseJSONStore *)self _encodeDate:v38];
  [v37 setObject:v39 forKeyedSubscript:@"lastSyncDate"];

  v40 = [(SCKDatabaseJSONStore *)self lastDirtyDate];
  v41 = [(SCKDatabaseJSONStore *)self _encodeDate:v40];
  [v37 setObject:v41 forKeyedSubscript:@"lastDirtyDate"];

  v42 = [(SCKDatabaseJSONStore *)self serverChangeToken];
  v43 = [(SCKDatabaseJSONStore *)self _encodeCodableObject:v42];
  [v37 setObject:v43 forKeyedSubscript:@"serverChangeToken"];

  [v37 setObject:v4 forKeyedSubscript:@"zones"];
  v44 = [MEMORY[0x263EFF9A0] dictionary];
  [v44 setObject:v37 forKeyedSubscript:@"database"];
  id v57 = 0;
  v45 = [MEMORY[0x263F08900] dataWithJSONObject:v44 options:0 error:&v57];
  id v46 = v57;
  if (v45)
  {
    long long v47 = (void *)[[NSString alloc] initWithData:v45 encoding:4];
    id v56 = v46;
    int v48 = [v47 writeToURL:v50 atomically:1 encoding:4 error:&v56];
    id v49 = v56;

    if (v48)
    {
      uint32_t value = arc4random_uniform(0xFFFFFFFE) + 1;
      setxattr((const char *)[v50 fileSystemRepresentation], "com.apple.stocks.jsonStoreChangeTag", &value, 4uLL, 0, 0);
      [(SCKDatabaseJSONStore *)self setLastKnownStoreChangeTag:value];
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      -[SCKDatabaseJSONStore _saveToFileURL:]();
    }
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[SCKDatabaseJSONStore _saveToFileURL:]();
    }
    id v49 = v46;
  }
  [(SCKDatabaseJSONStore *)self _applyCloudBackupEnabledPropertyToStoreURL];
  ++self->_diskWriteCount;
}

- (void)_applyCloudBackupEnabledPropertyToStoreURL
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = @"disable";
  int v4 = 134218498;
  uint64_t v5 = a1;
  __int16 v6 = 2114;
  if (a2) {
    id v3 = @"enable";
  }
  uint64_t v7 = v3;
  __int16 v8 = 2114;
  uint64_t v9 = a3;
  _os_log_error_impl(&dword_222ED9000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%p failed to %{public}@ cloud backup for JSON database store: %{public}@", (uint8_t *)&v4, 0x20u);
}

- (void)_saveIfNeededToFileURL:(id)a3
{
  int v4 = [(SCKDatabaseJSONStore *)self fileCoordinator];
  uint64_t v5 = [(SCKDatabaseJSONStore *)self storeURL];
  v7[4] = self;
  id v8 = 0;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__SCKDatabaseJSONStore__saveIfNeededToFileURL___block_invoke;
  v7[3] = &unk_26467DA88;
  [v4 coordinateWritingItemAtURL:v5 options:4 error:&v8 byAccessor:v7];
  id v6 = v8;
}

void __47__SCKDatabaseJSONStore__saveIfNeededToFileURL___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [*(id *)(a1 + 32) accessQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __47__SCKDatabaseJSONStore__saveIfNeededToFileURL___block_invoke_2;
  v6[3] = &unk_26467DA60;
  v6[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v5 = v3;
  dispatch_sync(v4, v6);
}

uint64_t __47__SCKDatabaseJSONStore__saveIfNeededToFileURL___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) havePendingChanges];
  if (result)
  {
    [*(id *)(a1 + 32) _saveToFileURL:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) setHavePendingChanges:0];
    id v3 = (void *)MEMORY[0x263F08830];
    uint64_t v4 = *(void *)(a1 + 32);
    return [v3 removeFilePresenter:v4];
  }
  return result;
}

- (void)_loadFromFileURL:(id)a3
{
  uint64_t v100 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v69 = [MEMORY[0x263EFF9A0] dictionary];
  long long v62 = v4;
  long long v63 = [NSString stringWithContentsOfURL:v4 encoding:4 error:0];
  if (v63)
  {
    id v5 = [v63 dataUsingEncoding:4];
    id v91 = 0;
    id v6 = [MEMORY[0x263F08900] JSONObjectWithData:v5 options:0 error:&v91];
    id v7 = v91;
    id v8 = v7;
    if (v6)
    {
      id v70 = v7;
      long long v72 = v5;
      uint64_t v9 = [v6 objectForKeyedSubscript:@"database"];
      uint64_t v10 = [v9 objectForKeyedSubscript:@"lastSyncDate"];
      id v11 = [(SCKDatabaseJSONStore *)self _decodeDate:v10];
      lastSyncDate = self->_lastSyncDate;
      self->_lastSyncDate = v11;

      v13 = [v9 objectForKeyedSubscript:@"lastDirtyDate"];
      id v14 = [(SCKDatabaseJSONStore *)self _decodeDate:v13];
      lastDirtyDate = self->_lastDirtyDate;
      self->_lastDirtyDate = v14;

      uint64_t v16 = objc_opt_class();
      uint64_t v17 = [v9 objectForKeyedSubscript:@"serverChangeToken"];
      uint64_t v18 = [(SCKDatabaseJSONStore *)self _decodeCodableObjectOfClass:v16 from:v17 error:0];
      serverChangeToken = self->_serverChangeToken;
      self->_serverChangeToken = v18;

      long long v89 = 0u;
      long long v90 = 0u;
      long long v87 = 0u;
      long long v88 = 0u;
      dispatch_queue_t v20 = [v9 objectForKeyedSubscript:@"zones"];
      uint64_t v21 = [v20 countByEnumeratingWithState:&v87 objects:v99 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v88;
        do
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v88 != v23) {
              objc_enumerationMutation(v20);
            }
            uint64_t v25 = *(void **)(*((void *)&v87 + 1) + 8 * i);
            uint64_t v26 = [v25 objectForKeyedSubscript:@"name"];
            [v69 setObject:v25 forKeyedSubscript:v26];
          }
          uint64_t v22 = [v20 countByEnumeratingWithState:&v87 objects:v99 count:16];
        }
        while (v22);
      }

      id v8 = v70;
      id v5 = v72;
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      -[SCKDatabaseJSONStore _loadFromFileURL:]();
    }
  }
  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  obuint64_t j = [v69 allKeys];
  uint64_t v66 = [obj countByEnumeratingWithState:&v83 objects:v98 count:16];
  if (v66)
  {
    unint64_t v27 = 0x263EFF000uLL;
    uint64_t v65 = *(void *)v84;
    do
    {
      for (uint64_t j = 0; j != v66; ++j)
      {
        if (*(void *)v84 != v65) {
          objc_enumerationMutation(obj);
        }
        v29 = *(void **)(*((void *)&v83 + 1) + 8 * j);
        uint64_t v30 = [v69 objectForKeyedSubscript:v29];
        v31 = [(SCKDatabaseJSONStore *)self zoneStoresByName];
        uint64_t v32 = [v31 objectForKeyedSubscript:v29];

        if (v32)
        {
          long long v67 = v29;
          uint64_t v68 = j;
          v33 = [*(id *)(v27 + 2432) array];
          long long v79 = 0u;
          long long v80 = 0u;
          long long v81 = 0u;
          long long v82 = 0u;
          long long v71 = v30;
          v34 = [v30 objectForKeyedSubscript:@"serverRecords"];
          uint64_t v35 = [v34 countByEnumeratingWithState:&v79 objects:v93 count:16];
          if (v35)
          {
            uint64_t v36 = v35;
            uint64_t v37 = *(void *)v80;
            do
            {
              for (uint64_t k = 0; k != v36; ++k)
              {
                if (*(void *)v80 != v37) {
                  objc_enumerationMutation(v34);
                }
                uint64_t v39 = *(void *)(*((void *)&v79 + 1) + 8 * k);
                uint64_t v40 = objc_opt_class();
                id v78 = 0;
                v41 = [(SCKDatabaseJSONStore *)self _decodeCodableObjectOfClass:v40 from:v39 error:&v78];
                id v42 = v78;
                if (v41)
                {
                  [v33 addObject:v41];
                }
                else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 134218242;
                  v95 = self;
                  __int16 v96 = 2114;
                  id v97 = v42;
                  _os_log_error_impl(&dword_222ED9000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%p failed to decode server record with error: %{public}@", buf, 0x16u);
                }
              }
              uint64_t v36 = [v34 countByEnumeratingWithState:&v79 objects:v93 count:16];
            }
            while (v36);
          }

          v43 = [*(id *)(v27 + 2432) array];
          long long v74 = 0u;
          long long v75 = 0u;
          long long v76 = 0u;
          long long v77 = 0u;
          v44 = [v71 objectForKeyedSubscript:@"pendingCommands"];
          uint64_t v45 = [v44 countByEnumeratingWithState:&v74 objects:v92 count:16];
          if (v45)
          {
            uint64_t v46 = v45;
            uint64_t v47 = *(void *)v75;
            do
            {
              for (uint64_t m = 0; m != v46; ++m)
              {
                if (*(void *)v75 != v47) {
                  objc_enumerationMutation(v44);
                }
                uint64_t v49 = *(void *)(*((void *)&v74 + 1) + 8 * m);
                id v50 = [(SCKDatabaseJSONStore *)self allowedCommandClasses];
                id v73 = 0;
                objc_super v51 = [(SCKDatabaseJSONStore *)self _decodeCodableObjectOfClasses:v50 from:v49 error:&v73];
                id v52 = v73;

                if (v51)
                {
                  [v43 addObject:v51];
                }
                else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 134218242;
                  v95 = self;
                  __int16 v96 = 2114;
                  id v97 = v52;
                  _os_log_error_impl(&dword_222ED9000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%p failed to decode command with error: %{public}@", buf, 0x16u);
                }
              }
              uint64_t v46 = [v44 countByEnumeratingWithState:&v74 objects:v92 count:16];
            }
            while (v46);
          }

          uint64_t v30 = v71;
          uint64_t v53 = [v71 objectForKeyedSubscript:@"lastSyncDate"];
          uint64_t v54 = [(SCKDatabaseJSONStore *)self _decodeDate:v53];

          v55 = [v71 objectForKeyedSubscript:@"lastDirtyDate"];
          id v56 = [(SCKDatabaseJSONStore *)self _decodeDate:v55];

          uint64_t v57 = objc_opt_class();
          long long v58 = [v71 objectForKeyedSubscript:@"serverChangeToken"];
          long long v59 = [(SCKDatabaseJSONStore *)self _decodeCodableObjectOfClass:v57 from:v58 error:0];

          long long v60 = [[SCKZoneJSONStore alloc] initWithZoneName:v67 serverRecords:v33 lastSyncDate:v54 lastDirtyDate:v56 serverChangeToken:v59 pendingCommands:v43];
          long long v61 = [(SCKDatabaseJSONStore *)self zoneStoresByName];
          [v61 setObject:v60 forKeyedSubscript:v67];

          unint64_t v27 = 0x263EFF000;
          uint64_t j = v68;
        }
        else
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218242;
            v95 = self;
            __int16 v96 = 2114;
            id v97 = v29;
            _os_log_impl(&dword_222ED9000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%p preserving unknown zone %{public}@", buf, 0x16u);
          }
          v33 = [(SCKDatabaseJSONStore *)self foreignZoneDictsByName];
          [v33 setObject:v30 forKeyedSubscript:v29];
        }
      }
      uint64_t v66 = [obj countByEnumeratingWithState:&v83 objects:v98 count:16];
    }
    while (v66);
  }

  ++self->_diskReadCount;
}

- (BOOL)_reloadIfNeededFromFileURL:(id)a3
{
  id v4 = a3;
  if ([v4 checkResourceIsReachableAndReturnError:0])
  {
    unsigned int value = 0;
    id v5 = v4;
    getxattr((const char *)[v5 fileSystemRepresentation], "com.apple.stocks.jsonStoreChangeTag", &value, 4uLL, 0, 0);
    unsigned int v6 = value;
    unsigned int v7 = [(SCKDatabaseJSONStore *)self lastKnownStoreChangeTag];
    BOOL v8 = v6 == v7;
    BOOL v9 = v6 != v7;
    if (!v8)
    {
      [(SCKDatabaseJSONStore *)self _loadFromFileURL:v5];
      [(SCKDatabaseJSONStore *)self setLastKnownStoreChangeTag:value];
    }
  }
  else
  {
    BOOL v9 = 0;
  }
  [(SCKDatabaseJSONStore *)self setLoadedFromDisk:1];

  return v9;
}

- (void)_listenForChangesToFileURL:(id)a3
{
  id v4 = a3;
  id v5 = [v4 path];
  id v6 = [v5 stringByDeletingLastPathComponent];
  int v7 = open((const char *)[v6 fileSystemRepresentation], 0x8000);

  BOOL v8 = [(SCKDatabaseJSONStore *)self workQueue];
  dispatch_source_t v9 = dispatch_source_create(MEMORY[0x263EF8410], v7, 0xEuLL, v8);
  [(SCKDatabaseJSONStore *)self setChangeListenerSource:v9];

  uint64_t v10 = [(SCKDatabaseJSONStore *)self changeListenerSource];
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __51__SCKDatabaseJSONStore__listenForChangesToFileURL___block_invoke;
  handler[3] = &unk_26467DA60;
  handler[4] = self;
  id v17 = v4;
  id v11 = v4;
  dispatch_source_set_event_handler(v10, handler);

  id v12 = [(SCKDatabaseJSONStore *)self changeListenerSource];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __51__SCKDatabaseJSONStore__listenForChangesToFileURL___block_invoke_56;
  v14[3] = &__block_descriptor_36_e5_v8__0l;
  int v15 = v7;
  dispatch_source_set_cancel_handler(v12, v14);

  v13 = [(SCKDatabaseJSONStore *)self changeListenerSource];
  dispatch_resume(v13);
}

void __51__SCKDatabaseJSONStore__listenForChangesToFileURL___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  id v2 = [*(id *)(a1 + 32) accessQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__SCKDatabaseJSONStore__listenForChangesToFileURL___block_invoke_2;
  block[3] = &unk_26467DAB0;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v15 = v3;
  uint64_t v16 = v4;
  id v17 = &v18;
  dispatch_sync(v2, block);

  if (*((unsigned char *)v19 + 24))
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134217984;
      uint64_t v24 = v5;
      _os_log_impl(&dword_222ED9000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%p JSON store will notify of external changes from another writer", buf, 0xCu);
    }
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v6 = objc_msgSend(*(id *)(a1 + 32), "observers", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v22 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v10 + 1) + 8 * v9++) storeCoordinatorDiscoveredExternalChanges:*(void *)(a1 + 32)];
        }
        while (v7 != v9);
        uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v22 count:16];
      }
      while (v7);
    }
  }
  _Block_object_dispose(&v18, 8);
}

uint64_t __51__SCKDatabaseJSONStore__listenForChangesToFileURL___block_invoke_2(uint64_t a1)
{
  int value = 0;
  getxattr((const char *)[*(id *)(a1 + 32) fileSystemRepresentation], "com.apple.stocks.jsonStoreChangeTag", &value, 4uLL, 0, 0);
  int v2 = value;
  uint64_t result = [*(id *)(a1 + 40) lastKnownStoreChangeTag];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v2 != result;
  return result;
}

uint64_t __51__SCKDatabaseJSONStore__listenForChangesToFileURL___block_invoke_56(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

- (id)_encodeCodableObject:(id)a3
{
  id v3 = &stru_26D5DA820;
  if (a3)
  {
    uint64_t v9 = 0;
    uint64_t v4 = [MEMORY[0x263F08910] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v9];
    uint64_t v5 = [v4 base64EncodedStringWithOptions:0];
    id v6 = (void *)v5;
    if (v5) {
      uint64_t v7 = (__CFString *)v5;
    }
    else {
      uint64_t v7 = &stru_26D5DA820;
    }
    id v3 = v7;
  }

  return v3;
}

- (id)_decodeCodableObjectOfClass:(Class)a3 from:(id)a4 error:(id *)a5
{
  id v7 = a4;
  if ([v7 length])
  {
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v7 options:0];
    uint64_t v9 = [MEMORY[0x263F08928] unarchivedObjectOfClass:a3 fromData:v8 error:a5];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)_decodeCodableObjectOfClasses:(id)a3 from:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  if ([v8 length])
  {
    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v8 options:0];
    long long v10 = [MEMORY[0x263F08928] unarchivedObjectOfClasses:v7 fromData:v9 error:a5];
  }
  else
  {
    long long v10 = 0;
  }

  return v10;
}

- (id)_encodeDate:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  uint64_t v5 = [v4 stringFromDate:v3];

  return v5;
}

- (id)_decodeDate:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  uint64_t v5 = [v4 dateFromString:v3];

  return v5;
}

- (NSDate)lastSyncDate
{
  return self->_lastSyncDate;
}

- (void)setLastSyncDate:(id)a3
{
}

- (NSDate)lastDirtyDate
{
  return self->_lastDirtyDate;
}

- (void)setLastDirtyDate:(id)a3
{
}

- (CKServerChangeToken)serverChangeToken
{
  return self->_serverChangeToken;
}

- (void)setServerChangeToken:(id)a3
{
}

- (BOOL)isCloudBackupEnabled
{
  return self->_cloudBackupEnabled;
}

- (NSURL)presentedItemURL
{
  return (NSURL *)objc_getProperty(self, a2, 40, 1);
}

- (NSOperationQueue)presentedItemOperationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 48, 1);
}

- (NSFileCoordinator)fileCoordinator
{
  return self->_fileCoordinator;
}

- (void)setFileCoordinator:(id)a3
{
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (void)setAccessQueue:(id)a3
{
}

- (BOOL)loadedFromDisk
{
  return self->_loadedFromDisk;
}

- (void)setLoadedFromDisk:(BOOL)a3
{
  self->_loadedFromDisuint64_t k = a3;
}

- (unsigned)lastKnownStoreChangeTag
{
  return self->_lastKnownStoreChangeTag;
}

- (void)setLastKnownStoreChangeTag:(unsigned int)a3
{
  self->_lastKnownStoreChangeTag = a3;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (NSMutableDictionary)zoneStoresByName
{
  return self->_zoneStoresByName;
}

- (void)setZoneStoresByName:(id)a3
{
}

- (NSMutableDictionary)foreignZoneDictsByName
{
  return self->_foreignZoneDictsByName;
}

- (void)setForeignZoneDictsByName:(id)a3
{
}

- (BOOL)havePendingChanges
{
  return self->_havePendingChanges;
}

- (void)setHavePendingChanges:(BOOL)a3
{
  self->_havePendingChanges = a3;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (SCKOperationThrottler)saveThrottler
{
  return self->_saveThrottler;
}

- (void)setSaveThrottler:(id)a3
{
}

- (OS_dispatch_source)changeListenerSource
{
  return self->_changeListenerSource;
}

- (void)setChangeListenerSource:(id)a3
{
}

- (NSSet)allowedCommandClasses
{
  return self->_allowedCommandClasses;
}

- (void)setAllowedCommandClasses:(id)a3
{
}

- (NSURL)storeURL
{
  return self->_storeURL;
}

- (unint64_t)diskReadCount
{
  return self->_diskReadCount;
}

- (unint64_t)diskWriteCount
{
  return self->_diskWriteCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeURL, 0);
  objc_storeStrong((id *)&self->_allowedCommandClasses, 0);
  objc_storeStrong((id *)&self->_changeListenerSource, 0);
  objc_storeStrong((id *)&self->_saveThrottler, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_foreignZoneDictsByName, 0);
  objc_storeStrong((id *)&self->_zoneStoresByName, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_fileCoordinator, 0);
  objc_storeStrong((id *)&self->_presentedItemOperationQueue, 0);
  objc_storeStrong((id *)&self->_presentedItemURL, 0);
  objc_storeStrong((id *)&self->_serverChangeToken, 0);
  objc_storeStrong((id *)&self->_lastDirtyDate, 0);

  objc_storeStrong((id *)&self->_lastSyncDate, 0);
}

- (void)_saveToFileURL:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_222ED9000, &_os_log_internal, v0, "%p failed to generate database JSON with error: %{public}@", v1, v2, v3, v4, v5);
}

- (void)_saveToFileURL:.cold.2()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_222ED9000, &_os_log_internal, v0, "%p failed to write database JSON to disk with error: %{public}@", v1, v2, v3, v4, v5);
}

- (void)_loadFromFileURL:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_222ED9000, &_os_log_internal, v0, "%p failed to decode database JSON with error: %{public}@", v1, v2, v3, v4, v5);
}

@end