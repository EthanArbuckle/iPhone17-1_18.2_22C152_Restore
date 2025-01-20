@interface FCFlintResourceManager
- (FCFlintResourceManager)init;
- (FCFlintResourceManager)initWithContext:(id)a3;
- (FCResourcesFetchOperation)fetchResourcesWithIdentifiers:(uint64_t)a3 downloadAssets:(uint64_t)a4 cacheLifetimeHint:(uint64_t)a5 relativePriority:(void *)a6 callBackQueue:(void *)a7 completionBlock:;
- (id)cachedResourceWithIdentifier:(id)a3;
- (id)cachedResourcesWithIdentifiers:(id)a3;
- (id)fetchFontResourcesWithIdentifiers:(id)a3 downloadAssets:(BOOL)a4 relativePriority:(int64_t)a5 completionBlock:(id)a6;
- (id)fetchResourcesWithIdentifiers:(id)a3 downloadAssets:(BOOL)a4 relativePriority:(int64_t)a5 callBackQueue:(id)a6 completionBlock:(id)a7;
@end

@implementation FCFlintResourceManager

- (FCFlintResourceManager)initWithContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCFlintResourceManager;
  v6 = [(FCFlintResourceManager *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_context, a3);
  }

  return v7;
}

void __136__FCFlintResourceManager_fetchResourcesWithIdentifiers_downloadAssets_cacheLifetimeHint_relativePriority_callBackQueue_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 status])
  {
    v4 = [v3 error];
    id v5 = 0;
  }
  else
  {
    uint64_t v16 = a1;
    id v5 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v17 = v3;
    v6 = [v3 fetchedObject];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v30 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v19;
      v10 = MEMORY[0x1E4F14500];
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v6);
          }
          v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          v13 = [v12 resourceID];

          if (!v13 && os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            v15 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "resource.resourceID");
            *(_DWORD *)buf = 136315906;
            v23 = "-[FCFlintResourceManager fetchResourcesWithIdentifiers:downloadAssets:cacheLifetimeHint:relativePriori"
                  "ty:callBackQueue:completionBlock:]_block_invoke";
            __int16 v24 = 2080;
            v25 = "FCFlintResourceManager.m";
            __int16 v26 = 1024;
            int v27 = 131;
            __int16 v28 = 2114;
            v29 = v15;
            _os_log_error_impl(&dword_1A460D000, v10, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
          }
          v14 = [v12 resourceID];
          [v5 setObject:v12 forKey:v14];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v30 count:16];
      }
      while (v8);
    }

    v4 = 0;
    a1 = v16;
    id v3 = v17;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (FCResourcesFetchOperation)fetchResourcesWithIdentifiers:(uint64_t)a3 downloadAssets:(uint64_t)a4 cacheLifetimeHint:(uint64_t)a5 relativePriority:(void *)a6 callBackQueue:(void *)a7 completionBlock:
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v13 = a2;
  id v14 = a6;
  id v15 = a7;
  if (!a1)
  {
    uint64_t v16 = 0;
    goto LABEL_13;
  }
  if (!v13 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    long long v21 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "resourceIdentifiers");
    *(_DWORD *)buf = 136315906;
    __int16 v26 = "-[FCFlintResourceManager fetchResourcesWithIdentifiers:downloadAssets:cacheLifetimeHint:relativePriority:callB"
          "ackQueue:completionBlock:]";
    __int16 v27 = 2080;
    __int16 v28 = "FCFlintResourceManager.m";
    __int16 v29 = 1024;
    int v30 = 111;
    __int16 v31 = 2114;
    v32 = v21;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (!v15)
    {
LABEL_5:
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v22 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "completionBlock");
        *(_DWORD *)buf = 136315906;
        __int16 v26 = "-[FCFlintResourceManager fetchResourcesWithIdentifiers:downloadAssets:cacheLifetimeHint:relativePriority:c"
              "allBackQueue:completionBlock:]";
        __int16 v27 = 2080;
        __int16 v28 = "FCFlintResourceManager.m";
        __int16 v29 = 1024;
        int v30 = 112;
        __int16 v31 = 2114;
        v32 = v22;
        _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
      }
    }
  }
  else if (!v15)
  {
    goto LABEL_5;
  }
  uint64_t v16 = [[FCResourcesFetchOperation alloc] initWithContext:*(void *)(a1 + 8) resourceIDs:v13 downloadAssets:a3];
  [(FCOperation *)v16 setPurpose:@"article"];
  [(FCResourcesFetchOperation *)v16 setCacheLifetimeHint:a4];
  uint64_t v17 = 25;
  if (!a5) {
    uint64_t v17 = 17;
  }
  if (a5 == -1) {
    uint64_t v18 = 9;
  }
  else {
    uint64_t v18 = v17;
  }
  [(FCOperation *)v16 setQualityOfService:v18];
  [(FCOperation *)v16 setRelativePriority:a5];
  [(FCFetchOperation *)v16 setFetchCompletionQueue:v14];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __136__FCFlintResourceManager_fetchResourcesWithIdentifiers_downloadAssets_cacheLifetimeHint_relativePriority_callBackQueue_completionBlock___block_invoke;
  v23[3] = &unk_1E5B4CAF8;
  id v24 = v15;
  [(FCFetchOperation *)v16 setFetchCompletionBlock:v23];
  long long v19 = objc_msgSend(MEMORY[0x1E4F28F08], "fc_sharedConcurrentQueue");
  [v19 addOperation:v16];

