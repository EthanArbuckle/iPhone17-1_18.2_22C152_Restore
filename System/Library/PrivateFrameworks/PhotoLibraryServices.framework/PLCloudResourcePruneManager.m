@interface PLCloudResourcePruneManager
- (PLCloudResourcePruneManager)init;
- (PLCloudResourcePruneManager)initWithCPLManager:(id)a3 libraryServicesManager:(id)a4;
- (__CFDictionary)_handleCacheDeletePurge:(int)a3 info:(__CFDictionary *)a4;
- (__CFDictionary)_handleCacheDeletePurgeable:(int)a3 info:(__CFDictionary *)a4;
- (id)_identifierForResource:(id)a3;
- (id)_predicateForPruneWithUrgency:(int64_t)a3;
- (id)pruneStatusForDebug:(BOOL)a3;
- (int64_t)_fetchResourcesForPruningWithBudget:(int64_t)a3 urgency:(int64_t)a4 batchHandler:(id)a5;
- (int64_t)_localResourcesSize;
- (int64_t)_purgeableAmountWithBudget:(int64_t)a3 debugString:(id)a4;
- (int64_t)_totalPurgeableAmountForUrgency:(int64_t)a3;
- (int64_t)diskSpaceToPrune;
- (int64_t)pruneResources:(id)a3 inPhotoLibrary:(id)a4;
- (void)_handleCacheDeleteRegistration;
- (void)_runOnWorkQueueWithTransaction:(id)a3 block:(id)a4;
- (void)_updateLocalStateForPrunedResources:(id)a3 inPhotoLibrary:(id)a4;
- (void)dealloc;
- (void)handleOptimizeModeChange;
- (void)startAutomaticPruneWithBudget:(int64_t)a3 urgency:(int64_t)a4 completionHandler:(id)a5;
- (void)stop;
- (void)updateCacheDeletePurgeableAmount;
@end

@implementation PLCloudResourcePruneManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_cplManager);
  objc_storeStrong((id *)&self->_lsm, 0);
}

- (int64_t)pruneResources:(id)a3 inPhotoLibrary:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __61__PLCloudResourcePruneManager_pruneResources_inPhotoLibrary___block_invoke;
  v14[3] = &unk_1E5875368;
  id v8 = v6;
  id v15 = v8;
  v16 = self;
  v18 = &v19;
  id v9 = v7;
  id v17 = v9;
  [v9 performTransactionAndWait:v14];
  v10 = PLResourceCachingGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = v20[3];
    *(_DWORD *)buf = 134217984;
    uint64_t v24 = v11;
    _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEFAULT, "Total pruned size: %lld", buf, 0xCu);
  }

  int64_t v12 = v20[3];
  _Block_object_dispose(&v19, 8);

  return v12;
}

void __61__PLCloudResourcePruneManager_pruneResources_inPhotoLibrary___block_invoke(uint64_t a1)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  v1 = (id *)(a1 + 32);
  v2 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v34 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(*v1, "count"));
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v3 = *v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v42 objects:v56 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v43 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        id v8 = [v7 fileURL];
        id v9 = [v8 path];

        if (v9)
        {
          v10 = [v7 cplResourceIncludeFile:1 createDirectoryIfNeeded:0];
          if (v10)
          {
            [v34 addObject:v10];
            [v2 setObject:v7 forKey:v9];
          }
          else
          {
            uint64_t v11 = PLResourceCachingGetLog();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            {
              LODWORD(buf) = 138412290;
              *(void *)((char *)&buf + 4) = v7;
              _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "Failed to create CPLResource for prune from %@", (uint8_t *)&buf, 0xCu);
            }

            v10 = 0;
          }
        }
        else
        {
          v10 = PLResourceCachingGetLog();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            LODWORD(buf) = 138412290;
            *(void *)((char *)&buf + 4) = v7;
            _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "Unable to prune resource with no file path: %@", (uint8_t *)&buf, 0xCu);
          }
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v42 objects:v56 count:16];
    }
    while (v4);
  }

  int64_t v12 = PLResourceCachingGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = [*(id *)(a1 + 32) count];
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v13;
    _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEFAULT, "Pruning %lu resources", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v52 = 0x3032000000;
  v53 = __Block_byref_object_copy__63396;
  v54 = __Block_byref_object_dispose__63397;
  id v55 = 0;
  dispatch_semaphore_t v14 = dispatch_semaphore_create(0);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 16));
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __61__PLCloudResourcePruneManager_pruneResources_inPhotoLibrary___block_invoke_114;
  v39[3] = &unk_1E586CB18;
  p_long long buf = &buf;
  dispatch_semaphore_t dsema = v14;
  dispatch_semaphore_t v40 = dsema;
  [WeakRetained deleteResources:v34 checkServerIfNecessary:1 completionHandler:v39];

  dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
  v33 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v16 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v31 = objc_msgSend(v16, "initWithCapacity:", objc_msgSend(*(id *)(*((void *)&buf + 1) + 40), "count"));
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v17 = *(id *)(*((void *)&buf + 1) + 40);
  uint64_t v18 = [v17 countByEnumeratingWithState:&v35 objects:v50 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v36;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v36 != v19) {
          objc_enumerationMutation(v17);
        }
        uint64_t v21 = *(NSObject **)(*((void *)&v35 + 1) + 8 * j);
        uint64_t v22 = [v21 identity];
        v23 = [v22 fileURL];
        uint64_t v24 = [v23 path];

        if (v24)
        {
          uint64_t v25 = [v2 objectForKey:v24];
          v26 = v25;
          if (v25)
          {
            v27 = [v25 fileURL];
            v28 = [v27 path];

            if (v28 && [v24 isEqualToString:v28])
            {
              if ([v33 fileExistsAtPath:v28])
              {
                v29 = PLResourceCachingGetLog();
                if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)v46 = 138412290;
                  v47 = v26;
                  _os_log_impl(&dword_19B3C7000, v29, OS_LOG_TYPE_ERROR, "Pruned file still exists at for %@", v46, 0xCu);
                }
                goto LABEL_30;
              }
              [v31 addObject:v26];
              *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) += [v26 dataLength];
            }
            else
            {
              v29 = PLResourceCachingGetLog();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)v46 = 138412546;
                v47 = v21;
                __int16 v48 = 2112;
                v49 = v26;
                _os_log_impl(&dword_19B3C7000, v29, OS_LOG_TYPE_ERROR, "Unmatched filepath for pruned resource between CPL (%@) and PL (%@)", v46, 0x16u);
              }
