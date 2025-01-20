@interface RawDFNetworkStageTuningParams
+ (float)computeTotalNoiseFactorWithTotalGain:(float)a3 eit:(float)a4;
+ (float)computeTotalNoiseFactorWithTotalGain:(float)a3 eit:(float)a4 gain0:(float)a5 gain1:(float)a6;
+ (int)calculateShaderUniformsForNetworkPipeline:(int)a3 tuningParams:(id)a4 networkType:(int)a5 frameMeta:(DeepFusionFrameMeta *)a6 textureDimensions:(RawDFNetworkUniforms *)a7 outNetworkUniforms:;
- (int)networkTypeForString:(id)a3 outNetworkType:(int *)a4;
- (int)readPlist:(id)a3;
- (int)readRawDFNetworkParams:(id)a3 outParams:(RawDFNetworkParameters *)a4;
- (int)readRawDFParams:(id)a3;
@end

@implementation RawDFNetworkStageTuningParams

- (int)readRawDFParams:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || [v4 count] != 7 && objc_msgSend(v4, "count") != 4)
  {
    v26 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
    int v15 = -73315;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_22;
  }
  if ([v4 count] == 4)
  {
    v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    self->_networkTypeInLowLight = 0;
    self->_networkTypeInBrightLight = 1;
    goto LABEL_15;
  }
  uint64_t v6 = [v4 objectForKeyedSubscript:@"NetworkTypeInLowLight"];
  if (!v6
    || (v7 = (void *)v6,
        [v4 objectForKeyedSubscript:@"NetworkTypeInLowLight"],
        v8 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v8,
        v7,
        (isKindOfClass & 1) == 0))
  {
    int v15 = -73315;
LABEL_21:
    FigDebugAssert3();
    goto LABEL_22;
  }
  uint64_t v10 = [v4 objectForKeyedSubscript:@"NetworkTypeInBrightLight"];
  if (!v10
    || (v11 = (void *)v10,
        [v4 objectForKeyedSubscript:@"NetworkTypeInBrightLight"],
        v12 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char v13 = objc_opt_isKindOfClass(),
        v12,
        v11,
        (v13 & 1) == 0))
  {
    int v15 = -73315;
    goto LABEL_21;
  }
  v14 = [v4 objectForKeyedSubscript:@"NetworkTypeInLowLight"];
  int v15 = [(RawDFNetworkStageTuningParams *)self networkTypeForString:v14 outNetworkType:&self->_networkTypeInLowLight];

  if (v15) {
    goto LABEL_21;
  }
  v16 = [v4 objectForKeyedSubscript:@"NetworkTypeInBrightLight"];
  int v15 = [(RawDFNetworkStageTuningParams *)self networkTypeForString:v16 outNetworkType:&self->_networkTypeInBrightLight];

  if (v15) {
    goto LABEL_21;
  }
  v17 = [v4 objectForKeyedSubscript:@"DFOpt2Network"];
  int v15 = [(RawDFNetworkStageTuningParams *)self readRawDFNetworkParams:v17 outParams:&self->_opt2NetworkParams];

  if (v15) {
    goto LABEL_21;
  }
LABEL_15:
  v18 = objc_msgSend(v4, "objectForKeyedSubscript:", @"ExtraNoiseFactorFlag", v27, v28);

  if (!v18)
  {
    int v15 = -73315;
    goto LABEL_21;
  }
  v19 = [v4 objectForKeyedSubscript:@"ExtraNoiseFactorFlag"];
  self->_useExtraNoiseFactor = [v19 BOOLValue];

  v20 = [v4 objectForKeyedSubscript:@"NetworkSwitchEITThreshold"];

  if (!v20)
  {
    int v15 = -73315;
    goto LABEL_21;
  }
  v21 = [v4 objectForKeyedSubscript:@"NetworkSwitchEITThreshold"];
  [v21 floatValue];
  self->_networkSwitchEITThreshold = v22;

  v23 = [v4 objectForKeyedSubscript:@"LowLightNetwork"];
  int v15 = [(RawDFNetworkStageTuningParams *)self readRawDFNetworkParams:v23 outParams:&self->_lowLightNetworkParams];

  if (v15) {
    goto LABEL_21;
  }
  v24 = [v4 objectForKeyedSubscript:@"BrightLightNetwork"];
  int v15 = [(RawDFNetworkStageTuningParams *)self readRawDFNetworkParams:v24 outParams:&self->_brightLightNetworkParams];

  if (v15) {
    goto LABEL_21;
  }
