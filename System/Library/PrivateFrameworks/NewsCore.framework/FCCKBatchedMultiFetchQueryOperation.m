@interface FCCKBatchedMultiFetchQueryOperation
- (BOOL)validateOperation;
- (FCCKBatchedMultiFetchQueryOperation)init;
- (id)networkEvents;
- (void)_continueFetching;
- (void)operationWillFinishWithError:(id)a3;
- (void)prepareOperation;
- (void)setDatabase:(uint64_t)a1;
- (void)setKnownRecordIDsToEtags:(uint64_t)a1;
- (void)setRecordIDs:(uint64_t)a1;
- (void)setRecordSpecs:(uint64_t)a1;
@end

@implementation FCCKBatchedMultiFetchQueryOperation

- (BOOL)validateOperation
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!self || (database = self->_database) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v5 = (void *)[[NSString alloc] initWithFormat:@"fetch operation must have a database"];
      int v6 = 136315906;
      v7 = "-[FCCKBatchedMultiFetchQueryOperation validateOperation]";
      __int16 v8 = 2080;
      v9 = "FCCKBatchedMultiFetchQueryOperation.m";
      __int16 v10 = 1024;
      int v11 = 57;
      __int16 v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v6, 0x26u);

      if (self) {
        goto LABEL_5;
      }
    }
    else if (self)
    {
LABEL_5:
      database = self->_database;
      return database != 0;
    }
    database = 0;
  }
  return database != 0;
}

void __56__FCCKBatchedMultiFetchQueryOperation__continueFetching__block_invoke_5(uint64_t a1)
{
}

- (void)setRecordSpecs:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 392), a2);
  }
}

- (void)setRecordIDs:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 384), a2);
  }
}

- (void)setDatabase:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 376), a2);
  }
}

- (FCCKBatchedMultiFetchQueryOperation)init
{
  v14.receiver = self;
  v14.super_class = (Class)FCCKBatchedMultiFetchQueryOperation;
  v2 = [(FCOperation *)&v14 init];
  if (v2)
  {
    v3 = objc_alloc_init(FCThreadSafeMutableArray);
    remainingRecordIDBatches = v2->_remainingRecordIDBatches;
    v2->_remainingRecordIDBatches = v3;

    v5 = objc_alloc_init(FCThreadSafeMutableArray);
    resultRecords = v2->_resultRecords;
    v2->_resultRecords = v5;

    v7 = objc_alloc_init(FCThreadSafeMutableSet);
    resultMissingRecordIDs = v2->_resultMissingRecordIDs;
    v2->_resultMissingRecordIDs = v7;

    v9 = objc_alloc_init(FCThreadSafeMutableArray);
    allErrors = v2->_allErrors;
    v2->_allErrors = v9;

    int v11 = objc_alloc_init(FCThreadSafeMutableArray);
    allNetworkEvents = v2->_allNetworkEvents;
    v2->_allNetworkEvents = v11;
  }
  return v2;
}

void __56__FCCKBatchedMultiFetchQueryOperation__continueFetching__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [v6 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  [v6 removeAllObjects];
}

- (void)prepareOperation
{
  if (self)
  {
    if (!self->_maxBatchSize) {
      self->_unint64_t maxBatchSize = 500;
    }
    uint64_t v3 = self->_recordIDs;
    uint64_t v4 = v3;
    if (self->_edgeCacheHint)
    {
      uint64_t v5 = [(NSArray *)v3 sortedArrayUsingSelector:sel_caseInsensitiveCompare_];

      uint64_t v4 = (void *)v5;
    }
    unint64_t maxBatchSize = self->_maxBatchSize;
  }
  else
  {
    uint64_t v4 = 0;
    unint64_t maxBatchSize = 0;
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__FCCKBatchedMultiFetchQueryOperation_prepareOperation__block_invoke;
  v7[3] = &unk_1E5B51718;
  v7[4] = self;
  objc_msgSend(v4, "fc_visitSubarraysWithMaxCount:block:", maxBatchSize, v7);
}

uint64_t __55__FCCKBatchedMultiFetchQueryOperation_prepareOperation__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    uint64_t v3 = *(void **)(v2 + 448);
  }
  else {
    uint64_t v3 = 0;
  }
  return [v3 addObject:a2];
}

- (void)operationWillFinishWithError:(id)a3
{
  id v10 = a3;
  if (self)
  {
    id queryCompletionHandler = self->_queryCompletionHandler;
    if (queryCompletionHandler)
    {
      uint64_t v5 = (void (**)(id, void *, void *, id))queryCompletionHandler;
      id v6 = self->_resultRecords;
      v7 = [(FCThreadSafeMutableArray *)v6 readOnlyArray];
      __int16 v8 = self->_resultMissingRecordIDs;
      v9 = [(FCThreadSafeMutableSet *)v8 readOnlySet];
      v5[2](v5, v7, v9, v10);
    }
  }
}

