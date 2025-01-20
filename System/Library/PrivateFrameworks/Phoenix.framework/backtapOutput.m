@interface backtapOutput
- (MLMultiArray)model_output;
- (NSSet)featureNames;
- (backtapOutput)initWithModel_output:(id)a3;
- (id)featureValueForName:(id)a3;
- (void)setModel_output:(id)a3;
@end

@implementation backtapOutput

- (backtapOutput)initWithModel_output:(id)a3
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v8;
  v8 = 0;
  v6.receiver = v3;
  v6.super_class = (Class)backtapOutput;
  v8 = [(backtapOutput *)&v6 init];
  objc_storeStrong((id *)&v8, v8);
  if (v8) {
    objc_storeStrong((id *)&v8->_model_output, location[0]);
  }
  v5 = v8;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v8, 0);
  return v5;
}

- (NSSet)featureNames
{
  return (NSSet *)objc_msgSend(MEMORY[0x263EFFA08], "setWithArray:", &unk_26EA41A28, a2, self);
}

- (id)featureValueForName:(id)a3
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ([location[0] isEqualToString:@"model_output"])
  {
    v5 = (void *)MEMORY[0x263F00D50];
    objc_super v6 = [(backtapOutput *)v8 model_output];
    id v9 = (id)objc_msgSend(v5, "featureValueWithMultiArray:");
  }
  else
  {
    id v9 = 0;
  }
  objc_storeStrong(location, 0);
  v3 = v9;
  return v3;
}

- (MLMultiArray)model_output
{
  return self->_model_output;
}

- (void)setModel_output:(id)a3
{
}

- (void).cxx_destruct
{
}

@end