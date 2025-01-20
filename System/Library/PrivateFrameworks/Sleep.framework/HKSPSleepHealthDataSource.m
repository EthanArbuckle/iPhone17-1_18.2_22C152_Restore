@interface HKSPSleepHealthDataSource
- (BOOL)requiresWeakRetention;
- (HKFeatureAvailabilityHealthDataSource)healthDataSource;
- (HKFeatureAvailabilityHealthDataSource)strongHealthDataSource;
- (HKFeatureAvailabilityHealthDataSource)weakHealthDataSource;
- (HKProfileIdentifier)profileIdentifier;
- (HKSPFeatureAvailabilityPairedDeviceRegistry)pairedDeviceRegistry;
- (HKSPSleepHealthDataSource)initWithSleepStore:(id)a3 healthDataSource:(id)a4;
- (HKSPSleepHealthDataSource)initWithSleepStore:(id)a3 healthDataSource:(id)a4 pairedDeviceRegistry:(id)a5;
- (HKSPSleepStore)sleepStore;
- (id)featureAvailabilityProvidingForFeatureIdentifier:(id)a3;
- (id)healthDataRequirementEvaluationProvider;
- (id)requirementSatisfactionOverridesDataSource;
- (id)sharedRequirementEvaluationDataSource;
- (id)userCharacteristicForDataType:(id)a3 error:(id *)a4;
- (id)watchLowPowerModeDataSource;
- (id)wristDetectionSettingManager;
@end

@implementation HKSPSleepHealthDataSource

- (BOOL)requiresWeakRetention
{
  return 0;
}

- (id)featureAvailabilityProvidingForFeatureIdentifier:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int IsProvidedBySleepDaemon = HKFeatureIdentifierIsProvidedBySleepDaemon();
  v6 = HKSPLogForCategory(1uLL);
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (IsProvidedBySleepDaemon)
  {
    if (v7)
    {
      int v13 = 138543618;
      v14 = self;
      __int16 v15 = 2114;
      id v16 = v4;
      _os_log_impl(&dword_1A7E74000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ returning sleep feature availability store for featureIdentifier: %{public}@", (uint8_t *)&v13, 0x16u);
    }

    v8 = [HKSPFeatureAvailabilityStore alloc];
    v9 = [(HKSPSleepHealthDataSource *)self sleepStore];
    v10 = [(HKSPSleepHealthDataSource *)self pairedDeviceRegistry];
    v11 = [(HKSPFeatureAvailabilityStore *)v8 initWithFeatureIdentifier:v4 sleepStore:v9 pairedDeviceRegistry:v10];
  }
  else
  {
    if (v7)
    {
      int v13 = 138543618;
      v14 = self;
      __int16 v15 = 2114;
      id v16 = v4;
      _os_log_impl(&dword_1A7E74000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ returning health feature availability store for featureIdentifier: %{public}@", (uint8_t *)&v13, 0x16u);
    }

    v9 = [(HKSPSleepHealthDataSource *)self healthDataSource];
    v11 = [v9 featureAvailabilityProvidingForFeatureIdentifier:v4];
  }

  return v11;
}

- (id)wristDetectionSettingManager
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = HKSPLogForCategory(1uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    v8 = self;
    _os_log_impl(&dword_1A7E74000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ returning wrist detection manager", (uint8_t *)&v7, 0xCu);
  }

  id v4 = [(HKSPSleepHealthDataSource *)self healthDataSource];
  v5 = [v4 wristDetectionSettingManager];

  return v5;
}

- (id)watchLowPowerModeDataSource
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = HKSPLogForCategory(1uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    v8 = self;
    _os_log_impl(&dword_1A7E74000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ returning watch low power mode data source", (uint8_t *)&v7, 0xCu);
  }

  id v4 = [(HKSPSleepHealthDataSource *)self healthDataSource];
  v5 = [v4 watchLowPowerModeDataSource];

  return v5;
}

- (HKSPSleepStore)sleepStore
{
  return self->_sleepStore;
}

- (id)requirementSatisfactionOverridesDataSource
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = HKSPLogForCategory(1uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    v8 = self;
    _os_log_impl(&dword_1A7E74000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ returning requirement satisfaction overrides data source", (uint8_t *)&v7, 0xCu);
  }

  id v4 = [(HKSPSleepHealthDataSource *)self healthDataSource];
  v5 = [v4 requirementSatisfactionOverridesDataSource];

  return v5;
}

- (HKProfileIdentifier)profileIdentifier
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = HKSPLogForCategory(1uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    v8 = self;
    _os_log_impl(&dword_1A7E74000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ returning profile identifier", (uint8_t *)&v7, 0xCu);
  }

  id v4 = [(HKSPSleepHealthDataSource *)self healthDataSource];
  v5 = [v4 profileIdentifier];

  return (HKProfileIdentifier *)v5;
}

- (HKSPFeatureAvailabilityPairedDeviceRegistry)pairedDeviceRegistry
{
  return self->_pairedDeviceRegistry;
}

- (HKSPSleepHealthDataSource)initWithSleepStore:(id)a3 healthDataSource:(id)a4 pairedDeviceRegistry:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)HKSPSleepHealthDataSource;
  v12 = [(HKSPSleepHealthDataSource *)&v20 init];
  if (v12)
  {
    int v13 = HKSPLogForCategory(1uLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v22 = v12;
      _os_log_impl(&dword_1A7E74000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ initializing...", buf, 0xCu);
    }

    objc_storeStrong((id *)&v12->_sleepStore, a3);
    objc_storeStrong((id *)&v12->_pairedDeviceRegistry, a5);
    int v14 = [v10 requiresWeakRetention];
    p_weakHealthDataSource = (id *)&v12->_weakHealthDataSource;
    if (v14)
    {
      objc_storeWeak(p_weakHealthDataSource, v10);
      id v16 = 0;
    }
    else
    {
      objc_storeWeak(p_weakHealthDataSource, 0);
      id v16 = (HKFeatureAvailabilityHealthDataSource *)v10;
    }
    strongHealthDataSource = v12->_strongHealthDataSource;
    v12->_strongHealthDataSource = v16;

    v18 = v12;
  }

  return v12;
}

