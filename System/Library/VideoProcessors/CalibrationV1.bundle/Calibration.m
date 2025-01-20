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
  uint64_t v6 = *(void *)&a3;
  objc_msgSend_releaseResources(self, a2, *(uint64_t *)&a3, v3, v4, v5);
  if (self->_distortionCorrectionEnabled)
  {
    int ResourcesForMaxNumOfTransposedPoints = sub_262E7C72C(v6, (void ***)&self->_adc);
    if (ResourcesForMaxNumOfTransposedPoints) {
      goto LABEL_6;
    }
  }
  else
  {
    int ResourcesForMaxNumOfTransposedPoints = objc_msgSend__allocateResourcesForMaxNumOfTransposedPoints_(self, v8, v6, v9, v10, v11);
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
    sub_262E7CC58((void **)self->_adc);
    self->_adc = 0;
  }
  else
  {
    ((void (*)(Calibration *, char *))MEMORY[0x270F9A6D0])(self, sel__releaseResourcesForTransformedPoints);
  }
}

- (void)dealloc
{
  objc_msgSend_releaseResources(self, a2, v2, v3, v4, v5);
  v7.receiver = self;
  v7.super_class = (Class)Calibration;
  [(Calibration *)&v7 dealloc];
}

- (int)extractParametersFromReferenceMetadata:(id)a3 auxiliaryMetadata:(id)a4 options:(id)a5 adaptiveCorrectionConfig:(AdaptiveCorrectionConfig *)a6 useReferenceFrame:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v339 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a4;
  id v293 = a5;
  v307 = self;
  self->_rectificationFocalLengthFactor = 1.0;
  if (!v13 || !v14)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v284 = FigSignalErrorAt();
    v40 = v293;
    goto LABEL_72;
  }
  v289 = a6;
  id v291 = v13;
  objc_msgSend_objectForKeyedSubscript_(v13, v15, @"PortType", v16, v17, v18);
  v19 = (NSString *)objc_claimAutoreleasedReturnValue();
  v20 = self->_portTypeName[0];
  self->_portTypeName[0] = v19;

  id v290 = v14;
  v21 = v14;
  v22 = self;
  objc_msgSend_objectForKeyedSubscript_(v21, v23, @"PortType", v24, v25, v26);
  v27 = (NSString *)objc_claimAutoreleasedReturnValue();
  v28 = self->_portTypeName[1];
  self->_portTypeName[1] = v27;

  metadata = self->_metadata;
  objc_storeStrong((id *)self->_metadata, a3);
  objc_storeStrong((id *)&self->_metadata[1], a4);
  if (v7)
  {
    uint64_t v34 = 0;
    char v35 = 1;
    do
    {
      char v36 = v35;
      v37 = objc_msgSend_objectForKeyedSubscript_(metadata[v34], v30, @"ReferenceFrameMetadata", v31, v32, v33);

      if (v37)
      {
        uint64_t v38 = objc_msgSend_objectForKeyedSubscript_(metadata[v34], v30, @"ReferenceFrameMetadata", v31, v32, v33);
        v39 = metadata[v34];
        metadata[v34] = (NSDictionary *)v38;
      }
      char v35 = 0;
      uint64_t v34 = 1;
    }
    while ((v36 & 1) != 0);
  }
  v40 = v293;
  if (!v293
    || (objc_msgSend_objectForKeyedSubscript_(v293, v30, *MEMORY[0x263F2F1E8], v31, v32, v33),
        (v308 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v284 = FigSignalErrorAt();
    id v14 = v290;
    goto LABEL_72;
  }
  objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v41, v42, v43, v44, v45);
  v306 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  int v46 = 0;
  uint64_t v47 = 0;
  int v292 = 0;
  uint64_t v305 = *MEMORY[0x263F2F5E0];
  uint64_t v304 = *MEMORY[0x263F2EEF0];
  uint64_t v314 = *MEMORY[0x263F2EEB8];
  uint64_t v302 = *MEMORY[0x263F2EE90];
  pixelBufferDimensions = v307->_pixelBufferDimensions;
  uint64_t v316 = *MEMORY[0x263F2EE88];
  uint64_t v313 = *MEMORY[0x263F2F5C0];
  __asm { FMOV            V0.2D, #0.5 }
  float64x2_t v296 = _Q0;
  uint64_t v312 = *MEMORY[0x263F2F458];
  uint64_t v311 = *MEMORY[0x263F2F5B0];
  uint64_t v310 = *MEMORY[0x263F2F450];
  uint64_t v300 = *MEMORY[0x263F2F568];
  uint64_t v301 = *MEMORY[0x263F2EEA0];
  uint64_t v295 = *MEMORY[0x263F2EE98];
  uint64_t v294 = *MEMORY[0x263F2F560];
  uint64_t v298 = *MEMORY[0x263F2F5F8];
  uint64_t v299 = *MEMORY[0x263F2F600];
  pixelBufferScalingFactor = v307->_pixelBufferScalingFactor;
  uint64_t v297 = *MEMORY[0x263F2F678];
  char v53 = 1;
  do
  {
    char v315 = v53;
    v54 = v307->_portTypeName[v47];
    uint64_t v318 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v55, v56, v57, v58, v59);
    v64 = objc_msgSend_objectForKeyedSubscript_(metadata[v47], v60, v305, v61, v62, v63);
    unsigned int v70 = objc_msgSend_intValue(v64, v65, v66, v67, v68, v69);
    if (v70 <= 1) {
      int v71 = 1;
    }
    else {
      int v71 = v70;
    }

    v72 = NSNumber;
    v77 = objc_msgSend_objectForKeyedSubscript_(v308, v73, (uint64_t)v54, v74, v75, v76);
    v82 = objc_msgSend_objectForKeyedSubscript_(v77, v78, v304, v79, v80, v81);
    objc_msgSend_floatValue(v82, v83, v84, v85, v86, v87);
    float v88 = (float)v71;
    *(float *)&double v90 = v89 * (float)v71;
    v317 = objc_msgSend_numberWithFloat_(v72, v91, v92, v93, v94, v95, v90);

    v100 = objc_msgSend_objectForKeyedSubscript_(v308, v96, (uint64_t)v54, v97, v98, v99);
    objc_msgSend_objectForKeyedSubscript_(v100, v101, v314, v102, v103, v104);
    v106 = v105 = v22;

    v111 = objc_msgSend_objectForKeyedSubscript_(v308, v107, (uint64_t)v54, v108, v109, v110);
    v320 = objc_msgSend_objectForKeyedSubscript_(v111, v112, v302, v113, v114, v115);

    v120 = objc_msgSend_objectForKeyedSubscript_(v308, v116, (uint64_t)v54, v117, v118, v119);
    uint64_t v125 = objc_msgSend_objectForKeyedSubscript_(v120, v121, v316, v122, v123, v124);

    v126 = v54;
    v328 = objc_msgSend_objectForKeyedSubscript_(metadata[v47], v127, v313, v128, v129, v130);
    v322 = objc_msgSend_objectForKeyedSubscript_(metadata[v47], v131, v312, v132, v133, v134);
    dict = objc_msgSend_objectForKeyedSubscript_(metadata[v47], v135, v311, v136, v137, v138);
    objc_msgSend_objectForKeyedSubscript_(metadata[v47], v139, v310, v140, v141, v142);
    CFDictionaryRef v321 = (CFDictionaryRef)objc_claimAutoreleasedReturnValue();
    v147 = objc_msgSend_objectForKeyedSubscript_(v308, v143, (uint64_t)v54, v144, v145, v146);
    v330 = objc_msgSend_objectForKeyedSubscript_(v147, v148, v301, v149, v150, v151);

    v324 = objc_msgSend_objectForKeyedSubscript_(metadata[v47], v152, v300, v153, v154, v155);
    v161 = &pixelBufferDimensions[v47];
    $470D365275581EF16070F5A11344F73E v163 = *v161;
    p_height = &v161->height;
    $470D365275581EF16070F5A11344F73E v164 = v163;
    if (v105->_pixelBufferScalingEnabled)
    {
      CGSize v165 = *(CGSize *)(MEMORY[0x263F001A0] + 16);
      rect.origin = (CGPoint)*MEMORY[0x263F001A0];
      rect.float64x2_t size = v165;
      objc_msgSend_objectForKeyedSubscript_(metadata[v47], v156, v297, v158, v159, v160);
      CFDictionaryRef v166 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      CGRectMakeWithDictionaryRepresentation(v166, &rect);

      float64x2_t size = (float64x2_t)rect.size;
      if (rect.size.width <= 0.0 || rect.size.height <= 0.0)
      {
        v323 = (void *)v125;
        fig_log_get_emitter();
        uint64_t v287 = v288;
        LODWORD(v286) = 0;
        FigDebugAssert3();
        int v292 = FigSignalErrorAt();
        char v168 = 0;
        char v169 = v315;
        v171 = v317;
        v170 = (void *)v318;
LABEL_63:
        v173 = v106;
        goto LABEL_64;
      }
    }
    else
    {
      v172.i64[0] = v164.width;
      v172.i64[1] = v164.height;
      float64x2_t size = vcvtq_f64_s64(v172);
    }
    v171 = v317;
    v170 = (void *)v318;
    v173 = v106;
    float64x2_t v319 = size;
    if (!v330)
    {
      v196 = objc_msgSend_objectForKeyedSubscript_(v308, v156, (uint64_t)v126, v158, v159, v160);
      uint64_t v201 = objc_msgSend_objectForKeyedSubscript_(v196, v197, v295, v198, v199, v200);

      uint64_t v206 = objc_msgSend_objectForKeyedSubscript_(metadata[v47], v202, v294, v203, v204, v205);

      v330 = (void *)v201;
      if (v201)
      {
        v323 = (void *)v125;
        if (!v206)
        {
          fig_log_get_emitter();
          uint64_t v287 = v288;
          LODWORD(v286) = 0;
          FigDebugAssert3();
          int v292 = FigSignalErrorAt();
          char v168 = 0;
          v324 = 0;
          goto LABEL_62;
        }
        v324 = (void *)v206;
LABEL_28:
        v173 = objc_msgSend_objectForKeyedSubscript_(v330, v191, v314, v192, v193, v194, v286, v287);

        uint64_t v125 = objc_msgSend_objectForKeyedSubscript_(v330, v207, v316, v208, v209, v210);

        objc_msgSend_objectForKeyedSubscript_(v324, v211, v313, v212, v213, v214);
        uint64_t v216 = v215 = v126;

        uint64_t v221 = objc_msgSend_objectForKeyedSubscript_(v324, v217, v312, v218, v219, v220);

        uint64_t v226 = objc_msgSend_objectForKeyedSubscript_(v324, v222, v311, v223, v224, v225);

        uint64_t v231 = objc_msgSend_objectForKeyedSubscript_(v324, v227, v310, v228, v229, v230);

        v328 = (void *)v216;
        v126 = v215;
        CFDictionaryRef v321 = (CFDictionaryRef)v231;
        v322 = (void *)v221;
        v171 = v317;
        v170 = (void *)v318;
        dict = (void *)v226;
      }
      else
      {
        v330 = 0;
        v324 = (void *)v206;
        v173 = v106;
      }
      v22 = v307;
      uint64_t v195 = (uint64_t)v320;
      if (!v171) {
        goto LABEL_32;
      }
      goto LABEL_31;
    }
    v323 = (void *)v125;
    if (!v317)
    {
      fig_log_get_emitter();
      uint64_t v287 = v288;
      LODWORD(v286) = 0;
      FigDebugAssert3();
      int v292 = FigSignalErrorAt();
      char v168 = 0;
LABEL_59:
      char v169 = v315;
LABEL_64:
      v22 = v307;
      goto LABEL_65;
    }
    if (!v324)
    {
      fig_log_get_emitter();
      uint64_t v287 = v288;
      LODWORD(v286) = 0;
      FigDebugAssert3();
      int v292 = FigSignalErrorAt();
      char v168 = 0;
      v324 = 0;
      goto LABEL_59;
    }
    objc_msgSend_floatValue(v317, v156, v157, v158, v159, v160);
    float v175 = v174;
    v180 = objc_msgSend_objectForKeyedSubscript_(v330, v176, v316, v177, v178, v179);
    if (!v180)
    {
      fig_log_get_emitter();
      uint64_t v287 = v288;
      LODWORD(v286) = 0;
      FigDebugAssert3();
      int v292 = FigSignalErrorAt();
      char v168 = 0;
LABEL_62:
      char v169 = v315;
      goto LABEL_63;
    }
    v186 = v180;
    float32x2_t v187 = vcvt_f32_f64(vmulq_f64(v319, v296));
    float v188 = (float)(sqrtf(vaddv_f32(vmul_f32(v187, v187))) * v175) / 1000.0;
    objc_msgSend_floatValue(v180, v181, v182, v183, v184, v185);
    BOOL v190 = v188 > v189;

    if ((v190 & ~v46 & 1) == 0) {
      goto LABEL_28;
    }
    uint64_t v195 = (uint64_t)v320;
    v173 = v106;
    v22 = v307;
    uint64_t v125 = (uint64_t)v323;
LABEL_31:
    objc_msgSend_setObject_forKeyedSubscript_(v170, v191, (uint64_t)v171, @"pixelSizeMicrometers", v193, v194, v286);
LABEL_32:
    if (v173) {
      objc_msgSend_setObject_forKeyedSubscript_(v170, v191, (uint64_t)v173, @"gdcCoefficients", v193, v194);
    }
    if (v195) {
      objc_msgSend_setObject_forKeyedSubscript_(v170, v191, v195, @"CameraViewMatrix", v193, v194);
    }
    if (v125) {
      objc_msgSend_setObject_forKeyedSubscript_(v170, v191, v125, @"CalibrationValidRadius", v193, v194);
    }
    objc_msgSend_setObject_forKeyedSubscript_(v306, v191, (uint64_t)v170, (uint64_t)v126, v193, v194, v286);
    v323 = (void *)v125;
    if (!v328)
    {
      fig_log_get_emitter();
      uint64_t v287 = v288;
      LODWORD(v286) = 0;
      FigDebugAssert3();
      int v292 = FigSignalErrorAt();
      char v168 = 0;
      v328 = 0;
LABEL_54:
      char v169 = v315;
LABEL_65:
      CFDictionaryRef v274 = v321;
      v271 = v322;
      goto LABEL_49;
    }
    objc_msgSend_floatValue(v328, v232, v233, v234, v235, v236);
    v307->_focalLength[v47] = v237;
    if (!CGPointMakeWithDictionaryRepresentation((CFDictionaryRef)dict, &v307->_opticalCenter[v47]))
    {
      fig_log_get_emitter();
      uint64_t v287 = v288;
      LODWORD(v286) = 0;
      FigDebugAssert3();
      int v292 = FigSignalErrorAt();
      char v168 = 0;
      goto LABEL_54;
    }
    v242 = objc_msgSend_objectForKeyedSubscript_(metadata[v47], v238, v299, v239, v240, v241);
    objc_msgSend_floatValue(v242, v243, v244, v245, v246, v247);
    p_width = &v307->_rawSensorSize[v47].width;
    double *p_width = v248;

    v254 = objc_msgSend_objectForKeyedSubscript_(metadata[v47], v250, v298, v251, v252, v253);
    objc_msgSend_floatValue(v254, v255, v256, v257, v258, v259);
    p_width[1] = v260;

    float v266 = v319.f64[0];
    float v267 = (float)pixelBufferDimensions[v47].width / v266;
    float v268 = v319.f64[1];
    float v269 = (float)*p_height / v268;
    *(float *)&uint64_t v270 = v267;
    *((float *)&v270 + 1) = v269;
    *(void *)&pixelBufferScalingFactor[8 * v47] = v270;
    char v169 = v315;
    if (v315)
    {
      v22->_referenceCalibrationScalingFactor = (float)((float)((float)(v267 + v269) * 0.5)
                                                      + (float)((float)(v267 + v269) * 0.5))
                                              / v88;
      uint64_t v270 = *(void *)&pixelBufferScalingFactor[8 * v47];
    }
    v271 = v322;
    if (*(float *)&v270 > 10.0 || *(float *)&v270 <= 0.1)
    {
      fig_log_get_emitter();
      uint64_t v287 = v288;
      LODWORD(v286) = 0;
      FigDebugAssert3();
      int v292 = FigSignalErrorAt();
      char v168 = 0;
      CFDictionaryRef v274 = v321;
    }
    else
    {
      if (v322) {
        objc_msgSend_floatValue(v322, v261, v262, v263, v264, v265);
      }
      else {
        float v272 = 0.0;
      }
      v307->_ddf[v47] = v272;
      v273 = &v307->_distortionOpticalCenter[v47];
      CFDictionaryRef v274 = v321;
      if (CGPointMakeWithDictionaryRepresentation(v321, v273))
      {
        char v168 = 1;
      }
      else
      {
        fig_log_get_emitter();
        uint64_t v287 = v288;
        LODWORD(v286) = 0;
        FigDebugAssert3();
        int v292 = FigSignalErrorAt();
        char v168 = 0;
      }
    }
LABEL_49:

    if ((v168 & 1) == 0)
    {

      id v14 = v290;
      id v13 = v291;
      goto LABEL_71;
    }
    char v53 = 0;
    int v46 = 1;
    uint64_t v47 = 1;
  }
  while ((v169 & 1) != 0);
  staticParametersByPortType = v22->_staticParametersByPortType;
  v22->_staticParametersByPortType = v306;
  v276 = v306;

  float scaleTuningWithDigitalZoomByFactor = v289->scaleTuningWithDigitalZoomByFactor;
  if (scaleTuningWithDigitalZoomByFactor <= 0.0)
  {
    v279 = v22;
    id v14 = v290;
    id v13 = v291;
    float64x2_t v325 = *(float64x2_t *)&v289->epErrorLimitWidePix_FirstPass;
    *(_OWORD *)dicta = *(_OWORD *)&v289->rangePFL_T;
    float64x2_t v329 = *(float64x2_t *)&v289->rangeOCxT;
    float64x2_t v331 = *(float64x2_t *)&v289->rangeOCyT;
  }
  else
  {
    double v278 = (float)((float)(scaleTuningWithDigitalZoomByFactor * (float)(v22->_referenceCalibrationScalingFactor + -1.0))
                 + 1.0);
    *(float64x2_t *)dicta = vmulq_n_f64(*(float64x2_t *)&v289->rangePFL_T, v278);
    float64x2_t v329 = vmulq_n_f64(*(float64x2_t *)&v289->rangeOCxT, v278);
    float64x2_t v331 = vmulq_n_f64(*(float64x2_t *)&v289->rangeOCyT, v278);
    float64x2_t v325 = vmulq_n_f64(*(float64x2_t *)&v289->epErrorLimitWidePix_FirstPass, v278);
    v279 = v22;
    id v14 = v290;
    id v13 = v291;
  }
  long long v280 = *(_OWORD *)&v289->runAnalyticalPreconditioning;
  long long v335 = *(_OWORD *)&v289->errorVal_LessThanExtremeMacro;
  long long v336 = v280;
  long long v337 = *(_OWORD *)&v289->keypointOutliersPercentile;
  float temporalInitializationFactor = v289->temporalInitializationFactor;
  long long v281 = *(_OWORD *)&v289->minPointsForAdjustment;
  long long v333 = *(_OWORD *)&v289->intermediateMacroDistMM;
  long long v334 = v281;
  memcpy(&rect, &v289->overrideConfigPass1, 0x168uLL);
  *(float64x2_t *)&v307->_adaptiveCorrectionConfig.epErrorLimitWidePix_FirstPass = v325;
  *(_OWORD *)&v307->_adaptiveCorrectionConfig.rangePFL_T = *(_OWORD *)dicta;
  *(float64x2_t *)&v307->_adaptiveCorrectionConfig.rangeOCxT = v329;
  *(float64x2_t *)&v307->_adaptiveCorrectionConfig.rangeOCyT = v331;
  long long v282 = v336;
  *(_OWORD *)&v279->_adaptiveCorrectionConfig.errorVal_LessThanExtremeMacro = v335;
  *(_OWORD *)&v279->_adaptiveCorrectionConfig.runAnalyticalPreconditioning = v282;
  *(_OWORD *)&v279->_adaptiveCorrectionConfig.keypointOutliersPercentile = v337;
  v279->_adaptiveCorrectionConfig.float temporalInitializationFactor = temporalInitializationFactor;
  long long v283 = v334;
  *(_OWORD *)&v279->_adaptiveCorrectionConfig.intermediateMacroDistMM = v333;
  *(_OWORD *)&v279->_adaptiveCorrectionConfig.minPointsForAdjustment = v283;
  v279->_adaptiveCorrectionConfig.float scaleTuningWithDigitalZoomByFactor = scaleTuningWithDigitalZoomByFactor;
  memcpy(&v279->_adaptiveCorrectionConfig.overrideConfigPass1, &rect, 0x168uLL);

LABEL_71:
  v40 = v293;
  int v284 = v292;
LABEL_72:

  return v284;
}

