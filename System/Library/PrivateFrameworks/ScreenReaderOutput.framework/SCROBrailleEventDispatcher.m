@interface SCROBrailleEventDispatcher
- (BOOL)isValid;
- (SCROBrailleEventDispatcher)initWithTarget:(id)a3;
- (void)_processQueue;
- (void)dealloc;
- (void)enqueueEvent:(id)a3;
- (void)invalidate;
- (void)start;
@end

@implementation SCROBrailleEventDispatcher

- (SCROBrailleEventDispatcher)initWithTarget:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SCROBrailleEventDispatcher;
  v5 = [(SCROBrailleEventDispatcher *)&v13 init];
  if (v5)
  {
    v6 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    queueLock = v5->_queueLock;
    v5->_queueLock = v6;

    if (objc_opt_respondsToSelector()) {
      objc_storeWeak(&v5->_target, v4);
    }
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    queue = v5->_queue;
    v5->_queue = v8;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    brailleEventQueue = v5->_brailleEventQueue;
    v5->_brailleEventQueue = v10;

    v5->_isValid = 1;
  }

  return v5;
}

- (void)dealloc
{
  [(SCROBrailleEventDispatcher *)self invalidate];
  [(NSLock *)self->_queueLock lock];
  queueLock = self->_queueLock;
  self->_queueLock = 0;
  id v4 = queueLock;

  [(NSLock *)v4 unlock];
  v5.receiver = self;
  v5.super_class = (Class)SCROBrailleEventDispatcher;
  [(SCROBrailleEventDispatcher *)&v5 dealloc];
}

- (void)start
{
  [(NSLock *)self->_queueLock lock];
  if (self->_isValid && !self->_runLoop && !self->_queueSource)
  {
    self->_runLoop = CFRunLoopGetCurrent();
    v4.version = 0;
    memset(&v4.retain, 0, 56);
    v4.info = self;
    v4.perform = (void (__cdecl *)(void *))_processQueue;
    v3 = CFRunLoopSourceCreate(0, 0, &v4);
    self->_queueSource = v3;
    CFRunLoopAddSource(self->_runLoop, v3, (CFRunLoopMode)*MEMORY[0x263EFFE88]);
  }
  [(NSLock *)self->_queueLock unlock];
}

- (void)invalidate
{
  [(NSLock *)self->_queueLock lock];
  self->_isValid = 0;
  queueSource = self->_queueSource;
  if (queueSource)
  {
    CFRunLoopSourceInvalidate(queueSource);
    CFRelease(self->_queueSource);
    self->_queueSource = 0;
  }
  brailleEventQueue = self->_brailleEventQueue;
  self->_brailleEventQueue = 0;

  queue = self->_queue;
  self->_queue = 0;

  self->_runLoop = 0;
  objc_storeWeak(&self->_target, 0);
  queueLock = self->_queueLock;

  [(NSLock *)queueLock unlock];
}

- (BOOL)isValid
{
  [(NSLock *)self->_queueLock lock];
  BOOL isValid = self->_isValid;
  [(NSLock *)self->_queueLock unlock];
  return isValid;
}

- (void)enqueueEvent:(id)a3
{
  id v6 = a3;
  int v4 = [v6 type];
  [(NSLock *)self->_queueLock lock];
  if (self->_queueSource && self->_runLoop)
  {
    if (v4)
    {
      p_queue = &self->_queue;
      if ([(NSMutableArray *)self->_queue count] >= 51) {
        [(NSMutableArray *)*p_queue removeObjectAtIndex:0];
      }
    }
    else
    {
      p_queue = &self->_brailleEventQueue;
    }
    [(NSMutableArray *)*p_queue addObject:v6];
    CFRunLoopSourceSignal(self->_queueSource);
    CFRunLoopWakeUp(self->_runLoop);
  }
  [(NSLock *)self->_queueLock unlock];
}

- (void)_processQueue
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  [(NSLock *)self->_queueLock lock];
  v3 = (void *)[(NSMutableArray *)self->_brailleEventQueue copy];
  [(NSMutableArray *)self->_brailleEventQueue removeAllObjects];
  int v4 = (void *)[(NSMutableArray *)self->_queue copy];
  [(NSMutableArray *)self->_queue removeAllObjects];
  id WeakRetained = objc_loadWeakRetained(&self->_target);
  [(NSLock *)self->_queueLock unlock];
  id v6 = [MEMORY[0x263EFF980] array];
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  char v23 = 0;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __43__SCROBrailleEventDispatcher__processQueue__block_invoke;
  v19[3] = &unk_264414C10;
  v21 = v22;
  id v7 = v6;
  id v20 = v7;
  [v4 enumerateObjectsWithOptions:2 usingBlock:v19];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __43__SCROBrailleEventDispatcher__processQueue__block_invoke_2;
  v17[3] = &unk_264414C38;
  id v8 = WeakRetained;
  id v18 = v8;
  [v3 enumerateObjectsUsingBlock:v17];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v9 = objc_msgSend(v7, "reverseObjectEnumerator", 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v13 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v9);
        }
        [v8 handleEvent:*(void *)(*((void *)&v13 + 1) + 8 * v12++)];
      }
      while (v10 != v12);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v13 objects:v24 count:16];
    }
    while (v10);
  }

  _Block_object_dispose(v22, 8);
}

void __43__SCROBrailleEventDispatcher__processQueue__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 type] == 28)
  {
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
    {
      [*(id *)(a1 + 32) addObject:v3];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
  }
  else
  {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

uint64_t __43__SCROBrailleEventDispatcher__processQueue__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleEvent:a2];
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_target);
  objc_storeStrong((id *)&self->_brailleEventQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_queueLock, 0);
}

@end