@interface WBSRetryableCKAcceptSharesOperation
- (NSArray)shareMetadatas;
- (id)_makeOperation;
- (id)acceptSharesCompletionBlock;
- (id)perShareCompletionBlock;
- (void)_setUpOperation:(id)a3;
- (void)setAcceptSharesCompletionBlock:(id)a3;
- (void)setPerShareCompletionBlock:(id)a3;
- (void)setShareMetadatas:(id)a3;
@end

@implementation WBSRetryableCKAcceptSharesOperation

- (NSArray)shareMetadatas
{
  p_internalLock = &self->super._internalLock;
  os_unfair_lock_lock(&self->super._internalLock);
  v4 = (void *)[(NSArray *)self->_shareMetadatas copy];
  os_unfair_lock_unlock(p_internalLock);
  return (NSArray *)v4;
}

- (void)setShareMetadatas:(id)a3
{
  p_internalLock = &self->super._internalLock;
  id v5 = a3;
  os_unfair_lock_lock(p_internalLock);
  v6 = (NSArray *)[v5 copy];

  shareMetadatas = self->_shareMetadatas;
  self->_shareMetadatas = v6;

  [(NSMutableSet *)self->super._explicitlySetProperties addObject:@"shareMetadatas"];
  os_unfair_lock_unlock(p_internalLock);
}

- (id)perShareCompletionBlock
{
  p_internalLock = &self->super._internalLock;
  os_unfair_lock_lock(&self->super._internalLock);
  v4 = (void *)[self->_perShareCompletionBlock copy];
  os_unfair_lock_unlock(p_internalLock);
  return v4;
}

- (void)setPerShareCompletionBlock:(id)a3
{
  p_internalLock = &self->super._internalLock;
  id v5 = a3;
  os_unfair_lock_lock(p_internalLock);
  v6 = (void *)[v5 copy];

  id perShareCompletionBlock = self->_perShareCompletionBlock;
  self->_id perShareCompletionBlock = v6;

  [(NSMutableSet *)self->super._explicitlySetProperties addObject:@"perShareCompletionBlock"];
  os_unfair_lock_unlock(p_internalLock);
}

- (id)acceptSharesCompletionBlock
{
  p_internalLock = &self->super._internalLock;
  os_unfair_lock_lock(&self->super._internalLock);
  v4 = (void *)[self->_acceptSharesCompletionBlock copy];
  os_unfair_lock_unlock(p_internalLock);
  return v4;
}

- (void)setAcceptSharesCompletionBlock:(id)a3
{
  p_internalLock = &self->super._internalLock;
  id v5 = a3;
  os_unfair_lock_lock(p_internalLock);
  v6 = (void *)[v5 copy];

  id acceptSharesCompletionBlock = self->_acceptSharesCompletionBlock;
  self->_id acceptSharesCompletionBlock = v6;

  [(NSMutableSet *)self->super._explicitlySetProperties addObject:@"acceptSharesCompletionBlock"];
  os_unfair_lock_unlock(p_internalLock);
}

- (id)_makeOperation
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F19E18]);
  return v2;
}

- (void)_setUpOperation:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSRetryableCKAcceptSharesOperation;
  [(WBSRetryableCKOperation *)&v10 _setUpOperation:v4];
  if (-[NSMutableSet containsObject:](self->super._explicitlySetProperties, "containsObject:", @"shareMetadatas"))[v4 setShareMetadatas:self->_shareMetadatas]; {
  if (self->_perShareCompletionBlock)
  }
  {
    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __55__WBSRetryableCKAcceptSharesOperation__setUpOperation___block_invoke;
    v7[3] = &unk_1E5C9F2D0;
    objc_copyWeak(&v8, &location);
    [v4 setPerShareCompletionBlock:v7];
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__WBSRetryableCKAcceptSharesOperation__setUpOperation___block_invoke_3;
  v5[3] = &unk_1E5C9F2F8;
  objc_copyWeak(&v6, &location);
  [v4 setAcceptSharesCompletionBlock:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __55__WBSRetryableCKAcceptSharesOperation__setUpOperation___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v11 = WeakRetained;
  if (WeakRetained)
  {
    v12 = (void *)*((void *)WeakRetained + 33);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __55__WBSRetryableCKAcceptSharesOperation__setUpOperation___block_invoke_2;
    v13[3] = &unk_1E5C9C448;
    v13[4] = WeakRetained;
    id v14 = v7;
    id v15 = v8;
    id v16 = v9;
    [v12 addOperationWithBlock:v13];
  }
}

void __55__WBSRetryableCKAcceptSharesOperation__setUpOperation___block_invoke_2(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 248));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 272));
    v3 = (void *)MEMORY[0x1AD0C4F80](*(void *)(a1[4] + 392));
    os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 272));
    id v4 = (void (**)(void, void, void, void, void))MEMORY[0x1AD0C4F80](v3);

    if (v4) {
      ((void (**)(void, id, void, void, void))v4)[2](v4, v5, a1[5], a1[6], a1[7]);
    }

    id WeakRetained = v5;
  }
}

void __55__WBSRetryableCKAcceptSharesOperation__setUpOperation___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = (void *)*((void *)WeakRetained + 33);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __55__WBSRetryableCKAcceptSharesOperation__setUpOperation___block_invoke_4;
    v7[3] = &unk_1E5C8C920;
    void v7[4] = WeakRetained;
    id v8 = v3;
    [v6 addOperationWithBlock:v7];
  }
}

void __55__WBSRetryableCKAcceptSharesOperation__setUpOperation___block_invoke_4(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 248));
  if (WeakRetained
    && ([*(id *)(a1 + 32) _scheduleRetryIfNeededForError:*(void *)(a1 + 40)] & 1) == 0)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 272));
    id v3 = (void *)MEMORY[0x1AD0C4F80](*(void *)(*(void *)(a1 + 32) + 400));
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
  objc_storeStrong(&self->_acceptSharesCompletionBlock, 0);
  objc_storeStrong(&self->_perShareCompletionBlock, 0);
  objc_storeStrong((id *)&self->_shareMetadatas, 0);
}

@end