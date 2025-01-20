@interface PSEnsembleModel
@end

@implementation PSEnsembleModel

uint64_t __24___PSEnsembleModel_init__block_invoke()
{
  return [MEMORY[0x1E4F93B10] runBlockWhenDeviceIsClassCUnlocked:&__block_literal_global_392];
}

void __24___PSEnsembleModel_init__block_invoke_2()
{
  v0 = dispatch_get_global_queue(-2, 0);
  dispatch_async(v0, &__block_literal_global_394);
}

id __24___PSEnsembleModel_init__block_invoke_3()
{
  return +[_PSBlockedHandlesCache sharedBlockedHandlesCache];
}

void __38___PSEnsembleModel_feedbackDictionary__block_invoke()
{
  v0 = (void *)MEMORY[0x1A6243860]();
  id v1 = objc_alloc(MEMORY[0x1E4F93B70]);
  v2 = objc_opt_new();
  uint64_t v3 = [v1 initWithGuardedData:v2];
  v4 = (void *)feedbackDictionary__pasExprOnceResult;
  feedbackDictionary__pasExprOnceResult = v3;
}

void __81___PSEnsembleModel_saveFeedback_forSessionId_feedbackActionType_isFallbackFetch___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ((unint64_t)[v5 count] >= 0xB) {
    [v5 removeAllObjects];
  }
  uint64_t v3 = v5;
  if (*(void *)(a1 + 32))
  {
    v4 = objc_opt_new();
    [v4 setConversationId:*(void *)(a1 + 40)];
    [v4 setFeedbackActionType:*(void *)(a1 + 48)];
    [v4 setIsFallbackFetch:*(unsigned __int8 *)(a1 + 56)];
    [v5 setObject:v4 forKeyedSubscript:*(void *)(a1 + 32)];

    uint64_t v3 = v5;
  }
}

uint64_t __34___PSEnsembleModel_forgetSession___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setObject:0 forKeyedSubscript:*(void *)(a1 + 32)];
}

void __37___PSEnsembleModel_registerWithTrial__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained updateFactorLevels];
    id WeakRetained = v2;
  }
}

uint64_t __57___PSEnsembleModel_populateCachesWithSupportedBundleIDs___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)a1[4];
  id v5 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "direction"));
  if ([v4 containsObject:v5])
  {
    v6 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "mechanism"));
    if ([v6 isEqualToNumber:a1[5]])
    {
      v7 = [v3 bundleId];
      if (v7)
      {
        v8 = (void *)a1[6];
        v9 = [v3 bundleId];
        uint64_t v10 = [v8 containsObject:v9];
      }
      else
      {
        uint64_t v10 = 0;
      }
    }
    else
    {
      uint64_t v10 = 0;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

uint64_t __57___PSEnsembleModel_populateCachesWithSupportedBundleIDs___block_invoke_2(void *a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)a1[4];
  id v5 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "direction"));
  if ([v4 containsObject:v5])
  {
    v6 = (void *)a1[5];
    v7 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "mechanism"));
    if ([v6 containsObject:v7])
    {
      v8 = [v3 targetBundleId];
      if (v8)
      {
        v9 = (void *)a1[6];
        uint64_t v10 = [v3 targetBundleId];
        uint64_t v11 = [v9 containsObject:v10];
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
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

void __57___PSEnsembleModel_populateCachesWithSupportedBundleIDs___block_invoke_3(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) messageInteractionCache];
  id v2 = [*(id *)(a1 + 32) shareInteractionCache];
  id v3 = [*(id *)(a1 + 32) contactMonitor];
  [v3 populateContactIdCachesWithMessageCache:v4 shareCache:v2];
}

void __57___PSEnsembleModel_populateCachesWithSupportedBundleIDs___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = (id)[a2 copy];
  [*(id *)(a1 + 32) setZkwFTTrialData:v3];
}

BOOL __57___PSEnsembleModel_populateCachesWithSupportedBundleIDs___block_invoke_5(void *a1, void *a2)
{
  id v3 = a2;
  if ((*(uint64_t (**)(void))(a1[7] + 16))() & 1) != 0 || ((*(uint64_t (**)(void))(a1[8] + 16))())
  {
    BOOL v4 = 0;
  }
  else
  {
    id v5 = (void *)a1[4];
    v6 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "direction"));
    if ([v5 containsObject:v6])
    {
      v7 = (void *)a1[5];
      v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "mechanism"));
      if ([v7 containsObject:v8])
      {
        v9 = [v3 bundleId];
        if (v9)
        {
          uint64_t v10 = [v3 bundleId];
          uint64_t v11 = +[_PSConstants contactsAutocompleteBundleId];
          if (v10 == v11)
          {
            BOOL v4 = 0;
          }
          else
          {
            v12 = (void *)a1[6];
            v13 = [v3 startDate];
            if ([v12 compare:v13] == 1)
            {
              v14 = (void *)a1[6];
              v15 = [v3 startDate];
              BOOL v4 = [v14 compare:v15] == 1;
            }
            else
            {
              BOOL v4 = 0;
            }
          }
        }
        else
        {
          BOOL v4 = 0;
        }
      }
      else
      {
        BOOL v4 = 0;
      }
    }
    else
    {
      BOOL v4 = 0;
    }
  }
  return v4;
}

void __72___PSEnsembleModel_fetchSupportedBundleIDsWithPredictionContextFilters___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:")) {
    [*(id *)(a1 + 40) addObject:v3];
  }
}

void __63___PSEnsembleModel_psr_getPhotoBasedFeaturesAsync_withTimeout___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __63___PSEnsembleModel_psr_getPhotoBasedFeaturesAsync_withTimeout___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F1C9C8] date];
  [v2 timeIntervalSinceDate:*(void *)(a1 + 32)];
  double v4 = v3;

  double v5 = fmax(*(double *)(a1 + 80) - v4, 0.0);
  v6 = *(NSObject **)(a1 + 40);
  if (v5 <= 0.0)
  {
    dispatch_time_t v7 = 0;
  }
  else if (v5 <= 9223372040.0)
  {
    dispatch_time_t v7 = dispatch_time(0, (uint64_t)(v5 * 1000000000.0));
  }
  else
  {
    dispatch_time_t v7 = -1;
  }
  if (dispatch_semaphore_wait(v6, v7))
  {
    +[_PSPhotoSuggestions cancelRequestWithToken:*(void *)(a1 + 48)];
    dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 40), 0xFFFFFFFFFFFFFFFFLL);
  }
  v8 = +[_PSLogging suggestionSignpost];
  v9 = v8;
  os_signpost_id_t v10 = *(void *)(a1 + 88);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A314B000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v10, "_PSEnsembleModel_getPhotoBasedFeatures_setPeopleAnalysis", " enableTelemetry=YES ", buf, 2u);
  }

  uint64_t v11 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) allObjects];
  [*(id *)(a1 + 56) setPeopleInPhotoIdentifiers:v11];

  [*(id *)(a1 + 64) setPeopleAnalysisFromAssetsWithPredictionContext:*(void *)(a1 + 56) identifiersOfPeopleInPhotos:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
  v12 = +[_PSLogging suggestionSignpost];
  v13 = v12;
  os_signpost_id_t v14 = *(void *)(a1 + 88);
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)v19 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A314B000, v13, OS_SIGNPOST_INTERVAL_END, v14, "_PSEnsembleModel_getPhotoBasedFeatures_setPeopleAnalysis", (const char *)&unk_1A3274816, v19, 2u);
  }

  v15 = +[_PSLogging suggestionSignpost];
  v16 = v15;
  os_signpost_id_t v17 = *(void *)(a1 + 88);
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)v18 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A314B000, v16, OS_SIGNPOST_INTERVAL_END, v17, "_PSEnsembleModel_getPhotoBasedFeatures", (const char *)&unk_1A3274816, v18, 2u);
  }
}

