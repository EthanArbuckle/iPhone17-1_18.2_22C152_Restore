@interface FCPuzzleTypeController
- (FCAssetManager)assetManager;
- (FCContentContext)context;
- (FCPuzzleTypeController)init;
- (FCPuzzleTypeController)initWithContentDatabase:(id)a3 context:(id)a4 assetManager:(id)a5 puzzleTypeRecordSource:(id)a6 configurationManager:(id)a7;
- (FCPuzzleTypeRecordSource)puzzleTypeRecordSource;
- (NSCache)fastCache;
- (id)_cachedPuzzleTypeForPuzzleTypeID:(id)a3 fastCacheOnly:(BOOL)a4;
- (id)_cachedPuzzleTypesForPuzzleTypeIDs:(id)a3 fastCacheOnly:(BOOL)a4;
- (id)_fetchOperationForPuzzleTypeWithIDs:(id)a3;
- (id)cachedPuzzleTypeForID:(id)a3;
- (id)jsonEncodableObject;
- (id)thumbnailSmallURLWithJSON:(id)a3 publishDate:(id)a4 difficulty:(int64_t)a5;
- (void)_fetchPuzzleTypeForPuzzleTypeID:(id)a3 cachePolicy:(id)a4 qualityOfService:(int64_t)a5 callbackQueue:(id)a6 completionHandler:(id)a7;
- (void)_fetchPuzzleTypesForPuzzleTypeIDs:(id)a3 cachePolicy:(id)a4 qualityOfService:(int64_t)a5 callbackQueue:(id)a6 completionHandler:(id)a7;
- (void)_refreshPuzzleTypesBasedOnAgeForPuzzleTypes:(id)a3;
- (void)_savePuzzleTypesToCache:(id)a3;
- (void)fetchThumbnailJSONForPuzzleType:(id)a3 completionHandler:(id)a4;
- (void)fetchThumbnailUrlForPuzzle:(id)a3 completionHandler:(id)a4;
- (void)puzzleTypeFetchOperation:(id)a3 didFetchPuzzleTypes:(id)a4;
- (void)setAssetManager:(id)a3;
- (void)setContext:(id)a3;
- (void)setFastCache:(id)a3;
- (void)setPuzzleTypeRecordSource:(id)a3;
@end

@implementation FCPuzzleTypeController

- (FCPuzzleTypeController)initWithContentDatabase:(id)a3 context:(id)a4 assetManager:(id)a5 puzzleTypeRecordSource:(id)a6 configurationManager:(id)a7
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (!v14 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v22 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "assetManager != nil");
    *(_DWORD *)buf = 136315906;
    v26 = "-[FCPuzzleTypeController initWithContentDatabase:context:assetManager:puzzleTypeRecordSource:configurationManager:]";
    __int16 v27 = 2080;
    v28 = "FCPuzzleTypeController.m";
    __int16 v29 = 1024;
    int v30 = 52;
    __int16 v31 = 2114;
    v32 = v22;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v15) {
      goto LABEL_6;
    }
  }
  else if (v15)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v23 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "puzzleTypeRecordSource != nil");
    *(_DWORD *)buf = 136315906;
    v26 = "-[FCPuzzleTypeController initWithContentDatabase:context:assetManager:puzzleTypeRecordSource:configurationManager:]";
    __int16 v27 = 2080;
    v28 = "FCPuzzleTypeController.m";
    __int16 v29 = 1024;
    int v30 = 53;
    __int16 v31 = 2114;
    v32 = v23;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  v24.receiver = self;
  v24.super_class = (Class)FCPuzzleTypeController;
  v17 = [(FCPuzzleTypeController *)&v24 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_assetManager, a5);
    objc_storeStrong((id *)&v18->_context, a4);
    objc_storeStrong((id *)&v18->_puzzleTypeRecordSource, a6);
    v19 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    fastCache = v18->_fastCache;
    v18->_fastCache = v19;

    [(NSCache *)v18->_fastCache setEvictsObjectsWhenApplicationEntersBackground:0];
  }

  return v18;
}

