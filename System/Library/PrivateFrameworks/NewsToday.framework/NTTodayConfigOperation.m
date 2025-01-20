@interface NTTodayConfigOperation
- (BOOL)validateOperation;
- (FCContentContext)context;
- (FCCoreConfiguration)configuration;
- (NSArray)networkEvents;
- (NSDictionary)resultHeldRecordsByType;
- (NSError)defaultConfigError;
- (NSError)singleTagConfigError;
- (NSString)widgetConfigID;
- (NTPBTodayConfig)resultDefaultConfig;
- (NTPBTodayConfig)resultSingleTagConfig;
- (NTTodayConfigOperation)init;
- (id)_todayConfigWithConfigJSON:(id)a3 articleListIDs:(id)a4 articleIDs:(id)a5 error:(id *)a6;
- (id)defaultConfigCompletionHandler;
- (id)singleTagConfigCompletionHandler;
- (void)_collectRecordIDsReferencedBySectionConfig:(id)a3 withArticleListIDs:(id)a4 articleIDs:(id)a5;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)setConfiguration:(id)a3;
- (void)setContext:(id)a3;
- (void)setDefaultConfigCompletionHandler:(id)a3;
- (void)setDefaultConfigError:(id)a3;
- (void)setNetworkEvents:(id)a3;
- (void)setResultDefaultConfig:(id)a3;
- (void)setResultHeldRecordsByType:(id)a3;
- (void)setResultSingleTagConfig:(id)a3;
- (void)setSingleTagConfigCompletionHandler:(id)a3;
- (void)setSingleTagConfigError:(id)a3;
- (void)setWidgetConfigID:(id)a3;
- (void)validateOperation;
@end

@implementation NTTodayConfigOperation

- (NTTodayConfigOperation)init
{
  v3.receiver = self;
  v3.super_class = (Class)NTTodayConfigOperation;
  return [(FCOperation *)&v3 init];
}

- (BOOL)validateOperation
{
  objc_super v3 = [(NTTodayConfigOperation *)self configuration];

  if (!v3 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTTodayConfigOperation validateOperation].cold.5();
  }
  v4 = [(NTTodayConfigOperation *)self context];

  if (!v4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTTodayConfigOperation validateOperation].cold.4();
  }
  v5 = [(NTTodayConfigOperation *)self widgetConfigID];

  if (!v5 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTTodayConfigOperation validateOperation]();
  }
  v6 = [(NTTodayConfigOperation *)self defaultConfigCompletionHandler];

  if (!v6 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTTodayConfigOperation validateOperation]();
  }
  v7 = [(NTTodayConfigOperation *)self singleTagConfigCompletionHandler];

  if (!v7 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTTodayConfigOperation validateOperation]();
  }
  if (v3) {
    BOOL v8 = v4 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  return !v8 && v5 != 0 && v6 != 0 && v7 != 0;
}

- (void)performOperation
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)*MEMORY[0x263F592D0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F592D0], OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    v5 = [(FCOperation *)self shortOperationDescription];
    v6 = [(NTTodayConfigOperation *)self widgetConfigID];
    *(_DWORD *)buf = 138543618;
    v32 = v5;
    __int16 v33 = 2112;
    v34 = v6;
    _os_log_impl(&dword_22592C000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ will request config with ID %@", buf, 0x16u);
  }
  id v7 = objc_alloc_init(MEMORY[0x263F59630]);
  BOOL v8 = [(NTTodayConfigOperation *)self context];
  [v7 setContext:v8];

  v9 = [MEMORY[0x263F59428] edgeCacheHintForToday];
  [v7 setEdgeCacheHint:v9];

  v10 = [(NTTodayConfigOperation *)self widgetConfigID];
  v30 = v10;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v30 count:1];
  [v7 setTopLevelRecordIDs:v11];

  [v7 setShouldReturnErrorWhenSomeRecordsMissing:1];
  [v7 setShouldBypassRecordSourcePersistence:1];
  v28[0] = *MEMORY[0x263F59128];
  uint64_t v12 = *MEMORY[0x263F59060];
  v27[0] = *MEMORY[0x263F59068];
  v27[1] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:2];
  v29[0] = v13;
  v28[1] = *MEMORY[0x263F58F18];
  uint64_t v26 = *MEMORY[0x263F58F10];
  v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v26 count:1];
  v29[1] = v14;
  v28[2] = *MEMORY[0x263F58F30];
  uint64_t v15 = *MEMORY[0x263F58F20];
  v25[0] = *MEMORY[0x263F58F48];
  v25[1] = v15;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:2];
  v29[2] = v16;
  uint64_t v17 = *MEMORY[0x263F58F88];
  v28[3] = *MEMORY[0x263F58FA0];
  v28[4] = v17;
  v29[3] = MEMORY[0x263EFFA68];
  v29[4] = MEMORY[0x263EFFA68];
  v18 = [NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:5];
  [v7 setLinkKeysByRecordType:v18];

  [v7 setDynamicCachePolicyBlock:&__block_literal_global_13];
  objc_initWeak((id *)buf, v7);
  uint64_t v19 = MEMORY[0x263EF8330];
  uint64_t v20 = 3221225472;
  v21 = __42__NTTodayConfigOperation_performOperation__block_invoke_2;
  v22 = &unk_26475D2F0;
  v23 = self;
  objc_copyWeak(&v24, (id *)buf);
  [v7 setRecordChainCompletionHandler:&v19];
  -[FCOperation associateChildOperation:](self, "associateChildOperation:", v7, v19, v20, v21, v22, v23);
  [v7 start];
  objc_destroyWeak(&v24);
  objc_destroyWeak((id *)buf);
}

