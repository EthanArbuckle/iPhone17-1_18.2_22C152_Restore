@interface FCCKContentBatchedFetchRecordsOperation
- (BOOL)validateOperation;
- (FCCKContentBatchedFetchRecordsOperation)init;
- (void)_continueFetching;
- (void)operationWillFinishWithError:(id)a3;
- (void)prepareOperation;
- (void)setDatabase:(uint64_t)a1;
@end

@implementation FCCKContentBatchedFetchRecordsOperation

- (BOOL)validateOperation
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!self || (database = self->_database) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v5 = (void *)[[NSString alloc] initWithFormat:@"fetch operation must have a database"];
      int v6 = 136315906;
      v7 = "-[FCCKContentBatchedFetchRecordsOperation validateOperation]";
      __int16 v8 = 2080;
      v9 = "FCCKContentBatchedFetchRecordsOperation.m";
      __int16 v10 = 1024;
      int v11 = 49;
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

- (void)prepareOperation
{
  v2 = self;
  if (self)
  {
    if (!self->_maxBatchSize) {
      self->_unint64_t maxBatchSize = 400;
    }
    self = (FCCKContentBatchedFetchRecordsOperation *)self->_recordIDs;
  }
  if ([(FCCKContentBatchedFetchRecordsOperation *)self count])
  {
    if (v2)
    {
      v3 = v2->_recordIDs;
      unint64_t maxBatchSize = v2->_maxBatchSize;
    }
    else
    {
      v3 = 0;
      unint64_t maxBatchSize = 0;
    }
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __59__FCCKContentBatchedFetchRecordsOperation_prepareOperation__block_invoke;
    v5[3] = &unk_1E5B51718;
    v5[4] = v2;
    [(NSArray *)v3 fc_visitSubarraysWithMaxCount:maxBatchSize block:v5];
  }
}

void __60__FCCKContentBatchedFetchRecordsOperation__continueFetching__block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v13 = a2;
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    uint64_t v10 = *(void *)(a1 + 32);
    if (v8)
    {
      if (v10) {
        int v11 = *(void **)(v10 + 424);
      }
      else {
        int v11 = 0;
      }
      id v12 = v9;
    }
    else
    {
      if (v10) {
        int v11 = *(void **)(v10 + 416);
      }
      else {
        int v11 = 0;
      }
      id v12 = v13;
    }
    [v11 setObject:v12 forKey:v7];
  }
}

- (void)operationWillFinishWithError:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    if (self) {
      recordIDs = self->_recordIDs;
    }
    else {
      recordIDs = 0;
    }
    int v6 = recordIDs;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v23;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v23 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v22 + 1) + 8 * v10);
          if (self) {
            recordsByRecordID = self->_recordsByRecordID;
          }
          else {
            recordsByRecordID = 0;
          }
          id v13 = -[FCThreadSafeMutableDictionary objectForKey:](recordsByRecordID, "objectForKey:", *(void *)(*((void *)&v22 + 1) + 8 * v10), (void)v22);

          if (!v13)
          {
            if (self) {
              errorsByRecordID = self->_errorsByRecordID;
            }
            else {
              errorsByRecordID = 0;
            }
            [(FCThreadSafeMutableDictionary *)errorsByRecordID setObject:v4 forKey:v11];
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v15 = [(NSArray *)v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
        uint64_t v8 = v15;
      }
      while (v15);
    }
  }
  if (self)
  {
    id fetchRecordsCompletionBlock = self->_fetchRecordsCompletionBlock;
    if (fetchRecordsCompletionBlock)
    {
      v17 = (void (**)(id, void *, void *, id))fetchRecordsCompletionBlock;
      v18 = self->_recordsByRecordID;
      v19 = [(FCThreadSafeMutableDictionary *)v18 readOnlyDictionary];
      v20 = self->_errorsByRecordID;
      v21 = [(FCThreadSafeMutableDictionary *)v20 readOnlyDictionary];
      v17[2](v17, v19, v21, v4);
    }
  }
}

void __60__FCCKContentBatchedFetchRecordsOperation__continueFetching__block_invoke_7(uint64_t a1)
{
}

- (void)setDatabase:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 368), a2);
  }
}

- (FCCKContentBatchedFetchRecordsOperation)init
{
  v12.receiver = self;
  v12.super_class = (Class)FCCKContentBatchedFetchRecordsOperation;
  v2 = [(FCOperation *)&v12 init];
  if (v2)
  {
    v3 = objc_alloc_init(FCThreadSafeMutableArray);
    remainingRecordIDBatches = v2->_remainingRecordIDBatches;
    v2->_remainingRecordIDBatches = v3;

    v5 = objc_alloc_init(FCThreadSafeMutableDictionary);
    recordsByRecordID = v2->_recordsByRecordID;
    v2->_recordsByRecordID = v5;

    uint64_t v7 = objc_alloc_init(FCThreadSafeMutableDictionary);
    errorsByRecordID = v2->_errorsByRecordID;
    v2->_errorsByRecordID = v7;

    uint64_t v9 = objc_alloc_init(FCThreadSafeMutableArray);
    allOperationErrors = v2->_allOperationErrors;
    v2->_allOperationErrors = v9;
  }
  return v2;
}

void __60__FCCKContentBatchedFetchRecordsOperation__continueFetching__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [v6 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  [v6 removeAllObjects];
}

uint64_t __59__FCCKContentBatchedFetchRecordsOperation_prepareOperation__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    uint64_t v3 = *(void **)(v2 + 408);
  }
  else {
    uint64_t v3 = 0;
  }
  return [v3 addObject:a2];
}

