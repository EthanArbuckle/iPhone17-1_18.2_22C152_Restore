@interface CMISoftwareFlashRenderingWhiteBalanceAmbientV2Configuration
- (BOOL)spatialWhiteBalancingEnabled;
- (CMISoftwareFlashRenderingWhiteBalanceAmbientV2Configuration)initWithSpatialWhitePointsGridWidth:(unsigned int)a3 spatialWhitePointsGridHeight:(unsigned int)a4;
- (float)coarseWhitePointsGaussianSigma;
- (float)coarseWhitePointsSigmaToFilterScale;
- (float)fusionAmbientWhitePointLikelihood;
- (float)fusionCoarseSpatialWhitePointLikelihood;
- (float)fusionSpatialWhitePointCorrectionStrength;
- (float)fusionSpatialWhitePointLikelihood;
- (float)spatialWhitePointsAmbientSaturationOneThreshold;
- (float)spatialWhitePointsAmbientSaturationZeroThreshold;
- (float)spatialWhitePointsAmbientShadowOneThreshold;
- (float)spatialWhitePointsAmbientShadowZeroThreshold;
- (float)spatialWhitePointsStrobeAmbientMinRatioOneThreshold;
- (float)spatialWhitePointsStrobeAmbientMinRatioZeroThreshold;
- (float)spatialWhitePointsStrobeSaturationOneThreshold;
- (float)spatialWhitePointsStrobeSaturationZeroThreshold;
- (unsigned)coarseWhitePointsSpatialGridHeight;
- (unsigned)coarseWhitePointsSpatialGridWidth;
- (unsigned)spatialWhitePointsGridHeight;
- (unsigned)spatialWhitePointsGridWidth;
- (void)setCoarseWhitePointsGaussianSigma:(float)a3;
- (void)setCoarseWhitePointsSigmaToFilterScale:(float)a3;
- (void)setCoarseWhitePointsSpatialGridHeight:(unsigned int)a3;
- (void)setCoarseWhitePointsSpatialGridWidth:(unsigned int)a3;
- (void)setFusionAmbientWhitePointLikelihood:(float)a3;
- (void)setFusionCoarseSpatialWhitePointLikelihood:(float)a3;
- (void)setFusionSpatialWhitePointCorrectionStrength:(float)a3;
- (void)setFusionSpatialWhitePointLikelihood:(float)a3;
- (void)setSpatialWhiteBalancingEnabled:(BOOL)a3;
- (void)setSpatialWhitePointsAmbientSaturationOneThreshold:(float)a3;
- (void)setSpatialWhitePointsAmbientSaturationZeroThreshold:(float)a3;
- (void)setSpatialWhitePointsAmbientShadowOneThreshold:(float)a3;
- (void)setSpatialWhitePointsAmbientShadowZeroThreshold:(float)a3;
- (void)setSpatialWhitePointsGridHeight:(unsigned int)a3;
- (void)setSpatialWhitePointsGridWidth:(unsigned int)a3;
- (void)setSpatialWhitePointsStrobeAmbientMinRatioOneThreshold:(float)a3;
- (void)setSpatialWhitePointsStrobeAmbientMinRatioZeroThreshold:(float)a3;
- (void)setSpatialWhitePointsStrobeSaturationOneThreshold:(float)a3;
- (void)setSpatialWhitePointsStrobeSaturationZeroThreshold:(float)a3;
@end

@implementation CMISoftwareFlashRenderingWhiteBalanceAmbientV2Configuration

- (CMISoftwareFlashRenderingWhiteBalanceAmbientV2Configuration)initWithSpatialWhitePointsGridWidth:(unsigned int)a3 spatialWhitePointsGridHeight:(unsigned int)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CMISoftwareFlashRenderingWhiteBalanceAmbientV2Configuration;
  result = [(CMISoftwareFlashRenderingWhiteBalanceAmbientV2Configuration *)&v7 init];
  if (result)
  {
    result->_spatialWhiteBalancingEnabled = 1;
    result->_spatialWhitePointsGridWidth = a3;
    result->_spatialWhitePointsGridHeight = a4;
    *(_OWORD *)&result->_spatialWhitePointsAmbientShadowZeroThreshold = xmmword_26337FE90;
    *(_OWORD *)&result->_spatialWhitePointsStrobeSaturationZeroThreshold = xmmword_26337FEA0;
    *(void *)&result->_coarseWhitePointsSpatialGridWidth = 0x3000000040;
    *(_OWORD *)&result->_coarseWhitePointsGaussianSigma = xmmword_26337FEB0;
    *(void *)&result->_fusionAmbientWhitePointLikelihood = 0x3F0000003D4CCCCDLL;
  }
  return result;
}

- (BOOL)spatialWhiteBalancingEnabled
{
  return self->_spatialWhiteBalancingEnabled;
}

- (void)setSpatialWhiteBalancingEnabled:(BOOL)a3
{
  self->_spatialWhiteBalancingEnabled = a3;
}

- (unsigned)spatialWhitePointsGridWidth
{
  return self->_spatialWhitePointsGridWidth;
}

- (void)setSpatialWhitePointsGridWidth:(unsigned int)a3
{
  self->_spatialWhitePointsGridWidth = a3;
}

- (unsigned)spatialWhitePointsGridHeight
{
  return self->_spatialWhitePointsGridHeight;
}

