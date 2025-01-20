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
- (void)_preprocessAEThumbnailFromStatistics:(id)a3 bitMask:(unsigned int)a4 bitShift:(int)a5 processedThumbnail:(float *)a6;
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
    v5 = &kNRF_MaxMode;
  }
  else {
    v5 = &kNRF_MinMode;
  }
  v6 = [(NSDictionary *)options objectForKeyedSubscript:*v5];
  v7 = [v6 objectForKeyedSubscript:@"MaxNominalEVZeroIntegrationTime"];
  [v7 doubleValue];
  double v9 = v8;

  [(NRFProgressiveBracketingParameters *)self evZeroTargetGainWithStatistics:self->_statistics maxNominalEVZeroIntegrationTime:v9];
  LODWORD(v9) = v10;

  return *(float *)&v9;
}

- (float)evZeroTargetGainWithStatistics:(id)a3 maxNominalEVZeroIntegrationTime:(double)a4
{
  id v5 = a3;
  [v5 aeAverage];
  double v6 = 1.0;
  if (v7 > 0.0)
  {
    [v5 aeTarget];
    if (v8 > 0.0)
    {
      [v5 aeTarget];
      float v10 = v9;
      [v5 aeAverage];
      double v6 = (float)(v10 / v11);
    }
  }
  [v5 integrationTime];
  if (v12 < a4)
  {
    [v5 integrationTime];
    a4 = v13;
  }
  [v5 integrationTime];
  double v15 = v14 / a4;
  [v5 gain];
  *(float *)&double v15 = v6 * (v15 * v16);

  return *(float *)&v15;
}

- (id)_lowLightFrameParametersWithStatistics:(id)a3 evRatio:(double)a4 maxEVZeroGain:(float)a5 maxNominalEVZeroIntegrationTime:(double)a6 maxIntegrationTime:(double)a7
{
  id v12 = a3;
  [v12 integrationTime];
  double v13 = a6;
  if (v14 < a6)
  {
    [v12 integrationTime];
    double v13 = v15;
  }
  [(NRFProgressiveBracketingParameters *)self evZeroTargetGainWithStatistics:v12 maxNominalEVZeroIntegrationTime:a6];
  if (v16 < a5)
  {
    [(NRFProgressiveBracketingParameters *)self evZeroTargetGainWithStatistics:v12 maxNominalEVZeroIntegrationTime:a6];
    a5 = v17;
  }
  double v18 = v13 * fminf(a5, 1.0);
  if (a5 >= 1.0) {
    float v19 = a5;
  }
  else {
    float v19 = 1.0;
  }
  double v20 = v18 * a4;
  if (v18 * a4 >= a7) {
    double v20 = a7;
  }
  float v21 = v18 * v19 / v20;
  double v22 = v20 * fminf(v21, 1.0);
  if (v21 >= 1.0) {
    float v23 = v21;
  }
  else {
    float v23 = 1.0;
  }
  v24 = [NRFProgressiveBracketingFrameParameters alloc];
  [v12 agc];
  *(float *)&double v26 = v23;
  v27 = [(NRFProgressiveBracketingFrameParameters *)v24 initWithIntegrationTime:(int)v25 gain:v22 AGC:v26];

  return v27;
}

- (double)_computeTotalIntegrationTimeFromFirstGroupParameters:(id)a3 nextGroupParameters:(id)a4 lastGroupParameters:(id)a5 numberOfGroups:(int)a6
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  uint64_t v12 = [v9 countByEnumeratingWithState:&v42 objects:v48 count:16];
  double v13 = 0.0;
  double v14 = 0.0;
  if (v12)
  {
    uint64_t v15 = v12;
    uint64_t v16 = *(void *)v43;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v43 != v16) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v42 + 1) + 8 * v17) integrationTime];
        double v14 = v14 + v18;
        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v9 countByEnumeratingWithState:&v42 objects:v48 count:16];
    }
    while (v15);
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v19 = v10;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v38 objects:v47 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v39;
    double v13 = 0.0;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v39 != v22) {
          objc_enumerationMutation(v19);
        }
        [*(id *)(*((void *)&v38 + 1) + 8 * v23) integrationTime];
        double v13 = v13 + v24;
        ++v23;
      }
      while (v21 != v23);
      uint64_t v21 = [v19 countByEnumeratingWithState:&v38 objects:v47 count:16];
    }
    while (v21);
  }

  if (v11) {
    int v25 = -2;
  }
  else {
    int v25 = -1;
  }
  long long v36 = 0u;
  long long v37 = 0u;
  double v26 = v14 + (double)(v25 + a6) * v13;
  long long v34 = 0u;
  long long v35 = 0u;
  id v27 = v11;
  uint64_t v28 = [v27 countByEnumeratingWithState:&v34 objects:v46 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v35;
    do
    {
      uint64_t v31 = 0;
      do
      {
        if (*(void *)v35 != v30) {
          objc_enumerationMutation(v27);
        }
        objc_msgSend(*(id *)(*((void *)&v34 + 1) + 8 * v31), "integrationTime", (void)v34);
        double v26 = v26 + v32;
        ++v31;
      }
      while (v29 != v31);
      uint64_t v29 = [v27 countByEnumeratingWithState:&v34 objects:v46 count:16];
    }
    while (v29);
  }

  return v26;
}

