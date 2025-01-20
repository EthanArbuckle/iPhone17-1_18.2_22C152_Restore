@interface _PSCoreMLScoringModel
- (BOOL)isGBDTModel;
- (BOOL)isSetModel;
- (BOOL)mlModelInitialized;
- (LCFModelStore)modelStore;
- (MLModel)mlModel;
- (NSArray)inputShape;
- (NSDictionary)metadata;
- (NSString)inputFeatureName;
- (NSString)numCandidatesFeatureName;
- (NSString)outputFeatureName;
- (NSURL)modelURL;
- (_PSCoreMLScoringModel)init;
- (_PSCoreMLScoringModel)initWithCoreMLModel:(id)a3;
- (_opaque_pthread_mutex_t)lock;
- (id)batchPredictWithFeatureDictArray:(id)a3;
- (id)featureOrderFromMetadata;
- (id)getModelDescription;
- (id)getModelPath;
- (id)getSuggestionProxiesForCandidateToFeatureVectorDictGetter:(id)a3 predictionContext:(id)a4 messageInteractionCache:(id)a5 shareInteractionCache:(id)a6;
- (id)loadCoreMLModel:(id)a3 config:(id)a4;
- (id)predictWithFeatureProvider:(id)a3;
- (id)reformatCandidateDictionaryIntoFeatureTensor:(id)a3 candidateList:(id)a4 error:(id *)a5;
- (id)scoreCandidates:(id)a3 predictionContext:(id)a4;
- (id)scoreCandidatesWithCoreMLModel:(id)a3;
- (id)scoreCandidatesWithGBDTModel:(id)a3;
- (int64_t)getModelTypeWithModelMetadata:(id)a3;
- (int64_t)modelType;
- (void)featureOrderFromMetadata;
- (void)loadModel;
- (void)loadModelMetadata;
- (void)loadProductionModel:(id)a3;
- (void)setInputFeatureName:(id)a3;
- (void)setInputShape:(id)a3;
- (void)setLock:(_opaque_pthread_mutex_t *)a3;
- (void)setMetadata:(id)a3;
- (void)setMlModel:(id)a3;
- (void)setMlModelInitialized:(BOOL)a3;
- (void)setModelType:(int64_t)a3;
- (void)setModelURL:(id)a3;
- (void)setNumCandidatesFeatureName:(id)a3;
- (void)setOutputFeatureName:(id)a3;
- (void)unloadModel;
@end

@implementation _PSCoreMLScoringModel

- (_PSCoreMLScoringModel)init
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v4.receiver = self;
  v4.super_class = (Class)_PSCoreMLScoringModel;
  v2 = [(_PSCoreMLScoringModel *)&v4 init];
  if (v2)
  {
    v5.__sig = 0;
    *(void *)v5.__opaque = 0;
    pthread_mutexattr_init(&v5);
    pthread_mutexattr_settype(&v5, 2);
    pthread_mutex_init(&v2->_lock, &v5);
  }
  return v2;
}

- (void)loadModel
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v3 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1A314B000, v3, OS_LOG_TYPE_DEFAULT, "_PSCoreMLScoringModel: loading model", (uint8_t *)&buf, 2u);
  }

  pthread_mutex_lock(&self->_lock);
  v30 = [MEMORY[0x1E4F5B420] peopleDirectory];
  v29 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v30];
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2050000000;
  objc_super v4 = (void *)getLCFModelStoreClass_softClass;
  uint64_t v34 = getLCFModelStoreClass_softClass;
  if (!getLCFModelStoreClass_softClass)
  {
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    v36 = __getLCFModelStoreClass_block_invoke;
    v37 = &unk_1E5ADE858;
    v38 = &v31;
    __getLCFModelStoreClass_block_invoke((uint64_t)&buf);
    objc_super v4 = (void *)v32[3];
  }
  pthread_mutexattr_t v5 = v4;
  _Block_object_dispose(&v31, 8);
  uint64_t v6 = (LCFModelStore *)[[v5 alloc] init:@"com.apple.proactive.shareheet.peoplesuggester" modelStoreRootURL:v29];
  modelStore = self->_modelStore;
  self->_modelStore = v6;

  [(LCFModelStore *)self->_modelStore clear];
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2050000000;
  v8 = (void *)getTRIClientClass_softClass_2;
  uint64_t v34 = getTRIClientClass_softClass_2;
  if (!getTRIClientClass_softClass_2)
  {
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    v36 = __getTRIClientClass_block_invoke_2;
    v37 = &unk_1E5ADE858;
    v38 = &v31;
    __getTRIClientClass_block_invoke_2((uint64_t)&buf);
    v8 = (void *)v32[3];
  }
  id v9 = v8;
  _Block_object_dispose(&v31, 8);
  v10 = [v9 clientWithIdentifier:210];
  v11 = [v10 levelForFactor:@"compiledOnDeviceShareSheetCoreMLModel" withNamespaceName:@"COREML_SYSTEMS_PEOPLE_SUGGESTER"];
  v12 = v11;
  if (!v11
    || ([v11 directoryValue],
        v13 = objc_claimAutoreleasedReturnValue(),
        [v13 path],
        v14 = objc_claimAutoreleasedReturnValue(),
        BOOL v15 = v14 == 0,
        v14,
        v13,
        v15))
  {
    id v20 = 0;
    goto LABEL_13;
  }
  v16 = (void *)MEMORY[0x1E4F1CB10];
  v17 = [v12 directoryValue];
  v18 = [v17 path];
  v19 = [v16 fileURLWithPath:v18 isDirectory:1];

  id v20 = v19;
  if (!v20
    || ([(_PSCoreMLScoringModel *)self loadCoreMLModel:v20 config:0],
        (v21 = objc_claimAutoreleasedReturnValue()) == 0))
  {
LABEL_13:
    v24 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v25 = [v24 bundlePath];

    v26 = [v25 stringByAppendingPathComponent:@"compiledShareSheetModel.mlmodelc"];
    id v23 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v26];

    v21 = [(_PSCoreMLScoringModel *)self loadCoreMLModel:v23 config:0];
    if (v21) {
      v22 = @"coreML_Build";
    }
    else {
      v22 = @"nil_model";
    }

    goto LABEL_17;
  }
  v22 = @"coreML_Trial";
  id v23 = v20;
