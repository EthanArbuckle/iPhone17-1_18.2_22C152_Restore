@interface CMIVideoDeghostingBrightLightV1
+ (int)prewarmShaders:(id)a3;
- (CMIVideoDeghostingBrightLightV1)initWithMetalContext:(id)a3;
- (id)_functionNameForProgram:(int)a3;
- (int)_compileShaders;
- (int)_cropAndScaleLuma:(CMIVideoDeghostingBrightLightV1 *)self chroma:(SEL)a2 outputLuma:(id)a3 outputChroma:(id)a4 outputReflectedLuma:(id)a5 params:(id)a6 maskToFullSizeLumaRatio:(id)a7 maskToFullSizeChromaRatio:(DetectionTuning *)a8;
- (int)_detectionWithFullSizeLuma:(CMIVideoDeghostingBrightLightV1 *)self fullSizeChroma:(SEL)a2 outputMask:(id)a3 params:(id)a4 maskToFullSizeLumaRatio:(id)a5 maskToFullSizeChromaRatio:(BrightLightDetectionTuning *)a6 inputIsHDR:(BOOL)a7;
- (int)_refineMask:(id)a3 outputMask:(id)a4 params:(BrightLightRefinementTuning)a5;
- (int)_scaleROI:(CMIVideoDeghostingBrightLightV1 *)self fullResolutionSize:(SEL)a2 downScaledSize:;
- (int)_unCropMaskCropped:(id)a3 maskOutput:(id)a4;
- (int)greenGhostDetectionWithInputPixelBuffer:(__CVBuffer *)a3 outputMask:(id)a4 roi:(id)a5 tuning:;
@end

@implementation CMIVideoDeghostingBrightLightV1

- (id)_functionNameForProgram:(int)a3
{
  if (a3 < 3) {
    return *(&off_2C960 + a3);
  }
  fig_log_get_emitter();
  FigDebugAssert3();
  return 0;
}

- (int)_compileShaders
{
  metal = self->_metal;
  v4 = [(CMIVideoDeghostingBrightLightV1 *)self _functionNameForProgram:0];
  v5 = [(FigMetalContext *)metal computePipelineStateFor:v4 constants:0];
  v6 = self->_pipelineStates[0];
  self->_pipelineStates[0] = v5;

  if (self->_pipelineStates[0])
  {
    v7 = self->_metal;
    v8 = [(CMIVideoDeghostingBrightLightV1 *)self _functionNameForProgram:1];
    v9 = [(FigMetalContext *)v7 computePipelineStateFor:v8 constants:0];
    v10 = self->_pipelineStates[1];
    self->_pipelineStates[1] = v9;

    if (self->_pipelineStates[1])
    {
      v11 = self->_metal;
      v12 = [(CMIVideoDeghostingBrightLightV1 *)self _functionNameForProgram:2];
      v13 = [(FigMetalContext *)v11 computePipelineStateFor:v12 constants:0];
      v14 = self->_pipelineStates[2];
      self->_pipelineStates[2] = v13;

      if (self->_pipelineStates[2]) {
        return 0;
      }
    }
  }
  fig_log_get_emitter();
  FigDebugAssert3();

  return FigSignalErrorAt();
}

- (CMIVideoDeghostingBrightLightV1)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CMIVideoDeghostingBrightLightV1;
  v6 = [(CMIVideoDeghostingBrightLightV1 *)&v13 init];
  v7 = v6;
  if (!v6)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    FigSignalErrorAt();
LABEL_8:
    v10 = 0;
    goto LABEL_5;
  }
  objc_storeStrong((id *)&v6->_metal, a3);
  if ([(CMIVideoDeghostingBrightLightV1 *)v7 _compileShaders])
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_8;
  }
  *(_OWORD *)&v7->_processingROIInfo.var0 = xmmword_22B40;
  LODWORD(v7[1]._metal) = 1065353216;
  v8 = [[CMIVideoDeghostingBrightLightCommonV1 alloc] initWithMetalContext:v5];
  greenGhostCommon = v7->_greenGhostCommon;
  v7->_greenGhostCommon = v8;

  v10 = v7;
  if (!v7->_greenGhostCommon)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v10 = v7;
  }
LABEL_5:
  v11 = v10;

  return v11;
}

