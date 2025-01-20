@interface NTNewsTodayResultOperation
+ (void)initialize;
- (BOOL)canRetryWithError:(id)a3 retryAfter:(id *)a4;
- (BOOL)validateOperation;
- (NSDate)filterDate;
- (NSDictionary)resultAssetHandlesByAssetID;
- (NSMutableSet)articleIDsToExclude;
- (NTCatchUpOperationForYouFetchInfo)forYouFetchInfo;
- (NTNewsTodayResultOperation)init;
- (NTPBTodayConfig)todayConfig;
- (NTPBTodayResultOperationFetchInfo)resultFetchInfo;
- (NTTodayResults)resultTodayResults;
- (double)resultHeadlineScaleFactor;
- (id)_firstRefreshDateDefaultsKey;
- (id)_sectionCTRsWithTodayConfig:(id)a3 personalizationTreatment:(id)a4 aggregateStore:(id)a5;
- (id)dictionaryFromColorGradient:(id)a3;
- (id)gradientBackgroundPairFromLightGradientDict:(id)a3 darkGradientDict:(id)a4;
- (id)todayBannerWithTodayConfig:(id)a3 todayData:(id)a4;
- (unint64_t)convertBannerBackgroundMethodToNTBannerBackgroundType:(int)a3;
- (unint64_t)convertBannerImageMethodToNTBannerImageType:(int)a3;
- (unint64_t)maxRetries;
- (void)_assembleQueueDescriptorsWithConfig:(id)a3 allowOnlyWatchEligibleSections:(BOOL)a4 respectsWidgetVisibleSectionsLimit:(BOOL)a5 personalizationTreatment:(id)a6 aggregateStore:(id)a7 appConfiguration:(id)a8 todayData:(id)a9 completion:(id)a10;
- (void)_fetchTodayResultsWithFetchHelper:(id)a3 aggregator:(id)a4 budgetInfo:(id)a5 appConfiguration:(id)a6 feedPersonalizer:(id)a7 todayData:(id)a8 todayBanner:(id)a9 completion:(id)a10;
- (void)_finalizeTodayResultsWithSectionDescriptors:(id)a3 catchUpOperationResultsBySectionDescriptor:(id)a4 appConfiguration:(id)a5 feedPersonalizer:(id)a6 todayData:(id)a7 todayBanner:(id)a8 completion:(id)a9;
- (void)_registerForYouFetchWithForYouFetchInfo:(id)a3;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)prepareOperation;
- (void)setArticleIDsToExclude:(id)a3;
- (void)setFilterDate:(id)a3;
- (void)setForYouFetchInfo:(id)a3;
- (void)setResultAssetHandlesByAssetID:(id)a3;
- (void)setResultFetchInfo:(id)a3;
- (void)setResultHeadlineScaleFactor:(double)a3;
- (void)setResultTodayResults:(id)a3;
- (void)setTodayConfig:(id)a3;
- (void)validateOperation;
@end

@implementation NTNewsTodayResultOperation

+ (void)initialize
{
  uint64_t v2 = objc_opt_class();
  if (v2 == objc_opt_class())
  {
    id v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
    [v3 removeObjectForKey:@"tempID"];
  }
}

- (NTNewsTodayResultOperation)init
{
  v6.receiver = self;
  v6.super_class = (Class)NTNewsTodayResultOperation;
  uint64_t v2 = [(NTTodayResultOperation *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    articleIDsToExclude = v2->_articleIDsToExclude;
    v2->_articleIDsToExclude = (NSMutableSet *)v3;
  }
  return v2;
}

- (BOOL)validateOperation
{
  uint64_t v3 = [(NTTodayResultOperation *)self contentContext];

  if (!v3 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTNewsTodayResultOperation validateOperation].cold.7();
  }
  v4 = [(NTTodayResultOperation *)self feedPersonalizerFactory];

  if (!v4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTNewsTodayResultOperation validateOperation].cold.6();
  }
  if (v3) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  char v6 = !v5;
  v7 = [(NTTodayResultOperation *)self operationInfo];
  if (!v7 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTNewsTodayResultOperation validateOperation].cold.5();
  }
  if (v7) {
    char v8 = v6;
  }
  else {
    char v8 = 0;
  }
  v9 = [v7 request];
  v10 = [v9 identifier];

  if (!v10 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTNewsTodayResultOperation validateOperation].cold.4();
  }
  if (!v10) {
    char v8 = 0;
  }
  v11 = [(NTTodayResultOperation *)self prefetchedContent];
  if (!v11 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTNewsTodayResultOperation validateOperation]();
  }
  if (v11) {
    BOOL v12 = v8;
  }
  else {
    BOOL v12 = 0;
  }
  if (v10)
  {
    v13 = [v11 todayConfigsByRequestID];
    v14 = [v13 objectForKeyedSubscript:v10];

    if (!v14 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[NTNewsTodayResultOperation validateOperation]();
    }
    if (!v14) {
      BOOL v12 = 0;
    }
  }
  v15 = [(NTTodayResultOperation *)self headlineResultCompletionHandler];

  if (!v15 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTNewsTodayResultOperation validateOperation]();
  }
  if (v15) {
    BOOL v16 = v12;
  }
  else {
    BOOL v16 = 0;
  }

  return v16;
}

- (void)prepareOperation
{
  uint64_t v3 = [(NTTodayResultOperation *)self operationInfo];
  v4 = [v3 request];
  BOOL v5 = [v4 identifier];

  char v6 = [(NTTodayResultOperation *)self prefetchedContent];
  v7 = [v6 todayConfigsByRequestID];
  char v8 = [v7 objectForKeyedSubscript:v5];
  [(NTNewsTodayResultOperation *)self setTodayConfig:v8];

  v9 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v10 = [(NTNewsTodayResultOperation *)self _firstRefreshDateDefaultsKey];
  v11 = [v9 objectForKey:v10];

  if (!v11)
  {
    BOOL v12 = NTSharedLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_22592C000, v12, OS_LOG_TYPE_INFO, "no existing date for first refresh. setting to current date", v15, 2u);
    }

    v13 = [MEMORY[0x263EFF910] date];
    v14 = [(NTNewsTodayResultOperation *)self _firstRefreshDateDefaultsKey];
    [v9 setObject:v13 forKey:v14];
  }
}

- (void)performOperation
{
  uint64_t v3 = [(NTTodayResultOperation *)self operationInfo];
  [v3 slotsLimit];
  if (v4 == 0.0)
  {
    BOOL v5 = [NTTodayResults alloc];
    char v6 = objc_opt_new();
    v7 = [MEMORY[0x263EFF910] date];
    char v8 = [(NTTodayResults *)v5 initWithSourceIdentifier:@"news" sections:v6 expirationDate:v7 headlineScale:1.0];
    [(NTNewsTodayResultOperation *)self setResultTodayResults:v8];

    [(FCOperation *)self finishedPerformingOperationWithError:0];
  }
  else
  {
    double v9 = v4;
    v23[0] = 0;
    v23[1] = v23;
    v23[2] = 0x3032000000;
    v23[3] = __Block_byref_object_copy__0;
    v23[4] = __Block_byref_object_dispose__0;
    id v24 = 0;
    v10 = dispatch_group_create();
    dispatch_group_enter(v10);
    id v11 = objc_alloc(MEMORY[0x263F594C8]);
    BOOL v12 = FCURLForTodayPersonalizationUpdateStore();
    v13 = (void *)[v11 initWithFileURL:v12];

    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __46__NTNewsTodayResultOperation_performOperation__block_invoke;
    v20[3] = &unk_26475CA78;
    v22 = v23;
    v14 = v10;
    v21 = v14;
    [v13 readWithAccessor:v20];
    [(NTNewsTodayResultOperation *)self qualityOfService];
    v15 = FCDispatchQueueForQualityOfService();
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __46__NTNewsTodayResultOperation_performOperation__block_invoke_2;
    v16[3] = &unk_26475CB18;
    v16[4] = self;
    v18 = v23;
    id v17 = v3;
    double v19 = v9;
    dispatch_group_notify(v14, v15, v16);

    _Block_object_dispose(v23, 8);
  }
}

void __46__NTNewsTodayResultOperation_performOperation__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  char v6 = *(NSObject **)(a1 + 32);

  dispatch_group_leave(v6);
}

void __46__NTNewsTodayResultOperation_performOperation__block_invoke_2(uint64_t a1)
{
  v38 = [*(id *)(a1 + 32) contentContext];
  uint64_t v2 = [v38 appConfigurationManager];
  uint64_t v3 = [*(id *)(a1 + 32) prefetchedContent];
  uint64_t v4 = [*(id *)(a1 + 32) todayConfig];
  BOOL v5 = [v3 appConfiguration];
  v40 = v3;
  char v6 = [v3 privateData];
  v7 = [v5 personalizationTreatment];
  char v8 = [v6 derivedPersonalizationData];
  double v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v11 = objc_alloc(MEMORY[0x263F59418]);
    id v10 = (id)[v11 initWithAggregates:MEMORY[0x263EFFA78] scoringType:0 decayRate:0.0];
  }
  id v12 = v10;
  v39 = v10;

  v25 = (void *)[objc_alloc(MEMORY[0x263F59620]) initWithGenerator:v12];
  [v25 processTodayPersonalizationUpdates:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) withConfigurableValues:v7];
  v36 = (void *)[v4 copy];
  v13 = [v2 feldsparID];
  v30 = [v5 currentTreatment];
  v14 = [v2 segmentSetIDs];
  v33 = [v2 treatmentIDs];
  v15 = [v6 onboardingVersion];
  v29 = *(void **)(a1 + 32);
  unsigned int v27 = [*(id *)(a1 + 40) allowOnlyWatchEligibleSections];
  unsigned int v26 = [*(id *)(a1 + 40) respectsWidgetVisibleSectionsPerQueueLimit];
  v41[0] = MEMORY[0x263EF8330];
  v41[1] = 3221225472;
  v41[2] = __46__NTNewsTodayResultOperation_performOperation__block_invoke_3;
  v41[3] = &unk_26475CAF0;
  BOOL v16 = *(void **)(a1 + 40);
  v41[4] = *(void *)(a1 + 32);
  id v42 = v25;
  id v43 = v2;
  id v44 = v6;
  id v45 = v5;
  id v46 = v4;
  id v17 = v16;
  uint64_t v56 = *(void *)(a1 + 56);
  id v47 = v17;
  id v48 = v38;
  id v49 = v13;
  id v50 = v30;
  id v51 = v14;
  id v52 = v33;
  id v53 = v15;
  id v54 = v36;
  id v55 = v7;
  id v18 = v7;
  id v37 = v36;
  id v35 = v15;
  id v34 = v33;
  id v32 = v14;
  id v31 = v30;
  id v28 = v13;
  id v19 = v38;
  id v20 = v4;
  id v21 = v5;
  id v22 = v6;
  id v23 = v2;
  id v24 = v25;
  [v29 _assembleQueueDescriptorsWithConfig:v20 allowOnlyWatchEligibleSections:v27 respectsWidgetVisibleSectionsLimit:v26 personalizationTreatment:v18 aggregateStore:v24 appConfiguration:v21 todayData:v22 completion:v41];
}

