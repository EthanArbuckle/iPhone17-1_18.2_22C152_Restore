@interface PISegmentationGating
+ (BOOL)isValidSegmentationScoreForDepth:(PISegmentationBimodalScore)a3;
+ (id)segmentationScoreRanges;
+ (unint64_t)gatingResultForSegmentationScores:(id)a3;
@end

@implementation PISegmentationGating

+ (id)segmentationScoreRanges
{
  if (segmentationScoreRanges_onceToken != -1) {
    dispatch_once(&segmentationScoreRanges_onceToken, &__block_literal_global_16430);
  }
  v2 = (void *)segmentationScoreRanges_ranges;
  return v2;
}

void __47__PISegmentationGating_segmentationScoreRanges__block_invoke()
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F28CB8] defaultManager];
  v1 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v2 = [v1 URLForResource:@"SegmentationScoreRanges" withExtension:@"plist"];
  v3 = [v2 path];
  char v4 = [v0 isReadableFileAtPath:v3];

  if (v4)
  {
    uint64_t v5 = +[PISegmentationGatingRanges loadFromURL:v2];
    v6 = (void *)segmentationScoreRanges_ranges;
    segmentationScoreRanges_ranges = v5;
  }
  else
  {
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_100);
    }
    v7 = *MEMORY[0x1E4F7A758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      v9 = v2;
      _os_log_error_impl(&dword_1A9680000, v7, OS_LOG_TYPE_ERROR, "Failed to load scoring configuration: %@", (uint8_t *)&v8, 0xCu);
    }
  }
}

+ (BOOL)isValidSegmentationScoreForDepth:(PISegmentationBimodalScore)a3
{
  float var2 = a3.var2;
  float var1 = a3.var1;
  float var0 = a3.var0;
  v34[3] = *MEMORY[0x1E4F143B8];
  v6 = [a1 segmentationScoreRanges];
  v33[0] = *MEMORY[0x1E4F8D1F8];
  *(float *)&double v7 = var0;
  int v8 = [NSNumber numberWithFloat:v7];
  v34[0] = v8;
  v33[1] = *MEMORY[0x1E4F8D1C8];
  *(float *)&double v9 = var1;
  uint64_t v10 = [NSNumber numberWithFloat:v9];
  v34[1] = v10;
  v33[2] = *MEMORY[0x1E4F8D1D0];
  *(float *)&double v11 = var2;
  v12 = [NSNumber numberWithFloat:v11];
  v34[2] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:3];

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v14 = v13;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v29;
    while (2)
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v29 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        v20 = objc_msgSend(v6, "rangeForKey:", v19, (void)v28);
        if (v20)
        {
          v21 = [v14 objectForKeyedSubscript:v19];
          [v21 doubleValue];
          double v23 = v22;

          [v20 depthMin];
          if (v23 + 0.00001 < v24 || ([v20 depthMax], v23 + -0.00001 > v25))
          {

            BOOL v26 = 0;
            goto LABEL_13;
          }
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }
  BOOL v26 = 1;
LABEL_13:

  return v26;
}

+ (unint64_t)gatingResultForSegmentationScores:(id)a3
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x1E4F8D160];
  v6 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8D160]];
  [v6 doubleValue];
  double v8 = v7;

  uint64_t v9 = *MEMORY[0x1E4F8D158];
  uint64_t v10 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8D158]];

  if (v10)
  {
    double v11 = [v4 objectForKeyedSubscript:v9];
    uint64_t v12 = [v11 integerValue];
  }
  else
  {
    uint64_t v12 = 0;
  }
  [MEMORY[0x1E4F8CCC8] cropScoreThresholdForClassification:v12];
  double v14 = v13;
  uint64_t v15 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8D180]];
  [v15 doubleValue];
  double v17 = v16;

  v18 = [a1 segmentationScoreRanges];
  if (v18)
  {
    double v19 = v14 + 0.00001;
    v20 = +[PIGlobalSettings globalSettings];
    [v20 segmentationManualGatingLenience];
    double v22 = v21;

    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    double v23 = [v18 scoreKeys];
    uint64_t v24 = [v23 countByEnumeratingWithState:&v68 objects:v73 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      double v66 = v19;
      uint64_t v67 = v12;
      uint64_t v26 = *(void *)v69;
      char v27 = 1;
      char v28 = 1;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v69 != v26) {
            objc_enumerationMutation(v23);
          }
          uint64_t v30 = *(void *)(*((void *)&v68 + 1) + 8 * i);
          long long v31 = objc_msgSend(v18, "rangeForKey:", v30, *(void *)&v66);
          v32 = [v4 objectForKeyedSubscript:v30];
          [v32 doubleValue];
          double v34 = v33;

          [v31 min];
          if (v34 + 0.00001 < v35 || ([v31 max], v34 + -0.00001 > v36)) {
            char v28 = 0;
          }
          v37 = [v31 withLenience:v22];
          [v37 manualMin];
          if (v34 + 0.00001 < v38 || ([v37 manualMax], v34 + -0.00001 > v39)) {
            char v27 = 0;
          }
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v68 objects:v73 count:16];
      }
      while (v25);

      uint64_t v40 = v17 >= v66 && v8 >= 0.5;
      if (v28) {
        v40 |= 2uLL;
      }
      uint64_t v12 = v67;
      if ((v27 & 1) == 0)
      {
LABEL_37:
        v50 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8D218]];
        int v51 = [v50 BOOLValue];

        if (v51) {
          v40 |= 8uLL;
        }
        v52 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8D220]];
        int v53 = [v52 BOOLValue];

        if (v53) {
          v40 |= 0x10uLL;
        }
        v54 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8D208]];
        [v54 doubleValue];
        double v56 = v55;

        if (v56 <= 0.0) {
          unint64_t v48 = v40;
        }
        else {
          unint64_t v48 = v40 | 0x20;
        }
        if ((unint64_t)(v12 - 1) <= 1)
        {
          v57 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8D228]];
          [v57 doubleValue];
          double v59 = v58;

          uint64_t v60 = *MEMORY[0x1E4F8D230];
          v61 = [v4 objectForKey:*MEMORY[0x1E4F8D230]];

          if (v61)
          {
            if (v59 <= 0.5)
            {
              v62 = [v4 objectForKeyedSubscript:v60];
              [v62 doubleValue];
              double v64 = v63;

              if (v64 <= 0.5) {
                goto LABEL_51;
              }
            }
          }
          else if (v59 <= 0.5)
          {
            goto LABEL_51;
          }
        }
        v48 |= 0x40uLL;
        goto LABEL_51;
      }
    }
    else
    {

      BOOL v49 = v17 >= v19 && v8 >= 0.5;
      uint64_t v40 = v49 | 2;
    }
    v40 |= 4uLL;
    goto LABEL_37;
  }
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_100);
  }
  v41 = *MEMORY[0x1E4F7A758];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A9680000, v41, OS_LOG_TYPE_INFO, "Unable to load scoring plist, using fallback", buf, 2u);
  }
  v42 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8D1F8]];
  [v42 doubleValue];
  BOOL v44 = v43 > 0.5;

  v45 = [v4 objectForKeyedSubscript:v5];
  [v45 doubleValue];
  double v47 = v46;

  unint64_t v48 = v47 > 0.5 && v44;
LABEL_51:

  return v48;
}

@end