@interface SDFeedbackInterceptor
+ (id)sharedInstance;
- (BOOL)collectAnonymousData;
- (BOOL)engagedTTR;
- (BOOL)internalDebug;
- (BOOL)isInternalDevice;
- (BOOL)stressTestCounts;
- (BOOL)testRenderEngagementCounts;
- (NSArray)suggestionsData;
- (NSArray)suggestionsIdentifiers;
- (NSDictionary)cepData;
- (NSMutableDictionary)sentSections;
- (NSMutableOrderedSet)sectionOrder;
- (NSString)currentClientId;
- (NSString)currentQuery;
- (NSString)keyboardPrimaryLanguage;
- (OS_dispatch_queue)queue;
- (PRSRankingItemRanker)usedRanker;
- (SDFeedbackInterceptor)init;
- (SPPersonalMetricManager)personalMetricManager;
- (id)_itemsFromSentSections;
- (id)_itemsFromSentSectionsWithProtectionClasses:(id)a3 filterWithResults:(id)a4;
- (unint64_t)currentQueryId;
- (void)annotateRankingFeedback:(id)a3 completion:(id)a4;
- (void)cleanup;
- (void)didClearInput:(id)a3;
- (void)didEngageResult:(id)a3;
- (void)didEngageSection:(id)a3;
- (void)didPerformCommand:(id)a3;
- (void)didRankSections:(id)a3;
- (void)dumpTTRDebugFiles;
- (void)resultsDidBecomeVisible:(id)a3;
- (void)searchViewDidAppear:(id)a3;
- (void)searchViewDidDisappear:(id)a3;
- (void)setCepData:(id)a3;
- (void)setCollectAnonymousData:(BOOL)a3;
- (void)setCurrentClientId:(id)a3;
- (void)setCurrentQuery:(id)a3;
- (void)setCurrentQueryId:(unint64_t)a3;
- (void)setEngagedTTR:(BOOL)a3;
- (void)setInternalDebug:(BOOL)a3;
- (void)setIsInternalDevice:(BOOL)a3;
- (void)setKeyboardPrimaryLanguage:(id)a3;
- (void)setPersonalMetricManager:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSectionOrder:(id)a3;
- (void)setSentSections:(id)a3;
- (void)setStressTestCounts:(BOOL)a3;
- (void)setSuggestionsData:(id)a3;
- (void)setSuggestionsIdentifiers:(id)a3;
- (void)setTestRenderEngagementCounts:(BOOL)a3;
- (void)setUsedRanker:(id)a3;
- (void)willSendSections:(id)a3 forQuery:(id)a4 queryIdentifier:(unint64_t)a5 allowAnonymousDataCollection:(BOOL)a6 withRankerUsed:(id)a7 withRankingConfiguration:(id)a8 internalDebug:(BOOL)a9 keyboardPrimaryLanguage:(id)a10 clientID:(id)a11;
@end

@implementation SDFeedbackInterceptor

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_3 != -1) {
    dispatch_once(&sharedInstance_onceToken_3, &__block_literal_global_12);
  }
  v2 = (void *)sharedInstance_listener;

  return v2;
}

uint64_t __39__SDFeedbackInterceptor_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = sharedInstance_listener;
  sharedInstance_listener = v0;

  return MEMORY[0x270F9A758](v0, v1);
}

- (SDFeedbackInterceptor)init
{
  v16.receiver = self;
  v16.super_class = (Class)SDFeedbackInterceptor;
  v2 = [(SDFeedbackInterceptor *)&v16 init];
  v3 = v2;
  if (v2)
  {
    currentQuery = v2->_currentQuery;
    v2->_currentQuery = 0;

    uint64_t v5 = objc_opt_new();
    sentSections = v3->_sentSections;
    v3->_sentSections = (NSMutableDictionary *)v5;

    uint64_t v7 = objc_opt_new();
    sectionOrder = v3->_sectionOrder;
    v3->_sectionOrder = (NSMutableOrderedSet *)v7;

    v9 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.searchd.feedbackInterceptorQueue", v9);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v10;

    v3->_collectAnonymousData = 0;
    v12 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.searchd"];
    v3->_testRenderEngagementCounts = [v12 BOOLForKey:@"testRenderEngagementCounts"];
    v3->_stressTestCounts = [v12 BOOLForKey:@"stressTestCounts"];
    v3->_isInternalDevice = os_variant_has_internal_diagnostics();
    v3->_engagedTTR = 0;
    uint64_t v13 = +[SPPersonalMetricManager sharedInstance];
    personalMetricManager = v3->_personalMetricManager;
    v3->_personalMetricManager = (SPPersonalMetricManager *)v13;
  }
  return v3;
}

- (void)annotateRankingFeedback:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = SDFeedbackTransactionCreate(@"annotate");
  v9 = [(SDFeedbackInterceptor *)self queue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __60__SDFeedbackInterceptor_annotateRankingFeedback_completion___block_invoke;
  v13[3] = &unk_2644B2FD0;
  v13[4] = self;
  id v14 = v8;
  id v15 = v6;
  id v16 = v7;
  id v10 = v6;
  id v11 = v8;
  id v12 = v7;
  dispatch_async(v9, v13);
}

