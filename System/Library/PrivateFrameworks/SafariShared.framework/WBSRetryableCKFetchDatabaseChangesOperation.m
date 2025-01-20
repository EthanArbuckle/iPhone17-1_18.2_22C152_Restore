@interface WBSRetryableCKFetchDatabaseChangesOperation
- (BOOL)fetchAllChanges;
- (CKServerChangeToken)previousServerChangeToken;
- (id)_makeOperation;
- (id)changeTokenUpdatedBlock;
- (id)fetchDatabaseChangesCompletionBlock;
- (id)recordZoneWithIDChangedBlock;
- (id)recordZoneWithIDWasDeletedBlock;
- (id)recordZoneWithIDWasDeletedDueToUserEncryptedDataResetBlock;
- (id)recordZoneWithIDWasPurgedBlock;
- (unint64_t)resultsLimit;
- (void)_setUpOperation:(id)a3;
- (void)setChangeTokenUpdatedBlock:(id)a3;
- (void)setFetchAllChanges:(BOOL)a3;
- (void)setFetchDatabaseChangesCompletionBlock:(id)a3;
- (void)setPreviousServerChangeToken:(id)a3;
- (void)setRecordZoneWithIDChangedBlock:(id)a3;
- (void)setRecordZoneWithIDWasDeletedBlock:(id)a3;
- (void)setRecordZoneWithIDWasDeletedDueToUserEncryptedDataResetBlock:(id)a3;
- (void)setRecordZoneWithIDWasPurgedBlock:(id)a3;
- (void)setResultsLimit:(unint64_t)a3;
@end

@implementation WBSRetryableCKFetchDatabaseChangesOperation

- (CKServerChangeToken)previousServerChangeToken
{
  p_internalLock = &self->super.super._internalLock;
  os_unfair_lock_lock(&self->super.super._internalLock);
  v4 = (void *)[(CKServerChangeToken *)self->_previousServerChangeToken copy];
  os_unfair_lock_unlock(p_internalLock);
  return (CKServerChangeToken *)v4;
}

- (void)setPreviousServerChangeToken:(id)a3
{
  p_internalLock = &self->super.super._internalLock;
  id v5 = a3;
  os_unfair_lock_lock(p_internalLock);
  v6 = (CKServerChangeToken *)[v5 copy];

  previousServerChangeToken = self->_previousServerChangeToken;
  self->_previousServerChangeToken = v6;

  [(NSMutableSet *)self->super.super._explicitlySetProperties addObject:@"previousServerChangeToken"];
  os_unfair_lock_unlock(p_internalLock);
}

- (unint64_t)resultsLimit
{
  p_internalLock = &self->super.super._internalLock;
  os_unfair_lock_lock(&self->super.super._internalLock);
  unint64_t resultsLimit = self->_resultsLimit;
  os_unfair_lock_unlock(p_internalLock);
  return resultsLimit;
}

- (void)setResultsLimit:(unint64_t)a3
{
  p_internalLock = &self->super.super._internalLock;
  os_unfair_lock_lock(&self->super.super._internalLock);
  self->_unint64_t resultsLimit = a3;
  [(NSMutableSet *)self->super.super._explicitlySetProperties addObject:@"resultsLimit"];
  os_unfair_lock_unlock(p_internalLock);
}

- (BOOL)fetchAllChanges
{
  v2 = self;
  p_internalLock = &self->super.super._internalLock;
  os_unfair_lock_lock(&self->super.super._internalLock);
  LOBYTE(v2) = v2->_fetchAllChanges;
  os_unfair_lock_unlock(p_internalLock);
  return (char)v2;
}

- (void)setFetchAllChanges:(BOOL)a3
{
  p_internalLock = &self->super.super._internalLock;
  os_unfair_lock_lock(&self->super.super._internalLock);
  self->_fetchAllChanges = a3;
  [(NSMutableSet *)self->super.super._explicitlySetProperties addObject:@"fetchAllChanges"];
  os_unfair_lock_unlock(p_internalLock);
}

