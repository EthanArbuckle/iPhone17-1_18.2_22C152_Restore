@interface WBSRetryableCKModifySubscriptionsOperation
- (NSArray)subscriptionIDsToDelete;
- (NSArray)subscriptionsToSave;
- (id)_makeOperation;
- (id)modifySubscriptionsCompletionBlock;
- (id)perSubscriptionDeleteBlock;
- (id)perSubscriptionSaveBlock;
- (void)_setUpOperation:(id)a3;
- (void)setModifySubscriptionsCompletionBlock:(id)a3;
- (void)setPerSubscriptionDeleteBlock:(id)a3;
- (void)setPerSubscriptionSaveBlock:(id)a3;
- (void)setSubscriptionIDsToDelete:(id)a3;
- (void)setSubscriptionsToSave:(id)a3;
@end

@implementation WBSRetryableCKModifySubscriptionsOperation

- (NSArray)subscriptionsToSave
{
  p_internalLock = &self->super.super._internalLock;
  os_unfair_lock_lock(&self->super.super._internalLock);
  v4 = (void *)[(NSArray *)self->_subscriptionsToSave copy];
  os_unfair_lock_unlock(p_internalLock);
  return (NSArray *)v4;
}

- (void)setSubscriptionsToSave:(id)a3
{
  p_internalLock = &self->super.super._internalLock;
  id v5 = a3;
  os_unfair_lock_lock(p_internalLock);
  v6 = (NSArray *)[v5 copy];

  subscriptionsToSave = self->_subscriptionsToSave;
  self->_subscriptionsToSave = v6;

  [(NSMutableSet *)self->super.super._explicitlySetProperties addObject:@"subscriptionsToSave"];
  os_unfair_lock_unlock(p_internalLock);
}

- (NSArray)subscriptionIDsToDelete
{
  p_internalLock = &self->super.super._internalLock;
  os_unfair_lock_lock(&self->super.super._internalLock);
  v4 = (void *)[(NSArray *)self->_subscriptionIDsToDelete copy];
  os_unfair_lock_unlock(p_internalLock);
  return (NSArray *)v4;
}

- (void)setSubscriptionIDsToDelete:(id)a3
{
  p_internalLock = &self->super.super._internalLock;
  id v5 = a3;
  os_unfair_lock_lock(p_internalLock);
  v6 = (NSArray *)[v5 copy];

  subscriptionIDsToDelete = self->_subscriptionIDsToDelete;
  self->_subscriptionIDsToDelete = v6;

  [(NSMutableSet *)self->super.super._explicitlySetProperties addObject:@"subscriptionIDsToDelete"];
  os_unfair_lock_unlock(p_internalLock);
}

- (id)perSubscriptionSaveBlock
{
  p_internalLock = &self->super.super._internalLock;
  os_unfair_lock_lock(&self->super.super._internalLock);
  v4 = (void *)[self->_perSubscriptionSaveBlock copy];
  os_unfair_lock_unlock(p_internalLock);
  return v4;
}

- (void)setPerSubscriptionSaveBlock:(id)a3
{
  p_internalLock = &self->super.super._internalLock;
  id v5 = a3;
  os_unfair_lock_lock(p_internalLock);
  v6 = (void *)[v5 copy];

  id perSubscriptionSaveBlock = self->_perSubscriptionSaveBlock;
  self->_id perSubscriptionSaveBlock = v6;

  [(NSMutableSet *)self->super.super._explicitlySetProperties addObject:@"perSubscriptionSaveBlock"];
  os_unfair_lock_unlock(p_internalLock);
}

- (id)perSubscriptionDeleteBlock
{
  p_internalLock = &self->super.super._internalLock;
  os_unfair_lock_lock(&self->super.super._internalLock);
  v4 = (void *)[self->_perSubscriptionDeleteBlock copy];
  os_unfair_lock_unlock(p_internalLock);
  return v4;
}

- (void)setPerSubscriptionDeleteBlock:(id)a3
{
  p_internalLock = &self->super.super._internalLock;
  id v5 = a3;
  os_unfair_lock_lock(p_internalLock);
  v6 = (void *)[v5 copy];

  id perSubscriptionDeleteBlock = self->_perSubscriptionDeleteBlock;
  self->_id perSubscriptionDeleteBlock = v6;

  [(NSMutableSet *)self->super.super._explicitlySetProperties addObject:@"perSubscriptionDeleteBlock"];
  os_unfair_lock_unlock(p_internalLock);
}

- (id)modifySubscriptionsCompletionBlock
{
  p_internalLock = &self->super.super._internalLock;
  os_unfair_lock_lock(&self->super.super._internalLock);
  v4 = (void *)[self->_modifySubscriptionsCompletionBlock copy];
  os_unfair_lock_unlock(p_internalLock);
  return v4;
}

