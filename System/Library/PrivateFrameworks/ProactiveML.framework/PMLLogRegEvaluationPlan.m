@interface PMLLogRegEvaluationPlan
- (NSString)description;
- (NSString)planId;
- (PMLEvaluationTrackerProtocol)tracker;
- (PMLLogRegEvaluationPlan)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5;
- (PMLLogRegEvaluationPlan)initWithStore:(id)a3 tracker:(id)a4 planId:(id)a5 sessionDescriptor:(id)a6 maxSessionsLimit:(unint64_t)a7 sessionsInBatch:(unint64_t)a8 currentModelWeights:(id)a9 intercept:(BOOL)a10 skew:(double)a11 threshold:(double)a12 isMultiLabel:(BOOL)a13 positiveLabel:(unint64_t)a14 evaluationLevel:(unint64_t)a15;
- (PMLModelWeights)currentModelWeights;
- (PMLSessionDescriptor)sessionDescriptor;
- (PMLTrainingStore)store;
- (id)normalizeRegressor:(id)a3;
- (id)runWithError:(id *)a3;
- (id)toPlistWithChunks:(id)a3;
- (unint64_t)maxSessionsLimit;
- (void)loadSessionsWithBlock:(id)a3;
@end

@implementation PMLLogRegEvaluationPlan

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_planId, 0);
  objc_storeStrong((id *)&self->_currentModelWeights, 0);
  objc_storeStrong((id *)&self->_sessionDescriptor, 0);
  objc_storeStrong((id *)&self->_tracker, 0);
  objc_storeStrong((id *)&self->_store, 0);
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

- (PMLEvaluationTrackerProtocol)tracker
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

- (PMLLogRegEvaluationPlan)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5
{
  v64[1] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [v11 objectForKeyedSubscript:@"TRAINING_STORE"];

  if (!v12)
  {
    v42 = [MEMORY[0x263F08690] currentHandler];
    v43 = (objc_class *)objc_opt_class();
    v44 = NSStringFromClass(v43);
    [v42 handleFailureInMethod:a2, self, @"PMLLogRegEvaluationPlan.m", 182, @"Can't instantiate %@. Missing \"store\" dependency.", v44 object file lineNumber description];
  }
  v13 = [v9 objectForKeyedSubscript:@"PLAN_ID"];
  v14 = [PMLSessionDescriptor alloc];
  v15 = [v9 objectForKeyedSubscript:@"SESSIONS_MODEL_HANDLE"];
  v16 = [(PMLSessionDescriptor *)v14 initWithPlist:v15 chunks:v10 context:v11];

  if (v16)
  {
    v17 = [PMLModelWeights alloc];
    v18 = [v9 objectForKeyedSubscript:@"WEIGHTS"];
    v19 = [(PMLModelWeights *)v17 initWithPlist:v18 chunks:v10 context:v11];

    if (v19)
    {
      v62 = self;
      v61 = [v9 objectForKeyedSubscript:@"TRACKER_TYPE"];
      v20 = NSClassFromString(v61);
      v57 = v19;
      if (!v20)
      {
        v45 = [MEMORY[0x263F08690] currentHandler];
        v46 = (objc_class *)objc_opt_class();
        v47 = NSStringFromClass(v46);
        [v45 handleFailureInMethod:a2, v62, @"PMLLogRegEvaluationPlan.m", 196, @"Can't instantiate %@. Unknown tracker class: %@", v47, v61 object file lineNumber description];
      }
      id v21 = [v20 alloc];
      v22 = [v9 objectForKeyedSubscript:@"TRACKER"];
      v63 = @"planId";
      v64[0] = v13;
      v23 = [NSDictionary dictionaryWithObjects:v64 forKeys:&v63 count:1];
      v24 = (void *)[v21 initWithPlist:v22 chunks:v10 context:v23];

      v25 = [v11 objectForKeyedSubscript:@"tracker"];

      v59 = v13;
      id v60 = v10;
      v58 = v16;
      if (v25)
      {
        uint64_t v26 = [v11 objectForKeyedSubscript:@"tracker"];

        v27 = v11;
        v28 = (void *)v26;
      }
      else
      {
        v27 = v11;
        v28 = v24;
      }
      v56 = v27;
      v49 = [v27 objectForKeyedSubscript:@"TRAINING_STORE"];
      v55 = [v9 objectForKeyedSubscript:@"SESSIONS_LIMIT"];
      uint64_t v52 = [v55 unsignedIntegerValue];
      v54 = [v9 objectForKeyedSubscript:@"SESSIONS_IN_BATCH"];
      uint64_t v50 = [v54 unsignedIntegerValue];
      v53 = [v9 objectForKeyedSubscript:@"INTERCEPT"];
      char v30 = [v53 BOOLValue];
      v51 = [v9 objectForKeyedSubscript:@"SKEW"];
      [v51 doubleValue];
      double v32 = v31;
      v33 = [v9 objectForKeyedSubscript:@"THRESHOLD"];
      [v33 doubleValue];
      double v35 = v34;
      v36 = [v9 objectForKeyedSubscript:@"IS_MULTI_LABEL"];
      char v37 = [v36 BOOLValue];
      v38 = [v9 objectForKeyedSubscript:@"POSITIVE_LABEL"];
      uint64_t v39 = [v38 unsignedIntegerValue];
      v40 = [v9 objectForKeyedSubscript:@"EVALUATION_LEVEL"];
      BYTE1(v48) = v37;
      LOBYTE(v48) = v30;
      v19 = v57;
      self = -[PMLLogRegEvaluationPlan initWithStore:tracker:planId:sessionDescriptor:maxSessionsLimit:sessionsInBatch:currentModelWeights:intercept:skew:threshold:isMultiLabel:positiveLabel:evaluationLevel:](v62, "initWithStore:tracker:planId:sessionDescriptor:maxSessionsLimit:sessionsInBatch:currentModelWeights:intercept:skew:threshold:isMultiLabel:positiveLabel:evaluationLevel:", v49, v28, v59, v58, v52, v50, v32, v35, v57, v48, v39, [v40 unsignedIntegerValue]);

      v13 = v59;
      v16 = v58;

      v29 = self;
      id v10 = v60;
      id v11 = v56;
    }
    else
    {
      v29 = 0;
    }
  }
  else
  {
    v29 = 0;
  }

  return v29;
}