LABEL_17:
  v27 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v22];
  [(_PSCoreMLScoringModel *)self setModelURL:v27];

  [(_PSCoreMLScoringModel *)self setMlModel:v21];
  [(_PSCoreMLScoringModel *)self loadModelMetadata];
  pthread_mutex_unlock(&self->_lock);
  v28 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v23;
    _os_log_impl(&dword_1A314B000, v28, OS_LOG_TYPE_INFO, "ML Model successfully loaded by _PSCoreMLScoringModel, model name: %@", (uint8_t *)&buf, 0xCu);
  }
}

- (void)unloadModel
{
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  [(_PSCoreMLScoringModel *)self setMlModel:0];
  [(_PSCoreMLScoringModel *)self setMetadata:0];
  [(_PSCoreMLScoringModel *)self setInputFeatureName:0];
  [(_PSCoreMLScoringModel *)self setNumCandidatesFeatureName:0];
  [(_PSCoreMLScoringModel *)self setOutputFeatureName:0];
  [(_PSCoreMLScoringModel *)self setInputShape:0];
  [(_PSCoreMLScoringModel *)self setMlModelInitialized:0];

  pthread_mutex_unlock(p_lock);
}

- (_PSCoreMLScoringModel)initWithCoreMLModel:(id)a3
{
  id v4 = a3;
  pthread_mutexattr_t v5 = [(_PSCoreMLScoringModel *)self init];
  pthread_mutex_lock(&v5->_lock);
  if (v4)
  {
    [(_PSCoreMLScoringModel *)v5 setMlModelInitialized:1];
    [(_PSCoreMLScoringModel *)v5 setMlModel:v4];
    uint64_t v6 = [v4 configuration];
    v7 = [v6 modelDisplayName];

    if (v7)
    {
      id v8 = objc_alloc(MEMORY[0x1E4F1CB10]);
      id v9 = [v4 configuration];
      v10 = [v9 modelDisplayName];
      v11 = (void *)[v8 initWithString:v10];
      [(_PSCoreMLScoringModel *)v5 setModelURL:v11];
    }
    [(_PSCoreMLScoringModel *)v5 loadModelMetadata];
  }
  pthread_mutex_lock(&v5->_lock);

  return v5;
}

- (id)loadCoreMLModel:(id)a3 config:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)[v6 copy];
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    uint64_t v21 = 0;
    v22 = &v21;
    uint64_t v23 = 0x2050000000;
    v10 = (void *)getMLModelConfigurationClass_softClass_2;
    uint64_t v24 = getMLModelConfigurationClass_softClass_2;
    if (!getMLModelConfigurationClass_softClass_2)
    {
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      v26 = __getMLModelConfigurationClass_block_invoke_2;
      v27 = &unk_1E5ADE858;
      v28 = &v21;
      CoreMLLibraryCore_7();
      Class Class = objc_getClass("MLModelConfiguration");
      *(void *)(v28[1] + 24) = Class;
      getMLModelConfigurationClass_softClass_2 = *(void *)(v28[1] + 24);
      v10 = (void *)v22[3];
    }
    id v12 = v10;
    _Block_object_dispose(&v21, 8);
    id v9 = (id)objc_opt_new();
  }
  [v9 setComputeUnits:0];
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2050000000;
  v13 = (void *)getMLModelClass_softClass_8;
  uint64_t v24 = getMLModelClass_softClass_8;
  if (!getMLModelClass_softClass_8)
  {
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    v26 = __getMLModelClass_block_invoke_8;
    v27 = &unk_1E5ADE858;
    v28 = &v21;
    CoreMLLibraryCore_7();
    Class v14 = objc_getClass("MLModel");
    *(void *)(v28[1] + 24) = v14;
    getMLModelClass_softClass_8 = *(void *)(v28[1] + 24);
    v13 = (void *)v22[3];
  }
  id v15 = v13;
  _Block_object_dispose(&v21, 8);
  id v20 = 0;
  v16 = [v15 modelWithContentsOfURL:v5 configuration:v9 error:&v20];
  id v17 = v20;
  if (v17)
  {
    v18 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v17;
      _os_log_impl(&dword_1A314B000, v18, OS_LOG_TYPE_INFO, "Couldn't load ML model, error: %@", (uint8_t *)&buf, 0xCu);
    }
  }

  return v16;
}

