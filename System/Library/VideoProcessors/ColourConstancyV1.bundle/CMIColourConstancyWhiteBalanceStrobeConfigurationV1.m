@interface CMIColourConstancyWhiteBalanceStrobeConfigurationV1
- (BOOL)lowStrobeIlluminationFlashFusionEnabled;
- (CMIColourConstancyWhiteBalanceStrobeConfigurationV1)initWithThumbnailWidth:(unsigned int)a3 thumbnailHeight:(unsigned int)a4;
- (float)balanceMatchingGaussianSigma;
- (float)balanceMatchingMinimumConfidenceWeight;
- (float)balanceMatchingSigmaToFilterScale;
- (float)flashToStrobeIntensityFusionMixFactor;
- (unsigned)balanceMatchingThumbnailHeight;
- (unsigned)balanceMatchingThumbnailWidth;
- (unsigned)thumbnailHeight;
- (unsigned)thumbnailWidth;
- (void)setBalanceMatchingGaussianSigma:(float)a3;
- (void)setBalanceMatchingMinimumConfidenceWeight:(float)a3;
- (void)setBalanceMatchingSigmaToFilterScale:(float)a3;
- (void)setBalanceMatchingThumbnailHeight:(unsigned int)a3;
- (void)setBalanceMatchingThumbnailWidth:(unsigned int)a3;
- (void)setFlashToStrobeIntensityFusionMixFactor:(float)a3;
- (void)setLowStrobeIlluminationFlashFusionEnabled:(BOOL)a3;
- (void)setThumbnailHeight:(unsigned int)a3;
- (void)setThumbnailWidth:(unsigned int)a3;
@end

@implementation CMIColourConstancyWhiteBalanceStrobeConfigurationV1

- (CMIColourConstancyWhiteBalanceStrobeConfigurationV1)initWithThumbnailWidth:(unsigned int)a3 thumbnailHeight:(unsigned int)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CMIColourConstancyWhiteBalanceStrobeConfigurationV1;
  result = [(CMIColourConstancyWhiteBalanceStrobeConfigurationV1 *)&v7 init];
  if (result)
  {
    result->_thumbnailWidth = a3;
    result->_thumbnailHeight = a4;
    result->_lowStrobeIlluminationFlashFusionEnabled = 1;
    result->_balanceMatchingMinimumConfidenceWeight = 0.0001;
    *(void *)&result->_balanceMatchingThumbnailWidth = 0x1800000020;
    *(void *)&result->_balanceMatchingGaussianSigma = 0x40C0000040800000;
    result->_flashToStrobeIntensityFusionMixFactor = 0.7;
  }
  return result;
}

- (unsigned)thumbnailWidth
{
  return self->_thumbnailWidth;
}

- (void)setThumbnailWidth:(unsigned int)a3
{
  self->_thumbnailWidth = a3;
}

- (unsigned)thumbnailHeight
{
  return self->_thumbnailHeight;
}

- (void)setThumbnailHeight:(unsigned int)a3
{
  self->_thumbnailHeight = a3;
}

- (BOOL)lowStrobeIlluminationFlashFusionEnabled
{
  return self->_lowStrobeIlluminationFlashFusionEnabled;
}

- (void)setLowStrobeIlluminationFlashFusionEnabled:(BOOL)a3
{
  self->_lowStrobeIlluminationFlashFusionEnabled = a3;
}

- (float)balanceMatchingMinimumConfidenceWeight
{
  return self->_balanceMatchingMinimumConfidenceWeight;
}

- (void)setBalanceMatchingMinimumConfidenceWeight:(float)a3
{
  self->_balanceMatchingMinimumConfidenceWeight = a3;
}

- (unsigned)balanceMatchingThumbnailWidth
{
  return self->_balanceMatchingThumbnailWidth;
}

- (void)setBalanceMatchingThumbnailWidth:(unsigned int)a3
{
  self->_balanceMatchingThumbnailWidth = a3;
}

- (unsigned)balanceMatchingThumbnailHeight
{
  return self->_balanceMatchingThumbnailHeight;
}

- (void)setBalanceMatchingThumbnailHeight:(unsigned int)a3
{
  self->_balanceMatchingThumbnailHeight = a3;
}

- (float)balanceMatchingGaussianSigma
{
  return self->_balanceMatchingGaussianSigma;
}

- (void)setBalanceMatchingGaussianSigma:(float)a3
{
  self->_balanceMatchingGaussianSigma = a3;
}

- (float)balanceMatchingSigmaToFilterScale
{
  return self->_balanceMatchingSigmaToFilterScale;
}

- (void)setBalanceMatchingSigmaToFilterScale:(float)a3
{
  self->_balanceMatchingSigmaToFilterScale = a3;
}

- (float)flashToStrobeIntensityFusionMixFactor
{
  return self->_flashToStrobeIntensityFusionMixFactor;
}

- (void)setFlashToStrobeIntensityFusionMixFactor:(float)a3
{
  self->_flashToStrobeIntensityFusionMixFactor = a3;
}

@end