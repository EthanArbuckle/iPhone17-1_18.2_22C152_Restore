@interface PLConcurrentQueue
- (OS_dispatch_queue)targetQueue;
- (PLConcurrentQueue)init;
- (PLConcurrentQueue)initWithTargetQueue:(id)a3 width:(int64_t)a4;
- (int64_t)width;
- (void)_internalQueue_tryDispatchingNextPendingBlock;
- (void)dispatchAsync:(id)a3;
@end

@implementation PLConcurrentQueue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue_pendingBlocks, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

- (int64_t)width
{
  return self->_width;
}

- (OS_dispatch_queue)targetQueue
{
  return self->_targetQueue;
}

- (void)_internalQueue_tryDispatchingNextPendingBlock
{
  if ([(NSMutableArray *)self->_internalQueue_pendingBlocks count])
  {
    if (self->_internalQueue_usedWidth < self->_width)
    {
      v3 = [(NSMutableArray *)self->_internalQueue_pendingBlocks firstObject];
      [(NSMutableArray *)self->_internalQueue_pendingBlocks removeObjectAtIndex:0];
      ++self->_internalQueue_usedWidth;
      id v4 = v3;
      pl_dispatch_async();
    }
  }
}

void __66__PLConcurrentQueue__internalQueue_tryDispatchingNextPendingBlock__block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__PLConcurrentQueue__internalQueue_tryDispatchingNextPendingBlock__block_invoke_2;
  block[3] = &unk_1E5875CE0;
  block[4] = v2;
  dispatch_async(v3, block);
}

uint64_t __66__PLConcurrentQueue__internalQueue_tryDispatchingNextPendingBlock__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_internalQueue_tryDispatchingNextPendingBlock");
}

- (void)dispatchAsync:(id)a3
{
  if (a3)
  {
    id v4 = (void *)[a3 copy];
    internalQueue = self->_internalQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __35__PLConcurrentQueue_dispatchAsync___block_invoke;
    v7[3] = &unk_1E58742F0;
    v7[4] = self;
    id v8 = v4;
    id v6 = v4;
    dispatch_sync(internalQueue, v7);
  }
}

uint64_t __35__PLConcurrentQueue_dispatchAsync___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16);
  v3 = (void *)MEMORY[0x19F38D650](*(void *)(a1 + 40));
  [v2 addObject:v3];

  id v4 = *(void **)(a1 + 32);
  return objc_msgSend(v4, "_internalQueue_tryDispatchingNextPendingBlock");
}

- (PLConcurrentQueue)initWithTargetQueue:(id)a3 width:(int64_t)a4
{
  id v7 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PLConcurrentQueue;
  id v8 = [(PLConcurrentQueue *)&v15 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_targetQueue, a3);
    v9->_width = a4;
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.photos.concurrent-queue-internal", 0);
    internalQueue = v9->_internalQueue;
    v9->_internalQueue = (OS_dispatch_queue *)v10;

    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    internalQueue_pendingBlocks = v9->_internalQueue_pendingBlocks;
    v9->_internalQueue_pendingBlocks = v12;
  }
  return v9;
}

- (PLConcurrentQueue)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PLConcurrentQueue.m", 21, @"%s is not a valid initializer", "-[PLConcurrentQueue init]");

  return 0;
}

@end