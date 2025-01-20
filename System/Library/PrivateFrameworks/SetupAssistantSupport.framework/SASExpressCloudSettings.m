@interface SASExpressCloudSettings
+ (BOOL)_isCloudKitError:(id)a3;
+ (id)_displayZoomOption;
+ (id)_isFindMyEnabled;
+ (id)_isScreenTimeEnabled;
+ (id)_predicateForRecordsModifiedInPastMonth;
+ (id)_queryForSettingsForDeviceID:(id)a3;
+ (id)_queryForSettingsFromPastMonth;
+ (id)_queryForSettingsFromPastMonthForDeviceClass:(id)a3;
+ (id)_queryForSettingsFromPastMonthForPlatform:(unint64_t)a3;
+ (id)_zoneForSettings;
+ (id)createExpressSettingsWithQueue:(id)a3;
+ (id)privacyBundleForIdentifier:(id)a3;
+ (int)_appearanceValue;
+ (void)fetchSettingsWithCompletion:(id)a3;
+ (void)updateSettings:(id)a3 withCompletion:(id)a4;
- (OS_dispatch_queue)queue;
- (SASCloudKitClient)cloudKitClient;
- (SASExpressCloudSettings)init;
- (SASExpressCloudSettings)initWithContainerIdentifier:(id)a3;
- (id)_createSettingsRecordInZoneID:(id)a3 forDeviceID:(id)a4;
- (void)_fetchAppropriateSettingsWithCompletion:(id)a3;
- (void)_setupRecordZoneWithName:(id)a3 completion:(id)a4;
- (void)fetchSettingsWithCompletion:(id)a3;
- (void)setCloudKitClient:(id)a3;
- (void)setQueue:(id)a3;
- (void)setXpcActivity:(id)a3;
- (void)updateSettings:(id)a3 withCompletion:(id)a4;
@end

@implementation SASExpressCloudSettings

