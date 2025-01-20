@interface PXObservable
- (BOOL)hasObservers;
- (BOOL)isPerformingChanges;
- (BOOL)shouldNotifyObserversAfterApplyingChangeBlocks;
- (OS_os_log)log;
- (PXObservable)init;
- (unint64_t)currentChanges;
- (unint64_t)logContext;
- (void)_applyPendingChanges;
- (void)_didChange;
- (void)_observersQueue_copyChangeObserversForWriteIfNeeded;
- (void)_publishChanges;
- (void)_setHasObservers:(BOOL)a3;
- (void)_willChange;
- (void)copyLogConfigurationFrom:(id)a3;
- (void)enumerateObserversUsingBlock:(id)a3;
- (void)performChanges:(id)a3;
- (void)registerChangeObserver:(id)a3 context:(void *)a4;
- (void)setLog:(id)a3;
- (void)setLogContext:(unint64_t)a3;
- (void)signalChange:(unint64_t)a3;
- (void)unregisterChangeObserver:(id)a3 context:(void *)a4;
@end

@implementation PXObservable

uint64_t __45__PXObservable_enumerateObserversUsingBlock___block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 56) = 0;
  return result;
}

- (PXObservable)init
{
  v6.receiver = self;
  v6.super_class = (Class)PXObservable;
  v2 = [(PXObservable *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.photosuifoundation.observable.internal-queue", 0);
    observersQueue = v2->_observersQueue;
    v2->_observersQueue = (OS_dispatch_queue *)v3;

    v2->_currentChange = 0;
    [(PXObservable *)v2 setLog:0];
    v2->_logContext = (unint64_t)v2;
  }
  return v2;
}

- (void)setLog:(id)a3
{
  v4 = (OS_os_log *)a3;
  if (!v4)
  {
    v5 = (const char *)*MEMORY[0x263F5D540];
    objc_super v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    id v7 = objc_claimAutoreleasedReturnValue();
    v4 = (OS_os_log *)os_log_create(v5, (const char *)[v7 UTF8String]);
  }
  log = self->_log;
  self->_log = v4;
}

void __47__PXObservable_registerChangeObserver_context___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_observersQueue_copyChangeObserversForWriteIfNeeded");
  v2 = [*(id *)(*(void *)(a1 + 32) + 64) objectForKey:*(void *)(a1 + 40)];
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
    if (!*(void *)(*(void *)(a1 + 32) + 64))
    {
      uint64_t v3 = [MEMORY[0x263F08968] weakToStrongObjectsMapTable];
      uint64_t v4 = *(void *)(a1 + 32);
      v5 = *(void **)(v4 + 64);
      *(void *)(v4 + 64) = v3;
    }
    id v12 = (id)[objc_alloc(MEMORY[0x263F08A88]) initWithOptions:256];
    [v12 addPointer:*(void *)(a1 + 48)];
    [*(id *)(*(void *)(a1 + 32) + 64) setObject:v12 forKey:*(void *)(a1 + 40)];
  }
}

- (void)_observersQueue_copyChangeObserversForWriteIfNeeded
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (self->_observersQueue_shouldCopyChangeObserversOnWrite)
  {
    uint64_t v3 = [MEMORY[0x263F08968] weakToStrongObjectsMapTable];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v4 = [(NSMapTable *)self->_observersQueue_changeObserversWithContexts keyEnumerator];
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

- (void)enumerateObserversUsingBlock:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void (**)(id, uint64_t, uint64_t, char *))a3;
  BOOL isEnumeratingObservers = self->_isEnumeratingObservers;
  self->_BOOL isEnumeratingObservers = 1;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__3113;
  v29 = __Block_byref_object_dispose__3114;
  id v30 = 0;
  observersQueue = self->_observersQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__PXObservable_enumerateObserversUsingBlock___block_invoke;
  block[3] = &unk_26545A6E0;
  block[4] = self;
  block[5] = &v25;
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
      id v12 = [(id)v26[5] objectForKey:v11];
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
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __45__PXObservable_enumerateObserversUsingBlock___block_invoke_2;
  v18[3] = &unk_26545BC00;
  v18[4] = self;
  dispatch_sync(v15, v18);
  self->_BOOL isEnumeratingObservers = isEnumeratingObservers;
  [(PXObservable *)self _setHasObservers:v8 != 0];
  _Block_object_dispose(&v25, 8);
}

uint64_t __31__PXObservable__publishChanges__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 observable:*(void *)(a1 + 32) didChange:*(void *)(a1 + 40) context:a3];
}

- (void)registerChangeObserver:(id)a3 context:(void *)a4
{
  id v6 = a3;
  observersQueue = self->_observersQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__PXObservable_registerChangeObserver_context___block_invoke;
  block[3] = &unk_26545A6B8;
  block[4] = self;
  id v10 = v6;
  uint64_t v11 = a4;
  id v8 = v6;
  dispatch_sync(observersQueue, block);
  if (v8) {
    [(PXObservable *)self _setHasObservers:1];
  }
}

- (void)_setHasObservers:(BOOL)a3
{
  if (self->_hasObservers != a3)
  {
    self->_hasObservers = a3;
    [(PXObservable *)self hasObserversDidChange];
  }
}

- (BOOL)isPerformingChanges
{
  return self->_nestedChanges > 0;
}

void __45__PXObservable_enumerateObserversUsingBlock___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 56) = 1;
}

