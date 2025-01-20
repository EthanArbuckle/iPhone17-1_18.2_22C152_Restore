@interface HKSPFeatureAvailabilityStore
- (BOOL)_isCurrentOnboardingVersionCompletedForOnboardingModel:(id)a3;
- (BOOL)_updateCachedFeatureSettingsModel:(id)a3;
- (BOOL)_updateCachedOnboardingModel:(id)a3;
- (HKSPFeatureAvailabilityStore)initWithFeatureIdentifier:(id)a3 sleepStore:(id)a4;
- (HKSPFeatureAvailabilityStore)initWithFeatureIdentifier:(id)a3 sleepStore:(id)a4 pairedDeviceRegistry:(id)a5;
- (NSString)description;
- (NSString)featureIdentifier;
- (id)_defaultRequirements;
- (id)_defaultSleepTrackingRequirements;
- (id)_featureSettingsForOnboardingModel:(id)a3 featureSettingsModel:(id)a4;
- (id)_featureSettingsModelWithError:(id *)a3;
- (id)_onboardSleepTrackingRequirements;
- (id)_onboardingCompletionForOnboardingModel:(id)a3;
- (id)_onboardingModelWithError:(id *)a3;
- (id)_sleepTrackingRequirements;
- (id)_useSleepTrackingRequirements;
- (id)canCompleteOnboardingForCountryCode:(id)a3 error:(id *)a4;
- (id)earliestDateLowestOnboardingVersionCompletedWithError:(id *)a3;
- (id)featureAvailabilityRequirementsWithError:(id *)a3;
- (id)featureOnboardingRecordWithError:(id *)a3;
- (id)isCurrentOnboardingVersionCompletedWithError:(id *)a3;
- (id)isFeatureCapabilitySupportedOnActivePairedDeviceWithError:(id *)a3;
- (id)onboardedCountryCodeSupportedStateWithError:(id *)a3;
- (id)onboardingEligibilityForCountryCode:(id)a3 error:(id *)a4;
- (id)pairedFeatureAttributesWithError:(id *)a3;
- (id)regionAvailabilityWithError:(id *)a3;
- (int64_t)_onboardedCountrySupportedStateForOnboardingModel:(id)a3;
- (unint64_t)_onboardingIneligibilityReasons;
- (void)_notifyObserversForDidUpdateOnboarding;
- (void)_notifyObserversForDidUpdateSettings;
- (void)_onboardingModelWithCompletion:(id)a3;
- (void)_pairedDeviceDidChange;
- (void)_registerForNotifications;
- (void)_withLock:(id)a3;
- (void)dealloc;
- (void)getFeatureOnboardingRecordWithCompletion:(id)a3;
- (void)isCurrentOnboardingVersionCompletedWithCompletion:(id)a3;
- (void)registerObserver:(id)a3 queue:(id)a4;
- (void)removeFeatureSettingValueForKey:(id)a3 completion:(id)a4;
- (void)resetOnboardingWithCompletion:(id)a3;
- (void)saveOnboardingCompletion:(id)a3 settings:(id)a4 completion:(id)a5;
- (void)setCurrentOnboardingVersionCompletedForCountryCode:(id)a3 countryCodeProvenance:(int64_t)a4 date:(id)a5 settings:(id)a6 completion:(id)a7;
- (void)setFeatureSettingData:(id)a3 forKey:(id)a4 completion:(id)a5;
- (void)setFeatureSettingNumber:(id)a3 forKey:(id)a4 completion:(id)a5;
- (void)setFeatureSettingString:(id)a3 forKey:(id)a4 completion:(id)a5;
- (void)sleepStore:(id)a3 sleepEventRecordDidChange:(id)a4;
- (void)sleepStore:(id)a3 sleepSettingsDidChange:(id)a4;
- (void)unregisterObserver:(id)a3;
@end

@implementation HKSPFeatureAvailabilityStore

- (NSString)featureIdentifier
{
  return self->_featureIdentifier;
}

- (HKSPFeatureAvailabilityStore)initWithFeatureIdentifier:(id)a3 sleepStore:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_alloc_init(HKSPPairedDeviceRegistryProvider);
  v9 = [(HKSPFeatureAvailabilityStore *)self initWithFeatureIdentifier:v7 sleepStore:v6 pairedDeviceRegistry:v8];

  return v9;
}

