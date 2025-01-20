@interface CMIColourConstancyConfidenceConfigurationV1
- (CMIColourConstancyConfidenceConfigurationV1)init;
- (float)centerWeightingGaussianSigmaScale;
- (float)centerWeightingSigmaToFilterScale;
- (float)strobeIlluminationOneThreshold;
- (float)strobeIlluminationZeroThreshold;
- (float)styleTransferAccuracyGammaCorrection;
- (float)styleTransferAccuracyOneThreshold;
- (float)styleTransferAccuracyZeroThreshold;
- (unsigned)thumbnailConfidenceMapHeight;
- (unsigned)thumbnailConfidenceMapWidth;
- (void)setCenterWeightingGaussianSigmaScale:(float)a3;
- (void)setCenterWeightingSigmaToFilterScale:(float)a3;
- (void)setStrobeIlluminationOneThreshold:(float)a3;
- (void)setStrobeIlluminationZeroThreshold:(float)a3;
- (void)setStyleTransferAccuracyGammaCorrection:(float)a3;
- (void)setStyleTransferAccuracyOneThreshold:(float)a3;
- (void)setStyleTransferAccuracyZeroThreshold:(float)a3;
- (void)setThumbnailConfidenceMapHeight:(unsigned int)a3;
- (void)setThumbnailConfidenceMapWidth:(unsigned int)a3;
@end

@implementation CMIColourConstancyConfidenceConfigurationV1

- (CMIColourConstancyConfidenceConfigurationV1)init
{
  v3.receiver = self;
  v3.super_class = (Class)CMIColourConstancyConfidenceConfigurationV1;
  result = [(CMIColourConstancyConfidenceConfigurationV1 *)&v3 init];
  if (result)
  {
    *(_OWORD *)&result->_strobeIlluminationZeroThreshold = xmmword_21A10;
    result->_styleTransferAccuracyGammaCorrection = 0.45455;
    *(void *)&result->_thumbnailConfidenceMapWidth = 0x1800000020;
    *(void *)&result->_centerWeightingGaussianSigmaScale = 0x406000003FC00000;
  }
  return result;
}

- (float)strobeIlluminationZeroThreshold
{
  return self->_strobeIlluminationZeroThreshold;
}

- (void)setStrobeIlluminationZeroThreshold:(float)a3
{
  self->_strobeIlluminationZeroThreshold = a3;
}

- (float)strobeIlluminationOneThreshold
{
  return self->_strobeIlluminationOneThreshold;
}

- (void)setStrobeIlluminationOneThreshold:(float)a3
{
  self->_strobeIlluminationOneThreshold = a3;
}

- (float)styleTransferAccuracyZeroThreshold
{
  return self->_styleTransferAccuracyZeroThreshold;
}

- (void)setStyleTransferAccuracyZeroThreshold:(float)a3
{
  self->_styleTransferAccuracyZeroThreshold = a3;
}

- (float)styleTransferAccuracyOneThreshold
{
  return self->_styleTransferAccuracyOneThreshold;
}

- (void)setStyleTransferAccuracyOneThreshold:(float)a3
{
  self->_styleTransferAccuracyOneThreshold = a3;
}

- (float)styleTransferAccuracyGammaCorrection
{
  return self->_styleTransferAccuracyGammaCorrection;
}

- (void)setStyleTransferAccuracyGammaCorrection:(float)a3
{
  self->_styleTransferAccuracyGammaCorrection = a3;
}

- (unsigned)thumbnailConfidenceMapWidth
{
  return self->_thumbnailConfidenceMapWidth;
}

- (void)setThumbnailConfidenceMapWidth:(unsigned int)a3
{
  self->_thumbnailConfidenceMapWidth = a3;
}

- (unsigned)thumbnailConfidenceMapHeight
{
  return self->_thumbnailConfidenceMapHeight;
}

- (void)setThumbnailConfidenceMapHeight:(unsigned int)a3
{
  self->_thumbnailConfidenceMapHeight = a3;
}

- (float)centerWeightingGaussianSigmaScale
{
  return self->_centerWeightingGaussianSigmaScale;
}

- (void)setCenterWeightingGaussianSigmaScale:(float)a3
{
  self->_centerWeightingGaussianSigmaScale = a3;
}

- (float)centerWeightingSigmaToFilterScale
{
  return self->_centerWeightingSigmaToFilterScale;
}

- (void)setCenterWeightingSigmaToFilterScale:(float)a3
{
  self->_centerWeightingSigmaToFilterScale = a3;
}

@end