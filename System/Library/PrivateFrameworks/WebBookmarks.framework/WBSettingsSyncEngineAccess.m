@interface WBSettingsSyncEngineAccess
- (BOOL)_isKnownPerSiteSetting:(id)a3;
- (BOOL)_isShowBackgroundImageEnabled;
- (BOOL)backgroundImageAppearanceIsLight;
- (BOOL)backgroundImageExists;
- (BOOL)syncEnabled;
- (NSArray)syncSettingsUpDictionary;
- (id)_deviceClass;
- (id)_perSitePreferencesStore;
- (id)_startPageSectionOrder;
- (id)startPageSectionsManager;
- (int64_t)_settingForValue:(id)a3;
- (void)_attemptUpdatingSavingPerSiteSettingsWithRecord:(id)a3;
- (void)_didUpdateIOSDefaultBrowserWithRecord:(id)a3;
- (void)_didUpdateStartPageBackgroundImageVisibilityWithRecord:(id)a3;
- (void)_installMobileAssetIfApplicableWithURL:(id)a3;
- (void)_updatePerSiteSettingsWithRecord:(id)a3;
- (void)_updatePerSiteSettingsWithRecord:(id)a3 completionHandler:(id)a4;
- (void)_updateStartPageBackgroundImageWithRecord:(id)a3;
- (void)_updateStartPageCloudTabsConsent:(id)a3;
- (void)_updateStartPageSectionOrder:(id)a3;
- (void)_updateStartPageSectionVisibilityWithIdentifier:(id)a3 record:(id)a4;
- (void)deleteBackgroundImageDirectory;
- (void)didDeleteRemoteRecordWithID:(id)a3;
- (void)didReceiveRemoteCloudSettingsUpdateWithRecord:(id)a3;
@end

@implementation WBSettingsSyncEngineAccess

- (int64_t)_settingForValue:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:*MEMORY[0x263F66790]])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:*MEMORY[0x263F66760]])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isEqualToString:*MEMORY[0x263F66768]])
  {
    int64_t v4 = 3;
  }
  else if ([v3 isEqualToString:*MEMORY[0x263F66778]])
  {
    int64_t v4 = 4;
  }
  else if ([v3 isEqualToString:*MEMORY[0x263F66798]])
  {
    int64_t v4 = 5;
  }
  else if ([v3 isEqualToString:*MEMORY[0x263F66758]])
  {
    int64_t v4 = 6;
  }
  else if ([v3 isEqualToString:*MEMORY[0x263F66780]])
  {
    int64_t v4 = 7;
  }
  else if ([v3 isEqualToString:*MEMORY[0x263F66750]])
  {
    int64_t v4 = 8;
  }
  else if ([v3 isEqualToString:*MEMORY[0x263F66770]])
  {
    int64_t v4 = 9;
  }
  else if ([v3 isEqualToString:*MEMORY[0x263F66788]])
  {
    int64_t v4 = 10;
  }
  else if ([v3 isEqualToString:*MEMORY[0x263F667A8]])
  {
    int64_t v4 = 11;
  }
  else if (([v3 isEqualToString:*MEMORY[0x263F666E0]] & 1) != 0 {
         || ([v3 isEqualToString:*MEMORY[0x263F666E8]] & 1) != 0)
  }
  {
    int64_t v4 = 12;
  }
  else if ([v3 isEqualToString:*MEMORY[0x263F667A0]])
  {
    int64_t v4 = 13;
  }
  else if ([v3 isEqualToString:*MEMORY[0x263F66748]])
  {
    int64_t v4 = 14;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (BOOL)syncEnabled
{
  return [MEMORY[0x263F662A0] isCustomizationSyncEnabled];
}

- (void)didReceiveRemoteCloudSettingsUpdateWithRecord:(id)a3
{
  id v8 = a3;
  if ([(WBSettingsSyncEngineAccess *)self syncEnabled])
  {
    if (objc_msgSend(v8, "safari_isCloudBackgroundImageRecord")
      && [MEMORY[0x263F662A0] isStartPageSettingSyncEnabled])
    {
      [(WBSettingsSyncEngineAccess *)self _updateStartPageBackgroundImageWithRecord:v8];
    }
    else if (objc_msgSend(v8, "safari_isCloudPerSiteSettingRecord") {
           && [MEMORY[0x263F662A0] isPerSiteSettingSyncEnabled])
    }
    {
      [(WBSettingsSyncEngineAccess *)self _updatePerSiteSettingsWithRecord:v8];
    }
    else if (objc_msgSend(v8, "safari_isCloudSettingRecord") {
           && [MEMORY[0x263F662A0] isStartPageSettingSyncEnabled])
    }
    {
      int64_t v4 = [v8 recordID];
      v5 = [v4 recordName];
      int64_t v6 = [(WBSettingsSyncEngineAccess *)self _settingForValue:v5];

      v7 = (void *)MEMORY[0x263F667D8];
      switch(v6)
      {
        case 1:
          [(WBSettingsSyncEngineAccess *)self _updateStartPageSectionOrder:v8];
          break;
        case 2:
          goto LABEL_23;
        case 3:
          v7 = (void *)MEMORY[0x263F667E0];
          goto LABEL_23;
        case 4:
          v7 = (void *)MEMORY[0x263F667F0];
          goto LABEL_23;
        case 5:
          v7 = (void *)MEMORY[0x263F66808];
          goto LABEL_23;
        case 6:
          v7 = (void *)MEMORY[0x263F667D0];
          goto LABEL_23;
        case 7:
          v7 = (void *)MEMORY[0x263F667F8];
          goto LABEL_23;
        case 8:
          [(WBSettingsSyncEngineAccess *)self _didUpdateStartPageBackgroundImageVisibilityWithRecord:v8];
          break;
        case 9:
          v7 = (void *)MEMORY[0x263F667E8];
          goto LABEL_23;
        case 10:
          v7 = (void *)MEMORY[0x263F66800];
          goto LABEL_23;
        case 11:
          v7 = (void *)MEMORY[0x263F66818];
          goto LABEL_23;
        case 12:
          [(WBSettingsSyncEngineAccess *)self _didUpdateIOSDefaultBrowserWithRecord:v8];
          break;
        case 13:
          v7 = (void *)MEMORY[0x263F66810];
LABEL_23:
          [(WBSettingsSyncEngineAccess *)self _updateStartPageSectionVisibilityWithIdentifier:*v7 record:v8];
          break;
        case 14:
          [(WBSettingsSyncEngineAccess *)self _updateStartPageCloudTabsConsent:v8];
          break;
        default:
          break;
      }
    }
  }
}

- (void)didDeleteRemoteRecordWithID:(id)a3
{
  id v6 = a3;
  if ([MEMORY[0x263F662A0] isStartPageSettingSyncEnabled])
  {
    id v3 = [v6 recordName];
    int v4 = [v3 isEqualToString:*MEMORY[0x263F66720]];

    if (v4)
    {
      v5 = dispatch_get_global_queue(17, 0);
      dispatch_async(v5, &__block_literal_global_0);
    }
  }
}

void __58__WBSettingsSyncEngineAccess_didDeleteRemoteRecordWithID___block_invoke()
{
  v0 = [MEMORY[0x263F08850] defaultManager];
  v1 = [MEMORY[0x263F08850] defaultManager];
  v2 = objc_msgSend(v1, "safari_startPageBackgroundImageFileURLForDefaultProfile");
  id v9 = 0;
  char v3 = [v0 removeItemAtURL:v2 error:&v9];
  id v4 = v9;

  if (v3)
  {
    v5 = WBS_LOG_CHANNEL_PREFIXCloudSettings();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __58__WBSettingsSyncEngineAccess_didDeleteRemoteRecordWithID___block_invoke_cold_1();
    }
    id v6 = objc_msgSend(MEMORY[0x263EFFA40], "safari_browserDefaults");
    [v6 removeObjectForKey:*MEMORY[0x263F666F0]];

    dispatch_async(MEMORY[0x263EF83A0], &__block_literal_global_6);
  }
  else
  {
    v7 = WBS_LOG_CHANNEL_PREFIXCloudSettings();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __58__WBSettingsSyncEngineAccess_didDeleteRemoteRecordWithID___block_invoke_cold_2((uint64_t)v4, v7, v8);
    }
  }
}

