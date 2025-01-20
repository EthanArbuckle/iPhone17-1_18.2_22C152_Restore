@interface CMIColourConstancyStrobeCorrectionV1
- (CMIColourConstancyStrobeCorrectionV1)initWithMetalContext:(id)a3;
- (int)_encodeStrobeCorrectionCalculate:(id)a3 strobeComponentRGBTexture:(id)a4 strobeBeamProfileGainRTexture:(id)a5 strobeBeamProfileScaleMinimum:(float)a6 strobeBeamProfileScaleMaximum:(float)a7 strobeBeamProfileComponentZeroThreshold:(float)a8 strobeBeamProfileComponentOneThreshold:(float)a9 outputStrobeCorrectedRGBTexture:(id)a10;
- (int)applyStrobeCorrection:(id)a3 strobeComponentRGBTexture:(id)a4 strobeBeamProfileGainRTexture:(id)a5 outputStrobeCorrectedRGBTexture:(id)a6;
- (int)prepareToProcessWithConfig:(id)a3;
- (int)purgeResources;
@end

@implementation CMIColourConstancyStrobeCorrectionV1

- (CMIColourConstancyStrobeCorrectionV1)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CMIColourConstancyStrobeCorrectionV1;
  v6 = [(CMIColourConstancyStrobeCorrectionV1 *)&v12 init];
  v7 = v6;
  if (v6
    && v5
    && (objc_storeStrong((id *)&v6->_metalContext, a3),
        [(FigMetalContext *)v7->_metalContext computePipelineStateFor:@"ColourConstancy::calculateStrobeCorrectionV1" constants:0], uint64_t v8 = objc_claimAutoreleasedReturnValue(), calculateStrobeCorrectionPipelineState = v7->_calculateStrobeCorrectionPipelineState, v7->_calculateStrobeCorrectionPipelineState = (MTLComputePipelineState *)v8, calculateStrobeCorrectionPipelineState, v7->_calculateStrobeCorrectionPipelineState))
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
    int v6 = 8;
  }

  return v6;
}

- (int)_encodeStrobeCorrectionCalculate:(id)a3 strobeComponentRGBTexture:(id)a4 strobeBeamProfileGainRTexture:(id)a5 strobeBeamProfileScaleMinimum:(float)a6 strobeBeamProfileScaleMaximum:(float)a7 strobeBeamProfileComponentZeroThreshold:(float)a8 strobeBeamProfileComponentOneThreshold:(float)a9 outputStrobeCorrectedRGBTexture:(id)a10
{
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  float v32 = a7;
  float v33 = a6;
  float v30 = a9;
  float v31 = a8;
  id v21 = a10;
  if (v18 && ([v18 computeCommandEncoder], (v22 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v23 = v22;
    [v22 setComputePipelineState:self->_calculateStrobeCorrectionPipelineState];
    [v23 setTexture:v19 atIndex:0];
    [v23 setTexture:v20 atIndex:1];
    [v23 setTexture:v21 atIndex:2];
    [v23 setBytes:&v33 length:4 atIndex:0];
    [v23 setBytes:&v32 length:4 atIndex:1];
    [v23 setBytes:&v31 length:4 atIndex:2];
    [v23 setBytes:&v30 length:4 atIndex:3];
    unint64_t v24 = (unint64_t)[(MTLComputePipelineState *)self->_calculateStrobeCorrectionPipelineState threadExecutionWidth];
    unint64_t v25 = (unint64_t)[(MTLComputePipelineState *)self->_calculateStrobeCorrectionPipelineState maxTotalThreadsPerThreadgroup]/ v24;
    v29[0] = [v21 width];
    v29[1] = [v21 height];
    v29[2] = 1;
    v28[0] = v24;
    v28[1] = v25;
    v28[2] = 1;
    [v23 dispatchThreads:v29 threadsPerThreadgroup:v28];
    [v23 endEncoding];

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

- (int)applyStrobeCorrection:(id)a3 strobeComponentRGBTexture:(id)a4 strobeBeamProfileGainRTexture:(id)a5 outputStrobeCorrectedRGBTexture:(id)a6
{
  config = self->_config;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  [(CMIColourConstancyStrobeCorrectionConfigurationV1 *)config strobeBeamProfileScaleMinimum];
  int v16 = v15;
  [(CMIColourConstancyStrobeCorrectionConfigurationV1 *)self->_config strobeBeamProfileScaleMaximum];
  int v18 = v17;
  [(CMIColourConstancyStrobeCorrectionConfigurationV1 *)self->_config strobeBeamProfileComponentZeroThreshold];
  int v20 = v19;
  [(CMIColourConstancyStrobeCorrectionConfigurationV1 *)self->_config strobeBeamProfileComponentOneThreshold];
  LODWORD(v22) = v21;
  LODWORD(v23) = v16;
  LODWORD(v24) = v18;
  LODWORD(v25) = v20;
  int v26 = [(CMIColourConstancyStrobeCorrectionV1 *)self _encodeStrobeCorrectionCalculate:v14 strobeComponentRGBTexture:v13 strobeBeamProfileGainRTexture:v12 strobeBeamProfileScaleMinimum:v11 strobeBeamProfileScaleMaximum:v23 strobeBeamProfileComponentZeroThreshold:v24 strobeBeamProfileComponentOneThreshold:v25 outputStrobeCorrectedRGBTexture:v22];

  if (v26)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  return v26;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calculateStrobeCorrectionPipelineState, 0);
  objc_storeStrong((id *)&self->_config, 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end