@interface _PSFamilyMLModel
- (BOOL)isFamilyContact:(id)a3;
- (NSDictionary)models;
- (OS_xpc_object)activity;
- (_PSFamilyMLModel)init;
- (_PSFamilyMLModel)initWithActivity:(id)a3;
- (_PSFamilyMLModel)initWithModels:(id)a3;
- (id)defaultModelForPrediction;
- (id)defaultPredictionForInputFeatures:(id)a3;
- (id)ensemblePredictionForInputFeatures:(id)a3;
- (id)familiesPredictionForContacts:(id)a3 withMaxSuggestion:(int64_t)a4;
- (id)familyProbability:(id)a3;
- (id)getFeatureDictForContact:(id)a3;
- (id)getModelWithModelName:(id)a3;
- (id)getPredictionFromModel:(id)a3 withInputFeatures:(id)a4;
- (id)loadModelFromUrlResource:(id)a3;
- (id)predictionForContact:(id)a3;
- (id)predictionForContact:(id)a3 featureDict:(id)a4;
- (void)commonInit;
- (void)initializeModels;
@end

@implementation _PSFamilyMLModel

- (_PSFamilyMLModel)init
{
  v5.receiver = self;
  v5.super_class = (Class)_PSFamilyMLModel;
  v2 = [(_PSFamilyMLModel *)&v5 init];
  v3 = v2;
  if (v2) {
    [(_PSFamilyMLModel *)v2 initializeModels];
  }
  return v3;
}

- (_PSFamilyMLModel)initWithActivity:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_PSFamilyMLModel;
  v6 = [(_PSFamilyMLModel *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_activity, a3);
    [(_PSFamilyMLModel *)v7 initializeModels];
  }

  return v7;
}

- (_PSFamilyMLModel)initWithModels:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_PSFamilyMLModel;
  v6 = [(_PSFamilyMLModel *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_models, a3);
  }

  return v7;
}

- (void)initializeModels
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a1 count];
  id v5 = [a1 allKeys];
  int v6 = 134218498;
  uint64_t v7 = 4;
  __int16 v8 = 2048;
  uint64_t v9 = v4;
  __int16 v10 = 2114;
  v11 = v5;
  _os_log_error_impl(&dword_1A314B000, a2, OS_LOG_TYPE_ERROR, "Failed to load all %tu models (successfully loaded %tu models: %{public}@)", (uint8_t *)&v6, 0x20u);
}

- (void)commonInit
{
  v3 = self->_activity;
  id v4 = objc_alloc(MEMORY[0x1E4F93B68]);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __30___PSFamilyMLModel_commonInit__block_invoke;
  v8[3] = &unk_1E5ADFD38;
  uint64_t v9 = v3;
  id v5 = v3;
  int v6 = (_PASLazyResult *)[v4 initWithBlock:v8];
  extractor = self->_extractor;
  self->_extractor = v6;
}

- (BOOL)isFamilyContact:(id)a3
{
  v3 = [(_PSFamilyMLModel *)self predictionForContact:a3];
  id v4 = [v3 featureValueForName:@"labelFinal"];
  uint64_t v5 = [v4 int64Value];

  return v5 != 0;
}

- (id)familyProbability:(id)a3
{
  v3 = [(_PSFamilyMLModel *)self predictionForContact:a3];
  id v4 = [v3 featureValueForName:@"classProbability"];
  uint64_t v5 = [v4 dictionaryValue];

  return v5;
}

- (id)familiesPredictionForContacts:(id)a3 withMaxSuggestion:(int64_t)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  obuint64_t j = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v31 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v30 + 1) + 8 * i);
        uint64_t v12 = [(_PSFamilyMLModel *)self familyProbability:v11];
        v13 = [v12 objectForKey:&unk_1EF675108];

        v35[0] = v11;
        v35[1] = v13;
        v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:2];
        if (v6)
        {
          objc_msgSend(v6, "insertObject:atIndex:", v14, objc_msgSend(v6, "indexOfObject:inSortedRange:options:usingComparator:", v14, 0, objc_msgSend(v6, "count"), 1024, &__block_literal_global_11));
          if ([v6 count] > (unint64_t)a4) {
            [v6 removeLastObject];
          }
        }
        else
        {
          [0 addObject:v14];
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v30 objects:v36 count:16];
    }
    while (v8);
  }

  v15 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a4];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v16 = v6;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v27;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v27 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = [*(id *)(*((void *)&v26 + 1) + 8 * j) firstObject];
        [v15 addObject:v21];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v18);
  }

  v22 = (void *)[v15 copy];

  return v22;
}