void __46__NTNewsTodayResultOperation_performOperation__block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    [*(id *)(a1 + 32) finishedPerformingOperationWithError:a3];
  }
  else
  {
    char v6 = [[NTNewsTodayResultsSourceFetchHelper alloc] initWithSectionQueueDescriptors:v5];
    v7 = [*(id *)(a1 + 32) feedPersonalizerFactory];
    char v8 = (void *)[v7 newFeedPersonalizerWithAggregateStore:*(void *)(a1 + 40) appConfigurationManager:*(void *)(a1 + 48) todayPrivateData:*(void *)(a1 + 56)];

    double v9 = (void *)[objc_alloc(MEMORY[0x263F595C8]) initWithAppConfiguration:*(void *)(a1 + 64)];
    id v10 = (void *)[objc_alloc(MEMORY[0x263F59528]) initWithFeedPersonalizer:v8 functionProvider:v9];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __46__NTNewsTodayResultOperation_performOperation__block_invoke_4;
    v13[3] = &unk_26475CAC8;
    v13[4] = *(void *)(a1 + 32);
    id v14 = *(id *)(a1 + 72);
    id v15 = *(id *)(a1 + 56);
    id v16 = *(id *)(a1 + 80);
    uint64_t v29 = *(void *)(a1 + 152);
    id v17 = *(id *)(a1 + 88);
    id v18 = v10;
    id v19 = v6;
    id v20 = *(id *)(a1 + 64);
    id v21 = *(id *)(a1 + 96);
    id v22 = *(id *)(a1 + 104);
    id v23 = *(id *)(a1 + 112);
    id v24 = *(id *)(a1 + 120);
    id v25 = *(id *)(a1 + 128);
    id v26 = *(id *)(a1 + 136);
    id v27 = *(id *)(a1 + 144);
    id v28 = *(id *)(a1 + 40);
    id v11 = v6;
    id v12 = v10;
    [v12 prepareForUseWithCompletionHandler:v13];
  }
}

void __46__NTNewsTodayResultOperation_performOperation__block_invoke_4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) todayBannerWithTodayConfig:*(void *)(a1 + 40) todayData:*(void *)(a1 + 48)];
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = [*(id *)(a1 + 56) sectionSlotCostInfo];
  [v3 setSectionSlotCostInfo:v4];

  objc_msgSend(v3, "setRespectMinMaxLimit:", objc_msgSend(*(id *)(a1 + 56), "respectsWidgetSlotsLimit"));
  [v3 setSlotsLimit:*(double *)(a1 + 160)];
  objc_msgSend(v3, "setAllowSectionTitles:", objc_msgSend(*(id *)(a1 + 56), "allowSectionTitles"));
  [v3 setHasBannerSlotCost:v2 != 0];
  id v5 = [*(id *)(a1 + 32) operationInfo];
  [v5 bannerSlotCost];
  objc_msgSend(v3, "setBannerSlotCost:");

  if ([v3 hasBannerSlotCost])
  {
    [v3 bannerSlotCost];
    double v7 = v6;
    [v3 slotsLimit];
    [v3 setSlotsLimit:v8 - v7];
  }
  id v22 = [MEMORY[0x263EFF910] date];
  double v9 = [NTNewsTodayResultsExplicitAllocationAggregator alloc];
  id v10 = [*(id *)(a1 + 64) configurationManager];
  id v11 = [(NTNewsTodayResultsExplicitAllocationAggregator *)v9 initWithConfigurationManager:v10 feedPersonalizer:*(void *)(a1 + 72) filterDate:v22 todayData:*(void *)(a1 + 48)];

  id v12 = [NTNewsTodayResultsContentFillAggregator alloc];
  [*(id *)(a1 + 56) minHeadlineScale];
  double v14 = v13;
  [*(id *)(a1 + 56) maxHeadlineScale];
  id v16 = [(NTNewsTodayResultsContentFillAggregator *)v12 initWithAggregator:v11 minHeadlineScale:v14 maxHeadlineScale:v15];
  id v17 = *(void **)(a1 + 32);
  uint64_t v18 = *(void *)(a1 + 80);
  uint64_t v19 = *(void *)(a1 + 88);
  uint64_t v20 = *(void *)(a1 + 72);
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __46__NTNewsTodayResultOperation_performOperation__block_invoke_5;
  v23[3] = &unk_26475CAA0;
  v23[4] = v17;
  uint64_t v21 = *(void *)(a1 + 48);
  id v24 = *(id *)(a1 + 56);
  id v25 = *(id *)(a1 + 88);
  id v26 = *(id *)(a1 + 40);
  id v27 = *(id *)(a1 + 96);
  id v28 = *(id *)(a1 + 104);
  id v29 = *(id *)(a1 + 112);
  id v30 = *(id *)(a1 + 120);
  id v31 = *(id *)(a1 + 64);
  id v32 = *(id *)(a1 + 128);
  id v33 = *(id *)(a1 + 48);
  id v34 = *(id *)(a1 + 136);
  id v35 = *(id *)(a1 + 144);
  id v36 = *(id *)(a1 + 152);
  [v17 _fetchTodayResultsWithFetchHelper:v18 aggregator:v16 budgetInfo:v3 appConfiguration:v19 feedPersonalizer:v20 todayData:v21 todayBanner:v2 completion:v23];
}

void __46__NTNewsTodayResultOperation_performOperation__block_invoke_5(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  double v7 = *(void **)(a1 + 32);
  id v8 = a4;
  id v9 = a3;
  id v10 = a2;
  [v7 setResultTodayResults:v10];
  [*(id *)(a1 + 32) setResultAssetHandlesByAssetID:v9];

  id v11 = objc_opt_new();
  id v12 = [v10 sections];

  double v13 = [v12 firstObject];

  if ([*(id *)(a1 + 40) fetchWidgetConfig])
  {
    double v14 = objc_opt_new();
    objc_msgSend(v14, "setMinimumArticleExposureDurationToBePreseen:", objc_msgSend(*(id *)(a1 + 48), "widgetMinimumArticleExposureDurationToBePreseenInMilliseconds"));
    objc_msgSend(v14, "setMinimumNumberOfTimesPreseenToBeSeen:", objc_msgSend(*(id *)(a1 + 48), "widgetMinimumNumberOfTimesPreseenToBeSeen"));
    [*(id *)(a1 + 48) prerollLoadingTimeout];
    objc_msgSend(v14, "setPrerollLoadingTimeout:");
    double v15 = [*(id *)(a1 + 48) externalAnalyticsConfigurations];
    [v14 setExternalAnalyticsConfigurations:v15];

    id v16 = [v13 backgroundColorLight];
    [v14 setBackgroundColorLight:v16];

    id v48 = v13;
    id v17 = [v13 backgroundColorDark];
    [v14 setBackgroundColorDark:v17];

    uint64_t v18 = [*(id *)(a1 + 56) audioIndicatorColor];
    [v14 setAudioIndicatorColor:v18];

    objc_msgSend(v14, "setContentPrefetchEnabled:", objc_msgSend(*(id *)(a1 + 48), "widgetContentPrefetchEnabled"));
    objc_msgSend(v14, "setWidgetBackgroundInteractionEnabled:", objc_msgSend(*(id *)(a1 + 48), "widgetBackgroundInteractionEnabled"));
    uint64_t v19 = [*(id *)(a1 + 32) operationInfo];
    int v20 = [v19 widgetSize];

    uint64_t v21 = [MEMORY[0x263EFFA40] standardUserDefaults];
    id v22 = [*(id *)(a1 + 32) _firstRefreshDateDefaultsKey];
    id v23 = [v21 objectForKey:v22];

    id v24 = *(void **)(a1 + 48);
    id v49 = v8;
    if (v20 == 1) {
      uint64_t v25 = [v24 smallWidgetSystemHoneymoonDuration];
    }
    else {
      uint64_t v25 = [v24 widgetSystemHoneymoonDuration];
    }
    uint64_t v26 = v25;
    id v27 = [v23 dateByAddingTimeInterval:(double)v25];
    id v28 = [MEMORY[0x263EFF910] date];
    int v29 = objc_msgSend(v28, "fc_isEarlierThan:", v27);
    id v30 = NTSharedLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109890;
      int v51 = v29;
      __int16 v52 = 2114;
      id v53 = v23;
      __int16 v54 = 2048;
      uint64_t v55 = v26;
      __int16 v56 = 2114;
      v57 = v27;
      _os_log_impl(&dword_22592C000, v30, OS_LOG_TYPE_INFO, "in honeymoon: %d, determined from first refresh date of %{public}@, honeymoon duration of %lld, and honeymoon end of %{public}@", buf, 0x26u);
    }

    id v31 = *(void **)(a1 + 48);
    if (v29)
    {
      if (v20 == 1)
      {
        objc_msgSend(v14, "setWidgetSystemReloadInterval:", objc_msgSend(v31, "smallWidgetSystemReloadIntervalHoneymoon"));
        uint64_t v32 = [*(id *)(a1 + 48) smallWidgetSystemReloadJitterMaxHoneymoon];
      }
      else
      {
        objc_msgSend(v14, "setWidgetSystemReloadInterval:", objc_msgSend(v31, "widgetSystemReloadIntervalHoneymoon"));
        uint64_t v32 = [*(id *)(a1 + 48) widgetSystemReloadJitterMaxHoneymoon];
      }
    }
    else if (v20 == 1)
    {
      objc_msgSend(v14, "setWidgetSystemReloadInterval:", objc_msgSend(v31, "smallWidgetSystemReloadInterval"));
      uint64_t v32 = [*(id *)(a1 + 48) smallWidgetSystemReloadJitterMax];
    }
    else
    {
      objc_msgSend(v14, "setWidgetSystemReloadInterval:", objc_msgSend(v31, "widgetSystemReloadInterval"));
      uint64_t v32 = [*(id *)(a1 + 48) widgetSystemReloadJitterMax];
    }
    double v13 = v48;
    [v14 setWidgetSystemReloadJitterMax:v32];
    [v11 setWidgetConfig:v14];

    id v8 = v49;
  }
  id v33 = *(void **)(a1 + 64);
  if (v33)
  {
    id v34 = v33;
  }
  else
  {
    id v35 = NewsCoreSensitiveUserDefaults();
    uint64_t v36 = *MEMORY[0x263F59340];
    id v37 = [v35 stringForKey:*MEMORY[0x263F59340]];
    v38 = v37;
    if (v37)
    {
      id v34 = v37;
    }
    else
    {
      v39 = [MEMORY[0x263F08C38] UUID];
      id v34 = [v39 UUIDString];

      [v35 setObject:v34 forKey:v36];
    }
  }
  [v11 setTodaySourceIdentifier:@"news"];
  [v11 setAppConfigTreatmentID:*(void *)(a1 + 72)];
  [v11 setUserSegmentationSegmentSetIDs:*(void *)(a1 + 80)];
  [v11 setUserSegmentationTreatmentIDs:*(void *)(a1 + 88)];
  v40 = [MEMORY[0x263EFF960] currentLocale];
  [v11 setLocale:v40];

  [v11 setUserID:v34];
  v41 = [*(id *)(a1 + 96) contentStoreFrontID];
  [v11 setContentStoreFrontID:v41];

  id v42 = [*(id *)(a1 + 96) contentEnvironment];
  [v11 setContentEnvironment:v42];

  id v43 = [MEMORY[0x263F59548] sharedNetworkReachability];
  objc_msgSend(v11, "setWifiReachable:", objc_msgSend(v43, "isNetworkReachableViaWiFi"));
  objc_msgSend(v11, "setCellularRadioAccessTechnology:", objc_msgSend(v43, "cellularRadioAccessTechnology"));
  objc_msgSend(v11, "setReachabilityStatus:", objc_msgSend(v43, "reachabilityStatus"));
  objc_msgSend(v11, "setOnboardingVersion:", objc_msgSend(*(id *)(a1 + 104), "integerValue"));
  id v44 = [*(id *)(a1 + 112) bundleSubscription];
  objc_msgSend(v11, "setIsBundleSubscriber:", (unint64_t)objc_msgSend(v44, "subscriptionState") < 2);

  id v45 = [*(id *)(a1 + 112) bundleSubscription];
  id v46 = [v45 bundlePurchaseID];
  [v11 setBundleIap:v46];

  id v47 = [*(id *)(a1 + 32) _sectionCTRsWithTodayConfig:*(void *)(a1 + 120) personalizationTreatment:*(void *)(a1 + 128) aggregateStore:*(void *)(a1 + 136)];
  [v11 setCTRByPersonalizationFeatureID:v47];

  [*(id *)(a1 + 32) setResultFetchInfo:v11];
  [*(id *)(a1 + 32) finishedPerformingOperationWithError:v8];
}

