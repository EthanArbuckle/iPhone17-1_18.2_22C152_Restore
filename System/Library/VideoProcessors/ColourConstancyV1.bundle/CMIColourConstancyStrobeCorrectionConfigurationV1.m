@interface CMIColourConstancyStrobeCorrectionConfigurationV1
- (CMIColourConstancyStrobeCorrectionConfigurationV1)init;
- (float)strobeBeamProfileComponentOneThreshold;
- (float)strobeBeamProfileComponentZeroThreshold;
- (float)strobeBeamProfileScaleMaximum;
- (float)strobeBeamProfileScaleMinimum;
- (void)setStrobeBeamProfileComponentOneThreshold:(float)a3;
- (void)setStrobeBeamProfileComponentZeroThreshold:(float)a3;
- (void)setStrobeBeamProfileScaleMaximum:(float)a3;
- (void)setStrobeBeamProfileScaleMinimum:(float)a3;
@end

@implementation CMIColourConstancyStrobeCorrectionConfigurationV1

- (CMIColourConstancyStrobeCorrectionConfigurationV1)init
{
  v3.receiver = self;
  v3.super_class = (Class)CMIColourConstancyStrobeCorrectionConfigurationV1;
  result = [(CMIColourConstancyStrobeCorrectionConfigurationV1 *)&v3 init];
  if (result) {
    *(_OWORD *)&result->_strobeBeamProfileScaleMinimum = xmmword_21AA0;
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

@end