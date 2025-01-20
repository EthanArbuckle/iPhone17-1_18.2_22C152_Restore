@interface _REMLMultipleWeightedModel
- (BOOL)loadModelFromURL:(id)a3 error:(id *)a4;
- (BOOL)saveModelToURL:(id)a3 error:(id *)a4;
- (NSDictionary)models;
- (_REMLMultipleWeightedModel)initWithFeature:(id)a3 featureSet:(id)a4 priorMean:(float)a5 biasFeature:(id)a6 modelVarianceEpsilon:(float)a7;
- (id)_modelForFeatureMap:(id)a3;
- (id)_modelForKey:(id)a3;
- (id)predictWithFeatures:(id)a3;
- (void)enumerateModels:(id)a3;
- (void)trainModelWithFeatureMap:(id)a3 positiveEvent:(id)a4;
@end

@implementation _REMLMultipleWeightedModel

- (_REMLMultipleWeightedModel)initWithFeature:(id)a3 featureSet:(id)a4 priorMean:(float)a5 biasFeature:(id)a6 modelVarianceEpsilon:(float)a7
{
  id v13 = a3;
  id v14 = a4;
  v20.receiver = self;
  v20.super_class = (Class)_REMLMultipleWeightedModel;
  v15 = [(_REMLWeightedModel *)&v20 initWithBiasFeature:a6];
  v16 = v15;
  if (v15)
  {
    v15->_priorMean = a5;
    objc_storeStrong((id *)&v15->_identificationFeature, a3);
    objc_storeStrong((id *)&v16->_featureSet, a4);
    v16->_varianceEpsilon = a7;
    uint64_t v17 = [MEMORY[0x263EFF9A0] dictionary];
    models = v16->_models;
    v16->_models = (NSMutableDictionary *)v17;

    v16->_lock._os_unfair_lock_opaque = 0;
  }

  return v16;
}

- (void)enumerateModels:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  models = self->_models;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __46___REMLMultipleWeightedModel_enumerateModels___block_invoke;
  v8[3] = &unk_2644BFC30;
  id v9 = v4;
  id v7 = v4;
  [(NSMutableDictionary *)models enumerateKeysAndObjectsUsingBlock:v8];
  os_unfair_lock_unlock(p_lock);
}

- (id)_modelForFeatureMap:(id)a3
{
  id v4 = REDescriptionForTaggedPointer([a3 valueForFeature:self->_identificationFeature]);
  v5 = [(_REMLMultipleWeightedModel *)self _modelForKey:v4];

  return v5;
}

- (id)_modelForKey:(id)a3
{
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->_models objectForKeyedSubscript:v4];
  if (!v5)
  {
    *(float *)&double v6 = self->_priorMean;
    *(float *)&double v7 = self->_varianceEpsilon;
    v5 = +[REMLModel modelWithFeatureSet:self->_featureSet priorMean:v6 modelVarianceEpsilon:v7];
    [(_REMLWeightedModel *)self _configureMode:v5];
    [(NSMutableDictionary *)self->_models setObject:v5 forKeyedSubscript:v4];
  }

  return v5;
}

- (void)trainModelWithFeatureMap:(id)a3 positiveEvent:(id)a4
{
  p_lock = &self->_lock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_lock(p_lock);
  id v9 = [(_REMLMultipleWeightedModel *)self _modelForFeatureMap:v8];
  [v9 trainWithFeatures:v8 positiveEvent:v7];

  os_unfair_lock_unlock(p_lock);
}

- (id)predictWithFeatures:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  double v6 = [(_REMLMultipleWeightedModel *)self _modelForFeatureMap:v5];
  id v7 = [v6 predictWithFeatures:v5];
  os_unfair_lock_unlock(p_lock);
  [(_REMLWeightedModel *)self _biasForFeatureSet:v5];
  int v9 = v8;

  LODWORD(v10) = v9;
  [v7 setBias:v10];

  return v7;
}

- (BOOL)saveModelToURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 1;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__24;
  v18 = __Block_byref_object_dispose__24;
  id v19 = 0;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __51___REMLMultipleWeightedModel_saveModelToURL_error___block_invoke;
  v10[3] = &unk_2644BFC58;
  v12 = &v20;
  id v7 = v6;
  id v11 = v7;
  id v13 = &v14;
  [(_REMLMultipleWeightedModel *)self enumerateModels:v10];
  if (a4) {
    *a4 = (id) v15[5];
  }
  char v8 = *((unsigned char *)v21 + 24);

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v8;
}

- (BOOL)loadModelFromURL:(id)a3 error:(id *)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = [MEMORY[0x263F08850] defaultManager];
  char v8 = [v6 path];
  int v9 = [v7 contentsOfDirectoryAtPath:v8 error:a4];

  id obj = v9;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        os_unfair_lock_lock(&self->_lock);
        v15 = [(_REMLMultipleWeightedModel *)self _modelForKey:v14];
        uint64_t v16 = [v6 URLByAppendingPathComponent:v14];
        uint64_t v17 = [v16 URLByAppendingPathComponent:@"model"];

        LODWORD(v16) = [v15 loadModelFromURL:v17 error:a4];
        os_unfair_lock_unlock(&self->_lock);

        if (!v16)
        {
          BOOL v18 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  BOOL v18 = 1;
LABEL_11:

  return v18;
}

- (NSDictionary)models
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = (void *)[(NSMutableDictionary *)self->_models copy];
  os_unfair_lock_unlock(p_lock);
  return (NSDictionary *)v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_models, 0);
  objc_storeStrong((id *)&self->_featureSet, 0);
  objc_storeStrong((id *)&self->_identificationFeature, 0);
}

@end