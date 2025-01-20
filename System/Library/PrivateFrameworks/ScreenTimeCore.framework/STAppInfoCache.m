@interface STAppInfoCache
+ (STAppInfoCache)sharedCache;
- (NSCache)appInfoByBundleIdentifier;
- (NSMutableSet)bundleIdentifiersWithPendingRequests;
- (NSOperationQueue)completionHandlerQueue;
- (NSPersistentContainer)persistentContainer;
- (NSURLSession)urlSession;
- (OS_dispatch_queue)lookupQueue;
- (STAppInfoCache)init;
- (id)_appInfoForBundleIdentifier:(id)a3;
- (id)_fetchAppInfoFromLaunchServicesWithBundleIdentifier:(id)a3;
- (id)_fetchSyncedInstalledAppInfoForBundleIdentifier:(id)a3;
- (id)_localAppNameForBundleIdentifier:(id)a3;
- (id)_placeholderAppInfoWithBundleIdentifier:(id)a3;
- (id)_preloadedAppInfoWithBundleIdentifier:(id)a3;
- (id)appInfoForBundleIdentifier:(id)a3;
- (id)appInfoForBundleIdentifier:(id)a3 localOnly:(BOOL)a4;
- (void)_fetchAppStoreInfoAndNotifyWithBundleIdentifiers:(id)a3;
- (void)_fetchAppStoreInfoAndNotifyWithBundleIdentifiers:(id)a3 timeoutInterval:(double)a4 completionHandler:(id)a5;
- (void)_finishedFetchingAppInfoByBundleIdentifier:(id)a3;
- (void)_handleAMSClientResponseForBundleIdentifiers:(id)a3 results:(id)a4 error:(id)a5 completionHandler:(id)a6;
- (void)_handleiTunesResponseForBundleIdentifiers:(id)a3 response:(id)a4 data:(id)a5 error:(id)a6 completionHandler:(id)a7;
- (void)addObserver:(id)a3 selector:(SEL)a4 bundleIdentifier:(id)a5;
- (void)dealloc;
- (void)fetchAppInfoForBundleIdentifier:(id)a3 completionHandler:(id)a4;
- (void)fetchAppInfoForBundleIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)removeObserver:(id)a3 bundleIdentifier:(id)a4;
- (void)setPersistentContainer:(id)a3;
@end

@implementation STAppInfoCache

+ (STAppInfoCache)sharedCache
{
  if (sharedCache_onceToken != -1) {
    dispatch_once(&sharedCache_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)sharedCache_sharedCache;
  return (STAppInfoCache *)v2;
}

uint64_t __29__STAppInfoCache_sharedCache__block_invoke()
{
  sharedCache_sharedCache = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

- (STAppInfoCache)init
{
  v20.receiver = self;
  v20.super_class = (Class)STAppInfoCache;
  v2 = [(STAppInfoCache *)&v20 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    appInfoByBundleIdentifier = v2->_appInfoByBundleIdentifier;
    v2->_appInfoByBundleIdentifier = (NSCache *)v3;

    uint64_t v5 = objc_opt_new();
    bundleIdentifiersWithPendingRequests = v2->_bundleIdentifiersWithPendingRequests;
    v2->_bundleIdentifiersWithPendingRequests = (NSMutableSet *)v5;

    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.screentime.app-info-cache", v8);
    lookupQueue = v2->_lookupQueue;
    v2->_lookupQueue = (OS_dispatch_queue *)v9;

    v11 = [MEMORY[0x1E4F290F0] ephemeralSessionConfiguration];
    v12 = [MEMORY[0x1E4F29078] sharedURLCache];
    [v11 setURLCache:v12];

    [v11 setRequestCachePolicy:2];
    [v11 setHTTPShouldUsePipelining:1];
    v13 = objc_opt_new();
    [v13 setName:@"com.apple.screentime.app-info-cache"];
    [v13 setUnderlyingQueue:v2->_lookupQueue];
    uint64_t v14 = [MEMORY[0x1E4F290E0] sessionWithConfiguration:v11 delegate:0 delegateQueue:v13];
    urlSession = v2->_urlSession;
    v2->_urlSession = (NSURLSession *)v14;

    v16 = [v13 name];
    [(NSURLSession *)v2->_urlSession setSessionDescription:v16];

    uint64_t v17 = objc_opt_new();
    completionHandlerQueue = v2->_completionHandlerQueue;
    v2->_completionHandlerQueue = (NSOperationQueue *)v17;

    [(NSOperationQueue *)v2->_completionHandlerQueue setName:@"App Info Cache Completion Handler Queue"];
    [(NSOperationQueue *)v2->_completionHandlerQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v2->_completionHandlerQueue setQualityOfService:25];
  }
  return v2;
}

- (void)dealloc
{
  [(NSURLSession *)self->_urlSession invalidateAndCancel];
  v3.receiver = self;
  v3.super_class = (Class)STAppInfoCache;
  [(STAppInfoCache *)&v3 dealloc];
}

- (id)appInfoForBundleIdentifier:(id)a3 localOnly:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [(STAppInfoCache *)self _appInfoForBundleIdentifier:v6];
  uint64_t v8 = [v7 source];
  if (_os_feature_enabled_impl() && [v7 adamID])
  {
    dispatch_queue_t v9 = [v7 localURL];
    BOOL v10 = v9 == 0;

    if (!v4) {
      goto LABEL_4;
    }
  }
  else
  {
    BOOL v10 = 0;
    if (!v4)
    {
LABEL_4:
      if (v8) {
        int v11 = v10;
      }
      else {
        int v11 = 1;
      }
      if (v11 == 1)
      {
        objc_initWeak(&location, self);
        v12 = [(STAppInfoCache *)self lookupQueue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __55__STAppInfoCache_appInfoForBundleIdentifier_localOnly___block_invoke;
        block[3] = &unk_1E6BC6D88;
        id v16 = v6;
        objc_copyWeak(&v17, &location);
        dispatch_async(v12, block);

        objc_destroyWeak(&v17);
        objc_destroyWeak(&location);
      }
      goto LABEL_12;
    }
  }
  if (v8 == 3)
  {
    uint64_t v13 = [(STAppInfoCache *)self _placeholderAppInfoWithBundleIdentifier:v6];

    v7 = (void *)v13;
  }
LABEL_12:

  return v7;
}

void __55__STAppInfoCache_appInfoForBundleIdentifier_localOnly___block_invoke(uint64_t a1)
{
  id v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", *(void *)(a1 + 32), 0);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _fetchAppStoreInfoAndNotifyWithBundleIdentifiers:v3];
}

- (id)appInfoForBundleIdentifier:(id)a3
{
  return [(STAppInfoCache *)self appInfoForBundleIdentifier:a3 localOnly:0];
}

- (void)fetchAppInfoForBundleIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v6, 0);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__STAppInfoCache_fetchAppInfoForBundleIdentifier_completionHandler___block_invoke;
  v11[3] = &unk_1E6BC6DB0;
  id v12 = v6;
  id v13 = v7;
  id v9 = v6;
  id v10 = v7;
  [(STAppInfoCache *)self fetchAppInfoForBundleIdentifiers:v8 completionHandler:v11];
}

