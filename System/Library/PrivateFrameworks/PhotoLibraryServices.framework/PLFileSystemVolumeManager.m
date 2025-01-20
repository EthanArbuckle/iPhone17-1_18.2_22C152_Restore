@interface PLFileSystemVolumeManager
+ (id)sharedFileSystemVolumeManager;
- (id)initSharedVolumeManager;
- (id)volumeForURL:(id)a3 context:(id)a4;
- (void)_updateMountedVolumeURLs;
- (void)_updateOfflineStates;
- (void)dealloc;
- (void)registerPLFileSystemVolume:(id)a3;
- (void)unregisterPLFileSystemVolume:(id)a3;
@end

@implementation PLFileSystemVolumeManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mocsByVolume, 0);
  objc_storeStrong((id *)&self->_registeredFileSystemVolumesByUuid, 0);
  objc_storeStrong((id *)&self->_mountedVolumeURLsByUuid, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_storeStrong((id *)&self->_synchronizationQueue, 0);
}

- (void)_updateMountedVolumeURLs
{
  v22[1] = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_synchronizationQueue);
  uint64_t v3 = *MEMORY[0x1E4F1C968];
  v22[0] = *MEMORY[0x1E4F1C968];
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
  v5 = [(NSFileManager *)self->_fileManager mountedVolumeURLsIncludingResourceValuesForKeys:v4 options:0];
  v6 = self;
  [(NSMutableDictionary *)self->_mountedVolumeURLsByUuid removeAllObjects];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v17 + 1) + 8 * v10);
        id v16 = 0;
        v12 = [v11 resourceValuesForKeys:v4 error:&v16];
        id v13 = v16;
        v14 = [v12 objectForKeyedSubscript:v3];
        if (v14) {
          [(NSMutableDictionary *)v6->_mountedVolumeURLsByUuid setObject:v11 forKeyedSubscript:v14];
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }
}

- (void)_updateOfflineStates
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_synchronizationQueue);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = self->_registeredFileSystemVolumesByUuid;
  uint64_t v22 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v31 objects:v40 count:16];
  if (v22)
  {
    uint64_t v21 = *(void *)v32;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v32 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v24 = v3;
        uint64_t v4 = *(void *)(*((void *)&v31 + 1) + 8 * v3);
        v5 = [(NSMutableDictionary *)self->_mountedVolumeURLsByUuid objectForKeyedSubscript:v4];
        v6 = PLBackendGetLog();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v37 = v4;
          __int16 v38 = 2112;
          v39 = v5;
          _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEFAULT, "volumeURL for uuid %@ is %@", buf, 0x16u);
        }

        uint64_t v7 = [(NSMutableDictionary *)self->_registeredFileSystemVolumesByUuid objectForKey:v4];
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        v23 = v7;
        uint64_t v8 = [v7 allObjects];
        uint64_t v9 = [v8 countByEnumeratingWithState:&v27 objects:v35 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v28;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v28 != v11) {
                objc_enumerationMutation(v8);
              }
              id v13 = *(void **)(*((void *)&v27 + 1) + 8 * i);
              mocsByVolume = self->_mocsByVolume;
              v15 = [MEMORY[0x1E4F29238] valueWithPointer:v13];
              id v16 = [(NSMapTable *)mocsByVolume objectForKey:v15];

              if (v16)
              {
                long long v17 = [v13 managedObjectContext];

                if (v16 != v17)
                {
                  long long v18 = [MEMORY[0x1E4F28B00] currentHandler];
                  [v18 handleFailureInMethod:a2 object:self file:@"PLFileSystemVolumeManager.m" lineNumber:206 description:@"volume's MOC should match the one I stored"];
                }
                v25[0] = MEMORY[0x1E4F143A8];
                v25[1] = 3221225472;
                v25[2] = __49__PLFileSystemVolumeManager__updateOfflineStates__block_invoke;
                v25[3] = &unk_1E5875E18;
                v25[4] = v13;
                id v26 = v5;
                [v16 performBlock:v25];
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v27 objects:v35 count:16];
          }
          while (v10);
        }

        uint64_t v3 = v24 + 1;
      }
      while (v24 + 1 != v22);
      uint64_t v22 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v31 objects:v40 count:16];
    }
    while (v22);
  }
}

void __49__PLFileSystemVolumeManager__updateOfflineStates__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) url];
  uint64_t v3 = v2;
  if (v2 != *(void **)(a1 + 40)
    && (!objc_msgSend(v2, "isEqual:") || (objc_msgSend(*(id *)(a1 + 40), "isEqual:", v3) & 1) == 0))
  {
    uint64_t v4 = PLBackendGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(void **)(a1 + 32);
      v6 = [v5 url];
      uint64_t v7 = *(void *)(a1 + 40);
      int v8 = 134218498;
      uint64_t v9 = v5;
      __int16 v10 = 2112;
      uint64_t v11 = v6;
      __int16 v12 = 2112;
      uint64_t v13 = v7;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "Updating PLFileSystemVolume %p URL from %@ to %@", (uint8_t *)&v8, 0x20u);
    }
    [*(id *)(a1 + 32) setUrl:*(void *)(a1 + 40)];
  }
}

