@interface SBElasticHUDSettings
+ (id)settingsControllerModule;
- (BOOL)autoDismiss;
- (BOOL)displayBrightnessKeyCommandsEnabled;
- (BOOL)keyboardBrightnessKeyCommandsEnabled;
- (BOOL)showDebugUI;
- (SBFFluidBehaviorSettings)baseToInitialPositionSettings;
- (SBFFluidBehaviorSettings)baseToInitialTransitionSettings;
- (SBFFluidBehaviorSettings)compactToBaseTransitionSettings;
- (SBFFluidBehaviorSettings)defaultPositionSettings;
- (SBFFluidBehaviorSettings)defaultTransitionSettings;
- (SBFFluidBehaviorSettings)deflatingToBasePositionSettings;
- (SBFFluidBehaviorSettings)deflatingToBaseTransitionSettings;
- (SBFFluidBehaviorSettings)deflationTransitionSettings;
- (SBFFluidBehaviorSettings)generalToBaseTransitionSettings;
- (double)baseScaleFactor;
- (double)compactStretchAmount;
- (double)deflatedScaleFactor;
- (double)deflationDismissalInterval;
- (double)dimmingAlpha;
- (double)dismissalInterval;
- (double)interactingStretchAmount;
- (double)labelPadding;
- (double)landscapeCornerRadiusFraction;
- (double)landscapeState1Height;
- (double)landscapeState1Width;
- (double)landscapeState2Height;
- (double)landscapeState2Width;
- (double)landscapeState3Height;
- (double)landscapeState3Width;
- (double)legibilityStrength;
- (double)offscreenLeadingMargin;
- (double)offscreenTopMargin;
- (double)onscreenLeadingMargin;
- (double)onscreenTopMargin;
- (double)portraitCornerRadiusFraction;
- (double)portraitState1Height;
- (double)portraitState1Width;
- (double)portraitState2Height;
- (double)portraitState2Width;
- (double)portraitState3Height;
- (double)portraitState3Width;
- (double)postTransitionDismissalInterval;
- (double)volumeButtonsCenterY;
- (float)volumeStepDelta;
- (void)setAutoDismiss:(BOOL)a3;
- (void)setBaseScaleFactor:(double)a3;
- (void)setBaseToInitialPositionSettings:(id)a3;
- (void)setBaseToInitialTransitionSettings:(id)a3;
- (void)setCompactStretchAmount:(double)a3;
- (void)setCompactToBaseTransitionSettings:(id)a3;
- (void)setDefaultPositionSettings:(id)a3;
- (void)setDefaultTransitionSettings:(id)a3;
- (void)setDefaultValues;
- (void)setDeflatedScaleFactor:(double)a3;
- (void)setDeflatingToBasePositionSettings:(id)a3;
- (void)setDeflatingToBaseTransitionSettings:(id)a3;
- (void)setDeflationDismissalInterval:(double)a3;
- (void)setDeflationTransitionSettings:(id)a3;
- (void)setDimmingAlpha:(double)a3;
- (void)setDismissalInterval:(double)a3;
- (void)setDisplayBrightnessKeyCommandsEnabled:(BOOL)a3;
- (void)setGeneralToBaseTransitionSettings:(id)a3;
- (void)setInteractingStretchAmount:(double)a3;
- (void)setKeyboardBrightnessKeyCommandsEnabled:(BOOL)a3;
- (void)setLabelPadding:(double)a3;
- (void)setLandscapeCornerRadiusFraction:(double)a3;
- (void)setLandscapeState1Height:(double)a3;
- (void)setLandscapeState1Width:(double)a3;
- (void)setLandscapeState2Height:(double)a3;
- (void)setLandscapeState2Width:(double)a3;
- (void)setLandscapeState3Height:(double)a3;
- (void)setLandscapeState3Width:(double)a3;
- (void)setLegibilityStrength:(double)a3;
- (void)setOffscreenLeadingMargin:(double)a3;
- (void)setOffscreenTopMargin:(double)a3;
- (void)setOnscreenLeadingMargin:(double)a3;
- (void)setOnscreenTopMargin:(double)a3;
- (void)setPortraitCornerRadiusFraction:(double)a3;
- (void)setPortraitState1Height:(double)a3;
- (void)setPortraitState1Width:(double)a3;
- (void)setPortraitState2Height:(double)a3;
- (void)setPortraitState2Width:(double)a3;
- (void)setPortraitState3Height:(double)a3;
- (void)setPortraitState3Width:(double)a3;
- (void)setPostTransitionDismissalInterval:(double)a3;
- (void)setShowDebugUI:(BOOL)a3;
- (void)setVolumeButtonsCenterY:(double)a3;
- (void)setVolumeStepDelta:(float)a3;
@end

