@interface FigSDOFRenderingTuningParameters
- (FigSDOFRenderingTuningParameters)init;
- (FigSDOFRenderingTuningParameters)initWithTuningDictionary:(id)a3;
- (float)maximumSimulatedAperture;
- (float)minimumSimulatedAperture;
- (float)simulatedAperture;
- (id)encodeParametersForSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (id)encodeParametersForSampleBuffer:(opaqueCMSampleBuffer *)a3 captureType:(int)a4;
- (id)parameterSetForMode:(int)a3;
- (int)calculateDynamicTuningParamsForSampleBuffer:(opaqueCMSampleBuffer *)a3 dynamicParams:(const dynamic_tuning_parameters *)a4 outSegmentationFusionConfig:(segmentation_fusion_params *)a5 outSimpleLensModelConfig:(simple_lens_model_params *)a6 outBlurmapRefinementConfig:(blurmap_refinement_params *)a7;
- (int)calculateXHLRBParamsForSampleBuffer:(opaqueCMSampleBuffer *)a3 tuningParams:(id)a4 outParams:(xhlrb_control_params *)a5;
- (int)gainMapHeadroomForSampleBuffer:(opaqueCMSampleBuffer *)a3 headroom:(float *)a4;
@end

@implementation FigSDOFRenderingTuningParameters

- (FigSDOFRenderingTuningParameters)init
{
  v7.receiver = self;
  v7.super_class = (Class)FigSDOFRenderingTuningParameters;
  v2 = [(FigSDOFRenderingTuningParameters *)&v7 init];
  if (!v2) {
    goto LABEL_6;
  }
  v3 = objc_alloc_init(FigSDOFRenderingTuningParametersSet);
  standardParameters = v2->_standardParameters;
  v2->_standardParameters = v3;

  if (!v2->_standardParameters)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_6:
    v5 = 0;
    goto LABEL_4;
  }
  v5 = v2;
LABEL_4:

  return v5;
}

- (FigSDOFRenderingTuningParameters)initWithTuningDictionary:(id)a3
{
  id v4 = a3;
  v8 = objc_msgSend_init(self, v5, v6, v7);
  if (!v8) {
    goto LABEL_6;
  }
  v9 = [FigSDOFRenderingTuningParametersSet alloc];
  uint64_t v11 = objc_msgSend_initWithTuningDictionary_suffix_(v9, v10, (uint64_t)v4, 0);
  v12 = (void *)v8[1];
  v8[1] = v11;

  if (!v8[1])
  {
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_6:
    v17 = 0;
    goto LABEL_4;
  }
  v13 = [FigSDOFRenderingTuningParametersSet alloc];
  uint64_t v15 = objc_msgSend_initWithTuningDictionary_suffix_(v13, v14, (uint64_t)v4, @"NMP");
  v16 = (void *)v8[2];
  v8[2] = v15;

  v17 = v8;
LABEL_4:

  return v17;
}

- (id)parameterSetForMode:(int)a3
{
  if (!a3)
  {
    uint64_t v4 = 8;
LABEL_5:
    id v5 = *(id *)((char *)&self->super.isa + v4);
    return v5;
  }
  if (a3 == 1)
  {
    uint64_t v4 = 16;
    goto LABEL_5;
  }
  id v5 = 0;
  return v5;
}

- (int)calculateXHLRBParamsForSampleBuffer:(opaqueCMSampleBuffer *)a3 tuningParams:(id)a4 outParams:(xhlrb_control_params *)a5
{
  id v6 = a4;
  v10 = v6;
  CGSize v11 = *(CGSize *)(MEMORY[0x263F001A8] + 16);
  rect.origin = (CGPoint)*MEMORY[0x263F001A8];
  rect.size = v11;
  uint64_t v26 = 0;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v23 = 0u;
  if (v6)
  {
    objc_msgSend_simpleLensModelConfig(v6, v7, v8, v9);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v18 = 0u;
    objc_msgSend_xhlrbControlConfig(v10, v12, v13, v14);
  }
  else
  {
    long long v21 = 0uLL;
    long long v22 = 0uLL;
    long long v19 = 0uLL;
    long long v20 = 0uLL;
    long long v18 = 0uLL;
  }
  int v17 = 0;
  uint64_t v16 = 0;
  *(void *)&a5->var0 = 0;
  *(void *)&a5->var2 = 0;

  return 0;
}