void __68__STAppInfoCache_fetchAppInfoForBundleIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [a2 objectForKeyedSubscript:*(void *)(a1 + 32)];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

- (void)fetchAppInfoForBundleIdentifiers:(id)a3 completionHandler:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v6, "count"));
  id v9 = objc_opt_new();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v10 = v6;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        id v16 = [(STAppInfoCache *)self _appInfoForBundleIdentifier:v15];
        if ([v16 source]) {
          [v8 setObject:v16 forKeyedSubscript:v15];
        }
        else {
          [v9 addObject:v15];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v12);
  }

  if ([v9 count])
  {
    id v17 = [(STAppInfoCache *)self lookupQueue];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __69__STAppInfoCache_fetchAppInfoForBundleIdentifiers_completionHandler___block_invoke;
    v18[3] = &unk_1E6BC6E00;
    v18[4] = self;
    id v19 = v9;
    id v20 = v8;
    id v21 = v7;
    dispatch_async(v17, v18);
  }
  else
  {
    (*((void (**)(id, void *))v7 + 2))(v7, v8);
  }
}

void __69__STAppInfoCache_fetchAppInfoForBundleIdentifiers_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69__STAppInfoCache_fetchAppInfoForBundleIdentifiers_completionHandler___block_invoke_2;
  v6[3] = &unk_1E6BC6DD8;
  id v4 = *(id *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 32);
  id v7 = v4;
  uint64_t v8 = v5;
  id v9 = *(id *)(a1 + 56);
  [v2 _fetchAppStoreInfoAndNotifyWithBundleIdentifiers:v3 timeoutInterval:v6 completionHandler:30.0];
}

void __69__STAppInfoCache_fetchAppInfoForBundleIdentifiers_completionHandler___block_invoke_2(id *a1, uint64_t a2)
{
  if (a2) {
    [a1[4] addEntriesFromDictionary:a2];
  }
  uint64_t v3 = [a1[5] completionHandlerQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __69__STAppInfoCache_fetchAppInfoForBundleIdentifiers_completionHandler___block_invoke_3;
  v4[3] = &unk_1E6BC6D30;
  id v6 = a1[6];
  id v5 = a1[4];
  [v3 addOperationWithBlock:v4];
}

uint64_t __69__STAppInfoCache_fetchAppInfoForBundleIdentifiers_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)addObserver:(id)a3 selector:(SEL)a4 bundleIdentifier:(id)a5
{
  id v12 = a5;
  uint64_t v8 = (void *)MEMORY[0x1E4F28EB8];
  id v9 = a3;
  id v10 = [v8 defaultCenter];
  uint64_t v11 = [NSString stringWithFormat:@"AppInfoCacheDidFetchResult-%@", v12];
  [v10 addObserver:v9 selector:a4 name:v11 object:self];
}

- (void)removeObserver:(id)a3 bundleIdentifier:(id)a4
{
  id v10 = a4;
  id v6 = (void *)MEMORY[0x1E4F28EB8];
  id v7 = a3;
  uint64_t v8 = [v6 defaultCenter];
  id v9 = [NSString stringWithFormat:@"AppInfoCacheDidFetchResult-%@", v10];
  [v8 removeObserver:v7 name:v9 object:self];
}

- (id)_appInfoForBundleIdentifier:(id)a3
{
  id v4 = (__CFString *)a3;
  if (os_variant_has_internal_content())
  {
    id v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    char v6 = [v5 BOOLForKey:@"STAppInfoCacheSkipLS"];
  }
  else
  {
    char v6 = 0;
  }
  if (os_variant_has_internal_content())
  {
    id v7 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    char v8 = [v7 BOOLForKey:@"STAppInfoCacheSkipSynced"];
  }
  else
  {
    char v8 = 0;
  }
  int v9 = [(__CFString *)v4 isEqualToString:@"com.apple.iChat"];
  id v10 = @"com.apple.MobileSMS";
  if (!v9) {
    id v10 = v4;
  }
  uint64_t v11 = v10;

  id v12 = [(STAppInfoCache *)self appInfoByBundleIdentifier];
  uint64_t v13 = [v12 objectForKey:v11];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = [v13 displayName];
    uint64_t v16 = [v15 length];

    if (v16) {
      goto LABEL_26;
    }
    id v17 = +[STLog appInfo];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[STAppInfoCache _appInfoForBundleIdentifier:](v14);
    }
    goto LABEL_25;
  }
  if ((v6 & 1) != 0
    || ([(STAppInfoCache *)self _fetchAppInfoFromLaunchServicesWithBundleIdentifier:v11], (uint64_t v14 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v14 = [(STAppInfoCache *)self _preloadedAppInfoWithBundleIdentifier:v11];
    if (v14) {
      char v18 = 1;
    }
    else {
      char v18 = v8;
    }
    if ((v18 & 1) == 0)
    {
      uint64_t v14 = [(STAppInfoCache *)self _fetchSyncedInstalledAppInfoForBundleIdentifier:v11];
    }
    if (!v14)
    {
      uint64_t v14 = [(STAppInfoCache *)self _placeholderAppInfoWithBundleIdentifier:v11];
    }
  }
  [v12 setObject:v14 forKey:v11];
  id v19 = [v14 displayName];
  uint64_t v20 = [v19 length];

  if (!v20)
  {
    id v17 = +[STLog appInfo];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[STAppInfoCache _appInfoForBundleIdentifier:](v14);
    }
LABEL_25:
  }
LABEL_26:
  id v21 = v14;

  return v21;
}

