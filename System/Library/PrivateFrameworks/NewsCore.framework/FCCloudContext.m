@interface FCCloudContext
+ (id)testingContext;
+ (id)testingContextWithDesiredHeadlineFieldOptions:(unint64_t)a3;
+ (void)initialize;
- (BOOL)deviceIsiPad;
- (BOOL)isPrivateDataEncryptionEnabled;
- (BOOL)isPrivateDataSyncingEnabled;
- (BOOL)isPrivateDatabaseOnline;
- (BOOL)isPrivateDatabaseStartingUp;
- (BOOL)isPrivateDatabaseTemporarilySuspended;
- (BOOL)shouldAssetKeyManagerSimulateUnauthorizedAssetKeys:(id)a3;
- (FCAVAssetFactoryType)avAssetFactory;
- (FCAVAssetPrewarming)avAssetPrewarmer;
- (FCAccessChecker)articleAccessChecker;
- (FCAccessChecker)issueAccessChecker;
- (FCAppActivityMonitor)appActivityMonitor;
- (FCArticleController)articleController;
- (FCAssetManager)assetManager;
- (FCAudioPlaylist)audioPlaylist;
- (FCBackgroundTaskable)backgroundTaskable;
- (FCBundleSubscriptionManagerType)bundleSubscriptionManager;
- (FCClientEndpointConnection)endpointConnection;
- (FCCloudContext)init;
- (FCCloudContext)initWithConfiguration:(id)a3 configurationManager:(id)a4 contentHostDirectory:(id)a5 privateDataHostDirectory:(id)a6 privateDataActionProvider:(id)a7 networkBehaviorMonitor:(id)a8 appActivityMonitor:(id)a9 desiredHeadlineFieldOptions:(unint64_t)a10 feedUsage:(int64_t)a11 lockStoreFrontIfNeeded:(BOOL)a12 deviceIsiPad:(BOOL)a13 backgroundTaskable:(id)a14 privateDataSyncAvailability:(id)a15 pptContext:(id)a16;
- (FCCloudContext)initWithConfiguration:(id)a3 configurationManager:(id)a4 contentHostDirectory:(id)a5 privateDataHostDirectory:(id)a6 privateDataActionProvider:(id)a7 networkBehaviorMonitor:(id)a8 networkReachability:(id)a9 appActivityMonitor:(id)a10 desiredHeadlineFieldOptions:(unint64_t)a11 feedUsage:(int64_t)a12 deviceIsiPad:(BOOL)a13 backgroundTaskable:(id)a14 privateDataSyncAvailability:(id)a15 pptContext:(id)a16 options:(int64_t)a17;
- (FCCloudContext)initWithContentContext:(id)a3 privateDataContext:(id)a4 networkBehaviorMonitor:(id)a5 networkReachability:(id)a6 options:(int64_t)a7;
- (FCCommandQueue)endpointCommandQueue;
- (FCCommandQueue)newsletterEndpointCommandQueue;
- (FCCommandQueue)notificationsEndpointCommandQueue;
- (FCContentContext)contentContext;
- (FCContentContextInternal)internalContentContext;
- (FCCoreConfigurationManager)configurationManager;
- (FCCurrentIssuesChecker)currentIssuesChecker;
- (FCESLInventory)eslInventory;
- (FCEntitlementService)entitlementService;
- (FCFeedDatabaseProtocol)feedDatabase;
- (FCFeedItemInventoryType)peopleAlsoReadInventory;
- (FCFeedPersonalizing)feedPersonalizer;
- (FCFlintResourceManager)flintResourceManager;
- (FCIssueReadingHistory)issueReadingHistory;
- (FCLocalAreasManager)localAreasManager;
- (FCLocalChannelsProvider)localChannelsProvider;
- (FCLocalRegionManager)localRegionProvider;
- (FCNetworkBehaviorMonitor)networkBehaviorMonitor;
- (FCNetworkReachabilityType)networkReachability;
- (FCNewsAppConfigurationManager)appConfigurationManager;
- (FCNewsletterEndpointConnection)newsletterEndpointConnection;
- (FCNewsletterManager)newsletterManager;
- (FCNotificationController)notificationController;
- (FCNotificationsEndpointConnection)notificationsEndpointConnection;
- (FCOfflineArticleManagerType)offlineArticleManager;
- (FCPPTContext)pptContext;
- (FCPaidAccessCheckerType)paidAccessChecker;
- (FCPeopleAlsoReadInventoryManager)peopleAlsoReadInventoryManager;
- (FCPersonalizationData)personalizationData;
- (FCPrivateChannelMembershipController)privateChannelMembershipController;
- (FCPrivateDataContext)privateDataContext;
- (FCPrivateDataContextInternal)internalPrivateDataContext;
- (FCPurchaseController)purchaseController;
- (FCPurchaseManagerType)purchaseManager;
- (FCPurchaseProviderType)purchaseProvider;
- (FCPushNotificationHandling)privatePushNotificationHandler;
- (FCPuzzleController)puzzleController;
- (FCPuzzleHistory)puzzleHistory;
- (FCPuzzleTypeController)puzzleTypeController;
- (FCPuzzleTypeSettings)puzzleTypeSettings;
- (FCReadingHistory)readingHistory;
- (FCReadingList)readingList;
- (FCShortcutCategoryList)shortcutCategoryList;
- (FCShortcutList)shortcutList;
- (FCSportsEventController)sportsEventController;
- (FCSubscriptionController)subscriptionController;
- (FCSubscriptionList)subscriptionList;
- (FCTagController)tagController;
- (FCTagSettings)tagSettings;
- (FCTranslationManager)translationManager;
- (FCUserEventHistory)userEventHistory;
- (FCUserInfo)userInfo;
- (FCUserVectorManager)userVectorManager;
- (FCWebURLResolutionEndpointConnection)webURLResolutionEndpointConnection;
- (NSString)contentDirectory;
- (NSString)contentEnvironment;
- (NSString)contentEnvironmentToken;
- (NSString)contentStoreFrontID;
- (NSString)privateDataDirectory;
- (NSString)supportedContentStoreFrontID;
- (NSString)tabiModelsContentDirectory;
- (NSString)tabiModelsContentDirectoryLegacy;
- (NSString)tabiRequestsContentDirectory;
- (NSString)tabiResourcesContentDirectory;
- (NSString)tabiResourcesContentDirectoryLegacy;
- (NSURL)assetCacheDirectoryURL;
- (NSURL)contentHostDirectoryURL;
- (id)_createESLInventory;
- (id)_createPeopleAlsoReadInventory;
- (id)convertRecords:(id)a3;
- (id)initForTesting;
- (id)initForTestingWithDesiredHeadlineFieldOptions:(unint64_t)a3;
- (id)insertTestArticle;
- (id)insertTestArticlesWithCount:(unint64_t)a3;
- (id)interestTokenForContentManifest:(id)a3;
- (id)magazinesConfigurationManager;
- (id)news_core_ConfigurationManager;
- (id)notificationsController;
- (id)offlineArticleManagerProvider;
- (id)privateStoreWithName:(id)a3 version:(unint64_t)a4 options:(unint64_t)a5;
- (id)recordSourceWithSchema:(id)a3;
- (id)recordTreeSourceWithRecordSources:(id)a3;
- (int64_t)options;
- (int64_t)preferredContentVariant;
- (int64_t)storageSize;
- (void)_purchaseControllerDidAddALaCarteSubscription;
- (void)bundleSubscriptionDidSubscribe:(id)a3;
- (void)enableFlushingWithFlushingThreshold:(unint64_t)a3;
- (void)enableFlushingWithFlushingThreshold:(unint64_t)a3 exceptForFlusher:(id)a4;
- (void)fetchCleanupToVersionForDatabase:(id)a3 completion:(id)a4;
- (void)fetchDesiredVersionForDatabase:(id)a3 completion:(id)a4;
- (void)ppt_overrideFeedEndpoint:(int64_t)a3;
- (void)ppt_prewarmFeedDatabase;
- (void)prewarmStores;
- (void)save;
- (void)setAggregateStoreProvider:(id)a3;
- (void)setAppActivityMonitor:(id)a3;
- (void)setArticleAccessChecker:(id)a3;
- (void)setBackgroundTaskable:(id)a3;
- (void)setContentContext:(id)a3;
- (void)setCurrentIssuesChecker:(id)a3;
- (void)setEntitlementService:(id)a3;
- (void)setFeedPersonalizer:(id)a3;
- (void)setIssueAccessChecker:(id)a3;
- (void)setLocalAreasManager:(id)a3;
- (void)setLocalChannelsProvider:(id)a3;
- (void)setLocalRegionProvider:(id)a3;
- (void)setOfflineArticleManagerProvider:(id)a3;
- (void)setOptions:(int64_t)a3;
- (void)setPaidAccessChecker:(id)a3;
- (void)setPrivateDataContext:(id)a3;
- (void)setTabiBasedUserVectorAggregateVectorProvider:(id)a3;
- (void)setTranslationManager:(id)a3;
- (void)setUserVectorManager:(id)a3;
@end

@implementation FCCloudContext

- (FCPaidAccessCheckerType)paidAccessChecker
{
  return self->_paidAccessChecker;
}

- (FCLocalRegionManager)localRegionProvider
{
  return self->_localRegionProvider;
}

- (id)_createESLInventory
{
  v3 = [(FCCloudContext *)self contentContext];
  v4 = [v3 contentDirectory];
  v5 = [v4 stringByAppendingPathComponent:@"issue-article-inventory"];

  v6 = [(FCCloudContext *)self contentContext];
  v7 = [v6 contentDirectory];
  v8 = [v7 stringByAppendingPathComponent:@"tag-esl-inventory"];

  v9 = NewsCoreUserDefaults();
  int v10 = [v9 BOOLForKey:@"news.esl_inventory.clear_global_next_launch"];

  if (v10)
  {
    v11 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v11 removeItemAtPath:v5 error:0];

    v12 = NewsCoreUserDefaults();
    [v12 setBool:0 forKey:@"news.esl_inventory.clear_global_next_launch"];
  }
  v13 = NewsCoreUserDefaults();
  int v14 = [v13 BOOLForKey:@"news.esl_inventory.force_enable_all_tags"];

  if (v14)
  {
    v15 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v15 removeItemAtPath:v8 error:0];

    v16 = NewsCoreUserDefaults();
    [v16 setBool:0 forKey:@"news.esl_inventory.force_enable_all_tags"];
  }
  v17 = [[FCGlobalESLService alloc] initWithContext:self];
  v18 = [FCFeedItemInventory alloc];
  v19 = [(FCCloudContext *)self readingHistory];
  v20 = [(FCFeedItemInventory *)v18 initWithContext:self feedItemService:v17 readingHistory:v19 filePath:v5 version:1 refreshInterval:@"Global" loggingKey:86400.0];

  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __37__FCCloudContext__createESLInventory__block_invoke;
  v27[3] = &unk_1E5B518A0;
  v27[4] = self;
  v21 = __37__FCCloudContext__createESLInventory__block_invoke((uint64_t)v27);
  v22 = [FCFeedItemInventory alloc];
  v23 = [(FCCloudContext *)self readingHistory];
  v24 = [(FCFeedItemInventory *)v22 initWithContext:self feedItemService:v21 readingHistory:v23 filePath:v8 version:1 refreshInterval:@"Per-Tag" loggingKey:86400.0];

  v25 = [[FCESLInventory alloc] initWithGlobalInventory:v20 tagInventory:v24];
  return v25;
}

