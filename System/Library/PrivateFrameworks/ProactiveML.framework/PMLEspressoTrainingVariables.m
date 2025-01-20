@interface PMLEspressoTrainingVariables
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToEspressoTrainingVariables:(id)a3;
- (NSArray)globalsToGetGradientsFor;
- (NSArray)layerBiasesToGetGradientsFor;
- (NSArray)layerWeightsToGetGradientsFor;
- (NSString)initializerName;
- (NSString)inputName;
- (NSString)lossValueName;
- (NSString)outputName;
- (NSString)trainingControlVariableName;
- (NSString)trainingOutputName;
- (NSString)trueLabelName;
- (NSURL)trainingNetworkPath;
- (PMLEspressoTrainingVariables)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5;
- (PMLEspressoTrainingVariables)initWithTrainingNetworkPath:(id)a3 inputName:(id)a4 inputDim:(unint64_t)a5 outputName:(id)a6 trueLabelName:(id)a7 lossValueName:(id)a8 trainingOutputName:(id)a9 trainingControlVariableName:(id)a10 initializerName:(id)a11 globalsToGetGradientsFor:(id)a12 layerWeightsToGetGradientsFor:(id)a13 layerBiasesToGetGradientsFor:(id)a14;
- (id)toPlistWithChunks:(id)a3;
- (unint64_t)inputDim;
@end

@implementation PMLEspressoTrainingVariables

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layerBiasesToGetGradientsFor, 0);
  objc_storeStrong((id *)&self->_layerWeightsToGetGradientsFor, 0);
  objc_storeStrong((id *)&self->_globalsToGetGradientsFor, 0);
  objc_storeStrong((id *)&self->_initializerName, 0);
  objc_storeStrong((id *)&self->_trainingControlVariableName, 0);
  objc_storeStrong((id *)&self->_trainingOutputName, 0);
  objc_storeStrong((id *)&self->_lossValueName, 0);
  objc_storeStrong((id *)&self->_trueLabelName, 0);
  objc_storeStrong((id *)&self->_outputName, 0);
  objc_storeStrong((id *)&self->_inputName, 0);
  objc_storeStrong((id *)&self->_trainingNetworkPath, 0);
}

- (NSArray)layerBiasesToGetGradientsFor
{
  return self->_layerBiasesToGetGradientsFor;
}

- (NSArray)layerWeightsToGetGradientsFor
{
  return self->_layerWeightsToGetGradientsFor;
}

- (NSArray)globalsToGetGradientsFor
{
  return self->_globalsToGetGradientsFor;
}

- (NSString)initializerName
{
  return self->_initializerName;
}

- (NSString)trainingControlVariableName
{
  return self->_trainingControlVariableName;
}

- (NSString)trainingOutputName
{
  return self->_trainingOutputName;
}

- (NSString)lossValueName
{
  return self->_lossValueName;
}

- (NSString)trueLabelName
{
  return self->_trueLabelName;
}

- (NSString)outputName
{
  return self->_outputName;
}

- (unint64_t)inputDim
{
  return self->_inputDim;
}

- (NSString)inputName
{
  return self->_inputName;
}

- (NSURL)trainingNetworkPath
{
  return self->_trainingNetworkPath;
}

- (PMLEspressoTrainingVariables)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = [v8 objectForKeyedSubscript:@"PML_ESPRESSO_TRAINING_NETWORK_PATH"];

  if (!v10)
  {
    v20 = [MEMORY[0x263F08690] currentHandler];
    v21 = (objc_class *)objc_opt_class();
    v22 = NSStringFromClass(v21);
    [v20 handleFailureInMethod:a2, self, @"PMLEspressoTrainingVariables.m", 130, @"Can't instantiate %@. Missing \"%@\" dependency.", v22, @"PML_ESPRESSO_TRAINING_NETWORK_PATH" object file lineNumber description];
  }
  v11 = [v8 objectForKeyedSubscript:@"PML_ESPRESSO_TRAINING_NETWORK_PATH"];
  v12 = [v9 objectForKeyedSubscript:@"PML_ESPRESSO_INPUT_NAME"];
  v29 = [v9 objectForKeyedSubscript:@"PML_ESPRESSO_INPUT_DIM"];
  uint64_t v13 = [v29 unsignedIntegerValue];
  v27 = [v9 objectForKeyedSubscript:@"PML_ESPRESSO_OUTPUT_NAME"];
  v25 = [v9 objectForKeyedSubscript:@"PML_ESPRESSO_TRUE_LABEL_NAME"];
  v24 = [v9 objectForKeyedSubscript:@"PML_ESPRESSO_LOSS_VALUE_NAME"];
  v23 = [v9 objectForKeyedSubscript:@"PML_ESPRESSO_TRAINING_OUTPUT_NAME"];
  v14 = [v9 objectForKeyedSubscript:@"PML_ESPRESSO_TRAINING_CONTROL_VARIABLE_NAME"];
  v15 = [v9 objectForKeyedSubscript:@"PML_ESPRESSO_INITIALIZER_NAME"];
  v16 = [v9 objectForKeyedSubscript:@"PML_ESPRESSO_GLOBALS_TO_GET_GRADIENTS_FOR"];
  v17 = [v9 objectForKeyedSubscript:@"PML_ESPRESSO_LAYER_WEIGHTS_TO_GET_GRADIENTS_FOR"];
  [v9 objectForKeyedSubscript:@"PML_ESPRESSO_LAYER_BIASES_TO_GET_GRADIENTS_FOR"];
  v18 = v28 = v8;

  v26 = [(PMLEspressoTrainingVariables *)self initWithTrainingNetworkPath:v11 inputName:v12 inputDim:v13 outputName:v27 trueLabelName:v25 lossValueName:v24 trainingOutputName:v23 trainingControlVariableName:v14 initializerName:v15 globalsToGetGradientsFor:v16 layerWeightsToGetGradientsFor:v17 layerBiasesToGetGradientsFor:v18];
  return v26;
}

