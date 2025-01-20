@interface HDFeatureAvailabilityManager(HDMentalHealth)
+ (id)_hdmc_availabilityManagerForFeatureIdentifier:()HDMentalHealth profile:availabilityRequirements:localCountrySet:;
+ (id)hdmh_depressionAndAnxietyAssessmentsAvailabilityManagerWithProfile:()HDMentalHealth;
+ (id)hdmh_periodicDepressionAndAnxietyAssessmentPromptsAvailabilityManagerWithProfile:()HDMentalHealth;
+ (id)hdmh_stateOfMindLoggingAvailabilityManagerWithProfile:()HDMentalHealth;
+ (id)hdmh_stateOfMindLoggingPatternEscalationsAvailabilityManagerWithProfile:()HDMentalHealth;
@end

@implementation HDFeatureAvailabilityManager(HDMentalHealth)

+ (id)hdmh_stateOfMindLoggingAvailabilityManagerWithProfile:()HDMentalHealth
{
  v31[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F09800];
  uint64_t v25 = *MEMORY[0x263F09800];
  v4 = (objc_class *)MEMORY[0x263F431E8];
  id v27 = a3;
  id v26 = [v4 alloc];
  id v5 = objc_alloc(MEMORY[0x263F0A3A0]);
  v30[0] = *MEMORY[0x263F095B0];
  v6 = (void *)MEMORY[0x263F0A3A8];
  v24 = [MEMORY[0x263F0A980] sharedBehavior];
  v23 = [v24 features];
  v22 = objc_msgSend(v6, "featureFlagIsEnabled:", objc_msgSend(v23, "chamomile"));
  v29[0] = v22;
  v7 = [MEMORY[0x263F0A3A8] profileIsNotFamilySetupPairingProfile];
  v29[1] = v7;
  v8 = [MEMORY[0x263F0A3A8] onboardingRecordIsNotPresentForFeatureWithIdentifier:v3];
  v29[2] = v8;
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:3];
  v31[0] = v9;
  v30[1] = *MEMORY[0x263F09600];
  v10 = (void *)MEMORY[0x263F0A3A8];
  v11 = [MEMORY[0x263F0A980] sharedBehavior];
  v12 = [v11 features];
  v13 = objc_msgSend(v10, "featureFlagIsEnabled:", objc_msgSend(v12, "chamomile"));
  v28[0] = v13;
  v14 = [MEMORY[0x263F0A3A8] profileIsNotFamilySetupPairingProfile];
  v28[1] = v14;
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:2];
  v31[1] = v15;
  v16 = [NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:2];
  v17 = (void *)[v5 initWithRequirementsByContext:v16];

  v18 = [MEMORY[0x263F43300] uncheckedAvailability];
  id v19 = objc_alloc_init(MEMORY[0x263F431F0]);
  v20 = (void *)[v26 initWithProfile:v27 featureIdentifier:v25 availabilityRequirements:v17 currentOnboardingVersion:1 pairedDeviceCapability:0 regionAvailabilityProvider:v18 disableAndExpiryProvider:v19 loggingCategory:*MEMORY[0x263F09938]];

  return v20;
}

+ (id)_hdmc_availabilityManagerForFeatureIdentifier:()HDMentalHealth profile:availabilityRequirements:localCountrySet:
{
  v9 = (objc_class *)MEMORY[0x263F43228];
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [v9 alloc];
  v15 = [v12 daemon];
  v16 = (void *)[v14 initWithFeatureIdentifier:v13 defaultCountrySet:v10 healthDaemon:v15];

  id v17 = objc_alloc(MEMORY[0x263F432A8]);
  v18 = [v12 daemon];
  id v19 = (void *)[v17 initWithDaemon:v18 featureIdentifier:v13];

  id v20 = objc_alloc(MEMORY[0x263F431E8]);
  v21 = (void *)[v20 initWithProfile:v12 featureIdentifier:v13 availabilityRequirements:v11 currentOnboardingVersion:1 pairedDeviceCapability:0 regionAvailabilityProvider:v16 disableAndExpiryProvider:v19 loggingCategory:*MEMORY[0x263F09938]];

  return v21;
}

