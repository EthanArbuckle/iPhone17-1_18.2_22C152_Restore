@interface NTTodayResultsSource
+ (id)placeholderResultsWithFetchDescriptor:(id)a3 contentContext:(id)a4 operationInfo:(id)a5;
- (BOOL)hasFlushingBeenEnabled;
- (FCAsyncSerialQueue)serialQueue;
- (FCContentContext)contentContext;
- (FCFeedPersonalizerFactoryType)feedPersonalizerFactory;
- (FCReadablePrivateDataStorage)privateDataStorage;
- (NSObject)latestResultRecordsHoldToken;
- (NTTodayBannerValidator)todayBannerValidator;
- (NTTodayResultsFetchDescriptor)fetchDescriptor;
- (NTTodayResultsSource)init;
- (NTTodayResultsSource)initWithFetchDescriptor:(id)a3 feedPersonalizerFactory:(id)a4 todayBannerValidator:(id)a5 privateDataStorage:(id)a6 contentContext:(id)a7 fetchQueue:(id)a8;
- (id)placeholderResultsWithOperationInfo:(id)a3;
- (void)_fetchLatestResultsWithOperationInfo:(id)a3 prefetchedContent:(id)a4 completion:(id)a5;
- (void)_fetchTodayModuleDescriptorsWithContentRequest:(id)a3 requireRefreshedAppConfig:(BOOL)a4 qualityOfService:(int64_t)a5 completion:(id)a6;
- (void)fetchLatestResultsWithOperationInfo:(id)a3 completion:(id)a4;
- (void)fetchModuleDescriptorsWithCompletion:(id)a3;
- (void)setFlushingHasBeenEnabled:(BOOL)a3;
- (void)setLatestResultRecordsHoldToken:(id)a3;
@end

@implementation NTTodayResultsSource

- (FCContentContext)contentContext
{
  return self->_contentContext;
}

void __71__NTTodayResultsSource_fetchLatestResultsWithOperationInfo_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v5 = [v4 BOOLForKey:@"marker"];
  [v4 setBool:1 forKey:@"marker"];
  v6 = *(void **)(a1 + 32);
  v7 = [*(id *)(a1 + 40) request];
  uint64_t v8 = [*(id *)(a1 + 48) qualityOfService];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __71__NTTodayResultsSource_fetchLatestResultsWithOperationInfo_completion___block_invoke_2;
  v11[3] = &unk_26475C3A8;
  v11[4] = *(void *)(a1 + 32);
  id v14 = *(id *)(a1 + 56);
  id v15 = v3;
  id v12 = *(id *)(a1 + 40);
  id v13 = v4;
  id v9 = v4;
  id v10 = v3;
  [v6 _fetchTodayModuleDescriptorsWithContentRequest:v7 requireRefreshedAppConfig:v5 qualityOfService:v8 completion:v11];
}

uint64_t __91__NTTodayResultsSource_placeholderResultsWithFetchDescriptor_contentContext_operationInfo___block_invoke()
{
  return objc_msgSend(MEMORY[0x263EFF8C0], "fc_array:", &__block_literal_global_38);
}

void __71__NTTodayResultsSource_fetchLatestResultsWithOperationInfo_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  if (v6)
  {
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __71__NTTodayResultsSource_fetchLatestResultsWithOperationInfo_completion___block_invoke_3;
    v17[3] = &unk_26475C358;
    v17[4] = *(void *)(a1 + 32);
    id v19 = *(id *)(a1 + 56);
    id v18 = v6;
    id v20 = *(id *)(a1 + 64);
    __71__NTTodayResultsSource_fetchLatestResultsWithOperationInfo_completion___block_invoke_3((uint64_t)v17);

    v7 = v19;
  }
  else
  {
    uint64_t v8 = *(void **)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __71__NTTodayResultsSource_fetchLatestResultsWithOperationInfo_completion___block_invoke_4;
    v12[3] = &unk_26475C380;
    id v10 = *(id *)(a1 + 48);
    uint64_t v11 = *(void *)(a1 + 32);
    id v13 = v10;
    uint64_t v14 = v11;
    id v15 = *(id *)(a1 + 56);
    id v16 = *(id *)(a1 + 64);
    [v8 _fetchLatestResultsWithOperationInfo:v9 prefetchedContent:a3 completion:v12];

    v7 = v13;
  }
}

