@interface ATXShadowMetricsComputer
- (ATXShadowMetricsComputer)initWithDataSource:(id)a3;
- (ATXShadowMetricsDataSource)dataSource;
- (id)computeResultAsTrendPlotFromStartDate:(id)a3 toEndDate:(id)a4 resultGranularity:(int64_t)a5;
- (id)computeResultFromStartDate:(id)a3 toEndDate:(id)a4;
@end

@implementation ATXShadowMetricsComputer

- (ATXShadowMetricsComputer)initWithDataSource:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXShadowMetricsComputer;
  v6 = [(ATXShadowMetricsComputer *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_dataSource, a3);
  }

  return v7;
}

- (id)computeResultAsTrendPlotFromStartDate:(id)a3 toEndDate:(id)a4 resultGranularity:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [[ATXTrendPlot alloc] initWithStartDate:v8 endDate:v9 granularity:a5 binInitialDataProvider:&__block_literal_global_18];
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__9;
  v26[4] = __Block_byref_object_dispose__9;
  id v27 = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__9;
  v24[4] = __Block_byref_object_dispose__9;
  id v25 = (id)objc_opt_new();
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__9;
  v22[4] = __Block_byref_object_dispose__9;
  v11 = [(ATXTrendPlot *)v10 bins];
  id v23 = [v11 firstObject];

  dataSource = self->_dataSource;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __94__ATXShadowMetricsComputer_computeResultAsTrendPlotFromStartDate_toEndDate_resultGranularity___block_invoke_7;
  v17[3] = &unk_1E5F019B0;
  v17[4] = self;
  v19 = v22;
  v20 = v26;
  v21 = v24;
  v13 = v10;
  v18 = v13;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __94__ATXShadowMetricsComputer_computeResultAsTrendPlotFromStartDate_toEndDate_resultGranularity___block_invoke_9;
  v16[3] = &unk_1E5F01A28;
  v16[4] = self;
  v16[5] = v22;
  v16[6] = v26;
  v16[7] = v24;
  [(ATXShadowMetricsDataSource *)dataSource replayHistoryBetweenStartDate:v8 endDate:v9 shadowEventHandler:v17 predictionCacheHandler:v16];
  v14 = v13;

  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v24, 8);

  _Block_object_dispose(v26, 8);
  return v14;
}

id __94__ATXShadowMetricsComputer_computeResultAsTrendPlotFromStartDate_toEndDate_resultGranularity___block_invoke()
{
  v0 = objc_opt_new();
  return v0;
}

