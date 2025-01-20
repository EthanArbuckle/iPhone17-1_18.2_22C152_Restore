@interface UNSContentProtectionManager
- (BOOL)deviceUnlockedSinceBoot;
- (BOOL)isProtectedDataAvailable;
- (UNSContentProtectionManager)init;
- (id)classCStrategy;
- (id)classCStrategyExcludedFromBackup;
- (id)classDStrategy;
- (id)classDStrategyExcludedFromBackup;
- (id)contentProtectionStrategyForMinimumProtection:(id)a3 excludedFromBackup:(BOOL)a4;
- (int64_t)_queue_keyBagLockState;
- (int64_t)_queue_observedState;
- (int64_t)observedState;
- (void)_queue_adjustContentProtectionStateWithBlock:(id)a3;
- (void)addContentProtectionObserver:(id)a3;
- (void)dealloc;
- (void)removeContentProtectionObserver:(id)a3;
@end

@implementation UNSContentProtectionManager

- (UNSContentProtectionManager)init
{
  v16.receiver = self;
  v16.super_class = (Class)UNSContentProtectionManager;
  v2 = [(UNSContentProtectionManager *)&v16 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.NotificationContentProtection.observable", v3);

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.NotificationContentProtection.call-out", v5);

    v7 = [[UNCKeyedObservable alloc] initWithQueue:v4 callOutQueue:v6];
    observable = v2->_observable;
    v2->_observable = v7;

    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.unsusernotificationserver.NotificationContentProtection", v9);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v10;

    v12 = v2->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __35__UNSContentProtectionManager_init__block_invoke;
    block[3] = &unk_265567728;
    v15 = v2;
    dispatch_sync(v12, block);
  }
  return v2;
}

uint64_t __35__UNSContentProtectionManager_init__block_invoke(uint64_t a1)
{
  if (MKBDeviceFormattedForContentProtection())
  {
    v2 = (const char *)*MEMORY[0x263F55A78];
    v3 = *(int **)(a1 + 32);
    dispatch_queue_t v4 = v3 + 5;
    v5 = *((void *)v3 + 3);
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __35__UNSContentProtectionManager_init__block_invoke_2;
    handler[3] = &unk_265567830;
    v8 = v3;
    notify_register_dispatch(v2, v4, v5, handler);
  }
  *(void *)(*(void *)(a1 + 32) + 8) = objc_msgSend(*(id *)(a1 + 32), "_queue_keyBagLockState");
  uint64_t result = MKBDeviceUnlockedSinceBoot();
  *(unsigned char *)(*(void *)(a1 + 32) + 16) = result != 0;
  return result;
}

void __35__UNSContentProtectionManager_init__block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __35__UNSContentProtectionManager_init__block_invoke_3;
  v2[3] = &unk_265567728;
  id v3 = v1;
  objc_msgSend(v3, "_queue_adjustContentProtectionStateWithBlock:", v2);
}

uint64_t __35__UNSContentProtectionManager_init__block_invoke_3(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_queue_keyBagLockState");
  *(void *)(*(void *)(a1 + 32) + 8) = result;
  return result;
}

- (void)dealloc
{
  notify_cancel(self->_notifyToken);
  v3.receiver = self;
  v3.super_class = (Class)UNSContentProtectionManager;
  [(UNSContentProtectionManager *)&v3 dealloc];
}

- (void)addContentProtectionObserver:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __60__UNSContentProtectionManager_addContentProtectionObserver___block_invoke;
  v7[3] = &unk_265567628;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __60__UNSContentProtectionManager_addContentProtectionObserver___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v2 = *MEMORY[0x263F1E018];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E018], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_2608DB000, v2, OS_LOG_TYPE_DEFAULT, "Added content protection observer %{public}@", (uint8_t *)&v5, 0xCu);
  }
  return [*(id *)(*(void *)(a1 + 40) + 32) addObserver:*(void *)(a1 + 32) forKey:@"*"];
}

- (void)removeContentProtectionObserver:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __63__UNSContentProtectionManager_removeContentProtectionObserver___block_invoke;
  v7[3] = &unk_265567628;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __63__UNSContentProtectionManager_removeContentProtectionObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) removeObserver:*(void *)(a1 + 40) forKey:@"*"];
}

- (int64_t)observedState
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  queue = self->_queue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __44__UNSContentProtectionManager_observedState__block_invoke;
  v6[3] = &unk_265567600;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(queue, v6);
  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __44__UNSContentProtectionManager_observedState__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_queue_observedState");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)isProtectedDataAvailable
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  int64_t v3 = [(UNSContentProtectionManager *)self observedState];
  return v3 == 4 || v3 == 1;
}

- (BOOL)deviceUnlockedSinceBoot
{
  v2 = self;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = v2->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __54__UNSContentProtectionManager_deviceUnlockedSinceBoot__block_invoke;
  v5[3] = &unk_265567600;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __54__UNSContentProtectionManager_deviceUnlockedSinceBoot__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 16);
  return result;
}

