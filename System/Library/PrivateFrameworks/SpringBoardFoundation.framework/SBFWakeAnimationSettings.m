@interface SBFWakeAnimationSettings
+ (id)settingsControllerModule;
- (SBFAnimationSettings)awakeWallpaperFilterSettings;
- (SBFAnimationSettings)contentWakeSettings;
- (SBFAnimationSettings)sleepWallpaperFilterSettings;
- (double)awakeColorBrightness;
- (double)awakeDateAlpha;
- (double)backlightFadeDuration;
- (double)sleepColorBrightness;
- (double)speedMultiplierForLiftToWake;
- (double)speedMultiplierForMagicKeyboardExtended;
- (double)speedMultiplierForWake;
- (void)setAwakeColorBrightness:(double)a3;
- (void)setAwakeDateAlpha:(double)a3;
- (void)setAwakeWallpaperFilterSettings:(id)a3;
- (void)setBacklightFadeDuration:(double)a3;
- (void)setContentWakeSettings:(id)a3;
- (void)setDefaultValues;
- (void)setSleepColorBrightness:(double)a3;
- (void)setSleepWallpaperFilterSettings:(id)a3;
- (void)setSpeedMultiplierForLiftToWake:(double)a3;
- (void)setSpeedMultiplierForMagicKeyboardExtended:(double)a3;
- (void)setSpeedMultiplierForWake:(double)a3;
@end

@implementation SBFWakeAnimationSettings

- (void)setDefaultValues
{
  self->_backlightFadeDuration = 0.185;
  self->_speedMultiplierForWake = 1.0;
  self->_speedMultiplierForLiftToWake = 1.0;
  self->_speedMultiplierForMagicKeyboardExtended = 0.3;
  self->_awakeColorBrightness = 0.0;
  self->_awakeDateAlpha = 1.0;
  self->_sleepColorBrightness = -1.0;
  v3 = [(SBFWakeAnimationSettings *)self contentWakeSettings];
  [v3 setAnimationType:0];

  v4 = [(SBFWakeAnimationSettings *)self contentWakeSettings];
  [v4 setDelay:0.0];

  v5 = [(SBFWakeAnimationSettings *)self contentWakeSettings];
  [v5 setDuration:0.185];

  v6 = [(SBFWakeAnimationSettings *)self contentWakeSettings];
  [v6 setCurve:393216];

  v7 = [(SBFWakeAnimationSettings *)self contentWakeSettings];
  v8 = [v7 controlPoint1Settings];
  objc_msgSend(v8, "setPointValue:", 0.25, 0.1);

  v9 = [(SBFWakeAnimationSettings *)self contentWakeSettings];
  v10 = [v9 controlPoint2Settings];
  objc_msgSend(v10, "setPointValue:", 0.25, 1.0);

  v11 = [(SBFWakeAnimationSettings *)self awakeWallpaperFilterSettings];
  [v11 setAnimationType:0];

  v12 = [(SBFWakeAnimationSettings *)self awakeWallpaperFilterSettings];
  [v12 setDelay:0.0];

  v13 = [(SBFWakeAnimationSettings *)self awakeWallpaperFilterSettings];
  [v13 setDuration:0.65];

  v14 = [(SBFWakeAnimationSettings *)self awakeWallpaperFilterSettings];
  [v14 setCurve:393216];

  v15 = [(SBFWakeAnimationSettings *)self awakeWallpaperFilterSettings];
  v16 = [v15 controlPoint1Settings];
  objc_msgSend(v16, "setPointValue:", 0.25, 0.1);

  v17 = [(SBFWakeAnimationSettings *)self awakeWallpaperFilterSettings];
  v18 = [v17 controlPoint2Settings];
  objc_msgSend(v18, "setPointValue:", 0.25, 1.0);

  v19 = [(SBFWakeAnimationSettings *)self sleepWallpaperFilterSettings];
  [v19 setAnimationType:0];

  v20 = [(SBFWakeAnimationSettings *)self sleepWallpaperFilterSettings];
  [v20 setDelay:0.0];

  v21 = [(SBFWakeAnimationSettings *)self sleepWallpaperFilterSettings];
  [v21 setDuration:0.65];

  v22 = [(SBFWakeAnimationSettings *)self sleepWallpaperFilterSettings];
  [v22 setCurve:393216];

  v23 = [(SBFWakeAnimationSettings *)self sleepWallpaperFilterSettings];
  v24 = [v23 controlPoint1Settings];
  objc_msgSend(v24, "setPointValue:", 0.25, 0.1);

  id v26 = [(SBFWakeAnimationSettings *)self sleepWallpaperFilterSettings];
  v25 = [v26 controlPoint2Settings];
  objc_msgSend(v25, "setPointValue:", 0.25, 1.0);
}

