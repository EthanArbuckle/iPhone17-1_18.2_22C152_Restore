@interface WBSKeyBagLockStatusManager
+ (id)sharedManager;
- (BOOL)isKeyBagEnabled;
- (BOOL)isLockedOrAboutToLock;
- (WBSKeyBagLockStatusManager)init;
- (id)_descriptionOfKeyBagLockStatus:(int64_t)a3;
- (id)addKeyBagLockStatusChangedObserverWithHandler:(id)a3;
- (int64_t)keyBagLockStatus;
- (void)_startObservingKeyBagLockStatusChanges;
- (void)_stopObservingKeyBagLockStatusChanges;
- (void)dealloc;
- (void)removeKeyBagLockStatusChangedObserver:(id)a3;
@end

@implementation WBSKeyBagLockStatusManager

- (WBSKeyBagLockStatusManager)init
{
  if (MobileKeyBagLibraryCore(0) && getMKBGetDeviceLockStateSymbolLoc())
  {
    v7.receiver = self;
    v7.super_class = (Class)WBSKeyBagLockStatusManager;
    v3 = [(WBSKeyBagLockStatusManager *)&v7 init];
    if (v3)
    {
      dispatch_queue_t v4 = dispatch_queue_create("com.apple.SafariCore.WBSKeyBagLockStatusManager", 0);
      internalQueue = v3->_internalQueue;
      v3->_internalQueue = (OS_dispatch_queue *)v4;

      self = v3;
      v3 = self;
    }
    else
    {
      self = 0;
    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (int64_t)keyBagLockStatus
{
  soft_MKBGetDeviceLockState((const __CFDictionary *)self);
  if (v2 == 1) {
    return 2;
  }
  else {
    return v2 == 2;
  }
}

+ (id)sharedManager
{
  {
    int v2 = (WBSKeyBagLockStatusManager *)+[WBSKeyBagLockStatusManager sharedManager]::manager;
  }
  else
  {
    int v2 = objc_alloc_init(WBSKeyBagLockStatusManager);
    +[WBSKeyBagLockStatusManager sharedManager]::manager = (uint64_t)v2;
  }
  return v2;
}

- (id)addKeyBagLockStatusChangedObserverWithHandler:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__5;
  v16 = __Block_byref_object_dispose__5;
  id v17 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__WBSKeyBagLockStatusManager_addKeyBagLockStatusChangedObserverWithHandler___block_invoke;
  block[3] = &unk_1E615AFB0;
  id v10 = v4;
  v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(internalQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __76__WBSKeyBagLockStatusManager_addKeyBagLockStatusChangedObserverWithHandler___block_invoke(uint64_t a1)
{
  int v2 = *(void **)(*(void *)(a1 + 32) + 8);
  if (!v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA80] set];
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 8);
    *(void *)(v4 + 8) = v3;

    int v2 = *(void **)(*(void *)(a1 + 32) + 8);
  }
  if (![v2 count]) {
    [*(id *)(a1 + 32) _startObservingKeyBagLockStatusChanges];
  }
  id v6 = [[WBSKeyBagLockStatusChangedHandlerToken alloc] initWithHandler:*(void *)(a1 + 40)];
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  v9 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  return [v9 addObject:v10];
}

- (void)_startObservingKeyBagLockStatusChanges
{
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__WBSKeyBagLockStatusManager__startObservingKeyBagLockStatusChanges__block_invoke;
  aBlock[3] = &unk_1E615AA60;
  objc_copyWeak(&v14, &location);
  uint64_t v3 = _Block_copy(aBlock);
  internalQueue = self->_internalQueue;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __68__WBSKeyBagLockStatusManager__startObservingKeyBagLockStatusChanges__block_invoke_7;
  handler[3] = &unk_1E615AFD8;
  id v5 = v3;
  id v12 = v5;
  notify_register_dispatch("com.apple.mobile.keybagd.lock_status", &self->_notifyTokenLockStatusChanged, internalQueue, handler);
  p_notifyTokenFirstUnlock = &self->_notifyTokenFirstUnlock;
  uint64_t v7 = self->_internalQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __68__WBSKeyBagLockStatusManager__startObservingKeyBagLockStatusChanges__block_invoke_2_10;
  v9[3] = &unk_1E615AFD8;
  id v8 = v5;
  id v10 = v8;
  notify_register_dispatch("com.apple.mobile.keybagd.first_unlock", p_notifyTokenFirstUnlock, v7, v9);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)dealloc
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__WBSKeyBagLockStatusManager_dealloc__block_invoke;
  block[3] = &unk_1E6159820;
  block[4] = self;
  dispatch_sync(internalQueue, block);
  v4.receiver = self;
  v4.super_class = (Class)WBSKeyBagLockStatusManager;
  [(WBSKeyBagLockStatusManager *)&v4 dealloc];
}

