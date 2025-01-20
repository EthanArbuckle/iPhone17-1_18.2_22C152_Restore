@interface ISObservable
- (BOOL)hasObservers;
- (BOOL)isPerformingChanges;
- (ISObservable)init;
- (unint64_t)currentChanges;
- (void)_applyPendingChanges;
- (void)_didChange;
- (void)_observersQueue_copyChangeObserversForWriteIfNeeded;
- (void)_publishChanges;
- (void)_setHasObservers:(BOOL)a3;
- (void)_willChange;
- (void)enumerateObserversUsingBlock:(id)a3;
- (void)performChanges:(id)a3;
- (void)registerChangeObserver:(id)a3 context:(void *)a4;
- (void)signalChange:(unint64_t)a3;
- (void)unregisterChangeObserver:(id)a3 context:(void *)a4;
@end

@implementation ISObservable

- (void)registerChangeObserver:(id)a3 context:(void *)a4
{
  id v6 = a3;
  observersQueue = self->_observersQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__ISObservable_registerChangeObserver_context___block_invoke;
  block[3] = &unk_1E6BECAE8;
  block[4] = self;
  id v10 = v6;
  v11 = a4;
  id v8 = v6;
  dispatch_sync(observersQueue, block);
  if (v8) {
    [(ISObservable *)self _setHasObservers:1];
  }
}

- (void)_setHasObservers:(BOOL)a3
{
  if (self->_hasObservers != a3)
  {
    self->_hasObservers = a3;
    [(ISObservable *)self hasObserversDidChange];
  }
}

- (void)unregisterChangeObserver:(id)a3 context:(void *)a4
{
  id v6 = a3;
  observersQueue = self->_observersQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__ISObservable_unregisterChangeObserver_context___block_invoke;
  block[3] = &unk_1E6BECAE8;
  block[4] = self;
  id v10 = v6;
  v11 = a4;
  id v8 = v6;
  dispatch_sync(observersQueue, block);
}

void __49__ISObservable_unregisterChangeObserver_context___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_observersQueue_copyChangeObserversForWriteIfNeeded");
  id v5 = [*(id *)(*(void *)(a1 + 32) + 72) objectForKey:*(void *)(a1 + 40)];
  uint64_t v2 = [v5 count];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = 0;
    while ([v5 pointerAtIndex:v4] != *(void *)(a1 + 48))
    {
      if (v3 == ++v4) {
        goto LABEL_7;
      }
    }
    [v5 removePointerAtIndex:v4];
  }
LABEL_7:
  if (v5 && ![v5 count]) {
    [*(id *)(*(void *)(a1 + 32) + 72) removeObjectForKey:*(void *)(a1 + 40)];
  }
}

void __47__ISObservable_registerChangeObserver_context___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_observersQueue_copyChangeObserversForWriteIfNeeded");
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 72) objectForKey:*(void *)(a1 + 40)];
  if (v2)
  {
    id v12 = v2;
    uint64_t v6 = [v2 count];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = 0;
      v9 = v12;
      while (1)
      {
        uint64_t v10 = [v9 pointerAtIndex:v8];
        uint64_t v11 = *(void *)(a1 + 48);
        if (v10 == v11) {
          break;
        }
        ++v8;
        v9 = v12;
        if (v7 == v8) {
          goto LABEL_14;
        }
      }
    }
    else
    {
      uint64_t v11 = *(void *)(a1 + 48);
LABEL_14:
      [v12 addPointer:v11];
    }
  }
  else
  {
    if (!*(void *)(*(void *)(a1 + 32) + 72))
    {
      uint64_t v3 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
      uint64_t v4 = *(void *)(a1 + 32);
      id v5 = *(void **)(v4 + 72);
      *(void *)(v4 + 72) = v3;
    }
    id v12 = (id)[objc_alloc(MEMORY[0x1E4F28F50]) initWithOptions:256];
    [v12 addPointer:*(void *)(a1 + 48)];
    [*(id *)(*(void *)(a1 + 32) + 72) setObject:v12 forKey:*(void *)(a1 + 40)];
  }
}

