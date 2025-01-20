@interface CMIColourConstancyStyleTransferV1
- (CMIColourConstancyStyleTransferV1)initWithMetalContext:(id)a3;
- (id)applyStyleTransferWithBufferClearing:(double)a3 inputChromaTexture:(double)a4 appliedScaledLSCGainsRGBTexture:(double)a5 sourceRGBTexture:(double)a6 targetRGBTexture:(uint64_t)a7 toneCompressionCurveTexture:(void *)a8 inputYUVOffsets:(void *)a9 cropRect:(void *)a10 appliedWhitePoint:(void *)a11 strobeCCM:(void *)a12 outputReconstructedTargetRGBTexture:(void *)a13 outputLumaTexture:(uint64_t)a14 outputChromaTexture:(uint64_t)a15;
- (int)_encodeRGBtoRGBThumbnailGaussianResampleCalculate:(id)a3 inputRGBTexture:(id)a4 sharpness:(float)a5 sigmaToFilterScale:(float)a6 gammaCorrection:(float)a7 thumbnailIntermediateRGBTexture:(id)a8 outputRGBTexture:(id)a9;
- (int)_encodeStyleTargetFromSourceWithQualityModeReconstruct:(id)a3 sourceThumbnailRGBTexture:(id)a4 targetThumbnailRGBTexture:(id)a5 styleEngineCoefficientsTexture:(id)a6 styleEngineLinearSystemStatusFlagBuffer:(id)a7 styleEngineGammaCorrection:(float)a8 outputReconstructedTargetThumbnailRGBTexture:(id)a9;
- (int)_encodeStyleTargetFromSourceWithSpeedModeReconstruct:(id)a3 sourceThumbnailRGBTexture:(id)a4 targetThumbnailRGBTexture:(id)a5 outputReconstructedTargetThumbnailRGBTexture:(id)a6;
- (int)_encodeZeroImage:(id)a3 outputLumaTexture:(id)a4 outputChromaTexture:(id)a5;
- (int)finishProcessing;
- (int)prepareToProcessWithConfig:(id)a3;
- (int)purgeResources;
- (uint64_t)_encodeStyleTransferWithQualityMode:(__n128)a3 inputLumaTexture:(__n128)a4 inputChromaTexture:(float)a5 appliedScaledLSCGainsRGBTexture:(float)a6 sourceThumbnailRGBTexture:(__n128)a7 targetThumbnailRGBTexture:(__n128)a8 toneCompressionCurveTexture:(__n128)a9 styleEngineCoefficientsTexture:(uint64_t)a10 styleEngineLinearSystemStatusFlagBuffer:(void *)a11 styleEngineGammaCorrection:(void *)a12 inputYUVOffsets:(void *)a13 cropRect:(void *)a14 appliedWhitePoint:(void *)a15 clippingCorrectionEnabled:(void *)a16 clippingCorrectionTransitionGain:(id)a17 clippingCorrectionTransitionExponent:(id)a18 strobeCCM:(id)a19 colourSaturationBoostGain:(unint64_t)a20 gammaCorrection:(uint64_t)a21 globalRGBToneCurveEnabled:(BOOL)a22 globalRGBToneCurveBrightnessBoostFactor:(__int16)a23 outputLumaTexture:(char)a24 outputChromaTexture:(uint64_t)a25;
- (uint64_t)_encodeStyleTransferWithSpeedMode:(__n128)a3 inputLumaTexture:(float)a4 inputChromaTexture:(float)a5 appliedScaledLSCGainsRGBTexture:(__n128)a6 sourceThumbnailRGBTexture:(__n128)a7 targetThumbnailRGBTexture:(__n128)a8 toneCompressionCurveTexture:(float)a9 inputYUVOffsets:(uint64_t)a10 cropRect:(void *)a11 appliedWhitePoint:(void *)a12 clippingCorrectionEnabled:(void *)a13 clippingCorrectionTransitionGain:(void *)a14 clippingCorrectionTransitionExponent:(void *)a15 strobeCCM:(void *)a16 colourSaturationBoostGain:(id)a17 gammaCorrection:(unint64_t)a18 globalRGBToneCurveEnabled:(uint64_t)a19 globalRGBToneCurveBrightnessBoostFactor:(BOOL)a20 outputLumaTexture:(__int16)a21 outputChromaTexture:(char)a22;
- (void)setExternalMemoryResource:(id)a3;
@end

@implementation CMIColourConstancyStyleTransferV1

- (void)setExternalMemoryResource:(id)a3
{
}

