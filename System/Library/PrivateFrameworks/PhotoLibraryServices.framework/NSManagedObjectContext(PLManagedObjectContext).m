@interface NSManagedObjectContext(PLManagedObjectContext)
+ (uint64_t)shouldHavePhotoLibrary;
- (BOOL)pl_executeBatchUpdateRequest:()PLManagedObjectContext withBatchSize:error:;
- (id)deleteObjectsWithIncrementalSave:()PLManagedObjectContext;
- (id)enumerateObjectsFromFetchRequest:()PLManagedObjectContext batchSize:usingBlock:;
- (id)enumerateObjectsFromFetchRequest:()PLManagedObjectContext count:batchSize:usingBlock:;
- (id)enumerateWithIncrementalSaveUsingObjects:()PLManagedObjectContext shouldRefreshAfterSave:withBlock:;
- (id)pathManager;
- (id)pl_graphCache;
- (id)pl_resultWithError:()PLManagedObjectContext block:;
- (uint64_t)enumerateObjectsFromFetchRequest:()PLManagedObjectContext count:usingDefaultBatchSizeWithBlock:;
- (uint64_t)enumerateObjectsFromFetchRequest:()PLManagedObjectContext usingDefaultBatchSizeWithBlock:;
- (uint64_t)enumerateWithIncrementalSaveUsingObjects:()PLManagedObjectContext withBlock:;
- (uint64_t)isUserInterfaceContext;
- (uint64_t)photoLibrary;
- (void)pl_performBlockAndWait:()PLManagedObjectContext;
- (void)pl_refresh;
@end

@implementation NSManagedObjectContext(PLManagedObjectContext)

- (void)pl_performBlockAndWait:()PLManagedObjectContext
{
  v5 = a3;
  uint64_t v4 = [a1 concurrencyType];
  if (!v4 || *MEMORY[0x1E4F1C1C0] == v4) {
    v5[2]();
  }
  else {
    [a1 performBlockAndWait:v5];
  }
}

- (BOOL)pl_executeBatchUpdateRequest:()PLManagedObjectContext withBatchSize:error:
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = (void *)MEMORY[0x1E4F1C0D0];
  v9 = [v7 entityName];
  v10 = [v8 fetchRequestWithEntityName:v9];

  v11 = [v7 predicate];
  [v10 setPredicate:v11];

  v47 = v7;
  objc_msgSend(v10, "setIncludesSubentities:", objc_msgSend(v7, "includesSubentities"));
  [v10 setIncludesPropertyValues:0];
  [v10 setIncludesPendingChanges:0];
  [v10 setResultType:1];
  id v50 = 0;
  v45 = a1;
  v12 = [a1 executeFetchRequest:v10 error:&v50];
  id v13 = v50;
  v14 = v13;
  if (!v12)
  {
    BOOL v25 = 0;
    if (a5) {
      *a5 = v13;
    }
    goto LABEL_24;
  }
  v42 = a5;
  id v43 = v13;
  v44 = v10;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v16 = v15;
  v17 = PLBackendGetLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    v18 = [v7 propertiesToUpdate];
    uint64_t v19 = [v12 count];
    v20 = [v7 predicate];
    *(_DWORD *)buf = 138412802;
    v52 = v18;
    __int16 v53 = 2048;
    uint64_t v54 = v19;
    __int16 v55 = 2112;
    v56 = v20;
    _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_DEBUG, "Performing batch update of %@ on %ld records matching %@", buf, 0x20u);
  }
  uint64_t v21 = 0;
  id v22 = 0;
  unint64_t v23 = 0;
  do
  {
    unint64_t v24 = [v12 count];
    BOOL v25 = v23 >= v24;
    if (v23 >= v24)
    {
      v14 = v43;
      v10 = v44;
LABEL_16:
      unint64_t v32 = 0x1E4F1C000;
      goto LABEL_21;
    }
    context = (void *)MEMORY[0x19F38D3B0]();
    if ([v12 count] + v21 < a4) {
      uint64_t v26 = 1;
    }
    else {
      uint64_t v26 = a4;
    }
    v27 = objc_msgSend(v12, "subarrayWithRange:", v23, v26);
    v28 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SELF in %@", v27];
    v29 = (void *)[v47 copy];
    [v29 setPredicate:v28];
    [v29 setResultType:0];
    id v49 = v22;
    v30 = [v45 executeRequest:v47 error:&v49];
    id v31 = v49;

    v23 += a4;
    v21 -= a4;
    id v22 = v31;
  }
  while (v30);
  if (!v42)
  {
    id v22 = v31;
    v14 = v43;
    v10 = v44;
    BOOL v25 = 0;
    goto LABEL_16;
  }
  unint64_t v32 = 0x1E4F1C000uLL;
  if (v31)
  {
    id v22 = v31;
    void *v42 = v22;
  }
  else
  {
    id v22 = 0;
  }
  v14 = v43;
  v10 = v44;
  BOOL v25 = 0;
