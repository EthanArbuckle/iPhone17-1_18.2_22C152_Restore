@interface STDeviceUnlockStateListener
- (BOOL)deviceIsLocked;
- (STDeviceUnlockStateListener)init;
- (id)lockStateChangeHandler;
- (void)dealloc;
- (void)setLockStateChangeHandler:(id)a3;
@end

@implementation STDeviceUnlockStateListener

- (STDeviceUnlockStateListener)init
{
  v10.receiver = self;
  v10.super_class = (Class)STDeviceUnlockStateListener;
  v2 = [(STDeviceUnlockStateListener *)&v10 init];
  if (v2)
  {
    objc_initWeak(&location, v2);
    if (MKBDeviceFormattedForContentProtection())
    {
      v3 = (const char *)*MEMORY[0x263F55A78];
      v4 = MEMORY[0x263EF83A0];
      id v5 = MEMORY[0x263EF83A0];
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __35__STDeviceUnlockStateListener_init__block_invoke;
      v7[3] = &unk_264767BB0;
      objc_copyWeak(&v8, &location);
      notify_register_dispatch(v3, &v2->_notifyToken, v4, v7);

      objc_destroyWeak(&v8);
    }
    objc_destroyWeak(&location);
  }
  return v2;
}

void __35__STDeviceUnlockStateListener_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [MEMORY[0x263F671D8] deviceState];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_225B06000, v2, OS_LOG_TYPE_DEFAULT, "Device lock stated changed", v4, 2u);
  }

  v3 = [WeakRetained lockStateChangeHandler];
  if (v3) {
    v3[2](v3, [WeakRetained deviceIsLocked]);
  }
}

- (void)dealloc
{
  notify_cancel(self->_notifyToken);
  v3.receiver = self;
  v3.super_class = (Class)STDeviceUnlockStateListener;
  [(STDeviceUnlockStateListener *)&v3 dealloc];
}

- (BOOL)deviceIsLocked
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v2 = MKBGetDeviceLockState();
  objc_super v3 = [MEMORY[0x263F671D8] deviceState];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v2;
    _os_log_impl(&dword_225B06000, v3, OS_LOG_TYPE_DEFAULT, "Device lock state %d", (uint8_t *)v6, 8u);
  }

  if (v2) {
    BOOL v4 = v2 == 3;
  }
  else {
    BOOL v4 = 1;
  }
  return !v4;
}

- (id)lockStateChangeHandler
{
  return self->_lockStateChangeHandler;
}

- (void)setLockStateChangeHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end