- (void)operationWillFinishWithError:(id)a3
{
  id v4 = a3;
  id v8 = [(NTTodayResultOperation *)self headlineResultCompletionHandler];
  id v5 = [(NTNewsTodayResultOperation *)self resultTodayResults];
  double v6 = [(NTNewsTodayResultOperation *)self resultAssetHandlesByAssetID];
  double v7 = [(NTNewsTodayResultOperation *)self resultFetchInfo];
  v8[2](v8, v5, v6, v7, v4);
}

- (unint64_t)maxRetries
{
  return 1;
}

- (BOOL)canRetryWithError:(id)a3 retryAfter:(id *)a4
{
  id v6 = a3;
  double v7 = [v6 domain];
  if (![v7 isEqualToString:*MEMORY[0x263F592B8]]) {
    goto LABEL_7;
  }
  uint64_t v8 = [v6 code];

  if (v8 != 21)
  {
    BOOL v12 = 0;
    goto LABEL_10;
  }
  id v9 = [v6 userInfo];
  double v7 = [v9 objectForKeyedSubscript:*MEMORY[0x263F592C0]];

  if (v7)
  {
    id v10 = objc_msgSend(v7, "fc_arrayOfObjectsPassingTest:", &__block_literal_global_56);
    uint64_t v11 = [v10 count];
    BOOL v12 = v11 != 0;
    if (v11)
    {
      double v13 = [(NTNewsTodayResultOperation *)self articleIDsToExclude];
      double v14 = [MEMORY[0x263EFFA08] setWithArray:v10];
      [v13 unionSet:v14];

      *a4 = (id)objc_opt_new();
    }
  }
  else
  {
LABEL_7:
    BOOL v12 = 0;
  }

LABEL_10:
  return v12;
}

uint64_t __59__NTNewsTodayResultOperation_canRetryWithError_retryAfter___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 hasPrefix:@"A"];
}

- (id)_sectionCTRsWithTodayConfig:(id)a3 personalizationTreatment:(id)a4 aggregateStore:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[NTNewsTodayResultOperation _sectionCTRsWithTodayConfig:personalizationTreatment:aggregateStore:]();
    if (v9) {
      goto LABEL_6;
    }
  }
  else if (v9)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTNewsTodayResultOperation _sectionCTRsWithTodayConfig:personalizationTreatment:aggregateStore:]();
  }
LABEL_6:
  if (!v10 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTNewsTodayResultOperation _sectionCTRsWithTodayConfig:personalizationTreatment:aggregateStore:]();
  }
  uint64_t v11 = objc_opt_new();
  BOOL v12 = [v8 todayQueueConfigs];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __98__NTNewsTodayResultOperation__sectionCTRsWithTodayConfig_personalizationTreatment_aggregateStore___block_invoke;
  v24[3] = &unk_26475CB88;
  id v13 = v11;
  id v25 = v13;
  [v12 enumerateObjectsUsingBlock:v24];

  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__0;
  id v22 = __Block_byref_object_dispose__0;
  id v23 = 0;
  double v14 = objc_opt_new();
  [v14 setPersonalizationTreatment:v9];
  [v14 setAggregateStore:v10];
  [v14 setLookupRequests:v13];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __98__NTNewsTodayResultOperation__sectionCTRsWithTodayConfig_personalizationTreatment_aggregateStore___block_invoke_3;
  v17[3] = &unk_26475CBD0;
  v17[4] = &v18;
  [v14 setLookupCompletion:v17];
  [(FCOperation *)self associateChildOperation:v14];
  [v14 start];
  [v14 waitUntilFinished];
  id v15 = (id)v19[5];

  _Block_object_dispose(&v18, 8);

  return v15;
}

void __98__NTNewsTodayResultOperation__sectionCTRsWithTodayConfig_personalizationTreatment_aggregateStore___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 todaySectionConfigs];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __98__NTNewsTodayResultOperation__sectionCTRsWithTodayConfig_personalizationTreatment_aggregateStore___block_invoke_2;
  v4[3] = &unk_26475CB60;
  id v5 = *(id *)(a1 + 32);
  [v3 enumerateObjectsUsingBlock:v4];
}

void __98__NTNewsTodayResultOperation__sectionCTRsWithTodayConfig_personalizationTreatment_aggregateStore___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v8 = (id)objc_opt_new();
  id v4 = (void *)MEMORY[0x263F595C0];
  id v5 = [v3 personalizedPresenceFeatureID];
  id v6 = [v4 featureForFreeValuedIdentifier:v5];
  [v8 setPersonalizationFeature:v6];

  objc_msgSend(v8, "setClickPrior:", (double)(unint64_t)objc_msgSend(v3, "personalizedPresenceFeatureClickPrior"));
  unint64_t v7 = [v3 personalizedPresenceFeatureImpressionPrior];

  [v8 setImpressionPrior:(double)v7];
  [*(id *)(a1 + 32) addObject:v8];
}

uint64_t __98__NTNewsTodayResultOperation__sectionCTRsWithTodayConfig_personalizationTreatment_aggregateStore___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(a2, "fc_dictionaryByTransformingKeysWithBlock:", &__block_literal_global_78);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void *)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return MEMORY[0x270F9A758](v3, v5);
}

uint64_t __98__NTNewsTodayResultOperation__sectionCTRsWithTodayConfig_personalizationTreatment_aggregateStore___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 personalizationIdentifier];
}

- (void)_assembleQueueDescriptorsWithConfig:(id)a3 allowOnlyWatchEligibleSections:(BOOL)a4 respectsWidgetVisibleSectionsLimit:(BOOL)a5 personalizationTreatment:(id)a6 aggregateStore:(id)a7 appConfiguration:(id)a8 todayData:(id)a9 completion:(id)a10
{
  id v49 = self;
  uint64_t v95 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a6;
  id v15 = a7;
  id v16 = a8;
  id v59 = a9;
  id v17 = a10;
  if (!v13 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[NTNewsTodayResultOperation _assembleQueueDescriptorsWithConfig:allowOnlyWatchEligibleSections:respectsWidgetVisibleSectionsLimit:personalizationTreatment:aggregateStore:appConfiguration:todayData:completion:].cold.5();
    if (v14) {
      goto LABEL_6;
    }
  }
  else if (v14)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTNewsTodayResultOperation _assembleQueueDescriptorsWithConfig:allowOnlyWatchEligibleSections:respectsWidgetVisibleSectionsLimit:personalizationTreatment:aggregateStore:appConfiguration:todayData:completion:].cold.4();
  }
LABEL_6:
  if (!v15 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[NTNewsTodayResultOperation _assembleQueueDescriptorsWithConfig:allowOnlyWatchEligibleSections:respectsWidgetVisibleSectionsLimit:personalizationTreatment:aggregateStore:appConfiguration:todayData:completion:]();
    if (v16) {
      goto LABEL_11;
    }
  }
  else if (v16)
  {
    goto LABEL_11;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTNewsTodayResultOperation _assembleQueueDescriptorsWithConfig:allowOnlyWatchEligibleSections:respectsWidgetVisibleSectionsLimit:personalizationTreatment:aggregateStore:appConfiguration:todayData:completion:]();
  }
