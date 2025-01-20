@interface deoc_modelOutput
- (NSDictionary)classProbability;
- (NSSet)featureNames;
- (deoc_modelOutput)initWithNext_drain_is_significant:(int64_t)a3 classProbability:(id)a4;
- (id)featureValueForName:(id)a3;
- (int64_t)next_drain_is_significant;
- (void)setClassProbability:(id)a3;
- (void)setNext_drain_is_significant:(int64_t)a3;
@end

@implementation deoc_modelOutput

- (deoc_modelOutput)initWithNext_drain_is_significant:(int64_t)a3 classProbability:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)deoc_modelOutput;
  v8 = [(deoc_modelOutput *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_next_drain_is_significant = a3;
    objc_storeStrong((id *)&v8->_classProbability, a4);
  }

  return v9;
}

- (NSSet)featureNames
{
  return (NSSet *)[MEMORY[0x263EFFA08] setWithArray:&unk_26D385B88];
}

- (id)featureValueForName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"next_drain_is_significant"])
  {
    v5 = objc_msgSend(MEMORY[0x263F00D50], "featureValueWithInt64:", -[deoc_modelOutput next_drain_is_significant](self, "next_drain_is_significant"));
  }
  else if ([v4 isEqualToString:@"classProbability"])
  {
    v6 = (void *)MEMORY[0x263F00D50];
    id v7 = [(deoc_modelOutput *)self classProbability];
    v5 = [v6 featureValueWithDictionary:v7 error:0];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (int64_t)next_drain_is_significant
{
  return self->_next_drain_is_significant;
}

- (void)setNext_drain_is_significant:(int64_t)a3
{
  self->_next_drain_is_significant = a3;
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