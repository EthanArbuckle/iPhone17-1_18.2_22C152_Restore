@interface GreenGhostBrightLightStage
+ (int)prewarmShaders:(id)a3;
- (GreenGhostBrightLightStage)initWithMetalContext:(id)a3;
- (SidecarWriter)sidecarWriter;
- (float)computeMaxMaskSizeWithWidth:(unint64_t)a3 height:(unint64_t)a4 params:(BrightLightRepairTuning *)a5;
- (id)functionNameForProgram:(int)a3;
- (int)GhostMitigationWithPyr:(id)a3 outputImage:(id)a4 tuning:(id)a5 faceLandMarks:(id)a6 ev0FrameMetadata:(id)a7 roi:(id)a8 gainMap:;
- (int)applyRepairWithLuma:(id)a3 chroma:(id)a4 lumaBase:(id)a5 chromaBase:(id)a6 mask:(id)a7 output:(id)a8 params:(BrightLightRepairTuning *)a9 gainMap:(id)a10;
- (int)compileShaders;
- (int)computeRepairValuesWithLuma:(id)a3 chroma:(id)a4 mask:(id)a5 maskBinary:(id)a6 params:(BrightLightRepairTuning *)a7;
- (int)cropLuma:(id)a3 chroma:(id)a4 outputLuma:(id)a5 outputChroma:(id)a6;
- (int)detectionWithLuma:(id)a3 chroma:(id)a4 outputMask:(id)a5 outputMaskBinary:(id)a6 params:(BrightLightDetectionTuning *)a7;
- (int)processRepairValues;
- (int)refineMask:(id)a3 outputMask:(id)a4 outputMaskBinary:(id)a5 params:(BrightLightRefinementTuning)a6;
- (int)repairPyr:(id)a3 chroma:(id)a4 mask:(id)a5 maskBinary:(id)a6 output:(id)a7 params:(BrightLightRepairTuning *)a8 gainMap:(id)a9;
- (int)scaleROI:(GreenGhostBrightLightStage *)self fullResolutionSize:(SEL)a2 downScaledSize:;
- (int)unCropMaskCropped1:(id)a3 maskCropped2:(id)a4 maskOutput1:(id)a5 maskOutput2:(id)a6;
- (void)dealloc;
- (void)setSidecarWriter:(id)a3;
@end

@implementation GreenGhostBrightLightStage

- (GreenGhostBrightLightStage)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)GreenGhostBrightLightStage;
  v6 = [(GreenGhostBrightLightStage *)&v23 init];
  v7 = v6;
  if (!v6) {
    goto LABEL_12;
  }
  objc_storeStrong((id *)&v6->_metal, a3);
  v7->_detectionLvl = 2;
  if ([(GreenGhostBrightLightStage *)v7 compileShaders])
  {
    FigDebugAssert3();
    v19 = 0;
    goto LABEL_9;
  }
  v8 = [(FigMetalContext *)v7->_metal device];
  uint64_t v9 = [v8 newBufferWithLength:20 options:0];
  sumLumaChromaMask = v7->_sumLumaChromaMask;
  v7->_sumLumaChromaMask = (MTLBuffer *)v9;

  if (!v7->_sumLumaChromaMask) {
    goto LABEL_12;
  }
  v11 = [(FigMetalContext *)v7->_metal device];
  uint64_t v12 = [v11 newBufferWithLength:64 options:0];
  patchDistances = v7->_patchDistances;
  v7->_patchDistances = (MTLBuffer *)v12;

  if (!v7->_patchDistances) {
    goto LABEL_12;
  }
  v14 = [(FigMetalContext *)v7->_metal device];
  uint64_t v15 = [v14 newBufferWithLength:32 options:0];
  repairValues = v7->_repairValues;
  v7->_repairValues = (MTLBuffer *)v15;

  if (v7->_repairValues)
  {
    *(_OWORD *)&v7->_processingROIInfo.var0 = xmmword_263480590;
    *(_DWORD *)&v7->_anon_1d4[12] = 1065353216;
    v17 = [[GreenGhostCommon alloc] initWithMetalContext:v5];
    greenGhostCommon = v7->_greenGhostCommon;
    v7->_greenGhostCommon = v17;

    if (v7->_greenGhostCommon) {
      v7->_syncComputeMaskSize = 0;
    }
    else {
      FigDebugAssert3();
    }
  }
  else
  {
LABEL_12:
    FigDebugAssert3();
    int v22 = FigSignalErrorAt();
    v19 = 0;
    if (v22) {
      goto LABEL_9;
    }
  }
  v19 = v7;
LABEL_9:
  v20 = v19;

  return v20;
}

