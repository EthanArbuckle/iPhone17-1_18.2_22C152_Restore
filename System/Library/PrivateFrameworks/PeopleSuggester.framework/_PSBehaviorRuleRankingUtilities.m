@interface _PSBehaviorRuleRankingUtilities
+ (BOOL)copyFileFromURL:(id)a3 toURL:(id)a4;
+ (BOOL)copyZippedAdaptableModel:(id)a3;
+ (BOOL)loadDeployedAdaptableModelUnderDirectory:(id)a3;
+ (BOOL)removeFolderAtPath:(id)a3;
+ (id)batchPredictWithAdaptedMLModel:(id)a3 psConfigForAdaptableModel:(id)a4 featureDictArray:(id)a5;
+ (id)batchPredictWithAdaptedMLModel:(id)a3 psConfigForAdaptableModel:(id)a4 featurizedRules:(id)a5;
+ (id)batchPredictWithMLModel:(id)a3 featureArrayDict:(id)a4;
+ (id)compileMLModelAtPath:(id)a3;
+ (id)getAdaptedCompiledMLModelPath;
+ (id)getAdaptedModelRecipeVersionFilePath;
+ (id)getArchivedDefaultAdaptableModelPath;
+ (id)getDeployedAdaptableCompiledMLModelPath;
+ (id)getDeployedCompiledMLModelPath;
+ (id)getDeployedCompiledMLModelPathForContactRanker;
+ (id)getIntermediateAdaptableCompiledMLModel;
+ (id)getTrialCompiledAdaptableMLModelPath;
+ (id)getTrialCompiledMLModelPath;
+ (id)getTrialCompiledMLModelPathForContactRanker;
+ (id)getZippedDefaultAdaptableModelPath;
+ (id)loadAdaptableModelConfig:(id)a3;
+ (id)loadMLModel:(id)a3 modelConfig:(id)a4;
+ (id)loadMLModelConfigurationWithConfigDict:(id)a3;
+ (id)predictWithMLModel:(id)a3 featureDictArray:(id)a4;
+ (id)reformatFeaturesInFeatureDictArray:(id)a3;
+ (id)reformatFeaturesInFeaturizedBehaviorRuleArray:(id)a3;
+ (id)unzipFileWithPath:(id)a3 toFileName:(id)a4 toFolderPath:(id)a5;
@end

@implementation _PSBehaviorRuleRankingUtilities

+ (id)getTrialCompiledMLModelPath
{
  v2 = [MEMORY[0x1E4F5B420] peopleDirectory];
  v3 = [v2 stringByAppendingString:@"TrialRuleImportancePredictor.mlmodelc"];

  return v3;
}

+ (id)getTrialCompiledMLModelPathForContactRanker
{
  v2 = [MEMORY[0x1E4F5B420] peopleDirectory];
  v3 = [v2 stringByAppendingString:@"TrialContactRankerModel.mlmodelc"];

  return v3;
}

+ (id)getTrialCompiledAdaptableMLModelPath
{
  return (id)[@"/var/tmp/com.apple.siri-distributed-evaluation/" stringByAppendingString:@"TrialAdaptableRuleImportancePredictor.mlmodelc"];
}

+ (id)getAdaptedCompiledMLModelPath
{
  return (id)[@"/var/tmp/com.apple.siri-distributed-evaluation/" stringByAppendingString:@"AdaptedRuleImportancePredictor.mlmodelc"];
}

+ (id)getDeployedCompiledMLModelPath
{
  return (id)[@"/System/Library/PrivateFrameworks/PeopleSuggester.framework/" stringByAppendingString:@"RuleImportancePredictor.mlmodelc"];
}

+ (id)getDeployedCompiledMLModelPathForContactRanker
{
  return (id)[@"/System/Library/PrivateFrameworks/PeopleSuggester.framework/" stringByAppendingString:@"ContactRankerModel.mlmodelc"];
}

+ (id)getDeployedAdaptableCompiledMLModelPath
{
  return (id)[@"/var/tmp/com.apple.siri-distributed-evaluation/" stringByAppendingString:@"AdaptableRuleImportancePredictor.mlmodelc"];
}

+ (id)getIntermediateAdaptableCompiledMLModel
{
  return (id)[@"/var/tmp/com.apple.siri-distributed-evaluation/" stringByAppendingString:@"IntermediateAdaptableModel.mlmodelc"];
}

