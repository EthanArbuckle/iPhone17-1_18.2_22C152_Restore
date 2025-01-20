@interface PHAPrivateFederatedLearningModelTrainer
+ (void)_generateError:(id *)a3 errorCode:(int64_t)a4 message:(id)a5 underlyingError:(id)a6;
- (BOOL)_trueLabelTensor:(id)a3 isEqualToPredictionTensor:(id)a4;
- (ETDataProvider)trainingData;
- (ETLossDefinition)lossDefinition;
- (ETOptimizerDefinition)optimizerDefinition;
- (NSArray)layersToTrain;
- (NSString)inputName;
- (NSString)labelName;
- (NSString)lossName;
- (NSString)modelInferenceOutputName;
- (NSString)modelOutputName;
- (NSString)optimizerName;
- (NSURL)espressoFileURL;
- (PHAPrivateFederatedLearningModelTrainer)initWithTrainingData:(id)a3 espressoFileURL:(id)a4 learningRate:(id)a5 modelInputName:(id)a6 modelOutputName:(id)a7 lossName:(id)a8 optimizerName:(id)a9 error:(id *)a10;
- (id)_averageLossAndAccuracyForBatchResults:(id)a3 error:(id *)a4;
- (id)_getParamsFromTask:(id)a3 forLayers:(id)a4 error:(id *)a5;
- (id)trainForNumberOfEpochs:(unint64_t)a3 layersToTrain:(id)a4 verbose:(BOOL)a5 error:(id *)a6;
- (int)_argmax:(float *)a3 size:(int)a4;
- (void)setInputName:(id)a3;
- (void)setLabelName:(id)a3;
- (void)setLossDefinition:(id)a3;
- (void)setLossName:(id)a3;
- (void)setModelInferenceOutputName:(id)a3;
- (void)setModelOutputName:(id)a3;
- (void)setOptimizerDefinition:(id)a3;
- (void)setOptimizerName:(id)a3;
@end

@implementation PHAPrivateFederatedLearningModelTrainer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optimizerDefinition, 0);
  objc_storeStrong((id *)&self->_lossDefinition, 0);
  objc_storeStrong((id *)&self->_optimizerName, 0);
  objc_storeStrong((id *)&self->_lossName, 0);
  objc_storeStrong((id *)&self->_labelName, 0);
  objc_storeStrong((id *)&self->_modelInferenceOutputName, 0);
  objc_storeStrong((id *)&self->_modelOutputName, 0);
  objc_storeStrong((id *)&self->_inputName, 0);
  objc_storeStrong((id *)&self->_layersToTrain, 0);
  objc_storeStrong((id *)&self->_espressoFileURL, 0);

  objc_storeStrong((id *)&self->_trainingData, 0);
}

- (void)setOptimizerDefinition:(id)a3
{
}

- (ETOptimizerDefinition)optimizerDefinition
{
  return self->_optimizerDefinition;
}

- (void)setLossDefinition:(id)a3
{
}

- (ETLossDefinition)lossDefinition
{
  return self->_lossDefinition;
}

- (void)setOptimizerName:(id)a3
{
}

- (NSString)optimizerName
{
  return self->_optimizerName;
}

- (void)setLossName:(id)a3
{
}

- (NSString)lossName
{
  return self->_lossName;
}

- (void)setLabelName:(id)a3
{
}

- (NSString)labelName
{
  return self->_labelName;
}

- (void)setModelInferenceOutputName:(id)a3
{
}

- (NSString)modelInferenceOutputName
{
  return self->_modelInferenceOutputName;
}

- (void)setModelOutputName:(id)a3
{
}

- (NSString)modelOutputName
{
  return self->_modelOutputName;
}

- (void)setInputName:(id)a3
{
}

- (NSString)inputName
{
  return self->_inputName;
}

- (NSArray)layersToTrain
{
  return self->_layersToTrain;
}

