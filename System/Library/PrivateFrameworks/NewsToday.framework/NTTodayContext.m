@interface NTTodayContext
- (FCAsyncSerialQueue)fetchQueue;
- (FCContentContext)contentContext;
- (FCFeedPersonalizerFactoryType)feedPersonalizerFactory;
- (FCReadablePrivateDataStorage)readablePrivateDataStorage;
- (FCWritablePrivateDataStorage)writablePrivateDataStorage;
- (NTSourceAvailabilityManager)sourceAvailabilityManager;
- (NTTodayBannerValidator)todayBannerValidator;
- (NTTodayContext)init;
- (NTTodayContext)initWithContentContext:(id)a3 feedPersonalizerFactory:(id)a4 todayBannerValidator:(id)a5 processVariant:(unint64_t)a6 accessQueue:(id)a7 fetchQueue:(id)a8;
- (NTTodayResultsSource)todayResultsSource;
- (OS_dispatch_queue)accessQueue;
- (id)newResultsHandler;
- (id)placeholderResultsWithOperationInfo:(id)a3;
- (void)_setupTodayResultsSource;
- (void)fetchLatestResultsWithOperationInfo:(id)a3 completion:(id)a4;
- (void)fetchModuleDescriptorsWithCompletion:(id)a3;
- (void)networkReachabilityDidChange:(id)a3;
- (void)setNewResultsHandler:(id)a3;
- (void)setTodayResultsSource:(id)a3;
- (void)writeUserDidReadHeadlineWithAnalyticsElement:(id)a3 atDate:(id)a4 withCompletion:(id)a5;
- (void)writeUserDidSeeHeadlinesWithAnalyticsElements:(id)a3 atDate:(id)a4 withCompletion:(id)a5;
@end

@implementation NTTodayContext

void __65__NTTodayContext_fetchLatestResultsWithOperationInfo_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) todayResultsSource];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __65__NTTodayContext_fetchLatestResultsWithOperationInfo_completion___block_invoke_2;
  v4[3] = &unk_26475D1A8;
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 fetchLatestResultsWithOperationInfo:v3 completion:v4];
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

void __65__NTTodayContext_fetchLatestResultsWithOperationInfo_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v13 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = v11;
  if (v11) {
    NTPossiblySimulateCrashWithError(v11);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchLatestResultsWithOperationInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[NTTodayContext fetchLatestResultsWithOperationInfo:completion:]();
    if (v7) {
      goto LABEL_6;
    }
  }
  else if (v7)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTTodayContext fetchLatestResultsWithOperationInfo:completion:]();
  }
LABEL_6:
  v8 = [(NTTodayContext *)self accessQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__NTTodayContext_fetchLatestResultsWithOperationInfo_completion___block_invoke;
  block[3] = &unk_26475D1D0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (NTSourceAvailabilityManager)sourceAvailabilityManager
{
  return self->_sourceAvailabilityManager;
}

- (id)placeholderResultsWithOperationInfo:(id)a3
{
  id v4 = a3;
  id v5 = [(NTTodayContext *)self sourceAvailabilityManager];
  [v5 preferredSourceFetchDescriptorClass];
  id v6 = objc_opt_new();

  id v7 = [(NTTodayContext *)self contentContext];
  v8 = +[NTTodayResultsSource placeholderResultsWithFetchDescriptor:v6 contentContext:v7 operationInfo:v4];

  return v8;
}

- (NTTodayResultsSource)todayResultsSource
{
  return self->_todayResultsSource;
}

- (FCContentContext)contentContext
{
  return self->_contentContext;
}

- (NTTodayContext)init
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[NTTodayContext init]";
    __int16 v9 = 2080;
    id v10 = "NTTodayContext.m";
    __int16 v11 = 1024;
    int v12 = 95;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_22592C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  uint64_t v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF498];
  id v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[NTTodayContext init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (NTTodayContext)initWithContentContext:(id)a3 feedPersonalizerFactory:(id)a4 todayBannerValidator:(id)a5 processVariant:(unint64_t)a6 accessQueue:(id)a7 fetchQueue:(id)a8
{
  v44[1] = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v36 = a5;
  id v16 = a7;
  id v17 = a8;
  if (!v14 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[NTTodayContext initWithContentContext:feedPersonalizerFactory:todayBannerValidator:processVariant:accessQueue:fetchQueue:].cold.4();
    if (v15) {
      goto LABEL_6;
    }
  }
  else if (v15)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTTodayContext initWithContentContext:feedPersonalizerFactory:todayBannerValidator:processVariant:accessQueue:fetchQueue:]();
  }
