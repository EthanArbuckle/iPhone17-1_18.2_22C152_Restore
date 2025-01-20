@interface SBSystemNotesSettings
+ (BOOL)ignoresKey:(id)a3;
+ (id)settingsControllerModule;
- (SBCornerFingerPanGestureSettings)fingerSwipeGestureTuningSettings;
- (SBCornerPencilPanGestureSettings)pencilSwipeGestureTuningSettings;
- (SBPIPShadowSettings)shadowSettings;
- (SBPIPStashVisualSettings)stashVisualSettings;
- (SBSystemNotesAppearanceSettings)appearanceSettings;
- (SBSystemNotesInteractionSettings)interactionSettings;
- (SBSystemNotesLaunchSettings)launchSettings;
- (SBSystemNotesSwipeMetricSettings)cornerSwipeMetricSettings;
- (void)setAppearanceSettings:(id)a3;
- (void)setCornerSwipeMetricSettings:(id)a3;
- (void)setDefaultValues;
- (void)setFingerSwipeGestureTuningSettings:(id)a3;
- (void)setInteractionSettings:(id)a3;
- (void)setLaunchSettings:(id)a3;
- (void)setPencilSwipeGestureTuningSettings:(id)a3;
- (void)setShadowSettings:(id)a3;
- (void)setStashVisualSettings:(id)a3;
@end

@implementation SBSystemNotesSettings

- (void)setDefaultValues
{
  v9.receiver = self;
  v9.super_class = (Class)SBSystemNotesSettings;
  [(PTSettings *)&v9 setDefaultValues];
  v3 = [(PTSettings *)[SBPIPStashVisualSettings alloc] initWithDefaultValues];
  [(SBPIPStashVisualSettings *)v3 setUserInterfaceStyle:0];
  v4 = [(PTSettings *)[SBPIPStashMaterialSettings alloc] initWithDefaultValues];
  [(SBPIPStashMaterialSettings *)v4 setDarkTintAlpha:0.35];
  [(SBPIPStashMaterialSettings *)v4 setLightTintAlpha:0.14];
  [(SBPIPStashVisualSettings *)v3 setLightModeMaterialSettings:v4];
  [(SBSystemNotesSettings *)self setStashVisualSettings:v3];
  v5 = [(PTSettings *)[SBDropShadowSettings alloc] initWithDefaultValues];
  [(SBDropShadowSettings *)v5 setOpacity:0.25];
  [(SBDropShadowSettings *)v5 setRadius:20.0];
  [(SBDropShadowSettings *)v5 setOffsetX:0.0];
  [(SBDropShadowSettings *)v5 setOffsetY:0.0];
  [(SBDropShadowSettings *)v5 setContinuousCornerRadius:20.0];
  v6 = [(SBSystemNotesSettings *)self shadowSettings];
  [v6 setBodyShadowSettings:v5];

  v7 = [(PTSettings *)[SBDropShadowSettings alloc] initWithDefaultValues];
  [(SBDropShadowSettings *)v7 setOpacity:0.5];
  [(SBDropShadowSettings *)v7 setRadius:75.0];
  [(SBDropShadowSettings *)v7 setOffsetX:0.0];
  [(SBDropShadowSettings *)v7 setOffsetY:15.0];
  [(SBDropShadowSettings *)v7 setContinuousCornerRadius:20.0];
  v8 = [(PTSettings *)[SBPIPShadowSettings alloc] initWithDefaultValues];
  [(SBPIPShadowSettings *)v8 setBodyShadowSettings:v5];
  [(SBPIPShadowSettings *)v8 setTabShadowSettings:v7];
  [(SBSystemNotesSettings *)self setShadowSettings:v8];
}

