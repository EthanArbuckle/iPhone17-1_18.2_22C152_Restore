@interface PSSuggester
@end

@implementation PSSuggester

void __56___PSSuggester_initWithConfiguration_feedbackRecording___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F1CB10];
  v3 = [MEMORY[0x1E4F5B420] peopleDirectory];
  uint64_t v4 = [v2 fileURLWithPath:v3 isDirectory:1];
  v5 = [v2 fileURLWithPath:@"Feedback" isDirectory:1 relativeToURL:v4];

  v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  v7 = [v5 path];
  LOBYTE(v4) = [v6 fileExistsAtPath:v7];

  if ((v4 & 1) != 0
    || ((id v26 = 0,
         int v8 = [v6 createDirectoryAtURL:v5 withIntermediateDirectories:1 attributes:0 error:&v26],
         id v9 = v26,
         v8)
      ? (BOOL v10 = v9 == 0)
      : (BOOL v10 = 0),
        v10))
  {
    uint64_t v32 = 0;
    v33 = &v32;
    uint64_t v34 = 0x2050000000;
    v13 = (void *)getBMStoreConfigClass_softClass;
    uint64_t v35 = getBMStoreConfigClass_softClass;
    if (!getBMStoreConfigClass_softClass)
    {
      uint64_t v27 = MEMORY[0x1E4F143A8];
      uint64_t v28 = 3221225472;
      v29 = __getBMStoreConfigClass_block_invoke;
      v30 = &unk_1E5ADE858;
      v31 = &v32;
      BiomeStorageLibraryCore();
      Class Class = objc_getClass("BMStoreConfig");
      *(void *)(v31[1] + 24) = Class;
      getBMStoreConfigClass_softClass Class = *(void *)(v31[1] + 24);
      v13 = (void *)v33[3];
    }
    v15 = v13;
    _Block_object_dispose(&v32, 8);
    id v16 = [v15 alloc];
    v17 = [v5 path];
    uint64_t v32 = 0;
    v33 = &v32;
    uint64_t v34 = 0x2020000000;
    v18 = (void *)getbm_defaultStoreSegmentSizeSymbolLoc_ptr;
    uint64_t v35 = getbm_defaultStoreSegmentSizeSymbolLoc_ptr;
    if (!getbm_defaultStoreSegmentSizeSymbolLoc_ptr)
    {
      uint64_t v27 = MEMORY[0x1E4F143A8];
      uint64_t v28 = 3221225472;
      v29 = __getbm_defaultStoreSegmentSizeSymbolLoc_block_invoke;
      v30 = &unk_1E5ADE858;
      v31 = &v32;
      __getbm_defaultStoreSegmentSizeSymbolLoc_block_invoke((uint64_t)&v27);
      v18 = (void *)v33[3];
    }
    _Block_object_dispose(&v32, 8);
    if (!v18)
    {
      v25 = (_Unwind_Exception *)-[_PSBlockedHandlesCache beginSyncingWithTU]();
      _Block_object_dispose(&v32, 8);
      _Unwind_Resume(v25);
    }
    v11 = (void *)[v16 initWithStoreBasePath:v17 segmentSize:*v18];

    uint64_t v32 = 0;
    v33 = &v32;
    uint64_t v34 = 0x2050000000;
    v19 = (void *)getBMStoreStreamClass_softClass;
    uint64_t v35 = getBMStoreStreamClass_softClass;
    if (!getBMStoreStreamClass_softClass)
    {
      uint64_t v27 = MEMORY[0x1E4F143A8];
      uint64_t v28 = 3221225472;
      v29 = __getBMStoreStreamClass_block_invoke;
      v30 = &unk_1E5ADE858;
      v31 = &v32;
      BiomeStreamsLibraryCore();
      Class v20 = objc_getClass("BMStoreStream");
      *(void *)(v31[1] + 24) = v20;
      getBMStoreStreamClass_softClass Class = *(void *)(v31[1] + 24);
      v19 = (void *)v33[3];
    }
    v21 = v19;
    _Block_object_dispose(&v32, 8);
    v12 = [[v21 alloc] initWithPrivateStreamIdentifier:@"CNA" storeConfig:v11];
    uint64_t v22 = [v12 source];
    uint64_t v23 = *(void *)(a1 + 32);
    v24 = *(void **)(v23 + 40);
    *(void *)(v23 + 40) = v22;
  }
  else
  {
    v11 = v9;
    v12 = +[_PSLogging feedbackChannel];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __56___PSSuggester_initWithConfiguration_feedbackRecording___block_invoke_cold_2();
    }
  }
}

uint64_t __53___PSSuggester_candidatesForShareSheetRankingCompute__block_invoke(uint64_t a1, void *a2)
{
  return [a2 candidateIdentifier];
}

BOOL __46___PSSuggester_candidatesForShareSheetRanking__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 conversationIdentifier];
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    v5 = [v2 derivedIntentIdentifier];
    BOOL v4 = v5 != 0;
  }
  return v4;
}

id __46___PSSuggester_candidatesForShareSheetRanking__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 conversationIdentifier];
  BOOL v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [v2 derivedIntentIdentifier];
  }
  v6 = v5;

  return v6;
}

void __46___PSSuggester_candidatesForShareSheetRanking__block_invoke_178(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = +[_PSLogging suggestionSignpost];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __91___PSContactSuggester_contactSuggestionsWithMaxSuggestions_excludeContactsWithIdentifiers___block_invoke_cold_1();
  }
}

