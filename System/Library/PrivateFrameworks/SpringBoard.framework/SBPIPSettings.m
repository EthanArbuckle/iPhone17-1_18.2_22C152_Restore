@interface SBPIPSettings
+ (id)settingsControllerModule;
- (SBPIPFadeInOutSettings)fadeInOutSettings;
- (SBPIPFluidTransitionsSettings)fluidTransitionsSettings;
- (SBPIPInteractionSettings)interactionSettings;
- (SBPIPShadowSettings)shadowSettings;
- (SBPIPSizingSettings)sizingSettings;
- (SBPIPStashVisualSettings)stashVisualSettings;
- (void)setFadeInOutSettings:(id)a3;
- (void)setFluidTransitionsSettings:(id)a3;
- (void)setInteractionSettings:(id)a3;
- (void)setShadowSettings:(id)a3;
- (void)setSizingSettings:(id)a3;
- (void)setStashVisualSettings:(id)a3;
@end

@implementation SBPIPSettings

+ (id)settingsControllerModule
{
  v49[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F94100];
  v3 = [MEMORY[0x1E4F94178] actionWithSettingsKeyPath:0];
  v41 = [v2 rowWithTitle:@"Restore Defaults" action:v3];

  v4 = (void *)MEMORY[0x1E4F94168];
  v49[0] = v41;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:1];
  v34 = [v4 sectionWithRows:v5 title:@"Restore Default Values"];

  uint64_t v6 = [MEMORY[0x1E4F94138] rowWithTitle:@"User Interaction" childSettingsKeyPath:@"interactionSettings"];
  v7 = (void *)MEMORY[0x1E4F94168];
  uint64_t v48 = v6;
  uint64_t v8 = v6;
  v40 = (void *)v6;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v48 count:1];
  v10 = [v7 sectionWithRows:v9 title:@"User interaction"];

  v39 = [MEMORY[0x1E4F94138] rowWithTitle:@"AutoPIP and Fluid Restore" childSettingsKeyPath:@"fluidTransitionsSettings"];
  v11 = (void *)MEMORY[0x1E4F94168];
  v47[0] = v8;
  v47[1] = v39;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:2];
  v13 = [v11 sectionWithRows:v12 title:@"Morph animations"];

  v38 = [MEMORY[0x1E4F94138] rowWithTitle:@"Stash Visuals" childSettingsKeyPath:@"stashVisualSettings"];
  v14 = (void *)MEMORY[0x1E4F94168];
  v46 = v38;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v46 count:1];
  v36 = [v14 sectionWithRows:v15 title:@"Stash settings"];

  v16 = (void *)MEMORY[0x1E4F94138];
  v17 = NSStringFromSelector(sel_fadeInOutSettings);
  v37 = [v16 rowWithTitle:@"Fade in/out" childSettingsKeyPath:v17];

  v18 = (void *)MEMORY[0x1E4F94168];
  v45 = v37;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v45 count:1];
  v20 = [v18 sectionWithRows:v19 title:@"Fade in/out animations"];

  v35 = [MEMORY[0x1E4F94138] rowWithTitle:@"Drop Shadow" childSettingsKeyPath:@"shadowSettings"];
  v21 = (void *)MEMORY[0x1E4F94168];
  v44 = v35;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v44 count:1];
  v23 = [v21 sectionWithRows:v22 title:@"Drop Shadow Settings"];

  v24 = (void *)MEMORY[0x1E4F94138];
  v25 = NSStringFromSelector(sel_sizingSettings);
  v26 = [v24 rowWithTitle:@"Sizing settings" childSettingsKeyPath:v25];

  v27 = (void *)MEMORY[0x1E4F94168];
  v43 = v26;
  v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v43 count:1];
  v29 = [v27 sectionWithRows:v28 title:@"Sizing"];

  v30 = (void *)MEMORY[0x1E4F94168];
  v42[0] = v34;
  v42[1] = v10;
  v42[2] = v13;
  v42[3] = v36;
  v42[4] = v20;
  v42[5] = v23;
  v42[6] = v29;
  v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:7];
  v32 = [v30 moduleWithTitle:@"PIP Settings" contents:v31];

  return v32;
}

- (SBPIPStashVisualSettings)stashVisualSettings
{
  return self->_stashVisualSettings;
}

- (void)setStashVisualSettings:(id)a3
{
}

- (SBPIPInteractionSettings)interactionSettings
{
  return self->_interactionSettings;
}

- (void)setInteractionSettings:(id)a3
{
}

- (SBPIPFluidTransitionsSettings)fluidTransitionsSettings
{
  return self->_fluidTransitionsSettings;
}

- (void)setFluidTransitionsSettings:(id)a3
{
}

- (SBPIPFadeInOutSettings)fadeInOutSettings
{
  return self->_fadeInOutSettings;
}

- (void)setFadeInOutSettings:(id)a3
{
}

- (SBPIPShadowSettings)shadowSettings
{
  return self->_shadowSettings;
}

- (void)setShadowSettings:(id)a3
{
}

- (SBPIPSizingSettings)sizingSettings
{
  return self->_sizingSettings;
}

- (void)setSizingSettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sizingSettings, 0);
  objc_storeStrong((id *)&self->_shadowSettings, 0);
  objc_storeStrong((id *)&self->_fadeInOutSettings, 0);
  objc_storeStrong((id *)&self->_fluidTransitionsSettings, 0);
  objc_storeStrong((id *)&self->_interactionSettings, 0);
  objc_storeStrong((id *)&self->_stashVisualSettings, 0);
}

@end