+ (id)getAdaptedModelRecipeVersionFilePath
{
  return (id)[@"/var/tmp/com.apple.siri-distributed-evaluation/" stringByAppendingString:@"adaptedModelRecipeVersion.txt"];
}

+ (id)getArchivedDefaultAdaptableModelPath
{
  return (id)[@"/System/Library/DistributedEvaluation/Plugins/PeopleSuggesterDESPlugin.desPlugin/" stringByAppendingString:@"AdaptableRuleImportancePredictor.mlmodelc.archivedMLModel"];
}

+ (id)getZippedDefaultAdaptableModelPath
{
  return (id)[@"/var/tmp/com.apple.siri-distributed-evaluation/" stringByAppendingString:@"AdaptableRuleImportancePredictor.mlmodelc.zip"];
}

+ (id)loadAdaptableModelConfig:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v3;
    _os_log_impl(&dword_1A314B000, v4, OS_LOG_TYPE_INFO, "loadAdaptableModelConfig is invoked with config file path: %@", buf, 0xCu);
  }

  v5 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v3];
  id v12 = 0;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v5 error:&v12];
  id v7 = v12;
  v8 = +[_PSLogging generalChannel];
  v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v3;
      _os_log_impl(&dword_1A314B000, v9, OS_LOG_TYPE_INFO, "Loaded adaptable model config from:%@", buf, 0xCu);
    }

    id v10 = v6;
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[_PSBehaviorRuleRankingUtilities loadAdaptableModelConfig:]();
    }
  }

  return v6;
}

+ (id)loadMLModelConfigurationWithConfigDict:(id)a3
{
  v36[6] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    uint64_t v31 = 0;
    v32 = &v31;
    uint64_t v33 = 0x2050000000;
    v4 = (void *)getMLModelConfigurationClass_softClass_0;
    uint64_t v34 = getMLModelConfigurationClass_softClass_0;
    if (!getMLModelConfigurationClass_softClass_0)
    {
      CoreMLLibraryCore_4();
      v32[3] = (uint64_t)objc_getClass("MLModelConfiguration");
      getMLModelConfigurationClass_softClass_0 = v32[3];
      v4 = (void *)v32[3];
    }
    v5 = v4;
    _Block_object_dispose(&v31, 8);
    id v30 = objc_alloc_init(v5);
    [v30 setComputeUnits:0];
    v6 = [v3 objectForKeyedSubscript:@"numClasses"];
    uint64_t v7 = [v6 integerValue];

    v8 = [v3 objectForKeyedSubscript:@"numTrees"];
    uint64_t v9 = [v8 integerValue];

    id v10 = [v3 objectForKeyedSubscript:@"maxDepth"];
    uint64_t v11 = [v10 integerValue];

    id v12 = [v3 objectForKeyedSubscript:@"learningRate"];
    [v12 doubleValue];
    double v14 = v13;

    uint64_t v15 = [v3 objectForKeyedSubscript:@"minChildWeight"];
    uint64_t v16 = [v15 integerValue];

    v29 = [getMLParameterKeyClass() numClasses];
    v35[0] = v29;
    v28 = [NSNumber numberWithInteger:v7];
    v36[0] = v28;
    v27 = [getMLParameterKeyClass() numTrees];
    v35[1] = v27;
    v17 = [NSNumber numberWithInteger:v9];
    v36[1] = v17;
    v18 = [getMLParameterKeyClass() maxDepth];
    v35[2] = v18;
    v19 = [NSNumber numberWithInteger:v11];
    v36[2] = v19;
    v20 = [getMLParameterKeyClass() learningRate];
    v35[3] = v20;
    v21 = [NSNumber numberWithDouble:v14];
    v36[3] = v21;
    v22 = [getMLParameterKeyClass() minChildWeight];
    v35[4] = v22;
    v23 = [NSNumber numberWithInteger:v16];
    v36[4] = v23;
    v24 = [getMLParameterKeyClass() objective];
    v35[5] = v24;
    v36[5] = @"binary:logistic";
    v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:6];
    [v30 setParameters:v25];
  }
  else
  {
    id v30 = 0;
  }

  return v30;
}