uint64_t __46___PSSuggester_candidatesForShareSheetRanking__block_invoke_182(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [a2 allObjects];

  return MEMORY[0x1F41817F8]();
}

void __72___PSSuggester_computeShareSheetEphemeralFeaturesWithPredictionContext___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = +[_PSLogging suggestionSignpost];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __91___PSContactSuggester_contactSuggestionsWithMaxSuggestions_excludeContactsWithIdentifiers___block_invoke_cold_1();
  }
}

void __72___PSSuggester_computeShareSheetEphemeralFeaturesWithPredictionContext___block_invoke_186(uint64_t a1, void *a2)
{
}

void __47___PSSuggester_suggestInteractionsFromContext___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = +[_PSLogging suggestionSignpost];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __91___PSContactSuggester_contactSuggestionsWithMaxSuggestions_excludeContactsWithIdentifiers___block_invoke_cold_1();
  }
}

void __47___PSSuggester_suggestInteractionsFromContext___block_invoke_200(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v7 = a3;
  [*(id *)(a1 + 32) sync:v7];

  int v8 = +[_PSLogging coreBehaviorChannel];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl(&dword_1A314B000, v8, OS_LOG_TYPE_DEFAULT, "_PSSuggester: finished suggestInteractionsFromContext", v9, 2u);
  }
}

uint64_t __70___PSSuggester_asyncSuggestInteractionsFromContext_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, *(void *)(a1 + 32));
}

void __35___PSSuggester_getCacheSuggestions__block_invoke(uint64_t a1, void *a2, unsigned __int8 a3)
{
  id v5 = a2;
  id v6 = [v5 conversationIdentifier];
  if (!v6
    || ([MEMORY[0x1E4F1CA98] null],
        id v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 isEqual:v6],
        v7,
        v8))
  {
    uint64_t v9 = [v5 derivedIntentIdentifier];

    id v6 = (void *)v9;
  }
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2050000000;
  BOOL v10 = (void *)getPSPeopleSuggestionsMetricsItemClass_softClass_0;
  uint64_t v18 = getPSPeopleSuggestionsMetricsItemClass_softClass_0;
  if (!getPSPeopleSuggestionsMetricsItemClass_softClass_0)
  {
    ReportingPluginLibraryCore_0();
    v16[3] = (uint64_t)objc_getClass("PSPeopleSuggestionsMetricsItem");
    getPSPeopleSuggestionsMetricsItemClass_softClass_0 = v16[3];
    BOOL v10 = (void *)v16[3];
  }
  v11 = v10;
  _Block_object_dispose(&v15, 8);
  id v12 = [v11 alloc];
  v13 = [v5 bundleID];
  v14 = (void *)[v12 initWithId:v6 model:@"cached" transportBundleId:v13 rank:a3 score:-1.0];

  [*(id *)(a1 + 32) addObject:v14];
}

void __68___PSSuggester_showNotificationToFileARadarForUserStudyParticipants__block_invoke()
{
  v0 = [MEMORY[0x1E4F1CA48] array];
  id v16 = [MEMORY[0x1E4F290C8] queryItemWithName:@"Title" value:@"TTR Share Sheet People Suggestion Feedback"];
  objc_msgSend(v0, "addObject:");
  uint64_t v15 = [MEMORY[0x1E4F290C8] queryItemWithName:@"Description", @"How would you rate your experience using Share Sheet on iPhone? (Very positive, positive, neutral, negative, or very negative)\n\n\n\nWhat, if anything, did you like about this Share Sheet experience?\n\n\n\nWhat, if anything, did you dislike about this Share Sheet experience?\n\n\n\nAny other comments to share?\n\n\n\nFeel free to include screenshots or screen recordings (with or without audio) to this radar — thanks! :\n\n\n\n" value]);
  objc_msgSend(v0, "addObject:");
  uint64_t v1 = [MEMORY[0x1E4F290C8] queryItemWithName:@"ComponentID" value:@"1650220"];
  uint64_t v2 = [MEMORY[0x1E4F290C8] queryItemWithName:@"ComponentName" value:@"Share Sheet User Study"];
  v3 = [MEMORY[0x1E4F290C8] queryItemWithName:@"ComponentVersion" value:@"Feedback"];
  BOOL v4 = [MEMORY[0x1E4F290C8] queryItemWithName:@"Reproducible" value:@"Not Applicable"];
  id v5 = [MEMORY[0x1E4F290C8] queryItemWithName:@"IncludeDevicePrefixInTitle" value:@"1"];
  id v6 = [MEMORY[0x1E4F290C8] queryItemWithName:@"Classification" value:@"UI/Usability"];
  v14 = (void *)v1;
  [v0 addObject:v1];
  v13 = (void *)v2;
  [v0 addObject:v2];
  [v0 addObject:v3];
  [v0 addObject:v4];
  [v0 addObject:v5];
  [v0 addObject:v6];
  id v7 = [MEMORY[0x1E4F29088] componentsWithString:@"tap-to-radar://new"];
  [v7 setQueryItems:v0];
  int v8 = [v7 URL];
  uint64_t v9 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  id v17 = 0;
  char v10 = [v9 openURL:v8 withOptions:0 error:&v17];
  id v11 = v17;

  if ((v10 & 1) == 0)
  {
    id v12 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __68___PSSuggester_showNotificationToFileARadarForUserStudyParticipants__block_invoke_cold_1();
    }
  }
}

