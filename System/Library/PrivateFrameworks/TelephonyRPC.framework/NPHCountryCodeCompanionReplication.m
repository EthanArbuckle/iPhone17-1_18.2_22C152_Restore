@interface NPHCountryCodeCompanionReplication
- (NPHCountryCodeCompanionReplication)init;
- (void)_updateActiveCountryCode;
- (void)_updateAndBroadcastCodeWithKey:(id)a3 usingFunction:(void *)a4;
- (void)_updateHomeCountryCode;
- (void)_updateNetworkCountryCode;
- (void)dealloc;
@end

@implementation NPHCountryCodeCompanionReplication

- (NPHCountryCodeCompanionReplication)init
{
  v7.receiver = self;
  v7.super_class = (Class)NPHCountryCodeCompanionReplication;
  v2 = [(NPHCountryCodeCompanionReplication *)&v7 init];
  if (v2)
  {
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver(LocalCenter, v2, (CFNotificationCallback)_NPHActiveCountryCodeDidChange, (CFStringRef)*MEMORY[0x263F25558], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    CFNotificationCenterAddObserver(LocalCenter, v2, (CFNotificationCallback)_NPHHomeCountryCodeDidChange, (CFStringRef)*MEMORY[0x263F25578], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    CFNotificationCenterAddObserver(LocalCenter, v2, (CFNotificationCallback)_NPHNetworkCountryCodeDidChange, (CFStringRef)*MEMORY[0x263F25580], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    uint64_t v4 = objc_opt_new();
    npsManager = v2->_npsManager;
    v2->_npsManager = (NPSManager *)v4;

    [(NPHCountryCodeCompanionReplication *)v2 _updateActiveCountryCode];
    [(NPHCountryCodeCompanionReplication *)v2 _updateHomeCountryCode];
    [(NPHCountryCodeCompanionReplication *)v2 _updateNetworkCountryCode];
  }
  return v2;
}

- (void)dealloc
{
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterRemoveEveryObserver(LocalCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)NPHCountryCodeCompanionReplication;
  [(NPHCountryCodeCompanionReplication *)&v4 dealloc];
}

- (void)_updateActiveCountryCode
{
}

- (void)_updateHomeCountryCode
{
}

- (void)_updateNetworkCountryCode
{
}

- (void)_updateAndBroadcastCodeWithKey:(id)a3 usingFunction:(void *)a4
{
  v12[1] = *MEMORY[0x263EF8340];
  v6 = (__CFString *)a3;
  objc_super v7 = (const void *)((uint64_t (*)(void))a4)();
  CFPreferencesSetAppValue(v6, v7, @"com.apple.mobilephone");
  CFPreferencesAppSynchronize(@"com.apple.mobilephone");
  npsManager = self->_npsManager;
  v9 = (void *)MEMORY[0x263EFFA08];
  v12[0] = v6;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
  v11 = [v9 setWithArray:v10];
  [(NPSManager *)npsManager synchronizeUserDefaultsDomain:@"com.apple.mobilephone" keys:v11];

  if (v7) {
    CFRelease(v7);
  }
}

- (void).cxx_destruct
{
}

@end