- (void)loadProductionModel:(id)a3
{
  id v4 = a3;
  id v5 = [(_PSCoreMLScoringModel *)self mlModel];

  if (!v5)
  {
    if (v4)
    {
      [(_PSCoreMLScoringModel *)self setMlModel:v4];
    }
    else
    {
      id v6 = [(LCFModelStore *)self->_modelStore getModelURL:@"compiledShareSheetModel.mlmodelc"];
      v7 = [(LCFModelStore *)self->_modelStore getModelConfig:@"compiledShareSheetModel.mlmodelc"];
      id v8 = [(_PSCoreMLScoringModel *)self loadCoreMLModel:v6 config:v7];
      [(_PSCoreMLScoringModel *)self setMlModel:v8];

      [(_PSCoreMLScoringModel *)self setModelURL:v6];
      id v9 = [(_PSCoreMLScoringModel *)self mlModel];

      if (!v9)
      {
        v10 = +[_PSLogging generalChannel];
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          -[_PSCoreMLScoringModel loadProductionModel:]();
        }
      }
    }
  }
}

- (void)loadModelMetadata
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1A314B000, v0, v1, "Could not load model metadata as model was not present", v2, v3, v4, v5, v6);
}

- (id)featureOrderFromMetadata
{
  uint64_t v3 = [(_PSCoreMLScoringModel *)self metadata];
  uint64_t v4 = [v3 objectForKeyedSubscript:@"feature_order"];

  if (v4)
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F28D90];
    uint8_t v6 = [(_PSCoreMLScoringModel *)self metadata];
    v7 = [v6 objectForKeyedSubscript:@"feature_order"];
    id v8 = [v7 dataUsingEncoding:4];
    id v21 = 0;
    id v9 = [v5 JSONObjectWithData:v8 options:8 error:&v21];
    v10 = v21;

    if (v9)
    {
      v11 = objc_msgSend(v9, "_pas_mappedArrayWithTransform:", &__block_literal_global_46);
    }
    else
    {
      v19 = +[_PSLogging generalChannel];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[_PSCoreMLScoringModel featureOrderFromMetadata]();
      }

      v11 = 0;
    }
  }
  else
  {
    v10 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      [(_PSCoreMLScoringModel *)v10 featureOrderFromMetadata];
    }
    v11 = 0;
  }

  return v11;
}

- (int64_t)getModelTypeWithModelMetadata:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 objectForKeyedSubscript:@"model_type"];
  if ([v4 isEqualToString:@"item"])
  {
    int64_t v5 = 0;
  }
  else if ([v4 isEqualToString:@"set"])
  {
    int64_t v5 = 1;
  }
  else if ([v4 isEqualToString:@"gbdt"])
  {
    int64_t v5 = 2;
  }
  else
  {
    uint8_t v6 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[_PSCoreMLScoringModel getModelTypeWithModelMetadata:]();
    }

    int64_t v5 = 3;
  }

  return v5;
}

- (id)getModelDescription
{
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  uint64_t v4 = [(MLModel *)self->_mlModel modelDescription];
  pthread_mutex_unlock(p_lock);

  return v4;
}

- (id)getModelPath
{
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  uint64_t v4 = [(_PSCoreMLScoringModel *)self modelURL];
  int64_t v5 = [v4 absoluteString];

  pthread_mutex_unlock(p_lock);

  return v5;
}

- (BOOL)isSetModel
{
  uint64_t v2 = objc_msgSend(NSNumber, "numberWithInteger:", -[_PSCoreMLScoringModel modelType](self, "modelType"));
  char v3 = [v2 isEqual:&unk_1EF675C30];

  return v3;
}

- (BOOL)isGBDTModel
{
  uint64_t v2 = objc_msgSend(NSNumber, "numberWithInteger:", -[_PSCoreMLScoringModel modelType](self, "modelType"));
  char v3 = [v2 isEqual:&unk_1EF675C48];

  return v3;
}

