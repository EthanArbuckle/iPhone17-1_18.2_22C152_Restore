@interface CMISoftwareFlashRenderingStyleTransferV2Configuration
- (BOOL)clippingCorrectionEnabled;
- (BOOL)speedModeStyleTransferEnabled;
- (CMISoftwareFlashRenderingStyleTransferV2Configuration)initWithSourceThumbnailWidth:(unsigned int)a3;
- (float)clippingCorrectionTransitionExponent;
- (float)clippingCorrectionTransitionGain;
- (float)learningModulationMaskPersonModulationWeight;
- (float)learningModulationMaskSkinGapModulationWeight;
- (float)learningModulationMaskSkinModulationWeight;
- (float)styleTransferGammaCorrection;
- (float)styleTransferThumbnailSharpness;
- (float)styleTransferThumbnailSigmaToFilterScale;
- (unsigned)learningModulationMaskCloseKernelSize;
- (unsigned)sourceThumbnailWidth;
- (unsigned)styleTransferThumbnailHeight;
- (unsigned)styleTransferThumbnailWidth;
- (void)setClippingCorrectionEnabled:(BOOL)a3;
- (void)setClippingCorrectionTransitionExponent:(float)a3;
- (void)setClippingCorrectionTransitionGain:(float)a3;
- (void)setLearningModulationMaskCloseKernelSize:(unsigned int)a3;
- (void)setLearningModulationMaskPersonModulationWeight:(float)a3;
- (void)setLearningModulationMaskSkinGapModulationWeight:(float)a3;
- (void)setLearningModulationMaskSkinModulationWeight:(float)a3;
- (void)setSourceThumbnailWidth:(unsigned int)a3;
- (void)setSpeedModeStyleTransferEnabled:(BOOL)a3;
- (void)setStyleTransferGammaCorrection:(float)a3;
- (void)setStyleTransferThumbnailHeight:(unsigned int)a3;
- (void)setStyleTransferThumbnailSharpness:(float)a3;
- (void)setStyleTransferThumbnailSigmaToFilterScale:(float)a3;
- (void)setStyleTransferThumbnailWidth:(unsigned int)a3;
@end

@implementation CMISoftwareFlashRenderingStyleTransferV2Configuration

- (CMISoftwareFlashRenderingStyleTransferV2Configuration)initWithSourceThumbnailWidth:(unsigned int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CMISoftwareFlashRenderingStyleTransferV2Configuration;
  result = [(CMISoftwareFlashRenderingStyleTransferV2Configuration *)&v5 init];
  if (result)
  {
    *(_WORD *)&result->_speedModeStyleTransferEnabled = 256;
    result->_sourceThumbnailWidth = a3;
    *(void *)&result->_styleTransferThumbnailWidth = 0x6000000080;
    *(_OWORD *)&result->_styleTransferThumbnailSharpness = xmmword_26337FEF0;
    *(void *)&result->_clippingCorrectionTransitionExponent = 0x542000000;
    *(void *)&result->_learningModulationMaskPersonModulationWeight = 0x3E4CCCCD3D4CCCCDLL;
    result->_learningModulationMaskSkinGapModulationWeight = 1.0;
  }
  return result;
}

- (BOOL)speedModeStyleTransferEnabled
{
  return self->_speedModeStyleTransferEnabled;
}

- (void)setSpeedModeStyleTransferEnabled:(BOOL)a3
{
  self->_speedModeStyleTransferEnabled = a3;
}

- (unsigned)sourceThumbnailWidth
{
  return self->_sourceThumbnailWidth;
}

- (void)setSourceThumbnailWidth:(unsigned int)a3
{
  self->_sourceThumbnailWidth = a3;
}

- (unsigned)styleTransferThumbnailWidth
{
  return self->_styleTransferThumbnailWidth;
}

- (void)setStyleTransferThumbnailWidth:(unsigned int)a3
{
  self->_styleTransferThumbnailWidth = a3;
}

- (unsigned)styleTransferThumbnailHeight
{
  return self->_styleTransferThumbnailHeight;
}

- (void)setStyleTransferThumbnailHeight:(unsigned int)a3
{
  self->_styleTransferThumbnailHeight = a3;
}

- (float)styleTransferThumbnailSharpness
{
  return self->_styleTransferThumbnailSharpness;
}

- (void)setStyleTransferThumbnailSharpness:(float)a3
{
  self->_styleTransferThumbnailSharpness = a3;
}

- (float)styleTransferThumbnailSigmaToFilterScale
{
  return self->_styleTransferThumbnailSigmaToFilterScale;
}

- (void)setStyleTransferThumbnailSigmaToFilterScale:(float)a3
{
  self->_styleTransferThumbnailSigmaToFilterScale = a3;
}

- (float)styleTransferGammaCorrection
{
  return self->_styleTransferGammaCorrection;
}

- (void)setStyleTransferGammaCorrection:(float)a3
{
  self->_styleTransferGammaCorrection = a3;
}

- (BOOL)clippingCorrectionEnabled
{
  return self->_clippingCorrectionEnabled;
}

- (void)setClippingCorrectionEnabled:(BOOL)a3
{
  self->_clippingCorrectionEnabled = a3;
}

- (float)clippingCorrectionTransitionGain
{
  return self->_clippingCorrectionTransitionGain;
}

- (void)setClippingCorrectionTransitionGain:(float)a3
{
  self->_clippingCorrectionTransitionGain = a3;
}

- (float)clippingCorrectionTransitionExponent
{
  return self->_clippingCorrectionTransitionExponent;
}

- (void)setClippingCorrectionTransitionExponent:(float)a3
{
  self->_clippingCorrectionTransitionExponent = a3;
}

- (unsigned)learningModulationMaskCloseKernelSize
{
  return self->_learningModulationMaskCloseKernelSize;
}

- (void)setLearningModulationMaskCloseKernelSize:(unsigned int)a3
{
  self->_learningModulationMaskCloseKernelSize = a3;
}

- (float)learningModulationMaskPersonModulationWeight
{
  return self->_learningModulationMaskPersonModulationWeight;
}

- (void)setLearningModulationMaskPersonModulationWeight:(float)a3
{
  self->_learningModulationMaskPersonModulationWeight = a3;
}

- (float)learningModulationMaskSkinModulationWeight
{
  return self->_learningModulationMaskSkinModulationWeight;
}

- (void)setLearningModulationMaskSkinModulationWeight:(float)a3
{
  self->_learningModulationMaskSkinModulationWeight = a3;
}

- (float)learningModulationMaskSkinGapModulationWeight
{
  return self->_learningModulationMaskSkinGapModulationWeight;
}

- (void)setLearningModulationMaskSkinGapModulationWeight:(float)a3
{
  self->_learningModulationMaskSkinGapModulationWeight = a3;
}

@end