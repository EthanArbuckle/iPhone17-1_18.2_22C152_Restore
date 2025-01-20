@interface PREResponsesExperiment
+ (BOOL)_isPreferredLocaleValid:(id)a3;
+ (BOOL)_isStringEmpty:(id)a3;
+ (BOOL)_shouldInsertSuggestion:(id)a3 forExistingSuggestions:(id)a4;
+ (id)_cannedRepliesForLanguage:(id)a3 inputPreferences:(id)a4;
+ (id)_getConversationHistoryFromRequest:(id)a3;
+ (id)_getFormattedPREResponseItems:(id)a3 inputPreferences:(id)a4;
+ (id)_inputMethodStringFrom:(int)a3;
+ (id)_rawStringsForMessages:(id)a3 excludingTapBacks:(BOOL)a4;
+ (id)_suggestionsWithDynamicResponseItems:(id)a3 cannedResponseItems:(id)a4 inputPreferences:(id)a5;
+ (id)sharedManager;
+ (id)stringArrayFromPreResponseItems:(id)a3;
+ (int)_preInputMethodFrom:(id)a3;
- (BOOL)includeCannedResponses;
- (BOOL)includeCustomResponses;
- (BOOL)includeResponsesToRobots;
- (BOOL)registerDisplayed;
- (BOOL)shouldUseDefaultRKTreatment;
- (BOOL)shouldUseDefaultRKTreatmentForLanguage:(id)a3;
- (BOOL)useResponseKitAsFallback;
- (PREResponsesExperiment)init;
- (PREResponsesExperiment)initWithExperimentResolver:(id)a3 metricsClient:(id)a4 xpcClient:(id)a5 rkClient:(id)a6 tiPreferencesController:(id)a7;
- (id)_responsesForMessage:(id)a3 maximumResponses:(unint64_t)a4 outgoingMessageHistory:(id)a5 forConversationHistory:(id)a6 forContext:(id)a7 time:(id)a8 withLanguage:(id)a9 languageLastChangedDate:(id)a10 recipientHandles:(id)a11 options:(unint64_t)a12 preferredLocale:(id)a13;
- (id)activeExperimentNameForLanguage:(id)a3;
- (id)cacheKeyForMessage:(id)a3 maxResponses:(unint64_t)a4 time:(id)a5 language:(id)a6;
- (id)cachedResponsesGeneratedEvent;
- (id)clippedMessageIfNecessary:(id)a3;
- (id)fullNonEditableSuggestionsListForMessage:(id)a3 context:(id)a4 additionalSenderMessages:(id)a5 date:(id)a6 keyboardLanguageID:(id)a7 keyboardLanguageLastChangedDate:(id)a8 recipients:(id)a9 includeDynamicSuggestions:(BOOL)a10;
- (id)handlesFromRecipients:(id)a3;
- (id)nonEditableSuggestionsForMessage:(id)a3 messageDate:(id)a4 senderID:(id)a5 recipientHandles:(id)a6 outgoingMessageHistory:(id)a7 keyboardLanguageID:(id)a8 keyboardLanguageLastChangedDate:(id)a9 includeDynamicSuggestions:(BOOL)a10;
- (id)nonEditableSuggestionsForMessage:(id)a3 messageDate:(id)a4 senderID:(id)a5 recipients:(id)a6 outgoingMessageHistory:(id)a7 keyboardLanguageID:(id)a8 keyboardLanguageLastChangedDate:(id)a9 includeDynamicSuggestions:(BOOL)a10;
- (id)responsesCache;
- (id)responsesForMessage:(id)a3 maximumResponses:(unint64_t)a4 forConversationHistory:(id)a5 forContext:(id)a6 time:(id)a7 withLanguage:(id)a8 recipientHandles:(id)a9 options:(unint64_t)a10;
- (id)responsesForMessage:(id)a3 maximumResponses:(unint64_t)a4 forConversationHistory:(id)a5 forContext:(id)a6 time:(id)a7 withLanguage:(id)a8 recipients:(id)a9 options:(unint64_t)a10;
- (id)suggestionsForRequest:(id)a3;
- (id)waitForPreResponseItemsForMessage:(id)a3 maximumResponses:(unint64_t)a4 forConversationHistory:(id)a5 forContext:(id)a6 time:(id)a7 withLanguage:(id)a8 recipientHandles:(id)a9 options:(unint64_t)a10;
- (unint64_t)mode;
- (void)_responsesForMessage:(id)a3 maximumResponses:(unint64_t)a4 outgoingMessageHistory:(id)a5 forConversationHistory:(id)a6 forContext:(id)a7 time:(id)a8 withLanguage:(id)a9 languageLastChangedDate:(id)a10 recipientHandles:(id)a11 options:(unint64_t)a12 preferredLocale:(id)a13 completionBlock:(id)a14;
- (void)fullNonEditableSuggestionsListForMessage:(id)a3 context:(id)a4 additionalSenderMessages:(id)a5 date:(id)a6 keyboardLanguageID:(id)a7 keyboardLanguageLastChangedDate:(id)a8 recipients:(id)a9 includeDynamicSuggestions:(BOOL)a10 completion:(id)a11;
- (void)nonEditableSuggestionsForMessage:(id)a3 messageDate:(id)a4 senderID:(id)a5 recipientHandles:(id)a6 outgoingMessageHistory:(id)a7 keyboardLanguageID:(id)a8 keyboardLanguageLastChangedDate:(id)a9 includeDynamicSuggestions:(BOOL)a10 completion:(id)a11;
- (void)nonEditableSuggestionsForMessage:(id)a3 messageDate:(id)a4 senderID:(id)a5 recipients:(id)a6 outgoingMessageHistory:(id)a7 keyboardLanguageID:(id)a8 keyboardLanguageLastChangedDate:(id)a9 includeDynamicSuggestions:(BOOL)a10 completion:(id)a11;
- (void)performWithResolvedModelAssetPathsUsingLanguage:(id)a3 block:(id)a4;
- (void)preResponseItemsForMessage:(id)a3 maximumResponses:(unint64_t)a4 forConversationHistory:(id)a5 forContext:(id)a6 time:(id)a7 withLanguage:(id)a8 recipientHandles:(id)a9 options:(unint64_t)a10 completionBlock:(id)a11;
- (void)predictionsForRequest:(id)a3 heads:(id)a4 completion:(id)a5;
- (void)predictionsForRequest:(id)a3 plistPath:(id)a4 espressoBinPath:(id)a5 vocabPath:(id)a6 heads:(id)a7 completion:(id)a8;
- (void)primeResponsesExperimentsIfNeeded;
- (void)registerGenerationWithPreResponseItems:(id)a3 language:(id)a4 isCached:(BOOL)a5 responseTimePerf:(unint64_t)a6 promptMessage:(id)a7 generationStatus:(int)a8;
- (void)registerResponse:(id)a3 forMessage:(id)a4 time:(id)a5 metadata:(id)a6 withLanguage:(id)a7;
- (void)registerResponseDisplayedAtIndex:(id)a3;
- (void)responsesForMessage:(id)a3 maximumResponses:(unint64_t)a4 forConversationHistory:(id)a5 forContext:(id)a6 time:(id)a7 withLanguage:(id)a8 recipientHandles:(id)a9 options:(unint64_t)a10 completionBlock:(id)a11;
- (void)responsesForMessage:(id)a3 maximumResponses:(unint64_t)a4 forConversationHistory:(id)a5 forContext:(id)a6 time:(id)a7 withLanguage:(id)a8 recipients:(id)a9 options:(unint64_t)a10 completionBlock:(id)a11;
- (void)setCachedResponsesGeneratedEvent:(id)a3;
- (void)setIncludeCannedResponses:(BOOL)a3;
- (void)setIncludeCustomResponses:(BOOL)a3;
- (void)setIncludeResponsesToRobots:(BOOL)a3;
- (void)setRegisterDisplayed:(BOOL)a3;
- (void)setUseResponseKitAsFallback:(BOOL)a3;
- (void)suggestionsForRequest:(id)a3 withCompletion:(id)a4;
@end

@implementation PREResponsesExperiment

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exemptTermsDetector, 0);
  objc_storeStrong((id *)&self->_guardedCachedResponsesGeneratedEvent, 0);
  objc_storeStrong((id *)&self->_responsesGeneratedCache, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_tiPreferencesController, 0);
  objc_storeStrong((id *)&self->_rkClient, 0);
  objc_storeStrong((id *)&self->_xpcClient, 0);
  objc_storeStrong((id *)&self->_metrics, 0);

  objc_storeStrong((id *)&self->_experimentResolver, 0);
}

- (void)setUseResponseKitAsFallback:(BOOL)a3
{
  self->_useResponseKitAsFallback = a3;
}

- (BOOL)useResponseKitAsFallback
{
  return self->_useResponseKitAsFallback;
}

- (BOOL)includeResponsesToRobots
{
  return self->_includeResponsesToRobots;
}

- (BOOL)includeCustomResponses
{
  return self->_includeCustomResponses;
}

- (void)setIncludeCannedResponses:(BOOL)a3
{
  self->_includeCannedResponses = a3;
}

- (BOOL)includeCannedResponses
{
  return self->_includeCannedResponses;
}

- (void)setRegisterDisplayed:(BOOL)a3
{
  self->_registerDisplayed = a3;
}

- (BOOL)registerDisplayed
{
  return self->_registerDisplayed;
}

- (BOOL)shouldUseDefaultRKTreatmentForLanguage:(id)a3
{
  id v4 = a3;
  v5 = pre_signpost_handle();
  int ptr = 7;
  os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, &ptr);

  v7 = pre_signpost_handle();
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA622000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "PRE-shouldUseDefaultRKTreatment", "Start", buf, 2u);
  }

  v9 = [(PREResponsesExperiment *)self activeExperimentNameForLanguage:v4];

  char v10 = [v9 isEqualToString:@"DEFAULT_RESPONSE_KIT"];
  v11 = pre_signpost_handle();
  v12 = v11;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)v14 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA622000, v12, OS_SIGNPOST_INTERVAL_END, v6, "PRE-shouldUseDefaultRKTreatment", "Completed", v14, 2u);
  }

  return v10;
}

- (BOOL)shouldUseDefaultRKTreatment
{
  return [(PREResponsesExperiment *)self shouldUseDefaultRKTreatmentForLanguage:@"en"];
}

- (id)handlesFromRecipients:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2050000000;
  v5 = (void *)getCKEntityClass_softClass_1902;
  uint64_t v23 = getCKEntityClass_softClass_1902;
  if (!getCKEntityClass_softClass_1902)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getCKEntityClass_block_invoke_1903;
    v26 = &unk_1E65B1F98;
    v27 = &v20;
    __getCKEntityClass_block_invoke_1903((uint64_t)buf);
    v5 = (void *)v21[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v20, 8);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v3;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v17;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v7);
        }
        v11 = *(void **)(*((void *)&v16 + 1) + 8 * v10);
        if (objc_opt_isKindOfClass())
        {
          v12 = [v11 rawAddress];

          if (!v12) {
            goto LABEL_14;
          }
          v13 = [v11 rawAddress];
          [v4 addObject:v13];
        }
        else
        {
          v13 = pre_responses_handle();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
          {
            uint64_t v14 = objc_opt_class();
            *(_DWORD *)buf = 138543619;
            *(void *)&buf[4] = v14;
            *(_WORD *)&uint8_t buf[12] = 2117;
            *(void *)&buf[14] = v11;
            _os_log_fault_impl(&dword_1CA622000, v13, OS_LOG_TYPE_FAULT, "PREResponsesExperiment unexpectedly received unknown object %{public}@ (%{sensitive}@) when expecting CKEntity", buf, 0x16u);
          }
        }

LABEL_14:
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v8);
  }

  return v4;
}

- (id)waitForPreResponseItemsForMessage:(id)a3 maximumResponses:(unint64_t)a4 forConversationHistory:(id)a5 forContext:(id)a6 time:(id)a7 withLanguage:(id)a8 recipientHandles:(id)a9 options:(unint64_t)a10
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__1910;
  v34 = __Block_byref_object_dispose__1911;
  id v35 = 0;
  dispatch_semaphore_t v21 = dispatch_semaphore_create(0);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __154__PREResponsesExperiment_waitForPreResponseItemsForMessage_maximumResponses_forConversationHistory_forContext_time_withLanguage_recipientHandles_options___block_invoke;
  v27[3] = &unk_1E65B1F48;
  v29 = &v30;
  uint64_t v22 = v21;
  uint64_t v28 = v22;
  uint64_t v23 = v15;
  [(PREResponsesExperiment *)self preResponseItemsForMessage:v15 maximumResponses:a4 forConversationHistory:v16 forContext:v17 time:v18 withLanguage:v19 recipientHandles:v20 options:a10 completionBlock:v27];
  [MEMORY[0x1E4F93B18] waitForSemaphore:v22 timeoutSeconds:1.0];
  id v24 = (id)v31[5];

  _Block_object_dispose(&v30, 8);

  return v24;
}

void __154__PREResponsesExperiment_waitForPreResponseItemsForMessage_maximumResponses_forConversationHistory_forContext_time_withLanguage_recipientHandles_options___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)registerGenerationWithPreResponseItems:(id)a3 language:(id)a4 isCached:(BOOL)a5 responseTimePerf:(unint64_t)a6 promptMessage:(id)a7 generationStatus:(int)a8
{
  uint64_t v8 = *(void *)&a8;
  BOOL v10 = a5;
  id v14 = a7;
  id v15 = a4;
  id v16 = a3;
  id v17 = pre_signpost_handle();
  int ptr = 7;
  os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v17, &ptr);

  id v19 = pre_signpost_handle();
  id v20 = v19;
  unint64_t v21 = v18 - 1;
  if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA622000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v18, "PRE-RegisterImpressionPreparation", "Start", buf, 2u);
  }
  os_signpost_id_t spid = v18;

  uint64_t v22 = objc_opt_new();
  [v22 setResponses:v16];
  uint64_t v23 = [v16 firstObject];

  id v24 = [v23 language];
  [v22 setLanguage:v24];

  [v22 setLocale:v15];
  [v22 setIsCached:v10];
  [v22 setResponseTimePerf:a6];
  objc_msgSend(v22, "setMessageCharCount:", objc_msgSend(v14, "length"));
  uint64_t v25 = [v14 containsString:@"?"];

  [v22 setHasQuestionMark:v25];
  [v22 setResponseGenerationTime:mach_absolute_time()];
  [v22 setGenerationStatus:v8];
  [(PREResponsesExperiment *)self setCachedResponsesGeneratedEvent:v22];
  v26 = self->_metrics;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __131__PREResponsesExperiment_registerGenerationWithPreResponseItems_language_isCached_responseTimePerf_promptMessage_generationStatus___block_invoke;
  block[3] = &unk_1E65B1F20;
  id v35 = v26;
  id v36 = v22;
  id v27 = v22;
  uint64_t v28 = v26;
  dispatch_block_t v29 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_BACKGROUND, 0, block);
  uint64_t v30 = dispatch_get_global_queue(9, 0);
  dispatch_async(v30, v29);
  v31 = pre_signpost_handle();
  uint64_t v32 = v31;
  if (v21 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA622000, v32, OS_SIGNPOST_INTERVAL_END, spid, "PRE-RegisterImpressionPreparation", "Completed", buf, 2u);
  }
}

