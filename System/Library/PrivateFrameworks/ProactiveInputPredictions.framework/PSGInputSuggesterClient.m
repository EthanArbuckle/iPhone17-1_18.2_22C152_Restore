@interface PSGInputSuggesterClient
+ (BOOL)_allowSingleCharacterContactsAutocompleteTriggerForLanguage:(id)a3;
+ (BOOL)_shouldGenerateWordBoundaryPredictionsForContext:(id)a3 localeIdentifier:(id)a4;
+ (BOOL)_zkwItemsContainsOnlyTextualResponses:(id)a3;
+ (PSGInputSuggesterClient)sharedInstance;
+ (id)_getContactsAutocompleteItemForQueryField:(id)a3 searchTerm:(id)a4 localeIdentifier:(id)a5;
+ (id)_getQueryFieldFromTextContentType:(id)a3;
- (PSGInputSuggesterClient)init;
- (PSGInputSuggesterClient)initWithStructuredInfoCache:(id)a3;
- (id)_appConnectionTriggerForTextContentType:(id)a3;
- (id)_cachedStructuredSuggestionsForContext:(id)a3 localeIdentifier:(id)a4 maxSuggestions:(unint64_t)a5;
- (id)_combineMLAndRKItems:(id)a3 mlItems:(id)a4;
- (id)_fillSuggestionsForResponseItems:(id)a3 localeIdentifier:(id)a4 recipients:(id)a5 recipientNames:(id)a6 bundleIdentifier:(id)a7 timeoutSeconds:(double)a8 structuredInfoFetchLimit:(unint64_t)a9 availableApps:(id)a10 textualResponseLimit:(unint64_t)a11 structuredInfoLimit:(unint64_t)a12 totalSuggestionsLimit:(unint64_t)a13 explanationSet:(id)a14 error:(id *)a15;
- (id)_getFTLinkShareTrigger;
- (id)_getWordBoundaryResultForRequest:(id)a3 explanationSet:(id)a4;
- (id)_getZKWResultsForRequest:(id)a3 explanationSet:(id)a4;
- (id)_logTriggerForItems:(id)a3 request:(id)a4;
- (id)_maybeModifyTrigger:(id)a3 bundleIdentifier:(id)a4;
- (id)_remoteObjectProxy;
- (id)_responseKitPredictionsForContext:(id)a3 bundleIdentifier:(id)a4 conversationTurns:(id)a5 languageID:(id)a6 adaptationContextID:(id)a7 shouldDisableAutoCaps:(BOOL)a8 maximumResponses:(unint64_t)a9 isBlacklisted:(BOOL)a10;
- (id)_rewriteMoneyAttributes:(id)a3;
- (id)_rkResponsesForContext:(id)a3 conversationTurns:(id)a4 languageID:(id)a5 maximumResponses:(unint64_t)a6 shouldDisableAutoCaps:(BOOL)a7 adaptationContextID:(id)a8;
- (id)_textualSuggestionsAndTriggersForRequest:(id)a3 explanationSet:(id)a4;
- (id)_wordBoundaryPredictionsForContext:(id)a3 localeIdentifier:(id)a4 textContentType:(id)a5 recipientNames:(id)a6 availableApps:(id)a7 request:(id)a8 explanationSet:(id)a9;
- (void)inputSuggestionsWithRequest:(id)a3 completion:(id)a4;
- (void)logEngagement:(id)a3 request:(id)a4 position:(unint64_t)a5;
- (void)logErrorForRequest:(id)a3 trigger:(id)a4 errorType:(unsigned __int8)a5;
- (void)logImpression:(id)a3 request:(id)a4;
- (void)logPrediction:(id)a3 request:(id)a4 latencyMillis:(double)a5;
- (void)logSpeedMetricForLocaleIdentifier:(id)a3 messageDurationMilliseconds:(int)a4 messageLength:(int)a5 messageWords:(int)a6;
- (void)logTrigger:(id)a3 request:(id)a4;
- (void)warmUpWithCompletion:(id)a3;
@end

@implementation PSGInputSuggesterClient

- (void)warmUpWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(PSGInputSuggesterClient *)self _remoteObjectProxy];
  [v5 warmUpWithCompletion:v4];
}

- (id)_remoteObjectProxy
{
  return (id)[(_PASXPCClientHelper *)self->_clientHelper remoteObjectProxy];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggeringCache, 0);
  objc_storeStrong((id *)&self->_structuredSuggestionCache, 0);
  objc_storeStrong((id *)&self->_clientHelper, 0);
}

- (void)logSpeedMetricForLocaleIdentifier:(id)a3 messageDurationMilliseconds:(int)a4 messageLength:(int)a5 messageWords:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a4;
  id v10 = a3;
  id v11 = [(PSGInputSuggesterClient *)self _remoteObjectProxy];
  [v11 logSpeedMetricForLocaleIdentifier:v10 messageDurationMilliseconds:v8 messageLength:v7 messageWords:v6];
}

- (id)_logTriggerForItems:(id)a3 request:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v6;
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
        v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v14 = objc_msgSend(v13, "structuredInfoSuggestion", (void)v18);

        if (v14)
        {
          v15 = [v13 structuredInfoSuggestion];
          v16 = [v15 proactiveTrigger];

          if (v16)
          {
            [(PSGInputSuggesterClient *)self logTrigger:v16 request:v7];
            goto LABEL_12;
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  v16 = 0;
LABEL_12:

  return v16;
}

- (void)logErrorForRequest:(id)a3 trigger:(id)a4 errorType:(unsigned __int8)a5
{
  uint64_t v5 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [(PSGInputSuggesterClient *)self _remoteObjectProxy];
  [v10 logErrorForRequest:v9 trigger:v8 errorType:v5];
}

- (void)logEngagement:(id)a3 request:(id)a4 position:(unint64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(PSGInputSuggesterClient *)self _remoteObjectProxy];
  [v10 logEngagement:v9 request:v8 position:a5];
}

- (void)logImpression:(id)a3 request:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PSGInputSuggesterClient *)self _remoteObjectProxy];
  [v8 logImpression:v7 request:v6];
}

- (void)logPrediction:(id)a3 request:(id)a4 latencyMillis:(double)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(PSGInputSuggesterClient *)self _remoteObjectProxy];
  [v10 logPrediction:v9 request:v8 latencyMillis:a5];
}

- (void)logTrigger:(id)a3 request:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PSGInputSuggesterClient *)self _remoteObjectProxy];
  [v8 logTrigger:v7 request:v6];
}

