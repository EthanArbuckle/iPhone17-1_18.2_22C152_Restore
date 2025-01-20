@interface WBSRetryableCKFetchRecordZoneChangesOperation
- (BOOL)fetchAllChanges;
- (NSArray)recordZoneIDs;
- (NSDictionary)configurationsByRecordZoneID;
- (id)_makeOperation;
- (id)fetchRecordZoneChangesCompletionBlock;
- (id)recordWasChangedBlock;
- (id)recordWithIDWasDeletedBlock;
- (id)recordZoneChangeTokensUpdatedBlock;
- (id)recordZoneFetchCompletionBlock;
- (void)_setUpOperation:(id)a3;
- (void)setConfigurationsByRecordZoneID:(id)a3;
- (void)setFetchAllChanges:(BOOL)a3;
- (void)setFetchRecordZoneChangesCompletionBlock:(id)a3;
- (void)setRecordWasChangedBlock:(id)a3;
- (void)setRecordWithIDWasDeletedBlock:(id)a3;
- (void)setRecordZoneChangeTokensUpdatedBlock:(id)a3;
- (void)setRecordZoneFetchCompletionBlock:(id)a3;
- (void)setRecordZoneIDs:(id)a3;
@end

@implementation WBSRetryableCKFetchRecordZoneChangesOperation

- (NSArray)recordZoneIDs
{
  p_internalLock = &self->super.super._internalLock;
  os_unfair_lock_lock(&self->super.super._internalLock);
  v4 = (void *)[(NSArray *)self->_recordZoneIDs copy];
  os_unfair_lock_unlock(p_internalLock);
  return (NSArray *)v4;
}

- (void)setRecordZoneIDs:(id)a3
{
  p_internalLock = &self->super.super._internalLock;
  id v5 = a3;
  os_unfair_lock_lock(p_internalLock);
  v6 = (NSArray *)[v5 copy];

  recordZoneIDs = self->_recordZoneIDs;
  self->_recordZoneIDs = v6;

  [(NSMutableSet *)self->super.super._explicitlySetProperties addObject:@"recordZoneIDs"];
  os_unfair_lock_unlock(p_internalLock);
}

- (NSDictionary)configurationsByRecordZoneID
{
  p_internalLock = &self->super.super._internalLock;
  os_unfair_lock_lock(&self->super.super._internalLock);
  v4 = (void *)[(NSDictionary *)self->_configurationsByRecordZoneID copy];
  os_unfair_lock_unlock(p_internalLock);
  return (NSDictionary *)v4;
}