uint64_t __42__NTTodayConfigOperation_performOperation__block_invoke()
{
  return [MEMORY[0x263F593D0] ignoreCacheCachePolicy];
}

void __42__NTTodayConfigOperation_performOperation__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __42__NTTodayConfigOperation_performOperation__block_invoke_3;
    v31[3] = &unk_26475D130;
    v31[4] = *(void *)(a1 + 32);
    id v32 = v6;
    __42__NTTodayConfigOperation_performOperation__block_invoke_3((uint64_t)v31);
    BOOL v8 = v32;
  }
  else
  {
    v28 = [v5 objectForKeyedSubscript:&unk_26D922588];
    v9 = [v28 onlyRecord];
    uint64_t v10 = [v9 configuration2];
    v11 = *(void **)(a1 + 32);
    uint64_t v12 = [v9 articleListIDs2s];
    v13 = [v9 articleIDs2s];
    id v30 = 0;
    v27 = (void *)v10;
    uint64_t v26 = [v11 _todayConfigWithConfigJSON:v10 articleListIDs:v12 articleIDs:v13 error:&v30];
    id v14 = v30;

    v25 = v14;
    [*(id *)(a1 + 32) setDefaultConfigError:v14];
    uint64_t v15 = [v9 singleTagConfiguration];
    if (!v15)
    {
      v16 = FCBundle();
      uint64_t v17 = [v16 URLForResource:@"SingleTagConfiguration" withExtension:@"json"];

      uint64_t v15 = (void *)[[NSString alloc] initWithContentsOfURL:v17 encoding:4 error:0];
    }
    v18 = *(void **)(a1 + 32);
    uint64_t v19 = [v9 articleListIDs2s];
    uint64_t v20 = [v9 articleIDs2s];
    id v29 = 0;
    v21 = [v18 _todayConfigWithConfigJSON:v15 articleListIDs:v19 articleIDs:v20 error:&v29];
    id v22 = v29;

    [*(id *)(a1 + 32) setSingleTagConfigError:v22];
    [*(id *)(a1 + 32) setResultDefaultConfig:v26];
    [*(id *)(a1 + 32) setResultSingleTagConfig:v21];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v24 = [WeakRetained networkEvents];
    [*(id *)(a1 + 32) setNetworkEvents:v24];

    [*(id *)(a1 + 32) setResultHeldRecordsByType:v5];
    [*(id *)(a1 + 32) finishedPerformingOperationWithError:0];

    BOOL v8 = v28;
  }
}

uint64_t __42__NTTodayConfigOperation_performOperation__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishedPerformingOperationWithError:*(void *)(a1 + 40)];
}

- (void)operationWillFinishWithError:(id)a3
{
  id v4 = a3;
  id v5 = [(NTTodayConfigOperation *)self defaultConfigCompletionHandler];
  id v6 = [(NTTodayConfigOperation *)self resultDefaultConfig];
  id v7 = [(NTTodayConfigOperation *)self resultHeldRecordsByType];
  uint64_t v8 = [(NTTodayConfigOperation *)self defaultConfigError];
  v9 = (void *)v8;
  if (v8) {
    uint64_t v10 = v8;
  }
  else {
    uint64_t v10 = (uint64_t)v4;
  }
  ((void (**)(void, void *, void *, uint64_t))v5)[2](v5, v6, v7, v10);

  v16 = [(NTTodayConfigOperation *)self singleTagConfigCompletionHandler];
  v11 = [(NTTodayConfigOperation *)self resultSingleTagConfig];
  uint64_t v12 = [(NTTodayConfigOperation *)self resultHeldRecordsByType];
  uint64_t v13 = [(NTTodayConfigOperation *)self singleTagConfigError];
  id v14 = (void *)v13;
  if (v13) {
    uint64_t v15 = v13;
  }
  else {
    uint64_t v15 = (uint64_t)v4;
  }
  v16[2](v16, v11, v12, v15);
}

