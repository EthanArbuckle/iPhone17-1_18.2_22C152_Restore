@interface _UIBackdropViewSettingsLightEmojiKeyboard
- (BOOL)_shouldUseDarkeningTintLayer;
- (id)_defaultColorTintColorWithOpacity:(double)a3;
@end

@implementation _UIBackdropViewSettingsLightEmojiKeyboard

- (BOOL)_shouldUseDarkeningTintLayer
{
  return 0;
}

- (id)_defaultColorTintColorWithOpacity:(double)a3
{
  if ([(_UIBackdropViewSettings *)self graphicsQuality] == 40
    || [(_UIBackdropViewSettings *)self graphicsQuality] == 10)
  {
    double v5 = 0.901960784;
    double v6 = 0.917647059;
    double v7 = 0.937254902;
  }
  else
  {
    double v5 = 0.949019608;
    double v6 = 0.956862745;
    double v7 = 0.968627451;
  }
  v8 = +[UIColor colorWithRed:v5 green:v6 blue:v7 alpha:a3];
  return v8;
}

@end