@interface PMLLogRegTrainingPlan
+ (id)planWithStore:(id)a3 tracker:(id)a4 sessionDescriptor:(id)a5 arguments:(id)a6;
- (BOOL)intercept;
- (BOOL)isMultiLabel;
- (BOOL)reportScale;
- (BOOL)useOnlyAppleInternalSessions;
- (NSString)description;
- (NSString)planId;
- (PMLLogRegTrackerProtocol)tracker;
- (PMLLogRegTrainingPlan)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5;
- (PMLLogRegTrainingPlan)initWithStore:(id)a3 tracker:(id)a4 noiseStrategy:(id)a5 planId:(id)a6 sessionDescriptor:(id)a7 maxSessionsLimit:(unint64_t)a8 sessionsInBatch:(unint64_t)a9 currentServerIteration:(unint64_t)a10 currentModelWeights:(id)a11 localLearningRate:(float)a12 stoppingThreshold:(float)a13 localMinimumIterations:(unint64_t)a14 localGradientIterations:(unint64_t)a15 useOnlyAppleInternalSessions:(BOOL)a16 skew:(double)a17 threshold:(double)a18 isMultiLabel:(BOOL)a19 intercept:(BOOL)a20 positiveLabel:(unint64_t)a21 evaluationLevel:(unint64_t)a22 reportScale:(BOOL)a23;
- (PMLModelWeights)currentModelWeights;
- (PMLSessionDescriptor)sessionDescriptor;
- (PMLTrainingStore)store;
- (float)localLearningRate;
- (float)stoppingThreshold;
- (id)evaluationMetricsForPredictions:(id)a3 objectives:(id)a4 predicate:(id)a5 start:(id)a6;
- (id)normalizeRegressor:(id)a3;
- (id)runWithError:(id *)a3;
- (id)toPlistWithChunks:(id)a3;
- (unint64_t)currentServerIteration;
- (unint64_t)evaluationLevel;
- (unint64_t)localGradientIterations;
- (unint64_t)localMinimumIterations;
- (unint64_t)maxSessionsLimit;
- (unint64_t)positiveLabel;
- (void)loadSessionsWithBlock:(id)a3;
@end