- (NSString)contentDirectory
{
  v2 = [(FCCloudContext *)self contentContext];
  v3 = [v2 contentDirectory];

  return (NSString *)v3;
}

- (FCContentContextInternal)internalContentContext
{
  v2 = [(FCCloudContext *)self contentContext];
  v3 = [v2 internalContentContext];

  return (FCContentContextInternal *)v3;
}

- (FCAssetManager)assetManager
{
  v2 = [(FCCloudContext *)self contentContext];
  v3 = [v2 assetManager];

  return (FCAssetManager *)v3;
}

- (FCAppActivityMonitor)appActivityMonitor
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  appActivityMonitor = self->_appActivityMonitor;
  if (!appActivityMonitor)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "_appActivityMonitor");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCCloudContext appActivityMonitor]";
      __int16 v8 = 2080;
      v9 = "FCCloudContext.m";
      __int16 v10 = 1024;
      int v11 = 497;
      __int16 v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      appActivityMonitor = self->_appActivityMonitor;
    }
    else
    {
      appActivityMonitor = 0;
    }
  }
  return appActivityMonitor;
}

- (FCBackgroundTaskable)backgroundTaskable
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_backgroundTaskable);
  return (FCBackgroundTaskable *)WeakRetained;
}

- (FCCoreConfigurationManager)configurationManager
{
  v2 = [(FCCloudContext *)self contentContext];
  v3 = [v2 configurationManager];

  return (FCCoreConfigurationManager *)v3;
}

- (FCNetworkReachabilityType)networkReachability
{
  v2 = [(FCCloudContext *)self contentContext];
  v3 = [v2 networkReachability];

  return (FCNetworkReachabilityType *)v3;
}

- (FCNewsAppConfigurationManager)appConfigurationManager
{
  v2 = [(FCCloudContext *)self contentContext];
  v3 = [v2 appConfigurationManager];

  return (FCNewsAppConfigurationManager *)v3;
}

- (FCContentContext)contentContext
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  contentContext = self->_contentContext;
  if (!contentContext)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "_contentContext");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCCloudContext contentContext]";
      __int16 v8 = 2080;
      v9 = "FCCloudContext.m";
      __int16 v10 = 1024;
      int v11 = 503;
      __int16 v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      contentContext = self->_contentContext;
    }
    else
    {
      contentContext = 0;
    }
  }
  return contentContext;
}

id __37__FCCloudContext__createESLInventory__block_invoke(uint64_t a1)
{
  v2 = NewsCoreUserDefaults();
  int v3 = [v2 BOOLForKey:@"news.esl_inventory.simulate_with_top_k"];

  v4 = off_1E5B4B3B8;
  if (!v3) {
    v4 = off_1E5B4B2B8;
  }
  v5 = (void *)[objc_alloc(*v4) initWithContext:*(void *)(a1 + 32)];
  return v5;
}

- (FCESLInventory)eslInventory
{
  return self->_eslInventory;
}

- (FCNotificationController)notificationController
{
  return self->_notificationController;
}

- (FCLocalAreasManager)localAreasManager
{
  return self->_localAreasManager;
}

- (FCPurchaseController)purchaseController
{
  return self->_purchaseController;
}

- (FCTranslationManager)translationManager
{
  return self->_translationManager;
}

- (FCPurchaseManagerType)purchaseManager
{
  return self->_purchaseManager;
}

- (FCPPTContext)pptContext
{
  return self->_pptContext;
}

- (FCEntitlementService)entitlementService
{
  return self->_entitlementService;
}

- (BOOL)deviceIsiPad
{
  return self->_deviceIsiPad;
}

- (void)enableFlushingWithFlushingThreshold:(unint64_t)a3
{
  id v4 = [(FCCloudContext *)self contentContext];
  [v4 enableFlushingWithFlushingThreshold:a3];
}

- (FCCloudContext)initWithConfiguration:(id)a3 configurationManager:(id)a4 contentHostDirectory:(id)a5 privateDataHostDirectory:(id)a6 privateDataActionProvider:(id)a7 networkBehaviorMonitor:(id)a8 appActivityMonitor:(id)a9 desiredHeadlineFieldOptions:(unint64_t)a10 feedUsage:(int64_t)a11 lockStoreFrontIfNeeded:(BOOL)a12 deviceIsiPad:(BOOL)a13 backgroundTaskable:(id)a14 privateDataSyncAvailability:(id)a15 pptContext:(id)a16
{
  uint64_t v20 = 8;
  if (!a12) {
    uint64_t v20 = 0;
  }
  uint64_t v34 = v20;
  id v33 = a16;
  id v32 = a15;
  id v21 = a14;
  id v22 = a9;
  id v31 = a8;
  id v23 = a7;
  id v24 = a6;
  id v30 = a5;
  id v25 = a4;
  id v26 = a3;
  v27 = +[FCNetworkReachability sharedNetworkReachability];
  LOBYTE(v29) = a13;
  v38 = [(FCCloudContext *)self initWithConfiguration:v26 configurationManager:v25 contentHostDirectory:v30 privateDataHostDirectory:v24 privateDataActionProvider:v23 networkBehaviorMonitor:v31 networkReachability:v27 appActivityMonitor:v22 desiredHeadlineFieldOptions:a10 feedUsage:a11 deviceIsiPad:v29 backgroundTaskable:v21 privateDataSyncAvailability:v32 pptContext:v33 options:v34];

  return v38;
}

- (FCShortcutList)shortcutList
{
  v2 = [(FCCloudContext *)self privateDataContext];
  int v3 = [v2 shortcutList];

  return (FCShortcutList *)v3;
}

- (FCNewsletterManager)newsletterManager
{
  return self->_newsletterManager;
}

- (id)news_core_ConfigurationManager
{
  v2 = [(FCCloudContext *)self contentContext];
  int v3 = objc_msgSend(v2, "news_core_ConfigurationManager");

  return v3;
}

- (void)setLocalChannelsProvider:(id)a3
{
  objc_storeStrong((id *)&self->_localChannelsProvider, a3);
  id v5 = a3;
  id v6 = [(FCCloudContext *)self subscriptionController];
  [v6 setLocalChannelsProvider:v5];
}

- (FCSubscriptionController)subscriptionController
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  subscriptionController = self->_subscriptionController;
  if (!subscriptionController)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "_subscriptionController");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCCloudContext subscriptionController]";
      __int16 v8 = 2080;
      v9 = "FCCloudContext.m";
      __int16 v10 = 1024;
      int v11 = 479;
      __int16 v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      subscriptionController = self->_subscriptionController;
    }
    else
    {
      subscriptionController = 0;
    }
  }
  return subscriptionController;
}

- (FCPersonalizationData)personalizationData
{
  v2 = [(FCCloudContext *)self privateDataContext];
  int v3 = [v2 personalizationData];

  return (FCPersonalizationData *)v3;
}

+ (void)initialize
{
  v6[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_opt_class();
  if (v2 == objc_opt_class())
  {
    int v3 = NewsCoreUserDefaults();
    v5[0] = @"content_environment";
    v5[1] = @"news.modules.today_feed.debug_feed_config.url";
    v6[0] = @"production";
    v6[1] = @"http://127.0.0.1:8080/configs/today-config.jinja.yaml";
    id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:2];
    [v3 registerDefaults:v4];
  }
}

- (FCReadingList)readingList
{
  uint64_t v2 = [(FCCloudContext *)self privateDataContext];
  int v3 = [v2 readingList];

  return (FCReadingList *)v3;
}

