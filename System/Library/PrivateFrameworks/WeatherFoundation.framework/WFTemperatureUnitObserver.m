@interface WFTemperatureUnitObserver
+ (id)sharedObserver;
- (BOOL)removeBlockObserverWithHandle:(id)a3;
- (BOOL)removeObserver:(id)a3;
- (NSHashTable)observerObjects;
- (NSMutableDictionary)blockObserversForUUID;
- (OS_dispatch_queue)callbackQueue;
- (OS_dispatch_queue)temperatureUnitUpdateQueue;
- (WFTemperatureUnitObserver)init;
- (id)_init;
- (id)addBlockObserver:(id)a3;
- (int)temperatureUnit;
- (int)userTemperatureUnit;
- (os_unfair_lock_s)dataSynchronizationLock;
- (void)_updateTemperatureUnit;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)q_notifyObserversOfUpdatedTemperatureUnit:(int)a3;
- (void)q_updateTemperatureUnit;
- (void)removeAllObservers;
- (void)setBlockObserversForUUID:(id)a3;
- (void)setCallbackQueue:(id)a3;
- (void)setDataSynchronizationLock:(os_unfair_lock_s)a3;
- (void)setObserverObjects:(id)a3;
- (void)setTemperatureUnitUpdateQueue:(id)a3;
- (void)setUserTemperatureUnit:(int)a3;
@end

@implementation WFTemperatureUnitObserver

+ (id)sharedObserver
{
  if (sharedObserver_onceToken != -1) {
    dispatch_once(&sharedObserver_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)sharedObserver_defaultObserver;
  return v2;
}

uint64_t __43__WFTemperatureUnitObserver_sharedObserver__block_invoke()
{
  sharedObserver_defaultObserver = [[WFTemperatureUnitObserver alloc] _init];
  return MEMORY[0x270F9A758]();
}

- (WFTemperatureUnitObserver)init
{
  return 0;
}

- (id)_init
{
  v11.receiver = self;
  v11.super_class = (Class)WFTemperatureUnitObserver;
  v2 = [(WFTemperatureUnitObserver *)&v11 init];
  v3 = v2;
  if (v2)
  {
    [(WFTemperatureUnitObserver *)v2 setDataSynchronizationLock:0];
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.WeatherFoundation.temperatureUnitUpdateQueue", v4);
    [(WFTemperatureUnitObserver *)v3 setTemperatureUnitUpdateQueue:v5];

    v6 = objc_opt_new();
    [(WFTemperatureUnitObserver *)v3 setBlockObserversForUUID:v6];

    v7 = [MEMORY[0x263F088B0] hashTableWithOptions:517];
    [(WFTemperatureUnitObserver *)v3 setObserverObjects:v7];

    [(WFTemperatureUnitObserver *)v3 setUserTemperatureUnit:0];
    [(WFTemperatureUnitObserver *)v3 _updateTemperatureUnit];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)__WFTemperatureUnitObserverTrampoline, @"com.apple.weather.temperatureUnitsChangedNotification", 0, CFNotificationSuspensionBehaviorCoalesce);
    v9 = [MEMORY[0x263F08A00] defaultCenter];
    [v9 addObserver:v3 selector:sel__updateTemperatureUnit name:*MEMORY[0x263EFF458] object:0];
  }
  return v3;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  [(WFTemperatureUnitObserver *)self removeAllObservers];
  v4.receiver = self;
  v4.super_class = (Class)WFTemperatureUnitObserver;
  [(WFTemperatureUnitObserver *)&v4 dealloc];
}

- (OS_dispatch_queue)callbackQueue
{
  p_callbackQueue = &self->_callbackQueue;
  callbackQueue = self->_callbackQueue;
  if (!callbackQueue)
  {
    objc_storeStrong((id *)p_callbackQueue, MEMORY[0x263EF83A0]);
    callbackQueue = *p_callbackQueue;
  }
  return callbackQueue;
}

- (int)temperatureUnit
{
  v2 = self;
  p_dataSynchronizationLock = &self->_dataSynchronizationLock;
  os_unfair_lock_lock_with_options();
  LODWORD(v2) = [(WFTemperatureUnitObserver *)v2 userTemperatureUnit];
  os_unfair_lock_unlock(p_dataSynchronizationLock);
  return (int)v2;
}

