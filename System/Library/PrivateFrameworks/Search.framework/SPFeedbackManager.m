@interface SPFeedbackManager
+ (id)sharedManager;
+ (void)bumpPriorityOnQueue:(id)a3 withCompletion:(id)a4;
+ (void)flushFeedbackWithCompletion:(id)a3;
- (BOOL)isParsecEnabled;
- (BOOL)isParsecFeedbackEnabled;
- (BOOL)needsToDisplayFirstTimeView;
- (NSUserDefaults)defaultsCenter;
- (OS_dispatch_queue)feedbackQueue;
- (PARSession)parsecFeedbackListener;
- (SPFeedbackManager)init;
- (void)_sendFeedback:(id)a3 type:(int64_t)a4;
- (void)_sendFeedback:(id)a3 type:(int64_t)a4 queryId:(unint64_t)a5;
- (void)cardViewDidAppear:(id)a3;
- (void)cardViewDidDisappear:(id)a3;
- (void)didAppendLateSections:(id)a3;
- (void)didClearInput:(id)a3;
- (void)didEndSearch:(id)a3;
- (void)didEngageCardSection:(id)a3;
- (void)didEngageResult:(id)a3;
- (void)didEngageSection:(id)a3;
- (void)didEngageSuggestion:(id)a3;
- (void)didErrorOccur:(id)a3;
- (void)didGradeResultRelevancy:(id)a3;
- (void)didPerformCommand:(id)a3;
- (void)didRankSections:(id)a3;
- (void)didReceiveResultsAfterTimeout:(id)a3;
- (void)didReportUserResponseFeedback:(id)a3;
- (void)didStartSearch:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)reportFeedback:(id)a3 queryId:(int64_t)a4;
- (void)resultsDidBecomeVisible:(id)a3;
- (void)searchViewDidAppear:(id)a3;
- (void)searchViewDidDisappear:(id)a3;
- (void)sectionHeaderDidBecomeVisible:(id)a3;
- (void)sendCustomFeedback:(id)a3;
- (void)setDefaultsCenter:(id)a3;
- (void)setFeedbackQueue:(id)a3;
- (void)setIsParsecEnabled:(BOOL)a3;
- (void)setNeedsToDisplayFirstTimeView:(BOOL)a3;
- (void)setParsecFeedbackListener:(id)a3;
- (void)suggestionsDidBecomeVisible:(id)a3;
- (void)updateNeedsToDisplayFirstTimeView;
- (void)updateParsecEnabled;
@end

@implementation SPFeedbackManager

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_7);
  }
  v2 = (void *)sharedManager_sharedManager;

  return v2;
}

void __54__SPFeedbackManager_updateNeedsToDisplayFirstTimeView__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) defaultsCenter];
  objc_msgSend(*(id *)(a1 + 32), "setNeedsToDisplayFirstTimeView:", objc_msgSend(v2, "integerForKey:", @"SPUISearchFirstTimeShowCount") == 0);

  uint64_t v3 = [*(id *)(a1 + 32) isParsecFeedbackEnabled];
  id v5 = [*(id *)(a1 + 32) parsecFeedbackListener];
  v4 = [v5 configuration];
  [v4 setParsecEnabled:v3];
}

- (void)setNeedsToDisplayFirstTimeView:(BOOL)a3
{
  self->_needsToDisplayFirstTimeView = a3;
}

- (NSUserDefaults)defaultsCenter
{
  return self->_defaultsCenter;
}

uint64_t __34__SPFeedbackManager_sharedManager__block_invoke()
{
  sharedManager_sharedManager = objc_opt_new();

  return MEMORY[0x270F9A758]();
}

- (SPFeedbackManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)SPFeedbackManager;
  v2 = [(SPFeedbackManager *)&v12 init];
  if (v2)
  {
    uint64_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.spotlight.feedback", v4);
    feedbackQueue = v2->_feedbackQueue;
    v2->_feedbackQueue = (OS_dispatch_queue *)v5;

    v7 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.spotlightui"];
    [v7 addObserver:v2 forKeyPath:@"SPUISearchFirstTimeShowCount" options:0 context:0];
    [v7 addObserver:v2 forKeyPath:@"SBSearchDisabledDomains" options:0 context:0];
    [(SPFeedbackManager *)v2 setDefaultsCenter:v7];
    [(SPFeedbackManager *)v2 updateNeedsToDisplayFirstTimeView];
    [(SPFeedbackManager *)v2 updateParsecEnabled];
    v8 = [MEMORY[0x263F086E0] mainBundle];
    uint64_t v9 = [v8 bundleIdentifier];
    clientBundleID = v2->_clientBundleID;
    v2->_clientBundleID = (NSString *)v9;

    v2->_clientRankAndBlend = _os_feature_enabled_impl();
    if ([(NSString *)v2->_clientBundleID hasPrefix:@"com.apple.omniSearch"]
      || [(NSString *)v2->_clientBundleID hasPrefix:@"com.apple.intelligenceflow"])
    {
      v2->_clientRankAndBlend = 0;
    }
  }
  return v2;
}

