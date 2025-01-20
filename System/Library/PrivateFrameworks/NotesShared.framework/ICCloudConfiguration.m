@interface ICCloudConfiguration
+ (BOOL)isConfigurationValid:(id)a3;
+ (ICCloudConfiguration)sharedConfiguration;
+ (NSArray)availableConfigurationURLs;
+ (NSURL)defaultConfigurationURL;
+ (id)cachedConfigurationURL;
+ (id)cloudConfigurationQueue;
+ (id)overridableValueForKey:(id)a3 inConfigurationDictionary:(id)a4 userDefaults:(id)a5;
+ (void)availableConfigurationURLs;
+ (void)loadSharedConfigurationWithCompletionHandler:(id)a3;
+ (void)loadSharedConfigurationWithQoSClass:(unsigned int)a3 completionHandler:(id)a4;
+ (void)setDefaultConfigurationURL:(id)a3;
- (BOOL)audioTranscriptPostProcessingEnabled;
- (BOOL)fastSyncEnabled;
- (BOOL)fastSyncPaperKitEnableEphemeralRecords;
- (BOOL)fastSyncPaperKitEnablePCSEncryption;
- (BOOL)keychainFetchingEnabled;
- (BOOL)requestUserNotificationAuthorizationAtLaunch;
- (BOOL)shouldPerformTopHitSearch;
- (BOOL)shouldSyncWhenEnteringForeground;
- (BOOL)usesLocalConfigurationFile;
- (ICCloudConfiguration)initWithConfigurationDictionary:(id)a3 userDefaults:(id)a4 usesLocalConfigurationFile:(BOOL)a5;
- (ICCloudConfiguration)initWithUserDefaults:(id)a3;
- (ICCloudConfiguration)initWithUserDefaults:(id)a3 usesLocalConfigurationFile:(BOOL)a4;
- (ICCloudThrottlingPolicy)throttlingPolicy;
- (NSDictionary)configurationDictionary;
- (NSNumber)maximumAttachmentSizeMB;
- (NSString)minimumClientVersion;
- (double)appStoreRatingIdleTimeInterval;
- (double)fastSyncPresenceDebounceDuration;
- (double)keychainFetchErrorTimeout;
- (double)keychainMaximumSyncInterval;
- (double)keychainMinimumSyncInterval;
- (id)overridableValueForKey:(id)a3 inConfigurationDictionary:(id)a4;
- (unint64_t)appStoreRatingCohortPercentage;
- (unint64_t)appStoreRatingLaunchCount;
- (unint64_t)appStoreRatingLaunchDayPeriod;
- (unint64_t)appStoreRatingNoteCount;
- (unint64_t)appStoreRatingOldestLaunchDayPeriod;
- (unint64_t)appStoreRatingRequestDayPeriod;
- (unint64_t)durationForNextPasswordReask;
- (unint64_t)fastSyncMaximumMessageSizeBytes;
- (unint64_t)fastSyncMaximumThumbnailMessageSizeBytes;
- (unint64_t)launchTaskMaxRetries;
- (unint64_t)maxAttachmentsPerNote;
- (unint64_t)maxInlineAssetSizeBytes;
- (unint64_t)maxSubAttachmentsPerAttachment;
- (unint64_t)mentionNotificationMaxRetries;
- (unint64_t)resultsLimitPerSyncOperation;
- (unint64_t)serverSideUpdateTaskMaxFailureCount;
- (unint64_t)unsupportedNoteDeviceCheckIntervalSeconds;
- (void)dealloc;
- (void)downloadConfigurationFromRemoteURL:(id)a3 completionHandler:(id)a4;
- (void)downloadRemoteConfiguration:(id)a3;
- (void)loadConfigurationFromURL:(id)a3;
- (void)loadConfigurationFromURL:(id)a3 completionHandler:(id)a4;
- (void)loadLocalConfigurationFile;
- (void)setConfigurationFromDictionary:(id)a3;
- (void)setDownloadTimer:(uint64_t)a1;
@end

@implementation ICCloudConfiguration

void __59__ICCloudConfiguration_SharedInstance__sharedConfiguration__block_invoke()
{
  if ([MEMORY[0x1E4F29060] isMainThread]) {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"![NSThread isMainThread]" functionName:"+[ICCloudConfiguration(SharedInstance) sharedConfiguration]_block_invoke" simulateCrash:1 showAlert:0 format:@"Unexpected call from main thread"];
  }
  v0 = [ICCloudConfiguration alloc];
  id v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v1 = [(ICCloudConfiguration *)v0 initWithUserDefaults:v3];
  v2 = (void *)sharedConfiguration_sharedConfiguration;
  sharedConfiguration_sharedConfiguration = v1;
}

- (ICCloudConfiguration)initWithUserDefaults:(id)a3 usesLocalConfigurationFile:(BOOL)a4
{
  BOOL v4 = a4;
  v5 = [(ICCloudConfiguration *)self initWithConfigurationDictionary:MEMORY[0x1E4F1CC08] userDefaults:a3 usesLocalConfigurationFile:a4];
  v6 = v5;
  if (v5)
  {
    if (v4) {
      [(ICCloudConfiguration *)v5 loadLocalConfigurationFile];
    }
    dispatch_time_t v7 = dispatch_time(0, 2000000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__ICCloudConfiguration_initWithUserDefaults_usesLocalConfigurationFile___block_invoke;
    block[3] = &unk_1E64A4240;
    v10 = v6;
    dispatch_after(v7, MEMORY[0x1E4F14428], block);
  }
  return v6;
}

- (void)loadLocalConfigurationFile
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1C3A61000, v0, v1, "Using default configuration", v2, v3, v4, v5, v6);
}

- (ICCloudConfiguration)initWithUserDefaults:(id)a3
{
  return [(ICCloudConfiguration *)self initWithUserDefaults:a3 usesLocalConfigurationFile:1];
}

- (ICCloudConfiguration)initWithConfigurationDictionary:(id)a3 userDefaults:(id)a4 usesLocalConfigurationFile:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)ICCloudConfiguration;
  v10 = [(ICCloudConfiguration *)&v15 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    v12 = (void *)v11;
    if (v11) {
      v13 = (void *)v11;
    }
    else {
      v13 = (void *)MEMORY[0x1E4F1CC08];
    }
    objc_storeStrong((id *)&v10->_configurationDictionary, v13);

    v10->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v10->_userDefaults, a4);
    v10->_usesLocalConfigurationFile = a5;
  }

  return v10;
}