- (int)compileShaders
{
  metal = self->_metal;
  v4 = [(GreenGhostBrightLightStage *)self functionNameForProgram:0];
  id v5 = [(FigMetalContext *)metal computePipelineStateFor:v4 constants:0];
  v6 = self->_pipelineStates[0];
  self->_pipelineStates[0] = v5;

  if (self->_pipelineStates[0])
  {
    v7 = self->_metal;
    v8 = [(GreenGhostBrightLightStage *)self functionNameForProgram:1];
    uint64_t v9 = [(FigMetalContext *)v7 computePipelineStateFor:v8 constants:0];
    v10 = self->_pipelineStates[1];
    self->_pipelineStates[1] = v9;

    if (self->_pipelineStates[1])
    {
      v11 = self->_metal;
      uint64_t v12 = [(GreenGhostBrightLightStage *)self functionNameForProgram:2];
      v13 = [(FigMetalContext *)v11 computePipelineStateFor:v12 constants:0];
      v14 = self->_pipelineStates[2];
      self->_pipelineStates[2] = v13;

      if (self->_pipelineStates[2])
      {
        uint64_t v15 = self->_metal;
        v16 = [(GreenGhostBrightLightStage *)self functionNameForProgram:3];
        v17 = [(FigMetalContext *)v15 computePipelineStateFor:v16 constants:0];
        v18 = self->_pipelineStates[3];
        self->_pipelineStates[3] = v17;

        if (self->_pipelineStates[3])
        {
          v19 = self->_metal;
          v20 = [(GreenGhostBrightLightStage *)self functionNameForProgram:4];
          v21 = [(FigMetalContext *)v19 computePipelineStateFor:v20 constants:0];
          int v22 = self->_pipelineStates[4];
          self->_pipelineStates[4] = v21;

          if (self->_pipelineStates[4])
          {
            objc_super v23 = self->_metal;
            v24 = [(GreenGhostBrightLightStage *)self functionNameForProgram:5];
            v25 = [(FigMetalContext *)v23 computePipelineStateFor:v24 constants:0];
            v26 = self->_pipelineStates[5];
            self->_pipelineStates[5] = v25;

            if (self->_pipelineStates[5]) {
              return 0;
            }
          }
        }
      }
    }
  }
  FigDebugAssert3();

  return FigSignalErrorAt();
}

- (id)functionNameForProgram:(int)a3
{
  if (a3 < 6) {
    return off_2655C8178[a3];
  }
  FigDebugAssert3();
  return 0;
}

+ (int)prewarmShaders:(id)a3
{
  id v3 = a3;
  v4 = [[GreenGhostBrightLightStage alloc] initWithMetalContext:v3];

  if (v4) {
    int v5 = 0;
  }
  else {
    int v5 = -12786;
  }

  return v5;
}

- (void)dealloc
{
  sumLumaChromaMask = self->_sumLumaChromaMask;
  self->_sumLumaChromaMask = 0;

  patchDistances = self->_patchDistances;
  self->_patchDistances = 0;

  repairValues = self->_repairValues;
  self->_repairValues = 0;

  v6.receiver = self;
  v6.super_class = (Class)GreenGhostBrightLightStage;
  [(GreenGhostBrightLightStage *)&v6 dealloc];
}

- (int)scaleROI:(GreenGhostBrightLightStage *)self fullResolutionSize:(SEL)a2 downScaledSize:
{
  float32x2_t v5 = vdiv_f32(vcvt_f32_u32((uint32x2_t)v4), vcvt_f32_u32(v3));
  float32x2_t v6 = vmul_f32(v5, vcvt_f32_u32(*(uint32x2_t *)v2.i8));
  int32x2_t v7 = (int32x2_t)vcvt_u32_f32(vmul_f32(v5, vcvt_f32_u32((uint32x2_t)*(_OWORD *)&vextq_s8(v2, v2, 8uLL))));
  int32x2_t v8 = vadd_s32((int32x2_t)vand_s8((int8x8_t)v7, (int8x8_t)0x100000001), v7);
  float32x2_t v9 = vcvt_f32_u32(vmax_u32((uint32x2_t)vzip1_s32(v4, v8), (uint32x2_t)vzip2_s32(v4, v8)));
  *(uint32x2_t *)&long long v10 = vcvt_u32_f32(v6);
  *((int32x2_t *)&v10 + 1) = v8;
  *(_OWORD *)&self->_processingROIInfo.var0 = v10;
  *(_DWORD *)&self->_anon_1d4[12] = vdiv_f32(v9, (float32x2_t)vdup_lane_s32((int32x2_t)v9, 1)).u32[0];
  return 0;
}

