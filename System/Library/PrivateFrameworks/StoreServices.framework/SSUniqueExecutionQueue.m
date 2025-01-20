@interface SSUniqueExecutionQueue
- (OS_dispatch_queue)callBlockQueue;
- (OS_dispatch_queue)executeBlockQueue;
- (OS_dispatch_queue)promiseAccessQueue;
- (SSPromise)promise;
- (SSUniqueExecutionQueue)initWithBlock:(id)a3;
- (id)block;
- (void)addCompletionBlock:(id)a3;
- (void)setBlock:(id)a3;
- (void)setCallBlockQueue:(id)a3;
- (void)setExecuteBlockQueue:(id)a3;
- (void)setPromise:(id)a3;
@end

@implementation SSUniqueExecutionQueue

- (SSUniqueExecutionQueue)initWithBlock:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SSUniqueExecutionQueue;
  v5 = [(SSUniqueExecutionQueue *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    id block = v5->_block;
    v5->_id block = (id)v6;

    dispatch_queue_t v8 = dispatch_queue_create("com.apple.StoreServices.SSUniqueExecutionQueue.callBlockQueue", MEMORY[0x1E4F14430]);
    callBlockQueue = v5->_callBlockQueue;
    v5->_callBlockQueue = (OS_dispatch_queue *)v8;

    dispatch_queue_t v10 = dispatch_queue_create("com.apple.StoreServices.SSUniqueExecutionQueue.executeBlockQueue", 0);
    executeBlockQueue = v5->_executeBlockQueue;
    v5->_executeBlockQueue = (OS_dispatch_queue *)v10;

    dispatch_queue_t v12 = dispatch_queue_create("com.apple.StoreServices.SSUniqueExecutionQueue.promiseAccessQueue", 0);
    promiseAccessQueue = v5->_promiseAccessQueue;
    v5->_promiseAccessQueue = (OS_dispatch_queue *)v12;
  }
  return v5;
}

- (void)addCompletionBlock:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [(SSUniqueExecutionQueue *)self promiseAccessQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__SSUniqueExecutionQueue_addCompletionBlock___block_invoke;
  block[3] = &unk_1E5BA8888;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __45__SSUniqueExecutionQueue_addCompletionBlock___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (!WeakRetained)
  {
    v26 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v26)
    {
      v26 = +[SSLogConfig sharedConfig];
    }
    int v27 = [v26 shouldLog];
    if ([v26 shouldLogToDisk]) {
      int v28 = v27 | 2;
    }
    else {
      int v28 = v27;
    }
    v29 = [v26 OSLogObject];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      int v30 = v28;
    }
    else {
      int v30 = v28 & 2;
    }
    if (v30)
    {
      v50[0] = 0;
      LODWORD(v39) = 2;
      v31 = (void *)_os_log_send_and_compose_impl();

      if (!v31)
      {
LABEL_30:

        uint64_t v38 = *(void *)(a1 + 32);
        SSError(@"SSErrorDomain", 100, 0, 0);
        v5 = (SSPromise *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void, SSPromise *))(v38 + 16))(v38, 0, v5);
        goto LABEL_32;
      }
      v29 = objc_msgSend(NSString, "stringWithCString:encoding:", v31, 4, v50, v39);
      free(v31);
      SSFileLog(v26, @"%@", v32, v33, v34, v35, v36, v37, (uint64_t)v29);
    }

    goto LABEL_30;
  }
  v5 = [WeakRetained promise];
  if (!v5)
  {
    id v6 = objc_alloc_init(SSPromise);
    [v4 setPromise:v6];
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __45__SSUniqueExecutionQueue_addCompletionBlock___block_invoke_6;
    v48[3] = &unk_1E5BA8838;
    objc_copyWeak(&v49, v2);
    [(SSPromise *)v6 addFinishBlock:v48];
    v7 = [v4 executeBlockQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__SSUniqueExecutionQueue_addCompletionBlock___block_invoke_2;
    block[3] = &unk_1E5BA8860;
    objc_copyWeak(&v47, v2);
    v5 = v6;
    v46 = v5;
    dispatch_async(v7, block);

    objc_destroyWeak(&v47);
    objc_destroyWeak(&v49);
  }
  if (![(SSPromise *)v5 isFinished])
  {
    [(SSPromise *)v5 addFinishBlock:*(void *)(a1 + 32)];
    goto LABEL_32;
  }
  id v8 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v8)
  {
    id v8 = +[SSLogConfig sharedConfig];
  }
  int v9 = [v8 shouldLog];
  if ([v8 shouldLogToDisk]) {
    int v10 = v9 | 2;
  }
  else {
    int v10 = v9;
  }
  v11 = [v8 OSLogObject];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO)) {
    int v12 = v10;
  }
  else {
    int v12 = v10 & 2;
  }
  if (!v12) {
    goto LABEL_16;
  }
  v50[0] = 0;
  LODWORD(v39) = 2;
  v13 = (void *)_os_log_send_and_compose_impl();

  if (v13)
  {
    v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v13, 4, v50, v39);
    free(v13);
    SSFileLog(v8, @"%@", v14, v15, v16, v17, v18, v19, (uint64_t)v11);
