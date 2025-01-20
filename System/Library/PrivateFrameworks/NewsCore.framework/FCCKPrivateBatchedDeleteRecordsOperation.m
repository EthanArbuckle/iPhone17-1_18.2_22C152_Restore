@interface FCCKPrivateBatchedDeleteRecordsOperation
- (BOOL)handleIdentityLoss;
- (BOOL)skipPreflight;
- (BOOL)validateOperation;
- (FCCKPrivateBatchedDeleteRecordsOperation)init;
- (FCCKPrivateDatabase)database;
- (NSArray)recordIDsToDelete;
- (NSMutableArray)remainingBatchesOfRecordIDsToDelete;
- (NSMutableArray)resultDeletedRecordIDs;
- (NSMutableDictionary)resultErrorsByRecordID;
- (id)deleteRecordsCompletionBlock;
- (void)_continueModifying;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)setDatabase:(id)a3;
- (void)setDeleteRecordsCompletionBlock:(id)a3;
- (void)setHandleIdentityLoss:(BOOL)a3;
- (void)setRecordIDsToDelete:(id)a3;
- (void)setRemainingBatchesOfRecordIDsToDelete:(id)a3;
- (void)setResultDeletedRecordIDs:(id)a3;
- (void)setResultErrorsByRecordID:(id)a3;
- (void)setSkipPreflight:(BOOL)a3;
@end

@implementation FCCKPrivateBatchedDeleteRecordsOperation

- (FCCKPrivateBatchedDeleteRecordsOperation)init
{
  v11.receiver = self;
  v11.super_class = (Class)FCCKPrivateBatchedDeleteRecordsOperation;
  v2 = [(FCOperation *)&v11 init];
  v3 = v2;
  if (v2)
  {
    v2->_skipPreflight = 0;
    v2->_handleIdentityLoss = 1;
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    remainingBatchesOfRecordIDsToDelete = v3->_remainingBatchesOfRecordIDsToDelete;
    v3->_remainingBatchesOfRecordIDsToDelete = v4;

    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    resultDeletedRecordIDs = v3->_resultDeletedRecordIDs;
    v3->_resultDeletedRecordIDs = v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    resultErrorsByRecordID = v3->_resultErrorsByRecordID;
    v3->_resultErrorsByRecordID = v8;
  }
  return v3;
}

- (BOOL)validateOperation
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = [(FCCKPrivateBatchedDeleteRecordsOperation *)self database];

  if (!v3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)[[NSString alloc] initWithFormat:@"modify operation must have a database"];
    int v8 = 136315906;
    v9 = "-[FCCKPrivateBatchedDeleteRecordsOperation validateOperation]";
    __int16 v10 = 2080;
    objc_super v11 = "FCCKPrivateBatchedDeleteRecordsOperation.m";
    __int16 v12 = 1024;
    int v13 = 46;
    __int16 v14 = 2114;
    v15 = v7;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v8, 0x26u);
  }
  v4 = [(FCCKPrivateBatchedDeleteRecordsOperation *)self database];
  BOOL v5 = v4 != 0;

  return v5;
}

- (void)performOperation
{
  v3 = [(FCCKPrivateBatchedDeleteRecordsOperation *)self recordIDsToDelete];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    BOOL v5 = [(FCCKPrivateBatchedDeleteRecordsOperation *)self remainingBatchesOfRecordIDsToDelete];
    v6 = [(FCCKPrivateBatchedDeleteRecordsOperation *)self recordIDsToDelete];
    [v5 addObject:v6];
  }
  [(FCCKPrivateBatchedDeleteRecordsOperation *)self _continueModifying];
}

- (void)operationWillFinishWithError:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    BOOL v5 = [(FCCKPrivateBatchedDeleteRecordsOperation *)self resultErrorsByRecordID];
    uint64_t v6 = [v5 count];

    if (v6)
    {
      v7 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v8 = *MEMORY[0x1E4F19C40];
      uint64_t v14 = *MEMORY[0x1E4F19CD8];
      v9 = [(FCCKPrivateBatchedDeleteRecordsOperation *)self resultErrorsByRecordID];
      v15[0] = v9;
      __int16 v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
      id v4 = [v7 errorWithDomain:v8 code:2 userInfo:v10];
    }
    else
    {
      id v4 = 0;
    }
  }
  objc_super v11 = [(FCCKPrivateBatchedDeleteRecordsOperation *)self deleteRecordsCompletionBlock];

  if (v11)
  {
    __int16 v12 = [(FCCKPrivateBatchedDeleteRecordsOperation *)self deleteRecordsCompletionBlock];
    int v13 = [(FCCKPrivateBatchedDeleteRecordsOperation *)self resultDeletedRecordIDs];
    ((void (**)(void, void *, id))v12)[2](v12, v13, v4);
  }
}

