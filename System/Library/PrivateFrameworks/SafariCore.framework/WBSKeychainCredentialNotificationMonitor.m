@interface WBSKeychainCredentialNotificationMonitor
- (WBSKeychainCredentialNotificationMonitor)init;
- (WBSKeychainCredentialNotificationMonitor)initWithCoalescingInterval:(double)a3;
- (id)addObserverWithBlock:(id)a3;
- (void)_cancelCoalescingTimer;
- (void)_notifyKeybagUnlocked;
- (void)_notifyKeychainUpdated;
- (void)_notifyObservers;
- (void)dealloc;
- (void)removeObserverForToken:(id)a3;
- (void)triggerExternalNotification;
@end

@implementation WBSKeychainCredentialNotificationMonitor

- (id)addObserverWithBlock:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F29128] UUID];
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__WBSKeychainCredentialNotificationMonitor_addObserverWithBlock___block_invoke;
  block[3] = &unk_1E615B068;
  block[4] = self;
  id v7 = v5;
  id v11 = v7;
  id v12 = v4;
  id v8 = v4;
  dispatch_async(internalQueue, block);

  return v7;
}

- (WBSKeychainCredentialNotificationMonitor)initWithCoalescingInterval:(double)a3
{
  v19.receiver = self;
  v19.super_class = (Class)WBSKeychainCredentialNotificationMonitor;
  id v4 = [(WBSKeychainCredentialNotificationMonitor *)&v19 init];
  if (v4)
  {
    objc_initWeak(&location, v4);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.SafariCore.WBSKeychainCredentialNotificationMonitor", 0);
    internalQueue = v4->_internalQueue;
    v4->_internalQueue = (OS_dispatch_queue *)v5;

    id v7 = dispatch_get_global_queue(21, 0);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __71__WBSKeychainCredentialNotificationMonitor_initWithCoalescingInterval___block_invoke;
    handler[3] = &unk_1E615B040;
    objc_copyWeak(&v17, &location);
    notify_register_dispatch("com.apple.security.view-change.Passwords", &v4->_keychainChangedNotificationToken, v7, handler);

    id v8 = +[WBSKeyBagLockStatusManager sharedManager];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __71__WBSKeychainCredentialNotificationMonitor_initWithCoalescingInterval___block_invoke_3;
    v14[3] = &unk_1E615AA60;
    objc_copyWeak(&v15, &location);
    uint64_t v9 = [v8 addKeyBagLockStatusChangedObserverWithHandler:v14];
    id keybagUnlockStatusChangedToken = v4->_keybagUnlockStatusChangedToken;
    v4->_id keybagUnlockStatusChangedToken = (id)v9;

    id v11 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v11 addObserver:v4 selector:sel_notifyModernKeychainUpdated name:@"com.apple.security.shared-items-changed" object:0];

    v4->_coalescingInterval = a3;
    id v12 = v4;
    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v4;
}

void __65__WBSKeychainCredentialNotificationMonitor_addObserverWithBlock___block_invoke(uint64_t a1)
{
  if (!*(void *)(*(void *)(a1 + 32) + 16))
  {
    uint64_t v2 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 16);
    *(void *)(v3 + 16) = v2;
  }
  id v5 = _Block_copy(*(const void **)(a1 + 48));
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "setObject:forKeyedSubscript:");
}

void __71__WBSKeychainCredentialNotificationMonitor_initWithCoalescingInterval___block_invoke(uint64_t a1)
{
  uint64_t v2 = WBS_LOG_CHANNEL_PREFIXKeychain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1B728F000, v2, OS_LOG_TYPE_DEFAULT, "Received keychain changed notification", v4, 2u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained notifyModernKeychainUpdated];
}

void __71__WBSKeychainCredentialNotificationMonitor_initWithCoalescingInterval___block_invoke_3(uint64_t a1)
{
  id v3 = +[WBSKeyBagLockStatusManager sharedManager];
  uint64_t v2 = [v3 keyBagLockStatus];

  if (!v2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _notifyKeybagUnlocked];
  }
}

- (WBSKeychainCredentialNotificationMonitor)init
{
  return [(WBSKeychainCredentialNotificationMonitor *)self initWithCoalescingInterval:0.0];
}

- (void)dealloc
{
  notify_cancel(self->_keychainChangedNotificationToken);
  id v3 = +[WBSKeyBagLockStatusManager sharedManager];
  [v3 removeKeyBagLockStatusChangedObserver:self->_keybagUnlockStatusChangedToken];

  v4.receiver = self;
  v4.super_class = (Class)WBSKeychainCredentialNotificationMonitor;
  [(WBSKeychainCredentialNotificationMonitor *)&v4 dealloc];
}

- (void)removeObserverForToken:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__WBSKeychainCredentialNotificationMonitor_removeObserverForToken___block_invoke;
  v7[3] = &unk_1E6159900;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

void __67__WBSKeychainCredentialNotificationMonitor_removeObserverForToken___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) removeObjectForKey:*(void *)(a1 + 40)];
  if (![*(id *)(*(void *)(a1 + 32) + 16) count])
  {
    uint64_t v2 = *(void *)(a1 + 32);
    id v3 = *(void **)(v2 + 16);
    *(void *)(v2 + 16) = 0;
  }
}

- (void)triggerExternalNotification
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__WBSKeychainCredentialNotificationMonitor_triggerExternalNotification__block_invoke;
  block[3] = &unk_1E6159820;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