- (id)toPlistWithChunks:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  unint64_t inputDim = self->_inputDim;
  v13[0] = self->_inputName;
  v12[0] = @"PML_ESPRESSO_INPUT_NAME";
  v12[1] = @"PML_ESPRESSO_INPUT_DIM";
  v5 = [NSNumber numberWithUnsignedInteger:inputDim];
  outputName = self->_outputName;
  trueLabelName = self->_trueLabelName;
  v13[1] = v5;
  v13[2] = outputName;
  v12[2] = @"PML_ESPRESSO_OUTPUT_NAME";
  v12[3] = @"PML_ESPRESSO_TRUE_LABEL_NAME";
  v13[3] = trueLabelName;
  long long v14 = *(_OWORD *)&self->_lossValueName;
  v12[4] = @"PML_ESPRESSO_LOSS_VALUE_NAME";
  v12[5] = @"PML_ESPRESSO_TRAINING_OUTPUT_NAME";
  v12[6] = @"PML_ESPRESSO_TRAINING_CONTROL_VARIABLE_NAME";
  v12[7] = @"PML_ESPRESSO_INITIALIZER_NAME";
  initializerName = self->_initializerName;
  trainingControlVariableName = self->_trainingControlVariableName;
  v16 = initializerName;
  long long v9 = *(_OWORD *)&self->_globalsToGetGradientsFor;
  v12[8] = @"PML_ESPRESSO_GLOBALS_TO_GET_GRADIENTS_FOR";
  v12[9] = @"PML_ESPRESSO_LAYER_WEIGHTS_TO_GET_GRADIENTS_FOR";
  long long v17 = v9;
  v12[10] = @"PML_ESPRESSO_LAYER_BIASES_TO_GET_GRADIENTS_FOR";
  layerBiasesToGetGradientsFor = self->_layerBiasesToGetGradientsFor;
  v10 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:11];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PMLEspressoTrainingVariables *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PMLEspressoTrainingVariables *)self isEqualToEspressoTrainingVariables:v5];

  return v6;
}

