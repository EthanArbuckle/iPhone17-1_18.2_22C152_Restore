@interface GreenGhostLowLightStage
+ (int)prewarmShaders:(id)a3;
- (GreenGhostLowLightStage)initWithMetalContext:(id)a3;
- (SidecarWriter)sidecarWriter;
- (id)functionNameForProgram:(int)a3;
- (int)allocateFusionWeightTexturesWithWidth:(unint64_t)a3 height:(unint64_t)a4;
- (int)applyInpaintWithDownscaledLuma:(id)a3 propagatedLuma:(id)a4 downscaledChroma:(id)a5 propagatedChroma:(id)a6 propagatedGradient:(id)a7 maskPreInpainting:(id)a8 outputLuma:(id)a9 outputChroma:(id)a10 params:(LowLightInpaintTuning *)a11;
- (int)canMitigationProceedWithMaxMaskAverage:(float)a3;
- (int)compileShaders;
- (int)detectionWithRefPyramid:(id)a3 otherPyramid:(id)a4 refDetection:(BOOL)a5 refProperties:(id)a6 otherProperties:(id)a7 maskMBBinary:(id)a8 params:(LowLightTuning *)a9;
- (int)fuseRefPyramid:(id)a3 withOtherPyramid:(id)a4 refProperties:(id)a5 otherProperties:(id)a6 currentFusionWeights:(id)a7 relativeBrightness:(float)a8;
- (int)fuseRefPyramid:(id)a3 withOtherPyramid:(id)a4 refProperties:(id)a5 otherProperties:(id)a6 maskMBBinary:(id)a7 params:(LowLightFusionTuning *)a8;
- (int)guidedFilter:(id)a3 withGuideLuma:(id)a4 guideChroma:(id)a5 params:(LowLightRefinementTuning *)a6 output:(id)a7;
- (int)inpaintLuma:(id)a3 andChroma:(id)a4 tuningParams:(id)a5;
- (int)mitigationWithRefPyramid:(id)a3 otherPyramid:(id)a4 isRefProcessing:(BOOL)a5 refProperties:(id)a6 otherProperties:(id)a7 greenGhostBuffers:(id)a8 tuningParams:(id)a9;
- (int)mixFusedTexturesWithRefLuma:(id)a3 refChroma:(id)a4 refProperties:(id)a5 tuningParams:(id)a6;
- (int)prepareInpaintingWithLuma:(id)a3 andChroma:(id)a4 outputLuma:(id)a5 outputChroma:(id)a6 outputGradient:(id)a7 params:(LowLightInpaintTuning *)a8;
- (int)propagateLuma:(id)a3 chroma:(id)a4 gradient:(id)a5 outputLuma:(id)a6 outputChroma:(id)a7 outputGradient:(id)a8 params:(LowLightInpaintTuning *)a9;
- (int)refineDetectionWithGuideLuma:(id)a3 guideChroma:(id)a4 params:(LowLightRefinementTuning *)a5 output:(id)a6;
- (int)singleBracketDetectionWithLuma:(id)a3 chroma:(id)a4 params:(DetectionTuning *)a5;
- (int)updateFusionWeights:(id)a3;
- (int)updateMaskAndComputeGradientForLuma:(id)a3 output:(id)a4 params:(LowLightInpaintTuning *)a5;
- (uint64_t)computeFusionWeightsRefLuma:(__n128)a3 refChroma:(__n128)a4 otherLuma:(__n128)a5 otherChroma:(uint64_t)a6 maskMBBinary:(void *)a7 innerMask:(void *)a8 relativeBrightness:(void *)a9 homography:(void *)a10 output:(void *)a11 params:(void *)a12;
- (uint64_t)computeTemporalVariationsRefImg:(uint64_t)a3 OtherImg:(void *)a4 refProperties:(void *)a5 otherProperties:(void *)a6 params:(void *)a7;
- (uint64_t)prepareFusionRefLuma:(double)a3 refChroma:(double)a4 otherLuma:(double)a5 otherChroma:(uint64_t)a6 maskMBBinary:(void *)a7 relativeBrightness:(void *)a8 homography:(void *)a9 output:(void *)a10 params:(void *)a11;
- (void)dealloc;
- (void)releaseTextures;
- (void)reset;
- (void)scaleFaceBodyBoundariesWithSizeRatio:(float)a3;
- (void)setSidecarWriter:(id)a3;
@end

@implementation GreenGhostLowLightStage

- (id)functionNameForProgram:(int)a3
{
  if (a3 < 0xD) {
    return off_2655C8110[a3];
  }
  FigDebugAssert3();
  return 0;
}

