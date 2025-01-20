@interface CIFilter(DataAdditionOverrides)
+ (CGColorSpace)reductionFilterExtractDataToDictionary:()DataAdditionOverrides dataExtractor:options:context:colorSpace:error:;
+ (id)autoRedEyeExtractDataToDictionary:()DataAdditionOverrides dataExtractor:options:context:colorSpace:error:;
+ (id)faceBalanceExtractDataToDictionary:()DataAdditionOverrides dataExtractor:options:context:colorSpace:error:;
+ (id)perspectiveExtractDataToDictionary:()DataAdditionOverrides dataExtractor:options:context:colorSpace:error:;
+ (id)straightenExtractDataToDictionary:()DataAdditionOverrides dataExtractor:options:context:colorSpace:error:;
+ (uint64_t)localLightExtractDataToDictionary:()DataAdditionOverrides dataExtractor:options:context:colorSpace:error:;
+ (uint64_t)localLightHDRExtractDataToDictionary:()DataAdditionOverrides dataExtractor:options:context:colorSpace:error:;
+ (uint64_t)smartColorExtractDataToDictionary:()DataAdditionOverrides dataExtractor:options:context:colorSpace:error:;
+ (uint64_t)smartColorHDRExtractDataToDictionary:()DataAdditionOverrides dataExtractor:options:context:colorSpace:error:;
+ (uint64_t)smartToneExtractDataToDictionary:()DataAdditionOverrides dataExtractor:options:context:colorSpace:error:;
+ (uint64_t)smartToneHDRExtractDataToDictionary:()DataAdditionOverrides dataExtractor:options:context:colorSpace:error:;
@end

@implementation CIFilter(DataAdditionOverrides)

+ (id)faceBalanceExtractDataToDictionary:()DataAdditionOverrides dataExtractor:options:context:colorSpace:error:
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v11) {
    id v13 = (id)[v11 mutableCopy];
  }
  else {
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  v14 = v13;
  uint64_t v15 = MEMORY[0x1E4F1CC28];
  [v13 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:*MEMORY[0x1E4F1E350]];
  [v14 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F1E338]];
  [v14 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F1E340]];
  [v14 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F1E370]];
  [v9 autoAdjustmentFiltersWithOptions:v14];
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = [v16 countByEnumeratingWithState:&v60 objects:v64 count:16];
  if (!v17)
  {
    id v21 = (id)MEMORY[0x1E4F1CC08];
    goto LABEL_31;
  }
  uint64_t v18 = v17;
  v55 = v14;
  id v56 = v12;
  id v57 = v11;
  id v58 = v10;
  id v59 = v9;
  uint64_t v19 = *(void *)v61;
  uint64_t v20 = *MEMORY[0x1E4F1E0C0];
  id v21 = (id)MEMORY[0x1E4F1CC08];
  while (2)
  {
    for (uint64_t i = 0; i != v18; ++i)
    {
      if (*(void *)v61 != v19) {
        objc_enumerationMutation(v16);
      }
      v23 = *(void **)(*((void *)&v60 + 1) + 8 * i);
      v24 = [v23 attributes];
      v25 = [v24 objectForKey:v20];

      if ([v25 isEqualToString:@"CIFaceBalance"])
      {
        id v21 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        v26 = [v23 valueForKey:@"inputOrigI"];
        if (v26) {
          [v21 setObject:v26 forKeyedSubscript:@"OrigI"];
        }
        v27 = [v23 valueForKey:@"inputOrigQ"];

        id v9 = v59;
        id v11 = v57;
        if (v27) {
          [v21 setObject:v27 forKeyedSubscript:@"OrigQ"];
        }
        v28 = [v23 valueForKey:@"inputStrength"];

        if (v28) {
          [v21 setObject:v28 forKeyedSubscript:@"Strength"];
        }
        v29 = [v23 valueForKey:@"inputWarmth"];

        if (v29) {
          [v21 setObject:&unk_1F004A560 forKeyedSubscript:@"Warmth"];
        }
        uint64_t v30 = [v21 objectForKeyedSubscript:@"OrigI"];
        if (!v30) {
          goto LABEL_29;
        }
        v31 = (void *)v30;
        uint64_t v32 = [v21 objectForKeyedSubscript:@"OrigQ"];
        if (v32)
        {
          v33 = (void *)v32;
          uint64_t v34 = [v21 objectForKeyedSubscript:@"Strength"];
          if (v34)
          {
            v35 = (void *)v34;
            v36 = [v21 objectForKeyedSubscript:@"Warmth"];

            if (v36)
            {
              v37 = [v21 objectForKeyedSubscript:@"Warmth"];
              [v37 floatValue];
              double v39 = v38;

              v40 = [v21 objectForKeyedSubscript:@"OrigI"];
              [v40 floatValue];
              double v42 = (1.0 - v39) * 0.07451 + v39 * 0.1333 - v41;
              v43 = [v21 objectForKeyedSubscript:@"Strength"];
              [v43 floatValue];
              double v45 = v42 * v44;

              v46 = [v21 objectForKeyedSubscript:@"OrigQ"];
              [v46 floatValue];
              double v48 = (1.0 - v39) * 0.02745 + v39 * 0.007843 - v47;
              v49 = [v21 objectForKeyedSubscript:@"Strength"];
              [v49 floatValue];
              double v51 = v48 * v50;

              v52 = [NSNumber numberWithDouble:(v45 + v51 * -0.2) * 4.0];
              [v21 setObject:v52 forKeyedSubscript:@"WarmTemp"];

              v53 = [NSNumber numberWithDouble:(v45 + v51 * 5.0) * 4.0];
              [v21 setObject:v53 forKeyedSubscript:@"WarmTint"];

              [v21 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"WarmFace"];
            }
            goto LABEL_29;
          }
        }
LABEL_29:

        id v10 = v58;
        goto LABEL_30;
      }
    }
    uint64_t v18 = [v16 countByEnumeratingWithState:&v60 objects:v64 count:16];
    if (v18) {
      continue;
    }
    break;
  }
  id v10 = v58;
  id v9 = v59;
  id v11 = v57;