uint64_t __71__WBSKeychainCredentialNotificationMonitor_triggerExternalNotification__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2[6])
  {
    [v2 _cancelCoalescingTimer];
    uint64_t v2 = *(void **)(a1 + 32);
  }
  return [v2 _notifyObservers];
}

- (void)_notifyKeybagUnlocked
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = WBS_LOG_CHANNEL_PREFIXKeychain();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 134217984;
    id v5 = self;
    _os_log_impl(&dword_1B728F000, v3, OS_LOG_TYPE_INFO, "Notification monitor <%p> notifying observers immediately that the keybag was unlocked", (uint8_t *)&v4, 0xCu);
  }
  [(WBSKeychainCredentialNotificationMonitor *)self triggerExternalNotification];
}

- (void)_notifyKeychainUpdated
{
  objc_initWeak(&location, self);
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__WBSKeychainCredentialNotificationMonitor__notifyKeychainUpdated__block_invoke;
  block[3] = &unk_1E615B090;
  block[4] = self;
  objc_copyWeak(&v5, &location);
  dispatch_async(internalQueue, block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __66__WBSKeychainCredentialNotificationMonitor__notifyKeychainUpdated__block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(double *)(v2 + 32) == 0.0)
  {
    uint64_t v9 = WBS_LOG_CHANNEL_PREFIXKeychain();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134217984;
      uint64_t v23 = v10;
      _os_log_impl(&dword_1B728F000, v9, OS_LOG_TYPE_INFO, "Notification monitor <%p> notifying observers immediately that keychain updated because no coalescing interval is set", buf, 0xCu);
    }
    goto LABEL_9;
  }
  if (!*(void *)(v2 + 40)
    || ([MEMORY[0x1E4F1C9C8] date],
        id v3 = objc_claimAutoreleasedReturnValue(),
        [v3 timeIntervalSinceDate:*(void *)(*(void *)(a1 + 32) + 40)],
        double v5 = v4,
        double v6 = *(double *)(*(void *)(a1 + 32) + 32),
        v3,
        v5 > v6))
  {
    id v7 = WBS_LOG_CHANNEL_PREFIXKeychain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134217984;
      uint64_t v23 = v8;
      _os_log_impl(&dword_1B728F000, v7, OS_LOG_TYPE_INFO, "Notification monitor <%p> notifying observers immediately that keychain updated because enough time has elapsed", buf, 0xCu);
    }
LABEL_9:
    [*(id *)(a1 + 32) _notifyObservers];
    return;
  }
  uint64_t v11 = *(void *)(a1 + 32);
  if (*(void *)(v11 + 48))
  {
    id v12 = WBS_LOG_CHANNEL_PREFIXKeychain();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134217984;
      uint64_t v23 = v13;
      _os_log_impl(&dword_1B728F000, v12, OS_LOG_TYPE_INFO, "Notification monitor <%p> not notifying observers immediately that keychain updated because we have a coalescing timer running", buf, 0xCu);
    }
  }
  else
  {
    dispatch_source_t v14 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, *(dispatch_queue_t *)(v11 + 8));
    uint64_t v16 = *(void *)(a1 + 32);
    id v15 = (id *)(a1 + 32);
    id v17 = *(void **)(v16 + 48);
    *(void *)(v16 + 48) = v14;

    dispatch_time_t v18 = dispatch_time(0, (uint64_t)(*((double *)*v15 + 4) * 1000000000.0));
    dispatch_source_set_timer(*((dispatch_source_t *)*v15 + 6), v18, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(*((double *)*v15 + 4) * 0.1 * 1000000000.0));
    objc_super v19 = *((void *)*v15 + 6);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __66__WBSKeychainCredentialNotificationMonitor__notifyKeychainUpdated__block_invoke_13;
    handler[3] = &unk_1E615AA60;
    objc_copyWeak(&v21, v15 + 1);
    dispatch_source_set_event_handler(v19, handler);
    dispatch_resume(*((dispatch_object_t *)*v15 + 6));
    objc_destroyWeak(&v21);
  }
}

void __66__WBSKeychainCredentialNotificationMonitor__notifyKeychainUpdated__block_invoke_13(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = WBS_LOG_CHANNEL_PREFIXKeychain();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      int v3 = 134217984;
      id v4 = WeakRetained;
      _os_log_impl(&dword_1B728F000, v2, OS_LOG_TYPE_INFO, "Notification monitor <%p> notifying observers that keychain updated after coalescing interval", (uint8_t *)&v3, 0xCu);
    }
    [WeakRetained _notifyObservers];
    [WeakRetained _cancelCoalescingTimer];
  }
}

- (void)_cancelCoalescingTimer
{
  dispatch_source_cancel((dispatch_source_t)self->_coalescingTimer);
  coalescingTimer = self->_coalescingTimer;
  self->_coalescingTimer = 0;
}

- (void)_notifyObservers
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  int v3 = [(NSMutableDictionary *)self->_observers allValues];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v9 + 1) + 8 * v6++) + 16))();
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }

  id v7 = [MEMORY[0x1E4F1C9C8] date];
  lastNotificationTime = self->_lastNotificationTime;
  self->_lastNotificationTime = v7;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_keybagUnlockStatusChangedToken, 0);
  objc_storeStrong((id *)&self->_coalescingTimer, 0);
  objc_storeStrong((id *)&self->_lastNotificationTime, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

@end