- (int)computeInitialCalibration
{
  uint64_t v145 = *MEMORY[0x263EF8340];
  uint64_t v6 = objc_msgSend_objectForKeyedSubscript_(self->_staticParametersByPortType, a2, (uint64_t)self->_portTypeName[1], v2, v3, v4);
  objc_msgSend_objectForKeyedSubscript_(v6, v7, @"CameraViewMatrix", v8, v9, v10);
  id v11 = objc_claimAutoreleasedReturnValue();
  uint64_t v17 = (uint64_t *)objc_msgSend_bytes(v11, v12, v13, v14, v15, v16);

  uint64_t v136 = self;
  v22 = objc_msgSend_objectForKeyedSubscript_(self->_staticParametersByPortType, v18, (uint64_t)self->_portTypeName[0], v19, v20, v21);
  objc_msgSend_objectForKeyedSubscript_(v22, v23, @"CameraViewMatrix", v24, v25, v26);
  id v27 = objc_claimAutoreleasedReturnValue();
  uint64_t v33 = (uint64_t *)objc_msgSend_bytes(v27, v28, v29, v30, v31, v32);

  if (!v17 || !v33)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
  portTypeName = self->_portTypeName;
  *(double *)v39.i64 = sub_262E794D0(v17, v34, v35, v36, v37, v38);
  float32x4_t v129 = v39;
  float32x4_t v131 = v40;
  float32x4_t v127 = v41;
  float32x4_t v133 = v42;
  *(double *)v48.i64 = sub_262E794D0(v33, *(double *)v39.i64, *(double *)v40.i64, *(double *)v41.i64, *(double *)v42.i64, v43);
  uint64_t v50 = 0;
  long long v137 = 0u;
  long long v138 = 0u;
  int32x4_t v52 = vzip1q_s32(v48, v51);
  long long v139 = 0u;
  long long v140 = 0u;
  v144[0] = vzip1q_s32(v52, v53);
  v144[1] = vzip2q_s32(v52, vdupq_lane_s32(*(int32x2_t *)v53.i8, 1));
  v144[2] = vzip1q_s32(vzip2q_s32(v48, v51), vdupq_laneq_s32(v53, 2));
  float32x4_t time = 0u;
  float32x4_t time_16 = 0u;
  float32x4_t v143 = 0u;
  do
  {
    *(float32x4_t *)((char *)&time + v50 * 16) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v129, COERCE_FLOAT(v144[v50])), v131, *(float32x2_t *)&v144[v50], 1), v127, (float32x4_t)v144[v50], 2);
    ++v50;
  }
  while (v50 != 3);
  uint64_t v54 = 0;
  DWORD2(v137) = time.i32[2];
  DWORD2(v138) = time_16.i32[2];
  float32x4_t v55 = vsubq_f32(v133, vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(time, v49.f32[0]), time_16, *(float32x2_t *)v49.f32, 1), v143, v49, 2));
  *(void *)&long long v137 = time.i64[0];
  *(void *)&long long v138 = time_16.i64[0];
  DWORD2(v139) = v143.i32[2];
  DWORD2(v140) = v55.i32[2];
  *(void *)&long long v139 = v143.i64[0];
  *(void *)&long long v140 = v55.i64[0];
  $470D365275581EF16070F5A11344F73E v56 = self->_pixelBufferDimensions[0];
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
  v58.i64[0] = v56.width;
  v58.i64[1] = v56.height;
  pixelBufferDimensions = self->_pixelBufferDimensions;
  *(float64x2_t *)self->_initialCalibration.calibrationDimensions = vcvtq_f64_s64(v58);
  do
  {
    for (uint64_t i = 0; i != 4; ++i)
      extrinRotRefefenceToAuxiliary[i] = *(float *)((unint64_t)(&v137 + i) & 0xFFFFFFFFFFFFFFF3 | (4 * (v54 & 3)));
    ++v54;
    extrinRotRefefenceToAuxiliary += 4;
  }
  while (v54 != 3);
  uint64_t v60 = 0;
  rawSensorSize = self->_rawSensorSize;
  pixelBufferScalingFactor = self->_pixelBufferScalingFactor;
  opticalCenter = self->_opticalCenter;
  opticalCenterX = self->_initialCalibration.opticalCenterX;
  opticalCenterY = self->_initialCalibration.opticalCenterY;
  pixelSize_um = self->_initialCalibration.pixelSize_um;
  focalLength = self->_focalLength;
  metadata = self->_metadata;
  uint64_t v124 = *MEMORY[0x263F2F508];
  uint64_t v123 = *MEMORY[0x263F2EF80];
  __int32 v122 = *(_DWORD *)(MEMORY[0x263F01090] + 12);
  uint64_t v121 = *(void *)(MEMORY[0x263F01090] + 16);
  uint64_t v119 = self->_initialCalibration.opticalCenterY;
  uint64_t v120 = *MEMORY[0x263F2F448];
  for (char j = 1; ; char j = 0)
  {
    char v66 = j;
    p_width = &rawSensorSize[v60].width;
    double v68 = (*p_width + -1.0) * 0.5;
    double v69 = (p_width[1] + -1.0) * 0.5;
    unsigned int v70 = (int *)&pixelBufferDimensions[v60];
    p_x = &opticalCenter[v60].x;
    uint64_t v72 = *(void *)&pixelBufferScalingFactor[8 * v60];
    double v73 = p_x[1];
    double v74 = ((double)v70[1] + -1.0) * 0.5;
    opticalCenterX[v60] = ((double)*v70 + -1.0) * 0.5 + (*p_x - v68) * *(float *)&v72;
    opticalCenterY[v60] = v74 + (v73 - v69) * *((float *)&v72 + 1);
    uint64_t v75 = objc_msgSend_objectForKeyedSubscript_(v136->_staticParametersByPortType, v44, (uint64_t)portTypeName[v60], v45, v46, v47);
    uint64_t v80 = objc_msgSend_objectForKeyedSubscript_(v75, v76, @"pixelSizeMicrometers", v77, v78, v79);
    objc_msgSend_floatValue(v80, v81, v82, v83, v84, v85);
    float v87 = v86;

    double v88 = (float)(v87 / (float)(vaddv_f32(*(float32x2_t *)&pixelBufferScalingFactor[8 * v60]) * 0.5));
    pixelSize_um[v60] = v88;
    p_initialCalibration->focalLengthPix[v60] = focalLength[v60] / v88;
    uint64_t v93 = objc_msgSend_objectForKeyedSubscript_(metadata[v60], v89, v124, v90, v91, v92);

    if (v93) {
      break;
    }
LABEL_19:
    uint64_t v60 = 1;
    if ((v66 & 1) == 0) {
      return 0;
    }
  }
  uint64_t v94 = opticalCenterX;
  objc_msgSend_objectForKeyedSubscript_(metadata[v60], v44, v123, v45, v46, v47);
  CFDictionaryRef v95 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  CFDictionaryRef v100 = v95;
  *(void *)&v144[0] = *MEMORY[0x263F01090];
  DWORD2(v144[0]) = *(_DWORD *)(MEMORY[0x263F01090] + 8);
  __int32 v101 = v122;
  uint64_t v102 = v121;
  if (v95)
  {
    CMTimeMakeFromDictionary((CMTime *)&time, v95);
    *(void *)&v144[0] = time.i64[0];
    __int32 v101 = time.i32[3];
    DWORD2(v144[0]) = time.i32[2];
    uint64_t v102 = time_16.i64[0];
  }
  if ((v101 & 1) == 0)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v117 = FigSignalErrorAt();
    goto LABEL_24;
  }
  uint64_t v103 = objc_msgSend_objectForKeyedSubscript_(metadata[v60], v96, v120, v97, v98, v99);
  uint64_t v109 = v103;
  if (v103)
  {
    objc_msgSend_floatValue(v103, v104, v105, v106, v107, v108);
    float v111 = v110;
  }
  else
  {
    float v111 = 1.0;
  }
  double v112 = pixelSize_um[v60];
  time.i64[0] = *(void *)&v144[0];
  time.i64[1] = __PAIR64__(v101, DWORD2(v144[0]));
  time_16.i64[0] = v102;
  CMTimeGetSeconds((CMTime *)&time);
  int v113 = FigMotionComputeAverageSpherePosition();
  if (!v113)
  {
    float v114 = v112;
    float v115 = v111 / v114;
    opticalCenterX = v94;
    v94[v60] = v94[v60] + (float)(v115 * 0.0);
    opticalCenterY = v119;
    v119[v60] = v119[v60] + (float)(v115 * 0.0);
    v116 = metadata[v60];
    metadata[v60] = 0;

    goto LABEL_19;
  }
  int v117 = v113;
  fig_log_get_emitter();
  FigDebugAssert3();