- (int)cropLuma:(id)a3 chroma:(id)a4 outputLuma:(id)a5 outputChroma:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v24 = *(void *)&self->_processingROIInfo.var0;
  v14 = [(FigMetalContext *)self->_metal commandQueue];
  uint64_t v15 = [v14 commandBuffer];

  if (v15 && ([v15 computeCommandEncoder], (v16 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v17 = v16;
    [v16 setComputePipelineState:self->_pipelineStates[0]];
    [v17 setTexture:v10 atIndex:0];
    [v17 setTexture:v11 atIndex:1];
    [v17 setTexture:v12 atIndex:2];
    [v17 setTexture:v13 atIndex:3];
    [v17 setBytes:&v24 length:8 atIndex:0];
    unint64_t v18 = [(MTLComputePipelineState *)self->_pipelineStates[0] threadExecutionWidth];
    unint64_t v19 = [(MTLComputePipelineState *)self->_pipelineStates[0] maxTotalThreadsPerThreadgroup]/ v18;
    v23[0] = [v12 width];
    v23[1] = [v12 height];
    v23[2] = 1;
    v22[0] = v18;
    v22[1] = v19;
    v22[2] = 1;
    [v17 dispatchThreads:v23 threadsPerThreadgroup:v22];
    [v17 endEncoding];
    [v15 commit];

    int v20 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v20 = FigSignalErrorAt();
  }

  return v20;
}

- (int)unCropMaskCropped1:(id)a3 maskCropped2:(id)a4 maskOutput1:(id)a5 maskOutput2:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  long long v24 = *(_OWORD *)&self->_processingROIInfo.var0;
  if (([v12 width] & 1) != 0
    || ([v12 height] & 1) != 0
    || ([(FigMetalContext *)self->_metal commandQueue],
        v14 = objc_claimAutoreleasedReturnValue(),
        [v14 commandBuffer],
        uint64_t v15 = objc_claimAutoreleasedReturnValue(),
        v14,
        !v15))
  {
    FigDebugAssert3();
    int v20 = FigSignalErrorAt();
  }
  else
  {
    v16 = [v15 computeCommandEncoder];
    if (v16)
    {
      v17 = v16;
      [v16 setComputePipelineState:self->_pipelineStates[1]];
      [v17 setTexture:v10 atIndex:0];
      [v17 setTexture:v11 atIndex:1];
      [v17 setTexture:v12 atIndex:2];
      [v17 setTexture:v13 atIndex:3];
      [v17 setBytes:&v24 length:16 atIndex:0];
      unint64_t v18 = [(MTLComputePipelineState *)self->_pipelineStates[1] threadExecutionWidth];
      unint64_t v19 = [(MTLComputePipelineState *)self->_pipelineStates[1] maxTotalThreadsPerThreadgroup]/ v18;
      v23[0] = (unint64_t)[v12 width] >> 1;
      v23[1] = (unint64_t)[v12 height] >> 1;
      v23[2] = 1;
      v22[0] = v18;
      v22[1] = v19;
      v22[2] = 1;
      [v17 dispatchThreads:v23 threadsPerThreadgroup:v22];
      [v17 endEncoding];
      [v15 commit];

      int v20 = 0;
    }
    else
    {
      FigDebugAssert3();
      int v20 = FigSignalErrorAt();
    }
  }

  return v20;
}

- (int)refineMask:(id)a3 outputMask:(id)a4 outputMaskBinary:(id)a5 params:(BrightLightRefinementTuning)a6
{
  float var2 = a6.var2;
  float var1 = a6.var1;
  float var0 = a6.var0;
  BrightLightRefinementTuning v49 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v48 = 0;
  float v15 = *(float *)&self->_anon_1d4[12];
  if (([v12 width] & 1) != 0
    || ([v12 height] & 1) != 0
    || ([(FigMetalContext *)self->_metal allocator],
        v16 = objc_claimAutoreleasedReturnValue(),
        v17 = (void *)[v16 newTextureDescriptor],
        v16,
        !v17))
  {
    FigDebugAssert3();
    int v38 = FigSignalErrorAt();
    goto LABEL_11;
  }
  unint64_t v18 = [v17 desc];
  [v18 setCompressionMode:2];

  unint64_t v19 = [v17 desc];
  [v19 setCompressionFootprint:0];

  int v20 = [v17 desc];
  [v20 setUsage:7];

  uint64_t v21 = [v12 pixelFormat];
  int v22 = [v17 desc];
  [v22 setPixelFormat:v21];

  uint64_t v23 = [v12 width];
  long long v24 = [v17 desc];
  [v24 setWidth:v23];

  uint64_t v25 = [v12 height];
  v26 = [v17 desc];
  [v26 setHeight:v25];

  [v17 setLabel:0];
  v27 = [(FigMetalContext *)self->_metal allocator];
  v28 = (void *)[v27 newTextureWithDescriptor:v17];
  id v48 = v28;

  if (!v28) {
    goto LABEL_17;
  }
  float v30 = v15 * var0;
  *(float *)&double v29 = v30;
  int v31 = [(GreenGhostCommon *)self->_greenGhostCommon erodeTexture:v12 withNormalizedRadius:v28 output:v29];
  if (v31)
  {
    int v38 = v31;
    goto LABEL_16;
  }
  *(float *)&double v32 = v30;
  int v33 = [(GreenGhostCommon *)self->_greenGhostCommon dilateTexture:v28 withNormalizedRadius:v12 output:v32];
  if (v33)
  {
    int v38 = v33;
    goto LABEL_16;
  }
  greenGhostCommon = self->_greenGhostCommon;
  *(float *)&double v34 = var2;
  v36 = [NSNumber numberWithFloat:v34];
  *(float *)&double v37 = v15 * var1;
  int v38 = [(GreenGhostCommon *)greenGhostCommon dilateTexture:v12 withNormalizedRadius:v36 withThreshold:0 subtractTexture:v28 output:v37];

  if (v38)
  {
LABEL_16:
    FigDebugAssert3();
LABEL_18:

    goto LABEL_11;
  }
  v39 = [(FigMetalContext *)self->_metal commandQueue];
  v40 = [v39 commandBuffer];

  if (!v40)
  {
LABEL_17:
    FigDebugAssert3();
    int v38 = FigSignalErrorAt();
    goto LABEL_18;
  }
  v41 = [v40 computeCommandEncoder];
  if (v41)
  {
    v42 = v41;
    [v41 setComputePipelineState:self->_pipelineStates[2]];
    [v42 setTexture:v28 atIndex:0];
    [v42 setTexture:v12 atIndex:1];
    [v42 setTexture:v13 atIndex:2];
    [v42 setTexture:v14 atIndex:3];
    [v42 setBytes:&v49.var3 length:4 atIndex:0];
    unint64_t v43 = [(MTLComputePipelineState *)self->_pipelineStates[2] threadExecutionWidth];
    unint64_t v44 = [(MTLComputePipelineState *)self->_pipelineStates[2] maxTotalThreadsPerThreadgroup]/ v43;
    v47[0] = (unint64_t)[v12 width] >> 1;
    v47[1] = (unint64_t)[v12 height] >> 1;
    v47[2] = 1;
    v46[0] = v43;
    v46[1] = v44;
    v46[2] = 1;
    [v42 dispatchThreads:v47 threadsPerThreadgroup:v46];
    [v42 endEncoding];
    [v40 commit];
    FigMetalDecRef();

    int v38 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v38 = FigSignalErrorAt();
  }
LABEL_11:

  return v38;
}