- (FCPuzzleTypeController)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Abstract method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCPuzzleTypeController init]";
    __int16 v9 = 2080;
    v10 = "FCPuzzleTypeController.m";
    __int16 v11 = 1024;
    int v12 = 43;
    __int16 v13 = 2114;
    id v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Abstract method", "-[FCPuzzleTypeController init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (id)cachedPuzzleTypeForID:(id)a3
{
  return [(FCPuzzleTypeController *)self _cachedPuzzleTypeForPuzzleTypeID:a3 fastCacheOnly:0];
}

- (void)_fetchPuzzleTypeForPuzzleTypeID:(id)a3 cachePolicy:(id)a4 qualityOfService:(int64_t)a5 callbackQueue:(id)a6 completionHandler:(id)a7
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  if (v12)
  {
    id v23 = v12;
    id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __119__FCPuzzleTypeController__fetchPuzzleTypeForPuzzleTypeID_cachePolicy_qualityOfService_callbackQueue_completionHandler___block_invoke;
    v21[3] = &unk_1E5B4CA60;
    v17 = &v22;
    id v22 = v15;
    [(FCPuzzleTypeController *)self _fetchPuzzleTypesForPuzzleTypeIDs:v16 cachePolicy:v13 qualityOfService:a5 callbackQueue:v14 completionHandler:v21];

LABEL_6:
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v18 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "puzzleTypeID != nil");
    *(_DWORD *)buf = 136315906;
    v25 = "-[FCPuzzleTypeController _fetchPuzzleTypeForPuzzleTypeID:cachePolicy:qualityOfService:callbackQueue:completionHandler:]";
    __int16 v26 = 2080;
    __int16 v27 = "FCPuzzleTypeController.m";
    __int16 v28 = 1024;
    int v29 = 108;
    __int16 v30 = 2114;
    __int16 v31 = v18;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (!v15) {
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  if (v15)
  {
LABEL_5:
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __119__FCPuzzleTypeController__fetchPuzzleTypeForPuzzleTypeID_cachePolicy_qualityOfService_callbackQueue_completionHandler___block_invoke_2;
    block[3] = &unk_1E5B4CA88;
    v17 = &v20;
    id v20 = v15;
    dispatch_async(v14, block);
    goto LABEL_6;
  }
LABEL_7:
}

void __119__FCPuzzleTypeController__fetchPuzzleTypeForPuzzleTypeID_cachePolicy_qualityOfService_callbackQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v5 = a3;
    id v7 = [a2 allValues];
    id v6 = [v7 firstObject];
    (*(void (**)(uint64_t, void *, id))(v3 + 16))(v3, v6, v5);
  }
}

uint64_t __119__FCPuzzleTypeController__fetchPuzzleTypeForPuzzleTypeID_cachePolicy_qualityOfService_callbackQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_fetchPuzzleTypesForPuzzleTypeIDs:(id)a3 cachePolicy:(id)a4 qualityOfService:(int64_t)a5 callbackQueue:(id)a6 completionHandler:(id)a7
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  if (v12 || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    if (v14) {
      goto LABEL_4;
    }
LABEL_26:
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      __int16 v31 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "callbackQueue != nil");
      *(_DWORD *)buf = 136315906;
      v64 = "-[FCPuzzleTypeController _fetchPuzzleTypesForPuzzleTypeIDs:cachePolicy:qualityOfService:callbackQueue:completionHandler:]";
      __int16 v65 = 2080;
      v66 = "FCPuzzleTypeController.m";
      __int16 v67 = 1024;
      int v68 = 133;
      __int16 v69 = 2114;
      v70 = v31;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      if (v15) {
        goto LABEL_28;
      }
    }
    else if (v15)
    {
LABEL_28:
      uint64_t v57 = MEMORY[0x1E4F143A8];
      uint64_t v58 = 3221225472;
      v59 = __121__FCPuzzleTypeController__fetchPuzzleTypesForPuzzleTypeIDs_cachePolicy_qualityOfService_callbackQueue_completionHandler___block_invoke_2;
      v60 = &unk_1E5B4CA88;
      id v61 = v15;
      (*((void (**)(id, void, void))v61 + 2))(v61, 0, 0);
      id v16 = v61;
      goto LABEL_29;
    }
LABEL_31:
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v32 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "completionHandler != nil");
      *(_DWORD *)buf = 136315906;
      v64 = "-[FCPuzzleTypeController _fetchPuzzleTypesForPuzzleTypeIDs:cachePolicy:qualityOfService:callbackQueue:completionHandler:]";
      __int16 v65 = 2080;
      v66 = "FCPuzzleTypeController.m";
      __int16 v67 = 1024;
      int v68 = 134;
      __int16 v69 = 2114;
      v70 = v32;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
    goto LABEL_37;
  }
  __int16 v30 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "puzzleTypeIDs != nil");
  *(_DWORD *)buf = 136315906;
  v64 = "-[FCPuzzleTypeController _fetchPuzzleTypesForPuzzleTypeIDs:cachePolicy:qualityOfService:callbackQueue:completionHandler:]";
  __int16 v65 = 2080;
  v66 = "FCPuzzleTypeController.m";
  __int16 v67 = 1024;
  int v68 = 132;
  __int16 v69 = 2114;
  v70 = v30;
  _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  if (!v14) {
    goto LABEL_26;
  }
