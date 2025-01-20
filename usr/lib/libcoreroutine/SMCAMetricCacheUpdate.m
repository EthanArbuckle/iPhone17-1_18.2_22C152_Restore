@interface SMCAMetricCacheUpdate
- (SMCAMetricCacheUpdate)init;
- (double)averageDistanceBetweenLocationsInTrace;
- (double)averageHuncForLocationsInTrace;
- (double)averageTimeBetweenLocationsInTrace;
- (double)cacheSize;
- (double)maxDistanceBetweenLocationsInTrace;
- (double)maxHuncForLocationsInTrace;
- (double)maxTimeBetweenLocationsInTrace;
- (double)minDistanceBetweenLocationsInTrace;
- (double)minHuncForLocationsInTrace;
- (double)minTimeBetweenLocationsInTrace;
- (int64_t)numLocationsInTrace;
- (void)setAverageDistanceBetweenLocationsInTrace:(double)a3;
- (void)setAverageHuncForLocationsInTrace:(double)a3;
- (void)setAverageTimeBetweenLocationsInTrace:(double)a3;
- (void)setCacheSize:(double)a3;
- (void)setMaxDistanceBetweenLocationsInTrace:(double)a3;
- (void)setMaxHuncForLocationsInTrace:(double)a3;
- (void)setMaxTimeBetweenLocationsInTrace:(double)a3;
- (void)setMinDistanceBetweenLocationsInTrace:(double)a3;
- (void)setMinHuncForLocationsInTrace:(double)a3;
- (void)setMinTimeBetweenLocationsInTrace:(double)a3;
- (void)setNumLocationsInTrace:(int64_t)a3;
@end

@implementation SMCAMetricCacheUpdate

- (SMCAMetricCacheUpdate)init
{
  v3.receiver = self;
  v3.super_class = (Class)SMCAMetricCacheUpdate;
  result = [(SMCAMetricCacheUpdate *)&v3 init];
  if (result)
  {
    *(int64x2_t *)&result->_minDistanceBetweenLocationsInTrace = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    result->_minTimeBetweenLocationsInTrace = 1.79769313e308;
    result->_cacheSize = -1.0;
  }
  return result;
}

- (double)averageDistanceBetweenLocationsInTrace
{
  return self->_averageDistanceBetweenLocationsInTrace;
}

- (void)setAverageDistanceBetweenLocationsInTrace:(double)a3
{
  self->_averageDistanceBetweenLocationsInTrace = a3;
}

- (double)averageHuncForLocationsInTrace
{
  return self->_averageHuncForLocationsInTrace;
}

- (void)setAverageHuncForLocationsInTrace:(double)a3
{
  self->_averageHuncForLocationsInTrace = a3;
}

- (double)averageTimeBetweenLocationsInTrace
{
  return self->_averageTimeBetweenLocationsInTrace;
}

- (void)setAverageTimeBetweenLocationsInTrace:(double)a3
{
  self->_averageTimeBetweenLocationsInTrace = a3;
}

- (double)maxDistanceBetweenLocationsInTrace
{
  return self->_maxDistanceBetweenLocationsInTrace;
}

- (void)setMaxDistanceBetweenLocationsInTrace:(double)a3
{
  self->_maxDistanceBetweenLocationsInTrace = a3;
}

- (double)maxHuncForLocationsInTrace
{
  return self->_maxHuncForLocationsInTrace;
}

- (void)setMaxHuncForLocationsInTrace:(double)a3
{
  self->_maxHuncForLocationsInTrace = a3;
}

- (double)maxTimeBetweenLocationsInTrace
{
  return self->_maxTimeBetweenLocationsInTrace;
}

- (void)setMaxTimeBetweenLocationsInTrace:(double)a3
{
  self->_maxTimeBetweenLocationsInTrace = a3;
}

- (double)minDistanceBetweenLocationsInTrace
{
  return self->_minDistanceBetweenLocationsInTrace;
}

- (void)setMinDistanceBetweenLocationsInTrace:(double)a3
{
  self->_minDistanceBetweenLocationsInTrace = a3;
}

- (double)minHuncForLocationsInTrace
{
  return self->_minHuncForLocationsInTrace;
}

- (void)setMinHuncForLocationsInTrace:(double)a3
{
  self->_minHuncForLocationsInTrace = a3;
}

- (double)minTimeBetweenLocationsInTrace
{
  return self->_minTimeBetweenLocationsInTrace;
}

- (void)setMinTimeBetweenLocationsInTrace:(double)a3
{
  self->_minTimeBetweenLocationsInTrace = a3;
}

- (int64_t)numLocationsInTrace
{
  return self->_numLocationsInTrace;
}

- (void)setNumLocationsInTrace:(int64_t)a3
{
  self->_numLocationsInTrace = a3;
}

- (double)cacheSize
{
  return self->_cacheSize;
}

- (void)setCacheSize:(double)a3
{
  self->_cacheSize = a3;
}

@end