- (FCCloudContext)initWithContentContext:(id)a3 privateDataContext:(id)a4 networkBehaviorMonitor:(id)a5 networkReachability:(id)a6 options:(int64_t)a7
{
  uint64_t v159 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  if (!v13 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v139 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "contentContext");
    *(_DWORD *)buf = 136315906;
    v152 = "-[FCCloudContext initWithContentContext:privateDataContext:networkBehaviorMonitor:networkReachability:options:]";
    __int16 v153 = 2080;
    v154 = "FCCloudContext.m";
    __int16 v155 = 1024;
    int v156 = 313;
    __int16 v157 = 2114;
    v158 = v139;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v14) {
      goto LABEL_6;
    }
  }
  else if (v14)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v140 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "privateDataContext");
    *(_DWORD *)buf = 136315906;
    v152 = "-[FCCloudContext initWithContentContext:privateDataContext:networkBehaviorMonitor:networkReachability:options:]";
    __int16 v153 = 2080;
    v154 = "FCCloudContext.m";
    __int16 v155 = 1024;
    int v156 = 314;
    __int16 v157 = 2114;
    v158 = v140;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  v150.receiver = self;
  v150.super_class = (Class)FCCloudContext;
  v17 = [(FCCloudContext *)&v150 init];
  v18 = v17;
  if (v17)
  {
    id obj = a5;
    id v147 = v15;
    objc_storeStrong((id *)&v17->_contentContext, a3);
    objc_storeStrong((id *)&v18->_privateDataContext, a4);
    [v14 preparePrivateDataControllersForUse];
    uint64_t v19 = [v13 configurationManager];
    v145 = [[FCClientEndpointConnection alloc] initWithConfigurationManager:v19];
    objc_storeStrong((id *)&v18->_endpointConnection, v145);
    uint64_t v20 = (void *)MEMORY[0x1E4F1CB10];
    id v21 = [v13 contentDirectory];
    uint64_t v22 = [v20 fileURLWithPath:v21];

    v144 = (void *)v22;
    id v146 = v16;
    id v23 = [[FCWebURLResolutionEndpointConnection alloc] initWithConfigurationManager:v19 cachesDirectoryURL:v22 networkReachability:v16];
    webURLResolutionEndpointConnection = v18->_webURLResolutionEndpointConnection;
    v18->_webURLResolutionEndpointConnection = v23;

    id v25 = [v14 internalPrivateDataContext];
    id v26 = [v25 appActivityMonitor];

    v148 = v26;
    objc_storeStrong((id *)&v18->_appActivityMonitor, v26);
    v18->_options = a7;
    v27 = [FCCommandQueue alloc];
    v28 = [v14 privateDataDirectory];
    uint64_t v29 = [(FCCommandQueue *)v27 initWithContext:v18 storeDirectory:v28 storeFilename:@"endPoint_v1.commandqueue" urgency:2 suspended:0 delegate:0];
    endpointCommandQueue = v18->_endpointCommandQueue;
    v18->_endpointCommandQueue = (FCCommandQueue *)v29;

    id v31 = [FCCommandQueue alloc];
    id v32 = [v14 privateDataDirectory];
    uint64_t v33 = [(FCCommandQueue *)v31 initWithContext:v18 storeDirectory:v32 storeFilename:@"notificationsEndpoint_v1.commandqueue" urgency:1 suspended:0 delegate:0];
    notificationsEndpointCommandQueue = v18->_notificationsEndpointCommandQueue;
    v18->_notificationsEndpointCommandQueue = (FCCommandQueue *)v33;

    v35 = [FCCommandQueue alloc];
    v36 = [v14 privateDataDirectory];
    uint64_t v37 = [(FCCommandQueue *)v35 initWithContext:v18 storeDirectory:v36 storeFilename:@"newsletterEndpoint_v1.commandqueue" urgency:2 suspended:0 delegate:0];
    newsletterEndpointCommandQueue = v18->_newsletterEndpointCommandQueue;
    v18->_newsletterEndpointCommandQueue = (FCCommandQueue *)v37;

    v39 = [FCEntitlementService alloc];
    v40 = [v13 configurationManager];
    uint64_t v41 = [(FCEntitlementService *)v39 initWithConfigurationManager:v40];
    entitlementService = v18->_entitlementService;
    v18->_entitlementService = (FCEntitlementService *)v41;

    v43 = [[FCPurchaseController alloc] initWithCloudContext:v18 entitlementService:v18->_entitlementService];
    purchaseController = v18->_purchaseController;
    v18->_purchaseController = v43;

    v45 = [FCPurchaseProvider alloc];
    v46 = v18->_purchaseController;
    v47 = [v14 privateChannelMembershipController];
    v48 = -[FCPurchaseProvider initWithPurchaseController:privateChannelMembershipController:]((id *)&v45->super.isa, v46, v47);
    purchaseProvider = v18->_purchaseProvider;
    v18->_purchaseProvider = (FCPurchaseProviderType *)v48;

    v50 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v50 addObserver:v18 selector:sel__purchaseControllerDidAddALaCarteSubscription name:FCPurchaseAddedNotificationName object:0];

    v51 = [MEMORY[0x1E4F28B50] mainBundle];
    v52 = [v51 bundleIdentifier];
    if ([v52 isEqualToString:@"com.apple.news"])
    {
    }
    else
    {
      v53 = [MEMORY[0x1E4F28B50] mainBundle];
      [v53 bundleIdentifier];
      v55 = v54 = v14;
      int v56 = [v55 isEqualToString:@"com.apple.stocks"];

      id v14 = v54;
      if (!v56)
      {
        v65 = objc_alloc_init(FCNoOpBundleSubscriptionManager);
        bundleSubscriptionManager = (FCBundleEntitlementsProvider *)v18->_bundleSubscriptionManager;
        v18->_bundleSubscriptionManager = (FCBundleSubscriptionManagerType *)v65;
        goto LABEL_12;
      }
    }
    v57 = [FCBundleEntitlementsProvider alloc];
    v58 = [v13 configurationManager];
    bundleSubscriptionManager = [(FCBundleEntitlementsProvider *)v57 initWithConfigurationManager:v58 entitlementService:v18->_entitlementService];

    v60 = [FCBundleSubscriptionManager alloc];
    v61 = [v14 privateDataDirectory];
    [v13 configurationManager];
    v62 = v54 = v14;
    uint64_t v63 = [(FCBundleSubscriptionManager *)v60 initWithPrivateDataDirectory:v61 configurationManager:v62 cloudContext:v18 contentContext:v13 appActivityMonitor:v148 entitlementsProvider:bundleSubscriptionManager];
    v64 = v18->_bundleSubscriptionManager;
    v18->_bundleSubscriptionManager = (FCBundleSubscriptionManagerType *)v63;

LABEL_12:
    v141 = v54;

    [(FCBundleSubscriptionManagerType *)v18->_bundleSubscriptionManager addObserver:v18];
    v66 = [FCPurchaseManager alloc];
    v67 = objc_alloc_init(FCPurchaseIntegrityChecker);
    v68 = objc_alloc_init(FCPurchaseReceiptProvider);
    v69 = objc_alloc_init(FCPaymentTransactionManager);
    uint64_t v70 = [(FCPurchaseManager *)v66 initWithCloudContext:v18 purchaseIntegrityChecker:v67 purchaseReceiptProvider:v68 paymentTransactionManager:v69 bundleSubscriptionManager:v18->_bundleSubscriptionManager keyValueStoreOption:0];
    purchaseManager = v18->_purchaseManager;
    v18->_purchaseManager = (FCPurchaseManagerType *)v70;

    v72 = [FCNotificationController alloc];
    v73 = [v54 userInfo];
    v74 = v18->_notificationsEndpointCommandQueue;
    v75 = [v13 configurationManager];
    uint64_t v76 = [(FCNotificationController *)v72 initWithUserInfo:v73 commandQueue:v74 configurationManager:v75 publisherNotificationsAllowed:((unint64_t)a7 >> 1) & 1 appleNewsNotificationsAllowed:((unint64_t)a7 >> 2) & 1];
    notificationController = v18->_notificationController;
    v18->_notificationController = (FCNotificationController *)v76;

    v78 = [[FCNotificationsEndpointConnection alloc] initWithConfigurationManager:v19 bundleSubscriptionManager:v18->_bundleSubscriptionManager];
    notificationsEndpointConnection = v18->_notificationsEndpointConnection;
    v18->_notificationsEndpointConnection = v78;

    v80 = [[FCNewsletterEndpointConnection alloc] initWithConfigurationManager:v19];
    newsletterEndpointConnection = v18->_newsletterEndpointConnection;
    v18->_newsletterEndpointConnection = v80;

    v82 = [FCNewsletterManager alloc];
    v83 = v18->_newsletterEndpointConnection;
    v84 = v18->_newsletterEndpointCommandQueue;
    v85 = +[FCAppleAccount sharedAccount];
    v86 = [(FCCloudContext *)v18 appConfigurationManager];
    v87 = [(FCCloudContext *)v18 userInfo];
    [(FCCloudContext *)v18 bundleSubscriptionManager];
    v88 = v142 = (void *)v19;
    [(FCCloudContext *)v18 privateDataContext];
    v89 = v149 = v13;
    uint64_t v90 = [(FCNewsletterManager *)v82 initWithEndpointConnection:v83 endpointCommandQueue:v84 appleAccount:v85 appConfig:v86 userInfo:v87 bundleSubscriptionManager:v88 privateDataContext:v89];
    newsletterManager = v18->_newsletterManager;
    v18->_newsletterManager = (FCNewsletterManager *)v90;

    v92 = [FCSubscriptionController alloc];
    v93 = [v54 subscriptionList];
    v94 = [v149 tagController];
    v95 = [v149 puzzleTypeController];
    v96 = v18->_notificationController;
    v97 = v18->_purchaseProvider;
    v98 = [v149 configurationManager];
    v99 = [v149 appConfigurationManager];
    v100 = [(FCCloudContext *)v18 userInfo];
    uint64_t v101 = [(FCSubscriptionController *)v92 initWithSubscriptionList:v93 tagController:v94 puzzleTypeController:v95 notificationController:v96 purchaseProvider:v97 configurationManager:v98 appConfigurationManager:v99 appActivityMonitor:v148 userInfo:v100];
    subscriptionController = v18->_subscriptionController;
    v18->_subscriptionController = (FCSubscriptionController *)v101;

    objc_storeStrong((id *)&v18->_networkBehaviorMonitor, obj);
    v103 = [[FCTranslationManager alloc] initWithContentContext:v149];
    translationManager = v18->_translationManager;
    v18->_translationManager = v103;

    v105 = [[FCLocalAreasManager alloc] initWithContentContext:v149];
    localAreasManager = v18->_localAreasManager;
    v18->_localAreasManager = v105;

    v107 = [[FCUserVectorManager alloc] initWithContext:v18];
    userVectorManager = v18->_userVectorManager;
    v18->_userVectorManager = v107;

    v109 = [FCCurrentIssuesChecker alloc];
    v110 = v18->_subscriptionController;
    id v14 = v141;
    v111 = [v141 issueReadingHistory];
    uint64_t v112 = [(FCCurrentIssuesChecker *)v109 initWithContext:v149 subscriptionController:v110 issueReadingHistory:v111 bundleSubscriptionProvider:v18->_bundleSubscriptionManager];
    currentIssuesChecker = v18->_currentIssuesChecker;
    v18->_currentIssuesChecker = (FCCurrentIssuesChecker *)v112;

    uint64_t v114 = [(FCCloudContext *)v18 _createESLInventory];
    eslInventory = v18->_eslInventory;
    v18->_eslInventory = (FCESLInventory *)v114;

    v116 = [(FCCloudContext *)v18 _createPeopleAlsoReadInventory];
    peopleAlsoReadInventory = v18->_peopleAlsoReadInventory;
    v18->_peopleAlsoReadInventory = v116;
    v118 = v116;

    v119 = [FCPeopleAlsoReadInventoryManager alloc];
    v120 = [v141 readingHistory];
    uint64_t v121 = [(FCPeopleAlsoReadInventoryManager *)v119 initWithInventory:v118 readingHistory:v120];
    peopleAlsoReadInventoryManager = v18->_peopleAlsoReadInventoryManager;
    v18->_peopleAlsoReadInventoryManager = (FCPeopleAlsoReadInventoryManager *)v121;

    v123 = [FCPaidAccessChecker alloc];
    v124 = [(FCCloudContext *)v18 purchaseProvider];
    v125 = [(FCCloudContext *)v18 bundleSubscriptionManager];
    v126 = [(FCCloudContext *)v18 configurationManager];
    v127 = [(FCPaidAccessChecker *)v123 initWithPurchaseProvider:v124 bundleSubscriptionProvider:v125 configurationManager:v126];

    paidAccessChecker = v18->_paidAccessChecker;
    v18->_paidAccessChecker = (FCPaidAccessCheckerType *)v127;
    v129 = v127;

    v130 = [FCIssueAccessChecker alloc];
    v131 = [v141 privateChannelMembershipController];
    uint64_t v132 = [(FCIssueAccessChecker *)v130 initWithPaidAccessChecker:v129 privateChannelMembershipController:v131];
    issueAccessChecker = v18->_issueAccessChecker;
    v18->_issueAccessChecker = (FCAccessChecker *)v132;

    v134 = [FCArticleAccessChecker alloc];
    v135 = [v141 privateChannelMembershipController];
    uint64_t v136 = [(FCArticleAccessChecker *)v134 initWithPaidAccessChecker:v129 privateChannelMembershipController:v135];
    articleAccessChecker = v18->_articleAccessChecker;
    v18->_articleAccessChecker = (FCAccessChecker *)v136;

    id v13 = v149;
    id v16 = v146;
    id v15 = v147;
  }

  return v18;
}

