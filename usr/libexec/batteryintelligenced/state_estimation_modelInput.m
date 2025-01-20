@interface state_estimation_modelInput
- (MLMultiArray)daily_history_input;
- (MLMultiArray)usage_history_input;
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
- (state_estimation_modelInput)initWithDaily_history_input:(id)a3 usage_history_input:(id)a4;
- (void)setDaily_history_input:(id)a3;
- (void)setUsage_history_input:(id)a3;
@end

@implementation state_estimation_modelInput

- (state_estimation_modelInput)initWithDaily_history_input:(id)a3 usage_history_input:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)state_estimation_modelInput;
  v9 = [(state_estimation_modelInput *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_daily_history_input, a3);
    objc_storeStrong((id *)&v10->_usage_history_input, a4);
  }

  return v10;
}

- (NSSet)featureNames
{
  return +[NSSet setWithArray:&off_100033568];
}

- (id)featureValueForName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"daily_history_input"])
  {
    uint64_t v5 = [(state_estimation_modelInput *)self daily_history_input];
LABEL_5:
    v6 = (void *)v5;
    id v7 = +[MLFeatureValue featureValueWithMultiArray:v5];

    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"usage_history_input"])
  {
    uint64_t v5 = [(state_estimation_modelInput *)self usage_history_input];
    goto LABEL_5;
  }
  id v7 = 0;
LABEL_7:

  return v7;
}

- (MLMultiArray)daily_history_input
{
  return self->_daily_history_input;
}

- (void)setDaily_history_input:(id)a3
{
}

- (MLMultiArray)usage_history_input
{
  return self->_usage_history_input;
}

- (void)setUsage_history_input:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usage_history_input, 0);

  objc_storeStrong((id *)&self->_daily_history_input, 0);
}

@end