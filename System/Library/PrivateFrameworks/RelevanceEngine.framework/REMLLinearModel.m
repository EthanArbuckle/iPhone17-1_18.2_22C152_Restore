@interface REMLLinearModel
- (BOOL)_loadModelFromURL:(id)a3 error:(id *)a4;
- (BOOL)_saveModelToURL:(id)a3 error:(id *)a4;
- (BOOL)requiresDirectory;
- (NSDictionary)models;
- (REMLLinearModel)initWithFeatureSet:(id)a3 interactionDescriptors:(id)a4;
- (float)_getAveragePrediction;
- (float)_getNormalizedEntropy;
- (id)_predictWithFeatures:(id)a3;
- (id)predictionSetWithFeatures:(id)a3;
- (int64_t)_getNumberOfCoordinates;
- (unint64_t)_getTotalExampleCount;
- (unint64_t)_getTotalPositiveCount;
- (void)_clearCache;
- (void)_clearModel;
- (void)_enumerateModelsForFeatureMap:(id)a3 usingBlock:(id)a4;
- (void)logCoreAnalyticsMetrics;
- (void)setMetricsRecorder:(id)a3;
- (void)trainWithFeatures:(id)a3 positiveEvent:(id)a4 interaction:(id)a5;
@end

@implementation REMLLinearModel

- (REMLLinearModel)initWithFeatureSet:(id)a3 interactionDescriptors:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)REMLLinearModel;
  v8 = [(REMLModel *)&v26 initWithFeatureSet:v6 priorMean:0.0 modelVarianceEpsilon:0.0];
  if (v8)
  {
    v9 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v21 = v7;
    id v10 = v7;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v23 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          v16 = +[_REMLWeightedModel weightedModelWithDescriptor:v15 featureSet:v6];
          v17 = [v15 name];
          [v9 setObject:v16 forKeyedSubscript:v17];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v12);
    }

    uint64_t v18 = [v9 copy];
    models = v8->_models;
    v8->_models = (NSDictionary *)v18;

    id v7 = v21;
  }

  return v8;
}

- (void).cxx_destruct
{
}

void __43__REMLLinearModel__loadModelFromURL_error___block_invoke(void *a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v7 = (void *)a1[4];
  id v8 = a3;
  v9 = [v7 URLByAppendingPathComponent:a2];
  uint64_t v10 = *(void *)(a1[5] + 8);
  id obj = *(id *)(v10 + 40);
  char v11 = [v8 loadModelFromURL:v9 error:&obj];

  objc_storeStrong((id *)(v10 + 40), obj);
  if ((v11 & 1) == 0)
  {
    *a4 = 1;
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
  }
}

uint64_t __38__REMLLinearModel_setMetricsRecorder___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setMetricsRecorder:*(void *)(a1 + 32)];
}

void __38__REMLLinearModel_setMetricsRecorder___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __38__REMLLinearModel_setMetricsRecorder___block_invoke_2;
  v4[3] = &unk_2644BFBE0;
  id v5 = *(id *)(a1 + 32);
  [a3 enumerateModels:v4];
}

- (void)setMetricsRecorder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMLLinearModel;
  [(REMLModel *)&v9 setMetricsRecorder:v4];
  models = self->_models;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __38__REMLLinearModel_setMetricsRecorder___block_invoke;
  v7[3] = &unk_2644BFC08;
  id v8 = v4;
  id v6 = v4;
  [(NSDictionary *)models enumerateKeysAndObjectsUsingBlock:v7];
}

- (BOOL)requiresDirectory
{
  return 1;
}

- (BOOL)_loadModelFromURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v21 = 0;
  long long v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 1;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__24;
  v19 = __Block_byref_object_dispose__24;
  id v20 = 0;
  models = self->_models;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __43__REMLLinearModel__loadModelFromURL_error___block_invoke;
  v11[3] = &unk_2644BFB70;
  id v8 = v6;
  id v12 = v8;
  uint64_t v13 = &v15;
  v14 = &v21;
  [(NSDictionary *)models enumerateKeysAndObjectsUsingBlock:v11];
  if (a4) {
    *a4 = (id) v16[5];
  }
  char v9 = *((unsigned char *)v22 + 24);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

- (void)trainWithFeatures:(id)a3 positiveEvent:(id)a4 interaction:(id)a5
{
  v12.receiver = self;
  v12.super_class = (Class)REMLLinearModel;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [(REMLModel *)&v12 trainWithFeatures:v10 positiveEvent:v9];
  char v11 = -[NSDictionary objectForKeyedSubscript:](self->_models, "objectForKeyedSubscript:", v8, v12.receiver, v12.super_class);

  [v11 trainModelWithFeatureMap:v10 positiveEvent:v9];
}

- (void)_clearCache
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v12.receiver = self;
  v12.super_class = (Class)REMLLinearModel;
  [(REMLModel *)&v12 _clearCache];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v3 = [(NSDictionary *)self->_models allValues];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) enumerateModels:&__block_literal_global_54];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
    }
    while (v5);
  }
}

