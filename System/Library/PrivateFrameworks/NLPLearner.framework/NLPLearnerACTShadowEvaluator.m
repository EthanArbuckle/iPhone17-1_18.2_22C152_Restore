@interface NLPLearnerACTShadowEvaluator
+ (id)actParamFilesAtPath:(id)a3;
+ (id)actParametersFromConfig:(id)a3;
+ (id)processACTResults:(id)a3 metric:(id)a4;
+ (void)initialize;
- (NLPLearnerACTShadowEvaluator)initWithLocale:(id)a3 andMetricParameters:(id)a4;
- (NSDictionary)metricParameters;
- (NSString)tempCorpusPath;
- (id)evaluateModel:(id)a3 onRecords:(id)a4 options:(id)a5 completion:(id)a6 error:(id *)a7;
- (id)runACTWithParams:(id)a3 modelPath:(id)a4 data:(id)a5;
- (void)setMetricParameters:(id)a3;
- (void)setTempCorpusPath:(id)a3;
@end

@implementation NLPLearnerACTShadowEvaluator

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    sLog_7 = (uint64_t)os_log_create("com.apple.NLPLearner", "NLPLearnerACTShadowEvaluator");
    MEMORY[0x270F9A758]();
  }
}

- (NLPLearnerACTShadowEvaluator)initWithLocale:(id)a3 andMetricParameters:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  os_log_t v9 = os_log_create("com.apple.NLPLearner", "NLPLearnerACTShadowEvaluator");
  v10 = (void *)sLog_7;
  sLog_7 = (uint64_t)v9;

  v13.receiver = self;
  v13.super_class = (Class)NLPLearnerACTShadowEvaluator;
  v11 = [(NLPLearnerShadowEvaluator *)&v13 initWithLocale:v8 andTask:7];

  if (v11) {
    objc_storeStrong((id *)&v11->_metricParameters, a4);
  }

  return v11;
}

+ (id)actParamFilesAtPath:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [MEMORY[0x263F08850] defaultManager];
  id v23 = 0;
  v5 = [v4 contentsOfDirectoryAtPath:v3 error:&v23];
  id v6 = v23;

  if (v6)
  {
    if (os_log_type_enabled((os_log_t)sLog_7, OS_LOG_TYPE_ERROR)) {
      +[NLPLearnerACTShadowEvaluator actParamFilesAtPath:]();
    }
    id v7 = 0;
  }
  else
  {
    v18 = [MEMORY[0x263F08A98] predicateWithFormat:@"pathExtension MATCHES 'json'"];
    objc_msgSend(v5, "filteredArrayUsingPredicate:");
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_super v13 = [*(id *)(*((void *)&v19 + 1) + 8 * i) stringByDeletingPathExtension];
          v14 = supportedMetrics();
          char v15 = [v14 containsObject:v13];

          if ((v15 & 1) == 0)
          {
            v16 = (void *)sLog_7;
            if (os_log_type_enabled((os_log_t)sLog_7, OS_LOG_TYPE_ERROR)) {
              +[NLPLearnerACTShadowEvaluator actParamFilesAtPath:]((uint64_t)v13, v16);
            }

            id v7 = 0;
            goto LABEL_17;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v24 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    id v7 = v8;
LABEL_17:
  }
  return v7;
}