+ (id)createExpressSettingsWithQueue:(id)a3
{
  v3 = a3;
  dispatch_assert_queue_V2(v3);
  v4 = objc_alloc_init(SASExpressSettings);
  [(SASExpressSettings *)v4 setVersion:1];
  v5 = +[SASSystemInformation productType];
  [(SASExpressSettings *)v4 setProductType:v5];

  v6 = +[SASSystemInformation deviceClass];
  [(SASExpressSettings *)v4 setDeviceClass:v6];

  v7 = [MEMORY[0x1E4F74230] sharedConnection];
  -[SASExpressSettings setDeviceAnalyticsOptIn:](v4, "setDeviceAnalyticsOptIn:", [v7 userBoolValueForSetting:*MEMORY[0x1E4F73FB8]] == 1);

  v8 = +[SASExpressCloudSettings privacyBundleForIdentifier:@"com.apple.onboarding.analyticsdevice"];
  [(SASExpressSettings *)v4 setDeviceAnalyticsPrivacyBundle:v8];

  v9 = [MEMORY[0x1E4F74230] sharedConnection];
  -[SASExpressSettings setAppAnalyticsOptIn:](v4, "setAppAnalyticsOptIn:", [v9 userBoolValueForSetting:*MEMORY[0x1E4F73EE8]] == 1);

  v10 = +[SASExpressCloudSettings privacyBundleForIdentifier:@"com.apple.onboarding.analyticsapp"];
  [(SASExpressSettings *)v4 setAppAnalyticsPrivacyBundle:v10];

  -[SASExpressSettings setLocationServicesOptIn:](v4, "setLocationServicesOptIn:", [MEMORY[0x1E4F1E600] locationServicesEnabled]);
  v11 = +[SASExpressCloudSettings privacyBundleForIdentifier:@"com.apple.onboarding.locationservices"];
  [(SASExpressSettings *)v4 setLocationServicesPrivacyBundle:v11];

  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x2050000000;
  v12 = (void *)getAFPreferencesClass_softClass;
  uint64_t v45 = getAFPreferencesClass_softClass;
  if (!getAFPreferencesClass_softClass)
  {
    uint64_t v37 = MEMORY[0x1E4F143A8];
    uint64_t v38 = 3221225472;
    v39 = __getAFPreferencesClass_block_invoke;
    v40 = &unk_1E6CAB5F0;
    v41 = &v42;
    __getAFPreferencesClass_block_invoke((uint64_t)&v37);
    v12 = (void *)v43[3];
  }
  id v13 = v12;
  _Block_object_dispose(&v42, 8);
  v14 = [v13 sharedPreferences];
  -[SASExpressSettings setSiriOptIn:](v4, "setSiriOptIn:", [v14 assistantIsEnabled]);

  v15 = +[SASExpressCloudSettings privacyBundleForIdentifier:@"com.apple.onboarding.siri"];
  [(SASExpressSettings *)v4 setSiriPrivacyBundle:v15];

  v16 = [(id)objc_opt_class() _isFindMyEnabled];
  v17 = v16;
  if (v16)
  {
    -[SASExpressSettings setFindMyOptIn:](v4, "setFindMyOptIn:", [v16 BOOLValue]);
    v18 = +[SASExpressCloudSettings privacyBundleForIdentifier:@"com.apple.onboarding.findmy"];
    [(SASExpressSettings *)v4 setFindMyPrivacyBundle:v18];
  }
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x2050000000;
  v19 = (void *)getSUManagerClientClass_softClass;
  uint64_t v45 = getSUManagerClientClass_softClass;
  if (!getSUManagerClientClass_softClass)
  {
    uint64_t v37 = MEMORY[0x1E4F143A8];
    uint64_t v38 = 3221225472;
    v39 = __getSUManagerClientClass_block_invoke;
    v40 = &unk_1E6CAB5F0;
    v41 = &v42;
    __getSUManagerClientClass_block_invoke((uint64_t)&v37);
    v19 = (void *)v43[3];
  }
  v20 = v19;
  _Block_object_dispose(&v42, 8);
  v21 = (void *)[[v20 alloc] initWithDelegate:0 queue:v3 clientType:0];
  -[SASExpressSettings setSoftwareUpdateAutoUpdateEnabled:](v4, "setSoftwareUpdateAutoUpdateEnabled:", [v21 isAutomaticUpdateV2Enabled]);
  -[SASExpressSettings setSoftwareUpdateAutoDownloadEnabled:](v4, "setSoftwareUpdateAutoDownloadEnabled:", [v21 isAutomaticDownloadEnabled]);
  v22 = [(id)objc_opt_class() _isScreenTimeEnabled];
  v23 = v22;
  if (v22) {
    -[SASExpressSettings setScreenTimeEnabled:](v4, "setScreenTimeEnabled:", [v22 BOOLValue]);
  }
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x2050000000;
  v24 = (void *)getPKPassLibraryClass_softClass;
  uint64_t v45 = getPKPassLibraryClass_softClass;
  if (!getPKPassLibraryClass_softClass)
  {
    uint64_t v37 = MEMORY[0x1E4F143A8];
    uint64_t v38 = 3221225472;
    v39 = __getPKPassLibraryClass_block_invoke;
    v40 = &unk_1E6CAB5F0;
    v41 = &v42;
    __getPKPassLibraryClass_block_invoke((uint64_t)&v37);
    v24 = (void *)v43[3];
  }
  id v25 = v24;
  _Block_object_dispose(&v42, 8);
  v26 = [v25 sharedInstance];
  v27 = [v26 backupMetadata];
  [(SASExpressSettings *)v4 setWalletData:v27];

  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x2050000000;
  v28 = (void *)getNRMigratorClass_softClass;
  uint64_t v45 = getNRMigratorClass_softClass;
  if (!getNRMigratorClass_softClass)
  {
    uint64_t v37 = MEMORY[0x1E4F143A8];
    uint64_t v38 = 3221225472;
    v39 = __getNRMigratorClass_block_invoke;
    v40 = &unk_1E6CAB5F0;
    v41 = &v42;
    __getNRMigratorClass_block_invoke((uint64_t)&v37);
    v28 = (void *)v43[3];
  }
  id v29 = v28;
  _Block_object_dispose(&v42, 8);
  v30 = [v29 sharedMigrator];
  v31 = [v30 migrationConsentRequestData];
  [(SASExpressSettings *)v4 setWatchMigrationData:v31];

  -[SASExpressSettings setAppearanceMode:](v4, "setAppearanceMode:", [(id)objc_opt_class() _appearanceValue]);
  v32 = [(id)objc_opt_class() _displayZoomOption];
  v33 = v32;
  if (v32) {
    -[SASExpressSettings setDisplayZoomOption:](v4, "setDisplayZoomOption:", [v32 intValue]);
  }
  v34 = [MEMORY[0x1E4F30B78] sharedInstance];
  -[SASExpressSettings setStolenDeviceProtectionEnabled:](v4, "setStolenDeviceProtectionEnabled:", [v34 isFeatureEnabled]);

  v35 = [MEMORY[0x1E4F30B78] sharedInstance];
  -[SASExpressSettings setStolenDeviceProtectionStrictModeEnabled:](v4, "setStolenDeviceProtectionStrictModeEnabled:", [v35 isFeatureStrictModeEnabled]);

  return v4;
}

