@interface WFHealthFeatureAvailability
- (HKSPFeatureAvailabilityStore)store;
- (NSString)onboardingCompletedKey;
- (OS_dispatch_queue)queue;
- (WFHealthFeatureAvailability)initWithSleepFeature:(unint64_t)a3;
- (WFHealthFeatureObserver)observer;
- (unint64_t)sleepOnboardingStatus;
- (void)dealloc;
- (void)featureAvailabilityProvidingDidUpdateOnboardingCompletion:(id)a3;
- (void)getSleepOnboardingStatus:(id)a3;
- (void)setObserver:(id)a3;
- (void)setSleepOnboardingStatus:(unint64_t)a3;
- (void)setStore:(id)a3;
@end

@implementation WFHealthFeatureAvailability

- (void)setObserver:(id)a3
{
}

void __56__WFHealthFeatureAvailability_getSleepOnboardingStatus___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  [a2 BOOLValue];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __52__WFHealthFeatureAvailability_initWithSleepFeature___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    v6 = getWFGeneralLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315394;
      v8 = "-[WFHealthFeatureAvailability initWithSleepFeature:]_block_invoke_2";
      __int16 v9 = 2114;
      id v10 = v5;
      _os_log_impl(&dword_1C7F0A000, v6, OS_LOG_TYPE_ERROR, "%s Encountered error in retrieving sleep onboarding status from HealthKit: %{public}@", (uint8_t *)&v7, 0x16u);
    }
  }
  else
  {
    [*(id *)(a1 + 32) setSleepOnboardingStatus:a2];
  }
}

- (void)setSleepOnboardingStatus:(unint64_t)a3
{
  if ([(WFHealthFeatureAvailability *)self sleepOnboardingStatus] != a3)
  {
    id v5 = [MEMORY[0x1E4F1CB18] systemShortcutsUserDefaults];
    v6 = [(WFHealthFeatureAvailability *)self onboardingCompletedKey];
    [v5 setInteger:a3 forKey:v6];

    id v7 = [(WFHealthFeatureAvailability *)self observer];
    [v7 healthFeatureAvailability:self sleepOnboardingStatusDidChange:a3];
  }
}

- (unint64_t)sleepOnboardingStatus
{
  v3 = [MEMORY[0x1E4F1CB18] systemShortcutsUserDefaults];
  v4 = [(WFHealthFeatureAvailability *)self onboardingCompletedKey];
  unint64_t v5 = [v3 integerForKey:v4];

  return v5;
}

- (NSString)onboardingCompletedKey
{
  return self->_onboardingCompletedKey;
}

void __52__WFHealthFeatureAvailability_initWithSleepFeature___block_invoke(uint64_t a1)
{
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2050000000;
  v2 = (void *)getHKSPSleepStoreClass_softClass;
  uint64_t v24 = getHKSPSleepStoreClass_softClass;
  if (!getHKSPSleepStoreClass_softClass)
  {
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    v18 = __getHKSPSleepStoreClass_block_invoke;
    v19 = &unk_1E6558B78;
    v20 = &v21;
    __getHKSPSleepStoreClass_block_invoke((uint64_t)&v16);
    v2 = (void *)v22[3];
  }
  v3 = v2;
  _Block_object_dispose(&v21, 8);
  id v4 = [v3 alloc];
  unint64_t v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  id v7 = (void *)[v4 initWithIdentifier:v6];

  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2050000000;
  v8 = (void *)getHKSPFeatureAvailabilityStoreClass_softClass;
  uint64_t v24 = getHKSPFeatureAvailabilityStoreClass_softClass;
  if (!getHKSPFeatureAvailabilityStoreClass_softClass)
  {
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    v18 = __getHKSPFeatureAvailabilityStoreClass_block_invoke;
    v19 = &unk_1E6558B78;
    v20 = &v21;
    __getHKSPFeatureAvailabilityStoreClass_block_invoke((uint64_t)&v16);
    v8 = (void *)v22[3];
  }
  __int16 v9 = v8;
  _Block_object_dispose(&v21, 8);
  uint64_t v10 = [[v9 alloc] initWithFeatureIdentifier:*(void *)(a1 + 40) sleepStore:v7];
  uint64_t v11 = *(void *)(a1 + 32);
  v12 = *(void **)(v11 + 16);
  *(void *)(v11 + 16) = v10;

  [*(id *)(*(void *)(a1 + 32) + 16) registerObserver:*(void *)(a1 + 32) queue:*(void *)(*(void *)(a1 + 32) + 24)];
  v13 = *(void **)(a1 + 32);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __52__WFHealthFeatureAvailability_initWithSleepFeature___block_invoke_2;
  v14[3] = &unk_1E65532C8;
  id v15 = v13;
  [v15 getSleepOnboardingStatus:v14];
}

- (void)getSleepOnboardingStatus:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(WFHealthFeatureAvailability *)self store];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__WFHealthFeatureAvailability_getSleepOnboardingStatus___block_invoke;
  v7[3] = &unk_1E654EE98;
  id v8 = v4;
  id v6 = v4;
  [v5 isCurrentOnboardingVersionCompletedWithCompletion:v7];
}

- (HKSPFeatureAvailabilityStore)store
{
  return self->_store;
}

