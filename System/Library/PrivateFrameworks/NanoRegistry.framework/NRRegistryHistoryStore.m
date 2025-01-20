@interface NRRegistryHistoryStore
+ (id)sharedInstance;
- (NRDeviceCollectionHistory)history;
- (NRRegistryHistoryStore)initWithParameters:(id)a3;
- (id)addDiffIndexObserverWithWriteBlock:(id)a3;
- (id)collection;
- (void)_loadAndNotifySecureProperties;
- (void)_notifyDiffIndexObserversWithHistoryEntry:(id)a3 deviceCollection:(id)a4 secureProperties:(id)a5;
- (void)_notifyObserversSecurePropertiesAreAvailableWithCollection:(id)a3 secureProperties:(id)a4;
- (void)dealloc;
- (void)deasyncGrabHistoryWithReadBlock:(id)a3;
- (void)deasyncGrabHistoryWithWriteBlock:(id)a3;
- (void)grabHistoryWithReadBlock:(id)a3;
- (void)grabHistoryWithWriteBlock:(id)a3;
- (void)invalidate;
- (void)removeDiffIndexObserver:(id)a3;
@end

@implementation NRRegistryHistoryStore

- (void)deasyncGrabHistoryWithReadBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __72__NRRegistryHistoryStore_sync_history__deasyncGrabHistoryWithReadBlock___block_invoke;
  v6[3] = &unk_1E5B00790;
  id v7 = v4;
  id v5 = v4;
  [(NRRegistryHistoryStore *)self grabHistoryWithReadBlock:v6];
}

uint64_t __72__NRRegistryHistoryStore_sync_history__deasyncGrabHistoryWithReadBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)deasyncGrabHistoryWithWriteBlock:(id)a3
{
  id v4 = a3;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __73__NRRegistryHistoryStore_sync_history__deasyncGrabHistoryWithWriteBlock___block_invoke;
  v8[3] = &unk_1E5B007B8;
  dispatch_semaphore_t v9 = v5;
  id v10 = v4;
  v6 = v5;
  id v7 = v4;
  [(NRRegistryHistoryStore *)self grabHistoryWithWriteBlock:v8];
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
}

id __73__NRRegistryHistoryStore_sync_history__deasyncGrabHistoryWithWriteBlock___block_invoke(uint64_t a1)
{
  v2 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

  return v2;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__NRRegistryHistoryStore_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1E95CEA70 != -1) {
    dispatch_once(&qword_1E95CEA70, block);
  }
  v2 = (void *)_MergedGlobals_3;

  return v2;
}

uint64_t __40__NRRegistryHistoryStore_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = _MergedGlobals_3;
  _MergedGlobals_3 = (uint64_t)v1;

  return MEMORY[0x1F41817F8](v1, v2);
}

