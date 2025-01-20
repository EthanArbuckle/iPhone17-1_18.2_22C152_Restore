@interface SSPurchaseRequest
- (BOOL)createsDownloads;
- (BOOL)createsJobs;
- (BOOL)isBackgroundRequest;
- (BOOL)isPlaybackRequest;
- (BOOL)needsAuthentication;
- (BOOL)shouldValidatePurchases;
- (BOOL)start;
- (NSArray)purchases;
- (SSPurchaseRequest)init;
- (SSPurchaseRequest)initWithPurchases:(id)a3;
- (SSPurchaseRequest)initWithXPCEncoding:(id)a3;
- (id)_purchaseForUniqueIdentifier:(int64_t)a3;
- (id)copyXPCEncoding;
- (void)_addPurchasesToManager;
- (void)_finishPurchasesWithResponses:(id)a3;
- (void)cancel;
- (void)dealloc;
- (void)purchaseManager:(id)a3 didFinishPurchasesWithResponses:(id)a4;
- (void)setBackgroundRequest:(BOOL)a3;
- (void)setCreatesDownloads:(BOOL)a3;
- (void)setCreatesJobs:(BOOL)a3;
- (void)setNeedsAuthentication:(BOOL)a3;
- (void)setPlaybackRequest:(BOOL)a3;
- (void)setShouldValidatePurchases:(BOOL)a3;
- (void)startWithCompletionBlock:(id)a3;
- (void)startWithPurchaseBlock:(id)a3 completionBlock:(id)a4;
- (void)startWithPurchaseResponseBlock:(id)a3 completionBlock:(id)a4;
@end

@implementation SSPurchaseRequest

- (SSPurchaseRequest)init
{
  return [(SSPurchaseRequest *)self initWithPurchases:0];
}

- (SSPurchaseRequest)initWithPurchases:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SSPurchaseRequest;
  v4 = [(SSRequest *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_createsDownloads = 1;
    v4->_createsJobs = 1;
    v4->_needsAuthentication = 1;
    v4->_purchases = (NSArray *)[a3 copy];
    v5->_shouldValidatePurchases = 1;
  }
  return v5;
}

- (void)dealloc
{
  [(SSPurchaseManager *)self->_purchaseManager setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)SSPurchaseRequest;
  [(SSRequest *)&v3 dealloc];
}

- (NSArray)purchases
{
  v2 = self->_purchases;
  return v2;
}

- (void)startWithPurchaseBlock:(id)a3 completionBlock:(id)a4
{
  id purchaseBlock = self->_purchaseBlock;
  if (purchaseBlock != a3)
  {

    self->_id purchaseBlock = (id)[a3 copy];
  }
  id completionBlock = self->_completionBlock;
  if (completionBlock != a4)
  {

    self->_id completionBlock = (id)[a4 copy];
  }
  [(SSPurchaseRequest *)self _addPurchasesToManager];
}

- (void)startWithPurchaseResponseBlock:(id)a3 completionBlock:(id)a4
{
  id purchaseResponseBlock = self->_purchaseResponseBlock;
  if (purchaseResponseBlock != a3)
  {

    self->_id purchaseResponseBlock = (id)[a3 copy];
  }
  id completionBlock = self->_completionBlock;
  if (completionBlock != a4)
  {

    self->_id completionBlock = (id)[a4 copy];
  }
  [(SSPurchaseRequest *)self _addPurchasesToManager];
}

- (void)cancel
{
  [(SSPurchaseManager *)self->_purchaseManager cancelPurchases:self->_purchases withCompletionBlock:0];
  v3.receiver = self;
  v3.super_class = (Class)SSPurchaseRequest;
  [(SSRequest *)&v3 cancel];
}

- (BOOL)start
{
  return 1;
}

- (void)startWithCompletionBlock:(id)a3
{
  id completionBlock = self->_completionBlock;
  if (completionBlock != a3)
  {

    self->_id completionBlock = (id)[a3 copy];
  }
  [(SSPurchaseRequest *)self _addPurchasesToManager];
}

- (void)purchaseManager:(id)a3 didFinishPurchasesWithResponses:(id)a4
{
}

- (id)copyXPCEncoding
{
  return 0;
}

- (SSPurchaseRequest)initWithXPCEncoding:(id)a3
{
  return 0;
}

