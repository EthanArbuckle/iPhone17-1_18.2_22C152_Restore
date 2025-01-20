@interface BackTapRNNInput
- (BackTapRNNInput)initWithModel_input:(id)a3 history:(id)a4;
- (MLMultiArray)history;
- (MLMultiArray)model_input;
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
- (void)setHistory:(id)a3;
- (void)setModel_input:(id)a3;
@end

@implementation BackTapRNNInput

- (BackTapRNNInput)initWithModel_input:(id)a3 history:(id)a4
{
  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v9 = 0;
  objc_storeStrong(&v9, a4);
  v4 = v11;
  v11 = 0;
  v8.receiver = v4;
  v8.super_class = (Class)BackTapRNNInput;
  v11 = [(BackTapRNNInput *)&v8 init];
  objc_storeStrong((id *)&v11, v11);
  if (v11)
  {
    objc_storeStrong((id *)&v11->_model_input, location[0]);
    objc_storeStrong((id *)&v11->_history, v9);
  }
  v6 = v11;
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v11, 0);
  return v6;
}

- (NSSet)featureNames
{
  return (NSSet *)objc_msgSend(MEMORY[0x263EFFA08], "setWithArray:", &unk_26EA419E0, a2, self);
}

- (id)featureValueForName:(id)a3
{
  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ([location[0] isEqualToString:@"model_input"])
  {
    v7 = (void *)MEMORY[0x263F00D50];
    objc_super v8 = [(BackTapRNNInput *)v10 model_input];
    id v11 = (id)objc_msgSend(v7, "featureValueWithMultiArray:");
  }
  else if ([location[0] isEqualToString:@"history"])
  {
    v5 = (void *)MEMORY[0x263F00D50];
    v6 = [(BackTapRNNInput *)v10 history];
    id v11 = (id)objc_msgSend(v5, "featureValueWithMultiArray:");
  }
  else
  {
    id v11 = 0;
  }
  objc_storeStrong(location, 0);
  v3 = v11;
  return v3;
}

- (MLMultiArray)model_input
{
  return self->_model_input;
}

- (void)setModel_input:(id)a3
{
}

- (MLMultiArray)history
{
  return self->_history;
}

- (void)setHistory:(id)a3
{
}

- (void).cxx_destruct
{
}

@end