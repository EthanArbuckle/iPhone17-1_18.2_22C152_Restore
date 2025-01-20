@interface CHDDateAxis
- (BOOL)isAutomatic;
- (BOOL)isDate;
- (CHDDateAxis)initWithResources:(id)a3;
- (double)majorUnitValue;
- (double)minorUnitValue;
- (int)baseTimeUnit;
- (int)majorTimeUnit;
- (int)minorTimeUnit;
- (void)setAutomatic:(BOOL)a3;
- (void)setBaseTimeUnit:(int)a3;
- (void)setMajorTimeUnit:(int)a3;
- (void)setMajorUnitValue:(double)a3;
- (void)setMinorTimeUnit:(int)a3;
- (void)setMinorUnitValue:(double)a3;
@end

@implementation CHDDateAxis

- (CHDDateAxis)initWithResources:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CHDDateAxis;
  result = [(CHDAxis *)&v4 initWithResources:a3];
  if (result)
  {
    result->mAutomatic = 1;
    result->mMajorUnitValue = 0.0;
    result->mMinorUnitValue = 0.0;
    result->super.mAxisPosition = 1;
    result->mMinorTimeUnit = 0;
    result->mMajorTimeUnit = 0;
    result->mBaseTimeUnit = 0;
  }
  return result;
}

- (void)setMajorUnitValue:(double)a3
{
  self->mMajorUnitValue = a3;
}

- (void)setMinorUnitValue:(double)a3
{
  self->mMinorUnitValue = a3;
}

- (void)setMinorTimeUnit:(int)a3
{
  self->mMinorTimeUnit = a3;
}

- (void)setMajorTimeUnit:(int)a3
{
  self->mMajorTimeUnit = a3;
}

- (void)setBaseTimeUnit:(int)a3
{
  self->mBaseTimeUnit = a3;
}

- (void)setAutomatic:(BOOL)a3
{
  self->mAutomatic = a3;
}

- (BOOL)isDate
{
  return 1;
}

- (BOOL)isAutomatic
{
  return self->mAutomatic;
}

- (double)majorUnitValue
{
  return self->mMajorUnitValue;
}

- (double)minorUnitValue
{
  return self->mMinorUnitValue;
}

- (int)majorTimeUnit
{
  return self->mMajorTimeUnit;
}

- (int)minorTimeUnit
{
  return self->mMinorTimeUnit;
}

- (int)baseTimeUnit
{
  return self->mBaseTimeUnit;
}

@end