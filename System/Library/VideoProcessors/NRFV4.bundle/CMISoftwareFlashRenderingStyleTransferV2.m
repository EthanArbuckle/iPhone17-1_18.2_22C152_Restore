@interface CMISoftwareFlashRenderingStyleTransferV2
- (CMISoftwareFlashRenderingStyleTransferV2)initWithMetalContext:(id)a3 externalMemoryResource:(id)a4;
- (int)_encodeLearningModulationMaskCalculate:(id)a3 skinMaskTexture:(id)a4 skinClosedMaskTexture:(id)a5 personMaskTexture:(id)a6 personModulationWeight:(float)a7 skinModulationWeight:(float)a8 skinGapModulationWeight:(float)a9 outputLearningModulationMaskRTexture:(id)a10;
- (int)_encodeMorphologicalDilateCalculate:(id)a3 inputMaskRTexture:(id)a4 kernelSize:(unsigned int)a5 outputDilatedMaskRTexture:(id)a6;
- (int)_encodeMorphologicalErodeCalculate:(id)a3 inputMaskRTexture:(id)a4 kernelSize:(unsigned int)a5 outputErodedMaskRTexture:(id)a6;
- (int)_encodeRGBtoRGBThumbnailGaussianResampleCalculate:(id)a3 inputRGBTexture:(id)a4 sharpness:(float)a5 sigmaToFilterScale:(float)a6 gammaCorrection:(float)a7 thumbnailIntermediateRGBTexture:(id)a8 outputRGBTexture:(id)a9;
- (int)_encodeRtoRThumbnailBoxCalculate:(id)a3 inputRTexture:(id)a4 cropRect:(CMISoftwareFlashRenderingCropRect)a5 inputLumaDimensions:(id)a6 outputRTexture:;
- (int)_encodeSpatialWhitePointsCalculate:(CMISoftwareFlashRenderingStyleTransferV2 *)self sourceLumaTexture:(SEL)a2 sourceChromaTexture:(id)a3 targetLumaTexture:(id)a4 targetChromaTexture:(id)a5 yuvOffsets:(id)a6 cropRect:(id)a7 sourceAppliedWhitePoint:(CMISoftwareFlashRenderingCropRect)a8 outputSpatialWhitePointsRBTexture:(id)a9;
- (int)_encodeStyleTransferWithQualityMode:(id)a3 inputLumaTexture:(id)a4 inputChromaTexture:(id)a5 sourceThumbnailRGBTexture:(id)a6 targetThumbnailRGBTexture:(id)a7 styleEngineCoefficientsTexture:(id)a8 styleEngineLinearSystemStatusFlagBuffer:(id)a9 styleEngineGammaCorrection:(float)a10 inputYUVOffsets:(CMISoftwareFlashRenderingCropRect)a11 cropRect:(BOOL)a12 clippingCorrectionEnabled:(float)a13 clippingCorrectionTransitionGain:(float)a14 clippingCorrectionTransitionExponent:(id)a15 outputLumaTexture:(id)a16 outputChromaTexture:;
- (int)_encodeStyleTransferWithSpeedMode:(id)a3 inputLumaTexture:(id)a4 inputChromaTexture:(id)a5 sourceThumbnailRGBTexture:(id)a6 targetThumbnailRGBTexture:(id)a7 inputYUVOffsets:(CMISoftwareFlashRenderingCropRect)a8 cropRect:(BOOL)a9 clippingCorrectionEnabled:(float)a10 clippingCorrectionTransitionGain:(float)a11 clippingCorrectionTransitionExponent:(id)a12 outputLumaTexture:(id)a13 outputChromaTexture:;
- (int)_encodeZeroImage:(id)a3 outputLumaTexture:(id)a4 outputChromaTexture:(id)a5;
- (int)applyStyleTransferWithBufferClearing:(CMISoftwareFlashRenderingStyleTransferV2 *)self inputChromaTexture:(SEL)a2 sourceRGBTexture:(id)a3 targetRGBTexture:(id)a4 skinMaskTexture:(id)a5 personMaskTexture:(id)a6 inputYUVOffsets:(id)a7 cropRect:(id)a8 appliedWhitePoint:(CMISoftwareFlashRenderingCropRect)a9 outputSpatialWhitePointsRBTexture:(id)a10 outputLumaTexture:(id)a11 outputChromaTexture:(id)a12;
- (int)finishProcessing;
- (int)prepareToProcessWithConfig:(id)a3;
- (int)purgeResources;
@end

@implementation CMISoftwareFlashRenderingStyleTransferV2