- (void)addObserver:(id)a3
{
  if (a3)
  {
    p_dataSynchronizationLock = &self->_dataSynchronizationLock;
    id v5 = a3;
    os_unfair_lock_lock_with_options();
    v6 = [(WFTemperatureUnitObserver *)self observerObjects];
    [v6 addObject:v5];

    os_unfair_lock_unlock(p_dataSynchronizationLock);
  }
}

- (BOOL)removeObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    p_dataSynchronizationLock = &self->_dataSynchronizationLock;
    os_unfair_lock_lock_with_options();
    v6 = [(WFTemperatureUnitObserver *)self observerObjects];
    int v7 = [v6 containsObject:v4];

    if (v7)
    {
      v8 = [(WFTemperatureUnitObserver *)self observerObjects];
      [v8 removeObject:v4];
    }
    os_unfair_lock_unlock(p_dataSynchronizationLock);
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (id)addBlockObserver:(id)a3
{
  if (a3)
  {
    id v4 = (void *)MEMORY[0x263F08C38];
    id v5 = a3;
    v6 = [v4 UUID];
    p_dataSynchronizationLock = &self->_dataSynchronizationLock;
    os_unfair_lock_lock_with_options();
    v8 = [(WFTemperatureUnitObserver *)self blockObserversForUUID];
    v9 = (void *)[v5 copy];

    v10 = (void *)MEMORY[0x21D4B3DE0](v9);
    [v8 setObject:v10 forKey:v6];

    os_unfair_lock_unlock(p_dataSynchronizationLock);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (BOOL)removeBlockObserverWithHandle:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    p_dataSynchronizationLock = &self->_dataSynchronizationLock;
    os_unfair_lock_lock_with_options();
    CFDictionaryRef v6 = [(WFTemperatureUnitObserver *)self blockObserversForUUID];
    int v7 = CFDictionaryContainsKey(v6, v4);
    BOOL v8 = v7 != 0;

    if (v7)
    {
      v9 = [(WFTemperatureUnitObserver *)self blockObserversForUUID];
      [v9 removeObjectForKey:v4];
    }
    os_unfair_lock_unlock(p_dataSynchronizationLock);
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)_updateTemperatureUnit
{
  v3 = [(WFTemperatureUnitObserver *)self temperatureUnitUpdateQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__WFTemperatureUnitObserver__updateTemperatureUnit__block_invoke;
  block[3] = &unk_2644305E8;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __51__WFTemperatureUnitObserver__updateTemperatureUnit__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "q_updateTemperatureUnit");
}

- (void)q_updateTemperatureUnit
{
  v3 = [(WFTemperatureUnitObserver *)self temperatureUnitUpdateQueue];
  dispatch_assert_queue_V2(v3);

  objc_initWeak(&location, self);
  id v4 = [WFTemperatureUnitRequest alloc];
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  BOOL v8 = __52__WFTemperatureUnitObserver_q_updateTemperatureUnit__block_invoke;
  v9 = &unk_264430CB0;
  objc_copyWeak(&v10, &location);
  id v5 = [(WFTemperatureUnitRequest *)v4 initWithResultHandler:&v6];
  [(WFTask *)v5 executeSynchronously];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __52__WFTemperatureUnitObserver_q_updateTemperatureUnit__block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = [WeakRetained temperatureUnitUpdateQueue];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __52__WFTemperatureUnitObserver_q_updateTemperatureUnit__block_invoke_2;
  v5[3] = &unk_264430C88;
  v5[4] = WeakRetained;
  int v6 = a2;
  dispatch_async(v4, v5);
}

void __52__WFTemperatureUnitObserver_q_updateTemperatureUnit__block_invoke_2(uint64_t a1)
{
  os_unfair_lock_lock_with_options();
  int v2 = [*(id *)(a1 + 32) userTemperatureUnit];
  int v3 = *(_DWORD *)(a1 + 40);
  id v4 = *(os_unfair_lock_s **)(a1 + 32);
  if (v3) {
    BOOL v5 = v3 == v2;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    int v6 = v4 + 2;
    os_unfair_lock_unlock(v6);
  }
  else
  {
    -[os_unfair_lock_s setUserTemperatureUnit:](v4, "setUserTemperatureUnit:");
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
    uint64_t v7 = *(void **)(a1 + 32);
    uint64_t v8 = *(unsigned int *)(a1 + 40);
    objc_msgSend(v7, "q_notifyObserversOfUpdatedTemperatureUnit:", v8);
  }
}

- (void)q_notifyObserversOfUpdatedTemperatureUnit:(int)a3
{
  BOOL v5 = [(WFTemperatureUnitObserver *)self temperatureUnitUpdateQueue];
  dispatch_assert_queue_V2(v5);

  os_unfair_lock_lock_with_options();
  int v6 = [(WFTemperatureUnitObserver *)self observerObjects];
  uint64_t v7 = [v6 objectEnumerator];
  uint64_t v8 = [v7 allObjects];

  v9 = [(WFTemperatureUnitObserver *)self blockObserversForUUID];
  id v10 = [v9 allValues];

  os_unfair_lock_unlock(&self->_dataSynchronizationLock);
  size_t v11 = [v10 count];
  v12 = [(WFTemperatureUnitObserver *)self callbackQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__WFTemperatureUnitObserver_q_notifyObserversOfUpdatedTemperatureUnit___block_invoke;
  block[3] = &unk_264430CD8;
  id v22 = v10;
  int v23 = a3;
  id v13 = v10;
  dispatch_apply(v11, v12, block);

  size_t v14 = [v8 count];
  v15 = [(WFTemperatureUnitObserver *)self callbackQueue];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __71__WFTemperatureUnitObserver_q_notifyObserversOfUpdatedTemperatureUnit___block_invoke_2;
  v17[3] = &unk_264430D00;
  id v18 = v8;
  v19 = self;
  int v20 = a3;
  id v16 = v8;
  dispatch_apply(v14, v15, v17);
}

void __71__WFTemperatureUnitObserver_q_notifyObserversOfUpdatedTemperatureUnit___block_invoke(uint64_t a1, uint64_t a2)
{
  int v3 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  v3[2](v3, *(unsigned int *)(a1 + 40));
}

void __71__WFTemperatureUnitObserver_q_notifyObserversOfUpdatedTemperatureUnit___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) objectAtIndex:a2];
  [v3 temperatureUnitObserver:*(void *)(a1 + 40) didChangeTemperatureUnitTo:*(unsigned int *)(a1 + 48)];
}

