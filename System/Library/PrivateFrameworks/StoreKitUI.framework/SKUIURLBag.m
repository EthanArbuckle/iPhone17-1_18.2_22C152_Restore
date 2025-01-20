@interface SKUIURLBag
+ (ISOperationQueue)bagQueue;
+ (id)URLBagForContext:(id)a3;
- (id)existingBagDictionary;
- (id)storeFrontIdentifier;
- (id)valueForKey:(id)a3 error:(id *)a4;
- (void)_enqueueOperationWithContext:(id)a3 completionBlock:(id)a4;
- (void)_finishOperationWithURLBag:(id)a3 error:(id)a4;
- (void)getTrustForURL:(id)a3 completionBlock:(id)a4;
- (void)invalidate;
- (void)loadValueForKey:(id)a3 completionBlock:(id)a4;
- (void)loadWithCompletionBlock:(id)a3;
@end

@implementation SKUIURLBag

+ (ISOperationQueue)bagQueue
{
  if (bagQueue_onceToken != -1) {
    dispatch_once(&bagQueue_onceToken, &__block_literal_global_19);
  }
  v2 = (void *)bagQueue_bagQueue;

  return (ISOperationQueue *)v2;
}

uint64_t __22__SKUIURLBag_bagQueue__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4FB8838]);
  v1 = (void *)bagQueue_bagQueue;
  bagQueue_bagQueue = (uint64_t)v0;

  v2 = (void *)bagQueue_bagQueue;

  return [v2 setName:@"com.apple.storekit.bag-queue"];
}

+ (id)URLBagForContext:(id)a3
{
  return 0;
}

- (void)getTrustForURL:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __45__SKUIURLBag_getTrustForURL_completionBlock___block_invoke;
  v10[3] = &unk_1E6426508;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(SSURLBag *)self dispatchAsync:v10];
}

void __45__SKUIURLBag_getTrustForURL_completionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = *(void **)(a1 + 32);
  v4 = (void *)v3[9];
  if (v4)
  {
    char v5 = [v4 urlIsTrusted:*(void *)(a1 + 40)];
    id v6 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__SKUIURLBag_getTrustForURL_completionBlock___block_invoke_2;
    block[3] = &unk_1E64254E0;
    id v7 = &v13;
    id v13 = *(id *)(a1 + 48);
    char v14 = v5;
    dispatch_async(v6, block);
  }
  else
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __45__SKUIURLBag_getTrustForURL_completionBlock___block_invoke_3;
    v9[3] = &unk_1E64264E0;
    id v7 = &v11;
    id v11 = *(id *)(a1 + 48);
    v10 = *(id *)(a1 + 40);
    [v3 _enqueueOperationWithContext:a2 completionBlock:v9];
    id v6 = v10;
  }
}

uint64_t __45__SKUIURLBag_getTrustForURL_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), 0);
}

void __45__SKUIURLBag_getTrustForURL_completionBlock___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = a3;
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, [a2 urlIsTrusted:v5], v6);
}

- (void)invalidate
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __24__SKUIURLBag_invalidate__block_invoke;
  v2[3] = &unk_1E6426530;
  v2[4] = self;
  [(SSURLBag *)self dispatchAsync:v2];
}

void __24__SKUIURLBag_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 72);
  *(void *)(v2 + 72) = 0;

  *(unsigned char *)(*(void *)(a1 + 32) + 88) = 1;
  [*(id *)(*(void *)(a1 + 32) + 96) setCompletionBlock:0];
  [*(id *)(*(void *)(a1 + 32) + 96) cancel];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 96);
  *(void *)(v4 + 96) = 0;
}

- (void)loadValueForKey:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __46__SKUIURLBag_loadValueForKey_completionBlock___block_invoke;
  v10[3] = &unk_1E6426508;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(SSURLBag *)self dispatchAsync:v10];
}

void __46__SKUIURLBag_loadValueForKey_completionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = *(void **)(a1 + 32);
  uint64_t v4 = (void *)v3[9];
  if (v4)
  {
    uint64_t v5 = [v4 valueForKey:*(void *)(a1 + 40)];
    id v6 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__SKUIURLBag_loadValueForKey_completionBlock___block_invoke_2;
    block[3] = &unk_1E6423A78;
    id v7 = *(id *)(a1 + 48);
    id v14 = v5;
    id v15 = v7;
    id v8 = v5;
    dispatch_async(v6, block);
  }
  else
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __46__SKUIURLBag_loadValueForKey_completionBlock___block_invoke_3;
    v10[3] = &unk_1E64264E0;
    id v12 = *(id *)(a1 + 48);
    id v11 = *(id *)(a1 + 40);
    [v3 _enqueueOperationWithContext:a2 completionBlock:v10];

    id v8 = v12;
  }
}

uint64_t __46__SKUIURLBag_loadValueForKey_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void __46__SKUIURLBag_loadValueForKey_completionBlock___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = a3;
  id v7 = [a2 valueForKey:v5];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v7, v6);
}

- (id)valueForKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__33;
  v26 = __Block_byref_object_dispose__33;
  id v27 = 0;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__33;
  v20 = __Block_byref_object_dispose__33;
  id v21 = 0;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __32__SKUIURLBag_valueForKey_error___block_invoke;
  v12[3] = &unk_1E6426558;
  id v14 = &v16;
  id v15 = &v22;
  id v8 = v7;
  id v13 = v8;
  [(SKUIURLBag *)self loadValueForKey:v6 completionBlock:v12];
  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  id v9 = (void *)v23[5];
  if (a4 && !v9)
  {
    *a4 = (id) v17[5];
    id v9 = (void *)v23[5];
  }
  id v10 = v9;

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v10;
}

