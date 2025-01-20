@interface HKRPOxygenSaturationOnboardingManager
- (BOOL)_currentDeviceHasCapability;
- (BOOL)_isAlternateDevice;
- (BOOL)ageIsAppropriate;
- (BOOL)bloodOxygenFeatureEnabled;
- (BOOL)bloodOxygenRemoteDisabled;
- (BOOL)onboardingComplete;
- (BOOL)onboardingDuringPairingShouldAppear;
- (BOOL)onboardingShouldAppear;
- (BOOL)pairedDeviceIsAppropriate;
- (BOOL)settingsShouldAppear;
- (BOOL)shouldAdvertise;
- (HKRPOxygenSaturationOnboardingManager)init;
- (HKRPOxygenSaturationOnboardingManager)initWithDataSource:(id)a3;
- (HKRPOxygenSaturationOnboardingManager)initWithDevice:(id)a3;
- (HKRPOxygenSaturationOnboardingManagerDataSource)dataSource;
- (void)_currentDeviceHasCapability;
- (void)bloodOxygenRemoteDisabled;
- (void)cacheCompletedOnboardingStateIfNeeded;
- (void)onboardWithCompletion:(id)a3;
- (void)onboardingComplete;
@end

@implementation HKRPOxygenSaturationOnboardingManager

- (HKRPOxygenSaturationOnboardingManager)init
{
  v3 = objc_alloc_init(_HKRPOxygenSaturationOnboardingManagerDataSource);
  v4 = [(HKRPOxygenSaturationOnboardingManager *)self initWithDataSource:v3];

  return v4;
}

- (HKRPOxygenSaturationOnboardingManager)initWithDataSource:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKRPOxygenSaturationOnboardingManager;
  v6 = [(HKRPOxygenSaturationOnboardingManager *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_dataSource, a3);
  }

  return v7;
}

- (BOOL)bloodOxygenFeatureEnabled
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v2 = [(HKRPOxygenSaturationOnboardingManagerDataSource *)self->_dataSource isBloodOxygenSaturationEnabled];
  _HKInitializeLogging();
  v3 = (void *)*MEMORY[0x263F09950];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09950], OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    int v7 = 138543618;
    id v8 = (id)objc_opt_class();
    __int16 v9 = 1024;
    int v10 = v2;
    id v5 = v8;
    _os_log_impl(&dword_21D42F000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Feature is enabled: %d", (uint8_t *)&v7, 0x12u);
  }
  return v2;
}

- (HKRPOxygenSaturationOnboardingManager)initWithDevice:(id)a3
{
  id v4 = a3;
  id v5 = [[_HKRPOxygenSaturationOnboardingManagerStaticDeviceDataSource alloc] initWithDevice:v4];

  v6 = [(HKRPOxygenSaturationOnboardingManager *)self initWithDataSource:v5];
  return v6;
}

- (BOOL)settingsShouldAppear
{
  if (![(HKRPOxygenSaturationOnboardingManager *)self bloodOxygenFeatureEnabled]
    || ![(HKRPOxygenSaturationOnboardingManager *)self pairedDeviceIsAppropriate])
  {
    return 0;
  }

  return [(HKRPOxygenSaturationOnboardingManager *)self ageIsAppropriate];
}

- (BOOL)pairedDeviceIsAppropriate
{
  if ([(HKRPOxygenSaturationOnboardingManager *)self _isAlternateDevice]) {
    return 0;
  }

  return [(HKRPOxygenSaturationOnboardingManager *)self _currentDeviceHasCapability];
}

