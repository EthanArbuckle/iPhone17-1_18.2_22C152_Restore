@interface PLPTPdAssetEnumerator
+ (id)enumeratorForAssetManager:(id)a3 assetObjectIDs:(id)a4 managedObjectContext:(id)a5 conversionSupport:(id)a6;
- (BOOL)enumerateAssetsWithCount:(unint64_t)a3 fetchOffset:(unint64_t)a4 usingBlock:(id)a5;
- (PLPTPdAssetEnumerator)initWithAssetManager:(id)a3 assetObjectIDs:(id)a4 managedObjectContext:(id)a5 conversionSupport:(id)a6;
- (id)_enumerateAssetsWithCount:(unint64_t)a3 fetchOffset:(unint64_t)a4;
- (id)assetsFromOffset:(unint64_t)a3 count:(unint64_t)a4;
- (void)enumerateAssetsUsingBlock:(id)a3;
@end

@implementation PLPTPdAssetEnumerator

+ (id)enumeratorForAssetManager:(id)a3 assetObjectIDs:(id)a4 managedObjectContext:(id)a5 conversionSupport:(id)a6
{
  v6 = 0;
  if (a4 && a5)
  {
    id v11 = a6;
    id v12 = a5;
    id v13 = a4;
    id v14 = a3;
    v6 = (void *)[objc_alloc((Class)a1) initWithAssetManager:v14 assetObjectIDs:v13 managedObjectContext:v12 conversionSupport:v11];
  }
  return v6;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_assetManager);
  objc_storeStrong((id *)&self->_conversionSupport, 0);
  objc_storeStrong((id *)&self->_assetObjectIDs, 0);
  objc_storeStrong((id *)&self->_managedObjectContext, 0);
}

- (id)assetsFromOffset:(unint64_t)a3 count:(unint64_t)a4
{
  pl_dispatch_once();
  id v7 = (id)assetsFromOffset_count__pl_once_object_22;
  pl_dispatch_once();
  id v8 = (id)assetsFromOffset_count__pl_once_object_23;
  v23.length = [(NSArray *)self->_assetObjectIDs count];
  v22.location = a3;
  v22.length = a4;
  v23.location = 0;
  NSRange v9 = NSIntersectionRange(v22, v23);
  v10 = -[NSArray subarrayWithRange:](self->_assetObjectIDs, "subarrayWithRange:", v9.location, v9.length);
  id v11 = (void *)MEMORY[0x1E4F1C0D0];
  id v12 = +[PLManagedAsset entityName];
  id v13 = [v11 fetchRequestWithEntityName:v12];

  id v14 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self IN %@", v10];
  [v13 setPredicate:v14];
  [v13 setPropertiesToFetch:v8];
  [v13 setRelationshipKeyPathsForPrefetching:v7];
  managedObjectContext = self->_managedObjectContext;
  id v20 = 0;
  v16 = [(PLManagedObjectContext *)managedObjectContext executeFetchRequest:v13 error:&v20];
  id v17 = v20;
  v18 = v17;
  if (!v16) {
    NSLog(&cfstr_FailedToFetchA_22.isa, v17);
  }

  return v16;
}

void __48__PLPTPdAssetEnumerator_assetsFromOffset_count___block_invoke_2()
{
  v3[11] = *MEMORY[0x1E4F143B8];
  v3[0] = @"modificationDate";
  v3[1] = @"duration";
  v3[2] = @"locationData";
  v3[3] = @"mediaGroupUUID";
  v3[4] = @"avalancheUUID";
  v3[5] = @"avalanchePickType";
  v3[6] = @"kindSubtype";
  v3[7] = @"kind";
  v3[8] = @"uuid";
  v3[9] = @"hdrType";
  v3[10] = @"deferredProcessingNeeded";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:11];
  uint64_t v1 = [v0 copy];
  v2 = (void *)assetsFromOffset_count__pl_once_object_23;
  assetsFromOffset_count__pl_once_object_23 = v1;
}

void __48__PLPTPdAssetEnumerator_assetsFromOffset_count___block_invoke()
{
  v3[3] = *MEMORY[0x1E4F143B8];
  v3[0] = @"modernResources";
  v3[1] = @"additionalAttributes";
  v3[2] = @"extendedAttributes";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:3];
  uint64_t v1 = [v0 copy];
  v2 = (void *)assetsFromOffset_count__pl_once_object_22;
  assetsFromOffset_count__pl_once_object_22 = v1;
}

- (BOOL)enumerateAssetsWithCount:(unint64_t)a3 fetchOffset:(unint64_t)a4 usingBlock:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = (void (**)(id, void, char *))a5;
  uint64_t v22 = 0;
  NSRange v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__35133;
  v26 = __Block_byref_object_dispose__35134;
  id v27 = 0;
  managedObjectContext = self->_managedObjectContext;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __73__PLPTPdAssetEnumerator_enumerateAssetsWithCount_fetchOffset_usingBlock___block_invoke;
  v21[3] = &unk_1E5873C08;
  v21[4] = self;
  v21[5] = &v22;
  v21[6] = a3;
  v21[7] = a4;
  [(PLManagedObjectContext *)managedObjectContext performBlockAndWait:v21];
  char v20 = 0;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v10 = (id)v23[5];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v28 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v17;
LABEL_3:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v17 != v12) {
        objc_enumerationMutation(v10);
      }
      v8[2](v8, *(void *)(*((void *)&v16 + 1) + 8 * v13), &v20);
      if (v20) {
        break;
      }
      if (v11 == ++v13)
      {
        uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v28 count:16];
        if (v11) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  BOOL v14 = v20 != 0;
  _Block_object_dispose(&v22, 8);

  return v14;
}

