@interface CMIColourConstancyConfidenceV1
- (CMIColourConstancyConfidenceV1)initWithMetalContext:(id)a3;
- (MTLBuffer)globalCenterWeightedConfidenceLevelBuffer;
- (int)_encodeCenterWeightedConfidenceLevelCalculate:(id)a3 colourAccuracyConfidenceThumbnailTexture:(id)a4 centerWeightingGaussianSigmaScale:(float)a5 centerWeightingSigmaToFilterScale:(float)a6 outputGlobalCenterWeightedConfidenceLevel:(id)a7;
- (int)_encodeCenterWeightedConfidenceThumbnailBoxCalculate:(id)a3 colourAccuracyConfidenceTexture:(id)a4 centerWeightingGaussianSigmaScale:(float)a5 centerWeightingSigmaToFilterScale:(float)a6 outputColourAccuracyConfidenceThumbnailTexture:(id)a7;
- (int)_encodeColourAccuracyConfidenceCalculate:(id)a3 strobeComponentRGBATexture:(id)a4 strobeBalancedThumbnailRGBTexture:(id)a5 strobeReconstructedBalancedThumbnailRGBTexture:(id)a6 strobeIlluminationZeroThreshold:(float)a7 strobeIlluminationOneThreshold:(float)a8 styleTransferAccuracyZeroThreshold:(float)a9 styleTransferAccuracyOneThreshold:(float)a10 styleTransferAccuracyGammaCorrection:(float)a11 outputColourAccuracyConfidenceTexture:(id)a12;
- (int)_encodeStrobeIlluminationConfidenceCalculate:(id)a3 strobeComponentRGBTexture:(id)a4 strobeIlluminationZeroThreshold:(float)a5 strobeIlluminationOneThreshold:(float)a6 outputStrobeIlluminationConfidenceRTexture:(id)a7;
- (int)calculateColourAccuracyConfidence:(id)a3 strobeComponentRGBATexture:(id)a4 strobeBalancedThumbnailRGBTexture:(id)a5 strobeReconstructedBalancedThumbnailRGBTexture:(id)a6 outputColourAccuracyConfidenceTexture:(id)a7;
- (int)calculateStrobeIlluminationConfidence:(id)a3 strobeComponentRGBTexture:(id)a4 outputStrobeIlluminationConfidenceRTexture:(id)a5;
- (int)prepareToProcessWithConfig:(id)a3;
- (int)purgeResources;
@end

@implementation CMIColourConstancyConfidenceV1

- (CMIColourConstancyConfidenceV1)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CMIColourConstancyConfidenceV1;
  v6 = [(CMIColourConstancyConfidenceV1 *)&v18 init];
  v7 = v6;
  if (!v6) {
    goto LABEL_9;
  }
  if (!v5) {
    goto LABEL_9;
  }
  objc_storeStrong((id *)&v6->_metalContext, a3);
  uint64_t v8 = [(FigMetalContext *)v7->_metalContext computePipelineStateFor:@"ColourConstancy::calculateStrobeIlluminationConfidenceV1" constants:0];
  calculateStrobeIlluminationConfidencePipelineState = v7->_calculateStrobeIlluminationConfidencePipelineState;
  v7->_calculateStrobeIlluminationConfidencePipelineState = (MTLComputePipelineState *)v8;

  if (!v7->_calculateStrobeIlluminationConfidencePipelineState) {
    goto LABEL_9;
  }
  uint64_t v10 = [(FigMetalContext *)v7->_metalContext computePipelineStateFor:@"ColourConstancy::calculateColourAccuracyConfidenceV1" constants:0];
  calculateColourAccuracyConfidencePipelineState = v7->_calculateColourAccuracyConfidencePipelineState;
  v7->_calculateColourAccuracyConfidencePipelineState = (MTLComputePipelineState *)v10;

  if (!v7->_calculateColourAccuracyConfidencePipelineState) {
    goto LABEL_9;
  }
  uint64_t v12 = [(FigMetalContext *)v7->_metalContext computePipelineStateFor:@"ColourConstancy::calculateCenterWeightedConfidenceThumbnailV1" constants:0];
  calculateCenterWeightedConfidenceThumbnailPipelineState = v7->_calculateCenterWeightedConfidenceThumbnailPipelineState;
  v7->_calculateCenterWeightedConfidenceThumbnailPipelineState = (MTLComputePipelineState *)v12;

  if (!v7->_calculateCenterWeightedConfidenceThumbnailPipelineState) {
    goto LABEL_9;
  }
  uint64_t v14 = [(FigMetalContext *)v7->_metalContext computePipelineStateFor:@"ColourConstancy::calculateCenterWeightedConfidenceLevelV1" constants:0];
  calculateCenterWeightedConfidenceLevelPipelineState = v7->_calculateCenterWeightedConfidenceLevelPipelineState;
  v7->_calculateCenterWeightedConfidenceLevelPipelineState = (MTLComputePipelineState *)v14;

  if (v7->_calculateCenterWeightedConfidenceLevelPipelineState)
  {
    v16 = v7;
  }
  else
  {
LABEL_9:
    fig_log_get_emitter();
    FigDebugAssert3();
    v16 = 0;
  }

  return v16;
}

