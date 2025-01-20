@interface CMISoftwareFlashRenderingCombineBalancedComponentsV2
- (CMISoftwareFlashRenderingCombineBalancedComponentsV2)initWithMetalContext:(id)a3;
- (int)_encodeBalancedComponentsCombine:(id)a3 ambientBalancedRGBTexture:(id)a4 strobeBalancedRGBTexture:(id)a5 flashOriginalRGBTexture:(id)a6 clippingCorrectionEnabled:(BOOL)a7 clippingCorrectionTransitionGain:(float)a8 clippingCorrectionTransitionExponent:(float)a9 outputFlashBalancedRGBTexture:(id)a10;
- (int)applyBalancedComponentsCombine:(id)a3 ambientBalancedRGBTexture:(id)a4 strobeBalancedRGBTexture:(id)a5 flashOriginalRGBTexture:(id)a6 outputFlashBalancedRGBTexture:(id)a7;
- (int)prepareToProcessWithConfig:(id)a3;
- (int)purgeResources;
@end

@implementation CMISoftwareFlashRenderingCombineBalancedComponentsV2

- (CMISoftwareFlashRenderingCombineBalancedComponentsV2)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CMISoftwareFlashRenderingCombineBalancedComponentsV2;
  v6 = [(CMISoftwareFlashRenderingCombineBalancedComponentsV2 *)&v12 init];
  v7 = v6;
  if (v6
    && v5
    && (objc_storeStrong((id *)&v6->_metalContext, a3),
        [(FigMetalContext *)v7->_metalContext computePipelineStateFor:@"combineBalancedComponentsV2" constants:0], uint64_t v8 = objc_claimAutoreleasedReturnValue(), combineBalancedComponentsPipelineState = v7->_combineBalancedComponentsPipelineState, v7->_combineBalancedComponentsPipelineState = (MTLComputePipelineState *)v8, combineBalancedComponentsPipelineState, v7->_combineBalancedComponentsPipelineState))
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

- (int)prepareToProcessWithConfig:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    objc_storeStrong((id *)&self->_config, a3);
    int v6 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v6 = 11;
  }

  return v6;
}

- (int)_encodeBalancedComponentsCombine:(id)a3 ambientBalancedRGBTexture:(id)a4 strobeBalancedRGBTexture:(id)a5 flashOriginalRGBTexture:(id)a6 clippingCorrectionEnabled:(BOOL)a7 clippingCorrectionTransitionGain:(float)a8 clippingCorrectionTransitionExponent:(float)a9 outputFlashBalancedRGBTexture:(id)a10
{
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  BOOL v33 = a7;
  float v31 = a9;
  float v32 = a8;
  id v22 = a10;
  if (v18 && ([v18 computeCommandEncoder], (v23 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v24 = v23;
    [v23 setComputePipelineState:self->_combineBalancedComponentsPipelineState];
    [v24 setTexture:v19 atIndex:0];
    [v24 setTexture:v20 atIndex:1];
    [v24 setTexture:v21 atIndex:2];
    [v24 setTexture:v22 atIndex:3];
    [v24 setBytes:&v33 length:1 atIndex:0];
    [v24 setBytes:&v32 length:4 atIndex:1];
    [v24 setBytes:&v31 length:4 atIndex:2];
    unint64_t v25 = [(MTLComputePipelineState *)self->_combineBalancedComponentsPipelineState threadExecutionWidth];
    unint64_t v26 = [(MTLComputePipelineState *)self->_combineBalancedComponentsPipelineState maxTotalThreadsPerThreadgroup]/ v25;
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

- (int)applyBalancedComponentsCombine:(id)a3 ambientBalancedRGBTexture:(id)a4 strobeBalancedRGBTexture:(id)a5 flashOriginalRGBTexture:(id)a6 outputFlashBalancedRGBTexture:(id)a7
{
  config = self->_config;
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  uint64_t v18 = [(CMISoftwareFlashRenderingCombineBalancedComponentsV2Configuration *)config clippingCorrectionEnabled];
  [(CMISoftwareFlashRenderingCombineBalancedComponentsV2Configuration *)self->_config clippingCorrectionTransitionGain];
  int v20 = v19;
  [(CMISoftwareFlashRenderingCombineBalancedComponentsV2Configuration *)self->_config clippingCorrectionTransitionExponent];
  LODWORD(v22) = v21;
  LODWORD(v23) = v20;
  int v24 = [(CMISoftwareFlashRenderingCombineBalancedComponentsV2 *)self _encodeBalancedComponentsCombine:v17 ambientBalancedRGBTexture:v16 strobeBalancedRGBTexture:v15 flashOriginalRGBTexture:v14 clippingCorrectionEnabled:v18 clippingCorrectionTransitionGain:v13 clippingCorrectionTransitionExponent:v23 outputFlashBalancedRGBTexture:v22];

  if (v24)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  return v24;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_combineBalancedComponentsPipelineState, 0);
  objc_storeStrong((id *)&self->_config, 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end