- (void)inputSuggestionsWithRequest:(id)a3 completion:(id)a4
{
  uint64_t v91 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, PSGInputSuggestionsResponse *, id))a4;
  id v8 = psg_default_log_handle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_20A02A000, v8, OS_LOG_TYPE_DEBUG, "[Client] inputSuggestionsWithRequest called", buf, 2u);
  }

  if (inputSuggestionsWithRequest_completion__onceToken != -1) {
    dispatch_once(&inputSuggestionsWithRequest_completion__onceToken, &__block_literal_global_119);
  }
  uint64_t v9 = mach_absolute_time();
  id v10 = [v6 localeIdentifier];
  uint64_t v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    v13 = [MEMORY[0x263EFF960] currentLocale];
    id v12 = [v13 localeIdentifier];
  }
  v14 = +[PSGUtilities sharedInstance];
  v15 = [v14 prewarmCacheForLocale:v12 usingQueue:inputSuggestionsWithRequest_completion__prewarmQueue];

  v16 = objc_opt_new();
  v17 = [v6 textContentType];
  uint64_t v18 = [v17 length];

  uint64_t v82 = v9;
  if (v18)
  {
    long long v19 = psg_default_log_handle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_20A02A000, v19, OS_LOG_TYPE_DEBUG, "Skip prefix-based structured info cache lookup for tagged text field.", buf, 2u);
    }
    long long v20 = 0;
  }
  else
  {
    long long v19 = [v6 contextBeforeInput];
    long long v21 = [v6 localeIdentifier];
    long long v20 = -[PSGInputSuggesterClient _cachedStructuredSuggestionsForContext:localeIdentifier:maxSuggestions:](self, "_cachedStructuredSuggestionsForContext:localeIdentifier:maxSuggestions:", v19, v21, [v6 structuredInfoLimit]);
  }
  uint64_t v22 = [v20 count];
  uint64_t v23 = psg_default_log_handle();
  v24 = v23;
  v81 = self;
  if (v22)
  {
    double v25 = -1.0;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      uint64_t v26 = [v20 count];
      *(_DWORD *)buf = 134217984;
      double v88 = *(double *)&v26;
      _os_log_impl(&dword_20A02A000, v24, OS_LOG_TYPE_INFO, "Got %tu item(s) from structured suggestions cache", buf, 0xCu);
    }
    id v27 = 0;
    uint64_t v28 = 0xFFFFFFFFLL;
    double v29 = -1.0;
  }
  else
  {
    v80 = v16;
    os_signpost_id_t v30 = os_signpost_id_generate(v23);

    v31 = psg_default_log_handle();
    v32 = v31;
    if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_20A02A000, v32, OS_SIGNPOST_INTERVAL_BEGIN, v30, "PSGInputSuggesterClient_inputSuggestionsWithRequest_triggering", (const char *)&unk_20A040562, buf, 2u);
    }

    uint64_t v33 = mach_absolute_time();
    v24 = [(PSGInputSuggesterClient *)self _textualSuggestionsAndTriggersForRequest:v6 explanationSet:v80];

    double v25 = *(double *)&inputSuggestionsWithRequest_completion__timeMillisMultiplier
        * (double)(mach_absolute_time() - v33);
    v34 = psg_default_log_handle();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      double v88 = v25;
      _os_log_debug_impl(&dword_20A02A000, v34, OS_LOG_TYPE_DEBUG, "[Client] Triggering time: %.1f ms", buf, 0xCu);
    }

    v35 = psg_default_log_handle();
    v36 = v35;
    if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_20A02A000, v36, OS_SIGNPOST_INTERVAL_END, v30, "PSGInputSuggesterClient_inputSuggestionsWithRequest_triggering", (const char *)&unk_20A040562, buf, 2u);
    }

    uint64_t v79 = [v24 count];
    v37 = psg_default_log_handle();
    os_signpost_id_t v38 = os_signpost_id_generate(v37);

    v39 = psg_default_log_handle();
    v40 = v39;
    unint64_t v78 = v38 - 1;
    if (v38 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v39))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_20A02A000, v40, OS_SIGNPOST_INTERVAL_BEGIN, v38, "PSGInputSuggesterClient_inputSuggestionsWithRequest_serving", (const char *)&unk_20A040562, buf, 2u);
    }
    os_signpost_id_t spid = v38;

    uint64_t v41 = [v24 count];
    v42 = psg_default_log_handle();
    v43 = v42;
    v16 = v80;
    if (v41)
    {
      v76 = v15;
      v77 = v7;
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v44 = [v24 count];
        *(_DWORD *)buf = 134217984;
        double v88 = *(double *)&v44;
        _os_log_impl(&dword_20A02A000, v43, OS_LOG_TYPE_DEFAULT, "[Client] Triggered %tu item(s)", buf, 0xCu);
      }

      v73 = [(PSGInputSuggesterClient *)self _logTriggerForItems:v24 request:v6];
      uint64_t v74 = mach_absolute_time();
      v45 = [v6 textContentType];
      uint64_t v46 = [v45 length];

      unint64_t v47 = [v6 structuredInfoLimit];
      if (v46) {
        double v48 = 0.5;
      }
      else {
        double v48 = 0.2;
      }
      unint64_t v49 = 100;
      if (!v46) {
        unint64_t v49 = 10;
      }
      v50 = v24;
      if (v49 <= v47) {
        unint64_t v49 = v47;
      }
      unint64_t v72 = v49;
      uint64_t v51 = [v6 recipients];
      v52 = [v6 recipientNames];
      v53 = [v6 bundleIdentifier];
      v54 = [v6 availableApps];
      v55 = self;
      uint64_t v56 = [v6 textualResponseLimit];
      id v86 = 0;
      v16 = v80;
      uint64_t v70 = [v6 structuredInfoLimit];
      uint64_t v71 = [v6 totalSuggestionsLimit];
      v57 = v55;
      v58 = (void *)v51;
      v24 = [(PSGInputSuggesterClient *)v57 _fillSuggestionsForResponseItems:v50 localeIdentifier:v12 recipients:v51 recipientNames:v52 bundleIdentifier:v53 timeoutSeconds:v72 structuredInfoFetchLimit:v48 availableApps:v54 textualResponseLimit:v56 structuredInfoLimit:v70 totalSuggestionsLimit:v71 explanationSet:v80 error:&v86];
      id v27 = v86;

      double v59 = (double)(mach_absolute_time() - v74);
      double v60 = *(double *)&inputSuggestionsWithRequest_completion__timeMillisMultiplier;
      if (v73 && [v80 count])
      {
        v83[0] = MEMORY[0x263EF8330];
        v83[1] = 3221225472;
        v83[2] = __66__PSGInputSuggesterClient_inputSuggestionsWithRequest_completion___block_invoke_123;
        v83[3] = &unk_263FCFBB0;
        v83[4] = v81;
        id v84 = v6;
        id v85 = v73;
        [v80 enumerateExplanationCodeWithBlock:v83];
      }
      double v29 = v60 * v59;
      v61 = psg_default_log_handle();
      v15 = v76;
      id v7 = v77;
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v62 = [v24 count];
        *(_DWORD *)buf = 134218240;
        double v88 = *(double *)&v62;
        __int16 v89 = 2048;
        double v90 = v29;
        _os_log_impl(&dword_20A02A000, v61, OS_LOG_TYPE_DEFAULT, "[Client] Predicted %tu item(s). Serving time: %.1f ms", buf, 0x16u);
      }
    }
    else
    {
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_20A02A000, v43, OS_LOG_TYPE_DEBUG, "[Client] No triggering item.", buf, 2u);
      }

      double v29 = -1.0;
      if (![v80 count]) {
        [v80 pushInternalExplanationCode:5];
      }
      id v27 = 0;
    }
    v63 = psg_default_log_handle();
    v64 = v63;
    if (v78 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v63))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_20A02A000, v64, OS_SIGNPOST_INTERVAL_END, spid, "PSGInputSuggesterClient_inputSuggestionsWithRequest_serving", (const char *)&unk_20A040562, buf, 2u);
    }

    if (!v27)
    {
      uint64_t v28 = v79;
      goto LABEL_57;
    }
    v65 = psg_default_log_handle();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      double v88 = *(double *)&v27;
      _os_log_error_impl(&dword_20A02A000, v65, OS_LOG_TYPE_ERROR, "[Client] error: %@", buf, 0xCu);
    }

    long long v20 = 0;
    uint64_t v28 = v79;
  }

  v24 = v20;
LABEL_57:
  double v66 = *(double *)&inputSuggestionsWithRequest_completion__timeMillisMultiplier * (double)(mach_absolute_time() - v82);
  v67 = [[PSGInputSuggestionsResponse alloc] initWithResponseItems:v24 explanationSet:v16];
  [(PSGInputSuggestionsResponse *)v67 setTriggeringTimeMillis:v25];
  [(PSGInputSuggestionsResponse *)v67 setTriggeredItemsCount:v28];
  [(PSGInputSuggestionsResponse *)v67 setServingTimeMillis:v29];
  if (-[NSObject count](v24, "count") || ([v16 hasPETLoggingData] & 1) != 0)
  {
    [(PSGInputSuggesterClient *)v81 logPrediction:v67 request:v6 latencyMillis:v66];
  }
  else
  {
    v69 = psg_default_log_handle();
    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_20A02A000, v69, OS_LOG_TYPE_DEBUG, "[Client] Skip logging predictions due to empty item set and unworthy explanation set", buf, 2u);
    }
  }
  v68 = psg_default_log_handle();
  if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    double v88 = v66;
    _os_log_impl(&dword_20A02A000, v68, OS_LOG_TYPE_DEFAULT, "[Client] Total prediction time: %.1f ms", buf, 0xCu);
  }

  v7[2](v7, v67, v27);
  if (v15) {
    dispatch_block_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
  }
}

uint64_t __66__PSGInputSuggesterClient_inputSuggestionsWithRequest_completion___block_invoke_123(uint64_t result, int a2)
{
  if (a2 == 1) {
    return [*(id *)(result + 32) logErrorForRequest:*(void *)(result + 40) trigger:*(void *)(result + 48) errorType:3];
  }
  return result;
}

