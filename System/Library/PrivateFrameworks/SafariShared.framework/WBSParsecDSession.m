@interface WBSParsecDSession
+ (id)_sharedSessionConfiguration;
+ (id)sharedCorrectionsProcessor;
+ (id)sharedDomainPolicyProvider;
+ (id)sharedPARSession;
+ (void)_parsecEnabledDidChange:(id)a3;
+ (void)_updateAutoFillCorrectionSetsIfNeededForSession:(id)a3 completionHandler:(id)a4;
+ (void)_updateAutoFillTLDsIfNeededForSession:(id)a3 completionHandler:(id)a4;
+ (void)_updateParsecAvailabilityInSessionConfiguration:(id)a3;
- (BOOL)skipAutoFillDataUpdates;
- (NSString)rewrittenQueryStringFromParsec;
- (PARSession)parsecdSession;
- (WBSParsecDSession)initWithParsecdSession:(id)a3 skipAutoFillDataUpdates:(BOOL)a4;
- (WBSParsecFeedbackDispatcher)feedbackDispatcher;
- (double)uiScale;
- (unint64_t)currentQueryID;
- (void)_didReceiveResponse:(id)a3 error:(id)a4 forTask:(id)a5 query:(id)a6;
- (void)_setCurrentQuery:(id)a3 withKeyboardInputType:(id)a4;
- (void)_simulatePARResponseFromJSON:(id)a3 response:(id)a4 task:(id)a5 error:(id)a6;
- (void)_startUpdatingAutoFillDataInBackgroundIfPossibleForSession:(id)a3;
- (void)setCurrentQuery:(id)a3;
- (void)setCurrentQueryID:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setUIScale:(double)a3;
@end

@implementation WBSParsecDSession

- (WBSParsecFeedbackDispatcher)feedbackDispatcher
{
  return (WBSParsecFeedbackDispatcher *)self->_feedbackDispatcher;
}

void __48__WBSParsecDSession__sharedSessionConfiguration__block_invoke(uint64_t a1)
{
  objc_msgSend(NSString, "stringWithFormat:", @"Safari/%s", "8620.1.16.10.11");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [objc_alloc(MEMORY[0x1E4F5CBE0]) initWithId:@"Safari" userAgent:v5];
  v3 = (void *)+[WBSParsecDSession _sharedSessionConfiguration]::configuration;
  +[WBSParsecDSession _sharedSessionConfiguration]::configuration = v2;

  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 addObserver:*(void *)(a1 + 32) selector:sel__parsecEnabledDidChange_ name:@"ParsecEnabledPreferenceDidChange" object:0];

  [*(id *)(a1 + 32) _updateParsecAvailabilityInSessionConfiguration:+[WBSParsecDSession _sharedSessionConfiguration]::configuration];
}

+ (void)_updateParsecAvailabilityInSessionConfiguration:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "setParsecEnabled:", +[WBSSharedFeatureAvailability areSiriSearchSuggestionsEnabled](WBSSharedFeatureAvailability, "areSiriSearchSuggestionsEnabled"));
}

- (WBSParsecDSession)initWithParsecdSession:(id)a3 skipAutoFillDataUpdates:(BOOL)a4
{
  id v7 = a3;
  v17.receiver = self;
  v17.super_class = (Class)WBSParsecDSession;
  v8 = [(WBSParsecDSession *)&v17 init];
  v9 = v8;
  if (v8)
  {
    v8->_skipAutoFillDataUpdates = a4;
    objc_storeStrong((id *)&v8->_parsecdSession, a3);
    [(PARSession *)v9->_parsecdSession setDelegate:v9];
    [(WBSParsecDSession *)v9 _startUpdatingAutoFillDataInBackgroundIfPossibleForSession:v9->_parsecdSession];
    v10 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.SafariShared.WBSParsecDSession.requestProcessingQueue", v10);
    requestProcessingQueue = v9->_requestProcessingQueue;
    v9->_requestProcessingQueue = (OS_dispatch_queue *)v11;

    v13 = [[WBSParsecDFeedbackDispatcher alloc] initWithSession:v7];
    feedbackDispatcher = v9->_feedbackDispatcher;
    v9->_feedbackDispatcher = v13;

    v15 = v9;
  }

  return v9;
}

- (void)_startUpdatingAutoFillDataInBackgroundIfPossibleForSession:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!self->_skipAutoFillDataUpdates)
  {
    v6 = [v4 bag];

    if (v6)
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __80__WBSParsecDSession__startUpdatingAutoFillDataInBackgroundIfPossibleForSession___block_invoke;
      v7[3] = &unk_1E5C8D980;
      v7[4] = self;
      id v8 = v5;
      if (-[WBSParsecDSession _startUpdatingAutoFillDataInBackgroundIfPossibleForSession:]::onceToken != -1) {
        dispatch_once(&-[WBSParsecDSession _startUpdatingAutoFillDataInBackgroundIfPossibleForSession:]::onceToken, v7);
      }
    }
  }
}