LABEL_4:
  if (!v15) {
    goto LABEL_31;
  }
  if (![v12 count])
  {
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __121__FCPuzzleTypeController__fetchPuzzleTypesForPuzzleTypeIDs_cachePolicy_qualityOfService_callbackQueue_completionHandler___block_invoke_3;
    v54[3] = &unk_1E5B4C7C0;
    id v56 = v15;
    v55 = v14;
    __121__FCPuzzleTypeController__fetchPuzzleTypesForPuzzleTypeIDs_cachePolicy_qualityOfService_callbackQueue_completionHandler___block_invoke_3((uint64_t)v54);

    id v16 = v56;
    goto LABEL_29;
  }
  if (v13)
  {
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __121__FCPuzzleTypeController__fetchPuzzleTypesForPuzzleTypeIDs_cachePolicy_qualityOfService_callbackQueue_completionHandler___block_invoke_5;
    v48[3] = &unk_1E5B592C8;
    v48[4] = self;
    id v49 = v12;
    int64_t v53 = a5;
    id v50 = v13;
    v51 = v14;
    id v52 = v15;
    __121__FCPuzzleTypeController__fetchPuzzleTypesForPuzzleTypeIDs_cachePolicy_qualityOfService_callbackQueue_completionHandler___block_invoke_5((uint64_t)v48);

    id v16 = v49;
LABEL_29:

    goto LABEL_37;
  }
  int64_t v34 = a5;
  v36 = v15;
  queue = v14;
  v17 = [MEMORY[0x1E4F1CA60] dictionary];
  v18 = [MEMORY[0x1E4F1CA48] array];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v35 = v12;
  id v19 = v12;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v44 objects:v62 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v45 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = *(void *)(*((void *)&v44 + 1) + 8 * i);
        v25 = [(FCPuzzleTypeController *)self fastCache];
        __int16 v26 = [v25 objectForKey:v24];

        if (v26) {
          [v17 setObject:v26 forKey:v24];
        }
        else {
          [v18 addObject:v24];
        }
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v44 objects:v62 count:16];
    }
    while (v21);
  }

  if ([v18 count])
  {
    id v27 = [(FCPuzzleTypeController *)self _fetchOperationForPuzzleTypeWithIDs:v18];
    [v27 setQualityOfService:v34];
    id v15 = v36;
    id v14 = queue;
    if (v34 == 9) {
      uint64_t v28 = -1;
    }
    else {
      uint64_t v28 = v34 == 33 || v34 == 25;
    }
    id v13 = 0;
    id v12 = v35;
    [v27 setRelativePriority:v28];
    [v27 setFetchCompletionQueue:queue];
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __121__FCPuzzleTypeController__fetchPuzzleTypesForPuzzleTypeIDs_cachePolicy_qualityOfService_callbackQueue_completionHandler___block_invoke_8;
    v41[3] = &unk_1E5B4CC58;
    id v42 = v17;
    id v43 = v36;
    id v29 = v17;
    [v27 setFetchCompletionBlock:v41];
    uint64_t v33 = objc_msgSend(MEMORY[0x1E4F28F08], "fc_sharedConcurrentQueue");
    [v33 addOperation:v27];
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __121__FCPuzzleTypeController__fetchPuzzleTypesForPuzzleTypeIDs_cachePolicy_qualityOfService_callbackQueue_completionHandler___block_invoke_10;
    block[3] = &unk_1E5B4CC80;
    v39 = v17;
    id v15 = v36;
    id v40 = v36;
    id v27 = v17;
    id v14 = queue;
    dispatch_async(queue, block);

    id v29 = v39;
    id v13 = 0;
    id v12 = v35;
  }

LABEL_37:
}

uint64_t __121__FCPuzzleTypeController__fetchPuzzleTypesForPuzzleTypeIDs_cachePolicy_qualityOfService_callbackQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

void __121__FCPuzzleTypeController__fetchPuzzleTypesForPuzzleTypeIDs_cachePolicy_qualityOfService_callbackQueue_completionHandler___block_invoke_3(uint64_t a1)
{
  v1 = *(void **)(a1 + 40);
  if (v1)
  {
    v2 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __121__FCPuzzleTypeController__fetchPuzzleTypesForPuzzleTypeIDs_cachePolicy_qualityOfService_callbackQueue_completionHandler___block_invoke_4;
    block[3] = &unk_1E5B4CA88;
    id v4 = v1;
    dispatch_async(v2, block);
  }
}