- (NRRegistryHistoryStore)initWithParameters:(id)a3
{
  id v4 = a3;
  dispatch_semaphore_t v5 = (void *)[v4 mutableCopy];
  if (!v5)
  {
    dispatch_semaphore_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  [v5 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"NRRegistryShouldCreateCollection"];
  v21.receiver = self;
  v21.super_class = (Class)NRRegistryHistoryStore;
  v6 = [(NRRegistry *)&v21 initWithParameters:v5];
  if (v6)
  {
    objc_initWeak(&location, v6);
    id v7 = objc_opt_class();
    v8 = dispatch_get_global_queue(21, 0);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __45__NRRegistryHistoryStore_initWithParameters___block_invoke;
    v17[3] = &unk_1E5B017D0;
    dispatch_semaphore_t v9 = v6;
    v18 = v9;
    objc_copyWeak(&v19, &location);
    v9->_keyBagStatusChangedNotificationToken = [v7 registerNotifyTokenWithName:@"com.apple.mobile.keybagd.lock_status" withQueue:v8 withBlock:v17];

    id v10 = +[NRDataFileHistoryHelpers unarchiveDeviceHistory];
    if (v10) {
      +[NRDataFileHistoryHelpers createMissingDates:v10];
    }
    else {
      id v10 = objc_opt_new();
    }
    id v11 = v10;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __37__NRRegistryHistoryStore_setHistory___block_invoke;
    v22[3] = &unk_1E5B002A8;
    id v12 = v11;
    id v23 = v12;
    v24 = v9;
    [(NRRegistry *)v9 performUnderCollectionLock:v22];

    v13 = [v5 objectForKeyedSubscript:@"NRRegistryHistoryStoreShouldInitializeWithFirstUnlockStatus"];
    v14 = v13;
    if (v13) {
      int v15 = [v13 BOOLValue];
    }
    else {
      int v15 = MKBDeviceUnlockedSinceBoot();
    }
    if (v15) {
      -[NRRegistryHistoryStore _loadAndNotifySecureProperties](v9);
    }
    [(NRRegistry *)v9 _startQueue];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return v6;
}

void __45__NRRegistryHistoryStore_initWithParameters___block_invoke(uint64_t a1)
{
  if (MKBDeviceUnlockedSinceBoot())
  {
    uint64_t v2 = *(void **)(a1 + 32);
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __45__NRRegistryHistoryStore_initWithParameters___block_invoke_2;
    v3[3] = &unk_1E5B017A8;
    objc_copyWeak(&v4, (id *)(a1 + 40));
    [v2 grabHistoryWithWriteBlock:v3];
    objc_destroyWeak(&v4);
  }
}

uint64_t __45__NRRegistryHistoryStore_initWithParameters___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[NRRegistryHistoryStore _loadAndNotifySecureProperties](WeakRetained);

  return 0;
}

- (void)_loadAndNotifySecureProperties
{
  if (a1)
  {
    uint64_t v2 = [a1 secureProperties];

    if (!v2)
    {
      uint64_t v3 = +[NRDataFileHistoryHelpers unarchiveSecureProperties];
      if (!v3) {
        uint64_t v3 = objc_opt_new();
      }
      id v4 = (id)v3;
      [a1 setSecureProperties:v3];
    }
  }
}

- (void)dealloc
{
  int keyBagStatusChangedNotificationToken = self->_keyBagStatusChangedNotificationToken;
  if (keyBagStatusChangedNotificationToken != -1)
  {
    notify_cancel(keyBagStatusChangedNotificationToken);
    self->_int keyBagStatusChangedNotificationToken = -1;
  }
  v4.receiver = self;
  v4.super_class = (Class)NRRegistryHistoryStore;
  [(NRRegistryHistoryStore *)&v4 dealloc];
}

- (void)_notifyObserversSecurePropertiesAreAvailableWithCollection:(id)a3 secureProperties:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)NRRegistryHistoryStore;
  [(NRRegistry *)&v8 _notifyObserversSecurePropertiesAreAvailableWithCollection:a3 secureProperties:a4];
  dispatch_semaphore_t v5 = [(NRRegistry *)self secureProperties];

  if (v5)
  {
    v6 = [(NRRegistry *)self managementQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __102__NRRegistryHistoryStore__notifyObserversSecurePropertiesAreAvailableWithCollection_secureProperties___block_invoke;
    block[3] = &unk_1E5B00230;
    block[4] = self;
    dispatch_async(v6, block);
  }
}

void __102__NRRegistryHistoryStore__notifyObserversSecurePropertiesAreAvailableWithCollection_secureProperties___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) secureProperties];

  if (v2)
  {
    int v3 = *(_DWORD *)(*(void *)(a1 + 32) + 88);
    if (v3 != -1)
    {
      notify_cancel(v3);
      *(_DWORD *)(*(void *)(a1 + 32) + 88) = -1;
    }
  }
}

