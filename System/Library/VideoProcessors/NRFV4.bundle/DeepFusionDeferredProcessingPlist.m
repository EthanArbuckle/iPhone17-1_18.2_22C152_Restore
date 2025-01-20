@interface DeepFusionDeferredProcessingPlist
- (id)addBackModulationBandsForModel:(int)a3;
- (id)chromaBoostBandsForModel:(int)a3 isSyntheticLongWithRealLong:(BOOL)a4;
- (id)darkEdgeSuppressionBandsForModel:(int)a3;
- (id)desaturationDataForModel:(int)a3;
- (id)fusionDataForModel:(int)a3;
- (id)haloSuppressionBandsForModel:(int)a3;
- (id)noiseTuningForModel:(int)a3;
- (int)modelForEIT:(float)a3;
- (int)readBandData:(id)a3 into:(id)a4;
- (int)readChromaBoostBandData:(id)a3 into:(id)a4 key:(id)a5;
- (int)readDarkEdgeSuppressionBandData:(id)a3 into:(id)a4;
- (int)readDesaturationData:(id)a3 into:(id)a4;
- (int)readHaloSuppressionBandData:(id)a3 into:(id)a4;
- (int)readPlist:(id)a3;
@end

@implementation DeepFusionDeferredProcessingPlist

- (int)readBandData:(id)a3 into:(id)a4
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  id v5 = a4;
  v6 = [a3 valueForKey:@"Bands"];
  v7 = v6;
  if (v6)
  {
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id obj = v6;
    uint64_t v8 = [obj countByEnumeratingWithState:&v66 objects:v70 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      v64 = v7;
      uint64_t v10 = *(void *)v67;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v67 != v10) {
            objc_enumerationMutation(obj);
          }
          v12 = *(void **)(*((void *)&v66 + 1) + 8 * i);
          v13 = (id *)objc_opt_new();
          v14 = [GainValueArray alloc];
          v15 = [v12 objectForKeyedSubscript:@"TextureFlatnessThreshold"];
          uint64_t v16 = [(GainValueArray *)v14 initWithArray:v15];
          id v17 = v13[1];
          v13[1] = (id)v16;

          v18 = [GainValueArray alloc];
          v19 = [v12 objectForKeyedSubscript:@"DeghostingYMinValue"];
          uint64_t v20 = [(GainValueArray *)v18 initWithArray:v19];
          id v21 = v13[2];
          v13[2] = (id)v20;

          v22 = [GainValueArray alloc];
          v23 = [v12 objectForKeyedSubscript:@"DeghostingUVMinValue"];
          uint64_t v24 = [(GainValueArray *)v22 initWithArray:v23];
          id v25 = v13[3];
          v13[3] = (id)v24;

          v26 = [GainValueArray alloc];
          v27 = [v12 objectForKeyedSubscript:@"SkinYSlope"];
          uint64_t v28 = [(GainValueArray *)v26 initWithArray:v27];
          id v29 = v13[4];
          v13[4] = (id)v28;

          v30 = [GainValueArray alloc];
          v31 = [v12 objectForKeyedSubscript:@"SkinUVSlope"];
          uint64_t v32 = [(GainValueArray *)v30 initWithArray:v31];
          id v33 = v13[5];
          v13[5] = (id)v32;

          v34 = [GainValueArray alloc];
          v35 = [v12 objectForKeyedSubscript:@"SkyLumaSlope"];
          uint64_t v36 = [(GainValueArray *)v34 initWithArray:v35];
          id v37 = v13[6];
          v13[6] = (id)v36;

          v38 = [GainValueArray alloc];
          v39 = [v12 objectForKeyedSubscript:@"YSlope"];
          uint64_t v40 = [(GainValueArray *)v38 initWithArray:v39];
          id v41 = v13[7];
          v13[7] = (id)v40;

          v42 = [GainValueArray alloc];
          v43 = [v12 objectForKeyedSubscript:@"YAlpha"];
          uint64_t v44 = [(GainValueArray *)v42 initWithArray:v43];
          id v45 = v13[8];
          v13[8] = (id)v44;

          v46 = [GainValueArray alloc];
          v47 = [v12 objectForKeyedSubscript:@"UVAlpha"];
          uint64_t v48 = [(GainValueArray *)v46 initWithArray:v47];
          id v49 = v13[9];
          v13[9] = (id)v48;

          if (![v5 count])
          {
            v50 = [GainValueArray alloc];
            v51 = [v12 objectForKeyedSubscript:@"TextureClippingThresholdLow"];
            uint64_t v52 = [(GainValueArray *)v50 initWithArray:v51];
            id v53 = v13[10];
            v13[10] = (id)v52;

            v54 = [GainValueArray alloc];
            v55 = [v12 objectForKeyedSubscript:@"TextureClippingThresholdHigh"];
            uint64_t v56 = [(GainValueArray *)v54 initWithArray:v55];
            id v57 = v13[11];
            v13[11] = (id)v56;

            v58 = [GainValueArray alloc];
            v59 = [v12 objectForKeyedSubscript:@"TextureShadingSuppressionInversePower"];
            uint64_t v60 = [(GainValueArray *)v58 initWithArray:v59];
            id v61 = v13[12];
            v13[12] = (id)v60;
          }
          if (([v13[1] isValid] & 1) == 0
            || ([v13[2] isValid] & 1) == 0
            || ([v13[3] isValid] & 1) == 0
            || ([v13[4] isValid] & 1) == 0
            || ([v13[5] isValid] & 1) == 0
            || ([v13[6] isValid] & 1) == 0
            || ([v13[7] isValid] & 1) == 0
            || ([v13[8] isValid] & 1) == 0
            || ([v13[9] isValid] & 1) == 0
            || ![v5 count]
            && (([v13[10] isValid] & 1) == 0
             || ([v13[11] isValid] & 1) == 0
             || ([v13[12] isValid] & 1) == 0))
          {
            FigDebugAssert3();
            int v62 = -73425;

            goto LABEL_27;
          }
          [v5 addObject:v13];
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v66 objects:v70 count:16];
        if (v9) {
          continue;
        }
        break;
      }
      int v62 = 0;
