@interface engageModelOutput
- (NSDictionary)classProbability;
- (NSSet)featureNames;
- (engageModelOutput)initWithEngage:(int64_t)a3 classProbability:(id)a4;
- (id)featureValueForName:(id)a3;
- (int64_t)engage;
- (void)setClassProbability:(id)a3;
- (void)setEngage:(int64_t)a3;
@end

@implementation engageModelOutput

- (engageModelOutput)initWithEngage:(int64_t)a3 classProbability:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)engageModelOutput;
  v8 = [(engageModelOutput *)&v11 init];
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
  return +[NSSet setWithArray:&off_100069B80];
}

- (id)featureValueForName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"engage"])
  {
    v5 = +[MLFeatureValue featureValueWithInt64:[(engageModelOutput *)self engage]];
  }
  else if ([v4 isEqualToString:@"classProbability"])
  {
    v6 = [(engageModelOutput *)self classProbability];
    v5 = +[MLFeatureValue featureValueWithDictionary:v6 error:0];
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