@interface ocv_drift_modelOutput
- (MLMultiArray)Prediction;
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
- (ocv_drift_modelOutput)initWithPrediction:(id)a3;
- (void)setPrediction:(id)a3;
@end

@implementation ocv_drift_modelOutput

- (ocv_drift_modelOutput)initWithPrediction:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ocv_drift_modelOutput;
  v6 = [(ocv_drift_modelOutput *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_Prediction, a3);
  }

  return v7;
}

- (NSSet)featureNames
{
  return +[NSSet setWithArray:&off_1000334F0];
}

- (id)featureValueForName:(id)a3
{
  if ([a3 isEqualToString:@"Prediction"])
  {
    v4 = [(ocv_drift_modelOutput *)self Prediction];
    id v5 = +[MLFeatureValue featureValueWithMultiArray:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (MLMultiArray)Prediction
{
  return self->_Prediction;
}

- (void)setPrediction:(id)a3
{
}

- (void).cxx_destruct
{
}

@end