@interface _UIAsyncInvocationObserver
+ (void)whenInvocationsCompleteForObservers:(id)a3 do:(id)a4;
- (_UIAsyncInvocationObserver)init;
- (void)_didCompleteInvocation;
- (void)whenCompleteDo:(id)a3;
@end

@implementation _UIAsyncInvocationObserver

- (_UIAsyncInvocationObserver)init
{
  v8.receiver = self;
  v8.super_class = (Class)_UIAsyncInvocationObserver;
  v2 = [(_UIAsyncInvocationObserver *)&v8 init];
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_suspendedPostCompletionQueue = 0;
    dispatch_queue_t v4 = dispatch_queue_create("Async Observer Queue Management", 0);
    completionQueueManagementQueue = v3->_completionQueueManagementQueue;
    v3->_completionQueueManagementQueue = (OS_dispatch_queue *)v4;

    v6 = v3;
  }

  return v3;
}

- (void)_didCompleteInvocation
{
  completionQueueManagementQueue = self->_completionQueueManagementQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52___UIAsyncInvocationObserver__didCompleteInvocation__block_invoke;
  block[3] = &unk_1E52D9F70;
  block[4] = self;
  dispatch_sync(completionQueueManagementQueue, block);
}

- (void)whenCompleteDo:(id)a3
{
  id v4 = a3;
  completionQueueManagementQueue = self->_completionQueueManagementQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45___UIAsyncInvocationObserver_whenCompleteDo___block_invoke;
  v7[3] = &unk_1E52DA160;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(completionQueueManagementQueue, v7);
}

+ (void)whenInvocationsCompleteForObservers:(id)a3 do:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v25;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v24 + 1) + 8 * v12);
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __69___UIAsyncInvocationObserver_whenInvocationsCompleteForObservers_do___block_invoke;
        v22[3] = &unk_1E52D9F70;
        v23 = v7;
        [v13 whenCompleteDo:v22];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v10);
  }

  v14 = dispatch_get_global_queue(0, 0);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __69___UIAsyncInvocationObserver_whenInvocationsCompleteForObservers_do___block_invoke_2;
  v18[3] = &unk_1E52E3298;
  id v19 = v8;
  dispatch_semaphore_t v20 = v7;
  id v21 = v6;
  id v15 = v6;
  v16 = v7;
  id v17 = v8;
  dispatch_async(v14, v18);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionQueueManagementQueue, 0);
  objc_storeStrong((id *)&self->_postCompletionQueue, 0);
}

@end