void __58__WBSettingsSyncEngineAccess_didDeleteRemoteRecordWithID___block_invoke_4()
{
  id v0 = [MEMORY[0x263F087C8] defaultCenter];
  [v0 postNotificationName:*MEMORY[0x263F66728] object:0 userInfo:0 deliverImmediately:1];
}

- (void)_updateStartPageBackgroundImageWithRecord:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"data"];
  id v6 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __72__WBSettingsSyncEngineAccess__updateStartPageBackgroundImageWithRecord___block_invoke;
  block[3] = &unk_2643D9C00;
  id v10 = v5;
  id v11 = v4;
  v12 = self;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, block);
}

void __72__WBSettingsSyncEngineAccess__updateStartPageBackgroundImageWithRecord___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F08850] defaultManager];
  char v3 = [*(id *)(a1 + 32) fileURL];
  id v4 = [v3 path];
  int v5 = [v2 isReadableFileAtPath:v4];

  if (v5)
  {
    id v6 = [MEMORY[0x263F08850] defaultManager];
    id v7 = objc_msgSend(v6, "safari_startPageBackgroundImageFileURLForDefaultProfile");
    [v2 removeItemAtURL:v7 error:0];

    id v8 = objc_msgSend(v2, "safari_startPageBackgroundImageFileURLForDefaultProfile");
    id v9 = [v8 URLByDeletingLastPathComponent];
    id v10 = (id)objc_msgSend(v2, "safari_ensureDirectoryExists:", v9);

    id v11 = [*(id *)(a1 + 32) fileURL];
    v12 = objc_msgSend(v2, "safari_startPageBackgroundImageFileURLForDefaultProfile");
    id v23 = 0;
    char v13 = [v2 copyItemAtURL:v11 toURL:v12 error:&v23];
    id v14 = v23;

    if ((v13 & 1) == 0)
    {
      v15 = (id)WBS_LOG_CHANNEL_PREFIXCloudSettings();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = objc_msgSend(v14, "safari_privacyPreservingDescription");
        __72__WBSettingsSyncEngineAccess__updateStartPageBackgroundImageWithRecord___block_invoke_cold_1(v16, (uint64_t)v24, v15);
      }
    }
    v17 = objc_msgSend(*(id *)(a1 + 40), "safari_encryptedValues");
    v18 = [v17 objectForKeyedSubscript:@"isLightAppearance"];

    v19 = objc_msgSend(MEMORY[0x263EFFA40], "safari_browserDefaults");
    if ([v18 BOOLValue]) {
      uint64_t v20 = 1;
    }
    else {
      uint64_t v20 = 2;
    }
    [v19 setInteger:v20 forKey:*MEMORY[0x263F666F0]];

    dispatch_async(MEMORY[0x263EF83A0], &__block_literal_global_16);
    v21 = *(void **)(a1 + 48);
    v22 = [*(id *)(a1 + 32) fileURL];
    [v21 _installMobileAssetIfApplicableWithURL:v22];
  }
}

