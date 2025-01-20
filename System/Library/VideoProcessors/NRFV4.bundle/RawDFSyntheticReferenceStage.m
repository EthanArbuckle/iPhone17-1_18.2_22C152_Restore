@interface RawDFSyntheticReferenceStage
+ (int)fillFrameProperties:(id *)a3 withEvmProperties:(id)a4 withEv0Properties:(id)a5;
+ (int)prewarmShaders:(id)a3;
- (RawDFSyntheticReferenceStage)initWithMetalContext:(id)a3;
- (int)_doDeepShadowRecovery:(id)a3 noiseDivisorOutputTex:(id)a4 lscGainsTex:(id)a5 evmPyramid:(id)a6 ev0Pyramid:(id)a7 frameProperties:(id *)a8 srPlist:(id)a9;
- (int)_doHighlightRecovery:(id)a3 noiseDivisorOutputTex:(id)a4 evmPyramid:(id)a5 ev0Pyramid:(id)a6 frameProperties:(id *)a7 srPlist:(id)a8;
- (int)genereteSyntheticReference:(id)a3 noiseDivisorOutputTex:(id)a4 mode:(int)a5 lscGainsTex:(id)a6 evmPyramid:(id)a7 ev0Pyramid:(id)a8 frameProperties:(id *)a9 tuning:(id)a10;
- (int)packSyntheticReference:(id)a3 toOutputTex:(id)a4;
@end

@implementation RawDFSyntheticReferenceStage

- (RawDFSyntheticReferenceStage)initWithMetalContext:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)RawDFSyntheticReferenceStage;
  v6 = [(RawDFSyntheticReferenceStage *)&v14 init];
  v7 = v6;
  if (!v6
    || !v5
    || (objc_storeStrong((id *)&v6->_metal, a3),
        v8 = [[RawDFSyntheticReferenceShaders alloc] initWithMetal:v5], shaders = v7->_shaders, v7->_shaders = v8, shaders, v10 = v7, !v7->_shaders))
  {
    v13 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v10 = 0;
  }
  v11 = v10;

  return v11;
}

+ (int)prewarmShaders:(id)a3
{
  id v3 = a3;
  v4 = [[RawDFSyntheticReferenceShaders alloc] initWithMetal:v3];

  if (v4) {
    int v5 = 0;
  }
  else {
    int v5 = -12786;
  }

  return v5;
}