void __68___PSSuggester_showNotificationToFileARadarForUserStudyParticipants__block_invoke_273(uint64_t a1)
{
  v9[7] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F1D9A8];
  v8[0] = *MEMORY[0x1E4F1D990];
  v8[1] = v2;
  v9[0] = @"ShareSheet Study Feedback request";
  v9[1] = @"Could you please share with us your feedback on your experience with the ShareSheet for this session?";
  uint64_t v3 = *MEMORY[0x1E4F1DA10];
  v8[2] = *MEMORY[0x1E4F1D9E0];
  v8[3] = v3;
  v9[2] = @"File a radar";
  v9[3] = @"Dismiss";
  uint64_t v4 = *MEMORY[0x1E4FA7358];
  v8[4] = *MEMORY[0x1E4F1D9B8];
  v8[5] = v4;
  v9[4] = MEMORY[0x1E4F1CC38];
  v9[5] = MEMORY[0x1E4F1CC38];
  v8[6] = *MEMORY[0x1E4FA7338];
  v9[6] = MEMORY[0x1E4F1CC38];
  CFDictionaryRef v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:7];
  id v6 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0.0, 1uLL, 0, v5);
  CFOptionFlags v7 = 0;
  CFUserNotificationReceiveResponse(v6, 0.0, &v7);
  if (v6) {
    CFRelease(v6);
  }
  if (!v7) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __78___PSSuggester_asyncSuggestInteractionsFromContext_timeout_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = +[_PSLogging suggestionSignpost];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __91___PSContactSuggester_contactSuggestionsWithMaxSuggestions_excludeContactsWithIdentifiers___block_invoke_cold_1();
  }

  id v5 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v12 = *MEMORY[0x1E4F28568];
  id v6 = [NSString stringWithFormat:@"XPC Error: %@", v3, 0];
  v13[0] = v6;
  CFOptionFlags v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  int v8 = (void *)[v5 initWithDomain:@"com.apple.PeopleSuggester" code:1 userInfo:v7];

  uint64_t v9 = +[_PSConstants suggestionPathXPCError];
  [*(id *)(a1 + 32) setSuggestionPath:v9];

  char v10 = *(void **)(a1 + 40);
  id v11 = [NSString stringWithFormat:@"XPC Error: %@", v3, 0];
  [v10 logErrorEventWithName:@"XPCError" details:v11 attributes:MEMORY[0x1E4F1CC08]];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

BOOL __78___PSSuggester_asyncSuggestInteractionsFromContext_timeout_completionHandler___block_invoke_324(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 24));
  uint64_t v2 = *(os_unfair_lock_s **)(a1 + 32);
  BOOL v3 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
  os_unfair_lock_unlock(v2 + 6);
  return v3;
}

void __78___PSSuggester_asyncSuggestInteractionsFromContext_timeout_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a2);
  int v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.coreduet.logging"];
  int v9 = [v8 BOOLForKey:@"forceSuggesterEmptySuggestionForTesting"];

  if (v9)
  {
    char v10 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v29) = 0;
      _os_log_impl(&dword_1A314B000, v10, OS_LOG_TYPE_DEFAULT, "Simulating a empty suggestion for testing", (uint8_t *)&v29, 2u);
    }

    uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = MEMORY[0x1E4F1CBF0];
  }
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 24));
  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    [*(id *)(a1 + 40) setTimedOut:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)];
    [*(id *)(a1 + 40) sync:v7];
    [*(id *)(a1 + 32) showNotificationToFileARadarForUserStudyParticipants];
    v13 = [MEMORY[0x1E4F1C9C8] date];
    [*(id *)(a1 + 40) setSuggestionCompletionDate:v13];

    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
    {
      id v14 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v31 = *MEMORY[0x1E4F28568];
      v32[0] = @"Suggestions timed out";
      uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:&v31 count:1];
      id v16 = (void *)[v14 initWithDomain:@"com.apple.PeopleSuggester" code:1 userInfo:v15];

      id v17 = +[_PSLogging suggestionSignpost];
      if (os_signpost_enabled(v17))
      {
        LOWORD(v29) = 0;
        _os_signpost_emit_with_name_impl(&dword_1A314B000, v17, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSSuggestionAsyncFallbackTotalTime", (const char *)&unk_1A3274816, (uint8_t *)&v29, 2u);
      }

      uint64_t v18 = +[_PSLogging generalChannel];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v29) = 0;
        _os_log_impl(&dword_1A314B000, v18, OS_LOG_TYPE_DEFAULT, "Timed out people suggestions", (uint8_t *)&v29, 2u);
      }

      [*(id *)(a1 + 48) logErrorEventWithName:@"NormalPathTimedout" details:&stru_1EF653EA8 attributes:MEMORY[0x1E4F1CC08]];
    }
    else
    {
      Class v20 = +[_PSLogging suggestionSignpost];
      if (os_signpost_enabled(v20))
      {
        LOWORD(v29) = 0;
        _os_signpost_emit_with_name_impl(&dword_1A314B000, v20, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSSuggestionAsyncTotalTime", (const char *)&unk_1A3274816, (uint8_t *)&v29, 2u);
      }

      id v16 = 0;
    }
    (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) + 16))();
    uint64_t v21 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v22 = *(void **)(v21 + 40);
    *(void *)(v21 + 40) = 0;

    uint64_t v23 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = [NSNumber numberWithBool:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)];
      int v29 = 138412290;
      v30 = v24;
      _os_log_impl(&dword_1A314B000, v23, OS_LOG_TYPE_DEFAULT, "Finished fetching people suggestions, timedOut: %@", (uint8_t *)&v29, 0xCu);
    }
  }
  else
  {
    v19 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v29) = 0;
      _os_log_impl(&dword_1A314B000, v19, OS_LOG_TYPE_DEFAULT, "Received completion without valid reply block", (uint8_t *)&v29, 2u);
    }

    [*(id *)(a1 + 48) logErrorEventWithName:@"ReceivedNilReplyBlock" details:&stru_1EF653EA8 attributes:MEMORY[0x1E4F1CC08]];
  }
  v25 = *(void **)(a1 + 48);
  id v26 = [*(id *)(a1 + 40) trialDeploymentId];
  uint64_t v27 = [*(id *)(a1 + 40) trialExperimentId];
  uint64_t v28 = [*(id *)(a1 + 40) trialTreatmentId];
  [v25 addTrialDeploymentId:v26 trialExperimentId:v27 trialTreatmentId:v28];

  [*(id *)(a1 + 48) end];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 24));
}