LABEL_11:
  id v50 = v16;
  int v51 = v17;
  id v53 = v15;
  id v54 = v14;
  if (!v17 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTNewsTodayResultOperation _assembleQueueDescriptorsWithConfig:allowOnlyWatchEligibleSections:respectsWidgetVisibleSectionsLimit:personalizationTreatment:aggregateStore:appConfiguration:todayData:completion:]();
  }
  uint64_t v18 = NewsCoreUserDefaults();
  char v58 = [v18 BOOLForKey:*MEMORY[0x263F59310]];

  uint64_t v19 = (void *)MEMORY[0x263EFF8C0];
  uint64_t v55 = v13;
  uint64_t v20 = [v13 todayQueueConfigs];
  uint64_t v21 = [v19 arrayWithArray:v20];

  long long v91 = 0u;
  long long v92 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  obuint64_t j = v21;
  uint64_t v22 = [obj countByEnumeratingWithState:&v89 objects:v94 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v90;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v90 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v26 = *(void **)(*((void *)&v89 + 1) + 8 * i);
        id v27 = objc_msgSend(v26, "todaySectionConfigs", v49, v50, v51);
        id v28 = [v27 sortedArrayUsingComparator:&__block_literal_global_85];
        int v29 = (void *)[v28 mutableCopy];

        id v30 = objc_opt_new();
        v84[0] = MEMORY[0x263EF8330];
        v84[1] = 3221225472;
        v84[2] = __210__NTNewsTodayResultOperation__assembleQueueDescriptorsWithConfig_allowOnlyWatchEligibleSections_respectsWidgetVisibleSectionsLimit_personalizationTreatment_aggregateStore_appConfiguration_todayData_completion___block_invoke_2;
        v84[3] = &unk_26475CC18;
        char v87 = v58;
        BOOL v88 = a4;
        id v85 = v59;
        id v86 = v30;
        id v31 = v30;
        [v29 enumerateObjectsUsingBlock:v84];
        [v29 removeObjectsAtIndexes:v31];
        [v26 setTodaySectionConfigs:v29];
      }
      uint64_t v23 = [obj countByEnumeratingWithState:&v89 objects:v94 count:16];
    }
    while (v23);
  }

  v62 = objc_opt_new();
  v60 = objc_opt_new();
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  id obja = obj;
  uint64_t v32 = [obja countByEnumeratingWithState:&v80 objects:v93 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v81;
    do
    {
      for (uint64_t j = 0; j != v33; ++j)
      {
        if (*(void *)v81 != v34) {
          objc_enumerationMutation(obja);
        }
        uint64_t v36 = objc_msgSend(*(id *)(*((void *)&v80 + 1) + 8 * j), "todaySectionConfigs", v49);
        v78[0] = MEMORY[0x263EF8330];
        v78[1] = 3221225472;
        v78[2] = __210__NTNewsTodayResultOperation__assembleQueueDescriptorsWithConfig_allowOnlyWatchEligibleSections_respectsWidgetVisibleSectionsLimit_personalizationTreatment_aggregateStore_appConfiguration_todayData_completion___block_invoke_3;
        v78[3] = &unk_26475CB60;
        id v79 = v62;
        [v36 enumerateObjectsUsingBlock:v78];
        v76[0] = MEMORY[0x263EF8330];
        v76[1] = 3221225472;
        v76[2] = __210__NTNewsTodayResultOperation__assembleQueueDescriptorsWithConfig_allowOnlyWatchEligibleSections_respectsWidgetVisibleSectionsLimit_personalizationTreatment_aggregateStore_appConfiguration_todayData_completion___block_invoke_4;
        v76[3] = &unk_26475CC40;
        id v77 = v60;
        objc_msgSend(v36, "fc_enumerateObjectsPairwiseUsingBlock:", v76);
      }
      uint64_t v33 = [obja countByEnumeratingWithState:&v80 objects:v93 count:16];
    }
    while (v33);
  }

  v69[0] = MEMORY[0x263EF8330];
  v69[1] = 3221225472;
  v69[2] = __210__NTNewsTodayResultOperation__assembleQueueDescriptorsWithConfig_allowOnlyWatchEligibleSections_respectsWidgetVisibleSectionsLimit_personalizationTreatment_aggregateStore_appConfiguration_todayData_completion___block_invoke_5;
  v69[3] = &unk_26475CC90;
  id v37 = obja;
  id v70 = v37;
  id v38 = v50;
  id v71 = v38;
  id v39 = v59;
  id v72 = v39;
  char v74 = v58;
  BOOL v75 = a5;
  id v40 = v51;
  id v73 = v40;
  v41 = (void (**)(void, void))MEMORY[0x22A638590](v69);
  id v42 = v62;
  id v43 = v60;
  if ([v62 count] || objc_msgSend(v60, "count"))
  {
    id v44 = objc_opt_new();
    id v45 = v54;
    [v44 setPersonalizationTreatment:v54];
    id v46 = v53;
    [v44 setAggregateStore:v53];
    [v44 setRelativeRequests:v60];
    [v44 setAbsoluteRequests:v62];
    v67[0] = MEMORY[0x263EF8330];
    v67[1] = 3221225472;
    v67[2] = __210__NTNewsTodayResultOperation__assembleQueueDescriptorsWithConfig_allowOnlyWatchEligibleSections_respectsWidgetVisibleSectionsLimit_personalizationTreatment_aggregateStore_appConfiguration_todayData_completion___block_invoke_7;
    v67[3] = &unk_26475CCE0;
    id v47 = v37;
    id v68 = v47;
    [v44 setRelativePresenceHandler:v67];
    v65[0] = MEMORY[0x263EF8330];
    v65[1] = 3221225472;
    v65[2] = __210__NTNewsTodayResultOperation__assembleQueueDescriptorsWithConfig_allowOnlyWatchEligibleSections_respectsWidgetVisibleSectionsLimit_personalizationTreatment_aggregateStore_appConfiguration_todayData_completion___block_invoke_96;
    v65[3] = &unk_26475CCE0;
    id v43 = v60;
    id v48 = v47;
    id v42 = v62;
    id v66 = v48;
    [v44 setAbsolutePresenceHandler:v65];
    v63[0] = MEMORY[0x263EF8330];
    v63[1] = 3221225472;
    v63[2] = __210__NTNewsTodayResultOperation__assembleQueueDescriptorsWithConfig_allowOnlyWatchEligibleSections_respectsWidgetVisibleSectionsLimit_personalizationTreatment_aggregateStore_appConfiguration_todayData_completion___block_invoke_3_98;
    v63[3] = &unk_26475CD30;
    v64 = v41;
    [v44 setPersonalizationCompletion:v63];
    [(FCOperation *)v49 associateChildOperation:v44];
    [v44 start];
  }
  else
  {
    v41[2](v41, 0);
    id v46 = v53;
    id v45 = v54;
  }
}

uint64_t __210__NTNewsTodayResultOperation__assembleQueueDescriptorsWithConfig_allowOnlyWatchEligibleSections_respectsWidgetVisibleSectionsLimit_personalizationTreatment_aggregateStore_appConfiguration_todayData_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = NSNumber;
  id v5 = a3;
  id v6 = objc_msgSend(v4, "numberWithUnsignedLongLong:", objc_msgSend(a2, "fallbackOrder"));
  unint64_t v7 = NSNumber;
  uint64_t v8 = [v5 fallbackOrder];

  id v9 = [v7 numberWithUnsignedLongLong:v8];
  uint64_t v10 = [v6 compare:v9];

  return v10;
}

void __210__NTNewsTodayResultOperation__assembleQueueDescriptorsWithConfig_allowOnlyWatchEligibleSections_respectsWidgetVisibleSectionsLimit_personalizationTreatment_aggregateStore_appConfiguration_todayData_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  id v5 = [v8 mutingTagID];
  if (*(unsigned char *)(a1 + 48) && ![v8 shownInFavoritesOnlyMode]
    || *(unsigned char *)(a1 + 49) && ![v8 glanceable]
    || v5
    && ([*(id *)(a1 + 32) mutedTagIDs],
        id v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 containsObject:v5],
        v6,
        v7))
  {
    [*(id *)(a1 + 40) addIndex:a3];
  }
}

uint64_t __210__NTNewsTodayResultOperation__assembleQueueDescriptorsWithConfig_allowOnlyWatchEligibleSections_respectsWidgetVisibleSectionsLimit_personalizationTreatment_aggregateStore_appConfiguration_todayData_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v13 = a2;
  uint64_t v3 = [v13 presenceDeterminedByPersonalization];
  id v4 = v13;
  if (v3)
  {
    id v5 = [v13 personalizedPresenceConfig];
    if (![v5 personalizationMethod])
    {
      id v6 = objc_opt_new();
      int v7 = (void *)MEMORY[0x263F595C0];
      id v8 = [v13 personalizedPresenceFeatureID];
      id v9 = [v7 featureForFreeValuedIdentifier:v8];
      [v6 setFeature:v9];

      objc_msgSend(v6, "setFeatureClickPrior:", (double)(unint64_t)objc_msgSend(v13, "personalizedPresenceFeatureClickPrior"));
      objc_msgSend(v6, "setFeatureImpressionPrior:", (double)(unint64_t)objc_msgSend(v13, "personalizedPresenceFeatureImpressionPrior"));
      uint64_t v10 = [v13 personalizedPresenceConfig];
      uint64_t v11 = [v10 absoluteConfig];
      [v6 setAbsolutePresenceConfig:v11];

      [*(id *)(a1 + 32) addObject:v6];
    }

    id v4 = v13;
  }

  return MEMORY[0x270F9A758](v3, v4);
}

void __210__NTNewsTodayResultOperation__assembleQueueDescriptorsWithConfig_allowOnlyWatchEligibleSections_respectsWidgetVisibleSectionsLimit_personalizationTreatment_aggregateStore_appConfiguration_todayData_completion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v16 = a2;
  id v5 = a3;
  if ([v16 presenceDeterminedByPersonalization])
  {
    id v6 = [v16 personalizedPresenceConfig];
    if ([v6 personalizationMethod] == 1)
    {
      int v7 = objc_opt_new();
      id v8 = (void *)MEMORY[0x263F595C0];
      id v9 = [v16 personalizedPresenceFeatureID];
      uint64_t v10 = [v8 featureForFreeValuedIdentifier:v9];
      [v7 setTargetSectionFeature:v10];

      objc_msgSend(v7, "setTargetSectionFeatureClickPrior:", (double)(unint64_t)objc_msgSend(v16, "personalizedPresenceFeatureClickPrior"));
      objc_msgSend(v7, "setTargetSectionFeatureImpressionPrior:", (double)(unint64_t)objc_msgSend(v16, "personalizedPresenceFeatureImpressionPrior"));
      uint64_t v11 = (void *)MEMORY[0x263F595C0];
      BOOL v12 = [v5 personalizedPresenceFeatureID];
      id v13 = [v11 featureForFreeValuedIdentifier:v12];
      [v7 setCompetingSectionFeature:v13];

      objc_msgSend(v7, "setCompetingSectionFeatureClickPrior:", (double)(unint64_t)objc_msgSend(v5, "personalizedPresenceFeatureClickPrior"));
      objc_msgSend(v7, "setCompetingSectionFeatureImpressionPrior:", (double)(unint64_t)objc_msgSend(v5, "personalizedPresenceFeatureImpressionPrior"));
      id v14 = [v16 personalizedPresenceConfig];
      id v15 = [v14 relativeConfig];
      [v15 scalar];
      objc_msgSend(v7, "setScalar:");

      [*(id *)(a1 + 32) addObject:v7];
    }
  }
}

