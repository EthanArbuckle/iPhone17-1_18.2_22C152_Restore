@interface ICAsyncBlockOperation
- (ICAsyncBlockOperation)initWithStartHandler:(id)a3;
- (id)cancellationHandler;
- (id)startHandler;
- (void)cancel;
- (void)execute;
- (void)finishWithError:(id)a3;
- (void)setCancellationHandler:(id)a3;
@end

@implementation ICAsyncBlockOperation

- (ICAsyncBlockOperation)initWithStartHandler:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ICAsyncBlockOperation;
  v5 = [(ICAsyncOperation *)&v11 init];
  if (v5)
  {
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.iTunesCloud.ICAsyncBlockOperation.accessQueue", MEMORY[0x1E4F14430]);
    accessQueue = v5->_accessQueue;
    v5->_accessQueue = (OS_dispatch_queue *)v6;

    uint64_t v8 = MEMORY[0x1A6240BF0](v4);
    id startHandler = v5->_startHandler;
    v5->_id startHandler = (id)v8;
  }
  return v5;
}

- (void)execute
{
}

- (void)finishWithError:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ICAsyncBlockOperation;
  [(ICAsyncOperation *)&v4 finishWithError:a3];
  [(ICAsyncBlockOperation *)self setCancellationHandler:0];
}

- (void)setCancellationHandler:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__ICAsyncBlockOperation_setCancellationHandler___block_invoke;
  v7[3] = &unk_1E5ACD2F0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_async(accessQueue, v7);
}

uint64_t __48__ICAsyncBlockOperation_setCancellationHandler___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 296) = [*(id *)(a1 + 40) copy];

  return MEMORY[0x1F41817F8]();
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_startHandler, 0);
  objc_storeStrong(&self->_cancellationHandler, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

- (id)startHandler
{
  return self->_startHandler;
}

- (id)cancellationHandler
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__4367;
  v10 = __Block_byref_object_dispose__4368;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__ICAsyncBlockOperation_cancellationHandler__block_invoke;
  v5[3] = &unk_1E5ACD880;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (void *)MEMORY[0x1A6240BF0](v7[5]);
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __44__ICAsyncBlockOperation_cancellationHandler__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = MEMORY[0x1A6240BF0](*(void *)(*(void *)(a1 + 32)
                                                                                              + 296));

  return MEMORY[0x1F41817F8]();
}

- (void)cancel
{
  v5.receiver = self;
  v5.super_class = (Class)ICAsyncBlockOperation;
  [(ICAsyncBlockOperation *)&v5 cancel];
  uint64_t v3 = [(ICAsyncBlockOperation *)self cancellationHandler];
  id v4 = (void *)v3;
  if (v3) {
    (*(void (**)(uint64_t))(v3 + 16))(v3);
  }
}

@end