NTSection *__91__NTTodayResultsSource_placeholderResultsWithFetchDescriptor_contentContext_operationInfo___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) aggregatedItemsBySectionDescriptor];
  uint64_t v5 = [v4 objectForKeyedSubscript:v3];

  if ([v5 count])
  {
    if ([*(id *)(a1 + 40) allowSectionTitles])
    {
      if ([*(id *)(a1 + 40) preferCompactSectionName]) {
        [v3 compactName];
      }
      else {
      uint64_t v7 = [v3 name];
      }
    }
    else
    {
      uint64_t v7 = 0;
    }
    v24 = (void *)v7;
    uint64_t v8 = objc_opt_new();
    [v8 setName:v7];
    uint64_t v9 = [v3 nameColorLight];
    [v8 setNameColorLight:v9];

    id v10 = [v3 nameColorDark];
    [v8 setNameColorDark:v10];

    uint64_t v11 = [v3 actionTitle];
    [v8 setActionTitle:v11];

    id v12 = [v3 actionURL];
    [v8 setActionURL:v12];

    v22 = [NTSection alloc];
    v21 = [v3 identifier];
    id v13 = [v3 subidentifier];
    uint64_t v14 = [v3 actionTitle];
    id v15 = [v3 actionURL];
    id v16 = [v3 personalizationFeatureID];
    v17 = [MEMORY[0x263EFF9D8] orderedSetWithArray:v5];
    [v3 referralBarName];
    id v18 = v23 = v5;
    id v19 = [v3 backingTagID];
    id v6 = [(NTSection *)v22 initWithIdentifier:v21 subidentifier:v13 actionTitle:v14 actionURL:v15 personalizationFeatureID:v16 items:v17 rankingFeedback:0 displayDescriptor:v8 referralBarName:v18 backingTagID:v19];

    uint64_t v5 = v23;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

void __91__NTTodayResultsSource_placeholderResultsWithFetchDescriptor_contentContext_operationInfo___block_invoke_2(uint64_t a1, void *a2)
{
  id v9 = a2;
  uint64_t v2 = 10;
  do
  {
    id v3 = [NTHeadline alloc];
    v4 = [MEMORY[0x263F08C38] UUID];
    uint64_t v5 = [v4 UUIDString];
    id v6 = [(NTHeadline *)v3 initWithIdentifier:v5];

    uint64_t v7 = objc_msgSend(@"—", "fc_stringByMultiplyingStringByCount:", 500);
    [(NTHeadline *)v6 setTitle:v7];

    uint64_t v8 = objc_msgSend(@"—", "fc_stringByMultiplyingStringByCount:", 8);
    [(NTHeadline *)v6 setSourceName:v8];

    [(NTHeadline *)v6 setNeedsPlaceholderThumbnail:1];
    [v9 addObject:v6];

    --v2;
  }
  while (v2);
}

- (void)fetchLatestResultsWithOperationInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)[v6 copy];
  id v9 = [v8 request];

  if (!v9)
  {
    id v10 = objc_msgSend(MEMORY[0x263F5A358], "nt_defaultModule");
    uint64_t v11 = [v10 availableContents];
    id v12 = objc_msgSend(v11, "fc_onlyObject");
    id v13 = [v12 request];
    [v8 setRequest:v13];
  }
  uint64_t v14 = (void *)MEMORY[0x263F59388];
  uint64_t v20 = MEMORY[0x263EF8330];
  uint64_t v21 = 3221225472;
  v22 = __71__NTTodayResultsSource_fetchLatestResultsWithOperationInfo_completion___block_invoke;
  v23 = &unk_26475C3D0;
  v24 = self;
  id v25 = v8;
  id v26 = v6;
  id v27 = v7;
  id v15 = v7;
  id v16 = v6;
  id v17 = v8;
  id v18 = [v14 asyncBlockOperationWithBlock:&v20];
  objc_msgSend(v18, "setQualityOfService:", objc_msgSend(v16, "qualityOfService", v20, v21, v22, v23, v24));
  id v19 = [(NTTodayResultsSource *)self serialQueue];
  [v19 enqueueOperation:v18];
}