- (CMISoftwareFlashRenderingStyleTransferV2)initWithMetalContext:(id)a3 externalMemoryResource:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v44.receiver = self;
  v44.super_class = (Class)CMISoftwareFlashRenderingStyleTransferV2;
  v9 = [(CMISoftwareFlashRenderingStyleTransferV2 *)&v44 init];
  v10 = v9;
  if (!v9) {
    goto LABEL_19;
  }
  if (!v7) {
    goto LABEL_19;
  }
  objc_storeStrong((id *)&v9->_metalContext, a3);
  uint64_t v11 = [(FigMetalContext *)v10->_metalContext computePipelineStateFor:@"zeroImageV2" constants:0];
  zeroImagePipelineState = v10->_zeroImagePipelineState;
  v10->_zeroImagePipelineState = (MTLComputePipelineState *)v11;

  if (!v10->_zeroImagePipelineState) {
    goto LABEL_19;
  }
  uint64_t v13 = [(FigMetalContext *)v10->_metalContext computePipelineStateFor:@"calculateRGBtoRGBThumbnailGaussianResampleHorizonalPassV2" constants:0];
  calculateRGBtoRGBThumbnailGaussianResampleHorizonalPassPipelineState = v10->_calculateRGBtoRGBThumbnailGaussianResampleHorizonalPassPipelineState;
  v10->_calculateRGBtoRGBThumbnailGaussianResampleHorizonalPassPipelineState = (MTLComputePipelineState *)v13;

  if (!v10->_calculateRGBtoRGBThumbnailGaussianResampleHorizonalPassPipelineState) {
    goto LABEL_19;
  }
  uint64_t v15 = [(FigMetalContext *)v10->_metalContext computePipelineStateFor:@"calculateRGBtoRGBThumbnailGaussianResampleVerticalPassV2" constants:0];
  calculateRGBtoRGBThumbnailGaussianResampleVerticalPassPipelineState = v10->_calculateRGBtoRGBThumbnailGaussianResampleVerticalPassPipelineState;
  v10->_calculateRGBtoRGBThumbnailGaussianResampleVerticalPassPipelineState = (MTLComputePipelineState *)v15;

  if (!v10->_calculateRGBtoRGBThumbnailGaussianResampleVerticalPassPipelineState) {
    goto LABEL_19;
  }
  uint64_t v17 = [(FigMetalContext *)v10->_metalContext computePipelineStateFor:@"calculateRtoRThumbnailBoxV2" constants:0];
  calculateRtoRThumbnailBoxPipelineState = v10->_calculateRtoRThumbnailBoxPipelineState;
  v10->_calculateRtoRThumbnailBoxPipelineState = (MTLComputePipelineState *)v17;

  if (!v10->_calculateRtoRThumbnailBoxPipelineState) {
    goto LABEL_19;
  }
  uint64_t v19 = [(FigMetalContext *)v10->_metalContext computePipelineStateFor:@"calculateMorphologicalDilateV2" constants:0];
  calculateMorphologicalDilatePipelineState = v10->_calculateMorphologicalDilatePipelineState;
  v10->_calculateMorphologicalDilatePipelineState = (MTLComputePipelineState *)v19;

  if (!v10->_calculateMorphologicalDilatePipelineState) {
    goto LABEL_19;
  }
  uint64_t v21 = [(FigMetalContext *)v10->_metalContext computePipelineStateFor:@"calculateMorphologicalErodeV2" constants:0];
  calculateMorphologicalErodePipelineState = v10->_calculateMorphologicalErodePipelineState;
  v10->_calculateMorphologicalErodePipelineState = (MTLComputePipelineState *)v21;

  if (!v10->_calculateMorphologicalErodePipelineState) {
    goto LABEL_19;
  }
  uint64_t v23 = [(FigMetalContext *)v10->_metalContext computePipelineStateFor:@"calculateLearningModulationMaskV2" constants:0];
  calculateLearningModulationMaskPipelineState = v10->_calculateLearningModulationMaskPipelineState;
  v10->_calculateLearningModulationMaskPipelineState = (MTLComputePipelineState *)v23;

  if (!v10->_calculateLearningModulationMaskPipelineState) {
    goto LABEL_19;
  }
  uint64_t v25 = [(FigMetalContext *)v10->_metalContext computePipelineStateFor:@"transferStyleWithSpeedModeV2" constants:0];
  transferStyleWithSpeedModePipelineState = v10->_transferStyleWithSpeedModePipelineState;
  v10->_transferStyleWithSpeedModePipelineState = (MTLComputePipelineState *)v25;

  if (!v10->_transferStyleWithSpeedModePipelineState) {
    goto LABEL_19;
  }
  uint64_t v27 = [(FigMetalContext *)v10->_metalContext computePipelineStateFor:@"calculateSpatialWhitePointsV2" constants:0];
  calculateSpatialWhitePointsPipelineState = v10->_calculateSpatialWhitePointsPipelineState;
  v10->_calculateSpatialWhitePointsPipelineState = (MTLComputePipelineState *)v27;

  if (!v10->_calculateSpatialWhitePointsPipelineState) {
    goto LABEL_19;
  }
  uint64_t v29 = [(FigMetalContext *)v10->_metalContext computePipelineStateFor:@"transferStyleWithQualityModeV2" constants:0];
  transferStyleWithQualityModePipelineState = v10->_transferStyleWithQualityModePipelineState;
  v10->_transferStyleWithQualityModePipelineState = (MTLComputePipelineState *)v29;

  if (!v10->_transferStyleWithQualityModePipelineState) {
    goto LABEL_19;
  }
  if (!FigGetCFPreferenceNumberWithDefault())
  {
    id v32 = objc_alloc(MEMORY[0x263F2EDD8]);
    v33 = [(FigMetalContext *)v10->_metalContext commandQueue];
    uint64_t v34 = [v32 initWithOptionalMetalCommandQueue:v33];
    styleEngineProcessor = v10->_styleEngineProcessor;
    v10->_styleEngineProcessor = (CMIStyleEngineProcessor *)v34;

    [(CMIStyleEngineProcessor *)v10->_styleEngineProcessor setExternalMemoryResource:v8];
    if (v10->_styleEngineProcessor)
    {
      v31 = (void *)[objc_alloc(NSDictionary) initWithObjects:&unk_270E979A8 forKeys:&unk_270E979C0];
      [(CMIStyleEngineProcessor *)v10->_styleEngineProcessor setTuningParameters:v31];
      v36 = objc_opt_new();
      [(CMIStyleEngineProcessor *)v10->_styleEngineProcessor setConfiguration:v36];

      v37 = [(CMIStyleEngineProcessor *)v10->_styleEngineProcessor configuration];
      [v37 setLinearSystemType:1];

      v38 = [(CMIStyleEngineProcessor *)v10->_styleEngineProcessor configuration];
      [v38 setLinearSystemOrder:1];

      v39 = [(CMIStyleEngineProcessor *)v10->_styleEngineProcessor configuration];
      [v39 setLinearSystemSolver:0];

      v40 = [(CMIStyleEngineProcessor *)v10->_styleEngineProcessor configuration];
      [v40 setWeightPlaneCount:8];

      v41 = [(CMIStyleEngineProcessor *)v10->_styleEngineProcessor configuration];
      [v41 setSpotlightCount:COERCE_DOUBLE(0x90000000CLL)];

      if (![(CMIStyleEngineProcessor *)v10->_styleEngineProcessor setup]) {
        goto LABEL_17;
      }
      fig_log_get_emitter();
      FigDebugAssert3();

LABEL_20:
      v42 = 0;
      goto LABEL_18;
    }
LABEL_19:
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_20;
  }
  v31 = 0;
LABEL_17:
  v42 = v10;

LABEL_18:
  return v42;
}

- (int)purgeResources
{
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  if ([(CMIStyleEngineProcessor *)self->_styleEngineProcessor resetState]
    || (int result = [(CMIStyleEngineProcessor *)self->_styleEngineProcessor purgeResources]) != 0)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 10;
  }
  return result;
}

