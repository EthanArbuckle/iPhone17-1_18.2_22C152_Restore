@interface DisparityTuningParameters
- (AdaptiveCorrectionConfig)adaptiveCorrectionConfig;
- (BOOL)alignAuxiliaryImageForKeypoints;
- (BOOL)useLKTKeypointDetection;
- (DisparityTuningParameters)init;
- (DisparityTuningParameters)initWithTuningDictionary:(id)a3 cameraInfoByPortType:(id)a4;
- (const)getAdaptiveCorrectionConfigPtr;
- (float)bidirectionalError;
- (float)confidenceMinimum;
- (float)confidenceRadialWeight;
- (float)defaultFocalLengthTeleMaxDeviationMicrometers;
- (float)defaultFocalLengthTeleMicrometers;
- (float)defaultFocalLengthWideMaxDeviationMicrometers;
- (float)defaultFocalLengthWideMicrometers;
- (float)keypointsDetectionThreshold;
- (float)maxDisparityClampingPercentile;
- (float)midLimitDistanceMM;
- (float)minDisparityClampingPercentile;
- (float)nearLimitDistanceMM;
- (int)blockSize;
- (int)lastScale;
- (int)nwarps;
- (int)readAdaptiveCorrectionConfig:(id)a3 isUpdating:(BOOL)a4;
- (int)readCalibrationConfig:(id)a3 isUpdating:(BOOL)a4;
- (int)readDisparityClampingConfig:(id)a3 isUpdating:(BOOL)a4;
- (int)readLKTConfig:(id)a3 isUpdating:(BOOL)a4;
- (int)stereoDisparityEstimatorLevels;
- (int)updateTuningParametersWith:(id)a3;
- (void)setDefaultAdaptiveCorrectionParameters;
- (void)setDefaultCalibrationParameters;
- (void)setDefaultDisparityClampingParameters;
- (void)setDefaultLKTParameters;
- (void)setDefaultRPDParameters;
@end

@implementation DisparityTuningParameters

- (void)setDefaultAdaptiveCorrectionParameters
{
  *(_OWORD *)&self->_adaptiveCorrectionConfig.overrideConfigPass1.isValid = 0u;
  p_overrideConfigPass1 = &self->_adaptiveCorrectionConfig.overrideConfigPass1;
  *(_OWORD *)&p_overrideConfigPass1[-2].rangeOCxW_dist = xmmword_262EEEB40;
  *(_OWORD *)&p_overrideConfigPass1[-2].spgEpsilon = xmmword_262EEEB50;
  *(_OWORD *)&p_overrideConfigPass1[-1].isValid = xmmword_262EEEB60;
  *(_OWORD *)&p_overrideConfigPass1[-1].rangePFL_T = xmmword_262EEEB60;
  *(_OWORD *)&p_overrideConfigPass1[-1].rangeOCxT = xmmword_262EEEB70;
  LODWORD(p_overrideConfigPass1[-1].rangeOCyT) = 50;
  *(_OWORD *)&p_overrideConfigPass1[-1].rangeOCyW = xmmword_262EEEB80;
  p_overrideConfigPass1[-1].rangePFL_W_dist = 0.1;
  LOBYTE(p_overrideConfigPass1[-1].rangeOCxT_dist) = 1;
  p_overrideConfigPass1[-1].rangeOCxW_dist = 0.001;
  *(_OWORD *)&p_overrideConfigPass1[-1].minPointsForAdjustment = xmmword_262EEEBA0;
  *(void *)&p_overrideConfigPass1[-1].spgMaxIterations = 0;
  *(_OWORD *)&p_overrideConfigPass1->rangePFL_T = 0u;
  *(_OWORD *)&p_overrideConfigPass1->rangeOCxT = 0u;
  *(_OWORD *)&p_overrideConfigPass1->rangeOCyT = 0u;
  *(_OWORD *)&p_overrideConfigPass1->rangePFL_T_dist = 0u;
  *(_OWORD *)&p_overrideConfigPass1->rangeOCxT_dist = 0u;
  *(_OWORD *)&p_overrideConfigPass1->minPointsForAdjustment = 0u;
  *(void *)&p_overrideConfigPass1->spgMaxIterations = 0;
  *(void *)&p_overrideConfigPass1[1].spgMaxIterations = 0;
  *(_OWORD *)&p_overrideConfigPass1[1].minPointsForAdjustment = 0u;
  *(_OWORD *)&p_overrideConfigPass1[1].rangeOCxT_dist = 0u;
  *(_OWORD *)&p_overrideConfigPass1[1].rangePFL_T_dist = 0u;
  *(_OWORD *)&p_overrideConfigPass1[1].rangeOCyT = 0u;
  *(_OWORD *)&p_overrideConfigPass1[1].rangeOCxT = 0u;
  *(_OWORD *)&p_overrideConfigPass1[1].rangePFL_T = 0u;
  *(_OWORD *)&p_overrideConfigPass1[1].isValid = 0u;
  *(_OWORD *)&p_overrideConfigPass1[2].isValid = 0u;
  *(_OWORD *)&p_overrideConfigPass1[2].rangePFL_T = 0u;
  *(_OWORD *)&p_overrideConfigPass1[2].rangeOCxT = 0u;
  *(_OWORD *)&p_overrideConfigPass1[2].rangeOCyT = 0u;
  *(_OWORD *)&p_overrideConfigPass1[2].rangePFL_T_dist = 0u;
  *(_OWORD *)&p_overrideConfigPass1[2].rangeOCxT_dist = 0u;
  *(_OWORD *)&p_overrideConfigPass1[2].minPointsForAdjustment = 0u;
  *(void *)&p_overrideConfigPass1[2].spgMaxIterations = 0;
}