LABEL_22:

  return v15;
}

- (int)readRawDFNetworkParams:(id)a3 outParams:(RawDFNetworkParameters *)a4
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || [v5 count] != 4)
  {
    int v110 = -73315;
    FigDebugAssert3();
    goto LABEL_59;
  }
  uint64_t v6 = [v5 objectForKeyedSubscript:@"Denoising"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || [v6 count] != 1)
  {
    int v110 = -73315;
    FigDebugAssert3();
LABEL_79:

    goto LABEL_59;
  }
  v7 = [v6 objectForKeyedSubscript:@"Bands"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || [v7 count] != 4)
  {
    int v110 = -73315;
    FigDebugAssert3();

    goto LABEL_79;
  }
  v8 = [v5 objectForKeyedSubscript:@"Deghosting"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || [v8 count] != 1 && objc_msgSend(v8, "count") != 3)
  {
    int v110 = -73315;
    FigDebugAssert3();
    goto LABEL_70;
  }
  v9 = [v8 objectForKeyedSubscript:@"Bands"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || [v9 count] != 4)
  {
    int v110 = -73315;
    FigDebugAssert3();

LABEL_70:
LABEL_78:

    goto LABEL_79;
  }
  uint64_t v10 = [v5 objectForKeyedSubscript:@"NoiseEstimation"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || [v10 count] != 8)
  {
    int v110 = -73315;
    goto LABEL_76;
  }
  v11 = [v5 objectForKeyedSubscript:@"UseArtifactCorrectionNetwork"];

  if (!v11)
  {
    int v110 = -73315;
    goto LABEL_76;
  }
  v12 = [v5 objectForKeyedSubscript:@"UseArtifactCorrectionNetwork"];
  a4->useArtifactCorrectionNetwork = [v12 BOOLValue];

  if ([v8 count] != 1)
  {
    char v13 = [v8 objectForKeyedSubscript:@"DynamicEITThreshold"];

    if (v13)
    {
      v14 = [v8 objectForKeyedSubscript:@"DynamicEITThreshold"];
      [v14 floatValue];
      a4->dynamicEITThreshold = v15;

      v16 = [v8 objectForKeyedSubscript:@"DynamicMotionScoreThreshold"];

      if (v16)
      {
        v17 = [v8 objectForKeyedSubscript:@"DynamicMotionScoreThreshold"];
        [v17 floatValue];
        a4->dynamicMotionScoreThreshold = v18;

        goto LABEL_20;
      }
      int v110 = -73315;
    }
    else
    {
      int v110 = -73315;
    }
LABEL_76:
    FigDebugAssert3();

    goto LABEL_77;
  }
  *(int32x2_t *)&a4->dynamicEITThreshold = vdup_n_s32(0x447A0000u);