+ (id)sharedPARSession
{
  uint64_t v2 = [a1 _sharedSessionConfiguration];
  objc_opt_class();
  if (objc_opt_respondsToSelector())
  {
    id v3 = [MEMORY[0x1E4F5CBD8] sharedPARSessionWithConfiguration:v2];
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __37__WBSParsecDSession_sharedPARSession__block_invoke;
    block[3] = &unk_1E5C8CA70;
    id v6 = v2;
    if (+[WBSParsecDSession sharedPARSession]::onceToken != -1) {
      dispatch_once(&+[WBSParsecDSession sharedPARSession]::onceToken, block);
    }
    id v3 = (id)+[WBSParsecDSession sharedPARSession]::sharedSession;
  }
  return v3;
}

+ (id)_sharedSessionConfiguration
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__WBSParsecDSession__sharedSessionConfiguration__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (+[WBSParsecDSession _sharedSessionConfiguration]::onceToken != -1) {
    dispatch_once(&+[WBSParsecDSession _sharedSessionConfiguration]::onceToken, block);
  }
  uint64_t v2 = (void *)+[WBSParsecDSession _sharedSessionConfiguration]::configuration;
  return v2;
}

void __80__WBSParsecDSession__startUpdatingAutoFillDataInBackgroundIfPossibleForSession___block_invoke(uint64_t a1)
{
  uint64_t v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  dispatch_queue_t v3 = dispatch_queue_create("com.apple.SafariShared.WBSParsecDSession.initialAutofillDataUpdateQueue", v2);

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__WBSParsecDSession__startUpdatingAutoFillDataInBackgroundIfPossibleForSession___block_invoke_2;
  block[3] = &unk_1E5C8D840;
  id v4 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v7 = v4;
  dispatch_queue_t v8 = v3;
  id v5 = v3;
  dispatch_async(v5, block);
}

void __80__WBSParsecDSession__startUpdatingAutoFillDataInBackgroundIfPossibleForSession___block_invoke_2(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v2, (const char *)*MEMORY[0x1E4F142C8], (const char *)*MEMORY[0x1E4F142D0]);
  xpc_dictionary_set_int64(v2, (const char *)*MEMORY[0x1E4F141C8], *MEMORY[0x1E4F14238]);
  xpc_dictionary_set_int64(v2, (const char *)*MEMORY[0x1E4F141A8], *MEMORY[0x1E4F141F8]);
  xpc_dictionary_set_int64(v2, (const char *)*MEMORY[0x1E4F14170], 0);
  uint64_t v3 = objc_opt_class();
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __80__WBSParsecDSession__startUpdatingAutoFillDataInBackgroundIfPossibleForSession___block_invoke_3;
  handler[3] = &unk_1E5C9FA78;
  uint64_t v7 = v3;
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  xpc_activity_register("com.apple.safarishared.WBSParsecDSession.autoFillDataUpdate", v2, handler);
}

void __37__WBSParsecDSession_sharedPARSession__block_invoke(uint64_t a1)
{
  uint64_t v1 = [MEMORY[0x1E4F5CBD8] sessionWithConfiguration:*(void *)(a1 + 32)];
  xpc_object_t v2 = (void *)+[WBSParsecDSession sharedPARSession]::sharedSession;
  +[WBSParsecDSession sharedPARSession]::sharedSession = v1;
}

+ (id)sharedDomainPolicyProvider
{
  if (+[WBSParsecDSession sharedDomainPolicyProvider]::onceToken != -1) {
    dispatch_once(&+[WBSParsecDSession sharedDomainPolicyProvider]::onceToken, &__block_literal_global_100);
  }
  xpc_object_t v2 = (void *)+[WBSParsecDSession sharedDomainPolicyProvider]::sharedDomainPolicyProvider;
  return v2;
}

void __47__WBSParsecDSession_sharedDomainPolicyProvider__block_invoke()
{
  v0 = [WBSFormAutoFillParsecDomainPolicyProvider alloc];
  id v3 = +[WBSFormAutoFillCorrectionsSQLiteStore standardStore];
  uint64_t v1 = -[WBSFormAutoFillParsecDomainPolicyProvider initWithFeedbackAllowList:](v0, "initWithFeedbackAllowList:");
  xpc_object_t v2 = (void *)+[WBSParsecDSession sharedDomainPolicyProvider]::sharedDomainPolicyProvider;
  +[WBSParsecDSession sharedDomainPolicyProvider]::sharedDomainPolicyProvider = v1;
}

+ (id)sharedCorrectionsProcessor
{
  if (+[WBSParsecDSession sharedCorrectionsProcessor]::onceToken != -1) {
    dispatch_once(&+[WBSParsecDSession sharedCorrectionsProcessor]::onceToken, &__block_literal_global_14_1);
  }
  xpc_object_t v2 = (void *)+[WBSParsecDSession sharedCorrectionsProcessor]::sharedCorrectionsProcessor;
  return v2;
}

