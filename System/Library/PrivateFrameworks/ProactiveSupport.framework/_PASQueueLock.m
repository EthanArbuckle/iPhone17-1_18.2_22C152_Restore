@interface _PASQueueLock
- (_PASQueueLock)initWithGuardedData:(id)a3 serialQueue:(id)a4;
- (id)guardedDataAssertingLockContext;
- (id)unsafeGuardedData;
- (unsigned)runWithLockAcquired:(id)a3 shouldContinueBlock:(id)a4;
- (void)runAsyncWithLockAcquired:(id)a3;
- (void)runWithLockAcquired:(id)a3;
@end

@implementation _PASQueueLock

- (void)runAsyncWithLockAcquired:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42___PASQueueLock_runAsyncWithLockAcquired___block_invoke;
  v7[3] = &unk_1E5AEB430;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_guardedData, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (id)guardedDataAssertingLockContext
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);

  return [(_PASQueueLock *)self unsafeGuardedData];
}

- (id)unsafeGuardedData
{
  return self->_guardedData;
}

- (unsigned)runWithLockAcquired:(id)a3 shouldContinueBlock:(id)a4
{
  id v6 = a3;
  v7 = (uint64_t (**)(void))a4;
  uint64_t v21 = 0;
  v22 = (atomic_uchar *)&v21;
  uint64_t v23 = 0x2810000000;
  v24 = "";
  char v25 = 0;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__3030;
  v19 = __Block_byref_object_dispose__3031;
  id v20 = (id)MEMORY[0x1A6245320](v6);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __57___PASQueueLock_runWithLockAcquired_shouldContinueBlock___block_invoke;
  v14[3] = &unk_1E5AEB458;
  v14[5] = &v21;
  v14[6] = &v15;
  v14[4] = self;
  dispatch_block_t v8 = dispatch_block_create((dispatch_block_flags_t)0, v14);
  dispatch_async((dispatch_queue_t)self->_queue, v8);
  while (1)
  {
    v9 = (void *)MEMORY[0x1A62450A0]();
    int v10 = v7[2](v7);
    if (!v10) {
      break;
    }
    if (!dispatch_block_wait(v8, +[_PASDispatch dispatchTimeWithSecondsFromNow:1.0]))goto LABEL_8; {
  }
    }
  if ((atomic_exchange(v22 + 32, 1u) & 1) == 0)
  {
    v11 = (void *)v16[5];
    v16[5] = 0;

    unsigned __int8 v12 = 1;
    goto LABEL_9;
  }
  dispatch_block_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
LABEL_8:
  unsigned __int8 v12 = 0;
LABEL_9:

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v12;
}

- (void)runWithLockAcquired:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37___PASQueueLock_runWithLockAcquired___block_invoke;
  v7[3] = &unk_1E5AEB430;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (_PASQueueLock)initWithGuardedData:(id)a3 serialQueue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_PASQueueLock;
  v9 = [(_PASQueueLock *)&v15 init];
  int v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a4);
    objc_storeStrong(&v10->_guardedData, a3);
    queue = v10->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49___PASQueueLock_initWithGuardedData_serialQueue___block_invoke;
    block[3] = &unk_1E5AEBE98;
    v14 = v10;
    dispatch_sync(queue, block);
  }
  return v10;
}

@end