LABEL_6:
  if (!v16 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[NTTodayContext initWithContentContext:feedPersonalizerFactory:todayBannerValidator:processVariant:accessQueue:fetchQueue:]();
    if (v17) {
      goto LABEL_11;
    }
  }
  else if (v17)
  {
    goto LABEL_11;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTTodayContext initWithContentContext:feedPersonalizerFactory:todayBannerValidator:processVariant:accessQueue:fetchQueue:]();
  }
LABEL_11:
  v42.receiver = self;
  v42.super_class = (Class)NTTodayContext;
  v18 = [(NTTodayContext *)&v42 init];
  if (v18)
  {
    NewsCoreUserDefaults();
    v19 = id v35 = v14;
    uint64_t v43 = *MEMORY[0x263F59338];
    v44[0] = MEMORY[0x263EFFA88];
    [NSDictionary dictionaryWithObjects:v44 forKeys:&v43 count:1];
    v20 = id v34 = v15;
    [v19 registerDefaults:v20];

    objc_storeStrong((id *)&v18->_contentContext, a3);
    objc_storeStrong((id *)&v18->_feedPersonalizerFactory, a4);
    objc_storeStrong((id *)&v18->_todayBannerValidator, a5);
    id v21 = objc_alloc(MEMORY[0x263F594D0]);
    v22 = FCURLForTodayPrivateDataTransactionQueue();
    v23 = (void *)[v21 initWithFileURL:v22];

    id v24 = objc_alloc(MEMORY[0x263F594C0]);
    v25 = FCURLForTodayDropbox();
    v26 = (void *)[v24 initWithFileURL:v25];

    uint64_t v27 = [objc_alloc(MEMORY[0x263F59680]) initWithDropbox:v26 transactionQueue:v23];
    writablePrivateDataStorage = v18->_writablePrivateDataStorage;
    v18->_writablePrivateDataStorage = (FCWritablePrivateDataStorage *)v27;

    uint64_t v29 = [objc_alloc(MEMORY[0x263F59608]) initWithDropbox:v26 transactionQueue:v23];
    readablePrivateDataStorage = v18->_readablePrivateDataStorage;
    v18->_readablePrivateDataStorage = (FCReadablePrivateDataStorage *)v29;

    objc_storeStrong((id *)&v18->_accessQueue, a7);
    objc_storeStrong((id *)&v18->_fetchQueue, a8);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __124__NTTodayContext_initWithContentContext_feedPersonalizerFactory_todayBannerValidator_processVariant_accessQueue_fetchQueue___block_invoke;
    block[3] = &unk_26475D130;
    dispatch_queue_t v40 = (dispatch_queue_t)v16;
    v31 = v18;
    v41 = v31;
    id v14 = v35;
    dispatch_sync(v40, block);
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __124__NTTodayContext_initWithContentContext_feedPersonalizerFactory_todayBannerValidator_processVariant_accessQueue_fetchQueue___block_invoke_4;
    v37[3] = &unk_26475C0C0;
    v32 = v31;
    id v15 = v34;
    v38 = v32;
    dispatch_async(MEMORY[0x263EF83A0], v37);
  }
  return v18;
}

void __124__NTTodayContext_initWithContentContext_feedPersonalizerFactory_todayBannerValidator_processVariant_accessQueue_fetchQueue___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263F59548] sharedNetworkReachability];
  uint64_t v3 = [[NTNewsSourceAvailabilityEntry alloc] initWithNetworkReachability:v2 queue:*(void *)(a1 + 32)];
  uint64_t v4 = objc_opt_new();
  id v5 = objc_msgSend(MEMORY[0x263EFF9D8], "orderedSetWithObjects:", v3, v4, 0);
  objc_initWeak(&location, *(id *)(a1 + 40));
  id v6 = [[NTSourceAvailabilityManager alloc] initWithAvailabilityEntriesInPreferredOrder:v5 queue:*(void *)(a1 + 32)];
  objc_storeStrong((id *)(*(void *)(a1 + 40) + 56), v6);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __124__NTTodayContext_initWithContentContext_feedPersonalizerFactory_todayBannerValidator_processVariant_accessQueue_fetchQueue___block_invoke_2;
  v7[3] = &unk_26475D0A0;
  id v8 = *(id *)(a1 + 32);
  objc_copyWeak(&v9, &location);
  [(NTSourceAvailabilityManager *)v6 setPreferredSourceChangedNotificationBlock:v7];
  [*(id *)(a1 + 40) _setupTodayResultsSource];
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
}

