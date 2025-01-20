@interface base_engageOutput
- (NSDictionary)classProbability;
- (NSSet)featureNames;
- (base_engageOutput)initWithEngage:(int64_t)a3 classProbability:(id)a4;
- (id)featureValueForName:(id)a3;
- (int64_t)engage;
- (void)setClassProbability:(id)a3;
- (void)setEngage:(int64_t)a3;
@end

@implementation base_engageOutput

- (base_engageOutput)initWithEngage:(int64_t)a3 classProbability:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)base_engageOutput;
  v8 = [(base_engageOutput *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_engage = a3;
    objc_storeStrong((id *)&v8->_classProbability, a4);
  }

  return v9;
}

- (NSSet)featureNames
{
  return (NSSet *)[MEMORY[0x263EFFA08] setWithArray:&unk_26D385D68];
}

- (id)featureValueForName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"engage"])
  {
    v5 = objc_msgSend(MEMORY[0x263F00D50], "featureValueWithInt64:", -[base_engageOutput engage](self, "engage"));
  }
  else if ([v4 isEqualToString:@"classProbability"])
  {
    v6 = (void *)MEMORY[0x263F00D50];
    id v7 = [(base_engageOutput *)self classProbability];
    v5 = [v6 featureValueWithDictionary:v7 error:0];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (int64_t)engage
{
  return self->_engage;
}

- (void)setEngage:(int64_t)a3
{
  self->_engage = a3;
}

- (NSDictionary)classProbability
{
  return self->_classProbability;
}

- (void)setClassProbability:(id)a3
{
}

- (void).cxx_destruct
{
}

@end