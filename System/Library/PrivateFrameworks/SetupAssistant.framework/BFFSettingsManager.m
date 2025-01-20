@interface BFFSettingsManager
+ (BOOL)hasStashedValuesOnDisk;
+ (BOOL)removeSafeHaven;
+ (id)loadConfigurationFromDisk;
+ (id)stashBuildVersion;
+ (id)stashProductVersion;
+ (int64_t)stashConfigurationType;
+ (unint64_t)stashVersion;
+ (void)loadConfigurationFromDisk;
+ (void)postDidRestoreSafeHavenNotification;
- (BFFSettingsManager)init;
- (BFFSettingsManager)initWithManagedConfiguration:(id)a3 flowSkipController:(id)a4;
- (BOOL)_commitStash;
- (BOOL)_stashConfiguration:(BOOL)a3;
- (BOOL)_stashPaths;
- (BOOL)hasAssistantVoiceTriggerEnabledValue;
- (BOOL)hasStashedValues;
- (BOOL)hasStashedValuesOnDisk;
- (BOOL)hideStashInSafeHaven;
- (BOOL)hideStashInSafeHavenAsProvisional:(BOOL)a3;
- (id)_currentActionButtonData;
- (id)_preferencesForDomain:(id)a3;
- (id)_shovePath:(id)a3 toPath:(id)a4;
- (id)watchData;
- (unint64_t)_restoreConfiguration;
- (void)_applyAssistantPreferences;
- (void)_applyLocationServices;
- (void)_applyLocationServicesSettings;
- (void)_applyScreenTimePreferences;
- (void)_applySeedEnrollmentData;
- (void)_applyStashedFlowSkipIdentifiers;
- (void)_applyStashedManagedConfiguration;
- (void)_applyStashedPreferences;
- (void)_applyUpdatePreferences;
- (void)_applyUserInterfaceStyleMode;
- (void)_applyWebContentFilteringPreferences;
- (void)_reset:(BOOL)a3;
- (void)_restoreAccessibilityData;
- (void)_restoreActionButtonData;
- (void)_restoreAnalyticsData;
- (void)_restoreStashedFiles;
- (void)_restoreWatchData;
- (void)_setCurrentActionButtonData:(id)a3;
- (void)applySafeHavenStash;
- (void)populatePathsToStash;
- (void)removeBoolSettingForManagedConfigurationSetting:(id)a3;
- (void)reset;
- (void)setAssistantEnabled:(BOOL)a3;
- (void)setAssistantOutputVoice:(id)a3 languageCode:(id)a4;
- (void)setAssistantVoiceTriggerEnabled:(BOOL)a3;
- (void)setAutoDownloadEnabled:(BOOL)a3;
- (void)setAutoUpdateEnabled:(BOOL)a3;
- (void)setBool:(BOOL)a3 forDomain:(id)a4 key:(id)a5;
- (void)setBool:(BOOL)a3 forManagedConfigurationSetting:(id)a4;
- (void)setObject:(id)a3 forDomain:(id)a4 key:(id)a5;
- (void)setScreenTimeEnabled:(BOOL)a3;
- (void)setSeedEnrollmentProgramName:(id)a3 assetAudience:(id)a4 programID:(id)a5;
- (void)setUserInterfaceStyleMode:(int64_t)a3;
- (void)setWebContentFilteringEnabled:(BOOL)a3;
- (void)stashAccessibilityData:(id)a3;
- (void)stashActionButtonData:(id)a3;
- (void)stashAnalyticEvent:(id)a3 payload:(id)a4;
- (void)stashCurrentActionButtonData;
- (void)stashFlowSkipIdentifiers:(id)a3;
- (void)stashLocationServicesChoice:(BOOL)a3;
- (void)stashLocationServicesSettings:(id)a3;
- (void)stashPath:(id)a3;
- (void)stashWatchData:(id)a3;
@end

@implementation BFFSettingsManager

- (BFFSettingsManager)init
{
  v3 = objc_alloc_init(BYFlowSkipController);
  v4 = [MEMORY[0x1E4F74230] sharedConnection];
  v5 = [(BFFSettingsManager *)self initWithManagedConfiguration:v4 flowSkipController:v3];

  return v5;
}

- (BFFSettingsManager)initWithManagedConfiguration:(id)a3 flowSkipController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BFFSettingsManager;
  v9 = [(BFFSettingsManager *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_managedConfiguration, a3);
    objc_storeStrong((id *)&v10->_flowSkipController, a4);
    [(BFFSettingsManager *)v10 _reset:1];
  }

  return v10;
}

- (BOOL)hasStashedValues
{
  return [(NSMutableArray *)self->_stashedPaths count]
      || [(NSMutableDictionary *)self->_stashedPreferences count]
      || [(NSMutableDictionary *)self->_stashedManagedConfigurationSettings count]
      || self->_stashedAssistantEnabled
      || self->_stashedWatchData
      || [(NSArray *)self->_stashedFlowSkipIdentifiers count]
      || self->_stashedScreenTimeEnabled
      || self->_stashedAutoUpdateEnabled
      || self->_stashedAutoDownloadEnabled
      || self->_stashedAccessibilityData
      || self->_stashedLocationServicesEnabled
      || self->_stashedLocationServicesSettings
      || self->_stashedUserInterfaceStyleMode
      || self->_stashedSiriDataSharingOptInStatus
      || self->_stashedSeedEnrollmentProgramName
      || self->_stashedSeedEnrollmentAssetAudience
      || [(NSMutableArray *)self->_stashedAnalytics count]
      || self->_stashedSiriOutputVoice && [(NSString *)self->_stashedSiriLanguage length]
      || self->_stashedActionButtonData != 0;
}

- (BOOL)hasStashedValuesOnDisk
{
  v2 = objc_opt_class();
  return [v2 hasStashedValuesOnDisk];
}

+ (BOOL)hasStashedValuesOnDisk
{
  v2 = +[BFFSettingsManager loadConfigurationFromDisk];
  v3 = v2;
  if (v2)
  {
    v4 = [v2 objectForKeyedSubscript:@"type"];

    if (v4)
    {
      v5 = [v3 objectForKeyedSubscript:@"type"];
      uint64_t v6 = [v5 integerValue];

      BOOL v7 = v6 == 2;
    }
    else
    {
      BOOL v7 = 1;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

+ (id)loadConfigurationFromDisk
{
  v2 = (void *)MEMORY[0x1E4F1C9E8];
  v3 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/private/var/buddy/Configuration.plist"];
  id v10 = 0;
  v4 = [v2 dictionaryWithContentsOfURL:v3 error:&v10];
  id v5 = v10;

  if (v5)
  {
    uint64_t v6 = [v5 domain];
    if (([v6 isEqualToString:*MEMORY[0x1E4F281F8]] & 1) == 0)
    {
      uint64_t v7 = [v5 code];

      if (v7 == 260)
      {
LABEL_7:
        id v8 = 0;
        goto LABEL_9;
      }
      uint64_t v6 = _BYLoggingFacility();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        +[BFFSettingsManager loadConfigurationFromDisk](v5);
      }
    }

    goto LABEL_7;
  }
  id v8 = v4;
LABEL_9:

  return v8;
}

+ (unint64_t)stashVersion
{
  v2 = [a1 loadConfigurationFromDisk];
  v3 = [v2 objectForKeyedSubscript:@"version"];
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

+ (id)stashBuildVersion
{
  v2 = [a1 loadConfigurationFromDisk];
  v3 = [v2 objectForKeyedSubscript:@"buildVersion"];

  return v3;
}

+ (id)stashProductVersion
{
  v2 = [a1 loadConfigurationFromDisk];
  v3 = [v2 objectForKeyedSubscript:@"productVersion"];

  return v3;
}

+ (int64_t)stashConfigurationType
{
  v2 = [a1 loadConfigurationFromDisk];
  v3 = v2;
  if (v2)
  {
    unint64_t v4 = [v2 objectForKeyedSubscript:@"type"];

    if (v4)
    {
      id v5 = [v3 objectForKeyedSubscript:@"type"];
      int64_t v6 = [v5 integerValue];
    }
    else
    {
      int64_t v6 = 2;
    }
  }
  else
  {
    int64_t v6 = 0;
  }

  return v6;
}

- (void)setBool:(BOOL)a3 forManagedConfigurationSetting:(id)a4
{
  BOOL v4 = a3;
  managedConfiguration = self->_managedConfiguration;
  id v7 = a4;
  [(MCProfileConnection *)managedConfiguration setBoolValue:v4 forSetting:v7];
  id v8 = [NSNumber numberWithBool:v4];
  [(NSMutableDictionary *)self->_stashedManagedConfigurationSettings setObject:v8 forKeyedSubscript:v7];
}

- (void)removeBoolSettingForManagedConfigurationSetting:(id)a3
{
  managedConfiguration = self->_managedConfiguration;
  id v5 = a3;
  [(MCProfileConnection *)managedConfiguration removeBoolSetting:v5];
  [(NSMutableDictionary *)self->_stashedManagedConfigurationSettings removeObjectForKey:v5];
}

- (void)setBool:(BOOL)a3 forDomain:(id)a4 key:(id)a5
{
  BOOL v6 = a3;
  id v8 = NSNumber;
  id v9 = a5;
  id v10 = a4;
  id v11 = [v8 numberWithBool:v6];
  [(BFFSettingsManager *)self setObject:v11 forDomain:v10 key:v9];
}

- (void)setObject:(id)a3 forDomain:(id)a4 key:(id)a5
{
  id v8 = (__CFString *)a5;
  id v9 = (__CFString *)a4;
  id v10 = a3;
  CFPreferencesSetAppValue(v8, v10, v9);
  CFPreferencesAppSynchronize(v9);
  id v11 = [(BFFSettingsManager *)self _preferencesForDomain:v9];

  [v11 setObject:v10 forKey:v8];
}

- (void)populatePathsToStash
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A7DED000, a2, OS_LOG_TYPE_ERROR, "Failed to read Wallet preferences: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)stashPath:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = _BYLoggingFacility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl(&dword_1A7DED000, v5, OS_LOG_TYPE_DEFAULT, "Adding %@ to the list of paths to stash...", (uint8_t *)&v6, 0xCu);
    }

    [(NSMutableArray *)self->_stashedPaths addObject:v4];
  }
}

- (void)stashLocationServicesChoice:(BOOL)a3
{
  self->_stashedLocationServicesEnabled = [NSNumber numberWithBool:a3];
  MEMORY[0x1F41817F8]();
}

- (void)stashLocationServicesSettings:(id)a3
{
}

- (void)stashWatchData:(id)a3
{
}

- (id)watchData
{
  return self->_stashedWatchData;
}

- (void)setAssistantEnabled:(BOOL)a3
{
  self->_stashedAssistantEnabled = [NSNumber numberWithBool:a3];
  MEMORY[0x1F41817F8]();
}

- (void)setAssistantVoiceTriggerEnabled:(BOOL)a3
{
  self->_stashedAssistantVoiceTriggerEnabled = [NSNumber numberWithBool:a3];
  MEMORY[0x1F41817F8]();
}

- (BOOL)hasAssistantVoiceTriggerEnabledValue
{
  return self->_stashedAssistantVoiceTriggerEnabled != 0;
}

- (void)setAssistantOutputVoice:(id)a3 languageCode:(id)a4
{
  int v6 = (NSData *)a3;
  id v7 = (NSString *)a4;
  stashedSiriOutputVoice = self->_stashedSiriOutputVoice;
  self->_stashedSiriOutputVoice = v6;
  id v10 = v6;

  stashedSiriLanguage = self->_stashedSiriLanguage;
  self->_stashedSiriLanguage = v7;
}

- (void)stashFlowSkipIdentifiers:(id)a3
{
}

- (void)setScreenTimeEnabled:(BOOL)a3
{
  self->_stashedScreenTimeEnabled = [NSNumber numberWithBool:a3];
  MEMORY[0x1F41817F8]();
}

- (void)setWebContentFilteringEnabled:(BOOL)a3
{
  self->_stashedWebContentFilteringEnabled = [NSNumber numberWithBool:a3];
  MEMORY[0x1F41817F8]();
}

- (void)setAutoUpdateEnabled:(BOOL)a3
{
  self->_stashedAutoUpdateEnabled = [NSNumber numberWithBool:a3];
  MEMORY[0x1F41817F8]();
}

