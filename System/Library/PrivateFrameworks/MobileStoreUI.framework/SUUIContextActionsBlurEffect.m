@interface SUUIContextActionsBlurEffect
+ (id)effectWithStyle:(int64_t)a3;
- (id)effectSettings;
@end

@implementation SUUIContextActionsBlurEffect

+ (id)effectWithStyle:(int64_t)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___SUUIContextActionsBlurEffect;
  v3 = objc_msgSendSuper2(&v5, sel_effectWithStyle_, a3);
  return v3;
}

- (id)effectSettings
{
  v7.receiver = self;
  v7.super_class = (Class)SUUIContextActionsBlurEffect;
  v2 = [(UIBlurEffect *)&v7 effectSettings];
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
    objc_super v5 = [MEMORY[0x263F825C8] blackColor];
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