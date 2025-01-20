@interface FCCKContentBatchedRefreshRecordsOperation
- (BOOL)validateOperation;
- (FCCKContentBatchedRefreshRecordsOperation)init;
- (void)_continueRefreshing;
- (void)operationWillFinishWithError:(id)a3;
- (void)prepareOperation;
- (void)setDatabase:(uint64_t)a1;
@end

@implementation FCCKContentBatchedRefreshRecordsOperation

- (void)_continueRefreshing
{
  if (a1)
  {
    uint64_t v12 = 0;
    v13 = &v12;
    uint64_t v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__60;
    v16 = __Block_byref_object_dispose__60;
    id v17 = 0;
    id v2 = a1[53];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __64__FCCKContentBatchedRefreshRecordsOperation__continueRefreshing__block_invoke;
    v11[3] = &unk_1E5B51740;
    v11[4] = &v12;
    [v2 readWriteWithAccessor:v11];

    if ([(id)v13[5] count])
    {
      dispatch_group_t v3 = dispatch_group_create();
      v4 = (void *)v13[5];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __64__FCCKContentBatchedRefreshRecordsOperation__continueRefreshing__block_invoke_3;
      v8[3] = &unk_1E5B51790;
      v8[4] = a1;
      v5 = v3;
      v9 = v5;
      [v4 enumerateObjectsUsingBlock:v8];
      v6 = FCDispatchQueueForQualityOfService([a1 qualityOfService]);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __64__FCCKContentBatchedRefreshRecordsOperation__continueRefreshing__block_invoke_6;
      block[3] = &unk_1E5B4C018;
      block[4] = a1;
      dispatch_group_notify(v5, v6, block);
    }
    else
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __64__FCCKContentBatchedRefreshRecordsOperation__continueRefreshing__block_invoke_2;
      v10[3] = &unk_1E5B4C018;
      v10[4] = a1;
      __64__FCCKContentBatchedRefreshRecordsOperation__continueRefreshing__block_invoke_2((uint64_t)v10);
    }
    _Block_object_dispose(&v12, 8);
  }
}

void __64__FCCKContentBatchedRefreshRecordsOperation__continueRefreshing__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    dispatch_group_t v3 = *(void **)(v2 + 464);
  }
  else {
    dispatch_group_t v3 = 0;
  }
  id v4 = [v3 firstObject];
  [*(id *)(a1 + 32) finishedPerformingOperationWithError:v4];
}

- (BOOL)validateOperation
{
  uint64_t v2 = self;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (self && self->_database) {
    goto LABEL_5;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)[[NSString alloc] initWithFormat:@"refresh operation must have a database"];
    int v9 = 136315906;
    v10 = "-[FCCKContentBatchedRefreshRecordsOperation validateOperation]";
    __int16 v11 = 2080;
    uint64_t v12 = "FCCKContentBatchedRefreshRecordsOperation.m";
    __int16 v13 = 1024;
    int v14 = 55;
    __int16 v15 = 2114;
    v16 = v7;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v9, 0x26u);

    if (v2) {
      goto LABEL_5;
    }
LABEL_14:
    recordIDs = 0;
    goto LABEL_6;
  }
  if (!v2) {
    goto LABEL_14;
  }
LABEL_5:
  recordIDs = v2->_recordIDs;
LABEL_6:
  if (![(NSArray *)recordIDs count] && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v8 = (void *)[[NSString alloc] initWithFormat:@"refresh operation must have record IDs"];
    int v9 = 136315906;
    v10 = "-[FCCKContentBatchedRefreshRecordsOperation validateOperation]";
    __int16 v11 = 2080;
    uint64_t v12 = "FCCKContentBatchedRefreshRecordsOperation.m";
    __int16 v13 = 1024;
    int v14 = 56;
    __int16 v15 = 2114;
    v16 = v8;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v9, 0x26u);

    if (!v2) {
      return (char)v2;
    }
  }
  else if (!v2)
  {
    return (char)v2;
  }
  id v4 = v2->_database;
  if (v4)
  {
    v5 = v4;
    LOBYTE(v2) = [(NSArray *)v2->_recordIDs count] != 0;
  }
  else
  {
    LOBYTE(v2) = 0;
  }
  return (char)v2;
}

