@interface FCCKPrivateBatchedSaveRecordsOperation
- (BOOL)handleIdentityLoss;
- (BOOL)skipPreflight;
- (BOOL)validateOperation;
- (FCCKPrivateBatchedSaveRecordsOperation)init;
- (FCCKPrivateDatabase)database;
- (NSArray)recordsToSave;
- (NSMutableArray)remainingBatchesOfRecordsToSave;
- (NSMutableArray)resultSavedRecords;
- (NSMutableDictionary)resultErrorsByRecordID;
- (id)saveRecordsCompletionBlock;
- (int64_t)savePolicy;
- (void)_continueModifying;
- (void)_subdivideRemainingBatches;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)setDatabase:(id)a3;
- (void)setHandleIdentityLoss:(BOOL)a3;
- (void)setRecordsToSave:(id)a3;
- (void)setRemainingBatchesOfRecordsToSave:(id)a3;
- (void)setResultErrorsByRecordID:(id)a3;
- (void)setResultSavedRecords:(id)a3;
- (void)setSavePolicy:(int64_t)a3;
- (void)setSaveRecordsCompletionBlock:(id)a3;
- (void)setSkipPreflight:(BOOL)a3;
@end

@implementation FCCKPrivateBatchedSaveRecordsOperation

- (FCCKPrivateBatchedSaveRecordsOperation)init
{
  v11.receiver = self;
  v11.super_class = (Class)FCCKPrivateBatchedSaveRecordsOperation;
  v2 = [(FCOperation *)&v11 init];
  v3 = v2;
  if (v2)
  {
    v2->_skipPreflight = 0;
    v2->_handleIdentityLoss = 1;
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    remainingBatchesOfRecordsToSave = v3->_remainingBatchesOfRecordsToSave;
    v3->_remainingBatchesOfRecordsToSave = v4;

    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    resultSavedRecords = v3->_resultSavedRecords;
    v3->_resultSavedRecords = v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    resultErrorsByRecordID = v3->_resultErrorsByRecordID;
    v3->_resultErrorsByRecordID = v8;
  }
  return v3;
}

- (BOOL)validateOperation
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = [(FCCKPrivateBatchedSaveRecordsOperation *)self database];

  if (!v3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)[[NSString alloc] initWithFormat:@"modify operation must have a database"];
    int v8 = 136315906;
    v9 = "-[FCCKPrivateBatchedSaveRecordsOperation validateOperation]";
    __int16 v10 = 2080;
    objc_super v11 = "FCCKPrivateBatchedSaveRecordsOperation.m";
    __int16 v12 = 1024;
    int v13 = 50;
    __int16 v14 = 2114;
    v15 = v7;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v8, 0x26u);
  }
  v4 = [(FCCKPrivateBatchedSaveRecordsOperation *)self database];
  BOOL v5 = v4 != 0;

  return v5;
}

- (void)performOperation
{
  v3 = [(FCCKPrivateBatchedSaveRecordsOperation *)self recordsToSave];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    BOOL v5 = [(FCCKPrivateBatchedSaveRecordsOperation *)self remainingBatchesOfRecordsToSave];
    v6 = [(FCCKPrivateBatchedSaveRecordsOperation *)self recordsToSave];
    [v5 addObject:v6];

    v7 = [(FCCKPrivateBatchedSaveRecordsOperation *)self remainingBatchesOfRecordsToSave];
    int v8 = [v7 firstObject];
    unint64_t v9 = [v8 count];

    if (v9 >= 0x191)
    {
      do
      {
        [(FCCKPrivateBatchedSaveRecordsOperation *)self _subdivideRemainingBatches];
        __int16 v10 = [(FCCKPrivateBatchedSaveRecordsOperation *)self remainingBatchesOfRecordsToSave];
        objc_super v11 = [v10 firstObject];
        unint64_t v12 = [v11 count];
      }
      while (v12 > 0x190);
    }
  }
  [(FCCKPrivateBatchedSaveRecordsOperation *)self _continueModifying];
}

- (void)operationWillFinishWithError:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    BOOL v5 = [(FCCKPrivateBatchedSaveRecordsOperation *)self resultErrorsByRecordID];
    uint64_t v6 = [v5 count];

    if (v6)
    {
      v7 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v8 = *MEMORY[0x1E4F19C40];
      uint64_t v14 = *MEMORY[0x1E4F19CD8];
      unint64_t v9 = [(FCCKPrivateBatchedSaveRecordsOperation *)self resultErrorsByRecordID];
      v15[0] = v9;
      __int16 v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
      id v4 = [v7 errorWithDomain:v8 code:2 userInfo:v10];
    }
    else
    {
      id v4 = 0;
    }
  }
  objc_super v11 = [(FCCKPrivateBatchedSaveRecordsOperation *)self saveRecordsCompletionBlock];

  if (v11)
  {
    unint64_t v12 = [(FCCKPrivateBatchedSaveRecordsOperation *)self saveRecordsCompletionBlock];
    int v13 = [(FCCKPrivateBatchedSaveRecordsOperation *)self resultSavedRecords];
    ((void (**)(void, void *, id))v12)[2](v12, v13, v4);
  }
}