- (FCBundleSubscriptionManagerType)bundleSubscriptionManager
{
  return self->_bundleSubscriptionManager;
}

- (NSString)privateDataDirectory
{
  uint64_t v2 = [(FCCloudContext *)self privateDataContext];
  int v3 = [v2 privateDataDirectory];

  return (NSString *)v3;
}

- (FCReadingHistory)readingHistory
{
  uint64_t v2 = [(FCCloudContext *)self privateDataContext];
  int v3 = [v2 readingHistory];

  return (FCReadingHistory *)v3;
}

- (FCUserInfo)userInfo
{
  uint64_t v2 = [(FCCloudContext *)self privateDataContext];
  int v3 = [v2 userInfo];

  return (FCUserInfo *)v3;
}

- (FCPrivateDataContext)privateDataContext
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  privateDataContext = self->_privateDataContext;
  if (!privateDataContext)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "_privateDataContext");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCCloudContext privateDataContext]";
      __int16 v8 = 2080;
      v9 = "FCCloudContext.m";
      __int16 v10 = 1024;
      int v11 = 514;
      __int16 v12 = 2114;
      id v13 = v5;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      privateDataContext = self->_privateDataContext;
    }
    else
    {
      privateDataContext = 0;
    }
  }
  return privateDataContext;
}

- (FCIssueReadingHistory)issueReadingHistory
{
  uint64_t v2 = [(FCCloudContext *)self privateDataContext];
  int v3 = [v2 issueReadingHistory];

  return (FCIssueReadingHistory *)v3;
}

- (FCSubscriptionList)subscriptionList
{
  uint64_t v2 = [(FCCloudContext *)self privateDataContext];
  int v3 = [v2 subscriptionList];

  return (FCSubscriptionList *)v3;
}

- (FCPurchaseProviderType)purchaseProvider
{
  return self->_purchaseProvider;
}

- (void)setTabiBasedUserVectorAggregateVectorProvider:(id)a3
{
}

- (void)setOfflineArticleManagerProvider:(id)a3
{
}

- (void)setAggregateStoreProvider:(id)a3
{
}

- (FCCurrentIssuesChecker)currentIssuesChecker
{
  return self->_currentIssuesChecker;
}

- (FCFlintResourceManager)flintResourceManager
{
  uint64_t v2 = [(FCCloudContext *)self contentContext];
  int v3 = [v2 flintResourceManager];

  return (FCFlintResourceManager *)v3;
}

- (FCUserEventHistory)userEventHistory
{
  uint64_t v2 = [(FCCloudContext *)self privateDataContext];
  int v3 = [v2 userEventHistory];

  return (FCUserEventHistory *)v3;
}

- (FCTagController)tagController
{
  uint64_t v2 = [(FCCloudContext *)self contentContext];
  int v3 = [v2 tagController];

  return (FCTagController *)v3;
}

- (void)setLocalRegionProvider:(id)a3
{
}

- (void)setFeedPersonalizer:(id)a3
{
}

- (FCAudioPlaylist)audioPlaylist
{
  uint64_t v2 = [(FCCloudContext *)self privateDataContext];
  int v3 = [v2 audioPlaylist];

  return (FCAudioPlaylist *)v3;
}

- (NSString)tabiResourcesContentDirectoryLegacy
{
  uint64_t v2 = [(FCCloudContext *)self contentContext];
  int v3 = [v2 tabiResourcesContentDirectoryLegacy];

  return (NSString *)v3;
}

- (NSString)tabiModelsContentDirectoryLegacy
{
  uint64_t v2 = [(FCCloudContext *)self contentContext];
  int v3 = [v2 tabiModelsContentDirectoryLegacy];

  return (NSString *)v3;
}

- (FCSportsEventController)sportsEventController
{
  uint64_t v2 = [(FCCloudContext *)self contentContext];
  int v3 = [v2 sportsEventController];

  return (FCSportsEventController *)v3;
}

- (FCPuzzleController)puzzleController
{
  uint64_t v2 = [(FCCloudContext *)self contentContext];
  int v3 = [v2 puzzleController];

  return (FCPuzzleController *)v3;
}

- (FCNetworkBehaviorMonitor)networkBehaviorMonitor
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  networkBehaviorMonitor = self->_networkBehaviorMonitor;
  if (!networkBehaviorMonitor)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "_networkBehaviorMonitor");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCCloudContext networkBehaviorMonitor]";
      __int16 v8 = 2080;
      v9 = "FCCloudContext.m";
      __int16 v10 = 1024;
      int v11 = 491;
      __int16 v12 = 2114;
      id v13 = v5;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      networkBehaviorMonitor = self->_networkBehaviorMonitor;
    }
    else
    {
      networkBehaviorMonitor = 0;
    }
  }
  return networkBehaviorMonitor;
}

- (FCPuzzleHistory)puzzleHistory
{
  uint64_t v2 = [(FCCloudContext *)self privateDataContext];
  int v3 = [v2 puzzleHistory];

  return (FCPuzzleHistory *)v3;
}

- (FCArticleController)articleController
{
  uint64_t v2 = [(FCCloudContext *)self contentContext];
  int v3 = [v2 articleController];

  return (FCArticleController *)v3;
}

- (FCCloudContext)initWithConfiguration:(id)a3 configurationManager:(id)a4 contentHostDirectory:(id)a5 privateDataHostDirectory:(id)a6 privateDataActionProvider:(id)a7 networkBehaviorMonitor:(id)a8 networkReachability:(id)a9 appActivityMonitor:(id)a10 desiredHeadlineFieldOptions:(unint64_t)a11 feedUsage:(int64_t)a12 deviceIsiPad:(BOOL)a13 backgroundTaskable:(id)a14 privateDataSyncAvailability:(id)a15 pptContext:(id)a16 options:(int64_t)a17
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v40 = a3;
  id v39 = a4;
  id v22 = a5;
  id v23 = a6;
  id v38 = a7;
  id v24 = a8;
  id v25 = a9;
  id v26 = a10;
  id v43 = a14;
  id v42 = a15;
  id v41 = a16;
  v44 = v22;
  if (!v22 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v33 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "contentHostDirectory != nil");
    *(_DWORD *)buf = 136315906;
    v46 = "-[FCCloudContext initWithConfiguration:configurationManager:contentHostDirectory:privateDataHostDirectory:priv"
          "ateDataActionProvider:networkBehaviorMonitor:networkReachability:appActivityMonitor:desiredHeadlineFieldOption"
          "s:feedUsage:deviceIsiPad:backgroundTaskable:privateDataSyncAvailability:pptContext:options:]";
    __int16 v47 = 2080;
    v48 = "FCCloudContext.m";
    __int16 v49 = 1024;
    int v50 = 197;
    __int16 v51 = 2114;
    v52 = v33;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  if (!v23 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v34 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "privateDataHostDirectory != nil");
    *(_DWORD *)buf = 136315906;
    v46 = "-[FCCloudContext initWithConfiguration:configurationManager:contentHostDirectory:privateDataHostDirectory:priv"
          "ateDataActionProvider:networkBehaviorMonitor:networkReachability:appActivityMonitor:desiredHeadlineFieldOption"
          "s:feedUsage:deviceIsiPad:backgroundTaskable:privateDataSyncAvailability:pptContext:options:]";
    __int16 v47 = 2080;
    v48 = "FCCloudContext.m";
    __int16 v49 = 1024;
    int v50 = 198;
    __int16 v51 = 2114;
    v52 = v34;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  if (!v26 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v35 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "appActivityMonitor != nil");
    *(_DWORD *)buf = 136315906;
    v46 = "-[FCCloudContext initWithConfiguration:configurationManager:contentHostDirectory:privateDataHostDirectory:priv"
          "ateDataActionProvider:networkBehaviorMonitor:networkReachability:appActivityMonitor:desiredHeadlineFieldOption"
          "s:feedUsage:deviceIsiPad:backgroundTaskable:privateDataSyncAvailability:pptContext:options:]";
    __int16 v47 = 2080;
    v48 = "FCCloudContext.m";
    __int16 v49 = 1024;
    int v50 = 199;
    __int16 v51 = 2114;
    v52 = v35;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  if ((a17 & 8) != 0) {
    +[FCAppleAccount enableStoreFrontLocking];
  }
  v27 = [[FCContentContext alloc] initWithConfiguration:v40 configurationManager:v39 contentHostDirectory:v22 networkBehaviorMonitor:v24 networkReachability:v25 desiredHeadlineFieldOptions:a11 feedUsage:a12 assetKeyManagerDelegate:self appActivityMonitor:v26 backgroundTaskable:v43 pptContext:v41];
  [(FCCloudContext *)self setContentContext:v27];
  [(FCCloudContext *)self setAppActivityMonitor:v26];
  v28 = [FCPrivateDataContext alloc];
  LOBYTE(v36) = [v42 isPrivateDataSyncingAllowed];
  uint64_t v29 = [(FCPrivateDataContext *)v28 initWithConfiguration:v40 context:self privateDataHostDirectory:v23 privateDataActionProvider:v38 encryptionDelegate:self networkBehaviorMonitor:v24 privateDataSyncingEnabled:v36];
  id v30 = [(FCCloudContext *)self initWithContentContext:v27 privateDataContext:v29 networkBehaviorMonitor:v24 networkReachability:v25 options:a17];
  id v31 = v30;
  if (v30)
  {
    v30->_deviceIsiPad = a13;
    objc_storeStrong((id *)&v30->_pptContext, a16);
    objc_storeWeak((id *)&v31->_backgroundTaskable, v43);
  }

  return v31;
}

- (FCTagSettings)tagSettings
{
  uint64_t v2 = [(FCCloudContext *)self privateDataContext];
  int v3 = [v2 tagSettings];

  return (FCTagSettings *)v3;
}

- (void)setContentContext:(id)a3
{
}

- (void)setAppActivityMonitor:(id)a3
{
}

- (FCShortcutCategoryList)shortcutCategoryList
{
  uint64_t v2 = [(FCCloudContext *)self privateDataContext];
  int v3 = [v2 shortcutCategoryList];

  return (FCShortcutCategoryList *)v3;
}

- (FCPuzzleTypeController)puzzleTypeController
{
  uint64_t v2 = [(FCCloudContext *)self contentContext];
  int v3 = [v2 puzzleTypeController];

  return (FCPuzzleTypeController *)v3;
}

- (FCAVAssetFactoryType)avAssetFactory
{
  uint64_t v2 = [(FCCloudContext *)self contentContext];
  int v3 = [v2 avAssetFactory];

  return (FCAVAssetFactoryType *)v3;
}

- (FCPuzzleTypeSettings)puzzleTypeSettings
{
  uint64_t v2 = [(FCCloudContext *)self privateDataContext];
  int v3 = [v2 puzzleTypeSettings];

  return (FCPuzzleTypeSettings *)v3;
}

