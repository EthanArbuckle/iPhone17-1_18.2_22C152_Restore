@interface FCCKPrivateDeleteRecordZonesOperation
- (BOOL)secureDatabaseOnly;
- (BOOL)validateOperation;
- (NSArray)recordZoneIDsToDelete;
- (NSArray)resultDeletedRecordZoneIDs;
- (id)deleteRecordZonesCompletionBlock;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)setDeleteRecordZonesCompletionBlock:(id)a3;
- (void)setRecordZoneIDsToDelete:(id)a3;
- (void)setResultDeletedRecordZoneIDs:(id)a3;
- (void)setSecureDatabaseOnly:(BOOL)a3;
@end

@implementation FCCKPrivateDeleteRecordZonesOperation

- (BOOL)validateOperation
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)FCCKPrivateDeleteRecordZonesOperation;
  BOOL v3 = [(FCCKPrivateDatabaseOperation *)&v8 validateOperation];
  v4 = [(FCCKPrivateDeleteRecordZonesOperation *)self recordZoneIDsToDelete];
  uint64_t v5 = [v4 count];

  if (!v5 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)[[NSString alloc] initWithFormat:@"can't delete zones without zone IDs to delete"];
    *(_DWORD *)buf = 136315906;
    v10 = "-[FCCKPrivateDeleteRecordZonesOperation validateOperation]";
    __int16 v11 = 2080;
    v12 = "FCCKPrivateDeleteRecordZonesOperation.m";
    __int16 v13 = 1024;
    int v14 = 27;
    __int16 v15 = 2114;
    v16 = v7;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  return v5 && v3;
}

- (void)performOperation
{
  BOOL v3 = objc_alloc_init(FCCKPrivateDatabaseCKOperationResults);
  uint64_t v4 = [(FCCKPrivateDatabaseOperation *)self skipPreflight];
  if ([(FCCKPrivateDeleteRecordZonesOperation *)self secureDatabaseOnly]) {
    v4 |= 4uLL;
  }
  uint64_t v5 = [(FCCKPrivateDatabaseOperation *)self database];
  v6 = [(FCCKPrivateDeleteRecordZonesOperation *)self recordZoneIDsToDelete];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__FCCKPrivateDeleteRecordZonesOperation_performOperation__block_invoke;
  v10[3] = &unk_1E5B4E710;
  v10[4] = self;
  __int16 v11 = v3;
  v7 = v3;
  -[FCCKPrivateDatabase enumeratePayloadsWithRecordIDs:records:zoneIDs:zones:options:payloadHandler:]((uint64_t)v5, 0, 0, v6, 0, v4, v10);

  uint64_t v8 = [(FCCKPrivateDeleteRecordZonesOperation *)self qualityOfService];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__FCCKPrivateDeleteRecordZonesOperation_performOperation__block_invoke_13;
  v9[3] = &unk_1E5B4C8F8;
  v9[4] = self;
  [(FCCKPrivateDatabaseCKOperationResults *)v7 notifyWhenFinishWithQoS:v8 completionHandler:v9];
}

