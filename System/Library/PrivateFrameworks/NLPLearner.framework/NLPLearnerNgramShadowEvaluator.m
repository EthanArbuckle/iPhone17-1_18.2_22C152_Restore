@interface NLPLearnerNgramShadowEvaluator
+ (void)initialize;
- (id)evaluateModel:(id)a3 onRecords:(id)a4 options:(id)a5 completion:(id)a6 error:(id *)a7;
@end

@implementation NLPLearnerNgramShadowEvaluator

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    sLog_4 = (uint64_t)os_log_create("com.apple.NLPLearner", "NLPLearnerNgramShadowEvaluator");
    MEMORY[0x270F9A758]();
  }
}

- (id)evaluateModel:(id)a3 onRecords:(id)a4 options:(id)a5 completion:(id)a6 error:(id *)a7
{
  v49[1] = *MEMORY[0x263EF8340];
  id v32 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = [(NLPLearnerShadowEvaluator *)self prepareDataFromRecords:v12];
  if ([v15 numSamples])
  {
    v46[0] = *MEMORY[0x263F512A8];
    v16 = [(NLPLearnerShadowEvaluator *)self locale];
    v17 = [v16 languageCode];
    v46[1] = *MEMORY[0x263F51248];
    v47[0] = v17;
    v47[1] = MEMORY[0x263EFFA80];
    v18 = [NSDictionary dictionaryWithObjects:v47 forKeys:v46 count:2];

    uint64_t v19 = LMLanguageModelCreate();
    if (v19)
    {
      uint64_t v38 = 0;
      v39 = (float *)&v38;
      uint64_t v40 = 0x2020000000;
      int v41 = 0;
      uint64_t v34 = 0;
      v35 = &v34;
      uint64_t v36 = 0x2020000000;
      uint64_t v37 = 0;
      v20 = [v15 getSamples];
      v33[0] = MEMORY[0x263EF8330];
      v33[1] = 3221225472;
      v33[2] = __83__NLPLearnerNgramShadowEvaluator_evaluateModel_onRecords_options_completion_error___block_invoke;
      v33[3] = &unk_264BEEB30;
      v33[4] = self;
      v33[5] = &v38;
      v33[6] = &v34;
      v33[7] = v19;
      [v20 enumerateObjectsUsingBlock:v33];

      unint64_t v22 = v35[3];
      if (v22) {
        *(float *)&double v21 = (float)(v39[6] * 100.0) / (float)v22;
      }
      else {
        double v21 = 0.0;
      }
      v42[0] = @"MLPModelTrainerOverallAccuracyKey";
      v29 = [NSNumber numberWithFloat:v21];
      v42[1] = @"Samples";
      v43[0] = v29;
      v30 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v15, "numSamples"));
      v43[1] = v30;
      v24 = [NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:2];

      _Block_object_dispose(&v34, 8);
      _Block_object_dispose(&v38, 8);
    }
    else
    {
      v25 = sLog_4;
      if (os_log_type_enabled((os_log_t)sLog_4, OS_LOG_TYPE_ERROR)) {
        -[NLPLearnerCoreNLPShadowEvaluator evaluateModel:onRecords:options:completion:error:]((uint64_t)v32, v25);
      }
      if (a7)
      {
        v26 = (void *)MEMORY[0x263F087E8];
        uint64_t v44 = *MEMORY[0x263F08320];
        v27 = [NSString stringWithFormat:@"error loading static lm model"];
        v45 = v27;
        v28 = [NSDictionary dictionaryWithObjects:&v45 forKeys:&v44 count:1];
        *a7 = [v26 errorWithDomain:@"com.apple.NLPLearner.NLPShadowEvaluationErrorDomain" code:6 userInfo:v28];
      }
      v24 = 0;
    }
    goto LABEL_14;
  }
  if (a7)
  {
    v23 = (void *)MEMORY[0x263F087E8];
    uint64_t v48 = *MEMORY[0x263F08320];
    v49[0] = @"missing evaluation data for PFL";
    v18 = [NSDictionary dictionaryWithObjects:v49 forKeys:&v48 count:1];
    [v23 errorWithDomain:@"com.apple.NLPLearner.NLPShadowEvaluationErrorDomain" code:9 userInfo:v18];
    v24 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_14:

    goto LABEL_15;
  }
  v24 = 0;
LABEL_15:

  return v24;
}

void __83__NLPLearnerNgramShadowEvaluator_evaluateModel_onRecords_options_completion_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = sLog_4;
    if (os_log_type_enabled((os_log_t)sLog_4, OS_LOG_TYPE_ERROR)) {
      __83__NLPLearnerNgramShadowEvaluator_evaluateModel_onRecords_options_completion_error___block_invoke_cold_1(v7);
    }
    *a4 = 1;
  }
  id v8 = v6;
  uint64_t v9 = [v8 bytes];
  unint64_t v10 = [v8 length];
  unint64_t v11 = (v10 >> 2) - 1;
  if (v11 >= 2)
  {
    for (uint64_t i = 1; i != v11; ++i)
    {
      LMLanguageModelCreatePredictionEnumerator();
      if (LMPredictionEnumeratorAdvance())
      {
        uint64_t v13 = -1;
        do
        {
          if (++v13 >= (unint64_t)[*(id *)(a1 + 32) topK]) {
            break;
          }
          LMPredictionEnumeratorGetPrediction();
          if (!*(_DWORD *)(v9 + 4 * i))
          {
            *(float *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(float *)(*(void *)(*(void *)(a1 + 40)
                                                                                              + 8)
                                                                                  + 24)
                                                                       + 1.0;
            break;
          }
        }
        while ((LMPredictionEnumeratorAdvance() & 1) != 0);
      }
      LMPredictionEnumeratorRelease();
    }
  }
  if (v10 > 0xB) {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = (v10 >> 2)
  }
                                                                + *(void *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24)
                                                                - 2;
}

void __83__NLPLearnerNgramShadowEvaluator_evaluateModel_onRecords_options_completion_error___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_234530000, log, OS_LOG_TYPE_ERROR, "something went wrong", v1, 2u);
}

@end