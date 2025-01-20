@interface CalibrationTuningParameters
- (AdaptiveCorrectionConfig)adaptiveCorrectionConfig;
- (CalibrationTuningParameters)init;
- (CalibrationTuningParameters)initWithTuningDictionary:(id)a3 cameraInfoByPortType:(id)a4;
- (const)getAdaptiveCorrectionConfigPtr;
- (float)defaultFocalLengthTeleMaxDeviationMicrometers;
- (float)defaultFocalLengthTeleMicrometers;
- (float)defaultFocalLengthWideMaxDeviationMicrometers;
- (float)defaultFocalLengthWideMicrometers;
- (float)keypointsDetectionThreshold;
- (float)midLimitDistanceMM;
- (float)nearLimitDistanceMM;
- (int)readAdaptiveCorrectionConfig:(id)a3 isUpdating:(BOOL)a4;
- (int)readCalibrationConfig:(id)a3 isUpdating:(BOOL)a4;
- (int)updateTuningParametersWith:(id)a3;
- (void)setDefaultAdaptiveCorrectionParameters;
- (void)setDefaultCalibrationParameters;
- (void)setDefaultRPDParameters;
@end

@implementation CalibrationTuningParameters

- (void)setDefaultAdaptiveCorrectionParameters
{
  *(_OWORD *)&self->_adaptiveCorrectionConfig.epErrorLimitWidePix_FirstPass = xmmword_262E899E0;
  *(_OWORD *)&self->_adaptiveCorrectionConfig.rangePFL_T = xmmword_262E899F0;
  *(_OWORD *)&self->_adaptiveCorrectionConfig.rangeOCxT = xmmword_262E89A00;
  *(_OWORD *)&self->_adaptiveCorrectionConfig.rangeOCyW = xmmword_262E89A10;
  self->_adaptiveCorrectionConfig.extremeMacroDistMM = 300.0;
  self->_adaptiveCorrectionConfig.minPointsForAdjustment = 50;
  *(_OWORD *)&self->_adaptiveCorrectionConfig.errorVal_GreaterThanInf = xmmword_262E89A20;
  self->_adaptiveCorrectionConfig.errorVal_BetweenIntermediate_ExtremeMacro = 0.1;
  self->_adaptiveCorrectionConfig.runAnalyticalPreconditioning = 1;
  self->_adaptiveCorrectionConfig.spgEpsilon = 0.001;
  *(void *)&self->_adaptiveCorrectionConfig.keypointOutliersPercentile = 0x4080000000000000;
  *(void *)&self->_adaptiveCorrectionConfig.temporalFilteringStrength = 0;
  *(void *)&self->_adaptiveCorrectionConfig.temporalInitializationFactor = 0;
  *(_OWORD *)&self->_adaptiveCorrectionConfig.overrideConfigPass1.isValid = 0u;
  *(_OWORD *)&self->_adaptiveCorrectionConfig.overrideConfigPass1.rangePFL_T = 0u;
  *(_OWORD *)&self->_adaptiveCorrectionConfig.overrideConfigPass1.rangeOCxT = 0u;
  *(_OWORD *)&self->_adaptiveCorrectionConfig.overrideConfigPass1.rangeOCyT = 0u;
  *(_OWORD *)&self->_adaptiveCorrectionConfig.overrideConfigPass1.rangePFL_T_dist = 0u;
  *(_OWORD *)&self->_adaptiveCorrectionConfig.overrideConfigPass1.rangeOCxT_dist = 0u;
  *(_OWORD *)&self->_adaptiveCorrectionConfig.overrideConfigPass1.minPointsForAdjustment = 0u;
  *(void *)&self->_adaptiveCorrectionConfig.overrideConfigPass1.spgMaxIterations = 0;
  *(void *)&self->_adaptiveCorrectionConfig.overrideConfigPass2.spgMaxIterations = 0;
  *(_OWORD *)&self->_adaptiveCorrectionConfig.overrideConfigPass2.rangeOCxT_dist = 0u;
  *(_OWORD *)&self->_adaptiveCorrectionConfig.overrideConfigPass2.minPointsForAdjustment = 0u;
  *(_OWORD *)&self->_adaptiveCorrectionConfig.overrideConfigPass2.rangeOCyT = 0u;
  *(_OWORD *)&self->_adaptiveCorrectionConfig.overrideConfigPass2.rangePFL_T_dist = 0u;
  *(_OWORD *)&self->_adaptiveCorrectionConfig.overrideConfigPass2.rangePFL_T = 0u;
  *(_OWORD *)&self->_adaptiveCorrectionConfig.overrideConfigPass2.rangeOCxT = 0u;
  *(_OWORD *)&self->_adaptiveCorrectionConfig.overrideConfigPass2.isValid = 0u;
  *(_OWORD *)&self->_adaptiveCorrectionConfig.overrideConfigPassDist.isValid = 0u;
  *(_OWORD *)&self->_adaptiveCorrectionConfig.overrideConfigPassDist.rangePFL_T = 0u;
  *(_OWORD *)&self->_adaptiveCorrectionConfig.overrideConfigPassDist.rangeOCxT = 0u;
  *(_OWORD *)&self->_adaptiveCorrectionConfig.overrideConfigPassDist.rangeOCyT = 0u;
  *(_OWORD *)&self->_adaptiveCorrectionConfig.overrideConfigPassDist.rangePFL_T_dist = 0u;
  *(_OWORD *)&self->_adaptiveCorrectionConfig.overrideConfigPassDist.rangeOCxT_dist = 0u;
  *(_OWORD *)&self->_adaptiveCorrectionConfig.overrideConfigPassDist.minPointsForAdjustment = 0u;
  *(void *)&self->_adaptiveCorrectionConfig.overrideConfigPassDist.spgMaxIterations = 0;
}

