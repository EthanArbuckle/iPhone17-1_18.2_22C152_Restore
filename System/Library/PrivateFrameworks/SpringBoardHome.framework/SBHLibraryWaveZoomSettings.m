@interface SBHLibraryWaveZoomSettings
+ (id)settingsControllerModule;
- (PTPointSettings)zEffectControlPoint1Settings;
- (PTPointSettings)zEffectControlPoint2Settings;
- (SBFAnimationSettings)podFadeSettings;
- (SBHInterpolationSettings)retargetedBasicDurationSettings;
- (SBHInterpolationSettings)retargetedInitialVelocitySettings;
- (SBHInterpolationSettings)retargetedMassSettings;
- (SBHInterpolationSettings)retargetedStiffnessSettings;
- (double)interPodWaveDelay;
- (double)podRelativeFadeDelay;
- (double)relativeBackgroundDuration;
- (double)relativeSearchDuration;
- (double)searchScale;
- (double)upperPodRelativeCrossfadeDuration;
- (double)upperPodRelativeStackAlphaDuration;
- (void)setDefaultValues;
- (void)setInterPodWaveDelay:(double)a3;
- (void)setPodFadeSettings:(id)a3;
- (void)setPodRelativeFadeDelay:(double)a3;
- (void)setRelativeBackgroundDuration:(double)a3;
- (void)setRelativeSearchDuration:(double)a3;
- (void)setRetargetedBasicDurationSettings:(id)a3;
- (void)setRetargetedInitialVelocitySettings:(id)a3;
- (void)setRetargetedMassSettings:(id)a3;
- (void)setRetargetedStiffnessSettings:(id)a3;
- (void)setSearchScale:(double)a3;
- (void)setUpperPodRelativeCrossfadeDuration:(double)a3;
- (void)setUpperPodRelativeStackAlphaDuration:(double)a3;
- (void)setZEffectControlPoint1Settings:(id)a3;
- (void)setZEffectControlPoint2Settings:(id)a3;
@end

@implementation SBHLibraryWaveZoomSettings

- (void)setDefaultValues
{
  v9.receiver = self;
  v9.super_class = (Class)SBHLibraryWaveZoomSettings;
  [(SBHIconZoomSettings *)&v9 setDefaultValues];
  v3 = [(SBHIconAnimationSettings *)self centralAnimationSettings];
  [v3 setCurve:196608];

  [(SBHLibraryWaveZoomSettings *)self setInterPodWaveDelay:0.02];
  [(SBHIconZoomSettings *)self setLabelAlphaWithZoom:1];
  [(SBHLibraryWaveZoomSettings *)self setSearchScale:0.945];
  v4 = [(SBHLibraryWaveZoomSettings *)self podFadeSettings];
  [v4 setAnimationType:1];

  v5 = [(SBHLibraryWaveZoomSettings *)self podFadeSettings];
  [v5 setMass:1.0];

  v6 = [(SBHLibraryWaveZoomSettings *)self podFadeSettings];
  [v6 setStiffness:885.288];

  v7 = [(SBHLibraryWaveZoomSettings *)self podFadeSettings];
  [v7 setDamping:59.5076];

  v8 = [(SBHLibraryWaveZoomSettings *)self podFadeSettings];
  [v8 setCurve:196608];
}