+ (id)loadMLModel:(id)a3 modelConfig:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v5;
    _os_log_impl(&dword_1A314B000, v7, OS_LOG_TYPE_INFO, "loadMLModel is invoked with model path: %@", buf, 0xCu);
  }

  id v8 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  if ([v8 fileExistsAtPath:v5])
  {
    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:v5];
    id v10 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v9;
      _os_log_impl(&dword_1A314B000, v10, OS_LOG_TYPE_INFO, "Trying to load model with compiled model path: %@", buf, 0xCu);
    }

    id MLModelClass_0 = getMLModelClass_0();
    if (v6)
    {
      uint64_t v20 = 0;
      id v12 = (id *)&v20;
      uint64_t v13 = [MLModelClass_0 modelWithContentsOfURL:v9 configuration:v6 error:&v20];
    }
    else
    {
      uint64_t v19 = 0;
      id v12 = (id *)&v19;
      uint64_t v13 = [MLModelClass_0 modelWithContentsOfURL:v9 error:&v19];
    }
    double v14 = (void *)v13;
    id v15 = *v12;
    uint64_t v16 = v15;
    if (!v14 || v15)
    {
      v17 = +[_PSLogging generalChannel];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        +[_PSBehaviorRuleRankingUtilities loadMLModel:modelConfig:]();
      }
    }
  }
  else
  {
    double v14 = 0;
  }

  return v14;
}

+ (id)reformatFeaturesInFeaturizedBehaviorRuleArray:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v27 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if ((unint64_t)[v3 count] >= 2)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v5 = [v3 objectAtIndexedSubscript:0];
    id v6 = [v5 features];

    uint64_t v7 = [v6 countByEnumeratingWithState:&v37 objects:v43 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v38 != v9) {
            objc_enumerationMutation(v6);
          }
          [v4 addObject:*(void *)(*((void *)&v37 + 1) + 8 * i)];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v37 objects:v43 count:16];
      }
      while (v8);
    }

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    obuint64_t j = v4;
    uint64_t v28 = [obj countByEnumeratingWithState:&v33 objects:v42 count:16];
    if (v28)
    {
      uint64_t v26 = *(void *)v34;
      do
      {
        for (uint64_t j = 0; j != v28; ++j)
        {
          if (*(void *)v34 != v26) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void *)(*((void *)&v33 + 1) + 8 * j);
          id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          long long v29 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          id v14 = v3;
          id v15 = v3;
          uint64_t v16 = [v15 countByEnumeratingWithState:&v29 objects:v41 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = *(void *)v30;
            do
            {
              for (uint64_t k = 0; k != v17; ++k)
              {
                if (*(void *)v30 != v18) {
                  objc_enumerationMutation(v15);
                }
                uint64_t v20 = [*(id *)(*((void *)&v29 + 1) + 8 * k) features];
                v21 = [v20 objectForKeyedSubscript:v12];
                [v13 addObject:v21];
              }
              uint64_t v17 = [v15 countByEnumeratingWithState:&v29 objects:v41 count:16];
            }
            while (v17);
          }

          id v22 = (void *)[v13 copy];
          [v27 setObject:v22 forKeyedSubscript:v12];

          id v3 = v14;
        }
        uint64_t v28 = [obj countByEnumeratingWithState:&v33 objects:v42 count:16];
      }
      while (v28);
    }
  }
  uint64_t v23 = (void *)[v27 copy];

  return v23;
}

+ (id)reformatFeaturesInFeatureDictArray:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v27 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if ((unint64_t)[v3 count] >= 2)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v5 = [v3 objectAtIndexedSubscript:0];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v36 objects:v42 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v37 != v8) {
            objc_enumerationMutation(v5);
          }
          [v4 addObject:*(void *)(*((void *)&v36 + 1) + 8 * i)];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v36 objects:v42 count:16];
      }
      while (v7);
    }

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    obuint64_t j = v4;
    uint64_t v10 = [obj countByEnumeratingWithState:&v32 objects:v41 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v26 = *(void *)v33;
      do
      {
        for (uint64_t j = 0; j != v11; ++j)
        {
          if (*(void *)v33 != v26) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void *)(*((void *)&v32 + 1) + 8 * j);
          id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          long long v28 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          id v15 = v3;
          id v16 = v3;
          uint64_t v17 = [v16 countByEnumeratingWithState:&v28 objects:v40 count:16];
          if (v17)
          {
            uint64_t v18 = v17;
            uint64_t v19 = *(void *)v29;
            do
            {
              for (uint64_t k = 0; k != v18; ++k)
              {
                if (*(void *)v29 != v19) {
                  objc_enumerationMutation(v16);
                }
                v21 = [*(id *)(*((void *)&v28 + 1) + 8 * k) objectForKeyedSubscript:v13];
                [v14 addObject:v21];
              }
              uint64_t v18 = [v16 countByEnumeratingWithState:&v28 objects:v40 count:16];
            }
            while (v18);
          }

          id v22 = (void *)[v14 copy];
          [v27 setObject:v22 forKeyedSubscript:v13];

          id v3 = v15;
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v32 objects:v41 count:16];
      }
      while (v11);
    }
  }
  uint64_t v23 = (void *)[v27 copy];

  return v23;
}

