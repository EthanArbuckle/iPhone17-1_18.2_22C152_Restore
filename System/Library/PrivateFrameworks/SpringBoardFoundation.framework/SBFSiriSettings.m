@interface SBFSiriSettings
+ (id)settingsControllerModule;
- (SBFSiriSystemAssistantExperienceSettings)systemAssistantExperienceSettings;
- (void)setDefaultValues;
- (void)setSystemAssistantExperienceSettings:(id)a3;
@end

@implementation SBFSiriSettings

- (SBFSiriSystemAssistantExperienceSettings)systemAssistantExperienceSettings
{
  return self->_systemAssistantExperienceSettings;
}

- (void)setDefaultValues
{
  v4.receiver = self;
  v4.super_class = (Class)SBFSiriSettings;
  [(PTSettings *)&v4 setDefaultValues];
  v3 = [(SBFSiriSettings *)self systemAssistantExperienceSettings];
  [v3 setDefaultValues];
}

+ (id)settingsControllerModule
{
  v17[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F94168];
  v3 = [MEMORY[0x1E4F94138] rowWithTitle:@"System Assistant Experience" childSettingsKeyPath:@"systemAssistantExperienceSettings"];
  v16 = v3;
  objc_super v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
  v5 = [v2 sectionWithRows:v4];
  v17[0] = v5;
  v6 = (void *)MEMORY[0x1E4F94168];
  v7 = (void *)MEMORY[0x1E4F94100];
  v8 = [MEMORY[0x1E4F94178] actionWithSettingsKeyPath:0];
  v9 = [v7 rowWithTitle:@"Restore Defaults" action:v8];
  v15 = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
  v11 = [v6 sectionWithRows:v10];
  v17[1] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  v13 = [v2 moduleWithTitle:0 contents:v12];

  return v13;
}

- (void)setSystemAssistantExperienceSettings:(id)a3
{
}

- (void).cxx_destruct
{
}

@end