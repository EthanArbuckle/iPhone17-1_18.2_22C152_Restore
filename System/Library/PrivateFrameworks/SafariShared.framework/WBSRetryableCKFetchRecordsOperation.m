@interface WBSRetryableCKFetchRecordsOperation
- (NSArray)desiredKeys;
- (NSArray)recordIDs;
- (id)_makeOperation;
- (id)fetchRecordsCompletionBlock;
- (id)perRecordCompletionBlock;
- (id)perRecordProgressBlock;
- (void)_setUpOperation:(id)a3;
- (void)setDesiredKeys:(id)a3;
- (void)setFetchRecordsCompletionBlock:(id)a3;
- (void)setPerRecordCompletionBlock:(id)a3;
- (void)setPerRecordProgressBlock:(id)a3;
- (void)setRecordIDs:(id)a3;
@end

@implementation WBSRetryableCKFetchRecordsOperation

- (NSArray)recordIDs
{
  p_internalLock = &self->super.super._internalLock;
  os_unfair_lock_lock(&self->super.super._internalLock);
  v4 = (void *)[(NSArray *)self->_recordIDs copy];
  os_unfair_lock_unlock(p_internalLock);
  return (NSArray *)v4;
}

- (void)setRecordIDs:(id)a3
{
  p_internalLock = &self->super.super._internalLock;
  id v5 = a3;
  os_unfair_lock_lock(p_internalLock);
  v6 = (NSArray *)[v5 copy];

  recordIDs = self->_recordIDs;
  self->_recordIDs = v6;

  [(NSMutableSet *)self->super.super._explicitlySetProperties addObject:@"recordIDs"];
  os_unfair_lock_unlock(p_internalLock);
}

- (NSArray)desiredKeys
{
  p_internalLock = &self->super.super._internalLock;
  os_unfair_lock_lock(&self->super.super._internalLock);
  v4 = (void *)[(NSArray *)self->_desiredKeys copy];
  os_unfair_lock_unlock(p_internalLock);
  return (NSArray *)v4;
}

- (void)setDesiredKeys:(id)a3
{
  p_internalLock = &self->super.super._internalLock;
  id v5 = a3;
  os_unfair_lock_lock(p_internalLock);
  v6 = (NSArray *)[v5 copy];

  desiredKeys = self->_desiredKeys;
  self->_desiredKeys = v6;

  [(NSMutableSet *)self->super.super._explicitlySetProperties addObject:@"desiredKeys"];
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

- (id)perRecordCompletionBlock
{
  p_internalLock = &self->super.super._internalLock;
  os_unfair_lock_lock(&self->super.super._internalLock);
  v4 = (void *)[self->_perRecordCompletionBlock copy];
  os_unfair_lock_unlock(p_internalLock);
  return v4;
}

- (void)setPerRecordCompletionBlock:(id)a3
{
  p_internalLock = &self->super.super._internalLock;
  id v5 = a3;
  os_unfair_lock_lock(p_internalLock);
  v6 = (void *)[v5 copy];

  id perRecordCompletionBlock = self->_perRecordCompletionBlock;
  self->_id perRecordCompletionBlock = v6;

  [(NSMutableSet *)self->super.super._explicitlySetProperties addObject:@"perRecordCompletionBlock"];
  os_unfair_lock_unlock(p_internalLock);
}

- (id)fetchRecordsCompletionBlock
{
  p_internalLock = &self->super.super._internalLock;
  os_unfair_lock_lock(&self->super.super._internalLock);
  v4 = (void *)[self->_fetchRecordsCompletionBlock copy];
  os_unfair_lock_unlock(p_internalLock);
  return v4;
}

- (void)setFetchRecordsCompletionBlock:(id)a3
{
  p_internalLock = &self->super.super._internalLock;
  id v5 = a3;
  os_unfair_lock_lock(p_internalLock);
  v6 = (void *)[v5 copy];

  id fetchRecordsCompletionBlock = self->_fetchRecordsCompletionBlock;
  self->_id fetchRecordsCompletionBlock = v6;

  [(NSMutableSet *)self->super.super._explicitlySetProperties addObject:@"fetchRecordsCompletionBlock"];
  os_unfair_lock_unlock(p_internalLock);
}

- (id)_makeOperation
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1A0A0]);
  return v2;
}