@implementation SBElasticHUDSettings

- (void)setDefaultValues
{
  v4 = NSStringFromCGRect(*(CGRect *)&a1);
  OUTLINED_FUNCTION_10(&dword_1D85BA000, v5, v6, "(ElasticHUD) volumeUpButtonNormalizedFrame is invalid: %@", v7, v8, v9, v10, 2u);
}

double __40__SBElasticHUDSettings_setDefaultValues__block_invoke(int a1, CFTypeRef cf)
{
  double v2 = *MEMORY[0x1E4F1DB20];
  if (cf)
  {
    CFTypeID v4 = CFGetTypeID(cf);
    if (v4 == CFDataGetTypeID()) {
      double v2 = *(double *)CFDataGetBytePtr((CFDataRef)cf);
    }
    CFRelease(cf);
  }
  return v2;
}

+ (id)settingsControllerModule
{
  v67[9] = *MEMORY[0x1E4F143B8];
  double v2 = objc_opt_new();
  v3 = (void *)MEMORY[0x1E4F94168];
  CFTypeID v4 = __48__SBElasticHUDSettings_settingsControllerModule__block_invoke();
  uint64_t v5 = [v3 sectionWithRows:v4 title:@"Volume Control"];

  [v2 addObject:v5];
  uint64_t v6 = (void *)MEMORY[0x1E4F94168];
  uint64_t v7 = __48__SBElasticHUDSettings_settingsControllerModule__block_invoke_2();
  uint64_t v8 = [v6 sectionWithRows:v7 title:@"Brightness Control"];

  [v2 addObject:v8];
  uint64_t v9 = (void *)MEMORY[0x1E4F94168];
  v66 = [MEMORY[0x1E4F94138] rowWithTitle:@"Default (Transition)" childSettingsKeyPath:@"defaultTransitionSettings"];
  v67[0] = v66;
  v65 = [MEMORY[0x1E4F94138] rowWithTitle:@"Default (Position)" childSettingsKeyPath:@"defaultPositionSettings"];
  v67[1] = v65;
  uint64_t v10 = [MEMORY[0x1E4F94138] rowWithTitle:@"Base-to-Initial (Transition)" childSettingsKeyPath:@"baseToInitialTransitionSettings"];
  v67[2] = v10;
  v11 = [MEMORY[0x1E4F94138] rowWithTitle:@"Base-to-Initial (Position)" childSettingsKeyPath:@"baseToInitialPositionSettings"];
  v67[3] = v11;
  v12 = [MEMORY[0x1E4F94138] rowWithTitle:@"Deflation Transition" childSettingsKeyPath:@"deflationTransitionSettings"];
  v67[4] = v12;
  v13 = [MEMORY[0x1E4F94138] rowWithTitle:@"Deflated-to-Base (Transition)" childSettingsKeyPath:@"deflatingToBaseTransitionSettings"];
  v67[5] = v13;
  v14 = [MEMORY[0x1E4F94138] rowWithTitle:@"Deflated-to-Base (Position)" childSettingsKeyPath:@"deflatingToBasePositionSettings"];
  v67[6] = v14;
  v15 = [MEMORY[0x1E4F94138] rowWithTitle:@"General To-Base Transition" childSettingsKeyPath:@"generalToBaseTransitionSettings"];
  v67[7] = v15;
  v16 = [MEMORY[0x1E4F94138] rowWithTitle:@"Compact-To-Base Transition" childSettingsKeyPath:@"compactToBaseTransitionSettings"];
  v67[8] = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v67 count:9];
  v18 = [v9 sectionWithRows:v17 title:@"Animation Settings"];

  [v2 addObject:v18];
  v19 = (void *)MEMORY[0x1E4F94168];
  v20 = __48__SBElasticHUDSettings_settingsControllerModule__block_invoke_3();
  v21 = [v19 sectionWithRows:v20 title:@"Metrics"];

  [v2 addObject:v21];
  v22 = (void *)MEMORY[0x1E4F94168];
  v23 = __48__SBElasticHUDSettings_settingsControllerModule__block_invoke_4();
  v24 = [v22 sectionWithRows:v23 title:@"Dismissal Timing"];

  [v2 addObject:v24];
  v25 = (void *)MEMORY[0x1E4F94168];
  v26 = __48__SBElasticHUDSettings_settingsControllerModule__block_invoke_5();
  v27 = [v25 sectionWithRows:v26 title:@"Interaction Legibility"];

  [v2 addObject:v27];
  v28 = (void *)MEMORY[0x1E4F94168];
  v29 = __48__SBElasticHUDSettings_settingsControllerModule__block_invoke_6();
  v30 = [v28 sectionWithRows:v29 title:@"General Landscape"];

  [v2 addObject:v30];
  v31 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v32 = [v31 userInterfaceIdiom];

  if ((v32 & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    v33 = (void *)MEMORY[0x1E4F94168];
    v34 = __48__SBElasticHUDSettings_settingsControllerModule__block_invoke_7();
    v35 = [v33 sectionWithRows:v34 title:@"General Portrait"];

    [v2 addObject:v35];
  }
  v36 = (void *)MEMORY[0x1E4F94168];
  v37 = __48__SBElasticHUDSettings_settingsControllerModule__block_invoke_8();
  v38 = [v36 sectionWithRows:v37 title:@"Initial State Landscape"];

  [v2 addObject:v38];
  v39 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v40 = [v39 userInterfaceIdiom];

  if ((v40 & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    v41 = (void *)MEMORY[0x1E4F94168];
    v42 = __48__SBElasticHUDSettings_settingsControllerModule__block_invoke_9();
    v43 = [v41 sectionWithRows:v42 title:@"Initial State Portrait"];

    [v2 addObject:v43];
  }
  v44 = (void *)MEMORY[0x1E4F94168];
  v45 = __48__SBElasticHUDSettings_settingsControllerModule__block_invoke_10();
  v46 = [v44 sectionWithRows:v45 title:@"Compact State Landscape"];

  [v2 addObject:v46];
  v47 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v48 = [v47 userInterfaceIdiom];

  if ((v48 & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    v49 = (void *)MEMORY[0x1E4F94168];
    v50 = __48__SBElasticHUDSettings_settingsControllerModule__block_invoke_11();
    v51 = [v49 sectionWithRows:v50 title:@"Compact State Portrait"];

    [v2 addObject:v51];
  }
  v52 = (void *)MEMORY[0x1E4F94168];
  v53 = __48__SBElasticHUDSettings_settingsControllerModule__block_invoke_12();
  v54 = [v52 sectionWithRows:v53 title:@"Interacting State Landscape"];

  [v2 addObject:v54];
  v55 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v56 = [v55 userInterfaceIdiom];

  if ((v56 & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    v57 = (void *)MEMORY[0x1E4F94168];
    v58 = __48__SBElasticHUDSettings_settingsControllerModule__block_invoke_13();
    v59 = [v57 sectionWithRows:v58 title:@"Interacting State Portrait"];

    [v2 addObject:v59];
  }
  v60 = (void *)MEMORY[0x1E4F94168];
  v61 = __41__SBHUDSettings_settingsControllerModule__block_invoke_2();
  v62 = [v60 sectionWithRows:v61];

  [v2 addObject:v62];
  v63 = [MEMORY[0x1E4F94168] moduleWithTitle:@"Elastic HUD Settings" contents:v2];

  return v63;
}

id __48__SBElasticHUDSettings_settingsControllerModule__block_invoke()
{
  v0 = objc_opt_new();
  v1 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Volume Step" valueKeyPath:@"volumeStepDelta"];
  [v1 setMaxValue:0.1];
  [v1 setMinValue:0.01];
  [v0 addObject:v1];
  double v2 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Show Debug UI" valueKeyPath:@"showDebugUI"];
  v3 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Auto Dismiss" valueKeyPath:@"autoDismiss"];
  [v0 addObject:v2];
  [v0 addObject:v3];

  return v0;
}

id __48__SBElasticHUDSettings_settingsControllerModule__block_invoke_2()
{
  v0 = [MEMORY[0x1E4F1CA48] array];
  v1 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Change Display with ⌘+↑↓" valueKeyPath:@"displayBrightnessKeyCommandsEnabled"];
  double v2 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Change Keyboard with ^+⌘+↑↓" valueKeyPath:@"keyboardBrightnessKeyCommandsEnabled"];
  [v0 addObject:v1];
  [v0 addObject:v2];

  return v0;
}

id __48__SBElasticHUDSettings_settingsControllerModule__block_invoke_3()
{
  v10[5] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F94140] rowWithTitle:@"Base Scale Factor" valueKeyPath:@"baseScaleFactor"];
  v1 = [MEMORY[0x1E4F94140] rowWithTitle:@"Deflated Scale Factor" valueKeyPath:@"deflatedScaleFactor"];
  double v2 = [MEMORY[0x1E4F94140] rowWithTitle:@"Compact Stretch Amount" valueKeyPath:@"compactStretchAmount"];
  v3 = [v2 precision:3];

  CFTypeID v4 = [MEMORY[0x1E4F94140] rowWithTitle:@"Interacting Stretch Amount" valueKeyPath:@"interactingStretchAmount"];
  uint64_t v5 = [v4 precision:3];

  uint64_t v6 = [MEMORY[0x1E4F94140] rowWithTitle:@"Label Padding" valueKeyPath:@"labelPadding"];
  uint64_t v7 = [v6 precision:4];

  v10[0] = v0;
  v10[1] = v1;
  v10[2] = v3;
  v10[3] = v5;
  v10[4] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:5];

  return v8;
}