- (double)computeTotalIntegrationTimeWithStatistics:(id)a3 forMode:(int)a4
{
  id v6 = a3;
  if (a4 == 1)
  {
    id v10 = [(NSDictionary *)self->_options objectForKeyedSubscript:@"MinMode"];
    [(NRFProgressiveBracketingParameters *)self _selectBracketsAndComputeExposureTimeWithOption:v10 statistics:v6 getAllInfo:0 updateDecision:0 minTotalExposureTime:0.0];
    double v12 = v11;

    float v8 = [(NSDictionary *)self->_options objectForKeyedSubscript:@"MaxMode"];
    double v9 = v12 + 1.0;
    goto LABEL_5;
  }
  double v7 = 0.0;
  if (!a4)
  {
    float v8 = [(NSDictionary *)self->_options objectForKeyedSubscript:@"MinMode"];
    double v9 = 0.0;
LABEL_5:
    [(NRFProgressiveBracketingParameters *)self _selectBracketsAndComputeExposureTimeWithOption:v8 statistics:v6 getAllInfo:0 updateDecision:0 minTotalExposureTime:v9];
    double v7 = v13;
  }
  return v7;
}

- (double)_computeMaxIntegrationTimeWithOptions:(id)a3 statistics:(id)a4
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  double v7 = [v5 objectForKeyedSubscript:@"MaxIntegrationTime"];
  [v7 doubleValue];
  *(float *)&double v8 = v8;
  double v9 = fminf(*(float *)&v8, 3.4028e38);

  if (([v6 stationary] & 1) == 0)
  {
    id v10 = [v5 objectForKeyedSubscript:@"MotionDataBiasErrorThresholdToCapIntegrationTime"];
    double v11 = [v5 objectForKeyedSubscript:@"MotionDataBiasErrorBasedIntegrationTimeCap"];
    [v6 motionDataBiasErrorEstimate];
    float v13 = v12;
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v43 = v10;
      id v14 = v10;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v44 objects:v48 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        int v17 = 0;
        uint64_t v18 = *(void *)v45;
        float v19 = 0.0;
        double v20 = v9;
        do
        {
          uint64_t v21 = 0;
          uint64_t v22 = v17;
          do
          {
            if (*(void *)v45 != v18) {
              objc_enumerationMutation(v14);
            }
            [*(id *)(*((void *)&v44 + 1) + 8 * v21) floatValue];
            if (v13 > v23 && v23 > v19)
            {
              float v25 = v23;
              double v26 = [v11 objectAtIndexedSubscript:v22 + v21];
              [v26 doubleValue];
              double v20 = v9;
              if (v27 < v9)
              {
                uint64_t v28 = [v11 objectAtIndexedSubscript:v22 + v21];
                [v28 doubleValue];
                double v20 = v29;
              }
              float v19 = v25;
            }
            ++v21;
          }
          while (v16 != v21);
          uint64_t v16 = [v14 countByEnumeratingWithState:&v44 objects:v48 count:16];
          int v17 = v22 + v21;
        }
        while (v16);
      }
      else
      {
        double v20 = v9;
      }

      double v9 = v20;
      id v10 = v43;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v10 floatValue];
          if (v13 > v30)
          {
            [v11 doubleValue];
            if (v31 < v9)
            {
              [v11 doubleValue];
              double v9 = v32;
            }
          }
        }
      }
    }
    v33 = [v5 objectForKeyedSubscript:@"Handheld"];
    uint64_t v34 = [v33 objectForKeyedSubscript:@"MaxIntegrationTimeForHuman"];
    if (v34)
    {
      long long v35 = (void *)v34;
      if ((int)[v6 numberOfHumanBodies] <= 0)
      {
        int v36 = [v6 numberOfHumanFaces];

        if (v36 <= 0)
        {
LABEL_34:

          goto LABEL_35;
        }
      }
      else
      {
      }
      v33 = [v5 objectForKeyedSubscript:@"Handheld"];
      long long v37 = [v33 objectForKeyedSubscript:@"MaxIntegrationTimeForHuman"];
      [v37 doubleValue];
      if (v9 >= v38)
      {
        long long v39 = [v5 objectForKeyedSubscript:@"Handheld"];
        long long v40 = [v39 objectForKeyedSubscript:@"MaxIntegrationTimeForHuman"];
        [v40 doubleValue];
        double v9 = v41;
      }
    }

    goto LABEL_34;
  }
LABEL_35:

  return v9;
}