void __32__SKUIURLBag_valueForKey_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  id v9 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  dispatch_semaphore_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
  id v8 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)existingBagDictionary
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__33;
  id v9 = __Block_byref_object_dispose__33;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __35__SKUIURLBag_existingBagDictionary__block_invoke;
  v4[3] = &unk_1E6426580;
  v4[4] = self;
  v4[5] = &v5;
  [(SSURLBag *)self dispatchSync:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

uint64_t __35__SKUIURLBag_existingBagDictionary__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 72) URLBagDictionary];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (void)loadWithCompletionBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __38__SKUIURLBag_loadWithCompletionBlock___block_invoke;
  v6[3] = &unk_1E64265D0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(SSURLBag *)self dispatchAsync:v6];
}

void __38__SKUIURLBag_loadWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = (void *)v3[9];
  if (v4)
  {
    id v5 = [v4 URLBagDictionary];
    uint64_t v6 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __38__SKUIURLBag_loadWithCompletionBlock___block_invoke_2;
    block[3] = &unk_1E6423A78;
    id v7 = *(id *)(a1 + 40);
    id v13 = v5;
    id v14 = v7;
    id v8 = v5;
    dispatch_async(v6, block);
  }
  else
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __38__SKUIURLBag_loadWithCompletionBlock___block_invoke_3;
    v10[3] = &unk_1E64265A8;
    id v11 = *(id *)(a1 + 40);
    [v3 _enqueueOperationWithContext:a2 completionBlock:v10];
    id v8 = v11;
  }
}

uint64_t __38__SKUIURLBag_loadWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void __38__SKUIURLBag_loadWithCompletionBlock___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 URLBagDictionary];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);
}

- (id)storeFrontIdentifier
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__33;
  id v9 = __Block_byref_object_dispose__33;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __34__SKUIURLBag_storeFrontIdentifier__block_invoke;
  v4[3] = &unk_1E6426580;
  v4[4] = self;
  v4[5] = &v5;
  [(SSURLBag *)self dispatchSync:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

uint64_t __34__SKUIURLBag_storeFrontIdentifier__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 72) storeFrontIdentifier];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (void)_enqueueOperationWithContext:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)[v7 copy];
  completionBlocks = self->_completionBlocks;
  if (!completionBlocks)
  {
    id v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v11 = self->_completionBlocks;
    self->_completionBlocks = v10;

    completionBlocks = self->_completionBlocks;
  }
  id v12 = _Block_copy(v8);
  [(NSMutableArray *)completionBlocks addObject:v12];

  if (!self->_operation)
  {
    if (self->_forceInvalidationForNextLoad)
    {
      id v13 = (void *)[v6 copy];
      [v13 setIgnoresCaches:1];

      self->_forceInvalidationForNextLoad = 0;
      id v6 = v13;
    }
    id v14 = (ISLoadURLBagOperation *)[objc_alloc(MEMORY[0x1E4FB8818]) initWithBagContext:v6];
    operation = self->_operation;
    self->_operation = v14;

    objc_initWeak(&location, self->_operation);
    objc_initWeak(&from, self);
    uint64_t v16 = self->_operation;
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    v20 = __59__SKUIURLBag__enqueueOperationWithContext_completionBlock___block_invoke;
    id v21 = &unk_1E6422188;
    objc_copyWeak(&v22, &from);
    objc_copyWeak(&v23, &location);
    [(ISLoadURLBagOperation *)v16 setCompletionBlock:&v18];
    v17 = objc_msgSend((id)objc_opt_class(), "bagQueue", v18, v19, v20, v21);
    [v17 addOperation:self->_operation];

    objc_destroyWeak(&v23);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
}

void __59__SKUIURLBag__enqueueOperationWithContext_completionBlock___block_invoke(id *a1)
{
  v1 = a1;
  id WeakRetained = objc_loadWeakRetained(a1 + 4);
  v1 += 5;
  id v3 = objc_loadWeakRetained(v1);
  uint64_t v4 = [v3 URLBag];
  id v5 = objc_loadWeakRetained(v1);
  id v6 = [v5 error];
  [WeakRetained _finishOperationWithURLBag:v4 error:v6];

  id v7 = objc_loadWeakRetained(v1);
  [v7 setCompletionBlock:0];
}

- (void)_finishOperationWithURLBag:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __47__SKUIURLBag__finishOperationWithURLBag_error___block_invoke;
  v10[3] = &unk_1E64265F8;
  id v11 = v6;
  id v12 = self;
  id v13 = v7;
  id v8 = v7;
  id v9 = v6;
  [(SSURLBag *)self dispatchAsync:v10];
}

void __47__SKUIURLBag__finishOperationWithURLBag_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2) {
    objc_storeStrong((id *)(*(void *)(a1 + 40) + 72), v2);
  }
  [*(id *)(*(void *)(a1 + 40) + 96) setCompletionBlock:0];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void **)(v3 + 96);
  *(void *)(v3 + 96) = 0;

  id v5 = (void *)[*(id *)(*(void *)(a1 + 40) + 80) copy];
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = *(void **)(v6 + 80);
  *(void *)(v6 + 80) = 0;

  id v8 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__SKUIURLBag__finishOperationWithURLBag_error___block_invoke_2;
  block[3] = &unk_1E64225B0;
  id v11 = v5;
  id v12 = *(id *)(a1 + 32);
  id v13 = *(id *)(a1 + 48);
  id v9 = v5;
  dispatch_async(v8, block);
}

void __47__SKUIURLBag__finishOperationWithURLBag_error___block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v6 + 1) + 8 * v5) + 16))(*(void *)(*((void *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operation, 0);
  objc_storeStrong((id *)&self->_completionBlocks, 0);

  objc_storeStrong((id *)&self->_bag, 0);
}

@end