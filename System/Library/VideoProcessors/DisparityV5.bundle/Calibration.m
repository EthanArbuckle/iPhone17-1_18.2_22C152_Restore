@interface Calibration
- (BOOL)_computeAdcDistortionModels;
- (BOOL)distortionCorrectionEnabled;
- (BOOL)pixelBufferScalingEnabled;
- (BOOL)temporalCorrectionEnabled;
- (CGRect)referenceFinalCropRect;
- (CalModel)correctedCalibration;
- (CalModel)initialCalibration;
- (Calibration)init;
- (DistortionModel)distModelFor:(SEL)a3;
- (DistortionModel)undistModelFor:(SEL)a3;
- (__n128)auxiliaryPaddingHInv;
- (__n128)rectReferenceToAuxiliary;
- (__n128)rectReferenceToReference;
- (__n128)referenceToRectReference;
- (double)orientationVector;
- (float)_computeCanonicalDisparityScaleFactor;
- (float)midLimitDisparity;
- (float)nearLimitDisparity;
- (float)referenceMagnification;
- (int)_allocateResourcesForMaxNumOfTransposedPoints:(unsigned int)a3;
- (int)_checkADCStatus:(AdaptiveCorrectionStatus *)a3;
- (int)_computeCalibrationWithoutDistortion;
- (int)_computeCenteredRectificationHomographies;
- (int)_computePaddedAuxiliaryRectificationHomography;
- (int)allocateResourcesForMaxNumPoints:(unsigned int)a3;
- (int)applyCurrentTemporalState;
- (int)computeAuxiliaryImageShiftForKeypoints:(Calibration *)self;
- (int)computeCalibration;
- (int)computeInitialCalibration;
- (int)computeStereoRectificationHomographies:(Calibration *)self;
- (int)computeStereoRectificationHomographies:(float)a3 alignedToAngle:;
- (int)extractParametersFromReferenceMetadata:(id)a3 auxiliaryMetadata:(id)a4 options:(id)a5 adaptiveCorrectionConfig:(AdaptiveCorrectionConfig *)a6 useReferenceFrame:(BOOL)a7;
- (void)_releaseResourcesForTransformedPoints;
- (void)dealloc;
- (void)releaseResources;
- (void)setDistortionCorrectionEnabled:(BOOL)a3;
- (void)setKeypointsForReference:(double *)a3 auxiliary:(double *)a4 keypointCount:(unsigned int)a5;
- (void)setOrientationVector:(Calibration *)self;
- (void)setPixelBufferScalingEnabled:(BOOL)a3;
- (void)setReferenceBufferDimensions:(id)a3 auxillaryBufferDimensions:(id)a4 normalizedReferenceFinalCropRect:(CGRect)a5;
- (void)setTemporalCorrectionEnabled:(BOOL)a3;
@end

@implementation Calibration

- (Calibration)init
{
  v3.receiver = self;
  v3.super_class = (Class)Calibration;
  result = [(Calibration *)&v3 init];
  if (result)
  {
    result->_distortionCorrectionEnabled = 1;
    result->_rectificationFocalLengthFactor = 1.0;
    result->_referenceCalibrationScalingFactor = 1.0;
    result->_aspectRatioErrorHardThreshold = 0.0045;
  }
  return result;
}

- (int)allocateResourcesForMaxNumPoints:(unsigned int)a3
{
  uint64_t v9 = *(void *)&a3;
  objc_msgSend_releaseResources(self, a2, *(uint64_t *)&a3, v3, v4, v5, v6, v7, v8);
  if (self->_distortionCorrectionEnabled)
  {
    int ResourcesForMaxNumOfTransposedPoints = sub_262EDD0A0(v9, (void ***)&self->_adc);
    if (ResourcesForMaxNumOfTransposedPoints) {
      goto LABEL_6;
    }
  }
  else
  {
    int ResourcesForMaxNumOfTransposedPoints = objc_msgSend__allocateResourcesForMaxNumOfTransposedPoints_(self, v11, v9, v12, v13, v14, v15, v16, v17);
    if (ResourcesForMaxNumOfTransposedPoints)
    {
LABEL_6:
      fig_log_get_emitter();
      FigDebugAssert3();
    }
  }
  return ResourcesForMaxNumOfTransposedPoints;
}

- (void)releaseResources
{
  if (self->_distortionCorrectionEnabled)
  {
    sub_262EDD5CC((void **)self->_adc);
    self->_adc = 0;
  }
  else
  {
    ((void (*)(Calibration *, char *))MEMORY[0x270F9A6D0])(self, sel__releaseResourcesForTransformedPoints);
  }
}

- (void)dealloc
{
  objc_msgSend_releaseResources(self, a2, v2, v3, v4, v5, v6, v7, v8);
  v10.receiver = self;
  v10.super_class = (Class)Calibration;
  [(Calibration *)&v10 dealloc];
}