- (double)_selectBracketsAndComputeExposureTimeWithOption:(id)a3 statistics:(id)a4 getAllInfo:(BOOL)a5 updateDecision:(BOOL)a6 minTotalExposureTime:(double)a7
{
  BOOL v164 = a6;
  BOOL v161 = a5;
  uint64_t v201 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  double v11 = [v9 objectForKeyedSubscript:@"SNRClippingThreshold"];
  [v11 floatValue];
  int v167 = v12;

  float v13 = [v9 objectForKeyedSubscript:@"MotionAEThreshold"];
  [v13 floatValue];
  float v15 = v14;

  uint64_t v16 = [v9 objectForKeyedSubscript:@"UseShorterBracketsForHuman"];
  int v162 = [v16 BOOLValue];

  int v17 = [GainValueArray alloc];
  uint64_t v18 = [v9 objectForKeyedSubscript:@"MinAGC"];
  float v19 = [(GainValueArray *)v17 initWithArray:v18];

  [v10 gain];
  float v21 = interpolate_with_gain(v19, v20);
  uint64_t v22 = [v9 objectForKeyedSubscript:@"PreviewIntegrationTimeThresholdToCapNumOfFrames"];
  [v22 doubleValue];
  double v24 = v23;

  float v25 = [v9 objectForKeyedSubscript:@"PreviewIntegrationTimeBasedNumberOfFramesCap"];
  unsigned int v160 = [v25 intValue];

  double v26 = [v9 objectForKeyedSubscript:@"MaxNominalEVZeroIntegrationTime"];
  [v26 doubleValue];
  double v28 = v27;

  [(NRFProgressiveBracketingParameters *)self _computeMaxIntegrationTimeWithOptions:v9 statistics:v10];
  double v30 = v29;
  int v31 = [v10 stationary];
  double v32 = (uint64_t *)&kNRF_Tripod;
  if (!v31) {
    double v32 = (uint64_t *)&kNRF_Handheld;
  }
  uint64_t v33 = *v32;
  uint64_t v34 = [v9 objectForKeyedSubscript:*v32];
  long long v35 = [v34 objectForKeyedSubscript:@"BracketGroupTable"];

  int v36 = [v9 objectForKeyedSubscript:v33];
  long long v37 = [v36 objectForKeyedSubscript:@"MaxTotalExposureTime"];
  [v37 floatValue];
  float v39 = v38;

  long long v40 = [GainValueArray alloc];
  double v41 = [v9 objectForKeyedSubscript:v33];
  long long v42 = [v41 objectForKeyedSubscript:@"MinTotalSNRBound"];
  long long v43 = [(GainValueArray *)v40 initWithArray:v42];

  [v10 gain];
  v166 = v43;
  float v45 = interpolate_with_gain(v43, v44);
  float v46 = __exp10f(v45 / 10.0);
  v169 = v9;
  long long v47 = [v9 objectForKeyedSubscript:v33];
  v48 = [v47 objectForKeyedSubscript:@"MaxEVZeroGain"];
  [v48 floatValue];
  int v50 = v49;

  v180 = [MEMORY[0x263EFF980] array];
  v179 = [MEMORY[0x263EFF980] array];
  v51 = (char *)malloc_type_calloc([v35 count], 4uLL, 0x100004052888210uLL);
  if (!v51)
  {
    FigDebugAssert3();
    v98 = 0;
    v68 = 0;
    v88 = 0;
    double v102 = -1.0;
    goto LABEL_107;
  }
  v177 = self;
  v178 = v10;
  v165 = v19;
  unsigned int v163 = [v35 count];
  long long v193 = 0u;
  long long v194 = 0u;
  long long v195 = 0u;
  long long v196 = 0u;
  v168 = v35;
  obuint64_t j = v35;
  uint64_t v52 = [obj countByEnumeratingWithState:&v193 objects:v200 count:16];
  v170 = v51;
  if (v52)
  {
    uint64_t v53 = v52;
    int v54 = 0;
    uint64_t v175 = *(void *)v194;
    do
    {
      uint64_t v55 = 0;
      int v171 = v54;
      v56 = &v51[4 * v54];
      do
      {
        if (*(void *)v194 != v175) {
          objc_enumerationMutation(obj);
        }
        v57 = *(void **)(*((void *)&v193 + 1) + 8 * v55);
        v58 = [v57 objectForKeyedSubscript:@"SNRBound"];
        [v58 floatValue];
        *(_DWORD *)&v56[4 * v55] = v59;

        v60 = [MEMORY[0x263EFF980] array];
        v61 = [v57 objectForKeyedSubscript:@"FirstGroupEV0Ratios"];
        LODWORD(v62) = v50;
        [(NRFProgressiveBracketingParameters *)v177 _createBracketGroup:v60 statistics:v178 evZeroRatios:v61 maxEVZeroGain:v62 maxNominalEVZeroIntegrationTime:v28 maxIntegrationTime:v30];

        [v180 addObject:v60];
        v63 = [MEMORY[0x263EFF980] array];
        v64 = [v57 objectForKeyedSubscript:@"NextGroupEV0Ratios"];
        LODWORD(v65) = v50;
        [(NRFProgressiveBracketingParameters *)v177 _createBracketGroup:v63 statistics:v178 evZeroRatios:v64 maxEVZeroGain:v65 maxNominalEVZeroIntegrationTime:v28 maxIntegrationTime:v30];

        [v179 addObject:v63];
        ++v55;
      }
      while (v53 != v55);
      uint64_t v53 = [obj countByEnumeratingWithState:&v193 objects:v200 count:16];
      v51 = v170;
      int v54 = v171 + v55;
    }
    while (v53);
  }
  int v66 = (int)v21;

  id v10 = v178;
  v67 = [v178 aeThumbnail];
  v68 = (void *)[v67 length];

  if (!v68)
  {
    BOOL v101 = 0;
    int v176 = 0;
    v98 = 0;
    v88 = 0;
    float v86 = 0.0;
    double v102 = 0.0;
    v78 = v177;
    long long v35 = v168;
    if (!v164) {
      goto LABEL_106;
    }
    goto LABEL_105;
  }
  long long v35 = v168;
  if (!v163 || (v69 = (char *)malloc_type_malloc(4 * v163, 0x100004052888210uLL)) == 0)
  {
    FigDebugAssert3();
    v98 = 0;
    v68 = 0;
    v88 = 0;
    double v102 = -1.0;
    float v19 = v165;
    goto LABEL_107;
  }
  v70 = v69;
  float v71 = fminf(v39, 31.0);
  v72 = (int *)malloc_type_malloc(8 * v163, 0x100004000313F17uLL);
  v73 = v72;
  uint64_t v74 = 0;
  v75 = v72 + 1;
  do
  {
    *(v75 - 1) = *(_DWORD *)&v51[4 * v74];
    _DWORD *v75 = v74;
    v75 += 2;
    ++v74;
  }
  while (v163 != v74);
  qsort(v72, v163, 8uLL, (int (__cdecl *)(const void *, const void *))qsortComparatorValueIndex);
  uint64_t v76 = 0;
  v77 = v73 + 1;
  v78 = v177;
  do
  {
    *(_DWORD *)&v51[v76] = *(v77 - 1);
    int v79 = *v77;
    v77 += 2;
    *(_DWORD *)&v70[v76] = v79;
    v76 += 4;
  }
  while (4 * v163 != v76);
  free(v73);
  v80 = malloc_type_malloc(4 * (int)([v178 aeThumbnailHeight] * objc_msgSend(v178, "aeThumbnailWidth")), 0x100004052888210uLL);
  [(NRFProgressiveBracketingParameters *)v177 _preprocessAEThumbnailFromStatistics:v178 bitMask:1047552 bitShift:10 processedThumbnail:v80];
  [v178 integrationTime];
  double v82 = 1.0;
  if (v81 > v28)
  {
    [v178 integrationTime];
    double v82 = v28 / v81;
  }
  float v83 = v82;
  *(float *)&double v81 = v83;
  LODWORD(v82) = v167;
  [(NRFProgressiveBracketingParameters *)v177 _estimateSNRatShutterScale:v178 statistics:v80 rawThumbnail:0 thumbnailSorted:1 clippingThreshold:v81 numBrackets:v82];
  uint64_t v85 = 0;
  float v86 = logf(fmaxf(v84, 1.0e-20)) * 4.34;
  if (v163 <= 1) {
    uint64_t v87 = 1;
  }
  else {
    uint64_t v87 = v163;
  }
  while (*(float *)&v51[4 * v85] >= v86)
  {
    if (v87 == ++v85)
    {
      LODWORD(v85) = 0;
      break;
    }
  }
  v88 = [v180 objectAtIndexedSubscript:*(unsigned int *)&v70[4 * v85]];
  v68 = [v179 objectAtIndexedSubscript:*(unsigned int *)&v70[4 * v85]];
  BOOL v89 = v15 < (float)(int)[v178 motionFromAEMatrix];
  if (v162
    && ((int)[v178 numberOfHumanBodies] > 0 || (int)objc_msgSend(v178, "numberOfHumanFaces") >= 1))
  {
    BOOL v89 = 1;
  }
  if (v85 && v89)
  {
    int v90 = v85 - 1;
    uint64_t v91 = [v180 objectAtIndexedSubscript:*(unsigned int *)&v70[4 * (v85 - 1)]];

    uint64_t v92 = [v179 objectAtIndexedSubscript:*(unsigned int *)&v70[4 * v90]];
    v93 = v68;
    v68 = (void *)v92;

    v88 = (void *)v91;
  }
  [v178 integrationTime];
  v174 = v80;
  if (v94 < v24)
  {
    unint64_t v95 = [v88 count];
    if (v160 <= 4) {
      unint64_t v96 = 4;
    }
    else {
      unint64_t v96 = v160;
    }
    if (v95 < v96) {
      unint64_t v96 = [v88 count];
    }
    uint64_t v97 = objc_msgSend(v88, "subarrayWithRange:", 0, v96);

    v98 = 0;
    uint64_t v99 = 1;
    v88 = (void *)v97;
    BOOL v100 = v161;
    goto LABEL_64;
  }
  [(NRFProgressiveBracketingParameters *)v177 _getGroupExposureTime:v88];
  float v104 = v103;
  [(NRFProgressiveBracketingParameters *)v177 _getGroupExposureTime:v68];
  float v106 = *(float *)&v105;
  if (v104 <= v71)
  {
    LODWORD(v105) = v167;
    [(NRFProgressiveBracketingParameters *)v177 _getGroupSNR:v88 statistics:v178 rawThumbnail:v80 thumbnailSorted:1 snrClippingThreshold:v105];
    float v110 = v109;
    LODWORD(v111) = v167;
    [(NRFProgressiveBracketingParameters *)v177 _getGroupSNR:v68 statistics:v178 rawThumbnail:v80 thumbnailSorted:1 snrClippingThreshold:v111];
    float v113 = floorf((float)(v71 - v104) / v106);
    if (v113 < 0.0) {
      float v113 = 0.0;
    }
    int v114 = (int)v113;
    if (v112 < 0.0001) {
      float v112 = 0.0001;
    }
    int v115 = llroundf((float)(v46 - v110) / v112);
    if (v114 >= v115) {
      int v116 = v115;
    }
    else {
      int v116 = (int)v113;
    }
    if (v115 >= 0) {
      uint64_t v99 = (v116 + 1);
    }
    else {
      uint64_t v99 = 1;
    }
    if (v115 <= v114)
    {
      v98 = 0;
      double v108 = a7;
      goto LABEL_60;
    }
    [(NRFProgressiveBracketingParameters *)v177 _computeTotalIntegrationTimeFromFirstGroupParameters:v88 nextGroupParameters:v68 lastGroupParameters:0 numberOfGroups:v99];
    *(float *)&double v117 = v117;
    *(float *)&double v117 = (float)((float)(floorf(v71) + 0.5) + -0.0001) - *(float *)&v117;
    id v107 = [(NRFProgressiveBracketingParameters *)v177 _truncateGroupParameters:v68 maxTotalExpTime:0 minNumFrames:v117];
    double v108 = a7;
    if ([v107 count])
    {
      uint64_t v99 = (v99 + 1);
      id v107 = v107;
      v98 = v107;
    }
    else
    {
      v98 = 0;
    }
  }
  else
  {
    *(float *)&double v105 = floorf(v71) + 0.5;
    [(NRFProgressiveBracketingParameters *)v177 _truncateGroupParameters:v88 maxTotalExpTime:3 minNumFrames:v105];
    v98 = 0;
    id v107 = v88;
    v88 = uint64_t v99 = 1;
    double v108 = a7;
  }

LABEL_60:
  [(NRFProgressiveBracketingParameters *)v177 _computeTotalIntegrationTimeFromFirstGroupParameters:v88 nextGroupParameters:v68 lastGroupParameters:v98 numberOfGroups:v99];
  BOOL v100 = v161;
  if (v118 < v108)
  {
    double v119 = ceil((v108 - v118) / v106);
    if (v119 < 1.0) {
      double v119 = 1.0;
    }
    uint64_t v99 = (v99 + (int)v119);
  }
LABEL_64:
  int v176 = v99;
  [(NRFProgressiveBracketingParameters *)v177 _computeTotalIntegrationTimeFromFirstGroupParameters:v88 nextGroupParameters:v68 lastGroupParameters:v98 numberOfGroups:v99];
  double v102 = v120;
  if (v100)
  {
    int v121 = v66;
    v122 = v68;
    long long v191 = 0u;
    long long v192 = 0u;
    int v173 = v121;
    if (v121 >= 8) {
      int v123 = 8;
    }
    else {
      int v123 = v121;
    }
    long long v189 = 0uLL;
    long long v190 = 0uLL;
    id v124 = v88;
    uint64_t v125 = [v124 countByEnumeratingWithState:&v189 objects:v199 count:16];
    if (v125)
    {
      uint64_t v126 = v125;
      uint64_t v127 = *(void *)v190;
      do
      {
        for (uint64_t i = 0; i != v126; ++i)
        {
          if (*(void *)v190 != v127) {
            objc_enumerationMutation(v124);
          }
          v129 = *(void **)(*((void *)&v189 + 1) + 8 * i);
          [v129 gain];
          BOOL v130 = *(float *)&v131 <= (float)v123;
          *(float *)&double v131 = (float)v123;
          if (v130) {
            objc_msgSend(v129, "gain", v131);
          }
          [v129 setAGC:(int)*(float *)&v131];
        }
        uint64_t v126 = [v124 countByEnumeratingWithState:&v189 objects:v199 count:16];
      }
      while (v126);
    }

    long long v187 = 0u;
    long long v188 = 0u;
    long long v185 = 0u;
    long long v186 = 0u;
    id v132 = v122;
    uint64_t v133 = [v132 countByEnumeratingWithState:&v185 objects:v198 count:16];
    if (v133)
    {
      uint64_t v134 = v133;
      uint64_t v135 = *(void *)v186;
      do
      {
        for (uint64_t j = 0; j != v134; ++j)
        {
          if (*(void *)v186 != v135) {
            objc_enumerationMutation(v132);
          }
          v137 = *(void **)(*((void *)&v185 + 1) + 8 * j);
          [v137 gain];
          BOOL v130 = *(float *)&v138 <= (float)v123;
          *(float *)&double v138 = (float)v123;
          if (v130) {
            objc_msgSend(v137, "gain", v138);
          }
          [v137 setAGC:(int)*(float *)&v138];
        }
        uint64_t v134 = [v132 countByEnumeratingWithState:&v185 objects:v198 count:16];
      }
      while (v134);
    }

    long long v183 = 0u;
    long long v184 = 0u;
    long long v181 = 0u;
    long long v182 = 0u;
    id v139 = v98;
    uint64_t v140 = [v139 countByEnumeratingWithState:&v181 objects:v197 count:16];
    if (v140)
    {
      uint64_t v141 = v140;
      uint64_t v142 = *(void *)v182;
      do
      {
        for (uint64_t k = 0; k != v141; ++k)
        {
          if (*(void *)v182 != v142) {
            objc_enumerationMutation(v139);
          }
          v144 = *(void **)(*((void *)&v181 + 1) + 8 * k);
          [v144 gain];
          BOOL v130 = *(float *)&v145 <= (float)v123;
          *(float *)&double v145 = (float)v123;
          if (v130) {
            objc_msgSend(v144, "gain", v145);
          }
          [v144 setAGC:(int)*(float *)&v145];
        }
        uint64_t v141 = [v139 countByEnumeratingWithState:&v181 objects:v197 count:16];
      }
      while (v141);
    }

    v146 = [v169 objectForKeyedSubscript:@"SNRThresholdToRecomputeAWBCCM"];
    [v146 floatValue];
    float v148 = __exp10f(v147 / 10.0);

    id v10 = v178;
    v149 = malloc_type_malloc(4 * (int)([v178 aeThumbnailHeight] * objc_msgSend(v178, "aeThumbnailWidth")), 0x100004052888210uLL);
    v78 = v177;
    [(NRFProgressiveBracketingParameters *)v177 _preprocessAEThumbnailFromStatistics:v178 bitMask:1023 bitShift:0 processedThumbnail:v149];
    v150 = malloc_type_malloc(4 * (int)([v178 aeThumbnailHeight] * objc_msgSend(v178, "aeThumbnailWidth")), 0x100004052888210uLL);
    [(NRFProgressiveBracketingParameters *)v177 _preprocessAEThumbnailFromStatistics:v178 bitMask:1072693248 bitShift:20 processedThumbnail:v150];
    *(float *)&double v151 = v83;
    LODWORD(v152) = v167;
    [(NRFProgressiveBracketingParameters *)v177 _estimateSNRatShutterScale:v178 statistics:v149 rawThumbnail:0 thumbnailSorted:1 clippingThreshold:v151 numBrackets:v152];
    float v154 = v153;
    *(float *)&double v155 = v83;
    LODWORD(v156) = v167;
    [(NRFProgressiveBracketingParameters *)v177 _estimateSNRatShutterScale:v178 statistics:v150 rawThumbnail:0 thumbnailSorted:1 clippingThreshold:v155 numBrackets:v156];
    if (v154 < v157) {
      float v157 = v154;
    }
    if (v157 >= v86) {
      float v157 = v86;
    }
    BOOL v101 = v157 < v148;
    free(v149);
    free(v150);
    long long v35 = v168;
    v68 = v122;
    int v66 = v173;
  }
  else
  {
    BOOL v101 = 0;
  }
  free(v174);
  free(v70);
  if (!v164) {
    goto LABEL_106;
  }
LABEL_105:
  objc_storeStrong((id *)&v78->_firstGroupParameters, v88);
  objc_storeStrong((id *)&v78->_nextGroupParameters, v68);
  objc_storeStrong((id *)&v78->_lastGroupParameters, v98);
  v78->_numberOfGroups = v176;
  v78->_minAGC = v66;
  v78->_previewSNR = v86;
  v78->_recomputeAWBCCM = v101;
LABEL_106:
  float v19 = v165;
  v51 = v170;
LABEL_107:
  free(v51);

  return v102;
}

