@interface NRFProgressiveBracketingParameters
- (BOOL)recomputeAWBCCM;
- (BOOL)sphereOffsetEnabled;
- (NRFProgressiveBracketingParameters)initWithOptions:(id)a3 portType:(id)a4 statistics:(id)a5 mode:(int)a6 sphereOffsetEnabled:(BOOL)a7;
- (NRFProgressiveBracketingStatistics)statistics;
- (NSDictionary)options;
- (NSString)portType;
- (double)_computeMaxIntegrationTimeWithOptions:(id)a3 statistics:(id)a4;
- (double)_computeTotalIntegrationTimeFromFirstGroupParameters:(id)a3 nextGroupParameters:(id)a4 lastGroupParameters:(id)a5 numberOfGroups:(int)a6;
- (double)_selectBracketsAndComputeExposureTimeWithOption:(id)a3 statistics:(id)a4 getAllInfo:(BOOL)a5 updateDecision:(BOOL)a6 minTotalExposureTime:(double)a7;
- (double)computeTotalIntegrationTimeWithStatistics:(id)a3 forMode:(int)a4;
- (double)totalIntegrationTime;
- (float)_estimateSNRatShutterScale:(float)a3 statistics:(id)a4 rawThumbnail:(float *)a5 thumbnailSorted:(BOOL)a6 clippingThreshold:(float)a7 numBrackets:(int)a8;
- (float)_getGroupExposureTime:(id)a3;
- (float)_getGroupSNR:(id)a3 statistics:(id)a4 rawThumbnail:(float *)a5 thumbnailSorted:(BOOL)a6 snrClippingThreshold:(float)a7;
- (float)evZeroTargetGain;
- (float)evZeroTargetGainWithStatistics:(id)a3 maxNominalEVZeroIntegrationTime:(double)a4;
- (float)previewSNR;
- (id)_lowLightFrameParametersWithStatistics:(id)a3 evRatio:(double)a4 maxEVZeroGain:(float)a5 maxNominalEVZeroIntegrationTime:(double)a6 maxIntegrationTime:(double)a7;
- (id)_truncateGroupParameters:(id)a3 maxTotalExpTime:(float)a4 minNumFrames:(unsigned int)a5;
- (id)currentBracketingParametersForGroup:(int)a3;
- (int)mode;
- (void)_createBracketGroup:(id)a3 statistics:(id)a4 evZeroRatios:(id)a5 maxEVZeroGain:(float)a6 maxNominalEVZeroIntegrationTime:(double)a7 maxIntegrationTime:(double)a8;
- (void)_preprocessThumbnailWithAEThumbnail:(unsigned int *)a3 processedThumbnail:(float *)a4 statistics:(id)a5 thumbSize:(int)a6 bitMask:(unsigned int)a7 bitShift:(int)a8;
@end

@implementation NRFProgressiveBracketingParameters

- (NRFProgressiveBracketingParameters)initWithOptions:(id)a3 portType:(id)a4 statistics:(id)a5 mode:(int)a6 sphereOffsetEnabled:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  v19.receiver = self;
  v19.super_class = (Class)NRFProgressiveBracketingParameters;
  v16 = [(NRFProgressiveBracketingParameters *)&v19 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_options, a3);
    objc_storeStrong((id *)&v17->_portType, a4);
    objc_storeStrong((id *)&v17->_statistics, a5);
    v17->_mode = a6;
    v17->_sphereOffsetEnabled = a7;
  }

  return v17;
}

- (float)evZeroTargetGain
{
  int mode = self->_mode;
  options = self->_options;
  if (mode == 1) {
    v6 = off_2655C3698;
  }
  else {
    v6 = off_2655C3690;
  }
  v7 = objc_msgSend_objectForKeyedSubscript_(options, a2, (uint64_t)*v6, v2);
  v10 = objc_msgSend_objectForKeyedSubscript_(v7, v8, @"MaxNominalEVZeroIntegrationTime", v9);
  objc_msgSend_doubleValue(v10, v11, v12, v13);
  double v15 = v14;

  objc_msgSend_evZeroTargetGainWithStatistics_maxNominalEVZeroIntegrationTime_(self, v16, (uint64_t)self->_statistics, v17, v15);
  LODWORD(v15) = v18;

  return *(float *)&v15;
}

- (float)evZeroTargetGainWithStatistics:(id)a3 maxNominalEVZeroIntegrationTime:(double)a4
{
  id v5 = a3;
  objc_msgSend_aeAverage(v5, v6, v7, v8);
  double v12 = 1.0;
  if (v13 > 0.0)
  {
    objc_msgSend_aeTarget(v5, v9, v10, v11);
    if (v14 > 0.0)
    {
      objc_msgSend_aeTarget(v5, v9, v10, v11);
      float v16 = v15;
      objc_msgSend_aeAverage(v5, v17, v18, v19);
      double v12 = (float)(v16 / v20);
    }
  }
  objc_msgSend_integrationTime(v5, v9, v10, v11);
  if (v24 < a4)
  {
    objc_msgSend_integrationTime(v5, v21, v22, v23);
    a4 = v25;
  }
  objc_msgSend_integrationTime(v5, v21, v22, v23);
  double v27 = v26 / a4;
  objc_msgSend_gain(v5, v28, v29, v30);
  *(float *)&double v27 = v12 * (v27 * v31);

  return *(float *)&v27;
}

- (id)_lowLightFrameParametersWithStatistics:(id)a3 evRatio:(double)a4 maxEVZeroGain:(float)a5 maxNominalEVZeroIntegrationTime:(double)a6 maxIntegrationTime:(double)a7
{
  id v12 = a3;
  objc_msgSend_integrationTime(v12, v13, v14, v15);
  double v19 = a6;
  if (v20 < a6)
  {
    objc_msgSend_integrationTime(v12, v16, v17, v18);
    double v19 = v21;
  }
  objc_msgSend_evZeroTargetGainWithStatistics_maxNominalEVZeroIntegrationTime_(self, v16, (uint64_t)v12, v18, a6);
  if (v24 < a5)
  {
    objc_msgSend_evZeroTargetGainWithStatistics_maxNominalEVZeroIntegrationTime_(self, v22, (uint64_t)v12, v23, a6);
    a5 = v25;
  }
  double v26 = v19 * fminf(a5, 1.0);
  if (a5 >= 1.0) {
    float v27 = a5;
  }
  else {
    float v27 = 1.0;
  }
  double v28 = v26 * a4;
  if (v26 * a4 >= a7) {
    double v28 = a7;
  }
  float v29 = v26 * v27 / v28;
  double v30 = v28 * fminf(v29, 1.0);
  if (v29 >= 1.0) {
    float v31 = v29;
  }
  else {
    float v31 = 1.0;
  }
  v32 = [NRFProgressiveBracketingFrameParameters alloc];
  objc_msgSend_agc(v12, v33, v34, v35);
  *(float *)&double v37 = v31;
  v40 = objc_msgSend_initWithIntegrationTime_gain_AGC_(v32, v38, (int)v36, v39, v30, v37);

  return v40;
}

