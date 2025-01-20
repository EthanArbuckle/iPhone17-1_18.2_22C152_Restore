@interface DenoiseAndSharpeningPlist
+ (void)initialize;
- (DenoiseAndSharpeningPlist)init;
- (int)readBandData:(id)a3;
- (int)readPlist:(id)a3;
- (void)applyOverrides;
@end

@implementation DenoiseAndSharpeningPlist

- (int)readBandData:(id)a3
{
  uint64_t v97 = *MEMORY[0x263EF8340];
  v3 = [a3 valueForKey:@"Bands"];
  v4 = v3;
  if (v3)
  {
    long long v93 = 0u;
    long long v94 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    id obj = v3;
    uint64_t v82 = [obj countByEnumeratingWithState:&v91 objects:v96 count:16];
    if (v82)
    {
      uint64_t v84 = *(void *)v92;
      v81 = v4;
      do
      {
        uint64_t v5 = 0;
        do
        {
          if (*(void *)v92 != v84) {
            objc_enumerationMutation(obj);
          }
          uint64_t v86 = v5;
          v6 = *(void **)(*((void *)&v91 + 1) + 8 * v5);
          v7 = objc_opt_new();
          long long v87 = 0u;
          long long v88 = 0u;
          long long v89 = 0u;
          long long v90 = 0u;
          id v8 = v6;
          uint64_t v9 = [v8 countByEnumeratingWithState:&v87 objects:v95 count:16];
          if (v9)
          {
            uint64_t v10 = v9;
            uint64_t v11 = *(void *)v88;
            while (2)
            {
              for (uint64_t i = 0; i != v10; ++i)
              {
                if (*(void *)v88 != v11) {
                  objc_enumerationMutation(v8);
                }
                v13 = *(void **)(*((void *)&v87 + 1) + 8 * i);
                v14 = [v8 objectForKeyedSubscript:v13];
                if ([v13 isEqualToString:@"ChromaDenoiseLumaThresholdGain"])
                {
                  v15 = [[GainValueArray alloc] initWithArray:v14];
                  v16 = (void *)v7[1];
                  v7[1] = v15;

                  if (!v15) {
                    goto LABEL_114;
                  }
                }
                else if ([v13 isEqualToString:@"ChromaDenoiseChromaThresholdGain"])
                {
                  v17 = [[GainValueArray alloc] initWithArray:v14];
                  v18 = (void *)v7[2];
                  v7[2] = v17;

                  if (!v17) {
                    goto LABEL_114;
                  }
                }
                else if ([v13 isEqualToString:@"ChromaDenoiseMixingCoeff"])
                {
                  v19 = [[GainValueArray alloc] initWithArray:v14];
                  v20 = (void *)v7[3];
                  v7[3] = v19;

                  if (!v19) {
                    goto LABEL_114;
                  }
                }
                else if ([v13 isEqualToString:@"LumaDenoiseThresholdGain"])
                {
                  v21 = [[GainValueArray alloc] initWithArray:v14];
                  v22 = (void *)v7[4];
                  v7[4] = v21;

                  if (!v21) {
                    goto LABEL_114;
                  }
                }
                else if ([v13 isEqualToString:@"LumaDenoiseMixingCoeff"])
                {
                  v23 = [[GainValueArray alloc] initWithArray:v14];
                  v24 = (void *)v7[5];
                  v7[5] = v23;

                  if (!v23) {
                    goto LABEL_114;
                  }
                }
                else if ([v13 isEqualToString:@"LumaSharpeningScalingOnSkin"])
                {
                  v25 = [[GainValueArray alloc] initWithArray:v14];
                  v26 = (void *)v7[6];
                  v7[6] = v25;

                  if (!v25) {
                    goto LABEL_114;
                  }
                }
                else if ([v13 isEqualToString:@"LumaDenoisingScalingOnSkin"])
                {
                  v27 = [[GainValueArray alloc] initWithArray:v14];
                  v28 = (void *)v7[7];
                  v7[7] = v27;

                  if (!v27) {
                    goto LABEL_114;
                  }
                }
                else if ([v13 isEqualToString:@"LumaSharpeningScalingOnSky"])
                {
                  v29 = [[GainValueArray alloc] initWithArray:v14];
                  v30 = (void *)v7[8];
                  v7[8] = v29;

                  if (!v29) {
                    goto LABEL_114;
                  }
                }
                else if ([v13 isEqualToString:@"LumaDenoisingScalingOnSky"])
                {
                  v31 = [[GainValueArray alloc] initWithArray:v14];
                  v32 = (void *)v7[9];
                  v7[9] = v31;

                  if (!v31) {
                    goto LABEL_114;
                  }
                }
                else if ([v13 isEqualToString:@"Luma3x3SharpeningStrength"])
                {
                  v33 = [[GainValueArray alloc] initWithArray:v14];
                  v34 = (void *)v7[10];
                  v7[10] = v33;

                  if (!v33) {
                    goto LABEL_114;
                  }
                }
                else if ([v13 isEqualToString:@"LumaLowVarSharpeningStrength"])
                {
                  v35 = [[GainValueArray alloc] initWithArray:v14];
                  v36 = (void *)v7[11];
                  v7[11] = v35;

                  if (!v35) {
                    goto LABEL_114;
                  }
                }
                else if ([v13 isEqualToString:@"LumaLowVarDetailsLevel"])
                {
                  v37 = [[GainValueArray alloc] initWithArray:v14];
                  v38 = (void *)v7[12];
                  v7[12] = v37;

                  if (!v37) {
                    goto LABEL_114;
                  }
                }
                else if ([v13 isEqualToString:@"LumaDenoiseThresholdGainStaticScene"])
                {
                  v39 = [[GainValueArray alloc] initWithArray:v14];
                  v40 = (void *)v7[13];
                  v7[13] = v39;

                  if (!v39) {
                    goto LABEL_114;
                  }
                }
                else if ([v13 isEqualToString:@"LumaDenoiseMixingCoeffStaticScene"])
                {
                  v41 = [[GainValueArray alloc] initWithArray:v14];
                  v42 = (void *)v7[14];
                  v7[14] = v41;

                  if (!v41) {
                    goto LABEL_114;
                  }
                }
                else if ([v13 isEqualToString:@"LumaSharpeningScalingOnSkinStaticScene"])
                {
                  v43 = [[GainValueArray alloc] initWithArray:v14];
                  v44 = (void *)v7[15];
                  v7[15] = v43;

                  if (!v43) {
                    goto LABEL_114;
                  }
                }
                else if ([v13 isEqualToString:@"LumaDenoisingScalingOnSkinStaticScene"])
                {
                  v45 = [[GainValueArray alloc] initWithArray:v14];
                  v46 = (void *)v7[16];
                  v7[16] = v45;

                  if (!v45) {
                    goto LABEL_114;
                  }
                }
                else if ([v13 isEqualToString:@"Luma3x3SharpeningStrengthStaticScene"])
                {
                  v47 = [[GainValueArray alloc] initWithArray:v14];
                  v48 = (void *)v7[10];
                  v7[10] = v47;

                  if (!v47) {
                    goto LABEL_114;
                  }
                }
                else if ([v13 isEqualToString:@"LumaLowVarSharpeningStrengthStaticScene"])
                {
                  v49 = [[GainValueArray alloc] initWithArray:v14];
                  v50 = (void *)v7[18];
                  v7[18] = v49;

                  if (!v49) {
                    goto LABEL_114;
                  }
                }
                else if ([v13 isEqualToString:@"LumaLowVarDetailsLevelStaticScene"])
                {
                  v51 = [[GainValueArray alloc] initWithArray:v14];
                  v52 = (void *)v7[19];
                  v7[19] = v51;

                  if (!v51) {
                    goto LABEL_114;
                  }
                }
                else if ([v13 isEqualToString:@"HaloStrength"])
                {
                  v53 = [[GainValueArray alloc] initWithArray:v14];
                  v54 = (void *)v7[20];
                  v7[20] = v53;

                  if (!v53) {
                    goto LABEL_114;
                  }
                }
                else if ([v13 isEqualToString:@"FlatnessBoost"])
                {
                  v55 = [[GainValueArray alloc] initWithArray:v14];
                  v56 = (void *)v7[21];
                  v7[21] = v55;

                  if (!v55) {
                    goto LABEL_114;
                  }
                }
                else if ([v13 isEqualToString:@"FlatnessThreshold"])
                {
                  v57 = [[GainValueArray alloc] initWithArray:v14];
                  v58 = (void *)v7[22];
                  v7[22] = v57;

                  if (!v57) {
                    goto LABEL_114;
                  }
                }
                else if ([v13 isEqualToString:@"GdFlatnessBoostMidtone"])
                {
                  v59 = [[GainValueArray alloc] initWithArray:v14];
                  v60 = (void *)v7[23];
                  v7[23] = v59;

                  if (!v59) {
                    goto LABEL_114;
                  }
                }
                else if ([v13 isEqualToString:@"GdFlatnessMidtoneValue"])
                {
                  v61 = [[GainValueArray alloc] initWithArray:v14];
                  v62 = (void *)v7[24];
                  v7[24] = v61;

                  if (!v61) {
                    goto LABEL_114;
                  }
                }
                else if ([v13 isEqualToString:@"GdFlatnessBoostShadow"])
                {
                  v63 = [[GainValueArray alloc] initWithArray:v14];
                  v64 = (void *)v7[25];
                  v7[25] = v63;

                  if (!v63) {
                    goto LABEL_114;
                  }
                }
                else if ([v13 isEqualToString:@"GdFlatnessBoostHighlight"])
                {
                  v65 = [[GainValueArray alloc] initWithArray:v14];
                  v66 = (void *)v7[26];
                  v7[26] = v65;

                  if (!v65) {
                    goto LABEL_114;
                  }
                }
                else if ([v13 isEqualToString:@"GdTexturenessThresholdLow"])
                {
                  v67 = [[GainValueArray alloc] initWithArray:v14];
                  v68 = (void *)v7[27];
                  v7[27] = v67;

                  if (!v67) {
                    goto LABEL_114;
                  }
                }
                else if ([v13 isEqualToString:@"GdTexturenessThresholdHigh"])
                {
                  v69 = [[GainValueArray alloc] initWithArray:v14];
                  v70 = (void *)v7[28];
                  v7[28] = v69;

                  if (!v69) {
                    goto LABEL_114;
                  }
                }
                else if ([v13 isEqualToString:@"GdTexturenessShadingFactor"])
                {
                  v71 = [[GainValueArray alloc] initWithArray:v14];
                  v72 = (void *)v7[29];
                  v7[29] = v71;

                  if (!v71) {
                    goto LABEL_114;
                  }
                }
                else if ([v13 isEqualToString:@"RadialFlatnessBoost"])
                {
                  v73 = [[GainValueArray alloc] initWithArray:v14];
                  v74 = (void *)v7[30];
                  v7[30] = v73;

                  if (!v73) {
                    goto LABEL_114;
                  }
                }
                else if ([v13 isEqualToString:@"RadialSharpnessBoost"])
                {
                  v75 = [[GainValueArray alloc] initWithArray:v14];
                  v76 = (void *)v7[31];
                  v7[31] = v75;

                  if (!v75) {
                    goto LABEL_114;
                  }
                }
                else if ([v13 isEqualToString:@"BlueBoost"])
                {
                  v77 = [[GainValueArray alloc] initWithArray:v14];
                  v78 = (void *)v7[32];
                  v7[32] = v77;

                  if (!v77)
                  {
LABEL_114:
                    FigDebugAssert3();
                    int v79 = -73384;

                    v4 = v81;
                    goto LABEL_115;
                  }
                }
              }
              uint64_t v10 = [v8 countByEnumeratingWithState:&v87 objects:v95 count:16];
              if (v10) {
                continue;
              }
              break;
            }
          }

          [(NSMutableArray *)self->tuningParameters->bands addObject:v7];
          uint64_t v5 = v86 + 1;
        }
        while (v86 + 1 != v82);
        int v79 = 0;
        v4 = v81;
        uint64_t v82 = [obj countByEnumeratingWithState:&v91 objects:v96 count:16];
      }
      while (v82);
    }
    else
    {
      int v79 = 0;
    }
LABEL_115:
  }
  else
  {
    int v79 = FigSignalErrorAt();
  }

  return v79;
}