@implementation PMLLogRegTrainingPlan

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_planId, 0);
  objc_storeStrong((id *)&self->_currentModelWeights, 0);
  objc_storeStrong((id *)&self->_sessionDescriptor, 0);
  objc_storeStrong((id *)&self->_noiseStrategy, 0);
  objc_storeStrong((id *)&self->_tracker, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

- (BOOL)reportScale
{
  return self->_reportScale;
}

- (unint64_t)evaluationLevel
{
  return self->_evaluationLevel;
}

- (BOOL)intercept
{
  return self->_intercept;
}

- (unint64_t)positiveLabel
{
  return self->_positiveLabel;
}

- (BOOL)isMultiLabel
{
  return self->_isMultiLabel;
}

- (BOOL)useOnlyAppleInternalSessions
{
  return self->_useOnlyAppleInternalSessions;
}

- (unint64_t)localGradientIterations
{
  return self->_localGradientIterations;
}

- (unint64_t)localMinimumIterations
{
  return self->_localMinimumIterations;
}

- (float)stoppingThreshold
{
  return self->_stoppingThreshold;
}

- (float)localLearningRate
{
  return self->_localLearningRate;
}

- (PMLModelWeights)currentModelWeights
{
  return self->_currentModelWeights;
}

- (unint64_t)maxSessionsLimit
{
  return self->_maxSessionsLimit;
}

- (PMLSessionDescriptor)sessionDescriptor
{
  return self->_sessionDescriptor;
}

- (unint64_t)currentServerIteration
{
  return self->_currentServerIteration;
}

- (PMLLogRegTrackerProtocol)tracker
{
  return self->_tracker;
}

- (PMLTrainingStore)store
{
  return self->_store;
}

- (NSString)planId
{
  return self->_planId;
}

- (PMLLogRegTrainingPlan)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5
{
  v91[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v88 = a4;
  id v9 = a5;
  v10 = [v9 objectForKeyedSubscript:@"TRAINING_STORE"];

  if (!v10)
  {
    v52 = [MEMORY[0x263F08690] currentHandler];
    v53 = (objc_class *)objc_opt_class();
    v54 = NSStringFromClass(v53);
    [v52 handleFailureInMethod:a2, self, @"PMLLogRegTrainingPlan.m", 369, @"Can't instantiate %@. Missing \"store\" dependency.", v54 object file lineNumber description];
  }
  v86 = [v8 objectForKeyedSubscript:@"PLAN_ID"];
  v11 = [PMLSessionDescriptor alloc];
  v12 = [v8 objectForKeyedSubscript:@"SESSIONS_MODEL_HANDLE"];
  v13 = [(PMLSessionDescriptor *)v11 initWithPlist:v12 chunks:v88 context:v9];

  if (v13)
  {
    v14 = [v8 objectForKeyedSubscript:@"NOISE_STRATEGY_TYPE"];
    if (([MEMORY[0x263F61E28] isInternalBuild] & 1) == 0
      && ([MEMORY[0x263F61E28] isBetaBuild] & 1) == 0
      && [@"PMLNoNoiseStrategy" isEqualToString:v14])
    {

      v14 = @"PMLDiffPrivacyNoiseStrategy";
    }
    if ([@"PMLSeparatedDPNoiseStrategy" isEqualToString:v14])
    {
      v15 = (void *)[v9 mutableCopy];
      v16 = [(PMLSessionDescriptor *)v13 name];
      v17 = +[PMLSeparatedDPNoiseStrategy getPFLIdentifier:v16];
      [v15 setObject:v17 forKey:@"PFL_ID"];

      id v9 = v15;
    }
    v18 = [v9 objectForKeyedSubscript:@"PLUGIN_SHOULD_ADD_NOISE_AND_ENCRYPT_RESULT"];
    v19 = v18;
    if (v18 && ([v18 BOOLValue] & 1) == 0)
    {
      v20 = PML_LogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2212A0000, v20, OS_LOG_TYPE_DEFAULT, "PMLLogRegTrainingPlan running with no noise strategy since pluginShouldAddNoiseAndEncryptResult set to false", buf, 2u);
      }

      v14 = @"PMLNoNoiseStrategy";
    }
    id v21 = objc_alloc(NSClassFromString(&v14->isa));
    v22 = [v8 objectForKeyedSubscript:@"NOISE_STRATEGY"];
    uint64_t v23 = [v21 initWithPlist:v22 chunks:v88 context:v9];

    v24 = (void *)v23;
    if (v23)
    {
      v85 = (void *)v23;
      v25 = [PMLModelWeights alloc];
      v26 = [v8 objectForKeyedSubscript:@"WEIGHTS"];
      uint64_t v27 = [(PMLModelWeights *)v25 initWithPlist:v26 chunks:v88 context:v9];

      v28 = (void *)v27;
      if (v27)
      {
        v83 = v13;
        v84 = (void *)v27;
        v81 = v19;
        v82 = v14;
        v29 = [v8 objectForKeyedSubscript:@"TRACKER_TYPE"];
        v30 = NSClassFromString(v29);
        if (!v30)
        {
          v55 = [MEMORY[0x263F08690] currentHandler];
          v56 = (objc_class *)objc_opt_class();
          v57 = NSStringFromClass(v56);
          [v55 handleFailureInMethod:a2, self, @"PMLLogRegTrainingPlan.m", 407, @"Can't instantiate %@. Unknown tracker class: %@", v57, v29 object file lineNumber description];
        }
        id v31 = [v30 alloc];
        v32 = [v8 objectForKeyedSubscript:@"TRACKER"];
        v90 = @"planId";
        v91[0] = v86;
        v33 = [NSDictionary dictionaryWithObjects:v91 forKeys:&v90 count:1];
        v77 = (void *)[v31 initWithPlist:v32 chunks:v88 context:v33];

        v75 = [v9 objectForKeyedSubscript:@"TRAINING_STORE"];
        v80 = [v8 objectForKeyedSubscript:@"SESSIONS_LIMIT"];
        uint64_t v73 = [v80 unsignedIntegerValue];
        v79 = [v8 objectForKeyedSubscript:@"SESSIONS_IN_BATCH"];
        uint64_t v71 = [v79 unsignedIntegerValue];
        v78 = [v8 objectForKeyedSubscript:@"SERVER_ITERATION"];
        uint64_t v69 = [v78 unsignedIntegerValue];
        v76 = [v8 objectForKeyedSubscript:@"LEARNING_RATE"];
        [v76 floatValue];
        int v35 = v34;
        v74 = [v8 objectForKeyedSubscript:@"STOPPING_THRESHOLD"];
        [v74 floatValue];
        int v37 = v36;
        v72 = [v8 objectForKeyedSubscript:@"MIN_ITERATIONS"];
        uint64_t v64 = [v72 unsignedIntegerValue];
        v70 = [v8 objectForKeyedSubscript:@"GRADIENT_ITERATIONS"];
        uint64_t v63 = [v70 unsignedIntegerValue];
        v68 = [v8 objectForKeyedSubscript:@"ONLY_INTERNAL_SESSIONS"];
        char v61 = [v68 BOOLValue];
        v67 = [v8 objectForKeyedSubscript:@"SKEW"];
        [v67 doubleValue];
        double v39 = v38;
        v65 = [v8 objectForKeyedSubscript:@"THRESHOLD"];
        [v65 doubleValue];
        double v41 = v40;
        v62 = [v8 objectForKeyedSubscript:@"IS_MULTI_LABEL"];
        HIDWORD(v59) = [v62 BOOLValue];
        v60 = [v8 objectForKeyedSubscript:@"INTERCEPT"];
        char v42 = [v60 BOOLValue];
        [v8 objectForKeyedSubscript:@"POSITIVE_LABEL"];
        v43 = v66 = v29;
        uint64_t v44 = [v43 unsignedIntegerValue];
        v45 = [v8 objectForKeyedSubscript:@"EVALUATION_LEVEL"];
        uint64_t v46 = [v45 unsignedIntegerValue];
        v47 = [v8 objectForKeyedSubscript:@"REPORT_SCALE"];
        LOBYTE(v59) = [v47 BOOLValue];
        BYTE2(v58) = v42;
        BYTE1(v58) = BYTE4(v59);
        LOBYTE(v58) = v61;
        LODWORD(v48) = v35;
        LODWORD(v49) = v37;
        v24 = v85;
        v50 = objc_retain(-[PMLLogRegTrainingPlan initWithStore:tracker:noiseStrategy:planId:sessionDescriptor:maxSessionsLimit:sessionsInBatch:currentServerIteration:currentModelWeights:localLearningRate:stoppingThreshold:localMinimumIterations:localGradientIterations:useOnlyAppleInternalSessions:skew:threshold:isMultiLabel:intercept:positiveLabel:evaluationLevel:reportScale:](self, "initWithStore:tracker:noiseStrategy:planId:sessionDescriptor:maxSessionsLimit:sessionsInBatch:currentServerIteration:currentModelWeights:localLearningRate:stoppingThreshold:localMinimumIterations:localGradientIterations:useOnlyAppleInternalSessions:skew:threshold:isMultiLabel:intercept:positiveLabel:evaluationLevel:reportScale:", v75, v77, v85, v86, v83, v73, v48, v49, v39, v41, v71, v69, v84,
                  v64,
                  v63,
                  v58,
                  v44,
                  v46,
                  v59));

        v13 = v83;
        v28 = v84;
        self = v50;
        v19 = v81;
        v14 = v82;
      }
      else
      {
        v50 = 0;
        v24 = v85;
      }
    }
    else
    {
      v50 = 0;
    }
  }
  else
  {
    v50 = 0;
  }

  return v50;
}

