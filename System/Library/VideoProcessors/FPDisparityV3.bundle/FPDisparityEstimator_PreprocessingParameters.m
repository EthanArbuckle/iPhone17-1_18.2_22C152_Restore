@interface FPDisparityEstimator_PreprocessingParameters
- (float)blackLevelOffset;
- (float)blackLevelScaling;
- (void)setBlackLevelOffset:(float)a3;
- (void)setBlackLevelScaling:(float)a3;
@end

@implementation FPDisparityEstimator_PreprocessingParameters

- (float)blackLevelOffset
{
  return self->_blackLevelOffset;
}

- (void)setBlackLevelOffset:(float)a3
{
  self->_blackLevelOffset = a3;
}

- (float)blackLevelScaling
{
  return self->_blackLevelScaling;
}

- (void)setBlackLevelScaling:(float)a3
{
  self->_blackLevelScaling = a3;
}

@end