- (id)currentBracketingParametersForGroup:(int)a3
{
  if (a3 == 1)
  {
    int mode = self->_mode;
    if (mode == 1)
    {
      double v11 = [(NSDictionary *)self->_options objectForKeyedSubscript:@"MinMode"];
      [(NRFProgressiveBracketingParameters *)self _selectBracketsAndComputeExposureTimeWithOption:v11 statistics:self->_statistics getAllInfo:0 updateDecision:0 minTotalExposureTime:0.0];
      self->_totalIntegrationTime = v12;

      id v5 = [(NSDictionary *)self->_options objectForKeyedSubscript:@"MaxMode"];
      statistics = self->_statistics;
      double v7 = self->_totalIntegrationTime + 1.0;
    }
    else
    {
      if (mode)
      {
LABEL_11:
        uint64_t v14 = 8;
        goto LABEL_13;
      }
      id v5 = [(NSDictionary *)self->_options objectForKeyedSubscript:@"MinMode"];
      statistics = self->_statistics;
      double v7 = 0.0;
    }
    [(NRFProgressiveBracketingParameters *)self _selectBracketsAndComputeExposureTimeWithOption:v5 statistics:statistics getAllInfo:1 updateDecision:1 minTotalExposureTime:v7];
    self->_totalIntegrationTime = v13;

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
    id v10 = (NSArray *)MEMORY[0x263EFFA68];
    goto LABEL_15;
  }
  uint64_t v14 = 16;
LABEL_13:
  lastGroupParameters = *(NSArray **)((char *)&self->super.isa + v14);
LABEL_14:
  id v10 = lastGroupParameters;
LABEL_15:

  return v10;
}