- (void)updateParsecEnabled
{
  feedbackQueue = self->_feedbackQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__SPFeedbackManager_updateParsecEnabled__block_invoke;
  block[3] = &unk_2644B2A50;
  block[4] = self;
  dispatch_async(feedbackQueue, block);
}

- (void)updateNeedsToDisplayFirstTimeView
{
  feedbackQueue = self->_feedbackQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__SPFeedbackManager_updateNeedsToDisplayFirstTimeView__block_invoke;
  block[3] = &unk_2644B2A50;
  block[4] = self;
  dispatch_async(feedbackQueue, block);
}

- (void)setDefaultsCenter:(id)a3
{
}

- (void)_sendFeedback:(id)a3 type:(int64_t)a4
{
  id v6 = a3;
  -[SPFeedbackManager _sendFeedback:type:queryId:](self, "_sendFeedback:type:queryId:", v6, a4, [v6 queryId]);
}

- (void)_sendFeedback:(id)a3 type:(int64_t)a4 queryId:(unint64_t)a5
{
  id v8 = a3;
  feedbackQueue = self->_feedbackQueue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __48__SPFeedbackManager__sendFeedback_type_queryId___block_invoke;
  v11[3] = &unk_2644B2AF0;
  v11[4] = self;
  id v12 = v8;
  unint64_t v13 = a5;
  int64_t v14 = a4;
  id v10 = v8;
  dispatch_async(feedbackQueue, v11);
}

void __40__SPFeedbackManager_updateParsecEnabled__block_invoke(uint64_t a1)
{
  v2 = SPGetDisabledDomainSet();
  if ([v2 containsObject:@"DOMAIN_PARSEC"])
  {
    v4 = *(void **)(a1 + 32);
    uint64_t v3 = (id *)(a1 + 32);
    [v4 setIsParsecEnabled:0];
  }
  else
  {
    dispatch_queue_t v5 = [MEMORY[0x263F53C50] sharedConnection];
    uint64_t v6 = [v5 isSpotlightInternetResultsAllowed];
    v7 = *(void **)(a1 + 32);
    uint64_t v3 = (id *)(a1 + 32);
    [v7 setIsParsecEnabled:v6];
  }
  uint64_t v8 = [*v3 isParsecFeedbackEnabled];
  id v10 = [*v3 parsecFeedbackListener];
  uint64_t v9 = [v10 configuration];
  [v9 setParsecEnabled:v8];
}

