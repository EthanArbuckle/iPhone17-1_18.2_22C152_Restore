@interface RawDFDetectors
+ (BOOL)srShouldUseMotionScoreBasedOnEvm:(id)a3 andSRTuning:(id)a4;
+ (BOOL)srShouldUseMotionScoreBasedOnEvm:(id)a3 andSRTuning:(id)a4 logIntermediates:(BOOL)a5;
+ (id)packDetectorsOutput:(id *)a3;
+ (int)runDetectorsToOutput:(id *)a3 withRequestedSyntheticReferenceMode:(int *)a4 withEv0:(id)a5 withEvm:(id)a6 withSRTuning:(id)a7 withDownSampleStage:(id)a8 withColorMatchStage:(id)a9 withMotionDetection:(id)a10 withgrayGhostDetection:(id)a11 withFlickerDetection:(id)a12;
+ (int)runMotionToOutput:(id *)a3 withRefFrame:(id)a4 withOtherFrame:(id)a5 withPyramidBand:(unint64_t)a6 withTuningParams:(id *)a7 withMotionDetection:(id)a8;
+ (int)unpackDetectorsOutput:(id *)a3 fromDictionary:(id)a4;
+ (void)resetDetectorsOutput:(id *)a3;
@end

@implementation RawDFDetectors