LABEL_24:
  return v117;
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
  if ((objc_msgSend__computeAdcDistortionModels(self, a2, v2, v3, v4, v5) & 1) == 0) {
    goto LABEL_5;
  }
  long long v7 = *(_OWORD *)&self->_initialCalibration.canonicalDisparityScale;
  *(_OWORD *)&self->_correctedCalibration.extrinRotRefefenceToAuxiliary[10] = *(_OWORD *)&self->_initialCalibration.extrinRotRefefenceToAuxiliary[10];
  *(_OWORD *)&self->_correctedCalibration.canonicalDisparityScale = v7;
  *(_OWORD *)&self->_correctedCalibration.calibrationDimensions[1] = *(_OWORD *)&self->_initialCalibration.calibrationDimensions[1];
  self->_correctedCalibration.pixelSize_um[1] = self->_initialCalibration.pixelSize_um[1];
  long long v8 = *(_OWORD *)&self->_initialCalibration.extrinRotRefefenceToAuxiliary[4];
  *(_OWORD *)&self->_correctedCalibration.extrinRotRefefenceToAuxiliary[2] = *(_OWORD *)&self->_initialCalibration.extrinRotRefefenceToAuxiliary[2];
  *(_OWORD *)&self->_correctedCalibration.extrinRotRefefenceToAuxiliary[4] = v8;
  long long v9 = *(_OWORD *)&self->_initialCalibration.extrinRotRefefenceToAuxiliary[8];
  *(_OWORD *)&self->_correctedCalibration.extrinRotRefefenceToAuxiliary[6] = *(_OWORD *)&self->_initialCalibration.extrinRotRefefenceToAuxiliary[6];
  *(_OWORD *)&self->_correctedCalibration.extrinRotRefefenceToAuxiliary[8] = v9;
  long long v10 = *(_OWORD *)self->_initialCalibration.opticalCenterX;
  *(_OWORD *)self->_correctedCalibration.focalLengthPix = *(_OWORD *)self->_initialCalibration.focalLengthPix;
  *(_OWORD *)self->_correctedCalibration.opticalCenterX = v10;
  long long v11 = *(_OWORD *)self->_initialCalibration.extrinRotRefefenceToAuxiliary;
  *(_OWORD *)self->_correctedCalibration.opticalCenterY = *(_OWORD *)self->_initialCalibration.opticalCenterY;
  *(_OWORD *)self->_correctedCalibration.extrinRotRefefenceToAuxiliary = v11;
  if (sub_262E7CCCC((uint64_t)self->_adc, &self->_adaptiveCorrectionConfig))
  {
LABEL_5:
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
  else if (sub_262E7E448((uint64_t)self->_adc, (uint64_t)self->_undistModels, (uint64_t)&self->_undistModels[1], self->_correctedCalibration.focalLengthPix, 1.0))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 3;
  }
  else
  {
    sub_262E7CD94((uint64_t)self->_adc, v20);
    sub_262E797A0((__n128 *)self->_undistModels, (__n128 *)self->_distModels);
    *(void *)&double v12 = sub_262E797A0((__n128 *)&self->_undistModels[1], (__n128 *)&self->_distModels[1]).n128_u64[0];
    objc_msgSend__computeCanonicalDisparityScaleFactor(self, v13, v14, v15, v16, v17, v12);
    int result = 0;
    self->_correctedCalibration.canonicalDisparityScale = v19;
  }
  return result;
}

