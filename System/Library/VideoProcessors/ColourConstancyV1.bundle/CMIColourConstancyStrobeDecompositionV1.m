@interface CMIColourConstancyStrobeDecompositionV1
- (CMIColourConstancyStrobeDecompositionV1)initWithMetalContext:(id)a3;
- (int)encodeStrobeComponentCalculate:(id)a3 flashSensorRGBATexture:(id)a4 ambientSensorRGBATexture:(id)a5 strobeWhitePoint:(id)a6 outputStrobeComponentRGBATexture:;
- (int)purgeResources;
@end

@implementation CMIColourConstancyStrobeDecompositionV1

- (CMIColourConstancyStrobeDecompositionV1)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CMIColourConstancyStrobeDecompositionV1;
  v6 = [(CMIColourConstancyStrobeDecompositionV1 *)&v12 init];
  v7 = v6;
  if (v6
    && v5
    && (objc_storeStrong((id *)&v6->_metalContext, a3),
        [(FigMetalContext *)v7->_metalContext computePipelineStateFor:@"ColourConstancy::calculateStrobeComponentV1" constants:0], uint64_t v8 = objc_claimAutoreleasedReturnValue(), calculateStrobeComponentPipelineState = v7->_calculateStrobeComponentPipelineState, v7->_calculateStrobeComponentPipelineState = (MTLComputePipelineState *)v8, calculateStrobeComponentPipelineState, v7->_calculateStrobeComponentPipelineState))
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

- (int)encodeStrobeComponentCalculate:(id)a3 flashSensorRGBATexture:(id)a4 ambientSensorRGBATexture:(id)a5 strobeWhitePoint:(id)a6 outputStrobeComponentRGBATexture:
{
  long long v21 = v6;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  long long v24 = v21;
  id v14 = a6;
  if (v11 && ([v11 computeCommandEncoder], (v15 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v16 = v15;
    [v15 setComputePipelineState:self->_calculateStrobeComponentPipelineState];
    [v16 setTexture:v12 atIndex:0];
    [v16 setTexture:v13 atIndex:1];
    [v16 setTexture:v14 atIndex:2];
    [v16 setBytes:&v24 length:16 atIndex:0];
    unint64_t v17 = (unint64_t)[(MTLComputePipelineState *)self->_calculateStrobeComponentPipelineState threadExecutionWidth];
    unint64_t v18 = (unint64_t)[(MTLComputePipelineState *)self->_calculateStrobeComponentPipelineState maxTotalThreadsPerThreadgroup]/ v17;
    v23[0] = [v14 width];
    v23[1] = [v14 height];
    v23[2] = 1;
    v22[0] = v17;
    v22[1] = v18;
    v22[2] = 1;
    [v16 dispatchThreads:v23 threadsPerThreadgroup:v22];
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