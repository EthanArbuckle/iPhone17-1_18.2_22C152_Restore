@interface MusicContextActionsBlurEffect
+ (id)effectWithStyle:(int64_t)a3;
+ (int64_t)blurEffectStyleWithPrivateStyle:(int64_t)a3;
- (id)effectSettings;
@end

@implementation MusicContextActionsBlurEffect

+ (int64_t)blurEffectStyleWithPrivateStyle:(int64_t)a3
{
  return a3;
}

+ (id)effectWithStyle:(int64_t)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___MusicContextActionsBlurEffect;
  v3 = [super effectWithStyle:a3];

  return v3;
}

- (id)effectSettings
{
  v7.receiver = self;
  v7.super_class = (Class)MusicContextActionsBlurEffect;
  v2 = [(MusicContextActionsBlurEffect *)&v7 effectSettings];
  [v2 setScale:0.5];
  if (UIAccessibilityIsReduceTransparencyEnabled())
  {
    double v3 = 0.0;
    [v2 setBlurRadius:0.0];
    double v4 = 0.4;
  }
  else
  {
    [v2 setBlurRadius:8.0];
    objc_super v5 = +[UIColor blackColor];
    [v2 setColorTint:v5];

    [v2 setColorTintAlpha:0.2];
    double v3 = 0.025;
    double v4 = 0.1;
  }
  [v2 setGrayscaleTintLevel:0.0];
  [v2 setGrayscaleTintAlpha:v4];
  [v2 setZoom:v3];

  return v2;
}

@end