void __60__SDFeedbackInterceptor_annotateRankingFeedback_completion___block_invoke(uint64_t a1)
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) collectAnonymousData])
  {
    if (([*(id *)(a1 + 32) isInternalDevice] & 1) == 0)
    {
LABEL_42:
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      if (*(void *)(a1 + 40)) {
        id v40 = self;
      }
      return;
    }
  }
  else
  {
    v2 = [MEMORY[0x263F78D18] sharedHandler];
    if ([v2 collectScores])
    {
    }
    else
    {
      char v3 = [*(id *)(a1 + 32) isInternalDevice];

      if ((v3 & 1) == 0) {
        goto LABEL_42;
      }
    }
  }
  v4 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  uint64_t v42 = a1;
  obuint64_t j = [*(id *)(a1 + 48) sections];
  uint64_t v5 = [obj countByEnumeratingWithState:&v53 objects:v63 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v54;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v54 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        long long v49 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        id v10 = [v9 results];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v49 objects:v62 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v50;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v50 != v13) {
                objc_enumerationMutation(v10);
              }
              id v15 = [*(id *)(*((void *)&v49 + 1) + 8 * j) result];
              id v16 = [v15 identifier];
              [v4 setObject:v15 forKey:v16];
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v49 objects:v62 count:16];
          }
          while (v12);
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v53 objects:v63 count:16];
    }
    while (v6);
  }

  v17 = [*(id *)(v42 + 32) _itemsFromSentSections];
  v18 = [MEMORY[0x263F78D30] sharedModelManager];
  v41 = [v18 getL2ModelVersionForClientBundle:0];

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obja = v17;
  uint64_t v19 = [obja countByEnumeratingWithState:&v45 objects:v61 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v46;
    do
    {
      for (uint64_t k = 0; k != v20; ++k)
      {
        if (*(void *)v46 != v21) {
          objc_enumerationMutation(obja);
        }
        v23 = *(void **)(*((void *)&v45 + 1) + 8 * k);
        v24 = [v23 identifier];
        v25 = [v4 objectForKey:v24];

        v26 = [v23 L2FeatureVector];

        if (v26) {
          BOOL v27 = v25 == 0;
        }
        else {
          BOOL v27 = 1;
        }
        if (!v27)
        {
          v59[0] = @"score";
          v31 = NSNumber;
          [v23 score];
          v32 = objc_msgSend(v31, "numberWithFloat:");
          v60[0] = v32;
          v59[1] = @"raw score";
          v33 = NSNumber;
          [v23 rawScore];
          v34 = objc_msgSend(v33, "numberWithFloat:");
          v60[1] = v34;
          v59[2] = @"original score";
          v35 = NSNumber;
          v36 = [v23 L2FeatureVector];
          [v36 originalL2Score];
          v37 = objc_msgSend(v35, "numberWithFloat:");
          v60[2] = v37;
          v38 = [NSDictionary dictionaryWithObjects:v60 forKeys:v59 count:3];
          [v25 setLocalFeatures:v38];

LABEL_36:
          goto LABEL_37;
        }
        v28 = [v23 localSuggestionsData];

        if (v28) {
          BOOL v29 = v25 == 0;
        }
        else {
          BOOL v29 = 1;
        }
        if (!v29)
        {
          v57 = @"suggestion score";
          v30 = NSNumber;
          [v23 suggestionScore];
          v32 = objc_msgSend(v30, "numberWithDouble:");
          v58 = v32;
          v34 = [NSDictionary dictionaryWithObjects:&v58 forKeys:&v57 count:1];
          [v25 setLocalFeatures:v34];
          goto LABEL_36;
        }
LABEL_37:
      }
      uint64_t v20 = [obja countByEnumeratingWithState:&v45 objects:v61 count:16];
    }
    while (v20);
  }

  [*(id *)(v42 + 48) setL2ModelVersion:v41];
  (*(void (**)(void))(*(void *)(v42 + 56) + 16))();
  if (*(void *)(v42 + 40)) {
    id v39 = self;
  }
}

- (void)willSendSections:(id)a3 forQuery:(id)a4 queryIdentifier:(unint64_t)a5 allowAnonymousDataCollection:(BOOL)a6 withRankerUsed:(id)a7 withRankingConfiguration:(id)a8 internalDebug:(BOOL)a9 keyboardPrimaryLanguage:(id)a10 clientID:(id)a11
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  id v55 = a4;
  id v52 = a7;
  id v57 = a8;
  id v56 = a10;
  id v48 = a11;
  id v14 = a3;
  long long v47 = SDFeedbackTransactionCreate(@"willSendSections");
  id v15 = (void *)[v14 copy];

  uint64_t v16 = [v15 count];
  v17 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v15, "count"));
  v18 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:v16];
  v58 = (void *)[objc_alloc(MEMORY[0x263EFF9B0]) initWithCapacity:v16];
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  obuint64_t j = v15;
  uint64_t v19 = [obj countByEnumeratingWithState:&v74 objects:v78 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v75;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v75 != v21) {
          objc_enumerationMutation(obj);
        }
        v23 = *(void **)(*((void *)&v74 + 1) + 8 * i);
        v24 = [v23 results];
        v25 = (void *)[v24 copy];
        [v17 addObject:v25];

        v26 = [v23 bundleIdentifier];
        BOOL v27 = [v18 objectForKeyedSubscript:v26];
        if (!v27)
        {
          BOOL v27 = objc_opt_new();
          v28 = [v23 resultSet];
          unint64_t v29 = [v28 count];

          unint64_t v30 = [v23 maxInitiallyVisibleResults];
          if (v29 >= v30) {
            unint64_t v31 = v30;
          }
          else {
            unint64_t v31 = v29;
          }
          [v27 setCountOfVisibleResults:v31];
          [v18 setObject:v27 forKeyedSubscript:v26];
          v32 = [v23 bundleIdentifier];
          [v58 addObject:v32];
        }
      }
      uint64_t v20 = [obj countByEnumeratingWithState:&v74 objects:v78 count:16];
    }
    while (v20);
  }

  [v57 lock];
  v33 = [v57 queryDependentCategoryProbabilities];
  v34 = (void *)[v33 copy];

  [v57 unlock];
  v35 = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __183__SDFeedbackInterceptor_willSendSections_forQuery_queryIdentifier_allowAnonymousDataCollection_withRankerUsed_withRankingConfiguration_internalDebug_keyboardPrimaryLanguage_clientID___block_invoke;
  block[3] = &unk_2644B2FF8;
  block[4] = self;
  id v62 = v56;
  id v63 = obj;
  id v64 = v17;
  id v65 = v18;
  id v66 = v34;
  BOOL v73 = a6;
  id v67 = v55;
  id v68 = v48;
  id v69 = v52;
  id v70 = v58;
  id v71 = v47;
  unint64_t v72 = a5;
  queuea = v35;
  id v54 = v47;
  id v36 = v58;
  id v59 = v52;
  id v37 = v48;
  id v38 = v55;
  id v39 = v34;
  id v40 = v18;
  id v41 = v17;
  id v42 = obj;
  id v43 = v56;
  qos_class_t v44 = qos_class_self();
  if (v44 < 0x1A) {
    dispatch_block_t v45 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  }
  else {
    dispatch_block_t v45 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v44, 0, block);
  }
  long long v46 = v45;
  dispatch_async(queuea, v45);
}