+ (id)placeholderResultsWithFetchDescriptor:(id)a3 contentContext:(id)a4 operationInfo:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v7 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    +[NTTodayResultsSource placeholderResultsWithFetchDescriptor:contentContext:operationInfo:]();
    if (v8) {
      goto LABEL_6;
    }
  }
  else if (v8)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    +[NTTodayResultsSource placeholderResultsWithFetchDescriptor:contentContext:operationInfo:]();
  }
LABEL_6:
  if (!v9 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    +[NTTodayResultsSource placeholderResultsWithFetchDescriptor:contentContext:operationInfo:]();
  }
  id v10 = [v9 request];
  uint64_t v11 = v7;
  id v12 = [v7 placeholderSectionDescriptorsWithContentRequest:v10];

  uint64_t v13 = objc_msgSend(v12, "fc_dictionaryWithValueBlock:", &__block_literal_global_1);
  uint64_t v14 = objc_opt_new();
  id v15 = [v9 sectionSlotCostInfo];
  [v14 setSectionSlotCostInfo:v15];

  objc_msgSend(v14, "setRespectMinMaxLimit:", objc_msgSend(v9, "respectsWidgetSlotsLimit"));
  [v9 slotsLimit];
  objc_msgSend(v14, "setSlotsLimit:");
  objc_msgSend(v14, "setAllowSectionTitles:", objc_msgSend(v9, "allowSectionTitles"));
  [v9 bannerSlotCost];
  objc_msgSend(v14, "setBannerSlotCost:");
  if ([v14 hasBannerSlotCost])
  {
    [v14 bannerSlotCost];
    double v17 = v16;
    [v14 slotsLimit];
    [v14 setSlotsLimit:v18 - v17];
  }
  id v19 = [NTNewsTodayResultsExplicitAllocationAggregator alloc];
  uint64_t v20 = objc_msgSend(v8, "news_core_ConfigurationManager");
  uint64_t v21 = [MEMORY[0x263EFF910] date];
  v39 = [(NTNewsTodayResultsExplicitAllocationAggregator *)v19 initWithConfigurationManager:v20 feedPersonalizer:0 filterDate:v21 todayData:0];

  v22 = [NTNewsTodayResultsContentFillAggregator alloc];
  [v9 minHeadlineScale];
  double v24 = v23;
  [v9 maxHeadlineScale];
  id v26 = [(NTNewsTodayResultsContentFillAggregator *)v22 initWithAggregator:v39 minHeadlineScale:v24 maxHeadlineScale:v25];
  id v27 = [(NTNewsTodayResultsContentFillAggregator *)v26 aggregateSections:v12 itemsBySectionDescriptor:v13 budgetInfo:v14];
  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = __91__NTTodayResultsSource_placeholderResultsWithFetchDescriptor_contentContext_operationInfo___block_invoke_3;
  v40[3] = &unk_26475C438;
  id v41 = v27;
  id v42 = v9;
  id v28 = v9;
  id v29 = v27;
  objc_msgSend(v12, "fc_orderedSetByTransformingWithBlock:", v40);
  v30 = v38 = (void *)v13;
  v37 = v12;
  v31 = [NTTodayResults alloc];
  [v7 sourceIdentifier];
  v33 = v32 = v8;
  v34 = [MEMORY[0x263EFF910] distantFuture];
  [v29 headlineScale];
  v35 = -[NTTodayResults initWithSourceIdentifier:sections:expirationDate:headlineScale:](v31, "initWithSourceIdentifier:sections:expirationDate:headlineScale:", v33, v30, v34);

  return v35;
}

- (NTTodayResultsSource)init
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    uint64_t v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    id v8 = "-[NTTodayResultsSource init]";
    __int16 v9 = 2080;
    id v10 = "NTTodayResultsSource.m";
    __int16 v11 = 1024;
    int v12 = 60;
    __int16 v13 = 2114;
    uint64_t v14 = v2;
    _os_log_error_impl(&dword_22592C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF498];
  uint64_t v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[NTTodayResultsSource init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (NTTodayResultsSource)initWithFetchDescriptor:(id)a3 feedPersonalizerFactory:(id)a4 todayBannerValidator:(id)a5 privateDataStorage:(id)a6 contentContext:(id)a7 fetchQueue:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v25 = a5;
  id v16 = a6;
  id v17 = a7;
  id obj = a8;
  id v18 = a8;
  if (!v14 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[NTTodayResultsSource initWithFetchDescriptor:feedPersonalizerFactory:todayBannerValidator:privateDataStorage:contentContext:fetchQueue:].cold.5();
    if (v15) {
      goto LABEL_6;
    }
  }
  else if (v15)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTTodayResultsSource initWithFetchDescriptor:feedPersonalizerFactory:todayBannerValidator:privateDataStorage:contentContext:fetchQueue:].cold.4();
  }
