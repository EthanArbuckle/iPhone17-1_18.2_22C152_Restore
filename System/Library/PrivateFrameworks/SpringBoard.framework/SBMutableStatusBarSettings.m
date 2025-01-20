@interface SBMutableStatusBarSettings
- (SBMutableStatusBarSettings)init;
- (id)copyWithZone:(_NSZone *)a3;
- (void)applySettings:(id)a3;
- (void)setAlpha:(id)a3;
- (void)setBackgroundActivitiesToSuppress:(id)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setStyle:(int64_t)a3;
@end

@implementation SBMutableStatusBarSettings

- (void)setAlpha:(id)a3
{
}

- (SBMutableStatusBarSettings)init
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
  v4 = [(SBStatusBarSettings *)self _initWithBSSettings:v3];

  return v4;
}

- (void)applySettings:(id)a3
{
  settings = self->super._settings;
  id v4 = [a3 _BSSettings];
  [(BSMutableSettings *)settings applySettings:v4];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [SBStatusBarSettings alloc];
  settings = self->super._settings;
  return [(SBStatusBarSettings *)v4 _initWithBSSettings:settings];
}

- (void)setStyle:(int64_t)a3
{
  settings = self->super._settings;
  id v4 = [NSNumber numberWithInteger:a3];
  [(BSMutableSettings *)settings setObject:v4 forSetting:2];
}

- (void)setLegibilitySettings:(id)a3
{
}

- (void)setBackgroundActivitiesToSuppress:(id)a3
{
}

@end