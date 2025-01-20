@interface CoreMLTrainer
+ (void)initialize;
- (NSURL)modelURL;
- (id)evaluateWithModelURL:(id)a3 dataSource:(id)a4 error:(id *)a5;
- (id)processModelURL:(id)a3;
- (void)setModelURL:(id)a3;
@end

@implementation CoreMLTrainer

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    sLog = (uint64_t)os_log_create("com.apple.iCloudSubscriptionOptimizerCore.PFLPlugin", "CoreMLTrainer");
    MEMORY[0x270F9A758]();
  }
}

- (id)processModelURL:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a3;
  int v4 = [v3 hasDirectoryPath];
  v5 = sLog;
  BOOL v6 = os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v6)
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v3;
      _os_log_impl(&dword_23C9A9000, v5, OS_LOG_TYPE_INFO, "modelURL %@ is a directory.", buf, 0xCu);
    }
    id v7 = v3;
  }
  else
  {
    if (v6)
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v3;
      _os_log_impl(&dword_23C9A9000, v5, OS_LOG_TYPE_INFO, "modelURL %@ is a file URL.", buf, 0xCu);
    }
    v8 = [v3 absoluteString];
    [@"model.mil,metadata.json,coremldata.bin,analytics/coremldata.bin,weights/weight.bin" componentsSeparatedByString:@","];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v9);
          }
          v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          if (objc_msgSend(v8, "hasSuffix:", v13, (void)v18))
          {
            uint64_t v14 = objc_msgSend(v8, "substringToIndex:", objc_msgSend(v8, "length") - objc_msgSend(v13, "length"));

            v8 = (void *)v14;
          }
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v10);
    }

    v15 = (id)sLog;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = [NSURL URLWithString:v8];
      *(_DWORD *)buf = 138412290;
      id v24 = v16;
      _os_log_impl(&dword_23C9A9000, v15, OS_LOG_TYPE_INFO, "modelURL is %@.", buf, 0xCu);
    }
    id v7 = [NSURL URLWithString:v8];
  }

  return v7;
}

