@interface _PSPersonalizationEvaluation
- (BOOL)cloneAdaptableModel:(id)a3 toFilePath:(id)a4 originalXgboostModelName:(id)a5 clonedXgboostModelName:(id)a6;
- (BOOL)evaluateIsInvokedOnce;
- (BOOL)performPrerequisitesBeforeAdaptationWithFeaturesConfigDeployPath:(id)a3;
- (MLModelConfiguration)adaptableModelConfiguration;
- (NSDictionary)recipe;
- (NSDictionary)selectedFeaturesConfig;
- (NSMutableArray)results;
- (NSMutableDictionary)featureNameDict;
- (NSMutableDictionary)modelTagToCandidateModel;
- (NSMutableDictionary)modelTagToHyperparameters;
- (NSNumber)accuracyGainThresholdForSwap;
- (NSNumber)batchSize;
- (NSNumber)engagementRateGainThresholdForSwap;
- (NSNumber)epoc;
- (NSNumber)evaluationIterationCount;
- (NSNumber)learningRate;
- (NSNumber)maxDepth;
- (NSNumber)minChildWeight;
- (NSNumber)minSampleCountForAdaptation;
- (NSNumber)minimumTestDataSizeForSwap;
- (NSNumber)numClasses;
- (NSNumber)numTrees;
- (NSNumber)recipeID;
- (NSNumber)swapOK;
- (NSNumber)testSplitPercent;
- (NSNumber)topN;
- (NSString)adaptableModelDeployPath;
- (NSURL)intermediateCompiledModelURL;
- (NSUserDefaults)psAdaptationDefaults;
- (ODCurareEvaluationAndReportingModule)curareEvaluationAndReporting;
- (_DKKnowledgeQuerying)knowledgeStore;
- (_PSPersonalizationEvaluation)initWithRecipe:(id)a3 knowledgeStore:(id)a4 shouldContinueBlock:(id)a5;
- (id)_getDataStatistics:(id)a3 forData:(id)a4;
- (id)createMLArrayBatchProviderWithMLModelType:(id)a3 withDataArray:(id)a4;
- (id)createMLFeatureProviderArrayFromSingleShareEventData:(id)a3 forMLModel:(id)a4;
- (id)evaluateWithModel:(id)a3;
- (id)hyperparametersForCandidateModel:(id)a3;
- (id)loadAdaptableModelUnderDirectory:(id)a3;
- (id)loadDefaultModel;
- (id)personalizeModel:(id)a3;
- (id)processDataWithQuery:(id)a3 balanceNeed:(BOOL)a4;
- (id)runAdaptationAndEvaluation;
- (id)runAdaptationAndEvaluationWithFeaturesConfigDeployPath:(id)a3 adaptableModelDeployPath:(id)a4;
- (id)shouldContinue;
- (int64_t)adaptationStrategy;
- (void)adaptMLModel:(id)a3 withMLModelType:(id)a4 withDataArray:(id)a5 modelConfiguration:(id)a6;
- (void)adaptMLModel:(id)a3 withTrainingData:(id)a4 modelConfiguration:(id)a5;
- (void)generateCandidateModels;
- (void)loadDefaultModel;
- (void)setAccuracyGainThresholdForSwap:(id)a3;
- (void)setAdaptableModelConfiguration:(id)a3;
- (void)setAdaptableModelDeployPath:(id)a3;
- (void)setAdaptationStrategy:(int64_t)a3;
- (void)setBatchSize:(id)a3;
- (void)setCurareEvaluationAndReporting:(id)a3;
- (void)setEngagementRateGainThresholdForSwap:(id)a3;
- (void)setEpoc:(id)a3;
- (void)setEvaluateIsInvokedOnce:(BOOL)a3;
- (void)setEvaluationIterationCount:(id)a3;
- (void)setFeatureNameDict:(id)a3;
- (void)setIntermediateCompiledModelURL:(id)a3;
- (void)setKnowledgeStore:(id)a3;
- (void)setLastDayOfAdaptation:(id)a3;
- (void)setLearningRate:(id)a3;
- (void)setMaxDepth:(id)a3;
- (void)setMinChildWeight:(id)a3;
- (void)setMinSampleCountForAdaptation:(id)a3;
- (void)setMinimumTestDataSizeForSwap:(id)a3;
- (void)setModelTagToCandidateModel:(id)a3;
- (void)setModelTagToHyperparameters:(id)a3;
- (void)setNumClasses:(id)a3;
- (void)setNumTrees:(id)a3;
- (void)setParametersForHyperparmeters:(id)a3;
- (void)setParametersFromRecipe;
- (void)setParametersFromRecipeForCandidateModel:(id)a3;
- (void)setPsAdaptationDefaults:(id)a3;
- (void)setRecipeID:(id)a3;
- (void)setResults:(id)a3;
- (void)setSelectedFeaturesConfig:(id)a3;
- (void)setShouldContinue:(id)a3;
- (void)setSwapOK:(id)a3;
- (void)setTestSplitPercent:(id)a3;
- (void)setTopN:(id)a3;
- (void)updateAdaptableModelConfigWithUpdateType:(int64_t)a3 numTrees:(id)a4;
@end

@implementation _PSPersonalizationEvaluation

- (_PSPersonalizationEvaluation)initWithRecipe:(id)a3 knowledgeStore:(id)a4 shouldContinueBlock:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)_PSPersonalizationEvaluation;
  v12 = [(_PSPersonalizationEvaluation *)&v23 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_recipe, a3);
    objc_storeStrong((id *)&v13->_knowledgeStore, a4);
    os_log_t v14 = os_log_create("com.apple.PeopleSuggester.personalization", "general");
    v15 = (void *)personalizationLog;
    personalizationLog = (uint64_t)v14;

    uint64_t v16 = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.PeopleSuggester.personalization"];
    psAdaptationDefaults = v13->_psAdaptationDefaults;
    v13->_psAdaptationDefaults = (NSUserDefaults *)v16;

    uint64_t v18 = MEMORY[0x1A6243AD0](v11);
    id shouldContinue = v13->_shouldContinue;
    v13->_id shouldContinue = (id)v18;

    v13->_evaluateIsInvokedOnce = 0;
    v20 = personalizationLog;
    if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_1A314B000, v20, OS_LOG_TYPE_INFO, "Init successfully", v22, 2u);
    }
  }

  return v13;
}

- (void)setLastDayOfAdaptation:(id)a3
{
  id v4 = a3;
  id v5 = [(_PSPersonalizationEvaluation *)self psAdaptationDefaults];
  [v5 setObject:v4 forKey:@"LastAdaptationDate"];
}

- (void)setParametersFromRecipe
{
  [(_PSPersonalizationEvaluation *)self setEvaluationIterationCount:&unk_1EF675540];
  v3 = [(_PSPersonalizationEvaluation *)self recipe];
  id v4 = [v3 valueForKey:@"evaluationIterationCount"];

  if (v4)
  {
    id v5 = [(_PSPersonalizationEvaluation *)self recipe];
    v6 = [v5 objectForKeyedSubscript:@"evaluationIterationCount"];
    [(_PSPersonalizationEvaluation *)self setEvaluationIterationCount:v6];
  }
  [(_PSPersonalizationEvaluation *)self setTestSplitPercent:&unk_1EF675558];
  v7 = [(_PSPersonalizationEvaluation *)self recipe];
  v8 = [v7 valueForKey:@"testSplitPercent"];

  if (v8)
  {
    id v9 = [(_PSPersonalizationEvaluation *)self recipe];
    id v10 = [v9 objectForKeyedSubscript:@"testSplitPercent"];
    [(_PSPersonalizationEvaluation *)self setTestSplitPercent:v10];
  }
  [(_PSPersonalizationEvaluation *)self setTopN:&unk_1EF675540];
  id v11 = [(_PSPersonalizationEvaluation *)self recipe];
  v12 = [v11 valueForKey:@"topN"];

  if (v12)
  {
    v13 = [(_PSPersonalizationEvaluation *)self recipe];
    os_log_t v14 = [v13 objectForKeyedSubscript:@"topN"];
    [(_PSPersonalizationEvaluation *)self setTopN:v14];
  }
  [(_PSPersonalizationEvaluation *)self setBatchSize:&unk_1EF675570];
  v15 = [(_PSPersonalizationEvaluation *)self recipe];
  uint64_t v16 = [v15 valueForKey:@"batchSize"];

  if (v16)
  {
    v17 = [(_PSPersonalizationEvaluation *)self recipe];
    uint64_t v18 = [v17 objectForKeyedSubscript:@"batchSize"];
    [(_PSPersonalizationEvaluation *)self setBatchSize:v18];
  }
  [(_PSPersonalizationEvaluation *)self setEpoc:&unk_1EF675588];
  v19 = [(_PSPersonalizationEvaluation *)self recipe];
  v20 = [v19 valueForKey:@"epoc"];

  if (v20)
  {
    v21 = [(_PSPersonalizationEvaluation *)self recipe];
    v22 = [v21 objectForKeyedSubscript:@"epoc"];
    [(_PSPersonalizationEvaluation *)self setEpoc:v22];
  }
  [(_PSPersonalizationEvaluation *)self setSwapOK:&unk_1EF6755A0];
  objc_super v23 = [(_PSPersonalizationEvaluation *)self recipe];
  v24 = [v23 valueForKey:@"swapOK"];

  if (v24)
  {
    v25 = [(_PSPersonalizationEvaluation *)self recipe];
    v26 = [v25 objectForKeyedSubscript:@"swapOK"];
    [(_PSPersonalizationEvaluation *)self setSwapOK:v26];
  }
  [(_PSPersonalizationEvaluation *)self setAccuracyGainThresholdForSwap:&unk_1EF675540];
  v27 = [(_PSPersonalizationEvaluation *)self recipe];
  v28 = [v27 valueForKey:@"accuracyGainThresholdForSwap"];

  if (v28)
  {
    v29 = [(_PSPersonalizationEvaluation *)self recipe];
    v30 = [v29 objectForKeyedSubscript:@"accuracyGainThresholdForSwap"];
    [(_PSPersonalizationEvaluation *)self setAccuracyGainThresholdForSwap:v30];
  }
  [(_PSPersonalizationEvaluation *)self setEngagementRateGainThresholdForSwap:&unk_1EF675540];
  v31 = [(_PSPersonalizationEvaluation *)self recipe];
  v32 = [v31 valueForKey:@"engagementRateGainThresholdForSwap"];

  if (v32)
  {
    v33 = [(_PSPersonalizationEvaluation *)self recipe];
    v34 = [v33 objectForKeyedSubscript:@"engagementRateGainThresholdForSwap"];
    [(_PSPersonalizationEvaluation *)self setEngagementRateGainThresholdForSwap:v34];
  }
  [(_PSPersonalizationEvaluation *)self setMinimumTestDataSizeForSwap:&unk_1EF6755B8];
  v35 = [(_PSPersonalizationEvaluation *)self recipe];
  v36 = [v35 valueForKey:@"minimumTestDataSizeForSwap"];

  if (v36)
  {
    v37 = [(_PSPersonalizationEvaluation *)self recipe];
    v38 = [v37 objectForKeyedSubscript:@"minimumTestDataSizeForSwap"];
    [(_PSPersonalizationEvaluation *)self setMinimumTestDataSizeForSwap:v38];
  }
  [(_PSPersonalizationEvaluation *)self setRecipeID:&unk_1EF6755A0];
  v39 = [(_PSPersonalizationEvaluation *)self recipe];
  v40 = [v39 valueForKey:@"recipeID"];

  if (v40)
  {
    v41 = [(_PSPersonalizationEvaluation *)self recipe];
    v42 = [v41 objectForKeyedSubscript:@"recipeID"];
    [(_PSPersonalizationEvaluation *)self setRecipeID:v42];
  }
  [(_PSPersonalizationEvaluation *)self setMinSampleCountForAdaptation:&unk_1EF6755D0];
  v43 = [(_PSPersonalizationEvaluation *)self recipe];
  v44 = [v43 valueForKey:@"minSampleCountForAdaptation"];

  if (v44)
  {
    v45 = [(_PSPersonalizationEvaluation *)self recipe];
    v46 = [v45 objectForKeyedSubscript:@"minSampleCountForAdaptation"];
    [(_PSPersonalizationEvaluation *)self setMinSampleCountForAdaptation:v46];
  }
  [(_PSPersonalizationEvaluation *)self setAdaptationStrategy:0];
  v47 = [(_PSPersonalizationEvaluation *)self recipe];
  uint64_t v48 = [v47 valueForKey:@"adaptationStrategy"];
  if (v48)
  {
    v49 = (void *)v48;
    v50 = [(_PSPersonalizationEvaluation *)self recipe];
    v51 = [v50 objectForKeyedSubscript:@"adaptationStrategy"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      goto LABEL_27;
    }
    v47 = [(_PSPersonalizationEvaluation *)self recipe];
    v53 = [v47 objectForKeyedSubscript:@"adaptationStrategy"];
    -[_PSPersonalizationEvaluation setAdaptationStrategy:](self, "setAdaptationStrategy:", (int)[v53 intValue]);
  }
LABEL_27:
  [(_PSPersonalizationEvaluation *)self setNumClasses:&unk_1EF675588];
  [(_PSPersonalizationEvaluation *)self setNumTrees:&unk_1EF6755B8];
  [(_PSPersonalizationEvaluation *)self setMaxDepth:&unk_1EF6755E8];
  [(_PSPersonalizationEvaluation *)self setLearningRate:&unk_1EF6767A8];
  [(_PSPersonalizationEvaluation *)self setMinChildWeight:&unk_1EF675588];
  v54 = [(_PSPersonalizationEvaluation *)self recipe];
  v55 = [v54 valueForKey:@"adaptationParameters"];

  if (v55)
  {
    v56 = [(_PSPersonalizationEvaluation *)self recipe];
    v57 = [v56 objectForKeyedSubscript:@"adaptationParameters"];
    v58 = [v57 valueForKey:@"numClasses"];

    if (v58)
    {
      v59 = [(_PSPersonalizationEvaluation *)self recipe];
      v60 = [v59 objectForKeyedSubscript:@"adaptationParameters"];
      v61 = [v60 objectForKeyedSubscript:@"numClasses"];
      [(_PSPersonalizationEvaluation *)self setNumClasses:v61];
    }
    v62 = [(_PSPersonalizationEvaluation *)self recipe];
    v63 = [v62 objectForKeyedSubscript:@"adaptationParameters"];
    v64 = [v63 valueForKey:@"numTrees"];

    if (v64)
    {
      v65 = [(_PSPersonalizationEvaluation *)self recipe];
      v66 = [v65 objectForKeyedSubscript:@"adaptationParameters"];
      v67 = [v66 objectForKeyedSubscript:@"numTrees"];
      [(_PSPersonalizationEvaluation *)self setNumTrees:v67];
    }
    v68 = [(_PSPersonalizationEvaluation *)self recipe];
    v69 = [v68 objectForKeyedSubscript:@"adaptationParameters"];
    v70 = [v69 valueForKey:@"maxDepth"];

    if (v70)
    {
      v71 = [(_PSPersonalizationEvaluation *)self recipe];
      v72 = [v71 objectForKeyedSubscript:@"adaptationParameters"];
      v73 = [v72 objectForKeyedSubscript:@"maxDepth"];
      [(_PSPersonalizationEvaluation *)self setMaxDepth:v73];
    }
    v74 = [(_PSPersonalizationEvaluation *)self recipe];
    v75 = [v74 objectForKeyedSubscript:@"adaptationParameters"];
    v76 = [v75 valueForKey:@"learningRate"];

    if (v76)
    {
      v77 = [(_PSPersonalizationEvaluation *)self recipe];
      v78 = [v77 objectForKeyedSubscript:@"adaptationParameters"];
      v79 = [v78 objectForKeyedSubscript:@"learningRate"];
      [(_PSPersonalizationEvaluation *)self setLearningRate:v79];
    }
    v80 = [(_PSPersonalizationEvaluation *)self recipe];
    v81 = [v80 objectForKeyedSubscript:@"adaptationParameters"];
    v82 = [v81 valueForKey:@"minChildWeight"];

    if (v82)
    {
      id v85 = [(_PSPersonalizationEvaluation *)self recipe];
      v83 = [v85 objectForKeyedSubscript:@"adaptationParameters"];
      v84 = [v83 objectForKeyedSubscript:@"minChildWeight"];
      [(_PSPersonalizationEvaluation *)self setMinChildWeight:v84];
    }
  }
}