+ (void)updateSettings:(id)a3 withCompletion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(SASExpressCloudSettings);
  [(SASExpressCloudSettings *)v7 updateSettings:v6 withCompletion:v5];
}

+ (void)fetchSettingsWithCompletion:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(SASExpressCloudSettings);
  [(SASExpressCloudSettings *)v4 fetchSettingsWithCompletion:v3];
}

- (SASExpressCloudSettings)init
{
  return [(SASExpressCloudSettings *)self initWithContainerIdentifier:@"com.apple.setupassistant.expresssetup"];
}

- (SASExpressCloudSettings)initWithContainerIdentifier:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SASExpressCloudSettings;
  id v5 = [(SASExpressCloudSettings *)&v11 init];
  if (v5)
  {
    dispatch_queue_t v6 = dispatch_queue_create("Express Settings CloudKit Queue", 0);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v6;

    v8 = [[SASCloudKitClient alloc] initWithContainerIdentifier:v4 callbackQueue:v5->_queue];
    cloudKitClient = v5->_cloudKitClient;
    v5->_cloudKitClient = v8;
  }
  return v5;
}

- (void)setXpcActivity:(id)a3
{
  id v4 = a3;
  id v5 = [(SASExpressCloudSettings *)self cloudKitClient];
  [v5 setXpcActivity:v4];
}

- (void)updateSettings:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x1E4F179C8] defaultStore];
  v9 = objc_msgSend(v8, "aa_primaryAppleAccount");

  if (v9)
  {
    v10 = [(SASExpressCloudSettings *)self cloudKitClient];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __57__SASExpressCloudSettings_updateSettings_withCompletion___block_invoke;
    v19[3] = &unk_1E6CAB4D8;
    id v21 = v7;
    v19[4] = self;
    id v20 = v6;
    [v10 fetchCurrentDeviceIDWithCompletion:v19];
  }
  else
  {
    objc_super v11 = +[SASLogging facility];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[SASExpressCloudSettings updateSettings:withCompletion:](v11, v12, v13, v14, v15, v16, v17, v18);
    }

    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

void __57__SASExpressCloudSettings_updateSettings_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = +[SASLogging facility];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v6;
      _os_log_impl(&dword_1DCC71000, v7, OS_LOG_TYPE_DEFAULT, "Failed to fetch device ID: %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    v8 = *(void **)(a1 + 32);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __57__SASExpressCloudSettings_updateSettings_withCompletion___block_invoke_325;
    v12[3] = &unk_1E6CAB4B0;
    id v16 = *(id *)(a1 + 48);
    id v9 = v5;
    uint64_t v10 = *(void *)(a1 + 32);
    objc_super v11 = *(void **)(a1 + 40);
    id v13 = v9;
    uint64_t v14 = v10;
    id v15 = v11;
    [v8 _setupRecordZoneWithName:@"settings" completion:v12];
  }
}

