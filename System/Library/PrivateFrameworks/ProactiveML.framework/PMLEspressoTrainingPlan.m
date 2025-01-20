@interface PMLEspressoTrainingPlan
+ (BOOL)isValidGradient:(id)a3 error:(id *)a4;
+ (id)_calculateGradientInPlaceForTask:(id)a3 startingParameters:(id)a4 globalNames:(id)a5 weightNames:(id)a6 biasNames:(id)a7;
+ (id)_calculateTrainingMetricsWithSamplingProb:(double)a3 groundTruthProvider:(id)a4 predictionsProvider:(id)a5 trueLabelName:(id)a6 trainingOutputName:(id)a7 lossValueName:(id)a8 probThreshold:(double)a9 includeSummableOnly:(BOOL)a10;
+ (id)_getModelParametersForTask:(id)a3 globalNames:(id)a4 weightNames:(id)a5 biasNames:(id)a6 error:(id *)a7;
+ (id)_iterateModelParametersForTask:(id)a3 globalNames:(id)a4 weightNames:(id)a5 biasNames:(id)a6 block:(id)a7;
+ (int)argmax:(id)a3;
+ (unint64_t)numberOfParametersInTensor:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToEspressoTrainingPlan:(id)a3;
- (NSString)description;
- (NSString)planId;
- (PMLEspressoTrainingPlan)initWithMetaTrainingVariables:(id)a3 espressoTrainingVariables:(id)a4;
- (PMLEspressoTrainingPlan)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5;
- (id)_newTaskForTraining;
- (id)_updateResultsReferenceCallback:(id)a3;
- (id)runWithError:(id *)a3;
- (id)toPlistWithChunks:(id)a3;
@end

@implementation PMLEspressoTrainingPlan

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groundTruth, 0);
  objc_storeStrong((id *)&self->_trainingPredictions, 0);
  objc_storeStrong((id *)&self->_etv, 0);
  objc_storeStrong((id *)&self->_mtv, 0);
  objc_storeStrong((id *)&self->_taskDefinition, 0);
  objc_storeStrong((id *)&self->_planId, 0);
}

- (NSString)planId
{
  return self->_planId;
}

- (id)toPlistWithChunks:(id)a3
{
  v11[2] = *MEMORY[0x263EF8340];
  v10[0] = @"META_TRAINING_VARIABLES";
  mtv = self->_mtv;
  id v5 = a3;
  v6 = [(PMLMetaTrainingVariables *)mtv toPlistWithChunks:v5];
  v10[1] = @"ESPRESSO_TRAINING_VARIABLES";
  v11[0] = v6;
  v7 = [(PMLEspressoTrainingVariables *)self->_etv toPlistWithChunks:v5];

  v11[1] = v7;
  v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];

  return v8;
}

- (PMLEspressoTrainingPlan)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [PMLMetaTrainingVariables alloc];
  v12 = [v8 objectForKeyedSubscript:@"META_TRAINING_VARIABLES"];
  v13 = [(PMLMetaTrainingVariables *)v11 initWithPlist:v12 chunks:v9 context:v10];

  if (!v13)
  {
    v16 = PML_LogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_2212A0000, v16, OS_LOG_TYPE_ERROR, "Unable to init PMLEspressoTrainingPlan because unable to init PMLMetaTrainingVariables", buf, 2u);
    }
    goto LABEL_9;
  }
  v14 = [PMLEspressoTrainingVariables alloc];
  v15 = [v8 objectForKeyedSubscript:@"ESPRESSO_TRAINING_VARIABLES"];
  v16 = [(PMLEspressoTrainingVariables *)v14 initWithPlist:v15 chunks:v9 context:v10];

  if (!v16)
  {
    v18 = PML_LogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v20 = 0;
      _os_log_error_impl(&dword_2212A0000, v18, OS_LOG_TYPE_ERROR, "Unable to init PMLEspressoTrainingPlan because unable to init PMLEspressoTrainingVariables", v20, 2u);
    }

    v16 = 0;
LABEL_9:
    v17 = 0;
    goto LABEL_10;
  }
  self = [(PMLEspressoTrainingPlan *)self initWithMetaTrainingVariables:v13 espressoTrainingVariables:v16];
  v17 = self;
LABEL_10:

  return v17;
}

- (NSString)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<PMLEspressoTrainingPlan '%@'>", self->_planId];
  return (NSString *)v2;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PMLEspressoTrainingPlan *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PMLEspressoTrainingPlan *)self isEqualToEspressoTrainingPlan:v5];

  return v6;
}

- (BOOL)isEqualToEspressoTrainingPlan:(id)a3
{
  v4 = a3;
  planId = self->_planId;
  BOOL v6 = [v4 planId];
  BOOL v7 = [(NSString *)planId isEqual:v6]
    && [(PMLMetaTrainingVariables *)self->_mtv isEqualToMetaTrainingVariables:v4[3]]
    && [(PMLEspressoTrainingVariables *)self->_etv isEqualToEspressoTrainingVariables:v4[4]];

  return v7;
}

- (id)_updateResultsReferenceCallback:(id)a3
{
  objc_storeStrong((id *)&self->_groundTruth, a3);
  id v5 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __59__PMLEspressoTrainingPlan__updateResultsReferenceCallback___block_invoke;
  v8[3] = &unk_26459F3D8;
  v8[4] = self;
  BOOL v6 = (void *)MEMORY[0x223C7E7E0](v8);

  return v6;
}

uint64_t __59__PMLEspressoTrainingPlan__updateResultsReferenceCallback___block_invoke(uint64_t a1, int a2, id obj)
{
  return 1;
}