void __48__SPFeedbackManager__sendFeedback_type_queryId___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v67 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) isParsecFeedbackEnabled]) {
    [*(id *)(*(void *)(v1 + 32) + 32) reportFeedback:*(void *)(v1 + 40) queryId:*(void *)(v1 + 48)];
  }
  if (*(void *)(v1 + 56) == 26)
  {
    uint64_t v2 = v1;
    id v3 = *(id *)(v1 + 40);
    v4 = [v3 result];
    dispatch_queue_t v5 = [v3 cardSection];
    uint64_t v6 = [v5 spotlightBackingResult];

    v7 = [v6 resultBundleId];
    int v8 = [v7 isEqualToString:*MEMORY[0x263F79110]];

    if (v8)
    {
      id v9 = v6;

      v4 = v9;
    }
    uint64_t v10 = [v3 triggerEvent];
    uint64_t v1 = v2;
    if (v4 && (unint64_t)(v10 - 5) >= 0xFFFFFFFFFFFFFFFCLL)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || ([v4 query], (v11 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        id v12 = [v4 userInput];
        unint64_t v13 = v12;
        if (v12)
        {
          id v14 = v12;
        }
        else
        {
          id v14 = [v4 completion];
        }
        v11 = v14;

        uint64_t v1 = v2;
      }
      [MEMORY[0x263F78E30] cacheResult:v4 searchString:v11];
    }
  }
  id v15 = *(id *)(v1 + 40);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v16 = *(id *)(v1 + 40);
    v17 = (void *)[v16 copy];
    objc_msgSend(v17, "setQueryId:", objc_msgSend(v16, "queryId"));
    v18 = [v16 cardSection];
    v19 = [v18 spotlightBackingResult];
    if (v19)
    {
      v20 = v17;
      [v17 setResult:v19];
    }
    else
    {
      [v16 result];
      v22 = uint64_t v21 = v1;
      v20 = v17;
      [v17 setResult:v22];

      uint64_t v1 = v21;
    }

    id v15 = v20;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v49 = v15;
    uint64_t v50 = v1;
    id v23 = *(id *)(v1 + 40);
    v24 = (void *)[v23 copy];
    v25 = [v23 uniqueIdsOfVisibleButtons];
    [v24 setUniqueIdsOfVisibleButtons:v25];

    v26 = [v23 uniqueIdentifiersOfVisibleCardSections];
    [v24 setUniqueIdentifiersOfVisibleCardSections:v26];

    v48 = v23;
    v27 = [v23 goTakeoverResult];
    [v24 setGoTakeoverResult:v27];

    v28 = [v24 results];
    v29 = objc_opt_new();
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    id obj = v28;
    uint64_t v30 = [obj countByEnumeratingWithState:&v61 objects:v66 count:16];
    if (!v30) {
      goto LABEL_47;
    }
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v62;
    uint64_t v51 = *(void *)v62;
    while (1)
    {
      uint64_t v33 = 0;
      uint64_t v52 = v31;
      do
      {
        if (*(void *)v62 != v32) {
          objc_enumerationMutation(obj);
        }
        v34 = *(void **)(*((void *)&v61 + 1) + 8 * v33);
        if ([v34 usesCompactDisplay]) {
          [v34 compactCard];
        }
        else {
        v35 = [v34 inlineCard];
        }
        v36 = [v35 cardSections];
        v37 = [v36 firstObject];

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v55 = v35;
          uint64_t v56 = v33;
          long long v59 = 0u;
          long long v60 = 0u;
          long long v57 = 0u;
          long long v58 = 0u;
          v54 = v37;
          v38 = [v37 cardSections];
          uint64_t v39 = [v38 countByEnumeratingWithState:&v57 objects:v65 count:16];
          if (!v39) {
            goto LABEL_43;
          }
          uint64_t v40 = v39;
          uint64_t v41 = *(void *)v58;
          while (1)
          {
            for (uint64_t i = 0; i != v40; ++i)
            {
              if (*(void *)v58 != v41) {
                objc_enumerationMutation(v38);
              }
              v43 = *(void **)(*((void *)&v57 + 1) + 8 * i);
              v44 = [v24 uniqueIdentifiersOfVisibleCardSections];
              v45 = [v43 cardSectionId];
              if ([v44 containsObject:v45])
              {
                v46 = [v43 spotlightBackingResult];

                if (!v46) {
                  continue;
                }
                v44 = [v43 spotlightBackingResult];
                [v29 addObject:v44];
              }
              else
              {
              }
            }
            uint64_t v40 = [v38 countByEnumeratingWithState:&v57 objects:v65 count:16];
            if (!v40)
            {
LABEL_43:

              uint64_t v32 = v51;
              uint64_t v31 = v52;
              v35 = v55;
              uint64_t v33 = v56;
              v37 = v54;
              goto LABEL_45;
            }
          }
        }
        [v29 addObject:v34];
LABEL_45:

        ++v33;
      }
      while (v33 != v31);
      uint64_t v31 = [obj countByEnumeratingWithState:&v61 objects:v66 count:16];
      if (!v31)
      {
LABEL_47:

        [v24 setResults:v29];
        uint64_t v1 = v50;
        goto LABEL_49;
      }
    }
  }
  v24 = v15;
LABEL_49:
  if (*(unsigned char *)(*(void *)(v1 + 32) + 8))
  {
    v47 = +[SPSearchFeedbackProxy sharedProxy];
    [v47 sendFeedbackType:*(void *)(v1 + 56) feedback:v24 queryId:*(void *)(v1 + 48) clientID:*(void *)(*(void *)(v1 + 32) + 16)];
  }
  else
  {
    v47 = +[SPDaemonConnection sharedBackgroundConnection];
    [v47 sendSFFeedback:v24 type:*(void *)(v1 + 56) queryId:*(void *)(v1 + 48)];
  }
}

- (BOOL)isParsecFeedbackEnabled
{
  if ([(SPFeedbackManager *)self needsToDisplayFirstTimeView]) {
    return 0;
  }

  return [(SPFeedbackManager *)self isParsecEnabled];
}

- (BOOL)needsToDisplayFirstTimeView
{
  return self->_needsToDisplayFirstTimeView;
}