- (id)_createPeopleAlsoReadInventory
{
  int v3 = [(FCCloudContext *)self contentContext];
  id v4 = [v3 contentDirectory];
  id v5 = [v4 stringByAppendingPathComponent:@"people-also-read-article-inventory"];

  id v6 = [(FCCloudContext *)self appConfigurationManager];
  v7 = [FCPeopleAlsoReadFeedItemService alloc];
  __int16 v8 = [(FCCloudContext *)self readingHistory];
  v9 = [(FCPeopleAlsoReadFeedItemService *)v7 initWithConfigurationManager:v6 contentContext:self readingHistory:v8];

  __int16 v10 = [FCFeedItemInventory alloc];
  int v11 = [(FCCloudContext *)self readingHistory];
  __int16 v12 = [(FCFeedItemInventory *)v10 initWithContext:self feedItemService:v9 readingHistory:v11 filePath:v5 version:0 refreshInterval:@"PeopleAlsoRead" loggingKey:0.0];

  return v12;
}

- (FCAVAssetPrewarming)avAssetPrewarmer
{
  uint64_t v2 = [(FCCloudContext *)self contentContext];
  int v3 = [v2 avAssetPrewarmer];

  return (FCAVAssetPrewarming *)v3;
}

- (void)prewarmStores
{
  id v2 = [(FCCloudContext *)self contentContext];
  [v2 prewarmStores];
}

- (FCPrivateChannelMembershipController)privateChannelMembershipController
{
  id v2 = [(FCCloudContext *)self privateDataContext];
  int v3 = [v2 privateChannelMembershipController];

  return (FCPrivateChannelMembershipController *)v3;
}

- (id)recordSourceWithSchema:(id)a3
{
  id v4 = a3;
  id v5 = [(FCCloudContext *)self contentContext];
  id v6 = [v5 recordSourceWithSchema:v4];

  return v6;
}

- (id)interestTokenForContentManifest:(id)a3
{
  id v4 = a3;
  id v5 = [(FCCloudContext *)self contentContext];
  id v6 = [v5 interestTokenForContentManifest:v4];

  return v6;
}

- (FCCloudContext)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    __int16 v8 = "-[FCCloudContext init]";
    __int16 v9 = 2080;
    __int16 v10 = "FCCloudContext.m";
    __int16 v11 = 1024;
    int v12 = 143;
    __int16 v13 = 2114;
    uint64_t v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  int v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCCloudContext init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

+ (id)testingContext
{
  id v2 = [[FCCloudContext alloc] initForTesting];
  return v2;
}

- (id)initForTesting
{
  return [(FCCloudContext *)self initForTestingWithDesiredHeadlineFieldOptions:0xF87FFFFC1];
}

+ (id)testingContextWithDesiredHeadlineFieldOptions:(unint64_t)a3
{
  id v3 = [[FCCloudContext alloc] initForTestingWithDesiredHeadlineFieldOptions:a3];
  return v3;
}

- (id)initForTestingWithDesiredHeadlineFieldOptions:(unint64_t)a3
{
  id v5 = [MEMORY[0x1E4F29128] UUID];
  v27 = [v5 UUIDString];

  id v6 = NSTemporaryDirectory();
  v7 = [NSString stringWithFormat:@"news-testing-cache-%@", v27];
  __int16 v8 = [v6 stringByAppendingPathComponent:v7];

  __int16 v9 = [MEMORY[0x1E4F1CB10] URLWithString:v8];
  __int16 v10 = +[FCContextConfiguration defaultConfiguration];
  __int16 v11 = [FCNetworkBehaviorMonitor alloc];
  int v12 = [v9 path];
  __int16 v13 = [(FCNetworkBehaviorMonitor *)v11 initWithCacheDirectory:v12];

  uint64_t v14 = +[FCNetworkReachability sharedNetworkReachability];
  id v15 = [[FCConfigurationManager alloc] initForTesting];
  id v16 = [FCContentContext alloc];
  v17 = +[FCCKTestContentDatabase testingDatabase];
  LOBYTE(v25) = 0;
  v18 = [(FCContentContext *)v16 initWithConfiguration:v10 configurationManager:v15 contentDatabase:v17 contentHostDirectory:v9 networkBehaviorMonitor:v13 networkReachability:v14 setupCustomURLProtocols:v25 desiredHeadlineFieldOptions:a3 feedUsage:2 assetKeyManagerDelegate:self appActivityMonitor:0 backgroundTaskable:0 pptContext:0];

  [(FCCloudContext *)self setContentContext:v18];
  uint64_t v19 = objc_opt_new();
  [(FCCloudContext *)self setAppActivityMonitor:v19];

  uint64_t v20 = [FCPrivateDataContext alloc];
  id v21 = +[FCCKPrivateDatabase testingDatabase];
  LOBYTE(v26) = 0;
  id v22 = [(FCPrivateDataContext *)v20 initWithConfiguration:v10 context:self privateDatabase:v21 privateDataDirectory:v9 privateDataActionProvider:0 encryptionDelegate:self networkBehaviorMonitor:v13 privateDataSyncingEnabled:v26];

  id v23 = [(FCCloudContext *)self initWithContentContext:v18 privateDataContext:v22 networkBehaviorMonitor:v13 networkReachability:v14 options:0];
  return v23;
}

- (FCOfflineArticleManagerType)offlineArticleManager
{
  if (!self->_offlineArticleManager)
  {
    id v5 = [(FCCloudContext *)self offlineArticleManagerProvider];

    if (v5)
    {
      if ([MEMORY[0x1E4F29060] isMainThread])
      {
        id v6 = [(FCCloudContext *)self offlineArticleManagerProvider];
        v6[2]();
        v7 = (FCOfflineArticleManagerType *)objc_claimAutoreleasedReturnValue();
        offlineArticleManager = self->_offlineArticleManager;
        self->_offlineArticleManager = v7;
      }
      else
      {
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __39__FCCloudContext_offlineArticleManager__block_invoke;
        block[3] = &unk_1E5B4C018;
        block[4] = self;
        dispatch_sync(MEMORY[0x1E4F14428], block);
      }
    }
  }
  id v3 = self->_offlineArticleManager;
  return v3;
}

void __39__FCCloudContext_offlineArticleManager__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) offlineArticleManagerProvider];
  uint64_t v2 = v5[2]();
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 144);
  *(void *)(v3 + 144) = v2;
}

- (id)notificationsController
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  notificationController = self->_notificationController;
  if (!notificationController)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "_notificationController");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCCloudContext notificationsController]";
      __int16 v8 = 2080;
      __int16 v9 = "FCCloudContext.m";
      __int16 v10 = 1024;
      int v11 = 485;
      __int16 v12 = 2114;
      __int16 v13 = v5;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      notificationController = self->_notificationController;
    }
    else
    {
      notificationController = 0;
    }
  }
  return notificationController;
}

- (FCClientEndpointConnection)endpointConnection
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  endpointConnection = self->_endpointConnection;
  if (!endpointConnection)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "_endpointConnection");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCCloudContext endpointConnection]";
      __int16 v8 = 2080;
      __int16 v9 = "FCCloudContext.m";
      __int16 v10 = 1024;
      int v11 = 520;
      __int16 v12 = 2114;
      __int16 v13 = v5;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      endpointConnection = self->_endpointConnection;
    }
    else
    {
      endpointConnection = 0;
    }
  }
  return endpointConnection;
}

- (FCCommandQueue)endpointCommandQueue
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  endpointCommandQueue = self->_endpointCommandQueue;
  if (!endpointCommandQueue)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "_endpointCommandQueue");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCCloudContext endpointCommandQueue]";
      __int16 v8 = 2080;
      __int16 v9 = "FCCloudContext.m";
      __int16 v10 = 1024;
      int v11 = 526;
      __int16 v12 = 2114;
      __int16 v13 = v5;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      endpointCommandQueue = self->_endpointCommandQueue;
    }
    else
    {
      endpointCommandQueue = 0;
    }
  }
  return endpointCommandQueue;
}

- (FCNotificationsEndpointConnection)notificationsEndpointConnection
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  notificationsEndpointConnection = self->_notificationsEndpointConnection;
  if (!notificationsEndpointConnection)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "_notificationsEndpointConnection");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCCloudContext notificationsEndpointConnection]";
      __int16 v8 = 2080;
      __int16 v9 = "FCCloudContext.m";
      __int16 v10 = 1024;
      int v11 = 532;
      __int16 v12 = 2114;
      __int16 v13 = v5;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      notificationsEndpointConnection = self->_notificationsEndpointConnection;
    }
    else
    {
      notificationsEndpointConnection = 0;
    }
  }
  return notificationsEndpointConnection;
}

- (FCCommandQueue)notificationsEndpointCommandQueue
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  notificationsEndpointCommandQueue = self->_notificationsEndpointCommandQueue;
  if (!notificationsEndpointCommandQueue)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "_notificationsEndpointCommandQueue");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCCloudContext notificationsEndpointCommandQueue]";
      __int16 v8 = 2080;
      __int16 v9 = "FCCloudContext.m";
      __int16 v10 = 1024;
      int v11 = 538;
      __int16 v12 = 2114;
      __int16 v13 = v5;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      notificationsEndpointCommandQueue = self->_notificationsEndpointCommandQueue;
    }
    else
    {
      notificationsEndpointCommandQueue = 0;
    }
  }
  return notificationsEndpointCommandQueue;
}

- (BOOL)isPrivateDataEncryptionEnabled
{
  uint64_t v2 = [(FCCloudContext *)self privateDataContext];
  uint64_t v3 = [v2 internalPrivateDataContext];
  uint64_t v4 = [v3 privateDatabase];
  if (v4) {
    BOOL v5 = v4[5] > 0;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)isPrivateDatabaseStartingUp
{
  uint64_t v2 = [(FCCloudContext *)self privateDataContext];
  uint64_t v3 = [v2 internalPrivateDataContext];
  uint64_t v4 = [v3 privateDatabase];
  if (v4) {
    BOOL v5 = v4[10] == 0;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)isPrivateDatabaseOnline
{
  uint64_t v2 = [(FCCloudContext *)self privateDataContext];
  uint64_t v3 = [v2 internalPrivateDataContext];
  uint64_t v4 = [v3 privateDatabase];
  if (v4) {
    BOOL v5 = v4[20] == 0;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)isPrivateDatabaseTemporarilySuspended
{
  uint64_t v2 = [(FCCloudContext *)self privateDataContext];
  uint64_t v3 = [v2 internalPrivateDataContext];
  uint64_t v4 = [v3 privateDatabase];
  if (v4) {
    BOOL v5 = v4[20] == 1;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)ppt_overrideFeedEndpoint:(int64_t)a3
{
  id v4 = [(FCCloudContext *)self contentContext];
  objc_msgSend(v4, "ppt_overrideFeedEndpoint:", a3);
}

- (void)ppt_prewarmFeedDatabase
{
  id v2 = [(FCCloudContext *)self contentContext];
  objc_msgSend(v2, "ppt_prewarmFeedDatabase");
}

- (NSString)contentEnvironmentToken
{
  id v2 = [(FCCloudContext *)self contentContext];
  uint64_t v3 = [v2 contentEnvironmentToken];

  return (NSString *)v3;
}

- (void)enableFlushingWithFlushingThreshold:(unint64_t)a3 exceptForFlusher:(id)a4
{
  id v6 = a4;
  id v7 = [(FCCloudContext *)self contentContext];
  [v7 enableFlushingWithFlushingThreshold:a3 exceptForFlusher:v6];
}

- (FCFeedPersonalizing)feedPersonalizer
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  feedPersonalizer = self->_feedPersonalizer;
  if (!feedPersonalizer)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      BOOL v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "_feedPersonalizer");
      *(_DWORD *)buf = 136315906;
      id v7 = "-[FCCloudContext feedPersonalizer]";
      __int16 v8 = 2080;
      __int16 v9 = "FCCloudContext.m";
      __int16 v10 = 1024;
      int v11 = 611;
      __int16 v12 = 2114;
      __int16 v13 = v5;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      feedPersonalizer = self->_feedPersonalizer;
    }
    else
    {
      feedPersonalizer = 0;
    }
  }
  return feedPersonalizer;
}