LABEL_30:
            }
          }
          else
          {
            v28 = PLResourceCachingGetLog();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v46 = 138412290;
              v47 = v21;
              _os_log_impl(&dword_19B3C7000, v28, OS_LOG_TYPE_DEFAULT, "Unable to find matching PLResource for deleted CPLResource %@", v46, 0xCu);
            }
          }

          goto LABEL_40;
        }
        v26 = PLResourceCachingGetLog();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v46 = 138412290;
          v47 = v21;
          _os_log_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_ERROR, "Pruned CPL resource %@ has no path", v46, 0xCu);
        }
LABEL_40:
      }
      uint64_t v18 = [v17 countByEnumeratingWithState:&v35 objects:v50 count:16];
    }
    while (v18);
  }

  [*(id *)(a1 + 40) _updateLocalStateForPrunedResources:v31 inPhotoLibrary:*(void *)(a1 + 48)];
  _Block_object_dispose(&buf, 8);
}

void __61__PLCloudResourcePruneManager_pruneResources_inPhotoLibrary___block_invoke_114(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = PLResourceCachingGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 134218240;
    uint64_t v14 = [v5 count];
    __int16 v15 = 2048;
    uint64_t v16 = [v6 count];
    _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "Pruned %lu resources, kept %lu resources", (uint8_t *)&v13, 0x16u);
  }

  id v8 = PLResourceCachingGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 138412290;
    uint64_t v14 = (uint64_t)v5;
    _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEBUG, "Pruned resources: %@", (uint8_t *)&v13, 0xCu);
  }

  id v9 = PLResourceCachingGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 138412290;
    uint64_t v14 = (uint64_t)v6;
    _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEBUG, "Unsafe resources to prune: %@", (uint8_t *)&v13, 0xCu);
  }

  uint64_t v10 = [v5 copy];
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  int64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_identifierForResource:(id)a3
{
  id v3 = NSString;
  id v4 = a3;
  id v5 = [v4 itemScopedIdentifier];
  uint64_t v6 = [v4 resourceType];

  id v7 = [v3 stringWithFormat:@"%@-%lu", v5, v6];

  return v7;
}

- (id)_predicateForPruneWithUrgency:(int64_t)a3
{
  id v4 = +[PLInternalResource nonOriginalCPLResourceTypes];
  id v5 = [(PLLibraryServicesManager *)self->_lsm cplSettings];
  int v6 = [v5 isKeepOriginalsEnabled];

  if (v6)
  {
    id v7 = +[PLInternalResource prunePredicateForCPLResourceTypes:v4];
  }
  else
  {
    id v8 = +[PLInternalResource originalCPLResourceTypes];
    id v9 = [v4 arrayByAddingObjectsFromArray:v8];

    id v7 = +[PLInternalResource prunePredicateForCPLResourceTypes:v9];
  }
  return v7;
}

