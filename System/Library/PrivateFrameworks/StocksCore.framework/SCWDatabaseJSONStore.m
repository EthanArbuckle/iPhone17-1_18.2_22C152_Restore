@interface SCWDatabaseJSONStore
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
- (SCWDatabaseJSONStore)initWithSchema:(id)a3 fileURL:(id)a4;
- (SCWDatabaseJSONStore)initWithSchema:(id)a3 fileURL:(id)a4 allowedCommandClasses:(id)a5;
- (SCWDatabaseJSONStore)initWithSchema:(id)a3 parentDirectoryURL:(id)a4;
- (SCWDatabaseJSONStore)initWithSchema:(id)a3 parentDirectoryURL:(id)a4 allowedCommandClasses:(id)a5;
- (SCWDatabaseSchema)databaseSchema;
- (SCWOperationThrottler)saveThrottler;
- (id)_decodeCodableObjectOfClass:(Class)a3 from:(id)a4 error:(id *)a5;
- (id)_decodeCodableObjectOfClasses:(id)a3 from:(id)a4 error:(id *)a5;
- (id)_encodeCodableObject:(id)a3;
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
- (void)setDatabaseSchema:(id)a3;
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

@implementation SCWDatabaseJSONStore

uint64_t __41__SCWDatabaseJSONStore_readWithAccessor___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) loadedFromDisk];
  if (result)
  {
    uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  return result;
}

- (BOOL)loadedFromDisk
{
  return self->_loadedFromDisk;
}

void __46__SCWDatabaseJSONStore_readZone_withAccessor___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 48);
  id v2 = [*(id *)(a1 + 32) zoneStoreForSchema:*(void *)(a1 + 40)];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (id)zoneStoreForSchema:(id)a3
{
  id v4 = a3;
  v5 = [(SCWDatabaseJSONStore *)self zoneStoresByName];
  v6 = [v4 zoneName];

  v7 = [v5 objectForKeyedSubscript:v6];

  return v7;
}

- (NSMutableDictionary)zoneStoresByName
{
  return self->_zoneStoresByName;
}

- (NSURL)presentedItemURL
{
  return (NSURL *)objc_getProperty(self, a2, 40, 1);
}

uint64_t __41__SCWDatabaseJSONStore_readWithAccessor___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) _reloadIfNeededFromFileURL:*(void *)(a1 + 40)];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v2();
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
    unsigned int v7 = [(SCWDatabaseJSONStore *)self lastKnownStoreChangeTag];
    BOOL v8 = v6 == v7;
    BOOL v9 = v6 != v7;
    if (!v8)
    {
      [(SCWDatabaseJSONStore *)self _loadFromFileURL:v5];
      [(SCWDatabaseJSONStore *)self setLastKnownStoreChangeTag:value];
    }
  }
  else
  {
    BOOL v9 = 0;
  }
  [(SCWDatabaseJSONStore *)self setLoadedFromDisk:1];

  return v9;
}

- (void)setLoadedFromDisk:(BOOL)a3
{
  self->_loadedFromDisk = a3;
}

- (void)setLastKnownStoreChangeTag:(unsigned int)a3
{
  self->_lastKnownStoreChangeTag = a3;
}

- (unsigned)lastKnownStoreChangeTag
{
  return self->_lastKnownStoreChangeTag;
}

- (void)setCloudBackupEnabled:(BOOL)a3
{
  self->_cloudBackupEnabled = a3;
  [(SCWDatabaseJSONStore *)self _applyCloudBackupEnabledPropertyToStoreURL];
}

- (void)readZone:(id)a3 withAccessor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __46__SCWDatabaseJSONStore_readZone_withAccessor___block_invoke;
  v10[3] = &unk_1E5FA39A8;
  id v11 = v6;
  id v12 = v7;
  v10[4] = self;
  id v8 = v6;
  id v9 = v7;
  [(SCWDatabaseJSONStore *)self readWithAccessor:v10];
}