void __183__SDFeedbackInterceptor_willSendSections_forQuery_queryIdentifier_allowAnonymousDataCollection_withRankerUsed_withRankingConfiguration_internalDebug_keyboardPrimaryLanguage_clientID___block_invoke(uint64_t a1)
{
  uint64_t v104 = *MEMORY[0x263EF8340];
  v82 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9B0]), "initWithObjects:", @"com.apple.other.search_web", @"com.apple.other.search_app_store", @"com.apple.other.search_maps", 0);
  uint64_t v78 = a1;
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 96), *(id *)(a1 + 40));
  if (kPlaceHolderInputName_block_invoke_onceToken != -1) {
    dispatch_once(&kPlaceHolderInputName_block_invoke_onceToken, &__block_literal_global_190);
  }
  long long v95 = 0u;
  long long v96 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  obuint64_t j = *(id *)(a1 + 48);
  uint64_t v71 = [obj countByEnumeratingWithState:&v93 objects:v100 count:16];
  if (v71)
  {
    uint64_t v2 = 0;
    uint64_t v70 = *(void *)v94;
    uint64_t v81 = *MEMORY[0x263F790B8];
    uint64_t v80 = *MEMORY[0x263F790B0];
    uint64_t v79 = *MEMORY[0x263F79078];
    uint64_t v72 = *MEMORY[0x263F79068];
    uint64_t v77 = *MEMORY[0x263F08098];
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v94 != v70) {
          objc_enumerationMutation(obj);
        }
        uint64_t v75 = v3;
        uint64_t v76 = v2;
        v4 = *(void **)(*((void *)&v93 + 1) + 8 * v3);
        uint64_t v5 = [*(id *)(v78 + 56) objectAtIndex:v2];
        long long v74 = [v4 bundleIdentifier];
        v83 = objc_opt_new();
        long long v89 = 0u;
        long long v90 = 0u;
        long long v91 = 0u;
        long long v92 = 0u;
        id v6 = v5;
        uint64_t v7 = [v6 countByEnumeratingWithState:&v89 objects:v99 count:16];
        if (!v7)
        {
          v84 = 0;
          goto LABEL_61;
        }
        uint64_t v8 = v7;
        v84 = 0;
        uint64_t v9 = *(void *)v90;
        do
        {
          uint64_t v10 = 0;
          do
          {
            if (*(void *)v90 != v9) {
              objc_enumerationMutation(v6);
            }
            uint64_t v11 = *(void **)(*((void *)&v89 + 1) + 8 * v10);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v12 = v11;
              int v13 = [v12 type];
              id v14 = [v12 sectionBundleIdentifier];
              if (!v14) {
                goto LABEL_50;
              }
              id v15 = [v12 rankingItem];

              if (!v15) {
                goto LABEL_50;
              }
              uint64_t v16 = [v12 rankingItem];
              v17 = [v16 sectionBundleIdentifier];

              if (!v17)
              {
                v18 = [v12 rankingItem];
                [v18 setSectionBundleIdentifier:v14];
              }
              if ((SSResultTypeIsServer() & 1) == 0 && (v13 & 0xFFFFFFFE) != 6)
              {
                uint64_t v19 = (uint64_t)v84;
                if (!v84) {
                  uint64_t v19 = objc_opt_new();
                }
                v84 = (void *)v19;
                uint64_t v20 = [v12 identifier];
                uint64_t v21 = [v12 rankingItem];
                [v21 setIdentifier:v20];

                if ([v14 isEqualToString:@"com.apple.DocumentsApp"])
                {
                  uint64_t v22 = [v12 resultBundleId];

                  id v14 = (void *)v22;
                }
                v23 = [v12 rankingItem];
                [v23 setSectionBundleIdentifier:v14];

                v24 = [v12 rankingItem];
                [v83 addObject:v24];

                v25 = [v12 identifier];
                if (v25)
                {

                  goto LABEL_38;
                }
                v32 = [v12 sectionBundleIdentifier];
                char v33 = [v32 isEqualToString:@"com.apple.calculation"];

                if (v33)
                {
LABEL_38:
                  v34 = [v12 protectionClass];

                  if (v34)
                  {
                    v35 = [v12 protectionClass];
                    id v36 = [v12 identifier];
                    [v84 setObject:v35 forKey:v36];

                    goto LABEL_49;
                  }
                }
                else
                {
                  id v37 = SPLogForSPLogCategoryDefault();
                  if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
                  {
                    id v73 = [v12 resultBundleId];
                    uint64_t v52 = [v73 UTF8String];
                    id v53 = [v12 sectionBundleIdentifier];
                    uint64_t v54 = [v53 UTF8String];
                    *(_DWORD *)__str = 136315394;
                    *(void *)&__str[4] = v52;
                    __int16 v102 = 2080;
                    uint64_t v103 = v54;
                    _os_log_fault_impl(&dword_21E5D7000, v37, OS_LOG_TYPE_FAULT, "result identifier is nil, resultBundleId: >%s<, sectionBundleIdentifier: >%s<", __str, 0x16u);
                  }
                }
                goto LABEL_50;
              }
              if (!SSResultTypeIsServer()) {
                goto LABEL_50;
              }
              v26 = [v12 rankingItem];

              if (!v26) {
                goto LABEL_50;
              }
              if (_os_feature_enabled_impl())
              {
                if (([v14 isEqual:v81] & 1) != 0
                  || ([v14 isEqual:v80] & 1) != 0
                  || ([v14 isEqual:v79] & 1) != 0)
                {
                  BOOL v27 = [v12 getStableServerResultIdentifier];
                  v28 = [v12 rankingItem];
                  [v28 setIdentifier:v27];

                  goto LABEL_33;
                }
                char v49 = [v14 isEqual:v72];
                long long v50 = [v12 getStableServerResultIdentifier];
                long long v51 = [v12 rankingItem];
                [v51 setIdentifier:v50];

                if ((v49 & 1) == 0)
                {
LABEL_46:
                  bzero(v98, 0x400uLL);
                  json_writer_init_with_buffer();
                  json_writer_begin_dictionary();
                  json_writer_add_key();
                  [v12 rankingScore];
                  double v40 = v39;
                  bzero(__str, 0x400uLL);
                  snprintf(__str, 0x400uLL, "%.2g", v40);
                  atof(__str);
                  json_writer_add_double();
                  json_writer_add_key();
                  id v41 = [v12 sectionBundleIdentifier];
                  [v41 UTF8String];
                  json_writer_add_string();

                  json_writer_add_key();
                  json_writer_add_raw_value();
                  json_writer_add_key();
                  [v12 feedbackBlockId];
                  json_writer_add_uint32();
                  json_writer_end_dictionary();
                  *(void *)__str = 0;
                  uint64_t data = json_writer_get_data();
                  if (data)
                  {
                    uint64_t v43 = data;
                    id v44 = objc_alloc(MEMORY[0x263EFF8F8]);
                    dispatch_block_t v45 = (void *)[v44 initWithBytes:*(void *)__str length:v43];
                    long long v46 = [v12 rankingItem];
                    [v46 setServerFeaturesJSON:v45];
                  }
                  long long v47 = [v12 rankingItem];
                  id v48 = [v47 sectionBundleIdentifier];
                  [v82 addObject:v48];

                  v35 = [v12 rankingItem];
                  [v83 addObject:v35];
LABEL_49:

LABEL_50:
                  goto LABEL_51;
                }
LABEL_33:
                uint64_t v29 = (uint64_t)v84;
                if (!v84) {
                  uint64_t v29 = objc_opt_new();
                }
                v84 = (void *)v29;
                uint64_t v30 = [v12 protectionClass];
                if (v30)
                {
                  unint64_t v31 = (void *)v30;
LABEL_45:

                  goto LABEL_46;
                }
                if (!v84)
                {
                  v84 = 0;
                  goto LABEL_46;
                }
                unint64_t v31 = [v12 rankingItem];
                id v38 = [v31 identifier];
                [v84 setObject:v77 forKey:v38];
              }
              else
              {
                unint64_t v31 = [v12 getStableServerResultIdentifier];
                id v38 = [v12 rankingItem];
                [v38 setIdentifier:v31];
              }

              goto LABEL_45;
            }
LABEL_51:
            ++v10;
          }
          while (v8 != v10);
          uint64_t v55 = [v6 countByEnumeratingWithState:&v89 objects:v99 count:16];
          uint64_t v8 = v55;
        }
        while (v55);