- (id)evaluateModel:(id)a3 onRecords:(id)a4 options:(id)a5 completion:(id)a6 error:(id *)a7
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  id v58 = a3;
  id v11 = a4;
  v12 = [a5 objectForKeyedSubscript:@"skip_if_ondevice_autocorrection_disabled"];
  if (!v12) {
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_9;
  }
  objc_super v13 = (void *)sLog_7;
  if (os_log_type_enabled((os_log_t)sLog_7, OS_LOG_TYPE_INFO))
  {
    v14 = v13;
    int v15 = [v12 BOOLValue];
    v16 = @"NO";
    if (v15) {
      v16 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    v74 = v16;
    _os_log_impl(&dword_234530000, v14, OS_LOG_TYPE_INFO, "skip_if_ondevice_autocorrection_disabled is set to %@", buf, 0xCu);
  }
  if (![v12 BOOLValue]
    || ([MEMORY[0x263F53C50] sharedConnection],
        v17 = objc_claimAutoreleasedReturnValue(),
        char v18 = [v17 isAutoCorrectionAllowed],
        v17,
        (v18 & 1) != 0))
  {
LABEL_9:
    v57 = [(NLPLearnerShadowEvaluator *)self prepareDataFromRecords:v11];
    if (![v57 numSamples])
    {
      if (!a7)
      {
        id v31 = 0;
LABEL_39:

        goto LABEL_40;
      }
      v32 = (void *)MEMORY[0x263F087E8];
      uint64_t v71 = *MEMORY[0x263F08320];
      v72 = @"missing evaluation data for ACT";
      id v19 = [NSDictionary dictionaryWithObjects:&v72 forKeys:&v71 count:1];
      [v32 errorWithDomain:@"com.apple.NLPLearner.NLPShadowEvaluationErrorDomain" code:9 userInfo:v19];
      id v31 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_38:

      goto LABEL_39;
    }
    id v19 = (id)objc_opt_new();
    long long v20 = [(NLPLearnerACTShadowEvaluator *)self metricParameters];

    if (v20)
    {
      v51 = v12;
      id v53 = v11;
      long long v65 = 0u;
      long long v66 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      long long v21 = [(NLPLearnerACTShadowEvaluator *)self metricParameters];
      uint64_t v22 = [v21 countByEnumeratingWithState:&v63 objects:v70 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v64;
        do
        {
          for (uint64_t i = 0; i != v23; ++i)
          {
            if (*(void *)v64 != v24) {
              objc_enumerationMutation(v21);
            }
            uint64_t v26 = *(void *)(*((void *)&v63 + 1) + 8 * i);
            v27 = [(NLPLearnerACTShadowEvaluator *)self metricParameters];
            v28 = [v27 objectForKeyedSubscript:v26];

            v29 = [(NLPLearnerACTShadowEvaluator *)self runACTWithParams:v28 modelPath:v58 data:v57];
            v30 = +[NLPLearnerACTShadowEvaluator processACTResults:v29 metric:v26];
            [v19 addEntriesFromDictionary:v30];
          }
          uint64_t v23 = [v21 countByEnumeratingWithState:&v63 objects:v70 count:16];
        }
        while (v23);
      }

      id v19 = v19;
      id v31 = v19;
      v12 = v51;
      id v11 = v53;
      goto LABEL_38;
    }
    v33 = [v58 path];
    v34 = +[NLPLearnerACTShadowEvaluator actParamFilesAtPath:v33];

    if ([v34 count])
    {
      v52 = v12;
      id v54 = v11;
      long long v61 = 0u;
      long long v62 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      v50 = v34;
      obuint64_t j = v34;
      uint64_t v35 = [obj countByEnumeratingWithState:&v59 objects:v67 count:16];
      if (v35)
      {
        uint64_t v36 = v35;
        uint64_t v56 = *(void *)v60;
        do
        {
          for (uint64_t j = 0; j != v36; ++j)
          {
            if (*(void *)v60 != v56) {
              objc_enumerationMutation(obj);
            }
            v38 = *(void **)(*((void *)&v59 + 1) + 8 * j);
            v39 = [v58 URLByAppendingPathComponent:v38];
            v40 = +[NLPLearnerACTShadowEvaluator actParametersFromConfig:v39];
            v41 = sLog_7;
            if (os_log_type_enabled((os_log_t)sLog_7, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v74 = v40;
              _os_log_impl(&dword_234530000, v41, OS_LOG_TYPE_INFO, "Run ACT with params : %@", buf, 0xCu);
            }
            v42 = [(NLPLearnerACTShadowEvaluator *)self runACTWithParams:v40 modelPath:v58 data:v57];
            v43 = [v38 stringByDeletingPathExtension];
            v44 = +[NLPLearnerACTShadowEvaluator processACTResults:v42 metric:v43];
            [v19 addEntriesFromDictionary:v44];
          }
          uint64_t v36 = [obj countByEnumeratingWithState:&v59 objects:v67 count:16];
        }
        while (v36);
      }

      id v31 = v19;
      v34 = v50;
      v12 = v52;
      id v11 = v54;
      goto LABEL_37;
    }
    v45 = (void *)sLog_7;
    if (os_log_type_enabled((os_log_t)sLog_7, OS_LOG_TYPE_ERROR))
    {
      -[NLPLearnerACTShadowEvaluator evaluateModel:onRecords:options:completion:error:](v45, v58);
      if (!a7) {
        goto LABEL_36;
      }
    }
    else if (!a7)
    {
LABEL_36:
      id v31 = 0;
LABEL_37:

      goto LABEL_38;
    }
    v46 = (void *)MEMORY[0x263F087E8];
    uint64_t v68 = *MEMORY[0x263F08320];
    v69 = @"Cannot load params file for ACT evaluation";
    v47 = [NSDictionary dictionaryWithObjects:&v69 forKeys:&v68 count:1];
    *a7 = [v46 errorWithDomain:@"com.apple.NLPLearner.NLPShadowEvaluationErrorDomain" code:6 userInfo:v47];

    goto LABEL_36;
  }
  v49 = (void *)sLog_7;
  if (os_log_type_enabled((os_log_t)sLog_7, OS_LOG_TYPE_ERROR))
  {
    -[NLPLearnerACTShadowEvaluator evaluateModel:onRecords:options:completion:error:](v49, self);
    if (a7) {
      goto LABEL_45;
    }
  }
  else if (a7)
  {
LABEL_45:
    [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.NLPLearner.NLPShadowEvaluationErrorDomain" code:10 userInfo:&unk_26E74D850];
    id v31 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_40;
  }
  id v31 = 0;
LABEL_40:

  return v31;
}

+ (id)processACTResults:(id)a3 metric:(id)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v40 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v29;
    v12 = @"WordErrorCount";
    uint64_t v27 = *(void *)v29;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v29 != v11) {
          objc_enumerationMutation(v8);
        }
        v14 = *(void **)(*((void *)&v28 + 1) + 8 * v13);
        if (![v14 isEqualToString:v12])
        {
          if ([v14 isEqualToString:@"InsertedCharacterCount"])
          {
            if (![v6 isEqualToString:@"KSR"]) {
              goto LABEL_22;
            }
            int v15 = [v8 objectForKeyedSubscript:v14];
            [v7 setObject:v15 forKey:v14];
          }
          else
          {
            int v15 = [v7 objectForKey:v14];
            v16 = [v8 objectForKeyedSubscript:v14];
            if (v15)
            {
              id v20 = v7;
              long long v21 = v12;
              char v22 = [v15 isEqual:v16];

              if ((v22 & 1) == 0)
              {
                uint64_t v23 = (void *)sLog_7;
                if (os_log_type_enabled((os_log_t)sLog_7, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v24 = v23;
                  uint64_t v25 = [v8 objectForKeyedSubscript:v14];
                  *(_DWORD *)buf = 138413058;
                  id v33 = v6;
                  __int16 v34 = 2112;
                  uint64_t v35 = v14;
                  __int16 v36 = 2112;
                  v37 = v15;
                  __int16 v38 = 2112;
                  v39 = v25;
                  _os_log_error_impl(&dword_234530000, v24, OS_LOG_TYPE_ERROR, "In the ACT result for metric: %@, Key: %@, expected Value: %@ where as actual Value: %@", buf, 0x2Au);
                }
              }
              v12 = v21;
              id v7 = v20;
              uint64_t v11 = v27;
            }
            else
            {
              v17 = v7;
              char v18 = v16;
              id v19 = v14;
LABEL_20:
              [v17 setObject:v18 forKey:v19];
            }
          }

          goto LABEL_22;
        }
        if (overrideWordErrorCountForMetrics_onceToken != -1) {
          dispatch_once(&overrideWordErrorCountForMetrics_onceToken, &__block_literal_global_108);
        }
        if ([(id)overrideWordErrorCountForMetrics_overrideWordErrorCountForMetrics containsObject:v6])
        {
          int v15 = [v8 objectForKeyedSubscript:v14];
          v16 = [NSString stringWithFormat:@"%@%@", v6, v14];
          v17 = v7;
          char v18 = v15;
          id v19 = v16;
          goto LABEL_20;
        }
LABEL_22:
        ++v13;
      }
      while (v10 != v13);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v28 objects:v40 count:16];
    }
    while (v10);
  }

  return v7;
}

