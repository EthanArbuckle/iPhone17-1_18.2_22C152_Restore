@interface FCResourcesFetchOperation
- (BOOL)validateOperation;
- (FCResourcesFetchOperation)init;
- (FCResourcesFetchOperation)initWithContext:(id)a3 resourceIDs:(id)a4 downloadAssets:(BOOL)a5;
- (id)archiveHandler;
- (id)completeFetchOperation;
- (id)downloadAssetsWithCompletion:(id)a3;
- (id)fetchResourcesWithCompletion:(id)a3;
- (id)interestTokenHandler;
- (id)progressHandler;
- (int64_t)cacheLifetimeHint;
- (unint64_t)maxConcurrentFetchCount;
- (void)operationWillFinishWithError:(id)a3;
- (void)setArchiveHandler:(id)a3;
- (void)setCacheLifetimeHint:(int64_t)a3;
- (void)setInterestTokenHandler:(id)a3;
- (void)setMaxConcurrentFetchCount:(unint64_t)a3;
- (void)setProgressHandler:(id)a3;
- (void)setResources:(uint64_t)a1;
@end

@implementation FCResourcesFetchOperation

FCResource *__58__FCResourcesFetchOperation_fetchResourcesWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [FCResource alloc];
  uint64_t v5 = [*(id *)(a1 + 32) cacheLifetimeHint];
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    uint64_t v7 = *(void *)(v6 + 488);
  }
  else {
    uint64_t v7 = 0;
  }
  v8 = [(FCResource *)v4 initWithPermanentURLForResourceID:v3 cacheLifetimeHint:v5 contentContext:v7];

  return v8;
}

- (int64_t)cacheLifetimeHint
{
  return self->_cacheLifetimeHint;
}

- (FCResourcesFetchOperation)initWithContext:(id)a3 resourceIDs:(id)a4 downloadAssets:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FCResourcesFetchOperation;
  v11 = [(FCMultiStepFetchOperation *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_context, a3);
    objc_storeStrong((id *)&v12->_resourceIDs, a4);
    v12->_downloadAssets = a5;
    v12->_cacheLifetimeHint = 0;
    [(FCMultiStepFetchOperation *)v12 addFetchStep:sel_fetchResourcesWithCompletion_];
    [(FCMultiStepFetchOperation *)v12 addFetchStep:sel_downloadAssetsWithCompletion_];
  }

  return v12;
}

- (id)downloadAssetsWithCompletion:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  if (self && self->_downloadAssets)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v6 = self->_resources;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          v12 = objc_msgSend(v11, "assetHandle", (void)v18);

          if (v12)
          {
            v13 = [v11 assetHandle];
            [v5 addObject:v13];
          }
        }
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v8);
    }
  }
  objc_super v14 = [[FCAssetsFetchOperation alloc] initWithAssetHandles:v5];
  [(FCAssetsFetchOperation *)v14 setMaxConcurrentFetchCount:[(FCResourcesFetchOperation *)self maxConcurrentFetchCount]];
  v15 = [(FCResourcesFetchOperation *)self progressHandler];
  [(FCAssetsFetchOperation *)v14 setProgressHandler:v15];

  [(FCFetchOperation *)v14 setFetchCompletionBlock:v4];
  v16 = [(FCResourcesFetchOperation *)self interestTokenHandler];
  [(FCAssetsFetchOperation *)v14 setInterestTokenHandler:v16];

  return v14;
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (unint64_t)maxConcurrentFetchCount
{
  return self->_maxConcurrentFetchCount;
}

- (BOOL)validateOperation
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)FCResourcesFetchOperation;
  BOOL v2 = [(FCOperation *)&v5 validateOperation];
  if (!v2 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v4 = (void *)[[NSString alloc] initWithFormat:@"resources fetch operation's superclass failed validation"];
    *(_DWORD *)buf = 136315906;
    uint64_t v7 = "-[FCResourcesFetchOperation validateOperation]";
    __int16 v8 = 2080;
    uint64_t v9 = "FCResourcesFetchOperation.m";
    __int16 v10 = 1024;
    int v11 = 66;
    __int16 v12 = 2114;
    v13 = v4;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  return v2;
}

- (void)operationWillFinishWithError:(id)a3
{
  if (!a3)
  {
    id v4 = [(FCResourcesFetchOperation *)self archiveHandler];

    if (v4)
    {
      uint64_t v7 = [(FCResourcesFetchOperation *)self archiveHandler];
      if (self) {
        resources = self->_resources;
      }
      else {
        resources = 0;
      }
      uint64_t v6 = [(NSArray *)resources contentArchive];
      v7[2](v7, v6);
    }
  }
}

- (id)completeFetchOperation
{
  if (self) {
    self = (FCResourcesFetchOperation *)self->_resources;
  }
  return self;
}

- (id)archiveHandler
{
  return self->_archiveHandler;
}