- (int)_doHighlightRecovery:(id)a3 noiseDivisorOutputTex:(id)a4 evmPyramid:(id)a5 ev0Pyramid:(id)a6 frameProperties:(id *)a7 srPlist:(id)a8
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v50 = a4;
  id v49 = a5;
  id v15 = a6;
  v16 = (id *)a8;
  v17 = (int *)MEMORY[0x263F00E10];
  int v18 = *MEMORY[0x263F00E10];
  if (*MEMORY[0x263F00E10] == 1)
  {
    kdebug_trace();
    int v18 = *v17;
  }
  if (v18)
  {
    v19 = [(FigMetalContext *)self->_metal commandQueue];
    v20 = [v19 commandBuffer];

    [v20 setLabel:@"KTRACE_START_MTL"];
    [v20 addCompletedHandler:&__block_literal_global_2];
    [v20 commit];
  }
  v21 = [(FigMetalContext *)self->_metal commandQueue];
  v22 = [v21 commandBuffer];

  if (v22)
  {
    v23 = [v22 computeCommandEncoder];
    if (v23)
    {
      v24 = v23;
      [v23 setBytes:&a7->var1.var2.var1 length:112 atIndex:0];
      v25 = [v16[2] objectAtIndexedSubscript:0];

      if (v25)
      {
        float var5 = a7[1].var1.var3.var5;
        v27 = [v16[2] objectAtIndexedSubscript:0];
        v53[0] = v27[5];
        v28 = [v16[2] objectAtIndexedSubscript:0];
        v53[1] = v28[6];
        v29 = [v16[2] objectAtIndexedSubscript:0];
        v53[2] = v29[3];
        v30 = [v16[2] objectAtIndexedSubscript:0];
        v53[3] = v30[4];
        v31 = [v16[2] objectAtIndexedSubscript:0];
        *(float *)&v53[4] = v31[2] / var5;

        [v24 setBytes:v53 length:20 atIndex:1];
        v32 = [v15 getTextureAtLevel:0];
        [v24 setTexture:v32 atIndex:0];

        v33 = [v49 getTextureAtLevel:0];
        [v24 setTexture:v33 atIndex:1];

        [v24 setTexture:v14 atIndex:2];
        [v24 setTexture:v50 atIndex:3];
        uint64_t v34 = [(RawDFSyntheticReferenceShaders *)self->_shaders getKernel:0];
        if (v34)
        {
          v35 = v34;
          [v24 setComputePipelineState:v34];
          if ((unint64_t)[v35 maxTotalThreadsPerThreadgroup] > 0xFF)
          {
            [v24 setImageblockWidth:32 height:32];
            v52[0] = (unint64_t)[v14 width] >> 1;
            v52[1] = (unint64_t)[v14 height] >> 1;
            v52[2] = 1;
            int64x2_t v62 = vdupq_n_s64(0x10uLL);
            uint64_t v63 = 1;
            [v24 dispatchThreads:v52 threadsPerThreadgroup:&v62];
            [v24 endEncoding];
            [v22 commit];

            int v36 = 0;
            v17 = (int *)MEMORY[0x263F00E10];
            goto LABEL_11;
          }
          unsigned int v55 = 0;
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          v45 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          unsigned int v46 = v55;
          if (os_log_type_enabled(v45, type)) {
            unsigned int v47 = v46;
          }
          else {
            unsigned int v47 = v46 & 0xFFFFFFFE;
          }
          if (v47)
          {
            int v48 = [v35 maxTotalThreadsPerThreadgroup];
            int v56 = 136315650;
            v57 = "-[RawDFSyntheticReferenceStage _doHighlightRecovery:noiseDivisorOutputTex:evmPyramid:ev0Pyramid:frameP"
                  "roperties:srPlist:]";
            __int16 v58 = 1024;
            int v59 = v48;
            __int16 v60 = 1024;
            int v61 = 256;
            _os_log_send_and_compose_impl();
          }
          v17 = (int *)MEMORY[0x263F00E10];
          int v36 = -73281;
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        else
        {
          unsigned int v55 = 0;
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          v35 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          unsigned int v43 = v55;
          if (os_log_type_enabled(v35, type)) {
            unsigned int v44 = v43;
          }
          else {
            unsigned int v44 = v43 & 0xFFFFFFFE;
          }
          if (v44)
          {
            int v56 = 136315138;
            v57 = "-[RawDFSyntheticReferenceStage _doHighlightRecovery:noiseDivisorOutputTex:evmPyramid:ev0Pyramid:frameP"
                  "roperties:srPlist:]";
            _os_log_send_and_compose_impl();
          }
          v17 = (int *)MEMORY[0x263F00E10];
          int v36 = -73281;
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
      }
      else
      {
        unsigned int v55 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        v42 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT);
        v17 = (int *)MEMORY[0x263F00E10];
        int v36 = -73281;
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
    }
    else
    {
      unsigned int v55 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      v41 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT);
      int v36 = -73281;
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  else
  {
    FigDebugAssert3();
    int v36 = FigSignalErrorAt();
  }
LABEL_11:
  int v37 = *v17;
  if (*v17 == 1)
  {
    kdebug_trace();
    int v37 = *v17;
  }
  if (v37)
  {
    v38 = [(FigMetalContext *)self->_metal commandQueue];
    v39 = [v38 commandBuffer];

    [v39 setLabel:@"KTRACE_END_MTL"];
    v51[0] = MEMORY[0x263EF8330];
    v51[1] = 3221225472;
    v51[2] = __121__RawDFSyntheticReferenceStage__doHighlightRecovery_noiseDivisorOutputTex_evmPyramid_ev0Pyramid_frameProperties_srPlist___block_invoke_27;
    v51[3] = &__block_descriptor_56_e28_v16__0___MTLCommandBuffer__8l;
    v51[5] = 0;
    v51[6] = 0;
    v51[4] = 1;
    [v39 addCompletedHandler:v51];
    [v39 commit];
  }
  return v36;
}

void __121__RawDFSyntheticReferenceStage__doHighlightRecovery_noiseDivisorOutputTex_evmPyramid_ev0Pyramid_frameProperties_srPlist___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 GPUEndTime];
  [v2 GPUStartTime];

  if (*MEMORY[0x263F00E10] == 1)
  {
    kdebug_trace();
  }
}