void __78___PSSuggester_asyncSuggestInteractionsFromContext_timeout_completionHandler___block_invoke_341(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) createSubSpanWithName:@"timeoutBlocksSpan"];
  [v2 start];
  BOOL v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.coreduet.logging"];
  char v4 = [v3 BOOLForKey:@"shouldAllowShareSheetHangs"];

  if ((v4 & 1) == 0 && (*(unsigned int (**)(void))(*(void *)(a1 + 56) + 16))())
  {
    id v5 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)char v10 = 0;
      _os_log_impl(&dword_1A314B000, v5, OS_LOG_TYPE_INFO, "Timeout. Falling back to cached suggestions.", v10, 2u);
    }

    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 40) + 24));
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 40) + 24));
    id v6 = +[_PSConstants suggestionPathCachedSuggestion];
    [*(id *)(a1 + 48) setSuggestionPath:v6];

    id v7 = [*(id *)(a1 + 40) getCacheSuggestions];
    int v8 = +[_PSSuggesterCache defaultService];
    int v9 = [v8 getCachedContext];
    [*(id *)(a1 + 48) setIsFallbackFetch:1];
    [*(id *)(a1 + 48) sync:v9];
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    [v2 end];
  }
}

void __78___PSSuggester_asyncSuggestInteractionsFromContext_timeout_completionHandler___block_invoke_351(uint64_t a1)
{
  uint64_t v2 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A314B000, v2, OS_LOG_TYPE_DEFAULT, "Ensuring cache is populated", buf, 2u);
  }

  BOOL v3 = +[_PSConstants suggestionPathPopulateCache];
  [*(id *)(a1 + 32) setSuggestionPath:v3];

  if (*(unsigned char *)(a1 + 80)) {
    [MEMORY[0x1E4F29060] sleepForTimeInterval:2.0];
  }
  char v4 = [*(id *)(a1 + 40) createSubSpanWithName:@"performInitialFetchIfNeeded"];
  [v4 start];
  id v5 = +[_PSSuggesterCache defaultService];
  [v5 performInitialFetchIfNeeded];

  [v4 end];
  if ((*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))())
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.coreduet.logging"];
    int v7 = [v6 BOOLForKey:@"forceSuggesterTimeoutForTesting"];

    int v8 = +[_PSLogging generalChannel];
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v9)
      {
        __int16 v20 = 0;
        char v10 = "Simulating a timeout for testing";
        uint64_t v11 = (uint8_t *)&v20;
LABEL_11:
        _os_log_impl(&dword_1A314B000, v8, OS_LOG_TYPE_DEFAULT, v10, v11, 2u);
      }
    }
    else
    {
      if (v9)
      {
        *(_WORD *)v19 = 0;
        _os_log_impl(&dword_1A314B000, v8, OS_LOG_TYPE_DEFAULT, "Fetching people suggestions", v19, 2u);
      }

      uint64_t v12 = +[_PSConstants suggestionPathNormal];
      [*(id *)(a1 + 32) setSuggestionPath:v12];

      int v8 = [*(id *)(a1 + 40) createSubSpanWithName:@"daemon_suggestInteractionsFromContext"];
      [v8 start];
      v13 = [v8 getSpanId];
      [*(id *)(a1 + 32) setCurrentSpanId:v13];

      uint64_t v14 = *(void *)(a1 + 32);
      uint64_t v15 = NSNumber;
      id v16 = *(void **)(a1 + 48);
      id v17 = [*(id *)(a1 + 56) configuration];
      uint64_t v18 = objc_msgSend(v15, "numberWithInteger:", objc_msgSend(v17, "maximumNumberOfSuggestions"));
      [v16 suggestInteractionsFromContext:v14 maxSuggestions:v18 reply:*(void *)(a1 + 72)];

      [v8 end];
    }
  }
  else
  {
    int v8 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v21 = 0;
      char v10 = "Blocking on cache population consumed the entire timeout interval. Bailing prior to firing main daemon request.";
      uint64_t v11 = v21;
      goto LABEL_11;
    }
  }
}

void __53___PSSuggester_shareExtensionSuggestionsFromContext___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = +[_PSLogging suggestionSignpost];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __91___PSContactSuggester_contactSuggestionsWithMaxSuggestions_excludeContactsWithIdentifiers___block_invoke_cold_1();
  }
}

void __53___PSSuggester_shareExtensionSuggestionsFromContext___block_invoke_364(uint64_t a1, void *a2)
{
}

