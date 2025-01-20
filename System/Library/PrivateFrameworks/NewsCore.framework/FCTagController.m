@interface FCTagController
+ (BOOL)isTagAllowed:(id)a3;
+ (BOOL)isTagAllowedForNewsVersion:(id)a3;
+ (BOOL)isTagAllowedInContentStoreFront:(id)a3;
- (BOOL)shouldPrefetchGlobalTags;
- (FCTagController)init;
- (FCTagController)initWithContentDatabase:(id)a3 assetManager:(id)a4 tagRecordSource:(id)a5 configurationManager:(id)a6;
- (id)_cachedTagForTagID:(char)a3 fastCacheOnly:;
- (id)_cachedTagsForTagIDs:(char)a3 fastCacheOnly:;
- (id)expectedFastCachedTagForID:(id)a3;
- (id)fastCachedTagForID:(id)a3;
- (id)fastCachedTagsForIDs:(id)a3;
- (id)fetchOperationForTagsIncludingChildrenWithIDs:(id)a3 softMaxAge:(double)a4;
- (id)fetchOperationForTagsWithIDs:(id)a3;
- (id)fetchOperationForTagsWithIDs:(id)a3 includeChildren:(BOOL)a4;
- (id)fetchOperationForTagsWithIDs:(id)a3 includeParents:(BOOL)a4;
- (id)jsonEncodableObject;
- (id)slowCachedTagForID:(id)a3;
- (id)slowCachedTagsForIDs:(id)a3;
- (id)tagsForTagIDs:(id)a3;
- (id)tagsForTagIDs:(id)a3 predicate:(id)a4;
- (id)tagsForTagRecords:(id)a3;
- (void)_fetchTagsForTagIDs:(uint64_t)a3 includeParents:(uint64_t)a4 includeChildren:(uint64_t)a5 qualityOfService:(void *)a6 callbackQueue:(void *)a7 completionHandler:;
- (void)configurationManager:(id)a3 configurationDidChange:(id)a4;
- (void)dealloc;
- (void)fetchTagForTagID:(id)a3 qualityOfService:(int64_t)a4 callbackQueue:(id)a5 completionHandler:(id)a6;
- (void)fetchTagsForTagIDs:(id)a3 cachePolicy:(id)a4 qualityOfService:(int64_t)a5 completionHandler:(id)a6;
- (void)fetchTagsForTagIDs:(id)a3 includeParents:(BOOL)a4 includeChildren:(BOOL)a5 qualityOfService:(int64_t)a6 callbackQueue:(id)a7 completionHandler:(id)a8;
- (void)fetchTagsForTagIDs:(id)a3 maximumCachedAge:(double)a4 qualityOfService:(int64_t)a5 completionHandler:(id)a6;
- (void)fetchTagsForTagIDs:(id)a3 qualityOfService:(int64_t)a4 callbackQueue:(id)a5 completionHandler:(id)a6;
- (void)operationThrottler:(id)a3 performAsyncOperationWithCompletion:(id)a4;
- (void)saveTagsToCache:(id)a3;
- (void)setShouldPrefetchGlobalTags:(BOOL)a3;
- (void)tagsFetchOperation:(id)a3 didFetchTags:(id)a4;
@end

@implementation FCTagController

- (id)fetchOperationForTagsWithIDs:(id)a3
{
  id v4 = a3;
  v5 = [FCTagsFetchOperation alloc];
  if (self)
  {
    v6 = self->_tagRecordSource;
    assetManager = self->_assetManager;
  }
  else
  {
    v6 = 0;
    assetManager = 0;
  }
  v8 = [(FCTagsFetchOperation *)v5 initWithTagIDs:v4 tagRecordSource:v6 assetManager:assetManager delegate:self];

  return v8;
}

void __37__FCTagController_tagsForTagRecords___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __37__FCTagController_tagsForTagRecords___block_invoke_2;
  v10[3] = &unk_1E5B4CCF8;
  v5 = (void *)a1[4];
  uint64_t v4 = a1[5];
  id v11 = v3;
  uint64_t v12 = v4;
  id v6 = v3;
  uint64_t v7 = [v5 transformRecordsByIDWithBlock:v10];
  uint64_t v8 = *(void *)(a1[6] + 8);
  v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

FCTag *__37__FCTagController_tagsForTagRecords___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void **)(a1 + 32);
  uint64_t v8 = [v5 base];
  v9 = [v8 identifier];
  v10 = [v7 objectForKey:v9];

  if (!v10) {
    goto LABEL_3;
  }
  id v11 = [v5 base];
  uint64_t v12 = [v10 tagRecord];
  v13 = [v12 base];
  char v14 = objc_msgSend(v11, "fc_isNewerThan:", v13);

  if ((v14 & 1) == 0)
  {
    v18 = v10;
  }
  else
  {
LABEL_3:
    v15 = [FCTag alloc];
    uint64_t v16 = *(void *)(a1 + 40);
    if (v16) {
      uint64_t v17 = *(void *)(v16 + 16);
    }
    else {
      uint64_t v17 = 0;
    }
    v18 = [(FCTag *)v15 initWithTagRecord:v5 assetManager:v17 interestToken:v6];
    v19 = *(void **)(a1 + 32);
    v20 = [(FCTag *)v18 identifier];
    [v19 setObject:v18 forKey:v20];
  }
  return v18;
}

- (void)fetchTagsForTagIDs:(id)a3 maximumCachedAge:(double)a4 qualityOfService:(int64_t)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a3;
  uint64_t v12 = +[FCCachePolicy cachePolicyWithSoftMaxAge:a4];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __90__FCTagController_fetchTagsForTagIDs_maximumCachedAge_qualityOfService_completionHandler___block_invoke;
  v14[3] = &unk_1E5B4CA60;
  id v15 = v10;
  id v13 = v10;
  [(FCTagController *)self fetchTagsForTagIDs:v11 cachePolicy:v12 qualityOfService:a5 completionHandler:v14];
}