void __72__WBSettingsSyncEngineAccess__updateStartPageBackgroundImageWithRecord___block_invoke_14()
{
  id v0 = [MEMORY[0x263F087C8] defaultCenter];
  [v0 postNotificationName:*MEMORY[0x263F66730] object:0 userInfo:0 deliverImmediately:1];
}

- (id)startPageSectionsManager
{
  lazyStartPageSectionsManager = self->_lazyStartPageSectionsManager;
  if (!lazyStartPageSectionsManager)
  {
    id v4 = (WBSStartPageSectionManager *)objc_alloc_init(MEMORY[0x263F66690]);
    int v5 = self->_lazyStartPageSectionsManager;
    self->_lazyStartPageSectionsManager = v4;

    lazyStartPageSectionsManager = self->_lazyStartPageSectionsManager;
  }
  return lazyStartPageSectionsManager;
}

- (void)_updateStartPageSectionVisibilityWithIdentifier:(id)a3 record:(id)a4
{
  id v10 = a3;
  id v6 = objc_msgSend(a4, "safari_encryptedValues");
  id v7 = [v6 objectForKeyedSubscript:*MEMORY[0x263F666D0]];

  if (v7)
  {
    if ([v10 isEqualToString:*MEMORY[0x263F66818]])
    {
      id v8 = objc_msgSend(MEMORY[0x263EFFA40], "safari_browserDefaults");
      uint64_t v9 = [v7 BOOLValue];
      [v8 setBool:v9 forKey:*MEMORY[0x263F667C8]];
    }
    else
    {
      id v8 = [(WBSettingsSyncEngineAccess *)self startPageSectionsManager];
      objc_msgSend(v8, "setSectionIdentifier:enabled:", v10, objc_msgSend(v7, "BOOLValue"));
    }
  }
}

- (void)_installMobileAssetIfApplicableWithURL:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  CFURLRef v4 = (const __CFURL *)a3;
  int v5 = CGImageSourceCreateWithURL(v4, 0);
  id v6 = v5;
  if (v5)
  {
    id v7 = CGImageSourceCopyMetadataAtIndex(v5, 0, 0);
    id v8 = v7;
    if (v7)
    {
      uint64_t v9 = CGImageMetadataCopyTagWithPath(v7, 0, @"safari:fileName");
      id v10 = v9;
      if (v9)
      {
        id v11 = (void *)CGImageMetadataTagCopyValue(v9);
        CFRelease(v10);
      }
      else
      {
        id v11 = 0;
      }
      CFRelease(v8);
    }
    else
    {
      id v11 = 0;
    }
    CFRelease(v6);
    if (v11)
    {
      v12 = [MEMORY[0x263F08850] defaultManager];
      char v13 = objc_msgSend(v12, "safari_startPageBackgroundImageMobileAssetFolderURL");
      id v14 = [v13 URLByAppendingPathComponent:v11];

      v15 = [MEMORY[0x263F08850] defaultManager];
      id v22 = 0;
      char v16 = [v15 copyItemAtURL:v4 toURL:v14 error:&v22];
      id v17 = v22;

      if ((v16 & 1) == 0)
      {
        v18 = (id)WBS_LOG_CHANNEL_PREFIXCloudSettings();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          v19 = objc_msgSend(v17, "safari_privacyPreservingDescription");
          [(WBSettingsSyncEngineAccess *)v19 _installMobileAssetIfApplicableWithURL:v18];
        }
      }
      uint64_t v20 = [MEMORY[0x263F08A00] defaultCenter];
      id v23 = @"FileName";
      v24 = v11;
      v21 = [NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
      [v20 postNotificationName:@"WBSBackgroundImageMobileAssetDidInstallBackgroundImage" object:self userInfo:v21];
    }
  }
}

- (void)_didUpdateStartPageBackgroundImageVisibilityWithRecord:(id)a3
{
  id v8 = a3;
  char v3 = objc_msgSend(MEMORY[0x263EFFA40], "safari_browserDefaults");
  CFURLRef v4 = objc_msgSend(v8, "safari_encryptedValues");
  int v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F666D0]];

  uint64_t v6 = *MEMORY[0x263F667B8];
  int v7 = objc_msgSend(v3, "safari_BOOLForKey:defaultValue:", *MEMORY[0x263F667B8], 1);
  if (v7 != [v5 BOOLValue]) {
    objc_msgSend(v3, "setBool:forKey:", objc_msgSend(v5, "BOOLValue"), v6);
  }
}