- (void)setConfigurationsByRecordZoneID:(id)a3
{
  p_internalLock = &self->super.super._internalLock;
  id v5 = a3;
  os_unfair_lock_lock(p_internalLock);
  v6 = (NSDictionary *)[v5 copy];

  configurationsByRecordZoneID = self->_configurationsByRecordZoneID;
  self->_configurationsByRecordZoneID = v6;

  [(NSMutableSet *)self->super.super._explicitlySetProperties addObject:@"configurationsByRecordZoneID"];
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

- (id)recordWasChangedBlock
{
  p_internalLock = &self->super.super._internalLock;
  os_unfair_lock_lock(&self->super.super._internalLock);
  v4 = (void *)[self->_recordWasChangedBlock copy];
  os_unfair_lock_unlock(p_internalLock);
  return v4;
}

- (void)setRecordWasChangedBlock:(id)a3
{
  p_internalLock = &self->super.super._internalLock;
  id v5 = a3;
  os_unfair_lock_lock(p_internalLock);
  v6 = (void *)[v5 copy];

  id recordWasChangedBlock = self->_recordWasChangedBlock;
  self->_id recordWasChangedBlock = v6;

  [(NSMutableSet *)self->super.super._explicitlySetProperties addObject:@"recordWasChangedBlock"];
  os_unfair_lock_unlock(p_internalLock);
}

- (id)recordWithIDWasDeletedBlock
{
  p_internalLock = &self->super.super._internalLock;
  os_unfair_lock_lock(&self->super.super._internalLock);
  v4 = (void *)[self->_recordWithIDWasDeletedBlock copy];
  os_unfair_lock_unlock(p_internalLock);
  return v4;
}

- (void)setRecordWithIDWasDeletedBlock:(id)a3
{
  p_internalLock = &self->super.super._internalLock;
  id v5 = a3;
  os_unfair_lock_lock(p_internalLock);
  v6 = (void *)[v5 copy];

  id recordWithIDWasDeletedBlock = self->_recordWithIDWasDeletedBlock;
  self->_id recordWithIDWasDeletedBlock = v6;

  [(NSMutableSet *)self->super.super._explicitlySetProperties addObject:@"recordWithIDWasDeletedBlock"];
  os_unfair_lock_unlock(p_internalLock);
}

- (id)recordZoneChangeTokensUpdatedBlock
{
  p_internalLock = &self->super.super._internalLock;
  os_unfair_lock_lock(&self->super.super._internalLock);
  v4 = (void *)[self->_recordZoneChangeTokensUpdatedBlock copy];
  os_unfair_lock_unlock(p_internalLock);
  return v4;
}

- (void)setRecordZoneChangeTokensUpdatedBlock:(id)a3
{
  p_internalLock = &self->super.super._internalLock;
  id v5 = a3;
  os_unfair_lock_lock(p_internalLock);
  v6 = (void *)[v5 copy];

  id recordZoneChangeTokensUpdatedBlock = self->_recordZoneChangeTokensUpdatedBlock;
  self->_id recordZoneChangeTokensUpdatedBlock = v6;

  [(NSMutableSet *)self->super.super._explicitlySetProperties addObject:@"recordZoneChangeTokensUpdatedBlock"];
  os_unfair_lock_unlock(p_internalLock);
}

- (id)recordZoneFetchCompletionBlock
{
  p_internalLock = &self->super.super._internalLock;
  os_unfair_lock_lock(&self->super.super._internalLock);
  v4 = (void *)[self->_recordZoneFetchCompletionBlock copy];
  os_unfair_lock_unlock(p_internalLock);
  return v4;
}

- (void)setRecordZoneFetchCompletionBlock:(id)a3
{
  p_internalLock = &self->super.super._internalLock;
  id v5 = a3;
  os_unfair_lock_lock(p_internalLock);
  v6 = (void *)[v5 copy];

  id recordZoneFetchCompletionBlock = self->_recordZoneFetchCompletionBlock;
  self->_id recordZoneFetchCompletionBlock = v6;

  [(NSMutableSet *)self->super.super._explicitlySetProperties addObject:@"recordZoneFetchCompletionBlock"];
  os_unfair_lock_unlock(p_internalLock);
}

- (id)fetchRecordZoneChangesCompletionBlock
{
  p_internalLock = &self->super.super._internalLock;
  os_unfair_lock_lock(&self->super.super._internalLock);
  v4 = (void *)[self->_fetchRecordZoneChangesCompletionBlock copy];
  os_unfair_lock_unlock(p_internalLock);
  return v4;
}

- (void)setFetchRecordZoneChangesCompletionBlock:(id)a3
{
  p_internalLock = &self->super.super._internalLock;
  id v5 = a3;
  os_unfair_lock_lock(p_internalLock);
  v6 = (void *)[v5 copy];

  id fetchRecordZoneChangesCompletionBlock = self->_fetchRecordZoneChangesCompletionBlock;
  self->_id fetchRecordZoneChangesCompletionBlock = v6;

  [(NSMutableSet *)self->super.super._explicitlySetProperties addObject:@"fetchRecordZoneChangesCompletionBlock"];
  os_unfair_lock_unlock(p_internalLock);
}

- (id)_makeOperation
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1A068]);
  return v2;
}

