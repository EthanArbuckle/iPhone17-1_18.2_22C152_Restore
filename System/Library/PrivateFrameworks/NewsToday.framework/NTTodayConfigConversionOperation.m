@interface NTTodayConfigConversionOperation
- (BOOL)validateOperation;
- (FCContentContext)context;
- (FCCoreConfiguration)configuration;
- (NSArray)networkEvents;
- (NSDictionary)resultHeldRecordsByType;
- (NSDictionary)widgetConfiguration;
- (NSError)defaultConfigError;
- (NSError)singleTagConfigError;
- (NTPBTodayConfig)resultDefaultConfig;
- (NTPBTodayConfig)resultSingleTagConfig;
- (NTTodayConfigConversionOperation)init;
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
- (void)setWidgetConfiguration:(id)a3;
- (void)validateOperation;
@end

@implementation NTTodayConfigConversionOperation

- (NTTodayConfigConversionOperation)init
{
  v3.receiver = self;
  v3.super_class = (Class)NTTodayConfigConversionOperation;
  return [(FCOperation *)&v3 init];
}

- (BOOL)validateOperation
{
  objc_super v3 = [(NTTodayConfigConversionOperation *)self widgetConfiguration];

  if (!v3 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTTodayConfigConversionOperation validateOperation].cold.5();
  }
  v4 = [(NTTodayConfigConversionOperation *)self configuration];

  if (!v4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTTodayConfigConversionOperation validateOperation].cold.4();
  }
  v5 = [(NTTodayConfigConversionOperation *)self context];

  if (!v5 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTTodayConfigConversionOperation validateOperation]();
  }
  v6 = [(NTTodayConfigConversionOperation *)self defaultConfigCompletionHandler];

  if (!v6 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTTodayConfigConversionOperation validateOperation]();
  }
  v7 = [(NTTodayConfigConversionOperation *)self singleTagConfigCompletionHandler];

  if (!v7 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTTodayConfigConversionOperation validateOperation]();
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
  uint64_t v12 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)*MEMORY[0x263F592D0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F592D0], OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    v5 = [(FCOperation *)self shortOperationDescription];
    *(_DWORD *)buf = 138543362;
    v11 = v5;
    _os_log_impl(&dword_22592C000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ will convert widget config data", buf, 0xCu);
  }
  v6 = objc_alloc_init(NTWidgetConfigDataOperation);
  v7 = [(NTTodayConfigConversionOperation *)self context];
  [(NTWidgetConfigDataOperation *)v6 setContext:v7];

  BOOL v8 = [(NTTodayConfigConversionOperation *)self widgetConfiguration];
  [(NTWidgetConfigDataOperation *)v6 setWidgetConfiguration:v8];

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __52__NTTodayConfigConversionOperation_performOperation__block_invoke;
  v9[3] = &unk_26475D280;
  v9[4] = self;
  [(NTWidgetConfigDataOperation *)v6 setWidgetConfigDataCompletionHandler:v9];
  [(FCOperation *)self associateChildOperation:v6];
  [(FCOperation *)v6 start];
}

void __52__NTTodayConfigConversionOperation_performOperation__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v13 = a2;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  v19 = (os_log_t *)MEMORY[0x263F592D0];
  v20 = (void *)*MEMORY[0x263F592D0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F592D0], OS_LOG_TYPE_DEFAULT))
  {
    v21 = *(void **)(a1 + 32);
    v22 = v20;
    v23 = [v21 shortOperationDescription];
    *(_DWORD *)buf = 138544642;
    v45 = v23;
    __int16 v46 = 2112;
    id v47 = v13;
    __int16 v48 = 2112;
    id v49 = v14;
    __int16 v50 = 2112;
    id v51 = v15;
    __int16 v52 = 2112;
    id v53 = v16;
    __int16 v54 = 2112;
    id v55 = v18;
    _os_log_impl(&dword_22592C000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ received defaultConfigDictionary: %@, singleTagConfigDictionary: %@, articleIDs: %@, articleListIDs: %@, error: %@ ", buf, 0x3Eu);
  }
  if (v18)
  {
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = __52__NTTodayConfigConversionOperation_performOperation__block_invoke_18;
    v42[3] = &unk_26475D130;
    v42[4] = *(void *)(a1 + 32);
    id v43 = v18;
    __52__NTTodayConfigConversionOperation_performOperation__block_invoke_18((uint64_t)v42);
    v24 = v43;
  }
  else
  {
    v25 = *(void **)(a1 + 32);
    id v41 = 0;
    v26 = [v25 _todayConfigWithConfigJSON:v13 articleListIDs:v16 articleIDs:v15 error:&v41];
    id v39 = v41;
    objc_msgSend(*(id *)(a1 + 32), "setDefaultConfigError:");
    v27 = *(void **)(a1 + 32);
    id v40 = 0;
    uint64_t v28 = [v27 _todayConfigWithConfigJSON:v14 articleListIDs:v16 articleIDs:v15 error:&v40];
    id v37 = v40;
    objc_msgSend(*(id *)(a1 + 32), "setSingleTagConfigError:");
    [*(id *)(a1 + 32) setResultDefaultConfig:v26];
    v38 = (void *)v28;
    [*(id *)(a1 + 32) setResultSingleTagConfig:v28];
    [*(id *)(a1 + 32) setResultHeldRecordsByType:v17];
    os_log_t v29 = *v19;
    if (os_log_type_enabled(*v19, OS_LOG_TYPE_DEFAULT))
    {
      v30 = *(void **)(a1 + 32);
      log = v29;
      v34 = [v30 shortOperationDescription];
      v31 = [*(id *)(a1 + 32) resultDefaultConfig];
      v32 = [*(id *)(a1 + 32) resultSingleTagConfig];
      [*(id *)(a1 + 32) resultHeldRecordsByType];
      v33 = v36 = v26;
      *(_DWORD *)buf = 138544130;
      v45 = v34;
      __int16 v46 = 2112;
      id v47 = v31;
      __int16 v48 = 2112;
      id v49 = v32;
      __int16 v50 = 2048;
      id v51 = v33;
      _os_log_impl(&dword_22592C000, log, OS_LOG_TYPE_DEFAULT, "%{public}@ defaultConfig: %@, singleTagConfig: %@, resultHeldRecordsByType: %p", buf, 0x2Au);

      v26 = v36;
    }
    [*(id *)(a1 + 32) finishedPerformingOperationWithError:0];

    v24 = v39;
  }
}

