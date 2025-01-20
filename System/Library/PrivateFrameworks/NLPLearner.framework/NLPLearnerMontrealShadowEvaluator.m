@interface NLPLearnerMontrealShadowEvaluator
+ (BOOL)isInTopKPredictions:(unint64_t)a3 scores:(float *)a4 total:(unint64_t)a5 topK:(unint64_t)a6;
+ (void)initialize;
- (id)evaluateModel:(MontrealNeuralNetwork *)a3 onData:(id)a4 options:(id)a5 completion:(id)a6;
- (id)evaluateModel:(id)a3 onRecords:(id)a4 options:(id)a5 completion:(id)a6 error:(id *)a7;
- (id)prepareDataFromRecords:(id)a3 modelBundle:(id)a4 error:(id *)a5;
@end

@implementation NLPLearnerMontrealShadowEvaluator

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    sLog_1 = (uint64_t)os_log_create("com.apple.NLPLearner", "NLPLearnerMontrealShadowEvaluator");
    MEMORY[0x270F9A758]();
  }
}

- (id)prepareDataFromRecords:(id)a3 modelBundle:(id)a4 error:(id *)a5
{
  v22[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  int64_t v10 = [(NLPLearnerShadowEvaluator *)self evaluationTask];
  v11 = [(NLPLearnerShadowEvaluator *)self locale];
  v12 = +[NLPLearnerTextData dataForPFL:v10 andLocale:v11];

  if ([(NLPLearnerShadowEvaluator *)self evaluationTask] == 2
    || [(NLPLearnerShadowEvaluator *)self evaluationTask] == 4)
  {
    v13 = @"montrealidmap.dat";
    goto LABEL_4;
  }
  if ([(NLPLearnerShadowEvaluator *)self evaluationTask] == 1)
  {
    v13 = @"emojiClasses.plist";
LABEL_4:
    v14 = +[NLPLearnerUtils getAttachmentURLByName:v13 inDirectory:v9 error:a5];
    if (v14)
    {
      v15 = v14;
      v16 = [v14 path];
      [v12 addResource:v16];

LABEL_6:
      objc_msgSend(v12, "loadFromCoreDuet:limitSamplesTo:", v8, -[NLPLearnerShadowEvaluator maxSamples](self, "maxSamples"));
      id v17 = v12;
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  if ([(NLPLearnerShadowEvaluator *)self evaluationTask] == 3)
  {
    v15 = [v9 absoluteString];
    [v12 addResource:v15];
    goto LABEL_6;
  }
  if (a5)
  {
    v18 = (void *)MEMORY[0x263F087E8];
    uint64_t v21 = *MEMORY[0x263F08320];
    v22[0] = @"unknown evaluation task for PFL";
    v19 = [NSDictionary dictionaryWithObjects:v22 forKeys:&v21 count:1];
    *a5 = [v18 errorWithDomain:@"com.apple.NLPLearner.NLPShadowEvaluationErrorDomain" code:4 userInfo:v19];
  }
LABEL_13:
  id v17 = 0;
LABEL_14:

  return v17;
}

- (id)evaluateModel:(id)a3 onRecords:(id)a4 options:(id)a5 completion:(id)a6 error:(id *)a7
{
  v34[1] = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (v12)
  {
    v16 = [v12 URLByDeletingLastPathComponent];
    id v17 = [(NLPLearnerMontrealShadowEvaluator *)self prepareDataFromRecords:v13 modelBundle:v16 error:a7];

    if (![v17 numSamples])
    {
      if (a7)
      {
        v23 = (void *)MEMORY[0x263F087E8];
        uint64_t v33 = *MEMORY[0x263F08320];
        v34[0] = @"missing evaluation data for PFL";
        v24 = [NSDictionary dictionaryWithObjects:v34 forKeys:&v33 count:1];
        *a7 = [v23 errorWithDomain:@"com.apple.NLPLearner.NLPShadowEvaluationErrorDomain" code:9 userInfo:v24];

        a7 = 0;
      }
      goto LABEL_16;
    }
    uint64_t v31 = *MEMORY[0x263F56640];
    id v32 = v12;
    v18 = [NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
    uint64_t v19 = MRLNeuralNetworkCreate();
    v20 = sLog_1;
    if (v19)
    {
      uint64_t v21 = (const void *)v19;
      if (os_log_type_enabled((os_log_t)sLog_1, OS_LOG_TYPE_DEBUG)) {
        -[NLPLearnerMontrealShadowEvaluator evaluateModel:onRecords:options:completion:error:]((uint64_t)v12, v20);
      }
      a7 = [(NLPLearnerMontrealShadowEvaluator *)self evaluateModel:v21 onData:v17 options:v14 completion:v15];
      CFRelease(v21);
      goto LABEL_15;
    }
    if (os_log_type_enabled((os_log_t)sLog_1, OS_LOG_TYPE_ERROR))
    {
      -[NLPLearnerMontrealShadowEvaluator evaluateModel:onRecords:options:completion:error:]((uint64_t)v12, v20);
      if (!a7) {
        goto LABEL_15;
      }
    }
    else if (!a7)
    {
LABEL_15:

LABEL_16:
      goto LABEL_17;
    }
    v28 = (void *)MEMORY[0x263F087E8];
    uint64_t v29 = *MEMORY[0x263F08320];
    v25 = [NSString stringWithFormat:@"error loading nlmodel: %@", 0];
    v30 = v25;
    v26 = [NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    *a7 = [v28 errorWithDomain:@"com.apple.NLPLearner.NLPShadowEvaluationErrorDomain" code:6 userInfo:v26];

    a7 = 0;
    goto LABEL_15;
  }
  v22 = sLog_1;
  if (os_log_type_enabled((os_log_t)sLog_1, OS_LOG_TYPE_ERROR)) {
    -[NLPLearnerMontrealShadowEvaluator evaluateModel:onRecords:options:completion:error:](v22);
  }
  a7 = 0;
LABEL_17:

  return a7;
}

+ (BOOL)isInTopKPredictions:(unint64_t)a3 scores:(float *)a4 total:(unint64_t)a5 topK:(unint64_t)a6
{
  v18[1] = *MEMORY[0x263EF8340];
  if (a6 >= a5) {
    return 1;
  }
  v6 = (void *)((char *)v18 - ((8 * a6 + 15) & 0xFFFFFFFFFFFFFFF0));
  float v7 = *a4;
  if (a6)
  {
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    do
    {
      v6[v8] = v8;
      if (a4[v8] < v7)
      {
        uint64_t v9 = v8;
        float v7 = a4[v8];
      }
      ++v8;
    }
    while (a6 != v8);
  }
  else
  {
    uint64_t v9 = 0;
  }
  unint64_t v11 = a6;
  while (2)
  {
    unint64_t v12 = v11;
    float v13 = v7;
    while (1)
    {
      float v7 = a4[v12];
      if (v7 <= v13)
      {
        float v7 = v13;
        goto LABEL_21;
      }
      v6[v9] = v12;
      if (a6) {
        break;
      }
      ++v12;
      float v13 = v7;
      if (a5 == v12) {
        return 0;
      }
    }
    for (uint64_t i = 0; i != a6; ++i)
    {
      if (a4[v6[i]] < v7)
      {
        uint64_t v9 = i;
        float v7 = a4[v6[i]];
      }
    }
LABEL_21:
    unint64_t v11 = v12 + 1;
    if (a5 - 1 != v12) {
      continue;
    }
    break;
  }
  if (!a6) {
    return 0;
  }
  if (*v6 == a3) {
    return 1;
  }
  uint64_t v15 = 1;
  do
  {
    unint64_t v16 = v15;
    if (a6 == v15) {
      break;
    }
    uint64_t v17 = v6[v15++];
  }
  while (v17 != a3);
  return v16 < a6;
}

- (id)evaluateModel:(MontrealNeuralNetwork *)a3 onData:(id)a4 options:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (a3)
  {
    unint64_t v13 = 0x263F08000;
    if ([(NLPLearnerShadowEvaluator *)self evaluationTask] == 4)
    {
      id v14 = [MEMORY[0x263EFF9A0] dictionary];
      uint64_t v15 = [v10 nextEvaluationDataPoint];
      if (v15)
      {
        unint64_t v16 = (void *)v15;
        v36 = v14;
        id v37 = v12;
        id v38 = v11;
        unint64_t v17 = 0;
        uint64_t v40 = *MEMORY[0x263F56630];
        uint64_t v39 = *MEMORY[0x263F56638];
        float v18 = 0.0;
        v41 = v10;
        do
        {
          uint64_t v19 = [v16 objectForKey:v40];
          v20 = [v16 objectForKey:v39];
          uint64_t v21 = [v20 count];
          id v42 = v19;
          [v42 bytes];
          MRLNeuralNetworkSetInput();
          MRLNeuralNetworkPredict();
          uint64_t Output = MRLNeuralNetworkGetOutput();
          uint64_t OutputDimension = MRLNeuralNetworkGetOutputDimension();
          uint64_t v24 = v21 - 1;
          unint64_t v43 = v17;
          if (v21 != 1)
          {
            uint64_t v25 = OutputDimension;
            uint64_t v26 = 0;
            uint64_t v27 = 4 * OutputDimension;
            do
            {
              v28 = [v20 objectAtIndexedSubscript:v26];
              uint64_t v29 = [v28 unsignedIntegerValue];

              if (v29 != 3
                && objc_msgSend((id)objc_opt_class(), "isInTopKPredictions:scores:total:topK:", v29, Output, v25, -[NLPLearnerShadowEvaluator topK](self, "topK")))
              {
                float v18 = v18 + 1.0;
              }
              ++v26;
              Output += v27;
            }
            while (v24 != v26);
          }
          unint64_t v17 = v24 + v43;

          id v10 = v41;
          uint64_t v30 = [v41 nextEvaluationDataPoint];

          unint64_t v16 = (void *)v30;
        }
        while (v30);
        if (v17) {
          *(float *)&double v31 = (float)(v18 * 100.0) / (float)v17;
        }
        else {
          double v31 = 0.0;
        }
        id v12 = v37;
        id v11 = v38;
        unint64_t v13 = 0x263F08000uLL;
        id v14 = v36;
      }
      else
      {
        double v31 = 0.0;
      }
      uint64_t v33 = [*(id *)(v13 + 2584) numberWithFloat:v31];
      [v14 setObject:v33 forKeyedSubscript:@"MLPModelTrainerOverallAccuracyKey"];
    }
    else
    {
      id v45 = v12;
      id v44 = v10;
      id v32 = (void *)MRLNeuralNetworkCopyEvaluationResults();
      id v14 = (void *)[v32 mutableCopy];
    }
    v34 = objc_msgSend(*(id *)(v13 + 2584), "numberWithUnsignedInteger:", objc_msgSend(v10, "numSamples"));
    [v14 setObject:v34 forKeyedSubscript:@"Samples"];
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

void *__77__NLPLearnerMontrealShadowEvaluator_evaluateModel_onData_options_completion___block_invoke(uint64_t a1, unsigned char *a2)
{
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4 && (*(unsigned int (**)(void))(v4 + 16))())
  {
    v5 = sLog_1;
    if (os_log_type_enabled((os_log_t)sLog_1, OS_LOG_TYPE_ERROR)) {
      __77__NLPLearnerMontrealShadowEvaluator_evaluateModel_onData_options_completion___block_invoke_cold_1(v5);
    }
    v6 = 0;
    *a2 = 1;
  }
  else
  {
    float v7 = [*(id *)(a1 + 32) nextEvaluationDataPoint];
    v6 = v7;
    if (v7) {
      id v8 = v7;
    }
    else {
      *a2 = 1;
    }
  }
  return v6;
}

- (void)evaluateModel:(os_log_t)log onRecords:options:completion:error:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_234530000, log, OS_LOG_TYPE_ERROR, "missing model path for evaluation", v1, 2u);
}

- (void)evaluateModel:(uint64_t)a1 onRecords:(NSObject *)a2 options:completion:error:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_234530000, a2, OS_LOG_TYPE_ERROR, "error loading nlmodel %@", (uint8_t *)&v2, 0xCu);
}

- (void)evaluateModel:(uint64_t)a1 onRecords:(NSObject *)a2 options:completion:error:.cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_234530000, a2, OS_LOG_TYPE_DEBUG, "running evaluation for %@", (uint8_t *)&v2, 0xCu);
}

void __77__NLPLearnerMontrealShadowEvaluator_evaluateModel_onData_options_completion___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_234530000, log, OS_LOG_TYPE_ERROR, "evaluation interrupted by request to defer", v1, 2u);
}

@end