LABEL_61:

        if ([v83 count])
        {
          id v56 = [*(id *)(v78 + 64) objectForKeyedSubscript:v74];
          [v56 setArrayOfRankingItems:v83];
          [v56 setBundleIdentifier:v74];
          if (v84) {
            objc_msgSend(v56, "setMapResultIdToProtectionClass:");
          }
        }
        uint64_t v2 = v76 + 1;

        uint64_t v3 = v75 + 1;
      }
      while (v75 + 1 != v71);
      uint64_t v71 = [obj countByEnumeratingWithState:&v93 objects:v100 count:16];
    }
    while (v71);
  }

  id v57 = objc_opt_new();
  if (*(void *)(v78 + 72))
  {
    long long v87 = 0u;
    long long v88 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    id v58 = v82;
    uint64_t v59 = [v58 countByEnumeratingWithState:&v85 objects:v97 count:16];
    if (v59)
    {
      uint64_t v60 = v59;
      uint64_t v61 = *(void *)v86;
      do
      {
        for (uint64_t i = 0; i != v60; ++i)
        {
          if (*(void *)v86 != v61) {
            objc_enumerationMutation(v58);
          }
          id v63 = *(void **)(*((void *)&v85 + 1) + 8 * i);
          id v64 = *(void **)(v78 + 72);
          id v65 = [v63 lowercaseString];
          id v66 = [v64 objectForKey:v65];

          if (v66) {
            [v57 setObject:v66 forKey:v63];
          }
        }
        uint64_t v60 = [v58 countByEnumeratingWithState:&v85 objects:v97 count:16];
      }
      while (v60);
    }
  }
  uint64_t v67 = v78;
  *(unsigned char *)(*(void *)(v78 + 32) + 8) = *(unsigned char *)(v78 + 128);
  objc_storeStrong((id *)(*(void *)(v78 + 32) + 24), *(id *)(v78 + 80));
  *(void *)(*(void *)(v78 + 32) + 32) = *(void *)(v78 + 120);
  objc_storeStrong((id *)(*(void *)(v67 + 32) + 40), *(id *)(v67 + 88));
  objc_storeStrong((id *)(*(void *)(v67 + 32) + 64), *(id *)(v67 + 96));
  objc_storeStrong((id *)(*(void *)(v67 + 32) + 16), *(id *)(v67 + 64));
  objc_storeStrong((id *)(*(void *)(v67 + 32) + 48), *(id *)(v67 + 104));
  objc_storeStrong((id *)(*(void *)(v78 + 32) + 72), v57);
  if (*(void *)(v78 + 112)) {
    id v68 = self;
  }
}

uint64_t __183__SDFeedbackInterceptor_willSendSections_forQuery_queryIdentifier_allowAnonymousDataCollection_withRankerUsed_withRankingConfiguration_internalDebug_keyboardPrimaryLanguage_clientID___block_invoke_2()
{
  uint64_t v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_msgSend(v0, "setWithObjects:", v1, v2, objc_opt_class(), 0);
  uint64_t v4 = kPlaceHolderInputName_block_invoke_classes;
  kPlaceHolderInputName_block_invoke_classes = v3;

  return MEMORY[0x270F9A758](v3, v4);
}

- (void)didEngageSection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = SDFeedbackTransactionCreate(@"didEngageSection");
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__SDFeedbackInterceptor_didEngageSection___block_invoke;
  block[3] = &unk_2644B2B40;
  id v10 = v4;
  uint64_t v11 = self;
  id v12 = v5;
  id v7 = v5;
  id v8 = v4;
  dispatch_async(queue, block);
}

void __42__SDFeedbackInterceptor_didEngageSection___block_invoke(uint64_t a1)
{
  id v8 = [*(id *)(a1 + 32) section];
  uint64_t v2 = [*(id *)(a1 + 32) triggerEvent];
  uint64_t v3 = *(void **)(*(void *)(a1 + 40) + 16);
  id v4 = [v8 bundleIdentifier];
  uint64_t v5 = [v3 objectForKeyedSubscript:v4];

  if (v2 == 3)
  {
    objc_msgSend(v5, "setCountOfVisibleResults:", objc_msgSend(v8, "maxInitiallyVisibleResults"));
  }
  else if (v2 == 2)
  {
    id v6 = [v8 results];
    objc_msgSend(v5, "setCountOfVisibleResults:", objc_msgSend(v6, "count"));
  }
  if (*(void *)(a1 + 48)) {
    id v7 = self;
  }
}

- (id)_itemsFromSentSections
{
  return [(SDFeedbackInterceptor *)self _itemsFromSentSectionsWithProtectionClasses:0 filterWithResults:0];
}