+ (BOOL)isConfigurationValid:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a3 objectForKeyedSubscript:@"configurationVersion"];
  uint64_t v4 = v3;
  if (!v3)
  {
    uint8_t v6 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_1C3A61000, v6, OS_LOG_TYPE_DEFAULT, "Configuration has no version", (uint8_t *)&v8, 2u);
    }
    goto LABEL_9;
  }
  if ([v3 unsignedIntegerValue] != 11)
  {
    uint8_t v6 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 134218240;
      uint64_t v9 = [v4 unsignedIntegerValue];
      __int16 v10 = 2048;
      uint64_t v11 = 11;
      _os_log_impl(&dword_1C3A61000, v6, OS_LOG_TYPE_DEFAULT, "Configuration version (%ld) is not the expected version (%ld)", (uint8_t *)&v8, 0x16u);
    }

LABEL_9:
    BOOL v5 = 0;
    goto LABEL_10;
  }
  BOOL v5 = 1;
LABEL_10:

  return v5;
}

+ (id)cachedConfigurationURL
{
  uint64_t v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v3 = [v2 URLForDirectory:13 inDomain:1 appropriateForURL:0 create:1 error:0];

  uint64_t v4 = [v3 URLByAppendingPathComponent:@"RemoteConfiguration" isDirectory:0];
  BOOL v5 = [v4 URLByAppendingPathExtension:@"plist"];

  return v5;
}

void __94__ICCloudConfiguration_SharedInstance__loadSharedConfigurationWithQoSClass_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) sharedConfiguration];
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    uint64_t v4 = v2;
    (*(void (**)(void))(v3 + 16))();
    uint64_t v2 = v4;
  }
}

+ (ICCloudConfiguration)sharedConfiguration
{
  if (sharedConfiguration_onceToken != -1) {
    dispatch_once(&sharedConfiguration_onceToken, &__block_literal_global_365);
  }
  uint64_t v2 = (void *)sharedConfiguration_sharedConfiguration;
  return (ICCloudConfiguration *)v2;
}

