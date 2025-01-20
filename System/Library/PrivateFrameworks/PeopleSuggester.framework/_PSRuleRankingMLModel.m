@interface _PSRuleRankingMLModel
- (BOOL)isAdaptedMLModelOK;
- (BOOL)isAdaptedModel;
- (BOOL)isAdaptedModelCreated;
- (MLModel)mlModel;
- (MLModelConfiguration)adaptableModelConfiguration;
- (NSArray)scores;
- (NSDictionary)metadata;
- (NSDictionary)psConfigForAdaptableModel;
- (NSString)adaptedModelRecipeVersion;
- (_PSBehaviorRuleFeatureExtraction)feaExtHandle;
- (_PSRuleRankingMLModel)initWithAdaptableModelConfig:(id)a3 isAdaptedMLModelOK:(BOOL)a4 scoreThreshold:(double)a5;
- (_PSRuleRankingMLModel)initWithMLModel:(id)a3 scoreThreshold:(double)a4 isAdaptedModel:(BOOL)a5 psConfigForAdaptableModel:(id)a6 isAdaptedMLModelOK:(BOOL)a7;
- (double)scoreThreshold;
- (id)getAdaptedModelVersion;
- (id)giveModelDescription;
- (id)rankRules:(id)a3 contextItems:(id)a4;
- (id)scoresOnRules:(id)a3 contextItems:(id)a4;
- (void)loadDefaultRuleMinerMLModel;
- (void)setAdaptableModelConfiguration:(id)a3;
- (void)setAdaptedModelRecipeVersion:(id)a3;
- (void)setFeaExtHandle:(id)a3;
- (void)setIsAdaptedMLModelOK:(BOOL)a3;
- (void)setIsAdaptedModel:(BOOL)a3;
- (void)setMetadata:(id)a3;
- (void)setMlModel:(id)a3;
- (void)setPsConfigForAdaptableModel:(id)a3;
- (void)setScoreThreshold:(double)a3;
- (void)setScores:(id)a3;
@end

@implementation _PSRuleRankingMLModel

- (_PSRuleRankingMLModel)initWithMLModel:(id)a3 scoreThreshold:(double)a4 isAdaptedModel:(BOOL)a5 psConfigForAdaptableModel:(id)a6 isAdaptedMLModelOK:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a6;
  v25.receiver = self;
  v25.super_class = (Class)_PSRuleRankingMLModel;
  v14 = [(_PSRuleRankingMLModel *)&v25 init];
  v15 = v14;
  if (v14)
  {
    [(_PSRuleRankingMLModel *)v14 setMlModel:v12];
    v16 = [(MLModel *)v15->_mlModel modelDescription];
    v17 = [v16 metadata];
    v18 = [v17 objectForKeyedSubscript:@"MLModelCreatorDefinedKey"];
    [(_PSRuleRankingMLModel *)v15 setMetadata:v18];

    v19 = [_PSBehaviorRuleFeatureExtraction alloc];
    v20 = [(_PSRuleRankingMLModel *)v15 metadata];
    v21 = [(_PSBehaviorRuleFeatureExtraction *)v19 initWithMetadata:v20];
    [(_PSRuleRankingMLModel *)v15 setFeaExtHandle:v21];

    v22 = [(_PSRuleRankingMLModel *)v15 feaExtHandle];
    [v22 precalculateConstantFeatures];

    [(_PSRuleRankingMLModel *)v15 setIsAdaptedModel:v9];
    [(_PSRuleRankingMLModel *)v15 setPsConfigForAdaptableModel:v13];
    [(_PSRuleRankingMLModel *)v15 setIsAdaptedMLModelOK:v7];
    v23 = [(_PSRuleRankingMLModel *)v15 getAdaptedModelVersion];
    [(_PSRuleRankingMLModel *)v15 setAdaptedModelRecipeVersion:v23];

    [(_PSRuleRankingMLModel *)v15 setScoreThreshold:a4];
  }

  return v15;
}