LABEL_16:
  }
  id v44 = 0;
  v20 = [(SSPromise *)v5 resultWithError:&v44];
  id v21 = v44;
  v22 = [v4 callBlockQueue];
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __45__SSUniqueExecutionQueue_addCompletionBlock___block_invoke_11;
  v40[3] = &unk_1E5BA6EB8;
  id v23 = *(id *)(a1 + 32);
  id v42 = v21;
  id v43 = v23;
  id v41 = v20;
  id v24 = v21;
  id v25 = v20;
  dispatch_async(v22, v40);

LABEL_32:
}

void __45__SSUniqueExecutionQueue_addCompletionBlock___block_invoke_6(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (!WeakRetained)
  {
    v5 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v5)
    {
      v5 = +[SSLogConfig sharedConfig];
    }
    int v6 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v7 = v6 | 2;
    }
    else {
      int v7 = v6;
    }
    id v8 = [v5 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      int v9 = v7;
    }
    else {
      int v9 = v7 & 2;
    }
    if (v9)
    {
      v20[0] = 0;
      LODWORD(v17) = 2;
      int v10 = (void *)_os_log_send_and_compose_impl();

      if (!v10)
      {
LABEL_15:

        goto LABEL_16;
      }
      id v8 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, v20, v17);
      free(v10);
      SSFileLog(v5, @"%@", v11, v12, v13, v14, v15, v16, (uint64_t)v8);
    }

    goto LABEL_15;
  }
  id v4 = [WeakRetained promiseAccessQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__SSUniqueExecutionQueue_addCompletionBlock___block_invoke_7;
  block[3] = &unk_1E5BA8810;
  objc_copyWeak(&v19, v1);
  dispatch_async(v4, block);

  objc_destroyWeak(&v19);
LABEL_16:
}

void __45__SSUniqueExecutionQueue_addCompletionBlock___block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setPromise:0];
}

void __45__SSUniqueExecutionQueue_addCompletionBlock___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (!WeakRetained)
  {
    int v10 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v10)
    {
      int v10 = +[SSLogConfig sharedConfig];
    }
    int v11 = [v10 shouldLog];
    if ([v10 shouldLogToDisk]) {
      int v12 = v11 | 2;
    }
    else {
      int v12 = v11;
    }
    uint64_t v13 = [v10 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      int v14 = v12;
    }
    else {
      int v14 = v12 & 2;
    }
    if (v14)
    {
      v29[0] = 0;
      LODWORD(v23) = 2;
      uint64_t v15 = (void *)_os_log_send_and_compose_impl();

      if (!v15)
      {
LABEL_15:

        v22 = *(void **)(a1 + 32);
        SSError(@"SSErrorDomain", 100, 0, 0);
        id v8 = (id)objc_claimAutoreleasedReturnValue();
        [v22 finishWithError:v8];
        goto LABEL_16;
      }
      uint64_t v13 = objc_msgSend(NSString, "stringWithCString:encoding:", v15, 4, v29, v23);
      free(v15);
      SSFileLog(v10, @"%@", v16, v17, v18, v19, v20, v21, (uint64_t)v13);
    }

    goto LABEL_15;
  }
  id v4 = [WeakRetained block];
  id v28 = 0;
  v5 = ((void (**)(void, id *))v4)[2](v4, &v28);
  id v6 = v28;

  int v7 = [v3 callBlockQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__SSUniqueExecutionQueue_addCompletionBlock___block_invoke_10;
  block[3] = &unk_1E5BA7068;
  id v25 = *(id *)(a1 + 32);
  id v26 = v5;
  id v27 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, block);

LABEL_16:
}

uint64_t __45__SSUniqueExecutionQueue_addCompletionBlock___block_invoke_10(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithResult:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

uint64_t __45__SSUniqueExecutionQueue_addCompletionBlock___block_invoke_11(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
}

- (OS_dispatch_queue)callBlockQueue
{
  return self->_callBlockQueue;
}

- (void)setCallBlockQueue:(id)a3
{
}

- (OS_dispatch_queue)executeBlockQueue
{
  return self->_executeBlockQueue;
}

- (void)setExecuteBlockQueue:(id)a3
{
}

- (SSPromise)promise
{
  return self->_promise;
}

- (void)setPromise:(id)a3
{
}

- (OS_dispatch_queue)promiseAccessQueue
{
  return self->_promiseAccessQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_promiseAccessQueue, 0);
  objc_storeStrong((id *)&self->_promise, 0);
  objc_storeStrong((id *)&self->_executeBlockQueue, 0);
  objc_storeStrong((id *)&self->_callBlockQueue, 0);
  objc_storeStrong(&self->_block, 0);
}

@end