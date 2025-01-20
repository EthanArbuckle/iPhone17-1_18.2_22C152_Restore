@interface BYExpressCloudSettings
+ (id)_displayZoomOption;
+ (id)_isFindMyEnabled;
+ (id)_isScreenTimeEnabled;
+ (id)createExpressSettingsWithQueue:(id)a3;
+ (id)privacyBundleForIdentifier:(id)a3;
+ (int)_appearanceValue;
+ (void)fetchSettingsWithCompletion:(id)a3;
+ (void)updateSettings:(id)a3 withCompletion:(id)a4;
@end

@implementation BYExpressCloudSettings

+ (id)createExpressSettingsWithQueue:(id)a3
{
  v3 = a3;
  dispatch_assert_queue_V2(v3);
  id v4 = objc_alloc_init(MEMORY[0x1E4F9AA48]);
  [v4 setVersion:1];
  v5 = [MEMORY[0x1E4F9AA58] productType];
  [v4 setProductType:v5];

  v6 = [MEMORY[0x1E4F9AA58] deviceClass];
  [v4 setDeviceClass:v6];

  v7 = [MEMORY[0x1E4F9AA58] productVersion];
  [v4 setProductVersion:v7];

  v8 = [MEMORY[0x1E4F74230] sharedConnection];
  objc_msgSend(v4, "setDeviceAnalyticsOptIn:", objc_msgSend(v8, "userBoolValueForSetting:", *MEMORY[0x1E4F73FB8]) == 1);

  v9 = +[BYExpressCloudSettings privacyBundleForIdentifier:@"com.apple.onboarding.analyticsdevice"];
  [v4 setDeviceAnalyticsPrivacyBundle:v9];

  v10 = [MEMORY[0x1E4F74230] sharedConnection];
  objc_msgSend(v4, "setAppAnalyticsOptIn:", objc_msgSend(v10, "userBoolValueForSetting:", *MEMORY[0x1E4F73EE8]) == 1);

  v11 = +[BYExpressCloudSettings privacyBundleForIdentifier:@"com.apple.onboarding.analyticsapp"];
  [v4 setAppAnalyticsPrivacyBundle:v11];

  objc_msgSend(v4, "setLocationServicesOptIn:", objc_msgSend(MEMORY[0x1E4F1E600], "locationServicesEnabled"));
  v12 = +[BYExpressCloudSettings privacyBundleForIdentifier:@"com.apple.onboarding.locationservices"];
  [v4 setLocationServicesPrivacyBundle:v12];

  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x2050000000;
  v13 = (void *)getAFPreferencesClass_softClass_3;
  uint64_t v47 = getAFPreferencesClass_softClass_3;
  if (!getAFPreferencesClass_softClass_3)
  {
    uint64_t v39 = MEMORY[0x1E4F143A8];
    uint64_t v40 = 3221225472;
    v41 = __getAFPreferencesClass_block_invoke_3;
    v42 = &unk_1E5D2B9E8;
    v43 = &v44;
    __getAFPreferencesClass_block_invoke_3((uint64_t)&v39);
    v13 = (void *)v45[3];
  }
  id v14 = v13;
  _Block_object_dispose(&v44, 8);
  v15 = [v14 sharedPreferences];
  objc_msgSend(v4, "setSiriOptIn:", objc_msgSend(v15, "assistantIsEnabled"));

  v16 = +[BYExpressCloudSettings privacyBundleForIdentifier:@"com.apple.onboarding.siri"];
  [v4 setSiriPrivacyBundle:v16];

  objc_msgSend(v4, "setSiriVoiceTriggerEnabled:", +[BYSiriUtilities isVoiceTriggerEnabled](BYSiriUtilities, "isVoiceTriggerEnabled"));
  v17 = [(id)objc_opt_class() _isFindMyEnabled];
  v18 = v17;
  if (v17)
  {
    objc_msgSend(v4, "setFindMyOptIn:", objc_msgSend(v17, "BOOLValue"));
    v19 = +[BYExpressCloudSettings privacyBundleForIdentifier:@"com.apple.onboarding.findmy"];
    [v4 setFindMyPrivacyBundle:v19];
  }
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x2050000000;
  v20 = (void *)getSUManagerClientClass_softClass_1;
  uint64_t v47 = getSUManagerClientClass_softClass_1;
  if (!getSUManagerClientClass_softClass_1)
  {
    uint64_t v39 = MEMORY[0x1E4F143A8];
    uint64_t v40 = 3221225472;
    v41 = __getSUManagerClientClass_block_invoke_1;
    v42 = &unk_1E5D2B9E8;
    v43 = &v44;
    __getSUManagerClientClass_block_invoke_1((uint64_t)&v39);
    v20 = (void *)v45[3];
  }
  v21 = v20;
  _Block_object_dispose(&v44, 8);
  v22 = (void *)[[v21 alloc] initWithDelegate:0 queue:v3 clientType:0];
  objc_msgSend(v4, "setSoftwareUpdateAutoUpdateEnabled:", objc_msgSend(v22, "isAutomaticUpdateV2Enabled"));
  objc_msgSend(v4, "setSoftwareUpdateAutoDownloadEnabled:", objc_msgSend(v22, "isAutomaticDownloadEnabled"));
  v23 = [(id)objc_opt_class() _isScreenTimeEnabled];
  v24 = v23;
  if (v23) {
    objc_msgSend(v4, "setScreenTimeEnabled:", objc_msgSend(v23, "BOOLValue"));
  }
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x2050000000;
  v25 = (void *)getPKPassLibraryClass_softClass_1;
  uint64_t v47 = getPKPassLibraryClass_softClass_1;
  if (!getPKPassLibraryClass_softClass_1)
  {
    uint64_t v39 = MEMORY[0x1E4F143A8];
    uint64_t v40 = 3221225472;
    v41 = __getPKPassLibraryClass_block_invoke_1;
    v42 = &unk_1E5D2B9E8;
    v43 = &v44;
    __getPKPassLibraryClass_block_invoke_1((uint64_t)&v39);
    v25 = (void *)v45[3];
  }
  id v26 = v25;
  _Block_object_dispose(&v44, 8);
  v27 = [v26 sharedInstance];
  v28 = [v27 backupMetadata];
  [v4 setWalletData:v28];

  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x2050000000;
  v29 = (void *)getNRMigratorClass_softClass_1;
  uint64_t v47 = getNRMigratorClass_softClass_1;
  if (!getNRMigratorClass_softClass_1)
  {
    uint64_t v39 = MEMORY[0x1E4F143A8];
    uint64_t v40 = 3221225472;
    v41 = __getNRMigratorClass_block_invoke_1;
    v42 = &unk_1E5D2B9E8;
    v43 = &v44;
    __getNRMigratorClass_block_invoke_1((uint64_t)&v39);
    v29 = (void *)v45[3];
  }
  id v30 = v29;
  _Block_object_dispose(&v44, 8);
  v31 = [v30 sharedMigrator];
  v32 = [v31 migrationConsentRequestData];
  [v4 setWatchMigrationData:v32];

  objc_msgSend(v4, "setAppearanceMode:", objc_msgSend((id)objc_opt_class(), "_appearanceValue"));
  v33 = [(id)objc_opt_class() _displayZoomOption];
  v34 = v33;
  if (v33) {
    objc_msgSend(v4, "setDisplayZoomOption:", objc_msgSend(v33, "intValue"));
  }
  v35 = [MEMORY[0x1E4F30B78] sharedInstance];
  objc_msgSend(v4, "setStolenDeviceProtectionEnabled:", objc_msgSend(v35, "isFeatureEnabled"));

  v36 = [MEMORY[0x1E4F30B78] sharedInstance];
  objc_msgSend(v4, "setStolenDeviceProtectionStrictModeEnabled:", objc_msgSend(v36, "isFeatureStrictModeEnabled"));

  v37 = _BYLoggingFacility();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
    +[BYExpressCloudSettings createExpressSettingsWithQueue:]((uint64_t)v4, v37);
  }

  return v4;
}

