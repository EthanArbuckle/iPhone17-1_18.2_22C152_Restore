@interface VTFirstUnlockMonitor
+ (id)sharedInstance;
- (BOOL)_checkFirstUnlocked;
- (BOOL)isFirstUnlocked;
- (VTFirstUnlockMonitor)init;
- (void)_didReceiveFirstUnlock:(BOOL)a3;
- (void)_didReceiveFirstUnlockInQueue:(BOOL)a3;
- (void)_notifyObserver:(id)a3 withUnlocked:(BOOL)a4;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_stopMonitoring;
@end

@implementation VTFirstUnlockMonitor

- (BOOL)_checkFirstUnlocked
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v2 = MKBDeviceUnlockedSinceBoot();
  v3 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v4 = @"YES";
    if (!v2) {
      v4 = @"NO";
    }
    int v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_21844F000, v3, OS_LOG_TYPE_DEFAULT, "Unlocked since boot = %{public}@", (uint8_t *)&v6, 0xCu);
  }
  return v2 == 1;
}

- (BOOL)isFirstUnlocked
{
  return self->_firstUnlocked;
}

- (void)_notifyObserver:(id)a3 withUnlocked:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(VTEventMonitor *)self notifyObserver:v6];
  if (objc_opt_respondsToSelector()) {
    [v6 VTFirstUnlockMonitor:self didReceiveFirstUnlock:v4];
  }
}

- (void)_didReceiveFirstUnlock:(BOOL)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __47__VTFirstUnlockMonitor__didReceiveFirstUnlock___block_invoke;
  v3[3] = &unk_264325C80;
  v3[4] = self;
  BOOL v4 = a3;
  [(VTEventMonitor *)self enumerateObservers:v3];
}

uint64_t __47__VTFirstUnlockMonitor__didReceiveFirstUnlock___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _notifyObserver:a2 withUnlocked:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_didReceiveFirstUnlockInQueue:(BOOL)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __54__VTFirstUnlockMonitor__didReceiveFirstUnlockInQueue___block_invoke;
  v3[3] = &unk_264325C80;
  v3[4] = self;
  BOOL v4 = a3;
  [(VTEventMonitor *)self enumerateObserversInQueue:v3];
}

uint64_t __54__VTFirstUnlockMonitor__didReceiveFirstUnlockInQueue___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _notifyObserver:a2 withUnlocked:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_stopMonitoring
{
  int notifyToken = self->_notifyToken;
  if (notifyToken != -1)
  {
    notify_cancel(notifyToken);
    self->_int notifyToken = -1;
    BOOL v4 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_21844F000, v4, OS_LOG_TYPE_DEFAULT, "Stop monitoring : First unlock", v5, 2u);
    }
  }
}

- (void)_startMonitoringWithQueue:(id)a3
{
  BOOL v4 = a3;
  if (self->_notifyToken == -1)
  {
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __50__VTFirstUnlockMonitor__startMonitoringWithQueue___block_invoke;
    handler[3] = &unk_264325C58;
    handler[4] = self;
    notify_register_dispatch("com.apple.mobile.keybagd.first_unlock", &self->_notifyToken, v4, handler);
    v5 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7) = 0;
      id v6 = "Start monitoring : First unlock";
      goto LABEL_6;
    }
  }
  else
  {
    v5 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7) = 0;
      id v6 = "Cannot start monitoring first unlock because it was already started";
LABEL_6:
      _os_log_impl(&dword_21844F000, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v7, 2u);
    }
  }
  self->_firstUnlocked = [(VTFirstUnlockMonitor *)self _checkFirstUnlocked];
}

uint64_t __50__VTFirstUnlockMonitor__startMonitoringWithQueue___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 28) = [*(id *)(a1 + 32) _checkFirstUnlocked];
  int v2 = *(unsigned __int8 **)(a1 + 32);
  uint64_t v3 = v2[28];

  return [v2 _didReceiveFirstUnlock:v3];
}

- (VTFirstUnlockMonitor)init
{
  v3.receiver = self;
  v3.super_class = (Class)VTFirstUnlockMonitor;
  result = [(VTEventMonitor *)&v3 init];
  if (result)
  {
    result->_int notifyToken = -1;
    result->_firstUnlocked = 0;
  }
  return result;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_5842 != -1) {
    dispatch_once(&sharedInstance_onceToken_5842, &__block_literal_global_5843);
  }
  int v2 = (void *)sharedInstance__sharedInstance_5844;

  return v2;
}

uint64_t __38__VTFirstUnlockMonitor_sharedInstance__block_invoke()
{
  sharedInstance__sharedInstance_5844 = objc_alloc_init(VTFirstUnlockMonitor);

  return MEMORY[0x270F9A758]();
}

@end