void __131__PREResponsesExperiment_registerGenerationWithPreResponseItems_language_isCached_responseTimePerf_promptMessage_generationStatus___block_invoke(uint64_t a1)
{
  v2 = pre_responses_handle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA622000, v2, OS_LOG_TYPE_DEFAULT, "PREResponsesExperiment registering impression", buf, 2u);
  }

  id v3 = pre_signpost_handle();
  int ptr = 7;
  os_signpost_id_t v4 = os_signpost_id_make_with_pointer(v3, &ptr);

  v5 = pre_signpost_handle();
  id v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)BOOL v10 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA622000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "PRE-RegisterImpression", "Start", v10, 2u);
  }

  [*(id *)(a1 + 32) registerResponsesGenerated:*(void *)(a1 + 40)];
  id v7 = pre_signpost_handle();
  uint64_t v8 = v7;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA622000, v8, OS_SIGNPOST_INTERVAL_END, v4, "PRE-RegisterImpression", "Completed", v9, 2u);
  }
}

- (id)responsesCache
{
  return self->_responsesGeneratedCache;
}

- (void)primeResponsesExperimentsIfNeeded
{
  id v2 = [(PREResponsesExperiment *)self waitForPreResponseItemsForMessage:@"wake up, suggestd!" maximumResponses:0 forConversationHistory:0 forContext:0 time:0 withLanguage:0 recipientHandles:0 options:0];
  id v3 = [MEMORY[0x1E4F1CA20] currentLocale];
  os_signpost_id_t v4 = [v3 localeIdentifier];

  v5 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  id v6 = [v5 firstObject];

  if (v4)
  {
    id v7 = +[PREExperimentResolver sharedInstance];
    [v7 warmupForLocale:v4];
  }
  if (v6 && ([v4 isEqualToString:v6] & 1) == 0)
  {
    uint64_t v8 = +[PREExperimentResolver sharedInstance];
    [v8 warmupForLocale:v6];
  }
  uint64_t v9 = pre_responses_handle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA622000, v9, OS_LOG_TYPE_DEFAULT, "PREResponsesExperiment finished priming suggestd", buf, 2u);
  }
}

- (void)registerResponseDisplayedAtIndex:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    location[0] = 0;
    objc_initWeak(location, self);
    uint64_t v8 = MEMORY[0x1E4F143A8];
    uint64_t v9 = 3221225472;
    BOOL v10 = __59__PREResponsesExperiment_registerResponseDisplayedAtIndex___block_invoke;
    v11 = &unk_1E65B1EF8;
    objc_copyWeak(&v13, location);
    id v12 = v4;
    v5 = (void *)MEMORY[0x1CB799770](&v8);
    id v6 = dispatch_get_global_queue(9, 0);
    objc_msgSend(MEMORY[0x1E4F93B18], "runAsyncOnQueue:afterDelaySeconds:block:", v6, v5, 0.5, v8, v9, v10, v11);

    objc_destroyWeak(&v13);
    objc_destroyWeak(location);
  }
  else
  {
    id v7 = pre_responses_handle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_1CA622000, v7, OS_LOG_TYPE_DEFAULT, "PREResponsesExperiment registerResponseDisplayed received invalid params", (uint8_t *)location, 2u);
    }
  }
}

void __59__PREResponsesExperiment_registerResponseDisplayedAtIndex___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = pre_responses_handle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_1CA622000, v3, OS_LOG_TYPE_DEFAULT, "PREResponsesExperiment logging responsesViewedEvent", v4, 2u);
    }

    [WeakRetained[2] registerResponseViewed:*(void *)(a1 + 32)];
  }
}

- (void)registerResponse:(id)a3 forMessage:(id)a4 time:(id)a5 metadata:(id)a6 withLanguage:(id)a7
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v43 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = pre_signpost_handle();
  int ptr = 7;
  os_signpost_id_t spid = os_signpost_id_make_with_pointer(v16, &ptr);

  id v17 = pre_signpost_handle();
  os_signpost_id_t v18 = v17;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA622000, v18, OS_SIGNPOST_INTERVAL_BEGIN, spid, "PRE-RegisterEngagementPreparation", "Start", buf, 2u);
  }

  id v19 = [(PREResponsesExperiment *)self cachedResponsesGeneratedEvent];
  id v20 = [v19 language];
  unint64_t v21 = v20;
  if (v20)
  {
    id v47 = v20;
  }
  else
  {
    uint64_t v22 = +[PRELocaleDetection sharedInstance];
    id v47 = [v22 localeForMessage:v13 outgoingMessageHistory:0 defaultLocale:v15 defaultLocaleLastChangedDate:0 sender:0];
  }
  BOOL v44 = [(PREResponsesExperiment *)self shouldUseDefaultRKTreatmentForLanguage:v47];
  v48 = [(PREResponsesExperiment *)self clippedMessageIfNecessary:v12];
  if (v14)
  {
    uint64_t v23 = [v14 objectForKeyedSubscript:*MEMORY[0x1E4F962E0]];
    id v24 = v23;
    if (v23) {
      id v25 = v23;
    }
    v26 = [v14 objectForKeyedSubscript:*MEMORY[0x1E4F962E8]];
    if (v26) {
      uint64_t v27 = [(id)objc_opt_class() _preInputMethodFrom:v26];
    }
    else {
      uint64_t v27 = 0;
    }
  }
  else
  {
    id v24 = 0;
    uint64_t v27 = 0;
  }
  uint64_t v28 = pre_responses_handle();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    dispatch_block_t v29 = [(id)objc_opt_class() _inputMethodStringFrom:v27];
    *(_DWORD *)buf = 138412802;
    *(void *)&buf[4] = v24;
    *(_WORD *)&uint8_t buf[12] = 2112;
    *(void *)&buf[14] = v15;
    *(_WORD *)&buf[22] = 2112;
    v69 = v29;
    _os_log_impl(&dword_1CA622000, v28, OS_LOG_TYPE_DEFAULT, "PREResponsesExperiment user engaged prediction at position %@ with language %@ and method %@", buf, 0x20u);
  }
  uint64_t v30 = [(PREResponsesExperiment *)self cachedResponsesGeneratedEvent];
  v31 = objc_opt_new();
  [v31 setResponsesGeneratedEvent:v30];
  [v31 setInputMethod:v27];
  [v31 setSelectedResponse:v48];
  [v31 setSelectedPosition:v24];
  if (v30)
  {
    uint64_t v32 = mach_absolute_time();
    objc_msgSend(v31, "setTimeToTap:", PREMachTimeToMilliseconds(v32 - objc_msgSend(v30, "responseGenerationTime")));
  }
  objc_msgSend(v31, "setHasQuestionMark:", objc_msgSend(v13, "containsString:", @"?"));
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  v69 = __Block_byref_object_copy__1910;
  v70 = __Block_byref_object_dispose__1911;
  id v71 = 0;
  v65[0] = 0;
  v65[1] = v65;
  v65[2] = 0x3032000000;
  v65[3] = __Block_byref_object_copy__1910;
  v65[4] = __Block_byref_object_dispose__1911;
  id v66 = 0;
  v64[0] = MEMORY[0x1E4F143A8];
  v64[1] = 3221225472;
  v64[2] = __81__PREResponsesExperiment_registerResponse_forMessage_time_metadata_withLanguage___block_invoke;
  v64[3] = &unk_1E65B1EA8;
  v64[4] = buf;
  v64[5] = v65;
  [(PREResponsesExperiment *)self performWithResolvedModelAssetPathsUsingLanguage:v15 block:v64];
  id location = 0;
  objc_initWeak(&location, self);
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __81__PREResponsesExperiment_registerResponse_forMessage_time_metadata_withLanguage___block_invoke_2;
  v50[3] = &unk_1E65B1ED0;
  objc_copyWeak(&v60, &location);
  BOOL v62 = v44;
  v50[4] = self;
  id v42 = v12;
  id v51 = v42;
  id v45 = v13;
  id v52 = v45;
  id v33 = v14;
  id v53 = v33;
  id v34 = v15;
  id v54 = v34;
  id v35 = v31;
  id v55 = v35;
  id v36 = v48;
  id v56 = v36;
  id v37 = v24;
  int v61 = v27;
  id v57 = v37;
  v58 = buf;
  v59 = v65;
  v38 = (void *)MEMORY[0x1CB799770](v50);
  v39 = dispatch_get_global_queue(9, 0);
  [MEMORY[0x1E4F93B18] runAsyncOnQueue:v39 afterDelaySeconds:v38 block:0.5];
  v40 = pre_signpost_handle();
  v41 = v40;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
  {
    *(_WORD *)v49 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA622000, v41, OS_SIGNPOST_INTERVAL_END, spid, "PRE-RegisterEngagementPreparation", "Completed", v49, 2u);
  }

  objc_destroyWeak(&v60);
  objc_destroyWeak(&location);
  _Block_object_dispose(v65, 8);

  _Block_object_dispose(buf, 8);
}

void __81__PREResponsesExperiment_registerResponse_forMessage_time_metadata_withLanguage___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  BOOL v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v7;
  id v13 = v7;

  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v8;
}

void __81__PREResponsesExperiment_registerResponse_forMessage_time_metadata_withLanguage___block_invoke_2(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 112));
  if (WeakRetained)
  {
    id v3 = pre_responses_handle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA622000, v3, OS_LOG_TYPE_DEFAULT, "PREResponsesExperiment registerResponse api called", buf, 2u);
    }

    id v4 = pre_signpost_handle();
    int ptr = 7;
    os_signpost_id_t v5 = os_signpost_id_make_with_pointer(v4, &ptr);

    id v6 = pre_signpost_handle();
    id v7 = v6;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA622000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PRE-RegisterEngagement", "Start", v11, 2u);
    }

    if (*(unsigned char *)(a1 + 124)) {
      [*(id *)(*(void *)(a1 + 32) + 32) registerResponse:*(void *)(a1 + 40) forMessage:*(void *)(a1 + 48) metadata:*(void *)(a1 + 56) withLanguage:*(void *)(a1 + 64)];
    }
    [WeakRetained[2] registerResponseTapped:*(void *)(a1 + 72)];
    [WeakRetained[3] registerResponse:*(void *)(a1 + 80) position:*(void *)(a1 + 88) isCanned:*(_DWORD *)(a1 + 120) == 1 isUsingQuickResponses:*(unsigned char *)(a1 + 124) == 0 locale:*(void *)(a1 + 64) modelConfigPath:*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) vocabPath:*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40)];
    id v8 = pre_signpost_handle();
    uint64_t v9 = v8;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      *(_WORD *)BOOL v10 = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA622000, v9, OS_SIGNPOST_INTERVAL_END, v5, "PRE-RegisterEngagement", "Completed", v10, 2u);
    }
  }
}

- (void)preResponseItemsForMessage:(id)a3 maximumResponses:(unint64_t)a4 forConversationHistory:(id)a5 forContext:(id)a6 time:(id)a7 withLanguage:(id)a8 recipientHandles:(id)a9 options:(unint64_t)a10 completionBlock:(id)a11
{
  uint64_t v106 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v49 = a5;
  id v50 = a6;
  id v55 = a7;
  id v57 = a8;
  id v51 = a9;
  id v54 = (void (**)(id, void *))a11;
  id v17 = pre_signpost_handle();
  int ptr = 7;
  os_signpost_id_t spid = (char *)os_signpost_id_make_with_pointer(v17, &ptr);

  os_signpost_id_t v18 = pre_signpost_handle();
  id v19 = v18;
  if ((unint64_t)(spid - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA622000, v19, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)spid, "PRE-AsyncTotalResponsesForMessage", "Start", buf, 2u);
  }

  *(void *)buf = 0;
  v94 = buf;
  uint64_t v95 = 0x3810000000;
  uint64_t v98 = 0;
  uint64_t v99 = 0;
  v96 = &unk_1CA6485C9;
  v97 = @"preResponseItemsForMessage";
  uint64_t v98 = mach_absolute_time();
  uint64_t v99 = 0;
  id v20 = pre_responses_handle();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v101) = 0;
    _os_log_impl(&dword_1CA622000, v20, OS_LOG_TYPE_DEFAULT, "PREResponsesExperiment async api called", (uint8_t *)&v101, 2u);
  }

  id v56 = [(PREResponsesExperiment *)self clippedMessageIfNecessary:v16];

  unint64_t v21 = pre_signpost_handle();
  int v92 = 7;
  os_signpost_id_t v22 = os_signpost_id_make_with_pointer(v21, &v92);

  uint64_t v23 = pre_signpost_handle();
  id v24 = v23;
  if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    LOWORD(v101) = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA622000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v22, "PRE-ReadSharedCache", "Start", (uint8_t *)&v101, 2u);
  }

  uint64_t v25 = [(PREResponsesExperiment *)self cacheKeyForMessage:v56 maxResponses:a4 time:v55 language:v57];
  v26 = [(_PASLRUCache *)self->_responsesGeneratedCache objectForKey:v25];
  v48 = (void *)v25;
  uint64_t v27 = pre_signpost_handle();
  uint64_t v28 = v27;
  if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
  {
    LOWORD(v101) = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA622000, v28, OS_SIGNPOST_INTERVAL_END, v22, "PRE-ReadSharedCache", "Completed", (uint8_t *)&v101, 2u);
  }

  if (v26)
  {
    dispatch_block_t v29 = pre_responses_handle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v30 = [v26 count];
      LODWORD(v101) = 134217984;
      *(void *)((char *)&v101 + 4) = v30;
      _os_log_impl(&dword_1CA622000, v29, OS_LOG_TYPE_DEFAULT, "PREResponsesExperiment preResponseItemsForMessage api loaded %tu responses from cache", (uint8_t *)&v101, 0xCu);
    }

    unint64_t v31 = PRERecordMeasurementState((uint64_t *)v94 + 4);
    uint64_t v32 = pre_signpost_handle();
    id v33 = v32;
    if ((unint64_t)(spid - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
    {
      LOWORD(v101) = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA622000, v33, OS_SIGNPOST_INTERVAL_END, (os_signpost_id_t)spid, "PRE-AsyncTotalResponsesForMessage", "Completed", (uint8_t *)&v101, 2u);
    }

    v54[2](v54, v26);
    [(PREResponsesExperiment *)self registerGenerationWithPreResponseItems:v26 language:v57 isCached:1 responseTimePerf:v31 promptMessage:v56 generationStatus:2];
  }
  else
  {
    id location = 0;
    objc_initWeak(&location, self);
    uint64_t v87 = 0;
    v88 = &v87;
    uint64_t v89 = 0x2020000000;
    os_signpost_id_t v90 = 0;
    id v34 = pre_signpost_handle();
    int v86 = 7;
    os_signpost_id_t v35 = os_signpost_id_make_with_pointer(v34, &v86);

    os_signpost_id_t v90 = v35;
    id v36 = pre_signpost_handle();
    id v37 = v36;
    os_signpost_id_t v38 = v88[3];
    if (v38 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
    {
      LOWORD(v101) = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA622000, v37, OS_SIGNPOST_INTERVAL_BEGIN, v38, "PRE-AsyncSuggestdResponsesForMessage", "Start", (uint8_t *)&v101, 2u);
    }

    *(void *)&long long v101 = 0;
    *((void *)&v101 + 1) = &v101;
    uint64_t v102 = 0x3032000000;
    v103 = __Block_byref_object_copy__1910;
    v104 = __Block_byref_object_dispose__1911;
    id v105 = 0;
    uint64_t v80 = 0;
    v81 = &v80;
    uint64_t v82 = 0x3032000000;
    v83 = __Block_byref_object_copy__1910;
    v84 = __Block_byref_object_dispose__1911;
    id v85 = 0;
    uint64_t v74 = 0;
    v75 = &v74;
    uint64_t v76 = 0x3032000000;
    v77 = __Block_byref_object_copy__1910;
    v78 = __Block_byref_object_dispose__1911;
    id v79 = 0;
    uint64_t v68 = 0;
    v69 = &v68;
    uint64_t v70 = 0x3032000000;
    id v71 = __Block_byref_object_copy__1910;
    uint64_t v72 = __Block_byref_object_dispose__1911;
    id v73 = 0;
    v67[0] = MEMORY[0x1E4F143A8];
    v67[1] = 3221225472;
    v67[2] = __163__PREResponsesExperiment_preResponseItemsForMessage_maximumResponses_forConversationHistory_forContext_time_withLanguage_recipientHandles_options_completionBlock___block_invoke;
    v67[3] = &unk_1E65B1E08;
    v67[4] = &v101;
    v67[5] = &v80;
    v67[6] = &v74;
    v67[7] = &v68;
    [(PREResponsesExperiment *)self performWithResolvedModelAssetPathsUsingLanguage:v57 block:v67];
    uint64_t v46 = *(void *)(*((void *)&v101 + 1) + 40);
    xpcClient = self->_xpcClient;
    uint64_t v44 = v75[5];
    uint64_t v45 = v81[5];
    uint64_t v43 = v69[5];
    BOOL v39 = [(PREResponsesExperiment *)self registerDisplayed];
    BOOL v40 = [(PREResponsesExperiment *)self includeCustomResponses];
    BOOL v41 = [(PREResponsesExperiment *)self includeResponsesToRobots];
    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = __163__PREResponsesExperiment_preResponseItemsForMessage_maximumResponses_forConversationHistory_forContext_time_withLanguage_recipientHandles_options_completionBlock___block_invoke_2;
    v58[3] = &unk_1E65B1E80;
    v58[4] = self;
    v64 = &v87;
    id v59 = v56;
    v66[1] = (id)a4;
    id v60 = v50;
    id v61 = v57;
    v66[2] = (id)a10;
    objc_copyWeak(v66, &location);
    v65 = buf;
    v66[3] = spid;
    v63 = v54;
    id v62 = v48;
    BYTE2(v42) = v41;
    BYTE1(v42) = v40;
    LOBYTE(v42) = v39;
    -[PREResponsesProtocol preResponseItemsForMessage:maximumResponses:conversationTurns:context:time:language:recipientHandles:modelFilePath:modelConfigPath:espressoBinFilePath:vocabFilePath:registerDisplayed:includeCustomResponses:includeResponsesToRobots:completion:](xpcClient, "preResponseItemsForMessage:maximumResponses:conversationTurns:context:time:language:recipientHandles:modelFilePath:modelConfigPath:espressoBinFilePath:vocabFilePath:registerDisplayed:includeCustomResponses:includeResponsesToRobots:completion:", v59, a4, v49, v60, v55, v61, v51, v46, v45, v44, v43, v42, v58);

    objc_destroyWeak(v66);
    _Block_object_dispose(&v68, 8);

    _Block_object_dispose(&v74, 8);
    _Block_object_dispose(&v80, 8);

    _Block_object_dispose(&v101, 8);
    _Block_object_dispose(&v87, 8);
    objc_destroyWeak(&location);
  }

  _Block_object_dispose(buf, 8);
}