- (float)_estimateSNRatShutterScale:(float)a3 statistics:(id)a4 rawThumbnail:(float *)a5 thumbnailSorted:(BOOL)a6 clippingThreshold:(float)a7 numBrackets:(int)a8
{
  id v12 = a4;
  objc_msgSend(v12, "readNoise_1x");
  float v56 = v13;
  objc_msgSend(v12, "readNoise_1x");
  float v55 = v14;
  objc_msgSend(v12, "readNoise_8x");
  float v54 = v15;
  objc_msgSend(v12, "readNoise_8x");
  float v52 = v16;
  objc_msgSend(v12, "readNoise_1x");
  float v53 = v17;
  objc_msgSend(v12, "readNoise_1x");
  float v51 = v18;
  objc_msgSend(v12, "readNoise_8x");
  float v20 = v19;
  objc_msgSend(v12, "readNoise_8x");
  float v22 = v21;
  [v12 conversionGain];
  float v24 = v23;
  [v12 agc];
  float v26 = v25;
  [v12 agc];
  float v28 = v27;
  [v12 agc];
  float v30 = v29;
  [v12 ispDGain];
  float v32 = v31;
  int v33 = [v12 aeThumbnailWidth];
  size_t v34 = [v12 aeThumbnailHeight] * v33;
  if ((v34 & 0x80000000) == 0) {
    int v35 = v34;
  }
  else {
    int v35 = v34 + 1;
  }
  if (!a6) {
    qsort(a5, v34, 4uLL, (int (__cdecl *)(const void *, const void *))qsortComparatorFloat);
  }
  int v36 = v35 >> 1;
  if ((int)v34 < 1)
  {
    int v38 = 0;
    float v43 = 0.0;
    float v42 = 0.0;
  }
  else
  {
    uint64_t v37 = 0;
    int v38 = 0;
    float v39 = (float)(v24 / 1023.0) * v30;
    float v40 = a3 * a3;
    float v41 = (float)((float)(v24 / 1023.0)
                * (float)((float)(v24 / 1023.0)
                        * (float)((float)((float)((float)(v20 * v22) * -1.0159) + (float)((float)(v53 * v51) * 1.0159))
                                + (float)((float)((float)((float)(v54 * v52) * 1.0159)
                                                + (float)((float)(v56 * v55) * -0.0159))
                                        * (float)(v26 * v28)))))
        * (float)a8;
    float v42 = 0.0;
    float v43 = 0.0;
    do
    {
      float v44 = a5[v37];
      float v45 = v44 * v44;
      if (v44 <= (float)(a7 / v32))
      {
        float v43 = v43 + (float)((float)(v40 * v45) / (float)(v41 + (float)((float)(v44 * a3) * v39)));
        ++v38;
      }
      if (v37 < v36) {
        float v42 = v42 + (float)((float)(v40 * v45) / (float)(v41 + (float)((float)(v44 * a3) * v39)));
      }
      ++v37;
    }
    while (v34 != v37);
  }
  BOOL v46 = v38 < v36;
  if (v38 > v36) {
    int v36 = v38;
  }
  if (v46) {
    float v47 = v42;
  }
  else {
    float v47 = v43;
  }
  double v48 = (float)(v47 / (float)v36);
  [v12 bias];
  *(float *)&double v48 = v48 / exp2(v49);

  return *(float *)&v48;
}