- (BOOL)performPrerequisitesBeforeAdaptationWithFeaturesConfigDeployPath:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(_PSPersonalizationEvaluation *)self setParametersFromRecipe];
  id v5 = [MEMORY[0x1E4F1CA48] array];
  [(_PSPersonalizationEvaluation *)self setResults:v5];

  v6 = [(_PSPersonalizationEvaluation *)self loadDefaultModel];
  if (v6)
  {
    v7 = personalizationLog;
    if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_1A314B000, v7, OS_LOG_TYPE_INFO, "Default ML Model loaded successfully", (uint8_t *)&v12, 2u);
    }
    v8 = [v4 stringByAppendingString:@"com.apple.PeopleSuggester.Config.SelectedFeatures.plist"];
    id v9 = personalizationLog;
    if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
    {
      int v12 = 138412290;
      v13 = v8;
      _os_log_impl(&dword_1A314B000, v9, OS_LOG_TYPE_INFO, "dodML is loading defaultSelectedFeaturesConfigPath from path: %@", (uint8_t *)&v12, 0xCu);
    }
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v8];
    [(_PSPersonalizationEvaluation *)self setSelectedFeaturesConfig:v10];
  }
  return v6 != 0;
}

- (id)runAdaptationAndEvaluation
{
  [(_PSPersonalizationEvaluation *)self setAdaptableModelDeployPath:@"/System/Library/DistributedEvaluation/Plugins/PeopleSuggesterDESPlugin.desPlugin/"];
  v3 = [(_PSPersonalizationEvaluation *)self adaptableModelDeployPath];
  id v4 = [(_PSPersonalizationEvaluation *)self adaptableModelDeployPath];
  id v5 = [(_PSPersonalizationEvaluation *)self runAdaptationAndEvaluationWithFeaturesConfigDeployPath:v3 adaptableModelDeployPath:v4];

  return v5;
}

- (id)evaluateWithModel:(id)a3
{
  uint64_t v123 = *MEMORY[0x1E4F143B8];
  id v97 = a3;
  v3 = personalizationLog;
  if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A314B000, v3, OS_LOG_TYPE_INFO, "Arrived in NEW evaluateWithModel method", buf, 2u);
  }
  id v4 = [v97 CDQuery];
  BOOL v5 = v4 == 0;

  v6 = (void *)personalizationLog;
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_ERROR)) {
      -[_PSPersonalizationEvaluation evaluateWithModel:]();
    }
    v34 = 0;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
    {
      v7 = v6;
      v8 = [v97 CDQuery];
      id v9 = [v8 predicate];
      id v10 = [v9 predicateFormat];
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v10;
      _os_log_impl(&dword_1A314B000, v7, OS_LOG_TYPE_INFO, "Candidate model query predicate: %@", buf, 0xCu);
    }
    id v11 = (void *)personalizationLog;
    if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
    {
      int v12 = v11;
      v13 = [v97 CDModelDataStreamIdentifier];
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v13;
      _os_log_impl(&dword_1A314B000, v12, OS_LOG_TYPE_INFO, "Candidate model stream id: %@", buf, 0xCu);
    }
    if (([v97 isDefaultModel] & 1) != 0 || (objc_msgSend(v97, "isPersonalizableModel") & 1) == 0)
    {
      v27 = [v97 modelURL];
      v28 = [v27 path];
      v98 = +[_PSBehaviorRuleRankingUtilities loadMLModel:v28 modelConfig:0];

      v29 = (void *)personalizationLog;
      if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
      {
        v30 = v29;
        v31 = [v97 modelURL];
        v32 = [v31 path];
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v32;
        _os_log_impl(&dword_1A314B000, v30, OS_LOG_TYPE_INFO, "DEFAULT Loading adapted model from %@", buf, 0xCu);
      }
      v26 = @"classicMLModel";
    }
    else
    {
      uint64_t v14 = (void *)personalizationLog;
      if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
      {
        v15 = v14;
        uint64_t v16 = [v97 modelConfiguration];
        v17 = [v16 parameters];
        uint64_t v18 = [v97 modelTag];
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v17;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v18;
        _os_log_impl(&dword_1A314B000, v15, OS_LOG_TYPE_INFO, "EVALUATE Candidate model config: %@ model tag: %@", buf, 0x16u);
      }
      v19 = [v97 modelURL];
      v20 = [v19 path];
      v21 = [v97 modelConfiguration];
      v98 = +[_PSBehaviorRuleRankingUtilities loadMLModel:v20 modelConfig:v21];

      v22 = (void *)personalizationLog;
      if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
      {
        objc_super v23 = v22;
        v24 = [v97 modelURL];
        v25 = [v24 path];
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v25;
        _os_log_impl(&dword_1A314B000, v23, OS_LOG_TYPE_INFO, "ADAPTABLE Loading adapted model from %@", buf, 0xCu);
      }
      v26 = @"adaptableMLModel";
    }
    v99 = v26;
    if ([v97 isDefaultModel])
    {
      v33 = @"bothMatched";
    }
    else
    {
      int v35 = [v97 isPersonalizableModel];
      v33 = @"personAndAppMatched";
      if (v35) {
        v33 = @"predictedClass";
      }
    }
    v107 = v33;
    v36 = personalizationLog;
    if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v107;
      _os_log_impl(&dword_1A314B000, v36, OS_LOG_TYPE_INFO, "Using prediction label name: %@", buf, 0xCu);
    }
    v95 = (void *)MEMORY[0x1A6243860]();
    v37 = [v97 CDQuery];
    v101 = [(_PSPersonalizationEvaluation *)self processDataWithQuery:v37 balanceNeed:0];

    v38 = (void *)personalizationLog;
    if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
    {
      v39 = v38;
      uint64_t v40 = [v101 count];
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v40;
      _os_log_impl(&dword_1A314B000, v39, OS_LOG_TYPE_INFO, "Amount of data for evaluation: %ld", buf, 0xCu);
    }
    if ([v101 count])
    {
      v42 = 0;
      uint64_t v96 = 0;
      int v108 = 0;
      int v112 = 0;
      uint64_t v105 = 0;
      uint64_t v106 = 0;
      uint64_t v103 = 0;
      *(void *)&long long v41 = 138412290;
      long long v94 = v41;
      while (1)
      {
        context = (void *)MEMORY[0x1A6243860]();
        v110 = [v101 objectAtIndexedSubscript:v103];
        v102 = [(_PSPersonalizationEvaluation *)self createMLFeatureProviderArrayFromSingleShareEventData:v110 forMLModel:v99];
        v113 = (void *)[objc_alloc((Class)getMLArrayBatchProviderClass_0()) initWithFeatureProviderArray:v102];
        id v114 = v42;
        v43 = [v98 predictionsFromBatch:v113 error:&v114];
        id v104 = v114;

        if (v104)
        {
          v44 = personalizationLog;
          if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v94;
            *(void *)&buf[4] = v104;
            _os_log_error_impl(&dword_1A314B000, v44, OS_LOG_TYPE_ERROR, "ML model load to predict with error：%@", buf, 0xCu);
          }
        }
        v45 = (void *)personalizationLog;
        if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
        {
          v46 = v45;
          uint64_t v47 = [v43 count];
          *(_DWORD *)buf = 134217984;
          *(void *)&buf[4] = v47;
          _os_log_impl(&dword_1A314B000, v46, OS_LOG_TYPE_INFO, "Amount of predictions, %ld", buf, 0xCu);
        }
        if (objc_msgSend(v43, "count", v94) >= 1) {
          break;
        }
LABEL_48:
        id v109 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        if ([v43 count] >= 1)
        {
          uint64_t v55 = 0;
          do
          {
            v56 = [v110 objectAtIndexedSubscript:v55];
            v57 = [v43 featuresAtIndex:v55];
            v58 = [v57 featureValueForName:@"classProbability"];
            v59 = [v58 dictionaryValue];

            v60 = [v59 objectForKeyedSubscript:&unk_1EF675588];
            [v60 floatValue];
            float v62 = v61;

            v63 = [(_PSPersonalizationEvaluation *)self featureNameDict];
            v64 = [v63 objectForKeyedSubscript:@"recipientAndBundleIDAsInteger"];

            v65 = [scoredRule alloc];
            v66 = [v113 featuresAtIndex:v55];
            v67 = [v66 featureValueForName:@"predictedClass"];
            uint64_t v68 = [v67 int64Value];
            v69 = objc_msgSend(v56, "objectAtIndexedSubscript:", (int)objc_msgSend(v64, "intValue"));
            *(float *)&double v70 = v62 * 100.0;
            v71 = [(scoredRule *)v65 initWithLabel:v68 score:v69 recipientUniqueID:v70];

            [v109 addObject:v71];
            ++v55;
          }
          while (v55 < [v43 count]);
        }
        v72 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:0 ascending:0 selector:sel_compare_];
        v119 = v72;
        v73 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v119 count:1];
        v74 = [v109 sortedArrayUsingDescriptors:v73];

        id v75 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        if ([v74 count])
        {
          uint64_t v76 = 0;
          for (unint64_t i = 0; i < [v74 count]; ++i)
          {
            v78 = [(_PSPersonalizationEvaluation *)self topN];
            BOOL v79 = v76 < [v78 integerValue];

            if (!v79) {
              break;
            }
            v80 = [v74 objectAtIndexedSubscript:i];
            if ([v80 ruleLabel] == 1)
            {

              ++v96;
              break;
            }
            v81 = [v80 recipientUniqueID];
            char v82 = [v75 containsObject:v81];

            if ((v82 & 1) == 0)
            {
              v83 = [v80 recipientUniqueID];
              [v75 addObject:v83];

              ++v76;
            }
          }
        }

        v84 = v104;
        v42 = v104;
        if (++v103 >= (unint64_t)[v101 count]) {
          goto LABEL_63;
        }
      }
      uint64_t v48 = 0;
      while (1)
      {
        v49 = [v43 featuresAtIndex:v48];
        v50 = [v49 featureValueForName:v107];
        uint64_t v51 = [v50 int64Value];

        v52 = [v113 featuresAtIndex:v48];
        v53 = [v52 featureValueForName:@"predictedClass"];
        uint64_t v54 = [v53 int64Value];

        if (v51 == v54)
        {
          ++v108;
          if (v51 == 1)
          {
            LODWORD(v105) = v105 + 1;
            ++v112;
LABEL_46:
            ++HIDWORD(v106);
            goto LABEL_47;
          }
          if (!v51) {
            break;
          }
        }
        ++v112;
        if (v54 == 1) {
          goto LABEL_46;
        }
        if (!v54) {
          goto LABEL_44;
        }
LABEL_47:
        if (++v48 >= [v43 count]) {
          goto LABEL_48;
        }
      }
      ++HIDWORD(v105);
      ++v112;
LABEL_44:
      LODWORD(v106) = v106 + 1;
      goto LABEL_47;
    }
    uint64_t v105 = 0;
    uint64_t v106 = 0;
    int v112 = 0;
    int v108 = 0;
    uint64_t v96 = 0;
    v84 = 0;
LABEL_63:
    getODCurareReportFillerModelEvaluationClass();
    id v85 = objc_opt_new();
    [v85 setMetricName:@"engagement rate new"];
    objc_msgSend(v85, "setMetricValue:", (double)v96 * 100.0 / (double)(unint64_t)objc_msgSend(v101, "count"));
    [v85 setNumberOfPositiveSamples:v96];
    objc_msgSend(v85, "setNumberOfSamples:", objc_msgSend(v101, "count"));
    getODCurareReportFillerModelEvaluationClass();
    v86 = objc_opt_new();
    [v86 setMetricName:@"binary accuracy"];
    [v86 setMetricValue:(double)v108 * 100.0 / (double)v112];
    [v86 setNumberOfPositiveSamples:v108];
    [v86 setNumberOfSamples:v112];
    getODCurareReportFillerModelEvaluationClass();
    v87 = objc_opt_new();
    [v87 setMetricName:@"binary accuracy class 1"];
    [v87 setMetricValue:(double)(int)v105 * 100.0 / (double)SHIDWORD(v106)];
    [v87 setNumberOfPositiveSamples:v105];
    [v87 setNumberOfSamples:HIDWORD(v106)];
    getODCurareReportFillerModelEvaluationClass();
    v88 = objc_opt_new();
    [v88 setMetricName:@"binary accuracy class 0"];
    [v88 setMetricValue:(double)SHIDWORD(v105) * 100.0 / (double)(int)v106];
    [v88 setNumberOfPositiveSamples:HIDWORD(v105)];
    [v88 setNumberOfSamples:v106];
    v89 = [(_PSPersonalizationEvaluation *)self _getDataStatistics:v99 forData:v101];
    uint64_t v115 = 0;
    v116 = &v115;
    uint64_t v117 = 0x2050000000;
    v90 = (void *)getODCurareReportFillerModelEvaluationSummaryClass_softClass;
    uint64_t v118 = getODCurareReportFillerModelEvaluationSummaryClass_softClass;
    if (!getODCurareReportFillerModelEvaluationSummaryClass_softClass)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getODCurareReportFillerModelEvaluationSummaryClass_block_invoke;
      v121 = &unk_1E5ADE858;
      v122 = &v115;
      ODCurareEvaluationAndReportingLibraryCore();
      Class Class = objc_getClass("ODCurareReportFillerModelEvaluationSummary");
      *(void *)(v122[1] + 24) = Class;
      getODCurareReportFillerModelEvaluationSummaryClass_softClass Class = *(void *)(v122[1] + 24);
      v90 = (void *)v116[3];
    }
    id v92 = v90;
    _Block_object_dispose(&v115, 8);
    v34 = objc_opt_new();
    [v34 addModelEvaluationResults:v85];
    [v34 addModelEvaluationResults:v86];
    [v34 addModelEvaluationResults:v87];
    [v34 addModelEvaluationResults:v88];
    if (![(_PSPersonalizationEvaluation *)self evaluateIsInvokedOnce])
    {
      [v34 setDataUsedToEvaluateModel:v89];
      [(_PSPersonalizationEvaluation *)self setEvaluateIsInvokedOnce:1];
    }
  }

  return v34;
}

- (void)adaptMLModel:(id)a3 withMLModelType:(id)a4 withDataArray:(id)a5 modelConfiguration:(id)a6
{
  id v10 = a6;
  id v11 = a3;
  id v12 = [(_PSPersonalizationEvaluation *)self createMLArrayBatchProviderWithMLModelType:a4 withDataArray:a5];
  [(_PSPersonalizationEvaluation *)self adaptMLModel:v11 withTrainingData:v12 modelConfiguration:v10];
}

- (id)createMLArrayBatchProviderWithMLModelType:(id)a3 withDataArray:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x1E4F1CA48] array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = -[_PSPersonalizationEvaluation createMLFeatureProviderArrayFromSingleShareEventData:forMLModel:](self, "createMLFeatureProviderArrayFromSingleShareEventData:forMLModel:", *(void *)(*((void *)&v17 + 1) + 8 * i), v6, (void)v17);
        [v8 addObjectsFromArray:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  v15 = (void *)[objc_alloc((Class)getMLArrayBatchProviderClass_0()) initWithFeatureProviderArray:v8];

  return v15;
}

- (void)setParametersForHyperparmeters:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 numTrees];
  [(_PSPersonalizationEvaluation *)self setNumTrees:v5];

  id v6 = [v4 learningRate];
  [(_PSPersonalizationEvaluation *)self setLearningRate:v6];

  id v7 = [v4 minChildWeight];
  [(_PSPersonalizationEvaluation *)self setMinChildWeight:v7];

  uint64_t v8 = [v4 adaptationStrategy];

  [(_PSPersonalizationEvaluation *)self setAdaptationStrategy:v8];
}

- (void)setParametersFromRecipeForCandidateModel:(id)a3
{
  id v4 = [a3 modelConfiguration];
  [(_PSPersonalizationEvaluation *)self setAdaptableModelConfiguration:v4];
}