void __163__PREResponsesExperiment_preResponseItemsForMessage_maximumResponses_forConversationHistory_forContext_time_withLanguage_recipientHandles_options_completionBlock___block_invoke(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = *(void *)(a1[4] + 8);
  id v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v9;
  id v23 = v9;

  uint64_t v15 = *(void *)(a1[5] + 8);
  id v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v10;
  id v17 = v10;

  uint64_t v18 = *(void *)(a1[6] + 8);
  id v19 = *(void **)(v18 + 40);
  *(void *)(v18 + 40) = v11;
  id v20 = v11;

  uint64_t v21 = *(void *)(a1[7] + 8);
  os_signpost_id_t v22 = *(void **)(v21 + 40);
  *(void *)(v21 + 40) = v12;
}

void __163__PREResponsesExperiment_preResponseItemsForMessage_maximumResponses_forConversationHistory_forContext_time_withLanguage_recipientHandles_options_completionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v36 = v6;
  if ([*(id *)(a1 + 32) useResponseKitAsFallback] && (!v5 || v6))
  {
    id v17 = pre_responses_handle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = [v6 debugDescription];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v18;
      _os_log_impl(&dword_1CA622000, v17, OS_LOG_TYPE_DEFAULT, "PREResponsesExperiment preResponseItemsForMessage api got error or no response when calling XPC, falling back to RK: %@", (uint8_t *)&buf, 0xCu);
    }
    id v19 = pre_signpost_handle();
    id v20 = v19;
    os_signpost_id_t v21 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA622000, v20, OS_SIGNPOST_INTERVAL_END, v21, "PRE-AsyncSuggestdResponsesForMessage", "Completed", (uint8_t *)&buf, 2u);
    }

    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v48 = 0x2020000000;
    os_signpost_id_t v49 = 0;
    os_signpost_id_t v22 = pre_signpost_handle();
    int ptr = 7;
    os_signpost_id_t v23 = os_signpost_id_make_with_pointer(v22, &ptr);

    os_signpost_id_t v49 = v23;
    id v24 = pre_signpost_handle();
    uint64_t v25 = v24;
    os_signpost_id_t v26 = *(void *)(*((void *)&buf + 1) + 24);
    if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      *(_WORD *)uint64_t v45 = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA622000, v25, OS_SIGNPOST_INTERVAL_BEGIN, v26, "PRE-AsyncRKFallbackResponsesForMessage", "Start", v45, 2u);
    }

    uint64_t v35 = *(void *)(a1 + 40);
    uint64_t v27 = *(void **)(*(void *)(a1 + 32) + 32);
    uint64_t v28 = *(void *)(a1 + 48);
    uint64_t v29 = *(void *)(a1 + 56);
    uint64_t v31 = *(void *)(a1 + 104);
    uint64_t v30 = *(void *)(a1 + 112);
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __163__PREResponsesExperiment_preResponseItemsForMessage_maximumResponses_forConversationHistory_forContext_time_withLanguage_recipientHandles_options_completionBlock___block_invoke_207;
    v37[3] = &unk_1E65B1E58;
    objc_copyWeak(v44, (id *)(a1 + 96));
    id v32 = *(id *)(a1 + 56);
    uint64_t v33 = *(void *)(a1 + 88);
    id v38 = v32;
    id v34 = *(void **)(a1 + 120);
    uint64_t v42 = v33;
    p_long long buf = &buf;
    v44[1] = v34;
    id v41 = *(id *)(a1 + 72);
    id v39 = v36;
    id v40 = *(id *)(a1 + 40);
    [v27 responsesForMessage:v35 maximumResponses:v31 forContext:v28 withLanguage:v29 options:v30 completionBlock:v37];

    objc_destroyWeak(v44);
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 96));
    id v8 = pre_responses_handle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = [v5 count];
      _os_log_impl(&dword_1CA622000, v8, OS_LOG_TYPE_DEFAULT, "PREResponsesExperiment preResponseItemsForMessage api returning %tu responses from suggestd", (uint8_t *)&buf, 0xCu);
    }

    unint64_t v9 = PRERecordMeasurementState((uint64_t *)(*(void *)(*(void *)(a1 + 88) + 8) + 32));
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
    id v10 = pre_signpost_handle();
    id v11 = v10;
    os_signpost_id_t v12 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA622000, v11, OS_SIGNPOST_INTERVAL_END, v12, "PRE-AsyncSuggestdResponsesForMessage", "Completed", (uint8_t *)&buf, 2u);
    }

    uint64_t v13 = pre_signpost_handle();
    id v14 = v13;
    os_signpost_id_t v15 = *(void *)(a1 + 120);
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA622000, v14, OS_SIGNPOST_INTERVAL_END, v15, "PRE-AsyncTotalResponsesForMessage", "Completed", (uint8_t *)&buf, 2u);
    }

    if ([v5 count]) {
      uint64_t v16 = 1;
    }
    else {
      uint64_t v16 = 5;
    }
    [WeakRetained registerGenerationWithPreResponseItems:v5 language:*(void *)(a1 + 56) isCached:0 responseTimePerf:v9 promptMessage:*(void *)(a1 + 40) generationStatus:v16];
    [WeakRetained[7] setObject:v5 forKey:*(void *)(a1 + 64)];
  }
}

void __163__PREResponsesExperiment_preResponseItemsForMessage_maximumResponses_forConversationHistory_forContext_time_withLanguage_recipientHandles_options_completionBlock___block_invoke_207(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  id v5 = pre_responses_handle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 134217984;
    uint64_t v16 = [v3 count];
    _os_log_impl(&dword_1CA622000, v5, OS_LOG_TYPE_DEFAULT, "PREResponsesExperiment preResponseItemsForMessage api returning %tu responses from ResponseKit fallback", (uint8_t *)&v15, 0xCu);
  }

  id v6 = +[PREResponseItem responseItemArrayFromResponseKitArray:v3 forLocale:*(void *)(a1 + 32)];
  unint64_t v7 = PRERecordMeasurementState((uint64_t *)(*(void *)(*(void *)(a1 + 64) + 8) + 32));
  id v8 = pre_signpost_handle();
  unint64_t v9 = v8;
  os_signpost_id_t v10 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v15) = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA622000, v9, OS_SIGNPOST_INTERVAL_END, v10, "PRE-AsyncRKFallbackResponsesForMessage", "Completed", (uint8_t *)&v15, 2u);
  }

  id v11 = pre_signpost_handle();
  os_signpost_id_t v12 = v11;
  os_signpost_id_t v13 = *(void *)(a1 + 88);
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    LOWORD(v15) = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA622000, v12, OS_SIGNPOST_INTERVAL_END, v13, "PRE-AsyncTotalResponsesForMessage", "Completed", (uint8_t *)&v15, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  if (*(void *)(a1 + 40)) {
    uint64_t v14 = 4;
  }
  else {
    uint64_t v14 = 3;
  }
  [WeakRetained registerGenerationWithPreResponseItems:v6 language:*(void *)(a1 + 32) isCached:0 responseTimePerf:v7 promptMessage:*(void *)(a1 + 48) generationStatus:v14];
}

- (void)predictionsForRequest:(id)a3 plistPath:(id)a4 espressoBinPath:(id)a5 vocabPath:(id)a6 heads:(id)a7 completion:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = +[PREResponsesExperiment _getConversationHistoryFromRequest:a3];
  id v20 = [v19 lastObject];
  os_signpost_id_t v21 = [v20 text];

  xpcClient = self->_xpcClient;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __101__PREResponsesExperiment_predictionsForRequest_plistPath_espressoBinPath_vocabPath_heads_completion___block_invoke;
  v24[3] = &unk_1E65B1E30;
  id v25 = v14;
  id v23 = v14;
  [(PREResponsesProtocol *)xpcClient predictForMessage:v21 conversationTurns:v19 language:@"en" plistPath:v18 espressoBinPath:v17 vocabPath:v16 heads:v15 completion:v24];
}

uint64_t __101__PREResponsesExperiment_predictionsForRequest_plistPath_espressoBinPath_vocabPath_heads_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)predictionsForRequest:(id)a3 heads:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x3032000000;
  v40[3] = __Block_byref_object_copy__1910;
  v40[4] = __Block_byref_object_dispose__1911;
  id v41 = 0;
  uint64_t v34 = 0;
  uint64_t v35 = &v34;
  uint64_t v36 = 0x3032000000;
  id v37 = __Block_byref_object_copy__1910;
  id v38 = __Block_byref_object_dispose__1911;
  id v39 = 0;
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x3032000000;
  uint64_t v31 = __Block_byref_object_copy__1910;
  id v32 = __Block_byref_object_dispose__1911;
  id v33 = 0;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = __Block_byref_object_copy__1910;
  os_signpost_id_t v26 = __Block_byref_object_dispose__1911;
  id v27 = 0;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __65__PREResponsesExperiment_predictionsForRequest_heads_completion___block_invoke;
  v21[3] = &unk_1E65B1E08;
  v21[4] = v40;
  v21[5] = &v34;
  v21[6] = &v28;
  v21[7] = &v22;
  [(PREResponsesExperiment *)self performWithResolvedModelAssetPathsUsingLanguage:@"en" block:v21];
  id v11 = +[PREResponsesExperiment _getConversationHistoryFromRequest:v8];
  os_signpost_id_t v12 = [v11 lastObject];
  os_signpost_id_t v13 = [v12 text];

  xpcClient = self->_xpcClient;
  uint64_t v15 = v35[5];
  uint64_t v16 = v29[5];
  uint64_t v17 = v23[5];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __65__PREResponsesExperiment_predictionsForRequest_heads_completion___block_invoke_2;
  v19[3] = &unk_1E65B1E30;
  id v18 = v10;
  id v20 = v18;
  [(PREResponsesProtocol *)xpcClient predictForMessage:v13 conversationTurns:v11 language:@"en" plistPath:v15 espressoBinPath:v16 vocabPath:v17 heads:v9 completion:v19];

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(v40, 8);
}

void __65__PREResponsesExperiment_predictionsForRequest_heads_completion___block_invoke(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = *(void *)(a1[4] + 8);
  id v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v9;
  id v23 = v9;

  uint64_t v15 = *(void *)(a1[5] + 8);
  uint64_t v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v10;
  id v17 = v10;

  uint64_t v18 = *(void *)(a1[6] + 8);
  id v19 = *(void **)(v18 + 40);
  *(void *)(v18 + 40) = v11;
  id v20 = v11;

  uint64_t v21 = *(void *)(a1[7] + 8);
  uint64_t v22 = *(void **)(v21 + 40);
  *(void *)(v21 + 40) = v12;
}

uint64_t __65__PREResponsesExperiment_predictionsForRequest_heads_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)performWithResolvedModelAssetPathsUsingLanguage:(id)a3 block:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v27 = a3;
  id v6 = (void (**)(id, id, id, id, id))a4;
  if ([(PREResponsesExperiment *)self mode] == 2)
  {
    unint64_t v7 = [(NSUserDefaults *)self->_defaults stringForKey:@"experimentModelUserDirectory"];
    id v8 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v9 = v8;
    if (v7)
    {
      if ([v8 isReadableFileAtPath:v7])
      {
        id v10 = [v7 stringByAppendingPathComponent:@"model.chunk"];
        id v25 = v10;
        if ([v9 isReadableFileAtPath:v10]) {
          id v11 = v10;
        }
        else {
          id v11 = 0;
        }
        id v20 = [v7 stringByAppendingPathComponent:@"config.plist"];
        uint64_t v24 = v20;
        if ([v9 isReadableFileAtPath:v20]) {
          id v12 = v20;
        }
        else {
          id v12 = 0;
        }
        uint64_t v21 = [v7 stringByAppendingPathComponent:@"espresso.bin"];
        if ([v9 isReadableFileAtPath:v21]) {
          id v13 = v21;
        }
        else {
          id v13 = 0;
        }
        uint64_t v22 = [v7 stringByAppendingPathComponent:@"vocab.trie"];
        if ([v9 isReadableFileAtPath:v22]) {
          id v14 = v22;
        }
        else {
          id v14 = 0;
        }

        goto LABEL_28;
      }
      id v19 = pre_responses_handle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_fault_impl(&dword_1CA622000, v19, OS_LOG_TYPE_FAULT, "PREResponsesExperiment performWithResolvedModelAssetPaths could not read user-specified model directory. Is this in a location thie process can read from? Falling back on bundled assets.", buf, 2u);
      }
    }
    else
    {
      uint64_t v18 = pre_responses_handle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_fault_impl(&dword_1CA622000, v18, OS_LOG_TYPE_FAULT, "PREResponsesExperiment performWithResolvedModelAssetPaths could not resolve user-specified model directory. Has this been specified correctly in user defaults? Falling back on bundled assets.", buf, 2u);
      }

      unint64_t v7 = 0;
    }
    id v12 = 0;
    id v13 = 0;
    id v14 = 0;
    id v11 = 0;
