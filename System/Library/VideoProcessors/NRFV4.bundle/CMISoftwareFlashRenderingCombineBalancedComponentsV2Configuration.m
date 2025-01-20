@interface CMISoftwareFlashRenderingCombineBalancedComponentsV2Configuration
- (BOOL)clippingCorrectionEnabled;
- (CMISoftwareFlashRenderingCombineBalancedComponentsV2Configuration)init;
- (float)clippingCorrectionTransitionExponent;
- (float)clippingCorrectionTransitionGain;
- (void)setClippingCorrectionEnabled:(BOOL)a3;
- (void)setClippingCorrectionTransitionExponent:(float)a3;
- (void)setClippingCorrectionTransitionGain:(float)a3;
@end

@implementation CMISoftwareFlashRenderingCombineBalancedComponentsV2Configuration

- (CMISoftwareFlashRenderingCombineBalancedComponentsV2Configuration)init
{
  v3.receiver = self;
  v3.super_class = (Class)CMISoftwareFlashRenderingCombineBalancedComponentsV2Configuration;
  result = [(CMISoftwareFlashRenderingCombineBalancedComponentsV2Configuration *)&v3 init];
  if (result)
  {
    result->_clippingCorrectionEnabled = 1;
    *(void *)&result->_clippingCorrectionTransitionGain = 0x420000003F866666;
  }
  return result;
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

@end