- (CMIColourConstancyStyleTransferV1)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v35.receiver = self;
  v35.super_class = (Class)CMIColourConstancyStyleTransferV1;
  v6 = [(CMIColourConstancyStyleTransferV1 *)&v35 init];
  v7 = v6;
  if (!v6) {
    goto LABEL_16;
  }
  if (!v5) {
    goto LABEL_16;
  }
  objc_storeStrong((id *)&v6->_metalContext, a3);
  uint64_t v8 = [(FigMetalContext *)v7->_metalContext computePipelineStateFor:@"ColourConstancy::zeroImageV1" constants:0];
  zeroImagePipelineState = v7->_zeroImagePipelineState;
  v7->_zeroImagePipelineState = (MTLComputePipelineState *)v8;

  if (!v7->_zeroImagePipelineState) {
    goto LABEL_16;
  }
  uint64_t v10 = [(FigMetalContext *)v7->_metalContext computePipelineStateFor:@"ColourConstancy::calculateRGBtoRGBThumbnailGaussianResampleHorizonalPassV1" constants:0];
  calculateRGBtoRGBThumbnailGaussianResampleHorizonalPassPipelineState = v7->_calculateRGBtoRGBThumbnailGaussianResampleHorizonalPassPipelineState;
  v7->_calculateRGBtoRGBThumbnailGaussianResampleHorizonalPassPipelineState = (MTLComputePipelineState *)v10;

  if (!v7->_calculateRGBtoRGBThumbnailGaussianResampleHorizonalPassPipelineState) {
    goto LABEL_16;
  }
  uint64_t v12 = [(FigMetalContext *)v7->_metalContext computePipelineStateFor:@"ColourConstancy::calculateRGBtoRGBThumbnailGaussianResampleVerticalPassV1" constants:0];
  calculateRGBtoRGBThumbnailGaussianResampleVerticalPassPipelineState = v7->_calculateRGBtoRGBThumbnailGaussianResampleVerticalPassPipelineState;
  v7->_calculateRGBtoRGBThumbnailGaussianResampleVerticalPassPipelineState = (MTLComputePipelineState *)v12;

  if (!v7->_calculateRGBtoRGBThumbnailGaussianResampleVerticalPassPipelineState) {
    goto LABEL_16;
  }
  uint64_t v14 = [(FigMetalContext *)v7->_metalContext computePipelineStateFor:@"ColourConstancy::transferStyleWithSpeedModeV1" constants:0];
  transferStyleWithSpeedModePipelineState = v7->_transferStyleWithSpeedModePipelineState;
  v7->_transferStyleWithSpeedModePipelineState = (MTLComputePipelineState *)v14;

  if (!v7->_transferStyleWithSpeedModePipelineState) {
    goto LABEL_16;
  }
  uint64_t v16 = [(FigMetalContext *)v7->_metalContext computePipelineStateFor:@"ColourConstancy::transferStyleWithQualityModeV1" constants:0];
  transferStyleWithQualityModePipelineState = v7->_transferStyleWithQualityModePipelineState;
  v7->_transferStyleWithQualityModePipelineState = (MTLComputePipelineState *)v16;

  if (!v7->_transferStyleWithQualityModePipelineState) {
    goto LABEL_16;
  }
  uint64_t v18 = [(FigMetalContext *)v7->_metalContext computePipelineStateFor:@"ColourConstancy::reconstructStyleTargetFromSourceWithSpeedModeV1" constants:0];
  reconstructStyleTargetFromSourceWithSpeedModePipelineState = v7->_reconstructStyleTargetFromSourceWithSpeedModePipelineState;
  v7->_reconstructStyleTargetFromSourceWithSpeedModePipelineState = (MTLComputePipelineState *)v18;

  if (!v7->_reconstructStyleTargetFromSourceWithSpeedModePipelineState) {
    goto LABEL_16;
  }
  uint64_t v20 = [(FigMetalContext *)v7->_metalContext computePipelineStateFor:@"ColourConstancy::reconstructStyleTargetFromSourceWithQualityModeV1" constants:0];
  reconstructStyleTargetFromSourceWithQualityModePipelineState = v7->_reconstructStyleTargetFromSourceWithQualityModePipelineState;
  v7->_reconstructStyleTargetFromSourceWithQualityModePipelineState = (MTLComputePipelineState *)v20;

  if (!v7->_reconstructStyleTargetFromSourceWithQualityModePipelineState) {
    goto LABEL_16;
  }
  if (!FigGetCFPreferenceNumberWithDefault())
  {
    id v23 = objc_alloc((Class)CMIStyleEngineProcessor);
    v24 = [(FigMetalContext *)v7->_metalContext commandQueue];
    v25 = (CMIStyleEngineProcessor *)[v23 initWithOptionalMetalCommandQueue:v24];
    styleEngineProcessor = v7->_styleEngineProcessor;
    v7->_styleEngineProcessor = v25;

    if (v7->_styleEngineProcessor)
    {
      id v22 = [objc_alloc((Class)NSDictionary) initWithObjects:&off_31760 forKeys:&off_31778];
      [(CMIStyleEngineProcessor *)v7->_styleEngineProcessor setTuningParameters:v22];
      v27 = objc_opt_new();
      [(CMIStyleEngineProcessor *)v7->_styleEngineProcessor setConfiguration:v27];

      v28 = [(CMIStyleEngineProcessor *)v7->_styleEngineProcessor configuration];
      [v28 setLinearSystemType:1];

      v29 = [(CMIStyleEngineProcessor *)v7->_styleEngineProcessor configuration];
      [v29 setLinearSystemOrder:1];

      v30 = [(CMIStyleEngineProcessor *)v7->_styleEngineProcessor configuration];
      [v30 setLinearSystemSolver:0];

      v31 = [(CMIStyleEngineProcessor *)v7->_styleEngineProcessor configuration];
      [v31 setWeightPlaneCount:8];

      v32 = [(CMIStyleEngineProcessor *)v7->_styleEngineProcessor configuration];
      [v32 setSpotlightCount:COERCE_DOUBLE(0xC00000010)];

      if (![(CMIStyleEngineProcessor *)v7->_styleEngineProcessor setup]) {
        goto LABEL_14;
      }
      fig_log_get_emitter();
      FigDebugAssert3();

LABEL_17:
      v33 = 0;
      goto LABEL_15;
    }
LABEL_16:
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_17;
  }
  id v22 = 0;
