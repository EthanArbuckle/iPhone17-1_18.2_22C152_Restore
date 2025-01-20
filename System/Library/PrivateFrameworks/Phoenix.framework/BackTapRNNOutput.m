@interface BackTapRNNOutput
- (BackTapRNNOutput)initWithOutput:(id)a3 updated_history:(id)a4;
- (MLMultiArray)output;
- (MLMultiArray)updated_history;
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
- (void)setOutput:(id)a3;
- (void)setUpdated_history:(id)a3;
@end

@implementation BackTapRNNOutput

- (BackTapRNNOutput)initWithOutput:(id)a3 updated_history:(id)a4
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
  v8.super_class = (Class)BackTapRNNOutput;
  v11 = [(BackTapRNNOutput *)&v8 init];
  objc_storeStrong((id *)&v11, v11);
  if (v11)
  {
    objc_storeStrong((id *)&v11->_output, location[0]);
    objc_storeStrong((id *)&v11->_updated_history, v9);
  }
  v6 = v11;
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v11, 0);
  return v6;
}

- (NSSet)featureNames
{
  return (NSSet *)objc_msgSend(MEMORY[0x263EFFA08], "setWithArray:", &unk_26EA419F8, a2, self);
}

- (id)featureValueForName:(id)a3
{
  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ([location[0] isEqualToString:@"output"])
  {
    v7 = (void *)MEMORY[0x263F00D50];
    objc_super v8 = [(BackTapRNNOutput *)v10 output];
    id v11 = (id)objc_msgSend(v7, "featureValueWithMultiArray:");
  }
  else if ([location[0] isEqualToString:@"updated_history"])
  {
    v5 = (void *)MEMORY[0x263F00D50];
    v6 = [(BackTapRNNOutput *)v10 updated_history];
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

- (MLMultiArray)output
{
  return self->_output;
}

- (void)setOutput:(id)a3
{
}

- (MLMultiArray)updated_history
{
  return self->_updated_history;
}

- (void)setUpdated_history:(id)a3
{
}

- (void).cxx_destruct
{
}

@end