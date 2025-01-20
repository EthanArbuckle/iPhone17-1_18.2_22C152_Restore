@interface RawNightModeMultiFrameOutlierPixelCorrection
+ (int)prewarmShaders:(id)a3;
- (RawNightModeMultiFrameOutlierPixelCorrection)initWithMetalContext:(id)a3;
- (RawNightModeMultiFrameOutlierPixelCorrectionTuningParams)tuningParams;
- (id)createShaderWithOptions:(RawNightModeMultiFrameOutlierPixelCorrectionOptions *)a3;
- (int)processFrames:(id)a3 correctFirstFrame:(BOOL)a4;
- (int)processReferenceFrame:(id)a3 nonRefFrames:(id)a4 correctRefFrame:(BOOL)a5;
- (void)setTuningParams:(id)a3;
@end

@implementation RawNightModeMultiFrameOutlierPixelCorrection

- (RawNightModeMultiFrameOutlierPixelCorrection)initWithMetalContext:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)RawNightModeMultiFrameOutlierPixelCorrection;
  v6 = [(RawNightModeMultiFrameOutlierPixelCorrection *)&v23 init];
  v7 = v6;
  if (!v6 || !v5)
  {
    int v22 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v19 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

LABEL_11:
    v16 = 0;
    goto LABEL_7;
  }
  objc_storeStrong((id *)&v6->_metal, a3);
  uint64_t v20 = 0x100000001;
  uint64_t v8 = [(RawNightModeMultiFrameOutlierPixelCorrection *)v7 createShaderWithOptions:&v20];
  multiFrameOutlierPixelCorrectionSkip11PipelineState = v7->_multiFrameOutlierPixelCorrectionSkip11PipelineState;
  v7->_multiFrameOutlierPixelCorrectionSkip11PipelineState = (MTLComputePipelineState *)v8;

  if (!v7->_multiFrameOutlierPixelCorrectionSkip11PipelineState) {
    goto LABEL_10;
  }
  uint64_t v20 = 0x200000001;
  uint64_t v10 = [(RawNightModeMultiFrameOutlierPixelCorrection *)v7 createShaderWithOptions:&v20];
  multiFrameOutlierPixelCorrectionSkip12PipelineState = v7->_multiFrameOutlierPixelCorrectionSkip12PipelineState;
  v7->_multiFrameOutlierPixelCorrectionSkip12PipelineState = (MTLComputePipelineState *)v10;

  if (!v7->_multiFrameOutlierPixelCorrectionSkip12PipelineState) {
    goto LABEL_10;
  }
  uint64_t v20 = 0x100000002;
  uint64_t v12 = [(RawNightModeMultiFrameOutlierPixelCorrection *)v7 createShaderWithOptions:&v20];
  multiFrameOutlierPixelCorrectionSkip21PipelineState = v7->_multiFrameOutlierPixelCorrectionSkip21PipelineState;
  v7->_multiFrameOutlierPixelCorrectionSkip21PipelineState = (MTLComputePipelineState *)v12;

  if (!v7->_multiFrameOutlierPixelCorrectionSkip21PipelineState
    || (uint64_t v20 = 0x200000002,
        [(RawNightModeMultiFrameOutlierPixelCorrection *)v7 createShaderWithOptions:&v20],
        uint64_t v14 = objc_claimAutoreleasedReturnValue(),
        multiFrameOutlierPixelCorrectionSkip22PipelineState = v7->_multiFrameOutlierPixelCorrectionSkip22PipelineState,
        v7->_multiFrameOutlierPixelCorrectionSkip22PipelineState = (MTLComputePipelineState *)v14,
        multiFrameOutlierPixelCorrectionSkip22PipelineState,
        v16 = v7,
        !v7->_multiFrameOutlierPixelCorrectionSkip22PipelineState))
  {
LABEL_10:
    FigDebugAssert3();
    goto LABEL_11;
  }
LABEL_7:
  v17 = v16;

  return v17;
}

