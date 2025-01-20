@interface PostDemosaicTuningParams
- ($1C2F15E388ACAC30B05DEBDC3B062576)config;
- (const)getConfigDirect;
- (int)readPlist:(id)a3;
- (int)updateConfigWithGain:(float)a3;
@end

@implementation PostDemosaicTuningParams

- (int)readPlist:(id)a3
{
  id v4 = a3;
  char v59 = 0;
  if (!v4)
  {
    int v57 = FigSignalErrorAt();
    id v16 = 0;
    id v35 = 0;
    id v50 = 0;
    v22 = 0;
LABEL_98:
    v27 = 0;
    goto LABEL_95;
  }
  bzero(&self->_config, 0x4B0uLL);
  self->_config.enableDotFix = objc_msgSend(v4, "cmi_BOOLValueForKey:defaultValue:found:", @"EnableDotFix", 0, &v59);
  if (!v59) {
    FigSignalErrorAt();
  }
  self->_config.enableDirectionalLowpass = objc_msgSend(v4, "cmi_BOOLValueForKey:defaultValue:found:", @"EnableDirectionalLowpass", 0, &v59);
  if (!v59) {
    FigSignalErrorAt();
  }
  self->_config.enableChromaSuppression = objc_msgSend(v4, "cmi_BOOLValueForKey:defaultValue:found:", @"EnableChromaSuppression", 1, &v59);
  if (!v59) {
    FigSignalErrorAt();
  }
  self->_config.referenceModelCompliant = 1;
  self->_config.newDLPFMethod = 0;
  objc_msgSend(v4, "cmi_floatValueForKey:defaultValue:found:", @"DotDetectThreshold", &v59, 0.0);
  self->_config.dotDetectThreshold = *(float *)&v5 / 65535.0;
  if (!v59) {
    FigSignalErrorAt();
  }
  LODWORD(v5) = 1058642330;
  objc_msgSend(v4, "cmi_floatValueForKey:defaultValue:found:", @"LumaCorrectionMaxStrength", &v59, v5);
  float v7 = *(float *)&v6;
  if (!v59) {
    FigSignalErrorAt();
  }
  LODWORD(v6) = 1036831949;
  objc_msgSend(v4, "cmi_floatValueForKey:defaultValue:found:", @"LumaCorrectionChromaSigma", &v59, v6);
  float v9 = v8;
  if (!v59) {
    FigSignalErrorAt();
  }
  BOOL v10 = v7 > 0.0;
  if (v9 <= 0.0) {
    BOOL v10 = 0;
  }
  BOOL v11 = v9 < 10.0;
  float v12 = fminf(v7, 1.0);
  if (!v10 || !v11) {
    float v12 = 0.0;
  }
  *(float *)&self[1]._config.skipYCC2YUV = v12;
  float v13 = 1.0 / v9;
  if (!v10 || !v11) {
    float v13 = 0.0;
  }
  self[1]._config.dotDetectThreshold = v13;
  memcpy(self->_config.noiseLUT, &unk_2634816E4, sizeof(self->_config.noiseLUT));
  v14 = [v4 objectForKeyedSubscript:@"DirectionalLowpass"];
  v15 = v14;
  if (!v14)
  {
    FigSignalErrorAt();
    v15 = (void *)MEMORY[0x263EFFA78];
  }
  id v16 = v15;

  self->_config.enableNoiseSuppression = objc_msgSend(v16, "cmi_BOOLValueForKey:defaultValue:found:", @"EnableNoiseSuppression", 0, &v59);
  if (!v59) {
    FigSignalErrorAt();
  }
  v17 = [v16 objectForKeyedSubscript:@"NoiseLUT"];
  char v59 = objc_msgSend(v17, "cmi_copyFloatValuesToBuffer:startingIndex:count:", self->_config.noiseLUT, 0, 257);

  if (!v59) {
    FigSignalErrorAt();
  }
  self->_config.directionalFilterAlways = objc_msgSend(v16, "cmi_BOOLValueForKey:defaultValue:found:", @"DirectionalFilterAlways", 0, &v59);
  if (!v59) {
    FigSignalErrorAt();
  }
  objc_msgSend(v16, "cmi_floatValueForKey:defaultValue:found:", @"EdgeAdaptiveThreshold", &v59, 0.0);
  self->_config.edgeAdaptiveThreshold = v18;
  if (!v59) {
    FigSignalErrorAt();
  }
  objc_msgSend(v16, "cmi_floatValueFromArrayWithKey:forIndex:defaultValue:found:", @"DiagonalWeightParams", 0, &v59, 0.0);
  LODWORD(self[1]._smoothStrengthHV) = v19;
  if (!v59) {
    FigSignalErrorAt();
  }
  objc_msgSend(v16, "cmi_floatValueFromArrayWithKey:forIndex:defaultValue:found:", @"DiagonalWeightParams", 1, &v59, 3.68934975e19);
  HIDWORD(self[1]._smoothStrengthHV) = v20;
  if (!v59) {
    FigSignalErrorAt();
  }
  objc_msgSend(v16, "cmi_floatValueFromArrayWithKey:forIndex:defaultValue:found:", @"DiagonalWeightParams", 2, &v59, 0.0);
  LODWORD(self[1]._smoothStrengthD) = v21;
  if (!v59) {
    FigSignalErrorAt();
  }
  v22 = [v16 valueForKey:@"SmoothStrengthHV"];
  if (!v22) {
    FigSignalErrorAt();
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    LODWORD(v23) = 0.78125;
    objc_msgSend(v16, "cmi_floatValueForKey:defaultValue:found:", @"SmoothStrengthHV", &v59, v23);
    *(_DWORD *)self[1]._anon_18 = v26;
    if (!v59) {
      FigSignalErrorAt();
    }
    goto LABEL_43;
  }
  if ([v22 count])
  {
    FigDebugAssert3();
    int v57 = FigSignalErrorAt();
    id v35 = 0;
    id v50 = 0;
    goto LABEL_98;
  }
  v24 = (NSArray *)[v22 copy];
  smoothStrengthHV = self->_smoothStrengthHV;
  self->_smoothStrengthHV = v24;

  *(_DWORD *)self[1]._anon_18 = 1061683200;
LABEL_43:
  v27 = [v16 valueForKey:@"SmoothStrengthD"];
  if (!v27) {
    FigSignalErrorAt();
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v27 count])
    {
      FigDebugAssert3();
      int v57 = FigSignalErrorAt();
      id v35 = 0;
      id v50 = 0;
      goto LABEL_95;
    }
    v29 = (NSArray *)[v27 copy];
    smoothStrengthD = self->_smoothStrengthD;
    self->_smoothStrengthD = v29;

    *(_DWORD *)&self[1]._anon_18[4] = 1061683200;
  }
  else
  {
    LODWORD(v28) = 0.78125;
    objc_msgSend(v16, "cmi_floatValueForKey:defaultValue:found:", @"SmoothStrengthD", &v59, v28);
    *(_DWORD *)&self[1]._anon_18[4] = LODWORD(v31);
    if (!v59) {
      FigSignalErrorAt();
    }
  }
  LODWORD(v31) = 1132462080;
  objc_msgSend(v16, "cmi_floatValueForKey:defaultValue:found:", @"GradientDivisor", &v59, v31);
  *(_DWORD *)&self[1]._config.referenceModelCompliant = v32;
  if (!v59) {
    FigSignalErrorAt();
  }
  v33 = [v4 objectForKeyedSubscript:@"ChromaSuppression"];
  v34 = v33;
  if (!v33)
  {
    FigSignalErrorAt();
    v34 = (void *)MEMORY[0x263EFFA78];
  }
  id v35 = v34;

  objc_msgSend(v35, "cmi_floatValueFromArrayWithKey:forIndex:defaultValue:found:", @"ChromaGray", 0, &v59, 0.0);
  self[1]._config.noiseLUT[0] = v36;
  if (!v59) {
    FigSignalErrorAt();
  }
  objc_msgSend(v35, "cmi_floatValueFromArrayWithKey:forIndex:defaultValue:found:", @"ChromaGray", 1, &v59, 0.0);
  self[1]._config.noiseLUT[1] = v37;
  if (!v59) {
    FigSignalErrorAt();
  }
  LOBYTE(self[1]._config.noiseLUT[2]) = objc_msgSend(v35, "cmi_BOOLValueForKey:defaultValue:found:", @"UseEnlargedHFLumaSupport", 0, &v59);
  if (!v59) {
    FigSignalErrorAt();
  }
  BYTE1(self[1]._config.noiseLUT[2]) = objc_msgSend(v35, "cmi_BOOLValueForKey:defaultValue:found:", @"UseSparseChromaSampling", 0, &v59);
  if (!v59) {
    FigSignalErrorAt();
  }
  LODWORD(v38) = 1042038940;
  objc_msgSend(v35, "cmi_floatValueForKey:defaultValue:found:", @"BilateralLumaSigma", &v59, v38);
  self[1]._config.noiseLUT[3] = *(float *)&v39;
  if (!v59) {
    FigSignalErrorAt();
  }
  LODWORD(v39) = 1050427548;
  objc_msgSend(v35, "cmi_floatValueForKey:defaultValue:found:", @"BilateralChromaSigma", &v59, v39);
  self[1]._config.noiseLUT[4] = *(float *)&v40;
  if (!v59) {
    FigSignalErrorAt();
  }
  LODWORD(v40) = 1045220557;
  objc_msgSend(v35, "cmi_floatValueForKey:defaultValue:found:", @"BilateralLowerWeightThreshold", &v59, v40);
  self[1]._config.noiseLUT[5] = *(float *)&v41;
  if (!v59) {
    FigSignalErrorAt();
  }
  LODWORD(v41) = 1058642330;
  objc_msgSend(v35, "cmi_floatValueForKey:defaultValue:found:", @"BilateralUpperWeightThreshold", &v59, v41);
  self[1]._config.noiseLUT[6] = v42;
  if (!v59) {
    FigSignalErrorAt();
  }
  objc_msgSend(v35, "cmi_floatValueForKey:defaultValue:found:", @"ChromaDesatSmoothMixLuma1", &v59, 0.0);
  self[1]._config.noiseLUT[7] = *(float *)&v43;
  if (!v59) {
    FigSignalErrorAt();
  }
  LODWORD(v43) = 1.0;
  objc_msgSend(v35, "cmi_floatValueForKey:defaultValue:found:", @"ChromaDesatSmoothMixBlend1", &v59, v43);
  self[1]._config.noiseLUT[8] = *(float *)&v44;
  if (!v59) {
    FigSignalErrorAt();
  }
  LODWORD(v44) = 1.0;
  objc_msgSend(v35, "cmi_floatValueForKey:defaultValue:found:", @"ChromaDesatSmoothMixLuma2", &v59, v44);
  self[1]._config.noiseLUT[9] = *(float *)&v45;
  if (!v59) {
    FigSignalErrorAt();
  }
  LODWORD(v45) = 1.0;
  objc_msgSend(v35, "cmi_floatValueForKey:defaultValue:found:", @"ChromaDesatSmoothMixBlend2", &v59, v45);
  self[1]._config.noiseLUT[10] = v46;
  if (!v59) {
    FigSignalErrorAt();
  }
  uint64_t v47 = [v35 objectForKeyedSubscript:@"HueBasedSuppressionStrength"];
  v48 = (void *)v47;
  v49 = (void *)MEMORY[0x263EFFA68];
  if (v47) {
    v49 = (void *)v47;
  }
  id v50 = v49;

  char v59 = objc_msgSend(v50, "cmi_copyFloatValuesToBuffer:startingIndex:count:", &self[1]._config.noiseLUT[11], 0, 8);
  if ((v59 & 1) == 0) {
    FigSignalErrorAt();
  }
  objc_msgSend(v35, "cmi_floatValueForKey:defaultValue:found:", @"LumaBasedSuppressionStrengthLuma1", &v59, 0.0);
  self[1]._config.noiseLUT[19] = *(float *)&v51;
  if (!v59) {
    FigSignalErrorAt();
  }
  LODWORD(v51) = 1.0;
  objc_msgSend(v35, "cmi_floatValueForKey:defaultValue:found:", @"LumaBasedSuppressionStrengthLuma2", &v59, v51);
  self[1]._config.noiseLUT[20] = *(float *)&v52;
  if (!v59) {
    FigSignalErrorAt();
  }
  LODWORD(v52) = 1.0;
  objc_msgSend(v35, "cmi_floatValueForKey:defaultValue:found:", @"LumaBasedSuppressionStrength1", &v59, v52);
  self[1]._config.noiseLUT[21] = *(float *)&v53;
  if (!v59) {
    FigSignalErrorAt();
  }
  LODWORD(v53) = 1.0;
  objc_msgSend(v35, "cmi_floatValueForKey:defaultValue:found:", @"LumaBasedSuppressionStrength2", &v59, v53);
  self[1]._config.noiseLUT[22] = *(float *)&v54;
  if (!v59) {
    FigSignalErrorAt();
  }
  LODWORD(v54) = 1007950978;
  objc_msgSend(v35, "cmi_floatValueForKey:defaultValue:found:", @"HFDetailBasedSuppressionSlopeStart", &v59, v54);
  self[1]._config.noiseLUT[23] = *(float *)&v55;
  if (!v59) {
    FigSignalErrorAt();
  }
  LODWORD(v55) = 1024741616;
  objc_msgSend(v35, "cmi_floatValueForKey:defaultValue:found:", @"HFDetailBasedSuppressionSlopeEnd", &v59, v55);
  self[1]._config.noiseLUT[24] = v56;
  if (!v59) {
    FigSignalErrorAt();
  }
  int v57 = 0;
LABEL_95:

  return v57;
}

- (const)getConfigDirect
{
  return (const $1C2F15E388ACAC30B05DEBDC3B062576 *)&self->_config;
}

- (int)updateConfigWithGain:(float)a3
{
  smoothStrengthHV = self->_smoothStrengthHV;
  if (smoothStrengthHV)
  {
    [(NSArray *)smoothStrengthHV cmi_interpolateValueForGain:*(double *)&a3];
    *(float *)self[1]._anon_18 = a3;
  }
  smoothStrengthD = self->_smoothStrengthD;
  if (smoothStrengthD)
  {
    *(float *)&double v7 = a3;
    [(NSArray *)smoothStrengthD cmi_interpolateValueForGain:v7];
    *(_DWORD *)&self[1]._anon_18[4] = v8;
  }
  return 0;
}

- ($1C2F15E388ACAC30B05DEBDC3B062576)config
{
  return ($1C2F15E388ACAC30B05DEBDC3B062576 *)memcpy(retstr, &self->_config, 0x4B0uLL);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_smoothStrengthD, 0);

  objc_storeStrong((id *)&self->_smoothStrengthHV, 0);
}

@end