- (BOOL)isEqualToEspressoTrainingVariables:(id)a3
{
  v4 = (id *)a3;
  inputName = self->_inputName;
  BOOL v6 = (NSString *)v4[3];
  if (inputName == v6)
  {
  }
  else
  {
    v7 = v6;
    id v8 = inputName;
    char v9 = [(NSString *)v8 isEqual:v7];

    if ((v9 & 1) == 0) {
      goto LABEL_36;
    }
  }
  unint64_t inputDim = self->_inputDim;
  if (inputDim != [v4 inputDim])
  {
LABEL_36:
    char v51 = 0;
    goto LABEL_37;
  }
  outputName = self->_outputName;
  v12 = (NSString *)v4[5];
  if (outputName == v12)
  {
  }
  else
  {
    uint64_t v13 = v12;
    long long v14 = outputName;
    char v15 = [(NSString *)v14 isEqual:v13];

    if ((v15 & 1) == 0) {
      goto LABEL_36;
    }
  }
  trueLabelName = self->_trueLabelName;
  long long v17 = (NSString *)v4[6];
  if (trueLabelName == v17)
  {
  }
  else
  {
    v18 = v17;
    uint64_t v19 = trueLabelName;
    char v20 = [(NSString *)v19 isEqual:v18];

    if ((v20 & 1) == 0) {
      goto LABEL_36;
    }
  }
  lossValueName = self->_lossValueName;
  v22 = (NSString *)v4[7];
  if (lossValueName == v22)
  {
  }
  else
  {
    v23 = v22;
    v24 = lossValueName;
    char v25 = [(NSString *)v24 isEqual:v23];

    if ((v25 & 1) == 0) {
      goto LABEL_36;
    }
  }
  trainingOutputName = self->_trainingOutputName;
  v27 = (NSString *)v4[8];
  if (trainingOutputName == v27)
  {
  }
  else
  {
    v28 = v27;
    v29 = trainingOutputName;
    char v30 = [(NSString *)v29 isEqual:v28];

    if ((v30 & 1) == 0) {
      goto LABEL_36;
    }
  }
  trainingControlVariableName = self->_trainingControlVariableName;
  v32 = (NSString *)v4[9];
  if (trainingControlVariableName == v32)
  {
  }
  else
  {
    v33 = v32;
    v34 = trainingControlVariableName;
    char v35 = [(NSString *)v34 isEqual:v33];

    if ((v35 & 1) == 0) {
      goto LABEL_36;
    }
  }
  initializerName = self->_initializerName;
  v37 = (NSString *)v4[10];
  if (initializerName == v37)
  {
  }
  else
  {
    v38 = v37;
    v39 = initializerName;
    char v40 = [(NSString *)v39 isEqual:v38];

    if ((v40 & 1) == 0) {
      goto LABEL_36;
    }
  }
  layerWeightsToGetGradientsFor = self->_layerWeightsToGetGradientsFor;
  v42 = (NSArray *)v4[12];
  if (layerWeightsToGetGradientsFor == v42)
  {
  }
  else
  {
    v43 = v42;
    v44 = layerWeightsToGetGradientsFor;
    char v45 = [(NSArray *)v44 isEqual:v43];

    if ((v45 & 1) == 0) {
      goto LABEL_36;
    }
  }
  layerBiasesToGetGradientsFor = self->_layerBiasesToGetGradientsFor;
  v47 = (NSArray *)v4[13];
  if (layerBiasesToGetGradientsFor == v47)
  {
  }
  else
  {
    v48 = v47;
    v49 = layerBiasesToGetGradientsFor;
    char v50 = [(NSArray *)v49 isEqual:v48];

    if ((v50 & 1) == 0) {
      goto LABEL_36;
    }
  }
  uint64_t v53 = [(NSURL *)self->_trainingNetworkPath absoluteString];
  v54 = [v4 trainingNetworkPath];
  uint64_t v55 = [v54 absoluteString];

  if (v53 | v55)
  {
    char v51 = 0;
    if (v53 && v55)
    {
      v56 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v53];
      v57 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v55];
      char v51 = [v56 isEqual:v57];
    }
  }
  else
  {
    char v51 = 1;
  }

LABEL_37:
  return v51;
}

- (PMLEspressoTrainingVariables)initWithTrainingNetworkPath:(id)a3 inputName:(id)a4 inputDim:(unint64_t)a5 outputName:(id)a6 trueLabelName:(id)a7 lossValueName:(id)a8 trainingOutputName:(id)a9 trainingControlVariableName:(id)a10 initializerName:(id)a11 globalsToGetGradientsFor:(id)a12 layerWeightsToGetGradientsFor:(id)a13 layerBiasesToGetGradientsFor:(id)a14
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v44 = a3;
  id v30 = a4;
  id v18 = a4;
  id v32 = a6;
  id v19 = a6;
  id v33 = a7;
  id v43 = a7;
  id v42 = a8;
  id v41 = a9;
  id v40 = a10;
  id v39 = a11;
  id v38 = a12;
  id v37 = a13;
  id v36 = a14;
  v45.receiver = self;
  v45.super_class = (Class)PMLEspressoTrainingVariables;
  char v20 = [(PMLEspressoTrainingVariables *)&v45 init];
  if (!v20) {
    goto LABEL_4;
  }
  id v28 = v19;
  id v35 = v18;
  v21 = [MEMORY[0x263F08850] defaultManager];
  v22 = [v44 path];
  char v23 = [v21 isReadableFileAtPath:v22];

  if (v23)
  {
    v20->_initializedWithNSData = 0;
    objc_storeStrong((id *)&v20->_trainingNetworkPath, a3);
    objc_storeStrong((id *)&v20->_inputName, v30);
    v20->_unint64_t inputDim = a5;
    objc_storeStrong((id *)&v20->_outputName, v32);
    objc_storeStrong((id *)&v20->_trueLabelName, v33);
    objc_storeStrong((id *)&v20->_lossValueName, a8);
    objc_storeStrong((id *)&v20->_trainingOutputName, a9);
    objc_storeStrong((id *)&v20->_trainingControlVariableName, a10);
    objc_storeStrong((id *)&v20->_initializerName, a11);
    objc_storeStrong((id *)&v20->_globalsToGetGradientsFor, a12);
    objc_storeStrong((id *)&v20->_layerWeightsToGetGradientsFor, a13);
    objc_storeStrong((id *)&v20->_layerBiasesToGetGradientsFor, a14);
    id v18 = v35;
    id v19 = v28;
LABEL_4:
    v24 = v20;
    goto LABEL_8;
  }
  char v25 = PML_LogHandle();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    v27 = [v44 path];
    *(_DWORD *)buf = 138412290;
    v47 = v27;
    _os_log_error_impl(&dword_2212A0000, v25, OS_LOG_TYPE_ERROR, "Unable to read Espresso network file at: %@", buf, 0xCu);
  }
  v24 = 0;
  id v18 = v35;
  id v19 = v28;
LABEL_8:

  return v24;
}

@end