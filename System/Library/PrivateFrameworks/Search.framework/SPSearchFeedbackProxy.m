@interface SPSearchFeedbackProxy
+ (id)sharedProxy;
- (BOOL)clientID:(id)a3 supportsFeedbackListener:(id)a4;
- (BOOL)isParsecEnabled;
- (SPSearchFeedbackProxy)init;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)sendCustomFeedback:(id)a3 clientID:(id)a4;
- (void)sendFeedbackType:(int64_t)a3 feedback:(id)a4 queryId:(unint64_t)a5 clientID:(id)a6;
- (void)setIsParsecEnabled:(BOOL)a3;
- (void)updateParsecEnabled;
@end

@implementation SPSearchFeedbackProxy

+ (id)sharedProxy
{
  if (sharedProxy_onceToken != -1) {
    dispatch_once(&sharedProxy_onceToken, &__block_literal_global_240);
  }
  v2 = (void *)sharedProxy_sSharedProxy;

  return v2;
}

void __36__SPSearchFeedbackProxy_sharedProxy__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)sharedProxy_sSharedProxy;
  sharedProxy_sSharedProxy = v0;

  if (initFeedbackTables_onceToken != -1)
  {
    dispatch_once(&initFeedbackTables_onceToken, &__block_literal_global_0);
  }
}

- (SPSearchFeedbackProxy)init
{
  v8.receiver = self;
  v8.super_class = (Class)SPSearchFeedbackProxy;
  v2 = [(SPSearchFeedbackProxy *)&v8 init];
  if (v2)
  {
    uint64_t v3 = +[SPSearchFeedbackSender feedbackQueue];
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = (NSUserDefaults *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.spotlightui"];
    [(NSUserDefaults *)v5 addObserver:v2 forKeyPath:@"SPUISearchFirstTimeShowCount" options:0 context:0];
    [(NSUserDefaults *)v5 addObserver:v2 forKeyPath:@"SBSearchDisabledDomains" options:0 context:0];
    defaultsCenter = v2->_defaultsCenter;
    v2->_defaultsCenter = v5;

    [(SPSearchFeedbackProxy *)v2 updateParsecEnabled];
  }
  return v2;
}

- (void)updateParsecEnabled
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v3 = SPGetDisabledDomainSet();
  uint64_t v4 = 0;
  if (([v3 containsObject:@"DOMAIN_PARSEC"] & 1) == 0)
  {
    v5 = [MEMORY[0x263F53C50] sharedConnection];
    uint64_t v4 = [v5 isSpotlightInternetResultsAllowed];
  }
  uint64_t v6 = [(NSUserDefaults *)self->_defaultsCenter integerForKey:@"SPUISearchFirstTimeShowCount"];
  if (v6 > 0) {
    char v7 = v4;
  }
  else {
    char v7 = 0;
  }
  _permitParsecFeedback = v7;
  [(SPSearchFeedbackProxy *)self setIsParsecEnabled:v4];
  objc_super v8 = +[SPCoreParsecInterface getSharedInstance];
  [v8 setParsecFeedbackAllowed:_permitParsecFeedback];

  v9 = SPLogForSPLogCategoryDefault();
  os_log_type_t v10 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v9, v10))
  {
    int v15 = 134217984;
    uint64_t v16 = v6;
    _os_log_impl(&dword_21E5D7000, v9, v10, "[FEEDBACK-DEBUG] (_userPrefsChanged) firstTimeShowCount: %ld", (uint8_t *)&v15, 0xCu);
  }

  v11 = SPLogForSPLogCategoryDefault();
  os_log_type_t v12 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v11, v12))
  {
    int v15 = 67109120;
    LODWORD(v16) = v4 ^ 1;
    _os_log_impl(&dword_21E5D7000, v11, v12, "[FEEDBACK-DEBUG] (_userPrefsChanged) DOMAIN_PARSEC disabled: %d", (uint8_t *)&v15, 8u);
  }

  v13 = SPLogForSPLogCategoryDefault();
  os_log_type_t v14 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v13, v14))
  {
    int v15 = 67109120;
    LODWORD(v16) = _permitParsecFeedback;
    _os_log_impl(&dword_21E5D7000, v13, v14, "[FEEDBACK-DEBUG] (_userPrefsChanged) _permitParsecFeedback: %d", (uint8_t *)&v15, 8u);
  }

  +[SPSearchFeedbackSender synchronizedBlock:&__block_literal_global_252];
}