- (id)recordZoneWithIDChangedBlock
{
  p_internalLock = &self->super.super._internalLock;
  os_unfair_lock_lock(&self->super.super._internalLock);
  v4 = (void *)[self->_recordZoneWithIDChangedBlock copy];
  os_unfair_lock_unlock(p_internalLock);
  return v4;
}

- (void)setRecordZoneWithIDChangedBlock:(id)a3
{
  p_internalLock = &self->super.super._internalLock;
  id v5 = a3;
  os_unfair_lock_lock(p_internalLock);
  v6 = (void *)[v5 copy];

  id recordZoneWithIDChangedBlock = self->_recordZoneWithIDChangedBlock;
  self->_id recordZoneWithIDChangedBlock = v6;

  [(NSMutableSet *)self->super.super._explicitlySetProperties addObject:@"recordZoneWithIDChangedBlock"];
  os_unfair_lock_unlock(p_internalLock);
}

- (id)recordZoneWithIDWasDeletedBlock
{
  p_internalLock = &self->super.super._internalLock;
  os_unfair_lock_lock(&self->super.super._internalLock);
  v4 = (void *)[self->_recordZoneWithIDWasDeletedBlock copy];
  os_unfair_lock_unlock(p_internalLock);
  return v4;
}

- (void)setRecordZoneWithIDWasDeletedBlock:(id)a3
{
  p_internalLock = &self->super.super._internalLock;
  id v5 = a3;
  os_unfair_lock_lock(p_internalLock);
  v6 = (void *)[v5 copy];

  id recordZoneWithIDWasDeletedBlock = self->_recordZoneWithIDWasDeletedBlock;
  self->_id recordZoneWithIDWasDeletedBlock = v6;

  [(NSMutableSet *)self->super.super._explicitlySetProperties addObject:@"recordZoneWithIDWasDeletedBlock"];
  os_unfair_lock_unlock(p_internalLock);
}

- (id)recordZoneWithIDWasPurgedBlock
{
  p_internalLock = &self->super.super._internalLock;
  os_unfair_lock_lock(&self->super.super._internalLock);
  v4 = (void *)[self->_recordZoneWithIDWasPurgedBlock copy];
  os_unfair_lock_unlock(p_internalLock);
  return v4;
}

- (void)setRecordZoneWithIDWasPurgedBlock:(id)a3
{
  p_internalLock = &self->super.super._internalLock;
  id v5 = a3;
  os_unfair_lock_lock(p_internalLock);
  v6 = (void *)[v5 copy];

  id recordZoneWithIDWasPurgedBlock = self->_recordZoneWithIDWasPurgedBlock;
  self->_id recordZoneWithIDWasPurgedBlock = v6;

  [(NSMutableSet *)self->super.super._explicitlySetProperties addObject:@"recordZoneWithIDWasPurgedBlock"];
  os_unfair_lock_unlock(p_internalLock);
}

- (id)recordZoneWithIDWasDeletedDueToUserEncryptedDataResetBlock
{
  p_internalLock = &self->super.super._internalLock;
  os_unfair_lock_lock(&self->super.super._internalLock);
  v4 = (void *)[self->_recordZoneWithIDWasDeletedDueToUserEncryptedDataResetBlock copy];
  os_unfair_lock_unlock(p_internalLock);
  return v4;
}

- (void)setRecordZoneWithIDWasDeletedDueToUserEncryptedDataResetBlock:(id)a3
{
  p_internalLock = &self->super.super._internalLock;
  id v5 = a3;
  os_unfair_lock_lock(p_internalLock);
  v6 = (void *)[v5 copy];

  id recordZoneWithIDWasDeletedDueToUserEncryptedDataResetBlock = self->_recordZoneWithIDWasDeletedDueToUserEncryptedDataResetBlock;
  self->_id recordZoneWithIDWasDeletedDueToUserEncryptedDataResetBlock = v6;

  [(NSMutableSet *)self->super.super._explicitlySetProperties addObject:@"recordZoneWithIDWasDeletedDueToUserEncryptedDataResetBlock"];
  os_unfair_lock_unlock(p_internalLock);
}

