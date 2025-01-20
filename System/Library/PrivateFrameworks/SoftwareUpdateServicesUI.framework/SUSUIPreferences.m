@interface SUSUIPreferences
+ (id)sharedInstance;
- (BOOL)IWillRebootLater;
- (BOOL)_getBooleanPreferenceForKey:(id)a3 withDefaultValue:(BOOL)a4;
- (BOOL)alertAfterDownload;
- (BOOL)isSharedIPad;
- (BOOL)lastAppliedUpdateWasSplatOnly;
- (BOOL)needsAlertPresentationAfterOTAUpdate;
- (BOOL)preventCountdownAlert;
- (BOOL)preventPostUpdateAlert;
- (BOOL)preventRebootAlert;
- (BOOL)preventRollbackPrompt;
- (NSNumber)installAlertIntervalMinutes;
- (NSNumber)passcodeRequiredDays;
- (NSNumber)restartCountdownOverrideIntervalSeconds;
- (SUSUIPreferences)init;
- (id)_copyNumberPreferenceForKey:(id)a3;
- (id)_copyStringPreferenceForKey:(id)a3;
- (void)_copyPreferenceForKey:(__CFString *)a3 ofType:(unint64_t)a4;
- (void)_loadPreferences;
- (void)_setBooleanPreferenceForKey:(id)a3 value:(BOOL)a4;
- (void)dealloc;
- (void)setLastAppliedUpdateWasSplatOnly:(BOOL)a3;
- (void)setNeedsAlertPresentationAfterOTAUpdate:(BOOL)a3;
- (void)setRestartCountdownOverrideIntervalSeconds:(id)a3;
@end

@implementation SUSUIPreferences

- (SUSUIPreferences)init
{
  SEL v7 = a2;
  v8 = 0;
  v6.receiver = self;
  v6.super_class = (Class)SUSUIPreferences;
  v5 = [(SUSUIPreferences *)&v6 init];
  v8 = v5;
  objc_storeStrong((id *)&v8, v5);
  if (v5)
  {
    [(SUSUIPreferences *)v8 _loadPreferences];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v8, (CFNotificationCallback)__SUSUIPreferencesChanged, @"SUSUIPreferencesChangedNotification", 0, CFNotificationSuspensionBehaviorCoalesce);
  }
  v4 = v8;
  objc_storeStrong((id *)&v8, 0);
  return v4;
}

- (void)dealloc
{
  v5 = self;
  SEL v4 = a2;
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, v5, @"SUSUIPreferencesChangedNotification", 0);
  v3.receiver = v5;
  v3.super_class = (Class)SUSUIPreferences;
  [(SUSUIPreferences *)&v3 dealloc];
}

+ (id)sharedInstance
{
  v5 = (dispatch_once_t *)&sharedInstance_pred;
  id location = 0;
  objc_storeStrong(&location, &__block_literal_global_0);
  if (*v5 != -1) {
    dispatch_once(v5, location);
  }
  objc_storeStrong(&location, 0);
  v2 = (void *)sharedInstance___instance_0;

  return v2;
}

void __34__SUSUIPreferences_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(SUSUIPreferences);
  v1 = (void *)sharedInstance___instance_0;
  sharedInstance___instance_0 = (uint64_t)v0;
}

- (void)_loadPreferences
{
  self->_alertAfterDownload = [(SUSUIPreferences *)self _getBooleanPreferenceForKey:@"alertAfterDownload" withDefaultValue:0];
  v2 = [(SUSUIPreferences *)self _copyNumberPreferenceForKey:@"passcodeRequiredDays"];
  passcodeRequiredDays = self->_passcodeRequiredDays;
  self->_passcodeRequiredDays = v2;

  self->_needsAlertPresentationAfterOTAUpdate = [(SUSUIPreferences *)self _getBooleanPreferenceForKey:@"needsAlertAfterOTAUpdate" withDefaultValue:0];
  self->_preventCountdownAlert = [(SUSUIPreferences *)self _getBooleanPreferenceForKey:@"preventCountdownAlert" withDefaultValue:0];
  SEL v4 = [(SUSUIPreferences *)self _copyNumberPreferenceForKey:@"installAlertInterval"];
  installAlertIntervalMinutes = self->_installAlertIntervalMinutes;
  self->_installAlertIntervalMinutes = v4;

  self->_preventRollbackPrompt = [(SUSUIPreferences *)self _getBooleanPreferenceForKey:@"preventRollbackPrompt" withDefaultValue:0];
  self->_isSharedIPad = [(SUSUIPreferences *)self _getBooleanPreferenceForKey:@"isSharedIPad" withDefaultValue:0];
  self->_IWillRebootLater = [(SUSUIPreferences *)self _getBooleanPreferenceForKey:@"IWillRebootLater" withDefaultValue:0];
  objc_super v6 = [(SUSUIPreferences *)self _copyNumberPreferenceForKey:@"restartCountdownOverrideIntervalSeconds"];
  restartCountdownOverrideIntervalSeconds = self->_restartCountdownOverrideIntervalSeconds;
  self->_restartCountdownOverrideIntervalSeconds = v6;

  self->_preventRebootAlert = [(SUSUIPreferences *)self _getBooleanPreferenceForKey:@"preventRebootAlert" withDefaultValue:0];
  self->_lastAppliedUpdateWasSplatOnly = [(SUSUIPreferences *)self _getBooleanPreferenceForKey:@"lastAppliedUpdateWasSplatOnly" withDefaultValue:0];
  self->_preventPostUpdateAlert = [(SUSUIPreferences *)self _getBooleanPreferenceForKey:@"preventPostUpdateAlert" withDefaultValue:0];
}