+ (void)updateSettings:(id)a3 withCompletion:(id)a4
{
  v5 = (objc_class *)MEMORY[0x1E4F9AA40];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(v5);
  [v8 updateSettings:v7 withCompletion:v6];
}

+ (void)fetchSettingsWithCompletion:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F9AA40];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 fetchSettingsWithCompletion:v4];
}

+ (id)privacyBundleForIdentifier:(id)a3
{
  id v3 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2050000000;
  id v4 = (void *)getOBBundleClass_softClass;
  uint64_t v14 = getOBBundleClass_softClass;
  if (!getOBBundleClass_softClass)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __getOBBundleClass_block_invoke;
    v10[3] = &unk_1E5D2B9E8;
    v10[4] = &v11;
    __getOBBundleClass_block_invoke((uint64_t)v10);
    id v4 = (void *)v12[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v11, 8);
  id v6 = [v5 bundleWithIdentifier:v3];
  id v7 = [v6 privacyFlow];
  if (v7)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F9AA50]);
    [v8 setIdentifier:v3];
    objc_msgSend(v8, "setContentVersion:", objc_msgSend(v7, "contentVersion"));
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (id)_isFindMyEnabled
{
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__8;
  v16 = __Block_byref_object_dispose__8;
  id v17 = 0;
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2050000000;
  id v3 = (void *)getFMDFMIPManagerClass_softClass_1;
  uint64_t v22 = getFMDFMIPManagerClass_softClass_1;
  if (!getFMDFMIPManagerClass_softClass_1)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __getFMDFMIPManagerClass_block_invoke_1;
    v18[3] = &unk_1E5D2B9E8;
    v18[4] = &v19;
    __getFMDFMIPManagerClass_block_invoke_1((uint64_t)v18);
    id v3 = (void *)v20[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v19, 8);
  id v5 = [v4 sharedInstance];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __42__BYExpressCloudSettings__isFindMyEnabled__block_invoke;
  v9[3] = &unk_1E5D2BBA8;
  uint64_t v11 = &v12;
  id v6 = v2;
  v10 = v6;
  [v5 fmipStateWithCompletion:v9];

  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __42__BYExpressCloudSettings__isFindMyEnabled__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = _BYLoggingFacility();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __42__BYExpressCloudSettings__isFindMyEnabled__block_invoke_cold_1(v5);
    }
  }
  uint64_t v7 = [NSNumber numberWithInt:a2 == 1];
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (id)_isScreenTimeEnabled
{
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__8;
  v16 = __Block_byref_object_dispose__8;
  id v17 = 0;
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2050000000;
  id v3 = (void *)getSTManagementStateClass_softClass_1;
  uint64_t v22 = getSTManagementStateClass_softClass_1;
  if (!getSTManagementStateClass_softClass_1)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __getSTManagementStateClass_block_invoke_1;
    v18[3] = &unk_1E5D2B9E8;
    v18[4] = &v19;
    __getSTManagementStateClass_block_invoke_1((uint64_t)v18);
    id v3 = (void *)v20[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v19, 8);
  id v5 = objc_alloc_init(v4);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __46__BYExpressCloudSettings__isScreenTimeEnabled__block_invoke;
  v9[3] = &unk_1E5D2CA28;
  uint64_t v11 = &v12;
  id v6 = v2;
  v10 = v6;
  [v5 screenTimeStateWithCompletionHandler:v9];
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __46__BYExpressCloudSettings__isScreenTimeEnabled__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = _BYLoggingFacility();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __46__BYExpressCloudSettings__isScreenTimeEnabled__block_invoke_cold_1(v5);
    }
  }
  else
  {
    uint64_t v7 = [NSNumber numberWithInt:a2 == 2];
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (int)_appearanceValue
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2050000000;
  dispatch_semaphore_t v2 = (void *)getUISUserInterfaceStyleModeClass_softClass_1;
  uint64_t v13 = getUISUserInterfaceStyleModeClass_softClass_1;
  if (!getUISUserInterfaceStyleModeClass_softClass_1)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __getUISUserInterfaceStyleModeClass_block_invoke_1;
    v9[3] = &unk_1E5D2B9E8;
    void v9[4] = &v10;
    __getUISUserInterfaceStyleModeClass_block_invoke_1((uint64_t)v9);
    dispatch_semaphore_t v2 = (void *)v11[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v10, 8);
  id v4 = (void *)[[v3 alloc] initWithDelegate:0];
  uint64_t v5 = [v4 modeValue];
  if (v5 == 1) {
    int v6 = 1;
  }
  else {
    int v6 = 3;
  }
  if (v5 == 2) {
    int v7 = 2;
  }
  else {
    int v7 = v6;
  }

  return v7;
}