+ (int)runDetectorsToOutput:(id *)a3 withRequestedSyntheticReferenceMode:(int *)a4 withEv0:(id)a5 withEvm:(id)a6 withSRTuning:(id)a7 withDownSampleStage:(id)a8 withColorMatchStage:(id)a9 withMotionDetection:(id)a10 withgrayGhostDetection:(id)a11 withFlickerDetection:(id)a12
{
  uint64_t v168 = *MEMORY[0x263EF8340];
  id v17 = a5;
  id v18 = a6;
  v148 = (int *)a7;
  id v19 = a8;
  id v152 = a9;
  id v20 = a10;
  id v21 = a11;
  id v144 = a12;
  id v158 = 0;
  id v159 = 0;
  id v156 = 0;
  id v157 = 0;
  id v154 = 0;
  id v155 = 0;
  uint64_t v22 = [v17 properties];
  uint64_t v23 = [v18 properties];
  v149 = v19;
  v151 = (void *)v22;
  v146 = v21;
  v147 = (void *)v23;
  v145 = v20;
  if (!v22 || !v23 || !a3)
  {
    int v160 = 0;
    v153[0] = OS_LOG_TYPE_DEFAULT;
    v138 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v138, OS_LOG_TYPE_DEFAULT);
    v24 = v148;
LABEL_108:
    v100 = v144;
    v101 = (void *)v22;
    int v65 = -73330;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v83 = 0;
    v43 = 0;
    float v46 = 0.0;
    float v45 = 0.0;
LABEL_93:
    v64 = v149;
    goto LABEL_94;
  }
  v24 = v148;
  if (!v17 || !v18 || !v148 || !v19 || !v152 || !v20 || !v21)
  {
LABEL_100:
    int v160 = 0;
    v153[0] = OS_LOG_TYPE_DEFAULT;
    v138 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v138, OS_LOG_TYPE_DEFAULT);
    goto LABEL_108;
  }
  v25 = [v17 rgbTex];
  v150 = v18;
  if (v25)
  {
    v26 = [v18 rgbTex];
    if (v26)
    {

LABEL_30:
      goto LABEL_31;
    }
  }
  v27 = [v17 auxDraftDemosaicLumaTexture];
  if (v27)
  {
    v28 = [v18 auxDraftDemosaicLumaTexture];

    if (v25) {
    if (v28)
    }
    {
      v29 = [v17 auxDraftDemosaicRGBTexture];

      if (!v29) {
        goto LABEL_113;
      }
      v30 = [v18 auxDraftDemosaicRGBTexture];

      if (!v30) {
        goto LABEL_113;
      }
      v31 = [v17 auxDraftDemosaicLumaTexture];

      if (!v31) {
        goto LABEL_113;
      }
      v32 = [v18 auxDraftDemosaicLumaTexture];

      if (!v32) {
        goto LABEL_113;
      }
      v33 = [v17 auxDraftDemosaicRGBTexture];
      uint64_t v34 = [v33 pixelFormat];

      if (v34 != 520
        || ([v18 auxDraftDemosaicRGBTexture],
            v35 = objc_claimAutoreleasedReturnValue(),
            uint64_t v36 = [v35 pixelFormat],
            v35,
            v36 != 520))
      {
LABEL_113:
        int v160 = 0;
        v153[0] = OS_LOG_TYPE_DEFAULT;
        v139 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v139, OS_LOG_TYPE_DEFAULT);
        int v65 = -73330;
        fig_log_call_emit_and_clean_up_after_send_and_compose();

        v83 = 0;
        v43 = 0;
        float v46 = 0.0;
        float v45 = 0.0;
        v24 = v148;
        v64 = v149;
        goto LABEL_64;
      }
      v37 = [v17 properties];
      v38 = [v37 meta];
      uint64_t v39 = [v38 exposureParams];

      v40 = [v18 properties];
      v41 = [v40 meta];
      uint64_t v42 = [v41 exposureParams];

      float v44 = *(float *)(v39 + 48);
      v43 = (float *)(v39 + 48);
      float v45 = v44;
      float v46 = *(float *)(v42 + 48);
      float *v43 = 1.0;
      v142 = (float *)(v42 + 48);
      *(_DWORD *)(v42 + 48) = 1065353216;
      BOOL v47 = +[RawDFDetectors srShouldUseMotionScoreBasedOnEvm:v18 andSRTuning:v148 logIntermediates:1];
      int v48 = v148[8];
      if (v48 <= 0)
      {
        int v160 = 0;
        v153[0] = OS_LOG_TYPE_DEFAULT;
        v140 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v140, OS_LOG_TYPE_DEFAULT);
        int v65 = -73330;
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      else
      {
        BOOL v49 = v47;
        if (!a4)
        {
          id v159 = [v17 auxDraftDemosaicLumaTexture];
          id v158 = [v18 auxDraftDemosaicLumaTexture];
        }
        BOOL v143 = v49;
        v50 = v17;
        v51 = objc_opt_new();
        [v51 setDownsampleLevel:2];
        [v51 setOutputType:1];
        [v51 setOutputTexLabel:0];
        [v51 setRelaxDimensionRequirement:1];
        if (v48 < 2)
        {
          v163 = v51;
          v53 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v163 count:1];
          v52 = 0;
        }
        else
        {
          v52 = objc_opt_new();
          [v52 setDownsampleLevel:(v48 - 1)];
          [v52 setOutputType:0];
          [v52 setOutputTexLabel:0];
          [v52 setRelaxDimensionRequirement:v48 != 2];
          v164[0] = v52;
          v164[1] = v51;
          v53 = [MEMORY[0x263EFF8C0] arrayWithObjects:v164 count:2];
        }
        v85 = [v50 auxDraftDemosaicRGBTexture];
        int v65 = [v149 generateWithInputTexture:v85 withRequests:v53];

        if (!v65)
        {
          if (v52)
          {
            v86 = [v52 outputTex];
            id v87 = v157;
            id v157 = v86;

            v88 = [v51 outputTex];
            id v89 = v155;
            id v155 = v88;

            [v52 setOutputTex:0];
            [v52 setOutputTexLabel:0];
          }
          else
          {
            v90 = [v50 auxDraftDemosaicRGBTexture];
            id v91 = v157;
            id v157 = v90;

            v92 = [v51 outputTex];
            id v93 = v155;
            id v155 = v92;
          }
          [v51 setOutputTex:0];
          [v51 setOutputTexLabel:0];
          v94 = [v150 auxDraftDemosaicRGBTexture];
          int v65 = [v149 generateWithInputTexture:v94 withRequests:v53];

          if (!v65)
          {
            if (v52) {
              [v52 outputTex];
            }
            else {
            v95 = [v150 auxDraftDemosaicRGBTexture];
            }
            id v96 = v156;
            id v156 = v95;

            v97 = [v51 outputTex];
            id v98 = v154;
            id v154 = v97;

            [v52 setOutputTex:0];
            [v51 setOutputTex:0];

            if (a4)
            {
              id v17 = v50;
              v24 = v148;
              v64 = v149;
              v83 = v142;
LABEL_62:
              int v99 = *a4;
              a3->var0 = *a4;
              id v18 = v150;
              if (v99 != 1)
              {
                int v65 = 0;
LABEL_64:
                v100 = v144;
                v101 = v151;
                goto LABEL_94;
              }
              goto LABEL_78;
            }
            v141 = v43;
            v84 = a3;
            id v17 = v50;
            v24 = v148;
            v64 = v149;
            goto LABEL_66;
          }
        }
        FigDebugAssert3();

        id v17 = v50;
        id v18 = v150;
      }
      v24 = v148;
      v64 = v149;
      v100 = v144;
      v101 = v151;
      v83 = v142;
      goto LABEL_94;
    }
  }
  else
  {

    if (v25) {
      goto LABEL_30;
    }
  }