- (HKSPFeatureAvailabilityStore)initWithFeatureIdentifier:(id)a3 sleepStore:(id)a4 pairedDeviceRegistry:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v21.receiver = self;
  v21.super_class = (Class)HKSPFeatureAvailabilityStore;
  v13 = [(HKSPFeatureAvailabilityStore *)&v21 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_featureIdentifier, a3);
    objc_storeStrong((id *)&v14->_sleepStore, a4);
    v15 = objc_alloc_init(HKSPObserverSet);
    observers = v14->_observers;
    v14->_observers = v15;

    objc_storeStrong((id *)&v14->_pairedDeviceRegistry, a5);
    v14->_deviceCharacteristicChangeNotifyToken = -1;
    v14->_modelLock._os_unfair_lock_opaque = 0;
    if ([v10 isEqualToString:*MEMORY[0x1E4F29DB8]])
    {
      v14->_feature = 0;
    }
    else
    {
      if ([v10 isEqualToString:*MEMORY[0x1E4F29DC0]])
      {
        uint64_t v17 = 1;
      }
      else
      {
        if (![v10 isEqualToString:*MEMORY[0x1E4F29DB0]])
        {
          v18 = [MEMORY[0x1E4F28B00] currentHandler];
          [v18 handleFailureInMethod:a2, v14, @"HKSPFeatureAvailabilityStore.m", 102, @"Unsupported feature identifier %@", v10 object file lineNumber description];

          goto LABEL_10;
        }
        uint64_t v17 = 2;
      }
      v14->_feature = v17;
    }
LABEL_10:
    [(HKSPFeatureAvailabilityStore *)v14 _registerForNotifications];
    v19 = v14;
  }

  return v14;
}

- (void)registerObserver:(id)a3 queue:(id)a4
{
  observers = self->_observers;
  id v6 = a3;
  HKSPQueueBackedScheduler(a4);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(HKSPObserverSet *)observers addObserver:v6 callbackScheduler:v7];
}

- (void)_registerForNotifications
{
  [(HKSPSleepOnboardingStore *)self->_sleepStore addObserver:self];
  if (self->_pairedDeviceRegistry)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:self selector:sel__pairedDeviceDidChange name:*MEMORY[0x1E4F79E88] object:0];

    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:self selector:sel__pairedDeviceDidChange name:*MEMORY[0x1E4F79EA0] object:0];

    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:self selector:sel__pairedDeviceDidChange name:*MEMORY[0x1E4F79EB8] object:0];

    self->_deviceCharacteristicChangeNotifyToken = -1;
    p_deviceCharacteristicChangeNotifyToken = &self->_deviceCharacteristicChangeNotifyToken;
    objc_initWeak(&location, self);
    id v7 = (const char *)[(id)*MEMORY[0x1E4F79ED0] UTF8String];
    v8 = MEMORY[0x1E4F14428];
    id v9 = MEMORY[0x1E4F14428];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __57__HKSPFeatureAvailabilityStore__registerForNotifications__block_invoke;
    v10[3] = &unk_1E5D328E0;
    objc_copyWeak(&v11, &location);
    notify_register_dispatch(v7, p_deviceCharacteristicChangeNotifyToken, v8, v10);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

- (id)featureOnboardingRecordWithError:(id *)a3
{
  v5 = [MEMORY[0x1E4F2B860] sharedBehavior];
  char v6 = objc_msgSend(v5, "hksp_supportsSleepDaemon");

  if ((v6 & 1) == 0)
  {
    v16 = (void *)[objc_alloc(MEMORY[0x1E4F2B050]) initWithOnboardingState:1 onboardingCompletion:0 featureSettings:0];
    goto LABEL_18;
  }
  id v21 = 0;
  id v7 = [(HKSPFeatureAvailabilityStore *)self _featureSettingsModelWithError:&v21];
  id v8 = v21;
  id v9 = v8;
  if (v7)
  {
    id v20 = 0;
    id v10 = [(HKSPFeatureAvailabilityStore *)self _onboardingModelWithError:&v20];
    id v11 = v20;
    id v12 = v11;
    if (v10)
    {
      int64_t v13 = [(HKSPFeatureAvailabilityStore *)self _onboardedCountrySupportedStateForOnboardingModel:v10];
      id v14 = [(HKSPFeatureAvailabilityStore *)self _onboardingCompletionForOnboardingModel:v10];
      v15 = [(HKSPFeatureAvailabilityStore *)self _featureSettingsForOnboardingModel:v10 featureSettingsModel:v7];
      v16 = (void *)[objc_alloc(MEMORY[0x1E4F2B050]) initWithOnboardingState:v13 onboardingCompletion:v14 featureSettings:v15];

LABEL_16:
      goto LABEL_17;
    }
    id v18 = v11;
    id v14 = v18;
    if (v18)
    {
      if (a3)
      {
        id v14 = v18;
        v16 = 0;
        *a3 = v14;
        goto LABEL_16;
      }
      _HKLogDroppedError();
    }
    v16 = 0;
    goto LABEL_16;
  }
  id v17 = v8;
  id v12 = v17;
  if (!v17) {
    goto LABEL_13;
  }
  if (!a3)
  {
    _HKLogDroppedError();
LABEL_13:
    v16 = 0;
    goto LABEL_17;
  }
  id v12 = v17;
  v16 = 0;
  *a3 = v12;
LABEL_17:

LABEL_18:
  return v16;
}