- (id)runWithError:(id *)a3
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  uint64_t v59 = 0;
  v60 = &v59;
  uint64_t v61 = 0x3032000000;
  v62 = __Block_byref_object_copy__2942;
  v63 = __Block_byref_object_dispose__2943;
  id v64 = 0;
  id v5 = objc_opt_class();
  taskDefinition = self->_taskDefinition;
  BOOL v7 = [(PMLEspressoTrainingVariables *)self->_etv globalsToGetGradientsFor];
  id v8 = [(PMLEspressoTrainingVariables *)self->_etv layerWeightsToGetGradientsFor];
  id v9 = [(PMLEspressoTrainingVariables *)self->_etv layerBiasesToGetGradientsFor];
  id v10 = (id *)(v60 + 5);
  id obj = (id)v60[5];
  v11 = [v5 _getModelParametersForTask:taskDefinition globalNames:v7 weightNames:v8 biasNames:v9 error:&obj];
  objc_storeStrong(v10, obj);

  if (v11)
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v72 = 0x2020000000;
    uint64_t v73 = 0;
    v57[0] = 0;
    v57[1] = v57;
    v57[2] = 0x2020000000;
    v57[3] = 0;
    v12 = [(PMLMetaTrainingVariables *)self->_mtv store];
    v13 = [(PMLMetaTrainingVariables *)self->_mtv sessionDescriptor];
    +[PMLTrainingStore lastUsedTimestampLimit];
    double v15 = v14;
    v16 = [(PMLMetaTrainingVariables *)self->_mtv labelsToTrainOn];
    unint64_t v17 = [(PMLMetaTrainingVariables *)self->_mtv trainingSetSize];
    v56[0] = MEMORY[0x263EF8330];
    v56[1] = 3221225472;
    v56[2] = __40__PMLEspressoTrainingPlan_runWithError___block_invoke;
    v56[3] = &unk_26459F338;
    v56[4] = self;
    v56[5] = &buf;
    v56[6] = &v59;
    v56[7] = v57;
    [v12 loadDataForModel:v13 privacyBudgetRefreshPeriod:v16 labels:v17 batchSize:v56 block:v15];

    if (!*(void *)(*((void *)&buf + 1) + 24))
    {
      v21 = PML_LogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v69 = 0;
        _os_log_error_impl(&dword_2212A0000, v21, OS_LOG_TYPE_ERROR, "Returning nil since no training was done", v69, 2u);
      }

      goto LABEL_15;
    }
    if (v60[5])
    {
      v18 = PML_LogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v69 = 0;
        _os_log_error_impl(&dword_2212A0000, v18, OS_LOG_TYPE_ERROR, "Returning nil and early from training since an error occurred during training", v69, 2u);
      }

      if (a3)
      {
LABEL_20:
        v20 = 0;
        *a3 = (id) v60[5];
        goto LABEL_36;
      }
LABEL_15:
      v20 = 0;
LABEL_36:
      _Block_object_dispose(v57, 8);
      _Block_object_dispose(&buf, 8);
      goto LABEL_37;
    }
    v22 = objc_opt_class();
    v23 = self->_taskDefinition;
    v24 = [(PMLEspressoTrainingVariables *)self->_etv globalsToGetGradientsFor];
    v25 = [(PMLEspressoTrainingVariables *)self->_etv layerWeightsToGetGradientsFor];
    v26 = [(PMLEspressoTrainingVariables *)self->_etv layerBiasesToGetGradientsFor];
    uint64_t v27 = [v22 _calculateGradientInPlaceForTask:v23 startingParameters:v11 globalNames:v24 weightNames:v25 biasNames:v26];
    v28 = (void *)v60[5];
    v60[5] = v27;

    if (v60[5])
    {
      v29 = PML_LogHandle();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        uint64_t v51 = v60[5];
        *(_DWORD *)v69 = 138412290;
        uint64_t v70 = v51;
        _os_log_error_impl(&dword_2212A0000, v29, OS_LOG_TYPE_ERROR, "Returning nil since an error occurred when calculating the gradient: %@", v69, 0xCu);
      }

      if (a3) {
        goto LABEL_20;
      }
      goto LABEL_15;
    }
    v30 = [[PMLMutableDenseVector alloc] initWithMutableData:v11];
    if (!+[PMLEspressoTrainingPlan isValidGradient:v30 error:a3])goto LABEL_34; {
    *(_DWORD *)v69 = 1065353216;
    }
    v31 = [(PMLMetaTrainingVariables *)self->_mtv noiseStrategy];
    char v32 = objc_msgSend(v31, "scaleAndAddNoiseToDenseVector:usingNorm:scaleFactor:", v30, -[PMLMetaTrainingVariables reportScale](self->_mtv, "reportScale"), v69);

    if (v32)
    {
      v33 = [(PMLMetaTrainingVariables *)self->_mtv planId];
      v54 = +[PMLPlanDescriptor descriptorFromPlanId:v33];

      v20 = objc_opt_new();
      v67[0] = @"plan";
      v65[0] = @"name";
      v52 = [v54 name];
      v66[0] = v52;
      v65[1] = @"version";
      v34 = [v54 version];
      v66[1] = v34;
      v65[2] = @"locale";
      v35 = [v54 locale];
      v66[2] = v35;
      v36 = [NSDictionary dictionaryWithObjects:v66 forKeys:v65 count:3];
      v68[0] = v36;
      v67[1] = @"gradient";
      v37 = [(PMLDenseVector *)v30 data];
      v68[1] = v37;
      v67[2] = @"serverIteration";
      v38 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PMLMetaTrainingVariables currentServerIteration](self->_mtv, "currentServerIteration"));
      v68[2] = v38;
      v39 = [NSDictionary dictionaryWithObjects:v68 forKeys:v67 count:3];
      [v20 addEntriesFromDictionary:v39];

      BOOL v53 = [(PMLMetaTrainingVariables *)self->_mtv summableMetricsOnly];
      if ([MEMORY[0x263F61E28] isInternalBuild]) {
        double v40 = 1.0;
      }
      else {
        double v40 = 0.01;
      }
      trainingPredictions = self->_trainingPredictions;
      groundTruth = self->_groundTruth;
      v43 = [(PMLEspressoTrainingVariables *)self->_etv trueLabelName];
      v44 = [(PMLEspressoTrainingVariables *)self->_etv trainingOutputName];
      v45 = [(PMLEspressoTrainingVariables *)self->_etv lossValueName];
      [(PMLMetaTrainingVariables *)self->_mtv probThreshold];
      v47 = +[PMLEspressoTrainingPlan _calculateTrainingMetricsWithSamplingProb:groundTruth groundTruthProvider:trainingPredictions predictionsProvider:v43 trueLabelName:v44 trainingOutputName:v45 lossValueName:v53 probThreshold:v40 includeSummableOnly:v46];

      if (v47) {
        [v20 addEntriesFromDictionary:v47];
      }

      goto LABEL_35;
    }
    v49 = PML_LogHandle();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v55 = 0;
      _os_log_error_impl(&dword_2212A0000, v49, OS_LOG_TYPE_ERROR, "scaleAndAddNoiseToDenseVector failed", v55, 2u);
    }

    if (a3)
    {
      [MEMORY[0x263F087E8] errorWithDomain:@"ProactiveMLErrorDomain" code:7 userInfo:0];
      v20 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
LABEL_34:
      v20 = 0;
    }