- (id)toPlistWithChunks:(id)a3
{
  v22[13] = *MEMORY[0x263EF8340];
  v22[0] = self->_planId;
  v21[0] = @"PLAN_ID";
  v21[1] = @"SESSIONS_MODEL_HANDLE";
  sessionDescriptor = self->_sessionDescriptor;
  id v5 = a3;
  v20 = [(PMLSessionDescriptor *)sessionDescriptor toPlistWithChunks:v5];
  v22[1] = v20;
  v21[2] = @"SESSIONS_LIMIT";
  v19 = [NSNumber numberWithUnsignedInteger:self->_maxSessionsLimit];
  v22[2] = v19;
  v21[3] = @"SESSIONS_IN_BATCH";
  v18 = [NSNumber numberWithUnsignedInteger:self->_sessionsInBatch];
  v22[3] = v18;
  v21[4] = @"WEIGHTS";
  v6 = [(PMLModelWeights *)self->_currentModelWeights toPlistWithChunks:v5];
  v22[4] = v6;
  v21[5] = @"INTERCEPT";
  v7 = [NSNumber numberWithBool:self->_intercept];
  v22[5] = v7;
  v21[6] = @"IS_MULTI_LABEL";
  v8 = [NSNumber numberWithBool:self->_isMultiLabel];
  v22[6] = v8;
  v21[7] = @"POSITIVE_LABEL";
  id v9 = [NSNumber numberWithUnsignedInteger:self->_positiveLabel];
  v22[7] = v9;
  v21[8] = @"SKEW";
  id v10 = [NSNumber numberWithDouble:self->_skew];
  v22[8] = v10;
  v21[9] = @"TRACKER";
  id v11 = [(PMLEvaluationTrackerProtocol *)self->_tracker toPlistWithChunks:v5];

  v22[9] = v11;
  v21[10] = @"THRESHOLD";
  v12 = [NSNumber numberWithDouble:self->_threshold];
  v22[10] = v12;
  v21[11] = @"TRACKER_TYPE";
  v13 = (objc_class *)objc_opt_class();
  v14 = NSStringFromClass(v13);
  v22[11] = v14;
  v21[12] = @"EVALUATION_LEVEL";
  v15 = [NSNumber numberWithUnsignedInteger:self->_evaluationLevel];
  v22[12] = v15;
  v16 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:13];

  return v16;
}