LABEL_14:
  v33 = v7;

LABEL_15:
  return v33;
}

- (int)purgeResources
{
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  if ([(CMIStyleEngineProcessor *)self->_styleEngineProcessor resetState]
    || (int result = [(CMIStyleEngineProcessor *)self->_styleEngineProcessor purgeResources]) != 0)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 9;
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
    id v7 = [v6 newTextureDescriptor];

    if (v7)
    {
      uint64_t v8 = [v7 desc];
      [v8 setTextureType:2];

      uint64_t v9 = [(CMIColourConstancyStyleTransferConfigurationV1 *)self->_config styleTransferThumbnailWidth];
      uint64_t v10 = [v7 desc];
      [v10 setWidth:v9];

      uint64_t v11 = [(CMIColourConstancyStyleTransferConfigurationV1 *)self->_config styleTransferThumbnailHeight];
      uint64_t v12 = [v7 desc];
      [v12 setHeight:v11];

      v13 = [v7 desc];
      [v13 setPixelFormat:125];

      [v7 setLabel:0];
      uint64_t v14 = [(FigMetalContext *)self->_metalContext allocator];
      v15 = (MTLTexture *)[v14 newTextureWithDescriptor:v7];
      sourceThumbnailRGBTexture = self->_sourceThumbnailRGBTexture;
      self->_sourceThumbnailRGBTexture = v15;

      if (!self->_sourceThumbnailRGBTexture) {
        goto LABEL_12;
      }
      [v7 setLabel:0];
      v17 = [(FigMetalContext *)self->_metalContext allocator];
      uint64_t v18 = (MTLTexture *)[v17 newTextureWithDescriptor:v7];
      targetThumbnailRGBTexture = self->_targetThumbnailRGBTexture;
      self->_targetThumbnailRGBTexture = v18;

      if (!self->_targetThumbnailRGBTexture) {
        goto LABEL_12;
      }
      uint64_t v20 = [(CMIColourConstancyStyleTransferConfigurationV1 *)self->_config sourceThumbnailWidth];
      v21 = [v7 desc];
      [v21 setWidth:v20];

      uint64_t v22 = [(CMIColourConstancyStyleTransferConfigurationV1 *)self->_config styleTransferThumbnailHeight];
      id v23 = [v7 desc];
      [v23 setHeight:v22];

      v24 = [v7 desc];
      [v24 setPixelFormat:125];

      [v7 setLabel:0];
      v25 = [(FigMetalContext *)self->_metalContext allocator];
      v26 = (MTLTexture *)[v25 newTextureWithDescriptor:v7];
      thumbnailIntermediateRGBTexture = self->_thumbnailIntermediateRGBTexture;
      self->_thumbnailIntermediateRGBTexture = v26;

      if (self->_thumbnailIntermediateRGBTexture)
      {
        if (!-[CMIColourConstancyStyleTransferConfigurationV1 speedModeStyleTransferEnabled](self->_config, "speedModeStyleTransferEnabled")&& (double v28 = (double)-[CMIColourConstancyStyleTransferConfigurationV1 styleTransferThumbnailWidth](self->_config, "styleTransferThumbnailWidth"), v29 = (double)-[CMIColourConstancyStyleTransferConfigurationV1 styleTransferThumbnailHeight](self->_config, "styleTransferThumbnailHeight"), -[CMIStyleEngineProcessor configuration](self->_styleEngineProcessor, "configuration"), v30 = objc_claimAutoreleasedReturnValue(), objc_msgSend(v30, "setThumbnailSize:", v28, v29), v30, -[CMIStyleEngineProcessor prepareToProcess:](self->_styleEngineProcessor, "prepareToProcess:", 3)))
        {
          fig_log_get_emitter();
          FigDebugAssert3();
          int v31 = 9;
        }
        else
        {
          int v31 = 0;
        }
      }
      else
      {
LABEL_12:
        fig_log_get_emitter();
        FigDebugAssert3();
        int v31 = 6;
      }
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      int v31 = 7;
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    id v7 = 0;
    int v31 = 8;
  }

  return v31;
}

- (int)finishProcessing
{
  unsigned int v2 = [(CMIStyleEngineProcessor *)self->_styleEngineProcessor finishProcessing];
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
    return 9;
  }
}