LABEL_30:
  v14 = v55;
  id v12 = v56;
LABEL_31:

  return v21;
}

+ (id)autoRedEyeExtractDataToDictionary:()DataAdditionOverrides dataExtractor:options:context:colorSpace:error:
{
  v63[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a5;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v9 = MEMORY[0x1E4F1CC28];
  [v8 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:*MEMORY[0x1E4F1E350]];
  [v8 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F1E338]];
  [v8 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F1E340]];
  [v8 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F1E370]];
  uint64_t v10 = [v7 objectForKeyedSubscript:@"locationX"];
  if (v10)
  {
    id v11 = (void *)v10;
    uint64_t v12 = [v7 objectForKeyedSubscript:@"locationY"];
    if (v12)
    {
      id v13 = (void *)v12;
      v14 = [v7 objectForKeyedSubscript:@"touchDiameter"];

      if (v14)
      {
        [v6 extent];
        double v16 = v15;
        double v18 = v17;
        uint64_t v19 = [v7 objectForKeyedSubscript:@"locationX"];
        [v19 doubleValue];
        double v21 = v16 * v20;
        v22 = [v7 objectForKeyedSubscript:@"locationY"];
        [v22 doubleValue];
        double v24 = v18 * v23;

        v25 = [v7 objectForKeyedSubscript:@"touchDiameter"];
        [v25 doubleValue];
        double v27 = v26;

        v28 = [MEMORY[0x1E4F1E080] vectorWithX:v21 Y:v24];
        v62[0] = @"leftEye";
        v62[1] = @"leftEyeTouchSize";
        v63[0] = v28;
        v29 = [NSNumber numberWithDouble:v27];
        v63[1] = v29;
        uint64_t v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v63 forKeys:v62 count:2];

        long long v61 = v30;
        v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v61 count:1];
        [v8 setObject:v31 forKeyedSubscript:*MEMORY[0x1E4F1E348]];

        [v8 setObject:&unk_1F004A0B8 forKeyedSubscript:*MEMORY[0x1E4F1DFB0]];
        goto LABEL_7;
      }
    }
    else
    {
    }
  }
  uint64_t v32 = [v7 objectForKeyedSubscript:@"orientation"];
  [v8 setObject:v32 forKeyedSubscript:*MEMORY[0x1E4F1DFB0]];