LABEL_35:

    goto LABEL_36;
  }
  v19 = PML_LogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    uint64_t v48 = v60[5];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v48;
    _os_log_error_impl(&dword_2212A0000, v19, OS_LOG_TYPE_ERROR, "Returning nil since unable to snapshot starting model parameters: %@", (uint8_t *)&buf, 0xCu);
  }

  v20 = 0;
  if (a3) {
    *a3 = (id) v60[5];
  }
LABEL_37:

  _Block_object_dispose(&v59, 8);
  return v20;
}

void __40__PMLEspressoTrainingPlan_runWithError___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, unsigned char *a5)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  if ([v8 count])
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    id v10 = [PMLEspressoDataProvider alloc];
    v11 = [*(id *)(*(void *)(a1 + 32) + 32) inputName];
    uint64_t v12 = [*(id *)(*(void *)(a1 + 32) + 32) inputDim];
    v13 = [*(id *)(*(void *)(a1 + 32) + 32) trueLabelName];
    double v14 = [(PMLEspressoDataProvider *)v10 initWithRowsData:v8 labelsData:v9 inputName:v11 inputDim:v12 trueLabelName:v13];

    if (v14)
    {
      uint64_t v15 = *(void *)(a1 + 32);
      v16 = *(void **)(v15 + 16);
      uint64_t v17 = [*(id *)(v15 + 24) epochsPerBatch];
      uint64_t v30 = *MEMORY[0x263F3B758];
      v18 = [*(id *)(a1 + 32) _updateResultsReferenceCallback:v14];
      v31 = v18;
      v19 = [NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
      uint64_t v20 = *(void *)(*(void *)(a1 + 48) + 8);
      id obj = *(id *)(v20 + 40);
      LODWORD(v16) = [v16 doTrainingOnData:v14 forNumberOfEpochs:v17 withCallback:v19 error:&obj];
      objc_storeStrong((id *)(v20 + 40), obj);

      if (v16 && !*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
      {
        *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) += [v8 count];
        unint64_t v28 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
        if (v28 < [*(id *)(*(void *)(a1 + 32) + 24) maxSessionsToTrainOn]) {
          goto LABEL_12;
        }
        goto LABEL_11;
      }
      v21 = PML_LogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = *(__CFString **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        *(_DWORD *)long long buf = 138412290;
        v35 = v22;
        _os_log_error_impl(&dword_2212A0000, v21, OS_LOG_TYPE_ERROR, "Training was unsuccessful: %@", buf, 0xCu);
      }
    }
    else
    {
      v23 = PML_LogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        v35 = @"Unable to convert session batch data into espresso data provider";
        _os_log_error_impl(&dword_2212A0000, v23, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }

      v24 = (void *)MEMORY[0x263F087E8];
      uint64_t v32 = *MEMORY[0x263F08320];
      v33 = @"Unable to convert session batch data into espresso data provider";
      v21 = [NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
      uint64_t v25 = [v24 errorWithDomain:@"ProactiveMLErrorDomain" code:200 userInfo:v21];
      uint64_t v26 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v27 = *(void **)(v26 + 40);
      *(void *)(v26 + 40) = v25;
    }
LABEL_11:
    *a5 = 1;
LABEL_12:
  }
}

- (id)_newTaskForTraining
{
  v31[1] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F3B778]);
  uint64_t v20 = [(PMLEspressoTrainingVariables *)self->_etv trainingNetworkPath];
  v23 = [(PMLEspressoTrainingVariables *)self->_etv inputName];
  v31[0] = v23;
  uint64_t v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:1];
  v22 = [(PMLEspressoTrainingVariables *)self->_etv outputName];
  uint64_t v30 = v22;
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v30 count:1];
  v21 = [(PMLEspressoTrainingVariables *)self->_etv inputName];
  v29[0] = v21;
  v19 = [(PMLEspressoTrainingVariables *)self->_etv trueLabelName];
  v29[1] = v19;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:2];
  id v5 = [(PMLEspressoTrainingVariables *)self->_etv lossValueName];
  v28[0] = v5;
  BOOL v6 = [(PMLEspressoTrainingVariables *)self->_etv trainingOutputName];
  v28[1] = v6;
  BOOL v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:2];
  id v8 = [(PMLEspressoTrainingVariables *)self->_etv trainingControlVariableName];
  id v9 = [(PMLEspressoTrainingVariables *)self->_etv initializerName];
  id v25 = 0;
  id v10 = (void *)[v3 initWithTrainingNetworkPath:v20 inferenceInputs:v17 inferenceOutputs:v18 trainingInputs:v4 trainingOutputs:v7 trainingControlVariableName:v8 withInitializer:v9 error:&v25];
  id v11 = v25;

  if (!v10 || v11)
  {
    uint64_t v12 = PML_LogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v27 = v11;
      _os_log_error_impl(&dword_2212A0000, v12, OS_LOG_TYPE_ERROR, "Unable to successfully initialize model: %@", buf, 0xCu);
    }
    goto LABEL_11;
  }
  id v24 = 0;
  uint64_t v12 = [objc_alloc(MEMORY[0x263F3B790]) initWithTrainingModelDefinition:v10 forPlatform:1 error:&v24];
  id v13 = v24;
  id v11 = v13;
  if (!v12 || v13)
  {
    uint64_t v15 = PML_LogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v27 = v11;
      _os_log_error_impl(&dword_2212A0000, v15, OS_LOG_TYPE_ERROR, "Unable to create task definition: %@", buf, 0xCu);
    }