- (id)_fetchAppInfoFromLaunchServicesWithBundleIdentifier:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = +[STLog appInfo];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[STAppInfoCache _fetchAppInfoFromLaunchServicesWithBundleIdentifier:]((uint64_t)v3, v4);
  }

  id v29 = 0;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v3 allowPlaceholder:0 error:&v29];
  id v6 = v29;
  if (v5)
  {
    if ([v3 isEqualToString:@"com.apple.facetime"]
      && !MGGetBoolAnswer())
    {
      id v7 = 0;
      goto LABEL_23;
    }
    id v7 = objc_opt_new();
    [v7 setSource:2];
    [v7 setBundleIdentifier:v3];
    char v8 = [v5 localizedName];
    [v7 setDisplayName:v8];

    [v7 setPlatform:2];
    int v9 = [v5 URL];
    [v7 setLocalURL:v9];

    if (_os_feature_enabled_impl())
    {
      id v10 = [v5 iTunesMetadata];
      uint64_t v11 = [v10 distributorInfo];
      id v12 = [v11 distributorID];
      [v7 setDistributorID:v12];

      uint64_t v13 = [v5 iTunesMetadata];
      objc_msgSend(v7, "setAdamID:", objc_msgSend(v13, "storeItemIdentifier"));

      uint64_t v14 = [v5 iTunesMetadata];
      objc_msgSend(v7, "setVersionIdentifier:", objc_msgSend(v14, "versionIdentifier"));

      uint64_t v15 = [v5 iTunesMetadata];
      objc_msgSend(v7, "setBetaVersionIdentifier:", objc_msgSend(v15, "betaVersionIdentifier"));

      uint64_t v16 = [v5 iTunesMetadata];
      id v17 = [v16 distributorInfo];
      objc_msgSend(v7, "setDistributorIsThirdParty:", objc_msgSend(v17, "distributorIsThirdParty"));
    }
    char v18 = +[STScreenTimeCoreBundle bundle];
    id v19 = [v5 compatibilityObject];
    uint64_t v20 = [v19 applicationType];
    int v21 = [v20 isEqualToString:*MEMORY[0x1E4F22380]];

    if (v21)
    {
      long long v22 = [v18 localizedStringForKey:@"AppleDeveloperName" value:&stru_1F3487700 table:0];
      [v7 setDeveloperName:v22];
    }
    else
    {
      long long v22 = [v5 iTunesMetadata];
      long long v23 = [v22 artistName];
      if (v23)
      {
        [v7 setDeveloperName:v23];
      }
      else
      {
        long long v24 = [v18 localizedStringForKey:@"NoDeveloper" value:&stru_1F3487700 table:0];
        [v7 setDeveloperName:v24];
      }
    }

    long long v25 = [v5 iTunesMetadata];
    v26 = [v25 ratingLabel];
    if (v26)
    {
      [v7 setRatingLabel:v26];
    }
    else
    {
      uint64_t v27 = [v18 localizedStringForKey:@"NoAgeRating" value:&stru_1F3487700 table:0];
      [v7 setRatingLabel:v27];
    }
  }
  else
  {
    char v18 = +[STLog ask];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      id v31 = v3;
      __int16 v32 = 2114;
      id v33 = v6;
      _os_log_impl(&dword_1DA519000, v18, OS_LOG_TYPE_INFO, "No application record found for %{public}@ %{public}@", buf, 0x16u);
    }
    id v7 = 0;
  }

LABEL_23:
  return v7;
}

- (void)_fetchAppStoreInfoAndNotifyWithBundleIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = [(STAppInfoCache *)self lookupQueue];
  dispatch_assert_queue_V2(v5);

  id v7 = (id)[v4 mutableCopy];
  id v6 = [(STAppInfoCache *)self bundleIdentifiersWithPendingRequests];
  [v7 minusSet:v6];

  if ([v7 count]) {
    [(STAppInfoCache *)self _fetchAppStoreInfoAndNotifyWithBundleIdentifiers:v7 timeoutInterval:0 completionHandler:0.0];
  }
}

- (void)_fetchAppStoreInfoAndNotifyWithBundleIdentifiers:(id)a3 timeoutInterval:(double)a4 completionHandler:(id)a5
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v48 = a3;
  id v47 = a5;
  v46 = [(STAppInfoCache *)self bundleIdentifiersWithPendingRequests];
  id v8 = (id)[v48 mutableCopy];
  int v9 = +[STLog appInfo];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v72 = v8;
    _os_log_impl(&dword_1DA519000, v9, OS_LOG_TYPE_INFO, "Going to query %{public}@ from the store", buf, 0xCu);
  }

  [v46 unionSet:v8];
  if (!_os_feature_enabled_impl())
  {
LABEL_39:
    v30 = [MEMORY[0x1E4F29088] componentsWithString:@"https://itunes.apple.com/lookup"];
    id v31 = (void *)MEMORY[0x1E4F290C8];
    __int16 v32 = [v8 allObjects];
    id v33 = [v32 componentsJoinedByString:@","];
    uint64_t v34 = [v31 queryItemWithName:@"bundleId" value:v33];

    v35 = (void *)MEMORY[0x1E4F290C8];
    v36 = [MEMORY[0x1E4F1CA20] currentLocale];
    v37 = [v36 countryCode];
    v38 = [v35 queryItemWithName:@"country" value:v37];

    v39 = [MEMORY[0x1E4F290C8] queryItemWithName:@"entity" value:@"software,iPadSoftware,macSoftware"];
    v70[0] = v34;
    v70[1] = v38;
    v70[2] = v39;
    v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v70 count:3];
    [v30 setQueryItems:v40];

    objc_initWeak((id *)buf, self);
    v41 = (void *)MEMORY[0x1E4F290D0];
    v42 = [v30 URL];
    if (a4 <= 0.0) {
      [v41 requestWithURL:v42];
    }
    else {
    v43 = [v41 requestWithURL:v42 cachePolicy:2 timeoutInterval:a4];
    }

    v44 = [(STAppInfoCache *)self urlSession];
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __101__STAppInfoCache__fetchAppStoreInfoAndNotifyWithBundleIdentifiers_timeoutInterval_completionHandler___block_invoke_5;
    v54[3] = &unk_1E6BC6E78;
    objc_copyWeak(&v57, (id *)buf);
    id v8 = v8;
    id v55 = v8;
    id v56 = v47;
    v45 = [v44 dataTaskWithRequest:v43 completionHandler:v54];

    [v45 resume];
    objc_destroyWeak(&v57);

    objc_destroyWeak((id *)buf);
    goto LABEL_43;
  }
  uint64_t v10 = [v8 count];
  v53 = (void *)[v48 mutableCopy];
  v51 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v10];
  v52 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v10];
  v50 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:v10];
  v49 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:v10];
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v66 objects:v75 count:16];
  if (!v12) {
    goto LABEL_30;
  }
  uint64_t v13 = *(void *)v67;
  do
  {
    uint64_t v14 = 0;
    do
    {
      if (*(void *)v67 != v13) {
        objc_enumerationMutation(v11);
      }
      uint64_t v15 = *(void **)(*((void *)&v66 + 1) + 8 * v14);
      uint64_t v16 = [(NSCache *)self->_appInfoByBundleIdentifier objectForKey:v15];
      if (!v16)
      {
        uint64_t v20 = +[STLog appInfo];
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          goto LABEL_22;
        }
        *(_DWORD *)buf = 138412290;
        id v72 = v15;
        long long v23 = v20;
        long long v24 = "AppInfo not found for bundleIdentifier: %@";
        uint32_t v25 = 12;
LABEL_28:
        _os_log_error_impl(&dword_1DA519000, v23, OS_LOG_TYPE_ERROR, v24, buf, v25);
        goto LABEL_22;
      }
      if (os_variant_has_internal_content())
      {
        id v17 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
        char v18 = [v17 BOOLForKey:@"STAppInfoCacheSkipAMS"];

        if (v18)
        {
          int v19 = 1;
LABEL_21:
          uint64_t v20 = +[STLog appInfo];
          if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
            goto LABEL_22;
          }
          *(_DWORD *)buf = 138412546;
          id v72 = v15;
          __int16 v73 = 1024;
          int v74 = v19;
          long long v23 = v20;
          long long v24 = "AppInfo from unknown source or missing an adamID or skipping AMS. Reverting to iTunes lookup. BundleIden"
                "tifier: %@, skipping AMS: %d";
          uint32_t v25 = 18;
          goto LABEL_28;
        }
      }
      if (![v16 source] || !objc_msgSend(v16, "adamID"))
      {
        int v19 = 0;
        goto LABEL_21;
      }
      [v53 removeObject:v15];
      if ([v16 distributorIsThirdParty])
      {
        [v52 addObject:v16];
        [v49 addObject:v15];
        uint64_t v20 = +[STLog appInfo];
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_INFO)) {
          goto LABEL_22;
        }
        *(_DWORD *)buf = 138543362;
        id v72 = v15;
        int v21 = v20;
        long long v22 = "Adding app with bundleID %{public}@ to global list";
      }
      else
      {
        [v51 addObject:v16];
        [v50 addObject:v15];
        uint64_t v20 = +[STLog appInfo];
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_INFO)) {
          goto LABEL_22;
        }
        *(_DWORD *)buf = 138543362;
        id v72 = v15;
        int v21 = v20;
        long long v22 = "Adding app with bundleID %{public}@ to App Store list";
      }
      _os_log_impl(&dword_1DA519000, v21, OS_LOG_TYPE_INFO, v22, buf, 0xCu);
