@interface SDLipMovementVAD
- (LipMovementVADDelegate)delegate;
- (SDLipMovementVAD)initWithModelFile:(id)a3;
- (double)visualSpeechProbability;
- (void)addFaceTrackingData:(id)a3 atMachAbsTime:(unint64_t)a4;
- (void)reset;
- (void)runModel;
- (void)setDelegate:(id)a3;
- (void)setupBlendshapeIndexArray;
@end

@implementation SDLipMovementVAD

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_blendshapeLocationToIndexMap, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_lipMovementVADModel, 0);
  objc_storeStrong((id *)&self->_configFile, 0);
  objc_storeStrong((id *)&self->_lipMovementDataArray, 0);
}

- (void)setDelegate:(id)a3
{
}

- (LipMovementVADDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (LipMovementVADDelegate *)WeakRetained;
}

- (double)visualSpeechProbability
{
  return self->_visualSpeechProbability;
}

- (void)reset
{
}

- (void)runModel
{
  v79[3] = *MEMORY[0x263EF8340];
  id v70 = 0;
  v67 = (void *)[objc_alloc(MEMORY[0x263F00DA8]) initWithShape:&unk_26CFDB508 dataType:65568 error:&v70];
  id v62 = v70;
  v3 = [&unk_26CFDB520 objectAtIndexedSubscript:1];
  int v4 = [v3 intValue];

  if (v4 >= 1)
  {
    uint64_t v5 = 0;
    v6 = &unk_26CFDB538;
    unint64_t v7 = 0x267D46000uLL;
    v8 = &unk_26CFDB4C0;
    unint64_t v9 = 0x263F08000uLL;
    unint64_t v10 = 0x263EFF000uLL;
    v66 = self;
    do
    {
      v11 = [v6 objectAtIndexedSubscript:2];
      int v12 = [v11 intValue];

      if (v12 >= 1)
      {
        uint64_t v13 = 0;
        do
        {
          blendshapeLocationToIndexMap = self->_blendshapeLocationToIndexMap;
          v15 = [*(id *)(v7 + 384) objectAtIndexedSubscript:v13];
          v16 = [(NSMutableDictionary *)blendshapeLocationToIndexMap objectForKeyedSubscript:v15];

          v17 = [(NSMutableArray *)self->_lipMovementDataArray objectAtIndex:v5];
          [v17 blendshapes];
          v19 = v18 = v6;
          v20 = objc_msgSend(v19, "objectAtIndex:", (int)objc_msgSend(v16, "intValue"));

          v79[0] = v8;
          v21 = [*(id *)(v9 + 2584) numberWithInt:v5];
          v79[1] = v21;
          v22 = [*(id *)(v9 + 2584) numberWithInt:v13];
          v79[2] = v22;
          [*(id *)(v10 + 2240) arrayWithObjects:v79 count:3];
          unint64_t v23 = v9;
          uint64_t v24 = v5;
          v26 = v25 = v8;

          v6 = v18;
          self = v66;
          unint64_t v7 = 0x267D46000;
          [v67 setObject:v20 forKeyedSubscript:v26];

          ++v13;
          v27 = [v6 objectAtIndexedSubscript:2];
          LODWORD(v16) = [v27 intValue];

          v8 = v25;
          uint64_t v5 = v24;
          unint64_t v9 = v23;
          unint64_t v10 = 0x263EFF000;
        }
        while (v13 < (int)v16);
      }
      ++v5;
      v28 = [&unk_26CFDB520 objectAtIndexedSubscript:1];
      int v29 = [v28 intValue];
    }
    while (v5 < v29);
  }
  v30 = [MEMORY[0x263EFF9A0] dictionary];
  [v30 setObject:v67 forKey:@"input_1"];
  id v69 = 0;
  uint64_t v31 = [objc_alloc(MEMORY[0x263F00D38]) initWithDictionary:v30 error:&v69];
  id v64 = v69;
  v65 = (void *)v31;
  lipMovementVADModel = self->_lipMovementVADModel;
  options = self->_options;
  id v68 = v62;
  v34 = [(MLModel *)lipMovementVADModel predictionFromFeatures:v31 options:options error:&v68];
  id v35 = v68;

  if (v35)
  {
    v36 = SDLogContextFacilityLocalSRBridge;
    if (os_log_type_enabled((os_log_t)SDLogContextFacilityLocalSRBridge, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v72 = "-[SDLipMovementVAD runModel]";
      __int16 v73 = 2114;
      double v74 = *(double *)&v35;
      _os_log_error_impl(&dword_21E886000, v36, OS_LOG_TYPE_ERROR, "%s Error when running inference for LipMovementVAD: %{public}@", buf, 0x16u);
    }
  }
  v63 = v35;
  v61 = [v34 featureValueForName:@"Identity_1"];
  v60 = [v61 multiArrayValue];
  v37 = [v60 objectForKeyedSubscript:&unk_26CFDB550];
  [v37 floatValue];
  float v39 = v38;

  double v40 = v39;
  self->_visualSpeechProbability = v39;
  v41 = [v34 featureValueForName:@"Identity"];
  v42 = [v41 multiArrayValue];
  v43 = [v42 objectForKeyedSubscript:&unk_26CFDB568];
  [v43 floatValue];
  float v45 = v44;

  v46 = [v42 objectForKeyedSubscript:&unk_26CFDB580];
  [v46 floatValue];
  float v48 = v47;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v50 = WeakRetained;
    v51 = v30;
    id v52 = objc_loadWeakRetained((id *)&self->_delegate);
    char v53 = objc_opt_respondsToSelector();

    v30 = v51;
    if (v53)
    {
      v54 = [(NSMutableArray *)self->_lipMovementDataArray firstObject];
      uint64_t v55 = [v54 absMachTime];

      v56 = [(NSMutableArray *)self->_lipMovementDataArray lastObject];
      uint64_t v57 = [v56 absMachTime];

      id v58 = objc_loadWeakRetained((id *)&self->_delegate);
      [v58 didUpdateVisualSpeechProbability:v55 from:v57 to:self->_visualSpeechProbability];

      v30 = v51;
    }
  }
  v59 = SDLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)SDLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v72 = "-[SDLipMovementVAD runModel]";
    __int16 v73 = 2048;
    double v74 = v40;
    __int16 v75 = 2048;
    double v76 = v48;
    __int16 v77 = 2048;
    double v78 = v45;
    _os_log_impl(&dword_21E886000, v59, OS_LOG_TYPE_DEFAULT, "%s LipMovementVAD ran prediction, output is: %f. Probability of speech: %f, Probability of no speech: %f", buf, 0x2Au);
  }
}