- (id)reformatCandidateDictionaryIntoFeatureTensor:(id)a3 candidateList:(id)a4 error:(id *)a5
{
  v58[1] = *MEMORY[0x1E4F143B8];
  id v46 = a3;
  id v8 = a4;
  id v9 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[_PSCoreMLScoringModel reformatCandidateDictionaryIntoFeatureTensor:candidateList:error:].cold.4(self, v9);
  }

  BOOL v10 = [(_PSCoreMLScoringModel *)self isSetModel];
  v11 = [(_PSCoreMLScoringModel *)self featureOrderFromMetadata];
  if (v10) {
    uint64_t v12 = 2;
  }
  else {
    uint64_t v12 = 1;
  }
  uint64_t v13 = [(_PSCoreMLScoringModel *)self inputShape];
  uint64_t v14 = [v13 objectAtIndexedSubscript:v12];
  uint64_t v15 = [v14 unsignedLongValue];
  uint64_t v16 = [v11 count];

  if (v15 == v16)
  {
    id v17 = objc_alloc((Class)getMLMultiArrayClass_1());
    uint64_t v18 = [(_PSCoreMLScoringModel *)self inputShape];
    v19 = (void *)[v17 initWithShape:v18 dataType:65568 error:a5];

    id v20 = +[_PSLogging generalChannel];
    id v21 = v20;
    if (v19)
    {
      BOOL v22 = os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG);

      uint64_t v23 = v47;
      if (v22)
      {
        uint64_t v24 = objc_opt_new();
        v25 = objc_opt_new();
      }
      else
      {
        v25 = 0;
        uint64_t v24 = 0;
      }
      v35 = +[_PSLogging generalChannel];
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1A314B000, v35, OS_LOG_TYPE_DEFAULT, "Copying feature vectors into feature tensor", buf, 2u);
      }

      BOOL v36 = v10;
      v37 = +[_PSCandidate selfCandidate];
      v38 = [v47 objectForKeyedSubscript:v37];

      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = __90___PSCoreMLScoringModel_reformatCandidateDictionaryIntoFeatureTensor_candidateList_error___block_invoke;
      v48[3] = &unk_1E5AE1898;
      BOOL v55 = v36;
      id v49 = v8;
      id v50 = v47;
      id v51 = v11;
      id v39 = v38;
      id v52 = v39;
      id v40 = v25;
      id v53 = v40;
      id v21 = v24;
      v54 = v21;
      [v19 getMutableBytesWithHandler:v48];
      v41 = +[_PSLogging generalChannel];
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG)) {
        -[_PSCoreMLScoringModel reformatCandidateDictionaryIntoFeatureTensor:candidateList:error:]();
      }

      v42 = +[_PSLogging generalChannel];
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG)) {
        -[_PSCoreMLScoringModel reformatCandidateDictionaryIntoFeatureTensor:candidateList:error:]();
      }

      v43 = +[_PSLogging generalChannel];
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1A314B000, v43, OS_LOG_TYPE_INFO, "Finished reformatting candidate dictionary into feature tensor", buf, 2u);
      }

      id v44 = v19;
    }
    else
    {
      uint64_t v23 = v47;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[_PSCoreMLScoringModel reformatCandidateDictionaryIntoFeatureTensor:candidateList:error:]((uint64_t)a5, v21, v29, v30, v31, v32, v33, v34);
      }
    }

    v28 = v19;
  }
  else
  {
    if (!a5)
    {
      v28 = 0;
      uint64_t v23 = v47;
      goto LABEL_27;
    }
    id v26 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v57 = *MEMORY[0x1E4F28568];
    v58[0] = @"feature list length doesn't match shape";
    v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v58 forKeys:&v57 count:1];
    id v27 = (id)[v26 initWithDomain:@"com.apple.PeopleSuggester" code:1 userInfo:v19];
    v28 = 0;
    *a5 = v27;
    uint64_t v23 = v47;
  }

LABEL_27:

  return v28;
}

- (id)predictWithFeatureProvider:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(_PSCoreMLScoringModel *)self mlModel];
  id v16 = 0;
  uint8_t v6 = [v5 predictionFromFeatures:v4 error:&v16];

  id v7 = v16;
  if (v7)
  {
    id v8 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[_PSCoreMLScoringModel predictWithFeatureProvider:]();
    }
    id v9 = 0;
  }
  else
  {
    id v8 = [v6 dictionary];
    BOOL v10 = [(_PSCoreMLScoringModel *)self outputFeatureName];
    v11 = [v8 objectForKeyedSubscript:v10];

    uint64_t v12 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v11, "type"));
    int v13 = [v12 isEqual:&unk_1EF675C60];

    if (v13)
    {
      id v9 = [v11 multiArrayValue];
    }
    else
    {
      uint64_t v14 = +[_PSLogging generalChannel];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[_PSCoreMLScoringModel predictWithFeatureProvider:](v11, v14);
      }

      id v9 = 0;
    }
  }

  return v9;
}

- (id)scoreCandidatesWithGBDTModel:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int64_t v5 = +[_PSLogging suggestionSignpost];
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A314B000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSCandidateScoringGBDTModel-Inference", " enableTelemetry=YES ", buf, 2u);
  }

  uint8_t v6 = [v4 allValues];
  id v7 = [(_PSCoreMLScoringModel *)self batchPredictWithFeatureDictArray:v6];

  id v8 = +[_PSLogging suggestionSignpost];
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A314B000, v8, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSCandidateScoringGBDTModel-Inference", (const char *)&unk_1A3274816, buf, 2u);
  }

  id v9 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1A314B000, v9, OS_LOG_TYPE_INFO, "_PSCandidateScoringCoreMLModel - People Suggester run inference with the GBDT model", buf, 2u);
  }

  uint64_t v10 = [v7 count];
  if (v10 == [v4 count])
  {
    v11 = objc_opt_new();
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v12 = v4;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = 0;
      uint64_t v16 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v22 != v16) {
            objc_enumerationMutation(v12);
          }
          uint64_t v18 = *(void *)(*((void *)&v21 + 1) + 8 * i);
          v19 = objc_msgSend(v7, "objectAtIndexedSubscript:", v15 + i, (void)v21);
          [v11 setObject:v19 forKeyedSubscript:v18];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v26 count:16];
        v15 += i;
      }
      while (v14);
    }
  }
  else
  {
    v11 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v11;
}