LABEL_20:
  v19 = [GainValueArray alloc];
  v20 = [v10 objectForKeyedSubscript:@"LumaPowerDenomNoiseFactor"];
  v21 = [(GainValueArray *)v19 initWithArray:v20];
  lumaPowerDenom = a4->noiseEstimationParams.lumaPowerDenom;
  a4->noiseEstimationParams.lumaPowerDenom = v21;

  if (![(GainValueArray *)a4->noiseEstimationParams.lumaPowerDenom isValid]) {
    goto LABEL_72;
  }
  v23 = [GainValueArray alloc];
  v24 = [v10 objectForKeyedSubscript:@"SynthRefLumaMaxNoiseFactor"];
  v25 = [(GainValueArray *)v23 initWithArray:v24];
  srLumaMaxNoiseFactor = a4->noiseEstimationParams.srLumaMaxNoiseFactor;
  a4->noiseEstimationParams.srLumaMaxNoiseFactor = v25;

  if (![(GainValueArray *)a4->noiseEstimationParams.srLumaMaxNoiseFactor isValid]) {
    goto LABEL_72;
  }
  uint64_t v27 = [GainValueArray alloc];
  uint64_t v28 = [v10 objectForKeyedSubscript:@"SynthLongLumaMaxNoiseFactor"];
  uint64_t v29 = [(GainValueArray *)v27 initWithArray:v28];
  slLumaMaxNoiseFactor = a4->noiseEstimationParams.slLumaMaxNoiseFactor;
  a4->noiseEstimationParams.slLumaMaxNoiseFactor = v29;

  if (![(GainValueArray *)a4->noiseEstimationParams.slLumaMaxNoiseFactor isValid]) {
    goto LABEL_72;
  }
  v31 = [GainValueArray alloc];
  v32 = [v10 objectForKeyedSubscript:@"ArtifactCorrectionNoiseFactor"];
  v33 = [(GainValueArray *)v31 initWithArray:v32];
  artifactCorrectionlNoiseFactor = a4->noiseEstimationParams.artifactCorrectionlNoiseFactor;
  a4->noiseEstimationParams.artifactCorrectionlNoiseFactor = v33;

  if (![(GainValueArray *)a4->noiseEstimationParams.artifactCorrectionlNoiseFactor isValid]) {
    goto LABEL_72;
  }
  v35 = [GainValueArray alloc];
  v36 = [v10 objectForKeyedSubscript:@"SynthRefGlobalNoiseFactor"];
  v37 = [(GainValueArray *)v35 initWithArray:v36];
  srGlobalNoiseFactor = a4->noiseEstimationParams.srGlobalNoiseFactor;
  a4->noiseEstimationParams.srGlobalNoiseFactor = v37;

  if (![(GainValueArray *)a4->noiseEstimationParams.srGlobalNoiseFactor isValid])
  {
LABEL_72:
    v116 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v116, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    int v110 = -73315;
LABEL_77:

    goto LABEL_78;
  }
  v124 = v7;
  v39 = [GainValueArray alloc];
  v40 = [v10 objectForKeyedSubscript:@"SynthLongGlobalNoiseFactor"];
  v41 = [(GainValueArray *)v39 initWithArray:v40];
  slGlobalNoiseFactor = a4->noiseEstimationParams.slGlobalNoiseFactor;
  a4->noiseEstimationParams.slGlobalNoiseFactor = v41;

  if (![(GainValueArray *)a4->noiseEstimationParams.slGlobalNoiseFactor isValid]) {
    goto LABEL_73;
  }
  v43 = [GainValueArray alloc];
  v44 = [v10 objectForKeyedSubscript:@"LSCNoiseFactor"];
  v45 = [(GainValueArray *)v43 initWithArray:v44];
  lscNoiseFactor = a4->noiseEstimationParams.lscNoiseFactor;
  a4->noiseEstimationParams.lscNoiseFactor = v45;

  if (![(GainValueArray *)a4->noiseEstimationParams.lscNoiseFactor isValid]) {
    goto LABEL_73;
  }
  v125 = v9;
  v47 = [GainValueArray alloc];
  v48 = [v10 objectForKeyedSubscript:@"FusionMaxNoiseFactor"];
  v49 = [(GainValueArray *)v47 initWithArray:v48];
  fusionMaxNoiseFactor = a4->noiseEstimationParams.fusionMaxNoiseFactor;
  a4->noiseEstimationParams.fusionMaxNoiseFactor = v49;

  if (![(GainValueArray *)a4->noiseEstimationParams.fusionMaxNoiseFactor isValid])
  {
LABEL_73:
    v117 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v117, OS_LOG_TYPE_DEFAULT);
    int v110 = -73315;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_77;
  }
  v121 = v10;
  v122 = v8;
  v123 = v6;
  unint64_t v51 = 0;
  int v120 = 0;
  p_dynamicLaplacianDiffFactor = (id *)&a4->deghostingBands[0].dynamicLaplacianDiffFactor;
  p_skyAddBackFactor = (id *)&a4->denoisingBands[0].skyAddBackFactor;
  v54 = v124;
  while (1)
  {
    v55 = objc_msgSend(v54, "objectAtIndex:", v51, v118, v119);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || [v55 count] != 4)
    {
      FigDebugAssert3();
      v112 = v123;
      v114 = v121;
      v113 = v122;
      goto LABEL_63;
    }
    v56 = [GainValueArray alloc];
    v57 = [v55 objectForKeyedSubscript:@"GlobalAddBackFactor"];
    uint64_t v58 = [(GainValueArray *)v56 initWithArray:v57];
    v59 = *(p_skyAddBackFactor - 3);
    *(p_skyAddBackFactor - 3) = (id)v58;

    if (([*(p_skyAddBackFactor - 3) isValid] & 1) == 0) {
      break;
    }
    v60 = [GainValueArray alloc];
    v61 = [v55 objectForKeyedSubscript:@"FusionAddBackFactor"];
    uint64_t v62 = [(GainValueArray *)v60 initWithArray:v61];
    v63 = *(p_skyAddBackFactor - 2);
    *(p_skyAddBackFactor - 2) = (id)v62;

    if (([*(p_skyAddBackFactor - 2) isValid] & 1) == 0) {
      break;
    }
    v64 = [GainValueArray alloc];
    v65 = [v55 objectForKeyedSubscript:@"SkinAddBackFactor"];
    uint64_t v66 = [(GainValueArray *)v64 initWithArray:v65];
    v67 = *(p_skyAddBackFactor - 1);
    *(p_skyAddBackFactor - 1) = (id)v66;

    if (([*(p_skyAddBackFactor - 1) isValid] & 1) == 0) {
      break;
    }
    v68 = [GainValueArray alloc];
    v69 = [v55 objectForKeyedSubscript:@"SkyAddBackFactor"];
    uint64_t v70 = [(GainValueArray *)v68 initWithArray:v69];
    id v71 = *p_skyAddBackFactor;
    id *p_skyAddBackFactor = (id)v70;

    if (([*p_skyAddBackFactor isValid] & 1) == 0) {
      break;
    }
    v72 = [v125 objectAtIndex:v51];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || [v72 count] != 5 && objc_msgSend(v72, "count") != 7)
    {
      int v110 = -73315;
      FigDebugAssert3();

      goto LABEL_59;
    }
    uint64_t v73 = [v72 count];
    v74 = @"DynamicLaplacianDiffFactor";
    if (v73 == 5) {
      v74 = @"LaplacianDiffFactor";
    }
    v75 = v74;
    v76 = [GainValueArray alloc];
    v77 = [v72 objectForKeyedSubscript:v75];

    uint64_t v78 = [(GainValueArray *)v76 initWithArray:v77];
    id v79 = *p_dynamicLaplacianDiffFactor;
    id *p_dynamicLaplacianDiffFactor = (id)v78;

    if (([*p_dynamicLaplacianDiffFactor isValid] & 1) == 0) {
      goto LABEL_54;
    }
    uint64_t v80 = [v72 count];
    v81 = @"DynamicGaussianDiffFactor";
    if (v80 == 5) {
      v81 = @"GaussianDiffFactor";
    }
    v82 = v81;
    v83 = [GainValueArray alloc];
    v84 = [v72 objectForKeyedSubscript:v82];

    uint64_t v85 = [(GainValueArray *)v83 initWithArray:v84];
    v86 = *(p_dynamicLaplacianDiffFactor - 1);
    *(p_dynamicLaplacianDiffFactor - 1) = (id)v85;

    if ([*(p_dynamicLaplacianDiffFactor - 1) isValid])
    {
      v87 = [GainValueArray alloc];
      v88 = [v72 objectForKeyedSubscript:@"LaplacianDiffFactor"];
      uint64_t v89 = [(GainValueArray *)v87 initWithArray:v88];
      v90 = *(p_dynamicLaplacianDiffFactor - 5);
      *(p_dynamicLaplacianDiffFactor - 5) = (id)v89;

      v54 = v124;
      if ([*(p_dynamicLaplacianDiffFactor - 5) isValid])
      {
        v91 = [GainValueArray alloc];
        v92 = [v72 objectForKeyedSubscript:@"GaussianDiffFactor"];
        uint64_t v93 = [(GainValueArray *)v91 initWithArray:v92];
        v94 = *(p_dynamicLaplacianDiffFactor - 6);
        *(p_dynamicLaplacianDiffFactor - 6) = (id)v93;

        if ([*(p_dynamicLaplacianDiffFactor - 6) isValid])
        {
          v95 = [GainValueArray alloc];
          v96 = [v72 objectForKeyedSubscript:@"HighlightLumaMid"];
          uint64_t v97 = [(GainValueArray *)v95 initWithArray:v96];
          v98 = *(p_dynamicLaplacianDiffFactor - 4);
          *(p_dynamicLaplacianDiffFactor - 4) = (id)v97;

          if ([*(p_dynamicLaplacianDiffFactor - 4) isValid])
          {
            v99 = [GainValueArray alloc];
            v100 = [v72 objectForKeyedSubscript:@"HighlightLumaSlope"];
            uint64_t v101 = [(GainValueArray *)v99 initWithArray:v100];
            v102 = *(p_dynamicLaplacianDiffFactor - 3);
            *(p_dynamicLaplacianDiffFactor - 3) = (id)v101;

            if ([*(p_dynamicLaplacianDiffFactor - 3) isValid])
            {
              v103 = [GainValueArray alloc];
              v104 = [v72 objectForKeyedSubscript:@"HighlightMaskFactor"];
              uint64_t v105 = [(GainValueArray *)v103 initWithArray:v104];
              v106 = *(p_dynamicLaplacianDiffFactor - 2);
              *(p_dynamicLaplacianDiffFactor - 2) = (id)v105;

              if ([*(p_dynamicLaplacianDiffFactor - 2) isValid])
              {
                int v107 = 1;
                goto LABEL_50;
              }
            }
          }
        }
      }
      v109 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT);
    }
    else
    {
LABEL_54:
      v109 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT);
      v54 = v124;
    }
    int v120 = -73315;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    int v107 = 0;