LABEL_7:
  v33 = [v7 objectForKeyedSubscript:@"fullSizeImage"];
  if (v33) {
    [v8 setObject:v33 forKeyedSubscript:@"fullSizeImage"];
  }
  uint64_t v34 = [v7 objectForKeyedSubscript:@"properties"];

  if (v34)
  {
    v35 = [v7 objectForKeyedSubscript:@"properties"];
    uint64_t v36 = [v6 imageBySettingProperties:v35];

    id v6 = (id)v36;
  }
  [v6 autoAdjustmentFiltersWithOptions:v8];
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v37 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v38 = [v37 countByEnumeratingWithState:&v54 objects:v60 count:16];
  if (v38)
  {
    uint64_t v39 = v38;
    double v51 = v33;
    id v52 = v7;
    id v53 = v6;
    uint64_t v40 = *(void *)v55;
    uint64_t v41 = *MEMORY[0x1E4F1E0C0];
LABEL_13:
    uint64_t v42 = 0;
    while (1)
    {
      if (*(void *)v55 != v40) {
        objc_enumerationMutation(v37);
      }
      v43 = *(void **)(*((void *)&v54 + 1) + 8 * v42);
      float v44 = [v43 attributes];
      double v45 = [v44 objectForKey:v41];

      if ([v45 isEqualToString:@"CIRedEyeCorrections"]) {
        break;
      }

      if (v39 == ++v42)
      {
        uint64_t v39 = [v37 countByEnumeratingWithState:&v54 objects:v60 count:16];
        if (v39) {
          goto LABEL_13;
        }
        v46 = 0;
        float v47 = v37;
        id v7 = v52;
        id v6 = v53;
        v33 = v51;
        double v48 = (void *)MEMORY[0x1E4F1CC08];
        goto LABEL_25;
      }
    }
    float v47 = [v43 valueForKey:@"inputCorrectionInfo"];
    v46 = [v43 valueForKey:@"inputCameraModel"];

    if (!v47)
    {
      double v48 = (void *)MEMORY[0x1E4F1CC08];
      id v7 = v52;
      id v6 = v53;
      v33 = v51;
      goto LABEL_27;
    }
    v58[0] = @"inputCorrectionInfo";
    v58[1] = @"inputCameraModel";
    v49 = @"undefined";
    if (v46) {
      v49 = v46;
    }
    v59[0] = v47;
    v59[1] = v49;
    double v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v59 forKeys:v58 count:2];
    id v7 = v52;
    id v6 = v53;
    v33 = v51;
  }
  else
  {
    v46 = 0;
    double v48 = (void *)MEMORY[0x1E4F1CC08];
    float v47 = v37;
  }
LABEL_25:

LABEL_27:

  return v48;
}

+ (uint64_t)smartColorHDRExtractDataToDictionary:()DataAdditionOverrides dataExtractor:options:context:colorSpace:error:
{
  return [a3 smartColorHDRStatistics];
}

+ (uint64_t)localLightHDRExtractDataToDictionary:()DataAdditionOverrides dataExtractor:options:context:colorSpace:error:
{
  return [a3 localLightHDRStatisticsNoProxy];
}

+ (uint64_t)smartToneHDRExtractDataToDictionary:()DataAdditionOverrides dataExtractor:options:context:colorSpace:error:
{
  return [a3 smartToneHDRStatistics];
}

+ (uint64_t)smartColorExtractDataToDictionary:()DataAdditionOverrides dataExtractor:options:context:colorSpace:error:
{
  return [a3 smartColorStatistics];
}

+ (uint64_t)localLightExtractDataToDictionary:()DataAdditionOverrides dataExtractor:options:context:colorSpace:error:
{
  return [a3 localLightStatisticsNoProxy];
}

+ (uint64_t)smartToneExtractDataToDictionary:()DataAdditionOverrides dataExtractor:options:context:colorSpace:error:
{
  return [a3 smartToneStatistics];
}