- (WFHealthFeatureAvailability)initWithSleepFeature:(unint64_t)a3
{
  v25.receiver = self;
  v25.super_class = (Class)WFHealthFeatureAvailability;
  id v4 = [(WFHealthFeatureAvailability *)&v25 init];
  if (!v4) {
    goto LABEL_12;
  }
  unint64_t v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v6 = dispatch_queue_create("com.apple.shortcuts.WFHealthFeatureAvailability", v5);
  queue = v4->_queue;
  v4->_queue = (OS_dispatch_queue *)v6;

  if (a3)
  {
    uint64_t v31 = 0;
    v32 = &v31;
    uint64_t v33 = 0x2020000000;
    id v8 = (id *)getHKFeatureIdentifierSleepActionsSymbolLoc_ptr;
    uint64_t v34 = getHKFeatureIdentifierSleepActionsSymbolLoc_ptr;
    if (!getHKFeatureIdentifierSleepActionsSymbolLoc_ptr)
    {
      uint64_t v26 = MEMORY[0x1E4F143A8];
      uint64_t v27 = 3221225472;
      v28 = __getHKFeatureIdentifierSleepActionsSymbolLoc_block_invoke;
      v29 = &unk_1E6558B78;
      v30 = &v31;
      __int16 v9 = HealthKitLibrary();
      uint64_t v10 = dlsym(v9, "HKFeatureIdentifierSleepActions");
      *(void *)(v30[1] + 24) = v10;
      getHKFeatureIdentifierSleepActionsSymbolLoc_ptr = *(void *)(v30[1] + 24);
      id v8 = (id *)v32[3];
    }
    _Block_object_dispose(&v31, 8);
    if (v8)
    {
      uint64_t v11 = @"WFShortcutsHealthSleepOnboardingCompleted";
LABEL_11:
      id v14 = *v8;
      objc_storeStrong((id *)&v4->_onboardingCompletedKey, v11);
      id v15 = v4->_queue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __52__WFHealthFeatureAvailability_initWithSleepFeature___block_invoke;
      block[3] = &unk_1E6558938;
      uint64_t v16 = v4;
      uint64_t v23 = v16;
      id v24 = v14;
      id v17 = v14;
      dispatch_async(v15, block);
      v18 = v16;

LABEL_12:
      return v4;
    }
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v21 = [NSString stringWithUTF8String:"HKFeatureIdentifier getHKFeatureIdentifierSleepActions(void)"];
    objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, @"WFHealthFeatureAvailability.m", 30, @"%s", dlerror());
  }
  else
  {
    uint64_t v31 = 0;
    v32 = &v31;
    uint64_t v33 = 0x2020000000;
    id v8 = (id *)getHKFeatureIdentifierSleepCoachingSymbolLoc_ptr;
    uint64_t v34 = getHKFeatureIdentifierSleepCoachingSymbolLoc_ptr;
    if (!getHKFeatureIdentifierSleepCoachingSymbolLoc_ptr)
    {
      uint64_t v26 = MEMORY[0x1E4F143A8];
      uint64_t v27 = 3221225472;
      v28 = __getHKFeatureIdentifierSleepCoachingSymbolLoc_block_invoke;
      v29 = &unk_1E6558B78;
      v30 = &v31;
      v12 = HealthKitLibrary();
      v13 = dlsym(v12, "HKFeatureIdentifierSleepCoaching");
      *(void *)(v30[1] + 24) = v13;
      getHKFeatureIdentifierSleepCoachingSymbolLoc_ptr = *(void *)(v30[1] + 24);
      id v8 = (id *)v32[3];
    }
    _Block_object_dispose(&v31, 8);
    if (v8)
    {
      uint64_t v11 = @"WFShortcutsHealthSleepCoachingCompleted";
      goto LABEL_11;
    }
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v21 = [NSString stringWithUTF8String:"HKFeatureIdentifier getHKFeatureIdentifierSleepCoaching(void)"];
    objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, @"WFHealthFeatureAvailability.m", 29, @"%s", dlerror());
  }

  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_onboardingCompletedKey, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_destroyWeak((id *)&self->_observer);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setStore:(id)a3
{
}

- (WFHealthFeatureObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  return (WFHealthFeatureObserver *)WeakRetained;
}

- (void)dealloc
{
  v3 = [(WFHealthFeatureAvailability *)self store];
  [v3 unregisterObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)WFHealthFeatureAvailability;
  [(WFHealthFeatureAvailability *)&v4 dealloc];
}

- (void)featureAvailabilityProvidingDidUpdateOnboardingCompletion:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __89__WFHealthFeatureAvailability_featureAvailabilityProvidingDidUpdateOnboardingCompletion___block_invoke;
  v3[3] = &unk_1E65532C8;
  v3[4] = self;
  [(WFHealthFeatureAvailability *)self getSleepOnboardingStatus:v3];
}

void __89__WFHealthFeatureAvailability_featureAvailabilityProvidingDidUpdateOnboardingCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    dispatch_queue_t v6 = getWFGeneralLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315394;
      id v8 = "-[WFHealthFeatureAvailability featureAvailabilityProvidingDidUpdateOnboardingCompletion:]_block_invoke";
      __int16 v9 = 2114;
      id v10 = v5;
      _os_log_impl(&dword_1C7F0A000, v6, OS_LOG_TYPE_ERROR, "%s Got notified that sleep onboarding status has changed, but encountered error in retrieving new value: %{public}@", (uint8_t *)&v7, 0x16u);
    }
  }
  else
  {
    [*(id *)(a1 + 32) setSleepOnboardingStatus:a2];
  }
}

@end