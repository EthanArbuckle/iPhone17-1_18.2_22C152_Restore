@interface NSUserDefaults
- (BOOL)weather_vfx_animatedBackgrounds_enabled;
- (void)setWeather_vfx_animatedBackgrounds_enabled:(BOOL)a3;
@end

@implementation NSUserDefaults

- (BOOL)weather_vfx_animatedBackgrounds_enabled
{
  v2 = self;
  unsigned __int8 v3 = sub_100B7C41C();

  return v3 & 1;
}

- (void)setWeather_vfx_animatedBackgrounds_enabled:(BOOL)a3
{
  unsigned __int8 v3 = self;
  sub_100B7C4CC();
}

@end