- (int)readPlist:(id)a3
{
  id v4 = a3;
  v73.receiver = self;
  v73.super_class = (Class)DenoiseAndSharpeningPlist;
  [(CMITuningPlist *)&v73 readPlist:v4];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"TuningParameters"];
  if ([(DenoiseAndSharpeningPlist *)self readBandData:v5])
  {
    FigDebugAssert3();
    goto LABEL_17;
  }
  v6 = [GainValueArray alloc];
  v7 = [v5 objectForKeyedSubscript:@"EV0FrameDenoiseBoost"];
  uint64_t v8 = [(GainValueArray *)v6 initWithArray:v7];
  tuningParameters = self->tuningParameters;
  ev0FrameDenoiseBoost = tuningParameters->ev0FrameDenoiseBoost;
  tuningParameters->ev0FrameDenoiseBoost = (GainValueArray *)v8;

  if (!v8)
  {
    LODWORD(v64) = -73384;
LABEL_28:
    FigDebugAssert3();
    goto LABEL_19;
  }
  uint64_t v11 = [GainValueArray alloc];
  v12 = [v5 objectForKeyedSubscript:@"ShortFrameDenoiseBoost"];
  uint64_t v13 = [(GainValueArray *)v11 initWithArray:v12];
  v14 = self->tuningParameters;
  shortFrameDenoiseBoost = v14->shortFrameDenoiseBoost;
  v14->shortFrameDenoiseBoost = (GainValueArray *)v13;

  if (!v13)
  {
    LODWORD(v64) = -73384;
    goto LABEL_28;
  }
  v16 = [GainValueArray alloc];
  v17 = [v5 objectForKeyedSubscript:@"LowFusionNoiseBoost"];
  uint64_t v18 = [(GainValueArray *)v16 initWithArray:v17];
  v19 = self->tuningParameters;
  lowFusionNoiseBoost = v19->lowFusionNoiseBoost;
  v19->lowFusionNoiseBoost = (GainValueArray *)v18;

  if (!v18)
  {
    LODWORD(v64) = -73384;
    goto LABEL_28;
  }
  v21 = [GainValueArray alloc];
  v22 = [v5 objectForKeyedSubscript:@"LowFusionNoiseBoostPerFrame"];
  uint64_t v23 = [(GainValueArray *)v21 initWithArray:v22];
  v24 = self->tuningParameters;
  lowFusionNoiseBoostPerFrame = v24->lowFusionNoiseBoostPerFrame;
  v24->lowFusionNoiseBoostPerFrame = (GainValueArray *)v23;

  if (!v23)
  {
    LODWORD(v64) = -73384;
    goto LABEL_28;
  }
  v26 = [GainValueArray alloc];
  v27 = [v5 objectForKeyedSubscript:@"LensShadeFactor"];
  uint64_t v28 = [(GainValueArray *)v26 initWithArray:v27];
  v29 = self->tuningParameters;
  lensShadeFactor = v29->lensShadeFactor;
  v29->lensShadeFactor = (GainValueArray *)v28;

  if (!v28)
  {
    LODWORD(v64) = -73384;
    goto LABEL_28;
  }
  v31 = [GainValueArray alloc];
  v32 = [v5 objectForKeyedSubscript:@"LoGOffsetRangeMax"];
  uint64_t v33 = [(GainValueArray *)v31 initWithArray:v32];
  v34 = self->tuningParameters;
  loGOffsetRangeMax = v34->loGOffsetRangeMax;
  v34->loGOffsetRangeMax = (GainValueArray *)v33;

  if (!v33)
  {
    LODWORD(v64) = -73384;
    goto LABEL_28;
  }
  v36 = [GainValueArray alloc];
  v37 = [v5 objectForKeyedSubscript:@"LoGOffsetScale"];
  uint64_t v38 = [(GainValueArray *)v36 initWithArray:v37];
  v39 = self->tuningParameters;
  loGOffsetScale = v39->loGOffsetScale;
  v39->loGOffsetScale = (GainValueArray *)v38;

  if (!v38)
  {
    LODWORD(v64) = -73384;
    goto LABEL_28;
  }
  LODWORD(v41) = 1036831949;
  objc_msgSend(v5, "cmi_floatValueForKey:defaultValue:found:", @"RadialDenoiseKneeStart", 0, v41);
  self->tuningParameters->radialDenoiseKneeStart = v42;
  LODWORD(v43) = 1061997773;
  objc_msgSend(v5, "cmi_floatValueForKey:defaultValue:found:", @"RadialDenoiseKneeEnd", 0, v43);
  self->tuningParameters->radialDenoiseKneeEnd = v44;
  LODWORD(v45) = 1036831949;
  objc_msgSend(v5, "cmi_floatValueForKey:defaultValue:found:", @"RadialSharpnessKneeStart", 0, v45);
  self->tuningParameters->radialSharpnessKneeStart = v46;
  LODWORD(v47) = 1061997773;
  objc_msgSend(v5, "cmi_floatValueForKey:defaultValue:found:", @"RadialSharpnessKneeEnd", 0, v47);
  self->tuningParameters->radialSharpnessKneeEnd = v48;
  LODWORD(v49) = 1036831949;
  objc_msgSend(v5, "cmi_floatValueForKey:defaultValue:found:", @"RadialTexturenessKneeStart", 0, v49);
  self->tuningParameters->radialTexturenessKneeStart = v50;
  LODWORD(v51) = 1061997773;
  objc_msgSend(v5, "cmi_floatValueForKey:defaultValue:found:", @"RadialTexturenessKneeEnd", 0, v51);
  self->tuningParameters->radialTexturenessKneeEnd = v52;
  self->tuningParameters->scaleLensShadingByCropFactor = objc_msgSend(v5, "cmi_BOOLValueForKey:defaultValue:found:", @"ScaleLensShadingByCropFactor", 0, 0);
  self->enableBandZeroDenoising = objc_msgSend(v4, "cmi_BOOLValueForKey:defaultValue:found:", @"EnableBandZeroDenoising", 1, 0);
  self->enableBilateralRegression = objc_msgSend(v4, "cmi_BOOLValueForKey:defaultValue:found:", @"EnableBilateralRegression", 0, 0);
  self->enableLowVarSharpening = objc_msgSend(v4, "cmi_BOOLValueForKey:defaultValue:found:", @"EnableLowVarSharpening", 0, 0);
  self->enableGdFlatness = objc_msgSend(v4, "cmi_BOOLValueForKey:defaultValue:found:", @"EnableGdFlatness", 0, 0);
  self->enableSkyAwareBlueBoost = objc_msgSend(v4, "cmi_BOOLValueForKey:defaultValue:found:", @"EnableSkyAwareBlueBoost", 0, 0);
  objc_msgSend(v4, "cmi_floatValueForKey:defaultValue:found:", @"GDFlatnessThreshold", 0, 0.0);
  self->gdFlatnessThreshold = v53;
  self->enableLoGOffset = objc_msgSend(v4, "cmi_BOOLValueForKey:defaultValue:found:", @"EnableLoGOffset", 0, 0);
  self->enableOPC = objc_msgSend(v4, "cmi_BOOLValueForKey:defaultValue:found:", @"EnableOPC", 0, 0);
  objc_msgSend(v4, "cmi_floatValueForKey:defaultValue:found:", @"OPCThresholdGain", 0, 0.0);
  self->OPCThresholdGain = v54;
  self->enableDithering = objc_msgSend(v4, "cmi_BOOLValueForKey:defaultValue:found:", @"EnableDithering", 0, 0);
  v55 = [v4 objectForKeyedSubscript:@"SkinMaskDefaultValue"];

  if (v55) {
    objc_msgSend(v4, "cmi_floatValueForKey:defaultValue:found:", @"SkinMaskDefaultValue", 0, 0.0);
  }
  else {
    float v56 = 1.0;
  }
  self->skinMaskDefaultValue = v56;
  v57 = [v4 objectForKeyedSubscript:@"BluenessCb"];

  if (v57)
  {
    v58 = [v4 objectForKeyedSubscript:@"BluenessCb"];
    objc_msgSend(v58, "cmi_floatValueForKey:defaultValue:found:", @"start", 0, 0.0);
    self->bluenessCb.start = v59;

    v60 = [v4 objectForKeyedSubscript:@"BluenessCb"];
    objc_msgSend(v60, "cmi_floatValueForKey:defaultValue:found:", @"end", 0, 0.0);
    self->bluenessCb.end = v61;

    v62 = [v4 objectForKeyedSubscript:@"BluenessCb"];
    objc_msgSend(v62, "cmi_floatValueForKey:defaultValue:found:", @"margin", 0, 0.0);
    self->bluenessCb.margin = v63;
  }
  else
  {
    *(void *)&self->bluenessCb.start = 0x3F8000003F266666;
    self->bluenessCb.margin = 0.05;
  }
  v64 = [v4 objectForKeyedSubscript:@"BluenessCr"];

  if (!v64)
  {
    *(void *)&self->bluenessCr.start = 0;
    self->bluenessCr.margin = 0.6;
    goto LABEL_19;
  }
  v65 = [v4 objectForKeyedSubscript:@"BluenessCr"];
  objc_msgSend(v65, "cmi_floatValueForKey:defaultValue:found:", @"start", 0, 0.0);
  p_bluenessCr = &self->bluenessCr;
  self->bluenessCr.start = v67;

  v68 = [v4 objectForKeyedSubscript:@"BluenessCr"];
  objc_msgSend(v68, "cmi_floatValueForKey:defaultValue:found:", @"end", 0, 0.0);
  p_bluenessCr->end = v69;

  v70 = [v4 objectForKeyedSubscript:@"BluenessCr"];
  objc_msgSend(v70, "cmi_floatValueForKey:defaultValue:found:", @"margin", 0, 0.0);
  p_bluenessCr->margin = v71;

