@interface _HKRPOxygenSaturationOnboardingManagerDataSource
- (BOOL)isAgeGated;
- (BOOL)isBloodOxygenSaturationEnabled;
- (BOOL)shouldAdvertise;
- (HKFeatureAvailabilityProviding)featureAvailabilityProvider;
- (HKRPOxygenSaturationOnboardingCache)onboardingCache;
- (HKRPOxygenSaturationSettings)oxygenSaturationSettings;
- (HKRegulatoryDomainProvider)mobileCountryCodeManager;
- (NRDevice)device;
- (NSString)countryCodeFromCurrentLocale;
- (_HKRPOxygenSaturationOnboardingManagerDataSource)init;
- (id)_lazyPropertyWithLockedBlock:(id)a3;
@end

@implementation _HKRPOxygenSaturationOnboardingManagerDataSource

- (_HKRPOxygenSaturationOnboardingManagerDataSource)init
{
  v3.receiver = self;
  v3.super_class = (Class)_HKRPOxygenSaturationOnboardingManagerDataSource;
  result = [(_HKRPOxygenSaturationOnboardingManagerDataSource *)&v3 init];
  if (result) {
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (BOOL)isBloodOxygenSaturationEnabled
{
  return MEMORY[0x270EF36D0](self, a2);
}

- (BOOL)isAgeGated
{
  id v2 = objc_alloc(MEMORY[0x263EFFA40]);
  objc_super v3 = (void *)[v2 initWithSuiteName:*MEMORY[0x263F0AC48]];
  char v4 = [v3 BOOLForKey:*MEMORY[0x263F0AC58]];

  return v4;
}

- (BOOL)shouldAdvertise
{
  id v2 = [(_HKRPOxygenSaturationOnboardingManagerDataSource *)self countryCodeFromCurrentLocale];
  BOOL v3 = +[HKRPOxygenSaturationAvailability isCountryAllowed:v2];

  return v3;
}

- (NSString)countryCodeFromCurrentLocale
{
  id v2 = [MEMORY[0x263EFF960] currentLocale];
  BOOL v3 = [v2 countryCode];

  return (NSString *)v3;
}

- (NRDevice)device
{
  id v2 = [MEMORY[0x263F57730] sharedInstance];
  BOOL v3 = [MEMORY[0x263F57730] activeDeviceSelectorBlock];
  char v4 = [v2 getDevicesMatching:v3];
  v5 = [v4 firstObject];

  return (NRDevice *)v5;
}

- (HKFeatureAvailabilityProviding)featureAvailabilityProvider
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __79___HKRPOxygenSaturationOnboardingManagerDataSource_featureAvailabilityProvider__block_invoke;
  v4[3] = &unk_264447428;
  v4[4] = self;
  id v2 = [(_HKRPOxygenSaturationOnboardingManagerDataSource *)self _lazyPropertyWithLockedBlock:v4];

  return (HKFeatureAvailabilityProviding *)v2;
}

- (HKRPOxygenSaturationSettings)oxygenSaturationSettings
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __76___HKRPOxygenSaturationOnboardingManagerDataSource_oxygenSaturationSettings__block_invoke;
  v4[3] = &unk_264447428;
  v4[4] = self;
  id v2 = [(_HKRPOxygenSaturationOnboardingManagerDataSource *)self _lazyPropertyWithLockedBlock:v4];

  return (HKRPOxygenSaturationSettings *)v2;
}

- (HKRPOxygenSaturationOnboardingCache)onboardingCache
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __67___HKRPOxygenSaturationOnboardingManagerDataSource_onboardingCache__block_invoke;
  v4[3] = &unk_264447428;
  v4[4] = self;
  id v2 = [(_HKRPOxygenSaturationOnboardingManagerDataSource *)self _lazyPropertyWithLockedBlock:v4];

  return (HKRPOxygenSaturationOnboardingCache *)v2;
}

- (HKRegulatoryDomainProvider)mobileCountryCodeManager
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __76___HKRPOxygenSaturationOnboardingManagerDataSource_mobileCountryCodeManager__block_invoke;
  v4[3] = &unk_264447428;
  v4[4] = self;
  id v2 = [(_HKRPOxygenSaturationOnboardingManagerDataSource *)self _lazyPropertyWithLockedBlock:v4];

  return (HKRegulatoryDomainProvider *)v2;
}

- (id)_lazyPropertyWithLockedBlock:(id)a3
{
  p_lock = &self->_lock;
  char v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_lock);
  v5 = v4[2](v4);

  os_unfair_lock_unlock(p_lock);

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mobileCountryCodeManager, 0);
  objc_storeStrong((id *)&self->_onboardingCache, 0);
  objc_storeStrong((id *)&self->_oxygenSaturationSettings, 0);
  objc_storeStrong((id *)&self->_oxygenSaturationAvailability, 0);

  objc_storeStrong((id *)&self->_featureAvailabilityProvider, 0);
}

@end