- (void)_didUpdateIOSDefaultBrowserWithRecord:(id)a3
{
  id v11 = a3;
  char v3 = objc_msgSend(v11, "safari_encryptedValues");
  CFURLRef v4 = [v3 objectForKeyedSubscript:*MEMORY[0x263F666D0]];

  if ([v4 intValue])
  {
    int v5 = [v11 recordID];
    uint64_t v6 = [v5 recordName];

    int v7 = objc_msgSend(MEMORY[0x263EFFA40], "safari_browserDefaults");
    id v8 = objc_msgSend(v7, "safari_numberForKey:", v6);
    int v9 = [v8 intValue];
    int v10 = [v4 intValue];

    if (v9 != v10) {
      objc_msgSend(v7, "setInteger:forKey:", (int)objc_msgSend(v4, "intValue"), v6);
    }
  }
}

- (id)_perSitePreferencesStore
{
  if (-[WBSettingsSyncEngineAccess _perSitePreferencesStore]::once != -1) {
    dispatch_once(&-[WBSettingsSyncEngineAccess _perSitePreferencesStore]::once, &__block_literal_global_27);
  }
  v2 = (void *)-[WBSettingsSyncEngineAccess _perSitePreferencesStore]::perSitePreferencesStore;
  return v2;
}

void __54__WBSettingsSyncEngineAccess__perSitePreferencesStore__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x263F66680]);
  id v3 = [MEMORY[0x263F66680] defaultDatabaseURL];
  uint64_t v1 = objc_msgSend(v0, "initWithDatabaseURL:");
  v2 = (void *)-[WBSettingsSyncEngineAccess _perSitePreferencesStore]::perSitePreferencesStore;
  -[WBSettingsSyncEngineAccess _perSitePreferencesStore]::perSitePreferencesStore = v1;
}

- (BOOL)_isKnownPerSiteSetting:(id)a3
{
  id v3 = a3;
  if (-[WBSettingsSyncEngineAccess _isKnownPerSiteSetting:]::once != -1) {
    dispatch_once(&-[WBSettingsSyncEngineAccess _isKnownPerSiteSetting:]::once, &__block_literal_global_30);
  }
  char v4 = [(id)-[WBSettingsSyncEngineAccess _isKnownPerSiteSetting:]::knownPerSiteSettings containsObject:v3];

  return v4;
}

void __53__WBSettingsSyncEngineAccess__isKnownPerSiteSetting___block_invoke()
{
  v6[5] = *MEMORY[0x263EF8340];
  id v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = *MEMORY[0x263F66718];
  v6[0] = *MEMORY[0x263F666F8];
  v6[1] = v1;
  uint64_t v2 = *MEMORY[0x263F66700];
  v6[2] = *MEMORY[0x263F66710];
  v6[3] = v2;
  v6[4] = *MEMORY[0x263F66708];
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:5];
  uint64_t v4 = [v0 setWithArray:v3];
  int v5 = (void *)-[WBSettingsSyncEngineAccess _isKnownPerSiteSetting:]::knownPerSiteSettings;
  -[WBSettingsSyncEngineAccess _isKnownPerSiteSetting:]::knownPerSiteSettings = v4;
}

- (void)_updatePerSiteSettingsWithRecord:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = WBS_LOG_CHANNEL_PREFIXCloudSettings();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[WBSettingsSyncEngineAccess _updatePerSiteSettingsWithRecord:]();
  }
  uint64_t v6 = objc_msgSend(v4, "safari_encryptedValues");
  int v7 = [v6 objectForKeyedSubscript:*MEMORY[0x263F666B0]];

  if (v7 && ![(WBSettingsSyncEngineAccess *)self _isKnownPerSiteSetting:v7])
  {
    v12 = WBS_LOG_CHANNEL_PREFIXCloudSettings();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v14 = 138543362;
      v15 = v7;
      _os_log_impl(&dword_21C043000, v12, OS_LOG_TYPE_INFO, "Received a %{public}@ Per-Site Setting from CloudKit that is unrecognized to this device.", (uint8_t *)&v14, 0xCu);
    }
  }
  else
  {
    if (([v7 isEqualToString:*MEMORY[0x263F66700]] & 1) == 0
      && ![v7 isEqualToString:*MEMORY[0x263F66710]])
    {
      goto LABEL_9;
    }
    id v8 = objc_msgSend(v4, "safari_encryptedValues");
    int v9 = [v8 objectForKeyedSubscript:*MEMORY[0x263F666A0]];

    int v10 = [(WBSettingsSyncEngineAccess *)self _deviceClass];
    char v11 = [v10 isEqualToString:v9];

    if (v11)
    {

LABEL_9:
      [(WBSettingsSyncEngineAccess *)self _attemptUpdatingSavingPerSiteSettingsWithRecord:v4];
      goto LABEL_15;
    }
    char v13 = WBS_LOG_CHANNEL_PREFIXCloudSettings();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v14 = 138543362;
      v15 = v7;
      _os_log_impl(&dword_21C043000, v13, OS_LOG_TYPE_INFO, "Received a %{public}@ Per-Site Setting from CloudKit that is not applicable to this device.", (uint8_t *)&v14, 0xCu);
    }
  }
LABEL_15:
}

