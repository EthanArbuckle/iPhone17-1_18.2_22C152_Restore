@interface VTVoiceTriggerEnabledMonitor
+ (id)sharedInstance;
- (BOOL)_checkVoiceTriggerEnabled;
- (BOOL)isEnabled;
- (VTVoiceTriggerEnabledMonitor)init;
- (void)_didReceiveVoiceTriggerSettingChanged:(BOOL)a3;
- (void)_didReceiveVoiceTriggerSettingChangedInQueue:(BOOL)a3;
- (void)_notifyObserver:(id)a3 withEnabled:(BOOL)a4;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_stopMonitoring;
@end

@implementation VTVoiceTriggerEnabledMonitor

- (BOOL)_checkVoiceTriggerEnabled
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = +[VTPreferences sharedPreferences];
  int v3 = [v2 voiceTriggerEnabled];

  v4 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v5 = @"NO";
    if (v3) {
      v5 = @"YES";
    }
    int v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_21844F000, v4, OS_LOG_TYPE_DEFAULT, "VoiceTrigger enabled = %{public}@", (uint8_t *)&v7, 0xCu);
  }
  return v3;
}

- (BOOL)isEnabled
{
  return self->_isVoiceTriggerEnabled;
}

- (void)_notifyObserver:(id)a3 withEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(VTEventMonitor *)self notifyObserver:v6];
  if (objc_opt_respondsToSelector()) {
    [v6 VTVoiceTriggerEnabledMonitor:self didReceiveEnabled:v4];
  }
}

- (void)_didReceiveVoiceTriggerSettingChanged:(BOOL)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __70__VTVoiceTriggerEnabledMonitor__didReceiveVoiceTriggerSettingChanged___block_invoke;
  v3[3] = &unk_264325C80;
  v3[4] = self;
  BOOL v4 = a3;
  [(VTEventMonitor *)self enumerateObservers:v3];
}

uint64_t __70__VTVoiceTriggerEnabledMonitor__didReceiveVoiceTriggerSettingChanged___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _notifyObserver:a2 withEnabled:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_didReceiveVoiceTriggerSettingChangedInQueue:(BOOL)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __77__VTVoiceTriggerEnabledMonitor__didReceiveVoiceTriggerSettingChangedInQueue___block_invoke;
  v3[3] = &unk_264325C80;
  v3[4] = self;
  BOOL v4 = a3;
  [(VTEventMonitor *)self enumerateObserversInQueue:v3];
}

uint64_t __77__VTVoiceTriggerEnabledMonitor__didReceiveVoiceTriggerSettingChangedInQueue___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _notifyObserver:a2 withEnabled:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_stopMonitoring
{
  int notifyToken = self->_notifyToken;
  if (notifyToken != -1)
  {
    BOOL v4 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_21844F000, v4, OS_LOG_TYPE_DEFAULT, "Stop monitring : VoiceTrigger setting switch", v5, 2u);
      int notifyToken = self->_notifyToken;
    }
    notify_cancel(notifyToken);
    self->_int notifyToken = -1;
  }
}

- (void)_startMonitoringWithQueue:(id)a3
{
  BOOL v4 = a3;
  if (self->_notifyToken == -1)
  {
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __58__VTVoiceTriggerEnabledMonitor__startMonitoringWithQueue___block_invoke;
    handler[3] = &unk_264325C58;
    handler[4] = self;
    notify_register_dispatch("com.apple.coreaudio.BorealisToggled", &self->_notifyToken, v4, handler);
    v5 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7) = 0;
      id v6 = "Start monitring : VoiceTrigger setting switch";
      goto LABEL_6;
    }
  }
  else
  {
    v5 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7) = 0;
      id v6 = "Cannot start monitoring VoiceTrigger setting switch because it was already started";
LABEL_6:
      _os_log_impl(&dword_21844F000, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v7, 2u);
    }
  }
  self->_isVoiceTriggerEnabled = [(VTVoiceTriggerEnabledMonitor *)self _checkVoiceTriggerEnabled];
}

uint64_t __58__VTVoiceTriggerEnabledMonitor__startMonitoringWithQueue___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 28) = [*(id *)(a1 + 32) _checkVoiceTriggerEnabled];
  v2 = *(unsigned __int8 **)(a1 + 32);
  uint64_t v3 = v2[28];

  return [v2 _didReceiveVoiceTriggerSettingChanged:v3];
}

- (VTVoiceTriggerEnabledMonitor)init
{
  v3.receiver = self;
  v3.super_class = (Class)VTVoiceTriggerEnabledMonitor;
  result = [(VTEventMonitor *)&v3 init];
  if (result)
  {
    result->_int notifyToken = -1;
    result->_isVoiceTriggerEnabled = 0;
  }
  return result;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_4832 != -1) {
    dispatch_once(&sharedInstance_onceToken_4832, &__block_literal_global_4833);
  }
  v2 = (void *)sharedInstance__sharedInstance_4834;

  return v2;
}

uint64_t __46__VTVoiceTriggerEnabledMonitor_sharedInstance__block_invoke()
{
  sharedInstance__sharedInstance_4834 = objc_alloc_init(VTVoiceTriggerEnabledMonitor);

  return MEMORY[0x270F9A758]();
}

@end