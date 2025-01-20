@interface NPKLowPowerModeLocalDeviceMonitor
+ (id)sharedInstance;
- (BOOL)isLowPowerModeEnabled;
- (NPKLowPowerModeLocalDeviceMonitor)init;
- (NPKLowPowerModeLocalDeviceMonitor)initWithNotificationCenter:(id)a3;
- (void)_lowPowerModeStateChanged:(id)a3;
- (void)_sendLowPowerModeEnabled:(BOOL)a3 toObserver:(id)a4;
- (void)_sendLowPowerModeEnabledStateToObservers:(BOOL)a3;
- (void)registerObserver:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation NPKLowPowerModeLocalDeviceMonitor

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_11);
  }
  v2 = (void *)sharedInstance_monitor;
  return v2;
}

void __51__NPKLowPowerModeLocalDeviceMonitor_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(NPKLowPowerModeLocalDeviceMonitor);
  v1 = (void *)sharedInstance_monitor;
  sharedInstance_monitor = (uint64_t)v0;
}

- (NPKLowPowerModeLocalDeviceMonitor)init
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  v4 = [(NPKLowPowerModeLocalDeviceMonitor *)self initWithNotificationCenter:v3];

  return v4;
}

- (NPKLowPowerModeLocalDeviceMonitor)initWithNotificationCenter:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NPKLowPowerModeLocalDeviceMonitor;
  v5 = [(NPKLowPowerModeLocalDeviceMonitor *)&v9 init];
  if (v5)
  {
    v6 = objc_alloc_init(NPKThreadSafeObserverManager);
    observersManager = v5->_observersManager;
    v5->_observersManager = &v6->super;

    [v4 addObserver:v5 selector:sel__lowPowerModeStateChanged_ name:*MEMORY[0x263F08450] object:0];
  }

  return v5;
}

- (BOOL)isLowPowerModeEnabled
{
  v2 = [MEMORY[0x263F08AB0] processInfo];
  char v3 = [v2 isLowPowerModeEnabled];

  return v3;
}

- (void)_lowPowerModeStateChanged:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __63__NPKLowPowerModeLocalDeviceMonitor__lowPowerModeStateChanged___block_invoke;
  v3[3] = &unk_2644D2910;
  v3[4] = self;
  NPKGuaranteeMainThread(v3);
}

uint64_t __63__NPKLowPowerModeLocalDeviceMonitor__lowPowerModeStateChanged___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) isLowPowerModeEnabled];
  char v3 = *(void **)(a1 + 32);
  return [v3 _sendLowPowerModeEnabledStateToObservers:v2];
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  [(NPKObserverManager *)self->_observersManager registerObserver:v4];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __54__NPKLowPowerModeLocalDeviceMonitor_registerObserver___block_invoke;
  v6[3] = &unk_2644D2E08;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  NPKGuaranteeMainThread(v6);
}

uint64_t __54__NPKLowPowerModeLocalDeviceMonitor_registerObserver___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) isLowPowerModeEnabled];
  char v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  return [v3 _sendLowPowerModeEnabled:v2 toObserver:v4];
}

- (void)unregisterObserver:(id)a3
{
  observersManager = self->_observersManager;
  id v4 = a3;
  [(NPKObserverManager *)observersManager unregisterObserver:v4];
}

- (void)_sendLowPowerModeEnabledStateToObservers:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = pk_General_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = pk_General_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = @"disabled";
      if (v3) {
        v8 = @"enabled";
      }
      *(_DWORD *)buf = 138412290;
      v13 = v8;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKLowPowerModeMonitor: Sending low power mode %@ state to observers.", buf, 0xCu);
    }
  }
  observersManager = self->_observersManager;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __78__NPKLowPowerModeLocalDeviceMonitor__sendLowPowerModeEnabledStateToObservers___block_invoke;
  v10[3] = &unk_2644D4C18;
  v10[4] = self;
  BOOL v11 = v3;
  [(NPKObserverManager *)observersManager enumerateObserversUsingBlock:v10];
}

uint64_t __78__NPKLowPowerModeLocalDeviceMonitor__sendLowPowerModeEnabledStateToObservers___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _sendLowPowerModeEnabled:*(unsigned __int8 *)(a1 + 40) toObserver:a2];
}

- (void)_sendLowPowerModeEnabled:(BOOL)a3 toObserver:(id)a4
{
  BOOL v4 = a3;
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a4;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v7 = pk_General_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    objc_super v9 = pk_General_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = @"disabled";
      if (v4) {
        v10 = @"enabled";
      }
      int v11 = 138412546;
      v12 = v10;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_21E92F000, v9, OS_LOG_TYPE_DEFAULT, "Notice: NPKLowPowerModeMonitor: Sending low power mode %@ state to observer %@.", (uint8_t *)&v11, 0x16u);
    }
  }
  [v6 lowPowerModeMonitor:self didUpdateLowPowerModeEnabled:v4];
}

- (void).cxx_destruct
{
}

@end