- (double)_computeTotalIntegrationTimeFromFirstGroupParameters:(id)a3 nextGroupParameters:(id)a4 lastGroupParameters:(id)a5 numberOfGroups:(int)a6
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v54, (uint64_t)v60, 16);
  double v17 = 0.0;
  double v18 = 0.0;
  if (v13)
  {
    uint64_t v19 = v13;
    uint64_t v20 = *(void *)v55;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v55 != v20) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend_integrationTime(*(void **)(*((void *)&v54 + 1) + 8 * v21), v14, v15, v16);
        double v18 = v18 + v22;
        ++v21;
      }
      while (v19 != v21);
      uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v14, (uint64_t)&v54, (uint64_t)v60, 16);
    }
    while (v19);
  }
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v23 = v10;
  uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v50, (uint64_t)v59, 16);
  if (v25)
  {
    uint64_t v29 = v25;
    uint64_t v30 = *(void *)v51;
    double v17 = 0.0;
    do
    {
      uint64_t v31 = 0;
      do
      {
        if (*(void *)v51 != v30) {
          objc_enumerationMutation(v23);
        }
        objc_msgSend_integrationTime(*(void **)(*((void *)&v50 + 1) + 8 * v31), v26, v27, v28);
        double v17 = v17 + v32;
        ++v31;
      }
      while (v29 != v31);
      uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v26, (uint64_t)&v50, (uint64_t)v59, 16);
    }
    while (v29);
  }

  if (v11) {
    int v33 = -2;
  }
  else {
    int v33 = -1;
  }
  long long v48 = 0u;
  long long v49 = 0u;
  double v34 = v18 + (double)(v33 + a6) * v17;
  long long v46 = 0u;
  long long v47 = 0u;
  id v35 = v11;
  uint64_t v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v36, (uint64_t)&v46, (uint64_t)v58, 16);
  if (v37)
  {
    uint64_t v41 = v37;
    uint64_t v42 = *(void *)v47;
    do
    {
      uint64_t v43 = 0;
      do
      {
        if (*(void *)v47 != v42) {
          objc_enumerationMutation(v35);
        }
        objc_msgSend_integrationTime(*(void **)(*((void *)&v46 + 1) + 8 * v43), v38, v39, v40, (void)v46);
        double v34 = v34 + v44;
        ++v43;
      }
      while (v41 != v43);
      uint64_t v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v38, (uint64_t)&v46, (uint64_t)v58, 16);
    }
    while (v41);
  }

  return v34;
}

- (double)computeTotalIntegrationTimeWithStatistics:(id)a3 forMode:(int)a4
{
  id v8 = a3;
  if (a4 == 1)
  {
    uint64_t v13 = objc_msgSend_objectForKeyedSubscript_(self->_options, v6, @"MinMode", v7);
    objc_msgSend__selectBracketsAndComputeExposureTimeWithOption_statistics_getAllInfo_updateDecision_minTotalExposureTime_(self, v14, (uint64_t)v13, (uint64_t)v8, 0, 0, 0.0);
    double v16 = v15;

    id v10 = objc_msgSend_objectForKeyedSubscript_(self->_options, v17, @"MaxMode", v18);
    objc_msgSend__selectBracketsAndComputeExposureTimeWithOption_statistics_getAllInfo_updateDecision_minTotalExposureTime_(self, v19, (uint64_t)v10, (uint64_t)v8, 0, 0, v16 + 1.0);
    goto LABEL_5;
  }
  double v9 = 0.0;
  if (!a4)
  {
    id v10 = objc_msgSend_objectForKeyedSubscript_(self->_options, v6, @"MinMode", v7);
    objc_msgSend__selectBracketsAndComputeExposureTimeWithOption_statistics_getAllInfo_updateDecision_minTotalExposureTime_(self, v11, (uint64_t)v10, (uint64_t)v8, 0, 0, 0.0);
LABEL_5:
    double v9 = v12;
  }
  return v9;
}

- (double)_computeMaxIntegrationTimeWithOptions:(id)a3 statistics:(id)a4
{
  uint64_t v103 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  double v9 = objc_msgSend_objectForKeyedSubscript_(v5, v7, @"MaxIntegrationTime", v8);
  objc_msgSend_doubleValue(v9, v10, v11, v12);
  double v14 = v13;

  if ((objc_msgSend_stationary(v6, v15, v16, v17) & 1) == 0)
  {
    uint64_t v20 = objc_msgSend_objectForKeyedSubscript_(v5, v18, @"MotionDataBiasErrorThresholdToCapIntegrationTime", v19);
    id v23 = objc_msgSend_objectForKeyedSubscript_(v5, v21, @"MotionDataBiasErrorBasedIntegrationTimeCap", v22);
    objc_msgSend_motionDataBiasErrorEstimate(v6, v24, v25, v26);
    float v28 = v27;
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      long long v100 = 0u;
      long long v101 = 0u;
      long long v98 = 0u;
      long long v99 = 0u;
      v97 = v20;
      id v29 = v20;
      uint64_t v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v30, (uint64_t)&v98, (uint64_t)v102, 16);
      if (v31)
      {
        uint64_t v35 = v31;
        int v36 = 0;
        uint64_t v37 = *(void *)v99;
        float v38 = 0.0;
        double v39 = v14;
        do
        {
          uint64_t v40 = 0;
          uint64_t v41 = v36;
          do
          {
            if (*(void *)v99 != v37) {
              objc_enumerationMutation(v29);
            }
            objc_msgSend_floatValue(*(void **)(*((void *)&v98 + 1) + 8 * v40), v32, v33, v34);
            if (v28 > v42 && v42 > v38)
            {
              float v44 = v42;
              v45 = objc_msgSend_objectAtIndexedSubscript_(v23, v32, v41 + v40, v34);
              objc_msgSend_doubleValue(v45, v46, v47, v48);
              double v39 = v14;
              if (v51 < v14)
              {
                long long v52 = objc_msgSend_objectAtIndexedSubscript_(v23, v49, v41 + v40, v50);
                objc_msgSend_doubleValue(v52, v53, v54, v55);
                double v39 = v56;
              }
              float v38 = v44;
            }
            ++v40;
          }
          while (v35 != v40);
          uint64_t v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v32, (uint64_t)&v98, (uint64_t)v102, 16);
          int v36 = v41 + v40;
        }
        while (v35);
      }
      else
      {
        double v39 = v14;
      }

      double v14 = v39;
      uint64_t v20 = v97;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_msgSend_floatValue(v20, v57, v59, v58);
          if (v28 > v61)
          {
            objc_msgSend_doubleValue(v23, v57, v60, v58);
            if (v63 < v14)
            {
              objc_msgSend_doubleValue(v23, v57, v62, v58);
              double v14 = v64;
            }
          }
        }
      }
    }
    v65 = objc_msgSend_objectForKeyedSubscript_(v5, v57, @"Handheld", v58);
    uint64_t v68 = objc_msgSend_objectForKeyedSubscript_(v65, v66, @"MaxIntegrationTimeForHuman", v67);
    if (v68)
    {
      v72 = (void *)v68;
      if ((int)objc_msgSend_numberOfHumanBodies(v6, v69, v70, v71) <= 0)
      {
        int v78 = objc_msgSend_numberOfHumanFaces(v6, v73, v74, v75);

        if (v78 <= 0)
        {
LABEL_34:

          goto LABEL_35;
        }
      }
      else
      {
      }
      v65 = objc_msgSend_objectForKeyedSubscript_(v5, v76, @"Handheld", v77);
      v81 = objc_msgSend_objectForKeyedSubscript_(v65, v79, @"MaxIntegrationTimeForHuman", v80);
      objc_msgSend_doubleValue(v81, v82, v83, v84);
      if (v14 >= v87)
      {
        v88 = objc_msgSend_objectForKeyedSubscript_(v5, v85, @"Handheld", v86);
        v91 = objc_msgSend_objectForKeyedSubscript_(v88, v89, @"MaxIntegrationTimeForHuman", v90);
        objc_msgSend_doubleValue(v91, v92, v93, v94);
        double v14 = v95;
      }
    }

    goto LABEL_34;
  }