- (void)_continueFetching
{
  if (a1)
  {
    uint64_t v12 = 0;
    v13 = &v12;
    uint64_t v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__28;
    v16 = __Block_byref_object_dispose__28;
    id v17 = 0;
    id v2 = a1[56];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __56__FCCKBatchedMultiFetchQueryOperation__continueFetching__block_invoke;
    v11[3] = &unk_1E5B51740;
    v11[4] = &v12;
    [v2 readWriteWithAccessor:v11];

    if ([(id)v13[5] count])
    {
      dispatch_group_t v3 = dispatch_group_create();
      uint64_t v4 = (void *)v13[5];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __56__FCCKBatchedMultiFetchQueryOperation__continueFetching__block_invoke_3;
      v8[3] = &unk_1E5B51790;
      v8[4] = a1;
      uint64_t v5 = v3;
      v9 = v5;
      [v4 enumerateObjectsUsingBlock:v8];
      id v6 = FCDispatchQueueForQualityOfService([a1 qualityOfService]);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __56__FCCKBatchedMultiFetchQueryOperation__continueFetching__block_invoke_5;
      block[3] = &unk_1E5B4C018;
      block[4] = a1;
      dispatch_group_notify(v5, v6, block);
    }
    else
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __56__FCCKBatchedMultiFetchQueryOperation__continueFetching__block_invoke_2;
      v10[3] = &unk_1E5B4C018;
      v10[4] = a1;
      __56__FCCKBatchedMultiFetchQueryOperation__continueFetching__block_invoke_2((uint64_t)v10);
    }
    _Block_object_dispose(&v12, 8);
  }
}

void __56__FCCKBatchedMultiFetchQueryOperation__continueFetching__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    dispatch_group_t v3 = *(void **)(v2 + 472);
  }
  else {
    dispatch_group_t v3 = 0;
  }
  id v4 = [v3 firstObject];
  [*(id *)(a1 + 32) finishedPerformingOperationWithError:v4];
}

