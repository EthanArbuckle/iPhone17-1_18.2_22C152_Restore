@interface BYSetupStateManager
+ (id)sharedManager;
- (BOOL)didRestoreFromBackup;
- (BOOL)didSetupUsingiTunes;
- (id)buddyPrefsValueForKey:(id)a3;
- (int64_t)restoreType;
- (void)clearRestoreType;
- (void)recordSetupUsingBuddy;
@end

@implementation BYSetupStateManager

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedManager_instance;
  return v2;
}

uint64_t __36__BYSetupStateManager_sharedManager__block_invoke()
{
  sharedManager_instance = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

- (id)buddyPrefsValueForKey:(id)a3
{
  CFPropertyListRef v3 = CFPreferencesCopyAppValue((CFStringRef)a3, @"com.apple.purplebuddy");
  v4 = (void *)v3;
  if (v3)
  {
    CFTypeID v5 = CFGetTypeID(v3);
    if (v5 != CFStringGetTypeID())
    {
      CFRelease(v4);
      v4 = 0;
    }
  }
  return v4;
}

- (int64_t)restoreType
{
  v2 = [(BYSetupStateManager *)self buddyPrefsValueForKey:@"RestoreState"];
  if ([v2 isEqualToString:@"RestoredFromiTunesBackup"])
  {
    int64_t v3 = 1;
  }
  else if ([v2 isEqualToString:@"RestoredFromiCloudBackup"])
  {
    int64_t v3 = 2;
  }
  else if ([v2 isEqualToString:@"BackgroundRestoringFromiCloudBackup"])
  {
    int64_t v3 = 3;
  }
  else if ([v2 isEqualToString:@"RestoredFromDevice"])
  {
    int64_t v3 = 4;
  }
  else
  {
    int64_t v3 = 0;
  }

  return v3;
}

- (void)clearRestoreType
{
  if ([(BYSetupStateManager *)self restoreType])
  {
    v2 = _BYLoggingFacility();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int64_t v3 = 0;
      _os_log_impl(&dword_1A7DED000, v2, OS_LOG_TYPE_DEFAULT, "Clearing RestoreState...", v3, 2u);
    }

    CFPreferencesSetAppValue(@"RestoreState", 0, @"com.apple.purplebuddy");
    CFPreferencesAppSynchronize(@"com.apple.purplebuddy");
  }
}

- (BOOL)didRestoreFromBackup
{
  return [(BYSetupStateManager *)self restoreType] != 0;
}

- (BOOL)didSetupUsingiTunes
{
  v2 = [(BYSetupStateManager *)self buddyPrefsValueForKey:@"SetupState"];
  char v3 = [v2 isEqualToString:@"SetupUsingiTunes"];

  return v3;
}

- (void)recordSetupUsingBuddy
{
  CFPreferencesSetAppValue(@"SetupState", @"SetupUsingAssistant", @"com.apple.purplebuddy");
  [(BYSetupStateManager *)self clearRestoreType];
}

@end