- (int)extractParametersFromReferenceMetadata:(id)a3 auxiliaryMetadata:(id)a4 options:(id)a5 adaptiveCorrectionConfig:(AdaptiveCorrectionConfig *)a6 useReferenceFrame:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v456 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a4;
  id v410 = a5;
  v424 = self;
  self->_rectificationFocalLengthFactor = 1.0;
  if (!v13 || !v14)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v401 = FigSignalErrorAt();
    v49 = v410;
    goto LABEL_72;
  }
  v406 = a6;
  id v408 = v13;
  objc_msgSend_objectForKeyedSubscript_(v13, v15, @"PortType", v16, v17, v18, v19, v20, v21);
  v22 = (NSString *)objc_claimAutoreleasedReturnValue();
  v23 = self->_portTypeName[0];
  self->_portTypeName[0] = v22;

  id v407 = v14;
  v24 = v14;
  v25 = self;
  objc_msgSend_objectForKeyedSubscript_(v24, v26, @"PortType", v27, v28, v29, v30, v31, v32);
  v33 = (NSString *)objc_claimAutoreleasedReturnValue();
  v34 = self->_portTypeName[1];
  self->_portTypeName[1] = v33;

  metadata = self->_metadata;
  objc_storeStrong((id *)self->_metadata, a3);
  objc_storeStrong((id *)&self->_metadata[1], a4);
  if (v7)
  {
    uint64_t v43 = 0;
    char v44 = 1;
    do
    {
      char v45 = v44;
      v46 = objc_msgSend_objectForKeyedSubscript_(metadata[v43], v36, @"ReferenceFrameMetadata", v37, v38, v39, v40, v41, v42);

      if (v46)
      {
        uint64_t v47 = objc_msgSend_objectForKeyedSubscript_(metadata[v43], v36, @"ReferenceFrameMetadata", v37, v38, v39, v40, v41, v42);
        v48 = metadata[v43];
        metadata[v43] = (NSDictionary *)v47;
      }
      char v44 = 0;
      uint64_t v43 = 1;
    }
    while ((v45 & 1) != 0);
  }
  v49 = v410;
  if (!v410
    || (objc_msgSend_objectForKeyedSubscript_(v410, v36, *MEMORY[0x263F2F1E8], v37, v38, v39, v40, v41, v42),
        (v425 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v401 = FigSignalErrorAt();
    id v14 = v407;
    goto LABEL_72;
  }
  objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v50, v51, v52, v53, v54, v55, v56, v57);
  v423 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  int v58 = 0;
  uint64_t v59 = 0;
  int v409 = 0;
  uint64_t v422 = *MEMORY[0x263F2F5E0];
  uint64_t v421 = *MEMORY[0x263F2EEF0];
  uint64_t v431 = *MEMORY[0x263F2EEB8];
  uint64_t v419 = *MEMORY[0x263F2EE90];
  pixelBufferDimensions = v424->_pixelBufferDimensions;
  uint64_t v433 = *MEMORY[0x263F2EE88];
  uint64_t v430 = *MEMORY[0x263F2F5C0];
  __asm { FMOV            V0.2D, #0.5 }
  float64x2_t v413 = _Q0;
  uint64_t v429 = *MEMORY[0x263F2F458];
  uint64_t v428 = *MEMORY[0x263F2F5B0];
  uint64_t v427 = *MEMORY[0x263F2F450];
  uint64_t v417 = *MEMORY[0x263F2F568];
  uint64_t v418 = *MEMORY[0x263F2EEA0];
  uint64_t v412 = *MEMORY[0x263F2EE98];
  uint64_t v411 = *MEMORY[0x263F2F560];
  uint64_t v415 = *MEMORY[0x263F2F5F8];
  uint64_t v416 = *MEMORY[0x263F2F600];
  pixelBufferScalingFactor = v424->_pixelBufferScalingFactor;
  uint64_t v414 = *MEMORY[0x263F2F678];
  char v65 = 1;
  do
  {
    char v432 = v65;
    v66 = v424->_portTypeName[v59];
    uint64_t v435 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v67, v68, v69, v70, v71, v72, v73, v74);
    v82 = objc_msgSend_objectForKeyedSubscript_(metadata[v59], v75, v422, v76, v77, v78, v79, v80, v81);
    unsigned int v91 = objc_msgSend_intValue(v82, v83, v84, v85, v86, v87, v88, v89, v90);
    if (v91 <= 1) {
      int v92 = 1;
    }
    else {
      int v92 = v91;
    }

    v93 = NSNumber;
    v101 = objc_msgSend_objectForKeyedSubscript_(v425, v94, (uint64_t)v66, v95, v96, v97, v98, v99, v100);
    v109 = objc_msgSend_objectForKeyedSubscript_(v101, v102, v421, v103, v104, v105, v106, v107, v108);
    objc_msgSend_floatValue(v109, v110, v111, v112, v113, v114, v115, v116, v117);
    float v118 = (float)v92;
    v434 = objc_msgSend_numberWithFloat_(v93, v120, v121, v122, v123, v124, v125, v126, v119 * (float)v92);

    v134 = objc_msgSend_objectForKeyedSubscript_(v425, v127, (uint64_t)v66, v128, v129, v130, v131, v132, v133);
    objc_msgSend_objectForKeyedSubscript_(v134, v135, v431, v136, v137, v138, v139, v140, v141);
    v143 = v142 = v25;

    v151 = objc_msgSend_objectForKeyedSubscript_(v425, v144, (uint64_t)v66, v145, v146, v147, v148, v149, v150);
    v437 = objc_msgSend_objectForKeyedSubscript_(v151, v152, v419, v153, v154, v155, v156, v157, v158);

    v166 = objc_msgSend_objectForKeyedSubscript_(v425, v159, (uint64_t)v66, v160, v161, v162, v163, v164, v165);
    uint64_t v174 = objc_msgSend_objectForKeyedSubscript_(v166, v167, v433, v168, v169, v170, v171, v172, v173);

    v175 = v66;
    v445 = objc_msgSend_objectForKeyedSubscript_(metadata[v59], v176, v430, v177, v178, v179, v180, v181, v182);
    v439 = objc_msgSend_objectForKeyedSubscript_(metadata[v59], v183, v429, v184, v185, v186, v187, v188, v189);
    dict = objc_msgSend_objectForKeyedSubscript_(metadata[v59], v190, v428, v191, v192, v193, v194, v195, v196);
    objc_msgSend_objectForKeyedSubscript_(metadata[v59], v197, v427, v198, v199, v200, v201, v202, v203);
    CFDictionaryRef v438 = (CFDictionaryRef)objc_claimAutoreleasedReturnValue();
    v211 = objc_msgSend_objectForKeyedSubscript_(v425, v204, (uint64_t)v66, v205, v206, v207, v208, v209, v210);
    v447 = objc_msgSend_objectForKeyedSubscript_(v211, v212, v418, v213, v214, v215, v216, v217, v218);

    v441 = objc_msgSend_objectForKeyedSubscript_(metadata[v59], v219, v417, v220, v221, v222, v223, v224, v225);
    v233 = &pixelBufferDimensions[v59];
    $470D365275581EF16070F5A11344F73E v235 = *v233;
    p_height = &v233->height;
    $470D365275581EF16070F5A11344F73E v236 = v235;
    if (v142->_pixelBufferScalingEnabled)
    {
      CGSize v237 = *(CGSize *)(MEMORY[0x263F001A0] + 16);
      rect.origin = (CGPoint)*MEMORY[0x263F001A0];
      rect.float64x2_t size = v237;
      objc_msgSend_objectForKeyedSubscript_(metadata[v59], v226, v414, v228, v229, v230, v231, v232, *(float *)&rect.origin.x);
      CFDictionaryRef v238 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      CGRectMakeWithDictionaryRepresentation(v238, &rect);

      float64x2_t size = (float64x2_t)rect.size;
      if (rect.size.width <= 0.0 || (v236.width = LODWORD(rect.size.height), rect.size.height <= 0.0))
      {
        v440 = (void *)v174;
        fig_log_get_emitter();
        uint64_t v404 = v405;
        LODWORD(v403) = 0;
        FigDebugAssert3();
        int v409 = FigSignalErrorAt();
        char v240 = 0;
        char v241 = v432;
        v243 = v434;
        v242 = (void *)v435;
LABEL_63:
        v245 = v143;
        goto LABEL_64;
      }
    }
    else
    {
      v244.i64[0] = v236.width;
      v244.i64[1] = v236.height;
      float64x2_t size = vcvtq_f64_s64(v244);
    }
    v243 = v434;
    v242 = (void *)v435;
    v245 = v143;
    float64x2_t v436 = size;
    if (!v447)
    {
      v275 = objc_msgSend_objectForKeyedSubscript_(v425, v226, (uint64_t)v175, v228, v229, v230, v231, v232, *(float *)&v236.width);
      uint64_t v283 = objc_msgSend_objectForKeyedSubscript_(v275, v276, v412, v277, v278, v279, v280, v281, v282);

      uint64_t v291 = objc_msgSend_objectForKeyedSubscript_(metadata[v59], v284, v411, v285, v286, v287, v288, v289, v290);

      v447 = (void *)v283;
      if (v283)
      {
        v440 = (void *)v174;
        if (!v291)
        {
          fig_log_get_emitter();
          uint64_t v404 = v405;
          LODWORD(v403) = 0;
          FigDebugAssert3();
          int v409 = FigSignalErrorAt();
          char v240 = 0;
          v441 = 0;
          goto LABEL_62;
        }
        v441 = (void *)v291;
LABEL_28:
        v245 = objc_msgSend_objectForKeyedSubscript_(v447, v267, v431, v268, v269, v270, v271, v272, v273, v403, v404);

        uint64_t v174 = objc_msgSend_objectForKeyedSubscript_(v447, v292, v433, v293, v294, v295, v296, v297, v298);

        objc_msgSend_objectForKeyedSubscript_(v441, v299, v430, v300, v301, v302, v303, v304, v305);
        uint64_t v307 = v306 = v175;

        uint64_t v315 = objc_msgSend_objectForKeyedSubscript_(v441, v308, v429, v309, v310, v311, v312, v313, v314);

        uint64_t v323 = objc_msgSend_objectForKeyedSubscript_(v441, v316, v428, v317, v318, v319, v320, v321, v322);

        uint64_t v331 = objc_msgSend_objectForKeyedSubscript_(v441, v324, v427, v325, v326, v327, v328, v329, v330);

        v445 = (void *)v307;
        v175 = v306;
        CFDictionaryRef v438 = (CFDictionaryRef)v331;
        v439 = (void *)v315;
        v243 = v434;
        v242 = (void *)v435;
        dict = (void *)v323;
      }
      else
      {
        v447 = 0;
        v441 = (void *)v291;
        v245 = v143;
      }
      v25 = v424;
      uint64_t v274 = (uint64_t)v437;
      if (!v243) {
        goto LABEL_32;
      }
      goto LABEL_31;
    }
    v440 = (void *)v174;
    if (!v434)
    {
      fig_log_get_emitter();
      uint64_t v404 = v405;
      LODWORD(v403) = 0;
      FigDebugAssert3();
      int v409 = FigSignalErrorAt();
      char v240 = 0;
LABEL_59:
      char v241 = v432;
LABEL_64:
      v25 = v424;
      goto LABEL_65;
    }
    if (!v441)
    {
      fig_log_get_emitter();
      uint64_t v404 = v405;
      LODWORD(v403) = 0;
      FigDebugAssert3();
      int v409 = FigSignalErrorAt();
      char v240 = 0;
      v441 = 0;
      goto LABEL_59;
    }
    objc_msgSend_floatValue(v434, v226, v227, v228, v229, v230, v231, v232, *(float *)&v236.width);
    float v247 = v246;
    v254 = objc_msgSend_objectForKeyedSubscript_(v447, v248, v433, v249, v250, v251, v252, v253, v246);
    if (!v254)
    {
      fig_log_get_emitter();
      uint64_t v404 = v405;
      LODWORD(v403) = 0;
      FigDebugAssert3();
      int v409 = FigSignalErrorAt();
      char v240 = 0;
LABEL_62:
      char v241 = v432;
      goto LABEL_63;
    }
    v262 = v254;
    float32x2_t v263 = vcvt_f32_f64(vmulq_f64(v436, v413));
    v263.f32[0] = sqrtf(vaddv_f32(vmul_f32(v263, v263))) * v247;
    float v264 = v263.f32[0] / 1000.0;
    objc_msgSend_floatValue(v254, v255, v256, v257, v258, v259, v260, v261, v263.f32[0]);
    BOOL v266 = v264 > v265;

    if ((v266 & ~v58 & 1) == 0) {
      goto LABEL_28;
    }
    uint64_t v274 = (uint64_t)v437;
    v245 = v143;
    v25 = v424;
    uint64_t v174 = (uint64_t)v440;
LABEL_31:
    objc_msgSend_setObject_forKeyedSubscript_(v242, v267, (uint64_t)v243, @"pixelSizeMicrometers", v269, v270, v271, v272, v273, v403);
LABEL_32:
    if (v245) {
      objc_msgSend_setObject_forKeyedSubscript_(v242, v267, (uint64_t)v245, @"gdcCoefficients", v269, v270, v271, v272, v273);
    }
    if (v274) {
      objc_msgSend_setObject_forKeyedSubscript_(v242, v267, v274, @"CameraViewMatrix", v269, v270, v271, v272, v273);
    }
    if (v174) {
      objc_msgSend_setObject_forKeyedSubscript_(v242, v267, v174, @"CalibrationValidRadius", v269, v270, v271, v272, v273);
    }
    objc_msgSend_setObject_forKeyedSubscript_(v423, v267, (uint64_t)v242, (uint64_t)v175, v269, v270, v271, v272, v273, v403);
    v440 = (void *)v174;
    if (!v445)
    {
      fig_log_get_emitter();
      uint64_t v404 = v405;
      LODWORD(v403) = 0;
      FigDebugAssert3();
      int v409 = FigSignalErrorAt();
      char v240 = 0;
      v445 = 0;
LABEL_54:
      char v241 = v432;
LABEL_65:
      CFDictionaryRef v391 = v438;
      v388 = v439;
      goto LABEL_49;
    }
    objc_msgSend_floatValue(v445, v332, v333, v334, v335, v336, v337, v338, v339);
    v424->_focalLength[v59] = v340;
    if (!CGPointMakeWithDictionaryRepresentation((CFDictionaryRef)dict, &v424->_opticalCenter[v59]))
    {
      fig_log_get_emitter();
      uint64_t v404 = v405;
      LODWORD(v403) = 0;
      FigDebugAssert3();
      int v409 = FigSignalErrorAt();
      char v240 = 0;
      goto LABEL_54;
    }
    v348 = objc_msgSend_objectForKeyedSubscript_(metadata[v59], v341, v416, v342, v343, v344, v345, v346, v347);
    objc_msgSend_floatValue(v348, v349, v350, v351, v352, v353, v354, v355, v356);
    p_width = &v424->_rawSensorSize[v59].width;
    double *p_width = v357;

    v366 = objc_msgSend_objectForKeyedSubscript_(metadata[v59], v359, v415, v360, v361, v362, v363, v364, v365);
    objc_msgSend_floatValue(v366, v367, v368, v369, v370, v371, v372, v373, v374);
    p_width[1] = v375;

    float v383 = v436.f64[0];
    float v384 = (float)pixelBufferDimensions[v59].width / v383;
    float v385 = v436.f64[1];
    float v386 = (float)*p_height / v385;
    *(float *)&uint64_t v387 = v384;
    *((float *)&v387 + 1) = v386;
    *(void *)&pixelBufferScalingFactor[8 * v59] = v387;
    char v241 = v432;
    if (v432)
    {
      float v384 = (float)((float)((float)(v384 + v386) * 0.5) + (float)((float)(v384 + v386) * 0.5)) / v118;
      v25->_referenceCalibrationScalingFactor = v384;
      uint64_t v387 = *(void *)&pixelBufferScalingFactor[8 * v59];
    }
    v388 = v439;
    if (*(float *)&v387 > 10.0 || *(float *)&v387 <= 0.1)
    {
      fig_log_get_emitter();
      uint64_t v404 = v405;
      LODWORD(v403) = 0;
      FigDebugAssert3();
      int v409 = FigSignalErrorAt();
      char v240 = 0;
      CFDictionaryRef v391 = v438;
    }
    else
    {
      if (v439) {
        objc_msgSend_floatValue(v439, v376, v377, v378, v379, v380, v381, v382, v384);
      }
      else {
        float v389 = 0.0;
      }
      v424->_ddf[v59] = v389;
      v390 = &v424->_distortionOpticalCenter[v59];
      CFDictionaryRef v391 = v438;
      if (CGPointMakeWithDictionaryRepresentation(v438, v390))
      {
        char v240 = 1;
      }
      else
      {
        fig_log_get_emitter();
        uint64_t v404 = v405;
        LODWORD(v403) = 0;
        FigDebugAssert3();
        int v409 = FigSignalErrorAt();
        char v240 = 0;
      }
    }
LABEL_49:

    if ((v240 & 1) == 0)
    {

      id v14 = v407;
      id v13 = v408;
      goto LABEL_71;
    }
    char v65 = 0;
    int v58 = 1;
    uint64_t v59 = 1;
  }
  while ((v241 & 1) != 0);
  staticParametersByPortType = v25->_staticParametersByPortType;
  v25->_staticParametersByPortType = v423;
  v393 = v423;

  float scaleTuningWithDigitalZoomByFactor = v406->scaleTuningWithDigitalZoomByFactor;
  if (scaleTuningWithDigitalZoomByFactor <= 0.0)
  {
    v396 = v25;
    id v14 = v407;
    id v13 = v408;
    float64x2_t v442 = *(float64x2_t *)&v406->epErrorLimitWidePix_FirstPass;
    *(_OWORD *)dicta = *(_OWORD *)&v406->rangePFL_T;
    float64x2_t v446 = *(float64x2_t *)&v406->rangeOCxT;
    float64x2_t v448 = *(float64x2_t *)&v406->rangeOCyT;
  }
  else
  {
    double v395 = (float)((float)(scaleTuningWithDigitalZoomByFactor * (float)(v25->_referenceCalibrationScalingFactor + -1.0))
                 + 1.0);
    *(float64x2_t *)dicta = vmulq_n_f64(*(float64x2_t *)&v406->rangePFL_T, v395);
    float64x2_t v446 = vmulq_n_f64(*(float64x2_t *)&v406->rangeOCxT, v395);
    float64x2_t v448 = vmulq_n_f64(*(float64x2_t *)&v406->rangeOCyT, v395);
    float64x2_t v442 = vmulq_n_f64(*(float64x2_t *)&v406->epErrorLimitWidePix_FirstPass, v395);
    v396 = v25;
    id v14 = v407;
    id v13 = v408;
  }
  long long v397 = *(_OWORD *)&v406->runAnalyticalPreconditioning;
  long long v452 = *(_OWORD *)&v406->errorVal_LessThanExtremeMacro;
  long long v453 = v397;
  long long v454 = *(_OWORD *)&v406->keypointOutliersPercentile;
  float temporalInitializationFactor = v406->temporalInitializationFactor;
  long long v398 = *(_OWORD *)&v406->minPointsForAdjustment;
  long long v450 = *(_OWORD *)&v406->intermediateMacroDistMM;
  long long v451 = v398;
  memcpy(&rect, &v406->overrideConfigPass1, 0x168uLL);
  *(float64x2_t *)&v424->_adaptiveCorrectionConfig.epErrorLimitWidePix_FirstPass = v442;
  *(_OWORD *)&v424->_adaptiveCorrectionConfig.rangePFL_T = *(_OWORD *)dicta;
  *(float64x2_t *)&v424->_adaptiveCorrectionConfig.rangeOCxT = v446;
  *(float64x2_t *)&v424->_adaptiveCorrectionConfig.rangeOCyT = v448;
  long long v399 = v453;
  *(_OWORD *)&v396->_adaptiveCorrectionConfig.errorVal_LessThanExtremeMacro = v452;
  *(_OWORD *)&v396->_adaptiveCorrectionConfig.runAnalyticalPreconditioning = v399;
  *(_OWORD *)&v396->_adaptiveCorrectionConfig.keypointOutliersPercentile = v454;
  v396->_adaptiveCorrectionConfig.float temporalInitializationFactor = temporalInitializationFactor;
  long long v400 = v451;
  *(_OWORD *)&v396->_adaptiveCorrectionConfig.intermediateMacroDistMM = v450;
  *(_OWORD *)&v396->_adaptiveCorrectionConfig.minPointsForAdjustment = v400;
  v396->_adaptiveCorrectionConfig.float scaleTuningWithDigitalZoomByFactor = scaleTuningWithDigitalZoomByFactor;
  memcpy(&v396->_adaptiveCorrectionConfig.overrideConfigPass1, &rect, 0x168uLL);

LABEL_71:
  v49 = v410;
  int v401 = v409;
LABEL_72:

  return v401;
}

