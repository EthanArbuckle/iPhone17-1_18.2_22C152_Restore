@interface CRLineWrappingClassifierInput
- (CRLineWrappingClassifierInput)initWithFeatures:(id)a3;
- (MLMultiArray)features;
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
- (void)setFeatures:(id)a3;
@end

@implementation CRLineWrappingClassifierInput

- (CRLineWrappingClassifierInput)initWithFeatures:(id)a3
{
  id v5 = a3;
  if (self) {
    objc_storeStrong((id *)&self->_features, a3);
  }

  return self;
}

- (NSSet)featureNames
{
  return (NSSet *)[MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F3935B78];
}

- (id)featureValueForName:(id)a3
{
  return (id)[MEMORY[0x1E4F1E950] featureValueWithMultiArray:self->_features];
}

- (MLMultiArray)features
{
  return self->_features;
}

- (void)setFeatures:(id)a3
{
}

- (void).cxx_destruct
{
}

@end