- (_PSRuleRankingMLModel)initWithAdaptableModelConfig:(id)a3 isAdaptedMLModelOK:(BOOL)a4 scoreThreshold:(double)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  v23.receiver = self;
  v23.super_class = (Class)_PSRuleRankingMLModel;
  BOOL v9 = [(_PSRuleRankingMLModel *)&v23 init];
  v10 = v9;
  if (v9)
  {
    [(_PSRuleRankingMLModel *)v9 setMlModel:0];
    [(_PSRuleRankingMLModel *)v10 setPsConfigForAdaptableModel:v8];
    [(_PSRuleRankingMLModel *)v10 setIsAdaptedMLModelOK:v6];
    v11 = +[_PSBehaviorRuleRankingUtilities loadMLModelConfigurationWithConfigDict:v8];
    [(_PSRuleRankingMLModel *)v10 setAdaptableModelConfiguration:v11];

    [(_PSRuleRankingMLModel *)v10 loadDefaultRuleMinerMLModel];
    id v12 = [(_PSRuleRankingMLModel *)v10 getAdaptedModelVersion];
    [(_PSRuleRankingMLModel *)v10 setAdaptedModelRecipeVersion:v12];

    [(_PSRuleRankingMLModel *)v10 setScoreThreshold:a5];
    [(_PSRuleRankingMLModel *)v10 setScores:0];
    [(_PSRuleRankingMLModel *)v10 setMetadata:0];
    [(_PSRuleRankingMLModel *)v10 setFeaExtHandle:0];
    id v13 = [(_PSRuleRankingMLModel *)v10 mlModel];

    if (v13)
    {
      v14 = [(_PSRuleRankingMLModel *)v10 mlModel];
      v15 = [v14 modelDescription];
      v16 = [v15 metadata];
      v17 = [v16 objectForKeyedSubscript:@"MLModelCreatorDefinedKey"];
      [(_PSRuleRankingMLModel *)v10 setMetadata:v17];

      v18 = [_PSBehaviorRuleFeatureExtraction alloc];
      v19 = [(_PSRuleRankingMLModel *)v10 metadata];
      v20 = [(_PSBehaviorRuleFeatureExtraction *)v18 initWithMetadata:v19];
      [(_PSRuleRankingMLModel *)v10 setFeaExtHandle:v20];

      v21 = [(_PSRuleRankingMLModel *)v10 feaExtHandle];
      [v21 precalculateConstantFeatures];
    }
  }

  return v10;
}

- (id)getAdaptedModelVersion
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = +[_PSBehaviorRuleRankingUtilities getAdaptedModelRecipeVersionFilePath];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  if ([v3 fileExistsAtPath:v2])
  {
    id v8 = 0;
    v4 = [NSString stringWithContentsOfFile:v2 encoding:4 error:&v8];
    id v5 = v8;
    BOOL v6 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v4;
      _os_log_impl(&dword_1A314B000, v6, OS_LOG_TYPE_INFO, "Adapted ML model Recipe ID: %@", buf, 0xCu);
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)loadDefaultRuleMinerMLModel
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  [(_PSRuleRankingMLModel *)self setIsAdaptedModel:0];
  id v3 = [(_PSRuleRankingMLModel *)self mlModel];

  if (!v3)
  {
    if ([(_PSRuleRankingMLModel *)self isAdaptedMLModelOK])
    {
      v4 = [(_PSRuleRankingMLModel *)self adaptableModelConfiguration];

      if (v4)
      {
        id v5 = +[_PSBehaviorRuleRankingUtilities getAdaptedCompiledMLModelPath];
        BOOL v6 = [(_PSRuleRankingMLModel *)self adaptableModelConfiguration];
        BOOL v7 = +[_PSBehaviorRuleRankingUtilities loadMLModel:v5 modelConfig:v6];
        [(_PSRuleRankingMLModel *)self setMlModel:v7];

        id v8 = [(_PSRuleRankingMLModel *)self mlModel];

        if (v8)
        {
          BOOL v9 = +[_PSLogging generalChannel];
          if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          {
            int v20 = 138412290;
            v21 = v5;
            _os_log_impl(&dword_1A314B000, v9, OS_LOG_TYPE_INFO, "ML Model: Adapted model is loaded to be used in suggestions from path: %@", (uint8_t *)&v20, 0xCu);
          }

          [(_PSRuleRankingMLModel *)self setIsAdaptedModel:1];
        }
      }
    }
    v10 = [(_PSRuleRankingMLModel *)self mlModel];

    if (!v10)
    {
      uint64_t v11 = +[_PSBehaviorRuleRankingUtilities getTrialCompiledMLModelPath];
      id v12 = +[_PSBehaviorRuleRankingUtilities loadMLModel:v11 modelConfig:0];
      [(_PSRuleRankingMLModel *)self setMlModel:v12];

      id v13 = [(_PSRuleRankingMLModel *)self mlModel];

      if (v13)
      {
        v14 = +[_PSLogging generalChannel];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          int v20 = 138412290;
          v21 = v11;
          _os_log_impl(&dword_1A314B000, v14, OS_LOG_TYPE_INFO, "ML Model: Trial model is loaded to be used in suggestions from path: %@", (uint8_t *)&v20, 0xCu);
        }
      }
    }
    v15 = [(_PSRuleRankingMLModel *)self mlModel];

    if (!v15)
    {
      v16 = +[_PSBehaviorRuleRankingUtilities getDeployedCompiledMLModelPath];
      v17 = +[_PSBehaviorRuleRankingUtilities loadMLModel:v16 modelConfig:0];
      [(_PSRuleRankingMLModel *)self setMlModel:v17];

      v18 = [(_PSRuleRankingMLModel *)self mlModel];

      if (v18)
      {
        v19 = +[_PSLogging generalChannel];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          int v20 = 138412290;
          v21 = v16;
          _os_log_impl(&dword_1A314B000, v19, OS_LOG_TYPE_INFO, "ML Model: Deployed default model is loaded to be used in suggestions from path: %@", (uint8_t *)&v20, 0xCu);
        }
      }
    }
  }
}

