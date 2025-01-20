@interface PMLMultiLabelRegressionEvaluationPlan
- (BOOL)intercept;
- (NSArray)evaluationPoints;
- (NSArray)positiveLabels;
- (NSArray)weightsArray;
- (NSString)planId;
- (PMLMultiLabelClassifierModelProtocol)multiLabelRegressionModel;
- (PMLMultiLabelEvaluationTrackerProtocol)tracker;
- (PMLMultiLabelRegressionEvaluationPlan)initWithPlanId:(id)a3 store:(id)a4 sessionDescriptor:(id)a5 maxSessionsLimit:(unint64_t)a6 sessionsInBatch:(unint64_t)a7 labelAndWeights:(id)a8 modelClassName:(id)a9 intercept:(BOOL)a10 evaluationPoints:(id)a11 tracker:(id)a12 evaluationLevel:(unint64_t)a13;
- (PMLMultiLabelRegressionEvaluationPlan)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5;
- (PMLSessionDescriptor)sessionDescriptor;
- (PMLTrainingStore)store;
- (id)_precisionAtEvaluationPointsForSessions:(id)a3;
- (id)_rankedLabelsForSession:(id)a3;
- (id)runWithError:(id *)a3;
- (id)toPlistWithChunks:(id)a3;
- (unint64_t)evaluationLevel;
- (unint64_t)maxSessionsLimit;
- (unint64_t)sessionsInBatch;
@end