void __59___PSEnsembleModel_getPhotoBasedFeaturesAsync_withTimeout___block_invoke_560(void *a1)
{
  id v2 = +[_PSLogging suggestionSignpost];
  double v3 = v2;
  os_signpost_id_t v4 = a1[7];
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A314B000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v4, "_PSEnsembleModel_getPhotoBasedFeatures_mdPersonIDsOfPeopleInSharedPhotoAssets", " enableTelemetry=YES ", buf, 2u);
  }

  uint64_t v5 = +[_PSPhotoSuggestions mdPersonIDsOfPeopleInSharedPhotoAttachments:a1[4] forBundleID:a1[5]];
  uint64_t v6 = *(void *)(a1[6] + 8);
  dispatch_time_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  v8 = +[_PSLogging suggestionSignpost];
  v9 = v8;
  os_signpost_id_t v10 = a1[7];
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)uint64_t v11 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A314B000, v9, OS_SIGNPOST_INTERVAL_END, v10, "_PSEnsembleModel_getPhotoBasedFeatures_mdPersonIDsOfPeopleInSharedPhotoAssets", (const char *)&unk_1A3274816, v11, 2u);
  }
}

void __59___PSEnsembleModel_getPhotoBasedFeaturesAsync_withTimeout___block_invoke_561()
{
  v0 = (void *)MEMORY[0x1A6243860]();
  uint64_t v1 = [MEMORY[0x1E4F93B18] autoreleasingSerialQueueWithLabel:"getPhotoBasedFeatures"];
  id v2 = (void *)getPhotoBasedFeaturesAsync_withTimeout___pasExprOnceResult;
  getPhotoBasedFeaturesAsync_withTimeout___pasExprOnceResult = v1;
}

void __59___PSEnsembleModel_getPhotoBasedFeaturesAsync_withTimeout___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F1C9C8] date];
  [v2 timeIntervalSinceDate:*(void *)(a1 + 32)];
  double v4 = v3;

  double v5 = fmax(*(double *)(a1 + 72) - v4, 0.0);
  uint64_t v6 = *(void **)(a1 + 56);
  if (v5 <= 0.0)
  {
    dispatch_time_t v7 = 0;
  }
  else if (v5 <= 9223372040.0)
  {
    dispatch_time_t v7 = dispatch_time(0, (uint64_t)(v5 * 1000000000.0));
  }
  else
  {
    dispatch_time_t v7 = -1;
  }
  if (dispatch_block_wait(v6, v7))
  {
    id v8 = [MEMORY[0x1E4F1CAD0] set];
  }
  else
  {
    id v8 = *(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  }
  v9 = v8;
  os_signpost_id_t v10 = +[_PSLogging suggestionSignpost];
  uint64_t v11 = v10;
  os_signpost_id_t v12 = *(void *)(a1 + 80);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A314B000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v12, "_PSEnsembleModel_getPhotoBasedFeatures_setPeopleAnalysis", " enableTelemetry=YES ", buf, 2u);
  }

  v13 = [v9 allObjects];
  [*(id *)(a1 + 40) setPeopleInPhotoIdentifiers:v13];

  [*(id *)(a1 + 48) setPeopleAnalysisFromAssetsWithPredictionContext:*(void *)(a1 + 40) identifiersOfPeopleInPhotos:v9];
  os_signpost_id_t v14 = +[_PSLogging suggestionSignpost];
  v15 = v14;
  os_signpost_id_t v16 = *(void *)(a1 + 80);
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)v29 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A314B000, v15, OS_SIGNPOST_INTERVAL_END, v16, "_PSEnsembleModel_getPhotoBasedFeatures_setPeopleAnalysis", (const char *)&unk_1A3274816, v29, 2u);
  }

  if (_os_feature_enabled_impl())
  {
    os_signpost_id_t v17 = +[_PSLogging suggestionSignpost];
    v18 = v17;
    os_signpost_id_t v19 = *(void *)(a1 + 80);
    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      *(_WORD *)v28 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A314B000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v19, "_PSEnsembleModel_getPhotoBasedFeatures_setPhotoAnalysisFromAssetsWithPredictionContext", " enableTelemetry=YES ", v28, 2u);
    }

    [*(id *)(a1 + 48) setPhotoAnalysisFromAssetsWithPredictionContext:*(void *)(a1 + 40)];
    v20 = +[_PSLogging suggestionSignpost];
    v21 = v20;
    os_signpost_id_t v22 = *(void *)(a1 + 80);
    if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      *(_WORD *)v27 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A314B000, v21, OS_SIGNPOST_INTERVAL_END, v22, "_PSEnsembleModel_getPhotoBasedFeatures_setPhotoAnalysisFromAssetsWithPredictionContext", (const char *)&unk_1A3274816, v27, 2u);
    }
  }
  v23 = +[_PSLogging suggestionSignpost];
  v24 = v23;
  os_signpost_id_t v25 = *(void *)(a1 + 80);
  if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    *(_WORD *)v26 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A314B000, v24, OS_SIGNPOST_INTERVAL_END, v25, "_PSEnsembleModel_getPhotoBasedFeatures", (const char *)&unk_1A3274816, v26, 2u);
  }
}

uint64_t __70___PSEnsembleModel_getModelSuggestionsProxyDictWithModelProxiesArray___block_invoke()
{
  return MEMORY[0x1E4F1CBF0];
}

uint64_t __83___PSEnsembleModel_predictWithPredictionContext_maxSuggestions_contactKeysToFetch___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F93B18] autoreleasingSerialQueueWithLabel:"getMeContactIdentifier"];
  uint64_t v1 = (void *)predictWithPredictionContext_maxSuggestions_contactKeysToFetch__getMeContactIdentifierPrefetchQueue;
  predictWithPredictionContext_maxSuggestions_contactKeysToFetch__getMeContactIdentifierPrefetchQueue = v0;

  predictWithPredictionContext_maxSuggestions_contactKeysToFetch__trialRankingModelPrefetchQueue = [MEMORY[0x1E4F93B18] autoreleasingSerialQueueWithLabel:"trialRankingModel"];

  return MEMORY[0x1F41817F8]();
}

void __83___PSEnsembleModel_predictWithPredictionContext_maxSuggestions_contactKeysToFetch___block_invoke_2(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) createSubSpanWithName:@"getMeContactIdentifier"];
  [v5 start];
  uint64_t v2 = [*(id *)(a1 + 40) getMeContactIdentifier];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  double v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  [v5 end];
}

id __83___PSEnsembleModel_predictWithPredictionContext_maxSuggestions_contactKeysToFetch___block_invoke_3(uint64_t a1)
{
  dispatch_block_wait(*(dispatch_block_t *)(a1 + 32), 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  return v2;
}

id __83___PSEnsembleModel_predictWithPredictionContext_maxSuggestions_contactKeysToFetch___block_invoke_633(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) rankingModel];
}