+ (id)straightenExtractDataToDictionary:()DataAdditionOverrides dataExtractor:options:context:colorSpace:error:
{
  uint64_t v103 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  double v13 = *MEMORY[0x1E4F1DB28];
  double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v16 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  if (v11) {
    id v17 = (id)[v11 mutableCopy];
  }
  else {
    id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  double v18 = v17;
  uint64_t v19 = *MEMORY[0x1E4F1E350];
  double v20 = [v17 valueForKey:*MEMORY[0x1E4F1E350]];

  if (!v20) {
    [v18 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v19];
  }
  uint64_t v21 = *MEMORY[0x1E4F1E338];
  v22 = [v18 valueForKey:*MEMORY[0x1E4F1E338]];

  if (!v22) {
    [v18 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v21];
  }
  uint64_t v23 = *MEMORY[0x1E4F1E340];
  double v24 = [v18 valueForKey:*MEMORY[0x1E4F1E340]];

  if (!v24) {
    [v18 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:v23];
  }
  uint64_t v25 = *MEMORY[0x1E4F1E370];
  double v26 = [v18 valueForKey:*MEMORY[0x1E4F1E370]];

  if (!v26) {
    [v18 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:v25];
  }
  uint64_t v27 = *MEMORY[0x1E4F1E348];
  v28 = [v18 objectForKeyedSubscript:*MEMORY[0x1E4F1E348]];

  id v74 = v10;
  id v75 = v9;
  id v72 = v12;
  id v73 = v11;
  v71 = v18;
  if (v28)
  {
    v29 = [v18 objectForKeyedSubscript:v27];
    uint64_t v30 = [v29 firstObject];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      [v9 extent];
      uint64_t v77 = v32;
      long long v70 = v33;
      uint64_t v34 = objc_opt_new();
      long long v87 = 0u;
      long long v88 = 0u;
      long long v89 = 0u;
      long long v90 = 0u;
      id obj = [v18 objectForKeyedSubscript:v27];
      uint64_t v35 = [obj countByEnumeratingWithState:&v87 objects:v102 count:16];
      if (v35)
      {
        uint64_t v36 = v35;
        *(void *)&long long v37 = v77;
        *((void *)&v37 + 1) = v70;
        *(_OWORD *)v78 = v37;
        uint64_t v38 = *(void *)v88;
        do
        {
          for (uint64_t i = 0; i != v36; ++i)
          {
            if (*(void *)v88 != v38) {
              objc_enumerationMutation(obj);
            }
            uint64_t v40 = objc_msgSend(*(id *)(*((void *)&v87 + 1) + 8 * i), "objectForKeyedSubscript:", @"bounds", v70);
            float64x2_t v41 = *(float64x2_t *)(MEMORY[0x1E4F1DB28] + 16);
            float64x2_t v91 = *(float64x2_t *)MEMORY[0x1E4F1DB28];
            float64x2_t v92 = v41;
            [v40 getValue:&v91];
            float64x2_t v80 = vmulq_f64(*(float64x2_t *)v78, v91);
            float64x2_t v81 = vmulq_f64(*(float64x2_t *)v78, v92);
            v100 = @"bounds";
            uint64_t v42 = [MEMORY[0x1E4F29238] valueWithBytes:&v80 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
            v101 = v42;
            v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v101 forKeys:&v100 count:1];

            [v34 addObject:v43];
          }
          uint64_t v36 = [obj countByEnumeratingWithState:&v87 objects:v102 count:16];
        }
        while (v36);
      }

      [v18 setObject:v34 forKeyedSubscript:v27];
      id v10 = v74;
      id v12 = v72;
      id v11 = v73;
    }
  }
  float v44 = objc_msgSend(v9, "autoAdjustmentFiltersWithOptions:", v18, v70);
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  v79 = v44;
  double v45 = (void *)[v44 countByEnumeratingWithState:&v83 objects:v99 count:16];
  if (!v45)
  {
    float v47 = 0;
    double v60 = 0.0;
    goto LABEL_45;
  }
  v46 = 0;
  float v47 = 0;
  uint64_t v48 = *(void *)v84;
  uint64_t v49 = *MEMORY[0x1E4F1E0C0];
  do
  {
    for (j = 0; j != v45; j = (char *)j + 1)
    {
      if (*(void *)v84 != v48) {
        objc_enumerationMutation(v79);
      }
      double v51 = *(void **)(*((void *)&v83 + 1) + 8 * (void)j);
      id v52 = [v51 attributes];
      id v53 = [v52 objectForKey:v49];

      if ([v53 isEqualToString:@"CIAffineTransform"])
      {
        long long v54 = v46;
        v46 = v51;
        long long v55 = v47;
LABEL_31:
        id v56 = v51;

        float v47 = v55;
        goto LABEL_32;
      }
      if (v53)
      {
        long long v54 = v47;
        long long v55 = v51;
        if ([v53 isEqualToString:@"CICrop"]) {
          goto LABEL_31;
        }
      }
LABEL_32:
    }
    double v45 = (void *)[v79 countByEnumeratingWithState:&v83 objects:v99 count:16];
  }
  while (v45);
  double v45 = v46;
  if (v46)
  {
    long long v57 = [v46 valueForKey:@"inputTransform"];
    float64x2_t v58 = *(float64x2_t *)(MEMORY[0x1E4F1DAB8] + 16);
    float64x2_t v80 = *(float64x2_t *)MEMORY[0x1E4F1DAB8];
    float64x2_t v81 = v58;
    long long v82 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    [v57 getValue:&v80];
    float64x2_t v91 = v80;
    float64x2_t v92 = v81;
    uint64_t v96 = 0;
    long long v95 = 0u;
    long long v93 = v82;
    long long v94 = 0u;
    NUDecomposeAffineTransform((__n128 *)&v91, (uint64_t)&v94);
    double v59 = *(double *)&v95 * 180.0 / 3.14159265;
    if (v59 < 0.0) {
      double v59 = v59 + 360.0;
    }
    if (v59 <= 180.0) {
      double v60 = v59;
    }
    else {
      double v60 = v59 + -360.0;
    }
  }
  else
  {
    double v60 = 0.0;
  }
  id v10 = v74;
  id v9 = v75;
  id v12 = v72;
  id v11 = v73;
  double v18 = v71;
  if (v47)
  {
    long long v61 = [v47 valueForKey:@"inputRectangle"];
    [v61 CGRectValue];
    double v13 = v62;
    double v14 = v63;
    double v15 = v64;
    double v16 = v65;
  }
LABEL_45:
  v97[0] = @"straightenAngleInDegreesCCW";
  v66 = [NSNumber numberWithDouble:v60];
  v97[1] = @"autoCrop";
  v98[0] = v66;
  v67 = objc_msgSend(MEMORY[0x1E4F1E080], "vectorWithCGRect:", v13, v14, v15, v16);
  v98[1] = v67;
  v68 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v98 forKeys:v97 count:2];

  return v68;
}

