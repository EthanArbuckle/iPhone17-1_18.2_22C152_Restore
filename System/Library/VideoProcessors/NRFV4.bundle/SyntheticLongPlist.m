@interface SyntheticLongPlist
- (int)readBandData:(id)a3;
- (int)readPlist:(id)a3;
@end

@implementation SyntheticLongPlist

- (int)readBandData:(id)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  v4 = [a3 valueForKey:@"Bands"];
  if (v4)
  {
    v5 = (NSMutableArray *)objc_opt_new();
    bands = self->bands;
    self->bands = v5;

    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id obj = v4;
    uint64_t v7 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      v38 = v4;
      uint64_t v40 = *(void *)v42;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v42 != v40) {
            objc_enumerationMutation(obj);
          }
          v10 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          v11 = (id *)objc_opt_new();
          v12 = [GainValueArray alloc];
          v13 = [v10 objectForKeyedSubscript:@"LumaCutoff"];
          uint64_t v14 = [(GainValueArray *)v12 initWithArray:v13];
          id v15 = v11[1];
          v11[1] = (id)v14;

          v16 = [GainValueArray alloc];
          v17 = [v10 objectForKeyedSubscript:@"ChromaCutoff"];
          uint64_t v18 = [(GainValueArray *)v16 initWithArray:v17];
          id v19 = v11[2];
          v11[2] = (id)v18;

          v20 = [GainValueArray alloc];
          v21 = [v10 objectForKeyedSubscript:@"LumaEdgeCutoff"];
          uint64_t v22 = [(GainValueArray *)v20 initWithArray:v21];
          id v23 = v11[3];
          v11[3] = (id)v22;

          v24 = [GainValueArray alloc];
          v25 = [v10 objectForKeyedSubscript:@"ChromaEdgeCutoff"];
          uint64_t v26 = [(GainValueArray *)v24 initWithArray:v25];
          id v27 = v11[4];
          v11[4] = (id)v26;

          v28 = [GainValueArray alloc];
          v29 = [v10 objectForKeyedSubscript:@"AdaptiveBlackFusionBoostThreshold"];
          uint64_t v30 = [(GainValueArray *)v28 initWithArray:v29];
          id v31 = v11[5];
          v11[5] = (id)v30;

          v32 = [GainValueArray alloc];
          v33 = [v10 objectForKeyedSubscript:@"AdaptiveFusionReductionThreshold"];
          uint64_t v34 = [(GainValueArray *)v32 initWithArray:v33];
          id v35 = v11[6];
          v11[6] = (id)v34;

          if (([v11[1] isValid] & 1) == 0
            || ([v11[2] isValid] & 1) == 0
            || ([v11[3] isValid] & 1) == 0
            || ([v11[4] isValid] & 1) == 0
            || ([v11[5] isValid] & 1) == 0
            || ([v11[6] isValid] & 1) == 0)
          {
            FigDebugAssert3();
            int v36 = -73349;

            goto LABEL_18;
          }
          [(NSMutableArray *)self->bands addObject:v11];
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
        if (v8) {
          continue;
        }
        break;
      }
      int v36 = 0;
LABEL_18:
      v4 = v38;
    }
    else
    {
      int v36 = 0;
    }
  }
  else
  {
    FigDebugAssert3();
    int v36 = FigSignalErrorAt();
  }

  return v36;
}

- (int)readPlist:(id)a3
{
  id v4 = a3;
  if ([(SyntheticLongPlist *)self readBandData:v4])
  {
    FigDebugAssert3();
    int v29 = FigSignalErrorAt();
    goto LABEL_9;
  }
  v5 = [GainValueArray alloc];
  v6 = [v4 objectForKeyedSubscript:@"ShadowThreshold"];
  uint64_t v7 = [(GainValueArray *)v5 initWithArray:v6];
  shadowThreshold = self->shadowThreshold;
  self->shadowThreshold = v7;

  v9 = [GainValueArray alloc];
  v10 = [v4 objectForKeyedSubscript:@"BlackFusionBoost"];
  v11 = [(GainValueArray *)v9 initWithArray:v10];
  blackFusionBoost = self->blackFusionBoost;
  self->blackFusionBoost = v11;

  v13 = [GainValueArray alloc];
  uint64_t v14 = [v4 objectForKeyedSubscript:@"SigmaFactorR"];
  id v15 = [(GainValueArray *)v13 initWithArray:v14];
  sigmaFactorR = self->sigmaFactorR;
  self->sigmaFactorR = v15;

  v17 = [GainValueArray alloc];
  uint64_t v18 = [v4 objectForKeyedSubscript:@"SigmaFactorG"];
  id v19 = [(GainValueArray *)v17 initWithArray:v18];
  sigmaFactorG = self->sigmaFactorG;
  self->sigmaFactorG = v19;

  v21 = [GainValueArray alloc];
  uint64_t v22 = [v4 objectForKeyedSubscript:@"SigmaFactorB"];
  id v23 = [(GainValueArray *)v21 initWithArray:v22];
  sigmaFactorB = self->sigmaFactorB;
  self->sigmaFactorB = v23;

  v25 = [GainValueArray alloc];
  uint64_t v26 = [v4 objectForKeyedSubscript:@"DecayRate"];
  id v27 = [(GainValueArray *)v25 initWithArray:v26];
  sharpness = self->sharpness;
  self->sharpness = v27;

  self->useDeterministicShaders = objc_msgSend(v4, "cmi_BOOLValueForKey:defaultValue:found:", @"UsePixelWrites", 0, 0) ^ 1;
  if (![(GainValueArray *)self->shadowThreshold isValid])
  {
    int v29 = -73349;
LABEL_17:
    FigDebugAssert3();
    goto LABEL_9;
  }
  if (![(GainValueArray *)self->blackFusionBoost isValid])
  {
    int v29 = -73349;
    goto LABEL_17;
  }
  if (![(GainValueArray *)self->sigmaFactorR isValid])
  {
    int v29 = -73349;
    goto LABEL_17;
  }
  if (![(GainValueArray *)self->sigmaFactorG isValid])
  {
    int v29 = -73349;
    goto LABEL_17;
  }
  if (![(GainValueArray *)self->sigmaFactorB isValid])
  {
    int v29 = -73349;
    goto LABEL_17;
  }
  if (![(GainValueArray *)self->sharpness isValid])
  {
    int v29 = -73349;
    goto LABEL_17;
  }
  int v29 = 0;
LABEL_9:

  return v29;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->sharpness, 0);
  objc_storeStrong((id *)&self->sigmaFactorB, 0);
  objc_storeStrong((id *)&self->sigmaFactorG, 0);
  objc_storeStrong((id *)&self->sigmaFactorR, 0);
  objc_storeStrong((id *)&self->blackFusionBoost, 0);
  objc_storeStrong((id *)&self->shadowThreshold, 0);

  objc_storeStrong((id *)&self->bands, 0);
}

@end