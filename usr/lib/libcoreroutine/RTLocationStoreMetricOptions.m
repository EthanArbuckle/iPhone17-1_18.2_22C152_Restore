@interface RTLocationStoreMetricOptions
- (BOOL)includeFixMetrics;
- (BOOL)includeSignalEnvironment;
- (NSDateInterval)dateInterval;
- (RTLocationStoreMetricOptions)init;
- (RTLocationStoreMetricOptions)initWithDateInterval:(id)a3 uncertaintyThreshold:(double)a4;
- (RTLocationStoreMetricOptions)initWithDateInterval:(id)a3 uncertaintyThreshold:(double)a4 includeFixMetrics:(BOOL)a5 includeSignalEnvironment:(BOOL)a6;
- (double)uncertaintyThreshold;
- (id)description;
@end

@implementation RTLocationStoreMetricOptions

- (RTLocationStoreMetricOptions)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDateInterval_uncertaintyThreshold_);
}

- (RTLocationStoreMetricOptions)initWithDateInterval:(id)a3 uncertaintyThreshold:(double)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RTLocationStoreMetricOptions;
  v8 = [(RTLocationStoreMetricOptions *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_dateInterval, a3);
    v9->_uncertaintyThreshold = a4;
  }

  return v9;
}

- (RTLocationStoreMetricOptions)initWithDateInterval:(id)a3 uncertaintyThreshold:(double)a4 includeFixMetrics:(BOOL)a5 includeSignalEnvironment:(BOOL)a6
{
  result = [(RTLocationStoreMetricOptions *)self initWithDateInterval:a3 uncertaintyThreshold:a4];
  if (result)
  {
    result->_includeFixMetrics = a5;
    result->_includeSignalEnvironment = a6;
  }
  return result;
}

- (id)description
{
  v3 = NSString;
  v4 = [(NSDateInterval *)self->_dateInterval startDate];
  v5 = [v4 stringFromDate];
  v6 = [(NSDateInterval *)self->_dateInterval endDate];
  uint64_t v7 = [v6 stringFromDate];
  v8 = (void *)v7;
  v9 = @"YES";
  if (self->_includeFixMetrics) {
    v10 = @"YES";
  }
  else {
    v10 = @"NO";
  }
  if (!self->_includeSignalEnvironment) {
    v9 = @"NO";
  }
  objc_super v11 = [v3 stringWithFormat:@"startDate, %@, endDate, %@, uncertaintyThreshold, %.2f, includeFixMetrics, %@, includeSignalEnvironment, %@", v5, v7, *(void *)&self->_uncertaintyThreshold, v10, v9];

  return v11;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (double)uncertaintyThreshold
{
  return self->_uncertaintyThreshold;
}

- (BOOL)includeFixMetrics
{
  return self->_includeFixMetrics;
}

- (BOOL)includeSignalEnvironment
{
  return self->_includeSignalEnvironment;
}

- (void).cxx_destruct
{
}

@end