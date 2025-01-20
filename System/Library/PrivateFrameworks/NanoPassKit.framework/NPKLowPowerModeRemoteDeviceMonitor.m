@interface NPKLowPowerModeRemoteDeviceMonitor
+ (id)sharedInstance;
- (BOOL)isLowPowerModeEnabled;
- (NPKLowPowerModeRemoteDeviceMonitor)init;
- (id)_currentDeviceDomainAccessor;
- (void)_sendLowPowerModeEnabled:(BOOL)a3 toObserver:(id)a4;
- (void)_sendLowPowerModeEnabledStateToObservers;
- (void)dealloc;
- (void)registerObserver:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation NPKLowPowerModeRemoteDeviceMonitor

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1) {
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_12);
  }
  v2 = (void *)sharedInstance_monitor_0;
  return v2;
}

void __52__NPKLowPowerModeRemoteDeviceMonitor_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(NPKLowPowerModeRemoteDeviceMonitor);
  v1 = (void *)sharedInstance_monitor_0;
  sharedInstance_monitor_0 = (uint64_t)v0;
}

- (NPKLowPowerModeRemoteDeviceMonitor)init
{
  v7.receiver = self;
  v7.super_class = (Class)NPKLowPowerModeRemoteDeviceMonitor;
  v2 = [(NPKLowPowerModeRemoteDeviceMonitor *)&v7 init];
  if (v2)
  {
    v3 = objc_alloc_init(NPKThreadSafeObserverManager);
    observersManager = v2->_observersManager;
    v2->_observersManager = &v3->super;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)lowPowerModeChangedNotification, @"com.apple.Carousel.LowPowerMode", 0, CFNotificationSuspensionBehaviorCoalesce);
  }
  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.Carousel.LowPowerMode", 0);
  v4.receiver = self;
  v4.super_class = (Class)NPKLowPowerModeRemoteDeviceMonitor;
  [(NPKLowPowerModeRemoteDeviceMonitor *)&v4 dealloc];
}

- (BOOL)isLowPowerModeEnabled
{
  v2 = [(NPKLowPowerModeRemoteDeviceMonitor *)self _currentDeviceDomainAccessor];
  id v3 = (id)[v2 synchronize];
  char v4 = [v2 BOOLForKey:@"LowPowerMode"];

  return v4;
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  [(NPKObserverManager *)self->_observersManager registerObserver:v4];
  BOOL v5 = [(NPKLowPowerModeRemoteDeviceMonitor *)self isLowPowerModeEnabled];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__NPKLowPowerModeRemoteDeviceMonitor_registerObserver___block_invoke;
  v7[3] = &unk_2644D3E10;
  BOOL v9 = v5;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  NPKGuaranteeMainThread(v7);
}

uint64_t __55__NPKLowPowerModeRemoteDeviceMonitor_registerObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendLowPowerModeEnabled:*(unsigned __int8 *)(a1 + 48) toObserver:*(void *)(a1 + 40)];
}

- (void)unregisterObserver:(id)a3
{
  observersManager = self->_observersManager;
  id v4 = a3;
  [(NPKObserverManager *)observersManager unregisterObserver:v4];
}

- (void)_sendLowPowerModeEnabledStateToObservers
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  BOOL v3 = [(NPKLowPowerModeRemoteDeviceMonitor *)self isLowPowerModeEnabled];
  id v4 = pk_General_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    id v6 = pk_General_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v7 = @"disabled";
      if (v3) {
        objc_super v7 = @"enabled";
      }
      *(_DWORD *)buf = 138412290;
      v11 = v7;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: NPKLowPowerModeMonitor: Sending low power mode %@ state to observers.", buf, 0xCu);
    }
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __78__NPKLowPowerModeRemoteDeviceMonitor__sendLowPowerModeEnabledStateToObservers__block_invoke;
  v8[3] = &unk_2644D2938;
  v8[4] = self;
  BOOL v9 = v3;
  NPKGuaranteeMainThread(v8);
}

uint64_t __78__NPKLowPowerModeRemoteDeviceMonitor__sendLowPowerModeEnabledStateToObservers__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 8);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __78__NPKLowPowerModeRemoteDeviceMonitor__sendLowPowerModeEnabledStateToObservers__block_invoke_2;
  v4[3] = &unk_2644D4C18;
  v4[4] = v1;
  char v5 = *(unsigned char *)(a1 + 40);
  return [v2 enumerateObserversUsingBlock:v4];
}

uint64_t __78__NPKLowPowerModeRemoteDeviceMonitor__sendLowPowerModeEnabledStateToObservers__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _sendLowPowerModeEnabled:*(unsigned __int8 *)(a1 + 40) toObserver:a2];
}

- (void)_sendLowPowerModeEnabled:(BOOL)a3 toObserver:(id)a4
{
  BOOL v4 = a3;
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a4;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  objc_super v7 = pk_General_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    BOOL v9 = pk_General_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = @"disabled";
      if (v4) {
        v10 = @"enabled";
      }
      int v11 = 138412546;
      uint64_t v12 = v10;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_21E92F000, v9, OS_LOG_TYPE_DEFAULT, "Notice: NPKLowPowerModeMonitor: Sending low power mode %@ state to observer %@.", (uint8_t *)&v11, 0x16u);
    }
  }
  [v6 lowPowerModeMonitor:self didUpdateLowPowerModeEnabled:v4];
}

- (id)_currentDeviceDomainAccessor
{
  return NPKDomainAccessorForDomain(@"com.apple.Carousel");
}

- (void).cxx_destruct
{
}

@end