- (int)compileShaders
{
  metal = self->_metal;
  v4 = [(GreenGhostLowLightStage *)self functionNameForProgram:0];
  v5 = [(FigMetalContext *)metal computePipelineStateFor:v4 constants:0];
  v6 = self->_pipelineStates[0];
  self->_pipelineStates[0] = v5;

  if (self->_pipelineStates[0])
  {
    v7 = self->_metal;
    v8 = [(GreenGhostLowLightStage *)self functionNameForProgram:1];
    v9 = [(FigMetalContext *)v7 computePipelineStateFor:v8 constants:0];
    v10 = self->_pipelineStates[1];
    self->_pipelineStates[1] = v9;

    if (self->_pipelineStates[1])
    {
      v11 = self->_metal;
      v12 = [(GreenGhostLowLightStage *)self functionNameForProgram:2];
      v13 = [(FigMetalContext *)v11 computePipelineStateFor:v12 constants:0];
      v14 = self->_pipelineStates[2];
      self->_pipelineStates[2] = v13;

      if (self->_pipelineStates[2])
      {
        v15 = self->_metal;
        v16 = [(GreenGhostLowLightStage *)self functionNameForProgram:3];
        v17 = [(FigMetalContext *)v15 computePipelineStateFor:v16 constants:0];
        v18 = self->_pipelineStates[3];
        self->_pipelineStates[3] = v17;

        if (self->_pipelineStates[3])
        {
          v19 = self->_metal;
          v20 = [(GreenGhostLowLightStage *)self functionNameForProgram:4];
          v21 = [(FigMetalContext *)v19 computePipelineStateFor:v20 constants:0];
          v22 = self->_pipelineStates[4];
          self->_pipelineStates[4] = v21;

          if (self->_pipelineStates[4])
          {
            v23 = self->_metal;
            v24 = [(GreenGhostLowLightStage *)self functionNameForProgram:5];
            v25 = [(FigMetalContext *)v23 computePipelineStateFor:v24 constants:0];
            v26 = self->_pipelineStates[5];
            self->_pipelineStates[5] = v25;

            if (self->_pipelineStates[5])
            {
              v27 = self->_metal;
              v28 = [(GreenGhostLowLightStage *)self functionNameForProgram:6];
              v29 = [(FigMetalContext *)v27 computePipelineStateFor:v28 constants:0];
              v30 = self->_pipelineStates[6];
              self->_pipelineStates[6] = v29;

              if (self->_pipelineStates[6])
              {
                v31 = self->_metal;
                v32 = [(GreenGhostLowLightStage *)self functionNameForProgram:7];
                v33 = [(FigMetalContext *)v31 computePipelineStateFor:v32 constants:0];
                v34 = self->_pipelineStates[7];
                self->_pipelineStates[7] = v33;

                if (self->_pipelineStates[7])
                {
                  v35 = self->_metal;
                  v36 = [(GreenGhostLowLightStage *)self functionNameForProgram:8];
                  v37 = [(FigMetalContext *)v35 computePipelineStateFor:v36 constants:0];
                  v38 = self->_pipelineStates[8];
                  self->_pipelineStates[8] = v37;

                  if (self->_pipelineStates[8])
                  {
                    v39 = self->_metal;
                    v40 = [(GreenGhostLowLightStage *)self functionNameForProgram:9];
                    v41 = [(FigMetalContext *)v39 computePipelineStateFor:v40 constants:0];
                    v42 = self->_pipelineStates[9];
                    self->_pipelineStates[9] = v41;

                    if (self->_pipelineStates[9])
                    {
                      v43 = self->_metal;
                      v44 = [(GreenGhostLowLightStage *)self functionNameForProgram:10];
                      v45 = [(FigMetalContext *)v43 computePipelineStateFor:v44 constants:0];
                      v46 = self->_pipelineStates[10];
                      self->_pipelineStates[10] = v45;

                      if (self->_pipelineStates[10])
                      {
                        v47 = self->_metal;
                        v48 = [(GreenGhostLowLightStage *)self functionNameForProgram:11];
                        v49 = [(FigMetalContext *)v47 computePipelineStateFor:v48 constants:0];
                        v50 = self->_pipelineStates[11];
                        self->_pipelineStates[11] = v49;

                        if (self->_pipelineStates[11])
                        {
                          v51 = self->_metal;
                          v52 = [(GreenGhostLowLightStage *)self functionNameForProgram:12];
                          v53 = [(FigMetalContext *)v51 computePipelineStateFor:v52 constants:0];
                          v54 = self->_pipelineStates[12];
                          self->_pipelineStates[12] = v53;

                          if (self->_pipelineStates[12]) {
                            return 0;
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  FigDebugAssert3();

  return FigSignalErrorAt();
}

- (GreenGhostLowLightStage)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)GreenGhostLowLightStage;
  v6 = [(GreenGhostLowLightStage *)&v19 init];
  v7 = v6;
  if (!v6) {
    goto LABEL_8;
  }
  objc_storeStrong((id *)&v6->_metal, a3);
  *(void *)&v7->_detectionLvl = 2;
  v7->_nonRefFramesCount = 0;
  v7->_isFirstNonRefFrame = 1;
  v7->_canMitigationProceed = 1;
  v8 = [(FigMetalContext *)v7->_metal device];
  uint64_t v9 = [v8 newBufferWithLength:4 options:0];
  sumMaskBuffer = v7->_sumMaskBuffer;
  v7->_sumMaskBuffer = (MTLBuffer *)v9;

  if (v7->_sumMaskBuffer)
  {
    if ([(GreenGhostLowLightStage *)v7 compileShaders])
    {
      FigDebugAssert3();
      v15 = 0;
      goto LABEL_7;
    }
    v11 = [[GreenGhostCommon alloc] initWithMetalContext:v5];
    greenGhostCommon = v7->_greenGhostCommon;
    v7->_greenGhostCommon = v11;

    if (!v7->_greenGhostCommon
      || (v13 = [[TextureUtils alloc] initWithMetalContext:v5], textureUtils = v7->_textureUtils, v7->_textureUtils = v13, textureUtils, !v7->_textureUtils))
    {
      FigDebugAssert3();
    }
  }
  else
  {
LABEL_8:
    FigDebugAssert3();
    int v18 = FigSignalErrorAt();
    v15 = 0;
    if (v18) {
      goto LABEL_7;
    }
  }
  v15 = v7;
LABEL_7:
  v16 = v15;

  return v16;
}

+ (int)prewarmShaders:(id)a3
{
  id v3 = a3;
  v4 = [[GreenGhostLowLightStage alloc] initWithMetalContext:v3];

  if (v4) {
    int v5 = 0;
  }
  else {
    int v5 = -12786;
  }

  return v5;
}

- (void)reset
{
  self->_isFirstNonRefFrame = 1;
  self->_nonRefFramesCount = 0;
  self->_canMitigationProceed = 1;
  [(GreenGhostLowLightStage *)self releaseTextures];
}

- (void)releaseTextures
{
  fusedLuma = self->_fusedLuma;
  self->_fusedLuma = 0;

  fusedChroma = self->_fusedChroma;
  self->_fusedChroma = 0;

  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();

  FigMetalDecRef();
}

- (void)dealloc
{
  sumMaskBuffer = self->_sumMaskBuffer;
  self->_sumMaskBuffer = 0;

  v4.receiver = self;
  v4.super_class = (Class)GreenGhostLowLightStage;
  [(GreenGhostLowLightStage *)&v4 dealloc];
}

- (int)singleBracketDetectionWithLuma:(id)a3 chroma:(id)a4 params:(DetectionTuning *)a5
{
  uint64_t v22 = 0;
  id v8 = a4;
  id v9 = a3;
  unsigned int v10 = [v9 width];
  unsigned int v11 = [v9 height];
  *(void *)&long long v12 = 0;
  *((void *)&v12 + 1) = __PAIR64__(v11, v10);
  long long v20 = v12;
  uint64_t v21 = 1065353216;
  greenGhostCommon = self->_greenGhostCommon;
  maskSB = self->_maskSB;
  long long v15 = *(_OWORD *)&a5[1].var2.var1;
  v19[2] = *(_OWORD *)&a5[1].var0.var1;
  v19[3] = v15;
  v19[4] = *(_OWORD *)&a5[2].var0.var2;
  long long v16 = *(_OWORD *)&a5->var2.var0;
  v19[0] = *(_OWORD *)&a5->var0.var0;
  v19[1] = v16;
  int v17 = [(GreenGhostCommon *)greenGhostCommon detectionWithLuma:v9 croppedLuma:v9 chroma:v8 outputMask:maskSB params:v19 processingROIInfo:&v20];

  if (v17) {
    FigDebugAssert3();
  }
  return v17;
}

- (uint64_t)computeTemporalVariationsRefImg:(uint64_t)a3 OtherImg:(void *)a4 refProperties:(void *)a5 otherProperties:(void *)a6 params:(void *)a7
{
  double v50 = a2;
  id v11 = a4;
  id v12 = a5;
  id v13 = a7;
  id v14 = a6;
  long long v15 = [v14 meta];
  uint64_t v16 = [v15 exposureParams];
  int v17 = [v13 meta];
  float RelativeBrightnessForProperties = getRelativeBrightnessForProperties(v16, [v17 exposureParams], v14);

  float v49 = RelativeBrightnessForProperties;
  objc_super v19 = (long long *)[v13 regHomography];

  long long v20 = *v19;
  long long v21 = v19[2];
  v48[1] = v19[1];
  v48[2] = v21;
  v48[0] = v20;
  int v22 = *(unsigned __int8 *)(a1 + 144);
  char v47 = v22 ^ 1;
  if (v22)
  {
    v23 = [*(id *)(a1 + 8) allocator];
    v24 = (void *)[v23 newTextureDescriptor];

    if (!v24) {
      goto LABEL_15;
    }
    v25 = [v24 desc];
    [v25 setUsage:7];

    v26 = [v24 desc];
    [v26 setPixelFormat:25];

    uint64_t v27 = [v11 width];
    v28 = [v24 desc];
    [v28 setWidth:v27];

    uint64_t v29 = [v11 height];
    v30 = [v24 desc];
    [v30 setHeight:v29];

    [v24 setLabel:0];
    v31 = [*(id *)(a1 + 8) allocator];
    uint64_t v32 = [v31 newTextureWithDescriptor:v24];
    v33 = *(void **)(a1 + 168);
    *(void *)(a1 + 168) = v32;

    if (!*(void *)(a1 + 168)) {
      goto LABEL_15;
    }
    v34 = [v24 desc];
    [v34 setCompressionMode:2];

    v35 = [v24 desc];
    [v35 setCompressionFootprint:0];

    [v24 setLabel:0];
    v36 = [*(id *)(a1 + 8) allocator];
    uint64_t v37 = [v36 newTextureWithDescriptor:v24];
    v38 = *(void **)(a1 + 176);
    *(void *)(a1 + 176) = v37;

    if (!*(void *)(a1 + 176)) {
      goto LABEL_15;
    }
  }
  else if (!*(void *)(a1 + 176) || !*(void *)(a1 + 168))
  {
    goto LABEL_14;
  }
  v39 = [*(id *)(a1 + 8) commandQueue];
  v24 = [v39 commandBuffer];

  if (!v24)
  {
LABEL_14:
    FigDebugAssert3();
    uint64_t v42 = FigSignalErrorAt();
    goto LABEL_11;
  }
  v40 = [v24 computeCommandEncoder];
  if (!v40)
  {
LABEL_15:
    FigDebugAssert3();
    uint64_t v42 = FigSignalErrorAt();

    goto LABEL_11;
  }
  v41 = v40;
  [v40 setComputePipelineState:*(void *)(a1 + 24)];
  [v41 setImageblockWidth:16 height:16];
  [v41 setTexture:v11 atIndex:0];
  [v41 setTexture:v12 atIndex:1];
  [v41 setTexture:*(void *)(a1 + 160) atIndex:2];
  [v41 setTexture:*(void *)(a1 + 168) atIndex:3];
  [v41 setTexture:*(void *)(a1 + 176) atIndex:4];
  [v41 setBytes:&v49 length:4 atIndex:0];
  [v41 setBytes:v48 length:48 atIndex:1];
  [v41 setBytes:&v50 length:8 atIndex:2];
  [v41 setBytes:&v47 length:1 atIndex:3];
  v46[0] = [v11 width];
  v46[1] = [v11 height];
  v46[2] = 1;
  int64x2_t v44 = vdupq_n_s64(0x10uLL);
  uint64_t v45 = 1;
  [v41 dispatchThreads:v46 threadsPerThreadgroup:&v44];
  [v41 endEncoding];
  [v24 commit];

  uint64_t v42 = 0;
LABEL_11:

  return v42;
}

- (int)guidedFilter:(id)a3 withGuideLuma:(id)a4 guideChroma:(id)a5 params:(LowLightRefinementTuning *)a6 output:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v54 = 0;
  unsigned int var0 = a6->var0;
  float var1 = a6->var1;
  float var2 = a6->var2;
  float v52 = var1;
  if (([v15 width] & 1) != 0
    || ([v15 height] & 1) != 0
    || ([(FigMetalContext *)self->_metal commandQueue],
        int v17 = objc_claimAutoreleasedReturnValue(),
        [v17 commandBuffer],
        int v18 = objc_claimAutoreleasedReturnValue(),
        v17,
        !v18))
  {
    FigDebugAssert3();
    int v42 = FigSignalErrorAt();
    goto LABEL_8;
  }
  uint64_t v19 = [v18 computeCommandEncoder];
  if (!v19)
  {
    FigDebugAssert3();
    int v42 = FigSignalErrorAt();

    goto LABEL_8;
  }
  long long v20 = (void *)v19;
  v46 = v15;
  id v21 = v13;
  int v22 = [(FigMetalContext *)self->_metal allocator];
  v23 = (void *)[v22 newTextureDescriptor];

  if (!v23)
  {
    FigDebugAssert3();
    int v42 = FigSignalErrorAt();
LABEL_13:

    id v13 = v21;
    id v15 = v46;
    goto LABEL_8;
  }
  v24 = [v23 desc];
  [v24 setCompressionMode:2];

  v25 = [v23 desc];
  [v25 setCompressionFootprint:0];

  v26 = [v23 desc];
  [v26 setUsage:7];

  uint64_t v27 = [v12 pixelFormat];
  v28 = [v23 desc];
  [v28 setPixelFormat:v27];

  uint64_t v29 = [v12 width];
  v30 = [v23 desc];
  [v30 setWidth:v29];

  uint64_t v31 = [v12 height];
  uint64_t v32 = [v23 desc];
  [v32 setHeight:v31];

  [v23 setLabel:0];
  v33 = [(FigMetalContext *)self->_metal allocator];
  v34 = (void *)[v33 newTextureWithDescriptor:v23];
  id v54 = v34;

  if (!v34)
  {
    FigDebugAssert3();
    int v42 = FigSignalErrorAt();

    goto LABEL_13;
  }
  [v20 setComputePipelineState:self->_pipelineStates[2]];
  [v20 setTexture:v12 atIndex:0];
  v35 = v21;
  [v20 setTexture:v21 atIndex:1];
  [v20 setTexture:v14 atIndex:2];
  [v20 setTexture:v34 atIndex:3];
  [v20 setBytes:&var0 length:4 atIndex:0];
  [v20 setBytes:&v52 length:4 atIndex:1];
  unint64_t v36 = [(MTLComputePipelineState *)self->_pipelineStates[2] threadExecutionWidth];
  int64x2_t v44 = v18;
  id v37 = v14;
  unint64_t v38 = [(MTLComputePipelineState *)self->_pipelineStates[2] maxTotalThreadsPerThreadgroup]/ v36;
  id v15 = v46;
  id v45 = v12;
  v50[0] = (unint64_t)[v46 width] >> 1;
  v50[1] = (unint64_t)[v46 height] >> 1;
  v50[2] = 1;
  v49[0] = v36;
  v49[1] = v38;
  v49[2] = 1;
  [v20 dispatchThreads:v50 threadsPerThreadgroup:v49];
  [v20 setComputePipelineState:self->_pipelineStates[3]];
  v39 = v34;
  id v13 = v35;
  [v20 setTexture:v39 atIndex:0];
  [v20 setTexture:v35 atIndex:1];
  [v20 setTexture:v37 atIndex:2];
  [v20 setTexture:v46 atIndex:3];
  [v20 setBytes:&var0 length:4 atIndex:0];
  [v20 setBytes:&v52 length:4 atIndex:1];
  [v20 setBytes:&var2 length:4 atIndex:2];
  unint64_t v40 = [(MTLComputePipelineState *)self->_pipelineStates[3] threadExecutionWidth];
  unint64_t v41 = [(MTLComputePipelineState *)self->_pipelineStates[3] maxTotalThreadsPerThreadgroup]/ v40;
  v48[0] = (unint64_t)[v46 width] >> 1;
  v48[1] = (unint64_t)[v46 height] >> 1;
  id v14 = v37;
  v48[2] = 1;
  v47[0] = v40;
  v47[1] = v41;
  id v12 = v45;
  v47[2] = 1;
  [v20 dispatchThreads:v48 threadsPerThreadgroup:v47];
  [v20 endEncoding];
  [v44 commit];
  FigMetalDecRef();

  int v42 = 0;
LABEL_8:

  return v42;
}

- (int)refineDetectionWithGuideLuma:(id)a3 guideChroma:(id)a4 params:(LowLightRefinementTuning *)a5 output:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v45 = 0;
  id v46 = 0;
  if (([(MTLTexture *)self->_maskMB width] & 1) != 0
    || ([(MTLTexture *)self->_maskMB height] & 1) != 0
    || ([(FigMetalContext *)self->_metal allocator],
        id v13 = objc_claimAutoreleasedReturnValue(),
        id v14 = (void *)[v13 newTextureDescriptor],
        v13,
        !v14))
  {
    FigDebugAssert3();
    int v30 = FigSignalErrorAt();
    goto LABEL_11;
  }
  id v15 = [v14 desc];
  [v15 setCompressionMode:2];

  uint64_t v16 = [v14 desc];
  [v16 setCompressionFootprint:0];

  int v17 = [v14 desc];
  [v17 setUsage:7];

  uint64_t v18 = [(MTLTexture *)self->_maskMB pixelFormat];
  uint64_t v19 = [v14 desc];
  [v19 setPixelFormat:v18];

  uint64_t v20 = [(MTLTexture *)self->_maskMB width];
  id v21 = [v14 desc];
  [v21 setWidth:v20];

  uint64_t v22 = [(MTLTexture *)self->_maskMB height];
  v23 = [v14 desc];
  [v23 setHeight:v22];

  [v14 setLabel:0];
  v24 = [(FigMetalContext *)self->_metal allocator];
  v25 = (void *)[v24 newTextureWithDescriptor:v14];
  id v46 = v25;

  if (!v25) {
    goto LABEL_17;
  }
  int v26 = [(GreenGhostLowLightStage *)self guidedFilter:self->_maskMB withGuideLuma:v10 guideChroma:v11 params:a5 output:v25];
  if (v26)
  {
    int v30 = v26;
    goto LABEL_16;
  }
  [v14 setLabel:0];
  uint64_t v27 = [(FigMetalContext *)self->_metal allocator];
  v28 = (void *)[v27 newTextureWithDescriptor:v14];
  id v45 = v28;

  if (!v28) {
    goto LABEL_17;
  }
  *(float *)&double v29 = a5->var3;
  int v30 = [(GreenGhostCommon *)self->_greenGhostCommon dilateTexture:v25 withNormalizedRadius:v28 output:v29];
  FigMetalDecRef();
  if (v30)
  {
LABEL_16:
    FigDebugAssert3();
LABEL_18:

    goto LABEL_11;
  }
  uint64_t v31 = [(FigMetalContext *)self->_metal commandQueue];
  uint64_t v32 = [v31 commandBuffer];

  if (!v32)
  {
LABEL_17:
    FigDebugAssert3();
    int v30 = FigSignalErrorAt();
    goto LABEL_18;
  }
  v33 = [v32 computeCommandEncoder];
  if (v33)
  {
    v34 = v33;
    [v33 setComputePipelineState:self->_pipelineStates[4]];
    [v34 setTexture:v28 atIndex:0];
    [v34 setTexture:v28 atIndex:1];
    [v34 setTexture:self->_maskMB atIndex:2];
    [v34 setTexture:v12 atIndex:3];
    [v34 setBytes:&a5->var4 length:4 atIndex:0];
    unint64_t v35 = [(MTLComputePipelineState *)self->_pipelineStates[4] threadExecutionWidth];
    unint64_t v36 = [(MTLComputePipelineState *)self->_pipelineStates[4] maxTotalThreadsPerThreadgroup]/ v35;
    id v37 = v12;
    id v38 = v11;
    id v39 = v10;
    unint64_t v40 = (unint64_t)[(MTLTexture *)self->_maskMB width] >> 1;
    unint64_t v41 = [(MTLTexture *)self->_maskMB height];
    v44[0] = v40;
    v44[1] = v41 >> 1;
    id v10 = v39;
    id v11 = v38;
    id v12 = v37;
    v44[2] = 1;
    v43[0] = v35;
    v43[1] = v36;
    v43[2] = 1;
    [v34 dispatchThreads:v44 threadsPerThreadgroup:v43];
    [v34 endEncoding];
    [v32 commit];
    FigMetalDecRef();

    int v30 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v30 = FigSignalErrorAt();
  }
LABEL_11:

  return v30;
}

- (int)detectionWithRefPyramid:(id)a3 otherPyramid:(id)a4 refDetection:(BOOL)a5 refProperties:(id)a6 otherProperties:(id)a7 maskMBBinary:(id)a8 params:(LowLightTuning *)a9
{
  BOOL v12 = a5;
  id v15 = a3;
  uint64_t v16 = a4;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  if (!v12)
  {
    int v44 = [(GreenGhostLowLightStage *)self computeTemporalVariationsRefImg:v15[self->_detectionLvl + 42] OtherImg:v16[self->_detectionLvl + 42] refProperties:v17 otherProperties:v18 params:*(double *)&a9[6].maxMaskAverage];
    if (v44)
    {
      int v43 = v44;
    }
    else
    {
      int v43 = [(GreenGhostLowLightStage *)self refineDetectionWithGuideLuma:v15[self->_detectionLvl + 42] guideChroma:self->_refChroma params:&a9[7] output:v19];
      if (!v43) {
        goto LABEL_11;
      }
    }
    FigDebugAssert3();
    goto LABEL_11;
  }
  uint64_t v20 = [(FigMetalContext *)self->_metal allocator];
  id v21 = (void *)[v20 newTextureDescriptor];

  if (!v21)
  {
LABEL_16:
    FigDebugAssert3();
    int v43 = FigSignalErrorAt();
    goto LABEL_8;
  }
  id v46 = v17;
  uint64_t v22 = v16;
  v23 = [v21 desc];
  [v23 setUsage:7];

  v24 = [v21 desc];
  [v24 setPixelFormat:65];

  uint64_t v25 = [(id)v15[self->_detectionLvl + 61] width];
  int v26 = [v21 desc];
  [v26 setWidth:v25];

  uint64_t v27 = [(id)v15[self->_detectionLvl + 61] height];
  v28 = [v21 desc];
  [v28 setHeight:v27];

  [v21 setLabel:0];
  double v29 = [(FigMetalContext *)self->_metal allocator];
  int v30 = (MTLTexture *)[v29 newTextureWithDescriptor:v21];
  refChroma = self->_refChroma;
  self->_refChroma = v30;

  if (self->_refChroma)
  {
    int v32 = -[GreenGhostCommon downscaleInput:output:](self->_greenGhostCommon, "downscaleInput:output:", v15[self->_detectionLvl + 60]);
    uint64_t v16 = v22;
    if (!v32)
    {
      v33 = [v21 desc];
      [v33 setCompressionMode:2];

      v34 = [v21 desc];
      [v34 setCompressionFootprint:0];

      unint64_t v35 = [v21 desc];
      [v35 setPixelFormat:25];

      [v21 setLabel:0];
      unint64_t v36 = [(FigMetalContext *)self->_metal allocator];
      id v37 = (MTLTexture *)[v36 newTextureWithDescriptor:v21];
      maskSB = self->_maskSB;
      self->_maskSB = v37;

      id v17 = v46;
      if (self->_maskSB)
      {
        uint64_t v39 = v15[self->_detectionLvl + 42];
        unint64_t v40 = self->_refChroma;
        long long v41 = *(_OWORD *)&a9[2].maxMaskAverage;
        long long v42 = *(_OWORD *)&a9[4].maxMaskAverage;
        v47[2] = *(LowLightTuning *)((char *)a9 + 56);
        void v47[3] = v42;
        v47[4] = *(LowLightTuning *)((char *)a9 + 88);
        v47[0] = *(LowLightTuning *)((char *)a9 + 24);
        v47[1] = v41;
        int v43 = [(GreenGhostLowLightStage *)self singleBracketDetectionWithLuma:v39 chroma:v40 params:v47];
        if (v43) {
          FigDebugAssert3();
        }
        goto LABEL_8;
      }
      goto LABEL_16;
    }
    int v43 = v32;
    FigDebugAssert3();
  }
  else
  {
    FigDebugAssert3();
    int v43 = FigSignalErrorAt();
    uint64_t v16 = v22;
  }
  id v17 = v46;
LABEL_8:

LABEL_11:
  return v43;
}

- (int)canMitigationProceedWithMaxMaskAverage:(float)a3
{
  int v5 = objc_opt_new();
  *(_DWORD *)[(MTLBuffer *)self->_sumMaskBuffer contents] = 0;
  v6 = [(FigMetalContext *)self->_metal commandQueue];
  v7 = [v6 commandBuffer];

  id v8 = [v7 computeCommandEncoder];
  id v9 = v8;
  if (v8)
  {
    [v8 setComputePipelineState:self->_pipelineStates[0]];
    [v9 setTexture:self->_maskSB atIndex:0];
    [v9 setBuffer:self->_sumMaskBuffer offset:0 atIndex:0];
    unint64_t v10 = [(MTLComputePipelineState *)self->_pipelineStates[0] threadExecutionWidth];
    unint64_t v11 = [(MTLComputePipelineState *)self->_pipelineStates[0] maxTotalThreadsPerThreadgroup]/ v10;
    uint64_t v12 = [(MTLTexture *)self->_maskSB width];
    uint64_t v13 = [(MTLTexture *)self->_maskSB height];
    v22[0] = v12;
    v22[1] = v13;
    v22[2] = 1;
    v21[0] = v10;
    v21[1] = v11;
    v21[2] = 1;
    [v9 dispatchThreads:v22 threadsPerThreadgroup:v21];
    [v9 endEncoding];
    [v7 commit];
    [(FigMetalContext *)self->_metal waitForIdle];
    double v14 = (float)*(unsigned int *)[(MTLBuffer *)self->_sumMaskBuffer contents];
    uint64_t v15 = [(MTLTexture *)self->_maskSB width];
    double v16 = v14 / ((float)(unint64_t)([(MTLTexture *)self->_maskSB height] * v15) * 255.0);
    *(float *)&double v14 = v16;
    LODWORD(v16) = LODWORD(v14);
    id v17 = [NSNumber numberWithFloat:v16];
    [v5 setObject:v17 forKeyedSubscript:@"maskAverage"];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_sidecarWriter);
    [WeakRetained addToSidecar:v5 forKey:@"GreenGhostLowLight"];

    int v19 = 0;
    self->_canMitigationProceed = *(float *)&v14 < a3;
  }
  else
  {
    FigDebugAssert3();
    int v19 = FigSignalErrorAt();
  }

  return v19;
}

- (void)scaleFaceBodyBoundariesWithSizeRatio:(float)a3
{
  uint64_t nFaces = self->_faceBodyBoundaries.nFaces;
  self->_faceBodyBoundariesDownscaled.uint64_t nFaces = nFaces;
  if (nFaces)
  {
    objc_super v4 = (float32x4_t *)self;
    do
    {
      v4[38] = vmulq_n_f32(v4[16], a3);
      ++v4;
      --nFaces;
    }
    while (nFaces);
  }
  uint64_t v5 = *(unsigned int *)&self->_anon_f4[172];
  *(_DWORD *)&self->_anon_254[172] = v5;
  if (v5)
  {
    v6 = (float32x4_t *)&self->_anon_f4[188];
    do
    {
      v6[22] = vmulq_n_f32(*v6, a3);
      ++v6;
      --v5;
    }
    while (v5);
  }
}

- (int)allocateFusionWeightTexturesWithWidth:(unint64_t)a3 height:(unint64_t)a4
{
  v7 = [(FigMetalContext *)self->_metal allocator];
  id v8 = (void *)[v7 newTextureDescriptor];

  if (!v8)
  {
    FigDebugAssert3();
    double v14 = 0;
LABEL_9:
    int v33 = FigSignalErrorAt();
    goto LABEL_6;
  }
  id v9 = [v8 desc];
  [v9 setUsage:7];

  unint64_t v10 = [v8 desc];
  [v10 setWidth:a3];

  unint64_t v11 = [v8 desc];
  [v11 setHeight:a4];

  uint64_t v12 = [v8 desc];
  [v12 setPixelFormat:25];

  uint64_t v13 = [(FigMetalContext *)self->_metal allocator];
  double v14 = (void *)[v13 newTextureDescriptor:0];

  if (!v14) {
    goto LABEL_8;
  }
  uint64_t v15 = [v8 desc];
  uint64_t v16 = [v15 usage];
  id v17 = [v14 desc];
  [v17 setUsage:v16];

  id v18 = [v8 desc];
  uint64_t v19 = [v18 width];
  uint64_t v20 = [v14 desc];
  [v20 setWidth:v19];

  id v21 = [v8 desc];
  uint64_t v22 = [v21 height];
  v23 = [v14 desc];
  [v23 setHeight:v22];

  v24 = [v8 desc];
  uint64_t v25 = [v24 pixelFormat];
  int v26 = [v14 desc];
  [v26 setPixelFormat:v25];

  [v14 setLabel:0];
  uint64_t v27 = [(FigMetalContext *)self->_metal allocator];
  v28 = (MTLTexture *)[v27 newTextureWithDescriptor:v14 subAllocatorID:0];
  ggMaxFusionWeights = self->_ggMaxFusionWeights;
  self->_ggMaxFusionWeights = v28;

  if (!self->_ggMaxFusionWeights) {
    goto LABEL_8;
  }
  [v8 setLabel:0];
  int v30 = [(FigMetalContext *)self->_metal allocator];
  uint64_t v31 = (MTLTexture *)[v30 newTextureWithDescriptor:v8];
  ggFusionWeightsAcc = self->_ggFusionWeightsAcc;
  self->_ggFusionWeightsAcc = v31;

  if (!self->_ggFusionWeightsAcc)
  {
LABEL_8:
    FigDebugAssert3();
    goto LABEL_9;
  }
  int v33 = 0;
LABEL_6:

  return v33;
}

- (uint64_t)computeFusionWeightsRefLuma:(__n128)a3 refChroma:(__n128)a4 otherLuma:(__n128)a5 otherChroma:(uint64_t)a6 maskMBBinary:(void *)a7 innerMask:(void *)a8 relativeBrightness:(void *)a9 homography:(void *)a10 output:(void *)a11 params:(void *)a12
{
  v73[0] = a3;
  v73[1] = a4;
  v73[2] = a5;
  id v61 = a7;
  id v21 = a8;
  id v62 = a9;
  id v22 = a10;
  id v23 = a11;
  id v63 = a12;
  float v72 = a2;
  id v24 = a13;
  id v70 = 0;
  id v71 = 0;
  id v69 = 0;
  if ([v24 isCompressed]
    || ([*(id *)(a1 + 8) allocator],
        uint64_t v25 = objc_claimAutoreleasedReturnValue(),
        int v26 = (void *)[v25 newTextureDescriptor],
        v25,
        !v26))
  {
    FigDebugAssert3();
    uint64_t v55 = FigSignalErrorAt();
    goto LABEL_12;
  }
  uint64_t v27 = [v26 desc];
  [v27 setCompressionMode:2];

  v28 = [v26 desc];
  [v28 setCompressionFootprint:0];

  double v29 = [v26 desc];
  [v29 setUsage:7];

  uint64_t v30 = [v23 pixelFormat];
  [v26 desc];
  uint64_t v31 = v64 = v26;
  [v31 setPixelFormat:v30];

  uint64_t v32 = [v23 width];
  int v33 = [v64 desc];
  [v33 setWidth:v32];

  uint64_t v34 = [v23 height];
  unint64_t v35 = [v64 desc];
  [v35 setHeight:v34];

  [v64 setLabel:0];
  unint64_t v36 = [*(id *)(a1 + 8) allocator];
  id v37 = (void *)[v36 newTextureWithDescriptor:v64];
  id v71 = v37;

  if (!v37) {
    goto LABEL_14;
  }
  [v64 setLabel:0];
  id v38 = [*(id *)(a1 + 8) allocator];
  uint64_t v39 = (void *)[v38 newTextureWithDescriptor:v64];
  id v70 = v39;

  if (!v39) {
    goto LABEL_14;
  }
  [v64 setLabel:0];
  unint64_t v40 = [*(id *)(a1 + 8) allocator];
  long long v41 = (void *)[v40 newTextureWithDescriptor:v64];
  id v69 = v41;

  if (!v41
    || (v59 = v41,
        [*(id *)(a1 + 8) commandQueue],
        long long v42 = objc_claimAutoreleasedReturnValue(),
        [v42 commandBuffer],
        int v43 = objc_claimAutoreleasedReturnValue(),
        v42,
        !v43))
  {
LABEL_14:
    FigDebugAssert3();
    uint64_t v55 = FigSignalErrorAt();
LABEL_16:

    goto LABEL_12;
  }
  int v44 = [v43 computeCommandEncoder];
  if (!v44)
  {
    FigDebugAssert3();
    uint64_t v55 = FigSignalErrorAt();

    goto LABEL_16;
  }
  id v45 = v44;
  [v44 setComputePipelineState:*(void *)(a1 + 56)];
  [v45 setTexture:v61 atIndex:0];
  [v45 setTexture:v21 atIndex:1];
  [v45 setTexture:v62 atIndex:2];
  [v45 setTexture:v22 atIndex:3];
  id v58 = v23;
  [v45 setTexture:v23 atIndex:4];
  id v60 = v24;
  [v45 setTexture:v63 atIndex:5];
  [v45 setTexture:v39 atIndex:6];
  [v45 setTexture:v37 atIndex:7];
  [v45 setBytes:&v72 length:4 atIndex:0];
  [v45 setBytes:v73 length:48 atIndex:1];
  [v45 setBytes:a14 length:40 atIndex:2];
  id v57 = v22;
  id v46 = v21;
  unint64_t v47 = [*(id *)(a1 + 56) threadExecutionWidth];
  unint64_t v48 = [*(id *)(a1 + 56) maxTotalThreadsPerThreadgroup] / v47;
  v68[0] = [v39 width];
  v68[1] = [v39 height];
  v68[2] = 1;
  v67[0] = v47;
  v67[1] = v48;
  v67[2] = 1;
  [v45 dispatchThreads:v68 threadsPerThreadgroup:v67];
  [v45 setComputePipelineState:*(void *)(a1 + 64)];
  [v45 setTexture:v37 atIndex:0];
  [v45 setTexture:v63 atIndex:1];
  [v45 setTexture:v39 atIndex:2];
  [v45 setTexture:v61 atIndex:3];
  float v49 = v46;
  id v50 = v46;
  id v22 = v57;
  [v45 setTexture:v50 atIndex:4];
  [v45 setTexture:v62 atIndex:5];
  [v45 setTexture:v57 atIndex:6];
  [v45 setTexture:*(void *)(a1 + 176) atIndex:7];
  [v45 setTexture:v60 atIndex:8];
  [v45 setBytes:a1 + 144 length:1 atIndex:0];
  [v45 setBytes:&v72 length:4 atIndex:1];
  [v45 setBytes:v73 length:48 atIndex:2];
  [v45 setBytes:a14 length:40 atIndex:3];
  [v45 setBytes:a1 + 592 length:352 atIndex:4];
  unint64_t v51 = [*(id *)(a1 + 64) threadExecutionWidth];
  unint64_t v52 = [*(id *)(a1 + 64) maxTotalThreadsPerThreadgroup] / v51;
  v66[0] = [v39 width];
  v66[1] = [v39 height];
  id v24 = v60;
  v66[2] = 1;
  v65[0] = v51;
  v65[1] = v52;
  v65[2] = 1;
  [v45 dispatchThreads:v66 threadsPerThreadgroup:v65];
  [v45 endEncoding];
  [v43 commit];
  *(float *)&double v53 = a14[1].var1;
  uint64_t v54 = [*(id *)(a1 + 120) erodeTexture:v60 withNormalizedRadius:v59 output:v53];
  if (v54)
  {
    uint64_t v55 = v54;
    goto LABEL_18;
  }
  uint64_t v55 = [*(id *)(a1 + 120) boxFilter:v59 withRadius:a14[1].var2 output:v60];
  if (v55)
  {
LABEL_18:
    FigDebugAssert3();
    goto LABEL_11;
  }
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
LABEL_11:

  id v21 = v49;
  id v23 = v58;
LABEL_12:

  return v55;
}

- (uint64_t)prepareFusionRefLuma:(double)a3 refChroma:(double)a4 otherLuma:(double)a5 otherChroma:(uint64_t)a6 maskMBBinary:(void *)a7 relativeBrightness:(void *)a8 homography:(void *)a9 output:(void *)a10 params:(void *)a11
{
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  id v24 = a11;
  id v25 = a12;
  float v49 = 0;
  int v26 = [a1[1] allocator];
  uint64_t v27 = (void *)[v26 newTextureDescriptor];

  if (!v27) {
    goto LABEL_10;
  }
  v28 = [v27 desc];
  [v28 setCompressionMode:2];

  double v29 = [v27 desc];
  [v29 setCompressionFootprint:0];

  uint64_t v30 = [v27 desc];
  [v30 setUsage:7];

  uint64_t v31 = [v24 pixelFormat];
  uint64_t v32 = [v27 desc];
  [v32 setPixelFormat:v31];

  uint64_t v33 = [v24 width];
  uint64_t v34 = [v27 desc];
  [v34 setWidth:v33];

  uint64_t v35 = [v24 height];
  unint64_t v36 = [v27 desc];
  [v36 setHeight:v35];

  [v27 setLabel:0];
  id v37 = [a1[1] allocator];
  uint64_t v38 = [v37 newTextureWithDescriptor:v27];
  float v49 = (void *)v38;

  if (!v38)
  {
LABEL_10:
    FigDebugAssert3();
    uint64_t v44 = FigSignalErrorAt();
    goto LABEL_9;
  }
  unint64_t v39 = [v24 width];
  if (v39 <= [v24 height]) {
    unint64_t v40 = [v24 height];
  }
  else {
    unint64_t v40 = [v24 width];
  }
  *(float *)&double v41 = 1.0 / (float)v40;
  uint64_t v42 = [a1[15] erodeTexture:v24 withNormalizedRadius:v38 output:v41];
  if (v42)
  {
    uint64_t v44 = v42;
    goto LABEL_12;
  }
  *(float *)&double v43 = a2;
  uint64_t v44 = objc_msgSend(a1, "computeFusionWeightsRefLuma:refChroma:otherLuma:otherChroma:maskMBBinary:innerMask:relativeBrightness:homography:output:params:", v20, v21, v22, v23, v24, v38, v43, a3, a4, a5, v25, a13);
  if (v44)
  {
LABEL_12:
    FigDebugAssert3();
    goto LABEL_9;
  }
  FigMetalDecRef();
LABEL_9:

  return v44;
}

- (int)fuseRefPyramid:(id)a3 withOtherPyramid:(id)a4 refProperties:(id)a5 otherProperties:(id)a6 currentFusionWeights:(id)a7 relativeBrightness:(float)a8
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  double v14 = a3;
  uint64_t v15 = a4;
  id v51 = a7;
  uint64_t v16 = (void *)v14[self->_repairLvl + 42];
  id v17 = a6;
  id v18 = a5;
  unint64_t v50 = [v16 width];
  unint64_t v19 = [(id)v14[self->_repairLvl + 42] height];
  int v20 = [v18 inputColorSpace];
  LOBYTE(a5) = v20 == 1;
  LOBYTE(a7) = v20 == 2;
  id v21 = (_OWORD *)[v18 colorSpaceConversionParameters];

  v60[0] = *v21;
  long long v22 = v21[1];
  long long v23 = v21[2];
  long long v24 = v21[4];
  v60[3] = v21[3];
  v60[4] = v24;
  v60[1] = v22;
  v60[2] = v23;
  long long v25 = v21[5];
  long long v26 = v21[6];
  long long v27 = v21[8];
  v60[7] = v21[7];
  v60[8] = v27;
  v60[5] = v25;
  v60[6] = v26;
  long long v28 = v21[9];
  long long v29 = v21[10];
  long long v30 = v21[12];
  v60[11] = v21[11];
  v60[12] = v30;
  v60[9] = v28;
  v60[10] = v29;
  uint64_t v31 = (_OWORD *)[v17 colorSpaceConversionParameters];
  v59[0] = *v31;
  long long v32 = v31[4];
  long long v34 = v31[1];
  long long v33 = v31[2];
  v59[3] = v31[3];
  v59[4] = v32;
  v59[1] = v34;
  v59[2] = v33;
  long long v35 = v31[8];
  long long v37 = v31[5];
  long long v36 = v31[6];
  v59[7] = v31[7];
  v59[8] = v35;
  v59[5] = v37;
  v59[6] = v36;
  long long v38 = v31[12];
  long long v40 = v31[9];
  long long v39 = v31[10];
  v59[11] = v31[11];
  v59[12] = v38;
  v59[9] = v40;
  v59[10] = v39;
  double v41 = (long long *)[v17 regHomography];

  long long v42 = v41[2];
  long long v62 = v41[1];
  long long v63 = v42;
  long long v61 = *v41;
  v55[0] = 0;
  v55[1] = 0;
  LOBYTE(v55[0]) = self->_isFirstNonRefFrame;
  BYTE1(v55[0]) = (_BYTE)a5;
  BYTE2(v55[0]) = (_BYTE)a7;
  *((float *)v55 + 1) = a8;
  long long v56 = v61;
  long long v57 = v62;
  long long v58 = v42;
  double v43 = [(FigMetalContext *)self->_metal commandQueue];
  uint64_t v44 = [v43 commandBuffer];

  if (v44 && ([v44 computeCommandEncoder], (id v45 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v46 = v45;
    [v45 setComputePipelineState:self->_pipelineStates[7]];
    [v46 setImageblockWidth:32 height:32];
    [v46 setTexture:v14[self->_repairLvl + 42] atIndex:0];
    [v46 setTexture:v14[self->_repairLvl + 62] atIndex:1];
    [v46 setTexture:v15[self->_repairLvl + 42] atIndex:2];
    [v46 setTexture:v15[self->_repairLvl + 62] atIndex:3];
    [v46 setTexture:self->_maskMB atIndex:4];
    unint64_t v47 = v51;
    [v46 setTexture:v51 atIndex:5];
    [v46 setTexture:self->_ggFusionWeightsAcc atIndex:6];
    [v46 setTexture:self->_fusedLuma atIndex:7];
    [v46 setTexture:self->_fusedChroma atIndex:8];
    [v46 setBytes:v55 length:64 atIndex:0];
    [v46 setBytes:v60 length:208 atIndex:1];
    [v46 setBytes:v59 length:208 atIndex:2];
    v54[0] = v50 >> 1;
    v54[1] = v19 >> 1;
    v54[2] = 1;
    int64x2_t v52 = vdupq_n_s64(0x10uLL);
    uint64_t v53 = 1;
    [v46 dispatchThreads:v54 threadsPerThreadgroup:&v52];
    [v46 endEncoding];
    [v44 commit];

    int v48 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v48 = FigSignalErrorAt();
    unint64_t v47 = v51;
  }

  return v48;
}

- (int)updateFusionWeights:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FigMetalContext *)self->_metal commandQueue];
  v6 = [v5 commandBuffer];

  if (v6 && ([v6 computeCommandEncoder], (v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v8 = v7;
    [v7 setComputePipelineState:self->_pipelineStates[8]];
    [v8 setImageblockWidth:16 height:16];
    [v8 setTexture:v4 atIndex:0];
    [v8 setTexture:self->_maskMB atIndex:1];
    [v8 setTexture:self->_ggFusionWeightsAcc atIndex:2];
    [v8 setTexture:self->_ggMaxFusionWeights atIndex:3];
    [v8 setBytes:&self->_isFirstNonRefFrame length:1 atIndex:0];
    v13[0] = [v4 width];
    v13[1] = [v4 height];
    v13[2] = 1;
    int64x2_t v11 = vdupq_n_s64(0x10uLL);
    uint64_t v12 = 1;
    [v8 dispatchThreads:v13 threadsPerThreadgroup:&v11];
    [v8 endEncoding];
    [v6 commit];

    int v9 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v9 = FigSignalErrorAt();
  }

  return v9;
}

- (int)fuseRefPyramid:(id)a3 withOtherPyramid:(id)a4 refProperties:(id)a5 otherProperties:(id)a6 maskMBBinary:(id)a7 params:(LowLightFusionTuning *)a8
{
  uint64_t v13 = (id *)a3;
  double v14 = (char *)a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = [v15 meta];
  uint64_t v19 = [v18 exposureParams];
  int v20 = [v16 meta];
  float RelativeBrightnessForProperties = getRelativeBrightnessForProperties(v19, [v20 exposureParams], v15);

  long long v56 = 0;
  long long v22 = [(FigMetalContext *)self->_metal allocator];
  long long v23 = (void *)[v22 newTextureDescriptor];

  if (!v23) {
    goto LABEL_9;
  }
  id v55 = v15;
  long long v24 = [v23 desc];
  [v24 setCompressionMode:2];

  long long v25 = [v23 desc];
  [v25 setCompressionFootprint:0];

  long long v26 = [v23 desc];
  [v26 setUsage:7];

  uint64_t v27 = [v13[self->_detectionLvl + 42] pixelFormat];
  long long v28 = [v23 desc];
  [v28 setPixelFormat:v27];

  uint64_t v29 = [v13[self->_detectionLvl + 42] width];
  long long v30 = [v23 desc];
  [v30 setWidth:v29];

  uint64_t v31 = [v13[self->_detectionLvl + 42] height];
  long long v32 = [v23 desc];
  [v32 setHeight:v31];

  [v23 setLabel:0];
  long long v33 = [(FigMetalContext *)self->_metal allocator];
  uint64_t v34 = [v33 newTextureWithDescriptor:v23];
  long long v56 = (void *)v34;

  if (!v34)
  {
LABEL_9:
    FigDebugAssert3();
    int v51 = FigSignalErrorAt();
    goto LABEL_8;
  }
  uint64_t v53 = v23;
  uint64_t v35 = 8 * self->_detectionLvl - 8;
  uint64_t v36 = *(uint64_t *)((char *)v13 + v35 + 336);
  long long v37 = (char *)(v13 + 62);
  long long v38 = v13;
  long long v39 = v16;
  id v40 = v17;
  uint64_t v41 = *(void *)&v37[v35];
  uint64_t v42 = *(void *)&v14[v35 + 336];
  uint64_t v43 = *(void *)&v14[v35 + 496];
  uint64_t v44 = (double *)[v39 regHomography];
  uint64_t v45 = v41;
  id v17 = v40;
  *(float *)&double v46 = RelativeBrightnessForProperties;
  int v47 = -[GreenGhostLowLightStage prepareFusionRefLuma:refChroma:otherLuma:otherChroma:maskMBBinary:relativeBrightness:homography:output:params:](self, "prepareFusionRefLuma:refChroma:otherLuma:otherChroma:maskMBBinary:relativeBrightness:homography:output:params:", v36, v45, v42, v43, v40, v34, v46, *v44, v44[2], v44[4], a8);
  if (v47)
  {
    int v51 = v47;
    FigDebugAssert3();
    id v15 = v55;
    id v16 = v39;
    uint64_t v13 = v38;
LABEL_13:
    long long v23 = v53;
    goto LABEL_8;
  }
  float v49 = v38;
  id v15 = v55;
  *(float *)&double v48 = RelativeBrightnessForProperties;
  int v50 = [(GreenGhostLowLightStage *)self fuseRefPyramid:v38 withOtherPyramid:v14 refProperties:v55 otherProperties:v39 currentFusionWeights:v34 relativeBrightness:v48];
  id v16 = v39;
  if (v50)
  {
    int v51 = v50;
    FigDebugAssert3();
    uint64_t v13 = v38;
    goto LABEL_13;
  }
  int v51 = [(GreenGhostLowLightStage *)self updateFusionWeights:v34];
  long long v23 = v53;
  if (v51) {
    FigDebugAssert3();
  }
  else {
    FigMetalDecRef();
  }
  uint64_t v13 = v49;
LABEL_8:

  return v51;
}

- (int)mitigationWithRefPyramid:(id)a3 otherPyramid:(id)a4 isRefProcessing:(BOOL)a5 refProperties:(id)a6 otherProperties:(id)a7 greenGhostBuffers:(id)a8 tuningParams:(id)a9
{
  BOOL v13 = a5;
  uint64_t v105 = *MEMORY[0x263EF8340];
  id v16 = (id *)a3;
  id v17 = a4;
  id v18 = a6;
  id v65 = a7;
  uint64_t v64 = (id *)a8;
  id v19 = a9;
  int v20 = objc_opt_new();
  if (v19)
  {
    [v19 tuningParams];
    long long v100 = *(_OWORD *)((char *)v98 + 8);
    long long v101 = *(_OWORD *)((char *)&v98[1] + 8);
    uint64_t v102 = *((void *)&v98[2] + 1);
    [v19 tuningParams];
    float v21 = *((float *)&v73 + 1);
  }
  else
  {
    uint64_t v99 = 0;
    memset(v98, 0, sizeof(v98));
    long long v97 = 0u;
    long long v96 = 0u;
    long long v95 = 0u;
    long long v94 = 0u;
    long long v93 = 0u;
    long long v92 = 0u;
    long long v91 = 0u;
    long long v90 = 0u;
    long long v100 = *(_OWORD *)((char *)v98 + 8);
    long long v101 = *(_OWORD *)((char *)&v98[1] + 8);
    uint64_t v102 = 0;
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    float v21 = 0.0;
    uint64_t v89 = 0;
  }
  unint64_t v62 = [v16[self->_detectionLvl + 42] width];
  uint64_t v22 = [v16[self->_detectionLvl + 42] height];
  unint64_t v63 = [v16[self->_repairLvl + 42] width];
  uint64_t v23 = [v16[self->_repairLvl + 42] height];
  id v72 = 0;
  if (!self->_canMitigationProceed) {
    goto LABEL_7;
  }
  unint64_t v61 = v23;
  long long v24 = [v18 meta];
  int v25 = [v24 isStationary];

  if (v25)
  {
    self->_canMitigationProceed = 0;
    [v20 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:@"isRunning"];
    [v20 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"tripodMode"];
LABEL_7:
    long long v26 = 0;
    int v27 = 0;
LABEL_8:
    long long v28 = v64;
    goto LABEL_9;
  }
  id v60 = v18;
  if (dword_26B430EE8)
  {
    unsigned int v71 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    uint64_t v31 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (v13)
  {
    long long v32 = 0;
    long long v26 = 0;
    goto LABEL_18;
  }
  [v65 blurryFrameWeight];
  if (v33 < v21 || ([v65 hasValidRegistration] & 1) == 0)
  {
    if (dword_26B430EE8)
    {
      unsigned int v71 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      uint64_t v42 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT);
      long long v28 = v64;
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      long long v26 = 0;
      int v27 = 0;
    }
    else
    {
      long long v26 = 0;
      int v27 = 0;
      long long v28 = v64;
    }
    goto LABEL_13;
  }
  uint64_t v34 = [(FigMetalContext *)self->_metal allocator];
  long long v26 = (void *)[v34 newTextureDescriptor];

  if (!v26)
  {
    uint64_t v59 = v9;
    LODWORD(v58) = 0;
    goto LABEL_60;
  }
  uint64_t v35 = [v26 desc];
  [v35 setCompressionMode:2];

  uint64_t v36 = [v26 desc];
  [v36 setCompressionFootprint:0];

  long long v37 = [v26 desc];
  [v37 setUsage:7];

  long long v38 = [v26 desc];
  [v38 setPixelFormat:25];

  long long v39 = [v26 desc];
  [v39 setWidth:v62];

  id v40 = [v26 desc];
  [v40 setHeight:v22];

  [v26 setLabel:0];
  uint64_t v41 = [(FigMetalContext *)self->_metal allocator];
  long long v32 = (void *)[v41 newTextureWithDescriptor:v26];
  id v72 = v32;

  if (!v32)
  {
    uint64_t v59 = v9;
    LODWORD(v58) = 0;
LABEL_60:
    FigDebugAssert3();
    int v27 = FigSignalErrorAt();
    goto LABEL_8;
  }
LABEL_18:
  if (v19)
  {
    [v19 tuningParams];
  }
  else
  {
    uint64_t v69 = 0;
    memset(v68, 0, sizeof(v68));
  }
  int v43 = -[GreenGhostLowLightStage detectionWithRefPyramid:otherPyramid:refDetection:refProperties:otherProperties:maskMBBinary:params:](self, "detectionWithRefPyramid:otherPyramid:refDetection:refProperties:otherProperties:maskMBBinary:params:", v16, v17, v13, v18, v65, v32, v68, v59);
  if (v43)
  {
    int v27 = v43;
    uint64_t v59 = v9;
    LODWORD(v58) = v43;
    FigDebugAssert3();
    goto LABEL_8;
  }
  if (!v13)
  {
    long long v28 = v64;
    if (self->_isFirstNonRefFrame)
    {
      int v45 = [(GreenGhostLowLightStage *)self allocateFusionWeightTexturesWithWidth:v63 >> 2 height:v61 >> 2];
      if (v45)
      {
        int v27 = v45;
        uint64_t v59 = v9;
        LODWORD(v58) = v45;
        goto LABEL_58;
      }
      objc_storeStrong(v64 + 3, self->_ggMaxFusionWeights);
      objc_storeStrong((id *)&self->_fusedLuma, v64[1]);
      objc_storeStrong((id *)&self->_fusedChroma, v64[2]);
    }
    int v46 = [(GreenGhostLowLightStage *)self fuseRefPyramid:v16 withOtherPyramid:v17 refProperties:v18 otherProperties:v65 maskMBBinary:v32 params:&v100];
    int v27 = v46;
    if (!v46)
    {
      self->_isFirstNonRefFrame = 0;
      ++self->_nonRefFramesCount;
      FigMetalDecRef();
      goto LABEL_9;
    }
    uint64_t v59 = v9;
    LODWORD(v58) = v46;
LABEL_58:
    FigDebugAssert3();
    goto LABEL_9;
  }
  [v20 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"isRunning"];
  if (v19)
  {
    [v19 tuningParams];
    LODWORD(v44) = v67;
  }
  else
  {
    double v44 = 0.0;
  }
  int v27 = [(GreenGhostLowLightStage *)self canMitigationProceedWithMaxMaskAverage:v44];
  long long v28 = v64;
  if (self->_canMitigationProceed)
  {
    id v47 = v17;
    greenGhostCommon = self->_greenGhostCommon;
    float v49 = [v60 meta];
    if (v19)
    {
      [v19 tuningParams];
      double v50 = v66;
    }
    else
    {
      double v50 = 0.0;
    }
    -[GreenGhostCommon extractFaceBodyBoundariesFromFaceLandMarks:ev0FrameMetadata:imgSize:faceBoundaryPaddingRatio:bodyBoundaryPaddingRatio:output:](greenGhostCommon, "extractFaceBodyBoundariesFromFaceLandMarks:ev0FrameMetadata:imgSize:faceBoundaryPaddingRatio:bodyBoundaryPaddingRatio:output:", 0, v49, &self->_faceBodyBoundaries, (double)v63, (double)v61, v50, COERCE_DOUBLE(1036831949));

    *(float *)&double v54 = (float)v62 / (float)v63;
    [(GreenGhostLowLightStage *)self scaleFaceBodyBoundariesWithSizeRatio:v54];
    if (self->_faceBodyBoundaries.nFaces) {
      BOOL v55 = 1;
    }
    else {
      BOOL v55 = *(_DWORD *)&self->_anon_f4[172] != 0;
    }
    id v17 = v47;
    long long v56 = [NSNumber numberWithInt:v55];
    [v20 setObject:v56 forKeyedSubscript:@"foundFacesOrBodies"];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_sidecarWriter);
    [WeakRetained addToSidecar:v20 forKey:@"GreenGhostLowLight"];

    id v18 = v60;
    goto LABEL_13;
  }
  if (dword_26B430EE8)
  {
    unsigned int v71 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    int v51 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v52 = v71;
    if (os_log_type_enabled(v51, type)) {
      unsigned int v53 = v52;
    }
    else {
      unsigned int v53 = v52 & 0xFFFFFFFE;
    }
    if (v53)
    {
      int v103 = 136315138;
      v104 = "-[GreenGhostLowLightStage mitigationWithRefPyramid:otherPyramid:isRefProcessing:refProperties:otherProperti"
             "es:greenGhostBuffers:tuningParams:]";
      LODWORD(v59) = 12;
      long long v58 = &v103;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    long long v28 = v64;
  }
  objc_msgSend(v20, "setObject:forKeyedSubscript:", MEMORY[0x263EFFA88], @"exceedsMaxMaskAverage", v58, v59);
LABEL_9:
  if (objc_msgSend(v20, "count", v58, v59))
  {
    id v29 = objc_loadWeakRetained((id *)&self->_sidecarWriter);
    [v29 addToSidecar:v20 forKey:@"GreenGhostLowLight"];
  }
  if (!self->_canMitigationProceed) {
    [(GreenGhostLowLightStage *)self releaseTextures];
  }
LABEL_13:

  return v27;
}

- (int)mixFusedTexturesWithRefLuma:(id)a3 refChroma:(id)a4 refProperties:(id)a5 tuningParams:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  double v14 = v13;
  id v95 = 0;
  if (v13)
  {
    [v13 tuningParams];
    int v15 = DWORD2(v88);
    [v14 tuningParams];
    int v16 = HIDWORD(v70);
  }
  else
  {
    uint64_t v94 = 0;
    long long v92 = 0u;
    long long v93 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    int v16 = 0;
    int v15 = 0;
    uint64_t v76 = 0;
  }
  int v77 = v16;
  uint64_t v17 = [(MTLTexture *)self->_fusedLuma width];
  unint64_t v18 = [(MTLTexture *)self->_fusedLuma height];
  int v19 = [v12 inputColorSpace];
  BOOL v59 = v19 == 1;
  BOOL v58 = v19 == 2;
  int v20 = (_OWORD *)[v12 colorSpaceConversionParameters];
  v57[0] = *v20;
  long long v21 = v20[4];
  long long v23 = v20[1];
  long long v22 = v20[2];
  v57[3] = v20[3];
  v57[4] = v21;
  v57[1] = v23;
  v57[2] = v22;
  long long v24 = v20[8];
  long long v26 = v20[5];
  long long v25 = v20[6];
  v57[7] = v20[7];
  v57[8] = v24;
  v57[5] = v26;
  v57[6] = v25;
  long long v27 = v20[12];
  long long v29 = v20[9];
  long long v28 = v20[10];
  v57[11] = v20[11];
  v57[12] = v27;
  v57[9] = v29;
  v57[10] = v28;
  if (!self->_canMitigationProceed || !self->_maskMB || !self->_ggFusionWeightsAcc) {
    goto LABEL_13;
  }
  long long v30 = [(FigMetalContext *)self->_metal allocator];
  uint64_t v31 = (void *)[v30 newTextureDescriptor];

  if (!v31)
  {
    FigDebugAssert3();
    int v50 = FigSignalErrorAt();
    goto LABEL_14;
  }
  unint64_t v52 = v17;
  long long v32 = [v31 desc];
  [v32 setCompressionMode:2];

  float v33 = [v31 desc];
  [v33 setCompressionFootprint:0];

  uint64_t v34 = [v31 desc];
  [v34 setUsage:7];

  uint64_t v35 = [v31 desc];
  [v35 setPixelFormat:25];

  uint64_t v36 = [(MTLTexture *)self->_maskMB width];
  long long v37 = [v31 desc];
  [v37 setWidth:v36];

  uint64_t v38 = [(MTLTexture *)self->_maskMB height];
  long long v39 = [v31 desc];
  [v39 setHeight:v38];

  [v31 setLabel:0];
  id v40 = [(FigMetalContext *)self->_metal allocator];
  uint64_t v41 = (void *)[v40 newTextureWithDescriptor:v31];
  id v95 = v41;

  if (!v41)
  {
    FigDebugAssert3();
    int v50 = FigSignalErrorAt();
LABEL_18:

    goto LABEL_14;
  }
  LODWORD(v42) = v15;
  int v43 = [(GreenGhostCommon *)self->_greenGhostCommon erodeTexture:self->_maskMB withNormalizedRadius:v41 output:v42];
  if (v43)
  {
    int v50 = v43;
    FigDebugAssert3();
    goto LABEL_18;
  }
  id v53 = v11;
  id v44 = v10;
  int v45 = [(FigMetalContext *)self->_metal commandQueue];
  int v46 = [v45 commandBuffer];

  if (!v46)
  {
    FigDebugAssert3();
    int v50 = FigSignalErrorAt();
LABEL_21:

    id v10 = v44;
    id v11 = v53;
    goto LABEL_14;
  }
  id v47 = [v46 computeCommandEncoder];
  if (!v47)
  {
    FigDebugAssert3();
    int v50 = FigSignalErrorAt();

    goto LABEL_21;
  }
  double v48 = v47;
  [v47 setComputePipelineState:self->_pipelineStates[9]];
  [v48 setImageblockWidth:32 height:32];
  float v49 = v44;
  [v48 setTexture:v44 atIndex:0];
  id v11 = v53;
  [v48 setTexture:v53 atIndex:1];
  [v48 setTexture:v41 atIndex:2];
  [v48 setTexture:self->_ggFusionWeightsAcc atIndex:3];
  [v48 setTexture:self->_fusedLuma atIndex:4];
  [v48 setTexture:self->_fusedChroma atIndex:5];
  [v48 setBytes:&v59 length:1 atIndex:0];
  [v48 setBytes:&v58 length:1 atIndex:1];
  [v48 setBytes:v57 length:208 atIndex:2];
  [v48 setBytes:&v77 length:4 atIndex:3];
  v56[0] = v52 >> 1;
  v56[1] = v18 >> 1;
  v56[2] = 1;
  int64x2_t v54 = vdupq_n_s64(0x10uLL);
  uint64_t v55 = 1;
  [v48 dispatchThreads:v56 threadsPerThreadgroup:&v54];
  [v48 endEncoding];
  [v46 commit];
  FigMetalDecRef();

  id v10 = v49;
LABEL_13:
  int v50 = 0;
LABEL_14:

  return v50;
}

- (int)updateMaskAndComputeGradientForLuma:(id)a3 output:(id)a4 params:(LowLightInpaintTuning *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v39 = 0;
  uint64_t v38 = *(void *)&a5->var0;
  id v10 = [(FigMetalContext *)self->_metal allocator];
  id v11 = (void *)[v10 newTextureDescriptor];

  if (!v11) {
    goto LABEL_12;
  }
  id v12 = [v11 desc];
  [v12 setCompressionMode:2];

  id v13 = [v11 desc];
  [v13 setCompressionFootprint:0];

  double v14 = [v11 desc];
  [v14 setUsage:7];

  uint64_t v15 = [(MTLTexture *)self->_maskMB pixelFormat];
  int v16 = [v11 desc];
  [v16 setPixelFormat:v15];

  uint64_t v17 = [(MTLTexture *)self->_maskMB width];
  unint64_t v18 = [v11 desc];
  [v18 setWidth:v17];

  uint64_t v19 = [(MTLTexture *)self->_maskMB height];
  int v20 = [v11 desc];
  [v20 setHeight:v19];

  [v11 setLabel:0];
  long long v21 = [(FigMetalContext *)self->_metal allocator];
  long long v22 = (void *)[v21 newTextureWithDescriptor:v11];
  id v39 = v22;

  if (!v22) {
    goto LABEL_12;
  }
  long long v23 = [(FigMetalContext *)self->_metal commandQueue];
  long long v24 = [v23 commandBuffer];

  if (v24)
  {
    long long v25 = [v24 computeCommandEncoder];
    if (v25)
    {
      long long v26 = v25;
      [v25 setComputePipelineState:self->_pipelineStates[10]];
      [v26 setTexture:v8 atIndex:0];
      [v26 setTexture:self->_ggMaxFusionWeights atIndex:1];
      [v26 setTexture:self->_maskMB atIndex:2];
      id v35 = v9;
      [v26 setTexture:v9 atIndex:3];
      [v26 setTexture:v22 atIndex:4];
      [v26 setBytes:&v38 length:8 atIndex:0];
      unint64_t v27 = [(MTLComputePipelineState *)self->_pipelineStates[10] threadExecutionWidth];
      unint64_t v28 = [(MTLComputePipelineState *)self->_pipelineStates[10] maxTotalThreadsPerThreadgroup]/ v27;
      v37[0] = [v8 width];
      v37[1] = [v8 height];
      v37[2] = 1;
      v36[0] = v27;
      v36[1] = v28;
      v36[2] = 1;
      [v26 dispatchThreads:v37 threadsPerThreadgroup:v36];
      [v26 endEncoding];
      [v24 commit];
      float var2 = (float)a5->var2;
      unint64_t v30 = [v22 width];
      if (v30 <= [v22 height]) {
        unint64_t v31 = [v22 height];
      }
      else {
        unint64_t v31 = [v22 width];
      }
      *(float *)&double v32 = var2 / (float)v31;
      int v33 = [(GreenGhostCommon *)self->_greenGhostCommon dilateTexture:v22 withNormalizedRadius:self->_maskMB output:v32];
      id v9 = v35;
      if (v33) {
        FigDebugAssert3();
      }
      else {
        FigMetalDecRef();
      }
    }
    else
    {
      FigDebugAssert3();
      int v33 = FigSignalErrorAt();
    }
  }
  else
  {
LABEL_12:
    FigDebugAssert3();
    int v33 = FigSignalErrorAt();
  }

  return v33;
}

- (int)propagateLuma:(id)a3 chroma:(id)a4 gradient:(id)a5 outputLuma:(id)a6 outputChroma:(id)a7 outputGradient:(id)a8 params:(LowLightInpaintTuning *)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  float var0 = 0.0;
  id v57 = 0;
  long long v21 = [(FigMetalContext *)self->_metal allocator];
  long long v22 = (void *)[v21 newTextureDescriptor];

  if (!v22)
  {
    FigDebugAssert3();
    int v51 = FigSignalErrorAt();
    goto LABEL_11;
  }
  long long v23 = [v22 desc];
  [v23 setCompressionMode:2];

  long long v24 = [v22 desc];
  [v24 setCompressionFootprint:0];

  long long v25 = [v22 desc];
  [v25 setUsage:7];

  uint64_t v26 = [(MTLTexture *)self->_maskMB pixelFormat];
  unint64_t v27 = [v22 desc];
  [v27 setPixelFormat:v26];

  uint64_t v28 = [(MTLTexture *)self->_maskMB width];
  long long v29 = [v22 desc];
  [v29 setWidth:v28];

  uint64_t v30 = [(MTLTexture *)self->_maskMB height];
  int64x2_t v54 = v22;
  unint64_t v31 = [v22 desc];
  [v31 setHeight:v30];

  unint64_t v32 = [(MTLTexture *)self->_maskMB width];
  unint64_t v33 = [(MTLTexture *)self->_maskMB height];
  maskMB = self->_maskMB;
  id v35 = v16;
  if (v32 <= v33) {
    uint64_t v36 = [(MTLTexture *)maskMB height];
  }
  else {
    uint64_t v36 = [(MTLTexture *)maskMB width];
  }
  unint64_t v37 = v36;
  [v54 setLabel:0];
  uint64_t v38 = [(FigMetalContext *)self->_metal allocator];
  id v39 = (void *)[v38 newTextureWithDescriptor:v54];
  id v57 = v39;

  if (!v39) {
    goto LABEL_15;
  }
  *(float *)&double v40 = 1.0 / (float)v37;
  int v41 = [(GreenGhostCommon *)self->_greenGhostCommon dilateTexture:self->_maskMB withNormalizedRadius:v39 output:v40];
  if (v41)
  {
    int v51 = v41;
    FigDebugAssert3();
LABEL_17:
    id v16 = v35;
    goto LABEL_10;
  }
  float var0 = a9->var5.var0;
  double v42 = [(FigMetalContext *)self->_metal commandQueue];
  int v43 = [v42 commandBuffer];

  if (!v43)
  {
LABEL_15:
    FigDebugAssert3();
    int v51 = FigSignalErrorAt();
    goto LABEL_17;
  }
  id v44 = [v43 computeCommandEncoder];
  if (!v44)
  {
    FigDebugAssert3();
    int v51 = FigSignalErrorAt();

    goto LABEL_17;
  }
  int v45 = v44;
  [v44 setComputePipelineState:self->_pipelineStates[11]];
  [v45 setTexture:v15 atIndex:0];
  id v53 = v35;
  [v45 setTexture:v35 atIndex:1];
  [v45 setTexture:v17 atIndex:2];
  [v45 setTexture:self->_maskMB atIndex:3];
  [v45 setTexture:v39 atIndex:4];
  [v45 setTexture:v18 atIndex:5];
  [v45 setTexture:v19 atIndex:6];
  [v45 setTexture:v20 atIndex:7];
  [v45 setBytes:&var0 length:4 atIndex:0];
  unint64_t v46 = [(MTLComputePipelineState *)self->_pipelineStates[11] threadExecutionWidth];
  id v47 = v20;
  id v48 = v19;
  id v49 = v18;
  unint64_t v50 = [(MTLComputePipelineState *)self->_pipelineStates[11] maxTotalThreadsPerThreadgroup]/ v46;
  v56[0] = [v15 width];
  v56[1] = [v15 height];
  v56[2] = 1;
  v55[0] = v46;
  v55[1] = v50;
  id v18 = v49;
  id v19 = v48;
  id v20 = v47;
  void v55[2] = 1;
  [v45 dispatchThreads:v56 threadsPerThreadgroup:v55];
  [v45 endEncoding];
  [v43 commit];
  FigMetalDecRef();

  id v16 = v53;
  int v51 = 0;
LABEL_10:
  long long v22 = v54;
LABEL_11:

  return v51;
}

- (int)prepareInpaintingWithLuma:(id)a3 andChroma:(id)a4 outputLuma:(id)a5 outputChroma:(id)a6 outputGradient:(id)a7 params:(LowLightInpaintTuning *)a8
{
  id v14 = a3;
  id v42 = a4;
  id v40 = a5;
  id v41 = a6;
  id v15 = a7;
  id v44 = 0;
  int v45 = 0;
  int v43 = 0;
  id v16 = [(FigMetalContext *)self->_metal allocator];
  id v17 = (void *)[v16 newTextureDescriptor];

  if (!v17) {
    goto LABEL_12;
  }
  id v18 = [v17 desc];
  [v18 setCompressionMode:2];

  id v19 = [v17 desc];
  [v19 setCompressionFootprint:0];

  id v20 = [v17 desc];
  [v20 setUsage:7];

  uint64_t v21 = [v15 pixelFormat];
  long long v22 = [v17 desc];
  [v22 setPixelFormat:v21];

  uint64_t v23 = [v15 width];
  long long v24 = [v17 desc];
  [v24 setWidth:v23];

  uint64_t v25 = [v15 height];
  uint64_t v26 = [v17 desc];
  [v26 setHeight:v25];

  [v17 setLabel:0];
  unint64_t v27 = [(FigMetalContext *)self->_metal allocator];
  uint64_t v28 = [v27 newTextureWithDescriptor:v17];
  int v45 = (void *)v28;

  if (!v28) {
    goto LABEL_12;
  }
  [v17 setLabel:0];
  long long v29 = [(FigMetalContext *)self->_metal allocator];
  uint64_t v30 = [v29 newTextureWithDescriptor:v17];
  id v44 = (void *)v30;

  if (!v30
    || ([v17 setLabel:0],
        [(FigMetalContext *)self->_metal allocator],
        unint64_t v31 = objc_claimAutoreleasedReturnValue(),
        uint64_t v32 = [v31 newTextureWithDescriptor:v17],
        int v43 = (void *)v32,
        v31,
        !v32))
  {
LABEL_12:
    FigDebugAssert3();
    int v38 = FigSignalErrorAt();
LABEL_16:
    id v35 = v40;
    goto LABEL_11;
  }
  int v33 = [(GreenGhostLowLightStage *)self updateMaskAndComputeGradientForLuma:v14 output:v28 params:a8];
  if (v33)
  {
    int v38 = v33;
LABEL_15:
    FigDebugAssert3();
    goto LABEL_16;
  }
  int v34 = [(GreenGhostLowLightStage *)self propagateLuma:v14 chroma:v42 gradient:v28 outputLuma:v32 outputChroma:v41 outputGradient:v15 params:a8];
  if (v34)
  {
    int v38 = v34;
    goto LABEL_15;
  }
  id v35 = v40;
  int v36 = [(GreenGhostCommon *)self->_greenGhostCommon boxFilter:v32 withRadius:LODWORD(a8->var3) output:v40];
  if (v36)
  {
    int v38 = v36;
    goto LABEL_19;
  }
  int v37 = [(GreenGhostCommon *)self->_greenGhostCommon boxFilter:self->_maskMB withRadius:LODWORD(a8->var4) output:v30];
  if (v37)
  {
    int v38 = v37;
    goto LABEL_19;
  }
  int v38 = [(GreenGhostCommon *)self->_greenGhostCommon boxFilter:v30 withRadius:LODWORD(a8->var4) output:self->_maskMB];
  if (v38)
  {
LABEL_19:
    FigDebugAssert3();
    goto LABEL_11;
  }
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
LABEL_11:

  return v38;
}

- (int)applyInpaintWithDownscaledLuma:(id)a3 propagatedLuma:(id)a4 downscaledChroma:(id)a5 propagatedChroma:(id)a6 propagatedGradient:(id)a7 maskPreInpainting:(id)a8 outputLuma:(id)a9 outputChroma:(id)a10 params:(LowLightInpaintTuning *)a11
{
  id v46 = a3;
  id v17 = a4;
  id v18 = a5;
  id v45 = a6;
  id v19 = a7;
  id v44 = a8;
  id v20 = a9;
  id v43 = a10;
  uint64_t v21 = [v20 width];
  uint64_t v22 = [v20 height];
  uint64_t v23 = [(FigMetalContext *)self->_metal commandQueue];
  long long v24 = [v23 commandBuffer];

  if (v24)
  {
    unint64_t v39 = v22;
    unint64_t v40 = v21;
    id v42 = v20;
    uint64_t v25 = v19;
    id v26 = v17;
    unint64_t v27 = [v24 computeCommandEncoder];
    id v41 = v24;
    if (v27)
    {
      uint64_t v28 = v27;
      [v27 setComputePipelineState:self->_pipelineStates[12]];
      [v28 setImageblockWidth:32 height:32];
      long long v29 = v46;
      [v28 setTexture:v46 atIndex:0];
      uint64_t v30 = v26;
      [v28 setTexture:v26 atIndex:1];
      [v28 setTexture:v18 atIndex:2];
      unint64_t v31 = v45;
      [v28 setTexture:v45 atIndex:3];
      [v28 setTexture:self->_maskMB atIndex:4];
      [v28 setTexture:v25 atIndex:5];
      uint64_t v32 = v42;
      [v28 setTexture:v42 atIndex:6];
      int v33 = v43;
      [v28 setTexture:v43 atIndex:7];
      int v34 = v44;
      [v28 setTexture:v44 atIndex:8];
      [v28 setTexture:self->_ggFusionWeightsAcc atIndex:9];
      [v28 setBytes:a11 length:88 atIndex:0];
      [v28 setBytes:&self->_faceBodyBoundaries length:352 atIndex:1];
      [v28 setBytes:&self->_nonRefFramesCount length:4 atIndex:2];
      v49[0] = v40 >> 1;
      v49[1] = v39 >> 1;
      v49[2] = 1;
      int64x2_t v47 = vdupq_n_s64(0x10uLL);
      uint64_t v48 = 1;
      [v28 dispatchThreads:v49 threadsPerThreadgroup:&v47];
      [v28 endEncoding];
      id v35 = v41;
      [v41 commit];

      int v36 = v30;
      int v37 = 0;
    }
    else
    {
      FigDebugAssert3();
      int v37 = FigSignalErrorAt();
      unint64_t v31 = v45;
      long long v29 = v46;
      int v36 = v26;
      int v33 = v43;
      int v34 = v44;
      id v35 = v41;
      uint64_t v32 = v42;
    }
  }
  else
  {
    FigDebugAssert3();
    uint64_t v32 = v20;
    int v37 = FigSignalErrorAt();
    int v36 = v17;
    uint64_t v25 = v19;
    unint64_t v31 = v45;
    long long v29 = v46;
    id v35 = 0;
    int v33 = v43;
    int v34 = v44;
  }

  return v37;
}

- (int)inpaintLuma:(id)a3 andChroma:(id)a4 tuningParams:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  if (v11)
  {
    [v11 tuningParams];
  }
  else
  {
    uint64_t v60 = 0;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v55 = 0u;
  }
  v61[2] = v57;
  v61[3] = v58;
  v61[4] = v59;
  uint64_t v62 = v60;
  v61[0] = v55;
  v61[1] = v56;
  id v53 = 0;
  int64x2_t v54 = 0;
  int v51 = 0;
  unint64_t v52 = 0;
  id v49 = 0;
  unint64_t v50 = 0;
  unint64_t v12 = [v9 width];
  uint64_t v13 = [v9 height];
  if (!self->_canMitigationProceed) {
    goto LABEL_21;
  }
  if (!self->_maskMB)
  {
    id v43 = objc_opt_new();
    [v43 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"skipRepair"];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_sidecarWriter);
    [WeakRetained addToSidecar:v43 forKey:@"GreenGhostLowLight"];

LABEL_21:
    int v42 = 0;
    goto LABEL_22;
  }
  unint64_t v14 = v13;
  id v15 = [(FigMetalContext *)self->_metal allocator];
  id v16 = (void *)[v15 newTextureDescriptor];

  if (!v16)
  {
    uint64_t v47 = v5;
    LODWORD(v46) = 0;
    FigDebugAssert3();
    int v42 = FigSignalErrorAt();
    goto LABEL_22;
  }
  unint64_t v17 = v12 >> 2;
  unint64_t v18 = v14 >> 2;
  id v19 = [v16 desc];
  [v19 setCompressionMode:2];

  id v20 = [v16 desc];
  [v20 setCompressionFootprint:0];

  uint64_t v21 = [v16 desc];
  [v21 setUsage:7];

  uint64_t v22 = [v16 desc];
  [v22 setWidth:v17];

  uint64_t v23 = [v16 desc];
  [v23 setHeight:v18];

  long long v24 = [v16 desc];
  [v24 setPixelFormat:25];

  [v16 setLabel:0];
  uint64_t v25 = [(FigMetalContext *)self->_metal allocator];
  int64x2_t v54 = (void *)[v25 newTextureWithDescriptor:v16];

  if (!v54)
  {
    uint64_t v47 = v5;
    LODWORD(v46) = 0;
LABEL_26:
    FigDebugAssert3();
    int v42 = FigSignalErrorAt();

    goto LABEL_22;
  }
  [v16 setLabel:0];
  id v26 = [(FigMetalContext *)self->_metal allocator];
  uint64_t v27 = [v26 newTextureWithDescriptor:v16];
  id v53 = (void *)v27;

  if (!v27)
  {
    uint64_t v47 = v5;
    LODWORD(v46) = 0;
    goto LABEL_26;
  }
  id v48 = v11;
  [v16 setLabel:0];
  uint64_t v28 = [(FigMetalContext *)self->_metal allocator];
  uint64_t v29 = [v28 newTextureWithDescriptor:v16];
  unint64_t v50 = (void *)v29;

  if (!v29)
  {
    uint64_t v47 = v5;
    LODWORD(v46) = 0;
LABEL_31:
    FigDebugAssert3();
    int v42 = FigSignalErrorAt();
    goto LABEL_19;
  }
  [v16 setLabel:0];
  uint64_t v30 = [(FigMetalContext *)self->_metal allocator];
  uint64_t v31 = [v30 newTextureWithDescriptor:v16];
  int v51 = (void *)v31;

  if (!v31)
  {
    uint64_t v47 = v5;
    LODWORD(v46) = 0;
    goto LABEL_31;
  }
  uint64_t v32 = [v16 desc];
  [v32 setPixelFormat:65];

  [v16 setLabel:0];
  int v33 = [(FigMetalContext *)self->_metal allocator];
  uint64_t v34 = [v33 newTextureWithDescriptor:v16];
  unint64_t v52 = (void *)v34;

  if (!v34)
  {
    uint64_t v47 = v5;
    LODWORD(v46) = 0;
    goto LABEL_31;
  }
  [v16 setLabel:0];
  id v35 = [(FigMetalContext *)self->_metal allocator];
  uint64_t v36 = [v35 newTextureWithDescriptor:v16];
  id v49 = (void *)v36;

  if (!v36)
  {
    uint64_t v47 = v5;
    LODWORD(v46) = 0;
    goto LABEL_31;
  }
  int v37 = [(TextureUtils *)self->_textureUtils copyTexture:self->_maskMB outTex:v54];
  if (v37)
  {
    int v42 = v37;
    uint64_t v47 = v5;
    LODWORD(v46) = v37;
LABEL_37:
    FigDebugAssert3();
    goto LABEL_19;
  }
  int v38 = [(GreenGhostCommon *)self->_greenGhostCommon downscaleInput:v9 output:v27];
  if (v38)
  {
    int v42 = v38;
    uint64_t v47 = v5;
    LODWORD(v46) = v38;
    goto LABEL_37;
  }
  int v39 = [(GreenGhostCommon *)self->_greenGhostCommon downscaleInput:v10 output:v34];
  if (v39)
  {
    int v42 = v39;
    uint64_t v47 = v5;
    LODWORD(v46) = v39;
    goto LABEL_37;
  }
  int v40 = [(GreenGhostLowLightStage *)self prepareInpaintingWithLuma:v27 andChroma:v34 outputLuma:v29 outputChroma:v36 outputGradient:v31 params:v61];
  if (v40)
  {
    int v42 = v40;
    uint64_t v47 = v5;
    LODWORD(v46) = v40;
    goto LABEL_37;
  }
  int v41 = [(GreenGhostLowLightStage *)self applyInpaintWithDownscaledLuma:v27 propagatedLuma:v29 downscaledChroma:v34 propagatedChroma:v36 propagatedGradient:v31 maskPreInpainting:v54 outputLuma:v9 outputChroma:v10 params:v61];
  int v42 = v41;
  if (v41)
  {
    uint64_t v47 = v5;
    LODWORD(v46) = v41;
    goto LABEL_37;
  }
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
LABEL_19:

  id v11 = v48;
LABEL_22:
  [(GreenGhostLowLightStage *)self releaseTextures];

  return v42;
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
  objc_storeStrong((id *)&self->_sumMaskBuffer, 0);
  objc_storeStrong((id *)&self->_ggFusionWeightsAcc, 0);
  objc_storeStrong((id *)&self->_ggMaxFusionWeights, 0);
  objc_storeStrong((id *)&self->_fusedChroma, 0);
  objc_storeStrong((id *)&self->_fusedLuma, 0);
  objc_storeStrong((id *)&self->_maskMB, 0);
  objc_storeStrong((id *)&self->_maxVariationTex, 0);
  objc_storeStrong((id *)&self->_maskSB, 0);
  objc_storeStrong((id *)&self->_refChroma, 0);
  objc_storeStrong((id *)&self->_textureUtils, 0);
  objc_storeStrong((id *)&self->_greenGhostCommon, 0);
  for (uint64_t i = 112; i != 8; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);

  objc_storeStrong((id *)&self->_metal, 0);
}

@end