- (void)fetchTagsForTagIDs:(id)a3 cachePolicy:(id)a4 qualityOfService:(int64_t)a5 completionHandler:(id)a6
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = (void (**)(id, void *, void))a6;
  if (!v10 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v28 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "tagIDs != nil");
    *(_DWORD *)buf = 136315906;
    v40 = "-[FCTagController fetchTagsForTagIDs:cachePolicy:qualityOfService:completionHandler:]";
    __int16 v41 = 2080;
    v42 = "FCTagController.m";
    __int16 v43 = 1024;
    int v44 = 219;
    __int16 v45 = 2114;
    v46 = v28;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v12)
    {
LABEL_4:
      if ([v10 count])
      {
        unint64_t v13 = [v11 cachePolicy];
        if (v13 > 5)
        {
          id v15 = 0;
        }
        else if (((1 << v13) & 0xD) != 0)
        {
          if (self) {
            fastCache = self->_fastCache;
          }
          else {
            fastCache = 0;
          }
          id v15 = [(FCThreadSafeMapTable *)fastCache subdictionaryForKeys:v10];
        }
        else if (((1 << v13) & 0x30) != 0)
        {
          uint64_t v16 = [v11 oldestAllowedDate];
          uint64_t v17 = v16;
          if (v16)
          {
            id v18 = v16;
          }
          else
          {
            id v18 = [MEMORY[0x1E4F1C9C8] distantPast];
          }
          v19 = v18;

          v20 = [MEMORY[0x1E4F1C9C8] distantPast];
          int v21 = [v19 isEqualToDate:v20];

          if (v21)
          {
            if (self) {
              v22 = self->_fastCache;
            }
            else {
              v22 = 0;
            }
            id v15 = [(FCThreadSafeMapTable *)v22 subdictionaryForKeys:v10];
          }
          else
          {
            if (self) {
              v23 = self->_fastCache;
            }
            else {
              v23 = 0;
            }
            v32[0] = MEMORY[0x1E4F143A8];
            v32[1] = 3221225472;
            v32[2] = __85__FCTagController_fetchTagsForTagIDs_cachePolicy_qualityOfService_completionHandler___block_invoke_3;
            v32[3] = &unk_1E5B4CAB0;
            id v33 = v19;
            id v15 = [(FCThreadSafeMapTable *)v23 subdictionaryForKeys:v10 passingTest:v32];
          }
        }
        else
        {
          id v15 = (void *)MEMORY[0x1E4F1CC08];
        }
        uint64_t v24 = [v15 count];
        if (v24 == [v10 count])
        {
          v12[2](v12, v15, 0);
        }
        else
        {
          v25 = [(FCTagController *)self fetchOperationForTagsWithIDs:v10];
          [v25 setQualityOfService:a5];
          if (a5 == 9) {
            uint64_t v26 = -1;
          }
          else {
            uint64_t v26 = a5 == 33 || a5 == 25;
          }
          [v25 setRelativePriority:v26];
          objc_msgSend(v25, "setCachePolicy:", objc_msgSend(v11, "cachePolicy"));
          [v11 maximumCachedAge];
          objc_msgSend(v25, "setMaximumCachedAge:");
          [v25 setCanSendFetchCompletionSynchronously:1];
          v30[0] = MEMORY[0x1E4F143A8];
          v30[1] = 3221225472;
          v30[2] = __85__FCTagController_fetchTagsForTagIDs_cachePolicy_qualityOfService_completionHandler___block_invoke_4;
          v30[3] = &unk_1E5B4CAF8;
          v31 = v12;
          [v25 setFetchCompletionBlock:v30];
          if ([MEMORY[0x1E4F29060] isMainThread])
          {
            v27 = objc_msgSend(MEMORY[0x1E4F28F08], "fc_sharedConcurrentQueue");
            [v27 addOperation:v25];
          }
          else
          {
            [v25 start];
          }
        }
      }
      else
      {
        uint64_t v34 = MEMORY[0x1E4F143A8];
        uint64_t v35 = 3221225472;
        v36 = __85__FCTagController_fetchTagsForTagIDs_cachePolicy_qualityOfService_completionHandler___block_invoke_2;
        v37 = &unk_1E5B4CA88;
        v38 = v12;
        v38[2](v38, (void *)MEMORY[0x1E4F1CC08], 0);
      }
      goto LABEL_41;
    }
  }
  else if (v12)
  {
    goto LABEL_4;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v29 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "completionHandler != nil");
    *(_DWORD *)buf = 136315906;
    v40 = "-[FCTagController fetchTagsForTagIDs:cachePolicy:qualityOfService:completionHandler:]";
    __int16 v41 = 2080;
    v42 = "FCTagController.m";
    __int16 v43 = 1024;
    int v44 = 220;
    __int16 v45 = 2114;
    v46 = v29;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_41:
}

- (void)setShouldPrefetchGlobalTags:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = self;
  if (self) {
    self = (FCTagController *)self->_tagPrefetchThrottler;
  }
  if ([(FCTagController *)self suspended] == a3)
  {
    if (v4) {
      tagPrefetchThrottler = v4->_tagPrefetchThrottler;
    }
    else {
      tagPrefetchThrottler = 0;
    }
    [(FCOperationThrottler *)tagPrefetchThrottler setSuspended:!v3];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __47__FCTagController_setShouldPrefetchGlobalTags___block_invoke;
    v6[3] = &unk_1E5B4C018;
    v6[4] = v4;
    +[FCTaskScheduler scheduleLowPriorityBlock:v6];
  }
}

void __85__FCTagController_fetchTagsForTagIDs_cachePolicy_qualityOfService_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  BOOL v3 = (void *)MEMORY[0x1E4F1CA60];
  id v4 = a2;
  id v5 = [v4 fetchedObject];
  id v8 = [v3 dictionaryWithDictionary:v5];

  objc_msgSend(v8, "fc_removeObjectsForKeysPassingTest:", &__block_literal_global_38);
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = [v4 error];

  (*(void (**)(uint64_t, id, void *))(v6 + 16))(v6, v8, v7);
}

uint64_t __90__FCTagController_fetchTagsForTagIDs_maximumCachedAge_qualityOfService_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __85__FCTagController_fetchTagsForTagIDs_cachePolicy_qualityOfService_completionHandler___block_invoke_5()
{
  return +[FCTagController isTagAllowedForNewsVersion:](FCTagController, "isTagAllowedForNewsVersion:") ^ 1;
}

+ (BOOL)isTagAllowedForNewsVersion:(id)a3
{
  return !+[FCTagFilterUtilities filterTag:a3 options:16];
}