- (id)collection
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  objc_super v8 = __Block_byref_object_copy__4;
  dispatch_semaphore_t v9 = __Block_byref_object_dispose__4;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __36__NRRegistryHistoryStore_collection__block_invoke;
  v4[3] = &unk_1E5B00C68;
  v4[4] = self;
  v4[5] = &v5;
  [(NRRegistry *)self performUnderCollectionLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

uint64_t __36__NRRegistryHistoryStore_collection__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 96) deviceCollection];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (NRDeviceCollectionHistory)history
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  objc_super v8 = __Block_byref_object_copy__4;
  dispatch_semaphore_t v9 = __Block_byref_object_dispose__4;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __33__NRRegistryHistoryStore_history__block_invoke;
  v4[3] = &unk_1E5B00C68;
  v4[4] = self;
  v4[5] = &v5;
  [(NRRegistry *)self performUnderCollectionLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NRDeviceCollectionHistory *)v2;
}

void __33__NRRegistryHistoryStore_history__block_invoke(uint64_t a1)
{
}

void __37__NRRegistryHistoryStore_setHistory___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __37__NRRegistryHistoryStore_setHistory___block_invoke_2;
  v4[3] = &unk_1E5B017F8;
  v4[4] = *(void *)(a1 + 40);
  id v3 = (id)[v2 addObserverQueue:0 withBlock:v4];
  objc_storeStrong((id *)(*(void *)(a1 + 40) + 96), *(id *)(a1 + 32));
}