+ (id)settingsControllerModule
{
  v26[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F94168];
  v3 = (void *)MEMORY[0x1E4F94100];
  v4 = [MEMORY[0x1E4F94178] actionWithSettingsKeyPath:0];
  v5 = [v3 rowWithTitle:@"Restore Defaults" action:v4];
  v26[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
  v23 = [v2 sectionWithRows:v6 title:@"Restore Default Values"];

  v22 = [MEMORY[0x1E4F94138] rowWithTitle:@"Swipe-In Metrics" childSettingsKeyPath:@"cornerSwipeMetricSettings"];
  v21 = [MEMORY[0x1E4F94138] rowWithTitle:@"Pencil Swipe-In Tunings" childSettingsKeyPath:@"pencilSwipeGestureTuningSettings"];
  v20 = [MEMORY[0x1E4F94138] rowWithTitle:@"Finger Swipe-In Tunings" childSettingsKeyPath:@"fingerSwipeGestureTuningSettings"];
  v19 = [MEMORY[0x1E4F94138] rowWithTitle:@"Stash Visual Settings" childSettingsKeyPath:@"stashVisualSettings"];
  v7 = [MEMORY[0x1E4F94138] rowWithTitle:@"Drop Shadow Settings" childSettingsKeyPath:@"shadowSettings"];
  uint64_t v8 = [MEMORY[0x1E4F94138] rowWithTitle:@"Interaction Settings" childSettingsKeyPath:@"interactionSettings"];
  objc_super v9 = [MEMORY[0x1E4F94138] rowWithTitle:@"Platter Appearance" childSettingsKeyPath:@"appearanceSettings"];
  v10 = [MEMORY[0x1E4F94138] rowWithTitle:@"Application Launch" childSettingsKeyPath:@"launchSettings"];
  v11 = (void *)MEMORY[0x1E4F94168];
  v25[0] = v22;
  v25[1] = v21;
  v25[2] = v20;
  v25[3] = v19;
  v25[4] = v7;
  v25[5] = v8;
  v12 = (void *)v8;
  v25[6] = v9;
  v25[7] = v10;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:8];
  v14 = [v11 sectionWithRows:v13 title:@"All Settings"];

  v15 = (void *)MEMORY[0x1E4F94168];
  v24[0] = v23;
  v24[1] = v14;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
  v17 = [v15 moduleWithTitle:@"System Notes Settings" contents:v16];

  return v17;
}

+ (BOOL)ignoresKey:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"pencilSettings"]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 isEqualToString:@"fingerSettings"];
  }

  return v4;
}

- (SBSystemNotesAppearanceSettings)appearanceSettings
{
  return self->_appearanceSettings;
}

- (void)setAppearanceSettings:(id)a3
{
}

- (SBSystemNotesLaunchSettings)launchSettings
{
  return self->_launchSettings;
}

- (void)setLaunchSettings:(id)a3
{
}

- (SBPIPStashVisualSettings)stashVisualSettings
{
  return self->_stashVisualSettings;
}

- (void)setStashVisualSettings:(id)a3
{
}

- (SBPIPShadowSettings)shadowSettings
{
  return self->_shadowSettings;
}

- (void)setShadowSettings:(id)a3
{
}

- (SBSystemNotesInteractionSettings)interactionSettings
{
  return self->_interactionSettings;
}

- (void)setInteractionSettings:(id)a3
{
}

- (SBSystemNotesSwipeMetricSettings)cornerSwipeMetricSettings
{
  return self->_cornerSwipeMetricSettings;
}

- (void)setCornerSwipeMetricSettings:(id)a3
{
}

- (SBCornerPencilPanGestureSettings)pencilSwipeGestureTuningSettings
{
  return self->_pencilSwipeGestureTuningSettings;
}

- (void)setPencilSwipeGestureTuningSettings:(id)a3
{
}

- (SBCornerFingerPanGestureSettings)fingerSwipeGestureTuningSettings
{
  return self->_fingerSwipeGestureTuningSettings;
}

- (void)setFingerSwipeGestureTuningSettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fingerSwipeGestureTuningSettings, 0);
  objc_storeStrong((id *)&self->_pencilSwipeGestureTuningSettings, 0);
  objc_storeStrong((id *)&self->_cornerSwipeMetricSettings, 0);
  objc_storeStrong((id *)&self->_interactionSettings, 0);
  objc_storeStrong((id *)&self->_shadowSettings, 0);
  objc_storeStrong((id *)&self->_stashVisualSettings, 0);
  objc_storeStrong((id *)&self->_launchSettings, 0);
  objc_storeStrong((id *)&self->_appearanceSettings, 0);
}

@end