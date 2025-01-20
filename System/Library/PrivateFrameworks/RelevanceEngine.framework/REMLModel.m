@interface REMLModel
+ (REMLModel)modelWithFeatureSet:(id)a3 priorMean:(float)a4 modelVarianceEpsilon:(float)a5;
+ (unint64_t)featureBitWidth;
+ (unint64_t)maxFeatureCount;
- (BOOL)_loadModelFromURL:(id)a3 error:(id *)a4;
- (BOOL)_saveDebugModelToURL:(id)a3 error:(id *)a4;
- (BOOL)_saveModelToURL:(id)a3 error:(id *)a4;
- (BOOL)allowsExploreExploit;
- (BOOL)requiresDirectory;
- (BOOL)saveModelToURL:(id)a3 error:(id *)a4;
- (BOOL)wantsPredictionCache;
- (NSString)metricsInteraction;
- (NSString)name;
- (REMLModel)init;
- (REMLModel)initWithFeatureSet:(id)a3 priorMean:(float)a4 modelVarianceEpsilon:(float)a5;
- (RERelevanceEngineMetricsRecorder)metricsRecorder;
- (float)_getAveragePrediction;
- (float)_getNormalizedEntropy;
- (float)exploreExploitModulator;
- (float)priorMean;
- (float)simulationExploreExploitModulator;
- (float)varianceEpsilon;
- (id)_predictWithFeatures:(id)a3;
- (id)predictWithFeatures:(id)a3;
- (id)predictionSetWithFeatures:(id)a3;
- (int64_t)_getNumberOfCoordinates;
- (unint64_t)_getTotalExampleCount;
- (unint64_t)_getTotalPositiveCount;
- (unint64_t)featureBitWidth;
- (unint64_t)maxFeatureCount;
- (void)_clearCache;
- (void)clearModel;
- (void)setAllowsExploreExploit:(BOOL)a3;
- (void)setExploreExploitModulator:(float)a3;
- (void)setMetricsInteraction:(id)a3;
- (void)setMetricsRecorder:(id)a3;
- (void)setPriorMean:(float)a3;
- (void)setSimulationExploreExploitModulator:(float)a3;
- (void)setVarianceEpsilon:(float)a3;
- (void)setWantsPredictionCache:(BOOL)a3;
@end

@implementation REMLModel

+ (unint64_t)featureBitWidth
{
  if (_fetchedInternalBuildOnceToken_12 != -1) {
    dispatch_once(&_fetchedInternalBuildOnceToken_12, &__block_literal_global_134);
  }
  if (_isInternalDevice_12)
  {
    if (REGetDisableAllModelPredictions_onceToken != -1) {
      dispatch_once(&REGetDisableAllModelPredictions_onceToken, &__block_literal_global_136_0);
    }
    if (REGetDisableAllModelPredictions__REValueDisableAllModelPredictions) {
      return 64;
    }
  }
  if (_fetchedInternalBuildOnceToken_12 != -1) {
    dispatch_once(&_fetchedInternalBuildOnceToken_12, &__block_literal_global_146);
  }
  if (!_isInternalDevice_12) {
    goto LABEL_15;
  }
  if (REGetDisableMLModel_onceToken != -1) {
    dispatch_once(&REGetDisableMLModel_onceToken, &__block_literal_global_148_0);
  }
  if (REGetDisableMLModel__REValueDisableMLModel) {
    v3 = off_2644BBF38;
  }
  else {
LABEL_15:
  }
    v3 = off_2644BB828;
  v4 = *v3;
  return [(__objc2_class *)v4 featureBitWidth];
}

- (void)setWantsPredictionCache:(BOOL)a3
{
  if (self->_wantsPredictionCache != a3)
  {
    self->_wantsPredictionCache = a3;
    if (!a3) {
      [(REConcurrentDictionary *)self->_predictionCache removeAllObjects];
    }
  }
}

- (void)setSimulationExploreExploitModulator:(float)a3
{
  self->_simulationExploreExploitModulator = a3;
}

- (void)setMetricsInteraction:(id)a3
{
}

- (void)setExploreExploitModulator:(float)a3
{
  self->_exploreExploitModulator = a3;
}

- (void)setAllowsExploreExploit:(BOOL)a3
{
  self->_allowsExploreExploit = a3;
}