+ (id)predictWithMLModel:(id)a3 featureDictArray:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v29;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v29 != v11) {
        objc_enumerationMutation(v8);
      }
      uint64_t v13 = *(void *)(*((void *)&v28 + 1) + 8 * v12);
      id v14 = objc_alloc((Class)getMLDictionaryFeatureProviderClass_1());
      id v27 = 0;
      id v15 = (void *)[v14 initWithDictionary:v13 error:&v27];
      id v16 = v27;
      if (v16) {
        break;
      }
      id v26 = 0;
      uint64_t v17 = [v5 predictionFromFeatures:v15 error:&v26];
      id v18 = v26;
      if (v18)
      {
        uint64_t v23 = v18;
        v24 = +[_PSLogging generalChannel];
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          +[_PSBehaviorRuleRankingUtilities predictWithMLModel:featureDictArray:]();
        }

LABEL_18:
        id v22 = 0;
        goto LABEL_19;
      }
      uint64_t v19 = [v17 featureValueForName:@"classProbability"];
      uint64_t v20 = [v19 dictionaryValue];

      if ([v20 count] == 2)
      {
        v21 = [v20 objectForKeyedSubscript:&unk_1EF6754F8];
        [v7 addObject:v21];
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
        if (v10) {
          goto LABEL_3;
        }
        goto LABEL_12;
      }
    }
    uint64_t v23 = v16;
    uint64_t v17 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      +[_PSBehaviorRuleRankingUtilities predictWithMLModel:featureDictArray:]();
    }
    goto LABEL_18;
  }
LABEL_12:

  id v22 = (void *)[v7 copy];
LABEL_19:

  return v22;
}

+ (id)batchPredictWithMLModel:(id)a3 featureArrayDict:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v22 = 0;
  id v8 = (void *)[objc_alloc((Class)getMLArrayBatchProviderClass()) initWithDictionary:v6 error:&v22];
  id v9 = v22;
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[_PSBehaviorRuleRankingUtilities batchPredictWithMLModel:featureArrayDict:]();
    }
LABEL_8:
    uint64_t v13 = 0;
    goto LABEL_9;
  }
  id v21 = 0;
  uint64_t v11 = [v5 predictionsFromBatch:v8 error:&v21];
  id v10 = v21;
  if (v10)
  {
    uint64_t v12 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      +[_PSBehaviorRuleRankingUtilities batchPredictWithMLModel:featureArrayDict:]();
    }

    goto LABEL_8;
  }
  id v20 = v5;
  if ([v11 count] >= 1)
  {
    uint64_t v15 = 0;
    do
    {
      id v16 = [v11 featuresAtIndex:v15];
      uint64_t v17 = [v16 featureValueForName:@"classProbability"];
      id v18 = [v17 dictionaryValue];

      if ([v18 count] == 2)
      {
        uint64_t v19 = [v18 objectForKeyedSubscript:&unk_1EF6754F8];
        [v7 addObject:v19];
      }
      ++v15;
    }
    while (v15 < [v11 count]);
  }
  uint64_t v13 = (void *)[v7 copy];
  id v5 = v20;
LABEL_9:

  return v13;
}

