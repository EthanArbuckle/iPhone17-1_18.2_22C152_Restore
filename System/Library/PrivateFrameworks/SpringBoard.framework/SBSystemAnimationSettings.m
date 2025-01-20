@interface SBSystemAnimationSettings
+ (id)settingsControllerModule;
- (SBEntityRemovalAnimationSettings)entityRemovalAnimationSettings;
- (SBFAnimationSettings)slideoverDosidoAnimationSettings;
- (SBFWakeAnimationSettings)wakeAnimationSettings;
- (float)assistantAnimationDuration;
- (float)assistantBottomEdgeDismissThreshold;
- (float)assistantBottomEdgeDismissVelocity;
- (float)assistantDismissAnimationDurationOverApp;
- (float)spotlightNoninteractiveAnimationDuration;
- (void)setAssistantAnimationDuration:(float)a3;
- (void)setAssistantBottomEdgeDismissThreshold:(float)a3;
- (void)setAssistantBottomEdgeDismissVelocity:(float)a3;
- (void)setAssistantDismissAnimationDurationOverApp:(float)a3;
- (void)setDefaultValues;
- (void)setEntityRemovalAnimationSettings:(id)a3;
- (void)setSlideoverDosidoAnimationSettings:(id)a3;
- (void)setSpotlightNoninteractiveAnimationDuration:(float)a3;
- (void)setWakeAnimationSettings:(id)a3;
@end

@implementation SBSystemAnimationSettings

- (void)setDefaultValues
{
  LODWORD(v2) = 1050253722;
  [(SBSystemAnimationSettings *)self setAssistantAnimationDuration:v2];
  LODWORD(v4) = 0.5;
  [(SBSystemAnimationSettings *)self setAssistantDismissAnimationDurationOverApp:v4];
  LODWORD(v5) = 1109393408;
  [(SBSystemAnimationSettings *)self setAssistantBottomEdgeDismissThreshold:v5];
  LODWORD(v6) = 1137180672;
  [(SBSystemAnimationSettings *)self setAssistantBottomEdgeDismissVelocity:v6];
  LODWORD(v7) = 1053609165;
  [(SBSystemAnimationSettings *)self setSpotlightNoninteractiveAnimationDuration:v7];
  v8 = [(SBSystemAnimationSettings *)self slideoverDosidoAnimationSettings];
  [v8 setAnimationType:1];

  v9 = [(SBSystemAnimationSettings *)self slideoverDosidoAnimationSettings];
  [v9 setDelay:0.0];

  v10 = [(SBSystemAnimationSettings *)self slideoverDosidoAnimationSettings];
  [v10 setDuration:0.58];

  v11 = [(SBSystemAnimationSettings *)self slideoverDosidoAnimationSettings];
  [v11 setMass:4.0];

  v12 = [(SBSystemAnimationSettings *)self slideoverDosidoAnimationSettings];
  [v12 setStiffness:1000.0];

  v13 = [(SBSystemAnimationSettings *)self slideoverDosidoAnimationSettings];
  [v13 setDamping:500.0];

  id v14 = [(SBSystemAnimationSettings *)self slideoverDosidoAnimationSettings];
  [v14 setCurve:0x10000];
}

