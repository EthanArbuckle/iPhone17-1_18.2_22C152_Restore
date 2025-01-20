@interface AXPhoenixEventMonitor
- (AXPhoenixEventMonitor)init;
- (NSHashTable)observers;
- (OS_dispatch_queue)queue;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)enumerateObservers:(id)a3;
- (void)enumerateObserversInQueue:(id)a3;
- (void)notifyObserver:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setObservers:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation AXPhoenixEventMonitor

- (AXPhoenixEventMonitor)init
{
  SEL v9 = a2;
  v10 = 0;
  v8.receiver = self;
  v8.super_class = (Class)AXPhoenixEventMonitor;
  v10 = [(AXPhoenixEventMonitor *)&v8 init];
  objc_storeStrong((id *)&v10, v10);
  if (v10)
  {
    v4 = v10;
    id v5 = (id)[MEMORY[0x263F088B0] weakObjectsHashTable];
    -[AXPhoenixEventMonitor setObservers:](v4, "setObservers:");

    v6 = v10;
    dispatch_queue_t v7 = dispatch_queue_create("AXPhoenixEventMonitor queue", 0);
    -[AXPhoenixEventMonitor setQueue:](v6, "setQueue:");
  }
  v3 = v10;
  objc_storeStrong((id *)&v10, 0);
  return v3;
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;
  [(AXPhoenixEventMonitor *)self _stopMonitoring];
  v2.receiver = v4;
  v2.super_class = (Class)AXPhoenixEventMonitor;
  [(AXPhoenixEventMonitor *)&v2 dealloc];
}

- (void)addObserver:(id)a3
{
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = [(AXPhoenixEventMonitor *)v12 queue];
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  dispatch_queue_t v7 = __37__AXPhoenixEventMonitor_addObserver___block_invoke;
  objc_super v8 = &unk_264CCDF50;
  id v9 = location[0];
  v10 = v12;
  dispatch_sync(queue, &v4);

  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

void __37__AXPhoenixEventMonitor_addObserver___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v3 = (id)[*(id *)(a1 + 40) observers];
    [v3 addObject:*(void *)(a1 + 32)];

    id v4 = (id)[*(id *)(a1 + 40) observers];
    BOOL v5 = [v4 count] != 1;

    if (!v5)
    {
      v1 = *(void **)(a1 + 40);
      id v2 = (id)[v1 queue];
      objc_msgSend(v1, "_startMonitoringWithQueue:");
    }
  }
}

- (void)removeObserver:(id)a3
{
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = [(AXPhoenixEventMonitor *)v12 queue];
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  dispatch_queue_t v7 = __40__AXPhoenixEventMonitor_removeObserver___block_invoke;
  objc_super v8 = &unk_264CCDF50;
  id v9 = location[0];
  v10 = v12;
  dispatch_sync(queue, &v4);

  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

void __40__AXPhoenixEventMonitor_removeObserver___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v1 = (id)[*(id *)(a1 + 40) observers];
    [v1 removeObject:*(void *)(a1 + 32)];

    id v2 = (id)[*(id *)(a1 + 40) observers];
    BOOL v3 = [v2 count] != 0;

    if (!v3) {
      [*(id *)(a1 + 40) _stopMonitoring];
    }
  }
}

- (void)notifyObserver:(id)a3
{
  uint64_t v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (objc_opt_respondsToSelector()) {
    [location[0] phoenixEventMonitorDidReceiveEvent:v4];
  }
  objc_storeStrong(location, 0);
}

- (void)enumerateObserversInQueue:(id)a3
{
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = [(AXPhoenixEventMonitor *)v12 queue];
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  dispatch_queue_t v7 = __51__AXPhoenixEventMonitor_enumerateObserversInQueue___block_invoke;
  objc_super v8 = &unk_264CCDF78;
  id v9 = v12;
  id v10 = location[0];
  dispatch_async(queue, &v4);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

uint64_t __51__AXPhoenixEventMonitor_enumerateObserversInQueue___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "enumerateObservers:", *(void *)(a1 + 40), a1, a1);
}

- (void)enumerateObservers:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  dispatch_queue_t v7 = [(AXPhoenixEventMonitor *)v13 queue];
  dispatch_assert_queue_V2(v7);

  memset(__b, 0, sizeof(__b));
  obj = [(AXPhoenixEventMonitor *)v13 observers];
  uint64_t v9 = [(NSHashTable *)obj countByEnumeratingWithState:__b objects:v14 count:16];
  if (v9)
  {
    uint64_t v4 = *(void *)__b[2];
    uint64_t v5 = 0;
    unint64_t v6 = v9;
    while (1)
    {
      uint64_t v3 = v5;
      if (*(void *)__b[2] != v4) {
        objc_enumerationMutation(obj);
      }
      uint64_t v11 = *(void *)(__b[1] + 8 * v5);
      if (location[0]) {
        (*((void (**)(id, uint64_t))location[0] + 2))(location[0], v11);
      }
      ++v5;
      if (v3 + 1 >= v6)
      {
        uint64_t v5 = 0;
        unint64_t v6 = [(NSHashTable *)obj countByEnumeratingWithState:__b objects:v14 count:16];
        if (!v6) {
          break;
        }
      }
    }
  }

  objc_storeStrong(location, 0);
}

- (void)_startMonitoringWithQueue:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end