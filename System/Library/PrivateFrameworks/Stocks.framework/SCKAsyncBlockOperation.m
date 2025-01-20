@interface SCKAsyncBlockOperation
- (BOOL)isAsynchronous;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (SCKAsyncBlockOperation)initWithBlock:(id)a3;
- (id)block;
- (void)start;
@end

@implementation SCKAsyncBlockOperation

- (SCKAsyncBlockOperation)initWithBlock:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SCKAsyncBlockOperation;
  v5 = [(SCKAsyncBlockOperation *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    id block = v5->_block;
    v5->_id block = (id)v6;
  }
  return v5;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (BOOL)isExecuting
{
  return self->_executing;
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (void)start
{
  if ([(SCKAsyncBlockOperation *)self isCancelled])
  {
    [(SCKAsyncBlockOperation *)self willChangeValueForKey:@"isFinished"];
    self->_finished = 1;
    [(SCKAsyncBlockOperation *)self didChangeValueForKey:@"isFinished"];
  }
  else
  {
    [(SCKAsyncBlockOperation *)self willChangeValueForKey:@"isExecuting"];
    self->_executing = 1;
    v3 = (void *)MEMORY[0x223CABB70]([(SCKAsyncBlockOperation *)self didChangeValueForKey:@"isExecuting"]);
    id v4 = [(SCKAsyncBlockOperation *)self block];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __31__SCKAsyncBlockOperation_start__block_invoke;
    v5[3] = &unk_26467D130;
    v5[4] = self;
    ((void (**)(void, void *))v4)[2](v4, v5);
  }
}

uint64_t __31__SCKAsyncBlockOperation_start__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) willChangeValueForKey:@"isExecuting"];
  *(unsigned char *)(*(void *)(a1 + 32) + 248) = 0;
  [*(id *)(a1 + 32) didChangeValueForKey:@"isExecuting"];
  [*(id *)(a1 + 32) willChangeValueForKey:@"isFinished"];
  *(unsigned char *)(*(void *)(a1 + 32) + 249) = 1;
  v2 = *(void **)(a1 + 32);

  return [v2 didChangeValueForKey:@"isFinished"];
}

- (id)block
{
  return self->_block;
}

- (void).cxx_destruct
{
}

@end