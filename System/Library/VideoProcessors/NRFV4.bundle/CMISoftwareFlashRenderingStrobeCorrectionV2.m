@interface CMISoftwareFlashRenderingStrobeCorrectionV2
- (CMISoftwareFlashRenderingStrobeCorrectionV2)initWithMetalContext:(id)a3;
- (int)_encodeStrobeCorrectionCalculate:(id)a3 ambientComponentRGBTexture:(id)a4 strobeComponentRGBTexture:(id)a5 ambientLSCGainsTexture:(id)a6 flashLSCGainsTexture:(id)a7 ambientLSCMaxGain:(float)a8 flashLSCMaxGain:(float)a9 lscCropRect:(CMISoftwareFlashRenderingLSCCropRect *)a10 fullSizeDimensions:(float)a11 strobeBeamProfileScaleMinimum:(float)a12 strobeBeamProfileScaleMaximum:(float)a13 strobeBeamProfileComponentZeroThreshold:(float)a14 strobeBeamProfileComponentOneThreshold:(float)a15 ambientStrobeBeamProfileMixFactor:(id)a16 outputAmbientCorrectedRGBTexture:(id)a17 outputStrobeCorrectedRGBTexture:;
- (int)applyStrobeCorrection:(id)a3 ambientComponentRGBTexture:(id)a4 strobeComponentRGBTexture:(id)a5 ambientLSCGainsTexture:(id)a6 flashLSCGainsTexture:(id)a7 ambientLSCMaxGain:(float)a8 flashLSCMaxGain:(float)a9 lscCropRect:(CMISoftwareFlashRenderingLSCCropRect *)a10 fullSizeDimensions:(id)a11 outputAmbientCorrectedRGBTexture:(id)a12 outputStrobeCorrectedRGBTexture:;
- (int)prepareToProcessWithConfig:(id)a3;
- (int)purgeResources;
@end

@implementation CMISoftwareFlashRenderingStrobeCorrectionV2

- (CMISoftwareFlashRenderingStrobeCorrectionV2)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CMISoftwareFlashRenderingStrobeCorrectionV2;
  v6 = [(CMISoftwareFlashRenderingStrobeCorrectionV2 *)&v12 init];
  v7 = v6;
  if (v6
    && v5
    && (objc_storeStrong((id *)&v6->_metalContext, a3),
        [(FigMetalContext *)v7->_metalContext computePipelineStateFor:@"calculateStrobeCorrectionV2" constants:0], uint64_t v8 = objc_claimAutoreleasedReturnValue(), calculateStrobeCorrectionV2PipelineState = v7->_calculateStrobeCorrectionV2PipelineState, v7->_calculateStrobeCorrectionV2PipelineState = (MTLComputePipelineState *)v8, calculateStrobeCorrectionV2PipelineState, v7->_calculateStrobeCorrectionV2PipelineState))
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

