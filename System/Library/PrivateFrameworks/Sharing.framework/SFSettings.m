@interface SFSettings
+ (id)settingsControllerModule;
- (SFMagicHeadSettings)magicHeadSettings;
- (void)setMagicHeadSettings:(id)a3;
@end

@implementation SFSettings

+ (id)settingsControllerModule
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F94130] rowWithTitle:@"Magic Head" childSettingsKeyPath:@"magicHeadSettings"];
  v10[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];

  v4 = (void *)MEMORY[0x1E4F94160];
  v5 = [MEMORY[0x1E4F94160] sectionWithRows:v3];
  v9 = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v9 count:1];
  v7 = [v4 moduleWithTitle:@"Settings for Features" contents:v6];

  return v7;
}

- (SFMagicHeadSettings)magicHeadSettings
{
  return self->_magicHeadSettings;
}

- (void)setMagicHeadSettings:(id)a3
{
}

- (void).cxx_destruct
{
}

@end