- (void)prepareOperation
{
  if (self)
  {
    recordIDs = self->_recordIDs;
    if (self->_canaryRecordID) {
      uint64_t v3 = 399;
    }
    else {
      uint64_t v3 = 400;
    }
  }
  else
  {
    recordIDs = 0;
    uint64_t v3 = 400;
  }
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __61__FCCKContentBatchedRefreshRecordsOperation_prepareOperation__block_invoke;
  v4[3] = &unk_1E5B51718;
  v4[4] = self;
  [(NSArray *)recordIDs fc_visitSubarraysWithMaxCount:v3 block:v4];
}

void __64__FCCKContentBatchedRefreshRecordsOperation__continueRefreshing__block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v11 = a2;
  id v7 = a3;
  id v8 = a4;
  int v9 = v8;
  if (v7)
  {
    if (!v8)
    {
      v10 = *(void **)(a1 + 32);
      goto LABEL_7;
    }
    if ([v8 code] == 11 || objc_msgSend(v9, "code") == 2003)
    {
      v10 = *(void **)(a1 + 40);
LABEL_7:
      [v10 addObject:v7];
      goto LABEL_8;
    }
    [*(id *)(a1 + 48) setObject:v9 forKey:v7];
  }
LABEL_8:
}

- (void)operationWillFinishWithError:(id)a3
{
  id v12 = a3;
  if (self)
  {
    id refreshRecordsCompletionBlock = self->_refreshRecordsCompletionBlock;
    if (refreshRecordsCompletionBlock)
    {
      v5 = (void (**)(id, void *, void *, void *, id))refreshRecordsCompletionBlock;
      v6 = self->_refreshedRecordIDs;
      id v7 = [(FCThreadSafeMutableSet *)v6 allObjects];
      id v8 = self->_updatedRecordsByRecordID;
      int v9 = [(FCThreadSafeMutableDictionary *)v8 readOnlyDictionary];
      v10 = self->_deletedRecordIDs;
      id v11 = [(FCThreadSafeMutableSet *)v10 allObjects];
      v5[2](v5, v7, v9, v11, v12);
    }
  }
}

uint64_t __64__FCCKContentBatchedRefreshRecordsOperation__continueRefreshing__block_invoke_6(uint64_t a1)
{
  return -[FCCKContentBatchedRefreshRecordsOperation _continueRefreshing](*(void *)(a1 + 32));
}

- (void)setDatabase:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 376), a2);
  }
}

- (FCCKContentBatchedRefreshRecordsOperation)init
{
  v16.receiver = self;
  v16.super_class = (Class)FCCKContentBatchedRefreshRecordsOperation;
  uint64_t v2 = [(FCOperation *)&v16 init];
  if (v2)
  {
    uint64_t v3 = objc_alloc_init(FCThreadSafeMutableArray);
    remainingRecordIDBatches = v2->_remainingRecordIDBatches;
    v2->_remainingRecordIDBatches = v3;

    v5 = objc_alloc_init(FCThreadSafeMutableSet);
    refreshedRecordIDs = v2->_refreshedRecordIDs;
    v2->_refreshedRecordIDs = v5;

    id v7 = objc_alloc_init(FCThreadSafeMutableDictionary);
    updatedRecordsByRecordID = v2->_updatedRecordsByRecordID;
    v2->_updatedRecordsByRecordID = v7;

    int v9 = objc_alloc_init(FCThreadSafeMutableSet);
    deletedRecordIDs = v2->_deletedRecordIDs;
    v2->_deletedRecordIDs = v9;

    id v11 = objc_alloc_init(FCThreadSafeMutableDictionary);
    errorsByRecordID = v2->_errorsByRecordID;
    v2->_errorsByRecordID = v11;

    __int16 v13 = objc_alloc_init(FCThreadSafeMutableArray);
    allOperationErrors = v2->_allOperationErrors;
    v2->_allOperationErrors = v13;
  }
  return v2;
}

void __64__FCCKContentBatchedRefreshRecordsOperation__continueRefreshing__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [v6 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  [v6 removeAllObjects];
}