uint64_t __76___PSSuggester_asyncShareExtensionSuggestionsFromContext_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __84___PSSuggester_asyncShareExtensionSuggestionsFromContext_timeout_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = +[_PSLogging suggestionSignpost];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __91___PSContactSuggester_contactSuggestionsWithMaxSuggestions_excludeContactsWithIdentifiers___block_invoke_cold_1();
  }
}

void __84___PSSuggester_asyncShareExtensionSuggestionsFromContext_timeout_completionHandler___block_invoke_368()
{
  v0 = (void *)MEMORY[0x1A6243860]();
  dispatch_semaphore_t v1 = dispatch_semaphore_create(1);
  id v2 = (void *)asyncShareExtensionSuggestionsFromContext_timeout_completionHandler___pasExprOnceResult;
  asyncShareExtensionSuggestionsFromContext_timeout_completionHandler___pasExprOnceResult = (uint64_t)v1;
}

void __84___PSSuggester_asyncShareExtensionSuggestionsFromContext_timeout_completionHandler___block_invoke_371(void *a1, void *a2)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a2);
  os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 24));
  if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
  {
    id v5 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v15 = *MEMORY[0x1E4F28568];
    v16[0] = @"Suggestions timed out";
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    int v7 = (void *)[v5 initWithDomain:@"com.apple.PeopleSuggester" code:1 userInfo:v6];
  }
  else
  {
    int v7 = 0;
  }
  uint64_t v8 = *(void *)(*(void *)(a1[7] + 8) + 40);
  if (v8)
  {
    (*(void (**)(uint64_t, void, void, void *))(v8 + 16))(v8, *(void *)(*(void *)(a1[5] + 8) + 40), *(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24), v7);
    BOOL v9 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      char v10 = [NSNumber numberWithBool:*(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24)];
      int v13 = 138412290;
      uint64_t v14 = v10;
      _os_log_impl(&dword_1A314B000, v9, OS_LOG_TYPE_DEFAULT, "Finished fetching people suggestions, timedOut: %@", (uint8_t *)&v13, 0xCu);
    }
    uint64_t v11 = *(void *)(a1[7] + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = 0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 24));
}

void __84___PSSuggester_asyncShareExtensionSuggestionsFromContext_timeout_completionHandler___block_invoke_372(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v5) = 0;
    _os_log_impl(&dword_1A314B000, v2, OS_LOG_TYPE_DEFAULT, "Timed out app suggestions", (uint8_t *)&v5, 2u);
  }

  BOOL v3 = [*(id *)(a1 + 32) shareExtensionSuggestionsFromContext:*(void *)(a1 + 40)];
  id v4 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 138477827;
    id v6 = v3;
    _os_log_impl(&dword_1A314B000, v4, OS_LOG_TYPE_INFO, "Fetched %{private}@ app suggestions in process", (uint8_t *)&v5, 0xCu);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 24));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 24));
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

intptr_t __84___PSSuggester_asyncShareExtensionSuggestionsFromContext_timeout_completionHandler___block_invoke_373(uint64_t a1)
{
  id v2 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1A314B000, v2, OS_LOG_TYPE_DEFAULT, "Fetching app extension suggestions", v4, 2u);
  }

  [*(id *)(a1 + 32) shareExtensionSuggestionsFromContext:*(void *)(a1 + 40) reply:*(void *)(a1 + 56)];
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void __54___PSSuggester_rankedNameSuggestionsFromContext_name___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = +[_PSLogging suggestionSignpost];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __91___PSContactSuggester_contactSuggestionsWithMaxSuggestions_excludeContactsWithIdentifiers___block_invoke_cold_1();
  }
}

void __54___PSSuggester_rankedNameSuggestionsFromContext_name___block_invoke_376(uint64_t a1, void *a2)
{
}

void __64___PSSuggester_rankedGlobalSuggestionsFromContext_contactsOnly___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = +[_PSLogging suggestionSignpost];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __91___PSContactSuggester_contactSuggestionsWithMaxSuggestions_excludeContactsWithIdentifiers___block_invoke_cold_1();
  }
}

void __64___PSSuggester_rankedGlobalSuggestionsFromContext_contactsOnly___block_invoke_379(uint64_t a1, void *a2)
{
}

void __87___PSSuggester_rankedSiriNLContactSuggestionsFromContext_maxSuggestions_interactionId___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = +[_PSLogging suggestionSignpost];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __91___PSContactSuggester_contactSuggestionsWithMaxSuggestions_excludeContactsWithIdentifiers___block_invoke_cold_1();
  }
}

void __87___PSSuggester_rankedSiriNLContactSuggestionsFromContext_maxSuggestions_interactionId___block_invoke_382(uint64_t a1, void *a2)
{
}

void __48___PSSuggester_rankedZKWSuggestionsFromContext___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = +[_PSLogging suggestionSignpost];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __91___PSContactSuggester_contactSuggestionsWithMaxSuggestions_excludeContactsWithIdentifiers___block_invoke_cold_1();
  }
}

void __48___PSSuggester_rankedZKWSuggestionsFromContext___block_invoke_385(uint64_t a1, void *a2)
{
}

void __48___PSSuggester_rankedZKWSuggestionsFromContext___block_invoke_386()
{
  v0 = (void *)MEMORY[0x1A6243860]();
  dispatch_semaphore_t v1 = [MEMORY[0x1E4F28F80] processInfo];
  uint64_t v2 = [v1 processName];
  BOOL v3 = (void *)rankedZKWSuggestionsFromContext___pasExprOnceResult;
  rankedZKWSuggestionsFromContext___pasExprOnceResult = v2;
}