LABEL_28:

    goto LABEL_29;
  }
  if ([(PREResponsesExperiment *)self mode] != 1)
  {
    unint64_t v7 = [(PREExperimentResolverProtocol *)self->_experimentResolver getResponseSuggestionsExperimentConfig:v27 shouldDownloadAssets:1];
    id v11 = [v7 inferenceModelFilePath];
    id v12 = [v7 inferenceModelConfigPath];
    id v13 = [v7 espressoBinFilePath];
    id v14 = [v7 vocabFilePath];
    id v9 = pre_responses_handle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      os_signpost_id_t v26 = [v7 experimentIdentifiers];
      uint64_t v15 = [v26 experimentId];
      id v23 = [v7 experimentIdentifiers];
      uint64_t v16 = [v23 treatmentId];
      id v17 = [(PREResponsesExperiment *)self activeExperimentNameForLanguage:v27];
      *(_DWORD *)long long buf = 138412802;
      uint64_t v29 = v15;
      __int16 v30 = 2112;
      uint64_t v31 = v16;
      __int16 v32 = 2112;
      id v33 = v17;
      _os_log_impl(&dword_1CA622000, v9, OS_LOG_TYPE_DEFAULT, "PREResponsesExperiment performWithResolvedModelAssets api is fetching experimental responses with experiment %@, treatment %@, model %@", buf, 0x20u);
    }
    goto LABEL_28;
  }
  id v12 = 0;
  id v13 = 0;
  id v14 = 0;
  id v11 = 0;
LABEL_29:
  v6[2](v6, v11, v12, v13, v14);
}

- (void)_responsesForMessage:(id)a3 maximumResponses:(unint64_t)a4 outgoingMessageHistory:(id)a5 forConversationHistory:(id)a6 forContext:(id)a7 time:(id)a8 withLanguage:(id)a9 languageLastChangedDate:(id)a10 recipientHandles:(id)a11 options:(unint64_t)a12 preferredLocale:(id)a13 completionBlock:(id)a14
{
  id v57 = a3;
  id v19 = a5;
  id v56 = a6;
  id v58 = a7;
  id v55 = a8;
  id v54 = a9;
  id v20 = a10;
  id v53 = a11;
  id v21 = a13;
  uint64_t v22 = (void (**)(id, void))a14;
  id v23 = v20;
  if ([(id)objc_opt_class() _isPreferredLocaleValid:v21])
  {
    uint64_t v24 = pre_signpost_handle();
    ptr[0] = 7;
    os_signpost_id_t v25 = os_signpost_id_make_with_pointer(v24, ptr);

    os_signpost_id_t v26 = pre_signpost_handle();
    id v27 = v26;
    unint64_t v28 = v25 - 1;
    if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA622000, v27, OS_SIGNPOST_INTERVAL_BEGIN, v25, "PRE-AsyncTotalResponsesForMessage", "Start", buf, 2u);
    }
    os_signpost_id_t spid = (void *)v25;

    *(void *)long long buf = 0;
    id v79 = buf;
    uint64_t v80 = 0x3810000000;
    uint64_t v83 = 0;
    uint64_t v84 = 0;
    v81 = &unk_1CA6485C9;
    uint64_t v82 = @"async-responsesForMessage";
    uint64_t v83 = mach_absolute_time();
    uint64_t v84 = 0;
    [MEMORY[0x1E4F89D60] languageForLocaleIdentifier:v21];
    v51 = uint64_t v29 = v57;
    BOOL v30 = [(PREResponsesExperiment *)self shouldUseDefaultRKTreatmentForLanguage:v51];
    if ([(id)objc_opt_class() _isStringEmpty:v57])
    {
      uint64_t v31 = pre_responses_handle();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v73 = 0;
        _os_log_impl(&dword_1CA622000, v31, OS_LOG_TYPE_DEFAULT, "PREResponsesExperiment responsesForMessage async received null message, returning empty array", v73, 2u);
      }

      v22[2](v22, MEMORY[0x1E4F1CBF0]);
      __int16 v32 = pre_signpost_handle();
      id v33 = v32;
      if (v28 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v32)) {
        goto LABEL_27;
      }
      *(_WORD *)id v73 = 0;
    }
    else if (v57 {
           && [v19 count]
    }
           && ([v19 firstObject],
               uint64_t v34 = objc_claimAutoreleasedReturnValue(),
               int v35 = [v57 isEqualToString:v34],
               v34,
               v35))
    {
      uint64_t v36 = pre_responses_handle();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v73 = 0;
        _os_log_impl(&dword_1CA622000, v36, OS_LOG_TYPE_DEFAULT, "PREResponsesExperiment responsesForMessage async received message exactly matching first message in outgoing history; treating prompt as outgoing message and returning empty array",
          v73,
          2u);
      }

      v22[2](v22, MEMORY[0x1E4F1CBF0]);
      id v37 = pre_signpost_handle();
      id v33 = v37;
      if (v28 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v37)) {
        goto LABEL_27;
      }
      *(_WORD *)id v73 = 0;
    }
    else
    {
      id v38 = +[PRELocaleDetection sharedInstance];
      int v39 = [v38 isLanguageMismatchedForMessage:v57 withLocaleIdentifier:v21];

      if (!v39)
      {
        if (v30)
        {
          uint64_t v42 = pre_responses_handle();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)id v73 = 0;
            _os_log_impl(&dword_1CA622000, v42, OS_LOG_TYPE_DEFAULT, "PREResponsesExperiment async api is fetching default RK responses", v73, 2u);
          }

          id location = 0;
          objc_initWeak(&location, self);
          *(void *)id v73 = 0;
          uint64_t v74 = v73;
          uint64_t v75 = 0x2020000000;
          os_signpost_id_t v76 = 0;
          uint64_t v43 = pre_signpost_handle();
          int v72 = 7;
          os_signpost_id_t v44 = os_signpost_id_make_with_pointer(v43, &v72);

          os_signpost_id_t v76 = v44;
          uint64_t v45 = pre_signpost_handle();
          uint64_t v46 = v45;
          os_signpost_id_t v47 = *((void *)v74 + 3);
          if (v47 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v45))
          {
            *(_WORD *)id v71 = 0;
            _os_signpost_emit_with_name_impl(&dword_1CA622000, v46, OS_SIGNPOST_INTERVAL_BEGIN, v47, "PRE-AsyncRKResponsesForMessage", "Start", v71, 2u);
          }

          rkClient = self->_rkClient;
          v63[0] = MEMORY[0x1E4F143A8];
          v63[1] = 3221225472;
          v63[2] = __220__PREResponsesExperiment__responsesForMessage_maximumResponses_outgoingMessageHistory_forConversationHistory_forContext_time_withLanguage_languageLastChangedDate_recipientHandles_options_preferredLocale_completionBlock___block_invoke;
          v63[3] = &unk_1E65B1E58;
          objc_copyWeak(v70, &location);
          uint64_t v68 = v73;
          v70[1] = spid;
          id v64 = v54;
          v69 = buf;
          v67 = v22;
          id v65 = v51;
          id v66 = v57;
          [(RKMessageResponseManager *)rkClient responsesForMessage:v66 maximumResponses:a4 forContext:v58 withLanguage:v65 options:a12 completionBlock:v63];

          objc_destroyWeak(v70);
          _Block_object_dispose(v73, 8);
          p_id location = &location;
        }
        else
        {
          *(void *)id v73 = 0;
          objc_initWeak((id *)v73, self);
          v59[0] = MEMORY[0x1E4F143A8];
          v59[1] = 3221225472;
          v59[2] = __220__PREResponsesExperiment__responsesForMessage_maximumResponses_outgoingMessageHistory_forConversationHistory_forContext_time_withLanguage_languageLastChangedDate_recipientHandles_options_preferredLocale_completionBlock___block_invoke_193;
          v59[3] = &unk_1E65B1DC0;
          objc_copyWeak(v62, (id *)v73);
          id v60 = v22;
          id v61 = buf;
          v62[1] = spid;
          uint64_t v29 = v57;
          [(PREResponsesExperiment *)self preResponseItemsForMessage:v57 maximumResponses:a4 forConversationHistory:v56 forContext:v58 time:v55 withLanguage:v51 recipientHandles:v53 options:a12 completionBlock:v59];

          objc_destroyWeak(v62);
          p_id location = (id *)v73;
        }
        objc_destroyWeak(p_location);
        goto LABEL_37;
      }
      id v40 = pre_responses_handle();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v73 = 0;
        _os_log_impl(&dword_1CA622000, v40, OS_LOG_TYPE_DEFAULT, "PREResponsesExperiment responsesForMessage async detected language mismatch between prompt and previous outgoing messages in conversation, returning empty array", v73, 2u);
      }

      v22[2](v22, MEMORY[0x1E4F1CBF0]);
      id v41 = pre_signpost_handle();
      id v33 = v41;
      if (v28 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v41))
      {
LABEL_27:

        PRERecordMeasurementState((uint64_t *)v79 + 4);
LABEL_37:

        _Block_object_dispose(buf, 8);
        goto LABEL_38;
      }
      *(_WORD *)id v73 = 0;
    }
    _os_signpost_emit_with_name_impl(&dword_1CA622000, v33, OS_SIGNPOST_INTERVAL_END, (os_signpost_id_t)spid, "PRE-AsyncTotalResponsesForMessage", "Completed", v73, 2u);
    goto LABEL_27;
  }
  v22[2](v22, MEMORY[0x1E4F1CBF0]);
  uint64_t v29 = v57;
LABEL_38:
}

void __220__PREResponsesExperiment__responsesForMessage_maximumResponses_outgoingMessageHistory_forConversationHistory_forContext_time_withLanguage_languageLastChangedDate_recipientHandles_options_preferredLocale_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  id v5 = pre_responses_handle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 134217984;
    uint64_t v16 = [v3 count];
    _os_log_impl(&dword_1CA622000, v5, OS_LOG_TYPE_DEFAULT, "PREResponsesExperiment async api returning %tu responses", (uint8_t *)&v15, 0xCu);
  }

  id v6 = pre_signpost_handle();
  unint64_t v7 = v6;
  os_signpost_id_t v8 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    LOWORD(v15) = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA622000, v7, OS_SIGNPOST_INTERVAL_END, v8, "PRE-AsyncRKResponsesForMessage", "Completed", (uint8_t *)&v15, 2u);
  }

  id v9 = pre_signpost_handle();
  id v10 = v9;
  os_signpost_id_t v11 = *(void *)(a1 + 88);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    LOWORD(v15) = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA622000, v10, OS_SIGNPOST_INTERVAL_END, v11, "PRE-AsyncTotalResponsesForMessage", "Completed", (uint8_t *)&v15, 2u);
  }

  id v12 = +[PREResponseItem responseItemArrayFromResponseKitArray:v3 forLocale:*(void *)(a1 + 32)];
  id v13 = +[PREResponsesExperiment _getFormattedPREResponseItems:v12 inputPreferences:WeakRetained[5]];

  unint64_t v14 = PRERecordMeasurementState((uint64_t *)(*(void *)(*(void *)(a1 + 72) + 8) + 32));
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  [WeakRetained registerGenerationWithPreResponseItems:v13 language:*(void *)(a1 + 40) isCached:0 responseTimePerf:v14 promptMessage:*(void *)(a1 + 48) generationStatus:1];
}

void __220__PREResponsesExperiment__responsesForMessage_maximumResponses_outgoingMessageHistory_forConversationHistory_forContext_time_withLanguage_languageLastChangedDate_recipientHandles_options_preferredLocale_completionBlock___block_invoke_193(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v5 = +[PREResponsesExperiment _getFormattedPREResponseItems:v3 inputPreferences:WeakRetained[5]];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    PRERecordMeasurementState((uint64_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 32));
    id v6 = pre_signpost_handle();
    unint64_t v7 = v6;
    os_signpost_id_t v8 = *(void *)(a1 + 56);
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      *(_WORD *)id v9 = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA622000, v7, OS_SIGNPOST_INTERVAL_END, v8, "PRE-AsyncTotalResponsesForMessage", "Completed", v9, 2u);
    }

    id v3 = (id)v5;
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)responsesForMessage:(id)a3 maximumResponses:(unint64_t)a4 forConversationHistory:(id)a5 forContext:(id)a6 time:(id)a7 withLanguage:(id)a8 recipientHandles:(id)a9 options:(unint64_t)a10 completionBlock:(id)a11
{
  id v17 = a11;
  id v18 = a9;
  id v19 = a8;
  id v20 = a7;
  id v21 = a6;
  id v22 = a5;
  id v23 = a3;
  uint64_t v24 = +[PRELocaleDetection sharedInstance];
  id v26 = [v24 localeForMessage:v23 outgoingMessageHistory:0 defaultLocale:v19 defaultLocaleLastChangedDate:0 sender:v21];

  [(PREResponsesExperiment *)self _responsesForMessage:v23 maximumResponses:a4 outgoingMessageHistory:0 forConversationHistory:v22 forContext:v21 time:v20 withLanguage:v19 languageLastChangedDate:0 recipientHandles:v18 options:a10 preferredLocale:v26 completionBlock:v17];
}

- (void)responsesForMessage:(id)a3 maximumResponses:(unint64_t)a4 forConversationHistory:(id)a5 forContext:(id)a6 time:(id)a7 withLanguage:(id)a8 recipients:(id)a9 options:(unint64_t)a10 completionBlock:(id)a11
{
  id v18 = a11;
  id v19 = a8;
  id v20 = a7;
  id v21 = a6;
  id v22 = a5;
  id v23 = a3;
  id v24 = [(PREResponsesExperiment *)self handlesFromRecipients:a9];
  [(PREResponsesExperiment *)self responsesForMessage:v23 maximumResponses:a4 forConversationHistory:v22 forContext:v21 time:v20 withLanguage:v19 recipientHandles:v24 options:a10 completionBlock:v18];
}