void __66__PSGInputSuggesterClient_inputSuggestionsWithRequest_completion___block_invoke()
{
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  *(double *)&inputSuggestionsWithRequest_completion__timeMillisMultiplier = (double)(info.numer
                                                                                                  / info.denom)
                                                                           * 0.000001;
  uint64_t v0 = [MEMORY[0x263F61E38] autoreleasingSerialQueueWithLabel:"PSG-label-prewarm" qosClass:9];
  v1 = (void *)inputSuggestionsWithRequest_completion__prewarmQueue;
  inputSuggestionsWithRequest_completion__prewarmQueue = v0;
}

- (id)_cachedStructuredSuggestionsForContext:(id)a3 localeIdentifier:(id)a4 maxSuggestions:(unint64_t)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  if ([v8 length] && objc_msgSend(v9, "length"))
  {
    id v10 = [(PSGStructuredInfoSuggestionCache *)self->_structuredSuggestionCache searchWithContext:v8 localeIdentifier:v9 maxSuggestions:a5];
    if ([v10 count])
    {
      uint64_t v11 = objc_opt_new();
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v12 = v10;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v22;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v22 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = *(void *)(*((void *)&v21 + 1) + 8 * i);
            uint64_t v18 = [PSGInputSuggestionsResponseItem alloc];
            long long v19 = -[PSGInputSuggestionsResponseItem initWithTextualResponseSuggestion:structuredInfoSuggestion:](v18, "initWithTextualResponseSuggestion:structuredInfoSuggestion:", 0, v17, (void)v21);
            [v11 addObject:v19];
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
        }
        while (v14);
      }
    }
    else
    {
      uint64_t v11 = 0;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (id)_appConnectionTriggerForTextContentType:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ([v3 length])
  {
    id v4 = psg_default_log_handle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      int v10 = 138412290;
      id v11 = v3;
      _os_log_debug_impl(&dword_20A02A000, v4, OS_LOG_TYPE_DEBUG, "Client creating an app connection trigger for tagged text field: %@", (uint8_t *)&v10, 0xCu);
    }

    uint64_t v5 = objc_opt_new();
    [v5 setValue:@"triggerTypeConnections" forKey:*MEMORY[0x263F51238]];
    [v5 setValue:v3 forKey:@"textContentTypeTag"];
    id v6 = [[PSGProactiveTrigger alloc] initWithSourceType:2 category:@"TaggedTextFieldMeCard" attributes:v5];
    id v7 = [[PSGStructuredInfoSuggestion alloc] initWithProactiveTrigger:v6 portraitItem:0 operationalItem:0];
    id v8 = [[PSGInputSuggestionsResponseItem alloc] initWithTextualResponseSuggestion:0 structuredInfoSuggestion:v7];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)_textualSuggestionsAndTriggersForRequest:(id)a3 explanationSet:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = psg_default_log_handle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v22) = 0;
    _os_log_debug_impl(&dword_20A02A000, v8, OS_LOG_TYPE_DEBUG, "Client called to _textualSuggestionsAndTriggersForRequest", (uint8_t *)&v22, 2u);
  }

  id v9 = [v6 conversationTurns];
  int v10 = [v9 lastObject];

  if (v10
    && ([v10 senderID],
        id v11 = objc_claimAutoreleasedReturnValue(),
        uint64_t v12 = [v11 length],
        v11,
        !v12))
  {
    v16 = psg_default_log_handle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v22) = 0;
      _os_log_debug_impl(&dword_20A02A000, v16, OS_LOG_TYPE_DEBUG, "[Client] Not returning responses because the last conversation turn has an ambiguous sender", (uint8_t *)&v22, 2u);
    }
    uint64_t v17 = 0;
  }
  else
  {
    uint64_t v13 = [(_PASLRUCache *)self->_triggeringCache objectForKey:v6];
    if (v13)
    {
      uint64_t v14 = (void *)v13;
      uint64_t v15 = psg_default_log_handle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v20 = [v14 count];
        int v22 = 134218242;
        uint64_t v23 = v20;
        __int16 v24 = 2112;
        double v25 = v14;
        _os_log_debug_impl(&dword_20A02A000, v15, OS_LOG_TYPE_DEBUG, "[Client] returning from triggeringCache (%tu): %@", (uint8_t *)&v22, 0x16u);
      }
    }
    else
    {
      if ([v6 isDocumentEmpty]) {
        [(PSGInputSuggesterClient *)self _getZKWResultsForRequest:v6 explanationSet:v7];
      }
      else {
      uint64_t v14 = [(PSGInputSuggesterClient *)self _getWordBoundaryResultForRequest:v6 explanationSet:v7];
      }
      uint64_t v18 = psg_default_log_handle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v21 = [v14 count];
        int v22 = 134218242;
        uint64_t v23 = v21;
        __int16 v24 = 2112;
        double v25 = v14;
        _os_log_debug_impl(&dword_20A02A000, v18, OS_LOG_TYPE_DEBUG, "[Client] got %tu textual suggestions or triggers: %@", (uint8_t *)&v22, 0x16u);
      }

      if ([v14 count] || (objc_msgSend(v7, "hasTriggeringXPCTimeout") & 1) == 0) {
        [(_PASLRUCache *)self->_triggeringCache setObject:v14 forKey:v6];
      }
    }
    v16 = v14;
    uint64_t v17 = v16;
  }

  return v17;
}

- (id)_getWordBoundaryResultForRequest:(id)a3 explanationSet:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 contextBeforeInput];

  if (v8)
  {
    id v9 = [v6 contextBeforeInput];
    int v10 = [v6 localeIdentifier];
    id v11 = [v6 textContentType];
    uint64_t v12 = [v6 recipientNames];
    uint64_t v13 = [v6 availableApps];
    uint64_t v14 = [(PSGInputSuggesterClient *)self _wordBoundaryPredictionsForContext:v9 localeIdentifier:v10 textContentType:v11 recipientNames:v12 availableApps:v13 request:v6 explanationSet:v7];
  }
  else
  {
    uint64_t v15 = psg_default_log_handle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20A02A000, v15, OS_LOG_TYPE_DEFAULT, "Client document isn't empty, but no context before input", buf, 2u);
    }

    uint64_t v14 = 0;
  }

  return v14;
}