uint64_t __121__FCPuzzleTypeController__fetchPuzzleTypesForPuzzleTypeIDs_cachePolicy_qualityOfService_callbackQueue_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __121__FCPuzzleTypeController__fetchPuzzleTypesForPuzzleTypeIDs_cachePolicy_qualityOfService_callbackQueue_completionHandler___block_invoke_5(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _fetchOperationForPuzzleTypeWithIDs:*(void *)(a1 + 40)];
  [v2 setQualityOfService:*(void *)(a1 + 72)];
  uint64_t v3 = *(void *)(a1 + 72);
  BOOL v4 = v3 == 33 || v3 == 25;
  if (v3 == 9) {
    uint64_t v5 = -1;
  }
  else {
    uint64_t v5 = v4;
  }
  [v2 setRelativePriority:v5];
  objc_msgSend(v2, "setCachePolicy:", objc_msgSend(*(id *)(a1 + 48), "cachePolicy"));
  [*(id *)(a1 + 48) maximumCachedAge];
  objc_msgSend(v2, "setMaximumCachedAge:");
  [v2 setFetchCompletionQueue:*(void *)(a1 + 56)];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __121__FCPuzzleTypeController__fetchPuzzleTypesForPuzzleTypeIDs_cachePolicy_qualityOfService_callbackQueue_completionHandler___block_invoke_6;
  v7[3] = &unk_1E5B4CAF8;
  id v8 = *(id *)(a1 + 64);
  [v2 setFetchCompletionBlock:v7];
  id v6 = objc_msgSend(MEMORY[0x1E4F28F08], "fc_sharedConcurrentQueue");
  [v6 addOperation:v2];
}

void __121__FCPuzzleTypeController__fetchPuzzleTypesForPuzzleTypeIDs_cachePolicy_qualityOfService_callbackQueue_completionHandler___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA60];
  id v4 = a2;
  uint64_t v5 = [v4 fetchedObject];
  id v8 = [v3 dictionaryWithDictionary:v5];

  objc_msgSend(v8, "fc_removeObjectsForKeysPassingTest:", &__block_literal_global_22_0);
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = [v4 error];

  (*(void (**)(uint64_t, id, void *))(v6 + 16))(v6, v8, v7);
}

uint64_t __121__FCPuzzleTypeController__fetchPuzzleTypesForPuzzleTypeIDs_cachePolicy_qualityOfService_callbackQueue_completionHandler___block_invoke_7()
{
  return +[FCTagController isTagAllowedForNewsVersion:](FCTagController, "isTagAllowedForNewsVersion:") ^ 1;
}

void __121__FCPuzzleTypeController__fetchPuzzleTypesForPuzzleTypeIDs_cachePolicy_qualityOfService_callbackQueue_completionHandler___block_invoke_8(uint64_t a1, void *a2)
{
  id v8 = a2;
  if (![v8 status])
  {
    uint64_t v3 = [v8 fetchedObject];
    if (v3) {
      [*(id *)(a1 + 32) addEntriesFromDictionary:v3];
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "fc_removeObjectsForKeysPassingTest:", &__block_literal_global_28_5);
  uint64_t v6 = a1 + 32;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(v6 + 8);
  if ([v4 count])
  {
    (*(void (**)(uint64_t, void *, void))(v5 + 16))(v5, v4, 0);
  }
  else
  {
    id v7 = [v8 error];
    (*(void (**)(uint64_t, void *, void *))(v5 + 16))(v5, v4, v7);
  }
}

uint64_t __121__FCPuzzleTypeController__fetchPuzzleTypesForPuzzleTypeIDs_cachePolicy_qualityOfService_callbackQueue_completionHandler___block_invoke_9()
{
  return +[FCTagController isTagAllowedForNewsVersion:](FCTagController, "isTagAllowedForNewsVersion:") ^ 1;
}

uint64_t __121__FCPuzzleTypeController__fetchPuzzleTypesForPuzzleTypeIDs_cachePolicy_qualityOfService_callbackQueue_completionHandler___block_invoke_10(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "fc_removeObjectsForKeysPassingTest:", &__block_literal_global_30_2);
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

uint64_t __121__FCPuzzleTypeController__fetchPuzzleTypesForPuzzleTypeIDs_cachePolicy_qualityOfService_callbackQueue_completionHandler___block_invoke_11()
{
  return +[FCTagController isTagAllowedForNewsVersion:](FCTagController, "isTagAllowedForNewsVersion:") ^ 1;
}

- (void)fetchThumbnailUrlForPuzzle:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, void))a4;
  id v8 = NSString;
  __int16 v9 = [v6 puzzleType];
  v10 = [v9 identifier];
  __int16 v11 = [v8 stringWithFormat:@"thumbnail-images-mapping-json-%@", v10];

  id v12 = [(FCPuzzleTypeController *)self fastCache];
  id v13 = [v12 objectForKey:v11];

  if (v13)
  {
    id v14 = [v6 publishDate];
    id v15 = -[FCPuzzleTypeController thumbnailSmallURLWithJSON:publishDate:difficulty:](self, "thumbnailSmallURLWithJSON:publishDate:difficulty:", v13, v14, [v6 difficulty]);

    if (v7) {
      v7[2](v7, v15, 0);
    }
  }
  else
  {
    id v16 = [v6 puzzleType];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __71__FCPuzzleTypeController_fetchThumbnailUrlForPuzzle_completionHandler___block_invoke;
    v17[3] = &unk_1E5B4C9A8;
    v17[4] = self;
    id v18 = v6;
    id v19 = v7;
    [(FCPuzzleTypeController *)self fetchThumbnailJSONForPuzzleType:v16 completionHandler:v17];
  }
}

