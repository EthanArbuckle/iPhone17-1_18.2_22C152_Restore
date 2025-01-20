@interface PHACurareShadowEvaluationRunner
+ (id)runnerLog;
- (BOOL)runWithError:(id *)a3;
- (PHACurareShadowEvaluationRecipeOptions)options;
- (PHACurareShadowEvaluationRunner)initWithRecipeOptions:(id)a3;
- (id)evaluateModel:(id)a3 datasetDictionary:(id)a4 error:(id *)a5;
- (id)getDatasetWithError:(id *)a3;
- (void)generateCAEventForResults:(id)a3;
@end

@implementation PHACurareShadowEvaluationRunner

- (void).cxx_destruct
{
}

- (PHACurareShadowEvaluationRecipeOptions)options
{
  return self->_options;
}

- (id)getDatasetWithError:(id *)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v4 = [(PHACurareShadowEvaluationRunner *)self options];
  v5 = +[PHACurareShadowEvaluationDataset prepareDatasetForEvaluationTaskWithRecipeOptions:v4 error:a3];

  if (v5)
  {
    id v6 = v5;
  }
  else
  {
    v7 = +[PHACurareShadowEvaluationRunner runnerLog];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412290;
      uint64_t v11 = 0;
      _os_log_error_impl(&dword_1D21F2000, v7, OS_LOG_TYPE_ERROR, "Failed to create allData with error: %@", (uint8_t *)&v10, 0xCu);
    }

    v8 = [NSString stringWithFormat:@"Failed to generate dataset for all data"];
    +[PHACurareShadowEvaluationUtilities generateError:a3 errorCode:5 errorDomain:@"com.apple.PhotoAnalysis.PHACurareShadowEvaluationRunner" message:v8 underlyingError:0];
  }

  return v5;
}

- (id)evaluateModel:(id)a3 datasetDictionary:(id)a4 error:(id *)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = [PHACurareShadowEvaluationEvaluator alloc];
  int v10 = [(PHACurareShadowEvaluationRunner *)self options];
  uint64_t v11 = [v10 modelInputName];
  uint64_t v12 = [(PHACurareShadowEvaluationRunner *)self options];
  v13 = [v12 modelOutputName];
  v14 = [(PHACurareShadowEvaluationRunner *)self options];
  v15 = [v14 lossName];
  v16 = [(PHACurareShadowEvaluationEvaluator *)v9 initWithModelInputName:v11 modelOutputName:v13 lossName:v15];

  v17 = [v7 objectForKeyedSubscript:@"modelPath"];
  v18 = v17;
  if (v17 && [v17 length])
  {
    v19 = [v7 objectForKeyedSubscript:@"labelIndex"];
    uint64_t v20 = [v19 intValue];

    v21 = [v7 objectForKeyedSubscript:@"labelOperatingPoint"];
    [v21 floatValue];
    int v23 = v22;

    v24 = [v8 objectForKeyedSubscript:@"kPositive"];
    v25 = [v8 objectForKeyedSubscript:@"kNegative"];
    id v35 = 0;
    LODWORD(v26) = v23;
    v27 = [(PHACurareShadowEvaluationEvaluator *)v16 evaluateModelAtPath:v18 labelIndex:v20 labelOperatingPoint:v24 positiveEvaluationData:v25 negativeEvaluationData:&v35 error:v26];
    v28 = v35;

    v29 = +[PHACurareShadowEvaluationRunner runnerLog];
    v30 = v29;
    if (!v27 || v28)
    {
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v37 = v28;
        _os_log_error_impl(&dword_1D21F2000, v30, OS_LOG_TYPE_ERROR, "Failed to generate results for dataset with error: %@", buf, 0xCu);
      }

      v32 = [NSString stringWithFormat:@"Failed to evaluate model: %@ on dataset", v18];
      +[PHACurareShadowEvaluationUtilities generateError:a5 errorCode:6 errorDomain:@"com.apple.PhotoAnalysis.PHACurareShadowEvaluationRunner" message:v32 underlyingError:v28];

      id v31 = 0;
    }
    else
    {
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v37 = v18;
        _os_log_impl(&dword_1D21F2000, v30, OS_LOG_TYPE_INFO, "Generated result for model: %@", buf, 0xCu);
      }

      id v31 = v27;
    }
  }
  else
  {
    v28 = +[PHACurareShadowEvaluationRunner runnerLog];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D21F2000, v28, OS_LOG_TYPE_ERROR, "modelPath is empty", buf, 2u);
    }
    id v31 = 0;
  }

  return v31;
}