uint64_t __61__FCCKContentBatchedRefreshRecordsOperation_prepareOperation__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    uint64_t v3 = *(void **)(v2 + 424);
  }
  else {
    uint64_t v3 = 0;
  }
  return [v3 addObject:a2];
}

void __64__FCCKContentBatchedRefreshRecordsOperation__continueRefreshing__block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v37 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  if (!v6 || !*(unsigned char *)(v6 + 368))
  {
    id v12 = (id *)(a1 + 48);
    [*(id *)(a1 + 40) unionSet:*(void *)(a1 + 48)];
    goto LABEL_9;
  }
  id v7 = *(id *)(v6 + 408);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = v9 ? *(void *)(v9 + 408) : 0;
    char v11 = [*(id *)(a1 + 40) containsObject:v10];

    if ((v11 & 1) == 0)
    {
      id v12 = (id *)(a1 + 48);
LABEL_9:
      [*v12 removeAllObjects];
    }
  }
  uint64_t v13 = *(void *)(a1 + 32);
  if (v13)
  {
    if (!*(void *)(v13 + 408))
    {
LABEL_20:
      v21 = *(void **)(v13 + 432);
      goto LABEL_21;
    }
    objc_msgSend(*(id *)(a1 + 48), "removeObject:");
    uint64_t v14 = *(void *)(a1 + 32);
    if (v14) {
      uint64_t v15 = *(void *)(v14 + 408);
    }
    else {
      uint64_t v15 = 0;
    }
    [*(id *)(a1 + 40) removeObject:v15];
    uint64_t v16 = *(void *)(a1 + 32);
    if (v16) {
      uint64_t v17 = *(void *)(v16 + 408);
    }
    else {
      uint64_t v17 = 0;
    }
    [*(id *)(a1 + 56) removeObjectForKey:v17];
    uint64_t v18 = *(void *)(a1 + 32);
    if (v18) {
      uint64_t v19 = *(void *)(v18 + 408);
    }
    else {
      uint64_t v19 = 0;
    }
    uint64_t v20 = objc_msgSend(v37, "fc_dictionaryByRemovingObjectForKey:", v19);

    uint64_t v13 = *(void *)(a1 + 32);
    if (v13)
    {
      id v37 = (id)v20;
      goto LABEL_20;
    }
    v21 = 0;
    id v37 = (id)v20;
  }
  else
  {
    v21 = 0;
  }
LABEL_21:
  [v21 unionSet:*(void *)(a1 + 40)];
  uint64_t v22 = *(void *)(a1 + 32);
  if (v22) {
    v23 = *(void **)(v22 + 456);
  }
  else {
    v23 = 0;
  }
  [v23 addEntriesFromDictionary:*(void *)(a1 + 56)];
  uint64_t v24 = *(void *)(a1 + 32);
  if (v24) {
    v25 = *(void **)(v24 + 448);
  }
  else {
    v25 = 0;
  }
  [v25 unionSet:*(void *)(a1 + 48)];
  if (objc_msgSend(v5, "fc_isCKErrorWithCode:", 27))
  {
    unint64_t v26 = (unint64_t)[*(id *)(a1 + 64) count] >> 1;
    v27 = objc_msgSend(*(id *)(a1 + 64), "subarrayWithRange:", 0, v26);
    v28 = objc_msgSend(*(id *)(a1 + 64), "subarrayWithRange:", v26, objc_msgSend(*(id *)(a1 + 64), "count") - v26);
    uint64_t v29 = *(void *)(a1 + 32);
    if (v29) {
      v30 = *(void **)(v29 + 424);
    }
    else {
      v30 = 0;
    }
    [v30 addObject:v27];
    uint64_t v31 = *(void *)(a1 + 32);
    if (v31) {
      v32 = *(void **)(v31 + 424);
    }
    else {
      v32 = 0;
    }
    [v32 addObject:v28];
  }
  else if (v5 && [v5 code] != 2)
  {
    uint64_t v35 = *(void *)(a1 + 32);
    if (v35) {
      v36 = *(void **)(v35 + 464);
    }
    else {
      v36 = 0;
    }
    [v36 addObject:v5];
  }
  else
  {
    uint64_t v33 = *(void *)(a1 + 32);
    if (v33) {
      v34 = *(void **)(v33 + 440);
    }
    else {
      v34 = 0;
    }
    [v34 addEntriesFromDictionary:v37];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 72));
}