void __71__FCPuzzleTypeController_fetchThumbnailUrlForPuzzle_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  id v5 = a2;
  id v6 = [v4 publishDate];
  objc_msgSend(v3, "thumbnailSmallURLWithJSON:publishDate:difficulty:", v5, v6, objc_msgSend(*(id *)(a1 + 40), "difficulty"));
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v7 = *(void *)(a1 + 48);
  if (v7) {
    (*(void (**)(uint64_t, id, void))(v7 + 16))(v7, v8, 0);
  }
}

- (void)fetchThumbnailJSONForPuzzleType:(id)a3 completionHandler:(id)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *, void))a4;
  id v8 = [v6 imageResourceID];
  if (v8)
  {
    __int16 v9 = NSString;
    v10 = [v6 identifier];
    __int16 v11 = [v9 stringWithFormat:@"thumbnail-images-mapping-json-%@", v10];

    id v12 = [(FCPuzzleTypeController *)self fastCache];
    id v13 = [v12 objectForKey:v11];

    if (v13)
    {
      if (v7) {
        v7[2](v7, v13, 0);
      }
    }
    else
    {
      id v14 = [FCResourcesFetchOperation alloc];
      id v15 = [(FCPuzzleTypeController *)self context];
      v23[0] = v8;
      id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
      v17 = [(FCResourcesFetchOperation *)v14 initWithContext:v15 resourceIDs:v16 downloadAssets:1];

      [(FCFetchOperation *)v17 setCachePolicy:4];
      [(FCFetchOperation *)v17 setMaximumCachedAge:604800.0];
      [(FCOperation *)v17 setQualityOfService:25];
      [(FCOperation *)v17 setRelativePriority:0];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __76__FCPuzzleTypeController_fetchThumbnailJSONForPuzzleType_completionHandler___block_invoke_2;
      v18[3] = &unk_1E5B592F0;
      uint64_t v20 = v7;
      v18[4] = self;
      id v19 = v11;
      [(FCFetchOperation *)v17 setFetchCompletionBlock:v18];
      [(FCOperation *)v17 start];
    }
  }
  else
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __76__FCPuzzleTypeController_fetchThumbnailJSONForPuzzleType_completionHandler___block_invoke;
    v21[3] = &unk_1E5B4CA88;
    uint64_t v22 = v7;
    __76__FCPuzzleTypeController_fetchThumbnailJSONForPuzzleType_completionHandler___block_invoke((uint64_t)v21);
    __int16 v11 = v22;
  }
}

void __76__FCPuzzleTypeController_fetchThumbnailJSONForPuzzleType_completionHandler___block_invoke(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v6 = *MEMORY[0x1E4F28568];
  v7[0] = @"Image resourceID not available for the puzzle type.";
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  id v4 = [v2 errorWithDomain:@"FCErrorDomain" code:8 userInfo:v3];

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, void *))(v5 + 16))(v5, 0, v4);
  }
}

