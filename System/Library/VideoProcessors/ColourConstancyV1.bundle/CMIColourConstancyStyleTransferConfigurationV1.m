@interface CMIColourConstancyStyleTransferConfigurationV1
- (BOOL)clippingCorrectionEnabled;
- (BOOL)globalRGBToneCurveEnabled;
- (BOOL)speedModeStyleTransferEnabled;
- (CMIColourConstancyStyleTransferConfigurationV1)initWithSourceThumbnailWidth:(unsigned int)a3;
- (float)clippingCorrectionTransitionExponent;
- (float)clippingCorrectionTransitionGain;
- (float)colourSaturationBoostGain;
- (float)gammaCorrection;
- (float)globalRGBToneCurveBrightnessBoostFactor;
- (float)styleTransferGammaCorrection;
- (float)styleTransferThumbnailSharpness;
- (float)styleTransferThumbnailSigmaToFilterScale;
- (unsigned)sourceThumbnailWidth;
- (unsigned)styleTransferThumbnailHeight;
- (unsigned)styleTransferThumbnailWidth;
- (void)setClippingCorrectionEnabled:(BOOL)a3;
- (void)setClippingCorrectionTransitionExponent:(float)a3;
- (void)setClippingCorrectionTransitionGain:(float)a3;
- (void)setColourSaturationBoostGain:(float)a3;
- (void)setGammaCorrection:(float)a3;
- (void)setGlobalRGBToneCurveBrightnessBoostFactor:(float)a3;
- (void)setGlobalRGBToneCurveEnabled:(BOOL)a3;
- (void)setSourceThumbnailWidth:(unsigned int)a3;
- (void)setSpeedModeStyleTransferEnabled:(BOOL)a3;
- (void)setStyleTransferGammaCorrection:(float)a3;
- (void)setStyleTransferThumbnailHeight:(unsigned int)a3;
- (void)setStyleTransferThumbnailSharpness:(float)a3;
- (void)setStyleTransferThumbnailSigmaToFilterScale:(float)a3;
- (void)setStyleTransferThumbnailWidth:(unsigned int)a3;
@end

@implementation CMIColourConstancyStyleTransferConfigurationV1

- (CMIColourConstancyStyleTransferConfigurationV1)initWithSourceThumbnailWidth:(unsigned int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CMIColourConstancyStyleTransferConfigurationV1;
  result = [(CMIColourConstancyStyleTransferConfigurationV1 *)&v5 init];
  if (result)
  {
    *(_WORD *)&result->_speedModeStyleTransferEnabled = 256;
    result->_sourceThumbnailWidth = a3;
    *(void *)&result->_styleTransferThumbnailWidth = 0xC000000100;
    *(_OWORD *)&result->_styleTransferThumbnailSharpness = xmmword_219E0;
    result->_globalRGBToneCurveEnabled = 0;
    *(_OWORD *)&result->_clippingCorrectionTransitionExponent = xmmword_219F0;
  }
  return result;
}

- (BOOL)speedModeStyleTransferEnabled
{
  return self->_speedModeStyleTransferEnabled;
}

- (void)setSpeedModeStyleTransferEnabled:(BOOL)a3
{
  self->_speedModeStyleTransferEnabled = a3;
}

- (unsigned)sourceThumbnailWidth
{
  return self->_sourceThumbnailWidth;
}

- (void)setSourceThumbnailWidth:(unsigned int)a3
{
  self->_sourceThumbnailWidth = a3;
}

- (unsigned)styleTransferThumbnailWidth
{
  return self->_styleTransferThumbnailWidth;
}

- (void)setStyleTransferThumbnailWidth:(unsigned int)a3
{
  self->_styleTransferThumbnailWidth = a3;
}

- (unsigned)styleTransferThumbnailHeight
{
  return self->_styleTransferThumbnailHeight;
}

- (void)setStyleTransferThumbnailHeight:(unsigned int)a3
{
  self->_styleTransferThumbnailHeight = a3;
}

- (float)styleTransferThumbnailSharpness
{
  return self->_styleTransferThumbnailSharpness;
}

- (void)setStyleTransferThumbnailSharpness:(float)a3
{
  self->_styleTransferThumbnailSharpness = a3;
}

- (float)styleTransferThumbnailSigmaToFilterScale
{
  return self->_styleTransferThumbnailSigmaToFilterScale;
}

- (void)setStyleTransferThumbnailSigmaToFilterScale:(float)a3
{
  self->_styleTransferThumbnailSigmaToFilterScale = a3;
}

- (float)styleTransferGammaCorrection
{
  return self->_styleTransferGammaCorrection;
}

- (void)setStyleTransferGammaCorrection:(float)a3
{
  self->_styleTransferGammaCorrection = a3;
}

- (BOOL)clippingCorrectionEnabled
{
  return self->_clippingCorrectionEnabled;
}

- (void)setClippingCorrectionEnabled:(BOOL)a3
{
  self->_clippingCorrectionEnabled = a3;
}

- (float)clippingCorrectionTransitionGain
{
  return self->_clippingCorrectionTransitionGain;
}

- (void)setClippingCorrectionTransitionGain:(float)a3
{
  self->_clippingCorrectionTransitionGain = a3;
}

- (float)clippingCorrectionTransitionExponent
{
  return self->_clippingCorrectionTransitionExponent;
}

- (void)setClippingCorrectionTransitionExponent:(float)a3
{
  self->_clippingCorrectionTransitionExponent = a3;
}

- (float)colourSaturationBoostGain
{
  return self->_colourSaturationBoostGain;
}

- (void)setColourSaturationBoostGain:(float)a3
{
  self->_colourSaturationBoostGain = a3;
}

- (float)gammaCorrection
{
  return self->_gammaCorrection;
}

- (void)setGammaCorrection:(float)a3
{
  self->_gammaCorrection = a3;
}

- (BOOL)globalRGBToneCurveEnabled
{
  return self->_globalRGBToneCurveEnabled;
}

- (void)setGlobalRGBToneCurveEnabled:(BOOL)a3
{
  self->_globalRGBToneCurveEnabled = a3;
}

- (float)globalRGBToneCurveBrightnessBoostFactor
{
  return self->_globalRGBToneCurveBrightnessBoostFactor;
}

- (void)setGlobalRGBToneCurveBrightnessBoostFactor:(float)a3
{
  self->_globalRGBToneCurveBrightnessBoostFactor = a3;
}

@end