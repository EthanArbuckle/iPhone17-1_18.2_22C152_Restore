@interface fwEnddet_rfOutput
- (NSDictionary)classProbability;
- (NSSet)featureNames;
- (fwEnddet_rfOutput)initWithClassLabel:(int64_t)a3 classProbability:(id)a4;
- (id)featureValueForName:(id)a3;
- (int64_t)classLabel;
- (void)setClassLabel:(int64_t)a3;
- (void)setClassProbability:(id)a3;
@end

@implementation fwEnddet_rfOutput

- (fwEnddet_rfOutput)initWithClassLabel:(int64_t)a3 classProbability:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)fwEnddet_rfOutput;
  v8 = [(fwEnddet_rfOutput *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_classLabel = a3;
    objc_storeStrong((id *)&v8->_classProbability, a4);
  }

  return v9;
}

- (NSSet)featureNames
{
  return (NSSet *)[MEMORY[0x263EFFA08] setWithArray:&unk_26E28F980];
}

- (id)featureValueForName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"classLabel"])
  {
    v5 = objc_msgSend(MEMORY[0x263F00D50], "featureValueWithInt64:", -[fwEnddet_rfOutput classLabel](self, "classLabel"));
  }
  else if ([v4 isEqualToString:@"classProbability"])
  {
    v6 = (void *)MEMORY[0x263F00D50];
    id v7 = [(fwEnddet_rfOutput *)self classProbability];
    v5 = [v6 featureValueWithDictionary:v7 error:0];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (int64_t)classLabel
{
  return self->_classLabel;
}

- (void)setClassLabel:(int64_t)a3
{
  self->_classLabel = a3;
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