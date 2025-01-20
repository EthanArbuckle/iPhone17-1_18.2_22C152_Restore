@interface FCTagsFetchOperation
- (BOOL)includeChildren;
- (BOOL)includeParents;
- (BOOL)overrideChildrenCachePolicy;
- (BOOL)overrideTargetsCachePolicy;
- (FCTagsFetchOperation)initWithTagIDs:(id)a3 tagRecordSource:(id)a4 assetManager:(id)a5 delegate:(id)a6;
- (double)childrenMaximumCachedAge;
- (double)targetsMaximumCachedAge;
- (id)completeFetchOperation;
- (id)fetchChildTagRecordsWithCompletion:(id)a3;
- (id)fetchParentTagRecordsWithCompletion:(id)a3;
- (id)fetchTagRecordsWithCompletion:(id)a3;
- (unint64_t)childrenCachePolicy;
- (unint64_t)targetsCachePolicy;
- (void)customizeChildOperation:(id)a3 forFetchStep:(SEL)a4;
- (void)setChildrenCachePolicy:(unint64_t)a3;
- (void)setChildrenMaximumCachedAge:(double)a3;
- (void)setIncludeChildren:(BOOL)a3;
- (void)setIncludeParents:(BOOL)a3;
- (void)setOverrideChildrenCachePolicy:(BOOL)a3;
- (void)setOverrideTargetsCachePolicy:(BOOL)a3;
- (void)setTargetsCachePolicy:(unint64_t)a3;
- (void)setTargetsMaximumCachedAge:(double)a3;
@end

@implementation FCTagsFetchOperation

- (FCTagsFetchOperation)initWithTagIDs:(id)a3 tagRecordSource:(id)a4 assetManager:(id)a5 delegate:(id)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v10 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v18 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "tagIDs");
    *(_DWORD *)buf = 136315906;
    v23 = "-[FCTagsFetchOperation initWithTagIDs:tagRecordSource:assetManager:delegate:]";
    __int16 v24 = 2080;
    v25 = "FCTagsFetchOperation.m";
    __int16 v26 = 1024;
    int v27 = 41;
    __int16 v28 = 2114;
    v29 = v18;
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
    v19 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "assetManager");
    *(_DWORD *)buf = 136315906;
    v23 = "-[FCTagsFetchOperation initWithTagIDs:tagRecordSource:assetManager:delegate:]";
    __int16 v24 = 2080;
    v25 = "FCTagsFetchOperation.m";
    __int16 v26 = 1024;
    int v27 = 42;
    __int16 v28 = 2114;
    v29 = v19;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  if (!v11 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v20 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "tagRecordSource");
    *(_DWORD *)buf = 136315906;
    v23 = "-[FCTagsFetchOperation initWithTagIDs:tagRecordSource:assetManager:delegate:]";
    __int16 v24 = 2080;
    v25 = "FCTagsFetchOperation.m";
    __int16 v26 = 1024;
    int v27 = 43;
    __int16 v28 = 2114;
    v29 = v20;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v21.receiver = self;
  v21.super_class = (Class)FCTagsFetchOperation;
  v14 = [(FCMultiStepFetchOperation *)&v21 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    tagIDs = v14->_tagIDs;
    v14->_tagIDs = (NSArray *)v15;

    objc_storeStrong((id *)&v14->_assetManager, a5);
    objc_storeStrong((id *)&v14->_tagRecordSource, a4);
    objc_storeWeak((id *)&v14->_delegate, v13);
    [(FCMultiStepFetchOperation *)v14 addFetchStep:sel_fetchTagRecordsWithCompletion_];
    [(FCMultiStepFetchOperation *)v14 addFetchStep:sel_fetchParentTagRecordsWithCompletion_];
    [(FCMultiStepFetchOperation *)v14 addFetchStep:sel_fetchChildTagRecordsWithCompletion_];
  }

  return v14;
}

void __54__FCTagsFetchOperation_fetchTagRecordsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  v3 = [v5 fetchedObject];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    objc_storeStrong((id *)(v4 + 488), v3);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)fetchTagRecordsWithCompletion:(id)a3
{
  id v4 = a3;
  if (self)
  {
    id v5 = self->_tagRecordSource;
    tagIDs = self->_tagIDs;
  }
  else
  {
    id v5 = 0;
    tagIDs = 0;
  }
  v7 = [(FCRecordSource *)v5 fetchOperationForRecordsWithIDs:tagIDs];

  objc_msgSend(v7, "setCachePolicy:", -[FCFetchOperation cachePolicy](self, "cachePolicy"));
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __54__FCTagsFetchOperation_fetchTagRecordsWithCompletion___block_invoke;
  v10[3] = &unk_1E5B4CC58;
  v10[4] = self;
  id v11 = v4;
  id v8 = v4;
  [v7 setFetchCompletionBlock:v10];

  return v7;
}