- (void)_continueFetching
{
  if (a1)
  {
    uint64_t v12 = 0;
    id v13 = &v12;
    uint64_t v14 = 0x3032000000;
    uint64_t v15 = __Block_byref_object_copy__65;
    v16 = __Block_byref_object_dispose__65;
    id v17 = 0;
    id v2 = a1[51];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __60__FCCKContentBatchedFetchRecordsOperation__continueFetching__block_invoke;
    v11[3] = &unk_1E5B51740;
    v11[4] = &v12;
    [v2 readWriteWithAccessor:v11];

    if ([(id)v13[5] count])
    {
      dispatch_group_t v3 = dispatch_group_create();
      uint64_t v4 = (void *)v13[5];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __60__FCCKContentBatchedFetchRecordsOperation__continueFetching__block_invoke_3;
      v8[3] = &unk_1E5B51790;
      v8[4] = a1;
      v5 = v3;
      uint64_t v9 = v5;
      [v4 enumerateObjectsUsingBlock:v8];
      id v6 = FCDispatchQueueForQualityOfService([a1 qualityOfService]);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __60__FCCKContentBatchedFetchRecordsOperation__continueFetching__block_invoke_7;
      block[3] = &unk_1E5B4C018;
      block[4] = a1;
      dispatch_group_notify(v5, v6, block);
    }
    else
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __60__FCCKContentBatchedFetchRecordsOperation__continueFetching__block_invoke_2;
      v10[3] = &unk_1E5B4C018;
      v10[4] = a1;
      __60__FCCKContentBatchedFetchRecordsOperation__continueFetching__block_invoke_2((uint64_t)v10);
    }
    _Block_object_dispose(&v12, 8);
  }
}

void __60__FCCKContentBatchedFetchRecordsOperation__continueFetching__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    dispatch_group_t v3 = *(void **)(v2 + 432);
  }
  else {
    dispatch_group_t v3 = 0;
  }
  id v4 = [v3 firstObject];
  [*(id *)(a1 + 32) finishedPerformingOperationWithError:v4];
}

void __60__FCCKContentBatchedFetchRecordsOperation__continueFetching__block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  id v13 = a3;
  if (objc_msgSend(v13, "fc_isCKErrorWithCode:", 27))
  {
    unint64_t v4 = (unint64_t)[*(id *)(a1 + 32) count] >> 1;
    v5 = objc_msgSend(*(id *)(a1 + 32), "subarrayWithRange:", 0, v4);
    id v6 = objc_msgSend(*(id *)(a1 + 32), "subarrayWithRange:", v4, objc_msgSend(*(id *)(a1 + 32), "count") - v4);
    uint64_t v7 = *(void *)(a1 + 40);
    if (v7) {
      uint64_t v8 = *(void **)(v7 + 408);
    }
    else {
      uint64_t v8 = 0;
    }
    [v8 addObject:v5];
    uint64_t v9 = *(void *)(a1 + 40);
    if (v9) {
      uint64_t v10 = *(void **)(v9 + 408);
    }
    else {
      uint64_t v10 = 0;
    }
    [v10 addObject:v6];
  }
  else if (v13 && [v13 code] != 2)
  {
    uint64_t v11 = *(void *)(a1 + 40);
    if (v11) {
      uint64_t v12 = *(void **)(v11 + 432);
    }
    else {
      uint64_t v12 = 0;
    }
    [v12 addObject:v13];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __60__FCCKContentBatchedFetchRecordsOperation__continueFetching__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = objc_alloc_init(FCCKContentFetchOperation);
  v5 = v4;
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    uint64_t v7 = *(void **)(v6 + 368);
  }
  else {
    uint64_t v7 = 0;
  }
  -[FCCKContentFetchOperation setDatabase:]((uint64_t)v4, v7);
  if (v5) {
    objc_setProperty_nonatomic_copy(v5, v8, v3, 384);
  }
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9)
  {
    uint64_t v10 = *(void **)(v9 + 384);
    if (!v5) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  uint64_t v10 = 0;
  if (v5)
  {
LABEL_7:
    objc_setProperty_nonatomic_copy(v5, v8, v10, 400);
    uint64_t v9 = *(void *)(a1 + 32);
  }
LABEL_8:
  newValue[0] = MEMORY[0x1E4F143A8];
  newValue[1] = 3221225472;
  newValue[2] = __60__FCCKContentBatchedFetchRecordsOperation__continueFetching__block_invoke_4;
  newValue[3] = &unk_1E5B599E8;
  newValue[4] = v9;
  if (v5) {
    objc_setProperty_nonatomic_copy(v5, v8, newValue, 408);
  }
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  id v17 = __60__FCCKContentBatchedFetchRecordsOperation__continueFetching__block_invoke_6;
  v18 = &unk_1E5B56570;
  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v12 = *(void **)(a1 + 40);
  id v19 = v3;
  uint64_t v20 = v11;
  id v21 = v12;
  id v14 = v3;
  if (v5) {
    objc_setProperty_nonatomic_copy(v5, v13, &v15, 416);
  }
  objc_msgSend(*(id *)(a1 + 32), "associateChildOperation:", v5, v15, v16, v17, v18);
  [(FCOperation *)v5 start];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allOperationErrors, 0);
  objc_storeStrong((id *)&self->_errorsByRecordID, 0);
  objc_storeStrong((id *)&self->_recordsByRecordID, 0);
  objc_storeStrong((id *)&self->_remainingRecordIDBatches, 0);
  objc_storeStrong(&self->_fetchRecordsCompletionBlock, 0);
  objc_storeStrong((id *)&self->_desiredKeys, 0);
  objc_storeStrong((id *)&self->_recordIDs, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

@end