void __47__WBSParsecDSession_sharedCorrectionsProcessor__block_invoke()
{
  v0 = [WBSFormAutoFillParsecCrowdsourcedCorrectionsProcessor alloc];
  id v3 = +[WBSFormAutoFillCorrectionsSQLiteStore standardStore];
  uint64_t v1 = -[WBSFormAutoFillParsecCrowdsourcedCorrectionsProcessor initWithCorrectionsStore:](v0, "initWithCorrectionsStore:");
  xpc_object_t v2 = (void *)+[WBSParsecDSession sharedCorrectionsProcessor]::sharedCorrectionsProcessor;
  +[WBSParsecDSession sharedCorrectionsProcessor]::sharedCorrectionsProcessor = v1;
}

+ (void)_parsecEnabledDidChange:(id)a3
{
  objc_msgSend(a1, "_sharedSessionConfiguration", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_updateParsecAvailabilityInSessionConfiguration:");
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  requestProcessingQueue = self->_requestProcessingQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __33__WBSParsecDSession_setDelegate___block_invoke;
  v7[3] = &unk_1E5C8D980;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(requestProcessingQueue, v7);
}

void __33__WBSParsecDSession_setDelegate___block_invoke(uint64_t a1)
{
}

- (double)uiScale
{
  return self->_uiScale;
}

- (void)setUIScale:(double)a3
{
  self->_uiScale = a3;
}

- (void)setCurrentQuery:(id)a3
{
  id v4 = a3;
  requestProcessingQueue = self->_requestProcessingQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__WBSParsecDSession_setCurrentQuery___block_invoke;
  v7[3] = &unk_1E5C8D980;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(requestProcessingQueue, v7);
}

void __37__WBSParsecDSession_setCurrentQuery___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 40);
  uint64_t v3 = *(void *)(a1 + 32);
  if (v2)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __37__WBSParsecDSession_setCurrentQuery___block_invoke_2;
    v4[3] = &unk_1E5C9F9B8;
    v4[4] = v3;
    id v5 = *(id *)(a1 + 40);
    [v2 currentKeyboardIdentifierWithLayoutsForSession:v3 completionHandler:v4];
  }
  else
  {
    [*(id *)(a1 + 32) _setCurrentQuery:*(void *)(a1 + 40) withKeyboardInputType:0];
  }
}

uint64_t __37__WBSParsecDSession_setCurrentQuery___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _setCurrentQuery:*(void *)(a1 + 40) withKeyboardInputType:a2];
}

- (void)_setCurrentQuery:(id)a3 withKeyboardInputType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  requestProcessingQueue = self->_requestProcessingQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__WBSParsecDSession__setCurrentQuery_withKeyboardInputType___block_invoke;
  block[3] = &unk_1E5C8D840;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(requestProcessingQueue, block);
}

void __60__WBSParsecDSession__setCurrentQuery_withKeyboardInputType___block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 24);
  if (v3 != v2 && (objc_msgSend(v3, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), *(id *)(a1 + 40));
    id v4 = [*(id *)(*(void *)(a1 + 32) + 24) queryString];
    uint64_t v5 = [v4 length];

    if (v5)
    {
      id v6 = WBS_LOG_CHANNEL_PREFIXSafariSuggestions();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A6B5F000, v6, OS_LOG_TYPE_INFO, "Initiating ParsecD query", buf, 2u);
      }
      id v7 = (id)WBS_LOG_CHANNEL_PREFIXSafariSuggestions();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        id v8 = [*(id *)(*(void *)(a1 + 32) + 24) queryString];
        __60__WBSParsecDSession__setCurrentQuery_withKeyboardInputType___block_invoke_cold_1(v8, v35, v7);
      }

      id v9 = (void *)MEMORY[0x1E4F5CBB0];
      id v10 = [*(id *)(*(void *)(a1 + 32) + 24) queryString];
      dispatch_queue_t v11 = objc_msgSend(v9, "searchRequestWithString:triggerEvent:queryId:", v10, objc_msgSend(*(id *)(a1 + 40), "triggerEvent"), objc_msgSend(*(id *)(a1 + 40), "queryID"));

      if (v11)
      {
        id v12 = [*(id *)(a1 + 40) queryItems];
        if ([v12 count]) {
          [v11 setQueryItems:v12];
        }
        id v13 = +[WBSTrialManager shared];
        v14 = [v13 identifiers];

        v15 = [v14 experimentId];
        [v11 setExperimentId:v15];

        v16 = [v14 namespaceName];
        [v11 setExperimentNamespaceId:v16];

        objc_super v17 = [v14 treatmentId];
        [v11 setTreatmentId:v17];

        [v11 setScale:*(double *)(*(void *)(a1 + 32) + 56)];
        [v11 setKeyboardInputMode:*(void *)(a1 + 48)];
        v18 = [*(id *)(*(void *)(a1 + 32) + 24) querySuggestions];
        id v19 = [*(id *)(*(void *)(a1 + 32) + 24) queryString];
        *(void *)buf = MEMORY[0x1E4F143A8];
        uint64_t v31 = 3221225472;
        v32 = ___ZL37searchSuggestionsFromQuerySuggestionsP7NSArrayIP18WBSQuerySuggestionEP8NSString_block_invoke;
        v33 = &unk_1E5C9FAC8;
        id v34 = v19;
        v20 = objc_msgSend(v18, "safari_mapObjectsUsingBlock:", buf);

        [v11 setLocalContextualSuggestions:v20];
        uint64_t v21 = *(void *)(a1 + 32);
        v22 = *(void **)(v21 + 64);
        uint64_t v24 = MEMORY[0x1E4F143A8];
        uint64_t v25 = 3221225472;
        v26 = __60__WBSParsecDSession__setCurrentQuery_withKeyboardInputType___block_invoke_36;
        v27 = &unk_1E5C9F9E0;
        uint64_t v28 = v21;
        id v29 = *(id *)(a1 + 40);
        v23 = [v22 taskWithRequest:v11 completion:&v24];
        objc_msgSend(v23, "resume", v24, v25, v26, v27, v28);
        objc_msgSend(*(id *)(a1 + 32), "setCurrentQueryID:", objc_msgSend(v23, "queryId"));
      }
    }
  }
}