- (id)toPlistWithChunks:(id)a3
{
  v35[24] = *MEMORY[0x263EF8340];
  planId = self->_planId;
  v34[0] = @"PLAN_ID";
  v34[1] = @"IS_SYNCHRONOUS";
  v35[0] = planId;
  v35[1] = MEMORY[0x263EFFA88];
  v34[2] = @"SESSIONS_MODEL_HANDLE";
  sessionDescriptor = self->_sessionDescriptor;
  id v6 = a3;
  v33 = [(PMLSessionDescriptor *)sessionDescriptor toPlistWithChunks:v6];
  v35[2] = v33;
  v34[3] = @"SESSIONS_LIMIT";
  v32 = [NSNumber numberWithUnsignedInteger:self->_maxSessionsLimit];
  v35[3] = v32;
  v34[4] = @"SESSIONS_IN_BATCH";
  id v31 = [NSNumber numberWithUnsignedInteger:self->_sessionsInBatch];
  v35[4] = v31;
  v34[5] = @"WEIGHTS";
  v30 = [(PMLModelWeights *)self->_currentModelWeights toPlistWithChunks:v6];
  v35[5] = v30;
  v34[6] = @"LEARNING_RATE";
  *(float *)&double v7 = self->_localLearningRate;
  v29 = [NSNumber numberWithFloat:v7];
  v35[6] = v29;
  v34[7] = @"STOPPING_THRESHOLD";
  *(float *)&double v8 = self->_stoppingThreshold;
  v28 = [NSNumber numberWithFloat:v8];
  v35[7] = v28;
  v34[8] = @"MIN_ITERATIONS";
  uint64_t v27 = [NSNumber numberWithUnsignedInteger:self->_localMinimumIterations];
  v35[8] = v27;
  v34[9] = @"GRADIENT_ITERATIONS";
  v26 = [NSNumber numberWithUnsignedInteger:self->_localGradientIterations];
  v35[9] = v26;
  v34[10] = @"SERVER_ITERATION";
  v25 = [NSNumber numberWithUnsignedInteger:self->_currentServerIteration];
  v35[10] = v25;
  v34[11] = @"IS_MULTI_LABEL";
  v24 = [NSNumber numberWithBool:self->_isMultiLabel];
  v35[11] = v24;
  v34[12] = @"POSITIVE_LABEL";
  uint64_t v23 = [NSNumber numberWithUnsignedInteger:self->_positiveLabel];
  v35[12] = v23;
  v34[13] = @"NOISE_STRATEGY_TYPE";
  id v9 = (objc_class *)objc_opt_class();
  v22 = NSStringFromClass(v9);
  v35[13] = v22;
  v34[14] = @"NOISE_STRATEGY";
  id v21 = [(PMLNoiseStrategy *)self->_noiseStrategy toPlistWithChunks:v6];
  v35[14] = v21;
  v34[15] = @"ONLY_INTERNAL_SESSIONS";
  v10 = [NSNumber numberWithBool:self->_useOnlyAppleInternalSessions];
  v35[15] = v10;
  v34[16] = @"INTERCEPT";
  v11 = [NSNumber numberWithBool:self->_intercept];
  v35[16] = v11;
  v34[17] = @"TRACKER";
  v12 = [(PMLLogRegTrackerProtocol *)self->_tracker toPlistWithChunks:v6];

  v35[17] = v12;
  v34[18] = @"TRACKER_TYPE";
  v13 = (objc_class *)objc_opt_class();
  v14 = NSStringFromClass(v13);
  v35[18] = v14;
  v34[19] = @"SKEW";
  v15 = [NSNumber numberWithDouble:self->_skew];
  v35[19] = v15;
  v34[20] = @"THRESHOLD";
  v16 = [NSNumber numberWithDouble:self->_threshold];
  v35[20] = v16;
  v34[21] = @"EVALUATION_LEVEL";
  v17 = [NSNumber numberWithUnsignedInteger:self->_evaluationLevel];
  v35[21] = v17;
  v34[22] = @"REPORT_SCALE";
  v18 = [NSNumber numberWithBool:self->_reportScale];
  v34[23] = @"BEFORE_NOISE_SCALING";
  v35[22] = v18;
  v35[23] = &unk_26D336248;
  v19 = [NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:24];

  return v19;
}