LABEL_6:
  if (!v16 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[NTTodayResultsSource initWithFetchDescriptor:feedPersonalizerFactory:todayBannerValidator:privateDataStorage:contentContext:fetchQueue:]();
    if (v17) {
      goto LABEL_11;
    }
  }
  else if (v17)
  {
    goto LABEL_11;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTTodayResultsSource initWithFetchDescriptor:feedPersonalizerFactory:todayBannerValidator:privateDataStorage:contentContext:fetchQueue:]();
  }
LABEL_11:
  if (!v18 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTTodayResultsSource initWithFetchDescriptor:feedPersonalizerFactory:todayBannerValidator:privateDataStorage:contentContext:fetchQueue:]();
  }
  v26.receiver = self;
  v26.super_class = (Class)NTTodayResultsSource;
  id v19 = [(NTTodayResultsSource *)&v26 init];
  if (v19)
  {
    uint64_t v20 = [v14 copy];
    fetchDescriptor = v19->_fetchDescriptor;
    v19->_fetchDescriptor = (NTTodayResultsFetchDescriptor *)v20;

    objc_storeStrong((id *)&v19->_feedPersonalizerFactory, a4);
    objc_storeStrong((id *)&v19->_todayBannerValidator, a5);
    objc_storeStrong((id *)&v19->_privateDataStorage, a6);
    objc_storeStrong((id *)&v19->_contentContext, a7);
    objc_storeStrong((id *)&v19->_serialQueue, obja);
  }

  return v19;
}

- (void)fetchModuleDescriptorsWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x263F59388];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __61__NTTodayResultsSource_fetchModuleDescriptorsWithCompletion___block_invoke;
  v9[3] = &unk_26475C330;
  id v10 = v4;
  uint64_t v11 = 25;
  v9[4] = self;
  id v6 = v4;
  id v7 = [v5 asyncBlockOperationWithBlock:v9];
  [v7 setQualityOfService:25];
  id v8 = [(NTTodayResultsSource *)self serialQueue];
  [v8 enqueueOperation:v7];
}

void __61__NTTodayResultsSource_fetchModuleDescriptorsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 48);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__NTTodayResultsSource_fetchModuleDescriptorsWithCompletion___block_invoke_2;
  v7[3] = &unk_26475C308;
  uint64_t v5 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v9 = v3;
  id v6 = v3;
  [v5 _fetchTodayModuleDescriptorsWithContentRequest:0 requireRefreshedAppConfig:0 qualityOfService:v4 completion:v7];
}

uint64_t __61__NTTodayResultsSource_fetchModuleDescriptorsWithCompletion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