+ (id)_displayZoomOption
{
  dispatch_semaphore_t v2 = (void *)MGCopyAnswer();
  id v3 = [v2 objectForKeyedSubscript:@"zoomed"];
  id v4 = 0;
  if ([v3 count] == 4)
  {
    uint64_t v5 = [v3 objectAtIndexedSubscript:0];
    [v5 floatValue];
    float v7 = v6;

    uint64_t v8 = [v3 objectAtIndexedSubscript:1];
    [v8 floatValue];
    float v10 = v9;

    uint64_t v11 = [v3 objectAtIndexedSubscript:2];
    [v11 floatValue];
    float v13 = v12;

    uint64_t v14 = [v3 objectAtIndexedSubscript:3];
    [v14 floatValue];
    float v16 = v15;

    uint64_t v25 = 0;
    id v26 = &v25;
    uint64_t v27 = 0x2050000000;
    id v17 = (void *)getCADisplayClass_softClass;
    uint64_t v28 = getCADisplayClass_softClass;
    if (!getCADisplayClass_softClass)
    {
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __getCADisplayClass_block_invoke;
      v24[3] = &unk_1E5D2B9E8;
      v24[4] = &v25;
      __getCADisplayClass_block_invoke((uint64_t)v24);
      id v17 = (void *)v26[3];
    }
    id v18 = v17;
    _Block_object_dispose(&v25, 8);
    uint64_t v19 = [v18 mainDisplay];
    v20 = [v19 currentMode];

    double v21 = (double)(unint64_t)[v20 height];
    double v22 = v13 * v16;
    if (v22 == v21 && v7 * v10 == (double)(unint64_t)objc_msgSend(v20, "width", v21, v22)) {
      id v4 = &unk_1EFE4E460;
    }
    else {
      id v4 = &unk_1EFE4E478;
    }
  }
  return v4;
}