void __63___PSSuggester_autocompleteSearchResultsWithPredictionContext___block_invoke()
{
  v0 = (void *)MEMORY[0x1A6243860]();
  uint64_t v1 = objc_opt_new();
  uint64_t v2 = (void *)autocompleteSearchResultsWithPredictionContext___pasExprOnceResult;
  autocompleteSearchResultsWithPredictionContext___pasExprOnceResult = v1;
}

void __63___PSSuggester_autocompleteSearchResultsWithPredictionContext___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isCancelled])
  {
    uint64_t v2 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A314B000, v2, OS_LOG_TYPE_DEFAULT, "autocompleteSearchResultsWithPredictionContext request was already cancelled when lock was acquired", buf, 2u);
    }

    uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = MEMORY[0x1E4F1CBF0];
  }
  else
  {
    int v5 = [*(id *)(a1 + 32) searchPrefix];
    uint64_t v6 = [v5 length];

    uint64_t v7 = *(void **)(a1 + 40);
    if (v6)
    {
      uint64_t v8 = [v7 _getUserDaemonXPCConnection];
      if (v8)
      {
        BOOL v9 = +[_PSLogging suggestionSignpost];
        if (os_signpost_enabled(v9))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A314B000, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSAutocompleteSearchResultsTotalTime", " enableTelemetry=YES ", buf, 2u);
        }

        char v10 = [v8 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_399];
        uint64_t v11 = *(void *)(a1 + 32);
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __63___PSSuggester_autocompleteSearchResultsWithPredictionContext___block_invoke_400;
        v15[3] = &unk_1E5ADEA08;
        v15[4] = *(void *)(a1 + 48);
        [v10 autocompleteSearchResultsWithPredictionContext:v11 reply:v15];
        uint64_t v12 = +[_PSLogging suggestionSignpost];
        if (os_signpost_enabled(v12))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A314B000, v12, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSAutocompleteSearchResultsTotalTime", (const char *)&unk_1A3274816, buf, 2u);
        }
      }
      else
      {
        int v13 = +[_PSLogging generalChannel];
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          __63___PSSuggester_autocompleteSearchResultsWithPredictionContext___block_invoke_2_cold_1();
        }

        uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
        char v10 = *(void **)(v14 + 40);
        *(void *)(v14 + 40) = MEMORY[0x1E4F1CBF0];
      }
    }
    else
    {
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [v7 rankedZKWSuggestionsFromContext:*(void *)(a1 + 32)];
      MEMORY[0x1F41817F8]();
    }
  }
}

void __63___PSSuggester_autocompleteSearchResultsWithPredictionContext___block_invoke_397(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __91___PSContactSuggester_contactSuggestionsWithMaxSuggestions_excludeContactsWithIdentifiers___block_invoke_cold_1();
  }
}

void __63___PSSuggester_autocompleteSearchResultsWithPredictionContext___block_invoke_400(uint64_t a1, void *a2)
{
}

void __68___PSSuggester_rankedAutocompleteSuggestionsFromContext_candidates___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = +[_PSLogging suggestionSignpost];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __91___PSContactSuggester_contactSuggestionsWithMaxSuggestions_excludeContactsWithIdentifiers___block_invoke_cold_1();
  }
}

void __68___PSSuggester_rankedAutocompleteSuggestionsFromContext_candidates___block_invoke_403(uint64_t a1, void *a2)
{
}

void __39___PSSuggester_rankedFamilySuggestions__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = +[_PSLogging suggestionSignpost];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __91___PSContactSuggester_contactSuggestionsWithMaxSuggestions_excludeContactsWithIdentifiers___block_invoke_cold_1();
  }
}

void __39___PSSuggester_rankedFamilySuggestions__block_invoke_406(uint64_t a1, void *a2)
{
}

void __69___PSSuggester_familyRecommendationSuggestionsWithPredictionContext___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = +[_PSLogging suggestionSignpost];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __91___PSContactSuggester_contactSuggestionsWithMaxSuggestions_excludeContactsWithIdentifiers___block_invoke_cold_1();
  }
}

void __69___PSSuggester_familyRecommendationSuggestionsWithPredictionContext___block_invoke_409(uint64_t a1, void *a2)
{
}

void __67___PSSuggester_photosRelationshipSuggestionsWithPredictionContext___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = +[_PSLogging suggestionSignpost];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __91___PSContactSuggester_contactSuggestionsWithMaxSuggestions_excludeContactsWithIdentifiers___block_invoke_cold_1();
  }
}

void __67___PSSuggester_photosRelationshipSuggestionsWithPredictionContext___block_invoke_412(uint64_t a1, void *a2)
{
}

void __72___PSSuggester_photosContactInferencesSuggestionsWithPredictionContext___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = +[_PSLogging suggestionSignpost];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __91___PSContactSuggester_contactSuggestionsWithMaxSuggestions_excludeContactsWithIdentifiers___block_invoke_cold_1();
  }
}

void __72___PSSuggester_photosContactInferencesSuggestionsWithPredictionContext___block_invoke_415(uint64_t a1, void *a2)
{
}

void __75___PSSuggester_relativeAppUsageProbabilitiesForCandidateBundleIds_daysAgo___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = +[_PSLogging suggestionSignpost];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __91___PSContactSuggester_contactSuggestionsWithMaxSuggestions_excludeContactsWithIdentifiers___block_invoke_cold_1();
  }
}