void __71__NTTodayResultsSource_fetchLatestResultsWithOperationInfo_completion___block_invoke_3(uint64_t a1)
{
  id v4 = (id)objc_opt_new();
  uint64_t v2 = [*(id *)(a1 + 32) fetchDescriptor];
  id v3 = [v2 sourceIdentifier];
  [v4 setTodaySourceIdentifier:v3];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __71__NTTodayResultsSource_fetchLatestResultsWithOperationInfo_completion___block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v16 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  [*(id *)(a1 + 32) setBool:0 forKey:@"marker"];
  id v12 = v10;
  __int16 v13 = v12;
  if (!v12)
  {
    __int16 v13 = objc_opt_new();
    id v14 = [*(id *)(a1 + 40) fetchDescriptor];
    id v15 = [v14 sourceIdentifier];
    [v13 setTodaySourceIdentifier:v15];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (id)placeholderResultsWithOperationInfo:(id)a3
{
  id v4 = a3;
  if (!v4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTTodayResultsSource placeholderResultsWithOperationInfo:]();
  }
  uint64_t v5 = objc_opt_class();
  id v6 = [(NTTodayResultsSource *)self fetchDescriptor];
  id v7 = [(NTTodayResultsSource *)self contentContext];
  id v8 = [v5 placeholderResultsWithFetchDescriptor:v6 contentContext:v7 operationInfo:v4];

  return v8;
}

- (void)_fetchTodayModuleDescriptorsWithContentRequest:(id)a3 requireRefreshedAppConfig:(BOOL)a4 qualityOfService:(int64_t)a5 completion:(id)a6
{
  BOOL v7 = a4;
  id v10 = a6;
  id v11 = a3;
  id v15 = [(NTTodayResultsSource *)self fetchDescriptor];
  id v12 = [(NTTodayResultsSource *)self contentContext];
  [v15 descriptorsOperationClass];
  __int16 v13 = objc_opt_new();
  [v13 setContentRequest:v11];

  [v13 setContentContext:v12];
  id v14 = [(NTTodayResultsSource *)self privateDataStorage];
  [v13 setPrivateDataStorage:v14];

  [v13 setRequireRefreshedAppConfig:v7];
  [v13 setQualityOfService:a5];
  [v13 setRelativePriority:FCInferRelativePriorityFromQualityOfService()];
  [v13 setDescriptorsCompletion:v10];

  [v13 start];
}

- (void)_fetchLatestResultsWithOperationInfo:(id)a3 prefetchedContent:(id)a4 completion:(id)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = NTSharedLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    [v8 slotsLimit];
    *(_DWORD *)buf = 134217984;
    uint64_t v24 = v12;
    _os_log_impl(&dword_22592C000, v11, OS_LOG_TYPE_INFO, "Requesting %f slots from headline results source", buf, 0xCu);
  }

  if (!v8 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[NTTodayResultsSource _fetchLatestResultsWithOperationInfo:prefetchedContent:completion:]();
    if (v9) {
      goto LABEL_8;
    }
  }
  else if (v9)
  {
    goto LABEL_8;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTTodayResultsSource _fetchLatestResultsWithOperationInfo:prefetchedContent:completion:]();
  }
LABEL_8:
  __int16 v13 = [(NTTodayResultsSource *)self fetchDescriptor];
  id v14 = [(NTTodayResultsSource *)self contentContext];
  [v13 fetchOperationClass];
  id v15 = objc_opt_new();
  [v15 setContentContext:v14];
  id v16 = [(NTTodayResultsSource *)self feedPersonalizerFactory];
  [v15 setFeedPersonalizerFactory:v16];

  id v17 = [(NTTodayResultsSource *)self todayBannerValidator];
  [v15 setTodayBannerValidator:v17];

  [v15 setPrefetchedContent:v10];
  [v15 setOperationInfo:v8];
  objc_msgSend(v15, "setQualityOfService:", objc_msgSend(v8, "qualityOfService"));
  [v15 setRelativePriority:FCInferRelativePriorityFromQualityOfService()];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __90__NTTodayResultsSource__fetchLatestResultsWithOperationInfo_prefetchedContent_completion___block_invoke;
  v20[3] = &unk_26475C488;
  v20[4] = self;
  id v21 = v14;
  id v22 = v9;
  id v18 = v9;
  id v19 = v14;
  [v15 setHeadlineResultCompletionHandler:v20];
  [v15 start];
}

void __90__NTTodayResultsSource__fetchLatestResultsWithOperationInfo_prefetchedContent_completion___block_invoke(id *a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  __int16 v13 = NTSharedLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v35 = v9;
    _os_log_impl(&dword_22592C000, v13, OS_LOG_TYPE_INFO, "Fetched %{public}@", buf, 0xCu);
  }

  if (v12)
  {
    id v14 = NTSharedLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v35 = v12;
      _os_log_impl(&dword_22592C000, v14, OS_LOG_TYPE_ERROR, "Attempt to fetch completed with error %@", buf, 0xCu);
    }
  }
  if (([a1[4] hasFlushingBeenEnabled] & 1) == 0)
  {
    id v15 = NTSharedLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22592C000, v15, OS_LOG_TYPE_INFO, "Enabling flushing with zero interest threshold", buf, 2u);
    }

    id v16 = [a1[5] assetManager];
    [v16 enableFlushingWithFlushingThreshold:1];
    [a1[5] enableFlushingWithFlushingThreshold:0 exceptForFlusher:v16];
    [a1[4] setFlushingHasBeenEnabled:1];
  }
  id v17 = [v9 assetsHoldToken];
  id v18 = [v9 recordsHoldToken];
  [a1[4] setLatestResultRecordsHoldToken:v18];

  dispatch_time_t v19 = dispatch_time(0, 20000000);
  uint64_t v20 = FCDispatchQueueForQualityOfService();
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __90__NTTodayResultsSource__fetchLatestResultsWithOperationInfo_prefetchedContent_completion___block_invoke_57;
  v27[3] = &unk_26475C460;
  id v21 = a1[6];
  id v28 = v9;
  id v29 = v10;
  id v30 = v11;
  id v31 = v12;
  id v32 = v17;
  id v33 = v21;
  id v22 = v17;
  id v23 = v12;
  id v24 = v11;
  id v25 = v10;
  id v26 = v9;
  dispatch_after(v19, v20, v27);
}

