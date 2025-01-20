@interface VTLanguageCodeUpdateMonitor
+ (id)sharedInstance;
- (VTLanguageCodeUpdateMonitor)init;
- (void)_didReceiveLanguageCodeUpdate;
- (void)_notifyObserver:(id)a3 withLanguageCode:(id)a4;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_stopMonitoring;
@end

@implementation VTLanguageCodeUpdateMonitor

- (void)_notifyObserver:(id)a3 withLanguageCode:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  [(VTEventMonitor *)self notifyObserver:v7];
  if (objc_opt_respondsToSelector()) {
    [v7 VTLanguageCodeUpdateMonitor:self didReceiveLanguageCodeChanged:v6];
  }
}

- (void)_didReceiveLanguageCodeUpdate
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v3 = AFPreferencesMobileUserSessionLanguage();
  v4 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v9 = v3;
    _os_log_impl(&dword_21844F000, v4, OS_LOG_TYPE_DEFAULT, "Siri language changed to : %{public}@", buf, 0xCu);
  }
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __60__VTLanguageCodeUpdateMonitor__didReceiveLanguageCodeUpdate__block_invoke;
  v6[3] = &unk_264325310;
  v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  [(VTEventMonitor *)self enumerateObserversInQueue:v6];
}

uint64_t __60__VTLanguageCodeUpdateMonitor__didReceiveLanguageCodeUpdate__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _notifyObserver:a2 withLanguageCode:*(void *)(a1 + 40)];
}

- (void)_stopMonitoring
{
  if (objc_opt_class())
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x263F282E0], 0);
    v4 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_21844F000, v4, OS_LOG_TYPE_DEFAULT, "Stop monitoring : Siri language code", v5, 2u);
    }
  }
}

- (void)_startMonitoringWithQueue:(id)a3
{
  if (objc_opt_class())
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_AFLanguageDidChangeCallback, (CFStringRef)*MEMORY[0x263F282E0], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    id v5 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_21844F000, v5, OS_LOG_TYPE_DEFAULT, "Start monitoring : Siri language code", v6, 2u);
    }
  }
}

- (VTLanguageCodeUpdateMonitor)init
{
  v3.receiver = self;
  v3.super_class = (Class)VTLanguageCodeUpdateMonitor;
  result = [(VTEventMonitor *)&v3 init];
  if (result) {
    result->_notifyToken = -1;
  }
  return result;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_456 != -1) {
    dispatch_once(&sharedInstance_onceToken_456, &__block_literal_global_457);
  }
  v2 = (void *)sharedInstance__sharedInstance;

  return v2;
}

uint64_t __45__VTLanguageCodeUpdateMonitor_sharedInstance__block_invoke()
{
  sharedInstance__sharedInstance = objc_alloc_init(VTLanguageCodeUpdateMonitor);

  return MEMORY[0x270F9A758]();
}

@end