- (id)scoreCandidatesWithCoreMLModel:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int64_t v5 = [v4 allKeys];
  uint8_t v6 = objc_msgSend(v5, "_pas_mappedArrayWithTransform:", &__block_literal_global_149);

  id v7 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134217984;
    uint64_t v37 = [v6 count];
    _os_log_impl(&dword_1A314B000, v7, OS_LOG_TYPE_DEFAULT, "Scoring %tu candidates using CoreML ranker", buf, 0xCu);
  }

  id v8 = +[_PSLogging suggestionSignpost];
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A314B000, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSCandidateScoringCoreMLModel-Inference", " enableTelemetry=YES ", buf, 2u);
  }

  id v9 = +[_PSFeaturePreprocessor encodeFeatureVectors:v4];

  id v35 = 0;
  uint64_t v10 = [(_PSCoreMLScoringModel *)self reformatCandidateDictionaryIntoFeatureTensor:v9 candidateList:v6 error:&v35];
  id v11 = v35;
  if (v10)
  {
    id v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
    uint64_t v13 = objc_opt_new();
    uint64_t v14 = [(_PSCoreMLScoringModel *)self inputFeatureName];
    [v13 setObject:v10 forKeyedSubscript:v14];

    if ([(_PSCoreMLScoringModel *)self isSetModel])
    {
      uint64_t v15 = +[_PSLogging generalChannel];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        -[_PSCoreMLScoringModel scoreCandidatesWithCoreMLModel:].cold.6();
      }

      id v34 = v11;
      uint64_t v16 = (void *)[objc_alloc((Class)getMLMultiArrayClass_1()) initWithShape:&unk_1EF6765F0 dataType:65600 error:&v34];
      id v17 = v34;

      if (v17)
      {
        uint64_t v18 = +[_PSLogging generalChannel];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          -[_PSCoreMLScoringModel scoreCandidatesWithCoreMLModel:].cold.5();
        }
LABEL_19:
        v19 = MEMORY[0x1E4F1CC08];
LABEL_31:

        id v11 = v17;
        goto LABEL_32;
      }
      [v16 setObject:v12 atIndexedSubscript:0];
      id v20 = [(_PSCoreMLScoringModel *)self numCandidatesFeatureName];
      [v13 setObject:v16 forKeyedSubscript:v20];

      id v11 = 0;
    }
    id v33 = v11;
    uint64_t v16 = (void *)[objc_alloc((Class)getMLDictionaryFeatureProviderClass_3()) initWithDictionary:v13 error:&v33];
    id v17 = v33;

    if (v17)
    {
      uint64_t v18 = +[_PSLogging generalChannel];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[_PSCoreMLScoringModel scoreCandidatesWithCoreMLModel:].cold.4();
      }
      goto LABEL_19;
    }
    long long v21 = [(_PSCoreMLScoringModel *)self predictWithFeatureProvider:v16];
    uint64_t v18 = [v21 squeeze];

    long long v22 = +[_PSLogging suggestionSignpost];
    if (os_signpost_enabled(v22))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A314B000, v22, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSCandidateScoringCoreMLModel-Inference", " enableTelemetry=YES ", buf, 2u);
    }

    uint64_t v29 = [v18 shape];
    if ([v29 count] == 1)
    {
      uint64_t v23 = [v18 count];
      if (v23 >= (int)[v12 intValue])
      {
        v25 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", (int)-[NSObject intValue](v12, "intValue"));
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __56___PSCoreMLScoringModel_scoreCandidatesWithCoreMLModel___block_invoke_154;
        v30[3] = &unk_1E5AE18E0;
        id v26 = v25;
        id v31 = v26;
        uint64_t v32 = v18;
        [v6 enumerateObjectsUsingBlock:v30];
        uint64_t v27 = v32;
        long long v24 = v26;

        v19 = v24;
        goto LABEL_30;
      }
      long long v24 = +[_PSLogging generalChannel];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        [(_PSCoreMLScoringModel *)v18 scoreCandidatesWithCoreMLModel:v24];
      }
    }
    else
    {
      long long v24 = +[_PSLogging generalChannel];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        -[_PSCoreMLScoringModel scoreCandidatesWithCoreMLModel:]();
      }
    }
    v19 = MEMORY[0x1E4F1CC08];
LABEL_30:

    goto LABEL_31;
  }
  id v12 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    -[_PSCoreMLScoringModel scoreCandidatesWithCoreMLModel:]();
  }
  v19 = MEMORY[0x1E4F1CC08];
LABEL_32:

  return v19;
}

- (id)scoreCandidates:(id)a3 predictionContext:(id)a4
{
  uint8_t v6 = (void (**)(void))a3;
  id v7 = a4;
  pthread_mutex_lock(&self->_lock);
  id v8 = +[_PSLogging suggestionSignpost];
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A314B000, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetLoadMLModel", " enableTelemetry=YES ", buf, 2u);
  }

  if (!self->_mlModelInitialized) {
    [(_PSCoreMLScoringModel *)self loadModel];
  }
  id v9 = +[_PSLogging suggestionSignpost];
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)uint64_t v18 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A314B000, v9, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetLoadMLModel", (const char *)&unk_1A3274816, v18, 2u);
  }

  uint64_t v10 = [(_PSCoreMLScoringModel *)self mlModel];

  if (v10)
  {
    id v11 = v6[2](v6);
    if ([v11 count])
    {
      id v12 = [(_PSCoreMLScoringModel *)self metadata];
      if (v12)
      {
        uint64_t v13 = [(_PSCoreMLScoringModel *)self inputFeatureName];

        if (v13)
        {
          if ([(_PSCoreMLScoringModel *)self isGBDTModel]) {
            [(_PSCoreMLScoringModel *)self scoreCandidatesWithGBDTModel:v11];
          }
          else {
          uint64_t v15 = [(_PSCoreMLScoringModel *)self scoreCandidatesWithCoreMLModel:v11];
          }
          goto LABEL_23;
        }
      }
      uint64_t v16 = +[_PSLogging generalChannel];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
        -[_PSCoreMLScoringModel scoreCandidates:predictionContext:]();
      }
    }
    else
    {
      uint64_t v16 = +[_PSLogging generalChannel];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
        -[_PSCoreMLScoringModel scoreCandidates:predictionContext:]();
      }
    }

    uint64_t v15 = (void *)MEMORY[0x1E4F1CC08];