- (void)setDefaultCalibrationParameters
{
  self->_defaultFocalLengthWideMaxDeviationMicrometers = 500.0;
  *(_OWORD *)&self->_keypointsDetectionThreshold = xmmword_262EEEB30;
  self->_alignAuxiliaryImageForKeypoints = 0;
}

- (void)setDefaultDisparityClampingParameters
{
  *(void *)&self->_minDisparityClampingPercentile = 0;
}

- (void)setDefaultRPDParameters
{
  *(void *)&self->_nearLimitDistanceMM = 0x447A000043960000;
}

- (void)setDefaultLKTParameters
{
  self->_useLKTKeypointDetection = 0;
  *(void *)&self->_bidirectionalError = 0x3E8000003DCCCCCDLL;
  self->_confidenceMinimum = 0.1125;
  *(void *)&self->_blockSize = 0x100000020;
  self->_nwarps = 4;
}

- (DisparityTuningParameters)init
{
  v45.receiver = self;
  v45.super_class = (Class)DisparityTuningParameters;
  v2 = [(DisparityTuningParameters *)&v45 init];
  v11 = v2;
  if (v2)
  {
    objc_msgSend_setDefaultCalibrationParameters(v2, v3, v4, v5, v6, v7, v8, v9, v10);
    objc_msgSend_setDefaultRPDParameters(v11, v12, v13, v14, v15, v16, v17, v18, v19);
    objc_msgSend_setDefaultAdaptiveCorrectionParameters(v11, v20, v21, v22, v23, v24, v25, v26, v27);
    objc_msgSend_setDefaultDisparityClampingParameters(v11, v28, v29, v30, v31, v32, v33, v34, v35);
    objc_msgSend_setDefaultLKTParameters(v11, v36, v37, v38, v39, v40, v41, v42, v43);
  }
  return v11;
}

- (int)readCalibrationConfig:(id)a3 isUpdating:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v13 = v6;
  if (!v6)
  {
    int v14 = -12780;
    goto LABEL_27;
  }
  float v50 = 0.0;
  int v14 = sub_262EE466C(v6, (const char *)@"defaultFocalLengthTeleMicrometers", &v50, v7, v8, v9, v10, v11, v12);
  if (v14)
  {
    if (!v4) {
      goto LABEL_27;
    }
    float v50 = 0.0;
    if (!sub_262EE466C(v13, (const char *)@"defaultFocalLengthWideMicrometers", &v50, v15, v16, v17, v18, v19, v20))goto LABEL_9; {
  }
    }
  else
  {
    float v27 = v50;
    self->_defaultFocalLengthTeleMicrometers = v50;
    float v50 = 0.0;
    int v14 = sub_262EE466C(v13, (const char *)@"defaultFocalLengthWideMicrometers", &v50, v15, v16, v17, v18, v19, v27);
    if (!v14)
    {
LABEL_9:
      float v26 = v50;
      self->_defaultFocalLengthWideMicrometers = v50;
      goto LABEL_10;
    }
    if (!v4) {
      goto LABEL_27;
    }
  }
LABEL_10:
  float v50 = 0.0;
  int v14 = sub_262EE466C(v13, (const char *)@"defaultFocalLengthTeleMaxDeviationMicrometers", &v50, v21, v22, v23, v24, v25, v26);
  if (v14)
  {
    if (!v4) {
      goto LABEL_27;
    }
    float v50 = 0.0;
    if (sub_262EE466C(v13, (const char *)@"defaultFocalLengthWideMaxDeviationMicrometers", &v50, v28, v29, v30, v31, v32, v33))goto LABEL_18; {
  }
    }
  else
  {
    float v40 = v50;
    self->_defaultFocalLengthTeleMaxDeviationMicrometers = v50;
    float v50 = 0.0;
    int v14 = sub_262EE466C(v13, (const char *)@"defaultFocalLengthWideMaxDeviationMicrometers", &v50, v28, v29, v30, v31, v32, v40);
    if (v14)
    {
      if (!v4) {
        goto LABEL_27;
      }
      goto LABEL_18;
    }
  }
  float v39 = v50;
  self->_defaultFocalLengthWideMaxDeviationMicrometers = v50;