+ (id)batchPredictWithAdaptedMLModel:(id)a3 psConfigForAdaptableModel:(id)a4 featurizedRules:(id)a5
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v39 = a3;
  id v7 = a4;
  id v8 = a5;
  long long v40 = v7;
  id v41 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v9 = [v7 objectForKeyedSubscript:@"_PSRuleMiningModelFeatureSet"];
  v46 = [MEMORY[0x1E4F1CA48] array];
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v10 = v8;
  uint64_t v45 = [v10 countByEnumeratingWithState:&v52 objects:v57 count:16];
  if (v45)
  {
    obuint64_t j = v10;
    uint64_t v44 = *(void *)v53;
    while (2)
    {
      for (uint64_t i = 0; i != v45; ++i)
      {
        if (*(void *)v53 != v44) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v52 + 1) + 8 * i);
        uint64_t v13 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
        id v14 = objc_alloc((Class)getMLMultiArrayClass_0());
        uint64_t v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
        v56 = v15;
        id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v56 count:1];
        id v51 = 0;
        uint64_t v17 = (void *)[v14 initWithShape:v16 dataType:65568 error:&v51];
        id v18 = v51;

        if (v18)
        {
          id v26 = +[_PSLogging generalChannel];
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
            +[_PSBehaviorRuleRankingUtilities batchPredictWithAdaptedMLModel:psConfigForAdaptableModel:featurizedRules:]();
          }
          goto LABEL_22;
        }
        if ([v9 count])
        {
          unint64_t v19 = 0;
          do
          {
            id v20 = [v12 features];
            id v21 = [v9 objectAtIndexedSubscript:v19];
            id v22 = [v20 objectForKeyedSubscript:v21];

            uint64_t v23 = NSNumber;
            [v22 floatValue];
            v24 = objc_msgSend(v23, "numberWithFloat:");
            [v17 setObject:v24 atIndexedSubscript:v19];

            ++v19;
          }
          while (v19 < [v9 count]);
        }
        [v13 setObject:v17 forKeyedSubscript:@"input"];
        id v25 = objc_alloc((Class)getMLDictionaryFeatureProviderClass_1());
        id v50 = 0;
        id v26 = [v25 initWithDictionary:v13 error:&v50];
        id v27 = v50;
        if (v27)
        {
          id v18 = v27;
          long long v32 = +[_PSLogging generalChannel];
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
            +[_PSBehaviorRuleRankingUtilities batchPredictWithAdaptedMLModel:psConfigForAdaptableModel:featurizedRules:](&buf, v49, v32);
          }

LABEL_22:
          long long v29 = v39;
          id v10 = obj;

          long long v31 = 0;
          long long v28 = obj;
          goto LABEL_23;
        }
        [v46 addObject:v26];
      }
      id v10 = obj;
      uint64_t v45 = [obj countByEnumeratingWithState:&v52 objects:v57 count:16];
      if (v45) {
        continue;
      }
      break;
    }
  }

  long long v28 = (void *)[objc_alloc((Class)getMLArrayBatchProviderClass()) initWithFeatureProviderArray:v46];
  id v47 = 0;
  long long v29 = v39;
  uint64_t v13 = [v39 predictionsFromBatch:v28 error:&v47];
  id v18 = v47;
  if (v18)
  {
    long long v30 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      +[_PSBehaviorRuleRankingUtilities batchPredictWithAdaptedMLModel:psConfigForAdaptableModel:featurizedRules:]();
    }

    long long v31 = 0;
  }
  else
  {
    id obja = v10;
    if ([v13 count] >= 1)
    {
      uint64_t v34 = 0;
      do
      {
        long long v35 = [v13 featuresAtIndex:v34];
        long long v36 = [v35 featureValueForName:@"classProbability"];
        long long v37 = [v36 dictionaryValue];

        if ([v37 count] == 2)
        {
          long long v38 = [v37 objectForKeyedSubscript:&unk_1EF6754F8];
          [v41 addObject:v38];
        }
        ++v34;
      }
      while (v34 < [v13 count]);
    }
    long long v31 = (void *)[v41 copy];
    id v10 = obja;
  }
LABEL_23:

  return v31;
}

