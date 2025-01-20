@interface CMIColourConstancyWhiteBalanceStrobeV1
- (CMIColourConstancyWhiteBalanceStrobeV1)initWithMetalContext:(id)a3;
- (int)_encodeBrightnessAndWhiteBalanceMatchingFusionApply:(id)a3 strobeBalancedRGBTexture:(id)a4 flashBalancedRGBTexture:(id)a5 strobeWeightedThumbnailRGBATexture:(id)a6 flashWeightedThumbnailRGBATexture:(id)a7 strobeIlluminationConfidenceRTexture:(id)a8 flashToStrobeIntensityFusionMixFactor:(float)a9 outputStrobeFusedBalancedRGBTexture:(id)a10;
- (int)_encodeGaussianFilteringWithLikelihoodWeightingHorizontalCalculate:(id)a3 inputRGBATexture:(id)a4 gaussianSigma:(float)a5 sigmaToFilterScale:(float)a6 outputRGBATexture:(id)a7;
- (int)_encodeGaussianFilteringWithLikelihoodWeightingVerticalCalculate:(id)a3 inputRGBATexture:(id)a4 gaussianSigma:(float)a5 sigmaToFilterScale:(float)a6 outputRGBATexture:(id)a7;
- (int)_encodeThumbnailBoxWithConfidenceWeightingCalculate:(id)a3 inputRGBTexture:(id)a4 inputConfidenceWeightingRTexture:(id)a5 minimumConfidenceWeight:(float)a6 outputWeightedRGBATexture:(id)a7;
- (int)applyWhiteBalanceAndFlashFusion:(id)a3 strobeSensorRGBTexture:(id)a4 flashBalancedRGBTexture:(id)a5 strobeIlluminationConfidenceRTexture:(id)a6 strobeWhitePoint:(id)a7 outputStrobeBalancedRGBTexture:;
- (int)encodeWhiteBalanceStrobeApply:(id)a3 strobeSensorRGBTexture:(id)a4 strobeWhitePoint:(id)a5 outputStrobeBalancedRGBTexture:;
- (int)prepareToProcessWithConfig:(id)a3;
- (int)purgeResources;
@end

@implementation CMIColourConstancyWhiteBalanceStrobeV1

- (CMIColourConstancyWhiteBalanceStrobeV1)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CMIColourConstancyWhiteBalanceStrobeV1;
  v6 = [(CMIColourConstancyWhiteBalanceStrobeV1 *)&v20 init];
  v7 = v6;
  if (!v6) {
    goto LABEL_10;
  }
  if (!v5) {
    goto LABEL_10;
  }
  objc_storeStrong((id *)&v6->_metalContext, a3);
  uint64_t v8 = [(FigMetalContext *)v7->_metalContext computePipelineStateFor:@"ColourConstancy::applyWhiteBalanceStrobeV1" constants:0];
  applyWhiteBalanceStrobePipelineState = v7->_applyWhiteBalanceStrobePipelineState;
  v7->_applyWhiteBalanceStrobePipelineState = (MTLComputePipelineState *)v8;

  if (!v7->_applyWhiteBalanceStrobePipelineState) {
    goto LABEL_10;
  }
  uint64_t v10 = [(FigMetalContext *)v7->_metalContext computePipelineStateFor:@"ColourConstancy::calculateThumbnailBoxWithConfidenceWeightingV1" constants:0];
  calculateThumbnailBoxWithConfidenceWeightingPipelineState = v7->_calculateThumbnailBoxWithConfidenceWeightingPipelineState;
  v7->_calculateThumbnailBoxWithConfidenceWeightingPipelineState = (MTLComputePipelineState *)v10;

  if (!v7->_calculateThumbnailBoxWithConfidenceWeightingPipelineState) {
    goto LABEL_10;
  }
  uint64_t v12 = [(FigMetalContext *)v7->_metalContext computePipelineStateFor:@"ColourConstancy::calculateGaussianFilteringWithLikelihoodWeightingHorizontalV1" constants:0];
  calculateGaussianFilteringWithLikelihoodWeightingHorizontalPipelineState = v7->_calculateGaussianFilteringWithLikelihoodWeightingHorizontalPipelineState;
  v7->_calculateGaussianFilteringWithLikelihoodWeightingHorizontalPipelineState = (MTLComputePipelineState *)v12;

  if (!v7->_calculateGaussianFilteringWithLikelihoodWeightingHorizontalPipelineState) {
    goto LABEL_10;
  }
  uint64_t v14 = [(FigMetalContext *)v7->_metalContext computePipelineStateFor:@"ColourConstancy::calculateGaussianFilteringWithLikelihoodWeightingVerticalV1" constants:0];
  calculateGaussianFilteringWithLikelihoodWeightingVerticalPipelineState = v7->_calculateGaussianFilteringWithLikelihoodWeightingVerticalPipelineState;
  v7->_calculateGaussianFilteringWithLikelihoodWeightingVerticalPipelineState = (MTLComputePipelineState *)v14;

  if (!v7->_calculateGaussianFilteringWithLikelihoodWeightingVerticalPipelineState) {
    goto LABEL_10;
  }
  uint64_t v16 = [(FigMetalContext *)v7->_metalContext computePipelineStateFor:@"ColourConstancy::applyBrightnessAndWhiteBalanceMatchingFusionV1" constants:0];
  applyBrightnessAndWhiteBalanceMatchingFusionPipelineState = v7->_applyBrightnessAndWhiteBalanceMatchingFusionPipelineState;
  v7->_applyBrightnessAndWhiteBalanceMatchingFusionPipelineState = (MTLComputePipelineState *)v16;

  if (v7->_applyBrightnessAndWhiteBalanceMatchingFusionPipelineState)
  {
    v18 = v7;
  }
  else
  {
LABEL_10:
    fig_log_get_emitter();
    FigDebugAssert3();
    v18 = 0;
  }

  return v18;
}