- (int)detectionWithLuma:(id)a3 chroma:(id)a4 outputMask:(id)a5 outputMaskBinary:(id)a6 params:(BrightLightDetectionTuning *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v51 = 0;
  id v52 = 0;
  id v50 = 0;
  v16 = [(FigMetalContext *)self->_metal allocator];
  v17 = (void *)[v16 newTextureDescriptor];

  if (!v17)
  {
    FigDebugAssert3();
    int v46 = FigSignalErrorAt();
    goto LABEL_9;
  }
  id v48 = v15;
  unint64_t v18 = [v17 desc];
  [v18 setCompressionMode:2];

  unint64_t v19 = [v17 desc];
  [v19 setCompressionFootprint:0];

  int v20 = [v17 desc];
  [v20 setUsage:7];

  uint64_t v21 = [v14 width];
  int v22 = [v17 desc];
  [v22 setWidth:v21];

  uint64_t v23 = [v14 height];
  long long v24 = [v17 desc];
  [v24 setHeight:v23];

  uint64_t v25 = [v12 pixelFormat];
  v26 = [v17 desc];
  [v26 setPixelFormat:v25];

  [v17 setLabel:0];
  v27 = [(FigMetalContext *)self->_metal allocator];
  v28 = (void *)[v27 newTextureWithDescriptor:v17];
  id v51 = v28;

  if (!v28) {
    goto LABEL_14;
  }
  uint64_t v29 = [v13 pixelFormat];
  float v30 = [v17 desc];
  [v30 setPixelFormat:v29];

  [v17 setLabel:0];
  int v31 = [(FigMetalContext *)self->_metal allocator];
  double v32 = (void *)[v31 newTextureWithDescriptor:v17];
  id v50 = v32;

  if (!v32) {
    goto LABEL_14;
  }
  int v33 = [(GreenGhostBrightLightStage *)self cropLuma:v12 chroma:v13 outputLuma:v28 outputChroma:v32];
  if (v33)
  {
    int v46 = v33;
LABEL_16:
    FigDebugAssert3();
    goto LABEL_17;
  }
  uint64_t v34 = [v14 pixelFormat];
  v35 = [v17 desc];
  [v35 setPixelFormat:v34];

  [v17 setLabel:0];
  v36 = [(FigMetalContext *)self->_metal allocator];
  double v37 = (void *)[v36 newTextureWithDescriptor:v17];
  id v52 = v37;

  if (!v37)
  {
LABEL_14:
    FigDebugAssert3();
    int v46 = FigSignalErrorAt();
LABEL_17:
    id v15 = v48;
    goto LABEL_9;
  }
  greenGhostCommon = self->_greenGhostCommon;
  long long v39 = *(_OWORD *)&a7[1].var0.var0.var1;
  v49[2] = *(_OWORD *)&a7->var1.var1;
  v49[3] = v39;
  v49[4] = *(_OWORD *)&a7[1].var0.var2.var1;
  long long v40 = *(_OWORD *)&a7->var0.var2.var0;
  v49[0] = *(_OWORD *)&a7->var0.var0.var0;
  v49[1] = v40;
  int v41 = [(GreenGhostCommon *)greenGhostCommon detectionWithLuma:v12 croppedLuma:v28 chroma:v32 outputMask:v37 params:v49 processingROIInfo:&self->_processingROIInfo];
  if (v41)
  {
    int v46 = v41;
    goto LABEL_16;
  }
  *(float *)&double v42 = a7[1].var1.var2;
  *(float *)&double v43 = a7[1].var1.var3;
  *(float *)&double v44 = a7[2].var0.var0.var0;
  *(float *)&double v45 = a7[2].var0.var0.var1;
  id v15 = v48;
  int v46 = -[GreenGhostBrightLightStage refineMask:outputMask:outputMaskBinary:params:](self, "refineMask:outputMask:outputMaskBinary:params:", v37, v14, v48, v42, v43, v44, v45);
  if (v46)
  {
    FigDebugAssert3();
  }
  else
  {
    FigMetalDecRef();
    FigMetalDecRef();
    FigMetalDecRef();
  }
LABEL_9:

  return v46;
}