+ (id)actParametersFromConfig:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = (objc_class *)MEMORY[0x263EFF8F8];
  id v4 = a3;
  id v5 = [v3 alloc];
  id v6 = [v4 path];

  id v18 = 0;
  id v7 = (void *)[v5 initWithContentsOfFile:v6 options:1 error:&v18];
  id v8 = v18;

  id v17 = v8;
  uint64_t v9 = [MEMORY[0x263F08900] JSONObjectWithData:v7 options:0 error:&v17];
  id v10 = v17;

  uint64_t v11 = (void *)[v9 mutableCopy];
  v12 = (void *)sLog_7;
  if (os_log_type_enabled((os_log_t)sLog_7, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = v12;
    v14 = [v11 description];
    *(_DWORD *)buf = 138412290;
    id v20 = v14;
    _os_log_impl(&dword_234530000, v13, OS_LOG_TYPE_INFO, "Loaded ACT params from config: %@", buf, 0xCu);
  }
  if (!v11 || v10)
  {
    if (os_log_type_enabled((os_log_t)sLog_7, OS_LOG_TYPE_ERROR)) {
      +[NLPLearnerACTShadowEvaluator actParametersFromConfig:]();
    }
    id v15 = 0;
  }
  else
  {
    id v15 = v11;
  }

  return v15;
}