LABEL_27:
      v7 = v64;
    }
    else
    {
      int v62 = 0;
    }
  }
  else
  {
    FigDebugAssert3();
    int v62 = FigSignalErrorAt();
  }

  return v62;
}

- (int)readPlist:(id)a3
{
  v87[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v87[0] = @"ModelLowEIT";
  v87[1] = @"ModelHighEIT";
  id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v87 count:2];
  id obj = (id)objc_opt_new();
  id v79 = (id)objc_opt_new();
  id v69 = (id)objc_opt_new();
  id v68 = (id)objc_opt_new();
  id v67 = (id)objc_opt_new();
  id v66 = (id)objc_opt_new();
  id v65 = (id)objc_opt_new();
  id v64 = (id)objc_opt_new();
  v72 = v4;
  if (!v4)
  {
    FigDebugAssert3();
    int v60 = FigSignalErrorAt();
    v42 = 0;
    v43 = 0;
LABEL_49:
    uint64_t v9 = 0;
    id v61 = 0;
    v6 = 0;
    goto LABEL_36;
  }
  if ([v5 count] != 2)
  {
    FigDebugAssert3();
    int v60 = FigSignalErrorAt();
    v42 = 0;
    v43 = 0;
    id v4 = 0;
    goto LABEL_49;
  }
  v84.receiver = self;
  v84.super_class = (Class)DeepFusionDeferredProcessingPlist;
  [(CMITuningPlist *)&v84 readPlist:v4];
  v6 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  v77 = 0;
  uint64_t v10 = 0;
  v11 = 0;
  char v12 = 1;
  v63 = v5;
  do
  {
    v75 = v10;
    v76 = v8;
    char v13 = v12;
    v14 = [v5 objectAtIndexedSubscript:v7];
    v15 = [v72 objectForKeyedSubscript:v14];
    if (!v15)
    {
      FigDebugAssert3();
      int v60 = FigSignalErrorAt();
      id v4 = v77;
      goto LABEL_35;
    }
    v73 = v14;
    v74 = v11;
    uint64_t v16 = objc_opt_new();

    id v17 = [v15 objectForKeyedSubscript:@"AddBackModulation"];
    int v18 = [(DeepFusionDeferredProcessingPlist *)self readBandData:v17 into:v16];

    if (v18)
    {
      FigDebugAssert3();
      int v60 = FigSignalErrorAt();
      v6 = (void *)v16;
LABEL_33:
      id v4 = v77;
      goto LABEL_34;
    }
    char v71 = v13;
    v78 = v9;
    [obj addObject:v16];
    long long v82 = 0u;
    long long v83 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    v85[0] = @"SL_EV0_LONG";
    v85[1] = @"SL_EV0";
    v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v85 count:2];
    uint64_t v20 = [v19 countByEnumeratingWithState:&v80 objects:v86 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v81;
      v6 = (void *)v16;
      while (2)
      {
        uint64_t v23 = 0;
        uint64_t v24 = v6;
        do
        {
          if (*(void *)v81 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v25 = *(void *)(*((void *)&v80 + 1) + 8 * v23);
          v6 = objc_opt_new();

          v26 = [v15 objectForKeyedSubscript:@"ChromaBoost"];
          LODWORD(v25) = [(DeepFusionDeferredProcessingPlist *)self readChromaBoostBandData:v26 into:v6 key:v25];

          if (v25)
          {
            FigDebugAssert3();
            int v60 = FigSignalErrorAt();

            goto LABEL_32;
          }
          [v79 addObject:v6];
          ++v23;
          uint64_t v24 = v6;
        }
        while (v21 != v23);
        uint64_t v21 = [v19 countByEnumeratingWithState:&v80 objects:v86 count:16];
        if (v21) {
          continue;
        }
        break;
      }
    }
    else
    {
      v6 = (void *)v16;
    }

    v27 = objc_opt_new();
    uint64_t v28 = [v15 objectForKeyedSubscript:@"Desaturation"];
    int v29 = [(DeepFusionDeferredProcessingPlist *)self readDesaturationData:v28 into:v27];

    if (v29)
    {
      FigDebugAssert3();
      int v60 = FigSignalErrorAt();

LABEL_32:
      uint64_t v9 = v78;
      goto LABEL_33;
    }
    [v69 addObject:v27];
    v30 = objc_opt_new();

    v31 = [v15 objectForKeyedSubscript:@"NoiseTuning"];
    int v32 = [v30 readPlist:v31];

    v76 = v30;
    [v68 addObject:v30];
    uint64_t v9 = v78;
    if (v32) {
      goto LABEL_44;
    }
    id v33 = objc_opt_new();

    if (!v33)
    {
      FigDebugAssert3();
      int v60 = FigSignalErrorAt();

      uint64_t v9 = 0;
      goto LABEL_33;
    }
    uint64_t v9 = v33;
    v34 = [v15 objectForKeyedSubscript:@"Fusion"];
    int v35 = [v33 readPlist:v34];

    [v67 addObject:v9];
    if (v35) {
      goto LABEL_44;
    }
    uint64_t v36 = objc_opt_new();

    if (!v36)
    {
      FigDebugAssert3();
      int v60 = FigSignalErrorAt();

      id v4 = 0;
LABEL_34:
      v14 = v73;
      v11 = v74;
LABEL_35:

      v42 = v11;
      v43 = v75;
      id v61 = v76;
      id v5 = v63;
      goto LABEL_36;
    }
    id v37 = [v15 objectForKeyedSubscript:@"HighlightTuning"];
    int v38 = [v36 readPlist:v37];

    v77 = v36;
    [v66 addObject:v36];
    if (v38)
    {
LABEL_44:
      FigDebugAssert3();
      int v60 = FigSignalErrorAt();

      goto LABEL_33;
    }
    uint64_t v39 = objc_opt_new();

    uint64_t v40 = [v15 objectForKeyedSubscript:@"HaloSuppression"];
    int v41 = [(DeepFusionDeferredProcessingPlist *)self readHaloSuppressionBandData:v40 into:v39];

    if (v41)
    {
      FigDebugAssert3();
      int v60 = FigSignalErrorAt();

      v75 = (void *)v39;
      goto LABEL_33;
    }
    [v65 addObject:v39];
    v42 = objc_opt_new();

    [v15 objectForKeyedSubscript:@"DarkEdgeSuppression"];
    uint64_t v44 = v43 = (void *)v39;
    int v45 = [(DeepFusionDeferredProcessingPlist *)self readDarkEdgeSuppressionBandData:v44 into:v42];

    if (v45)
    {
      FigDebugAssert3();
      int v60 = FigSignalErrorAt();

      v11 = v42;
      v75 = v43;
      id v4 = v77;
      v14 = v73;
      goto LABEL_35;
    }
    [v64 addObject:v42];

    char v12 = 0;
    uint64_t v7 = 1;
    uint64_t v8 = v76;
    uint64_t v10 = v43;
    v11 = v42;
    id v5 = v63;
  }
  while ((v71 & 1) != 0);
  objc_storeStrong((id *)&self->addBackModulationBands, obj);
  objc_storeStrong((id *)&self->noiseTuning, v68);
  objc_storeStrong((id *)&self->fusionData, v67);
  objc_storeStrong((id *)&self->highlightTuning, v66);
  objc_storeStrong((id *)&self->chromaBoostMaskBands, v79);
  objc_storeStrong((id *)&self->desaturationData, v69);
  objc_storeStrong((id *)&self->haloSuppressionBands, v65);
  objc_storeStrong((id *)&self->darkEdgeSupressionBands, v64);
  v46 = [v72 objectForKeyedSubscript:@"ModelSwitchEITThreshold"];

  if (v46)
  {
    v47 = [v72 objectForKeyedSubscript:@"ModelSwitchEITThreshold"];
    [v47 floatValue];
    self->modelSwitchEITThreshold = v48;

    id v49 = [v72 objectForKeyedSubscript:@"DenseRegistrationMotionScoreThreshold"];

    if (!v49) {
      goto LABEL_51;
    }
    v50 = [v72 objectForKeyedSubscript:@"DenseRegistrationMotionScoreThreshold"];
    [v50 floatValue];
    self->denseRegistrationMotionScoreThreshold = v51;

    uint64_t v52 = [GainValueArray alloc];
    id v53 = [v72 objectForKeyedSubscript:@"EV0BlurThreshold"];
    v54 = [(GainValueArray *)v52 initWithArray:v53];
    EV0BlurThreshold = self->EV0BlurThreshold;
    self->EV0BlurThreshold = v54;

    if (![(GainValueArray *)self->EV0BlurThreshold isValid]) {
      goto LABEL_51;
    }
    uint64_t v56 = [GainValueArray alloc];
    id v57 = [v72 objectForKeyedSubscript:@"FilteredChromaAlpha"];
    v58 = [(GainValueArray *)v56 initWithArray:v57];
    filteredChromaAlpha = self->filteredChromaAlpha;
    self->filteredChromaAlpha = v58;

    if ([(GainValueArray *)self->filteredChromaAlpha isValid])
    {
      int v60 = 0;
    }
    else
    {
LABEL_51:
      FigDebugAssert3();
      int v60 = FigSignalErrorAt();
    }
    id v61 = v76;
    id v4 = v77;
  }
  else
  {
    FigDebugAssert3();
    int v60 = FigSignalErrorAt();
    id v61 = v76;
    id v4 = v77;
  }
LABEL_36:

  return v60;
}