- (id)runWithError:(id *)a3
{
  v43[2] = *MEMORY[0x263EF8340];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    v5 = [MEMORY[0x263EFF910] date];
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v38 = 0x3032000000;
    double v39 = __Block_byref_object_copy__716;
    double v40 = __Block_byref_object_dispose__717;
    id v41 = 0;
    id v41 = (id)objc_opt_new();
    v34[0] = 0;
    v34[1] = v34;
    v34[2] = 0x2020000000;
    v34[3] = 0;
    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x3032000000;
    id v31 = __Block_byref_object_copy__716;
    v32 = __Block_byref_object_dispose__717;
    id v33 = 0;
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __38__PMLLogRegTrainingPlan_runWithError___block_invoke;
    v23[3] = &unk_26459EA58;
    v23[4] = self;
    v25 = &v28;
    v26 = v34;
    id v6 = v5;
    id v24 = v6;
    p_long long buf = &buf;
    [(PMLLogRegTrainingPlan *)self loadSessionsWithBlock:v23];
    if (a3 && (double v7 = (void *)v29[5]) != 0)
    {
      id v8 = 0;
      *a3 = v7;
    }
    else
    {
      id v9 = +[PMLPlanDescriptor descriptorFromPlanId:self->_planId];
      v35[0] = @"name";
      v10 = [v9 name];
      v36[0] = v10;
      v35[1] = @"version";
      v11 = [v9 version];
      v36[1] = v11;
      v35[2] = @"locale";
      v12 = [v9 locale];
      v36[2] = v12;
      v13 = [NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:3];
      [*(id *)(*((void *)&buf + 1) + 40) setObject:v13 forKeyedSubscript:@"plan"];

      id v8 = *(id *)(*((void *)&buf + 1) + 40);
    }

    _Block_object_dispose(&v28, 8);
    _Block_object_dispose(v34, 8);
    _Block_object_dispose(&buf, 8);

    goto LABEL_8;
  }
  v15 = PML_LogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    id v21 = (objc_class *)objc_opt_class();
    v22 = NSStringFromClass(v21);
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v22;
    _os_log_error_impl(&dword_2212A0000, v15, OS_LOG_TYPE_ERROR, "Attempted to use PMLSeparatedDPNoiseStrategy with non-Fides tracker: %@.", (uint8_t *)&buf, 0xCu);
  }
  if (a3)
  {
    v16 = (void *)MEMORY[0x263F087E8];
    v42[0] = @"PlanClass";
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    v42[1] = @"NoiseStrategy";
    v43[0] = v6;
    v18 = (objc_class *)objc_opt_class();
    v19 = NSStringFromClass(v18);
    v43[1] = v19;
    v20 = [NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:2];
    *a3 = [v16 errorWithDomain:@"ProactiveMLErrorDomain" code:6 userInfo:v20];

    id v8 = (id)MEMORY[0x263EFFA78];
LABEL_8:

    goto LABEL_9;
  }
  id v8 = (id)MEMORY[0x263EFFA78];
LABEL_9:
  return v8;
}