- (id)_onboardingModelWithError:(id *)a3
{
  v4 = [(HKSPSleepOnboardingStore *)self->_sleepStore currentSleepEventRecordWithError:a3];
  [(HKSPFeatureAvailabilityStore *)self _updateCachedOnboardingModel:v4];
  return v4;
}

- (BOOL)_updateCachedOnboardingModel:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    uint64_t v11 = 0;
    id v12 = &v11;
    uint64_t v13 = 0x2020000000;
    char v14 = 0;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __61__HKSPFeatureAvailabilityStore__updateCachedOnboardingModel___block_invoke;
    v8[3] = &unk_1E5D32148;
    id v10 = &v11;
    v8[4] = self;
    id v9 = v4;
    [(HKSPFeatureAvailabilityStore *)self _withLock:v8];
    BOOL v6 = *((unsigned char *)v12 + 24) != 0;

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)_withLock:(id)a3
{
  p_modelLock = &self->_modelLock;
  id v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_modelLock);
  v4[2](v4);

  os_unfair_lock_unlock(p_modelLock);
}

uint64_t __61__HKSPFeatureAvailabilityStore__updateCachedOnboardingModel___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 48);
  if (v2) {
    int v3 = [v2 isEqualToOnboardingModel:*(void *)(a1 + 40)] ^ 1;
  }
  else {
    LOBYTE(v3) = 1;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v3;
  *(void *)(*(void *)(a1 + 32) + 48) = [*(id *)(a1 + 40) copy];
  return MEMORY[0x1F41817F8]();
}

uint64_t __66__HKSPFeatureAvailabilityStore__updateCachedFeatureSettingsModel___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 56);
  if (v2) {
    int v3 = [v2 isEqualToFeatureSettingsModel:*(void *)(a1 + 40)] ^ 1;
  }
  else {
    LOBYTE(v3) = 1;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v3;
  *(void *)(*(void *)(a1 + 32) + 56) = [*(id *)(a1 + 40) copy];
  return MEMORY[0x1F41817F8]();
}

- (int64_t)_onboardedCountrySupportedStateForOnboardingModel:(id)a3
{
  if ([(HKSPFeatureAvailabilityStore *)self _isCurrentOnboardingVersionCompletedForOnboardingModel:a3])
  {
    return 2;
  }
  else
  {
    return 1;
  }
}

- (id)_featureSettingsModelWithError:(id *)a3
{
  id v4 = [(HKSPSleepOnboardingStore *)self->_sleepStore currentSleepSettingsWithError:a3];
  [(HKSPFeatureAvailabilityStore *)self _updateCachedFeatureSettingsModel:v4];
  return v4;
}

- (BOOL)_updateCachedFeatureSettingsModel:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    uint64_t v11 = 0;
    id v12 = &v11;
    uint64_t v13 = 0x2020000000;
    char v14 = 0;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __66__HKSPFeatureAvailabilityStore__updateCachedFeatureSettingsModel___block_invoke;
    v8[3] = &unk_1E5D32148;
    id v10 = &v11;
    v8[4] = self;
    id v9 = v4;
    [(HKSPFeatureAvailabilityStore *)self _withLock:v8];
    BOOL v6 = *((unsigned char *)v12 + 24) != 0;

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)_featureSettingsForOnboardingModel:(id)a3 featureSettingsModel:(id)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  BOOL v7 = [(HKSPFeatureAvailabilityStore *)self _isCurrentOnboardingVersionCompletedForOnboardingModel:a3];
  id v8 = 0;
  if (v6)
  {
    if (v7)
    {
      id v8 = 0;
      int64_t feature = self->_feature;
      if (feature)
      {
        if (feature != 2)
        {
          if (feature == 1) {
            uint64_t v10 = [v6 sleepTrackingFeatureEnabled];
          }
          else {
            uint64_t v10 = 0;
          }
          id v11 = objc_alloc(MEMORY[0x1E4F2B058]);
          uint64_t v15 = *MEMORY[0x1E4F29DE0];
          id v12 = [MEMORY[0x1E4F28ED0] numberWithBool:v10];
          v16[0] = v12;
          uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
          id v8 = (void *)[v11 initWithDictionary:v13];
        }
      }
    }
  }

  return v8;
}

