@interface SCKStartupQueue
- (SCKAsyncSerialQueue)startupTaskQueue;
- (SCKStartupQueue)initWithDeferredStartup:(BOOL)a3;
- (void)enqueueStartupBlock:(id)a3;
- (void)executeAfterStartup:(id)a3;
- (void)setStartupTaskQueue:(id)a3;
@end

@implementation SCKStartupQueue

- (SCKStartupQueue)initWithDeferredStartup:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SCKStartupQueue;
  v4 = [(SCKStartupQueue *)&v9 init];
  if (v4)
  {
    v5 = objc_alloc_init(SCKAsyncSerialQueue);
    startupTaskQueue = v4->_startupTaskQueue;
    v4->_startupTaskQueue = v5;

    v7 = [(SCKStartupQueue *)v4 startupTaskQueue];
    [v7 setSuspended:v3];
  }
  return v4;
}

- (void)enqueueStartupBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(SCKStartupQueue *)self startupTaskQueue];
  [v5 enqueueBlock:v4];
}

- (void)executeAfterStartup:(id)a3
{
  id v4 = a3;
  id v5 = [(SCKStartupQueue *)self startupTaskQueue];
  [v5 setSuspended:0];

  v6 = [(SCKStartupQueue *)self startupTaskQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __39__SCKStartupQueue_executeAfterStartup___block_invoke;
  v8[3] = &unk_26467D6B0;
  id v9 = v4;
  id v7 = v4;
  [v6 enqueueBlock:v8];
}

void __39__SCKStartupQueue_executeAfterStartup___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = *(void (**)(uint64_t))(v2 + 16);
  id v4 = a2;
  v3(v2);
  v4[2]();
}

- (SCKAsyncSerialQueue)startupTaskQueue
{
  return self->_startupTaskQueue;
}

- (void)setStartupTaskQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end