void __76__FCPuzzleTypeController_fetchThumbnailJSONForPuzzleType_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 error];

  if (v4)
  {
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __76__FCPuzzleTypeController_fetchThumbnailJSONForPuzzleType_completionHandler___block_invoke_3;
    v28[3] = &unk_1E5B4C7C0;
    id v30 = *(id *)(a1 + 48);
    id v29 = v3;
    __76__FCPuzzleTypeController_fetchThumbnailJSONForPuzzleType_completionHandler___block_invoke_3((uint64_t)v28);

    id v5 = v30;
  }
  else
  {
    objc_opt_class();
    objc_opt_class();
    uint64_t v6 = [v3 fetchedObject];
    if (v6)
    {
      if (objc_opt_isKindOfClass()) {
        uint64_t v7 = v6;
      }
      else {
        uint64_t v7 = 0;
      }
    }
    else
    {
      uint64_t v7 = 0;
    }
    id v8 = v7;
    __int16 v9 = [v8 firstObject];
    if (v9)
    {
      if (objc_opt_isKindOfClass()) {
        v10 = v9;
      }
      else {
        v10 = 0;
      }
    }
    else
    {
      v10 = 0;
    }
    id v5 = v10;

    if (v5)
    {
      __int16 v11 = [v5 fileURL];
      if (v11)
      {
        id v12 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v11];
        if (v12)
        {
          id v13 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v12 options:0 error:0];
          id v14 = v13;
          if (v13)
          {
            id v15 = [v13 objectForKeyedSubscript:@"smallImages"];
            if (v15)
            {
              id v16 = [*(id *)(a1 + 32) fastCache];
              [v16 setObject:v15 forKey:*(void *)(a1 + 40)];

              uint64_t v17 = *(void *)(a1 + 48);
              if (v17) {
                (*(void (**)(uint64_t, id, void))(v17 + 16))(v17, v15, 0);
              }
            }
            else
            {
              v18[0] = MEMORY[0x1E4F143A8];
              v18[1] = 3221225472;
              v18[2] = __76__FCPuzzleTypeController_fetchThumbnailJSONForPuzzleType_completionHandler___block_invoke_8;
              v18[3] = &unk_1E5B4CA88;
              id v19 = *(id *)(a1 + 48);
              __76__FCPuzzleTypeController_fetchThumbnailJSONForPuzzleType_completionHandler___block_invoke_8((uint64_t)v18);
            }
          }
          else
          {
            v20[0] = MEMORY[0x1E4F143A8];
            v20[1] = 3221225472;
            v20[2] = __76__FCPuzzleTypeController_fetchThumbnailJSONForPuzzleType_completionHandler___block_invoke_7;
            v20[3] = &unk_1E5B4CA88;
            id v21 = *(id *)(a1 + 48);
            __76__FCPuzzleTypeController_fetchThumbnailJSONForPuzzleType_completionHandler___block_invoke_7((uint64_t)v20);
            id v15 = v21;
          }
        }
        else
        {
          v22[0] = MEMORY[0x1E4F143A8];
          v22[1] = 3221225472;
          v22[2] = __76__FCPuzzleTypeController_fetchThumbnailJSONForPuzzleType_completionHandler___block_invoke_6;
          v22[3] = &unk_1E5B4CA88;
          id v23 = *(id *)(a1 + 48);
          __76__FCPuzzleTypeController_fetchThumbnailJSONForPuzzleType_completionHandler___block_invoke_6((uint64_t)v22);
          id v14 = v23;
        }
      }
      else
      {
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __76__FCPuzzleTypeController_fetchThumbnailJSONForPuzzleType_completionHandler___block_invoke_5;
        v24[3] = &unk_1E5B4CA88;
        id v25 = *(id *)(a1 + 48);
        __76__FCPuzzleTypeController_fetchThumbnailJSONForPuzzleType_completionHandler___block_invoke_5((uint64_t)v24);
        id v12 = v25;
      }
    }
    else
    {
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __76__FCPuzzleTypeController_fetchThumbnailJSONForPuzzleType_completionHandler___block_invoke_4;
      v26[3] = &unk_1E5B4CA88;
      id v27 = *(id *)(a1 + 48);
      __76__FCPuzzleTypeController_fetchThumbnailJSONForPuzzleType_completionHandler___block_invoke_4((uint64_t)v26);
      __int16 v11 = v27;
    }
  }
}

void __76__FCPuzzleTypeController_fetchThumbnailJSONForPuzzleType_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (v1)
  {
    id v2 = [*(id *)(a1 + 32) error];
    (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
  }
}

void __76__FCPuzzleTypeController_fetchThumbnailJSONForPuzzleType_completionHandler___block_invoke_4(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v6 = *MEMORY[0x1E4F28568];
  v7[0] = @"Resource object not found in fetched object.";
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  id v4 = [v2 errorWithDomain:@"FCErrorDomain" code:8 userInfo:v3];

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, void *))(v5 + 16))(v5, 0, v4);
  }
}

void __76__FCPuzzleTypeController_fetchThumbnailJSONForPuzzleType_completionHandler___block_invoke_5(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v6 = *MEMORY[0x1E4F28568];
  v7[0] = @"File URL not available in fetched resource.";
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  id v4 = [v2 errorWithDomain:@"FCErrorDomain" code:8 userInfo:v3];

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, void *))(v5 + 16))(v5, 0, v4);
  }
}