- (ICCloudThrottlingPolicy)throttlingPolicy
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = self->_throttlingPolicy;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSString)minimumClientVersion
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = self->_minimumClientVersion;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setConfigurationFromDictionary:(id)a3
{
  uint64_t v210 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 copy];
  uint8_t v6 = (void *)v5;
  if (v5) {
    dispatch_time_t v7 = (void *)v5;
  }
  else {
    dispatch_time_t v7 = (void *)MEMORY[0x1E4F1CC08];
  }
  id v8 = v7;

  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_storeStrong((id *)&self->_configurationDictionary, v7);
  uint64_t v9 = [v8 objectForKeyedSubscript:@"minimumClientVersions"];
  __int16 v10 = v9;
  if (v9
    && ([v9 objectForKeyedSubscript:@"iOS"],
        uint64_t v11 = objc_claimAutoreleasedReturnValue(),
        v11,
        v11))
  {
    uint64_t v12 = [v10 objectForKeyedSubscript:@"iOS"];
    minimumClientVersion = self->_minimumClientVersion;
    self->_minimumClientVersion = v12;
  }
  else
  {
    v14 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3A61000, v14, OS_LOG_TYPE_DEFAULT, "Trying to create a cloud configuration with no minimum client version", buf, 2u);
    }

    minimumClientVersion = self->_minimumClientVersion;
    self->_minimumClientVersion = (NSString *)@"9,0,0";
  }

  objc_super v15 = [v8 objectForKeyedSubscript:@"throttlingPolicyResetIntervalSeconds"];
  [v15 doubleValue];
  double v17 = v16;

  if (v17 == 0.0) {
    double v17 = 86400.0;
  }
  uint64_t v18 = [v8 objectForKeyedSubscript:@"throttlingPolicy"];
  v194 = v10;
  v195 = self;
  v193 = (void *)v18;
  if (v18)
  {
    v19 = (void *)v18;
    id v190 = v8;
    v20 = [MEMORY[0x1E4F1CA48] array];
    long long v200 = 0u;
    long long v201 = 0u;
    long long v202 = 0u;
    long long v203 = 0u;
    id obj = v19;
    uint64_t v21 = [obj countByEnumeratingWithState:&v200 objects:v209 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v201;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v201 != v23) {
            objc_enumerationMutation(obj);
          }
          v25 = *(void **)(*((void *)&v200 + 1) + 8 * i);
          v26 = [v25 objectForKeyedSubscript:@"count"];
          uint64_t v27 = [v26 unsignedIntegerValue];

          v28 = [v25 objectForKeyedSubscript:@"intervalSeconds"];
          [v28 doubleValue];
          double v30 = v29;

          v31 = [v25 objectForKeyedSubscript:@"maximumIntervalFactor"];
          [v31 doubleValue];
          double v33 = v32;

          v34 = [[ICCloudThrottlingLevel alloc] initWithBatchInterval:v27 maximumBatchIntervalFactor:v30 numberOfBatches:v33];
          [(ICCloudThrottlingLevel *)v20 addObject:v34];
        }
        uint64_t v22 = [obj countByEnumeratingWithState:&v200 objects:v209 count:16];
      }
      while (v22);
    }

    v35 = [[ICCloudThrottlingPolicy alloc] initWithThrottlingLevels:v20 resetInterval:v17];
    self = v195;
    throttlingPolicy = v195->_throttlingPolicy;
    v195->_throttlingPolicy = v35;
    id v8 = v190;
  }
  else
  {
    v37 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3A61000, v37, OS_LOG_TYPE_DEFAULT, "Trying to create a cloud configuration with no throttling levels", buf, 2u);
    }

    v20 = [[ICCloudThrottlingLevel alloc] initWithBatchInterval:0 maximumBatchIntervalFactor:60.0 numberOfBatches:5.0];
    v38 = [ICCloudThrottlingPolicy alloc];
    v208 = v20;
    throttlingPolicy = [MEMORY[0x1E4F1C978] arrayWithObjects:&v208 count:1];
    v39 = [(ICCloudThrottlingPolicy *)v38 initWithThrottlingLevels:throttlingPolicy resetInterval:v17];
    v40 = self->_throttlingPolicy;
    self->_throttlingPolicy = v39;
  }
  objc_opt_class();
  v41 = [(ICCloudConfiguration *)self overridableValueForKey:@"appStoreRatingCohortPercentage" inConfigurationDictionary:v8];
  v42 = ICDynamicCast();

  id obja = v42;
  if (v42)
  {
    unint64_t v43 = [v42 unsignedIntegerValue];
  }
  else
  {
    v44 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3A61000, v44, OS_LOG_TYPE_DEFAULT, "Trying to create a cloud configuration with no app store rating cohort percentage", buf, 2u);
    }

    unint64_t v43 = 0;
  }
  self->_appStoreRatingCohortPercentage = v43;
  objc_opt_class();
  v45 = [(ICCloudConfiguration *)self overridableValueForKey:@"appStoreRatingIdleTimeInterval" inConfigurationDictionary:v8];
  v46 = ICDynamicCast();

  v191 = v46;
  if (v46)
  {
    [v46 doubleValue];
  }
  else
  {
    v48 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3A61000, v48, OS_LOG_TYPE_DEFAULT, "Trying to create a cloud configuration with no app store rating idle time interval", buf, 2u);
    }

    double v47 = 5.0;
  }
  self->_appStoreRatingIdleTimeInterval = v47;
  objc_opt_class();
  v49 = [(ICCloudConfiguration *)self overridableValueForKey:@"appStoreRatingLaunchCount" inConfigurationDictionary:v8];
  v50 = ICDynamicCast();

  v189 = v50;
  if (v50)
  {
    unint64_t v51 = [v50 unsignedIntegerValue];
  }
  else
  {
    v52 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3A61000, v52, OS_LOG_TYPE_DEFAULT, "Trying to create a cloud configuration with no app store rating launch count", buf, 2u);
    }

    unint64_t v51 = 3;
  }
  self->_appStoreRatingLaunchCount = v51;
  objc_opt_class();
  v53 = [(ICCloudConfiguration *)self overridableValueForKey:@"appStoreRatingLaunchDayPeriod" inConfigurationDictionary:v8];
  v54 = ICDynamicCast();

  v188 = v54;
  if (v54)
  {
    unint64_t v55 = [v54 unsignedIntegerValue];
  }
  else
  {
    v56 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3A61000, v56, OS_LOG_TYPE_DEFAULT, "Trying to create a cloud configuration with no app store rating launch day period", buf, 2u);
    }

    unint64_t v55 = 30;
  }
  self->_appStoreRatingLaunchDayPeriod = v55;
  objc_opt_class();
  v57 = [(ICCloudConfiguration *)self overridableValueForKey:@"appStoreRatingOldestLaunchDayPeriod" inConfigurationDictionary:v8];
  v58 = ICDynamicCast();

  v187 = v58;
  if (v58)
  {
    unint64_t v59 = [v58 unsignedIntegerValue];
  }
  else
  {
    v60 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3A61000, v60, OS_LOG_TYPE_DEFAULT, "Trying to create a cloud configuration with no app store rating oldest launch day period", buf, 2u);
    }

    unint64_t v59 = 7;
  }
  self->_appStoreRatingOldestLaunchDayPeriod = v59;
  objc_opt_class();
  v61 = [(ICCloudConfiguration *)self overridableValueForKey:@"appStoreRatingNoteCount" inConfigurationDictionary:v8];
  v62 = ICDynamicCast();

  v186 = v62;
  if (v62)
  {
    unint64_t v63 = [v62 unsignedIntegerValue];
  }
  else
  {
    v64 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3A61000, v64, OS_LOG_TYPE_DEFAULT, "Trying to create a cloud configuration with no app store rating note count", buf, 2u);
    }

    unint64_t v63 = 100;
  }
  self->_appStoreRatingNoteCount = v63;
  objc_opt_class();
  v65 = [(ICCloudConfiguration *)self overridableValueForKey:@"appStoreRatingRequestDayPeriod" inConfigurationDictionary:v8];
  v66 = ICDynamicCast();

  v185 = v66;
  if (v66)
  {
    unint64_t v67 = [v66 unsignedIntegerValue];
  }
  else
  {
    v68 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3A61000, v68, OS_LOG_TYPE_DEFAULT, "Trying to create a cloud configuration with no app store rating request day period", buf, 2u);
    }

    unint64_t v67 = 120;
  }
  self->_appStoreRatingRequestDayPeriod = v67;
  objc_opt_class();
  v69 = [(ICCloudConfiguration *)self overridableValueForKey:@"maxInlineAssetSizeBytes" inConfigurationDictionary:v8];
  v70 = ICDynamicCast();

  v184 = v70;
  if (v70)
  {
    unint64_t v71 = [v70 unsignedIntegerValue];
  }
  else
  {
    v72 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3A61000, v72, OS_LOG_TYPE_DEFAULT, "Trying to create a cloud configuration with no max inline asset size", buf, 2u);
    }

    unint64_t v71 = 0x80000;
  }
  self->_maxInlineAssetSizeBytes = v71;
  objc_opt_class();
  v73 = [(ICCloudConfiguration *)self overridableValueForKey:@"maxAttachmentsPerNote" inConfigurationDictionary:v8];
  v74 = ICDynamicCast();

  v75 = os_log_create("com.apple.notes", "Cloud");
  BOOL v76 = os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT);
  v183 = v74;
  if (v74)
  {
    if (v76)
    {
      uint64_t v77 = [v74 unsignedIntegerValue];
      *(_DWORD *)buf = 134217984;
      v207 = (__CFString *)v77;
      _os_log_impl(&dword_1C3A61000, v75, OS_LOG_TYPE_DEFAULT, "Maximum attachments per note %lu", buf, 0xCu);
    }

    unint64_t v78 = [v74 unsignedIntegerValue];
  }
  else
  {
    if (v76)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3A61000, v75, OS_LOG_TYPE_DEFAULT, "Trying to create a cloud configuration with no max attachments per note", buf, 2u);
    }

    unint64_t v78 = 100;
  }
  self->_maxAttachmentsPerNote = v78;
  objc_opt_class();
  v79 = [(ICCloudConfiguration *)self overridableValueForKey:@"maxSubAttachmentsPerAttachment" inConfigurationDictionary:v8];
  v80 = ICDynamicCast();

  v182 = v80;
  if (v80)
  {
    unint64_t v81 = [v80 unsignedIntegerValue];
  }
  else
  {
    v82 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3A61000, v82, OS_LOG_TYPE_DEFAULT, "Trying to create a cloud configuration with no max sub attachments per attachment", buf, 2u);
    }

    unint64_t v81 = 24;
  }
  self->_maxSubAttachmentsPerAttachment = v81;
  v83 = [v8 objectForKeyedSubscript:@"shouldSyncWhenEnteringForeground"];
  v84 = v83;
  if (v83)
  {
    v85 = [v83 objectForKeyedSubscript:@"iOS"];
    self->_shouldSyncWhenEnteringForeground = [v85 BOOLValue];
  }
  v181 = v84;
  objc_opt_class();
  v86 = [(ICCloudConfiguration *)self overridableValueForKey:@"maximumAttachmentSizeMB" inConfigurationDictionary:v8];
  v87 = ICDynamicCast();

  v180 = v87;
  if (v87)
  {
    v88 = v87;
  }
  else
  {
    v89 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3A61000, v89, OS_LOG_TYPE_DEFAULT, "Trying to create a cloud configuration with no max attachment size", buf, 2u);
    }

    v88 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:0x4000];
  }
  maximumAttachmentSizeMB = self->_maximumAttachmentSizeMB;
  self->_maximumAttachmentSizeMB = v88;

  objc_opt_class();
  v91 = [(ICCloudConfiguration *)self overridableValueForKey:@"resultsLimitPerSyncOperation" inConfigurationDictionary:v8];
  v92 = ICDynamicCast();

  v179 = v92;
  if (v92) {
    unint64_t v93 = [v92 unsignedIntegerValue];
  }
  else {
    unint64_t v93 = 50;
  }
  self->_resultsLimitPerSyncOperation = v93;
  objc_opt_class();
  v94 = [(ICCloudConfiguration *)self overridableValueForKey:@"shouldPerformTopHit" inConfigurationDictionary:v8];
  v95 = ICDynamicCast();

  v178 = v95;
  if (v95)
  {
    self->_shouldPerformTopHitSearch = [v95 BOOLValue];
  }
  else
  {
    v96 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3A61000, v96, OS_LOG_TYPE_DEFAULT, "Trying to create a cloud configuration not knowing whether or not the Top Hit Search Query should be enabled. Enabling it by default", buf, 2u);
    }

    self->_shouldPerformTopHitSearch = 1;
  }
  objc_opt_class();
  v97 = [(ICCloudConfiguration *)self overridableValueForKey:@"mentionNotificationMaxRetries" inConfigurationDictionary:v8];
  v98 = ICDynamicCast();

  v177 = v98;
  if (v98)
  {
    unint64_t v99 = [v98 unsignedIntegerValue];
  }
  else
  {
    v100 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3A61000, v100, OS_LOG_TYPE_DEFAULT, "Trying to create a cloud configuration with no mentionNotificationMaxRetries value", buf, 2u);
    }

    unint64_t v99 = 10;
  }
  self->_mentionNotificationMaxRetries = v99;
  objc_opt_class();
  v101 = [(ICCloudConfiguration *)self overridableValueForKey:@"launchTaskMaxRetries" inConfigurationDictionary:v8];
  v102 = ICDynamicCast();

  if (v102)
  {
    unint64_t v103 = [v102 unsignedIntegerValue];
  }
  else
  {
    v104 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3A61000, v104, OS_LOG_TYPE_DEFAULT, "Trying to create a cloud configuration with no launchTaskMaxRetryNumber value", buf, 2u);
    }

    unint64_t v103 = 10;
  }
  self->_launchTaskMaxRetries = v103;
  objc_opt_class();
  v105 = [(ICCloudConfiguration *)self overridableValueForKey:@"serverSideUpdateTaskMaxFailureCount" inConfigurationDictionary:v8];
  uint64_t v106 = ICDynamicCast();

  v175 = (void *)v106;
  if (v106)
  {
    unint64_t v107 = [v102 unsignedIntegerValue];
  }
  else
  {
    v108 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3A61000, v108, OS_LOG_TYPE_DEFAULT, "Trying to create a cloud configuration with no serverSideUpdateTaskMaxFailureCount value", buf, 2u);
    }

    unint64_t v107 = 10;
  }
  self->_serverSideUpdateTaskMaxFailureCount = v107;
  v109 = [v8 objectForKeyedSubscript:@"durationInSecondsForNextPasswordReask"];
  v174 = v109;
  if (v109)
  {
    unint64_t v110 = [v109 unsignedIntegerValue];
  }
  else
  {
    v111 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3A61000, v111, OS_LOG_TYPE_DEFAULT, "Trying to create a cloud configuration with no durationForNextPasswordReask value", buf, 2u);
    }

    unint64_t v110 = 1209600;
  }
  self->_durationForNextPasswordReask = v110;
  objc_opt_class();
  v112 = [(ICCloudConfiguration *)self overridableValueForKey:@"unsupportedNoteDeviceCheckIntervalSeconds" inConfigurationDictionary:v8];
  v113 = ICDynamicCast();

  v173 = v113;
  if (v113)
  {
    unint64_t v114 = [v113 unsignedIntegerValue];
  }
  else
  {
    v115 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3A61000, v115, OS_LOG_TYPE_DEFAULT, "Trying to create a cloud configuration with no unsupportedNoteDeviceCheckIntervalSecondsNumber value", buf, 2u);
    }

    unint64_t v114 = 86400;
  }
  self->_unsupportedNoteDeviceCheckIntervalSeconds = v114;
  objc_opt_class();
  v116 = [(ICCloudConfiguration *)self overridableValueForKey:@"requestUserNotificationAuthorizationAtLaunch" inConfigurationDictionary:v8];
  v117 = ICDynamicCast();

  v172 = v117;
  if (v117)
  {
    self->_requestUserNotificationAuthorizationAtLaunch = [v117 BOOLValue];
  }
  else
  {
    v118 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v118, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3A61000, v118, OS_LOG_TYPE_DEFAULT, "Trying to create a cloud configuration with requestUserNotificationAuthorizationAtLaunch missing. We will check for shared objects before requesting authorization for user notifications at launch by default", buf, 2u);
    }

    self->_requestUserNotificationAuthorizationAtLaunch = 0;
  }
  objc_opt_class();
  v119 = [(ICCloudConfiguration *)self overridableValueForKey:@"fastSyncEnabled" inConfigurationDictionary:v8];
  v120 = ICDynamicCast();

  v171 = v120;
  if (v120)
  {
    self->_fastSyncEnabled = [v120 BOOLValue];
  }
  else
  {
    v121 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v121, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3A61000, v121, OS_LOG_TYPE_DEFAULT, "Trying to create a cloud configuration with no fastSyncEnabled value", buf, 2u);
    }

    self->_fastSyncEnabled = 1;
  }
  objc_opt_class();
  v122 = [(ICCloudConfiguration *)self overridableValueForKey:@"fastSyncMaximumMessageSizeBytes" inConfigurationDictionary:v8];
  v123 = ICDynamicCast();

  v170 = v123;
  if (v123)
  {
    unint64_t v124 = [v123 unsignedIntegerValue];
  }
  else
  {
    v125 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v125, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3A61000, v125, OS_LOG_TYPE_DEFAULT, "Trying to create a cloud configuration with no fastSyncMaximumMessageSizeBytes value", buf, 2u);
    }

    unint64_t v124 = 64000;
  }
  self->_fastSyncMaximumMessageSizeBytes = v124;
  objc_opt_class();
  v126 = [(ICCloudConfiguration *)self overridableValueForKey:@"fastSyncPaperKitEnablePCSEncryption" inConfigurationDictionary:v8];
  v127 = ICDynamicCast();

  v169 = v127;
  if (v127)
  {
    self->_fastSyncPaperKitEnablePCSEncryption = [v127 BOOLValue];
  }
  else
  {
    v128 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v128, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3A61000, v128, OS_LOG_TYPE_DEFAULT, "Trying to create a cloud configuration with no fastSyncPaperKitEnablePCSEncryption value", buf, 2u);
    }

    self->_fastSyncPaperKitEnablePCSEncryption = 1;
  }
  objc_opt_class();
  v129 = [(ICCloudConfiguration *)self overridableValueForKey:@"fastSyncPaperKitEnableEphemeralRecords" inConfigurationDictionary:v8];
  v130 = ICDynamicCast();

  v168 = v130;
  if (v130)
  {
    self->_fastSyncPaperKitEnableEphemeralRecords = [v130 BOOLValue];
  }
  else
  {
    v131 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v131, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3A61000, v131, OS_LOG_TYPE_DEFAULT, "Trying to create a cloud configuration with no fastSyncPaperKitEnableEphemeralRecords value", buf, 2u);
    }

    self->_fastSyncPaperKitEnableEphemeralRecords = 1;
  }
  objc_opt_class();
  v132 = [(ICCloudConfiguration *)self overridableValueForKey:@"fastSyncMaximumThumbnailMessageSizeBytes" inConfigurationDictionary:v8];
  v133 = ICDynamicCast();

  if (v133)
  {
    unint64_t v134 = [v133 unsignedIntegerValue];
  }
  else
  {
    v135 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v135, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3A61000, v135, OS_LOG_TYPE_DEFAULT, "Trying to create a cloud configuration with no fastSyncMaximumThumbnailMessageSizeBytes value", buf, 2u);
    }

    unint64_t v134 = 102400;
  }
  self->_fastSyncMaximumThumbnailMessageSizeBytes = v134;
  v136 = [(ICCloudConfiguration *)self overridableValueForKey:@"fastSyncPresenceDebounceDuration" inConfigurationDictionary:v8];
  v176 = v102;
  v167 = v133;
  if (objc_opt_respondsToSelector())
  {
    [v136 doubleValue];
    if (v137 > 5.0) {
      double v137 = 5.0;
    }
    double v138 = fmax(v137, 0.25);
  }
  else
  {
    v139 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v139, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v207 = @"fastSyncPresenceDebounceDuration";
      _os_log_impl(&dword_1C3A61000, v139, OS_LOG_TYPE_DEFAULT, "Trying to create a cloud configuration with no %@ value", buf, 0xCu);
    }

    double v138 = 1.0;
  }
  self->_fastSyncPresenceDebounceDuration = v138;
  objc_opt_class();
  v140 = [(ICCloudConfiguration *)self overridableValueForKey:@"keychainFetchingEnabled" inConfigurationDictionary:v8];
  v141 = ICDynamicCast();

  if (v141)
  {
    self->_keychainFetchingEnabled = [v141 BOOLValue];
  }
  else
  {
    v142 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v142, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v207 = @"keychainFetchingEnabled";
      _os_log_impl(&dword_1C3A61000, v142, OS_LOG_TYPE_DEFAULT, "Trying to create a cloud configuration with no %@ value", buf, 0xCu);
    }

    self->_keychainFetchingEnabled = 1;
  }
  objc_opt_class();
  v143 = [(ICCloudConfiguration *)self overridableValueForKey:@"keychainFetchErrorTimeout" inConfigurationDictionary:v8];
  v144 = ICDynamicCast();

  if (v144)
  {
    [v144 doubleValue];
  }
  else
  {
    v146 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v146, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v207 = @"keychainFetchErrorTimeout";
      _os_log_impl(&dword_1C3A61000, v146, OS_LOG_TYPE_DEFAULT, "Trying to create a cloud configuration with no %@ value", buf, 0xCu);
    }

    double v145 = 300.0;
  }
  self->_keychainFetchErrorTimeout = v145;
  objc_opt_class();
  v147 = [(ICCloudConfiguration *)self overridableValueForKey:@"keychainMinimumSyncInterval" inConfigurationDictionary:v8];
  v148 = ICDynamicCast();

  v166 = v136;
  if (v148)
  {
    [v148 doubleValue];
  }
  else
  {
    v150 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v150, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v207 = @"keychainMinimumSyncInterval";
      _os_log_impl(&dword_1C3A61000, v150, OS_LOG_TYPE_DEFAULT, "Trying to create a cloud configuration with no %@ value", buf, 0xCu);
    }

    uint64_t v149 = 0x40AC200000000000;
  }
  *(void *)&v195->_keychainMinimumSyncInterval = v149;
  objc_opt_class();
  v151 = [(ICCloudConfiguration *)v195 overridableValueForKey:@"keychainMaximumSyncInterval" inConfigurationDictionary:v8];
  v152 = ICDynamicCast();

  if (v152)
  {
    [v152 doubleValue];
  }
  else
  {
    v154 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v154, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v207 = @"keychainMaximumSyncInterval";
      _os_log_impl(&dword_1C3A61000, v154, OS_LOG_TYPE_DEFAULT, "Trying to create a cloud configuration with no %@ value", buf, 0xCu);
    }

    uint64_t v153 = 0x40AC200000000000;
  }
  v155 = v195;
  *(void *)&v195->_keychainMaximumSyncInterval = v153;
  objc_opt_class();
  v156 = [(ICCloudConfiguration *)v195 overridableValueForKey:@"audioTranscriptPostProcessingEnabled" inConfigurationDictionary:v8];
  v157 = ICDynamicCast();

  if (v157)
  {
    v195->_audioTranscriptPostProcessingEnabled = [v157 BOOLValue];
  }
  else
  {
    v158 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v158, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3A61000, v158, OS_LOG_TYPE_DEFAULT, "Trying to create a cloud configuration with no audioTranscriptPostProcessingEnabled value", buf, 2u);
    }

    v155 = v195;
    v195->_audioTranscriptPostProcessingEnabled = 1;
  }
  os_unfair_lock_unlock(lock);
  v159 = (void *)MEMORY[0x1E4F28EA0];
  v204[0] = @"ICCloudConfigurationDictionary";
  v204[1] = @"ICCloudConfigurationUserDefaults";
  v205[0] = v8;
  v160 = v155->_userDefaults;
  v205[1] = v160;
  v161 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v205 forKeys:v204 count:2];
  v162 = [v159 notificationWithName:@"ICCloudConfigurationChanged" object:v155 userInfo:v161];

  v163 = MEMORY[0x1E4F14428];
  id v164 = MEMORY[0x1E4F14428];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__ICCloudConfiguration_setConfigurationFromDictionary___block_invoke;
  block[3] = &unk_1E64A4240;
  id v165 = v162;
  id v199 = v165;
  dispatch_async(v163, block);
}