id __48__SBElasticHUDSettings_settingsControllerModule__block_invoke_4()
{
  v8[3] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F94140] rowWithTitle:@"Dismissal Interval" valueKeyPath:@"dismissalInterval"];
  v1 = [v0 precision:3];

  double v2 = [MEMORY[0x1E4F94140] rowWithTitle:@"Deflation Dismissal Interval" valueKeyPath:@"deflationDismissalInterval"];
  v3 = [v2 precision:3];

  CFTypeID v4 = [MEMORY[0x1E4F94140] rowWithTitle:@"Post-Transition Dismissal Interval" valueKeyPath:@"postTransitionDismissalInterval"];
  uint64_t v5 = [v4 precision:3];

  v8[0] = v1;
  v8[1] = v3;
  v8[2] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:3];

  return v6;
}

id __48__SBElasticHUDSettings_settingsControllerModule__block_invoke_5()
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F94140] rowWithTitle:@"Dimming Alpha" valueKeyPath:@"dimmingAlpha"];
  v1 = [MEMORY[0x1E4F94140] rowWithTitle:@"Legibility Strength" valueKeyPath:@"legibilityStrength"];
  v4[0] = v0;
  v4[1] = v1;
  double v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];

  return v2;
}

id __48__SBElasticHUDSettings_settingsControllerModule__block_invoke_6()
{
  v8[3] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F94140] rowWithTitle:@"On-screen Top Margin" valueKeyPath:@"onscreenTopMargin"];
  v1 = [v0 precision:4];

  double v2 = [MEMORY[0x1E4F94140] rowWithTitle:@"Off-screen Top Margin" valueKeyPath:@"offscreenTopMargin"];
  v3 = [v2 precision:4];

  CFTypeID v4 = [MEMORY[0x1E4F94140] rowWithTitle:@"Landscape Corner Radius Fraction" valueKeyPath:@"landscapeCornerRadiusFraction"];
  uint64_t v5 = [v4 precision:4];

  v8[0] = v3;
  v8[1] = v1;
  v8[2] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:3];

  return v6;
}

