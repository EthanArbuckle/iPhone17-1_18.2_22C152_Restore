@interface _UIBackdropViewSettingsDarkWithZoom
- (void)setDefaultValues;
@end

@implementation _UIBackdropViewSettingsDarkWithZoom

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)_UIBackdropViewSettingsDarkWithZoom;
  [(_UIBackdropViewSettingsDark *)&v3 setDefaultValues];
  self->super.super._zoom = 0.05;
}

@end