_DWORD *__37__WBSKeyBagLockStatusManager_dealloc__block_invoke(uint64_t a1)
{
  result = *(_DWORD **)(a1 + 32);
  if (result[4] || result[5]) {
    return (_DWORD *)[result _stopObservingKeyBagLockStatusChanges];
  }
  return result;
}

- (void)removeKeyBagLockStatusChangedObserver:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__WBSKeyBagLockStatusManager_removeKeyBagLockStatusChangedObserver___block_invoke;
  v7[3] = &unk_1E6159900;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(internalQueue, v7);
}

uint64_t __68__WBSKeyBagLockStatusManager_removeKeyBagLockStatusChangedObserver___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 8) containsObject:*(void *)(a1 + 40)];
  if (result)
  {
    [*(id *)(*(void *)(a1 + 32) + 8) removeObject:*(void *)(a1 + 40)];
    uint64_t result = [*(id *)(*(void *)(a1 + 32) + 8) count];
    if (!result)
    {
      uint64_t v3 = *(void **)(a1 + 32);
      return [v3 _stopObservingKeyBagLockStatusChanges];
    }
  }
  return result;
}

- (BOOL)isLockedOrAboutToLock
{
  return [(WBSKeyBagLockStatusManager *)self keyBagLockStatus] != 0;
}

- (BOOL)isKeyBagEnabled
{
  soft_MKBGetDeviceLockState((const __CFDictionary *)self);
  return (v2 > 3) | (7u >> (v2 & 0xF)) & 1;
}

void __68__WBSKeyBagLockStatusManager__startObservingKeyBagLockStatusChanges__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unsigned int v2 = WeakRetained;
  if (WeakRetained)
  {
    activity_block[0] = MEMORY[0x1E4F143A8];
    activity_block[1] = 3221225472;
    activity_block[2] = __68__WBSKeyBagLockStatusManager__startObservingKeyBagLockStatusChanges__block_invoke_2;
    activity_block[3] = &unk_1E6159820;
    activity_block[4] = WeakRetained;
    _os_activity_initiate(&dword_1B728F000, "Key Bag: Lock Status Changed", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
  }
}

void __68__WBSKeyBagLockStatusManager__startObservingKeyBagLockStatusChanges__block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  unsigned int v2 = (id)WBS_LOG_CHANNEL_PREFIXKeychain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "_descriptionOfKeyBagLockStatus:", objc_msgSend(*(id *)(a1 + 32), "keyBagLockStatus"));
    *(_DWORD *)buf = 138543362;
    v15 = v3;
    _os_log_impl(&dword_1B728F000, v2, OS_LOG_TYPE_DEFAULT, "Lock status of the device has changed to: %{public}@", buf, 0xCu);
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = *(id *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v7), "handler", (void)v9);
        id v8 = (void (**)(void))objc_claimAutoreleasedReturnValue();
        v8[2]();

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

uint64_t __68__WBSKeyBagLockStatusManager__startObservingKeyBagLockStatusChanges__block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __68__WBSKeyBagLockStatusManager__startObservingKeyBagLockStatusChanges__block_invoke_2_10(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_stopObservingKeyBagLockStatusChanges
{
  int notifyTokenLockStatusChanged = self->_notifyTokenLockStatusChanged;
  if (notifyTokenLockStatusChanged)
  {
    notify_cancel(notifyTokenLockStatusChanged);
    self->_int notifyTokenLockStatusChanged = 0;
  }
  int notifyTokenFirstUnlock = self->_notifyTokenFirstUnlock;
  if (notifyTokenFirstUnlock)
  {
    notify_cancel(notifyTokenFirstUnlock);
    self->_int notifyTokenFirstUnlock = 0;
  }
}

- (id)_descriptionOfKeyBagLockStatus:(int64_t)a3
{
  uint64_t v3 = @"locked";
  if (a3 == 1) {
    uint64_t v3 = @"locking";
  }
  if (a3) {
    return v3;
  }
  else {
    return @"unlocked";
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_handlers, 0);
}

@end