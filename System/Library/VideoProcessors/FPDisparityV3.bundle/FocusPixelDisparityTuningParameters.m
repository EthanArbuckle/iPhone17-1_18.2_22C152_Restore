@interface FocusPixelDisparityTuningParameters
- (FPDisparityEstimator_Parameters)FPDisparityEstimator_Config;
- (FocusPixelDisparityTuningParameters)init;
- (FocusPixelDisparityTuningParameters)initWithTuningDictionary:(id)a3 cameraInfoByPortType:(id)a4;
- (int)readFPDisparity_v3_Config:(id)a3;
- (int)setDefaultFPDisparity_v3_Parameters;
@end

@implementation FocusPixelDisparityTuningParameters

- (int)setDefaultFPDisparity_v3_Parameters
{
  v3 = objc_opt_new();
  v4 = objc_opt_new();
  v5 = objc_opt_new();
  v6 = objc_opt_new();
  v7 = objc_opt_new();
  v8 = objc_opt_new();
  uint64_t v9 = objc_opt_new();
  v11 = (void *)v9;
  if (!v3) {
    goto LABEL_17;
  }
  if (!v5) {
    goto LABEL_17;
  }
  if (!v6) {
    goto LABEL_17;
  }
  if (!v4) {
    goto LABEL_17;
  }
  if (!v7) {
    goto LABEL_17;
  }
  if (!v8) {
    goto LABEL_17;
  }
  if (!v9) {
    goto LABEL_17;
  }
  objc_msgSend_setNView_(v4, v10, 4);
  objc_msgSend_setMicrolensSpatialOffset_(v4, v12, v13, 0.0);
  objc_msgSend_setForegroundPush_(v4, v14, v15, 0.0);
  objc_msgSend_setBackgroundPush_(v4, v16, v17, 0.0);
  objc_msgSend_setRigidWindowSupport_(v4, v18, 3);
  LODWORD(v19) = 0.5;
  objc_msgSend_setCostMapAntialiasingStrength_(v4, v20, v21, v19);
  LODWORD(v22) = 953267991;
  objc_msgSend_setCostEpsilon_(v4, v23, v24, v22);
  LODWORD(v25) = 1061673905;
  objc_msgSend_setLensFieldCurvatureA0_(v4, v26, v27, v25);
  LODWORD(v28) = 1054277133;
  objc_msgSend_setLensFieldCurvatureA1_(v4, v29, v30, v28);
  LODWORD(v31) = -1069655439;
  objc_msgSend_setLensFieldCurvatureA2_(v4, v32, v33, v31);
  LODWORD(v34) = 1089940729;
  objc_msgSend_setLensFieldCurvatureA3_(v4, v35, v36, v34);
  LODWORD(v37) = -1066686669;
  objc_msgSend_setLensFieldCurvatureA4_(v4, v38, v39, v37);
  LODWORD(v40) = 1034147594;
  objc_msgSend_setCircleOfConfusionGain_(v4, v41, v42, v40);
  LODWORD(v43) = -1085809743;
  objc_msgSend_setCircleOfConfusionOffset_(v4, v44, v45, v43);
  LODWORD(v46) = 1008981770;
  objc_msgSend_setRadialMin_(v4, v47, v48, v46);
  LODWORD(v49) = 1.0;
  objc_msgSend_setRadialGain_(v4, v50, v51, v49);
  LODWORD(v52) = 1.0;
  objc_msgSend_setRadialExponent_(v4, v53, v54, v52);
  objc_msgSend_setFPcostParameters_(self->_FPDisparityEstimator_Config, v55, (uint64_t)v4);
  LODWORD(v56) = 3.0;
  objc_msgSend_setLambda_(v7, v57, v58, v56);
  LODWORD(v59) = 3.0;
  objc_msgSend_setLambda_foreground_(v7, v60, v61, v59);
  LODWORD(v62) = 3.0;
  objc_msgSend_setLambda_background_(v7, v63, v64, v62);
  LODWORD(v65) = 1.0;
  objc_msgSend_setStep_(v7, v66, v67, v65);
  LODWORD(v68) = 16.0;
  objc_msgSend_setAlpha_(v3, v69, v70, v68);
  LODWORD(v71) = 1.0;
  objc_msgSend_setBeta_(v3, v72, v73, v71);
  LODWORD(v74) = 1.0;
  objc_msgSend_setGain_(v3, v75, v76, v74);
  LODWORD(v77) = 981668463;
  objc_msgSend_setOffset_(v3, v78, v79, v77);
  LODWORD(v80) = 1061997773;
  objc_msgSend_setSegmentation_bias_foreground_(v3, v81, v82, v80);
  LODWORD(v83) = 1051931443;
  objc_msgSend_setSegmentation_bias_background_(v3, v84, v85, v83);
  objc_msgSend_setA_checkerboard_(v5, v86, v87, 0.0);
  LODWORD(v88) = 1.0;
  objc_msgSend_setB_checkerboard_(v5, v89, v90, v88);
  LODWORD(v91) = 0.25;
  objc_msgSend_setTau_(v5, v92, v93, v91);
  LODWORD(v94) = 0.5;
  objc_msgSend_setSigma_(v5, v95, v96, v94);
  LODWORD(v97) = 1.0;
  objc_msgSend_setTheta_(v5, v98, v99, v97);
  LODWORD(v100) = 1008981770;
  objc_msgSend_setHuber_eps_(v5, v101, v102, v100);
  objc_msgSend_setWarpings_(v5, v103, 1);
  objc_msgSend_setIterations_(v5, v104, 200);
  LODWORD(v105) = 1015021696;
  objc_msgSend_setBlackLevelOffset_(v8, v106, v107, v105);
  LODWORD(v108) = 1063387136;
  objc_msgSend_setBlackLevelScaling_(v8, v109, v110, v108);
  LODWORD(v111) = -1076007822;
  objc_msgSend_setShiftToDisparityRatio_(v11, v112, v113, v111);
  LODWORD(v114) = 1006834287;
  objc_msgSend_setCalibrationMaxResidual1_(v11, v115, v116, v114);
  LODWORD(v117) = 1018444120;
  objc_msgSend_setCalibrationMaxResidual2_(v11, v118, v119, v117);
  objc_msgSend_setScales_(v6, v120, 1);
  objc_msgSend_setRadius_(v6, v121, 6);
  objc_msgSend_setPadding_(v6, v122, 2);
  LODWORD(v123) = 6.0;
  objc_msgSend_setSigma_0_(v6, v124, v125, v123);
  LODWORD(v126) = 3.0;
  objc_msgSend_setSigma_1_(v6, v127, v128, v126);
  LODWORD(v129) = 3.0;
  objc_msgSend_setSigma_2_(v6, v130, v131, v129);
  v132 = (FPDisparityEstimator_Parameters *)objc_opt_new();
  FPDisparityEstimator_Config = self->_FPDisparityEstimator_Config;
  self->_FPDisparityEstimator_Config = v132;

  v135 = self->_FPDisparityEstimator_Config;
  if (!v135) {
    goto LABEL_17;
  }
  objc_msgSend_setFPpreprocessingParameters_(v135, v134, (uint64_t)v8);
  id v136 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (v136)
  {
    v137 = v136;
    v149 = v8;
    uint64_t v138 = 0;
    while (1)
    {
      v139 = objc_opt_new();
      if (!v139) {
        break;
      }
      v141 = v139;
      objc_msgSend_setSolverParameters_(v139, v140, (uint64_t)v5);
      objc_msgSend_setRegularizationParameters_(v141, v142, (uint64_t)v3);
      objc_msgSend_setHbfParameters_(v141, v143, (uint64_t)v6);
      objc_msgSend_setCostParameters_(v141, v144, (uint64_t)v7);
      objc_msgSend_setObject_atIndexedSubscript_(v137, v145, (uint64_t)v141, v138);

      if (++v138 == 8)
      {
        objc_msgSend_setLevelsParameters_(self->_FPDisparityEstimator_Config, v146, (uint64_t)v137);

        int v147 = 0;
        goto LABEL_14;
      }
    }
    fig_log_get_emitter();
    FigDebugAssert3();
    int v147 = FigSignalErrorAt();

LABEL_14:
    v8 = v149;
  }
  else
  {
LABEL_17:
    fig_log_get_emitter();
    FigDebugAssert3();
    int v147 = FigSignalErrorAt();
  }

  return v147;
}