uint64_t __30__REMLLinearModel__clearCache__block_invoke(uint64_t a1, void *a2)
{
  return [a2 _clearCache];
}

- (void)_enumerateModelsForFeatureMap:(id)a3 usingBlock:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (char *)a4;
  if (v7)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id obj = self->_models;
    uint64_t v8 = [(NSDictionary *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v18;
      uint64_t v15 = v7 + 16;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          uint64_t v13 = -[NSDictionary objectForKeyedSubscript:](self->_models, "objectForKeyedSubscript:", v12, v15);
          uint64_t v14 = [v13 selectionFeature];
          if (!v14
            || [v6 hasValueForFeature:v14]
            && REBooleanValueForTaggedPointer([v6 valueForFeature:v14]))
          {
            (*((void (**)(char *, uint64_t, void *))v7 + 2))(v7, v12, v13);
          }
        }
        uint64_t v9 = [(NSDictionary *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v9);
    }
  }
}

- (id)predictionSetWithFeatures:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", -[NSDictionary count](self->_models, "count"));
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __45__REMLLinearModel_predictionSetWithFeatures___block_invoke;
  v16 = &unk_2644BFB20;
  id v17 = v5;
  id v18 = v4;
  id v6 = v4;
  id v7 = v5;
  [(REMLLinearModel *)self _enumerateModelsForFeatureMap:v6 usingBlock:&v13];
  uint64_t v8 = [REMLPredictionSet alloc];
  uint64_t v9 = -[REMLModel predictWithFeatures:](self, "predictWithFeatures:", v6, v13, v14, v15, v16);
  uint64_t v10 = (void *)[v7 copy];
  long long v11 = [(REMLPredictionSet *)v8 initWithPrediction:v9 predictionMap:v10];

  return v11;
}

void __45__REMLLinearModel_predictionSetWithFeatures___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = a2;
  id v7 = [a3 predictWithFeatures:v5];
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v6];
}

- (id)_predictWithFeatures:(id)a3
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v52 = 0;
  v53 = (float *)&v52;
  uint64_t v54 = 0x2020000000;
  int v55 = 0;
  uint64_t v48 = 0;
  v49 = (float *)&v48;
  uint64_t v50 = 0x2020000000;
  int v51 = 0;
  uint64_t v44 = 0;
  v45 = (float *)&v44;
  uint64_t v46 = 0x2020000000;
  int v47 = 0;
  uint64_t v40 = 0;
  v41 = (float *)&v40;
  uint64_t v42 = 0x2020000000;
  int v43 = 0;
  uint64_t v36 = 0;
  v37 = (float *)&v36;
  uint64_t v38 = 0x2020000000;
  int v39 = 0;
  int v5 = REMLExplanationsEnabled();
  char v6 = v5;
  if (v5)
  {
    id v7 = [MEMORY[0x263EFF9C0] set];
  }
  else
  {
    id v7 = 0;
  }
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __40__REMLLinearModel__predictWithFeatures___block_invoke;
  v27[3] = &unk_2644BFB48;
  id v8 = v4;
  id v28 = v8;
  char v35 = v6;
  id v9 = v7;
  id v29 = v9;
  v30 = &v36;
  v31 = &v52;
  v32 = &v48;
  v33 = &v44;
  v34 = &v40;
  [(REMLLinearModel *)self _enumerateModelsForFeatureMap:v8 usingBlock:v27];
  uint64_t v10 = v37;
  long long v11 = v53;
  v53[6] = v53[6] / v37[6];
  uint64_t v12 = v49;
  v49[6] = v49[6] / v10[6];
  uint64_t v13 = v45;
  v45[6] = v45[6] / v10[6];
  v41[6] = v41[6] / v10[6];
  *(float *)&double v14 = v13[6];
  *(float *)&double v15 = v11[6];
  *(float *)&double v16 = v12[6];
  id v17 = +[REMLPrediction predictionWithProbability:mean:variance:pessimistic:](REMLPrediction, "predictionWithProbability:mean:variance:pessimistic:", v14, v15, v16);
  if (REMLExplanationsEnabled())
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v18 = v9;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v23 objects:v56 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v24 != v20) {
            objc_enumerationMutation(v18);
          }
          objc_msgSend(v17, "addExplanation:", *(void *)(*((void *)&v23 + 1) + 8 * i), (void)v23);
        }
        uint64_t v19 = [v18 countByEnumeratingWithState:&v23 objects:v56 count:16];
      }
      while (v19);
    }
  }
  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(&v52, 8);

  return v17;
}

