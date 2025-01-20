@interface FCConfigurationManager
- (BOOL)_currentAppConfigurationIsExpired;
- (FCConfigurationManager)init;
- (FCConfigurationManager)initWithContextConfiguration:(id)a3 contentHostDirectoryFileURL:(id)a4 feldsparIDProvider:(id)a5;
- (FCConfigurationManager)initWithContextConfiguration:(id)a3 contentHostDirectoryFileURL:(id)a4 feldsparIDProvider:(id)a5 appShortVersionString:(id)a6 buildNumberString:(id)a7 networkBehaviorMonitor:(id)a8;
- (FCConfigurationManager)initWithContextConfiguration:(id)a3 contentHostDirectoryFileURL:(id)a4 feldsparIDProvider:(id)a5 appShortVersionString:(id)a6 buildNumberString:(id)a7 networkBehaviorMonitor:(id)a8 appActivityMonitor:(id)a9 applicationState:(unint64_t)a10;
- (FCCoreConfiguration)configuration;
- (FCNewsAppConfiguration)appConfiguration;
- (FCNewsAppConfiguration)fetchedAppConfiguration;
- (FCNewsAppConfiguration)jsonEncodableAppConfiguration;
- (FCNewsAppConfiguration)possiblyUnfetchedAppConfiguration;
- (NSArray)segmentSetIDs;
- (NSArray)treatmentIDs;
- (NSData)audioFeedConfigData;
- (NSData)magazinesConfigurationData;
- (NSData)todayFeedConfigurationData;
- (NSString)feldsparID;
- (id)_changeTagsInRecords:(void *)a1;
- (id)_changeTagsInWidgetConfigurationDict:(uint64_t)a1;
- (id)_configurationSettingsWithRequestInfos:(void *)a3 feldsparID:(void *)a4 storefrontID:(unsigned int)a5 contextConfiguration:(void *)a6 useBackgroundRefreshRate:requestMode:formatVersion:;
- (id)_deviceInfoWithFormatVersion:(uint64_t)a3;
- (id)_loadConfigDataForRequestKey:(void *)a1;
- (id)_mergeRecords:(void *)a1 withCachedRecords:(void *)a2;
- (id)_requestInfoForRequestKey:(void *)a3 storefrontID:(void *)a4 additionalChangeTags:(uint64_t)a5 feedType:(void *)a6 cachePolicy:;
- (id)_requestInfoForRequestKey:(void *)a3 storefrontID:(void *)a4 additionalChangeTags:(void *)a5 cachePolicy:;
- (id)_storefrontID;
- (id)currentAppConfiguration;
- (id)initForTesting;
- (id)lastModificationDate;
- (void)_configurationDidChangeSignificantConfigChange:(int)a3 paywallConfigDidChange:(char)a4 scienceExperimentFieldsDidChange:;
- (void)_fetchAppConfigurationIfNeededWithForceRefresh:(void *)a3 completion:;
- (void)_saveConfigData:(uint64_t)a3 forRequestKey:;
- (void)activityObservingApplicationDidEnterBackground;
- (void)activityObservingApplicationWillEnterForeground;
- (void)addAppConfigObserver:(id)a3;
- (void)addObserver:(id)a3;
- (void)feldsparIDProviderDidChangeFeldsparID:(id)a3;
- (void)fetchAppConfigurationIfNeededWithCompletion:(id)a3;
- (void)fetchAppConfigurationIfNeededWithCompletionQueue:(id)a3 completion:(id)a4;
- (void)fetchAppWidgetConfigurationWithTodayLiteConfig:(BOOL)a3 additionalFields:(id)a4 completion:(id)a5;
- (void)fetchAudioFeedConfigIfNeededWithCompletionQueue:(id)a3 formatVersion:(id)a4 completion:(id)a5;
- (void)fetchConfigurationIfNeededWithCompletion:(id)a3;
- (void)fetchConfigurationIfNeededWithCompletionQueue:(id)a3 completion:(id)a4;
- (void)fetchMagazinesConfigurationIfNeededWithCompletionQueue:(id)a3 formatVersion:(id)a4 completion:(id)a5;
- (void)fetchTodayFeedConfigurationIfNeededWithCompletionQueue:(id)a3 feedType:(unint64_t)a4 formatVersion:(id)a5 cachePolicy:(id)a6 networkActivityBlock:(id)a7 completion:(id)a8;
- (void)refreshAppConfigurationIfNeededWithCompletionQueue:(id)a3 refreshCompletion:(id)a4;
- (void)removeAppConfigObserver:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setSegmentSetIDs:(id)a3;
- (void)setTreatmentIDs:(id)a3;
@end

@implementation FCConfigurationManager

void __84__FCConfigurationManager__fetchAppConfigurationIfNeededWithForceRefresh_completion___block_invoke_3(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 9) = 1;
}

- (void)fetchAppConfigurationIfNeededWithCompletion:(id)a3
{
}

uint64_t __59__FCConfigurationManager__currentAppConfigurationIsExpired__block_invoke(uint64_t a1)
{
  uint64_t v2 = -[FCConfigurationManager currentAppConfiguration](*(id **)(a1 + 32));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = -[FCConfigurationManager lastModificationDate](*(id **)(a1 + 32));
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v7 = *(void *)(v6 + 40);
  *(void *)(v6 + 40) = v5;
  return MEMORY[0x1F41817F8](v5, v7);
}

- (id)lastModificationDate
{
  if (a1)
  {
    uint64_t v2 = a1;
    [a1[12] assertLocked];
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)currentAppConfiguration
{
  if (a1)
  {
    uint64_t v2 = a1;
    [a1[12] assertLocked];
    a1 = (id *)v2[2];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (FCConfigurationManager)initWithContextConfiguration:(id)a3 contentHostDirectoryFileURL:(id)a4 feldsparIDProvider:(id)a5 appShortVersionString:(id)a6 buildNumberString:(id)a7 networkBehaviorMonitor:(id)a8 appActivityMonitor:(id)a9 applicationState:(unint64_t)a10
{
  location[16] = *(id *)MEMORY[0x1E4F143B8];
  id v101 = a3;
  id v102 = a4;
  id v99 = a5;
  id v104 = a6;
  id v103 = a7;
  id v100 = a8;
  id v105 = a9;
  v113.receiver = self;
  v113.super_class = (Class)FCConfigurationManager;
  selfa = [(FCConfigurationManager *)&v113 init];
  if (!selfa) {
    goto LABEL_77;
  }
  objc_storeStrong((id *)selfa + 5, a3);
  objc_storeStrong((id *)selfa + 6, a5);
  [*((id *)selfa + 6) addObserver:selfa];
  uint64_t v17 = [v104 copy];
  v18 = (void *)*((void *)selfa + 7);
  *((void *)selfa + 7) = v17;

  uint64_t v19 = [v103 copy];
  v20 = (void *)*((void *)selfa + 8);
  *((void *)selfa + 8) = v19;

  *((void *)selfa + 9) = a10;
  objc_storeStrong((id *)selfa + 10, a9);
  if (v105) {
    [v105 addObserver:selfa];
  }
  objc_storeStrong((id *)selfa + 11, a8);
  v21 = [v101 contentContainerCombinationIdentifier];
  v106 = [v102 URLByAppendingPathComponent:v21 isDirectory:1];

  uint64_t v22 = [objc_alloc(MEMORY[0x1E4F95D90]) initWithContentDirectoryURL:v106];
  v23 = (void *)*((void *)selfa + 4);
  *((void *)selfa + 4) = v22;

  uint64_t v24 = [objc_alloc(MEMORY[0x1E4F81C18]) initWithOptions:1];
  v25 = (void *)*((void *)selfa + 12);
  *((void *)selfa + 12) = v24;

  uint64_t v26 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
  v27 = (void *)*((void *)selfa + 26);
  *((void *)selfa + 26) = v26;

  uint64_t v28 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
  v29 = (void *)*((void *)selfa + 25);
  *((void *)selfa + 25) = v28;

  v30 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v31 = dispatch_queue_attr_make_with_qos_class(v30, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v32 = dispatch_queue_create("FCAppConfig.workQueue", v31);
  v33 = (void *)*((void *)selfa + 13);
  *((void *)selfa + 13) = v32;

  v34 = [[FCAsyncSerialQueue alloc] initWithUnderlyingQueue:*((void *)selfa + 13) qualityOfService:25];
  v35 = (void *)*((void *)selfa + 14);
  *((void *)selfa + 14) = v34;

  v36 = [[FCAsyncSerialQueue alloc] initWithUnderlyingQueue:*((void *)selfa + 13) qualityOfService:25];
  v37 = (void *)*((void *)selfa + 15);
  *((void *)selfa + 15) = v36;

  v38 = [[FCAsyncSerialQueue alloc] initWithUnderlyingQueue:*((void *)selfa + 13) qualityOfService:25];
  v39 = (void *)*((void *)selfa + 16);
  *((void *)selfa + 16) = v38;

  v40 = [[FCAsyncSerialQueue alloc] initWithUnderlyingQueue:*((void *)selfa + 13) qualityOfService:25];
  v41 = (void *)*((void *)selfa + 17);
  *((void *)selfa + 17) = v40;

  v42 = [[FCAsyncSerialQueue alloc] initWithUnderlyingQueue:*((void *)selfa + 13) qualityOfService:25];
  v43 = (void *)*((void *)selfa + 18);
  *((void *)selfa + 18) = v42;

  v44 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v45 = [v44 stringForKey:@"FCAppConfigurationBundleShortVersionKey"];
  v46 = [MEMORY[0x1E4F28B50] mainBundle];
  v47 = [v46 infoDictionary];
  v48 = [v47 objectForKeyedSubscript:@"CFBundleShortVersionString"];

  if (([v48 isEqualToString:v45] & 1) == 0
    || (NewsCoreUserDefaults(),
        v49 = objc_claimAutoreleasedReturnValue(),
        int v50 = [v49 BOOLForKey:@"force_refresh_user_segmentation"],
        v49,
        v50))
  {
    [v44 setObject:v48 forKey:@"FCAppConfigurationBundleShortVersionKey"];
    v52 = NewsCoreUserDefaults();
    [v52 setBool:0 forKey:@"force_refresh_user_segmentation"];

    char v51 = 1;
  }
  else
  {
    char v51 = 0;
  }

  *((unsigned char *)selfa + 8) = v51;
  uint64_t v53 = [v106 URLByAppendingPathComponent:@"app-configs"];
  v54 = (void *)*((void *)selfa + 19);
  *((void *)selfa + 19) = v53;

  v55 = [FCKeyValueStore alloc];
  v56 = [v106 relativePath];
  uint64_t v57 = [(FCKeyValueStore *)v55 initWithName:@"app-config" directory:v56 version:2 options:0 classRegistry:0];
  v58 = (void *)*((void *)selfa + 20);
  *((void *)selfa + 20) = v57;

  if (*((unsigned char *)selfa + 8))
  {
    [*((id *)selfa + 20) removeAllObjects];
    v59 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v59 removeItemAtURL:*((void *)selfa + 19) error:0];
  }
  v60 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v60 createDirectoryAtURL:*((void *)selfa + 19) withIntermediateDirectories:1 attributes:0 error:0];

  id v109 = *((id *)selfa + 20);
  v107 = -[FCConfigurationManager _storefrontID]((uint64_t)selfa);
  long long v120 = 0u;
  long long v121 = 0u;
  long long v119 = 0u;
  long long v118 = 0u;
  location[0] = @"appConfigRequest";
  location[1] = @"magazinesConfigRequest";
  location[2] = @"audioConfigRequest";
  location[3] = @"todayConfigRequest";
  obuint64_t j = [MEMORY[0x1E4F1C978] arrayWithObjects:location count:4];
  v61 = 0;
  uint64_t v62 = [obj countByEnumeratingWithState:&v118 objects:location count:16];
  if (v62)
  {
    uint64_t v63 = *(void *)v119;
    do
    {
      for (uint64_t i = 0; i != v62; ++i)
      {
        if (*(void *)v119 != v63) {
          objc_enumerationMutation(obj);
        }
        v65 = *(void **)(*((void *)&v118 + 1) + 8 * i);
        v66 = (void *)MEMORY[0x1A6260FD0]();
        if ([v65 isEqualToString:@"appConfigRequest"])
        {
          v67 = -[FCConfigurationManager _loadConfigDataForRequestKey:](*((void **)selfa + 19), (uint64_t)v65);
          v68 = [(FCConfigurationManager *)*((void **)selfa + 7) _deviceInfoWithFormatVersion:0];
          v69 = v68;
          if (v67)
          {
            v70 = [v68 preferredLanguages];
            uint64_t v71 = +[FCNewsAppConfig configurationWithData:storefrontID:preferredLanguageTags:]((uint64_t)FCNewsAppConfig, v67, v107, v70);

            v61 = v70;
          }
          else
          {
            uint64_t v71 = 0;
          }
        }
        else
        {
          if ([v65 isEqualToString:@"magazinesConfigRequest"])
          {
            v67 = -[FCConfigurationManager _loadConfigDataForRequestKey:](*((void **)selfa + 19), (uint64_t)v65);
            objc_setProperty_nonatomic_copy(selfa, v72, v67, 176);
          }
          else if ([v65 isEqualToString:@"todayConfigRequest"])
          {
            v67 = -[FCConfigurationManager _loadConfigDataForRequestKey:](*((void **)selfa + 19), (uint64_t)v65);
            objc_setProperty_nonatomic_copy(selfa, v73, v67, 184);
          }
          else
          {
            if (![v65 isEqualToString:@"audioConfigRequest"]) {
              goto LABEL_28;
            }
            v67 = -[FCConfigurationManager _loadConfigDataForRequestKey:](*((void **)selfa + 19), (uint64_t)v65);
            objc_setProperty_nonatomic_copy(selfa, v74, v67, 192);
          }
          uint64_t v71 = (uint64_t)v61;
        }

        v61 = (void *)v71;
LABEL_28:
      }
      uint64_t v62 = [obj countByEnumeratingWithState:&v118 objects:location count:16];
    }
    while (v62);
  }

  long long v116 = 0u;
  long long v117 = 0u;
  long long v114 = 0u;
  long long v115 = 0u;
  v75 = [v109 allKeys];
  id v76 = 0;
  uint64_t v77 = [v75 countByEnumeratingWithState:&v114 objects:v124 count:16];
  if (!v77) {
    goto LABEL_66;
  }
  uint64_t v78 = *(void *)v115;
  do
  {
    for (uint64_t j = 0; j != v77; ++j)
    {
      if (*(void *)v115 != v78) {
        objc_enumerationMutation(v75);
      }
      v80 = *(void **)(*((void *)&v114 + 1) + 8 * j);
      if ([v80 isEqualToString:@"lastModificationDate"])
      {
        objc_opt_class();
        v81 = [v109 objectForKey:v80];
        if (v81)
        {
          if (objc_opt_isKindOfClass()) {
            v82 = v81;
          }
          else {
            v82 = 0;
          }
        }
        else
        {
          v82 = 0;
        }
        id v85 = v76;
        id v76 = v82;
      }
      else if ([v80 isEqualToString:@"treatmentIDs"])
      {
        objc_opt_class();
        v81 = [v109 objectForKey:v80];
        if (v81)
        {
          if (objc_opt_isKindOfClass()) {
            v83 = v81;
          }
          else {
            v83 = 0;
          }
        }
        else
        {
          v83 = 0;
        }
        id v85 = v83;
        [selfa setTreatmentIDs:v85];
      }
      else if ([v80 isEqualToString:@"segmentSetIDs"])
      {
        objc_opt_class();
        v81 = [v109 objectForKey:v80];
        if (v81)
        {
          if (objc_opt_isKindOfClass()) {
            v84 = v81;
          }
          else {
            v84 = 0;
          }
        }
        else
        {
          v84 = 0;
        }
        id v85 = v84;
        [selfa setSegmentSetIDs:v85];
      }
      else
      {
        if (![v80 isEqualToString:@"widgetConfigurationDict"]) {
          continue;
        }
        objc_opt_class();
        v81 = [v109 objectForKey:v80];
        if (v81)
        {
          if (objc_opt_isKindOfClass()) {
            v86 = v81;
          }
          else {
            v86 = 0;
          }
        }
        else
        {
          v86 = 0;
        }
        id v87 = v86;
        id v85 = (id)*((void *)selfa + 21);
        *((void *)selfa + 21) = v87;
      }
    }
    uint64_t v77 = [v75 countByEnumeratingWithState:&v114 objects:v124 count:16];
  }
  while (v77);
LABEL_66:

  v88 = (void *)*((void *)selfa + 21);
  if (v88)
  {
    v89 = [v88 objectForKeyedSubscript:@"widgetAppConfiguration"];
    v90 = [v89 objectForKeyedSubscript:@"widgetLanguageConfiguration"];
    v91 = -[FCNewsAppConfig initWithConfigDictionary:storefrontID:languageConfigDictionary:]([FCNewsAppConfig alloc], v89, v107, v90);

    v61 = v91;
  }
  if (v76)
  {
    objc_storeStrong((id *)selfa + 3, v76);
  }
  else
  {
    uint64_t v92 = [MEMORY[0x1E4F1C9C8] distantPast];
    v93 = (void *)*((void *)selfa + 3);
    *((void *)selfa + 3) = v92;

    [v109 setObject:*((void *)selfa + 3) forKey:@"lastModificationDate"];
  }
  v94 = FCAppConfigurationLog;
  if (os_log_type_enabled((os_log_t)FCAppConfigurationLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v95 = *((void *)selfa + 3);
    *(_DWORD *)buf = 138543362;
    uint64_t v123 = v95;
    _os_log_impl(&dword_1A460D000, v94, OS_LOG_TYPE_DEFAULT, "App config initialized with lastModificationDate: %{public}@", buf, 0xCu);
  }
  if (v61)
  {
    id v96 = v61;
  }
  else
  {
    +[FCNewsAppConfig defaultConfigurationForStoreFrontID:]((uint64_t)FCNewsAppConfig, v107);
    id v96 = (id)objc_claimAutoreleasedReturnValue();
  }
  v97 = (void *)*((void *)selfa + 2);
  *((void *)selfa + 2) = v96;

  objc_initWeak(location, selfa);
  v111[0] = MEMORY[0x1E4F143A8];
  v111[1] = 3221225472;
  v111[2] = __201__FCConfigurationManager_initWithContextConfiguration_contentHostDirectoryFileURL_feldsparIDProvider_appShortVersionString_buildNumberString_networkBehaviorMonitor_appActivityMonitor_applicationState___block_invoke;
  v111[3] = &unk_1E5B4F868;
  objc_copyWeak(&v112, location);
  [*((id *)selfa + 4) setNetworkEventHandler:v111];
  objc_destroyWeak(&v112);
  objc_destroyWeak(location);

LABEL_77:
  return (FCConfigurationManager *)selfa;
}

- (id)_loadConfigDataForRequestKey:(void *)a1
{
  uint64_t v2 = [a1 URLByAppendingPathComponent:a2];
  uint64_t v3 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v2];

  return v3;
}

- (void)setTreatmentIDs:(id)a3
{
}

- (void)setSegmentSetIDs:(id)a3
{
}

uint64_t __83__FCConfigurationManager_fetchConfigurationIfNeededWithCompletionQueue_completion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __39__FCConfigurationManager_segmentSetIDs__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 224) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

uint64_t __86__FCConfigurationManager_fetchAppConfigurationIfNeededWithCompletionQueue_completion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (NSArray)segmentSetIDs
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__18;
  v12 = __Block_byref_object_dispose__18;
  id v13 = 0;
  if (self) {
    accessLock = self->_accessLock;
  }
  else {
    accessLock = 0;
  }
  uint64_t v4 = accessLock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__FCConfigurationManager_segmentSetIDs__block_invoke;
  v7[3] = &unk_1E5B4C258;
  v7[4] = self;
  v7[5] = &v8;
  [(NFUnfairLock *)v4 performWithLockSync:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSArray *)v5;
}

