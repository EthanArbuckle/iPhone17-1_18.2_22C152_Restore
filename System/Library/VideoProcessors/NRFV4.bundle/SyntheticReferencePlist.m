@interface SyntheticReferencePlist
- (int)_readDeepShadowRecoveryBandData:(id)a3;
- (int)_readHighlightRecoveryBandData:(id)a3;
- (int)readPlist:(id)a3;
@end

@implementation SyntheticReferencePlist

- (int)_readHighlightRecoveryBandData:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  v3 = [a3 objectForKeyedSubscript:@"HighlightRecover"];
  v4 = v3;
  if (v3 && ([v3 valueForKey:@"Bands"], (uint64_t v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v6 = (void *)v5;
    v7 = (NSMutableArray *)objc_opt_new();
    highlightRecoveryBands = self->highlightRecoveryBands;
    self->highlightRecoveryBands = v7;

    if (self->highlightRecoveryBands)
    {
      v22 = v4;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id obj = v6;
      uint64_t v9 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v26;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v26 != v11) {
              objc_enumerationMutation(obj);
            }
            v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
            v14 = (_DWORD *)objc_opt_new();
            objc_msgSend(v13, "cmi_floatValueForKey:defaultValue:found:", @"Ev0SifrMatchThreshold", 0, 0.0);
            v14[2] = v15;
            objc_msgSend(v13, "cmi_floatValueForKey:defaultValue:found:", @"Ev0BrightnessSmoothStepStart", 0, 0.0);
            v14[3] = v16;
            objc_msgSend(v13, "cmi_floatValueForKey:defaultValue:found:", @"Ev0BrightnessSmoothStepEnd", 0, 0.0);
            v14[4] = v17;
            objc_msgSend(v13, "cmi_floatValueForKey:defaultValue:found:", @"SifrHighSnrSmoothStepStart", 0, 0.0);
            v14[5] = v18;
            objc_msgSend(v13, "cmi_floatValueForKey:defaultValue:found:", @"SifrHighSnrSmoothStepEnd", 0, 0.0);
            v14[6] = v19;
            [(NSMutableArray *)self->highlightRecoveryBands addObject:v14];
          }
          uint64_t v10 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
        }
        while (v10);
      }

      int v20 = 0;
      v4 = v22;
    }
    else
    {
      int v20 = -73349;
      FigDebugAssert3();
    }
  }
  else
  {
    FigDebugAssert3();
    int v20 = FigSignalErrorAt();
  }

  return v20;
}