- (int)_encodeZeroImage:(id)a3 outputLumaTexture:(id)a4 outputChromaTexture:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8 && ([v8 computeCommandEncoder], (uint64_t v11 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v12 = v11;
    [v11 setComputePipelineState:self->_zeroImagePipelineState];
    [v12 setTexture:v9 atIndex:0];
    [v12 setTexture:v10 atIndex:1];
    unint64_t v13 = (unint64_t)[(MTLComputePipelineState *)self->_zeroImagePipelineState threadExecutionWidth];
    unint64_t v14 = (unint64_t)[(MTLComputePipelineState *)self->_zeroImagePipelineState maxTotalThreadsPerThreadgroup]/ v13;
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
    int v15 = 10;
  }

  return v15;
}

- (int)_encodeRGBtoRGBThumbnailGaussianResampleCalculate:(id)a3 inputRGBTexture:(id)a4 sharpness:(float)a5 sigmaToFilterScale:(float)a6 gammaCorrection:(float)a7 thumbnailIntermediateRGBTexture:(id)a8 outputRGBTexture:(id)a9
{
  id v16 = a3;
  id v17 = a4;
  *(float *)v34 = a5;
  float v32 = a7;
  float v33 = a6;
  id v18 = a8;
  id v19 = a9;
  if (v16 && ([v16 computeCommandEncoder], (uint64_t v20 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v21 = v20;
    [v20 setComputePipelineState:self->_calculateRGBtoRGBThumbnailGaussianResampleHorizonalPassPipelineState];
    [v21 setTexture:v17 atIndex:0];
    [v21 setTexture:v18 atIndex:1];
    [v21 setBytes:v34 length:4 atIndex:0];
    [v21 setBytes:&v33 length:4 atIndex:1];
    unint64_t v22 = (unint64_t)[(MTLComputePipelineState *)self->_calculateRGBtoRGBThumbnailGaussianResampleHorizonalPassPipelineState threadExecutionWidth];
    unint64_t v23 = (unint64_t)[(MTLComputePipelineState *)self->_calculateRGBtoRGBThumbnailGaussianResampleHorizonalPassPipelineState maxTotalThreadsPerThreadgroup]/ v22;
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
    unint64_t v24 = (unint64_t)[(MTLComputePipelineState *)self->_calculateRGBtoRGBThumbnailGaussianResampleVerticalPassPipelineState threadExecutionWidth];
    unint64_t v25 = (unint64_t)[(MTLComputePipelineState *)self->_calculateRGBtoRGBThumbnailGaussianResampleVerticalPassPipelineState maxTotalThreadsPerThreadgroup]/ v24;
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
    int v26 = 10;
  }

  return v26;
}

- (int)_encodeStyleTargetFromSourceWithSpeedModeReconstruct:(id)a3 sourceThumbnailRGBTexture:(id)a4 targetThumbnailRGBTexture:(id)a5 outputReconstructedTargetThumbnailRGBTexture:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v10 && ([v10 computeCommandEncoder], (unint64_t v14 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    int v15 = v14;
    [v14 setComputePipelineState:self->_reconstructStyleTargetFromSourceWithSpeedModePipelineState];
    [v15 setTexture:v11 atIndex:0];
    [v15 setTexture:v12 atIndex:1];
    [v15 setTexture:v13 atIndex:2];
    unint64_t v16 = (unint64_t)[(MTLComputePipelineState *)self->_reconstructStyleTargetFromSourceWithSpeedModePipelineState threadExecutionWidth];
    unint64_t v17 = (unint64_t)[(MTLComputePipelineState *)self->_reconstructStyleTargetFromSourceWithSpeedModePipelineState maxTotalThreadsPerThreadgroup]/ v16;
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
    int v18 = 10;
  }

  return v18;
}

- (int)_encodeStyleTargetFromSourceWithQualityModeReconstruct:(id)a3 sourceThumbnailRGBTexture:(id)a4 targetThumbnailRGBTexture:(id)a5 styleEngineCoefficientsTexture:(id)a6 styleEngineLinearSystemStatusFlagBuffer:(id)a7 styleEngineGammaCorrection:(float)a8 outputReconstructedTargetThumbnailRGBTexture:(id)a9
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  float v34 = a8;
  id v21 = a9;
  if (v16 && ([v16 computeCommandEncoder], (unint64_t v22 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    unint64_t v23 = v22;
    [v22 setComputePipelineState:self->_reconstructStyleTargetFromSourceWithQualityModePipelineState];
    [v23 setTexture:v17 atIndex:0];
    [v23 setTexture:v18 atIndex:1];
    [v23 setTexture:v19 atIndex:2];
    [v23 setTexture:v21 atIndex:3];
    [v23 setBuffer:v20 offset:0 atIndex:0];
    [v23 setBytes:&v34 length:4 atIndex:1];
    unint64_t v24 = (unint64_t)[(MTLComputePipelineState *)self->_reconstructStyleTargetFromSourceWithQualityModePipelineState threadExecutionWidth];
    id v25 = v20;
    id v26 = v19;
    id v27 = v18;
    id v28 = v17;
    unint64_t v29 = (unint64_t)[(MTLComputePipelineState *)self->_reconstructStyleTargetFromSourceWithQualityModePipelineState maxTotalThreadsPerThreadgroup]/ v24;
    v33[0] = [v21 width];
    v33[1] = [v21 height];
    v33[2] = 1;
    v32[0] = v24;
    v32[1] = v29;
    id v17 = v28;
    id v18 = v27;
    id v19 = v26;
    id v20 = v25;
    v32[2] = 1;
    [v23 dispatchThreads:v33 threadsPerThreadgroup:v32];
    [v23 endEncoding];

    int v30 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v30 = 10;
  }

  return v30;
}

- (uint64_t)_encodeStyleTransferWithSpeedMode:(__n128)a3 inputLumaTexture:(float)a4 inputChromaTexture:(float)a5 appliedScaledLSCGainsRGBTexture:(__n128)a6 sourceThumbnailRGBTexture:(__n128)a7 targetThumbnailRGBTexture:(__n128)a8 toneCompressionCurveTexture:(float)a9 inputYUVOffsets:(uint64_t)a10 cropRect:(void *)a11 appliedWhitePoint:(void *)a12 clippingCorrectionEnabled:(void *)a13 clippingCorrectionTransitionGain:(void *)a14 clippingCorrectionTransitionExponent:(void *)a15 strobeCCM:(void *)a16 colourSaturationBoostGain:(id)a17 gammaCorrection:(unint64_t)a18 globalRGBToneCurveEnabled:(uint64_t)a19 globalRGBToneCurveBrightnessBoostFactor:(BOOL)a20 outputLumaTexture:(__int16)a21 outputChromaTexture:(char)a22
{
  id v64 = a28;
  id v36 = a27;
  BOOL v37 = a24;
  v76[0] = a18;
  v76[1] = a19;
  v75[0] = a6;
  v75[1] = a7;
  v75[2] = a8;
  id v38 = a11;
  id v39 = a12;
  id v40 = a13;
  id v61 = a14;
  id v60 = a15;
  id v62 = a16;
  id v41 = a17;
  __n128 v73 = a3;
  __n128 v74 = a2;
  BOOL v72 = a20;
  float v70 = a5;
  float v71 = a4;
  float v69 = a9;
  BOOL v68 = v37;
  v42 = v38;
  id v43 = v36;
  id v44 = v64;
  v65 = v42;
  if (!v42)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    uint64_t v55 = 10;
    v54 = v39;
    v45 = v41;
LABEL_7:
    v49 = v60;
    v48 = v61;
    v53 = v62;
    goto LABEL_4;
  }
  v45 = v41;
  v46 = [v42 computeCommandEncoder];
  if (!v46)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    uint64_t v55 = 10;
    v54 = v39;
    goto LABEL_7;
  }
  v47 = v46;
  [v46 setComputePipelineState:*(void *)(a1 + 48)];
  id v57 = v39;
  [v47 setTexture:v39 atIndex:0];
  [v47 setTexture:v40 atIndex:1];
  v48 = v61;
  [v47 setTexture:v61 atIndex:2];
  v49 = v60;
  [v47 setTexture:v60 atIndex:3];
  [v47 setTexture:v62 atIndex:4];
  [v47 setTexture:v45 atIndex:5];
  [v47 setTexture:v43 atIndex:6];
  [v47 setTexture:v44 atIndex:7];
  [v47 setBytes:&v74 length:16 atIndex:0];
  [v47 setBytes:v76 length:16 atIndex:1];
  [v47 setBytes:&v73 length:16 atIndex:2];
  [v47 setBytes:&v72 length:1 atIndex:3];
  [v47 setBytes:&v71 length:4 atIndex:4];
  [v47 setBytes:&v70 length:4 atIndex:5];
  [v47 setBytes:v75 length:48 atIndex:6];
  [v47 setBytes:&v69 length:4 atIndex:7];
  [v47 setBytes:&a22 length:4 atIndex:8];
  [v47 setBytes:&v68 length:1 atIndex:9];
  [v47 setBytes:&a26 length:4 atIndex:10];
  id v50 = v40;
  unint64_t v51 = (unint64_t)[*(id *)(a1 + 48) threadExecutionWidth];
  unint64_t v52 = (unint64_t)[*(id *)(a1 + 48) maxTotalThreadsPerThreadgroup];
  v67[0] = a18 >> 1;
  v67[1] = a18 >> 33;
  v67[2] = 1;
  v66[0] = v51;
  v66[1] = v52 / v51;
  id v40 = v50;
  v53 = v62;
  v54 = v57;
  v66[2] = 1;
  [v47 dispatchThreads:v67 threadsPerThreadgroup:v66];
  [v47 endEncoding];

  uint64_t v55 = 0;
LABEL_4:

  return v55;
}

- (uint64_t)_encodeStyleTransferWithQualityMode:(__n128)a3 inputLumaTexture:(__n128)a4 inputChromaTexture:(float)a5 appliedScaledLSCGainsRGBTexture:(float)a6 sourceThumbnailRGBTexture:(__n128)a7 targetThumbnailRGBTexture:(__n128)a8 toneCompressionCurveTexture:(__n128)a9 styleEngineCoefficientsTexture:(uint64_t)a10 styleEngineLinearSystemStatusFlagBuffer:(void *)a11 styleEngineGammaCorrection:(void *)a12 inputYUVOffsets:(void *)a13 cropRect:(void *)a14 appliedWhitePoint:(void *)a15 clippingCorrectionEnabled:(void *)a16 clippingCorrectionTransitionGain:(id)a17 clippingCorrectionTransitionExponent:(id)a18 strobeCCM:(id)a19 colourSaturationBoostGain:(unint64_t)a20 gammaCorrection:(uint64_t)a21 globalRGBToneCurveEnabled:(BOOL)a22 globalRGBToneCurveBrightnessBoostFactor:(__int16)a23 outputLumaTexture:(char)a24 outputChromaTexture:(uint64_t)a25
{
  v66 = a28;
  id v59 = a27;
  char v58 = BYTE4(a25);
  v78[0] = a20;
  v78[1] = a21;
  v77[0] = a7;
  v77[1] = a8;
  v77[2] = a9;
  id v36 = a11;
  id v63 = a12;
  id v37 = a13;
  id v38 = a14;
  id v39 = a15;
  id v62 = a16;
  id v65 = a17;
  id v40 = a18;
  id v64 = a19;
  float v76 = a2;
  __n128 v74 = a4;
  __n128 v75 = a3;
  BOOL v73 = a22;
  float v71 = a6;
  float v72 = a5;
  char v70 = v58;
  id v41 = v59;
  id v42 = v66;
  v67 = v36;
  if (!v36)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    uint64_t v54 = 10;
    unint64_t v52 = v62;
    v47 = v63;
LABEL_7:
    v49 = v64;
    goto LABEL_4;
  }
  id v43 = v40;
  id v44 = v39;
  v45 = [v67 computeCommandEncoder];
  if (!v45)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    uint64_t v54 = 10;
    unint64_t v52 = v62;
    v47 = v63;
    id v40 = v43;
    goto LABEL_7;
  }
  v46 = v45;
  [v45 setComputePipelineState:*(void *)(a1 + 56)];
  v47 = v63;
  [v46 setTexture:v63 atIndex:0];
  id v56 = v37;
  [v46 setTexture:v37 atIndex:1];
  [v46 setTexture:v38 atIndex:2];
  [v46 setTexture:v44 atIndex:3];
  [v46 setTexture:v62 atIndex:4];
  [v46 setTexture:v65 atIndex:5];
  v48 = v43;
  [v46 setTexture:v43 atIndex:6];
  [v46 setTexture:v41 atIndex:7];
  [v46 setTexture:v42 atIndex:8];
  [v46 setBytes:&v75 length:16 atIndex:0];
  [v46 setBytes:v78 length:16 atIndex:1];
  [v46 setBytes:&v74 length:16 atIndex:2];
  [v46 setBytes:&v73 length:1 atIndex:3];
  [v46 setBytes:&v72 length:4 atIndex:4];
  [v46 setBytes:&v71 length:4 atIndex:5];
  v49 = v64;
  [v46 setBuffer:v64 offset:0 atIndex:6];
  [v46 setBytes:&v76 length:4 atIndex:7];
  [v46 setBytes:v77 length:48 atIndex:8];
  [v46 setBytes:&a24 length:4 atIndex:9];
  [v46 setBytes:&a25 length:4 atIndex:10];
  [v46 setBytes:&v70 length:1 atIndex:11];
  [v46 setBytes:&a26 length:4 atIndex:12];
  id v50 = v38;
  unint64_t v51 = (unint64_t)[*(id *)(a1 + 56) threadExecutionWidth];
  unint64_t v52 = v62;
  unint64_t v53 = (unint64_t)[*(id *)(a1 + 56) maxTotalThreadsPerThreadgroup];
  v69[0] = a20 >> 1;
  v69[1] = a20 >> 33;
  v69[2] = 1;
  v68[0] = v51;
  v68[1] = v53 / v51;
  id v38 = v50;
  id v37 = v56;
  v68[2] = 1;
  [v46 dispatchThreads:v69 threadsPerThreadgroup:v68];
  [v46 endEncoding];

  id v39 = v44;
  id v40 = v48;
  uint64_t v54 = 0;
