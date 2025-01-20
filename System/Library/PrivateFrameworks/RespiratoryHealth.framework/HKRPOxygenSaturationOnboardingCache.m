@interface HKRPOxygenSaturationOnboardingCache
- (HKRPOxygenSaturationOnboardingCache)initWithUserDefaults:(id)a3 userDefaultsSyncProvider:(id)a4;
- (NSNumber)hasCompletedOnboarding;
- (void)setHasCompletedOnboarding:(id)a3;
@end

@implementation HKRPOxygenSaturationOnboardingCache

- (HKRPOxygenSaturationOnboardingCache)initWithUserDefaults:(id)a3 userDefaultsSyncProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKRPOxygenSaturationOnboardingCache;
  v9 = [(HKRPOxygenSaturationOnboardingCache *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_userDefaults, a3);
    objc_storeStrong((id *)&v10->_userDefaultsSyncProvider, a4);
  }

  return v10;
}

- (NSNumber)hasCompletedOnboarding
{
  v2 = [(NSUserDefaults *)self->_userDefaults objectForKey:@"HasCompletedOnboarding"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return (NSNumber *)v3;
}

- (void)setHasCompletedOnboarding:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x263F09950];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09950], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    *(_DWORD *)v10 = 138543618;
    *(void *)&v10[4] = objc_opt_class();
    *(_WORD *)&v10[12] = 2114;
    *(void *)&v10[14] = v4;
    id v7 = *(id *)&v10[4];
    _os_log_impl(&dword_21D42F000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Setting has completed onboarding: %{public}@", v10, 0x16u);
  }
  [(NSUserDefaults *)self->_userDefaults setObject:v4, @"HasCompletedOnboarding", *(_OWORD *)v10, *(void *)&v10[16], v11 forKey];
  userDefaultsSyncProvider = self->_userDefaultsSyncProvider;
  v9 = [MEMORY[0x263EFFA08] setWithObject:@"HasCompletedOnboarding"];
  [(HKRPUserDefaultsSyncProviding *)userDefaultsSyncProvider synchronizeKeys:v9];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaultsSyncProvider, 0);

  objc_storeStrong((id *)&self->_userDefaults, 0);
}

@end