+ (id)settingsControllerModule
{
  v32[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F94160];
  v30.receiver = a1;
  v30.super_class = (Class)&OBJC_METACLASS___SBHLibraryWaveZoomSettings;
  v3 = objc_msgSendSuper2(&v30, sel_settingsControllerModule);
  v29 = [v2 submoduleWithModule:v3 childSettingsKeyPath:0];

  v4 = (void *)MEMORY[0x1E4F94160];
  v5 = __54__SBHLibraryWaveZoomSettings_settingsControllerModule__block_invoke();
  v28 = [v4 sectionWithRows:v5 title:@"Primary Settings"];

  v6 = (void *)MEMORY[0x1E4F94160];
  v7 = __54__SBHLibraryWaveZoomSettings_settingsControllerModule__block_invoke_2();
  v27 = [v6 sectionWithRows:v7 title:@"Retargeting Interpolation Settings"];

  v8 = (void *)MEMORY[0x1E4F94160];
  objc_super v9 = __54__SBHLibraryWaveZoomSettings_settingsControllerModule__block_invoke_3();
  v10 = [v8 sectionWithRows:v9 title:@"Pod Z-Effect [Scale + Y] Curve Settings"];

  v11 = (void *)MEMORY[0x1E4F94160];
  v12 = [MEMORY[0x1E4FA5E80] _moduleWithSectionTitle:@"Lower Pod Fade Settings" delay:0 frameRate:0];
  v13 = [v11 submoduleWithModule:v12 childSettingsKeyPath:@"podFadeSettings"];

  v14 = (void *)MEMORY[0x1E4F94160];
  v15 = __54__SBHLibraryWaveZoomSettings_settingsControllerModule__block_invoke_4();
  v16 = [v14 sectionWithRows:v15 title:0];

  v17 = (void *)MEMORY[0x1E4F94160];
  v18 = (void *)MEMORY[0x1E4F940F8];
  v19 = [MEMORY[0x1E4F94170] action];
  v20 = [v18 rowWithTitle:@"Restore Defaults" action:v19];
  v32[0] = v20;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
  v22 = [v17 sectionWithRows:v21];

  v23 = (void *)MEMORY[0x1E4F94160];
  v31[0] = v29;
  v31[1] = v28;
  v31[2] = v10;
  v31[3] = v13;
  v31[4] = v16;
  v31[5] = v27;
  v31[6] = v22;
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:7];
  v25 = [v23 moduleWithTitle:0 contents:v24];

  return v25;
}

id __54__SBHLibraryWaveZoomSettings_settingsControllerModule__block_invoke()
{
  v20[6] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F94148] rowWithTitle:@"Inter-Pod Wave Delay" valueKeyPath:@"interPodWaveDelay"];
  v1 = [v0 between:0.0 and:1.0];
  v2 = [v1 precision:4];

  v3 = [MEMORY[0x1E4F94148] rowWithTitle:@"Upper Pod Relative Crossfade Duration" valueKeyPath:@"upperPodRelativeCrossfadeDuration"];
  v4 = [v3 between:0.0 and:1.0];
  v5 = [v4 precision:3];

  v6 = [MEMORY[0x1E4F94148] rowWithTitle:@"Upper Pod Relative Stack Alpha Duration" valueKeyPath:@"upperPodRelativeStackAlphaDuration"];
  v7 = [v6 between:0.0 and:1.0];
  v8 = [v7 precision:3];

  objc_super v9 = [MEMORY[0x1E4F94148] rowWithTitle:@"Relative Background Duration" valueKeyPath:@"relativeBackgroundDuration"];
  v10 = [v9 between:0.0 and:1.0];
  v11 = [v10 precision:3];

  v12 = [MEMORY[0x1E4F94148] rowWithTitle:@"Relative Search Duration" valueKeyPath:@"relativeSearchDuration"];
  v13 = [v12 between:0.0 and:1.0];
  v14 = [v13 precision:3];

  v15 = [MEMORY[0x1E4F94148] rowWithTitle:@"Search Bar Scale" valueKeyPath:@"searchScale"];
  v16 = [v15 between:0.5 and:1.0];
  v17 = [v16 precision:3];

  v20[0] = v2;
  v20[1] = v5;
  v20[2] = v8;
  v20[3] = v11;
  v20[4] = v14;
  v20[5] = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:6];

  return v18;
}

id __54__SBHLibraryWaveZoomSettings_settingsControllerModule__block_invoke_2()
{
  v6[4] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F94130] rowWithTitle:@"Retargeted Mass Settings" childSettingsKeyPath:@"retargetedMassSettings"];
  v1 = [MEMORY[0x1E4F94130] rowWithTitle:@"Retargeted Stiffness Settings" childSettingsKeyPath:@"retargetedStiffnessSettings"];
  v2 = [MEMORY[0x1E4F94130] rowWithTitle:@"Retargeted Initial Velocity Settings" childSettingsKeyPath:@"retargetedInitialVelocitySettings"];
  v3 = [MEMORY[0x1E4F94130] rowWithTitle:@"Retargeted Basic Duration Settings" childSettingsKeyPath:@"retargetedBasicDurationSettings"];
  v6[0] = v0;
  v6[1] = v1;
  v6[2] = v2;
  v6[3] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:4];

  return v4;
}