+ (int)prewarmShaders:(id)a3
{
  id v3 = a3;
  v4 = [[CMIVideoDeghostingBrightLightV1 alloc] initWithMetalContext:v3];

  if (v4) {
    int v5 = 0;
  }
  else {
    int v5 = -12786;
  }

  return v5;
}

- (int)_scaleROI:(CMIVideoDeghostingBrightLightV1 *)self fullResolutionSize:(SEL)a2 downScaledSize:
{
  float32x2_t v5 = vdiv_f32(v4, v3);
  int32x2_t v6 = (int32x2_t)vcvt_u32_f32(vmul_f32(v5, vcvt_f32_u32((uint32x2_t)*(_OWORD *)&vextq_s8(v2, v2, 8uLL))));
  int32x2_t v7 = vadd_s32((int32x2_t)vand_s8((int8x8_t)v6, (int8x8_t)0x100000001), v6);
  unsigned int v8 = v7.i32[0];
  if (v7.i32[0]) {
    BOOL v9 = v7.i32[1] == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9) {
    return FigSignalErrorAt();
  }
  if (v4.f32[0] <= v4.f32[1]) {
    v4.f32[0] = v4.f32[1];
  }
  if (v7.i32[0] <= (unsigned __int32)v7.i32[1]) {
    unsigned int v8 = v7.u32[1];
  }
  *(uint32x2_t *)&long long v10 = vcvt_u32_f32(vmul_f32(v5, vcvt_f32_u32(*(uint32x2_t *)v2.i8)));
  *((int32x2_t *)&v10 + 1) = v7;
  *(_OWORD *)&self->_processingROIInfo.var0 = v10;
  *(float *)&self[1]._metal = v4.f32[0] / (float)v8;
  return 0;
}

- (int)_cropAndScaleLuma:(CMIVideoDeghostingBrightLightV1 *)self chroma:(SEL)a2 outputLuma:(id)a3 outputChroma:(id)a4 outputReflectedLuma:(id)a5 params:(id)a6 maskToFullSizeLumaRatio:(id)a7 maskToFullSizeChromaRatio:(DetectionTuning *)a8
{
  uint64_t v10 = v9;
  uint64_t v11 = v8;
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v37 = a6;
  id v21 = a7;
  uint64_t v43 = v11;
  uint64_t v41 = *(void *)&self->_processingROIInfo.var0;
  uint64_t v42 = v10;
  float32x2_t v22 = vadd_f32(*(float32x2_t *)&a8->var0, *(float32x2_t *)&a8->var0);
  float v36 = (float)(unint64_t)[v18 width];
  id v23 = [v18 height];
  v24.f32[0] = v36;
  v24.f32[1] = (float)(unint64_t)v23;
  float32x2_t v40 = vmul_f32(v22, v24);
  v25 = [(FigMetalContext *)self->_metal commandQueue];
  v26 = [v25 commandBuffer];

  if (v26 && ([v26 computeCommandEncoder], (v27 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v28 = v27;
    [v27 setComputePipelineState:self->_pipelineStates[2]];
    [v28 setTexture:v18 atIndex:0];
    id v29 = v19;
    [v28 setTexture:v19 atIndex:1];
    [v28 setTexture:v20 atIndex:2];
    [v28 setTexture:v37 atIndex:3];
    [v28 setTexture:v21 atIndex:4];
    [v28 setBytes:&v41 length:8 atIndex:0];
    [v28 setBytes:&v40 length:8 atIndex:1];
    [v28 setBytes:&v43 length:8 atIndex:2];
    [v28 setBytes:&v42 length:8 atIndex:3];
    unint64_t v30 = (unint64_t)[(MTLComputePipelineState *)self->_pipelineStates[2] threadExecutionWidth];
    unint64_t v31 = (unint64_t)[(MTLComputePipelineState *)self->_pipelineStates[2] maxTotalThreadsPerThreadgroup]/ v30;
    v39[0] = [v20 width];
    v39[1] = [v20 height];
    v39[2] = 1;
    v38[0] = v30;
    v38[1] = v31;
    v38[2] = 1;
    [v28 dispatchThreads:v39 threadsPerThreadgroup:v38];
    [v28 endEncoding];
    if (gGMFigKTraceEnabled)
    {
      v32 = [v26 commandQueue];
      v33 = [v32 commandBuffer];

      [v33 setLabel:@"KTRACE_MTLCMDBUF"];
      [v33 addCompletedHandler:&stru_2C8A0];
      [v33 commit];
      [v26 addCompletedHandler:&stru_2C8C0];
    }
    [v26 commit];

    int v34 = 0;
    id v19 = v29;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v34 = FigSignalErrorAt();
  }

  return v34;
}

- (int)_unCropMaskCropped:(id)a3 maskOutput:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v20 = *(_OWORD *)&self->_processingROIInfo.var0;
  if ([v7 width] & 1) != 0 || (objc_msgSend(v7, "height")) {
    goto LABEL_11;
  }
  uint64_t v8 = [(FigMetalContext *)self->_metal commandQueue];
  uint64_t v9 = [v8 commandBuffer];

  if (!v9)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_11:
    int v16 = FigSignalErrorAt();
    goto LABEL_8;
  }
  uint64_t v10 = [v9 computeCommandEncoder];
  if (v10)
  {
    uint64_t v11 = v10;
    [v10 setComputePipelineState:self->_pipelineStates[0]];
    [v11 setTexture:v6 atIndex:0];
    [v11 setTexture:v7 atIndex:1];
    [v11 setBytes:&v20 length:16 atIndex:0];
    unint64_t v12 = (unint64_t)[(MTLComputePipelineState *)self->_pipelineStates[0] threadExecutionWidth];
    unint64_t v13 = (unint64_t)[(MTLComputePipelineState *)self->_pipelineStates[0] maxTotalThreadsPerThreadgroup]/ v12;
    v19[0] = (unint64_t)[v7 width] >> 1;
    v19[1] = (unint64_t)[v7 height] >> 1;
    v19[2] = 1;
    v18[0] = v12;
    v18[1] = v13;
    v18[2] = 1;
    [v11 dispatchThreads:v19 threadsPerThreadgroup:v18];
    [v11 endEncoding];
    if (gGMFigKTraceEnabled)
    {
      v14 = [v9 commandQueue];
      v15 = [v14 commandBuffer];

      [v15 setLabel:@"KTRACE_MTLCMDBUF"];
      [v15 addCompletedHandler:&stru_2C8E0];
      [v15 commit];
      [v9 addCompletedHandler:&stru_2C900];
    }
    [v9 commit];

    int v16 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v16 = FigSignalErrorAt();
  }
LABEL_8:

  return v16;
}