LABEL_22:

      ++v14;
    }
    while (v12 != v14);
    uint64_t v26 = [v11 countByEnumeratingWithState:&v66 objects:v75 count:16];
    uint64_t v12 = v26;
  }
  while (v26);
LABEL_30:

  objc_initWeak((id *)buf, self);
  if ([v52 count])
  {
    uint64_t v27 = +[STAMSClient makeAMSMediaTaskForApps:v52 isGlobal:1];
    if (v27)
    {
      v62[0] = MEMORY[0x1E4F143A8];
      v62[1] = 3221225472;
      v62[2] = __101__STAppInfoCache__fetchAppStoreInfoAndNotifyWithBundleIdentifiers_timeoutInterval_completionHandler___block_invoke;
      v62[3] = &unk_1E6BC6E50;
      v62[4] = self;
      objc_copyWeak(&v65, (id *)buf);
      id v63 = v49;
      id v64 = v47;
      +[STAMSClient loadMediaForTask:v27 withCompletionHandler:v62];

      objc_destroyWeak(&v65);
    }
  }
  if ([v51 count])
  {
    v28 = +[STAMSClient makeAMSMediaTaskForApps:v51 isGlobal:0];
    if (v28)
    {
      v58[0] = MEMORY[0x1E4F143A8];
      v58[1] = 3221225472;
      v58[2] = __101__STAppInfoCache__fetchAppStoreInfoAndNotifyWithBundleIdentifiers_timeoutInterval_completionHandler___block_invoke_3;
      v58[3] = &unk_1E6BC6E50;
      v58[4] = self;
      objc_copyWeak(&v61, (id *)buf);
      id v59 = v50;
      id v60 = v47;
      +[STAMSClient loadMediaForTask:v28 withCompletionHandler:v58];

      objc_destroyWeak(&v61);
    }
  }
  id v8 = v53;

  BOOL v29 = [v8 count] == 0;
  objc_destroyWeak((id *)buf);

  if (!v29) {
    goto LABEL_39;
  }
LABEL_43:
}

void __101__STAppInfoCache__fetchAppStoreInfoAndNotifyWithBundleIdentifiers_timeoutInterval_completionHandler___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [a1[4] lookupQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __101__STAppInfoCache__fetchAppStoreInfoAndNotifyWithBundleIdentifiers_timeoutInterval_completionHandler___block_invoke_2;
  block[3] = &unk_1E6BC6E28;
  objc_copyWeak(&v15, a1 + 7);
  id v11 = a1[5];
  id v12 = v6;
  id v13 = v5;
  id v14 = a1[6];
  id v8 = v5;
  id v9 = v6;
  dispatch_async(v7, block);

  objc_destroyWeak(&v15);
}

void __101__STAppInfoCache__fetchAppStoreInfoAndNotifyWithBundleIdentifiers_timeoutInterval_completionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v2 = (void *)[*(id *)(a1 + 32) copy];
  [WeakRetained _handleAMSClientResponseForBundleIdentifiers:v2 results:*(void *)(a1 + 40) error:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
}