- (id)overridableValueForKey:(id)a3 inConfigurationDictionary:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_opt_class();
  if (self) {
    userDefaults = self->_userDefaults;
  }
  else {
    userDefaults = 0;
  }
  __int16 v10 = [v8 overridableValueForKey:v7 inConfigurationDictionary:v6 userDefaults:userDefaults];

  return v10;
}

+ (id)overridableValueForKey:(id)a3 inConfigurationDictionary:(id)a4 userDefaults:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [a5 objectForKey:v7];
  __int16 v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = [v8 objectForKeyedSubscript:v7];
  }
  uint64_t v12 = v11;

  return v12;
}

+ (void)loadSharedConfigurationWithQoSClass:(unsigned int)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = +[ICCloudConfiguration cloudConfigurationQueue]();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __94__ICCloudConfiguration_SharedInstance__loadSharedConfigurationWithQoSClass_completionHandler___block_invoke;
  v10[3] = &unk_1E64A5E48;
  id v11 = v6;
  id v12 = a1;
  id v8 = v6;
  dispatch_block_t v9 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0, (dispatch_qos_class_t)a3, 0, v10);
  dispatch_async(v7, v9);
}

+ (void)loadSharedConfigurationWithCompletionHandler:(id)a3
{
}

+ (id)cloudConfigurationQueue
{
  self;
  if (cloudConfigurationQueue_token != -1) {
    dispatch_once(&cloudConfigurationQueue_token, &__block_literal_global_21);
  }
  v0 = (void *)cloudConfigurationQueue_queue;
  return v0;
}

