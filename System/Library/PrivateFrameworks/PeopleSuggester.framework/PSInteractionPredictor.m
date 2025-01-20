@interface PSInteractionPredictor
@end

@implementation PSInteractionPredictor

BOOL __62___PSInteractionPredictor_getConversationIDLogFromTrainArray___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a3;
  v7 = [v5 objectForKey:a2];
  v8 = [*(id *)(a1 + 32) objectForKey:v6];

  v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
  v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
  BOOL v11 = [v9 compare:v10] == 0;

  return v11;
}

uint64_t __79___PSInteractionPredictor_getClusteringResultsForPoint_usingClusterDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 distanceToCluster];
  double v6 = v5;
  [v4 distanceToCluster];
  double v8 = v7;

  if (v6 - v8 >= -2.22044605e-16) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = -1;
  }
  if (v6 - v8 > 2.22044605e-16) {
    return 1;
  }
  else {
    return v9;
  }
}

void __74___PSInteractionPredictor_trainAtDate_usingCompiledModelURL_andSaveToURL___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1A314B000, v4, OS_LOG_TYPE_INFO, "pre-update: ", v10, 2u);
  }

  double v5 = *(void **)(a1 + 32);
  double v6 = [v3 model];
  [v5 printModelWeights:v6];

  double v7 = [v3 task];
  double v8 = [v7 error];

  if (v8)
  {
    uint64_t v9 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __74___PSInteractionPredictor_trainAtDate_usingCompiledModelURL_andSaveToURL___block_invoke_cold_1(v3);
    }
  }
}

void __74___PSInteractionPredictor_trainAtDate_usingCompiledModelURL_andSaveToURL___block_invoke_139(void *a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = a1[4];
    *(_DWORD *)buf = 138412290;
    uint64_t v21 = v5;
    _os_log_impl(&dword_1A314B000, v4, OS_LOG_TYPE_INFO, "Saving the adapted model at %@", buf, 0xCu);
  }

  double v6 = (void *)a1[5];
  double v7 = [v3 model];
  [v6 printModelWeights:v7];

  if (a1[4])
  {
    double v8 = [v3 model];
    uint64_t v9 = a1[4];
    uint64_t v10 = *(void *)(a1[6] + 8);
    id obj = *(id *)(v10 + 40);
    char v11 = [v8 writeToURL:v9 error:&obj];
    objc_storeStrong((id *)(v10 + 40), obj);

    if (*(void *)(*(void *)(a1[6] + 8) + 40) || (v11 & 1) == 0)
    {
      v12 = +[_PSLogging generalChannel];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        __74___PSInteractionPredictor_trainAtDate_usingCompiledModelURL_andSaveToURL___block_invoke_139_cold_1((uint64_t)(a1 + 6), v12, v13, v14, v15, v16, v17, v18);
      }
    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1[7] + 8) + 40));
  }
}

void __79___PSInteractionPredictor_rankedZkwSuggestionsFromPredictionArray_forBundleID___block_invoke()
{
  v0 = (void *)MEMORY[0x1A6243860]();
  v1 = (void *)MEMORY[0x1A6243860]();
  id v2 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  id v3 = +[_PSConstants mobileMessagesBundleId];
  id v4 = +[_PSConstants macMessagesBundleId];
  uint64_t v5 = objc_msgSend(v2, "initWithObjects:", v3, v4, 0);

  double v6 = (void *)rankedZkwSuggestionsFromPredictionArray_forBundleID___pasExprOnceResult;
  rankedZkwSuggestionsFromPredictionArray_forBundleID___pasExprOnceResult = v5;
}

void __74___PSInteractionPredictor_trainAtDate_usingCompiledModelURL_andSaveToURL___block_invoke_cold_1(void *a1)
{
  v1 = [a1 task];
  id v2 = [v1 error];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_9(&dword_1A314B000, v3, v4, "context.task.error: %@", v5, v6, v7, v8, v9);
}

void __74___PSInteractionPredictor_trainAtDate_usingCompiledModelURL_andSaveToURL___block_invoke_139_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end