FCResource *__58__FCResourcesFetchOperation_fetchResourcesWithCompletion___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void **)(a1 + 32);
  id v7 = a2;
  __int16 v8 = [v6 interestTokenHandler];

  if (v8)
  {
    uint64_t v9 = [*(id *)(a1 + 32) interestTokenHandler];
    ((void (**)(void, id))v9)[2](v9, v5);
  }
  __int16 v10 = [FCResource alloc];
  uint64_t v11 = *(void *)(a1 + 32);
  if (v11) {
    __int16 v12 = *(void **)(v11 + 488);
  }
  else {
    __int16 v12 = 0;
  }
  v13 = [v12 assetManager];
  uint64_t v14 = [(FCResource *)v10 initWithRecord:v7 interestToken:v5 assetManager:v13];

  return v14;
}

- (id)interestTokenHandler
{
  return self->_interestTokenHandler;
}

uint64_t __58__FCResourcesFetchOperation_fetchResourcesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  if (v2)
  {
    if (qword_1EB5D0E18 != -1) {
      dispatch_once(&qword_1EB5D0E18, &__block_literal_global_91);
    }
    if (_MergedGlobals_1)
    {
      uint64_t v2 = 0;
    }
    else
    {
      id v4 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v3];
      uint64_t v2 = v4 != 0;
    }
  }

  return v2;
}

- (id)fetchResourcesWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__39;
  v31 = __Block_byref_object_dispose__39;
  id v32 = 0;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__39;
  v25 = __Block_byref_object_dispose__39;
  id v26 = 0;
  if (self) {
    resourceIDs = self->_resourceIDs;
  }
  else {
    resourceIDs = 0;
  }
  uint64_t v6 = resourceIDs;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __58__FCResourcesFetchOperation_fetchResourcesWithCompletion___block_invoke;
  v20[3] = &unk_1E5B55DA0;
  v20[4] = self;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __58__FCResourcesFetchOperation_fetchResourcesWithCompletion___block_invoke_2;
  v19[3] = &unk_1E5B50690;
  v19[4] = &v27;
  v19[5] = &v21;
  [(NSArray *)v6 fc_splitArrayWithTest:v20 result:v19];

  id v7 = (void *)v28[5];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __58__FCResourcesFetchOperation_fetchResourcesWithCompletion___block_invoke_3;
  v18[3] = &unk_1E5B55DC8;
  v18[4] = self;
  __int16 v8 = objc_msgSend(v7, "fc_arrayByTransformingWithBlock:", v18);
  if ([(id)v22[5] count])
  {
    if (self) {
      context = self->_context;
    }
    else {
      context = 0;
    }
    __int16 v10 = context;
    uint64_t v11 = [(FCContentContext *)v10 internalContentContext];
    __int16 v12 = [v11 resourceRecordSource];
    v13 = [v12 fetchOperationForRecordsWithIDs:v22[5]];

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __58__FCResourcesFetchOperation_fetchResourcesWithCompletion___block_invoke_4;
    v15[3] = &unk_1E5B4CD70;
    v15[4] = self;
    id v16 = v8;
    id v17 = v4;
    [v13 setFetchCompletionBlock:v15];

    if (v13) {
      goto LABEL_10;
    }
  }
  else
  {
    -[FCResourcesFetchOperation setResources:]((uint64_t)self, v8);
  }
  (*((void (**)(id, void))v4 + 2))(v4, 0);
  v13 = 0;
LABEL_10:

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v13;
}

void __58__FCResourcesFetchOperation_fetchResourcesWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void __65__FCResourcesFetchOperation__shouldUsePermanentURLForResourceID___block_invoke()
{
  NewsCoreUserDefaults();
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  _MergedGlobals_1 = [v0 BOOLForKey:@"disable_permanent_resource_urls"];
}

- (void)setCacheLifetimeHint:(int64_t)a3
{
  self->_cacheLifetimeHint = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resources, 0);
  objc_storeStrong((id *)&self->_resourceIDs, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong(&self->_archiveHandler, 0);
  objc_storeStrong(&self->_interestTokenHandler, 0);
  objc_storeStrong(&self->_progressHandler, 0);
}

void __58__FCResourcesFetchOperation_fetchResourcesWithCompletion___block_invoke_4(uint64_t *a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 fetchedObject];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__FCResourcesFetchOperation_fetchResourcesWithCompletion___block_invoke_5;
  v7[3] = &unk_1E5B55DF0;
  v7[4] = a1[4];
  id v5 = [v4 transformRecordsWithBlock:v7];

  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1C978], "fc_arrayByAddingObjectsFromArray:toArray:", v5, a1[5]);
  -[FCResourcesFetchOperation setResources:](a1[4], v6);

  (*(void (**)(void))(a1[6] + 16))();
}

- (void)setResources:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 504), a2);
  }
}

- (FCResourcesFetchOperation)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    id v8 = "-[FCResourcesFetchOperation init]";
    __int16 v9 = 2080;
    __int16 v10 = "FCResourcesFetchOperation.m";
    __int16 v11 = 1024;
    int v12 = 40;
    __int16 v13 = 2114;
    uint64_t v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCResourcesFetchOperation init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (void)setMaxConcurrentFetchCount:(unint64_t)a3
{
  self->_maxConcurrentFetchCount = a3;
}

- (void)setProgressHandler:(id)a3
{
}

- (void)setInterestTokenHandler:(id)a3
{
}

- (void)setArchiveHandler:(id)a3
{
}

@end