- (int64_t)diskSpaceToPrune
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = [(PLLibraryServicesManager *)self->_lsm cplSettings];
  int v4 = [v3 isKeepOriginalsEnabled];

  id v5 = [(PLLibraryServicesManager *)self->_lsm pathManager];
  int v6 = [v5 photoDirectoryWithType:1];

  uint64_t v7 = [MEMORY[0x1E4F8B8D8] fileSystemSizeForPath:v6];
  uint64_t v8 = [MEMORY[0x1E4F8B8D8] diskSpaceAvailableForPath:v6];
  double v9 = 0.1;
  double v10 = 0.05;
  if (!v4) {
    double v10 = 0.1;
  }
  uint64_t v11 = (uint64_t)(v10 * (double)v7);
  if (!v4) {
    double v9 = 0.25;
  }
  uint64_t v12 = (uint64_t)(v9 * (double)v7);
  int v13 = PLResourceCachingGetLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = v12 + 0xFFFFF;
    *(_DWORD *)uint64_t v21 = 134218752;
    *(void *)&v21[4] = v7 / 0x100000;
    *(_WORD *)&v21[12] = 2048;
    *(void *)&v21[14] = v8 / 0x100000;
    if (v12 >= 0) {
      uint64_t v14 = v12;
    }
    *(_WORD *)&v21[22] = 2048;
    uint64_t v22 = v11 / 0x100000;
    __int16 v23 = 2048;
    uint64_t v24 = v14 >> 20;
    _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEFAULT, "Total storage: %lld MB Available storage: %lld MB Free space to start/stop pruning: %lld/%lld MB", v21, 0x2Au);
  }

  if (v8 >= v11)
  {
    uint64_t v15 = 0;
  }
  else
  {
    uint64_t v15 = v12 - v8;
    uint64_t v16 = PLResourceCachingGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t v21 = 134217984;
      *(void *)&v21[4] = v15 / 0x100000;
      _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_DEFAULT, "Prune space: %lld MB", v21, 0xCu);
    }
  }
  uint64_t v17 = objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults", *(_OWORD *)v21, *(void *)&v21[16]);
  uint64_t v18 = [v17 integerForKey:@"PLPruneDiskSpaceMB"];

  if (v18 <= 0) {
    uint64_t v19 = v15;
  }
  else {
    uint64_t v19 = v18 << 20;
  }

  return v19 & ~(v19 >> 63);
}

- (int64_t)_localResourcesSize
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  v2 = [(PLLibraryServicesManager *)self->_lsm databaseContext];
  id v3 = (void *)[v2 newShortLivedLibraryWithName:"-[PLCloudResourcePruneManager _localResourcesSize]"];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__PLCloudResourcePruneManager__localResourcesSize__block_invoke;
  v7[3] = &unk_1E5875E68;
  id v4 = v3;
  id v8 = v4;
  double v9 = &v10;
  [v4 performBlockAndWait:v7];
  int64_t v5 = v11[3];

  _Block_object_dispose(&v10, 8);
  return v5;
}

void __50__PLCloudResourcePruneManager__localResourcesSize__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = +[PLInternalResource entityName];
  id v3 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:v2];
  id v4 = +[PLInternalResource predicateForAvailableResources];
  [v3 setPredicate:v4];
  int64_t v5 = [*(id *)(a1 + 32) managedObjectContext];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__PLCloudResourcePruneManager__localResourcesSize__block_invoke_2;
  v8[3] = &unk_1E58716C8;
  v8[4] = *(void *)(a1 + 40);
  uint64_t v9 = 0;
  int v6 = [v5 enumerateObjectsFromFetchRequest:v3 count:&v9 usingDefaultBatchSizeWithBlock:v8];
  if (v6)
  {
    uint64_t v7 = PLResourceCachingGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v11 = v6;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "Failed to fetch resources: %@", buf, 0xCu);
    }
  }
}

uint64_t __50__PLCloudResourcePruneManager__localResourcesSize__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result = [a2 dataLength];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

- (void)_updateLocalStateForPrunedResources:(id)a3 inPhotoLibrary:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v26 = a4;
  int v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  obuint64_t j = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v32 objects:v41 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v33 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        uint64_t v12 = [v11 fileURL];
        uint64_t v13 = [v12 path];

        uint64_t v14 = PLResourceCachingGetLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = 138412546;
          long long v38 = v13;
          __int16 v39 = 2112;
          dispatch_semaphore_t v40 = v11;
          _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_DEBUG, "%@ has been deleted for %@", buf, 0x16u);
        }

        [v11 markAsNotLocallyAvailableAfterPurge];
        uint64_t v15 = [v11 asset];
        uint64_t v16 = [v15 uuid];

        if (v16)
        {
          [v6 addObject:v16];
        }
        else
        {
          uint64_t v17 = PLResourceCachingGetLog();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412290;
            long long v38 = v11;
            _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_ERROR, "No assetUUID for local resource %@", buf, 0xCu);
          }
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v32 objects:v41 count:16];
    }
    while (v8);
  }

  uint64_t v18 = +[PLManagedAsset assetsWithUUIDs:v6 options:0 inLibrary:v26];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v29;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v29 != v21) {
          objc_enumerationMutation(v18);
        }
        __int16 v23 = *(void **)(*((void *)&v28 + 1) + 8 * j);
        int v24 = [v23 cloudPlaceholderKind];
        if ([v23 hasMasterThumb])
        {
          if (v24 == 3) {
            continue;
          }
          uint64_t v25 = 3;
        }
        else
        {
          if (v24 == 2) {
            continue;
          }
          uint64_t v25 = 2;
        }
        [v23 setCloudPlaceholderKind:v25];
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v20);
  }
}