void __38__PMLLogRegTrainingPlan_runWithError___block_invoke(void *a1, void *a2, unsigned char *a3)
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = PML_LogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    double v7 = *(void **)(a1[4] + 32);
    *(float *)long long buf = 5.778e-34;
    uint64_t v69 = v7;
    __int16 v70 = 2048;
    uint64_t v71 = [v5 count];
    _os_log_impl(&dword_2212A0000, v6, OS_LOG_TYPE_INFO, "Training model: %@ (available %lu sessions)", buf, 0x16u);
  }

  if ([v5 count])
  {
    int v8 = [*(id *)(a1[4] + 64) length];
    id v9 = [v5 covariates];
    uint64_t v10 = [v9 numberOfColumns] + *(unsigned __int8 *)(a1[4] + 145);

    if (v10 != v8)
    {
      id v38 = [NSString alloc];
      double v39 = [v5 covariates];
      v15 = (void *)[v38 initWithFormat:@"Cannot train model with covariates of length %tu but model weights of length %d (planid = %@)", objc_msgSend(v39, "numberOfColumns"), objc_msgSend(*(id *)(a1[4] + 64), "length"), *(void *)(a1[4] + 152)];

      double v40 = PML_LogHandle();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
      {
        *(float *)long long buf = 5.7779e-34;
        uint64_t v69 = v15;
        _os_log_fault_impl(&dword_2212A0000, v40, OS_LOG_TYPE_FAULT, "%@", buf, 0xCu);
      }

      id v41 = (void *)MEMORY[0x263F087E8];
      uint64_t v66 = *MEMORY[0x263F08320];
      v67 = v15;
      char v42 = [NSDictionary dictionaryWithObjects:&v67 forKeys:&v66 count:1];
      uint64_t v43 = [v41 errorWithDomain:@"ProactiveMLErrorDomain" code:100 userInfo:v42];
      uint64_t v44 = *(void *)(a1[6] + 8);
      v45 = *(void **)(v44 + 40);
      *(void *)(v44 + 40) = v43;

      *a3 = 1;
      goto LABEL_33;
    }
    *(void *)(*(void *)(a1[7] + 8) + 24) += [v5 count];
    v11 = (void *)[*(id *)(a1[4] + 64) copy];
    uint64_t v12 = a1[4];
    LODWORD(v13) = *(_DWORD *)(v12 + 80);
    LODWORD(v14) = *(_DWORD *)(v12 + 84);
    v15 = +[PMLLogisticRegressionModel solverWithWeights:v11 andIntercept:*(unsigned __int8 *)(v12 + 145) learningRate:*(void *)(v12 + 88) minIterations:v13 stoppingThreshold:v14];

    v65[0] = MEMORY[0x263EF8330];
    v65[1] = 3221225472;
    v65[2] = __38__PMLLogRegTrainingPlan_runWithError___block_invoke_25;
    v65[3] = &unk_26459F720;
    v65[4] = a1[4];
    uint64_t v16 = MEMORY[0x223C7E7E0](v65);
    v17 = [v5 covariates];
    [v15 setCovariates:v17];

    v18 = (void *)a1[4];
    v19 = [v5 outcomes];
    v20 = [v18 normalizeRegressor:v19];
    [v15 setObjective:v20];

    uint64_t v21 = *(void *)(a1[4] + 56);
    v22 = [v5 covariates];
    uint64_t v23 = [v15 batchPredict:v22];

    id v24 = (void *)a1[4];
    v25 = [v5 outcomes];
    v26 = [v25 denseVector];
    v62 = (void *)v23;
    uint64_t v63 = (void *)v16;
    uint64_t v27 = [v24 evaluationMetricsForPredictions:v23 objectives:v26 predicate:v16 start:a1[5]];

    if (v21)
    {
      char v61 = a3;
      uint64_t v28 = [v15 computeAvgGradientWithIterations:*(void *)(a1[4] + 72)];
      v29 = [v28 gradient];
      uint64_t v30 = [v28 loss];
      *(float *)long long buf = 1.0;
      int v31 = [*(id *)(a1[4] + 24) scaleAndAddNoiseToDenseVector:v29 usingNorm:*(unsigned __int8 *)(a1[4] + 144) scaleFactor:buf];
      if (v31)
      {
        uint64_t v32 = a1[4];
        if (*(unsigned char *)(v32 + 144)) {
          float v33 = *(float *)buf;
        }
        else {
          float v33 = 1.0;
        }
        int v34 = *(void **)(v32 + 16);
        int v35 = [v5 minibatchStatsForPositiveLabel:*(void *)(v32 + 128)];
        *(float *)&double v36 = v33;
        int v37 = [v34 trackGradient:v29 scaleFactor:v35 minibatchStats:v27 evaluationMetrics:*(void *)(a1[4] + 56) serverIteration:v36];

        if (v37)
        {
          [*(id *)(*(void *)(a1[8] + 8) + 40) setDictionary:v37];
          if (v30) {
            [*(id *)(*(void *)(a1[8] + 8) + 40) setObject:v30 forKeyedSubscript:@"loss"];
          }
        }
      }
      else
      {
        v54 = PML_LogHandle();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)uint64_t v64 = 0;
          _os_log_error_impl(&dword_2212A0000, v54, OS_LOG_TYPE_ERROR, "scaleAndAddNoiseToDenseVector failed", v64, 2u);
        }

        uint64_t v55 = [MEMORY[0x263F087E8] errorWithDomain:@"ProactiveMLErrorDomain" code:7 userInfo:0];
        uint64_t v56 = *(void *)(a1[6] + 8);
        int v37 = *(void **)(v56 + 40);
        *(void *)(v56 + 40) = v55;
      }

      if (!v31) {
        goto LABEL_32;
      }
    }
    else
    {
      [v15 solve];
      uint64_t v46 = [v15 weights];
      v47 = [v46 asMutableDenseVector];

      *(float *)long long buf = 1.0;
      if (([*(id *)(a1[4] + 24) scaleAndAddNoiseToDenseVector:v47 usingNorm:*(unsigned __int8 *)(a1[4] + 144) scaleFactor:buf] & 1) == 0)
      {
        v57 = PML_LogHandle();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)uint64_t v64 = 0;
          _os_log_error_impl(&dword_2212A0000, v57, OS_LOG_TYPE_ERROR, "scaleAndAddNoiseToDenseVector failed", v64, 2u);
        }

        uint64_t v58 = [MEMORY[0x263F087E8] errorWithDomain:@"ProactiveMLErrorDomain" code:7 userInfo:0];
        uint64_t v59 = *(void *)(a1[6] + 8);
        v60 = *(void **)(v59 + 40);
        *(void *)(v59 + 40) = v58;

        goto LABEL_32;
      }
      char v61 = a3;
      uint64_t v48 = a1[4];
      if (*(unsigned char *)(v48 + 144)) {
        float v49 = *(float *)buf;
      }
      else {
        float v49 = 1.0;
      }
      v50 = *(void **)(v48 + 16);
      v51 = [v5 minibatchStatsForPositiveLabel:*(void *)(v48 + 128)];
      *(float *)&double v52 = v49;
      v53 = [v50 trackWeights:v47 scaleFactor:v51 minibatchStats:v27 evaluationMetrics:v52];

      if (v53) {
        [*(id *)(*(void *)(a1[8] + 8) + 40) setDictionary:v53];
      }
    }
    if (*(void *)(*(void *)(a1[7] + 8) + 24) >= *(void *)(a1[4] + 40)) {
      *char v61 = 1;
    }