void __94__ATXShadowMetricsComputer_computeResultAsTrendPlotFromStartDate_toEndDate_resultGranularity___block_invoke_7(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(*(void *)(a1[6] + 8) + 40) next];
  if (v4)
  {
    id v5 = (void *)v4;
    do
    {
      v6 = [*(id *)(*(void *)(a1[6] + 8) + 40) next];
      v7 = [v6 startDate];
      id v8 = [v3 absoluteTimestamp];
      id v9 = [v7 earlierDate:v8];
      v10 = [*(id *)(*(void *)(a1[6] + 8) + 40) next];
      v11 = [v10 startDate];

      if (v9 != v11) {
        break;
      }
      uint64_t v12 = [*(id *)(*(void *)(a1[6] + 8) + 40) next];
      uint64_t v13 = *(void *)(a1[6] + 8);
      v14 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = v12;

      uint64_t v15 = [*(id *)(a1[4] + 8) numberOfPredictionsInCache:*(void *)(*(void *)(a1[7] + 8) + 40)];
      v16 = [*(id *)(*(void *)(a1[6] + 8) + 40) data];
      [v16 setNumberOfCachedPredictions:v15];

      uint64_t v17 = [*(id *)(*(void *)(a1[7] + 8) + 40) numberOfPredictionsWithConfidence:4];
      v18 = [*(id *)(*(void *)(a1[6] + 8) + 40) data];
      [v18 setNumberOfCachedHighConfidencePredictions:v17];

      uint64_t v19 = [*(id *)(*(void *)(a1[7] + 8) + 40) numberOfPredictionsWithConfidence:3];
      v20 = [*(id *)(*(void *)(a1[6] + 8) + 40) data];
      [v20 setNumberOfCachedMediumConfidencePredictions:v19];

      uint64_t v21 = [*(id *)(*(void *)(a1[7] + 8) + 40) numberOfPredictionsWithConfidence:2];
      v22 = [*(id *)(*(void *)(a1[6] + 8) + 40) data];
      [v22 setNumberOfCachedLowConfidencePredictions:v21];

      [*(id *)(*(void *)(a1[8] + 8) + 40) removeAllObjects];
      id v5 = [*(id *)(*(void *)(a1[6] + 8) + 40) next];
    }
    while (v5);
  }
  id v23 = (void *)a1[5];
  v24 = [v3 absoluteTimestamp];
  id v25 = [v23 binAtDate:v24];

  if (v25)
  {
    v26 = [v25 data];
    objc_msgSend(v26, "setNumberOfShadowEvents:", objc_msgSend(v26, "numberOfShadowEvents") + 1);

    if (*(void *)(*(void *)(a1[7] + 8) + 40))
    {
      uint64_t v27 = objc_msgSend(*(id *)(a1[4] + 8), "cacheHitIndexForShadowEvent:predictionCache:", v3);
      if (v27 != 0x7FFFFFFFFFFFFFFFLL)
      {
        unint64_t v28 = v27;
        v29 = [v25 data];
        objc_msgSend(v29, "setNumberOfShadowEventCacheHits:", objc_msgSend(v29, "numberOfShadowEventCacheHits") + 1);

        if (v28)
        {
          if (v28 != 1)
          {
            if (v28 > 3)
            {
              int v30 = 0;
              int v34 = 0;
              int v36 = 0;
              int v37 = 0;
              int v38 = 0;
              if (v28 > 7)
              {
LABEL_16:
                v39 = [v25 data];
                [v39 sumOfShadowEventCacheHitReciprocalRanks];
                [v39 setSumOfShadowEventCacheHitReciprocalRanks:1.0 / (double)(v28 + 1) + v40];

                uint64_t v41 = [*(id *)(*(void *)(a1[7] + 8) + 40) confidenceCategoryForPredictionAtIndex:v28];
                uint64_t v42 = v41;
                switch(v41)
                {
                  case 2:
                    v43 = [v25 data];
                    objc_msgSend(v43, "setNumberOfShadowEventLowConfidenceCacheHits:", objc_msgSend(v43, "numberOfShadowEventLowConfidenceCacheHits") + 1);
                    break;
                  case 4:
                    v43 = [v25 data];
                    objc_msgSend(v43, "setNumberOfShadowEventHighConfidenceCacheHits:", objc_msgSend(v43, "numberOfShadowEventHighConfidenceCacheHits") + 1);
                    break;
                  case 3:
                    v43 = [v25 data];
                    objc_msgSend(v43, "setNumberOfShadowEventMediumConfidenceCacheHits:", objc_msgSend(v43, "numberOfShadowEventMediumConfidenceCacheHits") + 1);
                    break;
                  default:
                    goto LABEL_23;
                }

LABEL_23:
                v44 = [*(id *)(*(void *)(a1[7] + 8) + 40) identifierForPredictionAtIndex:v28];
                if (!v44)
                {
                  v47 = __atxlog_handle_metrics();
                  if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
                    __94__ATXShadowMetricsComputer_computeResultAsTrendPlotFromStartDate_toEndDate_resultGranularity___block_invoke_7_cold_1(v47);
                  }
LABEL_34:

                  goto LABEL_35;
                }
                if ([*(id *)(*(void *)(a1[8] + 8) + 40) containsObject:v44])
                {
LABEL_35:

                  goto LABEL_36;
                }
                [*(id *)(*(void *)(a1[8] + 8) + 40) addObject:v44];
                v45 = [v25 data];
                objc_msgSend(v45, "setNumberOfCorrectCachedPredictions:", objc_msgSend(v45, "numberOfCorrectCachedPredictions") + 1);

                if (v28)
                {
                  if (!v37) {
                    goto LABEL_27;
                  }
                }
                else
                {
                  v48 = [v25 data];
                  objc_msgSend(v48, "setNumberOfCorrectTop1CachedPrediction:", objc_msgSend(v48, "numberOfCorrectTop1CachedPrediction") + 1);

                  if (!v37)
                  {
LABEL_27:
                    if (!v38) {
                      goto LABEL_28;
                    }
                    goto LABEL_44;
                  }
                }
                v49 = [v25 data];
                objc_msgSend(v49, "setNumberOfCorrectTop2CachedPredictions:", objc_msgSend(v49, "numberOfCorrectTop2CachedPredictions") + 1);

                if (!v38)
                {
LABEL_28:
                  if (!v36) {
                    goto LABEL_30;
                  }
                  goto LABEL_29;
                }
LABEL_44:
                v50 = [v25 data];
                objc_msgSend(v50, "setNumberOfCorrectTop4CachedPredictions:", objc_msgSend(v50, "numberOfCorrectTop4CachedPredictions") + 1);

                if (!v36)
                {
LABEL_30:
                  switch(v42)
                  {
                    case 2:
                      v47 = [v25 data];
                      [v47 setNumberOfCorrectLowConfidenceCachedPredictions:[v47 numberOfCorrectLowConfidenceCachedPredictions]+ 1];
                      break;
                    case 4:
                      v47 = [v25 data];
                      [v47 setNumberOfCorrectHighConfidenceCachedPredictions:[v47 numberOfCorrectHighConfidenceCachedPredictions]+ 1];
                      break;
                    case 3:
                      v47 = [v25 data];
                      [v47 setNumberOfCorrectMediumConfidenceCachedPredictions:[v47 numberOfCorrectMediumConfidenceCachedPredictions]+ 1];
                      break;
                    default:
                      goto LABEL_35;
                  }
                  goto LABEL_34;
                }
LABEL_29:
                v46 = [v25 data];
                objc_msgSend(v46, "setNumberOfCorrectTop8CachedPredictions:", objc_msgSend(v46, "numberOfCorrectTop8CachedPredictions") + 1);

                goto LABEL_30;
              }
LABEL_15:
              v35 = [v25 data];
              objc_msgSend(v35, "setNumberOfShadowEventTop8CacheHits:", objc_msgSend(v35, "numberOfShadowEventTop8CacheHits") + 1);

              int v36 = 1;
              int v37 = v30;
              int v38 = v34;
              goto LABEL_16;
            }
            int v30 = 0;
LABEL_14:
            v33 = [v25 data];
            objc_msgSend(v33, "setNumberOfShadowEventTop4CacheHits:", objc_msgSend(v33, "numberOfShadowEventTop4CacheHits") + 1);

            int v34 = 1;
            goto LABEL_15;
          }
        }
        else
        {
          v31 = [v25 data];
          objc_msgSend(v31, "setNumberOfShadowEventTop1CacheHits:", objc_msgSend(v31, "numberOfShadowEventTop1CacheHits") + 1);
        }
        v32 = [v25 data];
        objc_msgSend(v32, "setNumberOfShadowEventTop2CacheHits:", objc_msgSend(v32, "numberOfShadowEventTop2CacheHits") + 1);

        int v30 = 1;
        goto LABEL_14;
      }
    }
  }