- (void)_runOnWorkQueueWithTransaction:(id)a3 block:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v5 = v7;
  id v6 = v8;
  pl_dispatch_async();
}

uint64_t __68__PLCloudResourcePruneManager__runOnWorkQueueWithTransaction_block___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(void **)(a1 + 32);
  return [v2 stillAlive];
}

- (void)handleOptimizeModeChange
{
  int64_t v3 = [(PLCloudResourcePruneManager *)self diskSpaceToPrune];
  [(PLCloudResourcePruneManager *)self startAutomaticPruneWithBudget:v3 urgency:0 completionHandler:&__block_literal_global_105_63424];
}

- (id)pruneStatusForDebug:(BOOL)a3
{
  int64_t v4 = [(PLCloudResourcePruneManager *)self diskSpaceToPrune];
  id v5 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"Disk space to prune: %llu MB\n", v4 / 0x100000);
  objc_msgSend(v5, "appendFormat:", @"Max purgeable amount: %llu MB\n", -[PLCloudResourcePruneManager _purgeableAmountWithBudget:debugString:](self, "_purgeableAmountWithBudget:debugString:", v4, v5)/ 0x100000);
  return v5;
}

- (int64_t)_fetchResourcesForPruningWithBudget:(int64_t)a3 urgency:(int64_t)a4 batchHandler:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  uint64_t v30 = 0;
  long long v31 = &v30;
  uint64_t v32 = 0x2020000000;
  uint64_t v33 = 0;
  if (self->_stopped)
  {
    uint64_t v9 = PLResourceCachingGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      uint64_t v10 = "Pruning is stopped";
      uint64_t v11 = v9;
      uint32_t v12 = 2;
LABEL_4:
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
    }
  }
  else
  {
    if (a3 <= 0)
    {
      uint64_t v9 = PLResourceCachingGetLog();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_11;
      }
      *(_DWORD *)long long buf = 134217984;
      int64_t v35 = a3;
      uint64_t v10 = "Pruning budget is %lld bytes, skip pruning";
      uint64_t v11 = v9;
      uint32_t v12 = 12;
      goto LABEL_4;
    }
    uint64_t v13 = [(PLCloudResourcePruneManager *)self _predicateForPruneWithUrgency:a4];
    uint64_t v14 = PLResourceCachingGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134218242;
      int64_t v35 = a3;
      __int16 v36 = 2112;
      long long v37 = v13;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_DEFAULT, "Started pruning with budget %lld predicate: %@", buf, 0x16u);
    }

    uint64_t v15 = [(PLLibraryServicesManager *)self->_lsm databaseContext];
    uint64_t v16 = (void *)[v15 newShortLivedLibraryWithName:"-[PLCloudResourcePruneManager _fetchResourcesForPruningWithBudget:urgency:batchHandler:]"];

    dispatch_semaphore_t v17 = dispatch_semaphore_create(0);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __88__PLCloudResourcePruneManager__fetchResourcesForPruningWithBudget_urgency_batchHandler___block_invoke;
    v24[3] = &unk_1E5871650;
    uint64_t v9 = v13;
    uint64_t v25 = v9;
    id v18 = v16;
    id v26 = v18;
    id v27 = v8;
    long long v28 = &v30;
    int64_t v29 = a3;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __88__PLCloudResourcePruneManager__fetchResourcesForPruningWithBudget_urgency_batchHandler___block_invoke_96;
    v22[3] = &unk_1E5875CE0;
    uint64_t v19 = v17;
    __int16 v23 = v19;
    [v18 performBlock:v24 completionHandler:v22 withPriority:1];
    dispatch_semaphore_wait(v19, 0xFFFFFFFFFFFFFFFFLL);
  }
LABEL_11:

  int64_t v20 = v31[3];
  _Block_object_dispose(&v30, 8);

  return v20;
}