- (void)readWithAccessor:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  id v5 = [(SCWDatabaseJSONStore *)self accessQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__SCWDatabaseJSONStore_readWithAccessor___block_invoke;
  block[3] = &unk_1E5FA3930;
  block[4] = self;
  id v6 = v4;
  id v14 = v6;
  v15 = &v16;
  dispatch_sync(v5, block);

  if (!*((unsigned char *)v17 + 24))
  {
    id v7 = [(SCWDatabaseJSONStore *)self fileCoordinator];
    id v8 = [(SCWDatabaseJSONStore *)self storeURL];
    id v12 = 0;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __41__SCWDatabaseJSONStore_readWithAccessor___block_invoke_2;
    v10[3] = &unk_1E5FA3980;
    v10[4] = self;
    id v11 = v6;
    [v7 coordinateReadingItemAtURL:v8 options:0 error:&v12 byAccessor:v10];
    id v9 = v12;
  }
  _Block_object_dispose(&v16, 8);
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (NSFileCoordinator)fileCoordinator
{
  return self->_fileCoordinator;
}

- (void)_applyCloudBackupEnabledPropertyToStoreURL
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v3 = @"disable";
  int v4 = 134218498;
  uint64_t v5 = a1;
  __int16 v6 = 2114;
  if (a2) {
    v3 = @"enable";
  }
  id v7 = v3;
  __int16 v8 = 2114;
  uint64_t v9 = a3;
  _os_log_error_impl(&dword_1AFD01000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%p failed to %{public}@ cloud backup for JSON database store: %{public}@", (uint8_t *)&v4, 0x20u);
}

- (NSURL)storeURL
{
  return self->_storeURL;
}

- (BOOL)isCloudBackupEnabled
{
  return self->_cloudBackupEnabled;
}

- (SCWDatabaseJSONStore)initWithSchema:(id)a3 fileURL:(id)a4 allowedCommandClasses:(id)a5
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v50.receiver = self;
  v50.super_class = (Class)SCWDatabaseJSONStore;
  id v12 = [(SCWDatabaseJSONStore *)&v50 init];
  v13 = v12;
  if (v12)
  {
    id v45 = v10;
    objc_storeStrong((id *)&v12->_storeURL, a4);
    objc_storeStrong((id *)&v13->_databaseSchema, a3);
    id v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    zoneStoresByName = v13->_zoneStoresByName;
    v13->_zoneStoresByName = v14;

    uint64_t v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    foreignZoneDictsByName = v13->_foreignZoneDictsByName;
    v13->_foreignZoneDictsByName = v16;

    uint64_t v18 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:517 capacity:0];
    observers = v13->_observers;
    v13->_observers = (NSHashTable *)v18;

    v20 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v21 = dispatch_queue_create("SCWDatabaseJSONStore.access", v20);
    accessQueue = v13->_accessQueue;
    v13->_accessQueue = (OS_dispatch_queue *)v21;

    v23 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v24 = dispatch_queue_attr_make_with_qos_class(v23, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v25 = dispatch_queue_create("SCWDatabaseJSONStore.work", v24);
    workQueue = v13->_workQueue;
    v13->_workQueue = (OS_dispatch_queue *)v25;

    v27 = [[SCWOperationThrottler alloc] initWithDelegate:v13 updateQueue:v13->_workQueue];
    saveThrottler = v13->_saveThrottler;
    v13->_saveThrottler = v27;

    uint64_t v29 = [objc_alloc(MEMORY[0x1E4F28CA0]) initWithFilePresenter:v13];
    fileCoordinator = v13->_fileCoordinator;
    v13->_fileCoordinator = (NSFileCoordinator *)v29;

    objc_storeStrong((id *)&v13->_presentedItemURL, v13->_storeURL);
    uint64_t v31 = objc_opt_new();
    presentedItemOperationQueue = v13->_presentedItemOperationQueue;
    v13->_presentedItemOperationQueue = (NSOperationQueue *)v31;

    [(NSOperationQueue *)v13->_presentedItemOperationQueue setMaxConcurrentOperationCount:1];
    if ([v11 count]) {
      [MEMORY[0x1E4F1CAD0] setWithArray:v11];
    }
    else {
    uint64_t v33 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
    }
    allowedCommandClasses = v13->_allowedCommandClasses;
    v13->_allowedCommandClasses = (NSSet *)v33;

    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    v35 = [v9 zoneSchemas];
    uint64_t v36 = [v35 countByEnumeratingWithState:&v46 objects:v51 count:16];
    if (v36)
    {
      uint64_t v37 = v36;
      uint64_t v38 = *(void *)v47;
      do
      {
        for (uint64_t i = 0; i != v37; ++i)
        {
          if (*(void *)v47 != v38) {
            objc_enumerationMutation(v35);
          }
          v40 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          v41 = [[SCWZoneJSONStore alloc] initWithZoneSchema:v40 serverRecords:0 lastSyncDate:0 lastDirtyDate:0 serverChangeToken:0 pendingCommands:0];
          v42 = [(SCWDatabaseJSONStore *)v13 zoneStoresByName];
          v43 = [v40 zoneName];
          [v42 setObject:v41 forKeyedSubscript:v43];
        }
        uint64_t v37 = [v35 countByEnumeratingWithState:&v46 objects:v51 count:16];
      }
      while (v37);
    }

    [(SCWDatabaseJSONStore *)v13 _listenForChangesToFileURL:v13->_storeURL];
    id v10 = v45;
  }

  return v13;
}