- (int)computeInitialCalibration
{
  uint64_t v182 = *MEMORY[0x263EF8340];
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(self->_staticParametersByPortType, a2, (uint64_t)self->_portTypeName[1], v2, v3, v4, v5, v6, v7);
  objc_msgSend_objectForKeyedSubscript_(v9, v10, @"CameraViewMatrix", v11, v12, v13, v14, v15, v16);
  id v17 = objc_claimAutoreleasedReturnValue();
  v26 = (uint64_t *)objc_msgSend_bytes(v17, v18, v19, v20, v21, v22, v23, v24, v25);

  float v173 = self;
  v34 = objc_msgSend_objectForKeyedSubscript_(self->_staticParametersByPortType, v27, (uint64_t)self->_portTypeName[0], v28, v29, v30, v31, v32, v33);
  objc_msgSend_objectForKeyedSubscript_(v34, v35, @"CameraViewMatrix", v36, v37, v38, v39, v40, v41);
  id v42 = objc_claimAutoreleasedReturnValue();
  uint64_t v51 = (uint64_t *)objc_msgSend_bytes(v42, v43, v44, v45, v46, v47, v48, v49, v50);

  if (!v26 || !v51)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
  portTypeName = self->_portTypeName;
  *(double *)v57.i64 = sub_262EC9F78(v26, v52, v53, v54, v55, v56);
  float32x4_t v166 = v57;
  float32x4_t v168 = v58;
  float32x4_t v164 = v59;
  float32x4_t v170 = v60;
  *(double *)v68.i64 = sub_262EC9F78(v51, *(double *)v57.i64, *(double *)v58.i64, *(double *)v59.i64, *(double *)v60.i64, v61);
  uint64_t v70 = 0;
  long long v174 = 0u;
  long long v175 = 0u;
  int32x4_t v72 = vzip1q_s32(v68, v71);
  long long v176 = 0u;
  long long v177 = 0u;
  v181[0] = vzip1q_s32(v72, v73);
  v181[1] = vzip2q_s32(v72, vdupq_lane_s32(*(int32x2_t *)v73.i8, 1));
  v181[2] = vzip1q_s32(vzip2q_s32(v68, v71), vdupq_laneq_s32(v73, 2));
  float32x4_t time = 0u;
  float32x4_t time_16 = 0u;
  float32x4_t v180 = 0u;
  do
  {
    *(float32x4_t *)((char *)&time + v70 * 16) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v166, COERCE_FLOAT(v181[v70])), v168, *(float32x2_t *)&v181[v70], 1), v164, (float32x4_t)v181[v70], 2);
    ++v70;
  }
  while (v70 != 3);
  uint64_t v74 = 0;
  DWORD2(v174) = time.i32[2];
  DWORD2(v175) = time_16.i32[2];
  float32x4_t v75 = vsubq_f32(v170, vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(time, v69.f32[0]), time_16, *(float32x2_t *)v69.f32, 1), v180, v69, 2));
  *(void *)&long long v174 = time.i64[0];
  *(void *)&long long v175 = time_16.i64[0];
  DWORD2(v176) = v180.i32[2];
  DWORD2(v177) = v75.i32[2];
  *(void *)&long long v176 = v180.i64[0];
  *(void *)&long long v177 = v75.i64[0];
  $470D365275581EF16070F5A11344F73E v76 = self->_pixelBufferDimensions[0];
  *(_OWORD *)self->_initialCalibration.focalLengthPix = 0u;
  p_initialCalibration = &self->_initialCalibration;
  *(_OWORD *)&self->_initialCalibration.canonicalDisparityScale = 0u;
  *(_OWORD *)&self->_initialCalibration.calibrationDimensions[1] = 0u;
  *(_OWORD *)self->_initialCalibration.opticalCenterX = 0u;
  *(_OWORD *)self->_initialCalibration.opticalCenterY = 0u;
  *(_OWORD *)&self->_initialCalibration.extrinRotRefefenceToAuxiliary[2] = 0u;
  *(_OWORD *)&self->_initialCalibration.extrinRotRefefenceToAuxiliary[4] = 0u;
  *(_OWORD *)&self->_initialCalibration.extrinRotRefefenceToAuxiliary[6] = 0u;
  *(_OWORD *)&self->_initialCalibration.extrinRotRefefenceToAuxiliary[8] = 0u;
  *(_OWORD *)&self->_initialCalibration.extrinRotRefefenceToAuxiliary[10] = 0u;
  self->_initialCalibration.pixelSize_um[1] = 0.0;
  *(_OWORD *)self->_initialCalibration.extrinRotRefefenceToAuxiliary = 0u;
  extrinRotRefefenceToAuxiliary = self->_initialCalibration.extrinRotRefefenceToAuxiliary;
  v78.i64[0] = v76.width;
  v78.i64[1] = v76.height;
  pixelBufferDimensions = self->_pixelBufferDimensions;
  *(float64x2_t *)self->_initialCalibration.calibrationDimensions = vcvtq_f64_s64(v78);
  do
  {
    for (uint64_t i = 0; i != 4; ++i)
      extrinRotRefefenceToAuxiliary[i] = *(float *)((unint64_t)(&v174 + i) & 0xFFFFFFFFFFFFFFF3 | (4 * (v74 & 3)));
    ++v74;
    extrinRotRefefenceToAuxiliary += 4;
  }
  while (v74 != 3);
  uint64_t v80 = 0;
  rawSensorSize = self->_rawSensorSize;
  pixelBufferScalingFactor = self->_pixelBufferScalingFactor;
  opticalCenter = self->_opticalCenter;
  opticalCenterX = self->_initialCalibration.opticalCenterX;
  opticalCenterY = self->_initialCalibration.opticalCenterY;
  pixelSize_um = self->_initialCalibration.pixelSize_um;
  focalLength = self->_focalLength;
  metadata = self->_metadata;
  uint64_t v161 = *MEMORY[0x263F2F508];
  uint64_t v160 = *MEMORY[0x263F2EF80];
  __int32 v159 = *(_DWORD *)(MEMORY[0x263F01090] + 12);
  uint64_t v158 = *(void *)(MEMORY[0x263F01090] + 16);
  uint64_t v156 = self->_initialCalibration.opticalCenterY;
  uint64_t v157 = *MEMORY[0x263F2F448];
  for (char j = 1; ; char j = 0)
  {
    char v86 = j;
    p_width = &rawSensorSize[v80].width;
    double v88 = (*p_width + -1.0) * 0.5;
    double v89 = (p_width[1] + -1.0) * 0.5;
    float v90 = (int *)&pixelBufferDimensions[v80];
    p_x = &opticalCenter[v80].x;
    uint64_t v92 = *(void *)&pixelBufferScalingFactor[8 * v80];
    double v93 = p_x[1];
    double v94 = ((double)v90[1] + -1.0) * 0.5;
    opticalCenterX[v80] = ((double)*v90 + -1.0) * 0.5 + (*p_x - v88) * *(float *)&v92;
    double v95 = v94 + (v93 - v89) * *((float *)&v92 + 1);
    opticalCenterY[v80] = v95;
    uint64_t v96 = objc_msgSend_objectForKeyedSubscript_(v173->_staticParametersByPortType, v62, (uint64_t)portTypeName[v80], v63, v64, v65, v66, v67, *(float *)&v95);
    uint64_t v104 = objc_msgSend_objectForKeyedSubscript_(v96, v97, @"pixelSizeMicrometers", v98, v99, v100, v101, v102, v103);
    objc_msgSend_floatValue(v104, v105, v106, v107, v108, v109, v110, v111, v112);
    float v114 = v113;

    double v115 = (float)(v114 / (float)(vaddv_f32(*(float32x2_t *)&pixelBufferScalingFactor[8 * v80]) * 0.5));
    pixelSize_um[v80] = v115;
    double v116 = focalLength[v80] / v115;
    p_initialCalibration->focalLengthPix[v80] = v116;
    uint64_t v123 = objc_msgSend_objectForKeyedSubscript_(metadata[v80], v117, v161, v118, v119, v120, v121, v122, *(float *)&v116);

    if (v123) {
      break;
    }
LABEL_19:
    uint64_t v80 = 1;
    if ((v86 & 1) == 0) {
      return 0;
    }
  }
  uint64_t v125 = opticalCenterX;
  objc_msgSend_objectForKeyedSubscript_(metadata[v80], v62, v160, v63, v64, v65, v66, v67, v124);
  CFDictionaryRef v126 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  CFDictionaryRef v134 = v126;
  *(void *)&v181[0] = *MEMORY[0x263F01090];
  DWORD2(v181[0]) = *(_DWORD *)(MEMORY[0x263F01090] + 8);
  __int32 v135 = v159;
  uint64_t v136 = v158;
  if (v126)
  {
    CMTimeMakeFromDictionary((CMTime *)&time, v126);
    *(void *)&v181[0] = time.i64[0];
    __int32 v135 = time.i32[3];
    DWORD2(v181[0]) = time.i32[2];
    uint64_t v136 = time_16.i64[0];
  }
  if ((v135 & 1) == 0)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v154 = FigSignalErrorAt();
    goto LABEL_24;
  }
  uint64_t v137 = objc_msgSend_objectForKeyedSubscript_(metadata[v80], v127, v157, v128, v129, v130, v131, v132, v133);
  uint64_t v146 = v137;
  if (v137)
  {
    objc_msgSend_floatValue(v137, v138, v139, v140, v141, v142, v143, v144, v145);
    float v148 = v147;
  }
  else
  {
    float v148 = 1.0;
  }
  double v149 = pixelSize_um[v80];
  time.i64[0] = *(void *)&v181[0];
  time.i64[1] = __PAIR64__(v135, DWORD2(v181[0]));
  time_16.i64[0] = v136;
  CMTimeGetSeconds((CMTime *)&time);
  int v150 = FigMotionComputeAverageSpherePosition();
  if (!v150)
  {
    float v151 = v149;
    float v152 = v148 / v151;
    opticalCenterX = v125;
    v125[v80] = v125[v80] + (float)(v152 * 0.0);
    opticalCenterY = v156;
    v156[v80] = v156[v80] + (float)(v152 * 0.0);
    uint64_t v153 = metadata[v80];
    metadata[v80] = 0;

    goto LABEL_19;
  }
  int v154 = v150;
  fig_log_get_emitter();
  FigDebugAssert3();

LABEL_24:
  return v154;
}

- (int)applyCurrentTemporalState
{
  self->_correctedCalibration.pixelSize_um[1] = 0.0;
  *(_OWORD *)&self->_correctedCalibration.calibrationDimensions[1] = 0u;
  *(_OWORD *)&self->_correctedCalibration.canonicalDisparityScale = 0u;
  *(_OWORD *)&self->_correctedCalibration.extrinRotRefefenceToAuxiliary[10] = 0u;
  *(_OWORD *)&self->_correctedCalibration.extrinRotRefefenceToAuxiliary[8] = 0u;
  *(_OWORD *)&self->_correctedCalibration.extrinRotRefefenceToAuxiliary[6] = 0u;
  *(_OWORD *)&self->_correctedCalibration.extrinRotRefefenceToAuxiliary[4] = 0u;
  *(_OWORD *)&self->_correctedCalibration.extrinRotRefefenceToAuxiliary[2] = 0u;
  *(_OWORD *)self->_correctedCalibration.extrinRotRefefenceToAuxiliary = 0u;
  *(_OWORD *)self->_correctedCalibration.opticalCenterY = 0u;
  *(_OWORD *)self->_correctedCalibration.opticalCenterX = 0u;
  *(_OWORD *)self->_correctedCalibration.focalLengthPix = 0u;
  *(_OWORD *)&self->_distModels[0].pixelSizeMM = 0u;
  *(_OWORD *)&self->_distModels[0].opticalCenterX = 0u;
  *(_OWORD *)self->_distModels[0].polyBase = 0u;
  *(_OWORD *)&self->_distModels[0].polyBase[2] = 0u;
  *(_OWORD *)&self->_distModels[0].polyBase[4] = 0u;
  *(_OWORD *)&self->_distModels[0].polyBase[6] = 0u;
  *(_OWORD *)self->_distModels[0].polyDynamic = 0u;
  *(_OWORD *)&self->_distModels[0].polyDynamic[2] = 0u;
  *(_OWORD *)&self->_distModels[0].polyDynamic[4] = 0u;
  *(_OWORD *)&self->_distModels[0].polyDynamic[6] = 0u;
  *(_OWORD *)&self->_distModels[1].polyDynamic[4] = 0u;
  *(_OWORD *)&self->_distModels[1].polyDynamic[6] = 0u;
  *(_OWORD *)self->_distModels[1].polyDynamic = 0u;
  *(_OWORD *)&self->_distModels[1].polyDynamic[2] = 0u;
  *(_OWORD *)&self->_distModels[1].polyBase[4] = 0u;
  *(_OWORD *)&self->_distModels[1].polyBase[6] = 0u;
  *(_OWORD *)self->_distModels[1].polyBase = 0u;
  *(_OWORD *)&self->_distModels[1].polyBase[2] = 0u;
  *(_OWORD *)&self->_distModels[1].pixelSizeMM = 0u;
  *(_OWORD *)&self->_distModels[1].opticalCenterX = 0u;
  *(_OWORD *)&self->_undistModels[0].pixelSizeMM = 0u;
  *(_OWORD *)&self->_undistModels[0].opticalCenterX = 0u;
  *(_OWORD *)self->_undistModels[0].polyBase = 0u;
  *(_OWORD *)&self->_undistModels[0].polyBase[2] = 0u;
  *(_OWORD *)&self->_undistModels[0].polyBase[4] = 0u;
  *(_OWORD *)&self->_undistModels[0].polyBase[6] = 0u;
  *(_OWORD *)self->_undistModels[0].polyDynamic = 0u;
  *(_OWORD *)&self->_undistModels[0].polyDynamic[2] = 0u;
  *(_OWORD *)&self->_undistModels[0].polyDynamic[4] = 0u;
  *(_OWORD *)&self->_undistModels[0].polyDynamic[6] = 0u;
  *(_OWORD *)&self->_undistModels[1].polyDynamic[4] = 0u;
  *(_OWORD *)&self->_undistModels[1].polyDynamic[6] = 0u;
  *(_OWORD *)self->_undistModels[1].polyDynamic = 0u;
  *(_OWORD *)&self->_undistModels[1].polyDynamic[2] = 0u;
  *(_OWORD *)&self->_undistModels[1].polyBase[4] = 0u;
  *(_OWORD *)&self->_undistModels[1].polyBase[6] = 0u;
  *(_OWORD *)self->_undistModels[1].polyBase = 0u;
  *(_OWORD *)&self->_undistModels[1].polyBase[2] = 0u;
  *(_OWORD *)&self->_undistModels[1].pixelSizeMM = 0u;
  *(_OWORD *)&self->_undistModels[1].opticalCenterX = 0u;
  if ((objc_msgSend__computeAdcDistortionModels(self, a2, v2, v3, v4, v5, v6, v7, 0.0) & 1) == 0) {
    goto LABEL_5;
  }
  long long v9 = *(_OWORD *)&self->_initialCalibration.canonicalDisparityScale;
  *(_OWORD *)&self->_correctedCalibration.extrinRotRefefenceToAuxiliary[10] = *(_OWORD *)&self->_initialCalibration.extrinRotRefefenceToAuxiliary[10];
  *(_OWORD *)&self->_correctedCalibration.canonicalDisparityScale = v9;
  *(_OWORD *)&self->_correctedCalibration.calibrationDimensions[1] = *(_OWORD *)&self->_initialCalibration.calibrationDimensions[1];
  self->_correctedCalibration.pixelSize_um[1] = self->_initialCalibration.pixelSize_um[1];
  long long v10 = *(_OWORD *)&self->_initialCalibration.extrinRotRefefenceToAuxiliary[4];
  *(_OWORD *)&self->_correctedCalibration.extrinRotRefefenceToAuxiliary[2] = *(_OWORD *)&self->_initialCalibration.extrinRotRefefenceToAuxiliary[2];
  *(_OWORD *)&self->_correctedCalibration.extrinRotRefefenceToAuxiliary[4] = v10;
  long long v11 = *(_OWORD *)&self->_initialCalibration.extrinRotRefefenceToAuxiliary[8];
  *(_OWORD *)&self->_correctedCalibration.extrinRotRefefenceToAuxiliary[6] = *(_OWORD *)&self->_initialCalibration.extrinRotRefefenceToAuxiliary[6];
  *(_OWORD *)&self->_correctedCalibration.extrinRotRefefenceToAuxiliary[8] = v11;
  long long v12 = *(_OWORD *)self->_initialCalibration.opticalCenterX;
  *(_OWORD *)self->_correctedCalibration.focalLengthPix = *(_OWORD *)self->_initialCalibration.focalLengthPix;
  *(_OWORD *)self->_correctedCalibration.opticalCenterX = v12;
  long long v13 = *(_OWORD *)self->_initialCalibration.extrinRotRefefenceToAuxiliary;
  *(_OWORD *)self->_correctedCalibration.opticalCenterY = *(_OWORD *)self->_initialCalibration.opticalCenterY;
  *(_OWORD *)self->_correctedCalibration.extrinRotRefefenceToAuxiliary = v13;
  if (sub_262EDD640((uint64_t)self->_adc, &self->_adaptiveCorrectionConfig))
  {
LABEL_5:
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
  else if (sub_262EDEDBC((uint64_t)self->_adc, (uint64_t)self->_undistModels, (uint64_t)&self->_undistModels[1], self->_correctedCalibration.focalLengthPix, 1.0))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 3;
  }
  else
  {
    sub_262EDD708((uint64_t)self->_adc, v24);
    sub_262ECA248((__n128 *)self->_undistModels, (__n128 *)self->_distModels);
    LODWORD(v14) = sub_262ECA248((__n128 *)&self->_undistModels[1], (__n128 *)&self->_distModels[1]).n128_u32[0];
    objc_msgSend__computeCanonicalDisparityScaleFactor(self, v15, v16, v17, v18, v19, v20, v21, v14);
    int result = 0;
    self->_correctedCalibration.canonicalDisparityScale = v23;
  }
  return result;
}

