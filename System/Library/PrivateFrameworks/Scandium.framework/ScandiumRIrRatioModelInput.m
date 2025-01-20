@interface ScandiumRIrRatioModelInput
- (MLMultiArray)ir;
- (MLMultiArray)red;
- (NSSet)featureNames;
- (ScandiumRIrRatioModelInput)initWithIr:(id)a3 red:(id)a4;
- (id)featureValueForName:(id)a3;
- (void)setIr:(id)a3;
- (void)setRed:(id)a3;
@end

@implementation ScandiumRIrRatioModelInput

- (ScandiumRIrRatioModelInput)initWithIr:(id)a3 red:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ScandiumRIrRatioModelInput_0;
  v9 = [(ScandiumRIrRatioModelInput *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_ir, a3);
    objc_storeStrong((id *)&v10->_red, a4);
  }

  return v10;
}

- (NSSet)featureNames
{
  return (NSSet *)[MEMORY[0x263EFFA08] setWithArray:&unk_270936C70];
}

- (id)featureValueForName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"ir"])
  {
    v5 = (void *)MEMORY[0x263F00D50];
    uint64_t v6 = [(ScandiumRIrRatioModelInput *)self ir];
LABEL_5:
    id v7 = (void *)v6;
    id v8 = [v5 featureValueWithMultiArray:v6];

    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"red"])
  {
    v5 = (void *)MEMORY[0x263F00D50];
    uint64_t v6 = [(ScandiumRIrRatioModelInput *)self red];
    goto LABEL_5;
  }
  id v8 = 0;
LABEL_7:

  return v8;
}

- (MLMultiArray)ir
{
  return self->_ir;
}

- (void)setIr:(id)a3
{
}

- (MLMultiArray)red
{
  return self->_red;
}

- (void)setRed:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_red, 0);
  objc_storeStrong((id *)&self->_ir, 0);
}

@end