- (BOOL)_currentDeviceHasCapability
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if ([(HKRPOxygenSaturationOnboardingManagerDataSource *)self->_dataSource skipHardwareCheck])
  {
    _HKInitializeLogging();
    v3 = (void *)*MEMORY[0x263F09950];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09950], OS_LOG_TYPE_DEFAULT))
    {
      id v4 = v3;
      *(_DWORD *)buf = 138543362;
      id v18 = (id)objc_opt_class();
      id v5 = v18;
      _os_log_impl(&dword_21D42F000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Device check override is in place", buf, 0xCu);
    }
    return 1;
  }
  else
  {
    int v7 = [(HKRPOxygenSaturationOnboardingManagerDataSource *)self->_dataSource featureAvailabilityProvider];
    id v16 = 0;
    id v8 = [v7 isFeatureCapabilitySupportedOnActivePairedDeviceWithError:&v16];
    id v9 = v16;

    _HKInitializeLogging();
    int v10 = (void *)*MEMORY[0x263F09950];
    uint64_t v11 = *MEMORY[0x263F09950];
    if (v8)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = v10;
        v13 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        id v18 = v13;
        __int16 v19 = 2114;
        v20 = v8;
        id v14 = v13;
        _os_log_impl(&dword_21D42F000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Device check result: %{public}@", buf, 0x16u);
      }
      char v6 = [v8 BOOLValue];
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[HKRPOxygenSaturationOnboardingManager _currentDeviceHasCapability]();
      }
      char v6 = 0;
    }
  }
  return v6;
}

- (BOOL)_isAlternateDevice
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  int v2 = [(HKRPOxygenSaturationOnboardingManagerDataSource *)self->_dataSource device];
  v3 = v2;
  if (v2)
  {
    id v4 = [v2 valueForProperty:*MEMORY[0x263F575B0]];
    int v5 = [v4 BOOLValue];

    _HKInitializeLogging();
    char v6 = (void *)*MEMORY[0x263F09950];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09950], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = v6;
      int v13 = 138543618;
      id v14 = (id)objc_opt_class();
      __int16 v15 = 1024;
      int v16 = v5;
      id v8 = v14;
      _os_log_impl(&dword_21D42F000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Alternate device check: alternate device flag: %d", (uint8_t *)&v13, 0x12u);
    }
  }
  else
  {
    _HKInitializeLogging();
    id v9 = (void *)*MEMORY[0x263F09950];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09950], OS_LOG_TYPE_DEFAULT))
    {
      int v10 = v9;
      int v13 = 138543362;
      id v14 = (id)objc_opt_class();
      id v11 = v14;
      _os_log_impl(&dword_21D42F000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Alternate device check: active device is nil", (uint8_t *)&v13, 0xCu);
    }
    LOBYTE(v5) = 1;
  }

  return v5;
}

- (BOOL)ageIsAppropriate
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v2 = [(HKRPOxygenSaturationOnboardingManagerDataSource *)self->_dataSource isAgeGated] ^ 1;
  _HKInitializeLogging();
  v3 = (void *)*MEMORY[0x263F09950];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09950], OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    int v5 = objc_opt_class();
    char v6 = NSNumber;
    id v7 = v5;
    id v8 = [v6 numberWithBool:v2];
    int v10 = 138543618;
    id v11 = v5;
    __int16 v12 = 2114;
    int v13 = v8;
    _os_log_impl(&dword_21D42F000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Age is appropriate for oxygen saturation: %{public}@", (uint8_t *)&v10, 0x16u);
  }
  return v2;
}

- (BOOL)shouldAdvertise
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v2 = [(HKRPOxygenSaturationOnboardingManagerDataSource *)self->_dataSource shouldAdvertise];
  _HKInitializeLogging();
  v3 = (void *)*MEMORY[0x263F09950];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09950], OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    int v5 = objc_opt_class();
    char v6 = NSNumber;
    id v7 = v5;
    id v8 = [v6 numberWithBool:v2];
    int v10 = 138543618;
    id v11 = v5;
    __int16 v12 = 2114;
    int v13 = v8;
    _os_log_impl(&dword_21D42F000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Should advertise onboarding of feature: %{public}@", (uint8_t *)&v10, 0x16u);
  }
  return v2;
}