- (id)predictionForContact:(id)a3 featureDict:(id)a4
{
  id v5 = a4;
  if (+[_PSFamilyUtilities featureDictionaryPassesHeuristic:v5])
  {
    uint64_t v9 = 0;
    id v6 = (void *)[objc_alloc((Class)getMLDictionaryFeatureProviderClass_0()) initWithDictionary:v5 error:&v9];
    uint64_t v7 = [(_PSFamilyMLModel *)self ensemblePredictionForInputFeatures:v6];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)predictionForContact:(id)a3
{
  id v4 = a3;
  id v5 = [(_PSFamilyMLModel *)self getFeatureDictForContact:v4];
  id v6 = [(_PSFamilyMLModel *)self predictionForContact:v4 featureDict:v5];

  return v6;
}

- (id)getFeatureDictForContact:(id)a3
{
  extractor = self->_extractor;
  id v4 = a3;
  id v5 = [(_PASLazyResult *)extractor result];
  id v6 = [v5 featureInputForContact:v4];

  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = (void *)MEMORY[0x1E4F1CC08];
  }
  id v8 = v7;

  return v8;
}

- (id)defaultModelForPrediction
{
  return [(_PSFamilyMLModel *)self getModelWithModelName:@"model_rf"];
}

- (id)getModelWithModelName:(id)a3
{
  id v4 = a3;
  id v5 = [(_PSFamilyMLModel *)self models];
  id v6 = [v5 objectForKey:v4];

  return v6;
}

- (id)loadModelFromUrlResource:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v5 = [v4 URLForResource:v3 withExtension:@"mlmodelc"];

  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2050000000;
  id v6 = (void *)getMLModelClass_softClass_4;
  uint64_t v18 = getMLModelClass_softClass_4;
  if (!getMLModelClass_softClass_4)
  {
    v13[1] = (id)MEMORY[0x1E4F143A8];
    v13[2] = (id)3221225472;
    v13[3] = __getMLModelClass_block_invoke_4;
    v13[4] = &unk_1E5ADE858;
    v14 = &v15;
    CoreMLLibraryCore_3();
    v16[3] = (uint64_t)objc_getClass("MLModel");
    getMLModelClass_softClass_4 = *(void *)(v14[1] + 24);
    id v6 = (void *)v16[3];
  }
  id v7 = v6;
  _Block_object_dispose(&v15, 8);
  v13[0] = 0;
  id v8 = [v7 modelWithContentsOfURL:v5 error:v13];
  id v9 = v13[0];
  if (v9)
  {
    __int16 v10 = +[_PSLogging familyRecommenderChannel];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      [(_PSFamilyMLModel *)v5 loadModelFromUrlResource:v10];
    }

    id v11 = 0;
  }
  else
  {
    id v11 = v8;
  }

  return v11;
}

- (id)defaultPredictionForInputFeatures:(id)a3
{
  id v4 = a3;
  id v5 = [(_PSFamilyMLModel *)self defaultModelForPrediction];
  id v11 = 0;
  id v6 = [v5 predictionFromFeatures:v4 error:&v11];

  id v7 = v11;
  if (v7)
  {
    id v8 = +[_PSLogging familyRecommenderChannel];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[_PSFamilyMLModel defaultPredictionForInputFeatures:]((uint64_t)v7, v8);
    }

    id v9 = 0;
  }
  else
  {
    id v9 = v6;
  }

  return v9;
}