void __60__WBSParsecDSession__setCurrentQuery_withKeyboardInputType___block_invoke_36(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = *(void *)(a1 + 32);
  dispatch_queue_t v11 = *(NSObject **)(v10 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__WBSParsecDSession__setCurrentQuery_withKeyboardInputType___block_invoke_2;
  block[3] = &unk_1E5C9D460;
  void block[4] = v10;
  id v16 = *(id *)(a1 + 40);
  id v17 = v8;
  id v18 = v7;
  id v19 = v9;
  id v12 = v9;
  id v13 = v7;
  id v14 = v8;
  dispatch_async(v11, block);
}

uint64_t __60__WBSParsecDSession__setCurrentQuery_withKeyboardInputType___block_invoke_2(void *a1)
{
  id v2 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  if ([v2 BOOLForKey:@"EnablePegasusResponseFuzzing"])
  {
    int v3 = [MEMORY[0x1E4F97EA0] isInternalInstall];

    if (v3)
    {
      id v4 = (void *)a1[4];
      uint64_t v5 = a1[5];
      uint64_t v6 = a1[6];
      uint64_t v7 = a1[7];
      uint64_t v8 = a1[8];
      return [v4 _simulatePARResponseFromJSON:v5 response:v6 task:v7 error:v8];
    }
  }
  else
  {
  }
  uint64_t v11 = a1[7];
  uint64_t v10 = a1[8];
  uint64_t v13 = a1[5];
  uint64_t v12 = a1[6];
  id v14 = (void *)a1[4];
  return [v14 _didReceiveResponse:v12 error:v10 forTask:v11 query:v13];
}

- (void)_simulatePARResponseFromJSON:(id)a3 response:(id)a4 task:(id)a5 error:(id)a6
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = +[WBSPegasusResponseFuzzer sharedFuzzer];
  uint64_t v13 = [(WBSCompletionQuery *)self->_currentQuery queryString];
  id v14 = [v12 responseForQuery:v13];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v15 = [v14 results];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v30;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v30 != v17) {
          objc_enumerationMutation(v15);
        }
        objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * v18++), "setQueryId:", objc_msgSend(v9, "queryID"));
      }
      while (v16 != v18);
      uint64_t v16 = [v15 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v16);
  }

  requestProcessingQueue = self->_requestProcessingQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__WBSParsecDSession__simulatePARResponseFromJSON_response_task_error___block_invoke;
  block[3] = &unk_1E5C9D460;
  void block[4] = self;
  id v25 = v14;
  id v26 = v11;
  id v27 = v10;
  id v28 = v9;
  id v20 = v9;
  id v21 = v10;
  id v22 = v11;
  id v23 = v14;
  dispatch_async(requestProcessingQueue, block);
}

uint64_t __70__WBSParsecDSession__simulatePARResponseFromJSON_response_task_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didReceiveResponse:*(void *)(a1 + 40) error:*(void *)(a1 + 48) forTask:*(void *)(a1 + 56) query:*(void *)(a1 + 64)];
}