void __121__RawDFSyntheticReferenceStage__doHighlightRecovery_noiseDivisorOutputTex_evmPyramid_ev0Pyramid_frameProperties_srPlist___block_invoke_27(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 status] == 4)
  {
    [v2 GPUEndTime];
    [v2 GPUStartTime];
  }
  else
  {
    [v2 status];
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
}

- (int)_doDeepShadowRecovery:(id)a3 noiseDivisorOutputTex:(id)a4 lscGainsTex:(id)a5 evmPyramid:(id)a6 ev0Pyramid:(id)a7 frameProperties:(id *)a8 srPlist:(id)a9
{
  v109[16] = *MEMORY[0x263EF8340];
  id v91 = a3;
  id v90 = a4;
  id v97 = a5;
  id v15 = a6;
  id v96 = a7;
  v94 = a8;
  v95 = (id *)a9;
  float var0 = a8->var0;
  id v105 = 0;
  v17 = (int *)MEMORY[0x263F00E10];
  int v18 = *MEMORY[0x263F00E10];
  if (*MEMORY[0x263F00E10] == 1)
  {
    kdebug_trace();
    int v18 = *v17;
  }
  if (v18)
  {
    v19 = [(FigMetalContext *)self->_metal commandQueue];
    v20 = [v19 commandBuffer];

    [v20 setLabel:@"KTRACE_START_MTL"];
    [v20 addCompletedHandler:&__block_literal_global_30];
    [v20 commit];
  }
  int v21 = [v96 getLevelCount];
  v22 = [(FigMetalContext *)self->_metal allocator];
  v23 = (void *)[v22 newTextureDescriptor];

  v92 = v23;
  if (!v23)
  {
    v35 = v96;
    v106.i32[0] = 0;
    type[0] = OS_LOG_TYPE_DEFAULT;
    v86 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT);
    int v65 = -73281;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    uint64_t v64 = 0;
    v53 = 0;
    v33 = 0;
    v32 = 0;
    goto LABEL_32;
  }
  uint64_t v100 = (v21 - 1);
  v24 = [v96 getTextureAtLevel:(int)v100];
  uint64_t v25 = [v24 width];
  v26 = [v23 desc];
  [v26 setWidth:v25];

  uint64_t v27 = [v24 height];
  v28 = [v23 desc];
  [v28 setHeight:v27];

  v29 = [v23 desc];
  [v29 setUsage:3];

  v30 = [v23 desc];
  [v30 setPixelFormat:115];

  if (v21 < 1)
  {
    uint64_t v64 = 0;
    v53 = 0;
    v33 = 0;
    v32 = 0;
    v66 = (int *)MEMORY[0x263F00E10];
    v35 = v96;
    int v65 = 0;
    goto LABEL_34;
  }
  uint64_t v31 = 0;
  v32 = 0;
  v33 = 0;
  uint64_t v34 = 0;
  int64x2_t v93 = vdupq_n_s64(0x14uLL);
  v35 = v96;
  v101 = self;
  do
  {
    int v36 = v34;
    int v37 = v32;
    v38 = [(FigMetalContext *)self->_metal commandQueue];
    v32 = [v38 commandBuffer];

    if (!v32)
    {
      FigDebugAssert3();
      int v71 = FigSignalErrorAt();
      uint64_t v64 = 0;
      v66 = (int *)MEMORY[0x263F00E10];
      v53 = v36;
      int v65 = v71;
      goto LABEL_34;
    }
    v39 = [v32 computeCommandEncoder];

    if (!v39)
    {
      v106.i32[0] = 0;
      type[0] = OS_LOG_TYPE_DEFAULT;
      v72 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v73 = v106.i32[0];
      if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v74 = v73;
      }
      else {
        unsigned int v74 = v73 & 0xFFFFFFFE;
      }
      if (v74)
      {
        LODWORD(v108[0]) = 136315138;
        *(void *)((char *)v108 + 4) = "-[RawDFSyntheticReferenceStage _doDeepShadowRecovery:noiseDivisorOutputTex:lscGa"
                                        "insTex:evmPyramid:ev0Pyramid:frameProperties:srPlist:]";
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      uint64_t v64 = 0;
      v33 = 0;
      v66 = (int *)MEMORY[0x263F00E10];
      v53 = v36;
      goto LABEL_64;
    }
    uint64_t v40 = v100 + v31;
    v33 = v39;
    [v39 setBytes:&v94->var1.var2.var1 length:112 atIndex:0];
    v41 = [v35 getTextureAtLevel:v100 + v31];
    uint64_t v99 = [v41 width];

    v42 = [v35 getTextureAtLevel:v100 + v31];
    uint64_t v98 = [v42 height];

    unsigned int v43 = [v35 getTextureAtLevel:v100 + v31];
    [v33 setTexture:v43 atIndex:0];

    unsigned int v44 = [v15 getTextureAtLevel:v100 + v31];
    [v33 setTexture:v44 atIndex:2];

    if (v31)
    {
      [v35 getTextureAtLevel:v100 + v31 + 1];
      unsigned int v46 = v45 = v35;
      [v33 setTexture:v46 atIndex:1];

      v35 = v45;
      unsigned int v47 = [v15 getTextureAtLevel:v100 + v31 + 1];
      [v33 setTexture:v47 atIndex:3];
    }
    [v33 setTexture:v97 atIndex:4];
    if (v40)
    {
      int v48 = v35;
      [v92 setLabel:0];
      id v49 = [(FigMetalContext *)v101->_metal allocator];
      id v50 = (void *)[v49 newTextureWithDescriptor:v92];

      if (!v50)
      {
        v106.i32[0] = 0;
        type[0] = OS_LOG_TYPE_DEFAULT;
        v81 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        unsigned int v82 = v106.i32[0];
        if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT)) {
          unsigned int v83 = v82;
        }
        else {
          unsigned int v83 = v82 & 0xFFFFFFFE;
        }
        if (v83)
        {
          LODWORD(v108[0]) = 136315138;
          *(void *)((char *)v108 + 4) = "-[RawDFSyntheticReferenceStage _doDeepShadowRecovery:noiseDivisorOutputTex:lsc"
                                          "GainsTex:evmPyramid:ev0Pyramid:frameProperties:srPlist:]";
          _os_log_send_and_compose_impl();
        }
        self = v101;
        fig_log_call_emit_and_clean_up_after_send_and_compose();

        v66 = (int *)MEMORY[0x263F00E10];
        v53 = v36;
        int v65 = -73281;
        v35 = v48;
        uint64_t v64 = 0;
        goto LABEL_34;
      }
      [v33 setTexture:v50 atIndex:6];
      v51 = [v92 desc];
      objc_msgSend(v51, "setWidth:", 2 * objc_msgSend(v51, "width"));

      v52 = [v92 desc];
      objc_msgSend(v52, "setHeight:", 2 * objc_msgSend(v52, "height"));
    }
    else
    {
      [v33 setTexture:v90 atIndex:8];
      [v33 setTexture:v91 atIndex:7];
      id v50 = 0;
    }
    v53 = v36;
    if (v31)
    {
      if (!v105)
      {
        v75 = v50;
        v106.i32[0] = 0;
        type[0] = OS_LOG_TYPE_DEFAULT;
        v76 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        unsigned int v84 = v106.i32[0];
        if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT)) {
          unsigned int v85 = v84;
        }
        else {
          unsigned int v85 = v84 & 0xFFFFFFFE;
        }
        if (!v85) {
          goto LABEL_62;
        }
        LODWORD(v108[0]) = 136315138;
        *(void *)((char *)v108 + 4) = "-[RawDFSyntheticReferenceStage _doDeepShadowRecovery:noiseDivisorOutputTex:lscGa"
                                        "insTex:evmPyramid:ev0Pyramid:frameProperties:srPlist:]";
        goto LABEL_61;
      }
      [v33 setTexture:v105 atIndex:5];
    }
    uint64_t v54 = [v95[3] objectAtIndexedSubscript:v40];
    if (!v54)
    {
      v75 = v50;
      v106.i32[0] = 0;
      type[0] = OS_LOG_TYPE_DEFAULT;
      v76 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v77 = v106.i32[0];
      if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v78 = v77;
      }
      else {
        unsigned int v78 = v77 & 0xFFFFFFFE;
      }
      if (!v78) {
        goto LABEL_62;
      }
      LODWORD(v108[0]) = 136315138;
      *(void *)((char *)v108 + 4) = "-[RawDFSyntheticReferenceStage _doDeepShadowRecovery:noiseDivisorOutputTex:lscGain"
                                      "sTex:evmPyramid:ev0Pyramid:frameProperties:srPlist:]";