- (id)hyperparametersForCandidateModel:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(_PSPersonalizationEvaluation *)self modelTagToHyperparameters];
  id v6 = [v4 modelTag];
  id v7 = [v5 objectForKeyedSubscript:v6];

  uint64_t v16 = 0;
  long long v17 = &v16;
  uint64_t v18 = 0x2050000000;
  uint64_t v8 = (void *)getODCurareReportFillerModelHyperparametersClass_softClass;
  uint64_t v19 = getODCurareReportFillerModelHyperparametersClass_softClass;
  if (!getODCurareReportFillerModelHyperparametersClass_softClass)
  {
    ODCurareEvaluationAndReportingLibraryCore();
    v17[3] = (uint64_t)objc_getClass("ODCurareReportFillerModelHyperparameters");
    getODCurareReportFillerModelHyperparametersClass_softClass Class = v17[3];
    uint64_t v8 = (void *)v17[3];
  }
  id v9 = v8;
  _Block_object_dispose(&v16, 8);
  uint64_t v10 = objc_opt_new();
  [v10 setVersionNumber:1];
  [v10 addHyperparameterIndices:0];
  uint64_t v11 = [v7 numTrees];
  [v11 floatValue];
  objc_msgSend(v10, "addHyperparameterValues:");

  [v10 addHyperparameterIndices:1];
  uint64_t v12 = [v7 learningRate];
  [v12 floatValue];
  objc_msgSend(v10, "addHyperparameterValues:");

  [v10 addHyperparameterIndices:2];
  v13 = [v7 minChildWeight];
  [v13 floatValue];
  objc_msgSend(v10, "addHyperparameterValues:");

  [v10 addHyperparameterIndices:3];
  *(float *)&double v14 = (float)[v7 adaptationStrategy];
  [v10 addHyperparameterValues:v14];

  return v10;
}

- (id)personalizeModel:(id)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!(*((unsigned int (**)(void))self->_shouldContinue + 2))())
  {
LABEL_12:
    uint64_t v16 = 0;
    goto LABEL_13;
  }
  BOOL v5 = personalizationLog;
  if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A314B000, v5, OS_LOG_TYPE_INFO, "Arrived in NEW personalize method", buf, 2u);
  }
  [(_PSPersonalizationEvaluation *)self setParametersFromRecipeForCandidateModel:v4];
  id v6 = [v4 CDQuery];
  BOOL v7 = v6 == 0;

  uint64_t v8 = (void *)personalizationLog;
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_ERROR)) {
      -[_PSPersonalizationEvaluation personalizeModel:]();
    }
    goto LABEL_12;
  }
  if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
  {
    id v9 = v8;
    uint64_t v10 = [v4 CDQuery];
    uint64_t v11 = [v10 predicate];
    uint64_t v12 = [v11 predicateFormat];
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v12;
    _os_log_impl(&dword_1A314B000, v9, OS_LOG_TYPE_INFO, "Candidate model query predicate: %@", buf, 0xCu);
  }
  int v13 = [v4 isDefaultModel];
  double v14 = personalizationLog;
  BOOL v15 = os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO);
  if (v13)
  {
    if (v15)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A314B000, v14, OS_LOG_TYPE_INFO, "Candidate model was default, not ok!!", buf, 2u);
    }
    goto LABEL_12;
  }
  if (v15)
  {
    uint64_t v18 = v14;
    uint64_t v19 = [(_PSPersonalizationEvaluation *)self numTrees];
    long long v20 = [(_PSPersonalizationEvaluation *)self maxDepth];
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v19;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v20;
    _os_log_impl(&dword_1A314B000, v18, OS_LOG_TYPE_INFO, "Personalizing with numTrees: %@, maxDepth: %@", buf, 0x16u);
  }
  v21 = (void *)personalizationLog;
  if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
  {
    uint64_t v22 = v21;
    objc_super v23 = [v4 modelURL];
    v24 = [v23 absoluteString];
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v24;
    _os_log_impl(&dword_1A314B000, v22, OS_LOG_TYPE_INFO, "ADAPTABLE Loading adapted model from %@", buf, 0xCu);
  }
  v25 = (void *)MEMORY[0x1A6243860]();
  v26 = [v4 CDQuery];
  v27 = [(_PSPersonalizationEvaluation *)self processDataWithQuery:v26 balanceNeed:1];

  v28 = (void *)personalizationLog;
  if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
  {
    v29 = v28;
    uint64_t v30 = [v27 count];
    *(_DWORD *)buf = 134217984;
    *(void *)&buf[4] = v30;
    _os_log_impl(&dword_1A314B000, v29, OS_LOG_TYPE_INFO, "Amount of sharing sessions used for personalization: %ld", buf, 0xCu);
  }
  v31 = [(_PSPersonalizationEvaluation *)self adaptableModelDeployPath];
  id v32 = [(_PSPersonalizationEvaluation *)self loadAdaptableModelUnderDirectory:v31];

  v33 = (void *)personalizationLog;
  if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
  {
    v34 = v33;
    int v35 = [v4 modelConfiguration];
    v36 = [v35 parameters];
    v37 = [v4 modelTag];
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v36;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v37;
    _os_log_impl(&dword_1A314B000, v34, OS_LOG_TYPE_INFO, "PERSONALIZE Candidate model config: %@ model tag: %@", buf, 0x16u);
  }
  v38 = [(_PSPersonalizationEvaluation *)self intermediateCompiledModelURL];
  v39 = [v4 modelConfiguration];
  [(_PSPersonalizationEvaluation *)self updateMLModelWithURL:v38 withMLModelType:@"adaptableMLModel" withDataArray:v27 modelConfiguration:v39];

  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x2050000000;
  uint64_t v40 = (void *)getODCurareReportFillerModelInformationClass_softClass;
  uint64_t v54 = getODCurareReportFillerModelInformationClass_softClass;
  if (!getODCurareReportFillerModelInformationClass_softClass)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getODCurareReportFillerModelInformationClass_block_invoke;
    v56 = &unk_1E5ADE858;
    v57 = &v51;
    ODCurareEvaluationAndReportingLibraryCore();
    Class Class = objc_getClass("ODCurareReportFillerModelInformation");
    *(void *)(v57[1] + 24) = Class;
    getODCurareReportFillerModelInformationClass_softClass Class = *(void *)(v57[1] + 24);
    uint64_t v40 = (void *)v52[3];
  }
  id v42 = v40;
  _Block_object_dispose(&v51, 8);
  v43 = objc_opt_new();
  [v43 setIsDefaultModel:0];
  v44 = [(_PSPersonalizationEvaluation *)self _getDataStatistics:@"adaptableMLModel" forData:v27];
  [v43 setDataUsedToPersonalizeModel:v44];

  v45 = [(_PSPersonalizationEvaluation *)self hyperparametersForCandidateModel:v4];
  [v43 setModelHyperparameters:v45];

  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x2050000000;
  v46 = (void *)getODCurareModelInformationClass_softClass;
  uint64_t v54 = getODCurareModelInformationClass_softClass;
  if (!getODCurareModelInformationClass_softClass)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getODCurareModelInformationClass_block_invoke;
    v56 = &unk_1E5ADE858;
    v57 = &v51;
    ODCurareEvaluationAndReportingLibraryCore();
    Class v47 = objc_getClass("ODCurareModelInformation");
    *(void *)(v57[1] + 24) = v47;
    getODCurareModelInformationClass_softClass Class = *(void *)(v57[1] + 24);
    v46 = (void *)v52[3];
  }
  uint64_t v48 = v46;
  _Block_object_dispose(&v51, 8);
  id v49 = [v48 alloc];
  v50 = [(_PSPersonalizationEvaluation *)self intermediateCompiledModelURL];
  uint64_t v16 = (void *)[v49 initWithModelInformation:v43 modelURL:v50];

  NSLog(&cfstr_Personalizemod.isa, v16);
LABEL_13:

  return v16;
}

- (void)generateCandidateModels
{
  v155[1] = *MEMORY[0x1E4F143B8];
  if ((*((unsigned int (**)(void))self->_shouldContinue + 2))())
  {
    v3 = objc_opt_new();
    [(_PSPersonalizationEvaluation *)self setModelTagToHyperparameters:v3];

    id v4 = objc_opt_new();
    [(_PSPersonalizationEvaluation *)self setModelTagToCandidateModel:v4];

    BOOL v5 = [(_PSPersonalizationEvaluation *)self numTrees];
    v155[0] = v5;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v155 count:1];

    BOOL v7 = [(_PSPersonalizationEvaluation *)self recipe];
    uint64_t v8 = [v7 objectForKeyedSubscript:@"numTrees"];
    if (v8)
    {
      id v9 = (void *)v8;
      uint64_t v10 = [(_PSPersonalizationEvaluation *)self recipe];
      uint64_t v11 = [v10 objectForKeyedSubscript:@"numTrees"];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        int v13 = [(_PSPersonalizationEvaluation *)self recipe];
        uint64_t v14 = [v13 objectForKeyedSubscript:@"numTrees"];

        BOOL v15 = personalizationLog;
        if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v145 = v14;
          _os_log_impl(&dword_1A314B000, v15, OS_LOG_TYPE_INFO, "Setting numTrees to: %@", buf, 0xCu);
        }
        id v6 = (void *)v14;
      }
    }
    else
    {
    }
    uint64_t v16 = [(_PSPersonalizationEvaluation *)self learningRate];
    v154 = v16;
    v102 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v154 count:1];

    long long v17 = [(_PSPersonalizationEvaluation *)self recipe];
    uint64_t v18 = [v17 objectForKeyedSubscript:@"learningRate"];
    if (v18)
    {
      uint64_t v19 = (void *)v18;
      long long v20 = [(_PSPersonalizationEvaluation *)self recipe];
      v21 = [v20 objectForKeyedSubscript:@"learningRate"];
      objc_opt_class();
      char v22 = objc_opt_isKindOfClass();

      if (v22)
      {
        objc_super v23 = [(_PSPersonalizationEvaluation *)self recipe];
        uint64_t v24 = [v23 objectForKeyedSubscript:@"learningRate"];

        v25 = personalizationLog;
        if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v145 = v24;
          _os_log_impl(&dword_1A314B000, v25, OS_LOG_TYPE_INFO, "Setting learningRate to: %@", buf, 0xCu);
        }
        v102 = (void *)v24;
      }
    }
    else
    {
    }
    v26 = [(_PSPersonalizationEvaluation *)self minChildWeight];
    v153 = v26;
    uint64_t v106 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v153 count:1];

    v27 = [(_PSPersonalizationEvaluation *)self recipe];
    uint64_t v28 = [v27 objectForKeyedSubscript:@"minChildWeight"];
    if (v28)
    {
      v29 = (void *)v28;
      uint64_t v30 = [(_PSPersonalizationEvaluation *)self recipe];
      v31 = [v30 objectForKeyedSubscript:@"minChildWeight"];
      objc_opt_class();
      char v32 = objc_opt_isKindOfClass();

      if (v32)
      {
        v33 = [(_PSPersonalizationEvaluation *)self recipe];
        uint64_t v34 = [v33 objectForKeyedSubscript:@"minChildWeight"];

        int v35 = personalizationLog;
        if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v145 = v34;
          _os_log_impl(&dword_1A314B000, v35, OS_LOG_TYPE_INFO, "Setting minChildWeight to: %@", buf, 0xCu);
        }
        uint64_t v106 = (void *)v34;
      }
    }
    else
    {
    }
    v36 = objc_msgSend(NSNumber, "numberWithInt:", -[_PSPersonalizationEvaluation adaptationStrategy](self, "adaptationStrategy"));
    v152 = v36;
    v111 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v152 count:1];

    v37 = [(_PSPersonalizationEvaluation *)self recipe];
    uint64_t v38 = [v37 objectForKeyedSubscript:@"adaptationStrategy"];
    if (v38)
    {
      v39 = (void *)v38;
      uint64_t v40 = [(_PSPersonalizationEvaluation *)self recipe];
      long long v41 = [v40 objectForKeyedSubscript:@"adaptationStrategy"];
      objc_opt_class();
      char v42 = objc_opt_isKindOfClass();

      if (v42)
      {
        v43 = [(_PSPersonalizationEvaluation *)self recipe];
        uint64_t v44 = [v43 objectForKeyedSubscript:@"adaptationStrategy"];

        v45 = personalizationLog;
        if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v145 = v44;
          _os_log_impl(&dword_1A314B000, v45, OS_LOG_TYPE_INFO, "Setting adaptationStrategy to: %@", buf, 0xCu);
        }
        v111 = (void *)v44;
      }
    }
    else
    {
    }
    v46 = (void *)MEMORY[0x1E4F1CB10];
    Class v47 = +[_PSBehaviorRuleRankingUtilities getDeployedAdaptableCompiledMLModelPath];
    uint64_t v118 = [v46 URLWithString:v47];

    uint64_t v48 = (void *)MEMORY[0x1E4F1CB10];
    id v49 = +[_PSBehaviorRuleRankingUtilities getDeployedCompiledMLModelPath];
    uint64_t v99 = [v48 URLWithString:v49];

    v50 = [MEMORY[0x1E4F5B5F8] behavioralRuleFeaturesStream];
    uint64_t v117 = [v50 name];

    long long v141 = 0u;
    long long v142 = 0u;
    long long v139 = 0u;
    long long v140 = 0u;
    obuint64_t j = v6;
    uint64_t v103 = [obj countByEnumeratingWithState:&v139 objects:v151 count:16];
    if (v103)
    {
      uint64_t v51 = 0;
      uint64_t v101 = *(void *)v140;
      do
      {
        uint64_t v52 = 0;
        do
        {
          if (*(void *)v140 != v101)
          {
            uint64_t v53 = v52;
            objc_enumerationMutation(obj);
            uint64_t v52 = v53;
          }
          uint64_t v104 = v52;
          uint64_t v116 = *(void *)(*((void *)&v139 + 1) + 8 * v52);
          long long v135 = 0u;
          long long v136 = 0u;
          long long v137 = 0u;
          long long v138 = 0u;
          id v105 = v102;
          uint64_t v108 = [v105 countByEnumeratingWithState:&v135 objects:v150 count:16];
          if (v108)
          {
            uint64_t v107 = *(void *)v136;
            do
            {
              uint64_t v54 = 0;
              do
              {
                if (*(void *)v136 != v107)
                {
                  uint64_t v55 = v54;
                  objc_enumerationMutation(v105);
                  uint64_t v54 = v55;
                }
                uint64_t v109 = v54;
                uint64_t v119 = *(void *)(*((void *)&v135 + 1) + 8 * v54);
                long long v131 = 0u;
                long long v132 = 0u;
                long long v133 = 0u;
                long long v134 = 0u;
                id v110 = v106;
                uint64_t v113 = [v110 countByEnumeratingWithState:&v131 objects:v149 count:16];
                if (v113)
                {
                  uint64_t v112 = *(void *)v132;
                  do
                  {
                    for (uint64_t i = 0; i != v113; ++i)
                    {
                      if (*(void *)v132 != v112) {
                        objc_enumerationMutation(v110);
                      }
                      uint64_t v121 = *(void *)(*((void *)&v131 + 1) + 8 * i);
                      long long v127 = 0u;
                      long long v128 = 0u;
                      long long v129 = 0u;
                      long long v130 = 0u;
                      id v115 = v111;
                      uint64_t v57 = [v115 countByEnumeratingWithState:&v127 objects:v148 count:16];
                      if (v57)
                      {
                        uint64_t v58 = v57;
                        uint64_t v114 = i;
                        uint64_t v120 = *(void *)v128;
                        do
                        {
                          uint64_t v59 = 0;
                          uint64_t v60 = v51;
                          do
                          {
                            if (*(void *)v128 != v120) {
                              objc_enumerationMutation(v115);
                            }
                            uint64_t v61 = *(void *)(*((void *)&v127 + 1) + 8 * v59);
                            float v62 = (void *)MEMORY[0x1A6243860]();
                            [(_PSPersonalizationEvaluation *)self setParametersFromRecipe];
                            v63 = [[ModelHyperparameters alloc] initWithNumTrees:v116 learningRate:v119 minChildWeight:v121 adaptationStrategy:v61];
                            [(_PSPersonalizationEvaluation *)self setParametersForHyperparmeters:v63];
                            int64_t v64 = [(_PSPersonalizationEvaluation *)self adaptationStrategy];
                            v65 = [(_PSPersonalizationEvaluation *)self numTrees];
                            [(_PSPersonalizationEvaluation *)self updateAdaptableModelConfigWithUpdateType:v64 numTrees:v65];

                            v66 = objc_msgSend(NSString, "stringWithFormat:", @"model_%d", v60 + v59);
                            v67 = (void *)personalizationLog;
                            if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
                            {
                              uint64_t v68 = v67;
                              v69 = [(_PSPersonalizationEvaluation *)self adaptableModelConfiguration];
                              double v70 = [v69 parameters];
                              *(_DWORD *)buf = 138412546;
                              uint64_t v145 = (uint64_t)v70;
                              __int16 v146 = 2112;
                              v147 = v66;
                              _os_log_impl(&dword_1A314B000, v68, OS_LOG_TYPE_INFO, "Candidate model config: %@ model tag: %@", buf, 0x16u);
                            }
                            id v71 = objc_alloc((Class)getODCurareCandidateModelClass());
                            v72 = [(_PSPersonalizationEvaluation *)self adaptableModelConfiguration];
                            v73 = (void *)[v71 initWithModelURL:v118 withCoreDuetStreamIdentifier:v117 andMetadata:v72];

                            [v73 setModelTag:v66];
                            [v73 setIsDefaultModel:0];
                            [v73 setIsPersonalizableModel:1];
                            v74 = [(_PSPersonalizationEvaluation *)self modelTagToCandidateModel];
                            [v74 setObject:v73 forKeyedSubscript:v66];

                            id v75 = [(_PSPersonalizationEvaluation *)self modelTagToHyperparameters];
                            [v75 setObject:v63 forKeyedSubscript:v66];

                            [(_PSPersonalizationEvaluation *)self setParametersFromRecipe];
                            ++v59;
                          }
                          while (v58 != v59);
                          uint64_t v58 = [v115 countByEnumeratingWithState:&v127 objects:v148 count:16];
                          uint64_t v51 = (v60 + v59);
                        }
                        while (v58);
                        uint64_t v51 = (v60 + v59);
                        uint64_t i = v114;
                      }
                    }
                    uint64_t v113 = [v110 countByEnumeratingWithState:&v131 objects:v149 count:16];
                  }
                  while (v113);
                }

                uint64_t v54 = v109 + 1;
              }
              while (v109 + 1 != v108);
              uint64_t v108 = [v105 countByEnumeratingWithState:&v135 objects:v150 count:16];
            }
            while (v108);
          }

          uint64_t v52 = v104 + 1;
        }
        while (v104 + 1 != v103);
        uint64_t v103 = [obj countByEnumeratingWithState:&v139 objects:v151 count:16];
      }
      while (v103);
    }

    uint64_t v76 = (void *)v99;
    v77 = (void *)[objc_alloc((Class)getODCurareCandidateModelClass()) initWithModelURL:v99 withCoreDuetStreamIdentifier:v117 andMetadata:0];
    [v77 setModelTag:@"default_model"];
    [v77 setIsDefaultModel:1];
    [v77 setIsPersonalizableModel:0];
    v78 = [(_PSPersonalizationEvaluation *)self modelTagToCandidateModel];
    [v78 setObject:v77 forKeyedSubscript:@"default_model"];

    id v79 = [(_PSPersonalizationEvaluation *)self recipe];
    uint64_t v80 = [v79 objectForKeyedSubscript:@"shadowEvaluationModels"];
    if (v80)
    {
      v81 = (void *)v80;
      char v82 = [(_PSPersonalizationEvaluation *)self recipe];
      v83 = [v82 objectForKeyedSubscript:@"shadowEvaluationModels"];
      objc_opt_class();
      char v84 = objc_opt_isKindOfClass();

      if ((v84 & 1) == 0)
      {
LABEL_68:

        return;
      }
      v122 = v77;
      id v85 = [(_PSPersonalizationEvaluation *)self recipe];
      v86 = [v85 objectForKeyedSubscript:@"shadowEvaluationModels"];

      long long v125 = 0u;
      long long v126 = 0u;
      long long v123 = 0u;
      long long v124 = 0u;
      id v79 = v86;
      uint64_t v87 = [v79 countByEnumeratingWithState:&v123 objects:v143 count:16];
      if (v87)
      {
        uint64_t v88 = v87;
        uint64_t v89 = *(void *)v124;
        do
        {
          for (uint64_t j = 0; j != v88; ++j)
          {
            if (*(void *)v124 != v89) {
              objc_enumerationMutation(v79);
            }
            uint64_t v91 = *(void *)(*((void *)&v123 + 1) + 8 * j);
            id v92 = (void *)MEMORY[0x1E4F1CB10];
            v93 = [v79 objectForKeyedSubscript:v91];
            long long v94 = [MEMORY[0x1E4F28B88] URLHostAllowedCharacterSet];
            v95 = [v93 stringByAddingPercentEncodingWithAllowedCharacters:v94];
            uint64_t v96 = [v92 URLWithString:v95];

            id v97 = (void *)[objc_alloc((Class)getODCurareCandidateModelClass()) initWithModelURL:v96 withCoreDuetStreamIdentifier:v117 andMetadata:0];
            [v97 setModelTag:v91];
            [v97 setIsDefaultModel:0];
            [v97 setIsPersonalizableModel:0];
            v98 = [(_PSPersonalizationEvaluation *)self modelTagToCandidateModel];
            [v98 setObject:v97 forKeyedSubscript:v91];
          }
          uint64_t v88 = [v79 countByEnumeratingWithState:&v123 objects:v143 count:16];
        }
        while (v88);
      }

      uint64_t v76 = (void *)v99;
      v77 = v122;
    }

    goto LABEL_68;
  }
}