LABEL_50:

    if (v107)
    {
      p_dynamicLaplacianDiffFactor += 7;
      p_skyAddBackFactor += 4;
      if (v51++ < 3) {
        continue;
      }
    }

    int v110 = v120;
    goto LABEL_59;
  }
  v115 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT);
  v112 = v123;
  v114 = v121;
  v113 = v122;
  fig_log_call_emit_and_clean_up_after_send_and_compose();

LABEL_63:
  int v110 = -73315;

LABEL_59:
  return v110;
}

- (int)networkTypeForString:(id)a3 outNetworkType:(int *)a4
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (!v5) {
    goto LABEL_9;
  }
  if (![v5 isEqual:@"LowLight"])
  {
    if ([v6 isEqual:@"BrightLight"])
    {
      int v7 = 0;
      int v8 = 1;
LABEL_8:
      *a4 = v8;
      goto LABEL_10;
    }
    if ([v6 isEqual:@"Opt2"])
    {
      int v7 = 0;
      int v8 = 2;
      goto LABEL_8;
    }
LABEL_9:
    v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    int v7 = -73315;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_10;
  }
  int v7 = 0;
  *a4 = 0;
LABEL_10:

  return v7;
}

- (int)readPlist:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    v9.receiver = self;
    v9.super_class = (Class)RawDFNetworkStageTuningParams;
    [(CMITuningPlist *)&v9 readPlist:v4];
    id v5 = [v4 objectForKeyedSubscript:@"RawDF"];
    int v6 = [(RawDFNetworkStageTuningParams *)self readRawDFParams:v5];

    if (v6) {
      FigDebugAssert3();
    }
  }
  else
  {
    int v11 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    int v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    int v6 = -73315;
  }

  return v6;
}