LABEL_31:
  v54 = [v17 rgbTex];

  if (!v54) {
    goto LABEL_100;
  }
  v55 = [v18 rgbTex];

  if (!v55) {
    goto LABEL_100;
  }
  BOOL v143 = +[RawDFDetectors srShouldUseMotionScoreBasedOnEvm:v18 andSRTuning:v148 logIntermediates:1];
  uint64_t v56 = v148[8];
  v57 = v17;
  if (a4) {
    v58 = 0;
  }
  else {
    v58 = objc_opt_new();
  }
  v59 = objc_opt_new();
  uint64_t v60 = objc_opt_new();
  v61 = (void *)v60;
  if (a4)
  {
    v161[0] = v59;
    v161[1] = v60;
    v62 = [MEMORY[0x263EFF8C0] arrayWithObjects:v161 count:2];
  }
  else
  {
    v162[0] = v58;
    v162[1] = v59;
    v162[2] = v60;
    v62 = [MEMORY[0x263EFF8C0] arrayWithObjects:v162 count:3];
    [v58 setDownsampleLevel:1];
    [v58 setOutputType:1];
    [v58 setOutputTexLabel:0];
  }
  [v59 setDownsampleLevel:v56];
  [v59 setOutputType:0];
  [v59 setOutputTexLabel:0];
  [v61 setDownsampleLevel:3];
  [v61 setOutputType:1];
  [v61 setOutputTexLabel:0];
  v63 = [v57 rgbTex];
  v64 = v149;
  int v65 = [v149 generateWithInputTexture:v63 withRequests:v62];

  if (v65) {
    goto LABEL_107;
  }
  if (a4)
  {
    v66 = [v59 outputTex];
    id v67 = v157;
    id v157 = v66;

    v68 = [v61 outputTex];
    id v69 = v155;
    id v155 = v68;
  }
  else
  {
    v70 = [v58 outputTex];
    id v71 = v159;
    id v159 = v70;

    v72 = [v59 outputTex];
    id v73 = v157;
    id v157 = v72;

    v74 = [v61 outputTex];
    id v75 = v155;
    id v155 = v74;

    [v58 setOutputTex:0];
  }
  [v59 setOutputTex:0];
  [v61 setOutputTex:0];
  if (!a4) {
    [v58 setOutputTexLabel:0];
  }
  [v59 setOutputTexLabel:0];
  [v61 setOutputTexLabel:0];
  v76 = [v150 rgbTex];
  int v65 = [v149 generateWithInputTexture:v76 withRequests:v62];

  if (v65)
  {
LABEL_107:
    FigDebugAssert3();

    v83 = 0;
    v43 = 0;
    float v46 = 0.0;
    float v45 = 0.0;
    id v17 = v57;
    id v18 = v150;
    v24 = v148;
    goto LABEL_64;
  }
  if (!a4)
  {
    v77 = [v58 outputTex];
    id v78 = v158;
    id v158 = v77;
  }
  v79 = [v59 outputTex];
  id v80 = v156;
  id v156 = v79;

  v81 = [v61 outputTex];
  id v82 = v154;
  id v154 = v81;

  [v58 setOutputTex:0];
  [v59 setOutputTex:0];
  [v61 setOutputTex:0];

  v83 = 0;
  float v46 = 0.0;
  if (a4)
  {
    float v45 = 0.0;
    v43 = 0;
    id v17 = v57;
    v24 = v148;
    goto LABEL_62;
  }
  v84 = a3;
  float v45 = 0.0;
  v141 = 0;
  v142 = 0;
  id v17 = v57;
  v24 = v148;
