@interface CMISoftwareFlashRenderingSensorSpaceConversionV2Configuration
- (CMISoftwareFlashRenderingSensorSpaceConversionV2Configuration)init;
- (float)clippedConfidenceLikelihoodExponent;
- (float)clippedConfidenceLikelihoodScale;
- (void)setClippedConfidenceLikelihoodExponent:(float)a3;
- (void)setClippedConfidenceLikelihoodScale:(float)a3;
@end

@implementation CMISoftwareFlashRenderingSensorSpaceConversionV2Configuration

- (CMISoftwareFlashRenderingSensorSpaceConversionV2Configuration)init
{
  v3.receiver = self;
  v3.super_class = (Class)CMISoftwareFlashRenderingSensorSpaceConversionV2Configuration;
  result = [(CMISoftwareFlashRenderingSensorSpaceConversionV2Configuration *)&v3 init];
  if (result) {
    *(void *)&result->_clippedConfidenceLikelihoodScale = 0x418000003F800000;
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