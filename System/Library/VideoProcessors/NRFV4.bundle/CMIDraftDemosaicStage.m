@interface CMIDraftDemosaicStage
+ (int)prewarmShaders:(id)a3;
- (CMIDraftDemosaicStage)initWithMetalContext:(id)a3;
- (int)_compileShaders;
- (int)getDraftDemosaicModeWithCFALayout:(CMIDraftDemosaicStage *)self inputDims:(SEL)a2 outputDims:(int)a3;
- (int)runWithBayerInputTex:(CMIDraftDemosaicStage *)self outputTex:(SEL)a2 inputCropOrigin:(id)a3 inputCropSize:(id)a4 lscGainsTex:(id)a5 params:(CMIDraftDemosaicParams *)a6;
- (int)runWithInputTex:(id)a3 outputTex:(id)a4 cfaLayout:(int)a5 gain:(float)a6;
- (int)runWithInputTex:(id)a3 outputTex:(id)a4 cfaLayout:(int)a5 gain:(float)a6 inputCropOrigin:inputCropSize:outputCropOrigin:outputCropSize:;
- (int)runWithInputTex:(id)a3 outputTex:(id)a4 cfaLayout:(int)a5 gain:(float)a6 inputCropOrigin:inputCropSize:outputCropOrigin:outputCropSize:lscGainsTex:params:;
- (int)runWithInputTex:(id)a3 outputTex:(id)a4 cfaLayout:(int)a5 gain:(float)a6 lscGainsTex:(id)a7 params:(CMIDraftDemosaicParams *)a8;
- (int)runWithQuadraInputTex:(CMIDraftDemosaicStage *)self outputTex:(SEL)a2 mode:(id)a3 inputCropOrigin:(id)a4 inputCropSize:(int)a5 lscGainsTex:(id)a6 params:(CMIDraftDemosaicParams *)a7;
@end

@implementation CMIDraftDemosaicStage

- (CMIDraftDemosaicStage)initWithMetalContext:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CMIDraftDemosaicStage;
  v6 = [(CMIDraftDemosaicStage *)&v13 init];
  v7 = v6;
  if (!v6)
  {
    v12 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

LABEL_6:
    v9 = 0;
    goto LABEL_3;
  }
  objc_storeStrong((id *)&v6->_metal, a3);
  int v8 = [(CMIDraftDemosaicStage *)v7 _compileShaders];
  v9 = v7;
  if (v8)
  {
    FigDebugAssert3();
    goto LABEL_6;
  }
LABEL_3:
  v10 = v9;

  return v10;
}

- (int)_compileShaders
{
  v3 = [(FigMetalContext *)self->_metal computePipelineStateFor:@"CMISingleChannelBayerToQuarterLuma" constants:0];
  draftDemosaicSingleChannelBayerPipeline = self->_draftDemosaicSingleChannelBayerPipeline;
  self->_draftDemosaicSingleChannelBayerPipeline = v3;

  if (!self->_draftDemosaicSingleChannelBayerPipeline
    || ([(FigMetalContext *)self->_metal computePipelineStateFor:@"CMIMultiChannelBayerToQuarterLuma" constants:0], id v5 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue(), draftDemosaicMultiChannelBayerPipeline = self->_draftDemosaicMultiChannelBayerPipeline, self->_draftDemosaicMultiChannelBayerPipeline = v5, draftDemosaicMultiChannelBayerPipeline, !self->_draftDemosaicMultiChannelBayerPipeline))
  {
    v17 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    int v15 = -73432;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    return v15;
  }
  v7 = [(FigMetalContext *)self->_metal computePipelineStateFor:@"CMISingleChannelQuadraToLuma4x" constants:0];
  draftDemosaicSingleChannelQuadra4xPipeline = self->_draftDemosaicSingleChannelQuadra4xPipeline;
  self->_draftDemosaicSingleChannelQuadra4xPipeline = v7;

  if (self->_draftDemosaicSingleChannelQuadra4xPipeline)
  {
    v9 = [(FigMetalContext *)self->_metal computePipelineStateFor:@"CMISingleChannelQuadraToLuma2xBBGG" constants:0];
    draftDemosaicSingleChannelQuadra2xPipeline = self->_draftDemosaicSingleChannelQuadra2xPipeline;
    self->_draftDemosaicSingleChannelQuadra2xPipeline = v9;

    if (self->_draftDemosaicSingleChannelQuadra2xPipeline)
    {
      v11 = [(FigMetalContext *)self->_metal computePipelineStateFor:@"CMIMultiChannelQuadraToLuma4x" constants:0];
      draftDemosaicMultiChannelQuadra4xPipeline = self->_draftDemosaicMultiChannelQuadra4xPipeline;
      self->_draftDemosaicMultiChannelQuadra4xPipeline = v11;

      if (self->_draftDemosaicMultiChannelQuadra4xPipeline)
      {
        objc_super v13 = [(FigMetalContext *)self->_metal computePipelineStateFor:@"CMIMultiChannelQuadraToLuma2xBBGG" constants:0];
        draftDemosaicMultiChannelQuadra2xPipeline = self->_draftDemosaicMultiChannelQuadra2xPipeline;
        self->_draftDemosaicMultiChannelQuadra2xPipeline = v13;

        if (self->_draftDemosaicMultiChannelQuadra2xPipeline) {
          return 0;
        }
      }
    }
  }
  FigDebugAssert3();

  return FigSignalErrorAt();
}

