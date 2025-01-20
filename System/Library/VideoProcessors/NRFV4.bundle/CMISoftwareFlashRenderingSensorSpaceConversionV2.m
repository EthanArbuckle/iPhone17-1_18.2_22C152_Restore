@interface CMISoftwareFlashRenderingSensorSpaceConversionV2
- (CMISoftwareFlashRenderingSensorSpaceConversionV2)initWithMetalContext:(id)a3;
- (int)_encodeRGBtoNormSensorSpaceConvert:(id)a3 inputRGBTexture:(id)a4 appliedWhitePoint:(float)a5 integrationTimeScale:(float)a6 clippedLikelihoodScale:(float)a7 clippedLikelihoodExponent:(id)a8 outputSensorRGBATexture:;
- (int)_encodeRGBtoNormSensorSpaceWithLSCGainAdjustmentConvert:(CMISoftwareFlashRenderingSensorSpaceConversionV2 *)self inputRGBTexture:(SEL)a2 appliedWhitePoint:(id)a3 integrationTimeScale:(id)a4 appliedLSCGainsTexture:(float)a5 appliedLSCMaxGain:(id)a6 baseLSCGainsTexture:(float)a7 baseLSCMaxGain:(id)a8 LSCCropRect:(float)a9 fullSizeDimensions:(CMISoftwareFlashRenderingLSCCropRect *)a10 clippedLikelihoodScale:(float)a11 clippedLikelihoodExponent:(float)a12 outputSensorRGBATexture:(id)a13;
- (int)convertRGBtoNormSensorSpace:(id)a3 inputRGBTexture:(id)a4 appliedWhitePoint:(float)a5 integrationTimeScale:(id)a6 outputSensorRGBATexture:;
- (int)convertRGBtoNormSensorSpaceWithLSCGainAdjustment:(CMISoftwareFlashRenderingSensorSpaceConversionV2 *)self inputRGBTexture:(SEL)a2 appliedWhitePoint:(id)a3 integrationTimeScale:(id)a4 appliedLSCGainsTexture:(float)a5 appliedLSCMaxGain:(id)a6 baseLSCGainsTexture:(float)a7 baseLSCMaxGain:(id)a8 LSCCropRect:(float)a9 fullSizeDimensions:(CMISoftwareFlashRenderingLSCCropRect *)a10 outputSensorRGBATexture:(id)a11;
- (int)prepareToProcessWithConfig:(id)a3;
- (int)purgeResources;
@end

@implementation CMISoftwareFlashRenderingSensorSpaceConversionV2

- (CMISoftwareFlashRenderingSensorSpaceConversionV2)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CMISoftwareFlashRenderingSensorSpaceConversionV2;
  v6 = [(CMISoftwareFlashRenderingSensorSpaceConversionV2 *)&v14 init];
  v7 = v6;
  if (!v6) {
    goto LABEL_7;
  }
  if (!v5) {
    goto LABEL_7;
  }
  objc_storeStrong((id *)&v6->_metalContext, a3);
  uint64_t v8 = [(FigMetalContext *)v7->_metalContext computePipelineStateFor:@"convertRGBtoNormSensorSpaceV2" constants:0];
  convertRGBtoNormSensorSpacePipelineState = v7->_convertRGBtoNormSensorSpacePipelineState;
  v7->_convertRGBtoNormSensorSpacePipelineState = (MTLComputePipelineState *)v8;

  if (!v7->_convertRGBtoNormSensorSpacePipelineState) {
    goto LABEL_7;
  }
  uint64_t v10 = [(FigMetalContext *)v7->_metalContext computePipelineStateFor:@"convertRGBtoNormSensorSpaceWithLSCgainAdjustmentV2" constants:0];
  convertRGBtoNormSensorSpaceWithLSCGainAdjustmentPipelineState = v7->_convertRGBtoNormSensorSpaceWithLSCGainAdjustmentPipelineState;
  v7->_convertRGBtoNormSensorSpaceWithLSCGainAdjustmentPipelineState = (MTLComputePipelineState *)v10;

  if (v7->_convertRGBtoNormSensorSpaceWithLSCGainAdjustmentPipelineState)
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