- (int)calculateDynamicTuningParamsForSampleBuffer:(opaqueCMSampleBuffer *)a3 dynamicParams:(const dynamic_tuning_parameters *)a4 outSegmentationFusionConfig:(segmentation_fusion_params *)a5 outSimpleLensModelConfig:(simple_lens_model_params *)a6 outBlurmapRefinementConfig:(blurmap_refinement_params *)a7
{
  CGSize v11 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x263F2C558], 0);
  uint64_t v14 = v11;
  if (!v11)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_12:
    int v42 = -12780;
    goto LABEL_8;
  }
  uint64_t v15 = objc_msgSend_objectForKeyedSubscript_(v11, v12, *MEMORY[0x263F2EC48], v13);
  long long v19 = v15;
  if (v15)
  {
    objc_msgSend_floatValue(v15, v16, v17, v18);
    float v21 = v20;
  }
  else
  {
    float v21 = 0.0;
  }
  uint64_t v22 = objc_msgSend_objectForKeyedSubscript_(v14, v16, *MEMORY[0x263F2D208], v18);
  if (!v22)
  {
    fig_log_get_emitter();
    FigDebugAssert3();

    goto LABEL_12;
  }
  long long v25 = (void *)v22;
  uint64_t v26 = objc_msgSend_objectForKeyedSubscript_(v14, v23, *MEMORY[0x263F2D090], v24);
  if (!v26)
  {
    fig_log_get_emitter();
    FigDebugAssert3();

    goto LABEL_12;
  }
  v30 = (void *)v26;
  objc_msgSend_floatValue(v25, v27, v28, v29);
  float v32 = v31;
  objc_msgSend_floatValue(v30, v33, v34, v35);
  v44[0] = v32 * v36;
  v44[1] = v21;
  float v37 = sub_263542278(&a4->segmentationFusionAdditiveMaxBlur.brightLightExposureLevel, v44);
  float v38 = sub_263542278(&a4->segmentationFusionSubtractiveMaxBlur.brightLightExposureLevel, v44);
  float v39 = sub_263542278(&a4->disparityScalingFactor.brightLightExposureLevel, v44);
  float v40 = sub_263542278(&a4->hairAdditiveMaxBlur.brightLightExposureLevel, v44);
  float v41 = sub_263542278(&a4->hairSubtractiveMaxBlur.brightLightExposureLevel, v44);
  a5->additiveMaxBlur = v37;
  a5->subtractiveMaxBlur = v38;
  a6->disparityScalingFactor = v39;
  a7->hairParams.fusion.additiveMaxBlur = v40;
  a7->hairParams.fusion.subtractiveMaxBlur = v41;

  int v42 = 0;
LABEL_8:

  return v42;
}

- (id)encodeParametersForSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  return (id)MEMORY[0x270F9A6D0](self, sel_encodeParametersForSampleBuffer_captureType_, a3, 0);
}

- (int)gainMapHeadroomForSampleBuffer:(opaqueCMSampleBuffer *)a3 headroom:(float *)a4
{
  if (a3 && a4)
  {
    CFDictionaryRef v5 = (const __CFDictionary *)CMGetAttachment(a3, @"AttachedMedia", 0);
    if (!v5 || (Value = CFDictionaryGetValue(v5, @"GainMap")) == 0)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      return -12783;
    }
    CFDictionaryRef v7 = (const __CFDictionary *)CMGetAttachment(Value, (CFStringRef)*MEMORY[0x263F2C558], 0);
    if (!v7)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      return -12784;
    }
    CFDictionaryRef v8 = v7;
    uint64_t v9 = CFDictionaryGetValue(v7, @"GainMapVersion");
    v10 = CFDictionaryGetValue(v8, @"GainMapHeadroom");
    CFTypeID TypeID = CFNumberGetTypeID();
    if (TypeID == CFGetTypeID(v9))
    {
      CFTypeID v12 = CFNumberGetTypeID();
      if (v12 == CFGetTypeID(v10) && (int)FigCFNumberGetSInt32() >= 0x20000)
      {
        FigCFNumberGetFloat32();
        int result = 0;
        *(_DWORD *)a4 = v14;
        return result;
      }
    }
  }
  fig_log_get_emitter();
  FigDebugAssert3();
  return -12780;
}