- (id)evaluateWithModelURL:(id)a3 dataSource:(id)a4 error:(id *)a5
{
  uint64_t v112 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v87 = a4;
  id v80 = objc_alloc_init(MEMORY[0x263F00D98]);
  [v80 setComputeUnits:0];
  uint64_t v9 = [(CoreMLTrainer *)self processModelURL:v8];

  id v103 = 0;
  v77 = (void *)v9;
  uint64_t v10 = [MEMORY[0x263F00D80] modelWithContentsOfURL:v9 configuration:v80 error:&v103];
  id v11 = v103;
  v79 = (void *)v10;
  if (v10)
  {
    id v12 = objc_alloc(MEMORY[0x263F00DD8]);
    v13 = [v79 program];
    [v87 learningRate];
    id v102 = v11;
    v83 = (void *)[v12 initWithProgram:v13 learningRate:&v102 error:v14];
    id v15 = v102;

    if (v83)
    {
      v86 = (void *)[MEMORY[0x263EFFA68] mutableCopy];
      v88 = [[EvaluationDataSourceEspressoWrapper alloc] initWithEvaluatorDataSource:v87];
      for (unsigned int i = 0; ; ++i)
      {
        unint64_t v17 = [v87 recordCount];
        if (v17 / (int)[v87 batchSize] <= i) {
          break;
        }
        long long v18 = [(EvaluationDataSourceEspressoWrapper *)v88 featureProviderAtIndex:i];
        [v86 addObject:v18];
      }
      id v101 = v15;
      v82 = (void *)[objc_alloc(MEMORY[0x263F00D10]) initWithFeatureProviderArray:v86];
      v76 = objc_msgSend(v83, "evaluateUsingTestData:error:");
      id v19 = v15;

      [v76 loss];
      double v21 = v20;
      v22 = sLog;
      if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        *(double *)v110 = v21;
        _os_log_impl(&dword_23C9A9000, v22, OS_LOG_TYPE_INFO, "loss before training is: %f", buf, 0xCu);
      }
      v92 = [MEMORY[0x263EFF980] array];
      v81 = [MEMORY[0x263EFF980] array];
      long long v99 = 0u;
      long long v100 = 0u;
      long long v97 = 0u;
      long long v98 = 0u;
      v23 = [v87 layersToTrain];
      uint64_t v24 = [v23 countByEnumeratingWithState:&v97 objects:v111 count:16];
      if (v24)
      {
        uint64_t v25 = *(void *)v98;
        do
        {
          for (uint64_t j = 0; j != v24; ++j)
          {
            if (*(void *)v98 != v25) {
              objc_enumerationMutation(v23);
            }
            [v92 addObject:*(void *)(*((void *)&v97 + 1) + 8 * j)];
          }
          uint64_t v24 = [v23 countByEnumeratingWithState:&v97 objects:v111 count:16];
        }
        while (v24);
      }

      int v27 = [v87 numLocalIterations];
      if (v27 < 1)
      {
        double v35 = -1.0;
      }
      else
      {
        for (int k = 0; k != v27; ++k)
        {
          v29 = [MEMORY[0x263EFFA08] setWithArray:v92];
          id v96 = v19;
          v30 = [v83 trainUsingTrainingData:v82 evaluationMetricNames:v29 error:&v96];
          id v31 = v96;

          v32 = (id)sLog;
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            [v30 loss];
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)v110 = k;
            *(_WORD *)&v110[4] = 2048;
            *(void *)&v110[6] = v33;
            _os_log_impl(&dword_23C9A9000, v32, OS_LOG_TYPE_INFO, "fit: iter=%d loss=%f", buf, 0x12u);
          }

          [v30 loss];
          double v35 = v34;
          v36 = NSNumber;
          [v30 loss];
          v37 = objc_msgSend(v36, "numberWithDouble:");
          [v81 addObject:v37];

          id v19 = v31;
        }
        id v19 = v31;
      }
      id v95 = v19;
      v75 = [v83 evaluateUsingTestData:v82 error:&v95];
      id v40 = v95;

      [v75 loss];
      double v42 = v41;
      v43 = sLog;
      if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        *(double *)v110 = v42;
        _os_log_impl(&dword_23C9A9000, v43, OS_LOG_TYPE_INFO, "loss after training is: %f", buf, 0xCu);
      }
      v73 = (void *)[v83 copyCurrentTrainingDelta];
      v74 = [v73 flattenedModelUpdate];
      v44 = sLog;
      if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23C9A9000, v44, OS_LOG_TYPE_INFO, "Started model evaluation", buf, 2u);
      }
      v85 = [v87 modelOutputName];
      v84 = [v87 modelInputSchemaLabelName];
      v45 = (void *)MEMORY[0x263EFFA08];
      v108 = v85;
      v46 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v108 count:1];
      v47 = [v45 setWithArray:v46];
      id v94 = v40;
      v89 = [v83 evaluateUsingTestData:v82 evaluationMetricNames:v47 error:&v94];
      id v78 = v94;

      v93 = [MEMORY[0x263EFF980] array];
      for (uint64_t m = 0; ; ++m)
      {
        v48 = [v89 evaluationMetrics];
        BOOL v49 = [v48 count] > m;

        if (!v49) {
          break;
        }
        v50 = [v89 evaluationMetrics];
        v90 = [v50 featuresAtIndex:m];

        v51 = [v90 featureValueForName:v85];
        v52 = [v51 multiArrayValue];

        v53 = [(EvaluationDataSourceEspressoWrapper *)v88 featureProviderAtIndex:m];
        v54 = [v53 objectForKeyedSubscript:v84];
        v55 = [v54 multiArrayValue];

        for (uint64_t n = 0; ; ++n)
        {
          uint64_t v57 = [v52 count];
          uint64_t v58 = [v55 count];
          uint64_t v59 = v57 >= v58 ? v58 : v57;
          if (v59 <= n) {
            break;
          }
          v60 = [MEMORY[0x263EFF9A0] dictionary];
          v61 = NSNumber;
          v62 = [v52 objectAtIndexedSubscript:n];
          [v62 doubleValue];
          v63 = objc_msgSend(v61, "numberWithDouble:");
          [v60 setValue:v63 forKey:@"probability"];

          v64 = NSNumber;
          v65 = [v55 objectAtIndexedSubscript:n];
          [v65 doubleValue];
          v67 = [v64 numberWithBool:v66 > 0.0];
          [v60 setValue:v67 forKey:@"label"];

          [v93 addObject:v60];
        }
      }
      v106[0] = @"LossBeforeTraining";
      v68 = [NSNumber numberWithDouble:v21];
      v107[0] = v68;
      v106[1] = @"LossAfterTraining";
      v69 = [NSNumber numberWithDouble:v42];
      v107[1] = v69;
      v106[2] = @"TrainingLoss";
      v70 = [NSNumber numberWithDouble:v35];
      v107[2] = v70;
      v107[3] = v92;
      v106[3] = @"UpdatedModelIndices";
      v106[4] = @"ModelDeltas";
      v107[4] = v74;
      v106[5] = @"TrainingLosses";
      v104 = @"losses";
      v105 = v81;
      v71 = [NSDictionary dictionaryWithObjects:&v105 forKeys:&v104 count:1];
      v106[6] = @"OtherEvaluationMetric";
      v107[5] = v71;
      v107[6] = v93;
      id v15 = [NSDictionary dictionaryWithObjects:v107 forKeys:v106 count:7];
    }
    else
    {
      v39 = sLog;
      if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23C9A9000, v39, OS_LOG_TYPE_INFO, "Failed to load MLProgramTrainer.", buf, 2u);
      }
      if (v15)
      {
        id v78 = v15;
        id v15 = 0;
        *a5 = v78;
      }
      else
      {
        id v78 = 0;
      }
    }
  }
  else
  {
    v38 = sLog;
    if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)v110 = v77;
      _os_log_impl(&dword_23C9A9000, v38, OS_LOG_TYPE_INFO, "Failed to load model from %@", buf, 0xCu);
    }
    if (v11)
    {
      id v78 = v11;
      id v15 = 0;
      *a5 = v78;
    }
    else
    {
      id v78 = 0;
      id v15 = 0;
    }
  }

  return v15;
}

- (NSURL)modelURL
{
  return self->_modelURL;
}

- (void)setModelURL:(id)a3
{
}

- (void).cxx_destruct
{
}

@end