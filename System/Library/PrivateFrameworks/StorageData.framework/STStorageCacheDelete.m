@interface STStorageCacheDelete
+ (id)sharedMonitor;
- (STStorageCacheDelete)init;
- (id)cacheDeleteDict;
- (int64_t)totalPurgeable;
- (void)dealloc;
- (void)refreshPurgeableSpace;
- (void)startMonitor;
- (void)stopMonitor;
@end

@implementation STStorageCacheDelete

+ (id)sharedMonitor
{
  if (sharedMonitor_onceToken_0 != -1) {
    dispatch_once(&sharedMonitor_onceToken_0, &__block_literal_global_7);
  }
  v2 = (void *)sharedMonitor__monitor;

  return v2;
}

uint64_t __37__STStorageCacheDelete_sharedMonitor__block_invoke()
{
  sharedMonitor__monitor = objc_alloc_init(STStorageCacheDelete);

  return MEMORY[0x270F9A758]();
}

- (STStorageCacheDelete)init
{
  v11.receiver = self;
  v11.super_class = (Class)STStorageCacheDelete;
  v2 = [(STStorageCacheDelete *)&v11 init];
  if (v2)
  {
    v3 = dispatch_get_global_queue(25, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __28__STStorageCacheDelete_init__block_invoke;
    block[3] = &unk_264305098;
    v4 = v2;
    v10 = v4;
    dispatch_async(v3, block);

    v5 = dispatch_get_global_queue(9, 0);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __28__STStorageCacheDelete_init__block_invoke_2;
    v7[3] = &unk_264305598;
    v8 = v4;
    notify_register_dispatch("CACHE_DELETE_PURGEABLE_UPDATED", v4 + 2, v5, v7);

    notify_suspend(v4[2]);
  }
  return v2;
}

uint64_t __28__STStorageCacheDelete_init__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) refreshPurgeableSpace];
}

void __28__STStorageCacheDelete_init__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) refreshPurgeableSpace];
  v1 = MEMORY[0x263EF83A0];

  dispatch_async(v1, &__block_literal_global_4);
}

void __28__STStorageCacheDelete_init__block_invoke_3()
{
  id v0 = [MEMORY[0x263F08A00] defaultCenter];
  [v0 postNotificationName:@"STStoragePurgeableChangedNotification" object:0];
}

- (void)dealloc
{
  int cdNotifyToken = self->_cdNotifyToken;
  if (cdNotifyToken) {
    notify_cancel(cdNotifyToken);
  }
  v4.receiver = self;
  v4.super_class = (Class)STStorageCacheDelete;
  [(STStorageCacheDelete *)&v4 dealloc];
}

- (void)startMonitor
{
  v3 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__STStorageCacheDelete_startMonitor__block_invoke;
  block[3] = &unk_264305098;
  void block[4] = self;
  dispatch_async(v3, block);

  notify_resume(self->_cdNotifyToken);
}

uint64_t __36__STStorageCacheDelete_startMonitor__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) refreshPurgeableSpace];
}

- (void)stopMonitor
{
}

- (void)refreshPurgeableSpace
{
  dlerror();
  uint64_t v0 = abort_report_np();
  __getCSSearchQueryContextClass_block_invoke_cold_1(v0);
}

- (id)cacheDeleteDict
{
  while (!self->_inited)
    usleep(0x186A0u);
  p_updateLock = &self->_updateLock;
  os_unfair_lock_lock(&self->_updateLock);
  objc_super v4 = self->_itemsDict;
  os_unfair_lock_unlock(p_updateLock);

  return v4;
}

- (int64_t)totalPurgeable
{
  while (!self->_inited)
    usleep(0x186A0u);
  p_updateLock = &self->_updateLock;
  os_unfair_lock_lock(&self->_updateLock);
  int64_t totalPurgeable = self->_totalPurgeable;
  os_unfair_lock_unlock(p_updateLock);
  return totalPurgeable;
}

- (void).cxx_destruct
{
}

@end