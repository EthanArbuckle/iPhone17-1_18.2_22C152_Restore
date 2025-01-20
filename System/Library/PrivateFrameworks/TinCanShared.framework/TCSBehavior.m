@interface TCSBehavior
+ (BOOL)_isAppleInternalInstall;
+ (BOOL)_isM8Device;
+ (BOOL)_isMobileKeyBagDisabledOrDeviceUnlockedSinceBoot;
+ (BOOL)_isRunningInStoreDemoModeOrSimulator;
+ (BOOL)isAppleInternalInstall;
+ (BOOL)isM8Device;
+ (BOOL)isMobileKeyBagDisabledOrDeviceUnlockedSinceBoot;
+ (BOOL)isRunningInStoreDemoModeOrSimulator;
+ (id)_regionCode;
+ (id)regionCode;
+ (id)sharedBehavior;
- (BOOL)isAppleInternalInstall;
- (BOOL)isM8Device;
- (BOOL)isMobileKeyBagDisabledOrDeviceUnlockedSinceBoot;
- (BOOL)isRunningInStoreDemoModeOrSimulator;
- (NSString)regionCode;
- (TCSBehavior)init;
- (void)_handleDeviceFirstUnlock;
- (void)dealloc;
@end

@implementation TCSBehavior

- (TCSBehavior)init
{
  v11.receiver = self;
  v11.super_class = (Class)TCSBehavior;
  v2 = [(TCSBehavior *)&v11 init];
  if (v2)
  {
    v2->_isMobileKeyBagDisabledOrDeviceUnlockedSinceBoot = [(id)objc_opt_class() _isMobileKeyBagDisabledOrDeviceUnlockedSinceBoot];
    v2->_isAppleInternalInstall = [(id)objc_opt_class() _isAppleInternalInstall];
    v2->_isM8Device = [(id)objc_opt_class() _isM8Device];
    v2->_isRunningInStoreDemoModeOrSimulator = [(id)objc_opt_class() _isRunningInStoreDemoModeOrSimulator];
    uint64_t v3 = [(id)objc_opt_class() _regionCode];
    regionCode = v2->_regionCode;
    v2->_regionCode = (NSString *)v3;

    if (!v2->_isMobileKeyBagDisabledOrDeviceUnlockedSinceBoot)
    {
      objc_initWeak(&location, v2);
      v5 = MEMORY[0x263EF83A0];
      id v6 = MEMORY[0x263EF83A0];
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __19__TCSBehavior_init__block_invoke;
      v8[3] = &unk_2644C8BE8;
      objc_copyWeak(&v9, &location);
      notify_register_dispatch("com.apple.mobile.keybagd.first_unlock", &v2->_firstUnlockToken, v5, v8);

      objc_destroyWeak(&v9);
      objc_destroyWeak(&location);
    }
  }
  return v2;
}

void __19__TCSBehavior_init__block_invoke(uint64_t a1, int a2)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && WeakRetained[2] == a2)
  {
    v4 = WeakRetained;
    [WeakRetained _handleDeviceFirstUnlock];
    WeakRetained = v4;
  }
}

- (void)dealloc
{
  notify_cancel(self->_firstUnlockToken);
  v3.receiver = self;
  v3.super_class = (Class)TCSBehavior;
  [(TCSBehavior *)&v3 dealloc];
}

+ (id)sharedBehavior
{
  if (sharedBehavior_onceToken != -1) {
    dispatch_once(&sharedBehavior_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)sharedBehavior__defaultBehavior;
  return v2;
}

uint64_t __29__TCSBehavior_sharedBehavior__block_invoke()
{
  sharedBehavior__defaultBehavior = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

+ (BOOL)isMobileKeyBagDisabledOrDeviceUnlockedSinceBoot
{
  v2 = [a1 sharedBehavior];
  char v3 = [v2 isMobileKeyBagDisabledOrDeviceUnlockedSinceBoot];

  return v3;
}

+ (BOOL)isAppleInternalInstall
{
  v2 = [a1 sharedBehavior];
  char v3 = [v2 isAppleInternalInstall];

  return v3;
}

+ (BOOL)isM8Device
{
  v2 = [a1 sharedBehavior];
  char v3 = [v2 isM8Device];

  return v3;
}

+ (BOOL)isRunningInStoreDemoModeOrSimulator
{
  v2 = [a1 sharedBehavior];
  char v3 = [v2 isRunningInStoreDemoModeOrSimulator];

  return v3;
}

+ (id)regionCode
{
  v2 = [a1 sharedBehavior];
  char v3 = [v2 regionCode];

  return v3;
}

+ (BOOL)_isMobileKeyBagDisabledOrDeviceUnlockedSinceBoot
{
  return MKBGetDeviceLockState() == 3 || MKBDeviceUnlockedSinceBoot() == 1;
}

+ (BOOL)_isAppleInternalInstall
{
  return MEMORY[0x270F95FB8](@"apple-internal-install", a2);
}

+ (BOOL)_isM8Device
{
  BOOL v2 = 1;
  uint64_t v3 = MGGetProductType();
  if (v3 > 1302273957)
  {
    if (v3 == 1302273958) {
      return v2;
    }
    uint64_t v4 = 2445473385;
  }
  else
  {
    if (v3 == 262180327) {
      return v2;
    }
    uint64_t v4 = 761631964;
  }
  if (v3 != v4) {
    return 0;
  }
  return v2;
}

+ (BOOL)_isRunningInStoreDemoModeOrSimulator
{
  return [MEMORY[0x263F1C408] isRunningInStoreDemoMode];
}

+ (id)_regionCode
{
  BOOL v2 = (void *)MGGetStringAnswer();
  return v2;
}

- (void)_handleDeviceFirstUnlock
{
  self->_isMobileKeyBagDisabledOrDeviceUnlockedSinceBoot = [(id)objc_opt_class() _isMobileKeyBagDisabledOrDeviceUnlockedSinceBoot];
  _TCSInitializeLogging();
  uint64_t v3 = TCSLogDefault;
  if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21E834000, v3, OS_LOG_TYPE_DEFAULT, "TCSBehavior notifying clients of device first unlock.", v5, 2u);
  }
  uint64_t v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 postNotificationName:@"TCSFirstUnlockNotification" object:self];
}

- (BOOL)isMobileKeyBagDisabledOrDeviceUnlockedSinceBoot
{
  return self->_isMobileKeyBagDisabledOrDeviceUnlockedSinceBoot;
}

- (BOOL)isAppleInternalInstall
{
  return self->_isAppleInternalInstall;
}

- (BOOL)isM8Device
{
  return self->_isM8Device;
}

- (BOOL)isRunningInStoreDemoModeOrSimulator
{
  return self->_isRunningInStoreDemoModeOrSimulator;
}

- (NSString)regionCode
{
  return self->_regionCode;
}

- (void).cxx_destruct
{
}

@end