- (id)_itemsFromSentSectionsWithProtectionClasses:(id)a3 filterWithResults:(id)a4
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v44 = a4;
  uint64_t v7 = [v44 count];
  if (v7)
  {
    uint64_t v8 = [MEMORY[0x263EFF980] arrayWithCapacity:v7];
  }
  else
  {
    uint64_t v8 = objc_opt_new();
  }
  uint64_t v9 = (void *)v8;
  uint64_t v10 = [(NSMutableOrderedSet *)self->_sectionOrder count];
  if (v10 >= 1)
  {
    uint64_t v11 = v10;
    uint64_t v12 = 0;
    id v41 = v6;
    uint64_t v36 = v10;
    id v37 = self;
    do
    {
      uint64_t v13 = [(NSMutableOrderedSet *)self->_sectionOrder objectAtIndexedSubscript:v12];
      id v14 = [(SDFeedbackInterceptor *)self sentSections];
      double v40 = (void *)v13;
      id v15 = [v14 objectForKeyedSubscript:v13];

      uint64_t v16 = [v15 mapResultIdToProtectionClass];
      [v6 addEntriesFromDictionary:v16];

      double v39 = v15;
      if (v7)
      {
        v17 = [v15 arrayOfRankingItems];
        uint64_t v18 = [v17 count];
        if (v18 < 1 || v7 < 1) {
          goto LABEL_33;
        }
        uint64_t v20 = v18;
        uint64_t v38 = v12;
        uint64_t v21 = 0;
        uint64_t v22 = 0;
        uint64_t v42 = v18;
        do
        {
          v23 = [v17 objectAtIndexedSubscript:v21];
          v24 = [v23 identifier];
          if (!v6
            || ([v6 objectForKey:v24],
                v25 = objc_claimAutoreleasedReturnValue(),
                v25,
                v25))
          {
            if (v22 < v7)
            {
              uint64_t v43 = v22;
              uint64_t v26 = v22;
              while (1)
              {
                BOOL v27 = [v44 objectAtIndexedSubscript:v26];
                v28 = [v27 identifier];
                int v29 = [v28 isEqualToString:v24];

                ++v26;
                if (v29) {
                  break;
                }

                if (v7 == v26)
                {
                  id v6 = v41;
                  uint64_t v20 = v42;
                  uint64_t v22 = v43;
                  goto LABEL_20;
                }
              }
              [v9 addObject:v23];

              uint64_t v22 = v26;
              id v6 = v41;
              uint64_t v20 = v42;
            }
          }
LABEL_20:

          ++v21;
        }
        while (v21 < v20 && v22 < v7);
        uint64_t v11 = v36;
        self = v37;
      }
      else
      {
        uint64_t v38 = v12;
        long long v47 = 0u;
        long long v48 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        v17 = [v15 arrayOfRankingItems];
        uint64_t v30 = [v17 countByEnumeratingWithState:&v45 objects:v49 count:16];
        if (v30)
        {
          uint64_t v31 = v30;
          uint64_t v32 = *(void *)v46;
          do
          {
            for (uint64_t i = 0; i != v31; ++i)
            {
              if (*(void *)v46 != v32) {
                objc_enumerationMutation(v17);
              }
              uint64_t v34 = *(void *)(*((void *)&v45 + 1) + 8 * i);
              if (([v9 containsObject:v34] & 1) == 0) {
                [v9 addObject:v34];
              }
            }
            uint64_t v31 = [v17 countByEnumeratingWithState:&v45 objects:v49 count:16];
          }
          while (v31);
        }
      }
      uint64_t v12 = v38;
LABEL_33:

      ++v12;
    }
    while (v12 != v11);
  }

  return v9;
}

- (void)didPerformCommand:(id)a3
{
  id v4 = a3;
  uint64_t v5 = SDFeedbackTransactionCreate(@"didEngageResult");
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__SDFeedbackInterceptor_didPerformCommand___block_invoke;
  block[3] = &unk_2644B2B40;
  id v10 = v4;
  uint64_t v11 = self;
  id v12 = v5;
  id v7 = v5;
  id v8 = v4;
  dispatch_async(queue, block);
}