void __55__ICCloudConfiguration_setConfigurationFromDictionary___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotification:*(void *)(a1 + 32)];
}

- (BOOL)fastSyncEnabled
{
  id v2 = self;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_fastSyncEnabled;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

void __47__ICCloudConfiguration_cloudConfigurationQueue__block_invoke()
{
  id v2 = dispatch_get_global_queue(0, 0);
  dispatch_queue_t v0 = dispatch_queue_create_with_target_V2("com.apple.notes.cloud-configuration", 0, v2);
  uint64_t v1 = (void *)cloudConfigurationQueue_queue;
  cloudConfigurationQueue_queue = (uint64_t)v0;
}

- (NSDictionary)configurationDictionary
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = (void *)[(NSDictionary *)self->_configurationDictionary copy];
  os_unfair_lock_unlock(p_lock);
  return (NSDictionary *)v4;
}

- (unint64_t)appStoreRatingCohortPercentage
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t appStoreRatingCohortPercentage = self->_appStoreRatingCohortPercentage;
  os_unfair_lock_unlock(p_lock);
  return appStoreRatingCohortPercentage;
}

- (double)appStoreRatingIdleTimeInterval
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  double appStoreRatingIdleTimeInterval = self->_appStoreRatingIdleTimeInterval;
  os_unfair_lock_unlock(p_lock);
  return appStoreRatingIdleTimeInterval;
}