void __76__FCPuzzleTypeController_fetchThumbnailJSONForPuzzleType_completionHandler___block_invoke_6(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v6 = *MEMORY[0x1E4F28568];
  v7[0] = @"Data not be created with contents of fetched resource's file path.";
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  id v4 = [v2 errorWithDomain:@"FCErrorDomain" code:8 userInfo:v3];

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, void *))(v5 + 16))(v5, 0, v4);
  }
}

void __76__FCPuzzleTypeController_fetchThumbnailJSONForPuzzleType_completionHandler___block_invoke_7(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v6 = *MEMORY[0x1E4F28568];
  v7[0] = @"Images mapping json dictionary not available from contents of fetched resource's file path.";
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  id v4 = [v2 errorWithDomain:@"FCErrorDomain" code:8 userInfo:v3];

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, void *))(v5 + 16))(v5, 0, v4);
  }
}

void __76__FCPuzzleTypeController_fetchThumbnailJSONForPuzzleType_completionHandler___block_invoke_8(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v6 = *MEMORY[0x1E4F28568];
  v7[0] = @"Small Images mapping json dictionary not available from the contents of fetched resource's file path.";
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  id v4 = [v2 errorWithDomain:@"FCErrorDomain" code:8 userInfo:v3];

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, void *))(v5 + 16))(v5, 0, v4);
  }
}

- (id)thumbnailSmallURLWithJSON:(id)a3 publishDate:(id)a4 difficulty:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_alloc(MEMORY[0x1E4F1C9A8]);
  v10 = (void *)[v9 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
  __int16 v11 = [MEMORY[0x1E4F1CAF0] timeZoneWithAbbreviation:@"EST"];
  [v10 setTimeZone:v11];

  uint64_t v12 = [v10 component:512 fromDate:v8];
  id v13 = objc_msgSend(NSString, "stringWithFormat:", @"s%ld", v12);
  id v14 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", a5);
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  __int16 v26 = __Block_byref_object_copy__62;
  id v27 = __Block_byref_object_dispose__62;
  id v28 = 0;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __75__FCPuzzleTypeController_thumbnailSmallURLWithJSON_publishDate_difficulty___block_invoke;
  v19[3] = &unk_1E5B546E8;
  id v15 = v13;
  id v20 = v15;
  uint64_t v22 = &v23;
  id v16 = v14;
  id v21 = v16;
  [v7 enumerateKeysAndObjectsUsingBlock:v19];
  id v17 = (id)v24[5];

  _Block_object_dispose(&v23, 8);
  return v17;
}

uint64_t __75__FCPuzzleTypeController_thumbnailSmallURLWithJSON_publishDate_difficulty___block_invoke(void *a1, void *a2, void *a3, unsigned char *a4)
{
  id v12 = a3;
  uint64_t v7 = [a2 isEqualToString:a1[4]];
  id v8 = v12;
  if (v7)
  {
    id v9 = [v12 objectForKeyedSubscript:a1[5]];
    v10 = v9;
    if (!v9)
    {
      v10 = [v12 objectForKeyedSubscript:@"defaultUrl"];
    }
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), v10);
    if (!v9) {

    }
    *a4 = 1;
    id v8 = v12;
  }
  return MEMORY[0x1F41817F8](v7, v8);
}

- (id)_cachedPuzzleTypeForPuzzleTypeID:(id)a3 fastCacheOnly:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = v6;
  if (v6)
  {
    id v14 = v6;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
    id v9 = [(FCPuzzleTypeController *)self _cachedPuzzleTypesForPuzzleTypeIDs:v8 fastCacheOnly:v4];
    v10 = [v9 allValues];
    __int16 v11 = [v10 firstObject];
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v13 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "puzzleTypeID != nil");
      *(_DWORD *)buf = 136315906;
      id v16 = "-[FCPuzzleTypeController _cachedPuzzleTypeForPuzzleTypeID:fastCacheOnly:]";
      __int16 v17 = 2080;
      id v18 = "FCPuzzleTypeController.m";
      __int16 v19 = 1024;
      int v20 = 385;
      __int16 v21 = 2114;
      uint64_t v22 = v13;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
    __int16 v11 = 0;
  }

  return v11;
}