- (int)prepareToProcessWithConfig:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    objc_storeStrong((id *)&self->_config, a3);
    v6 = [(FigMetalContext *)self->_metalContext allocator];
    id v7 = (void *)[v6 newTextureDescriptor];

    if (v7)
    {
      id v8 = [v7 desc];
      [v8 setTextureType:2];

      uint64_t v9 = [(CMISoftwareFlashRenderingStyleTransferV2Configuration *)self->_config styleTransferThumbnailWidth];
      v10 = [v7 desc];
      [v10 setWidth:v9];

      uint64_t v11 = [(CMISoftwareFlashRenderingStyleTransferV2Configuration *)self->_config styleTransferThumbnailHeight];
      v12 = [v7 desc];
      [v12 setHeight:v11];

      uint64_t v13 = [v7 desc];
      [v13 setPixelFormat:125];

      [v7 setLabel:0];
      v14 = [(FigMetalContext *)self->_metalContext allocator];
      uint64_t v15 = (MTLTexture *)[v14 newTextureWithDescriptor:v7];
      sourceThumbnailRGBTexture = self->_sourceThumbnailRGBTexture;
      self->_sourceThumbnailRGBTexture = v15;

      if (!self->_sourceThumbnailRGBTexture) {
        goto LABEL_17;
      }
      [v7 setLabel:0];
      uint64_t v17 = [(FigMetalContext *)self->_metalContext allocator];
      v18 = (MTLTexture *)[v17 newTextureWithDescriptor:v7];
      targetThumbnailRGBTexture = self->_targetThumbnailRGBTexture;
      self->_targetThumbnailRGBTexture = v18;

      if (!self->_targetThumbnailRGBTexture) {
        goto LABEL_17;
      }
      v20 = [v7 desc];
      [v20 setPixelFormat:25];

      [v7 setLabel:0];
      uint64_t v21 = [(FigMetalContext *)self->_metalContext allocator];
      v22 = (MTLTexture *)[v21 newTextureWithDescriptor:v7];
      skinMaskThumbnailRTexture = self->_skinMaskThumbnailRTexture;
      self->_skinMaskThumbnailRTexture = v22;

      if (!self->_skinMaskThumbnailRTexture) {
        goto LABEL_17;
      }
      [v7 setLabel:0];
      v24 = [(FigMetalContext *)self->_metalContext allocator];
      uint64_t v25 = (MTLTexture *)[v24 newTextureWithDescriptor:v7];
      skinDilatedMaskThumbnailRTexture = self->_skinDilatedMaskThumbnailRTexture;
      self->_skinDilatedMaskThumbnailRTexture = v25;

      if (!self->_skinDilatedMaskThumbnailRTexture) {
        goto LABEL_17;
      }
      [v7 setLabel:0];
      uint64_t v27 = [(FigMetalContext *)self->_metalContext allocator];
      v28 = (MTLTexture *)[v27 newTextureWithDescriptor:v7];
      skinClosedMaskThumbnailRTexture = self->_skinClosedMaskThumbnailRTexture;
      self->_skinClosedMaskThumbnailRTexture = v28;

      if (!self->_skinClosedMaskThumbnailRTexture) {
        goto LABEL_17;
      }
      [v7 setLabel:0];
      v30 = [(FigMetalContext *)self->_metalContext allocator];
      v31 = (MTLTexture *)[v30 newTextureWithDescriptor:v7];
      personMaskThumbnailRTexture = self->_personMaskThumbnailRTexture;
      self->_personMaskThumbnailRTexture = v31;

      if (!self->_personMaskThumbnailRTexture) {
        goto LABEL_17;
      }
      [v7 setLabel:0];
      v33 = [(FigMetalContext *)self->_metalContext allocator];
      uint64_t v34 = (MTLTexture *)[v33 newTextureWithDescriptor:v7];
      learningModulationMaskThumbnailRTexture = self->_learningModulationMaskThumbnailRTexture;
      self->_learningModulationMaskThumbnailRTexture = v34;

      if (!self->_learningModulationMaskThumbnailRTexture) {
        goto LABEL_17;
      }
      uint64_t v36 = [(CMISoftwareFlashRenderingStyleTransferV2Configuration *)self->_config sourceThumbnailWidth];
      v37 = [v7 desc];
      [v37 setWidth:v36];

      uint64_t v38 = [(CMISoftwareFlashRenderingStyleTransferV2Configuration *)self->_config styleTransferThumbnailHeight];
      v39 = [v7 desc];
      [v39 setHeight:v38];

      v40 = [v7 desc];
      [v40 setPixelFormat:125];

      [v7 setLabel:0];
      v41 = [(FigMetalContext *)self->_metalContext allocator];
      v42 = (MTLTexture *)[v41 newTextureWithDescriptor:v7];
      thumbnailIntermediateRGBTexture = self->_thumbnailIntermediateRGBTexture;
      self->_thumbnailIntermediateRGBTexture = v42;

      if (self->_thumbnailIntermediateRGBTexture)
      {
        if (!-[CMISoftwareFlashRenderingStyleTransferV2Configuration speedModeStyleTransferEnabled](self->_config, "speedModeStyleTransferEnabled")&& (double v44 = (double)-[CMISoftwareFlashRenderingStyleTransferV2Configuration styleTransferThumbnailWidth](self->_config, "styleTransferThumbnailWidth"), v45 = (double)-[CMISoftwareFlashRenderingStyleTransferV2Configuration styleTransferThumbnailHeight](self->_config, "styleTransferThumbnailHeight"), -[CMIStyleEngineProcessor configuration](self->_styleEngineProcessor, "configuration"), v46 = objc_claimAutoreleasedReturnValue(), objc_msgSend(v46, "setThumbnailSize:", v44, v45), v46, -[CMIStyleEngineProcessor prepareToProcess:](self->_styleEngineProcessor, "prepareToProcess:", 3)))
        {
          fig_log_get_emitter();
          FigDebugAssert3();
          int v47 = 10;
        }
        else
        {
          int v47 = 0;
        }
      }
      else
      {
LABEL_17:
        fig_log_get_emitter();
        FigDebugAssert3();
        int v47 = 6;
      }
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      int v47 = 7;
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    id v7 = 0;
    int v47 = 11;
  }

  return v47;
}

- (int)finishProcessing
{
  int v2 = [(CMIStyleEngineProcessor *)self->_styleEngineProcessor finishProcessing];
  if (v2) {
    BOOL v3 = v2 == 13;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3) {
    return 0;
  }
  else {
    return 10;
  }
}

- (int)_encodeZeroImage:(id)a3 outputLumaTexture:(id)a4 outputChromaTexture:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8 && ([v8 computeCommandEncoder], (uint64_t v11 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v12 = v11;
    [v11 setComputePipelineState:self->_zeroImagePipelineState];
    [v12 setTexture:v9 atIndex:0];
    [v12 setTexture:v10 atIndex:1];
    unint64_t v13 = [(MTLComputePipelineState *)self->_zeroImagePipelineState threadExecutionWidth];
    unint64_t v14 = [(MTLComputePipelineState *)self->_zeroImagePipelineState maxTotalThreadsPerThreadgroup]/ v13;
    v18[0] = [v10 width];
    v18[1] = [v10 height];
    v18[2] = 1;
    v17[0] = v13;
    v17[1] = v14;
    v17[2] = 1;
    [v12 dispatchThreads:v18 threadsPerThreadgroup:v17];
    [v12 endEncoding];

    int v15 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v15 = 8;
  }

  return v15;
}