LABEL_18:
  float v50 = 0.0;
  int v14 = sub_262EE466C(v13, (const char *)@"keypointsDetectionThreshold", &v50, v34, v35, v36, v37, v38, v39);
  if (v14)
  {
    if (!v4) {
      goto LABEL_27;
    }
    float v50 = 0.0;
    if (sub_262EE46C4(v13, (const char *)@"alignAuxiliaryImageForKeypoints", &v50, v41, v42, v43, v44, v45, v46))goto LABEL_26; {
    goto LABEL_25;
    }
  }
  float v47 = v50;
  self->_keypointsDetectionThreshold = v50;
  float v50 = 0.0;
  int v14 = sub_262EE46C4(v13, (const char *)@"alignAuxiliaryImageForKeypoints", &v50, v41, v42, v43, v44, v45, v47);
  if (!v14)
  {
LABEL_25:
    self->_alignAuxiliaryImageForKeypoints = LODWORD(v50) != 0;
    goto LABEL_26;
  }
  if (v4) {
LABEL_26:
  }
    int v14 = 0;
LABEL_27:
  if (v4) {
    int v48 = 0;
  }
  else {
    int v48 = v14;
  }

  return v48;
}

- (int)readAdaptiveCorrectionConfig:(id)a3 isUpdating:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v13 = v6;
  if (!v6)
  {
    v143 = 0;
    v144 = 0;
    LODWORD(v14) = -12780;
    goto LABEL_79;
  }
  *(void *)&long long v184 = 0;
  LODWORD(v14) = sub_262EE4DA4(v6, (const char *)@"epErrorLimitWidePix_FirstPass", &v184, v7, v8, v9, v10, v11, v12);
  if (v14)
  {
    if (!v4) {
      goto LABEL_78;
    }
    *(void *)&long long v184 = 0;
    if (!sub_262EE4DA4(v13, (const char *)@"epErrorLimitWidePix_SecondPass", &v184, v15, v16, v17, v18, v19, v20))goto LABEL_9; {
  }
    }
  else
  {
    float v27 = *(float *)&v184;
    *(void *)&self->_adaptiveCorrectionConfig.epErrorLimitWidePix_FirstPass = v184;
    *(void *)&long long v184 = 0;
    LODWORD(v14) = sub_262EE4DA4(v13, (const char *)@"epErrorLimitWidePix_SecondPass", &v184, v15, v16, v17, v18, v19, v27);
    if (!v14)
    {
LABEL_9:
      float v26 = *(float *)&v184;
      *(void *)&self->_adaptiveCorrectionConfig.epErrorLimitWidePix_SecondPass = v184;
      goto LABEL_10;
    }
    if (!v4) {
      goto LABEL_78;
    }
  }
LABEL_10:
  *(void *)&long long v184 = 0;
  LODWORD(v14) = sub_262EE4DA4(v13, (const char *)@"rangePFL_T", &v184, v21, v22, v23, v24, v25, v26);
  if (v14)
  {
    if (!v4) {
      goto LABEL_78;
    }
    *(void *)&long long v184 = 0;
    if (!sub_262EE4DA4(v13, (const char *)@"rangePFL_W", &v184, v28, v29, v30, v31, v32, v33)) {
      goto LABEL_17;
    }
  }
  else
  {
    float v40 = *(float *)&v184;
    *(void *)&self->_adaptiveCorrectionConfig.rangePFL_T = v184;
    *(void *)&long long v184 = 0;
    LODWORD(v14) = sub_262EE4DA4(v13, (const char *)@"rangePFL_W", &v184, v28, v29, v30, v31, v32, v40);
    if (!v14)
    {
LABEL_17:
      float v39 = *(float *)&v184;
      *(void *)&self->_adaptiveCorrectionConfig.rangePFL_W = v184;
      goto LABEL_18;
    }
    if (!v4) {
      goto LABEL_78;
    }
  }
LABEL_18:
  *(void *)&long long v184 = 0;
  LODWORD(v14) = sub_262EE4DA4(v13, (const char *)@"rangeOCxT", &v184, v34, v35, v36, v37, v38, v39);
  if (v14)
  {
    if (!v4) {
      goto LABEL_78;
    }
    *(void *)&long long v184 = 0;
    if (!sub_262EE4DA4(v13, (const char *)@"rangeOCxW", &v184, v41, v42, v43, v44, v45, v46)) {
      goto LABEL_25;
    }
  }
  else
  {
    float v53 = *(float *)&v184;
    *(void *)&self->_adaptiveCorrectionConfig.rangeOCxT = v184;
    *(void *)&long long v184 = 0;
    LODWORD(v14) = sub_262EE4DA4(v13, (const char *)@"rangeOCxW", &v184, v41, v42, v43, v44, v45, v53);
    if (!v14)
    {
LABEL_25:
      float v52 = *(float *)&v184;
      *(void *)&self->_adaptiveCorrectionConfig.rangeOCxW = v184;
      goto LABEL_26;
    }
    if (!v4) {
      goto LABEL_78;
    }
  }