- (void)_didReceiveResponse:(id)a3 error:(id)a4 forTask:(id)a5 query:(id)a6
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v48 = a3;
  id v46 = a4;
  id v10 = a5;
  id v49 = a6;
  v47 = v10;
  uint64_t v11 = [v10 queryId];
  if (v11 == [(WBSParsecDSession *)self currentQueryID])
  {
    v45 = self;
    if (v46)
    {
      uint64_t v12 = (id)WBS_LOG_CHANNEL_PREFIXSafariSuggestions();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v43 = objc_msgSend(v46, "safari_privacyPreservingDescription");
        *(_DWORD *)buf = 134218498;
        id v64 = v47;
        __int16 v65 = 2048;
        id v66 = v48;
        __int16 v67 = 2114;
        v68 = v43;
        _os_log_error_impl(&dword_1A6B5F000, v12, OS_LOG_TYPE_ERROR, "Response to task %p was %p with error %{public}@", buf, 0x20u);
      }
    }
    else
    {
      id v14 = WBS_LOG_CHANNEL_PREFIXSafariSuggestions();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218240;
        id v64 = v10;
        __int16 v65 = 2048;
        id v66 = v48;
        _os_log_impl(&dword_1A6B5F000, v14, OS_LOG_TYPE_INFO, "Response to task %p was %p", buf, 0x16u);
      }
    }
    v15 = WBS_LOG_CHANNEL_PREFIXSafariSuggestions();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[WBSParsecDSession _didReceiveResponse:error:forTask:query:]();
    }
    uint64_t v16 = [v48 results];
    if ([MEMORY[0x1E4F97EA0] isSearchEvaluationLoggingEnabled])
    {
      uint64_t v17 = [MEMORY[0x1E4F28E78] string];
      long long v60 = 0u;
      long long v61 = 0u;
      long long v59 = 0u;
      long long v58 = 0u;
      v44 = v16;
      id v18 = v16;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v58 objects:v62 count:16];
      if (v19)
      {
        uint64_t v20 = *(void *)v59;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v59 != v20) {
              objc_enumerationMutation(v18);
            }
            id v22 = *(void **)(*((void *)&v58 + 1) + 8 * i);
            id v23 = [v22 uuidString];
            uint64_t v24 = [v22 url];
            id v25 = [v24 absoluteString];
            id v26 = objc_msgSend(v25, "safari_urlHashesOfComponents");
            [v17 appendFormat:@" %@ <%@>,", v23, v26];
          }
          uint64_t v19 = [v18 countByEnumeratingWithState:&v58 objects:v62 count:16];
        }
        while (v19);
      }

      id v27 = WBS_LOG_CHANNEL_PREFIXParsec();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
        -[WBSParsecDSession _didReceiveResponse:error:forTask:query:]();
      }

      uint64_t v16 = v44;
    }
    id v28 = [v48 corrections];
    long long v29 = [v28 firstObject];
    long long v30 = [v29 suggestion];
    long long v31 = v16;
    [v49 setRewrittenQueryStringFromParsec:v30];

    long long v32 = [v48 suggestions];
    v33 = objc_msgSend(v32, "safari_setByApplyingBlock:", &__block_literal_global_47_0);

    uint64_t v34 = [v49 querySuggestions];
    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __61__WBSParsecDSession__didReceiveResponse_error_forTask_query___block_invoke_2;
    v56[3] = &unk_1E5C9FA28;
    id v35 = v33;
    id v57 = v35;
    uint64_t v36 = objc_msgSend(v34, "safari_filterObjectsUsingBlock:", v56);
    [v49 setQuerySuggestions:v36];

    v37 = v45->_delegate;
    v38 = [v49 rewrittenQueryStringFromParsec];
    v39 = (void *)[v38 copy];

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__WBSParsecDSession__didReceiveResponse_error_forTask_query___block_invoke_3;
    block[3] = &unk_1E5C9FA50;
    void block[4] = v45;
    id v51 = v39;
    id v52 = v47;
    v53 = v37;
    id v54 = v31;
    id v55 = v49;
    id v40 = v31;
    v41 = v37;
    id v42 = v39;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    uint64_t v13 = WBS_LOG_CHANNEL_PREFIXSafariSuggestions();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      id v64 = v10;
      _os_log_impl(&dword_1A6B5F000, v13, OS_LOG_TYPE_INFO, "Ignoring response to stale task %p", buf, 0xCu);
    }
  }
}

id __61__WBSParsecDSession__didReceiveResponse_error_forTask_query___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 suggestion];
  return v2;
}

uint64_t __61__WBSParsecDSession__didReceiveResponse_error_forTask_query___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  int v3 = [a2 title];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

uint64_t __61__WBSParsecDSession__didReceiveResponse_error_forTask_query___block_invoke_3(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), *(id *)(a1 + 40));
  uint64_t v2 = [*(id *)(a1 + 32) currentQueryID];
  uint64_t result = [*(id *)(a1 + 48) queryId];
  if (v2 == result)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(a1 + 56);
    uint64_t v6 = *(void *)(a1 + 64);
    uint64_t v7 = *(void *)(a1 + 72);
    return [v5 session:v4 didReceiveResults:v6 forQuery:v7];
  }
  return result;
}

