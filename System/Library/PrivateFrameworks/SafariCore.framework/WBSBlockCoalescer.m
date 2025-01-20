@interface WBSBlockCoalescer
- (WBSBlockCoalescer)initWithMinimumTimeIntervalBeforeExecution:(double)a3 queue:(id)a4;
- (void)_dispatchBlock;
- (void)scheduleBlock:(id)a3;
@end

@implementation WBSBlockCoalescer

- (WBSBlockCoalescer)initWithMinimumTimeIntervalBeforeExecution:(double)a3 queue:(id)a4
{
  v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)WBSBlockCoalescer;
  v7 = [(WBSBlockCoalescer *)&v14 init];
  v8 = v7;
  if (v7)
  {
    v7->_minimumTimeIntervalBeforeExecution = a3;
    objc_msgSend(NSString, "stringWithFormat:", @"com.apple.Safari.BlockCoalescer.%p", v7);
    id v9 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v10 = dispatch_queue_create((const char *)[v9 UTF8String], 0);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v10;

    dispatch_set_target_queue((dispatch_object_t)v8->_queue, v6);
    v12 = v8;
  }
  return v8;
}

- (void)scheduleBlock:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__WBSBlockCoalescer_scheduleBlock___block_invoke;
  v7[3] = &unk_1E615A6A0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __35__WBSBlockCoalescer_scheduleBlock___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 24);
  if (v2) {
    dispatch_block_cancel(v2);
  }
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  id v9 = __35__WBSBlockCoalescer_scheduleBlock___block_invoke_2;
  dispatch_queue_t v10 = &unk_1E615A870;
  id v3 = *(id *)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 32);
  id v12 = v3;
  dispatch_block_t v4 = dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, &v7);
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v4;

  objc_msgSend(*(id *)(a1 + 32), "_dispatchBlock", v7, v8, v9, v10);
}

void __35__WBSBlockCoalescer_scheduleBlock___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = 0;
}

- (void)_dispatchBlock
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__WBSBlockCoalescer__dispatchBlock__block_invoke;
  block[3] = &unk_1E615A768;
  block[4] = self;
  dispatch_async(queue, block);
}

void __35__WBSBlockCoalescer__dispatchBlock__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 24))
  {
    dispatch_time_t v3 = dispatch_time(0, (uint64_t)(*(double *)(v1 + 8) * 1000000000.0));
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(NSObject **)(v4 + 16);
    id v6 = *(void **)(v4 + 24);
    dispatch_after(v3, v5, v6);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end