- (void)_setUpOperation:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)WBSRetryableCKFetchRecordZoneChangesOperation;
  [(WBSRetryableCKDatabaseOperation *)&v16 _setUpOperation:v4];
  if (-[NSMutableSet containsObject:](self->super.super._explicitlySetProperties, "containsObject:", @"recordZoneIDs"))[v4 setRecordZoneIDs:self->_recordZoneIDs]; {
  if (-[NSMutableSet containsObject:](self->super.super._explicitlySetProperties, "containsObject:", @"configurationsByRecordZoneID"))[v4 setConfigurationsByRecordZoneID:self->_configurationsByRecordZoneID];
  }
  if (-[NSMutableSet containsObject:](self->super.super._explicitlySetProperties, "containsObject:", @"fetchAllChanges"))[v4 setFetchAllChanges:self->_fetchAllChanges]; {
  if (self->_recordWasChangedBlock)
  }
  {
    objc_initWeak(&location, self);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __65__WBSRetryableCKFetchRecordZoneChangesOperation__setUpOperation___block_invoke;
    v13[3] = &unk_1E5C9F460;
    objc_copyWeak(&v14, &location);
    [v4 setRecordWasChangedBlock:v13];
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  if (self->_recordWithIDWasDeletedBlock)
  {
    objc_initWeak(&location, self);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __65__WBSRetryableCKFetchRecordZoneChangesOperation__setUpOperation___block_invoke_3;
    v11[3] = &unk_1E5C9F488;
    objc_copyWeak(&v12, &location);
    [v4 setRecordWithIDWasDeletedBlock:v11];
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  if (self->_recordZoneChangeTokensUpdatedBlock)
  {
    objc_initWeak(&location, self);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __65__WBSRetryableCKFetchRecordZoneChangesOperation__setUpOperation___block_invoke_5;
    v9[3] = &unk_1E5C9F4B0;
    objc_copyWeak(&v10, &location);
    [v4 setRecordZoneChangeTokensUpdatedBlock:v9];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  if (self->_recordZoneFetchCompletionBlock)
  {
    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __65__WBSRetryableCKFetchRecordZoneChangesOperation__setUpOperation___block_invoke_7;
    v7[3] = &unk_1E5C9F500;
    objc_copyWeak(&v8, &location);
    [v4 setRecordZoneFetchCompletionBlock:v7];
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __65__WBSRetryableCKFetchRecordZoneChangesOperation__setUpOperation___block_invoke_9;
  v5[3] = &unk_1E5C9F2F8;
  objc_copyWeak(&v6, &location);
  [v4 setFetchRecordZoneChangesCompletionBlock:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __65__WBSRetryableCKFetchRecordZoneChangesOperation__setUpOperation___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v11 = WeakRetained;
  if (WeakRetained)
  {
    id v12 = (void *)*((void *)WeakRetained + 33);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __65__WBSRetryableCKFetchRecordZoneChangesOperation__setUpOperation___block_invoke_2;
    v13[3] = &unk_1E5C9C448;
    void v13[4] = WeakRetained;
    id v14 = v7;
    id v15 = v8;
    id v16 = v9;
    [v12 addOperationWithBlock:v13];
  }
}

void __65__WBSRetryableCKFetchRecordZoneChangesOperation__setUpOperation___block_invoke_2(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 248));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 272));
    v3 = (void *)MEMORY[0x1AD0C4F80](*(void *)(a1[4] + 416));
    os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 272));
    id v4 = (void (**)(void, void, void, void, void))MEMORY[0x1AD0C4F80](v3);

    if (v4) {
      ((void (**)(void, id, void, void, void))v4)[2](v4, v5, a1[5], a1[6], a1[7]);
    }

    id WeakRetained = v5;
  }
}

void __65__WBSRetryableCKFetchRecordZoneChangesOperation__setUpOperation___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = (void *)*((void *)WeakRetained + 33);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __65__WBSRetryableCKFetchRecordZoneChangesOperation__setUpOperation___block_invoke_4;
    v10[3] = &unk_1E5C8CD20;
    v10[4] = WeakRetained;
    id v11 = v5;
    id v12 = v6;
    [v9 addOperationWithBlock:v10];
  }
}

void __65__WBSRetryableCKFetchRecordZoneChangesOperation__setUpOperation___block_invoke_4(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 248));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 272));
    v3 = (void *)MEMORY[0x1AD0C4F80](*(void *)(a1[4] + 424));
    os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 272));
    id v4 = (void (**)(void, void, void, void))MEMORY[0x1AD0C4F80](v3);

    if (v4) {
      ((void (**)(void, id, void, void))v4)[2](v4, v5, a1[5], a1[6]);
    }

    id WeakRetained = v5;
  }
}