void __124__NTTodayContext_initWithContentContext_feedPersonalizerFactory_todayBannerValidator_processVariant_accessQueue_fetchQueue___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  FCPerformIfNonNil();
}

void __124__NTTodayContext_initWithContentContext_feedPersonalizerFactory_todayBannerValidator_processVariant_accessQueue_fetchQueue___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 _setupTodayResultsSource];
  v2 = [v4 newResultsHandler];

  if (v2)
  {
    uint64_t v3 = [v4 newResultsHandler];
    v3[2]();
  }
}

void __124__NTTodayContext_initWithContentContext_feedPersonalizerFactory_todayBannerValidator_processVariant_accessQueue_fetchQueue___block_invoke_4(uint64_t a1)
{
  id v2 = (id)objc_opt_new();
  [v2 addObserver:*(void *)(a1 + 32)];
}

- (void)networkReachabilityDidChange:(id)a3
{
  if ([a3 isNetworkReachable])
  {
    id v4 = [(NTTodayContext *)self accessQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __47__NTTodayContext_networkReachabilityDidChange___block_invoke;
    block[3] = &unk_26475C0C0;
    void block[4] = self;
    dispatch_async(v4, block);
  }
}

void __47__NTTodayContext_networkReachabilityDidChange___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) newResultsHandler];

  if (v2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) newResultsHandler];
    v3[2]();
  }
}

- (void)fetchModuleDescriptorsWithCompletion:(id)a3
{
  id v4 = a3;
  if (!v4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTTodayContext fetchModuleDescriptorsWithCompletion:]();
  }
  id v5 = [(NTTodayContext *)self accessQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__NTTodayContext_fetchModuleDescriptorsWithCompletion___block_invoke;
  v7[3] = &unk_26475D180;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __55__NTTodayContext_fetchModuleDescriptorsWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) todayResultsSource];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __55__NTTodayContext_fetchModuleDescriptorsWithCompletion___block_invoke_2;
  v3[3] = &unk_26475D158;
  id v4 = *(id *)(a1 + 40);
  [v2 fetchModuleDescriptorsWithCompletion:v3];
}

void __55__NTTodayContext_fetchModuleDescriptorsWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id v6 = v5;
  if (v5) {
    NTPossiblySimulateCrashWithError(v5);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)writeUserDidSeeHeadlinesWithAnalyticsElements:(id)a3 atDate:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[NTTodayContext writeUserDidSeeHeadlinesWithAnalyticsElements:atDate:withCompletion:]();
    if (v9) {
      goto LABEL_6;
    }
  }
  else if (v9)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTTodayContext writeUserDidSeeHeadlinesWithAnalyticsElements:atDate:withCompletion:]();
  }
LABEL_6:
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __86__NTTodayContext_writeUserDidSeeHeadlinesWithAnalyticsElements_atDate_withCompletion___block_invoke;
  v14[3] = &unk_26475D1F8;
  id v15 = v9;
  id v11 = v9;
  int v12 = objc_msgSend(v8, "fc_arrayByTransformingWithBlock:", v14);
  __int16 v13 = [(NTTodayContext *)self writablePrivateDataStorage];
  [v13 writeSeenHistoryItems:v12 withCompletion:v10];
}

id __86__NTTodayContext_writeUserDidSeeHeadlinesWithAnalyticsElements_atDate_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 needsSeenStateTracking])
  {
    objc_opt_class();
    id v4 = FCCheckedDynamicCast();
    id v5 = objc_opt_new();
    id v6 = [v4 articleID];
    [v5 setArticleID:v6];

    objc_msgSend(v5, "setMaxVersionSeen:", objc_msgSend(v4, "articleVersion"));
    [v5 setFirstSeenAt:*(void *)(a1 + 32)];
    [v5 setFirstSeenAtOfMaxVersionSeen:*(void *)(a1 + 32)];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)writeUserDidReadHeadlineWithAnalyticsElement:(id)a3 atDate:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[NTTodayContext writeUserDidReadHeadlineWithAnalyticsElement:atDate:withCompletion:]();
    if (v9) {
      goto LABEL_6;
    }
  }
  else if (v9)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTTodayContext writeUserDidReadHeadlineWithAnalyticsElement:atDate:withCompletion:]();
  }
