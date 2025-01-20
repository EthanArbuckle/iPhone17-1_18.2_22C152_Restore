@interface SBPIPShadowSettings
+ (id)settingsControllerModule;
- (SBDropShadowSettings)bodyShadowSettings;
- (SBDropShadowSettings)tabShadowSettings;
- (void)setBodyShadowSettings:(id)a3;
- (void)setTabShadowSettings:(id)a3;
@end

@implementation SBPIPShadowSettings

+ (id)settingsControllerModule
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F94168];
  v3 = +[SBDropShadowSettings moduleWithSectionTitle:@"Body Shadow"];
  v4 = [v2 submoduleWithModule:v3 childSettingsKeyPath:@"bodyShadowSettings"];

  v5 = (void *)MEMORY[0x1E4F94168];
  v6 = +[SBDropShadowSettings moduleWithSectionTitle:@"Tab Shadow"];
  v7 = [v5 submoduleWithModule:v6 childSettingsKeyPath:@"tabShadowSettings"];

  v8 = (void *)MEMORY[0x1E4F94168];
  v12[0] = v4;
  v12[1] = v7;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  v10 = [v8 moduleWithTitle:@"Drop Shadow" contents:v9];

  return v10;
}

- (SBDropShadowSettings)bodyShadowSettings
{
  return self->_bodyShadowSettings;
}

- (void)setBodyShadowSettings:(id)a3
{
}

- (SBDropShadowSettings)tabShadowSettings
{
  return self->_tabShadowSettings;
}

- (void)setTabShadowSettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabShadowSettings, 0);
  objc_storeStrong((id *)&self->_bodyShadowSettings, 0);
}

@end