void __44__SPSearchFeedbackProxy_updateParsecEnabled__block_invoke()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  uint64_t v0 = SPLogForSPLogCategoryDefault();
  os_log_type_t v1 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v0, v1))
  {
    v3[0] = 67109120;
    v3[1] = _permitParsecFeedback;
    _os_log_impl(&dword_21E5D7000, v0, v1, "[FEEDBACK-DEBUG] (_userPrefsChanged) _permitParsecFeedback: %d", (uint8_t *)v3, 8u);
  }

  v2 = +[SPCoreParsecInterface getSharedInstance];
  [v2 setParsecFeedbackAllowed:_permitParsecFeedback];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (([v10 isEqualToString:@"SPUISearchFirstTimeShowCount"] & 1) != 0
    || [v10 isEqualToString:@"SBSearchDisabledDomains"])
  {
    [(SPSearchFeedbackProxy *)self updateParsecEnabled];
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)SPSearchFeedbackProxy;
    if ([(SPSearchFeedbackProxy *)&v14 respondsToSelector:sel_observeValueForKeyPath_ofObject_change_context_])
    {
      v13.receiver = self;
      v13.super_class = (Class)SPSearchFeedbackProxy;
      [(SPSearchFeedbackProxy *)&v13 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
    }
  }
}

- (void)sendFeedbackType:(int64_t)a3 feedback:(id)a4 queryId:(unint64_t)a5 clientID:(id)a6
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a6;
  if ((unint64_t)(a3 - 1) > 0x19 || !v10)
  {
    v25 = SPLogForSPLogCategoryFeedback();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[SPSearchFeedbackProxy sendFeedbackType:feedback:queryId:clientID:](a3, (uint64_t)v10, v25);
    }
    goto LABEL_19;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v25 = SPLogForSPLogCategoryFeedback();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[SPSearchFeedbackProxy sendFeedbackType:feedback:queryId:clientID:](a3, v10);
    }