LABEL_61:
      _os_log_send_and_compose_impl();
LABEL_62:
      v35 = v96;
      self = v101;
      uint64_t v64 = v75;
      int v65 = -73281;
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      goto LABEL_32;
    }
    unsigned int v55 = (void **)v54;
    float var5 = v94[1].var1.var3.var5;
    memset(v108, 0, 44);
    *(float *)v108 = interpolate_with_gain(*(void **)(v54 + 8), var0) / var5;
    *((float *)v108 + 1) = interpolate_with_gain(v55[2], var0) / var5;
    DWORD2(v108[0]) = interpolate_with_gain(v55[5], var0);
    HIDWORD(v108[0]) = interpolate_with_gain(v55[6], var0);
    LODWORD(v108[1]) = interpolate_with_gain(v55[3], var0);
    DWORD1(v108[1]) = interpolate_with_gain(v55[4], var0);
    *((float *)&v108[1] + 2) = interpolate_with_gain(v55[7], var0) / var5;
    *((float *)&v108[1] + 3) = interpolate_with_gain(v55[8], var0) / var5;
    LODWORD(v108[2]) = interpolate_with_gain(v55[9], var0);
    DWORD1(v108[2]) = interpolate_with_gain(v55[10], var0);
    DWORD2(v108[2]) = interpolate_with_gain(v55[11], var0);
    [v33 setBytes:v108 length:44 atIndex:1];
    v57 = [(RawDFSyntheticReferenceShaders *)v101->_shaders getKernel:0 configFlags:(v31 == 0) | (2 * (v40 == 0))];

    if (!v57 || (unint64_t)[v57 maxTotalThreadsPerThreadgroup] <= 0x18F)
    {
      v79 = v50;
      *(_DWORD *)os_log_type_t type = 0;
      os_log_type_t v103 = OS_LOG_TYPE_DEFAULT;
      v80 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT);
      self = v101;
      v66 = (int *)MEMORY[0x263F00E10];
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      v53 = v57;
      v35 = v96;
      uint64_t v64 = v79;