- (id)_getZKWResultsForRequest:(id)a3 explanationSet:(id)a4
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v36 = a4;
  id v6 = [v5 responseContext];
  v37 = [v5 textContentType];
  if (![v6 length] && !objc_msgSend(v37, "length"))
  {
    id v7 = psg_default_log_handle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20A02A000, v7, OS_LOG_TYPE_INFO, "[ZKW] Response context and content type are both empty.", buf, 2u);
    }
  }
  id v8 = psg_default_log_handle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = [v6 length];
    int v10 = [v5 localeIdentifier];
    *(_DWORD *)buf = 134218498;
    *(void *)&uint8_t buf[4] = v9;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v37;
    *(_WORD *)&buf[22] = 2112;
    uint64_t v46 = v10;
    _os_log_impl(&dword_20A02A000, v8, OS_LOG_TYPE_INFO, "Response context length: %tu, text content type: %@, locale: %@", buf, 0x20u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  uint64_t v46 = __Block_byref_object_copy__703;
  unint64_t v47 = __Block_byref_object_dispose__704;
  id v48 = 0;
  if (![v6 length]
    && ([v5 conversationTurns],
        id v11 = objc_claimAutoreleasedReturnValue(),
        BOOL v12 = [v11 count] == 0,
        v11,
        v12))
  {
    uint64_t v23 = 0;
  }
  else
  {
    dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
    uint64_t v14 = [(PSGInputSuggesterClient *)self _remoteObjectProxy];
    v39[0] = MEMORY[0x263EF8330];
    v39[1] = 3221225472;
    v39[2] = __67__PSGInputSuggesterClient__getZKWResultsForRequest_explanationSet___block_invoke;
    v39[3] = &unk_263FCFB48;
    uint64_t v41 = buf;
    uint64_t v15 = v13;
    v40 = v15;
    [v14 inputSuggestionsWithRequest:v5 completion:v39];

    v16 = [v5 bundleIdentifier];
    uint64_t v17 = [v5 responseKitConversationTurns];
    uint64_t v18 = [v5 localeIdentifier];
    long long v19 = [v5 adaptationContextID];
    uint64_t v20 = [v5 shouldDisableAutoCaps];
    uint64_t v21 = [v5 textualResponseLimit];
    uint64_t v22 = [v5 structuredInfoLimit];
    LOBYTE(v35) = [v5 isResponseContextBlacklisted];
    uint64_t v23 = [(PSGInputSuggesterClient *)self _responseKitPredictionsForContext:v6 bundleIdentifier:v16 conversationTurns:v17 languageID:v18 adaptationContextID:v19 shouldDisableAutoCaps:v20 maximumResponses:v22 + v21 isBlacklisted:v35];

    if ([MEMORY[0x263F61E38] waitForSemaphore:v15 timeoutSeconds:0.1] == 1)
    {
      __int16 v24 = psg_default_log_handle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v43 = 134217984;
        uint64_t v44 = 0x3FB999999999999ALL;
        _os_log_impl(&dword_20A02A000, v24, OS_LOG_TYPE_DEFAULT, "[ZKW] timed out trying to fetch ML results (threshold: %.3f s)", v43, 0xCu);
      }

      [(PSGInputSuggesterClient *)self logErrorForRequest:v5 trigger:0 errorType:2];
      [v36 pushInternalExplanationCode:7];
    }
  }
  if ([v37 length]
    && ([v5 textContentType],
        double v25 = objc_claimAutoreleasedReturnValue(),
        [(PSGInputSuggesterClient *)self _appConnectionTriggerForTextContentType:v25], uint64_t v26 = objc_claimAutoreleasedReturnValue(), v25, v26))
  {
    v42 = v26;
    id v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v42 count:1];
    uint64_t v28 = [(PSGInputSuggesterClient *)self _combineMLAndRKItems:v23 mlItems:*(void *)(*(void *)&buf[8] + 40)];
    if (v28)
    {
      uint64_t v29 = [v27 arrayByAddingObjectsFromArray:v28];

      id v27 = (void *)v29;
    }
  }
  else
  {
    id v27 = [(PSGInputSuggesterClient *)self _combineMLAndRKItems:v23 mlItems:*(void *)(*(void *)&buf[8] + 40)];
    uint64_t v26 = 0;
  }
  if ([v6 length]
    || ![(id)objc_opt_class() _zkwItemsContainsOnlyTextualResponses:v27])
  {
    v32 = psg_default_log_handle();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v34 = [v27 count];
      *(_DWORD *)v43 = 134217984;
      uint64_t v44 = v34;
      _os_log_debug_impl(&dword_20A02A000, v32, OS_LOG_TYPE_DEBUG, "[ZKW] %tu zkw item(s)", v43, 0xCu);
    }

    id v31 = v27;
  }
  else
  {
    os_signpost_id_t v30 = psg_default_log_handle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v43 = 0;
      _os_log_impl(&dword_20A02A000, v30, OS_LOG_TYPE_INFO, "[ZKW] Not providing responses for outgoing turns because there are no structured items", v43, 2u);
    }

    id v31 = 0;
  }

  _Block_object_dispose(buf, 8);
  return v31;
}

void __67__PSGInputSuggesterClient__getZKWResultsForRequest_explanationSet___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = psg_default_log_handle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138412290;
      uint64_t v13 = (uint64_t)v6;
      _os_log_error_impl(&dword_20A02A000, v7, OS_LOG_TYPE_ERROR, "[ZKW] Error from triggering XPC: %@", (uint8_t *)&v12, 0xCu);
    }
LABEL_7:

    goto LABEL_8;
  }
  if (v5)
  {
    uint64_t v8 = [v5 responseItems];
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    int v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    id v7 = psg_default_log_handle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v11 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) count];
      int v12 = 134217984;
      uint64_t v13 = v11;
      _os_log_debug_impl(&dword_20A02A000, v7, OS_LOG_TYPE_DEBUG, "[ZKW] xpc call returned %tu ML item(s)", (uint8_t *)&v12, 0xCu);
    }
    goto LABEL_7;
  }
LABEL_8:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_combineMLAndRKItems:(id)a3 mlItems:(id)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = psg_default_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    uint64_t v42 = [v5 count];
    __int16 v43 = 2048;
    uint64_t v44 = [v6 count];
    _os_log_debug_impl(&dword_20A02A000, v7, OS_LOG_TYPE_DEBUG, "[Client] combining %tu rk item(s) & %tu ml item(s)", buf, 0x16u);
  }

  if ([v6 count])
  {
    if ([v5 count])
    {
      uint64_t v34 = v6;
      id v35 = v5;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v8 = v5;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v36 objects:v40 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v37;
        while (2)
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v37 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void **)(*((void *)&v36 + 1) + 8 * i);
            uint64_t v14 = objc_msgSend(v13, "textualResponseSuggestion", v34);
            if (v14)
            {
              uint64_t v15 = (void *)v14;
              v16 = [v13 textualResponseSuggestion];
              uint64_t v17 = [v16 responseCategory];
              int v18 = [v17 isEqualToString:@"QueryAlternative"];

              if (v18)
              {
                __int16 v24 = psg_default_log_handle();
                if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_20A02A000, v24, OS_LOG_TYPE_INFO, "[Client] rk query alternative category found, discarding ml results", buf, 2u);
                }
                goto LABEL_29;
              }
            }
            uint64_t v19 = [v13 structuredInfoSuggestion];
            if (v19)
            {
              uint64_t v20 = (void *)v19;
              uint64_t v21 = [v13 structuredInfoSuggestion];
              uint64_t v22 = [v21 proactiveTrigger];

              if (v22)
              {
                __int16 v24 = psg_default_log_handle();
                if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
                {
                  double v25 = [v13 structuredInfoSuggestion];
                  uint64_t v26 = [v25 proactiveTrigger];
                  id v27 = [v26 triggerAttributes];
                  *(_DWORD *)buf = 138412290;
                  uint64_t v42 = (uint64_t)v27;
                  _os_log_impl(&dword_20A02A000, v24, OS_LOG_TYPE_INFO, "[Client] rk proactive trigger (%@) found, discarding ml results", buf, 0xCu);
                }
LABEL_29:
                id v6 = v34;
                id v5 = v35;

                uint64_t v23 = psg_default_log_handle();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
                {
                  uint64_t v31 = [v8 count];
                  *(_DWORD *)buf = 134217984;
                  uint64_t v42 = v31;
                  _os_log_debug_impl(&dword_20A02A000, v23, OS_LOG_TYPE_DEBUG, "[Client] proactive trigger or alternative category is matched -- using rk results (%tu)", buf, 0xCu);
                }
                goto LABEL_31;
              }
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v36 objects:v40 count:16];
          if (v10) {
            continue;
          }
          break;
        }
      }

      uint64_t v23 = psg_default_log_handle();
      id v6 = v34;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v33 = [v34 count];
        *(_DWORD *)buf = 134217984;
        uint64_t v42 = v33;
        _os_log_debug_impl(&dword_20A02A000, v23, OS_LOG_TYPE_DEBUG, "[Client] discarding rk responses and using ml results (%tu)", buf, 0xCu);
      }
      id v8 = v34;
      id v5 = v35;
    }
    else
    {
      uint64_t v23 = psg_default_log_handle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v32 = [v6 count];
        *(_DWORD *)buf = 134217984;
        uint64_t v42 = v32;
        _os_log_debug_impl(&dword_20A02A000, v23, OS_LOG_TYPE_DEBUG, "[Client] no rk responses and using ml results (%tu)", buf, 0xCu);
      }
      id v8 = v6;
    }
  }
  else
  {
    uint64_t v23 = psg_default_log_handle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v30 = [v5 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v42 = v30;
      _os_log_debug_impl(&dword_20A02A000, v23, OS_LOG_TYPE_DEBUG, "[Client] no ml items, returning rk results (%tu)", buf, 0xCu);
    }
    id v8 = v5;
  }
LABEL_31:

  id v28 = v8;
  return v28;
}