LABEL_35:

  return v14;
}

- (double)_selectBracketsAndComputeExposureTimeWithOption:(id)a3 statistics:(id)a4 getAllInfo:(BOOL)a5 updateDecision:(BOOL)a6 minTotalExposureTime:(double)a7
{
  BOOL v342 = a6;
  BOOL v340 = a5;
  uint64_t v383 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  double v13 = objc_msgSend_objectForKeyedSubscript_(v9, v11, @"SNRClippingThreshold", v12);
  objc_msgSend_floatValue(v13, v14, v15, v16);
  int v345 = v17;

  uint64_t v20 = objc_msgSend_objectForKeyedSubscript_(v9, v18, @"MotionAEThreshold", v19);
  objc_msgSend_floatValue(v20, v21, v22, v23);
  float v25 = v24;

  float v28 = objc_msgSend_objectForKeyedSubscript_(v9, v26, @"UseShorterBracketsForHuman", v27);
  int v341 = objc_msgSend_BOOLValue(v28, v29, v30, v31);

  double v32 = [GainValueArray alloc];
  uint64_t v35 = objc_msgSend_objectForKeyedSubscript_(v9, v33, @"MinAGC", v34);
  uint64_t v38 = objc_msgSend_initWithArray_(v32, v36, (uint64_t)v35, v37);

  objc_msgSend_gain(v10, v39, v40, v41);
  v344 = (void *)v38;
  float v43 = sub_262FCDA18(v38, v42);
  long long v46 = objc_msgSend_objectForKeyedSubscript_(v9, v44, @"PreviewIntegrationTimeThresholdToCapNumOfFrames", v45);
  objc_msgSend_doubleValue(v46, v47, v48, v49);
  double v51 = v50;

  uint64_t v54 = objc_msgSend_objectForKeyedSubscript_(v9, v52, @"PreviewIntegrationTimeBasedNumberOfFramesCap", v53);
  unsigned int v339 = objc_msgSend_intValue(v54, v55, v56, v57);

  uint64_t v60 = objc_msgSend_objectForKeyedSubscript_(v9, v58, @"MaxNominalEVZeroIntegrationTime", v59);
  objc_msgSend_doubleValue(v60, v61, v62, v63);
  double v65 = v64;

  objc_msgSend__computeMaxIntegrationTimeWithOptions_statistics_(self, v66, (uint64_t)v9, (uint64_t)v10);
  double v68 = v67;
  if (objc_msgSend_stationary(v10, v69, v70, v71)) {
    uint64_t v74 = off_2655C36A8;
  }
  else {
    uint64_t v74 = off_2655C36A0;
  }
  uint64_t v75 = (uint64_t)*v74;
  v76 = objc_msgSend_objectForKeyedSubscript_(v9, v72, (uint64_t)*v74, v73);
  v79 = objc_msgSend_objectForKeyedSubscript_(v76, v77, @"BracketGroupTable", v78);

  v82 = objc_msgSend_objectForKeyedSubscript_(v9, v80, v75, v81);
  v85 = objc_msgSend_objectForKeyedSubscript_(v82, v83, @"MaxTotalExposureTime", v84);
  objc_msgSend_floatValue(v85, v86, v87, v88);
  float v90 = v89;

  v91 = [GainValueArray alloc];
  uint64_t v94 = objc_msgSend_objectForKeyedSubscript_(v9, v92, v75, v93);
  v97 = objc_msgSend_objectForKeyedSubscript_(v94, v95, @"MinTotalSNRBound", v96);
  long long v100 = objc_msgSend_initWithArray_(v91, v98, (uint64_t)v97, v99);

  objc_msgSend_gain(v10, v101, v102, v103);
  float v105 = sub_262FCDA18((uint64_t)v100, v104);
  float v106 = __exp10f(v105 / 10.0);
  v109 = objc_msgSend_objectForKeyedSubscript_(v9, v107, (uint64_t)*v74, v108);
  v112 = objc_msgSend_objectForKeyedSubscript_(v109, v110, @"MaxEVZeroGain", v111);
  objc_msgSend_floatValue(v112, v113, v114, v115);
  int v117 = v116;

  v362 = objc_msgSend_array(MEMORY[0x263EFF980], v118, v119, v120);
  v361 = objc_msgSend_array(MEMORY[0x263EFF980], v121, v122, v123);
  size_t v127 = objc_msgSend_count(v79, v124, v125, v126);
  v131 = (char *)malloc_type_calloc(v127, 4uLL, 0x100004052888210uLL);
  v350 = v131;
  if (!v131)
  {
    FigDebugAssert3();
    v215 = 0;
    v187 = 0;
    double v216 = -1.0;
    v217 = v344;
    goto LABEL_111;
  }
  v343 = v100;
  v359 = self;
  v360 = v10;
  v349 = v9;
  unsigned int v346 = objc_msgSend_count(v79, v128, v129, v130);
  v348 = v79;
  long long v375 = 0u;
  long long v376 = 0u;
  long long v377 = 0u;
  long long v378 = 0u;
  obuint64_t j = v79;
  uint64_t v133 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v132, (uint64_t)&v375, (uint64_t)v382, 16);
  if (v133)
  {
    uint64_t v136 = v133;
    int v137 = 0;
    id v357 = *(id *)v376;
    do
    {
      uint64_t v138 = 0;
      int size = v137;
      v139 = &v131[4 * v137];
      do
      {
        if (*(id *)v376 != v357) {
          objc_enumerationMutation(obj);
        }
        v140 = *(void **)(*((void *)&v375 + 1) + 8 * v138);
        v141 = objc_msgSend_objectForKeyedSubscript_(v140, v134, @"SNRBound", v135);
        objc_msgSend_floatValue(v141, v142, v143, v144);
        *(_DWORD *)&v139[4 * v138] = v145;

        v149 = objc_msgSend_array(MEMORY[0x263EFF980], v146, v147, v148);
        v152 = objc_msgSend_objectForKeyedSubscript_(v140, v150, @"FirstGroupEV0Ratios", v151);
        LODWORD(v153) = v117;
        objc_msgSend__createBracketGroup_statistics_evZeroRatios_maxEVZeroGain_maxNominalEVZeroIntegrationTime_maxIntegrationTime_(v359, v154, (uint64_t)v149, (uint64_t)v360, v152, v153, v65, v68);

        objc_msgSend_addObject_(v362, v155, (uint64_t)v149, v156);
        v160 = objc_msgSend_array(MEMORY[0x263EFF980], v157, v158, v159);
        v163 = objc_msgSend_objectForKeyedSubscript_(v140, v161, @"NextGroupEV0Ratios", v162);
        LODWORD(v164) = v117;
        objc_msgSend__createBracketGroup_statistics_evZeroRatios_maxEVZeroGain_maxNominalEVZeroIntegrationTime_maxIntegrationTime_(v359, v165, (uint64_t)v160, (uint64_t)v360, v163, v164, v65, v68);

        objc_msgSend_addObject_(v361, v166, (uint64_t)v160, v167);
        ++v138;
      }
      while (v136 != v138);
      uint64_t v136 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v134, (uint64_t)&v375, (uint64_t)v382, 16);
      v131 = v350;
      int v137 = size + v138;
    }
    while (v136);
  }
  int v168 = (int)v43;

  id v10 = v360;
  objc_msgSend_aeThumbnail(v360, v169, v170, v171);
  id v172 = objc_claimAutoreleasedReturnValue();
  uint64_t v176 = objc_msgSend_bytes(v172, v173, v174, v175);

  int v180 = objc_msgSend_aeThumbnailWidth(v360, v177, v178, v179);
  int v184 = objc_msgSend_aeThumbnailHeight(v360, v181, v182, v183);
  if (v176)
  {
    v185 = v359;
    v79 = v348;
    if (v346)
    {
      int v186 = v184;
      v187 = (char *)malloc_type_malloc(4 * v346, 0x100004052888210uLL);
      if (v187)
      {
        unint64_t v188 = (v186 * v180);
        v189 = (int *)malloc_type_malloc(8 * v346, 0x100004000313F17uLL);
        v190 = v189;
        uint64_t v191 = 0;
        v192 = v189 + 1;
        do
        {
          *(v192 - 1) = *(_DWORD *)&v131[4 * v191];
          _DWORD *v192 = v191;
          v192 += 2;
          ++v191;
        }
        while (v346 != v191);
        qsort(v189, v346, 8uLL, (int (__cdecl *)(const void *, const void *))sub_262FE5BC0);
        uint64_t v193 = 0;
        v194 = v190 + 1;
        do
        {
          *(_DWORD *)&v131[v193] = *(v194 - 1);
          int v195 = *v194;
          v194 += 2;
          *(_DWORD *)&v187[v193] = v195;
          v193 += 4;
        }
        while (4 * v346 != v193);
        free(v190);
        uint64_t sizea = 4 * v188;
        v196 = malloc_type_malloc(sizea, 0x100004052888210uLL);
        objc_msgSend__preprocessThumbnailWithAEThumbnail_processedThumbnail_statistics_thumbSize_bitMask_bitShift_(v359, v197, v176, (uint64_t)v196, v360, v188, 1047552, 10);
        objc_msgSend_integrationTime(v360, v198, v199, v200);
        double v205 = 1.0;
        if (v204 > v65)
        {
          objc_msgSend_integrationTime(v360, v201, v202, v203);
          double v205 = v65 / v204;
        }
        float v206 = v205;
        *(float *)&double v204 = v206;
        v356 = v196;
        LODWORD(v205) = v345;
        objc_msgSend__estimateSNRatShutterScale_statistics_rawThumbnail_thumbnailSorted_clippingThreshold_numBrackets_(v359, v201, (uint64_t)v360, (uint64_t)v196, 0, 1, v204, v205);
        uint64_t v208 = 0;
        float v211 = logf(fmaxf(v207, 1.0e-20)) * 4.34;
        if (v346 <= 1) {
          uint64_t v212 = 1;
        }
        else {
          uint64_t v212 = v346;
        }
        id obja = (id)v188;
        uint64_t v355 = v176;
        while (*(float *)&v131[4 * v208] >= v211)
        {
          if (v212 == ++v208)
          {
            int v213 = v168;
            LODWORD(v208) = 0;
            goto LABEL_31;
          }
        }
        int v213 = v168;
LABEL_31:
        objc_msgSend_objectAtIndexedSubscript_(v362, v209, *(unsigned int *)&v187[4 * v208], v210);
        v131 = (char *)objc_claimAutoreleasedReturnValue();
        v220 = objc_msgSend_objectAtIndexedSubscript_(v361, v218, *(unsigned int *)&v187[4 * v208], v219);
        BOOL v227 = v25 < (float)(int)objc_msgSend_motionFromAEMatrix(v360, v221, v222, v223);
        if (v341
          && ((int)objc_msgSend_numberOfHumanBodies(v360, v224, v225, v226) > 0
           || (int)objc_msgSend_numberOfHumanFaces(v360, v224, v225, v226) >= 1))
        {
          BOOL v227 = 1;
        }
        if (v208 && v227)
        {
          int v228 = v208 - 1;
          uint64_t v229 = objc_msgSend_objectAtIndexedSubscript_(v362, v224, *(unsigned int *)&v187[4 * (v208 - 1)], v226);

          uint64_t v232 = objc_msgSend_objectAtIndexedSubscript_(v361, v230, *(unsigned int *)&v187[4 * v228], v231);

          v131 = (char *)v229;
        }
        else
        {
          uint64_t v232 = (uint64_t)v220;
        }
        objc_msgSend_integrationTime(v360, v224, v225, v226);
        int v168 = v213;
        if (v236 < v51)
        {
          unint64_t v237 = objc_msgSend_count(v131, v233, v234, v235);
          if (v339 <= 4) {
            unint64_t v240 = 4;
          }
          else {
            unint64_t v240 = v339;
          }
          if (v237 < v240) {
            unint64_t v240 = objc_msgSend_count(v131, v238, v239, v240);
          }
          uint64_t v241 = objc_msgSend_subarrayWithRange_(v131, v238, 0, v240);

          v215 = 0;
          uint64_t v176 = 1;
          v131 = (char *)v241;
          BOOL v243 = v340;
          goto LABEL_68;
        }
        objc_msgSend__getGroupExposureTime_(v359, v233, (uint64_t)v131, v235);
        float v245 = v244;
        objc_msgSend__getGroupExposureTime_(v359, v246, v232, v247);
        float v250 = *(float *)&v249;
        if (v245 <= v90)
        {
          LODWORD(v249) = v345;
          objc_msgSend__getGroupSNR_statistics_rawThumbnail_thumbnailSorted_snrClippingThreshold_(v359, v248, (uint64_t)v131, (uint64_t)v360, v356, 1, v249);
          float v254 = v253;
          LODWORD(v255) = v345;
          objc_msgSend__getGroupSNR_statistics_rawThumbnail_thumbnailSorted_snrClippingThreshold_(v359, v256, v232, (uint64_t)v360, v356, 1, v255);
          float v259 = floorf((float)(v90 - v245) / v250);
          if (v259 < 0.0) {
            float v259 = 0.0;
          }
          int v260 = (int)v259;
          if (v258 < 0.0001) {
            float v258 = 0.0001;
          }
          int v261 = llroundf((float)(v106 - v254) / v258);
          if (v260 >= v261) {
            int v262 = v261;
          }
          else {
            int v262 = (int)v259;
          }
          if (v261 >= 0) {
            uint64_t v176 = (v262 + 1);
          }
          else {
            uint64_t v176 = 1;
          }
          if (v261 <= v260)
          {
            v215 = 0;
            double v252 = a7;
            objc_msgSend__computeTotalIntegrationTimeFromFirstGroupParameters_nextGroupParameters_lastGroupParameters_numberOfGroups_(v359, v257, (uint64_t)v131, v232, 0, v176);
            goto LABEL_64;
          }
          objc_msgSend__computeTotalIntegrationTimeFromFirstGroupParameters_nextGroupParameters_lastGroupParameters_numberOfGroups_(v359, v257, (uint64_t)v131, v232, 0, v176);
          *(float *)&double v263 = v263;
          *(float *)&double v263 = (float)((float)(floorf(v90) + 0.5) + -0.0001) - *(float *)&v263;
          objc_msgSend__truncateGroupParameters_maxTotalExpTime_minNumFrames_(v359, v264, v232, 0, v263);
          id v251 = (id)objc_claimAutoreleasedReturnValue();
          double v252 = a7;
          if (objc_msgSend_count(v251, v265, v266, v267))
          {
            uint64_t v176 = (v176 + 1);
            id v251 = v251;
            v215 = v251;
          }
          else
          {
            v215 = 0;
          }
        }
        else
        {
          *(float *)&double v249 = floorf(v90) + 0.5;
          objc_msgSend__truncateGroupParameters_maxTotalExpTime_minNumFrames_(v359, v248, (uint64_t)v131, 3, v249);
          v215 = 0;
          id v251 = v131;
          uint64_t v176 = 1;
          v131 = (char *)objc_claimAutoreleasedReturnValue();
          double v252 = a7;
        }

        objc_msgSend__computeTotalIntegrationTimeFromFirstGroupParameters_nextGroupParameters_lastGroupParameters_numberOfGroups_(v359, v269, (uint64_t)v131, v232, v215, v176);
LABEL_64:
        BOOL v243 = v340;
        if (v268 < v252)
        {
          double v270 = ceil((v252 - v268) / v250);
          if (v270 < 1.0) {
            double v270 = 1.0;
          }
          uint64_t v176 = (v176 + (int)v270);
        }
LABEL_68:
        v358 = (char *)v232;
        objc_msgSend__computeTotalIntegrationTimeFromFirstGroupParameters_nextGroupParameters_lastGroupParameters_numberOfGroups_(v359, v242, (uint64_t)v131, v232, v215, v176);
        double v216 = v271;
        if (v243)
        {
          int v347 = v176;
          long long v373 = 0u;
          long long v374 = 0u;
          if (v168 >= 8) {
            int v272 = 8;
          }
          else {
            int v272 = v168;
          }
          long long v371 = 0uLL;
          long long v372 = 0uLL;
          v273 = v131;
          uint64_t v275 = objc_msgSend_countByEnumeratingWithState_objects_count_(v273, v274, (uint64_t)&v371, (uint64_t)v381, 16);
          if (v275)
          {
            uint64_t v279 = v275;
            uint64_t v280 = *(void *)v372;
            do
            {
              for (uint64_t i = 0; i != v279; ++i)
              {
                if (*(void *)v372 != v280) {
                  objc_enumerationMutation(v273);
                }
                v282 = *(void **)(*((void *)&v371 + 1) + 8 * i);
                objc_msgSend_gain(v282, v276, v277, v278);
                BOOL v286 = *(float *)&v287 <= (float)v272;
                *(float *)&double v287 = (float)v272;
                if (v286) {
                  objc_msgSend_gain(v282, v283, v284, v285, v287);
                }
                objc_msgSend_setAGC_(v282, v283, (int)*(float *)&v287, v285);
              }
              uint64_t v279 = objc_msgSend_countByEnumeratingWithState_objects_count_(v273, v276, (uint64_t)&v371, (uint64_t)v381, 16);
            }
            while (v279);
          }

          long long v369 = 0u;
          long long v370 = 0u;
          long long v367 = 0u;
          long long v368 = 0u;
          v288 = v358;
          uint64_t v290 = objc_msgSend_countByEnumeratingWithState_objects_count_(v288, v289, (uint64_t)&v367, (uint64_t)v380, 16);
          if (v290)
          {
            uint64_t v294 = v290;
            uint64_t v295 = *(void *)v368;
            do
            {
              for (uint64_t j = 0; j != v294; ++j)
              {
                if (*(void *)v368 != v295) {
                  objc_enumerationMutation(v288);
                }
                v297 = *(void **)(*((void *)&v367 + 1) + 8 * j);
                objc_msgSend_gain(v297, v291, v292, v293);
                BOOL v286 = *(float *)&v301 <= (float)v272;
                *(float *)&double v301 = (float)v272;
                if (v286) {
                  objc_msgSend_gain(v297, v298, v299, v300, v301);
                }
                objc_msgSend_setAGC_(v297, v298, (int)*(float *)&v301, v300);
              }
              uint64_t v294 = objc_msgSend_countByEnumeratingWithState_objects_count_(v288, v291, (uint64_t)&v367, (uint64_t)v380, 16);
            }
            while (v294);
          }

          long long v365 = 0u;
          long long v366 = 0u;
          long long v363 = 0u;
          long long v364 = 0u;
          id v302 = v215;
          uint64_t v304 = objc_msgSend_countByEnumeratingWithState_objects_count_(v302, v303, (uint64_t)&v363, (uint64_t)v379, 16);
          if (v304)
          {
            uint64_t v308 = v304;
            uint64_t v309 = *(void *)v364;
            do
            {
              for (uint64_t k = 0; k != v308; ++k)
              {
                if (*(void *)v364 != v309) {
                  objc_enumerationMutation(v302);
                }
                v311 = *(void **)(*((void *)&v363 + 1) + 8 * k);
                objc_msgSend_gain(v311, v305, v306, v307);
                BOOL v286 = *(float *)&v315 <= (float)v272;
                *(float *)&double v315 = (float)v272;
                if (v286) {
                  objc_msgSend_gain(v311, v312, v313, v314, v315);
                }
                objc_msgSend_setAGC_(v311, v312, (int)*(float *)&v315, v314);
              }
              uint64_t v308 = objc_msgSend_countByEnumeratingWithState_objects_count_(v302, v305, (uint64_t)&v363, (uint64_t)v379, 16);
            }
            while (v308);
          }

          v318 = objc_msgSend_objectForKeyedSubscript_(v349, v316, @"SNRThresholdToRecomputeAWBCCM", v317);
          objc_msgSend_floatValue(v318, v319, v320, v321);
          float v323 = __exp10f(v322 / 10.0);

          v324 = malloc_type_malloc(sizea, 0x100004052888210uLL);
          v185 = v359;
          id v10 = v360;
          objc_msgSend__preprocessThumbnailWithAEThumbnail_processedThumbnail_statistics_thumbSize_bitMask_bitShift_(v359, v325, v355, (uint64_t)v324, v360, obja, 1023, 0);
          v326 = malloc_type_malloc(sizea, 0x100004052888210uLL);
          objc_msgSend__preprocessThumbnailWithAEThumbnail_processedThumbnail_statistics_thumbSize_bitMask_bitShift_(v359, v327, v355, (uint64_t)v326, v360, obja, 1072693248, 20);
          *(float *)&double v328 = v206;
          LODWORD(v329) = v345;
          objc_msgSend__estimateSNRatShutterScale_statistics_rawThumbnail_thumbnailSorted_clippingThreshold_numBrackets_(v359, v330, (uint64_t)v360, (uint64_t)v324, 0, 1, v328, v329);
          float v332 = v331;
          *(float *)&double v333 = v206;
          LODWORD(v334) = v345;
          objc_msgSend__estimateSNRatShutterScale_statistics_rawThumbnail_thumbnailSorted_clippingThreshold_numBrackets_(v359, v335, (uint64_t)v360, (uint64_t)v326, 0, 1, v333, v334);
          if (v332 < v336) {
            float v336 = v332;
          }
          if (v336 >= v211) {
            float v336 = v211;
          }
          BOOL v214 = v336 < v323;
          free(v324);
          free(v326);
          v79 = v348;
          LODWORD(v176) = v347;
        }
        else
        {
          BOOL v214 = 0;
        }
        free(v356);
        free(v187);
        v217 = v344;
        if (v342) {
          goto LABEL_109;
        }
        goto LABEL_29;
      }
      FigDebugAssert3();
      v215 = 0;
    }
    else
    {
      FigDebugAssert3();
      v215 = 0;
      v187 = 0;
    }
    v131 = 0;
    double v216 = -1.0;
    id v9 = v349;
    v217 = v344;
    goto LABEL_110;
  }
  BOOL v214 = 0;
  v215 = 0;
  v358 = 0;
  v131 = 0;
  float v211 = 0.0;
  double v216 = 0.0;
  v217 = v344;
  v185 = v359;
  v79 = v348;
  if (v342)
  {
LABEL_109:
    objc_storeStrong((id *)&v185->_firstGroupParameters, v131);
    v187 = v358;
    objc_storeStrong((id *)&v185->_nextGroupParameters, v358);
    objc_storeStrong((id *)&v185->_lastGroupParameters, v215);
    v185->_numberOfGroups = v176;
    v185->_minAGC = v168;
    v185->_previewSNR = v211;
    v185->_recomputeAWBCCM = v214;
    id v9 = v349;
LABEL_110:
    long long v100 = v343;
    goto LABEL_111;
  }
