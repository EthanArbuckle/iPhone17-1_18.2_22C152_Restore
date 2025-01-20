@interface ICCloudConfiguration
+ (BOOL)isConfigurationValid:(id)a3;
+ (id)availableConfigurationURLs;
+ (id)cachedConfigurationURL;
+ (id)defaultConfigurationURL;
+ (id)sharedConfiguration;
+ (void)setDefaultConfigurationURL:(id)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (ICCloudConfiguration)init;
- (NSURLSession)session;
- (_ICCloudConfigurationStorage)storage;
- (id)valueForUndefinedKey:(id)a3;
- (void)downloadConfigurationFromRemoteURL:(id)a3 completionHandler:(id)a4;
- (void)downloadRemoteConfiguration;
- (void)loadConfigurationFromURL:(id)a3;
- (void)loadLocalConfigurationFile;
- (void)setConfigurationFromDictionary:(id)a3;
- (void)setSession:(id)a3;
- (void)setStorage:(id)a3;
- (void)setValue:(id)a3 forUndefinedKey:(id)a4;
@end

@implementation ICCloudConfiguration

+ (id)sharedConfiguration
{
  if (qword_100922900 != -1) {
    dispatch_once(&qword_100922900, &stru_1008AF798);
  }
  v2 = (void *)qword_1009228F8;

  return v2;
}

- (ICCloudConfiguration)init
{
  v9.receiver = self;
  v9.super_class = (Class)ICCloudConfiguration;
  v2 = [(ICCloudConfiguration *)&v9 init];
  if (v2)
  {
    uint64_t v3 = +[_ICCloudDefaultValuesConfigurationStorage sharedConfiguration];
    storage = v2->_storage;
    v2->_storage = (_ICCloudConfigurationStorage *)v3;

    v5 = +[NSURLSessionConfiguration defaultSessionConfiguration];
    [v5 setDiscretionary:1];
    [v5 set_sourceApplicationBundleIdentifier:REMUniversalAppBundleIdentifier];
    uint64_t v6 = +[NSURLSession sessionWithConfiguration:v5];
    session = v2->_session;
    v2->_session = (NSURLSession *)v6;

    [(ICCloudConfiguration *)v2 loadLocalConfigurationFile];
  }
  return v2;
}

+ (BOOL)isConfigurationValid:(id)a3
{
  uint64_t v3 = [a3 objectForKeyedSubscript:@"configurationVersion"];
  v4 = v3;
  if (!v3)
  {
    uint64_t v6 = +[REMLog cloudkit];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10074E208();
    }
    goto LABEL_8;
  }
  if ([v3 unsignedIntegerValue] != (id)2)
  {
    uint64_t v6 = +[REMLog cloudkit];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10074E23C(v4, v6);
    }
LABEL_8:

    BOOL v5 = 0;
    goto LABEL_9;
  }
  BOOL v5 = 1;
LABEL_9:

  return v5;
}

+ (id)defaultConfigurationURL
{
  uint64_t v3 = objc_opt_new();
  v4 = [v3 userDefaults];
  BOOL v5 = [v4 stringForKey:@"CloudConfigurationPath"];

  if (!v5) {
    goto LABEL_5;
  }
  id v6 = +[NSURL fileURLWithPath:v5];
  if (([v6 checkResourceIsReachableAndReturnError:0] & 1) == 0)
  {
    v7 = [a1 availableConfigurationURLs];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10003D994;
    v24[3] = &unk_1008AF7C0;
    id v25 = v5;
    uint64_t v8 = [v7 ic_objectPassingTest:v24];

    [a1 setDefaultConfigurationURL:v8];
    id v6 = (id)v8;
  }
  if (!v6)
  {
LABEL_5:
    v19 = v3;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    objc_super v9 = [a1 availableConfigurationURLs];
    id v10 = [v9 countByEnumeratingWithState:&v20 objects:v26 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v21;
LABEL_7:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v20 + 1) + 8 * v13);
        v15 = [v14 lastPathComponent];
        unsigned __int8 v16 = [v15 containsString:@"Normal"];

        if (v16) {
          break;
        }
        if (v11 == (id)++v13)
        {
          id v11 = [v9 countByEnumeratingWithState:&v20 objects:v26 count:16];
          if (v11) {
            goto LABEL_7;
          }
          goto LABEL_13;
        }
      }
      id v6 = v14;

      if (v6) {
        goto LABEL_16;
      }
    }
    else
    {
LABEL_13:
    }
    v17 = [a1 availableConfigurationURLs];
    id v6 = [v17 firstObject];

LABEL_16:
    [a1 setDefaultConfigurationURL:v6];
    uint64_t v3 = v19;
  }

  return v6;
}

+ (void)setDefaultConfigurationURL:(id)a3
{
  id v3 = a3;
  id v7 = (id)objc_opt_new();
  v4 = [v7 userDefaults];
  BOOL v5 = [v3 path];

  [v4 setObject:v5 forKey:@"CloudConfigurationPath"];
  id v6 = [v7 userDefaults];
  [v6 synchronize];
}

+ (id)cachedConfigurationURL
{
  v2 = +[NSFileManager defaultManager];
  id v3 = [v2 URLForDirectory:13 inDomain:1 appropriateForURL:0 create:1 error:0];

  v4 = [v3 URLByAppendingPathComponent:REMDaemonBundleIdentifier isDirectory:1];

  BOOL v5 = [v4 URLByAppendingPathComponent:@"RemoteConfiguration" isDirectory:0];
  id v6 = [v5 URLByAppendingPathExtension:@"plist"];

  return v6;
}