LABEL_6:
  id v11 = objc_opt_new();
  int v12 = [v8 articleID];
  [v11 setArticleID:v12];

  objc_msgSend(v11, "setMaxVersionRead:", objc_msgSend(v8, "articleVersion"));
  [v11 setLastVisitedAt:v9];
  id v13 = v11;
  id v14 = [(NTTodayContext *)self writablePrivateDataStorage];
  [v14 writeReadHistoryItem:v13 withCompletion:v10];
}

- (void)_setupTodayResultsSource
{
  id v3 = [(NTTodayContext *)self sourceAvailabilityManager];
  [v3 preferredSourceFetchDescriptorClass];
  id v12 = (id)objc_opt_new();

  id v4 = [NTTodayResultsSource alloc];
  id v5 = [(NTTodayContext *)self feedPersonalizerFactory];
  id v6 = [(NTTodayContext *)self todayBannerValidator];
  id v7 = [(NTTodayContext *)self readablePrivateDataStorage];
  id v8 = [(NTTodayContext *)self contentContext];
  id v9 = [(NTTodayContext *)self fetchQueue];
  id v10 = [(NTTodayResultsSource *)v4 initWithFetchDescriptor:v12 feedPersonalizerFactory:v5 todayBannerValidator:v6 privateDataStorage:v7 contentContext:v8 fetchQueue:v9];
  todayResultsSource = self->_todayResultsSource;
  self->_todayResultsSource = v10;
}

- (id)newResultsHandler
{
  return self->_newResultsHandler;
}

- (void)setNewResultsHandler:(id)a3
{
}

- (FCFeedPersonalizerFactoryType)feedPersonalizerFactory
{
  return self->_feedPersonalizerFactory;
}

- (NTTodayBannerValidator)todayBannerValidator
{
  return self->_todayBannerValidator;
}

- (FCReadablePrivateDataStorage)readablePrivateDataStorage
{
  return self->_readablePrivateDataStorage;
}

- (FCWritablePrivateDataStorage)writablePrivateDataStorage
{
  return self->_writablePrivateDataStorage;
}

- (void)setTodayResultsSource:(id)a3
{
}

- (FCAsyncSerialQueue)fetchQueue
{
  return self->_fetchQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_todayResultsSource, 0);
  objc_storeStrong((id *)&self->_sourceAvailabilityManager, 0);
  objc_storeStrong((id *)&self->_writablePrivateDataStorage, 0);
  objc_storeStrong((id *)&self->_readablePrivateDataStorage, 0);
  objc_storeStrong((id *)&self->_todayBannerValidator, 0);
  objc_storeStrong((id *)&self->_feedPersonalizerFactory, 0);
  objc_storeStrong((id *)&self->_contentContext, 0);

  objc_storeStrong(&self->_newResultsHandler, 0);
}

- (void)initWithContentContext:feedPersonalizerFactory:todayBannerValidator:processVariant:accessQueue:fetchQueue:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"fetchQueue", v6, 2u);
}

- (void)initWithContentContext:feedPersonalizerFactory:todayBannerValidator:processVariant:accessQueue:fetchQueue:.cold.2()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"accessQueue", v6, 2u);
}

- (void)initWithContentContext:feedPersonalizerFactory:todayBannerValidator:processVariant:accessQueue:fetchQueue:.cold.3()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"feedPersonalizerFactory", v6, 2u);
}

- (void)initWithContentContext:feedPersonalizerFactory:todayBannerValidator:processVariant:accessQueue:fetchQueue:.cold.4()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"contentContext", v6, 2u);
}

- (void)fetchModuleDescriptorsWithCompletion:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"completion", v6, 2u);
}

- (void)fetchLatestResultsWithOperationInfo:completion:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"completion", v6, 2u);
}

- (void)fetchLatestResultsWithOperationInfo:completion:.cold.2()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"operationInfo", v6, 2u);
}

- (void)writeUserDidSeeHeadlinesWithAnalyticsElements:atDate:withCompletion:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"date", v6, 2u);
}

- (void)writeUserDidSeeHeadlinesWithAnalyticsElements:atDate:withCompletion:.cold.2()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"analyticsElements", v6, 2u);
}

- (void)writeUserDidReadHeadlineWithAnalyticsElement:atDate:withCompletion:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"date", v6, 2u);
}

- (void)writeUserDidReadHeadlineWithAnalyticsElement:atDate:withCompletion:.cold.2()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"analyticsElement", v6, 2u);
}

@end