LABEL_32:

LABEL_33:
  }
}

BOOL __38__PMLLogRegTrainingPlan_runWithError___block_invoke_25(uint64_t a1, float a2)
{
  return *(double *)(*(void *)(a1 + 32) + 112) < a2;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = (void *)[v3 initWithFormat:@"<%@ %@>", v5, self->_planId];

  return (NSString *)v6;
}

- (id)normalizeRegressor:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_isMultiLabel)
  {
    id v6 = -[PMLDenseVector initWithCount:]([PMLMutableDenseVector alloc], "initWithCount:", (int)[v4 count]);
    id v7 = v5;
    uint64_t v8 = [v7 values];
    id v9 = v6;
    uint64_t v10 = [(PMLMutableDenseVector *)v9 mutablePtr];
    if ([v7 count])
    {
      unint64_t v11 = 0;
      do
      {
        if (*(float *)(v8 + 4 * v11) == (float)self->_positiveLabel) {
          float v12 = 1.0;
        }
        else {
          float v12 = 0.0;
        }
        *(float *)(v10 + 4 * v11++) = v12;
      }
      while (v11 < (int)[v7 count]);
    }
    id v13 = +[PMLModelRegressor modelRegressorFromFloats:v9];
  }
  else
  {
    id v13 = v4;
  }

  return v13;
}

- (void)loadSessionsWithBlock:(id)a3
{
  store = self->_store;
  sessionDescriptor = self->_sessionDescriptor;
  id v6 = a3;
  +[PMLTrainingStore lastUsedTimestampLimit];
  -[PMLTrainingStore loadSessionsForModel:excludeItemIdsUsedWithin:limit:onlyAppleInternal:positiveLabel:skew:block:](store, "loadSessionsForModel:excludeItemIdsUsedWithin:limit:onlyAppleInternal:positiveLabel:skew:block:", sessionDescriptor, self->_sessionsInBatch, self->_useOnlyAppleInternalSessions, self->_positiveLabel, v6);
}