- (id)_onboardingCompletionForOnboardingModel:(id)a3
{
  id v4 = a3;
  v5 = v4;
  int64_t feature = self->_feature;
  if (feature == 2)
  {
    if ([v4 isCurrentSleepWindDownShortcutsOnboardingCompleted])
    {
      uint64_t v7 = [v5 sleepWindDownShortcutsOnboardingCompletedVersion];
      uint64_t v8 = [v5 sleepWindDownShortcutsOnboardingFirstCompletedDate];
      goto LABEL_10;
    }
LABEL_11:
    uint64_t v10 = 0;
    goto LABEL_16;
  }
  if (feature == 1)
  {
    if ([v4 isCurrentSleepTrackingOnboardingCompleted])
    {
      uint64_t v7 = [v5 sleepTrackingOnboardingCompletedVersion];
      uint64_t v8 = [v5 sleepTrackingOnboardingFirstCompletedDate];
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (feature)
  {
    id v9 = 0;
    uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_13;
  }
  if (![v4 isCurrentSleepCoachingOnboardingCompleted]) {
    goto LABEL_11;
  }
  uint64_t v7 = [v5 sleepCoachingOnboardingCompletedVersion];
  uint64_t v8 = [v5 sleepCoachingOnboardingFirstCompletedDate];
LABEL_10:
  id v9 = (void *)v8;
LABEL_13:
  id v11 = objc_alloc(MEMORY[0x1E4F2B2D8]);
  featureIdentifier = self->_featureIdentifier;
  if (!v9)
  {
    id v9 = [MEMORY[0x1E4F1C9C8] distantPast];
  }
  uint64_t v10 = (void *)[v11 initWithFeatureIdentifier:featureIdentifier version:v7 completionDate:v9 countryCode:0 countryCodeProvenance:0];

LABEL_16:
  return v10;
}

- (BOOL)_isCurrentOnboardingVersionCompletedForOnboardingModel:(id)a3
{
  id v4 = a3;
  v5 = v4;
  int64_t feature = self->_feature;
  switch(feature)
  {
    case 2:
      char v7 = [v4 isCurrentSleepWindDownShortcutsOnboardingCompleted];
      goto LABEL_7;
    case 1:
      char v7 = [v4 isCurrentSleepTrackingOnboardingCompleted];
      goto LABEL_7;
    case 0:
      char v7 = [v4 isCurrentSleepCoachingOnboardingCompleted];
LABEL_7:
      LOBYTE(self) = v7;
      break;
  }

  return self & 1;
}

void __63__HKSPFeatureAvailabilityStore__onboardingModelWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  [v5 _updateCachedOnboardingModel:v7];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __82__HKSPFeatureAvailabilityStore_isCurrentOnboardingVersionCompletedWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (void *)MEMORY[0x1E4F28ED0];
  id v6 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = a3;
  objc_msgSend(v4, "numberWithBool:", objc_msgSend(v6, "_isCurrentOnboardingVersionCompletedForOnboardingModel:", a2));
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v5 + 16))(v5, v8, v7);
}

- (void)isCurrentOnboardingVersionCompletedWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __82__HKSPFeatureAvailabilityStore_isCurrentOnboardingVersionCompletedWithCompletion___block_invoke;
  v6[3] = &unk_1E5D32908;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(HKSPFeatureAvailabilityStore *)self _onboardingModelWithCompletion:v6];
}

- (void)_onboardingModelWithCompletion:(id)a3
{
  id v4 = a3;
  sleepStore = self->_sleepStore;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__HKSPFeatureAvailabilityStore__onboardingModelWithCompletion___block_invoke;
  v7[3] = &unk_1E5D31FA8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(HKSPSleepOnboardingStore *)sleepStore currentSleepEventRecordWithCompletion:v7];
}

- (id)featureAvailabilityRequirementsWithError:(id *)a3
{
  int64_t feature = self->_feature;
  if (feature != 2)
  {
    if (feature == 1)
    {
      id v4 = [(HKSPFeatureAvailabilityStore *)self _sleepTrackingRequirements];
      goto LABEL_6;
    }
    if (feature) {
      goto LABEL_7;
    }
  }
  id v4 = [(HKSPFeatureAvailabilityStore *)self _defaultRequirements];
LABEL_6:
  a2 = v4;
LABEL_7:
  return (id)(id)a2;
}