- (void)_loadFromFileURL:(id)a3
{
  uint64_t v115 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v79 = [MEMORY[0x1E4F1CA60] dictionary];
  v73 = objc_opt_new();
  v69 = v4;
  v70 = [NSString stringWithContentsOfURL:v4 encoding:4 error:0];
  if (v70)
  {
    uint64_t v5 = [v70 dataUsingEncoding:4];
    id v102 = 0;
    __int16 v6 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v5 options:0 error:&v102];
    id v7 = v102;
    __int16 v8 = v7;
    if (v6)
    {
      id v81 = v7;
      v83 = v5;
      id v9 = [v6 objectForKeyedSubscript:@"database"];
      id v10 = [v9 objectForKeyedSubscript:@"lastSyncDate"];
      id v11 = [v73 dateFromString:v10];
      lastSyncDate = self->_lastSyncDate;
      self->_lastSyncDate = v11;

      v13 = [v9 objectForKeyedSubscript:@"lastDirtyDate"];
      id v14 = [v73 dateFromString:v13];
      lastDirtyDate = self->_lastDirtyDate;
      self->_lastDirtyDate = v14;

      uint64_t v16 = objc_opt_class();
      v17 = [v9 objectForKeyedSubscript:@"serverChangeToken"];
      uint64_t v18 = [(SCWDatabaseJSONStore *)self _decodeCodableObjectOfClass:v16 from:v17 error:0];
      serverChangeToken = self->_serverChangeToken;
      self->_serverChangeToken = v18;

      long long v100 = 0u;
      long long v101 = 0u;
      long long v98 = 0u;
      long long v99 = 0u;
      v20 = [v9 objectForKeyedSubscript:@"zones"];
      uint64_t v21 = [v20 countByEnumeratingWithState:&v98 objects:v114 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v99;
        do
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v99 != v23) {
              objc_enumerationMutation(v20);
            }
            dispatch_queue_t v25 = *(void **)(*((void *)&v98 + 1) + 8 * i);
            v26 = [v25 objectForKeyedSubscript:@"name"];
            [v79 setObject:v25 forKeyedSubscript:v26];
          }
          uint64_t v22 = [v20 countByEnumeratingWithState:&v98 objects:v114 count:16];
        }
        while (v22);
      }

      __int16 v8 = v81;
      uint64_t v5 = v83;
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      -[SCWDatabaseJSONStore _loadFromFileURL:]();
    }
  }
  long long v96 = 0u;
  long long v97 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  obuint64_t j = [v79 allKeys];
  uint64_t v75 = [obj countByEnumeratingWithState:&v94 objects:v113 count:16];
  if (v75)
  {
    uint64_t v74 = *(void *)v95;
    unint64_t v27 = 0x1E4F1C000uLL;
    do
    {
      for (uint64_t j = 0; j != v75; ++j)
      {
        if (*(void *)v95 != v74) {
          objc_enumerationMutation(obj);
        }
        uint64_t v29 = *(void **)(*((void *)&v94 + 1) + 8 * j);
        v30 = [v79 objectForKeyedSubscript:v29];
        uint64_t v31 = [(SCWDatabaseJSONStore *)self zoneStoresByName];
        v82 = v29;
        v32 = [v31 objectForKeyedSubscript:v29];

        if (v32)
        {
          uint64_t v78 = j;
          uint64_t v33 = [*(id *)(v27 + 2632) array];
          long long v90 = 0u;
          long long v91 = 0u;
          long long v92 = 0u;
          long long v93 = 0u;
          v80 = v30;
          v34 = [v30 objectForKeyedSubscript:@"serverRecords"];
          uint64_t v35 = [v34 countByEnumeratingWithState:&v90 objects:v112 count:16];
          if (v35)
          {
            uint64_t v36 = v35;
            uint64_t v37 = *(void *)v91;
            do
            {
              for (uint64_t k = 0; k != v36; ++k)
              {
                if (*(void *)v91 != v37) {
                  objc_enumerationMutation(v34);
                }
                uint64_t v39 = *(void *)(*((void *)&v90 + 1) + 8 * k);
                uint64_t v40 = objc_opt_class();
                id v89 = 0;
                v41 = [(SCWDatabaseJSONStore *)self _decodeCodableObjectOfClass:v40 from:v39 error:&v89];
                id v42 = v89;
                if (v41)
                {
                  [v33 addObject:v41];
                }
                else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 134218242;
                  v104 = self;
                  __int16 v105 = 2114;
                  id v106 = v42;
                  _os_log_error_impl(&dword_1AFD01000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%p failed to decode server record with error: %{public}@", buf, 0x16u);
                }
              }
              uint64_t v36 = [v34 countByEnumeratingWithState:&v90 objects:v112 count:16];
            }
            while (v36);
          }

          v43 = [*(id *)(v27 + 2632) array];
          long long v85 = 0u;
          long long v86 = 0u;
          long long v87 = 0u;
          long long v88 = 0u;
          v44 = [v80 objectForKeyedSubscript:@"pendingCommands"];
          uint64_t v45 = [v44 countByEnumeratingWithState:&v85 objects:v111 count:16];
          if (v45)
          {
            uint64_t v46 = v45;
            uint64_t v47 = *(void *)v86;
            do
            {
              for (uint64_t m = 0; m != v46; ++m)
              {
                if (*(void *)v86 != v47) {
                  objc_enumerationMutation(v44);
                }
                uint64_t v49 = *(void *)(*((void *)&v85 + 1) + 8 * m);
                objc_super v50 = [(SCWDatabaseJSONStore *)self allowedCommandClasses];
                id v84 = 0;
                v51 = [(SCWDatabaseJSONStore *)self _decodeCodableObjectOfClasses:v50 from:v49 error:&v84];
                id v52 = v84;

                if (v51)
                {
                  [v43 addObject:v51];
                }
                else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 134218242;
                  v104 = self;
                  __int16 v105 = 2114;
                  id v106 = v52;
                  _os_log_error_impl(&dword_1AFD01000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%p failed to decode command with error: %{public}@", buf, 0x16u);
                }
              }
              uint64_t v46 = [v44 countByEnumeratingWithState:&v85 objects:v111 count:16];
            }
            while (v46);
          }

          v53 = [v80 objectForKeyedSubscript:@"lastSyncDate"];
          v77 = [v73 dateFromString:v53];

          v54 = [v80 objectForKeyedSubscript:@"lastDirtyDate"];
          v55 = [v73 dateFromString:v54];

          uint64_t v56 = objc_opt_class();
          v57 = [v80 objectForKeyedSubscript:@"serverChangeToken"];
          v58 = [(SCWDatabaseJSONStore *)self _decodeCodableObjectOfClass:v56 from:v57 error:0];

          v59 = [v80 objectForKeyedSubscript:@"schemaVersion"];
          v60 = [(SCWDatabaseJSONStore *)self databaseSchema];
          v61 = [v60 schemaForZoneName:v82];

          unint64_t v62 = [v61 version];
          v76 = v59;
          if (v62 <= [v59 unsignedIntegerValue])
          {
            v66 = v77;
            uint64_t j = v78;
          }
          else
          {
            v72 = v58;
            uint64_t j = v78;
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
            {
              v63 = [v61 zoneName];
              uint64_t v64 = [v59 unsignedIntegerValue];
              uint64_t v65 = [v61 version];
              *(_DWORD *)buf = 134218754;
              v104 = self;
              __int16 v105 = 2114;
              id v106 = v63;
              __int16 v107 = 2048;
              uint64_t v108 = v64;
              __int16 v109 = 2048;
              uint64_t v110 = v65;
              _os_log_impl(&dword_1AFD01000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%p discarding sync state for zone %{public}@ due to version mismatch, persisted=%lu, current=%lu", buf, 0x2Au);
            }
            v66 = 0;
            v55 = 0;
            v58 = 0;
          }
          v67 = [[SCWZoneJSONStore alloc] initWithZoneSchema:v61 serverRecords:v33 lastSyncDate:v66 lastDirtyDate:v55 serverChangeToken:v58 pendingCommands:v43];
          v68 = [(SCWDatabaseJSONStore *)self zoneStoresByName];
          [v68 setObject:v67 forKeyedSubscript:v82];

          unint64_t v27 = 0x1E4F1C000;
          v30 = v80;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218242;
            v104 = self;
            __int16 v105 = 2114;
            id v106 = v82;
            _os_log_impl(&dword_1AFD01000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%p preserving unknown zone %{public}@", buf, 0x16u);
          }
          uint64_t v33 = [(SCWDatabaseJSONStore *)self foreignZoneDictsByName];
          [v33 setObject:v30 forKeyedSubscript:v82];
        }
      }
      uint64_t v75 = [obj countByEnumeratingWithState:&v94 objects:v113 count:16];
    }
    while (v75);
  }

  ++self->_diskReadCount;
}

