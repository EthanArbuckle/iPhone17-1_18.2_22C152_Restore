@interface HDRespiratoryProfileExtension
- (HDFeatureAvailabilityExtension)featureAvailabilityManager;
- (HDProfile)profile;
- (HDRPRespiratoryDailyAnalytics)dailyAnalytics;
- (HDRespiratoryProfileExtension)initWithProfile:(id)a3;
- (HDRespiratoryProfileExtension)initWithProfile:(id)a3 featureAvailabilityManager:(id)a4 ageGatingDefaults:(id)a5;
- (id)diagnosticDescription;
- (id)featureAvailabilityExtensionForFeatureIdentifier:(id)a3;
- (id)oxygenSaturationSessionWithDelegate:(id)a3 queue:(id)a4;
- (id)unitTesting_healthLiteSessionWithDelegateHandler;
- (void)_setupOrResetSettingsIfNeededWithFeatureAvailabilityManager:(id)a3;
- (void)_setupSettingsWithProfile:(id)a3;
- (void)_updateBackgroundRecordingSettings;
- (void)dealloc;
- (void)featureAvailabilityExtensionDidUpdateRegionAvailability:(id)a3;
- (void)featureAvailabilityExtensionOnboardingCompletionDataDidBecomeAvailable:(id)a3;
- (void)featureAvailabilityProvidingDidUpdateOnboardingCompletion:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)profileDidBecomeReady:(id)a3;
- (void)setFeatureAvailabilityManager:(id)a3;
- (void)setUnitTesting_healthLiteSessionWithDelegateHandler:(id)a3;
- (void)startObservingAgeGatingDefaults;
@end

@implementation HDRespiratoryProfileExtension

- (id)featureAvailabilityExtensionForFeatureIdentifier:(id)a3
{
  if ([a3 isEqualToString:*MEMORY[0x263F097B8]]) {
    v4 = self->_featureAvailabilityManager;
  }
  else {
    v4 = 0;
  }
  return v4;
}

- (HDRespiratoryProfileExtension)initWithProfile:(id)a3
{
  id v4 = a3;
  v5 = HDRPOxygenSaturationRecordingFeatureAvailabilityProvider(v4);
  id v6 = objc_alloc(MEMORY[0x263EFFA40]);
  v7 = (void *)[v6 initWithSuiteName:*MEMORY[0x263F0AC48]];
  v8 = [(HDRespiratoryProfileExtension *)self initWithProfile:v4 featureAvailabilityManager:v5 ageGatingDefaults:v7];

  return v8;
}

- (HDRespiratoryProfileExtension)initWithProfile:(id)a3 featureAvailabilityManager:(id)a4 ageGatingDefaults:(id)a5
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v36.receiver = self;
  v36.super_class = (Class)HDRespiratoryProfileExtension;
  v11 = [(HDRespiratoryProfileExtension *)&v36 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_profile, v8);
    objc_storeStrong((id *)&v12->_featureAvailabilityManager, a4);
    uint64_t v13 = HKCreateSerialDispatchQueue();
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v13;

    _HKInitializeLogging();
    v15 = (void *)MEMORY[0x263F09950];
    v16 = (void *)*MEMORY[0x263F09950];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09950], OS_LOG_TYPE_DEFAULT))
    {
      v17 = v16;
      v18 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v38 = v18;
      id v19 = v18;
      _os_log_impl(&dword_226AA6000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] Plugin loaded", buf, 0xCu);
    }
    objc_storeStrong((id *)&v12->_ageGatingDefaults, a5);
    v20 = [MEMORY[0x263F0A980] sharedBehavior];
    int v21 = [v20 isAppleWatch];

    if (v21)
    {
      v22 = objc_msgSend(MEMORY[0x263EFFA40], "hkrp_respiratoryDefaults");
      id v23 = objc_alloc(MEMORY[0x263F64220]);
      v24 = (void *)[v23 initWithUserDefaultsDomain:*MEMORY[0x263F09F70]];
      uint64_t v25 = [objc_alloc(MEMORY[0x263F64200]) initWithFeatureAvailabilityProviding:v12->_featureAvailabilityManager userDefaults:v22 userDefaultsSyncProvider:v24];
      onboardingCacher = v12->_onboardingCacher;
      v12->_onboardingCacher = (HKRPOxygenSaturationOnboardingCacher *)v25;
    }
    v27 = [MEMORY[0x263F0A980] sharedBehavior];
    int v28 = [v27 isCompanionCapable];

    if (v28)
    {
      uint64_t v29 = [objc_alloc(MEMORY[0x263F43178]) initWithProfile:v8 featureAvailabilityExtension:v9 loggingCategory:*v15];
      featureDeliveryManager = v12->_featureDeliveryManager;
      v12->_featureDeliveryManager = (HDBackgroundFeatureDeliveryManager *)v29;

      v31 = [[HDRPRespiratoryDailyAnalytics alloc] initWithProfile:v8 featureAvailabilityProvider:v12->_featureAvailabilityManager];
      dailyAnalytics = v12->_dailyAnalytics;
      v12->_dailyAnalytics = v31;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&v12->_profile);
    [WeakRetained registerProfileReadyObserver:v12 queue:v12->_queue];

    v34 = [MEMORY[0x263F43498] sharedDiagnosticManager];
    [v34 addObject:v12];
  }
  return v12;
}