void __88__PLCloudResourcePruneManager__fetchResourcesForPruningWithBudget_urgency_batchHandler___block_invoke(uint64_t a1)
{
  v33[3] = *MEMORY[0x1E4F143B8];
  v2 = +[PLInternalResource entityName];
  int64_t v3 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:v2];
  int64_t v4 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"cloudLastOnDemandDownloadDate" ascending:1];
  v33[0] = v4;
  id v5 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"cloudLastPrefetchDate" ascending:1];
  v33[1] = v5;
  id v6 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"cloudMasterDateCreated" ascending:1];
  v33[2] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:3];
  [v3 setSortDescriptors:v7];

  v32[0] = @"asset";
  v32[1] = @"asset.master";
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
  [v3 setRelationshipKeyPathsForPrefetching:v8];

  [v3 setPredicate:*(void *)(a1 + 32)];
  uint64_t v9 = [*(id *)(a1 + 40) managedObjectContext];
  uint64_t v27 = 0;
  uint64_t v10 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:100];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __88__PLCloudResourcePruneManager__fetchResourcesForPruningWithBudget_urgency_batchHandler___block_invoke_2;
  v22[3] = &unk_1E586CAD0;
  id v11 = v10;
  id v23 = v11;
  id v12 = *(id *)(a1 + 48);
  uint64_t v13 = *(void *)(a1 + 56);
  uint64_t v14 = *(void *)(a1 + 64);
  id v24 = v12;
  uint64_t v25 = v13;
  uint64_t v26 = v14;
  uint64_t v15 = [v9 enumerateObjectsFromFetchRequest:v3 count:&v27 usingDefaultBatchSizeWithBlock:v22];
  if ([v11 count])
  {
    if (*(void *)(a1 + 64) > *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      uint64_t v16 = *(void *)(a1 + 48);
      if (v16) {
        *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) += (*(uint64_t (**)(uint64_t, id))(v16 + 16))(v16, v11);
      }
    }
  }
  [v11 removeAllObjects];
  if (v15)
  {
    dispatch_semaphore_t v17 = PLResourceCachingGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138412546;
      uint64_t v29 = v18;
      __int16 v30 = 2112;
      long long v31 = v15;
      _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_ERROR, "Failed to fetch resources with predicate %@: %@", buf, 0x16u);
    }
  }
  uint64_t v19 = PLResourceCachingGetLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v20 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    uint64_t v21 = (void *)(*(void *)(a1 + 64) - v20);
    *(_DWORD *)long long buf = 134218240;
    uint64_t v29 = v20;
    __int16 v30 = 2048;
    long long v31 = v21;
    _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_DEFAULT, "Pruned amount: %lld Remaining budget: %lld", buf, 0x16u);
  }
}

intptr_t __88__PLCloudResourcePruneManager__fetchResourcesForPruningWithBudget_urgency_batchHandler___block_invoke_96(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __88__PLCloudResourcePruneManager__fetchResourcesForPruningWithBudget_urgency_batchHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  [*(id *)(a1 + 32) addObject:a2];
  if ((unint64_t)[*(id *)(a1 + 32) count] >= 0x64)
  {
    uint64_t v6 = *(void *)(a1 + 40);
    if (v6) {
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += (*(uint64_t (**)(uint64_t, void))(v6 + 16))(v6, *(void *)(a1 + 32));
    }
    [*(id *)(a1 + 32) removeAllObjects];
    if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) >= *(void *)(a1 + 56))
    {
      id v7 = PLResourceCachingGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v8 = 0;
        _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "No more budget, stop pruning", v8, 2u);
      }

      *a4 = 1;
    }
  }
}

- (void)stop
{
  int64_t v3 = PLResourceCachingGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEFAULT, "Stopping pruning", v6, 2u);
  }

  self->_stopped = 1;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cplManager);
  id v5 = [WeakRetained cplStatus];

  [v5 setLastPruneDate:0];
}

- (void)startAutomaticPruneWithBudget:(int64_t)a3 urgency:(int64_t)a4 completionHandler:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"Budget: %lld", a3);
  [v9 setObject:v10 forKey:@"PruneStart"];

  id v11 = [MEMORY[0x1E4F8BA48] transaction:"-[PLCloudResourcePruneManager startAutomaticPruneWithBudget:urgency:completionHandler:]"];
  self->_stopped = 0;
  id v12 = PLResourceCachingGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134217984;
    int64_t v28 = a3 / 0x100000;
    _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEFAULT, "Starting automatic prune with budget: %lld MB", buf, 0xCu);
  }

  uint64_t v13 = PLCloudResourcePruneGetLog();
  os_signpost_id_t v14 = os_signpost_id_generate(v13);
  uint64_t v15 = v13;
  uint64_t v16 = v15;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_DWORD *)long long buf = 134217984;
    int64_t v28 = a3 / 0x100000;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "AutoPrune", "Budget: %lld MB", buf, 0xCu);
  }

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __87__PLCloudResourcePruneManager_startAutomaticPruneWithBudget_urgency_completionHandler___block_invoke;
  v20[3] = &unk_1E586CAA8;
  int64_t v24 = a3;
  int64_t v25 = a4;
  v20[4] = self;
  uint64_t v21 = v16;
  os_signpost_id_t v26 = v14;
  id v22 = v9;
  id v23 = v8;
  id v17 = v9;
  uint64_t v18 = v16;
  id v19 = v8;
  [(PLCloudResourcePruneManager *)self _runOnWorkQueueWithTransaction:v11 block:v20];
}