void __65__WBSRetryableCKFetchRecordZoneChangesOperation__setUpOperation___block_invoke_5(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v11 = WeakRetained;
  if (WeakRetained)
  {
    id v12 = (void *)*((void *)WeakRetained + 33);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __65__WBSRetryableCKFetchRecordZoneChangesOperation__setUpOperation___block_invoke_6;
    v13[3] = &unk_1E5C9C448;
    void v13[4] = WeakRetained;
    id v14 = v7;
    id v15 = v8;
    id v16 = v9;
    [v12 addOperationWithBlock:v13];
  }
}

void __65__WBSRetryableCKFetchRecordZoneChangesOperation__setUpOperation___block_invoke_6(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 248));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 272));
    v3 = (void *)MEMORY[0x1AD0C4F80](*(void *)(a1[4] + 432));
    os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 272));
    id v4 = (void (**)(void, void, void, void, void))MEMORY[0x1AD0C4F80](v3);

    if (v4) {
      ((void (**)(void, id, void, void, void))v4)[2](v4, v5, a1[5], a1[6], a1[7]);
    }

    id WeakRetained = v5;
  }
}

void __65__WBSRetryableCKFetchRecordZoneChangesOperation__setUpOperation___block_invoke_7(uint64_t a1, void *a2, void *a3, void *a4, char a5, void *a6)
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v16 = WeakRetained;
  if (WeakRetained)
  {
    v17 = (void *)*((void *)WeakRetained + 33);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __65__WBSRetryableCKFetchRecordZoneChangesOperation__setUpOperation___block_invoke_8;
    v18[3] = &unk_1E5C9F4D8;
    v18[4] = WeakRetained;
    id v19 = v11;
    id v20 = v12;
    id v21 = v13;
    char v23 = a5;
    id v22 = v14;
    [v17 addOperationWithBlock:v18];
  }
}

void __65__WBSRetryableCKFetchRecordZoneChangesOperation__setUpOperation___block_invoke_8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 248));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 272));
    v3 = (void *)MEMORY[0x1AD0C4F80](*(void *)(*(void *)(a1 + 32) + 440));
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 272));
    id v4 = (void (**)(void, void, void, void, void, void, void))MEMORY[0x1AD0C4F80](v3);

    if (v4) {
      ((void (**)(void, id, void, void, void, void, void))v4)[2](v4, v5, *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(unsigned __int8 *)(a1 + 72), *(void *)(a1 + 64));
    }

    id WeakRetained = v5;
  }
}

void __65__WBSRetryableCKFetchRecordZoneChangesOperation__setUpOperation___block_invoke_9(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = (void *)*((void *)WeakRetained + 33);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __65__WBSRetryableCKFetchRecordZoneChangesOperation__setUpOperation___block_invoke_10;
    v7[3] = &unk_1E5C8C920;
    void v7[4] = WeakRetained;
    id v8 = v3;
    [v6 addOperationWithBlock:v7];
  }
}

void __65__WBSRetryableCKFetchRecordZoneChangesOperation__setUpOperation___block_invoke_10(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 248));
  if (WeakRetained
    && ([*(id *)(a1 + 32) _scheduleRetryIfNeededForError:*(void *)(a1 + 40)] & 1) == 0)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 272));
    id v3 = (void *)MEMORY[0x1AD0C4F80](*(void *)(*(void *)(a1 + 32) + 448));
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 272));
    id v4 = (void (**)(void, void, void, void))MEMORY[0x1AD0C4F80](v3);

    if (v4) {
      ((void (**)(void, void, id, void))v4)[2](v4, *(void *)(a1 + 32), WeakRetained, *(void *)(a1 + 40));
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
  objc_storeStrong(&self->_fetchRecordZoneChangesCompletionBlock, 0);
  objc_storeStrong(&self->_recordZoneFetchCompletionBlock, 0);
  objc_storeStrong(&self->_recordZoneChangeTokensUpdatedBlock, 0);
  objc_storeStrong(&self->_recordWithIDWasDeletedBlock, 0);
  objc_storeStrong(&self->_recordWasChangedBlock, 0);
  objc_storeStrong((id *)&self->_configurationsByRecordZoneID, 0);
  objc_storeStrong((id *)&self->_recordZoneIDs, 0);
}

@end