- (id)_onboardSleepTrackingRequirements
{
  v9[2] = *MEMORY[0x1E4F143B8];
  int v3 = [(HKSPFeatureAvailabilityStore *)self _defaultSleepTrackingRequirements];
  id v4 = [MEMORY[0x1E4F2B030] onboardingRecordIsNotPresentForFeatureWithIdentifier:self->_featureIdentifier];
  v9[0] = v4;
  id v5 = [MEMORY[0x1E4F2B030] notAgeGatedForUserDefaultsKey:*MEMORY[0x1E4F2BCD0]];
  v9[1] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  id v7 = [v3 arrayByAddingObjectsFromArray:v6];

  return v7;
}

- (id)_sleepTrackingRequirements
{
  v11[3] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F2B028]);
  v10[0] = *MEMORY[0x1E4F29C08];
  id v4 = [(HKSPFeatureAvailabilityStore *)self _defaultSleepTrackingRequirements];
  v11[0] = v4;
  v10[1] = *MEMORY[0x1E4F29C00];
  id v5 = [(HKSPFeatureAvailabilityStore *)self _onboardSleepTrackingRequirements];
  v11[1] = v5;
  v10[2] = *MEMORY[0x1E4F29C20];
  id v6 = [(HKSPFeatureAvailabilityStore *)self _useSleepTrackingRequirements];
  v11[2] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];
  id v8 = (void *)[v3 initWithRequirementsByContext:v7];

  return v8;
}

- (id)_defaultSleepTrackingRequirements
{
  v7[2] = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F2B030] activeRemoteDeviceIsPresentWhenRequiredForRegionAvailabilityOrDeviceCapabilityForFeatureWithIdentifier:self->_featureIdentifier];
  v7[0] = v3;
  id v4 = [MEMORY[0x1E4F2B030] capabilityIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:self->_featureIdentifier];
  v7[1] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];

  return v5;
}

- (id)_useSleepTrackingRequirements
{
  void v10[3] = *MEMORY[0x1E4F143B8];
  id v3 = [(HKSPFeatureAvailabilityStore *)self _defaultSleepTrackingRequirements];
  id v4 = [MEMORY[0x1E4F2B030] onboardingRecordIsPresentForFeatureWithIdentifier:self->_featureIdentifier];
  id v5 = objc_msgSend(MEMORY[0x1E4F2B030], "wristDetectionIsEnabledForActiveWatch", v4);
  v10[1] = v5;
  id v6 = [MEMORY[0x1E4F2B030] featureIsOnWithIdentifier:self->_featureIdentifier isOnIfSettingIsAbsent:0];
  v10[2] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:3];
  id v8 = [v3 arrayByAddingObjectsFromArray:v7];

  return v8;
}

- (id)onboardingEligibilityForCountryCode:(id)a3 error:(id *)a4
{
  id v5 = objc_alloc(MEMORY[0x1E4F2B008]);
  unint64_t v6 = [(HKSPFeatureAvailabilityStore *)self _onboardingIneligibilityReasons];
  id v7 = [MEMORY[0x1E4F2B410] uncheckedAvailability];
  id v8 = [v7 version];
  id v9 = (void *)[v5 initWithIneligibilityReasons:v6 countryAvailabilityVersion:v8];

  return v9;
}

- (unint64_t)_onboardingIneligibilityReasons
{
  if (self->_feature != 1) {
    return 0;
  }
  id v3 = [MEMORY[0x1E4F2B860] sharedBehavior];
  char v4 = [v3 isAppleWatch];

  if (v4) {
    return 0;
  }
  unint64_t v6 = [(HKSPFeatureAvailabilityPairedDeviceRegistry *)self->_pairedDeviceRegistry getActivePairedDevice];
  if (v6)
  {
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"C0F3C2C3-0CDE-4DF9-A95A-789AC9A0348B"];
    if ([v6 supportsCapability:v7]) {
      unint64_t v5 = 0;
    }
    else {
      unint64_t v5 = 4;
    }
  }
  else
  {
    unint64_t v5 = 2;
  }

  return v5;
}

- (id)isCurrentOnboardingVersionCompletedWithError:(id *)a3
{
  char v4 = [(HKSPFeatureAvailabilityStore *)self _onboardingModelWithError:a3];
  if (v4)
  {
    unint64_t v5 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[HKSPFeatureAvailabilityStore _isCurrentOnboardingVersionCompletedForOnboardingModel:](self, "_isCurrentOnboardingVersionCompletedForOnboardingModel:", v4));
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (id)isFeatureCapabilitySupportedOnActivePairedDeviceWithError:(id *)a3
{
  id v3 = [(HKSPFeatureAvailabilityPairedDeviceRegistry *)self->_pairedDeviceRegistry getActivePairedDevice];
  if (v3)
  {
    char v4 = (void *)MEMORY[0x1E4F28ED0];
    unint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"C0F3C2C3-0CDE-4DF9-A95A-789AC9A0348B"];
    unint64_t v6 = objc_msgSend(v4, "numberWithBool:", objc_msgSend(v3, "supportsCapability:", v5));
  }
  else
  {
    unint64_t v6 = (void *)MEMORY[0x1E4F1CC28];
  }

  return v6;
}