- (id)changeTokenUpdatedBlock
{
  p_internalLock = &self->super.super._internalLock;
  os_unfair_lock_lock(&self->super.super._internalLock);
  v4 = (void *)[self->_changeTokenUpdatedBlock copy];
  os_unfair_lock_unlock(p_internalLock);
  return v4;
}

- (void)setChangeTokenUpdatedBlock:(id)a3
{
  p_internalLock = &self->super.super._internalLock;
  id v5 = a3;
  os_unfair_lock_lock(p_internalLock);
  v6 = (void *)[v5 copy];

  id changeTokenUpdatedBlock = self->_changeTokenUpdatedBlock;
  self->_id changeTokenUpdatedBlock = v6;

  [(NSMutableSet *)self->super.super._explicitlySetProperties addObject:@"changeTokenUpdatedBlock"];
  os_unfair_lock_unlock(p_internalLock);
}

- (id)fetchDatabaseChangesCompletionBlock
{
  p_internalLock = &self->super.super._internalLock;
  os_unfair_lock_lock(&self->super.super._internalLock);
  v4 = (void *)[self->_fetchDatabaseChangesCompletionBlock copy];
  os_unfair_lock_unlock(p_internalLock);
  return v4;
}

- (void)setFetchDatabaseChangesCompletionBlock:(id)a3
{
  p_internalLock = &self->super.super._internalLock;
  id v5 = a3;
  os_unfair_lock_lock(p_internalLock);
  v6 = (void *)[v5 copy];

  id fetchDatabaseChangesCompletionBlock = self->_fetchDatabaseChangesCompletionBlock;
  self->_id fetchDatabaseChangesCompletionBlock = v6;

  [(NSMutableSet *)self->super.super._explicitlySetProperties addObject:@"fetchDatabaseChangesCompletionBlock"];
  os_unfair_lock_unlock(p_internalLock);
}

- (id)_makeOperation
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1A040]);
  return v2;
}

- (void)_setUpOperation:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)WBSRetryableCKFetchDatabaseChangesOperation;
  [(WBSRetryableCKDatabaseOperation *)&v18 _setUpOperation:v4];
  if (-[NSMutableSet containsObject:](self->super.super._explicitlySetProperties, "containsObject:", @"previousServerChangeToken"))[v4 setPreviousServerChangeToken:self->_previousServerChangeToken]; {
  if (-[NSMutableSet containsObject:](self->super.super._explicitlySetProperties, "containsObject:", @"resultsLimit"))[v4 setResultsLimit:self->_resultsLimit];
  }
  if (-[NSMutableSet containsObject:](self->super.super._explicitlySetProperties, "containsObject:", @"fetchAllChanges"))[v4 setFetchAllChanges:self->_fetchAllChanges]; {
  if (self->_recordZoneWithIDChangedBlock)
  }
  {
    objc_initWeak(&location, self);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __63__WBSRetryableCKFetchDatabaseChangesOperation__setUpOperation___block_invoke;
    v15[3] = &unk_1E5C9F320;
    objc_copyWeak(&v16, &location);
    [v4 setRecordZoneWithIDChangedBlock:v15];
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  if (self->_recordZoneWithIDWasDeletedBlock)
  {
    objc_initWeak(&location, self);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __63__WBSRetryableCKFetchDatabaseChangesOperation__setUpOperation___block_invoke_3;
    v13[3] = &unk_1E5C9F320;
    objc_copyWeak(&v14, &location);
    [v4 setRecordZoneWithIDWasDeletedBlock:v13];
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  if (self->_recordZoneWithIDWasPurgedBlock)
  {
    objc_initWeak(&location, self);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __63__WBSRetryableCKFetchDatabaseChangesOperation__setUpOperation___block_invoke_5;
    v11[3] = &unk_1E5C9F320;
    objc_copyWeak(&v12, &location);
    [v4 setRecordZoneWithIDWasPurgedBlock:v11];
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  if (self->_recordZoneWithIDWasDeletedDueToUserEncryptedDataResetBlock)
  {
    objc_initWeak(&location, self);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __63__WBSRetryableCKFetchDatabaseChangesOperation__setUpOperation___block_invoke_7;
    v9[3] = &unk_1E5C9F320;
    objc_copyWeak(&v10, &location);
    [v4 setRecordZoneWithIDWasDeletedDueToUserEncryptedDataResetBlock:v9];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  if (self->_changeTokenUpdatedBlock)
  {
    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __63__WBSRetryableCKFetchDatabaseChangesOperation__setUpOperation___block_invoke_9;
    v7[3] = &unk_1E5C9F348;
    objc_copyWeak(&v8, &location);
    [v4 setChangeTokenUpdatedBlock:v7];
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63__WBSRetryableCKFetchDatabaseChangesOperation__setUpOperation___block_invoke_11;
  v5[3] = &unk_1E5C9F398;
  objc_copyWeak(&v6, &location);
  [v4 setFetchDatabaseChangesCompletionBlock:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __63__WBSRetryableCKFetchDatabaseChangesOperation__setUpOperation___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = (void *)*((void *)WeakRetained + 33);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __63__WBSRetryableCKFetchDatabaseChangesOperation__setUpOperation___block_invoke_2;
    v7[3] = &unk_1E5C8C920;
    void v7[4] = WeakRetained;
    id v8 = v3;
    [v6 addOperationWithBlock:v7];
  }
}

void __63__WBSRetryableCKFetchDatabaseChangesOperation__setUpOperation___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 248));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 272));
    id v3 = (void *)MEMORY[0x1AD0C4F80](*(void *)(*(void *)(a1 + 32) + 416));
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 272));
    id v4 = (void (**)(void, void, void))MEMORY[0x1AD0C4F80](v3);

    if (v4) {
      ((void (**)(void, id, void))v4)[2](v4, v5, *(void *)(a1 + 40));
    }

    id WeakRetained = v5;
  }
}