id __48__SBElasticHUDSettings_settingsControllerModule__block_invoke_7()
{
  v10[4] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F94140] rowWithTitle:@"Center Y Position" valueKeyPath:@"volumeButtonsCenterY"];
  v1 = [v0 precision:4];

  double v2 = [MEMORY[0x1E4F94140] rowWithTitle:@"On-screen Leading Margin" valueKeyPath:@"onscreenLeadingMargin"];
  v3 = [v2 precision:4];

  CFTypeID v4 = [MEMORY[0x1E4F94140] rowWithTitle:@"Off-screen Leading Margin" valueKeyPath:@"offscreenLeadingMargin"];
  uint64_t v5 = [v4 precision:4];

  uint64_t v6 = [MEMORY[0x1E4F94140] rowWithTitle:@"Portrait Corner Radius Fraction" valueKeyPath:@"portraitCornerRadiusFraction"];
  uint64_t v7 = [v6 precision:4];

  v10[0] = v1;
  v10[1] = v3;
  v10[2] = v5;
  v10[3] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:4];

  return v8;
}

id __48__SBElasticHUDSettings_settingsControllerModule__block_invoke_8()
{
  v0 = objc_opt_new();
  v1 = [MEMORY[0x1E4F941E0] rowWithTitle:@"width" valueKeyPath:@"landscapeState1Width"];
  double v2 = [MEMORY[0x1E4F42D90] mainScreen];
  [v2 bounds];
  CFTypeID v4 = [v1 minValue:50.0 maxValue:v3];

  [v0 addObject:v4];
  uint64_t v5 = [MEMORY[0x1E4F94140] rowWithTitle:@"width" valueKeyPath:@"landscapeState1Width"];
  [v0 addObject:v5];
  uint64_t v6 = [MEMORY[0x1E4F941E0] rowWithTitle:@"height" valueKeyPath:@"landscapeState1Height"];
  uint64_t v7 = [MEMORY[0x1E4F42D90] mainScreen];
  [v7 bounds];
  uint64_t v9 = [v6 minValue:5.0 maxValue:v8];

  [v0 addObject:v9];
  uint64_t v10 = [MEMORY[0x1E4F94140] rowWithTitle:@"height" valueKeyPath:@"landscapeState1Height"];
  [v0 addObject:v10];

  return v0;
}