- (int)_refineMask:(id)a3 outputMask:(id)a4 params:(BrightLightRefinementTuning)a5
{
  float var2 = a5.var2;
  float var1 = a5.var1;
  float var0 = a5.var0;
  BrightLightRefinementTuning v47 = a5;
  id v10 = a3;
  id v11 = a4;
  id v46 = 0;
  float v12 = *(float *)&self[1]._metal;
  if (([v10 width] & 1) != 0
    || ([v10 height] & 1) != 0
    || ([(FigMetalContext *)self->_metal allocator],
        unint64_t v13 = objc_claimAutoreleasedReturnValue(),
        id v14 = [v13 newTextureDescriptor],
        v13,
        !v14))
  {
    int v34 = FigSignalErrorAt();
    goto LABEL_13;
  }
  v15 = [v14 desc];
  [v15 setCompressionMode:2];

  int v16 = [v14 desc];
  [v16 setCompressionFootprint:0];

  v17 = [v14 desc];
  [v17 setUsage:7];

  id v18 = [v10 pixelFormat];
  id v19 = [v14 desc];
  [v19 setPixelFormat:v18];

  id v20 = [v10 width];
  id v21 = [v14 desc];
  [v21 setWidth:v20];

  id v22 = [v10 height];
  id v23 = [v14 desc];
  [v23 setHeight:v22];

  [v14 setLabel:0];
  float32x2_t v24 = [(FigMetalContext *)self->_metal allocator];
  id v25 = [v24 newTextureWithDescriptor:v14];
  id v46 = v25;

  if (!v25) {
    goto LABEL_21;
  }
  float v27 = v12 * var0;
  *(float *)&double v26 = v27;
  unsigned int v28 = [(CMIVideoDeghostingBrightLightCommonV1 *)self->_greenGhostCommon erodeTexture:v10 withNormalizedRadius:v25 output:v26];
  if (v28
    || (*(float *)&double v29 = v27,
        (unsigned int v28 = [(CMIVideoDeghostingBrightLightCommonV1 *)self->_greenGhostCommon dilateTexture:v25 withNormalizedRadius:v10 output:v29]) != 0))
  {
    int v34 = v28;
    fig_log_get_emitter();
LABEL_19:
    FigDebugAssert3();
LABEL_22:

    goto LABEL_13;
  }
  greenGhostCommon = self->_greenGhostCommon;
  *(float *)&double v30 = var2;
  v32 = +[NSNumber numberWithFloat:v30];
  *(float *)&double v33 = v12 * var1;
  int v34 = [(CMIVideoDeghostingBrightLightCommonV1 *)greenGhostCommon dilateTexture:v10 withNormalizedRadius:v32 withThreshold:0 subtractTexture:v25 output:v33];

  if (v34)
  {
    fig_log_get_emitter();
    goto LABEL_19;
  }
  v35 = [(FigMetalContext *)self->_metal commandQueue];
  float v36 = [v35 commandBuffer];

  if (!v36)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_21:
    int v34 = FigSignalErrorAt();
    goto LABEL_22;
  }
  id v37 = [v36 computeCommandEncoder];
  if (v37)
  {
    v38 = v37;
    [v37 setComputePipelineState:self->_pipelineStates[1]];
    [v38 setTexture:v25 atIndex:0];
    [v38 setTexture:v10 atIndex:1];
    [v38 setTexture:v11 atIndex:2];
    [v38 setBytes:&v47.var3 length:4 atIndex:0];
    unint64_t v39 = (unint64_t)[(MTLComputePipelineState *)self->_pipelineStates[1] threadExecutionWidth];
    unint64_t v40 = (unint64_t)[(MTLComputePipelineState *)self->_pipelineStates[1] maxTotalThreadsPerThreadgroup]/ v39;
    v45[0] = (unint64_t)[v10 width] >> 1;
    v45[1] = (unint64_t)[v10 height] >> 1;
    v45[2] = 1;
    v44[0] = v39;
    v44[1] = v40;
    v44[2] = 1;
    [v38 dispatchThreads:v45 threadsPerThreadgroup:v44];
    [v38 endEncoding];
    if (gGMFigKTraceEnabled)
    {
      uint64_t v41 = [v36 commandQueue];
      uint64_t v42 = [v41 commandBuffer];

      [v42 setLabel:@"KTRACE_MTLCMDBUF"];
      [v42 addCompletedHandler:&stru_2C920];
      [v42 commit];
      [v36 addCompletedHandler:&stru_2C940];
    }
    [v36 commit];

    int v34 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v34 = FigSignalErrorAt();
  }
