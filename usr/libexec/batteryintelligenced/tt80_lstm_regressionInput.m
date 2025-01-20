@interface tt80_lstm_regressionInput
- (MLMultiArray)sbc_in;
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
- (tt80_lstm_regressionInput)initWithSbc_in:(id)a3;
- (void)setSbc_in:(id)a3;
@end

@implementation tt80_lstm_regressionInput

- (tt80_lstm_regressionInput)initWithSbc_in:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)tt80_lstm_regressionInput;
  v6 = [(tt80_lstm_regressionInput *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_sbc_in, a3);
  }

  return v7;
}

- (NSSet)featureNames
{
  return +[NSSet setWithArray:&off_100033538];
}

- (id)featureValueForName:(id)a3
{
  if ([a3 isEqualToString:@"sbc_in"])
  {
    v4 = [(tt80_lstm_regressionInput *)self sbc_in];
    id v5 = +[MLFeatureValue featureValueWithMultiArray:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (MLMultiArray)sbc_in
{
  return self->_sbc_in;
}

- (void)setSbc_in:(id)a3
{
}

- (void).cxx_destruct
{
}

@end