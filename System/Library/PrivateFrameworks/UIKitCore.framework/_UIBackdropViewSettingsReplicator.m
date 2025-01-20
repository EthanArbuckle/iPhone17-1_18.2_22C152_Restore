@interface _UIBackdropViewSettingsReplicator
- (BOOL)isBackdropVisible;
- (BOOL)requiresBackdropLayer;
- (void)setDefaultValues;
@end

@implementation _UIBackdropViewSettingsReplicator

- (void)setDefaultValues
{
  v12.receiver = self;
  v12.super_class = (Class)_UIBackdropViewSettingsReplicator;
  [(_UIBackdropViewSettings *)&v12 setDefaultValues];
  [(_UIBackdropViewSettings *)self setBackdropVisible:1];
  [(_UIBackdropViewSettings *)self setGrayscaleTintLevel:0.0];
  [(_UIBackdropViewSettings *)self setGrayscaleTintAlpha:0.0];
  [(_UIBackdropViewSettings *)self setGrayscaleTintMaskAlpha:1.0];
  [(_UIBackdropViewSettings *)self setGrayscaleTintMaskImage:0];
  [(_UIBackdropViewSettings *)self setColorTint:0];
  [(_UIBackdropViewSettings *)self setColorTintAlpha:0.0];
  [(_UIBackdropViewSettings *)self setColorTintMaskAlpha:1.0];
  [(_UIBackdropViewSettings *)self setColorTintMaskImage:0];
  self->super._blurRadius = 0.0;
  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)&self->super._saturationDeltaFactor = _Q0;
  filterMaskImage = self->super._filterMaskImage;
  self->super._filterMaskImage = 0;

  v9 = +[UIScreen mainScreen];
  [v9 scale];
  self->super._scale = v10;

  self->super._requiresColorStatistics = 0;
  v11 = +[UIColor whiteColor];
  [(_UIBackdropViewSettings *)self setLegibleColor:v11];
}

- (BOOL)requiresBackdropLayer
{
  return 1;
}

- (BOOL)isBackdropVisible
{
  return 1;
}

@end