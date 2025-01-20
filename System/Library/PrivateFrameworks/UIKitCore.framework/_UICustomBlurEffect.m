@interface _UICustomBlurEffect
+ (id)effectWithStyle:(int64_t)a3;
- (BOOL)darkenWithSourceOver;
- (BOOL)lightenGrayscaleWithSourceOver;
- (UIColor)colorTint;
- (double)blurRadius;
- (double)colorBurnTintAlpha;
- (double)colorBurnTintLevel;
- (double)colorTintAlpha;
- (double)darkeningTintAlpha;
- (double)darkeningTintHue;
- (double)darkeningTintSaturation;
- (double)grayscaleTintAlpha;
- (double)grayscaleTintLevel;
- (double)saturationDeltaFactor;
- (double)scale;
- (double)zoom;
- (id)effectSettings;
@end

@implementation _UICustomBlurEffect

+ (id)effectWithStyle:(int64_t)a3
{
  v3 = objc_opt_new();
  return v3;
}

- (double)grayscaleTintLevel
{
  return 0.0;
}

- (double)grayscaleTintAlpha
{
  return 0.0;
}

- (BOOL)lightenGrayscaleWithSourceOver
{
  return 0;
}

- (UIColor)colorTint
{
  return 0;
}

- (double)colorTintAlpha
{
  return 0.0;
}

- (double)colorBurnTintLevel
{
  return 0.0;
}

- (double)colorBurnTintAlpha
{
  return 0.0;
}

- (double)darkeningTintAlpha
{
  return 0.0;
}

- (double)darkeningTintHue
{
  return 0.0;
}

- (double)darkeningTintSaturation
{
  return 0.0;
}

- (BOOL)darkenWithSourceOver
{
  return 0;
}

- (double)blurRadius
{
  return 0.0;
}

- (double)saturationDeltaFactor
{
  return 0.0;
}

- (double)scale
{
  return 0.0;
}

- (double)zoom
{
  return 0.0;
}

- (id)effectSettings
{
  return 0;
}

@end