- (int)computeCalibration
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  if (self->_distortionCorrectionEnabled)
  {
    self->_correctedCalibration.pixelSize_um[1] = 0.0;
    *(_OWORD *)&self->_correctedCalibration.calibrationDimensions[1] = 0u;
    *(_OWORD *)&self->_correctedCalibration.canonicalDisparityScale = 0u;
    *(_OWORD *)&self->_correctedCalibration.extrinRotRefefenceToAuxiliary[10] = 0u;
    *(_OWORD *)&self->_correctedCalibration.extrinRotRefefenceToAuxiliary[8] = 0u;
    *(_OWORD *)&self->_correctedCalibration.extrinRotRefefenceToAuxiliary[6] = 0u;
    *(_OWORD *)&self->_correctedCalibration.extrinRotRefefenceToAuxiliary[4] = 0u;
    *(_OWORD *)&self->_correctedCalibration.extrinRotRefefenceToAuxiliary[2] = 0u;
    *(_OWORD *)self->_correctedCalibration.extrinRotRefefenceToAuxiliary = 0u;
    *(_OWORD *)self->_correctedCalibration.opticalCenterY = 0u;
    *(_OWORD *)self->_correctedCalibration.opticalCenterX = 0u;
    *(_OWORD *)self->_correctedCalibration.focalLengthPix = 0u;
    *(_OWORD *)&self->_distModels[0].pixelSizeMM = 0u;
    *(_OWORD *)&self->_distModels[0].opticalCenterX = 0u;
    *(_OWORD *)self->_distModels[0].polyBase = 0u;
    *(_OWORD *)&self->_distModels[0].polyBase[2] = 0u;
    *(_OWORD *)&self->_distModels[0].polyBase[4] = 0u;
    *(_OWORD *)&self->_distModels[0].polyBase[6] = 0u;
    *(_OWORD *)self->_distModels[0].polyDynamic = 0u;
    *(_OWORD *)&self->_distModels[0].polyDynamic[2] = 0u;
    *(_OWORD *)&self->_distModels[0].polyDynamic[4] = 0u;
    *(_OWORD *)&self->_distModels[0].polyDynamic[6] = 0u;
    *(_OWORD *)&self->_distModels[1].polyDynamic[4] = 0u;
    *(_OWORD *)&self->_distModels[1].polyDynamic[6] = 0u;
    *(_OWORD *)self->_distModels[1].polyDynamic = 0u;
    *(_OWORD *)&self->_distModels[1].polyDynamic[2] = 0u;
    *(_OWORD *)&self->_distModels[1].polyBase[4] = 0u;
    *(_OWORD *)&self->_distModels[1].polyBase[6] = 0u;
    *(_OWORD *)self->_distModels[1].polyBase = 0u;
    *(_OWORD *)&self->_distModels[1].polyBase[2] = 0u;
    *(_OWORD *)&self->_distModels[1].pixelSizeMM = 0u;
    *(_OWORD *)&self->_distModels[1].opticalCenterX = 0u;
    *(_OWORD *)&self->_undistModels[0].pixelSizeMM = 0u;
    *(_OWORD *)&self->_undistModels[0].opticalCenterX = 0u;
    *(_OWORD *)self->_undistModels[0].polyBase = 0u;
    *(_OWORD *)&self->_undistModels[0].polyBase[2] = 0u;
    *(_OWORD *)&self->_undistModels[0].polyBase[4] = 0u;
    *(_OWORD *)&self->_undistModels[0].polyBase[6] = 0u;
    *(_OWORD *)self->_undistModels[0].polyDynamic = 0u;
    *(_OWORD *)&self->_undistModels[0].polyDynamic[2] = 0u;
    *(_OWORD *)&self->_undistModels[0].polyDynamic[4] = 0u;
    *(_OWORD *)&self->_undistModels[0].polyDynamic[6] = 0u;
    *(_OWORD *)&self->_undistModels[1].polyDynamic[4] = 0u;
    *(_OWORD *)&self->_undistModels[1].polyDynamic[6] = 0u;
    *(_OWORD *)self->_undistModels[1].polyDynamic = 0u;
    *(_OWORD *)&self->_undistModels[1].polyDynamic[2] = 0u;
    *(_OWORD *)&self->_undistModels[1].polyBase[4] = 0u;
    *(_OWORD *)&self->_undistModels[1].polyBase[6] = 0u;
    *(_OWORD *)self->_undistModels[1].polyBase = 0u;
    *(_OWORD *)&self->_undistModels[1].polyBase[2] = 0u;
    *(_OWORD *)&self->_undistModels[1].pixelSizeMM = 0u;
    *(_OWORD *)&self->_undistModels[1].opticalCenterX = 0u;
    if ((objc_msgSend__computeAdcDistortionModels(self, a2, v2, v3, v4, v5, v6, v7, 0.0) & 1) == 0) {
      goto LABEL_17;
    }
    long long v9 = *(_OWORD *)&self->_initialCalibration.canonicalDisparityScale;
    *(_OWORD *)&self->_correctedCalibration.extrinRotRefefenceToAuxiliary[10] = *(_OWORD *)&self->_initialCalibration.extrinRotRefefenceToAuxiliary[10];
    *(_OWORD *)&self->_correctedCalibration.canonicalDisparityScale = v9;
    *(_OWORD *)&self->_correctedCalibration.calibrationDimensions[1] = *(_OWORD *)&self->_initialCalibration.calibrationDimensions[1];
    self->_correctedCalibration.pixelSize_um[1] = self->_initialCalibration.pixelSize_um[1];
    long long v10 = *(_OWORD *)&self->_initialCalibration.extrinRotRefefenceToAuxiliary[4];
    *(_OWORD *)&self->_correctedCalibration.extrinRotRefefenceToAuxiliary[2] = *(_OWORD *)&self->_initialCalibration.extrinRotRefefenceToAuxiliary[2];
    *(_OWORD *)&self->_correctedCalibration.extrinRotRefefenceToAuxiliary[4] = v10;
    long long v11 = *(_OWORD *)&self->_initialCalibration.extrinRotRefefenceToAuxiliary[8];
    *(_OWORD *)&self->_correctedCalibration.extrinRotRefefenceToAuxiliary[6] = *(_OWORD *)&self->_initialCalibration.extrinRotRefefenceToAuxiliary[6];
    *(_OWORD *)&self->_correctedCalibration.extrinRotRefefenceToAuxiliary[8] = v11;
    long long v12 = *(_OWORD *)self->_initialCalibration.opticalCenterX;
    *(_OWORD *)self->_correctedCalibration.focalLengthPix = *(_OWORD *)self->_initialCalibration.focalLengthPix;
    *(_OWORD *)self->_correctedCalibration.opticalCenterX = v12;
    long long v13 = *(_OWORD *)self->_initialCalibration.extrinRotRefefenceToAuxiliary;
    *(_OWORD *)self->_correctedCalibration.opticalCenterY = *(_OWORD *)self->_initialCalibration.opticalCenterY;
    *(_OWORD *)self->_correctedCalibration.extrinRotRefefenceToAuxiliary = v13;
    if (sub_262EDD640((uint64_t)self->_adc, &self->_adaptiveCorrectionConfig))
    {
LABEL_17:
      fig_log_get_emitter();
      FigDebugAssert3();
      return 0;
    }
    else
    {
      unsigned int keypointsCount = self->_keypointsCount;
      if (!keypointsCount)
      {
        bzero(__dst, 0x743uLL);
        int v22 = 0;
        char v23 = 0;
        goto LABEL_14;
      }
      adc = self->_adc;
      uint64_t v16 = self->_adaptiveCorrectionKeypointsDistorted[0];
      uint64_t v17 = self->_adaptiveCorrectionKeypointsDistorted[1];
      undistModels = (long long *)self->_undistModels;
      uint64_t v19 = &self->_undistModels[1];
      p_correctedCalibration = &self->_correctedCalibration;
      if (self->_temporalCorrectionEnabled) {
        int v21 = sub_262EDD764((uint64_t)adc, (uint64_t)v16, (uint64_t)v17, keypointsCount, undistModels, (uint64_t)v19, (uint64_t)p_correctedCalibration);
      }
      else {
        int v21 = sub_262EDF424((uint64_t)adc, (uint64_t)v16, (uint64_t)v17, keypointsCount, (double *)undistModels, &v19->pixelSizeMM, (uint64_t)p_correctedCalibration);
      }
      if (!v21)
      {
        sub_262EDD708((uint64_t)self->_adc, &v42);
        int v22 = v42;
        char v23 = v43;
        memcpy(__dst, v44, sizeof(__dst));
LABEL_14:
        sub_262ECA248((__n128 *)self->_undistModels, (__n128 *)self->_distModels);
        LODWORD(v24) = sub_262ECA248((__n128 *)&self->_undistModels[1], (__n128 *)&self->_distModels[1]).n128_u32[0];
        objc_msgSend__computeCanonicalDisparityScaleFactor(self, v25, v26, v27, v28, v29, v30, v31, v24);
        self->_correctedCalibration.canonicalDisparityScale = v32;
        int v42 = v22;
        char v43 = v23;
        memcpy(v44, __dst, sizeof(v44));
        int v40 = objc_msgSend__checkADCStatus_(self, v33, (uint64_t)&v42, v34, v35, v36, v37, v38, v39);
        if (v40)
        {
          fig_log_get_emitter();
          FigDebugAssert3();
        }
        return v40;
      }
      fig_log_get_emitter();
      FigDebugAssert3();
      return 3;
    }
  }

  return ((uint64_t (*)(Calibration *, char *))MEMORY[0x270F9A6D0])(self, sel__computeCalibrationWithoutDistortion);
}

- (float)referenceMagnification
{
  double v2 = self->_initialCalibration.focalLengthPix[1];
  float result = 0.0;
  if (v2 != 0.0) {
    return self->_initialCalibration.focalLengthPix[0] / v2;
  }
  return result;
}

- (void)setKeypointsForReference:(double *)a3 auxiliary:(double *)a4 keypointCount:(unsigned int)a5
{
  self->_adaptiveCorrectionKeypointsDistorted[0] = a3;
  self->_adaptiveCorrectionKeypointsDistorted[1] = a4;
  self->_unsigned int keypointsCount = a5;
}

- (DistortionModel)distModelFor:(SEL)a3
{
  uint64_t v4 = &self[a4];
  long long v5 = *(_OWORD *)&v4[2].polyBase[6];
  *(_OWORD *)retstr->polyDynamic = *(_OWORD *)&v4[2].polyBase[4];
  *(_OWORD *)&retstr->polyDynamic[2] = v5;
  long long v6 = *(_OWORD *)&v4[2].polyDynamic[2];
  *(_OWORD *)&retstr->polyDynamic[4] = *(_OWORD *)v4[2].polyDynamic;
  *(_OWORD *)&retstr->polyDynamic[6] = v6;
  long long v7 = *(_OWORD *)&v4[2].opticalCenterX;
  *(_OWORD *)retstr->polyBase = *(_OWORD *)&v4[2].pixelSizeMM;
  *(_OWORD *)&retstr->polyBase[2] = v7;
  long long v8 = *(_OWORD *)&v4[2].polyBase[2];
  *(_OWORD *)&retstr->polyBase[4] = *(_OWORD *)v4[2].polyBase;
  *(_OWORD *)&retstr->polyBase[6] = v8;
  long long v9 = *(_OWORD *)&v4[1].polyDynamic[6];
  *(_OWORD *)&retstr->pixelSizeMM = *(_OWORD *)&v4[1].polyDynamic[4];
  *(_OWORD *)&retstr->opticalCenterX = v9;
  return self;
}

- (DistortionModel)undistModelFor:(SEL)a3
{
  uint64_t v4 = &self[a4];
  long long v5 = *(_OWORD *)&v4[4].polyBase[6];
  *(_OWORD *)retstr->polyDynamic = *(_OWORD *)&v4[4].polyBase[4];
  *(_OWORD *)&retstr->polyDynamic[2] = v5;
  long long v6 = *(_OWORD *)&v4[4].polyDynamic[2];
  *(_OWORD *)&retstr->polyDynamic[4] = *(_OWORD *)v4[4].polyDynamic;
  *(_OWORD *)&retstr->polyDynamic[6] = v6;
  long long v7 = *(_OWORD *)&v4[4].opticalCenterX;
  *(_OWORD *)retstr->polyBase = *(_OWORD *)&v4[4].pixelSizeMM;
  *(_OWORD *)&retstr->polyBase[2] = v7;
  long long v8 = *(_OWORD *)&v4[4].polyBase[2];
  *(_OWORD *)&retstr->polyBase[4] = *(_OWORD *)v4[4].polyBase;
  *(_OWORD *)&retstr->polyBase[6] = v8;
  long long v9 = *(_OWORD *)&v4[3].polyDynamic[6];
  *(_OWORD *)&retstr->pixelSizeMM = *(_OWORD *)&v4[3].polyDynamic[4];
  *(_OWORD *)&retstr->opticalCenterX = v9;
  return self;
}