uint64_t __90__NTTodayResultsSource__fetchLatestResultsWithOperationInfo_prefetchedContent_completion___block_invoke_57(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(a1[9] + 16))(a1[9], a1[4], a1[5], a1[6], a1[7]);
}

- (NTTodayResultsFetchDescriptor)fetchDescriptor
{
  return self->_fetchDescriptor;
}

- (FCFeedPersonalizerFactoryType)feedPersonalizerFactory
{
  return self->_feedPersonalizerFactory;
}

- (NTTodayBannerValidator)todayBannerValidator
{
  return self->_todayBannerValidator;
}

- (FCReadablePrivateDataStorage)privateDataStorage
{
  return self->_privateDataStorage;
}

- (FCAsyncSerialQueue)serialQueue
{
  return self->_serialQueue;
}

- (BOOL)hasFlushingBeenEnabled
{
  return self->_flushingHasBeenEnabled;
}

- (void)setFlushingHasBeenEnabled:(BOOL)a3
{
  self->_flushingHasBeenEnabled = a3;
}

- (NSObject)latestResultRecordsHoldToken
{
  return self->_latestResultRecordsHoldToken;
}

- (void)setLatestResultRecordsHoldToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestResultRecordsHoldToken, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_contentContext, 0);
  objc_storeStrong((id *)&self->_privateDataStorage, 0);
  objc_storeStrong((id *)&self->_todayBannerValidator, 0);
  objc_storeStrong((id *)&self->_feedPersonalizerFactory, 0);

  objc_storeStrong((id *)&self->_fetchDescriptor, 0);
}

- (void)initWithFetchDescriptor:feedPersonalizerFactory:todayBannerValidator:privateDataStorage:contentContext:fetchQueue:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"fetchQueue", v6, 2u);
}

- (void)initWithFetchDescriptor:feedPersonalizerFactory:todayBannerValidator:privateDataStorage:contentContext:fetchQueue:.cold.2()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"contentContext", v6, 2u);
}

- (void)initWithFetchDescriptor:feedPersonalizerFactory:todayBannerValidator:privateDataStorage:contentContext:fetchQueue:.cold.3()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"privateDataStorage", v6, 2u);
}

- (void)initWithFetchDescriptor:feedPersonalizerFactory:todayBannerValidator:privateDataStorage:contentContext:fetchQueue:.cold.4()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"feedPersonalizerFactory", v6, 2u);
}

- (void)initWithFetchDescriptor:feedPersonalizerFactory:todayBannerValidator:privateDataStorage:contentContext:fetchQueue:.cold.5()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"fetchDescriptor", v6, 2u);
}

- (void)placeholderResultsWithOperationInfo:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"operationInfo != nil", v6, 2u);
}

+ (void)placeholderResultsWithFetchDescriptor:contentContext:operationInfo:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"operationInfo != nil", v6, 2u);
}

+ (void)placeholderResultsWithFetchDescriptor:contentContext:operationInfo:.cold.2()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"contentContext != nil", v6, 2u);
}

+ (void)placeholderResultsWithFetchDescriptor:contentContext:operationInfo:.cold.3()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"fetchDescriptor != nil", v6, 2u);
}

- (void)_fetchLatestResultsWithOperationInfo:prefetchedContent:completion:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"completion != nil", v6, 2u);
}

- (void)_fetchLatestResultsWithOperationInfo:prefetchedContent:completion:.cold.2()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"operationInfo != nil", v6, 2u);
}

@end