- (void)unregisterPLFileSystemVolume:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 volumeUuidString];
  v6 = PLBackendGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    __int16 v12 = v5;
    _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEFAULT, "Unregistering volume with uuid %@", buf, 0xCu);
  }

  if (v5)
  {
    synchronizationQueue = self->_synchronizationQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__PLFileSystemVolumeManager_unregisterPLFileSystemVolume___block_invoke;
    block[3] = &unk_1E5873A50;
    block[4] = self;
    id v9 = v5;
    id v10 = v4;
    dispatch_sync(synchronizationQueue, block);
  }
}

void __58__PLFileSystemVolumeManager_unregisterPLFileSystemVolume___block_invoke(void *a1)
{
  id v4 = [*(id *)(a1[4] + 32) objectForKeyedSubscript:a1[5]];
  if (v4) {
    [v4 removeObject:a1[6]];
  }
  v2 = *(void **)(a1[4] + 40);
  uint64_t v3 = [MEMORY[0x1E4F29238] valueWithPointer:a1[6]];
  [v2 removeObjectForKey:v3];
}

- (void)registerPLFileSystemVolume:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 volumeUuidString];
  v6 = v5;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__8125;
  uint64_t v24 = __Block_byref_object_dispose__8126;
  id v25 = 0;
  if (v5)
  {
    synchronizationQueue = self->_synchronizationQueue;
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    uint64_t v14 = __56__PLFileSystemVolumeManager_registerPLFileSystemVolume___block_invoke;
    v15 = &unk_1E5875368;
    id v16 = self;
    id v17 = v5;
    id v8 = v4;
    id v18 = v8;
    long long v19 = &v20;
    dispatch_sync(synchronizationQueue, &v12);
    id v9 = PLBackendGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = v21[5];
      *(_DWORD *)buf = 134218242;
      id v27 = v8;
      __int16 v28 = 2112;
      uint64_t v29 = v10;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEFAULT, "Setting PLFileSystemVolume %p URL to %@", buf, 0x16u);
    }

    objc_msgSend(v8, "setUrl:", v21[5], v12, v13, v14, v15, v16);
  }
  else
  {
    uint64_t v11 = PLBackendGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v27 = v4;
      __int16 v28 = 2114;
      uint64_t v29 = 0;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "Unable to register volume %{public}@ with uuid %{public}@", buf, 0x16u);
    }
  }
  _Block_object_dispose(&v20, 8);
}

void __56__PLFileSystemVolumeManager_registerPLFileSystemVolume___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
  if (!v2)
  {
    id v9 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    [*(id *)(*(void *)(a1 + 32) + 32) setObject:v9 forKeyedSubscript:*(void *)(a1 + 40)];
    v2 = v9;
  }
  id v10 = v2;
  [v2 addObject:*(void *)(a1 + 48)];
  uint64_t v3 = [*(id *)(a1 + 48) managedObjectContext];
  id v4 = *(void **)(*(void *)(a1 + 32) + 40);
  v5 = [MEMORY[0x1E4F29238] valueWithPointer:*(void *)(a1 + 48)];
  [v4 setObject:v3 forKey:v5];

  [*(id *)(a1 + 32) _updateOfflineStates];
  uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

- (id)volumeForURL:(id)a3 context:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v36 = 0;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__8125;
  v40 = __Block_byref_object_dispose__8126;
  id v41 = 0;
  id v35 = 0;
  uint64_t v8 = *MEMORY[0x1E4F1C968];
  id v34 = 0;
  int v9 = [v6 getResourceValue:&v35 forKey:v8 error:&v34];
  id v10 = v35;
  id v11 = v34;
  if (v9)
  {
    synchronizationQueue = self->_synchronizationQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50__PLFileSystemVolumeManager_volumeForURL_context___block_invoke;
    block[3] = &unk_1E5875368;
    block[4] = self;
    id v13 = v10;
    id v31 = v13;
    id v14 = v7;
    id v32 = v14;
    long long v33 = &v36;
    dispatch_sync(synchronizationQueue, block);
    if (!v37[5])
    {
      v15 = +[PLFileSystemVolume fetchRequest];
      id v16 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"volumeUuidString", v13];
      [v15 setPredicate:v16];

      [v15 setIncludesPendingChanges:1];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __50__PLFileSystemVolumeManager_volumeForURL_context___block_invoke_2;
      v23[3] = &unk_1E58695D8;
      id v24 = v14;
      id v17 = v15;
      id v25 = v17;
      uint64_t v29 = &v36;
      id v26 = v6;
      id v27 = v13;
      __int16 v28 = self;
      [v24 performBlockAndWait:v23];
    }
  }
  else
  {
    id v18 = PLBackendGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v43 = v6;
      __int16 v44 = 2112;
      id v45 = v11;
      _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_ERROR, "Error getting volume UUID string for URL %@: %@", buf, 0x16u);
    }
  }
  long long v19 = (void *)v37[5];
  if (!v19)
  {
    uint64_t v20 = PLBackendGetLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v43 = v6;
      _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_DEFAULT, "Unable to find or create a PLFileSystemVolume for URL %@", buf, 0xCu);
    }

    long long v19 = (void *)v37[5];
  }
  id v21 = v19;

  _Block_object_dispose(&v36, 8);
  return v21;
}

