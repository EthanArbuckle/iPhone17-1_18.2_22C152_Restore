@interface PIAutoEnhanceFilter
+ (id)autoEnhanceCache;
+ (id)customAttributes;
- (CIImage)inputImage;
- (CIImage)inputTargetImage;
- (NSString)inputAlgorithm;
- (id)apertureAutoEnhanceFiltersForImage:(id)a3;
- (id)autoEnhanceFiltersForImage:(id)a3 algorithm:(id)a4;
- (id)colorNormalizationFiltersForImage:(id)a3;
- (id)outputImage;
- (id)photosAutoEnhanceFiltersForImage:(id)a3;
- (void)setInputAlgorithm:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputTargetImage:(id)a3;
@end

@implementation PIAutoEnhanceFilter

+ (id)autoEnhanceCache
{
  if (autoEnhanceCache_onceToken != -1) {
    dispatch_once(&autoEnhanceCache_onceToken, &__block_literal_global_7998);
  }
  v2 = (void *)autoEnhanceCache_cache;
  return v2;
}

uint64_t __39__PIAutoEnhanceFilter_autoEnhanceCache__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1C998]);
  v1 = (void *)autoEnhanceCache_cache;
  autoEnhanceCache_cache = (uint64_t)v0;

  v2 = (void *)autoEnhanceCache_cache;
  return [v2 setCountLimit:16];
}

+ (id)customAttributes
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v10 = @"inputAlgorithm";
  uint64_t v2 = *MEMORY[0x1E4F1E0F0];
  v9[0] = @"PIAttributeTypeMode";
  v8[0] = v2;
  v8[1] = @"PIAttributeAvailableModes";
  v7[0] = @"Aperture";
  v7[1] = @"Photos";
  v7[2] = @"ColorNorm";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];
  v8[2] = *MEMORY[0x1E4F1E098];
  v9[1] = v3;
  v9[2] = @"Aperture";
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];
  v11[0] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputAlgorithm, 0);
  objc_storeStrong((id *)&self->_inputTargetImage, 0);
  objc_storeStrong((id *)&self->_inputImage, 0);
}

- (void)setInputAlgorithm:(id)a3
{
}

- (NSString)inputAlgorithm
{
  return self->_inputAlgorithm;
}

- (void)setInputTargetImage:(id)a3
{
}

- (CIImage)inputTargetImage
{
  return self->_inputTargetImage;
}

- (void)setInputImage:(id)a3
{
}

- (CIImage)inputImage
{
  return self->_inputImage;
}