- (id)_cachedPuzzleTypesForPuzzleTypeIDs:(id)a3 fastCacheOnly:(BOOL)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v20 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "puzzleTypeIDs != nil");
    *(_DWORD *)buf = 136315906;
    id v30 = "-[FCPuzzleTypeController _cachedPuzzleTypesForPuzzleTypeIDs:fastCacheOnly:]";
    __int16 v31 = 2080;
    uint64_t v32 = "FCPuzzleTypeController.m";
    __int16 v33 = 1024;
    int v34 = 392;
    __int16 v35 = 2114;
    v36 = v20;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v6 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        id v14 = [(FCPuzzleTypeController *)self fastCache];
        id v15 = [v14 objectForKey:v13];

        if (v15) {
          [v6 setObject:v15 forKey:v13];
        }
        else {
          [v7 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v10);
  }

  if ([v7 count] && !a4)
  {
    id v16 = [(FCPuzzleTypeController *)self puzzleTypeRecordSource];
    __int16 v17 = [v16 cachedRecordsWithIDs:v7];

    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __75__FCPuzzleTypeController__cachedPuzzleTypesForPuzzleTypeIDs_fastCacheOnly___block_invoke;
    v22[3] = &unk_1E5B59318;
    void v22[4] = self;
    id v23 = v6;
    [v17 enumerateRecordsAndInterestTokensWithBlock:v22];
  }
  id v18 = [v6 allValues];
  [(FCPuzzleTypeController *)self _refreshPuzzleTypesBasedOnAgeForPuzzleTypes:v18];

  return v6;
}

void __75__FCPuzzleTypeController__cachedPuzzleTypesForPuzzleTypeIDs_fastCacheOnly___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = [FCPuzzleType alloc];
  id v8 = [*(id *)(a1 + 32) assetManager];
  uint64_t v9 = [*(id *)(a1 + 32) context];
  id v12 = [(FCPuzzleType *)v7 initWithPuzzleTypeRecord:v6 assetManager:v8 context:v9 interestToken:v5];

  uint64_t v10 = *(void **)(a1 + 40);
  uint64_t v11 = [(FCPuzzleType *)v12 identifier];
  [v10 setObject:v12 forKey:v11];
}

- (void)_refreshPuzzleTypesBasedOnAgeForPuzzleTypes:(id)a3
{
  id v16 = self;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  BOOL v4 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "loadDate", v16);
        uint64_t v11 = [v10 dateByAddingTimeInterval:3600.0];
        id v12 = [MEMORY[0x1E4F1C9C8] date];
        int v13 = objc_msgSend(v11, "fc_isEarlierThan:", v12);

        if (v13)
        {
          id v14 = [v9 identifier];
          [v4 addObject:v14];
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }

  if ([v4 count])
  {
    id v15 = [(FCPuzzleTypeController *)v16 _fetchOperationForPuzzleTypeWithIDs:v4];
    [v15 setQualityOfService:17];
    [v15 setRelativePriority:-1];
    [v15 setCachePolicy:1];
    [v15 start];
  }
}

- (void)_savePuzzleTypesToCache:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FCPuzzleTypeController *)self fastCache];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __50__FCPuzzleTypeController__savePuzzleTypesToCache___block_invoke;
  v7[3] = &unk_1E5B59340;
  id v8 = v5;
  id v6 = v5;
  [v4 enumerateObjectsUsingBlock:v7];
}

void __50__FCPuzzleTypeController__savePuzzleTypesToCache___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v3 identifier];
  [v2 setObject:v3 forKey:v4];
}

- (id)jsonEncodableObject
{
  id v2 = [(FCPuzzleTypeController *)self puzzleTypeRecordSource];
  id v3 = [v2 jsonEncodableObject];

  return v3;
}

- (id)_fetchOperationForPuzzleTypeWithIDs:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [FCPuzzleTypeFetchOperation alloc];
  id v6 = [(FCPuzzleTypeController *)self puzzleTypeRecordSource];
  uint64_t v7 = [(FCPuzzleTypeController *)self assetManager];
  id v8 = [(FCPuzzleTypeController *)self context];
  uint64_t v9 = [(FCPuzzleTypeFetchOperation *)v5 initWithPuzzleTypeIDs:v4 puzzleTypeRecordSource:v6 assetManager:v7 context:v8 delegate:self];

  return v9;
}

- (void)puzzleTypeFetchOperation:(id)a3 didFetchPuzzleTypes:(id)a4
{
}

- (FCAssetManager)assetManager
{
  return self->_assetManager;
}

- (void)setAssetManager:(id)a3
{
}

- (FCContentContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (FCPuzzleTypeRecordSource)puzzleTypeRecordSource
{
  return self->_puzzleTypeRecordSource;
}

- (void)setPuzzleTypeRecordSource:(id)a3
{
}

- (NSCache)fastCache
{
  return self->_fastCache;
}

- (void)setFastCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fastCache, 0);
  objc_storeStrong((id *)&self->_puzzleTypeRecordSource, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_assetManager, 0);
}

@end