+ (int)calculateShaderUniformsForNetworkPipeline:(int)a3 tuningParams:(id)a4 networkType:(int)a5 frameMeta:(DeepFusionFrameMeta *)a6 textureDimensions:(RawDFNetworkUniforms *)a7 outNetworkUniforms:
{
  int32x2_t v9 = v7;
  id v13 = a4;
  v14 = v13;
  if (!a7 || !a6) {
    goto LABEL_49;
  }
  v77 = a6;
  if (!a6->ev0Count)
  {
    uint64_t v62 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v16 = 0;
    float v15 = 0;
    int v26 = 0;
    goto LABEL_43;
  }
  if (a5 == 3 || [v13 count] != 2)
  {
LABEL_49:
    v63 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT);
    int v26 = -73315;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v16 = 0;
    float v15 = 0;
    goto LABEL_43;
  }
  float v15 = [v14 objectAtIndexedSubscript:0];
  v16 = [v14 objectAtIndexedSubscript:1];
  uint64_t v78 = a7;
  if (a3 && fabsf(a6->zoom + -1.0) > 0.00000011921)
  {
    v17 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if ((vbic_s8((int8x8_t)vdup_lane_s32(vtst_s32(v9, v9), 1), (int8x8_t)vceqz_s32(v9)).u8[0] & 1) == 0)
  {
    v64 = v16;
    v65 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT);
    int v26 = -73315;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v16 = v64;
    goto LABEL_43;
  }
  *(int32x2_t *)&a7[8].useArtifactCorrectionNetwork = v9;
  int ev0Count = a6->ev0Count;
  p_refExposure = &a6->refExposure;
  p_longExposure = &a6->longExposure;
  float RelativeBrightness = getRelativeBrightness((uint64_t)&v77->refExposure, (uint64_t)&v77->longExposure, 2);
  float gain = v77->syntheticLongExposure.gain;
  p_float gain = (_DWORD *)&v77->syntheticLongExposure.gain;
  if (v77->deviceGeneration > 199 || v77->hasEVM) {
    float hr_gain_down_ratio = v77->refExposure.hr_gain_down_ratio;
  }
  else {
    float hr_gain_down_ratio = 1.0;
  }
  *(float *)&a7[232].useArtifactCorrectionNetwork = hr_gain_down_ratio;
  uint64_t v73 = (_DWORD *)&p_refExposure->gain;
  *(float *)&a7[16].useArtifactCorrectionNetwork = getRelativeBrightness((uint64_t)p_refExposure, (uint64_t)p_gain, 2);
  *(float *)&a7[20].useArtifactCorrectionNetwork = RelativeBrightness;
  *(_DWORD *)&a7[224].useArtifactCorrectionNetwork = 1065353216;
  *(float *)&a7[228].useArtifactCorrectionNetwork = sqrtf((float)v77->ev0Count);
  int v24 = +[RawDFCommon fillRawNoiseModelParameters:&a7[128] exposureParams:p_gain];
  if (v24
    || (int v24 = +[RawDFCommon fillRawNoiseModelParameters:&a7[80] exposureParams:p_longExposure]) != 0)
  {
    int v26 = v24;
    goto LABEL_43;
  }
  int v25 = +[RawDFCommon fillRawNoiseModelParameters:&a7[176] exposureParams:p_refExposure];
  int v26 = v25;
  if (!(v25 | a3))
  {
    uint64_t v27 = &OBJC_IVAR___RawDFNetworkStageTuningParams__brightLightNetworkParams;
    if (!a5) {
      uint64_t v27 = &OBJC_IVAR___RawDFNetworkStageTuningParams__lowLightNetworkParams;
    }
    if (a5 == 2) {
      uint64_t v27 = &OBJC_IVAR___RawDFNetworkStageTuningParams__opt2NetworkParams;
    }
    uint64_t v28 = *v27;
    uint64_t v29 = (float *)&v15[v28];
    v67 = (void **)&v16[v28];
    v72 = v14;
    int v69 = v25;
    BOOL v75 = (float)(v77->syntheticLongExposure.gain * v77->syntheticLongExposure.exposure_time) < *(float *)&v15[v28]
       && v77->motionDetectionScore > v29[1];
    v30 = v77;
    int v66 = ev0Count + 1;
    v68 = (void **)&v15[v28];
    a7->useArtifactCorrectionNetwork = *(unsigned char *)(RawDFNetworkUniforms)(v29 + 2);
    v31 = v16 + 128;
    v32 = v15 + 128;
    p_useArtifactCorrectionNetwork = (float *)&a7[368].useArtifactCorrectionNetwork;
    uint64_t v70 = v16;
    id v71 = v15;
    v34 = v16 + 304;
    v35 = v15 + 304;
    uint64_t v36 = 256;
    uint64_t v76 = v28;
    while (1)
    {
      v37 = &v32[v28];
      v38 = *(void **)&v32[v28 - 32];
      v39 = &v31[v28];
      v40 = &a7[v36];
      *(float *)&v40[-8].useArtifactCorrectionNetwork = interpolateWithGainAndZoom(v38, *((void **)v39 - 4), gain, v30->zoom);
      *(float *)&v40[-4].useArtifactCorrectionNetwork = interpolateWithGainAndZoom(*((void **)v37 - 3), *((void **)v39 - 3), gain, v30->zoom);
      if (v30->isEV0Reference)
      {
        *(_DWORD *)&v40[-16].useArtifactCorrectionNetwork = 0;
        float v41 = 0.0;
        uint64_t v28 = v76;
        v30 = v77;
        goto LABEL_26;
      }
      if (v75)
      {
        uint64_t v28 = v76;
        v30 = v77;
        float v45 = interpolateWithGainAndZoom(*(void **)&v32[v76 - 8], *(void **)&v31[v76 - 8], gain, v77->zoom);
        BOOL isEV0Reference = v77->isEV0Reference;
        *(float *)&v40[-16].useArtifactCorrectionNetwork = v45;
        float v41 = 0.0;
        if (isEV0Reference) {
          goto LABEL_26;
        }
        v47 = *(void **)&v32[v76];
        v48 = *(void **)&v31[v76];
      }
      else
      {
        v30 = v77;
        float v49 = interpolateWithGainAndZoom(*((void **)v37 - 6), *((void **)v39 - 6), gain, v77->zoom);
        BOOL v50 = v77->isEV0Reference;
        *(float *)&v40[-16].useArtifactCorrectionNetwork = v49;
        float v41 = 0.0;
        uint64_t v28 = v76;
        if (v50) {
          goto LABEL_26;
        }
        v47 = *(void **)&v32[v76 - 40];
        v48 = *(void **)&v31[v76 - 40];
      }
      float v41 = interpolateWithGainAndZoom(v47, v48, gain, v30->zoom);
LABEL_26:
      *(float *)&v78[v36 - 12].useArtifactCorrectionNetwork = v41;
      float v42 = 0.0;
      if (v30->hasEVM
        && fabsf(1.0- (float)(*(float *)&v78[16].useArtifactCorrectionNetwork * *(float *)&v78[232].useArtifactCorrectionNetwork)) > 0.00000011921)
      {
        float v42 = interpolateWithGainAndZoom(*(void **)&v32[v28 - 16], *(void **)&v31[v28 - 16], gain, v30->zoom);
      }
      *(float *)&v78[v36].useArtifactCorrectionNetwork = v42;
      *(p_useArtifactCorrectionNetwork - 3) = interpolateWithGainAndZoom(*(void **)&v35[v28], *(void **)&v34[v28], gain, v30->zoom);
      float *p_useArtifactCorrectionNetwork = interpolateWithGainAndZoom(*(void **)&v35[v28 + 8], *(void **)&v34[v28 + 8], gain, v30->zoom);
      *(p_useArtifactCorrectionNetwork - 2) = interpolateWithGainAndZoom(*(void **)&v35[v28 + 16], *(void **)&v34[v28 + 16], gain, v30->zoom);
      a7 = v78;
      *(p_useArtifactCorrectionNetwork - 1) = interpolateWithGainAndZoom(*(void **)&v35[v28 + 24], *(void **)&v34[v28 + 24], gain, v30->zoom);
      v36 += 28;
      v31 += 56;
      v32 += 56;
      p_useArtifactCorrectionNetwork += 20;
      v34 += 32;
      v35 += 32;
      if (v36 == 368)
      {
        float v15 = v71;
        float v51 = 1.0;
        float v52 = 1.0;
        if (v71[16])
        {
          LODWORD(v43) = *v73;
          LODWORD(v44) = 1.0;
          +[RawDFNetworkStageTuningParams computeTotalNoiseFactorWithTotalGain:v43 eit:v44];
          float v51 = v53;
          LODWORD(v54) = *p_gain;
          *(float *)&double v55 = RelativeBrightness * *(float *)&v78[232].useArtifactCorrectionNetwork;
          +[RawDFNetworkStageTuningParams computeTotalNoiseFactorWithTotalGain:v54 eit:v55];
          float v52 = v56 / (float)v66;
        }
        float v57 = interpolateWithGainAndZoom(v68[2], v67[2], gain, v30->zoom);
        if (v57 == 0.0) {
          float v58 = 1.0;
        }
        else {
          float v58 = 1.0 / v57;
        }
        *(float *)&v78[60].useArtifactCorrectionNetwork = v58;
        *(float *)&v78[64].useArtifactCorrectionNetwork = interpolateWithGainAndZoom(v68[3], v67[3], gain, v30->zoom);
        *(float *)&v78[68].useArtifactCorrectionNetwork = interpolateWithGainAndZoom(v68[4], v67[4], gain, v30->zoom);
        float v59 = interpolateWithGainAndZoom(v68[5], v67[5], gain, v30->zoom);
        *(float *)&v78[36].useArtifactCorrectionNetwork = v51 * v59;
        *(float *)&v78[40].useArtifactCorrectionNetwork = v59;
        float v60 = interpolateWithGainAndZoom(v68[6], v67[6], gain, v30->zoom);
        *(float *)&v78[28].useArtifactCorrectionNetwork = v52 * v60;
        *(float *)&v78[32].useArtifactCorrectionNetwork = v60;
        *(float *)&v78[44].useArtifactCorrectionNetwork = interpolateWithGainAndZoom(v68[7], v67[7], gain, v30->zoom);
        *(float *)&v78[56].useArtifactCorrectionNetwork = interpolateWithGainAndZoom(v68[8], v67[8], gain, v30->zoom);
        *(float *)&v78[52].useArtifactCorrectionNetwork = interpolateWithGainAndZoom(v68[9], v67[9], gain, v30->zoom);
        v14 = v72;
        v16 = v70;
        int v26 = v69;
        break;
      }
    }
  }