+ (id)batchPredictWithAdaptedMLModel:(id)a3 psConfigForAdaptableModel:(id)a4 featureDictArray:(id)a5
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v43 = a3;
  id v7 = a4;
  id v8 = a5;
  id v44 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v42 = v7;
  id v9 = [v7 objectForKeyedSubscript:@"_PSRuleMiningModelFeatureSet"];
  id v47 = [MEMORY[0x1E4F1CA48] array];
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  obuint64_t j = v8;
  uint64_t v10 = [obj countByEnumeratingWithState:&v53 objects:v58 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v46 = *(void *)v54;
    id v41 = v50;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v54 != v46) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        id v14 = objc_msgSend(MEMORY[0x1E4F1CC08], "mutableCopy", v41);
        id v15 = objc_alloc((Class)getMLMultiArrayClass_0());
        id v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
        v57 = v16;
        uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v57 count:1];
        id v52 = 0;
        id v18 = (void *)[v15 initWithShape:v17 dataType:65568 error:&v52];
        id v19 = v52;

        if (v19)
        {
          id v26 = +[_PSLogging generalChannel];
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
            +[_PSBehaviorRuleRankingUtilities batchPredictWithAdaptedMLModel:psConfigForAdaptableModel:featurizedRules:]();
          }
          goto LABEL_22;
        }
        if ([v9 count])
        {
          unint64_t v20 = 0;
          do
          {
            id v21 = [v9 objectAtIndexedSubscript:v20];
            id v22 = [v13 objectForKeyedSubscript:v21];

            uint64_t v23 = NSNumber;
            [v22 floatValue];
            v24 = objc_msgSend(v23, "numberWithFloat:");
            [v18 setObject:v24 atIndexedSubscript:v20];

            ++v20;
          }
          while (v20 < [v9 count]);
        }
        [v14 setObject:v18 forKeyedSubscript:@"input"];
        id v25 = objc_alloc((Class)getMLDictionaryFeatureProviderClass_1());
        id v51 = 0;
        id v26 = [v25 initWithDictionary:v14 error:&v51];
        id v27 = v51;
        if (v27)
        {
          id v19 = v27;
          uint64_t v34 = +[_PSLogging generalChannel];
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
            +[_PSBehaviorRuleRankingUtilities batchPredictWithAdaptedMLModel:psConfigForAdaptableModel:featurizedRules:](&buf, v41, v34);
          }

LABEL_22:
          uint64_t v33 = v42;
          long long v30 = v43;
          long long v28 = obj;

          long long v32 = 0;
          long long v29 = obj;
          goto LABEL_23;
        }
        [v47 addObject:v26];
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v53 objects:v58 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  long long v28 = obj;

  long long v29 = (void *)[objc_alloc((Class)getMLArrayBatchProviderClass()) initWithFeatureProviderArray:v47];
  id v48 = 0;
  long long v30 = v43;
  id v14 = [v43 predictionsFromBatch:v29 error:&v48];
  id v19 = v48;
  if (v19)
  {
    long long v31 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      +[_PSBehaviorRuleRankingUtilities batchPredictWithAdaptedMLModel:psConfigForAdaptableModel:featurizedRules:]();
    }

    long long v32 = 0;
    uint64_t v33 = v42;
  }
  else
  {
    if ([v14 count] >= 1)
    {
      uint64_t v36 = 0;
      do
      {
        long long v37 = [v14 featuresAtIndex:v36];
        long long v38 = [v37 featureValueForName:@"classProbability"];
        id v39 = [v38 dictionaryValue];

        if ([v39 count] == 2)
        {
          long long v40 = [v39 objectForKeyedSubscript:&unk_1EF6754F8];
          [v44 addObject:v40];
        }
        ++v36;
      }
      while (v36 < [v14 count]);
    }
    long long v32 = (void *)[v44 copy];
    uint64_t v33 = v42;
    long long v28 = obj;
  }
LABEL_23:

  return v32;
}

+ (BOOL)removeFolderAtPath:(id)a3
{
  id v3 = a3;
  char v12 = 0;
  id v4 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  if ([v4 fileExistsAtPath:v3 isDirectory:&v12]) {
    BOOL v5 = v12 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5 || (id v11 = 0, [v4 removeItemAtPath:v3 error:&v11], (v6 = v11) == 0))
  {
    BOOL v9 = 1;
  }
  else
  {
    id v7 = v6;
    id v8 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[_PSInteractionPredictor removeMlmodelcFolderAtPath:]();
    }

    BOOL v9 = 0;
  }

  return v9;
}

+ (BOOL)copyFileFromURL:(id)a3 toURL:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  id v12 = 0;
  char v8 = [v7 copyItemAtURL:v5 toURL:v6 error:&v12];
  id v9 = v12;
  if ((v8 & 1) == 0)
  {
    uint64_t v10 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint8_t buf = 138412802;
      id v14 = v5;
      __int16 v15 = 2112;
      id v16 = v6;
      __int16 v17 = 2112;
      id v18 = v9;
      _os_log_error_impl(&dword_1A314B000, v10, OS_LOG_TYPE_ERROR, "Failed to copy file with path:%@ to path:%@, with error：%@", buf, 0x20u);
    }
  }
  return v8;
}

