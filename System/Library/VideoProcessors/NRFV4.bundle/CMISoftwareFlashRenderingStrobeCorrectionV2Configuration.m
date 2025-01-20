@interface CMISoftwareFlashRenderingStrobeCorrectionV2Configuration
- (CMISoftwareFlashRenderingStrobeCorrectionV2Configuration)init;
- (float)ambientStrobeBeamProfileMixFactor;
- (float)strobeBeamProfileComponentOneThreshold;
- (float)strobeBeamProfileComponentZeroThreshold;
- (float)strobeBeamProfileScaleMaximum;
- (float)strobeBeamProfileScaleMinimum;
- (void)setAmbientStrobeBeamProfileMixFactor:(float)a3;
- (void)setStrobeBeamProfileComponentOneThreshold:(float)a3;
- (void)setStrobeBeamProfileComponentZeroThreshold:(float)a3;
- (void)setStrobeBeamProfileScaleMaximum:(float)a3;
- (void)setStrobeBeamProfileScaleMinimum:(float)a3;
@end

@implementation CMISoftwareFlashRenderingStrobeCorrectionV2Configuration

- (CMISoftwareFlashRenderingStrobeCorrectionV2Configuration)init
{
  v3.receiver = self;
  v3.super_class = (Class)CMISoftwareFlashRenderingStrobeCorrectionV2Configuration;
  result = [(CMISoftwareFlashRenderingStrobeCorrectionV2Configuration *)&v3 init];
  if (result)
  {
    *(_OWORD *)&result->_strobeBeamProfileScaleMinimum = xmmword_26337FE80;
    result->_ambientStrobeBeamProfileMixFactor = 0.75;
  }
  return result;
}

- (float)strobeBeamProfileScaleMinimum
{
  return self->_strobeBeamProfileScaleMinimum;
}

- (void)setStrobeBeamProfileScaleMinimum:(float)a3
{
  self->_strobeBeamProfileScaleMinimum = a3;
}

- (float)strobeBeamProfileScaleMaximum
{
  return self->_strobeBeamProfileScaleMaximum;
}

- (void)setStrobeBeamProfileScaleMaximum:(float)a3
{
  self->_strobeBeamProfileScaleMaximum = a3;
}

- (float)strobeBeamProfileComponentZeroThreshold
{
  return self->_strobeBeamProfileComponentZeroThreshold;
}

- (void)setStrobeBeamProfileComponentZeroThreshold:(float)a3
{
  self->_strobeBeamProfileComponentZeroThreshold = a3;
}

- (float)strobeBeamProfileComponentOneThreshold
{
  return self->_strobeBeamProfileComponentOneThreshold;
}

- (void)setStrobeBeamProfileComponentOneThreshold:(float)a3
{
  self->_strobeBeamProfileComponentOneThreshold = a3;
}

- (float)ambientStrobeBeamProfileMixFactor
{
  return self->_ambientStrobeBeamProfileMixFactor;
}

- (void)setAmbientStrobeBeamProfileMixFactor:(float)a3
{
  self->_ambientStrobeBeamProfileMixFactor = a3;
}

@end