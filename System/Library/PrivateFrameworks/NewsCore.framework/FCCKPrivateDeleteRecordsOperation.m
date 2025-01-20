@interface FCCKPrivateDeleteRecordsOperation
- (BOOL)validateOperation;
- (NSArray)recordIDsToDelete;
- (NSArray)resultDeletedRecordIDs;
- (NSArray)resultSavedRecords;
- (id)deleteRecordsCompletionBlock;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)setDeleteRecordsCompletionBlock:(id)a3;
- (void)setRecordIDsToDelete:(id)a3;
- (void)setResultDeletedRecordIDs:(id)a3;
- (void)setResultSavedRecords:(id)a3;
@end

@implementation FCCKPrivateDeleteRecordsOperation

- (BOOL)validateOperation
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)FCCKPrivateDeleteRecordsOperation;
  BOOL v3 = [(FCCKPrivateDatabaseOperation *)&v8 validateOperation];
  v4 = [(FCCKPrivateDeleteRecordsOperation *)self recordIDsToDelete];
  uint64_t v5 = [v4 count];

  if (!v5 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)[[NSString alloc] initWithFormat:@"can't delete records without records IDs to delete"];
    *(_DWORD *)buf = 136315906;
    v10 = "-[FCCKPrivateDeleteRecordsOperation validateOperation]";
    __int16 v11 = 2080;
    v12 = "FCCKPrivateDeleteRecordsOperation.m";
    __int16 v13 = 1024;
    int v14 = 28;
    __int16 v15 = 2114;
    v16 = v7;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  return v5 && v3;
}

- (void)performOperation
{
  BOOL v3 = objc_alloc_init(FCCKPrivateDatabaseCKOperationResults);
  if ([(FCCKPrivateDatabaseOperation *)self skipPreflight]) {
    uint64_t v4 = 3;
  }
  else {
    uint64_t v4 = 2;
  }
  uint64_t v5 = [(FCCKPrivateDatabaseOperation *)self database];
  v6 = [(FCCKPrivateDeleteRecordsOperation *)self recordIDsToDelete];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __53__FCCKPrivateDeleteRecordsOperation_performOperation__block_invoke;
  v10[3] = &unk_1E5B4E710;
  __int16 v11 = v3;
  v12 = self;
  v7 = v3;
  -[FCCKPrivateDatabase enumeratePayloadsWithRecordIDs:records:zoneIDs:zones:options:payloadHandler:]((uint64_t)v5, v6, 0, 0, 0, v4, v10);

  uint64_t v8 = [(FCCKPrivateDeleteRecordsOperation *)self qualityOfService];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__FCCKPrivateDeleteRecordsOperation_performOperation__block_invoke_3;
  v9[3] = &unk_1E5B4C8F8;
  v9[4] = self;
  [(FCCKPrivateDatabaseCKOperationResults *)v7 notifyWhenFinishWithQoS:v8 completionHandler:v9];
}

void __53__FCCKPrivateDeleteRecordsOperation_performOperation__block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = a2;
  [*(id *)(a1 + 32) operationWillStart];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1A198]);
  if (v3) {
    uint64_t v5 = (void *)v3[1];
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;
  [v4 setRecordIDsToDelete:v6];

  [v4 setAtomic:0];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  __int16 v11 = __53__FCCKPrivateDeleteRecordsOperation_performOperation__block_invoke_2;
  v12 = &unk_1E5B4E6E8;
  id v13 = *(id *)(a1 + 32);
  id v14 = v3;
  v7 = v3;
  [v4 setModifyRecordsCompletionBlock:&v9];
  if (v3) {
    uint64_t v8 = v7[5];
  }
  else {
    uint64_t v8 = 0;
  }
  objc_msgSend(*(id *)(a1 + 40), "runChildCKOperation:destination:", v4, v8, v9, v10, v11, v12);
}

void __53__FCCKPrivateDeleteRecordsOperation_performOperation__block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = a4;
  id v8 = a3;
  if (v6) {
    uint64_t v9 = *(void **)(v6 + 8);
  }
  else {
    uint64_t v9 = 0;
  }
  id v10 = v9;
  [v5 operationDidFinishWithItemIDs:v10 resultItems:v8 error:v7];
}

void __53__FCCKPrivateDeleteRecordsOperation_performOperation__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 setResultDeletedRecordIDs:a2];
  [*(id *)(a1 + 32) finishedPerformingOperationWithError:v6];
}

- (void)operationWillFinishWithError:(id)a3
{
  id v7 = a3;
  id v4 = [(FCCKPrivateDeleteRecordsOperation *)self deleteRecordsCompletionBlock];

  if (v4)
  {
    uint64_t v5 = [(FCCKPrivateDeleteRecordsOperation *)self deleteRecordsCompletionBlock];
    id v6 = [(FCCKPrivateDeleteRecordsOperation *)self resultDeletedRecordIDs];
    ((void (**)(void, void *, id))v5)[2](v5, v6, v7);
  }
}

- (NSArray)recordIDsToDelete
{
  return self->_recordIDsToDelete;
}

- (void)setRecordIDsToDelete:(id)a3
{
}

- (id)deleteRecordsCompletionBlock
{
  return self->_deleteRecordsCompletionBlock;
}

- (void)setDeleteRecordsCompletionBlock:(id)a3
{
}

- (NSArray)resultSavedRecords
{
  return self->_resultSavedRecords;
}

- (void)setResultSavedRecords:(id)a3
{
}

- (NSArray)resultDeletedRecordIDs
{
  return self->_resultDeletedRecordIDs;
}

- (void)setResultDeletedRecordIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultDeletedRecordIDs, 0);
  objc_storeStrong((id *)&self->_resultSavedRecords, 0);
  objc_storeStrong(&self->_deleteRecordsCompletionBlock, 0);
  objc_storeStrong((id *)&self->_recordIDsToDelete, 0);
}

@end