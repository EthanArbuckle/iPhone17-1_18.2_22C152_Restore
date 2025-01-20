@interface HKRPOxygenSaturationOnboardingCacher
- (HKRPOxygenSaturationOnboardingCacher)initWithFeatureAvailabilityProviding:(id)a3 userDefaults:(id)a4 userDefaultsSyncProvider:(id)a5;
- (HKRPOxygenSaturationOnboardingCacher)initWithFeatureAvailabilityProviding:(id)a3 userDefaults:(id)a4 userDefaultsSyncProvider:(id)a5 didStart:(id)a6;
- (void)_queue_featureAvailabilityDidChange;
- (void)dealloc;
@end

@implementation HKRPOxygenSaturationOnboardingCacher

- (HKRPOxygenSaturationOnboardingCacher)initWithFeatureAvailabilityProviding:(id)a3 userDefaults:(id)a4 userDefaultsSyncProvider:(id)a5
{
  return [(HKRPOxygenSaturationOnboardingCacher *)self initWithFeatureAvailabilityProviding:a3 userDefaults:a4 userDefaultsSyncProvider:a5 didStart:0];
}

- (HKRPOxygenSaturationOnboardingCacher)initWithFeatureAvailabilityProviding:(id)a3 userDefaults:(id)a4 userDefaultsSyncProvider:(id)a5 didStart:(id)a6
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = [(HKRPOxygenSaturationOnboardingCacher *)self init];
  if (v15)
  {
    uint64_t v16 = HKCreateSerialDispatchQueue();
    queue = v15->_queue;
    v15->_queue = (OS_dispatch_queue *)v16;

    objc_storeStrong((id *)&v15->_featureAvailabilityProvider, a3);
    objc_storeStrong((id *)&v15->_userDefaults, a4);
    objc_storeStrong((id *)&v15->_userDefaultsSyncProvider, a5);
    [(HKFeatureAvailabilityProviding *)v15->_featureAvailabilityProvider registerObserver:v15 queue:v15->_queue];
    _HKInitializeLogging();
    v18 = (void *)*MEMORY[0x263F09950];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09950], OS_LOG_TYPE_DEFAULT))
    {
      v19 = v18;
      *(_DWORD *)buf = 138543362;
      id v27 = (id)objc_opt_class();
      id v20 = v27;
      _os_log_impl(&dword_21D42F000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@] Registered for feature availability changes", buf, 0xCu);
    }
    v21 = v15->_queue;
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __124__HKRPOxygenSaturationOnboardingCacher_initWithFeatureAvailabilityProviding_userDefaults_userDefaultsSyncProvider_didStart___block_invoke;
    v23[3] = &unk_264447388;
    v24 = v15;
    id v25 = v14;
    dispatch_async(v21, v23);
  }
  return v15;
}

uint64_t __124__HKRPOxygenSaturationOnboardingCacher_initWithFeatureAvailabilityProviding_userDefaults_userDefaultsSyncProvider_didStart___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_featureAvailabilityDidChange");
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)dealloc
{
  [(HKFeatureAvailabilityProviding *)self->_featureAvailabilityProvider unregisterObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)HKRPOxygenSaturationOnboardingCacher;
  [(HKRPOxygenSaturationOnboardingCacher *)&v3 dealloc];
}

- (void)_queue_featureAvailabilityDidChange
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v4 = a1;
  int v6 = 138543618;
  id v7 = (id)objc_opt_class();
  __int16 v8 = 2114;
  uint64_t v9 = a3;
  id v5 = v7;
  _os_log_error_impl(&dword_21D42F000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] Can't determine if the current onboarding version is compatible: %{public}@", (uint8_t *)&v6, 0x16u);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_userDefaultsSyncProvider, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);

  objc_storeStrong((id *)&self->_featureAvailabilityProvider, 0);
}

@end