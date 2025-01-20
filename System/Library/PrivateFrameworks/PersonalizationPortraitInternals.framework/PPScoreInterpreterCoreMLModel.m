@interface PPScoreInterpreterCoreMLModel
+ (double)scoreForOutputValue:(id)a3 outputIndexedSubscript:(int64_t)a4;
- (BOOL)hasOutputIndexedSubscript;
- (NSArray)argumentsToEvaluate;
- (PPScoreInterpreterCoreMLModel)initWithModelPath:(id)a3 features:(id)a4 outputSpecification:(id)a5;
- (double)predictionForEvaluatedFeatures:(id)a3 withOutputIndexedSubscript:(int64_t)a4;
- (id)featureAtIndex:(unint64_t)a3;
- (unint64_t)numberOfFeatures;
- (void)loadCoreMLModelIfNotAlreadyLoaded;
- (void)loadInstanceVariablesFromFeatures:(id)a3 outputSpecification:(id)a4;
@end

@implementation PPScoreInterpreterCoreMLModel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_argumentsToEvaluate, 0);
  objc_storeStrong((id *)&self->_coreMLInputFeatures, 0);
  objc_storeStrong((id *)&self->_coreMLModelOutputName, 0);
  objc_storeStrong((id *)&self->_coreMLModel, 0);
  objc_storeStrong((id *)&self->_coreMLModelPath, 0);
}

- (BOOL)hasOutputIndexedSubscript
{
  return self->_hasOutputIndexedSubscript;
}

- (NSArray)argumentsToEvaluate
{
  return self->_argumentsToEvaluate;
}

- (double)predictionForEvaluatedFeatures:(id)a3 withOutputIndexedSubscript:(int64_t)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(PPScoreInterpreterCoreMLModel *)self loadCoreMLModelIfNotAlreadyLoaded];
  id v17 = 0;
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F1E930]) initWithDictionary:v6 error:&v17];
  id v8 = v17;
  if (v7)
  {
    coreMLModel = self->_coreMLModel;
    id v16 = v8;
    v10 = [coreMLModel predictionFromFeatures:v7 error:&v16];
    id v11 = v16;

    if (v11)
    {
      double v12 = -31337.0;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v19 = v11;
        _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "ScoreInterpreter - CoreMLModel - Error in predictionFromFeatures: %@", buf, 0xCu);
      }
    }
    else
    {
      v13 = [v10 featureValueForName:self->_coreMLModelOutputName];
      +[PPScoreInterpreterCoreMLModel scoreForOutputValue:v13 outputIndexedSubscript:a4];
      double v12 = v14;
    }
    id v8 = v11;
  }
  else
  {
    double v12 = -31337.0;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v8;
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "ScoreInterpreter - CoreMLModel - Error in initializing MLDictionaryFeatureProvider: %@", buf, 0xCu);
    }
  }

  return v12;
}

- (id)featureAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_coreMLInputFeatures objectAtIndexedSubscript:a3];
}

- (unint64_t)numberOfFeatures
{
  return [(NSArray *)self->_coreMLInputFeatures count];
}

- (void)loadInstanceVariablesFromFeatures:(id)a3 outputSpecification:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_opt_new();
  v9 = objc_opt_new();
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  v24 = __87__PPScoreInterpreterCoreMLModel_loadInstanceVariablesFromFeatures_outputSpecification___block_invoke;
  v25 = &unk_1E65D6C38;
  id v10 = v9;
  id v26 = v10;
  id v11 = v8;
  id v27 = v11;
  [v6 enumerateKeysAndObjectsUsingBlock:&v22];
  double v12 = (NSArray *)objc_msgSend(v11, "copy", v22, v23, v24, v25);
  coreMLInputFeatures = self->_coreMLInputFeatures;
  self->_coreMLInputFeatures = v12;

  double v14 = [v7 objectForKeyedSubscript:@"outputName"];
  coreMLModelOutputName = self->_coreMLModelOutputName;
  self->_coreMLModelOutputName = v14;

  id v16 = [v7 objectForKeyedSubscript:@"outputIndexedSubscript"];
  id v17 = (void *)[v10 mutableCopy];
  v18 = v17;
  if (v16)
  {
    [v17 addObject:v16];
    BOOL v19 = 1;
  }
  else
  {
    BOOL v19 = 0;
  }
  self->_hasOutputIndexedSubscript = v19;
  uint64_t v20 = (NSArray *)[v18 copy];
  argumentsToEvaluate = self->_argumentsToEvaluate;
  self->_argumentsToEvaluate = v20;
}

void __87__PPScoreInterpreterCoreMLModel_loadInstanceVariablesFromFeatures_outputSpecification___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id v6 = [[PPScoreInterpreterCoreMLModelFeature alloc] initWithFeatureName:v7];
  [*(id *)(a1 + 32) addObject:v5];
  [*(id *)(a1 + 40) addObject:v6];
}

- (void)loadCoreMLModelIfNotAlreadyLoaded
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!self->_coreMLModel)
  {
    if (self->_coreMLModelPath)
    {
      v3 = (void *)MEMORY[0x1E4F1E968];
      v4 = objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:");
      id v9 = 0;
      id v5 = [v3 modelWithContentsOfURL:v4 error:&v9];
      id v6 = v9;
      coreMLModel = self->_coreMLModel;
      self->_coreMLModel = v5;

      if (v6)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          coreMLModelPath = self->_coreMLModelPath;
          *(_DWORD *)buf = 138412546;
          id v11 = coreMLModelPath;
          __int16 v12 = 2112;
          id v13 = v6;
          _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "error initializing %@ model: %@", buf, 0x16u);
        }
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = 0;
      _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "error finding %@ model in assets", buf, 0xCu);
    }
  }
}

- (PPScoreInterpreterCoreMLModel)initWithModelPath:(id)a3 features:(id)a4 outputSpecification:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PPScoreInterpreterCoreMLModel;
  __int16 v12 = [(PPScoreInterpreterCoreMLModel *)&v15 init];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_coreMLModelPath, a3);
    [(PPScoreInterpreterCoreMLModel *)v13 loadInstanceVariablesFromFeatures:v10 outputSpecification:v11];
  }

  return v13;
}

+ (double)scoreForOutputValue:(id)a3 outputIndexedSubscript:(int64_t)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 type];
  switch(v6)
  {
    case 1:
      double v7 = (double)[v5 int64Value];
      break;
    case 2:
      [v5 doubleValue];
      double v7 = v8;
      break;
    case 5:
      id v9 = [v5 multiArrayValue];
      id v10 = [v9 objectAtIndexedSubscript:a4];
      [v10 doubleValue];
      double v7 = v11;
      goto LABEL_6;
    case 6:
      id v9 = [v5 dictionaryValue];
      id v10 = [NSNumber numberWithInteger:a4];
      __int16 v12 = [v9 objectForKeyedSubscript:v10];
      [v12 doubleValue];
      double v7 = v13;

LABEL_6:
      break;
    default:
      double v7 = -31337.0;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        int v15 = 134217984;
        uint64_t v16 = v6;
        _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "ScoreInterpreter - CoreMLModel - No valid outputType found for %td", (uint8_t *)&v15, 0xCu);
      }
      break;
  }

  return v7;
}

@end