@implementation PMLMultiLabelRegressionEvaluationPlan

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_planId, 0);
  objc_storeStrong((id *)&self->_tracker, 0);
  objc_storeStrong((id *)&self->_evaluationPoints, 0);
  objc_storeStrong((id *)&self->_weightsArray, 0);
  objc_storeStrong((id *)&self->_positiveLabels, 0);
  objc_storeStrong((id *)&self->_multiLabelRegressionModel, 0);
  objc_storeStrong((id *)&self->_sessionDescriptor, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

- (unint64_t)evaluationLevel
{
  return self->_evaluationLevel;
}

- (PMLMultiLabelEvaluationTrackerProtocol)tracker
{
  return self->_tracker;
}

- (NSArray)evaluationPoints
{
  return self->_evaluationPoints;
}

- (BOOL)intercept
{
  return self->_intercept;
}

- (NSArray)weightsArray
{
  return self->_weightsArray;
}

- (NSArray)positiveLabels
{
  return self->_positiveLabels;
}

- (PMLMultiLabelClassifierModelProtocol)multiLabelRegressionModel
{
  return self->_multiLabelRegressionModel;
}

- (unint64_t)sessionsInBatch
{
  return self->_sessionsInBatch;
}

- (unint64_t)maxSessionsLimit
{
  return self->_maxSessionsLimit;
}

- (PMLSessionDescriptor)sessionDescriptor
{
  return self->_sessionDescriptor;
}

- (PMLTrainingStore)store
{
  return self->_store;
}

- (NSString)planId
{
  return self->_planId;
}

- (PMLMultiLabelRegressionEvaluationPlan)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5
{
  v66[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v10 objectForKeyedSubscript:@"TRAINING_STORE"];

  if (!v11)
  {
    v42 = [MEMORY[0x263F08690] currentHandler];
    v43 = (objc_class *)objc_opt_class();
    v44 = NSStringFromClass(v43);
    [v42 handleFailureInMethod:a2, self, @"PMLMultiLabelRegressionEvaluationPlan.m", 211, @"Can't instantiate %@. Missing \"store\" dependency.", v44 object file lineNumber description];
  }
  uint64_t v60 = [v8 objectForKeyedSubscript:@"PLAN_ID"];
  uint64_t v59 = [v10 objectForKeyedSubscript:@"TRAINING_STORE"];
  v12 = [PMLSessionDescriptor alloc];
  v13 = [v8 objectForKeyedSubscript:@"SESSIONS_MODEL_HANDLE"];
  v14 = [(PMLSessionDescriptor *)v12 initWithPlist:v13 chunks:v9 context:v10];

  if (v14)
  {
    SEL v15 = a2;
    v16 = [v8 objectForKeyedSubscript:@"SESSIONS_LIMIT"];
    uint64_t v50 = [v16 unsignedIntegerValue];

    v17 = [v8 objectForKeyedSubscript:@"SESSIONS_IN_BATCH"];
    uint64_t v49 = [v17 unsignedIntegerValue];

    uint64_t v18 = [v8 objectForKeyedSubscript:@"POSITIVE_LABELS"];
    v19 = [v8 objectForKeyedSubscript:@"WEIGHTS_ARRAY"];
    v20 = objc_opt_new();
    v62[0] = MEMORY[0x263EF8330];
    v62[1] = 3221225472;
    v62[2] = __70__PMLMultiLabelRegressionEvaluationPlan_initWithPlist_chunks_context___block_invoke;
    v62[3] = &unk_26459EA30;
    id v56 = v9;
    id v21 = v9;
    id v63 = v21;
    id v22 = v20;
    id v64 = v22;
    v54 = v19;
    [v19 enumerateObjectsUsingBlock:v62];
    v51 = v22;
    v55 = (void *)v18;
    uint64_t v53 = [NSDictionary dictionaryWithObjects:v22 forKeys:v18];
    uint64_t v52 = [v8 objectForKeyedSubscript:@"MULTI_LABEL_REGRESSION_MODEL_TYPE"];
    v23 = [v8 objectForKeyedSubscript:@"INTERCEPT"];
    char v24 = [v23 BOOLValue];

    uint64_t v25 = [v8 objectForKeyedSubscript:@"EVALUATION_POINTS"];
    v26 = [v8 objectForKeyedSubscript:@"TRACKER_TYPE"];
    v27 = NSClassFromString(v26);
    if (!v27)
    {
      v45 = [MEMORY[0x263F08690] currentHandler];
      v46 = (objc_class *)objc_opt_class();
      v58 = NSStringFromClass(v46);
      [v45 handleFailureInMethod:v15, self, @"PMLMultiLabelRegressionEvaluationPlan.m", 248, @"Can't instantiate %@. Unknown tracker class: %@", v58, v26 object file lineNumber description];
    }
    v57 = v14;
    id v28 = [v27 alloc];
    v29 = [v8 objectForKeyedSubscript:@"TRACKER"];
    v30 = (void *)v60;
    v65 = @"planId";
    v66[0] = v60;
    v31 = [NSDictionary dictionaryWithObjects:v66 forKeys:&v65 count:1];
    v32 = (void *)[v28 initWithPlist:v29 chunks:v21 context:v31];

    if (v32)
    {
      v33 = [v8 objectForKeyedSubscript:@"EVALUATION_LEVEL"];
      uint64_t v34 = [v33 unsignedIntegerValue];

      uint64_t v48 = v25;
      LOBYTE(v47) = v24;
      v35 = (void *)v52;
      v36 = (void *)v59;
      v37 = (void *)v25;
      v38 = (void *)v53;
      v39 = [(PMLMultiLabelRegressionEvaluationPlan *)self initWithPlanId:v60 store:v59 sessionDescriptor:v57 maxSessionsLimit:v50 sessionsInBatch:v49 labelAndWeights:v53 modelClassName:v52 intercept:v47 evaluationPoints:v48 tracker:v32 evaluationLevel:v34];
      v40 = v39;
    }
    else
    {
      v40 = 0;
      v39 = self;
      v36 = (void *)v59;
      v37 = (void *)v25;
      v35 = (void *)v52;
      v38 = (void *)v53;
    }

    id v9 = v56;
    v14 = v57;
  }
  else
  {
    v40 = 0;
    v30 = (void *)v60;
    v39 = self;
    v36 = (void *)v59;
  }

  return v40;
}

void __70__PMLMultiLabelRegressionEvaluationPlan_initWithPlist_chunks_context___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [PMLModelWeights alloc];
  v6 = [(PMLModelWeights *)v4 initWithPlist:v3 chunks:*(void *)(a1 + 32) context:MEMORY[0x263EFFA78]];

  v5 = v6;
  if (v6)
  {
    [*(id *)(a1 + 40) addObject:v6];
    v5 = v6;
  }
}