LABEL_36:
}

void __94__ATXShadowMetricsComputer_computeResultAsTrendPlotFromStartDate_toEndDate_resultGranularity___block_invoke_9(void *a1, void *a2)
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [*(id *)(*(void *)(a1[5] + 8) + 40) data];
  objc_msgSend(v4, "setNumberOfPredictionCacheRefreshes:", objc_msgSend(v4, "numberOfPredictionCacheRefreshes") + 1);

  uint64_t v5 = [*(id *)(*(void *)(a1[5] + 8) + 40) next];
  if (v5)
  {
    v6 = (void *)v5;
    do
    {
      v7 = [*(id *)(*(void *)(a1[5] + 8) + 40) next];
      id v8 = [v7 startDate];
      id v9 = [v3 date];
      v10 = [v8 earlierDate:v9];
      v11 = [*(id *)(*(void *)(a1[5] + 8) + 40) next];
      uint64_t v12 = [v11 startDate];

      if (v10 != v12) {
        break;
      }
      uint64_t v13 = [*(id *)(*(void *)(a1[5] + 8) + 40) next];
      uint64_t v14 = *(void *)(a1[5] + 8);
      uint64_t v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v13;

      uint64_t v16 = [*(id *)(a1[4] + 8) numberOfPredictionsInCache:*(void *)(*(void *)(a1[6] + 8) + 40)];
      uint64_t v17 = [*(id *)(*(void *)(a1[5] + 8) + 40) data];
      [v17 setNumberOfCachedPredictions:v16];

      uint64_t v18 = [*(id *)(*(void *)(a1[6] + 8) + 40) numberOfPredictionsWithConfidence:4];
      uint64_t v19 = [*(id *)(*(void *)(a1[5] + 8) + 40) data];
      [v19 setNumberOfCachedHighConfidencePredictions:v18];

      uint64_t v20 = [*(id *)(*(void *)(a1[6] + 8) + 40) numberOfPredictionsWithConfidence:3];
      uint64_t v21 = [*(id *)(*(void *)(a1[5] + 8) + 40) data];
      [v21 setNumberOfCachedMediumConfidencePredictions:v20];

      uint64_t v22 = [*(id *)(*(void *)(a1[6] + 8) + 40) numberOfPredictionsWithConfidence:2];
      id v23 = [*(id *)(*(void *)(a1[5] + 8) + 40) data];
      [v23 setNumberOfCachedLowConfidencePredictions:v22];

      [*(id *)(*(void *)(a1[7] + 8) + 40) removeAllObjects];
      v6 = [*(id *)(*(void *)(a1[5] + 8) + 40) next];
    }
    while (v6);
  }
  v24 = objc_opt_new();
  id v25 = v24;
  uint64_t v26 = a1[6];
  uint64_t v27 = *(void *)(*(void *)(v26 + 8) + 40);
  if (v27)
  {
    unint64_t v28 = *(void **)(a1[4] + 8);
    v64[0] = MEMORY[0x1E4F143A8];
    v64[1] = 3221225472;
    v64[2] = __94__ATXShadowMetricsComputer_computeResultAsTrendPlotFromStartDate_toEndDate_resultGranularity___block_invoke_2;
    v64[3] = &unk_1E5F019D8;
    uint64_t v66 = v26;
    id v65 = v24;
    [v28 enumeratePredictionsInCache:v27 usingBlock:v64];
  }
  v29 = objc_opt_new();
  int v30 = *(void **)(a1[4] + 8);
  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = __94__ATXShadowMetricsComputer_computeResultAsTrendPlotFromStartDate_toEndDate_resultGranularity___block_invoke_3;
  v58[3] = &unk_1E5F01A00;
  id v31 = v3;
  id v59 = v31;
  id v32 = v29;
  id v60 = v32;
  id v33 = v25;
  id v61 = v33;
  long long v34 = *((_OWORD *)a1 + 3);
  long long v62 = *((_OWORD *)a1 + 2);
  long long v63 = v34;
  [v30 enumeratePredictionsInCache:v31 usingBlock:v58];
  v35 = objc_opt_new();
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v36 = *(id *)(*(void *)(a1[7] + 8) + 40);
  uint64_t v37 = [v36 countByEnumeratingWithState:&v54 objects:v68 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v55;
    do
    {
      for (uint64_t i = 0; i != v38; ++i)
      {
        if (*(void *)v55 != v39) {
          objc_enumerationMutation(v36);
        }
        uint64_t v41 = *(void *)(*((void *)&v54 + 1) + 8 * i);
        if (([v32 containsObject:v41] & 1) == 0) {
          [v35 addObject:v41];
        }
      }
      uint64_t v38 = [v36 countByEnumeratingWithState:&v54 objects:v68 count:16];
    }
    while (v38);
  }

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v42 = v35;
  uint64_t v43 = [v42 countByEnumeratingWithState:&v50 objects:v67 count:16];
  if (v43)
  {
    uint64_t v44 = v43;
    uint64_t v45 = *(void *)v51;
    do
    {
      for (uint64_t j = 0; j != v44; ++j)
      {
        if (*(void *)v51 != v45) {
          objc_enumerationMutation(v42);
        }
        objc_msgSend(*(id *)(*(void *)(a1[7] + 8) + 40), "removeObject:", *(void *)(*((void *)&v50 + 1) + 8 * j), (void)v50);
      }
      uint64_t v44 = [v42 countByEnumeratingWithState:&v50 objects:v67 count:16];
    }
    while (v44);
  }

  uint64_t v47 = *(void *)(a1[6] + 8);
  v48 = *(void **)(v47 + 40);
  *(void *)(v47 + 40) = v31;
  id v49 = v31;
}

