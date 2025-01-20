@interface UIPointerEffect
+ (UIPointerEffect)effectWithPreview:(UITargetedPreview *)preview;
- (BOOL)allowsSanitization;
- (BOOL)isEqual:(id)a3;
- (BOOL)useSoftShadow;
- (CGPoint)slipFactor;
- (NSValue)overrideSlipPoints;
- (UITargetedPreview)preview;
- (UIViewSpringAnimationBehavior)liftProgressSpring;
- (double)dampedAnimationDampingRatio;
- (double)dampedAnimationResponse;
- (double)defaultPointerCornerRadius;
- (double)liftForceExponent;
- (double)liftProgressFloor;
- (double)maxSlip;
- (double)parallaxAmount;
- (double)scaleUpAnimationDampingRatio;
- (double)scaleUpAnimationResponse;
- (double)scaleUpPoints;
- (id)copyWithZone:(_NSZone *)a3;
- (id)settings;
- (id)tintColorMatrixProvider;
- (unint64_t)constrainedAxes;
- (unint64_t)hash;
- (unint64_t)options;
- (void)setPreview:(id)a3;
@end

@implementation UIPointerEffect

+ (UIPointerEffect)effectWithPreview:(UITargetedPreview *)preview
{
  v3 = preview;
  v4 = objc_opt_new();
  [v4 setPreview:v3];

  return (UIPointerEffect *)v4;
}

- (unint64_t)options
{
  return 256;
}

- (id)settings
{
  v2 = +[_UIPointerSettingsDomain rootSettings];
  v3 = [v2 highlightEffectSettings];

  return v3;
}

- (unint64_t)constrainedAxes
{
  return 3;
}

- (NSValue)overrideSlipPoints
{
  return 0;
}

- (CGPoint)slipFactor
{
  v3 = [(UIPointerEffect *)self settings];
  [v3 slipFactorX];
  double v5 = v4;
  v6 = [(UIPointerEffect *)self settings];
  [v6 slipFactorY];
  double v8 = v7;

  double v9 = v5;
  double v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

- (double)maxSlip
{
  v2 = [(UIPointerEffect *)self settings];
  [v2 maxSlipPoints];
  double v4 = v3;

  return v4;
}

- (double)parallaxAmount
{
  v2 = [(UIPointerEffect *)self settings];
  [v2 parallaxAmount];
  double v4 = v3;

  return v4;
}

- (double)scaleUpPoints
{
  v2 = [(UIPointerEffect *)self settings];
  [v2 scaleUpPoints];
  double v4 = v3;

  return v4;
}

- (double)defaultPointerCornerRadius
{
  v2 = [(UIPointerEffect *)self settings];
  [v2 defaultPointerCornerRadius];
  double v4 = v3;

  return v4;
}

- (double)scaleUpAnimationResponse
{
  v2 = [(UIPointerEffect *)self settings];
  [v2 scaleUpAnimationResponse];
  double v4 = v3;

  return v4;
}

- (double)scaleUpAnimationDampingRatio
{
  v2 = [(UIPointerEffect *)self settings];
  [v2 scaleUpAnimationDampingRatio];
  double v4 = v3;

  return v4;
}

- (double)dampedAnimationResponse
{
  v2 = [(UIPointerEffect *)self settings];
  [v2 dampedAnimationResponse];
  double v4 = v3;

  return v4;
}

- (double)dampedAnimationDampingRatio
{
  v2 = [(UIPointerEffect *)self settings];
  [v2 dampedAnimationDampingRatio];
  double v4 = v3;

  return v4;
}

- (double)liftProgressFloor
{
  v2 = [(UIPointerEffect *)self settings];
  [v2 liftForceFloor];
  double v4 = v3;

  return v4;
}

- (double)liftForceExponent
{
  v2 = [(UIPointerEffect *)self settings];
  [v2 liftForceExponent];
  double v4 = v3;

  return v4;
}

- (UIViewSpringAnimationBehavior)liftProgressSpring
{
  v2 = [(UIPointerEffect *)self settings];
  double v3 = [v2 liftProgress];
  double v4 = [v3 springAnimationBehavior];

  return (UIViewSpringAnimationBehavior *)v4;
}

- (BOOL)useSoftShadow
{
  return 1;
}

- (BOOL)allowsSanitization
{
  return 1;
}

- (id)tintColorMatrixProvider
{
  __int16 v2 = [(UIPointerEffect *)self options];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __42__UIPointerEffect_tintColorMatrixProvider__block_invoke;
  aBlock[3] = &__block_descriptor_33_e17___NSValue_16__0Q8l;
  BOOL v6 = (v2 & 0x4000) != 0;
  double v3 = _Block_copy(aBlock);
  return v3;
}

id __42__UIPointerEffect_tintColorMatrixProvider__block_invoke(uint64_t a1, uint64_t a2)
{
  double v4 = PSContentOverlayVibrantColorMatrixForLuminance();
  double v5 = v4;
  if (a2 == 2 && *(unsigned char *)(a1 + 32))
  {
    long long v6 = 0uLL;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v20 = 0u;
    if (v4)
    {
      [v4 CAColorMatrixValue];
      long long v6 = 0uLL;
    }
    long long v18 = v6;
    long long v19 = v6;
    long long v16 = v6;
    long long v17 = v6;
    long long v15 = v6;
    CAColorMatrixMakeBrightness();
    v9[12] = v22;
    v9[13] = v23;
    v9[14] = v24;
    v9[10] = v20;
    v9[11] = v21;
    v9[7] = v17;
    v9[8] = v18;
    v9[9] = v19;
    v9[5] = v15;
    v9[6] = v16;
    CAColorMatrixConcat();
    long long v23 = v13;
    long long v24 = v14;
    long long v21 = v11;
    long long v22 = v12;
    long long v20 = v10;
    v9[3] = v13;
    v9[4] = v14;
    v9[1] = v11;
    v9[2] = v12;
    v9[0] = v10;
    uint64_t v7 = [MEMORY[0x1E4F29238] valueWithBytes:v9 objCType:"{CAColorMatrix=ffffffffffffffffffff}"];

    double v5 = (void *)v7;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  double v5 = [(UIPointerEffect *)self preview];
  [v4 setPreview:v5];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (UIPointerEffect *)a3;
  if (v4 == self)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v5 = v4;
      long long v6 = [(UIPointerEffect *)self preview];
      uint64_t v7 = [(UIPointerEffect *)v5 preview];
      id v8 = v6;
      id v9 = v7;
      long long v10 = v9;
      if (v8 == v9)
      {
        char v11 = 1;
      }
      else
      {
        char v11 = 0;
        if (v8 && v9) {
          char v11 = [v8 isEqual:v9];
        }
      }
    }
    else
    {
      char v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  __int16 v2 = [(UIPointerEffect *)self preview];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (UITargetedPreview)preview
{
  return self->_preview;
}

- (void)setPreview:(id)a3
{
}

- (void).cxx_destruct
{
}

@end