void __35__FCTagController_saveTagsToCache___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v14 = v3;
  id v5 = [v3 identifier];
  uint64_t v6 = [v4 objectForKey:v5];

  if (!v6) {
    goto LABEL_3;
  }
  uint64_t v7 = [v14 tagRecord];
  id v8 = [v7 base];
  v9 = [v6 tagRecord];
  id v10 = [v9 base];
  int v11 = objc_msgSend(v8, "fc_isNewerThan:", v10);

  if (v11)
  {
LABEL_3:
    uint64_t v12 = *(void **)(a1 + 32);
    unint64_t v13 = [v14 identifier];
    [v12 setObject:v14 forKey:v13];
  }
}

- (FCTagController)initWithContentDatabase:(id)a3 assetManager:(id)a4 tagRecordSource:(id)a5 configurationManager:(id)a6
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v11 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v28 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "contentDatabase != nil");
    *(_DWORD *)buf = 136315906;
    id v33 = "-[FCTagController initWithContentDatabase:assetManager:tagRecordSource:configurationManager:]";
    __int16 v34 = 2080;
    uint64_t v35 = "FCTagController.m";
    __int16 v36 = 1024;
    int v37 = 70;
    __int16 v38 = 2114;
    v39 = v28;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v12) {
      goto LABEL_6;
    }
  }
  else if (v12)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v29 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "assetManager != nil");
    *(_DWORD *)buf = 136315906;
    id v33 = "-[FCTagController initWithContentDatabase:assetManager:tagRecordSource:configurationManager:]";
    __int16 v34 = 2080;
    uint64_t v35 = "FCTagController.m";
    __int16 v36 = 1024;
    int v37 = 71;
    __int16 v38 = 2114;
    v39 = v29;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  if (!v13 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v30 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "tagRecordSource != nil");
    *(_DWORD *)buf = 136315906;
    id v33 = "-[FCTagController initWithContentDatabase:assetManager:tagRecordSource:configurationManager:]";
    __int16 v34 = 2080;
    uint64_t v35 = "FCTagController.m";
    __int16 v36 = 1024;
    int v37 = 72;
    __int16 v38 = 2114;
    v39 = v30;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v31.receiver = self;
  v31.super_class = (Class)FCTagController;
  id v15 = [(FCTagController *)&v31 init];
  uint64_t v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_contentDatabase, a3);
    objc_storeStrong((id *)&v16->_assetManager, a4);
    objc_storeStrong((id *)&v16->_configurationManager, a6);
    objc_storeStrong((id *)&v16->_tagRecordSource, a5);
    uint64_t v17 = +[FCThreadSafeMapTable strongToWeakObjectsMapTable];
    fastCache = v16->_fastCache;
    v16->_fastCache = (FCThreadSafeMapTable *)v17;

    v19 = [[FCOperationThrottler alloc] initWithDelegate:v16];
    tagPrefetchThrottler = v16->_tagPrefetchThrottler;
    v16->_tagPrefetchThrottler = v19;

    [(FCOperationThrottler *)v16->_tagPrefetchThrottler setSuspended:1];
    int v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    prefetchedTags = v16->_prefetchedTags;
    v16->_prefetchedTags = v21;

    v23 = [[FCOperationThrottler alloc] initWithDelegate:v16];
    tagRefreshThrottler = v16->_tagRefreshThrottler;
    v16->_tagRefreshThrottler = v23;

    v25 = objc_alloc_init(FCThreadSafeMutableSet);
    tagIDsNeedingRefresh = v16->_tagIDsNeedingRefresh;
    v16->_tagIDsNeedingRefresh = v25;

    objc_storeStrong((id *)&v16->_configurationManager, a6);
    [(FCCoreConfigurationManager *)v16->_configurationManager addObserver:v16];
  }

  return v16;
}

- (id)fastCachedTagsForIDs:(id)a3
{
  return -[FCTagController _cachedTagsForTagIDs:fastCacheOnly:]((id *)&self->super.isa, a3, 1);
}

- (void)tagsFetchOperation:(id)a3 didFetchTags:(id)a4
{
}

- (void)saveTagsToCache:(id)a3
{
  id v4 = a3;
  if (self) {
    self = (FCTagController *)self->_fastCache;
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __35__FCTagController_saveTagsToCache___block_invoke;
  v6[3] = &unk_1E5B4CCD0;
  id v7 = v4;
  id v5 = v4;
  [(FCTagController *)self readWriteWithAccessor:v6];
}

- (id)tagsForTagRecords:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__2;
  id v18 = __Block_byref_object_dispose__2;
  id v19 = 0;
  if (self) {
    fastCache = self->_fastCache;
  }
  else {
    fastCache = 0;
  }
  uint64_t v6 = fastCache;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __37__FCTagController_tagsForTagRecords___block_invoke;
  v10[3] = &unk_1E5B4CD20;
  id v13 = &v14;
  id v7 = v4;
  id v11 = v7;
  id v12 = self;
  [(FCThreadSafeMapTable *)v6 readWriteWithAccessor:v10];

  id v8 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v8;
}

void __35__FCTagController_saveTagsToCache___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __35__FCTagController_saveTagsToCache___block_invoke_2;
  v6[3] = &unk_1E5B4CCA8;
  id v7 = v3;
  id v5 = v3;
  [v4 enumerateObjectsUsingBlock:v6];
}

void __54__FCTagController__cachedTagsForTagIDs_fastCacheOnly___block_invoke(id *a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = a1[4];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        id v10 = objc_msgSend(v3, "objectForKey:", v9, (void)v11);
        if (v10) {
          [a1[5] setObject:v10 forKey:v9];
        }
        else {
          [a1[6] addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (id)_cachedTagsForTagIDs:(char)a3 fastCacheOnly:
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = v5;
  if (a1)
  {
    if (!v5 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v28 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "tagIDs != nil");
      *(_DWORD *)buf = 136315906;
      int v44 = "-[FCTagController _cachedTagsForTagIDs:fastCacheOnly:]";
      __int16 v45 = 2080;
      v46 = "FCTagController.m";
      __int16 v47 = 1024;
      int v48 = 377;
      __int16 v49 = 2114;
      v50 = v28;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
    id v8 = [MEMORY[0x1E4F1CA48] array];
    id v9 = a1[5];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __54__FCTagController__cachedTagsForTagIDs_fastCacheOnly___block_invoke;
    v35[3] = &unk_1E5B4CBE0;
    objc_super v31 = v6;
    id v36 = v6;
    id v10 = v7;
    id v37 = v10;
    id v11 = v8;
    id v38 = v11;
    [v9 readWithAccessor:v35];
    if ([v11 count] && (a3 & 1) == 0)
    {
      long long v12 = [a1[3] cachedRecordsWithIDs:v11];
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __54__FCTagController__cachedTagsForTagIDs_fastCacheOnly___block_invoke_2;
      v33[3] = &unk_1E5B4CC08;
      v33[4] = a1;
      id v13 = v10;
      id v34 = v13;
      [v12 enumerateRecordsAndInterestTokensWithBlock:v33];
      [a1[5] addEntriesFromDictionary:v13];
    }
    v30 = v11;
    v29 = a1;
    id v14 = [v10 allValues];
    v32 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v15 = v14;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v39 objects:buf count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v40 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          int v21 = [v20 loadDate];
          v22 = [v21 dateByAddingTimeInterval:3600.0];
          v23 = [MEMORY[0x1E4F1C9C8] date];
          int v24 = objc_msgSend(v22, "fc_isEarlierThan:", v23);

          if (v24)
          {
            v25 = [v20 identifier];
            [v32 addObject:v25];
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v39 objects:buf count:16];
      }
      while (v17);
    }

    if ([v32 count])
    {
      [v29[9] addObjectsFromArray:v32];
      [v29[8] tickle];
    }

    uint64_t v26 = v38;
    a1 = (id *)v10;

    uint64_t v6 = v31;
  }

  return a1;
}

