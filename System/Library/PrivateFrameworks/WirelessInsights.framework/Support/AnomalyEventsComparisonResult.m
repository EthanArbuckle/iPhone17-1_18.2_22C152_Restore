@interface AnomalyEventsComparisonResult
- (NSArray)predictedTimesUntilAnomaly;
- (double)averageEventDistance;
- (id)init:(id)a3 averageEventDistance:(double)a4;
- (void)updateAverageEventDistanceWithWeight:(double)a3;
@end

@implementation AnomalyEventsComparisonResult

- (id)init:(id)a3 averageEventDistance:(double)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AnomalyEventsComparisonResult;
  v8 = [(AnomalyEventsComparisonResult *)&v12 init];
  v9 = (double *)v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_predictedTimesUntilAnomaly, a3);
    v9[2] = a4;
    v10 = v9;
  }

  return v9;
}

- (void)updateAverageEventDistanceWithWeight:(double)a3
{
  self->_averageEventDistance = self->_averageEventDistance * a3;
}

- (NSArray)predictedTimesUntilAnomaly
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (double)averageEventDistance
{
  return self->_averageEventDistance;
}

- (void).cxx_destruct
{
}

@end