void __75___PSSuggester_relativeAppUsageProbabilitiesForCandidateBundleIds_daysAgo___block_invoke_421(uint64_t a1, void *a2)
{
}

id __37___PSSuggester_generatePSRTelemetry___block_invoke(uint64_t a1)
{
  uint64_t v1 = (void *)[*(id *)(a1 + 32) copy];

  return v1;
}

void __46___PSSuggester_provideFeedbackForSuggestions___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = +[_PSLogging feedbackChannel];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __91___PSContactSuggester_contactSuggestionsWithMaxSuggestions_excludeContactsWithIdentifiers___block_invoke_cold_1();
  }
}

void __46___PSSuggester_provideFeedbackForSuggestions___block_invoke_547(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[_PSLogging feedbackChannel];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [NSNumber numberWithBool:a2];
    int v5 = 138412290;
    uint64_t v6 = v4;
    _os_log_impl(&dword_1A314B000, v3, OS_LOG_TYPE_DEFAULT, "Persisted feedback, reply: %@", (uint8_t *)&v5, 0xCu);
  }
}

id __46___PSSuggester_provideFeedbackForSuggestions___block_invoke_588(uint64_t a1)
{
  uint64_t v1 = (void *)[*(id *)(a1 + 32) copy];

  return v1;
}

void __72___PSSuggester__recordFeedbackToInteractionStoreWithFeedback_mechanism___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = +[_PSLogging feedbackChannel];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __91___PSContactSuggester_contactSuggestionsWithMaxSuggestions_excludeContactsWithIdentifiers___block_invoke_cold_1();
  }
}

void __72___PSSuggester__recordFeedbackToInteractionStoreWithFeedback_mechanism___block_invoke_592(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v6 = (objc_class *)MEMORY[0x1E4F5B390];
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  id v22 = [v6 alloc];
  __int16 v20 = [v9 identifier];
  char v10 = [v9 cloudIdentifier];
  uint64_t v11 = [v9 photoLocalIdentifier];
  uint64_t v12 = [v9 UTI];
  int v13 = NSNumber;
  uint64_t v21 = [v9 imageData];
  uint64_t v14 = objc_msgSend(v13, "numberWithUnsignedInteger:", objc_msgSend(v21, "length"));
  uint64_t v15 = [v9 creationDate];
  id v16 = [v9 contentURL];
  id v17 = [v9 contentText];

  id v23 = (id)[v22 initWithIdentifier:v20 cloudIdentifier:v10 photoLocalIdentifier:v11 type:v12 sizeInBytes:v14 creationDate:v15 contentURL:v16 contentText:v17 photoSceneDescriptor:v8 personInPhoto:v7];
  uint64_t v18 = v23;
  if (v23)
  {
    [*(id *)(a1 + 32) addObject:v23];
    uint64_t v18 = v23;
  }
}

id __72___PSSuggester__recordFeedbackToInteractionStoreWithFeedback_mechanism___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 handleType];
  id v4 = [v2 displayName];

  if (v4)
  {
    uint64_t v5 = [v2 displayName];
  }
  else
  {
    uint64_t v6 = [v2 givenName];

    if (!v6) {
      goto LABEL_6;
    }
    uint64_t v5 = [v2 givenName];
  }
  uint64_t v6 = (void *)v5;
LABEL_6:
  if (v3 == 1) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = v3 == 2;
  }
  id v8 = objc_alloc(MEMORY[0x1E4F5B3A0]);
  id v9 = [v2 handle];
  char v10 = [v2 contact];
  uint64_t v11 = [v10 identifier];
  uint64_t v12 = (void *)[v8 initWithIdentifier:v9 type:v7 displayName:v6 personId:v11 personIdType:3];

  return v12;
}

void __72___PSSuggester__recordFeedbackToInteractionStoreWithFeedback_mechanism___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[_PSLogging feedbackChannel];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = [NSNumber numberWithBool:a2];
    int v5 = 138412290;
    uint64_t v6 = v4;
    _os_log_impl(&dword_1A314B000, v3, OS_LOG_TYPE_INFO, "Persisted interaction for feedback, reply: %@", (uint8_t *)&v5, 0xCu);
  }
}

void __62___PSSuggester_deleteInteractionsMatchingSuggestLessFeedback___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = +[_PSLogging feedbackChannel];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __91___PSContactSuggester_contactSuggestionsWithMaxSuggestions_excludeContactsWithIdentifiers___block_invoke_cold_1();
  }
}

void __62___PSSuggester_deleteInteractionsMatchingSuggestLessFeedback___block_invoke_631(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = +[_PSLogging feedbackChannel];
  uint64_t v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __62___PSSuggester_deleteInteractionsMatchingSuggestLessFeedback___block_invoke_631_cold_1(a1, (uint64_t)v4, v6);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [*(id *)(a1 + 32) contactId];
    id v8 = [*(id *)(a1 + 32) bundleId];
    id v9 = [*(id *)(a1 + 32) conversationId];
    int v10 = 138478339;
    uint64_t v11 = v7;
    __int16 v12 = 2113;
    int v13 = v8;
    __int16 v14 = 2113;
    uint64_t v15 = v9;
    _os_log_impl(&dword_1A314B000, v6, OS_LOG_TYPE_DEFAULT, "SuggestLess: Deleted all interactions for contact id: %{private}@ bundle: %{private}@ conversation id: %{private}@", (uint8_t *)&v10, 0x20u);
  }
}