- (BOOL)isAdaptedModelCreated
{
  v2 = +[_PSBehaviorRuleRankingUtilities getAdaptedCompiledMLModelPath];
  char v7 = 0;
  id v3 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  char v4 = [v3 fileExistsAtPath:v2 isDirectory:&v7];
  if (v7) {
    BOOL v5 = v4;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)giveModelDescription
{
  return [(MLModel *)self->_mlModel modelDescription];
}

- (id)scoresOnRules:(id)a3 contextItems:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v28 = a4;
  if (v6 && [v6 count])
  {
    char v7 = +[_PSLogging suggestionSignpost];
    if (os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A314B000, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetPeopleSuggestionsMiningFeatureExtraction", " enableTelemetry=YES ", buf, 2u);
    }

    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id obj = v6;
    uint64_t v9 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          id v13 = v8;
          if (*(void *)v30 != v11) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void *)(*((void *)&v29 + 1) + 8 * i);
          v15 = [MEMORY[0x1E4F1CA60] dictionary];
          [(_PSRuleRankingMLModel *)self feaExtHandle];
          v17 = v16 = self;
          [v17 extractFeaturesGivenRule:v14 contextItems:v28 features:v15];

          self = v16;
          v18 = [[_PSFeaturizedBehaviorRule alloc] initWithRule:v14 score:v15 features:-1.0];
          id v8 = v13;
          [v13 addObject:v18];
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
      }
      while (v10);
    }

    v19 = +[_PSLogging suggestionSignpost];
    if (os_signpost_enabled(v19))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A314B000, v19, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetPeopleSuggestionsMiningFeatureExtraction", (const char *)&unk_1A3274816, buf, 2u);
    }

    int v20 = +[_PSLogging coreBehaviorChannel];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
      *(_DWORD *)buf = 138412290;
      v34 = v21;
      _os_log_impl(&dword_1A314B000, v20, OS_LOG_TYPE_INFO, "_PSRuleRankingMLModel - People Suggester Extracted featuresList count: %@", buf, 0xCu);
    }
    uint64_t v22 = +[_PSLogging suggestionSignpost];
    if (os_signpost_enabled(v22))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A314B000, v22, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetPeopleSuggestionsMiningMLModelPrediction", " enableTelemetry=YES ", buf, 2u);
    }

    if ([(_PSRuleRankingMLModel *)self isAdaptedModel])
    {
      mlModel = self->_mlModel;
      v24 = [(_PSRuleRankingMLModel *)self psConfigForAdaptableModel];
      +[_PSBehaviorRuleRankingUtilities batchPredictWithAdaptedMLModel:mlModel psConfigForAdaptableModel:v24 featurizedRules:v8];
    }
    else
    {
      v24 = +[_PSBehaviorRuleRankingUtilities reformatFeaturesInFeaturizedBehaviorRuleArray:v8];
      +[_PSBehaviorRuleRankingUtilities batchPredictWithMLModel:self->_mlModel featureArrayDict:v24];
    objc_super v25 = };

    [(_PSRuleRankingMLModel *)self setScores:v25];
  }
  else
  {
    objc_super v25 = 0;
  }

  return v25;
}

