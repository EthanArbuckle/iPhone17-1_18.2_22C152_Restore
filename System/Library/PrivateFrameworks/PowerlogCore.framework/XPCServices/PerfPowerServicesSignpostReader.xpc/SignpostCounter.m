@interface SignpostCounter
- (SignpostCounter)init;
- (void)updateMxSignpostOverlapStatistics:(id)a3;
@end

@implementation SignpostCounter

- (SignpostCounter)init
{
  v8.receiver = self;
  v8.super_class = (Class)SignpostCounter;
  result = [(SignpostCounter *)&v8 init];
  if (result)
  {
    result->count = 0;
    result->mxSignpostIntervalCounts = 0;
    result->mxSignpostIntervalOverlaps = 0;
    __asm { FMOV            V0.2D, #-1.0 }
    *(_OWORD *)&result->prevMxSignpostStartMs = _Q0;
  }
  return result;
}

- (void)updateMxSignpostOverlapStatistics:(id)a3
{
  id v4 = a3;
  ++self->mxSignpostIntervalCounts;
  double prevMxSignpostStartMs = self->prevMxSignpostStartMs;
  id v12 = v4;
  [v4 startMs];
  if (prevMxSignpostStartMs <= v6)
  {
    double prevMxSignpostEndMs = self->prevMxSignpostEndMs;
    [v12 startMs];
    if (prevMxSignpostEndMs > v9) {
      ++self->mxSignpostIntervalOverlaps;
    }
    double v10 = self->prevMxSignpostEndMs;
    [v12 endMs];
    if (v10 >= v7) {
      double v7 = v10;
    }
  }
  else
  {
    [v12 endMs];
  }
  self->double prevMxSignpostEndMs = v7;
  [v12 startMs];
  self->double prevMxSignpostStartMs = v11;
}

@end