void __56__FCCKBatchedMultiFetchQueryOperation__continueFetching__block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v37 = a2;
  id v7 = a3;
  id v8 = a4;
  v9 = *(void **)(a1 + 32);
  if (v9) {
    v9 = (void *)v9[60];
  }
  id v10 = v9;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v12 = WeakRetained;
  if (WeakRetained) {
    v13 = (void *)*((void *)WeakRetained + 52);
  }
  else {
    v13 = 0;
  }
  id v14 = v13;
  [v10 addObjectsFromArray:v14];

  if (objc_msgSend(v8, "fc_isCKErrorWithCode:", 27))
  {
    unint64_t v15 = (unint64_t)[*(id *)(a1 + 40) count] >> 1;
    v16 = objc_msgSend(*(id *)(a1 + 40), "subarrayWithRange:", 0, v15);
    id v17 = objc_msgSend(*(id *)(a1 + 40), "subarrayWithRange:", v15, objc_msgSend(*(id *)(a1 + 40), "count") - v15);
    uint64_t v18 = *(void *)(a1 + 32);
    if (v18) {
      v19 = *(void **)(v18 + 448);
    }
    else {
      v19 = 0;
    }
    [v19 addObject:v16];
    uint64_t v20 = *(void *)(a1 + 32);
    if (v20) {
      v21 = *(void **)(v20 + 448);
    }
    else {
      v21 = 0;
    }
    [v21 addObject:v17];
  }
  else if (v8 && [v8 code] != 2)
  {
    uint64_t v35 = *(void *)(a1 + 32);
    if (v35) {
      v36 = *(void **)(v35 + 472);
    }
    else {
      v36 = 0;
    }
    [v36 addObject:v8];
  }
  else
  {
    uint64_t v22 = *(void *)(a1 + 32);
    if (!v22) {
      goto LABEL_31;
    }
    v23 = *(void (***)(id, uint64_t, id, id, void *))(v22 + 432);
    if (!v23) {
      goto LABEL_18;
    }
    v24 = v23 + 2;
    uint64_t v25 = *(void *)(a1 + 40);
    v26 = v23;
    id v27 = objc_loadWeakRetained((id *)(a1 + 56));
    v28 = v27;
    v29 = v27 ? (void *)*((void *)v27 + 52) : 0;
    id v30 = v29;
    v31 = [v30 firstObject];
    (*v24)(v26, v25, v37, v7, v31);

    uint64_t v22 = *(void *)(a1 + 32);
    if (v22) {
LABEL_18:
    }
      v32 = *(void **)(v22 + 456);
    else {
LABEL_31:
    }
      v32 = 0;
    [v32 addObjectsFromArray:v37];
    uint64_t v33 = *(void *)(a1 + 32);
    if (v33) {
      v34 = *(void **)(v33 + 464);
    }
    else {
      v34 = 0;
    }
    [v34 unionSet:v7];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __56__FCCKBatchedMultiFetchQueryOperation__continueFetching__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(FCCKMultiFetchQueryOperation);
  uint64_t v5 = (uint64_t)v4;
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    id v7 = *(void **)(v6 + 376);
  }
  else {
    id v7 = 0;
  }
  -[FCCKMultiFetchQueryOperation setDatabase:]((uint64_t)v4, v7);
  -[FCCKMultiFetchQueryOperation setRecordIDs:](v5, v3);
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    v9 = *(void **)(v8 + 392);
  }
  else {
    v9 = 0;
  }
  -[FCCKMultiFetchQueryOperation setRecordSpecs:](v5, v9);
  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    int v11 = *(void **)(v10 + 408);
  }
  else {
    int v11 = 0;
  }
  uint64_t v12 = objc_msgSend(v11, "fc_subdictionaryForKeys:", v3);
  -[FCCKMultiFetchQueryOperation setKnownRecordIDsToEtags:](v5, v12);

  uint64_t v14 = *(void *)(a1 + 32);
  if (v14)
  {
    unint64_t v15 = *(void **)(v14 + 416);
    if (!v5) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  unint64_t v15 = 0;
  if (v5)
  {
LABEL_9:
    objc_setProperty_nonatomic_copy((id)v5, v13, v15, 408);
    uint64_t v14 = *(void *)(a1 + 32);
  }
LABEL_10:
  if (v14)
  {
    BOOL v16 = *(unsigned char *)(v14 + 368) != 0;
    if (!v5) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  BOOL v16 = 0;
  if (v5)
  {
LABEL_12:
    *(unsigned char *)(v5 + 368) = v16;
    uint64_t v14 = *(void *)(a1 + 32);
  }
LABEL_13:
  if (v14)
  {
    int v17 = *(_DWORD *)(v14 + 372);
    if (!v5) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  int v17 = 0;
  if (v5)
  {
LABEL_15:
    *(_DWORD *)(v5 + 372) = v17;
    uint64_t v14 = *(void *)(a1 + 32);
  }
LABEL_16:
  if (v14)
  {
    uint64_t v18 = *(void **)(v14 + 424);
    if (!v5) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  uint64_t v18 = 0;
  if (v5) {
LABEL_18:
  }
    objc_setProperty_nonatomic_copy((id)v5, v13, v18, 424);
LABEL_19:
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
  objc_initWeak(&location, (id)v5);
  newValue[0] = MEMORY[0x1E4F143A8];
  newValue[1] = 3221225472;
  newValue[2] = __56__FCCKBatchedMultiFetchQueryOperation__continueFetching__block_invoke_4;
  newValue[3] = &unk_1E5B51768;
  newValue[4] = *(void *)(a1 + 32);
  objc_copyWeak(&v24, &location);
  id v19 = v3;
  id v22 = v19;
  id v23 = *(id *)(a1 + 40);
  if (v5) {
    objc_setProperty_nonatomic_copy((id)v5, v20, newValue, 432);
  }
  [*(id *)(a1 + 32) associateChildOperation:v5];
  [(id)v5 start];

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allNetworkEvents, 0);
  objc_storeStrong((id *)&self->_allErrors, 0);
  objc_storeStrong((id *)&self->_resultMissingRecordIDs, 0);
  objc_storeStrong((id *)&self->_resultRecords, 0);
  objc_storeStrong((id *)&self->_remainingRecordIDBatches, 0);
  objc_storeStrong(&self->_queryCompletionHandler, 0);
  objc_storeStrong(&self->_batchCompletionHandler, 0);
  objc_storeStrong(&self->_networkActivityBlock, 0);
  objc_storeStrong((id *)&self->_edgeCacheHint, 0);
  objc_storeStrong((id *)&self->_knownRecordIDsToEtags, 0);
  objc_storeStrong((id *)&self->_recordSpecs, 0);
  objc_storeStrong((id *)&self->_recordIDs, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

- (id)networkEvents
{
  if (a1)
  {
    a1 = [a1[60] readOnlyArray];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setKnownRecordIDsToEtags:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 408), a2);
  }
}

@end