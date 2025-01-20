@interface VTBatteryMonitor
+ (id)sharedInstance;
- (VTBatteryMonitor)init;
- (unsigned)_checkBatteryState;
- (unsigned)batteryState;
- (void)_didReceiveBatteryStatusChanged:(unsigned __int8)a3;
- (void)_didReceiveBatteryStatusChangedInQueue:(unsigned __int8)a3;
- (void)_notifyObserver:(id)a3 withBatteryState:(unsigned __int8)a4;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_stopMonitoring;
@end

@implementation VTBatteryMonitor

- (unsigned)_checkBatteryState
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v2 = IOPSDrawingUnlimitedPower();
  v3 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v4 = @"Battery";
    if (v2) {
      v4 = @"Charger";
    }
    int v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_21844F000, v3, OS_LOG_TYPE_DEFAULT, "Power source : %{public}@", (uint8_t *)&v6, 0xCu);
  }
  if (v2) {
    return 1;
  }
  else {
    return 2;
  }
}

- (unsigned)batteryState
{
  return self->_batteryState;
}

- (void)_notifyObserver:(id)a3 withBatteryState:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  [(VTEventMonitor *)self notifyObserver:v6];
  if (objc_opt_respondsToSelector()) {
    [v6 VTBatteryMonitor:self didReceiveBatteryStatusChanged:v4];
  }
}

- (void)_didReceiveBatteryStatusChanged:(unsigned __int8)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __52__VTBatteryMonitor__didReceiveBatteryStatusChanged___block_invoke;
  v3[3] = &unk_264325C80;
  v3[4] = self;
  unsigned __int8 v4 = a3;
  [(VTEventMonitor *)self enumerateObservers:v3];
}

uint64_t __52__VTBatteryMonitor__didReceiveBatteryStatusChanged___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _notifyObserver:a2 withBatteryState:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_didReceiveBatteryStatusChangedInQueue:(unsigned __int8)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __59__VTBatteryMonitor__didReceiveBatteryStatusChangedInQueue___block_invoke;
  v3[3] = &unk_264325C80;
  v3[4] = self;
  unsigned __int8 v4 = a3;
  [(VTEventMonitor *)self enumerateObserversInQueue:v3];
}

uint64_t __59__VTBatteryMonitor__didReceiveBatteryStatusChangedInQueue___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _notifyObserver:a2 withBatteryState:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_stopMonitoring
{
  int notifyToken = self->_notifyToken;
  if (notifyToken != -1)
  {
    notify_cancel(notifyToken);
    self->_int notifyToken = -1;
    unsigned __int8 v4 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_21844F000, v4, OS_LOG_TYPE_DEFAULT, "Stop monitoring : Power source", v5, 2u);
    }
  }
}

- (void)_startMonitoringWithQueue:(id)a3
{
  unsigned __int8 v4 = a3;
  if (self->_notifyToken == -1)
  {
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __46__VTBatteryMonitor__startMonitoringWithQueue___block_invoke;
    handler[3] = &unk_264325C58;
    handler[4] = self;
    notify_register_dispatch("com.apple.system.powersources.source", &self->_notifyToken, v4, handler);
    v5 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7) = 0;
      id v6 = "Start monitoring : Power source";
      goto LABEL_6;
    }
  }
  else
  {
    v5 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7) = 0;
      id v6 = "Cannot start monitoring power source because it was already started";
LABEL_6:
      _os_log_impl(&dword_21844F000, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v7, 2u);
    }
  }
  self->_batteryState = [(VTBatteryMonitor *)self _checkBatteryState];
}

uint64_t __46__VTBatteryMonitor__startMonitoringWithQueue___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 28) = [*(id *)(a1 + 32) _checkBatteryState];
  int v2 = *(unsigned __int8 **)(a1 + 32);
  uint64_t v3 = v2[28];

  return [v2 _didReceiveBatteryStatusChanged:v3];
}

- (VTBatteryMonitor)init
{
  v3.receiver = self;
  v3.super_class = (Class)VTBatteryMonitor;
  result = [(VTEventMonitor *)&v3 init];
  if (result)
  {
    result->_int notifyToken = -1;
    result->_batteryState = 0;
  }
  return result;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_3961 != -1) {
    dispatch_once(&sharedInstance_onceToken_3961, &__block_literal_global_3962);
  }
  int v2 = (void *)sharedInstance__sharedInstance_3963;

  return v2;
}

uint64_t __34__VTBatteryMonitor_sharedInstance__block_invoke()
{
  sharedInstance__sharedInstance_3963 = objc_alloc_init(VTBatteryMonitor);

  return MEMORY[0x270F9A758]();
}

@end