void __57__HKSPFeatureAvailabilityStore__registerForNotifications__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _pairedDeviceDidChange];
}

- (void)dealloc
{
  int deviceCharacteristicChangeNotifyToken = self->_deviceCharacteristicChangeNotifyToken;
  if (deviceCharacteristicChangeNotifyToken != -1)
  {
    notify_cancel(deviceCharacteristicChangeNotifyToken);
    self->_int deviceCharacteristicChangeNotifyToken = -1;
  }
  v4.receiver = self;
  v4.super_class = (Class)HKSPFeatureAvailabilityStore;
  [(HKSPFeatureAvailabilityStore *)&v4 dealloc];
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"%@:%@", objc_opt_class(), self->_featureIdentifier];
}

- (id)_defaultRequirements
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F2B028]);
  uint64_t v4 = *MEMORY[0x1E4F29C08];
  v13[0] = MEMORY[0x1E4F1CBF0];
  uint64_t v5 = *MEMORY[0x1E4F29C00];
  v12[0] = v4;
  v12[1] = v5;
  unint64_t v6 = [MEMORY[0x1E4F2B030] onboardingRecordIsNotPresentForFeatureWithIdentifier:self->_featureIdentifier];
  id v11 = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
  v13[1] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  id v9 = (void *)[v3 initWithRequirementsByContext:v8];

  return v9;
}

- (void)getFeatureOnboardingRecordWithCompletion:(id)a3
{
  id v7 = 0;
  uint64_t v4 = (void (**)(id, void *, id))a3;
  uint64_t v5 = [(HKSPFeatureAvailabilityStore *)self featureOnboardingRecordWithError:&v7];
  id v6 = v7;
  v4[2](v4, v5, v6);
}

- (id)onboardedCountryCodeSupportedStateWithError:(id *)a3
{
  uint64_t v4 = [(HKSPFeatureAvailabilityStore *)self _onboardingModelWithError:a3];
  if (v4)
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", -[HKSPFeatureAvailabilityStore _onboardedCountrySupportedStateForOnboardingModel:](self, "_onboardedCountrySupportedStateForOnboardingModel:", v4));
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)earliestDateLowestOnboardingVersionCompletedWithError:(id *)a3
{
  id v3 = self;
  uint64_t v4 = [(HKSPFeatureAvailabilityStore *)self _onboardingModelWithError:a3];
  uint64_t v5 = v4;
  if (v4)
  {
    int64_t feature = v3->_feature;
    if (feature == 2)
    {
      uint64_t v7 = [v4 sleepWindDownShortcutsOnboardingFirstCompletedDate];
    }
    else if (feature == 1)
    {
      uint64_t v7 = [v4 sleepTrackingOnboardingFirstCompletedDate];
    }
    else
    {
      if (feature) {
        goto LABEL_10;
      }
      uint64_t v7 = [v4 sleepCoachingOnboardingFirstCompletedDate];
    }
    id v3 = (HKSPFeatureAvailabilityStore *)v7;
  }
  else
  {
    id v3 = 0;
  }
LABEL_10:

  return v3;
}

- (id)canCompleteOnboardingForCountryCode:(id)a3 error:(id *)a4
{
  uint64_t v4 = (void *)MEMORY[0x1E4F28ED0];
  BOOL v5 = [(HKSPFeatureAvailabilityStore *)self _onboardingIneligibilityReasons] == 0;
  return (id)[v4 numberWithInt:v5];
}

- (id)pairedFeatureAttributesWithError:(id *)a3
{
  objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 11, @"Feature attributes not applicable");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if (a3) {
      *a3 = v4;
    }
    else {
      _HKLogDroppedError();
    }
  }

  return 0;
}

- (id)regionAvailabilityWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F2B410], "uncheckedAvailability", a3);
}