- (BOOL)isParsecEnabled
{
  return self->_isParsecEnabled;
}

- (PARSession)parsecFeedbackListener
{
  return self->_parsecFeedbackListener;
}

- (void)setIsParsecEnabled:(BOOL)a3
{
  self->_isParsecEnabled = a3;
}

- (void)sectionHeaderDidBecomeVisible:(id)a3
{
}

- (void)resultsDidBecomeVisible:(id)a3
{
}

- (void)didStartSearch:(id)a3
{
}

- (void)didRankSections:(id)a3
{
}

- (void)didEndSearch:(id)a3
{
}

- (void)setParsecFeedbackListener:(id)a3
{
}

+ (void)flushFeedbackWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = +[SPFeedbackManager sharedManager];
  uint64_t v6 = [v5 feedbackQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __49__SPFeedbackManager_flushFeedbackWithCompletion___block_invoke;
  v8[3] = &unk_2644B2F30;
  id v9 = v4;
  id v10 = a1;
  id v7 = v4;
  [a1 bumpPriorityOnQueue:v6 withCompletion:v8];
}

void __49__SPFeedbackManager_flushFeedbackWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 40);
  id v3 = +[SPDaemonConnection sharedBackgroundConnection];
  id v4 = [v3 connectionQueue];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __49__SPFeedbackManager_flushFeedbackWithCompletion___block_invoke_2;
  v5[3] = &unk_2644B2F08;
  id v6 = *(id *)(a1 + 32);
  [v2 bumpPriorityOnQueue:v4 withCompletion:v5];
}

void __49__SPFeedbackManager_flushFeedbackWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = +[SPDaemonConnection sharedBackgroundConnection];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __49__SPFeedbackManager_flushFeedbackWithCompletion___block_invoke_3;
  v3[3] = &unk_2644B2F08;
  id v4 = *(id *)(a1 + 32);
  [v2 barrierOnXPC:v3];
}

uint64_t __49__SPFeedbackManager_flushFeedbackWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)bumpPriorityOnQueue:(id)a3 withCompletion:(id)a4
{
  id v5 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__SPFeedbackManager_bumpPriorityOnQueue_withCompletion___block_invoke;
  block[3] = &unk_2644B2F08;
  id v10 = v5;
  id v6 = v5;
  id v7 = a3;
  dispatch_block_t v8 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, block);
  dispatch_async(v7, v8);
}

uint64_t __56__SPFeedbackManager_bumpPriorityOnQueue_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)searchViewDidAppear:(id)a3
{
}

- (void)searchViewDidDisappear:(id)a3
{
}

- (void)cardViewDidDisappear:(id)a3
{
}

- (void)didEngageResult:(id)a3
{
}

- (void)didEngageSuggestion:(id)a3
{
}

- (void)didEngageCardSection:(id)a3
{
}

- (void)didErrorOccur:(id)a3
{
}

- (void)sendCustomFeedback:(id)a3
{
}

- (void)suggestionsDidBecomeVisible:(id)a3
{
}

- (void)didReceiveResultsAfterTimeout:(id)a3
{
}

- (void)didAppendLateSections:(id)a3
{
}

- (void)didClearInput:(id)a3
{
}

- (void)didEngageSection:(id)a3
{
}

- (void)didGradeResultRelevancy:(id)a3
{
}

- (void)cardViewDidAppear:(id)a3
{
}

- (void)didReportUserResponseFeedback:(id)a3
{
}

- (void)reportFeedback:(id)a3 queryId:(int64_t)a4
{
}

- (void)didPerformCommand:(id)a3
{
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([v10 isEqualToString:@"SPUISearchFirstTimeShowCount"])
  {
    [(SPFeedbackManager *)self updateNeedsToDisplayFirstTimeView];
  }
  else if ([v10 isEqualToString:@"SBSearchDisabledDomains"])
  {
    [(SPFeedbackManager *)self updateParsecEnabled];
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)SPFeedbackManager;
    if ([(SPFeedbackManager *)&v14 respondsToSelector:sel_observeValueForKeyPath_ofObject_change_context_])
    {
      v13.receiver = self;
      v13.super_class = (Class)SPFeedbackManager;
      [(SPFeedbackManager *)&v13 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
    }
  }
}

- (OS_dispatch_queue)feedbackQueue
{
  return self->_feedbackQueue;
}

- (void)setFeedbackQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultsCenter, 0);
  objc_storeStrong((id *)&self->_feedbackQueue, 0);
  objc_storeStrong((id *)&self->_parsecFeedbackListener, 0);

  objc_storeStrong((id *)&self->_clientBundleID, 0);
}

@end