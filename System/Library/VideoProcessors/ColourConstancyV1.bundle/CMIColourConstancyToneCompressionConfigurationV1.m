@interface CMIColourConstancyToneCompressionConfigurationV1
- (CMIColourConstancyToneCompressionConfigurationV1)init;
- (float)balanceDenseToSparseExponentFactor;
- (float)kernelSupportGaussianSigma;
- (float)kernelSupportSigmaToFilterScale;
- (float)minimumProbabilityDensity;
- (unsigned)numIntensityHistogramBins;
- (void)setBalanceDenseToSparseExponentFactor:(float)a3;
- (void)setKernelSupportGaussianSigma:(float)a3;
- (void)setKernelSupportSigmaToFilterScale:(float)a3;
- (void)setMinimumProbabilityDensity:(float)a3;
- (void)setNumIntensityHistogramBins:(unsigned int)a3;
@end

@implementation CMIColourConstancyToneCompressionConfigurationV1

- (CMIColourConstancyToneCompressionConfigurationV1)init
{
  v3.receiver = self;
  v3.super_class = (Class)CMIColourConstancyToneCompressionConfigurationV1;
  result = [(CMIColourConstancyToneCompressionConfigurationV1 *)&v3 init];
  if (result)
  {
    result->_numIntensityHistogramBins = 128;
    *(_OWORD *)&result->_balanceDenseToSparseExponentFactor = xmmword_21A00;
  }
  return result;
}

- (unsigned)numIntensityHistogramBins
{
  return self->_numIntensityHistogramBins;
}

- (void)setNumIntensityHistogramBins:(unsigned int)a3
{
  self->_numIntensityHistogramBins = a3;
}

- (float)balanceDenseToSparseExponentFactor
{
  return self->_balanceDenseToSparseExponentFactor;
}

- (void)setBalanceDenseToSparseExponentFactor:(float)a3
{
  self->_balanceDenseToSparseExponentFactor = a3;
}

- (float)minimumProbabilityDensity
{
  return self->_minimumProbabilityDensity;
}

- (void)setMinimumProbabilityDensity:(float)a3
{
  self->_minimumProbabilityDensity = a3;
}

- (float)kernelSupportGaussianSigma
{
  return self->_kernelSupportGaussianSigma;
}

- (void)setKernelSupportGaussianSigma:(float)a3
{
  self->_kernelSupportGaussianSigma = a3;
}

- (float)kernelSupportSigmaToFilterScale
{
  return self->_kernelSupportSigmaToFilterScale;
}

- (void)setKernelSupportSigmaToFilterScale:(float)a3
{
  self->_kernelSupportSigmaToFilterScale = a3;
}

@end