- (void)addFaceTrackingData:(id)a3 atMachAbsTime:(unint64_t)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  v8 = [v6 objectForKeyedSubscript:*MEMORY[0x263F26A98]];
  unint64_t v9 = [v8 objectForKeyedSubscript:*MEMORY[0x263F26928]];
  unint64_t v10 = [v9 objectForKeyedSubscript:*MEMORY[0x263F26930]];

  if (v10 && [v10 length] == 204)
  {
    uint64_t v11 = [v10 bytes];
    for (uint64_t i = 0; i != 204; i += 4)
    {
      LODWORD(v12) = *(_DWORD *)(v11 + i);
      v14 = [NSNumber numberWithFloat:v12];
      [v7 addObject:v14];
    }
  }
  else
  {
    if (v6)
    {
      v15 = SDLogContextFacilityLocalSRBridge;
      if (os_log_type_enabled((os_log_t)SDLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
      {
        int v23 = 136315394;
        uint64_t v24 = "-[SDLipMovementVAD addFaceTrackingData:atMachAbsTime:]";
        __int16 v25 = 2114;
        v26 = v10;
        _os_log_impl(&dword_21E886000, v15, OS_LOG_TYPE_DEFAULT, "%s Received nonnul metadata object from AppleCVA, but nil blendshapes or unexpected amount of blendshapes. Blendshape object: %{public}@", (uint8_t *)&v23, 0x16u);
      }
    }
    if ([(NSMutableArray *)self->_lipMovementDataArray count])
    {
      for (uint64_t j = 0; j != 51; ++j)
      {
        v17 = [(NSMutableArray *)self->_lipMovementDataArray lastObject];
        v18 = [v17 blendshapes];
        v19 = [v18 objectAtIndex:j];

        [v7 addObject:v19];
      }
    }
    else
    {
      int v20 = 51;
      do
      {
        [v7 addObject:&unk_26CFDB4C0];
        --v20;
      }
      while (v20);
    }
  }
  lipMovementDataArray = self->_lipMovementDataArray;
  v22 = [[LipMovementData alloc] initWithBlendshape:v7 andTime:a4];
  [(NSMutableArray *)lipMovementDataArray addObject:v22];

  --self->_framesToNextPrediction;
  if ([(NSMutableArray *)self->_lipMovementDataArray count] == 16) {
    [(NSMutableArray *)self->_lipMovementDataArray removeObjectAtIndex:0];
  }
  if ([(NSMutableArray *)self->_lipMovementDataArray count] == 15 && !self->_framesToNextPrediction)
  {
    self->_framesToNextPrediction = 6;
    [(SDLipMovementVAD *)self runModel];
  }
}

- (void)setupBlendshapeIndexArray
{
  v6[5] = 0;
  CVAFaceTrackingCopySemantics();
  v3 = [0 objectForKeyedSubscript:*MEMORY[0x263F26940]];
  int v4 = (NSMutableDictionary *)objc_opt_new();
  blendshapeLocationToIndexMap = self->_blendshapeLocationToIndexMap;
  self->_blendshapeLocationToIndexMap = v4;

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __45__SDLipMovementVAD_setupBlendshapeIndexArray__block_invoke;
  v6[3] = &unk_2644CC9E0;
  v6[4] = self;
  [v3 enumerateObjectsUsingBlock:v6];
}

void __45__SDLipMovementVAD_setupBlendshapeIndexArray__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = NSNumber;
  id v6 = a2;
  id v7 = [v5 numberWithUnsignedInteger:a3];
  [*(id *)(*(void *)(a1 + 32) + 48) setObject:v7 forKeyedSubscript:v6];
}

