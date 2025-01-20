@interface FCCKPrivateFetchRecordZoneChangesOperation
- (BOOL)fetchAllChanges;
- (BOOL)fetchNewestChangesFirst;
- (BOOL)resultMoreComing;
- (BOOL)validateOperation;
- (CKRecordZoneID)recordZoneID;
- (FCCKPrivateDatabaseServerChangeToken)previousServerChangeToken;
- (FCCKPrivateDatabaseServerChangeToken)resultServerChangeToken;
- (NSArray)desiredKeys;
- (NSArray)resultChangedRecords;
- (NSArray)resultDeletedRecordIDs;
- (id)_configurationForDestination:(int64_t)a3;
- (id)fetchRecordZoneChangesCompletionBlock;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)setDesiredKeys:(id)a3;
- (void)setFetchAllChanges:(BOOL)a3;
- (void)setFetchNewestChangesFirst:(BOOL)a3;
- (void)setFetchRecordZoneChangesCompletionBlock:(id)a3;
- (void)setPreviousServerChangeToken:(id)a3;
- (void)setRecordZoneID:(id)a3;
- (void)setResultChangedRecords:(id)a3;
- (void)setResultDeletedRecordIDs:(id)a3;
- (void)setResultMoreComing:(BOOL)a3;
- (void)setResultServerChangeToken:(id)a3;
@end

@implementation FCCKPrivateFetchRecordZoneChangesOperation

- (BOOL)validateOperation
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)FCCKPrivateFetchRecordZoneChangesOperation;
  BOOL v3 = [(FCCKPrivateDatabaseOperation *)&v7 validateOperation];
  v4 = [(FCCKPrivateFetchRecordZoneChangesOperation *)self recordZoneID];

  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v6 = (void *)[[NSString alloc] initWithFormat:@"can't fetch zone changes without a zone ID"];
    *(_DWORD *)buf = 136315906;
    v9 = "-[FCCKPrivateFetchRecordZoneChangesOperation validateOperation]";
    __int16 v10 = 2080;
    v11 = "FCCKPrivateFetchRecordZoneChangesOperation.m";
    __int16 v12 = 1024;
    int v13 = 35;
    __int16 v14 = 2114;
    v15 = v6;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  return v4 && v3;
}

- (void)performOperation
{
  v36[1] = *MEMORY[0x1E4F143B8];
  uint64_t v29 = 0;
  v30 = &v29;
  if ([(FCCKPrivateDatabaseOperation *)self skipPreflight]) {
    uint64_t v3 = 3;
  }
  else {
    uint64_t v3 = 2;
  }
  uint64_t v31 = 0x2020000000;
  uint64_t v32 = 0;
  v4 = [(FCCKPrivateDatabaseOperation *)self database];
  v5 = [(FCCKPrivateFetchRecordZoneChangesOperation *)self recordZoneID];
  v36[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __62__FCCKPrivateFetchRecordZoneChangesOperation_performOperation__block_invoke;
  v28[3] = &unk_1E5B50478;
  v28[4] = &v29;
  -[FCCKPrivateDatabase enumeratePayloadsWithRecordIDs:records:zoneIDs:zones:options:payloadHandler:]((uint64_t)v4, 0, 0, v6, 0, v3, v28);

  id v7 = objc_alloc_init(MEMORY[0x1E4F1A070]);
  v8 = [(FCCKPrivateFetchRecordZoneChangesOperation *)self recordZoneID];
  v35 = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
  [v7 setRecordZoneIDs:v9];

  objc_msgSend(v7, "setFetchAllChanges:", -[FCCKPrivateFetchRecordZoneChangesOperation fetchAllChanges](self, "fetchAllChanges"));
  __int16 v10 = [(FCCKPrivateFetchRecordZoneChangesOperation *)self recordZoneID];
  v33 = v10;
  v11 = [(FCCKPrivateFetchRecordZoneChangesOperation *)self _configurationForDestination:v30[3]];
  v34 = v11;
  __int16 v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
  [v7 setConfigurationsByRecordZoneID:v12];

  int v13 = objc_opt_new();
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __62__FCCKPrivateFetchRecordZoneChangesOperation_performOperation__block_invoke_10;
  v26[3] = &unk_1E5B4D0C8;
  id v14 = v13;
  id v27 = v14;
  [v7 setRecordChangedBlock:v26];
  v15 = [MEMORY[0x1E4F1CA48] array];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __62__FCCKPrivateFetchRecordZoneChangesOperation_performOperation__block_invoke_2;
  v24[3] = &unk_1E5B504A0;
  id v16 = v15;
  id v25 = v16;
  [v7 setRecordWithIDWasDeletedBlock:v24];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __62__FCCKPrivateFetchRecordZoneChangesOperation_performOperation__block_invoke_3;
  v20[3] = &unk_1E5B504C8;
  v23 = &v29;
  v20[4] = self;
  id v17 = v14;
  id v21 = v17;
  id v18 = v16;
  id v22 = v18;
  [v7 setRecordZoneFetchCompletionBlock:v20];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __62__FCCKPrivateFetchRecordZoneChangesOperation_performOperation__block_invoke_4;
  v19[3] = &unk_1E5B4FD28;
  v19[4] = self;
  [v7 setFetchRecordZoneChangesCompletionBlock:v19];
  [(FCCKPrivateDatabaseOperation *)self runChildCKOperation:v7 destination:v30[3]];

  _Block_object_dispose(&v29, 8);
}

void __62__FCCKPrivateFetchRecordZoneChangesOperation_performOperation__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a2;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v5 = (void *)[[NSString alloc] initWithFormat:@"zone should only map to a single destination"];
    int v6 = 136315906;
    id v7 = "-[FCCKPrivateFetchRecordZoneChangesOperation performOperation]_block_invoke";
    __int16 v8 = 2080;
    v9 = "FCCKPrivateFetchRecordZoneChangesOperation.m";
    __int16 v10 = 1024;
    int v11 = 58;
    __int16 v12 = 2114;
    int v13 = v5;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v6, 0x26u);

    if (v3) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v4 = 0;
    goto LABEL_5;
  }
  if (!v3) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = v3[5];