- (NSSet)allowedCommandClasses
{
  return self->_allowedCommandClasses;
}

- (id)_decodeCodableObjectOfClasses:(id)a3 from:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  if ([v8 length])
  {
    id v9 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v8 options:0];
    id v10 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v7 fromData:v9 error:a5];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)_decodeCodableObjectOfClass:(Class)a3 from:(id)a4 error:(id *)a5
{
  id v7 = a4;
  if ([v7 length])
  {
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v7 options:0];
    id v9 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:a3 fromData:v8 error:a5];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (SCWDatabaseSchema)databaseSchema
{
  return self->_databaseSchema;
}

- (void)_listenForChangesToFileURL:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 path];
  id v6 = [v5 stringByDeletingLastPathComponent];
  int v7 = open((const char *)[v6 fileSystemRepresentation], 0x8000);

  id v8 = [(SCWDatabaseJSONStore *)self workQueue];
  dispatch_source_t v9 = dispatch_source_create(MEMORY[0x1E4F144A8], v7, 0xEuLL, v8);
  [(SCWDatabaseJSONStore *)self setChangeListenerSource:v9];

  id v10 = [(SCWDatabaseJSONStore *)self changeListenerSource];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __51__SCWDatabaseJSONStore__listenForChangesToFileURL___block_invoke;
  handler[3] = &unk_1E5FA39D0;
  handler[4] = self;
  id v17 = v4;
  id v11 = v4;
  dispatch_source_set_event_handler(v10, handler);

  id v12 = [(SCWDatabaseJSONStore *)self changeListenerSource];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __51__SCWDatabaseJSONStore__listenForChangesToFileURL___block_invoke_60;
  v14[3] = &__block_descriptor_36_e5_v8__0l;
  int v15 = v7;
  dispatch_source_set_cancel_handler(v12, v14);

  v13 = [(SCWDatabaseJSONStore *)self changeListenerSource];
  dispatch_resume(v13);
}