+ (int)prewarmShaders:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = [[CMIDraftDemosaicStage alloc] initWithMetalContext:v3];
    if (v4)
    {
      int v5 = 0;
    }
    else
    {
      v7 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      v4 = 0;
      int v5 = -73432;
    }
  }
  else
  {
    FigDebugAssert3();
    int v5 = FigSignalErrorAt();
    v4 = 0;
  }

  return v5;
}

- (int)getDraftDemosaicModeWithCFALayout:(CMIDraftDemosaicStage *)self inputDims:(SEL)a2 outputDims:(int)a3
{
  if ((unsigned __int16)v3 <= (unsigned __int16)v4 || HIWORD(v3) <= HIWORD(v4))
  {
    v7 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    return -1;
  }
  else
  {
    if (10 * (unint64_t)((unsigned __int16)v4 * HIWORD(v4)) < (unsigned __int16)v3 * HIWORD(v3)) {
      int v5 = 1;
    }
    else {
      int v5 = 2;
    }
    if (a3 == 3) {
      return v5;
    }
    else {
      return 0;
    }
  }
}

- (int)runWithInputTex:(id)a3 outputTex:(id)a4 cfaLayout:(int)a5 gain:(float)a6
{
  memset(v7, 0, sizeof(v7));
  return -[CMIDraftDemosaicStage runWithInputTex:outputTex:cfaLayout:gain:lscGainsTex:params:](self, "runWithInputTex:outputTex:cfaLayout:gain:lscGainsTex:params:", a3, a4, *(void *)&a5, 0, v7);
}

- (int)runWithInputTex:(id)a3 outputTex:(id)a4 cfaLayout:(int)a5 gain:(float)a6 lscGainsTex:(id)a7 params:(CMIDraftDemosaicParams *)a8
{
  uint64_t v10 = *(void *)&a5;
  id v14 = a7;
  id v15 = a4;
  id v16 = a3;
  unsigned int v17 = [v16 width];
  uint32x2_t v23 = (uint32x2_t)__PAIR64__([v16 height], v17);
  v18 = [v16 device];
  [v16 pixelFormat];
  MTLPixelFormatGetInfoForDevice();

  v20.i32[0] = 4;
  v20.i32[1] &= 0xFF00FFu;
  *(int16x4_t *)v21.i8 = vdup_lane_s16(vceq_s16((int16x4_t)(v19 & 0xFF00FF00FF0000), v20), 0);
  unsigned __int32 v25 = vmovn_s16(v21).u32[0];
  v21.i32[0] = (__int16)v25;
  v21.i32[1] = SHIWORD(v25);
  *(uint32x2_t *)v21.i8 = vshl_u32(v23, (uint32x2_t)vand_s8(*(int8x8_t *)v21.i8, (int8x8_t)0x100000001));
  HIWORD(v24) = v21.i16[2];
  LOWORD(v24) = v21.i16[0];
  *(float *)v21.i32 = a6;
  LODWORD(v10) = [(CMIDraftDemosaicStage *)self runWithInputTex:v16 outputTex:v15 cfaLayout:v10 gain:0 inputCropOrigin:v24 inputCropSize:0 outputCropOrigin:*(double *)v21.i64 outputCropSize:0 lscGainsTex:v14 params:a8];

  return v10;
}