- (void)_continueModifying
{
  v3 = [(FCCKPrivateBatchedSaveRecordsOperation *)self remainingBatchesOfRecordsToSave];
  id v4 = [v3 firstObject];

  if ([v4 count])
  {
    BOOL v5 = objc_alloc_init(FCCKPrivateSaveRecordsOperation);
    [(FCCKPrivateSaveRecordsOperation *)v5 setRecordsToSave:v4];
    [(FCCKPrivateSaveRecordsOperation *)v5 setSavePolicy:[(FCCKPrivateBatchedSaveRecordsOperation *)self savePolicy]];
    [(FCCKPrivateDatabaseOperation *)v5 setSkipPreflight:[(FCCKPrivateBatchedSaveRecordsOperation *)self skipPreflight]];
    [(FCCKPrivateDatabaseOperation *)v5 setHandleIdentityLoss:[(FCCKPrivateBatchedSaveRecordsOperation *)self handleIdentityLoss]];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __60__FCCKPrivateBatchedSaveRecordsOperation__continueModifying__block_invoke;
    v7[3] = &unk_1E5B4C8F8;
    v7[4] = self;
    [(FCCKPrivateSaveRecordsOperation *)v5 setSaveRecordsCompletionBlock:v7];
    [(FCOperation *)self associateChildOperation:v5];
    uint64_t v6 = [(FCCKPrivateBatchedSaveRecordsOperation *)self database];
    -[FCCKPrivateDatabase addOperation:]((uint64_t)v6, v5);
  }
  else
  {
    [(FCOperation *)self finishedPerformingOperationWithError:0];
  }
}

void __60__FCCKPrivateBatchedSaveRecordsOperation__continueModifying__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  if (objc_msgSend(v5, "fc_isCKErrorWithCode:", 27))
  {
    [*(id *)(a1 + 32) _subdivideRemainingBatches];
    [*(id *)(a1 + 32) _continueModifying];
  }
  else if (v5 && [v5 code] != 2)
  {
    [*(id *)(a1 + 32) finishedPerformingOperationWithError:v5];
  }
  else
  {
    if (v13)
    {
      uint64_t v6 = [*(id *)(a1 + 32) resultSavedRecords];
      [v6 addObjectsFromArray:v13];
    }
    v7 = [*(id *)(a1 + 32) remainingBatchesOfRecordsToSave];
    uint64_t v8 = [v7 count];

    if (v8)
    {
      unint64_t v9 = [*(id *)(a1 + 32) remainingBatchesOfRecordsToSave];
      objc_msgSend(v9, "fc_removeFirstObject");
    }
    __int16 v10 = [v5 userInfo];
    objc_super v11 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F19CD8]];

    if (v11)
    {
      unint64_t v12 = [*(id *)(a1 + 32) resultErrorsByRecordID];
      [v12 addEntriesFromDictionary:v11];
    }
    [*(id *)(a1 + 32) _continueModifying];
  }
}

- (void)_subdivideRemainingBatches
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = [(FCCKPrivateBatchedSaveRecordsOperation *)self remainingBatchesOfRecordsToSave];
  id v4 = (void *)[v3 copy];

  id v5 = [(FCCKPrivateBatchedSaveRecordsOperation *)self remainingBatchesOfRecordsToSave];
  [v5 removeAllObjects];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_super v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        unint64_t v12 = (unint64_t)objc_msgSend(v11, "count", (void)v17) >> 1;
        id v13 = objc_msgSend(v11, "subarrayWithRange:", 0, v12);
        uint64_t v14 = objc_msgSend(v11, "subarrayWithRange:", v12, objc_msgSend(v11, "count") - v12);
        v15 = [(FCCKPrivateBatchedSaveRecordsOperation *)self remainingBatchesOfRecordsToSave];
        [v15 addObject:v13];

        uint64_t v16 = [(FCCKPrivateBatchedSaveRecordsOperation *)self remainingBatchesOfRecordsToSave];
        [v16 addObject:v14];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }
}

- (FCCKPrivateDatabase)database
{
  return self->_database;
}

- (void)setDatabase:(id)a3
{
}

- (NSArray)recordsToSave
{
  return self->_recordsToSave;
}

- (void)setRecordsToSave:(id)a3
{
}

- (int64_t)savePolicy
{
  return self->_savePolicy;
}

- (void)setSavePolicy:(int64_t)a3
{
  self->_savePolicy = a3;
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

- (id)saveRecordsCompletionBlock
{
  return self->_saveRecordsCompletionBlock;
}

- (void)setSaveRecordsCompletionBlock:(id)a3
{
}

- (NSMutableArray)remainingBatchesOfRecordsToSave
{
  return self->_remainingBatchesOfRecordsToSave;
}

- (void)setRemainingBatchesOfRecordsToSave:(id)a3
{
}

- (NSMutableArray)resultSavedRecords
{
  return self->_resultSavedRecords;
}

- (void)setResultSavedRecords:(id)a3
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
  objc_storeStrong((id *)&self->_resultSavedRecords, 0);
  objc_storeStrong((id *)&self->_remainingBatchesOfRecordsToSave, 0);
  objc_storeStrong(&self->_saveRecordsCompletionBlock, 0);
  objc_storeStrong((id *)&self->_recordsToSave, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

@end