LABEL_66:
  v165[0] = v24[11];
  v165[1] = v24[10];
  v165[2] = v24[12];
  int v102 = [v146 runGrayGhostDetectionWithRGBEvmTexture:v156 withRGBEv0Texture:v157 evmProperties:v147 ev0Properties:v151 params:v165];
  id v18 = v150;
  if (v102
    || (FigMetalDecRef(),
        FigMetalDecRef(),
        long long v166 = *(_OWORD *)(v24 + 18),
        int v167 = 0,
        (int v102 = [v145 startMotionDetectionWithParams:&v166 evm:v158 ev0:v159 evmProperties:v147 ev0Properties:v151 useFullImage:*((unsigned __int8 *)v24 + 100)]) != 0))
  {
    int v65 = v102;
    v83 = v142;
    v100 = v144;
  }
  else
  {
    FigMetalDecRef();
    FigMetalDecRef();
    v100 = v144;
    int v103 = [v144 detectFlickerWithEVMLuma:v154 withEV0Luma:v155 evmProperties:v147 ev0Properties:v151];
    if (v103)
    {
      int v65 = v103;
      v83 = v142;
    }
    else
    {
      [v146 getGrayGhostResultSync];
      float v105 = v104;
      [v145 getMotionDetectionResultSync];
      float v107 = v106;
      *(_DWORD *)v153 = 0;
      int v108 = [v144 getFlickerDetectionResultSync:v153];
      v83 = v142;
      if (!v108)
      {
        LODWORD(v109) = *(_DWORD *)v153;
        BOOL v110 = +[RawDFFlickerDetectorStage hasFlickerWithResult:v109];
        float v111 = *((float *)v24 + 9);
        BOOL v112 = v143;
        if (v143) {
          BOOL v112 = v107 > *((float *)v24 + 22);
        }
        a3 = v84;
        v84->var1 = v107;
        v84->var2 = v105;
        v84->var3 = v112;
        v84->var4 = v105 > v111;
        v84->var5 = v110;
        int v113 = v105 > v111 || v112;
        v84->var0 = v113;
        v43 = v141;
        if (!v110)
        {
          if ((v113 & 1) == 0)
          {
            int v65 = 0;
LABEL_91:
            v101 = v151;
            v100 = v144;
            goto LABEL_94;
          }
LABEL_78:
          float v115 = 1.0;
          if (v43
            && ([v17 properties],
                v116 = objc_claimAutoreleasedReturnValue(),
                [v116 meta],
                v117 = objc_claimAutoreleasedReturnValue(),
                int v118 = *(unsigned __int8 *)([v117 exposureParams] + 98),
                v117,
                v116,
                v118))
          {
            float *v43 = v45;
            float v119 = 1.0 / v45;
            v43 = 0;
            if (!v83) {
              goto LABEL_85;
            }
          }
          else
          {
            float v119 = 1.0;
            if (!v83)
            {
LABEL_85:
              v123 = [v147 meta];
              uint64_t v124 = [v123 exposureParams];
              v125 = [v151 meta];
              float v126 = v119 * getRelativeBrightness(v124, [v125 exposureParams], 2);

              v127 = [v147 meta];
              if (*(unsigned char *)([v127 exposureParams] + 98))
              {
                v128 = [v147 meta];
                float v129 = *(float *)([v128 exposureParams] + 48);
              }
              else
              {
                float v129 = 1.0;
              }

              id v131 = v154;
              id v130 = v155;
              uint64_t v132 = [v151 regHomography];
              uint64_t v133 = [v147 regHomography];
              *(float *)&double v134 = v126;
              *(float *)&double v135 = v115;
              *(float *)&double v136 = v129;
              int v65 = [v152 colorMatchEvmWithLowResEv0:v130 withLowResEvm:v131 withEv0Homography:v132 withEvmHomography:v133 scaleEv0Brightness:&a3[1] scaleEvmBrightness:v134 evmHRGainDownRatio:v135 outputColorAdjustment:v136];
              if (!v65)
              {
                FigMetalDecRef();
                FigMetalDecRef();
              }
              v64 = v149;
              goto LABEL_91;
            }
          }
          v120 = [v18 properties];
          v121 = [v120 meta];
          int v122 = *(unsigned __int8 *)([v121 exposureParams] + 98);

          if (v122)
          {
            float *v83 = v46;
            float v115 = 1.0 / v46;
            v83 = 0;
          }
          goto LABEL_85;
        }
        v114 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT);
        v100 = v144;
        v101 = v151;
        fig_log_call_emit_and_clean_up_after_send_and_compose();

        int v65 = -73439;
        goto LABEL_93;
      }
      int v65 = v108;
    }
  }
  v101 = v151;
  v43 = v141;