id __83___PSEnsembleModel_predictWithPredictionContext_maxSuggestions_contactKeysToFetch___block_invoke_706(uint64_t a1)
{
  uint64_t v1 = (void *)[objc_alloc(MEMORY[0x1E4F93BB8]) initWithFirst:*(void *)(a1 + 32) second:*(void *)(a1 + 40)];

  return v1;
}

uint64_t __83___PSEnsembleModel_predictWithPredictionContext_maxSuggestions_contactKeysToFetch___block_invoke_712(uint64_t a1)
{
  return [*(id *)(a1 + 32) freeCachesIfNotCoreDuetDaemon];
}

id __83___PSEnsembleModel_predictWithPredictionContext_maxSuggestions_contactKeysToFetch___block_invoke_717(uint64_t a1)
{
  uint64_t v17 = 0;
  v18[0] = &v17;
  v18[1] = 0x2020000000;
  int v19 = 0;
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = +[_PSCandidate selfCandidate];
  double v4 = [v2 setByAddingObject:v3];

  id v5 = [v4 allObjects];
  id v6 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  v13 = __83___PSEnsembleModel_predictWithPredictionContext_maxSuggestions_contactKeysToFetch___block_invoke_2_719;
  os_signpost_id_t v14 = &unk_1E5ADEF80;
  id v15 = *(id *)(a1 + 40);
  os_signpost_id_t v16 = &v17;
  dispatch_time_t v7 = objc_msgSend(v5, "_pas_mappedArrayWithTransform:", &v11);
  id v8 = objc_msgSend(v6, "initWithObjects:forKeys:", v7, v5, v11, v12, v13, v14);

  if (*(int *)(v18[0] + 24) >= 1)
  {
    v9 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      __83___PSEnsembleModel_predictWithPredictionContext_maxSuggestions_contactKeysToFetch___block_invoke_717_cold_1((uint64_t)v18, v9);
    }
  }
  _Block_object_dispose(&v17, 8);

  return v8;
}

id __83___PSEnsembleModel_predictWithPredictionContext_maxSuggestions_contactKeysToFetch___block_invoke_2_719(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
  id v5 = v4;
  if (!v4)
  {
    id v6 = *(void **)(a1 + 32);
    dispatch_time_t v7 = [v3 candidateForDeduping];
    double v4 = [v6 objectForKeyedSubscript:v7];

    id v5 = v4;
    if (!v4)
    {
      ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      double v4 = (void *)MEMORY[0x1E4F1CC08];
    }
  }
  id v8 = v4;

  return v8;
}

id __83___PSEnsembleModel_predictWithPredictionContext_maxSuggestions_contactKeysToFetch___block_invoke_728(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        if (v8)
        {
          v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(*((void *)&v16 + 1) + 8 * i)];

          if (v9)
          {
            os_signpost_id_t v10 = NSString;
            uint64_t v11 = [*(id *)(a1 + 32) objectForKeyedSubscript:v8];
            uint64_t v12 = [v11 count];
            v13 = [v10 stringWithFormat:@"%@:%tu", v8, v12, (void)v16];
            [v2 addObject:v13];
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);
  }

  os_signpost_id_t v14 = objc_msgSend(v2, "_pas_componentsJoinedByString:", @",");

  return v14;
}

uint64_t __83___PSEnsembleModel_predictWithPredictionContext_maxSuggestions_contactKeysToFetch___block_invoke_738(uint64_t a1)
{
  [*(id *)(a1 + 32) addExtraInformationWithSuggestions:*(void *)(a1 + 40) modelSuggestionProxiesDict:*(void *)(a1 + 48)];
  id v2 = *(void **)(*(void *)(a1 + 32) + 24);

  return [v2 saveToVirtualStore];
}

void __83___PSEnsembleModel_predictWithPredictionContext_maxSuggestions_contactKeysToFetch___block_invoke_2_745(uint64_t a1, void *a2, unsigned __int8 a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = [v5 reasonType];
  dispatch_time_t v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];
  v29 = v7;
  if (v7)
  {
    uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "unsignedIntegerValue") + 1);
    [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v6];
  }
  else
  {
    [*(id *)(a1 + 32) setObject:&unk_1EF674E08 forKeyedSubscript:v6];
  }
  v9 = [v5 conversationIdentifier];
  if (!v9
    || ([MEMORY[0x1E4F1CA98] null],
        os_signpost_id_t v10 = objc_claimAutoreleasedReturnValue(),
        int v11 = [v10 isEqual:v9],
        v10,
        v11))
  {
    uint64_t v12 = [v5 derivedIntentIdentifier];

    v9 = (void *)v12;
  }
  v13 = [v5 score];
  if (v13)
  {
    os_signpost_id_t v14 = [v5 score];
    [v14 doubleValue];
    double v16 = v15;
  }
  else
  {
    double v16 = -1.0;
  }

  long long v17 = (void *)[objc_alloc((Class)get_PSPeopleSuggestionsMetricsModelClass()) initWithModelIdentifier:v6 trialIdentifier:0];
  id v18 = objc_alloc((Class)getPSPeopleSuggestionsMetricsItemClass());
  long long v19 = [v5 bundleID];
  v20 = [*(id *)(a1 + 32) valueForKey:v6];
  uint64_t v21 = objc_msgSend(v18, "initWithId:modelIdentifier:transportBundleId:rank:score:", v9, v17, v19, objc_msgSend(v20, "unsignedShortValue"), v16);

  if (v21)
  {
    [*(id *)(a1 + 40) addObject:v21];
  }
  else
  {
    os_signpost_id_t v22 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
      __83___PSEnsembleModel_predictWithPredictionContext_maxSuggestions_contactKeysToFetch___block_invoke_2_745_cold_2();
    }
  }
  v23 = (void *)[objc_alloc((Class)get_PSPeopleSuggestionsMetricsModelClass()) initWithModelIdentifier:*(void *)(a1 + 48) trialIdentifier:0];
  id v24 = objc_alloc((Class)getPSPeopleSuggestionsMetricsItemClass());
  os_signpost_id_t v25 = [v5 bundleID];
  v26 = (void *)[v24 initWithId:v9 modelIdentifier:v23 transportBundleId:v25 rank:a3 score:v16];

  if ([*(id *)(a1 + 40) containsObject:v26])
  {
    v27 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v9;
      _os_log_impl(&dword_1A314B000, v27, OS_LOG_TYPE_DEFAULT, "Duplicate ensemble suggestion: {%@}", buf, 0xCu);
    }
  }
  if (v26)
  {
    [*(id *)(a1 + 40) addObject:v26];
  }
  else
  {
    v28 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT)) {
      __83___PSEnsembleModel_predictWithPredictionContext_maxSuggestions_contactKeysToFetch___block_invoke_2_745_cold_1();
    }
  }
}

id __83___PSEnsembleModel_predictWithPredictionContext_maxSuggestions_contactKeysToFetch___block_invoke_751(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v4 = [v2 configWithAnchorDate:v3];

  [*(id *)(a1 + 40) enrichConfig:v4 withInformationFromPredictionContext:*(void *)(a1 + 48)];
  id v5 = [*(id *)(a1 + 40) interactionStore];
  uint64_t v6 = [v5 getInteractionsStatisticsForConfig:v4];

  dispatch_time_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F93BB8]) initWithFirst:v4 second:v6];

  return v7;
}