- (BOOL)_computeAdcDistortionModels
{
  long long v7 = self;
  uint64_t v8 = 0;
  id v9 = 0;
  id v10 = 0;
  pixelSize_um = self->_initialCalibration.pixelSize_um;
  distModels = self->_distModels;
  ddf = self->_ddf;
  distortionOpticalCenter = self->_distortionOpticalCenter;
  undistModels = self->_undistModels;
  portTypeName = self->_portTypeName;
  opticalCenterX = self->_initialCalibration.opticalCenterX;
  rawSensorSize = self->_rawSensorSize;
  opticalCenterY = self->_initialCalibration.opticalCenterY;
  pixelBufferScalingFactor = self->_pixelBufferScalingFactor;
  pixelBufferDimensions = self->_pixelBufferDimensions;
  uint64_t v116 = *MEMORY[0x263F2F298];
  polyDynamic = self->_distModels[0].polyDynamic;
  uint64_t v115 = *MEMORY[0x263F2F2A0];
  char v13 = 1;
  __asm
  {
    FMOV            V1.2D, #-1.0
    FMOV            V0.2D, #0.5
  }
  float64x2_t v106 = _Q0;
  float64x2_t v107 = _Q1;
  while (1)
  {
    char v20 = v13;
    v21.f64[0] = distortionOpticalCenter[v8].x;
    uint64_t v121 = v9;
    if (v21.f64[0] == 0.0
      || distortionOpticalCenter[v8].y == 0.0
      || (v22.f64[0] = rawSensorSize[v8].width, v22.f64[0] <= 0.0)
      || rawSensorSize[v8].height <= 0.0)
    {
      double v25 = opticalCenterY[v8];
      uint64_t v26 = &distModels[v8];
      v26->opticalCenterX = opticalCenterX[v8];
      v26->opticalCenterY = v25;
    }
    else
    {
      v22.f64[1] = rawSensorSize[v8].height;
      $470D365275581EF16070F5A11344F73E v23 = pixelBufferDimensions[v8];
      v24.i64[0] = v23.width;
      v24.i64[1] = v23.height;
      v21.f64[1] = distortionOpticalCenter[v8].y;
      *(float64x2_t *)&distModels[v8].opticalCenterX = vmlaq_f64(vmulq_f64(vaddq_f64(vcvtq_f64_s64(v24), v107), v106), vcvtq_f64_f32(*(float32x2_t *)&pixelBufferScalingFactor[8 * v8]), vsubq_f64(v21, vmulq_f64(vaddq_f64(v22, v107), v106)));
    }
    double v27 = pixelSize_um[v8] / 1000.0;
    uint64_t v28 = &distModels[v8];
    double v29 = ddf[v8] / v27;
    v28->pixelSizeMM = v27;
    v28->focalLengthPix = v29;
    long long v30 = *(_OWORD *)&v28->polyDynamic[2];
    p_pixelSizeMM = (_OWORD *)&undistModels[v8].pixelSizeMM;
    p_pixelSizeMM[6] = *(_OWORD *)v28->polyDynamic;
    p_pixelSizeMM[7] = v30;
    long long v32 = *(_OWORD *)&v28->polyDynamic[6];
    p_pixelSizeMM[8] = *(_OWORD *)&v28->polyDynamic[4];
    p_pixelSizeMM[9] = v32;
    long long v33 = *(_OWORD *)&v28->polyBase[2];
    p_pixelSizeMM[2] = *(_OWORD *)v28->polyBase;
    p_pixelSizeMM[3] = v33;
    long long v34 = *(_OWORD *)&v28->polyBase[6];
    p_pixelSizeMM[4] = *(_OWORD *)&v28->polyBase[4];
    p_pixelSizeMM[5] = v34;
    long long v35 = *(_OWORD *)&v28->opticalCenterX;
    _OWORD *p_pixelSizeMM = *(_OWORD *)&v28->pixelSizeMM;
    p_pixelSizeMM[1] = v35;
    uint64_t v36 = objc_msgSend_objectForKeyedSubscript_(v7->_staticParametersByPortType, a2, (uint64_t)portTypeName[v8], v2, v3, v4, v5, v6, *(float *)&v35);
    uint64_t v44 = objc_msgSend_objectForKeyedSubscript_(v36, v37, @"gdcCoefficients", v38, v39, v40, v41, v42, v43);
    double v52 = objc_msgSend_objectForKeyedSubscript_(v44, v45, v116, v46, v47, v48, v49, v50, v51);

    if (!v52) {
      break;
    }
    id v10 = v52;
    uint64_t v61 = objc_msgSend_bytes(v10, v53, v54, v55, v56, v57, v58, v59, v60);
    if (!v61) {
      break;
    }
    uint64_t v69 = v61;
    float v113 = v52;
    char v70 = v20;
    int32x4_t v71 = v7;
    staticParametersByPortType = v7->_staticParametersByPortType;
    int32x4_t v73 = portTypeName;
    uint64_t v74 = objc_msgSend_objectForKeyedSubscript_(staticParametersByPortType, v62, (uint64_t)portTypeName[v8], v63, v64, v65, v66, v67, v68);
    v82 = objc_msgSend_objectForKeyedSubscript_(v74, v75, @"gdcCoefficients", v76, v77, v78, v79, v80, v81);
    float v90 = objc_msgSend_objectForKeyedSubscript_(v82, v83, v115, v84, v85, v86, v87, v88, v89);

    if (!v90)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      goto LABEL_23;
    }
    id v9 = v90;
    uint64_t v99 = objc_msgSend_bytes(v9, v91, v92, v93, v94, v95, v96, v97, v98);
    if (!v99) {
      goto LABEL_22;
    }
    uint64_t v100 = 0;
    uint64_t v101 = &polyDynamic[20 * v8];
    char v102 = 1;
    do
    {
      v101[32] = *(float *)(v69 + v100);
      float v103 = *(float *)(v99 + v100);
      v101[40] = v103;
      v102 &= v103 == 0.0;
      *(v101 - 8) = *(float *)(v69 + 32 + v100);
      *v101++ = *(float *)(v99 + 32 + v100);
      v100 += 4;
    }
    while (v100 != 32);
    portTypeName = v73;
    if ((v102 & 1) == 0 && ddf[v8] <= 0.0)
    {
LABEL_22:
      fig_log_get_emitter();
      FigDebugAssert3();

LABEL_23:
      BOOL v104 = 0;
LABEL_18:
      double v52 = v113;
      goto LABEL_19;
    }
    char v13 = 0;
    uint64_t v8 = 1;
    long long v7 = v71;
    if ((v70 & 1) == 0)
    {

      BOOL v104 = 1;
      goto LABEL_18;
    }
  }
  fig_log_get_emitter();
  FigDebugAssert3();

  BOOL v104 = 0;
LABEL_19:

  return v104;
}

- (void)setReferenceBufferDimensions:(id)a3 auxillaryBufferDimensions:(id)a4 normalizedReferenceFinalCropRect:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  int var0 = a3.var0;
  int var1 = a3.var1;
  self->_pixelBufferDimensions[0] = ($470D365275581EF16070F5A11344F73E)a3;
  self->_pixelBufferDimensions[1] = ($470D365275581EF16070F5A11344F73E)a4;
  BOOL IsNull = CGRectIsNull(a5);
  double v13 = 1.0;
  double v14 = 0.0;
  if (IsNull) {
    double v15 = 0.0;
  }
  else {
    double v15 = x;
  }
  if (IsNull)
  {
    double v16 = 1.0;
  }
  else
  {
    double v14 = y;
    double v16 = width;
  }
  if (!IsNull) {
    double v13 = height;
  }
  self->_referenceFinalCropRect.origin.double x = v15 * (double)var0;
  self->_referenceFinalCropRect.origin.double y = v14 * (double)var1;
  self->_referenceFinalCropRect.size.double width = v16 * (double)var0;
  self->_referenceFinalCropRect.size.double height = v13 * (double)var1;
}

- (int)_checkADCStatus:(AdaptiveCorrectionStatus *)a3
{
  if (!a3->var1 || !a3->var4) {
    goto LABEL_14;
  }
  if (a3->var9)
  {
    if (!a3->var13) {
      goto LABEL_14;
    }
    if (a3->var19)
    {
      if (a3->var25)
      {
        if (a3->var28) {
          return 0;
        }
        goto LABEL_15;
      }
LABEL_14:
      fig_log_get_emitter();
      FigDebugAssert3();
      return 1;
    }
  }
LABEL_15:
  fig_log_get_emitter();
  FigDebugAssert3();
  return 2;
}

- (int)_allocateResourcesForMaxNumOfTransposedPoints:(unsigned int)a3
{
  size_t v4 = 16 * a3;
  uint64_t v5 = (double *)malloc_type_malloc(v4, 0x100004000313F17uLL);
  self->_transposedKeypoints.xyPointsTeleTransposed = v5;
  if (v5)
  {
    uint64_t v6 = (double *)malloc_type_malloc(v4, 0x100004000313F17uLL);
    self->_transposedKeypoints.xyPointsWideTransposed = v6;
    if (v6) {
      return 0;
    }
  }
  fig_log_get_emitter();
  FigDebugAssert3();
  return -12786;
}

- (void)_releaseResourcesForTransformedPoints
{
  xyPointsTeleTransposed = self->_transposedKeypoints.xyPointsTeleTransposed;
  if (xyPointsTeleTransposed)
  {
    self->_transposedKeypoints.xyPointsTeleTransposed = 0;
    free(xyPointsTeleTransposed);
  }
  xyPointsWideTransposed = self->_transposedKeypoints.xyPointsWideTransposed;
  if (xyPointsWideTransposed)
  {
    self->_transposedKeypoints.xyPointsWideTransposed = 0;
    free(xyPointsWideTransposed);
  }
}