- (id)createShaderWithOptions:(RawNightModeMultiFrameOutlierPixelCorrectionOptions *)a3
{
  id v5 = objc_opt_new();
  [v5 setConstantValue:a3 type:33 atIndex:0];
  [v5 setConstantValue:&a3->var1 type:33 atIndex:1];
  v6 = [(FigMetalContext *)self->_metal computePipelineStateFor:@"multiFrameOutlierPixelCorrection" constants:v5];

  return v6;
}

+ (int)prewarmShaders:(id)a3
{
  id v3 = a3;
  v4 = [[RawNightModeMultiFrameOutlierPixelCorrection alloc] initWithMetalContext:v3];

  if (v4) {
    int v5 = 0;
  }
  else {
    int v5 = -12786;
  }

  return v5;
}

- (int)processFrames:(id)a3 correctFirstFrame:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v109 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v107 = 0;
  long long v105 = 0u;
  long long v106 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  long long v92 = 0u;
  unsigned int v82 = [v6 count];
  if (v82 - 5 <= 0xFFFFFFFB)
  {
    FigDebugAssert3();
    v62 = 0;
    v63 = 0;
    v41 = 0;
    v29 = 0;
    int v73 = -28601;
    goto LABEL_34;
  }
  if (!self->_tuningParams)
  {
    FigDebugAssert3();
    v62 = 0;
    v63 = 0;
    v41 = 0;
    v29 = 0;
    int v73 = -28679;
    goto LABEL_34;
  }
  v86 = v6;
  uint64_t v7 = 0;
  do
  {
    uint64_t v8 = [v6 objectAtIndexedSubscript:v7];

    if (!v8)
    {
      FigDebugAssert3();
      v62 = 0;
      v63 = 0;
      v41 = 0;
      v29 = 0;
      int v73 = -28601;
LABEL_36:
      id v6 = v86;
      goto LABEL_34;
    }
    ++v7;
  }
  while (v82 != v7);
  if (dword_26B430EA8)
  {
    int v91 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  BOOL v80 = v4;
  uint64_t v10 = objc_msgSend(v6, "objectAtIndexedSubscript:", 0, v75, v76);
  v11 = -[RawNightModeInputFrame textures]((uint64_t)v10);
  uint64_t v12 = [v11 objectAtIndexedSubscript:0];
  uint64_t v13 = [v12 width];

  uint64_t v14 = -[RawNightModeInputFrame textures]((uint64_t)v10);
  v15 = [v14 objectAtIndexedSubscript:0];
  unsigned int v16 = [v15 height];

  v17 = -[RawNightModeInputFrame textures]((uint64_t)v10);
  v18 = [v17 objectAtIndexedSubscript:0];
  uint64_t v19 = [v18 pixelFormat];

  uint64_t v20 = [(FigMetalContext *)self->_metal allocator];
  v21 = (void *)[v20 newTextureDescriptor];

  if (!v21)
  {
    FigDebugAssert3();
    int v73 = FigSignalErrorAt();

LABEL_45:
    v62 = 0;
    v63 = 0;
    v41 = 0;
    v29 = 0;
    goto LABEL_34;
  }
  int v22 = [v21 desc];
  [v22 setTextureType:2];

  objc_super v23 = [v21 desc];
  [v23 setWidth:v13];

  unsigned int v77 = v16;
  uint64_t v24 = [v21 desc];
  [v24 setHeight:v16];

  v25 = [v21 desc];
  [v25 setUsage:7];

  v26 = [v21 desc];
  [v26 setPixelFormat:v19];

  [v21 setLabel:0];
  v27 = [(FigMetalContext *)self->_metal allocator];
  v28 = (void *)[v27 newTextureWithDescriptor:v21];
  id v107 = v28;

  if (!v28)
  {
    FigDebugAssert3();
    int v73 = FigSignalErrorAt();

    goto LABEL_45;
  }
  v29 = -[RawNightModeInputFrame properties]((uint64_t)v10);

  if (!v29)
  {
    FigDebugAssert3();
    int v73 = FigSignalErrorAt();

    v62 = 0;
LABEL_50:
    v63 = 0;
    v41 = 0;
    goto LABEL_34;
  }
  v81 = v28;
  v79 = v21;
  v83 = v10;
  v30 = -[RawNightModeInputFrame properties]((uint64_t)v10);
  v31 = [v30 meta];
  int v32 = *(_DWORD *)([v31 exposureParams] + 108);

  LODWORD(v33) = v32;
  [(RawNightModeMultiFrameOutlierPixelCorrectionTuningParams *)self->_tuningParams getGammaSingleFrame:v33];
  DWORD2(v92) = v34;
  v78 = self;
  LODWORD(v35) = v32;
  [(RawNightModeMultiFrameOutlierPixelCorrectionTuningParams *)self->_tuningParams getGammaMultiFrame:v35];
  uint64_t v36 = 0;
  *(void *)&long long v93 = __PAIR64__(v82, v37);
  v38 = v6;
  uint64_t v39 = 32;
  do
  {
    v40 = [v38 objectAtIndexedSubscript:v36];
    v41 = -[RawNightModeInputFrame properties]((uint64_t)v40);

    if (!v41
      || ([v38 objectAtIndexedSubscript:v36],
          v42 = objc_claimAutoreleasedReturnValue(),
          -[RawNightModeInputFrame textures]((uint64_t)v42),
          v41 = objc_claimAutoreleasedReturnValue(),
          v41,
          v42,
          !v41))
    {
      FigDebugAssert3();
      int v73 = FigSignalErrorAt();

      v62 = 0;
      v63 = 0;
      v29 = 0;
      id v6 = v38;
      goto LABEL_34;
    }
    v43 = (long long *)((char *)&v92 + v39);
    v44 = [v38 objectAtIndexedSubscript:v36];
    v45 = -[RawNightModeInputFrame properties]((uint64_t)v44);
    v46 = (_OWORD *)[v45 regHomography];
    long long v48 = v46[1];
    long long v47 = v46[2];
    _OWORD *v43 = *v46;
    v43[1] = v48;
    v43[2] = v47;

    v84 = -[RawNightModeInputFrame properties]((uint64_t)v83);
    v49 = [v84 meta];
    uint64_t v50 = [v49 exposureParams];
    v51 = [v38 objectAtIndexedSubscript:v36];
    -[RawNightModeInputFrame properties]((uint64_t)v51);
    v53 = uint64_t v52 = v13;
    v54 = [v53 meta];
    uint64_t v55 = [v54 exposureParams];
    v56 = -[RawNightModeInputFrame properties]((uint64_t)v83);
    *((float *)&v106 + v36) = getRelativeBrightnessForProperties(v50, v55, v56);

    uint64_t v13 = v52;
    v38 = v86;

    ++v36;
    v39 += 48;
  }
  while (v82 != v36);
  unsigned int v57 = [(RawNightModeMultiFrameOutlierPixelCorrectionTuningParams *)v78->_tuningParams skipSingleFrame];
  unsigned int v58 = [(RawNightModeMultiFrameOutlierPixelCorrectionTuningParams *)v78->_tuningParams skipMultiFrame];
  uint64_t v59 = 24;
  if (v58 == 1) {
    uint64_t v59 = 16;
  }
  uint64_t v60 = 40;
  if (v58 == 1) {
    uint64_t v60 = 32;
  }
  if (v57 != 1) {
    uint64_t v59 = v60;
  }
  id v61 = *(id *)((char *)&v78->super.isa + v59);
  v62 = v61;
  if (!v61)
  {
    FigDebugAssert3();

    v63 = 0;
    v41 = 0;
    v29 = 0;
    int v73 = -28676;
    goto LABEL_36;
  }
  id v6 = v86;
  if ((unint64_t)[v61 maxTotalThreadsPerThreadgroup] <= 0xFF)
  {
    FigDebugAssert3();

    v63 = 0;
    v41 = 0;
    v29 = 0;
    int v73 = -28676;
    goto LABEL_34;
  }
  v29 = [(FigMetalContext *)v78->_metal commandBuffer];
  if (!v29)
  {
    FigDebugAssert3();
    int v73 = FigSignalErrorAt();

    goto LABEL_50;
  }
  v108[0] = !v80;
  if (!v80 >= v82)
  {
    v69 = 0;
    v41 = 0;
LABEL_33:
    [(FigMetalContext *)v78->_metal commit];

    int v73 = 0;
    v63 = v69;
  }
  else
  {
    v41 = 0;
    v63 = 0;
    uint64_t v85 = (v13 + 15) >> 4;
    while (1)
    {
      v64 = v41;
      v41 = [v29 computeCommandEncoder];

      if (!v41)
      {
        FigDebugAssert3();
        id v6 = v86;
        goto LABEL_40;
      }
      [v41 setComputePipelineState:v62];
      [v41 setImageblockWidth:16 height:16];
      uint64_t v65 = 0;
      id v6 = v86;
      do
      {
        v66 = [v86 objectAtIndexedSubscript:v65];
        v67 = -[RawNightModeInputFrame textures]((uint64_t)v66);
        v68 = [v67 objectAtIndexedSubscript:0];
        [v41 setTexture:v68 atIndex:++v65];
      }
      while (v82 != v65);
      [v41 setBytes:&v92 length:240 atIndex:0];
      [v41 setTexture:v81 atIndex:0];
      [v41 setBytes:v108 length:4 atIndex:1];
      v89[0] = v85;
      v89[1] = (v77 + 15) >> 4;
      v89[2] = 1;
      int64x2_t v87 = vdupq_n_s64(0x10uLL);
      uint64_t v88 = 1;
      [v41 dispatchThreadgroups:v89 threadsPerThreadgroup:&v87];
      [v41 endEncoding];
      v69 = [v29 blitCommandEncoder];

      if (!v69) {
        break;
      }
      v70 = [v86 objectAtIndexedSubscript:v108[0]];
      v71 = -[RawNightModeInputFrame textures]((uint64_t)v70);
      v72 = [v71 objectAtIndexedSubscript:0];
      [v69 copyFromTexture:v81 toTexture:v72];

      [v69 endEncoding];
      ++v108[0];
      v63 = v69;
      if (v108[0] >= v82) {
        goto LABEL_33;
      }
    }
    FigDebugAssert3();
    v63 = 0;
LABEL_40:

    int v73 = -28675;
  }
LABEL_34:
  FigMetalDecRef();

  return v73;
}