void __73__PLPTPdAssetEnumerator_enumerateAssetsWithCount_fetchOffset_usingBlock___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x19F38D3B0]();
  uint64_t v3 = [*(id *)(a1 + 32) _enumerateAssetsWithCount:*(void *)(a1 + 48) fetchOffset:*(void *)(a1 + 56)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)_enumerateAssetsWithCount:(unint64_t)a3 fetchOffset:(unint64_t)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v7 = [MEMORY[0x1E4F1CA48] array];
  id v8 = [(PLPTPdAssetEnumerator *)self assetsFromOffset:a4 count:a3];
  NSRange v9 = [MEMORY[0x1E4F1CA48] array];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v33 objects:v40 count:16];
  if (v11)
  {
    uint64_t v13 = v11;
    uint64_t v14 = *(void *)v34;
    *(void *)&long long v12 = 138412290;
    long long v28 = v12;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v34 != v14) {
          objc_enumerationMutation(v10);
        }
        long long v16 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        if (objc_msgSend(v16, "deferredProcessingNeeded", v28) == 1)
        {
          long long v17 = PLPTPGetLog();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            long long v18 = [v16 uuid];
            *(_DWORD *)buf = v28;
            v39 = v18;
            _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_DEBUG, "Found asset requiring finalization (uuid: %@)", buf, 0xCu);
          }
          long long v19 = [v16 objectID];
          char v20 = v9;
        }
        else
        {
          long long v19 = [v16 pictureTransferProtocolAssetsWithConversionSupport:self->_conversionSupport];
          char v20 = v7;
        }
        [v20 addObject:v19];
      }
      uint64_t v13 = [v10 countByEnumeratingWithState:&v33 objects:v40 count:16];
    }
    while (v13);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v21 = v10;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v30;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v30 != v24) {
          objc_enumerationMutation(v21);
        }
        -[PLManagedObjectContext refreshObject:mergeChanges:](self->_managedObjectContext, "refreshObject:mergeChanges:", *(void *)(*((void *)&v29 + 1) + 8 * j), [*(id *)(*((void *)&v29 + 1) + 8 * j) hasChanges]);
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v23);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_assetManager);
  [WeakRetained addAssetsNeedingFinalization:v9];

  [(PLManagedObjectContext *)self->_managedObjectContext processPendingChanges];
  return v7;
}

- (void)enumerateAssetsUsingBlock:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  unint64_t v4 = [(NSArray *)self->_assetObjectIDs count];
  v5 = PLPTPGetLog();
  if (os_signpost_enabled(v5))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)&uint8_t buf[4] = v4;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "PTP enumerate assets", "Asset count %lu", buf, 0xCu);
  }

  unint64_t add_explicit = atomic_fetch_add_explicit(&enumerateAssetsUsingBlock__sEnumerationCount, 1uLL, memory_order_relaxed);
  v6 = PLPTPGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)&uint8_t buf[4] = add_explicit;
    _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEBUG, "Enumeration %llu started", buf, 0xCu);
  }

  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 0;
  __uint64_t v15 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  if (v4)
  {
    unint64_t v7 = 16;
    do
    {
      id v8 = (void *)MEMORY[0x19F38D3B0]();
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      double v27 = 0.0;
      double v27 = COERCE_DOUBLE(clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW));
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __51__PLPTPdAssetEnumerator_enumerateAssetsUsingBlock___block_invoke;
      v18[3] = &unk_1E5868E30;
      char v20 = buf;
      id v21 = &v22;
      id v19 = v17;
      BOOL v9 = [(PLPTPdAssetEnumerator *)self enumerateAssetsWithCount:16 fetchOffset:v7 - 16 usingBlock:v18];

      _Block_object_dispose(buf, 8);
      int v10 = v7 >= v4 || v9;
      v7 += 16;
    }
    while (v10 != 1);
  }
  uint64_t v11 = PLPTPGetLog();
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v11, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "PTP enumerate assets", "", buf, 2u);
  }

  __uint64_t v12 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  uint64_t v13 = PLPTPGetLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    double v14 = (double)(unint64_t)v23[3] / 1000000000.0;
    *(_DWORD *)buf = 134219008;
    *(void *)&uint8_t buf[4] = add_explicit;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v4;
    *(_WORD *)&buf[22] = 2048;
    double v27 = (double)(v12 - v15) / 1000000000.0;
    __int16 v28 = 2048;
    double v29 = v14;
    __int16 v30 = 2048;
    double v31 = (double)v4 / v27;
    _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEBUG, "Enumeration %llu ended: %lu assets in %.2fs, enumeration-only time %.2fs (%.1f assets per second)", buf, 0x34u);
  }

  _Block_object_dispose(&v22, 8);
}

void __51__PLPTPdAssetEnumerator_enumerateAssetsUsingBlock___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(*(void *)(a1[5] + 8) + 24))
  {
    *(void *)(*(void *)(a1[6] + 8) + 24) += clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW)
                                                  - *(void *)(*(void *)(a1[5] + 8) + 24);
    *(void *)(*(void *)(a1[5] + 8) + 24) = 0;
  }
  (*(void (**)(void))(a1[4] + 16))();
}

- (PLPTPdAssetEnumerator)initWithAssetManager:(id)a3 assetObjectIDs:(id)a4 managedObjectContext:(id)a5 conversionSupport:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  double v14 = [(PLPTPdAssetEnumerator *)self init];
  if (v14)
  {
    uint64_t v15 = [v11 copy];
    assetObjectIDs = v14->_assetObjectIDs;
    v14->_assetObjectIDs = (NSArray *)v15;

    objc_storeStrong((id *)&v14->_managedObjectContext, a5);
    objc_storeStrong((id *)&v14->_conversionSupport, a6);
    objc_storeWeak((id *)&v14->_assetManager, v10);
  }

  return v14;
}

@end