- (SDLipMovementVAD)initWithModelFile:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)SDLipMovementVAD;
  id v6 = [(SDLipMovementVAD *)&v24 init];
  id v7 = v6;
  if (!v6) {
    goto LABEL_6;
  }
  if (!v5)
  {
    v18 = SDLogContextFacilityLocalSRBridge;
    if (os_log_type_enabled((os_log_t)SDLogContextFacilityLocalSRBridge, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v26 = "-[SDLipMovementVAD initWithModelFile:]";
      _os_log_error_impl(&dword_21E886000, v18, OS_LOG_TYPE_ERROR, "%s No path found for lip movement model.", buf, 0xCu);
    }
    goto LABEL_12;
  }
  v6->_framesToNextPrediction = 15;
  v6->_visualSpeechProbability = 0.0;
  v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  lipMovementDataArray = v7->_lipMovementDataArray;
  v7->_lipMovementDataArray = v8;

  objc_storeStrong((id *)&v7->_configFile, a3);
  [(SDLipMovementVAD *)v7 setupBlendshapeIndexArray];
  id v10 = objc_alloc_init(MEMORY[0x263F00D98]);
  [v10 setComputeUnits:0];
  uint64_t v11 = [NSURL fileURLWithPath:v7->_configFile];
  double v12 = (MLPredictionOptions *)objc_alloc_init(MEMORY[0x263F00DC8]);
  options = v7->_options;
  v7->_options = v12;

  id v23 = 0;
  uint64_t v14 = [MEMORY[0x263F00D80] modelWithContentsOfURL:v11 configuration:v10 error:&v23];
  id v15 = v23;
  lipMovementVADModel = v7->_lipMovementVADModel;
  v7->_lipMovementVADModel = (MLModel *)v14;

  if (!v7->_lipMovementVADModel || v15)
  {
    v19 = (void *)SDLogContextFacilityLocalSRBridge;
    if (os_log_type_enabled((os_log_t)SDLogContextFacilityLocalSRBridge, OS_LOG_TYPE_ERROR))
    {
      v21 = v19;
      v22 = [v15 localizedDescription];
      *(_DWORD *)buf = 136315650;
      v26 = "-[SDLipMovementVAD initWithModelFile:]";
      __int16 v27 = 2114;
      v28 = v11;
      __int16 v29 = 2114;
      v30 = v22;
      _os_log_error_impl(&dword_21E886000, v21, OS_LOG_TYPE_ERROR, "%s Failed to load LipMovementVAD model from %{public}@ with error: %{public}@", buf, 0x20u);
    }
LABEL_12:
    v17 = 0;
    goto LABEL_13;
  }

LABEL_6:
  v17 = v7;
LABEL_13:

  return v17;
}

@end