- (int)readPlist:(id)a3
{
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)SyntheticReferencePlist;
  [(CMITuningPlist *)&v33 readPlist:v4];
  int v5 = [(SyntheticReferencePlist *)self _readHighlightRecoveryBandData:v4];
  if (v5)
  {
    int v31 = v5;
LABEL_8:
    FigDebugAssert3();
    goto LABEL_5;
  }
  int v6 = [(SyntheticReferencePlist *)self _readDeepShadowRecoveryBandData:v4];
  if (v6)
  {
    int v31 = v6;
    goto LABEL_8;
  }
  self->grayGhostingDetectionBand = objc_msgSend(v4, "cmi_intValueForKey:defaultValue:found:", @"GrayGhostingDetectionBand", 0, 0);
  objc_msgSend(v4, "cmi_floatValueForKey:defaultValue:found:", @"GrayGhostingCutoff", 0, 0.0);
  self->grayGhostingCutoff = v7;
  objc_msgSend(v4, "cmi_floatValueForKey:defaultValue:found:", @"GrayGhostingEV0EVMDifferenceThreshold", 0, 0.0);
  self->grayGhostingEV0EVMDifferenceThreshold = v8;
  objc_msgSend(v4, "cmi_floatValueForKey:defaultValue:found:", @"GrayGhostingEV0WeightThreshold", 0, 0.0);
  self->grayGhostingEV0WeightThreshold = v9;
  objc_msgSend(v4, "cmi_floatValueForKey:defaultValue:found:", @"GrayGhostingClippingThreshold", 0, 0.0);
  self->grayGhostingClippingThreshold = v10;
  uint64_t v11 = [GainValueArray alloc];
  v12 = [v4 objectForKeyedSubscript:@"SyntheticReferencePedestal"];
  v13 = [(GainValueArray *)v11 initWithArray:v12];
  syntheticReferencePedestal = self->syntheticReferencePedestal;
  self->syntheticReferencePedestal = v13;

  if ([(GainValueArray *)self->syntheticReferencePedestal isValid])
  {
    int v15 = [v4 objectForKeyedSubscript:@"MotionDetection"];
    LODWORD(v16) = 1040522936;
    objc_msgSend(v15, "cmi_floatValueForKey:defaultValue:found:", @"SifrEitCutoffHigh", 0, v16);
    p_motionDetectionTuningParams = &self->motionDetectionTuningParams;
    p_motionDetectionTuningParams->sifrEitCutoffHigh = v18;
    LODWORD(v19) = 990486567;
    objc_msgSend(v15, "cmi_floatValueForKey:defaultValue:found:", @"SifrEitCutoffLow", 0, v19);
    p_motionDetectionTuningParams->sifrEitCutoffLow = v20;
    LODWORD(v21) = 8.0;
    objc_msgSend(v15, "cmi_floatValueForKey:defaultValue:found:", @"ClippingCutoffHigh", 0, v21);
    p_motionDetectionTuningParams->clippingCutoffHigh = v22;
    LODWORD(v23) = 4.0;
    objc_msgSend(v15, "cmi_floatValueForKey:defaultValue:found:", @"ClippingCutoffLow", 0, v23);
    p_motionDetectionTuningParams->clippingCutoffLow = v24;
    LODWORD(v25) = 1120403456;
    objc_msgSend(v15, "cmi_floatValueForKey:defaultValue:found:", @"GradientCutoffHigh", 0, v25);
    p_motionDetectionTuningParams->gradientCutoffHigh = v26;
    LODWORD(v27) = 3.0;
    objc_msgSend(v15, "cmi_floatValueForKey:defaultValue:found:", @"Gamma", 0, v27);
    p_motionDetectionTuningParams->gamma = v28;
    LODWORD(v29) = 1035489772;
    objc_msgSend(v15, "cmi_floatValueForKey:defaultValue:found:", @"MotionCutoff", 0, v29);
    p_motionDetectionTuningParams->motionCutoff = v30;
    p_motionDetectionTuningParams->useFullImage = 0;

    int v31 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v31 = -73349;
  }
LABEL_5:

  return v31;
}