- (float)_getGroupSNR:(id)a3 statistics:(id)a4 rawThumbnail:(float *)a5 thumbnailSorted:(BOOL)a6 snrClippingThreshold:(float)a7
{
  BOOL v8 = a6;
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v14 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v29;
    float v17 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v29 != v16) {
          objc_enumerationMutation(v12);
        }
        [*(id *)(*((void *)&v28 + 1) + 8 * i) integrationTime];
        double v20 = v19;
        [v13 integrationTime];
        *(float *)&double v21 = v20 / v21;
        float v17 = v17 + *(float *)&v21;
      }
      uint64_t v15 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v15);
  }
  else
  {
    float v17 = 0.0;
  }
  uint64_t v22 = [v12 count];
  *(float *)&double v23 = v17;
  *(float *)&double v24 = a7;
  [(NRFProgressiveBracketingParameters *)self _estimateSNRatShutterScale:v13 statistics:a5 rawThumbnail:v8 thumbnailSorted:v22 clippingThreshold:v23 numBrackets:v24];
  float v26 = v25;

  return v26;
}

- (float)_getGroupExposureTime:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    float v7 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * i) integrationTime];
        *(float *)&double v9 = v9;
        float v7 = v7 + *(float *)&v9;
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  else
  {
    float v7 = 0.0;
  }

  return v7;
}