LABEL_43:

  return v26;
}

+ (float)computeTotalNoiseFactorWithTotalGain:(float)a3 eit:(float)a4 gain0:(float)a5 gain1:(float)a6
{
  float v6 = a3 * a4;
  float result = 1.0;
  if (v6 >= a5)
  {
    float v8 = a6 - a5;
    if (a6 <= a5) {
      float v8 = 1.0;
    }
    float result = (float)((float)(v6 - a5) / v8) + 1.0;
    if (v6 > a6) {
      return 2.0;
    }
  }
  return result;
}

+ (float)computeTotalNoiseFactorWithTotalGain:(float)a3 eit:(float)a4
{
  objc_msgSend(a1, "computeTotalNoiseFactorWithTotalGain:eit:gain0:gain1:");
  return result;
}

- (void).cxx_destruct
{
  __destructor_8_S_s16_s24_s32_s40_s48_s56_s64_s72_AB80s56n4_S_s80_s88_s96_s104_s112_s120_s128_AE_AB304s32n4_S_s304_s312_s320_s328_AE((uint64_t)&self->_opt2NetworkParams);
  __destructor_8_S_s16_s24_s32_s40_s48_s56_s64_s72_AB80s56n4_S_s80_s88_s96_s104_s112_s120_s128_AE_AB304s32n4_S_s304_s312_s320_s328_AE((uint64_t)&self->_brightLightNetworkParams);

  __destructor_8_S_s16_s24_s32_s40_s48_s56_s64_s72_AB80s56n4_S_s80_s88_s96_s104_s112_s120_s128_AE_AB304s32n4_S_s304_s312_s320_s328_AE((uint64_t)&self->_lowLightNetworkParams);
}

@end