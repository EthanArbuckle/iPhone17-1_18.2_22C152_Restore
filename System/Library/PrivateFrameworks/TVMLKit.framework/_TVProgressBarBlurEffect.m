@interface _TVProgressBarBlurEffect
- (id)effectSettings;
@end

@implementation _TVProgressBarBlurEffect

- (id)effectSettings
{
  v5.receiver = self;
  v5.super_class = (Class)_TVProgressBarBlurEffect;
  v2 = [(UIBlurEffect *)&v5 effectSettings];
  v3 = [MEMORY[0x263F1C550] whiteColor];
  [v2 setColorTint:v3];

  [v2 setColorTintAlpha:0.25];
  [v2 setSaturationDeltaFactor:1.6];
  [v2 setBlurRadius:30.0];
  return v2;
}

@end