void __93__FCConfigurationManager__refreshAppConfigurationWithConfigurationSettings_force_completion___block_invoke_3(uint64_t a1)
{
}

- (FCNewsAppConfiguration)possiblyUnfetchedAppConfiguration
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__18;
  v12 = __Block_byref_object_dispose__18;
  id v13 = 0;
  if (self) {
    accessLock = self->_accessLock;
  }
  else {
    accessLock = 0;
  }
  uint64_t v4 = accessLock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__FCConfigurationManager_possiblyUnfetchedAppConfiguration__block_invoke;
  v7[3] = &unk_1E5B4C258;
  v7[4] = self;
  v7[5] = &v8;
  [(NFUnfairLock *)v4 performWithLockSync:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (FCNewsAppConfiguration *)v5;
}

void __93__FCConfigurationManager__refreshAppConfigurationWithConfigurationSettings_force_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __93__FCConfigurationManager__refreshAppConfigurationWithConfigurationSettings_force_completion___block_invoke_2;
  aBlock[3] = &unk_1E5B4FA20;
  aBlock[4] = *(void *)(a1 + 32);
  id v4 = v3;
  id v31 = v4;
  id v32 = *(id *)(a1 + 48);
  id v5 = _Block_copy(aBlock);
  uint64_t v6 = [*(id *)(a1 + 32) configuration];
  BOOL v7 = -[FCConfigurationManager _currentAppConfigurationIsExpired](*(void *)(a1 + 32));
  if (*(unsigned char *)(a1 + 56) || !v6 || (([v6 isDefaultConfiguration] | v7) & 1) != 0)
  {
    uint64_t v8 = [MEMORY[0x1E4F1C9C8] date];
    v9 = FCAppConfigurationLog;
    if (os_log_type_enabled((os_log_t)FCAppConfigurationLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A460D000, v9, OS_LOG_TYPE_DEFAULT, "will refresh app configuration", buf, 2u);
    }
    uint64_t v10 = *(void *)(a1 + 32);
    if (v10)
    {
      v11 = *(void **)(v10 + 32);
      uint64_t v12 = *(void *)(v10 + 104);
    }
    else
    {
      v11 = 0;
      uint64_t v12 = 0;
    }
    id v13 = *(void **)(a1 + 40);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __93__FCConfigurationManager__refreshAppConfigurationWithConfigurationSettings_force_completion___block_invoke_127;
    v19[3] = &unk_1E5B4FA48;
    id v20 = v8;
    id v23 = v5;
    id v14 = v13;
    uint64_t v15 = *(void *)(a1 + 32);
    id v21 = v14;
    uint64_t v22 = v15;
    id v16 = v5;
    id v17 = v8;
    [v11 fetchSingleConfigurationWithSettings:v14 completionQueue:v12 completion:v19];
  }
  else
  {
    uint64_t v25 = MEMORY[0x1E4F143A8];
    uint64_t v26 = 3221225472;
    v27 = __93__FCConfigurationManager__refreshAppConfigurationWithConfigurationSettings_force_completion___block_invoke_4;
    uint64_t v28 = &unk_1E5B4CA88;
    v29 = v5;
    id v18 = v5;
    id v17 = v18;
    if (v18)
    {
      (*((void (**)(id, void))v18 + 2))(v18, 0);
      id v16 = v29;
    }
    else
    {
      id v16 = 0;
    }
  }
}

void __49__FCConfigurationManager_fetchedAppConfiguration__block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 16) isDefaultConfiguration]) {
    uint64_t v2 = 0;
  }
  else {
    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16);
  }
  id v3 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  objc_storeStrong(v3, v2);
}

void __84__FCConfigurationManager__fetchAppConfigurationIfNeededWithForceRefresh_completion___block_invoke(uint64_t a1)
{
  v42[1] = *MEMORY[0x1E4F143B8];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __84__FCConfigurationManager__fetchAppConfigurationIfNeededWithForceRefresh_completion___block_invoke_2;
  aBlock[3] = &unk_1E5B4F9A8;
  uint64_t v2 = *(void **)(a1 + 40);
  aBlock[4] = *(void *)(a1 + 32);
  id v37 = v2;
  id v3 = _Block_copy(aBlock);
  id v4 = *(unsigned char **)(a1 + 32);
  if (v4 && v4[10])
  {
    uint64_t v31 = MEMORY[0x1E4F143A8];
    uint64_t v32 = 3221225472;
    v33 = __84__FCConfigurationManager__fetchAppConfigurationIfNeededWithForceRefresh_completion___block_invoke_4;
    v34 = &unk_1E5B4CA88;
    v35 = v3;
    v35[2](v35, 1, 0);
    id v5 = v35;
  }
  else
  {
    uint64_t v6 = [v4 configuration];
    id v5 = v6;
    if (v6)
    {
      char v7 = [v6 isDefaultConfiguration];
      char v8 = 1;
      if (!*(unsigned char *)(a1 + 48) && (v7 & 1) == 0)
      {
        (*((void (**)(void *, uint64_t, void))v3 + 2))(v3, 1, 0);
        if (!-[FCConfigurationManager _currentAppConfigurationIsExpired](*(void *)(a1 + 32))) {
          goto LABEL_15;
        }
        char v8 = 0;
      }
    }
    else
    {
      char v8 = 1;
    }
    v9 = -[FCConfigurationManager _storefrontID](*(void *)(a1 + 32));
    uint64_t v10 = *(id **)(a1 + 32);
    v11 = +[FCCachePolicy defaultCachePolicy];
    uint64_t v12 = -[FCConfigurationManager _requestInfoForRequestKey:storefrontID:additionalChangeTags:cachePolicy:](v10, @"appConfigRequest", v9, 0, v11);

    uint64_t v13 = *(void *)(a1 + 32);
    v42[0] = v12;
    id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:1];
    uint64_t v15 = *(void **)(a1 + 32);
    if (v15) {
      uint64_t v15 = (void *)v15[6];
    }
    id v16 = v15;
    id v17 = [v16 feldsparID];
    id v18 = -[FCConfigurationManager _configurationSettingsWithRequestInfos:feldsparID:storefrontID:contextConfiguration:useBackgroundRefreshRate:requestMode:formatVersion:](v13, v14, v17, v9, 0, 0);

    uint64_t v19 = *(void *)(a1 + 32);
    char v20 = *(unsigned char *)(a1 + 48);
    uint64_t v25 = MEMORY[0x1E4F143A8];
    uint64_t v26 = 3221225472;
    v27 = __84__FCConfigurationManager__fetchAppConfigurationIfNeededWithForceRefresh_completion___block_invoke_6;
    uint64_t v28 = &unk_1E5B4F9D0;
    id v29 = v3;
    LOBYTE(v30) = v8;
    id v21 = v18;
    uint64_t v22 = &v25;
    id v23 = v22;
    if (v19)
    {
      uint64_t v24 = *(void **)(v19 + 112);
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __93__FCConfigurationManager__refreshAppConfigurationWithConfigurationSettings_force_completion___block_invoke;
      v38[3] = &unk_1E5B4FA70;
      v38[4] = v19;
      v40 = v22;
      char v41 = v20;
      id v39 = v21;
      objc_msgSend(v24, "enqueueBlock:", v38, v25, v26, v27, v28, v29, v30);
    }
  }
LABEL_15:
}

- (FCCoreConfiguration)configuration
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__18;
  uint64_t v12 = __Block_byref_object_dispose__18;
  id v13 = 0;
  if (self) {
    accessLock = self->_accessLock;
  }
  else {
    accessLock = 0;
  }
  id v4 = accessLock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__FCConfigurationManager_configuration__block_invoke;
  v7[3] = &unk_1E5B4C258;
  v7[4] = self;
  v7[5] = &v8;
  [(NFUnfairLock *)v4 performWithLockSync:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (FCCoreConfiguration *)v5;
}

void __84__FCConfigurationManager__fetchAppConfigurationIfNeededWithForceRefresh_completion___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__18;
  id v14 = __Block_byref_object_dispose__18;
  id v15 = 0;
  uint64_t v6 = *(void **)(a1 + 32);
  if (v6) {
    uint64_t v6 = (void *)v6[12];
  }
  char v7 = v6;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __84__FCConfigurationManager__fetchAppConfigurationIfNeededWithForceRefresh_completion___block_invoke_3;
  v9[3] = &unk_1E5B4C258;
  v9[4] = *(void *)(a1 + 32);
  v9[5] = &v10;
  [v7 performWithLockSync:v9];

  if (a2)
  {
    uint64_t v8 = *(void *)(a1 + 40);
    if (v8) {
      (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, v11[5], v5);
    }
  }
  _Block_object_dispose(&v10, 8);
}

- (BOOL)_currentAppConfigurationIsExpired
{
  BOOL v1 = a1;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v17 = 0;
    id v18 = &v17;
    uint64_t v19 = 0x3032000000;
    char v20 = __Block_byref_object_copy__18;
    id v21 = __Block_byref_object_dispose__18;
    id v22 = 0;
    uint64_t v11 = 0;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x3032000000;
    id v14 = __Block_byref_object_copy__18;
    id v15 = __Block_byref_object_dispose__18;
    id v16 = 0;
    id v2 = *(id *)(a1 + 96);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __59__FCConfigurationManager__currentAppConfigurationIsExpired__block_invoke;
    v10[3] = &unk_1E5B4EDD0;
    v10[4] = v1;
    v10[5] = &v17;
    v10[6] = &v11;
    [v2 performWithLockSync:v10];

    objc_msgSend((id)v12[5], "fc_timeIntervalUntilNow");
    double v4 = v3;
    uint64_t v5 = [(id)v18[5] appConfigRefreshRate];
    BOOL v1 = v4 >= (double)v5;
    if (v4 >= (double)v5)
    {
      uint64_t v6 = (id)FCAppConfigurationLog;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = v12[5];
        uint64_t v8 = [(id)v18[5] appConfigRefreshRate];
        *(_DWORD *)buf = 138543618;
        uint64_t v24 = v7;
        __int16 v25 = 2048;
        uint64_t v26 = v8;
        _os_log_impl(&dword_1A460D000, v6, OS_LOG_TYPE_DEFAULT, "App config needs to refresh lastModificationDate: %{public}@ refreshRate: %lld", buf, 0x16u);
      }
    }
    _Block_object_dispose(&v11, 8);

    _Block_object_dispose(&v17, 8);
  }
  return v1;
}

void __86__FCConfigurationManager_fetchAppConfigurationIfNeededWithCompletionQueue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void **)(a1 + 40);
  if (v7)
  {
    uint64_t v8 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __86__FCConfigurationManager_fetchAppConfigurationIfNeededWithCompletionQueue_completion___block_invoke_2;
    block[3] = &unk_1E5B4F080;
    id v12 = v7;
    id v10 = v5;
    id v11 = v6;
    dispatch_async(v8, block);
  }
}

void __83__FCConfigurationManager_fetchConfigurationIfNeededWithCompletionQueue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void **)(a1 + 40);
  if (v7)
  {
    uint64_t v8 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __83__FCConfigurationManager_fetchConfigurationIfNeededWithCompletionQueue_completion___block_invoke_2;
    block[3] = &unk_1E5B4F080;
    id v12 = v7;
    id v10 = v5;
    id v11 = v6;
    dispatch_async(v8, block);
  }
}