void __57__SASExpressCloudSettings_updateSettings_withCompletion___block_invoke_325(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = +[SASExpressCloudSettings _queryForSettingsForDeviceID:a1[4]];
    v8 = [a1[5] cloudKitClient];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __57__SASExpressCloudSettings_updateSettings_withCompletion___block_invoke_326;
    v12[3] = &unk_1E6CAB488;
    id v9 = v6;
    id v10 = a1[5];
    id v13 = v9;
    id v14 = v10;
    id v15 = v5;
    id v16 = a1[4];
    id v17 = a1[6];
    id v18 = a1[7];
    [v8 fetchRecords:v7 inZone:v15 group:0 completion:v12];
  }
  else
  {
    objc_super v11 = +[SASLogging facility];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __57__SASExpressCloudSettings_updateSettings_withCompletion___block_invoke_325_cold_1();
    }

    (*((void (**)(void))a1[7] + 2))();
  }
}

void __57__SASExpressCloudSettings_updateSettings_withCompletion___block_invoke_326(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    id v7 = +[SASLogging facility];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __57__SASExpressCloudSettings_updateSettings_withCompletion___block_invoke_326_cold_1(a1, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  id v14 = +[SASSystemInformation productVersion];
  if ([v5 count])
  {
    id v15 = [v5 objectAtIndexedSubscript:0];
  }
  else
  {
    id v16 = *(void **)(a1 + 40);
    id v17 = [*(id *)(a1 + 48) zoneID];
    id v15 = [v16 _createSettingsRecordInZoneID:v17 forDeviceID:*(void *)(a1 + 56)];
  }
  id v18 = (void *)[*(id *)(a1 + 64) copy];
  uint64_t v19 = +[SASSystemInformation productType];
  [v18 setProductType:v19];

  id v20 = +[SASSystemInformation deviceClass];
  [v18 setDeviceClass:v20];

  id v21 = [v18 data];
  v22 = [v15 encryptedValues];
  [v22 setObject:v21 forKeyedSubscript:@"settings"];

  if (v14) {
    [v15 setObject:v14 forKeyedSubscript:@"productBuild"];
  }
  v23 = [*(id *)(a1 + 40) cloudKitClient];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __57__SASExpressCloudSettings_updateSettings_withCompletion___block_invoke_330;
  v24[3] = &unk_1E6CAB460;
  id v25 = *(id *)(a1 + 72);
  [v23 saveRecord:v15 group:0 completion:v24];
}

void __57__SASExpressCloudSettings_updateSettings_withCompletion___block_invoke_330(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    id v6 = +[SASLogging facility];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __57__SASExpressCloudSettings_updateSettings_withCompletion___block_invoke_330_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchSettingsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F179C8] defaultStore];
  id v6 = objc_msgSend(v5, "aa_primaryAppleAccount");

  if (v6)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __55__SASExpressCloudSettings_fetchSettingsWithCompletion___block_invoke;
    v8[3] = &unk_1E6CAB500;
    id v9 = v4;
    [(SASExpressCloudSettings *)self _fetchAppropriateSettingsWithCompletion:v8];
  }
  else
  {
    id v7 = +[SASLogging facility];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DCC71000, v7, OS_LOG_TYPE_DEFAULT, "Unable to fetch settings as there's no account", buf, 2u);
    }

    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
  }
}

void __55__SASExpressCloudSettings_fetchSettingsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = +[SASLogging facility];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __55__SASExpressCloudSettings_fetchSettingsWithCompletion___block_invoke_cold_3();
    }
LABEL_4:

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    goto LABEL_15;
  }
  if (!v5)
  {
    id v7 = +[SASLogging facility];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __55__SASExpressCloudSettings_fetchSettingsWithCompletion___block_invoke_cold_1(v7, v13, v14, v15, v16, v17, v18, v19);
    }
    goto LABEL_4;
  }
  uint64_t v8 = [v5 encryptedValues];
  id v9 = [v8 objectForKeyedSubscript:@"settings"];

  uint64_t v10 = objc_alloc_init(SASExpressSettings);
  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F94090]) initWithData:v9];
  if (SASExpressSettingsReadFrom((uint64_t)v10, (uint64_t)v11))
  {
    uint64_t v12 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    id v20 = +[SASLogging facility];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      __55__SASExpressCloudSettings_fetchSettingsWithCompletion___block_invoke_cold_2(v20, v21, v22, v23, v24, v25, v26, v27);
    }

    uint64_t v12 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v12();