- (void)setSpatialWhitePointsGridHeight:(unsigned int)a3
{
  self->_spatialWhitePointsGridHeight = a3;
}

- (float)spatialWhitePointsAmbientShadowZeroThreshold
{
  return self->_spatialWhitePointsAmbientShadowZeroThreshold;
}

- (void)setSpatialWhitePointsAmbientShadowZeroThreshold:(float)a3
{
  self->_spatialWhitePointsAmbientShadowZeroThreshold = a3;
}

- (float)spatialWhitePointsAmbientShadowOneThreshold
{
  return self->_spatialWhitePointsAmbientShadowOneThreshold;
}

- (void)setSpatialWhitePointsAmbientShadowOneThreshold:(float)a3
{
  self->_spatialWhitePointsAmbientShadowOneThreshold = a3;
}

- (float)spatialWhitePointsAmbientSaturationZeroThreshold
{
  return self->_spatialWhitePointsAmbientSaturationZeroThreshold;
}

- (void)setSpatialWhitePointsAmbientSaturationZeroThreshold:(float)a3
{
  self->_spatialWhitePointsAmbientSaturationZeroThreshold = a3;
}

- (float)spatialWhitePointsAmbientSaturationOneThreshold
{
  return self->_spatialWhitePointsAmbientSaturationOneThreshold;
}

- (void)setSpatialWhitePointsAmbientSaturationOneThreshold:(float)a3
{
  self->_spatialWhitePointsAmbientSaturationOneThreshold = a3;
}

- (float)spatialWhitePointsStrobeSaturationZeroThreshold
{
  return self->_spatialWhitePointsStrobeSaturationZeroThreshold;
}

- (void)setSpatialWhitePointsStrobeSaturationZeroThreshold:(float)a3
{
  self->_spatialWhitePointsStrobeSaturationZeroThreshold = a3;
}

- (float)spatialWhitePointsStrobeSaturationOneThreshold
{
  return self->_spatialWhitePointsStrobeSaturationOneThreshold;
}

- (void)setSpatialWhitePointsStrobeSaturationOneThreshold:(float)a3
{
  self->_spatialWhitePointsStrobeSaturationOneThreshold = a3;
}

- (float)spatialWhitePointsStrobeAmbientMinRatioZeroThreshold
{
  return self->_spatialWhitePointsStrobeAmbientMinRatioZeroThreshold;
}

- (void)setSpatialWhitePointsStrobeAmbientMinRatioZeroThreshold:(float)a3
{
  self->_spatialWhitePointsStrobeAmbientMinRatioZeroThreshold = a3;
}

- (float)spatialWhitePointsStrobeAmbientMinRatioOneThreshold
{
  return self->_spatialWhitePointsStrobeAmbientMinRatioOneThreshold;
}

- (void)setSpatialWhitePointsStrobeAmbientMinRatioOneThreshold:(float)a3
{
  self->_spatialWhitePointsStrobeAmbientMinRatioOneThreshold = a3;
}

- (unsigned)coarseWhitePointsSpatialGridWidth
{
  return self->_coarseWhitePointsSpatialGridWidth;
}

- (void)setCoarseWhitePointsSpatialGridWidth:(unsigned int)a3
{
  self->_coarseWhitePointsSpatialGridWidth = a3;
}

- (unsigned)coarseWhitePointsSpatialGridHeight
{
  return self->_coarseWhitePointsSpatialGridHeight;
}

- (void)setCoarseWhitePointsSpatialGridHeight:(unsigned int)a3
{
  self->_coarseWhitePointsSpatialGridHeight = a3;
}

- (float)coarseWhitePointsGaussianSigma
{
  return self->_coarseWhitePointsGaussianSigma;
}

- (void)setCoarseWhitePointsGaussianSigma:(float)a3
{
  self->_coarseWhitePointsGaussianSigma = a3;
}

- (float)coarseWhitePointsSigmaToFilterScale
{
  return self->_coarseWhitePointsSigmaToFilterScale;
}

- (void)setCoarseWhitePointsSigmaToFilterScale:(float)a3
{
  self->_coarseWhitePointsSigmaToFilterScale = a3;
}

- (float)fusionSpatialWhitePointLikelihood
{
  return self->_fusionSpatialWhitePointLikelihood;
}

- (void)setFusionSpatialWhitePointLikelihood:(float)a3
{
  self->_fusionSpatialWhitePointLikelihood = a3;
}

- (float)fusionCoarseSpatialWhitePointLikelihood
{
  return self->_fusionCoarseSpatialWhitePointLikelihood;
}

- (void)setFusionCoarseSpatialWhitePointLikelihood:(float)a3
{
  self->_fusionCoarseSpatialWhitePointLikelihood = a3;
}

- (float)fusionAmbientWhitePointLikelihood
{
  return self->_fusionAmbientWhitePointLikelihood;
}

- (void)setFusionAmbientWhitePointLikelihood:(float)a3
{
  self->_fusionAmbientWhitePointLikelihood = a3;
}

- (float)fusionSpatialWhitePointCorrectionStrength
{
  return self->_fusionSpatialWhitePointCorrectionStrength;
}

- (void)setFusionSpatialWhitePointCorrectionStrength:(float)a3
{
  self->_fusionSpatialWhitePointCorrectionStrength = a3;
}

@end