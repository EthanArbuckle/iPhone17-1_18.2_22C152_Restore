@interface MZPreferences
+ (id)storeBookkeeperPreferences;
- (BOOL)BOOLForKey:(id)a3;
- (MZPreferences)init;
- (id)objectForKey:(id)a3 withDefaultValue:(id)a4;
- (void)_preferencesDidChange;
- (void)dealloc;
- (void)registerDefaultsIfKeyNotSet:(id)a3 registrationBlock:(id)a4;
- (void)setBool:(BOOL)a3 forKey:(id)a4;
- (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation MZPreferences

- (MZPreferences)init
{
  v5.receiver = self;
  v5.super_class = (Class)MZPreferences;
  v2 = [(MZPreferences *)&v5 init];
  if (v2)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)sub_1000CEA0C, @"com.apple.storebookkeeper.defaultschange", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v2;
}

+ (id)storeBookkeeperPreferences
{
  if (qword_10060A790 != -1) {
    dispatch_once(&qword_10060A790, &stru_100550800);
  }
  v2 = (void *)qword_10060A788;

  return v2;
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

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.storebookkeeper.defaultschange", self);
  v4.receiver = self;
  v4.super_class = (Class)MZPreferences;
  [(MZPreferences *)&v4 dealloc];
}

- (void)_preferencesDidChange
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 postNotificationName:@"MZPreferencesDidChangeNotification" object:self userInfo:0];
}

- (void)registerDefaultsIfKeyNotSet:(id)a3 registrationBlock:(id)a4
{
  id v6 = (void (**)(void))a4;
  id v7 = [@"_didRegister-" stringByAppendingString:a3];
  if (!-[MZPreferences BOOLForKey:](self, "BOOLForKey:"))
  {
    v6[2](v6);
    [(MZPreferences *)self setBool:1 forKey:v7];
    CFPreferencesAppSynchronize(@"com.apple.storebookkeeper");
  }
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  CFPreferencesSetAppValue((CFStringRef)a4, a3, @"com.apple.storebookkeeper");

  CFPreferencesAppSynchronize(@"com.apple.storebookkeeper");
}

- (void)setBool:(BOOL)a3 forKey:(id)a4
{
  BOOL v4 = a3;
  id v5 = (__CFString *)a4;
  id v6 = +[NSNumber numberWithBool:v4];
  CFPreferencesSetAppValue(v5, v6, @"com.apple.storebookkeeper");

  CFPreferencesAppSynchronize(@"com.apple.storebookkeeper");
}

- (BOOL)BOOLForKey:(id)a3
{
  return CFPreferencesGetAppBooleanValue((CFStringRef)a3, @"com.apple.storebookkeeper", 0) != 0;
}

@end