- (id)toPlistWithChunks:(id)a3
{
  v28[12] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = objc_opt_new();
  weightsArray = self->_weightsArray;
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __59__PMLMultiLabelRegressionEvaluationPlan_toPlistWithChunks___block_invoke;
  v24[3] = &unk_26459EA08;
  id v25 = v5;
  id v26 = v4;
  id v7 = v4;
  id v23 = v5;
  [(NSArray *)weightsArray enumerateObjectsUsingBlock:v24];
  v28[0] = self->_planId;
  v27[0] = @"PLAN_ID";
  v27[1] = @"SESSIONS_MODEL_HANDLE";
  id v8 = [(PMLSessionDescriptor *)self->_sessionDescriptor toPlistWithChunks:v7];
  v28[1] = v8;
  v27[2] = @"SESSIONS_LIMIT";
  id v9 = [NSNumber numberWithUnsignedInteger:self->_maxSessionsLimit];
  v28[2] = v9;
  v27[3] = @"SESSIONS_IN_BATCH";
  id v10 = [NSNumber numberWithUnsignedInteger:self->_sessionsInBatch];
  positiveLabels = self->_positiveLabels;
  v28[3] = v10;
  v28[4] = positiveLabels;
  v27[4] = @"POSITIVE_LABELS";
  v27[5] = @"WEIGHTS_ARRAY";
  v28[5] = v23;
  v27[6] = @"MULTI_LABEL_REGRESSION_MODEL_TYPE";
  v12 = (objc_class *)objc_opt_class();
  v13 = NSStringFromClass(v12);
  v28[6] = v13;
  v27[7] = @"INTERCEPT";
  v14 = [NSNumber numberWithBool:self->_intercept];
  evaluationPoints = self->_evaluationPoints;
  tracker = self->_tracker;
  v28[7] = v14;
  v28[8] = evaluationPoints;
  v27[8] = @"EVALUATION_POINTS";
  v27[9] = @"TRACKER";
  v17 = [(PMLMultiLabelEvaluationTrackerProtocol *)tracker toPlistWithChunks:v7];
  v28[9] = v17;
  v27[10] = @"TRACKER_TYPE";
  uint64_t v18 = (objc_class *)objc_opt_class();
  v19 = NSStringFromClass(v18);
  v28[10] = v19;
  v27[11] = @"EVALUATION_LEVEL";
  v20 = [NSNumber numberWithUnsignedInteger:self->_evaluationLevel];
  v28[11] = v20;
  id v21 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:12];

  return v21;
}

void __59__PMLMultiLabelRegressionEvaluationPlan_toPlistWithChunks___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 toPlistWithChunks:*(void *)(a1 + 40)];
  [v2 addObject:v3];
}

- (id)runWithError:(id *)a3
{
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v17[3] = 0;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__315;
  SEL v15 = __Block_byref_object_dispose__316;
  id v16 = 0;
  store = self->_store;
  sessionDescriptor = self->_sessionDescriptor;
  +[PMLTrainingStore lastUsedTimestampLimit];
  positiveLabels = self->_positiveLabels;
  unint64_t sessionsInBatch = self->_sessionsInBatch;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __54__PMLMultiLabelRegressionEvaluationPlan_runWithError___block_invoke;
  v10[3] = &unk_26459F748;
  v10[4] = self;
  v10[5] = &v11;
  v10[6] = v17;
  -[PMLTrainingStore loadSessionsForModel:privacyBudgetRefreshPeriod:labels:batchSize:block:](store, "loadSessionsForModel:privacyBudgetRefreshPeriod:labels:batchSize:block:", sessionDescriptor, positiveLabels, sessionsInBatch, v10);
  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(v17, 8);
  return v8;
}

