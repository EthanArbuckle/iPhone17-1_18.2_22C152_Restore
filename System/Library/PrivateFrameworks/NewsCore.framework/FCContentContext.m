@interface FCContentContext
+ (void)initialize;
- (FCAVAssetCacheType)avAssetCache;
- (FCAVAssetDownloadManager)avAssetDownloadManager;
- (FCAVAssetFactoryType)avAssetFactory;
- (FCAVAssetKeyCacheType)avAssetKeyCache;
- (FCAVAssetKeyManagerType)avAssetKeyManager;
- (FCAVAssetKeyServiceType)avAssetKeyService;
- (FCAVAssetPrewarming)avAssetPrewarmer;
- (FCAVAssetResourceLoaderType)avAssetResourceLoader;
- (FCArticleController)articleController;
- (FCAssetKeyCacheType)assetKeyCache;
- (FCAssetKeyManagerType)assetKeyManager;
- (FCAssetKeyServiceType)assetKeyService;
- (FCAssetManager)assetManager;
- (FCBackgroundTaskable)backgroundTaskable;
- (FCContentContext)initWithConfiguration:(id)a3 configurationManager:(id)a4 contentDatabase:(id)a5 contentHostDirectory:(id)a6 networkBehaviorMonitor:(id)a7 networkReachability:(id)a8 setupCustomURLProtocols:(BOOL)a9 desiredHeadlineFieldOptions:(unint64_t)a10 feedUsage:(int64_t)a11 assetKeyManagerDelegate:(id)a12 appActivityMonitor:(id)a13 backgroundTaskable:(id)a14 pptContext:(id)a15;
- (FCContentContext)initWithConfiguration:(id)a3 configurationManager:(id)a4 contentHostDirectory:(id)a5 networkBehaviorMonitor:(id)a6 desiredHeadlineFieldOptions:(unint64_t)a7 feedUsage:(int64_t)a8 appActivityMonitor:(id)a9 backgroundTaskable:(id)a10 pptContext:(id)a11;
- (FCContentContext)initWithConfiguration:(id)a3 configurationManager:(id)a4 contentHostDirectory:(id)a5 networkBehaviorMonitor:(id)a6 networkReachability:(id)a7 desiredHeadlineFieldOptions:(unint64_t)a8 feedUsage:(int64_t)a9 assetKeyManagerDelegate:(id)a10 appActivityMonitor:(id)a11 backgroundTaskable:(id)a12 pptContext:(id)a13;
- (FCContentContextInternal)internalContentContext;
- (FCContextConfiguration)contextConfiguration;
- (FCCoreConfigurationManager)configurationManager;
- (FCFeedDatabaseProtocol)feedDatabase;
- (FCFlintResourceManager)flintResourceManager;
- (FCNetworkReachabilityRequirement)supportedCountryNetworkReachabilityRequirement;
- (FCNetworkReachabilityType)networkReachability;
- (FCNewsAppConfigurationManager)appConfigurationManager;
- (FCPPTContext)pptContext;
- (FCPuzzleController)puzzleController;
- (FCPuzzleTypeController)puzzleTypeController;
- (FCSportsEventController)sportsEventController;
- (FCTagController)tagController;
- (NSString)contentDirectory;
- (NSString)contentEnvironment;
- (NSString)contentEnvironmentToken;
- (NSString)contentStoreFrontID;
- (NSString)supportedContentStoreFrontID;
- (NSString)tabiModelsContentDirectory;
- (NSString)tabiModelsContentDirectoryLegacy;
- (NSString)tabiRequestsContentDirectory;
- (NSString)tabiResourcesContentDirectory;
- (NSString)tabiResourcesContentDirectoryLegacy;
- (NSURL)assetCacheDirectoryURL;
- (NSURL)contentHostDirectoryURL;
- (id)convertRecords:(id)a3;
- (id)interestTokenForContentManifest:(id)a3;
- (id)magazinesConfigurationManager;
- (id)news_core_ConfigurationManager;
- (id)recordSourceWithSchema:(id)a3;
- (id)recordTreeSourceWithRecordSources:(id)a3;
- (int64_t)storageSize;
- (void)_updateReachabilityGivenRequirements;
- (void)configurationManager:(id)a3 configurationDidChange:(id)a4;
- (void)configurationManagerScienceExperimentFieldsDidChange:(id)a3;
- (void)dealloc;
- (void)enableFlushingWithFlushingThreshold:(unint64_t)a3;
- (void)enableFlushingWithFlushingThreshold:(unint64_t)a3 exceptForFlusher:(id)a4;
- (void)ppt_overrideFeedEndpoint:(int64_t)a3;
- (void)ppt_prewarmFeedDatabase;
- (void)prewarmStores;
- (void)save;
- (void)setAssetCacheDirectoryURL:(id)a3;
- (void)setAssetKeyCache:(id)a3;
- (void)setAssetKeyManager:(id)a3;
- (void)setAssetKeyService:(id)a3;
- (void)setAvAssetCache:(id)a3;
- (void)setAvAssetDownloadManager:(id)a3;
- (void)setAvAssetFactory:(id)a3;
- (void)setAvAssetKeyCache:(id)a3;
- (void)setAvAssetKeyManager:(id)a3;
- (void)setAvAssetKeyService:(id)a3;
- (void)setAvAssetResourceLoader:(id)a3;
- (void)setContentDirectory:(id)a3;
- (void)setContentHostDirectoryURL:(id)a3;
- (void)setContextConfiguration:(id)a3;
- (void)setInternalContentContext:(id)a3;
- (void)setSupportedCountryNetworkReachabilityRequirement:(id)a3;
- (void)setTabiModelsContentDirectory:(id)a3;
- (void)setTabiModelsContentDirectoryLegacy:(id)a3;
- (void)setTabiRequestsContentDirectory:(id)a3;
- (void)setTabiResourcesContentDirectory:(id)a3;
- (void)setTabiResourcesContentDirectoryLegacy:(id)a3;
@end

@implementation FCContentContext

uint64_t __52__FCContentContext_interestTokenForContentManifest___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) recognizesRecordID:a2];
}

- (NSString)contentDirectory
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  contentDirectory = self->_contentDirectory;
  if (!contentDirectory)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "_contentDirectory");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCContentContext contentDirectory]";
      __int16 v8 = 2080;
      v9 = "FCContentContext.m";
      __int16 v10 = 1024;
      int v11 = 633;
      __int16 v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      contentDirectory = self->_contentDirectory;
    }
    else
    {
      contentDirectory = 0;
    }
  }
  return contentDirectory;
}

- (FCContentContextInternal)internalContentContext
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  internalContentContext = self->_internalContentContext;
  if (!internalContentContext)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "_internalContentContext");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCContentContext internalContentContext]";
      __int16 v8 = 2080;
      v9 = "FCContentContext.m";
      __int16 v10 = 1024;
      int v11 = 776;
      __int16 v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      internalContentContext = self->_internalContentContext;
    }
    else
    {
      internalContentContext = 0;
    }
  }
  return internalContentContext;
}

- (FCAssetManager)assetManager
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  assetManager = self->_assetManager;
  if (!assetManager)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "_assetManager");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCContentContext assetManager]";
      __int16 v8 = 2080;
      v9 = "FCContentContext.m";
      __int16 v10 = 1024;
      int v11 = 597;
      __int16 v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      assetManager = self->_assetManager;
    }
    else
    {
      assetManager = 0;
    }
  }
  return assetManager;
}