- (id)rankRules:(id)a3 contextItems:(id)a4
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v59 = a4;
  char v7 = +[_PSLogging suggestionSignpost];
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A314B000, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetPeopleSuggestionsMiningFeatureExtraction", " enableTelemetry=YES ", buf, 2u);
  }

  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id obj = v6;
  uint64_t v9 = [obj countByEnumeratingWithState:&v68 objects:v76 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v69;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v69 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v68 + 1) + 8 * i);
        uint64_t v14 = [MEMORY[0x1E4F1CA60] dictionary];
        v15 = [(_PSRuleRankingMLModel *)self feaExtHandle];
        [v15 extractFeaturesGivenRule:v13 contextItems:v59 features:v14];

        v16 = [[_PSFeaturizedBehaviorRule alloc] initWithRule:v13 score:v14 features:-1.0];
        [v8 addObject:v16];
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v68 objects:v76 count:16];
    }
    while (v10);
  }

  v17 = +[_PSLogging suggestionSignpost];
  if (os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A314B000, v17, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetPeopleSuggestionsMiningFeatureExtraction", (const char *)&unk_1A3274816, buf, 2u);
  }

  v18 = +[_PSLogging coreBehaviorChannel];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
    *(_DWORD *)buf = 138412290;
    v75 = v19;
    _os_log_impl(&dword_1A314B000, v18, OS_LOG_TYPE_INFO, "_PSRuleRankingMLModel - People Suggester Extracted featuresList count: %@", buf, 0xCu);
  }
  int v20 = +[_PSLogging suggestionSignpost];
  if (os_signpost_enabled(v20))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A314B000, v20, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetPeopleSuggestionsMiningMLModelPrediction", " enableTelemetry=YES ", buf, 2u);
  }

  if ([(_PSRuleRankingMLModel *)self isAdaptedModel])
  {
    mlModel = self->_mlModel;
    uint64_t v22 = [(_PSRuleRankingMLModel *)self psConfigForAdaptableModel];
    +[_PSBehaviorRuleRankingUtilities batchPredictWithAdaptedMLModel:mlModel psConfigForAdaptableModel:v22 featurizedRules:v8];
  }
  else
  {
    uint64_t v22 = +[_PSBehaviorRuleRankingUtilities reformatFeaturesInFeaturizedBehaviorRuleArray:v8];
    +[_PSBehaviorRuleRankingUtilities batchPredictWithMLModel:self->_mlModel featureArrayDict:v22];
  objc_super v23 = };

  [(_PSRuleRankingMLModel *)self setScores:v23];
  if ([v23 count])
  {
    unint64_t v24 = 0;
    do
    {
      objc_super v25 = [v23 objectAtIndexedSubscript:v24];
      [v25 doubleValue];
      double v27 = v26;
      id v28 = [v8 objectAtIndexedSubscript:v24];
      [v28 setScore:v27];

      ++v24;
    }
    while (v24 < [v23 count]);
  }
  v57 = v23;
  long long v29 = &off_1E5ADE000;
  long long v30 = +[_PSLogging suggestionSignpost];
  if (os_signpost_enabled(v30))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A314B000, v30, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetPeopleSuggestionsMiningMLModelPrediction", (const char *)&unk_1A3274816, buf, 2u);
  }

  id v31 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v32 = v8;
  uint64_t v33 = [v32 countByEnumeratingWithState:&v64 objects:v73 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v65;
    do
    {
      for (uint64_t j = 0; j != v34; ++j)
      {
        if (*(void *)v65 != v35) {
          objc_enumerationMutation(v32);
        }
        v37 = *(void **)(*((void *)&v64 + 1) + 8 * j);
        [v37 score];
        if (v38 != -1.0)
        {
          [v37 score];
          double v40 = v39;
          [(_PSRuleRankingMLModel *)self scoreThreshold];
          if (v40 >= v41) {
            [v31 addObject:v37];
          }
        }
      }
      uint64_t v34 = [v32 countByEnumeratingWithState:&v64 objects:v73 count:16];
    }
    while (v34);
  }

  v56 = v31;
  v42 = [v31 sortedArrayUsingComparator:&__block_literal_global_0];
  id v43 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v44 = v42;
  uint64_t v45 = [v44 countByEnumeratingWithState:&v60 objects:v72 count:16];
  if (v45)
  {
    uint64_t v46 = v45;
    uint64_t v47 = *(void *)v61;
    do
    {
      for (uint64_t k = 0; k != v46; ++k)
      {
        if (*(void *)v61 != v47) {
          objc_enumerationMutation(v44);
        }
        v49 = *(void **)(*((void *)&v60 + 1) + 8 * k);
        v50 = [v49 rule];
        [v43 addObject:v50];

        v51 = [v29[172] generalChannel];
        if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
        {
          v52 = NSNumber;
          [v49 score];
          v53 = v52;
          long long v29 = &off_1E5ADE000;
          v54 = objc_msgSend(v53, "numberWithDouble:");
          *(_DWORD *)buf = 138412290;
          v75 = v54;
          _os_log_impl(&dword_1A314B000, v51, OS_LOG_TYPE_INFO, "_PSRuleRankingMLModel - People Suggester ML rule score: %@", buf, 0xCu);
        }
      }
      uint64_t v46 = [v44 countByEnumeratingWithState:&v60 objects:v72 count:16];
    }
    while (v46);
  }

  return v43;
}