- (void)_attemptUpdatingSavingPerSiteSettingsWithRecord:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __78__WBSettingsSyncEngineAccess__attemptUpdatingSavingPerSiteSettingsWithRecord___block_invoke;
  v6[3] = &unk_2643D9C78;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(WBSettingsSyncEngineAccess *)self _updatePerSiteSettingsWithRecord:v5 completionHandler:v6];
}

void __78__WBSettingsSyncEngineAccess__attemptUpdatingSavingPerSiteSettingsWithRecord___block_invoke(uint64_t a1, int a2)
{
  id v4 = WBS_LOG_CHANNEL_PREFIXCloudSettings();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (a2)
  {
    if (v5) {
      __78__WBSettingsSyncEngineAccess__attemptUpdatingSavingPerSiteSettingsWithRecord___block_invoke_cold_1();
    }
    uint64_t v6 = [MEMORY[0x263F087C8] defaultCenter];
    [v6 postNotificationName:*MEMORY[0x263F66738] object:0];

    id v7 = [*(id *)(a1 + 32) _perSitePreferencesStore];
    id v8 = *(void **)(a1 + 40);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __78__WBSettingsSyncEngineAccess__attemptUpdatingSavingPerSiteSettingsWithRecord___block_invoke_33;
    v16[3] = &unk_2643D9C28;
    id v17 = v8;
    [v7 savePerSiteSettingCloudKitRecordToDisk:v17 completionHandler:v16];

    int v9 = v17;
  }
  else
  {
    if (v5) {
      __78__WBSettingsSyncEngineAccess__attemptUpdatingSavingPerSiteSettingsWithRecord___block_invoke_cold_3();
    }
    int v10 = WBS_LOG_CHANNEL_PREFIXCloudSettings();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __78__WBSettingsSyncEngineAccess__attemptUpdatingSavingPerSiteSettingsWithRecord___block_invoke_cold_2();
    }
    char v11 = (void *)MEMORY[0x263EFFA20];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __78__WBSettingsSyncEngineAccess__attemptUpdatingSavingPerSiteSettingsWithRecord___block_invoke_36;
    v14[3] = &unk_2643D9C50;
    v12 = *(void **)(a1 + 40);
    v14[4] = *(void *)(a1 + 32);
    id v15 = v12;
    id v13 = (id)[v11 scheduledTimerWithTimeInterval:0 repeats:v14 block:30.0];
    int v9 = v15;
  }
}

void __78__WBSettingsSyncEngineAccess__attemptUpdatingSavingPerSiteSettingsWithRecord___block_invoke_33(uint64_t a1, int a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = (id)WBS_LOG_CHANNEL_PREFIXCloudSettings();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    BOOL v5 = [*(id *)(a1 + 32) recordID];
    uint64_t v6 = [v5 recordName];
    id v7 = @"NO";
    if (a2) {
      id v7 = @"YES";
    }
    id v8 = v7;
    int v9 = 138543618;
    int v10 = v6;
    __int16 v11 = 2114;
    v12 = v8;
    _os_log_impl(&dword_21C043000, v4, OS_LOG_TYPE_INFO, "Save with record name %{public}@ in WBSPerSitePreferencesSQLiteStore did finish with success: %{public}@", (uint8_t *)&v9, 0x16u);
  }
}

uint64_t __78__WBSettingsSyncEngineAccess__attemptUpdatingSavingPerSiteSettingsWithRecord___block_invoke_36(uint64_t a1)
{
  return [*(id *)(a1 + 32) _attemptUpdatingSavingPerSiteSettingsWithRecord:*(void *)(a1 + 40)];
}

- (id)_deviceClass
{
  uint64_t v2 = [MEMORY[0x263F66290] currentDevice];
  int v3 = [v2 deviceClass];

  id v4 = @"UndefinedDeviceClass";
  if (v3 == 3) {
    id v4 = @"iPad";
  }
  if (v3 == 1) {
    return @"iPhone";
  }
  else {
    return v4;
  }
}

- (void)_updatePerSiteSettingsWithRecord:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_msgSend(v6, "safari_encryptedValues");
  int v9 = [v8 objectForKeyedSubscript:*MEMORY[0x263F666C0]];

  int v10 = objc_msgSend(v6, "safari_encryptedValues");
  __int16 v11 = [v10 objectForKeyedSubscript:*MEMORY[0x263F666B0]];

  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __81__WBSettingsSyncEngineAccess__updatePerSiteSettingsWithRecord_completionHandler___block_invoke;
  v21[3] = &unk_2643D9CA0;
  id v12 = v7;
  id v22 = v12;
  uint64_t v13 = (void *)MEMORY[0x21D4A1230](v21);
  int v14 = [v6 objectForKeyedSubscript:*MEMORY[0x263F666B8]];

  if (v14)
  {
    id v15 = [(WBSettingsSyncEngineAccess *)self _perSitePreferencesStore];
    uint64_t v16 = [v6 recordID];
    id v17 = [v16 recordName];
    [v15 removePreferenceValueWithRecordName:v17 completionHandler:v13];
  }
  else
  {
    v18 = objc_msgSend(v6, "safari_encryptedValues");
    uint64_t v19 = *MEMORY[0x263F666A8];
    uint64_t v20 = [v18 objectForKeyedSubscript:*MEMORY[0x263F666A8]];

    if (!v20)
    {
      id v15 = [(WBSettingsSyncEngineAccess *)self _perSitePreferencesStore];
      [v15 setDefaultValue:v9 forPreference:v11 completionHandler:v13];
      goto LABEL_6;
    }
    id v15 = [(WBSettingsSyncEngineAccess *)self _perSitePreferencesStore];
    uint64_t v16 = objc_msgSend(v6, "safari_encryptedValues");
    id v17 = [v16 objectForKeyedSubscript:v19];
    [v15 setValue:v9 ofPreference:v11 forDomain:v17 withTimestamp:0 completionHandler:v13];
  }