- (id)magazinesConfigurationManager
{
  id v2 = [(FCCloudContext *)self contentContext];
  uint64_t v3 = [v2 magazinesConfigurationManager];

  return v3;
}

- (NSString)contentStoreFrontID
{
  id v2 = +[FCAppleAccount sharedAccount];
  uint64_t v3 = [v2 contentStoreFrontID];

  return (NSString *)v3;
}

- (NSString)supportedContentStoreFrontID
{
  id v2 = +[FCAppleAccount sharedAccount];
  uint64_t v3 = [v2 supportedContentStoreFrontID];

  return (NSString *)v3;
}

- (NSString)contentEnvironment
{
  id v2 = [(FCCloudContext *)self contentContext];
  uint64_t v3 = [v2 contentEnvironment];

  return (NSString *)v3;
}

- (NSURL)contentHostDirectoryURL
{
  id v2 = [(FCCloudContext *)self contentContext];
  uint64_t v3 = [v2 contentHostDirectoryURL];

  return (NSURL *)v3;
}

- (NSString)tabiResourcesContentDirectory
{
  id v2 = [(FCCloudContext *)self contentContext];
  uint64_t v3 = [v2 tabiResourcesContentDirectory];

  return (NSString *)v3;
}

- (NSString)tabiModelsContentDirectory
{
  id v2 = [(FCCloudContext *)self contentContext];
  uint64_t v3 = [v2 tabiModelsContentDirectory];

  return (NSString *)v3;
}

- (NSString)tabiRequestsContentDirectory
{
  id v2 = [(FCCloudContext *)self contentContext];
  uint64_t v3 = [v2 tabiRequestsContentDirectory];

  return (NSString *)v3;
}

- (NSURL)assetCacheDirectoryURL
{
  id v2 = [(FCCloudContext *)self contentContext];
  uint64_t v3 = [v2 assetCacheDirectoryURL];

  return (NSURL *)v3;
}

- (FCFeedDatabaseProtocol)feedDatabase
{
  id v2 = [(FCCloudContext *)self contentContext];
  uint64_t v3 = [v2 feedDatabase];

  return (FCFeedDatabaseProtocol *)v3;
}

- (id)recordTreeSourceWithRecordSources:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(FCCloudContext *)self contentContext];
  id v6 = [v5 recordTreeSourceWithRecordSources:v4];

  return v6;
}

- (id)convertRecords:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(FCCloudContext *)self contentContext];
  id v6 = [v5 convertRecords:v4];

  return v6;
}

- (int64_t)storageSize
{
  id v2 = [(FCCloudContext *)self contentContext];
  int64_t v3 = [v2 storageSize];

  return v3;
}

- (void)save
{
  id v2 = [(FCCloudContext *)self contentContext];
  [v2 save];
}

- (BOOL)isPrivateDataSyncingEnabled
{
  id v2 = [(FCCloudContext *)self privateDataContext];
  char v3 = [v2 isPrivateDataSyncingEnabled];

  return v3;
}

- (id)privateStoreWithName:(id)a3 version:(unint64_t)a4 options:(unint64_t)a5
{
  id v8 = a3;
  __int16 v9 = [(FCCloudContext *)self privateDataContext];
  __int16 v10 = [v9 privateStoreWithName:v8 version:a4 options:a5];

  return v10;
}

- (FCPrivateDataContextInternal)internalPrivateDataContext
{
  id v2 = [(FCCloudContext *)self privateDataContext];
  char v3 = [v2 internalPrivateDataContext];

  return (FCPrivateDataContextInternal *)v3;
}

- (FCPushNotificationHandling)privatePushNotificationHandler
{
  id v2 = [(FCCloudContext *)self privateDataContext];
  char v3 = [v2 privatePushNotificationHandler];

  return (FCPushNotificationHandling *)v3;
}

- (id)insertTestArticle
{
  char v3 = (objc_class *)objc_opt_class();
  id v4 = [(FCCloudContext *)self contentContext];
  BOOL v5 = [v4 internalContentContext];
  id v6 = [v5 contentDatabase];
  id v7 = FCCheckedDynamicCast(v3, (uint64_t)v6);

  id v8 = [v7 insertTestArticle];

  return v8;
}

- (id)insertTestArticlesWithCount:(unint64_t)a3
{
  BOOL v5 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:");
  while (a3)
  {
    --a3;
    id v6 = [(FCCloudContext *)self insertTestArticle];
    [v5 addObject:v6];
  }
  return v5;
}

- (void)fetchDesiredVersionForDatabase:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F28B50] mainBundle];
  __int16 v9 = [v8 bundleIdentifier];
  char v10 = [v9 isEqualToString:@"com.apple.news"];

  if (v10)
  {
    int v11 = NewsCoreUserDefaults();
    uint64_t v12 = [v11 integerForKey:@"encryption_desired_version_override"];

    switch(v12)
    {
      case 1:
        (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
        break;
      case 2:
        (*((void (**)(id, uint64_t, void))v7 + 2))(v7, 1, 0);
        break;
      case 3:
        (*((void (**)(id, uint64_t, void))v7 + 2))(v7, 2, 0);
        break;
      case 4:
        (*((void (**)(id, uint64_t, void))v7 + 2))(v7, 3, 0);
        break;
      default:
        id v14 = objc_alloc(MEMORY[0x1E4F81BF0]);
        v52[0] = MEMORY[0x1E4F143A8];
        v52[1] = 3221225472;
        v52[2] = __60__FCCloudContext_fetchDesiredVersionForDatabase_completion___block_invoke_178;
        v52[3] = &unk_1E5B4EEF0;
        id v53 = v6;
        id v15 = (void *)[v14 initWithResolver:v52];
        id v16 = objc_alloc(MEMORY[0x1E4F81BF0]);
        v51[0] = MEMORY[0x1E4F143A8];
        v51[1] = 3221225472;
        v51[2] = __60__FCCloudContext_fetchDesiredVersionForDatabase_completion___block_invoke_188;
        v51[3] = &unk_1E5B4EEF0;
        v51[4] = self;
        v17 = (void *)[v16 initWithResolver:v51];
        v18 = (void *)[objc_alloc(MEMORY[0x1E4F81BF0]) initWithResolver:&__block_literal_global_45];
        v50[0] = 0;
        v50[1] = v50;
        v50[2] = 0x2020000000;
        v50[3] = 0;
        v49[0] = 0;
        v49[1] = v49;
        v49[2] = 0x2020000000;
        v49[3] = 0;
        v48[0] = 0;
        v48[1] = v48;
        v48[2] = 0x2020000000;
        v48[3] = 0;
        uint64_t v19 = (void *)MEMORY[0x1E4F81BF0];
        v46[0] = MEMORY[0x1E4F143A8];
        v46[1] = 3221225472;
        v46[2] = __60__FCCloudContext_fetchDesiredVersionForDatabase_completion___block_invoke_205;
        v46[3] = &unk_1E5B4E758;
        id v31 = v15;
        id v47 = v31;
        uint64_t v34 = [v19 firstly:v46];
        uint64_t v33 = zalgo();
        v43[0] = MEMORY[0x1E4F143A8];
        v43[1] = 3221225472;
        v43[2] = __60__FCCloudContext_fetchDesiredVersionForDatabase_completion___block_invoke_2_207;
        v43[3] = &unk_1E5B51828;
        v45 = v50;
        id v30 = v17;
        id v44 = v30;
        id v32 = [v34 thenOn:v33 then:v43];
        uint64_t v20 = zalgo();
        v40[0] = MEMORY[0x1E4F143A8];
        v40[1] = 3221225472;
        v40[2] = __60__FCCloudContext_fetchDesiredVersionForDatabase_completion___block_invoke_3_209;
        v40[3] = &unk_1E5B51828;
        id v42 = v49;
        id v29 = v18;
        id v41 = v29;
        id v21 = [v32 thenOn:v20 then:v40];
        id v22 = zalgo();
        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = __60__FCCloudContext_fetchDesiredVersionForDatabase_completion___block_invoke_4;
        v39[3] = &unk_1E5B51850;
        v39[4] = v48;
        v39[5] = v50;
        v39[6] = v49;
        id v23 = [v21 thenOn:v22 then:v39];
        id v24 = zalgo();
        v37[0] = MEMORY[0x1E4F143A8];
        v37[1] = 3221225472;
        v37[2] = __60__FCCloudContext_fetchDesiredVersionForDatabase_completion___block_invoke_5;
        v37[3] = &unk_1E5B51878;
        id v25 = v7;
        id v38 = v25;
        uint64_t v26 = [v23 thenOn:v24 then:v37];
        v27 = zalgo();
        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        v35[2] = __60__FCCloudContext_fetchDesiredVersionForDatabase_completion___block_invoke_6;
        v35[3] = &unk_1E5B4EF68;
        id v36 = v25;
        id v28 = (id)[v26 errorOn:v27 error:v35];

        _Block_object_dispose(v48, 8);
        _Block_object_dispose(v49, 8);
        _Block_object_dispose(v50, 8);

        __int16 v13 = v53;
        goto LABEL_5;
    }
  }
  else
  {
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __60__FCCloudContext_fetchDesiredVersionForDatabase_completion___block_invoke;
    v54[3] = &unk_1E5B4CA88;
    id v55 = v7;
    __60__FCCloudContext_fetchDesiredVersionForDatabase_completion___block_invoke((uint64_t)v54);
    __int16 v13 = v55;
LABEL_5:
  }
}

