@interface state_estimation_modelOutput
- (MLMultiArray)health_state_estimation;
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
- (state_estimation_modelOutput)initWithHealth_state_estimation:(id)a3;
- (void)setHealth_state_estimation:(id)a3;
@end

@implementation state_estimation_modelOutput

- (state_estimation_modelOutput)initWithHealth_state_estimation:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)state_estimation_modelOutput;
  v6 = [(state_estimation_modelOutput *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_health_state_estimation, a3);
  }

  return v7;
}

- (NSSet)featureNames
{
  return +[NSSet setWithArray:&off_100033580];
}

- (id)featureValueForName:(id)a3
{
  if ([a3 isEqualToString:@"health_state_estimation"])
  {
    v4 = [(state_estimation_modelOutput *)self health_state_estimation];
    id v5 = +[MLFeatureValue featureValueWithMultiArray:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (MLMultiArray)health_state_estimation
{
  return self->_health_state_estimation;
}

- (void)setHealth_state_estimation:(id)a3
{
}

- (void).cxx_destruct
{
}

@end