- (int)purgeResources
{
  return 0;
}

- (int)prepareToProcessWithConfig:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    id v12 = 0;
    id v7 = 0;
    int v22 = 8;
    goto LABEL_7;
  }
  objc_storeStrong((id *)&self->_config, a3);
  v6 = [(FigMetalContext *)self->_metalContext allocator];
  id v7 = [v6 newBufferDescriptor];

  if (!v7)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    id v12 = 0;
LABEL_12:
    int v22 = 7;
    goto LABEL_7;
  }
  [v7 setLength:4];
  [v7 setOptions:0];
  [v7 setLabel:0];
  uint64_t v8 = [(FigMetalContext *)self->_metalContext allocator];
  v9 = (MTLBuffer *)[v8 newBufferWithDescriptor:v7];
  globalCenterWeightedConfidenceLevelBuffer = self->_globalCenterWeightedConfidenceLevelBuffer;
  self->_globalCenterWeightedConfidenceLevelBuffer = v9;

  if (!self->_globalCenterWeightedConfidenceLevelBuffer)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    id v12 = 0;
LABEL_14:
    int v22 = 6;
    goto LABEL_7;
  }
  v11 = [(FigMetalContext *)self->_metalContext allocator];
  id v12 = [v11 newTextureDescriptor];

  if (!v12)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_12;
  }
  v13 = [v12 desc];
  [v13 setTextureType:2];

  uint64_t v14 = [(CMIColourConstancyConfidenceConfigurationV1 *)self->_config thumbnailConfidenceMapWidth];
  v15 = [v12 desc];
  [v15 setWidth:v14];

  uint64_t v16 = [(CMIColourConstancyConfidenceConfigurationV1 *)self->_config thumbnailConfidenceMapHeight];
  v17 = [v12 desc];
  [v17 setHeight:v16];

  objc_super v18 = [v12 desc];
  [v18 setPixelFormat:25];

  [v12 setLabel:0];
  v19 = [(FigMetalContext *)self->_metalContext allocator];
  v20 = (MTLTexture *)[v19 newTextureWithDescriptor:v12];
  colourAccuracyConfidenceThumbnailTexture = self->_colourAccuracyConfidenceThumbnailTexture;
  self->_colourAccuracyConfidenceThumbnailTexture = v20;

  if (!self->_colourAccuracyConfidenceThumbnailTexture)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_14;
  }
  int v22 = 0;
LABEL_7:

  return v22;
}

