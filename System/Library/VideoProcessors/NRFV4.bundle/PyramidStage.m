@interface PyramidStage
+ (int)prewarmShaders:(id)a3;
- (BOOL)useM2M;
- (BOOL)useM2MOnPyramid:(id)a3;
- (PyramidStage)initWithOptions:(id)a3 context:(id)a4;
- (int)runGPUWithFilters:(PyramidFilterParams *)a3 doShift:(BOOL)a4 pyramid:(id)a5;
- (int)runM2MWithFilters:(PyramidFilterParams *)a3 pyramid:(id)a4;
- (int)runWithFilters:(PyramidFilterParams *)a3 pyramid:(id)a4;
- (void)setColorSpace:(int)a3 withParams:(const ColorSpaceConversionParameters *)a4;
@end

@implementation PyramidStage

- (PyramidStage)initWithOptions:(id)a3 context:(id)a4
{
  id v6 = a4;
  v7 = loadDefaultsWritesWithPrefix();
  v38.receiver = self;
  v38.super_class = (Class)PyramidStage;
  v8 = [(PyramidStage *)&v38 init];
  if (!v8) {
    goto LABEL_28;
  }
  v9 = [v7 objectForKeyedSubscript:@"PyrGen.UseHW"];
  int v10 = [v9 isEqual:&unk_270E98488];

  if (v10)
  {
    char v11 = 0;
    v8[8] = 0;
  }
  else
  {
    v12 = [v7 objectForKeyedSubscript:@"PyrGen.UseHW"];
    v8[8] = [v12 intValue] == 1;

    char v11 = 1;
  }
  v8[360] = v11;
  v13 = [v7 objectForKeyedSubscript:@"PyrGen.DoSync"];
  if (v13)
  {
    v14 = [v7 objectForKeyedSubscript:@"PyrGen.DoSync"];
    v8[9] = [v14 BOOLValue];
  }
  else
  {
    v8[9] = 1;
  }

  v15 = [v7 objectForKeyedSubscript:@"PyrGen.CompensateGpuShift"];
  if (v15)
  {
    v16 = [v7 objectForKeyedSubscript:@"PyrGen.CompensateGpuShift"];
    v8[10] = [v16 BOOLValue];
  }
  else
  {
    v8[10] = 0;
  }

  v17 = [v7 objectForKeyedSubscript:@"PyrGen.SupportFP16"];
  if (v17)
  {
    v18 = [v7 objectForKeyedSubscript:@"PyrGen.SupportFP16"];
    v8[11] = [v18 BOOLValue];
  }
  else
  {
    v8[11] = 1;
  }

  objc_storeStrong((id *)v8 + 3, a4);
  id v19 = objc_alloc_init(MEMORY[0x263F2EE08]);
  v20 = (void *)*((void *)v8 + 2);
  *((void *)v8 + 2) = v19;

  if (*((void *)v8 + 2))
  {
    +[PyramidStage prewarmShaders:*((void *)v8 + 3)];
    uint64_t v21 = 0;
    *((_OWORD *)v8 + 32) = xmmword_26337FFE0;
    *((_OWORD *)v8 + 33) = xmmword_26337FFF0;
    *((void *)v8 + 68) = 0x3F80000000000000;
    v39[0] = xmmword_263380000;
    v39[1] = xmmword_263380010;
    v39[2] = xmmword_263380020;
    simd_float4 v40 = 0u;
    simd_float4 v41 = 0u;
    simd_float4 v42 = 0u;
    *((_DWORD *)v8 + 91) = 0;
    do
    {
      *(float32x4_t *)((char *)&v40 + v21 * 16) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_263380030, COERCE_FLOAT(v39[v21])), (float32x4_t)xmmword_263380040, *(float32x2_t *)&v39[v21], 1), (float32x4_t)xmmword_263380050, (float32x4_t)v39[v21], 2);
      ++v21;
    }
    while (v21 != 3);
    v43.columns[0] = v40;
    v43.columns[1] = v41;
    v43.columns[2] = v42;
    *((simd_float4 *)v8 + 26) = v40;
    *((_OWORD *)v8 + 27) = v43.columns[1];
    *((_OWORD *)v8 + 28) = v43.columns[2];
    v43.columns[3] = (simd_float4)xmmword_263380060;
    simd_float4x4 v44 = __invert_f4(v43);
    *((_OWORD *)v8 + 23) = v44.columns[0];
    *((_OWORD *)v8 + 24) = v44.columns[1];
    *((_OWORD *)v8 + 25) = v44.columns[2];
    *((float *)v8 + 138) = 1.0 / *((float *)v8 + 139);
    uint64_t v22 = MEMORY[0x263EF89A0];
    v44.columns[1] = *(simd_float4 *)(MEMORY[0x263EF89A0] + 16);
    *((_OWORD *)v8 + 29) = *MEMORY[0x263EF89A0];
    *((_OWORD *)v8 + 30) = v44.columns[1];
    *((_OWORD *)v8 + 31) = *(_OWORD *)(v22 + 32);
    *(void *)(v8 + 556) = 0x3F0000003F800000;
    *((_DWORD *)v8 + 141) = 65793;
    v23 = objc_opt_new();
    v24 = v23;
    if (v23)
    {
      [v23 setStorageMode:0];
      [v24 setHazardTrackingMode:2];
      [v24 setSize:655360];
      v25 = [*((id *)v8 + 3) device];
      uint64_t v26 = [v25 newHeapWithDescriptor:v24];
      v27 = (void *)*((void *)v8 + 4);
      *((void *)v8 + 4) = v26;

      if (*((void *)v8 + 4))
      {
        uint64_t v28 = 0;
        while (1)
        {
          uint64_t v29 = objc_msgSend(*((id *)v8 + 4), "newBufferWithLength:options:", 16, objc_msgSend(*((id *)v8 + 4), "resourceOptions"));
          v30 = &v8[v28];
          v31 = *(void **)&v8[v28 + 40];
          *(void *)&v8[v28 + 40] = v29;

          if (!*(void *)&v8[v28 + 40]) {
            break;
          }
          uint64_t v32 = objc_msgSend(*((id *)v8 + 4), "newBufferWithLength:options:", 16, objc_msgSend(*((id *)v8 + 4), "resourceOptions"));
          v33 = (void *)*((void *)v30 + 25);
          *((void *)v30 + 25) = v32;

          if (!*((void *)v30 + 25)) {
            break;
          }
          v28 += 8;
          if (v28 == 160)
          {
            int v34 = 0;
            goto LABEL_24;
          }
        }
      }
    }
    fig_log_get_emitter();
    FigDebugAssert3();
    int v34 = FigSignalErrorAt();
