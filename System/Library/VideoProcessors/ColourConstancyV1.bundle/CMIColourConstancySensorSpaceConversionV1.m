@interface CMIColourConstancySensorSpaceConversionV1
- (CMIColourConstancySensorSpaceConversionV1)initWithMetalContext:(id)a3;
- (id)convertYUVtoRegisteredNormSensorSpaceThumbnail:(double)a3 inputLumaTexture:(double)a4 inputChromaTexture:(double)a5 appliedScaledLSCGainsRGBTexture:(double)a6 baseScaledLSCGainsRGBTexture:(float)a7 yuvOffsets:(uint64_t)a8 cropRect:(void *)a9 registrationHomography:(void *)a10 appliedWhitePoint:(void *)a11 integrationTimeScale:(void *)a12 outputWarpedSensorThumbnailRGBATexture:(void *)a13;
- (int)_encodeScaledLSCGainsAndStrobeBeamProfileCalculate:(id)a3 ambientLSCGainsTexture:(id)a4 flashLSCGainsTexture:(id)a5 cropRect:(CMIColourConstancyCropRect)a6 LSCCropRect:(CMIColourConstancyLSCCropRect *)a7 fullSizeDimensions:(float)a8 ambientLSCMaxGain:(float)a9 flashLSCMaxGain:(id)a10 outputAmbientScaledLSCGainsRGBTexture:(id)a11 outputFlashScaledLSCGainsRGBTexture:(id)a12 outputStrobeBeamProfileGainRTexture:;
- (int)_encodeYUVtoNormSensorSpaceThumbnail:(CMIColourConstancySensorSpaceConversionV1 *)self inputLumaTexture:(SEL)a2 inputChromaTexture:(id)a3 appliedScaledLSCGainsRGBTexture:(id)a4 baseScaledLSCGainsRGBTexture:(id)a5 yuvOffsets:(id)a6 cropRect:(id)a7 appliedWhitePoint:(CMIColourConstancyCropRect)a8 integrationTimeScale:(float)a9 clippedLikelihoodScale:(float)a10 clippedLikelihoodExponent:(float)a11 outputBalancedThumbnailRGBATexture:(id)a12 outputSensorThumbnailRGBATexture:(id)a13;
- (int)calculateScaledLSCGainsAndStrobeBeamProfile:(id)a3 ambientLSCGainsTexture:(id)a4 flashLSCGainsTexture:(id)a5 cropRect:(CMIColourConstancyCropRect)a6 LSCCropRect:(CMIColourConstancyLSCCropRect *)a7 fullSizeDimensions:(float)a8 ambientLSCMaxGain:(float)a9 flashLSCMaxGain:(id)a10 outputAmbientScaledLSCGainsRGBTexture:(id)a11 outputFlashScaledLSCGainsRGBTexture:(id)a12 outputStrobeBeamProfileGainRTexture:;
- (int)convertYUVtoNormSensorSpaceThumbnail:(CMIColourConstancySensorSpaceConversionV1 *)self inputLumaTexture:(SEL)a2 inputChromaTexture:(id)a3 appliedScaledLSCGainsRGBTexture:(id)a4 baseScaledLSCGainsRGBTexture:(id)a5 yuvOffsets:(id)a6 cropRect:(id)a7 appliedWhitePoint:(CMIColourConstancyCropRect)a8 integrationTimeScale:(float)a9 outputBalancedThumbnailRGBATexture:(id)a10 outputSensorThumbnailRGBATexture:(id)a11;
- (int)prepareToProcessWithConfig:(id)a3;
- (int)purgeResources;
- (uint64_t)_encodeYUVtoRegisteredNormSensorSpaceThumbnail:(__n128)a3 inputLumaTexture:(__n128)a4 inputChromaTexture:(__n128)a5 appliedScaledLSCGainsRGBTexture:(__n128)a6 baseScaledLSCGainsRGBTexture:(float)a7 yuvOffsets:(float)a8 cropRect:(float)a9 registrationHomography:(uint64_t)a10 appliedWhitePoint:(void *)a11 integrationTimeScale:(void *)a12 clippedLikelihoodScale:(void *)a13 clippedLikelihoodExponent:(void *)a14 outputWarpedSensorThumbnailRGBATexture:(void *)a15;
@end

@implementation CMIColourConstancySensorSpaceConversionV1