- (void)setDefaultCalibrationParameters
{
  self->_defaultFocalLengthWideMaxDeviationMicrometers = 500.0;
  *(_OWORD *)&self->_keypointsDetectionThreshold = xmmword_262E89A30;
}

- (void)setDefaultRPDParameters
{
  *(void *)&self->_nearLimitDistanceMM = 0x447A000043960000;
}

- (CalibrationTuningParameters)init
{
  v20.receiver = self;
  v20.super_class = (Class)CalibrationTuningParameters;
  v2 = [(CalibrationTuningParameters *)&v20 init];
  v8 = v2;
  if (v2)
  {
    objc_msgSend_setDefaultCalibrationParameters(v2, v3, v4, v5, v6, v7);
    objc_msgSend_setDefaultRPDParameters(v8, v9, v10, v11, v12, v13);
    objc_msgSend_setDefaultAdaptiveCorrectionParameters(v8, v14, v15, v16, v17, v18);
  }
  return v8;
}

- (int)readCalibrationConfig:(id)a3 isUpdating:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v10 = v6;
  if (!v6)
  {
    int v11 = -12780;
    goto LABEL_23;
  }
  float v26 = 0.0;
  int v11 = sub_262E76EFC(v6, (const char *)@"defaultFocalLengthTeleMicrometers", &v26, v7, v8, v9);
  if (v11)
  {
    if (!v4) {
      goto LABEL_23;
    }
    float v26 = 0.0;
    if (!sub_262E76EFC(v10, (const char *)@"defaultFocalLengthWideMicrometers", &v26, v12, v13, v14))goto LABEL_9; {
  }
    }
  else
  {
    self->_defaultFocalLengthTeleMicrometers = v26;
    float v26 = 0.0;
    int v11 = sub_262E76EFC(v10, (const char *)@"defaultFocalLengthWideMicrometers", &v26, v12, v13, v14);
    if (!v11)
    {
LABEL_9:
      self->_defaultFocalLengthWideMicrometers = v26;
      goto LABEL_10;
    }
    if (!v4) {
      goto LABEL_23;
    }
  }
LABEL_10:
  float v26 = 0.0;
  int v11 = sub_262E76EFC(v10, (const char *)@"defaultFocalLengthTeleMaxDeviationMicrometers", &v26, v15, v16, v17);
  if (v11)
  {
    if (!v4) {
      goto LABEL_23;
    }
    float v26 = 0.0;
    if (!sub_262E76EFC(v10, (const char *)@"defaultFocalLengthWideMaxDeviationMicrometers", &v26, v18, v19, v20))goto LABEL_17; {
  }
    }
  else
  {
    self->_defaultFocalLengthTeleMaxDeviationMicrometers = v26;
    float v26 = 0.0;
    int v11 = sub_262E76EFC(v10, (const char *)@"defaultFocalLengthWideMaxDeviationMicrometers", &v26, v18, v19, v20);
    if (!v11)
    {
LABEL_17:
      self->_defaultFocalLengthWideMaxDeviationMicrometers = v26;
      goto LABEL_18;
    }
    if (!v4) {
      goto LABEL_23;
    }
  }