- (void)generateCAEventForResults:(id)a3
{
  v58[23] = *MEMORY[0x1E4F143B8];
  id v39 = a3;
  v4 = +[PHACurareShadowEvaluationRunner runnerLog];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D21F2000, v4, OS_LOG_TYPE_INFO, "Begin generateCAEventForResults", buf, 2u);
  }

  v57[0] = @"model1_name";
  v57[1] = @"model1_positive_numberOfCorrectSamples";
  v58[0] = @"nil";
  v58[1] = @"nil";
  v57[2] = @"model1_positive_lossMetric";
  v57[3] = @"model1_positive_prediction_mean";
  v58[2] = @"nil";
  v58[3] = @"nil";
  v57[4] = @"model1_positive_prediction_stddev";
  v57[5] = @"model1_negative_numberOfCorrectSamples";
  v58[4] = @"nil";
  v58[5] = @"nil";
  v57[6] = @"model1_negative_lossMetric";
  v57[7] = @"model1_negative_prediction_mean";
  v58[6] = @"nil";
  v58[7] = @"nil";
  v57[8] = @"model1_negative_prediction_stddev";
  v57[9] = @"model2_name";
  v58[8] = @"nil";
  v58[9] = @"nil";
  v57[10] = @"model2_positive_numberOfCorrectSamples";
  v57[11] = @"model2_positive_lossMetric";
  v58[10] = @"nil";
  v58[11] = @"nil";
  v57[12] = @"model2_positive_prediction_mean";
  v57[13] = @"model2_positive_prediction_stddev";
  v58[12] = @"nil";
  v58[13] = @"nil";
  v57[14] = @"model2_negative_numberOfCorrectSamples";
  v57[15] = @"model2_negative_lossMetric";
  v58[14] = @"nil";
  v58[15] = @"nil";
  v57[16] = @"model2_negative_prediction_mean";
  v57[17] = @"model2_negative_prediction_stddev";
  v58[16] = @"nil";
  v58[17] = @"nil";
  v57[18] = @"positive_numberOfSamples";
  v57[19] = @"negative_numberOfSamples";
  v58[18] = @"nil";
  v58[19] = @"nil";
  v57[20] = @"trial_deplyomentID";
  v5 = [(PHACurareShadowEvaluationRunner *)self options];
  id v6 = [v5 trialDeploymentID];
  v58[20] = v6;
  v57[21] = @"trial_experimentID";
  id v7 = [(PHACurareShadowEvaluationRunner *)self options];
  id v8 = [v7 trialExperimentID];
  v58[21] = v8;
  v57[22] = @"trial_treatmentID";
  v9 = [(PHACurareShadowEvaluationRunner *)self options];
  int v10 = [v9 trialTreatmentID];
  v58[22] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v58 forKeys:v57 count:23];
  uint64_t v12 = (void *)[v11 mutableCopy];

  v13 = [v39 allKeys];
  v14 = [v13 sortedArrayUsingSelector:sel_caseInsensitiveCompare_];

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id obj = v14;
  uint64_t v40 = [obj countByEnumeratingWithState:&v47 objects:v56 count:16];
  if (v40)
  {
    uint64_t v38 = *(void *)v48;
    uint64_t v15 = 1;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v48 != v38) {
          objc_enumerationMutation(obj);
        }
        uint64_t v41 = v16;
        v17 = [v39 objectForKeyedSubscript:*(void *)(*((void *)&v47 + 1) + 8 * v16)];
        long long v43 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        id v42 = v17;
        uint64_t v18 = [v17 countByEnumeratingWithState:&v43 objects:v55 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v44;
          do
          {
            for (uint64_t i = 0; i != v19; ++i)
            {
              if (*(void *)v44 != v20) {
                objc_enumerationMutation(v42);
              }
              int v22 = *(void **)(*((void *)&v43 + 1) + 8 * i);
              int v23 = [v22 isPositiveData];
              v24 = @"negative";
              if (v23) {
                v24 = @"positive";
              }
              v25 = v24;
              double v26 = [v22 modelName];
              v27 = objc_msgSend(NSString, "stringWithFormat:", @"model%d_name", v15);
              [v12 setObject:v26 forKeyedSubscript:v27];

              v28 = [v22 numberOfCorrectSamples];
              v29 = [NSString stringWithFormat:@"model%d_%@_numberOfCorrectSamples", v15, v25];
              [v12 setObject:v28 forKeyedSubscript:v29];

              v30 = [v22 meanPredictionValue];
              id v31 = [NSString stringWithFormat:@"model%d_%@_prediction_mean", v15, v25];
              [v12 setObject:v30 forKeyedSubscript:v31];

              v32 = [v22 stddevPredictionValue];
              v33 = [NSString stringWithFormat:@"model%d_%@_prediction_stddev", v15, v25];
              [v12 setObject:v32 forKeyedSubscript:v33];

              v34 = [v22 numberOfTotalSamples];
              id v35 = [NSString stringWithFormat:@"%@_numberOfSamples", v25];

              [v12 setObject:v34 forKeyedSubscript:v35];
            }
            uint64_t v19 = [v42 countByEnumeratingWithState:&v43 objects:v55 count:16];
          }
          while (v19);
        }
        uint64_t v15 = (v15 + 1);

        uint64_t v16 = v41 + 1;
      }
      while (v41 + 1 != v40);
      uint64_t v40 = [obj countByEnumeratingWithState:&v47 objects:v56 count:16];
    }
    while (v40);
  }

  v36 = +[PHACurareShadowEvaluationRunner runnerLog];
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v52 = @"com.apple.com.apple.PhotoAnalysis.PhotoAnalysisLighthousePlugin.modelMetricsV6";
    __int16 v53 = 2114;
    v54 = v12;
    _os_log_impl(&dword_1D21F2000, v36, OS_LOG_TYPE_DEFAULT, "Sending event to %{public}@, payload: %{public}@", buf, 0x16u);
  }

  AnalyticsSendEvent();
}