- (void)setModifySubscriptionsCompletionBlock:(id)a3
{
  p_internalLock = &self->super.super._internalLock;
  id v5 = a3;
  os_unfair_lock_lock(p_internalLock);
  v6 = (void *)[v5 copy];

  id modifySubscriptionsCompletionBlock = self->_modifySubscriptionsCompletionBlock;
  self->_id modifySubscriptionsCompletionBlock = v6;

  [(NSMutableSet *)self->super.super._explicitlySetProperties addObject:@"modifySubscriptionsCompletionBlock"];
  os_unfair_lock_unlock(p_internalLock);
}

- (id)_makeOperation
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1A1B0]);
  return v2;
}

- (void)_setUpOperation:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WBSRetryableCKModifySubscriptionsOperation;
  [(WBSRetryableCKDatabaseOperation *)&v12 _setUpOperation:v4];
  if (-[NSMutableSet containsObject:](self->super.super._explicitlySetProperties, "containsObject:", @"subscriptionsToSave"))[v4 setSubscriptionsToSave:self->_subscriptionsToSave]; {
  if (-[NSMutableSet containsObject:](self->super.super._explicitlySetProperties, "containsObject:", @"subscriptionIDsToDelete"))[v4 setSubscriptionIDsToDelete:self->_subscriptionIDsToDelete];
  }
  if (self->_perSubscriptionSaveBlock)
  {
    objc_initWeak(&location, self);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __62__WBSRetryableCKModifySubscriptionsOperation__setUpOperation___block_invoke;
    v9[3] = &unk_1E5C9F5A0;
    objc_copyWeak(&v10, &location);
    [v4 setPerSubscriptionSaveBlock:v9];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  if (self->_perSubscriptionDeleteBlock)
  {
    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __62__WBSRetryableCKModifySubscriptionsOperation__setUpOperation___block_invoke_3;
    v7[3] = &unk_1E5C9F668;
    objc_copyWeak(&v8, &location);
    [v4 setPerSubscriptionDeleteBlock:v7];
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __62__WBSRetryableCKModifySubscriptionsOperation__setUpOperation___block_invoke_5;
  v5[3] = &unk_1E5C9F618;
  objc_copyWeak(&v6, &location);
  [v4 setModifySubscriptionsCompletionBlock:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __62__WBSRetryableCKModifySubscriptionsOperation__setUpOperation___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
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
    v13[2] = __62__WBSRetryableCKModifySubscriptionsOperation__setUpOperation___block_invoke_2;
    v13[3] = &unk_1E5C9C448;
    v13[4] = WeakRetained;
    id v14 = v7;
    id v15 = v8;
    id v16 = v9;
    [v12 addOperationWithBlock:v13];
  }
}

void __62__WBSRetryableCKModifySubscriptionsOperation__setUpOperation___block_invoke_2(void *a1)
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

void __62__WBSRetryableCKModifySubscriptionsOperation__setUpOperation___block_invoke_3(uint64_t a1, void *a2, void *a3)
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
    v10[2] = __62__WBSRetryableCKModifySubscriptionsOperation__setUpOperation___block_invoke_4;
    v10[3] = &unk_1E5C8CD20;
    v10[4] = WeakRetained;
    id v11 = v5;
    id v12 = v6;
    [v9 addOperationWithBlock:v10];
  }
}

void __62__WBSRetryableCKModifySubscriptionsOperation__setUpOperation___block_invoke_4(void *a1)
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

void __62__WBSRetryableCKModifySubscriptionsOperation__setUpOperation___block_invoke_5(uint64_t a1, void *a2, void *a3, void *a4)
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
    v13[2] = __62__WBSRetryableCKModifySubscriptionsOperation__setUpOperation___block_invoke_6;
    v13[3] = &unk_1E5C9C448;
    v13[4] = WeakRetained;
    id v14 = v9;
    id v15 = v7;
    id v16 = v8;
    [v12 addOperationWithBlock:v13];
  }
}

void __62__WBSRetryableCKModifySubscriptionsOperation__setUpOperation___block_invoke_6(uint64_t a1)
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
  objc_storeStrong(&self->_modifySubscriptionsCompletionBlock, 0);
  objc_storeStrong(&self->_perSubscriptionDeleteBlock, 0);
  objc_storeStrong(&self->_perSubscriptionSaveBlock, 0);
  objc_storeStrong((id *)&self->_subscriptionIDsToDelete, 0);
  objc_storeStrong((id *)&self->_subscriptionsToSave, 0);
}

@end