LABEL_6:
}

uint64_t __81__WBSettingsSyncEngineAccess__updatePerSiteSettingsWithRecord_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_updateStartPageSectionOrder:(id)a3
{
  id v23 = a3;
  id v4 = objc_msgSend(v23, "safari_encryptedValues");
  BOOL v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F666D0]];
  id v6 = (void *)[v5 mutableCopy];

  id v22 = [MEMORY[0x263F66690] allSections];
  id v7 = [MEMORY[0x263EFF980] array];
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __59__WBSettingsSyncEngineAccess__updateStartPageSectionOrder___block_invoke;
  v30[3] = &unk_2643D9CC8;
  id v8 = v22;
  id v31 = v8;
  id v9 = v7;
  id v32 = v9;
  [v6 enumerateObjectsUsingBlock:v30];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __59__WBSettingsSyncEngineAccess__updateStartPageSectionOrder___block_invoke_2;
  v27[3] = &unk_2643D9CC8;
  id v10 = v9;
  id v28 = v10;
  id v11 = v6;
  id v29 = v11;
  [v8 enumerateObjectsUsingBlock:v27];
  id v12 = objc_msgSend(MEMORY[0x263EFFA40], "safari_browserDefaults");
  uint64_t v13 = (void *)[v11 copy];
  [v12 setObject:v13 forKey:*MEMORY[0x263F66410]];

  if (v10)
  {
    int v14 = (void *)MEMORY[0x263EFFA08];
    id v15 = [(WBSettingsSyncEngineAccess *)self startPageSectionsManager];
    uint64_t v16 = [v15 enabledSectionIdentifiers];
    id v17 = [v14 setWithArray:v16];

    v18 = [MEMORY[0x263F089C8] indexSet];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __59__WBSettingsSyncEngineAccess__updateStartPageSectionOrder___block_invoke_3;
    v24[3] = &unk_2643D9CC8;
    id v19 = v17;
    id v25 = v19;
    id v20 = v18;
    id v26 = v20;
    [v10 enumerateObjectsUsingBlock:v24];
    v21 = [(WBSettingsSyncEngineAccess *)self startPageSectionsManager];
    [v21 setSectionsIdentifiers:v10 enabledIndexes:v20];
  }
}

void __59__WBSettingsSyncEngineAccess__updateStartPageSectionOrder___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:")) {
    [*(id *)(a1 + 40) addObject:v3];
  }
}

void __59__WBSettingsSyncEngineAccess__updateStartPageSectionOrder___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0)
  {
    [*(id *)(a1 + 32) addObject:v3];
    [*(id *)(a1 + 40) addObject:v3];
  }
}

void __59__WBSettingsSyncEngineAccess__updateStartPageSectionOrder___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:")) {
    [*(id *)(a1 + 40) addIndex:a3];
  }
}

- (id)_startPageSectionOrder
{
  id v3 = objc_msgSend(MEMORY[0x263EFFA40], "safari_browserDefaults");
  uint64_t v4 = *MEMORY[0x263F66410];
  id v5 = [v3 arrayForKey:*MEMORY[0x263F66410]];

  if (v5)
  {
    id v6 = [v3 arrayForKey:v4];
  }
  else
  {
    id v7 = [(WBSettingsSyncEngineAccess *)self startPageSectionsManager];
    id v6 = [v7 sectionIdentifiers];
  }
  return v6;
}

- (void)_updateStartPageCloudTabsConsent:(id)a3
{
  id v3 = a3;
  uint64_t v4 = WBS_LOG_CHANNEL_PREFIXCloudSettings();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[WBSettingsSyncEngineAccess _updateStartPageCloudTabsConsent:]();
  }
  id v5 = objc_msgSend(v3, "safari_encryptedValues");
  id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x263F666D0]];

  id v7 = objc_msgSend(MEMORY[0x263EFFA40], "safari_browserDefaults");
  uint64_t v8 = [v6 BOOLValue];
  [v7 setBool:v8 forKey:*MEMORY[0x263F666D8]];

  id v9 = [MEMORY[0x263F087C8] defaultCenter];
  [v9 postNotificationName:*MEMORY[0x263F66740] object:0 userInfo:0 deliverImmediately:1];
}

