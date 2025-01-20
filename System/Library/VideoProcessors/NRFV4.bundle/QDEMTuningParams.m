@interface QDEMTuningParams
- ($0B6BFDCBDEF98320025E934D6DCDDD13)config;
- (int)_setDefaultQDEMConfig;
- (int)readPlist:(id)a3;
@end

@implementation QDEMTuningParams

- (int)readPlist:(id)a3
{
  id v4 = a3;
  BOOL LUT = 0;
  int v5 = [(QDEMTuningParams *)self _setDefaultQDEMConfig];
  if (v5)
  {
    int v28 = v5;
    FigDebugAssert3();
    goto LABEL_70;
  }
  if (!v4) {
    goto LABEL_69;
  }
  unsigned int v6 = objc_msgSend(v4, "cmi_unsignedIntValueForKey:defaultValue:found:", @"GuidedFilterAlpha", 0, &LUT);
  if (LUT || (FigSignalErrorAt(), LUT)) {
    self->_config.GuidedFilterAlpha = (float)v6 * 0.00097656;
  }
  unsigned int v7 = objc_msgSend(v4, "cmi_unsignedIntValueForKey:defaultValue:found:", @"GFilterAlphaClampMin", 0, &LUT);
  if (LUT || (FigSignalErrorAt(), LUT)) {
    self->_config.GFilterAlphaClampMin = (float)v7 * 0.00097656;
  }
  unsigned int v8 = objc_msgSend(v4, "cmi_unsignedIntValueForKey:defaultValue:found:", @"GFilterAlphaClampMax", 0, &LUT);
  if (LUT || (FigSignalErrorAt(), LUT)) {
    self->_config.GFilterAlphaClampMax = (float)v8 * 0.00097656;
  }
  unsigned int v9 = objc_msgSend(v4, "cmi_unsignedIntValueForKey:defaultValue:found:", @"GradientThresholdC", 0, &LUT);
  if (LUT || (FigSignalErrorAt(), LUT)) {
    self->_config.GradientThresholdC = (float)v9 / 57087.0;
  }
  unsigned int v10 = objc_msgSend(v4, "cmi_unsignedIntValueForKey:defaultValue:found:", @"GradientThresholdE", 0, &LUT);
  if (LUT || (FigSignalErrorAt(), LUT)) {
    self->_config.GradientThresholdE = (float)v10 / 57087.0;
  }
  unsigned int v11 = objc_msgSend(v4, "cmi_unsignedIntValueForKey:defaultValue:found:", @"GradComp", 0, &LUT);
  if (LUT || (FigSignalErrorAt(), LUT)) {
    self->_config.GradComp = (float)v11 * 0.000015259;
  }
  unsigned int v12 = objc_msgSend(v4, "cmi_unsignedIntValueForKey:defaultValue:found:", @"GaussianHStrength", 0, &LUT);
  if (LUT || (FigSignalErrorAt(), LUT)) {
    self->_config.GaussianHStrength = (float)v12 * 0.00048828;
  }
  unsigned int v13 = objc_msgSend(v4, "cmi_unsignedIntValueForKey:defaultValue:found:", @"GaussianVStrength", 0, &LUT);
  if (LUT || (FigSignalErrorAt(), LUT)) {
    self->_config.GaussianVStrength = (float)v13 * 0.00048828;
  }
  unsigned int v14 = objc_msgSend(v4, "cmi_unsignedIntValueForKey:defaultValue:found:", @"GaussianD1Strength", 0, &LUT);
  if (LUT || (FigSignalErrorAt(), LUT)) {
    self->_config.GaussianD1Strength = (float)v14 * 0.00048828;
  }
  unsigned int v15 = objc_msgSend(v4, "cmi_unsignedIntValueForKey:defaultValue:found:", @"GaussianD2Strength", 0, &LUT);
  if (LUT || (FigSignalErrorAt(), LUT)) {
    self->_config.GaussianD2Strength = (float)v15 * 0.00048828;
  }
  unsigned int v16 = objc_msgSend(v4, "cmi_unsignedIntValueForKey:defaultValue:found:", @"DiagonalWeight", 0, &LUT);
  if (LUT || (FigSignalErrorAt(), LUT)) {
    self->_config.DiagonalWeight = (float)v16 * 0.25;
  }
  unsigned int v17 = objc_msgSend(v4, "cmi_unsignedIntValueForKey:defaultValue:found:", @"GradientPushD", 0, &LUT);
  if (LUT || (FigSignalErrorAt(), LUT)) {
    self->_config.GradientPushD = (float)v17 * 0.00048828;
  }
  unsigned int v18 = objc_msgSend(v4, "cmi_unsignedIntValueForKey:defaultValue:found:", @"GradientPushHV", 0, &LUT);
  if (LUT || (FigSignalErrorAt(), LUT)) {
    self->_config.GradientPushHV = (float)v18 * 0.00048828;
  }
  unsigned int v19 = objc_msgSend(v4, "cmi_unsignedIntValueForKey:defaultValue:found:", @"ColorGradientStrength", 0, &LUT);
  if (LUT || (FigSignalErrorAt(), LUT)) {
    self->_config.ColorGradientStrength = (float)v19 * 0.00048828;
  }
  char v20 = objc_msgSend(v4, "cmi_unsignedIntValueForKey:defaultValue:found:", @"GradientShiftD", 10, &LUT);
  if (LUT || (FigSignalErrorAt(), LUT)) {
    self->_config.GradientDivisorD = 1.0 / (float)(1 << v20);
  }
  char v21 = objc_msgSend(v4, "cmi_unsignedIntValueForKey:defaultValue:found:", @"GradientShiftHV", 3, &LUT);
  if (LUT || (FigSignalErrorAt(), LUT)) {
    self->_config.GradientDivisorHV = 1.0 / (float)(1 << v21);
  }
  int v22 = objc_msgSend(v4, "cmi_BOOLValueForKey:defaultValue:found:", @"EnableGaussianNR", 1, &LUT);
  self->_config.EnableGaussianNR = v22;
  if (LUT)
  {
    BOOL v23 = 0;
    if (!v22) {
      goto LABEL_57;
    }
  }
  else
  {
    FigSignalErrorAt();
    BOOL v23 = !LUT;
    if (!self->_config.EnableGaussianNR) {
      goto LABEL_57;
    }
  }
  if (!v23)
  {
    BOOL LUT = readLUT(v4, @"NoiseGradIndex", (uint64_t)&self->_config.NoiseSuppressionLUT, @"NoiseSuppressStrength", (uint64_t)self->_config.NoiseSuppressionLUT.NoiseSuppressStrength);
    if (!LUT) {
      goto LABEL_72;
    }
  }
LABEL_57:
  int v24 = objc_msgSend(v4, "cmi_BOOLValueForKey:defaultValue:found:", @"EnableAdaptiveGradPushD", 1, &LUT);
  self->_config.EnableAdaptiveGradPushD = v24;
  if (LUT)
  {
    BOOL v25 = 0;
    if (!v24) {
      goto LABEL_63;
    }
  }
  else
  {
    FigSignalErrorAt();
    BOOL v25 = !LUT;
    if (!self->_config.EnableAdaptiveGradPushD) {
      goto LABEL_63;
    }
  }
  if (!v25)
  {
    BOOL LUT = readLUT(v4, @"GradientDPushIndx", (uint64_t)&self->_config.GradientDPushLUT, @"GradientDPushLUT", (uint64_t)self->_config.GradientDPushLUT.GradientDPushLUT);
    if (!LUT) {
      goto LABEL_72;
    }
  }
LABEL_63:
  int EnableAdaptiveGradPushHV = objc_msgSend(v4, "cmi_BOOLValueForKey:defaultValue:found:", @"EnableAdaptiveGradPushHV", 1, &LUT);
  self->_config.int EnableAdaptiveGradPushHV = EnableAdaptiveGradPushHV;
  if (LUT)
  {
    BOOL v27 = 0;
  }
  else
  {
    FigSignalErrorAt();
    int EnableAdaptiveGradPushHV = self->_config.EnableAdaptiveGradPushHV;
    BOOL v27 = !LUT;
  }
  int v28 = 0;
  if (EnableAdaptiveGradPushHV && !v27)
  {
    BOOL LUT = readLUT(v4, @"GradientHVPushIndx", (uint64_t)&self->_config.GradientHVPushLUT, @"GradientHVPushLUT", (uint64_t)self->_config.GradientHVPushLUT.GradientHVPushLUT);
    if (LUT)
    {
LABEL_69:
      int v28 = 0;
      goto LABEL_70;
    }
LABEL_72:
    FigDebugAssert3();
    int v28 = FigSignalErrorAt();
  }
LABEL_70:

  return v28;
}