- (int)readChromaBoostBandData:(id)a3 into:(id)a4 key:(id)a5
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v35 = a4;
  uint64_t v7 = [a3 objectForKeyedSubscript:a5];
  uint64_t v8 = v7;
  if (v7
    && ([v7 valueForKey:@"Bands"], (uint64_t v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id obj = v9;
    uint64_t v10 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v37;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v37 != v12) {
            objc_enumerationMutation(obj);
          }
          v14 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          v15 = (id *)objc_opt_new();
          uint64_t v16 = [GainValueArray alloc];
          id v17 = [v14 objectForKeyedSubscript:@"ColorMatchThresholdStart"];
          uint64_t v18 = [(GainValueArray *)v16 initWithArray:v17];
          id v19 = v15[1];
          v15[1] = (id)v18;

          uint64_t v20 = [GainValueArray alloc];
          uint64_t v21 = [v14 objectForKeyedSubscript:@"ColorMatchThresholdEnd"];
          uint64_t v22 = [(GainValueArray *)v20 initWithArray:v21];
          id v23 = v15[2];
          v15[2] = (id)v22;

          uint64_t v24 = [GainValueArray alloc];
          uint64_t v25 = [v14 objectForKeyedSubscript:@"EdgeMatchThresholdStart"];
          uint64_t v26 = [(GainValueArray *)v24 initWithArray:v25];
          id v27 = v15[3];
          v15[3] = (id)v26;

          uint64_t v28 = [GainValueArray alloc];
          int v29 = [v14 objectForKeyedSubscript:@"EdgeMatchThresholdEnd"];
          uint64_t v30 = [(GainValueArray *)v28 initWithArray:v29];
          id v31 = v15[4];
          v15[4] = (id)v30;

          if (([v15[1] isValid] & 1) == 0
            || ([v15[2] isValid] & 1) == 0
            || ([v15[3] isValid] & 1) == 0
            || ([v15[4] isValid] & 1) == 0)
          {
            FigDebugAssert3();
            int v32 = -73425;

            goto LABEL_17;
          }
          [v35 addObject:v15];
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
        if (v11) {
          continue;
        }
        break;
      }
      int v32 = 0;
    }
    else
    {
      int v32 = 0;
    }