- (BOOL)onboardingShouldAppear
{
  BOOL v3 = [(HKRPOxygenSaturationOnboardingManager *)self settingsShouldAppear];
  if (v3) {
    LOBYTE(v3) = ![(HKRPOxygenSaturationOnboardingManager *)self onboardingComplete];
  }
  return v3;
}

- (BOOL)onboardingDuringPairingShouldAppear
{
  if (![(HKRPOxygenSaturationOnboardingManager *)self onboardingShouldAppear]
    || [(HKRPOxygenSaturationOnboardingManager *)self bloodOxygenRemoteDisabled])
  {
    return 0;
  }

  return [(HKRPOxygenSaturationOnboardingManager *)self shouldAdvertise];
}

- (BOOL)onboardingComplete
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v2 = [(HKRPOxygenSaturationOnboardingManagerDataSource *)self->_dataSource featureAvailabilityProvider];
  id v13 = 0;
  BOOL v3 = [v2 onboardedCountryCodeSupportedStateWithError:&v13];
  id v4 = v13;

  if (v3)
  {
    unint64_t v5 = [v3 integerValue];
    _HKInitializeLogging();
    char v6 = (void *)*MEMORY[0x263F09950];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09950], OS_LOG_TYPE_DEFAULT))
    {
      id v7 = v6;
      id v8 = objc_opt_class();
      id v9 = v8;
      int v10 = NSStringFromHKFeatureAvailabilityOnboardedCountrySupportedState();
      *(_DWORD *)buf = 138543618;
      __int16 v15 = v8;
      __int16 v16 = 2114;
      uint64_t v17 = v10;
      _os_log_impl(&dword_21D42F000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Onboarding completed state: %{public}@", buf, 0x16u);
    }
    if (v5 <= 5) {
      unsigned int v11 = (5u >> v5) & 1;
    }
    else {
      LOBYTE(v11) = 1;
    }
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09950], OS_LOG_TYPE_ERROR)) {
      -[HKRPOxygenSaturationOnboardingManager onboardingComplete]();
    }
    LOBYTE(v11) = 0;
  }

  return v11;
}

- (BOOL)bloodOxygenRemoteDisabled
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  BOOL v3 = [(HKRPOxygenSaturationOnboardingManagerDataSource *)self->_dataSource featureAvailabilityProvider];
  id v19 = 0;
  id v4 = [v3 onboardedCountryCodeSupportedStateWithError:&v19];
  id v5 = v19;

  if (!v4)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09950], OS_LOG_TYPE_ERROR)) {
      -[HKRPOxygenSaturationOnboardingManager bloodOxygenRemoteDisabled]();
    }
    goto LABEL_13;
  }
  uint64_t v6 = [v4 integerValue];
  _HKInitializeLogging();
  id v7 = (os_log_t *)MEMORY[0x263F09950];
  id v8 = (void *)*MEMORY[0x263F09950];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09950], OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v8;
    int v10 = objc_opt_class();
    id v11 = v10;
    __int16 v12 = NSStringFromHKFeatureAvailabilityOnboardedCountrySupportedState();
    *(_DWORD *)buf = 138543618;
    uint64_t v21 = v10;
    __int16 v22 = 2114;
    v23 = v12;
    _os_log_impl(&dword_21D42F000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Onboarding completed state: %{public}@", buf, 0x16u);
  }
  if ((unint64_t)(v6 - 2) < 2 || v6 == 5)
  {
LABEL_13:
    LOBYTE(v16) = 0;
    goto LABEL_14;
  }
  if (v6 == 1)
  {

    uint64_t v14 = [(HKRPOxygenSaturationOnboardingManagerDataSource *)self->_dataSource featureAvailabilityProvider];
    id v18 = 0;
    __int16 v15 = [v14 onboardingEligibilityForCountryCode:0 error:&v18];
    id v5 = v18;

    if (v15)
    {
      unint64_t v16 = ((unint64_t)[v15 ineligibilityReasons] >> 6) & 1;
    }
    else
    {
      _HKInitializeLogging();
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR)) {
        -[HKRPOxygenSaturationOnboardingManager bloodOxygenRemoteDisabled]();
      }
      LOBYTE(v16) = 0;
    }
  }
  else
  {
    LOBYTE(v16) = 1;
  }