void __210__NTNewsTodayResultOperation__assembleQueueDescriptorsWithConfig_allowOnlyWatchEligibleSections_respectsWidgetVisibleSectionsLimit_personalizationTreatment_aggregateStore_appConfiguration_todayData_completion___block_invoke_5(uint64_t a1, void *a2)
{
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __210__NTNewsTodayResultOperation__assembleQueueDescriptorsWithConfig_allowOnlyWatchEligibleSections_respectsWidgetVisibleSectionsLimit_personalizationTreatment_aggregateStore_appConfiguration_todayData_completion___block_invoke_6;
  v7[3] = &unk_26475CC68;
  id v4 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 48);
  __int16 v10 = *(_WORD *)(a1 + 64);
  id v5 = a2;
  id v6 = objc_msgSend(v4, "fc_arrayByTransformingWithBlock:", v7);
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

NTQueueConfigSectionQueueDescriptor *__210__NTNewsTodayResultOperation__assembleQueueDescriptorsWithConfig_allowOnlyWatchEligibleSections_respectsWidgetVisibleSectionsLimit_personalizationTreatment_aggregateStore_appConfiguration_todayData_completion___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[NTQueueConfigSectionQueueDescriptor alloc] initWithQueueConfig:v3 appConfiguration:*(void *)(a1 + 32) todayData:*(void *)(a1 + 40) inFavoritesOnlyMode:*(unsigned __int8 *)(a1 + 48) respectsWidgetVisibleSectionsLimit:*(unsigned __int8 *)(a1 + 49)];

  return v4;
}

void __210__NTNewsTodayResultOperation__assembleQueueDescriptorsWithConfig_allowOnlyWatchEligibleSections_respectsWidgetVisibleSectionsLimit_personalizationTreatment_aggregateStore_appConfiguration_todayData_completion___block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v14 = a2;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  obuint64_t j = *(id *)(a1 + 32);
  uint64_t v3 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(obj);
        }
        int v7 = [*(id *)(*((void *)&v18 + 1) + 8 * i) todaySectionConfigs];
        id v8 = objc_opt_new();
        v15[0] = MEMORY[0x263EF8330];
        v15[1] = 3221225472;
        v15[2] = __210__NTNewsTodayResultOperation__assembleQueueDescriptorsWithConfig_allowOnlyWatchEligibleSections_respectsWidgetVisibleSectionsLimit_personalizationTreatment_aggregateStore_appConfiguration_todayData_completion___block_invoke_8;
        v15[3] = &unk_26475CCB8;
        id v16 = v14;
        id v9 = v8;
        id v17 = v9;
        objc_msgSend(v7, "fc_enumerateObjectsPairwiseUsingBlock:", v15);
        for (uint64_t j = [v9 firstIndex]; ; uint64_t j = objc_msgSend(v9, "indexGreaterThanIndex:", v11))
        {
          uint64_t v11 = j;
          if (j == 0x7FFFFFFFFFFFFFFFLL) {
            break;
          }
          BOOL v12 = [v7 objectAtIndex:j + 1];
          [v7 removeObjectAtIndex:v11 + 1];
          [v7 insertObject:v12 atIndex:v11];
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v4);
  }
}

void __210__NTNewsTodayResultOperation__assembleQueueDescriptorsWithConfig_allowOnlyWatchEligibleSections_respectsWidgetVisibleSectionsLimit_personalizationTreatment_aggregateStore_appConfiguration_todayData_completion___block_invoke_8(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  if ([v7 presenceDeterminedByPersonalization])
  {
    id v9 = [v7 personalizedPresenceConfig];
    int v10 = [v9 personalizationMethod];

    if (v10 == 1)
    {
      uint64_t v11 = (void *)MEMORY[0x263F595C0];
      BOOL v12 = [v7 personalizedPresenceFeatureID];
      id v13 = [v11 featureForFreeValuedIdentifier:v12];

      id v14 = [*(id *)(a1 + 32) objectForKeyedSubscript:v13];
      id v15 = v14;
      if (v14)
      {
        int v16 = [v14 BOOLValue];
        id v17 = NTSharedLog();
        BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_INFO);
        if (v16)
        {
          if (v18)
          {
            long long v19 = [v7 identifier];
            long long v20 = [v8 identifier];
            int v23 = 138543618;
            uint64_t v24 = v19;
            __int16 v25 = 2114;
            uint64_t v26 = v20;
            _os_log_impl(&dword_22592C000, v17, OS_LOG_TYPE_INFO, "personalized presence not swapping %{public}@ with %{public}@", (uint8_t *)&v23, 0x16u);
          }
        }
        else
        {
          if (v18)
          {
            long long v21 = [v7 identifier];
            uint64_t v22 = [v8 identifier];
            int v23 = 138543618;
            uint64_t v24 = v21;
            __int16 v25 = 2114;
            uint64_t v26 = v22;
            _os_log_impl(&dword_22592C000, v17, OS_LOG_TYPE_INFO, "personalized presence swapping %{public}@ with %{public}@", (uint8_t *)&v23, 0x16u);
          }
          [*(id *)(a1 + 40) addIndex:a4];
        }
      }
    }
  }
}

void __210__NTNewsTodayResultOperation__assembleQueueDescriptorsWithConfig_allowOnlyWatchEligibleSections_respectsWidgetVisibleSectionsLimit_personalizationTreatment_aggregateStore_appConfiguration_todayData_completion___block_invoke_96(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  obuint64_t j = *(id *)(a1 + 32);
  uint64_t v4 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = [*(id *)(*((void *)&v15 + 1) + 8 * v7) todaySectionConfigs];
        id v9 = objc_opt_new();
        v12[0] = MEMORY[0x263EF8330];
        v12[1] = 3221225472;
        v12[2] = __210__NTNewsTodayResultOperation__assembleQueueDescriptorsWithConfig_allowOnlyWatchEligibleSections_respectsWidgetVisibleSectionsLimit_personalizationTreatment_aggregateStore_appConfiguration_todayData_completion___block_invoke_2_97;
        v12[3] = &unk_26475CD08;
        id v13 = v3;
        id v14 = v9;
        id v10 = v9;
        [v8 enumerateObjectsUsingBlock:v12];
        [v8 removeObjectsAtIndexes:v10];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }
}

void __210__NTNewsTodayResultOperation__assembleQueueDescriptorsWithConfig_allowOnlyWatchEligibleSections_respectsWidgetVisibleSectionsLimit_personalizationTreatment_aggregateStore_appConfiguration_todayData_completion___block_invoke_2_97(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = (void *)MEMORY[0x263F595C0];
  uint64_t v6 = [a2 personalizedPresenceFeatureID];
  id v9 = [v5 featureForFreeValuedIdentifier:v6];

  uint64_t v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v9];
  id v8 = v7;
  if (v7 && ([v7 BOOLValue] & 1) == 0) {
    [*(id *)(a1 + 40) addIndex:a3];
  }
}

uint64_t __210__NTNewsTodayResultOperation__assembleQueueDescriptorsWithConfig_allowOnlyWatchEligibleSections_respectsWidgetVisibleSectionsLimit_personalizationTreatment_aggregateStore_appConfiguration_todayData_completion___block_invoke_3_98(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_fetchTodayResultsWithFetchHelper:(id)a3 aggregator:(id)a4 budgetInfo:(id)a5 appConfiguration:(id)a6 feedPersonalizer:(id)a7 todayData:(id)a8 todayBanner:(id)a9 completion:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v38 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  if (!v16 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[NTNewsTodayResultOperation _fetchTodayResultsWithFetchHelper:aggregator:budgetInfo:appConfiguration:feedPersonalizer:todayData:todayBanner:completion:]();
    if (v22) {
      goto LABEL_6;
    }
  }
  else if (v22)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTNewsTodayResultOperation _fetchTodayResultsWithFetchHelper:aggregator:budgetInfo:appConfiguration:feedPersonalizer:todayData:todayBanner:completion:]();
  }
LABEL_6:
  id v37 = v21;
  int v23 = v20;
  uint64_t v24 = v17;
  [v16 sectionDescriptorsAtHeadsOfQueues];
  __int16 v25 = v39 = v16;
  if ([v25 count])
  {
    uint64_t v26 = [(NTTodayResultOperation *)self prefetchedContent];
    uint64_t v27 = objc_opt_new();
    [v27 setAppConfiguration:v18];
    id v28 = [(NTTodayResultOperation *)self contentContext];
    [v27 setContentContext:v28];

    [v27 setFeedPersonalizer:v19];
    uint64_t v36 = v26;
    int v29 = [v26 prefetchedHeldRecordsByType];
    [v27 setTodayConfigOperationHeldRecordsByType:v29];

    [v25 makeObjectsPerformSelector:sel_configureCatchUpOperationWithFetchRequest_ withObject:v27];
    id v30 = [(NTNewsTodayResultOperation *)self articleIDsToExclude];
    [v27 addArticleIDsToExclude:v30];

    v40[0] = MEMORY[0x263EF8330];
    v40[1] = 3221225472;
    v40[2] = __153__NTNewsTodayResultOperation__fetchTodayResultsWithFetchHelper_aggregator_budgetInfo_appConfiguration_feedPersonalizer_todayData_todayBanner_completion___block_invoke;
    v40[3] = &unk_26475CDF0;
    id v50 = (NTTodayResults *)v22;
    id v41 = v25;
    id v42 = self;
    id v43 = v24;
    id v31 = v38;
    id v44 = v38;
    id v45 = v18;
    id v46 = v19;
    id v47 = v23;
    uint64_t v32 = v37;
    id v48 = v37;
    id v49 = v39;
    [v27 setCatchUpCompletionHandler:v40];
    [(FCOperation *)self associateChildOperation:v27];
    [v27 start];

    uint64_t v33 = v50;
  }
  else
  {
    uint64_t v34 = [NTTodayResults alloc];
    uint64_t v35 = objc_opt_new();
    uint64_t v27 = [MEMORY[0x263EFF910] distantFuture];
    uint64_t v36 = (void *)v35;
    uint64_t v33 = [(NTTodayResults *)v34 initWithSourceIdentifier:@"news" sections:v35 expirationDate:v27 headlineScale:1.0];
    (*((void (**)(id, NTTodayResults *, void, void))v22 + 2))(v22, v33, MEMORY[0x263EFFA78], 0);
    uint64_t v32 = v37;
    id v31 = v38;
  }
}