- (id)_storefrontID
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    BOOL v1 = +[FCAppleAccount sharedAccount];
    id v2 = [v1 contentStoreFrontID];

    double v3 = +[FCAppleAccount sharedAccount];
    double v4 = [v3 supportedContentStoreFrontID];

    int v5 = objc_msgSend(MEMORY[0x1E4FBA8A8], "nf_object:isEqualToObject:", v2, v4);
    uint64_t v6 = FCAppConfigurationLog;
    BOOL v7 = os_log_type_enabled((os_log_t)FCAppConfigurationLog, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v7)
      {
        int v12 = 138543362;
        uint64_t v13 = v2;
        uint64_t v8 = "configuration manager will use the current storefrontID: %{public}@";
        v9 = v6;
        uint32_t v10 = 12;
LABEL_7:
        _os_log_impl(&dword_1A460D000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v12, v10);
      }
    }
    else if (v7)
    {
      int v12 = 138543618;
      uint64_t v13 = v2;
      __int16 v14 = 2114;
      id v15 = v4;
      uint64_t v8 = "configuration manager will fall back from the current storefrontID: %{public}@ to the supported storefrontID: %{public}@";
      v9 = v6;
      uint32_t v10 = 22;
      goto LABEL_7;
    }

    goto LABEL_9;
  }
  double v4 = 0;
LABEL_9:
  return v4;
}

- (id)_configurationSettingsWithRequestInfos:(void *)a3 feldsparID:(void *)a4 storefrontID:(unsigned int)a5 contextConfiguration:(void *)a6 useBackgroundRefreshRate:requestMode:formatVersion:
{
  if (a1)
  {
    id v11 = *(void **)(a1 + 40);
    id v12 = a6;
    id v13 = a4;
    __int16 v14 = a3;
    id v15 = a2;
    unint64_t v16 = [v11 environment] - 1;
    if (v16 > 5) {
      uint64_t v17 = 0;
    }
    else {
      uint64_t v17 = qword_1A49738E8[v16];
    }
    v58 = v15;
    v59 = v13;
    uint64_t v57 = v14;
    if (NFInternalBuild())
    {
      id v18 = NewsCoreUserDefaults();
      uint64_t v19 = [v18 BOOLForKey:@"disable_ab_testing_user_segmentation"];

      char v20 = NewsCoreUserDefaults();
      char v21 = [v20 BOOLForKey:@"enable_extra_logs_user_segmentation"];
    }
    else
    {
      char v21 = 0;
      uint64_t v19 = 0;
    }
    int v22 = *(unsigned __int8 *)(a1 + 8);
    *(unsigned char *)(a1 + 8) = 0;
    self;
    unsigned int v60 = a5;
    char v55 = v21;
    v54 = v12;
    if (NFInternalBuild())
    {
      int v23 = v22;
      uint64_t v24 = NewsCoreUserDefaults();
      int v25 = [v24 BOOLForKey:@"enable_overrides_user_segmentation"];

      if (v25)
      {
        uint64_t v26 = NewsCoreUserDefaults();
        uint64_t v27 = [v26 stringForKey:@"override_segment_set_ids"];

        uint64_t v28 = a1;
        if ([v27 length])
        {
          id v29 = [v27 componentsSeparatedByString:@","];
        }
        else
        {
          id v29 = 0;
        }
        uint64_t v30 = objc_msgSend(v29, "fc_arrayByTransformingWithBlock:", &__block_literal_global_181);
      }
      else
      {
        uint64_t v28 = a1;
        uint64_t v30 = 0;
      }
      uint64_t v31 = v17;
      uint64_t v32 = v19;
      int v22 = v23;
    }
    else
    {
      uint64_t v28 = a1;
      uint64_t v30 = 0;
      uint64_t v31 = v17;
      uint64_t v32 = v19;
    }
    self;
    if (NFInternalBuild())
    {
      int v33 = v22;
      v34 = NewsCoreUserDefaults();
      int v35 = [v34 BOOLForKey:@"enable_overrides_user_segmentation"];

      if (v35)
      {
        v36 = NewsCoreUserDefaults();
        id v37 = [v36 stringForKey:@"override_additional_segment_set_ids"];

        if ([v37 length])
        {
          v38 = [v37 componentsSeparatedByString:@","];
        }
        else
        {
          v38 = 0;
        }
        int v22 = v33;
        id v39 = objc_msgSend(v38, "fc_arrayByTransformingWithBlock:", &__block_literal_global_184);
      }
      else
      {
        id v39 = 0;
        int v22 = v33;
      }
    }
    else
    {
      id v39 = 0;
    }
    if ([v30 count])
    {

      id v39 = 0;
    }
    v40 = NewsCoreUserDefaults();
    id v41 = [v40 stringForKey:@"configuration_source"];
    if ([v41 isEqualToString:@"endpoint_source"])
    {
      uint64_t v42 = 1;
    }
    else if ([v41 isEqualToString:@"cloudkit_source"])
    {
      uint64_t v42 = 2;
    }
    else
    {
      uint64_t v42 = 0;
    }

    LOBYTE(v53) = v55;
    v43 = (void *)[objc_alloc(MEMORY[0x1E4F95DA0]) initWithDisableAbTesting:v32 overrideSegmentSetIDs:v30 additionalSegmentSetIDs:v39 configurationSource:v42 debugEnvironment:v31 ignoreCache:v22 != 0 enableExtraLogs:v53];
    v44 = &stru_1EF8299B8;
    if (v57) {
      v44 = v57;
    }
    v45 = v44;
    v46 = [(FCConfigurationManager *)*(void **)(v28 + 56) _deviceInfoWithFormatVersion:(uint64_t)v54];

    v56 = v39;
    id v47 = objc_alloc(MEMORY[0x1E4F95D98]);
    v48 = AppBundleID();
    v49 = (void *)[v47 initWithRequestInfos:v58 userID:v45 storefrontID:v59 bundleID:v48 deviceInfo:v46];

    [v49 setDebugOverrides:v43];
    [v49 setUseBackgroundRefreshRate:v60];
    [v49 setRequestMode:1];
    [v49 setEndpointTimeoutDuration:15.0];
    uint64_t v50 = *(void *)(v28 + 72);
    if (v50 == 2) {
      uint64_t v51 = 2;
    }
    else {
      uint64_t v51 = v50 == 1;
    }
    [v49 setApplicationState:v51];
  }
  else
  {
    v49 = 0;
  }
  return v49;
}

- (id)_deviceInfoWithFormatVersion:(uint64_t)a3
{
  int v5 = (void *)MEMORY[0x1E4F95DA8];
  id v6 = a1;
  BOOL v7 = [v5 defaultDeviceInfoWithAppVersion:v6 formatVersion:a3 seedNumber:0 buildNumber:a2];

  return v7;
}

- (void)fetchConfigurationIfNeededWithCompletionQueue:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __83__FCConfigurationManager_fetchConfigurationIfNeededWithCompletionQueue_completion___block_invoke;
  v10[3] = &unk_1E5B4F890;
  id v11 = v6;
  id v12 = v7;
  id v8 = v6;
  id v9 = v7;
  -[FCConfigurationManager _fetchAppConfigurationIfNeededWithForceRefresh:completion:]((uint64_t)self, 0, v10);
}

- (void)fetchAppConfigurationIfNeededWithCompletionQueue:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __86__FCConfigurationManager_fetchAppConfigurationIfNeededWithCompletionQueue_completion___block_invoke;
  v10[3] = &unk_1E5B4F890;
  id v11 = v6;
  id v12 = v7;
  id v8 = v6;
  id v9 = v7;
  -[FCConfigurationManager _fetchAppConfigurationIfNeededWithForceRefresh:completion:]((uint64_t)self, 0, v10);
}

- (void)_fetchAppConfigurationIfNeededWithForceRefresh:(void *)a3 completion:
{
  id v5 = a3;
  id v6 = v5;
  if (a1)
  {
    id v7 = *(NSObject **)(a1 + 104);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __84__FCConfigurationManager__fetchAppConfigurationIfNeededWithForceRefresh_completion___block_invoke;
    block[3] = &unk_1E5B4F9F8;
    void block[4] = a1;
    id v9 = v5;
    char v10 = a2;
    dispatch_async(v7, block);
  }
}

- (void)fetchConfigurationIfNeededWithCompletion:(id)a3
{
}

void __93__FCConfigurationManager__refreshAppConfigurationWithConfigurationSettings_force_completion___block_invoke_2_130(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F1CAD0] setWithArray:*(void *)(*(void *)(a1 + 32) + 216)];
  double v3 = [MEMORY[0x1E4F1CAD0] setWithArray:*(void *)(a1 + 40)];
  if ([v2 isEqual:v3])
  {
    double v4 = [MEMORY[0x1E4F1CAD0] setWithArray:*(void *)(*(void *)(a1 + 32) + 224)];
    id v5 = [MEMORY[0x1E4F1CAD0] setWithArray:*(void *)(a1 + 48)];
    int v6 = [v4 isEqual:v5];
  }
  else
  {
    int v6 = 0;
  }

  id v7 = *(id **)(a1 + 32);
  id v8 = -[FCConfigurationManager currentAppConfiguration](v7);
  id v9 = *(void **)(a1 + 56);
  id v10 = v8;
  id v11 = v9;
  id v12 = v11;
  if (v7)
  {
    if ([v11 checkForPaywallConfigChangesEnabled])
    {
      id v13 = [v10 paidBundleConfig];
      __int16 v14 = [v12 paidBundleConfig];
      LODWORD(v7) = [v13 arePaywallConfigsEqualToOtherPaidBundleConfig:v14] ^ 1;
    }
    else
    {
      LODWORD(v7) = 0;
    }
  }

  id v15 = *(id **)(a1 + 32);
  unint64_t v16 = -[FCConfigurationManager currentAppConfiguration](v15);
  if (v15)
  {
    id v15 = (id *)MEMORY[0x1E4FBA8A8];
    id v17 = *(id *)(a1 + 56);
    id v18 = v16;
    uint64_t v19 = [v18 engagementCohortsExpField];
    char v20 = [v17 engagementCohortsExpField];
    LOBYTE(v15) = objc_msgSend(v15, "nf_object:isEqualToObject:", v19, v20);

    char v21 = (void *)MEMORY[0x1E4FBA8A8];
    int v22 = [v18 conversionCohortsExpField];

    int v23 = [v17 conversionCohortsExpField];

    LOBYTE(v17) = objc_msgSend(v21, "nf_object:isEqualToObject:", v22, v23);
    LOBYTE(v15) = v15 & v17 ^ 1;
  }

  uint64_t v24 = [MEMORY[0x1E4F1C9C8] date];
  -[FCAssetHandle setRemoteURL:](*(void *)(a1 + 32), v24);

  uint64_t v26 = *(void **)(a1 + 32);
  if (v26)
  {
    objc_setProperty_nonatomic_copy(v26, v25, *(id *)(a1 + 56), 16);
    uint64_t v26 = *(void **)(a1 + 32);
  }
  [v26 setTreatmentIDs:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setSegmentSetIDs:*(void *)(a1 + 48)];
  -[FCConfigurationManager _saveConfigData:forRequestKey:](*(void *)(a1 + 32), *(void **)(a1 + 64), @"appConfigRequest");
  uint64_t v27 = *(void *)(a1 + 32);
  if (v27) {
    uint64_t v28 = *(void **)(v27 + 160);
  }
  else {
    uint64_t v28 = 0;
  }
  id v29 = v28;
  uint64_t v30 = -[FCConfigurationManager lastModificationDate]((id *)v27);
  [v29 setObject:v30 forKey:@"lastModificationDate"];

  uint64_t v31 = *(void *)(a1 + 32);
  if (v31) {
    uint64_t v32 = *(void **)(v31 + 160);
  }
  else {
    uint64_t v32 = 0;
  }
  [v32 setObject:*(void *)(a1 + 40) forKey:@"treatmentIDs"];
  uint64_t v33 = *(void *)(a1 + 32);
  if (v33) {
    v34 = *(void **)(v33 + 160);
  }
  else {
    v34 = 0;
  }
  [v34 setObject:*(void *)(a1 + 48) forKey:@"segmentSetIDs"];
  int v35 = *(id **)(a1 + 32);
  -[FCConfigurationManager _configurationDidChangeSignificantConfigChange:paywallConfigDidChange:scienceExperimentFieldsDidChange:](v35, v6 == 0, (int)v7, (char)v15);
}

void __42__FCConfigurationManager_appConfiguration__block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 16) copy];
  uint64_t v3 = *(void *)(a1[5] + 8);
  double v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = *(unsigned char *)(a1[4] + 9);
}

uint64_t __39__FCConfigurationManager_configuration__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

uint64_t __59__FCConfigurationManager_possiblyUnfetchedAppConfiguration__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

uint64_t __47__FCConfigurationManager_addAppConfigObserver___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    uint64_t v3 = *(void **)(v2 + 200);
  }
  else {
    uint64_t v3 = 0;
  }
  if ([v3 containsObject:*(void *)(a1 + 40)]
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"%p is already an observer", *(void *)(a1 + 40));
    *(_DWORD *)buf = 136315906;
    id v9 = "-[FCConfigurationManager addAppConfigObserver:]_block_invoke";
    __int16 v10 = 2080;
    id v11 = "FCConfigurationManager.m";
    __int16 v12 = 1024;
    int v13 = 367;
    __int16 v14 = 2114;
    id v15 = v7;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    id v5 = *(void **)(v4 + 200);
  }
  else {
    id v5 = 0;
  }
  return [v5 addObject:*(void *)(a1 + 40)];
}

- (FCNewsAppConfiguration)fetchedAppConfiguration
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__18;
  __int16 v12 = __Block_byref_object_dispose__18;
  id v13 = 0;
  if (self) {
    accessLock = self->_accessLock;
  }
  else {
    accessLock = 0;
  }
  uint64_t v4 = accessLock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__FCConfigurationManager_fetchedAppConfiguration__block_invoke;
  v7[3] = &unk_1E5B4C258;
  v7[4] = self;
  v7[5] = &v8;
  [(NFUnfairLock *)v4 performWithLockSync:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (FCNewsAppConfiguration *)v5;
}

uint64_t __38__FCConfigurationManager_addObserver___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    uint64_t v3 = *(void **)(v2 + 208);
  }
  else {
    uint64_t v3 = 0;
  }
  if ([v3 containsObject:*(void *)(a1 + 40)]
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"%p is already an observer", *(void *)(a1 + 40));
    *(_DWORD *)buf = 136315906;
    id v9 = "-[FCConfigurationManager addObserver:]_block_invoke";
    __int16 v10 = 2080;
    id v11 = "FCConfigurationManager.m";
    __int16 v12 = 1024;
    int v13 = 422;
    __int16 v14 = 2114;
    id v15 = v7;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    id v5 = *(void **)(v4 + 208);
  }
  else {
    id v5 = 0;
  }
  return [v5 addObject:*(void *)(a1 + 40)];
}

- (void)activityObservingApplicationWillEnterForeground
{
  self->_applicationState = 1;
}

- (void)addAppConfigObserver:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    if (self) {
      accessLock = self->_accessLock;
    }
    else {
      accessLock = 0;
    }
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __47__FCConfigurationManager_addAppConfigObserver___block_invoke;
    v8[3] = &unk_1E5B4BE70;
    v8[4] = self;
    id v9 = v4;
    [(NFUnfairLock *)accessLock performWithLockSync:v8];
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "observer != nil");
    *(_DWORD *)buf = 136315906;
    id v11 = "-[FCConfigurationManager addAppConfigObserver:]";
    __int16 v12 = 2080;
    int v13 = "FCConfigurationManager.m";
    __int16 v14 = 1024;
    int v15 = 362;
    __int16 v16 = 2114;
    id v17 = v7;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
}

