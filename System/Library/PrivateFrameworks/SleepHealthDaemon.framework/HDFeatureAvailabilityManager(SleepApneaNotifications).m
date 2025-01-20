@interface HDFeatureAvailabilityManager(SleepApneaNotifications)
+ (id)hdsh_sleepApneaNotificationsAvailabilityManagerWithProfile:()SleepApneaNotifications;
@end

@implementation HDFeatureAvailabilityManager(SleepApneaNotifications)

+ (id)hdsh_sleepApneaNotificationsAvailabilityManagerWithProfile:()SleepApneaNotifications
{
  v106[5] = *MEMORY[0x263EF8340];
  id v4 = (id)*MEMORY[0x263F097D8];
  v5 = (void *)MEMORY[0x263F0A980];
  id v6 = a3;
  v7 = [v5 sharedBehavior];
  LODWORD(v5) = [v7 isAppleWatch];

  id v8 = objc_alloc(MEMORY[0x263F08C38]);
  if (v5) {
    v9 = @"46F59960-D16A-4E76-B7D1-A1B0BBC73923";
  }
  else {
    v9 = @"D6770323-EBBB-4867-A1A7-99F207C64094";
  }
  v95 = (void *)[v8 initWithUUIDString:v9];
  id v10 = objc_alloc(MEMORY[0x263F43228]);
  v11 = [MEMORY[0x263F0A288] localAvailabilityForSleepApneaNotifications];
  v12 = [v6 daemon];
  v97 = (void *)[v10 initWithFeatureIdentifier:v4 defaultCountrySet:v11 healthDaemon:v12];

  id v13 = objc_alloc(MEMORY[0x263F432B8]);
  v14 = [MEMORY[0x263F0A380] featureAttributesDerivedFromOSBuildAndFeatureVersion:*MEMORY[0x263F09FB8] watchDeviceIdentifier:*MEMORY[0x263F09FC8] phoneDeviceIdentifier:*MEMORY[0x263F09FC0]];
  v15 = (void *)[v13 initWithFeatureIdentifier:v4 localFeatureAttributes:v14 localCountrySetAvailabilityProvider:v97];

  v96 = v15;
  [v15 synchronizeLocalProperties];
  id v16 = objc_alloc(MEMORY[0x263F43440]);
  v93 = v6;
  v94 = (void *)[v16 initWithAllowedCountriesDataSource:v15 profile:v6 featureCapability:v95 loggingCategory:*MEMORY[0x263F09958]];
  id v17 = objc_alloc(MEMORY[0x263F432A8]);
  v18 = [v6 daemon];
  v92 = (void *)[v17 initWithDaemon:v18 featureIdentifier:v4];

  id v91 = objc_alloc(MEMORY[0x263F431E8]);
  id v72 = objc_alloc(MEMORY[0x263F0A3A0]);
  v105[0] = *MEMORY[0x263F095A8];
  v19 = (void *)MEMORY[0x263F0A3A8];
  v90 = [MEMORY[0x263F0A980] sharedBehavior];
  v89 = [v90 features];
  v88 = objc_msgSend(v19, "featureFlagIsEnabled:", objc_msgSend(v89, "nebula"));
  v104[0] = v88;
  v87 = [MEMORY[0x263F0A3A8] onboardingRecordIsNotPresentForFeatureWithIdentifier:v4];
  v104[1] = v87;
  v86 = [MEMORY[0x263F0A3A8] defaultOnboardingEligibilityRequirementsForFeatureIdentifier:v4];
  v104[2] = v86;
  v85 = [MEMORY[0x263F0A3A8] someRegionIsSupportedForFeatureWithIdentifier:v4];
  v104[3] = v85;
  v84 = [MEMORY[0x263F0A3A8] healthAppIsNotHidden];
  v104[4] = v84;
  uint64_t v20 = *MEMORY[0x263F098B0];
  v83 = [MEMORY[0x263F0A3A8] notAgeGatedForUserDefaultsKey:*MEMORY[0x263F098B0]];
  v104[5] = v83;
  v82 = [MEMORY[0x263F0A3A8] wristDetectionIsEnabledForActiveWatch];
  v104[6] = v82;
  v21 = (void *)MEMORY[0x263F0A3A8];
  id v22 = objc_alloc(MEMORY[0x263F0A390]);
  uint64_t v23 = *MEMORY[0x263F097E8];
  v81 = (void *)[v22 initWithFeatureIdentifier:*MEMORY[0x263F097E8] isOnWhenSettingIsAbsent:0];
  v103 = v81;
  v80 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v103 count:1];
  v79 = [v21 prerequisiteFeaturesAreOnWithFeatureSettings:v80];
  v104[7] = v79;
  v78 = [MEMORY[0x263EFF8C0] arrayWithObjects:v104 count:8];
  v106[0] = v78;
  v105[1] = *MEMORY[0x263F095B0];
  v24 = (void *)MEMORY[0x263F0A3A8];
  v77 = [MEMORY[0x263F0A980] sharedBehavior];
  v76 = [v77 features];
  v75 = objc_msgSend(v24, "featureFlagIsEnabled:", objc_msgSend(v76, "nebula"));
  v102[0] = v75;
  v74 = [MEMORY[0x263F0A3A8] onboardingRecordIsNotPresentForFeatureWithIdentifier:v4];
  v102[1] = v74;
  v71 = [MEMORY[0x263F0A3A8] notAgeGatedForUserDefaultsKey:v20];
  v102[2] = v71;
  v70 = [MEMORY[0x263F0A3A8] defaultOnboardingEligibilityRequirementsForFeatureIdentifier:v4];
  v102[3] = v70;
  v69 = [MEMORY[0x263F0A3A8] someRegionIsSupportedForFeatureWithIdentifier:v4];
  v102[4] = v69;
  v68 = [MEMORY[0x263EFF8C0] arrayWithObjects:v102 count:5];
  v106[1] = v68;
  v105[2] = *MEMORY[0x263F09600];
  v25 = (void *)MEMORY[0x263F0A3A8];
  v67 = [MEMORY[0x263F0A980] sharedBehavior];
  v66 = [v67 features];
  v65 = objc_msgSend(v25, "featureFlagIsEnabled:", objc_msgSend(v66, "nebula"));
  v101[0] = v65;
  v64 = [MEMORY[0x263F0A3A8] profileIsNotFamilySetupPairingProfile];
  v101[1] = v64;
  v63 = [MEMORY[0x263F0A3A8] onboardingRecordIsPresentForFeatureWithIdentifier:v4];
  v101[2] = v63;
  v62 = [MEMORY[0x263F0A3A8] activeRemoteDeviceIsPresentWhenRequiredForRegionAvailabilityOrDeviceCapabilityForFeatureWithIdentifier:v4];
  v101[3] = v62;
  v61 = [MEMORY[0x263F0A3A8] capabilityIsSupportedOnActiveWatchForFeatureWithIdentifier:v4 supportedOnLocalDevice:MGGetBoolAnswer()];
  v101[4] = v61;
  v60 = [MEMORY[0x263F0A3A8] featureIsNotRemotelyDisabledWithIdentifier:v4];
  v101[5] = v60;
  v59 = [MEMORY[0x263F0A3A8] seedIsNotExpiredForFeatureWithIdentifier:v4];
  v101[6] = v59;
  v58 = [MEMORY[0x263F0A3A8] countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:v4];
  v101[7] = v58;
  v57 = [MEMORY[0x263F0A3A8] countryIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:v4 isSupportedIfCountryListMissing:1];
  v101[8] = v57;
  v56 = [MEMORY[0x263F0A3A8] notAgeGatedForUserDefaultsKey:v20];
  v101[9] = v56;
  v55 = [MEMORY[0x263F0A3A8] healthAppIsNotHidden];
  v101[10] = v55;
  v54 = [MEMORY[0x263F0A3A8] wristDetectionIsEnabledForActiveWatch];
  v101[11] = v54;
  v26 = (void *)MEMORY[0x263F0A3A8];
  v53 = (void *)[objc_alloc(MEMORY[0x263F0A390]) initWithFeatureIdentifier:v23 isOnWhenSettingIsAbsent:0];
  v100 = v53;
  v52 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v100 count:1];
  v51 = [v26 prerequisiteFeaturesAreOnWithFeatureSettings:v52];
  v101[12] = v51;
  v50 = [MEMORY[0x263F0A3A8] featureIsOnWithIdentifier:v4 isOnIfSettingIsAbsent:0];
  v101[13] = v50;
  v49 = [MEMORY[0x263EFF8C0] arrayWithObjects:v101 count:14];
  v106[2] = v49;
  v105[3] = *MEMORY[0x263F095D0];
  v27 = (void *)MEMORY[0x263F0A3A8];
  v48 = [MEMORY[0x263F0A980] sharedBehavior];
  v47 = [v48 features];
  v46 = objc_msgSend(v27, "featureFlagIsEnabled:", objc_msgSend(v47, "nebula"));
  v99[0] = v46;
  v45 = [MEMORY[0x263F0A3A8] someRegionIsSupportedForFeatureWithIdentifier:v4];
  v99[1] = v45;
  v44 = [MEMORY[0x263F0A3A8] capabilityIsSupportedOnActiveWatchForFeatureWithIdentifier:v4 supportedOnLocalDevice:MGGetBoolAnswer()];
  v99[2] = v44;
  v43 = [MEMORY[0x263F0A3A8] healthAppIsNotHidden];
  v99[3] = v43;
  v42 = [MEMORY[0x263F0A3A8] notAgeGatedForUserDefaultsKey:v20];
  v99[4] = v42;
  v41 = [MEMORY[0x263EFF8C0] arrayWithObjects:v99 count:5];
  v106[3] = v41;
  v105[4] = *MEMORY[0x263F095C8];
  v28 = (void *)MEMORY[0x263F0A3A8];
  v40 = [MEMORY[0x263F0A980] sharedBehavior];
  v29 = [v40 features];
  v30 = objc_msgSend(v28, "featureFlagIsEnabled:", objc_msgSend(v29, "nebula"));
  v98[0] = v30;
  v31 = [MEMORY[0x263F0A3A8] featureIsNotRemotelyDisabledWithIdentifier:v4];
  v98[1] = v31;
  v32 = [MEMORY[0x263F0A3A8] seedIsNotExpiredForFeatureWithIdentifier:v4];
  v98[2] = v32;
  v33 = [MEMORY[0x263F0A3A8] countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:v4];
  v98[3] = v33;
  v34 = [MEMORY[0x263F0A3A8] countryIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:v4 isSupportedIfCountryListMissing:1];
  v98[4] = v34;
  v35 = [MEMORY[0x263F0A3A8] someRegionIsSupportedForFeatureWithIdentifier:v4];
  v98[5] = v35;
  v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:v98 count:6];
  v106[4] = v36;
  v37 = [NSDictionary dictionaryWithObjects:v106 forKeys:v105 count:5];
  v73 = (void *)[v72 initWithRequirementsByContext:v37];

  v38 = (void *)[v91 initWithProfile:v93 featureIdentifier:v4 availabilityRequirements:v73 currentOnboardingVersion:1 pairedDeviceCapability:v95 pairedFeatureAttributesProvider:v96 regionAvailabilityProvider:v94 disableAndExpiryProvider:v92 loggingCategory:*MEMORY[0x263F09958]];
  return v38;
}

@end