void __153__NTNewsTodayResultOperation__fetchTodayResultsWithFetchHelper_aggregator_budgetInfo_appConfiguration_feedPersonalizer_todayData_todayBanner_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = v5;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 104) + 16))();
  }
  else
  {
    uint64_t v7 = *(void **)(a1 + 32);
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __153__NTNewsTodayResultOperation__fetchTodayResultsWithFetchHelper_aggregator_budgetInfo_appConfiguration_feedPersonalizer_todayData_todayBanner_completion___block_invoke_2;
    v27[3] = &unk_26475CD58;
    id v8 = v5;
    id v28 = v8;
    id v9 = objc_msgSend(v7, "fc_dictionaryWithValueBlock:", v27);
    if ([v8 isForYouEnabled])
    {
      id v10 = [v8 forYouFetchInfo];
      if (v10) {
        [*(id *)(a1 + 40) _registerForYouFetchWithForYouFetchInfo:v10];
      }
    }
    uint64_t v11 = *(void **)(a1 + 48);
    uint64_t v12 = *(void *)(a1 + 32);
    id v13 = objc_msgSend(v9, "fc_dictionaryByTransformingValuesWithBlock:", &__block_literal_global_107);
    id v14 = [v11 aggregateSections:v12 itemsBySectionDescriptor:v13 budgetInfo:*(void *)(a1 + 56)];

    long long v15 = [v14 aggregatedItemsBySectionDescriptor];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __153__NTNewsTodayResultOperation__fetchTodayResultsWithFetchHelper_aggregator_budgetInfo_appConfiguration_feedPersonalizer_todayData_todayBanner_completion___block_invoke_2_108;
    v25[3] = &unk_26475CDA0;
    id v16 = v9;
    id v26 = v16;
    id v17 = objc_msgSend(v15, "fc_dictionaryByTransformingValuesWithKeyAndValueBlock:", v25);

    id v18 = [v14 unusedSectionDescriptors];
    if ([v18 count])
    {
      [*(id *)(a1 + 96) removeSectionDescriptors:v18];
      [*(id *)(a1 + 40) _fetchTodayResultsWithFetchHelper:*(void *)(a1 + 96) aggregator:*(void *)(a1 + 48) budgetInfo:*(void *)(a1 + 56) appConfiguration:*(void *)(a1 + 64) feedPersonalizer:*(void *)(a1 + 72) todayData:*(void *)(a1 + 80) todayBanner:*(void *)(a1 + 88) completion:*(void *)(a1 + 104)];
    }
    else
    {
      id v19 = [v17 allKeys];
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __153__NTNewsTodayResultOperation__fetchTodayResultsWithFetchHelper_aggregator_budgetInfo_appConfiguration_feedPersonalizer_todayData_todayBanner_completion___block_invoke_3;
      v23[3] = &unk_26475CDC8;
      id v24 = *(id *)(a1 + 32);
      id v20 = [v19 sortedArrayUsingComparator:v23];

      [v14 headlineScale];
      objc_msgSend(*(id *)(a1 + 40), "setResultHeadlineScaleFactor:");
      if (v20) {
        id v21 = v20;
      }
      else {
        id v21 = (void *)MEMORY[0x263EFFA68];
      }
      if (v17) {
        id v22 = v17;
      }
      else {
        id v22 = (void *)MEMORY[0x263EFFA78];
      }
      [*(id *)(a1 + 40) _finalizeTodayResultsWithSectionDescriptors:v21 catchUpOperationResultsBySectionDescriptor:v22 appConfiguration:*(void *)(a1 + 64) feedPersonalizer:*(void *)(a1 + 72) todayData:*(void *)(a1 + 80) todayBanner:*(void *)(a1 + 88) completion:*(void *)(a1 + 104)];
    }
  }
}

id __153__NTNewsTodayResultOperation__fetchTodayResultsWithFetchHelper_aggregator_budgetInfo_appConfiguration_feedPersonalizer_todayData_todayBanner_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [v3 assembleResultsWithCatchUpOperation:*(void *)(a1 + 32)];
  id v5 = NTSharedLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = [v4 items];
    uint64_t v7 = [v6 count];
    id v8 = [v3 identifier];
    int v10 = 134218242;
    uint64_t v11 = v7;
    __int16 v12 = 2114;
    id v13 = v8;
    _os_log_impl(&dword_22592C000, v5, OS_LOG_TYPE_INFO, "Unpacking %ld results from catchUpOperation for section with identifier %{public}@.", (uint8_t *)&v10, 0x16u);
  }

  return v4;
}

uint64_t __153__NTNewsTodayResultOperation__fetchTodayResultsWithFetchHelper_aggregator_budgetInfo_appConfiguration_feedPersonalizer_todayData_todayBanner_completion___block_invoke_104(uint64_t a1, void *a2)
{
  return [a2 items];
}

id __153__NTNewsTodayResultOperation__fetchTodayResultsWithFetchHelper_aggregator_budgetInfo_appConfiguration_feedPersonalizer_todayData_todayBanner_completion___block_invoke_2_108(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a3;
  uint64_t v6 = [v4 objectForKeyedSubscript:a2];
  uint64_t v7 = (void *)[v6 copyWithItems:v5];

  return v7;
}

uint64_t __153__NTNewsTodayResultOperation__fetchTodayResultsWithFetchHelper_aggregator_budgetInfo_appConfiguration_feedPersonalizer_todayData_todayBanner_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  unint64_t v7 = [v5 indexOfObject:a2];
  unint64_t v8 = [*(id *)(a1 + 32) indexOfObject:v6];

  if (v7 < v8) {
    return -1;
  }
  else {
    return v7 > v8;
  }
}

- (void)_registerForYouFetchWithForYouFetchInfo:(id)a3
{
  id v4 = a3;
  if (!v4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTNewsTodayResultOperation _registerForYouFetchWithForYouFetchInfo:]();
  }
  id v5 = [(NTNewsTodayResultOperation *)self forYouFetchInfo];
  id v6 = v5;
  if (v5)
  {
    if ([v5 attemptedCachedOnly]) {
      uint64_t v7 = [v4 attemptedCachedOnly];
    }
    else {
      uint64_t v7 = 0;
    }
    id v9 = [NTCatchUpOperationForYouFetchInfo alloc];
    int v10 = [v4 feedContextByFeedID];
    unint64_t v8 = [(NTCatchUpOperationForYouFetchInfo *)v9 initWithAttemptedCachedOnly:v7 feedContextByFeedID:v10];
  }
  else
  {
    unint64_t v8 = (NTCatchUpOperationForYouFetchInfo *)v4;
  }
  [(NTNewsTodayResultOperation *)self setForYouFetchInfo:v8];
}

- (void)_finalizeTodayResultsWithSectionDescriptors:(id)a3 catchUpOperationResultsBySectionDescriptor:(id)a4 appConfiguration:(id)a5 feedPersonalizer:(id)a6 todayData:(id)a7 todayBanner:(id)a8 completion:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v33 = a7;
  id v19 = a8;
  id v20 = a9;
  if (!v15 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[NTNewsTodayResultOperation _finalizeTodayResultsWithSectionDescriptors:catchUpOperationResultsBySectionDescriptor:appConfiguration:feedPersonalizer:todayData:todayBanner:completion:].cold.6();
    if (v16) {
      goto LABEL_6;
    }
  }
  else if (v16)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTNewsTodayResultOperation _finalizeTodayResultsWithSectionDescriptors:catchUpOperationResultsBySectionDescriptor:appConfiguration:feedPersonalizer:todayData:todayBanner:completion:].cold.5();
  }
LABEL_6:
  uint64_t v21 = [v15 count];
  id v22 = objc_msgSend(v16, "nf_objectsForKeysWithoutMarker:", v15);
  uint64_t v23 = [v22 count];

  if (v21 != v23 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[NTNewsTodayResultOperation _finalizeTodayResultsWithSectionDescriptors:catchUpOperationResultsBySectionDescriptor:appConfiguration:feedPersonalizer:todayData:todayBanner:completion:].cold.4();
    if (v17) {
      goto LABEL_11;
    }
  }
  else if (v17)
  {
    goto LABEL_11;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTNewsTodayResultOperation _finalizeTodayResultsWithSectionDescriptors:catchUpOperationResultsBySectionDescriptor:appConfiguration:feedPersonalizer:todayData:todayBanner:completion:]();
  }
LABEL_11:
  if (!v18 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[NTNewsTodayResultOperation _finalizeTodayResultsWithSectionDescriptors:catchUpOperationResultsBySectionDescriptor:appConfiguration:feedPersonalizer:todayData:todayBanner:completion:]();
    if (v20) {
      goto LABEL_16;
    }
  }
  else if (v20)
  {
    goto LABEL_16;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTNewsTodayResultOperation _finalizeTodayResultsWithSectionDescriptors:catchUpOperationResultsBySectionDescriptor:appConfiguration:feedPersonalizer:todayData:todayBanner:completion:]();
  }
LABEL_16:
  id v24 = [(NTTodayResultOperation *)self operationInfo];
  __int16 v25 = objc_opt_new();
  [v25 setCatchUpOperationResultsBySectionDescriptor:v16];
  [v25 setAppConfiguration:v17];
  id v26 = [(NTTodayResultOperation *)self contentContext];
  [v25 setContentContext:v26];

  [v25 setFeedPersonalizer:v18];
  [v25 setTodayData:v33];
  uint64_t v27 = [(NTNewsTodayResultOperation *)self forYouFetchInfo];
  [v25 setForYouFetchInfo:v27];

  [v25 setOperationInfo:v24];
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __184__NTNewsTodayResultOperation__finalizeTodayResultsWithSectionDescriptors_catchUpOperationResultsBySectionDescriptor_appConfiguration_feedPersonalizer_todayData_todayBanner_completion___block_invoke;
  v34[3] = &unk_26475CE40;
  id v35 = v15;
  id v36 = v16;
  id v37 = v24;
  id v38 = self;
  id v39 = v19;
  id v40 = v20;
  id v28 = v19;
  id v29 = v24;
  id v30 = v16;
  id v31 = v15;
  id v32 = v20;
  [v25 setTodayItemCompletion:v34];
  [(FCOperation *)self associateChildOperation:v25];
  [v25 start];
}