LABEL_23:

    goto LABEL_24;
  }
  uint64_t v14 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
    -[_PSCoreMLScoringModel scoreCandidates:predictionContext:]();
  }

  uint64_t v15 = (void *)MEMORY[0x1E4F1CC08];
LABEL_24:
  [(_PSCoreMLScoringModel *)self unloadModel];
  pthread_mutex_unlock(&self->_lock);

  return v15;
}

- (id)batchPredictWithFeatureDictArray:(id)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v33 = a3;
  BOOL v36 = self;
  uint64_t v37 = [(_PSCoreMLScoringModel *)self featureOrderFromMetadata];
  if (v37)
  {
    id v32 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v34 = [MEMORY[0x1E4F1CA48] array];
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id obj = v33;
    uint64_t v4 = [obj countByEnumeratingWithState:&v45 objects:v59 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v46;
      while (2)
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v46 != v5) {
            objc_enumerationMutation(obj);
          }
          uint64_t v7 = *(void *)(*((void *)&v45 + 1) + 8 * i);
          id v8 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
          id v9 = objc_alloc((Class)getMLMultiArrayClass_1());
          uint64_t v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v37, "count"));
          v58 = v10;
          id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v58 count:1];
          id v44 = 0;
          id v12 = (void *)[v9 initWithShape:v11 dataType:65600 error:&v44];
          uint64_t v13 = v44;

          if (v13)
          {
            v25 = +[_PSLogging generalChannel];
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
              -[_PSCoreMLScoringModel batchPredictWithFeatureDictArray:].cold.4();
            }

            goto LABEL_28;
          }
          v42[0] = MEMORY[0x1E4F143A8];
          v42[1] = 3221225472;
          v42[2] = __58___PSCoreMLScoringModel_batchPredictWithFeatureDictArray___block_invoke;
          v42[3] = &unk_1E5ADEE20;
          v42[4] = v7;
          id v14 = v12;
          id v43 = v14;
          [v37 enumerateObjectsUsingBlock:v42];
          uint64_t v15 = [(_PSCoreMLScoringModel *)v36 inputFeatureName];
          [v8 setObject:v14 forKeyedSubscript:v15];

          id v16 = objc_alloc((Class)getMLDictionaryFeatureProviderClass_3());
          id v41 = 0;
          id v17 = (void *)[v16 initWithDictionary:v8 error:&v41];
          uint64_t v13 = v41;
          if (v13)
          {
            uint64_t v18 = +[_PSLogging generalChannel];
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
              [(_PSCoreMLScoringModel *)&buf batchPredictWithFeatureDictArray:v18];
            }
          }
          else
          {
            [v34 addObject:v17];
          }

          if (v13)
          {
            long long v24 = 0;
            goto LABEL_37;
          }
        }
        uint64_t v4 = [obj countByEnumeratingWithState:&v45 objects:v59 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }

    uint64_t v54 = 0;
    BOOL v55 = &v54;
    uint64_t v56 = 0x2050000000;
    v19 = (void *)getMLArrayBatchProviderClass_softClass_3;
    uint64_t v57 = getMLArrayBatchProviderClass_softClass_3;
    if (!getMLArrayBatchProviderClass_softClass_3)
    {
      uint64_t v49 = MEMORY[0x1E4F143A8];
      uint64_t v50 = 3221225472;
      id v51 = __getMLArrayBatchProviderClass_block_invoke_3;
      id v52 = &unk_1E5ADE858;
      id v53 = &v54;
      CoreMLLibraryCore_7();
      Class Class = objc_getClass("MLArrayBatchProvider");
      *(void *)(v53[1] + 24) = Class;
      getMLArrayBatchProviderClass_softClass_3 = *(void *)(v53[1] + 24);
      v19 = (void *)v55[3];
    }
    long long v21 = v19;
    _Block_object_dispose(&v54, 8);
    id obj = (id)[[v21 alloc] initWithFeatureProviderArray:v34];
    mlModel = v36->_mlModel;
    id v38 = 0;
    id v8 = [(MLModel *)mlModel predictionsFromBatch:obj error:&v38];
    uint64_t v13 = v38;
    if (v13)
    {
      uint64_t v23 = +[_PSLogging generalChannel];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        -[_PSCoreMLScoringModel batchPredictWithFeatureDictArray:]();
      }