LABEL_11:
    double v14 = 0;
    goto LABEL_12;
  }
  uint64_t v12 = v12;
  double v14 = v12;
LABEL_12:

  return v14;
}

- (PMLEspressoTrainingPlan)initWithMetaTrainingVariables:(id)a3 espressoTrainingVariables:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v26.receiver = self;
  v26.super_class = (Class)PMLEspressoTrainingPlan;
  id v9 = [(PMLEspressoTrainingPlan *)&v26 init];
  if (!v9) {
    goto LABEL_12;
  }
  uint64_t v10 = [v7 planId];
  planId = v9->_planId;
  v9->_planId = (NSString *)v10;

  objc_storeStrong((id *)&v9->_mtv, a3);
  objc_storeStrong((id *)&v9->_etv, a4);
  uint64_t v12 = [(PMLEspressoTrainingPlan *)v9 _newTaskForTraining];
  taskDefinition = v9->_taskDefinition;
  v9->_taskDefinition = (ETTaskDefinition *)v12;

  if (!v9->_taskDefinition)
  {
    v22 = PML_LogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_2212A0000, v22, OS_LOG_TYPE_ERROR, "Unable to create task definition, returning nil for PMLEspressoTrainingPlan", buf, 2u);
    }

    goto LABEL_10;
  }
  double v14 = (void *)MEMORY[0x223C7E5C0]();
  uint64_t v15 = v9->_taskDefinition;
  v16 = [(PMLEspressoTrainingVariables *)v9->_etv globalsToGetGradientsFor];
  uint64_t v17 = [(PMLEspressoTrainingVariables *)v9->_etv layerWeightsToGetGradientsFor];
  v18 = [(PMLEspressoTrainingVariables *)v9->_etv layerBiasesToGetGradientsFor];
  id v25 = 0;
  id v19 = +[PMLEspressoTrainingPlan _getModelParametersForTask:v15 globalNames:v16 weightNames:v17 biasNames:v18 error:&v25];
  id v20 = v25;

  if (!v20)
  {
LABEL_12:
    v23 = v9;
    goto LABEL_13;
  }
  v21 = PML_LogHandle();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138412290;
    id v28 = v20;
    _os_log_error_impl(&dword_2212A0000, v21, OS_LOG_TYPE_ERROR, "Unable to fetch parameters requested in weights and biases during validation, returning nil for PMLEspressoTrainingPlan: %@", buf, 0xCu);
  }

LABEL_10:
  v23 = 0;
LABEL_13:

  return v23;
}

+ (id)_calculateTrainingMetricsWithSamplingProb:(double)a3 groundTruthProvider:(id)a4 predictionsProvider:(id)a5 trueLabelName:(id)a6 trainingOutputName:(id)a7 lossValueName:(id)a8 probThreshold:(double)a9 includeSummableOnly:(BOOL)a10
{
  v125[1] = *MEMORY[0x263EF8340];
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  if (a3 <= 0.0 || a3 > 1.0)
  {
    PML_LogHandle();
    *(double *)&v83 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
    if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 134217984;
      double v117 = a3;
      _os_log_error_impl(&dword_2212A0000, v83, OS_LOG_TYPE_ERROR, "Sampling probability is invalid value %f", buf, 0xCu);
    }
    goto LABEL_56;
  }
  *(double *)&unint64_t v22 = COERCE_DOUBLE([v17 numberOfDataPoints]);
  *(double *)&uint64_t v23 = COERCE_DOUBLE([v18 numberOfDataPoints]);
  double v24 = *(double *)&v23;
  if (*(double *)&v22 == 0.0 || *(double *)&v23 == 0.0)
  {
    PML_LogHandle();
    *(double *)&v83 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
    if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134218240;
      double v117 = *(double *)&v22;
      __int16 v118 = 2048;
      double v119 = v24;
      _os_log_impl(&dword_2212A0000, v83, OS_LOG_TYPE_DEFAULT, "Returning nil for training metrics since 0 points for ground truth %tu and / or training results %tu", buf, 0x16u);
    }
LABEL_56:
    uint64_t v73 = 0;
    goto LABEL_85;
  }
  BOOL v92 = a10;
  id v101 = v21;
  id v102 = v20;
  id v100 = v19;
  v125[0] = v19;
  [MEMORY[0x263EFF8C0] arrayWithObjects:v125 count:1];
  long long v112 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  long long v115 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v25 = [obj countByEnumeratingWithState:&v112 objects:v124 count:16];
  objc_super v26 = v18;
  if (v25)
  {
    uint64_t v27 = v25;
    uint64_t v28 = *(void *)v113;
    double v96 = v24;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v113 != v28) {
          objc_enumerationMutation(obj);
        }
        double v30 = *(double *)(*((void *)&v112 + 1) + 8 * i);
        v31 = (void *)MEMORY[0x223C7E5C0]();
        id v111 = 0;
        uint64_t v32 = [v17 dataPointAtIndex:0 error:&v111];
        v33 = v111;
        if (*(double *)&v33 != 0.0)
        {
          v83 = v33;
          v84 = PML_LogHandle();
          if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412290;
            double v117 = *(double *)&v83;
            _os_log_error_impl(&dword_2212A0000, v84, OS_LOG_TYPE_ERROR, "Unable to get ground truth value for key validation: %@", buf, 0xCu);
          }
          goto LABEL_62;
        }
        v34 = [v32 objectForKeyedSubscript:*(void *)&v30];

        if (!v34)
        {
          v84 = PML_LogHandle();
          if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412546;
            double v117 = v30;
            __int16 v118 = 2112;
            double v119 = 0.0;
            _os_log_error_impl(&dword_2212A0000, v84, OS_LOG_TYPE_ERROR, "Unable to get %@ key for ground truth: %@", buf, 0x16u);
          }
          *(double *)&v83 = 0.0;