- (FocusPixelDisparityTuningParameters)init
{
  v8.receiver = self;
  v8.super_class = (Class)FocusPixelDisparityTuningParameters;
  v2 = [(FocusPixelDisparityTuningParameters *)&v8 init];
  v5 = v2;
  if (v2 && objc_msgSend_setDefaultFPDisparity_v3_Parameters(v2, v3, v4)) {
    v6 = 0;
  }
  else {
    v6 = v5;
  }

  return v6;
}

- (int)readFPDisparity_v3_Config:(id)a3
{
  id v4 = a3;
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (!v6 || !v4)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v184 = FigSignalErrorAt();
    goto LABEL_27;
  }
  v200 = objc_msgSend_objectForKeyedSubscript_(v4, v5, @"reg");
  if (!v200)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_39:
    int v184 = -12780;
    goto LABEL_27;
  }
  uint64_t v8 = objc_msgSend_objectForKeyedSubscript_(v4, v7, @"cost");
  if (!v8)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_38:

    goto LABEL_39;
  }
  v10 = (void *)v8;
  uint64_t v11 = objc_msgSend_objectForKeyedSubscript_(v4, v9, @"solver");
  if (!v11)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_37:

    goto LABEL_38;
  }
  uint64_t v13 = (void *)v11;
  v199 = objc_msgSend_objectForKeyedSubscript_(v4, v12, @"hbf");
  if (!v199)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_36:

    goto LABEL_37;
  }
  uint64_t v15 = objc_msgSend_objectForKeyedSubscript_(v4, v14, @"preprocessing");
  if (!v15)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_35:

    goto LABEL_36;
  }
  uint64_t v17 = (void *)v15;
  v197 = objc_msgSend_objectForKeyedSubscript_(v4, v16, @"postprocessing");
  if (!v197)
  {
    fig_log_get_emitter();
    FigDebugAssert3();

    goto LABEL_35;
  }
  v18 = (FPDisparityEstimator_Parameters *)objc_opt_new();
  FPDisparityEstimator_Config = self->_FPDisparityEstimator_Config;
  self->_FPDisparityEstimator_Config = v18;

  if (!self->_FPDisparityEstimator_Config || (uint64_t v20 = objc_opt_new()) == 0)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v184 = FigSignalErrorAt();