- (int)_computeCalibrationWithoutDistortion
{
  long long v3 = *(_OWORD *)&self->_initialCalibration.canonicalDisparityScale;
  *(_OWORD *)&self->_correctedCalibration.extrinRotRefefenceToAuxiliary[10] = *(_OWORD *)&self->_initialCalibration.extrinRotRefefenceToAuxiliary[10];
  *(_OWORD *)&self->_correctedCalibration.canonicalDisparityScale = v3;
  *(_OWORD *)&self->_correctedCalibration.calibrationDimensions[1] = *(_OWORD *)&self->_initialCalibration.calibrationDimensions[1];
  long long v4 = *(_OWORD *)&self->_initialCalibration.extrinRotRefefenceToAuxiliary[4];
  *(_OWORD *)&self->_correctedCalibration.extrinRotRefefenceToAuxiliary[2] = *(_OWORD *)&self->_initialCalibration.extrinRotRefefenceToAuxiliary[2];
  *(_OWORD *)&self->_correctedCalibration.extrinRotRefefenceToAuxiliary[4] = v4;
  long long v5 = *(_OWORD *)&self->_initialCalibration.extrinRotRefefenceToAuxiliary[8];
  *(_OWORD *)&self->_correctedCalibration.extrinRotRefefenceToAuxiliary[6] = *(_OWORD *)&self->_initialCalibration.extrinRotRefefenceToAuxiliary[6];
  *(_OWORD *)&self->_correctedCalibration.extrinRotRefefenceToAuxiliary[8] = v5;
  long long v6 = *(_OWORD *)self->_initialCalibration.opticalCenterX;
  *(_OWORD *)self->_correctedCalibration.focalLengthPidouble x = *(_OWORD *)self->_initialCalibration.focalLengthPix;
  *(_OWORD *)self->_correctedCalibration.opticalCenterX = v6;
  long long v7 = *(_OWORD *)self->_initialCalibration.extrinRotRefefenceToAuxiliary;
  *(_OWORD *)self->_correctedCalibration.opticalCenterY = *(_OWORD *)self->_initialCalibration.opticalCenterY;
  memset(v42, 0, 512);
  uint64_t v41 = 0;
  __n128 v39 = 0u;
  memset(v40, 0, sizeof(v40));
  int8x16_t v37 = 0u;
  int8x16_t v38 = 0u;
  int8x16_t v36 = 0u;
  float32x2_t v34 = 0;
  float32x2_t v35 = 0;
  float32x2_t v32 = 0;
  float32x2_t v33 = 0;
  self->_correctedCalibration.pixelSize_um[1] = self->_initialCalibration.pixelSize_um[1];
  *(_OWORD *)self->_correctedCalibration.extrinRotRefefenceToAuxiliardouble y = v7;
  if (self->_keypointsCount)
  {
    float64x2_t v8 = *(float64x2_t *)self->_correctedCalibration.extrinRotRefefenceToAuxiliary;
    *(float32x2_t *)&v8.f64[0] = vcvt_f32_f64(v8);
    float64x2_t v9 = *(float64x2_t *)&self->_correctedCalibration.extrinRotRefefenceToAuxiliary[4];
    *(float32x2_t *)&v9.f64[0] = vcvt_f32_f64(v9);
    float64x2_t v10 = *(float64x2_t *)&self->_correctedCalibration.extrinRotRefefenceToAuxiliary[8];
    *(float32x2_t *)&v10.f64[0] = vcvt_f32_f64(v10);
    int32x4_t v11 = vzip1q_s32((int32x4_t)v8, (int32x4_t)v10);
    int32x4_t v12 = vzip2q_s32((int32x4_t)vcvt_hight_f32_f64(*(int32x2_t *)&self->_correctedCalibration.extrinRotRefefenceToAuxiliary[2], *(float64x2_t *)&self->_correctedCalibration.extrinRotRefefenceToAuxiliary[2]), (int32x4_t)vcvt_hight_f32_f64(*(int32x2_t *)&self->_correctedCalibration.extrinRotRefefenceToAuxiliary[10], *(float64x2_t *)&self->_correctedCalibration.extrinRotRefefenceToAuxiliary[10]));
    int32x4_t v13 = vzip2q_s32((int32x4_t)vcvt_hight_f32_f64(*(int32x2_t *)&self->_correctedCalibration.extrinRotRefefenceToAuxiliary[6], *(float64x2_t *)&self->_correctedCalibration.extrinRotRefefenceToAuxiliary[6]), (int32x4_t)0);
    v44.columns[0] = (simd_float3)vzip1q_s32(v11, (int32x4_t)v9);
    v44.columns[2] = (simd_float3)vzip1q_s32(v12, v13);
    v44.columns[1] = (simd_float3)vzip2q_s32(v11, vdupq_lane_s32(*(int32x2_t *)&v9.f64[0], 1));
    int8x16_t v26 = (int8x16_t)v44.columns[1];
    int8x16_t v27 = (int8x16_t)v44.columns[0];
    __n128 v28 = (__n128)vzip2q_s32(v12, v13);
    int8x16_t v29 = (int8x16_t)v44.columns[2];
    if (AdaptiveCorrection_computeVerticalBaselineTransform((uint64_t)&v36, &v34, (int32x2_t *)&v32, v44, (float32x4_t)v28)|| AdaptiveCorrection_rotateCalModel((long long *)&self->_correctedCalibration, (uint64_t)v40, v36, v37, v38, v39, v34, v35, v32, v33)|| AdaptiveCorrection_transformPointsWithMatrix((uint64_t)self->_adaptiveCorrectionKeypointsDistorted[0], self->_keypointsCount,
                         (float64x2_t *)self->_transposedKeypoints.xyPointsTeleTransposed,
                         v34,
                         v35)
      || AdaptiveCorrection_transformPointsWithMatrix((uint64_t)self->_adaptiveCorrectionKeypointsDistorted[1], self->_keypointsCount, (float64x2_t *)self->_transposedKeypoints.xyPointsWideTransposed, v32, v33))
    {
      fig_log_get_emitter();
      goto LABEL_15;
    }
    uint64_t v31 = 0;
    memset(v30, 0, sizeof(v30));
    AdaptiveCorrection_fullCorrection(self->_transposedKeypoints.xyPointsTeleTransposed, self->_transposedKeypoints.xyPointsWideTransposed, self->_keypointsCount, v40, (uint64_t)&self->_adaptiveCorrectionConfig, (uint64_t)v42, (uint64_t)v30);
    v45.columns[0] = (simd_float2)v34;
    v45.columns[1] = (simd_float2)v35;
    simd_float2x2 v14 = __invert_f2(v45);
    v46.columns[0] = (simd_float2)v32;
    v46.columns[1] = (simd_float2)v33;
    simd_float2x2 v15 = __invert_f2(v46);
    if (AdaptiveCorrection_rotateCalModel(v30, (uint64_t)&self->_correctedCalibration, v27, v26, v29, v28, (float32x2_t)v14.columns[0], (float32x2_t)v14.columns[1], (float32x2_t)v15.columns[0], (float32x2_t)v15.columns[1]))
    {
      fig_log_get_emitter();
LABEL_15:
      FigDebugAssert3();
      return 3;
    }
  }
  else
  {
    bzero(v42, 0x748uLL);
  }
  objc_msgSend__computeCanonicalDisparityScaleFactor(self, v16, v17, v18, v19, v20, v21, v22, v23);
  self->_correctedCalibration.canonicalDisparityScale = v24;
  if (BYTE4(v42[0]))
  {
    if (v43)
    {
      return 0;
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      return 2;
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 1;
  }
}

- (int)computeStereoRectificationHomographies:(Calibration *)self
{
  return objc_msgSend_computeStereoRectificationHomographies_alignedToAngle_(self, a2, v2, v3, v4, v5, v6, v7, v8, 0.0);
}

- (int)computeStereoRectificationHomographies:(float)a3 alignedToAngle:
{
  *(void *)self->_limitDistances_mm = *(void *)&a3;
  self->_rectificationAngleStep = (float)(v3 / 180.0) * 3.1416;
  *(_OWORD *)self->_anon_6b0 = 0u;
  *(_OWORD *)&self->_anon_6b0[16] = 0u;
  *(_OWORD *)&self->_anon_6b0[32] = 0u;
  *(_OWORD *)self->_anon_6e0 = 0u;
  *(_OWORD *)&self->_anon_6e0[16] = 0u;
  *(_OWORD *)&self->_anon_6e0[32] = 0u;
  *(_OWORD *)self->_anon_710 = 0u;
  anon_6b0 = self->_anon_6b0;
  *(_OWORD *)&self->_anon_710[16] = 0u;
  *(_OWORD *)&self->_anon_710[32] = 0u;
  int v6 = sub_262EE1BC8((uint64_t)&self->_correctedCalibration, (float32x4_t *)self->_anon_6b0, (float32x4_t *)self->_anon_6e0, (float32x4_t *)self->_anon_710, 0, 0);
  if (v6
    || (int v6 = objc_msgSend__computeCenteredRectificationHomographies(self, v7, v8, v9, v10, v11, v12, v13, v14)) != 0)
  {
    int v60 = v6;
    fig_log_get_emitter();
LABEL_21:
    FigDebugAssert3();
    return v60;
  }
  float32x2_t v25 = *(float32x2_t *)self->_orientationVector;
  if (sqrtf(vaddv_f32(vmul_f32(v25, v25))) <= 0.0
    || (v22.i64[0] = *(void *)&self->_initialCalibration.extrinRotRefefenceToAuxiliary[3],
        *(float *)v22.i32 = *(double *)v22.i64,
        *(float *)v22.i32 = -*(float *)v22.i32,
        float v26 = self->_initialCalibration.extrinRotRefefenceToAuxiliary[7],
        *(float *)v23.i32 = -v26,
        sqrtf(vaddv_f32(vmul_f32((float32x2_t)__PAIR64__(v23.u32[0], v22.u32[0]), (float32x2_t)__PAIR64__(v23.u32[0], v22.u32[0])))) <= 0.0))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return -12780;
  }
  v24.i32[0] = 1.0;
  v27.i64[0] = 0x8000000080000000;
  v27.i64[1] = 0x8000000080000000;
  float v28 = *(float *)vbslq_s8(v27, (int8x16_t)v24, v22).i32;
  LODWORD(v29) = vbslq_s8(v27, (int8x16_t)v24, v23).u32[0];
  v24.i64[0] = 0;
  int32x2_t v30 = 0;
  if (v28 <= 0.0) {
    *(float *)v30.i32 = (float)self->_pixelBufferDimensions[0].width + -1.0;
  }
  if (v29 <= 0.0) {
    *(float *)v24.i32 = (float)self->_pixelBufferDimensions[0].height + -1.0;
  }
  uint64_t v31 = 0;
  __asm { FMOV            V3.4S, #1.0 }
  int32x4_t v36 = vzip2q_s32(vdupq_lane_s32(v30, 0), (int32x4_t)_Q3);
  float32x4_t v37 = (float32x4_t)LODWORD(v28);
  v38.i32[0] = 0;
  v38.i64[1] = 0;
  v38.f32[1] = v29;
  _Q3.i64[0] = __PAIR64__(v24.u32[0], v30.u32[0]);
  *(int8x8_t *)self->_orientationVector = vbsl_s8((int8x8_t)vcltz_f32(v25), (int8x8_t)vneg_f32(v25), (int8x8_t)v25);
  float32x4_t v40 = *(float32x4_t *)&self->_anon_710[16];
  int32x4_t v41 = *(int32x4_t *)&self->_anon_710[32];
  int32x4_t v42 = vzip1q_s32(v36, v24);
  float32x4_t v62 = *(float32x4_t *)self->_anon_710;
  float32x4_t v63 = v40;
  int32x4_t v64 = v41;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  do
  {
    *(long long *)((char *)&v65 + v31 * 4) = (__int128)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v37, COERCE_FLOAT(*(_OWORD *)((char *)&v62 + v31 * 4))), v38, *(float32x2_t *)&v62.f32[v31], 1), _Q3, *(float32x4_t *)((char *)&v62 + v31 * 4), 2);
    v31 += 4;
  }
  while (v31 != 12);
  uint64_t v43 = 0;
  v37.i32[3] = 0;
  v38.i32[3] = 0;
  v42.i32[3] = 0;
  uint64_t v44 = v65;
  long long v45 = v66;
  long long v46 = v67;
  *((_DWORD *)anon_6b0 + 26) = DWORD2(v65);
  *((_DWORD *)anon_6b0 + 30) = DWORD2(v45);
  *((void *)anon_6b0 + 12) = v44;
  *((void *)anon_6b0 + 14) = v45;
  *((_DWORD *)anon_6b0 + 34) = DWORD2(v46);
  *((void *)anon_6b0 + 16) = v46;
  float32x4_t v47 = *(float32x4_t *)self->_anon_6b0;
  float32x4_t v48 = *(float32x4_t *)&self->_anon_6b0[16];
  float32x4_t v49 = *(float32x4_t *)&self->_anon_6b0[32];
  float32x4_t v62 = v37;
  float32x4_t v63 = v38;
  int32x4_t v64 = v42;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  do
  {
    *(long long *)((char *)&v65 + v43 * 4) = (__int128)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v47, COERCE_FLOAT(*(_OWORD *)((char *)&v62 + v43 * 4))), v48, *(float32x2_t *)&v62.f32[v43], 1), v49, *(float32x4_t *)((char *)&v62 + v43 * 4), 2);
    v43 += 4;
  }
  while (v43 != 12);
  uint64_t v50 = 0;
  uint64_t v51 = v65;
  long long v52 = v66;
  long long v53 = v67;
  *((_DWORD *)anon_6b0 + 2) = DWORD2(v65);
  *((_DWORD *)anon_6b0 + 6) = DWORD2(v52);
  *(void *)anon_6b0 = v51;
  *((void *)anon_6b0 + 2) = v52;
  *((_DWORD *)anon_6b0 + 10) = DWORD2(v53);
  *((void *)anon_6b0 + 4) = v53;
  float32x4_t v54 = *(float32x4_t *)self->_anon_6e0;
  float32x4_t v55 = *(float32x4_t *)&self->_anon_6e0[16];
  float32x4_t v56 = *(float32x4_t *)&self->_anon_6e0[32];
  float32x4_t v62 = v37;
  float32x4_t v63 = v38;
  int32x4_t v64 = v42;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  do
  {
    *(long long *)((char *)&v65 + v50 * 4) = (__int128)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v54, COERCE_FLOAT(*(_OWORD *)((char *)&v62 + v50 * 4))), v55, *(float32x2_t *)&v62.f32[v50], 1), v56, *(float32x4_t *)((char *)&v62 + v50 * 4), 2);
    v50 += 4;
  }
  while (v50 != 12);
  uint64_t v57 = v65;
  long long v58 = v66;
  long long v59 = v67;
  *((_DWORD *)anon_6b0 + 14) = DWORD2(v65);
  *((_DWORD *)anon_6b0 + 18) = DWORD2(v58);
  *((void *)anon_6b0 + 6) = v57;
  *((void *)anon_6b0 + 8) = v58;
  *((_DWORD *)anon_6b0 + 22) = DWORD2(v59);
  *((void *)anon_6b0 + 10) = v59;
  int v60 = objc_msgSend__computePaddedAuxiliaryRectificationHomography(self, v15, v16, v17, v18, v19, v20, v21, *(float *)&v57);
  if (v60)
  {
    fig_log_get_emitter();
    goto LABEL_21;
  }
  return v60;
}

- (int)_computePaddedAuxiliaryRectificationHomography
{
  uint64_t v2 = 0;
  float v3 = self->_correctedCalibration.focalLengthPix[0];
  v4.f64[0] = self->_correctedCalibration.extrinRotRefefenceToAuxiliary[3];
  v4.f64[1] = self->_correctedCalibration.extrinRotRefefenceToAuxiliary[7];
  *(float32x2_t *)&v4.f64[0] = vcvt_f32_f64(v4);
  float v5 = self->_correctedCalibration.extrinRotRefefenceToAuxiliary[11];
  *(float *)&v4.f64[1] = v5;
  float32x4_t v6 = vmulq_f32((float32x4_t)v4, (float32x4_t)v4);
  float v7 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v6, 2), vaddq_f32(v6, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v6.f32, 1))).f32[0])* v3;
  uint64_t v8 = *(void *)self->_limitDistances_mm;
  float v9 = v7 / *(float *)&v8;
  uint64_t v10 = *(void *)self->_orientationVector;
  float v11 = -*(float *)&v10;
  if (*(float *)&v10 >= 0.0) {
    LODWORD(v11) = *(void *)self->_orientationVector;
  }
  float v12 = (float)((float)self->_pixelBufferDimensions[0].width + (float)(v11 * v9))
      / (float)self->_pixelBufferDimensions[0].width;
  LODWORD(v10) = HIDWORD(*(void *)self->_orientationVector);
  if (*((float *)&v10 + 1) < 0.0) {
    *(float *)&uint64_t v10 = -*((float *)&v10 + 1);
  }
  *(float *)&unsigned int v13 = 1.0 / v12;
  LODWORD(v14) = 0;
  *((float *)&v14 + 1) = 1.0
                       / (float)((float)((float)self->_pixelBufferDimensions[0].height + (float)(*(float *)&v10 * v9))
                               / (float)self->_pixelBufferDimensions[0].height);
  *(_DWORD *)&self->_anon_680[8] = 0;
  *(void *)self->_anon_680 = v13;
  *(_DWORD *)&self->_anon_680[24] = 0;
  *(void *)&self->_anon_680[16] = v14;
  *(_DWORD *)&self->_anon_680[40] = 1065353216;
  *(void *)&self->_anon_680[32] = 0;
  float32x4_t v15 = *(float32x4_t *)self->_anon_6e0;
  float32x4_t v16 = *(float32x4_t *)&self->_anon_6e0[16];
  float32x4_t v17 = *(float32x4_t *)&self->_anon_6e0[32];
  v22[2] = xmmword_262EEDE20;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  do
  {
    *(long long *)((char *)&v23 + v2 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v15, COERCE_FLOAT(v22[v2])), v16, *(float32x2_t *)&v22[v2], 1), v17, (float32x4_t)v22[v2], 2);
    ++v2;
  }
  while (v2 != 3);
  uint64_t v18 = v23;
  long long v19 = v24;
  *(_DWORD *)&self->_anon_6e0[8] = DWORD2(v23);
  *(void *)self->_anon_6e0 = v18;
  long long v20 = v25;
  *(_DWORD *)&self->_anon_6e0[24] = DWORD2(v19);
  *(_DWORD *)&self->_anon_6e0[40] = DWORD2(v20);
  *(void *)&self->_anon_6e0[16] = v19;
  *(void *)&self->_anon_6e0[32] = v20;
  self->_nearLimitDisparitdouble y = v9;
  self->_midLimitDisparitdouble y = v7 / *((float *)&v8 + 1);
  return 0;
}