void __82___PSEnsembleModel_addExtraInformationWithSuggestions_modelSuggestionProxiesDict___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 conversationIdentifier];
  if (v4)
  {
    id v5 = [MEMORY[0x1E4F1CA98] null];
    int v6 = [v5 isEqual:v4];

    if (!v6) {
      goto LABEL_4;
    }
  }
  uint64_t v7 = [v3 derivedIntentIdentifier];

  uint64_t v4 = v7;
  if (v7)
  {
LABEL_4:
    uint64_t v8 = *(void **)(*(void *)(a1 + 32) + 24);
    id v9 = objc_alloc(MEMORY[0x1E4F4FEE8]);
    os_signpost_id_t v10 = [NSNumber numberWithUnsignedInteger:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
    int v11 = (void *)[v9 initWithIntValue:v10 doubleValue:0 stringValue:0 BOOLValue:0 timeBucketValue:0];
    uint64_t v12 = [v3 bundleID];
    [v8 setFeatureValueForFeatureName:690 featureValue:v11 candidate:v4 bundleID:v12];

    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
  else
  {
    uint64_t v4 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      __82___PSEnsembleModel_addExtraInformationWithSuggestions_modelSuggestionProxiesDict___block_invoke_cold_1();
    }
  }
}

void __82___PSEnsembleModel_addExtraInformationWithSuggestions_modelSuggestionProxiesDict___block_invoke_755(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __82___PSEnsembleModel_addExtraInformationWithSuggestions_modelSuggestionProxiesDict___block_invoke_2;
  v7[3] = &unk_1E5ADF098;
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v5;
  [a3 enumerateObjectsUsingBlock:v7];
}

void __82___PSEnsembleModel_addExtraInformationWithSuggestions_modelSuggestionProxiesDict___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v15 = a2;
  id v5 = [v15 interactionRecipients];

  if (v5)
  {
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = (void *)v6[3];
    uint64_t v9 = [v6 modelProxyToVirtualFeatureStoreFeature:v7];
    id v10 = objc_alloc(MEMORY[0x1E4F4FEE8]);
    int v11 = [NSNumber numberWithUnsignedInteger:a3];
    uint64_t v12 = (void *)[v10 initWithIntValue:v11 doubleValue:0 stringValue:0 BOOLValue:0 timeBucketValue:0];
    v13 = [v15 interactionRecipients];
    os_signpost_id_t v14 = [v15 bundleID];
    [v8 setFeatureValueForFeatureName:v9 featureValue:v12 candidate:v13 bundleID:v14];
  }
}

void __105___PSEnsembleModel__suggestionInteractionPredicatesForFirstPartyMessages_bundleID_interactionRecipients___block_invoke()
{
  v9[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(direction == %@ OR direction == %@) AND mechanism == %@ AND domainIdentifier != nil AND bundleId == $bundleID AND domainIdentifier == $interactionRecipients", &unk_1EF674D00, &unk_1EF674D18, &unk_1EF674D48];
  v9[0] = v0;
  uint64_t v1 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(direction == %@ OR direction == %@) AND mechanism == %@ AND domainIdentifier != nil AND targetBundleId == $bundleID AND domainIdentifier == $interactionRecipients", &unk_1EF674D00, &unk_1EF674D18, &unk_1EF674CB8];
  v9[1] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  id v3 = (void *)_suggestionInteractionPredicatesForFirstPartyMessages_bundleID_interactionRecipients__firstPartyMessagesPredicates;
  _suggestionInteractionPredicatesForFirstPartyMessages_bundleID_interactionRecipients__firstPartyMessagesPredicates = v2;

  uint64_t v4 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(direction == %@ OR direction == %@) AND mechanism == %@ AND derivedIntentIdentifier != nil AND bundleId == $bundleID AND derivedIntentIdentifier == $interactionRecipients", &unk_1EF674D00, &unk_1EF674D18, &unk_1EF674D48];
  id v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(direction == %@ OR direction == %@) AND mechanism == %@ AND derivedIntentIdentifier != nil AND targetBundleId == $bundleID AND derivedIntentIdentifier == $interactionRecipients", &unk_1EF674D00, &unk_1EF674D18, &unk_1EF674CB8, v4];
  v8[1] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  uint64_t v7 = (void *)_suggestionInteractionPredicatesForFirstPartyMessages_bundleID_interactionRecipients__thirdPartyPredicates;
  _suggestionInteractionPredicatesForFirstPartyMessages_bundleID_interactionRecipients__thirdPartyPredicates = v6;
}

uint64_t __105___PSEnsembleModel__suggestionInteractionPredicatesForFirstPartyMessages_bundleID_interactionRecipients___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 predicateWithSubstitutionVariables:*(void *)(a1 + 32)];
}

id __126___PSEnsembleModel_suggestionsFromSuggestionProxies_supportedBundleIDs_contactKeysToFetch_meContactIdentifier_maxSuggestions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)[a2 copy];
  id v3 = (void *)MEMORY[0x1E4F5B3B0];
  uint64_t v4 = [v2 identifier];
  id v5 = [v3 normalizedStringFromContactString:v4];
  [v2 setIdentifier:v5];

  return v2;
}

NSObject *__126___PSEnsembleModel_suggestionsFromSuggestionProxies_supportedBundleIDs_contactKeysToFetch_meContactIdentifier_maxSuggestions___block_invoke_810(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) interactionStore];
  uint64_t v8 = *(void *)(a1 + 40);
  id v14 = 0;
  uint64_t v9 = [v7 queryInteractionsUsingPredicate:v6 sortDescriptors:v8 limit:1 offset:0 error:&v14];
  id v10 = v14;
  int v11 = [v9 firstObject];

  if (!v11)
  {
    if (!v10) {
      goto LABEL_9;
    }
    uint64_t v12 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __126___PSEnsembleModel_suggestionsFromSuggestionProxies_supportedBundleIDs_contactKeysToFetch_meContactIdentifier_maxSuggestions___block_invoke_810_cold_1();
    }
    goto LABEL_8;
  }
  if (!v5 || _CDStartDateCompare() == -1)
  {
    uint64_t v12 = v5;
    id v5 = v11;
LABEL_8:
  }
LABEL_9:

  return v5;
}

id __68___PSEnsembleModel_predictWithMapsPredictionContext_maxSuggestions___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = (objc_class *)NSString;
  id v6 = a2;
  id v7 = [v5 alloc];
  uint64_t v8 = [*(id *)(a1 + 32) indexOfObjectIdenticalTo:v6];

  uint64_t v9 = objc_msgSend(v7, "initWithFormat:", @"%tu -> %tu", v8, a3);

  return v9;
}

id __68___PSEnsembleModel_predictWithMapsPredictionContext_maxSuggestions___block_invoke_862(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = (objc_class *)NSString;
  id v6 = a2;
  id v7 = (void *)[[v5 alloc] initWithFormat:@"%@: %tu -> %tu", v6, objc_msgSend(*(id *)(a1 + 32), "indexOfObjectIdenticalTo:", v6), a3];

  return v7;
}

void __78___PSEnsembleModel_suggestZKWSuggestionsWithPredictionContext_maxSuggestions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 zkwFTOrchestrator];
  [v5 updateConfigWithTrialData:v4];

  id v6 = (void *)[v4 copy];
  [*(id *)(a1 + 32) setZkwFTTrialData:v6];

  id v7 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_1A314B000, v7, OS_LOG_TYPE_DEFAULT, "_PSFTZKWOrchestrator updated to reflect Trial configuration update.", v8, 2u);
  }
}