- (FCCoreConfigurationManager)configurationManager
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  configurationManager = self->_configurationManager;
  if (!configurationManager)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "_configurationManager");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCContentContext configurationManager]";
      __int16 v8 = 2080;
      v9 = "FCContentContext.m";
      __int16 v10 = 1024;
      int v11 = 570;
      __int16 v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      configurationManager = self->_configurationManager;
    }
    else
    {
      configurationManager = 0;
    }
  }
  return configurationManager;
}

- (FCNetworkReachabilityType)networkReachability
{
  return self->_networkReachability;
}

- (FCNewsAppConfigurationManager)appConfigurationManager
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  configurationManager = self->_configurationManager;
  if (configurationManager) {
    goto LABEL_14;
  }
  if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    goto LABEL_6;
  }
  v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "_configurationManager");
  *(_DWORD *)buf = 136315906;
  v9 = "-[FCContentContext appConfigurationManager]";
  __int16 v10 = 2080;
  int v11 = "FCContentContext.m";
  __int16 v12 = 1024;
  int v13 = 576;
  __int16 v14 = 2114;
  v15 = v7;
  _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  configurationManager = self->_configurationManager;
  if (configurationManager)
  {
LABEL_14:
    if ([(FCCoreConfigurationManager *)configurationManager conformsToProtocol:&unk_1EF8E1E38])v3 = configurationManager; {
    else
    }
      v3 = 0;
  }
  else
  {
LABEL_6:
    v3 = 0;
  }
  v5 = v3;
  return v5;
}

void __33__FCContentContext_prewarmStores__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) assetManager];
  [v2 prewarm];

  v3 = [*(id *)(a1 + 32) internalContentContext];
  v4 = [v3 articleRecordSource];
  [v4 prewarm];

  id v6 = [*(id *)(a1 + 32) internalContentContext];
  v5 = [v6 tagRecordSource];
  [v5 prewarm];
}

void __278__FCContentContext_initWithConfiguration_configurationManager_contentDatabase_contentHostDirectory_networkBehaviorMonitor_networkReachability_setupCustomURLProtocols_desiredHeadlineFieldOptions_feedUsage_assetKeyManagerDelegate_appActivityMonitor_backgroundTaskable_pptContext___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) avAssetKeyManager];
  v2 = [*(id *)(a1 + 32) avAssetCache];
  v3 = [v2 contentKeyIdentifiersForAllAssets];
  [v4 refreshKeysIfNearExpiration:v3 completionHandler:0];
}

void __73__FCContentContext_enableFlushingWithFlushingThreshold_exceptForFlusher___block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  v3 = [*(id *)(a1 + 32) assetManager];
  [v11 addObject:v3];

  id v4 = [*(id *)(a1 + 32) internalContentContext];
  [v11 addObject:v4];

  v5 = [*(id *)(a1 + 32) assetKeyCache];
  int v6 = [v5 conformsToProtocol:&unk_1EF8DFD58];

  if (v6)
  {
    v7 = [*(id *)(a1 + 32) assetKeyCache];
    [v11 addObject:v7];
  }
  __int16 v8 = [*(id *)(a1 + 32) avAssetCache];
  int v9 = [v8 conformsToProtocol:&unk_1EF8DFD58];

  if (v9)
  {
    __int16 v10 = [*(id *)(a1 + 32) avAssetCache];
    [v11 addObject:v10];
  }
}

- (FCAVAssetCacheType)avAssetCache
{
  return self->_avAssetCache;
}

- (FCAssetKeyCacheType)assetKeyCache
{
  return self->_assetKeyCache;
}

- (FCAVAssetKeyManagerType)avAssetKeyManager
{
  return self->_avAssetKeyManager;
}

- (void)enableFlushingWithFlushingThreshold:(unint64_t)a3
{
}

- (void)_updateReachabilityGivenRequirements
{
  id v4 = +[FCNetworkReachability sharedNetworkReachability];
  v3 = [(FCContentContext *)self supportedCountryNetworkReachabilityRequirement];
  objc_msgSend(v4, "setAccessRestrictedBecauseOfCountry:", objc_msgSend(v3, "isSatisfied") ^ 1);
}

- (FCNetworkReachabilityRequirement)supportedCountryNetworkReachabilityRequirement
{
  return self->_supportedCountryNetworkReachabilityRequirement;
}

- (void)enableFlushingWithFlushingThreshold:(unint64_t)a3 exceptForFlusher:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __73__FCContentContext_enableFlushingWithFlushingThreshold_exceptForFlusher___block_invoke;
  v17[3] = &unk_1E5B4BF30;
  v17[4] = self;
  v7 = objc_msgSend(MEMORY[0x1E4F1C978], "fc_array:", v17);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(id *)(*((void *)&v13 + 1) + 8 * v11);
        if (v12 != v6) {
          [v12 enableFlushingWithFlushingThreshold:a3];
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v9);
  }
}