- (NSURL)espressoFileURL
{
  return self->_espressoFileURL;
}

- (ETDataProvider)trainingData
{
  return self->_trainingData;
}

- (BOOL)_trueLabelTensor:(id)a3 isEqualToPredictionTensor:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (float *)[v7 dataPointer];
  uint64_t v9 = [v6 dataPointer];
  v10 = [v7 shape];

  v11 = [v10 objectAtIndexedSubscript:2];
  uint64_t v12 = [v11 intValue];

  v13 = [v6 shape];

  v14 = [v13 objectAtIndexedSubscript:2];
  uint64_t v15 = [v14 intValue];

  int v16 = [(PHAPrivateFederatedLearningModelTrainer *)self _argmax:v8 size:v12];
  int v17 = [(PHAPrivateFederatedLearningModelTrainer *)self _argmax:v9 size:v15];
  return v12 == 1 && v15 != 1 && roundf(*v8) == (double)v17
      || v16 == v17 && vabds_f32(v8[v16], *(float *)(v9 + 4 * v16)) <= 0.1;
}

- (id)_averageLossAndAccuracyForBatchResults:(id)a3 error:(id *)a4
{
  v40[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 numberOfDataPoints];
  unint64_t v8 = v6;
  if (v6)
  {
    unint64_t v35 = v6;
    unint64_t v36 = 0;
    id v9 = 0;
    uint64_t v10 = 0;
    float v11 = 0.0;
    id v33 = v5;
    while (1)
    {
      id v38 = v9;
      uint64_t v12 = [v5 dataPointAtIndex:v10 error:&v38];
      id v13 = v38;

      if (!v12)
      {
        +[PHAPrivateFederatedLearningModelTrainer _generateError:a4 errorCode:7 message:@"Training output is nil." underlyingError:v13];
        v31 = 0;
        id v9 = v13;
        goto LABEL_21;
      }
      v14 = [(PHAPrivateFederatedLearningModelTrainer *)self trainingData];
      id v37 = v13;
      uint64_t v15 = [v14 dataPointAtIndex:v10 error:&v37];
      id v9 = v37;

      if (!v15) {
        break;
      }
      int v16 = [(PHAPrivateFederatedLearningModelTrainer *)self modelInferenceOutputName];
      int v17 = [v12 objectForKeyedSubscript:v16];

      if (v17)
      {
        v18 = [(PHAPrivateFederatedLearningModelTrainer *)self labelName];
        v19 = [v15 objectForKeyedSubscript:v18];

        BOOL v20 = [(PHAPrivateFederatedLearningModelTrainer *)self _trueLabelTensor:v19 isEqualToPredictionTensor:v17];
        v21 = [(PHAPrivateFederatedLearningModelTrainer *)self lossName];
        v22 = [v12 objectForKeyedSubscript:v21];

        if (v22)
        {
          int v23 = 0;
          float v11 = v11 + *(float *)[v22 dataPointer];
        }
        else
        {
          +[PHAPrivateFederatedLearningModelTrainer _generateError:a4 errorCode:10 message:@"Loss output tensor is nil" underlyingError:0];
          int v23 = 1;
        }
        v36 += v20;

        id v5 = v33;
      }
      else
      {
        +[PHAPrivateFederatedLearningModelTrainer _generateError:a4 errorCode:9 message:@"Prediction output tensor is nil" underlyingError:0];
        int v23 = 1;
      }

      if (v23) {
        goto LABEL_20;
      }
      ++v10;
      unint64_t v8 = v35;
      if (v35 == v10) {
        goto LABEL_15;
      }
    }
    +[PHAPrivateFederatedLearningModelTrainer _generateError:a4 errorCode:8 message:@"Training data point is nil." underlyingError:v9];

LABEL_20:
    v31 = 0;
  }
  else
  {
    id v9 = 0;
    unint64_t v36 = 0;
    float v11 = 0.0;
LABEL_15:
    *(float *)&double v7 = v11;
    v24 = [NSNumber numberWithFloat:v7];
    *(float *)&double v25 = (float)v36;
    v26 = [NSNumber numberWithFloat:v25];
    if (v8)
    {
      *(float *)&double v27 = v11 / (float)v8;
      uint64_t v28 = [NSNumber numberWithFloat:v27];

      *(float *)&double v29 = (float)v36 / (float)v8;
      uint64_t v30 = [NSNumber numberWithFloat:v29];

      v24 = (void *)v28;
      v26 = (void *)v30;
    }
    v39[0] = @"loss";
    v39[1] = @"accuracy";
    v40[0] = v24;
    v40[1] = v26;
    v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:2];
  }
