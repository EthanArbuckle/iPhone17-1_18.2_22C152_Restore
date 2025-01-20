@interface MKProgress
- (float)progress:(unint64_t *)a3;
- (unint64_t)completedOperationCount;
- (unint64_t)totalOperationCount;
- (void)addCompletedOerationCount:(unint64_t)a3;
- (void)addTotalOperationCount:(unint64_t)a3;
@end

@implementation MKProgress

- (void)addTotalOperationCount:(unint64_t)a3
{
  self->_totalOperationCount += a3;
}

- (void)addCompletedOerationCount:(unint64_t)a3
{
  unint64_t completedOperationCount = self->_completedOperationCount;
  if (!completedOperationCount)
  {
    [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
    self->_startTime = v6;
    unint64_t completedOperationCount = self->_completedOperationCount;
  }
  self->_unint64_t completedOperationCount = completedOperationCount + a3;
}

- (unint64_t)completedOperationCount
{
  return self->_completedOperationCount;
}

- (unint64_t)totalOperationCount
{
  return self->_totalOperationCount;
}

- (float)progress:(unint64_t *)a3
{
  unint64_t totalOperationCount = self->_totalOperationCount;
  unint64_t completedOperationCount = self->_completedOperationCount;
  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  if (a3)
  {
    unint64_t v8 = 60
       * vcvtad_u64_f64((double)(totalOperationCount - completedOperationCount)/ ((double)self->_completedOperationCount/ (v7 - self->_startTime))/ 60.0);
    if (v8 <= 0x3C) {
      unint64_t v8 = 60;
    }
    *a3 = v8;
  }
  return fmin((double)completedOperationCount / (double)totalOperationCount, 1.0);
}

@end