@interface TZPreferencesController
+ (id)sharedPreferencesController;
- (BOOL)updatesEnabled;
- (TZPreferencesController)init;
- (int64_t)loggingLevel;
- (void)preferencesChanged:(id)a3;
@end

@implementation TZPreferencesController

+ (id)sharedPreferencesController
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__TZPreferencesController_sharedPreferencesController__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedPreferencesController_once != -1) {
    dispatch_once(&sharedPreferencesController_once, block);
  }
  v2 = (void *)sharedPreferencesController_sharedController;

  return v2;
}

uint64_t __54__TZPreferencesController_sharedPreferencesController__block_invoke()
{
  sharedPreferencesController_sharedController = objc_opt_new();

  return MEMORY[0x270F9A758]();
}

- (TZPreferencesController)init
{
  v6.receiver = self;
  v6.super_class = (Class)TZPreferencesController;
  v2 = [(TZPreferencesController *)&v6 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:v2 selector:sel_preferencesChanged_ name:@"com.apple.timezoneupdates.preferencesChanged" object:0];

    v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 addObserver:v2 selector:sel_preferencesChanged_ name:@"com.apple.ManagedConfiguration.profileList" object:0];
  }
  return v2;
}

- (void)preferencesChanged:(id)a3
{
}

- (BOOL)updatesEnabled
{
  return 1;
}

- (int64_t)loggingLevel
{
  int64_t valuePtr = 0;
  v2 = CFPreferencesCopyAppValue(@"TimeZoneUpdatesLoggingLevel", @"com.apple.timezoneupdates");
  if (!v2)
  {
    if (_getManagedPreferencesDict_managedPreferencesOnce != -1) {
      dispatch_once(&_getManagedPreferencesDict_managedPreferencesOnce, &__block_literal_global_2);
    }
    if (_getManagedPreferencesDict__managedPreferencesCache
      && (Value = CFDictionaryGetValue((CFDictionaryRef)_getManagedPreferencesDict__managedPreferencesCache, @"TimeZoneUpdatesLoggingLevel")) != 0)
    {
      v2 = Value;
      CFRetain(Value);
    }
    else
    {
      int64_t result = (int64_t)CFPreferencesCopyValue(@"TimeZoneUpdatesLoggingLevel", @"com.apple.timezoneupdates", @"mobile", (CFStringRef)*MEMORY[0x263EFFE50]);
      v2 = (const void *)result;
      if (!result) {
        return result;
      }
    }
  }
  CFTypeID v3 = CFGetTypeID(v2);
  if (v3 == CFNumberGetTypeID()) {
    CFNumberGetValue((CFNumberRef)v2, kCFNumberIntType, &valuePtr);
  }
  CFRelease(v2);
  return valuePtr;
}

@end