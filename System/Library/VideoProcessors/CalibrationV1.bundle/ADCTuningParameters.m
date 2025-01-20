@interface ADCTuningParameters
- (ADCTuningParameters)init;
- (ADCTuningParameters)initWithDictionary:(id)a3;
- (AdaptiveCorrectionConfig)adaptiveCorrectionConfig;
- (BOOL)readAdaptiveCorrectionConfig:(id)a3;
- (const)getAdaptiveCorrectionConfigPtr;
- (float)checkAndCorrectFocalLengthTele:(float)result;
- (float)checkAndCorrectFocalLengthWide:(float)result;
- (float)defaultFocalLengthTeleMaxDeviationMicrometers;
- (float)defaultFocalLengthTeleMicrometers;
- (float)defaultFocalLengthWideMaxDeviationMicrometers;
- (float)defaultFocalLengthWideMicrometers;
- (float)keypointsDetectionThreshold;
@end

@implementation ADCTuningParameters

- (ADCTuningParameters)init
{
  v6.receiver = self;
  v6.super_class = (Class)ADCTuningParameters;
  v2 = [(ADCTuningParameters *)&v6 init];
  v3 = (ADCTuningParameters *)v2;
  if (v2)
  {
    *((_DWORD *)v2 + 6) = 1140457472;
    *(_OWORD *)(v2 + 8) = xmmword_262E89A30;
    *((_OWORD *)v2 + 2) = xmmword_262E899E0;
    *((_OWORD *)v2 + 3) = xmmword_262E899F0;
    *((_OWORD *)v2 + 4) = xmmword_262E89A00;
    *((_OWORD *)v2 + 5) = xmmword_262E89A00;
    *((_OWORD *)v2 + 6) = xmmword_262E89B00;
    *((_DWORD *)v2 + 28) = 50;
    *(_OWORD *)(v2 + 120) = xmmword_262E89A20;
    *((void *)v2 + 17) = 0x3FB999999999999ALL;
    v2[144] = 1;
    *((void *)v2 + 19) = 0x3F50624DD2F1A9FCLL;
    *((void *)v2 + 20) = 0x4080000000000000;
    *((void *)v2 + 21) = 0;
    *((void *)v2 + 22) = 0;
    *(_OWORD *)(v2 + 200) = 0u;
    *(_OWORD *)(v2 + 216) = 0u;
    *(_OWORD *)(v2 + 232) = 0u;
    *(_OWORD *)(v2 + 248) = 0u;
    *((void *)v2 + 37) = 0;
    *(_OWORD *)(v2 + 184) = 0u;
    *(_OWORD *)(v2 + 264) = 0u;
    *(_OWORD *)(v2 + 280) = 0u;
    *((void *)v2 + 52) = 0;
    *((_OWORD *)v2 + 24) = 0u;
    *((_OWORD *)v2 + 25) = 0u;
    *((_OWORD *)v2 + 22) = 0u;
    *((_OWORD *)v2 + 23) = 0u;
    *((_OWORD *)v2 + 20) = 0u;
    *((_OWORD *)v2 + 21) = 0u;
    *((_OWORD *)v2 + 19) = 0u;
    *(_OWORD *)(v2 + 424) = 0u;
    *(_OWORD *)(v2 + 440) = 0u;
    *(_OWORD *)(v2 + 456) = 0u;
    *(_OWORD *)(v2 + 472) = 0u;
    *(_OWORD *)(v2 + 488) = 0u;
    *(_OWORD *)(v2 + 504) = 0u;
    *(_OWORD *)(v2 + 520) = 0u;
    *((void *)v2 + 67) = 0;
    v4 = v2;
  }

  return v3;
}