LABEL_44:

    goto LABEL_27;
  }
  uint64_t v21 = (void *)v20;
  v195 = self;
  unsigned int v201 = 0;
  sub_262F034CC(v10, (const char *)@"nview", &v201);
  objc_msgSend_setNView_(v21, v22, v201);
  unsigned int v201 = 0;
  sub_262F03588(v10, (const char *)@"microlens_spatial_offset", 0, &v201);
  LODWORD(v23) = v201;
  objc_msgSend_setMicrolensSpatialOffset_(v21, v24, v25, v23);
  unsigned int v201 = 0;
  sub_262F03588(v10, (const char *)@"foreground_push", 0, &v201);
  LODWORD(v26) = v201;
  objc_msgSend_setForegroundPush_(v21, v27, v28, v26);
  unsigned int v201 = 0;
  sub_262F03588(v10, (const char *)@"background_push", 0, &v201);
  LODWORD(v29) = v201;
  objc_msgSend_setBackgroundPush_(v21, v30, v31, v29);
  unsigned int v201 = 0;
  sub_262F034CC(v10, (const char *)@"rigid_window_support", &v201);
  objc_msgSend_setRigidWindowSupport_(v21, v32, v201);
  unsigned int v201 = 0;
  sub_262F03588(v10, (const char *)@"cost_map_antialiasing_strength", 0, &v201);
  LODWORD(v33) = v201;
  objc_msgSend_setCostMapAntialiasingStrength_(v21, v34, v35, v33);
  unsigned int v201 = 0;
  sub_262F03588(v10, (const char *)@"cost_epsilon", 0, &v201);
  LODWORD(v36) = v201;
  objc_msgSend_setCostEpsilon_(v21, v37, v38, v36);
  unsigned int v201 = 0;
  sub_262F03588(v10, (const char *)@"lens_field_curvature_a0", 0, &v201);
  LODWORD(v39) = v201;
  objc_msgSend_setLensFieldCurvatureA0_(v21, v40, v41, v39);
  unsigned int v201 = 0;
  sub_262F03588(v10, (const char *)@"lens_field_curvature_a1", 0, &v201);
  LODWORD(v42) = v201;
  objc_msgSend_setLensFieldCurvatureA1_(v21, v43, v44, v42);
  unsigned int v201 = 0;
  sub_262F03588(v10, (const char *)@"lens_field_curvature_a2", 0, &v201);
  LODWORD(v45) = v201;
  objc_msgSend_setLensFieldCurvatureA2_(v21, v46, v47, v45);
  unsigned int v201 = 0;
  sub_262F03588(v10, (const char *)@"lens_field_curvature_a3", 0, &v201);
  LODWORD(v48) = v201;
  objc_msgSend_setLensFieldCurvatureA3_(v21, v49, v50, v48);
  unsigned int v201 = 0;
  sub_262F03588(v10, (const char *)@"lens_field_curvature_a4", 0, &v201);
  LODWORD(v51) = v201;
  objc_msgSend_setLensFieldCurvatureA4_(v21, v52, v53, v51);
  unsigned int v201 = 0;
  sub_262F03588(v10, (const char *)@"circle_of_confusion_gain", 0, &v201);
  LODWORD(v54) = v201;
  objc_msgSend_setCircleOfConfusionGain_(v21, v55, v56, v54);
  unsigned int v201 = 0;
  sub_262F03588(v10, (const char *)@"circle_of_confusion_offset", 0, &v201);
  LODWORD(v57) = v201;
  objc_msgSend_setCircleOfConfusionOffset_(v21, v58, v59, v57);
  unsigned int v201 = 0;
  sub_262F03588(v10, (const char *)@"radial_exponent", 0, &v201);
  LODWORD(v60) = v201;
  objc_msgSend_setRadialExponent_(v21, v61, v62, v60);
  unsigned int v201 = 0;
  sub_262F03588(v10, (const char *)@"radial_gain", 0, &v201);
  LODWORD(v63) = v201;
  objc_msgSend_setRadialGain_(v21, v64, v65, v63);
  unsigned int v201 = 0;
  sub_262F03588(v10, (const char *)@"radial_min", 0, &v201);
  LODWORD(v66) = v201;
  objc_msgSend_setRadialMin_(v21, v67, v68, v66);
  unsigned int v201 = 0;
  sub_262F03588(v10, (const char *)@"AGC_low", 0, &v201);
  LODWORD(v69) = v201;
  objc_msgSend_setAGCLow_(v21, v70, v71, v69);
  unsigned int v201 = 0;
  sub_262F03588(v10, (const char *)@"AGC_high", 0, &v201);
  LODWORD(v72) = v201;
  v196 = v21;
  objc_msgSend_setAGCHigh_(v21, v73, v74, v72);
  id v75 = objc_alloc(MEMORY[0x263EFF980]);
  double v77 = objc_msgSend_initWithCapacity_(v75, v76, 11);
  for (uint64_t i = 0; i != 11; ++i)
  {
    unsigned int v201 = 0;
    sub_262F03588(v10, (const char *)@"correction_coefficients_weights", i, &v201);
    LODWORD(v79) = v201;
    uint64_t v82 = objc_msgSend_numberWithFloat_(NSNumber, v80, v81, v79);
    objc_msgSend_setObject_atIndexedSubscript_(v77, v83, (uint64_t)v82, i);
  }
  objc_msgSend_setCorrectionCoefficientsWeights_(v196, v84, (uint64_t)v77);

  objc_msgSend_setFPcostParameters_(self->_FPDisparityEstimator_Config, v85, (uint64_t)v196);
  uint64_t v86 = objc_opt_new();
  if (!v86)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v184 = FigSignalErrorAt();