void __184__NTNewsTodayResultOperation__finalizeTodayResultsWithSectionDescriptors_catchUpOperationResultsBySectionDescriptor_appConfiguration_feedPersonalizer_todayData_todayBanner_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (v15)
  {
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
  else
  {
    id v16 = objc_opt_new();
    uint64_t v39 = 0;
    id v40 = &v39;
    uint64_t v41 = 0x2020000000;
    int v42 = 0;
    uint64_t v33 = 0;
    uint64_t v34 = &v33;
    uint64_t v35 = 0x3032000000;
    id v36 = __Block_byref_object_copy__0;
    id v37 = __Block_byref_object_dispose__0;
    id v38 = [MEMORY[0x263EFF910] distantFuture];
    id v17 = *(void **)(a1 + 32);
    uint64_t v23 = MEMORY[0x263EF8330];
    uint64_t v24 = 3221225472;
    __int16 v25 = __184__NTNewsTodayResultOperation__finalizeTodayResultsWithSectionDescriptors_catchUpOperationResultsBySectionDescriptor_appConfiguration_feedPersonalizer_todayData_todayBanner_completion___block_invoke_2;
    id v26 = &unk_26475CE18;
    id v27 = v11;
    id v28 = *(id *)(a1 + 40);
    id v29 = *(id *)(a1 + 48);
    id v18 = v16;
    id v30 = v18;
    id v31 = &v33;
    id v32 = &v39;
    [v17 enumerateObjectsUsingBlock:&v23];
    id v19 = [NTTodayResults alloc];
    uint64_t v20 = *((unsigned int *)v40 + 6);
    uint64_t v21 = v34[5];
    [*(id *)(a1 + 56) resultHeadlineScaleFactor];
    id v22 = [(NTTodayResults *)v19 initWithSourceIdentifier:@"news", v18, v20, v21, v14, v13, *(void *)(a1 + 64), v23, v24, v25, v26 sections promotionCriterion expirationDate headlineScale assetsHoldToken recordsHoldToken banner];
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();

    _Block_object_dispose(&v33, 8);
    _Block_object_dispose(&v39, 8);
  }
}

void __184__NTNewsTodayResultOperation__finalizeTodayResultsWithSectionDescriptors_catchUpOperationResultsBySectionDescriptor_appConfiguration_feedPersonalizer_todayData_todayBanner_completion___block_invoke_2(id *a1, void *a2, uint64_t a3)
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = [a1[4] objectForKeyedSubscript:v5];
  uint64_t v7 = [a1[5] objectForKeyedSubscript:v5];
  if ([v6 count])
  {
    int v51 = v6;
    __int16 v52 = v7;
    id v50 = a1;
    uint64_t v48 = a3;
    if ([a1[6] allowSectionTitles])
    {
      if ([a1[6] preferCompactSectionName]) {
        [v5 compactName];
      }
      else {
      uint64_t v8 = [v5 name];
      }
    }
    else
    {
      uint64_t v8 = 0;
    }
    id v9 = objc_opt_new();
    id v49 = (void *)v8;
    [v9 setName:v8];
    int v10 = [v5 nameColorLight];
    [v9 setNameColorLight:v10];

    id v11 = [v5 nameColorDark];
    [v9 setNameColorDark:v11];

    id v12 = [v5 actionTitle];
    [v9 setActionTitle:v12];

    id v13 = [v5 actionURL];
    [v9 setActionURL:v13];

    id v14 = [v5 nameActionURL];
    [v9 setNameActionURL:v14];

    id v15 = [v5 backgroundColorLight];
    [v9 setBackgroundColorLight:v15];

    id v16 = [v5 backgroundColorDark];
    [v9 setBackgroundColorDark:v16];

    id v45 = [NTSection alloc];
    id v17 = [v5 identifier];
    id v18 = [v5 subidentifier];
    id v19 = [v5 actionTitle];
    uint64_t v20 = [v5 actionURL];
    uint64_t v21 = [v5 personalizationFeatureID];
    id v22 = [v52 rankingFeedback];
    uint64_t v23 = [v5 referralBarName];
    uint64_t v24 = [v5 backingTagID];
    id v47 = v9;
    uint64_t v25 = [(NTSection *)v45 initWithIdentifier:v17 subidentifier:v18 actionTitle:v19 actionURL:v20 personalizationFeatureID:v21 items:v51 rankingFeedback:v22 displayDescriptor:v9 referralBarName:v23 backingTagID:v24];

    id v46 = (void *)v25;
    [v50[7] addObject:v25];
    id v26 = [MEMORY[0x263EFF910] distantFuture];
    id v27 = [MEMORY[0x263EFF910] distantFuture];
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v28 = [v52 items];
    uint64_t v29 = [v28 countByEnumeratingWithState:&v53 objects:v57 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v54;
      do
      {
        uint64_t v32 = 0;
        uint64_t v33 = v26;
        uint64_t v34 = v27;
        do
        {
          if (*(void *)v54 != v31) {
            objc_enumerationMutation(v28);
          }
          uint64_t v35 = *(void **)(*((void *)&v53 + 1) + 8 * v32);
          id v36 = [v35 cacheCutoffTimeRelativeDate];
          id v26 = [v33 earlierDate:v36];

          id v37 = [v35 cacheExpirationDate];
          id v27 = [v34 earlierDate:v37];

          ++v32;
          uint64_t v33 = v26;
          uint64_t v34 = v27;
        }
        while (v30 != v32);
        uint64_t v30 = [v28 countByEnumeratingWithState:&v53 objects:v57 count:16];
      }
      while (v30);
    }

    id v38 = objc_msgSend(v26, "dateByAddingTimeInterval:", (double)(unint64_t)objc_msgSend(v5, "cachedResultCutoffTime"));
    uint64_t v39 = [v27 earlierDate:v38];
    uint64_t v40 = [*(id *)(*((void *)v50[8] + 1) + 40) earlierDate:v39];
    uint64_t v41 = *((void *)v50[8] + 1);
    int v42 = *(void **)(v41 + 40);
    *(void *)(v41 + 40) = v40;

    if (!v48)
    {
      *(_DWORD *)(*((void *)v50[9] + 1) + 24) = [v5 promotionCriterion];
      if (NFInternalBuild())
      {
        id v43 = NewsCoreUserDefaults();
        uint64_t v44 = [v43 integerForKey:@"widget_promotion_criterion"];

        if (v44) {
          *(_DWORD *)(*((void *)v50[9] + 1) + 24) = v44;
        }
      }
    }

    id v6 = v51;
    uint64_t v7 = v52;
  }
}

- (id)todayBannerWithTodayConfig:(id)a3 todayData:(id)a4
{
  v55[2] = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = [(NTTodayResultOperation *)self operationInfo];
  int v7 = [v6 widgetSize];

  if (v7 != 4) {
    goto LABEL_8;
  }
  uint64_t v8 = [(NTNewsTodayResultOperation *)self todayConfig];
  if (([v8 hasWidgetBannerConfig] & 1) == 0)
  {

    goto LABEL_8;
  }
  id v9 = [(NTTodayResultOperation *)self todayBannerValidator];
  int v10 = [(NTNewsTodayResultOperation *)self todayConfig];
  id v11 = [v10 widgetBannerConfig];
  int v12 = [v9 validateWith:v5 bannerConfig:v11];

  if (!v12)
  {
LABEL_8:
    uint64_t v21 = 0;
    goto LABEL_9;
  }
  id v13 = [(NTNewsTodayResultOperation *)self todayConfig];
  id v14 = [v13 widgetBannerConfig];

  if ([v14 hasGradientBackgroundPair])
  {
    id v15 = [v14 gradientBackgroundPair];
    id v16 = [v15 light];
    id v17 = [(NTNewsTodayResultOperation *)self dictionaryFromColorGradient:v16];

    id v18 = [v14 gradientBackgroundPair];
    id v19 = [v18 dark];
    uint64_t v20 = [(NTNewsTodayResultOperation *)self dictionaryFromColorGradient:v19];
  }
  else
  {
    id v17 = [&unk_26D922778 objectForKeyedSubscript:*MEMORY[0x263F58FD0]];
    uint64_t v20 = [&unk_26D922778 objectForKeyedSubscript:*MEMORY[0x263F58FC8]];
  }
  id v50 = [(NTNewsTodayResultOperation *)self gradientBackgroundPairFromLightGradientDict:v17 darkGradientDict:v20];

  if ([v14 hasSolidBackgroundColorPair])
  {
    uint64_t v23 = (void *)MEMORY[0x263F593E8];
    uint64_t v24 = [v14 solidBackgroundColorPair];
    uint64_t v25 = [v24 light];
    id v26 = [v23 colorWithHexString:v25];

    id v27 = (void *)MEMORY[0x263F593E8];
    id v28 = [v14 solidBackgroundColorPair];
    uint64_t v29 = [v28 dark];
    uint64_t v30 = [v27 colorWithHexString:v29];

    v55[0] = v26;
    v55[1] = v30;
    uint64_t v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:v55 count:2];
  }
  else
  {
    uint64_t v31 = 0;
  }
  id v46 = [NTTodayBanner alloc];
  id v49 = [v14 identifier];
  int v48 = [v14 hasTitle];
  if (v48)
  {
    long long v54 = [v14 title];
  }
  else
  {
    long long v54 = @"Title";
  }
  int v47 = [v14 hasBody];
  if (v47)
  {
    long long v53 = [v14 body];
  }
  else
  {
    long long v53 = @"Body";
  }
  int v32 = [v14 hasActionURL];
  uint64_t v33 = NSURL;
  int v45 = v32;
  if (v32)
  {
    uint64_t v44 = [v14 actionURL];
    __int16 v52 = objc_msgSend(v33, "URLWithString:");
  }
  else
  {
    __int16 v52 = [NSURL URLWithString:@"http://news.apple.com"];
    uint64_t v44 = v52;
  }
  int v34 = [v14 hasActionButtonText];
  if (v34)
  {
    int v51 = [v14 actionButtonText];
  }
  else
  {
    int v51 = 0;
  }
  if ([v14 hasImageMethod]) {
    unint64_t v35 = -[NTNewsTodayResultOperation convertBannerImageMethodToNTBannerImageType:](self, "convertBannerImageMethodToNTBannerImageType:", [v14 imageMethod]);
  }
  else {
    unint64_t v35 = 3;
  }
  int v36 = [v14 hasImageURL];
  if (v36)
  {
    id v37 = NSURL;
    id v43 = [v14 imageURL];
    id v38 = objc_msgSend(v37, "URLWithString:");
  }
  else
  {
    id v38 = 0;
  }
  if ([v14 hasBackgroundMethod]) {
    unint64_t v39 = -[NTNewsTodayResultOperation convertBannerBackgroundMethodToNTBannerBackgroundType:](self, "convertBannerBackgroundMethodToNTBannerBackgroundType:", [v14 backgroundMethod]);
  }
  else {
    unint64_t v39 = 2;
  }
  uint64_t v40 = (void *)v31;
  if (![v14 hasSolidBackgroundColorPair]) {
    uint64_t v31 = 0;
  }
  uint64_t v41 = 0;
  if ([v14 hasNumberOfAppearancesToHide]) {
    uint64_t v41 = [v14 numberOfAppearancesToHide];
  }
  if ([v14 hasNumberOfTapsToHide]) {
    uint64_t v42 = [v14 numberOfTapsToHide];
  }
  else {
    uint64_t v42 = 0;
  }
  uint64_t v21 = [(NTTodayBanner *)v46 initWithIdentifier:v49 title:v54 body:v53 actionURL:v52 actionButtonText:v51 imageMethod:v35 imageURL:v38 backgroundMethod:v39 solidBackgroundColorPair:v31 gradientBackgroundPair:v50 numberOfAppearancesToHide:v41 numberOfTapsToHide:v42];
  if (v36)
  {
  }
  if (v34) {

  }
  if (v45) {
  if (v47)
  }

  if (v48) {
LABEL_9:
  }

  return v21;
}

