@interface STStorageDiskMonitor
+ (id)sharedMonitor;
- (OS_dispatch_source)diskSizeTimer;
- (STStorageDiskMonitor)init;
- (STStorageSpace)storageSpace;
- (int64_t)deviceSize;
- (void)_sendNotify:(id)a3;
- (void)sendNotify:(id)a3;
- (void)setDiskSizeTimer:(id)a3;
- (void)startMonitor;
- (void)stopMonitor;
- (void)sync;
- (void)updateDiskSpace;
@end

@implementation STStorageDiskMonitor

+ (id)sharedMonitor
{
  if (sharedMonitor_onceMonitorToken != -1) {
    dispatch_once(&sharedMonitor_onceMonitorToken, &__block_literal_global_14);
  }
  v2 = (void *)sharedMonitor_gSharedMonitor;

  return v2;
}

uint64_t __37__STStorageDiskMonitor_sharedMonitor__block_invoke()
{
  sharedMonitor_gSharedMonitor = objc_alloc_init(STStorageDiskMonitor);

  return MEMORY[0x270F9A758]();
}

- (STStorageDiskMonitor)init
{
  v7.receiver = self;
  v7.super_class = (Class)STStorageDiskMonitor;
  v2 = [(STStorageDiskMonitor *)&v7 init];
  v3 = v2;
  if (v2)
  {
    [(STStorageDiskMonitor *)v2 updateDiskSpace];
    uint64_t v6 = 0;
    GetDeviceSpace(&v6, &v5);
    v3->_deviceSize = 1000000000 * (uint64_t)rint((double)v6 / 1000000000.0);
    v3->_updateDelta = 104857600;
  }
  return v3;
}

- (void)_sendNotify:(id)a3
{
  v3 = (void *)MEMORY[0x263F08A00];
  id v4 = a3;
  id v5 = [v3 defaultCenter];
  [v5 postNotificationName:v4 object:0];
}

- (void)sendNotify:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __35__STStorageDiskMonitor_sendNotify___block_invoke;
  v6[3] = &unk_2643050C0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __35__STStorageDiskMonitor_sendNotify___block_invoke(uint64_t a1)
{
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:*(void *)(a1 + 32) selector:sel__sendNotify_ object:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 performSelector:sel__sendNotify_ withObject:v3 afterDelay:0.1];
}

- (void)sync
{
  uint64_t v3 = (void *)MEMORY[0x21D463BC0](self, a2);
  int64_t deviceSize = self->_deviceSize;
  uint64_t v17 = deviceSize;
  GetDeviceSpace(&v17, &deviceSize);
  id v4 = +[STStorageCacheDelete sharedMonitor];
  uint64_t v5 = [v4 totalPurgeable];

  int64_t v7 = deviceSize;
  uint64_t v6 = v17;
  STLog(1, @"disk space tot: %lld, free: %lld, purge: %lld", v8, v9, v10, v11, v12, v13, v17);
  v14 = [[STStorageSpace alloc] initWithTotal:v6 free:v7 purgeable:v5];
  storageSpace = self->_storageSpace;
  self->_storageSpace = v14;
}

- (void)updateDiskSpace
{
  int64_t v3 = [(STStorageSpace *)self->_storageSpace availableBytes];
  [(STStorageDiskMonitor *)self sync];
  int64_t v4 = [(STStorageSpace *)self->_storageSpace availableBytes];
  int64_t v5 = v4 - v3;
  if (v4 - v3 < 0) {
    int64_t v5 = v3 - v4;
  }
  if (v5 > self->_updateDelta)
  {
    [(STStorageDiskMonitor *)self sendNotify:@"STStorageUsageChangedNotification"];
  }
}

- (void)startMonitor
{
  int64_t v3 = [(STStorageDiskMonitor *)self diskSizeTimer];
  if (!v3)
  {
    int64_t v4 = dispatch_get_global_queue(9, 0);
    int64_t v3 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v4);

    [(STStorageDiskMonitor *)self setDiskSizeTimer:v3];
    dispatch_source_set_timer(v3, 0, 0xB2D05E00uLL, 0x1DCD6500uLL);
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __36__STStorageDiskMonitor_startMonitor__block_invoke;
    handler[3] = &unk_264305098;
    handler[4] = self;
    dispatch_source_set_event_handler(v3, handler);
    dispatch_resume(v3);
  }
  int64_t v5 = +[STStorageCacheDelete sharedMonitor];
  [v5 startMonitor];
}

uint64_t __36__STStorageDiskMonitor_startMonitor__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateDiskSpace];
}

- (void)stopMonitor
{
  source = [(STStorageDiskMonitor *)self diskSizeTimer];
  if (source)
  {
    [(STStorageDiskMonitor *)self setDiskSizeTimer:0];
    dispatch_source_cancel(source);
  }
  int64_t v3 = +[STStorageCacheDelete sharedMonitor];
  [v3 stopMonitor];
}

- (int64_t)deviceSize
{
  return self->_deviceSize;
}

- (STStorageSpace)storageSpace
{
  return (STStorageSpace *)objc_getProperty(self, a2, 24, 1);
}

- (OS_dispatch_source)diskSizeTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDiskSizeTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diskSizeTimer, 0);

  objc_storeStrong((id *)&self->_storageSpace, 0);
}

@end