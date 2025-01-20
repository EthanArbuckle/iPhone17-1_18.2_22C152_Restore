@interface SSVLeaseCertificateRequestOperation
- (NSString)certificateURLBagKey;
- (SSVLeaseCertificateRequestOperation)initWithConfiguration:(id)a3;
- (SSVLeaseCertificateRequestOperation)initWithURLBag:(id)a3;
- (id)_resolveCertificateURLReturningError:(id *)a3;
- (id)outputBlock;
- (void)cancel;
- (void)main;
- (void)setCertificateURLBagKey:(id)a3;
- (void)setOutputBlock:(id)a3;
@end

@implementation SSVLeaseCertificateRequestOperation

- (SSVLeaseCertificateRequestOperation)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v5 = [(SSVOperation *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    configuration = v5->_configuration;
    v5->_configuration = (SSVPlaybackLeaseConfiguration *)v6;
  }
  return v5;
}

- (SSVLeaseCertificateRequestOperation)initWithURLBag:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(SSVOperation *)self init];
  if (v6)
  {
    dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
    bagLoadSemaphore = v6->_bagLoadSemaphore;
    v6->_bagLoadSemaphore = (OS_dispatch_semaphore *)v7;

    objc_storeStrong((id *)&v6->_urlBag, a3);
  }

  return v6;
}

- (void)cancel
{
  bagLoadSemaphore = self->_bagLoadSemaphore;
  if (bagLoadSemaphore) {
    dispatch_semaphore_signal(bagLoadSemaphore);
  }
  v4.receiver = self;
  v4.super_class = (Class)SSVLeaseCertificateRequestOperation;
  [(SSVOperation *)&v4 cancel];
}

- (void)main
{
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__16;
  v22 = __Block_byref_object_dispose__16;
  id v23 = 0;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__16;
  v16 = __Block_byref_object_dispose__16;
  id v17 = 0;
  id obj = 0;
  v3 = [(SSVLeaseCertificateRequestOperation *)self _resolveCertificateURLReturningError:&obj];
  objc_storeStrong(&v23, obj);
  if (v3)
  {
    objc_super v4 = (void *)[objc_alloc(MEMORY[0x1E4F28E88]) initWithURL:v3];
    [v4 setHTTPMethod:@"GET"];
    id v5 = [[SSVLoadURLOperation alloc] initWithURLRequest:v4];
    uint64_t v6 = +[SSVURLDataConsumer consumer];
    [(SSVLoadURLOperation *)v5 setDataConsumer:v6];

    [(SSVLoadURLOperation *)v5 setITunesStoreRequest:1];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __43__SSVLeaseCertificateRequestOperation_main__block_invoke;
    v10[3] = &unk_1E5BA80B0;
    v10[4] = &v18;
    v10[5] = &v12;
    [(SSVLoadURLOperation *)v5 setOutputBlock:v10];
    [(SSVOperation *)self runChildOperation:v5];

LABEL_3:
    goto LABEL_5;
  }
  if (!v19[5])
  {
    uint64_t v9 = SSError(@"SSErrorDomain", 100, 0, 0);
    objc_super v4 = (void *)v19[5];
    v19[5] = v9;
    goto LABEL_3;
  }
LABEL_5:
  uint64_t v7 = [(SSVLeaseCertificateRequestOperation *)self outputBlock];
  v8 = (void *)v7;
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v7, v13[5], v19[5]);
  }

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);
}