void __57__FCCKPrivateDeleteRecordZonesOperation_performOperation__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  BOOL v3 = a2;
  if ([*(id *)(a1 + 32) secureDatabaseOnly])
  {
    if (v3 && v3[5] == 3)
    {
      id v4 = objc_alloc_init(MEMORY[0x1E4F1A180]);
LABEL_8:
      char v5 = 0;
      v6 = (void *)v3[3];
      goto LABEL_9;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v10 = (void *)[[NSString alloc] initWithFormat:@"this delete-zones operation should only go to the secure database"];
      *(_DWORD *)buf = 136315906;
      v18 = "-[FCCKPrivateDeleteRecordZonesOperation performOperation]_block_invoke";
      __int16 v19 = 2080;
      v20 = "FCCKPrivateDeleteRecordZonesOperation.m";
      __int16 v21 = 1024;
      int v22 = 54;
      __int16 v23 = 2114;
      v24 = v10;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
  }
  id v4 = objc_alloc_init(MEMORY[0x1E4F1A180]);
  if (v3) {
    goto LABEL_8;
  }
  v6 = 0;
  char v5 = 1;
LABEL_9:
  id v7 = v6;
  [v4 setRecordZoneIDsToDelete:v7];

  [*(id *)(a1 + 40) operationWillStart];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  __int16 v13 = __57__FCCKPrivateDeleteRecordZonesOperation_performOperation__block_invoke_7;
  int v14 = &unk_1E5B4E6E8;
  id v15 = *(id *)(a1 + 40);
  id v16 = v3;
  uint64_t v8 = v3;
  [v4 setModifyRecordZonesCompletionBlock:&v11];
  if (v5) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = v8[5];
  }
  objc_msgSend(*(id *)(a1 + 32), "runChildCKOperation:destination:", v4, v9, v11, v12, v13, v14);
}

void __57__FCCKPrivateDeleteRecordZonesOperation_performOperation__block_invoke_7(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a3;
  if ([a2 count] && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v12 = (void *)[[NSString alloc] initWithFormat:@"shouldn't have any saved zones when deleting zones"];
    int v13 = 136315906;
    int v14 = "-[FCCKPrivateDeleteRecordZonesOperation performOperation]_block_invoke";
    __int16 v15 = 2080;
    id v16 = "FCCKPrivateDeleteRecordZonesOperation.m";
    __int16 v17 = 1024;
    int v18 = 63;
    __int16 v19 = 2114;
    v20 = v12;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v13, 0x26u);
  }
  v10 = *(void **)(a1 + 32);
  uint64_t v9 = *(void **)(a1 + 40);
  if (v9) {
    uint64_t v9 = (void *)v9[3];
  }
  uint64_t v11 = v9;
  [v10 operationDidFinishWithItemIDs:v11 resultItems:v8 error:v7];
}

void __57__FCCKPrivateDeleteRecordZonesOperation_performOperation__block_invoke_13(uint64_t a1, uint64_t a2, void *a3)
{
  char v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 setResultDeletedRecordZoneIDs:a2];
  [*(id *)(a1 + 32) finishedPerformingOperationWithError:v6];
}

- (void)operationWillFinishWithError:(id)a3
{
  id v7 = a3;
  id v4 = [(FCCKPrivateDeleteRecordZonesOperation *)self deleteRecordZonesCompletionBlock];

  if (v4)
  {
    char v5 = [(FCCKPrivateDeleteRecordZonesOperation *)self deleteRecordZonesCompletionBlock];
    id v6 = [(FCCKPrivateDeleteRecordZonesOperation *)self resultDeletedRecordZoneIDs];
    ((void (**)(void, void *, id))v5)[2](v5, v6, v7);
  }
}

- (NSArray)recordZoneIDsToDelete
{
  return self->_recordZoneIDsToDelete;
}

- (void)setRecordZoneIDsToDelete:(id)a3
{
}

- (BOOL)secureDatabaseOnly
{
  return self->_secureDatabaseOnly;
}

- (void)setSecureDatabaseOnly:(BOOL)a3
{
  self->_secureDatabaseOnly = a3;
}

- (id)deleteRecordZonesCompletionBlock
{
  return self->_deleteRecordZonesCompletionBlock;
}

- (void)setDeleteRecordZonesCompletionBlock:(id)a3
{
}

- (NSArray)resultDeletedRecordZoneIDs
{
  return self->_resultDeletedRecordZoneIDs;
}

- (void)setResultDeletedRecordZoneIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultDeletedRecordZoneIDs, 0);
  objc_storeStrong(&self->_deleteRecordZonesCompletionBlock, 0);
  objc_storeStrong((id *)&self->_recordZoneIDsToDelete, 0);
}

@end