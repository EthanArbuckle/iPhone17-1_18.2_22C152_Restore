@interface NTSectionFeedFilterTransformation
- (NTFeedTransforming)underlyingTransformation;
- (NTSectionFeedFilterTransformation)init;
- (NTSectionFeedFilterTransformation)initWithTodayData:(id)a3 configurationManager:(id)a4 readArticlesFilterMethod:(int)a5 seenArticlesFilterMethod:(int)a6 minimumTimeSinceFirstSeenToFilter:(double)a7 supplementalFeedFilterOptions:(unint64_t)a8 otherArticleIDs:(id)a9 otherClusterIDs:(id)a10 filterDate:(id)a11 paywalledArticlesMaxCount:(unint64_t)a12;
- (id)transformFeedItems:(id)a3;
@end

@implementation NTSectionFeedFilterTransformation

- (NTFeedTransforming)underlyingTransformation
{
  return self->_underlyingTransformation;
}

uint64_t __56__NTSectionFeedFilterTransformation_transformFeedItems___block_invoke_2(uint64_t a1, void *a2)
{
  id v9 = a2;
  v3 = [v9 feedTransformationItem];

  if (v3)
  {
    unint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    unint64_t v5 = [*(id *)(a1 + 32) count];
    id v6 = v9;
    if (v4 >= v5) {
      goto LABEL_8;
    }
    v7 = [*(id *)(a1 + 32) objectAtIndexedSubscript:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
    if (![v9 isEqual:v7])
    {

      goto LABEL_7;
    }
    ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  }
  unint64_t v5 = [*(id *)(a1 + 40) addObject:v9];
LABEL_7:
  id v6 = v9;
LABEL_8:

  return MEMORY[0x270F9A758](v5, v6);
}

- (void).cxx_destruct
{
}

BOOL __56__NTSectionFeedFilterTransformation_transformFeedItems___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 feedTransformationItem];
  BOOL v3 = v2 != 0;

  return v3;
}

- (NTSectionFeedFilterTransformation)init
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[NTSectionFeedFilterTransformation init]";
    __int16 v9 = 2080;
    v10 = "NTSectionFeedFilterTransformation.m";
    __int16 v11 = 1024;
    int v12 = 65;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_22592C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  BOOL v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF498];
  unint64_t v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[NTSectionFeedFilterTransformation init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (NTSectionFeedFilterTransformation)initWithTodayData:(id)a3 configurationManager:(id)a4 readArticlesFilterMethod:(int)a5 seenArticlesFilterMethod:(int)a6 minimumTimeSinceFirstSeenToFilter:(double)a7 supplementalFeedFilterOptions:(unint64_t)a8 otherArticleIDs:(id)a9 otherClusterIDs:(id)a10 filterDate:(id)a11 paywalledArticlesMaxCount:(unint64_t)a12
{
  id v19 = a3;
  id v20 = a4;
  id v21 = a9;
  id v22 = a10;
  id v23 = a11;
  if (!v20 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[NTSectionFeedFilterTransformation initWithTodayData:configurationManager:readArticlesFilterMethod:seenArticlesFilterMethod:minimumTimeSinceFirstSeenToFilter:supplementalFeedFilterOptions:otherArticleIDs:otherClusterIDs:filterDate:paywalledArticlesMaxCount:].cold.4();
    if (v21) {
      goto LABEL_6;
    }
  }
  else if (v21)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTSectionFeedFilterTransformation initWithTodayData:configurationManager:readArticlesFilterMethod:seenArticlesFilterMethod:minimumTimeSinceFirstSeenToFilter:supplementalFeedFilterOptions:otherArticleIDs:otherClusterIDs:filterDate:paywalledArticlesMaxCount:]();
  }