LABEL_15:
}

- (void)_setupRecordZoneWithName:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = (objc_class *)MEMORY[0x1E4F1A320];
  id v8 = a3;
  id v9 = [v7 alloc];
  uint64_t v10 = (void *)[v9 initWithZoneName:v8 ownerName:*MEMORY[0x1E4F19C08]];

  uint64_t v11 = [(SASExpressCloudSettings *)self cloudKitClient];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __63__SASExpressCloudSettings__setupRecordZoneWithName_completion___block_invoke;
  v14[3] = &unk_1E6CAB528;
  id v15 = v10;
  uint64_t v16 = self;
  id v17 = v6;
  id v12 = v6;
  id v13 = v10;
  [v11 fetchRecordZone:v13 group:0 completion:v14];
}

void __63__SASExpressCloudSettings__setupRecordZoneWithName_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v7 = +[SASLogging facility];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __63__SASExpressCloudSettings__setupRecordZoneWithName_completion___block_invoke_cold_1();
    }

    if (!+[SASExpressCloudSettings _isCloudKitError:v6]
      || [v6 code] != 26)
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      goto LABEL_10;
    }
    id v5 = (id)[objc_alloc(MEMORY[0x1E4F1A310]) initWithZoneID:*(void *)(a1 + 32)];
    id v8 = [*(id *)(a1 + 40) cloudKitClient];
    [v8 saveRecordZone:v5 group:0 completion:*(void *)(a1 + 48)];
  }
LABEL_10:
}

- (id)_createSettingsRecordInZoneID:(id)a3 forDeviceID:(id)a4
{
  id v5 = (objc_class *)MEMORY[0x1E4F1A2D8];
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[[v5 alloc] initWithRecordType:@"Settings" zoneID:v7];

  [v8 setObject:v6 forKeyedSubscript:@"deviceUUID"];
  id v9 = +[SASSystemInformation deviceClass];
  [v8 setObject:v9 forKeyedSubscript:@"deviceClass"];

  [v8 setObject:&unk_1F381E220 forKeyedSubscript:@"platform"];
  return v8;
}

- (void)_fetchAppropriateSettingsWithCompletion:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[SASSystemInformation deviceClass];
  id v6 = [(id)objc_opt_class() _queryForSettingsFromPastMonthForDeviceClass:v5];
  id v7 = [(id)objc_opt_class() _zoneForSettings];
  id v8 = objc_alloc_init(MEMORY[0x1E4F1A218]);
  id v9 = [v8 defaultConfiguration];
  [v9 setQualityOfService:25];

  uint64_t v10 = +[SASLogging facility];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v5;
    _os_log_impl(&dword_1DCC71000, v10, OS_LOG_TYPE_DEFAULT, "Fetching a settings record for device class \"%@\"...", buf, 0xCu);
  }

  uint64_t v11 = [(SASExpressCloudSettings *)self cloudKitClient];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __67__SASExpressCloudSettings__fetchAppropriateSettingsWithCompletion___block_invoke;
  v15[3] = &unk_1E6CAB578;
  v15[4] = self;
  id v16 = v7;
  id v17 = v8;
  id v18 = v4;
  id v12 = v8;
  id v13 = v7;
  id v14 = v4;
  [v11 fetchRecords:v6 inZone:v13 group:v12 completion:v15];
}

