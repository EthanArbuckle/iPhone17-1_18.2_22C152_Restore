@interface SBKPreferences
+ (id)storeBookkeeperPreferences;
- (BOOL)BOOLForKey:(id)a3;
- (SBKPreferences)init;
- (id)objectForKey:(id)a3 withDefaultValue:(id)a4;
- (void)_preferencesDidChange;
- (void)dealloc;
- (void)registerDefaultsIfKeyNotSet:(id)a3 registrationBlock:(id)a4;
- (void)setBool:(BOOL)a3 forKey:(id)a4;
- (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation SBKPreferences

- (BOOL)BOOLForKey:(id)a3
{
  return CFPreferencesGetAppBooleanValue((CFStringRef)a3, @"com.apple.storebookkeeper", 0) != 0;
}

- (void)setBool:(BOOL)a3 forKey:(id)a4
{
  BOOL v4 = a3;
  v5 = NSNumber;
  v6 = (__CFString *)a4;
  id v7 = [v5 numberWithBool:v4];
  CFPreferencesSetAppValue(v6, v7, @"com.apple.storebookkeeper");

  CFPreferencesAppSynchronize(@"com.apple.storebookkeeper");
}

- (id)objectForKey:(id)a3 withDefaultValue:(id)a4
{
  id v5 = a4;
  id v6 = (id)CFPreferencesCopyAppValue((CFStringRef)a3, @"com.apple.storebookkeeper");
  if (!v6) {
    id v6 = v5;
  }

  return v6;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  CFPreferencesSetAppValue((CFStringRef)a4, a3, @"com.apple.storebookkeeper");
  CFPreferencesAppSynchronize(@"com.apple.storebookkeeper");
}

- (void)registerDefaultsIfKeyNotSet:(id)a3 registrationBlock:(id)a4
{
  id v6 = (void (**)(void))a4;
  id v7 = [@"_didRegister-" stringByAppendingString:a3];
  if (!-[SBKPreferences BOOLForKey:](self, "BOOLForKey:"))
  {
    v6[2](v6);
    [(SBKPreferences *)self setBool:1 forKey:v7];
    CFPreferencesAppSynchronize(@"com.apple.storebookkeeper");
  }
}

- (void)_preferencesDidChange
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 postNotificationName:@"SBKPreferencesDidChangeNotification" object:self userInfo:0];
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.storebookkeeper.defaultschange", self);
  v4.receiver = self;
  v4.super_class = (Class)SBKPreferences;
  [(SBKPreferences *)&v4 dealloc];
}

- (SBKPreferences)init
{
  v5.receiver = self;
  v5.super_class = (Class)SBKPreferences;
  v2 = [(SBKPreferences *)&v5 init];
  if (v2)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_PreferencesDidChangeNotification, @"com.apple.storebookkeeper.defaultschange", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v2;
}

+ (id)storeBookkeeperPreferences
{
  if (storeBookkeeperPreferences_onceToken != -1) {
    dispatch_once(&storeBookkeeperPreferences_onceToken, &__block_literal_global_575);
  }
  v2 = (void *)storeBookkeeperPreferences_storeBookkeeperPreferences;
  return v2;
}

uint64_t __44__SBKPreferences_storeBookkeeperPreferences__block_invoke()
{
  storeBookkeeperPreferences_storeBookkeeperPreferences = objc_alloc_init(SBKPreferences);
  return MEMORY[0x270F9A758]();
}

@end