LABEL_6:
  if (!v22 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[NTSectionFeedFilterTransformation initWithTodayData:configurationManager:readArticlesFilterMethod:seenArticlesFilterMethod:minimumTimeSinceFirstSeenToFilter:supplementalFeedFilterOptions:otherArticleIDs:otherClusterIDs:filterDate:paywalledArticlesMaxCount:]();
    if (v23) {
      goto LABEL_11;
    }
  }
  else if (v23)
  {
    goto LABEL_11;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTSectionFeedFilterTransformation initWithTodayData:configurationManager:readArticlesFilterMethod:seenArticlesFilterMethod:minimumTimeSinceFirstSeenToFilter:supplementalFeedFilterOptions:otherArticleIDs:otherClusterIDs:filterDate:paywalledArticlesMaxCount:]();
  }
LABEL_11:
  v71.receiver = self;
  v71.super_class = (Class)NTSectionFeedFilterTransformation;
  v24 = [(NTSectionFeedFilterTransformation *)&v71 init];
  if (v24)
  {
    int v53 = a6;
    v54 = v21;
    v55 = v20;
    v25 = (void *)MEMORY[0x263EFFA08];
    v26 = [v19 rankedAllSubscribedTagIDs];
    v50 = [v25 setWithArray:v26];

    v27 = [v19 mutedTagIDs];
    v28 = v27;
    unint64_t v51 = a8;
    if (v27) {
      id v29 = v27;
    }
    else {
      id v29 = (id)objc_opt_new();
    }
    v30 = v29;

    v31 = [v19 recentlyReadHistoryItems];
    uint64_t v32 = [v31 allValues];
    v33 = (void *)v32;
    v34 = (void *)MEMORY[0x263EFFA68];
    if (v32) {
      v35 = (void *)v32;
    }
    else {
      v35 = (void *)MEMORY[0x263EFFA68];
    }
    id v36 = v35;

    uint64_t v37 = [v19 recentlySeenHistoryItems];
    v38 = (void *)v37;
    if (v37) {
      v39 = (void *)v37;
    }
    else {
      v39 = v34;
    }
    id v40 = v39;

    v41 = (void *)MEMORY[0x263EFF8C0];
    v56[0] = MEMORY[0x263EF8330];
    v56[1] = 3221225472;
    v56[2] = __259__NTSectionFeedFilterTransformation_initWithTodayData_configurationManager_readArticlesFilterMethod_seenArticlesFilterMethod_minimumTimeSinceFirstSeenToFilter_supplementalFeedFilterOptions_otherArticleIDs_otherClusterIDs_filterDate_paywalledArticlesMaxCount___block_invoke;
    v56[3] = &unk_26475C790;
    int v69 = a5;
    id v57 = v36;
    int v70 = v53;
    id v58 = v23;
    id v59 = v40;
    double v66 = a7;
    unint64_t v67 = v51;
    id v60 = v19;
    id v61 = v55;
    id v62 = v54;
    id v63 = v22;
    id v64 = v50;
    id v65 = v30;
    unint64_t v68 = a12;
    id v52 = v30;
    id v42 = v50;
    id v43 = v40;
    id v44 = v36;
    v45 = objc_msgSend(v41, "fc_array:", v56);
    v46 = (void *)[objc_alloc(MEMORY[0x263F59478]) initWithFeedTransformations:v45];
    v47 = [[NTFeedTransformationItemFeedTransformation alloc] initWithFeedItemTransformation:v46];
    underlyingTransformation = v24->_underlyingTransformation;
    v24->_underlyingTransformation = (NTFeedTransforming *)v47;

    id v20 = v55;
    id v21 = v54;
  }
  return v24;
}