- (FCNewsAppConfiguration)appConfiguration
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  uint64_t v11 = 0;
  __int16 v12 = &v11;
  uint64_t v13 = 0x3032000000;
  __int16 v14 = __Block_byref_object_copy__18;
  int v15 = __Block_byref_object_dispose__18;
  id v16 = 0;
  if (self) {
    accessLock = self->_accessLock;
  }
  else {
    accessLock = 0;
  }
  id v4 = accessLock;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __42__FCConfigurationManager_appConfiguration__block_invoke;
  v10[3] = &unk_1E5B4EDD0;
  void v10[4] = self;
  v10[5] = &v11;
  v10[6] = &v17;
  [(NFUnfairLock *)v4 performWithLockSync:v10];

  if (!NSClassFromString(&cfstr_Xctest.isa) && !*((unsigned char *)v18 + 24))
  {
    id v5 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v9 = (void *)[[NSString alloc] initWithFormat:@"shouldn't be calling -appConfiguration without first making an attempt to fetch the app config"];
      *(_DWORD *)buf = 136315906;
      int v22 = "-[FCConfigurationManager appConfiguration]";
      __int16 v23 = 2080;
      uint64_t v24 = "FCConfigurationManager.m";
      __int16 v25 = 1024;
      int v26 = 291;
      __int16 v27 = 2114;
      uint64_t v28 = v9;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
  }
  id v7 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return (FCNewsAppConfiguration *)v7;
}

- (void)addObserver:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    if (self) {
      accessLock = self->_accessLock;
    }
    else {
      accessLock = 0;
    }
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __38__FCConfigurationManager_addObserver___block_invoke;
    v8[3] = &unk_1E5B4BE70;
    v8[4] = self;
    id v9 = v4;
    [(NFUnfairLock *)accessLock performWithLockSync:v8];
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "observer != nil");
    *(_DWORD *)buf = 136315906;
    uint64_t v11 = "-[FCConfigurationManager addObserver:]";
    __int16 v12 = 2080;
    uint64_t v13 = "FCConfigurationManager.m";
    __int16 v14 = 1024;
    int v15 = 417;
    __int16 v16 = 2114;
    uint64_t v17 = v7;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
}

- (id)_requestInfoForRequestKey:(void *)a3 storefrontID:(void *)a4 additionalChangeTags:(void *)a5 cachePolicy:
{
  if (a1)
  {
    -[FCConfigurationManager _requestInfoForRequestKey:storefrontID:additionalChangeTags:feedType:cachePolicy:](a1, a2, a3, a4, 0, a5);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = vars8;
  }
  return a1;
}

- (id)_requestInfoForRequestKey:(void *)a3 storefrontID:(void *)a4 additionalChangeTags:(uint64_t)a5 feedType:(void *)a6 cachePolicy:
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v11 = a2;
  if (!a1)
  {
    uint64_t v29 = 0;
    goto LABEL_40;
  }
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  id v15 = v11;
  if ([v15 isEqualToString:@"appConfigRequest"])
  {
    __int16 v16 = @"appConfigurationWrapper";
  }
  else if ([v15 isEqualToString:@"widgetConfigRequest"])
  {
    __int16 v16 = @"widgetConfigurationWrapper";
  }
  else if ([v15 isEqualToString:@"magazinesConfigRequest"])
  {
    __int16 v16 = @"magazinesConfigurationWrapper";
  }
  else if ([v15 isEqualToString:@"todayConfigRequest"])
  {
    __int16 v16 = @"todayConfigWrapper";
  }
  else if ([v15 isEqualToString:@"audioConfigRequest"])
  {
    __int16 v16 = @"audioConfigWrapper";
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v31 = (void *)[[NSString alloc] initWithFormat:@"Case not implemented"];
      *(_DWORD *)buf = 136315906;
      int v35 = "-[FCConfigurationManager _responseKeyForRequestKey:]";
      __int16 v36 = 2080;
      id v37 = "FCConfigurationManager.m";
      __int16 v38 = 1024;
      int v39 = 1439;
      __int16 v40 = 2114;
      id v41 = v31;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
    __int16 v16 = 0;
  }

  uint64_t v17 = v16;
  id v18 = v15;
  id v19 = v14;
  uint64_t v33 = v12;
  if ([v18 isEqualToString:@"appConfigRequest"])
  {
    self;
    id v20 = v11;
    if (qword_1EB5D11B0 != -1) {
      dispatch_once(&qword_1EB5D11B0, &__block_literal_global_186);
    }
    id v21 = (id)_MergedGlobals_151;
    if ([v21 length])
    {
      id v22 = v21;
    }
    else
    {
      id v22 = [NSString stringWithFormat:@"%@-%@", @"configuration-json", v19];
    }
    uint64_t v24 = v22;
  }
  else
  {
    if (![v18 isEqualToString:@"magazinesConfigRequest"])
    {
      if (([v18 isEqualToString:@"widgetConfigRequest"] & 1) != 0
        || ([v18 isEqualToString:@"todayConfigRequest"] & 1) != 0
        || ([v18 isEqualToString:@"audioConfigRequest"] & 1) != 0
        || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        id v20 = v11;
      }
      else
      {
        id v20 = v11;
        uint64_t v32 = (void *)[[NSString alloc] initWithFormat:@"Case not implemented"];
        *(_DWORD *)buf = 136315906;
        int v35 = "-[FCConfigurationManager _recordIDForRequestKey:storefrontID:]";
        __int16 v36 = 2080;
        id v37 = "FCConfigurationManager.m";
        __int16 v38 = 1024;
        int v39 = 1529;
        __int16 v40 = 2114;
        id v41 = v32;
        _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
      }
      uint64_t v24 = 0;
      goto LABEL_31;
    }
    id v20 = v11;
    id v21 = [a1 possiblyUnfetchedAppConfiguration];
    __int16 v23 = [v21 magazinesConfigRecordID];
    uint64_t v24 = (void *)[v23 copy];
  }
LABEL_31:

  if ([v24 length])
  {
    __int16 v25 = [a1[5] contentContainerIdentifier];
    int v26 = FCPermanentURLForRecordID(v24, 3uLL, v25, 1);
  }
  else
  {
    int v26 = 0;
  }
  id v11 = v20;

  if (a5 != 2) {
    a5 = a5 == 1;
  }
  uint64_t v27 = [v33 cachePolicy];

  if (v27 == 1) {
    [MEMORY[0x1E4F95D80] ignoreCachePolicy];
  }
  else {
  uint64_t v28 = [MEMORY[0x1E4F95D80] defaultCachePolicy];
  }
  uint64_t v29 = (void *)[objc_alloc(MEMORY[0x1E4F95DB8]) initWithRequestKey:v18 responseKey:v17 fallbackURL:v26 requestType:v13 != 0 additionalChangeTags:v13 requestFeedType:a5 cachePolicy:v28];

LABEL_40:
  return v29;
}

void __93__FCConfigurationManager__refreshAppConfigurationWithConfigurationSettings_force_completion___block_invoke_2(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__18;
  id v12 = __Block_byref_object_dispose__18;
  id v13 = 0;
  id v4 = (void *)a1[4];
  if (v4) {
    id v4 = (void *)v4[12];
  }
  uint64_t v5 = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __93__FCConfigurationManager__refreshAppConfigurationWithConfigurationSettings_force_completion___block_invoke_3;
  v7[3] = &unk_1E5B4C258;
  v7[4] = a1[4];
  v7[5] = &v8;
  [v5 performWithLockSync:v7];

  (*(void (**)(void))(a1[5] + 16))();
  uint64_t v6 = a1[6];
  if (v6) {
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, v9[5], v3);
  }
  _Block_object_dispose(&v8, 8);
}

uint64_t __84__FCConfigurationManager__fetchAppConfigurationIfNeededWithForceRefresh_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

void __129__FCConfigurationManager__configurationDidChangeSignificantConfigChange_paywallConfigDidChange_scienceExperimentFieldsDidChange___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          [v7 configurationManager:*(void *)(a1 + 40) configurationDidChange:*(void *)(a1 + 48)];
        }
        if (*(unsigned char *)(a1 + 64) && (objc_opt_respondsToSelector() & 1) != 0) {
          [v7 configurationManagerScienceExperimentFieldsDidChange:*(void *)(a1 + 40)];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v4);
  }

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = *(id *)(a1 + 56);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      for (uint64_t j = 0; j != v10; ++j)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v14 + 1) + 8 * j);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v13, "configurationManager:appConfigurationDidChange:", *(void *)(a1 + 40), *(void *)(a1 + 48), (void)v14);
        }
        if (*(unsigned char *)(a1 + 65) && (objc_opt_respondsToSelector() & 1) != 0) {
          [v13 configurationManagerSignificantAppConfigChange:*(void *)(a1 + 40)];
        }
        if (*(unsigned char *)(a1 + 66) && (objc_opt_respondsToSelector() & 1) != 0) {
          [v13 configurationManagerPaywallConfigDidChange:*(void *)(a1 + 40)];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v10);
  }
}

void __93__FCConfigurationManager__refreshAppConfigurationWithConfigurationSettings_force_completion___block_invoke_127(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = v12;
  if (!v9 || v12)
  {
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __93__FCConfigurationManager__refreshAppConfigurationWithConfigurationSettings_force_completion___block_invoke_2_128;
    v37[3] = &unk_1E5B4E088;
    id v38 = *(id *)(a1 + 32);
    id v39 = v13;
    id v40 = *(id *)(a1 + 56);
    __93__FCConfigurationManager__refreshAppConfigurationWithConfigurationSettings_force_completion___block_invoke_2_128(v37);

    id v23 = v38;
  }
  else
  {
    long long v14 = (void *)FCAppConfigurationLog;
    if (os_log_type_enabled((os_log_t)FCAppConfigurationLog, OS_LOG_TYPE_DEFAULT))
    {
      long long v15 = *(void **)(a1 + 32);
      long long v16 = v14;
      *(_DWORD *)buf = 134217984;
      uint64_t v42 = objc_msgSend(v15, "fc_millisecondTimeIntervalUntilNow");
      _os_log_impl(&dword_1A460D000, v16, OS_LOG_TYPE_DEFAULT, "did refresh app configuration, time=%llums", buf, 0xCu);
    }
    long long v17 = [*(id *)(a1 + 40) storefrontID];
    long long v18 = [*(id *)(a1 + 40) deviceInfo];
    long long v19 = [v18 preferredLanguages];
    long long v20 = +[FCNewsAppConfig configurationWithData:storefrontID:preferredLanguageTags:]((uint64_t)FCNewsAppConfig, v9, v17, v19);

    if (v20)
    {
      uint64_t v21 = *(void *)(a1 + 48);
      if (v21) {
        id v22 = *(void **)(v21 + 96);
      }
      else {
        id v22 = 0;
      }
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __93__FCConfigurationManager__refreshAppConfigurationWithConfigurationSettings_force_completion___block_invoke_2_130;
      v27[3] = &unk_1E5B4DC70;
      v27[4] = v21;
      id v28 = v10;
      id v29 = v11;
      id v23 = v20;
      id v30 = v23;
      id v31 = v9;
      [v22 performWithLockSync:v27];
      uint64_t v24 = *(void *)(a1 + 56);
      if (v24) {
        (*(void (**)(uint64_t, void))(v24 + 16))(v24, 0);
      }
    }
    else
    {
      uint64_t v32 = MEMORY[0x1E4F143A8];
      uint64_t v33 = 3221225472;
      v34 = __93__FCConfigurationManager__refreshAppConfigurationWithConfigurationSettings_force_completion___block_invoke_129;
      int v35 = &unk_1E5B4CA88;
      __int16 v25 = (void (**)(id, void))*(id *)(a1 + 56);
      id v36 = v25;
      if (v25)
      {
        v25[2](v25, 0);
        int v26 = v36;
      }
      else
      {
        int v26 = 0;
      }

      id v23 = 0;
    }
  }
}

void __45__FCConfigurationManager_overrideAppConfigID__block_invoke()
{
  if (NFInternalBuild())
  {
    NewsCoreUserDefaults();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    if ([v4 BOOLForKey:@"enable_config_overrides"])
    {
      v0 = NewsCoreUserDefaults();
      uint64_t v1 = [v0 stringForKey:@"override_appconfig_id"];
      id v2 = (void *)_MergedGlobals_151;
      _MergedGlobals_151 = v1;
    }
    else
    {
      v0 = (void *)_MergedGlobals_151;
      _MergedGlobals_151 = 0;
    }

    uint64_t v3 = v4;
  }
  else
  {
    uint64_t v3 = (void *)_MergedGlobals_151;
    _MergedGlobals_151 = 0;
  }
}

- (void)_saveConfigData:(uint64_t)a3 forRequestKey:
{
  if (a1)
  {
    id v4 = *(void **)(a1 + 152);
    id v5 = a2;
    id v6 = [v4 URLByAppendingPathComponent:a3];
    [v5 writeToURL:v6 atomically:1];
  }
}

- (void)_configurationDidChangeSignificantConfigChange:(int)a3 paywallConfigDidChange:(char)a4 scienceExperimentFieldsDidChange:
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [a1[12] assertLocked];
    id v8 = FCAppConfigurationLog;
    if (os_log_type_enabled((os_log_t)FCAppConfigurationLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      int v27 = a2;
      __int16 v28 = 1024;
      int v29 = a3;
      _os_log_impl(&dword_1A460D000, v8, OS_LOG_TYPE_DEFAULT, "configuration manager notify observers with significantConfigChange: %d paywallConfigDidChange: %d", buf, 0xEu);
    }
    id v9 = a1[26];
    id v10 = [v9 allObjects];

    id v11 = a1[25];
    id v12 = [v11 allObjects];

    id v13 = -[FCConfigurationManager currentAppConfiguration](a1);
    long long v14 = (void *)[v13 copy];

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __129__FCConfigurationManager__configurationDidChangeSignificantConfigChange_paywallConfigDidChange_scienceExperimentFieldsDidChange___block_invoke;
    block[3] = &unk_1E5B4FB38;
    id v19 = v10;
    long long v20 = a1;
    char v23 = a4;
    id v21 = v14;
    id v22 = v12;
    char v24 = a2;
    char v25 = a3;
    id v15 = v12;
    id v16 = v14;
    id v17 = v10;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

- (FCConfigurationManager)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    id v8 = "-[FCConfigurationManager init]";
    __int16 v9 = 2080;
    id v10 = "FCConfigurationManager.m";
    __int16 v11 = 1024;
    int v12 = 137;
    __int16 v13 = 2114;
    long long v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCConfigurationManager init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (id)initForTesting
{
  v28.receiver = self;
  v28.super_class = (Class)FCConfigurationManager;
  id v2 = [(FCConfigurationManager *)&v28 init];
  if (v2)
  {
    uint64_t v3 = +[FCNewsAppConfig defaultConfigurationForStoreFrontID:]((uint64_t)FCNewsAppConfig, @"143441");
    currentAppConfiguration = v2->_currentAppConfiguration;
    v2->_currentAppConfiguration = (FCNewsAppConfig *)v3;

    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F81C18]) initWithOptions:1];
    accessLock = v2->_accessLock;
    v2->_accessLock = (NFUnfairLock *)v5;

    id v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v8 = dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v9 = dispatch_queue_create("FCAppConfig.workQueue", v8);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v9;

    __int16 v11 = [[FCAsyncSerialQueue alloc] initWithUnderlyingQueue:v2->_workQueue qualityOfService:25];
    remoteAppConfigSerialQueue = v2->_remoteAppConfigSerialQueue;
    v2->_remoteAppConfigSerialQueue = v11;

    __int16 v13 = [[FCAsyncSerialQueue alloc] initWithUnderlyingQueue:v2->_workQueue qualityOfService:25];
    remoteWidgetConfigSerialQueue = v2->_remoteWidgetConfigSerialQueue;
    v2->_remoteWidgetConfigSerialQueue = v13;

    uint64_t v15 = [[FCAsyncSerialQueue alloc] initWithUnderlyingQueue:v2->_workQueue qualityOfService:25];
    remoteTodayConfigSerialQueue = v2->_remoteTodayConfigSerialQueue;
    v2->_remoteTodayConfigSerialQueue = v15;

    id v17 = [[FCAsyncSerialQueue alloc] initWithUnderlyingQueue:v2->_workQueue qualityOfService:25];
    remoteMagazineConfigSerialQueue = v2->_remoteMagazineConfigSerialQueue;
    v2->_remoteMagazineConfigSerialQueue = v17;

    id v19 = [[FCAsyncSerialQueue alloc] initWithUnderlyingQueue:v2->_workQueue qualityOfService:25];
    remoteAudioConfigSerialQueue = v2->_remoteAudioConfigSerialQueue;
    v2->_remoteAudioConfigSerialQueue = v19;

    id v21 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v22 = [v21 objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
    appShortVersionString = v2->_appShortVersionString;
    v2->_appShortVersionString = (NSString *)v22;

    char v24 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v25 = [v24 objectForInfoDictionaryKey:@"CFBundleVersion"];
    buildNumberString = v2->_buildNumberString;
    v2->_buildNumberString = (NSString *)v25;

    v2->_applicationState = 0;
    v2->_runningUnitTests = 1;
  }
  return v2;
}