LABEL_4:

  return v54;
}

- (id)applyStyleTransferWithBufferClearing:(double)a3 inputChromaTexture:(double)a4 appliedScaledLSCGainsRGBTexture:(double)a5 sourceRGBTexture:(double)a6 targetRGBTexture:(uint64_t)a7 toneCompressionCurveTexture:(void *)a8 inputYUVOffsets:(void *)a9 cropRect:(void *)a10 appliedWhitePoint:(void *)a11 strobeCCM:(void *)a12 outputReconstructedTargetRGBTexture:(void *)a13 outputLumaTexture:(uint64_t)a14 outputChromaTexture:(uint64_t)a15
{
  id v24 = a8;
  id v102 = a9;
  id v101 = a10;
  id v25 = a11;
  id v26 = a12;
  id v105 = a13;
  id v27 = a16;
  id v28 = a17;
  id v29 = a18;
  uint64_t v30 = [*(id *)(a1 + 8) commandBuffer];
  v104 = v28;
  if (!v30)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    id v69 = (id)FigSignalErrorAt();
LABEL_22:
    v47 = v101;
    v48 = v102;
    goto LABEL_16;
  }
  int v31 = (void *)v30;
  id v32 = [(id)a1 _encodeZeroImage:v30 outputLumaTexture:v28 outputChromaTexture:v29];
  if (v32) {
    goto LABEL_21;
  }
  id v103 = v27;
  if (![*(id *)(a1 + 16) speedModeStyleTransferEnabled])
  {
    [*(id *)(a1 + 16) styleTransferThumbnailSharpness];
    int v52 = v51;
    [*(id *)(a1 + 16) styleTransferThumbnailSigmaToFilterScale];
    int v54 = v53;
    [*(id *)(a1 + 16) styleTransferGammaCorrection];
    LODWORD(v56) = v55;
    LODWORD(v57) = v52;
    LODWORD(v58) = v54;
    id v32 = [(id)a1 _encodeRGBtoRGBThumbnailGaussianResampleCalculate:v31 inputRGBTexture:v25 sharpness:*(void *)(a1 + 96) sigmaToFilterScale:*(void *)(a1 + 80) gammaCorrection:v57 thumbnailIntermediateRGBTexture:v58 outputRGBTexture:v56];
    if (!v32)
    {
      [*(id *)(a1 + 16) styleTransferThumbnailSharpness];
      int v60 = v59;
      [*(id *)(a1 + 16) styleTransferThumbnailSigmaToFilterScale];
      int v62 = v61;
      [*(id *)(a1 + 16) styleTransferGammaCorrection];
      LODWORD(v64) = v63;
      LODWORD(v65) = v60;
      LODWORD(v66) = v62;
      id v32 = [(id)a1 _encodeRGBtoRGBThumbnailGaussianResampleCalculate:v31 inputRGBTexture:v26 sharpness:*(void *)(a1 + 96) sigmaToFilterScale:*(void *)(a1 + 88) gammaCorrection:v65 thumbnailIntermediateRGBTexture:v66 outputRGBTexture:v64];
      if (!v32)
      {
        [*(id *)(a1 + 8) commit];
        [*(id *)(a1 + 104) setInputThumbnailTexture:*(void *)(a1 + 80)];
        [*(id *)(a1 + 104) setTargetThumbnailTexture:*(void *)(a1 + 88)];
        if ([*(id *)(a1 + 104) process])
        {
          fig_log_get_emitter();
          FigDebugAssert3();

          id v69 = &dword_8 + 1;
        }
        else
        {
          id v50 = [*(id *)(a1 + 8) commandBuffer];

          if (v50)
          {
            id v95 = v29;
            v67 = [*(id *)(a1 + 104) outputIntegratedCoefficients];
            BOOL v68 = [*(id *)(a1 + 104) outputLinearSystemStatusFlag];
            [*(id *)(a1 + 16) styleTransferGammaCorrection];
            id v69 = objc_msgSend((id)a1, "_encodeStyleTargetFromSourceWithQualityModeReconstruct:sourceThumbnailRGBTexture:targetThumbnailRGBTexture:styleEngineCoefficientsTexture:styleEngineLinearSystemStatusFlagBuffer:styleEngineGammaCorrection:outputReconstructedTargetThumbnailRGBTexture:", v50, v25, v26, v67, v68, v103);

            if (v69)
            {
              fig_log_get_emitter();
              FigDebugAssert3();

              v47 = v101;
              v48 = v102;
              id v27 = v103;
              id v29 = v95;
              goto LABEL_16;
            }
            char v70 = [*(id *)(a1 + 104) outputIntegratedCoefficients];
            float v71 = [*(id *)(a1 + 104) outputLinearSystemStatusFlag];
            [*(id *)(a1 + 16) styleTransferGammaCorrection];
            int v73 = v72;
            unsigned __int8 v74 = [*(id *)(a1 + 16) clippingCorrectionEnabled];
            [*(id *)(a1 + 16) clippingCorrectionTransitionGain];
            int v76 = v75;
            [*(id *)(a1 + 16) clippingCorrectionTransitionExponent];
            int v78 = v77;
            [*(id *)(a1 + 16) colourSaturationBoostGain];
            int v80 = v79;
            [*(id *)(a1 + 16) gammaCorrection];
            int v82 = v81;
            unsigned __int8 v83 = [*(id *)(a1 + 16) globalRGBToneCurveEnabled];
            [*(id *)(a1 + 16) globalRGBToneCurveBrightnessBoostFactor];
            LODWORD(v94) = v84;
            BYTE4(v93) = v83;
            HIDWORD(v91) = v80;
            LODWORD(v93) = v82;
            LOBYTE(v91) = v74;
            LODWORD(v85) = v73;
            LODWORD(v86) = v76;
            LODWORD(v87) = v78;
            v47 = v101;
            v48 = v102;
            id v69 = objc_msgSend((id)a1, "_encodeStyleTransferWithQualityMode:inputLumaTexture:inputChromaTexture:appliedScaledLSCGainsRGBTexture:sourceThumbnailRGBTexture:targetThumbnailRGBTexture:toneCompressionCurveTexture:styleEngineCoefficientsTexture:styleEngineLinearSystemStatusFlagBuffer:styleEngineGammaCorrection:inputYUVOffsets:cropRect:appliedWhitePoint:clippingCorrectionEnabled:clippingCorrectionTransitionGain:clippingCorrectionTransitionExponent:strobeCCM:colourSaturationBoostGain:gammaCorrection:globalRGBToneCurveEnabled:globalRGBToneCurveBrightnessBoostFactor:outputLumaTexture:outputChromaTexture:", v50, v24, v102, v101, v25, v26, v85, a2, a3, v86, v87, a4,
                    a5,
                    a6,
                    v105,
                    v70,
                    v71,
                    a14,
                    a15,
                    v91,
                    v93,
                    v94,
                    v104,
                    v95);

            if (v69)
            {
              fig_log_get_emitter();
              FigDebugAssert3();

              id v27 = v103;
              id v29 = v95;
              goto LABEL_16;
            }
            id v29 = v95;
            goto LABEL_14;
          }
          fig_log_get_emitter();
          FigDebugAssert3();
          id v69 = (id)FigSignalErrorAt();
        }
        v47 = v101;
        v48 = v102;
        goto LABEL_15;
      }
    }
    goto LABEL_21;
  }
  id v32 = [(id)a1 _encodeStyleTargetFromSourceWithSpeedModeReconstruct:v31 sourceThumbnailRGBTexture:v25 targetThumbnailRGBTexture:v26 outputReconstructedTargetThumbnailRGBTexture:v27];
  if (v32)
  {
LABEL_21:
    id v69 = v32;
    fig_log_get_emitter();
    FigDebugAssert3();

    goto LABEL_22;
  }
  unsigned __int8 v33 = [*(id *)(a1 + 16) clippingCorrectionEnabled];
  [*(id *)(a1 + 16) clippingCorrectionTransitionGain];
  int v35 = v34;
  [*(id *)(a1 + 16) clippingCorrectionTransitionExponent];
  int v37 = v36;
  [*(id *)(a1 + 16) colourSaturationBoostGain];
  int v39 = v38;
  [*(id *)(a1 + 16) gammaCorrection];
  int v41 = v40;
  unsigned __int8 v42 = [*(id *)(a1 + 16) globalRGBToneCurveEnabled];
  [*(id *)(a1 + 16) globalRGBToneCurveBrightnessBoostFactor];
  id v92 = v28;
  HIDWORD(v90) = v43;
  LOBYTE(v90) = v42;
  HIDWORD(v89) = v41;
  LOBYTE(v89) = v33;
  LODWORD(v44) = v35;
  LODWORD(v45) = v37;
  LODWORD(v46) = v39;
  v47 = v101;
  v48 = v102;
  id v49 = objc_msgSend((id)a1, "_encodeStyleTransferWithSpeedMode:inputLumaTexture:inputChromaTexture:appliedScaledLSCGainsRGBTexture:sourceThumbnailRGBTexture:targetThumbnailRGBTexture:toneCompressionCurveTexture:inputYUVOffsets:cropRect:appliedWhitePoint:clippingCorrectionEnabled:clippingCorrectionTransitionGain:clippingCorrectionTransitionExponent:strobeCCM:colourSaturationBoostGain:gammaCorrection:globalRGBToneCurveEnabled:globalRGBToneCurveBrightnessBoostFactor:outputLumaTexture:outputChromaTexture:", v31, v24, v102, v101, v25, v26, a2, a3, v44, v45, a4, a5, a6,
          v46,
          v105,
          a14,
          a15,
          v89,
          v90,
          v92,
          v29);
  if (v49)
  {
    id v69 = v49;
    fig_log_get_emitter();
    FigDebugAssert3();

    goto LABEL_15;
  }
  id v50 = v31;