uint64_t __52__NTTodayConfigConversionOperation_performOperation__block_invoke_18(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishedPerformingOperationWithError:*(void *)(a1 + 40)];
}

- (void)operationWillFinishWithError:(id)a3
{
  id v4 = a3;
  v5 = [(NTTodayConfigConversionOperation *)self defaultConfigCompletionHandler];
  v6 = [(NTTodayConfigConversionOperation *)self resultDefaultConfig];
  v7 = [(NTTodayConfigConversionOperation *)self resultHeldRecordsByType];
  uint64_t v8 = [(NTTodayConfigConversionOperation *)self defaultConfigError];
  v9 = (void *)v8;
  if (v8) {
    uint64_t v10 = v8;
  }
  else {
    uint64_t v10 = (uint64_t)v4;
  }
  ((void (**)(void, void *, void *, uint64_t))v5)[2](v5, v6, v7, v10);

  id v16 = [(NTTodayConfigConversionOperation *)self singleTagConfigCompletionHandler];
  v11 = [(NTTodayConfigConversionOperation *)self resultSingleTagConfig];
  uint64_t v12 = [(NTTodayConfigConversionOperation *)self resultHeldRecordsByType];
  uint64_t v13 = [(NTTodayConfigConversionOperation *)self singleTagConfigError];
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
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = [v9 objectForKeyedSubscript:*MEMORY[0x263F592A0]];
  if (v12)
  {
    v45 = v9;
    id v46 = v11;
    id v43 = v10;
    v44 = a6;
    uint64_t v13 = objc_opt_new();
    id v51 = objc_opt_new();
    __int16 v50 = objc_opt_new();
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    v42 = v12;
    id obj = v12;
    uint64_t v14 = [obj countByEnumeratingWithState:&v54 objects:v58 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v55;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v55 != v16) {
            objc_enumerationMutation(obj);
          }
          id v18 = [MEMORY[0x263F5A378] sectionConfigWithJSONDictionary:*(void *)(*((void *)&v54 + 1) + 8 * i)];
          if (v18)
          {
            [(NTTodayConfigConversionOperation *)self _collectRecordIDsReferencedBySectionConfig:v18 withArticleListIDs:v51 articleIDs:v50];
            if ([v18 queueMembershipsCount])
            {
              unint64_t v19 = 0;
              do
              {
                v20 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v18, "queueMembershipAtIndex:", v19));
                v21 = [v13 objectForKeyedSubscript:v20];
                if (!v21)
                {
                  v21 = objc_opt_new();
                  [v13 setObject:v21 forKeyedSubscript:v20];
                }
                [v21 addObject:v18];

                ++v19;
              }
              while (v19 < [v18 queueMembershipsCount]);
            }
          }
        }
        uint64_t v15 = [obj countByEnumeratingWithState:&v54 objects:v58 count:16];
      }
      while (v15);
    }

    id v10 = v43;
    uint64_t v22 = [MEMORY[0x263EFFA08] setWithArray:v43];
    uint64_t v23 = [MEMORY[0x263EFFA08] setWithArray:v46];
    id obja = (id)v22;
    if (([v51 isSubsetOfSet:v22] & 1) == 0
      && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      -[NTTodayConfigConversionOperation _todayConfigWithConfigJSON:articleListIDs:articleIDs:error:]();
    }
    id v41 = (void *)v23;
    id v9 = v45;
    if (([v50 isSubsetOfSet:v23] & 1) == 0
      && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      -[NTTodayConfigConversionOperation _todayConfigWithConfigJSON:articleListIDs:articleIDs:error:]();
    }
    v24 = [v13 allKeys];
    v25 = [v24 sortedArrayUsingSelector:sel_compare_];

    v52[0] = MEMORY[0x263EF8330];
    v52[1] = 3221225472;
    v52[2] = __95__NTTodayConfigConversionOperation__todayConfigWithConfigJSON_articleListIDs_articleIDs_error___block_invoke;
    v52[3] = &unk_26475D2A8;
    id v39 = v13;
    id v40 = v25;
    id v53 = v39;
    v26 = objc_msgSend(v25, "fc_arrayByTransformingWithBlock:", v52);
    v27 = [v45 objectForKeyedSubscript:*MEMORY[0x263F590F0]];
    uint64_t v28 = [v45 objectForKeyedSubscript:*MEMORY[0x263F590A0]];
    os_log_t v29 = [v45 objectForKeyedSubscript:*MEMORY[0x263F59098]];
    v30 = [v45 objectForKeyedSubscript:*MEMORY[0x263F59090]];
    uint64_t v31 = *MEMORY[0x263F58FE8];
    v32 = [v45 objectForKeyedSubscript:*MEMORY[0x263F58FE8]];

    if (v32)
    {
      v33 = (void *)MEMORY[0x263F5A340];
      v34 = [v45 objectForKeyedSubscript:v31];
      v32 = [v33 bannerConfigWithJSONDictionary:v34];
    }
    v35 = [(NTTodayConfigConversionOperation *)self configuration];
    v36 = [v35 todayConfigWithIdentifier:v27 queueConfigs:v26 backgroundColorLight:v28 backgroundColorDark:v29 audioIndicatorColor:v30 widgetBannerConfig:v32];

    id v37 = 0;
    a6 = v44;
    id v11 = v46;
    uint64_t v12 = v42;
    if (v44) {
      goto LABEL_24;
    }
  }
  else
  {
    id v37 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F592B8] code:13 userInfo:0];
    v36 = 0;
    if (a6) {
LABEL_24:
    }
      *a6 = v37;
  }

  return v36;
}