- (unint64_t)appStoreRatingLaunchCount
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t appStoreRatingLaunchCount = self->_appStoreRatingLaunchCount;
  os_unfair_lock_unlock(p_lock);
  return appStoreRatingLaunchCount;
}

- (unint64_t)appStoreRatingLaunchDayPeriod
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t appStoreRatingLaunchDayPeriod = self->_appStoreRatingLaunchDayPeriod;
  os_unfair_lock_unlock(p_lock);
  return appStoreRatingLaunchDayPeriod;
}

- (unint64_t)appStoreRatingOldestLaunchDayPeriod
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t appStoreRatingOldestLaunchDayPeriod = self->_appStoreRatingOldestLaunchDayPeriod;
  os_unfair_lock_unlock(p_lock);
  return appStoreRatingOldestLaunchDayPeriod;
}

- (unint64_t)appStoreRatingNoteCount
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t appStoreRatingNoteCount = self->_appStoreRatingNoteCount;
  os_unfair_lock_unlock(p_lock);
  return appStoreRatingNoteCount;
}

- (unint64_t)appStoreRatingRequestDayPeriod
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t appStoreRatingRequestDayPeriod = self->_appStoreRatingRequestDayPeriod;
  os_unfair_lock_unlock(p_lock);
  return appStoreRatingRequestDayPeriod;
}

- (BOOL)shouldSyncWhenEnteringForeground
{
  id v2 = self;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_shouldSyncWhenEnteringForeground;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (unint64_t)maxInlineAssetSizeBytes
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t maxInlineAssetSizeBytes = self->_maxInlineAssetSizeBytes;
  os_unfair_lock_unlock(p_lock);
  return maxInlineAssetSizeBytes;
}

- (NSNumber)maximumAttachmentSizeMB
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_maximumAttachmentSizeMB;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (unint64_t)maxAttachmentsPerNote
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t maxAttachmentsPerNote = self->_maxAttachmentsPerNote;
  os_unfair_lock_unlock(p_lock);
  return maxAttachmentsPerNote;
}

- (unint64_t)maxSubAttachmentsPerAttachment
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t maxSubAttachmentsPerAttachment = self->_maxSubAttachmentsPerAttachment;
  os_unfair_lock_unlock(p_lock);
  return maxSubAttachmentsPerAttachment;
}

- (unint64_t)resultsLimitPerSyncOperation
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t resultsLimitPerSyncOperation = self->_resultsLimitPerSyncOperation;
  os_unfair_lock_unlock(p_lock);
  return resultsLimitPerSyncOperation;
}

- (BOOL)shouldPerformTopHitSearch
{
  id v2 = self;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_shouldPerformTopHitSearch;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (unint64_t)mentionNotificationMaxRetries
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t mentionNotificationMaxRetries = self->_mentionNotificationMaxRetries;
  os_unfair_lock_unlock(p_lock);
  return mentionNotificationMaxRetries;
}

- (unint64_t)launchTaskMaxRetries
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t launchTaskMaxRetries = self->_launchTaskMaxRetries;
  os_unfair_lock_unlock(p_lock);
  return launchTaskMaxRetries;
}

- (unint64_t)serverSideUpdateTaskMaxFailureCount
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t serverSideUpdateTaskMaxFailureCount = self->_serverSideUpdateTaskMaxFailureCount;
  os_unfair_lock_unlock(p_lock);
  return serverSideUpdateTaskMaxFailureCount;
}

- (unint64_t)durationForNextPasswordReask
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t durationForNextPasswordReask = self->_durationForNextPasswordReask;
  os_unfair_lock_unlock(p_lock);
  return durationForNextPasswordReask;
}

- (unint64_t)unsupportedNoteDeviceCheckIntervalSeconds
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t unsupportedNoteDeviceCheckIntervalSeconds = self->_unsupportedNoteDeviceCheckIntervalSeconds;
  os_unfair_lock_unlock(p_lock);
  return unsupportedNoteDeviceCheckIntervalSeconds;
}

- (BOOL)requestUserNotificationAuthorizationAtLaunch
{
  id v2 = self;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_requestUserNotificationAuthorizationAtLaunch;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (unint64_t)fastSyncMaximumMessageSizeBytes
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t fastSyncMaximumMessageSizeBytes = self->_fastSyncMaximumMessageSizeBytes;
  os_unfair_lock_unlock(p_lock);
  return fastSyncMaximumMessageSizeBytes;
}