- (id)runAdaptationAndEvaluationWithFeaturesConfigDeployPath:(id)a3 adaptableModelDeployPath:(id)a4
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(_PSPersonalizationEvaluation *)self performPrerequisitesBeforeAdaptationWithFeaturesConfigDeployPath:v6])
  {
    if ((*((unsigned int (**)(void))self->_shouldContinue + 2))())
    {
      uint64_t v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v9 = personalizationLog;
      if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1A314B000, v9, OS_LOG_TYPE_INFO, "Curare evaluation and dignostics framework will be used", (uint8_t *)&buf, 2u);
      }
      uint64_t v46 = 0;
      Class v47 = &v46;
      uint64_t v48 = 0x2050000000;
      uint64_t v10 = (void *)getODCurareDataCachePruningPolicyObjectClass_softClass;
      uint64_t v49 = getODCurareDataCachePruningPolicyObjectClass_softClass;
      if (!getODCurareDataCachePruningPolicyObjectClass_softClass)
      {
        *(void *)&long long buf = MEMORY[0x1E4F143A8];
        *((void *)&buf + 1) = 3221225472;
        uint64_t v52 = __getODCurareDataCachePruningPolicyObjectClass_block_invoke;
        uint64_t v53 = &unk_1E5ADE858;
        uint64_t v54 = &v46;
        ODCurareEvaluationAndReportingLibraryCore();
        Class Class = objc_getClass("ODCurareDataCachePruningPolicyObject");
        *(void *)(v54[1] + 24) = Class;
        getODCurareDataCachePruningPolicyObjectClass_softClass Class = *(void *)(v54[1] + 24);
        uint64_t v10 = (void *)v47[3];
      }
      uint64_t v12 = v10;
      _Block_object_dispose(&v46, 8);
      int v13 = (void *)[[v12 alloc] initWithMaximumNumberOfDays:28 maximumNumberOfEvents:28];
      uint64_t v46 = 0;
      Class v47 = &v46;
      uint64_t v48 = 0x2050000000;
      uint64_t v14 = (void *)getODCurareEvaluationAndReportingModuleClass_softClass;
      uint64_t v49 = getODCurareEvaluationAndReportingModuleClass_softClass;
      if (!getODCurareEvaluationAndReportingModuleClass_softClass)
      {
        *(void *)&long long buf = MEMORY[0x1E4F143A8];
        *((void *)&buf + 1) = 3221225472;
        uint64_t v52 = __getODCurareEvaluationAndReportingModuleClass_block_invoke;
        uint64_t v53 = &unk_1E5ADE858;
        uint64_t v54 = &v46;
        ODCurareEvaluationAndReportingLibraryCore();
        Class v15 = objc_getClass("ODCurareEvaluationAndReportingModule");
        *(void *)(v54[1] + 24) = v15;
        getODCurareEvaluationAndReportingModuleClass_softClass Class = *(void *)(v54[1] + 24);
        uint64_t v14 = (void *)v47[3];
      }
      uint64_t v16 = v14;
      _Block_object_dispose(&v46, 8);
      id v17 = [v16 alloc];
      uint64_t v18 = [v8 bundleIdentifier];
      id v45 = 0;
      uint64_t v19 = (void *)[v17 initWithBundleIdentifier:v18 dataProviderInstance:self evaluationInstance:self personalizationInstance:self pruningPolicy:v13 error:&v45];
      id v20 = v45;
      [(_PSPersonalizationEvaluation *)self setCurareEvaluationAndReporting:v19];

      if (v20)
      {
        v21 = personalizationLog;
        if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v20;
          _os_log_impl(&dword_1A314B000, v21, OS_LOG_TYPE_INFO, "Failed to create ODCurareEvaluationAndReporting instance with error %@", (uint8_t *)&buf, 0xCu);
        }
        char v22 = [v20 localizedDescription];
      }
      else
      {
        [(_PSPersonalizationEvaluation *)self generateCandidateModels];
        objc_super v23 = [(_PSPersonalizationEvaluation *)self modelTagToCandidateModel];
        char v42 = [v23 allValues];

        if ((*((unsigned int (**)(void))self->_shouldContinue + 2))())
        {
          uint64_t v46 = 0;
          Class v47 = &v46;
          uint64_t v48 = 0x2050000000;
          uint64_t v24 = (void *)getODCurareModelSelectionParameterClass_softClass;
          uint64_t v49 = getODCurareModelSelectionParameterClass_softClass;
          if (!getODCurareModelSelectionParameterClass_softClass)
          {
            *(void *)&long long buf = MEMORY[0x1E4F143A8];
            *((void *)&buf + 1) = 3221225472;
            uint64_t v52 = __getODCurareModelSelectionParameterClass_block_invoke;
            uint64_t v53 = &unk_1E5ADE858;
            uint64_t v54 = &v46;
            ODCurareEvaluationAndReportingLibraryCore();
            Class v25 = objc_getClass("ODCurareModelSelectionParameter");
            *(void *)(v54[1] + 24) = v25;
            getODCurareModelSelectionParameterClass_softClass Class = *(void *)(v54[1] + 24);
            uint64_t v24 = (void *)v47[3];
          }
          v26 = v24;
          _Block_object_dispose(&v46, 8);
          v27 = (void *)[[v26 alloc] initWithMetricName:@"engagement rate new" percentageIncrease:0.05];
          v50 = v27;
          uint64_t v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v50 count:1];

          uint64_t v46 = 0;
          Class v47 = &v46;
          uint64_t v48 = 0x2050000000;
          v29 = (void *)getODCurareModelSelectionPolicyClass_softClass;
          uint64_t v49 = getODCurareModelSelectionPolicyClass_softClass;
          if (!getODCurareModelSelectionPolicyClass_softClass)
          {
            *(void *)&long long buf = MEMORY[0x1E4F143A8];
            *((void *)&buf + 1) = 3221225472;
            uint64_t v52 = __getODCurareModelSelectionPolicyClass_block_invoke;
            uint64_t v53 = &unk_1E5ADE858;
            uint64_t v54 = &v46;
            ODCurareEvaluationAndReportingLibraryCore();
            Class v30 = objc_getClass("ODCurareModelSelectionPolicy");
            *(void *)(v54[1] + 24) = v30;
            getODCurareModelSelectionPolicyClass_softClass Class = *(void *)(v54[1] + 24);
            v29 = (void *)v47[3];
          }
          v31 = v29;
          _Block_object_dispose(&v46, 8);
          long long v41 = (void *)[[v31 alloc] initWithModelSelectionParameters:v28 minimumNumberOfEvaluations:&unk_1EF675600 minimumNumberOfSamples:0];
          uint64_t v46 = 0;
          Class v47 = &v46;
          uint64_t v48 = 0x2050000000;
          char v32 = (void *)getODCurarePersonalizationPolicyClass_softClass;
          uint64_t v49 = getODCurarePersonalizationPolicyClass_softClass;
          if (!getODCurarePersonalizationPolicyClass_softClass)
          {
            *(void *)&long long buf = MEMORY[0x1E4F143A8];
            *((void *)&buf + 1) = 3221225472;
            uint64_t v52 = __getODCurarePersonalizationPolicyClass_block_invoke;
            uint64_t v53 = &unk_1E5ADE858;
            uint64_t v54 = &v46;
            ODCurareEvaluationAndReportingLibraryCore();
            Class v33 = objc_getClass("ODCurarePersonalizationPolicy");
            *(void *)(v54[1] + 24) = v33;
            getODCurarePersonalizationPolicyClass_softClass Class = *(void *)(v54[1] + 24);
            char v32 = (void *)v47[3];
          }
          uint64_t v34 = v32;
          _Block_object_dispose(&v46, 8);
          int v35 = (void *)[[v34 alloc] initWithModelSelectionParameters:v28 minimumNumberOfSamplesForPersonalization:&unk_1EF675540 minimumNumberOfSamplesForPersonalizationSelection:&unk_1EF675600];
          v36 = [(_PSPersonalizationEvaluation *)self curareEvaluationAndReporting];
          id v44 = 0;
          [v36 trainAndEvaluateModelsWithCandidateModels:v42 personalizationPolicy:v35 selectionPolicy:v41 error:&v44];
          id v20 = v44;

          if (v20)
          {
            if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_ERROR)) {
              -[_PSPersonalizationEvaluation runAdaptationAndEvaluationWithFeaturesConfigDeployPath:adaptableModelDeployPath:]();
            }
            objc_msgSend(v20, "localizedDescription", v41);
            char v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else if ((*((unsigned int (**)(void))self->_shouldContinue + 2))())
          {
            v37 = [(_PSPersonalizationEvaluation *)self curareEvaluationAndReporting];
            id v43 = 0;
            uint64_t v38 = [v37 getSelectedModel:&v43];
            id v20 = v43;

            v39 = personalizationLog;
            if (v20)
            {
              if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_ERROR)) {
                -[_PSPersonalizationEvaluation runAdaptationAndEvaluationWithFeaturesConfigDeployPath:adaptableModelDeployPath:]();
              }
              objc_msgSend(v20, "localizedDescription", v41);
              char v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
              {
                LODWORD(buf) = 138412290;
                *(void *)((char *)&buf + 4) = v38;
                _os_log_impl(&dword_1A314B000, v39, OS_LOG_TYPE_INFO, "Model: %@", (uint8_t *)&buf, 0xCu);
              }
              char v22 = &stru_1EF653EA8;
            }
          }
          else
          {
            id v20 = 0;
            char v22 = @"Asked to stop";
          }
        }
        else
        {
          id v20 = 0;
          char v22 = @"Asked to stop";
        }
      }
    }
    else
    {
      char v22 = @"Asked to stop";
    }
  }
  else
  {
    char v22 = @"Prereqs are not satisfied";
  }

  return v22;
}

- (id)loadDefaultModel
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = +[_PSBehaviorRuleRankingUtilities getTrialCompiledMLModelPath];
  v3 = personalizationLog;
  if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
  {
    int v13 = 138412290;
    uint64_t v14 = v2;
    _os_log_impl(&dword_1A314B000, v3, OS_LOG_TYPE_INFO, "dodML is trying to load trialCompiledMLModel from path: %@", (uint8_t *)&v13, 0xCu);
  }
  uint64_t v4 = +[_PSBehaviorRuleRankingUtilities loadMLModel:v2 modelConfig:0];
  if (v4)
  {
    BOOL v5 = (void *)v4;
    id v6 = personalizationLog;
    if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412290;
      uint64_t v14 = v2;
      _os_log_impl(&dword_1A314B000, v6, OS_LOG_TYPE_INFO, "Trial model is loaded for adaptation from path: %@", (uint8_t *)&v13, 0xCu);
    }
    id v7 = v5;
  }
  else
  {
    uint64_t v8 = +[_PSBehaviorRuleRankingUtilities getDeployedCompiledMLModelPath];
    id v9 = personalizationLog;
    if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412290;
      uint64_t v14 = v8;
      _os_log_impl(&dword_1A314B000, v9, OS_LOG_TYPE_INFO, "dodML is trying to load deployedCompiledMLModel from path: %@", (uint8_t *)&v13, 0xCu);
    }
    id v7 = +[_PSBehaviorRuleRankingUtilities loadMLModel:v8 modelConfig:0];
    uint64_t v10 = personalizationLog;
    if (v7)
    {
      if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
      {
        int v13 = 138412290;
        uint64_t v14 = v8;
        _os_log_impl(&dword_1A314B000, v10, OS_LOG_TYPE_INFO, "Deployed default model is loaded for adaptation from path: %@", (uint8_t *)&v13, 0xCu);
      }
      id v11 = v7;
    }
    else if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_ERROR))
    {
      -[_PSPersonalizationEvaluation loadDefaultModel]();
    }
  }

  return v7;
}

