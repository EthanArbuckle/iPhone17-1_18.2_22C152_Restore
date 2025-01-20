@interface FPDisparityEstimator_RegularizationParameters
- (float)alpha;
- (float)beta;
- (float)gain;
- (float)offset;
- (float)segmentation_bias_background;
- (float)segmentation_bias_foreground;
- (void)setAlpha:(float)a3;
- (void)setBeta:(float)a3;
- (void)setGain:(float)a3;
- (void)setOffset:(float)a3;
- (void)setSegmentation_bias_background:(float)a3;
- (void)setSegmentation_bias_foreground:(float)a3;
@end

@implementation FPDisparityEstimator_RegularizationParameters

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

- (float)segmentation_bias_foreground
{
  return self->_segmentation_bias_foreground;
}

- (void)setSegmentation_bias_foreground:(float)a3
{
  self->_segmentation_bias_foreground = a3;
}

- (float)segmentation_bias_background
{
  return self->_segmentation_bias_background;
}

- (void)setSegmentation_bias_background:(float)a3
{
  self->_segmentation_bias_background = a3;
}

@end