void __94__ATXShadowMetricsComputer_computeResultAsTrendPlotFromStartDate_toEndDate_resultGranularity___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v6 = a2;
  id v7 = [v5 identifierForPredictionAtIndex:a3];
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v7];
}

void __94__ATXShadowMetricsComputer_computeResultAsTrendPlotFromStartDate_toEndDate_resultGranularity___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v10 = a2;
  uint64_t v5 = [*(id *)(a1 + 32) identifierForPredictionAtIndex:a3];
  [*(id *)(a1 + 40) addObject:v5];
  id v6 = [*(id *)(a1 + 48) objectForKeyedSubscript:v5];
  if (!v6 || ([*(id *)(*(void *)(a1 + 56) + 8) isPrediction:v6 equalToPrediction:v10] & 1) == 0)
  {
    id v7 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) data];
    objc_msgSend(v7, "setNumberOfCachedPredictions:", objc_msgSend(v7, "numberOfCachedPredictions") + 1);

    uint64_t v8 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) confidenceCategoryForPredictionAtIndex:a3];
    switch(v8)
    {
      case 4:
        id v9 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) data];
        objc_msgSend(v9, "setNumberOfCachedHighConfidencePredictions:", objc_msgSend(v9, "numberOfCachedHighConfidencePredictions") + 1);
        break;
      case 3:
        id v9 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) data];
        objc_msgSend(v9, "setNumberOfCachedMediumConfidencePredictions:", objc_msgSend(v9, "numberOfCachedMediumConfidencePredictions") + 1);
        break;
      case 2:
        id v9 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) data];
        objc_msgSend(v9, "setNumberOfCachedLowConfidencePredictions:", objc_msgSend(v9, "numberOfCachedLowConfidencePredictions") + 1);
        break;
      default:
LABEL_10:
        [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) removeObject:v5];
        goto LABEL_11;
    }

    goto LABEL_10;
  }
LABEL_11:
}

- (id)computeResultFromStartDate:(id)a3 toEndDate:(id)a4
{
  uint64_t v4 = [(ATXShadowMetricsComputer *)self computeResultAsTrendPlotFromStartDate:a3 toEndDate:a4 resultGranularity:0];
  uint64_t v5 = [v4 bins];
  id v6 = [v5 firstObject];
  id v7 = [v6 data];

  return v7;
}

- (ATXShadowMetricsDataSource)dataSource
{
  return self->_dataSource;
}

- (void).cxx_destruct
{
}

void __94__ATXShadowMetricsComputer_computeResultAsTrendPlotFromStartDate_toEndDate_resultGranularity___block_invoke_7_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1AE67F000, log, OS_LOG_TYPE_ERROR, "ATXShadowMetricsComputer: identifierForPredictionAtIndex unexpectedly returned nil.", v1, 2u);
}

@end