- (id)_responsesForMessage:(id)a3 maximumResponses:(unint64_t)a4 outgoingMessageHistory:(id)a5 forConversationHistory:(id)a6 forContext:(id)a7 time:(id)a8 withLanguage:(id)a9 languageLastChangedDate:(id)a10 recipientHandles:(id)a11 options:(unint64_t)a12 preferredLocale:(id)a13
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  id v19 = a5;
  id v54 = a6;
  id v58 = a7;
  id v57 = a8;
  id v56 = a9;
  id v55 = a10;
  id v20 = a11;
  id v21 = a13;
  if (![(id)objc_opt_class() _isPreferredLocaleValid:v21])
  {
    BOOL v30 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_42;
  }
  v61[2] = 0;
  v61[0] = @"sync-responsesForMessage";
  v61[1] = mach_absolute_time();
  id v22 = pre_signpost_handle();
  int ptr = 7;
  os_signpost_id_t spid = os_signpost_id_make_with_pointer(v22, &ptr);

  id v23 = pre_signpost_handle();
  id v24 = v23;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA622000, v24, OS_SIGNPOST_INTERVAL_BEGIN, spid, "PRE-SyncTotalResponsesForMessage", "Start", buf, 2u);
  }

  os_signpost_id_t v25 = pre_responses_handle();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1CA622000, v25, OS_LOG_TYPE_DEFAULT, "PREResponsesExperiment sync api called", buf, 2u);
  }

  id v26 = [MEMORY[0x1E4F89D60] languageForLocaleIdentifier:v21];
  BOOL v27 = [(PREResponsesExperiment *)self shouldUseDefaultRKTreatmentForLanguage:v26];
  if ([(id)objc_opt_class() _isStringEmpty:v18])
  {
    unint64_t v28 = pre_responses_handle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      uint64_t v29 = "PREResponsesExperiment sync received null message, returning empty array";
LABEL_19:
      _os_log_impl(&dword_1CA622000, v28, OS_LOG_TYPE_DEFAULT, v29, buf, 2u);
    }
  }
  else if (v18 {
         && [v19 count]
  }
         && ([v19 firstObject],
             uint64_t v31 = objc_claimAutoreleasedReturnValue(),
             int v32 = [v18 isEqualToString:v31],
             v31,
             v32))
  {
    unint64_t v28 = pre_responses_handle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      uint64_t v29 = "PREResponsesExperiment sync received message exactly matching first message in outgoing history; treating pr"
            "ompt as outgoing message and returning empty array";
      goto LABEL_19;
    }
  }
  else
  {
    id v33 = +[PRELocaleDetection sharedInstance];
    int v34 = [v33 isLanguageMismatchedForMessage:v18 withLocaleIdentifier:v21];

    if (!v34)
    {
      if (v27)
      {
        int v35 = pre_responses_handle();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_1CA622000, v35, OS_LOG_TYPE_DEFAULT, "PREResponsesExperiment sync api is fetching default RK responses", buf, 2u);
        }

        uint64_t v36 = pre_signpost_handle();
        int v59 = 7;
        os_signpost_id_t v37 = os_signpost_id_make_with_pointer(v36, &v59);

        id v38 = pre_signpost_handle();
        int v39 = v38;
        unint64_t v40 = v37 - 1;
        if (v37 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
        {
          *(_WORD *)long long buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1CA622000, v39, OS_SIGNPOST_INTERVAL_BEGIN, v37, "PRE-SyncRKResponsesForMessage", "Start", buf, 2u);
        }

        os_signpost_id_t v51 = v37;
        uint64_t v41 = [(RKMessageResponseManager *)self->_rkClient responsesForMessage:v18 maximumResponses:a4 forContext:v58 withLanguage:v26 options:a12];
        uint64_t v42 = (void *)v41;
        if (v41)
        {
          uint64_t v43 = +[PREResponseItem responseItemArrayFromResponseKitArray:v41 forLocale:v56];
        }
        else
        {
          uint64_t v43 = (void *)MEMORY[0x1E4F1CBF0];
        }
        [(PREResponsesExperiment *)self registerGenerationWithPreResponseItems:v43 language:v26 isCached:0 responseTimePerf:PRERecordMeasurementState(v61) promptMessage:v18 generationStatus:1];
        os_signpost_id_t v44 = pre_signpost_handle();
        uint64_t v45 = v44;
        if (v40 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v44))
        {
          *(_WORD *)long long buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1CA622000, v45, OS_SIGNPOST_INTERVAL_END, v51, "PRE-SyncRKResponsesForMessage", "Completed", buf, 2u);
        }
      }
      else
      {
        uint64_t v43 = [(PREResponsesExperiment *)self waitForPreResponseItemsForMessage:v18 maximumResponses:a4 forConversationHistory:0 forContext:v58 time:v57 withLanguage:v26 recipientHandles:v20 options:a12];
      }
      uint64_t v46 = pre_signpost_handle();
      os_signpost_id_t v47 = v46;
      if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v46))
      {
        *(_WORD *)long long buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1CA622000, v47, OS_SIGNPOST_INTERVAL_END, spid, "PRE-SyncTotalResponsesForMessage", "Completed", buf, 2u);
      }

      uint64_t v48 = pre_responses_handle();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v49 = [v43 count];
        *(_DWORD *)long long buf = 134217984;
        uint64_t v63 = v49;
        _os_log_impl(&dword_1CA622000, v48, OS_LOG_TYPE_DEFAULT, "PREResponsesExperiment sync api returning %tu responses", buf, 0xCu);
      }

      BOOL v30 = [(id)objc_opt_class() _getFormattedPREResponseItems:v43 inputPreferences:self->_tiPreferencesController];

      goto LABEL_41;
    }
    unint64_t v28 = pre_responses_handle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      uint64_t v29 = "PREResponsesExperiment sync detected language mismatch between prompt and previous outgoing messages in conv"
            "ersation, returning empty array";
      goto LABEL_19;
    }
  }

  PRERecordMeasurementState(v61);
  BOOL v30 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_41:

  PRERecordMeasurementState(v61);
LABEL_42:

  return v30;
}

- (id)responsesForMessage:(id)a3 maximumResponses:(unint64_t)a4 forConversationHistory:(id)a5 forContext:(id)a6 time:(id)a7 withLanguage:(id)a8 recipientHandles:(id)a9 options:(unint64_t)a10
{
  id v16 = a9;
  id v17 = a8;
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  id v21 = a3;
  id v22 = +[PRELocaleDetection sharedInstance];
  id v23 = [v22 localeForMessage:v21 outgoingMessageHistory:0 defaultLocale:v17 defaultLocaleLastChangedDate:0 sender:v19];

  id v24 = [(PREResponsesExperiment *)self _responsesForMessage:v21 maximumResponses:a4 outgoingMessageHistory:0 forConversationHistory:v20 forContext:v19 time:v18 withLanguage:v17 languageLastChangedDate:0 recipientHandles:v16 options:a10 preferredLocale:v23];

  return v24;
}

- (void)nonEditableSuggestionsForMessage:(id)a3 messageDate:(id)a4 senderID:(id)a5 recipientHandles:(id)a6 outgoingMessageHistory:(id)a7 keyboardLanguageID:(id)a8 keyboardLanguageLastChangedDate:(id)a9 includeDynamicSuggestions:(BOOL)a10 completion:(id)a11
{
  BOOL v17 = a10;
  id v18 = a3;
  id v38 = a4;
  id v39 = a5;
  id v37 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a11;
  if (a10 || [(PREResponsesExperiment *)self includeCannedResponses])
  {
    id v23 = +[PRELocaleDetection sharedInstance];
    id v36 = v21;
    id v24 = [v23 localeForMessage:v18 outgoingMessageHistory:v19 defaultLocale:v20 defaultLocaleLastChangedDate:v21 sender:v39];

    exemptTermsDetector = self->_exemptTermsDetector;
    id v26 = +[PRELocaleDetection languageTagForLocaleIdentifier:v24];
    LODWORD(exemptTermsDetector) = [(PREPredictionExemptTermsDetector *)exemptTermsDetector checkForExemptContentInText:v18 languageCode:v26];

    if (exemptTermsDetector)
    {
      BOOL v27 = pre_responses_handle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1CA622000, v27, OS_LOG_TYPE_DEFAULT, "PREResponsesExperiment received message contains exempt content", buf, 2u);
      }

      BOOL v17 = 0;
    }
    if ([(PREResponsesExperiment *)self includeCannedResponses]
      && [(id)objc_opt_class() _isPreferredLocaleValid:v24])
    {
      unint64_t v28 = [MEMORY[0x1E4F89D60] languageForLocaleIdentifier:v24];
      uint64_t v29 = +[PREResponsesExperiment _cannedRepliesForLanguage:v28 inputPreferences:self->_tiPreferencesController];
    }
    else
    {
      uint64_t v29 = (void *)MEMORY[0x1E4F1CBF0];
    }
    BOOL v30 = v19;
    if (v17)
    {
      if ([(TIPreferencesController *)self->_tiPreferencesController BOOLForKey:9]) {
        uint64_t v31 = 256;
      }
      else {
        uint64_t v31 = 384;
      }
      *(void *)long long buf = 0;
      objc_initWeak((id *)buf, self);
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __208__PREResponsesExperiment_nonEditableSuggestionsForMessage_messageDate_senderID_recipientHandles_outgoingMessageHistory_keyboardLanguageID_keyboardLanguageLastChangedDate_includeDynamicSuggestions_completion___block_invoke;
      v40[3] = &unk_1E65B1D00;
      objc_copyWeak(&v43, (id *)buf);
      id v42 = v22;
      id v41 = v29;
      uint64_t v35 = v31;
      int v32 = v37;
      id v33 = v38;
      [(PREResponsesExperiment *)self _responsesForMessage:v18 maximumResponses:4 outgoingMessageHistory:v30 forConversationHistory:0 forContext:v39 time:v38 withLanguage:v20 languageLastChangedDate:v36 recipientHandles:v37 options:v35 preferredLocale:v24 completionBlock:v40];

      objc_destroyWeak(&v43);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      int v34 = +[PREResponsesExperiment _suggestionsWithDynamicResponseItems:0 cannedResponseItems:v29 inputPreferences:self->_tiPreferencesController];
      (*((void (**)(id, void *))v22 + 2))(v22, v34);

      int v32 = v37;
      id v33 = v38;
    }

    id v21 = v36;
  }
  else
  {
    BOOL v30 = v19;
    (*((void (**)(id, void))v22 + 2))(v22, MEMORY[0x1E4F1CBF0]);
    int v32 = v37;
    id v33 = v38;
  }
}

void __208__PREResponsesExperiment_nonEditableSuggestionsForMessage_messageDate_senderID_recipientHandles_outgoingMessageHistory_keyboardLanguageID_keyboardLanguageLastChangedDate_includeDynamicSuggestions_completion___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v4 = *(void *)(a1 + 40);
  if (WeakRetained)
  {
    uint64_t v5 = +[PREResponsesExperiment _suggestionsWithDynamicResponseItems:v6 cannedResponseItems:*(void *)(a1 + 32) inputPreferences:WeakRetained[5]];
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
  else
  {
    (*(void (**)(void, void))(v4 + 16))(*(void *)(a1 + 40), MEMORY[0x1E4F1CBF0]);
  }
}

- (void)nonEditableSuggestionsForMessage:(id)a3 messageDate:(id)a4 senderID:(id)a5 recipients:(id)a6 outgoingMessageHistory:(id)a7 keyboardLanguageID:(id)a8 keyboardLanguageLastChangedDate:(id)a9 includeDynamicSuggestions:(BOOL)a10 completion:(id)a11
{
  id v18 = a11;
  id v19 = a9;
  id v20 = a8;
  id v21 = a7;
  id v22 = a5;
  id v23 = a4;
  id v24 = a3;
  id v26 = [(PREResponsesExperiment *)self handlesFromRecipients:a6];
  LOBYTE(v25) = a10;
  [(PREResponsesExperiment *)self nonEditableSuggestionsForMessage:v24 messageDate:v23 senderID:v22 recipientHandles:v26 outgoingMessageHistory:v21 keyboardLanguageID:v20 keyboardLanguageLastChangedDate:v19 includeDynamicSuggestions:v25 completion:v18];
}

- (id)nonEditableSuggestionsForMessage:(id)a3 messageDate:(id)a4 senderID:(id)a5 recipientHandles:(id)a6 outgoingMessageHistory:(id)a7 keyboardLanguageID:(id)a8 keyboardLanguageLastChangedDate:(id)a9 includeDynamicSuggestions:(BOOL)a10
{
  BOOL v16 = a10;
  id v17 = a3;
  id v38 = a4;
  id v18 = a5;
  id v37 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  if (a10 || [(PREResponsesExperiment *)self includeCannedResponses])
  {
    id v22 = +[PRELocaleDetection sharedInstance];
    id v36 = v18;
    id v23 = [v22 localeForMessage:v17 outgoingMessageHistory:v19 defaultLocale:v20 defaultLocaleLastChangedDate:v21 sender:v18];

    exemptTermsDetector = self->_exemptTermsDetector;
    uint64_t v25 = +[PRELocaleDetection languageTagForLocaleIdentifier:v23];
    LODWORD(exemptTermsDetector) = [(PREPredictionExemptTermsDetector *)exemptTermsDetector checkForExemptContentInText:v17 languageCode:v25];

    if (exemptTermsDetector)
    {
      id v26 = pre_responses_handle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1CA622000, v26, OS_LOG_TYPE_DEFAULT, "PREResponsesExperiment received message contains exempt content", buf, 2u);
      }

      BOOL v16 = 0;
    }
    if ([(PREResponsesExperiment *)self includeCannedResponses]
      && [(id)objc_opt_class() _isPreferredLocaleValid:v23])
    {
      BOOL v27 = [MEMORY[0x1E4F89D60] languageForLocaleIdentifier:v23];
      unint64_t v28 = +[PREResponsesExperiment _cannedRepliesForLanguage:v27 inputPreferences:self->_tiPreferencesController];

      if (!v16)
      {
LABEL_10:
        uint64_t v29 = 0;
        uint64_t v31 = v37;
        BOOL v30 = v38;
LABEL_15:
        int v34 = +[PREResponsesExperiment _suggestionsWithDynamicResponseItems:v29 cannedResponseItems:v28 inputPreferences:self->_tiPreferencesController];

        id v18 = v36;
        goto LABEL_17;
      }
    }
    else
    {
      unint64_t v28 = (void *)MEMORY[0x1E4F1CBF0];
      if (!v16) {
        goto LABEL_10;
      }
    }
    int v32 = [(TIPreferencesController *)self->_tiPreferencesController BOOLForKey:9];
    uint64_t v33 = 384;
    if (v32) {
      uint64_t v33 = 256;
    }
    uint64_t v31 = v37;
    BOOL v30 = v38;
    uint64_t v29 = [(PREResponsesExperiment *)self _responsesForMessage:v17 maximumResponses:4 outgoingMessageHistory:v19 forConversationHistory:0 forContext:v36 time:v38 withLanguage:v20 languageLastChangedDate:v21 recipientHandles:v37 options:v33 preferredLocale:v23];
    goto LABEL_15;
  }
  int v34 = (void *)MEMORY[0x1E4F1CBF0];
  uint64_t v31 = v37;
  BOOL v30 = v38;
LABEL_17:

  return v34;
}

- (id)nonEditableSuggestionsForMessage:(id)a3 messageDate:(id)a4 senderID:(id)a5 recipients:(id)a6 outgoingMessageHistory:(id)a7 keyboardLanguageID:(id)a8 keyboardLanguageLastChangedDate:(id)a9 includeDynamicSuggestions:(BOOL)a10
{
  id v17 = a9;
  id v18 = a8;
  id v19 = a7;
  id v20 = a5;
  id v21 = a4;
  id v22 = a3;
  id v23 = [(PREResponsesExperiment *)self handlesFromRecipients:a6];
  LOBYTE(v26) = a10;
  id v24 = [(PREResponsesExperiment *)self nonEditableSuggestionsForMessage:v22 messageDate:v21 senderID:v20 recipientHandles:v23 outgoingMessageHistory:v19 keyboardLanguageID:v18 keyboardLanguageLastChangedDate:v17 includeDynamicSuggestions:v26];

  return v24;
}