uint64_t __60__FCCloudContext_fetchDesiredVersionForDatabase_completion___block_invoke(uint64_t a1)
{
  id v2 = FCPrivateDataEncryptionLog;
  if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1A460D000, v2, OS_LOG_TYPE_DEFAULT, "targeting base version because we're running outside the News app", v4, 2u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __60__FCCloudContext_fetchDesiredVersionForDatabase_completion___block_invoke_178(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __60__FCCloudContext_fetchDesiredVersionForDatabase_completion___block_invoke_2;
  v10[3] = &unk_1E5B517B8;
  id v11 = v6;
  id v12 = v5;
  id v8 = v5;
  id v9 = v6;
  -[FCCKPrivateDatabase fetchSecureDatabaseSupportedWithCompletionHandler:](v7, v10);
}

void __60__FCCloudContext_fetchDesiredVersionForDatabase_completion___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __60__FCCloudContext_fetchDesiredVersionForDatabase_completion___block_invoke_3;
    v12[3] = &unk_1E5B4CC80;
    id v13 = v5;
    id v14 = *(id *)(a1 + 32);
    __60__FCCloudContext_fetchDesiredVersionForDatabase_completion___block_invoke_3((uint64_t)v12);

    uint64_t v7 = v13;
  }
  else
  {
    id v8 = FCPrivateDataEncryptionLog;
    if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = @"not supported";
      if (a2) {
        id v9 = @"supported";
      }
      *(_DWORD *)buf = 138543362;
      id v16 = v9;
      _os_log_impl(&dword_1A460D000, v8, OS_LOG_TYPE_DEFAULT, "secure database is %{public}@", buf, 0xCu);
    }
    uint64_t v10 = *(void *)(a1 + 40);
    if (a2) {
      uint64_t v11 = 3;
    }
    else {
      uint64_t v11 = 0;
    }
    uint64_t v7 = [NSNumber numberWithInteger:v11];
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v7);
  }
}

uint64_t __60__FCCloudContext_fetchDesiredVersionForDatabase_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = FCPrivateDataEncryptionLog;
  if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v4;
    _os_log_error_impl(&dword_1A460D000, v2, OS_LOG_TYPE_ERROR, "encountered error checking whether secure database is supported: %{public}@", (uint8_t *)&v5, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __60__FCCloudContext_fetchDesiredVersionForDatabase_completion___block_invoke_188(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) configurationManager];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__FCCloudContext_fetchDesiredVersionForDatabase_completion___block_invoke_2_189;
  void v6[3] = &unk_1E5B4EEC8;
  id v7 = v3;
  id v5 = v3;
  [v4 fetchConfigurationIfNeededWithCompletion:v6];
}

void __60__FCCloudContext_fetchDesiredVersionForDatabase_completion___block_invoke_2_189(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __60__FCCloudContext_fetchDesiredVersionForDatabase_completion___block_invoke_3_190;
    v14[3] = &unk_1E5B4CC80;
    id v15 = v6;
    id v16 = *(id *)(a1 + 32);
    __60__FCCloudContext_fetchDesiredVersionForDatabase_completion___block_invoke_3_190((uint64_t)v14);
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0 && [v5 privateDataShouldMigrateToV4])
    {
      id v8 = FCPrivateDataEncryptionLog;
      if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v13 = 0;
        _os_log_impl(&dword_1A460D000, v8, OS_LOG_TYPE_DEFAULT, "app config allows database v4 (ubiquitous encryption", v13, 2u);
      }
      id v9 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    }
    else if ([v5 privateDataShouldSecureSubscriptions])
    {
      uint64_t v10 = FCPrivateDataEncryptionLog;
      if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v13 = 0;
        _os_log_impl(&dword_1A460D000, v10, OS_LOG_TYPE_DEFAULT, "app config allows database v3 (secure subscriptions)", v13, 2u);
      }
      id v9 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    }
    else if ([v5 isPrivateDataEncryptionAllowed] {
           && [v5 isPrivateDataEncryptionMigrationDesired])
    }
    {
      uint64_t v11 = FCPrivateDataEncryptionLog;
      if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v13 = 0;
        _os_log_impl(&dword_1A460D000, v11, OS_LOG_TYPE_DEFAULT, "app config allows database v2 (selective encryption)", v13, 2u);
      }
      id v9 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    }
    else
    {
      id v12 = FCPrivateDataEncryptionLog;
      if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v13 = 0;
        _os_log_impl(&dword_1A460D000, v12, OS_LOG_TYPE_DEFAULT, "app config does not allow encryption", v13, 2u);
      }
      id v9 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    }
    v9();
  }
}

uint64_t __60__FCCloudContext_fetchDesiredVersionForDatabase_completion___block_invoke_3_190(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = FCPrivateDataEncryptionLog;
  if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v4;
    _os_log_error_impl(&dword_1A460D000, v2, OS_LOG_TYPE_ERROR, "encountered error fetching app config for encryption settings: %{public}@", (uint8_t *)&v5, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __60__FCCloudContext_fetchDesiredVersionForDatabase_completion___block_invoke_201(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[FCAppleAccount sharedAccount];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __60__FCCloudContext_fetchDesiredVersionForDatabase_completion___block_invoke_2_202;
  v5[3] = &unk_1E5B51800;
  id v6 = v2;
  id v4 = v2;
  [v3 fetchMinimumDeviceVersionsActiveSinceInterval:v5 completionHandler:7776000.0];
}

void __60__FCCloudContext_fetchDesiredVersionForDatabase_completion___block_invoke_2_202(uint64_t a1, _OWORD *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __60__FCCloudContext_fetchDesiredVersionForDatabase_completion___block_invoke_3_203;
    v16[3] = &unk_1E5B4CC80;
    id v17 = v5;
    id v18 = *(id *)(a1 + 32);
    __60__FCCloudContext_fetchDesiredVersionForDatabase_completion___block_invoke_3_203((uint64_t)v16);

    uint64_t v7 = v17;
  }
  else
  {
    id v8 = (void *)FCPrivateDataEncryptionLog;
    if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_DEFAULT))
    {
      long long v9 = a2[1];
      *(_OWORD *)buf = *a2;
      long long v20 = v9;
      long long v10 = a2[3];
      long long v21 = a2[2];
      long long v22 = v10;
      uint64_t v11 = v8;
      id v12 = FCStringFromOSVersions((uint64_t *)buf);
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v12;
      _os_log_impl(&dword_1A460D000, v11, OS_LOG_TYPE_DEFAULT, "minimum active device versions are %{public}@", buf, 0xCu);
    }
    uint64_t v13 = *(void *)(a1 + 32);
    long long v14 = a2[1];
    *(_OWORD *)buf = *a2;
    long long v20 = v14;
    long long v15 = a2[3];
    long long v21 = a2[2];
    long long v22 = v15;
    uint64_t v7 = [NSNumber numberWithInteger:FCCKPrivateDatabaseVersionSupportedByOS((uint64_t *)buf)];
    (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v7);
  }
}

uint64_t __60__FCCloudContext_fetchDesiredVersionForDatabase_completion___block_invoke_3_203(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = FCPrivateDataEncryptionLog;
  if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v4;
    _os_log_error_impl(&dword_1A460D000, v2, OS_LOG_TYPE_ERROR, "encountered error checking device versions: %{public}@", (uint8_t *)&v5, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

id __60__FCCloudContext_fetchDesiredVersionForDatabase_completion___block_invoke_205(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __60__FCCloudContext_fetchDesiredVersionForDatabase_completion___block_invoke_2_207(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [a2 integerValue];
  id v3 = *(void **)(a1 + 32);
  return v3;
}

id __60__FCCloudContext_fetchDesiredVersionForDatabase_completion___block_invoke_3_209(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [a2 integerValue];
  id v3 = *(void **)(a1 + 32);
  return v3;
}

uint64_t __60__FCCloudContext_fetchDesiredVersionForDatabase_completion___block_invoke_4(void *a1, void *a2)
{
  *(void *)(*(void *)(a1[4] + 8) + 24) = [a2 integerValue];
  uint64_t v3 = *(void *)(*(void *)(a1[4] + 8) + 24);
  if (*(void *)(*(void *)(a1[6] + 8) + 24) < v3) {
    uint64_t v3 = *(void *)(*(void *)(a1[6] + 8) + 24);
  }
  if (v3 >= *(void *)(*(void *)(a1[5] + 8) + 24)) {
    uint64_t v4 = *(void *)(*(void *)(a1[5] + 8) + 24);
  }
  else {
    uint64_t v4 = v3;
  }
  int v5 = NSNumber;
  return [v5 numberWithInteger:v4];
}

uint64_t __60__FCCloudContext_fetchDesiredVersionForDatabase_completion___block_invoke_5(uint64_t a1, void *a2)
{
  return 0;
}

uint64_t __60__FCCloudContext_fetchDesiredVersionForDatabase_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchCleanupToVersionForDatabase:(id)a3 completion:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v7 = [v6 bundleIdentifier];
  char v8 = [v7 isEqualToString:@"com.apple.news"];

  if (v8)
  {
    long long v9 = NewsCoreUserDefaults();
    uint64_t v10 = [v9 integerForKey:@"encryption_cleanup_to_version_override"];

    switch(v10)
    {
      case 1:
        (*((void (**)(id, void, void))v5 + 2))(v5, 0, 0);
        break;
      case 2:
        (*((void (**)(id, uint64_t, void))v5 + 2))(v5, 1, 0);
        break;
      case 3:
        (*((void (**)(id, uint64_t, void))v5 + 2))(v5, 2, 0);
        break;
      case 4:
        (*((void (**)(id, uint64_t, void))v5 + 2))(v5, 3, 0);
        break;
      default:
        id v11 = objc_alloc(MEMORY[0x1E4F81BF0]);
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __62__FCCloudContext_fetchCleanupToVersionForDatabase_completion___block_invoke_211;
        v27[3] = &unk_1E5B4EEF0;
        v27[4] = self;
        id v12 = (void *)[v11 initWithResolver:v27];
        uint64_t v13 = (void *)MEMORY[0x1E4F81BF0];
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __62__FCCloudContext_fetchCleanupToVersionForDatabase_completion___block_invoke_216;
        v25[3] = &unk_1E5B4E758;
        id v26 = v12;
        id v14 = v12;
        long long v15 = [v13 firstly:v25];
        id v16 = zalgo();
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __62__FCCloudContext_fetchCleanupToVersionForDatabase_completion___block_invoke_2_217;
        v23[3] = &unk_1E5B51878;
        id v17 = v5;
        id v24 = v17;
        id v18 = [v15 thenOn:v16 then:v23];
        uint64_t v19 = zalgo();
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __62__FCCloudContext_fetchCleanupToVersionForDatabase_completion___block_invoke_218;
        v21[3] = &unk_1E5B4EF68;
        id v22 = v17;
        id v20 = (id)[v18 errorOn:v19 error:v21];

        break;
    }
  }
  else
  {
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __62__FCCloudContext_fetchCleanupToVersionForDatabase_completion___block_invoke;
    v28[3] = &unk_1E5B4CA88;
    id v29 = v5;
    __62__FCCloudContext_fetchCleanupToVersionForDatabase_completion___block_invoke((uint64_t)v28);
  }
}

uint64_t __62__FCCloudContext_fetchCleanupToVersionForDatabase_completion___block_invoke(uint64_t a1)
{
  id v2 = FCPrivateDataEncryptionLog;
  if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1A460D000, v2, OS_LOG_TYPE_DEFAULT, "no cleanup because we're running outside the News app", v4, 2u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __62__FCCloudContext_fetchCleanupToVersionForDatabase_completion___block_invoke_211(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) configurationManager];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __62__FCCloudContext_fetchCleanupToVersionForDatabase_completion___block_invoke_2;
  v10[3] = &unk_1E5B50128;
  id v11 = v6;
  id v12 = v5;
  id v8 = v5;
  id v9 = v6;
  [v7 fetchConfigurationIfNeededWithCompletion:v10];
}

void __62__FCCloudContext_fetchCleanupToVersionForDatabase_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v6)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __62__FCCloudContext_fetchCleanupToVersionForDatabase_completion___block_invoke_3;
    v15[3] = &unk_1E5B4CC80;
    id v16 = v6;
    id v17 = *(id *)(a1 + 32);
    __62__FCCloudContext_fetchCleanupToVersionForDatabase_completion___block_invoke_3((uint64_t)v15);
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0 && [v5 privateDataShouldCleanupToV4])
    {
      id v8 = FCPrivateDataEncryptionLog;
      if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v14 = 0;
        _os_log_impl(&dword_1A460D000, v8, OS_LOG_TYPE_DEFAULT, "app config allows cleanup to v4 (ubiquitous encryption)", v14, 2u);
      }
      id v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0 {
           && [v5 privateDataShouldCleanupAfterSecureSubscriptions])
    }
    {
      uint64_t v10 = FCPrivateDataEncryptionLog;
      if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v14 = 0;
        _os_log_impl(&dword_1A460D000, v10, OS_LOG_TYPE_DEFAULT, "app config allows cleanup to v3 (secure subscription)", v14, 2u);
      }
      id v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    }
    else
    {
      int v11 = [v5 isPrivateDataMigrationCleanupEnabled];
      id v12 = FCPrivateDataEncryptionLog;
      BOOL v13 = os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_DEFAULT);
      if (v11)
      {
        if (v13)
        {
          *(_WORD *)id v14 = 0;
          _os_log_impl(&dword_1A460D000, v12, OS_LOG_TYPE_DEFAULT, "app config allows cleanup to v2 (selective encryption)", v14, 2u);
        }
        id v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
      }
      else
      {
        if (v13)
        {
          *(_WORD *)id v14 = 0;
          _os_log_impl(&dword_1A460D000, v12, OS_LOG_TYPE_DEFAULT, "app config does not allow encryption cleanup", v14, 2u);
        }
        id v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
      }
    }
    v9();
  }
}