void __54__PMLMultiLabelRegressionEvaluationPlan_runWithError___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  v6 = PML_LogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(v7 + 96);
    uint64_t v9 = *(void *)(v7 + 16);
    int v15 = 138412802;
    uint64_t v16 = v8;
    __int16 v17 = 2112;
    uint64_t v18 = v9;
    __int16 v19 = 2048;
    uint64_t v20 = [v5 count];
    _os_log_impl(&dword_2212A0000, v6, OS_LOG_TYPE_INFO, "Evaluating plan %@ (descriptor: %@, available %tu sessions)", (uint8_t *)&v15, 0x20u);
  }

  if ([v5 count])
  {
    id v10 = [*(id *)(a1 + 32) _precisionAtEvaluationPointsForSessions:v5];
    if (v10)
    {
      uint64_t v11 = [v5 minibatchStatsForPositiveLabels:*(void *)(*(void *)(a1 + 32) + 48)];
      uint64_t v12 = [*(id *)(*(void *)(a1 + 32) + 80) trackPrecisionAtK:v10 minibatchStats:v11];
      uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
      v14 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = v12;

      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += [v5 count];
      if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) >= *(void *)(*(void *)(a1 + 32) + 24)) {
        *a3 = 1;
      }
    }
  }
}

- (id)_precisionAtEvaluationPointsForSessions:(id)a3
{
  uint64_t v81 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 outcomes];
  v6 = objc_opt_new();
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  uint64_t v7 = self->_evaluationPoints;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v71 objects:v80 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v72;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v72 != v10) {
          objc_enumerationMutation(v7);
        }
        [v6 setObject:0 forKeyedSubscript:*(void *)(*((void *)&v71 + 1) + 8 * i)];
      }
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v71 objects:v80 count:16];
    }
    while (v9);
  }

  uint64_t v12 = [v4 covariates];
  uint64_t v13 = (void *)[v12 matrix];

  sparse_dimension matrix_number_of_columns = sparse_get_matrix_number_of_columns(v13);
  uint64_t v49 = v4;
  uint64_t v15 = [v4 count];
  val = (float *)malloc_type_malloc(4 * matrix_number_of_columns, 0x100004052888210uLL);
  sparse_dimension v54 = matrix_number_of_columns;
  v55 = (sparse_index *)malloc_type_malloc(8 * matrix_number_of_columns, 0x100004000313F17uLL);
  if (v15 < 1)
  {
    uint64_t v18 = v15;
    goto LABEL_32;
  }
  sparse_index v17 = 0;
  *(void *)&long long v16 = 134217984;
  long long v48 = v16;
  uint64_t v18 = v15;
  uint64_t v52 = self;
  uint64_t v53 = v5;
  uint64_t v50 = v15;
  v51 = v13;
  while (1)
  {
    __int16 v19 = NSNumber;
    LODWORD(v20) = *(_DWORD *)([v5 values] + 4 * v17);
    v62 = [v19 numberWithFloat:v20];
    if (!-[NSArray containsObject:](self->_positiveLabels, "containsObject:"))
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        positiveLabels = self->_positiveLabels;
        *(_DWORD *)column_end = 138412546;
        *(void *)&column_end[4] = v62;
        __int16 v78 = 2112;
        v79 = positiveLabels;
        _os_log_error_impl(&dword_2212A0000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Label %@ not in sepcified list %@", column_end, 0x16u);
      }
      goto LABEL_27;
    }
    if (sparse_get_matrix_nonzero_count_for_row(v13, v17)) {
      break;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)column_end = v48;
      *(void *)&column_end[4] = v17;
      _os_log_debug_impl(&dword_2212A0000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "Ignoring all zero row #%ld", column_end, 0xCu);
    }