LABEL_14:

  return v16;
}

- (void)onboardWithCompletion:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_opt_class();
  _HKInitializeLogging();
  uint64_t v6 = *MEMORY[0x263F09950];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09950], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v13 = v5;
    _os_log_impl(&dword_21D42F000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Attempting to onboard feature, checking country code...", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  id v7 = [(HKRPOxygenSaturationOnboardingManagerDataSource *)self->_dataSource mobileCountryCodeManager];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __63__HKRPOxygenSaturationOnboardingManager_onboardWithCompletion___block_invoke;
  v9[3] = &unk_264447400;
  v11[1] = v5;
  id v8 = v4;
  v9[4] = self;
  id v10 = v8;
  objc_copyWeak(v11, (id *)buf);
  [v7 fetchMobileCountryCodeFromCellularWithCompletion:v9];

  objc_destroyWeak(v11);
  objc_destroyWeak((id *)buf);
}

void __63__HKRPOxygenSaturationOnboardingManager_onboardWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  _HKInitializeLogging();
  id v7 = (os_log_t *)MEMORY[0x263F09950];
  id v8 = *MEMORY[0x263F09950];
  id v9 = *MEMORY[0x263F09950];
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 56);
      id v11 = v8;
      __int16 v12 = [v5 ISOCode];
      *(_DWORD *)buf = 138543618;
      uint64_t v36 = v10;
      __int16 v37 = 2114;
      v38 = v12;
      _os_log_impl(&dword_21D42F000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Setting current onboarding version completed for %{public}@...", buf, 0x16u);
    }
    id v13 = [*(id *)(*(void *)(a1 + 32) + 8) featureAvailabilityProvider];
    uint64_t v14 = [v5 ISOCode];
    id v31 = 0;
    __int16 v15 = [v13 canCompleteOnboardingForCountryCode:v14 error:&v31];
    id v16 = v31;

    if (v15)
    {
      if ([v15 BOOLValue])
      {
        uint64_t v17 = [*(id *)(*(void *)(a1 + 32) + 8) featureAvailabilityProvider];
        id v18 = [v5 ISOCode];
        uint64_t v19 = [v5 provenance];
        v23[0] = MEMORY[0x263EF8330];
        v23[1] = 3221225472;
        v23[2] = __63__HKRPOxygenSaturationOnboardingManager_onboardWithCompletion___block_invoke_3;
        v23[3] = &unk_2644473D8;
        v26[1] = *(id *)(a1 + 56);
        id v24 = v5;
        objc_copyWeak(v26, (id *)(a1 + 48));
        id v25 = *(id *)(a1 + 40);
        [v17 setCurrentOnboardingVersionCompletedForCountryCode:v18 countryCodeProvenance:v19 date:0 settings:0 completion:v23];

        objc_destroyWeak(v26);
        v20 = &v24;
LABEL_15:

        goto LABEL_16;
      }
      __int16 v22 = v27;
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __63__HKRPOxygenSaturationOnboardingManager_onboardWithCompletion___block_invoke_2;
      v27[3] = &unk_264447388;
      v27[4] = v5;
      id v28 = *(id *)(a1 + 40);
      dispatch_async(MEMORY[0x263EF83A0], v27);
    }
    else
    {
      _HKInitializeLogging();
      os_log_t v21 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR)) {
        __63__HKRPOxygenSaturationOnboardingManager_onboardWithCompletion___block_invoke_cold_2(a1, v21, v5);
      }
      __int16 v22 = v29;
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __63__HKRPOxygenSaturationOnboardingManager_onboardWithCompletion___block_invoke_285;
      v29[3] = &unk_264447388;
      v29[4] = v5;
      id v30 = *(id *)(a1 + 40);
      dispatch_async(MEMORY[0x263EF83A0], v29);
    }
    v20 = (id *)(v22 + 4);
    goto LABEL_15;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    __63__HKRPOxygenSaturationOnboardingManager_onboardWithCompletion___block_invoke_cold_1(a1, (uint64_t)v6, v8);
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__HKRPOxygenSaturationOnboardingManager_onboardWithCompletion___block_invoke_279;
  block[3] = &unk_264447388;
  id v33 = v6;
  id v34 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x263EF83A0], block);

  id v16 = v33;