- (int)processRepairValues
{
  uint32x2_t v3 = [(FigMetalContext *)self->_metal commandQueue];
  int32x2_t v4 = [v3 commandBuffer];

  if (v4 && ([v4 computeCommandEncoder], (float32x2_t v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    float32x2_t v6 = v5;
    [v5 setComputePipelineState:self->_pipelineStates[4]];
    [v6 setBuffer:self->_sumLumaChromaMask offset:0 atIndex:0];
    [v6 setBuffer:self->_patchDistances offset:0 atIndex:1];
    [v6 setBuffer:self->_repairValues offset:0 atIndex:2];
    unint64_t v7 = [(MTLComputePipelineState *)self->_pipelineStates[4] threadExecutionWidth];
    unint64_t v8 = [(MTLComputePipelineState *)self->_pipelineStates[4] maxTotalThreadsPerThreadgroup];
    int64x2_t v12 = vdupq_n_s64(1uLL);
    uint64_t v13 = 1;
    v11[0] = v7;
    v11[1] = v8 / v7;
    v11[2] = 1;
    [v6 dispatchThreads:&v12 threadsPerThreadgroup:v11];
    [v6 endEncoding];
    [v4 commit];

    int v9 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v9 = FigSignalErrorAt();
  }

  return v9;
}

- (int)computeRepairValuesWithLuma:(id)a3 chroma:(id)a4 mask:(id)a5 maskBinary:(id)a6 params:(BrightLightRepairTuning *)a7
{
  id v12 = a3;
  id v49 = a4;
  id v50 = a5;
  id v13 = a6;
  float var2 = a7->var2;
  unint64_t v15 = [v12 width];
  if (v15 <= [v12 height]) {
    unint64_t v16 = [v12 height];
  }
  else {
    unint64_t v16 = [v12 width];
  }
  float v55 = var2 * (float)v16;
  id v53 = 0;
  id v54 = 0;
  v17 = [(FigMetalContext *)self->_metal allocator];
  unint64_t v18 = (void *)[v17 newTextureDescriptor];

  if (!v18) {
    goto LABEL_24;
  }
  unint64_t v19 = [v18 desc];
  [v19 setCompressionMode:2];

  int v20 = [v18 desc];
  [v20 setCompressionFootprint:0];

  uint64_t v21 = [v18 desc];
  [v21 setUsage:7];

  uint64_t v22 = [v50 pixelFormat];
  uint64_t v23 = [v18 desc];
  [v23 setPixelFormat:v22];

  uint64_t v24 = [v50 width];
  uint64_t v25 = [v18 desc];
  [v25 setWidth:v24];

  uint64_t v26 = [v50 height];
  v27 = [v18 desc];
  [v27 setHeight:v26];

  [v18 setLabel:0];
  v28 = [(FigMetalContext *)self->_metal allocator];
  uint64_t v29 = (void *)[v28 newTextureWithDescriptor:v18];
  id v54 = v29;

  if (!v29) {
    goto LABEL_24;
  }
  *(float *)&double v30 = a7->var0;
  int v31 = [(GreenGhostCommon *)self->_greenGhostCommon dilateTexture:v13 withNormalizedRadius:0 withThreshold:v13 subtractTexture:v29 output:v30];
  if (v31)
  {
    int v46 = v31;
LABEL_23:
    FigDebugAssert3();
    goto LABEL_17;
  }
  [v18 setLabel:0];
  double v32 = [(FigMetalContext *)self->_metal allocator];
  int v33 = (void *)[v32 newTextureWithDescriptor:v18];
  id v53 = v33;

  if (!v33) {
    goto LABEL_24;
  }
  *(float *)&double v34 = a7->var1;
  int v35 = [(GreenGhostCommon *)self->_greenGhostCommon dilateTexture:v50 withNormalizedRadius:0 withThreshold:v50 subtractTexture:v33 output:v34];
  if (v35)
  {
    int v46 = v35;
    goto LABEL_23;
  }
  v36 = [(FigMetalContext *)self->_metal commandQueue];
  double v37 = [v36 commandBuffer];

  if (!v37)
  {
LABEL_24:
    FigDebugAssert3();
    int v46 = FigSignalErrorAt();
    goto LABEL_17;
  }
  int v38 = [v37 blitCommandEncoder];
  if (v38)
  {
    long long v39 = v38;
    id v48 = v13;
    objc_msgSend(v38, "fillBuffer:range:value:", self->_sumLumaChromaMask, 0, -[MTLBuffer length](self->_sumLumaChromaMask, "length"), 0);
    objc_msgSend(v39, "fillBuffer:range:value:", self->_patchDistances, 0, -[MTLBuffer length](self->_patchDistances, "length"), 0);
    [v39 endEncoding];
    [v37 commit];
    long long v40 = [(FigMetalContext *)self->_metal commandQueue];
    int v41 = [v40 commandBuffer];

    if (v41)
    {
      double v42 = [v41 computeCommandEncoder];
      if (v42)
      {
        double v43 = v42;
        [v42 setComputePipelineState:self->_pipelineStates[3]];
        [v43 setTexture:v12 atIndex:0];
        [v43 setTexture:v49 atIndex:1];
        [v43 setTexture:v29 atIndex:2];
        [v43 setTexture:v33 atIndex:3];
        [v43 setBuffer:self->_sumLumaChromaMask offset:0 atIndex:0];
        [v43 setBuffer:self->_patchDistances offset:0 atIndex:1];
        [v43 setBytes:&v55 length:4 atIndex:2];
        unint64_t v44 = [(MTLComputePipelineState *)self->_pipelineStates[3] threadExecutionWidth];
        unint64_t v45 = [(MTLComputePipelineState *)self->_pipelineStates[3] maxTotalThreadsPerThreadgroup]/ v44;
        v52[0] = [v12 width];
        v52[1] = [v12 height];
        v52[2] = 1;
        v51[0] = v44;
        v51[1] = v45;
        v51[2] = 1;
        [v43 dispatchThreads:v52 threadsPerThreadgroup:v51];
        [v43 endEncoding];
        [v41 commit];
        int v46 = [(GreenGhostBrightLightStage *)self processRepairValues];
        if (v46)
        {
          FigDebugAssert3();
        }
        else
        {
          FigMetalDecRef();
          FigMetalDecRef();
        }
      }
      else
      {
        FigDebugAssert3();
        int v46 = FigSignalErrorAt();
      }
    }
    else
    {
      FigDebugAssert3();
      int v46 = FigSignalErrorAt();
    }
    id v13 = v48;
  }
  else
  {
    FigDebugAssert3();
    int v46 = FigSignalErrorAt();
  }
LABEL_17:

  return v46;
}

- (float)computeMaxMaskSizeWithWidth:(unint64_t)a3 height:(unint64_t)a4 params:(BrightLightRepairTuning *)a5
{
  float var8 = a5->var8;
  float v6 = sqrtf(var8);
  return (float)((float)((float)((float)(v6 + (float)(a5->var0 * 2.0)) * (float)(v6 + (float)(a5->var0 * 2.0))) - var8)
               * (float)a3)
       * (float)a4;
}

- (int)applyRepairWithLuma:(id)a3 chroma:(id)a4 lumaBase:(id)a5 chromaBase:(id)a6 mask:(id)a7 output:(id)a8 params:(BrightLightRepairTuning *)a9 gainMap:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  uint64_t v21 = a8;
  id v22 = a10;
  unint64_t v23 = [v16 width];
  if (v23 <= [v16 height]) {
    unint64_t v24 = [v16 height];
  }
  else {
    unint64_t v24 = [v16 width];
  }
  a9->float var2 = a9->var2 * (float)v24;
  -[GreenGhostBrightLightStage computeMaxMaskSizeWithWidth:height:params:](self, "computeMaxMaskSizeWithWidth:height:params:", [v20 width], objc_msgSend(v20, "height"), a9);
  int v40 = v25;
  if (v22 && [v22 isCompressed])
  {
    FigDebugAssert3();
    int v33 = FigSignalErrorAt();
    goto LABEL_9;
  }
  int v35 = v21;
  id v26 = v17;
  v27 = [(FigMetalContext *)self->_metal commandQueue];
  v28 = [v27 commandBuffer];

  if (!v28)
  {
    FigDebugAssert3();
    int v33 = FigSignalErrorAt();
LABEL_12:
    id v17 = v26;
    uint64_t v21 = v35;
    goto LABEL_9;
  }
  uint64_t v29 = [v28 computeCommandEncoder];
  if (!v29)
  {
    FigDebugAssert3();
    int v33 = FigSignalErrorAt();

    goto LABEL_12;
  }
  double v30 = v29;
  [v29 setComputePipelineState:self->_pipelineStates[5]];
  [v30 setTexture:v16 atIndex:0];
  id v36 = v20;
  id v31 = v22;
  double v32 = v26;
  [v30 setTexture:v26 atIndex:1];
  [v30 setTexture:v18 atIndex:2];
  [v30 setTexture:v19 atIndex:3];
  [v30 setTexture:v36 atIndex:4];
  uint64_t v21 = v35;
  [v30 setTexture:v35[2] atIndex:5];
  [v30 setTexture:v35[3] atIndex:6];
  [v30 setTexture:v31 atIndex:7];
  [v30 setBuffer:self->_repairValues offset:0 atIndex:0];
  [v30 setBytes:a9 length:36 atIndex:1];
  [v30 setBytes:&self->_faceBodyBoundaries length:352 atIndex:2];
  [v30 setBytes:&v40 length:4 atIndex:3];
  v39[0] = [v16 width];
  v39[1] = [v16 height];
  v39[2] = 1;
  long long v37 = xmmword_263380150;
  uint64_t v38 = 1;
  [v30 dispatchThreads:v39 threadsPerThreadgroup:&v37];
  [v30 endEncoding];
  [v28 commit];

  id v17 = v32;
  id v22 = v31;
  id v20 = v36;
  int v33 = 0;
LABEL_9:

  return v33;
}

- (int)repairPyr:(id)a3 chroma:(id)a4 mask:(id)a5 maskBinary:(id)a6 output:(id)a7 params:(BrightLightRepairTuning *)a8 gainMap:(id)a9
{
  unint64_t v15 = a3;
  id v44 = a4;
  id v16 = a5;
  id v45 = a6;
  id v17 = a7;
  id v46 = a9;
  id v51 = 0;
  id v18 = [(FigMetalContext *)self->_metal allocator];
  id v19 = (void *)[v18 newTextureDescriptor];

  v47 = v15;
  if (!v19) {
    goto LABEL_8;
  }
  id v20 = [v19 desc];
  [v20 setCompressionMode:2];

  uint64_t v21 = [v19 desc];
  [v21 setCompressionFootprint:0];

  id v22 = [v19 desc];
  [v22 setUsage:7];

  uint64_t v23 = [v16 pixelFormat];
  unint64_t v24 = [v19 desc];
  [v24 setPixelFormat:v23];

  uint64_t v25 = [v16 width];
  id v26 = [v19 desc];
  [v26 setWidth:v25];

  uint64_t v27 = [v16 height];
  v28 = [v19 desc];
  [v28 setHeight:v27];

  [v19 setLabel:0];
  uint64_t v29 = [(FigMetalContext *)self->_metal allocator];
  double v30 = (void *)[v29 newTextureWithDescriptor:v19];
  id v51 = v30;

  if (!v30)
  {
LABEL_8:
    FigDebugAssert3();
    int v42 = FigSignalErrorAt();
LABEL_10:
    double v34 = v44;
    int v35 = v45;
LABEL_12:
    int v41 = v46;
    goto LABEL_7;
  }
  int v31 = [(GreenGhostCommon *)self->_greenGhostCommon downscaleInput:v15[42] output:v30];
  if (v31)
  {
    int v42 = v31;
    FigDebugAssert3();
    goto LABEL_10;
  }
  long long v32 = *(_OWORD *)&a8->var4;
  long long v48 = *(_OWORD *)&a8->var0;
  long long v49 = v32;
  float var8 = a8->var8;
  int v33 = v30;
  double v34 = v44;
  int v35 = v45;
  int v36 = [(GreenGhostBrightLightStage *)self computeRepairValuesWithLuma:v33 chroma:v44 mask:v16 maskBinary:v45 params:&v48];
  if (v36)
  {
    int v42 = v36;
    FigDebugAssert3();
    goto LABEL_12;
  }
  FigMetalDecRef();
  uint64_t v37 = v47[42];
  uint64_t v38 = v47[62];
  uint64_t v39 = v47[self->_detectionLvl + 42];
  long long v40 = *(_OWORD *)&a8->var4;
  long long v48 = *(_OWORD *)&a8->var0;
  long long v49 = v40;
  float var8 = a8->var8;
  int v41 = v46;
  int v42 = [(GreenGhostBrightLightStage *)self applyRepairWithLuma:v37 chroma:v38 lumaBase:v39 chromaBase:v44 mask:v16 output:v17 params:&v48 gainMap:v46];
  if (v42) {
    FigDebugAssert3();
  }
LABEL_7:

  return v42;
}

- (int)GhostMitigationWithPyr:(id)a3 outputImage:(id)a4 tuning:(id)a5 faceLandMarks:(id)a6 ev0FrameMetadata:(id)a7 roi:(id)a8 gainMap:
{
  double v67 = v9;
  id v16 = (id *)a3;
  v68 = (id *)a4;
  id v72 = a5;
  id v71 = a6;
  id v70 = a7;
  id v69 = a8;
  id v104 = 0;
  id v105 = 0;
  id v102 = 0;
  id v103 = 0;
  id v101 = 0;
  uint64_t v17 = [v16[self->_detectionLvl + 61] width];
  uint64_t v18 = [v16[self->_detectionLvl + 61] height];
  unsigned int v19 = [v16[42] width];
  unsigned int v20 = [v16[42] height];
  uint64_t v21 = [(FigMetalContext *)self->_metal allocator];
  id v22 = (void *)[v21 newTextureDescriptor];

  if (!v22)
  {
    uint64_t v66 = v8;
    LODWORD(v65) = 0;
LABEL_29:
    FigDebugAssert3();
    int v59 = FigSignalErrorAt();
LABEL_31:
    int v33 = v68;
LABEL_41:
    float v55 = v72;
    goto LABEL_23;
  }
  uint64_t v23 = [v22 desc];
  [v23 setCompressionMode:2];

  unint64_t v24 = [v22 desc];
  [v24 setCompressionFootprint:0];

  uint64_t v25 = [v22 desc];
  [v25 setUsage:7];

  id v26 = [v22 desc];
  [v26 setPixelFormat:65];

  uint64_t v27 = [v22 desc];
  [v27 setWidth:v17];

  v28 = [v22 desc];
  [v28 setHeight:v18];

  [v22 setLabel:0];
  uint64_t v29 = [(FigMetalContext *)self->_metal allocator];
  double v30 = (void *)[v29 newTextureWithDescriptor:v22];
  id v105 = v30;

  if (!v30)
  {
    uint64_t v66 = v8;
    LODWORD(v65) = 0;
    goto LABEL_29;
  }
  int v31 = [(GreenGhostCommon *)self->_greenGhostCommon downscaleInput:v16[self->_detectionLvl + 60] output:v30];
  if (v31)
  {
    int v59 = v31;
    uint64_t v66 = v8;
    LODWORD(v65) = v31;
    FigDebugAssert3();
    goto LABEL_31;
  }
  int v32 = [(GreenGhostBrightLightStage *)self scaleROI:v67 fullResolutionSize:COERCE_DOUBLE(__PAIR64__(v20, v19)) downScaledSize:COERCE_DOUBLE(__PAIR64__(v18, v17))];
  int v33 = v68;
  if (v32)
  {
    int v59 = v32;
    uint64_t v66 = v8;
    LODWORD(v65) = v32;
LABEL_40:
    FigDebugAssert3();
    goto LABEL_41;
  }
  uint64_t v34 = *(unsigned int *)&self->_anon_1d4[4];
  int v35 = [v22 desc];
  [v35 setWidth:v34];

  uint64_t v36 = *(unsigned int *)&self->_anon_1d4[8];
  uint64_t v37 = [v22 desc];
  [v37 setHeight:v36];

  uint64_t v38 = [v22 desc];
  [v38 setPixelFormat:25];

  [v22 setLabel:0];
  uint64_t v39 = [(FigMetalContext *)self->_metal allocator];
  long long v40 = (void *)[v39 newTextureWithDescriptor:v22];
  id v102 = v40;

  if (!v40)
  {
    uint64_t v66 = v8;
    LODWORD(v65) = 0;
LABEL_38:
    FigDebugAssert3();
    int v59 = FigSignalErrorAt();
    goto LABEL_41;
  }
  [v22 setLabel:0];
  int v41 = [(FigMetalContext *)self->_metal allocator];
  int v42 = (void *)[v41 newTextureWithDescriptor:v22];
  id v101 = v42;

  if (!v42)
  {
    uint64_t v66 = v8;
    LODWORD(v65) = 0;
    goto LABEL_38;
  }
  id v43 = v16[self->_detectionLvl + 42];
  if (v72)
  {
    [v72 tuningParams];
  }
  else
  {
    uint64_t v99 = 0;
    long long v97 = 0u;
    long long v98 = 0u;
    long long v95 = 0u;
    long long v96 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
  }
  v100[2] = v93;
  v100[3] = v94;
  v100[4] = v95;
  v100[5] = v96;
  v100[0] = v91;
  v100[1] = v92;
  int v44 = [(GreenGhostBrightLightStage *)self detectionWithLuma:v43 chroma:v30 outputMask:v40 outputMaskBinary:v42 params:v100];
  if (v44)
  {
    int v59 = v44;
    uint64_t v66 = v8;
    LODWORD(v65) = v44;
    goto LABEL_40;
  }
  id v45 = [v22 desc];
  [v45 setWidth:v17];

  id v46 = [v22 desc];
  [v46 setHeight:v18];

  [v22 setLabel:0];
  v47 = [(FigMetalContext *)self->_metal allocator];
  long long v48 = (void *)[v47 newTextureWithDescriptor:v22];
  id v104 = v48;

  if (!v48)
  {
    uint64_t v66 = v8;
    LODWORD(v65) = 0;
    goto LABEL_38;
  }
  [v22 setLabel:0];
  long long v49 = [(FigMetalContext *)self->_metal allocator];
  id v50 = (void *)[v49 newTextureWithDescriptor:v22];
  id v103 = v50;

  if (!v50)
  {
    uint64_t v66 = v8;
    LODWORD(v65) = 0;
    goto LABEL_38;
  }
  int v51 = [(GreenGhostBrightLightStage *)self unCropMaskCropped1:v40 maskCropped2:v42 maskOutput1:v48 maskOutput2:v50];
  if (v51)
  {
    int v59 = v51;
    uint64_t v66 = v8;
    LODWORD(v65) = v51;
    goto LABEL_40;
  }
  FigMetalDecRef();
  FigMetalDecRef();
  double v52 = (double)(unint64_t)[v68[2] width];
  double v53 = (double)(unint64_t)[v68[2] height];
  greenGhostCommon = self->_greenGhostCommon;
  float v55 = v72;
  if (v72)
  {
    [v72 tuningParams];
    double v56 = *((double *)&v78 + 1);
  }
  else
  {
    uint64_t v88 = 0;
    long long v86 = 0u;
    long long v87 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    double v56 = 0.0;
    long long v78 = 0u;
    long long v79 = 0u;
  }
  int v57 = -[GreenGhostCommon extractFaceBodyBoundariesFromFaceLandMarks:ev0FrameMetadata:imgSize:faceBoundaryPaddingRatio:bodyBoundaryPaddingRatio:output:](greenGhostCommon, "extractFaceBodyBoundariesFromFaceLandMarks:ev0FrameMetadata:imgSize:faceBoundaryPaddingRatio:bodyBoundaryPaddingRatio:output:", v71, v70, &self->_faceBodyBoundaries, v52, v53, v56, COERCE_DOUBLE(1036831949));
  if (v57)
  {
    int v59 = v57;
    uint64_t v66 = v8;
    LODWORD(v65) = v57;
  }
  else
  {
    if (v72)
    {
      [v72 tuningParams];
    }
    else
    {
      int v75 = 0;
      long long v73 = 0u;
      long long v74 = 0u;
    }
    v76[0] = v73;
    v76[1] = v74;
    int v77 = v75;
    int v58 = [(GreenGhostBrightLightStage *)self repairPyr:v16 chroma:v30 mask:v48 maskBinary:v50 output:v68 params:v76 gainMap:v69];
    int v59 = v58;
    if (!v58)
    {
      FigMetalDecRef();
      FigMetalDecRef();
      FigMetalDecRef();
      goto LABEL_23;
    }
    uint64_t v66 = v8;
    LODWORD(v65) = v58;
  }
  FigDebugAssert3();
LABEL_23:
  v60 = objc_opt_new();
  if (self->_faceBodyBoundaries.nFaces) {
    BOOL v61 = 1;
  }
  else {
    BOOL v61 = *(_DWORD *)&self->_anon_74[172] != 0;
  }
  v62 = objc_msgSend(NSNumber, "numberWithInt:", v61, v65, v66);
  [v60 setObject:v62 forKeyedSubscript:@"foundFacesOrBodies"];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_sidecarWriter);
  [WeakRetained addToSidecar:v60 forKey:@"GreenGhostBrightLight"];

  return v59;
}

- (SidecarWriter)sidecarWriter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sidecarWriter);

  return (SidecarWriter *)WeakRetained;
}

- (void)setSidecarWriter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sidecarWriter);
  objc_storeStrong((id *)&self->_repairValues, 0);
  objc_storeStrong((id *)&self->_patchDistances, 0);
  objc_storeStrong((id *)&self->_sumLumaChromaMask, 0);
  objc_storeStrong((id *)&self->_greenGhostCommon, 0);
  for (uint64_t i = 56; i != 8; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);

  objc_storeStrong((id *)&self->_metal, 0);
}

@end