- (void)performChanges:(id)a3
{
  uint64_t v5 = (void (**)(id, void *))a3;
  BOOL v14 = v5;
  if (!v5)
  {
    unint64_t v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PXObservable.m", 52, @"Invalid parameter not satisfying: %@", @"changeBlock != nil" object file lineNumber description];

    uint64_t v5 = 0;
  }
  if (self->_isEnumeratingObservers)
  {
    pendingChangeBlocks = self->_pendingChangeBlocks;
    if (pendingChangeBlocks)
    {
      uint64_t v7 = (void *)[v5 copy];
      [(NSMutableArray *)pendingChangeBlocks addObject:v7];
    }
    else
    {
      uint64_t v9 = (void *)MEMORY[0x263EFF980];
      id v10 = (void *)[v5 copy];
      uint64_t v11 = [v9 arrayWithObject:v10];
      id v12 = self->_pendingChangeBlocks;
      self->_pendingChangeBlocks = v11;
    }
  }
  else
  {
    [(PXObservable *)self _willChange];
    id v8 = [(PXObservable *)self mutableChangeObject];
    v14[2](v14, v8);

    [(PXObservable *)self _didChange];
  }
}

- (void)_willChange
{
  int64_t nestedChanges = self->_nestedChanges;
  if (!nestedChanges)
  {
    [(PXObservable *)self willPerformChanges];
    int64_t nestedChanges = self->_nestedChanges;
  }
  self->_int64_t nestedChanges = nestedChanges + 1;
}

- (void)_didChange
{
  int64_t nestedChanges = self->_nestedChanges;
  if (nestedChanges == 1)
  {
    [(PXObservable *)self didPerformChanges];
    int64_t nestedChanges = self->_nestedChanges;
  }
  int64_t v4 = nestedChanges - 1;
  self->_int64_t nestedChanges = v4;
  if (!v4)
  {
    if ([(PXObservable *)self shouldNotifyObserversAfterApplyingChangeBlocks])
    {
      [(PXObservable *)self _publishChanges];
      [(PXObservable *)self didPublishChanges];
      self->_currentChange = 0;
    }
    [(PXObservable *)self didEndChangeHandling];
    [(PXObservable *)self _applyPendingChanges];
  }
}

- (void)_applyPendingChanges
{
  int64_t numAppliedPendingChanges = self->_numAppliedPendingChanges;
  self->_int64_t numAppliedPendingChanges = numAppliedPendingChanges + 1;
  if (numAppliedPendingChanges >= 39)
  {
    uint64_t v5 = PXAssertGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_259CDA000, v5, OS_LOG_TYPE_ERROR, "Change depth limit almost reached", buf, 2u);
    }

    if (self->_numAppliedPendingChanges >= 50)
    {
      id v10 = [MEMORY[0x263F08690] currentHandler];
      [v10 handleFailureInMethod:a2, self, @"PXObservable.m", 256, @"Change depth limit reached (%ld), this indicates infinite state ping-ponging, investigate the stack trace and figure out why the observable doesn't reach a stable state. Typically because two observers are trying to set different new values in response to the same change.", 50 object file lineNumber description];
    }
  }
  pendingChangeBlocks = self->_pendingChangeBlocks;
  if (pendingChangeBlocks)
  {
    uint64_t v7 = pendingChangeBlocks;
    id v8 = self->_pendingChangeBlocks;
    self->_pendingChangeBlocks = 0;

    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __36__PXObservable__applyPendingChanges__block_invoke;
    v11[3] = &unk_26545A730;
    id v12 = v7;
    uint64_t v9 = v7;
    [(PXObservable *)self performChanges:v11];
  }
  --self->_numAppliedPendingChanges;
}

- (BOOL)shouldNotifyObserversAfterApplyingChangeBlocks
{
  return [(PXObservable *)self currentChanges] != 0;
}

- (unint64_t)currentChanges
{
  return self->_currentChange;
}

- (void)_publishChanges
{
  unint64_t currentChange = self->_currentChange;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __31__PXObservable__publishChanges__block_invoke;
  v3[3] = &unk_26545A708;
  v3[4] = self;
  v3[5] = currentChange;
  [(PXObservable *)self enumerateObserversUsingBlock:v3];
}

- (void)signalChange:(unint64_t)a3
{
  self->_currentChange |= a3;
}

void __36__PXObservable__applyPendingChanges__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = *(id *)(a1 + 32);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_observersQueue_changeObserversWithContexts, 0);
  objc_storeStrong((id *)&self->_observersQueue, 0);

  objc_storeStrong((id *)&self->_pendingChangeBlocks, 0);
}

void __49__PXObservable_unregisterChangeObserver_context___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_observersQueue_copyChangeObserversForWriteIfNeeded");
  id v5 = [*(id *)(*(void *)(a1 + 32) + 64) objectForKey:*(void *)(a1 + 40)];
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
    [*(id *)(*(void *)(a1 + 32) + 64) removeObjectForKey:*(void *)(a1 + 40)];
  }
}

- (void)unregisterChangeObserver:(id)a3 context:(void *)a4
{
  id v6 = a3;
  observersQueue = self->_observersQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__PXObservable_unregisterChangeObserver_context___block_invoke;
  block[3] = &unk_26545A6B8;
  block[4] = self;
  id v10 = v6;
  long long v11 = a4;
  id v8 = v6;
  dispatch_sync(observersQueue, block);
}

- (void)setLogContext:(unint64_t)a3
{
  self->_logContext = a3;
}

- (unint64_t)logContext
{
  return self->_logContext;
}

- (OS_os_log)log
{
  return self->_log;
}

- (BOOL)hasObservers
{
  return self->_hasObservers;
}

- (void)copyLogConfigurationFrom:(id)a3
{
  id v4 = a3;
  id v5 = [v4 log];
  [(PXObservable *)self setLog:v5];

  uint64_t v6 = [v4 logContext];

  [(PXObservable *)self setLogContext:v6];
}

@end