LABEL_16:
}

void __63__HKRPOxygenSaturationOnboardingManager_onboardWithCompletion___block_invoke_279(uint64_t a1)
{
  objc_msgSend(MEMORY[0x263F087E8], "hk_error:description:underlyingError:", 109, @"country code not found", *(void *)(a1 + 32));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __63__HKRPOxygenSaturationOnboardingManager_onboardWithCompletion___block_invoke_285(uint64_t a1)
{
  id v2 = NSString;
  BOOL v3 = [*(id *)(a1 + 32) ISOCode];
  id v5 = [v2 stringWithFormat:@"Feature unavailable for country code %@ (error)", v3];

  id v4 = objc_msgSend(MEMORY[0x263F087E8], "hk_error:description:", 110, v5);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __63__HKRPOxygenSaturationOnboardingManager_onboardWithCompletion___block_invoke_2(uint64_t a1)
{
  id v2 = NSString;
  BOOL v3 = [*(id *)(a1 + 32) ISOCode];
  id v5 = [v2 stringWithFormat:@"Feature unavailable for country code %@", v3];

  id v4 = objc_msgSend(MEMORY[0x263F087E8], "hk_error:description:", 110, v5);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __63__HKRPOxygenSaturationOnboardingManager_onboardWithCompletion___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = v5;
  if (a2)
  {
LABEL_7:
    char v12 = 1;
    goto LABEL_18;
  }
  id v7 = [v5 domain];
  uint64_t v8 = *MEMORY[0x263F09548];
  if ([v7 isEqualToString:*MEMORY[0x263F09548]])
  {
    uint64_t v9 = [v6 code];

    if (v9 == 115)
    {
      _HKInitializeLogging();
      uint64_t v10 = *MEMORY[0x263F09950];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09950], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *(void *)(a1 + 56);
        *(_DWORD *)buf = 138543362;
        uint64_t v26 = v11;
        _os_log_impl(&dword_21D42F000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] The user has previously onboarded this feature, ignoring feature availability store error", buf, 0xCu);
      }

      id v6 = 0;
      goto LABEL_7;
    }
  }
  else
  {
  }
  id v13 = v6;
  uint64_t v14 = [v13 domain];
  if ([v14 isEqualToString:v8])
  {
    uint64_t v15 = [v13 code];

    if (v15 == 3)
    {
      id v6 = objc_msgSend(MEMORY[0x263F087E8], "hk_error:description:underlyingError:", 110, @"Feature unavailable", v13);

      _HKInitializeLogging();
      id v16 = (void *)*MEMORY[0x263F09950];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09950], OS_LOG_TYPE_ERROR)) {
        __63__HKRPOxygenSaturationOnboardingManager_onboardWithCompletion___block_invoke_3_cold_1(a1, v16);
      }
      char v12 = 0;
      goto LABEL_18;
    }
  }
  else
  {
  }
  _HKInitializeLogging();
  uint64_t v17 = (void *)*MEMORY[0x263F09950];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09950], OS_LOG_TYPE_ERROR)) {
    __63__HKRPOxygenSaturationOnboardingManager_onboardWithCompletion___block_invoke_3_cold_2(a1, v17, (uint64_t)v13);
  }
  char v12 = 0;
  id v6 = v13;