- (FCConfigurationManager)initWithContextConfiguration:(id)a3 contentHostDirectoryFileURL:(id)a4 feldsparIDProvider:(id)a5
{
  id v8 = (void *)MEMORY[0x1E4F28B50];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  int v12 = [v8 mainBundle];
  __int16 v13 = [v12 objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
  long long v14 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v15 = [v14 objectForInfoDictionaryKey:@"CFBundleVersion"];
  id v16 = [(FCConfigurationManager *)self initWithContextConfiguration:v11 contentHostDirectoryFileURL:v10 feldsparIDProvider:v9 appShortVersionString:v13 buildNumberString:v15 networkBehaviorMonitor:0 appActivityMonitor:0 applicationState:0];

  return v16;
}

- (FCConfigurationManager)initWithContextConfiguration:(id)a3 contentHostDirectoryFileURL:(id)a4 feldsparIDProvider:(id)a5 appShortVersionString:(id)a6 buildNumberString:(id)a7 networkBehaviorMonitor:(id)a8
{
  return [(FCConfigurationManager *)self initWithContextConfiguration:a3 contentHostDirectoryFileURL:a4 feldsparIDProvider:a5 appShortVersionString:a6 buildNumberString:a7 networkBehaviorMonitor:a8 appActivityMonitor:0 applicationState:0];
}

void __201__FCConfigurationManager_initWithContextConfiguration_contentHostDirectoryFileURL_feldsparIDProvider_appShortVersionString_buildNumberString_networkBehaviorMonitor_appActivityMonitor_applicationState___block_invoke(uint64_t a1, void *a2, void *a3, int a4)
{
  id v6 = (id *)(a1 + 32);
  id v7 = a3;
  id v8 = a2;
  WeakRetained = (id *)objc_loadWeakRetained(v6);
  id v9 = v8;
  id v10 = v7;
  if (WeakRetained)
  {
    id v11 = (void *)MEMORY[0x1E4F1CAD0];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __76__FCConfigurationManager__logNetworkEvent_configurationSettings_isFallback___block_invoke;
    v24[3] = &unk_1E5B4C2F0;
    id v25 = v10;
    int v12 = objc_msgSend(v11, "fc_set:", v24);
    __int16 v13 = [MEMORY[0x1E4F1CAD0] setWithObject:@"appConfigRequest"];
    int v14 = [v12 isEqualToSet:v13];

    if (v14)
    {
      if (a4) {
        uint64_t v15 = 16;
      }
      else {
        uint64_t v15 = 18;
      }
    }
    else
    {
      id v16 = [MEMORY[0x1E4F1CAD0] setWithObject:@"todayConfigRequest"];
      int v17 = [v12 isEqualToSet:v16];

      if (v17)
      {
        uint64_t v15 = 20;
      }
      else
      {
        long long v18 = [MEMORY[0x1E4F1CAD0] setWithObject:@"widgetConfigRequest"];
        char v19 = [v12 isEqualToSet:v18];

        if (v19)
        {
          uint64_t v15 = 22;
        }
        else
        {
          long long v20 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"widgetConfigRequest", @"todayConfigRequest", 0);
          int v21 = [v12 isEqualToSet:v20];

          if (!v21)
          {
LABEL_13:

            goto LABEL_14;
          }
          uint64_t v15 = 23;
        }
      }
    }
    uint64_t v22 = [[FCNetworkEvent alloc] initWithType:v15 rcNetworkEvent:v9];
    [WeakRetained[11] logNetworkEvent:v22];

    goto LABEL_13;
  }
LABEL_14:
}

- (FCNewsAppConfiguration)jsonEncodableAppConfiguration
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__18;
  int v12 = __Block_byref_object_dispose__18;
  id v13 = 0;
  if (self) {
    accessLock = self->_accessLock;
  }
  else {
    accessLock = 0;
  }
  uint64_t v4 = accessLock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__FCConfigurationManager_jsonEncodableAppConfiguration__block_invoke;
  v7[3] = &unk_1E5B4C258;
  v7[4] = self;
  v7[5] = &v8;
  [(NFUnfairLock *)v4 performWithLockSync:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (FCNewsAppConfiguration *)v5;
}

uint64_t __55__FCConfigurationManager_jsonEncodableAppConfiguration__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (void)refreshAppConfigurationIfNeededWithCompletionQueue:(id)a3 refreshCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __95__FCConfigurationManager_refreshAppConfigurationIfNeededWithCompletionQueue_refreshCompletion___block_invoke;
  v10[3] = &unk_1E5B4F890;
  id v11 = v6;
  id v12 = v7;
  id v8 = v6;
  id v9 = v7;
  -[FCConfigurationManager _fetchAppConfigurationIfNeededWithForceRefresh:completion:]((uint64_t)self, 1, v10);
}

void __95__FCConfigurationManager_refreshAppConfigurationIfNeededWithCompletionQueue_refreshCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 40);
  if (v7)
  {
    id v8 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __95__FCConfigurationManager_refreshAppConfigurationIfNeededWithCompletionQueue_refreshCompletion___block_invoke_2;
    block[3] = &unk_1E5B4F080;
    id v12 = v7;
    id v10 = v5;
    id v11 = v6;
    dispatch_async(v8, block);
  }
}

uint64_t __95__FCConfigurationManager_refreshAppConfigurationIfNeededWithCompletionQueue_refreshCompletion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)fetchAppWidgetConfigurationWithTodayLiteConfig:(BOOL)a3 additionalFields:(id)a4 completion:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  if (!v8 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v16 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "additionalFields != nil");
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "-[FCConfigurationManager fetchAppWidgetConfigurationWithTodayLiteConfig:additionalFields:completion:]";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "FCConfigurationManager.m";
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v19) = 352;
    WORD2(v19) = 2114;
    *(void *)((char *)&v19 + 6) = v16;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v10 = v8;
  id v11 = (void *)MEMORY[0x1E4F14428];
  id v12 = MEMORY[0x1E4F14428];
  id v13 = v9;
  if (self)
  {
    if (!v8 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v17 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "additionalFields != nil");
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = "-[FCConfigurationManager _fetchRemoteAppWidgetConfigurationIfNeededWithTodayLiteConfig:additi"
                           "onalFields:completionQueue:completion:]";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "FCConfigurationManager.m";
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v19) = 873;
      WORD2(v19) = 2114;
      *(void *)((char *)&v19 + 6) = v17;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
    remoteWidgetConfigSerialQueue = self->_remoteWidgetConfigSerialQueue;
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&uint8_t buf[16] = __132__FCConfigurationManager__fetchRemoteAppWidgetConfigurationIfNeededWithTodayLiteConfig_additionalFields_completionQueue_completion___block_invoke;
    *(void *)&long long v19 = &unk_1E5B4FB10;
    *((void *)&v19 + 1) = self;
    id v22 = v13;
    id v20 = v10;
    BOOL v23 = a3;
    char v24 = 0;
    id v15 = v11;
    id v21 = v11;
    [(FCAsyncSerialQueue *)remoteWidgetConfigSerialQueue enqueueBlock:buf];
  }
}

- (void)removeAppConfigObserver:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    if (self) {
      accessLock = self->_accessLock;
    }
    else {
      accessLock = 0;
    }
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __50__FCConfigurationManager_removeAppConfigObserver___block_invoke;
    v8[3] = &unk_1E5B4BE70;
    v8[4] = self;
    id v9 = v4;
    [(NFUnfairLock *)accessLock performWithLockSync:v8];
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "observer != nil");
    *(_DWORD *)buf = 136315906;
    id v11 = "-[FCConfigurationManager removeAppConfigObserver:]";
    __int16 v12 = 2080;
    id v13 = "FCConfigurationManager.m";
    __int16 v14 = 1024;
    int v15 = 375;
    __int16 v16 = 2114;
    int v17 = v7;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
}

uint64_t __50__FCConfigurationManager_removeAppConfigObserver___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  if (v1) {
    uint64_t v1 = (void *)v1[25];
  }
  return [v1 removeObject:*(void *)(a1 + 40)];
}

- (NSString)feldsparID
{
  if (self) {
    self = (FCConfigurationManager *)self->_feldsparIDProvider;
  }
  uint64_t v2 = [(FCConfigurationManager *)self feldsparID];
  uint64_t v3 = (void *)[v2 copy];

  return (NSString *)v3;
}

- (void)removeObserver:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    if (self) {
      accessLock = self->_accessLock;
    }
    else {
      accessLock = 0;
    }
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __41__FCConfigurationManager_removeObserver___block_invoke;
    v8[3] = &unk_1E5B4BE70;
    v8[4] = self;
    id v9 = v4;
    [(NFUnfairLock *)accessLock performWithLockSync:v8];
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "observer != nil");
    *(_DWORD *)buf = 136315906;
    id v11 = "-[FCConfigurationManager removeObserver:]";
    __int16 v12 = 2080;
    id v13 = "FCConfigurationManager.m";
    __int16 v14 = 1024;
    int v15 = 430;
    __int16 v16 = 2114;
    int v17 = v7;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
}

uint64_t __41__FCConfigurationManager_removeObserver___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  if (v1) {
    uint64_t v1 = (void *)v1[26];
  }
  return [v1 removeObject:*(void *)(a1 + 40)];
}

- (NSArray)treatmentIDs
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__18;
  __int16 v12 = __Block_byref_object_dispose__18;
  id v13 = 0;
  if (self) {
    accessLock = self->_accessLock;
  }
  else {
    accessLock = 0;
  }
  id v4 = accessLock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__FCConfigurationManager_treatmentIDs__block_invoke;
  v7[3] = &unk_1E5B4C258;
  v7[4] = self;
  v7[5] = &v8;
  [(NFUnfairLock *)v4 performWithLockSync:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSArray *)v5;
}

uint64_t __38__FCConfigurationManager_treatmentIDs__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 216) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (NSData)magazinesConfigurationData
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__18;
  __int16 v12 = __Block_byref_object_dispose__18;
  id v13 = 0;
  if (self) {
    accessLock = self->_accessLock;
  }
  else {
    accessLock = 0;
  }
  uint64_t v4 = accessLock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__FCConfigurationManager_magazinesConfigurationData__block_invoke;
  v7[3] = &unk_1E5B4C258;
  v7[4] = self;
  v7[5] = &v8;
  [(NFUnfairLock *)v4 performWithLockSync:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSData *)v5;
}

uint64_t __52__FCConfigurationManager_magazinesConfigurationData__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 176) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (void)fetchMagazinesConfigurationIfNeededWithCompletionQueue:(id)a3 formatVersion:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  long long v19 = __106__FCConfigurationManager_fetchMagazinesConfigurationIfNeededWithCompletionQueue_formatVersion_completion___block_invoke;
  id v20 = &unk_1E5B4F8B8;
  id v21 = v8;
  id v22 = v9;
  id v10 = v8;
  id v11 = v9;
  id v12 = v10;
  id v13 = a4;
  __int16 v14 = &v17;
  int v15 = v14;
  if (self)
  {
    remoteMagazineConfigSerialQueue = self->_remoteMagazineConfigSerialQueue;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __107__FCConfigurationManager__fetchMagazinesConfigurationIfNeededWithCompletionQueue_formatVersion_completion___block_invoke;
    v23[3] = &unk_1E5B4F908;
    v23[4] = self;
    int v26 = v14;
    id v24 = v12;
    id v25 = v13;
    -[FCAsyncSerialQueue enqueueBlock:](remoteMagazineConfigSerialQueue, "enqueueBlock:", v23, v17, v18, v19, v20, v21, v22);
  }
}

void __106__FCConfigurationManager_fetchMagazinesConfigurationIfNeededWithCompletionQueue_formatVersion_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 40);
  if (v7)
  {
    id v8 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __106__FCConfigurationManager_fetchMagazinesConfigurationIfNeededWithCompletionQueue_formatVersion_completion___block_invoke_2;
    block[3] = &unk_1E5B4F080;
    id v12 = v7;
    id v10 = v5;
    id v11 = v6;
    dispatch_async(v8, block);
  }
}

uint64_t __106__FCConfigurationManager_fetchMagazinesConfigurationIfNeededWithCompletionQueue_formatVersion_completion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __107__FCConfigurationManager__fetchMagazinesConfigurationIfNeededWithCompletionQueue_formatVersion_completion___block_invoke(uint64_t a1, void *a2)
{
  v26[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4 && *(unsigned char *)(v4 + 10))
  {
    id v5 = *(void **)(a1 + 56);
    if (v5)
    {
      id v6 = *(NSObject **)(a1 + 40);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __107__FCConfigurationManager__fetchMagazinesConfigurationIfNeededWithCompletionQueue_formatVersion_completion___block_invoke_2;
      block[3] = &unk_1E5B4C7C0;
      id v7 = v5;
      void block[4] = *(void *)(a1 + 32);
      id v25 = v7;
      dispatch_async(v6, block);
    }
    v3[2](v3);
  }
  else
  {
    id v8 = -[FCConfigurationManager _storefrontID](v4);
    id v9 = *(id **)(a1 + 32);
    id v10 = +[FCCachePolicy defaultCachePolicy];
    id v11 = -[FCConfigurationManager _requestInfoForRequestKey:storefrontID:additionalChangeTags:cachePolicy:](v9, @"magazinesConfigRequest", v8, 0, v10);

    uint64_t v12 = *(void *)(a1 + 32);
    v26[0] = v11;
    id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
    __int16 v14 = *(void **)(a1 + 32);
    if (v14) {
      __int16 v14 = (void *)v14[6];
    }
    int v15 = v14;
    __int16 v16 = [v15 feldsparID];
    uint64_t v17 = -[FCConfigurationManager _configurationSettingsWithRequestInfos:feldsparID:storefrontID:contextConfiguration:useBackgroundRefreshRate:requestMode:formatVersion:](v12, v13, v16, v8, 0, *(void **)(a1 + 48));

    uint64_t v18 = *(void *)(a1 + 32);
    if (v18) {
      long long v19 = *(void **)(v18 + 32);
    }
    else {
      long long v19 = 0;
    }
    uint64_t v20 = *(void *)(a1 + 40);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __107__FCConfigurationManager__fetchMagazinesConfigurationIfNeededWithCompletionQueue_formatVersion_completion___block_invoke_3;
    v21[3] = &unk_1E5B4F958;
    v21[4] = v18;
    id v22 = *(id *)(a1 + 56);
    BOOL v23 = v3;
    [v19 fetchSingleConfigurationWithSettings:v17 completionQueue:v20 completion:v21];
  }
}