void __80__WBSParsecDSession__startUpdatingAutoFillDataInBackgroundIfPossibleForSession___block_invoke_3(void *a1, void *a2)
{
  id v3 = a2;
  if (xpc_activity_get_state((xpc_activity_t)v3) == 2)
  {
    if (xpc_activity_set_state((xpc_activity_t)v3, 4))
    {
      uint64_t v4 = WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A6B5F000, v4, OS_LOG_TYPE_DEFAULT, "Beginning remote data update", buf, 2u);
      }
      uint64_t v5 = dispatch_group_create();
      dispatch_group_enter(v5);
      uint64_t v6 = (void *)a1[6];
      uint64_t v7 = a1[4];
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __80__WBSParsecDSession__startUpdatingAutoFillDataInBackgroundIfPossibleForSession___block_invoke_51;
      v32[3] = &unk_1E5C8CA70;
      uint64_t v8 = v5;
      v33 = v8;
      [v6 _updateAutoFillTLDsIfNeededForSession:v7 completionHandler:v32];
      dispatch_group_enter(v8);
      id v9 = (void *)a1[6];
      uint64_t v10 = a1[4];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __80__WBSParsecDSession__startUpdatingAutoFillDataInBackgroundIfPossibleForSession___block_invoke_52;
      v30[3] = &unk_1E5C8CA70;
      uint64_t v11 = v8;
      long long v31 = v11;
      [v9 _updateAutoFillCorrectionSetsIfNeededForSession:v10 completionHandler:v30];
      *(void *)buf = 0;
      id v27 = buf;
      uint64_t v28 = 0x2020000000;
      char v29 = 0;
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __80__WBSParsecDSession__startUpdatingAutoFillDataInBackgroundIfPossibleForSession___block_invoke_53;
      v23[3] = &unk_1E5C8E190;
      id v25 = buf;
      id v24 = v3;
      uint64_t v12 = (void *)MEMORY[0x1AD0C4F80](v23);
      uint64_t v13 = a1[5];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __80__WBSParsecDSession__startUpdatingAutoFillDataInBackgroundIfPossibleForSession___block_invoke_54;
      block[3] = &unk_1E5C8D5F0;
      id v14 = v12;
      id v22 = v14;
      dispatch_group_notify(v11, v13, block);
      dispatch_time_t v15 = dispatch_time(0, 1800000000000);
      uint64_t v16 = a1[5];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __80__WBSParsecDSession__startUpdatingAutoFillDataInBackgroundIfPossibleForSession___block_invoke_2_55;
      v19[3] = &unk_1E5C8D5F0;
      id v20 = v14;
      id v17 = v14;
      dispatch_after(v15, v16, v19);

      _Block_object_dispose(buf, 8);
    }
    else
    {
      id v18 = WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        __80__WBSParsecDSession__startUpdatingAutoFillDataInBackgroundIfPossibleForSession___block_invoke_3_cold_1();
      }
    }
  }
}

void __80__WBSParsecDSession__startUpdatingAutoFillDataInBackgroundIfPossibleForSession___block_invoke_51(uint64_t a1)
{
  uint64_t v2 = WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_1A6B5F000, v2, OS_LOG_TYPE_DEFAULT, "Completed update of domain list", v3, 2u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __80__WBSParsecDSession__startUpdatingAutoFillDataInBackgroundIfPossibleForSession___block_invoke_52(uint64_t a1)
{
  uint64_t v2 = WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_1A6B5F000, v2, OS_LOG_TYPE_DEFAULT, "Completed update of correction sets", v3, 2u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __80__WBSParsecDSession__startUpdatingAutoFillDataInBackgroundIfPossibleForSession___block_invoke_53(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    if (!xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 5))
    {
      uint64_t v2 = WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
        __80__WBSParsecDSession__startUpdatingAutoFillDataInBackgroundIfPossibleForSession___block_invoke_53_cold_1();
      }
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

uint64_t __80__WBSParsecDSession__startUpdatingAutoFillDataInBackgroundIfPossibleForSession___block_invoke_54(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __80__WBSParsecDSession__startUpdatingAutoFillDataInBackgroundIfPossibleForSession___block_invoke_2_55(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)_updateAutoFillTLDsIfNeededForSession:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [a1 sharedDomainPolicyProvider];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __77__WBSParsecDSession__updateAutoFillTLDsIfNeededForSession_completionHandler___block_invoke;
  v12[3] = &unk_1E5C9AF90;
  id v9 = v6;
  id v13 = v9;
  id v10 = v7;
  id v14 = v8;
  id v15 = v10;
  id v11 = v8;
  [v11 getLastPolicyRetrievalURLStringWithResultHandler:v12];
}

void __77__WBSParsecDSession__updateAutoFillTLDsIfNeededForSession_completionHandler___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [a1[4] bag];
  uint64_t v5 = [v4 rawBag];
  id v6 = [v5 objectForKeyedSubscript:@"autofill_tld_whitelist_url"];

  if ([v3 isEqualToString:v6])
  {
LABEL_6:
    (*((void (**)(void))a1[6] + 2))();
    goto LABEL_7;
  }
  if (!v6)
  {
    uint64_t v8 = WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __77__WBSParsecDSession__updateAutoFillTLDsIfNeededForSession_completionHandler___block_invoke_cold_1();
    }
    goto LABEL_6;
  }
  id v7 = a1[4];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __77__WBSParsecDSession__updateAutoFillTLDsIfNeededForSession_completionHandler___block_invoke_58;
  v9[3] = &unk_1E5C9FAA0;
  id v12 = a1[6];
  id v10 = a1[5];
  id v11 = v6;
  [v7 fileHandleAndAttributesForResource:@"autofill_tld_whitelist_url" completion:v9];

LABEL_7:
}

