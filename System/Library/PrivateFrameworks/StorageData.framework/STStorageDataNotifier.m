@interface STStorageDataNotifier
+ (id)sharedNotifier;
- (STStorageDataNotifier)init;
- (void)_notify:(id)a3;
- (void)notify:(id)a3;
- (void)notify:(id)a3 forBundleIDs:(id)a4;
- (void)postAppSizesChanged:(id)a3;
- (void)postAppsAdded:(id)a3;
- (void)postAppsRemoved:(id)a3;
- (void)postAppsStateChanged:(id)a3;
- (void)postLoadingComplete;
- (void)postMediaSizesChanged;
- (void)postTipsChanged;
@end

@implementation STStorageDataNotifier

+ (id)sharedNotifier
{
  if (sharedNotifier_onceToken != -1) {
    dispatch_once(&sharedNotifier_onceToken, &__block_literal_global_15);
  }
  v2 = (void *)sharedNotifier__notifier;

  return v2;
}

uint64_t __39__STStorageDataNotifier_sharedNotifier__block_invoke()
{
  sharedNotifier__notifier = objc_alloc_init(STStorageDataNotifier);

  return MEMORY[0x270F9A758]();
}

- (STStorageDataNotifier)init
{
  v6.receiver = self;
  v6.super_class = (Class)STStorageDataNotifier;
  v2 = [(STStorageDataNotifier *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_changesLock._os_unfair_lock_opaque = 0;
    changes = v2->_changes;
    v2->_changes = 0;
  }
  return v3;
}

- (void)_notify:(id)a3
{
  id v4 = a3;
  STLog(1, @"STStorageNotification: _notify: %@", v5, v6, v7, v8, v9, v10, (uint64_t)v4);
  os_unfair_lock_lock(&self->_changesLock);
  v11 = [(NSMutableDictionary *)self->_changes objectForKey:v4];
  if (v11) {
    [(NSMutableDictionary *)self->_changes removeObjectForKey:v4];
  }
  os_unfair_lock_unlock(&self->_changesLock);
  v12 = dispatch_get_global_queue(17, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__STStorageDataNotifier__notify___block_invoke;
  block[3] = &unk_2643054F0;
  id v16 = v11;
  id v17 = v4;
  v18 = self;
  id v13 = v4;
  id v14 = v11;
  dispatch_async(v12, block);
}

void __33__STStorageDataNotifier__notify___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count])
  {
    id v3 = [NSDictionary dictionaryWithObject:*(void *)(a1 + 32) forKey:@"APPS"];
  }
  else
  {
    id v3 = 0;
  }
  v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:*(void *)(a1 + 40) object:*(void *)(a1 + 48) userInfo:v3];
}

- (void)notify:(id)a3 forBundleIDs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    os_unfair_lock_lock(&self->_changesLock);
    uint64_t v8 = [(NSMutableDictionary *)self->_changes objectForKey:v6];
    if (!v8)
    {
      uint64_t v8 = [MEMORY[0x263EFF9C0] setWithCapacity:4];
    }
    [v8 addObjectsFromArray:v7];
    [(NSMutableDictionary *)self->_changes setObject:v8 forKey:v6];
    os_unfair_lock_unlock(&self->_changesLock);
  }
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __45__STStorageDataNotifier_notify_forBundleIDs___block_invoke;
  v10[3] = &unk_2643050C0;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  dispatch_async(MEMORY[0x263EF83A0], v10);
}

uint64_t __45__STStorageDataNotifier_notify_forBundleIDs___block_invoke(uint64_t a1)
{
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:*(void *)(a1 + 32) selector:sel__notify_ object:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 performSelector:sel__notify_ withObject:v3 afterDelay:0.1];
}

- (void)notify:(id)a3
{
}

- (void)postAppsAdded:(id)a3
{
}

- (void)postAppsRemoved:(id)a3
{
}

- (void)postAppsStateChanged:(id)a3
{
}

- (void)postAppSizesChanged:(id)a3
{
}

- (void)postTipsChanged
{
}

- (void)postMediaSizesChanged
{
}

- (void)postLoadingComplete
{
}

- (void).cxx_destruct
{
}

@end