- (id)_todayConfigWithConfigJSON:(id)a3 articleListIDs:(id)a4 articleIDs:(id)a5 error:(id *)a6
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = (void *)*MEMORY[0x263F592D0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F592D0], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = v12;
    id v14 = [(FCOperation *)self shortOperationDescription];
    *(_DWORD *)buf = 138543618;
    v68 = v14;
    __int16 v69 = 2114;
    id v70 = v9;
    _os_log_impl(&dword_22592C000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ received config JSON %{public}@", buf, 0x16u);
  }
  id v65 = 0;
  uint64_t v15 = objc_msgSend(NSDictionary, "fc_dictionaryFromJSON:error:", v9, &v65);
  id v16 = v65;
  uint64_t v17 = v16;
  if (v16)
  {
    id v18 = v16;
    uint64_t v19 = 0;
    if (!a6) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  v21 = [v15 objectForKeyedSubscript:*MEMORY[0x263F592A0]];
  if (v21)
  {
    v52 = v15;
    id v53 = v10;
    v50 = a6;
    id v51 = v9;
    id v22 = objc_opt_new();
    v57 = objc_opt_new();
    v56 = objc_opt_new();
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    v49 = v21;
    id obj = v21;
    uint64_t v23 = [obj countByEnumeratingWithState:&v61 objects:v66 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v62;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v62 != v25) {
            objc_enumerationMutation(obj);
          }
          v27 = [MEMORY[0x263F5A378] sectionConfigWithJSONDictionary:*(void *)(*((void *)&v61 + 1) + 8 * i)];
          if (v27)
          {
            [(NTTodayConfigOperation *)self _collectRecordIDsReferencedBySectionConfig:v27 withArticleListIDs:v57 articleIDs:v56];
            if ([v27 queueMembershipsCount])
            {
              unint64_t v28 = 0;
              do
              {
                id v29 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v27, "queueMembershipAtIndex:", v28));
                id v30 = [v22 objectForKeyedSubscript:v29];
                if (!v30)
                {
                  id v30 = objc_opt_new();
                  [v22 setObject:v30 forKeyedSubscript:v29];
                }
                [v30 addObject:v27];

                ++v28;
              }
              while (v28 < [v27 queueMembershipsCount]);
            }
          }
        }
        uint64_t v24 = [obj countByEnumeratingWithState:&v61 objects:v66 count:16];
      }
      while (v24);
    }

    uint64_t v31 = [MEMORY[0x263EFFA08] setWithArray:v53];
    uint64_t v32 = [MEMORY[0x263EFFA08] setWithArray:v11];
    id obja = (id)v31;
    if (([v57 isSubsetOfSet:v31] & 1) == 0
      && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      -[NTTodayConfigOperation _todayConfigWithConfigJSON:articleListIDs:articleIDs:error:]();
    }
    v48 = (void *)v32;
    uint64_t v15 = v52;
    if (([v56 isSubsetOfSet:v32] & 1) == 0
      && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      -[NTTodayConfigOperation _todayConfigWithConfigJSON:articleListIDs:articleIDs:error:]();
    }
    __int16 v33 = [v22 allKeys];
    v34 = [v33 sortedArrayUsingSelector:sel_compare_];

    v59[0] = MEMORY[0x263EF8330];
    v59[1] = 3221225472;
    v59[2] = __85__NTTodayConfigOperation__todayConfigWithConfigJSON_articleListIDs_articleIDs_error___block_invoke;
    v59[3] = &unk_26475D2A8;
    id v46 = v22;
    v47 = v34;
    id v60 = v46;
    uint64_t v35 = objc_msgSend(v34, "fc_arrayByTransformingWithBlock:", v59);
    v36 = [v52 objectForKeyedSubscript:*MEMORY[0x263F590F0]];
    v37 = [v52 objectForKeyedSubscript:*MEMORY[0x263F590A0]];
    v38 = [v52 objectForKeyedSubscript:*MEMORY[0x263F59098]];
    v39 = [v52 objectForKeyedSubscript:*MEMORY[0x263F59090]];
    uint64_t v40 = *MEMORY[0x263F58FE8];
    v41 = [v52 objectForKeyedSubscript:*MEMORY[0x263F58FE8]];

    if (v41)
    {
      v42 = (void *)MEMORY[0x263F5A340];
      v43 = [v52 objectForKeyedSubscript:v40];
      v44 = [v42 bannerConfigWithJSONDictionary:v43];

      uint64_t v15 = v52;
    }
    else
    {
      v44 = 0;
    }
    v45 = [(NTTodayConfigOperation *)self configuration];
    uint64_t v19 = [v45 todayConfigWithIdentifier:v36 queueConfigs:v35 backgroundColorLight:v37 backgroundColorDark:v38 audioIndicatorColor:v39 widgetBannerConfig:v44];

    id v18 = 0;
    a6 = v50;
    id v9 = v51;
    v21 = v49;
    uint64_t v17 = 0;
    id v10 = v53;
  }
  else
  {
    id v18 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F592B8] code:13 userInfo:0];
    uint64_t v19 = 0;
  }

  if (a6) {
LABEL_5:
  }
    *a6 = v18;