- (id)runWithError:(id *)a3
{
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  v12[3] = 0;
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__5932;
  id v10 = __Block_byref_object_dispose__5933;
  id v11 = 0;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __40__PMLLogRegEvaluationPlan_runWithError___block_invoke;
  v5[3] = &unk_26459F748;
  v5[4] = self;
  v5[5] = &v6;
  v5[6] = v12;
  [(PMLLogRegEvaluationPlan *)self loadSessionsWithBlock:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  _Block_object_dispose(v12, 8);
  return v3;
}

void __40__PMLLogRegEvaluationPlan_runWithError___block_invoke(void *a1, void *a2, unsigned char *a3)
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  id v5 = a2;
  uint64_t v6 = PML_LogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = a1[4];
    uint64_t v8 = *(void *)(v7 + 104);
    uint64_t v9 = *(void *)(v7 + 24);
    *(_DWORD *)buf = 138412802;
    uint64_t v63 = v8;
    __int16 v64 = 2112;
    uint64_t v65 = v9;
    __int16 v66 = 2048;
    uint64_t v67 = [v5 count];
    _os_log_impl(&dword_2212A0000, v6, OS_LOG_TYPE_INFO, "Evaluating plan %@ (descriptor: %@, available %lu sessions)", buf, 0x20u);
  }

  if ([v5 count])
  {
    v58 = a3;
    id v10 = +[PMLLogisticRegressionModel solverWithWeights:*(void *)(a1[4] + 48) andIntercept:*(unsigned __int8 *)(a1[4] + 56)];
    id v11 = [v5 covariates];
    [v10 setCovariates:v11];

    v12 = (void *)a1[4];
    v13 = [v5 outcomes];
    v14 = [v12 normalizeRegressor:v13];
    [v10 setObjective:v14];

    v15 = [v5 covariates];
    id v60 = v10;
    v16 = [v10 batchPredict:v15];

    v61[0] = MEMORY[0x263EF8330];
    v61[1] = 3221225472;
    v61[2] = __40__PMLLogRegEvaluationPlan_runWithError___block_invoke_13;
    v61[3] = &unk_26459F720;
    v61[4] = a1[4];
    v17 = (void *)MEMORY[0x223C7E7E0](v61);
    v18 = [v5 outcomes];
    [v18 denseVector];
    v19 = v59 = a1;
    +[PMLClassificationEvaluationMetrics f1Score:v19 predictions:v16 predicate:v17];
    int v21 = v20;

    LODWORD(v22) = v21;
    +[PMLClassificationEvaluationMetrics roundFloatToSigFigs:3 sigFigs:v22];
    int v24 = v23;
    v25 = [v5 outcomes];
    uint64_t v26 = [v25 denseVector];
    unint64_t v27 = +[PMLClassificationEvaluationMetrics truePositives:v26 predictions:v16 predicate:v17];

    *(float *)&double v28 = (float)v27;
    +[PMLClassificationEvaluationMetrics roundFloatToSigFigs:3 sigFigs:v28];
    unint64_t v30 = vcvtas_u32_f32(v29);
    double v31 = [v5 outcomes];
    double v32 = [v31 denseVector];
    unint64_t v33 = +[PMLClassificationEvaluationMetrics trueNegatives:v32 predictions:v16 predicate:v17];

    *(float *)&double v34 = (float)v33;
    +[PMLClassificationEvaluationMetrics roundFloatToSigFigs:3 sigFigs:v34];
    unint64_t v36 = vcvtas_u32_f32(v35);
    char v37 = [v5 outcomes];
    v38 = [v37 denseVector];
    unint64_t v39 = +[PMLClassificationEvaluationMetrics falsePositives:v38 predictions:v16 predicate:v17];

    *(float *)&double v40 = (float)v39;
    +[PMLClassificationEvaluationMetrics roundFloatToSigFigs:3 sigFigs:v40];
    unint64_t v42 = vcvtas_u32_f32(v41);
    v43 = [v5 outcomes];
    v44 = [v43 denseVector];
    unint64_t v45 = +[PMLClassificationEvaluationMetrics falseNegatives:v44 predictions:v16 predicate:v17];

    *(float *)&double v46 = (float)v45;
    +[PMLClassificationEvaluationMetrics roundFloatToSigFigs:3 sigFigs:v46];
    LODWORD(v48) = v24;
    v49 = +[AWDProactiveModelFittingEvalMetrics evalMetricsWithRmse:v30 f1:v36 truePositives:v42 trueNegatives:vcvtas_u32_f32(v47) falsePositives:0.0 falseNegatives:v48];
    uint64_t v50 = (void *)v59[4];
    if (v50[12] >= 2uLL)
    {
      v51 = [v5 outcomes];
      uint64_t v52 = [v51 denseVector];
      +[PMLClassificationEvaluationMetrics addScoresForOutcomes:v52 predictions:v16 predicate:v17 metrics:v49];

      uint64_t v50 = (void *)v59[4];
    }
    v53 = (void *)v50[2];
    v54 = [v5 minibatchStatsForPositiveLabel:v50[10]];
    uint64_t v55 = [v53 trackEvaluationMetrics:v49 minibatchStats:v54];
    uint64_t v56 = *(void *)(v59[5] + 8);
    v57 = *(void **)(v56 + 40);
    *(void *)(v56 + 40) = v55;

    *(void *)(*(void *)(v59[6] + 8) + 24) += [v5 count];
    if (*(void *)(*(void *)(v59[6] + 8) + 24) >= *(void *)(v59[4] + 32)) {
      unsigned char *v58 = 1;
    }
  }
}