- (CMIColourConstancySensorSpaceConversionV1)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CMIColourConstancySensorSpaceConversionV1;
  v6 = [(CMIColourConstancySensorSpaceConversionV1 *)&v16 init];
  v7 = v6;
  if (!v6) {
    goto LABEL_8;
  }
  if (!v5) {
    goto LABEL_8;
  }
  objc_storeStrong((id *)&v6->_metalContext, a3);
  uint64_t v8 = [(FigMetalContext *)v7->_metalContext computePipelineStateFor:@"ColourConstancy::calculateScaledLSCGainsAndStrobeBeamProfileV1" constants:0];
  calculateScaledLSCGainsAndStrobeBeamProfilePipelineState = v7->_calculateScaledLSCGainsAndStrobeBeamProfilePipelineState;
  v7->_calculateScaledLSCGainsAndStrobeBeamProfilePipelineState = (MTLComputePipelineState *)v8;

  if (!v7->_calculateScaledLSCGainsAndStrobeBeamProfilePipelineState) {
    goto LABEL_8;
  }
  uint64_t v10 = [(FigMetalContext *)v7->_metalContext computePipelineStateFor:@"ColourConstancy::convertYUVtoRegisteredNormSensorSpaceThumbnailV1" constants:0];
  convertYUVtoRegisteredNormSensorSpaceThumbnailPipelineState = v7->_convertYUVtoRegisteredNormSensorSpaceThumbnailPipelineState;
  v7->_convertYUVtoRegisteredNormSensorSpaceThumbnailPipelineState = (MTLComputePipelineState *)v10;

  if (!v7->_convertYUVtoRegisteredNormSensorSpaceThumbnailPipelineState) {
    goto LABEL_8;
  }
  uint64_t v12 = [(FigMetalContext *)v7->_metalContext computePipelineStateFor:@"ColourConstancy::convertYUVtoNormSensorSpaceThumbnailV1" constants:0];
  convertYUVtoNormSensorSpaceThumbnailPipelineState = v7->_convertYUVtoNormSensorSpaceThumbnailPipelineState;
  v7->_convertYUVtoNormSensorSpaceThumbnailPipelineState = (MTLComputePipelineState *)v12;

  if (v7->_convertYUVtoNormSensorSpaceThumbnailPipelineState)
  {
    v14 = v7;
  }
  else
  {
LABEL_8:
    fig_log_get_emitter();
    FigDebugAssert3();
    v14 = 0;
  }

  return v14;
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