- (id)_wordBoundaryPredictionsForContext:(id)a3 localeIdentifier:(id)a4 textContentType:(id)a5 recipientNames:(id)a6 availableApps:(id)a7 request:(id)a8 explanationSet:(id)a9
{
  v66[1] = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v52 = a7;
  id v51 = a8;
  id v53 = a9;
  if (![v15 length] || !objc_msgSend(v16, "length"))
  {
    uint64_t v20 = psg_default_log_handle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      *(void *)&uint8_t buf[4] = [v15 length];
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v16;
      _os_log_impl(&dword_20A02A000, v20, OS_LOG_TYPE_DEFAULT, "Tried to get word boundary predications but either locale or context were missing {context length: %tu locale: %@}", buf, 0x16u);
    }
    goto LABEL_31;
  }
  uint64_t v19 = psg_default_log_handle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218754;
    *(void *)&uint8_t buf[4] = [v15 length];
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v16;
    *(_WORD *)&buf[22] = 2048;
    v63 = (uint64_t (*)(uint64_t, uint64_t))[v18 count];
    LOWORD(v64) = 2112;
    *(void *)((char *)&v64 + 2) = v17;
    _os_log_impl(&dword_20A02A000, v19, OS_LOG_TYPE_DEFAULT, "Context length: %tu, locale: %@, recipientNames count: %tu, textContentType: %@", buf, 0x2Au);
  }

  if (![v18 count])
  {
LABEL_13:
    uint64_t v20 = [(id)objc_opt_class() _getQueryFieldFromTextContentType:v17];
    if (v20)
    {
      id v27 = (void *)MEMORY[0x2105116B0]();
      id v28 = [MEMORY[0x263F08708] whitespaceCharacterSet];
      uint64_t v29 = [v15 stringByTrimmingCharactersInSet:v28];
      uint64_t v30 = [v29 stringByReplacingOccurrencesOfString:@"​" withString:&stru_26BE112E8];

      if ([v30 length])
      {
        uint64_t v31 = [(id)objc_opt_class() _getContactsAutocompleteItemForQueryField:v20 searchTerm:v30 localeIdentifier:v16];
        uint64_t v32 = (void *)v31;
        if (v31)
        {
          uint64_t v65 = v31;
          id v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v65 count:1];

          goto LABEL_32;
        }
      }
    }
    else
    {
      uint64_t v30 = psg_default_log_handle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v17;
        _os_log_debug_impl(&dword_20A02A000, v30, OS_LOG_TYPE_DEBUG, "Unsupported textContentType for Keyboard Contacts Autocomplete: %@", buf, 0xCu);
      }
    }

    if ([v17 length])
    {
      uint64_t v33 = psg_default_log_handle();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_20A02A000, v33, OS_LOG_TYPE_DEBUG, "Word boundary prediction disabled for tagged text field", buf, 2u);
      }
LABEL_30:

LABEL_31:
      id v26 = 0;
      goto LABEL_32;
    }
    if (([(id)objc_opt_class() _shouldGenerateWordBoundaryPredictionsForContext:v15 localeIdentifier:v16] & 1) == 0)
    {
      uint64_t v33 = psg_default_log_handle();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_20A02A000, v33, OS_LOG_TYPE_DEBUG, "Word boundary prediction disabled by _shouldGenerate check", buf, 2u);
      }
      goto LABEL_30;
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    v63 = __Block_byref_object_copy__703;
    *(void *)&long long v64 = __Block_byref_object_dispose__704;
    *((void *)&v64 + 1) = 0;
    dispatch_semaphore_t v34 = dispatch_semaphore_create(0);
    id v35 = [(PSGInputSuggesterClient *)self _remoteObjectProxy];
    v54[0] = MEMORY[0x263EF8330];
    v54[1] = 3221225472;
    v54[2] = __147__PSGInputSuggesterClient__wordBoundaryPredictionsForContext_localeIdentifier_textContentType_recipientNames_availableApps_request_explanationSet___block_invoke;
    v54[3] = &unk_263FCFB48;
    uint64_t v56 = buf;
    long long v36 = v34;
    v55 = v36;
    [v35 inputSuggestionsWithRequest:v51 completion:v54];

    uint64_t v49 = +[PSGWordBoundaryFSTGrammar sharedInstance];
    long long v37 = [v49 triggerAttributesForContext:v15 localeIdentifier:v16];
    long long v38 = [v51 bundleIdentifier];
    v50 = [(PSGInputSuggesterClient *)self _maybeModifyTrigger:v37 bundleIdentifier:v38];

    if (v50)
    {
      id v48 = [[PSGProactiveTrigger alloc] initWithSourceType:0 category:@"LMWordBoundaryTriggerCategory" attributes:v50];
      long long v39 = [[PSGStructuredInfoSuggestion alloc] initWithProactiveTrigger:v48 portraitItem:0 operationalItem:0];
      v40 = [[PSGInputSuggestionsResponseItem alloc] initWithTextualResponseSuggestion:0 structuredInfoSuggestion:v39];
      uint64_t v41 = psg_default_log_handle();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v58 = 138412546;
        uint64_t v59 = (uint64_t)v50;
        __int16 v60 = 2112;
        v61 = v40;
        _os_log_impl(&dword_20A02A000, v41, OS_LOG_TYPE_INFO, "Word-boundary trigger: %@ returning response item with proactive trigger %@", v58, 0x16u);
      }

      v57 = v40;
      id v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v57 count:1];
    }
    else
    {
      if ([MEMORY[0x263F61E38] waitForSemaphore:v36 timeoutSeconds:0.1] == 1)
      {
        __int16 v43 = psg_default_log_handle();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v58 = 134217984;
          uint64_t v59 = 0x3FB999999999999ALL;
          _os_log_impl(&dword_20A02A000, v43, OS_LOG_TYPE_DEFAULT, "[WordBoundary] Timed out trying to fetch ml results (threshold: %.3f s)", v58, 0xCu);
        }

        [(PSGInputSuggesterClient *)self logErrorForRequest:v51 trigger:0 errorType:1];
        [v53 pushInternalExplanationCode:7];
      }
      else
      {
        uint64_t v44 = [*(id *)(*(void *)&buf[8] + 40) count];
        uint64_t v45 = psg_default_log_handle();
        BOOL v46 = os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG);
        if (v44)
        {
          if (v46)
          {
            uint64_t v47 = [*(id *)(*(void *)&buf[8] + 40) count];
            *(_DWORD *)v58 = 134217984;
            uint64_t v59 = v47;
            _os_log_debug_impl(&dword_20A02A000, v45, OS_LOG_TYPE_DEBUG, "[WordBoundary] No results from fst grammar but has %tu ML item(s)", v58, 0xCu);
          }

          id v26 = *(id *)(*(void *)&buf[8] + 40);
          goto LABEL_47;
        }
        if (v46)
        {
          *(_WORD *)v58 = 0;
          _os_log_debug_impl(&dword_20A02A000, v45, OS_LOG_TYPE_DEBUG, "[WordBoundary] No results from either FST or ML", v58, 2u);
        }
      }
      id v26 = 0;
    }
LABEL_47:

    _Block_object_dispose(buf, 8);
    goto LABEL_32;
  }
  uint64_t v20 = +[PSGNameMentionsHandler sharedInstance];
  uint64_t v21 = (void *)MEMORY[0x2105116B0]();
  uint64_t v22 = [v20 getNameMentionsTriggerForContext:v15 recipientNames:v18 availableApps:v52 localeIdentifier:v16 explanationSet:v53];
  if (!v22)
  {

    goto LABEL_13;
  }
  uint64_t v23 = [[PSGStructuredInfoSuggestion alloc] initWithProactiveTrigger:v22 portraitItem:0 operationalItem:0];
  __int16 v24 = [[PSGInputSuggestionsResponseItem alloc] initWithTextualResponseSuggestion:0 structuredInfoSuggestion:v23];
  double v25 = psg_default_log_handle();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20A02A000, v25, OS_LOG_TYPE_DEFAULT, "Returning NameMentions trigger", buf, 2u);
  }

  v66[0] = v24;
  id v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v66 count:1];

LABEL_32:
  return v26;
}

