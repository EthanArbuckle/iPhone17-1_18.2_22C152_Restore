@interface POKeyBag
- (BOOL)firstUnlock;
- (BOOL)isUserKeybagUnlocked;
- (POKeyBag)init;
- (id)lockHandler;
- (id)startupCompletion;
- (id)unlockCompletion;
- (void)dealloc;
- (void)isUserKeybagUnlocked;
- (void)setFirstUnlock:(BOOL)a3;
- (void)setLockHandler:(id)a3;
- (void)setStartupCompletion:(id)a3;
- (void)setUnlockCompletion:(id)a3;
- (void)startObservingKeyBagLockStatusChanges;
- (void)stopObservingKeyBagLockStatusChanges;
- (void)waitForKeyBagFirstUnlockOnStartupWithCompletion:(id)a3;
- (void)waitForKeyBagUnlockWithCompletion:(id)a3;
@end

@implementation POKeyBag

- (POKeyBag)init
{
  v3.receiver = self;
  v3.super_class = (Class)POKeyBag;
  result = [(POKeyBag *)&v3 init];
  if (result)
  {
    result->_firstUnlock = 0;
    result->_notifyToken = 0;
  }
  return result;
}

- (void)dealloc
{
  [(POKeyBag *)self stopObservingKeyBagLockStatusChanges];
  v3.receiver = self;
  v3.super_class = (Class)POKeyBag;
  [(POKeyBag *)&v3 dealloc];
}

- (BOOL)isUserKeybagUnlocked
{
  int v2 = MKBGetDeviceLockState();
  objc_super v3 = PO_LOG_POKeyBag();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    [(POKeyBag *)v2 isUserKeybagUnlocked];
  }

  return v2 == 0;
}

- (void)waitForKeyBagUnlockWithCompletion:(id)a3
{
  v5 = (void (**)(void))a3;
  v4 = self;
  objc_sync_enter(v4);
  if ([(POKeyBag *)v4 isUserKeybagUnlocked]) {
    v5[2](v5);
  }
  else {
    [(POKeyBag *)v4 setUnlockCompletion:v5];
  }
  objc_sync_exit(v4);
}

- (void)waitForKeyBagFirstUnlockOnStartupWithCompletion:(id)a3
{
  v5 = (void (**)(void))a3;
  v4 = self;
  objc_sync_enter(v4);
  if ([(POKeyBag *)v4 firstUnlock] || [(POKeyBag *)v4 isUserKeybagUnlocked]) {
    v5[2]();
  }
  else {
    [(POKeyBag *)v4 setStartupCompletion:v5];
  }
  objc_sync_exit(v4);
}

- (void)startObservingKeyBagLockStatusChanges
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_259DFE000, a2, OS_LOG_TYPE_ERROR, "notify_register_dispatch failed: %u", (uint8_t *)v2, 8u);
}

void __49__POKeyBag_startObservingKeyBagLockStatusChanges__block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  int v3 = [*(id *)(a1 + 32) isUserKeybagUnlocked];
  v4 = PO_LOG_POKeyBag();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5) {
      __49__POKeyBag_startObservingKeyBagLockStatusChanges__block_invoke_cold_3();
    }

    [*(id *)(a1 + 32) setFirstUnlock:1];
    v6 = [*(id *)(a1 + 32) startupCompletion];

    if (v6)
    {
      v7 = PO_LOG_POKeyBag();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        __49__POKeyBag_startObservingKeyBagLockStatusChanges__block_invoke_cold_2();
      }

      v8 = [*(id *)(a1 + 32) startupCompletion];
      v8[2]();

      [*(id *)(a1 + 32) setStartupCompletion:0];
    }
    v9 = [*(id *)(a1 + 32) unlockCompletion];

    if (v9)
    {
      v10 = PO_LOG_POKeyBag();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        __49__POKeyBag_startObservingKeyBagLockStatusChanges__block_invoke_cold_1();
      }

      v11 = [*(id *)(a1 + 32) unlockCompletion];
      v11[2]();

      [*(id *)(a1 + 32) setUnlockCompletion:0];
    }
  }
  else
  {
    if (v5) {
      __49__POKeyBag_startObservingKeyBagLockStatusChanges__block_invoke_cold_4();
    }

    v12 = [*(id *)(a1 + 32) lockHandler];

    if (v12)
    {
      v13 = [*(id *)(a1 + 32) lockHandler];
      v13[2]();
    }
  }
  objc_sync_exit(v2);
}

- (void)stopObservingKeyBagLockStatusChanges
{
  int notifyToken = self->_notifyToken;
  if (notifyToken)
  {
    notify_cancel(notifyToken);
    self->_int notifyToken = 0;
  }
}

- (id)lockHandler
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setLockHandler:(id)a3
{
}

- (id)unlockCompletion
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setUnlockCompletion:(id)a3
{
}

- (id)startupCompletion
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setStartupCompletion:(id)a3
{
}

- (BOOL)firstUnlock
{
  return self->_firstUnlock;
}

- (void)setFirstUnlock:(BOOL)a3
{
  self->_firstUnlock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_startupCompletion, 0);
  objc_storeStrong(&self->_unlockCompletion, 0);
  objc_storeStrong(&self->_lockHandler, 0);
}

- (void)isUserKeybagUnlocked
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_259DFE000, a2, OS_LOG_TYPE_DEBUG, "unlock state %x", (uint8_t *)v2, 8u);
}

void __49__POKeyBag_startObservingKeyBagLockStatusChanges__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5(&dword_259DFE000, v0, v1, "calling completion", v2, v3, v4, v5, v6);
}

void __49__POKeyBag_startObservingKeyBagLockStatusChanges__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5(&dword_259DFE000, v0, v1, "calling startup completion", v2, v3, v4, v5, v6);
}

void __49__POKeyBag_startObservingKeyBagLockStatusChanges__block_invoke_cold_3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5(&dword_259DFE000, v0, v1, "keybag unlocked", v2, v3, v4, v5, v6);
}

void __49__POKeyBag_startObservingKeyBagLockStatusChanges__block_invoke_cold_4()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5(&dword_259DFE000, v0, v1, "keybag locked", v2, v3, v4, v5, v6);
}

@end