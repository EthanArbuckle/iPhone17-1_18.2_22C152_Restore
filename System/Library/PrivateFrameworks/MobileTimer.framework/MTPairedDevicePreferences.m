@interface MTPairedDevicePreferences
+ (id)sharedInstance;
- (BOOL)_isPushAlertsEnabledInPreferences;
- (BOOL)isPushAlertsEnabled;
- (BOOL)pushAlertsEnabled;
- (MTPairedDevicePreferences)init;
- (NPSManager)npsManager;
- (void)_handlePrefsChanged;
- (void)_notifyClientsOfChange;
- (void)dealloc;
- (void)setNpsManager:(id)a3;
@end

@implementation MTPairedDevicePreferences

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_42);
  }
  v2 = (void *)sharedInstance___preferences;
  return v2;
}

uint64_t __43__MTPairedDevicePreferences_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = sharedInstance___preferences;
  sharedInstance___preferences = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (MTPairedDevicePreferences)init
{
  v5.receiver = self;
  v5.super_class = (Class)MTPairedDevicePreferences;
  v2 = [(MTPairedDevicePreferences *)&v5 init];
  if (v2)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_MTPairedDevicePreferences_HandlePreferencesChanged, @"BulletinDistributorBBSectionsDidChangeNotification", v2, CFNotificationSuspensionBehaviorDeliverImmediately);
    v2->_pushAlertsEnabled = [(MTPairedDevicePreferences *)v2 _isPushAlertsEnabledInPreferences];
  }
  return v2;
}

- (BOOL)isPushAlertsEnabled
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL pushAlertsEnabled = v2->_pushAlertsEnabled;
  objc_sync_exit(v2);

  return pushAlertsEnabled;
}

- (BOOL)_isPushAlertsEnabledInPreferences
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F79CD8]) initWithDomain:@"com.apple.bulletinboard.apps"];
  v3 = [v2 dictionaryForKey:@"com.apple.mobiletimer"];
  v4 = [v3 objectForKey:@"BPSNanoBulletinShowsAlerts"];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (void)_handlePrefsChanged
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(MTPairedDevicePreferences *)self _isPushAlertsEnabledInPreferences];
  v4 = MTLogForCategory(6);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v8 = self;
    __int16 v9 = 1024;
    BOOL v10 = v3;
    _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ _handlePrefsChanged: BOOL pushAlertsEnabled = %d", buf, 0x12u);
  }

  char v5 = self;
  objc_sync_enter(v5);
  v5->_BOOL pushAlertsEnabled = v3;
  objc_sync_exit(v5);

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__MTPairedDevicePreferences__handlePrefsChanged__block_invoke;
  block[3] = &unk_1E59150A8;
  block[4] = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __48__MTPairedDevicePreferences__handlePrefsChanged__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyClientsOfChange];
}

- (void)_notifyClientsOfChange
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"MTPairedDevicePreferencesChanged" object:self];
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)MTPairedDevicePreferences;
  [(MTPairedDevicePreferences *)&v4 dealloc];
}

- (BOOL)pushAlertsEnabled
{
  return self->_pushAlertsEnabled;
}

- (NPSManager)npsManager
{
  return self->_npsManager;
}

- (void)setNpsManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end