- (FCContentContext)initWithConfiguration:(id)a3 configurationManager:(id)a4 contentDatabase:(id)a5 contentHostDirectory:(id)a6 networkBehaviorMonitor:(id)a7 networkReachability:(id)a8 setupCustomURLProtocols:(BOOL)a9 desiredHeadlineFieldOptions:(unint64_t)a10 feedUsage:(int64_t)a11 assetKeyManagerDelegate:(id)a12 appActivityMonitor:(id)a13 backgroundTaskable:(id)a14 pptContext:(id)a15
{
  uint64_t v196 = *MEMORY[0x1E4F143B8];
  id v182 = a3;
  id obj = a4;
  id v21 = a4;
  id v186 = a5;
  id v22 = a6;
  id v181 = a7;
  id v180 = a8;
  id v179 = a12;
  id v183 = a13;
  id v185 = a14;
  id v173 = a15;
  if (!v21 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v158 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "configurationManager != nil");
    *(_DWORD *)buf = 136315906;
    v191 = "-[FCContentContext initWithConfiguration:configurationManager:contentDatabase:contentHostDirectory:networkBeh"
           "aviorMonitor:networkReachability:setupCustomURLProtocols:desiredHeadlineFieldOptions:feedUsage:assetKeyManage"
           "rDelegate:appActivityMonitor:backgroundTaskable:pptContext:]";
    __int16 v192 = 2080;
    v193 = "FCContentContext.m";
    __int16 v194 = 1024;
    *(_DWORD *)v195 = 236;
    *(_WORD *)&v195[4] = 2114;
    *(void *)&v195[6] = v158;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v22) {
      goto LABEL_6;
    }
  }
  else if (v22)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v159 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "contentHostDirectory != nil");
    *(_DWORD *)buf = 136315906;
    v191 = "-[FCContentContext initWithConfiguration:configurationManager:contentDatabase:contentHostDirectory:networkBeh"
           "aviorMonitor:networkReachability:setupCustomURLProtocols:desiredHeadlineFieldOptions:feedUsage:assetKeyManage"
           "rDelegate:appActivityMonitor:backgroundTaskable:pptContext:]";
    __int16 v192 = 2080;
    v193 = "FCContentContext.m";
    __int16 v194 = 1024;
    *(_DWORD *)v195 = 237;
    *(_WORD *)&v195[4] = 2114;
    *(void *)&v195[6] = v159;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  v189.receiver = self;
  v189.super_class = (Class)FCContentContext;
  v23 = [(FCContentContext *)&v189 init];
  v24 = v23;
  v25 = v186;
  v184 = v22;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_contextConfiguration, a3);
    v26 = [v21 configuration];
    objc_msgSend(v186, "setShouldUseSecureConnectionForCKAssetURLs:", objc_msgSend(v26, "useSecureConnectionForAssets"));
    if (objc_opt_respondsToSelector()) {
      objc_msgSend(v186, "setMaximumRetryAfterForCK:", (double)objc_msgSend(v26, "maximumRetryAfterForCK"));
    }
    if (objc_opt_respondsToSelector())
    {
      v27 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      v28 = [v27 stringForKey:@"news.features.todaymodule"];

      if (objc_msgSend(NSString, "fc_string:isEqualToString:", @"enabled", v28))
      {
        char v29 = 1;
      }
      else if (objc_msgSend(NSString, "fc_string:isEqualToString:", @"default", v28))
      {
        char v29 = [v26 todayFeedEnabled];
      }
      else
      {
        char v29 = 0;
      }
      self;
      s_newTodayFeedEnabled = v29;
    }
    if (objc_opt_respondsToSelector())
    {
      v30 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      v31 = [v30 stringForKey:@"news.feature.tagfeedmodule"];

      if (objc_msgSend(NSString, "fc_string:isEqualToString:", @"enabled", v31))
      {
        char v32 = 1;
      }
      else if (objc_msgSend(NSString, "fc_string:isEqualToString:", @"default", v31))
      {
        char v32 = [v26 tagFeedEnabled];
      }
      else
      {
        char v32 = 0;
      }
      self;
      s_newTagFeedEnabled = v32;
    }
    v33 = [v182 contentContainerCombinationIdentifier];
    v34 = [v22 URLByAppendingPathComponent:v33 isDirectory:1];

    objc_storeStrong((id *)&v24->_configurationManager, obj);
    [v21 addObserver:v24];
    objc_storeStrong((id *)&v24->_pptContext, a15);
    objc_storeWeak((id *)&v24->_backgroundTaskable, v185);
    objc_storeStrong((id *)&v24->_contentHostDirectoryURL, a6);
    v35 = [v34 path];
    uint64_t v36 = [v35 copy];
    contentDirectory = v24->_contentDirectory;
    v24->_contentDirectory = (NSString *)v36;

    v38 = [v34 URLByAppendingPathComponent:@"av-assets" isDirectory:1];
    v39 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v39 createDirectoryAtURL:v38 withIntermediateDirectories:1 attributes:0 error:0];

    v40 = (FCAVAssetKeyServiceType *)-[FCAVAssetKeyService initWithConfigurationManager:]([FCAVAssetKeyService alloc], v21);
    avAssetKeyService = v24->_avAssetKeyService;
    v24->_avAssetKeyService = v40;

    v42 = [FCAVPersistentAssetKeyCache alloc];
    [v38 path];
    v43 = v177 = v26;
    v44 = (FCAVAssetKeyCacheType *)-[FCAVPersistentAssetKeyCache initWithCacheDirectory:](v42, v43);
    avAssetKeyCache = v24->_avAssetKeyCache;
    v24->_avAssetKeyCache = v44;

    v46 = -[FCAVAssetKeyManager initWithService:cache:]((id *)[FCAVAssetKeyManager alloc], v24->_avAssetKeyService, v24->_avAssetKeyCache);
    avAssetKeyManager = v24->_avAssetKeyManager;
    v24->_avAssetKeyManager = (FCAVAssetKeyManagerType *)v46;

    v48 = [FCAVAssetCache alloc];
    v49 = [v38 path];
    v50 = (FCAVAssetCacheType *)-[FCAVAssetCache initWithCacheDirectory:](v48, v49);
    avAssetCache = v24->_avAssetCache;
    v24->_avAssetCache = v50;

    v52 = -[FCAVAssetDownloadManager initWithAssetCache:keyCache:networkReachability:]([FCAVAssetDownloadManager alloc], v24->_avAssetCache, v24->_avAssetKeyCache, v180);
    avAssetDownloadManager = v24->_avAssetDownloadManager;
    v24->_avAssetDownloadManager = (FCAVAssetDownloadManager *)v52;

    v54 = [FCAVAssetResourceLoader alloc];
    v166 = v38;
    v55 = [v38 path];
    uint64_t v56 = [(FCAVAssetResourceLoader *)v54 initWithCacheDirectory:v55 networkReachability:v180];
    avAssetResourceLoader = v24->_avAssetResourceLoader;
    v24->_avAssetResourceLoader = (FCAVAssetResourceLoaderType *)v56;

    v58 = v177;
    objc_storeStrong((id *)&v24->_networkReachability, a8);
    v59 = -[FCAVAssetFactory initWithAssetCache:assetKeyCache:assetKeyManager:assetResourceLoader:]((id *)[FCAVAssetFactory alloc], v24->_avAssetCache, v24->_avAssetKeyCache, v24->_avAssetKeyManager, v24->_avAssetResourceLoader);
    avAssetFactory = v24->_avAssetFactory;
    v24->_avAssetFactory = (FCAVAssetFactoryType *)v59;

    v61 = objc_alloc_init(FCAVAssetPrewarmer);
    avAssetPrewarmer = v24->_avAssetPrewarmer;
    v24->_avAssetPrewarmer = (FCAVAssetPrewarming *)v61;

    v63 = [v34 URLByAppendingPathComponent:@"tabi-resources" isDirectory:1];
    uint64_t v64 = [v63 path];
    tabiResourcesContentDirectory = v24->_tabiResourcesContentDirectory;
    v24->_tabiResourcesContentDirectory = (NSString *)v64;

    v165 = v63;
    uint64_t v66 = [v63 path];
    tabiResourcesContentDirectoryLegacy = v24->_tabiResourcesContentDirectoryLegacy;
    v24->_tabiResourcesContentDirectoryLegacy = (NSString *)v66;

    v68 = [v34 URLByAppendingPathComponent:@"tabi-models" isDirectory:1];
    uint64_t v69 = [v68 path];
    tabiModelsContentDirectory = v24->_tabiModelsContentDirectory;
    v24->_tabiModelsContentDirectory = (NSString *)v69;

    v164 = v68;
    uint64_t v71 = [v68 path];
    tabiModelsContentDirectoryLegacy = v24->_tabiModelsContentDirectoryLegacy;
    v24->_tabiModelsContentDirectoryLegacy = (NSString *)v71;

    os_log_t log = v34;
    v163 = [v34 URLByAppendingPathComponent:@"tabi-requests" isDirectory:1];
    uint64_t v73 = [v163 path];
    tabiRequestsContentDirectory = v24->_tabiRequestsContentDirectory;
    v24->_tabiRequestsContentDirectory = (NSString *)v73;

    v187[0] = MEMORY[0x1E4F143A8];
    v187[1] = 3221225472;
    v187[2] = __278__FCContentContext_initWithConfiguration_configurationManager_contentDatabase_contentHostDirectory_networkBehaviorMonitor_networkReachability_setupCustomURLProtocols_desiredHeadlineFieldOptions_feedUsage_assetKeyManagerDelegate_appActivityMonitor_backgroundTaskable_pptContext___block_invoke;
    v187[3] = &unk_1E5B4C018;
    v75 = v24;
    v188 = v75;
    +[FCTaskScheduler scheduleLowPriorityBlock:v187];
    v76 = (FCAssetKeyServiceType *)-[FCAssetKeyService initWithConfigurationManager:]([FCAssetKeyService alloc], v21);
    assetKeyService = v75->_assetKeyService;
    v75->_assetKeyService = v76;

    v78 = [FCPersistentAssetKeyCache alloc];
    v79 = [v22 path];
    v80 = (FCAssetKeyCacheType *)-[FCPersistentAssetKeyCache initWithCacheDirectory:cacheName:](v78, v79, @"shared-assets-lru");
    assetKeyCache = v75->_assetKeyCache;
    v75->_assetKeyCache = v80;

    v82 = -[FCAssetKeyManager initWithService:cache:delegate:]((id *)[FCAssetKeyManager alloc], v75->_assetKeyService, v75->_assetKeyCache, v179);
    assetKeyManager = v75->_assetKeyManager;
    v75->_assetKeyManager = (FCAssetKeyManagerType *)v82;

    v84 = [FCAssetManager alloc];
    v85 = [v22 path];
    v25 = v186;
    v86 = [(FCAssetManager *)v84 initWithName:@"shared-assets" directory:v85 keyManager:v75->_assetKeyManager avAssetFactory:v24->_avAssetFactory resourceURLGenerator:v186 networkBehaviorMonitor:v181 networkReachability:v180];

    char v87 = [v177 useSecureConnectionForAssets];
    if (v86) {
      v86->_shouldUseSecureConnectionForCKAssetDownloads = v87;
    }
    v162 = v86;
    objc_storeStrong((id *)&v75->_assetManager, v86);
    if (-[FCAssetKeyCacheType conformsToProtocol:](v75->_assetKeyCache, "conformsToProtocol:", &unk_1EF8DD800))[v183 addObserver:v75->_assetKeyCache]; {
    v88 = objc_opt_new();
    }
    [v88 setContentDatabase:v186];
    objc_storeStrong((id *)&v75->_internalContentContext, v88);
    if (a9)
    {
      +[FCExcerptURLProtocol setupWithArticleDatabase:v186];
      +[FCRecordFieldURLProtocol setupWithArticleDatabase:v186];
      v89 = [v184 path];
      +[FCPuzzleThumbnailURLProtocol setupWithArticleDatabase:v186 cacheDirectory:v89];
    }
    v90 = [log path];
    id v172 = [v177 experimentalizableFieldPostfix];
    v91 = [v177 currentTreatment];
    id obja = [v91 stringValue];

    if ([v177 shouldShowAlternateHeadlines]) {
      unint64_t v92 = a10 | 0x10000000;
    }
    else {
      unint64_t v92 = a10;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0 && [v177 articleEmbeddingsEnabled])
    {
      v93 = [v177 newsPersonalizationConfiguration];
      v94 = [v93 articleEmbeddingsConfiguration];

      v95 = [v94 titleEmbeddingConfiguration];
      int v96 = [v95 shouldFetch];

      BOOL v97 = v96 == 0;
      v58 = v177;
      if (v97) {
        uint64_t v98 = v92;
      }
      else {
        uint64_t v98 = v92 | 0x800000000;
      }
      v99 = [v94 bodyEmbeddingConfiguration];
      int v100 = [v99 shouldFetch];

      if (v100) {
        unint64_t v92 = v98 | 0x1000000000;
      }
      else {
        unint64_t v92 = v98;
      }

      v25 = v186;
    }
    if (objc_opt_respondsToSelector())
    {
      v101 = [v58 engagementCohortsExpField];
    }
    else
    {
      v101 = 0;
    }
    if (objc_opt_respondsToSelector())
    {
      uint64_t v102 = [v58 conversionCohortsExpField];
    }
    else
    {
      uint64_t v102 = 0;
    }
    v161 = (void *)v102;
    v103 = [[FCArticleRecordSource alloc] initWithContentDatabase:v25 contentDirectory:v90 appActivityMonitor:v183 backgroundTaskable:v185 desiredArticleRecordFieldOptions:v92 & 0xF | (16 * ((v92 >> 6) & 1)) | (v92 >> 7) & 0x240000 | (v92 >> 5) & 0x1FE0 | (v92 >> 7) & 0x371BE000 | (v92 >> 24) & 0x400 experimentalizableFieldsPostfix:v172 engagementCohortsExpField:v101 conversionCohortsExpField:v102 activeTreatmentID:obja];
    [v88 setArticleRecordSource:v103];

    v104 = [(FCRecordSource *)[FCPurchaseLookupRecordSource alloc] initWithContentDatabase:v25 contentDirectory:v90 appActivityMonitor:v183 backgroundTaskable:v185];
    [v88 setPurchaseLookupRecordSource:v104];

    v169 = [[FCTagRecordSource alloc] initWithContentDatabase:v25 contentDirectory:v90 appActivityMonitor:v183 backgroundTaskable:v185 desiredTagRecordFieldOptions:FCDesiredTagRecordFieldOptionsWithHeadlineFieldOptions(v92)];
    objc_msgSend(v88, "setTagRecordSource:");
    v168 = [(FCRecordSource *)[FCSportsEventRecordSource alloc] initWithContentDatabase:v25 contentDirectory:v90 appActivityMonitor:v183 backgroundTaskable:v185];
    objc_msgSend(v88, "setSportsEventRecordSource:");
    v105 = [(FCRecordSource *)[FCTagListRecordSource alloc] initWithContentDatabase:v25 contentDirectory:v90 appActivityMonitor:v183 backgroundTaskable:v185];
    [v88 setTagListRecordSource:v105];

    v106 = [(FCRecordSource *)[FCResourceRecordSource alloc] initWithContentDatabase:v25 contentDirectory:v90 appActivityMonitor:v183 backgroundTaskable:v185];
    [v88 setResourceRecordSource:v106];

    v107 = [(FCRecordSource *)[FCArticleListRecordSource alloc] initWithContentDatabase:v25 contentDirectory:v90 appActivityMonitor:v183 backgroundTaskable:v185];
    [v88 setArticleListRecordSource:v107];

    v160 = [(FCRecordSource *)[FCChannelMembershipRecordSource alloc] initWithContentDatabase:v25 contentDirectory:v90 appActivityMonitor:v183 backgroundTaskable:v185];
    v108 = [[FCChannelMembershipController alloc] initWithChannelMembershipRecordSource:v160];
    [v88 setChannelMembershipController:v108];

    v109 = [(FCRecordSource *)[FCForYouConfigRecordSource alloc] initWithContentDatabase:v25 contentDirectory:v90 appActivityMonitor:v183 backgroundTaskable:v185];
    [v88 setForYouConfigRecordSource:v109];

    v110 = [(FCRecordSource *)[FCWidgetSectionConfigRecordSource alloc] initWithContentDatabase:v25 contentDirectory:v90 appActivityMonitor:v183 backgroundTaskable:v185];
    [v88 setWidgetSectionConfigRecordSource:v110];

    v111 = [(FCRecordSource *)[FCIssueRecordSource alloc] initWithContentDatabase:v25 contentDirectory:v90 appActivityMonitor:v183 backgroundTaskable:v185];
    [v88 setIssueRecordSource:v111];

    v112 = [(FCRecordSource *)[FCIssueListRecordSource alloc] initWithContentDatabase:v25 contentDirectory:v90 appActivityMonitor:v183 backgroundTaskable:v185];
    [v88 setIssueListRecordSource:v112];

    v113 = [(FCRecordSource *)[FCAudioConfigRecordSource alloc] initWithContentDatabase:v25 contentDirectory:v90 appActivityMonitor:v183 backgroundTaskable:v185];
    [v88 setAudioConfigRecordSource:v113];

    v167 = [(FCRecordSource *)[FCPuzzleRecordSource alloc] initWithContentDatabase:v25 contentDirectory:v90 appActivityMonitor:v183 backgroundTaskable:v185];
    objc_msgSend(v88, "setPuzzleRecordSource:");
    v114 = [(FCRecordSource *)[FCPuzzleTypeRecordSource alloc] initWithContentDatabase:v25 contentDirectory:v90 appActivityMonitor:v183 backgroundTaskable:v185];
    [v88 setPuzzleTypeRecordSource:v114];
    v115 = [(FCRecordSource *)[FCNotificationItemRecordSource alloc] initWithContentDatabase:v25 contentDirectory:v90 appActivityMonitor:v183 backgroundTaskable:v185];
    [v88 setNotificationItemRecordSource:v115];

    v116 = [(FCRecordSource *)[FCNotificationItemListRecordSource alloc] initWithContentDatabase:v25 contentDirectory:v90 appActivityMonitor:v183 backgroundTaskable:v185];
    [v88 setNotificationItemListRecordSource:v116];

    v117 = [(FCContentContext *)v75 assetKeyCache];
    [v88 setAssetKeyCache:v117];

    v118 = [(FCContentContext *)v75 assetKeyManager];
    [v88 setAssetKeyManager:v118];

    v119 = [(FCContentContext *)v75 avAssetFactory];
    [v88 setAvAssetFactory:v119];

    v120 = [(FCContentContext *)v75 avAssetCache];
    [v88 setAvAssetCache:v120];

    v121 = [(FCContentContext *)v75 avAssetKeyCache];
    [v88 setAvAssetKeyCache:v121];

    v122 = [(FCContentContext *)v75 avAssetDownloadManager];
    [v88 setAvAssetDownloadManager:v122];

    if (a11 != 1)
    {
      int v123 = [v177 isOrderFeedEndpointEnabled];
      v124 = NewsCoreUserDefaults();
      v125 = [v124 stringForKey:@"feed_endpoint"];

      if ([v125 isEqualToString:@"multi_feed"]) {
        uint64_t v126 = 0;
      }
      else {
        uint64_t v126 = [v125 isEqualToString:@"order_feed"] | v123;
      }
      v127 = [[FCFeedDatabase alloc] initWithParentDirectoryURL:log usage:a11 endpoint:v126];
      [v88 setFeedDatabase:v127];
      v128 = [[FCFeedPrewarmer alloc] initWithContentContext:v75];
      [v88 setFeedPrewarmer:v128];

      v25 = v186;
    }
    v129 = [[FCTagController alloc] initWithContentDatabase:v25 assetManager:v162 tagRecordSource:v169 configurationManager:v21];
    tagController = v75->_tagController;
    v75->_tagController = v129;

    v131 = [[FCSportsEventController alloc] initWithContentDatabase:v25 context:v75 sportsEventRecordSource:v168 tagController:v75->_tagController];
    sportsEventController = v75->_sportsEventController;
    v75->_sportsEventController = v131;

    v133 = [[FCArticleController alloc] initWithContext:v75];
    articleController = v75->_articleController;
    v75->_articleController = v133;

    v135 = [[FCPuzzleTypeController alloc] initWithContentDatabase:v25 context:v75 assetManager:v162 puzzleTypeRecordSource:v114 configurationManager:v21];
    puzzleTypeController = v75->_puzzleTypeController;
    v75->_puzzleTypeController = v135;

    v137 = [FCPuzzleController alloc];
    v138 = [(FCContentContext *)v75 puzzleTypeController];
    uint64_t v139 = [(FCPuzzleController *)v137 initWithContentDatabase:v25 assetManager:v162 puzzleTypeController:v138 puzzleRecordSource:v167 configurationManager:v21];
    puzzleController = v75->_puzzleController;
    v75->_puzzleController = (FCPuzzleController *)v139;

    v141 = [[FCFlintResourceManager alloc] initWithContext:v75];
    flintResourceManager = v75->_flintResourceManager;
    v75->_flintResourceManager = v141;

    if (v162) {
      directoryURLForCachedAssets = v162->_directoryURLForCachedAssets;
    }
    else {
      directoryURLForCachedAssets = 0;
    }
    objc_storeStrong((id *)&v75->_assetCacheDirectoryURL, directoryURLForCachedAssets);
    v144 = objc_opt_new();
    [v144 setObserver:v75];
    supportedCountryNetworkReachabilityRequirement = v75->_supportedCountryNetworkReachabilityRequirement;
    v75->_supportedCountryNetworkReachabilityRequirement = (FCNetworkReachabilityRequirement *)v144;

    [(FCContentContext *)v75 _updateReachabilityGivenRequirements];
    id v22 = v184;
  }
  v146 = (void *)FCDefaultLog;
  if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_INFO))
  {
    loga = v146;
    v147 = [(FCContentContext *)v24 contentStoreFrontID];
    v178 = +[FCAppleAccount sharedAccount];
    v148 = [v178 currentStoreFrontID];
    v149 = [(FCContentContext *)v24 internalContentContext];
    v150 = [v149 contentDatabase];
    v151 = [v150 containerIdentifier];
    [(FCContentContext *)v24 internalContentContext];
    v153 = id v152 = v21;
    v154 = [v153 contentDatabase];
    int v155 = [v154 isProductionEnvironment];
    v156 = @" not";
    *(_DWORD *)buf = 138544130;
    v191 = v147;
    __int16 v192 = 2114;
    if (v155) {
      v156 = &stru_1EF8299B8;
    }
    v193 = v148;
    __int16 v194 = 2114;
    *(void *)v195 = v151;
    *(_WORD *)&v195[8] = 2114;
    *(void *)&v195[10] = v156;
    _os_log_impl(&dword_1A460D000, loga, OS_LOG_TYPE_INFO, "Initialized content context with contentStoreFrontID: %{public}@, currentStoreFrontID: %{public}@, containerID: %{public}@%{public}@ in production environment.", buf, 0x2Au);

    id v22 = v184;
    id v21 = v152;

    v25 = v186;
  }

  return v24;
}