void __67__SASExpressCloudSettings__fetchAppropriateSettingsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 firstObject];

  if (v4)
  {
    id v5 = +[SASLogging facility];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [v3 firstObject];
      *(_DWORD *)buf = 138412290;
      uint64_t v21 = v6;
      _os_log_impl(&dword_1DCC71000, v5, OS_LOG_TYPE_DEFAULT, "Successfully fetched record: %@", buf, 0xCu);
    }
    uint64_t v7 = *(void *)(a1 + 56);
    id v8 = [v3 firstObject];
    (*(void (**)(uint64_t, void *, void))(v7 + 16))(v7, v8, 0);
  }
  else
  {
    id v8 = [(id)objc_opt_class() _queryForSettingsFromPastMonthForPlatform:1];
    id v9 = +[SASLogging facility];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DCC71000, v9, OS_LOG_TYPE_DEFAULT, "Fetching a settings record for the current platform...", buf, 2u);
    }

    uint64_t v10 = [*(id *)(a1 + 32) cloudKitClient];
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v12 = *(void *)(a1 + 48);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __67__SASExpressCloudSettings__fetchAppropriateSettingsWithCompletion___block_invoke_354;
    v16[3] = &unk_1E6CAB578;
    id v13 = *(id *)(a1 + 56);
    uint64_t v14 = *(void *)(a1 + 32);
    id v15 = *(void **)(a1 + 40);
    id v19 = v13;
    v16[4] = v14;
    id v17 = v15;
    id v18 = *(id *)(a1 + 48);
    [v10 fetchRecords:v8 inZone:v11 group:v12 completion:v16];
  }
}

void __67__SASExpressCloudSettings__fetchAppropriateSettingsWithCompletion___block_invoke_354(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 firstObject];

  if (v4)
  {
    id v5 = +[SASLogging facility];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [v3 firstObject];
      *(_DWORD *)buf = 138412290;
      id v16 = v6;
      _os_log_impl(&dword_1DCC71000, v5, OS_LOG_TYPE_DEFAULT, "Successfully fetched record: %@", buf, 0xCu);
    }
    uint64_t v7 = *(void *)(a1 + 56);
    id v8 = [v3 firstObject];
    (*(void (**)(uint64_t, void *, void))(v7 + 16))(v7, v8, 0);
  }
  else
  {
    id v8 = [(id)objc_opt_class() _queryForSettingsFromPastMonth];
    id v9 = +[SASLogging facility];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DCC71000, v9, OS_LOG_TYPE_DEFAULT, "Fetching a settings record for any platform/device class...", buf, 2u);
    }

    uint64_t v10 = [*(id *)(a1 + 32) cloudKitClient];
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v12 = *(void *)(a1 + 48);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __67__SASExpressCloudSettings__fetchAppropriateSettingsWithCompletion___block_invoke_355;
    v13[3] = &unk_1E6CAB550;
    id v14 = *(id *)(a1 + 56);
    [v10 fetchRecords:v8 inZone:v11 group:v12 completion:v13];
  }
}

void __67__SASExpressCloudSettings__fetchAppropriateSettingsWithCompletion___block_invoke_355(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 firstObject];

  id v8 = +[SASLogging facility];
  id v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [v5 firstObject];
      int v13 = 138412290;
      id v14 = v10;
      _os_log_impl(&dword_1DCC71000, v9, OS_LOG_TYPE_DEFAULT, "Successfully fetched record: %@", (uint8_t *)&v13, 0xCu);
    }
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = [v5 firstObject];
    (*(void (**)(uint64_t, void *, void))(v11 + 16))(v11, v12, 0);
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __67__SASExpressCloudSettings__fetchAppropriateSettingsWithCompletion___block_invoke_355_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

+ (BOOL)_isCloudKitError:(id)a3
{
  id v3 = [a3 domain];
  char v4 = [v3 isEqualToString:*MEMORY[0x1E4F19C40]];

  return v4;
}

+ (id)_queryForSettingsForDeviceID:(id)a3
{
  id v3 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"deviceUUID == %@", a3];
  char v4 = (void *)[objc_alloc(MEMORY[0x1E4F1A2A0]) initWithRecordType:@"Settings" predicate:v3];

  return v4;
}

+ (id)_queryForSettingsFromPastMonthForPlatform:(unint64_t)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"platform == %ld", a3);
  char v4 = (void *)MEMORY[0x1E4F28BA0];
  v13[0] = v3;
  id v5 = +[SASExpressCloudSettings _predicateForRecordsModifiedInPastMonth];
  v13[1] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  uint64_t v7 = [v4 andPredicateWithSubpredicates:v6];

  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F1A2A0]) initWithRecordType:@"Settings" predicate:v7];
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"modificationDate" ascending:0];
  uint64_t v12 = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
  [v8 setSortDescriptors:v10];

  return v8;
}