uint64_t __107__FCConfigurationManager__fetchMagazinesConfigurationIfNeededWithCompletionQueue_formatVersion_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    uint64_t v4 = *(void *)(v3 + 176);
  }
  else {
    uint64_t v4 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(v2 + 16))(v2, v4, 0);
}

void __107__FCConfigurationManager__fetchMagazinesConfigurationIfNeededWithCompletionQueue_formatVersion_completion___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a2;
  id v8 = a5;
  id v9 = v8;
  if (!v7 || v8)
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __107__FCConfigurationManager__fetchMagazinesConfigurationIfNeededWithCompletionQueue_formatVersion_completion___block_invoke_4;
    v23[3] = &unk_1E5B4F8E0;
    uint64_t v20 = *(void **)(a1 + 40);
    v23[4] = *(void *)(a1 + 32);
    uint64_t v12 = &v25;
    id v25 = v20;
    id v24 = v9;
    id v26 = *(id *)(a1 + 48);
    __107__FCConfigurationManager__fetchMagazinesConfigurationIfNeededWithCompletionQueue_formatVersion_completion___block_invoke_4(v23);
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 32);
    if (v10) {
      id v11 = *(void **)(v10 + 96);
    }
    else {
      id v11 = 0;
    }
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __107__FCConfigurationManager__fetchMagazinesConfigurationIfNeededWithCompletionQueue_formatVersion_completion___block_invoke_5;
    v21[3] = &unk_1E5B4BE70;
    v21[4] = v10;
    uint64_t v12 = &v22;
    id v22 = v7;
    [v11 performWithLockSync:v21];
    uint64_t v17 = *(void *)(a1 + 40);
    if (v17)
    {
      uint64_t v18 = *(void *)(a1 + 32);
      if (v18) {
        uint64_t v19 = *(void *)(v18 + 176);
      }
      else {
        uint64_t v19 = 0;
      }
      (*(void (**)(uint64_t, uint64_t, void))(v17 + 16))(v17, v19, 0);
    }
    (*(void (**)(void, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v13, v14, v15, v16);
  }
}

uint64_t __107__FCConfigurationManager__fetchMagazinesConfigurationIfNeededWithCompletionQueue_formatVersion_completion___block_invoke_4(void *a1)
{
  uint64_t v2 = a1[4];
  if (v2)
  {
    uint64_t v3 = a1[6];
    if (*(void *)(v2 + 176))
    {
      if (!v3) {
        goto LABEL_9;
      }
      uint64_t v4 = *(void (**)(void))(v3 + 16);
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v3 = a1[6];
  }
  if (!v3) {
    goto LABEL_9;
  }
  uint64_t v4 = *(void (**)(void))(v3 + 16);
LABEL_8:
  v4();
LABEL_9:
  id v5 = *(uint64_t (**)(void))(a1[7] + 16);
  return v5();
}

void __107__FCConfigurationManager__fetchMagazinesConfigurationIfNeededWithCompletionQueue_formatVersion_completion___block_invoke_5(uint64_t a1, const char *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_setProperty_nonatomic_copy(v3, a2, *(id *)(a1 + 40), 176);
    uint64_t v3 = *(void **)(a1 + 32);
  }
  uint64_t v4 = *(void **)(a1 + 40);
  -[FCConfigurationManager _saveConfigData:forRequestKey:]((uint64_t)v3, v4, @"magazinesConfigRequest");
}

- (NSData)todayFeedConfigurationData
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__18;
  uint64_t v12 = __Block_byref_object_dispose__18;
  id v13 = 0;
  if (self) {
    accessLock = self->_accessLock;
  }
  else {
    accessLock = 0;
  }
  uint64_t v4 = accessLock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__FCConfigurationManager_todayFeedConfigurationData__block_invoke;
  v7[3] = &unk_1E5B4C258;
  v7[4] = self;
  v7[5] = &v8;
  [(NFUnfairLock *)v4 performWithLockSync:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSData *)v5;
}

uint64_t __52__FCConfigurationManager_todayFeedConfigurationData__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 184) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (void)fetchTodayFeedConfigurationIfNeededWithCompletionQueue:(id)a3 feedType:(unint64_t)a4 formatVersion:(id)a5 cachePolicy:(id)a6 networkActivityBlock:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a8;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __148__FCConfigurationManager_fetchTodayFeedConfigurationIfNeededWithCompletionQueue_feedType_formatVersion_cachePolicy_networkActivityBlock_completion___block_invoke;
  v25[3] = &unk_1E5B4F8B8;
  id v26 = v14;
  id v27 = v15;
  id v16 = v14;
  id v17 = v15;
  id v18 = v16;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = v25;
  BOOL v23 = v22;
  if (self)
  {
    remoteTodayConfigSerialQueue = self->_remoteTodayConfigSerialQueue;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __149__FCConfigurationManager__fetchTodayFeedConfigurationIfNeededWithCompletionQueue_feedType_formatVersion_cachePolicy_networkActivityBlock_completion___block_invoke;
    v28[3] = &unk_1E5B4F980;
    v28[4] = self;
    uint64_t v32 = v22;
    id v29 = v18;
    unint64_t v34 = a4;
    id v30 = v20;
    id v31 = v19;
    id v33 = v21;
    [(FCAsyncSerialQueue *)remoteTodayConfigSerialQueue enqueueBlock:v28];
  }
}

void __148__FCConfigurationManager_fetchTodayFeedConfigurationIfNeededWithCompletionQueue_feedType_formatVersion_cachePolicy_networkActivityBlock_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 40);
  if (v7)
  {
    uint64_t v8 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __148__FCConfigurationManager_fetchTodayFeedConfigurationIfNeededWithCompletionQueue_feedType_formatVersion_cachePolicy_networkActivityBlock_completion___block_invoke_2;
    block[3] = &unk_1E5B4F080;
    id v12 = v7;
    id v10 = v5;
    id v11 = v6;
    dispatch_async(v8, block);
  }
}

uint64_t __148__FCConfigurationManager_fetchTodayFeedConfigurationIfNeededWithCompletionQueue_feedType_formatVersion_cachePolicy_networkActivityBlock_completion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __149__FCConfigurationManager__fetchTodayFeedConfigurationIfNeededWithCompletionQueue_feedType_formatVersion_cachePolicy_networkActivityBlock_completion___block_invoke(uint64_t a1, void *a2)
{
  v27[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4 && *(unsigned char *)(v4 + 10))
  {
    id v5 = *(void **)(a1 + 64);
    if (v5)
    {
      id v6 = *(NSObject **)(a1 + 40);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __149__FCConfigurationManager__fetchTodayFeedConfigurationIfNeededWithCompletionQueue_feedType_formatVersion_cachePolicy_networkActivityBlock_completion___block_invoke_2;
      block[3] = &unk_1E5B4C7C0;
      id v7 = v5;
      void block[4] = *(void *)(a1 + 32);
      id v26 = v7;
      dispatch_async(v6, block);
    }
    v3[2](v3);
  }
  else
  {
    uint64_t v8 = -[FCConfigurationManager _storefrontID](v4);
    id v9 = -[FCConfigurationManager _requestInfoForRequestKey:storefrontID:additionalChangeTags:feedType:cachePolicy:](*(id **)(a1 + 32), @"todayConfigRequest", v8, 0, *(void *)(a1 + 80), *(void **)(a1 + 48));
    uint64_t v10 = *(void *)(a1 + 32);
    v27[0] = v9;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
    id v12 = *(void **)(a1 + 32);
    if (v12) {
      id v12 = (void *)v12[6];
    }
    id v13 = v12;
    id v14 = [v13 feldsparID];
    id v15 = -[FCConfigurationManager _configurationSettingsWithRequestInfos:feldsparID:storefrontID:contextConfiguration:useBackgroundRefreshRate:requestMode:formatVersion:](v10, v11, v14, v8, 0, *(void **)(a1 + 56));

    uint64_t v16 = *(void *)(a1 + 32);
    if (v16) {
      id v17 = *(void **)(v16 + 32);
    }
    else {
      id v17 = 0;
    }
    uint64_t v18 = *(void *)(a1 + 40);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __149__FCConfigurationManager__fetchTodayFeedConfigurationIfNeededWithCompletionQueue_feedType_formatVersion_cachePolicy_networkActivityBlock_completion___block_invoke_3;
    v22[3] = &unk_1E5B4F958;
    uint64_t v19 = *(void *)(a1 + 72);
    id v23 = *(id *)(a1 + 64);
    id v20 = v3;
    uint64_t v21 = *(void *)(a1 + 32);
    id v24 = v20;
    v22[4] = v21;
    [v17 fetchSingleConfigurationWithSettings:v15 networkActivityBlock:v19 completionQueue:v18 completion:v22];
  }
}

uint64_t __149__FCConfigurationManager__fetchTodayFeedConfigurationIfNeededWithCompletionQueue_feedType_formatVersion_cachePolicy_networkActivityBlock_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    uint64_t v4 = *(void *)(v3 + 184);
  }
  else {
    uint64_t v4 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(v2 + 16))(v2, v4, 0);
}

void __149__FCConfigurationManager__fetchTodayFeedConfigurationIfNeededWithCompletionQueue_feedType_formatVersion_cachePolicy_networkActivityBlock_completion___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a2;
  id v8 = a5;
  id v9 = v8;
  if (!v7 || v8)
  {
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    id v23 = __149__FCConfigurationManager__fetchTodayFeedConfigurationIfNeededWithCompletionQueue_feedType_formatVersion_cachePolicy_networkActivityBlock_completion___block_invoke_4;
    id v24 = &unk_1E5B4F930;
    uint64_t v16 = (void (**)(id, void, id))*(id *)(a1 + 40);
    id v26 = v16;
    id v17 = v9;
    id v25 = v17;
    uint64_t v18 = (void (**)(void))*(id *)(a1 + 48);
    id v27 = v18;
    if (v16)
    {
      v16[2](v16, 0, v17);
      uint64_t v18 = v27;
    }
    v18[2]();

    id v15 = v26;
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 32);
    if (v10) {
      id v11 = *(void **)(v10 + 96);
    }
    else {
      id v11 = 0;
    }
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __149__FCConfigurationManager__fetchTodayFeedConfigurationIfNeededWithCompletionQueue_feedType_formatVersion_cachePolicy_networkActivityBlock_completion___block_invoke_5;
    v19[3] = &unk_1E5B4BE70;
    void v19[4] = v10;
    id v20 = v7;
    [v11 performWithLockSync:v19];
    uint64_t v12 = *(void *)(a1 + 40);
    if (v12)
    {
      uint64_t v13 = *(void *)(a1 + 32);
      if (v13) {
        uint64_t v14 = *(void *)(v13 + 184);
      }
      else {
        uint64_t v14 = 0;
      }
      (*(void (**)(uint64_t, uint64_t, void))(v12 + 16))(v12, v14, 0);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    id v15 = v20;
  }
}

uint64_t __149__FCConfigurationManager__fetchTodayFeedConfigurationIfNeededWithCompletionQueue_feedType_formatVersion_cachePolicy_networkActivityBlock_completion___block_invoke_4(void *a1)
{
  uint64_t v2 = a1[5];
  if (v2) {
    (*(void (**)(uint64_t, void, void))(v2 + 16))(v2, 0, a1[4]);
  }
  uint64_t v3 = *(uint64_t (**)(void))(a1[6] + 16);
  return v3();
}

void __149__FCConfigurationManager__fetchTodayFeedConfigurationIfNeededWithCompletionQueue_feedType_formatVersion_cachePolicy_networkActivityBlock_completion___block_invoke_5(uint64_t a1, const char *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_setProperty_nonatomic_copy(v3, a2, *(id *)(a1 + 40), 184);
    uint64_t v3 = *(void **)(a1 + 32);
  }
  uint64_t v4 = *(void **)(a1 + 40);
  -[FCConfigurationManager _saveConfigData:forRequestKey:]((uint64_t)v3, v4, @"todayConfigRequest");
}

- (NSData)audioFeedConfigData
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__18;
  uint64_t v12 = __Block_byref_object_dispose__18;
  id v13 = 0;
  if (self) {
    accessLock = self->_accessLock;
  }
  else {
    accessLock = 0;
  }
  uint64_t v4 = accessLock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__FCConfigurationManager_audioFeedConfigData__block_invoke;
  v7[3] = &unk_1E5B4C258;
  v7[4] = self;
  v7[5] = &v8;
  [(NFUnfairLock *)v4 performWithLockSync:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSData *)v5;
}

uint64_t __45__FCConfigurationManager_audioFeedConfigData__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 192) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (void)fetchAudioFeedConfigIfNeededWithCompletionQueue:(id)a3 formatVersion:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  uint64_t v19 = __99__FCConfigurationManager_fetchAudioFeedConfigIfNeededWithCompletionQueue_formatVersion_completion___block_invoke;
  id v20 = &unk_1E5B4F8B8;
  id v21 = v8;
  id v22 = v9;
  id v10 = v8;
  id v11 = v9;
  id v12 = v10;
  id v13 = a4;
  uint64_t v14 = &v17;
  id v15 = v14;
  if (self)
  {
    remoteAudioConfigSerialQueue = self->_remoteAudioConfigSerialQueue;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __100__FCConfigurationManager__fetchAudioFeedConfigIfNeededWithCompletionQueue_formatVersion_completion___block_invoke;
    v23[3] = &unk_1E5B4F908;
    v23[4] = self;
    id v26 = v14;
    id v24 = v12;
    id v25 = v13;
    -[FCAsyncSerialQueue enqueueBlock:](remoteAudioConfigSerialQueue, "enqueueBlock:", v23, v17, v18, v19, v20, v21, v22);
  }
}

void __99__FCConfigurationManager_fetchAudioFeedConfigIfNeededWithCompletionQueue_formatVersion_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 40);
  if (v7)
  {
    id v8 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __99__FCConfigurationManager_fetchAudioFeedConfigIfNeededWithCompletionQueue_formatVersion_completion___block_invoke_2;
    block[3] = &unk_1E5B4F080;
    id v12 = v7;
    id v10 = v5;
    id v11 = v6;
    dispatch_async(v8, block);
  }
}

uint64_t __99__FCConfigurationManager_fetchAudioFeedConfigIfNeededWithCompletionQueue_formatVersion_completion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __100__FCConfigurationManager__fetchAudioFeedConfigIfNeededWithCompletionQueue_formatVersion_completion___block_invoke(uint64_t a1, void *a2)
{
  v26[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4 && *(unsigned char *)(v4 + 10))
  {
    id v5 = *(void **)(a1 + 56);
    if (v5)
    {
      id v6 = *(NSObject **)(a1 + 40);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __100__FCConfigurationManager__fetchAudioFeedConfigIfNeededWithCompletionQueue_formatVersion_completion___block_invoke_2;
      block[3] = &unk_1E5B4C7C0;
      id v7 = v5;
      void block[4] = *(void *)(a1 + 32);
      id v25 = v7;
      dispatch_async(v6, block);
    }
    v3[2](v3);
  }
  else
  {
    id v8 = -[FCConfigurationManager _storefrontID](v4);
    id v9 = *(id **)(a1 + 32);
    id v10 = +[FCCachePolicy defaultCachePolicy];
    id v11 = -[FCConfigurationManager _requestInfoForRequestKey:storefrontID:additionalChangeTags:cachePolicy:](v9, @"audioConfigRequest", v8, 0, v10);

    uint64_t v12 = *(void *)(a1 + 32);
    v26[0] = v11;
    id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
    uint64_t v14 = *(void **)(a1 + 32);
    if (v14) {
      uint64_t v14 = (void *)v14[6];
    }
    id v15 = v14;
    uint64_t v16 = [v15 feldsparID];
    uint64_t v17 = -[FCConfigurationManager _configurationSettingsWithRequestInfos:feldsparID:storefrontID:contextConfiguration:useBackgroundRefreshRate:requestMode:formatVersion:](v12, v13, v16, v8, 0, *(void **)(a1 + 48));

    uint64_t v18 = *(void *)(a1 + 32);
    if (v18) {
      uint64_t v19 = *(void **)(v18 + 32);
    }
    else {
      uint64_t v19 = 0;
    }
    uint64_t v20 = *(void *)(a1 + 40);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __100__FCConfigurationManager__fetchAudioFeedConfigIfNeededWithCompletionQueue_formatVersion_completion___block_invoke_3;
    v21[3] = &unk_1E5B4F958;
    v21[4] = v18;
    id v22 = *(id *)(a1 + 56);
    id v23 = v3;
    [v19 fetchSingleConfigurationWithSettings:v17 completionQueue:v20 completion:v21];
  }
}