- (void)setAutoDownloadEnabled:(BOOL)a3
{
  self->_stashedAutoDownloadEnabled = [NSNumber numberWithBool:a3];
  MEMORY[0x1F41817F8]();
}

- (void)stashAccessibilityData:(id)a3
{
}

- (void)setUserInterfaceStyleMode:(int64_t)a3
{
  self->_stashedUserInterfaceStyleMode = [NSNumber numberWithInteger:a3];
  MEMORY[0x1F41817F8]();
}

- (void)setSeedEnrollmentProgramName:(id)a3 assetAudience:(id)a4 programID:(id)a5
{
  uint64_t v8 = (NSString *)a3;
  id v9 = (NSString *)a4;
  id v10 = (NSString *)a5;
  stashedSeedEnrollmentProgramName = self->_stashedSeedEnrollmentProgramName;
  self->_stashedSeedEnrollmentProgramName = v8;
  v15 = v8;

  stashedSeedEnrollmentAssetAudience = self->_stashedSeedEnrollmentAssetAudience;
  self->_stashedSeedEnrollmentAssetAudience = v9;
  v13 = v9;

  stashedSeedEnrollmentProgramID = self->_stashedSeedEnrollmentProgramID;
  self->_stashedSeedEnrollmentProgramID = v10;
}

- (void)stashCurrentActionButtonData
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A7DED000, log, OS_LOG_TYPE_ERROR, "Stashed unexpectedly nil Action Button data", v1, 2u);
}

- (void)stashActionButtonData:(id)a3
{
}

- (void)stashAnalyticEvent:(id)a3 payload:(id)a4
{
  v11[2] = *MEMORY[0x1E4F143B8];
  stashedAnalytics = self->_stashedAnalytics;
  v10[0] = @"event";
  v10[1] = @"payload";
  v11[0] = a3;
  v11[1] = a4;
  int v6 = (void *)MEMORY[0x1E4F1C9E8];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 dictionaryWithObjects:v11 forKeys:v10 count:2];
  [(NSMutableArray *)stashedAnalytics addObject:v9];
}

- (BOOL)hideStashInSafeHaven
{
  return [(BFFSettingsManager *)self hideStashInSafeHavenAsProvisional:0];
}

- (BOOL)hideStashInSafeHavenAsProvisional:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    [(BFFSettingsManager *)self populatePathsToStash];
  }
  id v5 = objc_alloc_init((Class)getAFSettingsConnectionClass());
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  uint64_t v23 = MEMORY[0x1E4F143A8];
  uint64_t v24 = 3221225472;
  v25 = __56__BFFSettingsManager_hideStashInSafeHavenAsProvisional___block_invoke;
  v26 = &unk_1E5D2C960;
  v27 = self;
  id v7 = v6;
  v28 = v7;
  [v5 getSiriDataSharingOptInStatusWithCompletion:&v23];
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  if ([(BFFSettingsManager *)self hasStashedValues] || !v3)
  {
    id v11 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v12 = [v11 fileExistsAtPath:@"/private/var/buddy/"];

    if (v12)
    {
      uint64_t v13 = [(id)objc_opt_class() stashConfigurationType];
      if (v13 == 1)
      {
        v14 = _BYLoggingFacility();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A7DED000, v14, OS_LOG_TYPE_DEFAULT, "Committing existing provisional stash on disk...", buf, 2u);
        }

        goto LABEL_22;
      }
      char v16 = [(id)objc_opt_class() removeSafeHaven];
      id v8 = _BYLoggingFacility();
      BOOL v17 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
      if (v16)
      {
        if (v17)
        {
          v18 = @"committed";
          if (v3) {
            v18 = @"provisional";
          }
          *(_DWORD *)buf = 138543362;
          v30 = v18;
          _os_log_impl(&dword_1A7DED000, v8, OS_LOG_TYPE_DEFAULT, "Starting %{public}@ stash...", buf, 0xCu);
        }

        if (![(BFFSettingsManager *)self _stashConfiguration:v3])
        {
          v21 = _BYLoggingFacility();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A7DED000, v21, OS_LOG_TYPE_DEFAULT, "Not stashing paths; configuration failed to write!",
              buf,
              2u);
          }

          goto LABEL_39;
        }
LABEL_22:
        if (v3)
        {
          v19 = _BYLoggingFacility();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A7DED000, v19, OS_LOG_TYPE_DEFAULT, "Not stashing any paths...", buf, 2u);
          }

          if (v13 != 1) {
            goto LABEL_34;
          }
LABEL_29:
          if (![(BFFSettingsManager *)self _commitStash])
          {
            [(id)objc_opt_class() removeSafeHaven];
            goto LABEL_39;
          }
LABEL_34:
          id v8 = _BYLoggingFacility();
          if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_8;
          }
          *(_WORD *)buf = 0;
          id v9 = "Successfully stashed!";
          goto LABEL_7;
        }
        BOOL v20 = [(BFFSettingsManager *)self _stashPaths];
        if (v13 == 1 && v20) {
          goto LABEL_29;
        }
        if (v20) {
          goto LABEL_34;
        }
LABEL_39:
        id v8 = _BYLoggingFacility();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v15 = "Failed to stash!";
          goto LABEL_41;
        }
LABEL_42:
        BOOL v10 = 0;
        goto LABEL_43;
      }
      if (!v17) {
        goto LABEL_42;
      }
      *(_WORD *)buf = 0;
      v15 = "Failed to clean up safe haven!";
    }
    else
    {
      id v8 = _BYLoggingFacility();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_42;
      }
      *(_WORD *)buf = 0;
      v15 = "Safe haven doesn't exist - can't stash information!";
    }
LABEL_41:
    _os_log_impl(&dword_1A7DED000, v8, OS_LOG_TYPE_DEFAULT, v15, buf, 2u);
    goto LABEL_42;
  }
  id v8 = _BYLoggingFacility();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    id v9 = "No settings to stash";
LABEL_7:
    _os_log_impl(&dword_1A7DED000, v8, OS_LOG_TYPE_DEFAULT, v9, buf, 2u);
  }
LABEL_8:
  BOOL v10 = 1;
LABEL_43:

  return v10;
}

void __56__BFFSettingsManager_hideStashInSafeHavenAsProvisional___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (v5)
  {
    dispatch_semaphore_t v6 = _BYLoggingFacility();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __56__BFFSettingsManager_hideStashInSafeHavenAsProvisional___block_invoke_cold_1(v5);
    }
  }
  else
  {
    uint64_t v7 = [NSNumber numberWithInteger:a3];
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = *(void **)(v8 + 48);
    *(void *)(v8 + 48) = v7;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (BOOL)_stashConfiguration:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v5 = objc_opt_new();
  [v5 setObject:&unk_1EFE4E418 forKeyedSubscript:@"version"];
  if (v3) {
    dispatch_semaphore_t v6 = &unk_1EFE4E430;
  }
  else {
    dispatch_semaphore_t v6 = &unk_1EFE4E448;
  }
  [v5 setObject:v6 forKeyedSubscript:@"type"];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithContentsOfFile:@"/System/Library/CoreServices/SystemVersion.plist"];
  uint64_t v8 = [v7 objectForKeyedSubscript:@"ProductBuildVersion"];
  [v5 setObject:v8 forKeyedSubscript:@"buildVersion"];

  id v9 = [v7 objectForKeyedSubscript:@"ProductVersion"];
  [v5 setObject:v9 forKeyedSubscript:@"productVersion"];

  if ([(NSMutableDictionary *)self->_stashedPreferences count]) {
    [v5 setObject:self->_stashedPreferences forKeyedSubscript:@"defaults"];
  }
  if ([(NSMutableDictionary *)self->_stashedManagedConfigurationSettings count]) {
    [v5 setObject:self->_stashedManagedConfigurationSettings forKeyedSubscript:@"managedConfiguration"];
  }
  stashedAssistantEnabled = self->_stashedAssistantEnabled;
  if (stashedAssistantEnabled) {
    [v5 setObject:stashedAssistantEnabled forKeyedSubscript:@"assistant"];
  }
  stashedAssistantVoiceTriggerEnabled = self->_stashedAssistantVoiceTriggerEnabled;
  if (stashedAssistantVoiceTriggerEnabled) {
    [v5 setObject:stashedAssistantVoiceTriggerEnabled forKeyedSubscript:@"assistantVoiceTrigger"];
  }
  stashedSiriDataSharingOptInStatus = self->_stashedSiriDataSharingOptInStatus;
  if (stashedSiriDataSharingOptInStatus) {
    [v5 setObject:stashedSiriDataSharingOptInStatus forKeyedSubscript:@"siriDataSharingOptInStatus2"];
  }
  stashedLocationServicesEnabled = self->_stashedLocationServicesEnabled;
  if (stashedLocationServicesEnabled) {
    [v5 setObject:stashedLocationServicesEnabled forKeyedSubscript:@"locationServices"];
  }
  stashedLocationServicesSettings = self->_stashedLocationServicesSettings;
  if (stashedLocationServicesSettings) {
    [v5 setObject:stashedLocationServicesSettings forKeyedSubscript:@"locationServicesSettings"];
  }
  stashedWatchData = self->_stashedWatchData;
  if (stashedWatchData) {
    [v5 setObject:stashedWatchData forKeyedSubscript:@"watch"];
  }
  if ([(NSArray *)self->_stashedFlowSkipIdentifiers count]) {
    [v5 setObject:self->_stashedFlowSkipIdentifiers forKeyedSubscript:@"flowSkipIdentifiers"];
  }
  stashedScreenTimeEnabled = self->_stashedScreenTimeEnabled;
  if (stashedScreenTimeEnabled) {
    [v5 setObject:stashedScreenTimeEnabled forKeyedSubscript:@"screenTime"];
  }
  stashedWebContentFilteringEnabled = self->_stashedWebContentFilteringEnabled;
  if (stashedWebContentFilteringEnabled) {
    [v5 setObject:stashedWebContentFilteringEnabled forKeyedSubscript:@"webContentFiltering"];
  }
  stashedAutoUpdateEnabled = self->_stashedAutoUpdateEnabled;
  if (stashedAutoUpdateEnabled) {
    [v5 setObject:stashedAutoUpdateEnabled forKeyedSubscript:@"autoUpdate"];
  }
  stashedAutoDownloadEnabled = self->_stashedAutoDownloadEnabled;
  if (stashedAutoDownloadEnabled) {
    [v5 setObject:stashedAutoDownloadEnabled forKeyedSubscript:@"autoDownload"];
  }
  stashedAccessibilityData = self->_stashedAccessibilityData;
  if (stashedAccessibilityData) {
    [v5 setObject:stashedAccessibilityData forKeyedSubscript:@"accessibilityData"];
  }
  stashedUserInterfaceStyleMode = self->_stashedUserInterfaceStyleMode;
  if (stashedUserInterfaceStyleMode) {
    [v5 setObject:stashedUserInterfaceStyleMode forKeyedSubscript:@"userInterfaceStyleMode"];
  }
  stashedSeedEnrollmentProgramName = self->_stashedSeedEnrollmentProgramName;
  if (stashedSeedEnrollmentProgramName) {
    [v5 setObject:stashedSeedEnrollmentProgramName forKeyedSubscript:@"seedEnrollmentProgramName"];
  }
  stashedSeedEnrollmentAssetAudience = self->_stashedSeedEnrollmentAssetAudience;
  if (stashedSeedEnrollmentAssetAudience) {
    [v5 setObject:stashedSeedEnrollmentAssetAudience forKeyedSubscript:@"seedEnrollmentAssetAudience"];
  }
  stashedSeedEnrollmentProgramID = self->_stashedSeedEnrollmentProgramID;
  if (stashedSeedEnrollmentProgramID) {
    [v5 setObject:stashedSeedEnrollmentProgramID forKeyedSubscript:@"seedEnrollmentProgramID"];
  }
  stashedAnalytics = self->_stashedAnalytics;
  if (stashedAnalytics) {
    [v5 setObject:stashedAnalytics forKeyedSubscript:@"analytics"];
  }
  stashedSiriOutputVoice = self->_stashedSiriOutputVoice;
  if (stashedSiriOutputVoice) {
    [v5 setObject:stashedSiriOutputVoice forKeyedSubscript:@"siriOutputVoice"];
  }
  if ([(NSString *)self->_stashedSiriLanguage length]) {
    [v5 setObject:self->_stashedSiriLanguage forKeyedSubscript:@"siriLanguage"];
  }
  stashedActionButtonData = self->_stashedActionButtonData;
  if (stashedActionButtonData) {
    [v5 setObject:stashedActionButtonData forKeyedSubscript:@"actionButton"];
  }
  v28 = _BYLoggingFacility();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A7DED000, v28, OS_LOG_TYPE_DEFAULT, "Writing configuration to disk...", buf, 2u);
  }

  v29 = _BYLoggingFacility();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v53 = v5;
    _os_log_impl(&dword_1A7DED000, v29, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

  v30 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/private/var/buddy/Configuration.plist"];
  id v51 = 0;
  uint64_t v31 = [v5 writeToURL:v30 error:&v51];
  id v32 = v51;

  if ((v31 & 1) == 0)
  {
    v33 = _BYLoggingFacility();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      if (_BYIsInternalInstall())
      {
        int v34 = 0;
        v35 = v32;
      }
      else if (v32)
      {
        v36 = NSString;
        uint64_t v31 = [v32 domain];
        v35 = [v36 stringWithFormat:@"<Error domain: %@, code %ld>", v31, objc_msgSend(v32, "code")];
        int v34 = 1;
      }
      else
      {
        int v34 = 0;
        v35 = 0;
      }
      *(_DWORD *)buf = 138543362;
      v53 = v35;
      _os_log_impl(&dword_1A7DED000, v33, OS_LOG_TYPE_DEFAULT, "Failed to write configuration to safe haven: %{public}@", buf, 0xCu);
      if (v34)
      {
      }
    }

    if (![(NSMutableArray *)self->_stashedPaths count])
    {
      BOOL v44 = 0;
      goto LABEL_73;
    }
    v37 = _BYLoggingFacility();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7DED000, v37, OS_LOG_TYPE_DEFAULT, "Attempting to write minimal configuration...", buf, 2u);
    }

    v38 = objc_opt_new();
    [v38 setObject:&unk_1EFE4E418 forKeyedSubscript:@"version"];
    v39 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/private/var/buddy/Configuration.plist"];
    id v50 = v32;
    char v40 = [v38 writeToURL:v39 error:&v50];
    id v41 = v50;

    if ((v40 & 1) == 0)
    {
      v45 = _BYLoggingFacility();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        if (_BYIsInternalInstall())
        {
          int v47 = 0;
          v48 = v41;
        }
        else if (v41)
        {
          v49 = NSString;
          v39 = [v41 domain];
          v48 = [v49 stringWithFormat:@"<Error domain: %@, code %ld>", v39, objc_msgSend(v41, "code")];
          int v47 = 1;
        }
        else
        {
          int v47 = 0;
          v48 = 0;
        }
        *(_DWORD *)buf = 138543362;
        v53 = v48;
        _os_log_impl(&dword_1A7DED000, v45, OS_LOG_TYPE_DEFAULT, "Failed to write configuration to safe haven: %{public}@", buf, 0xCu);
        if (v47)
        {
        }
      }
      goto LABEL_71;
    }
    id v32 = v41;
    id v5 = v38;
  }
  v42 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v43 = [v42 fileExistsAtPath:@"/private/var/buddy/Configuration.plist"];

  if ((v43 & 1) == 0)
  {
    v45 = _BYLoggingFacility();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7DED000, v45, OS_LOG_TYPE_DEFAULT, "Configuration does not exist in safe haven after writing it!", buf, 2u);
    }
    id v41 = v32;
    v38 = v5;