- (void)configurationManager:(id)a3 configurationDidChange:(id)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63__FCTagController_configurationManager_configurationDidChange___block_invoke;
  v4[3] = &unk_1E5B4C018;
  v4[4] = self;
  +[FCTaskScheduler scheduleLowPriorityBlock:](FCTaskScheduler, "scheduleLowPriorityBlock:", v4, a4);
}

- (FCTagController)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Abstract method"];
    *(_DWORD *)buf = 136315906;
    id v8 = "-[FCTagController init]";
    __int16 v9 = 2080;
    id v10 = "FCTagController.m";
    __int16 v11 = 1024;
    int v12 = 62;
    __int16 v13 = 2114;
    id v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = [NSString stringWithFormat:@"%@: %s", @"Abstract method", "-[FCTagController init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (void)dealloc
{
  [(FCCoreConfigurationManager *)self->_configurationManager removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)FCTagController;
  [(FCTagController *)&v3 dealloc];
}

- (id)fastCachedTagForID:(id)a3
{
  return -[FCTagController _cachedTagForTagID:fastCacheOnly:]((id *)&self->super.isa, a3, 1);
}

- (id)_cachedTagForTagID:(char)a3 fastCacheOnly:
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = v5;
  if (a1)
  {
    if (v5)
    {
      id v13 = v5;
      uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
      id v8 = -[FCTagController _cachedTagsForTagIDs:fastCacheOnly:](a1, v7, a3);
      __int16 v9 = [v8 allValues];
      id v10 = [v9 firstObject];

      goto LABEL_7;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v12 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "tagID != nil");
      *(_DWORD *)buf = 136315906;
      uint64_t v15 = "-[FCTagController _cachedTagForTagID:fastCacheOnly:]";
      __int16 v16 = 2080;
      uint64_t v17 = "FCTagController.m";
      __int16 v18 = 1024;
      int v19 = 370;
      __int16 v20 = 2114;
      int v21 = v12;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
  }
  id v10 = 0;
LABEL_7:

  return v10;
}

- (id)slowCachedTagForID:(id)a3
{
  return -[FCTagController _cachedTagForTagID:fastCacheOnly:]((id *)&self->super.isa, a3, 0);
}

- (id)slowCachedTagsForIDs:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F29060] isMainThread]
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = (void *)[[NSString alloc] initWithFormat:@"This operation must not be performed on the main thread."];
    int v8 = 136315906;
    __int16 v9 = "-[FCTagController slowCachedTagsForIDs:]";
    __int16 v10 = 2080;
    __int16 v11 = "FCTagController.m";
    __int16 v12 = 1024;
    int v13 = 118;
    __int16 v14 = 2114;
    uint64_t v15 = v7;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v8, 0x26u);
  }
  id v5 = -[FCTagController _cachedTagsForTagIDs:fastCacheOnly:]((id *)&self->super.isa, v4, 0);

  return v5;
}

- (id)expectedFastCachedTagForID:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = -[FCTagController _cachedTagForTagID:fastCacheOnly:]((id *)&self->super.isa, v4, 1);
  if (!v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "result");
      *(_DWORD *)buf = 136315906;
      __int16 v9 = "-[FCTagController expectedFastCachedTagForID:]";
      __int16 v10 = 2080;
      __int16 v11 = "FCTagController.m";
      __int16 v12 = 1024;
      int v13 = 126;
      __int16 v14 = 2114;
      uint64_t v15 = v7;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
    id v5 = -[FCTagController _cachedTagForTagID:fastCacheOnly:]((id *)&self->super.isa, v4, 0);
  }

  return v5;
}

+ (BOOL)isTagAllowed:(id)a3
{
  return !+[FCTagFilterUtilities filterTag:a3 options:30];
}

+ (BOOL)isTagAllowedInContentStoreFront:(id)a3
{
  return !+[FCTagFilterUtilities filterTag:a3 options:4];
}

- (id)fetchOperationForTagsWithIDs:(id)a3 includeParents:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [FCTagsFetchOperation alloc];
  if (self)
  {
    int v8 = self->_tagRecordSource;
    assetManager = self->_assetManager;
  }
  else
  {
    int v8 = 0;
    assetManager = 0;
  }
  __int16 v10 = [(FCTagsFetchOperation *)v7 initWithTagIDs:v6 tagRecordSource:v8 assetManager:assetManager delegate:self];

  [(FCTagsFetchOperation *)v10 setIncludeParents:v4];
  return v10;
}

- (id)fetchOperationForTagsWithIDs:(id)a3 includeChildren:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [FCTagsFetchOperation alloc];
  if (self)
  {
    int v8 = self->_tagRecordSource;
    assetManager = self->_assetManager;
  }
  else
  {
    int v8 = 0;
    assetManager = 0;
  }
  __int16 v10 = [(FCTagsFetchOperation *)v7 initWithTagIDs:v6 tagRecordSource:v8 assetManager:assetManager delegate:self];

  [(FCTagsFetchOperation *)v10 setIncludeChildren:v4];
  return v10;
}