uint64_t __57___PSSuggester_provideFeedbackForMessagesZkwSuggestions___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) feedbackPayload];
}

void __66___PSSuggester_provideFeedbackForContactsAutocompleteSuggestions___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = +[_PSLogging feedbackChannel];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __91___PSContactSuggester_contactSuggestionsWithMaxSuggestions_excludeContactsWithIdentifiers___block_invoke_cold_1();
  }
}

void __64___PSSuggester_writeFeedbackForContactsAutocompleteSuggestions___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 40))
  {
    uint64_t v1 = *(void *)(a1 + 40);
    id v2 = *(void **)(*(void *)(a1 + 32) + 40);
    [v2 sendEvent:v1];
  }
  else
  {
    uint64_t v3 = +[_PSLogging feedbackChannel];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __64___PSSuggester_writeFeedbackForContactsAutocompleteSuggestions___block_invoke_cold_1();
    }
  }
}

void __73___PSSuggester_validateCoreMLScoringModelWithRawInput_predictionContext___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = +[_PSLogging suggestionSignpost];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __91___PSContactSuggester_contactSuggestionsWithMaxSuggestions_excludeContactsWithIdentifiers___block_invoke_cold_1();
  }
}

void __73___PSSuggester_validateCoreMLScoringModelWithRawInput_predictionContext___block_invoke_638(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[_PSLogging feedbackChannel];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v10 = 0;
    _os_log_impl(&dword_1A314B000, v4, OS_LOG_TYPE_DEFAULT, "_PSSuggester: Validate CoreML reply was called", v10, 2u);
  }

  int v5 = [v3 scoredCoreMLCandidates];
  [*(id *)(a1 + 32) setScoredCoreMLCandidates:v5];

  uint64_t v6 = [v3 coreMLInputFeatureTensor];
  [*(id *)(a1 + 32) setCoreMLInputFeatureTensor:v6];

  uint64_t v7 = [v3 coreMLModelFeatureOrder];
  [*(id *)(a1 + 32) setCoreMLModelFeatureOrder:v7];

  id v8 = [v3 coreMLTensorIndexToCandidate];
  [*(id *)(a1 + 32) setCoreMLTensorIndexToCandidate:v8];

  id v9 = [v3 coreMLNumberOfCandidates];

  [*(id *)(a1 + 32) setCoreMLNumberOfCandidates:v9];
}

uint64_t __96___PSSuggester_InteractionInformation__interactionCountForHandle_fetchLimit_interactionStoreDB___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (![v3 isInteractionMechanismCalls]) {
    goto LABEL_7;
  }
  id v4 = [v3 startDate];
  int v5 = [v3 endDate];
  uint64_t v6 = v5;
  if (!v4 || !v5)
  {
LABEL_6:

LABEL_7:
    uint64_t v9 = 1;
    goto LABEL_8;
  }
  [v5 timeIntervalSinceDate:v4];
  double v8 = v7;
  if (v7 >= 30.0)
  {
    [*(id *)(a1 + 40) addObject:v3];
    goto LABEL_6;
  }
  uint64_t v11 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = *(void *)(a1 + 32);
    int v13 = 138478083;
    uint64_t v14 = v12;
    __int16 v15 = 2048;
    double v16 = v8;
    _os_log_impl(&dword_1A314B000, v11, OS_LOG_TYPE_DEFAULT, "_PSSuggester: Dropped interaction for handle: %{private}@ since call interval is %f", (uint8_t *)&v13, 0x16u);
  }

  uint64_t v9 = 0;
LABEL_8:

  return v9;
}

uint64_t __96___PSSuggester_InteractionInformation__interactionCountForHandle_fetchLimit_interactionStoreDB___block_invoke_252(uint64_t a1, void *a2)
{
  return [a2 isInteractionMechanismCalls];
}

uint64_t __54___PSSuggester_InteractionInformation___dateFormatter__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = (void *)_dateFormatter_dateFormatter;
  _dateFormatter_dateFormatter = v0;

  [(id)_dateFormatter_dateFormatter setDoesRelativeDateFormatting:1];
  [(id)_dateFormatter_dateFormatter setDateStyle:2];
  id v2 = (void *)_dateFormatter_dateFormatter;

  return [v2 setTimeStyle:2];
}

void __56___PSSuggester_initWithConfiguration_feedbackRecording___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_1A314B000, v0, v1, "Error creating Biome storage directory: %@", v2, v3, v4, v5, v6);
}

void __68___PSSuggester_showNotificationToFileARadarForUserStudyParticipants__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_1A314B000, v0, v1, "Error launching Tap-To-Radar for force-quit notification interaction: %@", v2, v3, v4, v5, v6);
}

void __63___PSSuggester_autocompleteSearchResultsWithPredictionContext___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1A314B000, v0, v1, "Unable to get xpc connection for autocompleteSearchResults", v2, v3, v4, v5, v6);
}

void __62___PSSuggester_deleteInteractionsMatchingSuggestLessFeedback___block_invoke_631_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [*(id *)(a1 + 32) contactId];
  OUTLINED_FUNCTION_0();
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_error_impl(&dword_1A314B000, a3, OS_LOG_TYPE_ERROR, "SuggestLess: Error deleting interactions for contact ID: %@ %@", v6, 0x16u);
}

void __64___PSSuggester_writeFeedbackForContactsAutocompleteSuggestions___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1A314B000, v0, v1, "_PSSuggester: No Biome source. Cannot log Contacts Autocomplete feedback.", v2, v3, v4, v5, v6);
}

@end