void __101__STAppInfoCache__fetchAppStoreInfoAndNotifyWithBundleIdentifiers_timeoutInterval_completionHandler___block_invoke_3(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [a1[4] lookupQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __101__STAppInfoCache__fetchAppStoreInfoAndNotifyWithBundleIdentifiers_timeoutInterval_completionHandler___block_invoke_4;
  block[3] = &unk_1E6BC6E28;
  objc_copyWeak(&v15, a1 + 7);
  id v11 = a1[5];
  id v12 = v6;
  id v13 = v5;
  id v14 = a1[6];
  id v8 = v5;
  id v9 = v6;
  dispatch_async(v7, block);

  objc_destroyWeak(&v15);
}

void __101__STAppInfoCache__fetchAppStoreInfoAndNotifyWithBundleIdentifiers_timeoutInterval_completionHandler___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v2 = (void *)[*(id *)(a1 + 32) copy];
  [WeakRetained _handleAMSClientResponseForBundleIdentifiers:v2 results:*(void *)(a1 + 40) error:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
}

void __101__STAppInfoCache__fetchAppStoreInfoAndNotifyWithBundleIdentifiers_timeoutInterval_completionHandler___block_invoke_5(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = (id *)(a1 + 48);
  id v8 = a4;
  id v9 = a3;
  id v10 = a2;
  id WeakRetained = objc_loadWeakRetained(v7);
  [WeakRetained _handleiTunesResponseForBundleIdentifiers:*(void *)(a1 + 32) response:v9 data:v10 error:v8 completionHandler:*(void *)(a1 + 40)];
}

- (void)_handleAMSClientResponseForBundleIdentifiers:(id)a3 results:(id)a4 error:(id)a5 completionHandler:(id)a6
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v54 = a6;
  id v13 = [(STAppInfoCache *)self lookupQueue];
  dispatch_assert_queue_V2(v13);

  val = self;
  id v14 = [(STAppInfoCache *)self bundleIdentifiersWithPendingRequests];
  [v14 minusSet:v10];

  if (!v11 || ![v11 count])
  {
    id v15 = +[STLog appInfo];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[STAppInfoCache _handleAMSClientResponseForBundleIdentifiers:results:error:completionHandler:]();
    }
  }
  id v56 = v12;
  id v59 = (void *)[v10 mutableCopy];
  uint64_t v16 = objc_opt_new();
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v17 = v11;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v68 objects:v76 count:16];
  v58 = v17;
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v69;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v69 != v20) {
          objc_enumerationMutation(v17);
        }
        long long v22 = *(void **)(*((void *)&v68 + 1) + 8 * i);
        long long v23 = [v22 bundleIdentifier];
        uint64_t v24 = [v23 length];

        if (!v24)
        {
          uint64_t v27 = +[STLog appInfo];
          if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
            goto LABEL_27;
          }
          *(_DWORD *)buf = 138543362;
          v75 = v22;
          __int16 v32 = v27;
          id v33 = "Unable to parse store response, bundle identifier is missing: %{public}@";
LABEL_19:
          _os_log_error_impl(&dword_1DA519000, v32, OS_LOG_TYPE_ERROR, v33, buf, 0xCu);
          goto LABEL_27;
        }
        uint32_t v25 = [v22 displayName];
        uint64_t v26 = [v25 length];

        if (!v26)
        {
          uint64_t v27 = +[STLog appInfo];
          if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
            goto LABEL_27;
          }
          *(_DWORD *)buf = 138543362;
          v75 = v22;
          __int16 v32 = v27;
          id v33 = "Unable to parse store response, display name is missing: %{public}@";
          goto LABEL_19;
        }
        uint64_t v27 = objc_opt_new();
        [v27 setSource:3];
        v28 = [v22 bundleIdentifier];
        [v27 setBundleIdentifier:v28];

        BOOL v29 = [v22 displayName];
        [v27 setDisplayName:v29];

        v30 = [v22 software];
        if ([v30 isEqualToString:@"software"])
        {

          uint64_t v31 = 2;
        }
        else
        {
          uint64_t v34 = [v22 software];
          char v35 = [v34 isEqualToString:@"ipad-software"];

          if (v35)
          {
            uint64_t v31 = 2;
          }
          else
          {
            v36 = [v22 software];
            uint64_t v31 = [v36 isEqualToString:@"mac-software"];
          }
          id v17 = v58;
        }
        [v27 setPlatform:v31];
        v37 = [v22 artworkURL];
        [v27 setArtworkURL:v37];

        v38 = [v22 vendorName];
        [v27 setDeveloperName:v38];

        v39 = [v22 ratingLabel];
        [v27 setRatingLabel:v39];

        v40 = [v22 bundleIdentifier];
        [v16 setObject:v27 forKeyedSubscript:v40];

        v41 = [v22 bundleIdentifier];
        [v59 removeObject:v41];

        v42 = +[STLog appInfo];
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG)) {
          -[STAppInfoCache _handleAMSClientResponseForBundleIdentifiers:results:error:completionHandler:]((uint64_t)v73, (uint64_t)v27);
        }

LABEL_27:
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v68 objects:v76 count:16];
    }
    while (v19);
  }
  id v57 = v10;

  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id v43 = v59;
  uint64_t v44 = [v43 countByEnumeratingWithState:&v64 objects:v72 count:16];
  if (v44)
  {
    uint64_t v45 = v44;
    uint64_t v46 = *(void *)v65;
    do
    {
      for (uint64_t j = 0; j != v45; ++j)
      {
        if (*(void *)v65 != v46) {
          objc_enumerationMutation(v43);
        }
        uint64_t v48 = *(void *)(*((void *)&v64 + 1) + 8 * j);
        v49 = objc_opt_new();
        [v49 setSource:3];
        [v49 setBundleIdentifier:v48];
        [v49 setDisplayName:v48];
        [v49 setPlatform:0];
        v50 = +[STLog appInfo];
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
        {
          v51 = [v49 bundleIdentifier];
          *(_DWORD *)buf = 138412290;
          v75 = v51;
          _os_log_impl(&dword_1DA519000, v50, OS_LOG_TYPE_DEFAULT, "Did not find app %@ in AMS Response; setting AppInfo to placeholder",
            buf,
            0xCu);
        }
        [v16 setObject:v49 forKeyedSubscript:v48];
      }
      uint64_t v45 = [v43 countByEnumeratingWithState:&v64 objects:v72 count:16];
    }
    while (v45);
  }

  objc_initWeak((id *)buf, val);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __95__STAppInfoCache__handleAMSClientResponseForBundleIdentifiers_results_error_completionHandler___block_invoke;
  block[3] = &unk_1E6BC6EA0;
  objc_copyWeak(&v63, (id *)buf);
  id v61 = v16;
  id v62 = v54;
  id v52 = v54;
  id v53 = v16;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v63);
  objc_destroyWeak((id *)buf);
}

