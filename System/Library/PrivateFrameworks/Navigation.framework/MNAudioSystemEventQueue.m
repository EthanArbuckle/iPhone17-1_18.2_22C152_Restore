@interface MNAudioSystemEventQueue
- (BOOL)empty;
- (BOOL)enqueue:(id)a3 withOptions:(unint64_t)a4 andReport:(id *)a5;
- (BOOL)full;
- (MNAudioEventQueueDelegate)delegate;
- (MNAudioSystemEventQueue)initWithCapacity:(unint64_t)a3;
- (id)_dequeue;
- (id)dequeue;
- (unint64_t)capacity;
- (unint64_t)count;
- (void)_enqueue:(id)a3;
- (void)_removeEventsMatching:(id)a3;
- (void)clear;
- (void)setDelegate:(id)a3;
@end

@implementation MNAudioSystemEventQueue

- (MNAudioSystemEventQueue)initWithCapacity:(unint64_t)a3
{
  syncQueue = self;
  if (!a3)
  {
    v10 = GetAudioLogForMNAudioSystemEventQueueCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B542B000, v10, OS_LOG_TYPE_ERROR, "⒬ Trying to create a queue with a capacity of 0", buf, 2u);
    }

    v6 = 0;
    goto LABEL_7;
  }
  v12.receiver = self;
  v12.super_class = (Class)MNAudioSystemEventQueue;
  v5 = [(MNAudioSystemEventQueue *)&v12 init];
  v6 = v5;
  if (v5)
  {
    v5->_capacity = a3;
    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v5->_capacity];
    container = v6->_container;
    v6->_container = (NSMutableArray *)v7;

    uint64_t v9 = geo_dispatch_queue_create();
    syncQueue = (MNAudioSystemEventQueue *)v6->_syncQueue;
    v6->_syncQueue = (OS_dispatch_queue *)v9;
LABEL_7:
  }
  return v6;
}

- (unint64_t)capacity
{
  return self->_capacity;
}

- (unint64_t)count
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  syncQueue = self->_syncQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __32__MNAudioSystemEventQueue_count__block_invoke;
  v5[3] = &unk_1E60F6A78;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(syncQueue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __32__MNAudioSystemEventQueue_count__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 8) count];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)empty
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  syncQueue = self->_syncQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __32__MNAudioSystemEventQueue_empty__block_invoke;
  v5[3] = &unk_1E60F6A78;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(syncQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __32__MNAudioSystemEventQueue_empty__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 8) count];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result == 0;
  return result;
}

- (BOOL)full
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  syncQueue = self->_syncQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __31__MNAudioSystemEventQueue_full__block_invoke;
  v5[3] = &unk_1E60F6A78;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(syncQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __31__MNAudioSystemEventQueue_full__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 8) count];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result == *(void *)(*(void *)(a1 + 32) + 16);
  return result;
}

- (BOOL)enqueue:(id)a3 withOptions:(unint64_t)a4 andReport:(id *)a5
{
  char v6 = a4;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if ([(MNAudioSystemEventQueue *)self full])
  {
    char v9 = GetAudioLogForMNAudioSystemEventQueueCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B542B000, v9, OS_LOG_TYPE_ERROR, "⒬ Trying to enqueue to a full queue", buf, 2u);
    }

    if (!a5) {
      goto LABEL_22;
    }
    v10 = (void *)MEMORY[0x1E4F28C58];
    v11 = NAVAudioErrorDomain();
    objc_super v12 = v10;
    v13 = v11;
    uint64_t v14 = 2000;
LABEL_21:
    *a5 = [v12 errorWithDomain:v13 code:v14 userInfo:0];