LABEL_43:

    goto LABEL_44;
  }
  uint64_t v87 = (void *)v86;
  unsigned int v201 = 0;
  sub_262F03588(v17, (const char *)@"black_level_offset", 0, &v201);
  LODWORD(v88) = v201;
  objc_msgSend_setBlackLevelOffset_(v87, v89, v90, v88);
  unsigned int v201 = 0;
  sub_262F03588(v17, (const char *)@"black_level_scaling", 0, &v201);
  LODWORD(v91) = v201;
  objc_msgSend_setBlackLevelScaling_(v87, v92, v93, v91);
  objc_msgSend_setFPpreprocessingParameters_(self->_FPDisparityEstimator_Config, v94, (uint64_t)v87);
  uint64_t v95 = objc_opt_new();
  if (!v95)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v184 = FigSignalErrorAt();

    goto LABEL_43;
  }
  uint64_t v96 = (void *)v95;
  v192 = v87;
  v193 = v17;
  v198 = v6;
  id v194 = v4;
  unsigned int v201 = 0;
  sub_262F03588(v197, (const char *)@"shift_to_disparity_ratio", 0, &v201);
  LODWORD(v97) = v201;
  objc_msgSend_setShiftToDisparityRatio_(v96, v98, v99, v97);
  unsigned int v201 = 0;
  sub_262F03588(v197, (const char *)@"max_residual1", 0, &v201);
  LODWORD(v100) = v201;
  objc_msgSend_setCalibrationMaxResidual1_(v96, v101, v102, v100);
  unsigned int v201 = 0;
  sub_262F03588(v197, (const char *)@"max_residual2", 0, &v201);
  LODWORD(v103) = v201;
  objc_msgSend_setCalibrationMaxResidual2_(v96, v104, v105, v103);
  v191 = v96;
  objc_msgSend_setFPpostprocessingParameters_(self->_FPDisparityEstimator_Config, v106, (uint64_t)v96);
  uint64_t v107 = 0;
  while (1)
  {
    double v108 = objc_opt_new();
    v109 = objc_opt_new();
    uint64_t v110 = objc_opt_new();
    double v111 = objc_opt_new();
    uint64_t v112 = objc_opt_new();
    uint64_t v113 = (void *)v112;
    if (v108 && v109 && v110 && v111 && v112)
    {
      unsigned int v201 = 0;
      sub_262F03588(v200, (const char *)@"alpha", v107, &v201);
      LODWORD(v114) = v201;
      objc_msgSend_setAlpha_(v109, v115, v116, v114);
      unsigned int v201 = 0;
      sub_262F03588(v200, (const char *)@"beta", v107, &v201);
      LODWORD(v117) = v201;
      objc_msgSend_setBeta_(v109, v118, v119, v117);
      unsigned int v201 = 0;
      sub_262F03588(v200, (const char *)@"gain", v107, &v201);
      LODWORD(v120) = v201;
      objc_msgSend_setGain_(v109, v121, v122, v120);
      unsigned int v201 = 0;
      sub_262F03588(v200, (const char *)@"offset", v107, &v201);
      LODWORD(v123) = v201;
      objc_msgSend_setOffset_(v109, v124, v125, v123);
      unsigned int v201 = 0;
      sub_262F03588(v200, (const char *)@"segmentation_bias_background", v107, &v201);
      LODWORD(v126) = v201;
      objc_msgSend_setSegmentation_bias_background_(v109, v127, v128, v126);
      unsigned int v201 = 0;
      sub_262F03588(v200, (const char *)@"segmentation_bias_foreground", v107, &v201);
      LODWORD(v129) = v201;
      objc_msgSend_setSegmentation_bias_foreground_(v109, v130, v131, v129);
      unsigned int v201 = 0;
      sub_262F03588(v13, (const char *)@"a_checkerboard", v107, &v201);
      LODWORD(v132) = v201;
      objc_msgSend_setA_checkerboard_(v110, v133, v134, v132);
      unsigned int v201 = 0;
      sub_262F03588(v13, (const char *)@"b_checkerboard", v107, &v201);
      LODWORD(v135) = v201;
      objc_msgSend_setB_checkerboard_(v110, v136, v137, v135);
      unsigned int v201 = 0;
      sub_262F03588(v13, (const char *)@"tau", v107, &v201);
      LODWORD(v138) = v201;
      objc_msgSend_setTau_(v110, v139, v140, v138);
      unsigned int v201 = 0;
      sub_262F03588(v13, (const char *)@"sigma", v107, &v201);
      LODWORD(v141) = v201;
      objc_msgSend_setSigma_(v110, v142, v143, v141);
      unsigned int v201 = 0;
      sub_262F03588(v13, (const char *)@"theta", v107, &v201);
      LODWORD(v144) = v201;
      objc_msgSend_setTheta_(v110, v145, v146, v144);
      unsigned int v201 = 0;
      sub_262F03588(v13, (const char *)@"huber_eps", v107, &v201);
      LODWORD(v147) = v201;
      objc_msgSend_setHuber_eps_(v110, v148, v149, v147);
      unsigned int v201 = 0;
      sub_262F03640(v13, (const char *)@"warpings", v107, &v201);
      objc_msgSend_setWarpings_(v110, v150, v201);
      unsigned int v201 = 0;
      sub_262F03640(v13, (const char *)@"iterations", v107, &v201);
      objc_msgSend_setIterations_(v110, v151, v201);
      unsigned int v201 = 0;
      sub_262F03640(v199, (const char *)@"scales", v107, &v201);
      objc_msgSend_setScales_(v111, v152, v201);
      unsigned int v201 = 0;
      sub_262F03640(v199, (const char *)@"radius", v107, &v201);
      objc_msgSend_setRadius_(v111, v153, v201);
      unsigned int v201 = 0;
      sub_262F03640(v199, (const char *)@"padding", v107, &v201);
      objc_msgSend_setPadding_(v111, v154, v201);
      unsigned int v201 = 0;
      sub_262F03588(v199, (const char *)@"sigma_0", v107, &v201);
      LODWORD(v155) = v201;
      objc_msgSend_setSigma_0_(v111, v156, v157, v155);
      unsigned int v201 = 0;
      sub_262F03588(v199, (const char *)@"sigma_1", v107, &v201);
      LODWORD(v158) = v201;
      objc_msgSend_setSigma_1_(v111, v159, v160, v158);
      unsigned int v201 = 0;
      sub_262F03588(v199, (const char *)@"sigma_2", v107, &v201);
      LODWORD(v161) = v201;
      objc_msgSend_setSigma_2_(v111, v162, v163, v161);
      unsigned int v201 = 0;
      sub_262F03588(v10, (const char *)@"lambda", v107, &v201);
      LODWORD(v164) = v201;
      objc_msgSend_setLambda_(v113, v165, v166, v164);
      unsigned int v201 = 0;
      sub_262F03588(v10, (const char *)@"step", v107, &v201);
      LODWORD(v167) = v201;
      objc_msgSend_setStep_(v113, v168, v169, v167);
      unsigned int v201 = 0;
      sub_262F03588(v10, (const char *)@"step_lowlight", v107, &v201);
      LODWORD(v170) = v201;
      objc_msgSend_setStepLowlight_(v113, v171, v172, v170);
      unsigned int v201 = 0;
      sub_262F03588(v10, (const char *)@"lambda_background", v107, &v201);
      LODWORD(v173) = v201;
      objc_msgSend_setLambda_background_(v113, v174, v175, v173);
      unsigned int v201 = 0;
      sub_262F03588(v10, (const char *)@"lambda_foreground", v107, &v201);
      LODWORD(v176) = v201;
      objc_msgSend_setLambda_foreground_(v113, v177, v178, v176);
      objc_msgSend_setSolverParameters_(v108, v179, (uint64_t)v110);
      objc_msgSend_setRegularizationParameters_(v108, v180, (uint64_t)v109);
      objc_msgSend_setHbfParameters_(v108, v181, (uint64_t)v111);
      objc_msgSend_setCostParameters_(v108, v182, (uint64_t)v113);
      objc_msgSend_setObject_atIndexedSubscript_(v198, v183, (uint64_t)v108, v107);
      int v184 = 0;
      char v185 = 1;
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      int v184 = FigSignalErrorAt();
      char v185 = 0;
    }

    if ((v185 & 1) == 0) {
      break;
    }
    if (++v107 == 8)
    {
      id v6 = v198;
      v188 = objc_msgSend_copy(v198, v186, v187);
      objc_msgSend_setLevelsParameters_(v195->_FPDisparityEstimator_Config, v189, (uint64_t)v188);

      int v184 = 0;
      id v4 = v194;
      goto LABEL_27;
    }
  }

  id v4 = v194;
  id v6 = v198;
LABEL_27:

  return v184;
}

- (FocusPixelDisparityTuningParameters)initWithTuningDictionary:(id)a3 cameraInfoByPortType:(id)a4
{
  id v5 = a3;
  uint64_t v8 = objc_msgSend_init(self, v6, v7);
  v10 = v8;
  if (!v8) {
    goto LABEL_6;
  }
  if (objc_msgSend_readFPDisparity_v3_Config_(v8, v9, (uint64_t)v5))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_6:
    uint64_t v11 = 0;
    goto LABEL_4;
  }
  uint64_t v11 = v10;
LABEL_4:

  return v11;
}

- (FPDisparityEstimator_Parameters)FPDisparityEstimator_Config
{
  return self->_FPDisparityEstimator_Config;
}

- (void).cxx_destruct
{
}

@end