void __40__REMLLinearModel__predictWithFeatures___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v18 = a3;
  id v4 = [v18 predictWithFeatures:*(void *)(a1 + 32)];
  int v5 = v4;
  if (*(unsigned char *)(a1 + 88))
  {
    char v6 = *(void **)(a1 + 40);
    id v7 = [v4 explanations];
    [v6 unionSet:v7];
  }
  [v18 weight];
  float v9 = v8;
  *(float *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v8
                                                             + *(float *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  [v5 probability];
  float v11 = v10;
  [v5 bias];
  *(float *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = *(float *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)
                                                             + (float)(v9 * (float)(v11 + v12));
  [v5 variance];
  *(float *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = *(float *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)
                                                             + (float)(v9 * v13);
  [v5 probability];
  float v15 = v14;
  [v5 bias];
  *(float *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = *(float *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)
                                                             + (float)(v9 * (float)(v15 + v16));
  [v5 pessimistic];
  *(float *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = *(float *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)
                                                             + (float)(v9 * v17);
}

- (BOOL)_saveModelToURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 1;
  uint64_t v15 = 0;
  float v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__24;
  uint64_t v19 = __Block_byref_object_dispose__24;
  id v20 = 0;
  models = self->_models;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __41__REMLLinearModel__saveModelToURL_error___block_invoke;
  v11[3] = &unk_2644BFB70;
  id v8 = v6;
  id v12 = v8;
  float v13 = &v15;
  float v14 = &v21;
  [(NSDictionary *)models enumerateKeysAndObjectsUsingBlock:v11];
  if (a4) {
    *a4 = (id) v16[5];
  }
  char v9 = *((unsigned char *)v22 + 24);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

void __41__REMLLinearModel__saveModelToURL_error___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v7 = a3;
  id v8 = [*(id *)(a1 + 32) URLByAppendingPathComponent:a2];
  char v9 = [MEMORY[0x263F08850] defaultManager];
  float v10 = [v8 path];
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v11 + 40);
  int v12 = [v9 createDirectoryAtPath:v10 withIntermediateDirectories:1 attributes:0 error:&obj];
  objc_storeStrong((id *)(v11 + 40), obj);

  if (!v12) {
    goto LABEL_3;
  }
  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
  float v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = 0;

  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  id v17 = *(id *)(v15 + 40);
  char v16 = [v7 saveModelToURL:v8 error:&v17];
  objc_storeStrong((id *)(v15 + 40), v17);
  if ((v16 & 1) == 0)
  {
LABEL_3:
    *a4 = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
}

- (void)_clearModel
{
}

uint64_t __30__REMLLinearModel__clearModel__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 enumerateModels:&__block_literal_global_16_1];
}

uint64_t __30__REMLLinearModel__clearModel__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 _clearModel];
}

- (float)_getAveragePrediction
{
  uint64_t v7 = 0;
  id v8 = (float *)&v7;
  uint64_t v9 = 0x2020000000;
  int v10 = 0;
  v2 = [(NSDictionary *)self->_models allValues];
  v3 = [v2 firstObject];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __40__REMLLinearModel__getAveragePrediction__block_invoke;
  v6[3] = &unk_2644BFBB8;
  v6[4] = &v7;
  [v3 enumerateModels:v6];

  float v4 = v8[6];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __40__REMLLinearModel__getAveragePrediction__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 _getAveragePrediction];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v4;
  return result;
}

- (float)_getNormalizedEntropy
{
  uint64_t v7 = 0;
  id v8 = (float *)&v7;
  uint64_t v9 = 0x2020000000;
  int v10 = 0;
  v2 = [(NSDictionary *)self->_models allValues];
  v3 = [v2 firstObject];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __40__REMLLinearModel__getNormalizedEntropy__block_invoke;
  v6[3] = &unk_2644BFBB8;
  v6[4] = &v7;
  [v3 enumerateModels:v6];

  float v4 = v8[6];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __40__REMLLinearModel__getNormalizedEntropy__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 _getNormalizedEntropy];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v4;
  return result;
}

- (int64_t)_getNumberOfCoordinates
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  v2 = [(NSDictionary *)self->_models allValues];
  v3 = [v2 firstObject];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __42__REMLLinearModel__getNumberOfCoordinates__block_invoke;
  v6[3] = &unk_2644BFBB8;
  v6[4] = &v7;
  [v3 enumerateModels:v6];

  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __42__REMLLinearModel__getNumberOfCoordinates__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 _getNumberOfCoordinates];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (unint64_t)_getTotalExampleCount
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  v2 = [(NSDictionary *)self->_models allValues];
  v3 = [v2 firstObject];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __40__REMLLinearModel__getTotalExampleCount__block_invoke;
  v6[3] = &unk_2644BFBB8;
  v6[4] = &v7;
  [v3 enumerateModels:v6];

  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __40__REMLLinearModel__getTotalExampleCount__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 _getTotalExampleCount];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (unint64_t)_getTotalPositiveCount
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  v2 = [(NSDictionary *)self->_models allValues];
  v3 = [v2 firstObject];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __41__REMLLinearModel__getTotalPositiveCount__block_invoke;
  v6[3] = &unk_2644BFBB8;
  v6[4] = &v7;
  [v3 enumerateModels:v6];

  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __41__REMLLinearModel__getTotalPositiveCount__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 _getTotalPositiveCount];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (void)logCoreAnalyticsMetrics
{
}

uint64_t __42__REMLLinearModel_logCoreAnalyticsMetrics__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 enumerateModels:&__block_literal_global_20];
}

uint64_t __42__REMLLinearModel_logCoreAnalyticsMetrics__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 logCoreAnalyticsMetrics];
}

- (NSDictionary)models
{
  return self->_models;
}

@end