- (ISObservable)init
{
  v8.receiver = self;
  v8.super_class = (Class)ISObservable;
  uint64_t v2 = [(ISObservable *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.photosplayer.observable.internal-queue", 0);
    observersQueue = v2->_observersQueue;
    v2->_observersQueue = (OS_dispatch_queue *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.photosplayer.observable.pending-change-queue", 0);
    pendingChangesQueue = v2->_pendingChangesQueue;
    v2->_pendingChangesQueue = (OS_dispatch_queue *)v5;

    v2->_currentChange = 0;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observersQueue_changeObserversWithContexts, 0);
  objc_storeStrong((id *)&self->_pendingChangesQueue, 0);
  objc_storeStrong((id *)&self->_observersQueue, 0);

  objc_storeStrong((id *)&self->_pendingChangesQueue_pendingChangeBlocks, 0);
}

- (void)performChanges:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = (void (**)(void, void))v4;
  if (self->_isEnumeratingObservers)
  {
    pendingChangesQueue = self->_pendingChangesQueue;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __31__ISObservable_performChanges___block_invoke;
    v8[3] = &unk_1E6BECA80;
    v8[4] = self;
    id v9 = v4;
    dispatch_async(pendingChangesQueue, v8);
  }
  else
  {
    [(ISObservable *)self _willChange];
    uint64_t v7 = [(ISObservable *)self mutableChangeObject];
    ((void (**)(void, void *))v5)[2](v5, v7);

    [(ISObservable *)self _didChange];
  }
}

- (BOOL)hasObservers
{
  return self->_hasObservers;
}

- (void)_observersQueue_copyChangeObserversForWriteIfNeeded
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (self->_observersQueue_shouldCopyChangeObserversOnWrite)
  {
    dispatch_queue_t v3 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v4 = [(NSMapTable *)self->_observersQueue_changeObserversWithContexts keyEnumerator];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
          uint64_t v10 = [(NSMapTable *)self->_observersQueue_changeObserversWithContexts objectForKey:v9];
          uint64_t v11 = (void *)[v10 copy];

          [(NSMapTable *)v3 setObject:v11 forKey:v9];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v6);
    }

    observersQueue_changeObserversWithContexts = self->_observersQueue_changeObserversWithContexts;
    self->_observersQueue_changeObserversWithContexts = v3;

    self->_observersQueue_shouldCopyChangeObserversOnWrite = 0;
  }
}

- (void)_applyPendingChanges
{
  int64_t numAppliedPendingChanges = self->_numAppliedPendingChanges;
  self->_int64_t numAppliedPendingChanges = numAppliedPendingChanges + 1;
  if (numAppliedPendingChanges >= 39)
  {
    id v4 = ISGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB21E000, v4, OS_LOG_TYPE_DEFAULT, "Change depth limit almost reached", buf, 2u);
    }
  }
  *(void *)buf = 0;
  uint64_t v9 = buf;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy_;
  id v12 = __Block_byref_object_dispose_;
  id v13 = 0;
  pendingChangesQueue = self->_pendingChangesQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__ISObservable__applyPendingChanges__block_invoke;
  block[3] = &unk_1E6BED060;
  block[4] = self;
  void block[5] = buf;
  dispatch_sync(pendingChangesQueue, block);
  if (*((void *)v9 + 5))
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __36__ISObservable__applyPendingChanges__block_invoke_2;
    v6[3] = &unk_1E6BEC8A8;
    v6[4] = buf;
    [(ISObservable *)self performChanges:v6];
  }
  --self->_numAppliedPendingChanges;
  _Block_object_dispose(buf, 8);
}

void __36__ISObservable__applyPendingChanges__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 16));
  uint64_t v2 = *(void *)(a1 + 32);
  dispatch_queue_t v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;
}

void __36__ISObservable__applyPendingChanges__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v9 + 1) + 8 * v8) + 16))(*(void *)(*((void *)&v9 + 1) + 8 * v8));
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_publishChanges
{
  unint64_t currentChange = self->_currentChange;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __31__ISObservable__publishChanges__block_invoke;
  v3[3] = &unk_1E6BEC880;
  v3[4] = self;
  v3[5] = currentChange;
  [(ISObservable *)self enumerateObserversUsingBlock:v3];
}