LABEL_5:
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v4;
}

uint64_t __62__FCCKPrivateFetchRecordZoneChangesOperation_performOperation__block_invoke_10(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) addObject:a2];
  }
  return result;
}

uint64_t __62__FCCKPrivateFetchRecordZoneChangesOperation_performOperation__block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) addObject:a2];
  }
  return result;
}

void __62__FCCKPrivateFetchRecordZoneChangesOperation_performOperation__block_invoke_3(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  if (a3)
  {
    uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    __int16 v8 = *(void **)(a1 + 32);
    id v9 = a3;
    __int16 v10 = [v8 previousServerChangeToken];
    id v11 = +[FCCKPrivateDatabaseServerChangeToken tokenByAddingCKToken:v9 forDestination:v7 toToken:v10];
  }
  else
  {
    id v11 = 0;
  }
  [*(id *)(a1 + 32) setResultChangedRecords:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setResultDeletedRecordIDs:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) setResultServerChangeToken:v11];
  [*(id *)(a1 + 32) setResultMoreComing:a5];
}

uint64_t __62__FCCKPrivateFetchRecordZoneChangesOperation_performOperation__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishedPerformingOperationWithError:a2];
}

- (void)operationWillFinishWithError:(id)a3
{
  id v4 = a3;
  v5 = [(FCCKPrivateFetchRecordZoneChangesOperation *)self resultServerChangeToken];
  uint64_t v6 = [(FCCKPrivateFetchRecordZoneChangesOperation *)self resultMoreComing];
  id v18 = v4;
  uint64_t v7 = [(FCCKPrivateFetchRecordZoneChangesOperation *)self resultChangedRecords];
  __int16 v8 = [(FCCKPrivateFetchRecordZoneChangesOperation *)self resultDeletedRecordIDs];
  if (v18)
  {
    if (!v5)
    {
      v5 = [(FCCKPrivateFetchRecordZoneChangesOperation *)self previousServerChangeToken];
    }
    uint64_t v6 = objc_msgSend(v18, "fc_isMissingZoneError") ^ 1;
    id v9 = v18;
    goto LABEL_15;
  }
  id v9 = [(FCCKPrivateFetchRecordZoneChangesOperation *)self previousServerChangeToken];
  if (v9)
  {
    __int16 v10 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    if ([v10 BOOLForKey:@"simulate_expired_change_tokens"])
    {

LABEL_9:
      id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F19C40] code:21 userInfo:MEMORY[0x1E4F1CC08]];
      goto LABEL_11;
    }
    id v11 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    int v12 = [v11 BOOLForKey:@"simulate_server_side_data_reset"];

    if (v12) {
      goto LABEL_9;
    }
    id v9 = 0;
  }