id __67__NTNewsTodayResultOperation_todayBannerWithTodayConfig_todayData___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (unint64_t)convertBannerImageMethodToNTBannerImageType:(int)a3
{
  unint64_t v3 = 1;
  if (a3 == 2) {
    unint64_t v3 = 2;
  }
  if (a3 == 3) {
    return 3;
  }
  else {
    return v3;
  }
}

- (unint64_t)convertBannerBackgroundMethodToNTBannerBackgroundType:(int)a3
{
  if (a3 == 1) {
    return 1;
  }
  else {
    return 2;
  }
}

- (id)gradientBackgroundPairFromLightGradientDict:(id)a3 darkGradientDict:(id)a4
{
  v11[2] = *MEMORY[0x263EF8340];
  id v5 = (void *)MEMORY[0x263F593F0];
  id v6 = a4;
  int v7 = [v5 colorGradientWithConfigDict:a3];
  uint64_t v8 = [MEMORY[0x263F593F0] colorGradientWithConfigDict:v6];

  v11[0] = v7;
  v11[1] = v8;
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];

  return v9;
}

- (id)dictionaryFromColorGradient:(id)a3
{
  v43[2] = *MEMORY[0x263EF8340];
  id v3 = a3;
  v42[0] = @"x";
  id v4 = NSNumber;
  id v5 = [v3 startPoint];
  [v5 x];
  id v6 = objc_msgSend(v4, "numberWithDouble:");
  v42[1] = @"y";
  v43[0] = v6;
  int v7 = NSNumber;
  uint64_t v8 = [v3 startPoint];
  [v8 y];
  id v9 = objc_msgSend(v7, "numberWithDouble:");
  v43[1] = v9;
  uint64_t v29 = [NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:2];

  v40[0] = @"x";
  int v10 = NSNumber;
  id v11 = [v3 endPoint];
  [v11 x];
  int v12 = objc_msgSend(v10, "numberWithDouble:");
  v40[1] = @"y";
  v41[0] = v12;
  id v13 = NSNumber;
  id v14 = [v3 endPoint];
  [v14 y];
  id v15 = objc_msgSend(v13, "numberWithDouble:");
  v41[1] = v15;
  id v28 = [NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:2];

  id v16 = [MEMORY[0x263EFF980] array];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v30 = v3;
  id v17 = [v3 colorStops];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v32 != v20) {
          objc_enumerationMutation(v17);
        }
        id v22 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        v37[0] = @"color";
        uint64_t v23 = [v22 color];
        v37[1] = @"location";
        v38[0] = v23;
        uint64_t v24 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v22, "location"));
        v38[1] = v24;
        uint64_t v25 = [NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:2];

        [v16 addObject:v25];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v19);
  }

  v35[0] = @"startPoint";
  v35[1] = @"endPoint";
  v36[0] = v29;
  v36[1] = v28;
  v35[2] = @"colorStops";
  v36[2] = v16;
  id v26 = [NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:3];

  return v26;
}

- (id)_firstRefreshDateDefaultsKey
{
  id v3 = [(NTTodayResultOperation *)self operationInfo];
  int v4 = [v3 widgetSize];

  id v5 = @"first_widget_refresh_date";
  if (v4 == 1)
  {
    id v6 = NSString;
    int v7 = [(NTTodayResultOperation *)self operationInfo];
    uint64_t v8 = [v7 request];
    id v9 = [v8 identifier];
    int v10 = [(NTTodayResultOperation *)self operationInfo];
    id v5 = [v6 stringWithFormat:@"%@_%@-%d", @"first_widget_refresh_date", v9, objc_msgSend(v10, "widgetSize")];
  }

  return v5;
}

- (NSMutableSet)articleIDsToExclude
{
  return self->_articleIDsToExclude;
}

- (void)setArticleIDsToExclude:(id)a3
{
}

- (NTPBTodayConfig)todayConfig
{
  return self->_todayConfig;
}

- (void)setTodayConfig:(id)a3
{
}

- (NSDate)filterDate
{
  return self->_filterDate;
}

- (void)setFilterDate:(id)a3
{
}

- (NTCatchUpOperationForYouFetchInfo)forYouFetchInfo
{
  return self->_forYouFetchInfo;
}

- (void)setForYouFetchInfo:(id)a3
{
}

- (double)resultHeadlineScaleFactor
{
  return self->_resultHeadlineScaleFactor;
}

- (void)setResultHeadlineScaleFactor:(double)a3
{
  self->_resultHeadlineScaleFactor = a3;
}

- (NTTodayResults)resultTodayResults
{
  return self->_resultTodayResults;
}

- (void)setResultTodayResults:(id)a3
{
}

- (NSDictionary)resultAssetHandlesByAssetID
{
  return self->_resultAssetHandlesByAssetID;
}

- (void)setResultAssetHandlesByAssetID:(id)a3
{
}

- (NTPBTodayResultOperationFetchInfo)resultFetchInfo
{
  return self->_resultFetchInfo;
}

- (void)setResultFetchInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultFetchInfo, 0);
  objc_storeStrong((id *)&self->_resultAssetHandlesByAssetID, 0);
  objc_storeStrong((id *)&self->_resultTodayResults, 0);
  objc_storeStrong((id *)&self->_forYouFetchInfo, 0);
  objc_storeStrong((id *)&self->_filterDate, 0);
  objc_storeStrong((id *)&self->_todayConfig, 0);

  objc_storeStrong((id *)&self->_articleIDsToExclude, 0);
}

- (void)validateOperation
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v0 = (void *)[[NSString alloc] initWithFormat:@"News today result operation must have a content context"];
  v2[0] = 136315906;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)v2);
}

- (void)_sectionCTRsWithTodayConfig:personalizationTreatment:aggregateStore:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"aggregateStore", v6, 2u);
}

- (void)_sectionCTRsWithTodayConfig:personalizationTreatment:aggregateStore:.cold.2()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"personalizationTreatment", v6, 2u);
}

- (void)_sectionCTRsWithTodayConfig:personalizationTreatment:aggregateStore:.cold.3()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"todayConfig", v6, 2u);
}

- (void)_assembleQueueDescriptorsWithConfig:allowOnlyWatchEligibleSections:respectsWidgetVisibleSectionsLimit:personalizationTreatment:aggregateStore:appConfiguration:todayData:completion:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"completion", v6, 2u);
}

- (void)_assembleQueueDescriptorsWithConfig:allowOnlyWatchEligibleSections:respectsWidgetVisibleSectionsLimit:personalizationTreatment:aggregateStore:appConfiguration:todayData:completion:.cold.2()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"appConfiguration", v6, 2u);
}

- (void)_assembleQueueDescriptorsWithConfig:allowOnlyWatchEligibleSections:respectsWidgetVisibleSectionsLimit:personalizationTreatment:aggregateStore:appConfiguration:todayData:completion:.cold.3()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"aggregateStore", v6, 2u);
}

- (void)_assembleQueueDescriptorsWithConfig:allowOnlyWatchEligibleSections:respectsWidgetVisibleSectionsLimit:personalizationTreatment:aggregateStore:appConfiguration:todayData:completion:.cold.4()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"personalizationTreatment", v6, 2u);
}

- (void)_assembleQueueDescriptorsWithConfig:allowOnlyWatchEligibleSections:respectsWidgetVisibleSectionsLimit:personalizationTreatment:aggregateStore:appConfiguration:todayData:completion:.cold.5()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"todayConfig", v6, 2u);
}

- (void)_fetchTodayResultsWithFetchHelper:aggregator:budgetInfo:appConfiguration:feedPersonalizer:todayData:todayBanner:completion:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"completion", v6, 2u);
}

- (void)_fetchTodayResultsWithFetchHelper:aggregator:budgetInfo:appConfiguration:feedPersonalizer:todayData:todayBanner:completion:.cold.2()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"fetchHelper", v6, 2u);
}

- (void)_registerForYouFetchWithForYouFetchInfo:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"forYouFetchInfo", v6, 2u);
}

- (void)_finalizeTodayResultsWithSectionDescriptors:catchUpOperationResultsBySectionDescriptor:appConfiguration:feedPersonalizer:todayData:todayBanner:completion:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"completion", v6, 2u);
}

- (void)_finalizeTodayResultsWithSectionDescriptors:catchUpOperationResultsBySectionDescriptor:appConfiguration:feedPersonalizer:todayData:todayBanner:completion:.cold.2()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"feedPersonalizer", v6, 2u);
}

- (void)_finalizeTodayResultsWithSectionDescriptors:catchUpOperationResultsBySectionDescriptor:appConfiguration:feedPersonalizer:todayData:todayBanner:completion:.cold.3()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"appConfiguration", v6, 2u);
}

- (void)_finalizeTodayResultsWithSectionDescriptors:catchUpOperationResultsBySectionDescriptor:appConfiguration:feedPersonalizer:todayData:todayBanner:completion:.cold.4()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"sectionDescriptors.count == [catchUpOperationResultsBySectionDescriptor nf_objectsForKeysWithoutMarker:sectionDescriptors].count", v6, 2u);
}

- (void)_finalizeTodayResultsWithSectionDescriptors:catchUpOperationResultsBySectionDescriptor:appConfiguration:feedPersonalizer:todayData:todayBanner:completion:.cold.5()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"catchUpOperationResultsBySectionDescriptor", v6, 2u);
}

- (void)_finalizeTodayResultsWithSectionDescriptors:catchUpOperationResultsBySectionDescriptor:appConfiguration:feedPersonalizer:todayData:todayBanner:completion:.cold.6()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"sectionDescriptors", v6, 2u);
}

@end