void __77__WBSParsecDSession__updateAutoFillTLDsIfNeededForSession_completionHandler___block_invoke_58(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a4;
  id v11 = (void (**)(void))MEMORY[0x1AD0C4F80](*(void *)(a1 + 48));
  if (v7)
  {
    uint64_t v8 = (id)WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = objc_msgSend(v7, "safari_privacyPreservingDescription");
      __77__WBSParsecDSession__updateAutoFillTLDsIfNeededForSession_completionHandler___block_invoke_58_cold_2(v9, buf, v8);
    }
  }
  else
  {
    uint64_t v8 = [v6 readDataToEndOfFile];
    if (v8)
    {
      [*(id *)(a1 + 32) setPoliciesWithJSONData:v8 retrievalURLString:*(void *)(a1 + 40)];
    }
    else
    {
      id v10 = WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        __77__WBSParsecDSession__updateAutoFillTLDsIfNeededForSession_completionHandler___block_invoke_58_cold_1();
      }
    }
  }

  SafariShared::ScopeExitHandler::~ScopeExitHandler(&v11);
}

+ (void)_updateAutoFillCorrectionSetsIfNeededForSession:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    +[WBSParsecDSession _updateAutoFillCorrectionSetsIfNeededForSession:completionHandler:]();
  }
  id v9 = [a1 sharedCorrectionsProcessor];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __87__WBSParsecDSession__updateAutoFillCorrectionSetsIfNeededForSession_completionHandler___block_invoke;
  v13[3] = &unk_1E5C9AF90;
  id v10 = v6;
  id v14 = v10;
  id v11 = v7;
  id v15 = v9;
  id v16 = v11;
  id v12 = v9;
  [v12 getLastCorrectionsRetrievalURLStringWithResultHandler:v13];
}

void __87__WBSParsecDSession__updateAutoFillCorrectionSetsIfNeededForSession_completionHandler___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __87__WBSParsecDSession__updateAutoFillCorrectionSetsIfNeededForSession_completionHandler___block_invoke_cold_3();
  }
  uint64_t v5 = [a1[4] bag];
  id v6 = [v5 rawBag];
  id v7 = [v6 objectForKeyedSubscript:@"autofill_corrections_url"];

  if ([v3 isEqualToString:v7])
  {
    uint64_t v8 = WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __87__WBSParsecDSession__updateAutoFillCorrectionSetsIfNeededForSession_completionHandler___block_invoke_cold_1();
    }
    (*((void (**)(void))a1[6] + 2))();
  }
  else
  {
    id v9 = WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __87__WBSParsecDSession__updateAutoFillCorrectionSetsIfNeededForSession_completionHandler___block_invoke_cold_2();
    }
    id v10 = a1[4];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __87__WBSParsecDSession__updateAutoFillCorrectionSetsIfNeededForSession_completionHandler___block_invoke_60;
    v11[3] = &unk_1E5C9FAA0;
    id v14 = a1[6];
    id v12 = a1[5];
    id v13 = v7;
    [v10 fileHandleAndAttributesForResource:@"autofill_corrections_url" completion:v11];
  }
}

void __87__WBSParsecDSession__updateAutoFillCorrectionSetsIfNeededForSession_completionHandler___block_invoke_60(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a4;
  id v13 = (void (**)(void))MEMORY[0x1AD0C4F80](*(void *)(a1 + 48));
  if (v7)
  {
    uint64_t v8 = (id)WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = objc_msgSend(v7, "safari_privacyPreservingDescription");
      __87__WBSParsecDSession__updateAutoFillCorrectionSetsIfNeededForSession_completionHandler___block_invoke_60_cold_3(v9, buf, v8);
    }
  }
  else if ((unint64_t)[v6 seekToEndOfFile] < 0x1E8481)
  {
    [v6 seekToFileOffset:0];
    id v11 = [v6 readDataToEndOfFile];
    if (v11)
    {
      [*(id *)(a1 + 32) setCorrectionsWithJSONData:v11 retrievalURLString:*(void *)(a1 + 40)];
    }
    else
    {
      id v12 = WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        __87__WBSParsecDSession__updateAutoFillCorrectionSetsIfNeededForSession_completionHandler___block_invoke_60_cold_2();
      }
    }
  }
  else
  {
    id v10 = WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __87__WBSParsecDSession__updateAutoFillCorrectionSetsIfNeededForSession_completionHandler___block_invoke_60_cold_1();
    }
  }
  SafariShared::ScopeExitHandler::~ScopeExitHandler(&v13);
}