- (int)runWithInputTex:(id)a3 outputTex:(id)a4 cfaLayout:(int)a5 gain:(float)a6 inputCropOrigin:inputCropSize:outputCropOrigin:outputCropSize:
{
  memset(v7, 0, sizeof(v7));
  return -[CMIDraftDemosaicStage runWithInputTex:outputTex:cfaLayout:gain:inputCropOrigin:inputCropSize:outputCropOrigin:outputCropSize:lscGainsTex:params:](self, "runWithInputTex:outputTex:cfaLayout:gain:inputCropOrigin:inputCropSize:outputCropOrigin:outputCropSize:lscGainsTex:params:", a3, a4, *(void *)&a5, v8, 0, v7);
}

- (int)runWithInputTex:(id)a3 outputTex:(id)a4 cfaLayout:(int)a5 gain:(float)a6 inputCropOrigin:inputCropSize:outputCropOrigin:outputCropSize:lscGainsTex:params:
{
  v9 = v8;
  unsigned __int32 v36 = v7;
  uint64_t v10 = v6;
  uint64_t v12 = *(void *)&a5;
  id v15 = a3;
  id v16 = a4;
  id v17 = v41;
  v18 = [v15 device];
  [v15 pixelFormat];
  MTLPixelFormatGetInfoForDevice();

  v20.i32[0] = 4;
  v20.i32[1] &= 0xFF00FFu;
  *(int16x4_t *)v21.i8 = vdup_lane_s16(vceq_s16((int16x4_t)(v19 & 0xFF00FF00FF0000), v20), 0);
  unsigned __int32 v39 = vmovn_s16(v21).u32[0];
  v21.i32[0] = (__int16)v39;
  v21.i32[1] = SHIWORD(v39);
  *(uint32x2_t *)v21.i8 = vshl_u32((uint32x2_t)__PAIR64__([v15 height], objc_msgSend(v15, "width")), (uint32x2_t)vand_s8(*(int8x8_t *)v21.i8, (int8x8_t)0x100000001));
  HIWORD(v38) = v21.i16[2];
  LOWORD(v38) = v21.i16[0];
  LOWORD(v37) = [v16 width];
  HIWORD(v37) = [v16 height];
  uint64_t v22 = [(CMIDraftDemosaicStage *)self getDraftDemosaicModeWithCFALayout:v12 inputDims:v38 outputDims:v37];
  if ((v22 & 0x80000000) != 0 || !v42)
  {
    v35 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT);
    goto LABEL_18;
  }
  uint64_t v24 = v22;
  id v25 = v17;
  *(float *)(v42 + 44) = a6;
  if (v22 == 1) {
    unsigned int v26 = 4;
  }
  else {
    unsigned int v26 = 2;
  }
  if (v9)
  {
    v23.i32[0] = v10;
    uint16x4_t v23 = (uint16x4_t)vand_s8((int8x8_t)*(_OWORD *)&vmovl_u16(v23), (int8x8_t)0xFFFF0000FFFFLL);
    v9[1] = v23.i32[1] / v26;
    unsigned __int16 *v9 = v23.i32[0] / v26;
  }
  if (v40)
  {
    v23.i32[0] = v36;
    int8x8_t v27 = vand_s8((int8x8_t)*(_OWORD *)&vmovl_u16(v23), (int8x8_t)0xFFFF0000FFFFLL);
    int v28 = v27.i32[1] / v26;
    uint64_t v29 = v27.i32[0] / v26;
    _WORD *v40 = v29;
    v40[1] = v28;
    unint64_t v30 = *v9 + v29;
    if (v30 > [v16 width]
      || (unint64_t v31 = (unsigned __int16)v40[1] + (unint64_t)v9[1], v31 > [v16 height]))
    {
      v35 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT);
      id v17 = v25;
LABEL_18:
      int v33 = -73432;
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      goto LABEL_15;
    }
  }
  id v17 = v25;
  if (v24) {
    int v32 = [(CMIDraftDemosaicStage *)self runWithQuadraInputTex:v15 outputTex:v16 mode:v24 inputCropOrigin:v10 inputCropSize:v36 lscGainsTex:v25 params:v42];
  }
  else {
    int v32 = [(CMIDraftDemosaicStage *)self runWithBayerInputTex:v15 outputTex:v16 inputCropOrigin:v10 inputCropSize:v36 lscGainsTex:v25 params:v42];
  }
  int v33 = v32;