LABEL_26:
  *(void *)&long long v184 = 0;
  LODWORD(v14) = sub_262EE4DA4(v13, (const char *)@"rangeOCyT", &v184, v47, v48, v49, v50, v51, v52);
  if (v14)
  {
    if (!v4) {
      goto LABEL_78;
    }
    *(void *)&long long v184 = 0;
    if (!sub_262EE4DA4(v13, (const char *)@"rangeOCyW", &v184, v54, v55, v56, v57, v58, v59)) {
      goto LABEL_33;
    }
  }
  else
  {
    float v66 = *(float *)&v184;
    *(void *)&self->_adaptiveCorrectionConfig.rangeOCyT = v184;
    *(void *)&long long v184 = 0;
    LODWORD(v14) = sub_262EE4DA4(v13, (const char *)@"rangeOCyW", &v184, v54, v55, v56, v57, v58, v66);
    if (!v14)
    {
LABEL_33:
      float v65 = *(float *)&v184;
      *(void *)&self->_adaptiveCorrectionConfig.rangeOCyW = v184;
      goto LABEL_34;
    }
    if (!v4) {
      goto LABEL_78;
    }
  }
LABEL_34:
  *(void *)&long long v184 = 0;
  LODWORD(v14) = sub_262EE4DA4(v13, (const char *)@"intermediateMacroDistMM", &v184, v60, v61, v62, v63, v64, v65);
  if (v14)
  {
    if (!v4) {
      goto LABEL_78;
    }
    *(void *)&long long v184 = 0;
    if (!sub_262EE4DA4(v13, (const char *)@"extremeMacroDistMM", &v184, v67, v68, v69, v70, v71, v72))goto LABEL_41; {
  }
    }
  else
  {
    float v79 = *(float *)&v184;
    *(void *)&self->_adaptiveCorrectionConfig.intermediateMacroDistMM = v184;
    *(void *)&long long v184 = 0;
    LODWORD(v14) = sub_262EE4DA4(v13, (const char *)@"extremeMacroDistMM", &v184, v67, v68, v69, v70, v71, v79);
    if (!v14)
    {
LABEL_41:
      float v78 = *(float *)&v184;
      *(void *)&self->_adaptiveCorrectionConfig.extremeMacroDistMM = v184;
      goto LABEL_42;
    }
    if (!v4) {
      goto LABEL_78;
    }
  }
LABEL_42:
  LODWORD(v184) = 0;
  LODWORD(v14) = sub_262EE46C4(v13, (const char *)@"minPointsForAdjustment", &v184, v73, v74, v75, v76, v77, v78);
  if (v14)
  {
    if (!v4) {
      goto LABEL_78;
    }
    *(void *)&long long v184 = 0;
    if (!sub_262EE4DA4(v13, (const char *)@"errorVal_GreaterThanInf", &v184, v80, v81, v82, v83, v84, v85))goto LABEL_49; {
  }
    }
  else
  {
    self->_adaptiveCorrectionConfig.minPointsForAdjustment = v184;
    *(void *)&long long v184 = 0;
    LODWORD(v14) = sub_262EE4DA4(v13, (const char *)@"errorVal_GreaterThanInf", &v184, v80, v81, v82, v83, v84, v85);
    if (!v14)
    {
LABEL_49:
      float v91 = *(float *)&v184;
      *(void *)&self->_adaptiveCorrectionConfig.errorVal_GreaterThanInf = v184;
      goto LABEL_50;
    }
    if (!v4) {
      goto LABEL_78;
    }
  }
LABEL_50:
  *(void *)&long long v184 = 0;
  LODWORD(v14) = sub_262EE4DA4(v13, (const char *)@"errorVal_LessThanExtremeMacro", &v184, v86, v87, v88, v89, v90, v91);
  if (v14)
  {
    if (!v4) {
      goto LABEL_78;
    }
    *(void *)&long long v184 = 0;
    if (!sub_262EE4DA4(v13, (const char *)@"errorVal_BetweenIntermediate_ExtremeMacro", &v184, v92, v93, v94, v95, v96, v97))goto LABEL_57; {
  }
    }
  else
  {
    float v104 = *(float *)&v184;
    *(void *)&self->_adaptiveCorrectionConfig.errorVal_LessThanExtremeMacro = v184;
    *(void *)&long long v184 = 0;
    LODWORD(v14) = sub_262EE4DA4(v13, (const char *)@"errorVal_BetweenIntermediate_ExtremeMacro", &v184, v92, v93, v94, v95, v96, v104);
    if (!v14)
    {
LABEL_57:
      float v103 = *(float *)&v184;
      *(void *)&self->_adaptiveCorrectionConfig.errorVal_BetweenIntermediate_ExtremeMacro = v184;
      goto LABEL_58;
    }
    if (!v4) {
      goto LABEL_78;
    }
  }