uint64_t __120___PSEnsembleModel_rankedGlobalSuggestionsWithPredictionContext_contactsOnly_maxSuggestions_excludeBackfillSuggestions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 contactMonitor];
  uint64_t v5 = [v4 contactIdIsInContactStore:v3];

  return v5;
}

void __120___PSEnsembleModel_rankedGlobalSuggestionsWithPredictionContext_contactsOnly_maxSuggestions_excludeBackfillSuggestions___block_invoke_891(uint64_t a1, void *a2, unsigned char *a3)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = [*(id *)(a1 + 32) contactMonitor];
  id v7 = [v6 contactIdsSeen];
  char v8 = [v7 containsObject:v5];

  if ((v8 & 1) == 0)
  {
    uint64_t v9 = [[_PSRecipient alloc] initWithIdentifier:v5 handle:0 contact:0];
    id v10 = [_PSSuggestion alloc];
    v16[0] = v9;
    int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
    uint64_t v12 = [*(id *)(a1 + 32) knnNameOrContactRankerModel];
    v13 = (objc_class *)objc_opt_class();
    id v14 = NSStringFromClass(v13);
    id v15 = [(_PSSuggestion *)v10 initWithBundleID:0 conversationIdentifier:v5 groupName:0 recipients:v11 reason:@"kNN model" reasonType:v14];

    if (v15) {
      [*(id *)(a1 + 40) addObject:v15];
    }
  }
  if ((unint64_t)[*(id *)(a1 + 40) count] >= *(void *)(a1 + 48)) {
    *a3 = 1;
  }
}

uint64_t __103___PSEnsembleModel_rankedGlobalSuggestionsForSiriNLWithPredictionContext_maxSuggestions_interactionId___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __103___PSEnsembleModel_rankedGlobalSuggestionsForSiriNLWithPredictionContext_maxSuggestions_interactionId___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  if (v3)
  {
    id v4 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __103___PSEnsembleModel_rankedGlobalSuggestionsForSiriNLWithPredictionContext_maxSuggestions_interactionId___block_invoke_2_cold_1();
    }
  }
}

id __55___PSEnsembleModel_appExtensionSuggestionsFromContext___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = [*(id *)(a1 + 32) appBundleIdsToShareExtensionBundleIdsMapping];
  uint64_t v3 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        char v8 = NSString;
        uint64_t v9 = [*(id *)(a1 + 32) appBundleIdsToShareExtensionBundleIdsMapping];
        id v10 = [v9 objectForKeyedSubscript:v7];
        int v11 = [v10 componentsJoinedByString:@","];
        uint64_t v12 = [v8 stringWithFormat:@"%@:%@", v7, v11];
        [v2 addObject:v12];
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v4);
  }

  v13 = [v2 componentsJoinedByString:@";"];

  return v13;
}

void __55___PSEnsembleModel_appExtensionSuggestionsFromContext___block_invoke_909(uint64_t a1, void *a2, unsigned __int8 a3)
{
  id v5 = a2;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2050000000;
  id v6 = (void *)getPSAppSuggestionsMetricsItemClass_softClass;
  uint64_t v15 = getPSAppSuggestionsMetricsItemClass_softClass;
  if (!getPSAppSuggestionsMetricsItemClass_softClass)
  {
    ReportingPluginLibraryCore();
    v13[3] = (uint64_t)objc_getClass("PSAppSuggestionsMetricsItem");
    getPSAppSuggestionsMetricsItemClass_softClass = v13[3];
    id v6 = (void *)v13[3];
  }
  uint64_t v7 = v6;
  _Block_object_dispose(&v12, 8);
  id v8 = [v7 alloc];
  uint64_t v9 = [v5 bundleID];
  id v10 = (void *)[v8 initWithTransportBundleId:v9 model:@"appSuggestions" rank:a3];

  if (v10)
  {
    [*(id *)(a1 + 32) addObject:v10];
  }
  else
  {
    int v11 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      __55___PSEnsembleModel_appExtensionSuggestionsFromContext___block_invoke_909_cold_1();
    }
  }
}

id __50___PSEnsembleModel_candidatesForShareSheetRanking__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 allObjects];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50___PSEnsembleModel_candidatesForShareSheetRanking__block_invoke_2;
  v7[3] = &unk_1E5ADF210;
  id v8 = v2;
  id v4 = v2;
  id v5 = [v3 sortedArrayUsingComparator:v7];

  return v5;
}

uint64_t __50___PSEnsembleModel_candidatesForShareSheetRanking__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  unint64_t v7 = [v5 countForObject:a2];
  unint64_t v8 = [*(id *)(a1 + 32) countForObject:v6];

  if (v7 <= v8) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = -1;
  }
  if (v7 < v8) {
    return 1;
  }
  else {
    return v9;
  }
}

void __50___PSEnsembleModel_candidatesForShareSheetRanking__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  unint64_t v7 = [v6 count];
  unint64_t v8 = [v5 integerValue];

  if (v7 >= v8) {
    unint64_t v9 = v8;
  }
  else {
    unint64_t v9 = v7;
  }
  objc_msgSend(v6, "subarrayWithRange:", 0, v9);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) addObjectsFromArray:v11];
  id v10 = objc_msgSend(v6, "subarrayWithRange:", v9, objc_msgSend(v6, "count") - v9);

  [*(id *)(a1 + 40) addObjectsFromArray:v10];
}

id __70___PSEnsembleModel_validateCoreMLModelWithRawInput_predictionContext___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __46___PSEnsembleModel_pruneCandidatesForRanking___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) valueForFeature:@"timeSinceLastOutgoingInteraction" forConversationId:v3];

  if (v4) {
    id v5 = 0;
  }
  else {
    id v5 = v3;
  }

  return v5;
}

void __81___PSEnsembleModel_logPipeline_withPipelineStage_andSessionID_andCandidateNames___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v10];
  [v5 setString:v10 forFeature:@"conversationId"];
  if (v6)
  {
    [v5 setNumber:&unk_1EF674E68 forFeature:@"candidateNameHasBeenResolved"];
    unint64_t v7 = *(void **)(a1 + 40);
    id v8 = v5;
    id v9 = v6;
  }
  else
  {
    [v5 setNumber:&unk_1EF674E08 forFeature:@"candidateNameHasBeenResolved"];
    unint64_t v7 = *(void **)(a1 + 40);
    id v8 = v5;
    id v9 = v10;
  }
  [v7 setObject:v8 forKeyedSubscript:v9];
}