LABEL_28:
      long long v24 = 0;
    }
    else
    {
      if ([v8 count] >= 1)
      {
        uint64_t v26 = 0;
        do
        {
          uint64_t v27 = [v8 featuresAtIndex:v26];
          v28 = [v27 featureValueForName:@"classProbability"];
          uint64_t v29 = [v28 dictionaryValue];

          if ([v29 count] == 2)
          {
            uint64_t v30 = [v29 objectForKeyedSubscript:&unk_1EF675C78];
            [v32 addObject:v30];
          }
          ++v26;
        }
        while (v26 < [v8 count]);
      }
      long long v24 = (void *)[v32 copy];
    }

LABEL_37:
  }
  else
  {
    uint64_t v13 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[_PSCoreMLScoringModel batchPredictWithFeatureDictArray:]();
    }
    long long v24 = 0;
  }

  return v24;
}

- (id)getSuggestionProxiesForCandidateToFeatureVectorDictGetter:(id)a3 predictionContext:(id)a4 messageInteractionCache:(id)a5 shareInteractionCache:(id)a6
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v34 = (id)objc_opt_new();
  uint64_t v10 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint8_t buf = 0;
    _os_log_impl(&dword_1A314B000, v10, OS_LOG_TYPE_INFO, "_PSCoreMLScoringModel ranking", buf, 2u);
  }

  id v31 = v9;
  id v32 = v8;
  id v35 = [(_PSCoreMLScoringModel *)self scoreCandidates:v8 predictionContext:v9];
  id v11 = [v35 keysSortedByValueUsingComparator:&__block_literal_global_163];
  id v12 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint8_t buf = 138477827;
    v42 = v11;
    _os_log_impl(&dword_1A314B000, v12, OS_LOG_TYPE_INFO, "_PSCoreMLScoringModel sorted score array: %{private}@", buf, 0xCu);
  }

  uint64_t v13 = [(_PSCoreMLScoringModel *)self getModelPath];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = v11;
  uint64_t v14 = [(_PSSuggestionProxy *)obj countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v37 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        v19 = [v35 objectForKeyedSubscript:v18];
        id v20 = [v18 candidateIdentifier];
        long long v21 = [v18 bundleId];
        long long v22 = +[_PSConstants sharePlayBundleId];
        int v23 = [v21 isEqual:v22];

        if (v23)
        {
          uint64_t v24 = [v18 recipientsId];

          id v20 = (void *)v24;
        }
        v25 = [_PSSuggestionProxy alloc];
        uint64_t v26 = [v18 bundleId];
        uint64_t v27 = (void *)[[NSString alloc] initWithFormat:@"%@\n Score: %@", v13, v19];
        v28 = [(_PSSuggestionProxy *)v25 initWithBundleID:v26 interactionRecipients:v20 contactID:0 reason:v27 reasonType:v13 modelScore:v19];

        if (v28)
        {
          [v34 addObject:v28];
          uint64_t v29 = +[_PSLogging generalChannel];
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)uint8_t buf = 138412290;
            v42 = v28;
            _os_log_impl(&dword_1A314B000, v29, OS_LOG_TYPE_DEFAULT, "suggestionProxy: %@", buf, 0xCu);
          }
        }
      }
      uint64_t v15 = [(_PSSuggestionProxy *)obj countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v15);
  }

  return v34;
}

- (_opaque_pthread_mutex_t)lock
{
  long long v3 = *(_OWORD *)&self[1].__opaque[32];
  *(_OWORD *)&retstr->__sig = *(_OWORD *)&self[1].__opaque[16];
  *(_OWORD *)&retstr->__opaque[8] = v3;
  long long v4 = *(_OWORD *)self[2].__opaque;
  *(_OWORD *)&retstr->__opaque[24] = *(_OWORD *)&self[1].__opaque[48];
  *(_OWORD *)&retstr->__opaque[40] = v4;
  return self;
}

- (void)setLock:(_opaque_pthread_mutex_t *)a3
{
  long long v3 = *(_OWORD *)&a3->__sig;
  long long v4 = *(_OWORD *)&a3->__opaque[8];
  long long v5 = *(_OWORD *)&a3->__opaque[24];
  *(_OWORD *)&self->_lock.__opaque[40] = *(_OWORD *)&a3->__opaque[40];
  *(_OWORD *)&self->_lock.__opaque[24] = v5;
  *(_OWORD *)&self->_lock.__opaque[8] = v4;
  *(_OWORD *)&self->_lock.__sig = v3;
}

- (MLModel)mlModel
{
  return self->_mlModel;
}

- (void)setMlModel:(id)a3
{
}

- (BOOL)mlModelInitialized
{
  return self->_mlModelInitialized;
}