LABEL_19:

    goto LABEL_20;
  }
  if (sendFeedbackType_feedback_queryId_clientID__onceToken != -1) {
    dispatch_once(&sendFeedbackType_feedback_queryId_clientID__onceToken, &__block_literal_global_258);
  }
  if (a3 == 8)
  {
    if (sendFeedbackType_feedback_queryId_clientID__isInternal)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v12 = v10;
        objc_super v13 = [v12 result];
        objc_super v14 = [v13 identifier];
        int v15 = [v14 isEqualToString:@"com.apple.other:taptoradar"];

        if (v15)
        {
          uint64_t v16 = +[SDFeedbackInterceptor sharedInstance];
          [v16 dumpTTRDebugFiles];
        }
      }
    }
  }
  uint64_t v17 = SPLogForSPLogCategoryDefault();
  os_log_type_t v18 = gSPLogInfoAsDefault ^ 1;
  if (os_log_type_enabled(v17, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
  {
    uint64_t v19 = sSPFeedbackTypeDescriptionTable[a3];
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = v19;
    _os_log_impl(&dword_21E5D7000, v17, v18, "send feedback (%s)", buf, 0xCu);
  }

  v20 = (void *)os_transaction_create();
  *(void *)buf = 0;
  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__SPSearchFeedbackProxy_sendFeedbackType_feedback_queryId_clientID___block_invoke_261;
  block[3] = &unk_2644B28A0;
  objc_copyWeak(v31, (id *)buf);
  id v22 = v10;
  v31[1] = (id)a3;
  id v27 = v22;
  v28 = self;
  id v23 = v11;
  v31[2] = (id)a5;
  id v29 = v23;
  id v30 = v20;
  id v24 = v20;
  dispatch_async(queue, block);

  objc_destroyWeak(v31);
  objc_destroyWeak((id *)buf);
LABEL_20:
}

uint64_t __68__SPSearchFeedbackProxy_sendFeedbackType_feedback_queryId_clientID___block_invoke()
{
  uint64_t result = os_variant_has_internal_diagnostics();
  sendFeedbackType_feedback_queryId_clientID__isInternal = result;
  return result;
}

void __68__SPSearchFeedbackProxy_sendFeedbackType_feedback_queryId_clientID___block_invoke_261(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    id v3 = *(id *)(a1 + 32);
    if (v3)
    {
      uint64_t v4 = (uint64_t *)(a1 + 72);
      if (objc_opt_isKindOfClass())
      {
        if (*v4 == 7
          && (+[SDFeedbackInterceptor sharedInstance],
              (v5 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          v25[0] = MEMORY[0x263EF8330];
          v25[1] = 3221225472;
          v25[2] = __68__SPSearchFeedbackProxy_sendFeedbackType_feedback_queryId_clientID___block_invoke_262;
          v25[3] = &unk_2644B2878;
          id v6 = WeakRetained;
          uint64_t v7 = *v4;
          id v26 = v6;
          uint64_t v28 = v7;
          id v27 = v3;
          [v5 annotateRankingFeedback:v27 completion:v25];
        }
        else
        {
          long long v23 = 0u;
          long long v24 = 0u;
          long long v21 = 0u;
          long long v22 = 0u;
          id v10 = +[SPSearchFeedbackSender feedbackListeners];
          uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v31 count:16];
          if (v11)
          {
            uint64_t v12 = *(void *)v22;
            do
            {
              for (uint64_t i = 0; i != v11; ++i)
              {
                if (*(void *)v22 != v12) {
                  objc_enumerationMutation(v10);
                }
                objc_super v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
                int v15 = [v14 feedbackListener];
                if ([*(id *)(a1 + 40) clientID:*(void *)(a1 + 48) supportsFeedbackListener:v15])
                {
                  int v16 = [v14 supportsFeedbackType:21];
                  if (*v4 == 11) {
                    int v17 = 0;
                  }
                  else {
                    int v17 = v16;
                  }
                  if (v17 == 1)
                  {
LABEL_23:
                    [v15 reportFeedback:v3 queryId:*(void *)(a1 + 80)];
                  }
                  else if (objc_msgSend(v14, "supportsFeedbackType:"))
                  {
                    switch(*v4)
                    {
                      case 1:
                        [v15 didErrorOccur:v3];
                        break;
                      case 2:
                        [v15 searchViewDidAppear:v3];
                        break;
                      case 3:
                        [v15 searchViewDidDisappear:v3];
                        break;
                      case 4:
                        [v15 cardViewDidDisappear:v3];
                        break;
                      case 5:
                        [v15 didStartSearch:v3];
                        break;
                      case 6:
                        [v15 didEndSearch:v3];
                        break;
                      case 7:
                        [v15 didRankSections:v3];
                        break;
                      case 8:
                        [v15 didEngageResult:v3];
                        break;
                      case 9:
                        [v15 didEngageSuggestion:v3];
                        break;
                      case 10:
                        [v15 didEngageCardSection:v3];
                        break;
                      case 11:
                        [v15 sendCustomFeedback:v3];
                        break;
                      case 12:
                        [v15 resultsDidBecomeVisible:v3];
                        break;
                      case 13:
                        [v15 suggestionsDidBecomeVisible:v3];
                        break;
                      case 14:
                        [v15 didReceiveResultsAfterTimeout:v3];
                        break;
                      case 15:
                        [v15 didAppendLateSections:v3];
                        break;
                      case 16:
                        [v15 didClearInput:v3];
                        break;
                      case 17:
                        [v15 didEngageSection:v3];
                        break;
                      case 18:
                        [v15 sectionHeaderDidBecomeVisible:v3];
                        break;
                      case 19:
                        [v15 didGradeResultRelevancy:v3];
                        break;
                      case 20:
                        [v15 cardViewDidAppear:v3];
                        break;
                      case 21:
                        goto LABEL_23;
                      case 22:
                        [v15 didGoToSite:v3];
                        break;
                      case 23:
                        [v15 didGoToSearch:v3];
                        break;
                      case 24:
                        [v15 didGradeLookupHintRelevancy:v3];
                        break;
                      case 25:
                        [v15 didReportUserResponseFeedback:v3];
                        break;
                      case 26:
                        [v15 didPerformCommand:v3];
                        break;
                      default:
                        os_log_type_t v18 = SPLogForSPLogCategoryFeedback();
                        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
                        {
                          uint64_t v19 = *v4;
                          *(_DWORD *)buf = 67109120;
                          LODWORD(v30) = v19;
                          _os_log_error_impl(&dword_21E5D7000, v18, OS_LOG_TYPE_ERROR, "*** Error feedback type %d not handled", buf, 8u);
                        }

                        break;
                    }
                  }
                }
              }
              uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v31 count:16];
            }
            while (v11);
          }

          id v20 = self;
        }
      }
      else
      {
        v9 = SPLogForSPLogCategoryFeedback();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          __68__SPSearchFeedbackProxy_sendFeedbackType_feedback_queryId_clientID___block_invoke_261_cold_2((uint64_t)v4, v3);
        }
      }
    }
    else
    {
      objc_super v8 = SPLogForSPLogCategoryFeedback();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __68__SPSearchFeedbackProxy_sendFeedbackType_feedback_queryId_clientID___block_invoke_261_cold_1(a1, v8);
      }
    }
  }
}