+ (id)settingsControllerModule
{
  v49[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F94168];
  v3 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Backlight Fade Duration" valueKeyPath:@"backlightFadeDuration"];
  v4 = [v3 minValue:0.0 maxValue:1.0];
  v49[0] = v4;
  v5 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Backlight Fade In Speed Multiplier" valueKeyPath:@"speedMultiplierForWake"];
  v6 = [v5 minValue:0.0 maxValue:1.0];
  v49[1] = v6;
  v7 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Lift-to-Wake Speed Multiplier" valueKeyPath:@"speedMultiplierForLiftToWake"];
  v8 = [v7 minValue:0.0 maxValue:10.0];
  v49[2] = v8;
  v9 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Magic Keyboard (Extended Wake) Speed Multiplier" valueKeyPath:@"speedMultiplierForMagicKeyboardExtended"];
  v10 = [v9 minValue:0.0 maxValue:1.0];
  v49[3] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:4];
  v43 = [v2 sectionWithRows:v11 title:@"Backlight Fades"];

  v12 = (void *)MEMORY[0x1E4F94168];
  v13 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Awake Color Brightness" valueKeyPath:@"awakeColorBrightness"];
  v14 = [v13 minValue:-1.0 maxValue:0.0];
  v48[0] = v14;
  v15 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Awake Date Alpha" valueKeyPath:@"awakeDateAlpha"];
  v16 = [v15 minValue:0.0 maxValue:1.0];
  v48[1] = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:2];
  v42 = [v12 sectionWithRows:v17 title:@"Awake Values"];

  v18 = (void *)MEMORY[0x1E4F94168];
  v19 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Sleep Color Brightness" valueKeyPath:@"sleepColorBrightness"];
  v20 = [v19 minValue:-1.0 maxValue:1.0];
  v47 = v20;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v47 count:1];
  v41 = [v18 sectionWithRows:v21 title:@"Sleep Values"];

  v22 = (void *)MEMORY[0x1E4F94168];
  v23 = +[SBFAnimationSettings _moduleWithSectionTitle:@"Awake Content Animation" delay:1 frameRate:0];
  v40 = [v22 submoduleWithModule:v23 childSettingsKeyPath:@"contentWakeSettings"];

  v24 = (void *)MEMORY[0x1E4F94168];
  v25 = +[SBFAnimationSettings _moduleWithSectionTitle:@"Awake Wallpaper Filter Animation" delay:1 frameRate:0];
  id v26 = [v24 submoduleWithModule:v25 childSettingsKeyPath:@"awakeWallpaperFilterSettings"];

  v27 = (void *)MEMORY[0x1E4F94168];
  v46[0] = v40;
  v46[1] = v26;
  v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:2];
  v29 = [v27 moduleWithTitle:@"Awake" contents:v28];

  v30 = (void *)MEMORY[0x1E4F94168];
  v31 = +[SBFAnimationSettings _moduleWithSectionTitle:@"Sleep Wallpaper Filter Animation" delay:1 frameRate:0];
  v32 = [v30 submoduleWithModule:v31 childSettingsKeyPath:@"sleepWallpaperFilterSettings"];

  v33 = (void *)MEMORY[0x1E4F94168];
  v45 = v32;
  v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v45 count:1];
  v35 = [v33 moduleWithTitle:@"Undim" contents:v34];

  v36 = (void *)MEMORY[0x1E4F94168];
  v44[0] = v43;
  v44[1] = v42;
  v44[2] = v29;
  v44[3] = v41;
  v44[4] = v35;
  v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:5];
  v38 = [v36 moduleWithTitle:@"Screen Dim/Undim Animation" contents:v37];

  return v38;
}

- (double)backlightFadeDuration
{
  return self->_backlightFadeDuration;
}

- (void)setBacklightFadeDuration:(double)a3
{
  self->_backlightFadeDuration = a3;
}

- (double)speedMultiplierForWake
{
  return self->_speedMultiplierForWake;
}

- (void)setSpeedMultiplierForWake:(double)a3
{
  self->_speedMultiplierForWake = a3;
}

- (double)speedMultiplierForLiftToWake
{
  return self->_speedMultiplierForLiftToWake;
}

- (void)setSpeedMultiplierForLiftToWake:(double)a3
{
  self->_speedMultiplierForLiftToWake = a3;
}

- (double)speedMultiplierForMagicKeyboardExtended
{
  return self->_speedMultiplierForMagicKeyboardExtended;
}

- (void)setSpeedMultiplierForMagicKeyboardExtended:(double)a3
{
  self->_speedMultiplierForMagicKeyboardExtended = a3;
}

- (SBFAnimationSettings)contentWakeSettings
{
  return self->_contentWakeSettings;
}

- (void)setContentWakeSettings:(id)a3
{
}

- (double)awakeColorBrightness
{
  return self->_awakeColorBrightness;
}

- (void)setAwakeColorBrightness:(double)a3
{
  self->_awakeColorBrightness = a3;
}

- (double)awakeDateAlpha
{
  return self->_awakeDateAlpha;
}

- (void)setAwakeDateAlpha:(double)a3
{
  self->_awakeDateAlpha = a3;
}

- (SBFAnimationSettings)awakeWallpaperFilterSettings
{
  return self->_awakeWallpaperFilterSettings;
}

- (void)setAwakeWallpaperFilterSettings:(id)a3
{
}

- (double)sleepColorBrightness
{
  return self->_sleepColorBrightness;
}

- (void)setSleepColorBrightness:(double)a3
{
  self->_sleepColorBrightness = a3;
}

- (SBFAnimationSettings)sleepWallpaperFilterSettings
{
  return self->_sleepWallpaperFilterSettings;
}

- (void)setSleepWallpaperFilterSettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sleepWallpaperFilterSettings, 0);
  objc_storeStrong((id *)&self->_awakeWallpaperFilterSettings, 0);
  objc_storeStrong((id *)&self->_contentWakeSettings, 0);
}

@end