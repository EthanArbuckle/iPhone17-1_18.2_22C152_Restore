@interface PFLTraining
- (id)createDataSourceForRecipe:(id)a3 attachments:(id)a4 recordDatas:(id)a5 recordInfos:(id)a6 error:(id *)a7;
- (id)createEvaluatorForModelType:(id)a3 newAPI:(BOOL)a4 error:(id *)a5;
- (id)loadRecordsForRecordSet:(id)a3;
- (id)runTask:(id)a3 recordSet:(id)a4 error:(id *)a5;
- (id)taskResultFromDict:(id)a3 newAPI:(BOOL)a4;
@end

@implementation PFLTraining

- (id)runTask:(id)a3 recordSet:(id)a4 error:(id *)a5
{
  v39[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v10 = [v8 parameters];
  v11 = [v10 stringValueForKey:@"ModelType" defaultValue:0];

  v12 = [v8 parameters];
  NSLog(&cfstr_LoggingTaskPar.isa, v12);

  NSLog(&cfstr_LoggingModelty.isa, v11);
  v13 = [(PFLTraining *)self loadRecordsForRecordSet:v9];

  if ([v13 count])
  {
    NSLog(&cfstr_LoadedLdDesrec.isa, [v13 count]);
    v14 = [v8 parameters];
    v15 = [v8 attachments];
    v16 = [v13 datas];
    v17 = [v13 infos];
    v18 = [(PFLTraining *)self createDataSourceForRecipe:v14 attachments:v15 recordDatas:v16 recordInfos:v17 error:a5];

    if (v18 && !*a5)
    {
      v21 = -[PFLTraining createEvaluatorForModelType:newAPI:error:](self, "createEvaluatorForModelType:newAPI:error:", v11, [v18 useNewTrainingAPI], a5);
      if (v21 && !*a5)
      {
        v22 = [v8 parameters];
        v23 = [v22 stringValueForKey:@"ModelFileName" defaultValue:0];

        if (v23)
        {
          NSLog(&cfstr_Modelfile.isa, v23);
          v24 = [v8 attachments];
          v25 = [v24 attachmentURLsForBasename:v23];

          if ([v25 count] == 1)
          {
            v33 = v23;
            NSLog(&cfstr_Modelurls.isa, v25);
            v26 = [v25 objectAtIndexedSubscript:0];
            uint64_t v27 = [v21 evaluateWithModelURL:v26 dataSource:v18 error:a5];

            v28 = (void *)v27;
            if (v27 && !*a5)
            {
              v19 = -[PFLTraining taskResultFromDict:newAPI:](self, "taskResultFromDict:newAPI:", v27, [v18 useNewTrainingAPI]);
            }
            else
            {
              v19 = 0;
            }
            v23 = v33;
          }
          else
          {
            NSLog(&cfstr_ErrorNoModelur.isa);
            v30 = (void *)MEMORY[0x263F087E8];
            uint64_t v34 = *MEMORY[0x263F08320];
            v35 = @"No modelURL is found.";
            v31 = [NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
            *a5 = [v30 errorWithDomain:@"PFL Evaluator" code:0 userInfo:v31];

            v19 = 0;
          }
        }
        else
        {
          NSLog(&cfstr_ErrorNoModelfi.isa);
          v29 = (void *)MEMORY[0x263F087E8];
          uint64_t v36 = *MEMORY[0x263F08320];
          v37 = @"No modelFile is found.";
          v25 = [NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
          [v29 errorWithDomain:@"PFL Evaluator" code:0 userInfo:v25];
          v19 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        v19 = 0;
      }
    }
    else
    {
      v19 = 0;
    }
  }
  else
  {
    NSLog(&cfstr_NoDesrecordsTo.isa);
    v20 = (void *)MEMORY[0x263F087E8];
    uint64_t v38 = *MEMORY[0x263F08320];
    v39[0] = @"No DESRecords to train on.";
    v18 = [NSDictionary dictionaryWithObjects:v39 forKeys:&v38 count:1];
    [v20 errorWithDomain:@"PFL Evaluator" code:0 userInfo:v18];
    v19 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v19;
}

- (id)loadRecordsForRecordSet:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [MEMORY[0x263EFF980] array];
  v5 = [MEMORY[0x263EFF980] array];
  v33 = v3;
  v6 = [v3 nativeRecords];
  v7 = [v6 objectForKeyedSubscript:@"com.apple.iCloudSubscriptionOptimizerCore.PFLPlugin"];
  id v8 = [v7 allObjects];

  uint64_t v27 = v8;
  [v8 sortedArrayUsingSelector:sel_compare_];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v32 = [v9 countByEnumeratingWithState:&v39 objects:v44 count:16];
  id v10 = 0;
  if (v32)
  {
    v30 = v4;
    uint64_t v31 = *(void *)v40;
    id obj = v9;
    v29 = v5;
    while (2)
    {
      uint64_t v11 = 0;
      v12 = v10;
      do
      {
        if (*(void *)v40 != v31) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v39 + 1) + 8 * v11);
        v14 = [v33 nativeRecordInfo];
        v15 = [v14 objectForKeyedSubscript:v13];

        id v38 = v12;
        v16 = [v33 nativeRecordDataForRecordUUID:v13 error:&v38];
        id v10 = v38;

        long long v36 = 0u;
        long long v37 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        id v17 = v15;
        uint64_t v18 = [v17 countByEnumeratingWithState:&v34 objects:v43 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v35;
          do
          {
            for (uint64_t i = 0; i != v19; ++i)
            {
              if (*(void *)v35 != v20) {
                objc_enumerationMutation(v17);
              }
              uint64_t v22 = *(void *)(*((void *)&v34 + 1) + 8 * i);
              v23 = [v17 objectForKey:v22];
              NSLog(&cfstr_Nativerecordin.isa, v22, v23);
            }
            uint64_t v19 = [v17 countByEnumeratingWithState:&v34 objects:v43 count:16];
          }
          while (v19);
        }

        NSLog(&cfstr_Nativerecordda.isa, v16);
        if (v17) {
          BOOL v24 = v16 == 0;
        }
        else {
          BOOL v24 = 1;
        }
        if (v24)
        {

          id v9 = obj;
          v25 = 0;
          v5 = v29;
          v4 = v30;
          goto LABEL_21;
        }
        v4 = v30;
        [v30 addObject:v16];
        v5 = v29;
        [v29 addObject:v17];

        ++v11;
        v12 = v10;
      }
      while (v11 != v32);
      id v9 = obj;
      uint64_t v32 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
      if (v32) {
        continue;
      }
      break;
    }
  }

  v25 = [[InMemoryRecordSet alloc] initWithRecordInfos:v5 recordDatas:v4];
LABEL_21:

  return v25;
}

- (id)createEvaluatorForModelType:(id)a3 newAPI:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  v13[1] = *MEMORY[0x263EF8340];
  if ([a3 isEqualToString:@"Espresso"] && !v6)
  {
    NSLog(&cfstr_InitialisingEs.isa);
    v7 = EspressoEvaluator;
LABEL_6:
    id v8 = objc_alloc_init(v7);
    goto LABEL_8;
  }
  if (v6)
  {
    NSLog(&cfstr_InitialisingCo.isa);
    v7 = CoreMLTrainer;
    goto LABEL_6;
  }
  NSLog(&cfstr_InvalidModelty.isa);
  id v9 = (void *)MEMORY[0x263F087E8];
  uint64_t v12 = *MEMORY[0x263F08320];
  v13[0] = @"Invalid ModelType value specified in the recipe";
  id v10 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
  *a5 = [v9 errorWithDomain:@"PFLTraining Evaluator" code:0 userInfo:v10];

  id v8 = 0;
LABEL_8:

  return v8;
}

- (id)createDataSourceForRecipe:(id)a3 attachments:(id)a4 recordDatas:(id)a5 recordInfos:(id)a6 error:(id *)a7
{
  id v10 = a3;
  id v11 = a6;
  id v12 = a5;
  NSLog(&cfstr_PflpluginRecip.isa, v10);
  uint64_t v13 = objc_opt_new();
  v14 = +[EvaluationDataSource defaultRecipeParams];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __83__PFLTraining_createDataSourceForRecipe_attachments_recordDatas_recordInfos_error___block_invoke;
  v22[3] = &unk_264E79D38;
  id v15 = v10;
  id v23 = v15;
  id v16 = v13;
  id v24 = v16;
  [v14 enumerateKeysAndObjectsUsingBlock:v22];

  id v17 = [[EvaluationDataSource alloc] initWithRecipe:v16 infos:v11 datas:v12 error:a7];
  NSLog(&cfstr_LdDesrecordsBe.isa, [(EvaluationDataSource *)v17 recordCount]);
  [(EvaluationDataSource *)v17 filteringOperation];
  NSLog(&cfstr_LdDesrecordsAf.isa, [(EvaluationDataSource *)v17 recordCount]);
  [(EvaluationDataSource *)v17 negativeSamplingRate];
  if (v18 >= 1.0
    || (NSLog(&cfstr_AboutToPerform.isa),
        [(EvaluationDataSource *)v17 performDownSampling],
        [(EvaluationDataSource *)v17 recordCount]))
  {
    if ([(EvaluationDataSource *)v17 recordCount])
    {
      unint64_t v19 = [(EvaluationDataSource *)v17 recordCount];
      if (v19 >= [(EvaluationDataSource *)v17 minBatchSize])
      {
        if (v17)
        {
          NSLog(&cfstr_Evaluatordatas.isa, v17);
          NSLog(&cfstr_Evaluatordatas_0.isa, v17);
          uint64_t v20 = v17;
          goto LABEL_12;
        }
        NSLog(&cfstr_ErrorNoEvaluat.isa);
      }
      else
      {
        NSLog(&cfstr_SampleSizeIsSm.isa);
      }
    }
    else
    {
      NSLog(&cfstr_NoDesrecordsTo_1.isa);
    }
  }
  else
  {
    NSLog(&cfstr_NoDesrecordsTo_0.isa);
  }
  uint64_t v20 = 0;
LABEL_12:

  return v20;
}

void __83__PFLTraining_createDataSourceForRecipe_attachments_recordDatas_recordInfos_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  uint64_t v8 = [v5 objectForKeyedSubscript:v7];
  id v10 = (id)v8;
  if (v8) {
    id v9 = (id)v8;
  }
  else {
    id v9 = v6;
  }
  [*(id *)(a1 + 40) setObject:v9 forKeyedSubscript:v7];
}