+ (id)perspectiveExtractDataToDictionary:()DataAdditionOverrides dataExtractor:options:context:colorSpace:error:
{
  v44[9] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a5;
  uint64_t v40 = v7;
  float64x2_t v41 = v6;
  if (objc_opt_respondsToSelector())
  {
    id v8 = [v6 autoPerspectiveResultWithOptions:v7];
    id v9 = [v8 objectForKeyedSubscript:@"filter"];
    uint64_t v10 = [v8 objectForKeyedSubscript:@"confidence"];
    if (NUIsAppleInternal_onceToken != -1) {
      dispatch_once(&NUIsAppleInternal_onceToken, &__block_literal_global_18);
    }
    if (NUIsAppleInternal_isAppleInternal)
    {
      uint64_t v11 = [v8 objectForKeyedSubscript:@"debugImage"];
    }
    else
    {
      uint64_t v11 = 0;
    }
    uint64_t v13 = [v8 objectForKeyedSubscript:@"pitchCorrectionAreaCoverage"];
    double v14 = [v8 objectForKeyedSubscript:@"yawCorrectionAreaCoverage"];
    uint64_t v12 = [v8 objectForKeyedSubscript:@"pitchFailureReason"];
    uint64_t v42 = [v8 objectForKeyedSubscript:@"yawFailureReason"];

    if (v9)
    {
LABEL_12:
      uint64_t v19 = [v9 valueForKey:@"inputPitch"];
      [v19 doubleValue];
      double v17 = v20 * 57.2957795;

      uint64_t v21 = [v9 valueForKey:@"inputYaw"];
      [v21 doubleValue];
      double v16 = v22 * 57.2957795;

      uint64_t v23 = [v9 valueForKey:@"inputRoll"];
      [v23 doubleValue];
      double v15 = v24 * 57.2957795;

      goto LABEL_13;
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      double v14 = 0;
      uint64_t v13 = 0;
      uint64_t v42 = 0;
      double v18 = 0;
      uint64_t v11 = 0;
      uint64_t v10 = 0;
      double v15 = 0.0;
      double v16 = 0.0;
      double v17 = 0.0;
      goto LABEL_14;
    }
    id v9 = [v6 autoPerspectiveFilterWithOptions:v7];
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    uint64_t v42 = 0;
    uint64_t v13 = 0;
    double v14 = 0;
    if (v9) {
      goto LABEL_12;
    }
  }
  double v15 = 0.0;
  double v16 = 0.0;
  double v17 = 0.0;
LABEL_13:
  double v18 = (void *)v12;
LABEL_14:
  v43[0] = @"pitchExpandTopDegrees";
  uint64_t v38 = [NSNumber numberWithDouble:v17];
  v44[0] = v38;
  v43[1] = @"yawExpandLeftDegrees";
  long long v37 = [NSNumber numberWithDouble:v16];
  v44[1] = v37;
  v43[2] = @"rollAngleInDegreesCW";
  uint64_t v36 = [NSNumber numberWithDouble:v15];
  v44[2] = v36;
  v43[3] = @"confidence";
  uint64_t v25 = (void *)v10;
  uint64_t v39 = (void *)v10;
  if (!v10)
  {
    uint64_t v25 = [MEMORY[0x1E4F1CA98] null];
  }
  v44[3] = v25;
  v43[4] = @"debugImage";
  double v26 = (void *)v11;
  uint64_t v27 = (void *)v11;
  if (!v11)
  {
    double v26 = [MEMORY[0x1E4F1CA98] null];
  }
  v44[4] = v26;
  v43[5] = @"pitchCorrectionAreaCoverage";
  v28 = (void *)v13;
  v29 = (void *)v13;
  if (!v13)
  {
    v28 = [MEMORY[0x1E4F1CA98] null];
  }
  v44[5] = v28;
  v43[6] = @"yawCorrectionAreaCoverage";
  uint64_t v30 = v14;
  if (!v14)
  {
    uint64_t v30 = [MEMORY[0x1E4F1CA98] null];
  }
  v31 = v18;
  if (v18) {
    uint64_t v32 = v18;
  }
  else {
    uint64_t v32 = &unk_1F004A0A0;
  }
  v44[6] = v30;
  v44[7] = v32;
  v43[7] = @"ciPitchError";
  v43[8] = @"ciYawError";
  long long v33 = v42;
  if (!v42) {
    long long v33 = &unk_1F004A0A0;
  }
  v44[8] = v33;
  uint64_t v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:v43 count:9];
  if (v14)
  {
    if (v29) {
      goto LABEL_29;
    }
LABEL_36:

    if (v27) {
      goto LABEL_30;
    }
    goto LABEL_37;
  }

  if (!v29) {
    goto LABEL_36;
  }