void __147__PSGInputSuggesterClient__wordBoundaryPredictionsForContext_localeIdentifier_textContentType_recipientNames_availableApps_request_explanationSet___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = psg_default_log_handle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138412290;
      id v13 = v6;
      _os_log_error_impl(&dword_20A02A000, v7, OS_LOG_TYPE_ERROR, "[WordBoundary] Error from triggering XPC: %@", (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    if (!v5) {
      goto LABEL_5;
    }
    uint64_t v8 = [v5 responseItems];
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    id v7 = psg_default_log_handle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      int v12 = 138412290;
      id v13 = v11;
      _os_log_impl(&dword_20A02A000, v7, OS_LOG_TYPE_INFO, "Client word boundary ml items %@", (uint8_t *)&v12, 0xCu);
    }
  }

LABEL_5:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_maybeModifyTrigger:(id)a3 bundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (_maybeModifyTrigger_bundleIdentifier___pasOnceToken14 != -1) {
    dispatch_once(&_maybeModifyTrigger_bundleIdentifier___pasOnceToken14, &__block_literal_global_85);
  }
  id v8 = (id)_maybeModifyTrigger_bundleIdentifier___pasExprOnceResult;
  uint64_t v9 = [(PSGInputSuggesterClient *)self _getFTLinkShareTrigger];
  int v10 = [v6 isEqualToDictionary:v9];

  if (v10 && [v7 length] && objc_msgSend(v8, "containsObject:", v7))
  {
    uint64_t v11 = psg_default_log_handle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl(&dword_20A02A000, v11, OS_LOG_TYPE_INFO, "PSGClient: FT Link share suppressed for Messages app.", v14, 2u);
    }

    id v12 = 0;
  }
  else
  {
    id v12 = v6;
  }

  return v12;
}

void __64__PSGInputSuggesterClient__maybeModifyTrigger_bundleIdentifier___block_invoke()
{
  uint64_t v0 = (void *)MEMORY[0x2105116B0]();
  v1 = (void *)MEMORY[0x2105116B0]();
  uint64_t v2 = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", @"com.apple.MobileSMS", @"com.apple.MobileSMS.MessagesNotificationExtension", 0);
  id v3 = (void *)_maybeModifyTrigger_bundleIdentifier___pasExprOnceResult;
  _maybeModifyTrigger_bundleIdentifier___pasExprOnceResult = v2;
}

- (id)_getFTLinkShareTrigger
{
  if (_getFTLinkShareTrigger__pasOnceToken11 != -1) {
    dispatch_once(&_getFTLinkShareTrigger__pasOnceToken11, &__block_literal_global_82);
  }
  uint64_t v2 = (void *)_getFTLinkShareTrigger__pasExprOnceResult;
  return v2;
}

void __49__PSGInputSuggesterClient__getFTLinkShareTrigger__block_invoke()
{
  v7[3] = *MEMORY[0x263EF8340];
  uint64_t v0 = (void *)MEMORY[0x2105116B0]();
  uint64_t v1 = *MEMORY[0x263F51240];
  uint64_t v2 = *MEMORY[0x263F51220];
  v6[0] = *MEMORY[0x263F51238];
  v6[1] = v2;
  uint64_t v3 = *MEMORY[0x263F511C8];
  v7[0] = v1;
  v7[1] = v3;
  v6[2] = *MEMORY[0x263F511B8];
  v7[2] = *MEMORY[0x263F511A0];
  uint64_t v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:3];
  id v5 = (void *)_getFTLinkShareTrigger__pasExprOnceResult;
  _getFTLinkShareTrigger__pasExprOnceResult = v4;
}

- (id)_fillSuggestionsForResponseItems:(id)a3 localeIdentifier:(id)a4 recipients:(id)a5 recipientNames:(id)a6 bundleIdentifier:(id)a7 timeoutSeconds:(double)a8 structuredInfoFetchLimit:(unint64_t)a9 availableApps:(id)a10 textualResponseLimit:(unint64_t)a11 structuredInfoLimit:(unint64_t)a12 totalSuggestionsLimit:(unint64_t)a13 explanationSet:(id)a14 error:(id *)a15
{
  unint64_t v20 = a12;
  unint64_t v21 = a13;
  uint64_t v85 = *MEMORY[0x263EF8340];
  id v22 = a3;
  id v59 = a4;
  id v58 = a5;
  id v57 = a6;
  id v56 = a7;
  id v55 = a10;
  id v54 = a14;
  id v53 = +[PSGProactiveTriggerHandler sharedInstance];
  uint64_t v23 = objc_opt_new();
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  id v24 = v22;
  uint64_t v62 = [v24 countByEnumeratingWithState:&v74 objects:v84 count:16];
  if (v62)
  {
    unint64_t v25 = 0;
    int v26 = 0;
    if (a12 >= a13) {
      unint64_t v27 = a13;
    }
    else {
      unint64_t v27 = a12;
    }
    unint64_t v60 = v27;
    uint64_t v61 = *(void *)v75;
    obuint64_t j = v24;
    do
    {
      for (uint64_t i = 0; i != v62; ++i)
      {
        if (*(void *)v75 != v61) {
          objc_enumerationMutation(obj);
        }
        uint64_t v29 = [*(id *)(*((void *)&v74 + 1) + 8 * i) structuredInfoSuggestion];
        if (v29)
        {
          id v63 = v29;
          uint64_t v30 = [v29 proactiveTrigger];
          uint64_t v31 = [v53 handleTrigger:v30 localeIdentifier:v59 bundleIdentifier:v56 recipients:v58 recipientNames:v57 availableApps:v55 timeoutSeconds:a8 fetchLimit:a9 maxSuggestions:v20 explanationSet:v54 error:a15];

          long long v72 = 0u;
          long long v73 = 0u;
          long long v70 = 0u;
          long long v71 = 0u;
          id v32 = v31;
          uint64_t v33 = [v32 countByEnumeratingWithState:&v70 objects:v83 count:16];
          if (v33)
          {
            uint64_t v34 = v33;
            uint64_t v35 = *(void *)v71;
            while (2)
            {
              uint64_t v36 = 0;
              unint64_t v64 = v25;
              if (v60 >= v25) {
                unint64_t v37 = v60 - v25;
              }
              else {
                unint64_t v37 = 0;
              }
              do
              {
                if (*(void *)v71 != v35) {
                  objc_enumerationMutation(v32);
                }
                if (v37 == v36)
                {
                  unint64_t v40 = v34 - 1;
                  if (v37 < v34 - 1) {
                    unint64_t v40 = v37;
                  }
                  unint64_t v25 = v64 + v40;
                  goto LABEL_24;
                }
                long long v38 = *(void **)(*((void *)&v70 + 1) + 8 * v36);
                v26 |= [v38 isApplePay];
                long long v39 = [[PSGInputSuggestionsResponseItem alloc] initWithTextualResponseSuggestion:0 structuredInfoSuggestion:v38];
                [v23 addObject:v39];

                ++v36;
              }
              while (v34 != v36);
              unint64_t v25 = v64 + v36;
              uint64_t v34 = [v32 countByEnumeratingWithState:&v70 objects:v83 count:16];
              if (v34) {
                continue;
              }
              break;
            }
          }
LABEL_24:

          unint64_t v20 = a12;
          uint64_t v29 = v63;
        }
      }
      id v24 = obj;
      uint64_t v62 = [obj countByEnumeratingWithState:&v74 objects:v84 count:16];
    }
    while (v62);

    uint64_t v65 = v25;
    if (!((v25 == 0) | v26 & 1))
    {
      uint64_t v41 = psg_default_log_handle();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_20A02A000, v41, OS_LOG_TYPE_DEBUG, "Non-ApplePay structured suggestion generated. Skipping textual ones.", buf, 2u);
      }
      goto LABEL_44;
    }
    unint64_t v21 = a13;
  }
  else
  {

    uint64_t v65 = 0;
  }
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  uint64_t v41 = v24;
  uint64_t v42 = [v41 countByEnumeratingWithState:&v66 objects:v82 count:16];
  if (!v42)
  {
LABEL_44:
    unint64_t v44 = 0;
    goto LABEL_45;
  }
  uint64_t v43 = v42;
  unint64_t v44 = 0;
  uint64_t v45 = *(void *)v67;
  do
  {
    for (uint64_t j = 0; j != v43; ++j)
    {
      if (*(void *)v67 != v45) {
        objc_enumerationMutation(v41);
      }
      uint64_t v47 = *(void **)(*((void *)&v66 + 1) + 8 * j);
      id v48 = [v47 textualResponseSuggestion];

      if (v48)
      {
        if (v44 >= a11 || [v23 count] >= v21) {
          goto LABEL_45;
        }
        [v23 addObject:v47];
        ++v44;
      }
    }
    uint64_t v43 = [v41 countByEnumeratingWithState:&v66 objects:v82 count:16];
  }
  while (v43);