uint64_t __62__FCCloudContext_fetchCleanupToVersionForDatabase_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = FCPrivateDataEncryptionLog;
  if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v4;
    _os_log_error_impl(&dword_1A460D000, v2, OS_LOG_TYPE_ERROR, "encountered error fetching app config for encryption settings: %{public}@", (uint8_t *)&v5, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

id __62__FCCloudContext_fetchCleanupToVersionForDatabase_completion___block_invoke_216(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t __62__FCCloudContext_fetchCleanupToVersionForDatabase_completion___block_invoke_2_217(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a2 integerValue];
  uint64_t v4 = (void *)FCPrivateDataEncryptionLog;
  if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = v4;
    uint64_t v6 = FCCKPrivateDatabaseVersionString(v3);
    int v8 = 138543362;
    id v9 = v6;
    _os_log_impl(&dword_1A460D000, v5, OS_LOG_TYPE_DEFAULT, "fetched desired private data cleanup version with result: %{public}@", (uint8_t *)&v8, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  return 0;
}

uint64_t __62__FCCloudContext_fetchCleanupToVersionForDatabase_completion___block_invoke_218(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)shouldAssetKeyManagerSimulateUnauthorizedAssetKeys:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = NewsCoreUserDefaults();
  char v6 = [v5 BOOLForKey:@"simulate_no_access_to_awk"];

  if (v6)
  {
    BOOL v7 = 1;
  }
  else
  {
    int v8 = NewsCoreUserDefaults();
    int v9 = [v8 BOOLForKey:@"simulate_bo_access_to_awk"];

    if (v9)
    {
      uint64_t v10 = [(FCCloudContext *)self bundleSubscriptionManager];

      if (!v10 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        id v18 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "self.bundleSubscriptionManager");
        *(_DWORD *)buf = 136315906;
        id v20 = "-[FCCloudContext shouldAssetKeyManagerSimulateUnauthorizedAssetKeys:]";
        __int16 v21 = 2080;
        id v22 = "FCCloudContext.m";
        __int16 v23 = 1024;
        int v24 = 1097;
        __int16 v25 = 2114;
        id v26 = v18;
        _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
      }
      int v11 = [(FCCloudContext *)self bundleSubscriptionManager];
      uint64_t v12 = [v11 cachedSubscription];
      BOOL v13 = objc_getAssociatedObject((id)v12, (const void *)(v12 + 1));
      uint64_t v14 = [v13 unsignedIntegerValue];
      int v15 = v14;
      id v16 = objc_getAssociatedObject((id)v12, (const void *)~v14);
      BOOL v7 = (([v16 unsignedIntegerValue] ^ v15) & 1) == 0;
    }
    else
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (void)bundleSubscriptionDidSubscribe:(id)a3
{
  id v5 = [(FCCloudContext *)self contentContext];
  uint64_t v3 = [v5 internalContentContext];
  id v4 = [v3 assetKeyManager];
  [v4 clearUnauthorizedAssetKeys];
}

- (int64_t)preferredContentVariant
{
  id v2 = [(FCCloudContext *)self bundleSubscriptionManager];
  uint64_t v3 = [v2 bundleSubscription];
  id v4 = objc_getAssociatedObject((id)v3, (const void *)(v3 + 1));
  uint64_t v5 = [v4 unsignedIntegerValue];
  unsigned __int8 v6 = v5;
  BOOL v7 = objc_getAssociatedObject((id)v3, (const void *)~v5);
  int64_t v8 = ([v7 unsignedIntegerValue] ^ v6) & 1;

  return v8;
}

- (void)_purchaseControllerDidAddALaCarteSubscription
{
  id v4 = [(FCCloudContext *)self contentContext];
  id v2 = [v4 internalContentContext];
  uint64_t v3 = [v2 assetKeyManager];
  [v3 clearUnauthorizedAssetKeys];
}

- (FCNewsletterEndpointConnection)newsletterEndpointConnection
{
  return self->_newsletterEndpointConnection;
}

- (FCCommandQueue)newsletterEndpointCommandQueue
{
  return self->_newsletterEndpointCommandQueue;
}

- (FCFeedItemInventoryType)peopleAlsoReadInventory
{
  return self->_peopleAlsoReadInventory;
}

- (FCPeopleAlsoReadInventoryManager)peopleAlsoReadInventoryManager
{
  return self->_peopleAlsoReadInventoryManager;
}

- (void)setEntitlementService:(id)a3
{
}

- (void)setTranslationManager:(id)a3
{
}

- (void)setLocalAreasManager:(id)a3
{
}

- (void)setCurrentIssuesChecker:(id)a3
{
}

- (void)setPaidAccessChecker:(id)a3
{
}

- (FCAccessChecker)issueAccessChecker
{
  return self->_issueAccessChecker;
}

- (void)setIssueAccessChecker:(id)a3
{
}

- (FCAccessChecker)articleAccessChecker
{
  return self->_articleAccessChecker;
}

- (void)setArticleAccessChecker:(id)a3
{
}

- (FCLocalChannelsProvider)localChannelsProvider
{
  return self->_localChannelsProvider;
}

- (void)setBackgroundTaskable:(id)a3
{
}

- (id)offlineArticleManagerProvider
{
  return self->_offlineArticleManagerProvider;
}

- (FCWebURLResolutionEndpointConnection)webURLResolutionEndpointConnection
{
  return self->_webURLResolutionEndpointConnection;
}

- (void)setPrivateDataContext:(id)a3
{
}

- (FCUserVectorManager)userVectorManager
{
  return self->_userVectorManager;
}

- (void)setUserVectorManager:(id)a3
{
}

- (int64_t)options
{
  return self->_options;
}

- (void)setOptions:(int64_t)a3
{
  self->_options = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userVectorManager, 0);
  objc_storeStrong((id *)&self->_privateDataContext, 0);
  objc_storeStrong((id *)&self->_contentContext, 0);
  objc_storeStrong((id *)&self->_pptContext, 0);
  objc_storeStrong((id *)&self->_webURLResolutionEndpointConnection, 0);
  objc_storeStrong(&self->_offlineArticleManagerProvider, 0);
  objc_destroyWeak((id *)&self->_backgroundTaskable);
  objc_storeStrong((id *)&self->_localChannelsProvider, 0);
  objc_storeStrong((id *)&self->_localRegionProvider, 0);
  objc_storeStrong((id *)&self->_articleAccessChecker, 0);
  objc_storeStrong((id *)&self->_issueAccessChecker, 0);
  objc_storeStrong((id *)&self->_paidAccessChecker, 0);
  objc_storeStrong((id *)&self->_currentIssuesChecker, 0);
  objc_storeStrong((id *)&self->_localAreasManager, 0);
  objc_storeStrong((id *)&self->_translationManager, 0);
  objc_storeStrong((id *)&self->_entitlementService, 0);
  objc_storeStrong((id *)&self->_bundleSubscriptionManager, 0);
  objc_storeStrong((id *)&self->_purchaseManager, 0);
  objc_storeStrong((id *)&self->_purchaseProvider, 0);
  objc_storeStrong((id *)&self->_purchaseController, 0);
  objc_storeStrong((id *)&self->_offlineArticleManager, 0);
  objc_storeStrong((id *)&self->_notificationController, 0);
  objc_storeStrong((id *)&self->_notificationsEndpointCommandQueue, 0);
  objc_storeStrong((id *)&self->_notificationsEndpointConnection, 0);
  objc_storeStrong((id *)&self->_peopleAlsoReadInventoryManager, 0);
  objc_storeStrong((id *)&self->_peopleAlsoReadInventory, 0);
  objc_storeStrong((id *)&self->_eslInventory, 0);
  objc_storeStrong((id *)&self->_newsletterEndpointCommandQueue, 0);
  objc_storeStrong((id *)&self->_newsletterEndpointConnection, 0);
  objc_storeStrong((id *)&self->_newsletterManager, 0);
  objc_storeStrong((id *)&self->_endpointCommandQueue, 0);
  objc_storeStrong((id *)&self->_endpointConnection, 0);
  objc_storeStrong((id *)&self->_appActivityMonitor, 0);
  objc_storeStrong((id *)&self->_networkBehaviorMonitor, 0);
  objc_storeStrong((id *)&self->_feedDatabase, 0);
  objc_storeStrong((id *)&self->_subscriptionController, 0);
  objc_storeStrong((id *)&self->_feedPersonalizer, 0);
}

@end