@interface FRFavoritesPersonalizer
+ (BOOL)frozen;
+ (void)logPPMessage:(id)a3;
- (FCAsyncSerialQueue)autoFavoritesQueue;
- (FCBundleSubscriptionManagerType)bundleSubscriptionManager;
- (FCCloudContext)cloudContext;
- (FCDisposable)locationObserver;
- (FCKeyValueStore)debugKeyValueStore;
- (FCKeyValueStore)hourlyFlowRateHighWaterMarkValueStore;
- (FCNewsAppConfigurationManager)appConfigurationManager;
- (FCPersonalizationAggregateStore)aggregateStore;
- (FCPersonalizationBundleIDMapping)bundleIDMapping;
- (FCPersonalizationTreatment)configurableValues;
- (FCPersonalizationURLMapping)urlMapping;
- (FCPersonalizationWhitelist)allowlist;
- (FCPersonalizationWhitelist)whitelist;
- (FCPurchaseController)purchaseController;
- (FCReadonlyAggregateStoreProviderType)aggregateStoreProvider;
- (FCSubscriptionController)subscriptionController;
- (FCTagRanking)tagRanker;
- (FCUserInfo)userInfo;
- (FRFavoritesPersonalizer)init;
- (FRFavoritesPersonalizer)initWithCloudContext:(id)a3;
- (FRFavoritesPersonalizer)initWithCloudContext:(id)a3 storePath:(id)a4;
- (FRPersonalizationAutoFavorites)autofavorites;
- (FRPersonalizationAutoFavoritesCursor)autoFavoritesCursor;
- (FRPersonalizationConfiguration)configurationStore;
- (OS_dispatch_queue)storeQueue;
- (TSLocationDetectionManagerType)locationManager;
- (id)_createNewAutoFavoritesOperation;
- (unint64_t)allowlistLevelForTagID:(id)a3;
- (unint64_t)whitelistLevelForTagID:(id)a3;
- (void)_processAutoFavoritesOperationResult:(id)a3 cursor:(id)a4 error:(id)a5 completion:(id)a6;
- (void)_saveReadableAllowlist;
- (void)addProgressivePersonalizationAutoFavorites:(id)a3 groupableSubscriptionForTagIDs:(id)a4 originProvider:(id)a5 completion:(id)a6;
- (void)configurationManager:(id)a3 appConfigurationDidChange:(id)a4;
- (void)fetchMappingResourcesWithCompletionHandler:(id)a3;
- (void)maybeRemovePersonalizationEngineData;
- (void)prepareAutoFavoritesWithLanguageChange:(BOOL)a3 completionHandler:(id)a4;
- (void)prepareFavorites:(id)a3;
- (void)prepareFavoritesWithLanguageChange:(BOOL)a3 completionHandler:(id)a4;
- (void)prepareForUseWithCompletionHandler:(id)a3;
- (void)processExistingData;
- (void)refreshAutoFavoritesInBackgroundDisregardingCache:(BOOL)a3;
- (void)setAggregateStore:(id)a3;
- (void)setAggregateStoreProvider:(id)a3;
- (void)setAppConfigurationManager:(id)a3;
- (void)setAutoFavoritesCursor:(id)a3;
- (void)setAutoFavoritesQueue:(id)a3;
- (void)setAutofavorites:(id)a3;
- (void)setBundleSubscriptionManager:(id)a3;
- (void)setCloudContext:(id)a3;
- (void)setConfigurableValues:(id)a3;
- (void)setConfigurationStore:(id)a3;
- (void)setDebugKeyValueStore:(id)a3;
- (void)setHourlyFlowRateHighWaterMarkValueStore:(id)a3;
- (void)setLocationManager:(id)a3;
- (void)setLocationObserver:(id)a3;
- (void)setPurchaseController:(id)a3;
- (void)setSubscriptionController:(id)a3;
- (void)setTagRanker:(id)a3;
- (void)setUserInfo:(id)a3;
- (void)subscriptionControllerDidResetToEmpty:(id)a3;
@end

@implementation FRFavoritesPersonalizer