- (id)_truncateGroupParameters:(id)a3 maxTotalExpTime:(float)a4 minNumFrames:(unsigned int)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v7 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    unsigned int v10 = 0;
    uint64_t v11 = *(void *)v20;
    float v12 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v19 + 1) + 8 * i) integrationTime];
        *(float *)&double v14 = v14;
        float v12 = v12 + *(float *)&v14;
        if (v12 < a4) {
          ++v10;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }
  else
  {
    unsigned int v10 = 0;
  }
  unint64_t v15 = [v7 count];
  if (v10 <= a5) {
    unint64_t v16 = a5;
  }
  else {
    unint64_t v16 = v10;
  }
  if (v15 < v16) {
    unint64_t v16 = [v7 count];
  }
  float v17 = objc_msgSend(v7, "subarrayWithRange:", 0, v16);

  return v17;
}

- (void)_createBracketGroup:(id)a3 statistics:(id)a4 evZeroRatios:(id)a5 maxEVZeroGain:(float)a6 maxNominalEVZeroIntegrationTime:(double)a7 maxIntegrationTime:(double)a8
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v20;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(v13);
        }
        [*(id *)(*((void *)&v19 + 1) + 8 * v17) doubleValue];
        float v18 = -[NRFProgressiveBracketingParameters _lowLightFrameParametersWithStatistics:evRatio:maxEVZeroGain:maxNominalEVZeroIntegrationTime:maxIntegrationTime:](self, "_lowLightFrameParametersWithStatistics:evRatio:maxEVZeroGain:maxNominalEVZeroIntegrationTime:maxIntegrationTime:", v12);
        [v11 addObject:v18];

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v15);
  }
}