- (id)evaluationMetricsForPredictions:(id)a3 objectives:(id)a4 predicate:(id)a5 start:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (self->_evaluationLevel)
  {
    +[PMLClassificationEvaluationMetrics f1Score:v11 predictions:v10 predicate:v12];
    +[PMLClassificationEvaluationMetrics roundFloatToSigFigs:sigFigs:](PMLClassificationEvaluationMetrics, "roundFloatToSigFigs:sigFigs:", 3);
    int v16 = v15;
    *(float *)&double v17 = (float)+[PMLClassificationEvaluationMetrics truePositives:v11 predictions:v10 predicate:v12];
    +[PMLClassificationEvaluationMetrics roundFloatToSigFigs:3 sigFigs:v17];
    unint64_t v19 = vcvtas_u32_f32(v18);
    *(float *)&double v20 = (float)+[PMLClassificationEvaluationMetrics trueNegatives:v11 predictions:v10 predicate:v12];
    +[PMLClassificationEvaluationMetrics roundFloatToSigFigs:3 sigFigs:v20];
    unint64_t v22 = vcvtas_u32_f32(v21);
    *(float *)&double v23 = (float)+[PMLClassificationEvaluationMetrics falsePositives:v11 predictions:v10 predicate:v12];
    +[PMLClassificationEvaluationMetrics roundFloatToSigFigs:3 sigFigs:v23];
    unint64_t v25 = vcvtas_u32_f32(v24);
    *(float *)&double v26 = (float)+[PMLClassificationEvaluationMetrics falseNegatives:v11 predictions:v10 predicate:v12];
    +[PMLClassificationEvaluationMetrics roundFloatToSigFigs:3 sigFigs:v26];
    unint64_t v28 = vcvtas_u32_f32(v27);
  }
  else
  {
    unint64_t v19 = 0;
    unint64_t v22 = 0;
    unint64_t v25 = 0;
    unint64_t v28 = 0;
    int v16 = 0;
  }
  LODWORD(v14) = v16;
  v29 = +[AWDProactiveModelFittingEvalMetrics evalMetricsWithRmse:v19 f1:v22 truePositives:v25 trueNegatives:v28 falsePositives:0.0 falseNegatives:v14];
  if (self->_evaluationLevel >= 2) {
    +[PMLClassificationEvaluationMetrics addScoresForOutcomes:v11 predictions:v10 predicate:v12 metrics:v29];
  }
  [v13 timeIntervalSinceNow];
  *(float *)&double v30 = v30;
  *(float *)&double v30 = fabsf(*(float *)&v30);
  +[PMLClassificationEvaluationMetrics roundFloatToSigFigs:3 sigFigs:v30];
  objc_msgSend(v29, "setSecsToExecute:");

  return v29;
}

- (PMLLogRegTrainingPlan)initWithStore:(id)a3 tracker:(id)a4 noiseStrategy:(id)a5 planId:(id)a6 sessionDescriptor:(id)a7 maxSessionsLimit:(unint64_t)a8 sessionsInBatch:(unint64_t)a9 currentServerIteration:(unint64_t)a10 currentModelWeights:(id)a11 localLearningRate:(float)a12 stoppingThreshold:(float)a13 localMinimumIterations:(unint64_t)a14 localGradientIterations:(unint64_t)a15 useOnlyAppleInternalSessions:(BOOL)a16 skew:(double)a17 threshold:(double)a18 isMultiLabel:(BOOL)a19 intercept:(BOOL)a20 positiveLabel:(unint64_t)a21 evaluationLevel:(unint64_t)a22 reportScale:(BOOL)a23
{
  id v34 = a3;
  id v48 = a4;
  id v47 = a5;
  id v35 = a6;
  id v46 = a7;
  id v45 = a11;
  if (!+[PMLPlanDescriptor isValidPlanId:v35])
  {
    uint64_t v43 = [MEMORY[0x263F08690] currentHandler];
    [v43 handleFailureInMethod:a2, self, @"PMLLogRegTrainingPlan.m", 94, @"Invalid planId. Must be <name>-<version>-<locale> but got %@", v35 object file lineNumber description];
  }
  v49.receiver = self;
  v49.super_class = (Class)PMLLogRegTrainingPlan;
  double v36 = [(PMLLogRegTrainingPlan *)&v49 init];
  int v37 = v36;
  if (v36)
  {
    id v42 = v34;
    unint64_t v38 = a9;
    objc_storeStrong((id *)&v36->_store, a3);
    objc_storeStrong((id *)&v37->_tracker, a4);
    objc_storeStrong((id *)&v37->_noiseStrategy, a5);
    objc_storeStrong((id *)&v37->_planId, a6);
    objc_storeStrong((id *)&v37->_sessionDescriptor, a7);
    if (([MEMORY[0x263F61E28] isInternalBuild] & 1) == 0)
    {
      int v39 = [MEMORY[0x263F61E28] isBetaBuild];
      if (a9 <= 1) {
        unint64_t v40 = 1;
      }
      else {
        unint64_t v40 = a9;
      }
      if (!v39) {
        unint64_t v38 = v40;
      }
    }
    v37->_maxSessionsLimit = a8;
    v37->_sessionsInBatch = v38;
    v37->_currentServerIteration = a10;
    objc_storeStrong((id *)&v37->_currentModelWeights, a11);
    v37->_localLearningRate = a12;
    v37->_stoppingThreshold = a13;
    v37->_localMinimumIterations = a14;
    v37->_localGradientIterations = a15;
    v37->_useOnlyAppleInternalSessions = a16;
    v37->_isMultiLabel = a19;
    v37->_skew = a17;
    v37->_threshold = a18;
    v37->_intercept = a20;
    id v34 = v42;
    v37->_positiveLabel = a21;
    v37->_evaluationLevel = a22;
    v37->_reportScale = a23;
  }

  return v37;
}