- (FCAVAssetFactoryType)avAssetFactory
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  avAssetFactory = self->_avAssetFactory;
  if (!avAssetFactory)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "_avAssetFactory");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCContentContext avAssetFactory]";
      __int16 v8 = 2080;
      uint64_t v9 = "FCContentContext.m";
      __int16 v10 = 1024;
      int v11 = 609;
      __int16 v12 = 2114;
      long long v13 = v5;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      avAssetFactory = self->_avAssetFactory;
    }
    else
    {
      avAssetFactory = 0;
    }
  }
  return avAssetFactory;
}

- (FCAVAssetKeyCacheType)avAssetKeyCache
{
  return self->_avAssetKeyCache;
}

- (id)news_core_ConfigurationManager
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  configurationManager = self->_configurationManager;
  if (configurationManager) {
    goto LABEL_14;
  }
  if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    goto LABEL_6;
  }
  v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "_configurationManager");
  *(_DWORD *)buf = 136315906;
  uint64_t v9 = "-[FCContentContext news_core_ConfigurationManager]";
  __int16 v10 = 2080;
  int v11 = "FCContentContext.m";
  __int16 v12 = 1024;
  int v13 = 583;
  __int16 v14 = 2114;
  long long v15 = v7;
  _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  configurationManager = self->_configurationManager;
  if (configurationManager)
  {
LABEL_14:
    if ([(FCCoreConfigurationManager *)configurationManager conformsToProtocol:&unk_1EF8E1E38])v3 = configurationManager; {
    else
    }
      v3 = 0;
  }
  else
  {
LABEL_6:
    v3 = 0;
  }
  v5 = v3;
  return v5;
}