- (void)fullNonEditableSuggestionsListForMessage:(id)a3 context:(id)a4 additionalSenderMessages:(id)a5 date:(id)a6 keyboardLanguageID:(id)a7 keyboardLanguageLastChangedDate:(id)a8 recipients:(id)a9 includeDynamicSuggestions:(BOOL)a10 completion:(id)a11
{
  id v40 = a3;
  id v38 = a4;
  id v36 = a5;
  id v17 = a6;
  id v34 = a7;
  id v32 = a8;
  id v18 = a9;
  id v19 = a11;
  id v20 = pre_signpost_handle();
  ptr[0] = 7;
  os_signpost_id_t v21 = os_signpost_id_make_with_pointer(v20, ptr);

  id v22 = pre_signpost_handle();
  id v23 = v22;
  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA622000, v23, OS_SIGNPOST_INTERVAL_BEGIN, v21, "PRE-AsyncFullNonEditableSuggestions", "Start", buf, 2u);
  }

  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __204__PREResponsesExperiment_fullNonEditableSuggestionsListForMessage_context_additionalSenderMessages_date_keyboardLanguageID_keyboardLanguageLastChangedDate_recipients_includeDynamicSuggestions_completion___block_invoke;
  v53[3] = &unk_1E65B1D70;
  id v54 = v19;
  os_signpost_id_t v55 = v21;
  id v39 = v19;
  id v24 = (void *)MEMORY[0x1CB799770](v53);
  if (fullNonEditableSuggestionsListForMessage_context_additionalSenderMessages_date_keyboardLanguageID_keyboardLanguageLastChangedDate_recipients_includeDynamicSuggestions_completion___pasOnceToken421 != -1) {
    dispatch_once(&fullNonEditableSuggestionsListForMessage_context_additionalSenderMessages_date_keyboardLanguageID_keyboardLanguageLastChangedDate_recipients_includeDynamicSuggestions_completion___pasOnceToken421, &__block_literal_global_184);
  }
  *(void *)long long buf = 0;
  uint64_t v25 = (id)fullNonEditableSuggestionsListForMessage_context_additionalSenderMessages_date_keyboardLanguageID_keyboardLanguageLastChangedDate_recipients_includeDynamicSuggestions_completion___pasExprOnceResult;
  objc_initWeak((id *)buf, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __204__PREResponsesExperiment_fullNonEditableSuggestionsListForMessage_context_additionalSenderMessages_date_keyboardLanguageID_keyboardLanguageLastChangedDate_recipients_includeDynamicSuggestions_completion___block_invoke_2;
  block[3] = &unk_1E65B1D98;
  objc_copyWeak(&v50, (id *)buf);
  id v42 = v40;
  id v43 = v17;
  id v44 = v38;
  id v45 = v18;
  id v46 = v36;
  id v47 = v34;
  id v48 = v32;
  id v49 = v24;
  BOOL v51 = a10;
  id v33 = v32;
  id v35 = v34;
  id v37 = v36;
  id v26 = v18;
  id v27 = v38;
  id v28 = v17;
  id v29 = v40;
  id v30 = v24;
  dispatch_block_t v31 = dispatch_block_create((dispatch_block_flags_t)0, block);
  dispatch_async(v25, v31);

  objc_destroyWeak(&v50);
  objc_destroyWeak((id *)buf);
}

void __204__PREResponsesExperiment_fullNonEditableSuggestionsListForMessage_context_additionalSenderMessages_date_keyboardLanguageID_keyboardLanguageLastChangedDate_recipients_includeDynamicSuggestions_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = pre_signpost_handle();
  uint64_t v5 = v4;
  os_signpost_id_t v6 = *(void *)(a1 + 40);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)unint64_t v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA622000, v5, OS_SIGNPOST_INTERVAL_END, v6, "PRE-AsyncFullNonEditableSuggestions", "Completed", v7, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __204__PREResponsesExperiment_fullNonEditableSuggestionsListForMessage_context_additionalSenderMessages_date_keyboardLanguageID_keyboardLanguageLastChangedDate_recipients_includeDynamicSuggestions_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 96));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    LOBYTE(v3) = *(unsigned char *)(a1 + 104);
    [WeakRetained nonEditableSuggestionsForMessage:*(void *)(a1 + 32) messageDate:*(void *)(a1 + 40) senderID:*(void *)(a1 + 48) recipients:*(void *)(a1 + 56) outgoingMessageHistory:*(void *)(a1 + 64) keyboardLanguageID:*(void *)(a1 + 72) keyboardLanguageLastChangedDate:*(void *)(a1 + 80) includeDynamicSuggestions:v3 completion:*(void *)(a1 + 88)];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
  }
}

void __204__PREResponsesExperiment_fullNonEditableSuggestionsListForMessage_context_additionalSenderMessages_date_keyboardLanguageID_keyboardLanguageLastChangedDate_recipients_includeDynamicSuggestions_completion___block_invoke_182()
{
  v0 = (void *)MEMORY[0x1CB799590]();
  uint64_t v1 = [MEMORY[0x1E4F93B18] autoreleasingSerialQueueWithLabel:"PRE-asyncFullNonEditableSuggestionsQueue"];
  id v2 = (void *)fullNonEditableSuggestionsListForMessage_context_additionalSenderMessages_date_keyboardLanguageID_keyboardLanguageLastChangedDate_recipients_includeDynamicSuggestions_completion___pasExprOnceResult;
  fullNonEditableSuggestionsListForMessage_context_additionalSenderMessages_date_keyboardLanguageID_keyboardLanguageLastChangedDate_recipients_includeDynamicSuggestions_completion___pasExprOnceResult = v1;
}

- (id)fullNonEditableSuggestionsListForMessage:(id)a3 context:(id)a4 additionalSenderMessages:(id)a5 date:(id)a6 keyboardLanguageID:(id)a7 keyboardLanguageLastChangedDate:(id)a8 recipients:(id)a9 includeDynamicSuggestions:(BOOL)a10
{
  id v16 = a9;
  id v17 = a8;
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  id v21 = a4;
  id v22 = a3;
  id v23 = pre_signpost_handle();
  int ptr = 7;
  os_signpost_id_t v24 = os_signpost_id_make_with_pointer(v23, &ptr);

  uint64_t v25 = pre_signpost_handle();
  id v26 = v25;
  os_signpost_id_t spid = v24;
  unint64_t v27 = v24 - 1;
  if (v27 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA622000, v26, OS_SIGNPOST_INTERVAL_BEGIN, spid, "PRE-SyncFullNonEditableSuggestions", "Start", buf, 2u);
  }

  LOBYTE(v32) = a10;
  id v28 = [(PREResponsesExperiment *)self nonEditableSuggestionsForMessage:v22 messageDate:v19 senderID:v21 recipients:v16 outgoingMessageHistory:v20 keyboardLanguageID:v18 keyboardLanguageLastChangedDate:v17 includeDynamicSuggestions:v32];

  id v29 = pre_signpost_handle();
  id v30 = v29;
  if (v27 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
  {
    *(_WORD *)id v35 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA622000, v30, OS_SIGNPOST_INTERVAL_END, spid, "PRE-SyncFullNonEditableSuggestions", "Completed", v35, 2u);
  }

  return v28;
}

- (id)responsesForMessage:(id)a3 maximumResponses:(unint64_t)a4 forConversationHistory:(id)a5 forContext:(id)a6 time:(id)a7 withLanguage:(id)a8 recipients:(id)a9 options:(unint64_t)a10
{
  id v16 = a8;
  id v17 = a7;
  id v18 = a6;
  id v19 = a5;
  id v20 = a3;
  id v21 = [(PREResponsesExperiment *)self handlesFromRecipients:a9];
  id v22 = [(PREResponsesExperiment *)self responsesForMessage:v20 maximumResponses:a4 forConversationHistory:v19 forContext:v18 time:v17 withLanguage:v16 recipientHandles:v21 options:a10];

  return v22;
}

- (void)suggestionsForRequest:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x2020000000;
  os_signpost_id_t v32 = 0;
  os_signpost_id_t v8 = pre_signpost_handle();
  int ptr = 7;
  os_signpost_id_t v9 = os_signpost_id_make_with_pointer(v8, &ptr);

  os_signpost_id_t v32 = v9;
  id v10 = pre_signpost_handle();
  os_signpost_id_t v11 = v10;
  os_signpost_id_t v12 = v30[3];
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA622000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v12, "PRE-AsyncFullNonEditableSuggestions", "Start", buf, 2u);
  }

  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __63__PREResponsesExperiment_suggestionsForRequest_withCompletion___block_invoke;
  v25[3] = &unk_1E65B1CD8;
  id v26 = v7;
  unint64_t v27 = &v29;
  id v13 = v7;
  unint64_t v14 = (void *)MEMORY[0x1CB799770](v25);
  if (suggestionsForRequest_withCompletion___pasOnceToken411 != -1) {
    dispatch_once(&suggestionsForRequest_withCompletion___pasOnceToken411, &__block_literal_global_162);
  }
  *(void *)long long buf = 0;
  int v15 = (id)suggestionsForRequest_withCompletion___pasExprOnceResult;
  objc_initWeak((id *)buf, self);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __63__PREResponsesExperiment_suggestionsForRequest_withCompletion___block_invoke_2;
  v19[3] = &unk_1E65B1D28;
  objc_copyWeak(&v23, (id *)buf);
  id v21 = self;
  id v22 = v14;
  id v20 = v6;
  id v16 = v6;
  id v17 = v14;
  dispatch_block_t v18 = dispatch_block_create((dispatch_block_flags_t)0, v19);
  dispatch_async(v15, v18);

  objc_destroyWeak(&v23);
  objc_destroyWeak((id *)buf);

  _Block_object_dispose(&v29, 8);
}

void __63__PREResponsesExperiment_suggestionsForRequest_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = pre_signpost_handle();
  uint64_t v5 = v4;
  os_signpost_id_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)id v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA622000, v5, OS_SIGNPOST_INTERVAL_END, v6, "PRE-AsyncFullNonEditableSuggestions", "Completed", v7, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __63__PREResponsesExperiment_suggestionsForRequest_withCompletion___block_invoke_2(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  if (!WeakRetained)
  {
    id v3 = (void (**)(id, PREResponsesExperimentSuggestionsResponse *))a1[6];
    id v4 = [[PREResponsesExperimentSuggestionsResponse alloc] initWithSuggestions:0];
    v3[2](v3, v4);
  }
  char v5 = [a1[4] includesDynamicSuggestions];
  if ((v5 & 1) == 0 && ([WeakRetained includeCannedResponses] & 1) == 0)
  {
    id v39 = (void (**)(id, PREResponsesExperimentSuggestionsResponse *))a1[6];
    id v40 = [[PREResponsesExperimentSuggestionsResponse alloc] initWithSuggestions:0];
    v39[2](v39, v40);

    goto LABEL_16;
  }
  char v44 = v5;
  os_signpost_id_t v6 = objc_opt_class();
  id v7 = [a1[4] receivedMessages];
  [v6 _rawStringsForMessages:v7 excludingTapBacks:1];
  v9 = os_signpost_id_t v8 = WeakRetained;

  id v10 = objc_opt_class();
  os_signpost_id_t v11 = [a1[4] senderMessages];
  uint64_t v12 = [v10 _rawStringsForMessages:v11 excludingTapBacks:1];

  id v13 = [a1[4] receivedMessages];
  unint64_t v14 = [v13 firstObject];
  int v15 = [v14 senderIdentifier];

  id v16 = +[PRELocaleDetection sharedInstance];
  id v17 = [a1[4] languageCode];
  dispatch_block_t v18 = [a1[4] languageLastChangedDate];
  uint64_t v19 = v9;
  id v47 = (void *)v12;
  uint64_t v20 = v12;
  id v21 = (void *)v9;
  id WeakRetained = v8;
  id v22 = [v16 localeForIncomingMessages:v19 outgoingMessages:v20 defaultLocale:v17 defaultLocaleLastChangedDate:v18 sender:v15];

  id v23 = (void *)v8[9];
  id v46 = v21;
  os_signpost_id_t v24 = [v21 componentsJoinedByString:@"\n"];
  uint64_t v25 = +[PRELocaleDetection languageTagForLocaleIdentifier:v22];
  LODWORD(v23) = [v23 checkForExemptContentInText:v24 languageCode:v25];

  if (v23)
  {
    id v26 = pre_responses_handle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1CA622000, v26, OS_LOG_TYPE_DEFAULT, "PREResponsesExperiment received messages contain exempt content", buf, 2u);
    }
  }
  else if (v44)
  {
    int v27 = [(id)v8[5] BOOLForKey:9];
    uint64_t v28 = 384;
    if (v27) {
      uint64_t v28 = 256;
    }
    uint64_t v45 = v28;
    uint64_t v29 = +[PREResponsesExperiment _getConversationHistoryFromRequest:a1[4]];
    id v30 = [v29 lastObject];
    uint64_t v31 = [v30 text];

    id v32 = a1[5];
    id v33 = [a1[4] recipients];
    id v43 = [v32 handlesFromRecipients:v33];

    *(void *)long long buf = 0;
    objc_initWeak((id *)buf, a1[5]);
    id v41 = a1[5];
    id v42 = [a1[4] requestDate];
    id v34 = [a1[4] languageCode];
    id v35 = [a1[4] languageLastChangedDate];
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __63__PREResponsesExperiment_suggestionsForRequest_withCompletion___block_invoke_165;
    v48[3] = &unk_1E65B1D00;
    objc_copyWeak(&v51, (id *)buf);
    id v36 = a1[6];
    id v49 = (id)MEMORY[0x1E4F1CBF0];
    id v50 = v36;
    id v37 = v47;
    [v41 _responsesForMessage:v31 maximumResponses:4 outgoingMessageHistory:v47 forConversationHistory:v29 forContext:0 time:v42 withLanguage:v34 languageLastChangedDate:v35 recipientHandles:v43 options:v45 preferredLocale:v22 completionBlock:v48];

    objc_destroyWeak(&v51);
    objc_destroyWeak((id *)buf);

    goto LABEL_14;
  }
  uint64_t v29 = +[PREResponsesExperiment _suggestionsWithDynamicResponseItems:0 cannedResponseItems:MEMORY[0x1E4F1CBF0] inputPreferences:WeakRetained[5]];
  id v38 = (void (**)(id, PREResponsesExperimentSuggestionsResponse *))a1[6];
  uint64_t v31 = [[PREResponsesExperimentSuggestionsResponse alloc] initWithSuggestions:v29];
  v38[2](v38, v31);
  id v37 = v47;
LABEL_14:

LABEL_16:
}

void __63__PREResponsesExperiment_suggestionsForRequest_withCompletion___block_invoke_165(uint64_t a1, void *a2)
{
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v4 = +[PREResponsesExperiment _suggestionsWithDynamicResponseItems:v8 cannedResponseItems:*(void *)(a1 + 32) inputPreferences:WeakRetained[5]];
    uint64_t v5 = *(void *)(a1 + 40);
    os_signpost_id_t v6 = [[PREResponsesExperimentSuggestionsResponse alloc] initWithSuggestions:v4];
    (*(void (**)(uint64_t, PREResponsesExperimentSuggestionsResponse *))(v5 + 16))(v5, v6);
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 40);
    id v4 = [[PREResponsesExperimentSuggestionsResponse alloc] initWithSuggestions:0];
    (*(void (**)(uint64_t, PREResponsesExperimentSuggestionsResponse *))(v7 + 16))(v7, v4);
  }
}