- (BOOL)fastSyncPaperKitEnablePCSEncryption
{
  id v2 = self;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_fastSyncPaperKitEnablePCSEncryption;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)fastSyncPaperKitEnableEphemeralRecords
{
  id v2 = self;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_fastSyncPaperKitEnableEphemeralRecords;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (unint64_t)fastSyncMaximumThumbnailMessageSizeBytes
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t fastSyncMaximumThumbnailMessageSizeBytes = self->_fastSyncMaximumThumbnailMessageSizeBytes;
  os_unfair_lock_unlock(p_lock);
  return fastSyncMaximumThumbnailMessageSizeBytes;
}

- (double)fastSyncPresenceDebounceDuration
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  double fastSyncPresenceDebounceDuration = self->_fastSyncPresenceDebounceDuration;
  os_unfair_lock_unlock(p_lock);
  return fastSyncPresenceDebounceDuration;
}

- (BOOL)keychainFetchingEnabled
{
  id v2 = self;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_keychainFetchingEnabled;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (double)keychainFetchErrorTimeout
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  double keychainFetchErrorTimeout = self->_keychainFetchErrorTimeout;
  os_unfair_lock_unlock(p_lock);
  return keychainFetchErrorTimeout;
}

- (double)keychainMinimumSyncInterval
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  double keychainMinimumSyncInterval = self->_keychainMinimumSyncInterval;
  os_unfair_lock_unlock(p_lock);
  return keychainMinimumSyncInterval;
}

- (double)keychainMaximumSyncInterval
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  double keychainMaximumSyncInterval = self->_keychainMaximumSyncInterval;
  os_unfair_lock_unlock(p_lock);
  return keychainMaximumSyncInterval;
}

- (BOOL)audioTranscriptPostProcessingEnabled
{
  id v2 = self;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_audioTranscriptPostProcessingEnabled;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

void __72__ICCloudConfiguration_initWithUserDefaults_usesLocalConfigurationFile___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) downloadRemoteConfiguration:0];
  id v2 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:*(void *)(a1 + 32) target:sel_downloadRemoteConfiguration_ selector:0 userInfo:1 repeats:86400.0];
  -[ICCloudConfiguration setDownloadTimer:](*(void *)(a1 + 32), v2);
}

- (void)setDownloadTimer:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 232), a2);
  }
}

- (void)dealloc
{
  id v2 = self;
  if (self) {
    self = (ICCloudConfiguration *)self->_downloadTimer;
  }
  [(ICCloudConfiguration *)self invalidate];
  v3.receiver = v2;
  v3.super_class = (Class)ICCloudConfiguration;
  [(ICCloudConfiguration *)&v3 dealloc];
}

+ (NSURL)defaultConfigurationURL
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [MEMORY[0x1E4F836E0] sharedAppGroupDefaults];
  id v4 = [v3 stringForKey:@"CloudConfigurationPath"];

  if (!v4) {
    goto LABEL_5;
  }
  id v5 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v4];
  if (([v5 checkResourceIsReachableAndReturnError:0] & 1) == 0)
  {
    id v6 = [a1 availableConfigurationURLs];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __47__ICCloudConfiguration_defaultConfigurationURL__block_invoke;
    v22[3] = &unk_1E64A5DB0;
    id v23 = v4;
    uint64_t v7 = objc_msgSend(v6, "ic_objectPassingTest:", v22);

    [a1 setDefaultConfigurationURL:v7];
    id v5 = (id)v7;
  }
  if (!v5)
  {
LABEL_5:
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v8 = objc_msgSend(a1, "availableConfigurationURLs", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v24 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
LABEL_7:
      uint64_t v12 = 0;
      while (1)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v18 + 1) + 8 * v12);
        v14 = [v13 lastPathComponent];
        char v15 = [v14 containsString:@"Normal"];

        if (v15) {
          break;
        }
        if (v10 == ++v12)
        {
          uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v24 count:16];
          if (v10) {
            goto LABEL_7;
          }
          goto LABEL_13;
        }
      }
      id v5 = v13;

      if (v5) {
        goto LABEL_16;
      }
    }
    else
    {
LABEL_13:
    }
    double v16 = [a1 availableConfigurationURLs];
    id v5 = [v16 firstObject];

LABEL_16:
    [a1 setDefaultConfigurationURL:v5];
  }

  return (NSURL *)v5;
}

uint64_t __47__ICCloudConfiguration_defaultConfigurationURL__block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = [a2 lastPathComponent];
  id v4 = [*(id *)(a1 + 32) lastPathComponent];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

+ (void)setDefaultConfigurationURL:(id)a3
{
  objc_super v3 = (void *)MEMORY[0x1E4F836E0];
  id v4 = a3;
  uint64_t v5 = [v3 sharedAppGroupDefaults];
  id v6 = [v4 path];

  [v5 setObject:v6 forKey:@"CloudConfigurationPath"];
  id v7 = [MEMORY[0x1E4F836E0] sharedAppGroupDefaults];
  [v7 synchronize];
}

+ (NSArray)availableConfigurationURLs
{
  os_unfair_lock_lock((os_unfair_lock_t)&availableConfigurationURLs_lock);
  if (availableConfigurationURLs_configurationURLs)
  {
    id v2 = (id)[(id)availableConfigurationURLs_configurationURLs copy];
  }
  else
  {
    objc_super v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v4 = [v3 resourceURL];
    uint64_t v5 = [v4 URLByAppendingPathComponent:@"CloudConfigurations" isDirectory:1];

    id v6 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v7 = [v6 enumeratorAtURL:v5 includingPropertiesForKeys:0 options:5 errorHandler:0];

    if (v7)
    {
      uint64_t v8 = [v7 allObjects];
      uint64_t v9 = (void *)availableConfigurationURLs_configurationURLs;
      availableConfigurationURLs_configurationURLs = v8;
    }
    else
    {
      uint64_t v10 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        +[ICCloudConfiguration availableConfigurationURLs]();
      }
    }
    id v2 = (id)availableConfigurationURLs_configurationURLs;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&availableConfigurationURLs_lock);
  return (NSArray *)v2;
}

- (void)downloadRemoteConfiguration:(id)a3
{
  id v4 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://configuration.apple.com/configurations/internetservices/cloudkit/notes-1.9.plist"];
  [(ICCloudConfiguration *)self downloadConfigurationFromRemoteURL:v4 completionHandler:&__block_literal_global_167];
}

void __52__ICCloudConfiguration_downloadRemoteConfiguration___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    id v2 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __52__ICCloudConfiguration_downloadRemoteConfiguration___block_invoke_cold_1();
    }
  }
}

- (void)downloadConfigurationFromRemoteURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1E4F290F0];
  id v8 = a3;
  uint64_t v9 = [v7 defaultSessionConfiguration];
  [v9 setRequestCachePolicy:1];
  uint64_t v10 = [MEMORY[0x1E4F290E0] sessionWithConfiguration:v9];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  char v15 = __77__ICCloudConfiguration_downloadConfigurationFromRemoteURL_completionHandler___block_invoke;
  double v16 = &unk_1E64A5DF8;
  double v17 = self;
  id v18 = v6;
  id v11 = v6;
  uint64_t v12 = [v10 dataTaskWithURL:v8 completionHandler:&v13];

  objc_msgSend(v12, "resume", v13, v14, v15, v16, v17);
}

void __77__ICCloudConfiguration_downloadConfigurationFromRemoteURL_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    uint64_t v10 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __77__ICCloudConfiguration_downloadConfigurationFromRemoteURL_completionHandler___block_invoke_cold_5(v9);
    }

    uint64_t v11 = *(void *)(a1 + 40);
    if (v11) {
      (*(void (**)(uint64_t, void))(v11 + 16))(v11, 0);
    }
  }
  else
  {
    id v12 = v8;
    if ([v12 statusCode] == 200)
    {
      id v25 = 0;
      uint64_t v13 = [MEMORY[0x1E4F28F98] propertyListWithData:v7 options:0 format:0 error:&v25];
      id v14 = v25;
      os_log_t v15 = os_log_create("com.apple.notes", "Cloud");
      os_log_t v16 = v15;
      if (v14)
      {
        double v17 = v15;
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          __77__ICCloudConfiguration_downloadConfigurationFromRemoteURL_completionHandler___block_invoke_cold_3(v14);
        }

        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      }
      else
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
          __77__ICCloudConfiguration_downloadConfigurationFromRemoteURL_completionHandler___block_invoke_cold_2();
        }

        if ([(id)objc_opt_class() isConfigurationValid:v13])
        {
          long long v20 = os_log_create("com.apple.notes", "Cloud");
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
            __77__ICCloudConfiguration_downloadConfigurationFromRemoteURL_completionHandler___block_invoke_cold_1();
          }

          [*(id *)(a1 + 32) setConfigurationFromDictionary:v13];
        }
        long long v21 = [(id)objc_opt_class() cachedConfigurationURL];
        if (([v13 writeToURL:v21 atomically:1] & 1) == 0)
        {
          uint64_t v22 = os_log_create("com.apple.notes", "Cloud");
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v24 = 0;
            _os_log_impl(&dword_1C3A61000, v22, OS_LOG_TYPE_DEFAULT, "Not able to write remote configuration to cache.", v24, 2u);
          }
        }
        uint64_t v23 = *(void *)(a1 + 40);
        if (v23) {
          (*(void (**)(uint64_t, uint64_t))(v23 + 16))(v23, 1);
        }
      }
    }
    else
    {
      id v18 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        __77__ICCloudConfiguration_downloadConfigurationFromRemoteURL_completionHandler___block_invoke_cold_4(v12);
      }

      uint64_t v19 = *(void *)(a1 + 40);
      if (v19) {
        (*(void (**)(uint64_t, void))(v19 + 16))(v19, 0);
      }
    }
  }
}

- (void)loadConfigurationFromURL:(id)a3
{
  id v4 = a3;
  uint64_t v5 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[ICCloudConfiguration loadConfigurationFromURL:]();
  }

  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v4];
  if (v6)
  {
    [(ICCloudConfiguration *)self setConfigurationFromDictionary:v6];
  }
  else
  {
    id v7 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[ICCloudConfiguration loadConfigurationFromURL:]();
    }
  }
}

- (void)loadConfigurationFromURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[ICCloudConfiguration cloudConfigurationQueue]();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__ICCloudConfiguration_loadConfigurationFromURL_completionHandler___block_invoke;
  block[3] = &unk_1E64A5E20;
  uint64_t v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __67__ICCloudConfiguration_loadConfigurationFromURL_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v8 = 0;
  objc_super v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v2 error:&v8];
  id v4 = v8;
  if (v3)
  {
    [*(id *)(a1 + 40) setConfigurationFromDictionary:v3];
    uint64_t v5 = *(void *)(a1 + 48);
    if (v5)
    {
      id v6 = *(void (**)(void))(v5 + 16);
LABEL_6:
      v6();
    }
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 48);
    if (v7)
    {
      id v6 = *(void (**)(void))(v7 + 16);
      goto LABEL_6;
    }
  }
}

- (BOOL)usesLocalConfigurationFile
{
  return self->_usesLocalConfigurationFile;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_downloadTimer, 0);
  objc_storeStrong((id *)&self->_minimumClientVersion, 0);
  objc_storeStrong((id *)&self->_maximumAttachmentSizeMB, 0);
  objc_storeStrong((id *)&self->_throttlingPolicy, 0);
  objc_storeStrong((id *)&self->_configurationDictionary, 0);
}

+ (void)availableConfigurationURLs
{
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_1C3A61000, v0, OS_LOG_TYPE_ERROR, "Unexpected error accessing cloud configuration URLs.", v1, 2u);
}

void __52__ICCloudConfiguration_downloadRemoteConfiguration___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_1C3A61000, v0, OS_LOG_TYPE_ERROR, "Unable to download remote configuration.", v1, 2u);
}

void __77__ICCloudConfiguration_downloadConfigurationFromRemoteURL_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1C3A61000, v0, v1, "Using remote configuration", v2, v3, v4, v5, v6);
}

void __77__ICCloudConfiguration_downloadConfigurationFromRemoteURL_completionHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1C3A61000, v0, v1, "Received remote configuration", v2, v3, v4, v5, v6);
}

void __77__ICCloudConfiguration_downloadConfigurationFromRemoteURL_completionHandler___block_invoke_cold_3(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Error serializing plist data to dictionary: %@", v4, v5, v6, v7, v8);
}

void __77__ICCloudConfiguration_downloadConfigurationFromRemoteURL_completionHandler___block_invoke_cold_4(void *a1)
{
  uint64_t v1 = objc_msgSend(MEMORY[0x1E4F28D20], "localizedStringForStatusCode:", objc_msgSend(a1, "statusCode"));
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Connected to remote configuration plist server but got back non 200 response: %@", v4, v5, v6, v7, v8);
}

void __77__ICCloudConfiguration_downloadConfigurationFromRemoteURL_completionHandler___block_invoke_cold_5(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Error downloading remote configuration plist: %@", v4, v5, v6, v7, v8);
}

- (void)loadConfigurationFromURL:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_1C3A61000, v0, OS_LOG_TYPE_ERROR, "Failed to load cloud configuration dictionary from URL: %@", v1, 0xCu);
}

- (void)loadConfigurationFromURL:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_1C3A61000, v0, OS_LOG_TYPE_DEBUG, "Loading cloud configuration from URL: %@", v1, 0xCu);
}

@end