@interface WBSRetryableCKModifyRecordsOperation
- (BOOL)atomic;
- (NSArray)recordIDsToDelete;
- (NSArray)recordsToSave;
- (NSData)clientChangeTokenData;
- (id)_makeOperation;
- (id)modifyRecordsCompletionBlock;
- (id)perRecordDeleteBlock;
- (id)perRecordProgressBlock;
- (id)perRecordSaveBlock;
- (int64_t)savePolicy;
- (void)_setUpOperation:(id)a3;
- (void)setAtomic:(BOOL)a3;
- (void)setClientChangeTokenData:(id)a3;
- (void)setModifyRecordsCompletionBlock:(id)a3;
- (void)setPerRecordDeleteBlock:(id)a3;
- (void)setPerRecordProgressBlock:(id)a3;
- (void)setPerRecordSaveBlock:(id)a3;
- (void)setRecordIDsToDelete:(id)a3;
- (void)setRecordsToSave:(id)a3;
- (void)setSavePolicy:(int64_t)a3;
@end

@implementation WBSRetryableCKModifyRecordsOperation

- (NSArray)recordsToSave
{
  p_internalLock = &self->super.super._internalLock;
  os_unfair_lock_lock(&self->super.super._internalLock);
  v4 = (void *)[(NSArray *)self->_recordsToSave copy];
  os_unfair_lock_unlock(p_internalLock);
  return (NSArray *)v4;
}

- (void)setRecordsToSave:(id)a3
{
  p_internalLock = &self->super.super._internalLock;
  id v5 = a3;
  os_unfair_lock_lock(p_internalLock);
  v6 = (NSArray *)[v5 copy];

  recordsToSave = self->_recordsToSave;
  self->_recordsToSave = v6;

  [(NSMutableSet *)self->super.super._explicitlySetProperties addObject:@"recordsToSave"];
  os_unfair_lock_unlock(p_internalLock);
}

- (NSArray)recordIDsToDelete
{
  p_internalLock = &self->super.super._internalLock;
  os_unfair_lock_lock(&self->super.super._internalLock);
  v4 = (void *)[(NSArray *)self->_recordIDsToDelete copy];
  os_unfair_lock_unlock(p_internalLock);
  return (NSArray *)v4;
}

- (void)setRecordIDsToDelete:(id)a3
{
  p_internalLock = &self->super.super._internalLock;
  id v5 = a3;
  os_unfair_lock_lock(p_internalLock);
  v6 = (NSArray *)[v5 copy];

  recordIDsToDelete = self->_recordIDsToDelete;
  self->_recordIDsToDelete = v6;

  [(NSMutableSet *)self->super.super._explicitlySetProperties addObject:@"recordIDsToDelete"];
  os_unfair_lock_unlock(p_internalLock);
}

- (int64_t)savePolicy
{
  p_internalLock = &self->super.super._internalLock;
  os_unfair_lock_lock(&self->super.super._internalLock);
  int64_t savePolicy = self->_savePolicy;
  os_unfair_lock_unlock(p_internalLock);
  return savePolicy;
}

- (void)setSavePolicy:(int64_t)a3
{
  p_internalLock = &self->super.super._internalLock;
  os_unfair_lock_lock(&self->super.super._internalLock);
  self->_int64_t savePolicy = a3;
  [(NSMutableSet *)self->super.super._explicitlySetProperties addObject:@"savePolicy"];
  os_unfair_lock_unlock(p_internalLock);
}

- (NSData)clientChangeTokenData
{
  p_internalLock = &self->super.super._internalLock;
  os_unfair_lock_lock(&self->super.super._internalLock);
  v4 = (void *)[(NSData *)self->_clientChangeTokenData copy];
  os_unfair_lock_unlock(p_internalLock);
  return (NSData *)v4;
}