uint64_t __100__FCConfigurationManager__fetchAudioFeedConfigIfNeededWithCompletionQueue_formatVersion_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    uint64_t v4 = *(void *)(v3 + 192);
  }
  else {
    uint64_t v4 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(v2 + 16))(v2, v4, 0);
}

void __100__FCConfigurationManager__fetchAudioFeedConfigIfNeededWithCompletionQueue_formatVersion_completion___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a2;
  id v8 = a5;
  id v9 = v8;
  if (!v7 || v8)
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __100__FCConfigurationManager__fetchAudioFeedConfigIfNeededWithCompletionQueue_formatVersion_completion___block_invoke_4;
    v23[3] = &unk_1E5B4F8E0;
    uint64_t v20 = *(void **)(a1 + 40);
    v23[4] = *(void *)(a1 + 32);
    uint64_t v12 = &v25;
    id v25 = v20;
    id v24 = v9;
    id v26 = *(id *)(a1 + 48);
    __100__FCConfigurationManager__fetchAudioFeedConfigIfNeededWithCompletionQueue_formatVersion_completion___block_invoke_4(v23);
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 32);
    if (v10) {
      id v11 = *(void **)(v10 + 96);
    }
    else {
      id v11 = 0;
    }
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __100__FCConfigurationManager__fetchAudioFeedConfigIfNeededWithCompletionQueue_formatVersion_completion___block_invoke_5;
    v21[3] = &unk_1E5B4BE70;
    v21[4] = v10;
    uint64_t v12 = &v22;
    id v22 = v7;
    [v11 performWithLockSync:v21];
    uint64_t v17 = *(void *)(a1 + 40);
    if (v17)
    {
      uint64_t v18 = *(void *)(a1 + 32);
      if (v18) {
        uint64_t v19 = *(void *)(v18 + 192);
      }
      else {
        uint64_t v19 = 0;
      }
      (*(void (**)(uint64_t, uint64_t, void))(v17 + 16))(v17, v19, 0);
    }
    (*(void (**)(void, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v13, v14, v15, v16);
  }
}

uint64_t __100__FCConfigurationManager__fetchAudioFeedConfigIfNeededWithCompletionQueue_formatVersion_completion___block_invoke_4(void *a1)
{
  uint64_t v2 = a1[4];
  if (v2)
  {
    uint64_t v3 = *(void *)(v2 + 192);
    uint64_t v4 = a1[6];
    if (v3) {
      uint64_t v5 = v3;
    }
    else {
      uint64_t v5 = 0;
    }
    if (!v4) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v4 = a1[6];
  if (v4)
  {
    uint64_t v5 = 0;
LABEL_6:
    (*(void (**)(uint64_t, uint64_t, void))(v4 + 16))(v4, v5, a1[5]);
  }
LABEL_7:
  id v6 = *(uint64_t (**)(void))(a1[7] + 16);
  return v6();
}

void __100__FCConfigurationManager__fetchAudioFeedConfigIfNeededWithCompletionQueue_formatVersion_completion___block_invoke_5(uint64_t a1, const char *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_setProperty_nonatomic_copy(v3, a2, *(id *)(a1 + 40), 192);
    uint64_t v3 = *(void **)(a1 + 32);
  }
  uint64_t v4 = *(void **)(a1 + 40);
  -[FCConfigurationManager _saveConfigData:forRequestKey:]((uint64_t)v3, v4, @"audioConfigRequest");
}

uint64_t __84__FCConfigurationManager__fetchAppConfigurationIfNeededWithForceRefresh_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __93__FCConfigurationManager__refreshAppConfigurationWithConfigurationSettings_force_completion___block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __93__FCConfigurationManager__refreshAppConfigurationWithConfigurationSettings_force_completion___block_invoke_2_128(void *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)FCAppConfigurationLog;
  if (os_log_type_enabled((os_log_t)FCAppConfigurationLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = (void *)a1[4];
    uint64_t v4 = v2;
    uint64_t v5 = objc_msgSend(v3, "fc_millisecondTimeIntervalUntilNow");
    uint64_t v6 = a1[5];
    int v8 = 134218242;
    uint64_t v9 = v5;
    __int16 v10 = 2114;
    uint64_t v11 = v6;
    _os_log_impl(&dword_1A460D000, v4, OS_LOG_TYPE_DEFAULT, "failed to refresh app configuration, time=%llums, error=%{public}@", (uint8_t *)&v8, 0x16u);
  }
  uint64_t result = a1[6];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, a1[5]);
  }
  return result;
}

uint64_t __93__FCConfigurationManager__refreshAppConfigurationWithConfigurationSettings_force_completion___block_invoke_129(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __132__FCConfigurationManager__fetchRemoteAppWidgetConfigurationIfNeededWithTodayLiteConfig_additionalFields_completionQueue_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __132__FCConfigurationManager__fetchRemoteAppWidgetConfigurationIfNeededWithTodayLiteConfig_additionalFields_completionQueue_completion___block_invoke_2;
  aBlock[3] = &unk_1E5B4FA98;
  aBlock[4] = *(void *)(a1 + 32);
  id v41 = v3;
  id v51 = v41;
  id v52 = *(id *)(a1 + 56);
  id v38 = _Block_copy(aBlock);
  uint64_t v4 = -[FCConfigurationManager _storefrontID](*(void *)(a1 + 32));
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    uint64_t v6 = *(void **)(v5 + 168);
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = -[FCConfigurationManager _changeTagsInWidgetConfigurationDict:](v5, v6);
  int v8 = (void *)v7;
  uint64_t v9 = (void *)MEMORY[0x1E4F1CBF0];
  if (v7) {
    uint64_t v9 = (void *)v7;
  }
  id v10 = v9;

  uint64_t v11 = (void *)FCAppConfigurationLog;
  if (os_log_type_enabled((os_log_t)FCAppConfigurationLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = v11;
    uint64_t v13 = [v10 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v54 = v13;
    _os_log_impl(&dword_1A460D000, v12, OS_LOG_TYPE_DEFAULT, "configuration manager will include %lu cached changeTags in the widgetConfigRequest", buf, 0xCu);
  }
  uint64_t v14 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", v38);
  uint64_t v15 = *(id **)(a1 + 32);
  uint64_t v16 = +[FCCachePolicy defaultCachePolicy];
  uint64_t v17 = -[FCConfigurationManager _requestInfoForRequestKey:storefrontID:additionalChangeTags:cachePolicy:](v15, @"widgetConfigRequest", v4, v10, v16);

  uint64_t v18 = *(void **)(a1 + 40);
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __132__FCConfigurationManager__fetchRemoteAppWidgetConfigurationIfNeededWithTodayLiteConfig_additionalFields_completionQueue_completion___block_invoke_134;
  v48[3] = &unk_1E5B4FAC0;
  id v19 = v17;
  id v49 = v19;
  [v18 enumerateKeysAndObjectsUsingBlock:v48];
  [v14 addObject:v19];
  if (*(unsigned char *)(a1 + 64))
  {
    uint64_t v20 = *(id **)(a1 + 32);
    id v21 = +[FCCachePolicy defaultCachePolicy];
    id v22 = -[FCConfigurationManager _requestInfoForRequestKey:storefrontID:additionalChangeTags:feedType:cachePolicy:](v20, @"todayConfigRequest", v4, 0, 2, v21);

    [v14 addObject:v22];
  }
  else
  {
    id v22 = 0;
  }
  uint64_t v23 = *(void *)(a1 + 32);
  if (v23) {
    id v24 = *(void **)(v23 + 48);
  }
  else {
    id v24 = 0;
  }
  id v25 = v24;
  id v26 = [v25 feldsparID];
  id v27 = *(void **)(a1 + 32);
  id v40 = v10;
  if (v27) {
    id v27 = (void *)v27[5];
  }
  unsigned int v28 = *(unsigned __int8 *)(a1 + 65);
  id v29 = v27;
  id v30 = -[FCConfigurationManager _configurationSettingsWithRequestInfos:feldsparID:storefrontID:contextConfiguration:useBackgroundRefreshRate:requestMode:formatVersion:](v23, v14, v26, v4, v28, 0);

  uint64_t v31 = *(void *)(a1 + 32);
  if (v31) {
    uint64_t v32 = *(void **)(v31 + 32);
  }
  else {
    uint64_t v32 = 0;
  }
  uint64_t v33 = *(void *)(a1 + 48);
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __132__FCConfigurationManager__fetchRemoteAppWidgetConfigurationIfNeededWithTodayLiteConfig_additionalFields_completionQueue_completion___block_invoke_2_136;
  void v42[3] = &unk_1E5B4FAE8;
  id v43 = v19;
  id v44 = v22;
  id v46 = v30;
  id v47 = v39;
  uint64_t v45 = v31;
  id v34 = v30;
  id v35 = v39;
  id v36 = v22;
  id v37 = v19;
  [v32 fetchMultiConfigurationWithSettings:v34 completionQueue:v33 completion:v42];
}

void __132__FCConfigurationManager__fetchRemoteAppWidgetConfigurationIfNeededWithTodayLiteConfig_additionalFields_completionQueue_completion___block_invoke_2(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__18;
  uint64_t v18 = __Block_byref_object_dispose__18;
  id v19 = 0;
  id v10 = (void *)a1[4];
  if (v10) {
    id v10 = (void *)v10[12];
  }
  uint64_t v11 = v10;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __132__FCConfigurationManager__fetchRemoteAppWidgetConfigurationIfNeededWithTodayLiteConfig_additionalFields_completionQueue_completion___block_invoke_3;
  v13[3] = &unk_1E5B4C258;
  v13[4] = a1[4];
  v13[5] = &v14;
  [v11 performWithLockSync:v13];

  (*(void (**)(void))(a1[5] + 16))();
  uint64_t v12 = a1[6];
  if (v12) {
    (*(void (**)(uint64_t, uint64_t, id, id, id))(v12 + 16))(v12, v15[5], v7, v8, v9);
  }
  _Block_object_dispose(&v14, 8);
}

void __132__FCConfigurationManager__fetchRemoteAppWidgetConfigurationIfNeededWithTodayLiteConfig_additionalFields_completionQueue_completion___block_invoke_3(uint64_t a1)
{
}

- (id)_changeTagsInWidgetConfigurationDict:(uint64_t)a1
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = v3;
  uint64_t v5 = 0;
  if (a1 && v3)
  {
    uint64_t v6 = [v3 objectForKeyedSubscript:@"articles"];
    id v7 = -[FCConfigurationManager _changeTagsInRecords:](v6);

    id v8 = [v4 objectForKeyedSubscript:@"articleLists"];
    id v9 = -[FCConfigurationManager _changeTagsInRecords:](v8);

    id v10 = [v4 objectForKeyedSubscript:@"tags"];
    uint64_t v11 = -[FCConfigurationManager _changeTagsInRecords:](v10);

    uint64_t v12 = (void *)FCAppConfigurationLog;
    if (os_log_type_enabled((os_log_t)FCAppConfigurationLog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = v12;
      int v16 = 134218496;
      uint64_t v17 = [v7 count];
      __int16 v18 = 2048;
      uint64_t v19 = [v9 count];
      __int16 v20 = 2048;
      uint64_t v21 = [v11 count];
      _os_log_impl(&dword_1A460D000, v13, OS_LOG_TYPE_DEFAULT, "configuration manager received articleChangeTags: %lu articleListChangeTags: %lu tagChangeTags: %lu in the widgetConfigurationData", (uint8_t *)&v16, 0x20u);
    }
    uint64_t v14 = [v7 arrayByAddingObjectsFromArray:v9];
    uint64_t v5 = [v14 arrayByAddingObjectsFromArray:v11];
  }
  return v5;
}

uint64_t __132__FCConfigurationManager__fetchRemoteAppWidgetConfigurationIfNeededWithTodayLiteConfig_additionalFields_completionQueue_completion___block_invoke_134(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setValue:a3 forAdditionalField:a2];
}

void __132__FCConfigurationManager__fetchRemoteAppWidgetConfigurationIfNeededWithTodayLiteConfig_additionalFields_completionQueue_completion___block_invoke_2_136(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [*(id *)(a1 + 32) requestCacheKey];
  uint64_t v14 = [v9 objectForKeyedSubscript:v13];

  uint64_t v15 = *(void **)(a1 + 40);
  if (v15)
  {
    int v16 = [v15 requestCacheKey];
    uint64_t v17 = [v9 objectForKeyedSubscript:v16];

    if (v12) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v17 = 0;
    if (v12)
    {
LABEL_8:
      v75[0] = MEMORY[0x1E4F143A8];
      v75[1] = 3221225472;
      v75[2] = __132__FCConfigurationManager__fetchRemoteAppWidgetConfigurationIfNeededWithTodayLiteConfig_additionalFields_completionQueue_completion___block_invoke_3_137;
      v75[3] = &unk_1E5B4EFB8;
      id v76 = v12;
      id v78 = *(id *)(a1 + 64);
      id v77 = v17;
      __132__FCConfigurationManager__fetchRemoteAppWidgetConfigurationIfNeededWithTodayLiteConfig_additionalFields_completionQueue_completion___block_invoke_3_137(v75);

      __int16 v20 = v76;
      goto LABEL_28;
    }
  }
  if (!v14) {
    goto LABEL_8;
  }
  v66 = v17;
  uint64_t v18 = *(void *)(a1 + 48);
  id v19 = v14;
  v65 = v14;
  if (v18)
  {
    id v79 = 0;
    id v63 = v19;
    uint64_t v21 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v19 options:0 error:&v79];
    id v61 = v79;
    if (v21)
    {
      id v59 = v11;
      id v60 = v10;
      __int16 v20 = [MEMORY[0x1E4F1CA60] dictionary];
      uint64_t v22 = [v21 objectForKeyedSubscript:@"widgetConfiguration"];
      [v20 setObject:v22 forKeyedSubscript:@"widgetConfiguration"];

      uint64_t v23 = [v21 objectForKeyedSubscript:@"singleTagConfiguration"];
      [v20 setObject:v23 forKeyedSubscript:@"singleTagConfiguration"];

      id v24 = [v21 objectForKeyedSubscript:@"widgetAppConfiguration"];
      [v20 setObject:v24 forKeyedSubscript:@"widgetAppConfiguration"];

      id v25 = [v21 objectForKeyedSubscript:@"articles"];
      id v26 = [*(id *)(v18 + 168) objectForKeyedSubscript:@"articles"];
      id v27 = -[FCConfigurationManager _mergeRecords:withCachedRecords:](v25, v26);
      [v20 setObject:v27 forKeyedSubscript:@"articles"];

      unsigned int v28 = [v21 objectForKeyedSubscript:@"articleLists"];
      id v29 = [*(id *)(v18 + 168) objectForKeyedSubscript:@"articleLists"];
      id v30 = -[FCConfigurationManager _mergeRecords:withCachedRecords:](v28, v29);
      [v20 setObject:v30 forKeyedSubscript:@"articleLists"];

      uint64_t v31 = [v21 objectForKeyedSubscript:@"tags"];
      uint64_t v32 = [*(id *)(v18 + 168) objectForKeyedSubscript:@"tags"];
      uint64_t v33 = -[FCConfigurationManager _mergeRecords:withCachedRecords:](v31, v32);
      [v20 setObject:v33 forKeyedSubscript:@"tags"];

      id v34 = (void *)FCAppConfigurationLog;
      if (os_log_type_enabled((os_log_t)FCAppConfigurationLog, OS_LOG_TYPE_DEFAULT))
      {
        log = v34;
        id v35 = [v20 objectForKeyedSubscript:@"articles"];
        uint64_t v36 = [v35 count];
        id v37 = [v20 objectForKeyedSubscript:@"articleLists"];
        uint64_t v38 = [v37 count];
        id v39 = [v20 objectForKeyedSubscript:@"tags"];
        uint64_t v40 = [v39 count];
        *(_DWORD *)buf = 134218496;
        uint64_t v81 = v36;
        __int16 v82 = 2048;
        uint64_t v83 = v38;
        __int16 v84 = 2048;
        uint64_t v85 = v40;
        _os_log_impl(&dword_1A460D000, log, OS_LOG_TYPE_DEFAULT, "merged widget cached data articles: %lu articleLists: %lu tags: %lu", buf, 0x20u);
      }
      id v11 = v59;
      id v10 = v60;
    }
    else
    {
      id v41 = FCAppConfigurationLog;
      if (os_log_type_enabled((os_log_t)FCAppConfigurationLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v42 = v61;
        uint64_t v81 = (uint64_t)v61;
        _os_log_impl(&dword_1A460D000, v41, OS_LOG_TYPE_DEFAULT, "unable to parse the widget configuration data with error: %{public}@", buf, 0xCu);
        __int16 v20 = 0;
LABEL_17:

        id v19 = v63;
        goto LABEL_18;
      }
      __int16 v20 = 0;
    }
    uint64_t v42 = v61;
    goto LABEL_17;
  }
  __int16 v20 = 0;
LABEL_18:

  id v43 = [v20 objectForKeyedSubscript:@"widgetAppConfiguration"];
  id v44 = [v43 objectForKeyedSubscript:@"widgetLanguageConfiguration"];
  uint64_t v45 = [FCNewsAppConfig alloc];
  id v46 = [*(id *)(a1 + 56) storefrontID];
  id v47 = -[FCNewsAppConfig initWithConfigDictionary:storefrontID:languageConfigDictionary:](v45, v43, v46, v44);

  if (v47)
  {
    id v62 = v12;
    id v64 = v9;
    v48 = v10;
    id v49 = -[FCConfigurationManager _changeTagsInWidgetConfigurationDict:](*(void *)(a1 + 48), v20);
    uint64_t v50 = (void *)FCAppConfigurationLog;
    if (os_log_type_enabled((os_log_t)FCAppConfigurationLog, OS_LOG_TYPE_DEFAULT))
    {
      id v51 = v50;
      uint64_t v52 = [v49 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v81 = v52;
      _os_log_impl(&dword_1A460D000, v51, OS_LOG_TYPE_DEFAULT, "configuration manager received and merged %lu total changeTags in the widgetConfigurationData", buf, 0xCu);
    }
    uint64_t v53 = v11;
    uint64_t v54 = *(void *)(a1 + 48);
    if (v54) {
      uint64_t v55 = *(void **)(v54 + 96);
    }
    else {
      uint64_t v55 = 0;
    }
    v67[0] = MEMORY[0x1E4F143A8];
    v67[1] = 3221225472;
    v67[2] = __132__FCConfigurationManager__fetchRemoteAppWidgetConfigurationIfNeededWithTodayLiteConfig_additionalFields_completionQueue_completion___block_invoke_142;
    v67[3] = &unk_1E5B4DC70;
    v67[4] = v54;
    id v68 = v48;
    id v69 = v53;
    v70 = v47;
    id v56 = v20;
    id v71 = v56;
    [v55 performWithLockSync:v67];
    uint64_t v57 = *(void *)(a1 + 64);
    if (v57) {
      (*(void (**)(uint64_t, id, void *, void))(v57 + 16))(v57, v56, v66, 0);
    }

    id v10 = v48;
    id v11 = v53;
    id v12 = v62;
    id v9 = v64;
  }
  else
  {
    v72[0] = MEMORY[0x1E4F143A8];
    v72[1] = 3221225472;
    v72[2] = __132__FCConfigurationManager__fetchRemoteAppWidgetConfigurationIfNeededWithTodayLiteConfig_additionalFields_completionQueue_completion___block_invoke_141;
    v72[3] = &unk_1E5B4C7C0;
    id v74 = *(id *)(a1 + 64);
    id v73 = v66;
    __132__FCConfigurationManager__fetchRemoteAppWidgetConfigurationIfNeededWithTodayLiteConfig_additionalFields_completionQueue_completion___block_invoke_141((uint64_t)v72);

    id v49 = v74;
  }

  uint64_t v14 = v65;
  uint64_t v17 = v66;
LABEL_28:
}

uint64_t __132__FCConfigurationManager__fetchRemoteAppWidgetConfigurationIfNeededWithTodayLiteConfig_additionalFields_completionQueue_completion___block_invoke_3_137(void *a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = FCAppConfigurationLog;
  if (os_log_type_enabled((os_log_t)FCAppConfigurationLog, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = a1[4];
    int v5 = 138412290;
    uint64_t v6 = v4;
    _os_log_error_impl(&dword_1A460D000, v2, OS_LOG_TYPE_ERROR, "configuration manager received error: %@, returning cached configuration", (uint8_t *)&v5, 0xCu);
  }
  uint64_t result = a1[6];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, void))(result + 16))(result, 0, a1[5], a1[4]);
  }
  return result;
}