LABEL_21:

  return v31;
}

- (int)_argmax:(float *)a3 size:(int)a4
{
  float __C = -3.4028e38;
  vDSP_Length v5 = -1;
  vDSP_maxvi(a3, 1, &__C, &v5, a4);
  return v5;
}

- (id)_getParamsFromTask:(id)a3 forLayers:(id)a4 error:(id *)a5
{
  id v6 = a3;
  id v7 = a4;
  id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([v7 count])
  {
    uint64_t v8 = 0;
    id v22 = v7;
    while (1)
    {
      id v9 = [v7 objectAtIndexedSubscript:v8];
      id v26 = 0;
      uint64_t v10 = [v6 getParameterOfType:1 forLayerNamed:v9 error:&v26];
      id v11 = v26;
      if (v10)
      {
        id v25 = 0;
        uint64_t v12 = [v6 getParameterOfType:2 forLayerNamed:v9 error:&v25];
        id v13 = v25;
        if (v12)
        {
          id v14 = v6;
          uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F71ED0]) initWithDataTensor:v10];
          int v16 = (void *)[objc_alloc(MEMORY[0x1E4F71ED0]) initWithDataTensor:v12];
          int v17 = [[PHAPrivateFederatedLearningLayerParameters alloc] initWithWeights:v15 bias:v16];
          [v23 setObject:v17 atIndexedSubscript:v8];

          id v6 = v14;
          id v7 = v22;
          int v18 = 0;
        }
        else
        {
          +[PHAPrivateFederatedLearningModelTrainer _generateError:a5 errorCode:3 message:@"Error during espresso training variables (bias) definition" underlyingError:v13];
          int v18 = 1;
        }
      }
      else
      {
        +[PHAPrivateFederatedLearningModelTrainer _generateError:a5 errorCode:3 message:@"Error during espresso training variables (weights) definition" underlyingError:v11];
        int v18 = 1;
      }

      if (v18) {
        break;
      }
      if (++v8 >= (unint64_t)[v7 count]) {
        goto LABEL_11;
      }
    }
    id v20 = 0;
    v19 = v23;
  }
  else
  {
LABEL_11:
    v19 = v23;
    id v20 = v23;
  }

  return v20;
}