- (NSString)contentStoreFrontID
{
  v2 = +[FCAppleAccount sharedAccount];
  v3 = [v2 contentStoreFrontID];

  return (NSString *)v3;
}

- (FCAVAssetDownloadManager)avAssetDownloadManager
{
  return self->_avAssetDownloadManager;
}

- (FCAssetKeyManagerType)assetKeyManager
{
  return self->_assetKeyManager;
}

- (id)interestTokenForContentManifest:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  context = (void *)MEMORY[0x1A6260FD0]();
  v5 = [(FCContentContext *)self assetManager];
  id v6 = [v4 assetURLs];
  v34 = [v5 interestTokenForAssetURLs:v6];

  v7 = [(FCContentContext *)self assetKeyCache];
  __int16 v8 = [v4 assetWrappingKeyIDs];
  v33 = [v7 interestTokenForWrappingKeyIDs:v8];

  uint64_t v9 = [(FCContentContext *)self avAssetCache];
  __int16 v10 = [v4 avAssetIDs];
  char v32 = [v9 interestTokenForAssetIdentifiers:v10];

  int v11 = [(FCContentContext *)self avAssetKeyCache];
  uint64_t v36 = v4;
  __int16 v12 = [v4 avAssetKeyURIs];
  v31 = [v11 interestTokenForKeyURIs:v12];

  int v13 = [MEMORY[0x1E4F1CA48] array];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  __int16 v14 = [(FCContentContext *)self internalContentContext];
  long long v15 = [v14 recordSources];

  uint64_t v16 = [v15 countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v45 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        id v21 = [v36 recordIDs];
        v43[0] = MEMORY[0x1E4F143A8];
        v43[1] = 3221225472;
        v43[2] = __52__FCContentContext_interestTokenForContentManifest___block_invoke;
        v43[3] = &unk_1E5B4DBB0;
        v43[4] = v20;
        id v22 = objc_msgSend(v21, "fc_arrayOfObjectsPassingTest:", v43);

        v23 = [v20 interestTokenForRecordIDs:v22];
        [v13 addObject:v23];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v44 objects:v48 count:16];
    }
    while (v17);
  }

  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __52__FCContentContext_interestTokenForContentManifest___block_invoke_2;
  v37[3] = &unk_1E5B4DC70;
  id v38 = v34;
  id v39 = v33;
  id v40 = v32;
  id v41 = v31;
  id v42 = v13;
  id v24 = v13;
  id v25 = v31;
  id v26 = v32;
  id v27 = v33;
  id v28 = v34;
  char v29 = +[FCInterestToken interestTokenWithRemoveInterestBlock:v37];

  return v29;
}