- (void)dealloc
{
  [(NSUserDefaults *)self->_ageGatingDefaults removeObserver:self forKeyPath:*MEMORY[0x263F0AC58]];
  v3.receiver = self;
  v3.super_class = (Class)HDRespiratoryProfileExtension;
  [(HDRespiratoryProfileExtension *)&v3 dealloc];
}

- (void)startObservingAgeGatingDefaults
{
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([v10 isEqualToString:*MEMORY[0x263F0AC58]])
  {
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __80__HDRespiratoryProfileExtension_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_2647C69E8;
    block[4] = self;
    id v16 = v10;
    id v17 = v12;
    dispatch_async(queue, block);
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)HDRespiratoryProfileExtension;
    [(HDRespiratoryProfileExtension *)&v14 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

uint64_t __80__HDRespiratoryProfileExtension_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x263F09950];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09950], OS_LOG_TYPE_DEFAULT))
  {
    objc_super v3 = v2;
    id v4 = objc_opt_class();
    uint64_t v6 = *(void *)(a1 + 40);
    v5 = *(void **)(a1 + 48);
    uint64_t v7 = *MEMORY[0x263F081C8];
    id v8 = v4;
    id v9 = [v5 objectForKeyedSubscript:v7];
    id v10 = [*(id *)(a1 + 48) objectForKeyedSubscript:*MEMORY[0x263F081B8]];
    int v12 = 138544130;
    uint64_t v13 = v4;
    __int16 v14 = 2114;
    uint64_t v15 = v6;
    __int16 v16 = 2114;
    id v17 = v9;
    __int16 v18 = 2114;
    id v19 = v10;
    _os_log_impl(&dword_226AA6000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] %{public}@ changed: %{public}@ -> %{public}@", (uint8_t *)&v12, 0x2Au);
  }
  return [*(id *)(a1 + 32) _updateBackgroundRecordingSettings];
}

- (id)oxygenSaturationSessionWithDelegate:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HDRespiratoryProfileExtension *)self unitTesting_healthLiteSessionWithDelegateHandler];
  id v9 = (void *)v8;
  if (v8)
  {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v6, v7);
    id v10 = (HLOxygenSaturationSession *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v10 = [[HLOxygenSaturationSession alloc] initWithDelegate:v6 onQueue:v7];
  }
  id v11 = v10;

  return v11;
}