LABEL_62:
          id v18 = v26;
          id v19 = v100;
          v81 = obj;

          uint64_t v73 = 0;
          v82 = obj;
          id v21 = v101;
          id v20 = v102;
          goto LABEL_84;
        }
      }
      uint64_t v27 = [obj countByEnumeratingWithState:&v112 objects:v124 count:16];
      id v18 = v26;
      double v24 = v96;
    }
    while (v27);
  }

  v123[0] = v102;
  v123[1] = v101;
  [MEMORY[0x263EFF8C0] arrayWithObjects:v123 count:2];
  long long v107 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  id v99 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v35 = [v99 countByEnumeratingWithState:&v107 objects:v122 count:16];
  if (!v35) {
    goto LABEL_23;
  }
  uint64_t v36 = v35;
  uint64_t v37 = *(void *)v108;
  double v97 = v24;
  do
  {
    for (uint64_t j = 0; j != v36; ++j)
    {
      if (*(void *)v108 != v37) {
        objc_enumerationMutation(v99);
      }
      double v39 = *(double *)(*((void *)&v107 + 1) + 8 * j);
      double v40 = (void *)MEMORY[0x223C7E5C0]();
      id v106 = 0;
      v41 = [v26 dataPointAtIndex:0 error:&v106];
      v42 = v106;
      if (*(double *)&v42 != 0.0)
      {
        v83 = v42;
        v85 = PML_LogHandle();
        if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412290;
          double v117 = *(double *)&v83;
          _os_log_error_impl(&dword_2212A0000, v85, OS_LOG_TYPE_ERROR, "Unable to get training result for key validation: %@", buf, 0xCu);
        }
        goto LABEL_68;
      }
      v43 = [v41 objectForKeyedSubscript:*(void *)&v39];

      if (!v43)
      {
        v85 = PML_LogHandle();
        if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412546;
          double v117 = v39;
          __int16 v118 = 2112;
          double v119 = 0.0;
          _os_log_error_impl(&dword_2212A0000, v85, OS_LOG_TYPE_ERROR, "Unable to get %@ key for training result: %@", buf, 0x16u);
        }
        *(double *)&v83 = 0.0;
LABEL_68:
        id v18 = v26;
        id v19 = v100;
        v81 = obj;

        uint64_t v73 = 0;
        v82 = v99;
        v86 = v99;
        id v21 = v101;
        id v20 = v102;
        goto LABEL_83;
      }
    }
    uint64_t v36 = [v99 countByEnumeratingWithState:&v107 objects:v122 count:16];
    id v18 = v26;
    double v24 = v97;
  }
  while (v36);
LABEL_23:

  if (v22 != *(void *)&v24)
  {
    v44 = PML_LogHandle();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      double v45 = v24;
      *(double *)&uint64_t v46 = COERCE_DOUBLE([v17 numberOfDataPoints]);
      double v47 = COERCE_DOUBLE([v18 numberOfDataPoints]);
      *(_DWORD *)long long buf = 134218240;
      double v117 = *(double *)&v46;
      double v24 = v45;
      __int16 v118 = 2048;
      double v119 = v47;
      _os_log_impl(&dword_2212A0000, v44, OS_LOG_TYPE_DEFAULT, "The number of ground truth values %tu does not match number of inference results %tu", buf, 0x16u);
    }
  }
  if (v22 < *(void *)&v24) {
    double v24 = *(double *)&v22;
  }
  v94 = objc_opt_new();
  id v18 = v26;
  v98 = objc_opt_new();
  uint64_t v48 = objc_opt_new();
  v49 = (void *)v48;
  double v50 = 0.0;
  unint64_t v93 = 0;
  unint64_t v51 = 0;
  double v90 = v24;
  if (*(void *)&v24 <= 1uLL) {
    uint64_t v52 = 1;
  }
  else {
    uint64_t v52 = *(void *)&v24;
  }
  float v53 = 0.0;
  v95 = (void *)v48;
  while (2)
  {
    v54 = (void *)MEMORY[0x223C7E5C0]();
    [v49 nextDouble];
    if (v55 > a3)
    {
      v56 = PML_LogHandle();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)long long buf = 0;
        _os_log_debug_impl(&dword_2212A0000, v56, OS_LOG_TYPE_DEBUG, "Skipping row for metrics calculation", buf, 2u);
      }
      goto LABEL_44;
    }
    id v105 = 0;
    v56 = [v17 dataPointAtIndex:*(void *)&v50 error:&v105];
    v57 = v105;
    if (*(double *)&v57 != 0.0)
    {
      v83 = v57;
      v87 = PML_LogHandle();
      if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 134218242;
        double v117 = v50;
        __int16 v118 = 2112;
        double v119 = *(double *)&v83;
        _os_log_error_impl(&dword_2212A0000, v87, OS_LOG_TYPE_ERROR, "Unable to get ground truth at index %tu: %@", buf, 0x16u);
      }

      goto LABEL_75;
    }
    id v104 = 0;
    v58 = [v18 dataPointAtIndex:*(void *)&v50 error:&v104];
    uint64_t v59 = v104;
    if (*(double *)&v59 != 0.0)
    {
      v83 = v59;
      v88 = PML_LogHandle();
      if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 134218242;
        double v117 = v50;
        __int16 v118 = 2112;
        double v119 = *(double *)&v83;
        _os_log_error_impl(&dword_2212A0000, v88, OS_LOG_TYPE_ERROR, "Unable to get inference results at index %tu: %@", buf, 0x16u);
      }

LABEL_75:
      uint64_t v73 = 0;
      id v19 = v100;
      id v21 = v101;
      id v20 = v102;
      v81 = obj;
      v82 = v99;