LABEL_29:
  if (v27) {
    goto LABEL_30;
  }
LABEL_37:

LABEL_30:
  if (!v39) {

  }
  return v34;
}

+ (CGColorSpace)reductionFilterExtractDataToDictionary:()DataAdditionOverrides dataExtractor:options:context:colorSpace:error:
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  double v17 = [MEMORY[0x1E4F1E040] filterWithName:v14];
  double v18 = v17;
  if (v17)
  {
    if (v15) {
      [v17 setValuesForKeysWithDictionary:v15];
    }
    [v18 setValue:v13 forKey:*MEMORY[0x1E4F1E480]];
    uint64_t v19 = (void *)MEMORY[0x1E4F1E080];
    [v13 extent];
    double v20 = objc_msgSend(v19, "vectorWithCGRect:");
    [v18 setValue:v20 forKey:@"inputExtent"];

    uint64_t v21 = [v18 valueForKey:@"outputImage"];
    if (!v21)
    {
      if (a8)
      {
        v29 = +[NUError invalidError:@"unable to obtain outputImage" object:v18];
LABEL_29:
        a7 = 0;
        *a8 = v29;
        goto LABEL_35;
      }
LABEL_34:
      a7 = 0;
      goto LABEL_35;
    }
    if (!v16) {
      id v16 = (id)[objc_alloc(MEMORY[0x1E4F1E018]) initWithOptions:&unk_1F004A2F8];
    }
    float32x4_t v57 = 0uLL;
    if (CGColorSpaceGetType() == 1)
    {
      a7 = (CGColorSpace *)[v13 colorSpace];
      if (!a7)
      {
        a7 = (CGColorSpace *)[v16 workingColorSpace];
        if (!a7)
        {
          double v22 = NUAssertLogger_18326();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            uint64_t v23 = [NSString stringWithFormat:@"colorspace is nil, image: %@, context: %@", v13, v16];
            *(_DWORD *)buf = 138543362;
            *(void *)&buf[4] = v23;
            _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
          }
          specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          uint64_t v25 = NUAssertLogger_18326();
          BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
          if (specific)
          {
            if (v26)
            {
              float v44 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
              double v45 = (void *)MEMORY[0x1E4F29060];
              id v46 = v44;
              float v47 = [v45 callStackSymbols];
              uint64_t v48 = [v47 componentsJoinedByString:@"\n"];
              *(_DWORD *)buf = 138543618;
              *(void *)&buf[4] = v44;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v48;
              _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
            }
          }
          else if (v26)
          {
            uint64_t v27 = [MEMORY[0x1E4F29060] callStackSymbols];
            v28 = [v27 componentsJoinedByString:@"\n"];
            *(_DWORD *)buf = 138543362;
            *(void *)&buf[4] = v28;
            _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
          }
          _NUAssertFailHandler((uint64_t)"+[CIFilter(DataAdditionOverrides) reductionFilterExtractDataToDictionary:dataExtractor:options:context:colorSpace:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/CoreImageDataAdditions.m", 167, @"colorspace is nil, image: %@, context: %@", v49, v50, v51, v52, (uint64_t)v13);
        }
      }
    }
    else if (!a7)
    {
      id v38 = objc_alloc(MEMORY[0x1E4F1E070]);
      uint64_t v39 = (void *)[v38 initWithBitmapData:&v57 width:1 height:1 bytesPerRow:16 format:*MEMORY[0x1E4F1E2F8]];
      [v39 setClamped:0];
      [v39 setColorSpace:0];
      [v39 setAlphaMode:0];
      uint64_t v40 = objc_msgSend(v16, "startTaskToRender:fromRect:toDestination:atPoint:error:", v21, v39, a8, 0.0, 0.0, 1.0, 1.0, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
      if (!v40)
      {

        goto LABEL_34;
      }
      float64x2_t v41 = v40;
      uint64_t v30 = v13;
      uint64_t v42 = [v40 waitUntilCompletedAndReturnError:a8];

      a7 = 0;
      if (!v42)
      {
        id v13 = v30;
        goto LABEL_35;
      }
      id v53 = a8;
      id v31 = v16;
      int v32 = 1;
      goto LABEL_21;
    }
    id v53 = a8;
    uint64_t v30 = v13;
    id v31 = v16;
    objc_msgSend(v16, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v21, &v57, 16, *MEMORY[0x1E4F1E2F8], a7, 0.0, 0.0, 1.0, 1.0);
    int v32 = 0;
LABEL_21:
    *(float64x2_t *)buf = vcvtq_f64_f32(*(float32x2_t *)v57.f32);
    *(float64x2_t *)&buf[16] = vcvt_hight_f64_f32(v57);
    long long v33 = +[NUColorSpace extendedSRGBLinearColorSpace];
    uint64_t v34 = [v33 CGColorSpace];

    uint64_t v35 = a7;
    id v13 = v30;
    if (v32)
    {
      uint64_t v35 = (CGColorSpace *)[v30 colorSpace];
      if (!v35) {
        uint64_t v35 = (CGColorSpace *)v34;
      }
    }
    CGColorRef v36 = CGColorCreate(v35, (const CGFloat *)buf);
    if (v36)
    {
      CGColorRef v37 = v36;
      long long v54 = @"color";
      CGColorRef v55 = v36;
      a7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v55 forKeys:&v54 count:1];

      id v16 = v31;
LABEL_35:

      goto LABEL_36;
    }
    id v16 = v31;
    a8 = v53;
    if (v53)
    {
      v29 = +[NUError failureError:@"couldn't create color" object:a7];
      goto LABEL_29;
    }
    goto LABEL_34;
  }
  if (a8)
  {
    +[NUError missingError:@"unknown extractor name" object:v14];
    a7 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    a7 = 0;
  }
LABEL_36:

  return a7;
}

@end