LABEL_18:
  float v26 = 0.0;
  int v11 = sub_262E76EFC(v10, (const char *)@"keypointsDetectionThreshold", &v26, v21, v22, v23);
  if (!v11)
  {
    self->_keypointsDetectionThreshold = v26;
    goto LABEL_22;
  }
  if (v4) {
LABEL_22:
  }
    int v11 = 0;
LABEL_23:
  if (v4) {
    int v24 = 0;
  }
  else {
    int v24 = v11;
  }

  return v24;
}

- (int)readAdaptiveCorrectionConfig:(id)a3 isUpdating:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v10 = v6;
  if (!v6)
  {
    int v11 = -12780;
    goto LABEL_81;
  }
  double v74 = 0.0;
  int v11 = sub_262E77438(v6, (const char *)@"epErrorLimitWidePix_FirstPass", &v74, v7, v8, v9);
  if (v11)
  {
    if (!v4) {
      goto LABEL_81;
    }
    double v74 = 0.0;
    if (!sub_262E77438(v10, (const char *)@"epErrorLimitWidePix_SecondPass", &v74, v12, v13, v14)) {
      goto LABEL_9;
    }
  }
  else
  {
    self->_adaptiveCorrectionConfig.epErrorLimitWidePix_FirstPass = v74;
    double v74 = 0.0;
    int v11 = sub_262E77438(v10, (const char *)@"epErrorLimitWidePix_SecondPass", &v74, v12, v13, v14);
    if (!v11)
    {
LABEL_9:
      self->_adaptiveCorrectionConfig.epErrorLimitWidePix_SecondPass = v74;
      goto LABEL_10;
    }
    if (!v4) {
      goto LABEL_81;
    }
  }
LABEL_10:
  double v74 = 0.0;
  int v11 = sub_262E77438(v10, (const char *)@"rangePFL_T", &v74, v15, v16, v17);
  if (v11)
  {
    if (!v4) {
      goto LABEL_81;
    }
    double v74 = 0.0;
    if (!sub_262E77438(v10, (const char *)@"rangePFL_W", &v74, v18, v19, v20)) {
      goto LABEL_17;
    }
  }
  else
  {
    self->_adaptiveCorrectionConfig.rangePFL_T = v74;
    double v74 = 0.0;
    int v11 = sub_262E77438(v10, (const char *)@"rangePFL_W", &v74, v18, v19, v20);
    if (!v11)
    {
LABEL_17:
      self->_adaptiveCorrectionConfig.rangePFL_W = v74;
      goto LABEL_18;
    }
    if (!v4) {
      goto LABEL_81;
    }
  }
LABEL_18:
  double v74 = 0.0;
  int v11 = sub_262E77438(v10, (const char *)@"rangeOCxT", &v74, v21, v22, v23);
  if (v11)
  {
    if (!v4) {
      goto LABEL_81;
    }
    double v74 = 0.0;
    if (!sub_262E77438(v10, (const char *)@"rangeOCxW", &v74, v24, v25, v26)) {
      goto LABEL_25;
    }
  }
  else
  {
    self->_adaptiveCorrectionConfig.rangeOCxT = v74;
    double v74 = 0.0;
    int v11 = sub_262E77438(v10, (const char *)@"rangeOCxW", &v74, v24, v25, v26);
    if (!v11)
    {
LABEL_25:
      self->_adaptiveCorrectionConfig.rangeOCxW = v74;
      goto LABEL_26;
    }
    if (!v4) {
      goto LABEL_81;
    }
  }
LABEL_26:
  double v74 = 0.0;
  int v11 = sub_262E77438(v10, (const char *)@"rangeOCyW", &v74, v27, v28, v29);
  if (v11)
  {
    if (!v4) {
      goto LABEL_81;
    }
    double v74 = 0.0;
    if (!sub_262E77438(v10, (const char *)@"intermediateMacroDistMM", &v74, v30, v31, v32)) {
      goto LABEL_33;
    }
  }
  else
  {
    self->_adaptiveCorrectionConfig.rangeOCyW = v74;
    double v74 = 0.0;
    int v11 = sub_262E77438(v10, (const char *)@"intermediateMacroDistMM", &v74, v30, v31, v32);
    if (!v11)
    {
LABEL_33:
      self->_adaptiveCorrectionConfig.intermediateMacroDistMM = v74;
      goto LABEL_34;
    }
    if (!v4) {
      goto LABEL_81;
    }
  }
