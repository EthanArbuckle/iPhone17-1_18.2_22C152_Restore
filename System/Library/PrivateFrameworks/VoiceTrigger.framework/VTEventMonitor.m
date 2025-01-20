@interface VTEventMonitor
- (VTEventMonitor)init;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)enumerateObservers:(id)a3;
- (void)enumerateObserversInQueue:(id)a3;
- (void)notifyObserver:(id)a3;
- (void)removeObserver:(id)a3;
@end

@implementation VTEventMonitor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

- (void)notifyObserver:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [v4 VTEventMonitorDidReceiveEvent:self];
  }
}

- (void)enumerateObservers:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, void))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_observers;
  uint64_t v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    if (v4)
    {
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * v9++));
        }
        while (v7 != v9);
        uint64_t v7 = [(NSHashTable *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
    else
    {
      do
      {
        if (*(void *)v11 != v8)
        {
          do
          {
            if (*(void *)v11 != v8) {
              objc_enumerationMutation(v5);
            }
            --v7;
          }
          while (v7);
        }
        uint64_t v7 = [(NSHashTable *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (void)enumerateObserversInQueue:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__VTEventMonitor_enumerateObserversInQueue___block_invoke;
  v7[3] = &unk_264325C08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __44__VTEventMonitor_enumerateObserversInQueue___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) enumerateObservers:*(void *)(a1 + 40)];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __33__VTEventMonitor_removeObserver___block_invoke;
  v7[3] = &unk_264325FF0;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __33__VTEventMonitor_removeObserver___block_invoke(uint64_t result)
{
  if (*(void *)(result + 32))
  {
    uint64_t v1 = result;
    objc_msgSend(*(id *)(*(void *)(result + 40) + 8), "removeObject:");
    result = [*(id *)(*(void *)(v1 + 40) + 8) count];
    if (!result)
    {
      v2 = *(void **)(v1 + 40);
      return [v2 _stopMonitoring];
    }
  }
  return result;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __30__VTEventMonitor_addObserver___block_invoke;
  v7[3] = &unk_264325FF0;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __30__VTEventMonitor_addObserver___block_invoke(uint64_t result)
{
  if (*(void *)(result + 32))
  {
    uint64_t v1 = result;
    objc_msgSend(*(id *)(*(void *)(result + 40) + 8), "addObject:");
    result = [*(id *)(*(void *)(v1 + 40) + 8) count];
    if (result == 1)
    {
      v2 = *(void **)(v1 + 40);
      uint64_t v3 = v2[2];
      return [v2 _startMonitoringWithQueue:v3];
    }
  }
  return result;
}

- (void)dealloc
{
  [(VTEventMonitor *)self _stopMonitoring];
  v3.receiver = self;
  v3.super_class = (Class)VTEventMonitor;
  [(VTEventMonitor *)&v3 dealloc];
}

- (VTEventMonitor)init
{
  v8.receiver = self;
  v8.super_class = (Class)VTEventMonitor;
  v2 = [(VTEventMonitor *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("Serial VTEventMonitor queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

@end