- (id)fetchOperationForTagsIncludingChildrenWithIDs:(id)a3 softMaxAge:(double)a4
{
  id v6 = a3;
  uint64_t v7 = [FCTagsFetchOperation alloc];
  if (self)
  {
    int v8 = self->_tagRecordSource;
    assetManager = self->_assetManager;
  }
  else
  {
    int v8 = 0;
    assetManager = 0;
  }
  __int16 v10 = [(FCTagsFetchOperation *)v7 initWithTagIDs:v6 tagRecordSource:v8 assetManager:assetManager delegate:self];

  [(FCFetchOperation *)v10 setCachePolicy:4];
  [(FCFetchOperation *)v10 setMaximumCachedAge:a4];
  [(FCTagsFetchOperation *)v10 setIncludeChildren:1];
  [(FCTagsFetchOperation *)v10 setOverrideChildrenCachePolicy:1];
  [(FCTagsFetchOperation *)v10 setChildrenCachePolicy:4];
  [(FCTagsFetchOperation *)v10 setChildrenMaximumCachedAge:a4];
  return v10;
}

uint64_t __85__FCTagController_fetchTagsForTagIDs_cachePolicy_qualityOfService_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

BOOL __85__FCTagController_fetchTagsForTagIDs_cachePolicy_qualityOfService_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = [v4 fetchDate];
  if (objc_msgSend(v5, "fc_isLaterThanOrEqualTo:", *(void *)(a1 + 32))) {
    BOOL v6 = +[FCTagController isTagAllowedForNewsVersion:v4];
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)fetchTagsForTagIDs:(id)a3 qualityOfService:(int64_t)a4 callbackQueue:(id)a5 completionHandler:(id)a6
{
  if (self) {
    -[FCTagController _fetchTagsForTagIDs:includeParents:includeChildren:qualityOfService:callbackQueue:completionHandler:](self, a3, 0, 0, a4, a5, a6);
  }
}

- (void)fetchTagsForTagIDs:(id)a3 includeParents:(BOOL)a4 includeChildren:(BOOL)a5 qualityOfService:(int64_t)a6 callbackQueue:(id)a7 completionHandler:(id)a8
{
}

- (void)_fetchTagsForTagIDs:(uint64_t)a3 includeParents:(uint64_t)a4 includeChildren:(uint64_t)a5 qualityOfService:(void *)a6 callbackQueue:(void *)a7 completionHandler:
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v13 = a2;
  __int16 v14 = a6;
  id v15 = a7;
  if (!a1) {
    goto LABEL_27;
  }
  if (v13 || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    if (v14) {
      goto LABEL_5;
    }
LABEL_23:
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v25 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "callbackQueue != nil");
      *(_DWORD *)buf = 136315906;
      long long v42 = "-[FCTagController _fetchTagsForTagIDs:includeParents:includeChildren:qualityOfService:callbackQueue:completionHandler:]";
      __int16 v43 = 2080;
      int v44 = "FCTagController.m";
      __int16 v45 = 1024;
      int v46 = 462;
      __int16 v47 = 2114;
      id v48 = v25;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
    if (v15) {
      goto LABEL_27;
    }
LABEL_26:
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      goto LABEL_27;
    }
    id v19 = (id)objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "completionHandler != nil");
    *(_DWORD *)buf = 136315906;
    long long v42 = "-[FCTagController _fetchTagsForTagIDs:includeParents:includeChildren:qualityOfService:callbackQueue:completionHandler:]";
    __int16 v43 = 2080;
    int v44 = "FCTagController.m";
    __int16 v45 = 1024;
    int v46 = 463;
    __int16 v47 = 2114;
    id v48 = v19;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    goto LABEL_21;
  }
  int v24 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "tagIDs != nil");
  *(_DWORD *)buf = 136315906;
  long long v42 = "-[FCTagController _fetchTagsForTagIDs:includeParents:includeChildren:qualityOfService:callbackQueue:completionHandler:]";
  __int16 v43 = 2080;
  int v44 = "FCTagController.m";
  __int16 v45 = 1024;
  int v46 = 461;
  __int16 v47 = 2114;
  id v48 = v24;
  _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  if (!v14) {
    goto LABEL_23;
  }
LABEL_5:
  if (!v15) {
    goto LABEL_26;
  }
  if ([v13 count])
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v17 = [MEMORY[0x1E4F1CA48] array];
    __int16 v18 = (void *)a1[5];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __119__FCTagController__fetchTagsForTagIDs_includeParents_includeChildren_qualityOfService_callbackQueue_completionHandler___block_invoke_4;
    v32[3] = &unk_1E5B4CC30;
    id v33 = v13;
    id v19 = v16;
    id v34 = v19;
    char v36 = a3;
    id v20 = v17;
    id v35 = v20;
    char v37 = a4;
    [v18 readWithAccessor:v32];
    if ([v20 count])
    {
      int v21 = [a1 fetchOperationForTagsWithIDs:v20];
      [v21 setIncludeParents:a3];
      [v21 setIncludeChildren:a4];
      [v21 setQualityOfService:a5];
      if (a5 == 9) {
        uint64_t v22 = -1;
      }
      else {
        uint64_t v22 = a5 == 33 || a5 == 25;
      }
      [v21 setRelativePriority:v22];
      [v21 setFetchCompletionQueue:v14];
      [v21 setCanSendFetchCompletionSynchronously:0];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __119__FCTagController__fetchTagsForTagIDs_includeParents_includeChildren_qualityOfService_callbackQueue_completionHandler___block_invoke_5;
      v29[3] = &unk_1E5B4CC58;
      id v30 = v19;
      id v31 = v15;
      [v21 setFetchCompletionBlock:v29];
      if ([MEMORY[0x1E4F29060] isMainThread])
      {
        v23 = objc_msgSend(MEMORY[0x1E4F28F08], "fc_sharedConcurrentQueue");
        [v23 addOperation:v21];
      }
      else
      {
        [v21 start];
      }
    }
    else
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __119__FCTagController__fetchTagsForTagIDs_includeParents_includeChildren_qualityOfService_callbackQueue_completionHandler___block_invoke_7;
      block[3] = &unk_1E5B4CC80;
      id v27 = v19;
      id v28 = v15;
      dispatch_async(v14, block);

      int v21 = v27;
    }

LABEL_21:
    goto LABEL_27;
  }
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __119__FCTagController__fetchTagsForTagIDs_includeParents_includeChildren_qualityOfService_callbackQueue_completionHandler___block_invoke_2;
  v38[3] = &unk_1E5B4C7C0;
  id v40 = v15;
  long long v39 = v14;
  __119__FCTagController__fetchTagsForTagIDs_includeParents_includeChildren_qualityOfService_callbackQueue_completionHandler___block_invoke_2((uint64_t)v38);