- (id)runACTWithParams:(id)a3 modelPath:(id)a4 data:(id)a5
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v9 path];
  v12 = [v11 stringByDeletingPathExtension];

  uint64_t v13 = [v8 objectForKeyedSubscript:@"CUSTOM_LANGUAGE_MODEL_PATH"];
  if (v13)
  {
    [v8 setObject:v12 forKeyedSubscript:@"CUSTOM_LANGUAGE_MODEL_PATH"];
    v14 = (void *)sLog_7;
    if (os_log_type_enabled((os_log_t)sLog_7, OS_LOG_TYPE_INFO))
    {
      id v15 = v14;
      v16 = [v8 objectForKeyedSubscript:@"CUSTOM_LANGUAGE_MODEL_PATH"];
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v13;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v16;
      _os_log_impl(&dword_234530000, v15, OS_LOG_TYPE_INFO, "Updated CUSTOM_LANGUAGE_MODEL_PATH from '%@' to '%@'", buf, 0x16u);
    }
  }
  id v17 = [v8 objectForKeyedSubscript:@"CUSTOM_STATIC_DICTIONARY_PATH"];
  if (v17)
  {
    id v18 = [v12 stringByAppendingPathComponent:v17];
    [v8 setObject:v18 forKeyedSubscript:@"CUSTOM_STATIC_DICTIONARY_PATH"];

    id v19 = (void *)sLog_7;
    if (os_log_type_enabled((os_log_t)sLog_7, OS_LOG_TYPE_INFO))
    {
      id v20 = v19;
      uint64_t v21 = [v8 objectForKeyedSubscript:@"CUSTOM_STATIC_DICTIONARY_PATH"];
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v17;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v21;
      _os_log_impl(&dword_234530000, v20, OS_LOG_TYPE_INFO, "Updated CUSTOM_STATIC_DICTIONARY_PATH from '%@' to '%@'", buf, 0x16u);
    }
  }
  char v22 = [(NLPLearnerShadowEvaluator *)self locale];
  uint64_t v23 = [v22 localeIdentifier];
  [v8 setValue:v23 forKey:@"KEYBOARD_LANGUAGE"];

  uint64_t v24 = [v10 getSamples];
  [v8 setObject:v24 forKey:@"INPUT_SAMPLES"];

  [v8 setValue:@"0" forKey:@"WORD_LEARNING_ENABLED"];
  id v25 = objc_alloc_init(MEMORY[0x263F7EC10]);
  [v25 resetOptions:v8];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v39 = __Block_byref_object_copy__1;
  v40 = __Block_byref_object_dispose__1;
  id v41 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v26 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "numSamples"));
  [*(id *)(*(void *)&buf[8] + 40) setObject:v26 forKeyedSubscript:@"Samples"];

  dispatch_semaphore_t v27 = dispatch_semaphore_create(0);
  long long v28 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__NLPLearnerACTShadowEvaluator_runACTWithParams_modelPath_data___block_invoke;
  block[3] = &unk_264BEECE8;
  dispatch_semaphore_t v36 = v27;
  v37 = buf;
  id v35 = v25;
  long long v29 = v27;
  id v30 = v25;
  dispatch_async(v28, block);

  dispatch_time_t v31 = dispatch_time(0, 600000000000);
  dispatch_semaphore_wait(v29, v31);
  id v32 = *(id *)(*(void *)&buf[8] + 40);

  _Block_object_dispose(buf, 8);
  return v32;
}

