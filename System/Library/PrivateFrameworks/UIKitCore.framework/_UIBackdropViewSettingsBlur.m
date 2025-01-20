@interface _UIBackdropViewSettingsBlur
- (void)computeOutputSettingsUsingModel:(id)a3;
- (void)setDefaultValues;
@end

@implementation _UIBackdropViewSettingsBlur

- (void)setDefaultValues
{
  v4.receiver = self;
  v4.super_class = (Class)_UIBackdropViewSettingsBlur;
  [(_UIBackdropViewSettings *)&v4 setDefaultValues];
  [(_UIBackdropViewSettings *)self setBackdropVisible:1];
  [(_UIBackdropViewSettings *)self setGrayscaleTintLevel:0.0];
  [(_UIBackdropViewSettings *)self setGrayscaleTintAlpha:0.0];
  [(_UIBackdropViewSettings *)self setGrayscaleTintMaskAlpha:1.0];
  [(_UIBackdropViewSettings *)self setGrayscaleTintMaskImage:0];
  [(_UIBackdropViewSettings *)self setColorTint:0];
  [(_UIBackdropViewSettings *)self setColorTintAlpha:0.0];
  [(_UIBackdropViewSettings *)self setColorTintMaskAlpha:1.0];
  [(_UIBackdropViewSettings *)self setColorTintMaskImage:0];
  [(_UIBackdropViewSettings *)self setBlurRadius:30.0];
  [(_UIBackdropViewSettings *)self setSaturationDeltaFactor:1.25];
  [(_UIBackdropViewSettings *)self setFilterMaskAlpha:1.0];
  [(_UIBackdropViewSettings *)self setFilterMaskImage:0];
  v3 = +[UIColor whiteColor];
  [(_UIBackdropViewSettings *)self setLegibleColor:v3];
}

- (void)computeOutputSettingsUsingModel:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)_UIBackdropViewSettingsBlur;
  id v4 = a3;
  [(_UIBackdropViewSettings *)&v9 computeOutputSettingsUsingModel:v4];
  v5 = objc_msgSend(v4, "colorSettings", v9.receiver, v9.super_class);

  _UIBackdropViewComputeLegibleColorWithColorSettings(v5);
  double v7 = v6;

  v8 = +[UIColor colorWithWhite:v7 alpha:1.0];
  [(_UIBackdropViewSettings *)self setLegibleColor:v8];
}

@end