id __54__SBHLibraryWaveZoomSettings_settingsControllerModule__block_invoke_3()
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F94130] rowWithTitle:@"Curve Control Point 1" childSettingsKeyPath:@"zEffectControlPoint1Settings"];
  v1 = [MEMORY[0x1E4F94130] rowWithTitle:@"Curve Control Point 2" childSettingsKeyPath:@"zEffectControlPoint2Settings"];
  v4[0] = v0;
  v4[1] = v1;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];

  return v2;
}

id __54__SBHLibraryWaveZoomSettings_settingsControllerModule__block_invoke_4()
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F94148] rowWithTitle:@"Lower Pod Relative Fade Delay" valueKeyPath:@"podRelativeFadeDelay"];
  v1 = [v0 between:0.0 and:1.0];
  v2 = [v1 precision:3];

  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (double)interPodWaveDelay
{
  return self->_interPodWaveDelay;
}

- (void)setInterPodWaveDelay:(double)a3
{
  self->_interPodWaveDelay = a3;
}

- (double)upperPodRelativeCrossfadeDuration
{
  return self->_upperPodRelativeCrossfadeDuration;
}

- (void)setUpperPodRelativeCrossfadeDuration:(double)a3
{
  self->_upperPodRelativeCrossfadeDuration = a3;
}

- (double)upperPodRelativeStackAlphaDuration
{
  return self->_upperPodRelativeStackAlphaDuration;
}

- (void)setUpperPodRelativeStackAlphaDuration:(double)a3
{
  self->_upperPodRelativeStackAlphaDuration = a3;
}

- (double)relativeBackgroundDuration
{
  return self->_relativeBackgroundDuration;
}

- (void)setRelativeBackgroundDuration:(double)a3
{
  self->_relativeBackgroundDuration = a3;
}

- (double)relativeSearchDuration
{
  return self->_relativeSearchDuration;
}

- (void)setRelativeSearchDuration:(double)a3
{
  self->_relativeSearchDuration = a3;
}

- (double)searchScale
{
  return self->_searchScale;
}

- (void)setSearchScale:(double)a3
{
  self->_searchScale = a3;
}

- (double)podRelativeFadeDelay
{
  return self->_podRelativeFadeDelay;
}

- (void)setPodRelativeFadeDelay:(double)a3
{
  self->_podRelativeFadeDelay = a3;
}

- (SBFAnimationSettings)podFadeSettings
{
  return self->_podFadeSettings;
}

- (void)setPodFadeSettings:(id)a3
{
}

- (PTPointSettings)zEffectControlPoint1Settings
{
  return self->_zEffectControlPoint1Settings;
}

- (void)setZEffectControlPoint1Settings:(id)a3
{
}

- (PTPointSettings)zEffectControlPoint2Settings
{
  return self->_zEffectControlPoint2Settings;
}

- (void)setZEffectControlPoint2Settings:(id)a3
{
}

- (SBHInterpolationSettings)retargetedMassSettings
{
  return self->_retargetedMassSettings;
}

- (void)setRetargetedMassSettings:(id)a3
{
}

- (SBHInterpolationSettings)retargetedStiffnessSettings
{
  return self->_retargetedStiffnessSettings;
}

- (void)setRetargetedStiffnessSettings:(id)a3
{
}

- (SBHInterpolationSettings)retargetedInitialVelocitySettings
{
  return self->_retargetedInitialVelocitySettings;
}

- (void)setRetargetedInitialVelocitySettings:(id)a3
{
}

- (SBHInterpolationSettings)retargetedBasicDurationSettings
{
  return self->_retargetedBasicDurationSettings;
}

- (void)setRetargetedBasicDurationSettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retargetedBasicDurationSettings, 0);
  objc_storeStrong((id *)&self->_retargetedInitialVelocitySettings, 0);
  objc_storeStrong((id *)&self->_retargetedStiffnessSettings, 0);
  objc_storeStrong((id *)&self->_retargetedMassSettings, 0);
  objc_storeStrong((id *)&self->_zEffectControlPoint2Settings, 0);
  objc_storeStrong((id *)&self->_zEffectControlPoint1Settings, 0);
  objc_storeStrong((id *)&self->_podFadeSettings, 0);
}

@end