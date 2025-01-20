@interface PFCoalescerContext
- (NSArray)pendingActivityTokensSnapshot;
- (NSHashTable)pendingActivityTokens;
- (OS_dispatch_group)group;
- (OS_dispatch_queue)isolationQueue;
- (PFCoalescer)coalescer;
- (PFCoalescerContext)initWithCoalescer:(id)a3;
- (id)activityToken;
- (id)activityTokenWithReason:(id)a3;
- (unint64_t)coalescedUpdatesCount;
- (void)cancelPendingActivityTokens;
- (void)delayNextInvocationByTimeInterval:(double)a3;
- (void)notifyActivityTokenCompletionOnQueue:(id)a3 handler:(id)a4;
- (void)pushBack:(id)a3;
- (void)setCoalescedUpdatesCount:(unint64_t)a3;
- (void)setCoalescer:(id)a3;
- (void)setGroup:(id)a3;
- (void)setIsolationQueue:(id)a3;
- (void)setPendingActivityTokens:(id)a3;
@end

@implementation PFCoalescerContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingActivityTokens, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_isolationQueue, 0);
  objc_destroyWeak((id *)&self->_coalescer);
}

- (void)setPendingActivityTokens:(id)a3
{
}

- (NSHashTable)pendingActivityTokens
{
  return (NSHashTable *)objc_getProperty(self, a2, 40, 1);
}

- (void)setGroup:(id)a3
{
}

- (OS_dispatch_group)group
{
  return (OS_dispatch_group *)objc_getProperty(self, a2, 32, 1);
}

- (void)setIsolationQueue:(id)a3
{
}

- (OS_dispatch_queue)isolationQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCoalescer:(id)a3
{
}

- (PFCoalescer)coalescer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_coalescer);
  return (PFCoalescer *)WeakRetained;
}

- (void)setCoalescedUpdatesCount:(unint64_t)a3
{
  self->_coalescedUpdatesCount = a3;
}

- (unint64_t)coalescedUpdatesCount
{
  return self->_coalescedUpdatesCount;
}

- (void)notifyActivityTokenCompletionOnQueue:(id)a3 handler:(id)a4
{
}

- (NSArray)pendingActivityTokensSnapshot
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__PFCoalescerContext_pendingActivityTokensSnapshot__block_invoke;
  v5[3] = &unk_1E62AC000;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

uint64_t __51__PFCoalescerContext_pendingActivityTokensSnapshot__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 40) allObjects];
  return MEMORY[0x1F41817F8]();
}

- (void)cancelPendingActivityTokens
{
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__PFCoalescerContext_cancelPendingActivityTokens__block_invoke;
  block[3] = &unk_1E62ABFB0;
  block[4] = self;
  dispatch_sync(isolationQueue, block);
}

uint64_t __49__PFCoalescerContext_cancelPendingActivityTokens__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 40);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v6++), "endActivity", (void)v8);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  return [*(id *)(*(void *)(a1 + 32) + 40) removeAllObjects];
}

- (id)activityTokenWithReason:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[PFCoalescerActivityToken alloc] initWithDispatchGroup:self->_group reason:v4];

  isolationQueue = self->_isolationQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __46__PFCoalescerContext_activityTokenWithReason___block_invoke;
  v11[3] = &unk_1E62ABFD8;
  v11[4] = self;
  v7 = v5;
  v12 = v7;
  dispatch_sync(isolationQueue, v11);
  long long v8 = v12;
  long long v9 = v7;

  return v9;
}

uint64_t __46__PFCoalescerContext_activityTokenWithReason___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) addObject:*(void *)(a1 + 40)];
}

- (id)activityToken
{
  return [(PFCoalescerContext *)self activityTokenWithReason:@"(unknown)"];
}

- (void)delayNextInvocationByTimeInterval:(double)a3
{
  uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"delayNextInvocationByTimeInterval %f", *(void *)&a3);
  uint64_t v6 = [(PFCoalescerContext *)self activityTokenWithReason:v5];

  dispatch_time_t v7 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  long long v8 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__PFCoalescerContext_delayNextInvocationByTimeInterval___block_invoke;
  block[3] = &unk_1E62ABFB0;
  id v11 = v6;
  id v9 = v6;
  dispatch_after(v7, v8, block);
}

uint64_t __56__PFCoalescerContext_delayNextInvocationByTimeInterval___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) endActivity];
}

- (void)pushBack:(id)a3
{
  id v6 = a3;
  id v4 = [(PFCoalescerContext *)self coalescer];
  uint64_t v5 = v4;
  if (v4) {
    [v4 update:v6];
  }
}

- (PFCoalescerContext)initWithCoalescer:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PFCoalescerContext;
  uint64_t v5 = [(PFCoalescerContext *)&v12 init];
  id v6 = v5;
  if (v5)
  {
    [(PFCoalescerContext *)v5 setCoalescer:v4];
    dispatch_group_t v7 = dispatch_group_create();
    [(PFCoalescerContext *)v6 setGroup:v7];

    long long v8 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    [(PFCoalescerContext *)v6 setPendingActivityTokens:v8];

    id v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("PFCoalescer context isolation", v9);
    [(PFCoalescerContext *)v6 setIsolationQueue:v10];
  }
  return v6;
}

@end