LABEL_71:

    BOOL v44 = 0;
    id v32 = v41;
    id v5 = v38;
    goto LABEL_73;
  }
  BOOL v44 = 1;
LABEL_73:

  return v44;
}

- (BOOL)_stashPaths
{
  p_super = &self->super;
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  if (![(NSMutableArray *)self->_stashedPaths count]) {
    return 1;
  }
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v73 = 0;
  char v5 = [v4 createDirectoryAtPath:@"/private/var/buddy/Root/" withIntermediateDirectories:0 attributes:0 error:&v73];
  id v6 = v73;

  if ((v5 & 1) == 0)
  {
    v27 = _BYLoggingFacility();
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_66;
    }
    if (_BYIsInternalInstall())
    {
      int v28 = 0;
      uint64_t i = (uint64_t)v6;
    }
    else if (v6)
    {
      v53 = NSString;
      p_super = [v6 domain];
      uint64_t i = [v53 stringWithFormat:@"<Error domain: %@, code %ld>", p_super, objc_msgSend(v6, "code")];
      int v28 = 1;
    }
    else
    {
      int v28 = 0;
      uint64_t i = 0;
    }
    *(_DWORD *)buf = 138543362;
    uint64_t v76 = i;
    _os_log_impl(&dword_1A7DED000, v27, OS_LOG_TYPE_DEFAULT, "Unable to create root within safe haven: %{public}@", buf, 0xCu);
    if (!v28) {
      goto LABEL_66;
    }
    goto LABEL_64;
  }
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  obuint64_t j = p_super[1].isa;
  uint64_t v7 = [(objc_class *)obj countByEnumeratingWithState:&v69 objects:v81 count:16];
  if (!v7)
  {
    char v61 = 1;
    goto LABEL_38;
  }
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)v70;
  char v61 = 1;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v70 != v9) {
        objc_enumerationMutation(obj);
      }
      BOOL v10 = *(void **)(*((void *)&v69 + 1) + 8 * i);
      id v11 = [@"/private/var/buddy/Root/" stringByAppendingPathComponent:v10];
      char v12 = [MEMORY[0x1E4F28CB8] defaultManager];
      uint64_t v13 = [v11 stringByDeletingLastPathComponent];
      id v68 = v6;
      char v14 = [v12 createDirectoryAtPath:v13 withIntermediateDirectories:1 attributes:0 error:&v68];
      id v15 = v68;

      char v16 = _BYLoggingFacility();
      BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
      if ((v14 & 1) == 0)
      {
        if (v17)
        {
          if (_BYIsInternalInstall())
          {
            int v22 = 0;
            uint64_t v23 = (uint64_t)v15;
          }
          else if (v15)
          {
            uint64_t v24 = NSString;
            v58 = [v15 domain];
            [v24 stringWithFormat:@"<Error domain: %@, code %ld>", v58, objc_msgSend(v15, "code")];
            v57 = int v22 = 1;
            uint64_t v23 = (uint64_t)v57;
          }
          else
          {
            int v22 = 0;
            uint64_t v23 = 0;
          }
          *(_DWORD *)buf = 138543362;
          uint64_t v76 = v23;
          _os_log_impl(&dword_1A7DED000, v16, OS_LOG_TYPE_DEFAULT, "Unable to create parent directories within safe haven: %{public}@", buf, 0xCu);
          if (v22)
          {
          }
        }
        goto LABEL_29;
      }
      if (v17)
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v76 = (uint64_t)v10;
        _os_log_impl(&dword_1A7DED000, v16, OS_LOG_TYPE_DEFAULT, "Copying %@ into the safe haven...", buf, 0xCu);
      }

      v18 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v67 = v15;
      char v19 = [v18 copyItemAtPath:v10 toPath:v11 error:&v67];
      id v6 = v67;

      if ((v19 & 1) == 0)
      {
        char v16 = _BYLoggingFacility();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          if (_BYIsInternalInstall())
          {
            int v20 = 0;
            id v21 = v6;
          }
          else if (v6)
          {
            v25 = NSString;
            v56 = [v6 domain];
            [v25 stringWithFormat:@"<Error domain: %@, code %ld>", v56, objc_msgSend(v6, "code")];
            v55 = int v20 = 1;
            id v21 = v55;
          }
          else
          {
            int v20 = 0;
            id v21 = 0;
          }
          *(_DWORD *)buf = 138412802;
          uint64_t v76 = (uint64_t)v10;
          __int16 v77 = 2112;
          v78 = v11;
          __int16 v79 = 2114;
          id v80 = v21;
          _os_log_impl(&dword_1A7DED000, v16, OS_LOG_TYPE_DEFAULT, "Failed to copy %@ to %@: %{public}@", buf, 0x20u);
          if (v20)
          {
          }
        }
        id v15 = v6;
LABEL_29:

        char v61 = 0;
        id v6 = v15;
      }
    }
    uint64_t v8 = [(objc_class *)obj countByEnumeratingWithState:&v69 objects:v81 count:16];
  }
  while (v8);
LABEL_38:
  v29 = v6;

  v30 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v66 = v6;
  v27 = [v30 subpathsOfDirectoryAtPath:@"/private/var/buddy/Root/" error:&v66];
  id v6 = v66;

  if (!v27)
  {
    p_super = _BYLoggingFacility();
    if (!os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_65;
    }
    if (_BYIsInternalInstall())
    {
      int v51 = 0;
      v52 = v6;
    }
    else if (v6)
    {
      uint64_t v54 = NSString;
      uint64_t i = [v6 domain];
      v52 = [v54 stringWithFormat:@"<Error domain: %@, code %ld>", i, objc_msgSend(v6, "code")];
      int v51 = 1;
    }
    else
    {
      int v51 = 0;
      v52 = 0;
    }
    *(_DWORD *)buf = 138543362;
    uint64_t v76 = (uint64_t)v52;
    _os_log_impl(&dword_1A7DED000, p_super, OS_LOG_TYPE_DEFAULT, "Unable to get contents of safe haven stashed files: %{public}@", buf, 0xCu);
    if (!v51) {
      goto LABEL_65;
    }

LABEL_64:
LABEL_65:

LABEL_66:
    char v50 = 0;
    goto LABEL_67;
  }
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  v27 = v27;
  uint64_t v31 = [v27 countByEnumeratingWithState:&v62 objects:v74 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v63;
    int v34 = @"/";
    v35 = @"/private/var/buddy/Root/";
    id obja = v6;
    do
    {
      for (uint64_t j = 0; j != v32; ++j)
      {
        if (*(void *)v63 != v33) {
          objc_enumerationMutation(v27);
        }
        v37 = [(__CFString *)v34 stringByAppendingString:*(void *)(*((void *)&v62 + 1) + 8 * j)];
        v38 = [(__CFString *)v35 stringByAppendingPathComponent:v37];
        id v39 = v37;
        char v40 = (const char *)[v39 UTF8String];
        id v41 = v38;
        int v42 = copyfile(v40, (const char *)[v41 UTF8String], 0, 4u);
        if (v42 < 0)
        {
          int v43 = v42;
          uint64_t v44 = v32;
          uint64_t v45 = v33;
          v46 = v35;
          int v47 = v34;
          v48 = v27;
          v49 = _BYLoggingFacility();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v76) = v43;
            _os_log_impl(&dword_1A7DED000, v49, OS_LOG_TYPE_DEFAULT, "Failed to copy extended attributes: %d", buf, 8u);
          }

          char v61 = 0;
          v27 = v48;
          int v34 = v47;
          v35 = v46;
          uint64_t v33 = v45;
          uint64_t v32 = v44;
          id v6 = obja;
        }
      }
      uint64_t v32 = [v27 countByEnumeratingWithState:&v62 objects:v74 count:16];
    }
    while (v32);
  }

  char v50 = v61;
LABEL_67:

  return v50 & 1;
}

- (BOOL)_commitStash
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(id)objc_opt_class() loadConfigurationFromDisk];
  id v4 = (void *)[v3 mutableCopy];

  [v4 setObject:&unk_1EFE4E448 forKeyedSubscript:@"type"];
  char v5 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/private/var/buddy/Configuration.plist"];
  id v13 = 0;
  char v6 = [v4 writeToURL:v5 error:&v13];
  id v7 = v13;

  if ((v6 & 1) == 0)
  {
    uint64_t v8 = _BYLoggingFacility();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      if (_BYIsInternalInstall())
      {
        int v9 = 0;
        BOOL v10 = v7;
      }
      else if (v7)
      {
        id v11 = NSString;
        int v2 = [v7 domain];
        BOOL v10 = [v11 stringWithFormat:@"<Error domain: %@, code %ld>", v2, objc_msgSend(v7, "code")];
        int v9 = 1;
      }
      else
      {
        int v9 = 0;
        BOOL v10 = 0;
      }
      *(_DWORD *)buf = 138543362;
      id v15 = v10;
      _os_log_impl(&dword_1A7DED000, v8, OS_LOG_TYPE_DEFAULT, "Failed to mark stash as commited: %{public}@", buf, 0xCu);
      if (v9)
      {
      }
    }
  }
  return v6;
}