LABEL_27:
}

- (void)fetchTagForTagID:(id)a3 qualityOfService:(int64_t)a4 callbackQueue:(id)a5 completionHandler:(id)a6
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  __int16 v11 = a5;
  id v12 = a6;
  if (self)
  {
    if (v10)
    {
      v17[0] = v10;
      id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
      *(void *)block = MEMORY[0x1E4F143A8];
      *(void *)&block[8] = 3221225472;
      *(void *)&block[16] = __86__FCTagController__fetchTagForTagID_qualityOfService_callbackQueue_completionHandler___block_invoke;
      *(void *)&long long v16 = &unk_1E5B4CA60;
      *((void *)&v16 + 1) = v12;
      -[FCTagController _fetchTagsForTagIDs:includeParents:includeChildren:qualityOfService:callbackQueue:completionHandler:](self, v13, 0, 0, a4, v11, block);

LABEL_7:
      goto LABEL_8;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      __int16 v14 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "tagID != nil");
      *(_DWORD *)block = 136315906;
      *(void *)&void block[4] = "-[FCTagController _fetchTagForTagID:qualityOfService:callbackQueue:completionHandler:]";
      *(_WORD *)&block[12] = 2080;
      *(void *)&block[14] = "FCTagController.m";
      *(_WORD *)&block[22] = 1024;
      LODWORD(v16) = 435;
      WORD2(v16) = 2114;
      *(void *)((char *)&v16 + 6) = v14;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", block, 0x26u);

      if (!v12) {
        goto LABEL_8;
      }
      goto LABEL_6;
    }
    if (v12)
    {
LABEL_6:
      *(void *)block = MEMORY[0x1E4F143A8];
      *(void *)&block[8] = 3221225472;
      *(void *)&block[16] = __86__FCTagController__fetchTagForTagID_qualityOfService_callbackQueue_completionHandler___block_invoke_2;
      *(void *)&long long v16 = &unk_1E5B4CA88;
      *((void *)&v16 + 1) = v12;
      dispatch_async(v11, block);
      goto LABEL_7;
    }
  }
LABEL_8:
}

void __60__FCTagController_tagsForTagIDs_maximumCachedAge_predicate___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  double v9 = *(double *)(a1 + 48);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __60__FCTagController_tagsForTagIDs_maximumCachedAge_predicate___block_invoke_2;
  v13[3] = &unk_1E5B4CB70;
  id v10 = *(void **)(a1 + 32);
  id v15 = *(id *)(a1 + 40);
  id v16 = v8;
  id v14 = v7;
  id v11 = v7;
  id v12 = v8;
  [v10 fetchTagsForTagIDs:v11 maximumCachedAge:a3 qualityOfService:v13 completionHandler:v9];
}

void __60__FCTagController_tagsForTagIDs_maximumCachedAge_predicate___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__FCTagController_tagsForTagIDs_maximumCachedAge_predicate___block_invoke_3;
  v9[3] = &unk_1E5B4CB48;
  id v10 = v6;
  id v11 = v5;
  id v13 = a1[5];
  id v14 = a1[6];
  id v12 = a1[4];
  id v7 = v5;
  id v8 = v6;
  FCPerformBlockOnMainThread(v9);
}

void __60__FCTagController_tagsForTagIDs_maximumCachedAge_predicate___block_invoke_3(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_super v3 = (void *)FCDefaultLog;
    if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
    {
      id v10 = v3;
      id v11 = [v2 localizedDescription];
      *(_DWORD *)buf = 138543362;
      id v15 = v11;
      _os_log_error_impl(&dword_1A460D000, v10, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
    }
  }
  id v4 = *(id *)(a1 + 40);
  id v5 = *(void **)(a1 + 56);
  if (v5)
  {
    id v6 = *(void **)(a1 + 40);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __60__FCTagController_tagsForTagIDs_maximumCachedAge_predicate___block_invoke_43;
    v12[3] = &unk_1E5B4CB20;
    id v13 = v5;
    uint64_t v7 = objc_msgSend(v6, "fc_dictionaryByTransformingValuesWithBlock:", v12);

    id v4 = (id)v7;
  }
  uint64_t v8 = *(void *)(a1 + 64);
  double v9 = objc_msgSend(v4, "nf_objectsForKeysWithoutMarker:", *(void *)(a1 + 48));
  (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
}

id __60__FCTagController_tagsForTagIDs_maximumCachedAge_predicate___block_invoke_43(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  objc_super v3 = *(unsigned int (**)(uint64_t, id))(v2 + 16);
  id v4 = a2;
  if (v3(v2, v4)) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  return v6;
}

- (id)tagsForTagIDs:(id)a3 predicate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self)
  {
    if ([v6 count])
    {
      uint64_t v8 = [[FCArrayStream alloc] initWithArray:v6];
      double v9 = [FCTransformedResultsStream alloc];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __60__FCTagController_tagsForTagIDs_maximumCachedAge_predicate___block_invoke;
      v12[3] = &unk_1E5B4CB98;
      void v12[4] = self;
      uint64_t v14 = 0x7FEFFFFFFFFFFFFFLL;
      id v13 = v7;
      id v10 = [(FCTransformedResultsStream *)v9 initWithStream:v8 asyncTransformBlock:v12];
      self = [[FCStreamingResults alloc] initWithStream:v10];
    }
    else
    {
      self = 0;
    }
  }

  return self;
}

- (id)tagsForTagIDs:(id)a3
{
  return [(FCTagController *)self tagsForTagIDs:a3 predicate:&__block_literal_global_49_0];
}

uint64_t __33__FCTagController_tagsForTagIDs___block_invoke()
{
  return 1;
}

void __54__FCTagController__cachedTagsForTagIDs_fastCacheOnly___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = [FCTag alloc];
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    uint64_t v9 = *(void *)(v8 + 16);
  }
  else {
    uint64_t v9 = 0;
  }
  id v12 = [(FCTag *)v7 initWithTagRecord:v6 assetManager:v9 interestToken:v5];

  id v10 = *(void **)(a1 + 40);
  id v11 = [(FCTag *)v12 identifier];
  [v10 setObject:v12 forKey:v11];
}

void __86__FCTagController__fetchTagForTagID_qualityOfService_callbackQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
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