- (OS_dispatch_source)changeListenerSource
{
  return self->_changeListenerSource;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setChangeListenerSource:(id)a3
{
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(SCWDatabaseJSONStore *)self observers];
  [v5 addObject:v4];
}

- (NSHashTable)observers
{
  return self->_observers;
}

+ (id)preferredFileURLForSchema:(id)a3 parentDirectoryURL:(id)a4
{
  id v5 = NSString;
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 name];
  uint64_t v9 = [v7 environment];

  id v10 = @"sandbox";
  if (v9 == 1) {
    id v10 = @"production";
  }
  id v11 = [v5 stringWithFormat:@"%@-%@-dbstore.json", v8, v10];

  id v12 = [v6 URLByAppendingPathComponent:v11];

  return v12;
}

void __41__SCWDatabaseJSONStore_readWithAccessor___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) accessQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__SCWDatabaseJSONStore_readWithAccessor___block_invoke_3;
  block[3] = &unk_1E5FA3958;
  id v5 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_sync(v4, block);
}

- (SCWDatabaseJSONStore)initWithSchema:(id)a3 parentDirectoryURL:(id)a4 allowedCommandClasses:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(id)objc_opt_class() preferredFileURLForSchema:v10 parentDirectoryURL:v9];

  id v12 = [(SCWDatabaseJSONStore *)self initWithSchema:v10 fileURL:v11 allowedCommandClasses:v8];
  return v12;
}

- (SCWDatabaseJSONStore)initWithSchema:(id)a3 fileURL:(id)a4
{
  return [(SCWDatabaseJSONStore *)self initWithSchema:a3 fileURL:a4 allowedCommandClasses:0];
}

- (SCWDatabaseJSONStore)initWithSchema:(id)a3 parentDirectoryURL:(id)a4
{
  return [(SCWDatabaseJSONStore *)self initWithSchema:a3 parentDirectoryURL:a4 allowedCommandClasses:0];
}

- (void)writeWithAccessor:(id)a3
{
  id v4 = a3;
  id v5 = [(SCWDatabaseJSONStore *)self fileCoordinator];
  id v6 = [(SCWDatabaseJSONStore *)self storeURL];
  id v11 = v4;
  id v12 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __42__SCWDatabaseJSONStore_writeWithAccessor___block_invoke;
  v10[3] = &unk_1E5FA3980;
  v10[4] = self;
  id v7 = v4;
  [v5 coordinateReadingItemAtURL:v6 options:0 error:&v12 byAccessor:v10];
  id v8 = v12;

  id v9 = [(SCWDatabaseJSONStore *)self saveThrottler];
  [v9 tickle];
}

void __42__SCWDatabaseJSONStore_writeWithAccessor___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) accessQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__SCWDatabaseJSONStore_writeWithAccessor___block_invoke_2;
  block[3] = &unk_1E5FA3958;
  id v5 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_sync(v4, block);
}

