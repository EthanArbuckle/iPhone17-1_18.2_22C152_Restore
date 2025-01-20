@interface PLBoundedConcurrentQueue
- (PLBoundedConcurrentQueue)initWithName:(id)a3 concurrencyLimit:(unsigned __int8)a4;
- (void)async:(id)a3;
- (void)sync:(id)a3;
@end

@implementation PLBoundedConcurrentQueue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bound, 0);
  objc_storeStrong((id *)&self->_submissionQueue, 0);
  objc_storeStrong((id *)&self->_concurrentQueue, 0);
}

- (void)async:(id)a3
{
  id v4 = a3;
  submissionQueue = self->_submissionQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __34__PLBoundedConcurrentQueue_async___block_invoke;
  v7[3] = &unk_1E58742F0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(submissionQueue, v7);
}

void __34__PLBoundedConcurrentQueue_async___block_invoke(uint64_t a1)
{
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 24), 0xFFFFFFFFFFFFFFFFLL);
  v2 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __34__PLBoundedConcurrentQueue_async___block_invoke_2;
  v4[3] = &unk_1E58742F0;
  id v3 = *(id *)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  dispatch_async(v2, v4);
}

intptr_t __34__PLBoundedConcurrentQueue_async___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  return dispatch_semaphore_signal(v2);
}

- (void)sync:(id)a3
{
  id v4 = (void (**)(void))a3;
  concurrentQueue = self->_concurrentQueue;
  if (dispatch_queue_get_specific(concurrentQueue, (const void *)PLBoundedConcurrentQueueContext) == concurrentQueue)
  {
    v4[2](v4);
  }
  else
  {
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_bound, 0xFFFFFFFFFFFFFFFFLL);
    id v6 = self->_concurrentQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __33__PLBoundedConcurrentQueue_sync___block_invoke;
    v7[3] = &unk_1E58742F0;
    v7[4] = self;
    id v8 = v4;
    dispatch_async_and_wait(v6, v7);
  }
}

intptr_t __33__PLBoundedConcurrentQueue_sync___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  return dispatch_semaphore_signal(v2);
}

- (PLBoundedConcurrentQueue)initWithName:(id)a3 concurrencyLimit:(unsigned __int8)a4
{
  unsigned int v4 = a4;
  id v7 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PLBoundedConcurrentQueue;
  id v8 = [(PLBoundedConcurrentQueue *)&v21 init];
  if (v8)
  {
    if (v4 <= 1)
    {
      v20 = [MEMORY[0x1E4F28B00] currentHandler];
      [v20 handleFailureInMethod:a2 object:v8 file:@"PLBoundedConcurrentQueue.m" lineNumber:25 description:@"Use a serial queue"];
    }
    id v9 = v7;
    v10 = (const char *)[v9 cStringUsingEncoding:4];
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E4F14430], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create(v10, v11);
    v13 = (void *)*((void *)v8 + 1);
    *((void *)v8 + 1) = v12;

    dispatch_queue_set_specific(*((dispatch_queue_t *)v8 + 1), (const void *)PLBoundedConcurrentQueueContext, *((void **)v8 + 1), 0);
    id v14 = [NSString stringWithFormat:@"%@ serial submission queue", v9];
    dispatch_queue_t v15 = dispatch_queue_create((const char *)[v14 cStringUsingEncoding:4], 0);
    v16 = (void *)*((void *)v8 + 2);
    *((void *)v8 + 2) = v15;

    dispatch_semaphore_t v17 = dispatch_semaphore_create(v4);
    v18 = (void *)*((void *)v8 + 3);
    *((void *)v8 + 3) = v17;
  }
  return (PLBoundedConcurrentQueue *)v8;
}

@end