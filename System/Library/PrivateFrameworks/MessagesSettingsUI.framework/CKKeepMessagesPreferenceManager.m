@interface CKKeepMessagesPreferenceManager
+ (IMSyncedSettingsManaging)syncedSettingsManager;
+ (id)keepMessagesPreference;
+ (void)setSyncedSettingsManager:(id)a3;
- (void)_setLegacyKeepMessagesPreference:(id)a3;
- (void)addSyncedSettingObserver:(id)a3 selector:(SEL)a4 key:(int64_t)a5;
- (void)dealloc;
- (void)removeSyncedSettingObserver:(id)a3 key:(int64_t)a4;
- (void)updateKeepMessagesPreference:(id)a3;
@end

@implementation CKKeepMessagesPreferenceManager

- (void)dealloc
{
  +[CKKeepMessagesPreferenceManager setSyncedSettingsManager:0];
  v3.receiver = self;
  v3.super_class = (Class)CKKeepMessagesPreferenceManager;
  [(CKKeepMessagesPreferenceManager *)&v3 dealloc];
}

- (void)updateKeepMessagesPreference:(id)a3
{
  id v3 = a3;
  id v4 = +[CKKeepMessagesPreferenceManager syncedSettingsManager];
  [v4 setSettingValue:v3 forKey:0];
}

+ (id)keepMessagesPreference
{
  v2 = +[CKKeepMessagesPreferenceManager syncedSettingsManager];
  id v3 = [v2 settingValueForKey:0];

  return v3;
}

- (void)addSyncedSettingObserver:(id)a3 selector:(SEL)a4 key:(int64_t)a5
{
  id v7 = a3;
  id v8 = +[CKKeepMessagesPreferenceManager syncedSettingsManager];
  [v8 addObserver:v7 selector:a4 key:a5];
}

- (void)removeSyncedSettingObserver:(id)a3 key:(int64_t)a4
{
  id v5 = a3;
  id v6 = +[CKKeepMessagesPreferenceManager syncedSettingsManager];
  [v6 removeObserver:v5 key:a4];
}

+ (IMSyncedSettingsManaging)syncedSettingsManager
{
  v2 = (void *)_syncedSettingsManager;
  if (!_syncedSettingsManager)
  {
    id v3 = objc_alloc_init(MEMORY[0x263F4A618]);
    id v4 = (void *)_syncedSettingsManager;
    _syncedSettingsManager = (uint64_t)v3;

    v2 = (void *)_syncedSettingsManager;
  }
  return (IMSyncedSettingsManaging *)v2;
}

+ (void)setSyncedSettingsManager:(id)a3
{
}

- (void)_setLegacyKeepMessagesPreference:(id)a3
{
  id v3 = a3;
  id v4 = MEMORY[0x25A2A3250](@"com.apple.MobileSMS", @"KeepMessagesVersionID");
  id v7 = v4;
  if (v4) {
    uint64_t v5 = [v4 integerValue] + 1;
  }
  else {
    uint64_t v5 = 1;
  }
  CFPreferencesSetAppValue(@"KeepMessagesVersionID", (CFPropertyListRef)[NSNumber numberWithInteger:v5], @"com.apple.MobileSMS");
  CFPreferencesSetAppValue(@"KeepMessageForDays", v3, @"com.apple.MobileSMS");

  CFPreferencesSynchronize(@"com.apple.MobileSMS", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
  notify_post("com.apple.MobileSMS.KeepMessages.shouldUpdateDevices");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.MobileSMS.KeepMessages.changed", 0, 0, 1u);
}

@end