void __68__SPSearchFeedbackProxy_sendFeedbackType_feedback_queryId_clientID___block_invoke_262(void *a1)
{
  os_log_type_t v1 = *(NSObject **)(a1[4] + 8);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  _DWORD v3[2] = __68__SPSearchFeedbackProxy_sendFeedbackType_feedback_queryId_clientID___block_invoke_2;
  v3[3] = &unk_2644B2850;
  v2 = (void *)a1[5];
  uint64_t v5 = a1[6];
  id v4 = v2;
  dispatch_async(v1, v3);
}

void __68__SPSearchFeedbackProxy_sendFeedbackType_feedback_queryId_clientID___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = +[SPSearchFeedbackSender feedbackListeners];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if ([v7 supportsFeedbackType:*(void *)(a1 + 40)])
        {
          objc_super v8 = [v7 feedbackListener];
          [v8 didRankSections:*(void *)(a1 + 32)];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

- (BOOL)clientID:(id)a3 supportsFeedbackListener:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  LOBYTE(v5) = [v6 isEqualToString:@"com.apple.PeopleViewService"];
  return v5 & 1 | ((isKindOfClass & 1) == 0);
}

- (void)sendCustomFeedback:(id)a3 clientID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[SPSearchFeedbackProxy sendFeedbackType:feedback:queryId:clientID:](self, "sendFeedbackType:feedback:queryId:clientID:", 11, v7, [v7 queryId], v6);
}

- (BOOL)isParsecEnabled
{
  return self->_isParsecEnabled;
}

- (void)setIsParsecEnabled:(BOOL)a3
{
  self->_isParsecEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultsCenter, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)sendFeedbackType:(uint64_t)a1 feedback:(void *)a2 queryId:clientID:.cold.1(uint64_t a1, void *a2)
{
  v2 = [a2 description];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_21E5D7000, v3, v4, "*** invalid feedback class for (%s) %@", v5, v6, v7, v8, v9);
}

- (void)sendFeedbackType:(os_log_t)log feedback:queryId:clientID:.cold.2(int a1, uint64_t a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 67109376;
  v3[1] = a1;
  __int16 v4 = 2048;
  uint64_t v5 = a2;
  _os_log_error_impl(&dword_21E5D7000, log, OS_LOG_TYPE_ERROR, "invalid information for type %d feedback %p", (uint8_t *)v3, 0x12u);
}

void __68__SPSearchFeedbackProxy_sendFeedbackType_feedback_queryId_clientID___block_invoke_261_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = sSPFeedbackTypeDescriptionTable[*(void *)(a1 + 72)];
  int v3 = 136315138;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_21E5D7000, a2, OS_LOG_TYPE_ERROR, "no feedback (%s)", (uint8_t *)&v3, 0xCu);
}

void __68__SPSearchFeedbackProxy_sendFeedbackType_feedback_queryId_clientID___block_invoke_261_cold_2(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 description];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_21E5D7000, v3, v4, "*** invalid feedback class for (%s) %@", v5, v6, v7, v8, v9);
}

@end