+ (void)createExpressSettingsWithQueue:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1A7DED000, a2, OS_LOG_TYPE_DEBUG, "Created express settings %@", (uint8_t *)&v2, 0xCu);
}

void __42__BYExpressCloudSettings__isFindMyEnabled__block_invoke_cold_1(void *a1)
{
  int v9 = _BYIsInternalInstall();
  if ((v9 & 1) == 0)
  {
    float v10 = NSString;
    v1 = [a1 domain];
    uint64_t v11 = (uint64_t)v1;
    uint64_t v12 = [a1 code];
    a1 = [v10 stringWithFormat:@"<Error domain: %@, code %ld>"];
  }
  OUTLINED_FUNCTION_0_1(&dword_1A7DED000, v3, v4, "Failed to retrieve Find My state: %{public}@", v5, v6, v7, v8, v11, v12, 2u);
  if (!v9)
  {
  }
}

void __46__BYExpressCloudSettings__isScreenTimeEnabled__block_invoke_cold_1(void *a1)
{
  int v9 = _BYIsInternalInstall();
  if ((v9 & 1) == 0)
  {
    float v10 = NSString;
    v1 = [a1 domain];
    uint64_t v11 = (uint64_t)v1;
    uint64_t v12 = [a1 code];
    a1 = [v10 stringWithFormat:@"<Error domain: %@, code %ld>"];
  }
  OUTLINED_FUNCTION_0_1(&dword_1A7DED000, v3, v4, "Failed to retrieve Screen Time state: %{public}@", v5, v6, v7, v8, v11, v12, 2u);
  if (!v9)
  {
  }
}

@end