LABEL_18:
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __63__HKRPOxygenSaturationOnboardingManager_onboardWithCompletion___block_invoke_296;
  v20[3] = &unk_2644473B0;
  objc_copyWeak(&v23, (id *)(a1 + 48));
  id v18 = *(id *)(a1 + 40);
  char v24 = v12;
  id v21 = v6;
  id v22 = v18;
  id v19 = v6;
  dispatch_async(MEMORY[0x263EF83A0], v20);

  objc_destroyWeak(&v23);
}

uint64_t __63__HKRPOxygenSaturationOnboardingManager_onboardWithCompletion___block_invoke_296(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained cacheCompletedOnboardingStateIfNeeded];

  BOOL v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

- (void)cacheCompletedOnboardingStateIfNeeded
{
  OUTLINED_FUNCTION_3();
  id v2 = v1;
  BOOL v3 = (void *)OUTLINED_FUNCTION_4();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_21D42F000, v5, v6, "[%{public}@] Unable to cache the fact that onboarding has completed: %{public}@", v7, v8, v9, v10, v11);
}

- (HKRPOxygenSaturationOnboardingManagerDataSource)dataSource
{
  return self->_dataSource;
}

- (void).cxx_destruct
{
}

- (void)_currentDeviceHasCapability
{
  OUTLINED_FUNCTION_3();
  id v2 = v1;
  BOOL v3 = (void *)OUTLINED_FUNCTION_4();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_21D42F000, v5, v6, "[%{public}@] Device check failed: %{public}@", v7, v8, v9, v10, v11);
}

- (void)onboardingComplete
{
  OUTLINED_FUNCTION_3();
  id v2 = v1;
  BOOL v3 = (void *)OUTLINED_FUNCTION_4();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_21D42F000, v5, v6, "[%{public}@] On board check failed: %{public}@", v7, v8, v9, v10, v11);
}

- (void)bloodOxygenRemoteDisabled
{
  OUTLINED_FUNCTION_3();
  id v2 = v1;
  BOOL v3 = (void *)OUTLINED_FUNCTION_4();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_21D42F000, v5, v6, "[%{public}@] Remote disabled check failed eligibility check with error: %{public}@", v7, v8, v9, v10, v11);
}

void __63__HKRPOxygenSaturationOnboardingManager_onboardWithCompletion___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 56);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_21D42F000, log, OS_LOG_TYPE_ERROR, "[%{public}@] Unable to onboard feature: %{public}@", (uint8_t *)&v4, 0x16u);
}

void __63__HKRPOxygenSaturationOnboardingManager_onboardWithCompletion___block_invoke_cold_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v5 = a2;
  __int16 v6 = [a3 ISOCode];
  int v7 = 138543618;
  uint64_t v8 = v4;
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_21D42F000, v5, OS_LOG_TYPE_ERROR, "[%{public}@] Cannot onboard with country code %{public}@, it is not supported", (uint8_t *)&v7, 0x16u);
}

void __63__HKRPOxygenSaturationOnboardingManager_onboardWithCompletion___block_invoke_3_cold_1(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 56);
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = a2;
  uint64_t v5 = [v3 ISOCode];
  int v6 = 138543618;
  uint64_t v7 = v2;
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_21D42F000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] Cannot onboard with country code %{public}@, it is not supported", (uint8_t *)&v6, 0x16u);
}

void __63__HKRPOxygenSaturationOnboardingManager_onboardWithCompletion___block_invoke_3_cold_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v5 = *(void **)(a1 + 32);
  int v6 = a2;
  uint64_t v7 = [v5 ISOCode];
  int v9 = 138543874;
  uint64_t v10 = v4;
  OUTLINED_FUNCTION_2();
  __int16 v11 = v8;
  uint64_t v12 = a3;
  _os_log_error_impl(&dword_21D42F000, v6, OS_LOG_TYPE_ERROR, "[%{public}@] Unable to set current onboarding version completed for %{public}@: %{public}@", (uint8_t *)&v9, 0x20u);
}

@end