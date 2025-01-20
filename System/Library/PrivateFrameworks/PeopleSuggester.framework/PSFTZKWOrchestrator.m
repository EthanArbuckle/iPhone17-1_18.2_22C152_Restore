@interface PSFTZKWOrchestrator
@end

@implementation PSFTZKWOrchestrator

void __50___PSFTZKWOrchestrator_updateConfigWithTrialData___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_opt_new();
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 56);
  *(void *)(v3 + 56) = v2;

  uint64_t v5 = *(void *)(a1 + 32);
  v6 = *(void **)(v5 + 8);
  v7 = [*(id *)(v5 + 56) calendarEventConfig];
  [v6 updateWithConfig:v7];

  uint64_t v8 = *(void *)(a1 + 32);
  v9 = *(void **)(v8 + 16);
  v10 = [*(id *)(v8 + 56) unstructuredCalendarConfig];
  [v9 updateWithCalendarConfig:v10];

  uint64_t v11 = *(void *)(a1 + 32);
  v12 = *(void **)(v11 + 24);
  v13 = [*(id *)(v11 + 56) unstructuredRemindersConfig];
  [v12 updateWithRemindersConfig:v13];

  uint64_t v14 = *(void *)(a1 + 32);
  v15 = *(void **)(v14 + 32);
  v16 = [*(id *)(v14 + 56) faceTimeInteractionsConfig];
  [v15 updateWithPrimaryInteractionsConfig:v16];

  uint64_t v17 = *(void *)(a1 + 32);
  v18 = *(void **)(v17 + 40);
  id v19 = [*(id *)(v17 + 56) fallbackInteractionsConfig];
  [v18 updateWithFallbackInteractionsConfig:v19];
}

_PSSuggestion *__64___PSFTZKWOrchestrator__getBlendingLayerSuggestionsWithContext___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 executableSpecification];
  v4 = [v3 executableObject];

  uint64_t v5 = [v4 reason];

  if (v5)
  {
    v6 = v4;
  }
  else
  {
    v7 = [_PSSuggestion alloc];
    v20 = [v4 bundleID];
    uint64_t v8 = [v4 conversationIdentifier];
    id v19 = [v4 groupName];
    v9 = [v4 recipients];
    v10 = [v4 derivedIntentIdentifier];
    uint64_t v11 = [v4 image];
    v12 = NSString;
    v18 = [v2 clientModelSpecification];
    uint64_t v17 = [v18 clientModelId];
    v13 = [v12 stringWithFormat:@"External Model (%@)", v17];
    uint64_t v14 = [v4 score];
    LOBYTE(v16) = [v4 familySuggestion];
    v6 = [(_PSSuggestion *)v7 initWithBundleID:v20 conversationIdentifier:v8 groupName:v19 recipients:v9 derivedIntentIdentifier:v10 image:v11 reason:v13 reasonType:0 score:v14 familySuggestion:v16];
  }

  return v6;
}

void __69___PSFTZKWOrchestrator__getDirectSuggestionsWithContext_withTimeout___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) count])
  {
    unint64_t v3 = 0;
    double v4 = 0.0;
    *(void *)&long long v2 = 138413058;
    long long v21 = v2;
    do
    {
      uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v3, v21);
      uint64_t v6 = [v5 unsignedIntegerValue];

      v7 = [MEMORY[0x1E4F1C9C8] now];
      uint64_t v8 = *(void **)(a1 + 40);
      v9 = [NSNumber numberWithUnsignedInteger:v6];
      v10 = [v8 objectForKeyedSubscript:v9];

      uint64_t v11 = [v10 getSuggestionsWithPredictionContext:*(void *)(a1 + 48)];
      os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 64) + 8) + 32));
      v12 = *(void **)(a1 + 56);
      v13 = [NSNumber numberWithUnsignedInteger:v6];
      [v12 setObject:v11 forKeyedSubscript:v13];

      os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 64) + 8) + 32));
      uint64_t v14 = [MEMORY[0x1E4F1C9C8] now];
      [v14 timeIntervalSinceDate:v7];
      double v16 = v15;

      double v4 = v4 + v16;
      double v17 = *(double *)(a1 + 72);
      v18 = +[_PSLogging generalChannel];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        id v19 = (objc_class *)objc_opt_class();
        v20 = NSStringFromClass(v19);
        *(_DWORD *)buf = v21;
        v23 = v20;
        __int16 v24 = 2048;
        double v25 = v16;
        __int16 v26 = 2048;
        double v27 = v4;
        __int16 v28 = 1024;
        BOOL v29 = v4 > v17;
        _os_log_impl(&dword_1A314B000, v18, OS_LOG_TYPE_DEFAULT, "ZKW FaceTime default route %@ took %f seconds, cummulative seconds %f, timed out %d", buf, 0x26u);
      }
      if (v4 > v17) {
        break;
      }
      ++v3;
    }
    while (v3 < [*(id *)(a1 + 32) count]);
  }
}