+ (id)hdmh_depressionAndAnxietyAssessmentsAvailabilityManagerWithProfile:()HDMentalHealth
{
  v45[4] = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F09738];
  v4 = (objc_class *)MEMORY[0x263F0A3A0];
  id v38 = a3;
  id v29 = [v4 alloc];
  v44[0] = *MEMORY[0x263F09580];
  id v5 = (void *)MEMORY[0x263F0A3A8];
  v37 = [MEMORY[0x263F0A980] sharedBehavior];
  v36 = [v37 features];
  v35 = objc_msgSend(v5, "featureFlagIsEnabled:", objc_msgSend(v36, "chamomile"));
  v43[0] = v35;
  v34 = [MEMORY[0x263F0A3A8] featureIsNotRemotelyDisabledWithIdentifier:v3];
  v43[1] = v34;
  v33 = [MEMORY[0x263F0A3A8] countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:v3];
  v43[2] = v33;
  v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:v43 count:3];
  v45[0] = v32;
  v44[1] = *MEMORY[0x263F095D0];
  v6 = (void *)MEMORY[0x263F0A3A8];
  v31 = [MEMORY[0x263F0A980] sharedBehavior];
  v28 = [v31 features];
  id v27 = objc_msgSend(v6, "featureFlagIsEnabled:", objc_msgSend(v28, "chamomile"));
  v42[0] = v27;
  id v26 = [MEMORY[0x263F0A3A8] profileIsNotFamilySetupPairingProfile];
  v42[1] = v26;
  uint64_t v25 = [MEMORY[0x263F0A3A8] notAgeGatedForUserDefaultsKey:*MEMORY[0x263F098A8]];
  v42[2] = v25;
  v24 = [MEMORY[0x263F0A3A8] onboardingRecordIsPresentForFeatureWithIdentifier:v3];
  v42[3] = v24;
  v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v42 count:4];
  v45[1] = v23;
  v44[2] = *MEMORY[0x263F095C8];
  v22 = [MEMORY[0x263F0A3A8] featureIsNotRemotelyDisabledWithIdentifier:v3];
  v41[0] = v22;
  v21 = [MEMORY[0x263F0A3A8] countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:v3];
  v41[1] = v21;
  id v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v41 count:2];
  v45[2] = v20;
  v44[3] = *MEMORY[0x263F09600];
  v7 = (void *)MEMORY[0x263F0A3A8];
  v8 = [MEMORY[0x263F0A980] sharedBehavior];
  v9 = [v8 features];
  id v10 = objc_msgSend(v7, "featureFlagIsEnabled:", objc_msgSend(v9, "chamomile"));
  v40[0] = v10;
  id v11 = [MEMORY[0x263F0A3A8] profileIsNotFamilySetupPairingProfile];
  v40[1] = v11;
  id v12 = [MEMORY[0x263F0A3A8] featureIsNotRemotelyDisabledWithIdentifier:v3];
  v40[2] = v12;
  id v13 = [MEMORY[0x263F0A3A8] countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:v3];
  v40[3] = v13;
  id v14 = [MEMORY[0x263F0A3A8] onboardingRecordIsPresentForFeatureWithIdentifier:v3];
  v40[4] = v14;
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v40 count:5];
  v45[3] = v15;
  v16 = [NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:4];
  v30 = (void *)[v29 initWithRequirementsByContext:v16];

  id v17 = [MEMORY[0x263F0A288] localAvailabilityForDepressionAndAnxietyAssessments];
  v18 = objc_msgSend(a1, "_hdmc_availabilityManagerForFeatureIdentifier:profile:availabilityRequirements:localCountrySet:", v3, v38, v30, v17);

  return v18;
}

