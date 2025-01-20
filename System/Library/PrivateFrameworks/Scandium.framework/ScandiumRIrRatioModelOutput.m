@interface ScandiumRIrRatioModelOutput
- (MLMultiArray)Identity;
- (NSSet)featureNames;
- (ScandiumRIrRatioModelOutput)initWithIdentity:(id)a3;
- (id)featureValueForName:(id)a3;
- (void)setIdentity:(id)a3;
@end

@implementation ScandiumRIrRatioModelOutput

- (ScandiumRIrRatioModelOutput)initWithIdentity:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ScandiumRIrRatioModelOutput_0;
  v6 = [(ScandiumRIrRatioModelOutput *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_Identity, a3);
  }

  return v7;
}

- (NSSet)featureNames
{
  return (NSSet *)[MEMORY[0x263EFFA08] setWithArray:&unk_270936C88];
}

- (id)featureValueForName:(id)a3
{
  if ([a3 isEqualToString:@"Identity"])
  {
    v4 = (void *)MEMORY[0x263F00D50];
    id v5 = [(ScandiumRIrRatioModelOutput *)self Identity];
    v6 = [v4 featureValueWithMultiArray:v5];
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (MLMultiArray)Identity
{
  return self->_Identity;
}

- (void)setIdentity:(id)a3
{
}

- (void).cxx_destruct
{
}

@end