LABEL_45:

  uint64_t v49 = psg_default_log_handle();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    unint64_t v79 = v44;
    __int16 v80 = 2048;
    uint64_t v81 = v65;
    _os_log_debug_impl(&dword_20A02A000, v49, OS_LOG_TYPE_DEBUG, "[Client] Returning %tu textual and %tu structurd predictions", buf, 0x16u);
  }

  return v23;
}

- (id)_rewriteMoneyAttributes:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)MEMORY[0x263F51200];
  uint64_t v4 = [a3 objectForKey:*MEMORY[0x263F51200]];
  if ([v4 count])
  {
    id v5 = [v4 objectForKey:*MEMORY[0x263F64288]];
    if ([v5 count])
    {
      id v28 = v4;
      id v6 = [MEMORY[0x263EFF9A0] dictionary];
      [v6 setValue:*MEMORY[0x263F64280] forKey:*MEMORY[0x263F51238]];
      id v7 = [MEMORY[0x263EFF9A0] dictionary];
      id v8 = [MEMORY[0x263EFF980] array];
      [v7 setValue:v8 forKey:@"Currency"];
      unint64_t v25 = v7;
      int v26 = v6;
      [v6 setValue:v7 forKey:*v3];
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      unint64_t v27 = v5;
      id v9 = v5;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v30;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v30 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void **)(*((void *)&v29 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v15 = (void *)MEMORY[0x263EFF9A0];
              id v16 = v14;
              id v17 = [v15 dictionary];
              id v18 = [v16 currency];
              [v17 setObject:v18 forKey:@"CurrencyType"];

              id v19 = [NSString alloc];
              [v16 value];
              uint64_t v21 = v20;

              id v22 = (void *)[v19 initWithFormat:@"%.2f", v21];
              [v17 setObject:v22 forKey:@"CurrencyValue"];

              [v8 addObject:v17];
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v29 objects:v33 count:16];
        }
        while (v11);
      }

      id v5 = v27;
      uint64_t v4 = v28;
      uint64_t v23 = v26;
    }
    else
    {
      uint64_t v23 = 0;
    }
  }
  else
  {
    uint64_t v23 = 0;
  }

  return v23;
}

- (id)_responseKitPredictionsForContext:(id)a3 bundleIdentifier:(id)a4 conversationTurns:(id)a5 languageID:(id)a6 adaptationContextID:(id)a7 shouldDisableAutoCaps:(BOOL)a8 maximumResponses:(unint64_t)a9 isBlacklisted:(BOOL)a10
{
  BOOL v10 = a8;
  uint64_t v69 = *MEMORY[0x263EF8340];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v56 = v16;
  id v57 = (id)objc_opt_new();
  id v54 = v19;
  id v55 = v18;
  BOOL v21 = a10;
  id v22 = self;
  id v53 = v20;
  uint64_t v23 = [(PSGInputSuggesterClient *)self _rkResponsesForContext:v16 conversationTurns:v18 languageID:v19 maximumResponses:a9 shouldDisableAutoCaps:v10 adaptationContextID:v20];
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v62 objects:v68 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v61 = *(void *)v63;
    uint64_t v58 = *MEMORY[0x263F64280];
    id v59 = v22;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v63 != v61) {
          objc_enumerationMutation(v23);
        }
        unint64_t v27 = *(void **)(*((void *)&v62 + 1) + 8 * i);
        uint64_t v28 = [v27 category];
        long long v29 = (void *)v28;
        long long v30 = @"UndefinedResponseKitCategory";
        if (v28) {
          long long v30 = (__CFString *)v28;
        }
        long long v31 = v30;

        long long v32 = [v27 attributes];
        uint64_t v33 = [(PSGInputSuggesterClient *)v22 _maybeModifyTrigger:v32 bundleIdentifier:v17];

        if (v33)
        {
          uint64_t v34 = psg_default_log_handle();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            long long v67 = v33;
            _os_log_impl(&dword_20A02A000, v34, OS_LOG_TYPE_INFO, "RK trigger: %@", buf, 0xCu);
          }

          if ([(__CFString *)v31 isEqualToString:@"QueryPhotoSharing"]) {
            BOOL v35 = !v21;
          }
          else {
            BOOL v35 = 1;
          }
          if (!v35)
          {
            uint64_t v47 = psg_default_log_handle();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_debug_impl(&dword_20A02A000, v47, OS_LOG_TYPE_DEBUG, "We got a deny-listed request of the photo sharing category", buf, 2u);
            }

            BOOL v46 = 0;
            goto LABEL_35;
          }
          uint64_t v36 = [v33 objectForKey:*MEMORY[0x263F51238]];
          if ([v36 isEqualToString:v58])
          {
            uint64_t v37 = [(PSGInputSuggesterClient *)v22 _rewriteMoneyAttributes:v33];

            uint64_t v33 = (void *)v37;
            if (!v37)
            {
              id v51 = psg_default_log_handle();
              if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                long long v67 = 0;
                _os_log_error_impl(&dword_20A02A000, v51, OS_LOG_TYPE_ERROR, "Ill-formatted ApplePay trigger: %@", buf, 0xCu);
              }

LABEL_33:
              BOOL v46 = 0;
LABEL_34:
              uint64_t v33 = 0;
              goto LABEL_35;
            }
          }
          unint64_t v60 = v31;
          long long v38 = [[PSGProactiveTrigger alloc] initWithSourceType:1 category:v31 attributes:v33];
          long long v39 = (PSGTextualResponseSuggestion *)v36;
          uint64_t v40 = v25;
          uint64_t v41 = v23;
          id v42 = v17;
          uint64_t v43 = v38;
          BOOL v44 = v21;
          uint64_t v45 = [[PSGStructuredInfoSuggestion alloc] initWithProactiveTrigger:v38 portraitItem:0 operationalItem:0];
          BOOL v46 = [[PSGInputSuggestionsResponseItem alloc] initWithTextualResponseSuggestion:0 structuredInfoSuggestion:v45];

          BOOL v21 = v44;
          id v17 = v42;
          uint64_t v23 = v41;
          uint64_t v25 = v40;
        }
        else
        {
          BOOL v46 = [v27 string];

          if (!v46) {
            goto LABEL_34;
          }
          if (v21)
          {
            uint64_t v36 = psg_default_log_handle();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_20A02A000, v36, OS_LOG_TYPE_INFO, "Request is deny-listed, skipping generating textual suggestion", buf, 2u);
            }
            goto LABEL_33;
          }
          uint64_t v49 = [PSGTextualResponseSuggestion alloc];
          v50 = [v27 string];
          unint64_t v60 = v31;
          long long v39 = [(PSGTextualResponseSuggestion *)v49 initWithText:v50 category:v31];

          BOOL v46 = [[PSGInputSuggestionsResponseItem alloc] initWithTextualResponseSuggestion:v39 structuredInfoSuggestion:0];
          uint64_t v33 = 0;
        }

        if (v46) {
          [v57 addObject:v46];
        }
        id v22 = v59;
        long long v31 = v60;
LABEL_35:
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v62 objects:v68 count:16];
    }
    while (v25);
  }

  return v57;
}

- (id)_rkResponsesForContext:(id)a3 conversationTurns:(id)a4 languageID:(id)a5 maximumResponses:(unint64_t)a6 shouldDisableAutoCaps:(BOOL)a7 adaptationContextID:(id)a8
{
  BOOL v9 = a7;
  id v13 = a4;
  id v14 = a8;
  if (v9) {
    uint64_t v15 = 704;
  }
  else {
    uint64_t v15 = 576;
  }
  id v16 = a5;
  id v17 = a3;
  uint64_t v18 = [v13 count];
  id v19 = [MEMORY[0x263F64260] sharedManager];
  id v20 = v19;
  if (v18) {
    [v19 responsesForMessage:v17 maximumResponses:a6 forConversationHistory:v13 withLanguage:v16 options:v15];
  }
  else {
  BOOL v21 = [v19 responsesForMessage:v17 maximumResponses:a6 forContext:v14 withLanguage:v16 options:v15];
  }

  return v21;
}

