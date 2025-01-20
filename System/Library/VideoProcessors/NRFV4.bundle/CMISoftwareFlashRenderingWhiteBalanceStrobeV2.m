@interface CMISoftwareFlashRenderingWhiteBalanceStrobeV2
- (CMISoftwareFlashRenderingWhiteBalanceStrobeV2)initWithMetalContext:(id)a3;
- (int)encodeWhiteBalanceStrobeApply:(id)a3 strobeSensorRGBTexture:(id)a4 strobeWhitePoint:(id)a5 outputStrobeBalancedRGBTexture:;
- (int)purgeResources;
@end

@implementation CMISoftwareFlashRenderingWhiteBalanceStrobeV2

- (CMISoftwareFlashRenderingWhiteBalanceStrobeV2)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CMISoftwareFlashRenderingWhiteBalanceStrobeV2;
  v6 = [(CMISoftwareFlashRenderingWhiteBalanceStrobeV2 *)&v12 init];
  v7 = v6;
  if (v6
    && v5
    && (objc_storeStrong((id *)&v6->_metalContext, a3),
        [(FigMetalContext *)v7->_metalContext computePipelineStateFor:@"applyWhiteBalanceStrobeV2" constants:0], uint64_t v8 = objc_claimAutoreleasedReturnValue(), applyWhiteBalanceStrobePipelineState = v7->_applyWhiteBalanceStrobePipelineState, v7->_applyWhiteBalanceStrobePipelineState = (MTLComputePipelineState *)v8, applyWhiteBalanceStrobePipelineState, v7->_applyWhiteBalanceStrobePipelineState))
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

- (int)purgeResources
{
  return 0;
}

- (int)encodeWhiteBalanceStrobeApply:(id)a3 strobeSensorRGBTexture:(id)a4 strobeWhitePoint:(id)a5 outputStrobeBalancedRGBTexture:
{
  long long v18 = v5;
  id v9 = a3;
  id v10 = a4;
  long long v21 = v18;
  id v11 = a5;
  if (v9 && ([v9 computeCommandEncoder], (objc_super v12 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v13 = v12;
    [v12 setComputePipelineState:self->_applyWhiteBalanceStrobePipelineState];
    [v13 setTexture:v10 atIndex:0];
    [v13 setTexture:v11 atIndex:1];
    [v13 setBytes:&v21 length:16 atIndex:0];
    unint64_t v14 = [(MTLComputePipelineState *)self->_applyWhiteBalanceStrobePipelineState threadExecutionWidth];
    unint64_t v15 = [(MTLComputePipelineState *)self->_applyWhiteBalanceStrobePipelineState maxTotalThreadsPerThreadgroup]/ v14;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applyWhiteBalanceStrobePipelineState, 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end