- (int)_encodeStrobeCorrectionCalculate:(id)a3 ambientComponentRGBTexture:(id)a4 strobeComponentRGBTexture:(id)a5 ambientLSCGainsTexture:(id)a6 flashLSCGainsTexture:(id)a7 ambientLSCMaxGain:(float)a8 flashLSCMaxGain:(float)a9 lscCropRect:(CMISoftwareFlashRenderingLSCCropRect *)a10 fullSizeDimensions:(float)a11 strobeBeamProfileScaleMinimum:(float)a12 strobeBeamProfileScaleMaximum:(float)a13 strobeBeamProfileComponentZeroThreshold:(float)a14 strobeBeamProfileComponentOneThreshold:(float)a15 ambientStrobeBeamProfileMixFactor:(id)a16 outputAmbientCorrectedRGBTexture:(id)a17 outputStrobeCorrectedRGBTexture:
{
  int v23 = v17;
  uint64_t v28 = *(void *)&a11;
  id v31 = a3;
  id v32 = a4;
  id v33 = a5;
  id v34 = a6;
  id v35 = a7;
  float v58 = a9;
  v59[0] = a8;
  uint64_t v57 = v28;
  float v55 = a13;
  float v56 = a12;
  float v53 = a15;
  float v54 = a14;
  int v52 = v23;
  id v36 = a16;
  id v37 = a17;
  v49 = v31;
  if (v31 && ([v31 computeCommandEncoder], (v38 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v39 = v38;
    [v38 setComputePipelineState:self->_calculateStrobeCorrectionV2PipelineState];
    [v39 setTexture:v32 atIndex:0];
    [v39 setTexture:v33 atIndex:1];
    [v39 setTexture:v36 atIndex:2];
    [v39 setTexture:v37 atIndex:3];
    [v39 setTexture:v34 atIndex:4];
    [v39 setTexture:v35 atIndex:5];
    [v39 setBytes:v59 length:4 atIndex:0];
    [v39 setBytes:&v58 length:4 atIndex:1];
    [v39 setBytes:a10 length:20 atIndex:2];
    [v39 setBytes:&v57 length:8 atIndex:3];
    [v39 setBytes:&v56 length:4 atIndex:4];
    [v39 setBytes:&v55 length:4 atIndex:5];
    [v39 setBytes:&v54 length:4 atIndex:6];
    [v39 setBytes:&v53 length:4 atIndex:7];
    [v39 setBytes:&v52 length:4 atIndex:8];
    unint64_t v40 = [(MTLComputePipelineState *)self->_calculateStrobeCorrectionV2PipelineState threadExecutionWidth];
    id v41 = v35;
    id v42 = v34;
    id v43 = v33;
    id v44 = v32;
    unint64_t v45 = [(MTLComputePipelineState *)self->_calculateStrobeCorrectionV2PipelineState maxTotalThreadsPerThreadgroup]/ v40;
    v51[0] = [v37 width];
    v51[1] = [v37 height];
    v51[2] = 1;
    v50[0] = v40;
    v50[1] = v45;
    id v32 = v44;
    id v33 = v43;
    id v34 = v42;
    id v35 = v41;
    v50[2] = 1;
    [v39 dispatchThreads:v51 threadsPerThreadgroup:v50];
    [v39 endEncoding];

    int v46 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v46 = 8;
  }

  return v46;
}

- (int)applyStrobeCorrection:(id)a3 ambientComponentRGBTexture:(id)a4 strobeComponentRGBTexture:(id)a5 ambientLSCGainsTexture:(id)a6 flashLSCGainsTexture:(id)a7 ambientLSCMaxGain:(float)a8 flashLSCMaxGain:(float)a9 lscCropRect:(CMISoftwareFlashRenderingLSCCropRect *)a10 fullSizeDimensions:(id)a11 outputAmbientCorrectedRGBTexture:(id)a12 outputStrobeCorrectedRGBTexture:
{
  double v13 = v12;
  config = self->_config;
  id v24 = a12;
  id v25 = a11;
  id v26 = a7;
  id v27 = a6;
  id v28 = a5;
  id v29 = a4;
  id v30 = a3;
  [(CMISoftwareFlashRenderingStrobeCorrectionV2Configuration *)config strobeBeamProfileScaleMinimum];
  int v32 = v31;
  [(CMISoftwareFlashRenderingStrobeCorrectionV2Configuration *)self->_config strobeBeamProfileScaleMaximum];
  int v34 = v33;
  [(CMISoftwareFlashRenderingStrobeCorrectionV2Configuration *)self->_config strobeBeamProfileComponentZeroThreshold];
  int v36 = v35;
  [(CMISoftwareFlashRenderingStrobeCorrectionV2Configuration *)self->_config strobeBeamProfileComponentOneThreshold];
  int v38 = v37;
  [(CMISoftwareFlashRenderingStrobeCorrectionV2Configuration *)self->_config ambientStrobeBeamProfileMixFactor];
  LODWORD(v40) = v39;
  CMISoftwareFlashRenderingLSCCropRect v48 = *a10;
  *(float *)&double v41 = a9;
  LODWORD(v42) = v32;
  LODWORD(v43) = v34;
  LODWORD(v44) = v36;
  LODWORD(v45) = v38;
  int v46 = -[CMISoftwareFlashRenderingStrobeCorrectionV2 _encodeStrobeCorrectionCalculate:ambientComponentRGBTexture:strobeComponentRGBTexture:ambientLSCGainsTexture:flashLSCGainsTexture:ambientLSCMaxGain:flashLSCMaxGain:lscCropRect:fullSizeDimensions:strobeBeamProfileScaleMinimum:strobeBeamProfileScaleMaximum:strobeBeamProfileComponentZeroThreshold:strobeBeamProfileComponentOneThreshold:ambientStrobeBeamProfileMixFactor:outputAmbientCorrectedRGBTexture:outputStrobeCorrectedRGBTexture:](self, "_encodeStrobeCorrectionCalculate:ambientComponentRGBTexture:strobeComponentRGBTexture:ambientLSCGainsTexture:flashLSCGainsTexture:ambientLSCMaxGain:flashLSCMaxGain:lscCropRect:fullSizeDimensions:strobeBeamProfileScaleMinimum:strobeBeamProfileScaleMaximum:strobeBeamProfileComponentZeroThreshold:strobeBeamProfileComponentOneThreshold:ambientStrobeBeamProfileMixFactor:outputAmbientCorrectedRGBTexture:outputStrobeCorrectedRGBTexture:", v30, v29, v28, v27, v26, &v48, COERCE_DOUBLE(__PAIR64__(v48.var0.var1, LODWORD(a8))), v41, v13, v42, v43, v44, v45, v40,
          v25,
          v24);

  if (v46)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  return v46;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calculateStrobeCorrectionV2PipelineState, 0);
  objc_storeStrong((id *)&self->_config, 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end