LABEL_13:
  FigMetalDecRef();

  return v34;
}

- (int)_detectionWithFullSizeLuma:(CMIVideoDeghostingBrightLightV1 *)self fullSizeChroma:(SEL)a2 outputMask:(id)a3 params:(id)a4 maskToFullSizeLumaRatio:(id)a5 maskToFullSizeChromaRatio:(BrightLightDetectionTuning *)a6 inputIsHDR:(BOOL)a7
{
  double v10 = v8;
  double v11 = v7;
  id v16 = a3;
  id v53 = a4;
  id v17 = a5;
  id v63 = 0;
  id v64 = 0;
  id v61 = 0;
  id v62 = 0;
  id v60 = 0;
  id v18 = [(FigMetalContext *)self->_metal allocator];
  id v19 = [v18 newTextureDescriptor];

  v52 = v16;
  if (!v19) {
    goto LABEL_14;
  }
  id v20 = [v19 desc];
  [v20 setCompressionMode:2];

  id v21 = [v19 desc];
  [v21 setCompressionFootprint:0];

  id v22 = [v19 desc];
  [v22 setUsage:7];

  id v23 = [v17 width];
  float32x2_t v24 = [v19 desc];
  [v24 setWidth:v23];

  id v25 = [v17 height];
  double v26 = [v19 desc];
  [v26 setHeight:v25];

  float v27 = [v19 desc];
  [v27 setPixelFormat:25];

  [v19 setLabel:0];
  unsigned int v28 = [(FigMetalContext *)self->_metal allocator];
  id v29 = [v28 newTextureWithDescriptor:v19];
  id v63 = v29;

  if (!v29) {
    goto LABEL_10;
  }
  [v19 setLabel:0];
  double v30 = [(FigMetalContext *)self->_metal allocator];
  id v31 = [v30 newTextureWithDescriptor:v19];
  id v61 = v31;

  if (!v31) {
    goto LABEL_10;
  }
  v32 = [v19 desc];
  [v32 setPixelFormat:65];

  [v19 setLabel:0];
  double v33 = [(FigMetalContext *)self->_metal allocator];
  id v34 = [v33 newTextureWithDescriptor:v19];
  id v62 = v34;

  if (!v34)
  {
LABEL_10:
    fig_log_get_emitter();
LABEL_13:
    FigDebugAssert3();
LABEL_14:
    int v49 = FigSignalErrorAt();
    goto LABEL_9;
  }
  long long v35 = *(_OWORD *)&a6[1].detectionParams.var1;
  long long v56 = *(_OWORD *)&a6[1].detectionParams.brightParams.threshold;
  long long v57 = v35;
  long long v58 = *(_OWORD *)&a6[2].detectionParams.brightParams.threshold;
  uint64_t v59 = *(void *)&a6[2].detectionParams.var1;
  long long v36 = *(_OWORD *)&a6->detectionParams.var1;
  long long v54 = *(_OWORD *)&a6->detectionParams.brightParams.threshold;
  long long v55 = v36;
  unsigned int v37 = [(CMIVideoDeghostingBrightLightV1 *)self _cropAndScaleLuma:v16 chroma:v53 outputLuma:v29 outputChroma:v34 outputReflectedLuma:v31 params:&v54 maskToFullSizeLumaRatio:v11 maskToFullSizeChromaRatio:v10];
  if (v37)
  {
LABEL_11:
    int v49 = v37;
    fig_log_get_emitter();
LABEL_17:
    FigDebugAssert3();
    goto LABEL_9;
  }
  id v38 = [v17 pixelFormat];
  unint64_t v39 = [v19 desc];
  [v39 setPixelFormat:v38];

  [v19 setLabel:0];
  unint64_t v40 = [(FigMetalContext *)self->_metal allocator];
  id v41 = [v40 newTextureWithDescriptor:v19];
  id v64 = v41;

  if (!v41)
  {
    fig_log_get_emitter();
    goto LABEL_13;
  }
  greenGhostCommon = self->_greenGhostCommon;
  long long v43 = *(_OWORD *)&a6[1].detectionParams.var1;
  long long v56 = *(_OWORD *)&a6[1].detectionParams.brightParams.threshold;
  long long v57 = v43;
  long long v58 = *(_OWORD *)&a6[2].detectionParams.brightParams.threshold;
  uint64_t v59 = *(void *)&a6[2].detectionParams.var1;
  long long v44 = *(_OWORD *)&a6->detectionParams.var1;
  long long v54 = *(_OWORD *)&a6->detectionParams.brightParams.threshold;
  long long v55 = v44;
  LOBYTE(v51) = a7;
  unsigned int v37 = [(CMIVideoDeghostingBrightLightCommonV1 *)greenGhostCommon detectionWithReflectedLuma:v31 croppedLuma:v29 chroma:v34 outputMask:v41 params:&v54 processingROIInfo:&self->_processingROIInfo inputIsHDR:v51];
  if (v37) {
    goto LABEL_11;
  }
  LODWORD(v45) = a6[2].detectionParams.var2;
  LODWORD(v46) = HIDWORD(a6[2].detectionParams.var2);
  *(float *)&double v47 = a6[3].detectionParams.brightParams.threshold;
  LODWORD(v48) = *((_DWORD *)&a6[3].detectionParams.brightParams + 1);
  int v49 = -[CMIVideoDeghostingBrightLightV1 _refineMask:outputMask:params:](self, "_refineMask:outputMask:params:", v41, v17, v45, v46, v47, v48);
  if (v49)
  {
    fig_log_get_emitter();
    goto LABEL_17;
  }
LABEL_9:
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();

  return v49;
}