LABEL_14:
  [*(id *)(a1 + 8) commit];

  id v69 = 0;
LABEL_15:
  id v27 = v103;
LABEL_16:

  return v69;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleEngineProcessor, 0);
  objc_storeStrong((id *)&self->_thumbnailIntermediateRGBTexture, 0);
  objc_storeStrong((id *)&self->_targetThumbnailRGBTexture, 0);
  objc_storeStrong((id *)&self->_sourceThumbnailRGBTexture, 0);
  objc_storeStrong((id *)&self->_reconstructStyleTargetFromSourceWithQualityModePipelineState, 0);
  objc_storeStrong((id *)&self->_reconstructStyleTargetFromSourceWithSpeedModePipelineState, 0);
  objc_storeStrong((id *)&self->_transferStyleWithQualityModePipelineState, 0);
  objc_storeStrong((id *)&self->_transferStyleWithSpeedModePipelineState, 0);
  objc_storeStrong((id *)&self->_calculateRGBtoRGBThumbnailGaussianResampleVerticalPassPipelineState, 0);
  objc_storeStrong((id *)&self->_calculateRGBtoRGBThumbnailGaussianResampleHorizonalPassPipelineState, 0);
  objc_storeStrong((id *)&self->_zeroImagePipelineState, 0);
  objc_storeStrong((id *)&self->_config, 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end