LABEL_6:

  return v19;
}

id __85__NTTodayConfigOperation__todayConfigWithConfigJSON_articleListIDs_articleIDs_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = objc_opt_new();
  [v4 setWidgetVisibleSectionsLimit:1];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3, 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        [v4 addTodaySectionConfigs:*(void *)(*((void *)&v11 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)_collectRecordIDsReferencedBySectionConfig:(id)a3 withArticleListIDs:(id)a4 articleIDs:(id)a5
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v8 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[NTTodayConfigOperation _collectRecordIDsReferencedBySectionConfig:withArticleListIDs:articleIDs:]();
    if (v9) {
      goto LABEL_6;
    }
  }
  else if (v9)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTTodayConfigOperation _collectRecordIDsReferencedBySectionConfig:withArticleListIDs:articleIDs:]();
  }
LABEL_6:
  switch([v7 sectionType])
  {
    case 0u:
      id v10 = [v7 articleListTodaySectionConfig];
      long long v11 = [v10 articleListID];

      [v8 addObject:v11];
      goto LABEL_41;
    case 3u:
      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v12 = [v7 articleIDsTodaySectionConfig];
      long long v11 = [v12 articles];

      uint64_t v13 = [v11 countByEnumeratingWithState:&v49 objects:v56 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v50;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v50 != v15) {
              objc_enumerationMutation(v11);
            }
            uint64_t v17 = [*(id *)(*((void *)&v49 + 1) + 8 * i) articleID];
            [v9 addObject:v17];
          }
          uint64_t v14 = [v11 countByEnumeratingWithState:&v49 objects:v56 count:16];
        }
        while (v14);
      }
      goto LABEL_41;
    case 4u:
      long long v11 = [v7 personalizedTodaySectionConfig];
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id v18 = [v11 mandatoryArticles];
      uint64_t v19 = [v18 countByEnumeratingWithState:&v45 objects:v55 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v46;
        do
        {
          for (uint64_t j = 0; j != v20; ++j)
          {
            if (*(void *)v46 != v21) {
              objc_enumerationMutation(v18);
            }
            uint64_t v23 = [*(id *)(*((void *)&v45 + 1) + 8 * j) articleID];
            [v9 addObject:v23];
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v45 objects:v55 count:16];
        }
        while (v20);
      }

      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      uint64_t v24 = [v11 personalizedArticles];
      uint64_t v25 = [v24 countByEnumeratingWithState:&v41 objects:v54 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v42;
        do
        {
          for (uint64_t k = 0; k != v26; ++k)
          {
            if (*(void *)v42 != v27) {
              objc_enumerationMutation(v24);
            }
            id v29 = [*(id *)(*((void *)&v41 + 1) + 8 * k) articleID];
            [v9 addObject:v29];
          }
          uint64_t v26 = [v24 countByEnumeratingWithState:&v41 objects:v54 count:16];
        }
        while (v26);
      }
      goto LABEL_40;
    case 5u:
      long long v11 = [v7 itemsTodaySectionConfig];
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      uint64_t v24 = objc_msgSend(v11, "items", 0);
      uint64_t v30 = [v24 countByEnumeratingWithState:&v37 objects:v53 count:16];
      if (v30)
      {
        uint64_t v31 = v30;
        uint64_t v32 = *(void *)v38;
        do
        {
          for (uint64_t m = 0; m != v31; ++m)
          {
            if (*(void *)v38 != v32) {
              objc_enumerationMutation(v24);
            }
            v34 = *(void **)(*((void *)&v37 + 1) + 8 * m);
            if (![v34 itemType])
            {
              uint64_t v35 = [v34 article];
              v36 = [v35 articleID];
              [v9 addObject:v36];
            }
          }
          uint64_t v31 = [v24 countByEnumeratingWithState:&v37 objects:v53 count:16];
        }
        while (v31);
      }