LABEL_17:
  }
  else
  {
    FigDebugAssert3();
    int v32 = FigSignalErrorAt();
  }

  return v32;
}

- (int)readHaloSuppressionBandData:(id)a3 into:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a4;
  v6 = [a3 valueForKey:@"Bands"];
  uint64_t v7 = v6;
  if (v6)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id obj = v6;
    uint64_t v8 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          char v13 = objc_opt_new();
          v14 = [GainValueArray alloc];
          v15 = [v12 objectForKeyedSubscript:@"HaloSuppressionStrength"];
          uint64_t v16 = [(GainValueArray *)v14 initWithArray:v15];
          id v17 = (void *)v13[1];
          v13[1] = v16;

          if (!v13[1])
          {
            int v18 = -73425;
            FigDebugAssert3();

            goto LABEL_13;
          }
          [v5 addObject:v13];
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v9) {
          continue;
        }
        break;
      }
      int v18 = 0;
    }
    else
    {
      int v18 = 0;
    }
LABEL_13:
  }
  else
  {
    FigDebugAssert3();
    int v18 = FigSignalErrorAt();
  }

  return v18;
}

- (int)readDesaturationData:(id)a3 into:(id)a4
{
  id v5 = a3;
  v6 = (id *)a4;
  if (!v5)
  {
    FigDebugAssert3();
    int v19 = FigSignalErrorAt();
    goto LABEL_6;
  }
  uint64_t v7 = [GainValueArray alloc];
  uint64_t v8 = [v5 objectForKeyedSubscript:@"YThresh"];
  uint64_t v9 = [(GainValueArray *)v7 initWithArray:v8];
  id v10 = v6[1];
  v6[1] = (id)v9;

  uint64_t v11 = [GainValueArray alloc];
  uint64_t v12 = [v5 objectForKeyedSubscript:@"Sigma"];
  uint64_t v13 = [(GainValueArray *)v11 initWithArray:v12];
  id v14 = v6[2];
  v6[2] = (id)v13;

  v15 = [GainValueArray alloc];
  uint64_t v16 = [v5 objectForKeyedSubscript:@"Strength"];
  uint64_t v17 = [(GainValueArray *)v15 initWithArray:v16];
  id v18 = v6[3];
  v6[3] = (id)v17;

  if (([v6[1] isValid] & 1) == 0)
  {
    int v19 = -73425;
LABEL_11:
    FigDebugAssert3();
    goto LABEL_6;
  }
  if (([v6[2] isValid] & 1) == 0)
  {
    int v19 = -73425;
    goto LABEL_11;
  }
  if (([v6[3] isValid] & 1) == 0)
  {
    int v19 = -73425;
    goto LABEL_11;
  }
  int v19 = 0;
LABEL_6:

  return v19;
}

