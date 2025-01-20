@interface _HKRPWatchAppInstallabilityDataSource
- (BOOL)hasCompletedOnboarding;
- (BOOL)isBloodOxygenSaturationEnabled;
- (BOOL)isDeviceSupported;
- (BOOL)isRunningStoreDemoMode;
- (BOOL)isTinkerModeEnabled;
- (BOOL)shouldForceAppInstall;
- (NSString)selectedCountry;
- (_HKRPWatchAppInstallabilityDataSource)init;
- (_HKRPWatchAppInstallabilityDataSource)initWithDevice:(id)a3;
- (void)isDeviceSupported;
@end

@implementation _HKRPWatchAppInstallabilityDataSource

- (_HKRPWatchAppInstallabilityDataSource)init
{
  return [(_HKRPWatchAppInstallabilityDataSource *)self initWithDevice:0];
}

- (_HKRPWatchAppInstallabilityDataSource)initWithDevice:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_HKRPWatchAppInstallabilityDataSource;
  v6 = [(_HKRPWatchAppInstallabilityDataSource *)&v14 init];
  if (v6)
  {
    uint64_t v7 = objc_msgSend(MEMORY[0x263EFFA40], "hkrp_respiratoryDefaults");
    userDefaults = v6->_userDefaults;
    v6->_userDefaults = (NSUserDefaults *)v7;

    objc_storeStrong((id *)&v6->_device, a3);
    v9 = [[HKRPOxygenSaturationAvailability alloc] initWithDevice:v5];
    availability = v6->_availability;
    v6->_availability = v9;

    v11 = [[HKRPOxygenSaturationOnboardingCache alloc] initWithUserDefaults:v6->_userDefaults userDefaultsSyncProvider:0];
    onboardingCache = v6->_onboardingCache;
    v6->_onboardingCache = v11;
  }
  return v6;
}

- (BOOL)isBloodOxygenSaturationEnabled
{
  return MEMORY[0x270EF36D0](self, a2);
}

- (BOOL)isRunningStoreDemoMode
{
  return [MEMORY[0x263F0A980] isRunningStoreDemoMode];
}

- (BOOL)shouldForceAppInstall
{
  return [(NSUserDefaults *)self->_userDefaults BOOLForKey:@"ShouldInstallOxygenSaturationWatchApp"];
}

- (BOOL)isTinkerModeEnabled
{
  device = self->_device;
  if (device)
  {
    v3 = [(NRDevice *)device valueForProperty:*MEMORY[0x263F575B0]];
    char v4 = [v3 BOOLValue];
  }
  else
  {
    v3 = [MEMORY[0x263F0A980] sharedBehavior];
    char v4 = [v3 tinkerModeEnabled];
  }
  BOOL v5 = v4;

  return v5;
}

- (BOOL)isDeviceSupported
{
  if (self->_device
    || ([MEMORY[0x263F0A980] sharedBehavior],
        char v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v4 isAppleWatch],
        v4,
        v5))
  {
    availability = self->_availability;
    return [(HKRPOxygenSaturationAvailability *)availability isDeviceSupported];
  }
  else
  {
    _HKInitializeLogging();
    v8 = (void *)*MEMORY[0x263F09950];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09950], OS_LOG_TYPE_ERROR)) {
      [(_HKRPWatchAppInstallabilityDataSource *)v8 isDeviceSupported];
    }
    return 0;
  }
}

- (BOOL)hasCompletedOnboarding
{
  v2 = [(HKRPOxygenSaturationOnboardingCache *)self->_onboardingCache hasCompletedOnboarding];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (NSString)selectedCountry
{
  v2 = [MEMORY[0x263EFF960] currentLocale];
  char v3 = [v2 countryCode];

  return (NSString *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_onboardingCache, 0);
  objc_storeStrong((id *)&self->_availability, 0);

  objc_storeStrong((id *)&self->_userDefaults, 0);
}

- (void)isDeviceSupported
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  char v4 = a1;
  int v5 = objc_opt_class();
  id v6 = v5;
  uint64_t v7 = NSStringFromSelector(a3);
  int v8 = 138543618;
  v9 = v5;
  __int16 v10 = 2114;
  v11 = v7;
  _os_log_error_impl(&dword_21D42F000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] %{public}@ is unsupported on this platform", (uint8_t *)&v8, 0x16u);
}

@end