LABEL_94:
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  if (v43) {
    float *v43 = v45;
  }
  if (v83) {
    float *v83 = v46;
  }

  return v65;
}

+ (int)runMotionToOutput:(id *)a3 withRefFrame:(id)a4 withOtherFrame:(id)a5 withPyramidBand:(unint64_t)a6 withTuningParams:(id *)a7 withMotionDetection:(id)a8
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v13 = a4;
  id v14 = a5;
  id v15 = a8;
  v16 = [v13 properties];
  uint64_t v17 = [v14 properties];
  id v18 = (void *)v17;
  if (v16
    && v17
    && a3
    && v13
    && v14
    && ([v13 pyramid], id v19 = objc_claimAutoreleasedReturnValue(), v19, v19)
    && ([v14 pyramid], id v20 = objc_claimAutoreleasedReturnValue(), v20, v20)
    && a7
    && v15)
  {
    id v21 = [v13 pyramid];
    uint64_t v22 = [v21 getTextureAtLevel:a6];

    uint64_t v23 = [v14 pyramid];
    v24 = [v23 getTextureAtLevel:a6];

    long long v34 = *(_OWORD *)&a7->var2;
    int v35 = 0;
    long long v25 = *(_OWORD *)(MEMORY[0x263EF89A0] + 16);
    v32[0] = *MEMORY[0x263EF89A0];
    v32[1] = v25;
    long long v33 = *(_OWORD *)(MEMORY[0x263EF89A0] + 32);
    v31[0] = v32[0];
    v31[1] = v25;
    v31[2] = v33;
    LOBYTE(v30) = a7->var9;
    int v26 = [v15 startMotionDetectionWithParams:&v34 evm:v24 ev0:v22 evmProperties:v18 ev0Properties:v16 evmHomography:v31 ev0Homography:v32 useFullImage:v30];
    if (!v26)
    {
      [v15 getMotionDetectionResultSync];
      a3->var1 = v27;
    }
  }
  else
  {
    int v37 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v29 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
    int v26 = -73330;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v24 = 0;
    uint64_t v22 = 0;
  }

  return v26;
}