+ (id)planWithStore:(id)a3 tracker:(id)a4 sessionDescriptor:(id)a5 arguments:(id)a6
{
  id v9 = a6;
  id v57 = a5;
  id v56 = a4;
  id v10 = a3;
  id v11 = [v9 objectForKeyedSubscript:@"noiseStrategy"];
  id v12 = v11;
  if (v11) {
    id v13 = v11;
  }
  else {
    id v13 = (id)objc_opt_new();
  }
  uint64_t v64 = v13;

  uint64_t v14 = [v9 objectForKeyedSubscript:@"planId"];
  int v15 = (void *)v14;
  int v16 = @"FiM_logreg-1.0-en";
  if (v14) {
    int v16 = (__CFString *)v14;
  }
  uint64_t v63 = v16;

  double v17 = [v9 objectForKeyedSubscript:@"serverIteration"];
  if (v17)
  {
    float v18 = [v9 objectForKeyedSubscript:@"serverIteration"];
    uint64_t v62 = [v18 unsignedIntegerValue];
  }
  else
  {
    uint64_t v62 = 0;
  }

  unint64_t v19 = [v9 objectForKeyedSubscript:@"intercept"];
  char v60 = [v19 BOOLValue];

  double v20 = [v9 objectForKeyedSubscript:@"generateWeightsOfLength"];
  uint64_t v21 = [v20 intValue];

  char v61 = +[PMLModelWeights modelWeightsOfLength:v21 rngSeed:1234567];
  unint64_t v22 = [v9 objectForKeyedSubscript:@"localLearningRate"];
  if (v22)
  {
    double v23 = [v9 objectForKeyedSubscript:@"localLearningRate"];
    [v23 floatValue];
    int v25 = v24;
  }
  else
  {
    int v25 = 1017370378;
  }

  double v26 = [v9 objectForKeyedSubscript:@"stoppingThreshold"];
  if (v26)
  {
    float v27 = [v9 objectForKeyedSubscript:@"stoppingThreshold"];
    [v27 floatValue];
    int v29 = v28;
  }
  else
  {
    int v29 = 953267991;
  }

  double v30 = [v9 objectForKeyedSubscript:@"localMinimumIterations"];
  if (v30)
  {
    int v31 = [v9 objectForKeyedSubscript:@"localMinimumIterations"];
    uint64_t v59 = [v31 unsignedIntegerValue];
  }
  else
  {
    uint64_t v59 = 100;
  }

  uint64_t v32 = [v9 objectForKeyedSubscript:@"localGradientIterations"];
  unint64_t v33 = [v32 unsignedIntegerValue];

  id v34 = [v9 objectForKeyedSubscript:@"reportScale"];
  char v58 = [v34 BOOLValue];

  id v35 = [v9 objectForKeyedSubscript:@"useOnlyAppleInternalSessions"];
  char v36 = [v35 BOOLValue];

  int v37 = [v9 objectForKeyedSubscript:@"sessionsInBatch"];
  unint64_t v38 = [v37 integerValue];

  int v39 = [v9 objectForKeyedSubscript:@"maxSessionsLimit"];
  uint64_t v40 = [v39 unsignedIntegerValue];

  id v41 = [v9 objectForKeyedSubscript:@"positiveLabel"];

  if (v41)
  {
    [v9 objectForKeyedSubscript:@"positiveLabel"];
    v43 = unint64_t v42 = v33;
    uint64_t v44 = [v43 unsignedIntegerValue];

    unint64_t v33 = v42;
    uint64_t v45 = v44;
  }
  else
  {
    uint64_t v45 = 1;
  }
  BOOL v46 = v41 != 0;
  if (!v40) {
    uint64_t v40 = 100;
  }
  if (v38 <= 1) {
    uint64_t v47 = 1;
  }
  else {
    uint64_t v47 = v38;
  }
  if (v33 <= 1) {
    uint64_t v48 = 1;
  }
  else {
    uint64_t v48 = v33;
  }
  objc_super v49 = [PMLLogRegTrainingPlan alloc];
  LOBYTE(v55) = v58;
  BYTE2(v54) = v60;
  BYTE1(v54) = v46;
  LOBYTE(v54) = v36;
  LODWORD(v50) = v25;
  LODWORD(v51) = v29;
  double v52 = -[PMLLogRegTrainingPlan initWithStore:tracker:noiseStrategy:planId:sessionDescriptor:maxSessionsLimit:sessionsInBatch:currentServerIteration:currentModelWeights:localLearningRate:stoppingThreshold:localMinimumIterations:localGradientIterations:useOnlyAppleInternalSessions:skew:threshold:isMultiLabel:intercept:positiveLabel:evaluationLevel:reportScale:](v49, "initWithStore:tracker:noiseStrategy:planId:sessionDescriptor:maxSessionsLimit:sessionsInBatch:currentServerIteration:currentModelWeights:localLearningRate:stoppingThreshold:localMinimumIterations:localGradientIterations:useOnlyAppleInternalSessions:skew:threshold:isMultiLabel:intercept:positiveLabel:evaluationLevel:reportScale:", v10, v56, v64, v63, v57, v40, v50, v51, 0.5, 0.5, v47, v62, v61, v59, v48,
          v54,
          v45,
          2,
          v55);

  return v52;
}

@end