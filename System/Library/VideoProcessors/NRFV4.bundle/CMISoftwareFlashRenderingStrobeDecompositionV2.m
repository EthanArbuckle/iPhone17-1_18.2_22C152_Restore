@interface CMISoftwareFlashRenderingStrobeDecompositionV2
- (CMISoftwareFlashRenderingStrobeDecompositionV2)initWithMetalContext:(id)a3;
- (int)encodeStrobeComponentCalculate:(id)a3 flashSensorRGBATexture:(id)a4 ambientSensorRGBATexture:(id)a5 outputStrobeComponentRGBATexture:(id)a6;
- (int)purgeResources;
@end

@implementation CMISoftwareFlashRenderingStrobeDecompositionV2

- (CMISoftwareFlashRenderingStrobeDecompositionV2)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CMISoftwareFlashRenderingStrobeDecompositionV2;
  v6 = [(CMISoftwareFlashRenderingStrobeDecompositionV2 *)&v12 init];
  v7 = v6;
  if (v6
    && v5
    && (objc_storeStrong((id *)&v6->_metalContext, a3),
        [(FigMetalContext *)v7->_metalContext computePipelineStateFor:@"calculateStrobeComponentV2" constants:0], uint64_t v8 = objc_claimAutoreleasedReturnValue(), calculateStrobeComponentPipelineState = v7->_calculateStrobeComponentPipelineState, v7->_calculateStrobeComponentPipelineState = (MTLComputePipelineState *)v8, calculateStrobeComponentPipelineState, v7->_calculateStrobeComponentPipelineState))
  {
    v10 = v7;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v10 = 0;
  }

  return v10;
}

- (int)encodeStrobeComponentCalculate:(id)a3 flashSensorRGBATexture:(id)a4 ambientSensorRGBATexture:(id)a5 outputStrobeComponentRGBATexture:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v10 && ([v10 computeCommandEncoder], (v14 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v15 = v14;
    [v14 setComputePipelineState:self->_calculateStrobeComponentPipelineState];
    [v15 setTexture:v11 atIndex:0];
    [v15 setTexture:v12 atIndex:1];
    [v15 setTexture:v13 atIndex:2];
    unint64_t v16 = [(MTLComputePipelineState *)self->_calculateStrobeComponentPipelineState threadExecutionWidth];
    unint64_t v17 = [(MTLComputePipelineState *)self->_calculateStrobeComponentPipelineState maxTotalThreadsPerThreadgroup]/ v16;
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

- (int)purgeResources
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calculateStrobeComponentPipelineState, 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end