+ (id)settingsControllerModule
{
  v45[1] = *MEMORY[0x1E4F143B8];
  double v2 = (void *)MEMORY[0x1E4F94168];
  v3 = [MEMORY[0x1E4F94138] rowWithTitle:@"Wake Animation" childSettingsKeyPath:@"wakeAnimationSettings"];
  v45[0] = v3;
  double v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:1];
  v40 = [v2 sectionWithRows:v4];

  v39 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Siri Present/Dismiss Duration" valueKeyPath:@"assistantAnimationDuration"];
  v38 = [v39 minValue:0.0 maxValue:1.0];
  v44[0] = v38;
  v37 = [MEMORY[0x1E4F94140] rowWithTitle:@"Siri Present/Dismiss Duration" valueKeyPath:@"assistantAnimationDuration"];
  double v5 = [v37 between:0.0 and:1.0];
  v44[1] = v5;
  double v6 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Siri Dismiss Duration (over app)" valueKeyPath:@"assistantDismissAnimationDurationOverApp"];
  double v7 = [v6 minValue:0.0 maxValue:1.0];
  v44[2] = v7;
  v8 = [MEMORY[0x1E4F94140] rowWithTitle:@"Siri Dismiss Duration (over app)" valueKeyPath:@"assistantDismissAnimationDurationOverApp"];
  v9 = [v8 between:0.0 and:1.0];
  v44[3] = v9;
  v10 = [MEMORY[0x1E4F94140] rowWithTitle:@"Siri Dismiss Bottom Edge Threshold" valueKeyPath:@"assistantBottomEdgeDismissThreshold"];
  v11 = [v10 between:0.0 and:1000.0];
  v44[4] = v11;
  v12 = [MEMORY[0x1E4F94140] rowWithTitle:@"Siri Dismiss Bottom Edge Velocity" valueKeyPath:@"assistantBottomEdgeDismissVelocity"];
  v13 = [v12 between:0.0 and:9000.0];
  v44[5] = v13;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:6];

  v15 = [MEMORY[0x1E4F94168] sectionWithRows:v14 title:@"Siri"];
  v16 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Spotlight Non-interactive Animation" valueKeyPath:@"spotlightNoninteractiveAnimationDuration"];
  v17 = [v16 minValue:0.0 maxValue:1.0];
  v43[0] = v17;
  v18 = [MEMORY[0x1E4F94140] rowWithTitle:@"Spotlight Non-interactive Animation" valueKeyPath:@"spotlightNoninteractiveAnimationDuration"];
  v19 = [v18 between:0.0 and:1.0];
  v43[1] = v19;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:2];

  v21 = [MEMORY[0x1E4F94168] sectionWithRows:v20 title:@"Spotlight"];
  v22 = (void *)MEMORY[0x1E4F94168];
  v23 = [MEMORY[0x1E4FA5E80] _moduleWithSectionTitle:@"Slideover Dosido" delay:0 frameRate:0];
  v24 = [v22 submoduleWithModule:v23 childSettingsKeyPath:@"slideoverDosidoAnimationSettings"];

  v25 = (void *)MEMORY[0x1E4F94168];
  v26 = +[SBEntityRemovalAnimationSettings settingsControllerModule];
  v27 = [v25 submoduleWithModule:v26 childSettingsKeyPath:@"entityRemovalAnimationSettings"];

  v28 = (void *)MEMORY[0x1E4F94100];
  v29 = [MEMORY[0x1E4F94178] actionWithSettingsKeyPath:0];
  v30 = [v28 rowWithTitle:@"Restore Defaults" action:v29];
  v42 = v30;
  v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v42 count:1];

  v32 = [MEMORY[0x1E4F94168] sectionWithRows:v31];
  v33 = (void *)MEMORY[0x1E4F94168];
  v41[0] = v40;
  v41[1] = v15;
  v41[2] = v21;
  v41[3] = v27;
  v41[4] = v24;
  v41[5] = v32;
  v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:6];
  v35 = [v33 moduleWithTitle:@"System Animations" contents:v34];

  return v35;
}

- (float)assistantAnimationDuration
{
  return self->_assistantAnimationDuration;
}

- (void)setAssistantAnimationDuration:(float)a3
{
  self->_assistantAnimationDuration = a3;
}

- (float)assistantDismissAnimationDurationOverApp
{
  return self->_assistantDismissAnimationDurationOverApp;
}

- (void)setAssistantDismissAnimationDurationOverApp:(float)a3
{
  self->_assistantDismissAnimationDurationOverApp = a3;
}

- (float)assistantBottomEdgeDismissThreshold
{
  return self->_assistantBottomEdgeDismissThreshold;
}

- (void)setAssistantBottomEdgeDismissThreshold:(float)a3
{
  self->_assistantBottomEdgeDismissThreshold = a3;
}

- (float)assistantBottomEdgeDismissVelocity
{
  return self->_assistantBottomEdgeDismissVelocity;
}

- (void)setAssistantBottomEdgeDismissVelocity:(float)a3
{
  self->_assistantBottomEdgeDismissVelocity = a3;
}

- (float)spotlightNoninteractiveAnimationDuration
{
  return self->_spotlightNoninteractiveAnimationDuration;
}

- (void)setSpotlightNoninteractiveAnimationDuration:(float)a3
{
  self->_spotlightNoninteractiveAnimationDuration = a3;
}

- (SBFAnimationSettings)slideoverDosidoAnimationSettings
{
  return self->_slideoverDosidoAnimationSettings;
}

- (void)setSlideoverDosidoAnimationSettings:(id)a3
{
}

- (SBEntityRemovalAnimationSettings)entityRemovalAnimationSettings
{
  return self->_entityRemovalAnimationSettings;
}

- (void)setEntityRemovalAnimationSettings:(id)a3
{
}

- (SBFWakeAnimationSettings)wakeAnimationSettings
{
  return self->_wakeAnimationSettings;
}

- (void)setWakeAnimationSettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wakeAnimationSettings, 0);
  objc_storeStrong((id *)&self->_entityRemovalAnimationSettings, 0);
  objc_storeStrong((id *)&self->_slideoverDosidoAnimationSettings, 0);
}

@end