@interface NSPEventsNormalizerInput
- (MLMultiArray)normalizer_input;
- (NSPEventsNormalizerInput)initWithNormalizer_input:(id)a3;
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
- (void)setNormalizer_input:(id)a3;
@end

@implementation NSPEventsNormalizerInput

- (NSPEventsNormalizerInput)initWithNormalizer_input:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NSPEventsNormalizerInput;
  v6 = [(NSPEventsNormalizerInput *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_normalizer_input, a3);
  }

  return v7;
}

- (NSSet)featureNames
{
  return +[NSSet setWithArray:&off_10010FD70];
}

- (id)featureValueForName:(id)a3
{
  if ([a3 isEqualToString:@"normalizer_input"])
  {
    v4 = [(NSPEventsNormalizerInput *)self normalizer_input];
    id v5 = +[MLFeatureValue featureValueWithMultiArray:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (MLMultiArray)normalizer_input
{
  return self->_normalizer_input;
}

- (void)setNormalizer_input:(id)a3
{
}

- (void).cxx_destruct
{
}

@end