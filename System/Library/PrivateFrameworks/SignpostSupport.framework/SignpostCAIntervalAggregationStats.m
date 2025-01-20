@interface SignpostCAIntervalAggregationStats
- (float)averageIntervalDurationNs;
- (float)maxIntervalDurationNs;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)intervalCount;
- (unint64_t)totalIntervalDurationNs;
- (void)_addAggregationStats:(id)a3;
- (void)_addDurationNsToAggregation:(unint64_t)a3;
@end

@implementation SignpostCAIntervalAggregationStats

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[SignpostCAIntervalAggregationStats allocWithZone:a3] init];
  [(SignpostCAIntervalAggregationStats *)v4 _addAggregationStats:self];
  return v4;
}

- (void)_addAggregationStats:(id)a3
{
  id v8 = a3;
  self->_intervalCount += [v8 intervalCount];
  self->_totalIntervalDurationNs += [v8 totalIntervalDurationNs];
  [v8 maxIntervalDurationNs];
  float v5 = v4;
  [(SignpostCAIntervalAggregationStats *)self maxIntervalDurationNs];
  if (v5 > v6)
  {
    [v8 maxIntervalDurationNs];
    self->_maxIntervalDurationNs = v7;
  }
}

- (float)averageIntervalDurationNs
{
  if (![(SignpostCAIntervalAggregationStats *)self intervalCount]) {
    return 0.0;
  }
  float v3 = (float)[(SignpostCAIntervalAggregationStats *)self totalIntervalDurationNs];
  return v3 / (float)[(SignpostCAIntervalAggregationStats *)self intervalCount];
}

- (void)_addDurationNsToAggregation:(unint64_t)a3
{
  unint64_t v4 = self->_totalIntervalDurationNs + a3;
  ++self->_intervalCount;
  self->_totalIntervalDurationNs = v4;
  float v5 = (float)a3;
  [(SignpostCAIntervalAggregationStats *)self maxIntervalDurationNs];
  if (v6 < v5) {
    self->_maxIntervalDurationNs = v5;
  }
}

- (id)description
{
  if ([(SignpostCAIntervalAggregationStats *)self intervalCount])
  {
    float v3 = NSString;
    unint64_t v4 = [(SignpostCAIntervalAggregationStats *)self intervalCount];
    [(SignpostCAIntervalAggregationStats *)self averageIntervalDurationNs];
    double v6 = v5 / 1000000.0;
    [(SignpostCAIntervalAggregationStats *)self maxIntervalDurationNs];
    id v8 = [v3 stringWithFormat:@"Count: %llu, Average: %.1f ms, Max: %.1f ms", v4, *(void *)&v6, v7 / 1000000.0];
  }
  else
  {
    id v8 = @"No stalls";
  }

  return v8;
}

- (unint64_t)intervalCount
{
  return self->_intervalCount;
}

- (unint64_t)totalIntervalDurationNs
{
  return self->_totalIntervalDurationNs;
}

- (float)maxIntervalDurationNs
{
  return self->_maxIntervalDurationNs;
}

@end