LABEL_11:
  int v13 = [(FCCKPrivateFetchRecordZoneChangesOperation *)self previousServerChangeToken];
  if (v13)
  {
  }
  else
  {
    uint64_t v14 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    int v15 = [v14 BOOLForKey:@"simulate_server_side_data_reset"];

    if (v15)
    {

      uint64_t v7 = (void *)MEMORY[0x1E4F1CBF0];
      __int16 v8 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
LABEL_15:
  id v16 = [(FCCKPrivateFetchRecordZoneChangesOperation *)self fetchRecordZoneChangesCompletionBlock];

  if (v16)
  {
    id v17 = [(FCCKPrivateFetchRecordZoneChangesOperation *)self fetchRecordZoneChangesCompletionBlock];
    ((void (**)(void, void *, void *, void *, uint64_t, void *))v17)[2](v17, v7, v8, v5, v6, v9);
  }
}

- (id)_configurationForDestination:(int64_t)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1A060]);
  uint64_t v6 = [(FCCKPrivateFetchRecordZoneChangesOperation *)self previousServerChangeToken];
  uint64_t v7 = [v6 changeTokenForDestination:a3];
  [v5 setPreviousServerChangeToken:v7];

  __int16 v8 = [(FCCKPrivateFetchRecordZoneChangesOperation *)self desiredKeys];
  [v5 setDesiredKeys:v8];

  objc_msgSend(v5, "setFetchNewestChangesFirst:", -[FCCKPrivateFetchRecordZoneChangesOperation fetchNewestChangesFirst](self, "fetchNewestChangesFirst"));
  return v5;
}

- (CKRecordZoneID)recordZoneID
{
  return self->_recordZoneID;
}

- (void)setRecordZoneID:(id)a3
{
}

- (FCCKPrivateDatabaseServerChangeToken)previousServerChangeToken
{
  return self->_previousServerChangeToken;
}

- (void)setPreviousServerChangeToken:(id)a3
{
}

- (NSArray)desiredKeys
{
  return self->_desiredKeys;
}

- (void)setDesiredKeys:(id)a3
{
}

- (BOOL)fetchNewestChangesFirst
{
  return self->_fetchNewestChangesFirst;
}

- (void)setFetchNewestChangesFirst:(BOOL)a3
{
  self->_fetchNewestChangesFirst = a3;
}

- (BOOL)fetchAllChanges
{
  return self->_fetchAllChanges;
}

- (void)setFetchAllChanges:(BOOL)a3
{
  self->_fetchAllChanges = a3;
}

- (id)fetchRecordZoneChangesCompletionBlock
{
  return self->_fetchRecordZoneChangesCompletionBlock;
}

- (void)setFetchRecordZoneChangesCompletionBlock:(id)a3
{
}

- (NSArray)resultChangedRecords
{
  return self->_resultChangedRecords;
}

- (void)setResultChangedRecords:(id)a3
{
}

- (NSArray)resultDeletedRecordIDs
{
  return self->_resultDeletedRecordIDs;
}

- (void)setResultDeletedRecordIDs:(id)a3
{
}

- (FCCKPrivateDatabaseServerChangeToken)resultServerChangeToken
{
  return self->_resultServerChangeToken;
}

- (void)setResultServerChangeToken:(id)a3
{
}

- (BOOL)resultMoreComing
{
  return self->_resultMoreComing;
}

- (void)setResultMoreComing:(BOOL)a3
{
  self->_resultMoreComing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultServerChangeToken, 0);
  objc_storeStrong((id *)&self->_resultDeletedRecordIDs, 0);
  objc_storeStrong((id *)&self->_resultChangedRecords, 0);
  objc_storeStrong(&self->_fetchRecordZoneChangesCompletionBlock, 0);
  objc_storeStrong((id *)&self->_desiredKeys, 0);
  objc_storeStrong((id *)&self->_previousServerChangeToken, 0);
  objc_storeStrong((id *)&self->_recordZoneID, 0);
}

@end