- (int)computeCalibration
{
  uint64_t v39 = *MEMORY[0x263EF8340];
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
    if ((objc_msgSend__computeAdcDistortionModels(self, a2, v2, v3, v4, v5) & 1) == 0) {
      goto LABEL_17;
    }
    long long v7 = *(_OWORD *)&self->_initialCalibration.canonicalDisparityScale;
    *(_OWORD *)&self->_correctedCalibration.extrinRotRefefenceToAuxiliary[10] = *(_OWORD *)&self->_initialCalibration.extrinRotRefefenceToAuxiliary[10];
    *(_OWORD *)&self->_correctedCalibration.canonicalDisparityScale = v7;
    *(_OWORD *)&self->_correctedCalibration.calibrationDimensions[1] = *(_OWORD *)&self->_initialCalibration.calibrationDimensions[1];
    self->_correctedCalibration.pixelSize_um[1] = self->_initialCalibration.pixelSize_um[1];
    long long v8 = *(_OWORD *)&self->_initialCalibration.extrinRotRefefenceToAuxiliary[4];
    *(_OWORD *)&self->_correctedCalibration.extrinRotRefefenceToAuxiliary[2] = *(_OWORD *)&self->_initialCalibration.extrinRotRefefenceToAuxiliary[2];
    *(_OWORD *)&self->_correctedCalibration.extrinRotRefefenceToAuxiliary[4] = v8;
    long long v9 = *(_OWORD *)&self->_initialCalibration.extrinRotRefefenceToAuxiliary[8];
    *(_OWORD *)&self->_correctedCalibration.extrinRotRefefenceToAuxiliary[6] = *(_OWORD *)&self->_initialCalibration.extrinRotRefefenceToAuxiliary[6];
    *(_OWORD *)&self->_correctedCalibration.extrinRotRefefenceToAuxiliary[8] = v9;
    long long v10 = *(_OWORD *)self->_initialCalibration.opticalCenterX;
    *(_OWORD *)self->_correctedCalibration.focalLengthPix = *(_OWORD *)self->_initialCalibration.focalLengthPix;
    *(_OWORD *)self->_correctedCalibration.opticalCenterX = v10;
    long long v11 = *(_OWORD *)self->_initialCalibration.extrinRotRefefenceToAuxiliary;
    *(_OWORD *)self->_correctedCalibration.opticalCenterY = *(_OWORD *)self->_initialCalibration.opticalCenterY;
    *(_OWORD *)self->_correctedCalibration.extrinRotRefefenceToAuxiliary = v11;
    if (sub_262E7CCCC((uint64_t)self->_adc, &self->_adaptiveCorrectionConfig))
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
        int v20 = 0;
        char v21 = 0;
        goto LABEL_14;
      }
      adc = self->_adc;
      uint64_t v14 = self->_adaptiveCorrectionKeypointsDistorted[0];
      uint64_t v15 = self->_adaptiveCorrectionKeypointsDistorted[1];
      undistModels = (long long *)self->_undistModels;
      uint64_t v17 = &self->_undistModels[1];
      p_correctedCalibration = &self->_correctedCalibration;
      if (self->_temporalCorrectionEnabled) {
        int v19 = sub_262E7CDF0((uint64_t)adc, (uint64_t)v14, (uint64_t)v15, keypointsCount, undistModels, (uint64_t)v17, (uint64_t)p_correctedCalibration);
      }
      else {
        int v19 = sub_262E7EAB0((uint64_t)adc, (uint64_t)v14, (uint64_t)v15, keypointsCount, (double *)undistModels, &v17->pixelSizeMM, (uint64_t)p_correctedCalibration);
      }
      if (!v19)
      {
        sub_262E7CD94((uint64_t)self->_adc, &v35);
        int v20 = v35;
        char v21 = v36;
        memcpy(__dst, v37, sizeof(__dst));
LABEL_14:
        sub_262E797A0((__n128 *)self->_undistModels, (__n128 *)self->_distModels);
        *(void *)&double v22 = sub_262E797A0((__n128 *)&self->_undistModels[1], (__n128 *)&self->_distModels[1]).n128_u64[0];
        objc_msgSend__computeCanonicalDisparityScaleFactor(self, v23, v24, v25, v26, v27, v22);
        self->_correctedCalibration.canonicalDisparityScale = v28;
        int v35 = v20;
        char v36 = v21;
        memcpy(v37, __dst, sizeof(v37));
        int v33 = objc_msgSend__checkADCStatus_(self, v29, (uint64_t)&v35, v30, v31, v32);
        if (v33)
        {
          fig_log_get_emitter();
          FigDebugAssert3();
        }
        return v33;
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
  long long v5 = self;
  uint64_t v6 = 0;
  id v7 = 0;
  id v8 = 0;
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
  uint64_t v93 = *MEMORY[0x263F2F298];
  polyDynamic = self->_distModels[0].polyDynamic;
  uint64_t v92 = *MEMORY[0x263F2F2A0];
  char v11 = 1;
  __asm
  {
    FMOV            V1.2D, #-1.0
    FMOV            V0.2D, #0.5
  }
  float64x2_t v83 = _Q0;
  float64x2_t v84 = _Q1;
  while (1)
  {
    char v18 = v11;
    v19.f64[0] = distortionOpticalCenter[v6].x;
    uint64_t v98 = v7;
    if (v19.f64[0] == 0.0
      || distortionOpticalCenter[v6].y == 0.0
      || (v20.f64[0] = rawSensorSize[v6].width, v20.f64[0] <= 0.0)
      || rawSensorSize[v6].height <= 0.0)
    {
      double v23 = opticalCenterY[v6];
      uint64_t v24 = &distModels[v6];
      v24->opticalCenterX = opticalCenterX[v6];
      v24->opticalCenterY = v23;
    }
    else
    {
      v20.f64[1] = rawSensorSize[v6].height;
      $470D365275581EF16070F5A11344F73E v21 = pixelBufferDimensions[v6];
      v22.i64[0] = v21.width;
      v22.i64[1] = v21.height;
      v19.f64[1] = distortionOpticalCenter[v6].y;
      *(float64x2_t *)&distModels[v6].opticalCenterX = vmlaq_f64(vmulq_f64(vaddq_f64(vcvtq_f64_s64(v22), v84), v83), vcvtq_f64_f32(*(float32x2_t *)&pixelBufferScalingFactor[8 * v6]), vsubq_f64(v19, vmulq_f64(vaddq_f64(v20, v84), v83)));
    }
    double v25 = pixelSize_um[v6] / 1000.0;
    uint64_t v26 = &distModels[v6];
    double v27 = ddf[v6] / v25;
    v26->pixelSizeMM = v25;
    v26->focalLengthPix = v27;
    long long v28 = *(_OWORD *)&v26->polyDynamic[2];
    p_pixelSizeMM = (_OWORD *)&undistModels[v6].pixelSizeMM;
    p_pixelSizeMM[6] = *(_OWORD *)v26->polyDynamic;
    p_pixelSizeMM[7] = v28;
    long long v30 = *(_OWORD *)&v26->polyDynamic[6];
    p_pixelSizeMM[8] = *(_OWORD *)&v26->polyDynamic[4];
    p_pixelSizeMM[9] = v30;
    long long v31 = *(_OWORD *)&v26->polyBase[2];
    p_pixelSizeMM[2] = *(_OWORD *)v26->polyBase;
    p_pixelSizeMM[3] = v31;
    long long v32 = *(_OWORD *)&v26->polyBase[6];
    p_pixelSizeMM[4] = *(_OWORD *)&v26->polyBase[4];
    p_pixelSizeMM[5] = v32;
    long long v33 = *(_OWORD *)&v26->opticalCenterX;
    _OWORD *p_pixelSizeMM = *(_OWORD *)&v26->pixelSizeMM;
    p_pixelSizeMM[1] = v33;
    double v34 = objc_msgSend_objectForKeyedSubscript_(v5->_staticParametersByPortType, a2, (uint64_t)portTypeName[v6], v2, v3, v4);
    uint64_t v39 = objc_msgSend_objectForKeyedSubscript_(v34, v35, @"gdcCoefficients", v36, v37, v38);
    uint64_t v44 = objc_msgSend_objectForKeyedSubscript_(v39, v40, v93, v41, v42, v43);

    if (!v44) {
      break;
    }
    id v8 = v44;
    uint64_t v50 = objc_msgSend_bytes(v8, v45, v46, v47, v48, v49);
    if (!v50) {
      break;
    }
    uint64_t v55 = v50;
    uint64_t v90 = v44;
    char v56 = v18;
    uint64_t v57 = v5;
    staticParametersByPortType = v5->_staticParametersByPortType;
    uint64_t v59 = portTypeName;
    uint64_t v60 = objc_msgSend_objectForKeyedSubscript_(staticParametersByPortType, v51, (uint64_t)portTypeName[v6], v52, v53, v54);
    v65 = objc_msgSend_objectForKeyedSubscript_(v60, v61, @"gdcCoefficients", v62, v63, v64);
    unsigned int v70 = objc_msgSend_objectForKeyedSubscript_(v65, v66, v92, v67, v68, v69);

    if (!v70)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      goto LABEL_23;
    }
    id v7 = v70;
    uint64_t v76 = objc_msgSend_bytes(v7, v71, v72, v73, v74, v75);
    if (!v76) {
      goto LABEL_22;
    }
    uint64_t v77 = 0;
    uint64_t v78 = &polyDynamic[20 * v6];
    char v79 = 1;
    do
    {
      v78[32] = *(float *)(v55 + v77);
      float v80 = *(float *)(v76 + v77);
      v78[40] = v80;
      v79 &= v80 == 0.0;
      *(v78 - 8) = *(float *)(v55 + 32 + v77);
      *v78++ = *(float *)(v76 + 32 + v77);
      v77 += 4;
    }
    while (v77 != 32);
    portTypeName = v59;
    if ((v79 & 1) == 0 && ddf[v6] <= 0.0)
    {
LABEL_22:
      fig_log_get_emitter();
      FigDebugAssert3();

LABEL_23:
      BOOL v81 = 0;
LABEL_18:
      uint64_t v44 = v90;
      goto LABEL_19;
    }
    char v11 = 0;
    uint64_t v6 = 1;
    long long v5 = v57;
    if ((v56 & 1) == 0)
    {

      BOOL v81 = 1;
      goto LABEL_18;
    }
  }
  fig_log_get_emitter();
  FigDebugAssert3();

  BOOL v81 = 0;