- (int)_setDefaultQDEMConfig
{
  *(_OWORD *)&self->_config.GuidedFilterAlpha = xmmword_2634814F0;
  *(_OWORD *)&self->_config.GradientThresholdE = xmmword_263481500;
  *(_OWORD *)&self->_config.GaussianD1Strength = xmmword_263481510;
  *(_OWORD *)&self->_config.GradientDivisorD = xmmword_263481520;
  self->_config.NoiseSuppressionBOOL LUT = *($829E8DBCC2FBAB54C615A5D56E347167 *)zmmword_263481530;
  self->_config.GradientDPushBOOL LUT = *($27ECC4CC7FAB4E4980B5C56F0DD20C72 *)zmmword_263481570;
  *(_OWORD *)self->_config.GradientHVPushLUT.GradientHVPushIndx = xmmword_2634815B0;
  *(_OWORD *)&self->_config.GradientHVPushLUT.GradientHVPushIndx[8] = unk_2634815C0;
  *(_OWORD *)self->_config.GradientHVPushLUT.GradientHVPushBOOL LUT = xmmword_2634815D0;
  *(_WORD *)&self->_config.EnableGaussianNR = 257;
  self->_config.int EnableAdaptiveGradPushHV = 1;
  *(_OWORD *)&self->_config.GradientHVPushLUT.GradientHVPushLUT[8] = unk_2634815E0;
  return 0;
}

- ($0B6BFDCBDEF98320025E934D6DCDDD13)config
{
  return ($0B6BFDCBDEF98320025E934D6DCDDD13 *)memcpy(retstr, &self->_config, sizeof($0B6BFDCBDEF98320025E934D6DCDDD13));
}

@end