LABEL_64:
      int v65 = -73281;
      goto LABEL_34;
    }
    [v33 setImageblockWidth:16 height:16];
    [v33 setComputePipelineState:v57];
    unint64_t v58 = (v99 + 15) & 0xFFFFFFFFFFFFFFF0;
    unint64_t v59 = (v98 + 15) & 0xFFFFFFFFFFFFFFF0;
    BOOL v60 = v58 >= v99 + 2;
    unint64_t v61 = v58 - (v99 + 2);
    if (!v60) {
      unint64_t v61 = 0;
    }
    BOOL v60 = v59 >= v98 + 2;
    unint64_t v62 = v59 - (v98 + 2);
    if (!v60) {
      unint64_t v62 = 0;
    }
    v109[0] = 20 * ((unint64_t)(v99 + 15) >> 4) - v61;
    v109[1] = 20 * ((unint64_t)(v98 + 15) >> 4) - v62;
    v109[2] = 1;
    int64x2_t v106 = v93;
    uint64_t v107 = 1;
    [v33 dispatchThreads:v109 threadsPerThreadgroup:&v106];
    [v33 endEncoding];
    [v32 commit];
    if (v105) {
      FigMetalDecRef();
    }
    id v63 = v105;
    id v105 = v50;

    --v31;
    self = v101;
    uint64_t v34 = v57;
    v35 = v96;
  }
  while (v100 + v31 + 1 > 0);
  if (v105)
  {
    v106.i32[0] = 0;
    type[0] = OS_LOG_TYPE_DEFAULT;
    v87 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v88 = v106.i32[0];
    if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT)) {
      unsigned int v89 = v88;
    }
    else {
      unsigned int v89 = v88 & 0xFFFFFFFE;
    }
    if (v89)
    {
      LODWORD(v108[0]) = 136315138;
      *(void *)((char *)v108 + 4) = "-[RawDFSyntheticReferenceStage _doDeepShadowRecovery:noiseDivisorOutputTex:lscGain"
                                      "sTex:evmPyramid:ev0Pyramid:frameProperties:srPlist:]";
      _os_log_send_and_compose_impl();
    }
    v35 = v96;
    int v65 = -73281;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    uint64_t v64 = 0;
  }
  else
  {
    uint64_t v64 = 0;
    int v65 = 0;
  }
  v53 = v57;