LABEL_22:
    BOOL v20 = 0;
    goto LABEL_23;
  }
  if (!v8)
  {
    v16 = GetAudioLogForMNAudioSystemEventQueueCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B542B000, v16, OS_LOG_TYPE_ERROR, "⒬ Trying to enqueue a nil event", buf, 2u);
    }

    if (!a5) {
      goto LABEL_22;
    }
    v17 = (void *)MEMORY[0x1E4F28C58];
    v11 = NAVAudioErrorDomain();
    objc_super v12 = v17;
    v13 = v11;
    uint64_t v14 = 2001;
    goto LABEL_21;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v18 = GetAudioLogForMNAudioSystemEventQueueCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      id v32 = v8;
      _os_log_impl(&dword_1B542B000, v18, OS_LOG_TYPE_ERROR, "⒬ Trying to enqueue a non-MNAudioSystemEvent object : %{private}@", buf, 0xCu);
    }

    if (!a5) {
      goto LABEL_22;
    }
    v19 = (void *)MEMORY[0x1E4F28C58];
    v11 = NAVAudioErrorDomain();
    objc_super v12 = v19;
    v13 = v11;
    uint64_t v14 = 2002;
    goto LABEL_21;
  }
  if ((v6 & 4) != 0)
  {
    v22 = GetAudioLogForMNAudioSystemEventQueueCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138477827;
      id v32 = v8;
      _os_log_impl(&dword_1B542B000, v22, OS_LOG_TYPE_INFO, "ⓠ Event will clear the queue before enqueuing : %{private}@", buf, 0xCu);
    }

    [(MNAudioSystemEventQueue *)self clear];
  }
  else if ((v6 & 8) != 0)
  {
    v15 = GetAudioLogForMNAudioSystemEventQueueCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138477827;
      id v32 = v8;
      _os_log_impl(&dword_1B542B000, v15, OS_LOG_TYPE_INFO, "ⓠ Event will remove duplicates before enqueuing : %{private}@", buf, 0xCu);
    }

    [(MNAudioSystemEventQueue *)self _removeEventsMatching:v8];
  }
  if ((v6 & 3) != 0)
  {
    v23 = GetAudioLogForMNAudioSystemEventQueueCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138477827;
      id v32 = v8;
      _os_log_impl(&dword_1B542B000, v23, OS_LOG_TYPE_INFO, "ⓠ Event is enqueued as an interrupt : %{private}@", buf, 0xCu);
    }

    v24 = [(MNAudioSystemEventQueue *)self delegate];
    char v25 = objc_opt_respondsToSelector();

    if (v25)
    {
      v26 = [(MNAudioSystemEventQueue *)self delegate];
      [v26 audioSystemEventQueue:self eventWillInterrupt:v8];
    }
  }
  if (v6)
  {
    v27 = GetAudioLogForMNAudioSystemEventQueueCategory();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138477827;
      id v32 = v8;
      _os_log_impl(&dword_1B542B000, v27, OS_LOG_TYPE_INFO, "ⓠ Enqueued event will be processed next : %{private}@", buf, 0xCu);
    }

    syncQueue = self->_syncQueue;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __57__MNAudioSystemEventQueue_enqueue_withOptions_andReport___block_invoke;
    v29[3] = &unk_1E60F6668;
    v29[4] = self;
    id v30 = v8;
    dispatch_async(syncQueue, v29);
  }
  else
  {
    [(MNAudioSystemEventQueue *)self _enqueue:v8];
  }
  BOOL v20 = 1;
LABEL_23:

  return v20;
}

uint64_t __57__MNAudioSystemEventQueue_enqueue_withOptions_andReport___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) insertObject:*(void *)(a1 + 40) atIndex:0];
}

- (void)_removeEventsMatching:(id)a3
{
  id v4 = a3;
  syncQueue = self->_syncQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__MNAudioSystemEventQueue__removeEventsMatching___block_invoke;
  v7[3] = &unk_1E60F6668;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(syncQueue, v7);
}