void __63__WBSRetryableCKFetchDatabaseChangesOperation__setUpOperation___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = (void *)*((void *)WeakRetained + 33);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __63__WBSRetryableCKFetchDatabaseChangesOperation__setUpOperation___block_invoke_4;
    v7[3] = &unk_1E5C8C920;
    void v7[4] = WeakRetained;
    id v8 = v3;
    [v6 addOperationWithBlock:v7];
  }
}

void __63__WBSRetryableCKFetchDatabaseChangesOperation__setUpOperation___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 248));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 272));
    id v3 = (void *)MEMORY[0x1AD0C4F80](*(void *)(*(void *)(a1 + 32) + 424));
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 272));
    id v4 = (void (**)(void, void, void))MEMORY[0x1AD0C4F80](v3);

    if (v4) {
      ((void (**)(void, id, void))v4)[2](v4, v5, *(void *)(a1 + 40));
    }

    id WeakRetained = v5;
  }
}

void __63__WBSRetryableCKFetchDatabaseChangesOperation__setUpOperation___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = (void *)*((void *)WeakRetained + 33);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __63__WBSRetryableCKFetchDatabaseChangesOperation__setUpOperation___block_invoke_6;
    v7[3] = &unk_1E5C8C920;
    void v7[4] = WeakRetained;
    id v8 = v3;
    [v6 addOperationWithBlock:v7];
  }
}

void __63__WBSRetryableCKFetchDatabaseChangesOperation__setUpOperation___block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 248));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 272));
    id v3 = (void *)MEMORY[0x1AD0C4F80](*(void *)(*(void *)(a1 + 32) + 432));
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 272));
    id v4 = (void (**)(void, void, void))MEMORY[0x1AD0C4F80](v3);

    if (v4) {
      ((void (**)(void, id, void))v4)[2](v4, v5, *(void *)(a1 + 40));
    }

    id WeakRetained = v5;
  }
}