void __43__SDFeedbackInterceptor_didPerformCommand___block_invoke(uint64_t a1)
{
  uint64_t v93 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) result];
  uint64_t v3 = [v2 identifier];
  if ([v3 isEqualToString:@"com.apple.other:taptoradar"]) {
    *(unsigned char *)(*(void *)(a1 + 40) + 13) = 1;
  }
  uint64_t v4 = [*(id *)(*(void *)(a1 + 40) + 88) indexOfObject:v3];
  uint64_t v5 = [*(id *)(a1 + 40) suggestionsIdentifiers];

  id v6 = objc_alloc(MEMORY[0x263EFF980]);
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v72 = v2;
  if (v5 && v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = objc_msgSend(v6, "initWithCapacity:", objc_msgSend(*(id *)(v7 + 80), "count"));
    long long v85 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    id v9 = *(id *)(*(void *)(a1 + 40) + 80);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v85 objects:v92 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v86;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v86 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = [[SDSuggestionsFeedbackCollectible alloc] initWithSuggestionsData:*(void *)(*((void *)&v85 + 1) + 8 * i)];
          [v8 addObject:v14];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v85 objects:v92 count:16];
      }
      while (v11);
    }

    id v15 = [MEMORY[0x263F78D10] sharedManager];
    uint64_t v16 = [*(id *)(a1 + 40) usedRanker];
    [v15 extractTrainingDataWithItemAtIndex:v4 withItems:v8 withRanker:v16 forQuery:*(void *)(*(void *)(a1 + 40) + 24) dataCollectAllowed:1 forClientBundle:*MEMORY[0x263F790C0] keyboardPrimaryLanguage:*(void *)(*(void *)(a1 + 40) + 96) clientID:*(void *)(*(void *)(a1 + 40) + 40)];
    v17 = v72;
    goto LABEL_85;
  }
  id v8 = objc_msgSend(v6, "initWithCapacity:", objc_msgSend(*(id *)(v7 + 16), "count"));
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  id v18 = *(id *)(*(void *)(a1 + 40) + 48);
  uint64_t v19 = [v18 countByEnumeratingWithState:&v81 objects:v91 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v82;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v82 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = [*(id *)(*(void *)(a1 + 40) + 16) objectForKeyedSubscript:*(void *)(*((void *)&v81 + 1) + 8 * j)];
        [v8 addObject:v23];
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v81 objects:v91 count:16];
    }
    while (v20);
  }

  uint64_t v71 = objc_opt_new();
  objc_msgSend(*(id *)(a1 + 40), "_itemsFromSentSectionsWithProtectionClasses:filterWithResults:");
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  id v24 = (id)objc_claimAutoreleasedReturnValue();
  id v15 = (id)[v24 countByEnumeratingWithState:&v77 objects:v90 count:16];
  if (v15)
  {
    uint64_t v25 = *(void *)v78;
    while (2)
    {
      for (uint64_t k = 0; k != v15; uint64_t k = (char *)k + 1)
      {
        if (*(void *)v78 != v25) {
          objc_enumerationMutation(v24);
        }
        BOOL v27 = *(void **)(*((void *)&v77 + 1) + 8 * (void)k);
        v28 = [v27 identifier];
        int v29 = [v28 isEqualToString:v3];

        if (v29)
        {
          id v15 = v27;
          goto LABEL_30;
        }
      }
      id v15 = (id)[v24 countByEnumeratingWithState:&v77 objects:v90 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }
LABEL_30:
  uint64_t v70 = v24;

  v17 = v72;
  BOOL v30 = [v72 type] == 36 || objc_msgSend(v72, "type") == 37;
  int v31 = _os_feature_enabled_impl();
  if (v15) {
    BOOL v32 = v31 == 0;
  }
  else {
    BOOL v32 = 1;
  }
  if (v32)
  {
    int v33 = 0;
  }
  else
  {
    uint64_t v34 = [v15 sectionBundleIdentifier];
    char v35 = [v34 isEqual:*MEMORY[0x263F790B8]];
    if (v35)
    {
      int v33 = 1;
    }
    else
    {
      uint64_t v36 = [v15 sectionBundleIdentifier];
      if ([v36 isEqual:*MEMORY[0x263F790B0]])
      {
        int v33 = 1;
      }
      else
      {
        id v37 = [v15 sectionBundleIdentifier];
        if ([v37 isEqual:*MEMORY[0x263F79078]])
        {
          int v33 = 1;
        }
        else
        {
          uint64_t v67 = [v15 sectionBundleIdentifier];
          int v33 = [v67 isEqual:*MEMORY[0x263F79068]];
        }
      }
    }
  }
  unsigned int v38 = [v72 type];
  double v39 = [v15 sectionBundleIdentifier];
  char v40 = [v39 isEqual:*MEMORY[0x263F79110]];
  if (v38 == 20) {
    char v41 = v40;
  }
  else {
    char v41 = 0;
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (v38 != 2 && !v30 && (v38 > 7 || ((1 << v38) & 0xD0) == 0) && (v33 & 1) == 0)
    {
      if (v15) {
        char v64 = v41;
      }
      else {
        char v64 = 0;
      }
      if ((v64 & 1) == 0) {
        goto LABEL_68;
      }
LABEL_58:
      uint64_t v42 = [v15 identifier];
      id v43 = [v71 objectForKey:v42];

      if (v43) {
        int v44 = 0;
      }
      else {
        int v44 = v33;
      }
      if (v44 == 1) {
        id v43 = (id)*MEMORY[0x263F08098];
      }
      if (v43)
      {
        long long v45 = [v15 sectionBundleIdentifier];
        int v46 = [v45 isEqualToString:@"com.apple.DocumentsApp"];

        if (v46)
        {
          long long v47 = [v72 resultBundleId];
          [v15 setSectionBundleIdentifier:v47];
        }
        long long v48 = [MEMORY[0x263F78E20] sharedInstance];
        [v48 didEngageResultWithRankingItem:v15 startDate:0 protectionClass:v43 query:*(void *)(*(void *)(a1 + 40) + 24)];
      }
      goto LABEL_68;
    }
    if (v15) {
      goto LABEL_58;
    }
  }
LABEL_68:
  [*(id *)(a1 + 40) _itemsFromSentSections];
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id v49 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v50 = [v49 countByEnumeratingWithState:&v73 objects:v89 count:16];
  if (v50)
  {
    uint64_t v51 = v50;
    id v68 = v15;
    uint64_t v52 = *(void *)v74;
    while (2)
    {
      for (uint64_t m = 0; m != v51; ++m)
      {
        if (*(void *)v74 != v52) {
          objc_enumerationMutation(v49);
        }
        uint64_t v54 = *(void **)(*((void *)&v73 + 1) + 8 * m);
        uint64_t v55 = [v54 identifier];
        int v56 = [v55 isEqualToString:v3];

        if (v56)
        {
          uint64_t v57 = [v49 indexOfObject:v54];
          goto LABEL_78;
        }
      }
      uint64_t v51 = [v49 countByEnumeratingWithState:&v73 objects:v89 count:16];
      if (v51) {
        continue;
      }
      break;
    }
    uint64_t v57 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_78:
    v17 = v72;
    id v15 = v68;
  }
  else
  {
    uint64_t v57 = 0x7FFFFFFFFFFFFFFFLL;
  }

  uint64_t v16 = v71;
  if ([*(id *)(a1 + 32) triggerEvent] != 5
    && v57 != 0x7FFFFFFFFFFFFFFFLL
    && [v17 type] != 26)
  {
    id v58 = [MEMORY[0x263F78D10] sharedManager];
    uint64_t v59 = [*(id *)(a1 + 40) usedRanker];
    uint64_t v60 = *(void *)(a1 + 40);
    uint64_t v69 = *(void *)(v60 + 24);
    unsigned int v66 = *(unsigned __int8 *)(v60 + 8);
    uint64_t v61 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend((id)v60, "currentQueryId"));
    uint64_t v62 = *(void *)(a1 + 40);
    LOBYTE(v65) = *(unsigned char *)(v62 + 9);
    [v58 extractTrainingDataWithItemAtIndex:v57 withItems:v49 withRanker:v59 forQuery:v69 dataCollectAllowed:v66 queryID:v61 withCEPData:*(void *)(v62 + 72) forClientBundle:*MEMORY[0x263F78FE0] debugInfoEnabled:v65 keyboardPrimaryLanguage:*(void *)(v62 + 96) clientID:*(void *)(v62 + 40)];

    uint64_t v16 = v71;
  }

LABEL_85:
  if (*(void *)(a1 + 48)) {
    id v63 = self;
  }
}

- (void)dumpTTRDebugFiles
{
  uint64_t v3 = SDFeedbackTransactionCreate(@"dumpTTRDebugFiles");
  self->_engagedTTR = 1;
  queue = self->_queue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __42__SDFeedbackInterceptor_dumpTTRDebugFiles__block_invoke;
  v6[3] = &unk_2644B2990;
  v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  dispatch_sync(queue, v6);
}

void __42__SDFeedbackInterceptor_dumpTTRDebugFiles__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v2 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "count"));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 48);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "objectForKeyedSubscript:", *(void *)(*((void *)&v11 + 1) + 8 * v7), (void)v11);
        [v2 addObject:v8];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  id v9 = +[SDTTRSupport getSharedInstance];
  [v9 dumpTTRDebugFilesForQuery:*(void *)(*(void *)(a1 + 32) + 24) sections:v2 enableKeyLogRanking:0];

  [*(id *)(*(void *)(a1 + 32) + 16) removeAllObjects];
  [*(id *)(*(void *)(a1 + 32) + 48) removeAllObjects];
  if (*(void *)(a1 + 40)) {
    id v10 = self;
  }
}

