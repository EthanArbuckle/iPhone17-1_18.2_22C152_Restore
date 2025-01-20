uint64_t sub_10914(uint64_t result)
{
  void *v1;
  id v2;
  void *v3;
  id v4;
  void *v5;

  if (result)
  {
    v1 = (void *)result;
    v2 = [(id)objc_opt_new() init];
    v3 = (void *)v1[23];
    v1[23] = v2;

    if (v1[23]
      && (v4 = [(id)objc_opt_new() initWithMetalContext:v1[1]],
          v5 = (void *)v1[24],
          v1[24] = v4,
          v5,
          v1[24]))
    {
      return 0;
    }
    else
    {
      FigDebugAssert3();
      return 7;
    }
  }
  return result;
}

id sub_120BC(uint64_t a1, uint64_t a2, uint64_t a3, long long *a4, double a5)
{
  if (!a1) {
    return 0;
  }
  long long v53 = 0uLL;
  long long v52 = 0uLL;
  float32x2_t v50 = 0;
  uint64_t v51 = 0;
  uint64_t v48 = 0;
  uint64_t v49 = 0;
  simd_float3 v10 = matrix_identity_float3x3.columns[1];
  v47[0] = matrix_identity_float3x3.columns[0];
  v47[1] = v10;
  v47[2] = matrix_identity_float3x3.columns[2];
  v11 = (void *)+[CMIColourConstancyCommon getWhiteBalanceGains:*(void *)(a1 + 96) outputVector:&v53];
  if (v11)
  {
    id v38 = v11;
    goto LABEL_26;
  }
  v12 = (void *)+[CMIColourConstancyCommon getWhiteBalanceGains:*(void *)(a1 + 136) outputVector:&v52];
  if (v12)
  {
    id v38 = v12;
    goto LABEL_26;
  }
  v13 = (void *)+[CMIColourConstancyCommon getStrobeWhiteBalanceGains:*(void *)(a1 + 208) metadata:*(void *)(a1 + 136) outputVector:&v50];
  if (v13)
  {
    id v38 = v13;
    goto LABEL_26;
  }
  v14 = (void *)+[CMIColourConstancyCommon calculateEIT:*(void *)(a1 + 96) result:(char *)&v49 + 4];
  if (v14)
  {
    id v38 = v14;
    goto LABEL_26;
  }
  v15 = (void *)+[CMIColourConstancyCommon calculateEIT:*(void *)(a1 + 136) result:&v49];
  if (v15)
  {
    id v38 = v15;
    goto LABEL_26;
  }
  v16 = (void *)+[CMIColourConstancyCommon getLensShadingCorrectionMaxGain:*(void *)(a1 + 112) outputMaxGain:(char *)&v48 + 4];
  if (v16)
  {
    id v38 = v16;
    goto LABEL_26;
  }
  v17 = (void *)+[CMIColourConstancyCommon getLensShadingCorrectionMaxGain:*(void *)(a1 + 152) outputMaxGain:&v48];
  if (v17)
  {
    id v38 = v17;
    goto LABEL_26;
  }
  v18 = (void *)+[CMIColourConstancyCommon getStrobeColourCorrectionMatrix:*(void *)(a1 + 136) outputMatrix:v47];
  if (v18)
  {
    id v38 = v18;
    goto LABEL_26;
  }
  *(float32x2_t *)v19.f32 = vmaxnm_f32(v50, (float32x2_t)0x3400000034000000);
  v19.i32[2] = fmaxf(*(float *)&v51, 0.00000011921);
  long long v41 = v52;
  __asm { FMOV            V1.4S, #1.0 }
  float32x4_t v42 = _Q1;
  long long v43 = v53;
  float32x4_t v44 = vdivq_f32(_Q1, v19);
  *(float32x4_t *)(a1 + 64) = v44;
  id v25 = [*(id *)(a1 + 192) prepareToProcessWithConfig:*(void *)(a1 + 184) processingType:0];
  if (v25)
  {
    id v38 = v25;
    goto LABEL_26;
  }
  *(float32x2_t *)v26.f32 = vmaxnm_f32(*(float32x2_t *)&v41, (float32x2_t)0x3400000034000000);
  v26.i32[2] = fmaxf(*((float *)&v41 + 2), 0.00000011921);
  *(float32x2_t *)v28.f32 = vmaxnm_f32(*(float32x2_t *)&v43, (float32x2_t)0x3400000034000000);
  v28.i64[1] = __PAIR64__(HIDWORD(v41), COERCE_UNSIGNED_INT(fmaxf(*((float *)&v43 + 2), 0.00000011921)));
  v29 = *(void **)(a1 + 192);
  uint64_t v30 = *(void *)(a1 + 80);
  uint64_t v31 = *(void *)(a1 + 88);
  uint64_t v32 = *(void *)(a1 + 120);
  uint64_t v33 = *(void *)(a1 + 128);
  uint64_t v34 = *(void *)(a1 + 104);
  uint64_t v35 = *(void *)(a1 + 144);
  LODWORD(v27) = HIDWORD(v49);
  long long v45 = *a4;
  int v46 = *((_DWORD *)a4 + 4);
  LODWORD(v40) = v49;
  id v36 = objc_msgSend(v29, "applyWithAmbientLumaTexture:ambientChromaTexture:flashLumaTexture:flashChromaTexture:ambientYUVOffsets:flashYUVOffsets:ambientLSCGainsTexture:flashLSCGainsTexture:ambientLSCMaxGain:flashLSCMaxGain:ambientWhitePoint:flashWhitePoint:strobeWhitePoint:ambientIntegrationTime:flashIntegrationTime:cropRect:LSCCropRect:fullSizeDimensions:strobeCCM:outputColourAccuracyConfidenceTexture:outputLumaTexture:outputChromaTexture:", v30, v31, v32, v33, v34, v35, 0.0, 0.0, COERCE_DOUBLE(__PAIR64__(v42.u32[1], HIDWORD(v48))), COERCE_DOUBLE(__PAIR64__(DWORD1(v43), v48)), *(double *)vdivq_f32(v42, v28).i64, *(double *)vdivq_f32(v42, v26).i64, *(double *)v44.i64, v27,
          v40,
          a2,
          a3,
          &v45,
          *(void *)&a5);
  if (v36)
  {
    id v38 = v36;
    goto LABEL_26;
  }
  id v37 = [*(id *)(a1 + 192) finishProcessing];
  if (v37)
  {
    id v38 = v37;
    goto LABEL_26;
  }
  id v38 = [*(id *)(a1 + 192) getCenterWeightedColourAccuracyConfidenceLevel:a1 + 204];
  if (v38) {
LABEL_26:
  }
    FigDebugAssert3();
  return v38;
}

uint64_t sub_13058(uint64_t a1, void *a2)
{
  id v4 = a2;
  v5 = v4;
  if (a1)
  {
    v6 = [v4 objectForKeyedSubscript:@"ThumbnailHeight"];
    if (v6)
    {
      v7 = [v5 objectForKeyedSubscript:@"ThumbnailHeight"];
      v8 = (id *)(a1 + 184);
      objc_msgSend(*(id *)(a1 + 184), "setThumbnailHeight:", objc_msgSend(v7, "intValue"));
    }
    else
    {
      v8 = (id *)(a1 + 184);
      objc_msgSend(*(id *)(a1 + 184), "setThumbnailHeight:", objc_msgSend(*(id *)(a1 + 184), "thumbnailHeight"));
    }

    v9 = [v5 objectForKeyedSubscript:@"ThumbnailWidth"];
    if (v9)
    {
      simd_float3 v10 = [v5 objectForKeyedSubscript:@"ThumbnailWidth"];
      objc_msgSend(*v8, "setThumbnailWidth:", objc_msgSend(v10, "intValue"));
    }
    else
    {
      objc_msgSend(*v8, "setThumbnailWidth:", objc_msgSend(*v8, "thumbnailWidth"));
    }

    uint64_t v514 = a1;
    [*(id *)(a1 + 184) setClippingRecoveryEnabled:*(unsigned __int8 *)(a1 + 201)];
    v11 = [v5 objectForKeyedSubscript:@"ClippingRecovery"];
    v12 = [v11 objectForKeyedSubscript:@"PyramidGaussianSigma"];
    if (v12)
    {
      v13 = [v5 objectForKeyedSubscript:@"ClippingRecovery"];
      v2 = [v13 objectForKeyedSubscript:@"PyramidGaussianSigma"];
      [v2 floatValue];
    }
    else
    {
      v13 = [*v8 clippingRecoveryConfig];
      [v13 pyramidGaussianSigma];
    }
    int v15 = v14;
    v16 = [*v8 clippingRecoveryConfig];
    LODWORD(v17) = v15;
    [v16 setPyramidGaussianSigma:v17];

    if (v12) {
    v18 = [v5 objectForKeyedSubscript:@"ClippingRecovery"];
    }
    float32x4_t v19 = [v18 objectForKeyedSubscript:@"PyramidGaussianKernelRadius"];
    if (v19)
    {
      v20 = [v5 objectForKeyedSubscript:@"ClippingRecovery"];
      v2 = [v20 objectForKeyedSubscript:@"PyramidGaussianKernelRadius"];
      id v21 = [v2 intValue];
    }
    else
    {
      v20 = [*v8 clippingRecoveryConfig];
      id v21 = [v20 pyramidGaussianKernelRadius];
    }
    v22 = [*v8 clippingRecoveryConfig];
    [v22 setPyramidGaussianKernelRadius:v21];

    if (v19) {
    v23 = [v5 objectForKeyedSubscript:@"ClippingRecovery"];
    }
    v24 = [v23 objectForKeyedSubscript:@"ClippedLikelihoodScalar"];
    if (v24)
    {
      id v25 = [v5 objectForKeyedSubscript:@"ClippingRecovery"];
      v2 = [v25 objectForKeyedSubscript:@"ClippedLikelihoodScalar"];
      [v2 floatValue];
    }
    else
    {
      id v25 = [*v8 clippingRecoveryConfig];
      [v25 clippedLikelihoodScalar];
    }
    int v27 = v26;
    float32x4_t v28 = [*v8 clippingRecoveryConfig];
    LODWORD(v29) = v27;
    [v28 setClippedLikelihoodScalar:v29];

    if (v24) {
    uint64_t v30 = [v5 objectForKeyedSubscript:@"ClippingRecovery"];
    }
    uint64_t v31 = [v30 objectForKeyedSubscript:@"ClippedLikelihoodExponent"];
    if (v31)
    {
      uint64_t v32 = [v5 objectForKeyedSubscript:@"ClippingRecovery"];
      v2 = [v32 objectForKeyedSubscript:@"ClippedLikelihoodExponent"];
      [v2 floatValue];
    }
    else
    {
      uint64_t v32 = [*v8 clippingRecoveryConfig];
      [v32 clippedLikelihoodExponent];
    }
    int v34 = v33;
    uint64_t v35 = [*v8 clippingRecoveryConfig];
    LODWORD(v36) = v34;
    [v35 setClippedLikelihoodExponent:v36];

    if (v31) {
    id v37 = [v5 objectForKeyedSubscript:@"ClippingRecovery"];
    }
    id v38 = [v37 objectForKeyedSubscript:@"FusionMapDilationRadius"];
    if (v38)
    {
      v39 = [v5 objectForKeyedSubscript:@"ClippingRecovery"];
      v2 = [v39 objectForKeyedSubscript:@"FusionMapDilationRadius"];
      id v40 = [v2 intValue];
    }
    else
    {
      v39 = [*v8 clippingRecoveryConfig];
      id v40 = [v39 fusionMapDilationRadius];
    }
    long long v41 = [*v8 clippingRecoveryConfig];
    [v41 setFusionMapDilationRadius:v40];

    if (v38) {
    float32x4_t v42 = [v5 objectForKeyedSubscript:@"ClippingRecovery"];
    }
    long long v43 = [v42 objectForKeyedSubscript:@"FusionMapGaussianSigma"];
    if (v43)
    {
      float32x4_t v44 = [v5 objectForKeyedSubscript:@"ClippingRecovery"];
      v2 = [v44 objectForKeyedSubscript:@"FusionMapGaussianSigma"];
      [v2 floatValue];
    }
    else
    {
      float32x4_t v44 = [*v8 clippingRecoveryConfig];
      [v44 fusionMapGaussianSigma];
    }
    int v46 = v45;
    v47 = [*v8 clippingRecoveryConfig];
    LODWORD(v48) = v46;
    [v47 setFusionMapGaussianSigma:v48];

    if (v43) {
    uint64_t v49 = [v5 objectForKeyedSubscript:@"ClippingRecovery"];
    }
    float32x2_t v50 = [v49 objectForKeyedSubscript:@"FusionMapGaussianKernelRadius"];
    if (v50)
    {
      uint64_t v51 = [v5 objectForKeyedSubscript:@"ClippingRecovery"];
      v2 = [v51 objectForKeyedSubscript:@"FusionMapGaussianKernelRadius"];
      id v52 = [v2 intValue];
    }
    else
    {
      uint64_t v51 = [*v8 clippingRecoveryConfig];
      id v52 = [v51 fusionMapGaussianKernelRadius];
    }
    long long v53 = [*v8 clippingRecoveryConfig];
    [v53 setFusionMapGaussianKernelRadius:v52];

    if (v50) {
    v54 = [v5 objectForKeyedSubscript:@"ClippingRecovery"];
    }
    v55 = [v54 objectForKeyedSubscript:@"Gamma"];
    if (v55)
    {
      v56 = [v5 objectForKeyedSubscript:@"ClippingRecovery"];
      v2 = [v56 objectForKeyedSubscript:@"Gamma"];
      [v2 floatValue];
    }
    else
    {
      v56 = [*v8 clippingRecoveryConfig];
      [v56 gamma];
    }
    int v58 = v57;
    v59 = [*v8 clippingRecoveryConfig];
    LODWORD(v60) = v58;
    [v59 setGamma:v60];

    if (v55) {
    v61 = [v5 objectForKeyedSubscript:@"ClippingRecovery"];
    }
    v62 = [v61 objectForKeyedSubscript:@"MicroHazeDetection"];
    v63 = [v62 objectForKeyedSubscript:@"GridWidth"];
    if (v63)
    {
      v64 = [v5 objectForKeyedSubscript:@"ClippingRecovery"];
      v65 = [v64 objectForKeyedSubscript:@"MicroHazeDetection"];
      long long v53 = [v65 objectForKeyedSubscript:@"GridWidth"];
      id v66 = [v53 intValue];
    }
    else
    {
      v64 = [*v8 clippingRecoveryConfig];
      v65 = [v64 microHazeDetectionConfig];
      id v66 = [v65 gridWidth];
    }
    v515 = v8;
    v67 = [*v8 clippingRecoveryConfig];
    v68 = [v67 microHazeDetectionConfig];
    [v68 setGridWidth:v66];

    if (v63) {
    v69 = [v5 objectForKeyedSubscript:@"ClippingRecovery"];
    }
    v70 = [v69 objectForKeyedSubscript:@"MicroHazeDetection"];
    v71 = [v70 objectForKeyedSubscript:@"GridHeight"];
    if (v71)
    {
      v72 = [v5 objectForKeyedSubscript:@"ClippingRecovery"];
      v73 = [v72 objectForKeyedSubscript:@"MicroHazeDetection"];
      long long v53 = [v73 objectForKeyedSubscript:@"GridHeight"];
      id v74 = [v53 intValue];
      v75 = v515;
    }
    else
    {
      v75 = v515;
      v72 = [*v515 clippingRecoveryConfig];
      v73 = [v72 microHazeDetectionConfig];
      id v74 = [v73 gridHeight];
    }
    v76 = [*v75 clippingRecoveryConfig];
    v77 = [v76 microHazeDetectionConfig];
    [v77 setGridHeight:v74];

    if (v71) {
    v78 = [v5 objectForKeyedSubscript:@"ClippingRecovery"];
    }
    v79 = [v78 objectForKeyedSubscript:@"MicroHazeDetection"];
    v80 = [v79 objectForKeyedSubscript:@"GridBands"];
    if (v80)
    {
      v81 = [v5 objectForKeyedSubscript:@"ClippingRecovery"];
      v82 = [v81 objectForKeyedSubscript:@"MicroHazeDetection"];
      long long v53 = [v82 objectForKeyedSubscript:@"GridBands"];
      id v83 = [v53 intValue];
      v84 = v515;
    }
    else
    {
      v84 = v515;
      v81 = [*v515 clippingRecoveryConfig];
      v82 = [v81 microHazeDetectionConfig];
      id v83 = [v82 gridBands];
    }
    v85 = [*v84 clippingRecoveryConfig];
    v86 = [v85 microHazeDetectionConfig];
    [v86 setGridBands:v83];

    if (v80) {
    v87 = [v5 objectForKeyedSubscript:@"ClippingRecovery"];
    }
    v88 = [v87 objectForKeyedSubscript:@"MicroHazeDetection"];
    v89 = [v88 objectForKeyedSubscript:@"GridRegionScale"];
    if (v89)
    {
      v90 = [v5 objectForKeyedSubscript:@"ClippingRecovery"];
      v91 = [v90 objectForKeyedSubscript:@"MicroHazeDetection"];
      long long v53 = [v91 objectForKeyedSubscript:@"GridRegionScale"];
      [v53 floatValue];
      int v93 = v92;
      v94 = v515;
    }
    else
    {
      v94 = v515;
      v90 = [*v515 clippingRecoveryConfig];
      v91 = [v90 microHazeDetectionConfig];
      [v91 gridRegionScale];
      int v93 = v95;
    }
    v96 = [*v94 clippingRecoveryConfig];
    v97 = [v96 microHazeDetectionConfig];
    LODWORD(v98) = v93;
    [v97 setGridRegionScale:v98];

    if (v89) {
    v99 = [v5 objectForKeyedSubscript:@"ClippingRecovery"];
    }
    v100 = [v99 objectForKeyedSubscript:@"MicroHazeDetection"];
    v101 = [v100 objectForKeyedSubscript:@"GainMapWidth"];
    if (v101)
    {
      v102 = [v5 objectForKeyedSubscript:@"ClippingRecovery"];
      v103 = [v102 objectForKeyedSubscript:@"MicroHazeDetection"];
      long long v53 = [v103 objectForKeyedSubscript:@"GainMapWidth"];
      id v104 = [v53 intValue];
    }
    else
    {
      v102 = [*v94 clippingRecoveryConfig];
      v103 = [v102 microHazeDetectionConfig];
      id v104 = [v103 gainMapWidth];
    }
    v105 = [*v94 clippingRecoveryConfig];
    v106 = [v105 microHazeDetectionConfig];
    [v106 setGainMapWidth:v104];

    if (v101) {
    v107 = [v5 objectForKeyedSubscript:@"ClippingRecovery"];
    }
    v108 = [v107 objectForKeyedSubscript:@"MicroHazeDetection"];
    v109 = [v108 objectForKeyedSubscript:@"GainMapHeight"];
    if (v109)
    {
      v110 = [v5 objectForKeyedSubscript:@"ClippingRecovery"];
      v111 = [v110 objectForKeyedSubscript:@"MicroHazeDetection"];
      long long v53 = [v111 objectForKeyedSubscript:@"GainMapHeight"];
      id v112 = [v53 intValue];
      v113 = v515;
    }
    else
    {
      v113 = v515;
      v110 = [*v515 clippingRecoveryConfig];
      v111 = [v110 microHazeDetectionConfig];
      id v112 = [v111 gainMapHeight];
    }
    v114 = [*v113 clippingRecoveryConfig];
    v115 = [v114 microHazeDetectionConfig];
    [v115 setGainMapHeight:v112];

    if (v109) {
    v116 = [v5 objectForKeyedSubscript:@"ClippingRecovery"];
    }
    v117 = [v116 objectForKeyedSubscript:@"MicroHazeDetection"];
    v118 = [v117 objectForKeyedSubscript:@"BandingMinWeight"];
    if (v118)
    {
      v119 = [v5 objectForKeyedSubscript:@"ClippingRecovery"];
      v120 = [v119 objectForKeyedSubscript:@"MicroHazeDetection"];
      long long v53 = [v120 objectForKeyedSubscript:@"BandingMinWeight"];
      [v53 floatValue];
      int v122 = v121;
      v123 = v515;
    }
    else
    {
      v123 = v515;
      v119 = [*v515 clippingRecoveryConfig];
      v120 = [v119 microHazeDetectionConfig];
      [v120 bandingMinWeight];
      int v122 = v124;
    }
    v125 = [*v123 clippingRecoveryConfig];
    v126 = [v125 microHazeDetectionConfig];
    LODWORD(v127) = v122;
    [v126 setBandingMinWeight:v127];

    if (v118) {
    v128 = [v5 objectForKeyedSubscript:@"ClippingRecovery"];
    }
    v129 = [v128 objectForKeyedSubscript:@"MicroHazeDetection"];
    v130 = [v129 objectForKeyedSubscript:@"BandingGaussianSigmaScale"];
    if (v130)
    {
      v131 = [v5 objectForKeyedSubscript:@"ClippingRecovery"];
      v132 = [v131 objectForKeyedSubscript:@"MicroHazeDetection"];
      long long v53 = [v132 objectForKeyedSubscript:@"BandingGaussianSigmaScale"];
      [v53 floatValue];
    }
    else
    {
      v131 = [*v123 clippingRecoveryConfig];
      v132 = [v131 microHazeDetectionConfig];
      [v132 bandingGaussianSigmaScale];
    }
    int v134 = v133;
    v135 = [*v123 clippingRecoveryConfig];
    v136 = [v135 microHazeDetectionConfig];
    LODWORD(v137) = v134;
    [v136 setBandingGaussianSigmaScale:v137];

    if (v130) {
    v138 = [v5 objectForKeyedSubscript:@"ClippingRecovery"];
    }
    v139 = [v138 objectForKeyedSubscript:@"MicroHazeDetection"];
    v140 = [v139 objectForKeyedSubscript:@"FilterToSigmaScale"];
    if (v140)
    {
      v141 = [v5 objectForKeyedSubscript:@"ClippingRecovery"];
      v142 = [v141 objectForKeyedSubscript:@"MicroHazeDetection"];
      long long v53 = [v142 objectForKeyedSubscript:@"FilterToSigmaScale"];
      [v53 floatValue];
    }
    else
    {
      v141 = [*v123 clippingRecoveryConfig];
      v142 = [v141 microHazeDetectionConfig];
      [v142 filterToSigmaScale];
    }
    int v144 = v143;
    v145 = [*v123 clippingRecoveryConfig];
    v146 = [v145 microHazeDetectionConfig];
    LODWORD(v147) = v144;
    [v146 setFilterToSigmaScale:v147];

    if (v140) {
    v148 = [v5 objectForKeyedSubscript:@"ClippingRecovery"];
    }
    v149 = [v148 objectForKeyedSubscript:@"MicroHazeDetection"];
    v150 = [v149 objectForKeyedSubscript:@"SpatialGaussianSigmaScale"];
    if (v150)
    {
      v151 = [v5 objectForKeyedSubscript:@"ClippingRecovery"];
      v152 = [v151 objectForKeyedSubscript:@"MicroHazeDetection"];
      long long v53 = [v152 objectForKeyedSubscript:@"SpatialGaussianSigmaScale"];
      [v53 floatValue];
    }
    else
    {
      v151 = [*v123 clippingRecoveryConfig];
      v152 = [v151 microHazeDetectionConfig];
      [v152 spatialGaussianSigmaScale];
    }
    int v154 = v153;
    v155 = [*v123 clippingRecoveryConfig];
    v156 = [v155 microHazeDetectionConfig];
    LODWORD(v157) = v154;
    [v156 setSpatialGaussianSigmaScale:v157];

    if (v150) {
    v158 = [v5 objectForKeyedSubscript:@"ClippingRecovery"];
    }
    v159 = [v158 objectForKeyedSubscript:@"MicroHazeDetection"];
    v160 = [v159 objectForKeyedSubscript:@"StrongGradientsMaskResponseGain"];
    if (v160)
    {
      v161 = [v5 objectForKeyedSubscript:@"ClippingRecovery"];
      v162 = [v161 objectForKeyedSubscript:@"MicroHazeDetection"];
      long long v53 = [v162 objectForKeyedSubscript:@"StrongGradientsMaskResponseGain"];
      [v53 floatValue];
    }
    else
    {
      v161 = [*v123 clippingRecoveryConfig];
      v162 = [v161 microHazeDetectionConfig];
      [v162 strongGradientsMaskResponseGain];
    }
    int v164 = v163;
    v165 = [*v123 clippingRecoveryConfig];
    v166 = [v165 microHazeDetectionConfig];
    LODWORD(v167) = v164;
    [v166 setStrongGradientsMaskResponseGain:v167];

    if (v160) {
    v168 = [v5 objectForKeyedSubscript:@"ClippingRecovery"];
    }
    v169 = [v168 objectForKeyedSubscript:@"MicroHazeDetection"];
    v170 = [v169 objectForKeyedSubscript:@"StrongGradientsMaskResponseBias"];
    if (v170)
    {
      v171 = [v5 objectForKeyedSubscript:@"ClippingRecovery"];
      v172 = [v171 objectForKeyedSubscript:@"MicroHazeDetection"];
      long long v53 = [v172 objectForKeyedSubscript:@"StrongGradientsMaskResponseBias"];
      [v53 floatValue];
    }
    else
    {
      v171 = [*v123 clippingRecoveryConfig];
      v172 = [v171 microHazeDetectionConfig];
      [v172 strongGradientsMaskResponseBias];
    }
    int v174 = v173;
    v175 = [*v123 clippingRecoveryConfig];
    v176 = [v175 microHazeDetectionConfig];
    LODWORD(v177) = v174;
    [v176 setStrongGradientsMaskResponseBias:v177];

    if (v170) {
    v178 = [v5 objectForKeyedSubscript:@"ClippingRecovery"];
    }
    v179 = [v178 objectForKeyedSubscript:@"MicroHazeDetection"];
    v180 = [v179 objectForKeyedSubscript:@"StrongGradientsMaskResponseExponent"];
    if (v180)
    {
      v181 = [v5 objectForKeyedSubscript:@"ClippingRecovery"];
      v182 = [v181 objectForKeyedSubscript:@"MicroHazeDetection"];
      long long v53 = [v182 objectForKeyedSubscript:@"StrongGradientsMaskResponseExponent"];
      [v53 floatValue];
    }
    else
    {
      v181 = [*v123 clippingRecoveryConfig];
      v182 = [v181 microHazeDetectionConfig];
      [v182 strongGradientsMaskResponseExponent];
    }
    int v184 = v183;
    v185 = [*v123 clippingRecoveryConfig];
    v186 = [v185 microHazeDetectionConfig];
    LODWORD(v187) = v184;
    [v186 setStrongGradientsMaskResponseExponent:v187];

    if (v180) {
    v188 = [v5 objectForKeyedSubscript:@"ClippingRecovery"];
    }
    v189 = [v188 objectForKeyedSubscript:@"MicroHazeDetection"];
    v190 = [v189 objectForKeyedSubscript:@"PositiveIntensityMaskResponseGain"];
    if (v190)
    {
      v191 = [v5 objectForKeyedSubscript:@"ClippingRecovery"];
      v192 = [v191 objectForKeyedSubscript:@"MicroHazeDetection"];
      long long v53 = [v192 objectForKeyedSubscript:@"PositiveIntensityMaskResponseGain"];
      [v53 floatValue];
    }
    else
    {
      v191 = [*v123 clippingRecoveryConfig];
      v192 = [v191 microHazeDetectionConfig];
      [v192 positiveIntensityMaskResponseGain];
    }
    int v194 = v193;
    v195 = [*v123 clippingRecoveryConfig];
    v196 = [v195 microHazeDetectionConfig];
    LODWORD(v197) = v194;
    [v196 setPositiveIntensityMaskResponseGain:v197];

    if (v190) {
    v198 = [v5 objectForKeyedSubscript:@"ClippingRecovery"];
    }
    v199 = [v198 objectForKeyedSubscript:@"MicroHazeDetection"];
    v200 = [v199 objectForKeyedSubscript:@"PositiveIntensityMaskResponseBias"];
    if (v200)
    {
      v201 = [v5 objectForKeyedSubscript:@"ClippingRecovery"];
      v202 = [v201 objectForKeyedSubscript:@"MicroHazeDetection"];
      long long v53 = [v202 objectForKeyedSubscript:@"PositiveIntensityMaskResponseBias"];
      [v53 floatValue];
    }
    else
    {
      v201 = [*v123 clippingRecoveryConfig];
      v202 = [v201 microHazeDetectionConfig];
      [v202 positiveIntensityMaskResponseBias];
    }
    int v204 = v203;
    v205 = [*v123 clippingRecoveryConfig];
    v206 = [v205 microHazeDetectionConfig];
    LODWORD(v207) = v204;
    [v206 setPositiveIntensityMaskResponseBias:v207];

    if (v200) {
    v208 = [v5 objectForKeyedSubscript:@"ClippingRecovery"];
    }
    v209 = [v208 objectForKeyedSubscript:@"MicroHazeDetection"];
    v210 = [v209 objectForKeyedSubscript:@"PositiveIntensityMaskResponseExponent"];
    if (v210)
    {
      v211 = [v5 objectForKeyedSubscript:@"ClippingRecovery"];
      v212 = [v211 objectForKeyedSubscript:@"MicroHazeDetection"];
      long long v53 = [v212 objectForKeyedSubscript:@"PositiveIntensityMaskResponseExponent"];
      [v53 floatValue];
    }
    else
    {
      v211 = [*v123 clippingRecoveryConfig];
      v212 = [v211 microHazeDetectionConfig];
      [v212 positiveIntensityMaskResponseExponent];
    }
    int v214 = v213;
    v215 = [*v123 clippingRecoveryConfig];
    v216 = [v215 microHazeDetectionConfig];
    LODWORD(v217) = v214;
    [v216 setPositiveIntensityMaskResponseExponent:v217];

    if (v210) {
    v218 = [v5 objectForKeyedSubscript:@"ClippingRecovery"];
    }
    v219 = [v218 objectForKeyedSubscript:@"MicroHazeDetection"];
    v220 = [v219 objectForKeyedSubscript:@"MaskFusionGain"];
    if (v220)
    {
      v221 = [v5 objectForKeyedSubscript:@"ClippingRecovery"];
      v222 = [v221 objectForKeyedSubscript:@"MicroHazeDetection"];
      long long v53 = [v222 objectForKeyedSubscript:@"MaskFusionGain"];
      [v53 floatValue];
    }
    else
    {
      v221 = [*v123 clippingRecoveryConfig];
      v222 = [v221 microHazeDetectionConfig];
      [v222 maskFusionGain];
    }
    int v224 = v223;
    v225 = [*v123 clippingRecoveryConfig];
    v226 = [v225 microHazeDetectionConfig];
    LODWORD(v227) = v224;
    [v226 setMaskFusionGain:v227];

    if (v220) {
    v228 = [v5 objectForKeyedSubscript:@"ClippingRecovery"];
    }
    v229 = [v228 objectForKeyedSubscript:@"MicroHazeDetection"];
    v230 = [v229 objectForKeyedSubscript:@"MaskFusionMixFactor"];
    if (v230)
    {
      v231 = [v5 objectForKeyedSubscript:@"ClippingRecovery"];
      v232 = [v231 objectForKeyedSubscript:@"MicroHazeDetection"];
      long long v53 = [v232 objectForKeyedSubscript:@"MaskFusionMixFactor"];
      [v53 floatValue];
    }
    else
    {
      v231 = [*v123 clippingRecoveryConfig];
      v232 = [v231 microHazeDetectionConfig];
      [v232 maskFusionMixFactor];
    }
    int v234 = v233;
    v235 = [*v123 clippingRecoveryConfig];
    v236 = [v235 microHazeDetectionConfig];
    LODWORD(v237) = v234;
    [v236 setMaskFusionMixFactor:v237];

    if (v230) {
    v238 = [v5 objectForKeyedSubscript:@"ClippingRecovery"];
    }
    v239 = [v238 objectForKeyedSubscript:@"MicroHazeDetection"];
    v240 = [v239 objectForKeyedSubscript:@"AmbientQualityMinGain"];
    if (v240)
    {
      v241 = [v5 objectForKeyedSubscript:@"ClippingRecovery"];
      v242 = [v241 objectForKeyedSubscript:@"MicroHazeDetection"];
      long long v53 = [v242 objectForKeyedSubscript:@"AmbientQualityMinGain"];
      [v53 floatValue];
    }
    else
    {
      v241 = [*v123 clippingRecoveryConfig];
      v242 = [v241 microHazeDetectionConfig];
      [v242 ambientQualityMinGain];
    }
    int v244 = v243;
    v245 = [*v123 clippingRecoveryConfig];
    v246 = [v245 microHazeDetectionConfig];
    LODWORD(v247) = v244;
    [v246 setAmbientQualityMinGain:v247];

    if (v240) {
    v248 = [v5 objectForKeyedSubscript:@"ClippingRecovery"];
    }
    v249 = [v248 objectForKeyedSubscript:@"MicroHazeDetection"];
    v250 = [v249 objectForKeyedSubscript:@"AmbientQualityMaxGain"];
    if (v250)
    {
      v251 = [v5 objectForKeyedSubscript:@"ClippingRecovery"];
      v252 = [v251 objectForKeyedSubscript:@"MicroHazeDetection"];
      long long v53 = [v252 objectForKeyedSubscript:@"AmbientQualityMaxGain"];
      [v53 floatValue];
    }
    else
    {
      v251 = [*v123 clippingRecoveryConfig];
      v252 = [v251 microHazeDetectionConfig];
      [v252 ambientQualityMaxGain];
    }
    int v254 = v253;
    v255 = [*v123 clippingRecoveryConfig];
    v256 = [v255 microHazeDetectionConfig];
    LODWORD(v257) = v254;
    [v256 setAmbientQualityMaxGain:v257];

    if (v250) {
    v258 = [v5 objectForKeyedSubscript:@"ClippingRecovery"];
    }
    v259 = [v258 objectForKeyedSubscript:@"MicroHazeDetection"];
    v260 = [v259 objectForKeyedSubscript:@"AmbientQualityZeroThreshold"];
    if (v260)
    {
      v261 = [v5 objectForKeyedSubscript:@"ClippingRecovery"];
      v262 = [v261 objectForKeyedSubscript:@"MicroHazeDetection"];
      long long v53 = [v262 objectForKeyedSubscript:@"AmbientQualityZeroThreshold"];
      [v53 floatValue];
    }
    else
    {
      v261 = [*v123 clippingRecoveryConfig];
      v262 = [v261 microHazeDetectionConfig];
      [v262 ambientQualityZeroThreshold];
    }
    int v264 = v263;
    v265 = [*v123 clippingRecoveryConfig];
    v266 = [v265 microHazeDetectionConfig];
    LODWORD(v267) = v264;
    [v266 setAmbientQualityZeroThreshold:v267];

    if (v260) {
    v268 = [v5 objectForKeyedSubscript:@"ClippingRecovery"];
    }
    v269 = [v268 objectForKeyedSubscript:@"MicroHazeDetection"];
    v270 = [v269 objectForKeyedSubscript:@"AmbientQualityOneThreshold"];
    if (v270)
    {
      v271 = [v5 objectForKeyedSubscript:@"ClippingRecovery"];
      v272 = [v271 objectForKeyedSubscript:@"MicroHazeDetection"];
      long long v53 = [v272 objectForKeyedSubscript:@"AmbientQualityOneThreshold"];
      [v53 floatValue];
    }
    else
    {
      v271 = [*v123 clippingRecoveryConfig];
      v272 = [v271 microHazeDetectionConfig];
      [v272 ambientQualityOneThreshold];
    }
    int v274 = v273;
    v275 = [*v123 clippingRecoveryConfig];
    v276 = [v275 microHazeDetectionConfig];
    LODWORD(v277) = v274;
    [v276 setAmbientQualityOneThreshold:v277];

    if (v270) {
    v278 = [v5 objectForKeyedSubscript:@"ClippingRecovery"];
    }
    v279 = [v278 objectForKeyedSubscript:@"MicroHazeDetection"];
    v280 = [v279 objectForKeyedSubscript:@"ShadowEdgesResponseGain"];
    if (v280)
    {
      v281 = [v5 objectForKeyedSubscript:@"ClippingRecovery"];
      v282 = [v281 objectForKeyedSubscript:@"MicroHazeDetection"];
      long long v53 = [v282 objectForKeyedSubscript:@"ShadowEdgesResponseGain"];
      [v53 floatValue];
    }
    else
    {
      v281 = [*v123 clippingRecoveryConfig];
      v282 = [v281 microHazeDetectionConfig];
      [v282 shadowEdgesResponseGain];
    }
    int v284 = v283;
    v285 = [*v123 clippingRecoveryConfig];
    v286 = [v285 microHazeDetectionConfig];
    LODWORD(v287) = v284;
    [v286 setShadowEdgesResponseGain:v287];

    if (v280) {
    v288 = [v5 objectForKeyedSubscript:@"ClippingRecovery"];
    }
    v289 = [v288 objectForKeyedSubscript:@"MicroHazeDetection"];
    v290 = [v289 objectForKeyedSubscript:@"ShadowEdgesResponseExponent"];
    if (v290)
    {
      v291 = [v5 objectForKeyedSubscript:@"ClippingRecovery"];
      v292 = [v291 objectForKeyedSubscript:@"MicroHazeDetection"];
      long long v53 = [v292 objectForKeyedSubscript:@"ShadowEdgesResponseExponent"];
      [v53 floatValue];
    }
    else
    {
      v291 = [*v123 clippingRecoveryConfig];
      v292 = [v291 microHazeDetectionConfig];
      [v292 shadowEdgesResponseExponent];
    }
    int v294 = v293;
    v295 = [*v123 clippingRecoveryConfig];
    v296 = [v295 microHazeDetectionConfig];
    LODWORD(v297) = v294;
    [v296 setShadowEdgesResponseExponent:v297];

    if (v290) {
    v298 = [v5 objectForKeyedSubscript:@"ClippingRecovery"];
    }
    v299 = [v298 objectForKeyedSubscript:@"MicroHazeDetection"];
    v300 = [v299 objectForKeyedSubscript:@"FusionDiffuseGaussianSigma"];
    if (v300)
    {
      v301 = [v5 objectForKeyedSubscript:@"ClippingRecovery"];
      v302 = [v301 objectForKeyedSubscript:@"MicroHazeDetection"];
      long long v53 = [v302 objectForKeyedSubscript:@"FusionDiffuseGaussianSigma"];
      [v53 floatValue];
    }
    else
    {
      v301 = [*v123 clippingRecoveryConfig];
      v302 = [v301 microHazeDetectionConfig];
      [v302 fusionDiffuseGaussianSigma];
    }
    int v304 = v303;
    v305 = [*v123 clippingRecoveryConfig];
    v306 = [v305 microHazeDetectionConfig];
    LODWORD(v307) = v304;
    [v306 setFusionDiffuseGaussianSigma:v307];

    if (v300) {
    v308 = [v5 objectForKeyedSubscript:@"ClippingRecovery"];
    }
    v309 = [v308 objectForKeyedSubscript:@"MicroHazeDetection"];
    v310 = [v309 objectForKeyedSubscript:@"FusionDiffuseSigmaToHalfFilterScale"];
    if (v310)
    {
      v311 = [v5 objectForKeyedSubscript:@"ClippingRecovery"];
      v312 = [v311 objectForKeyedSubscript:@"MicroHazeDetection"];
      long long v53 = [v312 objectForKeyedSubscript:@"FusionDiffuseSigmaToHalfFilterScale"];
      [v53 floatValue];
    }
    else
    {
      v311 = [*v123 clippingRecoveryConfig];
      v312 = [v311 microHazeDetectionConfig];
      [v312 fusionDiffuseSigmaToHalfFilterScale];
    }
    int v314 = v313;
    v315 = [*v123 clippingRecoveryConfig];
    v316 = [v315 microHazeDetectionConfig];
    LODWORD(v317) = v314;
    [v316 setFusionDiffuseSigmaToHalfFilterScale:v317];

    if (v310) {
    v318 = [v5 objectForKeyedSubscript:@"SensorSpaceConversion"];
    }
    v319 = [v318 objectForKeyedSubscript:@"ClippedConfidenceLikelihoodScale"];
    if (v319)
    {
      v320 = [v5 objectForKeyedSubscript:@"SensorSpaceConversion"];
      v311 = [v320 objectForKeyedSubscript:@"ClippedConfidenceLikelihoodScale"];
      [v311 floatValue];
    }
    else
    {
      v320 = [*v123 sensorSpaceConversionConfig];
      [v320 clippedConfidenceLikelihoodScale];
    }
    int v322 = v321;
    v323 = [*v123 sensorSpaceConversionConfig];
    LODWORD(v324) = v322;
    [v323 setClippedConfidenceLikelihoodScale:v324];

    if (v319) {
    v325 = [v5 objectForKeyedSubscript:@"SensorSpaceConversion"];
    }
    v326 = [v325 objectForKeyedSubscript:@"ClippedConfidenceLikelihoodExponent"];
    if (v326)
    {
      v327 = [v5 objectForKeyedSubscript:@"SensorSpaceConversion"];
      v311 = [v327 objectForKeyedSubscript:@"ClippedConfidenceLikelihoodExponent"];
      [v311 floatValue];
    }
    else
    {
      v327 = [*v123 sensorSpaceConversionConfig];
      [v327 clippedConfidenceLikelihoodExponent];
    }
    int v329 = v328;
    v330 = [*v123 sensorSpaceConversionConfig];
    LODWORD(v331) = v329;
    [v330 setClippedConfidenceLikelihoodExponent:v331];

    if (v326) {
    v332 = [v5 objectForKeyedSubscript:@"StrobeCorrection"];
    }
    v333 = [v332 objectForKeyedSubscript:@"StrobeBeamProfileScaleMinimum"];
    if (v333)
    {
      v334 = [v5 objectForKeyedSubscript:@"StrobeCorrection"];
      v311 = [v334 objectForKeyedSubscript:@"StrobeBeamProfileScaleMinimum"];
      [v311 floatValue];
    }
    else
    {
      v334 = [*v123 strobeCorrectionConfig];
      [v334 strobeBeamProfileScaleMinimum];
    }
    int v336 = v335;
    v337 = [*v123 strobeCorrectionConfig];
    LODWORD(v338) = v336;
    [v337 setStrobeBeamProfileScaleMinimum:v338];

    if (v333) {
    v339 = [v5 objectForKeyedSubscript:@"StrobeCorrection"];
    }
    v340 = [v339 objectForKeyedSubscript:@"StrobeBeamProfileScaleMaximum"];
    if (v340)
    {
      v341 = [v5 objectForKeyedSubscript:@"StrobeCorrection"];
      v311 = [v341 objectForKeyedSubscript:@"StrobeBeamProfileScaleMaximum"];
      [v311 floatValue];
    }
    else
    {
      v341 = [*v123 strobeCorrectionConfig];
      [v341 strobeBeamProfileScaleMaximum];
    }
    int v343 = v342;
    v344 = [*v123 strobeCorrectionConfig];
    LODWORD(v345) = v343;
    [v344 setStrobeBeamProfileScaleMaximum:v345];

    if (v340) {
    v346 = [v5 objectForKeyedSubscript:@"StrobeCorrection"];
    }
    v347 = [v346 objectForKeyedSubscript:@"StrobeBeamProfileComponentZeroThreshold"];
    if (v347)
    {
      v348 = [v5 objectForKeyedSubscript:@"StrobeCorrection"];
      v311 = [v348 objectForKeyedSubscript:@"StrobeBeamProfileComponentZeroThreshold"];
      [v311 floatValue];
    }
    else
    {
      v348 = [*v123 strobeCorrectionConfig];
      [v348 strobeBeamProfileComponentZeroThreshold];
    }
    int v350 = v349;
    v351 = [*v123 strobeCorrectionConfig];
    LODWORD(v352) = v350;
    [v351 setStrobeBeamProfileComponentZeroThreshold:v352];

    if (v347) {
    v353 = [v5 objectForKeyedSubscript:@"StrobeCorrection"];
    }
    v354 = [v353 objectForKeyedSubscript:@"StrobeBeamProfileComponentOneThreshold"];
    if (v354)
    {
      v355 = [v5 objectForKeyedSubscript:@"StrobeCorrection"];
      v311 = [v355 objectForKeyedSubscript:@"StrobeBeamProfileComponentOneThreshold"];
      [v311 floatValue];
    }
    else
    {
      v355 = [*v123 strobeCorrectionConfig];
      [v355 strobeBeamProfileComponentOneThreshold];
    }
    int v357 = v356;
    v358 = [*v123 strobeCorrectionConfig];
    LODWORD(v359) = v357;
    [v358 setStrobeBeamProfileComponentOneThreshold:v359];

    if (v354) {
    v360 = [v5 objectForKeyedSubscript:@"ToneCompression"];
    }
    v361 = [v360 objectForKeyedSubscript:@"NumIntensityHistogramBins"];
    if (v361)
    {
      v362 = [v5 objectForKeyedSubscript:@"ToneCompression"];
      v311 = [v362 objectForKeyedSubscript:@"NumIntensityHistogramBins"];
      id v363 = [v311 intValue];
    }
    else
    {
      v362 = [*v123 toneCompressionConfig];
      id v363 = [v362 numIntensityHistogramBins];
    }
    v364 = [*v123 toneCompressionConfig];
    [v364 setNumIntensityHistogramBins:v363];

    if (v361) {
    v365 = [v5 objectForKeyedSubscript:@"ToneCompression"];
    }
    v366 = [v365 objectForKeyedSubscript:@"BalanceDenseToSparseExponentFactor"];
    if (v366)
    {
      v367 = [v5 objectForKeyedSubscript:@"ToneCompression"];
      v311 = [v367 objectForKeyedSubscript:@"BalanceDenseToSparseExponentFactor"];
      [v311 floatValue];
    }
    else
    {
      v367 = [*v123 toneCompressionConfig];
      [v367 balanceDenseToSparseExponentFactor];
    }
    int v369 = v368;
    v370 = [*v123 toneCompressionConfig];
    LODWORD(v371) = v369;
    [v370 setBalanceDenseToSparseExponentFactor:v371];

    if (v366) {
    v372 = [v5 objectForKeyedSubscript:@"ToneCompression"];
    }
    v373 = [v372 objectForKeyedSubscript:@"MinimumProbabilityDensity"];
    if (v373)
    {
      v374 = [v5 objectForKeyedSubscript:@"ToneCompression"];
      v311 = [v374 objectForKeyedSubscript:@"MinimumProbabilityDensity"];
      [v311 floatValue];
    }
    else
    {
      v374 = [*v123 toneCompressionConfig];
      [v374 minimumProbabilityDensity];
    }
    int v376 = v375;
    v377 = [*v123 toneCompressionConfig];
    LODWORD(v378) = v376;
    [v377 setMinimumProbabilityDensity:v378];

    if (v373) {
    v379 = [v5 objectForKeyedSubscript:@"ToneCompression"];
    }
    v380 = [v379 objectForKeyedSubscript:@"KernelSupportGaussianSigma"];
    if (v380)
    {
      v381 = [v5 objectForKeyedSubscript:@"ToneCompression"];
      v311 = [v381 objectForKeyedSubscript:@"KernelSupportGaussianSigma"];
      [v311 floatValue];
    }
    else
    {
      v381 = [*v123 toneCompressionConfig];
      [v381 kernelSupportGaussianSigma];
    }
    int v383 = v382;
    v384 = [*v123 toneCompressionConfig];
    LODWORD(v385) = v383;
    [v384 setKernelSupportGaussianSigma:v385];

    if (v380) {
    v386 = [v5 objectForKeyedSubscript:@"ColourAccuracyConfidence"];
    }
    v387 = [v386 objectForKeyedSubscript:@"StrobeIlluminationZeroThreshold"];
    if (v387)
    {
      v388 = [v5 objectForKeyedSubscript:@"ColourAccuracyConfidence"];
      v311 = [v388 objectForKeyedSubscript:@"StrobeIlluminationZeroThreshold"];
      [v311 floatValue];
    }
    else
    {
      v388 = [*v123 colourAccuracyConfidenceConfig];
      [v388 strobeIlluminationZeroThreshold];
    }
    int v390 = v389;
    v391 = [*v123 colourAccuracyConfidenceConfig];
    LODWORD(v392) = v390;
    [v391 setStrobeIlluminationZeroThreshold:v392];

    if (v387) {
    v393 = [v5 objectForKeyedSubscript:@"ColourAccuracyConfidence"];
    }
    v394 = [v393 objectForKeyedSubscript:@"StrobeIlluminationOneThreshold"];
    if (v394)
    {
      v395 = [v5 objectForKeyedSubscript:@"ColourAccuracyConfidence"];
      v311 = [v395 objectForKeyedSubscript:@"StrobeIlluminationOneThreshold"];
      [v311 floatValue];
    }
    else
    {
      v395 = [*v123 colourAccuracyConfidenceConfig];
      [v395 strobeIlluminationOneThreshold];
    }
    int v397 = v396;
    v398 = [*v123 colourAccuracyConfidenceConfig];
    LODWORD(v399) = v397;
    [v398 setStrobeIlluminationOneThreshold:v399];

    if (v394) {
    v400 = [v5 objectForKeyedSubscript:@"ColourAccuracyConfidence"];
    }
    v401 = [v400 objectForKeyedSubscript:@"CenterWeightingGaussianSigmaScale"];
    if (v401)
    {
      v402 = [v5 objectForKeyedSubscript:@"ColourAccuracyConfidence"];
      v311 = [v402 objectForKeyedSubscript:@"CenterWeightingGaussianSigmaScale"];
      [v311 floatValue];
    }
    else
    {
      v402 = [*v123 colourAccuracyConfidenceConfig];
      [v402 centerWeightingGaussianSigmaScale];
    }
    int v404 = v403;
    v405 = [*v123 colourAccuracyConfidenceConfig];
    LODWORD(v406) = v404;
    [v405 setCenterWeightingGaussianSigmaScale:v406];

    if (v401) {
    id v407 = [*v123 thumbnailWidth];
    }
    v408 = [*v123 whiteBalanceStrobeConfig];
    [v408 setThumbnailWidth:v407];

    id v409 = [*v123 thumbnailHeight];
    v410 = [*v123 whiteBalanceStrobeConfig];
    [v410 setThumbnailHeight:v409];

    v411 = [v5 objectForKeyedSubscript:@"WhiteBalanceStrobe"];
    v412 = [v411 objectForKeyedSubscript:@"LowStrobeIlluminationFlashFusionEnabled"];
    if (v412)
    {
      v413 = [v5 objectForKeyedSubscript:@"WhiteBalanceStrobe"];
      v311 = [v413 objectForKeyedSubscript:@"LowStrobeIlluminationFlashFusionEnabled"];
      id v414 = [v311 BOOLValue];
    }
    else
    {
      v413 = [*v123 whiteBalanceStrobeConfig];
      id v414 = [v413 lowStrobeIlluminationFlashFusionEnabled];
    }
    v415 = [*v123 whiteBalanceStrobeConfig];
    [v415 setLowStrobeIlluminationFlashFusionEnabled:v414];

    if (v412) {
    v416 = [v5 objectForKeyedSubscript:@"WhiteBalanceStrobe"];
    }
    v417 = [v416 objectForKeyedSubscript:@"BalanceMatchingMinimumConfidenceWeight"];
    if (v417)
    {
      v418 = [v5 objectForKeyedSubscript:@"WhiteBalanceStrobe"];
      v311 = [v418 objectForKeyedSubscript:@"BalanceMatchingMinimumConfidenceWeight"];
      [v311 floatValue];
    }
    else
    {
      v418 = [*v123 whiteBalanceStrobeConfig];
      [v418 balanceMatchingMinimumConfidenceWeight];
    }
    int v420 = v419;
    v421 = [*v123 whiteBalanceStrobeConfig];
    LODWORD(v422) = v420;
    [v421 setBalanceMatchingMinimumConfidenceWeight:v422];

    if (v417) {
    v423 = [v5 objectForKeyedSubscript:@"WhiteBalanceStrobe"];
    }
    v424 = [v423 objectForKeyedSubscript:@"BalanceMatchingThumbnailWidth"];
    if (v424)
    {
      v425 = [v5 objectForKeyedSubscript:@"WhiteBalanceStrobe"];
      v311 = [v425 objectForKeyedSubscript:@"BalanceMatchingThumbnailWidth"];
      id v426 = [v311 intValue];
    }
    else
    {
      v425 = [*v123 whiteBalanceStrobeConfig];
      id v426 = [v425 balanceMatchingThumbnailWidth];
    }
    v427 = [*v123 whiteBalanceStrobeConfig];
    [v427 setBalanceMatchingThumbnailWidth:v426];

    if (v424) {
    v428 = [v5 objectForKeyedSubscript:@"WhiteBalanceStrobe"];
    }
    v429 = [v428 objectForKeyedSubscript:@"BalanceMatchingThumbnailHeight"];
    if (v429)
    {
      v430 = [v5 objectForKeyedSubscript:@"WhiteBalanceStrobe"];
      v311 = [v430 objectForKeyedSubscript:@"BalanceMatchingThumbnailHeight"];
      id v431 = [v311 intValue];
    }
    else
    {
      v430 = [*v123 whiteBalanceStrobeConfig];
      id v431 = [v430 balanceMatchingThumbnailHeight];
    }
    v432 = [*v123 whiteBalanceStrobeConfig];
    [v432 setBalanceMatchingThumbnailHeight:v431];

    if (v429) {
    v433 = [v5 objectForKeyedSubscript:@"WhiteBalanceStrobe"];
    }
    v434 = [v433 objectForKeyedSubscript:@"BalanceMatchingGaussianSigma"];
    if (v434)
    {
      v435 = [v5 objectForKeyedSubscript:@"WhiteBalanceStrobe"];
      v311 = [v435 objectForKeyedSubscript:@"BalanceMatchingGaussianSigma"];
      [v311 floatValue];
    }
    else
    {
      v435 = [*v123 whiteBalanceStrobeConfig];
      [v435 balanceMatchingGaussianSigma];
    }
    int v437 = v436;
    v438 = [*v123 whiteBalanceStrobeConfig];
    LODWORD(v439) = v437;
    [v438 setBalanceMatchingGaussianSigma:v439];

    if (v434) {
    v440 = [v5 objectForKeyedSubscript:@"WhiteBalanceStrobe"];
    }
    v441 = [v440 objectForKeyedSubscript:@"BalanceMatchingSigmaToFilterScale"];
    if (v441)
    {
      v442 = [v5 objectForKeyedSubscript:@"WhiteBalanceStrobe"];
      v311 = [v442 objectForKeyedSubscript:@"BalanceMatchingSigmaToFilterScale"];
      [v311 floatValue];
    }
    else
    {
      v442 = [*v123 whiteBalanceStrobeConfig];
      [v442 balanceMatchingSigmaToFilterScale];
    }
    int v444 = v443;
    v445 = [*v123 whiteBalanceStrobeConfig];
    LODWORD(v446) = v444;
    [v445 setBalanceMatchingSigmaToFilterScale:v446];

    if (v441) {
    v447 = [v5 objectForKeyedSubscript:@"WhiteBalanceStrobe"];
    }
    v448 = [v447 objectForKeyedSubscript:@"FlashToStrobeIntensityFusionMixFactor"];
    if (v448)
    {
      v449 = [v5 objectForKeyedSubscript:@"WhiteBalanceStrobe"];
      v311 = [v449 objectForKeyedSubscript:@"FlashToStrobeIntensityFusionMixFactor"];
      [v311 floatValue];
    }
    else
    {
      v449 = [*v123 whiteBalanceStrobeConfig];
      [v449 flashToStrobeIntensityFusionMixFactor];
    }
    int v451 = v450;
    v452 = [*v123 whiteBalanceStrobeConfig];
    LODWORD(v453) = v451;
    [v452 setFlashToStrobeIntensityFusionMixFactor:v453];

    if (v448) {
    id v454 = [*v123 thumbnailWidth];
    }
    v455 = [*v123 styleTransferConfig];
    [v455 setSourceThumbnailWidth:v454];

    v456 = [v5 objectForKeyedSubscript:@"StyleTransfer"];
    v457 = [v456 objectForKeyedSubscript:@"SpeedModeStyleTransferEnabled"];
    if (v457)
    {
      v458 = [v5 objectForKeyedSubscript:@"StyleTransfer"];
      v311 = [v458 objectForKeyedSubscript:@"SpeedModeStyleTransferEnabled"];
      id v459 = [v311 BOOLValue];
    }
    else
    {
      v458 = [*v123 styleTransferConfig];
      id v459 = [v458 speedModeStyleTransferEnabled];
    }
    v460 = [*v123 styleTransferConfig];
    [v460 setSpeedModeStyleTransferEnabled:v459];

    if (v457) {
    v461 = [v5 objectForKeyedSubscript:@"StyleTransfer"];
    }
    v462 = [v461 objectForKeyedSubscript:@"StyleTransferThumbnailWidth"];
    if (v462)
    {
      v463 = [v5 objectForKeyedSubscript:@"StyleTransfer"];
      v311 = [v463 objectForKeyedSubscript:@"StyleTransferThumbnailWidth"];
      id v464 = [v311 intValue];
    }
    else
    {
      v463 = [*v123 styleTransferConfig];
      id v464 = [v463 styleTransferThumbnailWidth];
    }
    v465 = [*v123 styleTransferConfig];
    [v465 setStyleTransferThumbnailWidth:v464];

    if (v462) {
    v466 = [v5 objectForKeyedSubscript:@"StyleTransfer"];
    }
    v467 = [v466 objectForKeyedSubscript:@"StyleTransferThumbnailHeight"];
    if (v467)
    {
      v468 = [v5 objectForKeyedSubscript:@"StyleTransfer"];
      v311 = [v468 objectForKeyedSubscript:@"StyleTransferThumbnailHeight"];
      id v469 = [v311 intValue];
    }
    else
    {
      v468 = [*v123 styleTransferConfig];
      id v469 = [v468 styleTransferThumbnailHeight];
    }
    v470 = [*v123 styleTransferConfig];
    [v470 setStyleTransferThumbnailHeight:v469];

    if (v467) {
    v471 = [v5 objectForKeyedSubscript:@"StyleTransfer"];
    }
    v472 = [v471 objectForKeyedSubscript:@"StyleTransferThumbnailSharpness"];
    if (v472)
    {
      v473 = [v5 objectForKeyedSubscript:@"StyleTransfer"];
      v311 = [v473 objectForKeyedSubscript:@"StyleTransferThumbnailSharpness"];
      [v311 floatValue];
    }
    else
    {
      v473 = [*v123 styleTransferConfig];
      [v473 styleTransferThumbnailSharpness];
    }
    int v475 = v474;
    v476 = [*v123 styleTransferConfig];
    LODWORD(v477) = v475;
    [v476 setStyleTransferThumbnailSharpness:v477];

    if (v472) {
    v478 = [v5 objectForKeyedSubscript:@"StyleTransfer"];
    }
    v479 = [v478 objectForKeyedSubscript:@"StyleTransferGammaCorrection"];
    if (v479)
    {
      v480 = [v5 objectForKeyedSubscript:@"StyleTransfer"];
      v311 = [v480 objectForKeyedSubscript:@"StyleTransferGammaCorrection"];
      [v311 floatValue];
    }
    else
    {
      v480 = [*v123 styleTransferConfig];
      [v480 styleTransferGammaCorrection];
    }
    int v482 = v481;
    v483 = [*v123 styleTransferConfig];
    LODWORD(v484) = v482;
    [v483 setStyleTransferGammaCorrection:v484];

    if (v479) {
    v485 = [v5 objectForKeyedSubscript:@"StyleTransfer"];
    }
    v486 = [v485 objectForKeyedSubscript:@"ClippingCorrectionEnabled"];
    if (v486)
    {
      v487 = [v5 objectForKeyedSubscript:@"StyleTransfer"];
      v311 = [v487 objectForKeyedSubscript:@"ClippingCorrectionEnabled"];
      id v488 = [v311 BOOLValue];
    }
    else
    {
      v487 = [*v123 styleTransferConfig];
      id v488 = [v487 clippingCorrectionEnabled];
    }
    v489 = [*v123 styleTransferConfig];
    [v489 setClippingCorrectionEnabled:v488];

    if (v486) {
    v490 = [v5 objectForKeyedSubscript:@"StyleTransfer"];
    }
    v491 = [v490 objectForKeyedSubscript:@"ClippingCorrectionTransitionGain"];
    if (v491)
    {
      v492 = [v5 objectForKeyedSubscript:@"StyleTransfer"];
      v311 = [v492 objectForKeyedSubscript:@"ClippingCorrectionTransitionGain"];
      [v311 floatValue];
    }
    else
    {
      v492 = [*v123 styleTransferConfig];
      [v492 clippingCorrectionTransitionGain];
    }
    int v494 = v493;
    v495 = [*v123 styleTransferConfig];
    LODWORD(v496) = v494;
    [v495 setClippingCorrectionTransitionGain:v496];

    if (v491) {
    v497 = [v5 objectForKeyedSubscript:@"StyleTransfer"];
    }
    v498 = [v497 objectForKeyedSubscript:@"ClippingCorrectionTransitionExponent"];
    if (v498)
    {
      v499 = [v5 objectForKeyedSubscript:@"StyleTransfer"];
      v311 = [v499 objectForKeyedSubscript:@"ClippingCorrectionTransitionExponent"];
      [v311 floatValue];
    }
    else
    {
      v499 = [*v123 styleTransferConfig];
      [v499 clippingCorrectionTransitionExponent];
    }
    int v501 = v500;
    v502 = [*v123 styleTransferConfig];
    LODWORD(v503) = v501;
    [v502 setClippingCorrectionTransitionExponent:v503];

    if (v498) {
    v504 = [v5 objectForKeyedSubscript:@"StyleTransfer"];
    }
    v505 = [v504 objectForKeyedSubscript:@"ColourSaturationBoostGain"];
    if (v505)
    {
      v506 = [v5 objectForKeyedSubscript:@"StyleTransfer"];
      v311 = [v506 objectForKeyedSubscript:@"ColourSaturationBoostGain"];
      [v311 floatValue];
    }
    else
    {
      v506 = [*v123 styleTransferConfig];
      [v506 colourSaturationBoostGain];
    }
    int v508 = v507;
    v509 = [*v123 styleTransferConfig];
    LODWORD(v510) = v508;
    [v509 setColourSaturationBoostGain:v510];

    if (v505) {
    uint64_t v511 = *(unsigned __int8 *)(v514 + 202);
    }
    v512 = [*(id *)(v514 + 184) styleTransferConfig];
    [v512 setGlobalRGBToneCurveEnabled:v511];

    *(unsigned char *)(v514 + 200) = 1;
  }

  return 0;
}

void sub_16728(uint64_t a1)
{
  for (uint64_t i = 0; i != 80; i += 40)
    sub_16784(a1 + i);

  v3 = *(void **)(a1 + 96);
}

void sub_16784(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
}

BOOL CGRectIsNull(CGRect rect)
{
  return _CGRectIsNull(rect);
}

BOOL CGRectMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGRect *rect)
{
  return _CGRectMakeWithDictionaryRepresentation(dict, rect);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return _CVPixelBufferGetHeight(pixelBuffer);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return _CVPixelBufferGetPixelFormatType(pixelBuffer);
}