- (NSArray)syncSettingsUpDictionary
{
  v53[15] = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = [(WBSettingsSyncEngineAccess *)self startPageSectionsManager];
  id v5 = [v4 enabledSectionIdentifiers];
  v52 = [v3 setWithArray:v5];

  id v6 = NSNumber;
  id v7 = objc_msgSend(MEMORY[0x263EFFA40], "safari_browserDefaults");
  uint64_t v8 = (NSString *)*MEMORY[0x263F666E0];
  v51 = v7;
  objc_msgSend(v6, "numberWithInteger:", objc_msgSend(v7, "integerForKey:", *MEMORY[0x263F666E0]));
  v48 = (objc_object *)objc_claimAutoreleasedReturnValue();
  v49 = makeSettingDictionary(v8, v48);
  v53[0] = v49;
  id v9 = NSNumber;
  id v10 = objc_msgSend(MEMORY[0x263EFFA40], "safari_browserDefaults");
  id v11 = (NSString *)*MEMORY[0x263F666E8];
  v50 = v10;
  objc_msgSend(v9, "numberWithInteger:", objc_msgSend(v10, "integerForKey:", *MEMORY[0x263F666E8]));
  v46 = (objc_object *)objc_claimAutoreleasedReturnValue();
  v47 = makeSettingDictionary(v11, v46);
  v53[1] = v47;
  objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v52, "containsObject:", *MEMORY[0x263F667D8]));
  v44 = (objc_object *)objc_claimAutoreleasedReturnValue();
  v45 = makeSettingDictionary((NSString *)*MEMORY[0x263F66760], v44);
  v53[2] = v45;
  objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v52, "containsObject:", *MEMORY[0x263F667E0]));
  v42 = (objc_object *)objc_claimAutoreleasedReturnValue();
  v43 = makeSettingDictionary((NSString *)*MEMORY[0x263F66768], v42);
  v53[3] = v43;
  objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v52, "containsObject:", *MEMORY[0x263F667F0]));
  v40 = (objc_object *)objc_claimAutoreleasedReturnValue();
  v41 = makeSettingDictionary((NSString *)*MEMORY[0x263F66778], v40);
  v53[4] = v41;
  objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v52, "containsObject:", *MEMORY[0x263F66808]));
  v38 = (objc_object *)objc_claimAutoreleasedReturnValue();
  v39 = makeSettingDictionary((NSString *)*MEMORY[0x263F66798], v38);
  v53[5] = v39;
  objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v52, "containsObject:", *MEMORY[0x263F667D0]));
  v36 = (objc_object *)objc_claimAutoreleasedReturnValue();
  v37 = makeSettingDictionary((NSString *)*MEMORY[0x263F66758], v36);
  v53[6] = v37;
  objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v52, "containsObject:", *MEMORY[0x263F667F8]));
  v34 = (objc_object *)objc_claimAutoreleasedReturnValue();
  v35 = makeSettingDictionary((NSString *)*MEMORY[0x263F66780], v34);
  v53[7] = v35;
  objc_msgSend(NSNumber, "numberWithBool:", -[WBSettingsSyncEngineAccess _isShowBackgroundImageEnabled](self, "_isShowBackgroundImageEnabled"));
  id v32 = (objc_object *)objc_claimAutoreleasedReturnValue();
  v33 = makeSettingDictionary((NSString *)*MEMORY[0x263F66750], v32);
  v53[8] = v33;
  objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v52, "containsObject:", *MEMORY[0x263F667E8]));
  v30 = (objc_object *)objc_claimAutoreleasedReturnValue();
  id v31 = makeSettingDictionary((NSString *)*MEMORY[0x263F66770], v30);
  v53[9] = v31;
  objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v52, "containsObject:", *MEMORY[0x263F66810]));
  v27 = (objc_object *)objc_claimAutoreleasedReturnValue();
  id v28 = makeSettingDictionary((NSString *)*MEMORY[0x263F667A0], v27);
  v53[10] = v28;
  id v12 = NSNumber;
  id v29 = objc_msgSend(MEMORY[0x263EFFA40], "safari_browserDefaults");
  objc_msgSend(v12, "numberWithBool:", objc_msgSend(v29, "BOOLForKey:", *MEMORY[0x263F666D8]));
  uint64_t v13 = (objc_object *)objc_claimAutoreleasedReturnValue();
  int v14 = makeSettingDictionary((NSString *)*MEMORY[0x263F66748], v13);
  v53[11] = v14;
  id v15 = [(WBSettingsSyncEngineAccess *)self _startPageSectionOrder];
  uint64_t v16 = makeSettingDictionary((NSString *)*MEMORY[0x263F66790], v15);
  v53[12] = v16;
  id v17 = NSNumber;
  v18 = objc_msgSend(MEMORY[0x263EFFA40], "safari_browserDefaults");
  objc_msgSend(v17, "numberWithBool:", objc_msgSend(v18, "BOOLForKey:", *MEMORY[0x263F667C8]));
  id v19 = (objc_object *)objc_claimAutoreleasedReturnValue();
  id v20 = makeSettingDictionary((NSString *)*MEMORY[0x263F667A8], v19);
  v53[13] = v20;
  v21 = NSNumber;
  id v22 = objc_msgSend(MEMORY[0x263EFFA40], "safari_browserDefaults");
  objc_msgSend(v21, "numberWithBool:", objc_msgSend(v22, "BOOLForKey:", *MEMORY[0x263F667C0]));
  id v23 = (objc_object *)objc_claimAutoreleasedReturnValue();
  v24 = makeSettingDictionary((NSString *)*MEMORY[0x263F66788], v23);
  v53[14] = v24;
  id v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v53 count:15];

  return (NSArray *)v26;
}