uint64_t __132__FCConfigurationManager__fetchRemoteAppWidgetConfigurationIfNeededWithTodayLiteConfig_additionalFields_completionQueue_completion___block_invoke_141(uint64_t a1)
{
  uint64_t v2 = FCAppConfigurationLog;
  if (os_log_type_enabled((os_log_t)FCAppConfigurationLog, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_error_impl(&dword_1A460D000, v2, OS_LOG_TYPE_ERROR, "configuration manager received invalid appConfiguration, returning cached configuration", v4, 2u);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, void))(result + 16))(result, 0, *(void *)(a1 + 32), 0);
  }
  return result;
}

void __132__FCConfigurationManager__fetchRemoteAppWidgetConfigurationIfNeededWithTodayLiteConfig_additionalFields_completionQueue_completion___block_invoke_142(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1CAD0] setWithArray:*(void *)(*(void *)(a1 + 32) + 216)];
  id v3 = [MEMORY[0x1E4F1CAD0] setWithArray:*(void *)(a1 + 40)];
  if ([v2 isEqual:v3])
  {
    uint64_t v4 = [MEMORY[0x1E4F1CAD0] setWithArray:*(void *)(*(void *)(a1 + 32) + 224)];
    int v5 = [MEMORY[0x1E4F1CAD0] setWithArray:*(void *)(a1 + 48)];
    int v6 = [v4 isEqual:v5];
  }
  else
  {
    int v6 = 0;
  }

  id v8 = *(void **)(a1 + 32);
  if (v8) {
    objc_setProperty_nonatomic_copy(v8, v7, *(id *)(a1 + 56), 16);
  }
  id v9 = [MEMORY[0x1E4F1C9C8] date];
  -[FCAssetHandle setRemoteURL:](*(void *)(a1 + 32), v9);

  [*(id *)(a1 + 32) setTreatmentIDs:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setSegmentSetIDs:*(void *)(a1 + 48)];
  id v10 = *(id **)(a1 + 32);
  if (v10)
  {
    objc_storeStrong(v10 + 21, *(id *)(a1 + 64));
    uint64_t v11 = *(void *)(a1 + 32);
    if (v11) {
      id v10 = *(id **)(v11 + 160);
    }
    else {
      id v10 = 0;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
  id v12 = v10;
  uint64_t v13 = -[FCConfigurationManager lastModificationDate]((id *)v11);
  [v12 setObject:v13 forKey:@"lastModificationDate"];

  uint64_t v14 = *(void *)(a1 + 32);
  if (v14) {
    uint64_t v15 = *(void **)(v14 + 160);
  }
  else {
    uint64_t v15 = 0;
  }
  [v15 setObject:*(void *)(a1 + 40) forKey:@"treatmentIDs"];
  uint64_t v16 = *(void *)(a1 + 32);
  if (v16) {
    uint64_t v17 = *(void **)(v16 + 160);
  }
  else {
    uint64_t v17 = 0;
  }
  [v17 setObject:*(void *)(a1 + 48) forKey:@"segmentSetIDs"];
  if (*(void *)(a1 + 64))
  {
    uint64_t v18 = *(void *)(a1 + 32);
    if (v18) {
      id v19 = *(void **)(v18 + 160);
    }
    else {
      id v19 = 0;
    }
    objc_msgSend(v19, "setObject:forKey:");
  }
  __int16 v20 = *(id **)(a1 + 32);
  -[FCConfigurationManager _configurationDidChangeSignificantConfigChange:paywallConfigDidChange:scienceExperimentFieldsDidChange:](v20, v6 == 0, 0, 0);
}

void __76__FCConfigurationManager__logNetworkEvent_configurationSettings_isFallback___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "requestInfos", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v10 + 1) + 8 * v8) requestKey];
        [v3 addObject:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)feldsparIDProviderDidChangeFeldsparID:(id)a3
{
}

- (void)activityObservingApplicationDidEnterBackground
{
  self->_applicationState = 2;
}

uint64_t __55__FCConfigurationManager_internalOverrideSegmentSetIDs__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = NSNumber;
  uint64_t v3 = [a2 integerValue];
  return [v2 numberWithInteger:v3];
}

uint64_t __65__FCConfigurationManager_internalOverrideAdditionalSegmentSetIDs__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = NSNumber;
  uint64_t v3 = [a2 integerValue];
  return [v2 numberWithInteger:v3];
}

- (id)_mergeRecords:(void *)a1 withCachedRecords:(void *)a2
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v25 = a2;
  id v24 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  obuint64_t j = v3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v26 objects:v38 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v27 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v9 = [v8 objectForKeyedSubscript:@"id"];
        long long v10 = [v25 objectForKeyedSubscript:v9];
        long long v11 = [v8 allKeys];
        unint64_t v12 = [v11 count];

        if (v12 < 4)
        {
          if (!v10 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
          {
            uint64_t v21 = (void *)[[NSString alloc] initWithFormat:@"incomplete data in fetched record %@", v8];
            *(_DWORD *)buf = 136315906;
            uint64_t v31 = "-[FCConfigurationManager _mergeRecords:withCachedRecords:]";
            __int16 v32 = 2080;
            uint64_t v33 = "FCConfigurationManager.m";
            __int16 v34 = 1024;
            int v35 = 1647;
            __int16 v36 = 2114;
            id v37 = v21;
            _os_log_fault_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "*** Assertion failure (Identifier: IncompleteFetchedRecord) : %s %s:%d %{public}@", buf, 0x26u);
          }
          id v13 = 0;
        }
        else
        {
          id v13 = v8;
        }
        uint64_t v14 = [v8 objectForKeyedSubscript:@"changeTag"];
        uint64_t v15 = [v10 objectForKeyedSubscript:@"changeTag"];
        int v16 = [v14 isEqualToString:v15];

        if (v16)
        {
          id v17 = v10;

          uint64_t v18 = [v17 allKeys];
          unint64_t v19 = [v18 count];

          if (v19 <= 3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
          {
            __int16 v20 = (void *)[[NSString alloc] initWithFormat:@"incomplete data in cached record %@", v17];
            *(_DWORD *)buf = 136315906;
            uint64_t v31 = "-[FCConfigurationManager _mergeRecords:withCachedRecords:]";
            __int16 v32 = 2080;
            uint64_t v33 = "FCConfigurationManager.m";
            __int16 v34 = 1024;
            int v35 = 1654;
            __int16 v36 = 2114;
            id v37 = v20;
            _os_log_fault_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "*** Assertion failure (Identifier: IncompleteCachedRecord) : %s %s:%d %{public}@", buf, 0x26u);
          }
        }
        else
        {
          id v17 = v13;
        }
        if (v17) {
          [v24 setObject:v17 forKey:v9];
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v26 objects:v38 count:16];
    }
    while (v5);
  }

  return v24;
}

- (id)_changeTagsInRecords:(void *)a1
{
  id v1 = a1;
  if (v1)
  {
    uint64_t v2 = [MEMORY[0x1E4F1CA48] array];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __47__FCConfigurationManager__changeTagsInRecords___block_invoke_2;
    v5[3] = &unk_1E5B4F600;
    id v3 = v2;
    id v6 = v3;
    [v1 enumerateKeysAndObjectsUsingBlock:v5];
  }
  else
  {
    id v3 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v3;
}

void __47__FCConfigurationManager__changeTagsInRecords___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = (objc_class *)MEMORY[0x1E4F95D88];
  id v5 = a3;
  id v6 = [v4 alloc];
  uint64_t v7 = [v5 objectForKeyedSubscript:@"id"];
  uint64_t v8 = [v5 objectForKeyedSubscript:@"changeTag"];
  id v9 = [v5 objectForKeyedSubscript:@"lastModified"];

  id v11 = (id)[v6 initWithIdentifier:v7 contentHash:v8 lastModifiedString:v9];
  long long v10 = v11;
  if (v11)
  {
    [*(id *)(a1 + 32) addObject:v11];
    long long v10 = v11;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segmentSetIDs, 0);
  objc_storeStrong((id *)&self->_treatmentIDs, 0);
  objc_storeStrong((id *)&self->_coreConfigObservers, 0);
  objc_storeStrong((id *)&self->_appConfigObservers, 0);
  objc_storeStrong((id *)&self->_currentAudioFeedConfiguration, 0);
  objc_storeStrong((id *)&self->_currentTodayFeedConfiguration, 0);
  objc_storeStrong((id *)&self->_currentMagazinesConfiguration, 0);
  objc_storeStrong((id *)&self->_cachedWidgetConfigurationDict, 0);
  objc_storeStrong((id *)&self->_localStore, 0);
  objc_storeStrong((id *)&self->_containerDirectory, 0);
  objc_storeStrong((id *)&self->_remoteAudioConfigSerialQueue, 0);
  objc_storeStrong((id *)&self->_remoteMagazineConfigSerialQueue, 0);
  objc_storeStrong((id *)&self->_remoteTodayConfigSerialQueue, 0);
  objc_storeStrong((id *)&self->_remoteWidgetConfigSerialQueue, 0);
  objc_storeStrong((id *)&self->_remoteAppConfigSerialQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_accessLock, 0);
  objc_storeStrong((id *)&self->_networkBehaviorMonitor, 0);
  objc_storeStrong((id *)&self->_appActivityMonitor, 0);
  objc_storeStrong((id *)&self->_buildNumberString, 0);
  objc_storeStrong((id *)&self->_appShortVersionString, 0);
  objc_storeStrong((id *)&self->_feldsparIDProvider, 0);
  objc_storeStrong((id *)&self->_contextConfiguration, 0);
  objc_storeStrong((id *)&self->_remoteConfigurationManager, 0);
  objc_storeStrong((id *)&self->_lastModificationDate, 0);
  objc_storeStrong((id *)&self->_currentAppConfiguration, 0);
}

@end