- (FCPuzzleTypeController)puzzleTypeController
{
  return self->_puzzleTypeController;
}

- (FCFlintResourceManager)flintResourceManager
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  flintResourceManager = self->_flintResourceManager;
  if (!flintResourceManager)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "_flintResourceManager");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCContentContext flintResourceManager]";
      __int16 v8 = 2080;
      uint64_t v9 = "FCContentContext.m";
      __int16 v10 = 1024;
      int v11 = 627;
      __int16 v12 = 2114;
      int v13 = v5;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      flintResourceManager = self->_flintResourceManager;
    }
    else
    {
      flintResourceManager = 0;
    }
  }
  return flintResourceManager;
}

- (FCTagController)tagController
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  tagController = self->_tagController;
  if (!tagController)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "_tagController");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCContentContext tagController]";
      __int16 v8 = 2080;
      uint64_t v9 = "FCContentContext.m";
      __int16 v10 = 1024;
      int v11 = 621;
      __int16 v12 = 2114;
      int v13 = v5;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      tagController = self->_tagController;
    }
    else
    {
      tagController = 0;
    }
  }
  return tagController;
}

- (NSString)tabiResourcesContentDirectoryLegacy
{
  return self->_tabiResourcesContentDirectoryLegacy;
}

- (NSString)tabiModelsContentDirectoryLegacy
{
  return self->_tabiModelsContentDirectoryLegacy;
}

- (FCSportsEventController)sportsEventController
{
  return self->_sportsEventController;
}

- (FCPuzzleController)puzzleController
{
  return self->_puzzleController;
}

+ (void)initialize
{
  if (FCSetupLogging_onceToken != -1) {
    dispatch_once(&FCSetupLogging_onceToken, &__block_literal_global_57);
  }
}

- (FCArticleController)articleController
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  articleController = self->_articleController;
  if (!articleController)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "_articleController");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCContentContext articleController]";
      __int16 v8 = 2080;
      uint64_t v9 = "FCContentContext.m";
      __int16 v10 = 1024;
      int v11 = 615;
      __int16 v12 = 2114;
      int v13 = v5;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      articleController = self->_articleController;
    }
    else
    {
      articleController = 0;
    }
  }
  return articleController;
}

- (FCContentContext)initWithConfiguration:(id)a3 configurationManager:(id)a4 contentHostDirectory:(id)a5 networkBehaviorMonitor:(id)a6 networkReachability:(id)a7 desiredHeadlineFieldOptions:(unint64_t)a8 feedUsage:(int64_t)a9 assetKeyManagerDelegate:(id)a10 appActivityMonitor:(id)a11 backgroundTaskable:(id)a12 pptContext:(id)a13
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v32 = a10;
  id v31 = a11;
  id v22 = a12;
  id v23 = a13;
  v30 = v19;
  if (!v19 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v28 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "contentHostDirectory != nil");
    *(_DWORD *)buf = 136315906;
    v37 = "-[FCContentContext initWithConfiguration:configurationManager:contentHostDirectory:networkBehaviorMonitor:netw"
          "orkReachability:desiredHeadlineFieldOptions:feedUsage:assetKeyManagerDelegate:appActivityMonitor:backgroundTas"
          "kable:pptContext:]";
    __int16 v38 = 2080;
    id v39 = "FCContentContext.m";
    __int16 v40 = 1024;
    int v41 = 199;
    __int16 v42 = 2114;
    v43 = v28;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v24 = [FCCKContentDatabase alloc];
  id v25 = [v17 contentContainerIdentifier];
  id v26 = -[FCCKContentDatabase initWithContainerIdentifier:productionEnvironment:networkBehaviorMonitor:networkReachability:configurationManager:](v24, "initWithContainerIdentifier:productionEnvironment:networkBehaviorMonitor:networkReachability:configurationManager:", v25, [v17 isProductionContentEnvironment], v20, v21, v18);

  LOBYTE(v29) = 1;
  v35 = [(FCContentContext *)self initWithConfiguration:v17 configurationManager:v18 contentDatabase:v26 contentHostDirectory:v30 networkBehaviorMonitor:v20 networkReachability:v21 setupCustomURLProtocols:v29 desiredHeadlineFieldOptions:a8 feedUsage:a9 assetKeyManagerDelegate:v32 appActivityMonitor:v31 backgroundTaskable:v22 pptContext:v23];

  return v35;
}

- (FCAVAssetPrewarming)avAssetPrewarmer
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  avAssetPrewarmer = self->_avAssetPrewarmer;
  if (!avAssetPrewarmer)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "_avAssetPrewarmer");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCContentContext avAssetPrewarmer]";
      __int16 v8 = 2080;
      uint64_t v9 = "FCContentContext.m";
      __int16 v10 = 1024;
      int v11 = 603;
      __int16 v12 = 2114;
      int v13 = v5;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      avAssetPrewarmer = self->_avAssetPrewarmer;
    }
    else
    {
      avAssetPrewarmer = 0;
    }
  }
  return avAssetPrewarmer;
}

- (void)prewarmStores
{
  v3 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__FCContentContext_prewarmStores__block_invoke;
  block[3] = &unk_1E5B4C018;
  block[4] = self;
  dispatch_async(v3, block);
}

