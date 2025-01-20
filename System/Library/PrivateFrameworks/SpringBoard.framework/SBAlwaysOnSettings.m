@interface SBAlwaysOnSettings
+ (id)settingsControllerModule;
- (SBAlwaysOnAPLSettings)aplSettings;
- (SBAlwaysOnPolicySettings)policySettings;
- (int64_t)sideButtonBehavior;
- (void)setAplSettings:(id)a3;
- (void)setDefaultValues;
- (void)setPolicySettings:(id)a3;
- (void)setSideButtonBehavior:(int64_t)a3;
@end

@implementation SBAlwaysOnSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)SBAlwaysOnSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(SBAlwaysOnPolicySettings *)self->_policySettings setDefaultValues];
  [(SBAlwaysOnAPLSettings *)self->_aplSettings setDefaultValues];
}

+ (id)settingsControllerModule
{
  v29[3] = *MEMORY[0x1E4F143B8];
  v22 = [MEMORY[0x1E4F94110] rowWithTitle:@"Sleep Behavior" valueKeyPath:@"sideButtonBehavior"];
  v28[0] = &unk_1F334AB20;
  v28[1] = &unk_1F334AB38;
  v29[0] = @"To Always On";
  v29[1] = @"To Off";
  v28[2] = &unk_1F334AB50;
  v29[2] = @"To Off from Always On";
  v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:3];
  v2 = [v23 allKeys];
  [v22 setPossibleValues:v2];

  objc_super v3 = [v23 allValues];
  [v22 setPossibleTitles:v3];

  v4 = (void *)MEMORY[0x1E4F94168];
  v27 = v22;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
  v6 = [v4 sectionWithRows:v5 title:@"Side Button"];

  v7 = [MEMORY[0x1E4F94138] rowWithTitle:@"Policy Settings" childSettingsKeyPath:@"policySettings"];
  v8 = [MEMORY[0x1E4F94138] rowWithTitle:@"APL Settings" childSettingsKeyPath:@"aplSettings"];
  v9 = (void *)MEMORY[0x1E4F94168];
  v26[0] = v7;
  v26[1] = v8;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
  v11 = [v9 sectionWithRows:v10 title:0];

  v12 = (void *)MEMORY[0x1E4F94100];
  v13 = [MEMORY[0x1E4F94178] actionWithSettingsKeyPath:0];
  v14 = [v12 rowWithTitle:@"Restore Defaults" action:v13];

  v15 = (void *)MEMORY[0x1E4F94168];
  v25 = v14;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
  v17 = [v15 sectionWithRows:v16];

  v18 = (void *)MEMORY[0x1E4F94168];
  v24[0] = v6;
  v24[1] = v11;
  v24[2] = v17;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:3];
  v20 = [v18 moduleWithTitle:@"Andromeda" contents:v19];

  return v20;
}

- (int64_t)sideButtonBehavior
{
  return self->_sideButtonBehavior;
}

- (void)setSideButtonBehavior:(int64_t)a3
{
  self->_sideButtonBehavior = a3;
}

- (SBAlwaysOnPolicySettings)policySettings
{
  return self->_policySettings;
}

- (void)setPolicySettings:(id)a3
{
}

- (SBAlwaysOnAPLSettings)aplSettings
{
  return self->_aplSettings;
}

- (void)setAplSettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aplSettings, 0);
  objc_storeStrong((id *)&self->_policySettings, 0);
}

@end