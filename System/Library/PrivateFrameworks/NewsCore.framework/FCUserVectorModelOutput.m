@interface FCUserVectorModelOutput
- (FCUserVectorModelOutput)initWithUser_vector:(id)a3;
- (MLMultiArray)user_vector;
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
- (void)setUser_vector:(id)a3;
@end

@implementation FCUserVectorModelOutput

- (FCUserVectorModelOutput)initWithUser_vector:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCUserVectorModelOutput;
  v6 = [(FCUserVectorModelOutput *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_user_vector, a3);
  }

  return v7;
}

- (NSSet)featureNames
{
  return (NSSet *)[MEMORY[0x1E4F1CAD0] setWithArray:&unk_1EF8D8D00];
}

- (id)featureValueForName:(id)a3
{
  if ([a3 isEqualToString:@"user_vector"])
  {
    v4 = (void *)MEMORY[0x1E4F1E950];
    id v5 = [(FCUserVectorModelOutput *)self user_vector];
    v6 = [v4 featureValueWithMultiArray:v5];
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (MLMultiArray)user_vector
{
  return self->_user_vector;
}

- (void)setUser_vector:(id)a3
{
}

- (void).cxx_destruct
{
}

@end