- (int)processReferenceFrame:(id)a3 nonRefFrames:(id)a4 correctRefFrame:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  if (dword_26B430EA8)
  {
    uint64_t v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  int v11 = objc_msgSend(v9, "count", v16, v17);
  if (v8 && (v11 - 4) > 0xFFFFFFFC)
  {
    if (self->_tuningParams)
    {
      uint64_t v12 = objc_opt_new();
      uint64_t v13 = v12;
      if (v12)
      {
        [v12 addObject:v8];
        [v13 addObjectsFromArray:v9];
        int v14 = [(RawNightModeMultiFrameOutlierPixelCorrection *)self processFrames:v13 correctFirstFrame:v5];
        if (v14) {
          FigDebugAssert3();
        }
      }
      else
      {
        FigDebugAssert3();
        int v14 = -28603;
      }
    }
    else
    {
      FigDebugAssert3();
      uint64_t v13 = 0;
      int v14 = -28679;
    }
  }
  else
  {
    FigDebugAssert3();
    uint64_t v13 = 0;
    int v14 = -28601;
  }

  return v14;
}

- (RawNightModeMultiFrameOutlierPixelCorrectionTuningParams)tuningParams
{
  return self->_tuningParams;
}

- (void)setTuningParams:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tuningParams, 0);
  objc_storeStrong((id *)&self->_multiFrameOutlierPixelCorrectionSkip22PipelineState, 0);
  objc_storeStrong((id *)&self->_multiFrameOutlierPixelCorrectionSkip21PipelineState, 0);
  objc_storeStrong((id *)&self->_multiFrameOutlierPixelCorrectionSkip12PipelineState, 0);
  objc_storeStrong((id *)&self->_multiFrameOutlierPixelCorrectionSkip11PipelineState, 0);

  objc_storeStrong((id *)&self->_metal, 0);
}

@end