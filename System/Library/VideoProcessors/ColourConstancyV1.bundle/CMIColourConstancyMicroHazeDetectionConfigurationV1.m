@interface CMIColourConstancyMicroHazeDetectionConfigurationV1
- (CMIColourConstancyMicroHazeDetectionConfigurationV1)initWithFusionMapWidth:(int)a3 fusionMapHeight:(int)a4;
- (float)ambientQualityMaxGain;
- (float)ambientQualityMinGain;
- (float)ambientQualityOneThreshold;
- (float)ambientQualityZeroThreshold;
- (float)bandingGaussianSigmaScale;
- (float)bandingMinWeight;
- (float)filterToSigmaScale;
- (float)fusionDiffuseGaussianSigma;
- (float)fusionDiffuseSigmaToHalfFilterScale;
- (float)gridRegionScale;
- (float)maskFusionGain;
- (float)maskFusionMixFactor;
- (float)positiveIntensityMaskResponseBias;
- (float)positiveIntensityMaskResponseExponent;
- (float)positiveIntensityMaskResponseGain;
- (float)shadowEdgesResponseExponent;
- (float)shadowEdgesResponseGain;
- (float)spatialGaussianSigmaScale;
- (float)strongGradientsMaskResponseBias;
- (float)strongGradientsMaskResponseExponent;
- (float)strongGradientsMaskResponseGain;
- (int)fusionMapHeight;
- (int)fusionMapWidth;
- (int)gainMapHeight;
- (int)gainMapWidth;
- (int)gridBands;
- (int)gridHeight;
- (int)gridWidth;
- (void)setAmbientQualityMaxGain:(float)a3;
- (void)setAmbientQualityMinGain:(float)a3;
- (void)setAmbientQualityOneThreshold:(float)a3;
- (void)setAmbientQualityZeroThreshold:(float)a3;
- (void)setBandingGaussianSigmaScale:(float)a3;
- (void)setBandingMinWeight:(float)a3;
- (void)setFilterToSigmaScale:(float)a3;
- (void)setFusionDiffuseGaussianSigma:(float)a3;
- (void)setFusionDiffuseSigmaToHalfFilterScale:(float)a3;
- (void)setFusionMapHeight:(int)a3;
- (void)setFusionMapWidth:(int)a3;
- (void)setGainMapHeight:(int)a3;
- (void)setGainMapWidth:(int)a3;
- (void)setGridBands:(int)a3;
- (void)setGridHeight:(int)a3;
- (void)setGridRegionScale:(float)a3;
- (void)setGridWidth:(int)a3;
- (void)setMaskFusionGain:(float)a3;
- (void)setMaskFusionMixFactor:(float)a3;
- (void)setPositiveIntensityMaskResponseBias:(float)a3;
- (void)setPositiveIntensityMaskResponseExponent:(float)a3;
- (void)setPositiveIntensityMaskResponseGain:(float)a3;
- (void)setShadowEdgesResponseExponent:(float)a3;
- (void)setShadowEdgesResponseGain:(float)a3;
- (void)setSpatialGaussianSigmaScale:(float)a3;
- (void)setStrongGradientsMaskResponseBias:(float)a3;
- (void)setStrongGradientsMaskResponseExponent:(float)a3;
- (void)setStrongGradientsMaskResponseGain:(float)a3;
@end

@implementation CMIColourConstancyMicroHazeDetectionConfigurationV1

- (CMIColourConstancyMicroHazeDetectionConfigurationV1)initWithFusionMapWidth:(int)a3 fusionMapHeight:(int)a4
{
  v10.receiver = self;
  v10.super_class = (Class)CMIColourConstancyMicroHazeDetectionConfigurationV1;
  v6 = [(CMIColourConstancyMicroHazeDetectionConfigurationV1 *)&v10 init];
  v7 = (CMIColourConstancyMicroHazeDetectionConfigurationV1 *)v6;
  if (v6)
  {
    *((_DWORD *)v6 + 2) = a3;
    *((_DWORD *)v6 + 3) = a4;
    *((void *)v6 + 2) = 0xC00000010;
    *((void *)v6 + 3) = 0x4000000000000020;
    *((void *)v6 + 4) = 0x3000000040;
    *(_OWORD *)(v6 + 40) = xmmword_21A40;
    *(_OWORD *)(v6 + 56) = xmmword_21A50;
    *(_OWORD *)(v6 + 72) = xmmword_21A60;
    *(_OWORD *)(v6 + 88) = xmmword_21A70;
    *(_OWORD *)(v6 + 104) = xmmword_21A80;
    v8 = v6;
  }

  return v7;
}

- (int)fusionMapWidth
{
  return self->_fusionMapWidth;
}

- (void)setFusionMapWidth:(int)a3
{
  self->_fusionMapWidth = a3;
}

- (int)fusionMapHeight
{
  return self->_fusionMapHeight;
}

- (void)setFusionMapHeight:(int)a3
{
  self->_fusionMapHeight = a3;
}

- (int)gridWidth
{
  return self->_gridWidth;
}

- (void)setGridWidth:(int)a3
{
  self->_gridWidth = a3;
}

- (int)gridHeight
{
  return self->_gridHeight;
}

- (void)setGridHeight:(int)a3
{
  self->_gridHeight = a3;
}

