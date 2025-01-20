@interface CMIColourConstancySensorSpaceConversionConfigurationV1
- (CMIColourConstancySensorSpaceConversionConfigurationV1)init;
- (float)clippedConfidenceLikelihoodExponent;
- (float)clippedConfidenceLikelihoodScale;
- (void)setClippedConfidenceLikelihoodExponent:(float)a3;
- (void)setClippedConfidenceLikelihoodScale:(float)a3;
@end

@implementation CMIColourConstancySensorSpaceConversionConfigurationV1

- (CMIColourConstancySensorSpaceConversionConfigurationV1)init
{
  v3.receiver = self;
  v3.super_class = (Class)CMIColourConstancySensorSpaceConversionConfigurationV1;
  result = [(CMIColourConstancySensorSpaceConversionConfigurationV1 *)&v3 init];
  if (result) {
    *(void *)&result->_clippedConfidenceLikelihoodScale = 0x40E0000041400000;
  }
  return result;
}

- (float)clippedConfidenceLikelihoodScale
{
  return self->_clippedConfidenceLikelihoodScale;
}

- (void)setClippedConfidenceLikelihoodScale:(float)a3
{
  self->_clippedConfidenceLikelihoodScale = a3;
}

- (float)clippedConfidenceLikelihoodExponent
{
  return self->_clippedConfidenceLikelihoodExponent;
}

- (void)setClippedConfidenceLikelihoodExponent:(float)a3
{
  self->_clippedConfidenceLikelihoodExponent = a3;
}

@end