id __95__NTTodayConfigConversionOperation__todayConfigWithConfigJSON_articleListIDs_articleIDs_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = objc_opt_new();
  [v4 setWidgetVisibleSectionsLimit:1];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v5 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3, 0);
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
    -[NTTodayConfigConversionOperation _collectRecordIDsReferencedBySectionConfig:withArticleListIDs:articleIDs:]();
    if (v9) {
      goto LABEL_6;
    }
  }
  else if (v9)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTTodayConfigConversionOperation _collectRecordIDsReferencedBySectionConfig:withArticleListIDs:articleIDs:]();
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
            id v17 = [*(id *)(*((void *)&v49 + 1) + 8 * i) articleID];
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
      v24 = [v11 personalizedArticles];
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
            os_log_t v29 = [*(id *)(*((void *)&v41 + 1) + 8 * k) articleID];
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
      v24 = objc_msgSend(v11, "items", 0);
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
              v35 = [v34 article];
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

- (NSDictionary)widgetConfiguration
{
  return self->_widgetConfiguration;
}

- (void)setWidgetConfiguration:(id)a3
{
}

- (FCCoreConfiguration)configuration
{
  return self->_configuration;
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

- (NSArray)networkEvents
{
  return self->_networkEvents;
}

- (void)setNetworkEvents:(id)a3
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
  objc_storeStrong((id *)&self->_networkEvents, 0);
  objc_storeStrong((id *)&self->_singleTagConfigError, 0);
  objc_storeStrong((id *)&self->_resultSingleTagConfig, 0);
  objc_storeStrong((id *)&self->_defaultConfigError, 0);
  objc_storeStrong((id *)&self->_resultDefaultConfig, 0);
  objc_storeStrong(&self->_singleTagConfigCompletionHandler, 0);
  objc_storeStrong(&self->_defaultConfigCompletionHandler, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_storeStrong((id *)&self->_widgetConfiguration, 0);
}

- (void)validateOperation
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Today config conversion operation requires widgetConfiguration."];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, 2u);
}

- (void)_todayConfigWithConfigJSON:articleListIDs:articleIDs:error:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"articleIDs referenced in the JSON have to be included in the full list of article records"];
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
  uint64_t v2 = "-[NTTodayConfigConversionOperation _collectRecordIDsReferencedBySectionConfig:withArticleListIDs:articleIDs:]";
  __int16 v3 = 2080;
  uint64_t v4 = "NTTodayConfigConversionOperation.m";
  __int16 v5 = 1024;
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_22592C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

- (void)_collectRecordIDsReferencedBySectionConfig:withArticleListIDs:articleIDs:.cold.2()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v0 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "articleListIDs");
  *(_DWORD *)buf = 136315906;
  uint64_t v2 = "-[NTTodayConfigConversionOperation _collectRecordIDsReferencedBySectionConfig:withArticleListIDs:articleIDs:]";
  __int16 v3 = 2080;
  uint64_t v4 = "NTTodayConfigConversionOperation.m";
  __int16 v5 = 1024;
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_22592C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

@end