void __259__NTSectionFeedFilterTransformation_initWithTodayData_configurationManager_readArticlesFilterMethod_seenArticlesFilterMethod_minimumTimeSinceFirstSeenToFilter_supplementalFeedFilterOptions_otherArticleIDs_otherClusterIDs_filterDate_paywalledArticlesMaxCount___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = (objc_class *)MEMORY[0x263F594B0];
  id v4 = a2;
  id v5 = [v3 alloc];
  int v6 = *(_DWORD *)(a1 + 128);
  if (v6 == 1) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = 2 * (v6 == 0);
  }
  id v21 = (id)[v5 initWithFilterMethod:v7 consumedArticleItems:*(void *)(a1 + 32) minimumTimeSinceFirstConsumedToFilter:*(void *)(a1 + 40) filterDate:&__block_literal_global_5 articleIDProvider:&__block_literal_global_22 dateOfArticleIDConsumptionProvider:&__block_literal_global_26 maxVersionConsumedProvider:0.0 dateOfMaxVersionConsumptionProvider:&__block_literal_global_28];
  [v4 addObject:v21];
  id v8 = objc_alloc(MEMORY[0x263F594B0]);
  int v9 = *(_DWORD *)(a1 + 132);
  if (v9 == 1) {
    uint64_t v10 = 1;
  }
  else {
    uint64_t v10 = 2 * (v9 == 2);
  }
  id v20 = (void *)[v8 initWithFilterMethod:v10 consumedArticleItems:*(void *)(a1 + 48) minimumTimeSinceFirstConsumedToFilter:*(void *)(a1 + 40) filterDate:&__block_literal_global_31 articleIDProvider:&__block_literal_global_34 dateOfArticleIDConsumptionProvider:&__block_literal_global_37 maxVersionConsumedProvider:*(double *)(a1 + 104) dateOfMaxVersionConsumptionProvider:&__block_literal_global_39];
  [v4 addObject:v20];
  uint64_t v11 = *(void *)(a1 + 112) | 0x312;
  int v12 = (void *)[objc_alloc(MEMORY[0x263F595A8]) initWithPurchaseProvider:*(void *)(a1 + 56) bundleSubscriptionProvider:*(void *)(a1 + 56) configurationManager:*(void *)(a1 + 64)];
  __int16 v13 = (void *)MEMORY[0x263F59480];
  uint64_t v14 = *(void *)(a1 + 72);
  uint64_t v15 = *(void *)(a1 + 80);
  uint64_t v16 = *(void *)(a1 + 88);
  uint64_t v17 = *(void *)(a1 + 96);
  v18 = [*(id *)(a1 + 56) bundleSubscription];
  id v19 = [v13 transformationWithFilterOptions:v11 otherArticleIDs:v14 otherClusterIDs:v15 subscribedTagIDs:v16 mutedTagIDs:v17 readingHistoryItems:0 playlistArticleIDs:0 downloadedArticleIDs:0 briefingsTagID:0 paidAccessChecker:v12 bundleSubscription:v18 paywalledArticlesMaxCount:*(void *)(a1 + 120)];
  [v4 addObject:v19];
}

uint64_t __259__NTSectionFeedFilterTransformation_initWithTodayData_configurationManager_readArticlesFilterMethod_seenArticlesFilterMethod_minimumTimeSinceFirstSeenToFilter_supplementalFeedFilterOptions_otherArticleIDs_otherClusterIDs_filterDate_paywalledArticlesMaxCount___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 articleID];
}

uint64_t __259__NTSectionFeedFilterTransformation_initWithTodayData_configurationManager_readArticlesFilterMethod_seenArticlesFilterMethod_minimumTimeSinceFirstSeenToFilter_supplementalFeedFilterOptions_otherArticleIDs_otherClusterIDs_filterDate_paywalledArticlesMaxCount___block_invoke_3()
{
  return [MEMORY[0x263EFF910] distantPast];
}

uint64_t __259__NTSectionFeedFilterTransformation_initWithTodayData_configurationManager_readArticlesFilterMethod_seenArticlesFilterMethod_minimumTimeSinceFirstSeenToFilter_supplementalFeedFilterOptions_otherArticleIDs_otherClusterIDs_filterDate_paywalledArticlesMaxCount___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 maxVersionRead];
}

uint64_t __259__NTSectionFeedFilterTransformation_initWithTodayData_configurationManager_readArticlesFilterMethod_seenArticlesFilterMethod_minimumTimeSinceFirstSeenToFilter_supplementalFeedFilterOptions_otherArticleIDs_otherClusterIDs_filterDate_paywalledArticlesMaxCount___block_invoke_5()
{
  return [MEMORY[0x263EFF910] distantPast];
}

