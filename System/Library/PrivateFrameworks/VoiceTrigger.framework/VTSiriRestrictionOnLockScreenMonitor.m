@interface VTSiriRestrictionOnLockScreenMonitor
+ (id)sharedInstance;
- (BOOL)_checkSiriRestrictedOnLockScreen;
- (BOOL)isRestricted;
- (VTSiriRestrictionOnLockScreenMonitor)init;
- (void)_didReceiveRestrictionChanged:(BOOL)a3;
- (void)_didReceiveRestrictionChangedInQueue:(BOOL)a3;
- (void)_notifyObserver:(id)a3 withRestricted:(BOOL)a4;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_stopMonitoring;
- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4;
@end

@implementation VTSiriRestrictionOnLockScreenMonitor

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  BOOL v5 = [(VTSiriRestrictionOnLockScreenMonitor *)self _checkSiriRestrictedOnLockScreen];
  self->_isRestricted = v5;

  [(VTSiriRestrictionOnLockScreenMonitor *)self _didReceiveRestrictionChanged:v5];
}

- (void)_notifyObserver:(id)a3 withRestricted:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(VTEventMonitor *)self notifyObserver:v6];
  if (objc_opt_respondsToSelector()) {
    [v6 VTSiriRestrictionOnLockScreenMonitor:self didReceiveRestrictionChanged:v4];
  }
}

- (void)_didReceiveRestrictionChanged:(BOOL)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __70__VTSiriRestrictionOnLockScreenMonitor__didReceiveRestrictionChanged___block_invoke;
  v3[3] = &unk_264325C80;
  v3[4] = self;
  BOOL v4 = a3;
  [(VTEventMonitor *)self enumerateObserversInQueue:v3];
}

uint64_t __70__VTSiriRestrictionOnLockScreenMonitor__didReceiveRestrictionChanged___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _notifyObserver:a2 withRestricted:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_didReceiveRestrictionChangedInQueue:(BOOL)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __77__VTSiriRestrictionOnLockScreenMonitor__didReceiveRestrictionChangedInQueue___block_invoke;
  v3[3] = &unk_264325C80;
  v3[4] = self;
  BOOL v4 = a3;
  [(VTEventMonitor *)self enumerateObserversInQueue:v3];
}

uint64_t __77__VTSiriRestrictionOnLockScreenMonitor__didReceiveRestrictionChangedInQueue___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _notifyObserver:a2 withRestricted:*(unsigned __int8 *)(a1 + 40)];
}

- (BOOL)_checkSiriRestrictedOnLockScreen
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F53C58] sharedConnection];
  int v3 = [v2 effectiveBoolValueForSetting:*MEMORY[0x263F53780]];

  BOOL v4 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v5 = @"NO";
    if (v3 == 2) {
      BOOL v5 = @"YES";
    }
    int v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_21844F000, v4, OS_LOG_TYPE_DEFAULT, "Siri restricted on lock screen : %{public}@", (uint8_t *)&v7, 0xCu);
  }
  return v3 == 2;
}

- (BOOL)isRestricted
{
  return self->_isRestricted;
}

- (void)_stopMonitoring
{
  int v3 = [MEMORY[0x263F53C58] sharedConnection];
  [v3 removeObserver:self];

  BOOL v4 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v5 = 0;
    _os_log_impl(&dword_21844F000, v4, OS_LOG_TYPE_DEFAULT, "Stop monitoring : Setting preference change", v5, 2u);
  }
}

- (void)_startMonitoringWithQueue:(id)a3
{
  BOOL v4 = objc_msgSend(MEMORY[0x263F53C58], "sharedConnection", a3);
  [v4 addObserver:self];

  BOOL v5 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_21844F000, v5, OS_LOG_TYPE_DEFAULT, "Start monitoring : Setting preference change", v6, 2u);
  }
  self->_isRestricted = [(VTSiriRestrictionOnLockScreenMonitor *)self _checkSiriRestrictedOnLockScreen];
}

- (VTSiriRestrictionOnLockScreenMonitor)init
{
  v3.receiver = self;
  v3.super_class = (Class)VTSiriRestrictionOnLockScreenMonitor;
  result = [(VTEventMonitor *)&v3 init];
  if (result) {
    result->_isRestricted = 0;
  }
  return result;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_3410 != -1) {
    dispatch_once(&sharedInstance_onceToken_3410, &__block_literal_global_3411);
  }
  v2 = (void *)sharedInstance__sharedInstance_3412;

  return v2;
}

uint64_t __54__VTSiriRestrictionOnLockScreenMonitor_sharedInstance__block_invoke()
{
  sharedInstance__sharedInstance_3412 = objc_alloc_init(VTSiriRestrictionOnLockScreenMonitor);

  return MEMORY[0x270F9A758]();
}

@end