LABEL_21:
  [*(id *)(v32 + 2504) timeIntervalSinceReferenceDate];
  double v34 = v33;
  v35 = PLBackendGetLog();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
  {
    v36 = [v47 propertiesToUpdate];
    BOOL v37 = v25;
    uint64_t v38 = [v12 count];
    v39 = [v47 predicate];
    unint64_t v40 = [v12 count];
    *(_DWORD *)buf = 138413314;
    v52 = v36;
    __int16 v53 = 2048;
    uint64_t v54 = v38;
    BOOL v25 = v37;
    __int16 v55 = 2112;
    v56 = v39;
    __int16 v57 = 2048;
    unint64_t v58 = v40 / a4;
    __int16 v59 = 2048;
    double v60 = v34 - v16;
    _os_log_impl(&dword_19B3C7000, v35, OS_LOG_TYPE_DEBUG, "Completed batch update of %@ on %ld records matching %@ in %ld batches, %3.3f sec", buf, 0x34u);
  }
LABEL_24:

  return v25;
}

- (id)pl_resultWithError:()PLManagedObjectContext block:
{
  id v6 = a4;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__17716;
  v20 = __Block_byref_object_dispose__17717;
  id v21 = 0;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  v12 = __75__NSManagedObjectContext_PLManagedObjectContext__pl_resultWithError_block___block_invoke;
  id v13 = &unk_1E5870D98;
  double v15 = &v16;
  id v7 = v6;
  id v14 = v7;
  [a1 performBlockAndWait:&v10];
  v8 = objc_msgSend((id)v17[5], "resultWithError:", a3, v10, v11, v12, v13);

  _Block_object_dispose(&v16, 8);
  return v8;
}

- (id)deleteObjectsWithIncrementalSave:()PLManagedObjectContext
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __83__NSManagedObjectContext_PLManagedObjectContext__deleteObjectsWithIncrementalSave___block_invoke;
  v5[3] = &unk_1E58758A8;
  v5[4] = a1;
  v3 = [a1 enumerateWithIncrementalSaveUsingObjects:a3 withBlock:v5];
  return v3;
}

- (uint64_t)enumerateWithIncrementalSaveUsingObjects:()PLManagedObjectContext withBlock:
{
  return [a1 enumerateWithIncrementalSaveUsingObjects:a3 shouldRefreshAfterSave:0 withBlock:a4];
}

- (id)enumerateWithIncrementalSaveUsingObjects:()PLManagedObjectContext shouldRefreshAfterSave:withBlock:
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a5;
  uint64_t v31 = 0;
  unint64_t v32 = &v31;
  uint64_t v33 = 0x3032000000;
  double v34 = __Block_byref_object_copy__17716;
  v35 = __Block_byref_object_dispose__17717;
  id v36 = 0;
  context = (void *)MEMORY[0x19F38D3B0]();
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __124__NSManagedObjectContext_PLManagedObjectContext__enumerateWithIncrementalSaveUsingObjects_shouldRefreshAfterSave_withBlock___block_invoke;
  v30[3] = &unk_1E5875E68;
  v30[4] = a1;
  v30[5] = &v31;
  unint64_t v23 = (void (**)(void))MEMORY[0x19F38D650](v30);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v26 objects:v39 count:16];
  if (v8)
  {
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    uint64_t v11 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v14 = (void *)MEMORY[0x19F38D3B0]();
        char v25 = 0;
        objc_opt_class();
        if (objc_opt_isKindOfClass() & 1) != 0 && ([v13 isDeleted])
        {
          double v15 = PLBackendGetLog();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v16 = [v13 objectID];
            int buf = 138412290;
            uint64_t v38 = v16;
            _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_DEBUG, "Skipping deleted object on incremental save: %@", (uint8_t *)&buf, 0xCu);
          }
        }
        else
        {
          v7[2](v7, v13, v9++, &v25);
          if (v25)
          {
            int v17 = 0;
            goto LABEL_18;
          }
        }
        if ((unint64_t)++v10 >= 0x65)
        {
          v23[2]();
          if (a4) {
            [a1 refreshAllObjects];
          }
          uint64_t v10 = 0;
        }
        int v17 = 1;
LABEL_18:
        if (!v17) {
          goto LABEL_21;
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v26 objects:v39 count:16];
    }
    while (v8);
  }
LABEL_21:

  ((void (*)(void (**)(void)))v23[2])(v23);
  id v18 = (id)v32[5];
  _Block_object_dispose(&v31, 8);

  return v18;
}