void __63__WBSRetryableCKFetchDatabaseChangesOperation__setUpOperation___block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = (void *)*((void *)WeakRetained + 33);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __63__WBSRetryableCKFetchDatabaseChangesOperation__setUpOperation___block_invoke_8;
    v7[3] = &unk_1E5C8C920;
    void v7[4] = WeakRetained;
    id v8 = v3;
    [v6 addOperationWithBlock:v7];
  }
}

void __63__WBSRetryableCKFetchDatabaseChangesOperation__setUpOperation___block_invoke_8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 248));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 272));
    id v3 = (void *)MEMORY[0x1AD0C4F80](*(void *)(*(void *)(a1 + 32) + 440));
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 272));
    id v4 = (void (**)(void, void, void))MEMORY[0x1AD0C4F80](v3);

    if (v4) {
      ((void (**)(void, id, void))v4)[2](v4, v5, *(void *)(a1 + 40));
    }

    id WeakRetained = v5;
  }
}

void __63__WBSRetryableCKFetchDatabaseChangesOperation__setUpOperation___block_invoke_9(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = (void *)*((void *)WeakRetained + 33);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __63__WBSRetryableCKFetchDatabaseChangesOperation__setUpOperation___block_invoke_10;
    v7[3] = &unk_1E5C8C920;
    void v7[4] = WeakRetained;
    id v8 = v3;
    [v6 addOperationWithBlock:v7];
  }
}

void __63__WBSRetryableCKFetchDatabaseChangesOperation__setUpOperation___block_invoke_10(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 248));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 272));
    id v3 = (void *)MEMORY[0x1AD0C4F80](*(void *)(*(void *)(a1 + 32) + 448));
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 272));
    id v4 = (void (**)(void, void, void))MEMORY[0x1AD0C4F80](v3);

    if (v4) {
      ((void (**)(void, id, void))v4)[2](v4, v5, *(void *)(a1 + 40));
    }

    id WeakRetained = v5;
  }
}

void __63__WBSRetryableCKFetchDatabaseChangesOperation__setUpOperation___block_invoke_11(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v10 = WeakRetained;
  if (WeakRetained)
  {
    v11 = (void *)*((void *)WeakRetained + 33);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __63__WBSRetryableCKFetchDatabaseChangesOperation__setUpOperation___block_invoke_12;
    v12[3] = &unk_1E5C9F370;
    v12[4] = WeakRetained;
    id v13 = v8;
    id v14 = v7;
    char v15 = a3;
    [v11 addOperationWithBlock:v12];
  }
}

void __63__WBSRetryableCKFetchDatabaseChangesOperation__setUpOperation___block_invoke_12(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 248));
  if (WeakRetained
    && ([*(id *)(a1 + 32) _scheduleRetryIfNeededForError:*(void *)(a1 + 40)] & 1) == 0)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 272));
    id v3 = (void *)MEMORY[0x1AD0C4F80](*(void *)(*(void *)(a1 + 32) + 456));
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 272));
    id v4 = (void (**)(void, void, void, void, void, void))MEMORY[0x1AD0C4F80](v3);

    if (v4) {
      ((void (**)(void, void, id, void, void, void))v4)[2](v4, *(void *)(a1 + 32), WeakRetained, *(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 40));
    }
    id v5 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138543362;
      uint64_t v8 = v6;
      _os_log_impl(&dword_1A6B5F000, v5, OS_LOG_TYPE_DEFAULT, "Operation of %{public}@ did finish successfully", (uint8_t *)&v7, 0xCu);
    }

    [*(id *)(a1 + 32) _didFinishOperation];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fetchDatabaseChangesCompletionBlock, 0);
  objc_storeStrong(&self->_changeTokenUpdatedBlock, 0);
  objc_storeStrong(&self->_recordZoneWithIDWasDeletedDueToUserEncryptedDataResetBlock, 0);
  objc_storeStrong(&self->_recordZoneWithIDWasPurgedBlock, 0);
  objc_storeStrong(&self->_recordZoneWithIDWasDeletedBlock, 0);
  objc_storeStrong(&self->_recordZoneWithIDChangedBlock, 0);
  objc_storeStrong((id *)&self->_previousServerChangeToken, 0);
}

@end