LABEL_32:
  v66 = (int *)MEMORY[0x263F00E10];
LABEL_34:
  int v67 = *v66;
  if (*v66 == 1)
  {
    kdebug_trace();
    int v67 = *v66;
  }
  if (v67)
  {
    v68 = [(FigMetalContext *)self->_metal commandQueue];
    v69 = [v68 commandBuffer];

    [v69 setLabel:@"KTRACE_END_MTL"];
    v102[0] = MEMORY[0x263EF8330];
    v102[1] = 3221225472;
    v102[2] = __134__RawDFSyntheticReferenceStage__doDeepShadowRecovery_noiseDivisorOutputTex_lscGainsTex_evmPyramid_ev0Pyramid_frameProperties_srPlist___block_invoke_31;
    v102[3] = &__block_descriptor_56_e28_v16__0___MTLCommandBuffer__8l;
    v102[5] = 0;
    v102[6] = 0;
    v102[4] = 2;
    [v69 addCompletedHandler:v102];
    [v69 commit];
  }
  return v65;
}

void __134__RawDFSyntheticReferenceStage__doDeepShadowRecovery_noiseDivisorOutputTex_lscGainsTex_evmPyramid_ev0Pyramid_frameProperties_srPlist___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 GPUEndTime];
  [v2 GPUStartTime];

  if (*MEMORY[0x263F00E10] == 1)
  {
    kdebug_trace();
  }
}

void __134__RawDFSyntheticReferenceStage__doDeepShadowRecovery_noiseDivisorOutputTex_lscGainsTex_evmPyramid_ev0Pyramid_frameProperties_srPlist___block_invoke_31(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 status] == 4)
  {
    [v2 GPUEndTime];
    [v2 GPUStartTime];
  }
  else
  {
    [v2 status];
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
}

- (int)genereteSyntheticReference:(id)a3 noiseDivisorOutputTex:(id)a4 mode:(int)a5 lscGainsTex:(id)a6 evmPyramid:(id)a7 ev0Pyramid:(id)a8 frameProperties:(id *)a9 tuning:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a10;
  v22 = v21;
  if (!v16 || !v17 || !v18 || !v19 || !v20 || !a9 || !v21)
  {
    v28 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
    int v24 = -73281;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_14;
  }
  if (a5 == 1)
  {
    int v23 = -[RawDFSyntheticReferenceStage _doDeepShadowRecovery:noiseDivisorOutputTex:lscGainsTex:evmPyramid:ev0Pyramid:frameProperties:srPlist:](self, "_doDeepShadowRecovery:noiseDivisorOutputTex:lscGainsTex:evmPyramid:ev0Pyramid:frameProperties:srPlist:", v16, v17, v18, v19, v20, v21);
  }
  else
  {
    if (a5)
    {
      id v25 = v21;
      v26 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
      int v24 = -73281;
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      v22 = v25;
      goto LABEL_14;
    }
    int v23 = [(RawDFSyntheticReferenceStage *)self _doHighlightRecovery:v16 noiseDivisorOutputTex:v17 evmPyramid:v19 ev0Pyramid:v20 frameProperties:a9 srPlist:v21];
  }
  int v24 = v23;