- (uint64_t)enumerateObjectsFromFetchRequest:()PLManagedObjectContext usingDefaultBatchSizeWithBlock:
{
  return [a1 enumerateObjectsFromFetchRequest:a3 batchSize:100 usingBlock:a4];
}

- (uint64_t)enumerateObjectsFromFetchRequest:()PLManagedObjectContext count:usingDefaultBatchSizeWithBlock:
{
  return [a1 enumerateObjectsFromFetchRequest:a3 count:a4 batchSize:100 usingBlock:a5];
}

- (id)enumerateObjectsFromFetchRequest:()PLManagedObjectContext batchSize:usingBlock:
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = a5;
  uint64_t v10 = (void *)MEMORY[0x19F38D3B0]();
  [v8 setFetchBatchSize:a4];
  id v38 = 0;
  uint64_t v11 = [a1 executeFetchRequest:v8 error:&v38];
  id v12 = v38;
  uint64_t v13 = [v11 count];
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    uint64_t v15 = v13;
    v30 = v11;
    uint64_t v31 = v10;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v16 = v11;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v34 objects:v41 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = v15;
      uint64_t v20 = 0;
      uint64_t v21 = *(void *)v35;
      id v32 = v8;
      while (2)
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v35 != v21) {
            objc_enumerationMutation(v16);
          }
          unint64_t v23 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          unint64_t v24 = (void *)MEMORY[0x19F38D3B0]();
          char v33 = 0;
          if ([v8 resultType] || (objc_msgSend(v23, "isDeleted") & 1) == 0)
          {
            v9[2](v9, v23, v20, v19, &v33);
            if (v33)
            {
              goto LABEL_19;
            }
            ++v20;
          }
          else
          {
            id v25 = v16;
            uint64_t v26 = v19;
            long long v27 = PLBackendGetLog();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
            {
              long long v28 = [v23 objectID];
              *(_DWORD *)int buf = 138412290;
              uint64_t v40 = v28;
              _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_DEBUG, "Skipping deleted object on enum: %@", buf, 0xCu);
            }
            uint64_t v19 = v26;
            id v16 = v25;
            id v8 = v32;
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v34 objects:v41 count:16];
        if (v18) {
          continue;
        }
        break;
      }
    }
LABEL_19:

    id v14 = 0;
    uint64_t v11 = v30;
    uint64_t v10 = v31;
    id v12 = 0;
  }

  return v14;
}

- (id)enumerateObjectsFromFetchRequest:()PLManagedObjectContext count:batchSize:usingBlock:
{
  id v10 = a3;
  id v11 = a6;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __110__NSManagedObjectContext_PLManagedObjectContext__enumerateObjectsFromFetchRequest_count_batchSize_usingBlock___block_invoke;
  v15[3] = &unk_1E5865CC8;
  uint64_t v17 = &v18;
  id v12 = v11;
  id v16 = v12;
  uint64_t v13 = [a1 enumerateObjectsFromFetchRequest:v10 batchSize:a5 usingBlock:v15];
  if (a4) {
    *a4 = v19[3];
  }

  _Block_object_dispose(&v18, 8);
  return v13;
}

- (id)pl_graphCache
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x3032000000;
  id v7 = __Block_byref_object_copy__17716;
  id v8 = __Block_byref_object_dispose__17717;
  id v9 = 0;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __63__NSManagedObjectContext_PLManagedObjectContext__pl_graphCache__block_invoke;
  v3[3] = &unk_1E5875E68;
  v3[4] = a1;
  v3[5] = &v4;
  objc_msgSend(a1, "pl_performBlockAndWait:", v3);
  id v1 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v1;
}

- (id)pathManager
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__17716;
  uint64_t v13 = __Block_byref_object_dispose__17717;
  id v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__NSManagedObjectContext_PLManagedObjectContext__pathManager__block_invoke;
  v8[3] = &unk_1E5875E68;
  v8[4] = a1;
  v8[5] = &v9;
  objc_msgSend(a1, "pl_performBlockAndWait:", v8);
  uint64_t v4 = (void *)v10[5];
  if (!v4)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, a1, @"PLManagedObjectContext.m", 1825, @"Invalid parameter not satisfying: %@", @"manager" object file lineNumber description];

    uint64_t v4 = (void *)v10[5];
  }
  id v5 = v4;
  _Block_object_dispose(&v9, 8);

  return v5;
}

- (uint64_t)photoLibrary
{
  return 0;
}

- (uint64_t)isUserInterfaceContext
{
  return 0;
}

- (void)pl_refresh
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = objc_msgSend(a1, "registeredObjects", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if (([v7 isDeleted] & 1) == 0) {
          objc_msgSend(a1, "refreshObject:mergeChanges:", v7, objc_msgSend(v7, "hasChanges"));
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

+ (uint64_t)shouldHavePhotoLibrary
{
  return 0;
}

@end