- (int)readDarkEdgeSuppressionBandData:(id)a3 into:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v28 = a4;
  id v5 = [a3 valueForKey:@"Bands"];
  v6 = v5;
  if (v5)
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id obj = v5;
    uint64_t v7 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v30;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v30 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          uint64_t v12 = objc_opt_new();
          uint64_t v13 = [GainValueArray alloc];
          id v14 = [v11 objectForKeyedSubscript:@"DarkEdgeSuppressionLumaThresholdLow"];
          uint64_t v15 = [(GainValueArray *)v13 initWithArray:v14];
          uint64_t v16 = (void *)v12[2];
          v12[2] = v15;

          if (!v12[2]) {
            goto LABEL_14;
          }
          uint64_t v17 = [GainValueArray alloc];
          id v18 = [v11 objectForKeyedSubscript:@"DarkEdgeSuppressionLumaThresholdHigh"];
          uint64_t v19 = [(GainValueArray *)v17 initWithArray:v18];
          uint64_t v20 = (void *)v12[1];
          v12[1] = v19;

          if (!v12[1]) {
            goto LABEL_14;
          }
          long long v21 = [GainValueArray alloc];
          long long v22 = [v11 objectForKeyedSubscript:@"DarkEdgeSuppressionLumaDiffThreshold"];
          uint64_t v23 = [(GainValueArray *)v21 initWithArray:v22];
          long long v24 = (void *)v12[3];
          v12[3] = v23;

          if (!v12[3])
          {
LABEL_14:
            FigDebugAssert3();
            int v25 = -73425;

            goto LABEL_15;
          }
          [v28 addObject:v12];
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
        if (v8) {
          continue;
        }
        break;
      }
      int v25 = 0;
    }
    else
    {
      int v25 = 0;
    }