LABEL_29:
  id v9 = v349;
  long long v100 = v343;
  v187 = v358;
LABEL_111:
  free(v350);

  return v216;
}

- (id)currentBracketingParametersForGroup:(int)a3
{
  if (a3 == 1)
  {
    int mode = self->_mode;
    if (mode == 1)
    {
      uint64_t v12 = objc_msgSend_objectForKeyedSubscript_(self->_options, a2, @"MinMode", v3);
      objc_msgSend__selectBracketsAndComputeExposureTimeWithOption_statistics_getAllInfo_updateDecision_minTotalExposureTime_(self, v13, (uint64_t)v12, (uint64_t)self->_statistics, 0, 0, 0.0);
      self->_totalIntegrationTime = v14;

      id v6 = objc_msgSend_objectForKeyedSubscript_(self->_options, v15, @"MaxMode", v16);
      objc_msgSend__selectBracketsAndComputeExposureTimeWithOption_statistics_getAllInfo_updateDecision_minTotalExposureTime_(self, v17, (uint64_t)v6, (uint64_t)self->_statistics, 1, 1, self->_totalIntegrationTime + 1.0);
    }
    else
    {
      if (mode)
      {
LABEL_11:
        uint64_t v18 = 8;
        goto LABEL_13;
      }
      id v6 = objc_msgSend_objectForKeyedSubscript_(self->_options, a2, @"MinMode", v3);
      objc_msgSend__selectBracketsAndComputeExposureTimeWithOption_statistics_getAllInfo_updateDecision_minTotalExposureTime_(self, v7, (uint64_t)v6, (uint64_t)self->_statistics, 1, 1, 0.0);
    }
    self->_totalIntegrationTime = v8;

    goto LABEL_11;
  }
  int numberOfGroups = self->_numberOfGroups;
  if (numberOfGroups == a3)
  {
    lastGroupParameters = self->_lastGroupParameters;
    if (lastGroupParameters) {
      goto LABEL_14;
    }
  }
  if (numberOfGroups < a3)
  {
    uint64_t v11 = (NSArray *)MEMORY[0x263EFFA68];
    goto LABEL_15;
  }
  uint64_t v18 = 16;
LABEL_13:
  lastGroupParameters = *(NSArray **)((char *)&self->super.isa + v18);
LABEL_14:
  uint64_t v11 = lastGroupParameters;
LABEL_15:

  return v11;
}