uint64_t __95__STAppInfoCache__handleAMSClientResponseForBundleIdentifiers_results_error_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _finishedFetchingAppInfoByBundleIdentifier:*(void *)(a1 + 32)];

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)_handleiTunesResponseForBundleIdentifiers:(id)a3 response:(id)a4 data:(id)a5 error:(id)a6 completionHandler:(id)a7
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = (void (**)(id, void))a7;
  id v15 = [(STAppInfoCache *)self lookupQueue];
  dispatch_assert_queue_V2(v15);

  uint64_t v16 = [(STAppInfoCache *)self bundleIdentifiersWithPendingRequests];
  [v16 minusSet:v11];

  if (!v12 || v13)
  {
    uint64_t v44 = +[STLog appInfo];
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
      -[STAppInfoCache _handleiTunesResponseForBundleIdentifiers:response:data:error:completionHandler:]();
    }

    if (v14) {
      v14[2](v14, 0);
    }
  }
  else
  {
    id v69 = 0;
    id v17 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v12 options:0 error:&v69];
    id v18 = v69;
    if (v17)
    {
      id v52 = (void *)[v11 mutableCopy];
      id v56 = objc_opt_new();
      uint64_t v19 = [v17 objectForKeyedSubscript:@"results"];
      objc_opt_class();
      id v50 = v12;
      id v51 = v11;
      v49 = v14;
      val = self;
      id v47 = v18;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        uint64_t v19 = 0;
      }
      uint64_t v48 = v17;
      long long v67 = 0u;
      long long v68 = 0u;
      long long v66 = 0u;
      long long v65 = 0u;
      obuint64_t j = v19;
      uint64_t v55 = [obj countByEnumeratingWithState:&v65 objects:v74 count:16];
      if (v55)
      {
        uint64_t v54 = *(void *)v66;
        do
        {
          for (uint64_t i = 0; i != v55; ++i)
          {
            if (*(void *)v66 != v54) {
              objc_enumerationMutation(obj);
            }
            int v21 = *(void **)(*((void *)&v65 + 1) + 8 * i);
            long long v22 = objc_msgSend(v21, "objectForKeyedSubscript:", @"bundleId", val);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {

              long long v22 = 0;
            }
            long long v23 = [v21 objectForKeyedSubscript:@"trackName"];
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {

              long long v23 = 0;
            }
            uint64_t v24 = [v21 objectForKeyedSubscript:@"kind"];
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {

              uint64_t v24 = 0;
            }
            uint32_t v25 = [v21 objectForKeyedSubscript:@"artworkUrl100"];
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {

              uint32_t v25 = 0;
            }
            uint64_t v26 = [v21 objectForKeyedSubscript:@"artistName"];
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {

              uint64_t v26 = 0;
            }
            uint64_t v27 = [v21 objectForKeyedSubscript:@"contentAdvisoryRating"];
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {

              uint64_t v27 = 0;
            }
            if (![v22 length])
            {
              v28 = +[STLog appInfo];
              if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
                goto LABEL_40;
              }
              *(_DWORD *)buf = 138543362;
              __int16 v73 = v21;
              v30 = v28;
              uint64_t v31 = "Unable to parse store response, bundle identifier is missing: %{public}@";
LABEL_32:
              _os_log_error_impl(&dword_1DA519000, v30, OS_LOG_TYPE_ERROR, v31, buf, 0xCu);
              goto LABEL_40;
            }
            if (![v23 length])
            {
              v28 = +[STLog appInfo];
              if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
                goto LABEL_40;
              }
              *(_DWORD *)buf = 138543362;
              __int16 v73 = v21;
              v30 = v28;
              uint64_t v31 = "Unable to parse store response, display name is missing: %{public}@";
              goto LABEL_32;
            }
            v28 = objc_opt_new();
            [v28 setSource:3];
            [v28 setBundleIdentifier:v22];
            [v28 setDisplayName:v23];
            if (([v24 isEqualToString:@"software"] & 1) != 0
              || ([v24 isEqualToString:@"ipad-software"] & 1) != 0)
            {
              uint64_t v29 = 2;
            }
            else
            {
              uint64_t v29 = [v24 isEqualToString:@"mac-software"];
            }
            [v28 setPlatform:v29];
            if ([v25 length])
            {
              __int16 v32 = [MEMORY[0x1E4F1CB10] URLWithString:v25];
              [v28 setArtworkURL:v32];
            }
            else
            {
              [v28 setArtworkURL:0];
            }
            [v28 setDeveloperName:v26];
            [v28 setRatingLabel:v27];
            [v56 setObject:v28 forKeyedSubscript:v22];
            [v52 removeObject:v22];
            id v33 = +[STLog appInfo];
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
              -[STAppInfoCache _handleAMSClientResponseForBundleIdentifiers:results:error:completionHandler:]((uint64_t)v71, (uint64_t)v28);
            }

LABEL_40:
          }
          uint64_t v55 = [obj countByEnumeratingWithState:&v65 objects:v74 count:16];
        }
        while (v55);
      }

      long long v63 = 0u;
      long long v64 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      id v34 = v52;
      uint64_t v35 = [v34 countByEnumeratingWithState:&v61 objects:v70 count:16];
      if (v35)
      {
        uint64_t v36 = v35;
        uint64_t v37 = *(void *)v62;
        do
        {
          for (uint64_t j = 0; j != v36; ++j)
          {
            if (*(void *)v62 != v37) {
              objc_enumerationMutation(v34);
            }
            uint64_t v39 = *(void *)(*((void *)&v61 + 1) + 8 * j);
            v40 = objc_opt_new();
            [v40 setSource:3];
            [v40 setBundleIdentifier:v39];
            [v40 setDisplayName:v39];
            [v40 setPlatform:0];
            v41 = +[STLog appInfo];
            if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
            {
              v42 = [v40 bundleIdentifier];
              *(_DWORD *)buf = 138412290;
              __int16 v73 = v42;
              _os_log_impl(&dword_1DA519000, v41, OS_LOG_TYPE_DEFAULT, "Did not find app %@ in iTunes Response; setting AppInfo to placeholder",
                buf,
                0xCu);
            }
            [v56 setObject:v40 forKeyedSubscript:v39];
          }
          uint64_t v36 = [v34 countByEnumeratingWithState:&v61 objects:v70 count:16];
        }
        while (v36);
      }

      objc_initWeak((id *)buf, val);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __98__STAppInfoCache__handleiTunesResponseForBundleIdentifiers_response_data_error_completionHandler___block_invoke;
      block[3] = &unk_1E6BC6EA0;
      objc_copyWeak(&v60, (id *)buf);
      id v58 = v56;
      id v14 = v49;
      id v59 = v49;
      id v43 = v56;
      dispatch_async(MEMORY[0x1E4F14428], block);

      objc_destroyWeak(&v60);
      objc_destroyWeak((id *)buf);

      id v12 = v50;
      id v11 = v51;
      id v13 = 0;
      id v18 = v47;
      id v17 = v48;
    }
    else
    {
      uint64_t v45 = +[STLog appInfo];
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
        -[STAppInfoCache _handleiTunesResponseForBundleIdentifiers:response:data:error:completionHandler:]();
      }

      if (v14) {
        v14[2](v14, 0);
      }
    }
  }
}

