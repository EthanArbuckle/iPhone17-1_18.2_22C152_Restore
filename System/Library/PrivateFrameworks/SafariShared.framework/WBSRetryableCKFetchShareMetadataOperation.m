@interface WBSRetryableCKFetchShareMetadataOperation
- (BOOL)shouldFetchRootRecord;
- (NSArray)rootRecordDesiredKeys;
- (NSArray)shareURLs;
- (NSDictionary)shareInvitationTokensByShareURL;
- (id)_makeOperation;
- (id)fetchShareMetadataCompletionBlock;
- (id)perShareMetadataBlock;
- (void)_setUpOperation:(id)a3;
- (void)setFetchShareMetadataCompletionBlock:(id)a3;
- (void)setPerShareMetadataBlock:(id)a3;
- (void)setRootRecordDesiredKeys:(id)a3;
- (void)setShareInvitationTokensByShareURL:(id)a3;
- (void)setShareURLs:(id)a3;
- (void)setShouldFetchRootRecord:(BOOL)a3;
@end

@implementation WBSRetryableCKFetchShareMetadataOperation

- (NSArray)shareURLs
{
  p_internalLock = &self->super._internalLock;
  os_unfair_lock_lock(&self->super._internalLock);
  v4 = (void *)[(NSArray *)self->_shareURLs copy];
  os_unfair_lock_unlock(p_internalLock);
  return (NSArray *)v4;
}

- (void)setShareURLs:(id)a3
{
  p_internalLock = &self->super._internalLock;
  id v5 = a3;
  os_unfair_lock_lock(p_internalLock);
  v6 = (NSArray *)[v5 copy];

  shareURLs = self->_shareURLs;
  self->_shareURLs = v6;

  [(NSMutableSet *)self->super._explicitlySetProperties addObject:@"shareURLs"];
  os_unfair_lock_unlock(p_internalLock);
}

- (NSDictionary)shareInvitationTokensByShareURL
{
  p_internalLock = &self->super._internalLock;
  os_unfair_lock_lock(&self->super._internalLock);
  v4 = (void *)[(NSDictionary *)self->_shareInvitationTokensByShareURL copy];
  os_unfair_lock_unlock(p_internalLock);
  return (NSDictionary *)v4;
}

- (void)setShareInvitationTokensByShareURL:(id)a3
{
  p_internalLock = &self->super._internalLock;
  id v5 = a3;
  os_unfair_lock_lock(p_internalLock);
  v6 = (NSDictionary *)[v5 copy];

  shareInvitationTokensByShareURL = self->_shareInvitationTokensByShareURL;
  self->_shareInvitationTokensByShareURL = v6;

  [(NSMutableSet *)self->super._explicitlySetProperties addObject:@"shareInvitationTokensByShareURL"];
  os_unfair_lock_unlock(p_internalLock);
}

- (BOOL)shouldFetchRootRecord
{
  v2 = self;
  p_internalLock = &self->super._internalLock;
  os_unfair_lock_lock(&self->super._internalLock);
  LOBYTE(v2) = v2->_shouldFetchRootRecord;
  os_unfair_lock_unlock(p_internalLock);
  return (char)v2;
}

- (void)setShouldFetchRootRecord:(BOOL)a3
{
  p_internalLock = &self->super._internalLock;
  os_unfair_lock_lock(&self->super._internalLock);
  self->_shouldFetchRootRecord = a3;
  [(NSMutableSet *)self->super._explicitlySetProperties addObject:@"shouldFetchRootRecord"];
  os_unfair_lock_unlock(p_internalLock);
}

- (NSArray)rootRecordDesiredKeys
{
  p_internalLock = &self->super._internalLock;
  os_unfair_lock_lock(&self->super._internalLock);
  v4 = (void *)[(NSArray *)self->_rootRecordDesiredKeys copy];
  os_unfair_lock_unlock(p_internalLock);
  return (NSArray *)v4;
}

- (void)setRootRecordDesiredKeys:(id)a3
{
  p_internalLock = &self->super._internalLock;
  id v5 = a3;
  os_unfair_lock_lock(p_internalLock);
  v6 = (NSArray *)[v5 copy];

  rootRecordDesiredKeys = self->_rootRecordDesiredKeys;
  self->_rootRecordDesiredKeys = v6;

  [(NSMutableSet *)self->super._explicitlySetProperties addObject:@"rootRecordDesiredKeys"];
  os_unfair_lock_unlock(p_internalLock);
}

- (id)perShareMetadataBlock
{
  p_internalLock = &self->super._internalLock;
  os_unfair_lock_lock(&self->super._internalLock);
  v4 = (void *)[self->_perShareMetadataBlock copy];
  os_unfair_lock_unlock(p_internalLock);
  return v4;
}