- (id)encodeParametersForSampleBuffer:(opaqueCMSampleBuffer *)a3 captureType:(int)a4
{
  long long v562 = 0u;
  long long v563 = 0u;
  int v561 = 0;
  id v6 = objc_msgSend_parameterSetForMode_(self, a2, *(uint64_t *)&a4, *(uint64_t *)&a4);
  v10 = v6;
  if (v6)
  {
    long long v559 = 0u;
    long long v560 = 0u;
    long long v557 = 0u;
    long long v558 = 0u;
    long long v555 = 0u;
    long long v556 = 0u;
    long long v554 = 0u;
    memset(v553, 0, sizeof(v553));
    objc_msgSend_dynamicParams(v6, v7, v8, v9);
    int v552 = 0;
    long long v550 = 0u;
    long long v551 = 0u;
    objc_msgSend_segmentationFusionConfig(v10, v11, v12, v13);
    long long v548 = 0u;
    memset(v549, 0, 28);
    long long v546 = 0u;
    long long v547 = 0u;
    long long v544 = 0u;
    long long v545 = 0u;
    long long v542 = 0u;
    long long v543 = 0u;
    long long v540 = 0u;
    long long v541 = 0u;
    long long v538 = 0u;
    long long v539 = 0u;
    objc_msgSend_blurmapRefinementConfig(v10, v14, v15, v16);
    uint64_t v537 = 0;
    long long v535 = 0u;
    long long v536 = 0u;
    long long v534 = 0u;
    objc_msgSend_simpleLensModelConfig(v10, v17, v18, v19);
    objc_msgSend_disparityRefinementConfig(v10, v20, v21, v22);
    uint64_t v26 = objc_msgSend_disparityRefinementVersion(v10, v23, v24, v25);
    objc_msgSend_renderingConfig(v10, v27, v28, v29);
    objc_msgSend_crispHairConfig(v10, v30, v31, v32);
    objc_msgSend_blurmapSmoothingConfig(v10, v33, v34, v35);
    objc_msgSend_faceMaskConfig(v10, v36, v37, v38);
    objc_msgSend_mattingConfig(v10, v39, v40, v41);
    if ((int)objc_msgSend_renderingMajorVersion(v10, v42, v43, v44) >= 8) {
      objc_msgSend_gainMapHeadroomForSampleBuffer_headroom_(self, v45, (uint64_t)a3, (uint64_t)&v561);
    }
    if (objc_msgSend_calculateDynamicTuningParamsForSampleBuffer_dynamicParams_outSegmentationFusionConfig_outSimpleLensModelConfig_outBlurmapRefinementConfig_(self, v45, (uint64_t)a3, (uint64_t)v553, &v550, &v534, &v538))
    {
      int v552 = v556;
      DWORD1(v551) = v554;
      HIDWORD(v540) = v558;
      DWORD2(v541) = v558;
      HIDWORD(v537) = 1065353216;
    }
    objc_msgSend_calculateXHLRBParamsForSampleBuffer_tuningParams_outParams_(self, v46, (uint64_t)a3, (uint64_t)v10, &v562);
    v47 = [FigDepthBlurEffectRenderingParametersV4_Builder alloc];
    uint64_t v51 = objc_msgSend_renderingMajorVersion(v10, v48, v49, v50);
    v54 = objc_msgSend_initWithVersion_(v47, v52, v51, v53);
    objc_msgSend_setParam_intValue_(v54, v55, 100, v26);
    objc_msgSend_setParam_intValue_(v54, v56, 101, 0);
    LODWORD(v57) = 0;
    objc_msgSend_setParam_floatValue_(v54, v58, 102, v59, v57);
    LODWORD(v60) = 0;
    objc_msgSend_setParam_floatValue_(v54, v61, 103, v62, v60);
    LODWORD(v63) = 0;
    objc_msgSend_setParam_floatValue_(v54, v64, 104, v65, v63);
    LODWORD(v66) = 0;
    objc_msgSend_setParam_floatValue_(v54, v67, 105, v68, v66);
    LODWORD(v69) = 0;
    objc_msgSend_setParam_floatValue_(v54, v70, 106, v71, v69);
    LODWORD(v72) = 0;
    objc_msgSend_setParam_floatValue_(v54, v73, 107, v74, v72);
    LODWORD(v75) = 0;
    objc_msgSend_setParam_floatValue_(v54, v76, 108, v77, v75);
    LODWORD(v78) = 0;
    objc_msgSend_setParam_floatValue_(v54, v79, 109, v80, v78);
    objc_msgSend_setParam_intValue_(v54, v81, 110, 0);
    LODWORD(v82) = 0;
    objc_msgSend_setParam_floatValue_(v54, v83, 111, v84, v82);
    LODWORD(v85) = 0;
    objc_msgSend_setParam_floatValue_(v54, v86, 112, v87, v85);
    LODWORD(v88) = 0;
    objc_msgSend_setParam_floatValue_(v54, v89, 113, v90, v88);
    LODWORD(v91) = 0;
    objc_msgSend_setParam_floatValue_(v54, v92, 114, v93, v91);
    LODWORD(v94) = 0;
    objc_msgSend_setParam_floatValue_(v54, v95, 115, v96, v94);
    LODWORD(v97) = 0;
    objc_msgSend_setParam_floatValue_(v54, v98, 116, v99, v97);
    LODWORD(v100) = v537;
    objc_msgSend_setParam_floatValue_(v54, v101, 200, v102, v100);
    LODWORD(v103) = v535;
    objc_msgSend_setParam_floatValue_(v54, v104, 201, v105, v103);
    LODWORD(v106) = DWORD2(v536);
    objc_msgSend_setParam_floatValue_(v54, v107, 202, v108, v106);
    LODWORD(v109) = HIDWORD(v535);
    objc_msgSend_setParam_floatValue_(v54, v110, 601, v111, v109);
    LODWORD(v112) = v536;
    objc_msgSend_setParam_floatValue_(v54, v113, 602, v114, v112);
    LODWORD(v115) = 0;
    objc_msgSend_setParam_floatValue_(v54, v116, 600, v117, v115);
    LODWORD(v118) = HIDWORD(v537);
    objc_msgSend_setParam_floatValue_(v54, v119, 603, v120, v118);
    LODWORD(v121) = v544;
    objc_msgSend_setParam_floatValue_(v54, v122, 1008, v123, v121);
    LODWORD(v124) = v549[1];
    objc_msgSend_setParam_floatValue_(v54, v125, 1009, v126, v124);
    LODWORD(v127) = v549[2];
    objc_msgSend_setParam_floatValue_(v54, v128, 1010, v129, v127);
    LODWORD(v130) = v541;
    objc_msgSend_setParam_floatValue_(v54, v131, 1019, v132, v130);
    LODWORD(v133) = DWORD1(v541);
    objc_msgSend_setParam_floatValue_(v54, v134, 1020, v135, v133);
    LODWORD(v136) = DWORD2(v541);
    objc_msgSend_setParam_floatValue_(v54, v137, 1021, v138, v136);
    LODWORD(v139) = DWORD1(v540);
    objc_msgSend_setParam_floatValue_(v54, v140, 1017, v141, v139);
    LODWORD(v142) = DWORD2(v540);
    objc_msgSend_setParam_floatValue_(v54, v143, 1018, v144, v142);
    LODWORD(v145) = HIDWORD(v540);
    objc_msgSend_setParam_floatValue_(v54, v146, 1022, v147, v145);
    LODWORD(v148) = DWORD1(v542);
    objc_msgSend_setParam_floatValue_(v54, v149, 1016, v150, v148);
    objc_msgSend_setParam_intValue_(v54, v151, 1014, HIDWORD(v541));
    LODWORD(v152) = v542;
    objc_msgSend_setParam_floatValue_(v54, v153, 1015, v154, v152);
    LODWORD(v155) = HIDWORD(v543);
    objc_msgSend_setParam_floatValue_(v54, v156, 1005, v157, v155);
    LODWORD(v158) = v540;
    objc_msgSend_setParam_floatValue_(v54, v159, 1013, v160, v158);
    objc_msgSend_setParam_intValue_(v54, v161, 1011, DWORD2(v539));
    LODWORD(v162) = HIDWORD(v539);
    objc_msgSend_setParam_floatValue_(v54, v163, 1012, v164, v162);
    LODWORD(v165) = DWORD2(v542);
    objc_msgSend_setParam_floatValue_(v54, v166, 1004, v167, v165);
    LODWORD(v168) = DWORD1(v543);
    objc_msgSend_setParam_floatValue_(v54, v169, 1006, v170, v168);
    LODWORD(v171) = DWORD2(v543);
    objc_msgSend_setParam_floatValue_(v54, v172, 1007, v173, v171);
    LODWORD(v174) = DWORD1(v544);
    objc_msgSend_setParam_floatValue_(v54, v175, 1000, v176, v174);
    LODWORD(v177) = DWORD2(v544);
    objc_msgSend_setParam_floatValue_(v54, v178, 1001, v179, v177);
    LODWORD(v180) = v545;
    objc_msgSend_setParam_floatValue_(v54, v181, 1003, v182, v180);
    LODWORD(v183) = HIDWORD(v544);
    objc_msgSend_setParam_floatValue_(v54, v184, 1002, v185, v183);
    LODWORD(v186) = v543;
    objc_msgSend_setParam_floatValue_(v54, v187, 1023, v188, v186);
    objc_msgSend_setParam_intValue_(v54, v189, 1024, DWORD1(v545));
    LODWORD(v190) = DWORD2(v545);
    objc_msgSend_setParam_floatValue_(v54, v191, 1025, v192, v190);
    LODWORD(v193) = HIDWORD(v545);
    objc_msgSend_setParam_floatValue_(v54, v194, 1026, v195, v193);
    LODWORD(v196) = v546;
    objc_msgSend_setParam_floatValue_(v54, v197, 1027, v198, v196);
    LODWORD(v199) = DWORD1(v546);
    objc_msgSend_setParam_floatValue_(v54, v200, 1028, v201, v199);
    LODWORD(v202) = DWORD2(v546);
    objc_msgSend_setParam_floatValue_(v54, v203, 1029, v204, v202);
    LODWORD(v205) = HIDWORD(v546);
    objc_msgSend_setParam_floatValue_(v54, v206, 1030, v207, v205);
    LODWORD(v208) = v547;
    objc_msgSend_setParam_floatValue_(v54, v209, 1031, v210, v208);
    LODWORD(v211) = DWORD1(v547);
    objc_msgSend_setParam_floatValue_(v54, v212, 1032, v213, v211);
    LODWORD(v214) = DWORD2(v547);
    objc_msgSend_setParam_floatValue_(v54, v215, 1033, v216, v214);
    LODWORD(v217) = HIDWORD(v547);
    objc_msgSend_setParam_floatValue_(v54, v218, 1034, v219, v217);
    LODWORD(v220) = v548;
    objc_msgSend_setParam_floatValue_(v54, v221, 1035, v222, v220);
    LODWORD(v223) = DWORD1(v548);
    objc_msgSend_setParam_floatValue_(v54, v224, 1036, v225, v223);
    LODWORD(v226) = DWORD2(v548);
    objc_msgSend_setParam_floatValue_(v54, v227, 1037, v228, v226);
    LODWORD(v229) = HIDWORD(v548);
    objc_msgSend_setParam_floatValue_(v54, v230, 1038, v231, v229);
    LODWORD(v232) = v549[0];
    objc_msgSend_setParam_floatValue_(v54, v233, 1039, v234, v232);
    LODWORD(v235) = 0;
    objc_msgSend_setParam_floatValue_(v54, v236, 1100, v237, v235);
    LODWORD(v238) = 0;
    objc_msgSend_setParam_floatValue_(v54, v239, 1101, v240, v238);
    LODWORD(v241) = 0;
    objc_msgSend_setParam_floatValue_(v54, v242, 1102, v243, v241);
    LODWORD(v244) = 0;
    objc_msgSend_setParam_floatValue_(v54, v245, 1103, v246, v244);
    LODWORD(v247) = 0;
    objc_msgSend_setParam_floatValue_(v54, v248, 1104, v249, v247);
    objc_msgSend_setParam_intValue_(v54, v250, 800, 0);
    LODWORD(v251) = 0;
    objc_msgSend_setParam_floatValue_(v54, v252, 801, v253, v251);
    LODWORD(v254) = 0;
    objc_msgSend_setParam_floatValue_(v54, v255, 802, v256, v254);
    LODWORD(v257) = 0;
    objc_msgSend_setParam_floatValue_(v54, v258, 803, v259, v257);
    LODWORD(v260) = 0;
    objc_msgSend_setParam_floatValue_(v54, v261, 804, v262, v260);
    LODWORD(v263) = 0;
    objc_msgSend_setParam_floatValue_(v54, v264, 300, v265, v263);
    LODWORD(v266) = 0;
    objc_msgSend_setParam_floatValue_(v54, v267, 301, v268, v266);
    LODWORD(v269) = 0;
    objc_msgSend_setParam_floatValue_(v54, v270, 302, v271, v269);
    LODWORD(v272) = 0;
    objc_msgSend_setParam_floatValue_(v54, v273, 303, v274, v272);
    LODWORD(v275) = 0;
    objc_msgSend_setParam_floatValue_(v54, v276, 304, v277, v275);
    LODWORD(v278) = 0;
    objc_msgSend_setParam_floatValue_(v54, v279, 305, v280, v278);
    LODWORD(v281) = 0;
    objc_msgSend_setParam_floatValue_(v54, v282, 306, v283, v281);
    LODWORD(v284) = 0;
    objc_msgSend_setParam_floatValue_(v54, v285, 307, v286, v284);
    LODWORD(v287) = HIDWORD(v550);
    objc_msgSend_setParam_floatValue_(v54, v288, 900, v289, v287);
    LODWORD(v290) = v551;
    objc_msgSend_setParam_floatValue_(v54, v291, 901, v292, v290);
    LODWORD(v293) = DWORD1(v551);
    objc_msgSend_setParam_floatValue_(v54, v294, 902, v295, v293);
    LODWORD(v296) = DWORD2(v551);
    objc_msgSend_setParam_floatValue_(v54, v297, 903, v298, v296);
    LODWORD(v299) = HIDWORD(v551);
    objc_msgSend_setParam_floatValue_(v54, v300, 904, v301, v299);
    LODWORD(v302) = v552;
    objc_msgSend_setParam_floatValue_(v54, v303, 905, v304, v302);
    objc_msgSend_setParam_intValue_(v54, v305, 400, v562);
    LODWORD(v306) = DWORD1(v562);
    objc_msgSend_setParam_floatValue_(v54, v307, 401, v308, v306);
    LODWORD(v309) = DWORD2(v562);
    objc_msgSend_setParam_floatValue_(v54, v310, 402, v311, v309);
    LODWORD(v312) = HIDWORD(v562);
    objc_msgSend_setParam_floatValue_(v54, v313, 403, v314, v312);
    LODWORD(v315) = 0;
    objc_msgSend_setParam_floatValue_(v54, v316, 404, v317, v315);
    LODWORD(v318) = 0;
    objc_msgSend_setParam_floatValue_(v54, v319, 405, v320, v318);
    LODWORD(v321) = 0;
    objc_msgSend_setParam_floatValue_(v54, v322, 406, v323, v321);
    LODWORD(v324) = 0;
    objc_msgSend_setParam_floatValue_(v54, v325, 407, v326, v324);
    LODWORD(v327) = 0;
    objc_msgSend_setParam_floatValue_(v54, v328, 408, v329, v327);
    LODWORD(v330) = 0;
    objc_msgSend_setParam_floatValue_(v54, v331, 409, v332, v330);
    LODWORD(v333) = v563;
    objc_msgSend_setParam_floatValue_(v54, v334, 450, v335, v333);
    LODWORD(v336) = DWORD1(v563);
    objc_msgSend_setParam_floatValue_(v54, v337, 451, v338, v336);
    LODWORD(v339) = DWORD2(v563);
    objc_msgSend_setParam_floatValue_(v54, v340, 452, v341, v339);
    LODWORD(v342) = HIDWORD(v563);
    objc_msgSend_setParam_floatValue_(v54, v343, 453, v344, v342);
    if ((int)objc_msgSend_renderingMajorVersion(v10, v345, v346, v347) >= 5)
    {
      LODWORD(v350) = 0;
      objc_msgSend_setParam_floatValue_(v54, v348, 454, v349, v350);
      LODWORD(v351) = 0;
      objc_msgSend_setParam_floatValue_(v54, v352, 117, v353, v351);
      LODWORD(v354) = 0;
      objc_msgSend_setParam_floatValue_(v54, v355, 118, v356, v354);
      LODWORD(v357) = 0;
      objc_msgSend_setParam_floatValue_(v54, v358, 119, v359, v357);
      LODWORD(v360) = 0;
      objc_msgSend_setParam_floatValue_(v54, v361, 120, v362, v360);
      LODWORD(v363) = 0;
      objc_msgSend_setParam_floatValue_(v54, v364, 121, v365, v363);
      LODWORD(v366) = 0;
      objc_msgSend_setParam_floatValue_(v54, v367, 122, v368, v366);
      LODWORD(v369) = 0;
      objc_msgSend_setParam_floatValue_(v54, v370, 123, v371, v369);
      LODWORD(v372) = 0;
      objc_msgSend_setParam_floatValue_(v54, v373, 124, v374, v372);
      LODWORD(v375) = 0;
      objc_msgSend_setParam_floatValue_(v54, v376, 125, v377, v375);
      LODWORD(v378) = 0;
      objc_msgSend_setParam_floatValue_(v54, v379, 126, v380, v378);
      objc_msgSend_setParam_intValue_(v54, v381, 127, 0);
      LODWORD(v382) = 0;
      objc_msgSend_setParam_floatValue_(v54, v383, 128, v384, v382);
    }
    objc_msgSend_setParam_intValue_(v54, v348, 498, 0);
    objc_msgSend_setParam_intValue_(v54, v385, 499, 0);
    objc_msgSend_setParam_intValue_(v54, v386, 500, 0);
    LODWORD(v387) = 0;
    objc_msgSend_setParam_floatValue_(v54, v388, 501, v389, v387);
    LODWORD(v390) = 0;
    objc_msgSend_setParam_floatValue_(v54, v391, 502, v392, v390);
    LODWORD(v393) = 0;
    objc_msgSend_setParam_floatValue_(v54, v394, 503, v395, v393);
    LODWORD(v396) = 0;
    objc_msgSend_setParam_floatValue_(v54, v397, 504, v398, v396);
    LODWORD(v399) = 0;
    objc_msgSend_setParam_floatValue_(v54, v400, 505, v401, v399);
    LODWORD(v402) = 0;
    objc_msgSend_setParam_floatValue_(v54, v403, 506, v404, v402);
    LODWORD(v405) = 0;
    objc_msgSend_setParam_floatValue_(v54, v406, 507, v407, v405);
    objc_msgSend_setParam_intValue_(v54, v408, 508, 0);
    LODWORD(v409) = 0;
    objc_msgSend_setParam_floatValue_(v54, v410, 509, v411, v409);
    LODWORD(v412) = 0;
    objc_msgSend_setParam_floatValue_(v54, v413, 510, v414, v412);
    LODWORD(v415) = 0;
    objc_msgSend_setParam_floatValue_(v54, v416, 511, v417, v415);
    objc_msgSend_setParam_intValue_(v54, v418, 512, 0);
    LODWORD(v419) = 0;
    objc_msgSend_setParam_floatValue_(v54, v420, 513, v421, v419);
    LODWORD(v422) = 0;
    objc_msgSend_setParam_floatValue_(v54, v423, 514, v424, v422);
    LODWORD(v425) = 0;
    objc_msgSend_setParam_floatValue_(v54, v426, 700, v427, v425);
    LODWORD(v428) = 0;
    objc_msgSend_setParam_floatValue_(v54, v429, 701, v430, v428);
    if ((int)objc_msgSend_renderingMajorVersion(v10, v431, v432, v433) > 5)
    {
      objc_msgSend_setParam_intValue_(v54, v434, 1200, 0);
      objc_msgSend_setParam_intValue_(v54, v437, 1201, 0);
      objc_msgSend_setParam_intValue_(v54, v438, 1202, 0);
      LODWORD(v439) = 0;
      objc_msgSend_setParam_floatValue_(v54, v440, 1203, v441, v439);
      LODWORD(v442) = 0;
      objc_msgSend_setParam_floatValue_(v54, v443, 1204, v444, v442);
      LODWORD(v445) = 0;
      objc_msgSend_setParam_floatValue_(v54, v446, 1207, v447, v445);
      LODWORD(v448) = 0;
      objc_msgSend_setParam_floatValue_(v54, v449, 1208, v450, v448);
      LODWORD(v451) = 0;
      objc_msgSend_setParam_floatValue_(v54, v452, 1209, v453, v451);
      LODWORD(v454) = 0;
      objc_msgSend_setParam_floatValue_(v54, v455, 1210, v456, v454);
      LODWORD(v457) = 0;
      objc_msgSend_setParam_floatValue_(v54, v458, 1212, v459, v457);
      LODWORD(v460) = 0;
      objc_msgSend_setParam_floatValue_(v54, v461, 1205, v462, v460);
      LODWORD(v463) = 0;
      objc_msgSend_setParam_floatValue_(v54, v464, 1206, v465, v463);
      LODWORD(v466) = 0;
      objc_msgSend_setParam_floatValue_(v54, v467, 1211, v468, v466);
      LODWORD(v469) = 0;
      objc_msgSend_setParam_floatValue_(v54, v470, 1213, v471, v469);
      objc_msgSend_setParam_intValue_(v54, v472, 1214, 0);
    }
    if ((int)objc_msgSend_renderingMajorVersion(v10, v434, v435, v436) >= 7)
    {
      LODWORD(v476) = 0;
      objc_msgSend_setParam_floatValue_(v54, v473, 1314, v475, v476);
      LODWORD(v477) = 0;
      objc_msgSend_setParam_floatValue_(v54, v478, 1315, v479, v477);
    }
    objc_msgSend_hairnetConfig(v10, v473, v474, v475);
    if ((int)objc_msgSend_renderingMajorVersion(v10, v480, v481, v482) >= 7)
    {
      LODWORD(v486) = 0;
      objc_msgSend_setParam_floatValue_(v54, v483, 1300, v485, v486);
      LODWORD(v487) = 0;
      objc_msgSend_setParam_floatValue_(v54, v488, 1301, v489, v487);
      LODWORD(v490) = 0;
      objc_msgSend_setParam_floatValue_(v54, v491, 1302, v492, v490);
      LODWORD(v493) = 0;
      objc_msgSend_setParam_floatValue_(v54, v494, 1303, v495, v493);
      LODWORD(v496) = 0;
      objc_msgSend_setParam_floatValue_(v54, v497, 1304, v498, v496);
      LODWORD(v499) = 0;
      objc_msgSend_setParam_floatValue_(v54, v500, 1305, v501, v499);
      LODWORD(v502) = 0;
      objc_msgSend_setParam_floatValue_(v54, v503, 1306, v504, v502);
      LODWORD(v505) = 0;
      objc_msgSend_setParam_floatValue_(v54, v506, 1307, v507, v505);
      LODWORD(v508) = 0;
      objc_msgSend_setParam_floatValue_(v54, v509, 1308, v510, v508);
      LODWORD(v511) = 0;
      objc_msgSend_setParam_floatValue_(v54, v512, 1309, v513, v511);
      LODWORD(v514) = 0;
      objc_msgSend_setParam_floatValue_(v54, v515, 1310, v516, v514);
      LODWORD(v517) = 0;
      objc_msgSend_setParam_floatValue_(v54, v518, 1311, v519, v517);
      LODWORD(v520) = 0;
      objc_msgSend_setParam_floatValue_(v54, v521, 1312, v522, v520);
      LODWORD(v523) = 0;
      objc_msgSend_setParam_floatValue_(v54, v524, 1313, v525, v523);
      LODWORD(v526) = 0;
      objc_msgSend_setParam_floatValue_(v54, v527, 1316, v528, v526);
      LODWORD(v529) = 0;
      objc_msgSend_setParam_floatValue_(v54, v530, 1317, v531, v529);
    }
    v532 = objc_msgSend_encodedParams(v54, v483, v484, v485);
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v54 = 0;
    v532 = 0;
  }

  return v532;
}

- (float)simulatedAperture
{
  standardParameters = self->_standardParameters;
  if (standardParameters) {
    objc_msgSend_simpleLensModelConfig(standardParameters, a2, v2, v3, 0, 0, 0);
  }
  return 0.0;
}

- (float)minimumSimulatedAperture
{
  standardParameters = self->_standardParameters;
  if (!standardParameters) {
    return 0.0;
  }
  objc_msgSend_simpleLensModelConfig(standardParameters, a2, v2, v3, 0, 0, 0, 0, 0, 0, 0);
  return v6;
}

- (float)maximumSimulatedAperture
{
  standardParameters = self->_standardParameters;
  if (standardParameters) {
    objc_msgSend_simpleLensModelConfig(standardParameters, a2, v2, v3, 0, 0, 0, 0);
  }
  return 0.0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nightModeParameters, 0);

  objc_storeStrong((id *)&self->_standardParameters, 0);
}

@end