- (id)recordSourceWithSchema:(id)a3
{
  id v4 = a3;
  v5 = [(FCContentContext *)self configurationManager];
  id v6 = [v5 configuration];

  v7 = [FCJSONRecordSource alloc];
  __int16 v8 = [(FCContentContext *)self internalContentContext];
  uint64_t v9 = [v8 contentDatabase];
  __int16 v10 = [(FCContentContext *)self contentDirectory];
  int v11 = [v6 experimentalizableFieldPostfix];
  __int16 v12 = [v6 currentTreatment];
  int v13 = [v12 stringValue];
  uint64_t v14 = [(FCJSONRecordSource *)v7 initWithSchema:v4 contentDatabase:v9 contentDirectory:v10 experimentationSuffix:v11 activeTreatmentID:v13];

  return v14;
}

- (void)configurationManager:(id)a3 configurationDidChange:(id)a4
{
  id v5 = a4;
  char v6 = [v5 useSecureConnectionForAssets];
  v7 = [(FCContentContext *)self assetManager];
  if (v7) {
    v7[8] = v6;
  }

  uint64_t v8 = [v5 useSecureConnectionForAssets];
  id v10 = [(FCContentContext *)self internalContentContext];
  uint64_t v9 = [v10 contentDatabase];
  [v9 setShouldUseSecureConnectionForCKAssetURLs:v8];
}

- (FCContentContext)initWithConfiguration:(id)a3 configurationManager:(id)a4 contentHostDirectory:(id)a5 networkBehaviorMonitor:(id)a6 desiredHeadlineFieldOptions:(unint64_t)a7 feedUsage:(int64_t)a8 appActivityMonitor:(id)a9 backgroundTaskable:(id)a10 pptContext:(id)a11
{
  id v17 = a11;
  id v18 = a10;
  id v19 = a9;
  id v20 = a6;
  id v21 = a5;
  id v22 = a4;
  id v23 = a3;
  id v24 = +[FCNetworkReachability sharedNetworkReachability];
  id v25 = [(FCContentContext *)self initWithConfiguration:v23 configurationManager:v22 contentHostDirectory:v21 networkBehaviorMonitor:v20 networkReachability:v24 desiredHeadlineFieldOptions:a7 feedUsage:a8 assetKeyManagerDelegate:0 appActivityMonitor:v19 backgroundTaskable:v18 pptContext:v17];

  return v25;
}

- (void)dealloc
{
  +[FCExcerptURLProtocol unregister];
  v3.receiver = self;
  v3.super_class = (Class)FCContentContext;
  [(FCContentContext *)&v3 dealloc];
}

- (NSString)supportedContentStoreFrontID
{
  v2 = +[FCAppleAccount sharedAccount];
  objc_super v3 = [v2 supportedContentStoreFrontID];

  return (NSString *)v3;
}

- (NSString)contentEnvironment
{
  v2 = [(FCContentContext *)self contextConfiguration];
  objc_super v3 = [v2 contentEnvironmentDescription];

  return (NSString *)v3;
}

- (id)magazinesConfigurationManager
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  configurationManager = self->_configurationManager;
  if (configurationManager) {
    goto LABEL_14;
  }
  if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    goto LABEL_6;
  }
  v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "_configurationManager");
  *(_DWORD *)buf = 136315906;
  uint64_t v9 = "-[FCContentContext magazinesConfigurationManager]";
  __int16 v10 = 2080;
  int v11 = "FCContentContext.m";
  __int16 v12 = 1024;
  int v13 = 590;
  __int16 v14 = 2114;
  long long v15 = v7;
  _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  configurationManager = self->_configurationManager;
  if (configurationManager)
  {
LABEL_14:
    if ([(FCCoreConfigurationManager *)configurationManager conformsToProtocol:&unk_1EF8F0570])objc_super v3 = configurationManager; {
    else
    }
      objc_super v3 = 0;
  }
  else
  {
LABEL_6:
    objc_super v3 = 0;
  }
  id v5 = v3;
  return v5;
}

- (FCFeedDatabaseProtocol)feedDatabase
{
  v2 = [(FCContentContext *)self internalContentContext];
  objc_super v3 = [v2 feedDatabase];

  return (FCFeedDatabaseProtocol *)v3;
}

- (NSString)contentEnvironmentToken
{
  v2 = [(FCContentContext *)self contextConfiguration];
  objc_super v3 = [v2 contentContainerCombinationIdentifier];

  return (NSString *)v3;
}

- (id)recordTreeSourceWithRecordSources:(id)a3
{
  id v4 = a3;
  id v5 = [[FCJSONRecordTreeSource alloc] initWithContext:self jsonRecordSources:v4];

  return v5;
}

- (id)convertRecords:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(FCHeldRecords);
  char v6 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  v7 = [(FCContentContext *)self internalContentContext];
  uint64_t v8 = [v7 recordSources];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v45 objects:v51 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v46 != v11) {
          objc_enumerationMutation(v8);
        }
        int v13 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        __int16 v14 = [v13 recordType];
        [v6 setObject:v13 forKey:v14];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v45 objects:v51 count:16];
    }
    while (v10);
  }

  long long v15 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v16 = v4;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v41 objects:v50 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v42;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v42 != v19) {
          objc_enumerationMutation(v16);
        }
        id v21 = *(void **)(*((void *)&v41 + 1) + 8 * j);
        id v22 = [v21 recordType];
        id v23 = [v15 objectForKey:v22];

        if (!v23)
        {
          id v23 = [MEMORY[0x1E4F1CA48] array];
          id v24 = [v21 recordType];
          [v15 setObject:v23 forKey:v24];
        }
        [v23 addObject:v21];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v41 objects:v50 count:16];
    }
    while (v18);
  }
  uint64_t v36 = v16;

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v25 = v15;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v37 objects:v49 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v38;
    do
    {
      uint64_t v29 = 0;
      v30 = v5;
      do
      {
        if (*(void *)v38 != v28) {
          objc_enumerationMutation(v25);
        }
        uint64_t v31 = *(void *)(*((void *)&v37 + 1) + 8 * v29);
        id v32 = [v6 objectForKey:v31];
        v33 = [v25 objectForKey:v31];
        v34 = [v32 convertRecords:v33];
        id v5 = +[FCHeldRecords heldRecordsByMerging:v34 with:v30];

        ++v29;
        v30 = v5;
      }
      while (v27 != v29);
      uint64_t v27 = [v25 countByEnumeratingWithState:&v37 objects:v49 count:16];
    }
    while (v27);
  }

  return v5;
}

- (int64_t)storageSize
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(FCContentContext *)self assetManager];
  uint64_t v4 = [v3 storageSize];

  id v5 = [(FCContentContext *)self avAssetCache];
  int64_t v6 = [v5 storageSize] + v4;

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v7 = [(FCContentContext *)self internalContentContext];
  uint64_t v8 = [v7 recordSources];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        v6 += [*(id *)(*((void *)&v14 + 1) + 8 * v12++) storageSize];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  return v6;
}

- (void)save
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  objc_super v3 = FCDefaultLog;
  if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A460D000, v3, OS_LOG_TYPE_DEFAULT, "Will force-save records and assets", buf, 2u);
  }
  uint64_t v4 = [MEMORY[0x1E4F1C9C8] date];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = [(FCContentContext *)self internalContentContext];
  int64_t v6 = [v5 recordSources];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v18 + 1) + 8 * v10);
        uint64_t v12 = (void *)MEMORY[0x1A6260FD0]();
        [v11 save];
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v8);
  }

  int v13 = (void *)MEMORY[0x1A6260FD0]();
  long long v14 = [(FCContentContext *)self assetManager];
  [v14 save];

  long long v15 = (void *)FCDefaultLog;
  if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT))
  {
    long long v16 = v15;
    uint64_t v17 = objc_msgSend(v4, "fc_millisecondTimeIntervalUntilNow");
    *(_DWORD *)buf = 134217984;
    uint64_t v23 = v17;
    _os_log_impl(&dword_1A460D000, v16, OS_LOG_TYPE_DEFAULT, "Did force-save record sources and assets in %llums", buf, 0xCu);
  }
}