- (void)_setUpOperation:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WBSRetryableCKFetchRecordsOperation;
  [(WBSRetryableCKDatabaseOperation *)&v12 _setUpOperation:v4];
  if (-[NSMutableSet containsObject:](self->super.super._explicitlySetProperties, "containsObject:", @"recordIDs"))[v4 setRecordIDs:self->_recordIDs]; {
  if (-[NSMutableSet containsObject:](self->super.super._explicitlySetProperties, "containsObject:", @"desiredKeys"))[v4 setDesiredKeys:self->_desiredKeys];
  }
  if (self->_perRecordProgressBlock)
  {
    objc_initWeak(&location, self);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __55__WBSRetryableCKFetchRecordsOperation__setUpOperation___block_invoke;
    v9[3] = &unk_1E5C9F3E8;
    objc_copyWeak(&v10, &location);
    [v4 setPerRecordProgressBlock:v9];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  if (self->_perRecordCompletionBlock)
  {
    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __55__WBSRetryableCKFetchRecordsOperation__setUpOperation___block_invoke_3;
    v7[3] = &unk_1E5C9F410;
    objc_copyWeak(&v8, &location);
    [v4 setPerRecordCompletionBlock:v7];
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__WBSRetryableCKFetchRecordsOperation__setUpOperation___block_invoke_5;
  v5[3] = &unk_1E5C9F438;
  objc_copyWeak(&v6, &location);
  [v4 setFetchRecordsCompletionBlock:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __55__WBSRetryableCKFetchRecordsOperation__setUpOperation___block_invoke(uint64_t a1, void *a2, double a3)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    id v8 = (void *)*((void *)WeakRetained + 33);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __55__WBSRetryableCKFetchRecordsOperation__setUpOperation___block_invoke_2;
    v9[3] = &unk_1E5C9F3C0;
    void v9[4] = WeakRetained;
    id v10 = v5;
    double v11 = a3;
    [v8 addOperationWithBlock:v9];
  }
}

void __55__WBSRetryableCKFetchRecordsOperation__setUpOperation___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 248));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 272));
    v3 = (void *)MEMORY[0x1AD0C4F80](*(void *)(*(void *)(a1 + 32) + 408));
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 272));
    id v4 = (void (**)(void, void, void, double))MEMORY[0x1AD0C4F80](v3);

    if (v4) {
      ((void (**)(void, id, void, double))v4)[2](v4, v5, *(void *)(a1 + 40), *(double *)(a1 + 48));
    }

    id WeakRetained = v5;
  }
}

void __55__WBSRetryableCKFetchRecordsOperation__setUpOperation___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v11 = WeakRetained;
  if (WeakRetained)
  {
    objc_super v12 = (void *)*((void *)WeakRetained + 33);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __55__WBSRetryableCKFetchRecordsOperation__setUpOperation___block_invoke_4;
    v13[3] = &unk_1E5C9C448;
    v13[4] = WeakRetained;
    id v14 = v7;
    id v15 = v8;
    id v16 = v9;
    [v12 addOperationWithBlock:v13];
  }
}

void __55__WBSRetryableCKFetchRecordsOperation__setUpOperation___block_invoke_4(void *a1)
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

void __55__WBSRetryableCKFetchRecordsOperation__setUpOperation___block_invoke_5(uint64_t a1, void *a2, void *a3)
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
    v10[2] = __55__WBSRetryableCKFetchRecordsOperation__setUpOperation___block_invoke_6;
    v10[3] = &unk_1E5C8CD20;
    v10[4] = WeakRetained;
    id v11 = v6;
    id v12 = v5;
    [v9 addOperationWithBlock:v10];
  }
}

void __55__WBSRetryableCKFetchRecordsOperation__setUpOperation___block_invoke_6(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 248));
  if (WeakRetained
    && ([*(id *)(a1 + 32) _scheduleRetryIfNeededForError:*(void *)(a1 + 40)] & 1) == 0)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 272));
    v3 = (void *)MEMORY[0x1AD0C4F80](*(void *)(*(void *)(a1 + 32) + 424));
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 272));
    id v4 = (void (**)(void, void, void, void, void))MEMORY[0x1AD0C4F80](v3);

    if (v4) {
      ((void (**)(void, void, id, void, void))v4)[2](v4, *(void *)(a1 + 32), WeakRetained, *(void *)(a1 + 48), *(void *)(a1 + 40));
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
  objc_storeStrong(&self->_fetchRecordsCompletionBlock, 0);
  objc_storeStrong(&self->_perRecordCompletionBlock, 0);
  objc_storeStrong(&self->_perRecordProgressBlock, 0);
  objc_storeStrong((id *)&self->_desiredKeys, 0);
  objc_storeStrong((id *)&self->_recordIDs, 0);
}

@end