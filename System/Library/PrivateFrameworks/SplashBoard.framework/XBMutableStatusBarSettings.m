@interface XBMutableStatusBarSettings
- (id)copyWithZone:(_NSZone *)a3;
- (void)setBackgroundActivityEnabled:(BOOL)a3;
- (void)setHidden:(BOOL)a3;
- (void)setStyle:(int64_t)a3;
@end

@implementation XBMutableStatusBarSettings

- (void)setHidden:(BOOL)a3
{
  settings = self->super._settings;
  uint64_t v4 = BSSettingFlagForBool();
  [(BSMutableSettings *)settings setFlag:v4 forSetting:1];
}

- (void)setStyle:(int64_t)a3
{
  settings = self->super._settings;
  id v4 = [NSNumber numberWithInteger:a3];
  [(BSMutableSettings *)settings setObject:v4 forSetting:2];
}

- (void)setBackgroundActivityEnabled:(BOOL)a3
{
  settings = self->super._settings;
  uint64_t v4 = BSSettingFlagForBool();
  [(BSMutableSettings *)settings setFlag:v4 forSetting:3];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [XBStatusBarSettings alloc];
  settings = self->super._settings;
  return [(XBStatusBarSettings *)v4 _initWithBSSettings:settings];
}

@end