uint64_t __86__FCTagController__fetchTagForTagID_qualityOfService_callbackQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __119__FCTagController__fetchTagsForTagIDs_includeParents_includeChildren_qualityOfService_callbackQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 40);
  if (v1)
  {
    uint64_t v2 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __119__FCTagController__fetchTagsForTagIDs_includeParents_includeChildren_qualityOfService_callbackQueue_completionHandler___block_invoke_3;
    block[3] = &unk_1E5B4CA88;
    id v4 = v1;
    dispatch_async(v2, block);
  }
}

uint64_t __119__FCTagController__fetchTagsForTagIDs_includeParents_includeChildren_qualityOfService_callbackQueue_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __119__FCTagController__fetchTagsForTagIDs_includeParents_includeChildren_qualityOfService_callbackQueue_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v33;
    uint64_t v23 = *(void *)v33;
    id v24 = v4;
    do
    {
      uint64_t v8 = 0;
      uint64_t v25 = v6;
      do
      {
        if (*(void *)v33 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v32 + 1) + 8 * v8);
        id v10 = [v3 objectForKey:v9];
        if (v10)
        {
          [*(id *)(a1 + 40) setObject:v10 forKey:v9];
          id v11 = [v10 asSection];
          id v12 = [v11 parentID];

          if (*(unsigned char *)(a1 + 56) && v12)
          {
            id v13 = [v3 objectForKey:v12];
            if (v13) {
              [*(id *)(a1 + 40) setObject:v13 forKey:v12];
            }
            else {
              [*(id *)(a1 + 48) addObject:v12];
            }
          }
          uint64_t v14 = [v10 asChannel];
          id v15 = [v14 sectionIDs];

          if (*(unsigned char *)(a1 + 57) && [v15 count])
          {
            uint64_t v26 = v15;
            id v27 = v12;
            long long v30 = 0u;
            long long v31 = 0u;
            long long v28 = 0u;
            long long v29 = 0u;
            id v16 = v15;
            uint64_t v17 = [v16 countByEnumeratingWithState:&v28 objects:v36 count:16];
            if (v17)
            {
              uint64_t v18 = v17;
              uint64_t v19 = *(void *)v29;
              do
              {
                for (uint64_t i = 0; i != v18; ++i)
                {
                  if (*(void *)v29 != v19) {
                    objc_enumerationMutation(v16);
                  }
                  uint64_t v21 = *(void *)(*((void *)&v28 + 1) + 8 * i);
                  uint64_t v22 = [v3 objectForKey:v21];
                  if (v22) {
                    [*(id *)(a1 + 40) setObject:v22 forKey:v21];
                  }
                  else {
                    [*(id *)(a1 + 48) addObject:v21];
                  }
                }
                uint64_t v18 = [v16 countByEnumeratingWithState:&v28 objects:v36 count:16];
              }
              while (v18);
            }

            uint64_t v7 = v23;
            id v4 = v24;
            uint64_t v6 = v25;
            id v15 = v26;
            id v12 = v27;
          }
        }
        else
        {
          [*(id *)(a1 + 48) addObject:v9];
        }

        ++v8;
      }
      while (v8 != v6);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v6);
  }
}

void __119__FCTagController__fetchTagsForTagIDs_includeParents_includeChildren_qualityOfService_callbackQueue_completionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  id v8 = a2;
  if (![v8 status])
  {
    id v3 = [v8 fetchedObject];
    if (v3) {
      [*(id *)(a1 + 32) addEntriesFromDictionary:v3];
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "fc_removeObjectsForKeysPassingTest:", &__block_literal_global_60_0);
  uint64_t v6 = a1 + 32;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(v6 + 8);
  if ([v4 count])
  {
    (*(void (**)(uint64_t, void *, void))(v5 + 16))(v5, v4, 0);
  }
  else
  {
    uint64_t v7 = [v8 error];
    (*(void (**)(uint64_t, void *, void *))(v5 + 16))(v5, v4, v7);
  }
}

uint64_t __119__FCTagController__fetchTagsForTagIDs_includeParents_includeChildren_qualityOfService_callbackQueue_completionHandler___block_invoke_6()
{
  return +[FCTagController isTagAllowedForNewsVersion:](FCTagController, "isTagAllowedForNewsVersion:") ^ 1;
}

uint64_t __119__FCTagController__fetchTagsForTagIDs_includeParents_includeChildren_qualityOfService_callbackQueue_completionHandler___block_invoke_7(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "fc_removeObjectsForKeysPassingTest:", &__block_literal_global_62);
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

uint64_t __119__FCTagController__fetchTagsForTagIDs_includeParents_includeChildren_qualityOfService_callbackQueue_completionHandler___block_invoke_8()
{
  return +[FCTagController isTagAllowedForNewsVersion:](FCTagController, "isTagAllowedForNewsVersion:") ^ 1;
}

- (BOOL)shouldPrefetchGlobalTags
{
  if (self) {
    self = (FCTagController *)self->_tagPrefetchThrottler;
  }
  return [(FCTagController *)self suspended] ^ 1;
}

uint64_t __47__FCTagController_setShouldPrefetchGlobalTags___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    uint64_t v2 = *(void **)(v1 + 48);
  }
  else {
    uint64_t v2 = 0;
  }
  return [v2 tickle];
}

uint64_t __63__FCTagController_configurationManager_configurationDidChange___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    uint64_t v2 = *(void **)(v1 + 48);
  }
  else {
    uint64_t v2 = 0;
  }
  return [v2 tickle];
}

- (void)operationThrottler:(id)a3 performAsyncOperationWithCompletion:(id)a4
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (FCOperationThrottler *)a3;
  uint64_t v7 = (void (**)(void))a4;
  if ([MEMORY[0x1E4F29060] isMainThread]
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    long long v41 = (void *)[[NSString alloc] initWithFormat:@"This operation must not be performed on the main thread."];
    *(_DWORD *)buf = 136315906;
    id v48 = "-[FCTagController operationThrottler:performAsyncOperationWithCompletion:]";
    __int16 v49 = 2080;
    v50 = "FCTagController.m";
    __int16 v51 = 1024;
    int v52 = 658;
    __int16 v53 = 2114;
    v54 = v41;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (self) {
      goto LABEL_4;
    }
LABEL_17:
    if (v6) {
      goto LABEL_15;
    }
    configurationManager = 0;
    goto LABEL_6;
  }
  if (!self) {
    goto LABEL_17;
  }