- (id)trainForNumberOfEpochs:(unint64_t)a3 layersToTrain:(id)a4 verbose:(BOOL)a5 error:(id *)a6
{
  v64[1] = *MEMORY[0x1E4F143B8];
  id v46 = a4;
  id v9 = objc_alloc(MEMORY[0x1E4F611B0]);
  uint64_t v10 = [(PHAPrivateFederatedLearningModelTrainer *)self espressoFileURL];
  id v62 = 0;
  id v11 = (void *)[v9 initWithInferenceNetworkPath:v10 error:&v62];
  id v45 = v62;

  if (v11)
  {
    id v61 = 0;
    v44 = (void *)[objc_alloc(MEMORY[0x1E4F611D8]) initForLayers:v46 error:&v61];
    id v12 = v61;
    v42 = v12;
    if (v44)
    {
      id v13 = objc_alloc(MEMORY[0x1E4F611D0]);
      id v14 = [(PHAPrivateFederatedLearningModelTrainer *)self lossDefinition];
      uint64_t v15 = [(PHAPrivateFederatedLearningModelTrainer *)self optimizerDefinition];
      id v60 = 0;
      v43 = (void *)[v13 initWithModelDefinition:v11 lossDefinition:v14 variablesDefinition:v44 optimizerDefinition:v15 forPlatform:1 error:&v60];
      id v40 = v60;

      if (v43)
      {
        int v16 = [(PHAPrivateFederatedLearningModelTrainer *)self _getParamsFromTask:v43 forLayers:v46 error:a6];
        if (v16)
        {
          id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          *(void *)buf = 0;
          v55 = buf;
          uint64_t v56 = 0x3032000000;
          v57 = __Block_byref_object_copy__5219;
          v58 = __Block_byref_object_dispose__5220;
          id v59 = 0;
          aBlock[0] = MEMORY[0x1E4F143A8];
          aBlock[1] = 3221225472;
          aBlock[2] = __94__PHAPrivateFederatedLearningModelTrainer_trainForNumberOfEpochs_layersToTrain_verbose_error___block_invoke_184;
          aBlock[3] = &unk_1E6917F88;
          aBlock[4] = self;
          v52 = buf;
          BOOL v53 = a5;
          id v37 = v17;
          id v50 = v37;
          id v38 = v18;
          id v51 = v38;
          v39 = _Block_copy(aBlock);
          trainingData = self->_trainingData;
          uint64_t v63 = *MEMORY[0x1E4F61188];
          id v20 = _Block_copy(v39);
          v64[0] = v20;
          v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v64 forKeys:&v63 count:1];
          id v48 = 0;
          LOBYTE(trainingData) = [v43 doTrainingOnData:trainingData forNumberOfEpochs:a3 withCallback:v21 error:&v48];
          id v36 = v48;

          if (trainingData)
          {
            id v22 = [(PHAPrivateFederatedLearningModelTrainer *)self _getParamsFromTask:v43 forLayers:v46 error:a6];
            if (v22)
            {
              id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              for (unint64_t i = 0; i < [v16 count]; ++i)
              {
                id v25 = [v16 objectAtIndexedSubscript:i];
                id v26 = [v22 objectAtIndexedSubscript:i];
                double v27 = +[PHAPrivateFederatedLearningLayerParameterDeltas deltasFromLayerParameters:v26 toLayerParameters:v25];
                [v23 setObject:v27 atIndexedSubscript:i];
              }
              v32 = [PHAPrivateFederatedLearningModelTrainerResponse alloc];
              id v33 = [(PHAPrivateFederatedLearningModelTrainer *)self trainingData];
              uint64_t v28 = -[PHAPrivateFederatedLearningModelTrainerResponse initWithParameterDeltas:trainingLossesPerEpoch:trainingAccuraciesPerEpoch:trainingEpochs:numberOfTrainingSamples:](v32, "initWithParameterDeltas:trainingLossesPerEpoch:trainingAccuraciesPerEpoch:trainingEpochs:numberOfTrainingSamples:", v23, v37, v38, a3, [v33 numberOfDataPoints]);
            }
            else
            {
              if (__PXLog_genericOnceToken != -1) {
                dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_196);
              }
              v34 = __PXLog_genericOSLog;
              if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)v47 = 0;
                _os_log_error_impl(&dword_1D21F2000, v34, OS_LOG_TYPE_ERROR, "Error retrieving trained weights and biases", v47, 2u);
              }
              uint64_t v28 = 0;
            }

            uint64_t v30 = v36;
          }
          else
          {
            uint64_t v30 = v36;
            if (*((void *)v55 + 5)) {
              id v31 = (id)*((void *)v55 + 5);
            }
            else {
              id v31 = v36;
            }
            +[PHAPrivateFederatedLearningModelTrainer _generateError:a6 errorCode:6 message:@"Error training espresso model" underlyingError:v31];
            uint64_t v28 = 0;
          }

          _Block_object_dispose(buf, 8);
        }
        else
        {
          if (__PXLog_genericOnceToken != -1) {
            dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_5218);
          }
          double v29 = __PXLog_genericOSLog;
          if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1D21F2000, v29, OS_LOG_TYPE_ERROR, "Error retrieving original weights and biases", buf, 2u);
          }
          uint64_t v28 = 0;
        }
      }
      else
      {
        +[PHAPrivateFederatedLearningModelTrainer _generateError:a6 errorCode:5 message:@"Error creating espresso task definition" underlyingError:v40];
        uint64_t v28 = 0;
      }
    }
    else
    {
      +[PHAPrivateFederatedLearningModelTrainer _generateError:a6 errorCode:3 message:@"Error during espresso training variables definition" underlyingError:v12];
      uint64_t v28 = 0;
    }
  }
  else
  {
    +[PHAPrivateFederatedLearningModelTrainer _generateError:a6 errorCode:2 message:@"Error during espresso model definition" underlyingError:v45];
    uint64_t v28 = 0;
  }

  return v28;
}

