@interface VTLockScreenMonitor
+ (id)sharedInstance;
- (VTLockScreenMonitor)init;
- (id)lockScreenStateDescription:(unsigned __int8)a3;
- (unsigned)_checkLockScreenState;
- (unsigned)lockScreenState;
- (void)_didReceiveLockScreenStateChanged:(unsigned __int8)a3;
- (void)_didReceiveLockScreenStateChangedInQueue:(unsigned __int8)a3;
- (void)_notifyObserver:(id)a3 withLockScreenState:(unsigned __int8)a4;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_stopMonitoring;
@end

@implementation VTLockScreenMonitor

- (void)_notifyObserver:(id)a3 withLockScreenState:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  [(VTEventMonitor *)self notifyObserver:v6];
  if (objc_opt_respondsToSelector()) {
    [v6 VTLockScreenMonitor:self receivedLockScreenStateChanged:v4];
  }
}

- (void)_didReceiveLockScreenStateChanged:(unsigned __int8)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __57__VTLockScreenMonitor__didReceiveLockScreenStateChanged___block_invoke;
  v3[3] = &unk_264325C80;
  v3[4] = self;
  unsigned __int8 v4 = a3;
  [(VTEventMonitor *)self enumerateObservers:v3];
}

uint64_t __57__VTLockScreenMonitor__didReceiveLockScreenStateChanged___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _notifyObserver:a2 withLockScreenState:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_didReceiveLockScreenStateChangedInQueue:(unsigned __int8)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __64__VTLockScreenMonitor__didReceiveLockScreenStateChangedInQueue___block_invoke;
  v3[3] = &unk_264325C80;
  v3[4] = self;
  unsigned __int8 v4 = a3;
  [(VTEventMonitor *)self enumerateObserversInQueue:v3];
}

uint64_t __64__VTLockScreenMonitor__didReceiveLockScreenStateChangedInQueue___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _notifyObserver:a2 withLockScreenState:*(unsigned __int8 *)(a1 + 40)];
}

- (id)lockScreenStateDescription:(unsigned __int8)a3
{
  if (a3 > 3u) {
    return @"Unknown";
  }
  else {
    return off_264325A98[a3];
  }
}

- (unsigned)_checkLockScreenState
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  unsigned int v3 = MKBGetDeviceLockState();
  if (v3 >= 4) {
    unsigned __int8 v4 = 4;
  }
  else {
    unsigned __int8 v4 = v3;
  }
  v5 = (void *)VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    v7 = [(VTLockScreenMonitor *)self lockScreenStateDescription:v4];
    int v9 = 138543362;
    v10 = v7;
    _os_log_impl(&dword_21844F000, v6, OS_LOG_TYPE_DEFAULT, "Locked with passcode : %{public}@", (uint8_t *)&v9, 0xCu);
  }
  return v4;
}

- (unsigned)lockScreenState
{
  return self->_lockScreenState;
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
      _os_log_impl(&dword_21844F000, v4, OS_LOG_TYPE_DEFAULT, "Stop monitoring : Locked with passcode", v5, 2u);
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
    handler[2] = __49__VTLockScreenMonitor__startMonitoringWithQueue___block_invoke;
    handler[3] = &unk_264325C58;
    handler[4] = self;
    notify_register_dispatch("com.apple.mobile.keybagd.lock_status", &self->_notifyToken, v4, handler);
    v5 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7) = 0;
      id v6 = "Start monitoring : Locked with passcode";
      goto LABEL_6;
    }
  }
  else
  {
    v5 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7) = 0;
      id v6 = "Cannot start monitoring Locked with passcode because it was already started";
LABEL_6:
      _os_log_impl(&dword_21844F000, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v7, 2u);
    }
  }
  self->_lockScreenState = [(VTLockScreenMonitor *)self _checkLockScreenState];
}

uint64_t __49__VTLockScreenMonitor__startMonitoringWithQueue___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 28) = [*(id *)(a1 + 32) _checkLockScreenState];
  v2 = *(unsigned __int8 **)(a1 + 32);
  uint64_t v3 = v2[28];

  return [v2 _didReceiveLockScreenStateChanged:v3];
}

- (VTLockScreenMonitor)init
{
  v3.receiver = self;
  v3.super_class = (Class)VTLockScreenMonitor;
  result = [(VTEventMonitor *)&v3 init];
  if (result)
  {
    result->_int notifyToken = -1;
    result->_lockScreenState = 4;
  }
  return result;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_4697 != -1) {
    dispatch_once(&sharedInstance_onceToken_4697, &__block_literal_global_4698);
  }
  v2 = (void *)sharedInstance__sharedInstance_4699;

  return v2;
}

uint64_t __37__VTLockScreenMonitor_sharedInstance__block_invoke()
{
  sharedInstance__sharedInstance_4699 = objc_alloc_init(VTLockScreenMonitor);

  return MEMORY[0x270F9A758]();
}

@end