LABEL_19:

  return v81;
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
  long long v5 = (double *)malloc_type_malloc(v4, 0x100004000313F17uLL);
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
  memset(v39, 0, 512);
  uint64_t v38 = 0;
  __n128 v36 = 0u;
  memset(v37, 0, sizeof(v37));
  int8x16_t v34 = 0u;
  int8x16_t v35 = 0u;
  int8x16_t v33 = 0u;
  float32x2_t v31 = 0;
  float32x2_t v32 = 0;
  float32x2_t v29 = 0;
  float32x2_t v30 = 0;
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
    v41.columns[0] = (simd_float3)vzip1q_s32(v11, (int32x4_t)v9);
    v41.columns[2] = (simd_float3)vzip1q_s32(v12, v13);
    v41.columns[1] = (simd_float3)vzip2q_s32(v11, vdupq_lane_s32(*(int32x2_t *)&v9.f64[0], 1));
    int8x16_t v23 = (int8x16_t)v41.columns[1];
    int8x16_t v24 = (int8x16_t)v41.columns[0];
    __n128 v25 = (__n128)vzip2q_s32(v12, v13);
    int8x16_t v26 = (int8x16_t)v41.columns[2];
    if (sub_262E7F314((uint64_t)&v33, &v31, (int32x2_t *)&v29, v41, (float32x4_t)v25)
      || sub_262E7F7A0((long long *)&self->_correctedCalibration, (uint64_t)v37, v33, v34, v35, v36, v31, v32, v29, v30)|| sub_262E7F934((uint64_t)self->_adaptiveCorrectionKeypointsDistorted[0], self->_keypointsCount, (float64x2_t *)self->_transposedKeypoints.xyPointsTeleTransposed, v31, v32)|| sub_262E7F934((uint64_t)self->_adaptiveCorrectionKeypointsDistorted[1], self->_keypointsCount,
                         (float64x2_t *)self->_transposedKeypoints.xyPointsWideTransposed,
                         v29,
                         v30))
    {
      fig_log_get_emitter();
      goto LABEL_15;
    }
    uint64_t v28 = 0;
    memset(v27, 0, sizeof(v27));
    sub_262E801E4((uint64_t)self->_transposedKeypoints.xyPointsTeleTransposed, (uint64_t)self->_transposedKeypoints.xyPointsWideTransposed, self->_keypointsCount, v37, (uint64_t)&self->_adaptiveCorrectionConfig, (uint64_t)v39, (uint64_t)v27);
    v42.columns[0] = (simd_float2)v31;
    v42.columns[1] = (simd_float2)v32;
    simd_float2x2 v14 = __invert_f2(v42);
    v43.columns[0] = (simd_float2)v29;
    v43.columns[1] = (simd_float2)v30;
    simd_float2x2 v15 = __invert_f2(v43);
    if (sub_262E7F7A0(v27, (uint64_t)&self->_correctedCalibration, v24, v23, v26, v25, (float32x2_t)v14.columns[0], (float32x2_t)v14.columns[1], (float32x2_t)v15.columns[0], (float32x2_t)v15.columns[1]))
    {
      fig_log_get_emitter();
LABEL_15:
      FigDebugAssert3();
      return 3;
    }
  }
  else
  {
    bzero(v39, 0x748uLL);
  }
  objc_msgSend__computeCanonicalDisparityScaleFactor(self, v16, v17, v18, v19, v20);
  self->_correctedCalibration.canonicalDisparityScale = v21;
  if (BYTE4(v39[0]))
  {
    if (v40)
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
  return ((uint64_t (*)(Calibration *, char *))MEMORY[0x270F9A6D0])(self, sel_computeStereoRectificationHomographies_alignedToAngle_);
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
  int v6 = sub_262E811F0((uint64_t)&self->_correctedCalibration, (float32x4_t *)self->_anon_6b0, (float32x4_t *)self->_anon_6e0, (float32x4_t *)self->_anon_710, 0, 0);
  if (v6 || (int v6 = objc_msgSend__computeCenteredRectificationHomographies(self, v7, v8, v9, v10, v11)) != 0)
  {
    int v55 = v6;
    fig_log_get_emitter();
LABEL_21:
    FigDebugAssert3();
    return v55;
  }
  float32x2_t v20 = *(float32x2_t *)self->_orientationVector;
  if (sqrtf(vaddv_f32(vmul_f32(v20, v20))) <= 0.0
    || (v17.i64[0] = *(void *)&self->_initialCalibration.extrinRotRefefenceToAuxiliary[3],
        *(float *)v17.i32 = *(double *)v17.i64,
        *(float *)v17.i32 = -*(float *)v17.i32,
        float v21 = self->_initialCalibration.extrinRotRefefenceToAuxiliary[7],
        *(float *)v18.i32 = -v21,
        sqrtf(vaddv_f32(vmul_f32((float32x2_t)__PAIR64__(v18.u32[0], v17.u32[0]), (float32x2_t)__PAIR64__(v18.u32[0], v17.u32[0])))) <= 0.0))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return -12780;
  }
  v19.i32[0] = 1.0;
  v22.i64[0] = 0x8000000080000000;
  v22.i64[1] = 0x8000000080000000;
  float v23 = *(float *)vbslq_s8(v22, (int8x16_t)v19, v17).i32;
  LODWORD(v24) = vbslq_s8(v22, (int8x16_t)v19, v18).u32[0];
  v19.i64[0] = 0;
  int32x2_t v25 = 0;
  if (v23 <= 0.0) {
    *(float *)v25.i32 = (float)self->_pixelBufferDimensions[0].width + -1.0;
  }
  if (v24 <= 0.0) {
    *(float *)v19.i32 = (float)self->_pixelBufferDimensions[0].height + -1.0;
  }
  uint64_t v26 = 0;
  __asm { FMOV            V3.4S, #1.0 }
  int32x4_t v31 = vzip2q_s32(vdupq_lane_s32(v25, 0), (int32x4_t)_Q3);
  float32x4_t v32 = (float32x4_t)LODWORD(v23);
  v33.i32[0] = 0;
  v33.i64[1] = 0;
  v33.f32[1] = v24;
  _Q3.i64[0] = __PAIR64__(v19.u32[0], v25.u32[0]);
  *(int8x8_t *)self->_orientationVector = vbsl_s8((int8x8_t)vcltz_f32(v20), (int8x8_t)vneg_f32(v20), (int8x8_t)v20);
  float32x4_t v35 = *(float32x4_t *)&self->_anon_710[16];
  int32x4_t v36 = *(int32x4_t *)&self->_anon_710[32];
  int32x4_t v37 = vzip1q_s32(v31, v19);
  float32x4_t v57 = *(float32x4_t *)self->_anon_710;
  float32x4_t v58 = v35;
  int32x4_t v59 = v36;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  do
  {
    *(long long *)((char *)&v60 + v26 * 4) = (__int128)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v32, COERCE_FLOAT(*(_OWORD *)((char *)&v57 + v26 * 4))), v33, *(float32x2_t *)&v57.f32[v26], 1), _Q3, *(float32x4_t *)((char *)&v57 + v26 * 4), 2);
    v26 += 4;
  }
  while (v26 != 12);
  uint64_t v38 = 0;
  v32.i32[3] = 0;
  v33.i32[3] = 0;
  v37.i32[3] = 0;
  uint64_t v39 = v60;
  long long v40 = v61;
  long long v41 = v62;
  *((_DWORD *)anon_6b0 + 26) = DWORD2(v60);
  *((_DWORD *)anon_6b0 + 30) = DWORD2(v40);
  *((void *)anon_6b0 + 12) = v39;
  *((void *)anon_6b0 + 14) = v40;
  *((_DWORD *)anon_6b0 + 34) = DWORD2(v41);
  *((void *)anon_6b0 + 16) = v41;
  float32x4_t v42 = *(float32x4_t *)self->_anon_6b0;
  float32x4_t v43 = *(float32x4_t *)&self->_anon_6b0[16];
  float32x4_t v44 = *(float32x4_t *)&self->_anon_6b0[32];
  float32x4_t v57 = v32;
  float32x4_t v58 = v33;
  int32x4_t v59 = v37;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  do
  {
    *(long long *)((char *)&v60 + v38 * 4) = (__int128)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v42, COERCE_FLOAT(*(_OWORD *)((char *)&v57 + v38 * 4))), v43, *(float32x2_t *)&v57.f32[v38], 1), v44, *(float32x4_t *)((char *)&v57 + v38 * 4), 2);
    v38 += 4;
  }
  while (v38 != 12);
  uint64_t v45 = 0;
  uint64_t v46 = v60;
  long long v47 = v61;
  long long v48 = v62;
  *((_DWORD *)anon_6b0 + 2) = DWORD2(v60);
  *((_DWORD *)anon_6b0 + 6) = DWORD2(v47);
  *(void *)anon_6b0 = v46;
  *((void *)anon_6b0 + 2) = v47;
  *((_DWORD *)anon_6b0 + 10) = DWORD2(v48);
  *((void *)anon_6b0 + 4) = v48;
  float32x4_t v49 = *(float32x4_t *)self->_anon_6e0;
  float32x4_t v50 = *(float32x4_t *)&self->_anon_6e0[16];
  float32x4_t v51 = *(float32x4_t *)&self->_anon_6e0[32];
  float32x4_t v57 = v32;
  float32x4_t v58 = v33;
  int32x4_t v59 = v37;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  do
  {
    *(long long *)((char *)&v60 + v45 * 4) = (__int128)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v49, COERCE_FLOAT(*(_OWORD *)((char *)&v57 + v45 * 4))), v50, *(float32x2_t *)&v57.f32[v45], 1), v51, *(float32x4_t *)((char *)&v57 + v45 * 4), 2);
    v45 += 4;
  }
  while (v45 != 12);
  uint64_t v52 = v60;
  long long v53 = v61;
  long long v54 = v62;
  *((_DWORD *)anon_6b0 + 14) = DWORD2(v60);
  *((_DWORD *)anon_6b0 + 18) = DWORD2(v53);
  *((void *)anon_6b0 + 6) = v52;
  *((void *)anon_6b0 + 8) = v53;
  *((_DWORD *)anon_6b0 + 22) = DWORD2(v54);
  *((void *)anon_6b0 + 10) = v54;
  int v55 = objc_msgSend__computePaddedAuxiliaryRectificationHomography(self, v12, v13, v14, v15, v16);
  if (v55)
  {
    fig_log_get_emitter();
    goto LABEL_21;
  }
  return v55;
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
  v22[2] = xmmword_262E89A60;
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
  v152[16] = *MEMORY[0x263EF8340];
  anon_6b0 = self->_anon_6b0;
  long long v4 = *(_OWORD *)&self->_undistModels[0].polyDynamic[2];
  long long v138 = *(_OWORD *)self->_undistModels[0].polyDynamic;
  long long v139 = v4;
  long long v5 = *(_OWORD *)&self->_undistModels[0].polyDynamic[6];
  long long v140 = *(_OWORD *)&self->_undistModels[0].polyDynamic[4];
  long long v141 = v5;
  long long v6 = *(_OWORD *)&self->_undistModels[0].polyBase[2];
  long long v134 = *(_OWORD *)self->_undistModels[0].polyBase;
  long long v135 = v6;
  long long v7 = *(_OWORD *)&self->_undistModels[0].polyBase[6];
  long long v136 = *(_OWORD *)&self->_undistModels[0].polyBase[4];
  long long v137 = v7;
  long long v8 = *(_OWORD *)&self->_undistModels[0].opticalCenterX;
  long long v132 = *(_OWORD *)&self->_undistModels[0].pixelSizeMM;
  long long v133 = v8;
  double x = self->_referenceFinalCropRect.origin.x;
  *(CGFloat *)&long long v8 = self->_referenceFinalCropRect.origin.y;
  double v10 = x + self->_referenceFinalCropRect.size.width;
  double v11 = *(double *)&v8 + self->_referenceFinalCropRect.size.height;
  *(double *)v152 = x;
  v152[1] = v8;
  *(double *)&v152[2] = v10;
  v152[3] = v8;
  *(double *)&v152[4] = x;
  *(double *)&v152[5] = v11;
  *(double *)&v152[6] = v10;
  *(double *)&v152[7] = v11;
  v152[8] = v133;
  v152[9] = v8;
  v152[10] = v133;
  *(double *)&v152[11] = v11;
  *(double *)&v152[12] = x;
  v152[13] = *((void *)&v133 + 1);
  *(double *)&v152[14] = v10;
  v152[15] = *((void *)&v133 + 1);
  memset(v151, 0, sizeof(v151));
  sub_262E80F58((uint64_t)v152, 8, (double *)&v132, (uint64_t)v151);
  uint64_t v18 = 0;
  memset(v150, 0, sizeof(v150));
  do
  {
    float64x2_t v19 = (float64x2_t)v151[v18];
    *(float32x2_t *)&v19.f64[0] = vcvt_f32_f64(v19);
    LODWORD(v19.f64[1]) = 1.0;
    v150[v18++] = v19;
  }
  while (v18 != 8);
  uint64_t v20 = 0;
  float32x4_t v148 = 0u;
  float32x4_t v149 = 0u;
  float32x4_t v21 = *(float32x4_t *)anon_6b0;
  float32x4_t v22 = *((float32x4_t *)anon_6b0 + 1);
  float32x4_t v23 = *((float32x4_t *)anon_6b0 + 2);
  v24.i64[0] = 0x3F0000003F000000;
  v24.i64[1] = 0x3F0000003F000000;
  while (1)
  {
    float32x4_t v25 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v21, COERCE_FLOAT(v150[v20])), v22, *(float32x2_t *)&v150[v20], 1), v23, (float32x4_t)v150[v20], 2);
    if (v25.f32[2] <= 0.0) {
      break;
    }
    float32x4_t v26 = (float32x4_t)vdupq_laneq_s32((int32x4_t)v25, 2);
    *(&v148 + (v20 & 1)) = vmlaq_f32(*(&v148 + (v20 & 1)), v24, vdivq_f32(v25, v26));
    if (++v20 == 4)
    {
      float32x4_t v129 = v23;
      float32x4_t v130 = v22;
      float32x4_t v131 = v21;
      float32x4_t v27 = vsubq_f32(v149, v148);
      float32x2_t v28 = (float32x2_t)COERCE_UNSIGNED_INT(vaddv_f32((float32x2_t)*(_OWORD *)&vmulq_f32(v27, v27)));
      float32x2_t v29 = vrsqrte_f32(v28);
      float32x2_t v30 = vmul_f32(v29, vrsqrts_f32((float32x2_t)v28.u32[0], vmul_f32(v29, v29)));
      *(float32x2_t *)v27.f32 = vmul_n_f32(*(float32x2_t *)v27.f32, vmul_f32(v30, vrsqrts_f32((float32x2_t)v28.u32[0], vmul_f32(v30, v30))).f32[0]);
      __asm { FMOV            V1.2S, #-1.0 }
      *(float32x2_t *)v27.f32 = vmaxnm_f32(*(float32x2_t *)v27.f32, _D1);
      __asm { FMOV            V1.2S, #1.0 }
      *(float32x2_t *)v22.f32 = vminnm_f32(*(float32x2_t *)v27.f32, _D1);
      *(void *)self->_orientationVector = v22.i64[0];
      float rectificationAngleStep = self->_rectificationAngleStep;
      if (rectificationAngleStep != 0.0)
      {
        float32x4_t v128 = v22;
        *(float *)v38.i32 = rectificationAngleStep * roundf(acosf(v22.f32[0]) / rectificationAngleStep);
        int8x16_t v39 = (int8x16_t)v128;
        v39.i32[0] = v128.i32[1];
        v40.i64[0] = 0x8000000080000000;
        v40.i64[1] = 0x8000000080000000;
        __float2 v41 = __sincosf_stret(*(float *)vbslq_s8(v40, v38, v39).i32);
        v22.i64[0] = __PAIR64__(LODWORD(v41.__sinval), LODWORD(v41.__cosval));
        *(void *)self->_orientationVector = __PAIR64__(LODWORD(v41.__sinval), LODWORD(v41.__cosval));
      }
      uint64_t v42 = 0;
      *(int32x2_t *)v26.f32 = vrev64_s32(*(int32x2_t *)v22.f32);
      v48.i64[0] = 0;
      v48.i32[3] = 0;
      *(float *)&v48.i32[2] = -v22.f32[1];
      float32x4_t v43 = (float32x4_t)v22.u64[0];
      v22.i32[1] = 0;
      int32x4_t v44 = vzip1q_s32((int32x4_t)v22, (int32x4_t)v26);
      float32x4_t v45 = (float32x4_t)vzip2q_s32(v48, vdupq_lane_s32(*(int32x2_t *)v26.f32, 1));
      *(float *)v17.i32 = self->_correctedCalibration.focalLengthPix[0];
      v46.f64[0] = self->_correctedCalibration.opticalCenterX[0];
      v46.f64[1] = self->_correctedCalibration.opticalCenterY[0];
      float32x2_t v47 = vcvt_f32_f64(v46);
      v48.i64[1] = 0;
      *(float *)v48.i32 = 1.0 / *(float *)v17.i32;
      v49.i32[0] = 0;
      v49.i64[1] = 0;
      v49.f32[1] = 1.0 / *(float *)v17.i32;
      *(float32x2_t *)v50.f32 = vdiv_f32(vneg_f32(v47), (float32x2_t)vdup_lane_s32(v17, 0));
      v50.i64[1] = COERCE_UNSIGNED_INT(1.0);
      float32x4_t v51 = (float32x4_t)v17.u32[0];
      int32x4_t v142 = (int32x4_t)COERCE_UNSIGNED_INT(1.0 / *(float *)v17.i32);
      float32x4_t v143 = (float32x4_t)v49.u64[0];
      float32x4_t v144 = v50;
      float32x4_t v145 = 0u;
      float32x4_t v146 = 0u;
      float32x4_t v147 = 0u;
      do
      {
        *(float32x4_t *)((char *)&v145 + v42) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v43, COERCE_FLOAT(*(_OWORD *)((char *)&v142 + v42))), v45, *(float32x2_t *)&v142.i8[v42], 1), (float32x4_t)xmmword_262E89A60, *(float32x4_t *)((char *)&v142 + v42), 2);
        v42 += 16;
      }
      while (v42 != 48);
      uint64_t v52 = 0;
      __asm { FMOV            V6.4S, #1.0 }
      v54.i64[1] = _Q6.i64[1];
      *(float32x2_t *)v54.f32 = v47;
      v55.i32[0] = 0;
      v55.i64[1] = 0;
      v55.i32[1] = v17.i32[0];
      int32x4_t v142 = (int32x4_t)v145;
      float32x4_t v143 = v146;
      float32x4_t v144 = v147;
      float32x4_t v145 = 0u;
      float32x4_t v146 = 0u;
      float32x4_t v147 = 0u;
      do
      {
        *(float32x4_t *)((char *)&v145 + v52) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v17.u32[0], COERCE_FLOAT(*(_OWORD *)((char *)&v142 + v52))), v55, *(float32x2_t *)&v142.i8[v52], 1), v54, *(float32x4_t *)((char *)&v142 + v52), 2);
        v52 += 16;
      }
      while (v52 != 48);
      uint64_t v56 = 0;
      float32x4_t v57 = v145;
      float32x4_t v58 = v146;
      float32x4_t v59 = v147;
      int32x4_t v60 = vdupq_lane_s32(*(int32x2_t *)v45.f32, 1);
      float32x4_t v61 = (float32x4_t)vzip1q_s32(v44, (int32x4_t)v45);
      v61.i32[2] = 0;
      float32x4_t v62 = (float32x4_t)vzip2q_s32(vzip1q_s32(v44, (int32x4_t)0), v60);
      float32x4_t v63 = (float32x4_t)vdupq_laneq_s32(v44, 2);
      v63.i32[1] = 0;
      v63.i32[2] = 1.0;
      int32x4_t v142 = v48;
      float32x4_t v143 = v49;
      float32x4_t v144 = v50;
      float32x4_t v145 = 0u;
      float32x4_t v146 = 0u;
      float32x4_t v147 = 0u;
      do
      {
        *(float32x4_t *)((char *)&v145 + v56) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v61, COERCE_FLOAT(*(_OWORD *)((char *)&v142 + v56))), v62, *(float32x2_t *)&v142.i8[v56], 1), v63, *(float32x4_t *)((char *)&v142 + v56), 2);
        v56 += 16;
      }
      while (v56 != 48);
      uint64_t v64 = 0;
      int32x4_t v142 = (int32x4_t)v145;
      float32x4_t v143 = v146;
      float32x4_t v144 = v147;
      float32x4_t v145 = 0u;
      float32x4_t v146 = 0u;
      float32x4_t v147 = 0u;
      do
      {
        *(float32x4_t *)((char *)&v145 + v64) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v17.u32[0], COERCE_FLOAT(*(_OWORD *)((char *)&v142 + v64))), v55, *(float32x2_t *)&v142.i8[v64], 1), v54, *(float32x4_t *)((char *)&v142 + v64), 2);
        v64 += 16;
      }
      while (v64 != 48);
      uint64_t v65 = 0;
      float32x4_t v66 = v145;
      float32x4_t v67 = v146;
      float32x4_t v68 = v147;
      float32x4_t v69 = *((float32x4_t *)anon_6b0 + 7);
      float32x4_t v70 = *((float32x4_t *)anon_6b0 + 8);
      int32x4_t v142 = *((int32x4_t *)anon_6b0 + 6);
      float32x4_t v143 = v69;
      float32x4_t v144 = v70;
      float32x4_t v145 = 0u;
      float32x4_t v146 = 0u;
      float32x4_t v147 = 0u;
      do
      {
        *(float32x4_t *)((char *)&v145 + v65) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v57, COERCE_FLOAT(*(_OWORD *)((char *)&v142 + v65))), v58, *(float32x2_t *)&v142.i8[v65], 1), v59, *(float32x4_t *)((char *)&v142 + v65), 2);
        v65 += 16;
      }
      while (v65 != 48);
      uint64_t v71 = 0;
      v66.i32[3] = 0;
      v67.i32[3] = 0;
      v68.i32[3] = 0;
      uint64_t v72 = v145.i64[0];
      float32x4_t v73 = v146;
      float32x4_t v74 = v147;
      *((_DWORD *)anon_6b0 + 26) = v145.i32[2];
      *((void *)anon_6b0 + 12) = v72;
      *((_DWORD *)anon_6b0 + 30) = v73.i32[2];
      *((void *)anon_6b0 + 14) = v73.i64[0];
      *((_DWORD *)anon_6b0 + 34) = v74.i32[2];
      *((void *)anon_6b0 + 16) = v74.i64[0];
      int32x4_t v142 = (int32x4_t)v66;
      float32x4_t v143 = v67;
      float32x4_t v144 = v68;
      float32x4_t v145 = 0u;
      float32x4_t v146 = 0u;
      float32x4_t v147 = 0u;
      v75.i32[1] = v129.i32[1];
      do
      {
        *(float32x4_t *)((char *)&v145 + v71) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v131, COERCE_FLOAT(*(_OWORD *)((char *)&v142 + v71))), v130, *(float32x2_t *)&v142.i8[v71], 1), v129, *(float32x4_t *)((char *)&v142 + v71), 2);
        v71 += 16;
      }
      while (v71 != 48);
      uint64_t v76 = 0;
      uint64_t v77 = v145.i64[0];
      float32x4_t v78 = v146;
      float32x4_t v79 = v147;
      *((_DWORD *)anon_6b0 + 2) = v145.i32[2];
      *((_DWORD *)anon_6b0 + 6) = v78.i32[2];
      *(void *)anon_6b0 = v77;
      *((void *)anon_6b0 + 2) = v78.i64[0];
      *((_DWORD *)anon_6b0 + 10) = v79.i32[2];
      *((void *)anon_6b0 + 4) = v79.i64[0];
      float32x4_t v80 = *((float32x4_t *)anon_6b0 + 3);
      float32x4_t v81 = *((float32x4_t *)anon_6b0 + 4);
      float32x4_t v82 = *((float32x4_t *)anon_6b0 + 5);
      int32x4_t v142 = (int32x4_t)v66;
      float32x4_t v143 = v67;
      float32x4_t v144 = v68;
      float32x4_t v145 = 0u;
      float32x4_t v146 = 0u;
      float32x4_t v147 = 0u;
      do
      {
        *(float32x4_t *)((char *)&v145 + v76) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v80, COERCE_FLOAT(*(_OWORD *)((char *)&v142 + v76))), v81, *(float32x2_t *)&v142.i8[v76], 1), v82, *(float32x4_t *)((char *)&v142 + v76), 2);
        v76 += 16;
      }
      while (v76 != 48);
      uint64_t v83 = 0;
      uint64_t v84 = v145.i64[0];
      float32x4_t v85 = v146;
      *((_DWORD *)anon_6b0 + 14) = v145.i32[2];
      float32x4_t v86 = v147;
      *((void *)anon_6b0 + 6) = v84;
      *((_DWORD *)anon_6b0 + 18) = v85.i32[2];
      *((void *)anon_6b0 + 8) = v85.i64[0];
      *((_DWORD *)anon_6b0 + 22) = v86.i32[2];
      *((void *)anon_6b0 + 10) = v86.i64[0];
      float32x4_t v87 = *((float32x4_t *)anon_6b0 + 6);
      float32x4_t v88 = *((float32x4_t *)anon_6b0 + 7);
      float32x2_t v89 = (float32x2_t)vdup_n_s32(0x7F7FFFFFu);
      float32x2_t v90 = (float32x2_t)0x80000000800000;
      float32x4_t v91 = *((float32x4_t *)anon_6b0 + 8);
      while (1)
      {
        int32x4_t v92 = (int32x4_t)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v87, COERCE_FLOAT(v150[v83])), v88, *(float32x2_t *)&v150[v83], 1), v91, (float32x4_t)v150[v83], 2);
        if (*(float *)&v92.i32[2] <= 0.0) {
          break;
        }
        float32x2_t v93 = vdiv_f32(*(float32x2_t *)v92.i8, (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v92, 2));
        float32x2_t v89 = vminnm_f32(v89, v93);
        float32x2_t v90 = vmaxnm_f32(v90, v93);
        if (++v83 == 8)
        {
          uint64_t v94 = 0;
          float32x2_t v95 = vcvt_f32_s32((int32x2_t)self->_pixelBufferDimensions[0]);
          float32x2_t v96 = vdiv_f32(v95, vsub_f32(v90, v89));
          if (v96.f32[0] >= v96.f32[1]) {
            v96.f32[0] = v96.f32[1];
          }
          *(float *)v75.i32 = v96.f32[0] * *(float *)v17.i32;
          v97.i64[1] = _Q6.i64[1];
          *(float32x2_t *)v97.f32 = vmla_n_f32(vmul_f32(v95, (float32x2_t)0x3F0000003F000000), vsub_f32(v47, vmul_f32(vadd_f32(v89, v90), (float32x2_t)0x3F0000003F000000)), v96.f32[0]);
          v98.i32[0] = 0;
          v98.i64[1] = 0;
          v98.i32[1] = v75.i32[0];
          v99.i64[1] = 0;
          *(float32x2_t *)_Q6.f32 = vdiv_f32(vneg_f32(*(float32x2_t *)v97.f32), (float32x2_t)vdup_lane_s32(v75, 0));
          LODWORD(self->_rectificationFocalLengthFactor) = v96.i32[0];
          int32x4_t v142 = v48;
          float32x4_t v143 = v49;
          float32x4_t v144 = v50;
          float32x4_t v145 = 0u;
          float32x4_t v146 = 0u;
          float32x4_t v147 = 0u;
          do
          {
            *(float32x4_t *)((char *)&v145 + v94) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v75.u32[0], COERCE_FLOAT(*(_OWORD *)((char *)&v142 + v94))), v98, *(float32x2_t *)&v142.i8[v94], 1), v97, *(float32x4_t *)((char *)&v142 + v94), 2);
            v94 += 16;
          }
          while (v94 != 48);
          uint64_t v100 = 0;
          LODWORD(v101) = 0;
          *((float *)&v101 + 1) = 1.0 / *(float *)v75.i32;
          _Q6.i32[3] = 0;
          float32x4_t v102 = v145;
          float32x4_t v103 = v146;
          float32x4_t v104 = v147;
          v99.i64[0] = COERCE_UNSIGNED_INT(1.0 / *(float *)v75.i32);
          int32x4_t v142 = v99;
          float32x4_t v143 = (float32x4_t)v101;
          float32x4_t v144 = _Q6;
          float32x4_t v145 = 0u;
          float32x4_t v146 = 0u;
          float32x4_t v147 = 0u;
          do
          {
            *(float32x4_t *)((char *)&v145 + v100) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v51, COERCE_FLOAT(*(_OWORD *)((char *)&v142 + v100))), v55, *(float32x2_t *)&v142.i8[v100], 1), v54, *(float32x4_t *)((char *)&v142 + v100), 2);
            v100 += 16;
          }
          while (v100 != 48);
          uint64_t v105 = 0;
          float32x4_t v106 = v145;
          float32x4_t v107 = v146;
          float32x4_t v108 = v147;
          int32x4_t v142 = (int32x4_t)v87;
          float32x4_t v143 = v88;
          float32x4_t v144 = v91;
          float32x4_t v145 = 0u;
          float32x4_t v146 = 0u;
          float32x4_t v147 = 0u;
          do
          {
            *(float32x4_t *)((char *)&v145 + v105) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v102, COERCE_FLOAT(*(_OWORD *)((char *)&v142 + v105))), v103, *(float32x2_t *)&v142.i8[v105], 1), v104, *(float32x4_t *)((char *)&v142 + v105), 2);
            v105 += 16;
          }
          while (v105 != 48);
          uint64_t v109 = 0;
          v106.i32[3] = 0;
          v107.i32[3] = 0;
          v108.i32[3] = 0;
          uint64_t v110 = v145.i64[0];
          float32x4_t v111 = v146;
          float32x4_t v112 = v147;
          *((_DWORD *)anon_6b0 + 26) = v145.i32[2];
          *((_DWORD *)anon_6b0 + 30) = v111.i32[2];
          *((void *)anon_6b0 + 12) = v110;
          *((void *)anon_6b0 + 14) = v111.i64[0];
          *((_DWORD *)anon_6b0 + 34) = v112.i32[2];
          *((void *)anon_6b0 + 16) = v112.i64[0];
          float32x4_t v113 = *(float32x4_t *)anon_6b0;
          float32x4_t v114 = *((float32x4_t *)anon_6b0 + 1);
          float32x4_t v115 = *((float32x4_t *)anon_6b0 + 2);
          int32x4_t v142 = (int32x4_t)v106;
          float32x4_t v143 = v107;
          float32x4_t v144 = v108;
          float32x4_t v145 = 0u;
          float32x4_t v146 = 0u;
          float32x4_t v147 = 0u;
          do
          {
            *(float32x4_t *)((char *)&v145 + v109) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v113, COERCE_FLOAT(*(_OWORD *)((char *)&v142 + v109))), v114, *(float32x2_t *)&v142.i8[v109], 1), v115, *(float32x4_t *)((char *)&v142 + v109), 2);
            v109 += 16;
          }
          while (v109 != 48);
          uint64_t v116 = 0;
          uint64_t v117 = v145.i64[0];
          float32x4_t v118 = v146;
          float32x4_t v119 = v147;
          *((_DWORD *)anon_6b0 + 2) = v145.i32[2];
          *((_DWORD *)anon_6b0 + 6) = v118.i32[2];
          *(void *)anon_6b0 = v117;
          *((void *)anon_6b0 + 2) = v118.i64[0];
          *((_DWORD *)anon_6b0 + 10) = v119.i32[2];
          *((void *)anon_6b0 + 4) = v119.i64[0];
          float32x4_t v120 = *((float32x4_t *)anon_6b0 + 3);
          float32x4_t v121 = *((float32x4_t *)anon_6b0 + 4);
          float32x4_t v122 = *((float32x4_t *)anon_6b0 + 5);
          int32x4_t v142 = (int32x4_t)v106;
          float32x4_t v143 = v107;
          float32x4_t v144 = v108;
          float32x4_t v145 = 0u;
          float32x4_t v146 = 0u;
          float32x4_t v147 = 0u;
          do
          {
            *(float32x4_t *)((char *)&v145 + v116) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v120, COERCE_FLOAT(*(_OWORD *)((char *)&v142 + v116))), v121, *(float32x2_t *)&v142.i8[v116], 1), v122, *(float32x4_t *)((char *)&v142 + v116), 2);
            v116 += 16;
          }
          while (v116 != 48);
          uint64_t v123 = v145.i64[0];
          float32x4_t v124 = v146;
          float32x4_t v125 = v147;
          *((_DWORD *)anon_6b0 + 14) = v145.i32[2];
          *((_DWORD *)anon_6b0 + 18) = v124.i32[2];
          *((void *)anon_6b0 + 6) = v123;
          *((void *)anon_6b0 + 8) = v124.i64[0];
          *((_DWORD *)anon_6b0 + 22) = v125.i32[2];
          *((void *)anon_6b0 + 10) = v125.i64[0];
          objc_msgSend__computeCanonicalDisparityScaleFactor(self, v12, v13, v14, v15, v16);
          int result = 0;
          self->_correctedCalibration.canonicalDisparityScale = v127;
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
  int v5 = sub_262E81BC4((uint64_t)&self->_initialCalibration, 0, (uint64_t)&v22, (uint64_t)&v19, 0, (uint64_t)&v16, 0);
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