void __49__MNAudioSystemEventQueue__removeEventsMatching___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__MNAudioSystemEventQueue__removeEventsMatching___block_invoke_2;
  v7[3] = &unk_1E60FAFD0;
  id v8 = *(id *)(a1 + 40);
  char v3 = [v2 indexesOfObjectsPassingTest:v7];
  if ([v3 count])
  {
    id v4 = GetAudioLogForMNAudioSystemEventQueueCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = [v3 count];
      uint64_t v6 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 134218243;
      uint64_t v10 = v5;
      __int16 v11 = 2113;
      uint64_t v12 = v6;
      _os_log_impl(&dword_1B542B000, v4, OS_LOG_TYPE_INFO, "ⓠ Removed %lu events matching event : %{private}@", buf, 0x16u);
    }

    [*(id *)(*(void *)(a1 + 32) + 8) removeObjectsAtIndexes:v3];
  }
}

uint64_t __49__MNAudioSystemEventQueue__removeEventsMatching___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) isEqualToEvent:a2];
}

- (id)dequeue
{
  if ([(MNAudioSystemEventQueue *)self empty])
  {
    char v3 = GetAudioLogForMNAudioSystemEventQueueCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_1B542B000, v3, OS_LOG_TYPE_ERROR, "⒬ Trying to dequeue from an empty queue", v6, 2u);
    }

    id v4 = 0;
  }
  else
  {
    id v4 = [(MNAudioSystemEventQueue *)self _dequeue];
  }
  return v4;
}

- (void)clear
{
  char v3 = GetAudioLogForMNAudioSystemEventQueueCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B542B000, v3, OS_LOG_TYPE_INFO, "ⓠ Clearing the queue", buf, 2u);
  }

  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__MNAudioSystemEventQueue_clear__block_invoke;
  block[3] = &unk_1E60F6B98;
  block[4] = self;
  dispatch_async(syncQueue, block);
}

uint64_t __32__MNAudioSystemEventQueue_clear__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) removeAllObjects];
}

- (void)_enqueue:(id)a3
{
  id v4 = a3;
  syncQueue = self->_syncQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__MNAudioSystemEventQueue__enqueue___block_invoke;
  v7[3] = &unk_1E60F6668;
  id v8 = v4;
  char v9 = self;
  id v6 = v4;
  dispatch_async(syncQueue, v7);
}

uint64_t __36__MNAudioSystemEventQueue__enqueue___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = GetAudioLogForMNAudioSystemEventQueueCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138477827;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1B542B000, v2, OS_LOG_TYPE_INFO, "ⓠ Enqueuing event : %{private}@", (uint8_t *)&v5, 0xCu);
  }

  return [*(id *)(*(void *)(a1 + 40) + 8) addObject:*(void *)(a1 + 32)];
}

- (id)_dequeue
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__12;
  uint64_t v10 = __Block_byref_object_dispose__12;
  id v11 = 0;
  syncQueue = self->_syncQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__MNAudioSystemEventQueue__dequeue__block_invoke;
  v5[3] = &unk_1E60F6488;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(syncQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __35__MNAudioSystemEventQueue__dequeue__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(*(void *)(a1 + 32) + 8) count])
  {
    uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) firstObject];
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;

    int v5 = GetAudioLogForMNAudioSystemEventQueueCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      int v8 = 138477827;
      uint64_t v9 = v6;
      _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_INFO, "ⓠ Dequeued event : %{private}@", (uint8_t *)&v8, 0xCu);
    }

    [*(id *)(*(void *)(a1 + 32) + 8) removeObjectAtIndex:0];
  }
  else
  {
    uint64_t v7 = GetAudioLogForMNAudioSystemEventQueueCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_ERROR, "ⓠ Attempting to dequeue event, but events container is already empty.", (uint8_t *)&v8, 2u);
    }
  }
}

- (MNAudioEventQueueDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MNAudioEventQueueDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_syncQueue, 0);
  objc_storeStrong((id *)&self->_container, 0);
}

@end