void __37__NRRegistryHistoryStore_setHistory___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = a1;
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 collection];
  v6 = [*(id *)(v2 + 32) secureProperties];
  uint64_t v7 = *(void **)(v2 + 32);
  id v57 = v5;
  id v8 = v6;
  if (v7)
  {
    dispatch_semaphore_t v9 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v10 = +[NRDataFilePaths pathToNanoRegistryStateDirectory];
    char v11 = [v9 fileExistsAtPath:v10];

    if ((v11 & 1) == 0)
    {
      id v12 = [MEMORY[0x1E4F28CB8] defaultManager];
      v13 = +[NRDataFilePaths pathToNanoRegistryStateDirectory];
      id v61 = 0;
      char v14 = [v12 createDirectoryAtPath:v13 withIntermediateDirectories:1 attributes:0 error:&v61];
      id v15 = v61;

      if ((v14 & 1) == 0)
      {
        v16 = nr_daemon_log();
        BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);

        if (v17)
        {
          v18 = nr_daemon_log();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            v52 = +[NRDataFilePaths pathToNanoRegistryStateDirectory];
            v53 = objc_msgSend(v15, "nr_safeDescription");
            *(_DWORD *)buf = 138543618;
            v77 = v52;
            __int16 v78 = 2114;
            v79 = v53;
            _os_log_error_impl(&dword_1A356E000, v18, OS_LOG_TYPE_ERROR, "Can't create path %{public}@! error=%{public}@", buf, 0x16u);
          }
        }
      }
    }
    id v19 = [v7 history];
    int v20 = [v19 dirty];

    objc_super v21 = [v7 secureProperties];

    if (v21)
    {
      v22 = [v7 secureProperties];
      BOOL v23 = +[NRDataFileHistoryHelpers archiveSecureProperties:v22];
    }
    else
    {
      BOOL v23 = 1;
    }
    v24 = [v7 history];
    int v25 = v23 & +[NRDataFileHistoryHelpers archiveDeviceHistory:v24];

    if ((v25 & v20) == 1)
    {
      id v54 = v8;
      id v55 = v4;
      uint64_t v56 = v2;
      v26 = (void *)MEMORY[0x1E4F1CA80];
      v27 = [v7 secureProperties];
      v28 = [v27 allSecurePropertyIDs];
      v29 = [v26 setWithArray:v28];

      long long v72 = 0u;
      long long v73 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      obuint64_t j = [v7 collection];
      uint64_t v60 = [obj countByEnumeratingWithState:&v70 objects:buf count:16];
      if (v60)
      {
        uint64_t v59 = *(void *)v71;
        do
        {
          for (uint64_t i = 0; i != v60; ++i)
          {
            if (*(void *)v71 != v59) {
              objc_enumerationMutation(obj);
            }
            uint64_t v31 = *(void *)(*((void *)&v70 + 1) + 8 * i);
            v32 = v7;
            v33 = [v7 collection];
            v34 = [v33 objectForKeyedSubscript:v31];

            long long v68 = 0u;
            long long v69 = 0u;
            long long v66 = 0u;
            long long v67 = 0u;
            id v35 = v34;
            uint64_t v36 = [v35 countByEnumeratingWithState:&v66 objects:v75 count:16];
            if (v36)
            {
              uint64_t v37 = v36;
              uint64_t v38 = *(void *)v67;
              do
              {
                for (uint64_t j = 0; j != v37; ++j)
                {
                  if (*(void *)v67 != v38) {
                    objc_enumerationMutation(v35);
                  }
                  v40 = [v35 objectForKeyedSubscript:*(void *)(*((void *)&v66 + 1) + 8 * j)];
                  v41 = [v40 value];
                  objc_opt_class();
                  if (objc_opt_isKindOfClass()) {
                    [v29 removeObject:v41];
                  }
                }
                uint64_t v37 = [v35 countByEnumeratingWithState:&v66 objects:v75 count:16];
              }
              while (v37);
            }

            uint64_t v7 = v32;
          }
          uint64_t v60 = [obj countByEnumeratingWithState:&v70 objects:buf count:16];
        }
        while (v60);
      }

      long long v64 = 0u;
      long long v65 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      id v42 = v29;
      uint64_t v43 = [v42 countByEnumeratingWithState:&v62 objects:v74 count:16];
      id v8 = v54;
      id v4 = v55;
      if (v43)
      {
        uint64_t v44 = v43;
        uint64_t v45 = *(void *)v63;
        do
        {
          for (uint64_t k = 0; k != v44; ++k)
          {
            if (*(void *)v63 != v45) {
              objc_enumerationMutation(v42);
            }
            uint64_t v47 = *(void *)(*((void *)&v62 + 1) + 8 * k);
            v48 = [v7 secureProperties];
            [v48 removeSecureProperty:v47];
          }
          uint64_t v44 = [v42 countByEnumeratingWithState:&v62 objects:v74 count:16];
        }
        while (v44);
      }

      v49 = [v7 secureProperties];
      +[NRDataFileHistoryHelpers archiveSecureProperties:v49];

      uint64_t v2 = v56;
    }
  }

  [*(id *)(v2 + 32) _notifyDiffIndexObserversWithHistoryEntry:v4 deviceCollection:v57 secureProperties:v8];
  v50 = *(void **)(v2 + 32);
  v51 = [v4 diff];

  [v50 _notifyDiffObserversWithDiff:v51 deviceCollection:v57 secureProperties:v8];
}

- (void)grabHistoryWithReadBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__NRRegistryHistoryStore_grabHistoryWithReadBlock___block_invoke;
  v6[3] = &unk_1E5B00058;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(NRRegistry *)self enqueue:v6];
}

void __51__NRRegistryHistoryStore_grabHistoryWithReadBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) history];
  id v3 = [*(id *)(a1 + 32) secureProperties];
  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v4, v3);
}

- (void)grabHistoryWithWriteBlock:(id)a3
{
  id v4 = a3;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = __Block_byref_object_copy__4;
  v9[4] = __Block_byref_object_dispose__4;
  id v10 = (id)os_transaction_create();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__NRRegistryHistoryStore_grabHistoryWithWriteBlock___block_invoke;
  v6[3] = &unk_1E5B00BF0;
  id v5 = v4;
  void v6[4] = self;
  id v7 = v5;
  id v8 = v9;
  [(NRRegistry *)self enqueueAsync:v6];

  _Block_object_dispose(v9, 8);
}

