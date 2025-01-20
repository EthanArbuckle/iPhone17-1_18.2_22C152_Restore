@interface PXStatsCalculator
- (PXStatsCalculator)init;
- (double)first;
- (double)max;
- (double)mean;
- (double)min;
- (double)standardDeviation;
- (int64_t)count;
- (void)addValue:(double)max;
@end

@implementation PXStatsCalculator

- (double)first
{
  return self->_first;
}

- (double)max
{
  return self->_max;
}

- (double)min
{
  return self->_min;
}

- (int64_t)count
{
  return self->_count;
}

- (double)standardDeviation
{
  [(PXStatsCalculator *)self mean];
  return sqrt(self->_squareSum / (double)self->_count - v3 * v3);
}

- (double)mean
{
  return self->_sum / (double)self->_count;
}

- (void)addValue:(double)max
{
  double v3 = self->_squareSum + max * max;
  self->_sum = self->_sum + max;
  self->_squareSum = v3;
  int64_t count = self->_count;
  self->_int64_t count = count + 1;
  if (count)
  {
    double min = self->_min;
    if (min >= max) {
      double min = max;
    }
    if (self->_max >= max) {
      max = self->_max;
    }
    self->_double min = min;
    self->_max = max;
  }
  else
  {
    self->_max = max;
    self->_first = max;
    self->_double min = max;
  }
}

- (PXStatsCalculator)init
{
  v3.receiver = self;
  v3.super_class = (Class)PXStatsCalculator;
  result = [(PXStatsCalculator *)&v3 init];
  if (result)
  {
    result->_first = NAN;
    *(int64x2_t *)&result->_double min = vdupq_n_s64(0x7FF8000000000000uLL);
  }
  return result;
}

@end