+ (REMLModel)modelWithFeatureSet:(id)a3 priorMean:(float)a4 modelVarianceEpsilon:(float)a5
{
  id v7 = a3;
  v8 = objc_opt_class();
  if ([v8 isSubclassOfClass:objc_opt_class()]
    && (v9 = objc_opt_class(), ([v9 isEqual:objc_opt_class()] & 1) == 0))
  {
    v10 = (__objc2_class *)objc_opt_class();
  }
  else
  {
    if (_fetchedInternalBuildOnceToken_12 != -1) {
      dispatch_once(&_fetchedInternalBuildOnceToken_12, &__block_literal_global_134);
    }
    if (!_isInternalDevice_12) {
      goto LABEL_10;
    }
    if (REGetDisableAllModelPredictions_onceToken != -1) {
      dispatch_once(&REGetDisableAllModelPredictions_onceToken, &__block_literal_global_136_0);
    }
    if (REGetDisableAllModelPredictions__REValueDisableAllModelPredictions)
    {
      v10 = REMLModel;
    }
    else
    {
LABEL_10:
      if (_fetchedInternalBuildOnceToken_12 != -1) {
        dispatch_once(&_fetchedInternalBuildOnceToken_12, &__block_literal_global_146);
      }
      if (!_isInternalDevice_12) {
        goto LABEL_17;
      }
      if (REGetDisableMLModel_onceToken != -1) {
        dispatch_once(&REGetDisableMLModel_onceToken, &__block_literal_global_148_0);
      }
      if (REGetDisableMLModel__REValueDisableMLModel) {
        v10 = REStaticMLModel;
      }
      else {
LABEL_17:
      }
        v10 = REBayesianMLModel;
    }
  }
  id v11 = [v10 alloc];
  *(float *)&double v12 = a4;
  *(float *)&double v13 = a5;
  v14 = (void *)[v11 initWithFeatureSet:v7 priorMean:v12 modelVarianceEpsilon:v13];

  return (REMLModel *)v14;
}

- (float)varianceEpsilon
{
  return self->_varianceEpsilon;
}

- (float)priorMean
{
  return self->_priorMean;
}

- (REMLModel)initWithFeatureSet:(id)a3 priorMean:(float)a4 modelVarianceEpsilon:(float)a5
{
  result = [(REMLModel *)self init];
  if (result)
  {
    result->_priorMean = a4;
    result->_varianceEpsilon = a5;
  }
  return result;
}

- (REMLModel)init
{
  v7.receiver = self;
  v7.super_class = (Class)REMLModel;
  v2 = [(REMLModel *)&v7 init];
  if (v2)
  {
    v3 = [[REConcurrentDictionary alloc] initWeakToStrongDictionary];
    predictionCache = v2->_predictionCache;
    v2->_predictionCache = v3;

    v2->_wantsPredictionCache = 0;
    v2->_allowsExploreExploit = 1;
    v5 = objc_opt_class();
    v2->_implementsDebugSaving = RESubclassOverridesMethod(v2, v5, (uint64_t)sel__saveDebugModelToURL_error_);
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricsInteraction, 0);
  objc_storeStrong((id *)&self->_metricsRecorder, 0);
  objc_storeStrong((id *)&self->_predictionCache, 0);
}

- (void)setMetricsRecorder:(id)a3
{
}

- (BOOL)requiresDirectory
{
  return 0;
}

+ (unint64_t)maxFeatureCount
{
  if (_fetchedInternalBuildOnceToken_12 != -1) {
    dispatch_once(&_fetchedInternalBuildOnceToken_12, &__block_literal_global_134);
  }
  if (_isInternalDevice_12)
  {
    if (REGetDisableAllModelPredictions_onceToken != -1) {
      dispatch_once(&REGetDisableAllModelPredictions_onceToken, &__block_literal_global_136_0);
    }
    if (REGetDisableAllModelPredictions__REValueDisableAllModelPredictions) {
      return -1;
    }
  }
  if (_fetchedInternalBuildOnceToken_12 != -1) {
    dispatch_once(&_fetchedInternalBuildOnceToken_12, &__block_literal_global_146);
  }
  if (_isInternalDevice_12)
  {
    if (REGetDisableMLModel_onceToken != -1) {
      dispatch_once(&REGetDisableMLModel_onceToken, &__block_literal_global_148_0);
    }
    if (REGetDisableMLModel__REValueDisableMLModel) {
      return -1;
    }
  }
  return +[REBayesianMLModel maxFeatureCount];
}

