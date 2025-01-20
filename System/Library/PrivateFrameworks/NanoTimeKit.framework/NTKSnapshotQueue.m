@interface NTKSnapshotQueue
- (NTKSnapshotQueue)initWithRequestHandler:(id)a3;
- (id)_queue_pullHighestPriorityRequestFromQueue;
- (void)_queue_processQueue;
- (void)queueRequest:(id)a3;
@end

@implementation NTKSnapshotQueue

- (NTKSnapshotQueue)initWithRequestHandler:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NTKSnapshotQueue;
  v5 = [(NTKSnapshotQueue *)&v13 init];
  if (v5)
  {
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.NanoTimeKit.NTKSnapshotQueue", 0);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v6;

    uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
    queue_requests = v5->_queue_requests;
    v5->_queue_requests = (NSMutableArray *)v8;

    v5->_queue_isProcessingQueue = 0;
    v10 = _Block_copy(v4);
    id requestHandler = v5->_requestHandler;
    v5->_id requestHandler = v10;
  }
  return v5;
}

- (void)queueRequest:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__NTKSnapshotQueue_queueRequest___block_invoke;
  block[3] = &unk_1E62C1A18;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __33__NTKSnapshotQueue_queueRequest___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    [WeakRetained[2] addObject:*(void *)(a1 + 32)];
    objc_msgSend(v3, "_queue_processQueue");
    WeakRetained = v3;
  }
}

- (id)_queue_pullHighestPriorityRequestFromQueue
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  v11[3] = 0;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  if ([(NSMutableArray *)self->_queue_requests count])
  {
    queue_requests = self->_queue_requests;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __62__NTKSnapshotQueue__queue_pullHighestPriorityRequestFromQueue__block_invoke;
    v6[3] = &unk_1E62C6D60;
    v6[4] = v11;
    v6[5] = &v7;
    [(NSMutableArray *)queue_requests enumerateObjectsUsingBlock:v6];
    id v4 = [(NSMutableArray *)self->_queue_requests objectAtIndex:v8[3]];
    [(NSMutableArray *)self->_queue_requests removeObjectAtIndex:v8[3]];
  }
  else
  {
    id v4 = 0;
  }
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(v11, 8);
  return v4;
}

unint64_t __62__NTKSnapshotQueue__queue_pullHighestPriorityRequestFromQueue__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  unint64_t result = [a2 priority];
  if (result > *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  }
  if (result == 3) {
    *a4 = 1;
  }
  return result;
}

- (void)_queue_processQueue
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_queue_isProcessingQueue)
  {
    v3 = [(NTKSnapshotQueue *)self _queue_pullHighestPriorityRequestFromQueue];
    if (v3)
    {
      self->_queue_isProcessingQueue = 1;
      id v4 = self->_queue;
      objc_initWeak(&location, self);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __39__NTKSnapshotQueue__queue_processQueue__block_invoke;
      aBlock[3] = &unk_1E62C1A18;
      objc_copyWeak(&v17, &location);
      v5 = v4;
      v16 = v5;
      id v6 = _Block_copy(aBlock);
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __39__NTKSnapshotQueue__queue_processQueue__block_invoke_2;
      v10[3] = &unk_1E62C4A00;
      objc_copyWeak(&v14, &location);
      uint64_t v7 = v5;
      v11 = v7;
      id v12 = v3;
      id v8 = v6;
      id v13 = v8;
      uint64_t v9 = (void (**)(void))_Block_copy(v10);
      v9[2]();

      objc_destroyWeak(&v14);
      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
  }
}

void __39__NTKSnapshotQueue__queue_processQueue__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
    WeakRetained[24] = 0;
    objc_msgSend(WeakRetained, "_queue_processQueue");
  }
}

void __39__NTKSnapshotQueue__queue_processQueue__block_invoke_2(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
    uint64_t v3 = WeakRetained[4];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __39__NTKSnapshotQueue__queue_processQueue__block_invoke_3;
    v5[3] = &unk_1E62C2290;
    uint64_t v4 = *(void *)(a1 + 40);
    id v6 = *(id *)(a1 + 32);
    id v7 = *(id *)(a1 + 48);
    (*(void (**)(uint64_t, uint64_t, void *))(v3 + 16))(v3, v4, v5);
  }
}

void __39__NTKSnapshotQueue__queue_processQueue__block_invoke_3(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__NTKSnapshotQueue__queue_processQueue__block_invoke_4;
  block[3] = &unk_1E62C0718;
  v1 = *(NSObject **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  dispatch_async(v1, block);
}

uint64_t __39__NTKSnapshotQueue__queue_processQueue__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_requestHandler, 0);
  objc_storeStrong((id *)&self->_queue_requests, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end