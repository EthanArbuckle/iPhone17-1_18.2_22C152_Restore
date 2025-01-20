@interface _UIAfterCACommitQueue
- (BOOL)flush;
- (_UIAfterCACommitQueue)init;
- (void)_enqueueCommitResponse:(uint64_t)a3 forPhase:;
- (void)enqueuePostCommitBlock:(id)a3;
- (void)enqueuePostSynchronizeBlock:(id)a3;
@end

@implementation _UIAfterCACommitQueue

- (BOOL)flush
{
  if (pthread_main_np() != 1)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"_UIAfterCACommitQueue.m" lineNumber:212 description:@"Call must be made on main thread"];
  }
  p_first = &self->_first;
  v5 = self->_first;
  while (*p_first)
  {
    int v6 = 1;
    atomic_compare_exchange_strong_explicit((atomic_uchar *volatile)&(*p_first)->_transactionCleared, (unsigned __int8 *)&v6, v6, memory_order_relaxed, memory_order_relaxed);
    first = *p_first;
    if (v6 != 1)
    {
      if (first) {
        goto LABEL_9;
      }
      break;
    }
    objc_storeStrong((id *)&self->_first, first->_next);
  }
  last = self->_last;
  self->_last = 0;

  first = self->_first;
LABEL_9:
  v9 = first;
  if (v5 == v9)
  {
    LOBYTE(v10) = 0;
  }
  else
  {
    int v10 = 0;
    do
    {
      v11 = v5->_next;
      v10 |= [(_UIAfterCACommitBlock *)v5 run];
      next = v5->_next;
      v5->_next = 0;

      v5 = v11;
    }
    while (v11 != v9);
    v5 = v9;
  }

  return v10 & 1;
}

- (void)enqueuePostCommitBlock:(id)a3
{
}

- (void)_enqueueCommitResponse:(uint64_t)a3 forPhase:
{
  if (a1)
  {
    id v5 = a2;
    if (pthread_main_np() != 1)
    {
      v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:sel__enqueueCommitResponse_forPhase_ object:a1 file:@"_UIAfterCACommitQueue.m" lineNumber:188 description:@"Call must be made on main thread"];
    }
    int v6 = -[_UIAfterCACommitBlock _initWithBlock:]((unsigned __int8 *)[_UIAfterCACommitBlock alloc], v5);

    v8 = (id *)(a1 + 16);
    uint64_t v7 = *(void *)(a1 + 16);
    if (v7)
    {
      v9 = (id *)(v7 + 8);
    }
    else
    {
      if (*(void *)(a1 + 8))
      {
        v15 = [MEMORY[0x1E4F28B00] currentHandler];
        [v15 handleFailureInMethod:sel__enqueueCommitResponse_forPhase_ object:a1 file:@"_UIAfterCACommitQueue.m" lineNumber:195 description:@"if there's no _last then there can't be a _first either"];
      }
      v9 = (id *)(a1 + 16);
      v8 = (id *)(a1 + 8);
    }
    objc_storeStrong(v9, v6);
    objc_storeStrong(v8, v6);
    [MEMORY[0x1E4F39CF8] activate];
    int v10 = (void *)MEMORY[0x1E4F39CF8];
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    v18 = __57___UIAfterCACommitQueue__enqueueCommitResponse_forPhase___block_invoke;
    v19 = &unk_1E52D9F98;
    v11 = v6;
    v20 = v11;
    uint64_t v21 = a1;
    if (([v10 addCommitHandler:&v16 forPhase:a3] & 1) == 0)
    {
      v13 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v14 = [MEMORY[0x1E4F39CF8] currentPhase];
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", sel__enqueueCommitResponse_forPhase_, a1, @"_UIAfterCACommitQueue.m", 208, @"failed to register commit handler for phase = %i (current is %i)", a3, v14, v16, v17, v18, v19);
    }
  }
}

- (_UIAfterCACommitQueue)init
{
  v7.receiver = self;
  v7.super_class = (Class)_UIAfterCACommitQueue;
  v2 = [(_UIAfterCACommitQueue *)&v7 init];
  v3 = v2;
  if (v2)
  {
    first = v2->_first;
    v2->_first = 0;

    last = v3->_last;
    v3->_last = 0;
  }
  return v3;
}

- (void)enqueuePostSynchronizeBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_last, 0);
  objc_storeStrong((id *)&self->_first, 0);
}

@end