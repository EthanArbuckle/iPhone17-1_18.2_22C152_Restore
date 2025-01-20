@interface CMIColourConstancyClippingRecoveryConfigurationV1
- (CMIColourConstancyClippingRecoveryConfigurationV1)init;
- (CMIColourConstancyMicroHazeDetectionConfigurationV1)microHazeDetectionConfig;
- (float)clippedLikelihoodExponent;
- (float)clippedLikelihoodScalar;
- (float)fusionMapGaussianSigma;
- (float)gamma;
- (float)pyramidGaussianSigma;
- (int)fusionMapDilationRadius;
- (int)fusionMapGaussianKernelRadius;
- (int)pyramidGaussianKernelRadius;
- (int)pyramidLastLevelHeight;
- (int)pyramidLastLevelWidth;
- (int)pyramidNumLevels;
- (void)setClippedLikelihoodExponent:(float)a3;
- (void)setClippedLikelihoodScalar:(float)a3;
- (void)setFusionMapDilationRadius:(int)a3;
- (void)setFusionMapGaussianKernelRadius:(int)a3;
- (void)setFusionMapGaussianSigma:(float)a3;
- (void)setGamma:(float)a3;
- (void)setPyramidGaussianKernelRadius:(int)a3;
- (void)setPyramidGaussianSigma:(float)a3;
- (void)setPyramidLastLevelHeight:(int)a3;
- (void)setPyramidLastLevelWidth:(int)a3;
- (void)setPyramidNumLevels:(int)a3;
@end

@implementation CMIColourConstancyClippingRecoveryConfigurationV1

- (CMIColourConstancyClippingRecoveryConfigurationV1)init
{
  v8.receiver = self;
  v8.super_class = (Class)CMIColourConstancyClippingRecoveryConfigurationV1;
  v2 = [(CMIColourConstancyClippingRecoveryConfigurationV1 *)&v8 init];
  v3 = v2;
  if (!v2) {
    goto LABEL_5;
  }
  *((void *)v2 + 1) = 0x10000000003;
  *((void *)v2 + 2) = 0x3F400000000000C0;
  *((_DWORD *)v2 + 6) = 5;
  *(void *)(v2 + 28) = 0x410000003F800000;
  *(void *)(v2 + 36) = 0x4000000000000004;
  *(void *)(v2 + 44) = 0x400CCCCD0000000DLL;
  v4 = [[CMIColourConstancyMicroHazeDetectionConfigurationV1 alloc] initWithFusionMapWidth:256 fusionMapHeight:192];
  v5 = (void *)v3[7];
  v3[7] = v4;

  if (!v3[7])
  {
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_5:
    v6 = 0;
    goto LABEL_6;
  }
  v6 = v3;
LABEL_6:

  return v6;
}

- (int)pyramidNumLevels
{
  return self->_pyramidNumLevels;
}

- (void)setPyramidNumLevels:(int)a3
{
  self->_pyramidNumLevels = a3;
}

- (int)pyramidLastLevelWidth
{
  return self->_pyramidLastLevelWidth;
}

- (void)setPyramidLastLevelWidth:(int)a3
{
  self->_pyramidLastLevelWidth = a3;
}

- (int)pyramidLastLevelHeight
{
  return self->_pyramidLastLevelHeight;
}

- (void)setPyramidLastLevelHeight:(int)a3
{
  self->_pyramidLastLevelHeight = a3;
}

- (float)pyramidGaussianSigma
{
  return self->_pyramidGaussianSigma;
}

- (void)setPyramidGaussianSigma:(float)a3
{
  self->_pyramidGaussianSigma = a3;
}

- (int)pyramidGaussianKernelRadius
{
  return self->_pyramidGaussianKernelRadius;
}

- (void)setPyramidGaussianKernelRadius:(int)a3
{
  self->_pyramidGaussianKernelRadius = a3;
}

- (float)clippedLikelihoodScalar
{
  return self->_clippedLikelihoodScalar;
}

- (void)setClippedLikelihoodScalar:(float)a3
{
  self->_clippedLikelihoodScalar = a3;
}

- (float)clippedLikelihoodExponent
{
  return self->_clippedLikelihoodExponent;
}

- (void)setClippedLikelihoodExponent:(float)a3
{
  self->_clippedLikelihoodExponent = a3;
}

- (int)fusionMapDilationRadius
{
  return self->_fusionMapDilationRadius;
}

- (void)setFusionMapDilationRadius:(int)a3
{
  self->_fusionMapDilationRadius = a3;
}

- (float)fusionMapGaussianSigma
{
  return self->_fusionMapGaussianSigma;
}

- (void)setFusionMapGaussianSigma:(float)a3
{
  self->_fusionMapGaussianSigma = a3;
}

- (int)fusionMapGaussianKernelRadius
{
  return self->_fusionMapGaussianKernelRadius;
}

- (void)setFusionMapGaussianKernelRadius:(int)a3
{
  self->_fusionMapGaussianKernelRadius = a3;
}

- (float)gamma
{
  return self->_gamma;
}

- (void)setGamma:(float)a3
{
  self->_gamma = a3;
}

- (CMIColourConstancyMicroHazeDetectionConfigurationV1)microHazeDetectionConfig
{
  return self->_microHazeDetectionConfig;
}

- (void).cxx_destruct
{
}

@end