- (int)gridBands
{
  return self->_gridBands;
}

- (void)setGridBands:(int)a3
{
  self->_gridBands = a3;
}

- (float)gridRegionScale
{
  return self->_gridRegionScale;
}

- (void)setGridRegionScale:(float)a3
{
  self->_gridRegionScale = a3;
}

- (int)gainMapWidth
{
  return self->_gainMapWidth;
}

- (void)setGainMapWidth:(int)a3
{
  self->_gainMapWidth = a3;
}

- (int)gainMapHeight
{
  return self->_gainMapHeight;
}

- (void)setGainMapHeight:(int)a3
{
  self->_gainMapHeight = a3;
}

- (float)bandingMinWeight
{
  return self->_bandingMinWeight;
}

- (void)setBandingMinWeight:(float)a3
{
  self->_bandingMinWeight = a3;
}

- (float)bandingGaussianSigmaScale
{
  return self->_bandingGaussianSigmaScale;
}

- (void)setBandingGaussianSigmaScale:(float)a3
{
  self->_bandingGaussianSigmaScale = a3;
}

- (float)filterToSigmaScale
{
  return self->_filterToSigmaScale;
}

- (void)setFilterToSigmaScale:(float)a3
{
  self->_filterToSigmaScale = a3;
}

- (float)spatialGaussianSigmaScale
{
  return self->_spatialGaussianSigmaScale;
}

- (void)setSpatialGaussianSigmaScale:(float)a3
{
  self->_spatialGaussianSigmaScale = a3;
}

- (float)strongGradientsMaskResponseGain
{
  return self->_strongGradientsMaskResponseGain;
}

- (void)setStrongGradientsMaskResponseGain:(float)a3
{
  self->_strongGradientsMaskResponseGain = a3;
}

- (float)strongGradientsMaskResponseBias
{
  return self->_strongGradientsMaskResponseBias;
}

- (void)setStrongGradientsMaskResponseBias:(float)a3
{
  self->_strongGradientsMaskResponseBias = a3;
}

- (float)strongGradientsMaskResponseExponent
{
  return self->_strongGradientsMaskResponseExponent;
}

- (void)setStrongGradientsMaskResponseExponent:(float)a3
{
  self->_strongGradientsMaskResponseExponent = a3;
}

- (float)positiveIntensityMaskResponseGain
{
  return self->_positiveIntensityMaskResponseGain;
}

- (void)setPositiveIntensityMaskResponseGain:(float)a3
{
  self->_positiveIntensityMaskResponseGain = a3;
}

- (float)positiveIntensityMaskResponseBias
{
  return self->_positiveIntensityMaskResponseBias;
}

- (void)setPositiveIntensityMaskResponseBias:(float)a3
{
  self->_positiveIntensityMaskResponseBias = a3;
}

- (float)positiveIntensityMaskResponseExponent
{
  return self->_positiveIntensityMaskResponseExponent;
}

- (void)setPositiveIntensityMaskResponseExponent:(float)a3
{
  self->_positiveIntensityMaskResponseExponent = a3;
}

- (float)maskFusionGain
{
  return self->_maskFusionGain;
}

- (void)setMaskFusionGain:(float)a3
{
  self->_maskFusionGain = a3;
}

- (float)maskFusionMixFactor
{
  return self->_maskFusionMixFactor;
}

- (void)setMaskFusionMixFactor:(float)a3
{
  self->_maskFusionMixFactor = a3;
}

- (float)ambientQualityMinGain
{
  return self->_ambientQualityMinGain;
}

- (void)setAmbientQualityMinGain:(float)a3
{
  self->_ambientQualityMinGain = a3;
}

- (float)ambientQualityMaxGain
{
  return self->_ambientQualityMaxGain;
}

- (void)setAmbientQualityMaxGain:(float)a3
{
  self->_ambientQualityMaxGain = a3;
}

- (float)ambientQualityZeroThreshold
{
  return self->_ambientQualityZeroThreshold;
}

- (void)setAmbientQualityZeroThreshold:(float)a3
{
  self->_ambientQualityZeroThreshold = a3;
}

- (float)ambientQualityOneThreshold
{
  return self->_ambientQualityOneThreshold;
}

- (void)setAmbientQualityOneThreshold:(float)a3
{
  self->_ambientQualityOneThreshold = a3;
}

- (float)shadowEdgesResponseGain
{
  return self->_shadowEdgesResponseGain;
}

- (void)setShadowEdgesResponseGain:(float)a3
{
  self->_shadowEdgesResponseGain = a3;
}

- (float)shadowEdgesResponseExponent
{
  return self->_shadowEdgesResponseExponent;
}

- (void)setShadowEdgesResponseExponent:(float)a3
{
  self->_shadowEdgesResponseExponent = a3;
}

- (float)fusionDiffuseGaussianSigma
{
  return self->_fusionDiffuseGaussianSigma;
}

- (void)setFusionDiffuseGaussianSigma:(float)a3
{
  self->_fusionDiffuseGaussianSigma = a3;
}

- (float)fusionDiffuseSigmaToHalfFilterScale
{
  return self->_fusionDiffuseSigmaToHalfFilterScale;
}

- (void)setFusionDiffuseSigmaToHalfFilterScale:(float)a3
{
  self->_fusionDiffuseSigmaToHalfFilterScale = a3;
}

@end