void __52__NRRegistryHistoryStore_grabHistoryWithWriteBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) history];
  id v4 = [*(id *)(a1 + 32) secureProperties];
  (*(void (**)(uint64_t, void *, void *))(v2 + 16))(v2, v3, v4);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    id v5 = [*(id *)(a1 + 32) history];
    id v6 = (id)[v5 applyDiff:v9];
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;
}

- (id)addDiffIndexObserverWithWriteBlock:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  char v14 = __Block_byref_object_copy__4;
  id v15 = __Block_byref_object_dispose__4;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__NRRegistryHistoryStore_addDiffIndexObserverWithWriteBlock___block_invoke;
  v8[3] = &unk_1E5B00C40;
  id v10 = &v11;
  void v8[4] = self;
  id v5 = v4;
  id v9 = v5;
  [(NRRegistry *)self performUnderCollectionLock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v6;
}

void __61__NRRegistryHistoryStore_addDiffIndexObserverWithWriteBlock___block_invoke(void *a1)
{
  uint64_t v2 = [(id)objc_opt_class() _nextToken];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(a1[4] + 80))
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v6 = a1[4];
    uint64_t v7 = *(void **)(v6 + 80);
    *(void *)(v6 + 80) = v5;
  }
  id v8 = (id)MEMORY[0x1A624A7E0](a1[5]);
  [*(id *)(a1[4] + 80) setObject:v8 forKeyedSubscript:*(void *)(*(void *)(a1[6] + 8) + 40)];
}

- (void)removeDiffIndexObserver:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__NRRegistryHistoryStore_removeDiffIndexObserver___block_invoke;
  v6[3] = &unk_1E5B002A8;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(NRRegistry *)self performUnderCollectionLock:v6];
}

uint64_t __50__NRRegistryHistoryStore_removeDiffIndexObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 80) removeObjectForKey:*(void *)(a1 + 40)];
}

- (void)_notifyDiffIndexObserversWithHistoryEntry:(id)a3 deviceCollection:(id)a4 secureProperties:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__4;
  v27 = __Block_byref_object_dispose__4;
  id v28 = 0;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __102__NRRegistryHistoryStore__notifyDiffIndexObserversWithHistoryEntry_deviceCollection_secureProperties___block_invoke;
  v22[3] = &unk_1E5B00C68;
  void v22[4] = self;
  v22[5] = &v23;
  [(NRRegistry *)self performUnderCollectionLock:v22];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v11 = (id)v24[5];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v29 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v11);
        }
        uint64_t v15 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        objc_msgSend((id)v24[5], "objectForKeyedSubscript:", v15, (void)v18);
        id v16 = (void (**)(void, void, void, void, void, void))objc_claimAutoreleasedReturnValue();
        BOOL v17 = [v8 diff];
        ((void (**)(void, void *, id, id, uint64_t, uint64_t))v16)[2](v16, v17, v9, v10, v15, [v8 index] + 1);
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v29 count:16];
    }
    while (v12);
  }

  _Block_object_dispose(&v23, 8);
}

uint64_t __102__NRRegistryHistoryStore__notifyDiffIndexObserversWithHistoryEntry_deviceCollection_secureProperties___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 80) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (void)invalidate
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __36__NRRegistryHistoryStore_invalidate__block_invoke;
  v4[3] = &unk_1E5B00230;
  v4[4] = self;
  [(NRRegistry *)self enqueueBypassAsync:v4];
  v3.receiver = self;
  v3.super_class = (Class)NRRegistryHistoryStore;
  [(NRRegistry *)&v3 invalidate];
}

void __36__NRRegistryHistoryStore_invalidate__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) history];
  [v1 invalidate];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_history, 0);

  objc_storeStrong((id *)&self->_diffIndexObservers, 0);
}

@end