- (void)profileDidBecomeReady:(id)a3
{
  id v6 = a3;
  id v4 = [MEMORY[0x263F0A980] sharedBehavior];
  int v5 = [v4 isCompanionCapable];

  if (v5)
  {
    [(HDRespiratoryProfileExtension *)self _setupSettingsWithProfile:v6];
    [(HDRespiratoryProfileExtension *)self _updateBackgroundRecordingSettings];
  }
  [(HDFeatureAvailabilityExtension *)self->_featureAvailabilityManager registerObserver:self queue:self->_queue];
  [(HDRespiratoryProfileExtension *)self startObservingAgeGatingDefaults];
}

- (void)featureAvailabilityProvidingDidUpdateOnboardingCompletion:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  _HKInitializeLogging();
  int v5 = *MEMORY[0x263F09950];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09950], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = self;
    _os_log_impl(&dword_226AA6000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received notice of onboarding completion change", (uint8_t *)&v6, 0xCu);
  }
  [(HDRespiratoryProfileExtension *)self _updateBackgroundRecordingSettings];
  [(HDRespiratoryProfileExtension *)self _setupOrResetSettingsIfNeededWithFeatureAvailabilityManager:v4];
}

- (void)featureAvailabilityExtensionOnboardingCompletionDataDidBecomeAvailable:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  id v4 = *MEMORY[0x263F09950];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09950], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    int v6 = self;
    _os_log_impl(&dword_226AA6000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received notice of onboarding completion data becoming available", (uint8_t *)&v5, 0xCu);
  }
  [(HDRespiratoryProfileExtension *)self _updateBackgroundRecordingSettings];
}

- (void)featureAvailabilityExtensionDidUpdateRegionAvailability:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  id v4 = *MEMORY[0x263F09950];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09950], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    int v6 = self;
    _os_log_impl(&dword_226AA6000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received notice of region list change", (uint8_t *)&v5, 0xCu);
  }
  [(HDRespiratoryProfileExtension *)self _updateBackgroundRecordingSettings];
}

- (void)_setupSettingsWithProfile:(id)a3
{
  objc_msgSend(MEMORY[0x263EFFA40], "hkrp_respiratoryDefaults", a3);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = objc_alloc(MEMORY[0x263F64220]);
  int v5 = (void *)[v4 initWithUserDefaultsDomain:*MEMORY[0x263F09F70]];
  int v6 = (HKRPOxygenSaturationSettings *)[objc_alloc(MEMORY[0x263F64218]) initWithUserDefaults:v8 userDefaultsSyncProvider:v5];
  settings = self->_settings;
  self->_settings = v6;
}

- (void)_setupOrResetSettingsIfNeededWithFeatureAvailabilityManager:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v19 = 0;
  id v4 = [a3 featureOnboardingRecordWithError:&v19];
  id v5 = v19;
  if (v4)
  {
    int v6 = [MEMORY[0x263F0A980] sharedBehavior];
    if ([v6 isAppleInternalInstall])
    {
      uint64_t v7 = [v4 onboardingState];

      if (v7 == 1)
      {
        _HKInitializeLogging();
        id v8 = (void *)*MEMORY[0x263F09950];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09950], OS_LOG_TYPE_DEFAULT))
        {
          id v9 = v8;
          id v10 = objc_opt_class();
          *(_DWORD *)buf = 138543362;
          int v21 = v10;
          id v11 = v10;
          _os_log_impl(&dword_226AA6000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Removing user defaults settings", buf, 0xCu);
        }
        [(HKRPOxygenSaturationSettings *)self->_settings reset];
        goto LABEL_16;
      }
    }
    else
    {
    }
    uint64_t v13 = [MEMORY[0x263F0A980] sharedBehavior];
    if ([v13 isCompanionCapable])
    {
      uint64_t v14 = [v4 onboardingState];

      if (v14 == 2)
      {
        _HKInitializeLogging();
        uint64_t v15 = (void *)*MEMORY[0x263F09950];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09950], OS_LOG_TYPE_DEFAULT))
        {
          __int16 v16 = v15;
          id v17 = objc_opt_class();
          *(_DWORD *)buf = 138543362;
          int v21 = v17;
          id v18 = v17;
          _os_log_impl(&dword_226AA6000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] Initializing defaults settings", buf, 0xCu);
        }
        [(HKRPOxygenSaturationSettings *)self->_settings activateDefaultValuesIfNeeded];
      }
    }
    else
    {
    }
  }
  else
  {
    _HKInitializeLogging();
    int v12 = (void *)*MEMORY[0x263F09950];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09950], OS_LOG_TYPE_ERROR)) {
      -[HDRespiratoryProfileExtension _setupOrResetSettingsIfNeededWithFeatureAvailabilityManager:](v12);
    }
  }