- (int)_computeCenteredRectificationHomographies
{
  v154[16] = *MEMORY[0x263EF8340];
  anon_6b0 = self->_anon_6b0;
  long long v4 = *(_OWORD *)&self->_undistModels[0].polyDynamic[2];
  long long v140 = *(_OWORD *)self->_undistModels[0].polyDynamic;
  long long v141 = v4;
  long long v5 = *(_OWORD *)&self->_undistModels[0].polyDynamic[6];
  long long v142 = *(_OWORD *)&self->_undistModels[0].polyDynamic[4];
  long long v143 = v5;
  long long v6 = *(_OWORD *)&self->_undistModels[0].polyBase[2];
  long long v136 = *(_OWORD *)self->_undistModels[0].polyBase;
  long long v137 = v6;
  long long v7 = *(_OWORD *)&self->_undistModels[0].polyBase[6];
  long long v138 = *(_OWORD *)&self->_undistModels[0].polyBase[4];
  long long v139 = v7;
  long long v8 = *(_OWORD *)&self->_undistModels[0].opticalCenterX;
  long long v134 = *(_OWORD *)&self->_undistModels[0].pixelSizeMM;
  long long v135 = v8;
  double x = self->_referenceFinalCropRect.origin.x;
  *(CGFloat *)&long long v8 = self->_referenceFinalCropRect.origin.y;
  double v10 = x + self->_referenceFinalCropRect.size.width;
  double v11 = *(double *)&v8 + self->_referenceFinalCropRect.size.height;
  *(double *)int v154 = x;
  v154[1] = v8;
  *(double *)&v154[2] = v10;
  v154[3] = v8;
  *(double *)&v154[4] = x;
  *(double *)&v154[5] = v11;
  *(double *)&v154[6] = v10;
  *(double *)&v154[7] = v11;
  v154[8] = v135;
  v154[9] = v8;
  v154[10] = v135;
  *(double *)&v154[11] = v11;
  *(double *)&v154[12] = x;
  v154[13] = *((void *)&v135 + 1);
  *(double *)&v154[14] = v10;
  v154[15] = *((void *)&v135 + 1);
  memset(v153, 0, sizeof(v153));
  sub_262EE1930((uint64_t)v154, 8, (double *)&v134, (uint64_t)v153);
  uint64_t v20 = 0;
  memset(v152, 0, sizeof(v152));
  do
  {
    float64x2_t v21 = (float64x2_t)v153[v20];
    *(float32x2_t *)&v21.f64[0] = vcvt_f32_f64(v21);
    LODWORD(v21.f64[1]) = 1.0;
    v152[v20++] = v21;
  }
  while (v20 != 8);
  uint64_t v22 = 0;
  float32x4_t v150 = 0u;
  float32x4_t v151 = 0u;
  float32x4_t v23 = *(float32x4_t *)anon_6b0;
  float32x4_t v24 = *((float32x4_t *)anon_6b0 + 1);
  float32x4_t v25 = *((float32x4_t *)anon_6b0 + 2);
  v26.i64[0] = 0x3F0000003F000000;
  v26.i64[1] = 0x3F0000003F000000;
  while (1)
  {
    float32x4_t v27 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v23, COERCE_FLOAT(v152[v22])), v24, *(float32x2_t *)&v152[v22], 1), v25, (float32x4_t)v152[v22], 2);
    if (v27.f32[2] <= 0.0) {
      break;
    }
    float32x4_t v28 = (float32x4_t)vdupq_laneq_s32((int32x4_t)v27, 2);
    *(&v150 + (v22 & 1)) = vmlaq_f32(*(&v150 + (v22 & 1)), v26, vdivq_f32(v27, v28));
    if (++v22 == 4)
    {
      float32x4_t v131 = v25;
      float32x4_t v132 = v24;
      float32x4_t v133 = v23;
      float32x4_t v29 = vsubq_f32(v151, v150);
      float32x2_t v30 = (float32x2_t)COERCE_UNSIGNED_INT(vaddv_f32((float32x2_t)*(_OWORD *)&vmulq_f32(v29, v29)));
      float32x2_t v31 = vrsqrte_f32(v30);
      float32x2_t v32 = vmul_f32(v31, vrsqrts_f32((float32x2_t)v30.u32[0], vmul_f32(v31, v31)));
      *(float32x2_t *)v29.f32 = vmul_n_f32(*(float32x2_t *)v29.f32, vmul_f32(v32, vrsqrts_f32((float32x2_t)v30.u32[0], vmul_f32(v32, v32))).f32[0]);
      __asm { FMOV            V1.2S, #-1.0 }
      *(float32x2_t *)v29.f32 = vmaxnm_f32(*(float32x2_t *)v29.f32, _D1);
      __asm { FMOV            V1.2S, #1.0 }
      *(float32x2_t *)v24.f32 = vminnm_f32(*(float32x2_t *)v29.f32, _D1);
      *(void *)self->_orientationVector = v24.i64[0];
      float rectificationAngleStep = self->_rectificationAngleStep;
      if (rectificationAngleStep != 0.0)
      {
        float32x4_t v130 = v24;
        *(float *)v40.i32 = rectificationAngleStep * roundf(acosf(v24.f32[0]) / rectificationAngleStep);
        int8x16_t v41 = (int8x16_t)v130;
        v41.i32[0] = v130.i32[1];
        v42.i64[0] = 0x8000000080000000;
        v42.i64[1] = 0x8000000080000000;
        __float2 v43 = __sincosf_stret(*(float *)vbslq_s8(v42, v40, v41).i32);
        v24.i64[0] = __PAIR64__(LODWORD(v43.__sinval), LODWORD(v43.__cosval));
        *(void *)self->_orientationVector = __PAIR64__(LODWORD(v43.__sinval), LODWORD(v43.__cosval));
      }
      uint64_t v44 = 0;
      *(int32x2_t *)v28.f32 = vrev64_s32(*(int32x2_t *)v24.f32);
      v50.i64[0] = 0;
      v50.i32[3] = 0;
      *(float *)&v50.i32[2] = -v24.f32[1];
      float32x4_t v45 = (float32x4_t)v24.u64[0];
      v24.i32[1] = 0;
      int32x4_t v46 = vzip1q_s32((int32x4_t)v24, (int32x4_t)v28);
      float32x4_t v47 = (float32x4_t)vzip2q_s32(v50, vdupq_lane_s32(*(int32x2_t *)v28.f32, 1));
      *(float *)v19.i32 = self->_correctedCalibration.focalLengthPix[0];
      v48.f64[0] = self->_correctedCalibration.opticalCenterX[0];
      v48.f64[1] = self->_correctedCalibration.opticalCenterY[0];
      float32x2_t v49 = vcvt_f32_f64(v48);
      v50.i64[1] = 0;
      *(float *)v50.i32 = 1.0 / *(float *)v19.i32;
      v51.i32[0] = 0;
      v51.i64[1] = 0;
      v51.f32[1] = 1.0 / *(float *)v19.i32;
      *(float32x2_t *)v52.f32 = vdiv_f32(vneg_f32(v49), (float32x2_t)vdup_lane_s32(v19, 0));
      v52.i64[1] = COERCE_UNSIGNED_INT(1.0);
      float32x4_t v53 = (float32x4_t)v19.u32[0];
      int32x4_t v144 = (int32x4_t)COERCE_UNSIGNED_INT(1.0 / *(float *)v19.i32);
      float32x4_t v145 = (float32x4_t)v51.u64[0];
      float32x4_t v146 = v52;
      float32x4_t v147 = 0u;
      float32x4_t v148 = 0u;
      float32x4_t v149 = 0u;
      do
      {
        *(float32x4_t *)((char *)&v147 + v44) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v45, COERCE_FLOAT(*(_OWORD *)((char *)&v144 + v44))), v47, *(float32x2_t *)&v144.i8[v44], 1), (float32x4_t)xmmword_262EEDE20, *(float32x4_t *)((char *)&v144 + v44), 2);
        v44 += 16;
      }
      while (v44 != 48);
      uint64_t v54 = 0;
      __asm { FMOV            V6.4S, #1.0 }
      v56.i64[1] = _Q6.i64[1];
      *(float32x2_t *)v56.f32 = v49;
      v57.i32[0] = 0;
      v57.i64[1] = 0;
      v57.i32[1] = v19.i32[0];
      int32x4_t v144 = (int32x4_t)v147;
      float32x4_t v145 = v148;
      float32x4_t v146 = v149;
      float32x4_t v147 = 0u;
      float32x4_t v148 = 0u;
      float32x4_t v149 = 0u;
      do
      {
        *(float32x4_t *)((char *)&v147 + v54) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v19.u32[0], COERCE_FLOAT(*(_OWORD *)((char *)&v144 + v54))), v57, *(float32x2_t *)&v144.i8[v54], 1), v56, *(float32x4_t *)((char *)&v144 + v54), 2);
        v54 += 16;
      }
      while (v54 != 48);
      uint64_t v58 = 0;
      float32x4_t v59 = v147;
      float32x4_t v60 = v148;
      float32x4_t v61 = v149;
      int32x4_t v62 = vdupq_lane_s32(*(int32x2_t *)v47.f32, 1);
      float32x4_t v63 = (float32x4_t)vzip1q_s32(v46, (int32x4_t)v47);
      v63.i32[2] = 0;
      float32x4_t v64 = (float32x4_t)vzip2q_s32(vzip1q_s32(v46, (int32x4_t)0), v62);
      float32x4_t v65 = (float32x4_t)vdupq_laneq_s32(v46, 2);
      v65.i32[1] = 0;
      v65.i32[2] = 1.0;
      int32x4_t v144 = v50;
      float32x4_t v145 = v51;
      float32x4_t v146 = v52;
      float32x4_t v147 = 0u;
      float32x4_t v148 = 0u;
      float32x4_t v149 = 0u;
      do
      {
        *(float32x4_t *)((char *)&v147 + v58) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v63, COERCE_FLOAT(*(_OWORD *)((char *)&v144 + v58))), v64, *(float32x2_t *)&v144.i8[v58], 1), v65, *(float32x4_t *)((char *)&v144 + v58), 2);
        v58 += 16;
      }
      while (v58 != 48);
      uint64_t v66 = 0;
      int32x4_t v144 = (int32x4_t)v147;
      float32x4_t v145 = v148;
      float32x4_t v146 = v149;
      float32x4_t v147 = 0u;
      float32x4_t v148 = 0u;
      float32x4_t v149 = 0u;
      do
      {
        *(float32x4_t *)((char *)&v147 + v66) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v19.u32[0], COERCE_FLOAT(*(_OWORD *)((char *)&v144 + v66))), v57, *(float32x2_t *)&v144.i8[v66], 1), v56, *(float32x4_t *)((char *)&v144 + v66), 2);
        v66 += 16;
      }
      while (v66 != 48);
      uint64_t v67 = 0;
      float32x4_t v68 = v147;
      float32x4_t v69 = v148;
      float32x4_t v70 = v149;
      float32x4_t v71 = *((float32x4_t *)anon_6b0 + 7);
      float32x4_t v72 = *((float32x4_t *)anon_6b0 + 8);
      int32x4_t v144 = *((int32x4_t *)anon_6b0 + 6);
      float32x4_t v145 = v71;
      float32x4_t v146 = v72;
      float32x4_t v147 = 0u;
      float32x4_t v148 = 0u;
      float32x4_t v149 = 0u;
      do
      {
        *(float32x4_t *)((char *)&v147 + v67) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v59, COERCE_FLOAT(*(_OWORD *)((char *)&v144 + v67))), v60, *(float32x2_t *)&v144.i8[v67], 1), v61, *(float32x4_t *)((char *)&v144 + v67), 2);
        v67 += 16;
      }
      while (v67 != 48);
      uint64_t v73 = 0;
      v68.i32[3] = 0;
      v69.i32[3] = 0;
      v70.i32[3] = 0;
      uint64_t v74 = v147.i64[0];
      float32x4_t v75 = v148;
      float32x4_t v76 = v149;
      *((_DWORD *)anon_6b0 + 26) = v147.i32[2];
      *((void *)anon_6b0 + 12) = v74;
      *((_DWORD *)anon_6b0 + 30) = v75.i32[2];
      *((void *)anon_6b0 + 14) = v75.i64[0];
      *((_DWORD *)anon_6b0 + 34) = v76.i32[2];
      *((void *)anon_6b0 + 16) = v76.i64[0];
      int32x4_t v144 = (int32x4_t)v68;
      float32x4_t v145 = v69;
      float32x4_t v146 = v70;
      float32x4_t v147 = 0u;
      float32x4_t v148 = 0u;
      float32x4_t v149 = 0u;
      v77.i32[1] = v131.i32[1];
      do
      {
        *(float32x4_t *)((char *)&v147 + v73) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v133, COERCE_FLOAT(*(_OWORD *)((char *)&v144 + v73))), v132, *(float32x2_t *)&v144.i8[v73], 1), v131, *(float32x4_t *)((char *)&v144 + v73), 2);
        v73 += 16;
      }
      while (v73 != 48);
      uint64_t v78 = 0;
      uint64_t v79 = v147.i64[0];
      float32x4_t v80 = v148;
      float32x4_t v81 = v149;
      *((_DWORD *)anon_6b0 + 2) = v147.i32[2];
      *((_DWORD *)anon_6b0 + 6) = v80.i32[2];
      *(void *)anon_6b0 = v79;
      *((void *)anon_6b0 + 2) = v80.i64[0];
      *((_DWORD *)anon_6b0 + 10) = v81.i32[2];
      *((void *)anon_6b0 + 4) = v81.i64[0];
      float32x4_t v82 = *((float32x4_t *)anon_6b0 + 3);
      float32x4_t v83 = *((float32x4_t *)anon_6b0 + 4);
      float32x4_t v84 = *((float32x4_t *)anon_6b0 + 5);
      int32x4_t v144 = (int32x4_t)v68;
      float32x4_t v145 = v69;
      float32x4_t v146 = v70;
      float32x4_t v147 = 0u;
      float32x4_t v148 = 0u;
      float32x4_t v149 = 0u;
      do
      {
        *(float32x4_t *)((char *)&v147 + v78) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v82, COERCE_FLOAT(*(_OWORD *)((char *)&v144 + v78))), v83, *(float32x2_t *)&v144.i8[v78], 1), v84, *(float32x4_t *)((char *)&v144 + v78), 2);
        v78 += 16;
      }
      while (v78 != 48);
      uint64_t v85 = 0;
      uint64_t v86 = v147.i64[0];
      float32x4_t v87 = v148;
      *((_DWORD *)anon_6b0 + 14) = v147.i32[2];
      float32x4_t v88 = v149;
      *((void *)anon_6b0 + 6) = v86;
      *((_DWORD *)anon_6b0 + 18) = v87.i32[2];
      *((void *)anon_6b0 + 8) = v87.i64[0];
      *((_DWORD *)anon_6b0 + 22) = v88.i32[2];
      *((void *)anon_6b0 + 10) = v88.i64[0];
      float32x4_t v89 = *((float32x4_t *)anon_6b0 + 6);
      float32x4_t v90 = *((float32x4_t *)anon_6b0 + 7);
      float32x2_t v91 = (float32x2_t)vdup_n_s32(0x7F7FFFFFu);
      float32x2_t v92 = (float32x2_t)0x80000000800000;
      float32x4_t v93 = *((float32x4_t *)anon_6b0 + 8);
      while (1)
      {
        int32x4_t v94 = (int32x4_t)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v89, COERCE_FLOAT(v152[v85])), v90, *(float32x2_t *)&v152[v85], 1), v93, (float32x4_t)v152[v85], 2);
        if (*(float *)&v94.i32[2] <= 0.0) {
          break;
        }
        float32x2_t v95 = vdiv_f32(*(float32x2_t *)v94.i8, (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v94, 2));
        float32x2_t v91 = vminnm_f32(v91, v95);
        float32x2_t v92 = vmaxnm_f32(v92, v95);
        if (++v85 == 8)
        {
          uint64_t v96 = 0;
          float32x2_t v97 = vcvt_f32_s32((int32x2_t)self->_pixelBufferDimensions[0]);
          float32x2_t v98 = vdiv_f32(v97, vsub_f32(v92, v91));
          if (v98.f32[0] >= v98.f32[1]) {
            v98.f32[0] = v98.f32[1];
          }
          *(float *)v77.i32 = v98.f32[0] * *(float *)v19.i32;
          v99.i64[1] = _Q6.i64[1];
          *(float32x2_t *)v99.f32 = vmla_n_f32(vmul_f32(v97, (float32x2_t)0x3F0000003F000000), vsub_f32(v49, vmul_f32(vadd_f32(v91, v92), (float32x2_t)0x3F0000003F000000)), v98.f32[0]);
          v100.i32[0] = 0;
          v100.i64[1] = 0;
          v100.i32[1] = v77.i32[0];
          v101.i64[1] = 0;
          *(float32x2_t *)_Q6.f32 = vdiv_f32(vneg_f32(*(float32x2_t *)v99.f32), (float32x2_t)vdup_lane_s32(v77, 0));
          LODWORD(self->_rectificationFocalLengthFactor) = v98.i32[0];
          int32x4_t v144 = v50;
          float32x4_t v145 = v51;
          float32x4_t v146 = v52;
          float32x4_t v147 = 0u;
          float32x4_t v148 = 0u;
          float32x4_t v149 = 0u;
          do
          {
            *(float32x4_t *)((char *)&v147 + v96) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v77.u32[0], COERCE_FLOAT(*(_OWORD *)((char *)&v144 + v96))), v100, *(float32x2_t *)&v144.i8[v96], 1), v99, *(float32x4_t *)((char *)&v144 + v96), 2);
            v96 += 16;
          }
          while (v96 != 48);
          uint64_t v102 = 0;
          LODWORD(v103) = 0;
          *((float *)&v103 + 1) = 1.0 / *(float *)v77.i32;
          _Q6.i32[3] = 0;
          float32x4_t v104 = v147;
          float32x4_t v105 = v148;
          float32x4_t v106 = v149;
          v101.i64[0] = COERCE_UNSIGNED_INT(1.0 / *(float *)v77.i32);
          int32x4_t v144 = v101;
          float32x4_t v145 = (float32x4_t)v103;
          float32x4_t v146 = _Q6;
          float32x4_t v147 = 0u;
          float32x4_t v148 = 0u;
          float32x4_t v149 = 0u;
          do
          {
            *(float32x4_t *)((char *)&v147 + v102) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v53, COERCE_FLOAT(*(_OWORD *)((char *)&v144 + v102))), v57, *(float32x2_t *)&v144.i8[v102], 1), v56, *(float32x4_t *)((char *)&v144 + v102), 2);
            v102 += 16;
          }
          while (v102 != 48);
          uint64_t v107 = 0;
          float32x4_t v108 = v147;
          float32x4_t v109 = v148;
          float32x4_t v110 = v149;
          int32x4_t v144 = (int32x4_t)v89;
          float32x4_t v145 = v90;
          float32x4_t v146 = v93;
          float32x4_t v147 = 0u;
          float32x4_t v148 = 0u;
          float32x4_t v149 = 0u;
          do
          {
            *(float32x4_t *)((char *)&v147 + v107) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v104, COERCE_FLOAT(*(_OWORD *)((char *)&v144 + v107))), v105, *(float32x2_t *)&v144.i8[v107], 1), v106, *(float32x4_t *)((char *)&v144 + v107), 2);
            v107 += 16;
          }
          while (v107 != 48);
          uint64_t v111 = 0;
          v108.i32[3] = 0;
          v109.i32[3] = 0;
          v110.i32[3] = 0;
          uint64_t v112 = v147.i64[0];
          float32x4_t v113 = v148;
          float32x4_t v114 = v149;
          *((_DWORD *)anon_6b0 + 26) = v147.i32[2];
          *((_DWORD *)anon_6b0 + 30) = v113.i32[2];
          *((void *)anon_6b0 + 12) = v112;
          *((void *)anon_6b0 + 14) = v113.i64[0];
          *((_DWORD *)anon_6b0 + 34) = v114.i32[2];
          *((void *)anon_6b0 + 16) = v114.i64[0];
          float32x4_t v115 = *(float32x4_t *)anon_6b0;
          float32x4_t v116 = *((float32x4_t *)anon_6b0 + 1);
          float32x4_t v117 = *((float32x4_t *)anon_6b0 + 2);
          int32x4_t v144 = (int32x4_t)v108;
          float32x4_t v145 = v109;
          float32x4_t v146 = v110;
          float32x4_t v147 = 0u;
          float32x4_t v148 = 0u;
          float32x4_t v149 = 0u;
          do
          {
            *(float32x4_t *)((char *)&v147 + v111) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v115, COERCE_FLOAT(*(_OWORD *)((char *)&v144 + v111))), v116, *(float32x2_t *)&v144.i8[v111], 1), v117, *(float32x4_t *)((char *)&v144 + v111), 2);
            v111 += 16;
          }
          while (v111 != 48);
          uint64_t v118 = 0;
          uint64_t v119 = v147.i64[0];
          float32x4_t v120 = v148;
          float32x4_t v121 = v149;
          *((_DWORD *)anon_6b0 + 2) = v147.i32[2];
          *((_DWORD *)anon_6b0 + 6) = v120.i32[2];
          *(void *)anon_6b0 = v119;
          *((void *)anon_6b0 + 2) = v120.i64[0];
          *((_DWORD *)anon_6b0 + 10) = v121.i32[2];
          *((void *)anon_6b0 + 4) = v121.i64[0];
          float32x4_t v122 = *((float32x4_t *)anon_6b0 + 3);
          float32x4_t v123 = *((float32x4_t *)anon_6b0 + 4);
          float32x4_t v124 = *((float32x4_t *)anon_6b0 + 5);
          int32x4_t v144 = (int32x4_t)v108;
          float32x4_t v145 = v109;
          float32x4_t v146 = v110;
          float32x4_t v147 = 0u;
          float32x4_t v148 = 0u;
          float32x4_t v149 = 0u;
          do
          {
            *(float32x4_t *)((char *)&v147 + v118) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v122, COERCE_FLOAT(*(_OWORD *)((char *)&v144 + v118))), v123, *(float32x2_t *)&v144.i8[v118], 1), v124, *(float32x4_t *)((char *)&v144 + v118), 2);
            v118 += 16;
          }
          while (v118 != 48);
          uint64_t v125 = v147.i64[0];
          float32x4_t v126 = v148;
          float32x4_t v127 = v149;
          *((_DWORD *)anon_6b0 + 14) = v147.i32[2];
          *((_DWORD *)anon_6b0 + 18) = v126.i32[2];
          *((void *)anon_6b0 + 6) = v125;
          *((void *)anon_6b0 + 8) = v126.i64[0];
          *((_DWORD *)anon_6b0 + 22) = v127.i32[2];
          *((void *)anon_6b0 + 10) = v127.i64[0];
          objc_msgSend__computeCanonicalDisparityScaleFactor(self, v12, v13, v14, v15, v16, v17, v18, *(float *)&v125);
          int result = 0;
          self->_correctedCalibration.canonicalDisparityScale = v129;
          return result;
        }
      }
      break;
    }
  }
  fig_log_get_emitter();
  FigDebugAssert3();
  return -12780;
}