- (NSString)rewrittenQueryStringFromParsec
{
  return self->_rewrittenQueryStringFromParsec;
}

- (BOOL)skipAutoFillDataUpdates
{
  return self->_skipAutoFillDataUpdates;
}

- (PARSession)parsecdSession
{
  return self->_parsecdSession;
}

- (unint64_t)currentQueryID
{
  return self->_currentQueryID;
}

- (void)setCurrentQueryID:(unint64_t)a3
{
  self->_currentQueryID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parsecdSession, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_rewrittenQueryStringFromParsec, 0);
  objc_storeStrong((id *)&self->_currentQuery, 0);
  objc_storeStrong((id *)&self->_feedbackDispatcher, 0);
  objc_storeStrong((id *)&self->_requestProcessingQueue, 0);
}

void __60__WBSParsecDSession__setCurrentQuery_withKeyboardInputType___block_invoke_cold_1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138477827;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_1A6B5F000, log, OS_LOG_TYPE_DEBUG, "Initiating ParsecD query: %{private}@", buf, 0xCu);
}

- (void)_didReceiveResponse:error:forTask:query:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_5();
  _os_log_debug_impl(&dword_1A6B5F000, v0, OS_LOG_TYPE_DEBUG, "Parsec Results: [%{public}@]", v1, 0xCu);
}

- (void)_didReceiveResponse:error:forTask:query:.cold.2()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_5();
  __int16 v3 = 2113;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_1A6B5F000, v1, OS_LOG_TYPE_DEBUG, "Response to task %{private}@ was %{private}@", v2, 0x16u);
}

void __80__WBSParsecDSession__startUpdatingAutoFillDataInBackgroundIfPossibleForSession___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1A6B5F000, v0, v1, "Unable to transition update activity to state Continue; bailing",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void __80__WBSParsecDSession__startUpdatingAutoFillDataInBackgroundIfPossibleForSession___block_invoke_53_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1A6B5F000, v0, v1, "Unable to transition update activity to state Done", v2, v3, v4, v5, v6);
}

void __77__WBSParsecDSession__updateAutoFillTLDsIfNeededForSession_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1A6B5F000, v0, v1, "No new domain policy URL supplied; bailing", v2, v3, v4, v5, v6);
}

void __77__WBSParsecDSession__updateAutoFillTLDsIfNeededForSession_completionHandler___block_invoke_58_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1A6B5F000, v0, v1, "No domain policy data retrieved; bailing", v2, v3, v4, v5, v6);
}

void __77__WBSParsecDSession__updateAutoFillTLDsIfNeededForSession_completionHandler___block_invoke_58_cold_2(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1A6B5F000, log, OS_LOG_TYPE_ERROR, "Unable to read TLD whitelist: %{public}@", buf, 0xCu);
}

+ (void)_updateAutoFillCorrectionSetsIfNeededForSession:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_1A6B5F000, v0, v1, "Attempting to update cloud AutoFill corrections", v2, v3, v4, v5, v6);
}

void __87__WBSParsecDSession__updateAutoFillCorrectionSetsIfNeededForSession_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_1A6B5F000, v0, v1, "Not updating cloud AutoFill corrections since no update is needed", v2, v3, v4, v5, v6);
}

void __87__WBSParsecDSession__updateAutoFillCorrectionSetsIfNeededForSession_completionHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_1A6B5F000, v0, v1, "Fetching cloud AutoFill corrections resource", v2, v3, v4, v5, v6);
}

void __87__WBSParsecDSession__updateAutoFillCorrectionSetsIfNeededForSession_completionHandler___block_invoke_cold_3()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_5();
  _os_log_debug_impl(&dword_1A6B5F000, v0, OS_LOG_TYPE_DEBUG, "Last AutoFill corrections URL: %@", v1, 0xCu);
}

void __87__WBSParsecDSession__updateAutoFillCorrectionSetsIfNeededForSession_completionHandler___block_invoke_60_cold_1()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_5();
  __int16 v2 = 2048;
  uint64_t v3 = 2000000;
  _os_log_error_impl(&dword_1A6B5F000, v0, OS_LOG_TYPE_ERROR, "Cloud AutoFill correction sets exceeded maximum length (%llu > %llu)", v1, 0x16u);
}

void __87__WBSParsecDSession__updateAutoFillCorrectionSetsIfNeededForSession_completionHandler___block_invoke_60_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1A6B5F000, v0, v1, "No correction data retrieved; bailing", v2, v3, v4, v5, v6);
}

void __87__WBSParsecDSession__updateAutoFillCorrectionSetsIfNeededForSession_completionHandler___block_invoke_60_cold_3(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1A6B5F000, log, OS_LOG_TYPE_ERROR, "Unable to read cloud AutoFill correction sets, error: %{public}@", buf, 0xCu);
}

@end