- (void)setCurrentOnboardingVersionCompletedForCountryCode:(id)a3 countryCodeProvenance:(int64_t)a4 date:(id)a5 settings:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (v13)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2 object:self file:@"HKSPFeatureAvailabilityStore.m" lineNumber:454 description:@"Specifying onboarded date is not supported for Sleep feature."];
  }
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  v22 = __130__HKSPFeatureAvailabilityStore_setCurrentOnboardingVersionCompletedForCountryCode_countryCodeProvenance_date_settings_completion___block_invoke;
  v23 = &unk_1E5D32930;
  v24 = self;
  id v16 = v15;
  id v25 = v16;
  id v17 = (void *)MEMORY[0x1AD0DD220](&v20);
  int64_t feature = self->_feature;
  switch(feature)
  {
    case 2:
      -[HKSPSleepOnboardingStore setSleepWindDownShortcutsOnboardingCompletedVersion:completion:](self->_sleepStore, "setSleepWindDownShortcutsOnboardingCompletedVersion:completion:", 2, v17, v20, v21, v22, v23, v24);
      break;
    case 1:
      -[HKSPSleepOnboardingStore setSleepTrackingOnboardingCompletedVersion:completion:](self->_sleepStore, "setSleepTrackingOnboardingCompletedVersion:completion:", 3, v17, v20, v21, v22, v23, v24);
      break;
    case 0:
      -[HKSPSleepOnboardingStore setSleepCoachingOnboardingCompletedVersion:completion:](self->_sleepStore, "setSleepCoachingOnboardingCompletedVersion:completion:", 3, v17, v20, v21, v22, v23, v24);
      break;
  }
}

void __130__HKSPFeatureAvailabilityStore_setCurrentOnboardingVersionCompletedForCountryCode_countryCodeProvenance_date_settings_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  BOOL v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = (id)[v5 _onboardingModelWithError:0];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

  if (a2)
  {
    id v8 = *(void **)(a1 + 32);
    [v8 _notifyObserversForDidUpdateOnboarding];
  }
}

- (void)saveOnboardingCompletion:(id)a3 settings:(id)a4 completion:(id)a5
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(id, void, void *))a5;
  id v7 = HKSPLogForCategory(1uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    int v9 = 138543362;
    uint64_t v10 = self;
    _os_log_error_impl(&dword_1A7E74000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] HKOnboardingCompletion is not implemented for Sleep.", (uint8_t *)&v9, 0xCu);
  }

  id v8 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 110, @"HKOnboardingCompletion is not implemented for Sleep.");
  v6[2](v6, 0, v8);
}

- (void)setFeatureSettingData:(id)a3 forKey:(id)a4 completion:(id)a5
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(id, void, void *))a5;
  id v7 = HKSPLogForCategory(1uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    int v9 = 138543362;
    uint64_t v10 = self;
    _os_log_error_impl(&dword_1A7E74000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] Feature settings is not implemented for Sleep.", (uint8_t *)&v9, 0xCu);
  }

  id v8 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 110, @"Feature settings is not implemented for Sleep.");
  v6[2](v6, 0, v8);
}

- (void)setFeatureSettingString:(id)a3 forKey:(id)a4 completion:(id)a5
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(id, void, void *))a5;
  id v7 = HKSPLogForCategory(1uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    int v9 = 138543362;
    uint64_t v10 = self;
    _os_log_error_impl(&dword_1A7E74000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] Feature settings is not implemented for Sleep.", (uint8_t *)&v9, 0xCu);
  }

  id v8 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 110, @"Feature settings is not implemented for Sleep.");
  v6[2](v6, 0, v8);
}

- (void)setFeatureSettingNumber:(id)a3 forKey:(id)a4 completion:(id)a5
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(id, void, void *))a5;
  id v7 = HKSPLogForCategory(1uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    int v9 = 138543362;
    uint64_t v10 = self;
    _os_log_error_impl(&dword_1A7E74000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] Feature settings is not implemented for Sleep.", (uint8_t *)&v9, 0xCu);
  }

  id v8 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 110, @"Feature settings is not implemented for Sleep.");
  v6[2](v6, 0, v8);
}

- (void)removeFeatureSettingValueForKey:(id)a3 completion:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  BOOL v5 = (void (**)(id, void, void *))a4;
  id v6 = HKSPLogForCategory(1uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v8 = 138543362;
    int v9 = self;
    _os_log_error_impl(&dword_1A7E74000, v6, OS_LOG_TYPE_ERROR, "[%{public}@] Feature settings is not implemented for Sleep.", (uint8_t *)&v8, 0xCu);
  }

  id v7 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 110, @"Feature settings is not implemented for Sleep.");
  v5[2](v5, 0, v7);
}