+ (id)_queryForSettingsFromPastMonthForDeviceClass:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"deviceClass == %@", a3];
  char v4 = (void *)MEMORY[0x1E4F28BA0];
  v13[0] = v3;
  id v5 = +[SASExpressCloudSettings _predicateForRecordsModifiedInPastMonth];
  v13[1] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  uint64_t v7 = [v4 andPredicateWithSubpredicates:v6];

  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F1A2A0]) initWithRecordType:@"Settings" predicate:v7];
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"modificationDate" ascending:0];
  uint64_t v12 = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
  [v8 setSortDescriptors:v10];

  return v8;
}

+ (id)_queryForSettingsFromPastMonth
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F1A2A0]);
  id v3 = +[SASExpressCloudSettings _predicateForRecordsModifiedInPastMonth];
  char v4 = (void *)[v2 initWithRecordType:@"Settings" predicate:v3];

  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"modificationDate" ascending:0];
  v8[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  [v4 setSortDescriptors:v6];

  return v4;
}

+ (id)_predicateForRecordsModifiedInPastMonth
{
  id v2 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v3 setMonth:-1];
  char v4 = [MEMORY[0x1E4F1C9C8] date];
  id v5 = [v2 dateByAddingComponents:v3 toDate:v4 options:0];

  id v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"modificationDate >= %@", v5];

  return v6;
}

+ (id)_zoneForSettings
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F1A310]) initWithZoneName:@"settings"];
  return v2;
}

+ (id)privacyBundleForIdentifier:(id)a3
{
  id v3 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2050000000;
  char v4 = (void *)getOBBundleClass_softClass;
  uint64_t v14 = getOBBundleClass_softClass;
  if (!getOBBundleClass_softClass)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __getOBBundleClass_block_invoke;
    v10[3] = &unk_1E6CAB5F0;
    v10[4] = &v11;
    __getOBBundleClass_block_invoke((uint64_t)v10);
    char v4 = (void *)v12[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v11, 8);
  id v6 = [v5 bundleWithIdentifier:v3];
  uint64_t v7 = [v6 privacyFlow];
  if (v7)
  {
    id v8 = objc_alloc_init(SASExpressSettingsPrivacyBundle);
    [(SASExpressSettingsPrivacyBundle *)v8 setIdentifier:v3];
    -[SASExpressSettingsPrivacyBundle setContentVersion:](v8, "setContentVersion:", [v7 contentVersion]);
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
  uint64_t v15 = __Block_byref_object_copy_;
  id v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2050000000;
  id v3 = (void *)getFMDFMIPManagerClass_softClass;
  uint64_t v22 = getFMDFMIPManagerClass_softClass;
  if (!getFMDFMIPManagerClass_softClass)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __getFMDFMIPManagerClass_block_invoke;
    v18[3] = &unk_1E6CAB5F0;
    v18[4] = &v19;
    __getFMDFMIPManagerClass_block_invoke((uint64_t)v18);
    id v3 = (void *)v20[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v19, 8);
  id v5 = [v4 sharedInstance];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __43__SASExpressCloudSettings__isFindMyEnabled__block_invoke;
  v9[3] = &unk_1E6CAB5A0;
  uint64_t v11 = &v12;
  id v6 = v2;
  uint64_t v10 = v6;
  [v5 fmipStateWithCompletion:v9];

  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __43__SASExpressCloudSettings__isFindMyEnabled__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = +[SASLogging facility];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __43__SASExpressCloudSettings__isFindMyEnabled__block_invoke_cold_1();
    }
  }
  uint64_t v7 = [NSNumber numberWithInt:a2 == 1];
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (id)_isScreenTimeEnabled
{
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy_;
  id v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2050000000;
  id v3 = (void *)getSTManagementStateClass_softClass;
  uint64_t v22 = getSTManagementStateClass_softClass;
  if (!getSTManagementStateClass_softClass)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __getSTManagementStateClass_block_invoke;
    v18[3] = &unk_1E6CAB5F0;
    v18[4] = &v19;
    __getSTManagementStateClass_block_invoke((uint64_t)v18);
    id v3 = (void *)v20[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v19, 8);
  id v5 = objc_alloc_init(v4);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __47__SASExpressCloudSettings__isScreenTimeEnabled__block_invoke;
  v9[3] = &unk_1E6CAB5C8;
  uint64_t v11 = &v12;
  id v6 = v2;
  uint64_t v10 = v6;
  [v5 screenTimeStateWithCompletionHandler:v9];
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __47__SASExpressCloudSettings__isScreenTimeEnabled__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = +[SASLogging facility];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __47__SASExpressCloudSettings__isScreenTimeEnabled__block_invoke_cold_1();
    }
  }
  else
  {
    uint64_t v7 = [NSNumber numberWithInt:a2 == 2];
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (int)_appearanceValue
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2050000000;
  dispatch_semaphore_t v2 = (void *)getUISUserInterfaceStyleModeClass_softClass;
  uint64_t v13 = getUISUserInterfaceStyleModeClass_softClass;
  if (!getUISUserInterfaceStyleModeClass_softClass)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __getUISUserInterfaceStyleModeClass_block_invoke;
    v9[3] = &unk_1E6CAB5F0;
    void v9[4] = &v10;
    __getUISUserInterfaceStyleModeClass_block_invoke((uint64_t)v9);
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
    uint64_t v26 = &v25;
    uint64_t v27 = 0x2050000000;
    id v17 = (void *)getCADisplayClass_softClass;
    uint64_t v28 = getCADisplayClass_softClass;
    if (!getCADisplayClass_softClass)
    {
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __getCADisplayClass_block_invoke;
      v24[3] = &unk_1E6CAB5F0;
      void v24[4] = &v25;
      __getCADisplayClass_block_invoke((uint64_t)v24);
      id v17 = (void *)v26[3];
    }
    id v18 = v17;
    _Block_object_dispose(&v25, 8);
    uint64_t v19 = [v18 mainDisplay];
    id v20 = [v19 currentMode];

    double v21 = (double)(unint64_t)[v20 height];
    double v22 = v13 * v16;
    if (v22 == v21 && v7 * v10 == (double)(unint64_t)objc_msgSend(v20, "width", v21, v22)) {
      id v4 = &unk_1F381E238;
    }
    else {
      id v4 = &unk_1F381E250;
    }
  }
  return v4;
}

