@interface CMISoftwareFlashRenderingWhiteBalanceAmbientV2
- (CMISoftwareFlashRenderingWhiteBalanceAmbientV2)initWithMetalContext:(id)a3;
- (int)_encodeGaussianFilteringWithLikelihoodWeightingHorizontalCalculate:(id)a3 inputRGBATexture:(id)a4 gaussianSigma:(float)a5 sigmaToFilterScale:(float)a6 outputRGBATexture:(id)a7;
- (int)_encodeGaussianFilteringWithLikelihoodWeightingVerticalCalculate:(id)a3 inputRGBATexture:(id)a4 gaussianSigma:(float)a5 sigmaToFilterScale:(float)a6 outputRGBATexture:(id)a7;
- (int)_encodeSpatialAmbientWhitePointsCalculate:(CMISoftwareFlashRenderingWhiteBalanceAmbientV2 *)self strobeSensorRGBATexture:(SEL)a2 ambientSensorRGBATexture:(id)a3 ambientWhitePoint:(id)a4 strobeWhitePoint:(id)a5 ambientShadowZeroThreshold:(float)a6 ambientShadowOneThreshold:(float)a7 ambientSaturationZeroThreshold:(float)a8 ambientSaturationOneThreshold:(float)a9 strobeSaturationZeroThreshold:(float)a10 strobeSaturationOneThreshold:(float)a11 strobeAmbientMinRatioZeroThreshold:(float)a12 strobeAmbientMinRatioOneThreshold:(float)a13 outputSpatialAmbientWhitePointsRGBATexture:(id)a14;
- (int)_encodeThumbnailBoxWithLikelihoodWeightingCalculate:(id)a3 inputRGBATexture:(id)a4 outputRGBATexture:(id)a5;
- (int)_encodeWhiteBalanceGlobalApply:(id)a3 ambientSensorRGBTexture:(id)a4 ambientWhitePoint:(id)a5 outputAmbientBalancedRGBTexture:;
- (int)_encodeWhiteBalanceSpatialApply:(id)a3 ambientSensorRGBTexture:(id)a4 spatialAmbientWhitePointsRGBATexture:(id)a5 coarseSpatialAmbientWhitePointsRGBATexture:(id)a6 ambientWhitePoint:(float)a7 spatialWhitePointLikelihood:(float)a8 coarseSpatialWhitePointLikelihood:(float)a9 ambientWhitePointLikelihood:(float)a10 spatialWhitePointCorrectionStrength:(id)a11 outputAmbientBalancedRGBTexture:;
- (int)encodeWhiteBalanceAmbientApply:(id)a3 ambientSensorRGBATexture:(id)a4 strobeSensorRGBATexture:(id)a5 ambientWhitePoint:(id)a6 strobeWhitePoint:ambientWhitePointTuned:outputAmbientBalancedRGBTexture:;
- (int)prepareToProcessWithConfig:(id)a3;
- (int)purgeResources;
@end

@implementation CMISoftwareFlashRenderingWhiteBalanceAmbientV2