void __64__NLPLearnerACTShadowEvaluator_runACTWithParams_modelPath_data___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __64__NLPLearnerACTShadowEvaluator_runACTWithParams_modelPath_data___block_invoke_2;
  v4[3] = &unk_264BEECC0;
  long long v3 = *(_OWORD *)(a1 + 40);
  id v2 = (id)v3;
  long long v5 = v3;
  [v1 runWithObserver:v4];
}

void __64__NLPLearnerACTShadowEvaluator_runACTWithParams_modelPath_data___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  if (reporterKeysToKeep_onceToken != -1) {
    dispatch_once(&reporterKeysToKeep_onceToken, &__block_literal_global_113);
  }
  id v4 = (id)reporterKeysToKeep_keysForCASchema;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        id v10 = objc_msgSend(v3, "objectForKeyedSubscript:", v9, (void)v11);
        [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v10 forKeyedSubscript:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (NSString)tempCorpusPath
{
  return self->_tempCorpusPath;
}

- (void)setTempCorpusPath:(id)a3
{
}

- (NSDictionary)metricParameters
{
  return self->_metricParameters;
}

- (void)setMetricParameters:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricParameters, 0);
  objc_storeStrong((id *)&self->_tempCorpusPath, 0);
}

+ (void)actParamFilesAtPath:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = supportedMetrics();
  int v5 = 138412546;
  uint64_t v6 = a1;
  __int16 v7 = 2112;
  id v8 = v4;
  _os_log_error_impl(&dword_234530000, v3, OS_LOG_TYPE_ERROR, "The specified params file name is : %@ but it should be %@", (uint8_t *)&v5, 0x16u);
}

+ (void)actParamFilesAtPath:.cold.2()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_234530000, v1, OS_LOG_TYPE_ERROR, "Cannot get list of act param files in : %@ with error: %@", v2, 0x16u);
}

- (void)evaluateModel:(void *)a1 onRecords:(void *)a2 options:completion:error:.cold.1(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 path];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234530000, v5, v6, "Cannot load act param files in : %@", v7, v8, v9, v10, v11);
}

- (void)evaluateModel:(void *)a1 onRecords:(void *)a2 options:completion:error:.cold.2(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 locale];
  uint64_t v5 = [v4 localeIdentifier];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234530000, v6, v7, "Autocorrection is disabled for for language: %@", v8, v9, v10, v11, v12);
}

+ (void)actParametersFromConfig:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_234530000, v0, OS_LOG_TYPE_ERROR, "Failed to load parameter config for ACT evaluation: %@", v1, 0xCu);
}

@end