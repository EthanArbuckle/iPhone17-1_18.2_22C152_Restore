@interface RawNightModeMultiFrameOutlierPixelCorrectionTuningParams
- (BOOL)enabled;
- (float)getGammaMultiFrame:(float)a3;
- (float)getGammaSingleFrame:(float)a3;
- (int)readPlist:(id)a3;
- (unsigned)skipMultiFrame;
- (unsigned)skipSingleFrame;
@end

@implementation RawNightModeMultiFrameOutlierPixelCorrectionTuningParams

- (int)readPlist:(id)a3
{
  char v25 = 0;
  v24.receiver = self;
  v24.super_class = (Class)RawNightModeMultiFrameOutlierPixelCorrectionTuningParams;
  id v4 = a3;
  [(CMITuningPlist *)&v24 readPlist:v4];
  v5 = [v4 objectForKeyedSubscript:@"NetworkParameters"];

  v6 = [v5 objectForKeyedSubscript:@"PreNetwork"];

  if (!v6)
  {
    FigDebugAssert3();
    int v22 = FigSignalErrorAt();
    id v9 = 0;
LABEL_30:
    v11 = 0;
LABEL_32:
    v17 = 0;
    goto LABEL_27;
  }
  v7 = [v6 objectForKeyedSubscript:@"MultiFrameOutlierPixelCorrection"];
  v8 = v7;
  if (!v7)
  {
    FigSignalErrorAt();
    v8 = (void *)MEMORY[0x263EFFA78];
  }
  id v9 = v8;

  self->_enabled = objc_msgSend(v9, "cmi_BOOLValueForKey:defaultValue:found:", @"Enabled", 0, &v25);
  if (!v25) {
    FigSignalErrorAt();
  }
  unsigned int skipSingleFrame = objc_msgSend(v9, "cmi_unsignedIntValueForKey:defaultValue:found:", @"SkipSingleFrame", 2, &v25);
  self->_unsigned int skipSingleFrame = skipSingleFrame;
  if (!v25)
  {
    FigSignalErrorAt();
    unsigned int skipSingleFrame = self->_skipSingleFrame;
  }
  if (skipSingleFrame - 3 <= 0xFFFFFFFD)
  {
    FigDebugAssert3();
    int v22 = FigSignalErrorAt();
    goto LABEL_30;
  }
  v11 = [v9 objectForKey:@"GammaSingleFrame"];
  if (!v11) {
    FigSignalErrorAt();
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v11 count])
    {
LABEL_31:
      FigDebugAssert3();
      int v22 = FigSignalErrorAt();
      goto LABEL_32;
    }
    v13 = (NSArray *)[v11 copy];
    gammaSingleFrameArray = self->_gammaSingleFrameArray;
    self->_gammaSingleFrameArray = v13;
  }
  else
  {
    LODWORD(v12) = 10.0;
    objc_msgSend(v9, "cmi_floatValueForKey:defaultValue:found:", @"GammaSingleFrame", &v25, v12);
    self->_gammaSingleFrame = v15;
    if (!v25) {
      FigSignalErrorAt();
    }
  }
  unsigned int skipMultiFrame = objc_msgSend(v9, "cmi_unsignedIntValueForKey:defaultValue:found:", @"SkipMultiFrame", 2, &v25);
  self->_unsigned int skipMultiFrame = skipMultiFrame;
  if (!v25)
  {
    FigSignalErrorAt();
    unsigned int skipMultiFrame = self->_skipMultiFrame;
  }
  if (skipMultiFrame - 3 <= 0xFFFFFFFD) {
    goto LABEL_31;
  }
  v17 = [v9 objectForKey:@"GammaMultiFrame"];
  if (!v17) {
    FigSignalErrorAt();
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v17 count])
    {
      FigDebugAssert3();
      int v22 = FigSignalErrorAt();
      goto LABEL_27;
    }
    v19 = (NSArray *)[v17 copy];
    gammaMultiFrameArray = self->_gammaMultiFrameArray;
    self->_gammaMultiFrameArray = v19;
  }
  else
  {
    LODWORD(v18) = 10.0;
    objc_msgSend(v9, "cmi_floatValueForKey:defaultValue:found:", @"GammaMultiFrame", &v25, v18);
    self->_gammaMultiFrame = v21;
    if (!v25) {
      FigSignalErrorAt();
    }
  }
  int v22 = 0;
LABEL_27:

  return v22;
}

- (float)getGammaSingleFrame:(float)a3
{
  gammaSingleFrameArray = self->_gammaSingleFrameArray;
  if (!gammaSingleFrameArray) {
    return self->_gammaSingleFrame;
  }
  -[NSArray cmi_interpolateValueForGain:](gammaSingleFrameArray, "cmi_interpolateValueForGain:");
  self->_gammaSingleFrame = result;
  return result;
}

- (float)getGammaMultiFrame:(float)a3
{
  gammaMultiFrameArray = self->_gammaMultiFrameArray;
  if (!gammaMultiFrameArray) {
    return self->_gammaMultiFrame;
  }
  -[NSArray cmi_interpolateValueForGain:](gammaMultiFrameArray, "cmi_interpolateValueForGain:");
  self->_gammaMultiFrame = result;
  return result;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (unsigned)skipSingleFrame
{
  return self->_skipSingleFrame;
}

- (unsigned)skipMultiFrame
{
  return self->_skipMultiFrame;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gammaMultiFrameArray, 0);

  objc_storeStrong((id *)&self->_gammaSingleFrameArray, 0);
}

@end