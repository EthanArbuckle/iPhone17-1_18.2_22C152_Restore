@interface fwEnddet_rfInput
- (MLMultiArray)input;
- (NSSet)featureNames;
- (fwEnddet_rfInput)initWithInput:(id)a3;
- (id)featureValueForName:(id)a3;
- (void)setInput:(id)a3;
@end

@implementation fwEnddet_rfInput

- (fwEnddet_rfInput)initWithInput:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)fwEnddet_rfInput;
  v6 = [(fwEnddet_rfInput *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_input, a3);
  }

  return v7;
}

- (NSSet)featureNames
{
  return (NSSet *)[MEMORY[0x263EFFA08] setWithArray:&unk_27069BCC0];
}

- (id)featureValueForName:(id)a3
{
  if ([a3 isEqualToString:@"input"])
  {
    v4 = (void *)MEMORY[0x263F00D50];
    id v5 = [(fwEnddet_rfInput *)self input];
    v6 = [v4 featureValueWithMultiArray:v5];
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (MLMultiArray)input
{
  return self->_input;
}

- (void)setInput:(id)a3
{
}

- (void).cxx_destruct
{
}

@end