void __43__SSVLeaseCertificateRequestOperation_main__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (NSString)certificateURLBagKey
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__16;
  uint64_t v9 = __Block_byref_object_dispose__16;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __59__SSVLeaseCertificateRequestOperation_certificateURLBagKey__block_invoke;
  v4[3] = &unk_1E5BA6F30;
  v4[4] = self;
  v4[5] = &v5;
  [(SSVOperation *)self dispatchSync:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

void __59__SSVLeaseCertificateRequestOperation_certificateURLBagKey__block_invoke(uint64_t a1)
{
}

- (id)outputBlock
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__5;
  uint64_t v9 = __Block_byref_object_dispose__6;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__SSVLeaseCertificateRequestOperation_outputBlock__block_invoke;
  v4[3] = &unk_1E5BA6F30;
  v4[4] = self;
  v4[5] = &v5;
  [(SSVOperation *)self dispatchSync:v4];
  id v2 = (void *)MEMORY[0x1A6268200](v6[5]);
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __50__SSVLeaseCertificateRequestOperation_outputBlock__block_invoke(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x1A6268200](*(void *)(*(void *)(a1 + 32) + 336));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  objc_super v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)setOutputBlock:(id)a3
{
  objc_super v4 = (void *)[a3 copy];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__SSVLeaseCertificateRequestOperation_setOutputBlock___block_invoke;
  v6[3] = &unk_1E5BA7350;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(SSVOperation *)self dispatchAsync:v6];
}

void __54__SSVLeaseCertificateRequestOperation_setOutputBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x1A6268200](*(void *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  objc_super v4 = *(void **)(v3 + 336);
  *(void *)(v3 + 336) = v2;
}

- (void)setCertificateURLBagKey:(id)a3
{
  objc_super v4 = (void *)[a3 copy];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__SSVLeaseCertificateRequestOperation_setCertificateURLBagKey___block_invoke;
  v6[3] = &unk_1E5BA7018;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(SSVOperation *)self dispatchAsync:v6];
}

void __63__SSVLeaseCertificateRequestOperation_setCertificateURLBagKey___block_invoke(uint64_t a1)
{
}

- (id)_resolveCertificateURLReturningError:(id *)a3
{
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__16;
  v29 = __Block_byref_object_dispose__16;
  id v30 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__16;
  id v23 = __Block_byref_object_dispose__16;
  id v24 = [(SSVPlaybackLeaseConfiguration *)self->_configuration certificateURL];
  if (!v20[5])
  {
    id v5 = [(SSVLeaseCertificateRequestOperation *)self certificateURLBagKey];
    if (v5 || (id v5 = @"fps-cert") != 0)
    {
      uint64_t v6 = self->_urlBag;
      if (!v6)
      {
        id v7 = +[SSURLBagContext contextWithBagType:0];
        uint64_t v6 = +[SSURLBag URLBagForContext:v7];
      }
      bagLoadSemaphore = self->_bagLoadSemaphore;
      if (bagLoadSemaphore) {
        dispatch_semaphore_t v9 = bagLoadSemaphore;
      }
      else {
        dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
      }
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __76__SSVLeaseCertificateRequestOperation__resolveCertificateURLReturningError___block_invoke;
      v15[3] = &unk_1E5BA9340;
      id v17 = &v19;
      uint64_t v18 = &v25;
      id v10 = v9;
      v16 = v10;
      [(SSURLBag *)v6 loadValueForKey:v5 completionBlock:v15];
      dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
    }
    if (!v20[5] && !v26[5])
    {
      uint64_t v11 = SSError(@"SSErrorDomain", 124, 0, 0);
      uint64_t v12 = (void *)v26[5];
      v26[5] = v11;
    }
  }
  if (a3) {
    *a3 = (id) v26[5];
  }
  id v13 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v13;
}

void __76__SSVLeaseCertificateRequestOperation__resolveCertificateURLReturningError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    id v8 = v5;
    dispatch_semaphore_t v9 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v8;
  }
  else
  {
    if (![v12 isNSString]) {
      goto LABEL_6;
    }
    uint64_t v10 = [MEMORY[0x1E4F1CB10] URLWithString:v12];
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    dispatch_semaphore_t v9 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }

LABEL_6:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlBag, 0);
  objc_storeStrong(&self->_outputBlock, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_certificateURLBagKey, 0);
  objc_storeStrong((id *)&self->_bagLoadSemaphore, 0);
}

@end