LABEL_80:
      v86 = v94;
      goto LABEL_82;
    }
    v60 = [v56 objectForKeyedSubscript:v100];
    uint64_t v61 = (float *)[v60 dataPointer];

    float v62 = *v61;
    v63 = [v58 objectForKeyedSubscript:v102];
    id v64 = [v63 dataArray];

    unsigned int v65 = +[PMLEspressoTrainingPlan argmax:v64];
    if ((v65 & 0x80000000) == 0 && v65 == (int)v62)
    {
      v66 = [v64 objectAtIndexedSubscript:v65];
      [v66 floatValue];
      double v68 = v67;

      unint64_t v69 = v93;
      if (v68 > a9) {
        unint64_t v69 = v93 + 1;
      }
      unint64_t v93 = v69;
    }
    ++v51;
    uint64_t v70 = objc_msgSend(v58, "objectForKeyedSubscript:", v101, *(void *)&v90);
    float v53 = v53 + *(float *)[v70 dataPointer];

    [v94 addObject:v64];
    *(float *)&double v71 = v62;
    uint64_t v72 = [NSNumber numberWithFloat:v71];
    [v98 addObject:v72];

    v49 = v95;
LABEL_44:

    if (v52 != ++*(void *)&v50) {
      continue;
    }
    break;
  }
  uint64_t v73 = objc_opt_new();
  uint64_t v74 = [NSNumber numberWithUnsignedInteger:v51];
  [v73 setObject:v74 forKeyedSubscript:@"numberOfSamples"];

  if (v51) {
    v75 = &unk_26D336518;
  }
  else {
    v75 = &unk_26D336530;
  }
  objc_msgSend(v73, "setObject:forKeyedSubscript:", v75, @"isSampled", *(void *)&v90);
  if (v51)
  {
    *(float *)&double v76 = v53 / (float)v51;
    v77 = [NSNumber numberWithFloat:v76];
    [v73 setObject:v77 forKeyedSubscript:@"loss"];

    *(float *)&double v78 = (float)v93 / (float)v51;
    v79 = [NSNumber numberWithFloat:v78];
    [v73 setObject:v79 forKeyedSubscript:@"accuracy"];

    v80 = PML_LogHandle();
    id v19 = v100;
    v81 = obj;
    if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 134218496;
      double v117 = v91;
      __int16 v118 = 2048;
      double v119 = (float)(v53 / (float)v51);
      __int16 v120 = 2048;
      double v121 = (float)((float)v93 / (float)v51);
      _os_log_impl(&dword_2212A0000, v80, OS_LOG_TYPE_INFO, "Number of data points: %tu, Loss: %f, Accuracy: %f", buf, 0x20u);
    }
    id v21 = v101;
    id v20 = v102;
    v82 = v99;
  }
  else
  {
    [v73 setObject:&unk_26D336530 forKeyedSubscript:@"loss"];
    [v73 setObject:&unk_26D336530 forKeyedSubscript:@"accuracy"];
    v80 = PML_LogHandle();
    id v19 = v100;
    id v21 = v101;
    id v20 = v102;
    v81 = obj;
    v82 = v99;
    if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_2212A0000, v80, OS_LOG_TYPE_INFO, "Not adding loss or accuracy metrics as no rows were sampled", buf, 2u);
    }
  }

  if (v92)
  {
    *(double *)&v83 = 0.0;
    goto LABEL_80;
  }
  v86 = v94;
  [v73 setObject:v94 forKeyedSubscript:@"predictions"];
  [v73 setObject:v98 forKeyedSubscript:@"groundTruth"];
  *(double *)&v83 = 0.0;
LABEL_82:

LABEL_83:
LABEL_84:

LABEL_85:
  return v73;
}

+ (id)_calculateGradientInPlaceForTask:(id)a3 startingParameters:(id)a4 globalNames:(id)a5 weightNames:(id)a6 biasNames:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  unint64_t v16 = [v12 length];
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x2020000000;
  v30[3] = 0;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy__2942;
  uint64_t v28 = __Block_byref_object_dispose__2943;
  id v29 = 0;
  id v17 = v12;
  uint64_t v18 = [v17 mutableBytes];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __113__PMLEspressoTrainingPlan__calculateGradientInPlaceForTask_startingParameters_globalNames_weightNames_biasNames___block_invoke;
  v23[3] = &unk_26459F3B0;
  v23[4] = v30;
  v23[5] = &v24;
  v23[6] = v16 >> 2;
  v23[7] = v18;
  id v19 = +[PMLEspressoTrainingPlan _iterateModelParametersForTask:v11 globalNames:v13 weightNames:v14 biasNames:v15 block:v23];
  id v20 = v19;
  if (v19 || (id v20 = (void *)v25[5]) != 0) {
    id v21 = v20;
  }
  else {
    id v21 = 0;
  }

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(v30, 8);

  return v21;
}

BOOL __113__PMLEspressoTrainingPlan__calculateGradientInPlaceForTask_startingParameters_globalNames_weightNames_biasNames___block_invoke(void *a1, void *a2, void *a3, void *a4)
{
  v22[1] = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  unint64_t v10 = +[PMLEspressoTrainingPlan numberOfParametersInTensor:v7];
  unint64_t v11 = *(void *)(*(void *)(a1[4] + 8) + 24) + v10;
  unint64_t v12 = a1[6];
  if (v11 > v12)
  {
    id v14 = (void *)MEMORY[0x263F087E8];
    uint64_t v21 = *MEMORY[0x263F08320];
    id v15 = (void *)[[NSString alloc] initWithFormat:@"Unable to in place update gradient since number of starting and ending parameters don't match for tensor type %@ name %@", v8, v9];
    v22[0] = v15;
    unint64_t v16 = [NSDictionary dictionaryWithObjects:v22 forKeys:&v21 count:1];
    uint64_t v17 = [v14 errorWithDomain:@"ProactiveMLErrorDomain" code:201 userInfo:v16];
    uint64_t v18 = *(void *)(a1[5] + 8);
    id v19 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = v17;
  }
  else
  {
    unint64_t v13 = v10;
    catlas_saxpby(v10, -1.0, (const float *)[v7 dataPointer], 1, 1.0, (float *)(a1[7] + 4 * *(void *)(*(void *)(a1[4] + 8) + 24)), 1);
    *(void *)(*(void *)(a1[4] + 8) + 24) += v13;
  }

  return v11 <= v12;
}