LABEL_24:

    if (v34) {
      goto LABEL_25;
    }
LABEL_28:
    v35 = v8;
    goto LABEL_29;
  }
  fig_log_get_emitter();
  FigDebugAssert3();
  if (!FigSignalErrorAt()) {
    goto LABEL_28;
  }
LABEL_25:
  v35 = 0;
LABEL_29:
  v36 = v35;

  return v36;
}

+ (int)prewarmShaders:(id)a3
{
  id v3 = a3;
  char v4 = 0;
  v5 = 0;
  char v6 = 1;
LABEL_2:
  char v7 = 0;
  char v8 = v6;
  char v9 = 1;
  while (1)
  {
    int v10 = v5;
    char v11 = v9;
    v5 = +[PyramidStageShared compileShader:v3 lumaWrite:v4 & 1 chromaWrite:v7 & 1];

    if (!v5) {
      break;
    }
    char v9 = 0;
    char v7 = 1;
    if ((v11 & 1) == 0)
    {
      char v6 = 0;
      char v4 = 1;
      if (v8) {
        goto LABEL_2;
      }
      if (!+[PyramidStageShared isRec709DownsampleSupported])
      {
        v13 = v5;
        goto LABEL_13;
      }
      uint64_t v12 = 0;
      while (1)
      {
        v13 = +[PyramidStageShared compileShader:v3 kernelType:v12];

        if (!v13) {
          goto LABEL_12;
        }
        uint64_t v12 = (v12 + 1);
        v5 = v13;
        if (v12 == 12) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_12:
  fig_log_get_emitter();
  FigDebugAssert3();
  FigSignalErrorAt();
  v13 = 0;
LABEL_13:

  return 0;
}

- (BOOL)useM2MOnPyramid:(id)a3
{
  char v4 = (int *)a3;
  v5 = v4;
  if (self->_forceHW)
  {
    BOOL use_m2m = self->_conf.use_m2m;
  }
  else if (v4[2] < 1)
  {
    BOOL use_m2m = 1;
  }
  else
  {
    uint64_t v8 = 0;
    char v9 = (char *)(v4 + 166);
    BOOL use_m2m = 1;
    do
    {
      BOOL use_m2m = use_m2m
             && !v9[v8]
             && (int v10 = (CVPixelBufferRef *)&v9[8 * v8 - 648], *v10)
             && CVPixelBufferGetPixelFormatType(*v10) == 875704422
             && (CVPixelBufferGetWidthOfPlane(*v10, 0) & 1) == 0
             && (CVPixelBufferGetHeightOfPlane(*v10, 0) & 1) == 0;
      ++v8;
    }
    while (v8 < v5[2]);
  }

  return use_m2m;
}

- (int)runM2MWithFilters:(PyramidFilterParams *)a3 pyramid:(id)a4
{
  char v6 = (int *)a4;
  uint64_t v7 = 0;
  p_chroma_param = &a3->chroma_param;
  char v9 = (CVPixelBufferRef *)(v6 + 6);
  do
  {
    if (v7 >= v6[2] - 1)
    {
      int v16 = 0;
      goto LABEL_16;
    }
    if (!*(v9 - 1) || !*v9 || CVPixelBufferGetPixelFormatType(*v9) != 875704422) {
      break;
    }
    int v12 = *((_DWORD *)p_chroma_param - 2);
    uint64_t v13 = v12 == 2 ? 2 : v12 == 1;
    *(float *)&double v10 = *(p_chroma_param - 1);
    *(float *)&double v11 = *p_chroma_param;
    if ([(FigM2MController *)self->_m2mController setCustomFilter:v13 alignment:self->_conf.compensate_gpu_shift src:*(v9 - 1) dst:*v9 luma_param:v10 chroma_param:v11])break; {
    BOOL v14 = v7 == v6[2] - 2 && (unint64_t)self->_conf.do_sync_at_end;
    }
    int v15 = [(FigM2MController *)self->_m2mController downsample:*(v9 - 1) dst:*v9 sync_m2m:v14];
    p_chroma_param += 3;
    ++v9;
    ++v7;
  }
  while (!v15);
  fig_log_get_emitter();
  FigDebugAssert3();
  int v16 = FigSignalErrorAt();
LABEL_16:

  return v16;
}

- (int)runGPUWithFilters:(PyramidFilterParams *)a3 doShift:(BOOL)a4 pyramid:(id)a5
{
  BOOL v5 = a4;
  uint64_t v8 = (int *)a5;
  if (v8[2] >= 2)
  {
    uint64_t v9 = 0;
    int32x2_t v10 = 0;
    if (v5) {
      *(float *)v10.i32 = 1.0;
    }
    int32x2_t v11 = vdup_lane_s32(v10, 0);
    p_unsigned int chroma_param = &a3->chroma_param;
    while (*((_DWORD *)p_chroma_param - 2) == 1)
    {
      uint64_t v13 = (id *)(&self->super.isa + v9);
      uint64_t v14 = [v13[5] contents];
      *(_DWORD *)uint64_t v14 = (int)*(p_chroma_param - 1);
      *(int32x2_t *)(v14 + 8) = v11;
      uint64_t v15 = [v13[25] contents];
      *(_DWORD *)uint64_t v15 = (int)*p_chroma_param;
      *(int32x2_t *)(v15 + 8) = v11;
      ++v9;
      p_chroma_param += 3;
      if (v9 >= v8[2] - 1) {
        goto LABEL_7;
      }
    }
LABEL_81:
    fig_log_get_emitter();
    FigDebugAssert3();
    int v88 = FigSignalErrorAt();
    goto LABEL_80;
  }
LABEL_7:
  uint64_t v16 = [*((id *)v8 + 42) pixelFormat];
  uint64_t v17 = v16;
  BOOL v18 = v16 == 576 || v16 == 588;
  int band0ColorSpace = self->_band0ColorSpace;
  BOOL v20 = v18 || band0ColorSpace == 2;
  uint64_t v21 = v20;
  uint64_t v106 = v21;
  uint64_t v22 = H13FastPostDemosaicProcShaders;
  v100 = v8;
  v103 = self;
  if (v20)
  {
    v23 = [(FigMetalContext *)self->_metal commandQueue];
    uint64_t v24 = [v23 commandBuffer];

    if (!v24) {
      goto LABEL_81;
    }
    v104 = (void *)v24;
    uint64_t v92 = v17;
    if (self->_anon_1a8[143] && (v25 = (void *)*((void *)v8 + 82)) != 0)
    {
      id v98 = v25;
      uint64_t v26 = 0;
      int v27 = 2;
      int v28 = 8;
    }
    else
    {
      id v98 = *((id *)v8 + 42);
      uint64_t v26 = (void *)*((void *)v8 + 62);
      int v27 = -1;
      int v28 = 5;
    }
    id v29 = v26;
    id v30 = *((id *)v8 + 43);
    id v101 = *((id *)v8 + 63);
    unsigned int luma_param = a3->luma_param;
    unsigned int chroma_param = a3->chroma_param;
    if (luma_param == 5) {
      int v33 = 2;
    }
    else {
      int v33 = 1;
    }
    if (luma_param == 7) {
      int v34 = 3;
    }
    else {
      int v34 = v33;
    }
    if (chroma_param == 5) {
      int v35 = 2;
    }
    else {
      int v35 = 1;
    }
    if (chroma_param == 7) {
      int v36 = 3;
    }
    else {
      int v36 = v35;
    }
    v37 = [v104 computeCommandEncoder];
    v94 = v30;
    v96 = v29;
    if (v37)
    {
      long long v38 = *(_OWORD *)&v103->_anon_1a8[104];
      long long v39 = *(_OWORD *)&v103->_anon_1a8[120];
      long long v40 = *(_OWORD *)&v103->_anon_1a8[72];
      long long v121 = *(_OWORD *)&v103->_anon_1a8[88];
      long long v122 = v38;
      long long v41 = *(_OWORD *)&v103->_anon_1a8[136];
      long long v123 = v39;
      long long v124 = v41;
      long long v42 = *(_OWORD *)&v103->_anon_1a8[40];
      long long v43 = *(_OWORD *)&v103->_anon_1a8[56];
      long long v44 = *(_OWORD *)&v103->_anon_1a8[8];
      long long v117 = *(_OWORD *)&v103->_anon_1a8[24];
      long long v118 = v42;
      long long v119 = v43;
      long long v120 = v40;
      long long v45 = *(_OWORD *)&v103->_colorSpaceConversionParameters.transferFunctionInv.nonLinearBias;
      long long v46 = *(_OWORD *)&v103->_colorSpaceConversionParameters.chromaBias;
      long long v47 = *(_OWORD *)&v103->_colorSpaceConversionParameters.transferFunctionFwd.linearScale;
      long long v113 = *(_OWORD *)&v103->_colorSpaceConversionParameters.transferFunctionFwd.nonLinearPower;
      long long v114 = v45;
      long long v115 = v46;
      long long v116 = v44;
      uint64_t v125 = 0;
      uint64_t v126 = 0;
      long long v112 = v47;
      LOBYTE(v125) = v103->_conf.compensate_gpu_shift;
      v48 = +[PyramidStageShared sharedInstance];
      uint64_t v49 = [v48 getRec709DownsamplePipelineState:v103->_metal kernelType:(v27 + v34)];

      v50 = v98;
      [v37 setTexture:v98 atIndex:0];
      [v37 setTexture:v29 atIndex:1];
      [v37 setTexture:v30 atIndex:2];
      [v37 setBytes:&v112 length:224 atIndex:0];
      v90 = (void *)v49;
      [v37 setComputePipelineState:v49];
      if ([v30 iosurface])
      {
        fig_log_get_emitter();
        uint64_t v85 = v87;
        LODWORD(v83) = 0;
        FigDebugAssert3();
        int v88 = -12782;
        int v57 = 7;
        self = v103;
        uint64_t v22 = H13FastPostDemosaicProcShaders;
        v54 = v104;
      }
      else
      {
        id v51 = v29;
        [v37 setImageblockWidth:16 height:16];
        v111[0] = ([v30 width] + 15) >> 4;
        v111[1] = ([v30 height] + 15) >> 4;
        v50 = v98;
        v111[2] = 1;
        v110[0] = ((v34 & 1) + v34) | 0x10u;
        v110[1] = v110[0];
        v110[2] = 1;
        [v37 dispatchThreadgroups:v111 threadsPerThreadgroup:v110];
        v52 = +[PyramidStageShared sharedInstance];
        v53 = [v52 getRec709DownsamplePipelineState:v103->_metal kernelType:(v28 + v36)];

        [v37 setTexture:v98 atIndex:0];
        [v37 setTexture:v51 atIndex:1];
        [v37 setTexture:v101 atIndex:2];
        [v37 setBytes:&v112 length:224 atIndex:0];
        [v37 setComputePipelineState:v53];
        uint64_t v22 = H13FastPostDemosaicProcShaders;
        if ([v101 iosurface])
        {
          fig_log_get_emitter();
          uint64_t v85 = v87;
          LODWORD(v83) = 0;
          FigDebugAssert3();
          int v88 = -12782;
          int v57 = 7;
          v54 = v104;
        }
        else
        {
          [v37 setImageblockWidth:16 height:16];
          v109[0] = ([v101 width] + 15) >> 4;
          v109[1] = ([v101 height] + 15) >> 4;
          v109[2] = 1;
          v108[0] = v36 | 0x10u;
          v108[1] = v108[0];
          v108[2] = 1;
          [v37 dispatchThreadgroups:v109 threadsPerThreadgroup:v108];
          [v37 endEncoding];
          v54 = v104;
          if (*MEMORY[0x263F00E10])
          {
            v55 = [v104 commandQueue];
            v56 = [v55 commandBuffer];

            [v56 setLabel:@"KTRACE_MTLCMDBUF"];
            [v56 addCompletedHandler:&__block_literal_global_4];
            [v56 commit];
            [v104 addCompletedHandler:&__block_literal_global_192];

            uint64_t v22 = H13FastPostDemosaicProcShaders;
          }
          [v104 commit];
          int v57 = 0;
          int v88 = 0;
        }

        self = v103;
      }

      uint64_t v8 = v100;
    }
    else
    {
      fig_log_get_emitter();
      uint64_t v85 = v87;
      LODWORD(v83) = 0;
      FigDebugAssert3();
      int v88 = FigSignalErrorAt();
      int v57 = 7;
      self = v103;
      v54 = v104;
      uint64_t v22 = H13FastPostDemosaicProcShaders;
      v50 = v98;
    }

    uint64_t v17 = v92;
    if (v57) {
      goto LABEL_80;
    }
  }
  else
  {
    int v88 = 0;
  }
  v58 = [(FigMetalContext *)self->_metal commandQueue];
  uint64_t v59 = [v58 commandBuffer];

  v102 = (void *)v59;
  if (!v59)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v88 = FigSignalErrorAt();
    goto LABEL_79;
  }
  v60 = self;
  uint64_t v61 = 0;
  LODWORD(v62) = v17 == 588;
  v89 = (char *)(v8 + 124);
  if (v62 <= (v17 == 576)) {
    LODWORD(v62) = v17 == 576;
  }
  if (v62 <= (band0ColorSpace == 2)) {
    uint64_t v62 = band0ColorSpace == 2;
  }
  else {
    uint64_t v62 = v62;
  }
  uint64_t v93 = (uint64_t)&v60->_uniforms_Y[v106 + 19];
  uint64_t v97 = v62;
  uint64_t v99 = v106 - 1;
  uint64_t v95 = (uint64_t)&v8[2 * v106 + 124];
  v63 = (void **)&v8[2 * v62 + 86];
  uint64_t v91 = (uint64_t)&v60->_uniforms_Y[v62];
  while (1)
  {
    uint64_t v64 = v99 + v61;
    uint64_t v65 = v8[2] - 1;
    if (v99 + v61 >= v65) {
      break;
    }
    uint64_t v66 = v97 + v61;
    if (v97 + v61 >= v65) {
      v67 = 0;
    }
    else {
      v67 = *v63;
    }
    id v68 = v67;
    if (v64 < v106) {
      v69 = 0;
    }
    else {
      v69 = *(void **)(v95 + 8 * v61);
    }
    id v70 = v69;
    v71 = [&v22[15] sharedInstance];
    v105 = [v71 getPipeline:v103->_metal lumaWrite:v66 < v65 chromaWrite:v64 >= v106];

    if (v66 >= v65)
    {
      unint64_t v72 = (unint64_t)([v70 width] + 1) >> 1;
      v73 = v70;
    }
    else
    {
      unint64_t v72 = [v68 width];
      v73 = v68;
    }
    uint64_t v74 = objc_msgSend(v73, "height", v84, v86);
    v75 = [v102 computeCommandEncoder];
    v76 = v75;
    if (v75)
    {
      [v75 setComputePipelineState:v105];
      [v76 setImageblockWidth:32 height:32];
      BOOL v77 = v66 < v65;
      uint64_t v8 = v100;
      if (v77)
      {
        uint64_t v78 = (uint64_t)*(v63 - 1);
        if (!v78 || ([v76 setTexture:v78 atIndex:0], !v68))
        {
LABEL_75:
          fig_log_get_emitter();
          uint64_t v86 = v87;
          LODWORD(v84) = 0;
          FigDebugAssert3();
          int v88 = FigSignalErrorAt();
          char v79 = 0;
          goto LABEL_72;
        }
        [v76 setTexture:v68 atIndex:2];
      }
      if (v64 >= v106)
      {
        if (!*(void *)(v95 + 8 * v61)) {
          goto LABEL_75;
        }
        [v76 setTexture:*(void *)&v89[8 * v64] atIndex:1];
        if (!v70) {
          goto LABEL_75;
        }
        [v76 setTexture:v70 atIndex:3];
      }
      [v76 setBuffer:*(void *)(v91 + 8 * v61) offset:0 atIndex:0];
      char v79 = 1;
      [v76 setBuffer:*(void *)(v93 + 8 * v61) offset:0 atIndex:1];
      v107[0] = v72;
      v107[1] = v74;
      v107[2] = 1;
      long long v112 = xmmword_263380280;
      *(void *)&long long v113 = 1;
      [v76 dispatchThreads:v107 threadsPerThreadgroup:&v112];
      [v76 endEncoding];
    }
    else
    {
      fig_log_get_emitter();
      uint64_t v86 = v87;
      LODWORD(v84) = 0;
      FigDebugAssert3();
      int v88 = FigSignalErrorAt();
      char v79 = 0;
      uint64_t v8 = v100;
    }
LABEL_72:

    ++v61;
    ++v63;
    uint64_t v22 = H13FastPostDemosaicProcShaders;
    if ((v79 & 1) == 0) {
      goto LABEL_79;
    }
  }
  if (*MEMORY[0x263F00E10])
  {
    v80 = [v102 commandQueue];
    v81 = [v80 commandBuffer];

    [v81 setLabel:@"KTRACE_MTLCMDBUF"];
    [v81 addCompletedHandler:&__block_literal_global_199];
    [v81 commit];
    [v102 addCompletedHandler:&__block_literal_global_201];
  }
  objc_msgSend(v102, "commit", v84, v86);
LABEL_79:

LABEL_80:
  return v88;
}

uint64_t __50__PyramidStage_runGPUWithFilters_doShift_pyramid___block_invoke()
{
  if (*MEMORY[0x263F00E10] == 1) {
    return kdebug_trace();
  }
  return result;
}

void __50__PyramidStage_runGPUWithFilters_doShift_pyramid___block_invoke_2(uint64_t a1, void *a2)
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

uint64_t __50__PyramidStage_runGPUWithFilters_doShift_pyramid___block_invoke_3()
{
  if (*MEMORY[0x263F00E10] == 1) {
    return kdebug_trace();
  }
  return result;
}

void __50__PyramidStage_runGPUWithFilters_doShift_pyramid___block_invoke_4(uint64_t a1, void *a2)
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

- (int)runWithFilters:(PyramidFilterParams *)a3 pyramid:(id)a4
{
  char v6 = (int *)a4;
  if (v6[2] >= 2)
  {
    uint64_t v7 = 0;
    do
    {
      uint64_t v8 = &v6[2 * v7++];
      CVBufferPropagateAttachments(*((CVBufferRef *)v8 + 2), *((CVBufferRef *)v8 + 3));
    }
    while (v7 < v6[2] - 1);
  }
  if ([(PyramidStage *)self useM2MOnPyramid:v6])
  {
    if ([(PyramidStage *)self runM2MWithFilters:a3 pyramid:v6]) {
      goto LABEL_10;
    }
  }
  else if ([(PyramidStage *)self runGPUWithFilters:a3 doShift:self->_conf.compensate_gpu_shift pyramid:v6])
  {
LABEL_10:
    fig_log_get_emitter();
    FigDebugAssert3();
    int v9 = FigSignalErrorAt();
    goto LABEL_9;
  }
  int v9 = 0;
LABEL_9:

  return v9;
}

- (void)setColorSpace:(int)a3 withParams:(const ColorSpaceConversionParameters *)a4
{
  self->_int band0ColorSpace = a3;
  if (a4)
  {
    *(_OWORD *)&self->_colorSpaceConversionParameters.transferFunctionFwd.linearScale = *(_OWORD *)&a4->transferFunctionFwd.linearScale;
    long long v4 = *(_OWORD *)&a4->transferFunctionFwd.nonLinearPower;
    long long v5 = *(_OWORD *)&a4->transferFunctionInv.nonLinearBias;
    long long v6 = *(_OWORD *)&a4[1].transferFunctionFwd.nonLinearScale;
    *(_OWORD *)&self->_colorSpaceConversionParameters.chromaBias = *(_OWORD *)&a4->chromaBias;
    *(_OWORD *)&self->_anon_1a8[8] = v6;
    *(_OWORD *)&self->_colorSpaceConversionParameters.transferFunctionFwd.nonLinearPower = v4;
    *(_OWORD *)&self->_colorSpaceConversionParameters.transferFunctionInv.nonLinearBias = v5;
    long long v7 = *(_OWORD *)&a4[1].transferFunctionInv.linearThreshold;
    long long v8 = *(_OWORD *)&a4[1].finalScaleFwd;
    long long v9 = *(_OWORD *)&a4[2].transferFunctionFwd.nonLinearPower;
    *(_OWORD *)&self->_anon_1a8[56] = *(_OWORD *)&a4[2].transferFunctionFwd.linearScale;
    *(_OWORD *)&self->_anon_1a8[72] = v9;
    *(_OWORD *)&self->_anon_1a8[24] = v7;
    *(_OWORD *)&self->_anon_1a8[40] = v8;
    long long v10 = *(_OWORD *)&a4[2].transferFunctionInv.nonLinearBias;
    long long v11 = *(_OWORD *)&a4[2].chromaBias;
    long long v12 = *(_OWORD *)&a4[3].transferFunctionInv.linearThreshold;
    *(_OWORD *)&self->_anon_1a8[120] = *(_OWORD *)&a4[3].transferFunctionFwd.nonLinearScale;
    *(_OWORD *)&self->_anon_1a8[136] = v12;
    *(_OWORD *)&self->_anon_1a8[88] = v10;
    *(_OWORD *)&self->_anon_1a8[104] = v11;
  }
}

- (BOOL)useM2M
{
  return self->_useM2M;
}

- (void).cxx_destruct
{
  for (uint64_t i = 352; i != 192; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
    i -= 8;
  }
  while (i != 32);
  objc_storeStrong((id *)&self->_uniformsHeap, 0);
  objc_storeStrong((id *)&self->_metal, 0);

  objc_storeStrong((id *)&self->_m2mController, 0);
}

@end