uint64_t __31__ISObservable__publishChanges__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 observable:*(void *)(a1 + 32) didChange:*(void *)(a1 + 40) context:a3];
}

- (void)_didChange
{
  int64_t nestedChanges = self->_nestedChanges;
  if (nestedChanges == 1)
  {
    [(ISObservable *)self didPerformChanges];
    int64_t nestedChanges = self->_nestedChanges;
  }
  int64_t v4 = nestedChanges - 1;
  self->_int64_t nestedChanges = v4;
  if (!v4)
  {
    if (self->_currentChange)
    {
      [(ISObservable *)self _publishChanges];
      [(ISObservable *)self didPublishChanges];
      self->_unint64_t currentChange = 0;
    }
    [(ISObservable *)self _applyPendingChanges];
  }
}

- (void)_willChange
{
  int64_t nestedChanges = self->_nestedChanges;
  if (!nestedChanges)
  {
    [(ISObservable *)self willPerformChanges];
    int64_t nestedChanges = self->_nestedChanges;
  }
  self->_int64_t nestedChanges = nestedChanges + 1;
}

- (void)enumerateObserversUsingBlock:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  int64_t v4 = (void (**)(id, uint64_t, uint64_t, char *))a3;
  BOOL isEnumeratingObservers = self->_isEnumeratingObservers;
  self->_BOOL isEnumeratingObservers = 1;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy_;
  v29 = __Block_byref_object_dispose_;
  id v30 = 0;
  observersQueue = self->_observersQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__ISObservable_enumerateObserversUsingBlock___block_invoke;
  block[3] = &unk_1E6BED060;
  block[4] = self;
  void block[5] = &v25;
  dispatch_sync(observersQueue, block);
  char v23 = 0;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v6 = [(id)v26[5] keyEnumerator];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v31 count:16];
  uint64_t v8 = v7;
  if (v7)
  {
    uint64_t v9 = *(void *)v20;
    uint64_t v16 = v7;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v20 != v9) {
        objc_enumerationMutation(v6);
      }
      uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8 * v10);
      long long v12 = [(id)v26[5] objectForKey:v11];
      unint64_t v13 = 0;
      while (v13 < [v12 count])
      {
        v4[2](v4, v11, [v12 pointerAtIndex:v13++], &v23);
        if (v23)
        {

          goto LABEL_13;
        }
      }
      BOOL v14 = v23 == 0;

      if (!v14) {
        break;
      }
      if (++v10 == v16)
      {
        uint64_t v16 = [v6 countByEnumeratingWithState:&v19 objects:v31 count:16];
        if (v16) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
LABEL_13:

  long long v15 = self->_observersQueue;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __45__ISObservable_enumerateObserversUsingBlock___block_invoke_2;
  v18[3] = &unk_1E6BECD80;
  v18[4] = self;
  dispatch_sync(v15, v18);
  self->_BOOL isEnumeratingObservers = isEnumeratingObservers;
  [(ISObservable *)self _setHasObservers:v8 != 0];
  _Block_object_dispose(&v25, 8);
}

void __45__ISObservable_enumerateObserversUsingBlock___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 64) = 1;
}

uint64_t __45__ISObservable_enumerateObserversUsingBlock___block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 64) = 0;
  return result;
}

- (BOOL)isPerformingChanges
{
  return self->_nestedChanges > 0;
}

- (unint64_t)currentChanges
{
  return self->_currentChange;
}

- (void)signalChange:(unint64_t)a3
{
  self->_currentChange |= a3;
}

void __31__ISObservable_performChanges___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16);
  if (v2)
  {
    id v7 = (id)[*(id *)(a1 + 40) copy];
    objc_msgSend(v2, "addObject:");
  }
  else
  {
    id v3 = (void *)MEMORY[0x1E4F1CA48];
    id v7 = (id)[*(id *)(a1 + 40) copy];
    uint64_t v4 = objc_msgSend(v3, "arrayWithObject:");
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void **)(v5 + 16);
    *(void *)(v5 + 16) = v4;
  }
}

@end