- (CMISoftwareFlashRenderingWhiteBalanceAmbientV2)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CMISoftwareFlashRenderingWhiteBalanceAmbientV2;
  v6 = [(CMISoftwareFlashRenderingWhiteBalanceAmbientV2 *)&v22 init];
  v7 = v6;
  if (!v6) {
    goto LABEL_11;
  }
  if (!v5) {
    goto LABEL_11;
  }
  objc_storeStrong((id *)&v6->_metalContext, a3);
  uint64_t v8 = [(FigMetalContext *)v7->_metalContext computePipelineStateFor:@"applyWhiteBalanceGlobalV2" constants:0];
  applyWhiteBalanceGlobalPipelineState = v7->_applyWhiteBalanceGlobalPipelineState;
  v7->_applyWhiteBalanceGlobalPipelineState = (MTLComputePipelineState *)v8;

  if (!v7->_applyWhiteBalanceGlobalPipelineState) {
    goto LABEL_11;
  }
  uint64_t v10 = [(FigMetalContext *)v7->_metalContext computePipelineStateFor:@"calculateSpatialAmbientWhitePointsV2" constants:0];
  calculateSpatialAmbientWhitePointsPipelineState = v7->_calculateSpatialAmbientWhitePointsPipelineState;
  v7->_calculateSpatialAmbientWhitePointsPipelineState = (MTLComputePipelineState *)v10;

  if (!v7->_calculateSpatialAmbientWhitePointsPipelineState) {
    goto LABEL_11;
  }
  uint64_t v12 = [(FigMetalContext *)v7->_metalContext computePipelineStateFor:@"calculateGaussianFilteringWithLikelihoodWeightingHorizontalV2" constants:0];
  calculateGaussianFilteringWithLikelihoodWeightingHorizontalPipelineState = v7->_calculateGaussianFilteringWithLikelihoodWeightingHorizontalPipelineState;
  v7->_calculateGaussianFilteringWithLikelihoodWeightingHorizontalPipelineState = (MTLComputePipelineState *)v12;

  if (!v7->_calculateGaussianFilteringWithLikelihoodWeightingHorizontalPipelineState) {
    goto LABEL_11;
  }
  uint64_t v14 = [(FigMetalContext *)v7->_metalContext computePipelineStateFor:@"calculateGaussianFilteringWithLikelihoodWeightingVerticalV2" constants:0];
  calculateGaussianFilteringWithLikelihoodWeightingVerticalPipelineState = v7->_calculateGaussianFilteringWithLikelihoodWeightingVerticalPipelineState;
  v7->_calculateGaussianFilteringWithLikelihoodWeightingVerticalPipelineState = (MTLComputePipelineState *)v14;

  if (!v7->_calculateGaussianFilteringWithLikelihoodWeightingVerticalPipelineState) {
    goto LABEL_11;
  }
  uint64_t v16 = [(FigMetalContext *)v7->_metalContext computePipelineStateFor:@"calculateThumbnailBoxWithLikelihoodWeightingV2" constants:0];
  calculateThumbnailBoxWithLikelihoodWeightingPipelineState = v7->_calculateThumbnailBoxWithLikelihoodWeightingPipelineState;
  v7->_calculateThumbnailBoxWithLikelihoodWeightingPipelineState = (MTLComputePipelineState *)v16;

  if (!v7->_calculateThumbnailBoxWithLikelihoodWeightingPipelineState) {
    goto LABEL_11;
  }
  uint64_t v18 = [(FigMetalContext *)v7->_metalContext computePipelineStateFor:@"applyWhiteBalanceSpatialV2" constants:0];
  applyWhiteBalanceSpatialPipelineState = v7->_applyWhiteBalanceSpatialPipelineState;
  v7->_applyWhiteBalanceSpatialPipelineState = (MTLComputePipelineState *)v18;

  if (v7->_applyWhiteBalanceSpatialPipelineState)
  {
    v20 = v7;
  }
  else
  {
LABEL_11:
    fig_log_get_emitter();
    FigDebugAssert3();
    v20 = 0;
  }

  return v20;
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
    v7 = (void *)[v6 newTextureDescriptor];

    if (v7)
    {
      uint64_t v8 = [v7 desc];
      [v8 setTextureType:2];

      uint64_t v9 = [(CMISoftwareFlashRenderingWhiteBalanceAmbientV2Configuration *)self->_config spatialWhitePointsGridWidth];
      uint64_t v10 = [v7 desc];
      [v10 setWidth:v9];

      uint64_t v11 = [(CMISoftwareFlashRenderingWhiteBalanceAmbientV2Configuration *)self->_config spatialWhitePointsGridHeight];
      uint64_t v12 = [v7 desc];
      [v12 setHeight:v11];

      v13 = [v7 desc];
      [v13 setPixelFormat:115];

      [v7 setLabel:0];
      uint64_t v14 = [(FigMetalContext *)self->_metalContext allocator];
      v15 = (MTLTexture *)[v14 newTextureWithDescriptor:v7];
      spatialAmbientWhitePointsRGBATexture = self->_spatialAmbientWhitePointsRGBATexture;
      self->_spatialAmbientWhitePointsRGBATexture = v15;

      if (!self->_spatialAmbientWhitePointsRGBATexture) {
        goto LABEL_11;
      }
      v17 = [v7 desc];
      [v17 setTextureType:2];

      uint64_t v18 = [(CMISoftwareFlashRenderingWhiteBalanceAmbientV2Configuration *)self->_config coarseWhitePointsSpatialGridWidth];
      v19 = [v7 desc];
      [v19 setWidth:v18];

      uint64_t v20 = [(CMISoftwareFlashRenderingWhiteBalanceAmbientV2Configuration *)self->_config coarseWhitePointsSpatialGridHeight];
      v21 = [v7 desc];
      [v21 setHeight:v20];

      objc_super v22 = [v7 desc];
      [v22 setPixelFormat:115];

      [v7 setLabel:0];
      v23 = [(FigMetalContext *)self->_metalContext allocator];
      v24 = (MTLTexture *)[v23 newTextureWithDescriptor:v7];
      coarseSpatialAmbientWhitePointsRGBATexture = self->_coarseSpatialAmbientWhitePointsRGBATexture;
      self->_coarseSpatialAmbientWhitePointsRGBATexture = v24;

      if (!self->_coarseSpatialAmbientWhitePointsRGBATexture) {
        goto LABEL_11;
      }
      v26 = [v7 desc];
      [v26 setTextureType:2];

      uint64_t v27 = [(CMISoftwareFlashRenderingWhiteBalanceAmbientV2Configuration *)self->_config coarseWhitePointsSpatialGridWidth];
      v28 = [v7 desc];
      [v28 setWidth:v27];

      uint64_t v29 = [(CMISoftwareFlashRenderingWhiteBalanceAmbientV2Configuration *)self->_config coarseWhitePointsSpatialGridHeight];
      v30 = [v7 desc];
      [v30 setHeight:v29];

      v31 = [v7 desc];
      [v31 setPixelFormat:115];

      [v7 setLabel:0];
      v32 = [(FigMetalContext *)self->_metalContext allocator];
      v33 = (MTLTexture *)[v32 newTextureWithDescriptor:v7];
      coarseSpatialAmbientWhitePointsIntermediateRGBATexture = self->_coarseSpatialAmbientWhitePointsIntermediateRGBATexture;
      self->_coarseSpatialAmbientWhitePointsIntermediateRGBATexture = v33;

      if (!self->_coarseSpatialAmbientWhitePointsIntermediateRGBATexture) {
        goto LABEL_11;
      }
      v35 = [v7 desc];
      [v35 setTextureType:2];

      uint64_t v36 = [(CMISoftwareFlashRenderingWhiteBalanceAmbientV2Configuration *)self->_config spatialWhitePointsGridWidth];
      v37 = [v7 desc];
      [v37 setWidth:v36];

      uint64_t v38 = [(CMISoftwareFlashRenderingWhiteBalanceAmbientV2Configuration *)self->_config spatialWhitePointsGridHeight];
      v39 = [v7 desc];
      [v39 setHeight:v38];

      v40 = [v7 desc];
      [v40 setPixelFormat:115];

      [v7 setLabel:0];
      v41 = [(FigMetalContext *)self->_metalContext allocator];
      v42 = (MTLTexture *)[v41 newTextureWithDescriptor:v7];
      fusedSpatialWhitePointsRGBTexture = self->_fusedSpatialWhitePointsRGBTexture;
      self->_fusedSpatialWhitePointsRGBTexture = v42;

      if (self->_fusedSpatialWhitePointsRGBTexture)
      {
        int v44 = 0;
      }
      else
      {
LABEL_11:
        fig_log_get_emitter();
        FigDebugAssert3();
        int v44 = 6;
      }
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      int v44 = 7;
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v7 = 0;
    int v44 = 11;
  }

  return v44;
}