+ (id)hdmh_periodicDepressionAndAnxietyAssessmentPromptsAvailabilityManagerWithProfile:()HDMentalHealth
{
  v55[5] = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F097C0];
  v4 = (objc_class *)MEMORY[0x263F0A3A0];
  id v47 = a3;
  id v35 = [v4 alloc];
  v54[0] = *MEMORY[0x263F09580];
  id v5 = (void *)MEMORY[0x263F0A3A8];
  v46 = [MEMORY[0x263F0A980] sharedBehavior];
  v45 = [v46 features];
  v44 = objc_msgSend(v5, "featureFlagIsEnabled:", objc_msgSend(v45, "chamomile"));
  v53[0] = v44;
  v43 = [MEMORY[0x263F0A3A8] featureIsNotRemotelyDisabledWithIdentifier:v3];
  v53[1] = v43;
  v42 = [MEMORY[0x263F0A3A8] countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:v3];
  v53[2] = v42;
  v41 = [MEMORY[0x263EFF8C0] arrayWithObjects:v53 count:3];
  v55[0] = v41;
  v54[1] = *MEMORY[0x263F095D0];
  v6 = (void *)MEMORY[0x263F0A3A8];
  v40 = [MEMORY[0x263F0A980] sharedBehavior];
  v39 = [v40 features];
  id v38 = objc_msgSend(v6, "featureFlagIsEnabled:", objc_msgSend(v39, "chamomile"));
  v52[0] = v38;
  v37 = [MEMORY[0x263F0A3A8] profileIsNotFamilySetupPairingProfile];
  v52[1] = v37;
  uint64_t v7 = *MEMORY[0x263F098A8];
  v34 = [MEMORY[0x263F0A3A8] notAgeGatedForUserDefaultsKey:*MEMORY[0x263F098A8]];
  v52[2] = v34;
  v33 = [MEMORY[0x263F0A3A8] onboardingRecordIsPresentForFeatureWithIdentifier:v3];
  v52[3] = v33;
  v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:v52 count:4];
  v55[1] = v32;
  v54[2] = *MEMORY[0x263F095C8];
  v31 = [MEMORY[0x263F0A3A8] featureIsNotRemotelyDisabledWithIdentifier:v3];
  v51[0] = v31;
  v30 = [MEMORY[0x263F0A3A8] countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:v3];
  v51[1] = v30;
  id v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:v51 count:2];
  v55[2] = v29;
  v54[3] = *MEMORY[0x263F09600];
  v8 = (void *)MEMORY[0x263F0A3A8];
  v28 = [MEMORY[0x263F0A980] sharedBehavior];
  id v27 = [v28 features];
  id v26 = objc_msgSend(v8, "featureFlagIsEnabled:", objc_msgSend(v27, "chamomile"));
  v50[0] = v26;
  uint64_t v25 = [MEMORY[0x263F0A3A8] profileIsNotFamilySetupPairingProfile];
  v50[1] = v25;
  v24 = [MEMORY[0x263F0A3A8] featureIsNotRemotelyDisabledWithIdentifier:v3];
  v50[2] = v24;
  v23 = [MEMORY[0x263F0A3A8] countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:v3];
  v50[3] = v23;
  v22 = [MEMORY[0x263F0A3A8] notAgeGatedForUserDefaultsKey:v7];
  v50[4] = v22;
  v21 = [MEMORY[0x263F0A3A8] onboardingRecordIsPresentForFeatureWithIdentifier:v3];
  v50[5] = v21;
  v9 = [MEMORY[0x263F0A3A8] featureIsOnWithIdentifier:v3 isOnIfSettingIsAbsent:1];
  v50[6] = v9;
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v50 count:7];
  v55[3] = v10;
  v54[4] = *MEMORY[0x263F095C0];
  id v11 = [MEMORY[0x263F0A3A8] profileIsNotFamilySetupPairingProfile];
  v49[0] = v11;
  id v12 = [MEMORY[0x263F0A3A8] notAgeGatedForUserDefaultsKey:v7];
  v49[1] = v12;
  id v13 = [MEMORY[0x263F0A3A8] onboardingRecordIsPresentForFeatureWithIdentifier:v3];
  v49[2] = v13;
  id v14 = [MEMORY[0x263F0A3A8] featureIsNotRemotelyDisabledWithIdentifier:v3];
  v49[3] = v14;
  v15 = [MEMORY[0x263F0A3A8] countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:v3];
  v49[4] = v15;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v49 count:5];
  v55[4] = v16;
  id v17 = [NSDictionary dictionaryWithObjects:v55 forKeys:v54 count:5];
  v36 = (void *)[v35 initWithRequirementsByContext:v17];

  v18 = [MEMORY[0x263F0A288] localAvailabilityForPeriodicDepressionAndAnxietyAssessmentPrompts];
  id v19 = objc_msgSend(a1, "_hdmc_availabilityManagerForFeatureIdentifier:profile:availabilityRequirements:localCountrySet:", v3, v47, v36, v18);

  return v19;
}