void __87__PLCloudResourcePruneManager_startAutomaticPruneWithBudget_urgency_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) databaseContext];
  int64_t v3 = (void *)[v2 newShortLivedLibraryWithName:"-[PLCloudResourcePruneManager startAutomaticPruneWithBudget:urgency:completionHandler:]_block_invoke"];

  int64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 64);
  uint64_t v6 = *(void *)(a1 + 72);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __87__PLCloudResourcePruneManager_startAutomaticPruneWithBudget_urgency_completionHandler___block_invoke_2;
  v23[3] = &unk_1E586CA80;
  v23[4] = v4;
  id v7 = v3;
  id v24 = v7;
  uint64_t v8 = [v4 _fetchResourcesForPruningWithBudget:v5 urgency:v6 batchHandler:v23];
  uint64_t v9 = PLResourceCachingGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134217984;
    uint64_t v26 = v8 / 0x100000;
    _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEFAULT, "Finished automatic prune with amount: %lld MB", buf, 0xCu);
  }

  uint64_t v10 = *(void *)(a1 + 56);
  if (v10)
  {
    (*(void (**)(uint64_t, uint64_t, void))(v10 + 16))(v10, v8, 0);
    if (v8 >= 1) {
      [*(id *)(a1 + 32) updateCacheDeletePurgeableAmount];
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  id v12 = [WeakRetained cplStatus];

  uint64_t v13 = [MEMORY[0x1E4F1C9C8] date];
  [v12 setLastPruneDate:v13];

  [v12 setLastCompletePrefetchDate:0];
  os_signpost_id_t v14 = PLResourceCachingGetLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_DEFAULT, "Deleting cpl_download_finished_marker", buf, 2u);
  }

  uint64_t v15 = [*(id *)(*(void *)(a1 + 32) + 8) libraryBundle];
  uint64_t v16 = [v15 indicatorFileCoordinator];

  [v16 deleteCPLDownloadFinishedMarkerFilePath];
  id v17 = *(id *)(a1 + 40);
  uint64_t v18 = v17;
  os_signpost_id_t v19 = *(void *)(a1 + 80);
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_DWORD *)long long buf = 134217984;
    uint64_t v26 = v8 / 0x100000;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v18, OS_SIGNPOST_INTERVAL_END, v19, "AutoPrune", "Amount pruned: %lld MB", buf, 0xCu);
  }

  uint64_t v20 = *(void **)(a1 + 48);
  uint64_t v21 = objc_msgSend(NSString, "stringWithFormat:", @"PrunedAmount: %lld", v8);
  [v20 setObject:v21 forKey:@"PruneEnd"];

  id v22 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  [v22 reportMiscInformation:*(void *)(a1 + 48)];
}

uint64_t __87__PLCloudResourcePruneManager_startAutomaticPruneWithBudget_urgency_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) pruneResources:a2 inPhotoLibrary:*(void *)(a1 + 40)];
}

- (void)updateCacheDeletePurgeableAmount
{
  v13[4] = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(PLLibraryServicesManager *)self->_lsm pathManager];
  int64_t v4 = [v3 capabilities];
  char v5 = [v4 isCentralizedCacheDeleteCapable];

  if ((v5 & 1) == 0)
  {
    int64_t v6 = [(PLCloudResourcePruneManager *)self _totalPurgeableAmountForUrgency:1];
    v12[0] = @"CACHE_DELETE_ID";
    v12[1] = @"CACHE_DELETE_VOLUME";
    v13[0] = @"com.apple.assetsd.cacheDelete";
    v13[1] = @"/private/var";
    v13[2] = &unk_1EEBEF120;
    v12[2] = @"CACHE_DELETE_URGENCY";
    v12[3] = @"CACHE_DELETE_AMOUNT";
    id v7 = [NSNumber numberWithLongLong:v6];
    v13[3] = v7;
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:4];

    uint64_t v9 = PLResourceCachingGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v8;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEFAULT, "Updating CacheDelete purgeable info: %@", (uint8_t *)&v10, 0xCu);
    }

    CacheDeleteUpdatePurgeable();
  }
}

- (void)_handleCacheDeleteRegistration
{
  int64_t v3 = [(PLLibraryServicesManager *)self->_lsm pathManager];
  int64_t v4 = [v3 capabilities];
  char v5 = [v4 isCentralizedCacheDeleteCapable];

  if ((v5 & 1) == 0)
  {
    objc_initWeak(&location, self);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __61__PLCloudResourcePruneManager__handleCacheDeleteRegistration__block_invoke;
    v13[3] = &unk_1E586CA58;
    objc_copyWeak(&v14, &location);
    int64_t v6 = (void *)MEMORY[0x19F38D650](v13);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __61__PLCloudResourcePruneManager__handleCacheDeleteRegistration__block_invoke_45;
    v11[3] = &unk_1E586CA58;
    objc_copyWeak(&v12, &location);
    id v7 = (void *)MEMORY[0x19F38D650](v11);
    uint64_t v8 = (void *)MEMORY[0x19F38D650](v6);
    if (CacheDeleteRegisterInfoCallbacks())
    {
      uint64_t v9 = PLResourceCachingGetLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v10 = 0;
        _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEFAULT, "Failed to register with CacheDelete service. ", v10, 2u);
      }
    }
    objc_destroyWeak(&v12);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

