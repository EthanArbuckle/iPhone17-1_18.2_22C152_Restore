@interface model_period_TFOutput
- (MLMultiArray)out_;
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
- (model_period_TFOutput)initWithOut:(id)a3;
- (void)setOut_:(id)a3;
@end

@implementation model_period_TFOutput

- (model_period_TFOutput)initWithOut:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)model_period_TFOutput;
  v6 = [(model_period_TFOutput *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_out_, a3);
  }

  return v7;
}

- (NSSet)featureNames
{
  return (NSSet *)[MEMORY[0x263EFFA08] setWithArray:&unk_27069BC00];
}

- (id)featureValueForName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"out"])
  {
    id v5 = (void *)MEMORY[0x263F00D50];
    v6 = [(model_period_TFOutput *)self out];
    v7 = [v5 featureValueWithMultiArray:v6];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (MLMultiArray)out_
{
  return self->_out_;
}

- (void)setOut_:(id)a3
{
}

- (void).cxx_destruct
{
}

@end