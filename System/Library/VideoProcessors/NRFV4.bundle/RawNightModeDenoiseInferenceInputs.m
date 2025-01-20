@interface RawNightModeDenoiseInferenceInputs
- (BOOL)isQuadra;
- (MTLTexture)inputRGBTexture;
- (MTLTexture)lscGainsTexture;
- (MTLTexture)noiseMapTexture;
- (NSDictionary)cameraInfoByPortType;
- (NSDictionary)lscGainMapParameters;
- (NSDictionary)metadata;
- (RawNightModeBiasCorrectionParams)biasCorrectionParams;
- (RawNightModePostNetworkTuningParams)postNetworkTuningParams;
- (RawNightModeSemanticMasks)semanticMasks;
- (float)aeTargetGain;
- (int)firstPix;
- (void)setAeTargetGain:(float)a3;
- (void)setBiasCorrectionParams:(RawNightModeBiasCorrectionParams *)a3;
- (void)setCameraInfoByPortType:(id)a3;
- (void)setFirstPix:(int)a3;
- (void)setInputRGBTexture:(id)a3;
- (void)setIsQuadra:(BOOL)a3;
- (void)setLscGainMapParameters:(id)a3;
- (void)setLscGainsTexture:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setNoiseMapTexture:(id)a3;
- (void)setPostNetworkTuningParams:(id)a3;
- (void)setSemanticMasks:(id)a3;
@end

@implementation RawNightModeDenoiseInferenceInputs

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (NSDictionary)cameraInfoByPortType
{
  return self->_cameraInfoByPortType;
}

- (void)setCameraInfoByPortType:(id)a3
{
}

- (MTLTexture)inputRGBTexture
{
  return self->_inputRGBTexture;
}

- (void)setInputRGBTexture:(id)a3
{
}

- (MTLTexture)noiseMapTexture
{
  return self->_noiseMapTexture;
}

- (void)setNoiseMapTexture:(id)a3
{
}

- (float)aeTargetGain
{
  return self->_aeTargetGain;
}

- (void)setAeTargetGain:(float)a3
{
  self->_aeTargetGain = a3;
}

- (MTLTexture)lscGainsTexture
{
  return self->_lscGainsTexture;
}

- (void)setLscGainsTexture:(id)a3
{
}

- (NSDictionary)lscGainMapParameters
{
  return self->_lscGainMapParameters;
}

- (void)setLscGainMapParameters:(id)a3
{
}

- (int)firstPix
{
  return self->_firstPix;
}

- (void)setFirstPix:(int)a3
{
  self->_firstPix = a3;
}

- (BOOL)isQuadra
{
  return self->_isQuadra;
}

- (void)setIsQuadra:(BOOL)a3
{
  self->_isQuadra = a3;
}

- (RawNightModeSemanticMasks)semanticMasks
{
  return self->_semanticMasks;
}

- (void)setSemanticMasks:(id)a3
{
}

- (RawNightModeBiasCorrectionParams)biasCorrectionParams
{
  *retstr = *(RawNightModeBiasCorrectionParams *)((char *)self + 88);
  return self;
}

- (void)setBiasCorrectionParams:(RawNightModeBiasCorrectionParams *)a3
{
  long long v3 = *(_OWORD *)&a3->enableDNRBiasCorrection;
  self->_biasCorrectionParams.guidedFilterIntensitySigma = a3->guidedFilterIntensitySigma;
  *(_OWORD *)&self->_biasCorrectionParams.enableDNRBiasCorrection = v3;
}

- (RawNightModePostNetworkTuningParams)postNetworkTuningParams
{
  return self->_postNetworkTuningParams;
}

- (void)setPostNetworkTuningParams:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postNetworkTuningParams, 0);
  objc_storeStrong((id *)&self->_semanticMasks, 0);
  objc_storeStrong((id *)&self->_lscGainMapParameters, 0);
  objc_storeStrong((id *)&self->_lscGainsTexture, 0);
  objc_storeStrong((id *)&self->_noiseMapTexture, 0);
  objc_storeStrong((id *)&self->_inputRGBTexture, 0);
  objc_storeStrong((id *)&self->_cameraInfoByPortType, 0);

  objc_storeStrong((id *)&self->_metadata, 0);
}

@end