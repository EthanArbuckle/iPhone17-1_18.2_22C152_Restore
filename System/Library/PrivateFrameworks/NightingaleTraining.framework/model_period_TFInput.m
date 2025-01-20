@interface model_period_TFInput
- (MLMultiArray)in_;
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
- (model_period_TFInput)initWithIn:(id)a3;
- (void)setIn_:(id)a3;
@end

@implementation model_period_TFInput

- (model_period_TFInput)initWithIn:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)model_period_TFInput;
  v6 = [(model_period_TFInput *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_in_, a3);
  }

  return v7;
}

- (NSSet)featureNames
{
  return (NSSet *)[MEMORY[0x263EFFA08] setWithArray:&unk_27069BBE8];
}

- (id)featureValueForName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"in"])
  {
    id v5 = (void *)MEMORY[0x263F00D50];
    v6 = [(model_period_TFInput *)self in];
    v7 = [v5 featureValueWithMultiArray:v6];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (MLMultiArray)in_
{
  return self->_in_;
}

- (void)setIn_:(id)a3
{
}

- (void).cxx_destruct
{
}

@end