- (id)taskResultFromDict:(id)a3 newAPI:(BOOL)a4
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  v5 = (void *)[a3 mutableCopy];
  id v6 = [v5 objectForKeyedSubscript:@"ModelDeltas"];
  [v5 removeObjectForKey:@"ModelDeltas"];
  if (!a4)
  {
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v40 objects:v46 count:16];
    v30 = v5;
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = 0;
      uint64_t v11 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v41 != v11) {
            objc_enumerationMutation(v7);
          }
          v10 += [*(id *)(*((void *)&v40 + 1) + 8 * i) count];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v40 objects:v46 count:16];
      }
      while (v9);
      size_t v13 = 4 * v10;
    }
    else
    {
      size_t v13 = 0;
    }

    size_t v29 = v13;
    v14 = malloc_type_malloc(v13, 0x100004052888210uLL);
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id obj = v7;
    uint64_t v15 = [obj countByEnumeratingWithState:&v36 objects:v45 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = 0;
      uint64_t v18 = *(void *)v37;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v37 != v18) {
            objc_enumerationMutation(obj);
          }
          uint64_t v20 = *(void **)(*((void *)&v36 + 1) + 8 * j);
          long long v32 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          long long v35 = 0u;
          id v21 = v20;
          uint64_t v22 = [v21 countByEnumeratingWithState:&v32 objects:v44 count:16];
          if (v22)
          {
            uint64_t v23 = v22;
            uint64_t v24 = *(void *)v33;
            do
            {
              for (uint64_t k = 0; k != v23; ++k)
              {
                if (*(void *)v33 != v24) {
                  objc_enumerationMutation(v21);
                }
                [*(id *)(*((void *)&v32 + 1) + 8 * k) floatValue];
                v14[v17 + k] = v26;
              }
              uint64_t v23 = [v21 countByEnumeratingWithState:&v32 objects:v44 count:16];
              v17 += k;
            }
            while (v23);
          }
        }
        uint64_t v16 = [obj countByEnumeratingWithState:&v36 objects:v45 count:16];
      }
      while (v16);
    }

    id v6 = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:v14 length:v29 freeWhenDone:1];

    v5 = v30;
  }
  uint64_t v27 = (void *)[objc_alloc(MEMORY[0x263F534A8]) initWithJSONResult:v5 unprivatizedVector:v6];

  return v27;
}

@end