uint64_t __98__STAppInfoCache__handleiTunesResponseForBundleIdentifiers_response_data_error_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _finishedFetchingAppInfoByBundleIdentifier:*(void *)(a1 + 32)];

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (id)_fetchSyncedInstalledAppInfoForBundleIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy_;
  id v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  id v5 = [(STAppInfoCache *)self persistentContainer];
  id v6 = v5;
  if (v5)
  {
    id v7 = (void *)[v5 newBackgroundContext];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __66__STAppInfoCache__fetchSyncedInstalledAppInfoForBundleIdentifier___block_invoke;
    v10[3] = &unk_1E6BC6EF0;
    id v11 = v4;
    id v12 = &v13;
    [v7 performBlockAndWait:v10];
  }
  id v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __66__STAppInfoCache__fetchSyncedInstalledAppInfoForBundleIdentifier___block_invoke(uint64_t a1)
{
  v46[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[STInstalledApp fetchRequest];
  id v3 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"bundleIdentifier", *(void *)(a1 + 32)];
  [v2 setPredicate:v3];

  id v4 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"userDeviceState.device.identifier" ascending:1];
  v46[0] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:1];
  [v2 setSortDescriptors:v5];

  id v41 = 0;
  id v6 = [v2 execute:&v41];
  id v7 = v41;
  if (!v6)
  {
    id v10 = +[STLog appInfo];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      __66__STAppInfoCache__fetchSyncedInstalledAppInfoForBundleIdentifier___block_invoke_cold_1((uint64_t)v7, v10);
    }
    goto LABEL_10;
  }
  if (![v6 count])
  {
    id v10 = +[STLog appInfo];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = [v2 predicate];
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v11;
      _os_log_impl(&dword_1DA519000, v10, OS_LOG_TYPE_INFO, "No installed apps matching predicate: %{public}@", (uint8_t *)&buf, 0xCu);
    }
LABEL_10:

    goto LABEL_40;
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v44 = 0x2020000000;
  uint64_t v45 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x2020000000;
  uint64_t v40 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v33 = 0;
  id v34 = &v33;
  uint64_t v35 = 0x2020000000;
  uint64_t v36 = 0x7FFFFFFFFFFFFFFFLL;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __66__STAppInfoCache__fetchSyncedInstalledAppInfoForBundleIdentifier___block_invoke_226;
  v32[3] = &unk_1E6BC6EC8;
  v32[4] = &v33;
  v32[5] = &buf;
  v32[6] = &v37;
  uint64_t v8 = [v6 indexOfObjectPassingTest:v32];
  if (v8 != 0x7FFFFFFFFFFFFFFFLL
    || (uint64_t v8 = v38[3], v8 != 0x7FFFFFFFFFFFFFFFLL)
    || (v34[3] == 0x7FFFFFFFFFFFFFFFLL || !_os_feature_enabled_impl()
      ? (id v9 = (uint64_t *)*((void *)&buf + 1))
      : (id v9 = v34),
        uint64_t v8 = v9[3],
        v8 != 0x7FFFFFFFFFFFFFFFLL))
  {
    id v12 = [v6 objectAtIndexedSubscript:v8];
    uint64_t v13 = objc_opt_new();
    uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;

    if (_os_feature_enabled_impl())
    {
      uint64_t v16 = [v12 adamID];
      if (v16
        && ([v12 adamID],
            id v17 = objc_claimAutoreleasedReturnValue(),
            uint64_t v18 = [v17 unsignedLongValue],
            v17,
            v16,
            v18))
      {
        uint64_t v19 = 3;
      }
      else
      {
        uint64_t v18 = 0;
        uint64_t v19 = 4;
      }
      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setSource:v19];
      uint64_t v20 = [v12 distributorID];
      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setDistributorID:v20];

      objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "setDistributorIsThirdParty:", objc_msgSend(v12, "distributorIsThirdParty"));
      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setAdamID:v18];
      int v21 = [v12 versionIdentifier];
      if (v21)
      {
        uint64_t v20 = [v12 versionIdentifier];
        uint64_t v22 = [v20 unsignedLongValue];
      }
      else
      {
        uint64_t v22 = 0;
      }
      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setVersionIdentifier:v22];
      if (v21) {

      }
      long long v23 = [v12 betaVersionIdentifier];
      if (v23)
      {
        uint64_t v20 = [v12 betaVersionIdentifier];
        uint64_t v24 = [v20 unsignedLongValue];
      }
      else
      {
        uint64_t v24 = 0;
      }
      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setBetaVersionIdentifier:v24];
      if (v23) {
    }
      }
    else
    {
      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setSource:4];
    }
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setBundleIdentifier:*(void *)(a1 + 32)];
    uint32_t v25 = [v12 userDeviceState];
    uint64_t v26 = [v25 device];
    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "setPlatform:", objc_msgSend(v26, "platform"));

    uint64_t v27 = [v12 displayName];
    LODWORD(v26) = [v27 length] == 0;

    if (v26)
    {
      uint64_t v29 = +[STLog appInfo];
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v30 = [v12 description];
        __66__STAppInfoCache__fetchSyncedInstalledAppInfoForBundleIdentifier___block_invoke_cold_2(v30, v42, v29);
      }

      v28 = [v12 bundleIdentifier];
      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setDisplayName:v28];
    }
    else
    {
      v28 = [v12 displayName];
      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setDisplayName:v28];
    }

    uint64_t v31 = [v12 iconData];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setArtworkData:v31];
  }
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&buf, 8);
LABEL_40:
}

BOOL __66__STAppInfoCache__fetchSyncedInstalledAppInfoForBundleIdentifier___block_invoke_226(void *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = [v5 displayName];

  uint64_t v7 = [v5 adamID];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    id v9 = [v5 adamID];
    char v10 = [v9 isEqualToNumber:&unk_1F349EB90];

    if ((v10 & 1) == 0)
    {
      if (_os_feature_enabled_impl()) {
        *(void *)(*(void *)(a1[4] + 8) + 24) = a3;
      }
    }
  }
  if (v6
    && (uint64_t v11 = *(void *)(a1[5] + 8), *(void *)(v11 + 24) == 0x7FFFFFFFFFFFFFFFLL)
    && (*(void *)(v11 + 24) = a3,
        [v5 iconData],
        id v12 = objc_claimAutoreleasedReturnValue(),
        v12,
        v12)
    && (uint64_t v13 = *(void *)(a1[6] + 8), *(void *)(v13 + 24) == 0x7FFFFFFFFFFFFFFFLL))
  {
    *(void *)(v13 + 24) = a3;
    uint64_t v14 = [v5 userDeviceState];
    uint64_t v15 = [v14 device];
    BOOL v16 = [v15 platform] == 2;
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (void)_finishedFetchingAppInfoByBundleIdentifier:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v5 = [(STAppInfoCache *)self appInfoByBundleIdentifier];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__STAppInfoCache__finishedFetchingAppInfoByBundleIdentifier___block_invoke;
  v7[3] = &unk_1E6BC6F18;
  id v8 = v5;
  id v9 = self;
  id v6 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:v7];
}