- (float)_estimateSNRatShutterScale:(float)a3 statistics:(id)a4 rawThumbnail:(float *)a5 thumbnailSorted:(BOOL)a6 clippingThreshold:(float)a7 numBrackets:(int)a8
{
  id v12 = a4;
  objc_msgSend_readNoise_1x(v12, v13, v14, v15);
  float v104 = v16;
  objc_msgSend_readNoise_1x(v12, v17, v18, v19);
  float v103 = v20;
  objc_msgSend_readNoise_8x(v12, v21, v22, v23);
  float v102 = v24;
  objc_msgSend_readNoise_8x(v12, v25, v26, v27);
  float v100 = v28;
  objc_msgSend_readNoise_1x(v12, v29, v30, v31);
  float v101 = v32;
  objc_msgSend_readNoise_1x(v12, v33, v34, v35);
  float v99 = v36;
  objc_msgSend_readNoise_8x(v12, v37, v38, v39);
  float v41 = v40;
  objc_msgSend_readNoise_8x(v12, v42, v43, v44);
  float v46 = v45;
  objc_msgSend_conversionGain(v12, v47, v48, v49);
  float v51 = v50;
  objc_msgSend_agc(v12, v52, v53, v54);
  float v56 = v55;
  objc_msgSend_agc(v12, v57, v58, v59);
  float v61 = v60;
  objc_msgSend_agc(v12, v62, v63, v64);
  float v66 = v65;
  objc_msgSend_ispDGain(v12, v67, v68, v69);
  float v71 = v70;
  int v75 = objc_msgSend_aeThumbnailWidth(v12, v72, v73, v74);
  size_t v82 = objc_msgSend_aeThumbnailHeight(v12, v76, v77, v78) * v75;
  if ((v82 & 0x80000000) == 0) {
    int v83 = v82;
  }
  else {
    int v83 = v82 + 1;
  }
  if (!a6) {
    qsort(a5, v82, 4uLL, (int (__cdecl *)(const void *, const void *))sub_262FE5BDC);
  }
  int v84 = v83 >> 1;
  if ((int)v82 < 1)
  {
    int v86 = 0;
    float v91 = 0.0;
    float v90 = 0.0;
  }
  else
  {
    uint64_t v85 = 0;
    int v86 = 0;
    float v87 = (float)(v51 / 1023.0) * v66;
    float v88 = a3 * a3;
    float v89 = (float)((float)(v51 / 1023.0)
                * (float)((float)(v51 / 1023.0)
                        * (float)((float)((float)((float)(v41 * v46) * -1.0159) + (float)((float)(v101 * v99) * 1.0159))
                                + (float)((float)((float)((float)(v102 * v100) * 1.0159)
                                                + (float)((float)(v104 * v103) * -0.0159))
                                        * (float)(v56 * v61)))))
        * (float)a8;
    float v90 = 0.0;
    float v91 = 0.0;
    do
    {
      float v92 = a5[v85];
      float v93 = v92 * v92;
      if (v92 <= (float)(a7 / v71))
      {
        float v91 = v91 + (float)((float)(v88 * v93) / (float)(v89 + (float)((float)(v92 * a3) * v87)));
        ++v86;
      }
      if (v85 < v84) {
        float v90 = v90 + (float)((float)(v88 * v93) / (float)(v89 + (float)((float)(v92 * a3) * v87)));
      }
      ++v85;
    }
    while (v82 != v85);
  }
  BOOL v94 = v86 < v84;
  if (v86 > v84) {
    int v84 = v86;
  }
  if (v94) {
    float v95 = v90;
  }
  else {
    float v95 = v91;
  }
  double v96 = (float)(v95 / (float)v84);
  objc_msgSend_bias(v12, v79, v80, v81);
  *(float *)&double v96 = v96 / exp2(v97);

  return *(float *)&v96;
}