+ (id)_getModelParametersForTask:(id)a3 globalNames:(id)a4 weightNames:(id)a5 biasNames:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2020000000;
  uint64_t v35 = 0;
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x2020000000;
  uint64_t v31 = 0;
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __94__PMLEspressoTrainingPlan__getModelParametersForTask_globalNames_weightNames_biasNames_error___block_invoke;
  v27[3] = &unk_26459F360;
  v27[4] = &v28;
  v27[5] = &v32;
  id v15 = +[PMLEspressoTrainingPlan _iterateModelParametersForTask:v11 globalNames:v12 weightNames:v13 biasNames:v14 block:v27];
  id v16 = v15;
  if (v15)
  {
    if (a7)
    {
      id v16 = v15;
      id v17 = 0;
      *a7 = v16;
    }
    else
    {
      id v17 = 0;
    }
  }
  else if (v33[3] && v29[3])
  {
    v26[0] = 0;
    v26[1] = v26;
    v26[2] = 0x2020000000;
    v26[3] = 0;
    id v18 = objc_alloc(MEMORY[0x263EFF990]);
    id v19 = (void *)[v18 initWithLength:v29[3]];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __94__PMLEspressoTrainingPlan__getModelParametersForTask_globalNames_weightNames_biasNames_error___block_invoke_2;
    v23[3] = &unk_26459F388;
    id v20 = v19;
    id v24 = v20;
    uint64_t v25 = v26;
    uint64_t v21 = +[PMLEspressoTrainingPlan _iterateModelParametersForTask:v11 globalNames:v12 weightNames:v13 biasNames:v14 block:v23];
    id v16 = v21;
    if (v21)
    {
      id v17 = 0;
      if (a7) {
        *a7 = v21;
      }
    }
    else
    {
      id v17 = v20;
    }

    _Block_object_dispose(v26, 8);
  }
  else
  {
    id v17 = (id)objc_opt_new();
    id v16 = 0;
  }

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);

  return v17;
}

uint64_t __94__PMLEspressoTrainingPlan__getModelParametersForTask_globalNames_weightNames_biasNames_error___block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += 4
                                                               * +[PMLEspressoTrainingPlan numberOfParametersInTensor:a2];
  ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  return 1;
}

uint64_t __94__PMLEspressoTrainingPlan__getModelParametersForTask_globalNames_weightNames_biasNames_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = 4
     * +[PMLEspressoTrainingPlan numberOfParametersInTensor:v3];
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  uint64_t v7 = [v3 dataPointer];

  objc_msgSend(v5, "replaceBytesInRange:withBytes:", v6, v4, v7);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += v4;
  return 1;
}

+ (id)_iterateModelParametersForTask:(id)a3 globalNames:(id)a4 weightNames:(id)a5 biasNames:(id)a6 block:(id)a7
{
  uint64_t v84 = *MEMORY[0x263EF8340];
  id v62 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = (uint64_t (**)(id, uint64_t, __CFString *, void))a7;
  uint64_t v15 = [v11 count];
  uint64_t v16 = [v12 count] + v15;
  if (!(v16 + [v13 count])) {
    goto LABEL_2;
  }
  id v57 = v11;
  id v58 = v12;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id obj = v11;
  uint64_t v18 = [obj countByEnumeratingWithState:&v73 objects:v83 count:16];
  id v56 = v13;
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v74;
LABEL_5:
    uint64_t v21 = 0;
    while (1)
    {
      if (*(void *)v74 != v20) {
        objc_enumerationMutation(obj);
      }
      uint64_t v22 = *(void *)(*((void *)&v73 + 1) + 8 * v21);
      uint64_t v23 = (void *)MEMORY[0x223C7E5C0]();
      uint64_t v24 = [v62 getTensorNamed:v22];
      if (!v24) {
        break;
      }
      uint64_t v25 = (void *)v24;
      char v26 = v14[2](v14, v24, @"global", v22);

      if ((v26 & 1) == 0)
      {

        id v17 = 0;
LABEL_43:
        id v11 = v57;
        goto LABEL_51;
      }
      if (v19 == ++v21)
      {
        uint64_t v19 = [obj countByEnumeratingWithState:&v73 objects:v83 count:16];
        id v13 = v56;
        if (v19) {
          goto LABEL_5;
        }
        goto LABEL_12;
      }
    }
    uint64_t v27 = PML_LogHandle();
    id v11 = v57;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v82 = v22;
      _os_log_error_impl(&dword_2212A0000, v27, OS_LOG_TYPE_ERROR, "An error occured when attempting to get parameters for global variable: %@", buf, 0xCu);
    }

    uint64_t v28 = (void *)MEMORY[0x263F087E8];
    uint64_t v79 = *MEMORY[0x263F08320];
    id v29 = (void *)[[NSString alloc] initWithFormat:@"Unable to find global variable named: %@", v22];
    v80 = v29;
    uint64_t v30 = [NSDictionary dictionaryWithObjects:&v80 forKeys:&v79 count:1];
    id v17 = [v28 errorWithDomain:@"ProactiveMLErrorDomain" code:202 userInfo:v30];

    id v13 = v56;
    if (v17) {
      goto LABEL_52;
    }
  }
  else
  {
LABEL_12:

    id v11 = v57;
  }
  long long v72 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v69 = 0u;
  id v31 = v12;
  uint64_t v32 = [v31 countByEnumeratingWithState:&v69 objects:v78 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    id v17 = 0;
    uint64_t v34 = *(void *)v70;
    id obja = v31;
    while (2)
    {
      uint64_t v35 = 0;
      uint64_t v36 = v17;
      do
      {
        if (*(void *)v70 != v34) {
          objc_enumerationMutation(obja);
        }
        uint64_t v37 = *(void *)(*((void *)&v69 + 1) + 8 * v35);
        v38 = (void *)MEMORY[0x223C7E5C0]();
        id v68 = v36;
        double v39 = [v62 getParameterOfType:1 forLayerNamed:v37 error:&v68];
        id v17 = v68;

        if (!v39)
        {
          v42 = PML_LogHandle();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412290;
            uint64_t v82 = v37;
            _os_log_error_impl(&dword_2212A0000, v42, OS_LOG_TYPE_ERROR, "An error occured when attempting to get weight for layer: %@", buf, 0xCu);
          }

          v41 = obja;
          goto LABEL_31;
        }
        char v40 = v14[2](v14, (uint64_t)v39, @"weight", v37);

        if ((v40 & 1) == 0)
        {

          goto LABEL_43;
        }
        ++v35;
        uint64_t v36 = v17;
      }
      while (v33 != v35);
      v41 = obja;
      uint64_t v33 = [obja countByEnumeratingWithState:&v69 objects:v78 count:16];
      if (v33) {
        continue;
      }
      break;
    }