+ (id)availableConfigurationURLs
{
  v2 = (void *)qword_100922908;
  if (!qword_100922908)
  {
    id v3 = +[NSBundle bundleForClass:objc_opt_class()];
    v4 = [v3 resourceURL];
    BOOL v5 = [v4 URLByAppendingPathComponent:@"CloudConfigurations" isDirectory:1];

    id v6 = +[NSFileManager defaultManager];
    id v7 = [v6 enumeratorAtURL:v5 includingPropertiesForKeys:0 options:5 errorHandler:0];

    uint64_t v8 = [v7 allObjects];
    objc_super v9 = (void *)qword_100922908;
    qword_100922908 = v8;

    v2 = (void *)qword_100922908;
  }

  return v2;
}

- (void)loadLocalConfigurationFile
{
  id v3 = [(id)objc_opt_class() cachedConfigurationURL];
  if (v3)
  {
    v4 = +[NSDictionary dictionaryWithContentsOfURL:v3];
    if (v4)
    {
      BOOL v5 = +[REMLog cloudkit];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Checking cached configuration", buf, 2u);
      }

      if ([(id)objc_opt_class() isConfigurationValid:v4])
      {
        id v6 = +[REMLog cloudkit];
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)objc_super v9 = 0;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Using cached remote configuration", v9, 2u);
        }

        [(ICCloudConfiguration *)self setConfigurationFromDictionary:v4];
        goto LABEL_14;
      }
    }
  }
  else
  {
    v4 = +[REMLog cloudkit];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10074E2D4();
    }
  }

  id v7 = +[REMLog cloudkit];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Using default configuration", v8, 2u);
  }

  v4 = [(id)objc_opt_class() defaultConfigurationURL];
  [(ICCloudConfiguration *)self loadConfigurationFromURL:v4];
LABEL_14:
}

- (void)downloadRemoteConfiguration
{
  id v3 = +[NSURL URLWithString:@"https://configuration.apple.com/configurations/internetservices/cloudkit/reminders-1.0.plist"];
  v4 = +[REMLog cloudkit];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "ICCloudConfiguration: Start downloading configuration from {remoteURL: %{public}@}", (uint8_t *)&v5, 0xCu);
  }

  [(ICCloudConfiguration *)self downloadConfigurationFromRemoteURL:v3 completionHandler:&stru_1008AF800];
}

- (void)downloadConfigurationFromRemoteURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(ICCloudConfiguration *)self session];
  id v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  uint64_t v13 = sub_10003E034;
  v14 = &unk_1008AF828;
  v15 = self;
  id v16 = v6;
  id v9 = v6;
  id v10 = [v8 dataTaskWithURL:v7 completionHandler:&v11];

  [v10 resume:v11, v12, v13, v14, v15];
}

- (void)loadConfigurationFromURL:(id)a3
{
  id v4 = a3;
  int v5 = +[REMLog cloudkit];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Loading cloud configuration {configurationURL: %{public}@}", (uint8_t *)&v8, 0xCu);
  }

  id v6 = +[NSDictionary dictionaryWithContentsOfURL:v4];
  if (!v6)
  {
    id v7 = +[REMLog cloudkit];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10074E584();
    }
  }
  [(ICCloudConfiguration *)self setConfigurationFromDictionary:v6];
}