BOOL __94__PHAPrivateFederatedLearningModelTrainer_trainForNumberOfEpochs_layersToTrain_verbose_error___block_invoke_184(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  vDSP_Length v5 = *(void **)(a1 + 32);
  id v20 = 0;
  id v6 = [v5 _averageLossAndAccuracyForBatchResults:a3 error:&v20];
  id v7 = v20;
  uint64_t v8 = v7;
  if (v6)
  {
    if (*(unsigned char *)(a1 + 64))
    {
      if (__PXLog_genericOnceToken != -1) {
        dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_186);
      }
      id v9 = (void *)__PXLog_genericOSLog;
      if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_ERROR))
      {
        id v17 = v9;
        id v18 = [v6 objectForKeyedSubscript:@"loss"];
        v19 = [v6 objectForKeyedSubscript:@"accuracy"];
        *(_DWORD *)buf = 134218498;
        uint64_t v22 = a2;
        __int16 v23 = 2112;
        v24 = v18;
        __int16 v25 = 2112;
        id v26 = v19;
        _os_log_error_impl(&dword_1D21F2000, v17, OS_LOG_TYPE_ERROR, "Epoch %lu: Loss: %@, Accuracy: %@", buf, 0x20u);
      }
    }
    uint64_t v10 = *(void **)(a1 + 40);
    id v11 = [v6 objectForKeyedSubscript:@"loss"];
    [v10 addObject:v11];

    id v12 = *(void **)(a1 + 48);
    id v13 = [v6 objectForKeyedSubscript:@"accuracy"];
    [v12 addObject:v13];
  }
  else
  {
    uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
    id v15 = v7;
    id v13 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v15;
  }

  return v6 != 0;
}

uint64_t __94__PHAPrivateFederatedLearningModelTrainer_trainForNumberOfEpochs_layersToTrain_verbose_error___block_invoke_194()
{
  __PXLog_genericOSLog = (uint64_t)os_log_create("com.apple.photoanalysisd", "generic");

  return MEMORY[0x1F41817F8]();
}

uint64_t __94__PHAPrivateFederatedLearningModelTrainer_trainForNumberOfEpochs_layersToTrain_verbose_error___block_invoke_2()
{
  __PXLog_genericOSLog = (uint64_t)os_log_create("com.apple.photoanalysisd", "generic");

  return MEMORY[0x1F41817F8]();
}

uint64_t __94__PHAPrivateFederatedLearningModelTrainer_trainForNumberOfEpochs_layersToTrain_verbose_error___block_invoke()
{
  __PXLog_genericOSLog = (uint64_t)os_log_create("com.apple.photoanalysisd", "generic");

  return MEMORY[0x1F41817F8]();
}

