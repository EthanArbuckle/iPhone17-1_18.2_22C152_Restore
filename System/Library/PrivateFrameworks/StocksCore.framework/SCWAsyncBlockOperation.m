@interface SCWAsyncBlockOperation
- (BOOL)isAsynchronous;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (SCWAsyncBlockOperation)initWithBlock:(id)a3;
- (id)block;
- (void)start;
@end

@implementation SCWAsyncBlockOperation

- (BOOL)isExecuting
{
  return self->_executing;
}

- (void).cxx_destruct
{
}

- (SCWAsyncBlockOperation)initWithBlock:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SCWAsyncBlockOperation;
  v5 = [(SCWAsyncBlockOperation *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    id block = v5->_block;
    v5->_id block = (id)v6;
  }
  return v5;
}

uint64_t __31__SCWAsyncBlockOperation_start__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) willChangeValueForKey:@"isExecuting"];
  *(unsigned char *)(*(void *)(a1 + 32) + 248) = 0;
  [*(id *)(a1 + 32) didChangeValueForKey:@"isExecuting"];
  [*(id *)(a1 + 32) willChangeValueForKey:@"isFinished"];
  *(unsigned char *)(*(void *)(a1 + 32) + 249) = 1;
  v2 = *(void **)(a1 + 32);

  return [v2 didChangeValueForKey:@"isFinished"];
}

- (void)start
{
  if ([(SCWAsyncBlockOperation *)self isCancelled])
  {
    [(SCWAsyncBlockOperation *)self willChangeValueForKey:@"isFinished"];
    self->_finished = 1;
    [(SCWAsyncBlockOperation *)self didChangeValueForKey:@"isFinished"];
  }
  else
  {
    [(SCWAsyncBlockOperation *)self willChangeValueForKey:@"isExecuting"];
    self->_executing = 1;
    v3 = (void *)MEMORY[0x1B3E8E870]([(SCWAsyncBlockOperation *)self didChangeValueForKey:@"isExecuting"]);
    id v4 = [(SCWAsyncBlockOperation *)self block];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __31__SCWAsyncBlockOperation_start__block_invoke;
    v5[3] = &unk_1E5FA3BC8;
    v5[4] = self;
    ((void (**)(void, void *))v4)[2](v4, v5);
  }
}

- (id)block
{
  return self->_block;
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (BOOL)isAsynchronous
{
  return 1;
}

@end