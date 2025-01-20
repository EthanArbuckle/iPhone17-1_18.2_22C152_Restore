@interface CHDSeriesAxis
- (CHDSeriesAxis)initWithResources:(id)a3;
- (int)labelFrequency;
- (void)setLabelFrequency:(int)a3;
@end

@implementation CHDSeriesAxis

- (CHDSeriesAxis)initWithResources:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CHDSeriesAxis;
  result = [(CHDAxis *)&v4 initWithResources:a3];
  if (result) {
    result->mLabelFrequency = 1;
  }
  return result;
}

- (void)setLabelFrequency:(int)a3
{
  self->mLabelFrequency = a3;
}

- (int)labelFrequency
{
  return self->mLabelFrequency;
}

@end