void __50___PSEnsembleModel_evaluateCandidates_psrMLModel___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v43 = (char *)malloc_type_calloc(*(void *)(a1 + 104), *(void *)(a1 + 112), 0x5648F57uLL);
  if (!v43)
  {
    id v38 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A0] reason:@"malloc failed" userInfo:0];
    objc_exception_throw(v38);
  }
  long long v54 = 0u;
  long long v55 = 0u;
  long long v53 = 0u;
  long long v52 = 0u;
  id obj = v3;
  uint64_t v41 = [obj countByEnumeratingWithState:&v52 objects:v60 count:16];
  if (v41)
  {
    uint64_t v40 = *(void *)v53;
    uint64_t v4 = *MEMORY[0x1E4F1C3C8];
    id v5 = v43;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v53 != v40) {
          objc_enumerationMutation(obj);
        }
        uint64_t v42 = v6;
        uint64_t v7 = *(void *)(*((void *)&v52 + 1) + 8 * v6);
        long long v48 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        id v8 = *(id *)(a1 + 32);
        uint64_t v9 = [v8 countByEnumeratingWithState:&v48 objects:v59 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v49;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v49 != v11) {
                objc_enumerationMutation(v8);
              }
              CFNumberRef v13 = [*(id *)(a1 + 40) valueOrDefaultValueForFeature:*(void *)(*((void *)&v48 + 1) + 8 * i) forConversationId:v7];
              if (v13 && ([&unk_1EF674E08 isEqualToNumber:v13] & 1) == 0)
              {
                CFNumberType v14 = *(void *)(a1 + 120);
                if (v14)
                {
                  CFNumberGetValue(v13, v14, v5);
                }
                else if (*(void *)(a1 + 112) == 2)
                {
                  if (*(unsigned char *)(a1 + 128))
                  {
                    [(__CFNumber *)v13 floatValue];
                    __asm { FCVT            H0, S0 }
                    __int16 __src = _S0;
                  }
                  else
                  {
                    __int16 __src = [(__CFNumber *)v13 intValue];
                  }
                  memcpy(v5, &__src, *(void *)(a1 + 112));
                }
                else
                {
                  free(v43);
                  objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", v4, @"unsupported scalar size %tu (isFloatingPoint=%d)", *(void *)(a1 + 112), *(unsigned __int8 *)(a1 + 128));
                }
              }
              v5 += *(void *)(a1 + 112);
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v48 objects:v59 count:16];
          }
          while (v10);
        }

        uint64_t v6 = v42 + 1;
      }
      while (v42 + 1 != v41);
      uint64_t v41 = [obj countByEnumeratingWithState:&v52 objects:v60 count:16];
    }
    while (v41);
  }

  v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1E9A8]), "initWithBytesNoCopy:shape:dataType:strides:mutableShapedBufferProvider:", v43, *(void *)(a1 + 48), objc_msgSend(*(id *)(a1 + 56), "dataType"), *(void *)(a1 + 64), &__block_literal_global_979);
  uint64_t v21 = [*(id *)(a1 + 72) objectForKeyedSubscript:*(void *)(a1 + 80)];
  os_signpost_id_t v22 = [v21 multiArrayConstraint];

  v23 = (void *)MEMORY[0x1E4F1E950];
  if (v22)
  {
    id v24 = objc_alloc(MEMORY[0x1E4F1E9A8]);
    os_signpost_id_t v25 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(obj, "count"));
    v58 = v25;
    v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v58 count:1];
    v27 = objc_msgSend(v24, "initWithArray:dataType:", v26, objc_msgSend(v22, "dataType"));
    v28 = [v23 featureValueWithMultiArray:v27];
  }
  else
  {
    v28 = objc_msgSend(MEMORY[0x1E4F1E950], "featureValueWithInt64:", objc_msgSend(obj, "count"));
  }

  id v29 = objc_alloc(MEMORY[0x1E4F1E930]);
  v56[0] = *(void *)(a1 + 88);
  v30 = [MEMORY[0x1E4F1E950] featureValueWithMultiArray:v20];
  v56[1] = *(void *)(a1 + 80);
  v57[0] = v30;
  v57[1] = v28;
  v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:v56 count:2];
  uint64_t v32 = (void *)[v29 initWithFeatureValueDictionary:v31];

  v33 = [*(id *)(a1 + 96) predictionFromFeatures:v32 error:0];
  v34 = [v33 dictionary];
  v35 = [v34 objectForKeyedSubscript:@"coreMLModelScore"];
  v36 = [v35 multiArrayValue];

  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __50___PSEnsembleModel_evaluateCandidates_psrMLModel___block_invoke_3;
  v44[3] = &unk_1E5ADEE20;
  id v45 = v36;
  id v46 = *(id *)(a1 + 40);
  id v37 = v36;
  [obj enumerateObjectsUsingBlock:v44];
  free(v43);
}

uint64_t __50___PSEnsembleModel_evaluateCandidates_psrMLModel___block_invoke_2()
{
  return [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"mutation not supported"];
}

void __50___PSEnsembleModel_evaluateCandidates_psrMLModel___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
  uint64_t v7 = +[_PSLogging rewriteChannel];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __50___PSEnsembleModel_evaluateCandidates_psrMLModel___block_invoke_3_cold_1();
  }

  [*(id *)(a1 + 40) setValue:v6 forFeature:@"coreMLModelScore" andConversationId:v5];
}

void __50___PSEnsembleModel_evaluateCandidates_psrMLModel___block_invoke_986(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc(MEMORY[0x1E4F1E930]);
  id v5 = [*(id *)(a1 + 32) nonNilFeaturesForConversationId:v3];
  uint64_t v6 = (void *)[v4 initWithDictionary:v5 error:0];

  uint64_t v7 = [*(id *)(a1 + 40) predictionFromFeatures:v6 error:0];
  id v8 = NSNumber;
  uint64_t v9 = [v7 featureValueForName:@"coreMLModelScore"];
  [v9 doubleValue];
  uint64_t v10 = objc_msgSend(v8, "numberWithDouble:");

  [*(id *)(a1 + 32) setValue:v10 forFeature:@"coreMLModelScore" andConversationId:v3];
  uint64_t v11 = +[_PSLogging rewriteChannel];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    __50___PSEnsembleModel_evaluateCandidates_psrMLModel___block_invoke_986_cold_1();
  }
}

uint64_t __105___PSEnsembleModel_getSuggestionsFromInteractionsStatistics_withConfig_trialClient_andPredictionContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) featureNamesToSortWith];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        CFNumberRef v13 = objc_msgSend(*(id *)(a1 + 40), "valueOrDefaultValueForFeature:forConversationId:", v12, v5, (void)v24);
        [v13 doubleValue];
        double v15 = v14;

        long long v16 = [*(id *)(a1 + 40) valueOrDefaultValueForFeature:v12 forConversationId:v6];
        [v16 doubleValue];
        double v18 = v17;

        if (v15 != v18)
        {
          int v20 = [v12 containsString:@"timeSince"];
          uint64_t v21 = -1;
          if (v15 > v18) {
            uint64_t v22 = 1;
          }
          else {
            uint64_t v22 = -1;
          }
          if (v15 < v18) {
            uint64_t v21 = 1;
          }
          if (v20) {
            uint64_t v19 = v22;
          }
          else {
            uint64_t v19 = v21;
          }
          goto LABEL_18;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  uint64_t v19 = 0;
LABEL_18:

  return v19;
}

void __105___PSEnsembleModel_getSuggestionsFromInteractionsStatistics_withConfig_trialClient_andPredictionContext___block_invoke_991(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) featureNamesToSortWith];
  id v5 = objc_opt_new();
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [*(id *)(a1 + 40) valueOrDefaultValueForFeature:*(void *)(*((void *)&v19 + 1) + 8 * v10) forConversationId:v3];
        [v5 addObject:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }

  uint64_t v12 = *(void **)(a1 + 48);
  CFNumberRef v13 = [_PSSuggestionProxy alloc];
  double v14 = [*(id *)(a1 + 40) bundleIdForConversationId:v3];
  id v15 = [NSString alloc];
  long long v16 = [*(id *)(a1 + 32) featureNamesToSortWith];
  double v17 = (void *)[v15 initWithFormat:@"Score: %@\n%@", v5, v16, (void)v19];
  double v18 = [(_PSSuggestionProxy *)v13 initWithBundleID:v14 interactionRecipients:v3 contactID:0 reason:v17 reasonType:@"suggestionsProxiesFromStats"];
  [v12 addObject:v18];
}