- (void)_addPurchasesToManager
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  [(SSRequest *)self _beginBackgroundTask];
  objc_super v3 = self;
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:", @"SSVNetworkingDidStartNotification", 0);
  if (!self->_purchaseManager)
  {
    v4 = objc_alloc_init(SSPurchaseManager);
    self->_purchaseManager = v4;
    [(SSPurchaseManager *)v4 setDelegate:self];
  }
  if (!self->_openPurchaseIdentifiers) {
    self->_openPurchaseIdentifiers = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  obj = self->_purchases;
  uint64_t v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16, 104);
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v10 = objc_msgSend(objc_alloc(NSNumber), "initWithLongLong:", objc_msgSend(v9, "uniqueIdentifier"));
        [v9 setBackgroundPurchase:self->_isBackgroundRequest];
        [v9 setCreatesDownloads:self->_createsDownloads];
        [v9 setCreatesJobs:self->_createsJobs];
        [v9 setPlaybackRequest:self->_playbackRequest];
        [(NSMutableSet *)self->_openPurchaseIdentifiers addObject:v10];
      }
      uint64_t v6 = [(NSArray *)obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
  purchaseManager = self->_purchaseManager;
  uint64_t v12 = *(uint64_t *)((char *)&self->super.super.isa + v13);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __43__SSPurchaseRequest__addPurchasesToManager__block_invoke;
  v15[3] = &unk_1E5BA8C10;
  v15[4] = self;
  [(SSPurchaseManager *)purchaseManager addPurchases:v12 withCompletionBlock:v15];
}

void __43__SSPurchaseRequest__addPurchasesToManager__block_invoke(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ((a2 & 1) == 0)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 104);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
          uint64_t v12 = objc_alloc_init(SSPurchaseResponse);
          [(SSPurchaseResponse *)v12 setError:a3];
          [(SSPurchaseResponse *)v12 setPurchase:v11];
          [v5 addObject:v12];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
    [*(id *)(a1 + 32) _finishPurchasesWithResponses:v5];
  }
}

- (void)_finishPurchasesWithResponses:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x3052000000;
  v41 = __Block_byref_object_copy__8;
  v42 = __Block_byref_object_dispose__8;
  uint64_t v43 = 0;
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x2020000000;
  char v37 = 0;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3052000000;
  v31 = __Block_byref_object_copy__8;
  v32 = __Block_byref_object_dispose__8;
  uint64_t v33 = 0;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3052000000;
  v25 = __Block_byref_object_copy__8;
  v26 = __Block_byref_object_dispose__8;
  uint64_t v27 = 0;
  dispatchQueue = self->super._dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__SSPurchaseRequest__finishPurchasesWithResponses___block_invoke;
  block[3] = &unk_1E5BA8C38;
  block[6] = &v38;
  block[7] = &v28;
  block[4] = self;
  block[5] = a3;
  block[8] = &v22;
  block[9] = &v34;
  dispatch_sync(dispatchQueue, block);
  if (v29[5] || v23[5])
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v6 = [a3 countByEnumeratingWithState:&v17 objects:v44 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v18 != v7) {
            objc_enumerationMutation(a3);
          }
          uint64_t v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          uint64_t v10 = objc_msgSend((id)objc_msgSend(v9, "purchase"), "uniqueIdentifier");
          uint64_t v11 = [v9 error];
          id v12 = [(SSPurchaseRequest *)self _purchaseForUniqueIdentifier:v10];
          uint64_t v13 = v29[5];
          if (v13) {
            (*(void (**)(uint64_t, id, uint64_t))(v13 + 16))(v13, v12, v11);
          }
          if (v23[5])
          {
            [v9 setPurchase:v12];
            (*(void (**)(void))(v23[5] + 16))();
          }
        }
        uint64_t v6 = [a3 countByEnumeratingWithState:&v17 objects:v44 count:16];
      }
      while (v6);
    }
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __51__SSPurchaseRequest__finishPurchasesWithResponses___block_invoke_2;
  v16[3] = &unk_1E5BA77A0;
  v16[4] = self;
  v16[5] = a3;
  v16[6] = &v34;
  dispatch_async(MEMORY[0x1E4F14428], v16);
  if (*((unsigned char *)v35 + 24))
  {
    uint64_t v14 = v39[5];
    if (v14) {
      (*(void (**)(uint64_t, void))(v14 + 16))(v14, 0);
    }
    [(SSRequest *)self _endBackgroundTask];
    long long v15 = self;
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:", @"SSVNetworkingDidStopNotification", 0);

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);
}