uint64_t __61__PLCloudResourcePruneManager__handleCacheDeleteRegistration__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int64_t v6 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v7 = [WeakRetained _handleCacheDeletePurge:a2 info:a3];
  }
  else
  {
    v10[0] = @"CACHE_DELETE_VOLUME";
    uint64_t v8 = objc_msgSend(a3, "objectForKey:");
    v10[1] = @"CACHE_DELETE_AMOUNT";
    v11[0] = v8;
    v11[1] = &unk_1EEBEF108;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  }
  return v7;
}

uint64_t __61__PLCloudResourcePruneManager__handleCacheDeleteRegistration__block_invoke_45(uint64_t a1, uint64_t a2, void *a3)
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int64_t v6 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v7 = [WeakRetained _handleCacheDeletePurgeable:a2 info:a3];
  }
  else
  {
    v10[0] = @"CACHE_DELETE_VOLUME";
    uint64_t v8 = objc_msgSend(a3, "objectForKey:");
    v10[1] = @"CACHE_DELETE_AMOUNT";
    v11[0] = v8;
    v11[1] = &unk_1EEBEF108;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  }
  return v7;
}

- (__CFDictionary)_handleCacheDeletePurgeable:(int)a3 info:(__CFDictionary *)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = PLResourceCachingGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "Calculating purgeable space for CacheDelete...", buf, 2u);
  }

  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v9 = v8;
  int64_t v10 = [(PLCloudResourcePruneManager *)self _totalPurgeableAmountForUrgency:a3 != 1];
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v12 = v11;
  uint64_t v13 = PLResourceCachingGetLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134218240;
    uint64_t v21 = v10 / 0x100000;
    __int16 v22 = 2048;
    double v23 = v12 - v9;
    _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEFAULT, "Max purgeable amount: %llu MB, took %f s", buf, 0x16u);
  }

  id v14 = [(__CFDictionary *)a4 objectForKey:@"CACHE_DELETE_VOLUME"];
  v18[1] = @"CACHE_DELETE_AMOUNT";
  v19[0] = v14;
  uint64_t v15 = [NSNumber numberWithLongLong:v10];
  v19[1] = v15;
  uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];

  return v16;
}

- (__CFDictionary)_handleCacheDeletePurge:(int)a3 info:(__CFDictionary *)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [(__CFDictionary *)a4 objectForKey:@"CACHE_DELETE_AMOUNT"];
  uint64_t v8 = [v7 longLongValue];

  int64_t v9 = [(PLCloudResourcePruneManager *)self diskSpaceToPrune];
  uint64_t v10 = v9;
  if (v8 <= v9) {
    int64_t v11 = v9;
  }
  else {
    int64_t v11 = v8;
  }
  double v12 = PLResourceCachingGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = v8 + 0xFFFFF;
    *(_DWORD *)long long buf = 134219008;
    if (v8 >= 0) {
      uint64_t v13 = v8;
    }
    *(void *)&uint8_t buf[4] = v13 >> 20;
    uint64_t v14 = v10 + 0xFFFFF;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v8;
    if (v10 >= 0) {
      uint64_t v14 = v10;
    }
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)long long v37 = a3;
    *(_WORD *)&v37[4] = 2048;
    *(void *)&v37[6] = v14 >> 20;
    __int16 v38 = 2048;
    uint64_t v39 = v10;
    _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEFAULT, "CacheDelete requested purging %lld MB (%lld) with urgency %d, pruneable %lld MB (%lld)", buf, 0x30u);
  }

  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  *(void *)long long v37 = 0;
  dispatch_semaphore_t v15 = dispatch_semaphore_create(0);
  BOOL v16 = a3 > 1;
  uint64_t v26 = MEMORY[0x1E4F143A8];
  uint64_t v27 = 3221225472;
  int64_t v28 = __60__PLCloudResourcePruneManager__handleCacheDeletePurge_info___block_invoke;
  uint64_t v29 = &unk_1E586CA30;
  long long v31 = buf;
  id v17 = v15;
  __int16 v30 = v17;
  [(PLCloudResourcePruneManager *)self startAutomaticPruneWithBudget:v11 urgency:v16 completionHandler:&v26];
  dispatch_semaphore_wait(v17, 0xFFFFFFFFFFFFFFFFLL);
  if ((*(void *)(*(void *)&buf[8] + 24) & 0x8000000000000000) != 0)
  {
    uint64_t v20 = PLResourceCachingGetLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = *(void *)(*(void *)&buf[8] + 24);
      *(_DWORD *)long long v34 = 134217984;
      uint64_t v35 = v21;
      _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_ERROR, "amountPurged is negative (%lld), setting to 0", v34, 0xCu);
    }

    *(void *)(*(void *)&buf[8] + 24) = 0;
  }
  else
  {
    uint64_t v18 = PLResourceCachingGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = *(void *)(*(void *)&buf[8] + 24);
      *(_DWORD *)long long v34 = 134217984;
      uint64_t v35 = v19 / 0x100000;
      _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_DEFAULT, "Purged %lld MB", v34, 0xCu);
    }
  }
  v32[0] = @"CACHE_DELETE_VOLUME";
  __int16 v22 = -[__CFDictionary objectForKey:](a4, "objectForKey:", v26, v27, v28, v29);
  v32[1] = @"CACHE_DELETE_AMOUNT";
  v33[0] = v22;
  double v23 = [NSNumber numberWithLongLong:*(void *)(*(void *)&buf[8] + 24)];
  v33[1] = v23;
  uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:2];

  _Block_object_dispose(buf, 8);
  return v24;
}