- (BOOL)readAdaptiveCorrectionConfig:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_28;
  }
  sub_262E82758(v4, (uint64_t)"epErrorLimitWidePix_FirstPass", &self->_adaptiveCorrectionConfig.epErrorLimitWidePix_FirstPass);
  if (!v6) {
    goto LABEL_28;
  }
  sub_262E82758(v5, (uint64_t)"epErrorLimitWidePix_SecondPass", &self->_adaptiveCorrectionConfig.epErrorLimitWidePix_SecondPass);
  if (!v7) {
    goto LABEL_28;
  }
  sub_262E82758(v5, (uint64_t)"rangePFL_T", &self->_adaptiveCorrectionConfig.rangePFL_T);
  if (!v8) {
    goto LABEL_28;
  }
  sub_262E82758(v5, (uint64_t)"rangePFL_W", &self->_adaptiveCorrectionConfig.rangePFL_W);
  if (!v9) {
    goto LABEL_28;
  }
  sub_262E82758(v5, (uint64_t)"rangeOCxT", &self->_adaptiveCorrectionConfig.rangeOCxT);
  if (!v10) {
    goto LABEL_28;
  }
  sub_262E82758(v5, (uint64_t)"rangeOCxW", &self->_adaptiveCorrectionConfig.rangeOCxW);
  if (!v11) {
    goto LABEL_28;
  }
  sub_262E82758(v5, (uint64_t)"rangeOCyT", &self->_adaptiveCorrectionConfig.rangeOCyT);
  if (!v12) {
    goto LABEL_28;
  }
  sub_262E82758(v5, (uint64_t)"rangeOCyW", &self->_adaptiveCorrectionConfig.rangeOCyW);
  if (!v13) {
    goto LABEL_28;
  }
  sub_262E82758(v5, (uint64_t)"intermediateMacroDistMM", &self->_adaptiveCorrectionConfig.intermediateMacroDistMM);
  if (!v14) {
    goto LABEL_28;
  }
  sub_262E82758(v5, (uint64_t)"extremeMacroDistMM", &self->_adaptiveCorrectionConfig.extremeMacroDistMM);
  if (!v15) {
    goto LABEL_28;
  }
  v16 = NSString;
  id v17 = v5;
  objc_msgSend_stringWithUTF8String_(v16, v18, (uint64_t)"minPointsForAdjustment", v19, v20, v21);
  LODWORD(v16) = FigCFDictionaryGetInt32IfPresent();

  if (!v16) {
    goto LABEL_28;
  }
  self->_adaptiveCorrectionConfig.minPointsForAdjustment = 0;
  sub_262E82758(v17, (uint64_t)"errorVal_GreaterThanInf", &self->_adaptiveCorrectionConfig.errorVal_GreaterThanInf);
  if (!v22) {
    goto LABEL_28;
  }
  sub_262E82758(v17, (uint64_t)"errorVal_LessThanExtremeMacro", &self->_adaptiveCorrectionConfig.errorVal_LessThanExtremeMacro);
  if (v23
    && (sub_262E82758(v17, (uint64_t)"errorVal_BetweenIntermediate_ExtremeMacro", &self->_adaptiveCorrectionConfig.errorVal_BetweenIntermediate_ExtremeMacro), v24)&& (sub_262E82758(v17, (uint64_t)"spgEpsilon", &self->_adaptiveCorrectionConfig.spgEpsilon), v25)&& (sub_262E827F4(v17, (uint64_t)"keypointOutliersPercentile", &self->_adaptiveCorrectionConfig.keypointOutliersPercentile), v26)&& (sub_262E827F4(v17, (uint64_t)"temporalFilteringStrength", &self->_adaptiveCorrectionConfig.temporalFilteringStrength), v27)&& (*(float *)&double v32 = sub_262E827F4(v17, (uint64_t)"temporalFilteringStrengthParallel", &self->_adaptiveCorrectionConfig.temporalFilteringStrengthParallel),
        v33))
  {
    v34 = objc_msgSend_objectForKeyedSubscript_(v17, v28, @"runAnalyticalPreconditioning", v29, v30, v31, v32);
    v40 = v34;
    if (v34)
    {
      self->_adaptiveCorrectionConfig.runAnalyticalPreconditioning = objc_msgSend_intValue(v34, v35, v36, v37, v38, v39) != 0;
      sub_262E827F4(v17, (uint64_t)"epErrorLimitTelePix_ParallelCorrection", &self->_adaptiveCorrectionConfig.epErrorLimitTelePix_ParallelCorrection);
      if ((v41 & 1) == 0)
      {
        float epErrorLimitWidePix_SecondPass = self->_adaptiveCorrectionConfig.epErrorLimitWidePix_SecondPass;
        self->_adaptiveCorrectionConfig.epErrorLimitTelePix_ParallelCorrection = epErrorLimitWidePix_SecondPass;
      }
      sub_262E827F4(v17, (uint64_t)"temporalInitializationFactor", &self->_adaptiveCorrectionConfig.temporalInitializationFactor);
      if ((v43 & 1) == 0) {
        self->_adaptiveCorrectionConfig.temporalInitializationFactor = 0.0;
      }
      p_scaleTuningWithDigitalZoomByFactor = &self->_adaptiveCorrectionConfig.scaleTuningWithDigitalZoomByFactor;
      sub_262E827F4(v17, (uint64_t)"scaleTuningWithDigitalZoomByFactor", p_scaleTuningWithDigitalZoomByFactor);
      if ((v45 & 1) == 0) {
        float *p_scaleTuningWithDigitalZoomByFactor = 0.0;
      }
      BOOL v46 = 1;
    }
    else
    {
      BOOL v46 = 0;
    }
  }
  else
  {
LABEL_28:
    BOOL v46 = 0;
    v40 = 0;
  }

  return v46;
}

