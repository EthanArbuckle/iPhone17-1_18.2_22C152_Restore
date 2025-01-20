@interface WBSCyclerOperation
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (WBSCyclerOperation)init;
- (WBSCyclerOperation)initWithMaximumNumberOfAttempts:(unint64_t)a3 backoffRatio:(float)a4;
- (double)nextBackoffTimeInterval;
- (id)block;
- (void)executeWithResultHandler:(id)a3;
- (void)setBlock:(id)a3;
@end

@implementation WBSCyclerOperation

- (WBSCyclerOperation)init
{
  return 0;
}

- (WBSCyclerOperation)initWithMaximumNumberOfAttempts:(unint64_t)a3 backoffRatio:(float)a4
{
  v10.receiver = self;
  v10.super_class = (Class)WBSCyclerOperation;
  v6 = [(WBSCyclerOperation *)&v10 init];
  v7 = v6;
  if (v6)
  {
    v6->_numberOfRemainingAttempts = a3;
    v6->_backoffRatio = a4;
    v8 = v6;
  }

  return v7;
}

- (void)executeWithResultHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__WBSCyclerOperation_executeWithResultHandler___block_invoke;
  v6[3] = &unk_1E5C8CDF0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __47__WBSCyclerOperation_executeWithResultHandler___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 21) = 1;
  dispatch_time_t v2 = dispatch_time(0, (uint64_t)(*(double *)(*(void *)(a1 + 32) + 32) * 1000000000.0));
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__WBSCyclerOperation_executeWithResultHandler___block_invoke_2;
  v4[3] = &unk_1E5C8CDF0;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  dispatch_after(v2, MEMORY[0x1E4F14428], v4);
}

void __47__WBSCyclerOperation_executeWithResultHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(v1 + 24);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __47__WBSCyclerOperation_executeWithResultHandler___block_invoke_3;
  v3[3] = &unk_1E5C9A7F8;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);
}

void __47__WBSCyclerOperation_executeWithResultHandler___block_invoke_3(uint64_t a1, char a2)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__WBSCyclerOperation_executeWithResultHandler___block_invoke_4;
  block[3] = &unk_1E5C9A7D0;
  uint64_t v2 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  char v5 = a2;
  id v4 = v2;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __47__WBSCyclerOperation_executeWithResultHandler___block_invoke_4(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 21) = 0;
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(a1 + 48) || (uint64_t v2 = *(void *)(v1 + 8) - 1, *(void *)(v1 + 8) = v2, v1 = *(void *)(a1 + 32), !v2))
  {
    *(unsigned char *)(v1 + 20) = 1;
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    double v3 = *(double *)(v1 + 32);
    if (v3 == 0.0) {
      double v3 = 1.0;
    }
    *(double *)(v1 + 32) = v3 * *(float *)(v1 + 16);
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (BOOL)isExecuting
{
  return self->_executing;
}

- (double)nextBackoffTimeInterval
{
  return self->_nextBackoffTimeInterval;
}

- (void).cxx_destruct
{
}

@end