void __61__STAppInfoCache__finishedFetchingAppInfoByBundleIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = *(void **)(a1 + 32);
  id v7 = a3;
  [v6 setObject:v7 forKey:v5];
  id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v9 = [NSString stringWithFormat:@"AppInfoCacheDidFetchResult-%@", v5];
  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v13 = @"AppInfo";
  v14[0] = v7;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
  [v8 postNotificationName:v9 object:v10 userInfo:v11];

  id v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v12 postNotificationName:@"STAppInfoCacheDidUpdateNotificationName" object:*(void *)(a1 + 40) userInfo:0];
}

- (id)_preloadedAppInfoWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(STAppInfoCache *)self _localAppNameForBundleIdentifier:v4];
  if (v5)
  {
    id v6 = objc_opt_new();
    [v6 setSource:1];
    [v6 setBundleIdentifier:v4];
    [v6 setDisplayName:v5];
    [v6 setPlatform:2];
    id v7 = +[STScreenTimeCoreBundle bundle];
    id v8 = [v7 localizedStringForKey:@"AppleDeveloperName" value:&stru_1F3487700 table:0];
    [v6 setDeveloperName:v8];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)_placeholderAppInfoWithBundleIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  [v4 setSource:0];
  [v4 setBundleIdentifier:v3];
  [v4 setDisplayName:v3];

  [v4 setPlatform:0];
  return v4;
}

- (id)_localAppNameForBundleIdentifier:(id)a3
{
  id v3 = a3;
  if (_localAppNameForBundleIdentifier__onceToken != -1) {
    dispatch_once(&_localAppNameForBundleIdentifier__onceToken, &__block_literal_global_232);
  }
  id v4 = [(id)_localAppNameForBundleIdentifier__localAppNameMap objectForKeyedSubscript:v3];
  if (v4)
  {
    id v5 = +[STScreenTimeCoreBundle bundle];
    id v6 = [v5 localizedStringForKey:v4 value:&stru_1F3487700 table:0];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

void __51__STAppInfoCache__localAppNameForBundleIdentifier___block_invoke()
{
  v3[10] = *MEMORY[0x1E4F143B8];
  v2[0] = @"com.apple.camera";
  v2[1] = @"com.apple.compass";
  v3[0] = @"CameraAppName";
  v3[1] = @"CompassAppName";
  v2[2] = @"com.apple.Health";
  v2[3] = @"com.apple.mobilephone";
  v3[2] = @"HealthAppName";
  v3[3] = @"PhoneAppName";
  v2[4] = @"com.apple.mobilesafari";
  v2[5] = @"com.apple.mobileslideshow";
  v3[4] = @"SafariAppName";
  v3[5] = @"PhotosAppName";
  v2[6] = @"com.apple.MobileSMS";
  v2[7] = @"com.apple.mobiletimer";
  v3[6] = @"MessagesAppName";
  v3[7] = @"ClockAppName";
  v2[8] = @"com.apple.Passbook";
  v2[9] = @"com.apple.Preferences";
  v3[8] = @"PassbookAppName";
  v3[9] = @"SettingsAppName";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:10];
  v1 = (void *)_localAppNameForBundleIdentifier__localAppNameMap;
  _localAppNameForBundleIdentifier__localAppNameMap = v0;
}

- (NSPersistentContainer)persistentContainer
{
  return (NSPersistentContainer *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPersistentContainer:(id)a3
{
}

- (NSCache)appInfoByBundleIdentifier
{
  return self->_appInfoByBundleIdentifier;
}

- (OS_dispatch_queue)lookupQueue
{
  return self->_lookupQueue;
}

- (NSURLSession)urlSession
{
  return self->_urlSession;
}

- (NSMutableSet)bundleIdentifiersWithPendingRequests
{
  return self->_bundleIdentifiersWithPendingRequests;
}

- (NSOperationQueue)completionHandlerQueue
{
  return self->_completionHandlerQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionHandlerQueue, 0);
  objc_storeStrong((id *)&self->_bundleIdentifiersWithPendingRequests, 0);
  objc_storeStrong((id *)&self->_urlSession, 0);
  objc_storeStrong((id *)&self->_lookupQueue, 0);
  objc_storeStrong((id *)&self->_appInfoByBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_persistentContainer, 0);
}

- (void)_appInfoForBundleIdentifier:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 description];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_1DA519000, v2, v3, "STAppInfoCache is vending result with no displayName: %{public}@ in function: %s:%d", v4, v5, v6, v7, 2u);
}

- (void)_appInfoForBundleIdentifier:(void *)a1 .cold.2(void *a1)
{
  v1 = [a1 description];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_1DA519000, v2, v3, "STAppInfoCache is vending result with no displayName: %{public}@ in function: %s:%d", v4, v5, v6, v7, 2u);
}

- (void)_fetchAppInfoFromLaunchServicesWithBundleIdentifier:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1DA519000, a2, OS_LOG_TYPE_DEBUG, "Going to query %{public}@ from LS", (uint8_t *)&v2, 0xCu);
}

- (void)_handleAMSClientResponseForBundleIdentifiers:(uint64_t)a1 results:(uint64_t)a2 error:completionHandler:.cold.1(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = objc_msgSend((id)OUTLINED_FUNCTION_3(a1, a2), "bundleIdentifier");
  *uint64_t v3 = 138543362;
  void *v2 = v4;
  OUTLINED_FUNCTION_4(&dword_1DA519000, v5, v6, "Got app %{public}@ details from the store");
}

- (void)_handleAMSClientResponseForBundleIdentifiers:results:error:completionHandler:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1DA519000, v0, v1, "App lookup of %@ from media services failed: %{public}@");
}

- (void)_handleiTunesResponseForBundleIdentifiers:response:data:error:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1DA519000, v0, v1, "App lookup of %@ from store failed: %{public}@");
}

void __66__STAppInfoCache__fetchSyncedInstalledAppInfoForBundleIdentifier___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1DA519000, a2, OS_LOG_TYPE_FAULT, "Failed to fetch installed apps: %{public}@", (uint8_t *)&v2, 0xCu);
}

void __66__STAppInfoCache__fetchSyncedInstalledAppInfoForBundleIdentifier___block_invoke_cold_2(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)long long buf = 138543874;
  *((_WORD *)buf + 6) = 2080;
  *(void *)(buf + 4) = a1;
  *(void *)(buf + 14) = "-[STAppInfoCache _fetchSyncedInstalledAppInfoForBundleIdentifier:]_block_invoke";
  *((_WORD *)buf + 11) = 1024;
  *((_DWORD *)buf + 6) = 618;
  _os_log_error_impl(&dword_1DA519000, log, OS_LOG_TYPE_ERROR, "Display name missing for installedApplication: %{public}@ in function: %s:%d", buf, 0x1Cu);
}

@end