- (int)_encodeScaledLSCGainsAndStrobeBeamProfileCalculate:(id)a3 ambientLSCGainsTexture:(id)a4 flashLSCGainsTexture:(id)a5 cropRect:(CMIColourConstancyCropRect)a6 LSCCropRect:(CMIColourConstancyLSCCropRect *)a7 fullSizeDimensions:(float)a8 ambientLSCMaxGain:(float)a9 flashLSCMaxGain:(id)a10 outputAmbientScaledLSCGainsRGBTexture:(id)a11 outputFlashScaledLSCGainsRGBTexture:(id)a12 outputStrobeBeamProfileGainRTexture:
{
  int v16 = v12;
  uint64_t v18 = *(void *)&a8;
  CMIColourConstancyCropRect v41 = a6;
  id v20 = a3;
  id v21 = a4;
  id v22 = a5;
  uint64_t v40 = v18;
  int v38 = v16;
  float v39 = a9;
  id v23 = a10;
  id v24 = a11;
  id v25 = a12;
  if (v20 && ([v20 computeCommandEncoder], (v26 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v27 = v26;
    [v26 setComputePipelineState:self->_calculateScaledLSCGainsAndStrobeBeamProfilePipelineState];
    [v27 setTexture:v21 atIndex:0];
    [v27 setTexture:v22 atIndex:1];
    [v27 setTexture:v23 atIndex:2];
    [v27 setTexture:v24 atIndex:3];
    [v27 setTexture:v25 atIndex:4];
    [v27 setBytes:&v41 length:16 atIndex:0];
    [v27 setBytes:a7 length:20 atIndex:1];
    [v27 setBytes:&v40 length:8 atIndex:2];
    [v27 setBytes:&v39 length:4 atIndex:3];
    [v27 setBytes:&v38 length:4 atIndex:4];
    unint64_t v28 = (unint64_t)[(MTLComputePipelineState *)self->_calculateScaledLSCGainsAndStrobeBeamProfilePipelineState threadExecutionWidth];
    id v29 = v24;
    id v30 = v23;
    id v31 = v22;
    id v32 = v21;
    unint64_t v33 = (unint64_t)[(MTLComputePipelineState *)self->_calculateScaledLSCGainsAndStrobeBeamProfilePipelineState maxTotalThreadsPerThreadgroup]/ v28;
    v37[0] = [v25 width];
    v37[1] = [v25 height];
    v37[2] = 1;
    v36[0] = v28;
    v36[1] = v33;
    id v21 = v32;
    id v22 = v31;
    id v23 = v30;
    id v24 = v29;
    v36[2] = 1;
    [v27 dispatchThreads:v37 threadsPerThreadgroup:v36];
    [v27 endEncoding];

    int v34 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v34 = 10;
  }

  return v34;
}

- (uint64_t)_encodeYUVtoRegisteredNormSensorSpaceThumbnail:(__n128)a3 inputLumaTexture:(__n128)a4 inputChromaTexture:(__n128)a5 appliedScaledLSCGainsRGBTexture:(__n128)a6 baseScaledLSCGainsRGBTexture:(float)a7 yuvOffsets:(float)a8 cropRect:(float)a9 registrationHomography:(uint64_t)a10 appliedWhitePoint:(void *)a11 integrationTimeScale:(void *)a12 clippedLikelihoodScale:(void *)a13 clippedLikelihoodExponent:(void *)a14 outputWarpedSensorThumbnailRGBATexture:(void *)a15
{
  v57[0] = a17;
  v57[1] = a18;
  v56[0] = a3;
  v56[1] = a4;
  v56[2] = a5;
  id v27 = a11;
  id v28 = a12;
  id v29 = a13;
  id v30 = a14;
  id v31 = a15;
  __n128 v54 = a6;
  __n128 v55 = a2;
  float v52 = a8;
  float v53 = a7;
  float v51 = a9;
  id v32 = a19;
  if (v27 && ([v27 computeCommandEncoder], (uint64_t v33 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    int v34 = (void *)v33;
    float v47 = (float)(int)a17 / (float)(unint64_t)[v32 width];
    id v35 = [v32 height];
    *(float *)&uint64_t v36 = v47;
    *((float *)&v36 + 1) = (float)SHIDWORD(a17) / (float)(unint64_t)v35;
    uint64_t v50 = v36;
    [v34 setComputePipelineState:*(void *)(a1 + 32)];
    [v34 setTexture:v28 atIndex:0];
    [v34 setTexture:v29 atIndex:1];
    [v34 setTexture:v30 atIndex:2];
    [v34 setTexture:v31 atIndex:3];
    [v34 setTexture:v32 atIndex:4];
    [v34 setBytes:&v55 length:16 atIndex:0];
    [v34 setBytes:&v50 length:8 atIndex:1];
    [v34 setBytes:v57 length:16 atIndex:2];
    [v34 setBytes:v56 length:48 atIndex:3];
    [v34 setBytes:&v54 length:16 atIndex:4];
    [v34 setBytes:&v53 length:4 atIndex:5];
    [v34 setBytes:&v52 length:4 atIndex:6];
    [v34 setBytes:&v51 length:4 atIndex:7];
    unint64_t v37 = (unint64_t)[*(id *)(a1 + 32) threadExecutionWidth];
    id v38 = v31;
    id v39 = v30;
    id v40 = v29;
    id v41 = v28;
    unint64_t v42 = (unint64_t)[*(id *)(a1 + 32) maxTotalThreadsPerThreadgroup] / v37;
    v49[0] = [v32 width];
    v49[1] = [v32 height];
    v49[2] = 1;
    v48[0] = v37;
    v48[1] = v42;
    id v28 = v41;
    id v29 = v40;
    id v30 = v39;
    id v31 = v38;
    v48[2] = 1;
    [v34 dispatchThreads:v49 threadsPerThreadgroup:v48];
    [v34 endEncoding];

    uint64_t v43 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    uint64_t v43 = 10;
  }

  return v43;
}

- (int)_encodeYUVtoNormSensorSpaceThumbnail:(CMIColourConstancySensorSpaceConversionV1 *)self inputLumaTexture:(SEL)a2 inputChromaTexture:(id)a3 appliedScaledLSCGainsRGBTexture:(id)a4 baseScaledLSCGainsRGBTexture:(id)a5 yuvOffsets:(id)a6 cropRect:(id)a7 appliedWhitePoint:(CMIColourConstancyCropRect)a8 integrationTimeScale:(float)a9 clippedLikelihoodScale:(float)a10 clippedLikelihoodExponent:(float)a11 outputBalancedThumbnailRGBATexture:(id)a12 outputSensorThumbnailRGBATexture:(id)a13
{
  int v19 = v14;
  int v20 = v13;
  long long v42 = *(_OWORD *)&a9;
  long long v44 = *(_OWORD *)&a10;
  CMIColourConstancyCropRect v54 = a8;
  id v23 = a3;
  id v24 = a4;
  id v25 = a5;
  id v26 = a6;
  id v27 = a7;
  long long v52 = v44;
  long long v53 = v42;
  int v50 = v20;
  float v51 = a11;
  int v49 = v19;
  id v28 = a12;
  id v29 = a13;
  if (v23)
  {
    id v45 = v23;
    uint64_t v30 = [v23 computeCommandEncoder];
    if (v30)
    {
      id v31 = (void *)v30;
      id v32 = v26;
      id v33 = v24;
      float v43 = (float)a8.var0 / (float)(unint64_t)[v29 width];
      id v34 = [v29 height];
      *(float *)&uint64_t v35 = v43;
      *((float *)&v35 + 1) = (float)a8.var1 / (float)(unint64_t)v34;
      uint64_t v48 = v35;
      [v31 setComputePipelineState:self->_convertYUVtoNormSensorSpaceThumbnailPipelineState];
      [v31 setTexture:v24 atIndex:0];
      [v31 setTexture:v25 atIndex:1];
      [v31 setTexture:v32 atIndex:2];
      [v31 setTexture:v27 atIndex:3];
      [v31 setTexture:v28 atIndex:4];
      [v31 setTexture:v29 atIndex:5];
      [v31 setBytes:&v53 length:16 atIndex:0];
      [v31 setBytes:&v48 length:8 atIndex:1];
      [v31 setBytes:&v54 length:16 atIndex:2];
      [v31 setBytes:&v52 length:16 atIndex:3];
      [v31 setBytes:&v51 length:4 atIndex:4];
      [v31 setBytes:&v50 length:4 atIndex:5];
      [v31 setBytes:&v49 length:4 atIndex:6];
      unint64_t v36 = (unint64_t)[(MTLComputePipelineState *)self->_convertYUVtoNormSensorSpaceThumbnailPipelineState threadExecutionWidth];
      id v37 = v27;
      id v38 = v25;
      unint64_t v39 = (unint64_t)[(MTLComputePipelineState *)self->_convertYUVtoNormSensorSpaceThumbnailPipelineState maxTotalThreadsPerThreadgroup]/ v36;
      v47[0] = [v29 width];
      v47[1] = [v29 height];
      v47[2] = 1;
      v46[0] = v36;
      v46[1] = v39;
      id v25 = v38;
      id v27 = v37;
      v46[2] = 1;
      id v24 = v33;
      id v26 = v32;
      [v31 dispatchThreads:v47 threadsPerThreadgroup:v46];
      [v31 endEncoding];

      int v40 = 0;
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      int v40 = 10;
    }
    id v23 = v45;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v40 = 10;
  }

  return v40;
}

- (int)calculateScaledLSCGainsAndStrobeBeamProfile:(id)a3 ambientLSCGainsTexture:(id)a4 flashLSCGainsTexture:(id)a5 cropRect:(CMIColourConstancyCropRect)a6 LSCCropRect:(CMIColourConstancyLSCCropRect *)a7 fullSizeDimensions:(float)a8 ambientLSCMaxGain:(float)a9 flashLSCMaxGain:(id)a10 outputAmbientScaledLSCGainsRGBTexture:(id)a11 outputFlashScaledLSCGainsRGBTexture:(id)a12 outputStrobeBeamProfileGainRTexture:
{
  CMIColourConstancyLSCCropRect v14 = *a7;
  int v12 = -[CMIColourConstancySensorSpaceConversionV1 _encodeScaledLSCGainsAndStrobeBeamProfileCalculate:ambientLSCGainsTexture:flashLSCGainsTexture:cropRect:LSCCropRect:fullSizeDimensions:ambientLSCMaxGain:flashLSCMaxGain:outputAmbientScaledLSCGainsRGBTexture:outputFlashScaledLSCGainsRGBTexture:outputStrobeBeamProfileGainRTexture:](self, "_encodeScaledLSCGainsAndStrobeBeamProfileCalculate:ambientLSCGainsTexture:flashLSCGainsTexture:cropRect:LSCCropRect:fullSizeDimensions:ambientLSCMaxGain:flashLSCMaxGain:outputAmbientScaledLSCGainsRGBTexture:outputFlashScaledLSCGainsRGBTexture:outputStrobeBeamProfileGainRTexture:", a3, a4, a5, *(void *)&a6.var0, *(void *)&a6.var2, &v14, a10, a11, a12);
  if (v12)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  return v12;
}

- (id)convertYUVtoRegisteredNormSensorSpaceThumbnail:(double)a3 inputLumaTexture:(double)a4 inputChromaTexture:(double)a5 appliedScaledLSCGainsRGBTexture:(double)a6 baseScaledLSCGainsRGBTexture:(float)a7 yuvOffsets:(uint64_t)a8 cropRect:(void *)a9 registrationHomography:(void *)a10 appliedWhitePoint:(void *)a11 integrationTimeScale:(void *)a12 outputWarpedSensorThumbnailRGBATexture:(void *)a13
{
  id v24 = a1[2];
  id v25 = a17;
  id v26 = a13;
  id v27 = a12;
  id v28 = a11;
  id v29 = a10;
  id v30 = a9;
  [v24 clippedConfidenceLikelihoodScale];
  int v32 = v31;
  [a1[2] clippedConfidenceLikelihoodExponent];
  LODWORD(v34) = v33;
  *(float *)&double v35 = a7;
  LODWORD(v36) = v32;
  id v37 = objc_msgSend(a1, "_encodeYUVtoRegisteredNormSensorSpaceThumbnail:inputLumaTexture:inputChromaTexture:appliedScaledLSCGainsRGBTexture:baseScaledLSCGainsRGBTexture:yuvOffsets:cropRect:registrationHomography:appliedWhitePoint:integrationTimeScale:clippedLikelihoodScale:clippedLikelihoodExponent:outputWarpedSensorThumbnailRGBATexture:", v30, v29, v28, v27, v26, a2, a3, a4, a5, a6, v35, v36, v34, a15, a16,
          v25);

  if (v37)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  return v37;
}

- (int)convertYUVtoNormSensorSpaceThumbnail:(CMIColourConstancySensorSpaceConversionV1 *)self inputLumaTexture:(SEL)a2 inputChromaTexture:(id)a3 appliedScaledLSCGainsRGBTexture:(id)a4 baseScaledLSCGainsRGBTexture:(id)a5 yuvOffsets:(id)a6 cropRect:(id)a7 appliedWhitePoint:(CMIColourConstancyCropRect)a8 integrationTimeScale:(float)a9 outputBalancedThumbnailRGBATexture:(id)a10 outputSensorThumbnailRGBATexture:(id)a11
{
  int v17 = v12;
  double v36 = *(double *)&a9;
  double v37 = v11;
  config = self->_config;
  id v21 = a11;
  id v22 = a10;
  id v23 = a7;
  id v24 = a6;
  id v25 = a5;
  id v26 = a4;
  id v27 = a3;
  [(CMIColourConstancySensorSpaceConversionConfigurationV1 *)config clippedConfidenceLikelihoodScale];
  int v29 = v28;
  [(CMIColourConstancySensorSpaceConversionConfigurationV1 *)self->_config clippedConfidenceLikelihoodExponent];
  LODWORD(v31) = v30;
  LODWORD(v32) = v17;
  LODWORD(v33) = v29;
  int v34 = -[CMIColourConstancySensorSpaceConversionV1 _encodeYUVtoNormSensorSpaceThumbnail:inputLumaTexture:inputChromaTexture:appliedScaledLSCGainsRGBTexture:baseScaledLSCGainsRGBTexture:yuvOffsets:cropRect:appliedWhitePoint:integrationTimeScale:clippedLikelihoodScale:clippedLikelihoodExponent:outputBalancedThumbnailRGBATexture:outputSensorThumbnailRGBATexture:](self, "_encodeYUVtoNormSensorSpaceThumbnail:inputLumaTexture:inputChromaTexture:appliedScaledLSCGainsRGBTexture:baseScaledLSCGainsRGBTexture:yuvOffsets:cropRect:appliedWhitePoint:integrationTimeScale:clippedLikelihoodScale:clippedLikelihoodExponent:outputBalancedThumbnailRGBATexture:outputSensorThumbnailRGBATexture:", v27, v26, v25, v24, v23, v36, v37, v32, v33, v31, *(void *)&a8.var0, *(void *)&a8.var2, v22, v21);

  if (v34)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  return v34;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_convertYUVtoNormSensorSpaceThumbnailPipelineState, 0);
  objc_storeStrong((id *)&self->_convertYUVtoRegisteredNormSensorSpaceThumbnailPipelineState, 0);
  objc_storeStrong((id *)&self->_calculateScaledLSCGainsAndStrobeBeamProfilePipelineState, 0);
  objc_storeStrong((id *)&self->_config, 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end