uint64_t __42__SCWDatabaseJSONStore_writeWithAccessor___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _reloadIfNeededFromFileURL:*(void *)(a1 + 40)];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  uint64_t result = [*(id *)(a1 + 32) havePendingChanges];
  if ((result & 1) == 0)
  {
    [*(id *)(a1 + 32) setHavePendingChanges:1];
    id v3 = (void *)MEMORY[0x1E4F28CA0];
    uint64_t v4 = *(void *)(a1 + 32);
    return [v3 addFilePresenter:v4];
  }
  return result;
}

- (void)reloadWithAccessor:(id)a3
{
  id v4 = a3;
  id v5 = [(SCWDatabaseJSONStore *)self fileCoordinator];
  id v6 = [(SCWDatabaseJSONStore *)self storeURL];
  id v11 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __43__SCWDatabaseJSONStore_reloadWithAccessor___block_invoke;
  v9[3] = &unk_1E5FA3980;
  v9[4] = self;
  id v10 = v4;
  id v7 = v4;
  [v5 coordinateReadingItemAtURL:v6 options:0 error:&v11 byAccessor:v9];
  id v8 = v11;
}

void __43__SCWDatabaseJSONStore_reloadWithAccessor___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) accessQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__SCWDatabaseJSONStore_reloadWithAccessor___block_invoke_2;
  block[3] = &unk_1E5FA3958;
  id v5 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_sync(v4, block);
}

uint64_t __43__SCWDatabaseJSONStore_reloadWithAccessor___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _reloadIfNeededFromFileURL:*(void *)(a1 + 40)];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v2();
}

- (void)writeZone:(id)a3 withAccessor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __47__SCWDatabaseJSONStore_writeZone_withAccessor___block_invoke;
  v10[3] = &unk_1E5FA39A8;
  id v11 = v6;
  id v12 = v7;
  v10[4] = self;
  id v8 = v6;
  id v9 = v7;
  [(SCWDatabaseJSONStore *)self writeWithAccessor:v10];
}

void __47__SCWDatabaseJSONStore_writeZone_withAccessor___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 48);
  id v2 = [*(id *)(a1 + 32) zoneStoreForSchema:*(void *)(a1 + 40)];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(SCWDatabaseJSONStore *)self observers];
  [v5 removeObject:v4];
}

- (void)operationThrottlerPerformOperation:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134217984;
    id v6 = self;
    _os_log_impl(&dword_1AFD01000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%p JSON store will flush changes to disk", (uint8_t *)&v5, 0xCu);
  }
  id v4 = [(SCWDatabaseJSONStore *)self storeURL];
  [(SCWDatabaseJSONStore *)self _saveIfNeededToFileURL:v4];
}

- (void)savePresentedItemChangesWithCompletionHandler:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void))a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    uint64_t v7 = self;
    _os_log_impl(&dword_1AFD01000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%p JSON store will flush changes to disk for another reader", (uint8_t *)&v6, 0xCu);
  }
  int v5 = [(SCWDatabaseJSONStore *)self storeURL];
  [(SCWDatabaseJSONStore *)self _saveIfNeededToFileURL:v5];

  v4[2](v4, 0);
}

- (BOOL)flushToDiskWithTimeout:(double)a3
{
  id v4 = [(SCWDatabaseJSONStore *)self storeURL];
  [(SCWDatabaseJSONStore *)self _saveIfNeededToFileURL:v4];

  return 1;
}

