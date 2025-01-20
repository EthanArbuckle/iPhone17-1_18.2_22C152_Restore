@interface RelevantTSAnomaly
- (NSArray)predictedTimesUntilAnomaly;
- (TSAnomaly)anomaly;
- (double)dist;
- (id)init:(id)a3 dist:(double)a4 predictedTimesUntilAnomaly:(id)a5;
@end

@implementation RelevantTSAnomaly

- (id)init:(id)a3 dist:(double)a4 predictedTimesUntilAnomaly:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)RelevantTSAnomaly;
  v11 = [(RelevantTSAnomaly *)&v15 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_anomaly, a3);
    v12->_dist = a4;
    objc_storeStrong((id *)&v12->_predictedTimesUntilAnomaly, a5);
    v13 = v12;
  }

  return v12;
}

- (TSAnomaly)anomaly
{
  return (TSAnomaly *)objc_getProperty(self, a2, 8, 1);
}

- (double)dist
{
  return self->_dist;
}

- (NSArray)predictedTimesUntilAnomaly
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predictedTimesUntilAnomaly, 0);

  objc_storeStrong((id *)&self->_anomaly, 0);
}

@end