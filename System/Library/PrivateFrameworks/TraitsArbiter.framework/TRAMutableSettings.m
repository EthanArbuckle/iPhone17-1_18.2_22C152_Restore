@interface TRAMutableSettings
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)setAmbientPresentationSettings:(id)a3;
- (void)setOrientationSettings:(id)a3;
- (void)setUserInterfaceStyleSettings:(id)a3;
- (void)setZOrderLevelSettings:(id)a3;
@end

@implementation TRAMutableSettings

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[TRASettings allocWithZone:a3];
  return [(TRASettings *)v4 initWithSettings:self];
}

- (void)setZOrderLevelSettings:(id)a3
{
  self->super._zOrderLevelSettings = (TRASettingsZOrderLevel *)[a3 copy];
  MEMORY[0x270F9A758]();
}

- (void)setUserInterfaceStyleSettings:(id)a3
{
  self->super._userInterfaceStyleSettings = (TRASettingsUserInterfaceStyle *)[a3 copy];
  MEMORY[0x270F9A758]();
}

- (void)setOrientationSettings:(id)a3
{
  self->super._orientationSettings = (TRASettingsOrientation *)[a3 copy];
  MEMORY[0x270F9A758]();
}

- (void)setAmbientPresentationSettings:(id)a3
{
  self->super._ambientPresentationSettings = (TRASettingsAmbientPresentation *)[a3 copy];
  MEMORY[0x270F9A758]();
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  return (id)[v4 initWithSettings:self];
}

@end