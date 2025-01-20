@interface SBSystemActionSettings
+ (id)settingsControllerModule;
- (SBSystemActionCoachingSettings)coachingSettings;
- (SBSystemActionPreviewSettings)previewSettings;
- (void)setDefaultValues;
@end

@implementation SBSystemActionSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)SBSystemActionSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(SBSystemActionPreviewSettings *)self->_previewSettings setDefaultValues];
  [(SBSystemActionCoachingSettings *)self->_coachingSettings setDefaultValues];
}

+ (id)settingsControllerModule
{
  v23[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F94100];
  objc_super v3 = [MEMORY[0x1E4F94178] actionWithSettingsKeyPath:0];
  v4 = [v2 rowWithTitle:@"Restore Defaults" action:v3];

  v5 = (void *)MEMORY[0x1E4F94168];
  v23[0] = v4;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  v7 = [v5 sectionWithRows:v6];

  v8 = [MEMORY[0x1E4F94138] rowWithTitle:@"Previews" childSettingsKeyPath:@"previewSettings"];
  v9 = (void *)MEMORY[0x1E4F94168];
  v22 = v8;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
  v11 = [v9 sectionWithRows:v10];

  v12 = [MEMORY[0x1E4F94138] rowWithTitle:@"Coaching" childSettingsKeyPath:@"coachingSettings"];
  v13 = (void *)MEMORY[0x1E4F94168];
  v21 = v12;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
  v15 = [v13 sectionWithRows:v14];

  v16 = (void *)MEMORY[0x1E4F94168];
  v20[0] = v7;
  v20[1] = v11;
  v20[2] = v15;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:3];
  v18 = [v16 moduleWithTitle:@"System Action" contents:v17];

  return v18;
}

- (SBSystemActionPreviewSettings)previewSettings
{
  return self->_previewSettings;
}

- (SBSystemActionCoachingSettings)coachingSettings
{
  return self->_coachingSettings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coachingSettings, 0);
  objc_storeStrong((id *)&self->_previewSettings, 0);
}

@end