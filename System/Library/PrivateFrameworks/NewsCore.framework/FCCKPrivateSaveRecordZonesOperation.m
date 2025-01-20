@interface FCCKPrivateSaveRecordZonesOperation
- (BOOL)canBypassEncryptionRequirement;
- (BOOL)validateOperation;
- (NSArray)recordZonesToSave;
- (NSArray)resultSavedRecordZones;
- (id)saveRecordZonesCompletionBlock;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)setCanBypassEncryptionRequirement:(BOOL)a3;
- (void)setRecordZonesToSave:(id)a3;
- (void)setResultSavedRecordZones:(id)a3;
- (void)setSaveRecordZonesCompletionBlock:(id)a3;
@end

@implementation FCCKPrivateSaveRecordZonesOperation

- (BOOL)validateOperation
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)FCCKPrivateSaveRecordZonesOperation;
  BOOL v3 = [(FCCKPrivateDatabaseOperation *)&v8 validateOperation];
  v4 = [(FCCKPrivateSaveRecordZonesOperation *)self recordZonesToSave];
  uint64_t v5 = [v4 count];

  if (!v5 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)[[NSString alloc] initWithFormat:@"can't save zones without zones to save"];
    *(_DWORD *)buf = 136315906;
    v10 = "-[FCCKPrivateSaveRecordZonesOperation validateOperation]";
    __int16 v11 = 2080;
    v12 = "FCCKPrivateSaveRecordZonesOperation.m";
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
  uint64_t v5 = [(FCCKPrivateDatabaseOperation *)self database];
  v6 = [(FCCKPrivateSaveRecordZonesOperation *)self recordZonesToSave];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __55__FCCKPrivateSaveRecordZonesOperation_performOperation__block_invoke;
  v10[3] = &unk_1E5B4E710;
  v10[4] = self;
  __int16 v11 = v3;
  v7 = v3;
  -[FCCKPrivateDatabase enumeratePayloadsWithRecordIDs:records:zoneIDs:zones:options:payloadHandler:]((uint64_t)v5, 0, 0, 0, v6, v4, v10);

  uint64_t v8 = [(FCCKPrivateSaveRecordZonesOperation *)self qualityOfService];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__FCCKPrivateSaveRecordZonesOperation_performOperation__block_invoke_2_11;
  v9[3] = &unk_1E5B4C8F8;
  v9[4] = self;
  [(FCCKPrivateDatabaseCKOperationResults *)v7 notifyWhenFinishWithQoS:v8 completionHandler:v9];
}

void __55__FCCKPrivateSaveRecordZonesOperation_performOperation__block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1A180]);
  if (v3) {
    uint64_t v5 = (void *)v3[4];
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;
  [v4 setRecordZonesToSave:v6];

  -[CKDatabaseOperation setFc_canBypassEncryptionRequirement:](v4, [*(id *)(a1 + 32) canBypassEncryptionRequirement]);
  [*(id *)(a1 + 40) operationWillStart];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  __int16 v11 = __55__FCCKPrivateSaveRecordZonesOperation_performOperation__block_invoke_2;
  v12 = &unk_1E5B4E6E8;
  id v13 = v3;
  id v14 = *(id *)(a1 + 40);
  v7 = v3;
  [v4 setModifyRecordZonesCompletionBlock:&v9];
  if (v3) {
    uint64_t v8 = v7[5];
  }
  else {
    uint64_t v8 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "runChildCKOperation:destination:", v4, v8, v9, v10, v11, v12);
}

void __55__FCCKPrivateSaveRecordZonesOperation_performOperation__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a2;
  if ([a3 count] && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v12 = (void *)[[NSString alloc] initWithFormat:@"shouldn't have any deleted zones when saving zones"];
    int v13 = 136315906;
    id v14 = "-[FCCKPrivateSaveRecordZonesOperation performOperation]_block_invoke_2";
    __int16 v15 = 2080;
    v16 = "FCCKPrivateSaveRecordZonesOperation.m";
    __int16 v17 = 1024;
    int v18 = 58;
    __int16 v19 = 2114;
    v20 = v12;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v13, 0x26u);
  }
  uint64_t v9 = *(void **)(a1 + 32);
  if (v9) {
    uint64_t v9 = (void *)v9[4];
  }
  uint64_t v10 = v9;
  __int16 v11 = objc_msgSend(v10, "fc_arrayByTransformingWithBlock:", &__block_literal_global_185);

  [*(id *)(a1 + 40) operationDidFinishWithItemIDs:v11 resultItems:v8 error:v7];
}

uint64_t __55__FCCKPrivateSaveRecordZonesOperation_performOperation__block_invoke_7(uint64_t a1, void *a2)
{
  return [a2 zoneID];
}

void __55__FCCKPrivateSaveRecordZonesOperation_performOperation__block_invoke_2_11(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 setResultSavedRecordZones:a2];
  [*(id *)(a1 + 32) finishedPerformingOperationWithError:v6];
}

- (void)operationWillFinishWithError:(id)a3
{
  id v7 = a3;
  id v4 = [(FCCKPrivateSaveRecordZonesOperation *)self saveRecordZonesCompletionBlock];

  if (v4)
  {
    uint64_t v5 = [(FCCKPrivateSaveRecordZonesOperation *)self saveRecordZonesCompletionBlock];
    id v6 = [(FCCKPrivateSaveRecordZonesOperation *)self resultSavedRecordZones];
    ((void (**)(void, void *, id))v5)[2](v5, v6, v7);
  }
}

- (NSArray)recordZonesToSave
{
  return self->_recordZonesToSave;
}

- (void)setRecordZonesToSave:(id)a3
{
}

- (BOOL)canBypassEncryptionRequirement
{
  return self->_canBypassEncryptionRequirement;
}

- (void)setCanBypassEncryptionRequirement:(BOOL)a3
{
  self->_canBypassEncryptionRequirement = a3;
}

- (id)saveRecordZonesCompletionBlock
{
  return self->_saveRecordZonesCompletionBlock;
}

- (void)setSaveRecordZonesCompletionBlock:(id)a3
{
}

- (NSArray)resultSavedRecordZones
{
  return self->_resultSavedRecordZones;
}

- (void)setResultSavedRecordZones:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultSavedRecordZones, 0);
  objc_storeStrong(&self->_saveRecordZonesCompletionBlock, 0);
  objc_storeStrong((id *)&self->_recordZonesToSave, 0);
}

@end