LABEL_31:

    id v11 = v57;
    id v13 = v56;
    if (v17) {
      goto LABEL_52;
    }
  }
  else
  {
  }
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id v43 = v13;
  uint64_t v44 = [v43 countByEnumeratingWithState:&v64 objects:v77 count:16];
  if (!v44)
  {

LABEL_2:
    id v17 = 0;
    goto LABEL_52;
  }
  uint64_t v45 = v44;
  id v17 = 0;
  uint64_t v46 = *(void *)v65;
  id objb = v43;
LABEL_34:
  uint64_t v47 = 0;
  uint64_t v48 = v17;
  while (1)
  {
    if (*(void *)v65 != v46) {
      objc_enumerationMutation(objb);
    }
    uint64_t v49 = *(void *)(*((void *)&v64 + 1) + 8 * v47);
    double v50 = (void *)MEMORY[0x223C7E5C0]();
    id v63 = v48;
    unint64_t v51 = [v62 getParameterOfType:2 forLayerNamed:v49 error:&v63];
    id v17 = v63;

    if (!v51)
    {
      v54 = PML_LogHandle();
      id v12 = v58;
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v82 = v49;
        _os_log_error_impl(&dword_2212A0000, v54, OS_LOG_TYPE_ERROR, "An error occured when attempting to get bias for layer: %@", buf, 0xCu);
      }

      float v53 = objb;
LABEL_48:

      goto LABEL_50;
    }
    char v52 = v14[2](v14, (uint64_t)v51, @"bias", v49);

    if ((v52 & 1) == 0) {
      break;
    }
    ++v47;
    uint64_t v48 = v17;
    if (v45 == v47)
    {
      float v53 = objb;
      uint64_t v45 = [objb countByEnumeratingWithState:&v64 objects:v77 count:16];
      id v12 = v58;
      if (v45) {
        goto LABEL_34;
      }
      goto LABEL_48;
    }
  }

  id v12 = v58;
LABEL_50:
  id v11 = v57;
LABEL_51:
  id v13 = v56;
LABEL_52:

  return v17;
}

+ (BOOL)isValidGradient:(id)a3 error:(id *)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if ([v5 count])
  {
    unint64_t v6 = [v5 count];
    uint64_t v7 = [v5 ptr];
    if (v6)
    {
      id v8 = (float *)v7;
      id v9 = (void *)MEMORY[0x223C7E5C0]();
      BOOL v10 = 0;
      unint64_t v11 = 0;
      float v12 = *v8;
      if (fabsf(*v8) == INFINITY)
      {
LABEL_9:
        id v14 = objc_msgSend([NSString alloc], "initWithFormat:", @"Gradient contains %f at index %lu", v12, v11);
        uint64_t v15 = PML_LogHandle();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412290;
          uint64_t v24 = v14;
          _os_log_error_impl(&dword_2212A0000, v15, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }

        uint64_t v16 = (void *)MEMORY[0x263F087E8];
        uint64_t v21 = *MEMORY[0x263F08320];
        uint64_t v22 = v14;
        id v17 = [NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
        id v18 = [v16 errorWithDomain:@"ProactiveMLErrorDomain" code:203 userInfo:v17];

        if (a4) {
          char v19 = v10;
        }
        else {
          char v19 = 1;
        }
        if ((v19 & 1) == 0)
        {
          id v18 = v18;
          BOOL v10 = 0;
          *a4 = v18;
        }
        goto LABEL_18;
      }
      unint64_t v11 = 0;
      while (1)
      {
        if (v6 - 1 == v11) {
          break;
        }
        id v9 = (void *)MEMORY[0x223C7E5C0]();
        float v12 = v8[v11 + 1];
        float v13 = fabsf(v12);
        ++v11;
        if (v13 >= INFINITY && v13 <= INFINITY)
        {
          BOOL v10 = v11 >= v6;
          goto LABEL_9;
        }
      }
    }
    id v18 = 0;
    BOOL v10 = 1;
LABEL_18:

    goto LABEL_19;
  }
  BOOL v10 = 1;
LABEL_19:

  return v10;
}

+ (unint64_t)numberOfParametersInTensor:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = [a3 shape];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    unint64_t v7 = 1;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        v7 *= [*(id *)(*((void *)&v10 + 1) + 8 * i) unsignedIntegerValue];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v7 = 1;
  }

  return v7;
}

+ (int)argmax:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    unint64_t v4 = 0;
    int v5 = -1;
    float v6 = -3.4028e38;
    do
    {
      unint64_t v7 = [v3 objectAtIndexedSubscript:v4];
      [v7 floatValue];
      float v9 = v8;

      if (v6 < v9)
      {
        float v6 = v9;
        int v5 = v4;
      }
      ++v4;
    }
    while ([v3 count] > v4);
  }
  else
  {
    int v5 = -1;
  }

  return v5;
}

@end