LABEL_14:

  return v24;
}

- (int)packSyntheticReference:(id)a3 toOutputTex:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!v6 || !v7)
  {
    int v20 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    int v15 = -73281;
    fig_log_call_emit_and_clean_up_after_send_and_compose();
LABEL_17:

    goto LABEL_8;
  }
  v9 = [(FigMetalContext *)self->_metal commandQueue];
  v10 = [v9 commandBuffer];

  if (!v10)
  {
    FigDebugAssert3();
    int v15 = FigSignalErrorAt();
    goto LABEL_8;
  }
  v11 = [v10 computeCommandEncoder];
  if (!v11)
  {
    int v20 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v12 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    int v15 = -73281;
    fig_log_call_emit_and_clean_up_after_send_and_compose();
LABEL_16:

    goto LABEL_17;
  }
  v12 = v11;
  [v11 setTexture:v6 atIndex:0];
  [v12 setTexture:v8 atIndex:1];
  uint64_t v13 = [(RawDFSyntheticReferenceShaders *)self->_shaders getKernel:1];
  if (!v13)
  {
    int v20 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    id v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    int v15 = -73281;
    fig_log_call_emit_and_clean_up_after_send_and_compose();
LABEL_15:

    goto LABEL_16;
  }
  id v14 = v13;
  [v12 setComputePipelineState:v13];
  if ((unint64_t)[v14 maxTotalThreadsPerThreadgroup] <= 0x3FF)
  {
    int v20 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    id v17 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    int v15 = -73281;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_15;
  }
  [v12 setImageblockWidth:32 height:32];
  v18[0] = [v8 width];
  v18[1] = [v8 height];
  v18[2] = 1;
  int64x2_t v21 = vdupq_n_s64(0x20uLL);
  uint64_t v22 = 1;
  [v12 dispatchThreads:v18 threadsPerThreadgroup:&v21];
  [v12 endEncoding];
  [v10 commit];

  int v15 = 0;
LABEL_8:

  return v15;
}

+ (int)fillFrameProperties:(id *)a3 withEvmProperties:(id)a4 withEv0Properties:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = v8;
  int v10 = -73281;
  if (a3)
  {
    if (v7)
    {
      if (v8)
      {
        v11 = [v8 meta];
        a3->float var0 = *(float *)[v11 exposureParams];

        v12 = [v7 meta];
        uint64_t v13 = [v12 exposureParams];
        id v14 = [v9 meta];
        a3->var1.var2.var1 = getRelativeBrightness(v13, [v14 exposureParams], 2);

        int v15 = [v9 meta];
        float v16 = *(float *)([v15 exposureParams] + 52);
        id v17 = [v7 meta];
        a3->var1.var2.var2 = v16 / *(float *)([v17 exposureParams] + 52);

        id v18 = [v9 meta];
        int v10 = +[RawDFCommon fillRawNoiseModelParameters:exposureParams:](RawDFCommon, "fillRawNoiseModelParameters:exposureParams:", &a3->var1.var2.var5, [v18 exposureParams]);

        if (!v10)
        {
          id v19 = [v7 meta];
          int v10 = +[RawDFCommon fillRawNoiseModelParameters:exposureParams:](RawDFCommon, "fillRawNoiseModelParameters:exposureParams:", &a3[1].var1.var2.var2, [v19 exposureParams]);
        }
      }
    }
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shaders, 0);

  objc_storeStrong((id *)&self->_metal, 0);
}

@end