- (id)classCStrategy
{
  return [(UNSContentProtectionManager *)self contentProtectionStrategyForMinimumProtection:*MEMORY[0x263F08098] excludedFromBackup:0];
}

- (id)classDStrategy
{
  return [(UNSContentProtectionManager *)self contentProtectionStrategyForMinimumProtection:*MEMORY[0x263F080B0] excludedFromBackup:0];
}

- (id)classCStrategyExcludedFromBackup
{
  return [(UNSContentProtectionManager *)self contentProtectionStrategyForMinimumProtection:*MEMORY[0x263F08098] excludedFromBackup:1];
}

- (id)classDStrategyExcludedFromBackup
{
  return [(UNSContentProtectionManager *)self contentProtectionStrategyForMinimumProtection:*MEMORY[0x263F080B0] excludedFromBackup:1];
}

- (id)contentProtectionStrategyForMinimumProtection:(id)a3 excludedFromBackup:(BOOL)a4
{
  if ((id)*MEMORY[0x263F080B0] == a3) {
    int v5 = [[UNCAtomicDataContentProtectionStrategy alloc] initWithFileProtectionType:a3 excludeFromBackup:a4];
  }
  else {
    int v5 = [[UNCHybridContentProtectionStrategy alloc] initWithFileProtectionType:a3 excludeFromBackup:a4 delegate:self];
  }
  uint64_t v6 = v5;

  return v6;
}

- (int64_t)_queue_observedState
{
  return self->_contentProtectionState;
}

- (void)_queue_adjustContentProtectionStateWithBlock:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  queue = self->_queue;
  int v5 = (void (**)(void))a3;
  dispatch_assert_queue_V2(queue);
  unint64_t v6 = [(UNSContentProtectionManager *)self _queue_observedState];
  v5[2](v5);

  int64_t v7 = [(UNSContentProtectionManager *)self _queue_observedState];
  unint64_t v8 = v7;
  char v9 = (os_log_t *)MEMORY[0x263F1E018];
  if (!self->_unlockedSinceBoot && (v7 == 4 || v7 == 1))
  {
    v11 = *MEMORY[0x263F1E018];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E018], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2608DB000, v11, OS_LOG_TYPE_DEFAULT, "First unlock", buf, 2u);
    }
    char v10 = 1;
    self->_unlockedSinceBoot = 1;
  }
  else
  {
    char v10 = 0;
  }
  int v13 = v8 == 4 || v8 == 1;
  int v15 = v6 == 4 || v6 == 1;
  os_log_t v16 = *v9;
  BOOL v17 = os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT);
  if (v15 == v13)
  {
    if (v17)
    {
      if (v6 > 4) {
        v19 = @"unknown";
      }
      else {
        v19 = off_265567870[v6];
      }
      if (v8 > 4) {
        v21 = @"unknown";
      }
      else {
        v21 = off_265567870[v8];
      }
      *(_DWORD *)buf = 138543618;
      v28 = v19;
      __int16 v29 = 2114;
      v30 = v21;
      v24 = v16;
      _os_log_impl(&dword_2608DB000, v24, OS_LOG_TYPE_DEFAULT, "Ignoring no-op keybag transition (%{public}@ -> %{public}@)", buf, 0x16u);
    }
  }
  else
  {
    if (v17)
    {
      if (v6 > 4) {
        v18 = @"unknown";
      }
      else {
        v18 = off_265567870[v6];
      }
      if (v8 > 4) {
        v20 = @"unknown";
      }
      else {
        v20 = off_265567870[v8];
      }
      *(_DWORD *)buf = 138543618;
      v28 = v18;
      __int16 v29 = 2114;
      v30 = v20;
      v22 = v16;
      _os_log_impl(&dword_2608DB000, v22, OS_LOG_TYPE_DEFAULT, "Key bag transitioning from %{public}@ to %{public}@", buf, 0x16u);
    }
    observable = self->_observable;
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __76__UNSContentProtectionManager__queue_adjustContentProtectionStateWithBlock___block_invoke;
    v25[3] = &__block_descriptor_33_e40_v16__0___UNCContentProtectionObserver__8l;
    char v26 = v10;
    [(UNCKeyedObservable *)observable notifyObserversKey:@"*" usingBlock:v25];
  }
}

uint64_t __76__UNSContentProtectionManager__queue_adjustContentProtectionStateWithBlock___block_invoke(uint64_t a1, void *a2)
{
  return [a2 contentProtectionStateChangedForFirstUnlock:*(unsigned __int8 *)(a1 + 32)];
}

- (int64_t)_queue_keyBagLockState
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  unsigned int v2 = MKBGetDeviceLockState();
  if (v2 < 4) {
    return v2 + 1;
  }
  else {
    return 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observable, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end