- (void)didClearInput:(id)a3
{
  objc_msgSend(MEMORY[0x263F78E20], "sharedInstance", a3);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 writeRenderAndEngagementInfo];
}

- (void)didRankSections:(id)a3
{
  id v4 = a3;
  uint64_t v5 = SDFeedbackTransactionCreate(@"didRank");
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__SDFeedbackInterceptor_didRankSections___block_invoke;
  block[3] = &unk_2644B2B40;
  void block[4] = self;
  id v10 = v4;
  id v11 = v5;
  id v7 = v5;
  id v8 = v4;
  dispatch_async(queue, block);
}

void __41__SDFeedbackInterceptor_didRankSections___block_invoke(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  [*(id *)(*(void *)(a1 + 32) + 104) didRankSections:*(void *)(a1 + 40)];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v2 = [*(id *)(a1 + 40) sections];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (!v3)
  {
LABEL_9:

    goto LABEL_30;
  }
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)v35;
  uint64_t v6 = *MEMORY[0x263F790C0];
LABEL_3:
  uint64_t v7 = 0;
  while (1)
  {
    if (*(void *)v35 != v5) {
      objc_enumerationMutation(v2);
    }
    id v8 = [*(id *)(*((void *)&v34 + 1) + 8 * v7) section];
    id v9 = [v8 bundleIdentifier];
    char v10 = [v9 isEqualToString:v6];

    if (v10) {
      break;
    }

    if (v4 == ++v7)
    {
      uint64_t v4 = [v2 countByEnumeratingWithState:&v34 objects:v39 count:16];
      if (!v4) {
        goto LABEL_9;
      }
      goto LABEL_3;
    }
  }

  if (!v8)
  {
LABEL_30:
    if (*(void *)(a1 + 48)) {
      id v28 = self;
    }
    return;
  }
  id v11 = objc_opt_new();
  long long v12 = objc_opt_new();
  long long v13 = *(void **)(*(void *)(a1 + 32) + 16);
  long long v14 = [v8 bundleIdentifier];
  id v15 = [v13 objectForKeyedSubscript:v14];

  if (!v15) {
    goto LABEL_25;
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  int v29 = v15;
  uint64_t v16 = [v15 arrayOfRankingItems];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (!v17) {
    goto LABEL_24;
  }
  uint64_t v18 = v17;
  uint64_t v19 = *(void *)v31;
  do
  {
    for (uint64_t i = 0; i != v18; ++i)
    {
      if (*(void *)v31 != v19) {
        objc_enumerationMutation(v16);
      }
      uint64_t v21 = *(void **)(*((void *)&v30 + 1) + 8 * i);
      uint64_t v22 = [v21 identifier];
      [v11 addObject:v22];

      v23 = [v21 localSuggestionsData];

      if (v23)
      {
        uint64_t v24 = [v21 localSuggestionsData];
      }
      else
      {
        uint64_t v25 = [v21 serverSuggestionsData];

        if (!v25) {
          continue;
        }
        uint64_t v24 = [v21 serverSuggestionsData];
      }
      uint64_t v26 = (void *)v24;
      [v12 addObject:v24];
    }
    uint64_t v18 = [v16 countByEnumeratingWithState:&v30 objects:v38 count:16];
  }
  while (v18);
LABEL_24:

  id v15 = v29;
LABEL_25:
  if ([v11 count])
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 88), v11);
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 80), v12);
  }
  if (*(void *)(a1 + 48)) {
    id v27 = self;
  }
}

- (void)didEngageResult:(id)a3
{
  id v4 = a3;
  uint64_t v5 = SDFeedbackTransactionCreate(@"didEngage");
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__SDFeedbackInterceptor_didEngageResult___block_invoke;
  block[3] = &unk_2644B2B40;
  void block[4] = self;
  id v10 = v4;
  id v11 = v5;
  id v7 = v5;
  id v8 = v4;
  dispatch_async(queue, block);
}

id __41__SDFeedbackInterceptor_didEngageResult___block_invoke(void *a1)
{
  [*(id *)(a1[4] + 104) didEngageResult:a1[5]];
  id result = (id)a1[6];
  if (result) {
    return self;
  }
  return result;
}

- (void)resultsDidBecomeVisible:(id)a3
{
  id v4 = a3;
  uint64_t v5 = SDFeedbackTransactionCreate(@"didBecomeVisible");
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__SDFeedbackInterceptor_resultsDidBecomeVisible___block_invoke;
  block[3] = &unk_2644B2B40;
  void block[4] = self;
  id v10 = v4;
  id v11 = v5;
  id v7 = v5;
  id v8 = v4;
  dispatch_async(queue, block);
}

void __49__SDFeedbackInterceptor_resultsDidBecomeVisible___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 104) resultsDidBecomeVisible:*(void *)(a1 + 40)];
  id v11 = [*(id *)(a1 + 40) results];
  if ([v11 count])
  {
    uint64_t v2 = [v11 firstObject];
    uint64_t v3 = [v2 sectionBundleIdentifier];
    int v4 = [v3 isEqualToString:@"com.apple.searchd.zkw.apps"];

    if (v4)
    {
      if (*(void *)(a1 + 48)) {
        id v5 = self;
      }

      goto LABEL_9;
    }
    uint64_t v6 = [*(id *)(a1 + 40) results];
    id v7 = objc_opt_new();
    id v8 = [*(id *)(a1 + 32) _itemsFromSentSectionsWithProtectionClasses:v7 filterWithResults:v6];
    id v9 = [MEMORY[0x263F78E20] sharedInstance];
    [v9 resultsWithRankingItemsDidBecomeVisible:v8 date:0 protectionClassMapping:v7];
  }
  if (*(void *)(a1 + 48)) {
    id v10 = self;
  }
LABEL_9:
}

- (void)searchViewDidAppear:(id)a3
{
  int v4 = SDFeedbackTransactionCreate(@"didAppear");
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __45__SDFeedbackInterceptor_searchViewDidAppear___block_invoke;
  v7[3] = &unk_2644B2990;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

id __45__SDFeedbackInterceptor_searchViewDidAppear___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) testRenderEngagementCounts])
  {
    if ([*(id *)(a1 + 32) isInternalDevice])
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __45__SDFeedbackInterceptor_searchViewDidAppear___block_invoke_2;
      block[3] = &unk_2644B2A50;
      void block[4] = *(void *)(a1 + 32);
      if (kPlaceHolderInputName_block_invoke_2_onceToken != -1) {
        dispatch_once(&kPlaceHolderInputName_block_invoke_2_onceToken, block);
      }
    }
  }
  id result = *(id *)(a1 + 40);
  if (result) {
    return self;
  }
  return result;
}