- (id)photosAutoEnhanceFiltersForImage:(id)a3
{
  v99[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = (void *)MEMORY[0x1E4F1E018];
  uint64_t v98 = *MEMORY[0x1E4F1E208];
  v99[0] = @"PIAutoEnhanceFilter";
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v99 forKeys:&v98 count:1];
  v6 = [v4 contextWithOptions:v5];

  id v85 = 0;
  v7 = [MEMORY[0x1E4F1E040] extractDataToDictionary:v3 dataExtractor:@"CILocalLight" options:0 context:v6 colorSpace:0 error:&v85];
  id v8 = v85;
  v9 = v8;
  if (v7)
  {
    id v84 = v8;
    v10 = [MEMORY[0x1E4F1E040] extractDataToDictionary:v3 dataExtractor:@"CISmartTone" options:0 context:v6 colorSpace:0 error:&v84];
    id v11 = v84;

    v12 = (void *)MEMORY[0x1E4F1E050];
    v13 = [v10 objectForKeyedSubscript:@"autoValue"];
    [v13 doubleValue];
    double v15 = v14;
    v81 = v7;
    [v7 objectForKeyedSubscript:@"localAutoValue"];
    v17 = id v16 = v3;
    [v17 doubleValue];
    v19 = [v12 smartToneAdjustmentsForValue:v10 localLightAutoValue:v15 andStatistics:v18];

    if (v10)
    {
      id v83 = v11;
      v20 = [MEMORY[0x1E4F1E040] extractDataToDictionary:v16 dataExtractor:@"CISmartColor" options:0 context:v6 colorSpace:0 error:&v83];
      id v21 = v83;

      v22 = (void *)MEMORY[0x1E4F1E050];
      v23 = [v20 objectForKeyedSubscript:@"satAutoValue"];
      [v23 doubleValue];
      v24 = objc_msgSend(v22, "smartColorAdjustmentsForValue:andStatistics:", v20);

      v25 = v20;
      id v3 = v16;
      if (v25)
      {
        id v82 = v21;
        v26 = [MEMORY[0x1E4F1E040] extractDataToDictionary:v16 dataExtractor:@"CIFaceBalance" options:0 context:v6 colorSpace:0 error:&v82];
        id v11 = v82;

        if (v26)
        {
          v79 = v24;
          v74 = v25;
          id v75 = v3;
          v73 = v10;
          id v76 = v11;
          id v80 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          v77 = v26;
          if ([v26 count])
          {
            v27 = (void *)MEMORY[0x1E4F1E040];
            v96[0] = @"inputOrigI";
            v28 = [v26 objectForKeyedSubscript:@"OrigI"];
            v97[0] = v28;
            v96[1] = @"inputOrigQ";
            v29 = [v26 objectForKeyedSubscript:@"OrigQ"];
            v97[1] = v29;
            v96[2] = @"inputStrength";
            v30 = [v77 objectForKeyedSubscript:@"Strength"];
            v97[2] = v30;
            v96[3] = @"inputWarmth";
            v31 = [v77 objectForKeyedSubscript:@"Warmth"];
            v97[3] = v31;
            v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v97 forKeys:v96 count:4];
            v33 = [v27 filterWithName:@"CIFaceBalance" withInputParameters:v32];

            if (v33)
            {
              [v80 addObject:v33];
            }
          }
          v34 = [v19 objectForKeyedSubscript:@"inputShadows"];
          [v34 doubleValue];
          double v36 = v35;

          if (v36 >= 0.0) {
            double v37 = v36;
          }
          else {
            double v37 = 0.0;
          }
          v38 = (void *)MEMORY[0x1E4F1E040];
          v94[0] = @"inputLocalLight";
          v78 = v19;
          v39 = objc_msgSend(v19, "objectForKeyedSubscript:");
          v95[0] = v39;
          v94[1] = @"inputSmartShadows";
          v40 = [NSNumber numberWithDouble:v37];
          v95[1] = v40;
          v94[2] = @"inputLightMap";
          v41 = [v81 objectForKeyedSubscript:@"lightMap"];
          v95[2] = v41;
          v94[3] = @"inputLightMapWidth";
          v42 = [v81 objectForKeyedSubscript:@"lightMapWidth"];
          v95[3] = v42;
          v94[4] = @"inputLightMapHeight";
          v43 = [v81 objectForKeyedSubscript:@"lightMapHeight"];
          v95[4] = v43;
          v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v95 forKeys:v94 count:5];
          uint64_t v45 = [v38 filterWithName:@"CILocalLightFilter" withInputParameters:v44];

          if (v45) {
            [v80 addObject:v45];
          }
          v72 = (void *)v45;
          v46 = (void *)MEMORY[0x1E4F1E040];
          v92 = @"inputStrength";
          v47 = [v78 objectForKeyedSubscript:@"inputBrightness"];
          v93 = v47;
          v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v93 forKeys:&v92 count:1];
          uint64_t v49 = [v46 filterWithName:@"CIHighKey" withInputParameters:v48];

          if (v49) {
            [v80 addObject:v49];
          }
          v71 = (void *)v49;
          v50 = (void *)MEMORY[0x1E4F1E040];
          v90[0] = @"inputExposure";
          v51 = objc_msgSend(v78, "objectForKeyedSubscript:");
          v91[0] = v51;
          v90[1] = @"inputContrast";
          v52 = objc_msgSend(v78, "objectForKeyedSubscript:");
          v91[1] = v52;
          v90[2] = @"inputShadows";
          v53 = objc_msgSend(NSNumber, "numberWithDouble:", fmin(v36, 0.0));
          v91[2] = v53;
          v90[3] = @"inputHighlights";
          v54 = objc_msgSend(v78, "objectForKeyedSubscript:");
          v91[3] = v54;
          v90[4] = @"inputBlack";
          v55 = objc_msgSend(v78, "objectForKeyedSubscript:");
          v91[4] = v55;
          v90[5] = @"inputRawHighlights";
          v56 = objc_msgSend(v78, "objectForKeyedSubscript:");
          v91[5] = v56;
          v57 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v91 forKeys:v90 count:6];
          uint64_t v58 = [v50 filterWithName:@"CISmartToneFilter" withInputParameters:v57];

          if (v58) {
            [v80 addObject:v58];
          }
          v59 = (void *)v58;
          v60 = (void *)MEMORY[0x1E4F1E040];
          v88[0] = @"inputCast";
          v61 = objc_msgSend(v79, "objectForKeyedSubscript:");
          v88[1] = @"inputVibrancy";
          v89[0] = v61;
          v62 = objc_msgSend(v79, "objectForKeyedSubscript:");
          v89[1] = v62;
          v63 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v89 forKeys:v88 count:2];
          v64 = [v60 filterWithName:@"CISmartColorFilter" withInputParameters:v63];

          v25 = v74;
          if (v64) {
            [v80 addObject:v64];
          }
          v65 = (void *)MEMORY[0x1E4F1E040];
          v86 = @"inputAmount";
          v66 = [v79 objectForKeyedSubscript:@"inputContrast"];
          v87 = v66;
          v67 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v87 forKeys:&v86 count:1];
          v68 = [v65 filterWithName:@"CIVibrance" withInputParameters:v67];

          v19 = v78;
          v69 = v80;
          if (v68) {
            [v80 addObject:v68];
          }

          id v3 = v75;
          id v11 = v76;
          v10 = v73;
          v24 = v79;
          v26 = v77;
        }
        else
        {
          NSLog(&cfstr_FailedToComput_3.isa, v11);
          v69 = (void *)MEMORY[0x1E4F1CBF0];
        }
      }
      else
      {
        NSLog(&cfstr_FailedToComput_2.isa, v21);
        v69 = (void *)MEMORY[0x1E4F1CBF0];
        id v11 = v21;
      }
      v7 = v81;
    }
    else
    {
      NSLog(&cfstr_FailedToComput_1.isa, v11);
      v69 = (void *)MEMORY[0x1E4F1CBF0];
      id v3 = v16;
      v7 = v81;
    }

    v9 = v11;
  }
  else
  {
    NSLog(&cfstr_FailedToComput_1.isa, v8);
    v69 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v69;
}