- (float)_getGroupSNR:(id)a3 statistics:(id)a4 rawThumbnail:(float *)a5 thumbnailSorted:(BOOL)a6 snrClippingThreshold:(float)a7
{
  BOOL v8 = a6;
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v14, (uint64_t)&v36, (uint64_t)v40, 16);
  if (v15)
  {
    uint64_t v19 = v15;
    uint64_t v20 = *(void *)v37;
    float v21 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v37 != v20) {
          objc_enumerationMutation(v12);
        }
        objc_msgSend_integrationTime(*(void **)(*((void *)&v36 + 1) + 8 * i), v16, v17, v18);
        double v24 = v23;
        objc_msgSend_integrationTime(v13, v25, v26, v27);
        *(float *)&double v28 = v24 / v28;
        float v21 = v21 + *(float *)&v28;
      }
      uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v16, (uint64_t)&v36, (uint64_t)v40, 16);
    }
    while (v19);
  }
  else
  {
    float v21 = 0.0;
  }
  uint64_t v29 = objc_msgSend_count(v12, v16, v17, v18);
  *(float *)&double v30 = v21;
  *(float *)&double v31 = a7;
  objc_msgSend__estimateSNRatShutterScale_statistics_rawThumbnail_thumbnailSorted_clippingThreshold_numBrackets_(self, v32, (uint64_t)v13, (uint64_t)a5, v8, v29, v30, v31);
  float v34 = v33;

  return v34;
}