id __48__SBElasticHUDSettings_settingsControllerModule__block_invoke_9()
{
  v0 = objc_opt_new();
  v1 = [MEMORY[0x1E4F941E0] rowWithTitle:@"width (slider)" valueKeyPath:@"portraitState1Width"];
  double v2 = [MEMORY[0x1E4F42D90] mainScreen];
  [v2 bounds];
  CFTypeID v4 = [v1 minValue:50.0 maxValue:v3];

  [v0 addObject:v4];
  uint64_t v5 = [MEMORY[0x1E4F94140] rowWithTitle:@"width" valueKeyPath:@"portraitState1Width"];
  [v0 addObject:v5];
  uint64_t v6 = [MEMORY[0x1E4F941E0] rowWithTitle:@"height (slider)" valueKeyPath:@"portraitState1Height"];
  uint64_t v7 = [MEMORY[0x1E4F42D90] mainScreen];
  [v7 bounds];
  uint64_t v9 = [v6 minValue:5.0 maxValue:v8];

  [v0 addObject:v9];
  uint64_t v10 = [MEMORY[0x1E4F94140] rowWithTitle:@"height" valueKeyPath:@"portraitState1Height"];
  [v0 addObject:v10];

  return v0;
}

id __48__SBElasticHUDSettings_settingsControllerModule__block_invoke_10()
{
  v0 = objc_opt_new();
  v1 = [MEMORY[0x1E4F941E0] rowWithTitle:@"width (slider)" valueKeyPath:@"landscapeState2Width"];
  double v2 = [MEMORY[0x1E4F42D90] mainScreen];
  [v2 bounds];
  CFTypeID v4 = [v1 minValue:50.0 maxValue:v3];

  [v0 addObject:v4];
  uint64_t v5 = [MEMORY[0x1E4F94140] rowWithTitle:@"width" valueKeyPath:@"landscapeState2Width"];
  [v0 addObject:v5];
  uint64_t v6 = [MEMORY[0x1E4F941E0] rowWithTitle:@"height (slider)" valueKeyPath:@"landscapeState2Height"];
  uint64_t v7 = [MEMORY[0x1E4F42D90] mainScreen];
  [v7 bounds];
  uint64_t v9 = [v6 minValue:5.0 maxValue:v8];

  [v0 addObject:v9];
  uint64_t v10 = [MEMORY[0x1E4F94140] rowWithTitle:@"height" valueKeyPath:@"landscapeState2Height"];
  [v0 addObject:v10];

  return v0;
}