LABEL_40:

LABEL_41:
      break;
    default:
      break;
  }
}

- (FCCoreConfiguration)configuration
{
  return (FCCoreConfiguration *)objc_getProperty(self, a2, 368, 1);
}

- (void)setConfiguration:(id)a3
{
}

- (FCContentContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (NSString)widgetConfigID
{
  return self->_widgetConfigID;
}

- (void)setWidgetConfigID:(id)a3
{
}

- (NSArray)networkEvents
{
  return self->_networkEvents;
}

- (void)setNetworkEvents:(id)a3
{
}

- (id)defaultConfigCompletionHandler
{
  return self->_defaultConfigCompletionHandler;
}

- (void)setDefaultConfigCompletionHandler:(id)a3
{
}

- (id)singleTagConfigCompletionHandler
{
  return self->_singleTagConfigCompletionHandler;
}

- (void)setSingleTagConfigCompletionHandler:(id)a3
{
}

- (NTPBTodayConfig)resultDefaultConfig
{
  return self->_resultDefaultConfig;
}

- (void)setResultDefaultConfig:(id)a3
{
}

- (NSError)defaultConfigError
{
  return self->_defaultConfigError;
}

- (void)setDefaultConfigError:(id)a3
{
}

- (NTPBTodayConfig)resultSingleTagConfig
{
  return self->_resultSingleTagConfig;
}

- (void)setResultSingleTagConfig:(id)a3
{
}

- (NSError)singleTagConfigError
{
  return self->_singleTagConfigError;
}

- (void)setSingleTagConfigError:(id)a3
{
}

- (NSDictionary)resultHeldRecordsByType
{
  return self->_resultHeldRecordsByType;
}

- (void)setResultHeldRecordsByType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultHeldRecordsByType, 0);
  objc_storeStrong((id *)&self->_singleTagConfigError, 0);
  objc_storeStrong((id *)&self->_resultSingleTagConfig, 0);
  objc_storeStrong((id *)&self->_defaultConfigError, 0);
  objc_storeStrong((id *)&self->_resultDefaultConfig, 0);
  objc_storeStrong(&self->_singleTagConfigCompletionHandler, 0);
  objc_storeStrong(&self->_defaultConfigCompletionHandler, 0);
  objc_storeStrong((id *)&self->_networkEvents, 0);
  objc_storeStrong((id *)&self->_widgetConfigID, 0);
  objc_storeStrong((id *)&self->_context, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

- (void)validateOperation
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Today config operation requires a configuration."];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, 2u);
}

- (void)_todayConfigWithConfigJSON:articleListIDs:articleIDs:error:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"articleRecords must be in sync!"];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, 2u);
}

- (void)_todayConfigWithConfigJSON:articleListIDs:articleIDs:error:.cold.2()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"articleListRecords must be in sync!"];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, 2u);
}

- (void)_collectRecordIDsReferencedBySectionConfig:withArticleListIDs:articleIDs:.cold.1()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v0 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "articleIDs");
  *(_DWORD *)buf = 136315906;
  uint64_t v2 = "-[NTTodayConfigOperation _collectRecordIDsReferencedBySectionConfig:withArticleListIDs:articleIDs:]";
  __int16 v3 = 2080;
  uint64_t v4 = "NTTodayConfigOperation.m";
  __int16 v5 = 1024;
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_22592C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

- (void)_collectRecordIDsReferencedBySectionConfig:withArticleListIDs:articleIDs:.cold.2()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v0 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "articleListIDs");
  *(_DWORD *)buf = 136315906;
  uint64_t v2 = "-[NTTodayConfigOperation _collectRecordIDsReferencedBySectionConfig:withArticleListIDs:articleIDs:]";
  __int16 v3 = 2080;
  uint64_t v4 = "NTTodayConfigOperation.m";
  __int16 v5 = 1024;
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_22592C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

@end