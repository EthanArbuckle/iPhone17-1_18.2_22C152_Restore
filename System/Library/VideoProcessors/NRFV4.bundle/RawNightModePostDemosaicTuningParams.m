@interface RawNightModePostDemosaicTuningParams
- ($1C2F15E388ACAC30B05DEBDC3B062576)postDemosaicProcControls;
- (BOOL)chromaSuppressionEnabled;
- (int)getPostDemosaicTuning;
- (int)readPlist:(id)a3;
@end

@implementation RawNightModePostDemosaicTuningParams

- (int)readPlist:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)RawNightModePostDemosaicTuningParams;
  id v4 = a3;
  [(CMITuningPlist *)&v11 readPlist:v4];
  v5 = [v4 objectForKeyedSubscript:@"PostDemosaic"];

  v6 = [v5 objectForKeyedSubscript:@"Default"];
  postDemosaicTuningDictionary = self->_postDemosaicTuningDictionary;
  self->_postDemosaicTuningDictionary = v6;

  v8 = self->_postDemosaicTuningDictionary;
  if (v8)
  {
    self->_chromaSuppressionEnabled = [(NSDictionary *)v8 cmi_intValueForKey:@"EnableChromaSuppression" defaultValue:0 found:0] != 0;
    int v9 = [(RawNightModePostDemosaicTuningParams *)self getPostDemosaicTuning];
    int result = 0;
    if (v9)
    {
      FigDebugAssert3();
      return v9;
    }
  }
  else
  {
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
  return result;
}