- (id)ensemblePredictionForInputFeatures:(id)a3
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = [(_PSFamilyMLModel *)self getPredictionFromModel:@"model_dt" withInputFeatures:v4];
  id v7 = [v6 featureValueForName:@"labelFinal"];
  uint64_t v8 = [v7 int64Value];

  id v9 = [v6 featureValueForName:@"classProbability"];
  uint64_t v10 = [v9 dictionaryValue];

  v59 = (void *)v10;
  [v5 addObject:v10];
  id v11 = [(_PSFamilyMLModel *)self getPredictionFromModel:@"model_rf" withInputFeatures:v4];
  uint64_t v12 = [v11 featureValueForName:@"labelFinal"];
  uint64_t v13 = [v12 int64Value];

  uint64_t v14 = v13 + v8;
  v58 = v11;
  uint64_t v15 = [v11 featureValueForName:@"classProbability"];
  id v16 = [v15 dictionaryValue];

  [v5 addObject:v16];
  uint64_t v17 = [(_PSFamilyMLModel *)self getPredictionFromModel:@"model_gbdt" withInputFeatures:v4];
  uint64_t v18 = [v17 featureValueForName:@"labelFinal"];
  uint64_t v19 = [v18 int64Value];

  uint64_t v20 = v14 + v19;
  v21 = [v17 featureValueForName:@"classProbability"];
  uint64_t v22 = [v21 dictionaryValue];

  v57 = (void *)v22;
  [v5 addObject:v22];
  v23 = [(_PSFamilyMLModel *)self getPredictionFromModel:@"IP_model_gbdt" withInputFeatures:v4];
  v24 = [v23 featureValueForName:@"target"];
  uint64_t v25 = [v24 int64Value];

  uint64_t v26 = v20 + 3 * v25;
  v56 = v23;
  long long v27 = [v23 featureValueForName:@"classProbability"];
  uint64_t v28 = [v27 dictionaryValue];

  v55 = (void *)v28;
  [v5 addObject:v28];
  BOOL v29 = v26 > 1;
  id v30 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v31 = v5;
  uint64_t v32 = [v31 countByEnumeratingWithState:&v61 objects:v65 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    BOOL v53 = v29;
    v54 = v17;
    id v34 = v4;
    v35 = v16;
    v36 = v6;
    uint64_t v37 = *(void *)v62;
    double v38 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v33; ++i)
      {
        if (*(void *)v62 != v37) {
          objc_enumerationMutation(v31);
        }
        v40 = objc_msgSend(*(id *)(*((void *)&v61 + 1) + 8 * i), "objectForKey:", &unk_1EF675108, v53, v54);
        [v40 doubleValue];
        double v42 = v41;

        double v38 = v38 + v42;
      }
      uint64_t v33 = [v31 countByEnumeratingWithState:&v61 objects:v65 count:16];
    }
    while (v33);
    double v43 = v38 * 0.25;
    id v6 = v36;
    id v16 = v35;
    id v4 = v34;
    BOOL v29 = v53;
    uint64_t v17 = v54;
  }
  else
  {
    double v43 = 0.0;
  }

  v44 = [NSNumber numberWithDouble:v43];
  [v30 setObject:v44 forKey:&unk_1EF675108];

  v45 = [NSNumber numberWithDouble:1.0 - v43];
  [v30 setObject:v45 forKey:&unk_1EF675120];

  id v46 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v46 setObject:v30 forKey:@"classProbability"];
  v47 = [NSNumber numberWithLongLong:v29];
  [v46 setObject:v47 forKey:@"labelFinal"];

  id v60 = 0;
  v48 = (void *)[objc_alloc((Class)getMLDictionaryFeatureProviderClass_0()) initWithDictionary:v46 error:&v60];
  id v49 = v60;
  if (v49)
  {
    v50 = +[_PSLogging familyRecommenderChannel];
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
      -[_PSFamilyMLModel ensemblePredictionForInputFeatures:]((uint64_t)v49, v50);
    }

    id v51 = 0;
  }
  else
  {
    id v51 = v48;
  }

  return v51;
}

- (id)getPredictionFromModel:(id)a3 withInputFeatures:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(_PSFamilyMLModel *)self getModelWithModelName:v6];
  id v14 = 0;
  id v9 = [v8 predictionFromFeatures:v7 error:&v14];

  id v10 = v14;
  if (v10)
  {
    id v11 = +[_PSLogging familyRecommenderChannel];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[_PSFamilyMLModel getPredictionFromModel:withInputFeatures:]();
    }

    id v12 = 0;
  }
  else
  {
    id v12 = v9;
  }

  return v12;
}

- (NSDictionary)models
{
  return self->_models;
}

- (OS_xpc_object)activity
{
  return self->_activity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_models, 0);

  objc_storeStrong((id *)&self->_extractor, 0);
}

- (void)loadModelFromUrlResource:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v5 = [a1 absoluteString];
  OUTLINED_FUNCTION_0_1();
  uint64_t v7 = a2;
  _os_log_fault_impl(&dword_1A314B000, a3, OS_LOG_TYPE_FAULT, "Error loading compiled CoreML Model from path %@ : %@", v6, 0x16u);
}

- (void)defaultPredictionForInputFeatures:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A314B000, a2, OS_LOG_TYPE_ERROR, "Error while making prediction from features: %@", (uint8_t *)&v2, 0xCu);
}

- (void)ensemblePredictionForInputFeatures:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A314B000, a2, OS_LOG_TYPE_ERROR, "Error while preparing prediction result for ensemble modeling:  %@", (uint8_t *)&v2, 0xCu);
}

- (void)getPredictionFromModel:withInputFeatures:.cold.1()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_1();
  uint64_t v3 = v0;
  _os_log_error_impl(&dword_1A314B000, v1, OS_LOG_TYPE_ERROR, "Error while using %@ model to make prediction from features: %@", v2, 0x16u);
}

@end