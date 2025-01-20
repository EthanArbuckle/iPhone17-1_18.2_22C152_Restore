@interface SBBlurItemContainerParameters
+ (id)defaultCrossblurBlurParameters;
- (BOOL)shouldRasterize;
- (SBBlurItemContainerParameters)initWithBlurRadius:(double)a3 shouldRasterize:(BOOL)a4 rasterizationScale:(double)a5 inputQuality:(int64_t)a6 inputIntermediateBitDepth:(int64_t)a7 blurAnimationSettings:(id)a8;
- (SBFFluidBehaviorSettings)blurAnimationSettings;
- (double)blurRadius;
- (double)rasterizationScale;
- (int64_t)inputIntermediateBitDepth;
- (int64_t)inputQuality;
@end

@implementation SBBlurItemContainerParameters

- (void).cxx_destruct
{
}

- (SBFFluidBehaviorSettings)blurAnimationSettings
{
  return self->_blurAnimationSettings;
}

+ (id)defaultCrossblurBlurParameters
{
  v2 = +[SBAppSwitcherDomain rootSettings];
  v3 = [v2 animationSettings];

  v4 = [SBBlurItemContainerParameters alloc];
  [v3 crossblurDosidoBlurRadius];
  double v6 = v5;
  [v3 crossblurRasterizationScale];
  double v8 = v7;
  v9 = [v3 crossblurDosidoSettings];
  v10 = [(SBBlurItemContainerParameters *)v4 initWithBlurRadius:0 shouldRasterize:1 rasterizationScale:1 inputQuality:v9 inputIntermediateBitDepth:v6 blurAnimationSettings:v8];

  return v10;
}

- (SBBlurItemContainerParameters)initWithBlurRadius:(double)a3 shouldRasterize:(BOOL)a4 rasterizationScale:(double)a5 inputQuality:(int64_t)a6 inputIntermediateBitDepth:(int64_t)a7 blurAnimationSettings:(id)a8
{
  id v15 = a8;
  v19.receiver = self;
  v19.super_class = (Class)SBBlurItemContainerParameters;
  v16 = [(SBBlurItemContainerParameters *)&v19 init];
  v17 = v16;
  if (v16)
  {
    v16->_shouldRasterize = a4;
    v16->_blurRadius = a3;
    v16->_rasterizationScale = a5;
    v16->_inputQuality = a6;
    v16->_inputIntermediateBitDepth = a7;
    objc_storeStrong((id *)&v16->_blurAnimationSettings, a8);
  }

  return v17;
}

- (double)blurRadius
{
  return self->_blurRadius;
}

- (BOOL)shouldRasterize
{
  return self->_shouldRasterize;
}

- (double)rasterizationScale
{
  return self->_rasterizationScale;
}

- (int64_t)inputQuality
{
  return self->_inputQuality;
}

- (int64_t)inputIntermediateBitDepth
{
  return self->_inputIntermediateBitDepth;
}

@end