LABEL_58:
  *(void *)&long long v184 = 0;
  LODWORD(v14) = sub_262EE4DA4(v13, (const char *)@"spgEpsilon", &v184, v98, v99, v100, v101, v102, v103);
  if (v14)
  {
    if (!v4) {
      goto LABEL_78;
    }
    LODWORD(v184) = 0;
    if (!sub_262EE46C4(v13, (const char *)@"runAnalyticalPreconditioning", &v184, v105, v106, v107, v108, v109, v110))goto LABEL_65; {
  }
    }
  else
  {
    float v117 = *(float *)&v184;
    *(void *)&self->_adaptiveCorrectionConfig.spgEpsilon = v184;
    LODWORD(v184) = 0;
    LODWORD(v14) = sub_262EE46C4(v13, (const char *)@"runAnalyticalPreconditioning", &v184, v105, v106, v107, v108, v109, v117);
    if (!v14)
    {
LABEL_65:
      self->_adaptiveCorrectionConfig.runAnalyticalPreconditioning = v184 != 0;
      goto LABEL_66;
    }
    if (!v4) {
      goto LABEL_78;
    }
  }
LABEL_66:
  LODWORD(v184) = 0;
  LODWORD(v14) = sub_262EE466C(v13, (const char *)@"keypointOutliersPercentile", &v184, v111, v112, v113, v114, v115, v116);
  if (v14)
  {
    if (!v4) {
      goto LABEL_78;
    }
  }
  else
  {
    float v123 = *(float *)&v184;
    LODWORD(self->_adaptiveCorrectionConfig.keypointOutliersPercentile) = v184;
  }
  LODWORD(v184) = 0;
  if (!sub_262EE466C(v13, (const char *)@"epErrorLimitTelePix_ParallelCorrection", &v184, v118, v119, v120, v121, v122, v123))
  {
    float v129 = *(float *)&v184;
    LODWORD(self->_adaptiveCorrectionConfig.epErrorLimitTelePix_ParallelCorrection) = v184;
  }
  LODWORD(v184) = 0;
  LODWORD(v14) = sub_262EE466C(v13, (const char *)@"temporalFilteringStrength", &v184, v124, v125, v126, v127, v128, v129);
  if (v14)
  {
    if (v4)
    {
      LODWORD(v184) = 0;
      if (!sub_262EE466C(v13, (const char *)@"temporalFilteringStrengthParallel", &v184, v130, v131, v132, v133, v134, v135))goto LABEL_83; {
      goto LABEL_84;
      }
    }
LABEL_78:
    v143 = 0;
    v144 = 0;
    goto LABEL_79;
  }
  float v142 = *(float *)&v184;
  LODWORD(self->_adaptiveCorrectionConfig.temporalFilteringStrength) = v184;
  LODWORD(v184) = 0;
  LODWORD(v14) = sub_262EE466C(v13, (const char *)@"temporalFilteringStrengthParallel", &v184, v130, v131, v132, v133, v134, v142);
  if (!v14)
  {
LABEL_83:
    float v141 = *(float *)&v184;
    LODWORD(self->_adaptiveCorrectionConfig.temporalFilteringStrengthParallel) = v184;
    goto LABEL_84;
  }
  if (!v4) {
    goto LABEL_78;
  }