LABEL_17:
  LODWORD(v64) = 0;
LABEL_19:

  return (int)v64;
}

+ (void)initialize
{
  enableBilateralRegressionOverride = 2;
  enableLowVarSharpeningOverride = 2;
  enableBandZeroDenoisingOverride = 2;
  enableDitheringOverride = 2;
}

- (DenoiseAndSharpeningPlist)init
{
  v6.receiver = self;
  v6.super_class = (Class)DenoiseAndSharpeningPlist;
  v2 = [(CMITuningPlist *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    tuningParameters = v2->tuningParameters;
    v2->tuningParameters = (DenoiseAndSharpeningTuning *)v3;
  }
  return v2;
}

- (void)applyOverrides
{
  if (enableBilateralRegressionOverride <= 1) {
    self->enableBilateralRegression = enableBilateralRegressionOverride == 1;
  }
  if (enableLowVarSharpeningOverride <= 1) {
    self->enableLowVarSharpening = enableLowVarSharpeningOverride == 1;
  }
  if (enableBandZeroDenoisingOverride <= 1) {
    self->enableBandZeroDenoising = enableBandZeroDenoisingOverride == 1;
  }
  if (enableDitheringOverride <= 1) {
    self->enableDithering = enableDitheringOverride == 1;
  }
}

- (void).cxx_destruct
{
}

@end