uint64_t __259__NTSectionFeedFilterTransformation_initWithTodayData_configurationManager_readArticlesFilterMethod_seenArticlesFilterMethod_minimumTimeSinceFirstSeenToFilter_supplementalFeedFilterOptions_otherArticleIDs_otherClusterIDs_filterDate_paywalledArticlesMaxCount___block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 articleID];
}

uint64_t __259__NTSectionFeedFilterTransformation_initWithTodayData_configurationManager_readArticlesFilterMethod_seenArticlesFilterMethod_minimumTimeSinceFirstSeenToFilter_supplementalFeedFilterOptions_otherArticleIDs_otherClusterIDs_filterDate_paywalledArticlesMaxCount___block_invoke_7(uint64_t a1, void *a2)
{
  return [a2 firstSeenAt];
}

uint64_t __259__NTSectionFeedFilterTransformation_initWithTodayData_configurationManager_readArticlesFilterMethod_seenArticlesFilterMethod_minimumTimeSinceFirstSeenToFilter_supplementalFeedFilterOptions_otherArticleIDs_otherClusterIDs_filterDate_paywalledArticlesMaxCount___block_invoke_8(uint64_t a1, void *a2)
{
  return [a2 maxVersionSeen];
}

uint64_t __259__NTSectionFeedFilterTransformation_initWithTodayData_configurationManager_readArticlesFilterMethod_seenArticlesFilterMethod_minimumTimeSinceFirstSeenToFilter_supplementalFeedFilterOptions_otherArticleIDs_otherClusterIDs_filterDate_paywalledArticlesMaxCount___block_invoke_9(uint64_t a1, void *a2)
{
  return [a2 firstSeenAtOfMaxVersionSeen];
}

- (id)transformFeedItems:(id)a3
{
  id v4 = a3;
  if (!v4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTSectionFeedFilterTransformation transformFeedItems:]();
  }
  id v5 = objc_msgSend(v4, "fc_arrayOfObjectsPassingTest:", &__block_literal_global_48);
  int v6 = [(NTSectionFeedFilterTransformation *)self underlyingTransformation];
  uint64_t v7 = [v6 transformFeedItems:v5];

  id v8 = objc_opt_new();
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v18[3] = 0;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __56__NTSectionFeedFilterTransformation_transformFeedItems___block_invoke_2;
  v14[3] = &unk_26475C7D8;
  uint64_t v17 = v18;
  id v9 = v7;
  id v15 = v9;
  id v10 = v8;
  id v16 = v10;
  [v4 enumerateObjectsUsingBlock:v14];
  uint64_t v11 = v16;
  id v12 = v10;

  _Block_object_dispose(v18, 8);

  return v12;
}

- (void)initWithTodayData:configurationManager:readArticlesFilterMethod:seenArticlesFilterMethod:minimumTimeSinceFirstSeenToFilter:supplementalFeedFilterOptions:otherArticleIDs:otherClusterIDs:filterDate:paywalledArticlesMaxCount:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"filterDate", v6, 2u);
}

- (void)initWithTodayData:configurationManager:readArticlesFilterMethod:seenArticlesFilterMethod:minimumTimeSinceFirstSeenToFilter:supplementalFeedFilterOptions:otherArticleIDs:otherClusterIDs:filterDate:paywalledArticlesMaxCount:.cold.2()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"otherClusterIDs", v6, 2u);
}

- (void)initWithTodayData:configurationManager:readArticlesFilterMethod:seenArticlesFilterMethod:minimumTimeSinceFirstSeenToFilter:supplementalFeedFilterOptions:otherArticleIDs:otherClusterIDs:filterDate:paywalledArticlesMaxCount:.cold.3()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"otherArticleIDs", v6, 2u);
}

- (void)initWithTodayData:configurationManager:readArticlesFilterMethod:seenArticlesFilterMethod:minimumTimeSinceFirstSeenToFilter:supplementalFeedFilterOptions:otherArticleIDs:otherClusterIDs:filterDate:paywalledArticlesMaxCount:.cold.4()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"configurationManager", v6, 2u);
}

- (void)transformFeedItems:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"feedItems", v6, 2u);
}

@end