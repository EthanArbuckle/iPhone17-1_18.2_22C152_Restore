@interface PXLIFOQueue
- (OS_dispatch_queue)targetQueue;
- (PXLIFOQueue)initWithTargetQueue:(id)a3;
- (void)_executeNextPendingBlock;
- (void)dispatchAsync:(id)a3;
@end

@implementation PXLIFOQueue

uint64_t __29__PXLIFOQueue_dispatchAsync___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _executeNextPendingBlock];
}

- (OS_dispatch_queue)targetQueue
{
  return self->_targetQueue;
}

- (PXLIFOQueue)initWithTargetQueue:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PXLIFOQueue;
  v6 = [(PXLIFOQueue *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_targetQueue, a3);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.photos.lifo-internal-queue", 0);
    internalQueue = v7->_internalQueue;
    v7->_internalQueue = (OS_dispatch_queue *)v8;

    uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
    internalQueue_pendingBlocks = v7->_internalQueue_pendingBlocks;
    v7->_internalQueue_pendingBlocks = (NSMutableArray *)v10;
  }
  return v7;
}

void __29__PXLIFOQueue_dispatchAsync___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 16);
  id v2 = (id)[*(id *)(a1 + 40) copy];
  [v1 addObject:v2];
}

uint64_t __39__PXLIFOQueue__executeNextPendingBlock__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) lastObject];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = *(void **)(*(void *)(a1 + 32) + 16);
  return [v5 removeLastObject];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue_pendingBlocks, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

- (void)_executeNextPendingBlock
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__206845;
  dispatch_queue_t v8 = __Block_byref_object_dispose__206846;
  id v9 = 0;
  internalQueue = self->_internalQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __39__PXLIFOQueue__executeNextPendingBlock__block_invoke;
  v3[3] = &unk_1E5DD0588;
  v3[4] = self;
  v3[5] = &v4;
  dispatch_sync(internalQueue, v3);
  (*(void (**)(void))(v5[5] + 16))();
  _Block_object_dispose(&v4, 8);
}

- (void)dispatchAsync:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__PXLIFOQueue_dispatchAsync___block_invoke;
  block[3] = &unk_1E5DD3280;
  block[4] = self;
  id v10 = v4;
  id v6 = v4;
  dispatch_sync(internalQueue, block);
  targetQueue = self->_targetQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __29__PXLIFOQueue_dispatchAsync___block_invoke_2;
  v8[3] = &unk_1E5DD36F8;
  v8[4] = self;
  dispatch_async(targetQueue, v8);
}

@end