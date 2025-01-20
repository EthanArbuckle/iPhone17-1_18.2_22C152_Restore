@interface PXStoryTimeRangeValue
- ($28FEB1B56BB3ED5175BFC6DE64DE503F)storyTimeRange;
- (PXStoryTimeRangeValue)init;
- (PXStoryTimeRangeValue)initWithStoryTimeRange:(id *)a3;
@end

@implementation PXStoryTimeRangeValue

- ($28FEB1B56BB3ED5175BFC6DE64DE503F)storyTimeRange
{
  long long v3 = *(_OWORD *)&self->var1.var0;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self->var0.var1;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self->var1.var3;
  return self;
}

- (PXStoryTimeRangeValue)initWithStoryTimeRange:(id *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PXStoryTimeRangeValue;
  result = [(PXStoryTimeRangeValue *)&v7 init];
  if (result)
  {
    long long v5 = *(_OWORD *)&a3->var0.var0;
    long long v6 = *(_OWORD *)&a3->var0.var3;
    *(_OWORD *)&result->_storyTimeRange.duration.timescale = *(_OWORD *)&a3->var1.var1;
    *(_OWORD *)&result->_storyTimeRange.start.epoch = v6;
    *(_OWORD *)&result->_storyTimeRange.start.value = v5;
  }
  return result;
}

- (PXStoryTimeRangeValue)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryTypes.m", 87, @"%s is not available as initializer", "-[PXStoryTimeRangeValue init]");

  abort();
}

@end