- (HKSPSleepHealthDataSource)initWithSleepStore:(id)a3 healthDataSource:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_alloc_init(HKSPPairedDeviceRegistryProvider);
  id v9 = [(HKSPSleepHealthDataSource *)self initWithSleepStore:v7 healthDataSource:v6 pairedDeviceRegistry:v8];

  return v9;
}

- (HKFeatureAvailabilityHealthDataSource)healthDataSource
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  WeakRetained = (HKFeatureAvailabilityHealthDataSource *)objc_loadWeakRetained((id *)&self->_weakHealthDataSource);
  strongHealthDataSource = WeakRetained;
  if (WeakRetained || (strongHealthDataSource = self->_strongHealthDataSource) != 0)
  {
    v5 = strongHealthDataSource;
  }
  else
  {
    id v7 = HKSPLogForCategory(1uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138543362;
      id v9 = self;
      _os_log_error_impl(&dword_1A7E74000, v7, OS_LOG_TYPE_ERROR, "%{public}@ health data source is nil", (uint8_t *)&v8, 0xCu);
    }

    v5 = 0;
  }

  return v5;
}

- (id)healthDataRequirementEvaluationProvider
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = HKSPLogForCategory(1uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    int v8 = self;
    _os_log_impl(&dword_1A7E74000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ returning health data requirement evaluation provider", (uint8_t *)&v7, 0xCu);
  }

  id v4 = [(HKSPSleepHealthDataSource *)self healthDataSource];
  v5 = [v4 healthDataRequirementEvaluationProvider];

  return v5;
}

- (id)sharedRequirementEvaluationDataSource
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = HKSPLogForCategory(1uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    int v8 = self;
    _os_log_impl(&dword_1A7E74000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ shared requirement evaluation data source", (uint8_t *)&v7, 0xCu);
  }

  id v4 = [(HKSPSleepHealthDataSource *)self healthDataSource];
  v5 = [v4 sharedRequirementEvaluationDataSource];

  return v5;
}

- (id)userCharacteristicForDataType:(id)a3 error:(id *)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = HKSPLogForCategory(1uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543618;
    v12 = self;
    __int16 v13 = 2114;
    id v14 = v6;
    _os_log_impl(&dword_1A7E74000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ returning user characteristics for datatype: %{public}@", (uint8_t *)&v11, 0x16u);
  }

  int v8 = [(HKSPSleepHealthDataSource *)self healthDataSource];
  uint64_t v9 = [v8 userCharacteristicForDataType:v6 error:a4];

  return v9;
}

- (HKFeatureAvailabilityHealthDataSource)weakHealthDataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weakHealthDataSource);
  return (HKFeatureAvailabilityHealthDataSource *)WeakRetained;
}

- (HKFeatureAvailabilityHealthDataSource)strongHealthDataSource
{
  return self->_strongHealthDataSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strongHealthDataSource, 0);
  objc_destroyWeak((id *)&self->_weakHealthDataSource);
  objc_storeStrong((id *)&self->_pairedDeviceRegistry, 0);
  objc_storeStrong((id *)&self->_sleepStore, 0);
}

@end