- (int)purgeResources
{
  return 0;
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

      uint64_t v9 = [(CMIColourConstancyWhiteBalanceStrobeConfigurationV1 *)self->_config thumbnailWidth];
      uint64_t v10 = [v7 desc];
      [v10 setWidth:v9];

      uint64_t v11 = [(CMIColourConstancyWhiteBalanceStrobeConfigurationV1 *)self->_config thumbnailHeight];
      uint64_t v12 = [v7 desc];
      [v12 setHeight:v11];

      v13 = [v7 desc];
      [v13 setPixelFormat:115];

      [v7 setLabel:0];
      uint64_t v14 = [(FigMetalContext *)self->_metalContext allocator];
      v15 = (MTLTexture *)[v14 newTextureWithDescriptor:v7];
      strobeBalancedRGBTexture = self->_strobeBalancedRGBTexture;
      self->_strobeBalancedRGBTexture = v15;

      if (!self->_strobeBalancedRGBTexture) {
        goto LABEL_11;
      }
      uint64_t v17 = [v5 balanceMatchingThumbnailWidth];
      v18 = [v7 desc];
      [v18 setWidth:v17];

      uint64_t v19 = [v5 balanceMatchingThumbnailHeight];
      objc_super v20 = [v7 desc];
      [v20 setHeight:v19];

      [v7 setLabel:0];
      v21 = [(FigMetalContext *)self->_metalContext allocator];
      v22 = (MTLTexture *)[v21 newTextureWithDescriptor:v7];
      strobeWeightedThumbnailRGBATexture = self->_strobeWeightedThumbnailRGBATexture;
      self->_strobeWeightedThumbnailRGBATexture = v22;

      if (!self->_strobeWeightedThumbnailRGBATexture) {
        goto LABEL_11;
      }
      [v7 setLabel:0];
      v24 = [(FigMetalContext *)self->_metalContext allocator];
      v25 = (MTLTexture *)[v24 newTextureWithDescriptor:v7];
      flashWeightedThumbnailRGBATexture = self->_flashWeightedThumbnailRGBATexture;
      self->_flashWeightedThumbnailRGBATexture = v25;

      if (!self->_flashWeightedThumbnailRGBATexture) {
        goto LABEL_11;
      }
      [v7 setLabel:0];
      v27 = [(FigMetalContext *)self->_metalContext allocator];
      v28 = (MTLTexture *)[v27 newTextureWithDescriptor:v7];
      thumbnailBlurIntermediateRGBATexture = self->_thumbnailBlurIntermediateRGBATexture;
      self->_thumbnailBlurIntermediateRGBATexture = v28;

      if (self->_thumbnailBlurIntermediateRGBATexture)
      {
        int v30 = 0;
      }
      else
      {
LABEL_11:
        fig_log_get_emitter();
        FigDebugAssert3();
        int v30 = 6;
      }
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      int v30 = 7;
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    id v7 = 0;
    int v30 = 8;
  }

  return v30;
}