- (id)colorNormalizationFiltersForImage:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_alloc_init(PIColorNormalizationFilter);
  [(PIColorNormalizationFilter *)v4 setInputImage:v3];

  v5 = [(PIColorNormalizationFilter *)v4 outputNormalization];
  if (v5)
  {
    [(PIColorNormalizationFilter *)v4 setInputImage:0];
    [(PIColorNormalizationFilter *)v4 setInputNormalization:v5];
    v8[0] = v4;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  }
  else
  {
    NSLog(&cfstr_FailedToComput_0.isa);
    v6 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v6;
}

- (id)apertureAutoEnhanceFiltersForImage:(id)a3
{
  v10[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4F1E370];
  v9[0] = *MEMORY[0x1E4F1E340];
  v9[1] = v3;
  v10[0] = MEMORY[0x1E4F1CC38];
  v10[1] = MEMORY[0x1E4F1CC28];
  v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a3;
  v6 = [v4 dictionaryWithObjects:v10 forKeys:v9 count:2];
  v7 = [v5 autoAdjustmentFiltersWithOptions:v6];

  return v7;
}

- (id)autoEnhanceFiltersForImage:(id)a3 algorithm:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 isEqualToString:@"Aperture"])
  {
    uint64_t v8 = [(PIAutoEnhanceFilter *)self apertureAutoEnhanceFiltersForImage:v6];
LABEL_7:
    v9 = (void *)v8;
    goto LABEL_8;
  }
  if ([v7 isEqualToString:@"Photos"])
  {
    uint64_t v8 = [(PIAutoEnhanceFilter *)self photosAutoEnhanceFiltersForImage:v6];
    goto LABEL_7;
  }
  if ([v7 isEqualToString:@"ColorNorm"])
  {
    uint64_t v8 = [(PIAutoEnhanceFilter *)self colorNormalizationFiltersForImage:v6];
    goto LABEL_7;
  }
  v9 = 0;
LABEL_8:

  return v9;
}

- (id)outputImage
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PIAutoEnhanceFilter *)self inputImage];
  uint64_t v4 = [(PIAutoEnhanceFilter *)self inputTargetImage];
  id v5 = (void *)v4;
  if (v4) {
    id v6 = (void *)v4;
  }
  else {
    id v6 = v3;
  }
  id v7 = v6;

  NSLog(&cfstr_AutoEnhanceInp.isa, [v3 digest], objc_msgSend(v7, "digest"));
  if (v3)
  {
    uint64_t v8 = [(PIAutoEnhanceFilter *)self inputAlgorithm];
    v9 = (void *)v8;
    v10 = @"Aperture";
    if (v8) {
      v10 = (__CFString *)v8;
    }
    id v11 = v10;

    v12 = [(id)objc_opt_class() autoEnhanceCache];
    v13 = [NSString stringWithFormat:@"%@-%llX", v11, objc_msgSend(v7, "digest")];
    double v14 = [v12 objectForKey:v13];
    if (!v14)
    {
      double v14 = [(PIAutoEnhanceFilter *)self autoEnhanceFiltersForImage:v7 algorithm:v11];
      [v12 setObject:v14 forKey:v13];
    }
    v25 = v12;
    v26 = v11;
    id v15 = v3;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v16 = v14;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v28;
      uint64_t v20 = *MEMORY[0x1E4F1E480];
      do
      {
        uint64_t v21 = 0;
        v22 = v15;
        do
        {
          if (*(void *)v28 != v19) {
            objc_enumerationMutation(v16);
          }
          v23 = *(void **)(*((void *)&v27 + 1) + 8 * v21);
          [v23 setValue:v22 forKey:v20];
          id v15 = [v23 outputImage];

          ++v21;
          v22 = v15;
        }
        while (v18 != v21);
        uint64_t v18 = [v16 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v18);
    }
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

@end