void __46__FCTagsFetchOperation_completeFetchOperation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  v7 = [FCTag alloc];
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    uint64_t v9 = *(void *)(v8 + 520);
  }
  else {
    uint64_t v9 = 0;
  }
  id v12 = [(FCTag *)v7 initWithTagRecord:v6 assetManager:v9 interestToken:v5];

  id v10 = *(void **)(a1 + 40);
  id v11 = [(FCTag *)v12 identifier];
  [v10 setObject:v12 forKey:v11];
}

- (void)customizeChildOperation:(id)a3 forFetchStep:(SEL)a4
{
  id v6 = a3;
  v7.receiver = self;
  v7.super_class = (Class)FCTagsFetchOperation;
  [(FCMultiStepFetchOperation *)&v7 customizeChildOperation:v6 forFetchStep:a4];
  if (sel_fetchTagRecordsWithCompletion_ == a4
    && [(FCTagsFetchOperation *)self overrideTargetsCachePolicy])
  {
    objc_msgSend(v6, "setCachePolicy:", -[FCTagsFetchOperation targetsCachePolicy](self, "targetsCachePolicy"));
    [(FCTagsFetchOperation *)self targetsMaximumCachedAge];
LABEL_7:
    objc_msgSend(v6, "setMaximumCachedAge:");
    goto LABEL_8;
  }
  if (sel_fetchChildTagRecordsWithCompletion_ == a4
    && [(FCTagsFetchOperation *)self overrideChildrenCachePolicy])
  {
    objc_msgSend(v6, "setCachePolicy:", -[FCTagsFetchOperation childrenCachePolicy](self, "childrenCachePolicy"));
    [(FCTagsFetchOperation *)self childrenMaximumCachedAge];
    goto LABEL_7;
  }
LABEL_8:
}

- (BOOL)overrideTargetsCachePolicy
{
  return self->_overrideTargetsCachePolicy;
}

- (id)completeFetchOperation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self) {
    heldTagRecords = self->_heldTagRecords;
  }
  else {
    heldTagRecords = 0;
  }
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __46__FCTagsFetchOperation_completeFetchOperation__block_invoke;
  v22[3] = &unk_1E5B4CC08;
  v22[4] = self;
  id v5 = v3;
  id v23 = v5;
  [(FCHeldRecords *)heldTagRecords enumerateRecordsAndInterestTokensWithBlock:v22];
  if (self) {
    heldParentTagRecords = self->_heldParentTagRecords;
  }
  else {
    heldParentTagRecords = 0;
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __46__FCTagsFetchOperation_completeFetchOperation__block_invoke_2;
  v20[3] = &unk_1E5B4CC08;
  v20[4] = self;
  id v7 = v5;
  id v21 = v7;
  [(FCHeldRecords *)heldParentTagRecords enumerateRecordsAndInterestTokensWithBlock:v20];
  if (self) {
    heldChildTagRecords = self->_heldChildTagRecords;
  }
  else {
    heldChildTagRecords = 0;
  }
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  v16 = __46__FCTagsFetchOperation_completeFetchOperation__block_invoke_3;
  v17 = &unk_1E5B4CC08;
  v18 = self;
  id v9 = v7;
  id v19 = v9;
  [(FCHeldRecords *)heldChildTagRecords enumerateRecordsAndInterestTokensWithBlock:&v14];
  if (self)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained)
    {
      id v11 = objc_msgSend(v9, "allValues", v14, v15, v16, v17, v18);
      [WeakRetained tagsFetchOperation:self didFetchTags:v11];
    }
  }
  else
  {
    id WeakRetained = 0;
  }
  id v12 = v9;

  return v12;
}

- (id)fetchChildTagRecordsWithCompletion:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  if ([(FCTagsFetchOperation *)self includeChildren])
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    if (self) {
      heldTagRecords = self->_heldTagRecords;
    }
    else {
      heldTagRecords = 0;
    }
    id v7 = [(FCHeldRecords *)heldTagRecords allRecords];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = [*(id *)(*((void *)&v19 + 1) + 8 * i) channelSectionIDs];
          [v5 addObjectsFromArray:v12];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v9);
    }
  }
  if ([v5 count])
  {
    if (self) {
      tagRecordSource = self->_tagRecordSource;
    }
    else {
      tagRecordSource = 0;
    }
    uint64_t v14 = [(FCRecordSource *)tagRecordSource fetchOperationForRecordsWithIDs:v5];
    objc_msgSend(v14, "setCachePolicy:", -[FCFetchOperation cachePolicy](self, "cachePolicy"));
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __59__FCTagsFetchOperation_fetchChildTagRecordsWithCompletion___block_invoke;
    v17[3] = &unk_1E5B4CC58;
    v17[4] = self;
    id v18 = v4;
    [v14 setFetchCompletionBlock:v17];
    id v15 = v14;
  }
  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
    id v15 = 0;
  }

  return v15;
}