id __48__SBElasticHUDSettings_settingsControllerModule__block_invoke_11()
{
  v0 = objc_opt_new();
  v1 = [MEMORY[0x1E4F941E0] rowWithTitle:@"width (slider)" valueKeyPath:@"portraitState2Width"];
  double v2 = [MEMORY[0x1E4F42D90] mainScreen];
  [v2 bounds];
  CFTypeID v4 = [v1 minValue:50.0 maxValue:v3];

  [v0 addObject:v4];
  uint64_t v5 = [MEMORY[0x1E4F94140] rowWithTitle:@"width" valueKeyPath:@"portraitState2Width"];
  [v0 addObject:v5];
  uint64_t v6 = [MEMORY[0x1E4F941E0] rowWithTitle:@"height (slider)" valueKeyPath:@"portraitState2Height"];
  uint64_t v7 = [MEMORY[0x1E4F42D90] mainScreen];
  [v7 bounds];
  uint64_t v9 = [v6 minValue:5.0 maxValue:v8];

  [v0 addObject:v9];
  uint64_t v10 = [MEMORY[0x1E4F94140] rowWithTitle:@"height" valueKeyPath:@"portraitState2Height"];
  [v0 addObject:v10];

  return v0;
}

id __48__SBElasticHUDSettings_settingsControllerModule__block_invoke_12()
{
  v0 = objc_opt_new();
  v1 = [MEMORY[0x1E4F941E0] rowWithTitle:@"width (slider)" valueKeyPath:@"landscapeState3Width"];
  double v2 = [MEMORY[0x1E4F42D90] mainScreen];
  [v2 bounds];
  CFTypeID v4 = [v1 minValue:50.0 maxValue:v3];

  [v0 addObject:v4];
  uint64_t v5 = [MEMORY[0x1E4F94140] rowWithTitle:@"width" valueKeyPath:@"landscapeState3Width"];
  [v0 addObject:v5];
  uint64_t v6 = [MEMORY[0x1E4F941E0] rowWithTitle:@"height (slider)" valueKeyPath:@"landscapeState3Height"];
  uint64_t v7 = [MEMORY[0x1E4F42D90] mainScreen];
  [v7 bounds];
  uint64_t v9 = [v6 minValue:5.0 maxValue:v8];

  [v0 addObject:v9];
  uint64_t v10 = [MEMORY[0x1E4F94140] rowWithTitle:@"height" valueKeyPath:@"landscapeState3Height"];
  [v0 addObject:v10];

  return v0;
}

id __48__SBElasticHUDSettings_settingsControllerModule__block_invoke_13()
{
  v0 = objc_opt_new();
  v1 = [MEMORY[0x1E4F941E0] rowWithTitle:@"width (slider)" valueKeyPath:@"portraitState3Width"];
  double v2 = [MEMORY[0x1E4F42D90] mainScreen];
  [v2 bounds];
  CFTypeID v4 = [v1 minValue:50.0 maxValue:v3];

  [v0 addObject:v4];
  uint64_t v5 = [MEMORY[0x1E4F94140] rowWithTitle:@"width" valueKeyPath:@"portraitState3Width"];
  [v0 addObject:v5];
  uint64_t v6 = [MEMORY[0x1E4F941E0] rowWithTitle:@"height (slider)" valueKeyPath:@"portraitState3Height"];
  uint64_t v7 = [MEMORY[0x1E4F42D90] mainScreen];
  [v7 bounds];
  uint64_t v9 = [v6 minValue:5.0 maxValue:v8];

  [v0 addObject:v9];
  uint64_t v10 = [MEMORY[0x1E4F94140] rowWithTitle:@"height" valueKeyPath:@"portraitState3Height"];
  [v0 addObject:v10];

  return v0;
}

- (SBFFluidBehaviorSettings)defaultTransitionSettings
{
  return self->_defaultTransitionSettings;
}

- (void)setDefaultTransitionSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)defaultPositionSettings
{
  return self->_defaultPositionSettings;
}

- (void)setDefaultPositionSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)baseToInitialTransitionSettings
{
  return self->_baseToInitialTransitionSettings;
}

- (void)setBaseToInitialTransitionSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)baseToInitialPositionSettings
{
  return self->_baseToInitialPositionSettings;
}

- (void)setBaseToInitialPositionSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)deflationTransitionSettings
{
  return self->_deflationTransitionSettings;
}

- (void)setDeflationTransitionSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)deflatingToBaseTransitionSettings
{
  return self->_deflatingToBaseTransitionSettings;
}

- (void)setDeflatingToBaseTransitionSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)deflatingToBasePositionSettings
{
  return self->_deflatingToBasePositionSettings;
}

- (void)setDeflatingToBasePositionSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)generalToBaseTransitionSettings
{
  return self->_generalToBaseTransitionSettings;
}

- (void)setGeneralToBaseTransitionSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)compactToBaseTransitionSettings
{
  return self->_compactToBaseTransitionSettings;
}

- (void)setCompactToBaseTransitionSettings:(id)a3
{
}

- (double)baseScaleFactor
{
  return self->_baseScaleFactor;
}

- (void)setBaseScaleFactor:(double)a3
{
  self->_baseScaleFactor = a3;
}

- (double)deflatedScaleFactor
{
  return self->_deflatedScaleFactor;
}

- (void)setDeflatedScaleFactor:(double)a3
{
  self->_deflatedScaleFactor = a3;
}

- (double)compactStretchAmount
{
  return self->_compactStretchAmount;
}

- (void)setCompactStretchAmount:(double)a3
{
  self->_compactStretchAmount = a3;
}

- (double)interactingStretchAmount
{
  return self->_interactingStretchAmount;
}

- (void)setInteractingStretchAmount:(double)a3
{
  self->_interactingStretchAmount = a3;
}

- (double)labelPadding
{
  return self->_labelPadding;
}

- (void)setLabelPadding:(double)a3
{
  self->_labelPadding = a3;
}

- (double)dismissalInterval
{
  return self->_dismissalInterval;
}

- (void)setDismissalInterval:(double)a3
{
  self->_dismissalInterval = a3;
}

- (double)deflationDismissalInterval
{
  return self->_deflationDismissalInterval;
}

- (void)setDeflationDismissalInterval:(double)a3
{
  self->_deflationDismissalInterval = a3;
}

- (double)postTransitionDismissalInterval
{
  return self->_postTransitionDismissalInterval;
}

- (void)setPostTransitionDismissalInterval:(double)a3
{
  self->_postTransitionDismissalInterval = a3;
}

- (double)dimmingAlpha
{
  return self->_dimmingAlpha;
}

- (void)setDimmingAlpha:(double)a3
{
  self->_dimmingAlpha = a3;
}

- (double)legibilityStrength
{
  return self->_legibilityStrength;
}

- (void)setLegibilityStrength:(double)a3
{
  self->_legibilityStrength = a3;
}

- (double)onscreenTopMargin
{
  return self->_onscreenTopMargin;
}

- (void)setOnscreenTopMargin:(double)a3
{
  self->_onscreenTopMargin = a3;
}

- (double)offscreenTopMargin
{
  return self->_offscreenTopMargin;
}

- (void)setOffscreenTopMargin:(double)a3
{
  self->_offscreenTopMargin = a3;
}

- (double)landscapeCornerRadiusFraction
{
  return self->_landscapeCornerRadiusFraction;
}

- (void)setLandscapeCornerRadiusFraction:(double)a3
{
  self->_landscapeCornerRadiusFraction = a3;
}

- (double)volumeButtonsCenterY
{
  return self->_volumeButtonsCenterY;
}

- (void)setVolumeButtonsCenterY:(double)a3
{
  self->_volumeButtonsCenterY = a3;
}

- (double)onscreenLeadingMargin
{
  return self->_onscreenLeadingMargin;
}

- (void)setOnscreenLeadingMargin:(double)a3
{
  self->_onscreenLeadingMargin = a3;
}

- (double)offscreenLeadingMargin
{
  return self->_offscreenLeadingMargin;
}

- (void)setOffscreenLeadingMargin:(double)a3
{
  self->_offscreenLeadingMargin = a3;
}

- (double)portraitCornerRadiusFraction
{
  return self->_portraitCornerRadiusFraction;
}

