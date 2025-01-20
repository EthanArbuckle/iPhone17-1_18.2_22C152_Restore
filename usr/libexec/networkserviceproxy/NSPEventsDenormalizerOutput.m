@interface NSPEventsDenormalizerOutput
- (MLMultiArray)Identity;
- (NSPEventsDenormalizerOutput)initWithIdentity:(id)a3;
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
- (void)setIdentity:(id)a3;
@end

@implementation NSPEventsDenormalizerOutput

- (NSPEventsDenormalizerOutput)initWithIdentity:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NSPEventsDenormalizerOutput;
  v6 = [(NSPEventsDenormalizerOutput *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_Identity, a3);
  }

  return v7;
}

- (NSSet)featureNames
{
  return +[NSSet setWithArray:&off_10010FD58];
}

- (id)featureValueForName:(id)a3
{
  if ([a3 isEqualToString:@"Identity"])
  {
    v4 = [(NSPEventsDenormalizerOutput *)self Identity];
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