- (int)_readDeepShadowRecoveryBandData:(id)a3
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  v3 = [a3 objectForKeyedSubscript:@"DeepShadowRecover"];
  id v4 = v3;
  if (v3 && ([v3 valueForKey:@"Bands"], (uint64_t v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    int v6 = (void *)v5;
    float v7 = (NSMutableArray *)objc_opt_new();
    deepShadowRecoveryBands = self->deepShadowRecoveryBands;
    self->deepShadowRecoveryBands = v7;

    if (self->deepShadowRecoveryBands)
    {
      long long v66 = 0u;
      long long v67 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      id obj = v6;
      uint64_t v9 = [obj countByEnumeratingWithState:&v64 objects:v68 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        v60 = v4;
        uint64_t v62 = *(void *)v65;
        while (2)
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v65 != v62) {
              objc_enumerationMutation(obj);
            }
            v12 = *(void **)(*((void *)&v64 + 1) + 8 * i);
            v13 = (id *)objc_opt_new();
            v14 = [GainValueArray alloc];
            int v15 = [v12 objectForKeyedSubscript:@"Ev0DeepShadowSmoothStepStart"];
            uint64_t v16 = [(GainValueArray *)v14 initWithArray:v15];
            id v17 = v13[1];
            v13[1] = (id)v16;

            float v18 = [GainValueArray alloc];
            double v19 = [v12 objectForKeyedSubscript:@"Ev0DeepShadowSmoothStepEnd"];
            uint64_t v20 = [(GainValueArray *)v18 initWithArray:v19];
            id v21 = v13[2];
            v13[2] = (id)v20;

            float v22 = [GainValueArray alloc];
            double v23 = [v12 objectForKeyedSubscript:@"EdgeMatchThresholdStart"];
            uint64_t v24 = [(GainValueArray *)v22 initWithArray:v23];
            id v25 = v13[3];
            v13[3] = (id)v24;

            float v26 = [GainValueArray alloc];
            double v27 = [v12 objectForKeyedSubscript:@"EdgeMatchThresholdEnd"];
            uint64_t v28 = [(GainValueArray *)v26 initWithArray:v27];
            id v29 = v13[4];
            v13[4] = (id)v28;

            float v30 = [GainValueArray alloc];
            int v31 = [v12 objectForKeyedSubscript:@"ClrMatchThresholdStart"];
            uint64_t v32 = [(GainValueArray *)v30 initWithArray:v31];
            id v33 = v13[5];
            v13[5] = (id)v32;

            v34 = [GainValueArray alloc];
            v35 = [v12 objectForKeyedSubscript:@"ClrMatchThresholdEnd"];
            uint64_t v36 = [(GainValueArray *)v34 initWithArray:v35];
            id v37 = v13[6];
            v13[6] = (id)v36;

            v38 = [GainValueArray alloc];
            v39 = [v12 objectForKeyedSubscript:@"ShadowSigmaCorrectionNode0"];
            uint64_t v40 = [(GainValueArray *)v38 initWithArray:v39];
            id v41 = v13[7];
            v13[7] = (id)v40;

            v42 = [GainValueArray alloc];
            v43 = [v12 objectForKeyedSubscript:@"ShadowSigmaCorrectionNode1"];
            uint64_t v44 = [(GainValueArray *)v42 initWithArray:v43];
            id v45 = v13[8];
            v13[8] = (id)v44;

            v46 = [GainValueArray alloc];
            v47 = [v12 objectForKeyedSubscript:@"EdgeThresholdStart"];
            uint64_t v48 = [(GainValueArray *)v46 initWithArray:v47];
            id v49 = v13[9];
            v13[9] = (id)v48;

            v50 = [GainValueArray alloc];
            v51 = [v12 objectForKeyedSubscript:@"EdgeThresholdEnd"];
            uint64_t v52 = [(GainValueArray *)v50 initWithArray:v51];
            id v53 = v13[10];
            v13[10] = (id)v52;

            v54 = [GainValueArray alloc];
            v55 = [v12 objectForKeyedSubscript:@"EdgeGhostBoost"];
            uint64_t v56 = [(GainValueArray *)v54 initWithArray:v55];
            id v57 = v13[11];
            v13[11] = (id)v56;

            if (([v13[1] isValid] & 1) == 0
              || ([v13[2] isValid] & 1) == 0
              || ([v13[3] isValid] & 1) == 0
              || ([v13[4] isValid] & 1) == 0
              || ([v13[5] isValid] & 1) == 0
              || ([v13[6] isValid] & 1) == 0
              || ([v13[7] isValid] & 1) == 0
              || ([v13[8] isValid] & 1) == 0
              || ([v13[9] isValid] & 1) == 0
              || ([v13[10] isValid] & 1) == 0
              || ([v13[11] isValid] & 1) == 0)
            {
              FigDebugAssert3();
              int v58 = -73349;

              goto LABEL_25;
            }
            [(NSMutableArray *)self->deepShadowRecoveryBands addObject:v13];
          }
          uint64_t v10 = [obj countByEnumeratingWithState:&v64 objects:v68 count:16];
          if (v10) {
            continue;
          }
          break;
        }
        int v58 = 0;
LABEL_25:
        id v4 = v60;
      }
      else
      {
        int v58 = 0;
      }
      int v6 = obj;
    }
    else
    {
      int v58 = -73349;
      FigDebugAssert3();
    }
  }
  else
  {
    FigDebugAssert3();
    int v58 = FigSignalErrorAt();
  }

  return v58;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->syntheticReferencePedestal, 0);
  objc_storeStrong((id *)&self->deepShadowRecoveryBands, 0);

  objc_storeStrong((id *)&self->highlightRecoveryBands, 0);
}

@end