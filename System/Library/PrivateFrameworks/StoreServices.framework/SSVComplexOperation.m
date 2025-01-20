@interface SSVComplexOperation
- (NSDictionary)URLBagDictionary;
- (SSVFairPlaySAPSession)SAPSession;
- (id)newLoadURLOperationWithRequest:(id)a3;
- (void)configureWithURLBag:(id)a3;
- (void)configureWithURLBagDictionary:(id)a3;
- (void)setSAPSession:(id)a3;
@end

@implementation SSVComplexOperation

- (void)configureWithURLBag:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__SSVComplexOperation_configureWithURLBag___block_invoke;
  v6[3] = &unk_1E5BA7018;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(SSVOperation *)self dispatchAsync:v6];
}

void __43__SSVComplexOperation_configureWithURLBag___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 296), *(id *)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 304);
  *(void *)(v2 + 304) = 0;
}

- (void)configureWithURLBagDictionary:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__SSVComplexOperation_configureWithURLBagDictionary___block_invoke;
  v6[3] = &unk_1E5BA7018;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(SSVOperation *)self dispatchAsync:v6];
}

void __53__SSVComplexOperation_configureWithURLBagDictionary___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 296);
  *(void *)(v2 + 296) = 0;

  uint64_t v4 = [*(id *)(a1 + 40) copy];
  uint64_t v5 = *(void *)(a1 + 32);
  v6 = *(void **)(v5 + 304);
  *(void *)(v5 + 304) = v4;
}

- (id)newLoadURLOperationWithRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[SSVLoadURLOperation alloc] initWithURLRequest:v4];

  [(SSVLoadURLOperation *)v5 setITunesStoreRequest:1];
  v6 = [(SSVComplexOperation *)self URLBagDictionary];
  if (v6)
  {
    id v7 = [[SSVURLBagInterpreter alloc] initWithURLBagDictionary:v6];
    [(SSVLoadURLOperation *)v5 _configureWithURLBagInterpreter:v7];
    [(SSVLoadURLOperation *)v5 setMachineDataStyle:2];
    v8 = [[SSVSAPSignaturePolicy alloc] initWithPolicyType:1];
    v9 = [(SSVComplexOperation *)self SAPSession];
    [(SSVLoadURLOperation *)v5 setSAPSession:v9];

    [(SSVLoadURLOperation *)v5 setSAPSignaturePolicy:v8];
  }

  return v5;
}

- (SSVFairPlaySAPSession)SAPSession
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__43;
  v9 = __Block_byref_object_dispose__43;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __33__SSVComplexOperation_SAPSession__block_invoke;
  v4[3] = &unk_1E5BA6F30;
  v4[4] = self;
  v4[5] = &v5;
  [(SSVOperation *)self dispatchSync:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (SSVFairPlaySAPSession *)v2;
}

void __33__SSVComplexOperation_SAPSession__block_invoke(uint64_t a1)
{
}

- (void)setSAPSession:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __37__SSVComplexOperation_setSAPSession___block_invoke;
  v6[3] = &unk_1E5BA7018;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(SSVOperation *)self dispatchAsync:v6];
}

void __37__SSVComplexOperation_setSAPSession___block_invoke(uint64_t a1)
{
  id v1 = *(id *)(a1 + 40);
  id v2 = (id *)(*(void *)(a1 + 32) + 288);
  if (*v2 != v1) {
    objc_storeStrong(v2, v1);
  }
}

- (NSDictionary)URLBagDictionary
{
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__43;
  v27 = __Block_byref_object_dispose__43;
  id v28 = 0;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__43;
  v21 = __Block_byref_object_dispose__43;
  id v22 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __39__SSVComplexOperation_URLBagDictionary__block_invoke;
  v16[3] = &unk_1E5BABDB0;
  v16[4] = self;
  v16[5] = &v17;
  v16[6] = &v23;
  [(SSVOperation *)self dispatchSync:v16];
  v3 = (void *)v24[5];
  if (!v3)
  {
    if (!v18[5])
    {
      id v4 = +[SSURLBagContext contextWithBagType:0];
      id v5 = [[SSURLBag alloc] initWithURLBagContext:v4];
      v6 = (void *)v18[5];
      v18[5] = (uint64_t)v5;
    }
    dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
    v8 = (void *)v18[5];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __39__SSVComplexOperation_URLBagDictionary__block_invoke_2;
    v13[3] = &unk_1E5BA8CD0;
    v15 = &v23;
    v9 = v7;
    v14 = v9;
    [v8 loadWithCompletionBlock:v13];
    dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __39__SSVComplexOperation_URLBagDictionary__block_invoke_3;
    v12[3] = &unk_1E5BABDB0;
    v12[4] = self;
    v12[5] = &v23;
    v12[6] = &v17;
    [(SSVOperation *)self dispatchAsync:v12];

    v3 = (void *)v24[5];
  }
  id v10 = v3;
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return (NSDictionary *)v10;
}

void __39__SSVComplexOperation_URLBagDictionary__block_invoke(void *a1)
{
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), *(id *)(a1[4] + 296));
  uint64_t v2 = [*(id *)(a1[4] + 304) copy];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __39__SSVComplexOperation_URLBagDictionary__block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __39__SSVComplexOperation_URLBagDictionary__block_invoke_3(void *a1)
{
  if (*(void *)(*(void *)(a1[5] + 8) + 40))
  {
    uint64_t v2 = a1[4];
    uint64_t v3 = *(void **)(v2 + 296);
    *(void *)(v2 + 296) = 0;

    uint64_t v4 = [*(id *)(*(void *)(a1[5] + 8) + 40) copy];
    uint64_t v5 = a1[4];
    v6 = *(void **)(v5 + 304);
    *(void *)(v5 + 304) = v4;
  }
  else
  {
    objc_storeStrong((id *)(a1[4] + 296), *(id *)(*(void *)(a1[6] + 8) + 40));
    uint64_t v7 = a1[4];
    v6 = *(void **)(v7 + 304);
    *(void *)(v7 + 304) = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlBagDictionary, 0);
  objc_storeStrong((id *)&self->_urlBag, 0);
  objc_storeStrong((id *)&self->_sapSession, 0);
}

@end