@interface VTLowPowerModeMonitor
+ (id)sharedInstance;
- (BOOL)isLowPowerMode;
- (VTLowPowerModeMonitor)init;
- (unsigned)_checkPowerMode;
- (unsigned)powerMode;
- (void)_didReceiveLowPowerModeChanged;
- (void)_didReceiveLowPowerModeChangedInQueue:(unsigned __int8)a3;
- (void)_notifyObserver:(id)a3 withPowerMode:(unsigned __int8)a4;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_stopMonitoring;
@end

@implementation VTLowPowerModeMonitor

- (BOOL)isLowPowerMode
{
  return self->_powerMode == 2;
}

- (unsigned)_checkPowerMode
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F08AB0] processInfo];
  int v3 = [v2 isLowPowerModeEnabled];

  v4 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v5 = @"NO";
    if (v3) {
      v5 = @"YES";
    }
    int v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_21844F000, v4, OS_LOG_TYPE_DEFAULT, "Low power mode : %{public}@", (uint8_t *)&v7, 0xCu);
  }
  if (v3) {
    return 2;
  }
  else {
    return 1;
  }
}

- (unsigned)powerMode
{
  return self->_powerMode;
}

- (void)_notifyObserver:(id)a3 withPowerMode:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  [(VTEventMonitor *)self notifyObserver:v6];
  if (objc_opt_respondsToSelector()) {
    [v6 VTLowPowerModeMonitor:self didReceivePowerModeChanged:v4];
  }
}

- (void)_didReceiveLowPowerModeChangedInQueue:(unsigned __int8)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __63__VTLowPowerModeMonitor__didReceiveLowPowerModeChangedInQueue___block_invoke;
  v3[3] = &unk_264325C80;
  v3[4] = self;
  unsigned __int8 v4 = a3;
  [(VTEventMonitor *)self enumerateObserversInQueue:v3];
}

uint64_t __63__VTLowPowerModeMonitor__didReceiveLowPowerModeChangedInQueue___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _notifyObserver:a2 withPowerMode:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_didReceiveLowPowerModeChanged
{
  uint64_t v3 = [(VTLowPowerModeMonitor *)self _checkPowerMode];
  self->_powerMode = v3;

  [(VTLowPowerModeMonitor *)self _didReceiveLowPowerModeChangedInQueue:v3];
}

- (void)_stopMonitoring
{
  uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F08450] object:0];

  unsigned __int8 v4 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21844F000, v4, OS_LOG_TYPE_DEFAULT, "Stop monitoring : Low power mode", v5, 2u);
  }
}

- (void)_startMonitoringWithQueue:(id)a3
{
  unsigned __int8 v4 = objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", a3);
  [v4 addObserver:self selector:sel__didReceiveLowPowerModeChanged name:*MEMORY[0x263F08450] object:0];

  v5 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_21844F000, v5, OS_LOG_TYPE_DEFAULT, "Start monitoring : Low power mode", v6, 2u);
  }
  self->_powerMode = [(VTLowPowerModeMonitor *)self _checkPowerMode];
}

- (VTLowPowerModeMonitor)init
{
  v3.receiver = self;
  v3.super_class = (Class)VTLowPowerModeMonitor;
  result = [(VTEventMonitor *)&v3 init];
  if (result) {
    result->_powerMode = 0;
  }
  return result;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2925 != -1) {
    dispatch_once(&sharedInstance_onceToken_2925, &__block_literal_global_2926);
  }
  v2 = (void *)sharedInstance__sharedInstance_2927;

  return v2;
}

uint64_t __39__VTLowPowerModeMonitor_sharedInstance__block_invoke()
{
  sharedInstance__sharedInstance_2927 = objc_alloc_init(VTLowPowerModeMonitor);

  return MEMORY[0x270F9A758]();
}

@end