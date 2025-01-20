@interface CRFormContentTypeModelOutput
- (CRFormContentTypeModelOutput)initWithScore:(id)a3;
- (MLMultiArray)score;
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
- (void)setScore:(id)a3;
@end

@implementation CRFormContentTypeModelOutput

- (CRFormContentTypeModelOutput)initWithScore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRFormContentTypeModelOutput;
  v6 = [(CRFormContentTypeModelOutput *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_score, a3);
  }

  return v7;
}

- (NSSet)featureNames
{
  return (NSSet *)[MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F3935CC8];
}

- (id)featureValueForName:(id)a3
{
  if ([a3 isEqualToString:@"score"])
  {
    v4 = (void *)MEMORY[0x1E4F1E950];
    id v5 = [(CRFormContentTypeModelOutput *)self score];
    v6 = [v4 featureValueWithMultiArray:v5];
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (MLMultiArray)score
{
  return self->_score;
}

- (void)setScore:(id)a3
{
}

- (void).cxx_destruct
{
}

@end