- (void)_saveToFileURL:(id)a3
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v55 = a3;
  v59 = objc_opt_new();
  id v4 = [MEMORY[0x1E4F1CA48] array];
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  int v5 = [(SCWDatabaseJSONStore *)self foreignZoneDictsByName];
  int v6 = [v5 allValues];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v76 objects:v83 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v77;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v77 != v9) {
          objc_enumerationMutation(v6);
        }
        [v4 addObject:*(void *)(*((void *)&v76 + 1) + 8 * i)];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v76 objects:v83 count:16];
    }
    while (v8);
  }

  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id v11 = [(SCWDatabaseJSONStore *)self zoneStoresByName];
  id v12 = [v11 allValues];

  obuint64_t j = v12;
  v58 = v4;
  uint64_t v60 = [v12 countByEnumeratingWithState:&v72 objects:v82 count:16];
  if (v60)
  {
    uint64_t v57 = *(void *)v73;
    do
    {
      for (uint64_t j = 0; j != v60; ++j)
      {
        if (*(void *)v73 != v57) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v72 + 1) + 8 * j);
        int v15 = [MEMORY[0x1E4F1CA48] array];
        long long v68 = 0u;
        long long v69 = 0u;
        long long v70 = 0u;
        long long v71 = 0u;
        uint64_t v16 = [v14 serverRecords];
        uint64_t v17 = [v16 countByEnumeratingWithState:&v68 objects:v81 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v69;
          do
          {
            for (uint64_t k = 0; k != v18; ++k)
            {
              if (*(void *)v69 != v19) {
                objc_enumerationMutation(v16);
              }
              uint64_t v21 = [(SCWDatabaseJSONStore *)self _encodeCodableObject:*(void *)(*((void *)&v68 + 1) + 8 * k)];
              [v15 addObject:v21];
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v68 objects:v81 count:16];
          }
          while (v18);
        }

        uint64_t v22 = [MEMORY[0x1E4F1CA48] array];
        long long v64 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        long long v67 = 0u;
        uint64_t v23 = [v14 pendingCommands];
        uint64_t v24 = [v23 countByEnumeratingWithState:&v64 objects:v80 count:16];
        if (v24)
        {
          uint64_t v25 = v24;
          uint64_t v26 = *(void *)v65;
          do
          {
            for (uint64_t m = 0; m != v25; ++m)
            {
              if (*(void *)v65 != v26) {
                objc_enumerationMutation(v23);
              }
              v28 = [(SCWDatabaseJSONStore *)self _encodeCodableObject:*(void *)(*((void *)&v64 + 1) + 8 * m)];
              [v22 addObject:v28];
            }
            uint64_t v25 = [v23 countByEnumeratingWithState:&v64 objects:v80 count:16];
          }
          while (v25);
        }

        uint64_t v29 = [MEMORY[0x1E4F1CA60] dictionary];
        v30 = [v14 zoneSchema];
        uint64_t v31 = [v30 zoneName];
        [v29 setObject:v31 forKeyedSubscript:@"name"];

        [v29 setObject:v15 forKeyedSubscript:@"serverRecords"];
        [v29 setObject:v22 forKeyedSubscript:@"pendingCommands"];
        v32 = [v14 lastSyncDate];
        uint64_t v33 = [v59 stringFromDate:v32];
        [v29 setObject:v33 forKeyedSubscript:@"lastSyncDate"];

        v34 = [v14 lastDirtyDate];
        uint64_t v35 = [v59 stringFromDate:v34];
        [v29 setObject:v35 forKeyedSubscript:@"lastDirtyDate"];

        uint64_t v36 = [v14 serverChangeToken];
        uint64_t v37 = [(SCWDatabaseJSONStore *)self _encodeCodableObject:v36];
        [v29 setObject:v37 forKeyedSubscript:@"serverChangeToken"];

        uint64_t v38 = NSNumber;
        uint64_t v39 = [v14 zoneSchema];
        uint64_t v40 = objc_msgSend(v38, "numberWithUnsignedInteger:", objc_msgSend(v39, "version"));
        [v29 setObject:v40 forKeyedSubscript:@"schemaVersion"];

        id v4 = v58;
        [v58 addObject:v29];
      }
      uint64_t v60 = [obj countByEnumeratingWithState:&v72 objects:v82 count:16];
    }
    while (v60);
  }

  v41 = [MEMORY[0x1E4F1CA60] dictionary];
  id v42 = [(SCWDatabaseJSONStore *)self lastSyncDate];
  v43 = [v59 stringFromDate:v42];
  [v41 setObject:v43 forKeyedSubscript:@"lastSyncDate"];

  v44 = [(SCWDatabaseJSONStore *)self lastDirtyDate];
  uint64_t v45 = [v59 stringFromDate:v44];
  [v41 setObject:v45 forKeyedSubscript:@"lastDirtyDate"];

  uint64_t v46 = [(SCWDatabaseJSONStore *)self serverChangeToken];
  uint64_t v47 = [(SCWDatabaseJSONStore *)self _encodeCodableObject:v46];
  [v41 setObject:v47 forKeyedSubscript:@"serverChangeToken"];

  [v41 setObject:v4 forKeyedSubscript:@"zones"];
  long long v48 = [MEMORY[0x1E4F1CA60] dictionary];
  [v48 setObject:v41 forKeyedSubscript:@"database"];
  id v63 = 0;
  uint64_t v49 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v48 options:0 error:&v63];
  id v50 = v63;
  if (v49)
  {
    v51 = (void *)[[NSString alloc] initWithData:v49 encoding:4];
    id v62 = v50;
    int v52 = [v51 writeToURL:v55 atomically:1 encoding:4 error:&v62];
    id v53 = v62;

    if (v52)
    {
      uint32_t value = arc4random_uniform(0xFFFFFFFE) + 1;
      setxattr((const char *)[v55 fileSystemRepresentation], "com.apple.stocks.jsonStoreChangeTag", &value, 4uLL, 0, 0);
      [(SCWDatabaseJSONStore *)self setLastKnownStoreChangeTag:value];
      v54 = v58;
    }
    else
    {
      v54 = v58;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[SCWDatabaseJSONStore _saveToFileURL:]();
      }
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SCWDatabaseJSONStore _saveToFileURL:]();
    }
    id v53 = v50;
    v54 = v58;
  }
  [(SCWDatabaseJSONStore *)self _applyCloudBackupEnabledPropertyToStoreURL];
  ++self->_diskWriteCount;
}

