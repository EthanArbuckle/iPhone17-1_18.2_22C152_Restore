@interface TVL1_v3_RegularizationParameters
- (float)alpha;
- (float)beta;
- (float)diffusion_eps;
- (float)gain;
- (float)offset;
- (void)setAlpha:(float)a3;
- (void)setBeta:(float)a3;
- (void)setDiffusion_eps:(float)a3;
- (void)setGain:(float)a3;
- (void)setOffset:(float)a3;
@end

@implementation TVL1_v3_RegularizationParameters

- (float)alpha
{
  return self->_alpha;
}

- (void)setAlpha:(float)a3
{
  self->_alpha = a3;
}

- (float)beta
{
  return self->_beta;
}

- (void)setBeta:(float)a3
{
  self->_beta = a3;
}

- (float)gain
{
  return self->_gain;
}

- (void)setGain:(float)a3
{
  self->_gain = a3;
}

- (float)offset
{
  return self->_offset;
}

- (void)setOffset:(float)a3
{
  self->_offset = a3;
}

- (float)diffusion_eps
{
  return self->_diffusion_eps;
}

- (void)setDiffusion_eps:(float)a3
{
  self->_diffusion_eps = a3;
}

@end