uint64_t __51__SSPurchaseRequest__finishPurchasesWithResponses___block_invoke(void *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 120) copy];
  *(void *)(*(void *)(a1[7] + 8) + 40) = [*(id *)(a1[4] + 144) copy];
  *(void *)(*(void *)(a1[8] + 8) + 40) = [*(id *)(a1[4] + 152) copy];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = (void *)a1[5];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = objc_msgSend(objc_alloc(NSNumber), "initWithLongLong:", objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "purchase"), "uniqueIdentifier"));
        [*(id *)(a1[4] + 136) removeObject:v7];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  uint64_t result = [*(id *)(a1[4] + 136) count];
  *(unsigned char *)(*(void *)(a1[9] + 8) + 24) = result == 0;
  return result;
}

uint64_t __51__SSPurchaseRequest__finishPurchasesWithResponses___block_invoke_2(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = (void *)[*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();
  char v12 = objc_opt_respondsToSelector();
  uint64_t result = objc_opt_respondsToSelector();
  char v13 = result;
  if (v3 & 1) != 0 || (v12 & 1) != 0 || (result)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v5 = *(void **)(a1 + 40);
    uint64_t result = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (result)
    {
      uint64_t v6 = result;
      uint64_t v7 = *(void *)v15;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v5);
          }
          long long v9 = *(void **)(*((void *)&v14 + 1) + 8 * v8);
          uint64_t v10 = [v9 error];
          long long v11 = objc_msgSend(*(id *)(a1 + 32), "_purchaseForUniqueIdentifier:", objc_msgSend((id)objc_msgSend(v9, "purchase"), "uniqueIdentifier"));
          if (v10)
          {
            if (v3)
            {
              objc_msgSend(v11, "setTidHeaders:", objc_msgSend(v9, "tidHeaders"));
              [v2 purchaseRequest:*(void *)(a1 + 32) purchaseDidFail:v11 withError:v10];
            }
          }
          else if (v13)
          {
            [v2 purchaseRequest:*(void *)(a1 + 32) purchaseDidSucceedWithResponse:v9];
          }
          else if (v12)
          {
            [v2 purchaseRequest:*(void *)(a1 + 32) purchaseDidSucceed:v11];
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t result = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
        uint64_t v6 = result;
      }
      while (result);
    }
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    uint64_t result = objc_opt_respondsToSelector();
    if (result) {
      return [v2 requestDidFinish:*(void *)(a1 + 32)];
    }
  }
  return result;
}

- (id)_purchaseForUniqueIdentifier:(int64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  purchases = self->_purchases;
  uint64_t v5 = [(NSArray *)purchases countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(purchases);
    }
    long long v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if ([v9 uniqueIdentifier] == a3) {
      return v9;
    }
    if (v6 == ++v8)
    {
      uint64_t v6 = [(NSArray *)purchases countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (BOOL)isBackgroundRequest
{
  return self->_isBackgroundRequest;
}

- (void)setBackgroundRequest:(BOOL)a3
{
  self->_isBackgroundRequest = a3;
}

- (BOOL)createsDownloads
{
  return self->_createsDownloads;
}

- (void)setCreatesDownloads:(BOOL)a3
{
  self->_createsDownloads = a3;
}

- (BOOL)needsAuthentication
{
  return self->_needsAuthentication;
}

- (void)setNeedsAuthentication:(BOOL)a3
{
  self->_needsAuthentication = a3;
}

- (BOOL)isPlaybackRequest
{
  return self->_playbackRequest;
}

- (void)setPlaybackRequest:(BOOL)a3
{
  self->_playbackRequest = a3;
}

- (BOOL)shouldValidatePurchases
{
  return self->_shouldValidatePurchases;
}

- (void)setShouldValidatePurchases:(BOOL)a3
{
  self->_shouldValidatePurchases = a3;
}

- (BOOL)createsJobs
{
  return self->_createsJobs;
}

- (void)setCreatesJobs:(BOOL)a3
{
  self->_createsJobs = a3;
}

@end