- (void)ppt_overrideFeedEndpoint:(int64_t)a3
{
  id v5 = [(FCContentContext *)self internalContentContext];
  id v10 = [v5 feedDatabase];

  if ([v10 endpoint] != a3)
  {
    [v10 teardown];
    int64_t v6 = [FCFeedDatabase alloc];
    uint64_t v7 = [v10 parentDirectoryURL];
    uint64_t v8 = -[FCFeedDatabase initWithParentDirectoryURL:usage:endpoint:](v6, "initWithParentDirectoryURL:usage:endpoint:", v7, [v10 usage], a3);
    uint64_t v9 = [(FCContentContext *)self internalContentContext];
    [v9 setFeedDatabase:v8];
  }
}

- (void)ppt_prewarmFeedDatabase
{
  id v3 = [(FCContentContext *)self internalContentContext];
  v2 = [v3 feedDatabase];
  [v2 prewarm];
}

- (void)configurationManagerScienceExperimentFieldsDidChange:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a3 configuration];
  if (objc_opt_respondsToSelector())
  {
    id v5 = [v4 engagementCohortsExpField];
  }
  else
  {
    id v5 = 0;
  }
  if (objc_opt_respondsToSelector())
  {
    int64_t v6 = [v4 conversionCohortsExpField];
  }
  else
  {
    int64_t v6 = 0;
  }
  uint64_t v7 = NewsCoreUserDefaults();
  int v8 = [v7 BOOLForKey:@"use_cached_exp_fields"];

  uint64_t v9 = FCDefaultLog;
  if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = @"Saving";
    *(_DWORD *)int v13 = 138412802;
    if (v8) {
      id v10 = @"Reading";
    }
    *(void *)&v13[4] = v10;
    __int16 v14 = 2114;
    long long v15 = v5;
    __int16 v16 = 2114;
    uint64_t v17 = v6;
    _os_log_impl(&dword_1A460D000, v9, OS_LOG_TYPE_DEFAULT, "%@ engagementCohortsExpField: %{public}@ conversionCohortsExpField: %{public}@", v13, 0x20u);
  }
  uint64_t v11 = [(FCContentContext *)self internalContentContext];
  uint64_t v12 = [v11 articleRecordSource];
  [v12 updateEngagementCohortsExpField:v5 conversionCohortsExpField:v6];
}

- (void)setAvAssetCache:(id)a3
{
}

- (void)setAvAssetDownloadManager:(id)a3
{
}

- (FCPPTContext)pptContext
{
  return self->_pptContext;
}

- (FCBackgroundTaskable)backgroundTaskable
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_backgroundTaskable);
  return (FCBackgroundTaskable *)WeakRetained;
}

- (FCContextConfiguration)contextConfiguration
{
  return self->_contextConfiguration;
}

- (void)setContextConfiguration:(id)a3
{
}

- (NSURL)contentHostDirectoryURL
{
  return self->_contentHostDirectoryURL;
}

- (void)setContentHostDirectoryURL:(id)a3
{
}

- (void)setContentDirectory:(id)a3
{
}

- (NSURL)assetCacheDirectoryURL
{
  return self->_assetCacheDirectoryURL;
}

- (void)setAssetCacheDirectoryURL:(id)a3
{
}

- (NSString)tabiResourcesContentDirectory
{
  return self->_tabiResourcesContentDirectory;
}

- (void)setTabiResourcesContentDirectory:(id)a3
{
}

- (void)setTabiResourcesContentDirectoryLegacy:(id)a3
{
}

- (NSString)tabiModelsContentDirectory
{
  return self->_tabiModelsContentDirectory;
}

- (void)setTabiModelsContentDirectory:(id)a3
{
}

- (void)setTabiModelsContentDirectoryLegacy:(id)a3
{
}

- (NSString)tabiRequestsContentDirectory
{
  return self->_tabiRequestsContentDirectory;
}

- (void)setTabiRequestsContentDirectory:(id)a3
{
}

- (void)setInternalContentContext:(id)a3
{
}

- (FCAssetKeyServiceType)assetKeyService
{
  return self->_assetKeyService;
}

- (void)setAssetKeyService:(id)a3
{
}

- (void)setAssetKeyCache:(id)a3
{
}

- (void)setAssetKeyManager:(id)a3
{
}

- (void)setAvAssetFactory:(id)a3
{
}

- (FCAVAssetKeyServiceType)avAssetKeyService
{
  return self->_avAssetKeyService;
}

- (void)setAvAssetKeyService:(id)a3
{
}

- (void)setAvAssetKeyCache:(id)a3
{
}

- (void)setAvAssetKeyManager:(id)a3
{
}

- (FCAVAssetResourceLoaderType)avAssetResourceLoader
{
  return self->_avAssetResourceLoader;
}

- (void)setAvAssetResourceLoader:(id)a3
{
}

- (void)setSupportedCountryNetworkReachabilityRequirement:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedCountryNetworkReachabilityRequirement, 0);
  objc_storeStrong((id *)&self->_avAssetResourceLoader, 0);
  objc_storeStrong((id *)&self->_avAssetKeyManager, 0);
  objc_storeStrong((id *)&self->_avAssetKeyCache, 0);
  objc_storeStrong((id *)&self->_avAssetKeyService, 0);
  objc_storeStrong((id *)&self->_avAssetFactory, 0);
  objc_storeStrong((id *)&self->_assetKeyManager, 0);
  objc_storeStrong((id *)&self->_assetKeyCache, 0);
  objc_storeStrong((id *)&self->_assetKeyService, 0);
  objc_storeStrong((id *)&self->_internalContentContext, 0);
  objc_storeStrong((id *)&self->_tabiRequestsContentDirectory, 0);
  objc_storeStrong((id *)&self->_tabiModelsContentDirectoryLegacy, 0);
  objc_storeStrong((id *)&self->_tabiModelsContentDirectory, 0);
  objc_storeStrong((id *)&self->_tabiResourcesContentDirectoryLegacy, 0);
  objc_storeStrong((id *)&self->_tabiResourcesContentDirectory, 0);
  objc_storeStrong((id *)&self->_assetCacheDirectoryURL, 0);
  objc_storeStrong((id *)&self->_contentDirectory, 0);
  objc_storeStrong((id *)&self->_contentHostDirectoryURL, 0);
  objc_storeStrong((id *)&self->_contextConfiguration, 0);
  objc_destroyWeak((id *)&self->_backgroundTaskable);
  objc_storeStrong((id *)&self->_pptContext, 0);
  objc_storeStrong((id *)&self->_puzzleTypeController, 0);
  objc_storeStrong((id *)&self->_puzzleController, 0);
  objc_storeStrong((id *)&self->_sportsEventController, 0);
  objc_storeStrong((id *)&self->_tagController, 0);
  objc_storeStrong((id *)&self->_networkReachability, 0);
  objc_storeStrong((id *)&self->_flintResourceManager, 0);
  objc_storeStrong((id *)&self->_avAssetPrewarmer, 0);
  objc_storeStrong((id *)&self->_avAssetDownloadManager, 0);
  objc_storeStrong((id *)&self->_avAssetCache, 0);
  objc_storeStrong((id *)&self->_assetManager, 0);
  objc_storeStrong((id *)&self->_articleController, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
}

@end