+ (id)packDetectorsOutput:(id *)a3
{
  v16[7] = *MEMORY[0x263EF8340];
  v15[0] = @"MotionScore";
  *(float *)&double v3 = a3->var1;
  v5 = [NSNumber numberWithFloat:v3];
  v16[0] = v5;
  v15[1] = @"GrayGhostScore";
  *(float *)&double v6 = a3->var2;
  v7 = [NSNumber numberWithFloat:v6];
  v16[1] = v7;
  v15[2] = @"HasMotion";
  v8 = [NSNumber numberWithBool:a3->var3];
  v16[2] = v8;
  v15[3] = @"HasGrayGhost";
  v9 = [NSNumber numberWithBool:a3->var4];
  v16[3] = v9;
  v15[4] = @"HasFlicker";
  v10 = [NSNumber numberWithBool:a3->var5];
  v16[4] = v10;
  v15[5] = @"DSRMode";
  v11 = [NSNumber numberWithInt:a3->var0 == 1];
  v16[5] = v11;
  v15[6] = @"EVMColorAdjustment";
  v12 = +[RawDFColorMatchStage packColorAdjustment:&a3[1]];
  v16[6] = v12;
  id v13 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:7];

  return v13;
}

+ (int)unpackDetectorsOutput:(id *)a3 fromDictionary:(id)a4
{
  id v5 = a4;
  double v6 = v5;
  if (!v5) {
    goto LABEL_12;
  }
  v7 = [v5 objectForKeyedSubscript:@"MotionScore"];
  if (!v7) {
    goto LABEL_12;
  }
  v8 = v7;
  [v7 floatValue];
  a3->var1 = v9;
  v10 = [v6 objectForKeyedSubscript:@"GrayGhostScore"];

  if (!v10) {
    goto LABEL_12;
  }
  [v10 floatValue];
  a3->var2 = v11;
  v12 = [v6 objectForKeyedSubscript:@"HasMotion"];

  if (!v12) {
    goto LABEL_12;
  }
  a3->var3 = [v12 BOOLValue];
  id v13 = [v6 objectForKeyedSubscript:@"HasGrayGhost"];

  if (!v13) {
    goto LABEL_12;
  }
  a3->var4 = [v13 BOOLValue];
  id v14 = [v6 objectForKeyedSubscript:@"HasFlicker"];

  if (!v14) {
    goto LABEL_12;
  }
  a3->var5 = [v14 BOOLValue];
  id v15 = [v6 objectForKeyedSubscript:@"DSRMode"];

  if (v15)
  {
    a3->var0 = [v15 BOOLValue];
    uint64_t v16 = [v6 objectForKeyedSubscript:@"EVMColorAdjustment"];
    if (v16)
    {
      uint64_t v17 = (void *)v16;
      int v18 = +[RawDFColorMatchStage unpackColorAdjustment:&a3[1] fromDictionary:v16];
      if (v18) {
        FigDebugAssert3();
      }
    }
    else
    {
      id v21 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
      int v18 = -73330;
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      uint64_t v17 = 0;
    }
  }
  else
  {
LABEL_12:
    id v20 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
    int v18 = -73330;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    uint64_t v17 = 0;
    id v15 = 0;
  }

  return v18;
}

+ (void)resetDetectorsOutput:(id *)a3
{
  if (a3)
  {
    *(void *)&a3->var1 = 0;
    *(float *)((char *)&a3->var2 + 3) = 0.0;
    +[RawDFColorMatchStage resetColorAdjustment:&a3[1]];
  }
}

+ (BOOL)srShouldUseMotionScoreBasedOnEvm:(id)a3 andSRTuning:(id)a4 logIntermediates:(BOOL)a5
{
  id v6 = a3;
  v7 = (float *)a4;
  v8 = v7;
  if (v6 && v7)
  {
    float v9 = [v6 properties];
    v10 = [v9 meta];
    float v11 = *(float *)([v10 exposureParams] + 52);
    v12 = [v6 properties];
    id v13 = [v12 meta];
    float v14 = v11 * *(float *)[v13 exposureParams];

    BOOL v15 = v14 <= (float)(v8[16] / 0.98) && v14 >= (float)(v8[17] * 0.98);
  }
  else
  {
    uint64_t v17 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    BOOL v15 = 0;
  }

  return v15;
}

+ (BOOL)srShouldUseMotionScoreBasedOnEvm:(id)a3 andSRTuning:(id)a4
{
  return +[RawDFDetectors srShouldUseMotionScoreBasedOnEvm:a3 andSRTuning:a4 logIntermediates:0];
}

@end