- (void)setClientChangeTokenData:(id)a3
{
  p_internalLock = &self->super.super._internalLock;
  id v5 = a3;
  os_unfair_lock_lock(p_internalLock);
  v6 = (NSData *)[v5 copy];

  clientChangeTokenData = self->_clientChangeTokenData;
  self->_clientChangeTokenData = v6;

  [(NSMutableSet *)self->super.super._explicitlySetProperties addObject:@"clientChangeTokenData"];
  os_unfair_lock_unlock(p_internalLock);
}

- (BOOL)atomic
{
  v2 = self;
  p_internalLock = &self->super.super._internalLock;
  os_unfair_lock_lock(&self->super.super._internalLock);
  LOBYTE(v2) = v2->_atomic;
  os_unfair_lock_unlock(p_internalLock);
  return (char)v2;
}

- (void)setAtomic:(BOOL)a3
{
  p_internalLock = &self->super.super._internalLock;
  os_unfair_lock_lock(&self->super.super._internalLock);
  self->_atomic = a3;
  [(NSMutableSet *)self->super.super._explicitlySetProperties addObject:@"atomic"];
  os_unfair_lock_unlock(p_internalLock);
}

- (id)perRecordProgressBlock
{
  p_internalLock = &self->super.super._internalLock;
  os_unfair_lock_lock(&self->super.super._internalLock);
  v4 = (void *)[self->_perRecordProgressBlock copy];
  os_unfair_lock_unlock(p_internalLock);
  return v4;
}

- (void)setPerRecordProgressBlock:(id)a3
{
  p_internalLock = &self->super.super._internalLock;
  id v5 = a3;
  os_unfair_lock_lock(p_internalLock);
  v6 = (void *)[v5 copy];

  id perRecordProgressBlock = self->_perRecordProgressBlock;
  self->_id perRecordProgressBlock = v6;

  [(NSMutableSet *)self->super.super._explicitlySetProperties addObject:@"perRecordProgressBlock"];
  os_unfair_lock_unlock(p_internalLock);
}

- (id)perRecordSaveBlock
{
  p_internalLock = &self->super.super._internalLock;
  os_unfair_lock_lock(&self->super.super._internalLock);
  v4 = (void *)[self->_perRecordSaveBlock copy];
  os_unfair_lock_unlock(p_internalLock);
  return v4;
}

- (void)setPerRecordSaveBlock:(id)a3
{
  p_internalLock = &self->super.super._internalLock;
  id v5 = a3;
  os_unfair_lock_lock(p_internalLock);
  v6 = (void *)[v5 copy];

  id perRecordSaveBlock = self->_perRecordSaveBlock;
  self->_id perRecordSaveBlock = v6;

  [(NSMutableSet *)self->super.super._explicitlySetProperties addObject:@"perRecordSaveBlock"];
  os_unfair_lock_unlock(p_internalLock);
}

- (id)perRecordDeleteBlock
{
  p_internalLock = &self->super.super._internalLock;
  os_unfair_lock_lock(&self->super.super._internalLock);
  v4 = (void *)[self->_perRecordDeleteBlock copy];
  os_unfair_lock_unlock(p_internalLock);
  return v4;
}

- (void)setPerRecordDeleteBlock:(id)a3
{
  p_internalLock = &self->super.super._internalLock;
  id v5 = a3;
  os_unfair_lock_lock(p_internalLock);
  v6 = (void *)[v5 copy];

  id perRecordDeleteBlock = self->_perRecordDeleteBlock;
  self->_id perRecordDeleteBlock = v6;

  [(NSMutableSet *)self->super.super._explicitlySetProperties addObject:@"perRecordDeleteBlock"];
  os_unfair_lock_unlock(p_internalLock);
}

- (id)modifyRecordsCompletionBlock
{
  p_internalLock = &self->super.super._internalLock;
  os_unfair_lock_lock(&self->super.super._internalLock);
  v4 = (void *)[self->_modifyRecordsCompletionBlock copy];
  os_unfair_lock_unlock(p_internalLock);
  return v4;
}