+ (void)postDidRestoreSafeHavenNotification
{
  int v2 = _BYLoggingFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1A7DED000, v2, OS_LOG_TYPE_DEFAULT, "Posting did restore safe haven notification...", v4, 2u);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.purplebuddy.safehaven.restored", 0, 0, 0);
}

- (void)reset
{
  BOOL v3 = _BYLoggingFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1A7DED000, v3, OS_LOG_TYPE_DEFAULT, "Resetting settings/configuration to stash...", v4, 2u);
  }

  [(BFFSettingsManager *)self _reset:1];
}

- (void)_reset:(BOOL)a3
{
  if (a3)
  {
    id v4 = (NSMutableArray *)objc_opt_new();
    stashedPaths = self->_stashedPaths;
    self->_stashedPaths = v4;
  }
  char v6 = (NSMutableDictionary *)objc_opt_new();
  stashedPreferences = self->_stashedPreferences;
  self->_stashedPreferences = v6;

  uint64_t v8 = (NSMutableDictionary *)objc_opt_new();
  stashedManagedConfigurationSettings = self->_stashedManagedConfigurationSettings;
  self->_stashedManagedConfigurationSettings = v8;

  stashedAssistantEnabled = self->_stashedAssistantEnabled;
  self->_stashedAssistantEnabled = 0;

  stashedAssistantVoiceTriggerEnabled = self->_stashedAssistantVoiceTriggerEnabled;
  self->_stashedAssistantVoiceTriggerEnabled = 0;

  stashedSiriDataSharingOptInStatus = self->_stashedSiriDataSharingOptInStatus;
  self->_stashedSiriDataSharingOptInStatus = 0;

  stashedLocationServicesEnabled = self->_stashedLocationServicesEnabled;
  self->_stashedLocationServicesEnabled = 0;

  stashedLocationServicesSettings = self->_stashedLocationServicesSettings;
  self->_stashedLocationServicesSettings = 0;

  stashedWatchData = self->_stashedWatchData;
  self->_stashedWatchData = 0;

  stashedFlowSkipIdentifiers = self->_stashedFlowSkipIdentifiers;
  self->_stashedFlowSkipIdentifiers = 0;

  stashedScreenTimeEnabled = self->_stashedScreenTimeEnabled;
  self->_stashedScreenTimeEnabled = 0;

  stashedWebContentFilteringEnabled = self->_stashedWebContentFilteringEnabled;
  self->_stashedWebContentFilteringEnabled = 0;

  stashedAutoUpdateEnabled = self->_stashedAutoUpdateEnabled;
  self->_stashedAutoUpdateEnabled = 0;

  stashedAutoDownloadEnabled = self->_stashedAutoDownloadEnabled;
  self->_stashedAutoDownloadEnabled = 0;

  stashedAccessibilityData = self->_stashedAccessibilityData;
  self->_stashedAccessibilityData = 0;

  stashedUserInterfaceStyleMode = self->_stashedUserInterfaceStyleMode;
  self->_stashedUserInterfaceStyleMode = 0;

  stashedSeedEnrollmentProgramName = self->_stashedSeedEnrollmentProgramName;
  self->_stashedSeedEnrollmentProgramName = 0;

  stashedSeedEnrollmentAssetAudience = self->_stashedSeedEnrollmentAssetAudience;
  self->_stashedSeedEnrollmentAssetAudience = 0;

  stashedSeedEnrollmentProgramID = self->_stashedSeedEnrollmentProgramID;
  self->_stashedSeedEnrollmentProgramID = 0;

  v26 = (NSMutableArray *)objc_opt_new();
  stashedAnalytics = self->_stashedAnalytics;
  self->_stashedAnalytics = v26;

  stashedSiriOutputVoice = self->_stashedSiriOutputVoice;
  self->_stashedSiriOutputVoice = 0;

  stashedSiriLanguage = self->_stashedSiriLanguage;
  self->_stashedSiriLanguage = 0;

  stashedActionButtonData = self->_stashedActionButtonData;
  self->_stashedActionButtonData = 0;
}

- (void)applySafeHavenStash
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (([(id)objc_opt_class() hasStashedValuesOnDisk] & 1) == 0)
  {
    uint64_t v7 = [(id)objc_opt_class() stashConfigurationType];
    uint64_t v8 = _BYLoggingFacility();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7 == 1)
    {
      if (v9)
      {
        LOWORD(v36) = 0;
        BOOL v10 = "Attempted to apply a provisional stash!";
LABEL_97:
        _os_log_impl(&dword_1A7DED000, v8, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v36, 2u);
      }
    }
    else if (v9)
    {
      LOWORD(v36) = 0;
      BOOL v10 = "No committed stashed values on disk";
      goto LABEL_97;
    }
LABEL_98:

    return;
  }
  BOOL v3 = +[BYPreferencesController buddyPreferencesInternal];
  int v4 = [v3 BOOLForKey:@"NeverApplyRestoreStash"];

  char v5 = _BYLoggingFacility();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (!v4)
  {
    if (v6)
    {
      id v11 = [(id)objc_opt_class() stashProductVersion];
      char v12 = [(id)objc_opt_class() stashBuildVersion];
      int v36 = 138412546;
      *(void *)v37 = v11;
      *(_WORD *)&v37[8] = 2112;
      v38 = v12;
      _os_log_impl(&dword_1A7DED000, v5, OS_LOG_TYPE_DEFAULT, "Applying safe haven stash from %@ (%@)", (uint8_t *)&v36, 0x16u);
    }
    unint64_t v13 = [(BFFSettingsManager *)self _restoreConfiguration];
    if (v13 == 1)
    {
      if ([(NSMutableDictionary *)self->_stashedPreferences count])
      {
        [(BFFSettingsManager *)self _applyStashedPreferences];
      }
      else
      {
        char v19 = _BYLoggingFacility();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v36) = 0;
          _os_log_impl(&dword_1A7DED000, v19, OS_LOG_TYPE_DEFAULT, "No stashed preferences found", (uint8_t *)&v36, 2u);
        }
      }
      if ([(NSMutableDictionary *)self->_stashedManagedConfigurationSettings count])
      {
        [(BFFSettingsManager *)self _applyStashedManagedConfiguration];
      }
      else
      {
        int v20 = _BYLoggingFacility();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v36) = 0;
          _os_log_impl(&dword_1A7DED000, v20, OS_LOG_TYPE_DEFAULT, "No stashed managed configuration settings found", (uint8_t *)&v36, 2u);
        }
      }
      if (self->_stashedAssistantEnabled
        || self->_stashedAssistantVoiceTriggerEnabled
        || self->_stashedSiriDataSharingOptInStatus
        || self->_stashedSiriOutputVoice && [(NSString *)self->_stashedSiriLanguage length])
      {
        [(BFFSettingsManager *)self _applyAssistantPreferences];
      }
      else
      {
        v35 = _BYLoggingFacility();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v36) = 0;
          _os_log_impl(&dword_1A7DED000, v35, OS_LOG_TYPE_DEFAULT, "No assistant preferences found", (uint8_t *)&v36, 2u);
        }
      }
      if (self->_stashedLocationServicesEnabled)
      {
        [(BFFSettingsManager *)self _applyLocationServices];
      }
      else
      {
        id v21 = _BYLoggingFacility();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v36) = 0;
          _os_log_impl(&dword_1A7DED000, v21, OS_LOG_TYPE_DEFAULT, "No location services preference found", (uint8_t *)&v36, 2u);
        }
      }
      if (self->_stashedLocationServicesSettings)
      {
        [(BFFSettingsManager *)self _applyLocationServicesSettings];
      }
      else
      {
        int v22 = _BYLoggingFacility();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v36) = 0;
          _os_log_impl(&dword_1A7DED000, v22, OS_LOG_TYPE_DEFAULT, "No location services settings found", (uint8_t *)&v36, 2u);
        }
      }
      if (self->_stashedWatchData)
      {
        [(BFFSettingsManager *)self _restoreWatchData];
      }
      else
      {
        uint64_t v23 = _BYLoggingFacility();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v36) = 0;
          _os_log_impl(&dword_1A7DED000, v23, OS_LOG_TYPE_DEFAULT, "No watch migration data found", (uint8_t *)&v36, 2u);
        }
      }
      if (self->_stashedFlowSkipIdentifiers)
      {
        [(BFFSettingsManager *)self _applyStashedFlowSkipIdentifiers];
      }
      else
      {
        uint64_t v24 = _BYLoggingFacility();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v36) = 0;
          _os_log_impl(&dword_1A7DED000, v24, OS_LOG_TYPE_DEFAULT, "No flow skip identifiers found", (uint8_t *)&v36, 2u);
        }
      }
      if (self->_stashedScreenTimeEnabled)
      {
        [(BFFSettingsManager *)self _applyScreenTimePreferences];
      }
      else
      {
        v25 = _BYLoggingFacility();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v36) = 0;
          _os_log_impl(&dword_1A7DED000, v25, OS_LOG_TYPE_DEFAULT, "No Screen Time preferences found", (uint8_t *)&v36, 2u);
        }
      }
      if (self->_stashedWebContentFilteringEnabled)
      {
        [(BFFSettingsManager *)self _applyWebContentFilteringPreferences];
      }
      else
      {
        v26 = _BYLoggingFacility();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v36) = 0;
          _os_log_impl(&dword_1A7DED000, v26, OS_LOG_TYPE_DEFAULT, "No Web Content Filtering preferences found", (uint8_t *)&v36, 2u);
        }
      }
      if (self->_stashedAutoUpdateEnabled)
      {
        [(BFFSettingsManager *)self _applyUpdatePreferences];
      }
      else
      {
        v27 = _BYLoggingFacility();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v36) = 0;
          _os_log_impl(&dword_1A7DED000, v27, OS_LOG_TYPE_DEFAULT, "No update preferences found", (uint8_t *)&v36, 2u);
        }
      }
      if (self->_stashedAccessibilityData)
      {
        [(BFFSettingsManager *)self _restoreAccessibilityData];
      }
      else
      {
        int v28 = _BYLoggingFacility();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v36) = 0;
          _os_log_impl(&dword_1A7DED000, v28, OS_LOG_TYPE_DEFAULT, "No accessibility data found", (uint8_t *)&v36, 2u);
        }
      }
      if (self->_stashedUserInterfaceStyleMode)
      {
        [(BFFSettingsManager *)self _applyUserInterfaceStyleMode];
      }
      else
      {
        v29 = _BYLoggingFacility();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v36) = 0;
          _os_log_impl(&dword_1A7DED000, v29, OS_LOG_TYPE_DEFAULT, "No user interface style mode data found", (uint8_t *)&v36, 2u);
        }
      }
      if (self->_stashedSeedEnrollmentProgramName && self->_stashedSeedEnrollmentAssetAudience)
      {
        [(BFFSettingsManager *)self _applySeedEnrollmentData];
      }
      else
      {
        v30 = _BYLoggingFacility();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v36) = 0;
          _os_log_impl(&dword_1A7DED000, v30, OS_LOG_TYPE_DEFAULT, "No seed enrollment data found", (uint8_t *)&v36, 2u);
        }
      }
      if ([(NSMutableArray *)self->_stashedAnalytics count])
      {
        [(BFFSettingsManager *)self _restoreAnalyticsData];
      }
      else
      {
        uint64_t v31 = _BYLoggingFacility();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v36) = 0;
          _os_log_impl(&dword_1A7DED000, v31, OS_LOG_TYPE_DEFAULT, "No analytics data found", (uint8_t *)&v36, 2u);
        }
      }
      if (self->_stashedActionButtonData)
      {
        [(BFFSettingsManager *)self _restoreActionButtonData];
      }
      else
      {
        uint64_t v32 = _BYLoggingFacility();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v36) = 0;
          _os_log_impl(&dword_1A7DED000, v32, OS_LOG_TYPE_DEFAULT, "No action button data found", (uint8_t *)&v36, 2u);
        }
      }
      [(BFFSettingsManager *)self _restoreStashedFiles];
      id v15 = _BYLoggingFacility();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_94;
      }
      LOWORD(v36) = 0;
      uint64_t v16 = "Finished applying safe haven stash!";
      BOOL v17 = v15;
      uint32_t v18 = 2;
    }
    else
    {
      int v14 = v13;
      id v15 = _BYLoggingFacility();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
LABEL_94:

        uint64_t v33 = +[BYPreferencesController buddyPreferencesInternal];
        int v34 = [v33 BOOLForKey:@"DoNotRemoveStash"];

        if (!v34)
        {
          [(id)objc_opt_class() removeSafeHaven];
          [(id)objc_opt_class() postDidRestoreSafeHavenNotification];
          return;
        }
        uint64_t v8 = _BYLoggingFacility();
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_98;
        }
        LOWORD(v36) = 0;
        BOOL v10 = "Not removing safe haven stash (default set)";
        goto LABEL_97;
      }
      int v36 = 67109376;
      *(_DWORD *)v37 = v14;
      *(_WORD *)&v37[4] = 1024;
      *(_DWORD *)&v37[6] = 1;
      uint64_t v16 = "Configuration is a different version (%d) expected (%d)!";
      BOOL v17 = v15;
      uint32_t v18 = 14;
    }
    _os_log_impl(&dword_1A7DED000, v17, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v36, v18);
    goto LABEL_94;
  }
  if (v6)
  {
    LOWORD(v36) = 0;
    _os_log_impl(&dword_1A7DED000, v5, OS_LOG_TYPE_DEFAULT, "Not applying safe haven stash (default set)", (uint8_t *)&v36, 2u);
  }
}