LABEL_4:
  if (self->_tagPrefetchThrottler != v6) {
    goto LABEL_12;
  }
  configurationManager = self->_configurationManager;
LABEL_6:
  uint64_t v9 = [(FCCoreConfigurationManager *)configurationManager configuration];
  id v10 = [MEMORY[0x1E4F1CA80] set];
  id v11 = [v9 briefingsTagID];
  objc_msgSend(v10, "fc_safelyAddObject:", v11);

  id v12 = [v9 trendingTagID];
  objc_msgSend(v10, "fc_safelyAddObject:", v12);

  id v13 = [v9 featuredStoriesTagID];
  objc_msgSend(v10, "fc_safelyAddObject:", v13);

  uint64_t v14 = [v9 savedStoriesTagID];
  objc_msgSend(v10, "fc_safelyAddObject:", v14);

  id v15 = [v9 spotlightChannelID];
  objc_msgSend(v10, "fc_safelyAddObject:", v15);

  id v16 = [v9 myMagazinesTagID];
  objc_msgSend(v10, "fc_safelyAddObject:", v16);

  uint64_t v17 = [v9 mySportsTagID];
  objc_msgSend(v10, "fc_safelyAddObject:", v17);

  uint64_t v18 = [v9 sportsTopStoriesTagID];
  objc_msgSend(v10, "fc_safelyAddObject:", v18);

  uint64_t v19 = [v9 puzzlesConfig];
  id v20 = [v19 puzzleHubTagID];
  objc_msgSend(v10, "fc_safelyAddObject:", v20);

  uint64_t v21 = [v9 puzzlesConfig];
  uint64_t v22 = [v21 puzzleFullArchiveTagID];
  objc_msgSend(v10, "fc_safelyAddObject:", v22);

  uint64_t v23 = [v9 shortcutsTagID];
  objc_msgSend(v10, "fc_safelyAddObject:", v23);

  id v24 = [v9 mySportsScoresTagID];
  objc_msgSend(v10, "fc_safelyAddObject:", v24);

  uint64_t v25 = [v9 mySportsHighlightsTagID];
  objc_msgSend(v10, "fc_safelyAddObject:", v25);

  uint64_t v26 = [v9 sportScoresTagID];
  objc_msgSend(v10, "fc_safelyAddObject:", v26);

  id v27 = [v9 sportTeamScoresTagID];
  objc_msgSend(v10, "fc_safelyAddObject:", v27);

  long long v28 = [v9 sportLeagueScoresTagID];
  objc_msgSend(v10, "fc_safelyAddObject:", v28);

  long long v29 = [v9 sportsStandingsTagID];
  objc_msgSend(v10, "fc_safelyAddObject:", v29);

  long long v30 = [v9 sportsBracketTagID];
  objc_msgSend(v10, "fc_safelyAddObject:", v30);

  long long v31 = [v9 sportHighlightsTagID];
  objc_msgSend(v10, "fc_safelyAddObject:", v31);

  long long v32 = [v9 sportTeamHighlightsTagID];
  objc_msgSend(v10, "fc_safelyAddObject:", v32);

  long long v33 = [v9 sportLeagueHighlightsTagID];
  objc_msgSend(v10, "fc_safelyAddObject:", v33);

  long long v34 = [v9 sportEventHighlightsTagID];
  objc_msgSend(v10, "fc_safelyAddObject:", v34);

  if ([v10 count])
  {
    long long v35 = [v10 allObjects];
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __74__FCTagController_operationThrottler_performAsyncOperationWithCompletion___block_invoke;
    v45[3] = &unk_1E5B4CD48;
    v45[4] = self;
    int v46 = v7;
    if (self) {
      -[FCTagController _fetchTagsForTagIDs:includeParents:includeChildren:qualityOfService:callbackQueue:completionHandler:](self, v35, 0, 0, 9, MEMORY[0x1E4F14428], v45);
    }
  }
  else
  {
    v7[2](v7);
  }

  if (!self)
  {
    if (v6) {
      goto LABEL_15;
    }
    tagIDsNeedingRefresh = 0;
    goto LABEL_14;
  }
LABEL_12:
  if (self->_tagRefreshThrottler == v6)
  {
    tagIDsNeedingRefresh = self->_tagIDsNeedingRefresh;
LABEL_14:
    char v37 = tagIDsNeedingRefresh;
    uint64_t v38 = [(FCThreadSafeMutableSet *)v37 allObjects];

    long long v39 = [(FCTagController *)self fetchOperationForTagsWithIDs:v38];
    [v39 setQualityOfService:9];
    [v39 setRelativePriority:-1];
    [v39 setCachePolicy:4];
    [v39 setMaximumCachedAge:3600.0];
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __74__FCTagController_operationThrottler_performAsyncOperationWithCompletion___block_invoke_2;
    v42[3] = &unk_1E5B4CD70;
    v42[4] = self;
    id v43 = v38;
    int v44 = v7;
    id v40 = v38;
    [v39 setFetchCompletionBlock:v42];
    [v39 start];
  }
LABEL_15:
}

uint64_t __74__FCTagController_operationThrottler_performAsyncOperationWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (v3) {
      id v4 = *(void **)(v3 + 56);
    }
    else {
      id v4 = 0;
    }
    [v4 addEntriesFromDictionary:a2];
  }
  uint64_t v5 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v5();
}

uint64_t __74__FCTagController_operationThrottler_performAsyncOperationWithCompletion___block_invoke_2(void *a1)
{
  uint64_t v2 = a1[4];
  if (v2) {
    uint64_t v3 = *(void **)(v2 + 72);
  }
  else {
    uint64_t v3 = 0;
  }
  [v3 removeObjectsInArray:a1[5]];
  id v4 = *(uint64_t (**)(void))(a1[6] + 16);
  return v4();
}

- (id)jsonEncodableObject
{
  if (self) {
    self = (FCTagController *)self->_tagRecordSource;
  }
  return [(FCTagController *)self jsonEncodableObject];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tagIDsNeedingRefresh, 0);
  objc_storeStrong((id *)&self->_tagRefreshThrottler, 0);
  objc_storeStrong((id *)&self->_prefetchedTags, 0);
  objc_storeStrong((id *)&self->_tagPrefetchThrottler, 0);
  objc_storeStrong((id *)&self->_fastCache, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_tagRecordSource, 0);
  objc_storeStrong((id *)&self->_assetManager, 0);
  objc_storeStrong((id *)&self->_contentDatabase, 0);
}

@end