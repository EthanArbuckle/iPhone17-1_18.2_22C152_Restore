@interface REMLEntropyMetric
- (REMLEntropyMetric)initWithName:(id)a3 featureName:(id)a4;
- (double)getDoubleFromFeatureValue:(id)a3;
- (id)calibrationCurveTotal;
- (id)calibrationCurveTrue;
- (id)meanEntropy;
- (id)meanNormalizedEntropy;
- (id)meanPrediction;
- (id)meanTruth;
- (id)name;
- (int64_t)numberOfExamples;
- (unint64_t)calibrationCurveNumBuckets;
- (void)reset;
- (void)updateMetricsFromFeatures:(id)a3 prediction:(id)a4 truth:(id)a5;
@end

@implementation REMLEntropyMetric

- (void)reset
{
  self->_normalizedLogScore = 0.0;
  *(_OWORD *)&self->_sumPrediction = 0u;
  *(_OWORD *)&self->_numExamples = 0u;
  if (self->_calibrationCurveNumBuckets)
  {
    unint64_t v3 = 0;
    do
    {
      [(NSMutableArray *)self->_calibrationCurveTotal setObject:&unk_26CFCD578 atIndexedSubscript:v3];
      [(NSMutableArray *)self->_calibrationCurveTrue setObject:&unk_26CFCD578 atIndexedSubscript:v3++];
    }
    while (v3 < self->_calibrationCurveNumBuckets);
  }
}

- (id)name
{
  return self->_metricName;
}

- (REMLEntropyMetric)initWithName:(id)a3 featureName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)REMLEntropyMetric;
  v9 = [(REMLEntropyMetric *)&v17 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_metricName, a3);
    objc_storeStrong((id *)&v10->_predictionFeatureName, a4);
    objc_storeStrong((id *)&v10->_truthFeatureName, a4);
    v10->_arrayFeatureIndex = 0;
    v10->_calibrationCurveNumBuckets = 10;
    uint64_t v11 = [MEMORY[0x263EFF980] arrayWithCapacity:10];
    calibrationCurveTotal = v10->_calibrationCurveTotal;
    v10->_calibrationCurveTotal = (NSMutableArray *)v11;

    uint64_t v13 = [MEMORY[0x263EFF980] arrayWithCapacity:v10->_calibrationCurveNumBuckets];
    calibrationCurveTrue = v10->_calibrationCurveTrue;
    v10->_calibrationCurveTrue = (NSMutableArray *)v13;

    [(REMLEntropyMetric *)v10 reset];
    v15 = v10;
  }

  return v10;
}

- (id)meanEntropy
{
  return (id)[NSNumber numberWithDouble:-self->_logScore / (double)self->_numExamples];
}

- (id)meanNormalizedEntropy
{
  double normalizedLogScore = self->_normalizedLogScore;
  double v3 = 0.0;
  if (normalizedLogScore != 0.0) {
    double v3 = self->_logScore / normalizedLogScore;
  }
  return (id)[NSNumber numberWithDouble:v3];
}

- (id)meanTruth
{
  return (id)[NSNumber numberWithDouble:self->_sumTruth / (double)self->_numExamples];
}

- (id)meanPrediction
{
  return (id)[NSNumber numberWithDouble:self->_sumPrediction / (double)self->_numExamples];
}

- (int64_t)numberOfExamples
{
  return self->_numExamples;
}

- (unint64_t)calibrationCurveNumBuckets
{
  return self->_calibrationCurveNumBuckets;
}

- (id)calibrationCurveTotal
{
  return self->_calibrationCurveTrue;
}

- (id)calibrationCurveTrue
{
  return self->_calibrationCurveTrue;
}

- (double)getDoubleFromFeatureValue:(id)a3
{
  id v4 = a3;
  v5 = v4;
  double v6 = 0.0;
  if (v4)
  {
    uint64_t v7 = [v4 type];
    switch(v7)
    {
      case 1:
        if ([v5 int64Value]) {
          double v6 = 1.0;
        }
        else {
          double v6 = 0.0;
        }
        break;
      case 2:
        [v5 doubleValue];
        double v6 = v11;
        break;
      case 5:
        id v8 = [v5 multiArrayValue];
        v9 = [v8 objectAtIndexedSubscript:self->_arrayFeatureIndex];
        [v9 doubleValue];
        double v6 = v10;

        break;
    }
  }

  return v6;
}

- (void)updateMetricsFromFeatures:(id)a3 prediction:(id)a4 truth:(id)a5
{
  id v26 = a4;
  id v7 = a5;
  ++self->_numExamples;
  id v8 = [v26 featureValueForName:self->_predictionFeatureName];
  v9 = [v7 featureValueForName:self->_truthFeatureName];
  [(REMLEntropyMetric *)self getDoubleFromFeatureValue:v8];
  long double v11 = v10;
  [(REMLEntropyMetric *)self getDoubleFromFeatureValue:v9];
  double v13 = v12;
  double v14 = v11 + self->_sumPrediction;
  int64_t numExamples = self->_numExamples;
  double v16 = v13 + self->_sumTruth;
  self->_sumTruth = v16;
  self->_sumPrediction = v14;
  double v17 = v16 / (double)numExamples;
  if (v13 > 0.0)
  {
    self->_logScore = self->_logScore + v13 * log(v11);
    self->_double normalizedLogScore = self->_normalizedLogScore + v13 * log(v17);
  }
  if (v13 < 1.0)
  {
    self->_logScore = self->_logScore + (1.0 - v13) * log(1.0 - v11);
    self->_double normalizedLogScore = self->_normalizedLogScore + (1.0 - v13) * log(1.0 - v17);
  }
  unint64_t v18 = (unint64_t)fmin(v11 * (double)self->_calibrationCurveNumBuckets, (double)(self->_calibrationCurveNumBuckets - 1));
  v19 = NSNumber;
  v20 = [(NSMutableArray *)self->_calibrationCurveTotal objectAtIndexedSubscript:v18];
  v21 = objc_msgSend(v19, "numberWithInt:", objc_msgSend(v20, "intValue") + 1);
  [(NSMutableArray *)self->_calibrationCurveTotal setObject:v21 atIndexedSubscript:v18];

  v22 = NSNumber;
  v23 = [(NSMutableArray *)self->_calibrationCurveTrue objectAtIndexedSubscript:v18];
  [v23 doubleValue];
  v25 = [v22 numberWithDouble:v13 + v24];
  [(NSMutableArray *)self->_calibrationCurveTrue setObject:v25 atIndexedSubscript:v18];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calibrationCurveTrue, 0);
  objc_storeStrong((id *)&self->_calibrationCurveTotal, 0);
  objc_storeStrong((id *)&self->_truthFeatureName, 0);
  objc_storeStrong((id *)&self->_predictionFeatureName, 0);
  objc_storeStrong((id *)&self->_metricName, 0);
}

@end