- (int)getPostDemosaicTuning
{
  char v29 = 0;
  postDemosaicTuningDictionary = self->_postDemosaicTuningDictionary;
  if (!postDemosaicTuningDictionary)
  {
    FigDebugAssert3();
    int v27 = FigSignalErrorAt();
    id v4 = 0;
LABEL_49:
    id v20 = 0;
    goto LABEL_46;
  }
  id v4 = [(NSDictionary *)postDemosaicTuningDictionary objectForKeyedSubscript:@"ChromaSuppression"];
  if (!v4)
  {
    FigDebugAssert3();
    int v27 = FigSignalErrorAt();
    goto LABEL_49;
  }
  p_postDemosaicProcControls = &self->_postDemosaicProcControls;
  *(_WORD *)&self->_postDemosaicProcControls.enableDotFix = 0;
  self->_postDemosaicProcControls.enableChromaSuppression = [(NSDictionary *)self->_postDemosaicTuningDictionary cmi_intValueForKey:@"EnableChromaSuppression" defaultValue:0 found:&v29] != 0;
  self->_postDemosaicProcControls.skipYCC2YUV = 1;
  if (!v29) {
    FigSignalErrorAt();
  }
  objc_msgSend(v4, "cmi_floatValueFromArrayWithKey:forIndex:defaultValue:found:", @"ChromaGray", 0, &v29, 0.0);
  *(_DWORD *)&self[1]._postDemosaicProcControls.referenceModelCompliant = v6;
  if (!v29) {
    FigSignalErrorAt();
  }
  objc_msgSend(v4, "cmi_floatValueFromArrayWithKey:forIndex:defaultValue:found:", @"ChromaGray", 1, &v29, 0.0);
  *(_DWORD *)&self[1]._postDemosaicProcControls.skipYCC2YUV = v7;
  if (!v29) {
    FigSignalErrorAt();
  }
  LOBYTE(self[1]._postDemosaicProcControls.dotDetectThreshold) = objc_msgSend(v4, "cmi_BOOLValueForKey:defaultValue:found:", @"UseEnlargedHFLumaSupport", 0, &v29);
  if (!v29) {
    FigSignalErrorAt();
  }
  BYTE1(self[1]._postDemosaicProcControls.dotDetectThreshold) = objc_msgSend(v4, "cmi_BOOLValueForKey:defaultValue:found:", @"UseSparseChromaSampling", 0, &v29);
  if (!v29) {
    FigSignalErrorAt();
  }
  LODWORD(v8) = 1042038940;
  objc_msgSend(v4, "cmi_floatValueForKey:defaultValue:found:", @"BilateralLumaSigma", &v29, v8);
  *(_DWORD *)&self[1]._postDemosaicProcControls.enableNoiseSuppression = LODWORD(v9);
  if (!v29) {
    FigSignalErrorAt();
  }
  LODWORD(v9) = 1050427548;
  objc_msgSend(v4, "cmi_floatValueForKey:defaultValue:found:", @"BilateralChromaSigma", &v29, v9);
  self[1]._postDemosaicProcControls.noiseLUT[0] = *(float *)&v10;
  if (!v29) {
    FigSignalErrorAt();
  }
  LODWORD(v10) = 1045220557;
  objc_msgSend(v4, "cmi_floatValueForKey:defaultValue:found:", @"BilateralLowerWeightThreshold", &v29, v10);
  self[1]._postDemosaicProcControls.noiseLUT[1] = *(float *)&v11;
  if (!v29) {
    FigSignalErrorAt();
  }
  LODWORD(v11) = 1058642330;
  objc_msgSend(v4, "cmi_floatValueForKey:defaultValue:found:", @"BilateralUpperWeightThreshold", &v29, v11);
  self[1]._postDemosaicProcControls.noiseLUT[2] = v12;
  if (!v29) {
    FigSignalErrorAt();
  }
  objc_msgSend(v4, "cmi_floatValueForKey:defaultValue:found:", @"ChromaDesatSmoothMixLuma1", &v29, 0.0);
  self[1]._postDemosaicProcControls.noiseLUT[3] = *(float *)&v13;
  if (!v29) {
    FigSignalErrorAt();
  }
  LODWORD(v13) = 1.0;
  objc_msgSend(v4, "cmi_floatValueForKey:defaultValue:found:", @"ChromaDesatSmoothMixBlend1", &v29, v13);
  self[1]._postDemosaicProcControls.noiseLUT[4] = *(float *)&v14;
  if (!v29) {
    FigSignalErrorAt();
  }
  LODWORD(v14) = 1.0;
  objc_msgSend(v4, "cmi_floatValueForKey:defaultValue:found:", @"ChromaDesatSmoothMixLuma2", &v29, v14);
  self[1]._postDemosaicProcControls.noiseLUT[5] = *(float *)&v15;
  if (!v29) {
    FigSignalErrorAt();
  }
  LODWORD(v15) = 1.0;
  objc_msgSend(v4, "cmi_floatValueForKey:defaultValue:found:", @"ChromaDesatSmoothMixBlend2", &v29, v15);
  self[1]._postDemosaicProcControls.noiseLUT[6] = v16;
  if (!v29) {
    FigSignalErrorAt();
  }
  uint64_t v17 = [v4 objectForKeyedSubscript:@"HueBasedSuppressionStrength"];
  v18 = (void *)v17;
  v19 = (void *)MEMORY[0x263EFFA68];
  if (v17) {
    v19 = (void *)v17;
  }
  id v20 = v19;

  char v29 = objc_msgSend(v20, "cmi_copyFloatValuesToBuffer:startingIndex:count:", &p_postDemosaicProcControls[1].noiseLUT[19], 0, 8);
  if ((v29 & 1) == 0) {
    FigSignalErrorAt();
  }
  objc_msgSend(v4, "cmi_floatValueForKey:defaultValue:found:", @"LumaBasedSuppressionStrengthLuma1", &v29, 0.0);
  p_postDemosaicProcControls[1].noiseLUT[27] = *(float *)&v21;
  if (!v29) {
    FigSignalErrorAt();
  }
  LODWORD(v21) = 1.0;
  objc_msgSend(v4, "cmi_floatValueForKey:defaultValue:found:", @"LumaBasedSuppressionStrengthLuma2", &v29, v21);
  p_postDemosaicProcControls[1].noiseLUT[28] = *(float *)&v22;
  if (!v29) {
    FigSignalErrorAt();
  }
  LODWORD(v22) = 1.0;
  objc_msgSend(v4, "cmi_floatValueForKey:defaultValue:found:", @"LumaBasedSuppressionStrength1", &v29, v22);
  p_postDemosaicProcControls[1].noiseLUT[29] = *(float *)&v23;
  if (!v29) {
    FigSignalErrorAt();
  }
  LODWORD(v23) = 1.0;
  objc_msgSend(v4, "cmi_floatValueForKey:defaultValue:found:", @"LumaBasedSuppressionStrength2", &v29, v23);
  p_postDemosaicProcControls[1].noiseLUT[30] = *(float *)&v24;
  if (!v29) {
    FigSignalErrorAt();
  }
  LODWORD(v24) = 1007950978;
  objc_msgSend(v4, "cmi_floatValueForKey:defaultValue:found:", @"HFDetailBasedSuppressionSlopeStart", &v29, v24);
  p_postDemosaicProcControls[1].noiseLUT[31] = *(float *)&v25;
  if (!v29) {
    FigSignalErrorAt();
  }
  LODWORD(v25) = 1024741616;
  objc_msgSend(v4, "cmi_floatValueForKey:defaultValue:found:", @"HFDetailBasedSuppressionSlopeEnd", &v29, v25);
  p_postDemosaicProcControls[1].noiseLUT[32] = v26;
  if (!v29) {
    FigSignalErrorAt();
  }
  int v27 = 0;
LABEL_46:

  return v27;
}

- (BOOL)chromaSuppressionEnabled
{
  return self->_chromaSuppressionEnabled;
}

- ($1C2F15E388ACAC30B05DEBDC3B062576)postDemosaicProcControls
{
  return ($1C2F15E388ACAC30B05DEBDC3B062576 *)memcpy(retstr, &self->_postDemosaicProcControls, 0x4B0uLL);
}

- (void).cxx_destruct
{
}

@end