+ (id)hdmh_stateOfMindLoggingPatternEscalationsAvailabilityManagerWithProfile:()HDMentalHealth
{
  v48[4] = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F09808];
  v4 = (objc_class *)MEMORY[0x263F0A3A0];
  id v41 = a3;
  id v31 = [v4 alloc];
  v47[0] = *MEMORY[0x263F09580];
  id v5 = (void *)MEMORY[0x263F0A3A8];
  v40 = [MEMORY[0x263F0A980] sharedBehavior];
  v39 = [v40 features];
  id v38 = objc_msgSend(v5, "featureFlagIsEnabled:", objc_msgSend(v39, "chamomile"));
  v46[0] = v38;
  v37 = [MEMORY[0x263F0A3A8] featureIsNotRemotelyDisabledWithIdentifier:v3];
  v46[1] = v37;
  v36 = [MEMORY[0x263F0A3A8] countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:v3];
  v46[2] = v36;
  id v35 = [MEMORY[0x263EFF8C0] arrayWithObjects:v46 count:3];
  v48[0] = v35;
  v47[1] = *MEMORY[0x263F095D0];
  v6 = (void *)MEMORY[0x263F0A3A8];
  v34 = [MEMORY[0x263F0A980] sharedBehavior];
  v33 = [v34 features];
  v30 = objc_msgSend(v6, "featureFlagIsEnabled:", objc_msgSend(v33, "chamomile"));
  v45[0] = v30;
  id v29 = [MEMORY[0x263F0A3A8] profileIsNotFamilySetupPairingProfile];
  v45[1] = v29;
  uint64_t v7 = *MEMORY[0x263F098A8];
  v28 = [MEMORY[0x263F0A3A8] notAgeGatedForUserDefaultsKey:*MEMORY[0x263F098A8]];
  v45[2] = v28;
  id v27 = [MEMORY[0x263F0A3A8] onboardingRecordIsPresentForFeatureWithIdentifier:v3];
  v45[3] = v27;
  id v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v45 count:4];
  v48[1] = v26;
  v47[2] = *MEMORY[0x263F095C8];
  uint64_t v25 = [MEMORY[0x263F0A3A8] featureIsNotRemotelyDisabledWithIdentifier:v3];
  v44[0] = v25;
  v24 = [MEMORY[0x263F0A3A8] countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:v3];
  v44[1] = v24;
  v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v44 count:2];
  v48[2] = v23;
  v47[3] = *MEMORY[0x263F09600];
  v8 = (void *)MEMORY[0x263F0A3A8];
  v22 = [MEMORY[0x263F0A980] sharedBehavior];
  v21 = [v22 features];
  v9 = objc_msgSend(v8, "featureFlagIsEnabled:", objc_msgSend(v21, "chamomile"));
  v43[0] = v9;
  id v10 = [MEMORY[0x263F0A3A8] profileIsNotFamilySetupPairingProfile];
  v43[1] = v10;
  id v11 = [MEMORY[0x263F0A3A8] featureIsNotRemotelyDisabledWithIdentifier:v3];
  v43[2] = v11;
  id v12 = [MEMORY[0x263F0A3A8] countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:v3];
  void v43[3] = v12;
  id v13 = [MEMORY[0x263F0A3A8] notAgeGatedForUserDefaultsKey:v7];
  v43[4] = v13;
  id v14 = [MEMORY[0x263F0A3A8] onboardingRecordIsPresentForFeatureWithIdentifier:v3];
  v43[5] = v14;
  v15 = [MEMORY[0x263F0A3A8] featureIsOnWithIdentifier:v3 isOnIfSettingIsAbsent:1];
  v43[6] = v15;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v43 count:7];
  v48[3] = v16;
  id v17 = [NSDictionary dictionaryWithObjects:v48 forKeys:v47 count:4];
  v32 = (void *)[v31 initWithRequirementsByContext:v17];

  v18 = [MEMORY[0x263F0A288] localAvailabilityForStateOfMindLoggingPatternEscalations];
  id v19 = objc_msgSend(a1, "_hdmc_availabilityManagerForFeatureIdentifier:profile:availabilityRequirements:localCountrySet:", v3, v41, v32, v18);

  return v19;
}

@end