- (PSGInputSuggesterClient)initWithStructuredInfoCache:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PSGInputSuggesterClient;
  id v6 = [(PSGInputSuggesterClient *)&v15 init];
  if (v6)
  {
    id v7 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26BE15F68];
    id v8 = objc_alloc(MEMORY[0x263F61EB0]);
    BOOL v9 = psg_default_log_handle();
    uint64_t v10 = [v8 initWithServiceName:@"com.apple.proactive.input.suggester" whitelistedServerInterface:v7 whitelistedClientInterface:0 serverInitiatedRequestHandler:0 interruptionHandler:&__block_literal_global_744 invalidationHandler:&__block_literal_global_51 logHandle:v9];
    clientHelper = v6->_clientHelper;
    v6->_clientHelper = (_PASXPCClientHelper *)v10;

    objc_storeStrong((id *)&v6->_structuredSuggestionCache, a3);
    uint64_t v12 = [objc_alloc(MEMORY[0x263F61E50]) initWithCountLimit:3];
    triggeringCache = v6->_triggeringCache;
    v6->_triggeringCache = (_PASLRUCache *)v12;
  }
  return v6;
}

void __55__PSGInputSuggesterClient_initWithStructuredInfoCache___block_invoke_49()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  uint64_t v0 = psg_default_log_handle();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    int v1 = 138412290;
    uint64_t v2 = @"com.apple.proactive.input.suggester";
    _os_log_impl(&dword_20A02A000, v0, OS_LOG_TYPE_INFO, "Connection to %@ invalidated.", (uint8_t *)&v1, 0xCu);
  }
}

void __55__PSGInputSuggesterClient_initWithStructuredInfoCache___block_invoke()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  uint64_t v0 = psg_default_log_handle();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    int v1 = 138412290;
    uint64_t v2 = @"com.apple.proactive.input.suggester";
    _os_log_error_impl(&dword_20A02A000, v0, OS_LOG_TYPE_ERROR, "Connection to %@ interrupted.", (uint8_t *)&v1, 0xCu);
  }
}

- (PSGInputSuggesterClient)init
{
  uint64_t v3 = +[PSGStructuredInfoSuggestionCache sharedInstance];
  uint64_t v4 = [(PSGInputSuggesterClient *)self initWithStructuredInfoCache:v3];

  return v4;
}

+ (BOOL)_zkwItemsContainsOnlyTextualResponses:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = psg_default_log_handle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_20A02A000, v4, OS_LOG_TYPE_DEBUG, "Checking for any structured suggestions.", buf, 2u);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "structuredInfoSuggestion", (void)v18);

        if (v11)
        {
          id v13 = psg_default_log_handle();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            objc_super v15 = [v10 structuredInfoSuggestion];
            id v16 = [v15 proactiveTrigger];
            id v17 = [v16 triggerCategory];
            *(_DWORD *)buf = 138412290;
            uint64_t v23 = v17;
            _os_log_debug_impl(&dword_20A02A000, v13, OS_LOG_TYPE_DEBUG, "--- found one of category: %@", buf, 0xCu);
          }
          BOOL v12 = 0;
          goto LABEL_15;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v24 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 1;
LABEL_15:

  return v12;
}

+ (id)_getContactsAutocompleteItemForQueryField:(id)a3 searchTerm:(id)a4 localeIdentifier:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [MEMORY[0x263F08708] decimalDigitCharacterSet];
  if (objc_msgSend(v9, "rangeOfCharacterFromSet:options:range:", v11, 0, 0, 1) == 0x7FFFFFFFFFFFFFFFLL)
  {
    if ([v9 length] != 1)
    {
LABEL_5:
      v19[0] = *MEMORY[0x263F51238];
      v19[1] = @"SearchField";
      v20[0] = @"ContactsAutocomplete";
      v20[1] = v8;
      v19[2] = @"SearchTerm";
      v20[2] = v9;
      id v13 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:3];
      id v14 = [[PSGProactiveTrigger alloc] initWithSourceType:2 category:@"TaggedTextFieldContactsAutocomplete" attributes:v13];
      objc_super v15 = [[PSGStructuredInfoSuggestion alloc] initWithProactiveTrigger:v14 portraitItem:0 operationalItem:0];
      id v16 = [[PSGInputSuggestionsResponseItem alloc] initWithTextualResponseSuggestion:0 structuredInfoSuggestion:v15];

      goto LABEL_12;
    }
    BOOL v12 = [MEMORY[0x263EFF960] componentsFromLocaleIdentifier:v10];
    id v13 = [v12 objectForKeyedSubscript:*MEMORY[0x263EFF508]];

    if ([a1 _allowSingleCharacterContactsAutocompleteTriggerForLanguage:v13])
    {

      goto LABEL_5;
    }
    id v17 = psg_default_log_handle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v10;
      _os_log_debug_impl(&dword_20A02A000, v17, OS_LOG_TYPE_DEBUG, "Single character SearchTerm for locale %@. Suppress ContactsAutocomplete trigger.", buf, 0xCu);
    }
  }
  else
  {
    id v13 = psg_default_log_handle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_20A02A000, v13, OS_LOG_TYPE_DEBUG, "SearchTerm starts with a digit. Suppress ContactsAutocomplete trigger.", buf, 2u);
    }
  }
  id v16 = 0;
LABEL_12:

  return v16;
}

+ (BOOL)_allowSingleCharacterContactsAutocompleteTriggerForLanguage:(id)a3
{
  id v3 = a3;
  if (([v3 hasPrefix:@"zh"] & 1) != 0
    || ([v3 isEqualToString:@"ko"] & 1) != 0)
  {
    char v4 = 1;
  }
  else
  {
    char v4 = [v3 isEqualToString:@"ja"];
  }

  return v4;
}

+ (id)_getQueryFieldFromTextContentType:(id)a3
{
  id v3 = a3;
  if (_getQueryFieldFromTextContentType__once != -1) {
    dispatch_once(&_getQueryFieldFromTextContentType__once, &__block_literal_global_105);
  }
  if ([v3 length])
  {
    char v4 = [(id)_getQueryFieldFromTextContentType__map objectForKeyedSubscript:v3];
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

void __61__PSGInputSuggesterClient__getQueryFieldFromTextContentType___block_invoke()
{
  v3[3] = *MEMORY[0x263EF8340];
  v2[0] = @"tel";
  v2[1] = @"email";
  v3[0] = &unk_26BE13300;
  v3[1] = &unk_26BE13318;
  v2[2] = @"street-address";
  v3[2] = &unk_26BE13330;
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:3];
  int v1 = (void *)_getQueryFieldFromTextContentType__map;
  _getQueryFieldFromTextContentType__map = v0;
}

+ (BOOL)_shouldGenerateWordBoundaryPredictionsForContext:(id)a3 localeIdentifier:(id)a4
{
  id v5 = a3;
  if ([a4 hasPrefix:@"zh"])
  {
    BOOL v6 = 1;
  }
  else
  {
    uint64_t v7 = objc_msgSend(v5, "rangeOfComposedCharacterSequenceAtIndex:", objc_msgSend(v5, "length") - 1);
    id v9 = objc_msgSend(v5, "substringWithRange:", v7, v8);
    id v10 = [MEMORY[0x263F08708] whitespaceCharacterSet];
    BOOL v6 = [v9 rangeOfCharacterFromSet:v10] != 0x7FFFFFFFFFFFFFFFLL;
  }
  return v6;
}

+ (PSGInputSuggesterClient)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__PSGInputSuggesterClient_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__pasOnceToken4 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken4, block);
  }
  uint64_t v2 = (void *)sharedInstance__pasExprOnceResult_775;
  return (PSGInputSuggesterClient *)v2;
}

void __41__PSGInputSuggesterClient_sharedInstance__block_invoke()
{
  uint64_t v0 = (void *)MEMORY[0x2105116B0]();
  uint64_t v1 = objc_opt_new();
  uint64_t v2 = (void *)sharedInstance__pasExprOnceResult_775;
  sharedInstance__pasExprOnceResult_775 = v1;
}

@end