- (float)_getGroupExposureTime:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v15, (uint64_t)v19, 16);
  if (v5)
  {
    uint64_t v9 = v5;
    uint64_t v10 = *(void *)v16;
    float v11 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend_integrationTime(*(void **)(*((void *)&v15 + 1) + 8 * i), v6, v7, v8);
        *(float *)&double v13 = v13;
        float v11 = v11 + *(float *)&v13;
      }
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v6, (uint64_t)&v15, (uint64_t)v19, 16);
    }
    while (v9);
  }
  else
  {
    float v11 = 0.0;
  }

  return v11;
}

- (id)_truncateGroupParameters:(id)a3 maxTotalExpTime:(float)a4 minNumFrames:(unsigned int)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v7 = a3;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v25, (uint64_t)v29, 16);
  if (v9)
  {
    uint64_t v13 = v9;
    unsigned int v14 = 0;
    uint64_t v15 = *(void *)v26;
    float v16 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v26 != v15) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend_integrationTime(*(void **)(*((void *)&v25 + 1) + 8 * i), v10, v11, v12);
        *(float *)&double v18 = v18;
        float v16 = v16 + *(float *)&v18;
        if (v16 < a4) {
          ++v14;
        }
      }
      uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v25, (uint64_t)v29, 16);
    }
    while (v13);
  }
  else
  {
    unsigned int v14 = 0;
  }
  unint64_t v19 = objc_msgSend_count(v7, v10, v11, v12);
  if (v14 <= a5) {
    unint64_t v22 = a5;
  }
  else {
    unint64_t v22 = v14;
  }
  if (v19 < v22) {
    unint64_t v22 = objc_msgSend_count(v7, v20, v21, v22);
  }
  double v23 = objc_msgSend_subarrayWithRange_(v7, v20, 0, v22);

  return v23;
}