- (void)setModifyRecordsCompletionBlock:(id)a3
{
  p_internalLock = &self->super.super._internalLock;
  id v5 = a3;
  os_unfair_lock_lock(p_internalLock);
  v6 = (void *)[v5 copy];

  id modifyRecordsCompletionBlock = self->_modifyRecordsCompletionBlock;
  self->_id modifyRecordsCompletionBlock = v6;

  [(NSMutableSet *)self->super.super._explicitlySetProperties addObject:@"modifyRecordsCompletionBlock"];
  os_unfair_lock_unlock(p_internalLock);
}

- (id)_makeOperation
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1A1A0]);
  return v2;
}

- (void)_setUpOperation:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WBSRetryableCKModifyRecordsOperation;
  [(WBSRetryableCKDatabaseOperation *)&v14 _setUpOperation:v4];
  if (-[NSMutableSet containsObject:](self->super.super._explicitlySetProperties, "containsObject:", @"recordsToSave"))[v4 setRecordsToSave:self->_recordsToSave]; {
  if (-[NSMutableSet containsObject:](self->super.super._explicitlySetProperties, "containsObject:", @"recordIDsToDelete"))[v4 setRecordIDsToDelete:self->_recordIDsToDelete];
  }
  if (-[NSMutableSet containsObject:](self->super.super._explicitlySetProperties, "containsObject:", @"savePolicy"))[v4 setSavePolicy:self->_savePolicy]; {
  if (-[NSMutableSet containsObject:](self->super.super._explicitlySetProperties, "containsObject:", @"clientChangeTokenData"))[v4 setClientChangeTokenData:self->_clientChangeTokenData];
  }
  if (-[NSMutableSet containsObject:](self->super.super._explicitlySetProperties, "containsObject:", @"atomic"))[v4 setAtomic:self->_atomic]; {
  if (self->_perRecordProgressBlock)
  }
  {
    objc_initWeak(&location, self);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __56__WBSRetryableCKModifyRecordsOperation__setUpOperation___block_invoke;
    v11[3] = &unk_1E5C9F5C8;
    objc_copyWeak(&v12, &location);
    [v4 setPerRecordProgressBlock:v11];
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  if (self->_perRecordSaveBlock)
  {
    objc_initWeak(&location, self);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __56__WBSRetryableCKModifyRecordsOperation__setUpOperation___block_invoke_3;
    v9[3] = &unk_1E5C9F460;
    objc_copyWeak(&v10, &location);
    [v4 setPerRecordSaveBlock:v9];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  if (self->_perRecordDeleteBlock)
  {
    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __56__WBSRetryableCKModifyRecordsOperation__setUpOperation___block_invoke_5;
    v7[3] = &unk_1E5C9F5F0;
    objc_copyWeak(&v8, &location);
    [v4 setPerRecordDeleteBlock:v7];
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__WBSRetryableCKModifyRecordsOperation__setUpOperation___block_invoke_7;
  v5[3] = &unk_1E5C9F618;
  objc_copyWeak(&v6, &location);
  [v4 setModifyRecordsCompletionBlock:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __56__WBSRetryableCKModifyRecordsOperation__setUpOperation___block_invoke(uint64_t a1, void *a2, double a3)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    id v8 = (void *)*((void *)WeakRetained + 33);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __56__WBSRetryableCKModifyRecordsOperation__setUpOperation___block_invoke_2;
    v9[3] = &unk_1E5C9F3C0;
    void v9[4] = WeakRetained;
    id v10 = v5;
    double v11 = a3;
    [v8 addOperationWithBlock:v9];
  }
}

void __56__WBSRetryableCKModifyRecordsOperation__setUpOperation___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 248));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 272));
    v3 = (void *)MEMORY[0x1AD0C4F80](*(void *)(*(void *)(a1 + 32) + 432));
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 272));
    id v4 = (void (**)(void, void, void, double))MEMORY[0x1AD0C4F80](v3);

    if (v4) {
      ((void (**)(void, id, void, double))v4)[2](v4, v5, *(void *)(a1 + 40), *(double *)(a1 + 48));
    }

    id WeakRetained = v5;
  }
}