- (void)_preprocessAEThumbnailFromStatistics:(id)a3 bitMask:(unsigned int)a4 bitShift:(int)a5 processedThumbnail:(float *)a6
{
  char v7 = a5;
  uint64_t v73 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = [(NSDictionary *)self->_options objectForKeyedSubscript:@"MinMode"];
  id v12 = [v11 objectForKeyedSubscript:@"LensShadingCorrectionCoefficients"];

  id v13 = [(NSDictionary *)self->_options objectForKeyedSubscript:@"MinMode"];
  uint64_t v14 = [v13 objectForKeyedSubscript:@"LensShadingCorrectionCentre"];

  if (a6)
  {
    if (v12 && v14 != 0)
    {
      id v16 = [v10 aeThumbnail];
      uint64_t v17 = [v16 bytes];

      if (v17)
      {
        unsigned int v54 = a4;
        char v55 = v7;
        int v18 = [v10 aeThumbnailWidth];
        float v56 = v10;
        int v62 = [v10 aeThumbnailHeight];
        uint64_t v70 = 0;
        uint64_t v71 = 0;
        float v72 = 0.0;
        long long v65 = 0u;
        long long v66 = 0u;
        long long v67 = 0u;
        long long v68 = 0u;
        float v53 = v12;
        id v19 = v12;
        uint64_t v20 = [v19 countByEnumeratingWithState:&v65 objects:v69 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          int v22 = 0;
          uint64_t v23 = *(void *)v66;
          do
          {
            uint64_t v24 = 0;
            int v25 = v22;
            float v26 = (char *)&v70 + 4 * v22;
            do
            {
              if (*(void *)v66 != v23) {
                objc_enumerationMutation(v19);
              }
              [*(id *)(*((void *)&v65 + 1) + 8 * v24) floatValue];
              *(_DWORD *)&v26[4 * v24++] = v27;
            }
            while (v21 != v24);
            uint64_t v21 = [v19 countByEnumeratingWithState:&v65 objects:v69 count:16];
            int v22 = v25 + v24;
          }
          while (v21);
        }

        long long v28 = [v14 objectAtIndex:0];
        [v28 floatValue];
        float v30 = v29;

        long long v31 = [v14 objectAtIndex:1];
        [v31 floatValue];
        float v33 = v32;

        if (v30 >= 0.5) {
          float v34 = v30;
        }
        else {
          float v34 = 1.0 - v30;
        }
        float v64 = v33;
        if (v33 < 0.5) {
          float v33 = 1.0 - v33;
        }
        id v10 = v56;
        [v56 ispDGain];
        float v36 = v35;
        [v56 sensorDGain];
        float v38 = v37;
        [v56 ispDGainRangeExpansionFactor];
        uint64_t v40 = (v62 * v18);
        id v12 = v53;
        if ((int)v40 >= 1)
        {
          uint64_t v41 = 0;
          float v63 = 0.9 / (float)v62;
          float v60 = *(float *)&v70;
          float v61 = (float)(v36 * v38) / v39;
          float v58 = *(float *)&v71;
          float v59 = *((float *)&v70 + 1);
          float v42 = v72;
          float v57 = *((float *)&v71 + 1);
          float v43 = sqrtf((float)(v33 * v33) + (float)(v34 * v34));
          do
          {
            float v44 = (double)(int)((*(_DWORD *)(v17 + 4 * v41) & v54) >> v55) / 1023.0;
            float v45 = (float)((float)((float)((float)((int)v41 / v18) + 0.5) * v63) + 0.05) - v64;
            float v46 = (float)((float)((float)((float)((int)v41 % v18) + 0.5) * (float)(0.9 / (float)v18)) + 0.05) - v30;
            float v47 = sqrtf((float)(v45 * v45) + (float)(v46 * v46)) / v43;
            float v48 = v30;
            float v49 = (float)((float)(v60 * (float)(v47 * v47)) + 1.0) + (float)(v59 * powf(v47, 4.0));
            float v50 = v49 + (float)(v58 * powf(v47, 6.0));
            float v51 = v50 + (float)(v57 * powf(v47, 8.0));
            float v52 = v51 + (float)(v42 * powf(v47, 10.0));
            float v30 = v48;
            a6[v41++] = v44 / (float)(v61 * v52);
          }
          while (v40 != v41);
        }
      }
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