id __105___PSEnsembleModel_getSuggestionsFromInteractionsStatistics_withConfig_trialClient_andPredictionContext___block_invoke_998(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 interactionRecipients];
  id v4 = [v2 privatizedConversationId:v3];

  return v4;
}

id __94___PSEnsembleModel_finalSuggestionProxiesForInteractionStatistics_config_trialClient_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        [v4 addObject:v9];
        uint64_t v10 = [v9 interactionRecipients];
        int v11 = [*(id *)(a1 + 32) isSharePlayAvailable];
        uint64_t v12 = [*(id *)(a1 + 40) valueOrDefaultValueForFeature:@"hasEverSharePlayedWithConversation" forConversationId:v10];
        int v13 = [v12 BOOLValue];

        if (v11 && v13)
        {
          double v14 = [_PSSuggestionProxy alloc];
          id v15 = [*(id *)(a1 + 40) valueForProperty:@"RecipientListConversationId" forConversationId:v10];
          long long v16 = (objc_class *)objc_opt_class();
          double v17 = NSStringFromClass(v16);
          double v18 = [(_PSSuggestionProxy *)v14 initWithBundleID:@"com.apple.telephonyutilities.callservicesd" interactionRecipients:v15 handles:0 reason:@"SharePlay heuristic" reasonType:v17];
          [v4 addObject:v18];
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v6);
  }

  return v4;
}

void __61___PSEnsembleModel_sendDataToPETAsync_withConfig_andContext___block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) getPETMessageFrom:*(void *)(a1 + 40) withConfig:*(void *)(a1 + 48) andContext:*(void *)(a1 + 56)];
  id v2 = [MEMORY[0x1E4F93728] sharedInstance];
  [v2 logMessage:v1];
  id v3 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1A314B000, v3, OS_LOG_TYPE_DEFAULT, "_PSEnsemble: sent data to PET", v4, 2u);
  }
}

id __70___PSEnsembleModel_enrichConfig_withInformationFromPredictionContext___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 contentURL];
  id v3 = [v2 host];

  return v3;
}

void __111___PSEnsembleModel_psrDataCollectionForContext_timeToWaitInSeconds_maxComputationTime_withConfigAndStatsBlock___block_invoke()
{
  uint64_t v0 = (void *)MEMORY[0x1A6243860]();
  uint64_t v1 = [MEMORY[0x1E4F93B18] autoreleasingSerialQueueWithLabel:"asyncPSRDataCollectionForContext" qosClass:9];
  id v2 = (void *)psrDataCollectionForContext_timeToWaitInSeconds_maxComputationTime_withConfigAndStatsBlock___pasExprOnceResult;
  psrDataCollectionForContext_timeToWaitInSeconds_maxComputationTime_withConfigAndStatsBlock___pasExprOnceResult = v1;
}

void __111___PSEnsembleModel_psrDataCollectionForContext_timeToWaitInSeconds_maxComputationTime_withConfigAndStatsBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v2 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  id v3 = [v2 first];
  id v4 = [v2 second];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __111___PSEnsembleModel_psrDataCollectionForContext_timeToWaitInSeconds_maxComputationTime_withConfigAndStatsBlock___block_invoke_3;
  v13[3] = &unk_1E5ADF458;
  id v14 = *(id *)(a1 + 32);
  id v5 = v4;
  id v15 = v5;
  id v6 = v3;
  uint64_t v18 = *(void *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 40);
  id v16 = v6;
  uint64_t v17 = v7;
  uint64_t v8 = MEMORY[0x1A6243AD0](v13);
  uint64_t v9 = (void *)v8;
  if (*(int *)(a1 + 64) < 1)
  {
    (*(void (**)(uint64_t))(v8 + 16))(v8);
  }
  else
  {
    uint64_t v10 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = *(_DWORD *)(a1 + 64);
      *(_DWORD *)buf = 67109120;
      int v20 = v11;
      _os_log_impl(&dword_1A314B000, v10, OS_LOG_TYPE_DEFAULT, "_PSEnsemble: async Wait until the feedback call populates chosenSuggestion: %d seconds", buf, 8u);
    }

    dispatch_time_t v12 = dispatch_time(0, 1000000000 * *(int *)(a1 + 64));
    dispatch_after(v12, MEMORY[0x1E4F14428], v9);
  }
}

