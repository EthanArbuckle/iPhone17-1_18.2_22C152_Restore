@interface NSPEventsDenormalizerInput
- (MLMultiArray)denormalizer_input;
- (NSPEventsDenormalizerInput)initWithDenormalizer_input:(id)a3;
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
- (void)setDenormalizer_input:(id)a3;
@end

@implementation NSPEventsDenormalizerInput

- (NSPEventsDenormalizerInput)initWithDenormalizer_input:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NSPEventsDenormalizerInput;
  v6 = [(NSPEventsDenormalizerInput *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_denormalizer_input, a3);
  }

  return v7;
}

- (NSSet)featureNames
{
  return +[NSSet setWithArray:&off_10010FD40];
}

- (id)featureValueForName:(id)a3
{
  if ([a3 isEqualToString:@"denormalizer_input"])
  {
    v4 = [(NSPEventsDenormalizerInput *)self denormalizer_input];
    id v5 = +[MLFeatureValue featureValueWithMultiArray:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (MLMultiArray)denormalizer_input
{
  return self->_denormalizer_input;
}

- (void)setDenormalizer_input:(id)a3
{
}

- (void).cxx_destruct
{
}

@end