- (SASCloudKitClient)cloudKitClient
{
  return self->_cloudKitClient;
}

- (void)setCloudKitClient:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_cloudKitClient, 0);
}

- (void)updateSettings:(uint64_t)a3 withCompletion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __57__SASExpressCloudSettings_updateSettings_withCompletion___block_invoke_325_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DCC71000, v0, v1, "Error setting up record zone: %@", v2, v3, v4, v5, v6);
}

void __57__SASExpressCloudSettings_updateSettings_withCompletion___block_invoke_326_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __57__SASExpressCloudSettings_updateSettings_withCompletion___block_invoke_330_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DCC71000, v0, v1, "Failed to save record: %@", v2, v3, v4, v5, v6);
}

void __55__SASExpressCloudSettings_fetchSettingsWithCompletion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __55__SASExpressCloudSettings_fetchSettingsWithCompletion___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __55__SASExpressCloudSettings_fetchSettingsWithCompletion___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DCC71000, v0, v1, "Unable to fetch settings: %@", v2, v3, v4, v5, v6);
}

void __63__SASExpressCloudSettings__setupRecordZoneWithName_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DCC71000, v0, v1, "Failed to fetching record zone: %@", v2, v3, v4, v5, v6);
}

void __67__SASExpressCloudSettings__fetchAppropriateSettingsWithCompletion___block_invoke_355_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DCC71000, v0, v1, "Failed to fetch records: %{public}@", v2, v3, v4, v5, v6);
}

void __43__SASExpressCloudSettings__isFindMyEnabled__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DCC71000, v0, v1, "Failed to retrieve Find My state: %@", v2, v3, v4, v5, v6);
}

void __47__SASExpressCloudSettings__isScreenTimeEnabled__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DCC71000, v0, v1, "Failed to retrieve Screen Time state: %@", v2, v3, v4, v5, v6);
}

@end