+ (id)compileMLModelAtPath:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v3];
  id v11 = 0;
  id v5 = [getMLModelClass_0() compileModelAtURL:v4 error:&v11];
  id v6 = v11;
  id v7 = v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (!v8)
  {
    id v9 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[_PSBehaviorRuleRankingUtilities compileMLModelAtPath:]();
    }
  }

  return v5;
}

+ (id)unzipFileWithPath:(id)a3 toFileName:(id)a4 toFolderPath:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  id v9 = (objc_class *)MEMORY[0x1E4F1CB10];
  id v10 = a3;
  id v11 = (void *)[[v9 alloc] initFileURLWithPath:v10];

  id v12 = (NSURL *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:v8];
  id v13 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v11];
  uint64_t v14 = _PSUnarchiverZip((const void *)[v13 bytes], objc_msgSend(v13, "length"), v12);
  __int16 v15 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    id v16 = [NSNumber numberWithBool:v14];
    int v28 = 138412290;
    long long v29 = v16;
    _os_log_impl(&dword_1A314B000, v15, OS_LOG_TYPE_INFO, "_PSUnarchiverZip returned %@", (uint8_t *)&v28, 0xCu);
  }
  if (v14)
  {
    id v17 = objc_alloc(MEMORY[0x1E4F1CB10]);
    id v18 = [v8 stringByAppendingString:v7];
    uint64_t v19 = (void *)[v17 initFileURLWithPath:v18];
  }
  else
  {
    id v18 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      +[_PSBehaviorRuleRankingUtilities unzipFileWithPath:toFileName:toFolderPath:](v18, v20, v21, v22, v23, v24, v25, v26);
    }
    uint64_t v19 = 0;
  }

  return v19;
}

+ (BOOL)copyZippedAdaptableModel:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    id v4 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      +[_PSBehaviorRuleRankingUtilities copyZippedAdaptableModel:]();
    }
    goto LABEL_10;
  }
  id v4 = +[_PSBehaviorRuleRankingUtilities getTrialCompiledAdaptableMLModelPath];
  if (!+[_PSBehaviorRuleRankingUtilities removeFolderAtPath:v4])
  {
LABEL_10:
    BOOL v6 = 0;
    goto LABEL_11;
  }
  id v5 = +[_PSBehaviorRuleRankingUtilities unzipFileWithPath:v3 toFileName:@"TrialAdaptableRuleImportancePredictor.mlmodelc" toFolderPath:@"/var/tmp/com.apple.siri-distributed-evaluation/"];
  BOOL v6 = v5 != 0;
  if (!v5)
  {
    id v7 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[_PSBehaviorRuleRankingUtilities copyZippedAdaptableModel:]();
    }
  }
LABEL_11:

  return v6;
}

+ (BOOL)loadDeployedAdaptableModelUnderDirectory:(id)a3
{
  id v3 = a3;
  char v36 = 0;
  id v4 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  id v5 = +[_PSBehaviorRuleRankingUtilities getDeployedAdaptableCompiledMLModelPath];
  if ([v4 fileExistsAtPath:v5 isDirectory:&v36]) {
    BOOL v6 = v36 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    id v7 = [v3 stringByAppendingString:@"AdaptableRuleImportancePredictor.mlmodelc.archivedMLModel"];
    if (([v4 fileExistsAtPath:v7] & 1) == 0)
    {
      id v8 = +[_PSLogging generalChannel];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        +[_PSBehaviorRuleRankingUtilities loadDeployedAdaptableModelUnderDirectory:]((uint64_t)v7, v8, v12, v13, v14, v15, v16, v17);
      }
      id v9 = 0;
      BOOL v10 = 0;
      goto LABEL_23;
    }
    id v8 = +[_PSBehaviorRuleRankingUtilities getZippedDefaultAdaptableModelPath];
    if ([v4 fileExistsAtPath:v8])
    {
      id v9 = 0;
    }
    else
    {
      [v4 createDirectoryAtPath:@"/var/tmp/com.apple.siri-distributed-evaluation/" withIntermediateDirectories:1 attributes:0 error:0];
      id v34 = 0;
      char v18 = [v4 copyItemAtPath:v7 toPath:v8 error:&v34];
      id v9 = v34;
      if ((v18 & 1) == 0)
      {
        uint64_t v19 = +[_PSLogging generalChannel];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          +[_PSBehaviorRuleRankingUtilities loadDeployedAdaptableModelUnderDirectory:]((uint64_t)v9, v19, v27, v28, v29, v30, v31, v32);
        }
        goto LABEL_21;
      }
    }
    uint64_t v19 = +[_PSBehaviorRuleRankingUtilities unzipFileWithPath:v8 toFileName:@"AdaptableRuleImportancePredictor.mlmodelc" toFolderPath:@"/var/tmp/com.apple.siri-distributed-evaluation/"];
    BOOL v10 = v19 != 0;
    if (v19)
    {
LABEL_22:

LABEL_23:
      goto LABEL_24;
    }
    uint64_t v20 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      +[_PSBehaviorRuleRankingUtilities loadDeployedAdaptableModelUnderDirectory:]((uint64_t)v8, v20, v21, v22, v23, v24, v25, v26);
    }