LABEL_34:
  double v74 = 0.0;
  int v11 = sub_262E77438(v10, (const char *)@"extremeMacroDistMM", &v74, v33, v34, v35);
  if (v11)
  {
    if (!v4) {
      goto LABEL_81;
    }
    LODWORD(v74) = 0;
    if (!sub_262E77490(v10, (const char *)@"minPointsForAdjustment", &v74, v36, v37, v38)) {
      goto LABEL_41;
    }
  }
  else
  {
    self->_adaptiveCorrectionConfig.extremeMacroDistMM = v74;
    LODWORD(v74) = 0;
    int v11 = sub_262E77490(v10, (const char *)@"minPointsForAdjustment", &v74, v36, v37, v38);
    if (!v11)
    {
LABEL_41:
      self->_adaptiveCorrectionConfig.minPointsForAdjustment = LODWORD(v74);
      goto LABEL_42;
    }
    if (!v4) {
      goto LABEL_81;
    }
  }
LABEL_42:
  double v74 = 0.0;
  int v11 = sub_262E77438(v10, (const char *)@"errorVal_GreaterThanInf", &v74, v39, v40, v41);
  if (v11)
  {
    if (!v4) {
      goto LABEL_81;
    }
    double v74 = 0.0;
    if (!sub_262E77438(v10, (const char *)@"errorVal_LessThanExtremeMacro", &v74, v42, v43, v44)) {
      goto LABEL_49;
    }
  }
  else
  {
    self->_adaptiveCorrectionConfig.errorVal_GreaterThanInf = v74;
    double v74 = 0.0;
    int v11 = sub_262E77438(v10, (const char *)@"errorVal_LessThanExtremeMacro", &v74, v42, v43, v44);
    if (!v11)
    {
LABEL_49:
      self->_adaptiveCorrectionConfig.errorVal_LessThanExtremeMacro = v74;
      goto LABEL_50;
    }
    if (!v4) {
      goto LABEL_81;
    }
  }
LABEL_50:
  double v74 = 0.0;
  int v11 = sub_262E77438(v10, (const char *)@"errorVal_BetweenIntermediate_ExtremeMacro", &v74, v45, v46, v47);
  if (v11)
  {
    if (!v4) {
      goto LABEL_81;
    }
    double v74 = 0.0;
    if (!sub_262E77438(v10, (const char *)@"spgEpsilon", &v74, v48, v49, v50)) {
      goto LABEL_57;
    }
  }
  else
  {
    self->_adaptiveCorrectionConfig.errorVal_BetweenIntermediate_ExtremeMacro = v74;
    double v74 = 0.0;
    int v11 = sub_262E77438(v10, (const char *)@"spgEpsilon", &v74, v48, v49, v50);
    if (!v11)
    {
LABEL_57:
      self->_adaptiveCorrectionConfig.spgEpsilon = v74;
      goto LABEL_58;
    }
    if (!v4) {
      goto LABEL_81;
    }
  }
LABEL_58:
  LODWORD(v74) = 0;
  int v11 = sub_262E77490(v10, (const char *)@"runAnalyticalPreconditioning", &v74, v51, v52, v53);
  if (v11)
  {
    if (!v4) {
      goto LABEL_81;
    }
    LODWORD(v74) = 0;
    if (!sub_262E76EFC(v10, (const char *)@"keypointOutliersPercentile", &v74, v54, v55, v56)) {
      goto LABEL_65;
    }
  }
  else
  {
    self->_adaptiveCorrectionConfig.runAnalyticalPreconditioning = LODWORD(v74) != 0;
    LODWORD(v74) = 0;
    int v11 = sub_262E76EFC(v10, (const char *)@"keypointOutliersPercentile", &v74, v54, v55, v56);
    if (!v11)
    {
LABEL_65:
      self->_adaptiveCorrectionConfig.keypointOutliersPercentile = *(float *)&v74;
      goto LABEL_66;
    }
    if (!v4) {
      goto LABEL_81;
    }
  }