- (int)encodeWhiteBalanceStrobeApply:(id)a3 strobeSensorRGBTexture:(id)a4 strobeWhitePoint:(id)a5 outputStrobeBalancedRGBTexture:
{
  long long v18 = v5;
  id v9 = a3;
  id v10 = a4;
  long long v21 = v18;
  id v11 = a5;
  if (v9 && ([v9 computeCommandEncoder], (uint64_t v12 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v13 = v12;
    [v12 setComputePipelineState:self->_applyWhiteBalanceStrobePipelineState];
    [v13 setTexture:v10 atIndex:0];
    [v13 setTexture:v11 atIndex:1];
    [v13 setBytes:&v21 length:16 atIndex:0];
    unint64_t v14 = (unint64_t)[(MTLComputePipelineState *)self->_applyWhiteBalanceStrobePipelineState threadExecutionWidth];
    unint64_t v15 = (unint64_t)[(MTLComputePipelineState *)self->_applyWhiteBalanceStrobePipelineState maxTotalThreadsPerThreadgroup]/ v14;
    v20[0] = [v11 width];
    v20[1] = [v11 height];
    v20[2] = 1;
    v19[0] = v14;
    v19[1] = v15;
    v19[2] = 1;
    [v13 dispatchThreads:v20 threadsPerThreadgroup:v19];
    [v13 endEncoding];

    int v16 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v16 = 10;
  }

  return v16;
}

- (int)_encodeThumbnailBoxWithConfidenceWeightingCalculate:(id)a3 inputRGBTexture:(id)a4 inputConfidenceWeightingRTexture:(id)a5 minimumConfidenceWeight:(float)a6 outputWeightedRGBATexture:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  float v24 = a6;
  id v15 = a7;
  if (v12 && ([v12 computeCommandEncoder], (int v16 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v17 = v16;
    [v16 setComputePipelineState:self->_calculateThumbnailBoxWithConfidenceWeightingPipelineState];
    [v17 setTexture:v13 atIndex:0];
    [v17 setTexture:v14 atIndex:1];
    [v17 setTexture:v15 atIndex:2];
    [v17 setBytes:&v24 length:4 atIndex:0];
    unint64_t v18 = (unint64_t)[(MTLComputePipelineState *)self->_calculateThumbnailBoxWithConfidenceWeightingPipelineState threadExecutionWidth];
    unint64_t v19 = (unint64_t)[(MTLComputePipelineState *)self->_calculateThumbnailBoxWithConfidenceWeightingPipelineState maxTotalThreadsPerThreadgroup]/ v18;
    v23[0] = [v15 width];
    v23[1] = [v15 height];
    v23[2] = 1;
    v22[0] = v18;
    v22[1] = v19;
    v22[2] = 1;
    [v17 dispatchThreads:v23 threadsPerThreadgroup:v22];
    [v17 endEncoding];

    int v20 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v20 = 10;
  }

  return v20;
}

- (int)_encodeGaussianFilteringWithLikelihoodWeightingHorizontalCalculate:(id)a3 inputRGBATexture:(id)a4 gaussianSigma:(float)a5 sigmaToFilterScale:(float)a6 outputRGBATexture:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  float v23 = a6;
  float v24 = a5;
  id v14 = a7;
  if (v12 && ([v12 computeCommandEncoder], (id v15 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    int v16 = v15;
    [v15 setComputePipelineState:self->_calculateGaussianFilteringWithLikelihoodWeightingHorizontalPipelineState];
    [v16 setTexture:v13 atIndex:0];
    [v16 setTexture:v14 atIndex:1];
    [v16 setBytes:&v24 length:4 atIndex:0];
    [v16 setBytes:&v23 length:4 atIndex:1];
    unint64_t v17 = (unint64_t)[(MTLComputePipelineState *)self->_calculateGaussianFilteringWithLikelihoodWeightingHorizontalPipelineState threadExecutionWidth];
    unint64_t v18 = (unint64_t)[(MTLComputePipelineState *)self->_calculateGaussianFilteringWithLikelihoodWeightingHorizontalPipelineState maxTotalThreadsPerThreadgroup]/ v17;
    v22[0] = [v14 width];
    v22[1] = [v14 height];
    v22[2] = 1;
    v21[0] = v17;
    v21[1] = v18;
    v21[2] = 1;
    [v16 dispatchThreads:v22 threadsPerThreadgroup:v21];
    [v16 endEncoding];

    int v19 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v19 = 10;
  }

  return v19;
}

- (int)_encodeGaussianFilteringWithLikelihoodWeightingVerticalCalculate:(id)a3 inputRGBATexture:(id)a4 gaussianSigma:(float)a5 sigmaToFilterScale:(float)a6 outputRGBATexture:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  float v23 = a6;
  float v24 = a5;
  id v14 = a7;
  if (v12 && ([v12 computeCommandEncoder], (id v15 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    int v16 = v15;
    [v15 setComputePipelineState:self->_calculateGaussianFilteringWithLikelihoodWeightingVerticalPipelineState];
    [v16 setTexture:v13 atIndex:0];
    [v16 setTexture:v14 atIndex:1];
    [v16 setBytes:&v24 length:4 atIndex:0];
    [v16 setBytes:&v23 length:4 atIndex:1];
    unint64_t v17 = (unint64_t)[(MTLComputePipelineState *)self->_calculateGaussianFilteringWithLikelihoodWeightingVerticalPipelineState threadExecutionWidth];
    unint64_t v18 = (unint64_t)[(MTLComputePipelineState *)self->_calculateGaussianFilteringWithLikelihoodWeightingVerticalPipelineState maxTotalThreadsPerThreadgroup]/ v17;
    v22[0] = [v14 width];
    v22[1] = [v14 height];
    v22[2] = 1;
    v21[0] = v17;
    v21[1] = v18;
    v21[2] = 1;
    [v16 dispatchThreads:v22 threadsPerThreadgroup:v21];
    [v16 endEncoding];

    int v19 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v19 = 10;
  }

  return v19;
}

- (int)_encodeBrightnessAndWhiteBalanceMatchingFusionApply:(id)a3 strobeBalancedRGBTexture:(id)a4 flashBalancedRGBTexture:(id)a5 strobeWeightedThumbnailRGBATexture:(id)a6 flashWeightedThumbnailRGBATexture:(id)a7 strobeIlluminationConfidenceRTexture:(id)a8 flashToStrobeIntensityFusionMixFactor:(float)a9 outputStrobeFusedBalancedRGBTexture:(id)a10
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  float v38 = a9;
  id v23 = a10;
  if (v17 && ([v17 computeCommandEncoder], (float v24 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v25 = v24;
    [v24 setComputePipelineState:self->_applyBrightnessAndWhiteBalanceMatchingFusionPipelineState];
    [v25 setTexture:v18 atIndex:0];
    id v35 = v18;
    id v26 = v20;
    [v25 setTexture:v19 atIndex:1];
    [v25 setTexture:v20 atIndex:2];
    [v25 setTexture:v21 atIndex:3];
    [v25 setTexture:v22 atIndex:4];
    [v25 setTexture:v23 atIndex:5];
    [v25 setBytes:&v38 length:4 atIndex:0];
    unint64_t v27 = (unint64_t)[(MTLComputePipelineState *)self->_applyBrightnessAndWhiteBalanceMatchingFusionPipelineState threadExecutionWidth];
    id v28 = v22;
    id v29 = v17;
    id v30 = v21;
    id v31 = v19;
    unint64_t v32 = (unint64_t)[(MTLComputePipelineState *)self->_applyBrightnessAndWhiteBalanceMatchingFusionPipelineState maxTotalThreadsPerThreadgroup]/ v27;
    v37[0] = [v23 width];
    v37[1] = [v23 height];
    v37[2] = 1;
    v36[0] = v27;
    v36[1] = v32;
    id v19 = v31;
    id v21 = v30;
    id v17 = v29;
    id v22 = v28;
    v36[2] = 1;
    id v20 = v26;
    id v18 = v35;
    [v25 dispatchThreads:v37 threadsPerThreadgroup:v36];
    [v25 endEncoding];

    int v33 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v33 = 10;
  }

  return v33;
}

- (int)applyWhiteBalanceAndFlashFusion:(id)a3 strobeSensorRGBTexture:(id)a4 flashBalancedRGBTexture:(id)a5 strobeIlluminationConfidenceRTexture:(id)a6 strobeWhitePoint:(id)a7 outputStrobeBalancedRGBTexture:
{
  double v50 = v7;
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  config = self->_config;
  id v18 = a4;
  if ([(CMIColourConstancyWhiteBalanceStrobeConfigurationV1 *)config lowStrobeIlluminationFlashFusionEnabled])
  {
    int v19 = [(CMIColourConstancyWhiteBalanceStrobeV1 *)self encodeWhiteBalanceStrobeApply:v13 strobeSensorRGBTexture:v18 strobeWhitePoint:self->_strobeBalancedRGBTexture outputStrobeBalancedRGBTexture:v50];

    if (v19) {
      goto LABEL_18;
    }
    strobeBalancedRGBTexture = self->_strobeBalancedRGBTexture;
    [(CMIColourConstancyWhiteBalanceStrobeConfigurationV1 *)self->_config balanceMatchingMinimumConfidenceWeight];
    unsigned int v21 = -[CMIColourConstancyWhiteBalanceStrobeV1 _encodeThumbnailBoxWithConfidenceWeightingCalculate:inputRGBTexture:inputConfidenceWeightingRTexture:minimumConfidenceWeight:outputWeightedRGBATexture:](self, "_encodeThumbnailBoxWithConfidenceWeightingCalculate:inputRGBTexture:inputConfidenceWeightingRTexture:minimumConfidenceWeight:outputWeightedRGBATexture:", v13, strobeBalancedRGBTexture, v15, self->_strobeWeightedThumbnailRGBATexture);
    if (v21) {
      goto LABEL_14;
    }
    [(CMIColourConstancyWhiteBalanceStrobeConfigurationV1 *)self->_config balanceMatchingMinimumConfidenceWeight];
    unsigned int v21 = -[CMIColourConstancyWhiteBalanceStrobeV1 _encodeThumbnailBoxWithConfidenceWeightingCalculate:inputRGBTexture:inputConfidenceWeightingRTexture:minimumConfidenceWeight:outputWeightedRGBATexture:](self, "_encodeThumbnailBoxWithConfidenceWeightingCalculate:inputRGBTexture:inputConfidenceWeightingRTexture:minimumConfidenceWeight:outputWeightedRGBATexture:", v13, v14, v15, self->_flashWeightedThumbnailRGBATexture);
    if (v21) {
      goto LABEL_14;
    }
    strobeWeightedThumbnailRGBATexture = self->_strobeWeightedThumbnailRGBATexture;
    [(CMIColourConstancyWhiteBalanceStrobeConfigurationV1 *)self->_config balanceMatchingGaussianSigma];
    int v24 = v23;
    [(CMIColourConstancyWhiteBalanceStrobeConfigurationV1 *)self->_config balanceMatchingSigmaToFilterScale];
    LODWORD(v26) = v25;
    LODWORD(v27) = v24;
    unsigned int v21 = [(CMIColourConstancyWhiteBalanceStrobeV1 *)self _encodeGaussianFilteringWithLikelihoodWeightingHorizontalCalculate:v13 inputRGBATexture:strobeWeightedThumbnailRGBATexture gaussianSigma:self->_thumbnailBlurIntermediateRGBATexture sigmaToFilterScale:v27 outputRGBATexture:v26];
    if (v21) {
      goto LABEL_14;
    }
    thumbnailBlurIntermediateRGBATexture = self->_thumbnailBlurIntermediateRGBATexture;
    [(CMIColourConstancyWhiteBalanceStrobeConfigurationV1 *)self->_config balanceMatchingGaussianSigma];
    int v30 = v29;
    [(CMIColourConstancyWhiteBalanceStrobeConfigurationV1 *)self->_config balanceMatchingSigmaToFilterScale];
    LODWORD(v32) = v31;
    LODWORD(v33) = v30;
    unsigned int v21 = [(CMIColourConstancyWhiteBalanceStrobeV1 *)self _encodeGaussianFilteringWithLikelihoodWeightingVerticalCalculate:v13 inputRGBATexture:thumbnailBlurIntermediateRGBATexture gaussianSigma:self->_strobeWeightedThumbnailRGBATexture sigmaToFilterScale:v33 outputRGBATexture:v32];
    if (v21) {
      goto LABEL_14;
    }
    flashWeightedThumbnailRGBATexture = self->_flashWeightedThumbnailRGBATexture;
    [(CMIColourConstancyWhiteBalanceStrobeConfigurationV1 *)self->_config balanceMatchingGaussianSigma];
    int v36 = v35;
    [(CMIColourConstancyWhiteBalanceStrobeConfigurationV1 *)self->_config balanceMatchingSigmaToFilterScale];
    LODWORD(v38) = v37;
    LODWORD(v39) = v36;
    unsigned int v21 = [(CMIColourConstancyWhiteBalanceStrobeV1 *)self _encodeGaussianFilteringWithLikelihoodWeightingHorizontalCalculate:v13 inputRGBATexture:flashWeightedThumbnailRGBATexture gaussianSigma:self->_thumbnailBlurIntermediateRGBATexture sigmaToFilterScale:v39 outputRGBATexture:v38];
    if (v21
      || (v40 = self->_thumbnailBlurIntermediateRGBATexture,
          [(CMIColourConstancyWhiteBalanceStrobeConfigurationV1 *)self->_config balanceMatchingGaussianSigma], v42 = v41, [(CMIColourConstancyWhiteBalanceStrobeConfigurationV1 *)self->_config balanceMatchingSigmaToFilterScale], LODWORD(v44) = v43, LODWORD(v45) = v42, (unsigned int v21 = [(CMIColourConstancyWhiteBalanceStrobeV1 *)self _encodeGaussianFilteringWithLikelihoodWeightingVerticalCalculate:v13 inputRGBATexture:v40 gaussianSigma:self->_flashWeightedThumbnailRGBATexture sigmaToFilterScale:v45 outputRGBATexture:v44]) != 0))
    {
LABEL_14:
      int v19 = v21;
      fig_log_get_emitter();
LABEL_19:
      FigDebugAssert3();
      goto LABEL_12;
    }
    v46 = self->_strobeBalancedRGBTexture;
    v47 = self->_strobeWeightedThumbnailRGBATexture;
    v48 = self->_flashWeightedThumbnailRGBATexture;
    [(CMIColourConstancyWhiteBalanceStrobeConfigurationV1 *)self->_config flashToStrobeIntensityFusionMixFactor];
    int v19 = -[CMIColourConstancyWhiteBalanceStrobeV1 _encodeBrightnessAndWhiteBalanceMatchingFusionApply:strobeBalancedRGBTexture:flashBalancedRGBTexture:strobeWeightedThumbnailRGBATexture:flashWeightedThumbnailRGBATexture:strobeIlluminationConfidenceRTexture:flashToStrobeIntensityFusionMixFactor:outputStrobeFusedBalancedRGBTexture:](self, "_encodeBrightnessAndWhiteBalanceMatchingFusionApply:strobeBalancedRGBTexture:flashBalancedRGBTexture:strobeWeightedThumbnailRGBATexture:flashWeightedThumbnailRGBATexture:strobeIlluminationConfidenceRTexture:flashToStrobeIntensityFusionMixFactor:outputStrobeFusedBalancedRGBTexture:", v13, v46, v14, v47, v48, v15, v16);
    if (v19)
    {
LABEL_18:
      fig_log_get_emitter();
      goto LABEL_19;
    }
  }
  else
  {
    int v19 = [(CMIColourConstancyWhiteBalanceStrobeV1 *)self encodeWhiteBalanceStrobeApply:v13 strobeSensorRGBTexture:v18 strobeWhitePoint:v16 outputStrobeBalancedRGBTexture:v50];

    if (v19) {
      goto LABEL_18;
    }
  }
LABEL_12:

  return v19;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailBlurIntermediateRGBATexture, 0);
  objc_storeStrong((id *)&self->_flashWeightedThumbnailRGBATexture, 0);
  objc_storeStrong((id *)&self->_strobeWeightedThumbnailRGBATexture, 0);
  objc_storeStrong((id *)&self->_strobeBalancedRGBTexture, 0);
  objc_storeStrong((id *)&self->_applyBrightnessAndWhiteBalanceMatchingFusionPipelineState, 0);
  objc_storeStrong((id *)&self->_calculateGaussianFilteringWithLikelihoodWeightingVerticalPipelineState, 0);
  objc_storeStrong((id *)&self->_calculateGaussianFilteringWithLikelihoodWeightingHorizontalPipelineState, 0);
  objc_storeStrong((id *)&self->_calculateThumbnailBoxWithConfidenceWeightingPipelineState, 0);
  objc_storeStrong((id *)&self->_applyWhiteBalanceStrobePipelineState, 0);
  objc_storeStrong((id *)&self->_config, 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end