void __50__PLFileSystemVolumeManager_volumeForURL_context___block_invoke(void *a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1[4] + 32) objectForKeyedSubscript:a1[5]];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v3 = objc_msgSend(v2, "allObjects", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        int v9 = [v8 managedObjectContext];
        id v10 = (void *)a1[6];

        if (v9 == v10)
        {
          objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), v8);
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

void __50__PLFileSystemVolumeManager_volumeForURL_context___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v18 = 0;
  uint64_t v4 = [v2 executeFetchRequest:v3 error:&v18];
  id v5 = v18;
  uint64_t v6 = [v4 firstObject];
  uint64_t v7 = *(void *)(*(void *)(a1 + 72) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  if (!*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
  {
    int v9 = *(void **)(a1 + 48);
    id v17 = 0;
    uint64_t v10 = *MEMORY[0x1E4F1C898];
    id v16 = 0;
    [v9 getResourceValue:&v17 forKey:v10 error:&v16];
    id v11 = v17;
    id v12 = v16;
    uint64_t v13 = +[PLManagedObject insertInManagedObjectContext:*(void *)(a1 + 32)];
    uint64_t v14 = *(void *)(*(void *)(a1 + 72) + 8);
    v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;

    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setVolumeUuidString:*(void *)(a1 + 56)];
    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setName:v11];
    if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)) {
      objc_msgSend(*(id *)(a1 + 64), "registerPLFileSystemVolume:");
    }
  }
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PLFileSystemVolumeManager;
  [(PLFileSystemVolumeManager *)&v2 dealloc];
}

- (id)initSharedVolumeManager
{
  v18.receiver = self;
  v18.super_class = (Class)PLFileSystemVolumeManager;
  objc_super v2 = [(PLFileSystemVolumeManager *)&v18 init];
  if (v2)
  {
    uint64_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("PLFileSystemVolumeManager", v3);
    synchronizationQueue = v2->_synchronizationQueue;
    v2->_synchronizationQueue = (OS_dispatch_queue *)v4;

    uint64_t v6 = (NSFileManager *)objc_alloc_init(MEMORY[0x1E4F28CB8]);
    fileManager = v2->_fileManager;
    v2->_fileManager = v6;

    uint64_t v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    mountedVolumeURLsByUuid = v2->_mountedVolumeURLsByUuid;
    v2->_mountedVolumeURLsByUuid = v8;

    uint64_t v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    registeredFileSystemVolumesByUuid = v2->_registeredFileSystemVolumesByUuid;
    v2->_registeredFileSystemVolumesByUuid = v10;

    uint64_t v12 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    mocsByVolume = v2->_mocsByVolume;
    v2->_mocsByVolume = (NSMapTable *)v12;

    uint64_t v14 = v2->_synchronizationQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__PLFileSystemVolumeManager_initSharedVolumeManager__block_invoke;
    block[3] = &unk_1E5875CE0;
    id v17 = v2;
    dispatch_sync(v14, block);
  }
  return v2;
}

uint64_t __52__PLFileSystemVolumeManager_initSharedVolumeManager__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateMountedVolumeURLs];
}

+ (id)sharedFileSystemVolumeManager
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__PLFileSystemVolumeManager_sharedFileSystemVolumeManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (sharedFileSystemVolumeManager_onceToken != -1) {
    dispatch_once(&sharedFileSystemVolumeManager_onceToken, block);
  }
  objc_super v2 = (void *)sFileSystemVolumeManager;
  return v2;
}

void __58__PLFileSystemVolumeManager_sharedFileSystemVolumeManager__block_invoke(uint64_t a1)
{
  uint64_t v1 = [objc_alloc(*(Class *)(a1 + 32)) initSharedVolumeManager];
  objc_super v2 = (void *)sFileSystemVolumeManager;
  sFileSystemVolumeManager = v1;
}

@end