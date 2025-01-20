@interface CMISoftwareFlashRenderingProRawGlobalWhitePointV2
- (CMISoftwareFlashRenderingProRawGlobalWhitePointV2)initWithMetalContext:(id)a3;
- (MTLBuffer)globalWhitePointBuffer;
- (int)_encodeGlobalWhitePointCalculate:(id)a3 spatialWhitePointsThumbnailRBTexture:(id)a4 outputGlobalWhitePointBuffer:(id)a5;
- (int)_encodeThumbnailBoxSpatialWhitePointsCalculate:(id)a3 spatialWhitePointsRBTexture:(id)a4 outputSpatialWhitePointsThumbnailRBTexture:(id)a5;
- (int)encodeGlobalWhitePointTo:(id)a3 spatialWhitePointsRBTexture:(id)a4;
- (int)prepareToProcessWithConfig:(id)a3;
- (int)purgeResources;
@end

@implementation CMISoftwareFlashRenderingProRawGlobalWhitePointV2

- (CMISoftwareFlashRenderingProRawGlobalWhitePointV2)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CMISoftwareFlashRenderingProRawGlobalWhitePointV2;
  v6 = [(CMISoftwareFlashRenderingProRawGlobalWhitePointV2 *)&v14 init];
  v7 = v6;
  if (!v6) {
    goto LABEL_7;
  }
  if (!v5) {
    goto LABEL_7;
  }
  objc_storeStrong((id *)&v6->_metalContext, a3);
  uint64_t v8 = [(FigMetalContext *)v7->_metalContext computePipelineStateFor:@"calculateThumbnailBoxSpatialWhitePointsV2" constants:0];
  calculateThumbnailBoxSpatialWhitePointsPipelineState = v7->_calculateThumbnailBoxSpatialWhitePointsPipelineState;
  v7->_calculateThumbnailBoxSpatialWhitePointsPipelineState = (MTLComputePipelineState *)v8;

  if (!v7->_calculateThumbnailBoxSpatialWhitePointsPipelineState) {
    goto LABEL_7;
  }
  uint64_t v10 = [(FigMetalContext *)v7->_metalContext computePipelineStateFor:@"calculateGlobalForegroundWhitePointV2" constants:0];
  calculateGlobalWhitePointPipelineState = v7->_calculateGlobalWhitePointPipelineState;
  v7->_calculateGlobalWhitePointPipelineState = (MTLComputePipelineState *)v10;

  if (v7->_calculateGlobalWhitePointPipelineState)
  {
    v12 = v7;
  }
  else
  {
LABEL_7:
    fig_log_get_emitter();
    FigDebugAssert3();
    v12 = 0;
  }

  return v12;
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
    v7 = 0;
    v18 = 0;
    int v22 = 11;
    goto LABEL_7;
  }
  objc_storeStrong((id *)&self->_config, a3);
  v6 = [(FigMetalContext *)self->_metalContext allocator];
  v7 = (void *)[v6 newTextureDescriptor];

  if (!v7)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v18 = 0;
LABEL_12:
    int v22 = 7;
    goto LABEL_7;
  }
  uint64_t v8 = [v7 desc];
  [v8 setTextureType:2];

  uint64_t v9 = [(CMISoftwareFlashRenderingProRawGlobalWhitePointConfigurationV2 *)self->_config thumbnailSpatialWhitePointsWidth];
  uint64_t v10 = [v7 desc];
  [v10 setWidth:v9];

  uint64_t v11 = [(CMISoftwareFlashRenderingProRawGlobalWhitePointConfigurationV2 *)self->_config thumbnailSpatialWhitePointsHeight];
  v12 = [v7 desc];
  [v12 setHeight:v11];

  v13 = [v7 desc];
  [v13 setPixelFormat:65];

  [v7 setLabel:0];
  objc_super v14 = [(FigMetalContext *)self->_metalContext allocator];
  v15 = (MTLTexture *)[v14 newTextureWithDescriptor:v7];
  spatialWhitePointsThumbnailRBTexture = self->_spatialWhitePointsThumbnailRBTexture;
  self->_spatialWhitePointsThumbnailRBTexture = v15;

  if (!self->_spatialWhitePointsThumbnailRBTexture)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v18 = 0;
