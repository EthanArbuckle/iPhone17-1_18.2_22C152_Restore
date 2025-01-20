@interface SBPressSequenceSettings
- (double)maxDefaultPressDownDuration;
- (double)maxDefaultPressUpDuration;
- (double)maxDownToDownDuration;
- (double)pressDownVariance;
- (double)pressUpVariance;
- (unint64_t)indexOfPressDownToUseForVarianceAndGrowth;
- (unint64_t)indexOfPressUpToUseForVarianceAndGrowth;
- (unint64_t)numberOfPressDownGrowthTerms;
- (unint64_t)numberOfPressUpGrowthTerms;
- (unint64_t)numberOfPresses;
- (void)setIndexOfPressDownToUseForVarianceAndGrowth:(unint64_t)a3;
- (void)setIndexOfPressUpToUseForVarianceAndGrowth:(unint64_t)a3;
- (void)setMaxDefaultPressDownDuration:(double)a3;
- (void)setMaxDefaultPressUpDuration:(double)a3;
- (void)setMaxDownToDownDuration:(double)a3;
- (void)setNumberOfPressDownGrowthTerms:(unint64_t)a3;
- (void)setNumberOfPressUpGrowthTerms:(unint64_t)a3;
- (void)setNumberOfPresses:(unint64_t)a3;
- (void)setPressDownVariance:(double)a3;
- (void)setPressUpVariance:(double)a3;
@end

@implementation SBPressSequenceSettings

- (unint64_t)numberOfPresses
{
  return self->_numberOfPresses;
}

- (void)setNumberOfPresses:(unint64_t)a3
{
  self->_numberOfPresses = a3;
}

- (double)maxDefaultPressDownDuration
{
  return self->_maxDefaultPressDownDuration;
}

- (void)setMaxDefaultPressDownDuration:(double)a3
{
  self->_maxDefaultPressDownDuration = a3;
}

- (double)maxDefaultPressUpDuration
{
  return self->_maxDefaultPressUpDuration;
}

- (void)setMaxDefaultPressUpDuration:(double)a3
{
  self->_maxDefaultPressUpDuration = a3;
}

- (double)maxDownToDownDuration
{
  return self->_maxDownToDownDuration;
}

- (void)setMaxDownToDownDuration:(double)a3
{
  self->_maxDownToDownDuration = a3;
}

- (unint64_t)indexOfPressDownToUseForVarianceAndGrowth
{
  return self->_indexOfPressDownToUseForVarianceAndGrowth;
}

- (void)setIndexOfPressDownToUseForVarianceAndGrowth:(unint64_t)a3
{
  self->_indexOfPressDownToUseForVarianceAndGrowth = a3;
}

- (unint64_t)numberOfPressDownGrowthTerms
{
  return self->_numberOfPressDownGrowthTerms;
}

- (void)setNumberOfPressDownGrowthTerms:(unint64_t)a3
{
  self->_numberOfPressDownGrowthTerms = a3;
}

- (unint64_t)indexOfPressUpToUseForVarianceAndGrowth
{
  return self->_indexOfPressUpToUseForVarianceAndGrowth;
}

- (void)setIndexOfPressUpToUseForVarianceAndGrowth:(unint64_t)a3
{
  self->_indexOfPressUpToUseForVarianceAndGrowth = a3;
}

- (unint64_t)numberOfPressUpGrowthTerms
{
  return self->_numberOfPressUpGrowthTerms;
}

- (void)setNumberOfPressUpGrowthTerms:(unint64_t)a3
{
  self->_numberOfPressUpGrowthTerms = a3;
}

- (double)pressDownVariance
{
  return self->_pressDownVariance;
}

- (void)setPressDownVariance:(double)a3
{
  self->_pressDownVariance = a3;
}

- (double)pressUpVariance
{
  return self->_pressUpVariance;
}

- (void)setPressUpVariance:(double)a3
{
  self->_pressUpVariance = a3;
}

@end