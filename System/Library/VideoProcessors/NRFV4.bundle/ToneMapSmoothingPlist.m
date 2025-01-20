@interface ToneMapSmoothingPlist
- (ToneMapSmoothingPlist)init;
- (int)readPlist:(id)a3;
@end

@implementation ToneMapSmoothingPlist

- (ToneMapSmoothingPlist)init
{
  v6.receiver = self;
  v6.super_class = (Class)ToneMapSmoothingPlist;
  v2 = [(ToneMapSmoothingPlist *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    bands = v2->bands;
    v2->bands = v3;
  }
  return v2;
}

- (int)readPlist:(id)a3
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v53 = 0;
  v5 = [v4 objectForKeyedSubscript:@"Bands"];
  if (!v5)
  {
    int v47 = -73265;
    FigDebugAssert3();
LABEL_32:
    int v53 = v47;
    goto LABEL_29;
  }
  if ([(NSMutableArray *)self->bands count])
  {
    FigDebugAssert3();
    int v47 = -12782;
    goto LABEL_32;
  }
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v49 objects:v55 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v50;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v50 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v49 + 1) + 8 * i);
        v12 = objc_alloc_init(ToneMapSmoothingBandData);
        int v13 = [(ToneMapSmoothingBandData *)v12 readPlist:v11];
        int v53 = v13;
        if (v13)
        {
          int v47 = v13;
          FigDebugAssert3();

          goto LABEL_29;
        }
        [(NSMutableArray *)self->bands addObject:v12];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v49 objects:v55 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  char v54 = 0;
  int v14 = objc_msgSend(v4, "cmi_intValueForKey:defaultValue:found:", @"BaseIterations", 0, &v54);
  if (!v54) {
    int v53 = -73265;
  }
  self->baseIterations = v14;
  getFloatParameter(v4, @"MaskedAlpha", &v53);
  self->maskedAlpha = v15;
  getFloatParameter(v4, @"UnmaskedAlpha", &v53);
  self->unmaskedAlpha = v16;
  v17 = [v4 objectForKeyedSubscript:@"Feature1MaskedAlpha"];

  if (v17) {
    v18 = @"Feature1MaskedAlpha";
  }
  else {
    v18 = @"SkyMaskedAlpha";
  }
  getFloatParameter(v4, (uint64_t)v18, &v53);
  self->skyMaskedAlpha = v19;
  v20 = [GainValueArray alloc];
  v21 = [v4 objectForKeyedSubscript:@"MinGainRatio"];
  v22 = [(GainValueArray *)v20 initWithArray:v21];
  minGainRatio = self->minGainRatio;
  self->minGainRatio = v22;

  v24 = [GainValueArray alloc];
  v25 = [v4 objectForKeyedSubscript:@"MaskedLambda"];
  v26 = [(GainValueArray *)v24 initWithArray:v25];
  maskedLambda = self->maskedLambda;
  self->maskedLambda = v26;

  v28 = [GainValueArray alloc];
  v29 = [v4 objectForKeyedSubscript:@"UnmaskedLambda"];
  v30 = [(GainValueArray *)v28 initWithArray:v29];
  unmaskedLambda = self->unmaskedLambda;
  self->unmaskedLambda = v30;

  v32 = [v4 objectForKeyedSubscript:@"SkyMaskedLambda"];

  if (v32)
  {
    v33 = [GainValueArray alloc];
    v34 = @"SkyMaskedLambda";
LABEL_20:
    v36 = [v4 objectForKeyedSubscript:v34];
    v37 = [(GainValueArray *)v33 initWithArray:v36];
    skyMaskedLambda = self->skyMaskedLambda;
    self->skyMaskedLambda = v37;

    goto LABEL_21;
  }
  v35 = [v4 objectForKeyedSubscript:@"Feature1MaskedLambda"];

  if (v35)
  {
    v33 = [GainValueArray alloc];
    v34 = @"Feature1MaskedLambda";
    goto LABEL_20;
  }
LABEL_21:
  v39 = [GainValueArray alloc];
  v40 = [v4 objectForKeyedSubscript:@"LimitMaxGainForeground"];
  v41 = [(GainValueArray *)v39 initWithArray:v40];
  limitMaxGainForeground = self->limitMaxGainForeground;
  self->limitMaxGainForeground = v41;

  v43 = [GainValueArray alloc];
  v44 = [v4 objectForKeyedSubscript:@"LimitMaxGainBackground"];
  v45 = [(GainValueArray *)v43 initWithArray:v44];
  limitMaxGainBackground = self->limitMaxGainBackground;
  self->limitMaxGainBackground = v45;

  if (self->minGainRatio
    && self->maskedLambda
    && self->unmaskedLambda
    && self->skyMaskedLambda
    && self->limitMaxGainForeground
    && self->limitMaxGainBackground)
  {
    int v47 = v53;
  }
  else
  {
    FigDebugAssert3();
    int v47 = FigSignalErrorAt();
    int v53 = v47;
  }
LABEL_29:

  return v47;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->minGainRatio, 0);
  objc_storeStrong((id *)&self->skyMaskedLambda, 0);
  objc_storeStrong((id *)&self->unmaskedLambda, 0);
  objc_storeStrong((id *)&self->maskedLambda, 0);
  objc_storeStrong((id *)&self->limitMaxGainBackground, 0);
  objc_storeStrong((id *)&self->limitMaxGainForeground, 0);

  objc_storeStrong((id *)&self->bands, 0);
}

@end