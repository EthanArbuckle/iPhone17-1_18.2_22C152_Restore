@interface tt80_lstm_regressionOutput
- (MLMultiArray)tt80_prediction_in_hrs;
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
- (tt80_lstm_regressionOutput)initWithTt80_prediction_in_hrs:(id)a3;
- (void)setTt80_prediction_in_hrs:(id)a3;
@end

@implementation tt80_lstm_regressionOutput

- (tt80_lstm_regressionOutput)initWithTt80_prediction_in_hrs:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)tt80_lstm_regressionOutput;
  v6 = [(tt80_lstm_regressionOutput *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_tt80_prediction_in_hrs, a3);
  }

  return v7;
}

- (NSSet)featureNames
{
  return +[NSSet setWithArray:&off_100033550];
}

- (id)featureValueForName:(id)a3
{
  if ([a3 isEqualToString:@"tt80_prediction_in_hrs"])
  {
    v4 = [(tt80_lstm_regressionOutput *)self tt80_prediction_in_hrs];
    id v5 = +[MLFeatureValue featureValueWithMultiArray:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (MLMultiArray)tt80_prediction_in_hrs
{
  return self->_tt80_prediction_in_hrs;
}

- (void)setTt80_prediction_in_hrs:(id)a3
{
}

- (void).cxx_destruct
{
}

@end