- (int)_encodeRGBtoNormSensorSpaceConvert:(id)a3 inputRGBTexture:(id)a4 appliedWhitePoint:(float)a5 integrationTimeScale:(float)a6 clippedLikelihoodScale:(float)a7 clippedLikelihoodExponent:(id)a8 outputSensorRGBATexture:
{
  int v10 = v8;
  long long v24 = *(_OWORD *)&a5;
  id v15 = a3;
  id v16 = a4;
  long long v30 = v24;
  float v28 = a7;
  float v29 = a6;
  int v27 = v10;
  id v17 = a8;
  if (v15 && ([v15 computeCommandEncoder], (v18 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v19 = v18;
    [v18 setComputePipelineState:self->_convertRGBtoNormSensorSpacePipelineState];
    [v19 setTexture:v16 atIndex:0];
    [v19 setTexture:v17 atIndex:1];
    [v19 setBytes:&v30 length:16 atIndex:0];
    [v19 setBytes:&v29 length:4 atIndex:1];
    [v19 setBytes:&v28 length:4 atIndex:2];
    [v19 setBytes:&v27 length:4 atIndex:3];
    unint64_t v20 = [(MTLComputePipelineState *)self->_convertRGBtoNormSensorSpacePipelineState threadExecutionWidth];
    unint64_t v21 = [(MTLComputePipelineState *)self->_convertRGBtoNormSensorSpacePipelineState maxTotalThreadsPerThreadgroup]/ v20;
    v26[0] = [v17 width];
    v26[1] = [v17 height];
    v26[2] = 1;
    v25[0] = v20;
    v25[1] = v21;
    v25[2] = 1;
    [v19 dispatchThreads:v26 threadsPerThreadgroup:v25];
    [v19 endEncoding];

    int v22 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v22 = 8;
  }

  return v22;
}

- (int)_encodeRGBtoNormSensorSpaceWithLSCGainAdjustmentConvert:(CMISoftwareFlashRenderingSensorSpaceConversionV2 *)self inputRGBTexture:(SEL)a2 appliedWhitePoint:(id)a3 integrationTimeScale:(id)a4 appliedLSCGainsTexture:(float)a5 appliedLSCMaxGain:(id)a6 baseLSCGainsTexture:(float)a7 baseLSCMaxGain:(id)a8 LSCCropRect:(float)a9 fullSizeDimensions:(CMISoftwareFlashRenderingLSCCropRect *)a10 clippedLikelihoodScale:(float)a11 clippedLikelihoodExponent:(float)a12 outputSensorRGBATexture:(id)a13
{
  int v20 = v14;
  int v21 = v13;
  uint64_t v22 = *(void *)&a12;
  long long v38 = *(_OWORD *)&a5;
  id v27 = a3;
  id v28 = a4;
  long long v47 = v38;
  float v46 = a7;
  id v29 = a6;
  float v45 = a9;
  id v30 = a8;
  float v44 = a11;
  uint64_t v43 = v22;
  int v41 = v20;
  int v42 = v21;
  id v31 = a13;
  if (v27 && ([v27 computeCommandEncoder], (v32 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v33 = v32;
    [v32 setComputePipelineState:self->_convertRGBtoNormSensorSpaceWithLSCGainAdjustmentPipelineState];
    [v33 setTexture:v28 atIndex:0];
    [v33 setTexture:v31 atIndex:1];
    [v33 setTexture:v29 atIndex:2];
    [v33 setTexture:v30 atIndex:3];
    [v33 setBytes:&v45 length:4 atIndex:0];
    [v33 setBytes:&v44 length:4 atIndex:1];
    [v33 setBytes:&v47 length:16 atIndex:2];
    [v33 setBytes:&v46 length:4 atIndex:3];
    [v33 setBytes:a10 length:20 atIndex:4];
    [v33 setBytes:&v43 length:8 atIndex:5];
    [v33 setBytes:&v42 length:4 atIndex:6];
    [v33 setBytes:&v41 length:4 atIndex:7];
    unint64_t v34 = [(MTLComputePipelineState *)self->_convertRGBtoNormSensorSpaceWithLSCGainAdjustmentPipelineState threadExecutionWidth];
    unint64_t v35 = [(MTLComputePipelineState *)self->_convertRGBtoNormSensorSpaceWithLSCGainAdjustmentPipelineState maxTotalThreadsPerThreadgroup]/ v34;
    v40[0] = [v31 width];
    v40[1] = [v31 height];
    v40[2] = 1;
    v39[0] = v34;
    v39[1] = v35;
    v39[2] = 1;
    [v33 dispatchThreads:v40 threadsPerThreadgroup:v39];
    [v33 endEncoding];

    int v36 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v36 = 8;
  }

  return v36;
}

- (int)convertRGBtoNormSensorSpace:(id)a3 inputRGBTexture:(id)a4 appliedWhitePoint:(float)a5 integrationTimeScale:(id)a6 outputSensorRGBATexture:
{
  int v7 = v6;
  double v23 = *(double *)&a5;
  config = self->_config;
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  [(CMISoftwareFlashRenderingSensorSpaceConversionV2Configuration *)config clippedConfidenceLikelihoodScale];
  int v16 = v15;
  [(CMISoftwareFlashRenderingSensorSpaceConversionV2Configuration *)self->_config clippedConfidenceLikelihoodExponent];
  LODWORD(v18) = v17;
  LODWORD(v19) = v7;
  LODWORD(v20) = v16;
  int v21 = [(CMISoftwareFlashRenderingSensorSpaceConversionV2 *)self _encodeRGBtoNormSensorSpaceConvert:v14 inputRGBTexture:v13 appliedWhitePoint:v12 integrationTimeScale:v23 clippedLikelihoodScale:v19 clippedLikelihoodExponent:v20 outputSensorRGBATexture:v18];

  if (v21)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  return v21;
}

- (int)convertRGBtoNormSensorSpaceWithLSCGainAdjustment:(CMISoftwareFlashRenderingSensorSpaceConversionV2 *)self inputRGBTexture:(SEL)a2 appliedWhitePoint:(id)a3 integrationTimeScale:(id)a4 appliedLSCGainsTexture:(float)a5 appliedLSCMaxGain:(id)a6 baseLSCGainsTexture:(float)a7 baseLSCMaxGain:(id)a8 LSCCropRect:(float)a9 fullSizeDimensions:(CMISoftwareFlashRenderingLSCCropRect *)a10 outputSensorRGBATexture:(id)a11
{
  double v13 = v12;
  int v15 = v11;
  double v39 = *(double *)&a5;
  config = self->_config;
  id v24 = a11;
  id v25 = a8;
  id v26 = a6;
  id v27 = a4;
  id v28 = a3;
  [(CMISoftwareFlashRenderingSensorSpaceConversionV2Configuration *)config clippedConfidenceLikelihoodScale];
  int v30 = v29;
  [(CMISoftwareFlashRenderingSensorSpaceConversionV2Configuration *)self->_config clippedConfidenceLikelihoodExponent];
  LODWORD(v32) = v31;
  CMISoftwareFlashRenderingLSCCropRect v40 = *a10;
  *(float *)&double v33 = a7;
  *(float *)&double v34 = a9;
  LODWORD(v35) = v15;
  LODWORD(v36) = v30;
  int v37 = [(CMISoftwareFlashRenderingSensorSpaceConversionV2 *)self _encodeRGBtoNormSensorSpaceWithLSCGainAdjustmentConvert:v28 inputRGBTexture:v27 appliedWhitePoint:v26 integrationTimeScale:v25 appliedLSCGainsTexture:&v40 appliedLSCMaxGain:v24 baseLSCGainsTexture:v39 baseLSCMaxGain:v33 LSCCropRect:v34 fullSizeDimensions:v35 clippedLikelihoodScale:v13 clippedLikelihoodExponent:v36 outputSensorRGBATexture:v32];

  if (v37)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  return v37;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_convertRGBtoNormSensorSpaceWithLSCGainAdjustmentPipelineState, 0);
  objc_storeStrong((id *)&self->_convertRGBtoNormSensorSpacePipelineState, 0);
  objc_storeStrong((id *)&self->_config, 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end