BOOL __40__PMLLogRegEvaluationPlan_runWithError___block_invoke_13(uint64_t a1, float a2)
{
  return *(double *)(*(void *)(a1 + 32) + 88) < a2;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = (void *)[v3 initWithFormat:@"<%@ %@>", v5, self->_planId];

  return (NSString *)v6;
}

- (id)normalizeRegressor:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_isMultiLabel)
  {
    uint64_t v6 = -[PMLDenseVector initWithCount:]([PMLMutableDenseVector alloc], "initWithCount:", (int)[v4 count]);
    id v7 = v5;
    uint64_t v8 = [v7 values];
    uint64_t v9 = v6;
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
  -[PMLTrainingStore loadSessionsForModel:excludeItemIdsUsedWithin:limit:onlyAppleInternal:positiveLabel:skew:block:](store, "loadSessionsForModel:excludeItemIdsUsedWithin:limit:onlyAppleInternal:positiveLabel:skew:block:", sessionDescriptor, self->_sessionsInBatch, 0, self->_positiveLabel, v6);
}

- (PMLLogRegEvaluationPlan)initWithStore:(id)a3 tracker:(id)a4 planId:(id)a5 sessionDescriptor:(id)a6 maxSessionsLimit:(unint64_t)a7 sessionsInBatch:(unint64_t)a8 currentModelWeights:(id)a9 intercept:(BOOL)a10 skew:(double)a11 threshold:(double)a12 isMultiLabel:(BOOL)a13 positiveLabel:(unint64_t)a14 evaluationLevel:(unint64_t)a15
{
  id v24 = a3;
  id obj = a4;
  id v25 = a4;
  id v34 = a5;
  id v26 = a5;
  id v27 = a6;
  id v35 = a9;
  if (!+[PMLPlanDescriptor isValidPlanId:v26])
  {
    double v31 = [MEMORY[0x263F08690] currentHandler];
    [v31 handleFailureInMethod:a2, self, @"PMLLogRegEvaluationPlan.m", 59, @"Invalid planId. Must be <name>-<version>-<locale> but got %@", v26 object file lineNumber description];
  }
  v36.receiver = self;
  v36.super_class = (Class)PMLLogRegEvaluationPlan;
  double v28 = [(PMLLogRegEvaluationPlan *)&v36 init];
  float v29 = v28;
  if (v28)
  {
    objc_storeStrong((id *)&v28->_store, a3);
    objc_storeStrong((id *)&v29->_tracker, obj);
    objc_storeStrong((id *)&v29->_planId, v34);
    objc_storeStrong((id *)&v29->_sessionDescriptor, a6);
    v29->_maxSessionsLimit = a7;
    v29->_sessionsInBatch = a8;
    objc_storeStrong((id *)&v29->_currentModelWeights, a9);
    v29->_intercept = a10;
    v29->_isMultiLabel = a13;
    v29->_positiveLabel = a14;
    v29->_skew = a11;
    v29->_threshold = a12;
    v29->_evaluationLevel = a15;
  }

  return v29;
}

@end