- (float)_computeCanonicalDisparityScaleFactor
{
  float v2 = self->_correctedCalibration.focalLengthPix[0];
  float v3 = self->_rectificationFocalLengthFactor * v2;
  v4.f64[0] = self->_correctedCalibration.extrinRotRefefenceToAuxiliary[3];
  v4.f64[1] = self->_correctedCalibration.extrinRotRefefenceToAuxiliary[7];
  *(float32x2_t *)&v4.f64[0] = vcvt_f32_f64(v4);
  float v5 = self->_correctedCalibration.extrinRotRefefenceToAuxiliary[11];
  *(float *)&v4.f64[1] = v5;
  float32x4_t v6 = vmulq_f32((float32x4_t)v4, (float32x4_t)v4);
  return 1.0
       / (float)(v3
               * (float)(sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v6, 2), vaddq_f32(v6, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v6.f32, 1))).f32[0])/ 1000.0));
}

- (int)computeAuxiliaryImageShiftForKeypoints:(Calibration *)self
{
  float v3 = v2;
  float32x4_t v23 = 0u;
  float32x4_t v24 = 0u;
  float32x4_t v22 = 0u;
  float32x4_t v20 = 0u;
  float32x4_t v21 = 0u;
  float32x4_t v18 = 0u;
  float32x4_t v19 = 0u;
  float32x4_t v16 = 0u;
  float32x4_t v17 = 0u;
  int v5 = sub_262EE259C((uint64_t)&self->_initialCalibration, 0, (uint64_t)&v22, (uint64_t)&v19, 0, (uint64_t)&v16, 0);
  if (v5)
  {
    int v8 = v5;
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  else
  {
    float32x4_t v6 = vaddq_f32(v18, vmlaq_n_f32(vmulq_n_f32(v16, (float)((float)self->_pixelBufferDimensions[0].width + -1.0) * 0.5), v17, (float)((float)self->_pixelBufferDimensions[0].height + -1.0) * 0.5));
    float32x4_t v7 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v19, v6.f32[0]), v20, *(float32x2_t *)v6.f32, 1), v21, v6, 2);
    if (v7.f32[2] <= 0.1)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      return -12780;
    }
    else
    {
      int v8 = 0;
      float32x4_t v9 = vdivq_f32(v7, (float32x4_t)vdupq_laneq_s32((int32x4_t)v7, 2));
      __asm { FMOV            V1.2S, #-1.0 }
      *float v3 = vadd_f32((float32x2_t)*(_OWORD *)&vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v22, v9.f32[0]), v23, *(float32x2_t *)v9.f32, 1), v24, v9, 2), vmul_f32(vadd_f32(vcvt_f32_s32((int32x2_t)self->_pixelBufferDimensions[1]), _D1), (float32x2_t)0xBF000000BF000000));
    }
  }
  return v8;
}

- (CGRect)referenceFinalCropRect
{
  double x = self->_referenceFinalCropRect.origin.x;
  double y = self->_referenceFinalCropRect.origin.y;
  double width = self->_referenceFinalCropRect.size.width;
  double height = self->_referenceFinalCropRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CalModel)initialCalibration
{
  long long v3 = *(_OWORD *)&self->calibrationDimensions[1];
  *(_OWORD *)&retstr->extrinRotRefefenceToAuxiliary[10] = *(_OWORD *)&self->canonicalDisparityScale;
  *(_OWORD *)&retstr->canonicalDisparityScale = v3;
  *(_OWORD *)&retstr->calibrationDimensions[1] = *(_OWORD *)&self->pixelSize_um[1];
  retstr->pixelSize_um[1] = self[1].focalLengthPix[1];
  long long v4 = *(_OWORD *)&self->extrinRotRefefenceToAuxiliary[6];
  *(_OWORD *)&retstr->extrinRotRefefenceToAuxiliary[2] = *(_OWORD *)&self->extrinRotRefefenceToAuxiliary[4];
  *(_OWORD *)&retstr->extrinRotRefefenceToAuxiliary[4] = v4;
  long long v5 = *(_OWORD *)&self->extrinRotRefefenceToAuxiliary[10];
  *(_OWORD *)&retstr->extrinRotRefefenceToAuxiliary[6] = *(_OWORD *)&self->extrinRotRefefenceToAuxiliary[8];
  *(_OWORD *)&retstr->extrinRotRefefenceToAuxiliary[8] = v5;
  long long v6 = *(_OWORD *)self->opticalCenterY;
  *(_OWORD *)retstr->focalLengthPidouble x = *(_OWORD *)self->opticalCenterX;
  *(_OWORD *)retstr->opticalCenterX = v6;
  long long v7 = *(_OWORD *)&self->extrinRotRefefenceToAuxiliary[2];
  *(_OWORD *)retstr->opticalCenterY = *(_OWORD *)self->extrinRotRefefenceToAuxiliary;
  *(_OWORD *)retstr->extrinRotRefefenceToAuxiliardouble y = v7;
  return self;
}

- (CalModel)correctedCalibration
{
  long long v3 = *(_OWORD *)&self[10].calibrationDimensions[1];
  *(_OWORD *)&retstr->extrinRotRefefenceToAuxiliary[10] = *(_OWORD *)&self[10].canonicalDisparityScale;
  *(_OWORD *)&retstr->canonicalDisparityScale = v3;
  *(_OWORD *)&retstr->calibrationDimensions[1] = *(_OWORD *)&self[10].pixelSize_um[1];
  retstr->pixelSize_um[1] = self[11].focalLengthPix[1];
  long long v4 = *(_OWORD *)&self[10].extrinRotRefefenceToAuxiliary[6];
  *(_OWORD *)&retstr->extrinRotRefefenceToAuxiliary[2] = *(_OWORD *)&self[10].extrinRotRefefenceToAuxiliary[4];
  *(_OWORD *)&retstr->extrinRotRefefenceToAuxiliary[4] = v4;
  long long v5 = *(_OWORD *)&self[10].extrinRotRefefenceToAuxiliary[10];
  *(_OWORD *)&retstr->extrinRotRefefenceToAuxiliary[6] = *(_OWORD *)&self[10].extrinRotRefefenceToAuxiliary[8];
  *(_OWORD *)&retstr->extrinRotRefefenceToAuxiliary[8] = v5;
  long long v6 = *(_OWORD *)self[10].opticalCenterY;
  *(_OWORD *)retstr->focalLengthPidouble x = *(_OWORD *)self[10].opticalCenterX;
  *(_OWORD *)retstr->opticalCenterX = v6;
  long long v7 = *(_OWORD *)&self[10].extrinRotRefefenceToAuxiliary[2];
  *(_OWORD *)retstr->opticalCenterY = *(_OWORD *)self[10].extrinRotRefefenceToAuxiliary;
  *(_OWORD *)retstr->extrinRotRefefenceToAuxiliardouble y = v7;
  return self;
}

- (double)orientationVector
{
  return *(double *)(a1 + 928);
}

- (void)setOrientationVector:(Calibration *)self
{
  *(void *)self->_orientationVector = v2;
}

- (BOOL)distortionCorrectionEnabled
{
  return self->_distortionCorrectionEnabled;
}

- (void)setDistortionCorrectionEnabled:(BOOL)a3
{
  self->_distortionCorrectionEnabled = a3;
}

- (BOOL)temporalCorrectionEnabled
{
  return self->_temporalCorrectionEnabled;
}

- (void)setTemporalCorrectionEnabled:(BOOL)a3
{
  self->_temporalCorrectionEnabled = a3;
}

- (BOOL)pixelBufferScalingEnabled
{
  return self->_pixelBufferScalingEnabled;
}

- (void)setPixelBufferScalingEnabled:(BOOL)a3
{
  self->_pixelBufferScalingEnabled = a3;
}

- (float)nearLimitDisparity
{
  return self->_nearLimitDisparity;
}

- (float)midLimitDisparity
{
  return self->_midLimitDisparity;
}

- (__n128)auxiliaryPaddingHInv
{
  return a1[104];
}

- (__n128)rectReferenceToReference
{
  return a1[107];
}

- (__n128)rectReferenceToAuxiliary
{
  return a1[110];
}

- (__n128)referenceToRectReference
{
  return a1[113];
}

- (void).cxx_destruct
{
  uint64_t v3 = 0;
  long long v4 = &self->_portTypeName[1];
  do
    objc_storeStrong((id *)&v4[v3--], 0);
  while (v3 != -2);
  objc_storeStrong((id *)&self->_staticParametersByPortType, 0);
  uint64_t v5 = 0;
  long long v6 = &self->_metadata[1];
  do
    objc_storeStrong((id *)&v6[v5--], 0);
  while (v5 != -2);
}

@end