- (int)_encodeRGBtoRGBThumbnailGaussianResampleCalculate:(id)a3 inputRGBTexture:(id)a4 sharpness:(float)a5 sigmaToFilterScale:(float)a6 gammaCorrection:(float)a7 thumbnailIntermediateRGBTexture:(id)a8 outputRGBTexture:(id)a9
{
  id v16 = a3;
  id v17 = a4;
  *(float *)uint64_t v34 = a5;
  float v32 = a7;
  float v33 = a6;
  id v18 = a8;
  id v19 = a9;
  if (v16 && ([v16 computeCommandEncoder], (v20 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v21 = v20;
    [v20 setComputePipelineState:self->_calculateRGBtoRGBThumbnailGaussianResampleHorizonalPassPipelineState];
    [v21 setTexture:v17 atIndex:0];
    [v21 setTexture:v18 atIndex:1];
    [v21 setBytes:v34 length:4 atIndex:0];
    [v21 setBytes:&v33 length:4 atIndex:1];
    unint64_t v22 = [(MTLComputePipelineState *)self->_calculateRGBtoRGBThumbnailGaussianResampleHorizonalPassPipelineState threadExecutionWidth];
    unint64_t v23 = [(MTLComputePipelineState *)self->_calculateRGBtoRGBThumbnailGaussianResampleHorizonalPassPipelineState maxTotalThreadsPerThreadgroup]/ v22;
    v31[0] = [v18 width];
    v31[1] = [v18 height];
    v31[2] = 1;
    v30[0] = v22;
    v30[1] = v23;
    v30[2] = 1;
    [v21 dispatchThreads:v31 threadsPerThreadgroup:v30];
    [v21 setComputePipelineState:self->_calculateRGBtoRGBThumbnailGaussianResampleVerticalPassPipelineState];
    [v21 setTexture:v18 atIndex:0];
    [v21 setTexture:v19 atIndex:1];
    [v21 setBytes:v34 length:4 atIndex:0];
    [v21 setBytes:&v33 length:4 atIndex:1];
    [v21 setBytes:&v32 length:4 atIndex:2];
    unint64_t v24 = [(MTLComputePipelineState *)self->_calculateRGBtoRGBThumbnailGaussianResampleVerticalPassPipelineState threadExecutionWidth];
    unint64_t v25 = [(MTLComputePipelineState *)self->_calculateRGBtoRGBThumbnailGaussianResampleVerticalPassPipelineState maxTotalThreadsPerThreadgroup]/ v24;
    v29[0] = [v19 width];
    v29[1] = [v19 height];
    v29[2] = 1;
    v28[0] = v24;
    v28[1] = v25;
    v28[2] = 1;
    [v21 dispatchThreads:v29 threadsPerThreadgroup:v28];
    [v21 endEncoding];

    int v26 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v26 = 8;
  }

  return v26;
}

- (int)_encodeRtoRThumbnailBoxCalculate:(id)a3 inputRTexture:(id)a4 cropRect:(CMISoftwareFlashRenderingCropRect)a5 inputLumaDimensions:(id)a6 outputRTexture:
{
  uint64_t v8 = v6;
  CMISoftwareFlashRenderingCropRect v23 = a5;
  id v11 = a3;
  id v12 = a4;
  uint64_t v22 = v8;
  id v13 = a6;
  if (v11 && ([v11 computeCommandEncoder], (unint64_t v14 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    int v15 = v14;
    [v14 setComputePipelineState:self->_calculateRtoRThumbnailBoxPipelineState];
    [v15 setTexture:v12 atIndex:0];
    [v15 setTexture:v13 atIndex:1];
    [v15 setBytes:&v23 length:16 atIndex:0];
    [v15 setBytes:&v22 length:8 atIndex:1];
    unint64_t v16 = [(MTLComputePipelineState *)self->_calculateRtoRThumbnailBoxPipelineState threadExecutionWidth];
    unint64_t v17 = [(MTLComputePipelineState *)self->_calculateRtoRThumbnailBoxPipelineState maxTotalThreadsPerThreadgroup]/ v16;
    v21[0] = [v13 width];
    v21[1] = [v13 height];
    v21[2] = 1;
    v20[0] = v16;
    v20[1] = v17;
    v20[2] = 1;
    [v15 dispatchThreads:v21 threadsPerThreadgroup:v20];
    [v15 endEncoding];

    int v18 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v18 = 8;
  }

  return v18;
}

- (int)_encodeMorphologicalDilateCalculate:(id)a3 inputMaskRTexture:(id)a4 kernelSize:(unsigned int)a5 outputDilatedMaskRTexture:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  unsigned int v21 = a5;
  id v12 = a6;
  if (v10 && ([v10 computeCommandEncoder], (id v13 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    unint64_t v14 = v13;
    [v13 setComputePipelineState:self->_calculateMorphologicalDilatePipelineState];
    [v14 setTexture:v11 atIndex:0];
    [v14 setTexture:v12 atIndex:1];
    [v14 setBytes:&v21 length:4 atIndex:0];
    unint64_t v15 = [(MTLComputePipelineState *)self->_calculateMorphologicalDilatePipelineState threadExecutionWidth];
    unint64_t v16 = [(MTLComputePipelineState *)self->_calculateMorphologicalDilatePipelineState maxTotalThreadsPerThreadgroup]/ v15;
    v20[0] = [v12 width];
    v20[1] = [v12 height];
    v20[2] = 1;
    v19[0] = v15;
    v19[1] = v16;
    v19[2] = 1;
    [v14 dispatchThreads:v20 threadsPerThreadgroup:v19];
    [v14 endEncoding];

    int v17 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v17 = 8;
  }

  return v17;
}

- (int)_encodeMorphologicalErodeCalculate:(id)a3 inputMaskRTexture:(id)a4 kernelSize:(unsigned int)a5 outputErodedMaskRTexture:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  unsigned int v21 = a5;
  id v12 = a6;
  if (v10 && ([v10 computeCommandEncoder], (id v13 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    unint64_t v14 = v13;
    [v13 setComputePipelineState:self->_calculateMorphologicalErodePipelineState];
    [v14 setTexture:v11 atIndex:0];
    [v14 setTexture:v12 atIndex:1];
    [v14 setBytes:&v21 length:4 atIndex:0];
    unint64_t v15 = [(MTLComputePipelineState *)self->_calculateMorphologicalErodePipelineState threadExecutionWidth];
    unint64_t v16 = [(MTLComputePipelineState *)self->_calculateMorphologicalErodePipelineState maxTotalThreadsPerThreadgroup]/ v15;
    v20[0] = [v12 width];
    v20[1] = [v12 height];
    v20[2] = 1;
    v19[0] = v15;
    v19[1] = v16;
    v19[2] = 1;
    [v14 dispatchThreads:v20 threadsPerThreadgroup:v19];
    [v14 endEncoding];

    int v17 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v17 = 8;
  }

  return v17;
}

- (int)_encodeLearningModulationMaskCalculate:(id)a3 skinMaskTexture:(id)a4 skinClosedMaskTexture:(id)a5 personMaskTexture:(id)a6 personModulationWeight:(float)a7 skinModulationWeight:(float)a8 skinGapModulationWeight:(float)a9 outputLearningModulationMaskRTexture:(id)a10
{
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  float v32 = a8;
  float v33 = a7;
  float v31 = a9;
  id v22 = a10;
  if (v18 && ([v18 computeCommandEncoder], (CMISoftwareFlashRenderingCropRect v23 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    unint64_t v24 = v23;
    [v23 setComputePipelineState:self->_calculateLearningModulationMaskPipelineState];
    [v24 setTexture:v19 atIndex:0];
    [v24 setTexture:v20 atIndex:1];
    [v24 setTexture:v21 atIndex:2];
    [v24 setTexture:v22 atIndex:3];
    [v24 setBytes:&v33 length:4 atIndex:0];
    [v24 setBytes:&v32 length:4 atIndex:1];
    [v24 setBytes:&v31 length:4 atIndex:2];
    unint64_t v25 = [(MTLComputePipelineState *)self->_calculateLearningModulationMaskPipelineState threadExecutionWidth];
    unint64_t v26 = [(MTLComputePipelineState *)self->_calculateLearningModulationMaskPipelineState maxTotalThreadsPerThreadgroup]/ v25;
    v30[0] = [v22 width];
    v30[1] = [v22 height];
    v30[2] = 1;
    v29[0] = v25;
    v29[1] = v26;
    v29[2] = 1;
    [v24 dispatchThreads:v30 threadsPerThreadgroup:v29];
    [v24 endEncoding];

    int v27 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v27 = 8;
  }

  return v27;
}

- (int)_encodeStyleTransferWithSpeedMode:(id)a3 inputLumaTexture:(id)a4 inputChromaTexture:(id)a5 sourceThumbnailRGBTexture:(id)a6 targetThumbnailRGBTexture:(id)a7 inputYUVOffsets:(CMISoftwareFlashRenderingCropRect)a8 cropRect:(BOOL)a9 clippingCorrectionEnabled:(float)a10 clippingCorrectionTransitionGain:(float)a11 clippingCorrectionTransitionExponent:(id)a12 outputLumaTexture:(id)a13 outputChromaTexture:
{
  int v18 = v13;
  long long v39 = *(_OWORD *)&a10;
  CMISoftwareFlashRenderingCropRect v46 = a8;
  id v21 = a3;
  id v22 = a4;
  id v23 = a5;
  id v24 = a6;
  id v25 = a7;
  long long v45 = v39;
  BOOL v44 = a9;
  int v42 = v18;
  float v43 = a11;
  id v26 = a12;
  id v27 = a13;
  if (v21 && ([v21 computeCommandEncoder], (v28 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v29 = v28;
    [v28 setComputePipelineState:self->_transferStyleWithSpeedModePipelineState];
    [v29 setTexture:v22 atIndex:0];
    [v29 setTexture:v23 atIndex:1];
    [v29 setTexture:v24 atIndex:2];
    [v29 setTexture:v25 atIndex:3];
    [v29 setTexture:v26 atIndex:4];
    [v29 setTexture:v27 atIndex:5];
    [v29 setBytes:&v45 length:16 atIndex:0];
    [v29 setBytes:&v46 length:16 atIndex:1];
    [v29 setBytes:&v44 length:1 atIndex:2];
    [v29 setBytes:&v43 length:4 atIndex:3];
    [v29 setBytes:&v42 length:4 atIndex:4];
    uint64_t v30 = [(MTLComputePipelineState *)self->_transferStyleWithSpeedModePipelineState threadExecutionWidth];
    float v31 = self;
    id v32 = v27;
    id v33 = v21;
    id v34 = v26;
    unint64_t v35 = v30;
    unint64_t v36 = [(MTLComputePipelineState *)v31->_transferStyleWithSpeedModePipelineState maxTotalThreadsPerThreadgroup];
    v41[0] = a8.var0 >> 1;
    v41[1] = *(void *)&a8.var0 >> 33;
    v41[2] = 1;
    v40[0] = v35;
    v40[1] = v36 / v35;
    id v26 = v34;
    id v21 = v33;
    id v27 = v32;
    v40[2] = 1;
    [v29 dispatchThreads:v41 threadsPerThreadgroup:v40];
    [v29 endEncoding];

    int v37 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v37 = 8;
  }

  return v37;
}

- (int)_encodeStyleTransferWithQualityMode:(id)a3 inputLumaTexture:(id)a4 inputChromaTexture:(id)a5 sourceThumbnailRGBTexture:(id)a6 targetThumbnailRGBTexture:(id)a7 styleEngineCoefficientsTexture:(id)a8 styleEngineLinearSystemStatusFlagBuffer:(id)a9 styleEngineGammaCorrection:(float)a10 inputYUVOffsets:(CMISoftwareFlashRenderingCropRect)a11 cropRect:(BOOL)a12 clippingCorrectionEnabled:(float)a13 clippingCorrectionTransitionGain:(float)a14 clippingCorrectionTransitionExponent:(id)a15 outputLumaTexture:(id)a16 outputChromaTexture:
{
  int v22 = v16;
  long long v45 = *(_OWORD *)&a13;
  CMISoftwareFlashRenderingCropRect v54 = a11;
  id v25 = a3;
  id v26 = a4;
  id v27 = a5;
  id v28 = a6;
  id v29 = a7;
  id v44 = a8;
  id v30 = a9;
  float v53 = a10;
  long long v52 = v45;
  BOOL v51 = a12;
  int v49 = v22;
  float v50 = a14;
  id v31 = a15;
  id v32 = a16;
  CMISoftwareFlashRenderingCropRect v46 = v25;
  if (v25 && ([v25 computeCommandEncoder], (id v33 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v34 = v33;
    [v33 setComputePipelineState:self->_transferStyleWithQualityModePipelineState];
    [v34 setTexture:v26 atIndex:0];
    [v34 setTexture:v27 atIndex:1];
    [v34 setTexture:v28 atIndex:2];
    [v34 setTexture:v29 atIndex:3];
    [v34 setTexture:v44 atIndex:4];
    [v34 setTexture:v31 atIndex:5];
    [v34 setTexture:v32 atIndex:6];
    [v34 setBytes:&v52 length:16 atIndex:0];
    [v34 setBytes:&v54 length:16 atIndex:1];
    [v34 setBytes:&v51 length:1 atIndex:2];
    [v34 setBytes:&v50 length:4 atIndex:3];
    [v34 setBytes:&v49 length:4 atIndex:4];
    [v34 setBuffer:v30 offset:0 atIndex:5];
    [v34 setBytes:&v53 length:4 atIndex:6];
    unint64_t v35 = v32;
    id v36 = v31;
    id v37 = v27;
    unint64_t v38 = [(MTLComputePipelineState *)self->_transferStyleWithQualityModePipelineState threadExecutionWidth];
    unint64_t v39 = [(MTLComputePipelineState *)self->_transferStyleWithQualityModePipelineState maxTotalThreadsPerThreadgroup];
    v48[0] = a11.var0 >> 1;
    v48[1] = *(void *)&a11.var0 >> 33;
    v48[2] = 1;
    v47[0] = v38;
    v47[1] = v39 / v38;
    id v27 = v37;
    id v31 = v36;
    v40 = v44;
    v47[2] = 1;
    [v34 dispatchThreads:v48 threadsPerThreadgroup:v47];
    [v34 endEncoding];

    int v41 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v41 = 8;
    unint64_t v35 = v32;
    v40 = v44;
  }

  return v41;
}

- (int)_encodeSpatialWhitePointsCalculate:(CMISoftwareFlashRenderingStyleTransferV2 *)self sourceLumaTexture:(SEL)a2 sourceChromaTexture:(id)a3 targetLumaTexture:(id)a4 targetChromaTexture:(id)a5 yuvOffsets:(id)a6 cropRect:(id)a7 sourceAppliedWhitePoint:(CMISoftwareFlashRenderingCropRect)a8 outputSpatialWhitePointsRBTexture:(id)a9
{
  long long v31 = v9;
  long long v32 = v10;
  CMISoftwareFlashRenderingCropRect v37 = a8;
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  long long v35 = v32;
  long long v36 = v31;
  id v21 = a9;
  if (v16 && ([v16 computeCommandEncoder], (int v22 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v23 = v22;
    [v22 setComputePipelineState:self->_calculateSpatialWhitePointsPipelineState];
    [v23 setTexture:v17 atIndex:0];
    [v23 setTexture:v18 atIndex:1];
    [v23 setTexture:v19 atIndex:2];
    [v23 setTexture:v20 atIndex:3];
    [v23 setTexture:v21 atIndex:4];
    [v23 setBytes:&v36 length:16 atIndex:0];
    [v23 setBytes:&v37 length:16 atIndex:1];
    [v23 setBytes:&v35 length:16 atIndex:2];
    unint64_t v24 = [(MTLComputePipelineState *)self->_calculateSpatialWhitePointsPipelineState threadExecutionWidth];
    id v25 = v19;
    id v26 = v18;
    id v27 = v17;
    unint64_t v28 = [(MTLComputePipelineState *)self->_calculateSpatialWhitePointsPipelineState maxTotalThreadsPerThreadgroup]/ v24;
    v34[0] = [v21 width];
    v34[1] = [v21 height];
    v34[2] = 1;
    v33[0] = v24;
    v33[1] = v28;
    id v17 = v27;
    id v18 = v26;
    id v19 = v25;
    v33[2] = 1;
    [v23 dispatchThreads:v34 threadsPerThreadgroup:v33];
    [v23 endEncoding];

    int v29 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v29 = 8;
  }

  return v29;
}

- (int)applyStyleTransferWithBufferClearing:(CMISoftwareFlashRenderingStyleTransferV2 *)self inputChromaTexture:(SEL)a2 sourceRGBTexture:(id)a3 targetRGBTexture:(id)a4 skinMaskTexture:(id)a5 personMaskTexture:(id)a6 inputYUVOffsets:(id)a7 cropRect:(id)a8 appliedWhitePoint:(CMISoftwareFlashRenderingCropRect)a9 outputSpatialWhitePointsRBTexture:(id)a10 outputLumaTexture:(id)a11 outputChromaTexture:(id)a12
{
  double v84 = v13;
  double v89 = v12;
  id v20 = a3;
  id v21 = a4;
  id v86 = a5;
  id v90 = a6;
  id v88 = a7;
  id v87 = a8;
  id v85 = a10;
  id v91 = a11;
  id v22 = a12;
  uint64_t v23 = [(FigMetalContext *)self->_metalContext commandBuffer];
  if (!v23)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v78 = FigSignalErrorAt();
LABEL_23:
    CMISoftwareFlashRenderingCropRect v37 = v85;
    unint64_t v28 = v86;
    goto LABEL_20;
  }
  unint64_t v24 = (void *)v23;
  int v25 = [(CMISoftwareFlashRenderingStyleTransferV2 *)self _encodeZeroImage:v23 outputLumaTexture:v91 outputChromaTexture:v22];
  if (v25)
  {
    int v78 = v25;
    fig_log_get_emitter();
    FigDebugAssert3();

    goto LABEL_23;
  }
  BOOL v26 = [(CMISoftwareFlashRenderingStyleTransferV2Configuration *)self->_config speedModeStyleTransferEnabled];
  config = self->_config;
  unint64_t v28 = v86;
  if (!v26)
  {
    [(CMISoftwareFlashRenderingStyleTransferV2Configuration *)config styleTransferThumbnailSharpness];
    int v39 = v38;
    [(CMISoftwareFlashRenderingStyleTransferV2Configuration *)self->_config styleTransferThumbnailSigmaToFilterScale];
    int v41 = v40;
    [(CMISoftwareFlashRenderingStyleTransferV2Configuration *)self->_config styleTransferGammaCorrection];
    LODWORD(v43) = v42;
    LODWORD(v44) = v39;
    LODWORD(v45) = v41;
    int v35 = [(CMISoftwareFlashRenderingStyleTransferV2 *)self _encodeRGBtoRGBThumbnailGaussianResampleCalculate:v24 inputRGBTexture:v86 sharpness:self->_thumbnailIntermediateRGBTexture sigmaToFilterScale:self->_sourceThumbnailRGBTexture gammaCorrection:v44 thumbnailIntermediateRGBTexture:v45 outputRGBTexture:v43];
    if (!v35)
    {
      [(CMISoftwareFlashRenderingStyleTransferV2Configuration *)self->_config styleTransferThumbnailSharpness];
      int v47 = v46;
      [(CMISoftwareFlashRenderingStyleTransferV2Configuration *)self->_config styleTransferThumbnailSigmaToFilterScale];
      int v49 = v48;
      [(CMISoftwareFlashRenderingStyleTransferV2Configuration *)self->_config styleTransferGammaCorrection];
      LODWORD(v51) = v50;
      LODWORD(v52) = v47;
      LODWORD(v53) = v49;
      int v35 = [(CMISoftwareFlashRenderingStyleTransferV2 *)self _encodeRGBtoRGBThumbnailGaussianResampleCalculate:v24 inputRGBTexture:v90 sharpness:self->_thumbnailIntermediateRGBTexture sigmaToFilterScale:self->_targetThumbnailRGBTexture gammaCorrection:v52 thumbnailIntermediateRGBTexture:v53 outputRGBTexture:v51];
      if (!v35)
      {
        unsigned int v54 = [v20 width];
        double v82 = COERCE_DOUBLE(__PAIR64__([v20 height], v54));
        int v35 = [(CMISoftwareFlashRenderingStyleTransferV2 *)self _encodeRtoRThumbnailBoxCalculate:v24 inputRTexture:v88 cropRect:*(void *)&a9.var0 inputLumaDimensions:*(void *)&a9.var2 outputRTexture:self->_skinMaskThumbnailRTexture];
        if (!v35)
        {
          int v35 = -[CMISoftwareFlashRenderingStyleTransferV2 _encodeRtoRThumbnailBoxCalculate:inputRTexture:cropRect:inputLumaDimensions:outputRTexture:](self, "_encodeRtoRThumbnailBoxCalculate:inputRTexture:cropRect:inputLumaDimensions:outputRTexture:", v24, v87, *(void *)&a9.var0, *(void *)&a9.var2, self->_personMaskThumbnailRTexture, v82);
          if (!v35)
          {
            int v35 = [(CMISoftwareFlashRenderingStyleTransferV2 *)self _encodeMorphologicalDilateCalculate:v24 inputMaskRTexture:self->_skinMaskThumbnailRTexture kernelSize:[(CMISoftwareFlashRenderingStyleTransferV2Configuration *)self->_config learningModulationMaskCloseKernelSize] outputDilatedMaskRTexture:self->_skinDilatedMaskThumbnailRTexture];
            if (!v35)
            {
              int v35 = [(CMISoftwareFlashRenderingStyleTransferV2 *)self _encodeMorphologicalErodeCalculate:v24 inputMaskRTexture:self->_skinDilatedMaskThumbnailRTexture kernelSize:[(CMISoftwareFlashRenderingStyleTransferV2Configuration *)self->_config learningModulationMaskCloseKernelSize] outputErodedMaskRTexture:self->_skinClosedMaskThumbnailRTexture];
              if (!v35)
              {
                id v83 = v21;
                skinMaskThumbnailRTexture = self->_skinMaskThumbnailRTexture;
                skinClosedMaskThumbnailRTexture = self->_skinClosedMaskThumbnailRTexture;
                personMaskThumbnailRTexture = self->_personMaskThumbnailRTexture;
                [(CMISoftwareFlashRenderingStyleTransferV2Configuration *)self->_config learningModulationMaskPersonModulationWeight];
                int v59 = v58;
                [(CMISoftwareFlashRenderingStyleTransferV2Configuration *)self->_config learningModulationMaskSkinModulationWeight];
                int v61 = v60;
                [(CMISoftwareFlashRenderingStyleTransferV2Configuration *)self->_config learningModulationMaskSkinGapModulationWeight];
                LODWORD(v63) = v62;
                LODWORD(v64) = v59;
                LODWORD(v65) = v61;
                int v66 = [(CMISoftwareFlashRenderingStyleTransferV2 *)self _encodeLearningModulationMaskCalculate:v24 skinMaskTexture:skinMaskThumbnailRTexture skinClosedMaskTexture:skinClosedMaskThumbnailRTexture personMaskTexture:personMaskThumbnailRTexture personModulationWeight:self->_learningModulationMaskThumbnailRTexture skinModulationWeight:v64 skinGapModulationWeight:v65 outputLearningModulationMaskRTexture:v63];
                if (v66)
                {
                  int v78 = v66;
                  fig_log_get_emitter();
                  FigDebugAssert3();

                  id v21 = v83;
                }
                else
                {
                  [(FigMetalContext *)self->_metalContext commit];
                  [(CMIStyleEngineProcessor *)self->_styleEngineProcessor setInputLearningModulationMaskTexture:self->_learningModulationMaskThumbnailRTexture];
                  [(CMIStyleEngineProcessor *)self->_styleEngineProcessor setInputThumbnailTexture:self->_sourceThumbnailRGBTexture];
                  [(CMIStyleEngineProcessor *)self->_styleEngineProcessor setTargetThumbnailTexture:self->_targetThumbnailRGBTexture];
                  id v21 = v83;
                  if ([(CMIStyleEngineProcessor *)self->_styleEngineProcessor process])
                  {
                    fig_log_get_emitter();
                    FigDebugAssert3();

                    int v78 = 10;
                  }
                  else
                  {
                    long long v36 = [(FigMetalContext *)self->_metalContext commandBuffer];

                    if (v36)
                    {
                      v67 = [(CMIStyleEngineProcessor *)self->_styleEngineProcessor outputIntegratedCoefficients];
                      v68 = [(CMIStyleEngineProcessor *)self->_styleEngineProcessor outputLinearSystemStatusFlag];
                      [(CMISoftwareFlashRenderingStyleTransferV2Configuration *)self->_config styleTransferGammaCorrection];
                      int v70 = v69;
                      BOOL v71 = [(CMISoftwareFlashRenderingStyleTransferV2Configuration *)self->_config clippingCorrectionEnabled];
                      [(CMISoftwareFlashRenderingStyleTransferV2Configuration *)self->_config clippingCorrectionTransitionGain];
                      int v73 = v72;
                      [(CMISoftwareFlashRenderingStyleTransferV2Configuration *)self->_config clippingCorrectionTransitionExponent];
                      LODWORD(v75) = v74;
                      LOBYTE(v81) = v71;
                      LODWORD(v76) = v70;
                      LODWORD(v77) = v73;
                      unint64_t v28 = v86;
                      int v78 = -[CMISoftwareFlashRenderingStyleTransferV2 _encodeStyleTransferWithQualityMode:inputLumaTexture:inputChromaTexture:sourceThumbnailRGBTexture:targetThumbnailRGBTexture:styleEngineCoefficientsTexture:styleEngineLinearSystemStatusFlagBuffer:styleEngineGammaCorrection:inputYUVOffsets:cropRect:clippingCorrectionEnabled:clippingCorrectionTransitionGain:clippingCorrectionTransitionExponent:outputLumaTexture:outputChromaTexture:](self, "_encodeStyleTransferWithQualityMode:inputLumaTexture:inputChromaTexture:sourceThumbnailRGBTexture:targetThumbnailRGBTexture:styleEngineCoefficientsTexture:styleEngineLinearSystemStatusFlagBuffer:styleEngineGammaCorrection:inputYUVOffsets:cropRect:clippingCorrectionEnabled:clippingCorrectionTransitionGain:clippingCorrectionTransitionExponent:outputLumaTexture:outputChromaTexture:", v36, v20, v83, v86, v90, v67, v76, v89, v77, v75, v68, *(void *)&a9.var0, *(void *)&a9.var2,
                              v81,
                              v91,
                              v22);

                      if (v78)
                      {
                        fig_log_get_emitter();
                        FigDebugAssert3();

                        id v21 = v83;
                        CMISoftwareFlashRenderingCropRect v37 = v85;
                        goto LABEL_20;
                      }
                      id v21 = v83;
                      CMISoftwareFlashRenderingCropRect v37 = v85;
                      goto LABEL_17;
                    }
                    fig_log_get_emitter();
                    FigDebugAssert3();
                    int v78 = FigSignalErrorAt();
                  }
                }
LABEL_26:
                CMISoftwareFlashRenderingCropRect v37 = v85;
                goto LABEL_20;
              }
            }
          }
        }
      }
    }
LABEL_25:
    int v78 = v35;
    fig_log_get_emitter();
    FigDebugAssert3();

    goto LABEL_26;
  }
  BOOL v29 = [(CMISoftwareFlashRenderingStyleTransferV2Configuration *)config clippingCorrectionEnabled];
  [(CMISoftwareFlashRenderingStyleTransferV2Configuration *)self->_config clippingCorrectionTransitionGain];
  int v31 = v30;
  [(CMISoftwareFlashRenderingStyleTransferV2Configuration *)self->_config clippingCorrectionTransitionExponent];
  LODWORD(v33) = v32;
  LOBYTE(v80) = v29;
  LODWORD(v34) = v31;
  int v35 = -[CMISoftwareFlashRenderingStyleTransferV2 _encodeStyleTransferWithSpeedMode:inputLumaTexture:inputChromaTexture:sourceThumbnailRGBTexture:targetThumbnailRGBTexture:inputYUVOffsets:cropRect:clippingCorrectionEnabled:clippingCorrectionTransitionGain:clippingCorrectionTransitionExponent:outputLumaTexture:outputChromaTexture:](self, "_encodeStyleTransferWithSpeedMode:inputLumaTexture:inputChromaTexture:sourceThumbnailRGBTexture:targetThumbnailRGBTexture:inputYUVOffsets:cropRect:clippingCorrectionEnabled:clippingCorrectionTransitionGain:clippingCorrectionTransitionExponent:outputLumaTexture:outputChromaTexture:", v24, v20, v21, v86, v90, v89, v34, v33, *(void *)&a9.var0, *(void *)&a9.var2, v80, v91, v22);
  if (v35) {
    goto LABEL_25;
  }
  long long v36 = v24;
  CMISoftwareFlashRenderingCropRect v37 = v85;
LABEL_17:
  int v78 = -[CMISoftwareFlashRenderingStyleTransferV2 _encodeSpatialWhitePointsCalculate:sourceLumaTexture:sourceChromaTexture:targetLumaTexture:targetChromaTexture:yuvOffsets:cropRect:sourceAppliedWhitePoint:outputSpatialWhitePointsRBTexture:](self, "_encodeSpatialWhitePointsCalculate:sourceLumaTexture:sourceChromaTexture:targetLumaTexture:targetChromaTexture:yuvOffsets:cropRect:sourceAppliedWhitePoint:outputSpatialWhitePointsRBTexture:", v36, v20, v21, v91, v22, v89, v84, *(void *)&a9.var0, *(void *)&a9.var2, v37);
  if (v78)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  else
  {
    [(FigMetalContext *)self->_metalContext commit];
  }

LABEL_20:
  return v78;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleEngineProcessor, 0);
  objc_storeStrong((id *)&self->_learningModulationMaskThumbnailRTexture, 0);
  objc_storeStrong((id *)&self->_personMaskThumbnailRTexture, 0);
  objc_storeStrong((id *)&self->_skinClosedMaskThumbnailRTexture, 0);
  objc_storeStrong((id *)&self->_skinDilatedMaskThumbnailRTexture, 0);
  objc_storeStrong((id *)&self->_skinMaskThumbnailRTexture, 0);
  objc_storeStrong((id *)&self->_thumbnailIntermediateRGBTexture, 0);
  objc_storeStrong((id *)&self->_targetThumbnailRGBTexture, 0);
  objc_storeStrong((id *)&self->_sourceThumbnailRGBTexture, 0);
  objc_storeStrong((id *)&self->_calculateSpatialWhitePointsPipelineState, 0);
  objc_storeStrong((id *)&self->_transferStyleWithQualityModePipelineState, 0);
  objc_storeStrong((id *)&self->_transferStyleWithSpeedModePipelineState, 0);
  objc_storeStrong((id *)&self->_calculateLearningModulationMaskPipelineState, 0);
  objc_storeStrong((id *)&self->_calculateMorphologicalErodePipelineState, 0);
  objc_storeStrong((id *)&self->_calculateMorphologicalDilatePipelineState, 0);
  objc_storeStrong((id *)&self->_calculateRtoRThumbnailBoxPipelineState, 0);
  objc_storeStrong((id *)&self->_calculateRGBtoRGBThumbnailGaussianResampleVerticalPassPipelineState, 0);
  objc_storeStrong((id *)&self->_calculateRGBtoRGBThumbnailGaussianResampleHorizonalPassPipelineState, 0);
  objc_storeStrong((id *)&self->_zeroImagePipelineState, 0);
  objc_storeStrong((id *)&self->_config, 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end