- (void)removeAllObservers
{
  p_dataSynchronizationLock = &self->_dataSynchronizationLock;
  os_unfair_lock_lock_with_options();
  id v4 = [(WFTemperatureUnitObserver *)self blockObserversForUUID];
  [v4 removeAllObjects];

  BOOL v5 = [(WFTemperatureUnitObserver *)self observerObjects];
  [v5 removeAllObjects];

  os_unfair_lock_unlock(p_dataSynchronizationLock);
}

- (OS_dispatch_queue)temperatureUnitUpdateQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTemperatureUnitUpdateQueue:(id)a3
{
}

- (os_unfair_lock_s)dataSynchronizationLock
{
  return self->_dataSynchronizationLock;
}

- (void)setDataSynchronizationLock:(os_unfair_lock_s)a3
{
  self->_dataSynchronizationLock = a3;
}

- (NSMutableDictionary)blockObserversForUUID
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setBlockObserversForUUID:(id)a3
{
}

- (NSHashTable)observerObjects
{
  return (NSHashTable *)objc_getProperty(self, a2, 32, 1);
}

- (void)setObserverObjects:(id)a3
{
}

- (int)userTemperatureUnit
{
  return self->_userTemperatureUnit;
}

- (void)setUserTemperatureUnit:(int)a3
{
  self->_userTemperatureUnit = a3;
}

- (void)setCallbackQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_observerObjects, 0);
  objc_storeStrong((id *)&self->_blockObserversForUUID, 0);
  objc_storeStrong((id *)&self->_temperatureUnitUpdateQueue, 0);
}

@end