void __111___PSEnsembleModel_psrDataCollectionForContext_timeToWaitInSeconds_maxComputationTime_withConfigAndStatsBlock___block_invoke_3(uint64_t a1)
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  uint64_t v58 = 0;
  v59 = &v58;
  uint64_t v60 = 0x3032000000;
  uint64_t v61 = __Block_byref_object_copy__1;
  v62 = __Block_byref_object_dispose__1;
  id v63 = 0;
  id v2 = +[_PSEnsembleModel feedbackDictionary];
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  void v57[2] = __111___PSEnsembleModel_psrDataCollectionForContext_timeToWaitInSeconds_maxComputationTime_withConfigAndStatsBlock___block_invoke_4;
  v57[3] = &unk_1E5ADF408;
  v57[4] = &v58;
  [v2 runWithLockAcquired:v57];

  id v3 = (void *)v59[5];
  id v4 = [*(id *)(a1 + 32) sessionID];
  id v5 = [v3 objectForKeyedSubscript:v4];
  LOBYTE(v3) = v5 == 0;

  if ((v3 & 1) == 0)
  {
    id v6 = (void *)v59[5];
    uint64_t v7 = [*(id *)(a1 + 32) sessionID];
    uint64_t v8 = [v6 objectForKeyedSubscript:v7];
    objc_msgSend(*(id *)(a1 + 32), "setFeedBack:", objc_msgSend(v8, "feedbackActionType"));

    uint64_t v9 = (void *)v59[5];
    uint64_t v10 = [*(id *)(a1 + 32) sessionID];
    int v11 = [v9 objectForKeyedSubscript:v10];
    dispatch_time_t v12 = [v11 conversationId];

    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    int v13 = [*(id *)(a1 + 40) features];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v53 objects:v72 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v54;
      id v16 = &unk_1EF674E98;
      uint64_t v17 = &unk_1EF674E80;
      do
      {
        uint64_t v18 = 0;
        uint64_t v47 = v14;
        do
        {
          if (*(void *)v54 != v15) {
            objc_enumerationMutation(v13);
          }
          uint64_t v19 = *(void *)(*((void *)&v53 + 1) + 8 * v18);
          int v20 = [v12 isEqualToString:v19];
          uint64_t v21 = v16;
          if (v20)
          {
            long long v22 = +[_PSLogging rewriteChannel];
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              uint64_t v23 = v15;
              long long v24 = v17;
              long long v25 = v16;
              uint64_t v26 = v13;
              uint64_t v27 = a1;
              v28 = v12;
              uint64_t v29 = v27;
              v30 = [*(id *)(v27 + 32) sessionID];
              *(_DWORD *)buf = 138412802;
              v67 = v30;
              __int16 v68 = 2112;
              uint64_t v69 = v19;
              __int16 v70 = 2048;
              uint64_t v71 = 1;
              _os_log_impl(&dword_1A314B000, v22, OS_LOG_TYPE_INFO, "Feedback resolved for session %@ resolved to %@ as %ld", buf, 0x20u);

              dispatch_time_t v12 = v28;
              a1 = v29;
              int v13 = v26;
              id v16 = v25;
              uint64_t v17 = v24;
              uint64_t v15 = v23;
              uint64_t v14 = v47;
            }

            uint64_t v21 = v17;
          }
          [*(id *)(a1 + 40) setValue:v21 forFeature:@"feedback" andConversationId:v19];
          ++v18;
        }
        while (v14 != v18);
        uint64_t v14 = [v13 countByEnumeratingWithState:&v53 objects:v72 count:16];
      }
      while (v14);
    }

    v31 = [*(id *)(a1 + 32) sessionID];
    BOOL v32 = v31 == 0;

    if (!v32)
    {
      v33 = [*(id *)(a1 + 32) sessionID];
      +[_PSEnsembleModel forgetSession:v33];
    }
    v34 = [MEMORY[0x1E4F1C9C8] now];
    id v35 = objc_alloc(MEMORY[0x1E4F5B408]);
    v36 = [*(id *)(a1 + 48) rightBoundDate];
    double v37 = *(double *)(a1 + 64);
    v65 = @"timeSinceLastOutgoingInteraction";
    id v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v65 count:1];
    LOBYTE(v46) = 0;
    v39 = (void *)[v35 initWithAnchorDate:v34 leftBoundDate:v36 rightBoundDate:v34 fetchLimit:100 maxComputationTime:v38 featureNamesToSortWith:1 shouldSortAscending:v37 shouldUseSuggestionEngaged:v46 statsDefaultValues:MEMORY[0x1E4F1CC08]];

    v64 = @"timeSinceLastOutgoingInteraction";
    uint64_t v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v64 count:1];
    [v39 setStatsToCompute:v40];

    uint64_t v41 = [*(id *)(a1 + 56) interactionStore];
    uint64_t v42 = [v41 getInteractionsStatisticsForConfig:v39];

    v43 = [v42 conversationIds];
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __111___PSEnsembleModel_psrDataCollectionForContext_timeToWaitInSeconds_maxComputationTime_withConfigAndStatsBlock___block_invoke_1021;
    v48[3] = &unk_1E5ADF430;
    id v44 = v42;
    id v49 = v44;
    id v50 = *(id *)(a1 + 40);
    long long v52 = &v58;
    id v51 = *(id *)(a1 + 32);
    [v43 enumerateObjectsUsingBlock:v48];

    [*(id *)(a1 + 56) sendDataToPETAsync:*(void *)(a1 + 40) withConfig:*(void *)(a1 + 48) andContext:*(void *)(a1 + 32)];
    id v45 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A314B000, v45, OS_LOG_TYPE_DEFAULT, "_PSEnsemble: logged data from PSR", buf, 2u);
    }
  }
  _Block_object_dispose(&v58, 8);
}

uint64_t __111___PSEnsembleModel_psrDataCollectionForContext_timeToWaitInSeconds_maxComputationTime_withConfigAndStatsBlock___block_invoke_4(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [a2 copy];

  return MEMORY[0x1F41817F8]();
}

void __111___PSEnsembleModel_psrDataCollectionForContext_timeToWaitInSeconds_maxComputationTime_withConfigAndStatsBlock___block_invoke_1021(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) valueForFeature:@"timeSinceLastOutgoingInteraction" forConversationId:v3];

  id v5 = [*(id *)(a1 + 40) conversationIds];
  int v6 = [v5 containsObject:v3];

  if (v4) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    uint64_t v8 = [*(id *)(a1 + 40) valueForFeature:@"feedback" forConversationId:v3];
    int v9 = [v8 intValue];

    if (!v9)
    {
      uint64_t v10 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      int v11 = [*(id *)(a1 + 48) sessionID];
      dispatch_time_t v12 = [v10 objectForKeyedSubscript:v11];
      uint64_t v13 = [v12 feedbackActionType];

      if (v13 == 4) {
        uint64_t v14 = &unk_1EF674EB0;
      }
      else {
        uint64_t v14 = &unk_1EF674EC8;
      }
      uint64_t v15 = +[_PSLogging rewriteChannel];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        id v16 = [*(id *)(a1 + 48) sessionID];
        int v17 = 138412802;
        uint64_t v18 = v16;
        __int16 v19 = 2112;
        id v20 = v3;
        __int16 v21 = 2112;
        long long v22 = v14;
        _os_log_impl(&dword_1A314B000, v15, OS_LOG_TYPE_INFO, "Feedback reesolved for session %@ resolved to %@ as %@", (uint8_t *)&v17, 0x20u);
      }
      [*(id *)(a1 + 40) setValue:v14 forFeature:@"feedback" andConversationId:v3];
    }
  }
}

void __83___PSEnsembleModel_predictWithPredictionContext_maxSuggestions_contactKeysToFetch___block_invoke_717_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = *(_DWORD *)(*(void *)a1 + 24);
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_fault_impl(&dword_1A314B000, a2, OS_LOG_TYPE_FAULT, "Found %d candidates with an empty feature dictionary", (uint8_t *)v3, 8u);
}

void __83___PSEnsembleModel_predictWithPredictionContext_maxSuggestions_contactKeysToFetch___block_invoke_2_745_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_0(&dword_1A314B000, v0, v1, "Ensemble suggestion metrics item is nil", v2, v3, v4, v5, v6);
}

void __83___PSEnsembleModel_predictWithPredictionContext_maxSuggestions_contactKeysToFetch___block_invoke_2_745_cold_2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_0(&dword_1A314B000, v0, v1, "Individual model suggestions metrics item is nil", v2, v3, v4, v5, v6);
}

void __82___PSEnsembleModel_addExtraInformationWithSuggestions_modelSuggestionProxiesDict___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_0(&dword_1A314B000, v0, v1, "Suggestion without conversationID or derivedIntentID", v2, v3, v4, v5, v6);
}

void __126___PSEnsembleModel_suggestionsFromSuggestionProxies_supportedBundleIDs_contactKeysToFetch_meContactIdentifier_maxSuggestions___block_invoke_810_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7(&dword_1A314B000, v0, v1, "Error fetching interaction to create Messages suggestion template (predicate: %{public}@): %@");
}

void __103___PSEnsembleModel_rankedGlobalSuggestionsForSiriNLWithPredictionContext_maxSuggestions_interactionId___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_1A314B000, v0, v1, "Error saving feedback event to knowledge store: %@", v2, v3, v4, v5, v6);
}

void __55___PSEnsembleModel_appExtensionSuggestionsFromContext___block_invoke_909_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_0(&dword_1A314B000, v0, v1, "metricsSuggestion item is nil", v2, v3, v4, v5, v6);
}

void __50___PSEnsembleModel_evaluateCandidates_psrMLModel___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_11(&dword_1A314B000, v0, v1, "_PSEnsemble: CoreML set-based model score for candidate %@ = %@");
}

void __50___PSEnsembleModel_evaluateCandidates_psrMLModel___block_invoke_986_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_11(&dword_1A314B000, v0, v1, "_PSEnsemble: CoreML model score for candidate %@ = %@");
}

@end