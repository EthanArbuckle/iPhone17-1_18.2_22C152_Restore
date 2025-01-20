@interface OITSUScaledProgressStorage
- (double)maxValue;
- (void)setMaxValue:(double)a3;
@end

@implementation OITSUScaledProgressStorage

- (double)maxValue
{
  return self->mMaxValue;
}

- (void)setMaxValue:(double)a3
{
  self->mMaxValue = a3;
}

@end