- (void)setPerShareMetadataBlock:(id)a3
{
  p_internalLock = &self->super._internalLock;
  id v5 = a3;
  os_unfair_lock_lock(p_internalLock);
  v6 = (void *)[v5 copy];

  id perShareMetadataBlock = self->_perShareMetadataBlock;
  self->_id perShareMetadataBlock = v6;

  [(NSMutableSet *)self->super._explicitlySetProperties addObject:@"perShareMetadataBlock"];
  os_unfair_lock_unlock(p_internalLock);
}

- (id)fetchShareMetadataCompletionBlock
{
  p_internalLock = &self->super._internalLock;
  os_unfair_lock_lock(&self->super._internalLock);
  v4 = (void *)[self->_fetchShareMetadataCompletionBlock copy];
  os_unfair_lock_unlock(p_internalLock);
  return v4;
}

- (void)setFetchShareMetadataCompletionBlock:(id)a3
{
  p_internalLock = &self->super._internalLock;
  id v5 = a3;
  os_unfair_lock_lock(p_internalLock);
  v6 = (void *)[v5 copy];

  id fetchShareMetadataCompletionBlock = self->_fetchShareMetadataCompletionBlock;
  self->_id fetchShareMetadataCompletionBlock = v6;

  [(NSMutableSet *)self->super._explicitlySetProperties addObject:@"fetchShareMetadataCompletionBlock"];
  os_unfair_lock_unlock(p_internalLock);
}

- (id)_makeOperation
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1A0B8]);
  return v2;
}

- (void)_setUpOperation:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSRetryableCKFetchShareMetadataOperation;
  [(WBSRetryableCKOperation *)&v10 _setUpOperation:v4];
  if (-[NSMutableSet containsObject:](self->super._explicitlySetProperties, "containsObject:", @"shareURLs"))[v4 setShareURLs:self->_shareURLs]; {
  if (-[NSMutableSet containsObject:](self->super._explicitlySetProperties, "containsObject:", @"shareInvitationTokensByShareURL"))[v4 setShareInvitationTokensByShareURL:self->_shareInvitationTokensByShareURL];
  }
  if (-[NSMutableSet containsObject:](self->super._explicitlySetProperties, "containsObject:", @"shouldFetchRootRecord"))[v4 setShouldFetchRootRecord:self->_shouldFetchRootRecord]; {
  if (-[NSMutableSet containsObject:](self->super._explicitlySetProperties, "containsObject:", @"rootRecordDesiredKeys"))[v4 setRootRecordDesiredKeys:self->_rootRecordDesiredKeys];
  }
  if (self->_perShareMetadataBlock)
  {
    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __61__WBSRetryableCKFetchShareMetadataOperation__setUpOperation___block_invoke;
    v7[3] = &unk_1E5C9F550;
    objc_copyWeak(&v8, &location);
    [v4 setPerShareMetadataBlock:v7];
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __61__WBSRetryableCKFetchShareMetadataOperation__setUpOperation___block_invoke_3;
  v5[3] = &unk_1E5C9F2F8;
  objc_copyWeak(&v6, &location);
  [v4 setFetchShareMetadataCompletionBlock:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __61__WBSRetryableCKFetchShareMetadataOperation__setUpOperation___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
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
    v13[2] = __61__WBSRetryableCKFetchShareMetadataOperation__setUpOperation___block_invoke_2;
    v13[3] = &unk_1E5C9C448;
    v13[4] = WeakRetained;
    id v14 = v7;
    id v15 = v8;
    id v16 = v9;
    [v12 addOperationWithBlock:v13];
  }
}

void __61__WBSRetryableCKFetchShareMetadataOperation__setUpOperation___block_invoke_2(void *a1)
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

void __61__WBSRetryableCKFetchShareMetadataOperation__setUpOperation___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = (void *)*((void *)WeakRetained + 33);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __61__WBSRetryableCKFetchShareMetadataOperation__setUpOperation___block_invoke_4;
    v7[3] = &unk_1E5C8C920;
    void v7[4] = WeakRetained;
    id v8 = v3;
    [v6 addOperationWithBlock:v7];
  }
}

void __61__WBSRetryableCKFetchShareMetadataOperation__setUpOperation___block_invoke_4(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 248));
  if (WeakRetained
    && ([*(id *)(a1 + 32) _scheduleRetryIfNeededForError:*(void *)(a1 + 40)] & 1) == 0)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 272));
    id v3 = (void *)MEMORY[0x1AD0C4F80](*(void *)(*(void *)(a1 + 32) + 424));
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
  objc_storeStrong(&self->_fetchShareMetadataCompletionBlock, 0);
  objc_storeStrong(&self->_perShareMetadataBlock, 0);
  objc_storeStrong((id *)&self->_rootRecordDesiredKeys, 0);
  objc_storeStrong((id *)&self->_shareInvitationTokensByShareURL, 0);
  objc_storeStrong((id *)&self->_shareURLs, 0);
}

@end