- (void)_createBracketGroup:(id)a3 statistics:(id)a4 evZeroRatios:(id)a5 maxEVZeroGain:(float)a6 maxNominalEVZeroIntegrationTime:(double)a7 maxIntegrationTime:(double)a8
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v27, (uint64_t)v31, 16);
  if (v15)
  {
    uint64_t v19 = v15;
    uint64_t v20 = *(void *)v28;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v28 != v20) {
          objc_enumerationMutation(v13);
        }
        objc_msgSend_doubleValue(*(void **)(*((void *)&v27 + 1) + 8 * v21), v16, v17, v18);
        double v24 = objc_msgSend__lowLightFrameParametersWithStatistics_evRatio_maxEVZeroGain_maxNominalEVZeroIntegrationTime_maxIntegrationTime_(self, v22, (uint64_t)v12, v23);
        objc_msgSend_addObject_(v11, v25, (uint64_t)v24, v26);

        ++v21;
      }
      while (v19 != v21);
      uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v27, (uint64_t)v31, 16);
    }
    while (v19);
  }
}

- (void)_preprocessThumbnailWithAEThumbnail:(unsigned int *)a3 processedThumbnail:(float *)a4 statistics:(id)a5 thumbSize:(int)a6 bitMask:(unsigned int)a7 bitShift:(int)a8
{
  char v8 = a8;
  uint64_t v116 = *MEMORY[0x263EF8340];
  id v13 = a5;
  float v16 = objc_msgSend_objectForKeyedSubscript_(self->_options, v14, @"MinMode", v15);
  uint64_t v19 = objc_msgSend_objectForKeyedSubscript_(v16, v17, @"LensShadingCorrectionCoefficients", v18);

  unint64_t v22 = objc_msgSend_objectForKeyedSubscript_(self->_options, v20, @"MinMode", v21);
  long long v25 = objc_msgSend_objectForKeyedSubscript_(v22, v23, @"LensShadingCorrectionCentre", v24);

  if (v19) {
    BOOL v26 = v25 == 0;
  }
  else {
    BOOL v26 = 1;
  }
  if (!v26)
  {
    float v99 = v25;
    unsigned int v100 = a7;
    char v101 = v8;
    uint64_t v113 = 0;
    uint64_t v114 = 0;
    float v115 = 0.0;
    long long v108 = 0u;
    long long v109 = 0u;
    long long v110 = 0u;
    long long v111 = 0u;
    id v27 = v19;
    uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v28, (uint64_t)&v108, (uint64_t)v112, 16);
    if (v29)
    {
      uint64_t v33 = v29;
      int v34 = 0;
      uint64_t v35 = *(void *)v109;
      do
      {
        uint64_t v36 = 0;
        int v37 = v34;
        long long v38 = (char *)&v113 + 4 * v34;
        do
        {
          if (*(void *)v109 != v35) {
            objc_enumerationMutation(v27);
          }
          objc_msgSend_floatValue(*(void **)(*((void *)&v108 + 1) + 8 * v36), v30, v31, v32);
          *(_DWORD *)&v38[4 * v36++] = v39;
        }
        while (v33 != v36);
        uint64_t v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v30, (uint64_t)&v108, (uint64_t)v112, 16);
        int v34 = v37 + v36;
      }
      while (v33);
    }

    long long v25 = v99;
    float v42 = objc_msgSend_objectAtIndex_(v99, v40, 0, v41);
    objc_msgSend_floatValue(v42, v43, v44, v45);
    float v47 = v46;

    float v50 = objc_msgSend_objectAtIndex_(v99, v48, 1, v49);
    objc_msgSend_floatValue(v50, v51, v52, v53);
    float v55 = v54;

    float v106 = v55;
    float v107 = v47;
    if (v47 < 0.5) {
      float v47 = 1.0 - v47;
    }
    if (v55 < 0.5) {
      float v55 = 1.0 - v55;
    }
    int v59 = objc_msgSend_aeThumbnailWidth(v13, v56, v57, v58);
    int v63 = objc_msgSend_aeThumbnailHeight(v13, v60, v61, v62);
    objc_msgSend_ispDGain(v13, v64, v65, v66);
    float v68 = v67;
    objc_msgSend_sensorDGain(v13, v69, v70, v71);
    float v73 = v72;
    objc_msgSend_ispDGainRangeExpansionFactor(v13, v74, v75, v76);
    if (a6 >= 1)
    {
      uint64_t v81 = 0;
      float v82 = (float)(v55 * v55) + (float)(v47 * v47);
      float v104 = *(float *)&v113;
      float v105 = (float)(v68 * v73) / v80;
      float v83 = *(float *)&v114;
      float v103 = *((float *)&v113 + 1);
      float v84 = *((float *)&v114 + 1);
      float v85 = v115;
      float v86 = sqrtf(v82);
      do
      {
        float v87 = (double)(int)((a3[v81] & v100) >> v101) / 1023.0;
        a4[v81] = v87;
        int v88 = (int)v81 / (int)objc_msgSend_aeThumbnailWidth(v13, v77, v78, v79);
        int v92 = objc_msgSend_aeThumbnailWidth(v13, v89, v90, v91);
        float v93 = (float)((float)((float)((float)v88 + 0.5) * (float)(0.9 / (float)v63)) + 0.05) - v106;
        float v94 = (float)((float)((float)((float)((int)v81 % v92) + 0.5) * (float)(0.9 / (float)v59)) + 0.05) - v107;
        float v95 = sqrtf((float)(v93 * v93) + (float)(v94 * v94)) / v86;
        float v96 = (float)((float)(v104 * (float)(v95 * v95)) + 1.0) + (float)(v103 * powf(v95, 4.0));
        float v97 = v96 + (float)(v83 * powf(v95, 6.0));
        float v98 = v97 + (float)(v84 * powf(v95, 8.0));
        a4[v81] = a4[v81] / (float)(v105 * (float)(v98 + (float)(v85 * powf(v95, 10.0))));
        ++v81;
      }
      while (a6 != v81);
    }
  }
}

- (NSString)portType
{
  return self->_portType;
}

- (NSDictionary)options
{
  return self->_options;
}

- (NRFProgressiveBracketingStatistics)statistics
{
  return self->_statistics;
}

- (double)totalIntegrationTime
{
  return self->_totalIntegrationTime;
}

- (int)mode
{
  return self->_mode;
}

- (BOOL)sphereOffsetEnabled
{
  return self->_sphereOffsetEnabled;
}

- (BOOL)recomputeAWBCCM
{
  return self->_recomputeAWBCCM;
}

- (float)previewSNR
{
  return self->_previewSNR;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statistics, 0);
  objc_storeStrong((id *)&self->_portType, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_lastGroupParameters, 0);
  objc_storeStrong((id *)&self->_nextGroupParameters, 0);

  objc_storeStrong((id *)&self->_firstGroupParameters, 0);
}

@end