LABEL_27:
    --v18;
LABEL_28:

    if (++v17 == v15) {
      goto LABEL_32;
    }
  }
  *(void *)column_end = 0;
  sparse_index v60 = v17;
  sparse_extract_sparse_row_float((sparse_matrix_float)v13, v17, 0, (sparse_index *)column_end, v54, val, v55);
  uint64_t v21 = [PMLDenseVector alloc];
  id v22 = [(PMLDenseVector *)v21 initWithFloatsNoCopy:val count:*(void *)column_end freeWhenDone:0];
  v61 = +[PMLSparseVector sparseVectorFromDense:v22];
  id v23 = -[PMLMultiLabelRegressionEvaluationPlan _rankedLabelsForSession:](self, "_rankedLabelsForSession:");
  if (v23)
  {
    v58 = v22;
    uint64_t v59 = v18;
    v57 = v23;
    unint64_t v24 = [v23 indexOfObject:v62];
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    id v25 = self->_evaluationPoints;
    uint64_t v26 = [(NSArray *)v25 countByEnumeratingWithState:&v67 objects:v76 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v68;
      do
      {
        for (uint64_t j = 0; j != v27; ++j)
        {
          if (*(void *)v68 != v28) {
            objc_enumerationMutation(v25);
          }
          v30 = *(void **)(*((void *)&v67 + 1) + 8 * j);
          if (v24 < objc_msgSend(v30, "unsignedIntegerValue", v48))
          {
            v31 = NSNumber;
            v32 = [v6 objectForKeyedSubscript:v30];
            v33 = objc_msgSend(v31, "numberWithUnsignedInteger:", objc_msgSend(v32, "unsignedIntegerValue") + 1);
            [v6 setObject:v33 forKeyedSubscript:v30];
          }
        }
        uint64_t v27 = [(NSArray *)v25 countByEnumeratingWithState:&v67 objects:v76 count:16];
      }
      while (v27);
    }

    self = v52;
    id v5 = v53;
    uint64_t v18 = v59;
    sparse_index v17 = v60;
    uint64_t v15 = v50;
    uint64_t v13 = v51;
    goto LABEL_28;
  }

  v6 = 0;
LABEL_32:
  free(v55);
  free(val);
  if (v6)
  {
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    v35 = self->_evaluationPoints;
    uint64_t v36 = [(NSArray *)v35 countByEnumeratingWithState:&v63 objects:v75 count:16];
    if (v36)
    {
      uint64_t v37 = v36;
      uint64_t v38 = *(void *)v64;
      float v39 = (float)v18;
      do
      {
        for (uint64_t k = 0; k != v37; ++k)
        {
          if (*(void *)v64 != v38) {
            objc_enumerationMutation(v35);
          }
          uint64_t v41 = *(void *)(*((void *)&v63 + 1) + 8 * k);
          v42 = NSNumber;
          v43 = objc_msgSend(v6, "objectForKeyedSubscript:", v41, v48);
          [v43 floatValue];
          *(float *)&double v45 = v44 / v39;
          v46 = [v42 numberWithFloat:v45];
          [v6 setObject:v46 forKeyedSubscript:v41];
        }
        uint64_t v37 = [(NSArray *)v35 countByEnumeratingWithState:&v63 objects:v75 count:16];
      }
      while (v37);
    }
  }
  return v6;
}