- (void)_saveIfNeededToFileURL:(id)a3
{
  id v4 = [(SCWDatabaseJSONStore *)self fileCoordinator];
  int v5 = [(SCWDatabaseJSONStore *)self storeURL];
  v7[4] = self;
  id v8 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__SCWDatabaseJSONStore__saveIfNeededToFileURL___block_invoke;
  v7[3] = &unk_1E5FA39F8;
  [v4 coordinateWritingItemAtURL:v5 options:4 error:&v8 byAccessor:v7];
  id v6 = v8;
}

void __47__SCWDatabaseJSONStore__saveIfNeededToFileURL___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) accessQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__SCWDatabaseJSONStore__saveIfNeededToFileURL___block_invoke_2;
  v6[3] = &unk_1E5FA39D0;
  v6[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v5 = v3;
  dispatch_sync(v4, v6);
}

uint64_t __47__SCWDatabaseJSONStore__saveIfNeededToFileURL___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) havePendingChanges];
  if (result)
  {
    [*(id *)(a1 + 32) _saveToFileURL:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) setHavePendingChanges:0];
    id v3 = (void *)MEMORY[0x1E4F28CA0];
    uint64_t v4 = *(void *)(a1 + 32);
    return [v3 removeFilePresenter:v4];
  }
  return result;
}

void __51__SCWDatabaseJSONStore__listenForChangesToFileURL___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  id v2 = [*(id *)(a1 + 32) accessQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__SCWDatabaseJSONStore__listenForChangesToFileURL___block_invoke_2;
  block[3] = &unk_1E5FA3A20;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v15 = v3;
  uint64_t v16 = v4;
  uint64_t v17 = &v18;
  dispatch_sync(v2, block);

  if (*((unsigned char *)v19 + 24))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134217984;
      uint64_t v24 = v5;
      _os_log_impl(&dword_1AFD01000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%p JSON store will notify of external changes from another writer", buf, 0xCu);
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

uint64_t __51__SCWDatabaseJSONStore__listenForChangesToFileURL___block_invoke_2(uint64_t a1)
{
  int value = 0;
  getxattr((const char *)[*(id *)(a1 + 32) fileSystemRepresentation], "com.apple.stocks.jsonStoreChangeTag", &value, 4uLL, 0, 0);
  int v2 = value;
  uint64_t result = [*(id *)(a1 + 40) lastKnownStoreChangeTag];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v2 != result;
  return result;
}

uint64_t __51__SCWDatabaseJSONStore__listenForChangesToFileURL___block_invoke_60(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

- (id)_encodeCodableObject:(id)a3
{
  id v3 = &stru_1F087FC88;
  if (a3)
  {
    uint64_t v9 = 0;
    uint64_t v4 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v9];
    uint64_t v5 = [v4 base64EncodedStringWithOptions:0];
    id v6 = (void *)v5;
    if (v5) {
      uint64_t v7 = (__CFString *)v5;
    }
    else {
      uint64_t v7 = &stru_1F087FC88;
    }
    id v3 = v7;
  }

  return v3;
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

- (NSOperationQueue)presentedItemOperationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 48, 1);
}

- (void)setFileCoordinator:(id)a3
{
}

- (void)setAccessQueue:(id)a3
{
}

- (void)setDatabaseSchema:(id)a3
{
}

- (void)setObservers:(id)a3
{
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

- (void)setWorkQueue:(id)a3
{
}

- (SCWOperationThrottler)saveThrottler
{
  return self->_saveThrottler;
}

- (void)setSaveThrottler:(id)a3
{
}

- (void)setAllowedCommandClasses:(id)a3
{
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
  objc_storeStrong((id *)&self->_databaseSchema, 0);
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
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v0, "%p failed to generate database JSON with error: %{public}@", v1, v2, v3, v4, v5);
}

- (void)_saveToFileURL:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v0, "%p failed to write database JSON to disk with error: %{public}@", v1, v2, v3, v4, v5);
}

- (void)_loadFromFileURL:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1AFD01000, MEMORY[0x1E4F14500], v0, "%p failed to decode database JSON with error: %{public}@", v1, v2, v3, v4, v5);
}

@end