LABEL_16:
}

- (void)_updateBackgroundRecordingSettings
{
  id v1 = a1;
  v2 = objc_opt_class();
  id v3 = OUTLINED_FUNCTION_0_0(v2);
  OUTLINED_FUNCTION_1(&dword_226AA6000, v4, v5, "[%{public}@] Failed to check if Blood Oxygen is supported with error: %@", v6, v7, v8, v9, v10);
}

- (id)diagnosticDescription
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithBool:", -[HKRPOxygenSaturationSettings oxygenSaturationDisabled](self->_settings, "oxygenSaturationDisabled"));
  [v3 appendFormat:@"oxygenSaturationDisabled: %@\n", v4];

  uint64_t v5 = objc_msgSend(NSNumber, "numberWithBool:", -[HKRPOxygenSaturationSettings backgroundRecordingsEnabled](self->_settings, "backgroundRecordingsEnabled"));
  [v3 appendFormat:@"backgroundRecordingsEnabled: %@\n", v5];

  uint64_t v6 = objc_msgSend(NSNumber, "numberWithBool:", -[HKRPOxygenSaturationSettings backgroundRecordingsDuringSleepMode](self->_settings, "backgroundRecordingsDuringSleepMode"));
  [v3 appendFormat:@"backgroundRecordingsDuringSleepMode: %@\n", v6];

  uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[HKRPOxygenSaturationSettings backgroundRecordingsDuringTheaterMode](self->_settings, "backgroundRecordingsDuringTheaterMode"));
  [v3 appendFormat:@"backgroundRecordingsDuringTheaterMode: %@\n", v7];

  uint64_t v8 = objc_msgSend(NSNumber, "numberWithBool:", -[HKRPOxygenSaturationSettings overrideIsRemoteDisabled](self->_settings, "overrideIsRemoteDisabled"));
  [v3 appendFormat:@"overrideIsRemoteDisabled: %@\n", v8];

  uint64_t v9 = (void *)[v3 copy];
  return v9;
}

- (HDProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  return (HDProfile *)WeakRetained;
}

- (HDRPRespiratoryDailyAnalytics)dailyAnalytics
{
  return self->_dailyAnalytics;
}

- (id)unitTesting_healthLiteSessionWithDelegateHandler
{
  return self->_unitTesting_healthLiteSessionWithDelegateHandler;
}

- (void)setUnitTesting_healthLiteSessionWithDelegateHandler:(id)a3
{
}

- (HDFeatureAvailabilityExtension)featureAvailabilityManager
{
  return self->_featureAvailabilityManager;
}

- (void)setFeatureAvailabilityManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTesting_healthLiteSessionWithDelegateHandler, 0);
  objc_storeStrong((id *)&self->_dailyAnalytics, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_ageGatingDefaults, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_onboardingCacher, 0);
  objc_storeStrong((id *)&self->_featureDeliveryManager, 0);
  objc_storeStrong((id *)&self->_featureAvailabilityManager, 0);
}

- (void)_setupOrResetSettingsIfNeededWithFeatureAvailabilityManager:(void *)a1 .cold.1(void *a1)
{
  id v1 = a1;
  v2 = objc_opt_class();
  id v3 = OUTLINED_FUNCTION_0_0(v2);
  OUTLINED_FUNCTION_1(&dword_226AA6000, v4, v5, "[%{public}@] Failed to remove user defaults settings with error: %@", v6, v7, v8, v9, v10);
}

@end