LABEL_84:
  LODWORD(v184) = 0;
  if (!sub_262EE466C(v13, (const char *)@"temporalInitializationFactor", &v184, v136, v137, v138, v139, v140, v141))
  {
    float v152 = *(float *)&v184;
    LODWORD(self->_adaptiveCorrectionConfig.temporalInitializationFactor) = v184;
  }
  LODWORD(v184) = 0;
  if (!sub_262EE466C(v13, (const char *)@"scaleTuningWithDigitalZoomByFactor", &v184, v147, v148, v149, v150, v151, v152))
  {
    float v159 = *(float *)&v184;
    LODWORD(self->_adaptiveCorrectionConfig.scaleTuningWithDigitalZoomByFactor) = v184;
  }
  self->_adaptiveCorrectionConfig.spgEpsilon = 0.0;
  v143 = objc_msgSend_objectForKeyedSubscript_(v13, v153, @"overrideConfigPass1", v154, v155, v156, v157, v158, v159);
  if (v143)
  {
    sub_262EE4DFC((uint64_t)&self->_adaptiveCorrectionConfig, v143, 50, (uint64_t)&v184, self->_adaptiveCorrectionConfig.epErrorLimitWidePix_FirstPass);
    long long v167 = v189;
    *(_OWORD *)&self->_adaptiveCorrectionConfig.overrideConfigPass1.rangePFL_T_dist = v188;
    *(_OWORD *)&self->_adaptiveCorrectionConfig.overrideConfigPass1.rangeOCxT_dist = v167;
    *(_OWORD *)&self->_adaptiveCorrectionConfig.overrideConfigPass1.minPointsForAdjustment = v190;
    *(void *)&self->_adaptiveCorrectionConfig.overrideConfigPass1.spgMaxIterations = v191;
    long long v168 = v185;
    *(_OWORD *)&self->_adaptiveCorrectionConfig.overrideConfigPass1.isValid = v184;
    *(_OWORD *)&self->_adaptiveCorrectionConfig.overrideConfigPass1.rangePFL_T = v168;
    float v166 = *(float *)&v186;
    long long v169 = v187;
    *(_OWORD *)&self->_adaptiveCorrectionConfig.overrideConfigPass1.rangeOCxT = v186;
    *(_OWORD *)&self->_adaptiveCorrectionConfig.overrideConfigPass1.rangeOCyT = v169;
  }
  v144 = objc_msgSend_objectForKeyedSubscript_(v13, v160, @"overrideConfigPass2", v161, v162, v163, v164, v165, v166);
  if (v144)
  {
    sub_262EE4DFC((uint64_t)&self->_adaptiveCorrectionConfig, v144, 50, (uint64_t)&v184, self->_adaptiveCorrectionConfig.epErrorLimitWidePix_SecondPass);
    long long v177 = v189;
    *(_OWORD *)&self->_adaptiveCorrectionConfig.overrideConfigPass2.rangePFL_T_dist = v188;
    *(_OWORD *)&self->_adaptiveCorrectionConfig.overrideConfigPass2.rangeOCxT_dist = v177;
    *(_OWORD *)&self->_adaptiveCorrectionConfig.overrideConfigPass2.minPointsForAdjustment = v190;
    *(void *)&self->_adaptiveCorrectionConfig.overrideConfigPass2.spgMaxIterations = v191;
    long long v178 = v185;
    *(_OWORD *)&self->_adaptiveCorrectionConfig.overrideConfigPass2.isValid = v184;
    *(_OWORD *)&self->_adaptiveCorrectionConfig.overrideConfigPass2.rangePFL_T = v178;
    float v176 = *(float *)&v186;
    long long v179 = v187;
    *(_OWORD *)&self->_adaptiveCorrectionConfig.overrideConfigPass2.rangeOCxT = v186;
    *(_OWORD *)&self->_adaptiveCorrectionConfig.overrideConfigPass2.rangeOCyT = v179;
  }
  int v14 = objc_msgSend_objectForKeyedSubscript_(v13, v170, @"overrideConfigPassDist", v171, v172, v173, v174, v175, v176);
  if (v14)
  {
    v180 = v14;
    sub_262EE4DFC((uint64_t)&self->_adaptiveCorrectionConfig, v14, 100, (uint64_t)&v184, self->_adaptiveCorrectionConfig.epErrorLimitWidePix_SecondPass);
    long long v181 = v189;
    *(_OWORD *)&self->_adaptiveCorrectionConfig.overrideConfigPassDist.rangePFL_T_dist = v188;
    *(_OWORD *)&self->_adaptiveCorrectionConfig.overrideConfigPassDist.rangeOCxT_dist = v181;
    *(_OWORD *)&self->_adaptiveCorrectionConfig.overrideConfigPassDist.minPointsForAdjustment = v190;
    *(void *)&self->_adaptiveCorrectionConfig.overrideConfigPassDist.spgMaxIterations = v191;
    long long v182 = v185;
    *(_OWORD *)&self->_adaptiveCorrectionConfig.overrideConfigPassDist.isValid = v184;
    *(_OWORD *)&self->_adaptiveCorrectionConfig.overrideConfigPassDist.rangePFL_T = v182;
    long long v183 = v187;
    *(_OWORD *)&self->_adaptiveCorrectionConfig.overrideConfigPassDist.rangeOCxT = v186;
    *(_OWORD *)&self->_adaptiveCorrectionConfig.overrideConfigPassDist.rangeOCyT = v183;

    LODWORD(v14) = 0;
  }
LABEL_79:
  if (v4) {
    int v145 = 0;
  }
  else {
    int v145 = (int)v14;
  }

  return v145;
}

- (int)readDisparityClampingConfig:(id)a3 isUpdating:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v13 = v6;
  if (!v6)
  {
LABEL_22:
    int v14 = -12780;
    goto LABEL_17;
  }
  float v28 = 0.0;
  int v14 = sub_262EE466C(v6, (const char *)@"minDisparityPercentile", &v28, v7, v8, v9, v10, v11, v12);
  if (v14)
  {
    if (!v4) {
      goto LABEL_17;
    }
    float v27 = 0.0;
    if (sub_262EE466C(v13, (const char *)@"maxDisparityPercentile", &v27, v15, v16, v17, v18, v19, v20))goto LABEL_10; {
    goto LABEL_9;
    }
  }
  float v21 = v28;
  self->_float minDisparityClampingPercentile = v28;
  float v27 = 0.0;
  int v14 = sub_262EE466C(v13, (const char *)@"maxDisparityPercentile", &v27, v15, v16, v17, v18, v19, v21);
  if (!v14)
  {
LABEL_9:
    self->_float maxDisparityClampingPercentile = v27;
    goto LABEL_10;
  }
  if (v4)
  {
LABEL_10:
    float minDisparityClampingPercentile = self->_minDisparityClampingPercentile;
    if (minDisparityClampingPercentile >= 0.0 && minDisparityClampingPercentile <= 1.0)
    {
      float maxDisparityClampingPercentile = self->_maxDisparityClampingPercentile;
      if (maxDisparityClampingPercentile >= 0.0 && maxDisparityClampingPercentile <= 1.0)
      {
        int v14 = 0;
        goto LABEL_17;
      }
    }
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_22;
  }
