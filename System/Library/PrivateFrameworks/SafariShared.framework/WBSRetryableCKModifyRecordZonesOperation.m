@interface WBSRetryableCKModifyRecordZonesOperation
- (NSArray)recordZoneIDsToDelete;
- (NSArray)recordZonesToSave;
- (id)_makeOperation;
- (id)modifyRecordZonesCompletionBlock;
- (id)perRecordZoneDeleteBlock;
- (id)perRecordZoneSaveBlock;
- (void)_setUpOperation:(id)a3;
- (void)setModifyRecordZonesCompletionBlock:(id)a3;
- (void)setPerRecordZoneDeleteBlock:(id)a3;
- (void)setPerRecordZoneSaveBlock:(id)a3;
- (void)setRecordZoneIDsToDelete:(id)a3;
- (void)setRecordZonesToSave:(id)a3;
@end

@implementation WBSRetryableCKModifyRecordZonesOperation

- (NSArray)recordZonesToSave
{
  p_internalLock = &self->super.super._internalLock;
  os_unfair_lock_lock(&self->super.super._internalLock);
  v4 = (void *)[(NSArray *)self->_recordZonesToSave copy];
  os_unfair_lock_unlock(p_internalLock);
  return (NSArray *)v4;
}

- (void)setRecordZonesToSave:(id)a3
{
  p_internalLock = &self->super.super._internalLock;
  id v5 = a3;
  os_unfair_lock_lock(p_internalLock);
  v6 = (NSArray *)[v5 copy];

  recordZonesToSave = self->_recordZonesToSave;
  self->_recordZonesToSave = v6;

  [(NSMutableSet *)self->super.super._explicitlySetProperties addObject:@"recordZonesToSave"];
  os_unfair_lock_unlock(p_internalLock);
}

- (NSArray)recordZoneIDsToDelete
{
  p_internalLock = &self->super.super._internalLock;
  os_unfair_lock_lock(&self->super.super._internalLock);
  v4 = (void *)[(NSArray *)self->_recordZoneIDsToDelete copy];
  os_unfair_lock_unlock(p_internalLock);
  return (NSArray *)v4;
}

- (void)setRecordZoneIDsToDelete:(id)a3
{
  p_internalLock = &self->super.super._internalLock;
  id v5 = a3;
  os_unfair_lock_lock(p_internalLock);
  v6 = (NSArray *)[v5 copy];

  recordZoneIDsToDelete = self->_recordZoneIDsToDelete;
  self->_recordZoneIDsToDelete = v6;

  [(NSMutableSet *)self->super.super._explicitlySetProperties addObject:@"recordZoneIDsToDelete"];
  os_unfair_lock_unlock(p_internalLock);
}

- (id)perRecordZoneSaveBlock
{
  p_internalLock = &self->super.super._internalLock;
  os_unfair_lock_lock(&self->super.super._internalLock);
  v4 = (void *)[self->_perRecordZoneSaveBlock copy];
  os_unfair_lock_unlock(p_internalLock);
  return v4;
}

- (void)setPerRecordZoneSaveBlock:(id)a3
{
  p_internalLock = &self->super.super._internalLock;
  id v5 = a3;
  os_unfair_lock_lock(p_internalLock);
  v6 = (void *)[v5 copy];

  id perRecordZoneSaveBlock = self->_perRecordZoneSaveBlock;
  self->_id perRecordZoneSaveBlock = v6;

  [(NSMutableSet *)self->super.super._explicitlySetProperties addObject:@"perRecordZoneSaveBlock"];
  os_unfair_lock_unlock(p_internalLock);
}

- (id)perRecordZoneDeleteBlock
{
  p_internalLock = &self->super.super._internalLock;
  os_unfair_lock_lock(&self->super.super._internalLock);
  v4 = (void *)[self->_perRecordZoneDeleteBlock copy];
  os_unfair_lock_unlock(p_internalLock);
  return v4;
}

- (void)setPerRecordZoneDeleteBlock:(id)a3
{
  p_internalLock = &self->super.super._internalLock;
  id v5 = a3;
  os_unfair_lock_lock(p_internalLock);
  v6 = (void *)[v5 copy];

  id perRecordZoneDeleteBlock = self->_perRecordZoneDeleteBlock;
  self->_id perRecordZoneDeleteBlock = v6;

  [(NSMutableSet *)self->super.super._explicitlySetProperties addObject:@"perRecordZoneDeleteBlock"];
  os_unfair_lock_unlock(p_internalLock);
}

- (id)modifyRecordZonesCompletionBlock
{
  p_internalLock = &self->super.super._internalLock;
  os_unfair_lock_lock(&self->super.super._internalLock);
  v4 = (void *)[self->_modifyRecordZonesCompletionBlock copy];
  os_unfair_lock_unlock(p_internalLock);
  return v4;
}

- (void)setModifyRecordZonesCompletionBlock:(id)a3
{
  p_internalLock = &self->super.super._internalLock;
  id v5 = a3;
  os_unfair_lock_lock(p_internalLock);
  v6 = (void *)[v5 copy];

  id modifyRecordZonesCompletionBlock = self->_modifyRecordZonesCompletionBlock;
  self->_id modifyRecordZonesCompletionBlock = v6;

  [(NSMutableSet *)self->super.super._explicitlySetProperties addObject:@"modifyRecordZonesCompletionBlock"];
  os_unfair_lock_unlock(p_internalLock);
}