- (BOOL)_getBooleanPreferenceForKey:(id)a3 withDefaultValue:(BOOL)a4
{
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  CFBooleanRef BOOLean = [(SUSUIPreferences *)v9 _copyPreferenceForKey:location[0] ofType:CFBooleanGetTypeID()];
  if (BOOLean)
  {
    BOOL v6 = CFBooleanGetValue(BOOLean) != 0;
    CFRelease(BOOLean);
    BOOL v10 = v6;
  }
  else
  {
    BOOL v10 = a4;
  }
  objc_storeStrong(location, 0);
  return v10;
}

- (id)_copyStringPreferenceForKey:(id)a3
{
  BOOL v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  SEL v4 = [(SUSUIPreferences *)v6 _copyPreferenceForKey:location[0] ofType:CFStringGetTypeID()];
  objc_storeStrong(location, 0);
  return v4;
}

- (id)_copyNumberPreferenceForKey:(id)a3
{
  BOOL v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  SEL v4 = [(SUSUIPreferences *)v6 _copyPreferenceForKey:location[0] ofType:CFNumberGetTypeID()];
  objc_storeStrong(location, 0);
  return v4;
}

- (void)_copyPreferenceForKey:(__CFString *)a3 ofType:(unint64_t)a4
{
  CFTypeRef cf = CFPreferencesCopyValue(a3, @"com.apple.susui", @"mobile", (CFStringRef)*MEMORY[0x263EFFE50]);
  if (cf && CFGetTypeID(cf) == a4) {
    return (void *)cf;
  }
  if (cf) {
    CFRelease(cf);
  }
  return 0;
}

- (void)setNeedsAlertPresentationAfterOTAUpdate:(BOOL)a3
{
  if (a3 != self->_needsAlertPresentationAfterOTAUpdate)
  {
    self->_needsAlertPresentationAfterOTAUpdate = a3;
    [(SUSUIPreferences *)self _setBooleanPreferenceForKey:@"needsAlertAfterOTAUpdate" value:a3];
  }
}

- (void)setLastAppliedUpdateWasSplatOnly:(BOOL)a3
{
  self->_lastAppliedUpdateWasSplatOnly = a3;
  [(SUSUIPreferences *)self _setBooleanPreferenceForKey:@"lastAppliedUpdateWasSplatOnly" value:a3];
}

- (void)_setBooleanPreferenceForKey:(id)a3 value:(BOOL)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (a4) {
    CFPropertyListRef value = (CFPropertyListRef)*MEMORY[0x263EFFB40];
  }
  else {
    CFPropertyListRef value = (CFPropertyListRef)*MEMORY[0x263EFFB38];
  }
  CFPreferencesSetAppValue((CFStringRef)location[0], value, @"com.apple.susui");
  CFPreferencesAppSynchronize(@"com.apple.susui");
  objc_storeStrong(location, 0);
}

- (void)setRestartCountdownOverrideIntervalSeconds:(id)a3
{
  SEL v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v4->_restartCountdownOverrideIntervalSeconds, location[0]);
  objc_storeStrong(location, 0);
}

- (BOOL)alertAfterDownload
{
  return self->_alertAfterDownload;
}

- (NSNumber)passcodeRequiredDays
{
  return self->_passcodeRequiredDays;
}

- (BOOL)needsAlertPresentationAfterOTAUpdate
{
  return self->_needsAlertPresentationAfterOTAUpdate;
}

- (BOOL)preventCountdownAlert
{
  return self->_preventCountdownAlert;
}

- (NSNumber)installAlertIntervalMinutes
{
  return self->_installAlertIntervalMinutes;
}

- (BOOL)preventRollbackPrompt
{
  return self->_preventRollbackPrompt;
}

- (BOOL)isSharedIPad
{
  return self->_isSharedIPad;
}

- (BOOL)IWillRebootLater
{
  return self->_IWillRebootLater;
}

- (NSNumber)restartCountdownOverrideIntervalSeconds
{
  return self->_restartCountdownOverrideIntervalSeconds;
}

- (BOOL)preventRebootAlert
{
  return self->_preventRebootAlert;
}

- (BOOL)lastAppliedUpdateWasSplatOnly
{
  return self->_lastAppliedUpdateWasSplatOnly;
}

- (BOOL)preventPostUpdateAlert
{
  return self->_preventPostUpdateAlert;
}

- (void).cxx_destruct
{
}

@end