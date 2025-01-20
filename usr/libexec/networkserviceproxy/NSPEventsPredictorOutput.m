@interface NSPEventsPredictorOutput
- (MLMultiArray)Identity;
- (NSPEventsPredictorOutput)initWithIdentity:(id)a3;
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
- (void)setIdentity:(id)a3;
@end

@implementation NSPEventsPredictorOutput

- (NSPEventsPredictorOutput)initWithIdentity:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NSPEventsPredictorOutput;
  v6 = [(NSPEventsPredictorOutput *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_Identity, a3);
  }

  return v7;
}

- (NSSet)featureNames
{
  return +[NSSet setWithArray:&off_10010FD10];
}

- (id)featureValueForName:(id)a3
{
  if ([a3 isEqualToString:@"Identity"])
  {
    v4 = [(NSPEventsPredictorOutput *)self Identity];
    id v5 = +[MLFeatureValue featureValueWithMultiArray:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
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