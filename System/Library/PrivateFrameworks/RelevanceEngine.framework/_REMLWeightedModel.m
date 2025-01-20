@interface _REMLWeightedModel
+ (id)weightedModelWithDescriptor:(id)a3 featureSet:(id)a4;
- (BOOL)_loadModel:(id)a3 fromURL:(id)a4 error:(id *)a5;
- (BOOL)loadModelFromURL:(id)a3 error:(id *)a4;
- (BOOL)saveModelToURL:(id)a3 error:(id *)a4;
- (REFeature)selectionFeature;
- (_REMLWeightedModel)initWithBiasFeature:(id)a3;
- (float)_biasForFeatureSet:(id)a3;
- (float)weight;
- (id)predictWithFeatures:(id)a3;
- (void)_configureMode:(id)a3;
@end

@implementation _REMLWeightedModel

+ (id)weightedModelWithDescriptor:(id)a3 featureSet:(id)a4
{
  v5 = (REInteractionDescriptor *)a3;
  id v6 = a4;
  v7 = [(REInteractionDescriptor *)v5 identificationFeature];

  if (v7)
  {
    v8 = [_REMLMultipleWeightedModel alloc];
    v9 = [(REInteractionDescriptor *)v5 identificationFeature];
    [(REInteractionDescriptor *)v5 initialProbability];
    int v11 = v10;
    v12 = [(REInteractionDescriptor *)v5 biasFeature];
    [(REInteractionDescriptor *)v5 varianceEpsilon];
    LODWORD(v14) = v13;
    LODWORD(v15) = v11;
    v16 = [(_REMLMultipleWeightedModel *)v8 initWithFeature:v9 featureSet:v6 priorMean:v12 biasFeature:v15 modelVarianceEpsilon:v14];

    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __61___REMLWeightedModel_weightedModelWithDescriptor_featureSet___block_invoke;
    v34[3] = &unk_2644BFBE0;
    v17 = (id *)&v35;
    v35 = v5;
    v18 = v34;
  }
  else
  {
    v19 = [_REMLSingleWeightedModel alloc];
    [(REInteractionDescriptor *)v5 initialProbability];
    int v21 = v20;
    v22 = [(REInteractionDescriptor *)v5 biasFeature];
    [(REInteractionDescriptor *)v5 varianceEpsilon];
    LODWORD(v24) = v23;
    LODWORD(v25) = v21;
    v16 = [(_REMLSingleWeightedModel *)v19 initWithFeatureSet:v6 priorMean:v22 biasFeature:v25 modelVarianceEpsilon:v24];

    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __61___REMLWeightedModel_weightedModelWithDescriptor_featureSet___block_invoke_2;
    v32[3] = &unk_2644BFBE0;
    v17 = (id *)&v33;
    v33 = v5;
    v18 = v32;
  }
  [(_REMLMultipleWeightedModel *)v16 enumerateModels:v18];

  descriptor = v16->super._descriptor;
  v16->super._descriptor = v5;
  v27 = v5;

  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __61___REMLWeightedModel_weightedModelWithDescriptor_featureSet___block_invoke_3;
  v30[3] = &unk_2644BFBE0;
  v28 = v16;
  v31 = v28;
  [(_REMLMultipleWeightedModel *)v28 enumerateModels:v30];

  return v28;
}

- (void)_configureMode:(id)a3
{
  descriptor = self->_descriptor;
  id v8 = a3;
  BOOL v5 = [(REInteractionDescriptor *)descriptor enableExploreExploit];
  [(REInteractionDescriptor *)self->_descriptor exploreBias];
  BOOL v7 = fabsf(v6) >= 0.00000011921 && v5;
  [v8 setAllowsExploreExploit:v7];
  [(REInteractionDescriptor *)self->_descriptor exploreBias];
  objc_msgSend(v8, "setExploreExploitModulator:");
  [(REInteractionDescriptor *)self->_descriptor trainingSimulationExploreBias];
  objc_msgSend(v8, "setSimulationExploreExploitModulator:");
  [v8 setWantsPredictionCache:0];
}

- (_REMLWeightedModel)initWithBiasFeature:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_REMLWeightedModel;
  float v6 = [(_REMLWeightedModel *)&v9 init];
  BOOL v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_biasFeature, a3);
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biasFeature, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
}

- (BOOL)_loadModel:(id)a3 fromURL:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  unsigned __int8 v15 = 0;
  objc_super v9 = [MEMORY[0x263F08850] defaultManager];
  int v10 = [v8 path];
  int v11 = [v9 fileExistsAtPath:v10 isDirectory:&v15];

  char v12 = 0;
  if (v11)
  {
    int v13 = v15;
    if (v13 == [v7 requiresDirectory]) {
      char v12 = [v7 loadModelFromURL:v8 error:a5];
    }
    else {
      char v12 = 0;
    }
  }

  return v12;
}

- (float)_biasForFeatureSet:(id)a3
{
  biasFeature = self->_biasFeature;
  if (!biasFeature) {
    return 0.0;
  }
  v4 = [a3 featureValueForFeature:biasFeature];
  [v4 doubleValue];
  float v6 = v5;

  return v6;
}

- (float)weight
{
  [(REInteractionDescriptor *)self->_descriptor weight];
  return result;
}

- (REFeature)selectionFeature
{
  return [(REInteractionDescriptor *)self->_descriptor selectionFeature];
}

- (id)predictWithFeatures:(id)a3
{
  return 0;
}

- (BOOL)saveModelToURL:(id)a3 error:(id *)a4
{
  return 0;
}

- (BOOL)loadModelFromURL:(id)a3 error:(id *)a4
{
  return 0;
}

@end