- (BOOL)includeChildren
{
  return self->_includeChildren;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_assetManager, 0);
  objc_storeStrong((id *)&self->_tagRecordSource, 0);
  objc_storeStrong((id *)&self->_heldChildTagRecords, 0);
  objc_storeStrong((id *)&self->_heldParentTagRecords, 0);
  objc_storeStrong((id *)&self->_heldTagRecords, 0);
  objc_storeStrong((id *)&self->_tagIDs, 0);
}

- (id)fetchParentTagRecordsWithCompletion:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  if ([(FCTagsFetchOperation *)self includeParents])
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    if (self) {
      heldTagRecords = self->_heldTagRecords;
    }
    else {
      heldTagRecords = 0;
    }
    id v7 = [(FCHeldRecords *)heldTagRecords allRecords];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = [*(id *)(*((void *)&v19 + 1) + 8 * i) parentID];
          if (v12) {
            [v5 addObject:v12];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v9);
    }
  }
  if ([v5 count])
  {
    if (self) {
      tagRecordSource = self->_tagRecordSource;
    }
    else {
      tagRecordSource = 0;
    }
    uint64_t v14 = [(FCRecordSource *)tagRecordSource fetchOperationForRecordsWithIDs:v5];
    objc_msgSend(v14, "setCachePolicy:", -[FCFetchOperation cachePolicy](self, "cachePolicy"));
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __60__FCTagsFetchOperation_fetchParentTagRecordsWithCompletion___block_invoke;
    v17[3] = &unk_1E5B4CC58;
    v17[4] = self;
    id v18 = v4;
    [v14 setFetchCompletionBlock:v17];
    id v15 = v14;
  }
  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
    id v15 = 0;
  }

  return v15;
}

- (BOOL)includeParents
{
  return self->_includeParents;
}

void __60__FCTagsFetchOperation_fetchParentTagRecordsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  v3 = [v5 fetchedObject];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    objc_storeStrong((id *)(v4 + 496), v3);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __59__FCTagsFetchOperation_fetchChildTagRecordsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  v3 = [v5 fetchedObject];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    objc_storeStrong((id *)(v4 + 504), v3);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __46__FCTagsFetchOperation_completeFetchOperation__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = [FCTag alloc];
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    uint64_t v9 = *(void *)(v8 + 520);
  }
  else {
    uint64_t v9 = 0;
  }
  id v12 = [(FCTag *)v7 initWithTagRecord:v6 assetManager:v9 interestToken:v5];

  uint64_t v10 = *(void **)(a1 + 40);
  id v11 = [(FCTag *)v12 identifier];
  [v10 setObject:v12 forKey:v11];
}

void __46__FCTagsFetchOperation_completeFetchOperation__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = [FCTag alloc];
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    uint64_t v9 = *(void *)(v8 + 520);
  }
  else {
    uint64_t v9 = 0;
  }
  id v12 = [(FCTag *)v7 initWithTagRecord:v6 assetManager:v9 interestToken:v5];

  uint64_t v10 = *(void **)(a1 + 40);
  id v11 = [(FCTag *)v12 identifier];
  [v10 setObject:v12 forKey:v11];
}

- (void)setIncludeChildren:(BOOL)a3
{
  self->_includeChildren = a3;
}

- (void)setIncludeParents:(BOOL)a3
{
  self->_includeParents = a3;
}

- (void)setOverrideTargetsCachePolicy:(BOOL)a3
{
  self->_overrideTargetsCachePolicy = a3;
}

- (unint64_t)targetsCachePolicy
{
  return self->_targetsCachePolicy;
}

- (void)setTargetsCachePolicy:(unint64_t)a3
{
  self->_targetsCachePolicy = a3;
}

- (double)targetsMaximumCachedAge
{
  return self->_targetsMaximumCachedAge;
}

- (void)setTargetsMaximumCachedAge:(double)a3
{
  self->_targetsMaximumCachedAge = a3;
}

- (BOOL)overrideChildrenCachePolicy
{
  return self->_overrideChildrenCachePolicy;
}

- (void)setOverrideChildrenCachePolicy:(BOOL)a3
{
  self->_overrideChildrenCachePolicy = a3;
}

- (unint64_t)childrenCachePolicy
{
  return self->_childrenCachePolicy;
}

- (void)setChildrenCachePolicy:(unint64_t)a3
{
  self->_childrenCachePolicy = a3;
}

- (double)childrenMaximumCachedAge
{
  return self->_childrenMaximumCachedAge;
}

- (void)setChildrenMaximumCachedAge:(double)a3
{
  self->_childrenMaximumCachedAge = a3;
}

@end