- (unint64_t)_restoreConfiguration
{
  BOOL v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:@"/private/var/buddy/Configuration.plist"];
  int v4 = [v3 objectForKeyedSubscript:@"defaults"];
  stashedPreferences = self->_stashedPreferences;
  self->_stashedPreferences = v4;

  BOOL v6 = [v3 objectForKeyedSubscript:@"managedConfiguration"];
  stashedManagedConfigurationSettings = self->_stashedManagedConfigurationSettings;
  self->_stashedManagedConfigurationSettings = v6;

  uint64_t v8 = [v3 objectForKeyedSubscript:@"assistant"];
  stashedAssistantEnabled = self->_stashedAssistantEnabled;
  self->_stashedAssistantEnabled = v8;

  BOOL v10 = [v3 objectForKeyedSubscript:@"assistantVoiceTrigger"];
  stashedAssistantVoiceTriggerEnabled = self->_stashedAssistantVoiceTriggerEnabled;
  self->_stashedAssistantVoiceTriggerEnabled = v10;

  char v12 = [v3 objectForKeyedSubscript:@"siriDataSharingOptInStatus2"];
  stashedSiriDataSharingOptInStatus = self->_stashedSiriDataSharingOptInStatus;
  self->_stashedSiriDataSharingOptInStatus = v12;

  int v14 = [v3 objectForKeyedSubscript:@"locationServices"];
  stashedLocationServicesEnabled = self->_stashedLocationServicesEnabled;
  self->_stashedLocationServicesEnabled = v14;

  uint64_t v16 = [v3 objectForKeyedSubscript:@"locationServicesSettings"];
  stashedLocationServicesSettings = self->_stashedLocationServicesSettings;
  self->_stashedLocationServicesSettings = v16;

  uint32_t v18 = [v3 objectForKeyedSubscript:@"watch"];
  stashedWatchData = self->_stashedWatchData;
  self->_stashedWatchData = v18;

  int v20 = [v3 objectForKeyedSubscript:@"flowSkipIdentifiers"];
  stashedFlowSkipIdentifiers = self->_stashedFlowSkipIdentifiers;
  self->_stashedFlowSkipIdentifiers = v20;

  int v22 = [v3 objectForKeyedSubscript:@"screenTime"];
  stashedScreenTimeEnabled = self->_stashedScreenTimeEnabled;
  self->_stashedScreenTimeEnabled = v22;

  uint64_t v24 = [v3 objectForKeyedSubscript:@"webContentFiltering"];
  stashedWebContentFilteringEnabled = self->_stashedWebContentFilteringEnabled;
  self->_stashedWebContentFilteringEnabled = v24;

  v26 = [v3 objectForKeyedSubscript:@"autoDownload"];
  stashedAutoDownloadEnabled = self->_stashedAutoDownloadEnabled;
  self->_stashedAutoDownloadEnabled = v26;

  int v28 = [v3 objectForKeyedSubscript:@"autoUpdate"];
  stashedAutoUpdateEnabled = self->_stashedAutoUpdateEnabled;
  self->_stashedAutoUpdateEnabled = v28;

  v30 = [v3 objectForKeyedSubscript:@"accessibilityData"];
  stashedAccessibilityData = self->_stashedAccessibilityData;
  self->_stashedAccessibilityData = v30;

  uint64_t v32 = [v3 objectForKeyedSubscript:@"userInterfaceStyleMode"];
  stashedUserInterfaceStyleMode = self->_stashedUserInterfaceStyleMode;
  self->_stashedUserInterfaceStyleMode = v32;

  int v34 = [v3 objectForKeyedSubscript:@"seedEnrollmentProgramName"];
  stashedSeedEnrollmentProgramName = self->_stashedSeedEnrollmentProgramName;
  self->_stashedSeedEnrollmentProgramName = v34;

  int v36 = [v3 objectForKeyedSubscript:@"seedEnrollmentAssetAudience"];
  stashedSeedEnrollmentAssetAudience = self->_stashedSeedEnrollmentAssetAudience;
  self->_stashedSeedEnrollmentAssetAudience = v36;

  v38 = [v3 objectForKeyedSubscript:@"seedEnrollmentProgramID"];
  stashedSeedEnrollmentProgramID = self->_stashedSeedEnrollmentProgramID;
  self->_stashedSeedEnrollmentProgramID = v38;

  char v40 = [v3 objectForKeyedSubscript:@"analytics"];
  stashedAnalytics = self->_stashedAnalytics;
  self->_stashedAnalytics = v40;

  int v42 = [v3 objectForKeyedSubscript:@"siriOutputVoice"];
  stashedSiriOutputVoice = self->_stashedSiriOutputVoice;
  self->_stashedSiriOutputVoice = v42;

  uint64_t v44 = [v3 objectForKeyedSubscript:@"siriLanguage"];
  stashedSiriLanguage = self->_stashedSiriLanguage;
  self->_stashedSiriLanguage = v44;

  v46 = [v3 objectForKeyedSubscript:@"actionButton"];
  stashedActionButtonData = self->_stashedActionButtonData;
  self->_stashedActionButtonData = v46;

  v48 = [v3 objectForKeyedSubscript:@"version"];
  unint64_t v49 = [v48 unsignedIntegerValue];

  return v49;
}

- (void)_applyStashedPreferences
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  obuint64_t j = [(NSMutableDictionary *)self->_stashedPreferences allKeys];
  uint64_t v16 = [obj countByEnumeratingWithState:&v22 objects:v33 count:16];
  if (v16)
  {
    uint64_t v14 = *(void *)v23;
    do
    {
      uint64_t v2 = 0;
      do
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = v2;
        CFStringRef v3 = *(const __CFString **)(*((void *)&v22 + 1) + 8 * v2);
        int v4 = [(NSMutableDictionary *)self->_stashedPreferences objectForKeyedSubscript:v3];
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        char v5 = [v4 allKeys];
        uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v32 count:16];
        if (v6)
        {
          uint64_t v7 = v6;
          uint64_t v8 = *(void *)v19;
          do
          {
            for (uint64_t i = 0; i != v7; ++i)
            {
              if (*(void *)v19 != v8) {
                objc_enumerationMutation(v5);
              }
              CFStringRef v10 = *(const __CFString **)(*((void *)&v18 + 1) + 8 * i);
              id v11 = [v4 objectForKeyedSubscript:v10];
              char v12 = _BYLoggingFacility();
              if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412802;
                CFStringRef v27 = v10;
                __int16 v28 = 2112;
                CFStringRef v29 = v3;
                __int16 v30 = 2112;
                uint64_t v31 = v11;
                _os_log_impl(&dword_1A7DED000, v12, OS_LOG_TYPE_DEFAULT, "Setting default for key %@ in domain %@ to %@...", buf, 0x20u);
              }

              CFPreferencesSetAppValue(v10, v11, v3);
            }
            uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v32 count:16];
          }
          while (v7);
        }

        CFPreferencesAppSynchronize(v3);
        uint64_t v2 = v17 + 1;
      }
      while (v17 + 1 != v16);
      uint64_t v16 = [obj countByEnumeratingWithState:&v22 objects:v33 count:16];
    }
    while (v16);
  }
}

- (void)_applyStashedManagedConfiguration
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  obuint64_t j = [(NSMutableDictionary *)self->_stashedManagedConfigurationSettings allKeys];
  uint64_t v3 = [obj countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v21;
    uint64_t v7 = *MEMORY[0x1E4F73FB8];
    *(void *)&long long v4 = 138543618;
    long long v18 = v4;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(obj);
        }
        BOOL v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        CFStringRef v10 = -[NSMutableDictionary objectForKeyedSubscript:](self->_stashedManagedConfigurationSettings, "objectForKeyedSubscript:", v9, v18);
        id v11 = [MEMORY[0x1E4F1CA98] null];
        int v12 = [v10 isEqual:v11];

        unint64_t v13 = _BYLoggingFacility();
        BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
        if (v12)
        {
          if (v14)
          {
            *(_DWORD *)buf = 138412290;
            long long v25 = v9;
            _os_log_impl(&dword_1A7DED000, v13, OS_LOG_TYPE_DEFAULT, "Removing BOOL value for %@...", buf, 0xCu);
          }

          [(MCProfileConnection *)self->_managedConfiguration removeBoolSetting:v9];
        }
        else
        {
          if (v14)
          {
            int v15 = [v10 BOOLValue];
            *(_DWORD *)buf = v18;
            uint64_t v16 = @"NO";
            if (v15) {
              uint64_t v16 = @"YES";
            }
            long long v25 = v9;
            __int16 v26 = 2114;
            CFStringRef v27 = v16;
            _os_log_impl(&dword_1A7DED000, v13, OS_LOG_TYPE_DEFAULT, "Setting BOOL value for %{public}@ to %{public}@", buf, 0x16u);
          }

          -[MCProfileConnection setBoolValue:forSetting:](self->_managedConfiguration, "setBoolValue:forSetting:", [v10 BOOLValue], v9);
        }
        if ([v9 isEqualToString:v7])
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.OTACrashCopier.SubmissionPreferenceChanged", 0, 0, 0);
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v5);
  }
}

- (void)_applyAssistantPreferences
{
  int v9 = _BYIsInternalInstall();
  if ((v9 & 1) == 0)
  {
    CFStringRef v10 = NSString;
    v1 = [a1 domain];
    uint64_t v11 = (uint64_t)v1;
    uint64_t v12 = [a1 code];
    a1 = [v10 stringWithFormat:@"<Error domain: %@, code %ld>"];
  }
  OUTLINED_FUNCTION_0_1(&dword_1A7DED000, v3, v4, "Failed to decode Siri output voice %{public}@", v5, v6, v7, v8, v11, v12, 2u);
  if (!v9)
  {
  }
}

void __48__BFFSettingsManager__applyAssistantPreferences__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    int v4 = _BYLoggingFacility();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __48__BFFSettingsManager__applyAssistantPreferences__block_invoke_cold_1(v3);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_applyLocationServices
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (self->_stashedLocationServicesEnabled)
  {
    id v3 = _BYLoggingFacility();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v4 = [(NSNumber *)self->_stashedLocationServicesEnabled BOOLValue];
      v5[0] = 67109120;
      v5[1] = v4;
      _os_log_impl(&dword_1A7DED000, v3, OS_LOG_TYPE_DEFAULT, "Setting location services to %d...", (uint8_t *)v5, 8u);
    }

    objc_msgSend(getCLLocationManagerClass(), "setLocationServicesEnabled:", -[NSNumber BOOLValue](self->_stashedLocationServicesEnabled, "BOOLValue"));
  }
}