LABEL_21:
    BOOL v10 = 0;
    goto LABEL_22;
  }
  id v9 = +[_PSLogging generalChannel];
  BOOL v10 = 1;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint8_t buf = 0;
    _os_log_impl(&dword_1A314B000, v9, OS_LOG_TYPE_INFO, "Deployed adaptable ML model already exist, no need to unzip", buf, 2u);
  }
LABEL_24:

  return v10;
}

+ (void)loadAdaptableModelConfig:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7(&dword_1A314B000, v0, v1, "Failed to load adaptable model config with path:%@, with error：%@");
}

+ (void)loadMLModel:modelConfig:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7(&dword_1A314B000, v0, v1, "ML model load: failed to load ml model with path:%@, with error：%@");
}

+ (void)predictWithMLModel:featureDictArray:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1A314B000, v0, v1, "predictWithMLModel - predictionFromFeatures failure", v2, v3, v4, v5, v6);
}

+ (void)predictWithMLModel:featureDictArray:.cold.2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1A314B000, v0, v1, "predictWithMLModel - feature extraction MLDictionaryFeatureProvider:initWithDictionary failure", v2, v3, v4, v5, v6);
}

+ (void)batchPredictWithMLModel:featureArrayDict:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1A314B000, v0, v1, "batchPredictWithMLModel - predictionsFromBatch failure", v2, v3, v4, v5, v6);
}

+ (void)batchPredictWithMLModel:featureArrayDict:.cold.2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1A314B000, v0, v1, "batchPredictWithMLModel - feature extraction MLArrayBatchProvider:initWithDictionary failure", v2, v3, v4, v5, v6);
}

+ (void)batchPredictWithAdaptedMLModel:psConfigForAdaptableModel:featurizedRules:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1A314B000, v0, v1, "_PSRuleRankingMLModel - People Suggester ML model, predictionsFromBatch failure", v2, v3, v4, v5, v6);
}

+ (void)batchPredictWithAdaptedMLModel:(uint8_t *)buf psConfigForAdaptableModel:(unsigned char *)a2 featurizedRules:(os_log_t)log .cold.2(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *uint8_t buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1A314B000, log, OS_LOG_TYPE_ERROR, "_PSRuleRankingMLModel - People Suggester feature extraction MLDictionaryFeatureProvider:initWithDictionary failure", buf, 2u);
}

+ (void)batchPredictWithAdaptedMLModel:psConfigForAdaptableModel:featurizedRules:.cold.3()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1A314B000, v0, v1, "batchPredictWithAdaptedMLModel - MLMultiArray creation failure", v2, v3, v4, v5, v6);
}

+ (void)compileMLModelAtPath:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7(&dword_1A314B000, v0, v1, "Failed to compile ml model with path:%@, with error：%@");
}

+ (void)unzipFileWithPath:(uint64_t)a3 toFileName:(uint64_t)a4 toFolderPath:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)copyZippedAdaptableModel:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1A314B000, v0, v1, "Zipped Adaptable ML model copy attempted with null path", v2, v3, v4, v5, v6);
}

+ (void)copyZippedAdaptableModel:.cold.2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1A314B000, v0, v1, "Zipped Adaptable ML model copy failed", v2, v3, v4, v5, v6);
}

+ (void)loadDeployedAdaptableModelUnderDirectory:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)loadDeployedAdaptableModelUnderDirectory:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)loadDeployedAdaptableModelUnderDirectory:(uint64_t)a3 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end