LABEL_17:
  if (v4) {
    int v25 = 0;
  }
  else {
    int v25 = v14;
  }

  return v25;
}

- (int)readLKTConfig:(id)a3 isUpdating:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v13 = v6;
  if (!v6)
  {
LABEL_44:
    int v14 = -12780;
    goto LABEL_39;
  }
  float v56 = 0.0;
  int v14 = sub_262EE46C4(v6, (const char *)@"useLKTKeypoints", &v56, v7, v8, v9, v10, v11, v12);
  if (v14)
  {
    if (!v4) {
      goto LABEL_39;
    }
    float v56 = 0.0;
    if (!sub_262EE466C(v13, (const char *)@"bidirectionalError", &v56, v15, v16, v17, v18, v19, v20))goto LABEL_9; {
  }
    }
  else
  {
    self->_useLKTKeypointDetection = LODWORD(v56) != 0;
    float v56 = 0.0;
    int v14 = sub_262EE466C(v13, (const char *)@"bidirectionalError", &v56, v15, v16, v17, v18, v19, v20);
    if (!v14)
    {
LABEL_9:
      float v26 = v56;
      self->_bidirectionalError = v56;
      goto LABEL_10;
    }
    if (!v4) {
      goto LABEL_39;
    }
  }
LABEL_10:
  float v56 = 0.0;
  int v14 = sub_262EE466C(v13, (const char *)@"confidenceRadialWeight", &v56, v21, v22, v23, v24, v25, v26);
  if (v14)
  {
    if (!v4) {
      goto LABEL_39;
    }
    float v56 = 0.0;
    if (!sub_262EE466C(v13, (const char *)@"confidenceMinimum", &v56, v27, v28, v29, v30, v31, v32)) {
      goto LABEL_17;
    }
  }
  else
  {
    float v39 = v56;
    self->_float confidenceRadialWeight = v56;
    float v56 = 0.0;
    int v14 = sub_262EE466C(v13, (const char *)@"confidenceMinimum", &v56, v27, v28, v29, v30, v31, v39);
    if (!v14)
    {
LABEL_17:
      float v38 = v56;
      self->_confidenceMinimum = v56;
      goto LABEL_18;
    }
    if (!v4) {
      goto LABEL_39;
    }
  }
LABEL_18:
  float v56 = 0.0;
  int v14 = sub_262EE46C4(v13, (const char *)@"blockSize", &v56, v33, v34, v35, v36, v37, v38);
  if (v14)
  {
    if (!v4) {
      goto LABEL_39;
    }
    float v56 = 0.0;
    if (!sub_262EE46C4(v13, (const char *)@"lastScale", &v56, v40, v41, v42, v43, v44, v45)) {
      goto LABEL_25;
    }
  }
  else
  {
    *(float *)&self->_blockSize = v56;
    float v56 = 0.0;
    int v14 = sub_262EE46C4(v13, (const char *)@"lastScale", &v56, v40, v41, v42, v43, v44, v45);
    if (!v14)
    {
LABEL_25:
      *(float *)&self->_lastScale = v56;
      goto LABEL_26;
    }
    if (!v4) {
      goto LABEL_39;
    }
  }
LABEL_26:
  float v56 = 0.0;
  int v14 = sub_262EE46C4(v13, (const char *)@"nwarps", &v56, v46, v47, v48, v49, v50, v51);
  if (!v14)
  {
    *(float *)&self->_int nwarps = v56;
LABEL_30:
    if (self->_bidirectionalError >= 0.0)
    {
      float confidenceRadialWeight = self->_confidenceRadialWeight;
      if (confidenceRadialWeight >= 0.0
        && confidenceRadialWeight <= 1.0
        && self->_confidenceMinimum >= 0.0
        && (self->_blockSize & 0x80000000) == 0
        && (self->_lastScale & 0x80000000) == 0)
      {
        int nwarps = self->_nwarps;
        if (nwarps > 1 && (nwarps & 1) == 0)
        {
          int v14 = 0;
          goto LABEL_39;
        }
      }
    }
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_44;
  }
  if (v4) {
    goto LABEL_30;
  }
LABEL_39:
  if (v4) {
    int v54 = 0;
  }
  else {
    int v54 = v14;
  }

  return v54;
}