- (int)_encodeStrobeIlluminationConfidenceCalculate:(id)a3 strobeComponentRGBTexture:(id)a4 strobeIlluminationZeroThreshold:(float)a5 strobeIlluminationOneThreshold:(float)a6 outputStrobeIlluminationConfidenceRTexture:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  float v23 = a6;
  float v24 = a5;
  id v14 = a7;
  if (v12 && ([v12 computeCommandEncoder], (v15 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v16 = v15;
    [v15 setComputePipelineState:self->_calculateStrobeIlluminationConfidencePipelineState];
    [v16 setTexture:v13 atIndex:0];
    [v16 setTexture:v14 atIndex:1];
    [v16 setBytes:&v24 length:4 atIndex:0];
    [v16 setBytes:&v23 length:4 atIndex:1];
    unint64_t v17 = (unint64_t)[(MTLComputePipelineState *)self->_calculateStrobeIlluminationConfidencePipelineState threadExecutionWidth];
    unint64_t v18 = (unint64_t)[(MTLComputePipelineState *)self->_calculateStrobeIlluminationConfidencePipelineState maxTotalThreadsPerThreadgroup]/ v17;
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

- (int)_encodeColourAccuracyConfidenceCalculate:(id)a3 strobeComponentRGBATexture:(id)a4 strobeBalancedThumbnailRGBTexture:(id)a5 strobeReconstructedBalancedThumbnailRGBTexture:(id)a6 strobeIlluminationZeroThreshold:(float)a7 strobeIlluminationOneThreshold:(float)a8 styleTransferAccuracyZeroThreshold:(float)a9 styleTransferAccuracyOneThreshold:(float)a10 styleTransferAccuracyGammaCorrection:(float)a11 outputColourAccuracyConfidenceTexture:(id)a12
{
  id v22 = a3;
  id v23 = a4;
  id v24 = a5;
  id v25 = a6;
  float v38 = a8;
  float v39 = a7;
  float v36 = a10;
  float v37 = a9;
  float v35 = a11;
  id v26 = a12;
  if (v22 && ([v22 computeCommandEncoder], (v27 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v28 = v27;
    [v27 setComputePipelineState:self->_calculateColourAccuracyConfidencePipelineState];
    [v28 setTexture:v23 atIndex:0];
    [v28 setTexture:v24 atIndex:1];
    [v28 setTexture:v25 atIndex:2];
    [v28 setTexture:v26 atIndex:3];
    [v28 setBytes:&v39 length:4 atIndex:0];
    [v28 setBytes:&v38 length:4 atIndex:1];
    [v28 setBytes:&v37 length:4 atIndex:2];
    [v28 setBytes:&v36 length:4 atIndex:3];
    [v28 setBytes:&v35 length:4 atIndex:4];
    unint64_t v29 = (unint64_t)[(MTLComputePipelineState *)self->_calculateColourAccuracyConfidencePipelineState threadExecutionWidth];
    unint64_t v30 = (unint64_t)[(MTLComputePipelineState *)self->_calculateColourAccuracyConfidencePipelineState maxTotalThreadsPerThreadgroup]/ v29;
    v34[0] = [v26 width];
    v34[1] = [v26 height];
    v34[2] = 1;
    v33[0] = v29;
    v33[1] = v30;
    v33[2] = 1;
    [v28 dispatchThreads:v34 threadsPerThreadgroup:v33];
    [v28 endEncoding];

    int v31 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v31 = 10;
  }

  return v31;
}

- (int)_encodeCenterWeightedConfidenceThumbnailBoxCalculate:(id)a3 colourAccuracyConfidenceTexture:(id)a4 centerWeightingGaussianSigmaScale:(float)a5 centerWeightingSigmaToFilterScale:(float)a6 outputColourAccuracyConfidenceThumbnailTexture:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  if (v12 && ([v12 computeCommandEncoder], (uint64_t v15 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v16 = (void *)v15;
    float v24 = (float)(unint64_t)[v13 width];
    id v17 = [v13 height];
    v18.f32[0] = v24;
    v18.f32[1] = (float)(unint64_t)v17;
    float32x2_t v19 = vsub_f32(vmul_f32(v18, (float32x2_t)0x3F0000003F000000), v18);
    float v27 = (float)(sqrtf(vaddv_f32(vmul_f32(v19, v19))) / a6) * a5;
    [v16 setComputePipelineState:self->_calculateCenterWeightedConfidenceThumbnailPipelineState];
    [v16 setTexture:v13 atIndex:0];
    [v16 setTexture:v14 atIndex:1];
    [v16 setBytes:&v27 length:4 atIndex:0];
    unint64_t v20 = (unint64_t)[(MTLComputePipelineState *)self->_calculateCenterWeightedConfidenceThumbnailPipelineState threadExecutionWidth];
    unint64_t v21 = (unint64_t)[(MTLComputePipelineState *)self->_calculateCenterWeightedConfidenceThumbnailPipelineState maxTotalThreadsPerThreadgroup]/ v20;
    v26[0] = [v14 width];
    v26[1] = [v14 height];
    v26[2] = 1;
    v25[0] = v20;
    v25[1] = v21;
    v25[2] = 1;
    [v16 dispatchThreads:v26 threadsPerThreadgroup:v25];
    [v16 endEncoding];

    int v22 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v22 = 10;
  }

  return v22;
}

- (int)_encodeCenterWeightedConfidenceLevelCalculate:(id)a3 colourAccuracyConfidenceThumbnailTexture:(id)a4 centerWeightingGaussianSigmaScale:(float)a5 centerWeightingSigmaToFilterScale:(float)a6 outputGlobalCenterWeightedConfidenceLevel:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  if (v12 && ([v12 computeCommandEncoder], (uint64_t v15 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v16 = (void *)v15;
    float v24 = (float)(unint64_t)[v13 width];
    id v17 = [v13 height];
    v18.f32[0] = v24;
    v18.f32[1] = (float)(unint64_t)v17;
    float32x2_t v19 = vsub_f32(vmul_f32(v18, (float32x2_t)0x3F0000003F000000), v18);
    float v28 = (float)(sqrtf(vaddv_f32(vmul_f32(v19, v19))) / a6) * a5;
    [v16 setComputePipelineState:self->_calculateCenterWeightedConfidenceLevelPipelineState];
    [v16 setTexture:v13 atIndex:0];
    [v16 setBuffer:v14 offset:0 atIndex:0];
    [v16 setBytes:&v28 length:4 atIndex:1];
    unint64_t v20 = (unint64_t)[(MTLComputePipelineState *)self->_calculateCenterWeightedConfidenceLevelPipelineState threadExecutionWidth];
    unint64_t v21 = (unint64_t)[(MTLComputePipelineState *)self->_calculateCenterWeightedConfidenceLevelPipelineState maxTotalThreadsPerThreadgroup];
    int64x2_t v26 = vdupq_n_s64(1uLL);
    uint64_t v27 = 1;
    v25[0] = v20;
    v25[1] = v21 / v20;
    v25[2] = 1;
    [v16 dispatchThreads:&v26 threadsPerThreadgroup:v25];
    [v16 endEncoding];

    int v22 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v22 = 10;
  }

  return v22;
}

- (int)calculateStrobeIlluminationConfidence:(id)a3 strobeComponentRGBTexture:(id)a4 outputStrobeIlluminationConfidenceRTexture:(id)a5
{
  config = self->_config;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  [(CMIColourConstancyConfidenceConfigurationV1 *)config strobeIlluminationZeroThreshold];
  int v13 = v12;
  [(CMIColourConstancyConfidenceConfigurationV1 *)self->_config strobeIlluminationOneThreshold];
  LODWORD(v15) = v14;
  LODWORD(v16) = v13;
  int v17 = [(CMIColourConstancyConfidenceV1 *)self _encodeStrobeIlluminationConfidenceCalculate:v11 strobeComponentRGBTexture:v10 strobeIlluminationZeroThreshold:v9 strobeIlluminationOneThreshold:v16 outputStrobeIlluminationConfidenceRTexture:v15];

  if (v17)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  return v17;
}

- (int)calculateColourAccuracyConfidence:(id)a3 strobeComponentRGBATexture:(id)a4 strobeBalancedThumbnailRGBTexture:(id)a5 strobeReconstructedBalancedThumbnailRGBTexture:(id)a6 outputColourAccuracyConfidenceTexture:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  config = self->_config;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  [(CMIColourConstancyConfidenceConfigurationV1 *)config strobeIlluminationZeroThreshold];
  int v19 = v18;
  [(CMIColourConstancyConfidenceConfigurationV1 *)self->_config strobeIlluminationOneThreshold];
  int v21 = v20;
  [(CMIColourConstancyConfidenceConfigurationV1 *)self->_config styleTransferAccuracyZeroThreshold];
  int v23 = v22;
  [(CMIColourConstancyConfidenceConfigurationV1 *)self->_config styleTransferAccuracyOneThreshold];
  int v25 = v24;
  [(CMIColourConstancyConfidenceConfigurationV1 *)self->_config styleTransferAccuracyGammaCorrection];
  LODWORD(v27) = v26;
  LODWORD(v28) = v19;
  LODWORD(v29) = v21;
  LODWORD(v30) = v23;
  LODWORD(v31) = v25;
  int v32 = [(CMIColourConstancyConfidenceV1 *)self _encodeColourAccuracyConfidenceCalculate:v12 strobeComponentRGBATexture:v17 strobeBalancedThumbnailRGBTexture:v16 strobeReconstructedBalancedThumbnailRGBTexture:v15 strobeIlluminationZeroThreshold:v13 strobeIlluminationOneThreshold:v28 styleTransferAccuracyZeroThreshold:v29 styleTransferAccuracyOneThreshold:v30 styleTransferAccuracyGammaCorrection:v31 outputColourAccuracyConfidenceTexture:v27];

  if (v32) {
    goto LABEL_7;
  }
  [(CMIColourConstancyConfidenceConfigurationV1 *)self->_config centerWeightingGaussianSigmaScale];
  int v34 = v33;
  [(CMIColourConstancyConfidenceConfigurationV1 *)self->_config centerWeightingSigmaToFilterScale];
  LODWORD(v36) = v35;
  LODWORD(v37) = v34;
  unsigned int v38 = [(CMIColourConstancyConfidenceV1 *)self _encodeCenterWeightedConfidenceThumbnailBoxCalculate:v12 colourAccuracyConfidenceTexture:v13 centerWeightingGaussianSigmaScale:self->_colourAccuracyConfidenceThumbnailTexture centerWeightingSigmaToFilterScale:v37 outputColourAccuracyConfidenceThumbnailTexture:v36];
  if (v38)
  {
    int v32 = v38;
    fig_log_get_emitter();
LABEL_8:
    FigDebugAssert3();
    goto LABEL_4;
  }
  colourAccuracyConfidenceThumbnailTexture = self->_colourAccuracyConfidenceThumbnailTexture;
  [(CMIColourConstancyConfidenceConfigurationV1 *)self->_config centerWeightingGaussianSigmaScale];
  int v41 = v40;
  [(CMIColourConstancyConfidenceConfigurationV1 *)self->_config centerWeightingSigmaToFilterScale];
  LODWORD(v43) = v42;
  LODWORD(v44) = v41;
  int v32 = [(CMIColourConstancyConfidenceV1 *)self _encodeCenterWeightedConfidenceLevelCalculate:v12 colourAccuracyConfidenceThumbnailTexture:colourAccuracyConfidenceThumbnailTexture centerWeightingGaussianSigmaScale:self->_globalCenterWeightedConfidenceLevelBuffer centerWeightingSigmaToFilterScale:v44 outputGlobalCenterWeightedConfidenceLevel:v43];
  if (v32)
  {
LABEL_7:
    fig_log_get_emitter();
    goto LABEL_8;
  }
LABEL_4:

  return v32;
}

- (MTLBuffer)globalCenterWeightedConfidenceLevelBuffer
{
  return (MTLBuffer *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_globalCenterWeightedConfidenceLevelBuffer, 0);
  objc_storeStrong((id *)&self->_colourAccuracyConfidenceThumbnailTexture, 0);
  objc_storeStrong((id *)&self->_calculateCenterWeightedConfidenceLevelPipelineState, 0);
  objc_storeStrong((id *)&self->_calculateCenterWeightedConfidenceThumbnailPipelineState, 0);
  objc_storeStrong((id *)&self->_calculateColourAccuracyConfidencePipelineState, 0);
  objc_storeStrong((id *)&self->_calculateStrobeIlluminationConfidencePipelineState, 0);
  objc_storeStrong((id *)&self->_config, 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end