- (BOOL)cloneAdaptableModel:(id)a3 toFilePath:(id)a4 originalXgboostModelName:(id)a5 clonedXgboostModelName:(id)a6
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (+[_PSBehaviorRuleRankingUtilities removeFolderAtPath:v10])
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
    id v25 = 0;
    char v14 = [v13 copyItemAtPath:v9 toPath:v10 error:&v25];
    id v15 = v25;
    if (v15 || (v14 & 1) == 0)
    {
      char v22 = personalizationLog;
      if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412802;
        id v27 = v9;
        __int16 v28 = 2112;
        id v29 = v10;
        __int16 v30 = 2112;
        id v31 = v15;
        _os_log_error_impl(&dword_1A314B000, v22, OS_LOG_TYPE_ERROR, "While cloning adaptable model, copying folder from path:%@ to path:%@ failed with error：%@", buf, 0x20u);
      }
      char v20 = 0;
    }
    else
    {
      uint64_t v16 = [v10 stringByAppendingString:@"/"];
      id v17 = [v16 stringByAppendingString:v11];

      uint64_t v18 = [v10 stringByAppendingString:@"/"];
      uint64_t v19 = [v18 stringByAppendingString:v12];

      id v24 = 0;
      char v20 = [v13 moveItemAtPath:v17 toPath:v19 error:&v24];
      id v15 = v24;
      if (v15) {
        char v20 = 0;
      }
      if ((v20 & 1) == 0)
      {
        v21 = personalizationLog;
        if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412802;
          id v27 = v17;
          __int16 v28 = 2112;
          id v29 = v19;
          __int16 v30 = 2112;
          id v31 = v15;
          _os_log_error_impl(&dword_1A314B000, v21, OS_LOG_TYPE_ERROR, "While cloning adaptable model, renaming file with path:%@ to path:%@ failed with error：%@", buf, 0x20u);
        }
      }
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_ERROR)) {
      -[_PSPersonalizationEvaluation cloneAdaptableModel:toFilePath:originalXgboostModelName:clonedXgboostModelName:]();
    }
    char v20 = 0;
  }

  return v20;
}

- (void)updateAdaptableModelConfigWithUpdateType:(int64_t)a3 numTrees:(id)a4
{
  v44[7] = *MEMORY[0x1E4F143B8];
  id v36 = a4;
  uint64_t v37 = 0;
  uint64_t v38 = &v37;
  uint64_t v39 = 0x2050000000;
  id v6 = (void *)getMLModelConfigurationClass_softClass_1;
  uint64_t v40 = getMLModelConfigurationClass_softClass_1;
  if (!getMLModelConfigurationClass_softClass_1)
  {
    CoreMLLibraryCore_5();
    v38[3] = (uint64_t)objc_getClass("MLModelConfiguration");
    getMLModelConfigurationClass_softClass_1 = v38[3];
    id v6 = (void *)v38[3];
  }
  id v7 = v6;
  _Block_object_dispose(&v37, 8);
  id v8 = objc_alloc_init(v7);
  [(_PSPersonalizationEvaluation *)self setAdaptableModelConfiguration:v8];

  id v9 = [(_PSPersonalizationEvaluation *)self adaptableModelConfiguration];
  [v9 setComputeUnits:0];

  int v35 = [getMLParameterKeyClass_0() numClasses];
  if (a3 == 2)
  {
    v43[0] = v35;
    id v10 = NSNumber;
    uint64_t v34 = [(_PSPersonalizationEvaluation *)self numClasses];
    Class v33 = objc_msgSend(v10, "numberWithInt:", objc_msgSend(v34, "intValue"));
    v44[0] = v33;
    uint64_t v32 = [getMLParameterKeyClass_0() numTrees];
    v43[1] = v32;
    id v31 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v36, "intValue"));
    v44[1] = v31;
    __int16 v30 = [getMLParameterKeyClass_0() maxDepth];
    v43[2] = v30;
    id v11 = NSNumber;
    id v29 = [(_PSPersonalizationEvaluation *)self maxDepth];
    __int16 v28 = objc_msgSend(v11, "numberWithInt:", objc_msgSend(v29, "intValue"));
    v44[2] = v28;
    id v12 = [getMLParameterKeyClass_0() learningRate];
    v43[3] = v12;
    id v13 = NSNumber;
    char v14 = [(_PSPersonalizationEvaluation *)self learningRate];
    [v14 floatValue];
    id v15 = objc_msgSend(v13, "numberWithFloat:");
    v44[3] = v15;
    uint64_t v16 = [getMLParameterKeyClass_0() minChildWeight];
    v43[4] = v16;
    id v17 = NSNumber;
    uint64_t v18 = [(_PSPersonalizationEvaluation *)self minChildWeight];
    [v18 floatValue];
    uint64_t v19 = objc_msgSend(v17, "numberWithFloat:");
    v44[4] = v19;
    char v20 = [getMLParameterKeyClass_0() objective];
    v43[5] = v20;
    v44[5] = @"binary:logistic";
    v21 = [getMLParameterKeyClass_0() updateType];
    v43[6] = v21;
    v44[6] = @"treeRefresh";
    char v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:v43 count:7];
    objc_super v23 = [(_PSPersonalizationEvaluation *)self adaptableModelConfiguration];
    [v23 setParameters:v22];
  }
  else
  {
    v41[0] = v35;
    id v24 = NSNumber;
    uint64_t v34 = [(_PSPersonalizationEvaluation *)self numClasses];
    Class v33 = objc_msgSend(v24, "numberWithInt:", objc_msgSend(v34, "intValue"));
    v42[0] = v33;
    uint64_t v32 = [getMLParameterKeyClass_0() numTrees];
    v41[1] = v32;
    id v31 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v36, "intValue"));
    v42[1] = v31;
    __int16 v30 = [getMLParameterKeyClass_0() maxDepth];
    v41[2] = v30;
    id v25 = NSNumber;
    id v29 = [(_PSPersonalizationEvaluation *)self maxDepth];
    __int16 v28 = objc_msgSend(v25, "numberWithInt:", objc_msgSend(v29, "intValue"));
    v42[2] = v28;
    id v12 = [getMLParameterKeyClass_0() learningRate];
    v41[3] = v12;
    v26 = NSNumber;
    char v14 = [(_PSPersonalizationEvaluation *)self learningRate];
    [v14 floatValue];
    id v15 = objc_msgSend(v26, "numberWithFloat:");
    v42[3] = v15;
    uint64_t v16 = [getMLParameterKeyClass_0() minChildWeight];
    v41[4] = v16;
    id v27 = NSNumber;
    uint64_t v18 = [(_PSPersonalizationEvaluation *)self minChildWeight];
    [v18 floatValue];
    uint64_t v19 = objc_msgSend(v27, "numberWithFloat:");
    v42[4] = v19;
    char v20 = [getMLParameterKeyClass_0() objective];
    v41[5] = v20;
    v42[5] = @"binary:logistic";
    v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:6];
    char v22 = [(_PSPersonalizationEvaluation *)self adaptableModelConfiguration];
    [v22 setParameters:v21];
  }
}

- (id)loadAdaptableModelUnderDirectory:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(_PSPersonalizationEvaluation *)self adaptationStrategy];
  id v6 = [(_PSPersonalizationEvaluation *)self numTrees];
  [(_PSPersonalizationEvaluation *)self updateAdaptableModelConfigWithUpdateType:v5 numTrees:v6];

  +[_PSBehaviorRuleRankingUtilities loadDeployedAdaptableModelUnderDirectory:v4];
  id v7 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  id v8 = +[_PSBehaviorRuleRankingUtilities getIntermediateAdaptableCompiledMLModel];
  id v9 = +[_PSBehaviorRuleRankingUtilities getTrialCompiledAdaptableMLModelPath];
  if ([v7 fileExistsAtPath:v9])
  {
    if ([(_PSPersonalizationEvaluation *)self cloneAdaptableModel:v9 toFilePath:v8 originalXgboostModelName:@"TrialAdaptableRuleImportancePredictor.xgboost" clonedXgboostModelName:@"IntermediateAdaptableModel.xgboost"])
    {
      goto LABEL_3;
    }
LABEL_12:
    if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_ERROR)) {
      -[_PSPersonalizationEvaluation loadAdaptableModelUnderDirectory:]();
    }
    goto LABEL_17;
  }
  char v20 = +[_PSBehaviorRuleRankingUtilities getDeployedAdaptableCompiledMLModelPath];
  if (([v7 fileExistsAtPath:v20] & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_ERROR)) {
      -[_PSPersonalizationEvaluation loadAdaptableModelUnderDirectory:]();
    }

    goto LABEL_17;
  }
  BOOL v21 = [(_PSPersonalizationEvaluation *)self cloneAdaptableModel:v20 toFilePath:v8 originalXgboostModelName:@"AdaptableRuleImportancePredictor.xgboost" clonedXgboostModelName:@"IntermediateAdaptableModel.xgboost"];

  if (!v21) {
    goto LABEL_12;
  }
LABEL_3:
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:v8];
  [(_PSPersonalizationEvaluation *)self setIntermediateCompiledModelURL:v10];

  id v11 = [(_PSPersonalizationEvaluation *)self intermediateCompiledModelURL];

  if (!v11)
  {
LABEL_17:
    id v19 = 0;
    goto LABEL_22;
  }
  uint64_t v29 = 0;
  __int16 v30 = &v29;
  uint64_t v31 = 0x2050000000;
  id v12 = (void *)getMLModelClass_softClass_6;
  uint64_t v32 = getMLModelClass_softClass_6;
  if (!getMLModelClass_softClass_6)
  {
    *(void *)long long buf = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    v26 = __getMLModelClass_block_invoke_6;
    id v27 = &unk_1E5ADE858;
    __int16 v28 = &v29;
    CoreMLLibraryCore_5();
    v30[3] = (uint64_t)objc_getClass("MLModel");
    getMLModelClass_softClass_6 = *(void *)(v28[1] + 24);
    id v12 = (void *)v30[3];
  }
  id v13 = v12;
  _Block_object_dispose(&v29, 8);
  char v14 = [(_PSPersonalizationEvaluation *)self intermediateCompiledModelURL];
  id v15 = [(_PSPersonalizationEvaluation *)self adaptableModelConfiguration];
  id v23 = 0;
  uint64_t v16 = [v13 modelWithContentsOfURL:v14 configuration:v15 error:&v23];
  id v17 = v23;

  uint64_t v18 = personalizationLog;
  if (v17)
  {
    if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_ERROR)) {
      [(_PSPersonalizationEvaluation *)v18 loadAdaptableModelUnderDirectory:(uint64_t)v17];
    }
    id v19 = 0;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1A314B000, v18, OS_LOG_TYPE_INFO, "Cloning adaptable ML model to intermediate model and loading it was successful", buf, 2u);
    }
    id v19 = v16;
  }

LABEL_22:

  return v19;
}