void __69___PSFTZKWOrchestrator__getDirectSuggestionsWithContext_withTimeout___block_invoke_47()
{
  v0 = (void *)MEMORY[0x1A6243860]();
  dispatch_queue_t v1 = dispatch_queue_create("ps_ft_zkw_queue", 0);
  long long v2 = (void *)_getDirectSuggestionsWithContext_withTimeout___pasExprOnceResult;
  _getDirectSuggestionsWithContext_withTimeout___pasExprOnceResult = (uint64_t)v1;
}

void __60___PSFTZKWOrchestrator_getSuggestionsWithPredictionContext___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  char v2 = [*(id *)(*(void *)(a1 + 32) + 56) useBlendingLayer];
  unint64_t v3 = +[_PSLogging suggestionSignpost];
  BOOL v4 = os_signpost_enabled(v3);
  if (v2)
  {
    if (v4)
    {
      LOWORD(v17) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A314B000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSZKWFaceTimeBlendingRouteTotalTime", " enableTelemetry=YES ", (uint8_t *)&v17, 2u);
    }

    uint64_t v5 = [*(id *)(a1 + 32) _getBlendingLayerSuggestionsWithContext:*(void *)(a1 + 40)];
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    uint64_t v8 = +[_PSLogging suggestionSignpost];
    if (os_signpost_enabled(v8))
    {
      LOWORD(v17) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A314B000, v8, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSZKWFaceTimeBlendingRouteTotalTime", (const char *)&unk_1A3274816, (uint8_t *)&v17, 2u);
    }

    v9 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      int v17 = 138412290;
      uint64_t v18 = v10;
      uint64_t v11 = "ZKW FaceTime suggestions going through blending layer route: %@";
LABEL_14:
      _os_log_impl(&dword_1A314B000, v9, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v17, 0xCu);
    }
  }
  else
  {
    if (v4)
    {
      LOWORD(v17) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A314B000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSZKWFaceTimeDefaultRouteTotalTime", " enableTelemetry=YES ", (uint8_t *)&v17, 2u);
    }

    uint64_t v12 = [*(id *)(a1 + 32) _getDirectSuggestionsWithContext:*(void *)(a1 + 40)];
    uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

    double v15 = +[_PSLogging suggestionSignpost];
    if (os_signpost_enabled(v15))
    {
      LOWORD(v17) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A314B000, v15, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSZKWFaceTimeDefaultRouteTotalTime", (const char *)&unk_1A3274816, (uint8_t *)&v17, 2u);
    }

    v9 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      int v17 = 138412290;
      uint64_t v18 = v16;
      uint64_t v11 = "ZKW FaceTime suggestions going through default route: %@";
      goto LABEL_14;
    }
  }
}

void __38___PSFTZKWOrchestrator_populateCaches__block_invoke(uint64_t a1)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    unint64_t v3 = +[_PSLogging suggestionSignpost];
    if (os_signpost_enabled(v3))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A314B000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSZKWFaceTimeCacheTotalTime", " enableTelemetry=YES ", v12, 2u);
    }

    BOOL v4 = [WeakRetained _getDirectSuggestionsWithContext:*(void *)(a1 + 32) withTimeout:0.2];
    uint64_t v5 = [[_PSFTZKWSuggestionsTransformerFactory alloc] initWithInteractionStore:WeakRetained[8]];
    uint64_t v6 = (void *)MEMORY[0x1E4F1CA48];
    v7 = [(_PSFTZKWSuggestionsTransformerFactory *)v5 mapRecipientsToContactsWithUnmapped:0];
    v13[0] = v7;
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    v9 = [v6 arrayWithArray:v8];
    id v10 = +[_PSFTZKWSuggestionsTransformerFactory getResultsFromTransformers:v9 suggestions:v4];

    uint64_t v11 = +[_PSLogging suggestionSignpost];
    if (os_signpost_enabled(v11))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A314B000, v11, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSZKWFaceTimeCacheTotalTime", (const char *)&unk_1A3274816, v12, 2u);
    }
  }
}

@end