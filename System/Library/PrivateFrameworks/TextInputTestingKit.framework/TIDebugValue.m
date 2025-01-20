@interface TIDebugValue
- (float)defaultValue;
- (float)stepSize;
- (float)sweepMax;
- (float)sweepMin;
- (float)sweepValue;
- (void)setDefaultValue:(float)a3;
- (void)setStepSize:(float)a3;
- (void)setSweepMax:(float)a3;
- (void)setSweepMin:(float)a3;
- (void)setSweepValue:(float)a3;
@end

@implementation TIDebugValue

- (void)setStepSize:(float)a3
{
  self->stepSize = a3;
}

- (float)stepSize
{
  return self->stepSize;
}

- (void)setSweepMax:(float)a3
{
  self->sweepMax = a3;
}

- (float)sweepMax
{
  return self->sweepMax;
}

- (void)setSweepMin:(float)a3
{
  self->sweepMin = a3;
}

- (float)sweepMin
{
  return self->sweepMin;
}

- (void)setSweepValue:(float)a3
{
  self->sweepValue = a3;
}

- (float)sweepValue
{
  return self->sweepValue;
}

- (void)setDefaultValue:(float)a3
{
  self->defaultValue = a3;
}

- (float)defaultValue
{
  return self->defaultValue;
}

@end