LABEL_15:

  return v33;
}

- (int)runWithBayerInputTex:(CMIDraftDemosaicStage *)self outputTex:(SEL)a2 inputCropOrigin:(id)a3 inputCropSize:(id)a4 lscGainsTex:(id)a5 params:(CMIDraftDemosaicParams *)a6
{
  uint64_t v8 = v7;
  v9 = v6;
  unsigned int v10 = a6;
  unsigned int v11 = a5;
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v35 = a4;
  unsigned int v46 = v11;
  id v15 = v9;
  unsigned int v16 = [v14 width];
  unsigned int v17 = [v14 height];
  uint64_t v45 = 0;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v42 = 0u;
  v18 = [v14 device];
  [v14 pixelFormat];
  MTLPixelFormatGetInfoForDevice();

  v19.i32[0] = 4;
  v19.i32[1] &= 0xFF00FFu;
  *(int16x4_t *)v21.i8 = vdup_lane_s16(vceq_s16((int16x4_t)(v20 & 0xFF00FF00000000), v19), 0);
  unsigned __int32 v36 = vmovn_s16(v21).u32[0];
  if (((v10 | HIWORD(v10)) & 1) != 0
    || (v11 & 0x10001) != 0
    || (v22.i32[0] = (__int16)v36,
        v22.i32[1] = SHIWORD(v36),
        uint32x2_t v23 = vshl_u32((uint32x2_t)__PAIR64__(v17, v16), (uint32x2_t)vand_s8(v22, (int8x8_t)0x100000001)),
        unsigned int v24 = (unsigned __int16)v10,
        (unsigned __int16)v10 + (unsigned __int16)v11 > v23.u16[0])
    || (unsigned int v25 = HIWORD(v10), v25 + HIWORD(v11) > v23.u16[2]))
  {
    int v41 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    uint64_t v29 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
    int8x8_t v27 = v35;
    int v28 = v15;
    int v32 = -73432;
    fig_log_call_emit_and_clean_up_after_send_and_compose();
LABEL_16:

    goto LABEL_10;
  }
  unsigned int v26 = [(FigMetalContext *)self->_metal commandBuffer];
  int8x8_t v27 = v35;
  int v28 = v15;
  if (!v26)
  {
    FigDebugAssert3();
    int v32 = FigSignalErrorAt();
    goto LABEL_10;
  }
  uint64_t v29 = v26;
  unint64_t v30 = [v26 computeCommandEncoder];
  if (!v30)
  {
    int v41 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v34 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);
    int v32 = -73432;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_16;
  }
  unint64_t v31 = v30;
  [v30 setComputePipelineState:self->_draftDemosaicSingleChannelBayerPipeline];
  [v31 setImageblockWidth:32 height:32];
  [v31 setTexture:v14 atIndex:0];
  [v31 setTexture:v35 atIndex:1];
  if (v28) {
    [v31 setTexture:v28 atIndex:2];
  }
  [v31 setBytes:&v46 length:4 atIndex:0];
  [v31 setBytes:v8 length:48 atIndex:1];
  v39[0] = v24 >> 1;
  v39[1] = v25 >> 1;
  v39[2] = 1;
  int64x2_t v37 = vdupq_n_s64(0x20uLL);
  uint64_t v38 = 1;
  [v31 dispatchThreads:v39 threadsPerThreadgroup:&v37];
  [v31 endEncoding];
  [(FigMetalContext *)self->_metal commit];

  int v32 = 0;
LABEL_10:

  return v32;
}