- (void)resetOnboardingWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __62__HKSPFeatureAvailabilityStore_resetOnboardingWithCompletion___block_invoke;
  uint64_t v11 = &unk_1E5D32930;
  id v12 = self;
  id v5 = v4;
  id v13 = v5;
  id v6 = (void *)MEMORY[0x1AD0DD220](&v8);
  int64_t feature = self->_feature;
  switch(feature)
  {
    case 2:
      -[HKSPSleepOnboardingStore setSleepWindDownShortcutsOnboardingCompletedVersion:completion:](self->_sleepStore, "setSleepWindDownShortcutsOnboardingCompletedVersion:completion:", 0, v6, v8, v9, v10, v11, v12);
      break;
    case 1:
      -[HKSPSleepOnboardingStore setSleepTrackingOnboardingCompletedVersion:completion:](self->_sleepStore, "setSleepTrackingOnboardingCompletedVersion:completion:", 0, v6, v8, v9, v10, v11, v12);
      break;
    case 0:
      -[HKSPSleepOnboardingStore setSleepCoachingOnboardingCompletedVersion:completion:](self->_sleepStore, "setSleepCoachingOnboardingCompletedVersion:completion:", 0, v6, v8, v9, v10, v11, v12);
      break;
  }
}

void __62__HKSPFeatureAvailabilityStore_resetOnboardingWithCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = (id)[v5 _onboardingModelWithError:0];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

  if (a2)
  {
    uint64_t v8 = *(void **)(a1 + 32);
    [v8 _notifyObserversForDidUpdateOnboarding];
  }
}

- (void)unregisterObserver:(id)a3
{
}

- (void)_pairedDeviceDidChange
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = HKSPLogForCategory(1uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v7 = self;
    _os_log_impl(&dword_1A7E74000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notifying observers of paired device changes", buf, 0xCu);
  }

  observers = self->_observers;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__HKSPFeatureAvailabilityStore__pairedDeviceDidChange__block_invoke;
  v5[3] = &unk_1E5D32958;
  v5[4] = self;
  [(HKSPObserverSet *)observers enumerateObserversWithBlock:v5];
}

void __54__HKSPFeatureAvailabilityStore__pairedDeviceDidChange__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 featureAvailabilityProvidingDidUpdatePairedDeviceCapability:*(void *)(a1 + 32)];
  }
}

- (void)sleepStore:(id)a3 sleepEventRecordDidChange:(id)a4
{
  if ([(HKSPFeatureAvailabilityStore *)self _updateCachedOnboardingModel:a4])
  {
    [(HKSPFeatureAvailabilityStore *)self _notifyObserversForDidUpdateOnboarding];
  }
}

- (void)sleepStore:(id)a3 sleepSettingsDidChange:(id)a4
{
  if ([(HKSPFeatureAvailabilityStore *)self _updateCachedFeatureSettingsModel:a4])
  {
    [(HKSPFeatureAvailabilityStore *)self _notifyObserversForDidUpdateSettings];
  }
}

- (void)_notifyObserversForDidUpdateOnboarding
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = HKSPLogForCategory(1uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v7 = self;
    _os_log_impl(&dword_1A7E74000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] _notifyObserversForDidUpdateOnboarding", buf, 0xCu);
  }

  observers = self->_observers;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __70__HKSPFeatureAvailabilityStore__notifyObserversForDidUpdateOnboarding__block_invoke;
  v5[3] = &unk_1E5D32958;
  v5[4] = self;
  [(HKSPObserverSet *)observers enumerateObserversWithBlock:v5];
}

uint64_t __70__HKSPFeatureAvailabilityStore__notifyObserversForDidUpdateOnboarding__block_invoke(uint64_t a1, void *a2)
{
  return [a2 featureAvailabilityProvidingDidUpdateOnboardingCompletion:*(void *)(a1 + 32)];
}

- (void)_notifyObserversForDidUpdateSettings
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = HKSPLogForCategory(1uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v7 = self;
    _os_log_impl(&dword_1A7E74000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] _notifyObserversForDidUpdateSettings", buf, 0xCu);
  }

  observers = self->_observers;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68__HKSPFeatureAvailabilityStore__notifyObserversForDidUpdateSettings__block_invoke;
  v5[3] = &unk_1E5D32958;
  v5[4] = self;
  [(HKSPObserverSet *)observers enumerateObserversWithBlock:v5];
}

void __68__HKSPFeatureAvailabilityStore__notifyObserversForDidUpdateSettings__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 featureAvailabilityProvidingDidUpdateSettings:*(void *)(a1 + 32)];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureIdentifier, 0);
  objc_storeStrong((id *)&self->_cachedFeatureSettingsModel, 0);
  objc_storeStrong((id *)&self->_cachedOnboardingModel, 0);
  objc_storeStrong((id *)&self->_pairedDeviceRegistry, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_sleepStore, 0);
}

@end