LABEL_66:
  LODWORD(v74) = 0;
  if (!sub_262E76EFC(v10, (const char *)@"epErrorLimitTelePix_ParallelCorrection", &v74, v57, v58, v59))self->_adaptiveCorrectionConfig.epErrorLimitTelePix_ParallelCorrection = *(float *)&v74; {
  LODWORD(v74) = 0;
  }
  int v11 = sub_262E76EFC(v10, (const char *)@"temporalFilteringStrength", &v74, v60, v61, v62);
  if (v11)
  {
    if (!v4) {
      goto LABEL_81;
    }
    LODWORD(v74) = 0;
    if (sub_262E76EFC(v10, (const char *)@"temporalFilteringStrengthParallel", &v74, v63, v64, v65)) {
      goto LABEL_76;
    }
  }
  else
  {
    self->_adaptiveCorrectionConfig.temporalFilteringStrength = *(float *)&v74;
    LODWORD(v74) = 0;
    int v11 = sub_262E76EFC(v10, (const char *)@"temporalFilteringStrengthParallel", &v74, v63, v64, v65);
    if (v11)
    {
      if (!v4) {
        goto LABEL_81;
      }
      goto LABEL_76;
    }
  }
  self->_adaptiveCorrectionConfig.temporalFilteringStrengthParallel = *(float *)&v74;
LABEL_76:
  LODWORD(v74) = 0;
  if (!sub_262E76EFC(v10, (const char *)@"temporalInitializationFactor", &v74, v66, v67, v68)) {
    self->_adaptiveCorrectionConfig.temporalInitializationFactor = *(float *)&v74;
  }
  LODWORD(v74) = 0;
  if (!sub_262E76EFC(v10, (const char *)@"scaleTuningWithDigitalZoomByFactor", &v74, v69, v70, v71)) {
    self->_adaptiveCorrectionConfig.scaleTuningWithDigitalZoomByFactor = *(float *)&v74;
  }
  int v11 = 0;
LABEL_81:
  if (v4) {
    int v72 = 0;
  }
  else {
    int v72 = v11;
  }

  return v72;
}

- (CalibrationTuningParameters)initWithTuningDictionary:(id)a3 cameraInfoByPortType:(id)a4
{
  id v5 = a3;
  v27.receiver = self;
  v27.super_class = (Class)CalibrationTuningParameters;
  uint64_t v10 = [(CalibrationTuningParameters *)&v27 init];
  if (!v10) {
    goto LABEL_6;
  }
  int v11 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"Calibration", v7, v8, v9);
  int isUpdating = objc_msgSend_readCalibrationConfig_isUpdating_(v10, v12, (uint64_t)v11, 0, v13, v14);

  if (isUpdating
    || (objc_msgSend_objectForKeyedSubscript_(v5, v16, @"ADC", v17, v18, v19),
        uint64_t v20 = objc_claimAutoreleasedReturnValue(),
        int v24 = objc_msgSend_readAdaptiveCorrectionConfig_isUpdating_(v10, v21, (uint64_t)v20, 0, v22, v23),
        v20,
        v24))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_6:
    uint64_t v25 = 0;
    goto LABEL_7;
  }
  uint64_t v25 = v10;
LABEL_7:

  return v25;
}

- (const)getAdaptiveCorrectionConfigPtr
{
  return &self->_adaptiveCorrectionConfig;
}

- (int)updateTuningParametersWith:(id)a3
{
  id v4 = a3;
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v4, v5, @"Calibration", v6, v7, v8);
  int isUpdating = objc_msgSend_readCalibrationConfig_isUpdating_(self, v10, (uint64_t)v9, 1, v11, v12);

  if (isUpdating
    || (objc_msgSend_objectForKeyedSubscript_(v4, v14, @"ADC", v15, v16, v17),
        uint64_t v18 = objc_claimAutoreleasedReturnValue(),
        int isUpdating = objc_msgSend_readAdaptiveCorrectionConfig_isUpdating_(self, v19, (uint64_t)v18, 1, v20, v21),
        v18,
        isUpdating))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }

  return isUpdating;
}

- (float)nearLimitDistanceMM
{
  return self->_nearLimitDistanceMM;
}

- (float)midLimitDistanceMM
{
  return self->_midLimitDistanceMM;
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