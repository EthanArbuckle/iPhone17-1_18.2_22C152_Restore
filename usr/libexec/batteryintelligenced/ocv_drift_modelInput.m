@interface ocv_drift_modelInput
- (MLMultiArray)Input;
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
- (ocv_drift_modelInput)initWithInput:(id)a3;
- (void)setInput:(id)a3;
@end

@implementation ocv_drift_modelInput

- (ocv_drift_modelInput)initWithInput:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ocv_drift_modelInput;
  v6 = [(ocv_drift_modelInput *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_Input, a3);
  }

  return v7;
}

- (NSSet)featureNames
{
  return +[NSSet setWithArray:&off_1000334D8];
}

- (id)featureValueForName:(id)a3
{
  if ([a3 isEqualToString:@"Input"])
  {
    v4 = [(ocv_drift_modelInput *)self Input];
    id v5 = +[MLFeatureValue featureValueWithMultiArray:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (MLMultiArray)Input
{
  return self->_Input;
}

- (void)setInput:(id)a3
{
}

- (void).cxx_destruct
{
}

@end