- (PHAPrivateFederatedLearningModelTrainer)initWithTrainingData:(id)a3 espressoFileURL:(id)a4 learningRate:(id)a5 modelInputName:(id)a6 modelOutputName:(id)a7 lossName:(id)a8 optimizerName:(id)a9 error:(id *)a10
{
  void v39[2] = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v35 = a4;
  id v18 = a5;
  id v34 = a6;
  id v33 = a7;
  id v36 = a8;
  id v19 = a9;
  v37.receiver = self;
  v37.super_class = (Class)PHAPrivateFederatedLearningModelTrainer;
  id v20 = [(PHAPrivateFederatedLearningModelTrainer *)&v37 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_trainingData, a3);
    objc_storeStrong((id *)&v21->_espressoFileURL, a4);
    labelName = v21->_labelName;
    v21->_labelName = (NSString *)@"label";

    objc_storeStrong((id *)&v21->_inputName, a6);
    objc_storeStrong((id *)&v21->_modelOutputName, a7);
    objc_storeStrong((id *)&v21->_lossName, a8);
    objc_storeStrong((id *)&v21->_optimizerName, a9);
    objc_storeStrong((id *)&v21->_modelInferenceOutputName, a7);
    __int16 v23 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v17, "numberOfDataPoints"));
    if ([(NSString *)v21->_lossName isEqualToString:@"mse"])
    {
      uint64_t v24 = [MEMORY[0x1E4F611A8] L2LossWithInputName:v21->_modelOutputName targetInputName:v21->_labelName lossOutputName:v21->_lossName];
    }
    else
    {
      if ([(NSString *)v21->_lossName isEqualToString:@"cross_entropy"]) {
        [MEMORY[0x1E4F611A8] crossEntropyLossWithInputName:v21->_modelOutputName targetInputName:v21->_labelName lossOutputName:v21->_lossName];
      }
      else {
      uint64_t v24 = [MEMORY[0x1E4F611A8] BuiltInLoss:v36];
      }
    }
    lossDefinition = v21->_lossDefinition;
    v21->_lossDefinition = (ETLossDefinition *)v24;

    uint64_t v26 = *MEMORY[0x1E4F61508];
    v38[0] = *MEMORY[0x1E4F614E8];
    v38[1] = v26;
    v39[0] = v23;
    v39[1] = v18;
    uint64_t v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:2];
    if (![(NSString *)v21->_optimizerName isEqualToString:@"sgd"])
    {
      id v31 = [NSString stringWithFormat:@"Optimizer '%@' is not supported.", v19];
      +[PHAPrivateFederatedLearningModelTrainer _generateError:a10 errorCode:4 message:v31 underlyingError:0];

      uint64_t v30 = 0;
      goto LABEL_12;
    }
    uint64_t v28 = [objc_alloc(MEMORY[0x1E4F611C0]) initWithOptimizationAlgorithm:0 parameters:v27 error:a10];
    optimizerDefinition = v21->_optimizerDefinition;
    v21->_optimizerDefinition = (ETOptimizerDefinition *)v28;
  }
  uint64_t v30 = v21;
LABEL_12:

  return v30;
}

+ (void)_generateError:(id *)a3 errorCode:(int64_t)a4 message:(id)a5 underlyingError:(id)a6
{
  id v9 = a6;
  if (a3)
  {
    uint64_t v10 = (objc_class *)MEMORY[0x1E4F1CA60];
    id v13 = v9;
    id v11 = a5;
    id v12 = objc_alloc_init(v10);
    [v12 setObject:v11 forKey:*MEMORY[0x1E4F28568]];

    if (v13) {
      [v12 setObject:v13 forKey:*MEMORY[0x1E4F28A50]];
    }
    *a3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.PhotoAnalysis.PHAPrivateFederatedLearningModelTrainer" code:a4 userInfo:v12];

    id v9 = v13;
  }
}

@end