- (id)processDataWithQuery:(id)a3 balanceNeed:(BOOL)a4
{
  BOOL v139 = a4;
  uint64_t v198 = *MEMORY[0x1E4F143B8];
  id v135 = a3;
  unint64_t v4 = 0x1E4F1C000uLL;
  long long v141 = objc_opt_new();
  long long v140 = objc_opt_new();
  int64_t v5 = personalizationLog;
  if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1A314B000, v5, OS_LOG_TYPE_INFO, "In processDataWithQuery", buf, 2u);
  }
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = 10;
  while (1)
  {
    unint64_t v136 = v8;
    context = (void *)MEMORY[0x1A6243860]();
    [v135 setLimit:10];
    uint64_t v137 = v6;
    [v135 setOffset:v6];
    id v9 = [(_PSPersonalizationEvaluation *)self knowledgeStore];
    id v187 = 0;
    id v10 = [v9 executeQuery:v135 error:&v187];
    id v11 = v187;

    id v12 = (void *)personalizationLog;
    if (v11) {
      break;
    }
    if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
    {
      id v13 = NSNumber;
      char v14 = v12;
      id v15 = objc_msgSend(v13, "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
      *(_DWORD *)long long buf = 138412290;
      v197 = v15;
      _os_log_impl(&dword_1A314B000, v14, OS_LOG_TYPE_INFO, "knowledgeEvents parsing, number of events: %@", buf, 0xCu);
    }
    long long v185 = 0u;
    long long v186 = 0u;
    long long v183 = 0u;
    long long v184 = 0u;
    obuint64_t j = v10;
    uint64_t v16 = [obj countByEnumeratingWithState:&v183 objects:v195 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v184;
      uint64_t v142 = *(void *)v184;
      do
      {
        uint64_t v19 = 0;
        uint64_t v143 = v17;
        do
        {
          if (*(void *)v184 != v18) {
            objc_enumerationMutation(obj);
          }
          char v20 = *(void **)(*((void *)&v183 + 1) + 8 * v19);
          if (v20)
          {
            __int16 v146 = *(void **)(*((void *)&v183 + 1) + 8 * v19);
            uint64_t v147 = v19;
            BOOL v21 = [v20 metadata];
            char v22 = [MEMORY[0x1E4F5B4C0] featureDict];
            id v23 = [v21 objectForKeyedSubscript:v22];

            v153 = v23;
            if (v23)
            {
              id v24 = (void *)personalizationLog;
              if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
              {
                uint64_t v25 = NSNumber;
                v26 = v24;
                id v27 = objc_msgSend(v25, "numberWithUnsignedInteger:", objc_msgSend(v23, "count"));
                *(_DWORD *)long long buf = 138412290;
                v197 = v27;
                _os_log_impl(&dword_1A314B000, v26, OS_LOG_TYPE_INFO, "number of data points: %@", buf, 0xCu);
              }
              if (objc_msgSend(v23, "count", v135))
              {
                uint64_t v7 = (v7 + 1);
                __int16 v28 = (void *)personalizationLog;
                if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
                {
                  uint64_t v29 = NSNumber;
                  __int16 v30 = v28;
                  uint64_t v31 = [v23 objectAtIndexedSubscript:0];
                  uint64_t v32 = objc_msgSend(v29, "numberWithUnsignedInteger:", objc_msgSend(v31, "count"));
                  *(_DWORD *)long long buf = 138412290;
                  v197 = v32;
                  _os_log_impl(&dword_1A314B000, v30, OS_LOG_TYPE_INFO, "data point dimension: %@", buf, 0xCu);
                }
              }
              Class v33 = (void *)personalizationLog;
              if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
              {
                uint64_t v34 = NSNumber;
                int v35 = v33;
                id v36 = [v34 numberWithInt:v7];
                *(_DWORD *)long long buf = 138412290;
                v197 = v36;
                _os_log_impl(&dword_1A314B000, v35, OS_LOG_TYPE_INFO, "countEvents: %@", buf, 0xCu);
              }
              unsigned int v145 = v7;
              if (v7 == 1 && [v153 count])
              {
                uint64_t v37 = [(_PSPersonalizationEvaluation *)self selectedFeaturesConfig];
                uint64_t v38 = [v37 objectForKeyedSubscript:@"_PSRuleMiningModelFeatureSet"];

                id v39 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
                [(_PSPersonalizationEvaluation *)self setFeatureNameDict:v39];

                long long v181 = 0u;
                long long v182 = 0u;
                long long v179 = 0u;
                long long v180 = 0u;
                id v40 = v38;
                uint64_t v41 = [v40 countByEnumeratingWithState:&v179 objects:v194 count:16];
                if (v41)
                {
                  uint64_t v42 = 0;
                  uint64_t v43 = *(void *)v180;
                  do
                  {
                    uint64_t v44 = 0;
                    uint64_t v45 = v42;
                    do
                    {
                      if (*(void *)v180 != v43) {
                        objc_enumerationMutation(v40);
                      }
                      uint64_t v46 = *(void *)(*((void *)&v179 + 1) + 8 * v44);
                      Class v47 = [(_PSPersonalizationEvaluation *)self featureNameDict];
                      uint64_t v48 = [NSNumber numberWithInt:v45 + v44];
                      [v47 setValue:v48 forKey:v46];

                      ++v44;
                    }
                    while (v41 != v44);
                    uint64_t v41 = [v40 countByEnumeratingWithState:&v179 objects:v194 count:16];
                    uint64_t v42 = (v45 + v44);
                  }
                  while (v41);
                  uint64_t v41 = (v45 + v44);
                }

                uint64_t v49 = [(_PSPersonalizationEvaluation *)self featureNameDict];
                v50 = [NSNumber numberWithInt:v41];
                [v49 setValue:v50 forKey:@"personAndAppMatched"];

                uint64_t v51 = [(_PSPersonalizationEvaluation *)self featureNameDict];
                uint64_t v52 = [NSNumber numberWithInt:(v41 + 1)];
                [v51 setValue:v52 forKey:@"recipientAndBundleIDAsInteger"];

                uint64_t v53 = [(_PSPersonalizationEvaluation *)self featureNameDict];
                uint64_t v54 = [NSNumber numberWithInt:(v41 + 2)];
                [v53 setValue:v54 forKey:@"predictedClass"];

                uint64_t v55 = (void *)personalizationLog;
                if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
                {
                  v56 = v55;
                  uint64_t v57 = [(_PSPersonalizationEvaluation *)self featureNameDict];
                  *(_DWORD *)long long buf = 138412290;
                  v197 = v57;
                  _os_log_impl(&dword_1A314B000, v56, OS_LOG_TYPE_INFO, "featureNameDict: %@", buf, 0xCu);
                }
              }
              id v149 = objc_alloc_init(*(Class *)(v4 + 2632));
              if (v139)
              {
                id v148 = objc_alloc_init(*(Class *)(v4 + 2632));
                if ([v153 count])
                {
                  uint64_t v151 = 0;
                  while (1)
                  {
                    id v58 = objc_alloc_init(*(Class *)(v4 + 2632));
                    long long v175 = 0u;
                    long long v176 = 0u;
                    long long v177 = 0u;
                    long long v178 = 0u;
                    uint64_t v59 = [(_PSPersonalizationEvaluation *)self featureNameDict];
                    uint64_t v60 = [v59 countByEnumeratingWithState:&v175 objects:v193 count:16];
                    if (v60)
                    {
                      uint64_t v61 = v60;
                      uint64_t v62 = *(void *)v176;
                      do
                      {
                        for (uint64_t i = 0; i != v61; ++i)
                        {
                          if (*(void *)v176 != v62) {
                            objc_enumerationMutation(v59);
                          }
                          if (([*(id *)(*((void *)&v175 + 1) + 8 * i) isEqualToString:@"predictedClass"] & 1) == 0)
                          {
                            int64_t v64 = objc_opt_new();
                            [v58 addObject:v64];
                          }
                        }
                        uint64_t v61 = [v59 countByEnumeratingWithState:&v175 objects:v193 count:16];
                      }
                      while (v61);
                    }

                    long long v173 = 0u;
                    long long v174 = 0u;
                    long long v171 = 0u;
                    long long v172 = 0u;
                    v65 = [(_PSPersonalizationEvaluation *)self featureNameDict];
                    uint64_t v66 = [v65 countByEnumeratingWithState:&v171 objects:v192 count:16];
                    if (!v66) {
                      break;
                    }
                    uint64_t v67 = v66;
                    char v68 = 0;
                    uint64_t v69 = *(void *)v172;
                    id v150 = v65;
                    do
                    {
                      for (uint64_t j = 0; j != v67; ++j)
                      {
                        if (*(void *)v172 != v69) {
                          objc_enumerationMutation(v150);
                        }
                        id v71 = *(void **)(*((void *)&v171 + 1) + 8 * j);
                        if (([v71 isEqualToString:@"predictedClass"] & 1) == 0)
                        {
                          v72 = [(_PSPersonalizationEvaluation *)self featureNameDict];
                          v73 = [v72 objectForKeyedSubscript:v71];
                          int v74 = [v73 intValue];
                          unint64_t v75 = [v58 count];

                          if (v75 > v74)
                          {
                            uint64_t v76 = [v153 objectAtIndexedSubscript:v151];
                            v77 = [v76 objectForKeyedSubscript:v71];
                            v78 = [(_PSPersonalizationEvaluation *)self featureNameDict];
                            id v79 = [v78 objectForKeyedSubscript:v71];
                            objc_msgSend(v58, "setObject:atIndexedSubscript:", v77, (int)objc_msgSend(v79, "intValue"));
                          }
                        }
                        if ([v71 isEqualToString:@"personAndAppMatched"])
                        {
                          uint64_t v80 = [v153 objectAtIndexedSubscript:v151];
                          v81 = [v80 objectForKeyedSubscript:v71];

                          v68 |= [v81 intValue] == 1;
                        }
                      }
                      uint64_t v67 = [v150 countByEnumeratingWithState:&v171 objects:v192 count:16];
                    }
                    while (v67);

                    unint64_t v4 = 0x1E4F1C000;
                    if ((v68 & 1) == 0) {
                      goto LABEL_61;
                    }
                    char v82 = (void *)[v58 copy];
                    v83 = v149;
LABEL_62:
                    [v83 addObject:v82];

                    if ([v153 count] <= (unint64_t)++v151) {
                      goto LABEL_63;
                    }
                  }

LABEL_61:
                  char v82 = (void *)[v58 copy];
                  v83 = v148;
                  goto LABEL_62;
                }
LABEL_63:
                id v84 = objc_alloc_init(*(Class *)(v4 + 2632));
                long long v167 = 0u;
                long long v168 = 0u;
                long long v169 = 0u;
                long long v170 = 0u;
                id v85 = v149;
                uint64_t v86 = [v85 countByEnumeratingWithState:&v167 objects:v191 count:16];
                if (v86)
                {
                  uint64_t v87 = v86;
                  uint64_t v88 = *(void *)v168;
                  do
                  {
                    for (uint64_t k = 0; k != v87; ++k)
                    {
                      if (*(void *)v168 != v88) {
                        objc_enumerationMutation(v85);
                      }
                      v90 = (void *)[*(id *)(*((void *)&v167 + 1) + 8 * k) copy];
                      [v84 addObject:v90];
                    }
                    uint64_t v87 = [v85 countByEnumeratingWithState:&v167 objects:v191 count:16];
                  }
                  while (v87);
                }

                [v148 shuffle];
                unint64_t v91 = [v85 count];
                id v92 = (void *)personalizationLog;
                if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
                {
                  v93 = NSNumber;
                  long long v94 = v92;
                  v95 = [v93 numberWithUnsignedLong:v91];
                  *(_DWORD *)long long buf = 138412290;
                  v197 = v95;
                  _os_log_impl(&dword_1A314B000, v94, OS_LOG_TYPE_INFO, "posCount: %@", buf, 0xCu);
                }
                long long v165 = 0u;
                long long v166 = 0u;
                long long v163 = 0u;
                long long v164 = 0u;
                id v96 = v148;
                uint64_t v97 = [v96 countByEnumeratingWithState:&v163 objects:v190 count:16];
                if (v97)
                {
                  uint64_t v98 = v97;
                  unint64_t v99 = 0;
                  uint64_t v100 = *(void *)v164;
LABEL_74:
                  uint64_t v101 = 0;
                  if (v91 >= v99) {
                    uint64_t v102 = v91 - v99;
                  }
                  else {
                    uint64_t v102 = 0;
                  }
                  while (1)
                  {
                    if (*(void *)v164 != v100) {
                      objc_enumerationMutation(v96);
                    }
                    if (v102 == v101) {
                      break;
                    }
                    uint64_t v103 = (void *)[*(id *)(*((void *)&v163 + 1) + 8 * v101) copy];
                    [v84 addObject:v103];

                    if (v98 == ++v101)
                    {
                      uint64_t v98 = [v96 countByEnumeratingWithState:&v163 objects:v190 count:16];
                      v99 += v101;
                      if (v98) {
                        goto LABEL_74;
                      }
                      break;
                    }
                  }
                }

                [v141 addObject:v84];
                uint64_t v104 = v149;
              }
              else
              {
                if ([v153 count])
                {
                  unint64_t v152 = 0;
                  do
                  {
                    id v105 = objc_alloc_init(*(Class *)(v4 + 2632));
                    long long v159 = 0u;
                    long long v160 = 0u;
                    long long v161 = 0u;
                    long long v162 = 0u;
                    uint64_t v106 = [(_PSPersonalizationEvaluation *)self featureNameDict];
                    uint64_t v107 = [v106 countByEnumeratingWithState:&v159 objects:v189 count:16];
                    if (v107)
                    {
                      uint64_t v108 = v107;
                      uint64_t v109 = *(void *)v160;
                      do
                      {
                        for (uint64_t m = 0; m != v108; ++m)
                        {
                          if (*(void *)v160 != v109) {
                            objc_enumerationMutation(v106);
                          }
                          if (([*(id *)(*((void *)&v159 + 1) + 8 * m) isEqualToString:@"predictedClass"] & 1) == 0)
                          {
                            v111 = objc_opt_new();
                            [v105 addObject:v111];
                          }
                        }
                        uint64_t v108 = [v106 countByEnumeratingWithState:&v159 objects:v189 count:16];
                      }
                      while (v108);
                    }

                    long long v157 = 0u;
                    long long v158 = 0u;
                    long long v155 = 0u;
                    long long v156 = 0u;
                    uint64_t v112 = [(_PSPersonalizationEvaluation *)self featureNameDict];
                    uint64_t v113 = [v112 countByEnumeratingWithState:&v155 objects:v188 count:16];
                    if (v113)
                    {
                      uint64_t v114 = v113;
                      uint64_t v115 = *(void *)v156;
                      do
                      {
                        for (uint64_t n = 0; n != v114; ++n)
                        {
                          if (*(void *)v156 != v115) {
                            objc_enumerationMutation(v112);
                          }
                          uint64_t v117 = *(void **)(*((void *)&v155 + 1) + 8 * n);
                          if (([v117 isEqualToString:@"predictedClass"] & 1) == 0)
                          {
                            uint64_t v118 = [(_PSPersonalizationEvaluation *)self featureNameDict];
                            uint64_t v119 = [v118 objectForKeyedSubscript:v117];
                            int v120 = [v119 intValue];
                            unint64_t v121 = [v105 count];

                            if (v121 > v120)
                            {
                              v122 = [v153 objectAtIndexedSubscript:v152];
                              long long v123 = [v122 objectForKeyedSubscript:v117];
                              long long v124 = [(_PSPersonalizationEvaluation *)self featureNameDict];
                              long long v125 = [v124 objectForKeyedSubscript:v117];
                              objc_msgSend(v105, "setObject:atIndexedSubscript:", v123, (int)objc_msgSend(v125, "intValue"));
                            }
                          }
                        }
                        uint64_t v114 = [v112 countByEnumeratingWithState:&v155 objects:v188 count:16];
                      }
                      while (v114);
                    }

                    long long v126 = (void *)[v105 copy];
                    [v149 addObject:v126];

                    ++v152;
                    unint64_t v4 = 0x1E4F1C000;
                  }
                  while ([v153 count] > v152);
                }
                uint64_t v104 = v149;
                [v141 addObject:v149];
              }

              long long v127 = [v146 startDate];
              [v140 addObject:v127];

              uint64_t v7 = v145;
              uint64_t v18 = v142;
              uint64_t v17 = v143;
            }

            uint64_t v19 = v147;
          }
          ++v19;
        }
        while (v19 != v17);
        uint64_t v17 = [obj countByEnumeratingWithState:&v183 objects:v195 count:16];
      }
      while (v17);
    }

    uint64_t v6 = v137 + 10;
    uint64_t v8 = v136 + 10;
    if (v136 >= 0x5B)
    {
      long long v128 = (void *)personalizationLog;
      if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
      {
        long long v129 = NSNumber;
        long long v130 = v128;
        long long v131 = [v129 numberWithInt:v7];
        *(_DWORD *)long long buf = 138412290;
        v197 = v131;
        _os_log_impl(&dword_1A314B000, v130, OS_LOG_TYPE_INFO, "knowledge store events with data: %@", buf, 0xCu);
      }
      long long v132 = v141;
      id v133 = v141;
      goto LABEL_117;
    }
  }
  if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_ERROR)) {
    -[_PSPersonalizationEvaluation processDataWithQuery:balanceNeed:]();
  }

  id v133 = 0;
  long long v132 = v141;
LABEL_117:

  return v133;
}