- (BOOL)runWithError:(id *)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v5 = +[PHACurareShadowEvaluationRunner runnerLog];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D21F2000, v5, OS_LOG_TYPE_INFO, "Begin runWithError", buf, 2u);
  }

  uint64_t v6 = [(PHACurareShadowEvaluationRunner *)self getDatasetWithError:a3];
  id v7 = (void *)v6;
  if (*a3 || !v6)
  {
    id v8 = +[PHACurareShadowEvaluationRunner runnerLog];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v22 = *a3;
      *(_DWORD *)buf = 138412290;
      id v33 = v22;
      _os_log_error_impl(&dword_1D21F2000, v8, OS_LOG_TYPE_ERROR, "getDatasetWithError failed with error: %@", buf, 0xCu);
    }
LABEL_24:
    BOOL v21 = 0;
  }
  else
  {
    id v8 = objc_opt_new();
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v9 = [(PHACurareShadowEvaluationRunner *)self options];
    int v10 = [v9 modelInfoArray];

    id obj = v10;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (v11)
    {
      uint64_t v13 = v11;
      uint64_t v14 = *(void *)v29;
      *(void *)&long long v12 = 138412290;
      long long v26 = v12;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v29 != v14) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          v17 = objc_msgSend(v16, "valueForKeyPath:", @"modelPath", v26);
          uint64_t v18 = +[PHACurareShadowEvaluationRunner runnerLog];
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v26;
            id v33 = v17;
            _os_log_impl(&dword_1D21F2000, v18, OS_LOG_TYPE_INFO, "Model path at runWithError: %@", buf, 0xCu);
          }

          uint64_t v19 = [(PHACurareShadowEvaluationRunner *)self evaluateModel:v16 datasetDictionary:v7 error:a3];
          if (!v19 || *a3)
          {
            int v23 = +[PHACurareShadowEvaluationRunner runnerLog];
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              id v25 = *a3;
              *(_DWORD *)buf = 138412546;
              id v33 = v17;
              __int16 v34 = 2112;
              id v35 = v25;
              _os_log_error_impl(&dword_1D21F2000, v23, OS_LOG_TYPE_ERROR, "evaluateModel failed on positive dataset for model %@, failed with error: %@", buf, 0x16u);
            }

            goto LABEL_24;
          }
          [v8 setObject:v19 forKeyedSubscript:v17];
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v28 objects:v36 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }

    uint64_t v20 = +[PHACurareShadowEvaluationRunner runnerLog];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D21F2000, v20, OS_LOG_TYPE_INFO, "Call generateCAEventForResults", buf, 2u);
    }

    [(PHACurareShadowEvaluationRunner *)self generateCAEventForResults:v8];
    BOOL v21 = 1;
  }

  return v21;
}

- (PHACurareShadowEvaluationRunner)initWithRecipeOptions:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PHACurareShadowEvaluationRunner;
  uint64_t v6 = [(PHACurareShadowEvaluationRunner *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_options, a3);
  }

  return v7;
}

+ (id)runnerLog
{
  if (runnerLog_onceToken != -1) {
    dispatch_once(&runnerLog_onceToken, &__block_literal_global_955);
  }
  v2 = (void *)runnerLog_runnerLog;

  return v2;
}

uint64_t __44__PHACurareShadowEvaluationRunner_runnerLog__block_invoke()
{
  runnerLog_runnerLog = (uint64_t)os_log_create("com.apple.PhotoAnalysis.PhotoAnalysisLighthousePlugin", "Runner");

  return MEMORY[0x1F41817F8]();
}

@end