LABEL_14:
    int v22 = 6;
    goto LABEL_7;
  }
  v17 = [(FigMetalContext *)self->_metalContext allocator];
  v18 = (void *)[v17 newBufferDescriptor];

  if (!v18)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_12;
  }
  [v18 setLength:16];
  [v18 setOptions:0];
  [v18 setLabel:0];
  v19 = [(FigMetalContext *)self->_metalContext allocator];
  v20 = (MTLBuffer *)[v19 newBufferWithDescriptor:v18];
  globalWhitePointBuffer = self->_globalWhitePointBuffer;
  self->_globalWhitePointBuffer = v20;

  if (!self->_globalWhitePointBuffer)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_14;
  }
  int v22 = 0;
LABEL_7:

  return v22;
}

- (int)_encodeThumbnailBoxSpatialWhitePointsCalculate:(id)a3 spatialWhitePointsRBTexture:(id)a4 outputSpatialWhitePointsThumbnailRBTexture:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8 && ([v8 computeCommandEncoder], (uint64_t v11 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v12 = v11;
    [v11 setComputePipelineState:self->_calculateThumbnailBoxSpatialWhitePointsPipelineState];
    [v12 setTexture:v9 atIndex:0];
    [v12 setTexture:v10 atIndex:1];
    unint64_t v13 = [(MTLComputePipelineState *)self->_calculateThumbnailBoxSpatialWhitePointsPipelineState threadExecutionWidth];
    unint64_t v14 = [(MTLComputePipelineState *)self->_calculateThumbnailBoxSpatialWhitePointsPipelineState maxTotalThreadsPerThreadgroup]/ v13;
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

- (int)_encodeGlobalWhitePointCalculate:(id)a3 spatialWhitePointsThumbnailRBTexture:(id)a4 outputGlobalWhitePointBuffer:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8 && ([v8 computeCommandEncoder], (uint64_t v11 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v12 = v11;
    [v11 setComputePipelineState:self->_calculateGlobalWhitePointPipelineState];
    [v12 setTexture:v9 atIndex:0];
    [v12 setBuffer:v10 offset:0 atIndex:0];
    unint64_t v13 = [(MTLComputePipelineState *)self->_calculateGlobalWhitePointPipelineState threadExecutionWidth];
    unint64_t v14 = [(MTLComputePipelineState *)self->_calculateGlobalWhitePointPipelineState maxTotalThreadsPerThreadgroup];
    int64x2_t v18 = vdupq_n_s64(1uLL);
    uint64_t v19 = 1;
    v17[0] = v13;
    v17[1] = v14 / v13;
    v17[2] = 1;
    [v12 dispatchThreads:&v18 threadsPerThreadgroup:v17];
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

- (int)encodeGlobalWhitePointTo:(id)a3 spatialWhitePointsRBTexture:(id)a4
{
  id v6 = a3;
  int v7 = [(CMISoftwareFlashRenderingProRawGlobalWhitePointV2 *)self _encodeThumbnailBoxSpatialWhitePointsCalculate:v6 spatialWhitePointsRBTexture:a4 outputSpatialWhitePointsThumbnailRBTexture:self->_spatialWhitePointsThumbnailRBTexture];
  if (v7)
  {
    int v8 = v7;
    fig_log_get_emitter();
LABEL_6:
    FigDebugAssert3();
    goto LABEL_3;
  }
  int v8 = [(CMISoftwareFlashRenderingProRawGlobalWhitePointV2 *)self _encodeGlobalWhitePointCalculate:v6 spatialWhitePointsThumbnailRBTexture:self->_spatialWhitePointsThumbnailRBTexture outputGlobalWhitePointBuffer:self->_globalWhitePointBuffer];
  if (v8)
  {
    fig_log_get_emitter();
    goto LABEL_6;
  }
LABEL_3:

  return v8;
}

- (MTLBuffer)globalWhitePointBuffer
{
  return (MTLBuffer *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_globalWhitePointBuffer, 0);
  objc_storeStrong((id *)&self->_spatialWhitePointsThumbnailRBTexture, 0);
  objc_storeStrong((id *)&self->_calculateGlobalWhitePointPipelineState, 0);
  objc_storeStrong((id *)&self->_calculateThumbnailBoxSpatialWhitePointsPipelineState, 0);
  objc_storeStrong((id *)&self->_config, 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end