- (void)_applyLocationServicesSettings
{
  if (self->_stashedLocationServicesSettings)
  {
    id v3 = _BYLoggingFacility();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v5 = 0;
      _os_log_impl(&dword_1A7DED000, v3, OS_LOG_TYPE_DEFAULT, "Setting location services from archived blob...", v5, 2u);
    }

    id v4 = (id)[getCLLocationManagerClass() _applyArchivedAuthorizationDecisions:self->_stashedLocationServicesSettings];
  }
}

- (void)_applyStashedFlowSkipIdentifiers
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = self->_stashedFlowSkipIdentifiers;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        int v9 = _BYLoggingFacility();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v16 = v8;
          _os_log_impl(&dword_1A7DED000, v9, OS_LOG_TYPE_DEFAULT, "Setting flow as skipped: %{public}@", buf, 0xCu);
        }

        [(BYFlowSkipController *)self->_flowSkipController didSkipFlow:v8];
      }
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v17 count:16];
    }
    while (v5);
  }

  if (![(NSArray *)self->_stashedFlowSkipIdentifiers containsObject:@"siri"])
  {
    CFStringRef v10 = _BYLoggingFacility();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7DED000, v10, OS_LOG_TYPE_DEFAULT, "Removing follow up for Siri as the stashed skipped flows did not include Siri...", buf, 2u);
    }

    [(BYFlowSkipController *)self->_flowSkipController didCompleteFlow:@"siri"];
  }
}

- (void)_applyScreenTimePreferences
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([(MCProfileConnection *)self->_managedConfiguration effectiveBoolValueForSetting:*MEMORY[0x1E4F73FD0]] == 2)
  {
    id v3 = _BYLoggingFacility();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7DED000, v3, OS_LOG_TYPE_DEFAULT, "Not setting Screen Time as enabling restrictions is restricted...", buf, 2u);
    }
  }
  else
  {
    uint64_t v4 = [(NSNumber *)self->_stashedScreenTimeEnabled BOOLValue];
    uint64_t v5 = _BYLoggingFacility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = @"NO";
      if (v4) {
        uint64_t v6 = @"YES";
      }
      *(_DWORD *)buf = 138543362;
      uint64_t v16 = v6;
      _os_log_impl(&dword_1A7DED000, v5, OS_LOG_TYPE_DEFAULT, "Setting Screen Time enabled to %{public}@...", buf, 0xCu);
    }

    id v3 = objc_alloc_init((Class)getSTManagementStateClass());
    id v14 = 0;
    char v7 = [v3 setScreenTimeEnabled:v4 error:&v14];
    id v8 = v14;
    if ((v7 & 1) == 0)
    {
      int v9 = _BYLoggingFacility();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        CFStringRef v10 = v4 ? @"enable" : @"disable";
        if (_BYIsInternalInstall())
        {
          int v11 = 0;
          long long v12 = v8;
        }
        else if (v8)
        {
          long long v13 = NSString;
          uint64_t v4 = [v8 domain];
          long long v12 = [v13 stringWithFormat:@"<Error domain: %@, code %ld>", v4, objc_msgSend(v8, "code")];
          int v11 = 1;
        }
        else
        {
          int v11 = 0;
          long long v12 = 0;
        }
        *(_DWORD *)buf = 138543618;
        uint64_t v16 = v10;
        __int16 v17 = 2114;
        uint64_t v18 = v12;
        _os_log_error_impl(&dword_1A7DED000, v9, OS_LOG_TYPE_ERROR, "Failed to %{public}@ Screen Time: %{public}@", buf, 0x16u);
        if (v11)
        {
        }
      }
    }
  }
}

- (void)_applyWebContentFilteringPreferences
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  BOOL v2 = [(NSNumber *)self->_stashedWebContentFilteringEnabled BOOLValue];
  id v3 = _BYLoggingFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = @"NO";
    if (v2) {
      uint64_t v4 = @"YES";
    }
    *(_DWORD *)buf = 138543362;
    long long v12 = v4;
    _os_log_impl(&dword_1A7DED000, v3, OS_LOG_TYPE_DEFAULT, "Setting Web Content Filtering enabled to %{public}@...", buf, 0xCu);
  }

  if (v2)
  {
    id v5 = objc_alloc_init((Class)getSTManagementStateClass());
    dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __58__BFFSettingsManager__applyWebContentFilteringPreferences__block_invoke;
    v8[3] = &unk_1E5D2CAF8;
    BOOL v10 = v2;
    dispatch_semaphore_t v9 = v6;
    char v7 = v6;
    [v5 enableWebContentFilterWithCompletionHandler:v8];
    dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  }
}

void __58__BFFSettingsManager__applyWebContentFilteringPreferences__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = _BYLoggingFacility();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    if (*(unsigned char *)(a1 + 40)) {
      dispatch_semaphore_t v6 = @"enable";
    }
    else {
      dispatch_semaphore_t v6 = @"disable";
    }
    if (_BYIsInternalInstall())
    {
      int v7 = 0;
      id v8 = v4;
    }
    else if (v4)
    {
      dispatch_semaphore_t v9 = NSString;
      BOOL v2 = [v4 domain];
      id v8 = [v9 stringWithFormat:@"<Error domain: %@, code %ld>", v2, objc_msgSend(v4, "code")];
      int v7 = 1;
    }
    else
    {
      int v7 = 0;
      id v8 = 0;
    }
    *(_DWORD *)buf = 138543618;
    int v11 = v6;
    __int16 v12 = 2114;
    uint64_t v13 = v8;
    _os_log_error_impl(&dword_1A7DED000, v5, OS_LOG_TYPE_ERROR, "Failed to %{public}@ Web Content Filtering: %{public}@", buf, 0x16u);
    if (v7)
    {
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_applyUpdatePreferences
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2050000000;
  id v3 = (void *)getSUManagerClientClass_softClass_0;
  uint64_t v16 = getSUManagerClientClass_softClass_0;
  if (!getSUManagerClientClass_softClass_0)
  {
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    uint64_t v18 = __getSUManagerClientClass_block_invoke_0;
    uint64_t v19 = &unk_1E5D2B9E8;
    long long v20 = &v13;
    __getSUManagerClientClass_block_invoke_0((uint64_t)&buf);
    id v3 = (void *)v14[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v13, 8);
  id v5 = [v4 alloc];
  dispatch_semaphore_t v6 = objc_msgSend(v5, "initWithDelegate:clientType:", 0, 1, v13);
  if (self->_stashedAutoDownloadEnabled)
  {
    int v7 = _BYLoggingFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v8 = [(NSNumber *)self->_stashedAutoDownloadEnabled BOOLValue];
      dispatch_semaphore_t v9 = @"NO";
      if (v8) {
        dispatch_semaphore_t v9 = @"YES";
      }
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v9;
      _os_log_impl(&dword_1A7DED000, v7, OS_LOG_TYPE_DEFAULT, "Setting auto-download for updates enabled to %{public}@...", (uint8_t *)&buf, 0xCu);
    }

    objc_msgSend(v6, "enableAutomaticDownload:", -[NSNumber BOOLValue](self->_stashedAutoDownloadEnabled, "BOOLValue"));
  }
  if (self->_stashedAutoUpdateEnabled)
  {
    BOOL v10 = _BYLoggingFacility();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v11 = [(NSNumber *)self->_stashedAutoUpdateEnabled BOOLValue];
      __int16 v12 = @"NO";
      if (v11) {
        __int16 v12 = @"YES";
      }
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v12;
      _os_log_impl(&dword_1A7DED000, v10, OS_LOG_TYPE_DEFAULT, "Setting auto-update enabled to %{public}@...", (uint8_t *)&buf, 0xCu);
    }

    objc_msgSend(v6, "enableAutomaticUpdateV2:", -[NSNumber BOOLValue](self->_stashedAutoUpdateEnabled, "BOOLValue"));
  }
}

- (void)_restoreStashedFiles
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v5 = [v4 fileExistsAtPath:@"/private/var/buddy/Root/"];

  if (v5)
  {
    dispatch_semaphore_t v6 = [(BFFSettingsManager *)self _shovePath:@"/private/var/buddy/Root/" toPath:@"/"];
    int v7 = _BYLoggingFacility();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v8)
      {
        char v9 = _BYIsInternalInstall();
        BOOL v10 = v6;
        if ((v9 & 1) == 0)
        {
          BOOL v11 = NSString;
          BOOL v2 = [v6 domain];
          BOOL v10 = [v11 stringWithFormat:@"<Error domain: %@, code %ld>", v2, -[NSObject code](v6, "code")];
        }
        *(_DWORD *)long long buf = 138543362;
        uint64_t v13 = v10;
        _os_log_impl(&dword_1A7DED000, v7, OS_LOG_TYPE_DEFAULT, "Failed to restore files from safe haven: %{public}@", buf, 0xCu);
        if ((v9 & 1) == 0)
        {
        }
      }
    }
    else if (v8)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1A7DED000, v7, OS_LOG_TYPE_DEFAULT, "Restored files from save haven!", buf, 2u);
    }
  }
  else
  {
    dispatch_semaphore_t v6 = _BYLoggingFacility();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1A7DED000, v6, OS_LOG_TYPE_DEFAULT, "No stashed files to apply", buf, 2u);
    }
  }
}

- (void)_restoreWatchData
{
  id v3 = _BYLoggingFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v6[0]) = 0;
    _os_log_impl(&dword_1A7DED000, v3, OS_LOG_TYPE_DEFAULT, "Passing watch data over to NanoRegistry...", (uint8_t *)v6, 2u);
  }

  uint64_t v7 = 0;
  BOOL v8 = &v7;
  uint64_t v9 = 0x2050000000;
  id v4 = (void *)getNRMigratorClass_softClass_0;
  uint64_t v10 = getNRMigratorClass_softClass_0;
  if (!getNRMigratorClass_softClass_0)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __getNRMigratorClass_block_invoke_0;
    v6[3] = &unk_1E5D2B9E8;
    v6[4] = &v7;
    __getNRMigratorClass_block_invoke_0((uint64_t)v6);
    id v4 = (void *)v8[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v7, 8);
  [v5 ingestPostRestoreMigrationDataForConsentedDevices:self->_stashedWatchData];
}

- (void)_restoreAccessibilityData
{
  BOOL v2 = _BYLoggingFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_1A7DED000, v2, OS_LOG_TYPE_DEFAULT, "Restoring accessibility settings...", v3, 2u);
  }

  _AXSRestoreSettingsFromDataBlobForBuddy();
}

- (void)_applyUserInterfaceStyleMode
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = _BYLoggingFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    NSInteger v4 = [(NSNumber *)self->_stashedUserInterfaceStyleMode integerValue];
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_1A7DED000, v3, OS_LOG_TYPE_DEFAULT, "Setting user interface style mode to %ld", (uint8_t *)&buf, 0xCu);
  }

  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2050000000;
  id v5 = (void *)getUISUserInterfaceStyleModeClass_softClass_0;
  uint64_t v12 = getUISUserInterfaceStyleModeClass_softClass_0;
  if (!getUISUserInterfaceStyleModeClass_softClass_0)
  {
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    uint64_t v14 = __getUISUserInterfaceStyleModeClass_block_invoke_0;
    uint64_t v15 = &unk_1E5D2B9E8;
    uint64_t v16 = &v9;
    __getUISUserInterfaceStyleModeClass_block_invoke_0((uint64_t)&buf);
    id v5 = (void *)v10[3];
  }
  dispatch_semaphore_t v6 = v5;
  _Block_object_dispose(&v9, 8);
  id v7 = [v6 alloc];
  BOOL v8 = objc_msgSend(v7, "initWithDelegate:", 0, v9);
  objc_msgSend(v8, "setModeValue:", -[NSNumber integerValue](self->_stashedUserInterfaceStyleMode, "integerValue"));
}

- (void)_applySeedEnrollmentData
{
  id v3 = objc_alloc_init(BYBuddyDaemonGeneralClient);
  [(BYBuddyDaemonGeneralClient *)v3 enrollInSeedProgramNamed:self->_stashedSeedEnrollmentProgramName withAssetAudience:self->_stashedSeedEnrollmentAssetAudience programID:self->_stashedSeedEnrollmentProgramID];
}