size_t CVPixelBufferGetPlaneCount(CVPixelBufferRef pixelBuffer)
{
  return _CVPixelBufferGetPlaneCount(pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return _CVPixelBufferGetWidth(pixelBuffer);
}

Boolean CVPixelBufferIsPlanar(CVPixelBufferRef pixelBuffer)
{
  return _CVPixelBufferIsPlanar(pixelBuffer);
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
}

CVPixelBufferRef CVPixelBufferRetain(CVPixelBufferRef texture)
{
  return _CVPixelBufferRetain(texture);
}

uint64_t FigCaptureMetadataUtilitiesComputeDenormalizedStillImageCropRect()
{
  return _FigCaptureMetadataUtilitiesComputeDenormalizedStillImageCropRect();
}

uint64_t FigCaptureMetadataUtilitiesCopyZoomRelatedMetadata()
{
  return _FigCaptureMetadataUtilitiesCopyZoomRelatedMetadata();
}

uint64_t FigCaptureMetadataUtilitiesUpdateMetadataForStillImageCrop()
{
  return _FigCaptureMetadataUtilitiesUpdateMetadataForStillImageCrop();
}

uint64_t FigCaptureUncompressedPixelFormatForPixelFormat()
{
  return _FigCaptureUncompressedPixelFormatForPixelFormat();
}

uint64_t FigDebugAssert3()
{
  return _FigDebugAssert3();
}

uint64_t FigGetCFPreferenceNumberWithDefault()
{
  return _FigGetCFPreferenceNumberWithDefault();
}

uint64_t FigMetalDecRef()
{
  return _FigMetalDecRef();
}

uint64_t FigNote_AllowInternalDefaultLogs()
{
  return _FigNote_AllowInternalDefaultLogs();
}

uint64_t FigSignalErrorAt()
{
  return _FigSignalErrorAt();
}

uint64_t fig_log_get_emitter()
{
  return _fig_log_get_emitter();
}

uint64_t fig_note_initialize_category_with_default_work_cf()
{
  return _fig_note_initialize_category_with_default_work_cf();
}

uint64_t kdebug_trace()
{
  return _kdebug_trace();
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_destroyWeak(id *location)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

id objc_msgSend_allocator(void *a1, const char *a2, ...)
{
  return [a1 allocator];
}

id objc_msgSend_allocatorBackend(void *a1, const char *a2, ...)
{
  return [a1 allocatorBackend];
}

id objc_msgSend_ambientQualityMaxGain(void *a1, const char *a2, ...)
{
  return [a1 ambientQualityMaxGain];
}

id objc_msgSend_ambientQualityMinGain(void *a1, const char *a2, ...)
{
  return [a1 ambientQualityMinGain];
}

id objc_msgSend_ambientQualityOneThreshold(void *a1, const char *a2, ...)
{
  return [a1 ambientQualityOneThreshold];
}

id objc_msgSend_ambientQualityZeroThreshold(void *a1, const char *a2, ...)
{
  return [a1 ambientQualityZeroThreshold];
}

id objc_msgSend_balanceDenseToSparseExponentFactor(void *a1, const char *a2, ...)
{
  return [a1 balanceDenseToSparseExponentFactor];
}

id objc_msgSend_balanceMatchingGaussianSigma(void *a1, const char *a2, ...)
{
  return [a1 balanceMatchingGaussianSigma];
}

id objc_msgSend_balanceMatchingMinimumConfidenceWeight(void *a1, const char *a2, ...)
{
  return [a1 balanceMatchingMinimumConfidenceWeight];
}

id objc_msgSend_balanceMatchingSigmaToFilterScale(void *a1, const char *a2, ...)
{
  return [a1 balanceMatchingSigmaToFilterScale];
}

id objc_msgSend_balanceMatchingThumbnailHeight(void *a1, const char *a2, ...)
{
  return [a1 balanceMatchingThumbnailHeight];
}

id objc_msgSend_balanceMatchingThumbnailWidth(void *a1, const char *a2, ...)
{
  return [a1 balanceMatchingThumbnailWidth];
}

id objc_msgSend_bandingGaussianSigmaScale(void *a1, const char *a2, ...)
{
  return [a1 bandingGaussianSigmaScale];
}

id objc_msgSend_bandingMinWeight(void *a1, const char *a2, ...)
{
  return [a1 bandingMinWeight];
}

id objc_msgSend_blitCommandEncoder(void *a1, const char *a2, ...)
{
  return [a1 blitCommandEncoder];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_buffer(void *a1, const char *a2, ...)
{
  return [a1 buffer];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_centerWeightingGaussianSigmaScale(void *a1, const char *a2, ...)
{
  return [a1 centerWeightingGaussianSigmaScale];
}

id objc_msgSend_centerWeightingSigmaToFilterScale(void *a1, const char *a2, ...)
{
  return [a1 centerWeightingSigmaToFilterScale];
}

id objc_msgSend_clippedConfidenceLikelihoodExponent(void *a1, const char *a2, ...)
{
  return [a1 clippedConfidenceLikelihoodExponent];
}

id objc_msgSend_clippedConfidenceLikelihoodScale(void *a1, const char *a2, ...)
{
  return [a1 clippedConfidenceLikelihoodScale];
}

id objc_msgSend_clippedLikelihoodExponent(void *a1, const char *a2, ...)
{
  return [a1 clippedLikelihoodExponent];
}

id objc_msgSend_clippedLikelihoodScalar(void *a1, const char *a2, ...)
{
  return [a1 clippedLikelihoodScalar];
}

id objc_msgSend_clippingCorrectionEnabled(void *a1, const char *a2, ...)
{
  return [a1 clippingCorrectionEnabled];
}

id objc_msgSend_clippingCorrectionTransitionExponent(void *a1, const char *a2, ...)
{
  return [a1 clippingCorrectionTransitionExponent];
}

id objc_msgSend_clippingCorrectionTransitionGain(void *a1, const char *a2, ...)
{
  return [a1 clippingCorrectionTransitionGain];
}

id objc_msgSend_clippingRecoveryConfig(void *a1, const char *a2, ...)
{
  return [a1 clippingRecoveryConfig];
}

id objc_msgSend_clippingRecoveryEnabled(void *a1, const char *a2, ...)
{
  return [a1 clippingRecoveryEnabled];
}

id objc_msgSend_colourAccuracyConfidenceConfig(void *a1, const char *a2, ...)
{
  return [a1 colourAccuracyConfidenceConfig];
}

id objc_msgSend_colourSaturationBoostGain(void *a1, const char *a2, ...)
{
  return [a1 colourSaturationBoostGain];
}

id objc_msgSend_commandBuffer(void *a1, const char *a2, ...)
{
  return [a1 commandBuffer];
}

id objc_msgSend_commandQueue(void *a1, const char *a2, ...)
{
  return [a1 commandQueue];
}

id objc_msgSend_commit(void *a1, const char *a2, ...)
{
  return [a1 commit];
}

id objc_msgSend_computeCommandEncoder(void *a1, const char *a2, ...)
{
  return [a1 computeCommandEncoder];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return [a1 configuration];
}

id objc_msgSend_contents(void *a1, const char *a2, ...)
{
  return [a1 contents];
}

id objc_msgSend_desc(void *a1, const char *a2, ...)
{
  return [a1 desc];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return [a1 device];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_endEncoding(void *a1, const char *a2, ...)
{
  return [a1 endEncoding];
}

id objc_msgSend_figProcessorDebugDump(void *a1, const char *a2, ...)
{
  return [a1 figProcessorDebugDump];
}

id objc_msgSend_filterToSigmaScale(void *a1, const char *a2, ...)
{
  return [a1 filterToSigmaScale];
}

id objc_msgSend_finishProcessing(void *a1, const char *a2, ...)
{
  return [a1 finishProcessing];
}

id objc_msgSend_flashToStrobeIntensityFusionMixFactor(void *a1, const char *a2, ...)
{
  return [a1 flashToStrobeIntensityFusionMixFactor];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_fusionDiffuseGaussianSigma(void *a1, const char *a2, ...)
{
  return [a1 fusionDiffuseGaussianSigma];
}

id objc_msgSend_fusionDiffuseSigmaToHalfFilterScale(void *a1, const char *a2, ...)
{
  return [a1 fusionDiffuseSigmaToHalfFilterScale];
}

id objc_msgSend_fusionMapDilationRadius(void *a1, const char *a2, ...)
{
  return [a1 fusionMapDilationRadius];
}

id objc_msgSend_fusionMapGaussianKernelRadius(void *a1, const char *a2, ...)
{
  return [a1 fusionMapGaussianKernelRadius];
}

id objc_msgSend_fusionMapGaussianSigma(void *a1, const char *a2, ...)
{
  return [a1 fusionMapGaussianSigma];
}

id objc_msgSend_fusionMapHeight(void *a1, const char *a2, ...)
{
  return [a1 fusionMapHeight];
}

id objc_msgSend_fusionMapWidth(void *a1, const char *a2, ...)
{
  return [a1 fusionMapWidth];
}

id objc_msgSend_gainMapHeight(void *a1, const char *a2, ...)
{
  return [a1 gainMapHeight];
}

id objc_msgSend_gainMapWidth(void *a1, const char *a2, ...)
{
  return [a1 gainMapWidth];
}

id objc_msgSend_gamma(void *a1, const char *a2, ...)
{
  return [a1 gamma];
}

id objc_msgSend_gammaCorrection(void *a1, const char *a2, ...)
{
  return [a1 gammaCorrection];
}

id objc_msgSend_globalCenterWeightedConfidenceLevelBuffer(void *a1, const char *a2, ...)
{
  return [a1 globalCenterWeightedConfidenceLevelBuffer];
}

id objc_msgSend_globalRGBToneCurveBrightnessBoostFactor(void *a1, const char *a2, ...)
{
  return [a1 globalRGBToneCurveBrightnessBoostFactor];
}

id objc_msgSend_globalRGBToneCurveEnabled(void *a1, const char *a2, ...)
{
  return [a1 globalRGBToneCurveEnabled];
}

id objc_msgSend_gridBands(void *a1, const char *a2, ...)
{
  return [a1 gridBands];
}

id objc_msgSend_gridHeight(void *a1, const char *a2, ...)
{
  return [a1 gridHeight];
}

id objc_msgSend_gridRegionScale(void *a1, const char *a2, ...)
{
  return [a1 gridRegionScale];
}

id objc_msgSend_gridWidth(void *a1, const char *a2, ...)
{
  return [a1 gridWidth];
}

id objc_msgSend_height(void *a1, const char *a2, ...)
{
  return [a1 height];
}

id objc_msgSend_homography(void *a1, const char *a2, ...)
{
  return [a1 homography];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_kernelSupportGaussianSigma(void *a1, const char *a2, ...)
{
  return [a1 kernelSupportGaussianSigma];
}

id objc_msgSend_kernelSupportSigmaToFilterScale(void *a1, const char *a2, ...)
{
  return [a1 kernelSupportSigmaToFilterScale];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_lowStrobeIlluminationFlashFusionEnabled(void *a1, const char *a2, ...)
{
  return [a1 lowStrobeIlluminationFlashFusionEnabled];
}

id objc_msgSend_lscGains(void *a1, const char *a2, ...)
{
  return [a1 lscGains];
}

id objc_msgSend_lscParams(void *a1, const char *a2, ...)
{
  return [a1 lscParams];
}

id objc_msgSend_maskFusionGain(void *a1, const char *a2, ...)
{
  return [a1 maskFusionGain];
}

id objc_msgSend_maskFusionMixFactor(void *a1, const char *a2, ...)
{
  return [a1 maskFusionMixFactor];
}

id objc_msgSend_maxTotalThreadsPerThreadgroup(void *a1, const char *a2, ...)
{
  return [a1 maxTotalThreadsPerThreadgroup];
}

id objc_msgSend_memSize(void *a1, const char *a2, ...)
{
  return [a1 memSize];
}

id objc_msgSend_microHazeDetectionConfig(void *a1, const char *a2, ...)
{
  return [a1 microHazeDetectionConfig];
}

id objc_msgSend_minimumProbabilityDensity(void *a1, const char *a2, ...)
{
  return [a1 minimumProbabilityDensity];
}

id objc_msgSend_newBufferDescriptor(void *a1, const char *a2, ...)
{
  return [a1 newBufferDescriptor];
}

id objc_msgSend_newTextureDescriptor(void *a1, const char *a2, ...)
{
  return [a1 newTextureDescriptor];
}

id objc_msgSend_numIntensityHistogramBins(void *a1, const char *a2, ...)
{
  return [a1 numIntensityHistogramBins];
}

id objc_msgSend_outputIntegratedCoefficients(void *a1, const char *a2, ...)
{
  return [a1 outputIntegratedCoefficients];
}

id objc_msgSend_outputLinearSystemStatusFlag(void *a1, const char *a2, ...)
{
  return [a1 outputLinearSystemStatusFlag];
}

id objc_msgSend_pixelFormat(void *a1, const char *a2, ...)
{
  return [a1 pixelFormat];
}

id objc_msgSend_positiveIntensityMaskResponseBias(void *a1, const char *a2, ...)
{
  return [a1 positiveIntensityMaskResponseBias];
}

id objc_msgSend_positiveIntensityMaskResponseExponent(void *a1, const char *a2, ...)
{
  return [a1 positiveIntensityMaskResponseExponent];
}

id objc_msgSend_positiveIntensityMaskResponseGain(void *a1, const char *a2, ...)
{
  return [a1 positiveIntensityMaskResponseGain];
}

id objc_msgSend_process(void *a1, const char *a2, ...)
{
  return [a1 process];
}

id objc_msgSend_purgeResources(void *a1, const char *a2, ...)
{
  return [a1 purgeResources];
}

id objc_msgSend_pyramidGaussianKernelRadius(void *a1, const char *a2, ...)
{
  return [a1 pyramidGaussianKernelRadius];
}

id objc_msgSend_pyramidGaussianSigma(void *a1, const char *a2, ...)
{
  return [a1 pyramidGaussianSigma];
}

id objc_msgSend_pyramidLastLevelHeight(void *a1, const char *a2, ...)
{
  return [a1 pyramidLastLevelHeight];
}

id objc_msgSend_pyramidLastLevelWidth(void *a1, const char *a2, ...)
{
  return [a1 pyramidLastLevelWidth];
}

id objc_msgSend_pyramidNumLevels(void *a1, const char *a2, ...)
{
  return [a1 pyramidNumLevels];
}

id objc_msgSend_releaseResources(void *a1, const char *a2, ...)
{
  return [a1 releaseResources];
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return [a1 reset];
}

id objc_msgSend_resetState(void *a1, const char *a2, ...)
{
  return [a1 resetState];
}

id objc_msgSend_resourceOptions(void *a1, const char *a2, ...)
{
  return [a1 resourceOptions];
}

id objc_msgSend_sensorSpaceConversionConfig(void *a1, const char *a2, ...)
{
  return [a1 sensorSpaceConversionConfig];
}

id objc_msgSend_setup(void *a1, const char *a2, ...)
{
  return [a1 setup];
}

id objc_msgSend_shadowEdgesResponseExponent(void *a1, const char *a2, ...)
{
  return [a1 shadowEdgesResponseExponent];
}

id objc_msgSend_shadowEdgesResponseGain(void *a1, const char *a2, ...)
{
  return [a1 shadowEdgesResponseGain];
}

id objc_msgSend_sourceThumbnailWidth(void *a1, const char *a2, ...)
{
  return [a1 sourceThumbnailWidth];
}

id objc_msgSend_spatialGaussianSigmaScale(void *a1, const char *a2, ...)
{
  return [a1 spatialGaussianSigmaScale];
}

id objc_msgSend_speedModeStyleTransferEnabled(void *a1, const char *a2, ...)
{
  return [a1 speedModeStyleTransferEnabled];
}

id objc_msgSend_strobeBeamProfileComponentOneThreshold(void *a1, const char *a2, ...)
{
  return [a1 strobeBeamProfileComponentOneThreshold];
}

id objc_msgSend_strobeBeamProfileComponentZeroThreshold(void *a1, const char *a2, ...)
{
  return [a1 strobeBeamProfileComponentZeroThreshold];
}

id objc_msgSend_strobeBeamProfileScaleMaximum(void *a1, const char *a2, ...)
{
  return [a1 strobeBeamProfileScaleMaximum];
}

id objc_msgSend_strobeBeamProfileScaleMinimum(void *a1, const char *a2, ...)
{
  return [a1 strobeBeamProfileScaleMinimum];
}

id objc_msgSend_strobeCorrectionConfig(void *a1, const char *a2, ...)
{
  return [a1 strobeCorrectionConfig];
}

id objc_msgSend_strobeIlluminationOneThreshold(void *a1, const char *a2, ...)
{
  return [a1 strobeIlluminationOneThreshold];
}

id objc_msgSend_strobeIlluminationZeroThreshold(void *a1, const char *a2, ...)
{
  return [a1 strobeIlluminationZeroThreshold];
}

id objc_msgSend_strongGradientsMaskResponseBias(void *a1, const char *a2, ...)
{
  return [a1 strongGradientsMaskResponseBias];
}

id objc_msgSend_strongGradientsMaskResponseExponent(void *a1, const char *a2, ...)
{
  return [a1 strongGradientsMaskResponseExponent];
}

id objc_msgSend_strongGradientsMaskResponseGain(void *a1, const char *a2, ...)
{
  return [a1 strongGradientsMaskResponseGain];
}

id objc_msgSend_styleTransferAccuracyGammaCorrection(void *a1, const char *a2, ...)
{
  return [a1 styleTransferAccuracyGammaCorrection];
}

id objc_msgSend_styleTransferAccuracyOneThreshold(void *a1, const char *a2, ...)
{
  return [a1 styleTransferAccuracyOneThreshold];
}

id objc_msgSend_styleTransferAccuracyZeroThreshold(void *a1, const char *a2, ...)
{
  return [a1 styleTransferAccuracyZeroThreshold];
}

id objc_msgSend_styleTransferConfig(void *a1, const char *a2, ...)
{
  return [a1 styleTransferConfig];
}

id objc_msgSend_styleTransferGammaCorrection(void *a1, const char *a2, ...)
{
  return [a1 styleTransferGammaCorrection];
}

id objc_msgSend_styleTransferThumbnailHeight(void *a1, const char *a2, ...)
{
  return [a1 styleTransferThumbnailHeight];
}

id objc_msgSend_styleTransferThumbnailSharpness(void *a1, const char *a2, ...)
{
  return [a1 styleTransferThumbnailSharpness];
}

id objc_msgSend_styleTransferThumbnailSigmaToFilterScale(void *a1, const char *a2, ...)
{
  return [a1 styleTransferThumbnailSigmaToFilterScale];
}

id objc_msgSend_styleTransferThumbnailWidth(void *a1, const char *a2, ...)
{
  return [a1 styleTransferThumbnailWidth];
}

id objc_msgSend_supportsExternalMemoryResource(void *a1, const char *a2, ...)
{
  return [a1 supportsExternalMemoryResource];
}

id objc_msgSend_threadExecutionWidth(void *a1, const char *a2, ...)
{
  return [a1 threadExecutionWidth];
}

id objc_msgSend_thumbnailConfidenceMapHeight(void *a1, const char *a2, ...)
{
  return [a1 thumbnailConfidenceMapHeight];
}

id objc_msgSend_thumbnailConfidenceMapWidth(void *a1, const char *a2, ...)
{
  return [a1 thumbnailConfidenceMapWidth];
}

id objc_msgSend_thumbnailHeight(void *a1, const char *a2, ...)
{
  return [a1 thumbnailHeight];
}

id objc_msgSend_thumbnailWidth(void *a1, const char *a2, ...)
{
  return [a1 thumbnailWidth];
}

id objc_msgSend_toneCompressionConfig(void *a1, const char *a2, ...)
{
  return [a1 toneCompressionConfig];
}

id objc_msgSend_toneCompressionCurveTexture(void *a1, const char *a2, ...)
{
  return [a1 toneCompressionCurveTexture];
}

id objc_msgSend_usedSizeAll(void *a1, const char *a2, ...)
{
  return [a1 usedSizeAll];
}

id objc_msgSend_waitForIdle(void *a1, const char *a2, ...)
{
  return [a1 waitForIdle];
}

id objc_msgSend_whiteBalanceStrobeConfig(void *a1, const char *a2, ...)
{
  return [a1 whiteBalanceStrobeConfig];
}

id objc_msgSend_width(void *a1, const char *a2, ...)
{
  return [a1 width];
}