- (FRFavoritesPersonalizer)initWithCloudContext:(id)a3
{
  id v4 = a3;
  if (!v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100072E3C();
  }
  v5 = FRURLForNewsPersonalizationDirectory();
  v6 = [(FRFavoritesPersonalizer *)self initWithCloudContext:v4 storePath:v5];

  return v6;
}

- (void)setLocationManager:(id)a3
{
  id v4 = (TSLocationDetectionManagerType *)a3;
  v5 = v4;
  if (v4)
  {
    v6 = [(TSLocationDetectionManagerType *)v4 observableMostFrequentLocation];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10002FECC;
    v10[3] = &unk_1000C6F78;
    v10[4] = self;
    v7 = [v6 observe:v10];
    [(FRFavoritesPersonalizer *)self setLocationObserver:v7];
  }
  else
  {
    v8 = [(FRFavoritesPersonalizer *)self locationObserver];
    [v8 dispose];

    [(FRFavoritesPersonalizer *)self setLocationObserver:0];
  }
  locationManager = self->_locationManager;
  self->_locationManager = v5;
}

- (void)maybeRemovePersonalizationEngineData
{
  v2 = FRURLForNewsAppCachesDirectory();
  v3 = [v2 path];
  id v4 = [v3 stringByAppendingPathComponent:@"PersonalizationStore"];

  v5 = +[NSFileManager defaultManager];
  LODWORD(v3) = [v5 fileExistsAtPath:v4];

  if (v3)
  {
    v6 = +[NSFileManager defaultManager];
    id v9 = 0;
    [v6 removeItemAtPath:v4 error:&v9];
    id v7 = v9;

    v8 = (void *)FCDefaultLog;
    if (os_log_type_enabled(FCDefaultLog, OS_LOG_TYPE_ERROR)) {
      sub_100073DAC(v8, v7);
    }
  }
}

- (void)fetchMappingResourcesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  +[NSThread isMainThread];
  [(id)objc_opt_class() logPPMessage:&stru_1000C6F98];
  v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  v13 = sub_100011BD8;
  v14 = &unk_1000C7100;
  v15 = self;
  long long v17 = xmmword_1000BD370;
  id v5 = v4;
  id v16 = v5;
  v6 = sub_100011BD8((uint64_t)&v11);
  id v7 = (void *)FCPersonalizationLog;
  if (os_log_type_enabled(FCPersonalizationLog, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    id v9 = [v6 shortOperationDescription:v11, v12];
    *(_DWORD *)buf = 138543362;
    v19 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Will issue fetch operation %{public}@ for mapping resources", buf, 0xCu);
  }
  v10 = +[NSOperationQueue fc_sharedConcurrentQueue];
  [v10 addOperation:v6];
}