void __45__SDFeedbackInterceptor_searchViewDidAppear___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x263F78E20] sharedInstance];
  [v2 testCountsMovingDaysInPast];
  [v2 testCountsMovingYearInPast];
  [v2 testCountsMovingCoupleOfYearsInPast];
  [v2 testCountsUptoOneDay];
  [v2 testCountsUptoWeek];
  [v2 testCountsUptoMonth];
  [v2 testCountsUptoQuarter];
  [v2 testCountsUptoHalfYear];
  [v2 testCountsAfterYear];
  [v2 testCountsAfterCoupleYears];
  [v2 testCountsForRegularEngagement];
  [v2 testForDummyEntry];
  if ([*(id *)(a1 + 32) stressTestCounts]) {
    [v2 stressTestCounts];
  }
}

- (void)searchViewDidDisappear:(id)a3
{
  id v4 = a3;
  id v5 = SDFeedbackTransactionCreate(@"didDisappear");
  if (self->_isInternalDevice && ![v4 viewDisappearEvent]) {
    self->_engagedTTR = 1;
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__SDFeedbackInterceptor_searchViewDidDisappear___block_invoke;
  block[3] = &unk_2644B2B40;
  void block[4] = self;
  id v11 = v4;
  id v12 = v5;
  id v7 = v5;
  id v8 = v4;
  dispatch_async(queue, block);
  id v9 = [MEMORY[0x263F78E20] sharedInstance];
  [v9 writeRenderAndEngagementInfo];
}

id __48__SDFeedbackInterceptor_searchViewDidDisappear___block_invoke(void *a1)
{
  [*(id *)(a1[4] + 104) searchViewDidDisappear:a1[5]];
  uint64_t v2 = a1[4];
  if (*(unsigned char *)(v2 + 13))
  {
    *(unsigned char *)(v2 + 13) = 0;
  }
  else
  {
    [*(id *)(v2 + 16) removeAllObjects];
    [*(id *)(a1[4] + 48) removeAllObjects];
  }
  uint64_t v3 = a1[4];
  id v4 = *(void **)(v3 + 88);
  *(void *)(v3 + 88) = 0;

  uint64_t v5 = a1[4];
  id v6 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = 0;

  uint64_t v7 = a1[4];
  id v8 = *(void **)(v7 + 64);
  *(void *)(v7 + 64) = 0;

  id result = (id)a1[6];
  if (result) {
    return self;
  }
  return result;
}

- (void)cleanup
{
  uint64_t v3 = SDFeedbackTransactionCreate(@"cleanup");
  queue = self->_queue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __32__SDFeedbackInterceptor_cleanup__block_invoke;
  v6[3] = &unk_2644B2990;
  v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(queue, v6);
}

id __32__SDFeedbackInterceptor_cleanup__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) removeAllObjects];
  [*(id *)(*(void *)(a1 + 32) + 48) removeAllObjects];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 88);
  *(void *)(v2 + 88) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 80);
  *(void *)(v4 + 80) = 0;

  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = 0;

  id result = *(id *)(a1 + 40);
  if (result) {
    return self;
  }
  return result;
}

- (NSMutableDictionary)sentSections
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSentSections:(id)a3
{
}

- (NSString)currentQuery
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCurrentQuery:(id)a3
{
}

- (unint64_t)currentQueryId
{
  return self->_currentQueryId;
}

- (void)setCurrentQueryId:(unint64_t)a3
{
  self->_currentQueryId = a3;
}

- (NSString)currentClientId
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCurrentClientId:(id)a3
{
}

- (NSMutableOrderedSet)sectionOrder
{
  return (NSMutableOrderedSet *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSectionOrder:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 56, 1);
}

- (void)setQueue:(id)a3
{
}

- (BOOL)collectAnonymousData
{
  return self->_collectAnonymousData;
}

- (void)setCollectAnonymousData:(BOOL)a3
{
  self->_collectAnonymousData = a3;
}

- (PRSRankingItemRanker)usedRanker
{
  return self->_usedRanker;
}

- (void)setUsedRanker:(id)a3
{
}

- (NSDictionary)cepData
{
  return self->_cepData;
}

- (void)setCepData:(id)a3
{
}

- (NSArray)suggestionsData
{
  return self->_suggestionsData;
}

- (void)setSuggestionsData:(id)a3
{
}

- (NSArray)suggestionsIdentifiers
{
  return self->_suggestionsIdentifiers;
}

- (void)setSuggestionsIdentifiers:(id)a3
{
}

- (BOOL)internalDebug
{
  return self->_internalDebug;
}

- (void)setInternalDebug:(BOOL)a3
{
  self->_internalDebug = a3;
}

- (NSString)keyboardPrimaryLanguage
{
  return self->_keyboardPrimaryLanguage;
}

- (void)setKeyboardPrimaryLanguage:(id)a3
{
}

- (BOOL)testRenderEngagementCounts
{
  return self->_testRenderEngagementCounts;
}

- (void)setTestRenderEngagementCounts:(BOOL)a3
{
  self->_testRenderEngagementCounts = a3;
}

- (BOOL)stressTestCounts
{
  return self->_stressTestCounts;
}

- (void)setStressTestCounts:(BOOL)a3
{
  self->_stressTestCounts = a3;
}

- (BOOL)isInternalDevice
{
  return self->_isInternalDevice;
}

- (void)setIsInternalDevice:(BOOL)a3
{
  self->_isInternalDevice = a3;
}

- (BOOL)engagedTTR
{
  return self->_engagedTTR;
}

- (void)setEngagedTTR:(BOOL)a3
{
  self->_engagedTTR = a3;
}

- (SPPersonalMetricManager)personalMetricManager
{
  return self->_personalMetricManager;
}

- (void)setPersonalMetricManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personalMetricManager, 0);
  objc_storeStrong((id *)&self->_keyboardPrimaryLanguage, 0);
  objc_storeStrong((id *)&self->_suggestionsIdentifiers, 0);
  objc_storeStrong((id *)&self->_suggestionsData, 0);
  objc_storeStrong((id *)&self->_cepData, 0);
  objc_storeStrong((id *)&self->_usedRanker, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_sectionOrder, 0);
  objc_storeStrong((id *)&self->_currentClientId, 0);
  objc_storeStrong((id *)&self->_currentQuery, 0);

  objc_storeStrong((id *)&self->_sentSections, 0);
}

@end