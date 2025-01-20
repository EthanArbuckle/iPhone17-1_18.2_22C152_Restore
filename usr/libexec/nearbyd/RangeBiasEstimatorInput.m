@interface RangeBiasEstimatorInput
- (NSSet)featureNames;
- (RangeBiasEstimatorInput)initWithData:(id)a3;
- (id)featureValueForName:(id)a3;
@end

@implementation RangeBiasEstimatorInput

- (RangeBiasEstimatorInput)initWithData:(id)a3
{
  id v5 = a3;
  if (self) {
    objc_storeStrong((id *)&self->_data, a3);
  }

  return self;
}

- (NSSet)featureNames
{
  return +[NSSet setWithArray:&off_1008785C8];
}

- (id)featureValueForName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"input"])
  {
    id v5 = +[MLFeatureValue featureValueWithMultiArray:self->_data];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
}

@end