- (void)setConfigurationFromDictionary:(id)a3
{
  id v3 = a3;
  id v4 = +[_ICCloudDefaultValuesConfigurationStorage sharedConfiguration];
  int v5 = objc_alloc_init(_ICCloudConfigurationStorage);
  id v6 = [v3 objectForKeyedSubscript:@"minimumClientVersions"];
  id v7 = v6;
  if (v6
    && ([v6 objectForKeyedSubscript:@"iOS"],
        int v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v8))
  {
    uint64_t v9 = [v7 objectForKeyedSubscript:@"iOS"];
  }
  else
  {
    id v10 = +[REMLog cloudkit];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10074E6FC();
    }

    uint64_t v9 = [v4 minimumClientVersion];
  }
  id v11 = (void *)v9;
  [(_ICCloudConfigurationStorage *)v5 setMinimumClientVersion:v9];

  uint64_t v12 = [v3 objectForKeyedSubscript:@"throttlingPolicyResetIntervalSeconds"];
  [v12 doubleValue];
  double v14 = v13;

  if (v14 == 0.0) {
    double v14 = 86400.0;
  }
  uint64_t v15 = [v3 objectForKeyedSubscript:@"throttlingPolicy"];
  v221 = v4;
  v220 = v7;
  v219 = (void *)v15;
  if (v15)
  {
    id v16 = (void *)v15;
    id v216 = v3;
    v17 = +[NSMutableArray array];
    long long v226 = 0u;
    long long v227 = 0u;
    long long v228 = 0u;
    long long v229 = 0u;
    id obj = v16;
    id v18 = [obj countByEnumeratingWithState:&v226 objects:v230 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v227;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v227 != v20) {
            objc_enumerationMutation(obj);
          }
          long long v22 = *(void **)(*((void *)&v226 + 1) + 8 * i);
          long long v23 = [v22 objectForKeyedSubscript:@"count"];
          id v24 = [v23 unsignedIntegerValue];

          id v25 = [v22 objectForKeyedSubscript:@"intervalSeconds"];
          [v25 doubleValue];
          double v27 = v26;

          v28 = [[ICCloudThrottlingLevel alloc] initWithBatchInterval:v24 numberOfBatches:v27];
          [v17 addObject:v28];
        }
        id v19 = [obj countByEnumeratingWithState:&v226 objects:v230 count:16];
      }
      while (v19);
    }

    v29 = [[ICCloudThrottlingPolicy alloc] initWithThrottlingLevels:v17 resetInterval:v14];
    [(_ICCloudConfigurationStorage *)v5 setThrottlingPolicy:v29];

    id v3 = v216;
  }
  else
  {
    v30 = +[REMLog cloudkit];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      sub_10074E6C8();
    }

    v17 = [v4 throttlingPolicy];
    [(_ICCloudConfigurationStorage *)v5 setThrottlingPolicy:v17];
  }

  v31 = [v3 objectForKeyedSubscript:@"maxInlineAssetSizeBytes"];
  id obja = v31;
  if (v31)
  {
    id v32 = [v31 unsignedIntegerValue];
  }
  else
  {
    v33 = +[REMLog cloudkit];
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      sub_10074E694();
    }

    id v32 = [v4 maxInlineAssetSizeBytes];
  }
  [(_ICCloudConfigurationStorage *)v5 setMaxInlineAssetSizeBytes:v32];
  v34 = [v3 objectForKeyedSubscript:@"maxAttachmentsPerNote"];
  v217 = v34;
  if (v34)
  {
    id v35 = [v34 unsignedIntegerValue];
  }
  else
  {
    v36 = +[REMLog cloudkit];
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      sub_10074E660();
    }

    id v35 = [v4 maxAttachmentsPerNote];
  }
  [(_ICCloudConfigurationStorage *)v5 setMaxAttachmentsPerNote:v35];
  v37 = [v3 objectForKeyedSubscript:@"maxSubAttachmentsPerAttachment"];
  v215 = v37;
  if (v37)
  {
    id v38 = [v37 unsignedIntegerValue];
  }
  else
  {
    v39 = +[REMLog cloudkit];
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      sub_10074E62C();
    }

    id v38 = [v4 maxSubAttachmentsPerAttachment];
  }
  [(_ICCloudConfigurationStorage *)v5 setMaxSubAttachmentsPerAttachment:v38];
  v40 = [v3 objectForKeyedSubscript:@"pollingIntervalSeconds"];
  v214 = v40;
  if (v40) {
    double v41 = (double)(unint64_t)[v40 unsignedIntegerValue];
  }
  else {
    [v4 pollingInterval];
  }
  [(_ICCloudConfigurationStorage *)v5 setPollingInterval:v41];
  uint64_t v42 = [v3 objectForKeyedSubscript:@"maximumAttachmentSizeMB"];
  v213 = (void *)v42;
  if (v42)
  {
    [(_ICCloudConfigurationStorage *)v5 setMaximumAttachmentSizeMB:v42];
  }
  else
  {
    v43 = +[REMLog cloudkit];
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
      sub_10074E5F8();
    }

    v44 = [v4 maximumAttachmentSizeMB];
    [(_ICCloudConfigurationStorage *)v5 setMaximumAttachmentSizeMB:v44];
  }
  v45 = [v3 objectForKeyedSubscript:@"resultsLimitPerSyncOperation"];
  v212 = v45;
  if (v45) {
    id v46 = [v45 unsignedIntegerValue];
  }
  else {
    id v46 = [v4 resultsLimitPerSyncOperation];
  }
  [(_ICCloudConfigurationStorage *)v5 setResultsLimitPerSyncOperation:v46];
  v47 = +[REMUserDefaults daemonUserDefaults];
  v48 = [v47 cloudKitResultsLimitPerSyncOperation];
  uint64_t v49 = (uint64_t)[v48 integerValue];

  if (v49 >= 1) {
    [(_ICCloudConfigurationStorage *)v5 setResultsLimitPerSyncOperation:v49];
  }
  v50 = [v3 objectForKeyedSubscript:@"fetchBatchSize"];
  v211 = v50;
  if (v50) {
    id v51 = [v50 unsignedIntegerValue];
  }
  else {
    id v51 = [v4 fetchBatchSize];
  }
  [(_ICCloudConfigurationStorage *)v5 setFetchBatchSize:v51];
  v52 = [v3 objectForKeyedSubscript:@"fetchCacheCountLimit"];
  v210 = v52;
  if (v52) {
    id v53 = [v52 unsignedIntegerValue];
  }
  else {
    id v53 = [v4 fetchCacheCountLimit];
  }
  [(_ICCloudConfigurationStorage *)v5 setFetchCacheCountLimit:v53];
  v54 = [v3 objectForKeyedSubscript:@"reachabilityChangeSyncThrottleInterval"];
  v209 = v54;
  if (v54) {
    [v54 doubleValue];
  }
  else {
    [v4 reachabilityChangeSyncThrottleInterval];
  }
  -[_ICCloudConfigurationStorage setReachabilityChangeSyncThrottleInterval:](v5, "setReachabilityChangeSyncThrottleInterval:");
  v55 = [v3 objectForKeyedSubscript:@"launchAndSignificantTimeChangePollThrottleIntervalV2"];
  v208 = v55;
  if (v55) {
    [v55 doubleValue];
  }
  else {
    [v4 launchAndSignificantTimeChangePollThrottleInterval];
  }
  -[_ICCloudConfigurationStorage setLaunchAndSignificantTimeChangePollThrottleInterval:](v5, "setLaunchAndSignificantTimeChangePollThrottleInterval:");
  v56 = [v3 objectForKeyedSubscript:@"cloudConfigurationDownloadThrottleInterval"];
  v207 = v56;
  if (v56) {
    [v56 doubleValue];
  }
  else {
    [v4 cloudConfigurationDownloadThrottleInterval];
  }
  -[_ICCloudConfigurationStorage setCloudConfigurationDownloadThrottleInterval:](v5, "setCloudConfigurationDownloadThrottleInterval:");
  v57 = [v3 objectForKeyedSubscript:@"persistedSubscriptionIDsValidityPeriod"];
  v206 = v57;
  if (v57) {
    [v57 doubleValue];
  }
  else {
    [v4 persistedSubscriptionIDsValidityPeriod];
  }
  -[_ICCloudConfigurationStorage setPersistedSubscriptionIDsValidityPeriod:](v5, "setPersistedSubscriptionIDsValidityPeriod:");
  v58 = [v3 objectForKeyedSubscript:@"apsDebouncerDefaultInterval"];
  v205 = v58;
  if (v58) {
    [v58 doubleValue];
  }
  else {
    [v4 apsDebouncerDefaultInterval];
  }
  -[_ICCloudConfigurationStorage setApsDebouncerDefaultInterval:](v5, "setApsDebouncerDefaultInterval:");
  v59 = [v3 objectForKeyedSubscript:@"apsDebouncerMigrationInProgressInterval"];
  v204 = v59;
  if (v59) {
    [v59 doubleValue];
  }
  else {
    [v4 apsDebouncerMigrationInProgressInterval];
  }
  -[_ICCloudConfigurationStorage setApsDebouncerMigrationInProgressInterval:](v5, "setApsDebouncerMigrationInProgressInterval:");
  v60 = [v3 objectForKeyedSubscript:@"apsDebouncerWatchDefaultInterval"];
  v203 = v60;
  if (v60) {
    [v60 doubleValue];
  }
  else {
    [v4 apsDebouncerWatchDefaultInterval];
  }
  -[_ICCloudConfigurationStorage setApsDebouncerWatchDefaultInterval:](v5, "setApsDebouncerWatchDefaultInterval:");
  v61 = [v3 objectForKeyedSubscript:@"apsDebouncerWatchMigrationInProgressInterval"];
  v202 = v61;
  if (v61) {
    [v61 doubleValue];
  }
  else {
    [v4 apsDebouncerWatchMigrationInProgressInterval];
  }
  -[_ICCloudConfigurationStorage setApsDebouncerWatchMigrationInProgressInterval:](v5, "setApsDebouncerWatchMigrationInProgressInterval:");
  v62 = [v3 objectForKeyedSubscript:@"accountChangedDebouncerInterval"];
  v201 = v62;
  if (v62) {
    [v62 doubleValue];
  }
  else {
    [v4 accountChangedDebouncerInterval];
  }
  -[_ICCloudConfigurationStorage setAccountChangedDebouncerInterval:](v5, "setAccountChangedDebouncerInterval:");
  v63 = [v3 objectForKeyedSubscript:@"mergeLocalObjectsInitialRetryInterval"];
  v200 = v63;
  if (v63) {
    [v63 doubleValue];
  }
  else {
    [v4 mergeLocalObjectsInitialRetryInterval];
  }
  -[_ICCloudConfigurationStorage setMergeLocalObjectsInitialRetryInterval:](v5, "setMergeLocalObjectsInitialRetryInterval:");
  v64 = [v3 objectForKeyedSubscript:@"mergeLocalObjectsMaximumRetryCount"];
  v199 = v64;
  if (v64) {
    id v65 = [v64 unsignedIntegerValue];
  }
  else {
    id v65 = [v4 mergeLocalObjectsMaximumRetryCount];
  }
  [(_ICCloudConfigurationStorage *)v5 setMergeLocalObjectsMaximumRetryCount:v65];
  v66 = [v3 objectForKeyedSubscript:@"mergeLocalObjectsRetryStartOverThrottleInterval"];
  v198 = v66;
  if (v66) {
    [v66 doubleValue];
  }
  else {
    [v4 mergeLocalObjectsRetryStartOverThrottleInterval];
  }
  -[_ICCloudConfigurationStorage setMergeLocalObjectsRetryStartOverThrottleInterval:](v5, "setMergeLocalObjectsRetryStartOverThrottleInterval:");
  uint64_t v67 = [v3 objectForKeyedSubscript:@"extraneousAlarmsCleanUpTriggerReductionFactor"];
  v197 = (void *)v67;
  if (v67)
  {
    [(_ICCloudConfigurationStorage *)v5 setExtraneousAlarmsCleanUpTriggerReductionFactor:v67];
  }
  else
  {
    v68 = [v4 extraneousAlarmsCleanUpTriggerReductionFactor];
    [(_ICCloudConfigurationStorage *)v5 setExtraneousAlarmsCleanUpTriggerReductionFactor:v68];
  }
  v69 = [v3 objectForKeyedSubscript:@"extraneousAlarmsDeleteCountLimit"];
  v196 = v69;
  if (v69) {
    unint64_t v70 = [v69 unsignedIntValue];
  }
  else {
    unint64_t v70 = (unint64_t)[v4 extraneousAlarmsDeleteCountLimit];
  }
  [(_ICCloudConfigurationStorage *)v5 setExtraneousAlarmsDeleteCountLimit:v70];
  v71 = [v3 objectForKeyedSubscript:@"extraneousAlarmsDeleteCountThreshold"];
  v195 = v71;
  if (v71) {
    unint64_t v72 = [v71 unsignedIntValue];
  }
  else {
    unint64_t v72 = (unint64_t)[v4 extraneousAlarmsDeleteCountThreshold];
  }
  [(_ICCloudConfigurationStorage *)v5 setExtraneousAlarmsDeleteCountThreshold:v72];
  v73 = [v3 objectForKeyedSubscript:@"extraneousAlarmsBackoffThrottleInterval"];
  v194 = v73;
  if (v73) {
    [v73 doubleValue];
  }
  else {
    [v4 extraneousAlarmsBackoffThrottleInterval];
  }
  -[_ICCloudConfigurationStorage setExtraneousAlarmsBackoffThrottleInterval:](v5, "setExtraneousAlarmsBackoffThrottleInterval:");
  v74 = [v3 objectForKeyedSubscript:@"extraneousAlarmsThrottleInterval"];
  v193 = v74;
  if (v74) {
    [v74 doubleValue];
  }
  else {
    [v4 extraneousAlarmsThrottleInterval];
  }
  -[_ICCloudConfigurationStorage setExtraneousAlarmsThrottleInterval:](v5, "setExtraneousAlarmsThrottleInterval:");
  v75 = [v3 objectForKeyedSubscript:@"extraneousAlarmsCollectorDebounceInterval"];
  v192 = v75;
  if (v75) {
    [v75 doubleValue];
  }
  else {
    [v4 extraneousAlarmsCollectorDebounceInterval];
  }
  -[_ICCloudConfigurationStorage setExtraneousAlarmsCollectorDebounceInterval:](v5, "setExtraneousAlarmsCollectorDebounceInterval:");
  v76 = [v3 objectForKeyedSubscript:@"extraneousAlarmsCollectorThrottleInterval"];
  v191 = v76;
  if (v76) {
    [v76 doubleValue];
  }
  else {
    [v4 extraneousAlarmsCollectorThrottleInterval];
  }
  -[_ICCloudConfigurationStorage setExtraneousAlarmsCollectorThrottleInterval:](v5, "setExtraneousAlarmsCollectorThrottleInterval:");
  v77 = [v3 objectForKeyedSubscript:@"staledFileAttachmentCleanupDefaultThrottleInterval"];
  v190 = v77;
  if (v77) {
    [v77 doubleValue];
  }
  else {
    [v4 staledFileAttachmentCleanupDefaultThrottleInterval];
  }
  -[_ICCloudConfigurationStorage setStaledFileAttachmentCleanupDefaultThrottleInterval:](v5, "setStaledFileAttachmentCleanupDefaultThrottleInterval:");
  v78 = [v3 objectForKeyedSubscript:@"staledFileAttachmentCleanupBackoffThrottleInterval"];
  v189 = v78;
  if (v78) {
    [v78 doubleValue];
  }
  else {
    [v4 staledFileAttachmentCleanupBackoffThrottleInterval];
  }
  -[_ICCloudConfigurationStorage setStaledFileAttachmentCleanupBackoffThrottleInterval:](v5, "setStaledFileAttachmentCleanupBackoffThrottleInterval:");
  uint64_t v79 = [v3 objectForKeyedSubscript:@"staledFileAttachmentCleanupRateReduceFactor"];
  v188 = (void *)v79;
  if (v79)
  {
    [(_ICCloudConfigurationStorage *)v5 setStaledFileAttachmentCleanupRateReduceFactor:v79];
  }
  else
  {
    v80 = [v4 staledFileAttachmentCleanupRateReduceFactor];
    [(_ICCloudConfigurationStorage *)v5 setStaledFileAttachmentCleanupRateReduceFactor:v80];
  }
  v81 = [v3 objectForKeyedSubscript:@"staledFileAttachmentCleanupPerRunDeleteLimit"];
  v187 = v81;
  if (v81) {
    unint64_t v82 = [v81 unsignedIntValue];
  }
  else {
    unint64_t v82 = (unint64_t)[v4 staledFileAttachmentCleanupPerRunDeleteLimit];
  }
  [(_ICCloudConfigurationStorage *)v5 setStaledFileAttachmentCleanupPerRunDeleteLimit:v82];
  v83 = [v3 objectForKeyedSubscript:@"imageDeduplicationDefaultThrottleInterval"];
  v186 = v83;
  if (v83) {
    [v83 doubleValue];
  }
  else {
    [v4 imageDeduplicationDefaultThrottleInterval];
  }
  -[_ICCloudConfigurationStorage setImageDeduplicationDefaultThrottleInterval:](v5, "setImageDeduplicationDefaultThrottleInterval:");
  v84 = [v3 objectForKeyedSubscript:@"imageDeduplicationBackoffThrottleInterval"];
  v185 = v84;
  if (v84) {
    [v84 doubleValue];
  }
  else {
    [v4 imageDeduplicationBackoffThrottleInterval];
  }
  -[_ICCloudConfigurationStorage setImageDeduplicationBackoffThrottleInterval:](v5, "setImageDeduplicationBackoffThrottleInterval:");
  uint64_t v85 = [v3 objectForKeyedSubscript:@"imageDeduplicationRateReduceFactor"];
  v184 = (void *)v85;
  if (v85)
  {
    [(_ICCloudConfigurationStorage *)v5 setImageDeduplicationRateReduceFactor:v85];
  }
  else
  {
    v86 = [v4 imageDeduplicationRateReduceFactor];
    [(_ICCloudConfigurationStorage *)v5 setImageDeduplicationRateReduceFactor:v86];
  }
  v87 = [v3 objectForKeyedSubscript:@"imageDeduplicationApproximatePerRunDeleteLimit"];
  v183 = v87;
  if (v87) {
    unint64_t v88 = [v87 unsignedIntValue];
  }
  else {
    unint64_t v88 = (unint64_t)[v4 imageDeduplicationApproximatePerRunDeleteLimit];
  }
  [(_ICCloudConfigurationStorage *)v5 setImageDeduplicationApproximatePerRunDeleteLimit:v88];
  v89 = [v3 objectForKeyedSubscript:@"savedImageDeduplicationDefaultThrottleInterval"];
  v182 = v89;
  if (v89) {
    [v89 doubleValue];
  }
  else {
    [v4 savedImageDeduplicationDefaultThrottleInterval];
  }
  -[_ICCloudConfigurationStorage setSavedImageDeduplicationDefaultThrottleInterval:](v5, "setSavedImageDeduplicationDefaultThrottleInterval:");
  v90 = [v3 objectForKeyedSubscript:@"savedImageDeduplicationBackoffThrottleInterval"];
  v181 = v90;
  if (v90) {
    [v90 doubleValue];
  }
  else {
    [v4 savedImageDeduplicationBackoffThrottleInterval];
  }
  -[_ICCloudConfigurationStorage setSavedImageDeduplicationBackoffThrottleInterval:](v5, "setSavedImageDeduplicationBackoffThrottleInterval:");
  uint64_t v91 = [v3 objectForKeyedSubscript:@"savedImageDeduplicationRateReduceFactor"];
  v180 = (void *)v91;
  if (v91)
  {
    [(_ICCloudConfigurationStorage *)v5 setSavedImageDeduplicationRateReduceFactor:v91];
  }
  else
  {
    v92 = [v4 savedImageDeduplicationRateReduceFactor];
    [(_ICCloudConfigurationStorage *)v5 setSavedImageDeduplicationRateReduceFactor:v92];
  }
  v93 = [v3 objectForKeyedSubscript:@"savedImageDeduplicationApproximatePerRunDeleteLimit"];
  v179 = v93;
  if (v93) {
    unint64_t v94 = [v93 unsignedIntValue];
  }
  else {
    unint64_t v94 = (unint64_t)[v4 savedImageDeduplicationApproximatePerRunDeleteLimit];
  }
  [(_ICCloudConfigurationStorage *)v5 setSavedImageDeduplicationApproximatePerRunDeleteLimit:v94];
  v95 = [v3 objectForKeyedSubscript:@"suggestConversionToGroceryListDefaultThrottleInterval"];
  v178 = v95;
  if (v95) {
    [v95 doubleValue];
  }
  else {
    [v4 suggestConversionToGroceryListDefaultThrottleInterval];
  }
  -[_ICCloudConfigurationStorage setSuggestConversionToGroceryListDefaultThrottleInterval:](v5, "setSuggestConversionToGroceryListDefaultThrottleInterval:");
  uint64_t v96 = [v3 objectForKeyedSubscript:@"suggestConversionToGroceryListRateReduceFactor"];
  v177 = (void *)v96;
  if (v96)
  {
    [(_ICCloudConfigurationStorage *)v5 setSuggestConversionToGroceryListRateReduceFactor:v96];
  }
  else
  {
    v97 = [v4 suggestConversionToGroceryListRateReduceFactor];
    [(_ICCloudConfigurationStorage *)v5 setSuggestConversionToGroceryListRateReduceFactor:v97];
  }
  uint64_t v98 = [v3 objectForKeyedSubscript:@"languageHypothesisThresholdForPrimaryLanguage"];
  v176 = (void *)v98;
  if (v98)
  {
    [(_ICCloudConfigurationStorage *)v5 setLanguageHypothesisThresholdForPrimaryLanguage:v98];
  }
  else
  {
    v99 = [v4 languageHypothesisThresholdForPrimaryLanguage];
    [(_ICCloudConfigurationStorage *)v5 setLanguageHypothesisThresholdForPrimaryLanguage:v99];
  }
  uint64_t v100 = [v3 objectForKeyedSubscript:@"languageHypothesisThresholdForAdditionalLanguages"];
  v175 = (void *)v100;
  if (v100)
  {
    [(_ICCloudConfigurationStorage *)v5 setLanguageHypothesisThresholdForAdditionalLanguages:v100];
  }
  else
  {
    v101 = [v4 languageHypothesisThresholdForAdditionalLanguages];
    [(_ICCloudConfigurationStorage *)v5 setLanguageHypothesisThresholdForAdditionalLanguages:v101];
  }
  uint64_t v102 = [v3 objectForKeyedSubscript:@"miniumumAutomaticLanguageConfidenceScoreAllowed"];
  v174 = (void *)v102;
  if (v102)
  {
    [(_ICCloudConfigurationStorage *)v5 setMiniumumAutomaticLanguageConfidenceScoreAllowed:v102];
  }
  else
  {
    v103 = [v4 miniumumAutomaticLanguageConfidenceScoreAllowed];
    [(_ICCloudConfigurationStorage *)v5 setMiniumumAutomaticLanguageConfidenceScoreAllowed:v103];
  }
  v104 = [v3 objectForKeyedSubscript:@"postAnalyticsDefaultThrottleInterval"];
  v173 = v104;
  if (v104) {
    [v104 doubleValue];
  }
  else {
    [v4 postAnalyticsDefaultThrottleInterval];
  }
  -[_ICCloudConfigurationStorage setPostAnalyticsDefaultThrottleInterval:](v5, "setPostAnalyticsDefaultThrottleInterval:");
  uint64_t v105 = [v3 objectForKeyedSubscript:@"postAnalyticsRateReduceFactor"];
  v172 = (void *)v105;
  if (v105)
  {
    [(_ICCloudConfigurationStorage *)v5 setPostAnalyticsRateReduceFactor:v105];
  }
  else
  {
    v106 = [v4 postAnalyticsRateReduceFactor];
    [(_ICCloudConfigurationStorage *)v5 setPostAnalyticsRateReduceFactor:v106];
  }
  v107 = [v3 objectForKeyedSubscript:@"batchDeleteExpiredRemindersDefaultThrottleInterval"];
  v171 = v107;
  if (v107) {
    [v107 doubleValue];
  }
  else {
    [v4 batchDeleteExpiredRemindersDefaultThrottleInterval];
  }
  -[_ICCloudConfigurationStorage setBatchDeleteExpiredRemindersDefaultThrottleInterval:](v5, "setBatchDeleteExpiredRemindersDefaultThrottleInterval:");
  uint64_t v108 = [v3 objectForKeyedSubscript:@"batchDeleteExpiredRemindersRateReduceFactor"];
  v170 = (void *)v108;
  if (v108)
  {
    [(_ICCloudConfigurationStorage *)v5 setBatchDeleteExpiredRemindersRateReduceFactor:v108];
  }
  else
  {
    v109 = [v4 batchDeleteExpiredRemindersRateReduceFactor];
    [(_ICCloudConfigurationStorage *)v5 setBatchDeleteExpiredRemindersRateReduceFactor:v109];
  }
  v110 = [v3 objectForKeyedSubscript:@"batchDeleteExpiredRemindersMinimumDeletionTimeInterval"];
  v169 = v110;
  if (v110) {
    [v110 doubleValue];
  }
  else {
    [v4 batchDeleteExpiredRemindersMinimumDeletionTimeInterval];
  }
  -[_ICCloudConfigurationStorage setBatchDeleteExpiredRemindersMinimumDeletionTimeInterval:](v5, "setBatchDeleteExpiredRemindersMinimumDeletionTimeInterval:");
  uint64_t v111 = [v3 objectForKeyedSubscript:@"minimumSearchTermLengthByBaseLanguage"];
  v168 = (void *)v111;
  if (v111)
  {
    [(_ICCloudConfigurationStorage *)v5 setMinimumSearchTermLengthByBaseLanguage:v111];
  }
  else
  {
    v112 = [v4 minimumSearchTermLengthByBaseLanguage];
    [(_ICCloudConfigurationStorage *)v5 setMinimumSearchTermLengthByBaseLanguage:v112];
  }
  v113 = [v3 objectForKeyedSubscript:@"cloudSchemaCatchUpSyncInitialRetryInterval"];
  v167 = v113;
  if (v113) {
    [v113 doubleValue];
  }
  else {
    [v4 cloudSchemaCatchUpSyncInitialRetryInterval];
  }
  -[_ICCloudConfigurationStorage setCloudSchemaCatchUpSyncInitialRetryInterval:](v5, "setCloudSchemaCatchUpSyncInitialRetryInterval:");
  v114 = [v3 objectForKeyedSubscript:@"cloudSchemaCatchUpSyncMaximumRetryCount"];
  v166 = v114;
  if (v114) {
    id v115 = [v114 unsignedIntegerValue];
  }
  else {
    id v115 = [v4 cloudSchemaCatchUpSyncMaximumRetryCount];
  }
  [(_ICCloudConfigurationStorage *)v5 setCloudSchemaCatchUpSyncMaximumRetryCount:v115];
  v116 = [v3 objectForKeyedSubscript:@"fetchDatabaseChangesOperationPerScopePerAccountMaximumRetryCount"];
  v165 = v116;
  if (v116) {
    id v117 = [v116 unsignedIntegerValue];
  }
  else {
    id v117 = [v4 fetchDatabaseChangesOperationPerScopePerAccountMaximumRetryCount];
  }
  [(_ICCloudConfigurationStorage *)v5 setFetchDatabaseChangesOperationPerScopePerAccountMaximumRetryCount:v117];
  v118 = [v3 objectForKeyedSubscript:@"objectEffectiveVersionValidationFlushBatchSize"];
  v164 = v118;
  if (v118) {
    id v119 = [v118 unsignedIntegerValue];
  }
  else {
    id v119 = [v4 objectEffectiveVersionValidationFlushBatchSize];
  }
  [(_ICCloudConfigurationStorage *)v5 setObjectEffectiveVersionValidationFlushBatchSize:v119];
  uint64_t v120 = [v3 objectForKeyedSubscript:@"suggestedAttributesTrainingOverrides"];
  v163 = (void *)v120;
  if (v120)
  {
    [(_ICCloudConfigurationStorage *)v5 setSuggestedAttributesTrainingOverrides:v120];
  }
  else
  {
    v121 = [v4 suggestedAttributesTrainingOverrides];
    [(_ICCloudConfigurationStorage *)v5 setSuggestedAttributesTrainingOverrides:v121];
  }
  uint64_t v122 = [v3 objectForKeyedSubscript:@"suggestedAttributesHarvestingOverrides"];
  v162 = (void *)v122;
  if (v122)
  {
    [(_ICCloudConfigurationStorage *)v5 setSuggestedAttributesHarvestingOverrides:v122];
  }
  else
  {
    v123 = [v4 suggestedAttributesHarvestingOverrides];
    [(_ICCloudConfigurationStorage *)v5 setSuggestedAttributesHarvestingOverrides:v123];
  }
  v124 = [v3 objectForKeyedSubscript:@"suggestedAttributesAutoTrainingThrottleInterval"];
  v161 = v124;
  if (v124) {
    [v124 doubleValue];
  }
  else {
    [v4 suggestedAttributesAutoTrainingThrottleInterval];
  }
  -[_ICCloudConfigurationStorage setSuggestedAttributesAutoTrainingThrottleInterval:](v5, "setSuggestedAttributesAutoTrainingThrottleInterval:");
  v125 = [v3 objectForKeyedSubscript:@"manualSortHintClientSideExpiration"];
  v160 = v125;
  if (v125) {
    [v125 doubleValue];
  }
  else {
    [v4 manualSortHintClientSideExpiration];
  }
  -[_ICCloudConfigurationStorage setManualSortHintClientSideExpiration:](v5, "setManualSortHintClientSideExpiration:");
  v126 = [v3 objectForKeyedSubscript:@"manualSortHintLastAccessedUpdatePolicy"];
  if ([v126 length])
  {
    [(_ICCloudConfigurationStorage *)v5 setManualSortHintLastAccessedUpdatePolicy:v126];
  }
  else
  {
    v127 = [v4 manualSortHintLastAccessedUpdatePolicy];
    [(_ICCloudConfigurationStorage *)v5 setManualSortHintLastAccessedUpdatePolicy:v127];
  }
  v128 = [v3 objectForKeyedSubscript:@"templatePublicLinkTTL"];
  v158 = v128;
  if (v128) {
    [v128 doubleValue];
  }
  else {
    [v4 templatePublicLinkTTL];
  }
  -[_ICCloudConfigurationStorage setTemplatePublicLinkTTL:](v5, "setTemplatePublicLinkTTL:");
  v129 = [v3 objectForKeyedSubscript:@"templatePublicLinkOperationTimeoutInterval"];
  v157 = v129;
  if (v129) {
    [v129 doubleValue];
  }
  else {
    [v4 templatePublicLinkOperationTimeoutInterval];
  }
  [(_ICCloudConfigurationStorage *)v5 setTemplatePublicLinkOperationTimeoutInterval:"setTemplatePublicLinkOperationTimeoutInterval:"];
  v130 = [v3 objectForKeyedSubscript:@"alarmIDsLimitPerReminder"];
  v156 = v130;
  if (v130) {
    id v131 = [v130 unsignedIntegerValue];
  }
  else {
    id v131 = [v4 alarmIDsLimitPerReminder];
  }
  [(_ICCloudConfigurationStorage *)v5 setAlarmIDsLimitPerReminder:v131];
  v132 = [v3 objectForKeyedSubscript:@"tapToRadarThrottlingInterval"];
  v155 = v132;
  if (v132) {
    [v132 doubleValue];
  }
  else {
    [v4 tapToRadarThrottlingInterval];
  }
  -[_ICCloudConfigurationStorage setTapToRadarThrottlingInterval:](v5, "setTapToRadarThrottlingInterval:");
  v133 = [v3 objectForKeyedSubscript:@"housekeepingActivityMinimumDelay"];
  v154 = v133;
  if (v133) {
    [v133 doubleValue];
  }
  else {
    [v4 housekeepingActivityMinimumDelay];
  }
  -[_ICCloudConfigurationStorage setHousekeepingActivityMinimumDelay:](v5, "setHousekeepingActivityMinimumDelay:");
  v134 = [v3 objectForKeyedSubscript:@"appStoreReviewCreatedOrCompletedRemindersCountThreshold"];
  v135 = v134;
  if (v134) {
    id v136 = [v134 unsignedIntegerValue];
  }
  else {
    id v136 = [v4 appStoreReviewCreatedOrCompletedRemindersCountThreshold];
  }
  [(_ICCloudConfigurationStorage *)v5 setAppStoreReviewCreatedOrCompletedRemindersCountThreshold:v136];
  v137 = [v3 objectForKeyedSubscript:@"appStoreReviewNumberOfForegroundsThreshold"];
  v138 = v137;
  if (v137) {
    id v139 = [v137 unsignedIntegerValue];
  }
  else {
    id v139 = [v4 appStoreReviewNumberOfForegroundsThreshold];
  }
  [(_ICCloudConfigurationStorage *)v5 setAppStoreReviewNumberOfForegroundsThreshold:v139];
  v140 = [v3 objectForKeyedSubscript:@"appStoreReviewTimeIntervalOfInterest"];
  v141 = v140;
  if (v140) {
    [v140 doubleValue];
  }
  else {
    [v4 appStoreReviewTimeIntervalOfInterest];
  }
  -[_ICCloudConfigurationStorage setAppStoreReviewTimeIntervalOfInterest:](v5, "setAppStoreReviewTimeIntervalOfInterest:");
  v142 = [v3 objectForKeyedSubscript:@"appStoreReviewTimeIntervalSinceInitialForeground"];
  v143 = v142;
  if (v142) {
    [v142 doubleValue];
  }
  else {
    [v4 appStoreReviewTimeIntervalSinceInitialForeground];
  }
  -[_ICCloudConfigurationStorage setAppStoreReviewTimeIntervalSinceInitialForeground:](v5, "setAppStoreReviewTimeIntervalSinceInitialForeground:");
  v144 = [v3 objectForKeyedSubscript:@"appStoreReviewTimeIntervalSinceLastPrompt"];
  v145 = v144;
  v159 = v126;
  if (v144) {
    [v144 doubleValue];
  }
  else {
    [v4 appStoreReviewTimeIntervalSinceLastPrompt];
  }
  -[_ICCloudConfigurationStorage setAppStoreReviewTimeIntervalSinceLastPrompt:](v5, "setAppStoreReviewTimeIntervalSinceLastPrompt:");
  v146 = [v3 objectForKeyedSubscript:@"appStoreReviewTimeIntervalSinceLastFetch"];
  v147 = v146;
  if (v146) {
    [v146 doubleValue];
  }
  else {
    [v4 appStoreReviewTimeIntervalSinceLastFetch];
  }
  -[_ICCloudConfigurationStorage setAppStoreReviewTimeIntervalSinceLastFetch:](v5, "setAppStoreReviewTimeIntervalSinceLastFetch:");
  v148 = [v3 objectForKeyedSubscript:@"iCloudIsOffTimeIntervalSinceLastPrompt"];
  v149 = v148;
  if (v148) {
    [v148 doubleValue];
  }
  else {
    [v4 iCloudIsOffTimeIntervalSinceLastPrompt];
  }
  -[_ICCloudConfigurationStorage setICloudIsOffTimeIntervalSinceLastPrompt:](v5, "setICloudIsOffTimeIntervalSinceLastPrompt:");
  [(ICCloudConfiguration *)self setStorage:v5];
  uint64_t v150 = +[ICCloudContext processingQueue];
  v151 = v5;
  v152 = v150;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003FD54;
  block[3] = &unk_1008ADA80;
  v153 = v151;
  v225 = v153;
  dispatch_async(v152, block);
}

- (id)valueForUndefinedKey:(id)a3
{
  id v4 = a3;
  int v5 = [(ICCloudConfiguration *)self storage];
  id v6 = [v5 valueForKey:v4];

  return v6;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ICCloudConfiguration;
  if (-[ICCloudConfiguration respondsToSelector:](&v7, "respondsToSelector:"))
  {
    char v4 = 1;
  }
  else
  {
    int v5 = [(ICCloudConfiguration *)self storage];
    char v4 = objc_opt_respondsToSelector();
  }
  return v4 & 1;
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ICCloudConfiguration *)self storage];
  [v8 setValue:v7 forKey:v6];
}

- (_ICCloudConfigurationStorage)storage
{
  return (_ICCloudConfigurationStorage *)objc_getProperty(self, a2, 8, 1);
}

- (void)setStorage:(id)a3
{
}

- (NSURLSession)session
{
  return (NSURLSession *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);

  objc_storeStrong((id *)&self->_storage, 0);
}

@end