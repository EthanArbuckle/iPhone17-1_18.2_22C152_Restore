@interface SCWStartupQueue
- (SCWAsyncSerialQueue)startupTaskQueue;
- (SCWStartupQueue)initWithDeferredStartup:(BOOL)a3;
- (int64_t)startupTaskDepth;
- (os_unfair_lock_s)startupTaskDepthLock;
- (void)enqueueStartupBlock:(id)a3;
- (void)executeAfterStartup:(id)a3;
- (void)setStartupTaskDepth:(int64_t)a3;
- (void)setStartupTaskDepthLock:(os_unfair_lock_s)a3;
- (void)setStartupTaskQueue:(id)a3;
@end

@implementation SCWStartupQueue

- (void)executeAfterStartup:(id)a3
{
  v4 = (void (**)(void))a3;
  v5 = [(SCWStartupQueue *)self startupTaskQueue];
  [v5 setSuspended:0];

  os_unfair_lock_lock(&self->_startupTaskDepthLock);
  int64_t startupTaskDepth = self->_startupTaskDepth;
  os_unfair_lock_unlock(&self->_startupTaskDepthLock);
  if (startupTaskDepth <= 0)
  {
    v4[2](v4);
  }
  else
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __39__SCWStartupQueue_executeAfterStartup___block_invoke;
    v7[3] = &unk_1E5FA3AB8;
    v8 = v4;
    [(SCWStartupQueue *)self enqueueStartupBlock:v7];
  }
}

- (void)enqueueStartupBlock:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_startupTaskDepthLock);
  ++self->_startupTaskDepth;
  os_unfair_lock_unlock(&self->_startupTaskDepthLock);
  v5 = [(SCWStartupQueue *)self startupTaskQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__SCWStartupQueue_enqueueStartupBlock___block_invoke;
  v7[3] = &unk_1E5FA3A90;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 enqueueBlock:v7];
}

- (SCWAsyncSerialQueue)startupTaskQueue
{
  return self->_startupTaskQueue;
}

void __39__SCWStartupQueue_executeAfterStartup___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void (**)(uint64_t))(v2 + 16);
  id v4 = a2;
  v3(v2);
  v4[2]();
}

void __39__SCWStartupQueue_enqueueStartupBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__SCWStartupQueue_enqueueStartupBlock___block_invoke_2;
  v7[3] = &unk_1E5FA3A68;
  uint64_t v4 = *(void *)(a1 + 40);
  void v7[4] = *(void *)(a1 + 32);
  id v8 = v3;
  v5 = *(void (**)(uint64_t, void *))(v4 + 16);
  id v6 = v3;
  v5(v4, v7);
}

uint64_t __39__SCWStartupQueue_enqueueStartupBlock___block_invoke_2(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  --*(void *)(*(void *)(a1 + 32) + 24);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

- (SCWStartupQueue)initWithDeferredStartup:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SCWStartupQueue;
  uint64_t v4 = [(SCWStartupQueue *)&v9 init];
  if (v4)
  {
    v5 = [[SCWAsyncSerialQueue alloc] initWithQualityOfService:25];
    startupTaskQueue = v4->_startupTaskQueue;
    v4->_startupTaskQueue = v5;

    v4->_startupTaskDepthLock._os_unfair_lock_opaque = 0;
    v7 = [(SCWStartupQueue *)v4 startupTaskQueue];
    [v7 setSuspended:v3];
  }
  return v4;
}

- (void)setStartupTaskQueue:(id)a3
{
}

- (int64_t)startupTaskDepth
{
  return self->_startupTaskDepth;
}

- (void)setStartupTaskDepth:(int64_t)a3
{
  self->_int64_t startupTaskDepth = a3;
}

- (os_unfair_lock_s)startupTaskDepthLock
{
  return self->_startupTaskDepthLock;
}

- (void)setStartupTaskDepthLock:(os_unfair_lock_s)a3
{
  self->_startupTaskDepthLock = a3;
}

- (void).cxx_destruct
{
}

@end