- (BOOL)backgroundImageExists
{
  uint64_t v2 = objc_msgSend(MEMORY[0x263EFFA40], "safari_browserDefaults");
  BOOL v3 = [v2 integerForKey:*MEMORY[0x263F666F0]] != 0;

  return v3;
}

- (BOOL)backgroundImageAppearanceIsLight
{
  uint64_t v2 = objc_msgSend(MEMORY[0x263EFFA40], "safari_browserDefaults");
  uint64_t v3 = [v2 integerForKey:*MEMORY[0x263F666F0]];

  return v3 == 1;
}

- (BOOL)_isShowBackgroundImageEnabled
{
  uint64_t v2 = objc_msgSend(MEMORY[0x263EFFA40], "safari_browserDefaults");
  uint64_t v3 = [v2 objectForKey:*MEMORY[0x263F667B8]];

  if (v3 && (objc_opt_respondsToSelector() & 1) != 0) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (void)deleteBackgroundImageDirectory
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_21C043000, v0, v1, "Attempting to remove Safari's background image directory.", v2, v3, v4, v5, v6);
}

void __60__WBSettingsSyncEngineAccess_deleteBackgroundImageDirectory__block_invoke()
{
  id v0 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v1 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v2 = objc_msgSend(v1, "safari_startPageBackgroundImageFolderURL");
  id v9 = 0;
  char v3 = [v0 removeItemAtURL:v2 error:&v9];
  id v4 = v9;

  if (v3)
  {
    uint64_t v5 = WBS_LOG_CHANNEL_PREFIXCloudSettings();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __60__WBSettingsSyncEngineAccess_deleteBackgroundImageDirectory__block_invoke_cold_1();
    }
    uint8_t v6 = objc_msgSend(MEMORY[0x263EFFA40], "safari_browserDefaults");
    [v6 removeObjectForKey:*MEMORY[0x263F666F0]];

    dispatch_async(MEMORY[0x263EF83A0], &__block_literal_global_56);
  }
  else
  {
    id v7 = WBS_LOG_CHANNEL_PREFIXCloudSettings();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __60__WBSettingsSyncEngineAccess_deleteBackgroundImageDirectory__block_invoke_cold_2((uint64_t)v4, v7, v8);
    }
  }
}

void __60__WBSettingsSyncEngineAccess_deleteBackgroundImageDirectory__block_invoke_54()
{
  id v0 = [MEMORY[0x263F087C8] defaultCenter];
  [v0 postNotificationName:*MEMORY[0x263F66728] object:0 userInfo:0 deliverImmediately:1];
}

- (void).cxx_destruct
{
}

void __58__WBSettingsSyncEngineAccess_didDeleteRemoteRecordWithID___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_21C043000, v0, v1, "Removing Safari's background image was successful.", v2, v3, v4, v5, v6);
}

void __58__WBSettingsSyncEngineAccess_didDeleteRemoteRecordWithID___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 138412290;
  uint64_t v4 = a1;
  OUTLINED_FUNCTION_2_0(&dword_21C043000, a2, a3, "Removing Safari's background image failed with error: %@.", (uint8_t *)&v3);
}

void __72__WBSettingsSyncEngineAccess__updateStartPageBackgroundImageWithRecord___block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_2_0(&dword_21C043000, a3, (uint64_t)a3, "Failed to copy the background image over. Error: %{public}@", (uint8_t *)a2);
}

- (void)_installMobileAssetIfApplicableWithURL:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_2_0(&dword_21C043000, a3, (uint64_t)a3, "Failed to copy the mobile asset background image over. Error: %{public}@", (uint8_t *)a2);
}

- (void)_updatePerSiteSettingsWithRecord:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_21C043000, v0, v1, "Received a Per-Site Settings push notification from CloudKit.", v2, v3, v4, v5, v6);
}

void __78__WBSettingsSyncEngineAccess__attemptUpdatingSavingPerSiteSettingsWithRecord___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_21C043000, v0, v1, "Successfully updated WBSPerSitePreferencesSQLiteStore in response to a push notification from CloudKit.", v2, v3, v4, v5, v6);
}

void __78__WBSettingsSyncEngineAccess__attemptUpdatingSavingPerSiteSettingsWithRecord___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_21C043000, v0, OS_LOG_TYPE_ERROR, "Will retry operation in 30 seconds due to a failure to update WBSPerSitePreferencesSQLiteStore.", v1, 2u);
}

void __78__WBSettingsSyncEngineAccess__attemptUpdatingSavingPerSiteSettingsWithRecord___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_21C043000, v0, v1, "Failed to update WBSPerSitePreferencesSQLiteStore after a push notification from CloudKit.", v2, v3, v4, v5, v6);
}

- (void)_updateStartPageCloudTabsConsent:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_21C043000, v0, v1, "Updating start page cloud tabs consent", v2, v3, v4, v5, v6);
}

void __60__WBSettingsSyncEngineAccess_deleteBackgroundImageDirectory__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_21C043000, v0, v1, "Removing Safari's background image directory was successful.", v2, v3, v4, v5, v6);
}

void __60__WBSettingsSyncEngineAccess_deleteBackgroundImageDirectory__block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 138412290;
  uint64_t v4 = a1;
  OUTLINED_FUNCTION_2_0(&dword_21C043000, a2, a3, "Removing Safari's background image directory failed with error: %@.", (uint8_t *)&v3);
}

@end