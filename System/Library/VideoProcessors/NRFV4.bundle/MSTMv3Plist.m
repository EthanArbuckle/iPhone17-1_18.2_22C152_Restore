@interface MSTMv3Plist
- (MSTMv3Plist)init;
- (int)readPlist:(id)a3;
@end

@implementation MSTMv3Plist

- (MSTMv3Plist)init
{
  v6.receiver = self;
  v6.super_class = (Class)MSTMv3Plist;
  v2 = [(MSTMv3Plist *)&v6 init];
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
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v27 = 0;
  v5 = [v4 objectForKeyedSubscript:@"Bands"];
  if (!v5)
  {
    int v21 = -73265;
    FigDebugAssert3();
LABEL_19:
    int v27 = v21;
    goto LABEL_16;
  }
  if ([(NSMutableArray *)self->bands count])
  {
    FigDebugAssert3();
    int v21 = -12782;
    goto LABEL_19;
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        v12 = objc_alloc_init(MSTMv3BandData);
        int v13 = [(MSTMv3BandData *)v12 readPlist:v11];
        int v27 = v13;
        if (v13)
        {
          int v21 = v13;
          FigDebugAssert3();

          goto LABEL_16;
        }
        [(NSMutableArray *)self->bands addObject:v12];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  getFloatParameter(v4, @"MaskedAlpha", &v27);
  self->maskedAlpha = v14;
  v15 = [GainValueArray alloc];
  v16 = [v4 objectForKeyedSubscript:@"MaskedLambda"];
  v17 = [(GainValueArray *)v15 initWithArray:v16];
  maskedLambda = self->maskedLambda;
  self->maskedLambda = v17;

  getFloatParameter(v4, @"SmoothingStrength", &v27);
  self->smoothingStrength = v19;
  getFloatParameter(v4, @"RatioPersonVsSkin", &v27);
  self->ratioPersonVsSkin = v20;
  if (!self->maskedLambda || self->maskedAlpha == 0.0 || self->smoothingStrength == 0.0)
  {
    FigDebugAssert3();
    int v21 = FigSignalErrorAt();
    int v27 = v21;
  }
  else
  {
    int v21 = v27;
  }
LABEL_16:

  return v21;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->maskedLambda, 0);

  objc_storeStrong((id *)&self->bands, 0);
}

@end