- (id)_makeOperation
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1A188]);
  return v2;
}

- (void)_setUpOperation:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WBSRetryableCKModifyRecordZonesOperation;
  [(WBSRetryableCKDatabaseOperation *)&v12 _setUpOperation:v4];
  if (-[NSMutableSet containsObject:](self->super.super._explicitlySetProperties, "containsObject:", @"recordZonesToSave"))[v4 setRecordZonesToSave:self->_recordZonesToSave]; {
  if (-[NSMutableSet containsObject:](self->super.super._explicitlySetProperties, "containsObject:", @"recordZoneIDsToDelete"))[v4 setRecordZoneIDsToDelete:self->_recordZoneIDsToDelete];
  }
  if (self->_perRecordZoneSaveBlock)
  {
    objc_initWeak(&location, self);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __60__WBSRetryableCKModifyRecordZonesOperation__setUpOperation___block_invoke;
    v9[3] = &unk_1E5C9F528;
    objc_copyWeak(&v10, &location);
    [v4 setPerRecordZoneSaveBlock:v9];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  if (self->_perRecordZoneDeleteBlock)
  {
    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __60__WBSRetryableCKModifyRecordZonesOperation__setUpOperation___block_invoke_3;
    v7[3] = &unk_1E5C9F640;
    objc_copyWeak(&v8, &location);
    [v4 setPerRecordZoneDeleteBlock:v7];
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60__WBSRetryableCKModifyRecordZonesOperation__setUpOperation___block_invoke_5;
  v5[3] = &unk_1E5C9F618;
  objc_copyWeak(&v6, &location);
  [v4 setModifyRecordZonesCompletionBlock:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __60__WBSRetryableCKModifyRecordZonesOperation__setUpOperation___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v11 = WeakRetained;
  if (WeakRetained)
  {
    objc_super v12 = (void *)*((void *)WeakRetained + 33);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __60__WBSRetryableCKModifyRecordZonesOperation__setUpOperation___block_invoke_2;
    v13[3] = &unk_1E5C9C448;
    v13[4] = WeakRetained;
    id v14 = v7;
    id v15 = v8;
    id v16 = v9;
    [v12 addOperationWithBlock:v13];
  }
}

void __60__WBSRetryableCKModifyRecordZonesOperation__setUpOperation___block_invoke_2(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 248));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 272));
    v3 = (void *)MEMORY[0x1AD0C4F80](*(void *)(a1[4] + 408));
    os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 272));
    id v4 = (void (**)(void, void, void, void, void))MEMORY[0x1AD0C4F80](v3);

    if (v4) {
      ((void (**)(void, id, void, void, void))v4)[2](v4, v5, a1[5], a1[6], a1[7]);
    }

    id WeakRetained = v5;
  }
}

void __60__WBSRetryableCKModifyRecordZonesOperation__setUpOperation___block_invoke_3(uint64_t a1, void *a2, void *a3)
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
    v10[2] = __60__WBSRetryableCKModifyRecordZonesOperation__setUpOperation___block_invoke_4;
    v10[3] = &unk_1E5C8CD20;
    v10[4] = WeakRetained;
    id v11 = v5;
    id v12 = v6;
    [v9 addOperationWithBlock:v10];
  }
}

void __60__WBSRetryableCKModifyRecordZonesOperation__setUpOperation___block_invoke_4(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 248));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 272));
    v3 = (void *)MEMORY[0x1AD0C4F80](*(void *)(a1[4] + 416));
    os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 272));
    id v4 = (void (**)(void, void, void, void))MEMORY[0x1AD0C4F80](v3);

    if (v4) {
      ((void (**)(void, id, void, void))v4)[2](v4, v5, a1[5], a1[6]);
    }

    id WeakRetained = v5;
  }
}

void __60__WBSRetryableCKModifyRecordZonesOperation__setUpOperation___block_invoke_5(uint64_t a1, void *a2, void *a3, void *a4)
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
    v13[2] = __60__WBSRetryableCKModifyRecordZonesOperation__setUpOperation___block_invoke_6;
    v13[3] = &unk_1E5C9C448;
    v13[4] = WeakRetained;
    id v14 = v9;
    id v15 = v7;
    id v16 = v8;
    [v12 addOperationWithBlock:v13];
  }
}

void __60__WBSRetryableCKModifyRecordZonesOperation__setUpOperation___block_invoke_6(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 248));
  if (WeakRetained
    && ([*(id *)(a1 + 32) _scheduleRetryIfNeededForError:*(void *)(a1 + 40)] & 1) == 0)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 272));
    v3 = (void *)MEMORY[0x1AD0C4F80](*(void *)(*(void *)(a1 + 32) + 424));
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 272));
    id v4 = (void (**)(void, void, void, void, void, void))MEMORY[0x1AD0C4F80](v3);

    if (v4) {
      ((void (**)(void, void, id, void, void, void))v4)[2](v4, *(void *)(a1 + 32), WeakRetained, *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 40));
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
  objc_storeStrong(&self->_modifyRecordZonesCompletionBlock, 0);
  objc_storeStrong(&self->_perRecordZoneDeleteBlock, 0);
  objc_storeStrong(&self->_perRecordZoneSaveBlock, 0);
  objc_storeStrong((id *)&self->_recordZoneIDsToDelete, 0);
  objc_storeStrong((id *)&self->_recordZonesToSave, 0);
}

@end