LABEL_15:
  }
  else
  {
    FigDebugAssert3();
    int v25 = FigSignalErrorAt();
  }

  return v25;
}

- (int)modelForEIT:(float)a3
{
  return self->modelSwitchEITThreshold <= a3;
}

- (id)addBackModulationBandsForModel:(int)a3
{
  if ([(NSArray *)self->addBackModulationBands count] <= a3)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = [(NSArray *)self->addBackModulationBands objectAtIndexedSubscript:a3];
  }

  return v5;
}

- (id)noiseTuningForModel:(int)a3
{
  if ([(NSArray *)self->noiseTuning count] <= a3)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = [(NSArray *)self->noiseTuning objectAtIndexedSubscript:a3];
  }

  return v5;
}

- (id)fusionDataForModel:(int)a3
{
  if ([(NSArray *)self->fusionData count] <= a3)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = [(NSArray *)self->fusionData objectAtIndexedSubscript:a3];
  }

  return v5;
}

- (id)chromaBoostBandsForModel:(int)a3 isSyntheticLongWithRealLong:(BOOL)a4
{
  unint64_t v5 = !a4 | (2 * a3);
  if (v5 >= [(NSArray *)self->chromaBoostMaskBands count])
  {
    v6 = 0;
  }
  else
  {
    v6 = [(NSArray *)self->chromaBoostMaskBands objectAtIndexedSubscript:v5];
  }

  return v6;
}

- (id)desaturationDataForModel:(int)a3
{
  if ([(NSArray *)self->desaturationData count] <= a3)
  {
    unint64_t v5 = 0;
  }
  else
  {
    unint64_t v5 = [(NSArray *)self->desaturationData objectAtIndexedSubscript:a3];
  }

  return v5;
}

- (id)haloSuppressionBandsForModel:(int)a3
{
  if ([(NSArray *)self->haloSuppressionBands count] <= a3)
  {
    unint64_t v5 = 0;
  }
  else
  {
    unint64_t v5 = [(NSArray *)self->haloSuppressionBands objectAtIndexedSubscript:a3];
  }

  return v5;
}

- (id)darkEdgeSuppressionBandsForModel:(int)a3
{
  if ([(NSArray *)self->darkEdgeSupressionBands count] <= a3)
  {
    unint64_t v5 = 0;
  }
  else
  {
    unint64_t v5 = [(NSArray *)self->darkEdgeSupressionBands objectAtIndexedSubscript:a3];
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->darkEdgeSupressionBands, 0);
  objc_storeStrong((id *)&self->haloSuppressionBands, 0);
  objc_storeStrong((id *)&self->desaturationData, 0);
  objc_storeStrong((id *)&self->chromaBoostMaskBands, 0);
  objc_storeStrong((id *)&self->highlightTuning, 0);
  objc_storeStrong((id *)&self->fusionData, 0);
  objc_storeStrong((id *)&self->noiseTuning, 0);
  objc_storeStrong((id *)&self->addBackModulationBands, 0);
  objc_storeStrong((id *)&self->filteredChromaAlpha, 0);

  objc_storeStrong((id *)&self->EV0BlurThreshold, 0);
}

@end