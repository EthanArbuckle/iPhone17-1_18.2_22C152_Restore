@interface VTSiriEnabledMonitor
+ (id)sharedInstance;
- (BOOL)isEnabled;
- (VTSiriEnabledMonitor)init;
- (void)_didReceiveSiriSettingChanged:(BOOL)a3;
- (void)_notifyObserver:(id)a3 withEnabled:(BOOL)a4;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_stopMonitoring;
@end

@implementation VTSiriEnabledMonitor

- (BOOL)isEnabled
{
  return self->_isSiriEnabled;
}

- (void)_notifyObserver:(id)a3 withEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(VTEventMonitor *)self notifyObserver:v6];
  if (objc_opt_respondsToSelector()) {
    [v6 VTSiriEnabledMonitor:self didReceiveEnabled:v4];
  }
}

- (void)_didReceiveSiriSettingChanged:(BOOL)a3
{
  self->_isSiriEnabled = a3;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __54__VTSiriEnabledMonitor__didReceiveSiriSettingChanged___block_invoke;
  v3[3] = &unk_264325C80;
  v3[4] = self;
  BOOL v4 = a3;
  [(VTEventMonitor *)self enumerateObserversInQueue:v3];
}

uint64_t __54__VTSiriEnabledMonitor__didReceiveSiriSettingChanged___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _notifyObserver:a2 withEnabled:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_stopMonitoring
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x263F28758], 0);
  BOOL v4 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21844F000, v4, OS_LOG_TYPE_DEFAULT, "Stop monitoring : Siri setting switch", v5, 2u);
  }
}

- (void)_startMonitoringWithQueue:(id)a3
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_AssistantPrefsChangedNotification, (CFStringRef)*MEMORY[0x263F28758], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v5 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_21844F000, v5, OS_LOG_TYPE_DEFAULT, "Start monitoring : Siri setting switch", v6, 2u);
  }
  self->_isSiriEnabled = AFPreferencesAssistantEnabled() != 0;
}

- (VTSiriEnabledMonitor)init
{
  v4.receiver = self;
  v4.super_class = (Class)VTSiriEnabledMonitor;
  v2 = [(VTEventMonitor *)&v4 init];
  if (v2) {
    v2->_isSiriEnabled = AFPreferencesAssistantEnabled() != 0;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2181 != -1) {
    dispatch_once(&sharedInstance_onceToken_2181, &__block_literal_global_2182);
  }
  v2 = (void *)sharedInstance__sharedInstance_2183;

  return v2;
}

uint64_t __38__VTSiriEnabledMonitor_sharedInstance__block_invoke()
{
  sharedInstance__sharedInstance_2183 = objc_alloc_init(VTSiriEnabledMonitor);

  return MEMORY[0x270F9A758]();
}

@end