- (int)greenGhostDetectionWithInputPixelBuffer:(__CVBuffer *)a3 outputMask:(id)a4 roi:(id)a5 tuning:
{
  double v46 = v5;
  id v9 = a4;
  id v10 = a5;
  id v56 = 0;
  uint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  BOOL v12 = +[VDGMetalUtilsV1 isTenBitPixelBufferFormat:PixelFormatType];
  unint64_t v13 = +[VDGMetalUtilsV1 getMetalFormatFor:PixelFormatType];
  metal = self->_metal;
  v15 = [v13 objectAtIndexedSubscript:0];
  id v16 = -[FigMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:](metal, "bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:", a3, (int)[v15 intValue], 23, 0);

  if (!v16)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v44 = FigSignalErrorAt();
    id v29 = 0;
    id v19 = 0;
    goto LABEL_12;
  }
  double v48 = v10;
  id v17 = self->_metal;
  id v18 = [v13 objectAtIndexedSubscript:1];
  id v19 = -[FigMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:](v17, "bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:", a3, (int)[v18 intValue], 23, 1);

  if (!v19)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v44 = FigSignalErrorAt();
LABEL_16:
    id v29 = 0;
    id v10 = v48;
    goto LABEL_12;
  }
  float v51 = (float)(unint64_t)[v16 width];
  id v20 = [v16 height];
  *(float *)&double v21 = v51;
  *((float *)&v21 + 1) = (float)(unint64_t)v20;
  double v52 = v21;
  id v22 = [v19 width];
  id v23 = [v19 height];
  float v49 = (float)(unint64_t)[v9 width];
  id v24 = [v9 height];
  v25.f32[0] = v49;
  v25.f32[1] = (float)(unint64_t)v24;
  float32x2_t v50 = v25;
  unsigned int v26 = -[CMIVideoDeghostingBrightLightV1 _scaleROI:fullResolutionSize:downScaledSize:](self, "_scaleROI:fullResolutionSize:downScaledSize:", v46, v52);
  if (v26)
  {
    int v44 = v26;
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_16;
  }
  double v47 = v13;
  BOOL v27 = v12;
  unsigned int v28 = [(FigMetalContext *)self->_metal allocator];
  id v29 = [v28 newTextureDescriptor];

  if (!v29)
  {
LABEL_18:
    int v44 = FigSignalErrorAt();
    id v10 = v48;
LABEL_20:
    unint64_t v13 = v47;
    goto LABEL_12;
  }
  double v30 = [v29 desc];
  [v30 setCompressionMode:2];

  id v31 = [v29 desc];
  [v31 setCompressionFootprint:0];

  v32 = [v29 desc];
  [v32 setUsage:7];

  uint64_t isa_low = LODWORD(self[1].super.isa);
  id v34 = [v29 desc];
  [v34 setWidth:isa_low];

  uint64_t isa_high = HIDWORD(self[1].super.isa);
  long long v36 = [v29 desc];
  [v36 setHeight:isa_high];

  unsigned int v37 = [v29 desc];
  [v37 setPixelFormat:25];

  [v29 setLabel:0];
  id v38 = [(FigMetalContext *)self->_metal allocator];
  id v39 = [v38 newTextureWithDescriptor:v29];
  id v56 = v39;

  if (!v39)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_18;
  }
  v40.f32[0] = (float)(unint64_t)v22;
  v40.f32[1] = (float)(unint64_t)v23;
  double v41 = COERCE_DOUBLE(vdiv_f32(*(float32x2_t *)&v52, v50));
  double v42 = COERCE_DOUBLE(vdiv_f32(v40, v50));
  id v10 = v48;
  if (v48) {
    [v48 tuningParams];
  }
  else {
    memset(v53, 0, sizeof(v53));
  }
  v54[4] = *(_OWORD *)((char *)&v53[4] + 8);
  v54[5] = *(_OWORD *)((char *)&v53[5] + 8);
  uint64_t v55 = *((void *)&v53[6] + 1);
  v54[0] = *(_OWORD *)((char *)v53 + 8);
  v54[1] = *(_OWORD *)((char *)&v53[1] + 8);
  v54[2] = *(_OWORD *)((char *)&v53[2] + 8);
  v54[3] = *(_OWORD *)((char *)&v53[3] + 8);
  unsigned int v43 = [(CMIVideoDeghostingBrightLightV1 *)self _detectionWithFullSizeLuma:v16 fullSizeChroma:v19 outputMask:v39 params:v54 maskToFullSizeLumaRatio:v27 maskToFullSizeChromaRatio:v41 inputIsHDR:v42];
  if (v43)
  {
    int v44 = v43;
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_20;
  }
  int v44 = [(CMIVideoDeghostingBrightLightV1 *)self _unCropMaskCropped:v39 maskOutput:v9];
  unint64_t v13 = v47;
  if (v44)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
LABEL_12:
  FigMetalDecRef();

  return v44;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_greenGhostCommon, 0);
  for (uint64_t i = 32; i != 8; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);

  objc_storeStrong((id *)&self->_metal, 0);
}

@end