- (ADCTuningParameters)initWithDictionary:(id)a3
{
  id v4 = a3;
  int v14 = (_DWORD *)objc_msgSend_init(self, v5, v6, v7, v8, v9);
  if (!v14)
  {
    double v32 = 0;
    v16 = 0;
    goto LABEL_12;
  }
  int v15 = objc_msgSend_objectForKeyedSubscript_(v4, v10, @"Calibration", v11, v12, v13);
  v16 = v15;
  if (!v15
    || (sub_262E827F4(v15, (uint64_t)"defaultFocalLengthTeleMicrometers", v14 + 3), !v17)
    || (sub_262E827F4(v16, (uint64_t)"defaultFocalLengthWideMicrometers", v14 + 5), !v18)
    || (sub_262E827F4(v16, (uint64_t)"defaultFocalLengthTeleMaxDeviationMicrometers", v14 + 4), !v19)
    || (sub_262E827F4(v16, (uint64_t)"defaultFocalLengthWideMaxDeviationMicrometers", v14 + 6), !v20)
    || (*(float *)&double v25 = sub_262E827F4(v16, (uint64_t)"keypointsDetectionThreshold", v14 + 2), !v26))
  {
    double v32 = 0;
LABEL_12:
    int v27 = 0;
    goto LABEL_10;
  }
  int v27 = objc_msgSend_objectForKeyedSubscript_(v4, v21, @"ADC", v22, v23, v24, v25);
  if (objc_msgSend_readAdaptiveCorrectionConfig_(v14, v28, (uint64_t)v27, v29, v30, v31)) {
    double v32 = v14;
  }
  else {
    double v32 = 0;
  }
LABEL_10:

  return v32;
}

- (const)getAdaptiveCorrectionConfigPtr
{
  return &self->_adaptiveCorrectionConfig;
}

- (float)checkAndCorrectFocalLengthTele:(float)result
{
  float defaultFocalLengthTeleMicrometers = self->_defaultFocalLengthTeleMicrometers;
  float defaultFocalLengthTeleMaxDeviationMicrometers = self->_defaultFocalLengthTeleMaxDeviationMicrometers;
  if ((float)(defaultFocalLengthTeleMicrometers + defaultFocalLengthTeleMaxDeviationMicrometers) < result
    || (float)(defaultFocalLengthTeleMicrometers - defaultFocalLengthTeleMaxDeviationMicrometers) > result)
  {
    return self->_defaultFocalLengthTeleMicrometers;
  }
  return result;
}

- (float)checkAndCorrectFocalLengthWide:(float)result
{
  float defaultFocalLengthWideMicrometers = self->_defaultFocalLengthWideMicrometers;
  float defaultFocalLengthWideMaxDeviationMicrometers = self->_defaultFocalLengthWideMaxDeviationMicrometers;
  if ((float)(defaultFocalLengthWideMicrometers + defaultFocalLengthWideMaxDeviationMicrometers) < result
    || (float)(defaultFocalLengthWideMicrometers - defaultFocalLengthWideMaxDeviationMicrometers) > result)
  {
    return self->_defaultFocalLengthWideMicrometers;
  }
  return result;
}

- (float)keypointsDetectionThreshold
{
  return self->_keypointsDetectionThreshold;
}

- (float)defaultFocalLengthTeleMicrometers
{
  return self->_defaultFocalLengthTeleMicrometers;
}

- (float)defaultFocalLengthTeleMaxDeviationMicrometers
{
  return self->_defaultFocalLengthTeleMaxDeviationMicrometers;
}

- (float)defaultFocalLengthWideMicrometers
{
  return self->_defaultFocalLengthWideMicrometers;
}

- (float)defaultFocalLengthWideMaxDeviationMicrometers
{
  return self->_defaultFocalLengthWideMaxDeviationMicrometers;
}

- (AdaptiveCorrectionConfig)adaptiveCorrectionConfig
{
  return (AdaptiveCorrectionConfig *)memcpy(retstr, &self->_adaptiveCorrectionConfig, sizeof(AdaptiveCorrectionConfig));
}

@end