- (DisparityTuningParameters)initWithTuningDictionary:(id)a3 cameraInfoByPortType:(id)a4
{
  id v5 = a3;
  v84.receiver = self;
  v84.super_class = (Class)DisparityTuningParameters;
  float v12 = [(DisparityTuningParameters *)&v84 init];
  if (!v12) {
    goto LABEL_9;
  }
  int v14 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"Calibration", v7, v8, v9, v10, v11, v13);
  int isUpdating = objc_msgSend_readCalibrationConfig_isUpdating_(v12, v15, (uint64_t)v14, 0, v16, v17, v18, v19, v20);

  if (isUpdating) {
    goto LABEL_8;
  }
  uint64_t v29 = objc_msgSend_objectForKeyedSubscript_(v5, v22, @"ADC", v23, v24, v25, v26, v27, v28);
  int v36 = objc_msgSend_readAdaptiveCorrectionConfig_isUpdating_(v12, v30, (uint64_t)v29, 0, v31, v32, v33, v34, v35);

  if (v36
    || (objc_msgSend_objectForKeyedSubscript_(v5, v37, @"DisparityClamping", v38, v39, v40, v41, v42, v43), uint64_t v44 = objc_claimAutoreleasedReturnValue(), v51 = objc_msgSend_readDisparityClampingConfig_isUpdating_(v12, v45, (uint64_t)v44, 0, v46, v47, v48, v49, v50), v44, v51))
  {
LABEL_8:
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_9:
    uint64_t v82 = 0;
    goto LABEL_10;
  }
  float v59 = objc_msgSend_objectForKeyedSubscript_(v5, v52, @"LKTParameters", v53, v54, v55, v56, v57, v58);

  objc_msgSend_setDefaultLKTParameters(v12, v60, v61, v62, v63, v64, v65, v66, v67);
  if (v59)
  {
    uint64_t v75 = objc_msgSend_objectForKeyedSubscript_(v5, v68, @"LKTParameters", v69, v70, v71, v72, v73, v74);
    objc_msgSend_readLKTConfig_isUpdating_(v12, v76, (uint64_t)v75, 0, v77, v78, v79, v80, v81);
  }
  uint64_t v82 = v12;
LABEL_10:

  return v82;
}

- (const)getAdaptiveCorrectionConfigPtr
{
  return &self->_adaptiveCorrectionConfig;
}

- (int)updateTuningParametersWith:(id)a3
{
  id v4 = a3;
  float v12 = objc_msgSend_objectForKeyedSubscript_(v4, v5, @"Calibration", v6, v7, v8, v9, v10, v11);
  LODWORD(v19) = objc_msgSend_readCalibrationConfig_isUpdating_(self, v13, (uint64_t)v12, 1, v14, v15, v16, v17, v18);

  if (v19) {
    goto LABEL_7;
  }
  uint64_t v27 = objc_msgSend_objectForKeyedSubscript_(v4, v20, @"ADC", v21, v22, v23, v24, v25, v26);
  LODWORD(v19) = objc_msgSend_readAdaptiveCorrectionConfig_isUpdating_(self, v28, (uint64_t)v27, 1, v29, v30, v31, v32, v33);

  if (v19
    || (objc_msgSend_objectForKeyedSubscript_(v4, v34, @"DisparityClamping", v35, v36, v37, v38, v39, v40), uint64_t v41 = objc_claimAutoreleasedReturnValue(), LODWORD(v19) = objc_msgSend_readDisparityClampingConfig_isUpdating_(self, v42, (uint64_t)v41, 1, v43, v44, v45, v46,
                         v47),
        v41,
        v19))
  {
LABEL_7:
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  else
  {
    uint64_t v19 = objc_msgSend_objectForKeyedSubscript_(v4, v48, @"LKTParameters", v49, v50, v51, v52, v53, v54);

    if (v19)
    {
      uint64_t v19 = objc_msgSend_objectForKeyedSubscript_(v4, v55, @"LKTParameters", v56, v57, v58, v59, v60, v61);
      objc_msgSend_readLKTConfig_isUpdating_(self, v62, (uint64_t)v19, 1, v63, v64, v65, v66, v67);

      LODWORD(v19) = 0;
    }
  }

  return (int)v19;
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

- (BOOL)alignAuxiliaryImageForKeypoints
{
  return self->_alignAuxiliaryImageForKeypoints;
}

- (AdaptiveCorrectionConfig)adaptiveCorrectionConfig
{
  return (AdaptiveCorrectionConfig *)memcpy(retstr, &self->_adaptiveCorrectionConfig, sizeof(AdaptiveCorrectionConfig));
}

- (float)minDisparityClampingPercentile
{
  return self->_minDisparityClampingPercentile;
}

- (float)maxDisparityClampingPercentile
{
  return self->_maxDisparityClampingPercentile;
}

- (int)stereoDisparityEstimatorLevels
{
  return self->_stereoDisparityEstimatorLevels;
}

- (BOOL)useLKTKeypointDetection
{
  return self->_useLKTKeypointDetection;
}

- (float)bidirectionalError
{
  return self->_bidirectionalError;
}

- (float)confidenceRadialWeight
{
  return self->_confidenceRadialWeight;
}

- (float)confidenceMinimum
{
  return self->_confidenceMinimum;
}

- (int)blockSize
{
  return self->_blockSize;
}

- (int)lastScale
{
  return self->_lastScale;
}

- (int)nwarps
{
  return self->_nwarps;
}

@end