void __56__WBSRetryableCKModifyRecordsOperation__setUpOperation___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v11 = WeakRetained;
  if (WeakRetained)
  {
    id v12 = (void *)*((void *)WeakRetained + 33);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __56__WBSRetryableCKModifyRecordsOperation__setUpOperation___block_invoke_4;
    v13[3] = &unk_1E5C9C448;
    v13[4] = WeakRetained;
    id v14 = v7;
    id v15 = v8;
    id v16 = v9;
    [v12 addOperationWithBlock:v13];
  }
}

void __56__WBSRetryableCKModifyRecordsOperation__setUpOperation___block_invoke_4(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 248));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 272));
    v3 = (void *)MEMORY[0x1AD0C4F80](*(void *)(a1[4] + 440));
    os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 272));
    id v4 = (void (**)(void, void, void, void, void))MEMORY[0x1AD0C4F80](v3);

    if (v4) {
      ((void (**)(void, id, void, void, void))v4)[2](v4, v5, a1[5], a1[6], a1[7]);
    }

    id WeakRetained = v5;
  }
}

void __56__WBSRetryableCKModifyRecordsOperation__setUpOperation___block_invoke_5(uint64_t a1, void *a2, void *a3)
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
    v10[2] = __56__WBSRetryableCKModifyRecordsOperation__setUpOperation___block_invoke_6;
    v10[3] = &unk_1E5C8CD20;
    v10[4] = WeakRetained;
    id v11 = v5;
    id v12 = v6;
    [v9 addOperationWithBlock:v10];
  }
}

void __56__WBSRetryableCKModifyRecordsOperation__setUpOperation___block_invoke_6(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 248));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 272));
    v3 = (void *)MEMORY[0x1AD0C4F80](*(void *)(a1[4] + 448));
    os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 272));
    id v4 = (void (**)(void, void, void, void))MEMORY[0x1AD0C4F80](v3);

    if (v4) {
      ((void (**)(void, id, void, void))v4)[2](v4, v5, a1[5], a1[6]);
    }

    id WeakRetained = v5;
  }
}

void __56__WBSRetryableCKModifyRecordsOperation__setUpOperation___block_invoke_7(uint64_t a1, void *a2, void *a3, void *a4)
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
    v13[2] = __56__WBSRetryableCKModifyRecordsOperation__setUpOperation___block_invoke_8;
    v13[3] = &unk_1E5C9C448;
    v13[4] = WeakRetained;
    id v14 = v9;
    id v15 = v7;
    id v16 = v8;
    [v12 addOperationWithBlock:v13];
  }
}

void __56__WBSRetryableCKModifyRecordsOperation__setUpOperation___block_invoke_8(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 248));
  if (WeakRetained
    && ([*(id *)(a1 + 32) _scheduleRetryIfNeededForError:*(void *)(a1 + 40)] & 1) == 0)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 272));
    v3 = (void *)MEMORY[0x1AD0C4F80](*(void *)(*(void *)(a1 + 32) + 456));
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
  objc_storeStrong(&self->_modifyRecordsCompletionBlock, 0);
  objc_storeStrong(&self->_perRecordDeleteBlock, 0);
  objc_storeStrong(&self->_perRecordSaveBlock, 0);
  objc_storeStrong(&self->_perRecordProgressBlock, 0);
  objc_storeStrong((id *)&self->_clientChangeTokenData, 0);
  objc_storeStrong((id *)&self->_recordIDsToDelete, 0);
  objc_storeStrong((id *)&self->_recordsToSave, 0);
}

@end