- (id)_rankedLabelsForSession:(id)a3
{
  v17[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(PMLMultiLabelClassifierModelProtocol *)self->_multiLabelRegressionModel predict:v4];
  if (v5)
  {
    v6 = (void *)[objc_alloc(NSDictionary) initWithObjects:v5 forKeys:self->_positiveLabels];
    uint64_t v7 = (void *)MEMORY[0x263F08B30];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __65__PMLMultiLabelRegressionEvaluationPlan__rankedLabelsForSession___block_invoke;
    v15[3] = &unk_26459E9E0;
    id v8 = v6;
    id v16 = v8;
    uint64_t v9 = [v7 sortDescriptorWithKey:0 ascending:0 comparator:v15];
    uint64_t v10 = (void *)MEMORY[0x223C7E5C0]();
    uint64_t v11 = [v8 allKeys];
    v17[0] = v9;
    uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
    uint64_t v13 = [v11 sortedArrayUsingDescriptors:v12];
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

uint64_t __65__PMLMultiLabelRegressionEvaluationPlan__rankedLabelsForSession___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  uint64_t v7 = [v5 objectForKeyedSubscript:a2];
  id v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];

  uint64_t v9 = [v7 compare:v8];
  return v9;
}

- (PMLMultiLabelRegressionEvaluationPlan)initWithPlanId:(id)a3 store:(id)a4 sessionDescriptor:(id)a5 maxSessionsLimit:(unint64_t)a6 sessionsInBatch:(unint64_t)a7 labelAndWeights:(id)a8 modelClassName:(id)a9 intercept:(BOOL)a10 evaluationPoints:(id)a11 tracker:(id)a12 evaluationLevel:(unint64_t)a13
{
  id v19 = a3;
  id v45 = a4;
  id v44 = a5;
  id v20 = a8;
  uint64_t v21 = (NSString *)a9;
  id v22 = v19;
  id v23 = a11;
  id v43 = a12;
  if (!+[PMLPlanDescriptor isValidPlanId:v22])
  {
    uint64_t v36 = [MEMORY[0x263F08690] currentHandler];
    [v36 handleFailureInMethod:a2, self, @"PMLMultiLabelRegressionEvaluationPlan.m", 53, @"Invalid planId. Must be <name>-<version>-<locale> but got %@", v22 object file lineNumber description];
  }
  v46.receiver = self;
  v46.super_class = (Class)PMLMultiLabelRegressionEvaluationPlan;
  unint64_t v24 = [(PMLMultiLabelRegressionEvaluationPlan *)&v46 init];
  id v25 = v24;
  if (v24)
  {
    id v41 = v23;
    objc_storeStrong((id *)&v24->_planId, a3);
    objc_storeStrong((id *)&v25->_store, a4);
    objc_storeStrong((id *)&v25->_sessionDescriptor, a5);
    v25->_maxSessionsLimit = a6;
    v25->_unint64_t sessionsInBatch = a7;
    v25->_intercept = a10;
    uint64_t v26 = (void *)MEMORY[0x223C7E5C0]();
    uint64_t v27 = [v20 allKeys];
    positiveLabels = v25->_positiveLabels;
    v25->_positiveLabels = (NSArray *)v27;

    v29 = (void *)MEMORY[0x223C7E5C0]();
    uint64_t v30 = [v20 allValues];
    weightsArray = v25->_weightsArray;
    v25->_weightsArray = (NSArray *)v30;

    v32 = NSClassFromString(v21);
    if (!v32)
    {
      uint64_t v37 = [MEMORY[0x263F08690] currentHandler];
      uint64_t v38 = (objc_class *)objc_opt_class();
      float v39 = NSStringFromClass(v38);
      [v37 handleFailureInMethod:a2, v25, @"PMLMultiLabelRegressionEvaluationPlan.m", 66, @"Can't instantiate %@. Unknown model class: %@", v39, v21 object file lineNumber description];
    }
    uint64_t v33 = [[v32 alloc] initWithWeightsArray:v25->_weightsArray andIntercept:a10];
    multiLabelRegressionModel = v25->_multiLabelRegressionModel;
    v25->_multiLabelRegressionModel = (PMLMultiLabelClassifierModelProtocol *)v33;

    objc_storeStrong((id *)&v25->_evaluationPoints, a11);
    objc_storeStrong((id *)&v25->_tracker, a12);
    id v23 = v41;
    v25->_evaluationLevel = a13;
  }

  return v25;
}

@end