void __63__PREResponsesExperiment_suggestionsForRequest_withCompletion___block_invoke_160()
{
  v0 = (void *)MEMORY[0x1CB799590]();
  uint64_t v1 = [MEMORY[0x1E4F93B18] autoreleasingSerialQueueWithLabel:"PRE-asyncFullNonEditableSuggestionsQueue"];
  id v2 = (void *)suggestionsForRequest_withCompletion___pasExprOnceResult;
  suggestionsForRequest_withCompletion___pasExprOnceResult = v1;
}

- (id)suggestionsForRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = pre_signpost_handle();
  int ptr = 7;
  os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, &ptr);

  uint64_t v7 = pre_signpost_handle();
  id v8 = v7;
  os_signpost_id_t spid = v6;
  unint64_t v9 = v6 - 1;
  if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA622000, v8, OS_SIGNPOST_INTERVAL_BEGIN, spid, "PRE-SyncFullNonEditableSuggestions", "Start", buf, 2u);
  }

  int v10 = [v4 includesDynamicSuggestions];
  if (([v4 includesDynamicSuggestions] & 1) != 0
    || [(PREResponsesExperiment *)self includeCannedResponses])
  {
    unint64_t v55 = v9;
    os_signpost_id_t v11 = objc_opt_class();
    uint64_t v12 = [v4 receivedMessages];
    id v13 = [v11 _rawStringsForMessages:v12 excludingTapBacks:1];

    unint64_t v14 = objc_opt_class();
    int v15 = [v4 senderMessages];
    uint64_t v16 = [v14 _rawStringsForMessages:v15 excludingTapBacks:1];

    id v17 = [v4 receivedMessages];
    dispatch_block_t v18 = [v17 firstObject];
    uint64_t v19 = [v18 senderIdentifier];

    uint64_t v20 = +[PRELocaleDetection sharedInstance];
    id v21 = [v4 languageCode];
    id v22 = [v4 languageLastChangedDate];
    id v57 = (void *)v16;
    uint64_t v23 = v16;
    os_signpost_id_t v24 = (void *)v19;
    uint64_t v25 = [v20 localeForIncomingMessages:v13 outgoingMessages:v23 defaultLocale:v21 defaultLocaleLastChangedDate:v22 sender:v19];

    exemptTermsDetector = self->_exemptTermsDetector;
    int v27 = [v13 componentsJoinedByString:@"\n"];
    uint64_t v28 = +[PRELocaleDetection languageTagForLocaleIdentifier:v25];
    LODWORD(exemptTermsDetector) = [(PREPredictionExemptTermsDetector *)exemptTermsDetector checkForExemptContentInText:v27 languageCode:v28];

    if (exemptTermsDetector)
    {
      uint64_t v29 = pre_responses_handle();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v59 = 0;
        _os_log_impl(&dword_1CA622000, v29, OS_LOG_TYPE_DEFAULT, "PREResponsesExperiment received messages contain exempt content", v59, 2u);
      }

      int v10 = 0;
    }
    if ([(PREResponsesExperiment *)self includeCannedResponses]
      && [(id)objc_opt_class() _isPreferredLocaleValid:v25])
    {
      id v30 = [MEMORY[0x1E4F89D60] languageForLocaleIdentifier:v25];
      uint64_t v31 = +[PREResponsesExperiment _cannedRepliesForLanguage:v30 inputPreferences:self->_tiPreferencesController];
    }
    else
    {
      uint64_t v31 = (void *)MEMORY[0x1E4F1CBF0];
    }
    id v56 = (void *)v25;
    if (v10)
    {
      int v32 = [(TIPreferencesController *)self->_tiPreferencesController BOOLForKey:9];
      uint64_t v33 = 384;
      if (v32) {
        uint64_t v33 = 256;
      }
      uint64_t v51 = v33;
      +[PREResponsesExperiment _getConversationHistoryFromRequest:v4];
      id v34 = v53 = v13;
      id v35 = [v34 lastObject];
      id v36 = [v35 text];

      id v37 = [v4 recipients];
      id v38 = [(PREResponsesExperiment *)self handlesFromRecipients:v37];

      [v4 requestDate];
      id v52 = v31;
      v40 = id v39 = v24;
      id v41 = [v4 languageCode];
      uint64_t v42 = [v4 languageLastChangedDate];
      uint64_t v43 = v25;
      char v44 = (void *)v42;
      uint64_t v45 = [(PREResponsesExperiment *)self _responsesForMessage:v36 maximumResponses:4 outgoingMessageHistory:v57 forConversationHistory:v34 forContext:0 time:v40 withLanguage:v41 languageLastChangedDate:v42 recipientHandles:v38 options:v51 preferredLocale:v43];

      os_signpost_id_t v24 = v39;
      uint64_t v31 = v52;

      id v13 = v53;
    }
    else
    {
      uint64_t v45 = 0;
    }
    id v46 = pre_signpost_handle();
    id v47 = v46;
    if (v55 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v46))
    {
      *(_WORD *)id v58 = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA622000, v47, OS_SIGNPOST_INTERVAL_END, spid, "PRE-SyncFullNonEditableSuggestions", "Completed", v58, 2u);
    }

    id v48 = +[PREResponsesExperiment _suggestionsWithDynamicResponseItems:v45 cannedResponseItems:v31 inputPreferences:self->_tiPreferencesController];
    id v49 = [[PREResponsesExperimentSuggestionsResponse alloc] initWithSuggestions:v48];
  }
  else
  {
    id v49 = 0;
  }

  return v49;
}

- (id)activeExperimentNameForLanguage:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = pre_signpost_handle();
  int ptr = 7;
  os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, &ptr);

  uint64_t v7 = pre_signpost_handle();
  id v8 = v7;
  unint64_t v9 = v6 - 1;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA622000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "PRE-ReadExperimentNameDefaults", "Start", buf, 2u);
  }

  unint64_t v10 = [(PREResponsesExperiment *)self mode];
  if (v10 == 2)
  {
    unint64_t v14 = [(NSUserDefaults *)self->_defaults stringForKey:@"experimentModelUserLabel"];
    int v15 = pre_responses_handle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      int v32 = v14;
      _os_log_impl(&dword_1CA622000, v15, OS_LOG_TYPE_DEFAULT, "PREResponsesExperiment activeExperimentName from defaults (user-specified model): %@", buf, 0xCu);
    }

    uint64_t v16 = pre_signpost_handle();
    id v13 = v16;
    if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA622000, v13, OS_SIGNPOST_INTERVAL_END, v6, "PRE-ReadExperimentNameDefaults", "Completed", buf, 2u);
    }
  }
  else if (v10 == 1)
  {
    id v17 = pre_responses_handle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      int v32 = @"QR_CHUNK_PLIST_BUNDLED_ON_DEVICE";
      _os_log_impl(&dword_1CA622000, v17, OS_LOG_TYPE_DEFAULT, "PREResponsesExperiment activeExperimentName from defaults (bundled in build): %@", buf, 0xCu);
    }

    dispatch_block_t v18 = pre_signpost_handle();
    id v13 = v18;
    if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA622000, v13, OS_SIGNPOST_INTERVAL_END, v6, "PRE-ReadExperimentNameDefaults", "Completed", buf, 2u);
    }
    unint64_t v14 = @"QR_CHUNK_PLIST_BUNDLED_ON_DEVICE";
  }
  else if (v10)
  {
    uint64_t v19 = pre_signpost_handle();
    int v29 = 7;
    os_signpost_id_t v20 = os_signpost_id_make_with_pointer(v19, &v29);

    id v21 = pre_signpost_handle();
    id v22 = v21;
    if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA622000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v20, "PRE-ReadTrialExperimentNameFactor", "Start", buf, 2u);
    }

    id v13 = [(PREExperimentResolverProtocol *)self->_experimentResolver getResponseSuggestionsExperimentConfig:v4 shouldDownloadAssets:0];
    uint64_t v23 = [v13 treatmentName];
    os_signpost_id_t v24 = pre_responses_handle();
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
    if (v23)
    {
      if (v25)
      {
        *(_DWORD *)long long buf = 138412290;
        int v32 = v23;
        _os_log_impl(&dword_1CA622000, v24, OS_LOG_TYPE_DEFAULT, "PREResponsesExperiment activeExperimentName from Trial: %@", buf, 0xCu);
      }

      id v26 = pre_signpost_handle();
      int v27 = v26;
      if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
      {
        *(_WORD *)long long buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1CA622000, v27, OS_SIGNPOST_INTERVAL_END, v20, "PRE-ReadTrialExperimentNameFactor", "Completed", buf, 2u);
      }

      unint64_t v14 = v23;
    }
    else
    {
      if (v25)
      {
        *(_DWORD *)long long buf = 138412290;
        int v32 = @"DEFAULT_RESPONSE_KIT";
        _os_log_impl(&dword_1CA622000, v24, OS_LOG_TYPE_DEFAULT, "PREResponsesExperiment activeExperimentName got nothing from defaults or trials, returning fallback: %@", buf, 0xCu);
      }

      unint64_t v14 = @"DEFAULT_RESPONSE_KIT";
    }
  }
  else
  {
    os_signpost_id_t v11 = pre_responses_handle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      int v32 = @"DEFAULT_RESPONSE_KIT";
      _os_log_impl(&dword_1CA622000, v11, OS_LOG_TYPE_DEFAULT, "PREResponsesExperiment activeExperimentName from defaults (response kit): %@", buf, 0xCu);
    }

    uint64_t v12 = pre_signpost_handle();
    id v13 = v12;
    if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA622000, v13, OS_SIGNPOST_INTERVAL_END, v6, "PRE-ReadExperimentNameDefaults", "Completed", buf, 2u);
    }
    unint64_t v14 = @"DEFAULT_RESPONSE_KIT";
  }

  return v14;
}

- (unint64_t)mode
{
  id v2 = [(NSUserDefaults *)self->_defaults objectForKey:@"experimentModelName"];
  if ([v2 isEqualToString:@"DEFAULT_RESPONSE_KIT"])
  {
    unint64_t v3 = 0;
  }
  else if ([v2 isEqualToString:@"QR_CHUNK_PLIST_BUNDLED_ON_DEVICE"])
  {
    unint64_t v3 = 1;
  }
  else if ([v2 isEqualToString:@"USER_SPECIFIED_MODEL"])
  {
    unint64_t v3 = 2;
  }
  else
  {
    unint64_t v3 = 3;
  }

  return v3;
}

- (id)cacheKeyForMessage:(id)a3 maxResponses:(unint64_t)a4 time:(id)a5 language:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  if (v11)
  {
    uint64_t v12 = v11;
    id v13 = [MEMORY[0x1E4F89D60] languageForLocaleIdentifier:v11];
  }
  else
  {
    id v13 = 0;
  }
  if (v10)
  {
    id v14 = [NSString alloc];
    [v10 timeIntervalSinceReferenceDate];
    uint64_t v16 = (__CFString *)objc_msgSend(v14, "initWithFormat:", @"%.02f", v15);
  }
  else
  {
    uint64_t v16 = @"0";
  }
  id v17 = (void *)[[NSString alloc] initWithFormat:@"%@-%tu-%@-%@", v9, a4, v13, v16];

  return v17;
}

- (id)clippedMessageIfNecessary:(id)a3
{
  id v3 = a3;
  id v4 = pre_signpost_handle();
  int ptr = 7;
  os_signpost_id_t v5 = os_signpost_id_make_with_pointer(v4, &ptr);

  os_signpost_id_t v6 = pre_signpost_handle();
  uint64_t v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA622000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PRE-ClipMessage", "Start", buf, 2u);
  }

  if ((unint64_t)[v3 length] >= 0x231)
  {
    id v8 = [NSString alloc];
    id v9 = [v3 substringToIndex:280];
    id v10 = objc_msgSend(v3, "substringFromIndex:", objc_msgSend(v3, "length") - 280);
    uint64_t v11 = [v8 initWithFormat:@"%@%@", v9, v10];

    id v3 = (id)v11;
  }
  uint64_t v12 = pre_signpost_handle();
  id v13 = v12;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)uint64_t v15 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA622000, v13, OS_SIGNPOST_INTERVAL_END, v5, "PRE-ClipMessage", "Completed", v15, 2u);
  }

  return v3;
}

- (void)setIncludeResponsesToRobots:(BOOL)a3
{
  self->_includeResponsesToRobots = a3;
}

- (void)setIncludeCustomResponses:(BOOL)a3
{
  self->_includeCustomResponses = a3;
}

- (void)setCachedResponsesGeneratedEvent:(id)a3
{
  id v4 = a3;
  guardedCachedResponsesGeneratedEvent = self->_guardedCachedResponsesGeneratedEvent;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__PREResponsesExperiment_setCachedResponsesGeneratedEvent___block_invoke;
  v7[3] = &unk_1E65B1CB0;
  id v8 = v4;
  id v6 = v4;
  [(_PASLock *)guardedCachedResponsesGeneratedEvent runWithLockAcquired:v7];
}

uint64_t __59__PREResponsesExperiment_setCachedResponsesGeneratedEvent___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setEvent:*(void *)(a1 + 32)];
}

- (id)cachedResponsesGeneratedEvent
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__1910;
  id v10 = __Block_byref_object_dispose__1911;
  id v11 = 0;
  guardedCachedResponsesGeneratedEvent = self->_guardedCachedResponsesGeneratedEvent;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__PREResponsesExperiment_cachedResponsesGeneratedEvent__block_invoke;
  v5[3] = &unk_1E65B1C88;
  v5[4] = &v6;
  [(_PASLock *)guardedCachedResponsesGeneratedEvent runWithLockAcquired:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __55__PREResponsesExperiment_cachedResponsesGeneratedEvent__block_invoke(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [a2 event];

  return MEMORY[0x1F41817F8]();
}

- (PREResponsesExperiment)init
{
  id v3 = +[PREExperimentResolver sharedInstance];
  id v4 = objc_opt_new();
  os_signpost_id_t v5 = +[PREResponsesClient sharedInstance];
  uint64_t v6 = [MEMORY[0x1E4F962A8] sharedManager];
  uint64_t v7 = [MEMORY[0x1E4FAE3D8] sharedPreferencesController];
  uint64_t v8 = [(PREResponsesExperiment *)self initWithExperimentResolver:v3 metricsClient:v4 xpcClient:v5 rkClient:v6 tiPreferencesController:v7];

  return v8;
}

- (PREResponsesExperiment)initWithExperimentResolver:(id)a3 metricsClient:(id)a4 xpcClient:(id)a5 rkClient:(id)a6 tiPreferencesController:(id)a7
{
  id v31 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v33.receiver = self;
  v33.super_class = (Class)PREResponsesExperiment;
  id v17 = [(PREResponsesExperiment *)&v33 init];
  dispatch_block_t v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_experimentResolver, a3);
    objc_storeStrong((id *)&v18->_metrics, a4);
    objc_storeStrong((id *)&v18->_xpcClient, a5);
    objc_storeStrong((id *)&v18->_rkClient, a6);
    objc_storeStrong((id *)&v18->_tiPreferencesController, a7);
    uint64_t v19 = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.proactive.experiments.responses"];
    defaults = v18->_defaults;
    v18->_defaults = (NSUserDefaults *)v19;

    uint64_t v21 = [objc_alloc(MEMORY[0x1E4F93B48]) initWithCountLimit:50];
    responsesGeneratedCache = v18->_responsesGeneratedCache;
    v18->_responsesGeneratedCache = (_PASLRUCache *)v21;

    id v23 = objc_alloc(MEMORY[0x1E4F93B70]);
    os_signpost_id_t v24 = objc_opt_new();
    uint64_t v25 = [v23 initWithGuardedData:v24];
    guardedCachedResponsesGeneratedEvent = v18->_guardedCachedResponsesGeneratedEvent;
    v18->_guardedCachedResponsesGeneratedEvent = (_PASLock *)v25;

    v18->_useResponseKitAsFallback = 1;
    *(_DWORD *)&v18->_registerDisplayed = 16843009;
    uint64_t v27 = objc_opt_new();
    exemptTermsDetector = v18->_exemptTermsDetector;
    v18->_exemptTermsDetector = (PREPredictionExemptTermsDetector *)v27;

    int v29 = pre_responses_handle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1CA622000, v29, OS_LOG_TYPE_DEFAULT, "PREResponsesExperiment init", buf, 2u);
    }
  }
  return v18;
}