LABEL_13:
  return v16;
}

- (id)fetchResourcesWithIdentifiers:(id)a3 downloadAssets:(BOOL)a4 relativePriority:(int64_t)a5 callBackQueue:(id)a6 completionBlock:(id)a7
{
  return -[FCFlintResourceManager fetchResourcesWithIdentifiers:downloadAssets:cacheLifetimeHint:relativePriority:callBackQueue:completionBlock:]((uint64_t)self, a3, a4, 0, a5, a6, a7);
}

- (id)fetchFontResourcesWithIdentifiers:(id)a3 downloadAssets:(BOOL)a4 relativePriority:(int64_t)a5 completionBlock:(id)a6
{
  return -[FCFlintResourceManager fetchResourcesWithIdentifiers:downloadAssets:cacheLifetimeHint:relativePriority:callBackQueue:completionBlock:]((uint64_t)self, a3, a4, 1, a5, 0, a6);
}

- (FCFlintResourceManager)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    uint64_t v8 = "-[FCFlintResourceManager init]";
    __int16 v9 = 2080;
    v10 = "FCFlintResourceManager.m";
    __int16 v11 = 1024;
    int v12 = 31;
    __int16 v13 = 2114;
    id v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCFlintResourceManager init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (id)cachedResourcesWithIdentifiers:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    __int16 v11 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "resourceIdentifiers");
    *(_DWORD *)buf = 136315906;
    __int16 v13 = "-[FCFlintResourceManager cachedResourcesWithIdentifiers:]";
    __int16 v14 = 2080;
    uint64_t v15 = "FCFlintResourceManager.m";
    __int16 v16 = 1024;
    int v17 = 80;
    __int16 v18 = 2114;
    long long v19 = v11;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v5 = [FCResourcesFetchOperation alloc];
  if (self) {
    context = self->_context;
  }
  else {
    context = 0;
  }
  uint64_t v7 = [(FCResourcesFetchOperation *)v5 initWithContext:context resourceIDs:v4 downloadAssets:0];
  [(FCOperation *)v7 setPurpose:@"article"];
  [(FCFetchOperation *)v7 setCachePolicy:3];
  [(FCFetchOperation *)v7 setCanSendFetchCompletionSynchronously:1];
  [(FCOperation *)v7 start];
  [(FCResourcesFetchOperation *)v7 waitUntilFinished];
  uint64_t v8 = [(FCFetchOperation *)v7 result];
  __int16 v9 = [v8 fetchedObject];

  return v9;
}

- (id)cachedResourceWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [FCResource alloc];
  if (self) {
    context = self->_context;
  }
  else {
    context = 0;
  }
  uint64_t v7 = [(FCResource *)v5 initWithPermanentURLForResourceID:v4 cacheLifetimeHint:0 contentContext:context];

  return v7;
}

- (void).cxx_destruct
{
}

@end