- (id)createMLFeatureProviderArrayFromSingleShareEventData:(id)a3 forMLModel:(id)a4
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v59 = a4;
  id v55 = [MEMORY[0x1E4F1CA48] array];
  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  obuint64_t j = v6;
  uint64_t v58 = [obj countByEnumeratingWithState:&v79 objects:v90 count:16];
  if (!v58)
  {
    uint64_t v62 = 0;
    goto LABEL_39;
  }
  uint64_t v62 = 0;
  uint64_t v57 = *(void *)v80;
  *(void *)&long long v7 = 138412290;
  long long v54 = v7;
  do
  {
    uint64_t v8 = 0;
    do
    {
      if (*(void *)v80 != v57)
      {
        uint64_t v9 = v8;
        objc_enumerationMutation(obj);
        uint64_t v8 = v9;
      }
      uint64_t v60 = v8;
      id v10 = *(void **)(*((void *)&v79 + 1) + 8 * v8);
      context = (void *)MEMORY[0x1A6243860]();
      id v11 = (void *)[v10 mutableCopy];
      id v12 = [(_PSPersonalizationEvaluation *)self featureNameDict];
      v65 = [v12 objectForKeyedSubscript:@"personAndAppMatched"];

      int64_t v64 = objc_msgSend(v11, "objectAtIndexedSubscript:", (int)objc_msgSend(v65, "intValue"));
      uint64_t v83 = 0;
      id v84 = &v83;
      uint64_t v85 = 0x2050000000;
      id v13 = (void *)getMLFeatureValueClass_softClass_0;
      uint64_t v86 = getMLFeatureValueClass_softClass_0;
      if (!getMLFeatureValueClass_softClass_0)
      {
        *(void *)&long long buf = MEMORY[0x1E4F143A8];
        *((void *)&buf + 1) = 3221225472;
        id v92 = __getMLFeatureValueClass_block_invoke_0;
        v93 = &unk_1E5ADE858;
        long long v94 = &v83;
        CoreMLLibraryCore_5();
        Class Class = objc_getClass("MLFeatureValue");
        *(void *)(v94[1] + 24) = Class;
        getMLFeatureValueClass_softClass_0 = *(void *)(v94[1] + 24);
        id v13 = (void *)v84[3];
      }
      id v15 = v13;
      _Block_object_dispose(&v83, 8);
      [v64 floatValue];
      v63 = [v15 featureValueWithInt64:(int)v16];
      if ([v59 isEqualToString:@"classicMLModel"])
      {
        uint64_t v17 = [(_PSPersonalizationEvaluation *)self featureNameDict];
        id v66 = [v17 objectForKeyedSubscript:@"predictedClass"];

        objc_msgSend(v11, "setObject:atIndexedSubscript:", v63, (int)objc_msgSend(v66, "intValue"));
        id v18 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        long long v78 = 0u;
        long long v76 = 0u;
        long long v77 = 0u;
        long long v75 = 0u;
        uint64_t v19 = [(_PSPersonalizationEvaluation *)self featureNameDict];
        uint64_t v20 = [v19 countByEnumeratingWithState:&v75 objects:v89 count:16];
        if (v20)
        {
          uint64_t v21 = *(void *)v76;
          do
          {
            for (uint64_t i = 0; i != v20; ++i)
            {
              if (*(void *)v76 != v21) {
                objc_enumerationMutation(v19);
              }
              uint64_t v23 = *(void *)(*((void *)&v75 + 1) + 8 * i);
              id v24 = [(_PSPersonalizationEvaluation *)self featureNameDict];
              uint64_t v25 = [v24 objectForKeyedSubscript:v23];

              v26 = objc_msgSend(v11, "objectAtIndexedSubscript:", (int)objc_msgSend(v25, "intValue"));
              [v18 setValue:v26 forKey:v23];
            }
            uint64_t v20 = [v19 countByEnumeratingWithState:&v75 objects:v89 count:16];
          }
          while (v20);
        }

        id v27 = objc_alloc((Class)getMLDictionaryFeatureProviderClass_2());
        __int16 v28 = (void *)[v18 copy];
        id v74 = v62;
        uint64_t v67 = (void *)[v27 initWithDictionary:v28 error:&v74];
        id v29 = v74;

        if (!v29)
        {
          [v55 addObject:v67];
          goto LABEL_34;
        }
        __int16 v30 = personalizationLog;
        if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_ERROR))
        {
LABEL_24:
          LODWORD(buf) = v54;
          *(void *)((char *)&buf + 4) = v29;
          _os_log_error_impl(&dword_1A314B000, v30, OS_LOG_TYPE_ERROR, "Error getting sample point into MLDictionaryFeatureProvider format with error:%@", (uint8_t *)&buf, 0xCu);
        }
      }
      else
      {
        if (![v59 isEqualToString:@"adaptableMLModel"]) {
          goto LABEL_35;
        }
        uint64_t v31 = [(_PSPersonalizationEvaluation *)self selectedFeaturesConfig];
        id v66 = [v31 objectForKeyedSubscript:@"_PSRuleMiningModelFeatureSet"];

        id v18 = (id)[MEMORY[0x1E4F1CC08] mutableCopy];
        uint64_t v83 = 0;
        id v84 = &v83;
        uint64_t v85 = 0x2050000000;
        uint64_t v32 = (void *)getMLMultiArrayClass_softClass_2;
        uint64_t v86 = getMLMultiArrayClass_softClass_2;
        if (!getMLMultiArrayClass_softClass_2)
        {
          *(void *)&long long buf = MEMORY[0x1E4F143A8];
          *((void *)&buf + 1) = 3221225472;
          id v92 = __getMLMultiArrayClass_block_invoke_2;
          v93 = &unk_1E5ADE858;
          long long v94 = &v83;
          CoreMLLibraryCore_5();
          Class v33 = objc_getClass("MLMultiArray");
          *(void *)(v94[1] + 24) = v33;
          getMLMultiArrayClass_softClass_2 = *(void *)(v94[1] + 24);
          uint64_t v32 = (void *)v84[3];
        }
        uint64_t v34 = v32;
        _Block_object_dispose(&v83, 8);
        id v35 = [v34 alloc];
        id v36 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v66, "count"));
        uint64_t v88 = v36;
        uint64_t v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v88 count:1];
        id v73 = v62;
        uint64_t v67 = (void *)[v35 initWithShape:v37 dataType:65568 error:&v73];
        id v29 = v73;

        if (!v29)
        {
          long long v71 = 0u;
          long long v72 = 0u;
          long long v69 = 0u;
          long long v70 = 0u;
          id v66 = v66;
          uint64_t v38 = [v66 countByEnumeratingWithState:&v69 objects:v87 count:16];
          if (v38)
          {
            uint64_t v39 = 0;
            uint64_t v40 = *(void *)v70;
            do
            {
              for (uint64_t j = 0; j != v38; ++j)
              {
                if (*(void *)v70 != v40) {
                  objc_enumerationMutation(v66);
                }
                uint64_t v42 = *(void *)(*((void *)&v69 + 1) + 8 * j);
                uint64_t v43 = [(_PSPersonalizationEvaluation *)self featureNameDict];
                uint64_t v44 = [v43 objectForKeyedSubscript:v42];

                uint64_t v45 = objc_msgSend(v11, "objectAtIndexedSubscript:", (int)objc_msgSend(v44, "intValue"));
                uint64_t v46 = NSNumber;
                [v45 floatValue];
                Class v47 = objc_msgSend(v46, "numberWithFloat:");
                [v67 setObject:v47 atIndexedSubscript:v39 + j];
              }
              uint64_t v38 = [v66 countByEnumeratingWithState:&v69 objects:v87 count:16];
              v39 += j;
            }
            while (v38);
          }

          [v18 setObject:v67 forKeyedSubscript:@"input"];
          [v18 setObject:v63 forKeyedSubscript:@"predictedClass"];
          uint64_t v48 = [(_PSPersonalizationEvaluation *)self featureNameDict];
          uint64_t v49 = [v48 objectForKeyedSubscript:@"recipientAndBundleIDAsInteger"];

          v50 = objc_msgSend(v11, "objectAtIndexedSubscript:", (int)objc_msgSend(v49, "intValue"));
          [v18 setObject:v50 forKeyedSubscript:@"recipientAndBundleIDAsInteger"];

          id v51 = objc_alloc((Class)getMLDictionaryFeatureProviderClass_2());
          id v68 = 0;
          uint64_t v52 = (void *)[v51 initWithDictionary:v18 error:&v68];
          id v29 = v68;
          [v55 addObject:v52];

          goto LABEL_34;
        }
        __int16 v30 = personalizationLog;
        if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_ERROR)) {
          goto LABEL_24;
        }
      }
LABEL_34:

      uint64_t v62 = v29;
LABEL_35:

      uint64_t v8 = v60 + 1;
    }
    while (v60 + 1 != v58);
    uint64_t v58 = [obj countByEnumeratingWithState:&v79 objects:v90 count:16];
  }
  while (v58);
LABEL_39:

  return v55;
}

- (void)adaptMLModel:(id)a3 withTrainingData:(id)a4 modelConfiguration:(id)a5
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)personalizationLog;
  if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
  {
    id v12 = v11;
    id v13 = [v10 parameters];
    *(_DWORD *)long long buf = 138412546;
    *(void *)&uint8_t buf[4] = v13;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = [v9 count];
    _os_log_impl(&dword_1A314B000, v12, OS_LOG_TYPE_INFO, "AdaptMLModel config: %@, amount of data: %ld", buf, 0x16u);
  }
  *(void *)long long buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  uint64_t v58 = __Block_byref_object_copy__12;
  id v59 = __Block_byref_object_dispose__12;
  id v60 = 0;
  uint64_t v47 = 0;
  uint64_t v48 = &v47;
  uint64_t v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__12;
  id v51 = __Block_byref_object_dispose__12;
  dispatch_semaphore_t v52 = dispatch_semaphore_create(0);
  id v14 = v9;
  id v15 = personalizationLog;
  if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
  {
    LOWORD(v61) = 0;
    _os_log_impl(&dword_1A314B000, v15, OS_LOG_TYPE_INFO, "Training data prepped for model adaptation", (uint8_t *)&v61, 2u);
  }
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __81___PSPersonalizationEvaluation_adaptMLModel_withTrainingData_modelConfiguration___block_invoke;
  v46[3] = &unk_1E5AE09C0;
  v46[4] = self;
  v46[5] = &v47;
  float v16 = (void *)MEMORY[0x1A6243AD0](v46);
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __81___PSPersonalizationEvaluation_adaptMLModel_withTrainingData_modelConfiguration___block_invoke_350;
  v42[3] = &unk_1E5AE09E8;
  id v17 = v8;
  id v43 = v17;
  uint64_t v44 = buf;
  uint64_t v45 = &v47;
  id v18 = (void *)MEMORY[0x1A6243AD0](v42);
  uint64_t v53 = 0;
  long long v54 = &v53;
  uint64_t v55 = 0x2050000000;
  uint64_t v19 = (void *)getMLUpdateProgressHandlersClass_softClass_0;
  uint64_t v56 = getMLUpdateProgressHandlersClass_softClass_0;
  if (!getMLUpdateProgressHandlersClass_softClass_0)
  {
    *(void *)&long long v61 = MEMORY[0x1E4F143A8];
    *((void *)&v61 + 1) = 3221225472;
    uint64_t v62 = __getMLUpdateProgressHandlersClass_block_invoke_0;
    v63 = &unk_1E5ADE858;
    int64_t v64 = &v53;
    CoreMLLibraryCore_5();
    Class Class = objc_getClass("MLUpdateProgressHandlers");
    *(void *)(v64[1] + 24) = Class;
    getMLUpdateProgressHandlersClass_softClass_0 = *(void *)(v64[1] + 24);
    uint64_t v19 = (void *)v54[3];
  }
  uint64_t v21 = v19;
  _Block_object_dispose(&v53, 8);
  char v22 = (void *)[[v21 alloc] initForEvents:3 progressHandler:v16 completionHandler:v18];
  if (!v14
    || ([v14 array],
        uint64_t v23 = objc_claimAutoreleasedReturnValue(),
        BOOL v24 = [v23 count] == 0,
        v23,
        v24))
  {
    uint64_t v39 = personalizationLog;
    if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
    {
      LOWORD(v61) = 0;
      _os_log_impl(&dword_1A314B000, v39, OS_LOG_TYPE_INFO, "updateTaskForModelAtURL is not initiated due to lack of training data", (uint8_t *)&v61, 2u);
    }
    goto LABEL_24;
  }
  uint64_t v25 = (id)personalizationLog;
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    id v26 = v10;
    id v27 = NSNumber;
    __int16 v28 = [v14 array];
    id v29 = objc_msgSend(v27, "numberWithUnsignedInteger:", objc_msgSend(v28, "count"));
    LODWORD(v61) = 138412290;
    *(void *)((char *)&v61 + 4) = v29;
    _os_log_impl(&dword_1A314B000, v25, OS_LOG_TYPE_INFO, "Update task will be initiated with %@ number of samples", (uint8_t *)&v61, 0xCu);

    id v10 = v26;
  }

  __int16 v30 = (id)personalizationLog;
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    uint64_t v31 = [v10 parameters];
    LODWORD(v61) = 138412290;
    *(void *)((char *)&v61 + 4) = v31;
    _os_log_impl(&dword_1A314B000, v30, OS_LOG_TYPE_INFO, "Config: %@", (uint8_t *)&v61, 0xCu);
  }
  uint64_t v53 = 0;
  long long v54 = &v53;
  uint64_t v55 = 0x2050000000;
  uint64_t v32 = (void *)getMLUpdateTaskClass_softClass_0;
  uint64_t v56 = getMLUpdateTaskClass_softClass_0;
  if (!getMLUpdateTaskClass_softClass_0)
  {
    *(void *)&long long v61 = MEMORY[0x1E4F143A8];
    *((void *)&v61 + 1) = 3221225472;
    uint64_t v62 = __getMLUpdateTaskClass_block_invoke_0;
    v63 = &unk_1E5ADE858;
    int64_t v64 = &v53;
    CoreMLLibraryCore_5();
    Class v33 = objc_getClass("MLUpdateTask");
    *(void *)(v64[1] + 24) = v33;
    getMLUpdateTaskClass_softClass_0 = *(void *)(v64[1] + 24);
    uint64_t v32 = (void *)v54[3];
  }
  id v34 = v32;
  _Block_object_dispose(&v53, 8);
  id v35 = (id *)(*(void *)&buf[8] + 40);
  obuint64_t j = *(id *)(*(void *)&buf[8] + 40);
  id v36 = [v34 updateTaskForModelAtURL:v17 trainingData:v14 configuration:v10 progressHandlers:v22 error:&obj];
  objc_storeStrong(v35, obj);
  if (!*(void *)(*(void *)&buf[8] + 40))
  {
    [v36 resume];
    uint64_t v40 = personalizationLog;
    if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
    {
      LOWORD(v61) = 0;
      _os_log_impl(&dword_1A314B000, v40, OS_LOG_TYPE_INFO, "updateTaskForModelAtURL initiated", (uint8_t *)&v61, 2u);
    }

LABEL_24:
    dispatch_semaphore_wait((dispatch_semaphore_t)v48[5], 0xFFFFFFFFFFFFFFFFLL);
    goto LABEL_25;
  }
  uint64_t v37 = personalizationLog;
  if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
  {
    uint64_t v38 = *(void *)(*(void *)&buf[8] + 40);
    LODWORD(v61) = 138412290;
    *(void *)((char *)&v61 + 4) = v38;
    _os_log_impl(&dword_1A314B000, v37, OS_LOG_TYPE_INFO, "updateTaskForModelAtURL caused error: %@", (uint8_t *)&v61, 0xCu);
  }

LABEL_25:
  _Block_object_dispose(&v47, 8);

  _Block_object_dispose(buf, 8);
}