intptr_t __60__PLCloudResourcePruneManager__handleCacheDeletePurge_info___block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (int64_t)_purgeableAmountWithBudget:(int64_t)a3 debugString:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __70__PLCloudResourcePruneManager__purgeableAmountWithBudget_debugString___block_invoke;
  v10[3] = &unk_1E586CA08;
  id v11 = v6;
  id v7 = v6;
  int64_t v8 = [(PLCloudResourcePruneManager *)self _fetchResourcesForPruningWithBudget:a3 urgency:1 batchHandler:v10];

  return v8;
}

uint64_t __70__PLCloudResourcePruneManager__purgeableAmountWithBudget_debugString___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v3);
        }
        int64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v10 = [v9 fileURL];

        if (v10)
        {
          if (*(void *)(a1 + 32))
          {
            id v11 = [v9 cplResourceIncludeFile:1 createDirectoryIfNeeded:0];
            [*(id *)(a1 + 32) appendFormat:@"%@\n", v11];
          }
          v6 += [v9 dataLength];
        }
        else
        {
          double v12 = PLResourceCachingGetLog();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412290;
            uint64_t v19 = v9;
            _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_ERROR, "Unable to prune resource with no file path: %@", buf, 0xCu);
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v5);
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (int64_t)_totalPurgeableAmountForUrgency:(int64_t)a3
{
  uint64_t v13 = 0;
  long long v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  uint64_t v4 = [(PLLibraryServicesManager *)self->_lsm databaseContext];
  uint64_t v5 = (void *)[v4 newShortLivedLibraryWithName:"-[PLCloudResourcePruneManager _totalPurgeableAmountForUrgency:]"];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __63__PLCloudResourcePruneManager__totalPurgeableAmountForUrgency___block_invoke;
  v9[3] = &unk_1E5873ED8;
  id v11 = &v13;
  id v6 = v5;
  id v10 = v6;
  int64_t v12 = a3;
  [v6 performBlockAndWait:v9];
  int64_t v7 = v14[3];

  _Block_object_dispose(&v13, 8);
  return v7;
}

int64_t __63__PLCloudResourcePruneManager__totalPurgeableAmountForUrgency___block_invoke(void *a1)
{
  int64_t result = +[PLManagedAsset totalPurgeableSizeOnDiskInLibrary:a1[4] urgency:a1[6]];
  *(void *)(*(void *)(a1[5] + 8) + 24) = result;
  return result;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)PLCloudResourcePruneManager;
  [(PLCloudResourcePruneManager *)&v4 dealloc];
}

- (PLCloudResourcePruneManager)initWithCPLManager:(id)a3 libraryServicesManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PLCloudResourcePruneManager;
  int64_t v8 = [(PLCloudResourcePruneManager *)&v14 init];
  int64_t v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_lsm, a4);
    objc_storeWeak((id *)&v9->_cplManager, v6);
    v9->_stopped = 0;
    id v10 = PLCloudCopyDefaultSerialQueueAttributes();
    dispatch_queue_t v11 = dispatch_queue_create("PLCloudResourcePruneManager work queue", v10);
    workQueue = v9->_workQueue;
    v9->_workQueue = (OS_dispatch_queue *)v11;

    [(PLCloudResourcePruneManager *)v9 _handleCacheDeleteRegistration];
  }

  return v9;
}

- (PLCloudResourcePruneManager)init
{
  [(PLCloudResourcePruneManager *)self doesNotRecognizeSelector:a2];
  return [(PLCloudResourcePruneManager *)self initWithCPLManager:0 libraryServicesManager:0];
}

@end