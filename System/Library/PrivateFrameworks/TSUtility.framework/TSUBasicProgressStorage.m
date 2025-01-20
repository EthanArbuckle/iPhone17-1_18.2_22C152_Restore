@interface TSUBasicProgressStorage
- (BOOL)isIndeterminate;
- (double)maxValue;
- (double)value;
- (void)setIndeterminate:(BOOL)a3;
- (void)setMaxValue:(double)a3;
- (void)setValue:(double)a3;
@end

@implementation TSUBasicProgressStorage

- (double)value
{
  return self->mValue;
}

- (void)setValue:(double)a3
{
  self->mValue = a3;
}

- (double)maxValue
{
  return self->mMaxValue;
}

- (void)setMaxValue:(double)a3
{
  self->mMaxValue = a3;
}

- (BOOL)isIndeterminate
{
  return self->mIndeterminate;
}

- (void)setIndeterminate:(BOOL)a3
{
  self->mIndeterminate = a3;
}

@end