- (void)setPortraitCornerRadiusFraction:(double)a3
{
  self->_portraitCornerRadiusFraction = a3;
}

- (double)landscapeState1Width
{
  return self->_landscapeState1Width;
}

- (void)setLandscapeState1Width:(double)a3
{
  self->_landscapeState1Width = a3;
}

- (double)landscapeState2Width
{
  return self->_landscapeState2Width;
}

- (void)setLandscapeState2Width:(double)a3
{
  self->_landscapeState2Width = a3;
}

- (double)landscapeState3Width
{
  return self->_landscapeState3Width;
}

- (void)setLandscapeState3Width:(double)a3
{
  self->_landscapeState3Width = a3;
}

- (double)landscapeState1Height
{
  return self->_landscapeState1Height;
}

- (void)setLandscapeState1Height:(double)a3
{
  self->_landscapeState1Height = a3;
}

- (double)landscapeState2Height
{
  return self->_landscapeState2Height;
}

- (void)setLandscapeState2Height:(double)a3
{
  self->_landscapeState2Height = a3;
}

- (double)landscapeState3Height
{
  return self->_landscapeState3Height;
}

- (void)setLandscapeState3Height:(double)a3
{
  self->_landscapeState3Height = a3;
}

- (double)portraitState1Width
{
  return self->_portraitState1Width;
}

- (void)setPortraitState1Width:(double)a3
{
  self->_portraitState1Width = a3;
}

- (double)portraitState2Width
{
  return self->_portraitState2Width;
}

- (void)setPortraitState2Width:(double)a3
{
  self->_portraitState2Width = a3;
}

- (double)portraitState3Width
{
  return self->_portraitState3Width;
}

- (void)setPortraitState3Width:(double)a3
{
  self->_portraitState3Width = a3;
}

- (double)portraitState1Height
{
  return self->_portraitState1Height;
}

- (void)setPortraitState1Height:(double)a3
{
  self->_portraitState1Height = a3;
}

- (double)portraitState2Height
{
  return self->_portraitState2Height;
}

- (void)setPortraitState2Height:(double)a3
{
  self->_portraitState2Height = a3;
}

- (double)portraitState3Height
{
  return self->_portraitState3Height;
}

- (void)setPortraitState3Height:(double)a3
{
  self->_portraitState3Height = a3;
}

- (BOOL)showDebugUI
{
  return self->_showDebugUI;
}

- (void)setShowDebugUI:(BOOL)a3
{
  self->_showDebugUI = a3;
}

- (BOOL)autoDismiss
{
  return self->_autoDismiss;
}

- (void)setAutoDismiss:(BOOL)a3
{
  self->_autoDismiss = a3;
}

- (float)volumeStepDelta
{
  return self->_volumeStepDelta;
}

- (void)setVolumeStepDelta:(float)a3
{
  self->_volumeStepDelta = a3;
}

- (BOOL)displayBrightnessKeyCommandsEnabled
{
  return self->_displayBrightnessKeyCommandsEnabled;
}

- (void)setDisplayBrightnessKeyCommandsEnabled:(BOOL)a3
{
  self->_displayBrightnessKeyCommandsEnabled = a3;
}

- (BOOL)keyboardBrightnessKeyCommandsEnabled
{
  return self->_keyboardBrightnessKeyCommandsEnabled;
}

- (void)setKeyboardBrightnessKeyCommandsEnabled:(BOOL)a3
{
  self->_keyboardBrightnessKeyCommandsEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compactToBaseTransitionSettings, 0);
  objc_storeStrong((id *)&self->_generalToBaseTransitionSettings, 0);
  objc_storeStrong((id *)&self->_deflatingToBasePositionSettings, 0);
  objc_storeStrong((id *)&self->_deflatingToBaseTransitionSettings, 0);
  objc_storeStrong((id *)&self->_deflationTransitionSettings, 0);
  objc_storeStrong((id *)&self->_baseToInitialPositionSettings, 0);
  objc_storeStrong((id *)&self->_baseToInitialTransitionSettings, 0);
  objc_storeStrong((id *)&self->_defaultPositionSettings, 0);
  objc_storeStrong((id *)&self->_defaultTransitionSettings, 0);
}

@end