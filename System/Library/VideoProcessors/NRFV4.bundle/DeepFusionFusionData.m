@interface DeepFusionFusionData
- (int)readPlist:(id)a3;
@end

@implementation DeepFusionFusionData

- (int)readPlist:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"EVM_EV0_motionThreshold"];
  [v5 floatValue];
  v30 = self;
  self->EVM_EV0_motionThreshold = v6;

  v7 = [v4 objectForKeyedSubscript:@"SIFRBands"];
  v29 = v4;
  v31 = [v4 objectForKeyedSubscript:@"NoSIFRBands"];
  v8 = objc_opt_new();
  v9 = objc_opt_new();
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v10 = v7;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v37;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v37 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v36 + 1) + 8 * i);
        v16 = objc_opt_new();
        int v17 = [v16 readPlist:v15];
        if (v17)
        {
          int v27 = v17;
          FigDebugAssert3();

          noSifrBands = v10;
          goto LABEL_20;
        }
        [v8 addObject:v16];
      }
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v36 objects:v41 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  objc_storeStrong((id *)&v30->sifrBands, v8);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  noSifrBands = v31;
  uint64_t v19 = [(NSArray *)noSifrBands countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v33;
    while (2)
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v33 != v21) {
          objc_enumerationMutation(noSifrBands);
        }
        uint64_t v23 = *(void *)(*((void *)&v32 + 1) + 8 * j);
        v24 = objc_opt_new();
        int v25 = [v24 readPlist:v23];
        if (v25)
        {
          int v27 = v25;
          FigDebugAssert3();

          goto LABEL_20;
        }
        [v9 addObject:v24];
      }
      uint64_t v20 = [(NSArray *)noSifrBands countByEnumeratingWithState:&v32 objects:v40 count:16];
      if (v20) {
        continue;
      }
      break;
    }
  }

  v26 = v9;
  int v27 = 0;
  noSifrBands = v30->noSifrBands;
  v30->noSifrBands = v26;
LABEL_20:

  return v27;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->noSifrBands, 0);

  objc_storeStrong((id *)&self->sifrBands, 0);
}

@end