- (void)setMlModelInitialized:(BOOL)a3
{
  self->_mlModelInitialized = a3;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (NSArray)inputShape
{
  return self->_inputShape;
}

- (void)setInputShape:(id)a3
{
}

- (NSURL)modelURL
{
  return self->_modelURL;
}

- (void)setModelURL:(id)a3
{
}

- (NSString)inputFeatureName
{
  return self->_inputFeatureName;
}

- (void)setInputFeatureName:(id)a3
{
}

- (NSString)numCandidatesFeatureName
{
  return self->_numCandidatesFeatureName;
}

- (void)setNumCandidatesFeatureName:(id)a3
{
}

- (NSString)outputFeatureName
{
  return self->_outputFeatureName;
}

- (void)setOutputFeatureName:(id)a3
{
}

- (int64_t)modelType
{
  return self->_modelType;
}

- (void)setModelType:(int64_t)a3
{
  self->_modelType = a3;
}

- (LCFModelStore)modelStore
{
  return self->_modelStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelStore, 0);
  objc_storeStrong((id *)&self->_outputFeatureName, 0);
  objc_storeStrong((id *)&self->_numCandidatesFeatureName, 0);
  objc_storeStrong((id *)&self->_inputFeatureName, 0);
  objc_storeStrong((id *)&self->_modelURL, 0);
  objc_storeStrong((id *)&self->_inputShape, 0);
  objc_storeStrong((id *)&self->_metadata, 0);

  objc_storeStrong((id *)&self->_mlModel, 0);
}

- (void)loadProductionModel:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_1A314B000, v0, v1, "Failed to load ML Model with URL: %@", v2, v3, v4, v5, v6);
}

- (void)featureOrderFromMetadata
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_1A314B000, v0, v1, "Could not decode feature list. %@", v2, v3, v4, v5, v6);
}

- (void)getModelTypeWithModelMetadata:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  _os_log_fault_impl(&dword_1A314B000, v0, OS_LOG_TYPE_FAULT, "Metadata %@ resulted in unknown model type", v1, 0xCu);
}

- (void)reformatCandidateDictionaryIntoFeatureTensor:(uint64_t)a3 candidateList:(uint64_t)a4 error:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)reformatCandidateDictionaryIntoFeatureTensor:candidateList:error:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5(&dword_1A314B000, v0, v1, "Missing candidates per feature %{private}@", v2, v3, v4, v5, v6);
}

- (void)reformatCandidateDictionaryIntoFeatureTensor:candidateList:error:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5(&dword_1A314B000, v0, v1, "Missing features per candidate %{private}@", v2, v3, v4, v5, v6);
}

- (void)reformatCandidateDictionaryIntoFeatureTensor:(void *)a1 candidateList:(NSObject *)a2 error:.cold.4(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 inputShape];
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_1A314B000, a2, OS_LOG_TYPE_DEBUG, "Reformatting candidate dictionary into feature tensor, with input shape: %@", v4, 0xCu);
}

- (void)predictWithFeatureProvider:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "type"));
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_1A314B000, a2, OS_LOG_TYPE_ERROR, "Model output type was %@ instead of MLFeatureTypeMultiArray", v4, 0xCu);
}

- (void)predictWithFeatureProvider:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_1A314B000, v0, v1, "Predictions returned error: %@", v2, v3, v4, v5, v6);
}

- (void)scoreCandidatesWithCoreMLModel:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_1A314B000, v0, v1, "Error creating tensor: %@", v2, v3, v4, v5, v6);
}

- (void)scoreCandidatesWithCoreMLModel:(NSObject *)a3 .cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  [a1 count];
  OUTLINED_FUNCTION_0();
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1A314B000, a3, OS_LOG_TYPE_ERROR, "prediction count (%ld) < candidate count (%@)", v5, 0x16u);
}

- (void)scoreCandidatesWithCoreMLModel:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_1A314B000, v0, v1, "Unexpected output shape %@", v2, v3, v4, v5, v6);
}

- (void)scoreCandidatesWithCoreMLModel:.cold.4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_1A314B000, v0, v1, "Model returned error: %@", v2, v3, v4, v5, v6);
}

- (void)scoreCandidatesWithCoreMLModel:.cold.5()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_1A314B000, v0, v1, "numCandidatesTensor returned an error during creation: %@", v2, v3, v4, v5, v6);
}

- (void)scoreCandidatesWithCoreMLModel:.cold.6()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5(&dword_1A314B000, v0, v1, "Setting number of candidates to %@", v2, v3, v4, v5, v6);
}

- (void)scoreCandidates:predictionContext:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_0(&dword_1A314B000, v0, v1, "_PSCandidateScoringCoreMLModel - model was missing", v2, v3, v4, v5, v6);
}

- (void)scoreCandidates:predictionContext:.cold.2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_0(&dword_1A314B000, v0, v1, "_PSCandidateScoringCoreMLModel - candidateToFeatureVectorDict was missing or empty", v2, v3, v4, v5, v6);
}

- (void)scoreCandidates:predictionContext:.cold.3()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_0(&dword_1A314B000, v0, v1, "_PSCandidateScoringCoreMLModel - model metadata was missing", v2, v3, v4, v5, v6);
}

- (void)batchPredictWithFeatureDictArray:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1A314B000, v0, v1, "no features", v2, v3, v4, v5, v6);
}

- (void)batchPredictWithFeatureDictArray:.cold.2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1A314B000, v0, v1, "_PSCandidateScoringCoreMLModel - People Suggester ML model, predictionsFromBatch failure", v2, v3, v4, v5, v6);
}

- (void)batchPredictWithFeatureDictArray:(os_log_t)log .cold.3(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *uint8_t buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1A314B000, log, OS_LOG_TYPE_ERROR, "MLDictionaryFeatureProvider call failure", buf, 2u);
}

- (void)batchPredictWithFeatureDictArray:.cold.4()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1A314B000, v0, v1, "MLMultiArray creation failure", v2, v3, v4, v5, v6);
}

@end