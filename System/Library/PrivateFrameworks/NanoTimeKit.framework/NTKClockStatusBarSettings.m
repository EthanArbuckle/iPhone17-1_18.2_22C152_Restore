@interface NTKClockStatusBarSettings
+ (id)sharedInstance;
- (BOOL)_isNotificationsIndicatorEnabledInPreferences;
- (BOOL)isNotificationsIndicatorEnabled;
- (NTKClockStatusBarSettings)init;
- (void)_handlePrefsChanged;
- (void)_notifyClientsOfChange;
- (void)dealloc;
- (void)setNotificationsIndicatorEnabled:(BOOL)a3;
@end

@implementation NTKClockStatusBarSettings

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__NTKClockStatusBarSettings_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_5 != -1) {
    dispatch_once(&sharedInstance_onceToken_5, block);
  }
  v2 = (void *)sharedInstance___sharedInstance_2;
  return v2;
}

void __43__NTKClockStatusBarSettings_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance___sharedInstance_2;
  sharedInstance___sharedInstance_2 = (uint64_t)v1;
}

- (NTKClockStatusBarSettings)init
{
  v7.receiver = self;
  v7.super_class = (Class)NTKClockStatusBarSettings;
  v2 = [(NTKClockStatusBarSettings *)&v7 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.ntk.clockstatusbarsettings", 0);
    prefsQueue = v2->_prefsQueue;
    v2->_prefsQueue = (OS_dispatch_queue *)v3;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_NTKClockStatusBarSettings_HandleSettingsChanged, @"com.apple.NanoTimeKit.NTKNanoPrefsChanges", v2, CFNotificationSuspensionBehaviorDeliverImmediately);
    CFPreferencesAppSynchronize(@"com.apple.NanoTimeKit");
    v2->_notificationsIndicatorEnabled = [(NTKClockStatusBarSettings *)v2 _isNotificationsIndicatorEnabledInPreferences];
  }
  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)NTKClockStatusBarSettings;
  [(NTKClockStatusBarSettings *)&v4 dealloc];
}

- (BOOL)isNotificationsIndicatorEnabled
{
  return self->_notificationsIndicatorEnabled;
}

- (BOOL)_isNotificationsIndicatorEnabledInPreferences
{
  char v6 = 0;
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F79CD8]) initWithDomain:@"com.apple.NanoTimeKit"];
  char v3 = [v2 BOOLForKey:@"notificationsIndicatorEnabled" keyExistsAndHasValidFormat:&v6];
  if (v6) {
    BOOL v4 = v3;
  }
  else {
    BOOL v4 = 1;
  }

  return v4;
}

- (void)setNotificationsIndicatorEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  self->_notificationsIndicatorEnabled = a3;
  id v10 = (id)[objc_alloc(MEMORY[0x1E4F79CD8]) initWithDomain:@"com.apple.NanoTimeKit"];
  [v10 setBool:v3 forKey:@"notificationsIndicatorEnabled"];
  id v5 = (id)[v10 synchronize];
  npsManager = self->_npsManager;
  if (!npsManager)
  {
    objc_super v7 = (NPSManager *)objc_alloc_init(MEMORY[0x1E4F79CE0]);
    v8 = self->_npsManager;
    self->_npsManager = v7;

    npsManager = self->_npsManager;
  }
  v9 = [MEMORY[0x1E4F1CAD0] setWithObject:@"notificationsIndicatorEnabled"];
  [(NPSManager *)npsManager synchronizeNanoDomain:@"com.apple.NanoTimeKit" keys:v9];
}

- (void)_handlePrefsChanged
{
  prefsQueue = self->_prefsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__NTKClockStatusBarSettings__handlePrefsChanged__block_invoke;
  block[3] = &unk_1E62BFF20;
  block[4] = self;
  dispatch_async(prefsQueue, block);
}

void __48__NTKClockStatusBarSettings__handlePrefsChanged__block_invoke(uint64_t a1)
{
  CFPreferencesAppSynchronize(@"com.apple.NanoTimeKit");
  char v2 = [*(id *)(a1 + 32) _isNotificationsIndicatorEnabledInPreferences];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __48__NTKClockStatusBarSettings__handlePrefsChanged__block_invoke_2;
  v3[3] = &unk_1E62C1BF0;
  v3[4] = *(void *)(a1 + 32);
  char v4 = v2;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

uint64_t __48__NTKClockStatusBarSettings__handlePrefsChanged__block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 16) = *(unsigned char *)(a1 + 40);
  return [*(id *)(a1 + 32) _notifyClientsOfChange];
}

- (void)_notifyClientsOfChange
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"NTKClockStatusBarSettingsDidChangeNotification" object:self];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prefsQueue, 0);
  objc_storeStrong((id *)&self->_npsManager, 0);
}

@end