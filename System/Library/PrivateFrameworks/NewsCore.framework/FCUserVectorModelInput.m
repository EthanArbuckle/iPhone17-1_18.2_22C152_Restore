@interface FCUserVectorModelInput
- (FCUserVectorModelInput)initWithAggregates:(id)a3;
- (MLMultiArray)aggregates;
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
- (void)setAggregates:(id)a3;
@end

@implementation FCUserVectorModelInput

- (FCUserVectorModelInput)initWithAggregates:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCUserVectorModelInput;
  v6 = [(FCUserVectorModelInput *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_aggregates, a3);
  }

  return v7;
}

- (NSSet)featureNames
{
  return (NSSet *)[MEMORY[0x1E4F1CAD0] setWithArray:&unk_1EF8D8CE8];
}

- (id)featureValueForName:(id)a3
{
  if ([a3 isEqualToString:@"aggregates"])
  {
    v4 = (void *)MEMORY[0x1E4F1E950];
    id v5 = [(FCUserVectorModelInput *)self aggregates];
    v6 = [v4 featureValueWithMultiArray:v5];
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (MLMultiArray)aggregates
{
  return self->_aggregates;
}

- (void)setAggregates:(id)a3
{
}

- (void).cxx_destruct
{
}

@end