- (int)_encodeWhiteBalanceGlobalApply:(id)a3 ambientSensorRGBTexture:(id)a4 ambientWhitePoint:(id)a5 outputAmbientBalancedRGBTexture:
{
  long long v18 = v5;
  id v9 = a3;
  id v10 = a4;
  long long v21 = v18;
  id v11 = a5;
  if (v9 && ([v9 computeCommandEncoder], (uint64_t v12 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v13 = v12;
    [v12 setComputePipelineState:self->_applyWhiteBalanceGlobalPipelineState];
    [v13 setTexture:v10 atIndex:0];
    [v13 setTexture:v11 atIndex:1];
    [v13 setBytes:&v21 length:16 atIndex:0];
    unint64_t v14 = [(MTLComputePipelineState *)self->_applyWhiteBalanceGlobalPipelineState threadExecutionWidth];
    unint64_t v15 = [(MTLComputePipelineState *)self->_applyWhiteBalanceGlobalPipelineState maxTotalThreadsPerThreadgroup]/ v14;
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
    int v16 = 8;
  }

  return v16;
}

- (int)_encodeSpatialAmbientWhitePointsCalculate:(CMISoftwareFlashRenderingWhiteBalanceAmbientV2 *)self strobeSensorRGBATexture:(SEL)a2 ambientSensorRGBATexture:(id)a3 ambientWhitePoint:(id)a4 strobeWhitePoint:(id)a5 ambientShadowZeroThreshold:(float)a6 ambientShadowOneThreshold:(float)a7 ambientSaturationZeroThreshold:(float)a8 ambientSaturationOneThreshold:(float)a9 strobeSaturationZeroThreshold:(float)a10 strobeSaturationOneThreshold:(float)a11 strobeAmbientMinRatioZeroThreshold:(float)a12 strobeAmbientMinRatioOneThreshold:(float)a13 outputSpatialAmbientWhitePointsRGBATexture:(id)a14
{
  long long v34 = *(_OWORD *)&a6;
  long long v35 = *(_OWORD *)&a7;
  id v24 = a3;
  id v25 = a4;
  id v26 = a5;
  long long v45 = v34;
  long long v44 = v35;
  float v42 = a9;
  float v43 = a8;
  float v40 = a11;
  float v41 = a10;
  float v38 = a13;
  float v39 = a12;
  id v27 = a14;
  if (v24 && ([v24 computeCommandEncoder], (v28 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v29 = v28;
    [v28 setComputePipelineState:self->_calculateSpatialAmbientWhitePointsPipelineState];
    [v29 setTexture:v25 atIndex:0];
    [v29 setTexture:v26 atIndex:1];
    [v29 setTexture:v27 atIndex:2];
    [v29 setBytes:&v45 length:16 atIndex:0];
    [v29 setBytes:&v44 length:16 atIndex:1];
    [v29 setBytes:&v43 length:4 atIndex:2];
    [v29 setBytes:&v42 length:4 atIndex:3];
    [v29 setBytes:&v41 length:4 atIndex:4];
    [v29 setBytes:&v40 length:4 atIndex:5];
    [v29 setBytes:&v39 length:4 atIndex:6];
    [v29 setBytes:&v38 length:4 atIndex:7];
    [v29 setBytes:&v46 length:4 atIndex:8];
    [v29 setBytes:(char *)&v46 + 4 length:4 atIndex:9];
    unint64_t v30 = [(MTLComputePipelineState *)self->_calculateSpatialAmbientWhitePointsPipelineState threadExecutionWidth];
    unint64_t v31 = [(MTLComputePipelineState *)self->_calculateSpatialAmbientWhitePointsPipelineState maxTotalThreadsPerThreadgroup]/ v30;
    v37[0] = [v27 width];
    v37[1] = [v27 height];
    v37[2] = 1;
    v36[0] = v30;
    v36[1] = v31;
    v36[2] = 1;
    [v29 dispatchThreads:v37 threadsPerThreadgroup:v36];
    [v29 endEncoding];

    int v32 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v32 = 8;
  }

  return v32;
}

- (int)_encodeThumbnailBoxWithLikelihoodWeightingCalculate:(id)a3 inputRGBATexture:(id)a4 outputRGBATexture:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8 && ([v8 computeCommandEncoder], (id v11 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v12 = v11;
    [v11 setComputePipelineState:self->_calculateThumbnailBoxWithLikelihoodWeightingPipelineState];
    [v12 setTexture:v9 atIndex:0];
    [v12 setTexture:v10 atIndex:1];
    unint64_t v13 = [(MTLComputePipelineState *)self->_calculateThumbnailBoxWithLikelihoodWeightingPipelineState threadExecutionWidth];
    unint64_t v14 = [(MTLComputePipelineState *)self->_calculateThumbnailBoxWithLikelihoodWeightingPipelineState maxTotalThreadsPerThreadgroup]/ v13;
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

- (int)_encodeGaussianFilteringWithLikelihoodWeightingHorizontalCalculate:(id)a3 inputRGBATexture:(id)a4 gaussianSigma:(float)a5 sigmaToFilterScale:(float)a6 outputRGBATexture:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  float v23 = a6;
  float v24 = a5;
  id v14 = a7;
  if (v12 && ([v12 computeCommandEncoder], (int v15 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    int v16 = v15;
    [v15 setComputePipelineState:self->_calculateGaussianFilteringWithLikelihoodWeightingHorizontalPipelineState];
    [v16 setTexture:v13 atIndex:0];
    [v16 setTexture:v14 atIndex:1];
    [v16 setBytes:&v24 length:4 atIndex:0];
    [v16 setBytes:&v23 length:4 atIndex:1];
    unint64_t v17 = [(MTLComputePipelineState *)self->_calculateGaussianFilteringWithLikelihoodWeightingHorizontalPipelineState threadExecutionWidth];
    unint64_t v18 = [(MTLComputePipelineState *)self->_calculateGaussianFilteringWithLikelihoodWeightingHorizontalPipelineState maxTotalThreadsPerThreadgroup]/ v17;
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
    int v19 = 8;
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
  if (v12 && ([v12 computeCommandEncoder], (int v15 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    int v16 = v15;
    [v15 setComputePipelineState:self->_calculateGaussianFilteringWithLikelihoodWeightingVerticalPipelineState];
    [v16 setTexture:v13 atIndex:0];
    [v16 setTexture:v14 atIndex:1];
    [v16 setBytes:&v24 length:4 atIndex:0];
    [v16 setBytes:&v23 length:4 atIndex:1];
    unint64_t v17 = [(MTLComputePipelineState *)self->_calculateGaussianFilteringWithLikelihoodWeightingVerticalPipelineState threadExecutionWidth];
    unint64_t v18 = [(MTLComputePipelineState *)self->_calculateGaussianFilteringWithLikelihoodWeightingVerticalPipelineState maxTotalThreadsPerThreadgroup]/ v17;
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
    int v19 = 8;
  }

  return v19;
}

- (int)_encodeWhiteBalanceSpatialApply:(id)a3 ambientSensorRGBTexture:(id)a4 spatialAmbientWhitePointsRGBATexture:(id)a5 coarseSpatialAmbientWhitePointsRGBATexture:(id)a6 ambientWhitePoint:(float)a7 spatialWhitePointLikelihood:(float)a8 coarseSpatialWhitePointLikelihood:(float)a9 ambientWhitePointLikelihood:(float)a10 spatialWhitePointCorrectionStrength:(id)a11 outputAmbientBalancedRGBTexture:
{
  int v13 = v11;
  long long v32 = *(_OWORD *)&a7;
  id v21 = a3;
  id v22 = a4;
  id v23 = a5;
  id v24 = a6;
  long long v39 = v32;
  float v37 = a9;
  float v38 = a8;
  int v35 = v13;
  float v36 = a10;
  id v25 = a11;
  if (v21 && ([v21 computeCommandEncoder], (id v26 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v27 = v26;
    [v26 setComputePipelineState:self->_applyWhiteBalanceSpatialPipelineState];
    [v27 setTexture:v22 atIndex:0];
    [v27 setTexture:v23 atIndex:1];
    [v27 setTexture:v24 atIndex:2];
    [v27 setTexture:v25 atIndex:3];
    [v27 setBytes:&v39 length:16 atIndex:0];
    [v27 setBytes:&v38 length:4 atIndex:1];
    [v27 setBytes:&v37 length:4 atIndex:2];
    [v27 setBytes:&v36 length:4 atIndex:3];
    [v27 setBytes:&v35 length:4 atIndex:4];
    unint64_t v28 = [(MTLComputePipelineState *)self->_applyWhiteBalanceSpatialPipelineState threadExecutionWidth];
    unint64_t v29 = [(MTLComputePipelineState *)self->_applyWhiteBalanceSpatialPipelineState maxTotalThreadsPerThreadgroup]/ v28;
    v34[0] = [v25 width];
    v34[1] = [v25 height];
    v34[2] = 1;
    v33[0] = v28;
    v33[1] = v29;
    v33[2] = 1;
    [v27 dispatchThreads:v34 threadsPerThreadgroup:v33];
    [v27 endEncoding];

    int v30 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v30 = 8;
  }

  return v30;
}

- (int)encodeWhiteBalanceAmbientApply:(id)a3 ambientSensorRGBATexture:(id)a4 strobeSensorRGBATexture:(id)a5 ambientWhitePoint:(id)a6 strobeWhitePoint:ambientWhitePointTuned:outputAmbientBalancedRGBTexture:
{
  double v67 = v7;
  double v68 = v8;
  double v66 = v6;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  if ([(CMISoftwareFlashRenderingWhiteBalanceAmbientV2Configuration *)self->_config spatialWhiteBalancingEnabled])
  {
    [(CMISoftwareFlashRenderingWhiteBalanceAmbientV2Configuration *)self->_config spatialWhitePointsAmbientShadowZeroThreshold];
    int v18 = v17;
    [(CMISoftwareFlashRenderingWhiteBalanceAmbientV2Configuration *)self->_config spatialWhitePointsAmbientShadowOneThreshold];
    int v20 = v19;
    [(CMISoftwareFlashRenderingWhiteBalanceAmbientV2Configuration *)self->_config spatialWhitePointsAmbientSaturationZeroThreshold];
    int v22 = v21;
    [(CMISoftwareFlashRenderingWhiteBalanceAmbientV2Configuration *)self->_config spatialWhitePointsAmbientSaturationOneThreshold];
    int v24 = v23;
    [(CMISoftwareFlashRenderingWhiteBalanceAmbientV2Configuration *)self->_config spatialWhitePointsStrobeSaturationZeroThreshold];
    int v26 = v25;
    [(CMISoftwareFlashRenderingWhiteBalanceAmbientV2Configuration *)self->_config spatialWhitePointsStrobeSaturationOneThreshold];
    int v28 = v27;
    [(CMISoftwareFlashRenderingWhiteBalanceAmbientV2Configuration *)self->_config spatialWhitePointsStrobeAmbientMinRatioZeroThreshold];
    unsigned int v30 = v29;
    [(CMISoftwareFlashRenderingWhiteBalanceAmbientV2Configuration *)self->_config spatialWhitePointsStrobeAmbientMinRatioOneThreshold];
    LODWORD(v31) = v18;
    LODWORD(v32) = v20;
    LODWORD(v33) = v22;
    LODWORD(v34) = v24;
    LODWORD(v35) = v26;
    LODWORD(v36) = v28;
    int v38 = -[CMISoftwareFlashRenderingWhiteBalanceAmbientV2 _encodeSpatialAmbientWhitePointsCalculate:strobeSensorRGBATexture:ambientSensorRGBATexture:ambientWhitePoint:strobeWhitePoint:ambientShadowZeroThreshold:ambientShadowOneThreshold:ambientSaturationZeroThreshold:ambientSaturationOneThreshold:strobeSaturationZeroThreshold:strobeSaturationOneThreshold:strobeAmbientMinRatioZeroThreshold:strobeAmbientMinRatioOneThreshold:outputSpatialAmbientWhitePointsRGBATexture:](self, "_encodeSpatialAmbientWhitePointsCalculate:strobeSensorRGBATexture:ambientSensorRGBATexture:ambientWhitePoint:strobeWhitePoint:ambientShadowZeroThreshold:ambientShadowOneThreshold:ambientSaturationZeroThreshold:ambientSaturationOneThreshold:strobeSaturationZeroThreshold:strobeSaturationOneThreshold:strobeAmbientMinRatioZeroThreshold:strobeAmbientMinRatioOneThreshold:outputSpatialAmbientWhitePointsRGBATexture:", v13, v15, v14, self->_spatialAmbientWhitePointsRGBATexture, v66, v67, v31, v32, v33, v34, v35, v36, __PAIR64__(v37, v30));
    if (v38) {
      goto LABEL_10;
    }
    int v38 = [(CMISoftwareFlashRenderingWhiteBalanceAmbientV2 *)self _encodeThumbnailBoxWithLikelihoodWeightingCalculate:v13 inputRGBATexture:self->_spatialAmbientWhitePointsRGBATexture outputRGBATexture:self->_coarseSpatialAmbientWhitePointsRGBATexture];
    if (v38) {
      goto LABEL_10;
    }
    coarseSpatialAmbientWhitePointsRGBATexture = self->_coarseSpatialAmbientWhitePointsRGBATexture;
    [(CMISoftwareFlashRenderingWhiteBalanceAmbientV2Configuration *)self->_config coarseWhitePointsGaussianSigma];
    int v41 = v40;
    [(CMISoftwareFlashRenderingWhiteBalanceAmbientV2Configuration *)self->_config coarseWhitePointsSigmaToFilterScale];
    LODWORD(v43) = v42;
    LODWORD(v44) = v41;
    int v38 = [(CMISoftwareFlashRenderingWhiteBalanceAmbientV2 *)self _encodeGaussianFilteringWithLikelihoodWeightingHorizontalCalculate:v13 inputRGBATexture:coarseSpatialAmbientWhitePointsRGBATexture gaussianSigma:self->_coarseSpatialAmbientWhitePointsIntermediateRGBATexture sigmaToFilterScale:v44 outputRGBATexture:v43];
    if (v38
      || (coarseSpatialAmbientWhitePointsIntermediateRGBATexture = self->_coarseSpatialAmbientWhitePointsIntermediateRGBATexture,
          [(CMISoftwareFlashRenderingWhiteBalanceAmbientV2Configuration *)self->_config coarseWhitePointsGaussianSigma], v47 = v46, [(CMISoftwareFlashRenderingWhiteBalanceAmbientV2Configuration *)self->_config coarseWhitePointsSigmaToFilterScale], LODWORD(v49) = v48, LODWORD(v50) = v47, (int v38 = [(CMISoftwareFlashRenderingWhiteBalanceAmbientV2 *)self _encodeGaussianFilteringWithLikelihoodWeightingVerticalCalculate:v13 inputRGBATexture:coarseSpatialAmbientWhitePointsIntermediateRGBATexture gaussianSigma:self->_coarseSpatialAmbientWhitePointsRGBATexture sigmaToFilterScale:v50 outputRGBATexture:v49]) != 0))
    {
LABEL_10:
      int v64 = v38;
      fig_log_get_emitter();
LABEL_13:
      FigDebugAssert3();
      goto LABEL_9;
    }
    spatialAmbientWhitePointsRGBATexture = self->_spatialAmbientWhitePointsRGBATexture;
    v52 = self->_coarseSpatialAmbientWhitePointsRGBATexture;
    [(CMISoftwareFlashRenderingWhiteBalanceAmbientV2Configuration *)self->_config fusionSpatialWhitePointLikelihood];
    int v54 = v53;
    [(CMISoftwareFlashRenderingWhiteBalanceAmbientV2Configuration *)self->_config fusionCoarseSpatialWhitePointLikelihood];
    int v56 = v55;
    [(CMISoftwareFlashRenderingWhiteBalanceAmbientV2Configuration *)self->_config fusionAmbientWhitePointLikelihood];
    int v58 = v57;
    [(CMISoftwareFlashRenderingWhiteBalanceAmbientV2Configuration *)self->_config fusionSpatialWhitePointCorrectionStrength];
    LODWORD(v60) = v59;
    LODWORD(v61) = v54;
    LODWORD(v62) = v56;
    LODWORD(v63) = v58;
    int v64 = [(CMISoftwareFlashRenderingWhiteBalanceAmbientV2 *)self _encodeWhiteBalanceSpatialApply:v13 ambientSensorRGBTexture:v14 spatialAmbientWhitePointsRGBATexture:spatialAmbientWhitePointsRGBATexture coarseSpatialAmbientWhitePointsRGBATexture:v52 ambientWhitePoint:v16 spatialWhitePointLikelihood:v68 coarseSpatialWhitePointLikelihood:v61 ambientWhitePointLikelihood:v62 spatialWhitePointCorrectionStrength:v63 outputAmbientBalancedRGBTexture:v60];
    if (v64)
    {
LABEL_12:
      fig_log_get_emitter();
      goto LABEL_13;
    }
  }
  else
  {
    int v64 = [(CMISoftwareFlashRenderingWhiteBalanceAmbientV2 *)self _encodeWhiteBalanceGlobalApply:v13 ambientSensorRGBTexture:v14 ambientWhitePoint:v16 outputAmbientBalancedRGBTexture:v68];
    if (v64) {
      goto LABEL_12;
    }
  }
LABEL_9:

  return v64;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fusedSpatialWhitePointsRGBTexture, 0);
  objc_storeStrong((id *)&self->_coarseSpatialAmbientWhitePointsIntermediateRGBATexture, 0);
  objc_storeStrong((id *)&self->_coarseSpatialAmbientWhitePointsRGBATexture, 0);
  objc_storeStrong((id *)&self->_spatialAmbientWhitePointsRGBATexture, 0);
  objc_storeStrong((id *)&self->_applyWhiteBalanceSpatialPipelineState, 0);
  objc_storeStrong((id *)&self->_calculateThumbnailBoxWithLikelihoodWeightingPipelineState, 0);
  objc_storeStrong((id *)&self->_calculateGaussianFilteringWithLikelihoodWeightingVerticalPipelineState, 0);
  objc_storeStrong((id *)&self->_calculateGaussianFilteringWithLikelihoodWeightingHorizontalPipelineState, 0);
  objc_storeStrong((id *)&self->_calculateSpatialAmbientWhitePointsPipelineState, 0);
  objc_storeStrong((id *)&self->_applyWhiteBalanceGlobalPipelineState, 0);
  objc_storeStrong((id *)&self->_config, 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end