- (int)runWithQuadraInputTex:(CMIDraftDemosaicStage *)self outputTex:(SEL)a2 mode:(id)a3 inputCropOrigin:(id)a4 inputCropSize:(int)a5 lscGainsTex:(id)a6 params:(CMIDraftDemosaicParams *)a7
{
  uint64_t v8 = v7;
  unsigned int v9 = a7;
  unsigned int v10 = a6;
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v35 = a4;
  unsigned int v45 = v10;
  id v15 = v8;
  unsigned int v16 = [v14 width];
  unsigned int v17 = [v14 height];
  uint64_t v44 = 0;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v41 = 0u;
  v18 = [v14 device];
  [v14 pixelFormat];
  MTLPixelFormatGetInfoForDevice();

  v19.i32[0] = 4;
  v19.i32[1] &= 0xFF00FFu;
  *(int16x4_t *)v21.i8 = vdup_lane_s16(vceq_s16((int16x4_t)(v20 & 0xFF00FF00000000), v19), 0);
  unsigned __int32 v36 = vmovn_s16(v21).u32[0];
  if ((a5 - 3) <= 0xFFFFFFFD
    || (v9 & 0x30003) != 0
    || ((BYTE2(v10) | v10) & 3) != 0
    || (v22.i32[0] = (__int16)v36,
        v22.i32[1] = SHIWORD(v36),
        uint32x2_t v23 = vshl_u32((uint32x2_t)__PAIR64__(v17, v16), (uint32x2_t)vand_s8(v22, (int8x8_t)0x100000001)),
        (unsigned __int16)v9 + (unsigned __int16)v10 > v23.u16[0])
    || (HIWORD(v9) + HIWORD(v10)) > v23.u16[2])
  {
    int v40 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    unsigned int v25 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
    int v32 = -73432;
    fig_log_call_emit_and_clean_up_after_send_and_compose();
LABEL_16:

    goto LABEL_14;
  }
  unsigned int v24 = [(FigMetalContext *)self->_metal commandBuffer];
  if (!v24)
  {
    FigDebugAssert3();
    int v32 = FigSignalErrorAt();
    goto LABEL_14;
  }
  unsigned int v25 = v24;
  unsigned int v26 = [v24 computeCommandEncoder];
  if (!v26)
  {
    int v40 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v34 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);
    int v32 = -73432;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_16;
  }
  int8x8_t v27 = v26;
  uint64_t v28 = (unsigned __int16)v9 >> 2;
  uint64_t v29 = v9 >> 18;
  uint64_t v30 = 40;
  if (a5 == 2)
  {
    uint64_t v31 = 16;
  }
  else
  {
    uint64_t v30 = 32;
    uint64_t v31 = 32;
  }
  [v26 setComputePipelineState:*(Class *)((char *)&self->super.isa + v30)];
  [v27 setImageblockWidth:32 height:32];
  [v27 setTexture:v14 atIndex:0];
  [v27 setTexture:v35 atIndex:1];
  if (v15) {
    [v27 setTexture:v15 atIndex:2];
  }
  [v27 setBytes:&v45 length:4 atIndex:0];
  [v27 setBytes:v47 length:48 atIndex:1];
  v38[0] = v28;
  v38[1] = v29;
  v38[2] = 1;
  v37[0] = v31;
  v37[1] = v31;
  v37[2] = 1;
  [v27 dispatchThreads:v38 threadsPerThreadgroup:v37];
  [v27 endEncoding];
  [(FigMetalContext *)self->_metal commit];

  int v32 = 0;
LABEL_14:

  return v32;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_draftDemosaicMultiChannelQuadra2xPipeline, 0);
  objc_storeStrong((id *)&self->_draftDemosaicMultiChannelQuadra4xPipeline, 0);
  objc_storeStrong((id *)&self->_draftDemosaicSingleChannelQuadra2xPipeline, 0);
  objc_storeStrong((id *)&self->_draftDemosaicSingleChannelQuadra4xPipeline, 0);
  objc_storeStrong((id *)&self->_draftDemosaicMultiChannelBayerPipeline, 0);
  objc_storeStrong((id *)&self->_draftDemosaicSingleChannelBayerPipeline, 0);

  objc_storeStrong((id *)&self->_metal, 0);
}

@end