- (void)_continueModifying
{
  v3 = [(FCCKPrivateBatchedDeleteRecordsOperation *)self remainingBatchesOfRecordIDsToDelete];
  id v4 = [v3 firstObject];

  if ([v4 count])
  {
    BOOL v5 = objc_alloc_init(FCCKPrivateDeleteRecordsOperation);
    [(FCCKPrivateDeleteRecordsOperation *)v5 setRecordIDsToDelete:v4];
    [(FCCKPrivateDatabaseOperation *)v5 setSkipPreflight:[(FCCKPrivateBatchedDeleteRecordsOperation *)self skipPreflight]];
    [(FCCKPrivateDatabaseOperation *)v5 setHandleIdentityLoss:[(FCCKPrivateBatchedDeleteRecordsOperation *)self handleIdentityLoss]];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __62__FCCKPrivateBatchedDeleteRecordsOperation__continueModifying__block_invoke;
    v7[3] = &unk_1E5B4C8F8;
    v7[4] = self;
    [(FCCKPrivateDeleteRecordsOperation *)v5 setDeleteRecordsCompletionBlock:v7];
    [(FCOperation *)self associateChildOperation:v5];
    uint64_t v6 = [(FCCKPrivateBatchedDeleteRecordsOperation *)self database];
    -[FCCKPrivateDatabase addOperation:]((uint64_t)v6, v5);
  }
  else
  {
    [(FCOperation *)self finishedPerformingOperationWithError:0];
  }
}

void __62__FCCKPrivateBatchedDeleteRecordsOperation__continueModifying__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v25 = a2;
  id v5 = a3;
  if (objc_msgSend(v5, "fc_isCKErrorWithCode:", 27))
  {
    uint64_t v24 = a1;
    id v6 = [*(id *)(a1 + 32) remainingBatchesOfRecordIDsToDelete];
    v7 = (void *)[v6 copy];
    [v6 removeAllObjects];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v27 != v11) {
            objc_enumerationMutation(v8);
          }
          int v13 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          unint64_t v14 = (unint64_t)[v13 count] >> 1;
          v15 = objc_msgSend(v13, "subarrayWithRange:", 0, v14);
          uint64_t v16 = objc_msgSend(v13, "subarrayWithRange:", v14, objc_msgSend(v13, "count") - v14);
          [v6 addObject:v15];
          [v6 addObject:v16];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v10);
    }

    [*(id *)(v24 + 32) _continueModifying];
  }
  else if (v5 && [v5 code] != 2)
  {
    [*(id *)(a1 + 32) finishedPerformingOperationWithError:v5];
  }
  else
  {
    if (v25)
    {
      v17 = [*(id *)(a1 + 32) resultDeletedRecordIDs];
      [v17 addObjectsFromArray:v25];
    }
    v18 = [*(id *)(a1 + 32) remainingBatchesOfRecordIDsToDelete];
    uint64_t v19 = [v18 count];

    if (v19)
    {
      v20 = [*(id *)(a1 + 32) remainingBatchesOfRecordIDsToDelete];
      objc_msgSend(v20, "fc_removeFirstObject");
    }
    v21 = [v5 userInfo];
    v22 = [v21 objectForKeyedSubscript:*MEMORY[0x1E4F19CD8]];

    if (v22)
    {
      v23 = [*(id *)(a1 + 32) resultErrorsByRecordID];
      [v23 addEntriesFromDictionary:v22];
    }
    [*(id *)(a1 + 32) _continueModifying];
  }
}

- (FCCKPrivateDatabase)database
{
  return self->_database;
}

- (void)setDatabase:(id)a3
{
}

- (NSArray)recordIDsToDelete
{
  return self->_recordIDsToDelete;
}

- (void)setRecordIDsToDelete:(id)a3
{
}

- (BOOL)skipPreflight
{
  return self->_skipPreflight;
}

- (void)setSkipPreflight:(BOOL)a3
{
  self->_skipPreflight = a3;
}

- (BOOL)handleIdentityLoss
{
  return self->_handleIdentityLoss;
}

- (void)setHandleIdentityLoss:(BOOL)a3
{
  self->_handleIdentityLoss = a3;
}

- (id)deleteRecordsCompletionBlock
{
  return self->_deleteRecordsCompletionBlock;
}

- (void)setDeleteRecordsCompletionBlock:(id)a3
{
}

- (NSMutableArray)remainingBatchesOfRecordIDsToDelete
{
  return self->_remainingBatchesOfRecordIDsToDelete;
}

- (void)setRemainingBatchesOfRecordIDsToDelete:(id)a3
{
}

- (NSMutableArray)resultDeletedRecordIDs
{
  return self->_resultDeletedRecordIDs;
}

- (void)setResultDeletedRecordIDs:(id)a3
{
}

- (NSMutableDictionary)resultErrorsByRecordID
{
  return self->_resultErrorsByRecordID;
}

- (void)setResultErrorsByRecordID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultErrorsByRecordID, 0);
  objc_storeStrong((id *)&self->_resultDeletedRecordIDs, 0);
  objc_storeStrong((id *)&self->_remainingBatchesOfRecordIDsToDelete, 0);
  objc_storeStrong(&self->_deleteRecordsCompletionBlock, 0);
  objc_storeStrong((id *)&self->_recordIDsToDelete, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

@end