- (void)refreshAutoFavoritesInBackgroundDisregardingCache:(BOOL)a3
{
  id v5 = [(FRFavoritesPersonalizer *)self cloudContext];
  v6 = [v5 appConfigurationManager];
  id v7 = [v6 possiblyUnfetchedAppConfiguration];
  unsigned int v8 = [v7 enableNewsPersonalizationAutoFavorites];

  if (v8)
  {
    sub_100032718();
  }
  else
  {
    id v9 = [(FRFavoritesPersonalizer *)self cloudContext];
    v10 = [v9 userInfo];
    v11 = [v10 canonicalLanguage];
    uint64_t v12 = +[FCAppleAccount sharedAccount];
    v13 = [v12 primaryLanguageCode];
    unsigned __int8 v14 = [v11 isEqualToString:v13];

    if (v14)
    {
      [(id)objc_opt_class() logPPMessage:&stru_1000C73A0];
      v15 = [(FRFavoritesPersonalizer *)self storeQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100005F50;
      block[3] = &unk_1000C7480;
      block[4] = self;
      BOOL v17 = a3;
      dispatch_async(v15, block);
    }
    else
    {
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_100032780;
      v18[3] = &unk_1000C5680;
      v18[4] = self;
      sub_100032780((uint64_t)v18);
    }
  }
}

- (FRFavoritesPersonalizer)initWithCloudContext:(id)a3 storePath:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v60.receiver = self;
  v60.super_class = (Class)FRFavoritesPersonalizer;
  id v9 = [(FRFavoritesPersonalizer *)&v60 init];
  if (v9)
  {
    if (NFInternalBuild())
    {
      v10 = +[NSFileManager defaultManager];
      v11 = FRURLForNewsPersonalizationDirectory();
      uint64_t v12 = [v11 URLByAppendingPathComponent:@"knowledgeC.db"];
      v13 = [v12 path];
      unsigned int v14 = [v10 fileExistsAtPath:v13];

      if (v14)
      {
        v15 = +[NSFileManager defaultManager];
        id v16 = FRURLForNewsPersonalizationDirectory();
        [v15 fc_quicklyClearDirectory:v16 callbackQueue:&_dispatch_main_q completion:&stru_1000C6E00];
      }
    }
    objc_storeStrong((id *)&v9->_cloudContext, a3);
    uint64_t v17 = [v7 subscriptionController];
    subscriptionController = v9->_subscriptionController;
    v9->_subscriptionController = (FCSubscriptionController *)v17;

    [(FCSubscriptionController *)v9->_subscriptionController addObserver:v9];
    uint64_t v19 = [v7 purchaseController];
    purchaseController = v9->_purchaseController;
    v9->_purchaseController = (FCPurchaseController *)v19;

    uint64_t v21 = [v7 bundleSubscriptionManager];
    bundleSubscriptionManager = v9->_bundleSubscriptionManager;
    v9->_bundleSubscriptionManager = (FCBundleSubscriptionManagerType *)v21;

    uint64_t v23 = [v7 userInfo];
    userInfo = v9->_userInfo;
    v9->_userInfo = (FCUserInfo *)v23;

    uint64_t v25 = [v7 appConfigurationManager];
    appConfigurationManager = v9->_appConfigurationManager;
    v9->_appConfigurationManager = (FCNewsAppConfigurationManager *)v25;

    dispatch_queue_t v27 = dispatch_queue_create("FRPersonalizationDataSource.store", 0);
    storeQueue = v9->_storeQueue;
    v9->_storeQueue = (OS_dispatch_queue *)v27;

    v29 = [(FRFavoritesPersonalizer *)v9 storeQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100013394;
    block[3] = &unk_1000C56D0;
    id v30 = v8;
    id v58 = v30;
    v31 = v9;
    v59 = v31;
    dispatch_async(v29, block);

    [(FCNewsAppConfigurationManager *)v9->_appConfigurationManager addAppConfigObserver:v31];
    uint64_t v32 = [v7 personalizationData];
    aggregateStore = v31->_aggregateStore;
    v31->_aggregateStore = (FCPersonalizationAggregateStore *)v32;

    id v34 = objc_alloc((Class)FCKeyValueStore);
    v35 = [v30 path];
    v36 = (FCKeyValueStore *)[v34 initWithName:@"HourlyFlowRateHighWaterMarks" directory:v35 version:1 options:0 classRegistry:0];
    hourlyFlowRateHighWaterMarkValueStore = v31->_hourlyFlowRateHighWaterMarkValueStore;
    v31->_hourlyFlowRateHighWaterMarkValueStore = v36;

    v38 = (FCAsyncSerialQueue *)[objc_alloc((Class)FCAsyncSerialQueue) initWithQualityOfService:25];
    autoFavoritesQueue = v31->_autoFavoritesQueue;
    v31->_autoFavoritesQueue = v38;

    v40 = +[NSUserDefaults standardUserDefaults];
    LODWORD(v35) = [v40 BOOLForKey:FCPersonalizationClearSuggestions];

    if (v35)
    {
      v41 = FCPersonalizationLog;
      if (os_log_type_enabled(FCPersonalizationLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Will clear suggestions", buf, 2u);
      }
      v42 = [(FRFavoritesPersonalizer *)v31 autoFavoritesQueue];
      v54[0] = _NSConcreteStackBlock;
      v54[1] = 3221225472;
      v54[2] = sub_10002F508;
      v54[3] = &unk_1000C6E78;
      v55 = v31;
      [v42 enqueueBlockForMainThread:v54];
    }
    v43 = FCPersonalizationLog;
    if (os_log_type_enabled(FCPersonalizationLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Will fetch mapping resources", buf, 2u);
    }
    v44 = [(FRFavoritesPersonalizer *)v31 autoFavoritesQueue];
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472;
    v52[2] = sub_10000A654;
    v52[3] = &unk_1000C6E78;
    v45 = v31;
    v53 = v45;
    [v44 enqueueBlock:v52];

    v46 = FCPersonalizationLog;
    if (os_log_type_enabled(FCPersonalizationLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Will process events from Today widget", buf, 2u);
    }
    v47 = [(FRFavoritesPersonalizer *)v45 autoFavoritesQueue];
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472;
    v50[2] = sub_100011FE8;
    v50[3] = &unk_1000C6E78;
    v48 = v45;
    v51 = v48;
    [v47 enqueueBlock:v50];

    [(FRFavoritesPersonalizer *)v48 processExistingData];
  }

  return v9;
}

- (FCAsyncSerialQueue)autoFavoritesQueue
{
  return self->_autoFavoritesQueue;
}

+ (void)logPPMessage:(id)a3
{
  id v4 = (void *)FCProgressivePersonalizationLog;
  if (os_log_type_enabled(FCProgressivePersonalizationLog, OS_LOG_TYPE_DEBUG))
  {
    id v5 = (void (*)(id))*((void *)a3 + 2);
    v6 = v4;
    id v7 = v5(a3);
    int v8 = 138412290;
    id v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v8, 0xCu);
  }
}

- (id)_createNewAutoFavoritesOperation
{
  v3 = objc_alloc_init(FRPersonalizationAutoFavoritesOperation);
  id v4 = [(FRFavoritesPersonalizer *)self autoFavoritesCursor];
  [(FRPersonalizationAutoFavoritesOperation *)v3 setCursor:v4];

  [(FRPersonalizationAutoFavoritesOperation *)v3 setSignalProcessingTimeInterval:21600.0];
  id v5 = [(FRFavoritesPersonalizer *)self configurableValues];
  [(FRPersonalizationAutoFavoritesOperation *)v3 setConfigurableValues:v5];

  v6 = [(FRFavoritesPersonalizer *)self configurationStore];
  id v7 = [v6 urlMapping];
  [(FRPersonalizationAutoFavoritesOperation *)v3 setUrlMapping:v7];

  int v8 = [(FRFavoritesPersonalizer *)self configurationStore];
  id v9 = [v8 bundleIDMapping];
  [(FRPersonalizationAutoFavoritesOperation *)v3 setBundleIDMapping:v9];

  v10 = [(FRFavoritesPersonalizer *)self configurationStore];
  v11 = [v10 whitelist];
  [(FRPersonalizationAutoFavoritesOperation *)v3 setWhitelist:v11];

  uint64_t v12 = [(FRFavoritesPersonalizer *)self configurationStore];
  v13 = [v12 favorabilityScores];
  [(FRPersonalizationAutoFavoritesOperation *)v3 setFavorabilityScores:v13];

  unsigned int v14 = [(FRFavoritesPersonalizer *)self cloudContext];
  v15 = [v14 localAreasManager];
  [(FRPersonalizationAutoFavoritesOperation *)v3 setLocalAreasManager:v15];

  id v16 = [(FRFavoritesPersonalizer *)self subscriptionController];
  [(FRPersonalizationAutoFavoritesOperation *)v3 setSubscriptionController:v16];

  uint64_t v17 = [(FRFavoritesPersonalizer *)self cloudContext];
  v18 = [v17 tagController];
  [(FRPersonalizationAutoFavoritesOperation *)v3 setTagController:v18];

  uint64_t v19 = [(FRFavoritesPersonalizer *)self userInfo];
  [(FRPersonalizationAutoFavoritesOperation *)v3 setUserInfo:v19];

  v20 = [(FRFavoritesPersonalizer *)self tagRanker];
  [(FRPersonalizationAutoFavoritesOperation *)v3 setTagRanker:v20];

  uint64_t v21 = [(FRFavoritesPersonalizer *)self aggregateStoreProvider];
  v22 = [v21 aggregateStore];
  [(FRPersonalizationAutoFavoritesOperation *)v3 setAggregateStore:v22];

  uint64_t v23 = [(FRFavoritesPersonalizer *)self locationManager];
  [(FRPersonalizationAutoFavoritesOperation *)v3 setLocationManager:v23];

  v24 = [(FRFavoritesPersonalizer *)self cloudContext];
  uint64_t v25 = [v24 appConfigurationManager];
  v26 = [v25 appConfiguration];
  [(FRPersonalizationAutoFavoritesOperation *)v3 setAppConfiguration:v26];

  return v3;
}

- (FCCloudContext)cloudContext
{
  return self->_cloudContext;
}

- (FRPersonalizationConfiguration)configurationStore
{
  return self->_configurationStore;
}

- (FCUserInfo)userInfo
{
  return self->_userInfo;
}

- (FCTagRanking)tagRanker
{
  return self->_tagRanker;
}

- (FCSubscriptionController)subscriptionController
{
  return self->_subscriptionController;
}

- (OS_dispatch_queue)storeQueue
{
  return self->_storeQueue;
}

- (void)setTagRanker:(id)a3
{
}

- (void)setLocationObserver:(id)a3
{
}

- (void)setConfigurationStore:(id)a3
{
}

- (void)setConfigurableValues:(id)a3
{
}

- (void)setAutoFavoritesCursor:(id)a3
{
}

- (void)setAggregateStoreProvider:(id)a3
{
}

- (void)processExistingData
{
}

- (TSLocationDetectionManagerType)locationManager
{
  return self->_locationManager;
}

- (FCPersonalizationTreatment)configurableValues
{
  return (FCPersonalizationTreatment *)objc_getProperty(self, a2, 56, 1);
}

- (FRPersonalizationAutoFavoritesCursor)autoFavoritesCursor
{
  return self->_autoFavoritesCursor;
}

- (FCNewsAppConfigurationManager)appConfigurationManager
{
  return self->_appConfigurationManager;
}

- (FCReadonlyAggregateStoreProviderType)aggregateStoreProvider
{
  return self->_aggregateStoreProvider;
}

- (void)_saveReadableAllowlist
{
  if (NFInternalBuild())
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10002F8D8;
    v3[3] = &unk_1000C5680;
    v3[4] = self;
    +[FCTaskScheduler scheduleLowPriorityBlock:v3];
  }
}

+ (BOOL)frozen
{
  if (qword_1000EDFA8 != -1) {
    dispatch_once(&qword_1000EDFA8, &stru_1000C6DC0);
  }
  return byte_1000EDFB0;
}

- (FRFavoritesPersonalizer)init
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    id v2 = [objc_alloc((Class)NSString) initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v6 = "-[FRFavoritesPersonalizer init]";
    __int16 v7 = 2080;
    int v8 = "FRFavoritesPersonalizer.m";
    __int16 v9 = 1024;
    int v10 = 277;
    __int16 v11 = 2114;
    id v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: %s", @"Do not call method", "-[FRFavoritesPersonalizer init]");
  id v4 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v3 userInfo:0];

  objc_exception_throw(v4);
}

- (void)setAutofavorites:(id)a3
{
  objc_storeStrong((id *)&self->_autofavorites, a3);
  id v5 = a3;
  id v6 = [(FRFavoritesPersonalizer *)self configurationStore];
  [v6 setAutoFavorites:v5];
}

- (void)prepareForUseWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (+[NSThread isMainThread]
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1000738F4();
  }
  id v5 = FCProgressivePersonalizationLog;
  if (os_log_type_enabled(FCProgressivePersonalizationLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Preparing personalization data source for use", buf, 2u);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100030424;
  block[3] = &unk_1000C6E28;
  id v13 = v4;
  id v6 = v4;
  dispatch_block_t v7 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  int v8 = [(FRFavoritesPersonalizer *)self aggregateStore];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000304A4;
  v10[3] = &unk_1000C5988;
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  [v8 prepareAggregatesForUseWithCompletionHandler:v10];
}

- (void)prepareFavorites:(id)a3
{
  id v4 = a3;
  id v5 = +[NSUserDefaults standardUserDefaults];
  id v6 = [v5 stringForKey:FCPrimaryLanguageKey];

  dispatch_block_t v7 = +[FCAppleAccount sharedAccount];
  int v8 = [v7 primaryLanguageCode];

  id v9 = FCTranslationLog;
  if (os_log_type_enabled(FCTranslationLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v34 = v6;
    __int16 v35 = 2114;
    v36 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Preparing favorites with last seen language %{public}@, current language %{public}@", buf, 0x16u);
  }
  int v10 = dispatch_group_create();
  id v11 = [(FRFavoritesPersonalizer *)self userInfo];
  id v12 = [v11 canonicalLanguage];
  if (v12) {
    uint64_t v13 = [v6 isEqualToString:v8] ^ 1;
  }
  else {
    uint64_t v13 = 1;
  }

  dispatch_group_enter(v10);
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1000308B0;
  v31[3] = &unk_1000C5680;
  unsigned int v14 = v10;
  uint64_t v32 = v14;
  [(FRFavoritesPersonalizer *)self prepareFavoritesWithLanguageChange:v13 completionHandler:v31];
  dispatch_group_enter(v14);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1000308B8;
  v29[3] = &unk_1000C5680;
  v15 = v14;
  id v30 = v15;
  [(FRFavoritesPersonalizer *)self prepareAutoFavoritesWithLanguageChange:v13 completionHandler:v29];
  objc_initWeak((id *)buf, self);
  if (FCDispatchGroupIsEmpty())
  {
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1000308C0;
    v24[3] = &unk_1000C7150;
    char v28 = v13;
    id v16 = &v27;
    objc_copyWeak(&v27, (id *)buf);
    id v25 = v8;
    id v26 = v4;
    sub_1000308C0((uint64_t)v24);
    uint64_t v17 = &v25;
    v18 = &v26;
  }
  else
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100030A5C;
    v19[3] = &unk_1000C7150;
    char v23 = v13;
    id v16 = &v22;
    objc_copyWeak(&v22, (id *)buf);
    uint64_t v17 = &v20;
    id v20 = v8;
    v18 = &v21;
    id v21 = v4;
    dispatch_group_notify(v15, (dispatch_queue_t)&_dispatch_main_q, v19);
  }

  objc_destroyWeak(v16);
  objc_destroyWeak((id *)buf);
}

- (void)prepareFavoritesWithLanguageChange:(BOOL)a3 completionHandler:(id)a4
{
  id v6 = a4;
  dispatch_block_t v7 = v6;
  if (a3)
  {
    objc_initWeak(&location, self);
    int v8 = [(FRFavoritesPersonalizer *)self cloudContext];
    id v9 = [v8 translationManager];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100030DF0;
    v10[3] = &unk_1000C72B8;
    objc_copyWeak(&v12, &location);
    id v11 = v7;
    [v9 fetchTranslationProvider:v10];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100030D70;
    v14[3] = &unk_1000C6E28;
    id v15 = v6;
    sub_100030D70((uint64_t)v14);
  }
}

- (void)prepareAutoFavoritesWithLanguageChange:(BOOL)a3 completionHandler:(id)a4
{
  id v6 = (void (**)(void))a4;
  if (!a3)
  {
    dispatch_block_t v7 = [(FRFavoritesPersonalizer *)self cloudContext];
    int v8 = [v7 userInfo];
    id v9 = [v8 canonicalLanguage];
    int v10 = +[FCAppleAccount sharedAccount];
    id v11 = [v10 primaryLanguageCode];
    unsigned __int8 v12 = [v9 isEqualToString:v11];

    if ((v12 & 1) == 0)
    {
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_1000320DC;
      v25[3] = &unk_1000C5988;
      v25[4] = self;
      id v26 = v6;
      sub_1000320DC((uint64_t)v25);
      id v16 = v26;
LABEL_14:

      goto LABEL_15;
    }
  }
  uint64_t v13 = FCProgressivePersonalizationLog;
  if (os_log_type_enabled(FCProgressivePersonalizationLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Getting in line to prepare personalization auto-favorites for use", buf, 2u);
  }
  if (+[NSThread isMainThread] || a3)
  {
LABEL_13:
    uint64_t v17 = [(FRFavoritesPersonalizer *)self storeQueue];
    v18 = v6;
    FCDispatchAsyncWithQoSPropagation();

    id v16 = v18;
    goto LABEL_14;
  }
  *(void *)buf = 0;
  id v22 = buf;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  unsigned int v14 = [(FRFavoritesPersonalizer *)self storeQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100032224;
  block[3] = &unk_1000C72E0;
  void block[4] = self;
  void block[5] = buf;
  dispatch_sync(v14, block);

  if (!v22[24])
  {
    _Block_object_dispose(buf, 8);
    goto LABEL_13;
  }
  id v15 = FCProgressivePersonalizationLog;
  if (os_log_type_enabled(FCProgressivePersonalizationLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v19 = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Auto-favorites have been generated in the past so nothing to prepare", v19, 2u);
  }
  v6[2](v6);
  _Block_object_dispose(buf, 8);
LABEL_15:
}

- (void)_processAutoFavoritesOperationResult:(id)a3 cursor:(id)a4 error:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  [(FRFavoritesPersonalizer *)self setAutofavorites:v10];
  if (a5)
  {
    id v21 = _NSConcreteStackBlock;
    uint64_t v22 = 3221225472;
    uint64_t v23 = sub_100032D80;
    char v24 = &unk_1000C6E28;
    id v25 = (void (**)(void))v12;
    v25[2]();
    uint64_t v13 = v25;
  }
  else
  {
    [(FRFavoritesPersonalizer *)self setAutoFavoritesCursor:v11];
    unsigned int v14 = [(FRFavoritesPersonalizer *)self storeQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100032D90;
    block[3] = &unk_1000C56D0;
    void block[4] = self;
    id v20 = (void (**)(void))v11;
    dispatch_sync(v14, block);

    id v15 = [v10 autoFavoriteTagIDs];
    id v16 = [v10 groupableFavoriteTagIDs];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100032E30;
    v17[3] = &unk_1000C74A8;
    id v18 = v10;
    [(FRFavoritesPersonalizer *)self addProgressivePersonalizationAutoFavorites:v15 groupableSubscriptionForTagIDs:v16 originProvider:v17 completion:v12];

    uint64_t v13 = v20;
  }
}

- (FCPersonalizationWhitelist)whitelist
{
  id v2 = [(FRFavoritesPersonalizer *)self configurationStore];
  v3 = [v2 whitelist];

  return (FCPersonalizationWhitelist *)v3;
}

- (FCPersonalizationWhitelist)allowlist
{
  id v2 = [(FRFavoritesPersonalizer *)self configurationStore];
  v3 = [v2 whitelist];

  return (FCPersonalizationWhitelist *)v3;
}

- (unint64_t)whitelistLevelForTagID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 2;
  id v5 = [(FRFavoritesPersonalizer *)self storeQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003317C;
  block[3] = &unk_1000C74D0;
  void block[4] = self;
  id v10 = v4;
  id v11 = &v12;
  id v6 = v4;
  dispatch_sync(v5, block);

  unint64_t v7 = v13[3];
  _Block_object_dispose(&v12, 8);
  return v7;
}

- (unint64_t)allowlistLevelForTagID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 2;
  id v5 = [(FRFavoritesPersonalizer *)self storeQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100033338;
  block[3] = &unk_1000C74D0;
  void block[4] = self;
  id v10 = v4;
  id v11 = &v12;
  id v6 = v4;
  dispatch_sync(v5, block);

  unint64_t v7 = v13[3];
  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)addProgressivePersonalizationAutoFavorites:(id)a3 groupableSubscriptionForTagIDs:(id)a4 originProvider:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v10 = v16;
  id v11 = v15;
  id v12 = v14;
  id v13 = v9;
  FCPerformBlockOnMainThread();
}

- (void)configurationManager:(id)a3 appConfigurationDidChange:(id)a4
{
  [a4 personalizationTreatment:a3];
  if (v5)
  {
    id v6 = [(FRFavoritesPersonalizer *)self storeQueue];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100033690;
    v7[3] = &unk_1000C56D0;
    v7[4] = self;
    id v8 = v5;
    dispatch_async(v6, v7);
  }
}

- (void)subscriptionControllerDidResetToEmpty:(id)a3
{
  id v4 = [(FRFavoritesPersonalizer *)self autoFavoritesQueue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100033720;
  v5[3] = &unk_1000C6E78;
  v5[4] = self;
  [v4 enqueueBlock:v5];
}

- (FCPersonalizationBundleIDMapping)bundleIDMapping
{
  id v2 = [(FRFavoritesPersonalizer *)self configurationStore];
  v3 = [v2 bundleIDMapping];

  return (FCPersonalizationBundleIDMapping *)v3;
}

- (FCPersonalizationURLMapping)urlMapping
{
  id v2 = [(FRFavoritesPersonalizer *)self configurationStore];
  v3 = [v2 urlMapping];

  return (FCPersonalizationURLMapping *)v3;
}

- (FRPersonalizationAutoFavorites)autofavorites
{
  return self->_autofavorites;
}

- (FCPersonalizationAggregateStore)aggregateStore
{
  return self->_aggregateStore;
}

- (void)setAggregateStore:(id)a3
{
}

- (FCKeyValueStore)hourlyFlowRateHighWaterMarkValueStore
{
  return self->_hourlyFlowRateHighWaterMarkValueStore;
}

- (void)setHourlyFlowRateHighWaterMarkValueStore:(id)a3
{
}

- (FCKeyValueStore)debugKeyValueStore
{
  return self->_debugKeyValueStore;
}

- (void)setDebugKeyValueStore:(id)a3
{
}

- (void)setCloudContext:(id)a3
{
}

- (void)setAppConfigurationManager:(id)a3
{
}

- (void)setSubscriptionController:(id)a3
{
}

- (FCPurchaseController)purchaseController
{
  return self->_purchaseController;
}

- (void)setPurchaseController:(id)a3
{
}

- (FCBundleSubscriptionManagerType)bundleSubscriptionManager
{
  return self->_bundleSubscriptionManager;
}

- (void)setBundleSubscriptionManager:(id)a3
{
}

- (void)setUserInfo:(id)a3
{
}

- (void)setAutoFavoritesQueue:(id)a3
{
}

- (FCDisposable)locationObserver
{
  return self->_locationObserver;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationObserver, 0);
  objc_storeStrong((id *)&self->_storeQueue, 0);
  objc_storeStrong((id *)&self->_autoFavoritesCursor, 0);
  objc_storeStrong((id *)&self->_autoFavoritesQueue, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_bundleSubscriptionManager, 0);
  objc_storeStrong((id *)&self->_purchaseController, 0);
  objc_storeStrong((id *)&self->_subscriptionController, 0);
  objc_storeStrong((id *)&self->_appConfigurationManager, 0);
  objc_storeStrong((id *)&self->_cloudContext, 0);
  objc_storeStrong((id *)&self->_debugKeyValueStore, 0);
  objc_storeStrong((id *)&self->_hourlyFlowRateHighWaterMarkValueStore, 0);
  objc_storeStrong((id *)&self->_configurableValues, 0);
  objc_storeStrong((id *)&self->_configurationStore, 0);
  objc_storeStrong((id *)&self->_aggregateStore, 0);
  objc_storeStrong((id *)&self->_autofavorites, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_tagRanker, 0);

  objc_storeStrong((id *)&self->_aggregateStoreProvider, 0);
}

@end