- (void)_restoreAnalyticsData
{
  id v7 = [a2 objectForKeyedSubscript:@"event"];
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_debug_impl(&dword_1A7DED000, a4, OS_LOG_TYPE_DEBUG, "Sending event %@...", a1, 0xCu);
}

- (void)_restoreActionButtonData
{
}

- (id)_currentActionButtonData
{
  return +[BYActionButtonStore currentData];
}

- (void)_setCurrentActionButtonData:(id)a3
{
}

- (id)_preferencesForDomain:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_stashedPreferences objectForKeyedSubscript:v4];
  if (!v5)
  {
    id v5 = objc_opt_new();
    [(NSMutableDictionary *)self->_stashedPreferences setObject:v5 forKey:v4];
  }

  return v5;
}

- (id)_shovePath:(id)a3 toPath:(id)a4
{
  uint64_t v135 = *MEMORY[0x1E4F143B8];
  dispatch_semaphore_t v6 = (BFFSettingsManager *)a3;
  id v7 = (BFFSettingsManager *)a4;
  BOOL v8 = (void *)0x1E4F28000;
  uint64_t v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v121 = 0;
  v107 = v6;
  uint64_t v10 = [v9 attributesOfItemAtPath:v6 error:&v121];
  uint64_t v11 = (BFFSettingsManager *)v121;

  if (!v10)
  {
    uint64_t v12 = _BYLoggingFacility();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      if (_BYIsInternalInstall())
      {
        int v13 = 0;
        uint64_t v14 = v11;
      }
      else if (v11)
      {
        uint64_t v15 = NSString;
        BOOL v8 = [(BFFSettingsManager *)v11 domain];
        uint64_t v14 = [v15 stringWithFormat:@"<Error domain: %@, code %ld>", v8, -[BFFSettingsManager code](v11, "code")];
        int v13 = 1;
      }
      else
      {
        int v13 = 0;
        uint64_t v14 = 0;
      }
      *(_DWORD *)long long buf = 138543362;
      v132 = v14;
      _os_log_impl(&dword_1A7DED000, v12, OS_LOG_TYPE_DEFAULT, "Unable to get attributes for source path: %{public}@", buf, 0xCu);
      if (v13)
      {
      }
    }
  }
  uint64_t v16 = *MEMORY[0x1E4F283B8];
  uint64_t v17 = [v10 objectForKey:*MEMORY[0x1E4F283B8]];
  uint64_t v18 = *MEMORY[0x1E4F283C0];
  uint64_t v19 = [v17 isEqual:*MEMORY[0x1E4F283C0]];

  if (!v10)
  {
    v48 = [MEMORY[0x1E4F28C58] errorWithDomain:@"BFFSettingsManagerErrorDomain" code:-2000 userInfo:0];
    goto LABEL_115;
  }
  v106 = v10;
  long long v20 = [MEMORY[0x1E4F28CB8] defaultManager];
  v120 = v11;
  uint64_t v21 = [v20 attributesOfItemAtPath:v7 error:&v120];
  long long v22 = v120;

  long long v23 = [v21 objectForKey:v16];
  long long v24 = (void *)*MEMORY[0x1E4F283D0];

  if (v23 == v24)
  {
    id v7 = v7;
    if (realpath_DARWIN_EXTSN((const char *)[(BFFSettingsManager *)v7 fileSystemRepresentation], (char *)buf))
    {
      long long v25 = [MEMORY[0x1E4F28CB8] defaultManager];
      uint64_t v26 = [v25 stringWithFileSystemRepresentation:buf length:strlen((const char *)buf)];

      CFStringRef v27 = [MEMORY[0x1E4F28CB8] defaultManager];
      v119 = v22;
      uint64_t v28 = [v27 attributesOfItemAtPath:v26 error:&v119];
      long long v24 = v21;
      uint64_t v29 = v119;

      long long v22 = v29;
      uint64_t v21 = (void *)v28;
      id v7 = (BFFSettingsManager *)v26;
    }
  }
  __int16 v30 = [v21 objectForKey:v16];
  int v31 = [v30 isEqual:v18];

  if (v19)
  {
    if (!v21)
    {
      char v50 = [(BFFSettingsManager *)v7 stringByDeletingLastPathComponent];
      v53 = [MEMORY[0x1E4F28CB8] defaultManager];
      uint64_t v54 = [v53 fileExistsAtPath:v50];

      if (v54)
      {
        v55 = v22;
      }
      else
      {
        long long v65 = [MEMORY[0x1E4F28CB8] defaultManager];
        v115 = v22;
        char v66 = [v65 createDirectoryAtPath:v50 withIntermediateDirectories:1 attributes:0 error:&v115];
        v55 = v115;

        if ((v66 & 1) == 0)
        {
          id v67 = _BYLoggingFacility();
          if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
          {
            id v68 = v7;
            long long v69 = v50;
            if (_BYIsInternalInstall())
            {
              int v70 = 0;
              long long v71 = v55;
            }
            else if (v55)
            {
              v83 = NSString;
              char v50 = [(BFFSettingsManager *)v55 domain];
              long long v71 = [v83 stringWithFormat:@"<Error domain: %@, code %ld>", v50, -[BFFSettingsManager code](v55, "code")];
              int v70 = 1;
            }
            else
            {
              int v70 = 0;
              long long v71 = 0;
            }
            *(_DWORD *)long long buf = 138412546;
            v132 = v69;
            __int16 v133 = 2114;
            uint64_t v134 = (uint64_t)v71;
            _os_log_impl(&dword_1A7DED000, v67, OS_LOG_TYPE_DEFAULT, "Failed to create target directory %@: %{public}@", buf, 0x16u);
            if (v70)
            {
            }
            char v50 = v69;
            id v7 = v68;
          }
        }
      }
      v86 = [MEMORY[0x1E4F28CB8] defaultManager];
      v114 = v55;
      char v87 = [v86 moveItemAtPath:v107 toPath:v7 error:&v114];
      long long v22 = v114;

      if (v87)
      {
        v48 = 0;
      }
      else
      {
        v88 = _BYLoggingFacility();
        if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
        {
          v89 = v7;
          v90 = v50;
          if (_BYIsInternalInstall())
          {
            int v91 = 0;
            v92 = v22;
          }
          else if (v22)
          {
            v93 = NSString;
            char v50 = [(BFFSettingsManager *)v22 domain];
            v92 = [v93 stringWithFormat:@"<Error domain: %@, code %ld>", v50, -[BFFSettingsManager code](v22, "code")];
            int v91 = 1;
          }
          else
          {
            int v91 = 0;
            v92 = 0;
          }
          *(_DWORD *)long long buf = 138412546;
          v132 = v107;
          __int16 v133 = 2114;
          uint64_t v134 = (uint64_t)v92;
          _os_log_impl(&dword_1A7DED000, v88, OS_LOG_TYPE_DEFAULT, "Failed to move directory into place %@: %{public}@", buf, 0x16u);
          if (v91)
          {
          }
          char v50 = v90;
          id v7 = v89;
        }

        v94 = (void *)MEMORY[0x1E4F28C58];
        v125[0] = @"source";
        v125[1] = @"target";
        v126[0] = v107;
        v126[1] = v7;
        v95 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v126 forKeys:v125 count:2];
        v48 = [v94 errorWithDomain:@"BFFSettingsManagerErrorDomain" code:-2001 userInfo:v95];
      }
      uint64_t v21 = 0;
      goto LABEL_113;
    }
    if (v31)
    {
      v104 = v21;
      uint64_t v32 = [MEMORY[0x1E4F28CB8] defaultManager];
      v113 = v22;
      uint64_t v33 = [v32 contentsOfDirectoryAtPath:v107 error:&v113];
      uint64_t v34 = v113;

      if (v34)
      {
        v35 = _BYLoggingFacility();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          char v36 = _BYIsInternalInstall();
          v37 = v34;
          if ((v36 & 1) == 0)
          {
            v38 = NSString;
            long long v24 = [(BFFSettingsManager *)v34 domain];
            v37 = [v38 stringWithFormat:@"<Error domain: %@, code %ld>", v24, -[BFFSettingsManager code](v34, "code")];
          }
          *(_DWORD *)long long buf = 138412546;
          v132 = v107;
          __int16 v133 = 2114;
          uint64_t v134 = (uint64_t)v37;
          _os_log_impl(&dword_1A7DED000, v35, OS_LOG_TYPE_DEFAULT, "Unable to get contents of %@: %{public}@", buf, 0x16u);
          if ((v36 & 1) == 0)
          {
          }
        }
      }
      long long v111 = 0u;
      long long v112 = 0u;
      long long v109 = 0u;
      long long v110 = 0u;
      obuint64_t j = v33;
      uint64_t v39 = [(BFFSettingsManager *)obj countByEnumeratingWithState:&v109 objects:v122 count:16];
      if (v39)
      {
        uint64_t v40 = v39;
        uint64_t v41 = *(void *)v110;
        while (2)
        {
          for (uint64_t i = 0; i != v40; ++i)
          {
            if (*(void *)v110 != v41) {
              objc_enumerationMutation(obj);
            }
            uint64_t v43 = *(void *)(*((void *)&v109 + 1) + 8 * i);
            uint64_t v44 = [(BFFSettingsManager *)v107 stringByAppendingPathComponent:v43];
            uint64_t v45 = [(BFFSettingsManager *)v7 stringByAppendingPathComponent:v43];
            v46 = [(BFFSettingsManager *)self _shovePath:v44 toPath:v45];

            if (v46)
            {
              long long v22 = v46;

              char v50 = obj;
              v48 = v22;
              goto LABEL_62;
            }

            uint64_t v34 = 0;
          }
          uint64_t v40 = [(BFFSettingsManager *)obj countByEnumeratingWithState:&v109 objects:v122 count:16];
          uint64_t v34 = 0;
          int v47 = 0;
          if (v40) {
            continue;
          }
          break;
        }
      }
      else
      {
        int v47 = v34;
      }
      char v50 = obj;

      __int16 v77 = [MEMORY[0x1E4F28CB8] defaultManager];
      v108 = v47;
      char v78 = [v77 removeItemAtPath:v107 error:&v108];
      long long v22 = v108;

      if (v78)
      {
        v48 = 0;
LABEL_62:
        uint64_t v21 = v104;
        goto LABEL_113;
      }
      __int16 v79 = _BYLoggingFacility();
      uint64_t v21 = v104;
      if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
      {
        if (_BYIsInternalInstall())
        {
          int v80 = 0;
          v81 = v22;
        }
        else if (v22)
        {
          v85 = NSString;
          char v50 = [(BFFSettingsManager *)v22 domain];
          v81 = [v85 stringWithFormat:@"<Error domain: %@, code %ld>", v50, -[BFFSettingsManager code](v22, "code")];
          int v80 = 1;
        }
        else
        {
          int v80 = 0;
          v81 = 0;
        }
        *(_DWORD *)long long buf = 138412546;
        v132 = v107;
        __int16 v133 = 2114;
        uint64_t v134 = (uint64_t)v81;
        _os_log_impl(&dword_1A7DED000, v79, OS_LOG_TYPE_DEFAULT, "Unable to remove source directory %@: %{public}@", buf, 0x16u);
        if (v80)
        {
        }
        char v50 = obj;
      }

      long long v62 = v22;
      long long v22 = v62;
      goto LABEL_44;
    }
    char v61 = (void *)MEMORY[0x1E4F28C58];
    v123[0] = @"source";
    v123[1] = @"target";
    v124[0] = v107;
    v124[1] = v7;
    char v50 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v124 forKeys:v123 count:2];
    int v51 = v61;
    uint64_t v52 = -2002;
LABEL_43:
    long long v62 = [v51 errorWithDomain:@"BFFSettingsManagerErrorDomain" code:v52 userInfo:v50];
LABEL_44:
    v48 = v62;