- (BOOL)wantsPredictionCache
{
  return self->_wantsPredictionCache;
}

- (void)_clearCache
{
  if ([(REMLModel *)self wantsPredictionCache])
  {
    predictionCache = self->_predictionCache;
    [(REConcurrentDictionary *)predictionCache removeAllObjects];
  }
}

- (id)predictWithFeatures:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(REMLModel *)self wantsPredictionCache];
  if (!v5
    || ([(REConcurrentDictionary *)self->_predictionCache objectForKey:v4],
        (v6 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v6 = [(REMLModel *)self _predictWithFeatures:v4];
    if (v5) {
      [(REConcurrentDictionary *)self->_predictionCache setObject:v6 forKey:v4];
    }
  }
  id v7 = v6;

  return v7;
}

- (id)predictionSetWithFeatures:(id)a3
{
  id v4 = a3;
  BOOL v5 = [REMLPredictionSet alloc];
  v6 = [(REMLModel *)self predictWithFeatures:v4];

  id v7 = [(REMLPredictionSet *)v5 initWithPrediction:v6];
  return v7;
}

- (id)_predictWithFeatures:(id)a3
{
  LODWORD(v3) = 0.5;
  return +[REMLPrediction predictionWithProbability:mean:variance:pessimistic:](REMLPrediction, "predictionWithProbability:mean:variance:pessimistic:", a3, v3, 0.0, 0.0, 0.0);
}

- (BOOL)saveModelToURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (self->_implementsDebugSaving)
  {
    if (_fetchedInternalBuildOnceToken_12 != -1) {
      dispatch_once(&_fetchedInternalBuildOnceToken_12, &__block_literal_global_86);
    }
    if (_isInternalDevice_12)
    {
      id v7 = [v6 URLByAppendingPathExtension:@"debug"];
      id v13 = 0;
      BOOL v8 = [(REMLModel *)self _saveDebugModelToURL:v7 error:&v13];
      id v9 = v13;
      if (!v8)
      {
        v10 = RELogForDomain(4);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          -[REMLModel saveModelToURL:error:]((uint64_t)v9, v10);
        }
      }
    }
  }
  BOOL v11 = [(REMLModel *)self _saveModelToURL:v6 error:a4];

  return v11;
}

uint64_t __34__REMLModel_saveModelToURL_error___block_invoke()
{
  uint64_t result = _REGetIsInternalBuild();
  _isInternalDevice_12 = result;
  return result;
}

- (BOOL)_saveModelToURL:(id)a3 error:(id *)a4
{
  return 0;
}

- (BOOL)_loadModelFromURL:(id)a3 error:(id *)a4
{
  return 0;
}

- (BOOL)_saveDebugModelToURL:(id)a3 error:(id *)a4
{
  return 0;
}

- (void)clearModel
{
  [(REConcurrentDictionary *)self->_predictionCache removeAllObjects];
  [(REMLModel *)self _clearModel];
}

- (int64_t)_getNumberOfCoordinates
{
  return 0;
}

- (float)_getAveragePrediction
{
  return 0.0;
}

- (float)_getNormalizedEntropy
{
  return 0.0;
}

- (unint64_t)_getTotalExampleCount
{
  return 0;
}

- (unint64_t)_getTotalPositiveCount
{
  return 0;
}

- (NSString)name
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (unint64_t)featureBitWidth
{
  v2 = objc_opt_class();
  return [v2 featureBitWidth];
}

- (unint64_t)maxFeatureCount
{
  v2 = objc_opt_class();
  return [v2 maxFeatureCount];
}

- (BOOL)allowsExploreExploit
{
  return self->_allowsExploreExploit;
}

- (float)exploreExploitModulator
{
  return self->_exploreExploitModulator;
}

- (void)setPriorMean:(float)a3
{
  self->_priorMean = a3;
}

- (void)setVarianceEpsilon:(float)a3
{
  self->_varianceEpsilon = a3;
}

- (float)simulationExploreExploitModulator
{
  return self->_simulationExploreExploitModulator;
}

- (RERelevanceEngineMetricsRecorder)metricsRecorder
{
  return self->_metricsRecorder;
}

- (NSString)metricsInteraction
{
  return self->_metricsInteraction;
}

- (void)saveModelToURL:(uint64_t)a1 error:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_21E6E6000, a2, OS_LOG_TYPE_DEBUG, "Unable to save debug model: %@", (uint8_t *)&v2, 0xCu);
}

@end