void __64__FCCKContentBatchedRefreshRecordsOperation__continueRefreshing__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = v3;
  if (v5)
  {
    id v7 = *(void **)(v5 + 408);
    uint64_t v6 = v3;
    if (v7)
    {
      id v8 = v7;
      uint64_t v6 = [v4 arrayByAddingObject:v8];
    }
  }
  uint64_t v9 = objc_alloc_init(FCCKContentFetchOperation);
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)(a1 + 32);
  if (v11) {
    id v12 = *(void **)(v11 + 376);
  }
  else {
    id v12 = 0;
  }
  -[FCCKContentFetchOperation setDatabase:]((uint64_t)v9, v12);
  if (v10) {
    objc_setProperty_nonatomic_copy(v10, v13, v6, 384);
  }
  uint64_t v14 = *(void *)(a1 + 32);
  if (v14) {
    uint64_t v15 = *(void **)(v14 + 392);
  }
  else {
    uint64_t v15 = 0;
  }
  uint64_t v16 = objc_msgSend(v15, "fc_subdictionaryForKeys:", v4);
  -[FCCKContentFetchOperation setRecordIDsToETags:]((uint64_t)v10, v16);

  uint64_t v18 = *(void *)(a1 + 32);
  if (v18)
  {
    uint64_t v19 = *(void **)(v18 + 400);
    if (!v10) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  uint64_t v19 = 0;
  if (v10) {
LABEL_12:
  }
    objc_setProperty_nonatomic_copy(v10, v17, v19, 400);
LABEL_13:
  uint64_t v20 = objc_msgSend(MEMORY[0x1E4F1CA80], "set", v19);
  v21 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v22 = [MEMORY[0x1E4F1CA60] dictionary];
  newValue[0] = MEMORY[0x1E4F143A8];
  newValue[1] = 3221225472;
  newValue[2] = __64__FCCKContentBatchedRefreshRecordsOperation__continueRefreshing__block_invoke_4;
  newValue[3] = &unk_1E5B58FB0;
  id v23 = v20;
  id v40 = v23;
  id v24 = v21;
  id v41 = v24;
  id v26 = v22;
  id v42 = v26;
  if (v10) {
    objc_setProperty_nonatomic_copy(v10, v25, newValue, 408);
  }
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __64__FCCKContentBatchedRefreshRecordsOperation__continueRefreshing__block_invoke_5;
  v33[3] = &unk_1E5B58FD8;
  v27 = *(void **)(a1 + 40);
  v33[4] = *(void *)(a1 + 32);
  id v34 = v23;
  id v35 = v24;
  id v36 = v26;
  id v37 = v4;
  id v38 = v27;
  id v28 = v4;
  id v29 = v26;
  id v30 = v24;
  id v32 = v23;
  if (v10) {
    objc_setProperty_nonatomic_copy(v10, v31, v33, 416);
  }
  [*(id *)(a1 + 32) associateChildOperation:v10];
  [(FCOperation *)v10 start];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allOperationErrors, 0);
  objc_storeStrong((id *)&self->_errorsByRecordID, 0);
  objc_storeStrong((id *)&self->_deletedRecordIDs, 0);
  objc_storeStrong((id *)&self->_updatedRecordsByRecordID, 0);
  objc_storeStrong((id *)&self->_refreshedRecordIDs, 0);
  objc_storeStrong((id *)&self->_remainingRecordIDBatches, 0);
  objc_storeStrong(&self->_refreshRecordsCompletionBlock, 0);
  objc_storeStrong((id *)&self->_canaryRecordID, 0);
  objc_storeStrong((id *)&self->_desiredKeys, 0);
  objc_storeStrong((id *)&self->_changeTagsByRecordID, 0);
  objc_storeStrong((id *)&self->_recordIDs, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

@end