- (double)scoreThreshold
{
  return self->_scoreThreshold;
}

- (void)setScoreThreshold:(double)a3
{
  self->_scoreThreshold = a3;
}

- (NSArray)scores
{
  return self->_scores;
}

- (void)setScores:(id)a3
{
}

- (MLModel)mlModel
{
  return (MLModel *)objc_getProperty(self, a2, 32, 1);
}

- (void)setMlModel:(id)a3
{
}

- (NSDictionary)metadata
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setMetadata:(id)a3
{
}

- (BOOL)isAdaptedModel
{
  return self->_isAdaptedModel;
}

- (void)setIsAdaptedModel:(BOOL)a3
{
  self->_isAdaptedModel = a3;
}

- (NSDictionary)psConfigForAdaptableModel
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPsConfigForAdaptableModel:(id)a3
{
}

- (MLModelConfiguration)adaptableModelConfiguration
{
  return self->_adaptableModelConfiguration;
}

- (void)setAdaptableModelConfiguration:(id)a3
{
}

- (BOOL)isAdaptedMLModelOK
{
  return self->_isAdaptedMLModelOK;
}

- (void)setIsAdaptedMLModelOK:(BOOL)a3
{
  self->_isAdaptedMLModelOK = a3;
}

- (NSString)adaptedModelRecipeVersion
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setAdaptedModelRecipeVersion:(id)a3
{
}

- (_PSBehaviorRuleFeatureExtraction)feaExtHandle
{
  return (_PSBehaviorRuleFeatureExtraction *)objc_getProperty(self, a2, 72, 1);
}

- (void)setFeaExtHandle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feaExtHandle, 0);
  objc_storeStrong((id *)&self->_adaptedModelRecipeVersion, 0);
  objc_storeStrong((id *)&self->_adaptableModelConfiguration, 0);
  objc_storeStrong((id *)&self->_psConfigForAdaptableModel, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_mlModel, 0);

  objc_storeStrong((id *)&self->_scores, 0);
}

@end