- (id)_getDataStatistics:(id)a3 forData:(id)a4
{
  uint64_t v120 = *MEMORY[0x1E4F143B8];
  id v95 = a3;
  id v99 = a4;
  id v6 = personalizationLog;
  if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1A314B000, v6, OS_LOG_TYPE_INFO, "Arrived in NEW _getDataStatistics method", buf, 2u);
  }
  id v100 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v7 = [(_PSPersonalizationEvaluation *)self selectedFeaturesConfig];
  id v8 = [v7 objectForKeyedSubscript:@"_PSRuleMiningModelFeatureSet"];

  long long v107 = 0u;
  long long v108 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v105 objects:v119 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v106;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v106 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = *(void *)(*((void *)&v105 + 1) + 8 * i);
        id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        [v100 setValue:v14 forKey:v13];
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v105 objects:v119 count:16];
    }
    while (v10);
  }

  if ([v99 count])
  {
    unint64_t v15 = 0;
    do
    {
      float v16 = [v99 objectAtIndexedSubscript:v15];
      BOOL v17 = [v16 count] == 0;

      if (!v17)
      {
        unint64_t v18 = 0;
        do
        {
          if ([v9 count])
          {
            unint64_t v19 = 0;
            do
            {
              uint64_t v20 = [v9 objectAtIndexedSubscript:v19];
              if (([v20 isEqual:@"confidence"] & 1) == 0) {
                [v20 isEqual:@"support"];
              }
              uint64_t v21 = [v100 objectForKeyedSubscript:v20];
              char v22 = [v99 objectAtIndexedSubscript:v15];
              uint64_t v23 = [v22 objectAtIndexedSubscript:v18];
              BOOL v24 = [v23 objectAtIndexedSubscript:v19];
              [v21 addObject:v24];

              ++v19;
            }
            while (v19 < [v9 count]);
          }
          uint64_t v25 = [v99 objectAtIndexedSubscript:v15];
          unint64_t v26 = [v25 count];

          ++v18;
        }
        while (v18 < v26);
      }
      ++v15;
    }
    while (v15 < [v99 count]);
  }
  uint64_t v114 = 0;
  uint64_t v115 = &v114;
  uint64_t v116 = 0x2050000000;
  id v27 = (void *)getODCurareReportFillerDataSetClass_softClass;
  uint64_t v117 = getODCurareReportFillerDataSetClass_softClass;
  if (!getODCurareReportFillerDataSetClass_softClass)
  {
    *(void *)long long buf = MEMORY[0x1E4F143A8];
    uint64_t v110 = 3221225472;
    v111 = __getODCurareReportFillerDataSetClass_block_invoke;
    uint64_t v112 = &unk_1E5ADE858;
    uint64_t v113 = &v114;
    ODCurareEvaluationAndReportingLibraryCore();
    Class Class = objc_getClass("ODCurareReportFillerDataSet");
    *(void *)(v113[1] + 24) = Class;
    getODCurareReportFillerDataSetClass_softClass Class = *(void *)(v113[1] + 24);
    id v27 = (void *)v115[3];
  }
  id v29 = v27;
  _Block_object_dispose(&v114, 8);
  id v98 = (id)objc_opt_new();
  uint64_t v114 = 0;
  uint64_t v115 = &v114;
  uint64_t v116 = 0x2050000000;
  __int16 v30 = (void *)getODCurareReportFillerDataSetSizeClass_softClass;
  uint64_t v117 = getODCurareReportFillerDataSetSizeClass_softClass;
  if (!getODCurareReportFillerDataSetSizeClass_softClass)
  {
    *(void *)long long buf = MEMORY[0x1E4F143A8];
    uint64_t v110 = 3221225472;
    v111 = __getODCurareReportFillerDataSetSizeClass_block_invoke;
    uint64_t v112 = &unk_1E5ADE858;
    uint64_t v113 = &v114;
    ODCurareEvaluationAndReportingLibraryCore();
    Class v31 = objc_getClass("ODCurareReportFillerDataSetSize");
    *(void *)(v113[1] + 24) = v31;
    getODCurareReportFillerDataSetSizeClass_softClass Class = *(void *)(v113[1] + 24);
    __int16 v30 = (void *)v115[3];
  }
  id v32 = v30;
  _Block_object_dispose(&v114, 8);
  id v96 = objc_opt_new();
  objc_msgSend(v96, "setNumberOfUserSessions:", objc_msgSend(v99, "count"));
  [v96 setNumberOfUserSamples:0];
  if ([v99 count])
  {
    unint64_t v33 = 0;
    do
    {
      id v34 = [v99 objectAtIndexedSubscript:v33];
      objc_msgSend(v96, "setNumberOfUserSamples:", objc_msgSend(v96, "numberOfUserSamples") + objc_msgSend(v34, "count"));

      ++v33;
    }
    while (v33 < [v99 count]);
  }
  [v98 setSize:v96];
  long long v103 = 0u;
  long long v104 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  obuint64_t j = v9;
  uint64_t v35 = [obj countByEnumeratingWithState:&v101 objects:v118 count:16];
  if (v35)
  {
    uint64_t v36 = *(void *)v102;
    do
    {
      for (uint64_t j = 0; j != v35; ++j)
      {
        if (*(void *)v102 != v36) {
          objc_enumerationMutation(obj);
        }
        uint64_t v38 = *(void *)(*((void *)&v101 + 1) + 8 * j);
        uint64_t v39 = (void *)MEMORY[0x1A6243860]();
        uint64_t v40 = [_PSFeatureStatistics alloc];
        uint64_t v41 = [v100 objectForKeyedSubscript:v38];
        uint64_t v42 = [(_PSFeatureStatistics *)v40 initWithList:v41];

        uint64_t v114 = 0;
        uint64_t v115 = &v114;
        uint64_t v116 = 0x2050000000;
        id v43 = (void *)getODCurareReportFillerDataSetStatsClass_softClass;
        uint64_t v117 = getODCurareReportFillerDataSetStatsClass_softClass;
        if (!getODCurareReportFillerDataSetStatsClass_softClass)
        {
          *(void *)long long buf = MEMORY[0x1E4F143A8];
          uint64_t v110 = 3221225472;
          v111 = __getODCurareReportFillerDataSetStatsClass_block_invoke;
          uint64_t v112 = &unk_1E5ADE858;
          uint64_t v113 = &v114;
          ODCurareEvaluationAndReportingLibraryCore();
          Class v44 = objc_getClass("ODCurareReportFillerDataSetStats");
          *(void *)(v113[1] + 24) = v44;
          getODCurareReportFillerDataSetStatsClass_softClass Class = *(void *)(v113[1] + 24);
          id v43 = (void *)v115[3];
        }
        id v45 = v43;
        _Block_object_dispose(&v114, 8);
        uint64_t v46 = objc_opt_new();
        [v46 setFeatureName:v38];
        uint64_t v47 = NSNumber;
        [(_PSFeatureStatistics *)v42 min];
        uint64_t v48 = objc_msgSend(v47, "numberWithDouble:");
        uint64_t v49 = [v48 stringValue];
        [v46 setFeatureValueMin:v49];

        v50 = NSNumber;
        [(_PSFeatureStatistics *)v42 max];
        id v51 = objc_msgSend(v50, "numberWithDouble:");
        dispatch_semaphore_t v52 = [v51 stringValue];
        [v46 setFeatureValueMax:v52];

        uint64_t v53 = NSNumber;
        [(_PSFeatureStatistics *)v42 avg];
        long long v54 = objc_msgSend(v53, "numberWithDouble:");
        uint64_t v55 = [v54 stringValue];
        [v46 setFeatureValueMean:v55];

        uint64_t v56 = NSNumber;
        [(_PSFeatureStatistics *)v42 stdev];
        uint64_t v57 = objc_msgSend(v56, "numberWithDouble:");
        uint64_t v58 = [v57 stringValue];
        [v46 setFeatureValueStd:v58];

        id v59 = [(_PSFeatureStatistics *)v42 percentiles];
        id v60 = [v59 objectForKeyedSubscript:@"10%"];
        long long v61 = [v60 stringValue];
        BOOL v62 = v61 == 0;

        if (v62)
        {
          [v46 setFeatureValuePercentile10:@"nil"];
        }
        else
        {
          v63 = [(_PSFeatureStatistics *)v42 percentiles];
          int64_t v64 = [v63 objectForKeyedSubscript:@"10%"];
          uint64_t v65 = [v64 stringValue];
          [v46 setFeatureValuePercentile10:v65];
        }
        id v66 = [(_PSFeatureStatistics *)v42 percentiles];
        uint64_t v67 = [v66 objectForKeyedSubscript:@"25%"];
        id v68 = [v67 stringValue];
        BOOL v69 = v68 == 0;

        if (v69)
        {
          [v46 setFeatureValuePercentile25:@"nil"];
        }
        else
        {
          long long v70 = [(_PSFeatureStatistics *)v42 percentiles];
          long long v71 = [v70 objectForKeyedSubscript:@"25%"];
          long long v72 = [v71 stringValue];
          [v46 setFeatureValuePercentile25:v72];
        }
        id v73 = [(_PSFeatureStatistics *)v42 percentiles];
        id v74 = [v73 objectForKeyedSubscript:@"50%"];
        long long v75 = [v74 stringValue];
        BOOL v76 = v75 == 0;

        if (v76)
        {
          [v46 setFeatureValuePercentile50:@"nil"];
        }
        else
        {
          long long v77 = [(_PSFeatureStatistics *)v42 percentiles];
          long long v78 = [v77 objectForKeyedSubscript:@"50%"];
          long long v79 = [v78 stringValue];
          [v46 setFeatureValuePercentile50:v79];
        }
        long long v80 = [(_PSFeatureStatistics *)v42 percentiles];
        long long v81 = [v80 objectForKeyedSubscript:@"75%"];
        long long v82 = [v81 stringValue];
        BOOL v83 = v82 == 0;

        if (v83)
        {
          [v46 setFeatureValuePercentile75:@"nil"];
        }
        else
        {
          id v84 = [(_PSFeatureStatistics *)v42 percentiles];
          uint64_t v85 = [v84 objectForKeyedSubscript:@"75%"];
          uint64_t v86 = [v85 stringValue];
          [v46 setFeatureValuePercentile75:v86];
        }
        uint64_t v87 = [(_PSFeatureStatistics *)v42 percentiles];
        uint64_t v88 = [v87 objectForKeyedSubscript:@"90%"];
        uint64_t v89 = [v88 stringValue];
        BOOL v90 = v89 == 0;

        if (v90)
        {
          [v46 setFeatureValuePercentile90:@"nil"];
        }
        else
        {
          unint64_t v91 = [(_PSFeatureStatistics *)v42 percentiles];
          id v92 = [v91 objectForKeyedSubscript:@"90%"];
          v93 = [v92 stringValue];
          [v46 setFeatureValuePercentile90:v93];
        }
        [v98 addStats:v46];
      }
      uint64_t v35 = [obj countByEnumeratingWithState:&v101 objects:v118 count:16];
    }
    while (v35);
  }

  return v98;
}

- (NSDictionary)recipe
{
  return self->_recipe;
}

- (NSString)adaptableModelDeployPath
{
  return self->_adaptableModelDeployPath;
}

- (void)setAdaptableModelDeployPath:(id)a3
{
}

- (int64_t)adaptationStrategy
{
  return self->_adaptationStrategy;
}

- (void)setAdaptationStrategy:(int64_t)a3
{
  self->_adaptationStrategy = a3;
}

- (NSMutableDictionary)modelTagToHyperparameters
{
  return self->_modelTagToHyperparameters;
}

- (void)setModelTagToHyperparameters:(id)a3
{
}

- (NSMutableDictionary)modelTagToCandidateModel
{
  return self->_modelTagToCandidateModel;
}

- (void)setModelTagToCandidateModel:(id)a3
{
}

- (_DKKnowledgeQuerying)knowledgeStore
{
  return self->_knowledgeStore;
}

- (void)setKnowledgeStore:(id)a3
{
}

- (NSMutableDictionary)featureNameDict
{
  return self->_featureNameDict;
}

- (void)setFeatureNameDict:(id)a3
{
}

- (NSDictionary)selectedFeaturesConfig
{
  return self->_selectedFeaturesConfig;
}

- (void)setSelectedFeaturesConfig:(id)a3
{
}

- (NSMutableArray)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
}

- (MLModelConfiguration)adaptableModelConfiguration
{
  return self->_adaptableModelConfiguration;
}

- (void)setAdaptableModelConfiguration:(id)a3
{
}

- (NSURL)intermediateCompiledModelURL
{
  return self->_intermediateCompiledModelURL;
}

- (void)setIntermediateCompiledModelURL:(id)a3
{
}

- (NSNumber)batchSize
{
  return self->_batchSize;
}

- (void)setBatchSize:(id)a3
{
}

- (NSNumber)topN
{
  return self->_topN;
}

- (void)setTopN:(id)a3
{
}

- (NSNumber)epoc
{
  return self->_epoc;
}

- (void)setEpoc:(id)a3
{
}

- (NSNumber)evaluationIterationCount
{
  return self->_evaluationIterationCount;
}

- (void)setEvaluationIterationCount:(id)a3
{
}

- (NSNumber)testSplitPercent
{
  return self->_testSplitPercent;
}

- (void)setTestSplitPercent:(id)a3
{
}

- (NSNumber)swapOK
{
  return self->_swapOK;
}

- (void)setSwapOK:(id)a3
{
}

- (NSNumber)accuracyGainThresholdForSwap
{
  return self->_accuracyGainThresholdForSwap;
}

- (void)setAccuracyGainThresholdForSwap:(id)a3
{
}

- (NSNumber)engagementRateGainThresholdForSwap
{
  return self->_engagementRateGainThresholdForSwap;
}

- (void)setEngagementRateGainThresholdForSwap:(id)a3
{
}

- (NSNumber)minimumTestDataSizeForSwap
{
  return self->_minimumTestDataSizeForSwap;
}

- (void)setMinimumTestDataSizeForSwap:(id)a3
{
}

- (NSNumber)numClasses
{
  return self->_numClasses;
}

- (void)setNumClasses:(id)a3
{
}

- (NSNumber)numTrees
{
  return self->_numTrees;
}

- (void)setNumTrees:(id)a3
{
}

- (NSNumber)maxDepth
{
  return self->_maxDepth;
}

- (void)setMaxDepth:(id)a3
{
}

- (NSNumber)learningRate
{
  return self->_learningRate;
}

- (void)setLearningRate:(id)a3
{
}

- (NSNumber)minChildWeight
{
  return self->_minChildWeight;
}

- (void)setMinChildWeight:(id)a3
{
}

- (NSNumber)recipeID
{
  return self->_recipeID;
}

- (void)setRecipeID:(id)a3
{
}

- (NSNumber)minSampleCountForAdaptation
{
  return self->_minSampleCountForAdaptation;
}

- (void)setMinSampleCountForAdaptation:(id)a3
{
}

- (NSUserDefaults)psAdaptationDefaults
{
  return self->_psAdaptationDefaults;
}

- (void)setPsAdaptationDefaults:(id)a3
{
}

- (ODCurareEvaluationAndReportingModule)curareEvaluationAndReporting
{
  return self->_curareEvaluationAndReporting;
}

- (void)setCurareEvaluationAndReporting:(id)a3
{
}

- (BOOL)evaluateIsInvokedOnce
{
  return self->_evaluateIsInvokedOnce;
}

- (void)setEvaluateIsInvokedOnce:(BOOL)a3
{
  self->_evaluateIsInvokedOnce = a3;
}

- (id)shouldContinue
{
  return self->_shouldContinue;
}

- (void)setShouldContinue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_shouldContinue, 0);
  objc_storeStrong((id *)&self->_curareEvaluationAndReporting, 0);
  objc_storeStrong((id *)&self->_psAdaptationDefaults, 0);
  objc_storeStrong((id *)&self->_minSampleCountForAdaptation, 0);
  objc_storeStrong((id *)&self->_recipeID, 0);
  objc_storeStrong((id *)&self->_minChildWeight, 0);
  objc_storeStrong((id *)&self->_learningRate, 0);
  objc_storeStrong((id *)&self->_maxDepth, 0);
  objc_storeStrong((id *)&self->_numTrees, 0);
  objc_storeStrong((id *)&self->_numClasses, 0);
  objc_storeStrong((id *)&self->_minimumTestDataSizeForSwap, 0);
  objc_storeStrong((id *)&self->_engagementRateGainThresholdForSwap, 0);
  objc_storeStrong((id *)&self->_accuracyGainThresholdForSwap, 0);
  objc_storeStrong((id *)&self->_swapOK, 0);
  objc_storeStrong((id *)&self->_testSplitPercent, 0);
  objc_storeStrong((id *)&self->_evaluationIterationCount, 0);
  objc_storeStrong((id *)&self->_epoc, 0);
  objc_storeStrong((id *)&self->_topN, 0);
  objc_storeStrong((id *)&self->_batchSize, 0);
  objc_storeStrong((id *)&self->_intermediateCompiledModelURL, 0);
  objc_storeStrong((id *)&self->_adaptableModelConfiguration, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_selectedFeaturesConfig, 0);
  objc_storeStrong((id *)&self->_featureNameDict, 0);
  objc_storeStrong((id *)&self->_knowledgeStore, 0);
  objc_storeStrong((id *)&self->_modelTagToCandidateModel, 0);
  objc_storeStrong((id *)&self->_modelTagToHyperparameters, 0);
  objc_storeStrong((id *)&self->_adaptableModelDeployPath, 0);

  objc_storeStrong((id *)&self->_recipe, 0);
}

- (void)evaluateWithModel:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1A314B000, v0, v1, "Candidate model in evaluateWithModel had a nil coreDuet query!! Not ok!", v2, v3, v4, v5, v6);
}

- (void)personalizeModel:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1A314B000, v0, v1, "Candidate model in personalize had a nil coreDuet query!! Not ok!", v2, v3, v4, v5, v6);
}

- (void)runAdaptationAndEvaluationWithFeaturesConfigDeployPath:adaptableModelDeployPath:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_1A314B000, v0, v1, "Failed to get selected model with error: %@", v2, v3, v4, v5, v6);
}

- (void)runAdaptationAndEvaluationWithFeaturesConfigDeployPath:adaptableModelDeployPath:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_1A314B000, v0, v1, "Failed to run task with error: %@", v2, v3, v4, v5, v6);
}

- (void)loadDefaultModel
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1A314B000, v0, v1, "No model is loaded for adaptation", v2, v3, v4, v5, v6);
}

- (void)cloneAdaptableModel:toFilePath:originalXgboostModelName:clonedXgboostModelName:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1A314B000, v0, v1, "While cloning adaptable model, removing existing file failed", v2, v3, v4, v5, v6);
}

- (void)loadAdaptableModelUnderDirectory:(uint64_t)a3 .cold.1(void *a1, void *a2, uint64_t a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = a1;
  uint8_t v6 = [a2 intermediateCompiledModelURL];
  long long v7 = [v6 absoluteString];
  OUTLINED_FUNCTION_0();
  __int16 v9 = 2112;
  uint64_t v10 = a3;
  _os_log_error_impl(&dword_1A314B000, v5, OS_LOG_TYPE_ERROR, "Adaptable ML model at path %@ load failed with error：%@", v8, 0x16u);
}

- (void)loadAdaptableModelUnderDirectory:.cold.2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1A314B000, v0, v1, "Adaptable ML model cloning to intermediate ML model is unsuccessful", v2, v3, v4, v5, v6);
}

- (void)loadAdaptableModelUnderDirectory:.cold.3()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1A314B000, v0, v1, "Deployed adaptable ML model cannot be found, therefore adaptation is halted", v2, v3, v4, v5, v6);
}

- (void)processDataWithQuery:balanceNeed:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_1A314B000, v0, v1, "knowledgeStore executeQuery failed with error: %@", v2, v3, v4, v5, v6);
}

@end