+ (BOOL)_isStringEmpty:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F1CA98] null];
    if ([v3 isEqual:v4]) {
      char v5 = 1;
    }
    else {
      char v5 = [v3 isEqualToString:&stru_1F24E3FB8];
    }
  }
  else
  {
    char v5 = 1;
  }

  return v5;
}

+ (int)_preInputMethodFrom:(id)a3
{
  uint64_t v3 = [a3 unsignedIntegerValue];
  if (v3 == 1) {
    int v4 = 2;
  }
  else {
    int v4 = 1;
  }
  if (v3 == 2) {
    return 3;
  }
  else {
    return v4;
  }
}

+ (id)_inputMethodStringFrom:(int)a3
{
  if (a3 > 5) {
    return @"canned";
  }
  else {
    return off_1E65B1FE8[a3];
  }
}

+ (id)_suggestionsWithDynamicResponseItems:(id)a3 cannedResponseItems:(id)a4 inputPreferences:(id)a5
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_opt_new();
  id v11 = objc_opt_class();
  if (v7)
  {
    obuint64_t j = [v11 stringArrayFromPreResponseItems:v8];
    uint64_t v12 = [obj indexOfObject:@"SMART_REPLIES_MARKER"];
    if (v12 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v13 = 0;
    }
    else {
      uint64_t v13 = v12;
    }
    uint64_t v41 = v13;
    id v44 = v8;
    uint64_t v42 = +[PREResponsesExperiment _suggestionsWithDynamicResponseItems:0 cannedResponseItems:v8 inputPreferences:v9];
    id v43 = v9;
    id v14 = [(id)objc_opt_class() _getFormattedPREResponseItems:v7 inputPreferences:v9];
    id v15 = objc_opt_new();
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v16 = v14;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v51 objects:v60 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v52;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v52 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = [*(id *)(*((void *)&v51 + 1) + 8 * i) replyText];
          id v22 = objc_opt_new();
          id v23 = (void *)[v21 copy];
          [v22 setTitle:v23];

          [v22 setDynamicReply:1];
          [v15 addObject:v22];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v51 objects:v60 count:16];
      }
      while (v18);
    }

    os_signpost_id_t v24 = v42;
    [v10 addObjectsFromArray:v42];
    if ([v15 count])
    {
      uint64_t v25 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v41, objc_msgSend(v15, "count"));
      [v10 insertObjects:v15 atIndexes:v25];

      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id v26 = v42;
      uint64_t v27 = [v26 countByEnumeratingWithState:&v47 objects:v59 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v48;
        do
        {
          for (uint64_t j = 0; j != v28; ++j)
          {
            if (*(void *)v48 != v29) {
              objc_enumerationMutation(v26);
            }
            uint64_t v31 = *(void *)(*((void *)&v47 + 1) + 8 * j);
            if (!+[PREResponsesExperiment _shouldInsertSuggestion:v31 forExistingSuggestions:v15])
            {
              v46[0] = MEMORY[0x1E4F143A8];
              v46[1] = 3221225472;
              v46[2] = __100__PREResponsesExperiment__suggestionsWithDynamicResponseItems_cannedResponseItems_inputPreferences___block_invoke;
              v46[3] = &unk_1E65B1F70;
              v46[4] = v31;
              uint64_t v32 = [v10 indexOfObjectWithOptions:2 passingTest:v46];
              if (v32 != 0x7FFFFFFFFFFFFFFFLL) {
                [v10 removeObjectAtIndex:v32];
              }
            }
          }
          uint64_t v28 = [v26 countByEnumeratingWithState:&v47 objects:v59 count:16];
        }
        while (v28);
      }

      os_signpost_id_t v24 = v42;
    }
  }
  else
  {
    [v11 _getFormattedPREResponseItems:v8 inputPreferences:v9];
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v33 = [obj countByEnumeratingWithState:&v55 objects:v61 count:16];
    if (!v33) {
      goto LABEL_35;
    }
    uint64_t v34 = v33;
    id v43 = v9;
    id v44 = v8;
    uint64_t v35 = *(void *)v56;
    do
    {
      for (uint64_t k = 0; k != v34; ++k)
      {
        if (*(void *)v56 != v35) {
          objc_enumerationMutation(obj);
        }
        id v37 = [*(id *)(*((void *)&v55 + 1) + 8 * k) replyText];
        if (([v37 isEqualToString:@"SMART_REPLIES_MARKER"] & 1) == 0)
        {
          id v38 = objc_opt_new();
          id v39 = (void *)[v37 copy];
          [v38 setTitle:v39];

          [v10 addObject:v38];
        }
      }
      uint64_t v34 = [obj countByEnumeratingWithState:&v55 objects:v61 count:16];
    }
    while (v34);
  }
  id v9 = v43;
  id v8 = v44;
LABEL_35:

  return v10;
}

uint64_t __100__PREResponsesExperiment__suggestionsWithDynamicResponseItems_cannedResponseItems_inputPreferences___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  int v4 = [v2 title];
  char v5 = [v3 title];

  uint64_t v6 = [v4 isEqualToString:v5];
  return v6;
}

+ (BOOL)_shouldInsertSuggestion:(id)a3 forExistingSuggestions:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = [a3 title];
  id v7 = [v6 localizedLowercaseString];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "title", (void)v18);
        id v14 = [v13 localizedLowercaseString];
        char v15 = [v14 isEqualToString:v7];

        if (v15)
        {
          BOOL v16 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  BOOL v16 = 1;
LABEL_11:

  return v16;
}

+ (id)_cannedRepliesForLanguage:(id)a3 inputPreferences:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (_cannedRepliesForLanguage_inputPreferences__onceToken != -1) {
    dispatch_once(&_cannedRepliesForLanguage_inputPreferences__onceToken, &__block_literal_global_219);
  }
  id v7 = [(id)_cannedRepliesForLanguage_inputPreferences__store repliesForLanguage:v5];
  id v8 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = [[PREResponseItem alloc] initWithCategoryId:0 modelId:0 responseClassId:0 replySubgroupId:0 replyTextId:0 replyText:*(void *)(*((void *)&v16 + 1) + 8 * i) language:v5 isCustomResponse:0 isRobotResponse:0];
        [v8 addObject:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  return v8;
}

void __69__PREResponsesExperiment__cannedRepliesForLanguage_inputPreferences___block_invoke()
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2050000000;
  v0 = (void *)getWRCannedRepliesStoreClass_softClass;
  uint64_t v8 = getWRCannedRepliesStoreClass_softClass;
  if (!getWRCannedRepliesStoreClass_softClass)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __getWRCannedRepliesStoreClass_block_invoke;
    v4[3] = &unk_1E65B1F98;
    v4[4] = &v5;
    __getWRCannedRepliesStoreClass_block_invoke((uint64_t)v4);
    v0 = (void *)v6[3];
  }
  uint64_t v1 = v0;
  _Block_object_dispose(&v5, 8);
  uint64_t v2 = [[v1 alloc] initWithCategory:1];
  id v3 = (void *)_cannedRepliesForLanguage_inputPreferences__store;
  _cannedRepliesForLanguage_inputPreferences__store = v2;
}

+ (id)stringArrayFromPreResponseItems:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  int v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v19 + 1) + 8 * v9);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v4 addObject:v10];
          uint64_t v11 = pre_responses_handle();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)long long buf = 0;
            uint64_t v12 = v11;
            uint64_t v13 = "PREResponsesExperiment unexpectedly received NSString when expecting PREResponseItem";
            uint32_t v14 = 2;
LABEL_17:
            _os_log_fault_impl(&dword_1CA622000, v12, OS_LOG_TYPE_FAULT, v13, buf, v14);
          }
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            char v15 = [v10 replyText];

            if (!v15) {
              goto LABEL_14;
            }
            uint64_t v11 = [v10 replyText];
            [v4 addObject:v11];
          }
          else
          {
            uint64_t v11 = pre_responses_handle();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
            {
              uint64_t v16 = objc_opt_class();
              *(_DWORD *)long long buf = 138543619;
              uint64_t v24 = v16;
              __int16 v25 = 2117;
              id v26 = v10;
              uint64_t v12 = v11;
              uint64_t v13 = "PREResponsesExperiment unexpectedly received unknown object %{public}@ (%{sensitive}@) when expectin"
                    "g PREResponseItem";
              uint32_t v14 = 22;
              goto LABEL_17;
            }
          }
        }

LABEL_14:
        ++v9;
      }
      while (v7 != v9);
      uint64_t v17 = [v5 countByEnumeratingWithState:&v19 objects:v27 count:16];
      uint64_t v7 = v17;
    }
    while (v17);
  }

  return v4;
}

+ (id)_getFormattedPREResponseItems:(id)a3 inputPreferences:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  if (v5)
  {
    if ([v6 BOOLForKey:9])
    {
      id v8 = v5;
    }
    else
    {
      objc_msgSend(v5, "_pas_mappedArrayWithTransform:", &__block_literal_global_196);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

PREResponseItem *__73__PREResponsesExperiment__getFormattedPREResponseItems_inputPreferences___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 replyText];
  int v4 = [v3 isEqualToString:@"SMART_REPLIES_MARKER"];

  if (v4) {
    goto LABEL_4;
  }
  id v5 = [v2 isCustomResponse];
  int v6 = [v5 BOOLValue];

  if (v6
    || ([v2 isRobotResponse],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 BOOLValue],
        v7,
        v8))
  {
LABEL_4:
    uint64_t v9 = (PREResponseItem *)v2;
  }
  else
  {
    long long v21 = [PREResponseItem alloc];
    long long v19 = [v2 categoryId];
    uint64_t v11 = [v2 modelId];
    uint64_t v12 = [v2 responseClassId];
    uint64_t v13 = [v2 replySubgroupId];
    uint32_t v14 = [v2 replyTextId];
    long long v20 = [v2 replyText];
    char v15 = [v20 localizedLowercaseString];
    uint64_t v16 = [v2 language];
    uint64_t v17 = [v2 isCustomResponse];
    long long v18 = [v2 isRobotResponse];
    uint64_t v9 = [(PREResponseItem *)v21 initWithCategoryId:v19 modelId:v11 responseClassId:v12 replySubgroupId:v13 replyTextId:v14 replyText:v15 language:v16 isCustomResponse:v17 isRobotResponse:v18];
  }

  return v9;
}

+ (id)_getConversationHistoryFromRequest:(id)a3
{
  v59[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"dateSent" ascending:1];
  id v5 = [v3 receivedMessages];
  uint64_t v45 = (void *)v4;
  v59[0] = v4;
  int v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:1];
  uint64_t v7 = [v5 sortedArrayUsingDescriptors:v6];

  id v46 = v3;
  int v8 = [v3 senderMessages];
  uint64_t v9 = objc_opt_new();
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v52 objects:v58 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v53 != v13) {
          objc_enumerationMutation(v10);
        }
        char v15 = *(void **)(*((void *)&v52 + 1) + 8 * i);
        if (([v15 isTapBack] & 1) == 0 && (objc_msgSend(v15, "isEmote") & 1) == 0)
        {
          uint64_t v16 = [v15 title];
          uint64_t v17 = (void *)v16;
          long long v18 = &stru_1F24E3FB8;
          if (v16) {
            long long v18 = (__CFString *)v16;
          }
          long long v19 = v18;

          id v20 = objc_alloc(MEMORY[0x1E4F5D9C0]);
          long long v21 = [v15 senderIdentifier];
          long long v22 = [v15 dateSent];
          uint64_t v23 = (void *)[v20 initWithText:v19 senderID:v21 timestamp:v22];

          [v9 addObject:v23];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v52 objects:v58 count:16];
    }
    while (v12);
  }

  long long v47 = v9;
  uint64_t v24 = [v9 lastObject];
  __int16 v25 = [v24 timestamp];

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v26 = v8;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v48 objects:v57 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v49;
    do
    {
      for (uint64_t j = 0; j != v28; ++j)
      {
        if (*(void *)v49 != v29) {
          objc_enumerationMutation(v26);
        }
        if (v25)
        {
          uint64_t v31 = *(void **)(*((void *)&v48 + 1) + 8 * j);
          uint64_t v32 = [v31 dateSent];
          uint64_t v33 = [v32 laterDate:v25];

          if (!v33 && ([v31 isTapBack] & 1) == 0 && (objc_msgSend(v31, "isEmote") & 1) == 0)
          {
            uint64_t v34 = [v31 title];
            uint64_t v35 = (void *)v34;
            id v36 = &stru_1F24E3FB8;
            if (v34) {
              id v36 = (__CFString *)v34;
            }
            id v37 = v36;

            id v38 = objc_alloc(MEMORY[0x1E4F5D9C0]);
            id v39 = [v31 senderIdentifier];
            id v40 = [v31 dateSent];
            uint64_t v41 = (void *)[v38 initWithText:v37 senderID:v39 timestamp:v40];

            [v47 addObject:v41];
          }
        }
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v48 objects:v57 count:16];
    }
    while (v28);
  }

  uint64_t v42 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"timestamp" ascending:1];
  long long v56 = v42;
  id v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v56 count:1];
  [v47 sortUsingDescriptors:v43];

  return v47;
}

+ (BOOL)_isPreferredLocaleValid:(id)a3
{
  return (unint64_t)[a3 length] > 1;
}

+ (id)_rawStringsForMessages:(id)a3 excludingTapBacks:(BOOL)a4
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67__PREResponsesExperiment__rawStringsForMessages_excludingTapBacks___block_invoke;
  v6[3] = &__block_descriptor_33_e49___NSString_16__0__PREResponsesExperimentMessage_8l;
  BOOL v7 = a4;
  uint64_t v4 = objc_msgSend(a3, "_pas_mappedArrayWithTransform:", v6);

  return v4;
}

id __67__PREResponsesExperiment__rawStringsForMessages_excludingTapBacks___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (*(unsigned char *)(a1 + 32) && ([v3 isTapBack] & 1) != 0)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = [v4 title];
  }

  return v5;
}

+ (id)sharedManager
{
  if (sharedManager__pasOnceToken379 != -1) {
    dispatch_once(&sharedManager__pasOnceToken379, &__block_literal_global_1937);
  }
  id v2 = (void *)sharedManager__pasExprOnceResult;

  return v2;
}

void __39__PREResponsesExperiment_sharedManager__block_invoke()
{
  v0 = (void *)MEMORY[0x1CB799590]();
  uint64_t v1 = objc_opt_new();
  id v2 = (void *)sharedManager__pasExprOnceResult;
  sharedManager__pasExprOnceResult = v1;
}

@end