LABEL_113:

    goto LABEL_114;
  }
  if (v21)
  {
    if (v31)
    {
      unint64_t v49 = (void *)MEMORY[0x1E4F28C58];
      v129[0] = @"source";
      v129[1] = @"target";
      v130[0] = v107;
      v130[1] = v7;
      char v50 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v130 forKeys:v129 count:2];
      int v51 = v49;
      uint64_t v52 = -2003;
      goto LABEL_43;
    }
    v56 = v21;
    long long v63 = [MEMORY[0x1E4F28CB8] defaultManager];
    v117 = v22;
    uint64_t v64 = [v63 removeItemAtPath:v7 error:&v117];
    v60 = v117;

    if (v64)
    {
      unint64_t v57 = 0x1E4F28000;
      goto LABEL_102;
    }
    _BYLoggingFacility();
    self = (BFFSettingsManager *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(&self->super, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_100;
    }
    if (_BYIsInternalInstall())
    {
      int v76 = 0;
      uint64_t v19 = (uint64_t)v60;
    }
    else if (v60)
    {
      uint64_t v82 = NSString;
      uint64_t v64 = [(BFFSettingsManager *)v60 domain];
      uint64_t v19 = [v82 stringWithFormat:@"<Error domain: %@, code %ld>", v64, -[BFFSettingsManager code](v60, "code")];
      int v76 = 1;
    }
    else
    {
      int v76 = 0;
      uint64_t v19 = 0;
    }
    *(_DWORD *)long long buf = 138412546;
    v132 = v7;
    __int16 v133 = 2114;
    uint64_t v134 = v19;
    _os_log_impl(&dword_1A7DED000, &self->super, OS_LOG_TYPE_DEFAULT, "Unable to remove file at path: %@ - %{public}@", buf, 0x16u);
    if (!v76) {
      goto LABEL_100;
    }
    goto LABEL_98;
  }
  v56 = 0;
  self = [(BFFSettingsManager *)v7 stringByDeletingLastPathComponent];
  unint64_t v57 = 0x1E4F28000uLL;
  v58 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v59 = [v58 fileExistsAtPath:self];

  if (v59)
  {
    v60 = v22;
  }
  else
  {
    long long v72 = [MEMORY[0x1E4F28CB8] defaultManager];
    v118 = v22;
    char v73 = [v72 createDirectoryAtPath:self withIntermediateDirectories:1 attributes:0 error:&v118];
    v60 = v118;

    if ((v73 & 1) == 0)
    {
      uint64_t v64 = _BYLoggingFacility();
      if (!os_log_type_enabled((os_log_t)v64, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_99;
      }
      if (_BYIsInternalInstall())
      {
        int v74 = 0;
        v75 = v60;
      }
      else if (v60)
      {
        v84 = NSString;
        uint64_t v19 = [(BFFSettingsManager *)v60 domain];
        v75 = [v84 stringWithFormat:@"<Error domain: %@, code %ld>", v19, -[BFFSettingsManager code](v60, "code")];
        int v74 = 1;
      }
      else
      {
        int v74 = 0;
        v75 = 0;
      }
      *(_DWORD *)long long buf = 138412546;
      v132 = self;
      __int16 v133 = 2114;
      uint64_t v134 = (uint64_t)v75;
      _os_log_impl(&dword_1A7DED000, (os_log_t)v64, OS_LOG_TYPE_DEFAULT, "Failed to create target directory %@: %{public}@", buf, 0x16u);
      if (!v74) {
        goto LABEL_99;
      }

LABEL_98:
LABEL_99:

LABEL_100:
      unint64_t v57 = 0x1E4F28000uLL;
    }
  }

LABEL_102:
  v96 = [*(id *)(v57 + 3256) defaultManager];
  v116 = v60;
  char v97 = [v96 moveItemAtPath:v107 toPath:v7 error:&v116];
  long long v22 = v116;

  if ((v97 & 1) == 0)
  {
    v98 = _BYLoggingFacility();
    if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
    {
      if (_BYIsInternalInstall())
      {
        int v99 = 0;
        v100 = v22;
      }
      else if (v22)
      {
        v101 = NSString;
        self = [(BFFSettingsManager *)v22 domain];
        v100 = [v101 stringWithFormat:@"<Error domain: %@, code %ld>", self, -[BFFSettingsManager code](v22, "code")];
        int v99 = 1;
      }
      else
      {
        int v99 = 0;
        v100 = 0;
      }
      *(_DWORD *)long long buf = 138412546;
      v132 = v107;
      __int16 v133 = 2114;
      uint64_t v134 = (uint64_t)v100;
      _os_log_impl(&dword_1A7DED000, v98, OS_LOG_TYPE_DEFAULT, "Failed to move directory into place %@: %{public}@", buf, 0x16u);
      if (v99)
      {
      }
    }

    v102 = (void *)MEMORY[0x1E4F28C58];
    v127[0] = @"source";
    v127[1] = @"target";
    v128[0] = v107;
    v128[1] = v7;
    char v50 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v128 forKeys:v127 count:2];
    v48 = [v102 errorWithDomain:@"BFFSettingsManagerErrorDomain" code:-2001 userInfo:v50];
    uint64_t v21 = v56;
    goto LABEL_113;
  }
  v48 = 0;
  uint64_t v21 = v56;
LABEL_114:

  uint64_t v11 = v22;
  uint64_t v10 = v106;
LABEL_115:

  return v48;
}

+ (BOOL)removeSafeHaven
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  BOOL v2 = _BYLoggingFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1A7DED000, v2, OS_LOG_TYPE_DEFAULT, "Removing safe haven on disk...", buf, 2u);
  }

  id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v23 = 0;
  char v4 = [v3 removeItemAtPath:@"/private/var/buddy/Configuration.plist" error:&v23];
  id v5 = v23;

  if ((v4 & 1) == 0)
  {
    dispatch_semaphore_t v6 = [v5 domain];
    id v7 = v6;
    if (v6 == (void *)*MEMORY[0x1E4F281F8])
    {
    }
    else
    {
      BOOL v8 = (void *)[v5 code];

      if (v8 != (void *)4)
      {
        uint64_t v9 = _BYLoggingFacility();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          if (_BYIsInternalInstall())
          {
            int v10 = 0;
            uint64_t v11 = v5;
          }
          else if (v5)
          {
            uint64_t v19 = NSString;
            BOOL v8 = [v5 domain];
            uint64_t v11 = [v19 stringWithFormat:@"<Error domain: %@, code %ld>", v8, objc_msgSend(v5, "code")];
            int v10 = 1;
          }
          else
          {
            int v10 = 0;
            uint64_t v11 = 0;
          }
          *(_DWORD *)long long buf = 138543362;
          long long v25 = v11;
          _os_log_impl(&dword_1A7DED000, v9, OS_LOG_TYPE_DEFAULT, "Unable to remove existing safe haven configuration: %{public}@", buf, 0xCu);
          if (v10)
          {
          }
        }
        BOOL v16 = 0;
        goto LABEL_31;
      }
    }
  }
  uint64_t v12 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v22 = v5;
  char v13 = [v12 removeItemAtPath:@"/private/var/buddy/Root/" error:&v22];
  id v14 = v22;

  if ((v13 & 1) == 0)
  {
    uint64_t v9 = [v14 domain];
    if (v9 == *MEMORY[0x1E4F281F8])
    {
      BOOL v16 = 1;
    }
    else
    {
      uint64_t v15 = (void *)[v14 code];

      if (v15 == (void *)4) {
        goto LABEL_13;
      }
      uint64_t v9 = _BYLoggingFacility();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        if (_BYIsInternalInstall())
        {
          int v17 = 0;
          uint64_t v18 = v14;
        }
        else if (v14)
        {
          long long v20 = NSString;
          uint64_t v15 = [v14 domain];
          uint64_t v18 = [v20 stringWithFormat:@"<Error domain: %@, code %ld>", v15, objc_msgSend(v14, "code")];
          int v17 = 1;
        }
        else
        {
          int v17 = 0;
          uint64_t v18 = 0;
        }
        *(_DWORD *)long long buf = 138543362;
        long long v25 = v18;
        _os_log_impl(&dword_1A7DED000, v9, OS_LOG_TYPE_DEFAULT, "Unable to remove existing safe haven paths: %{public}@", buf, 0xCu);
        if (v17)
        {
        }
      }
      BOOL v16 = 0;
    }
    id v5 = v14;
LABEL_31:

    id v14 = v5;
    goto LABEL_32;
  }
LABEL_13:
  BOOL v16 = 1;
LABEL_32:

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedConfiguration, 0);
  objc_storeStrong((id *)&self->_flowSkipController, 0);
  objc_storeStrong((id *)&self->_stashedActionButtonData, 0);
  objc_storeStrong((id *)&self->_stashedSiriLanguage, 0);
  objc_storeStrong((id *)&self->_stashedSiriOutputVoice, 0);
  objc_storeStrong((id *)&self->_stashedAnalytics, 0);
  objc_storeStrong((id *)&self->_stashedSeedEnrollmentProgramID, 0);
  objc_storeStrong((id *)&self->_stashedSeedEnrollmentAssetAudience, 0);
  objc_storeStrong((id *)&self->_stashedSeedEnrollmentProgramName, 0);
  objc_storeStrong((id *)&self->_stashedUserInterfaceStyleMode, 0);
  objc_storeStrong((id *)&self->_stashedAccessibilityData, 0);
  objc_storeStrong((id *)&self->_stashedAutoDownloadEnabled, 0);
  objc_storeStrong((id *)&self->_stashedAutoUpdateEnabled, 0);
  objc_storeStrong((id *)&self->_stashedWebContentFilteringEnabled, 0);
  objc_storeStrong((id *)&self->_stashedScreenTimeEnabled, 0);
  objc_storeStrong((id *)&self->_stashedFlowSkipIdentifiers, 0);
  objc_storeStrong((id *)&self->_stashedWatchData, 0);
  objc_storeStrong((id *)&self->_stashedLocationServicesSettings, 0);
  objc_storeStrong((id *)&self->_stashedLocationServicesEnabled, 0);
  objc_storeStrong((id *)&self->_stashedSiriDataSharingOptInStatus, 0);
  objc_storeStrong((id *)&self->_stashedAssistantVoiceTriggerEnabled, 0);
  objc_storeStrong((id *)&self->_stashedAssistantEnabled, 0);
  objc_storeStrong((id *)&self->_stashedManagedConfigurationSettings, 0);
  objc_storeStrong((id *)&self->_stashedPreferences, 0);
  objc_storeStrong((id *)&self->_stashedPaths, 0);
}

+ (void)loadConfigurationFromDisk
{
  int v9 = _BYIsInternalInstall();
  if ((v9 & 1) == 0)
  {
    int v10 = NSString;
    v1 = [a1 domain];
    uint64_t v11 = (uint64_t)v1;
    uint64_t v12 = [a1 code];
    a1 = [v10 stringWithFormat:@"<Error domain: %@, code %ld>"];
  }
  OUTLINED_FUNCTION_0_1(&dword_1A7DED000, v3, v4, "Unable to read configuration for stash values: %{public}@", v5, v6, v7, v8, v11, v12, 2u);
  if (!v9)
  {
  }
}

void __56__BFFSettingsManager_hideStashInSafeHavenAsProvisional___block_invoke_cold_1(void *a1)
{
  int v9 = _BYIsInternalInstall();
  if ((v9 & 1) == 0)
  {
    int v10 = NSString;
    v1 = [a1 domain];
    uint64_t v11 = (uint64_t)v1;
    uint64_t v12 = [a1 code];
    a1 = [v10 stringWithFormat:@"<Error domain: %@, code %ld>"];
  }
  OUTLINED_FUNCTION_0_1(&dword_1A7DED000, v3, v4, "Failed to get Siri data sharing opt-in status for stashing: %{public}@", v5, v6, v7, v8, v11, v12, 2u);
  if (!v9)
  {
  }
}

void __48__BFFSettingsManager__applyAssistantPreferences__block_invoke_cold_1(void *a1)
{
  int v9 = _BYIsInternalInstall();
  if ((v9 & 1) == 0)
  {
    int v10 = NSString;
    v1 = [a1 domain];
    uint64_t v11 = (uint64_t)v1;
    uint64_t v12 = [a1 code];
    a1 = [v10 stringWithFormat:@"<Error domain: %@, code %ld>"];
  }
  OUTLINED_FUNCTION_0_1(&dword_1A7DED000, v3, v4, "Failed to set Siri data sharing opt-in: %{public}@", v5, v6, v7, v8, v11, v12, 2u);
  if (!v9)
  {
  }
}

@end