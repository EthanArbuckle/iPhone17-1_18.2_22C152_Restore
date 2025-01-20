@interface SBHHomePullToSearchSettings
+ (id)settingsControllerModule;
- (BOOL)allowsKeyboardWhileInteractive;
- (BOOL)allowsKeyboardWhileInteractiveWithoutSearchAffordance;
- (BOOL)allowsVelocityInjection;
- (BOOL)appIconsFollowTranslation;
- (BOOL)injectsVelocityForNonInteractiveTransitions;
- (BOOL)injectsVelocityOnlyForShortSwipes;
- (BOOL)keyboardFollowsSpotlightContent;
- (BOOL)scalesSearchAffordanceContentWhileFading;
- (SBFFluidBehaviorSettings)pullTransitionAnimationSettings;
- (double)backgroundBlurEndThreshold;
- (double)backgroundBlurInteractiveTransitionDistance;
- (double)backgroundBlurStartThreshold;
- (double)backgroundUnblurEndThreshold;
- (double)backgroundUnblurStartThreshold;
- (double)injectedPercentageOfGestureVelocity;
- (double)injectedVelocityForNonInteractiveTransitions;
- (double)interactiveKeyboardPresentationOffset;
- (double)interactiveKeyboardPresentationThreshold;
- (double)keyboardInjectedVelocityPercentage;
- (double)keyboardInjectedVelocityPercentageForNonInteractiveTransitions;
- (double)pullGestureBeganFromTopLeeway;
- (double)pullTransitionActivationThreshold;
- (double)pullTransitionDistance;
- (double)pullTransitionRubberbandThreshold;
- (double)searchAffordanceBackgroundMaterialFadeEndThreshold;
- (double)searchAffordanceBackgroundMaterialFadeInteractiveTransitionDistance;
- (double)searchAffordanceBackgroundMaterialFadeStartThreshold;
- (double)searchAffordanceContentFadeEndThreshold;
- (double)searchAffordanceContentFadeStartThreshold;
- (double)searchAffordanceMaxOffset;
- (double)searchAffordanceMaxScaleX;
- (double)searchAffordanceMaxScaleY;
- (double)searchAffordanceOffsetRubberbandingRange;
- (double)searchAffordanceScaleRubberbandingRange;
- (double)searchAffordanceTransformEndThreshold;
- (double)searchAffordanceTransformStartThreshold;
- (double)searchAffordanceTransientFadeInThreshold;
- (double)searchBarContentFadeEndThreshold;
- (double)searchBarContentFadeStartThreshold;
- (double)searchContentFadeInEndThreshold;
- (double)searchContentFadeInStartThreshold;
- (double)searchContentFadeInteractiveTransitionDistance;
- (double)searchContentFadeOutEndThreshold;
- (double)searchContentFadeOutStartThreshold;
- (double)shortSwipeMaximumPercentageOfExpectedVelocity;
- (void)setAllowsKeyboardWhileInteractive:(BOOL)a3;
- (void)setAllowsKeyboardWhileInteractiveWithoutSearchAffordance:(BOOL)a3;
- (void)setAllowsVelocityInjection:(BOOL)a3;
- (void)setAppIconsFollowTranslation:(BOOL)a3;
- (void)setBackgroundBlurEndThreshold:(double)a3;
- (void)setBackgroundBlurInteractiveTransitionDistance:(double)a3;
- (void)setBackgroundBlurStartThreshold:(double)a3;
- (void)setBackgroundUnblurEndThreshold:(double)a3;
- (void)setBackgroundUnblurStartThreshold:(double)a3;
- (void)setDefaultValues;
- (void)setInjectedPercentageOfGestureVelocity:(double)a3;
- (void)setInjectedVelocityForNonInteractiveTransitions:(double)a3;
- (void)setInjectsVelocityForNonInteractiveTransitions:(BOOL)a3;
- (void)setInjectsVelocityOnlyForShortSwipes:(BOOL)a3;
- (void)setInteractiveKeyboardPresentationOffset:(double)a3;
- (void)setInteractiveKeyboardPresentationThreshold:(double)a3;
- (void)setKeyboardFollowsSpotlightContent:(BOOL)a3;
- (void)setKeyboardInjectedVelocityPercentage:(double)a3;
- (void)setKeyboardInjectedVelocityPercentageForNonInteractiveTransitions:(double)a3;
- (void)setPullGestureBeganFromTopLeeway:(double)a3;
- (void)setPullTransitionActivationThreshold:(double)a3;
- (void)setPullTransitionAnimationSettings:(id)a3;
- (void)setPullTransitionDistance:(double)a3;
- (void)setPullTransitionRubberbandThreshold:(double)a3;
- (void)setScalesSearchAffordanceContentWhileFading:(BOOL)a3;
- (void)setSearchAffordanceBackgroundMaterialFadeEndThreshold:(double)a3;
- (void)setSearchAffordanceBackgroundMaterialFadeInteractiveTransitionDistance:(double)a3;
- (void)setSearchAffordanceBackgroundMaterialFadeStartThreshold:(double)a3;
- (void)setSearchAffordanceContentFadeEndThreshold:(double)a3;
- (void)setSearchAffordanceContentFadeStartThreshold:(double)a3;
- (void)setSearchAffordanceMaxOffset:(double)a3;
- (void)setSearchAffordanceMaxScaleX:(double)a3;
- (void)setSearchAffordanceMaxScaleY:(double)a3;
- (void)setSearchAffordanceOffsetRubberbandingRange:(double)a3;
- (void)setSearchAffordanceScaleRubberbandingRange:(double)a3;
- (void)setSearchAffordanceTransformEndThreshold:(double)a3;
- (void)setSearchAffordanceTransformStartThreshold:(double)a3;
- (void)setSearchAffordanceTransientFadeInThreshold:(double)a3;
- (void)setSearchBarContentFadeEndThreshold:(double)a3;
- (void)setSearchBarContentFadeStartThreshold:(double)a3;
- (void)setSearchContentFadeInEndThreshold:(double)a3;
- (void)setSearchContentFadeInStartThreshold:(double)a3;
- (void)setSearchContentFadeInteractiveTransitionDistance:(double)a3;
- (void)setSearchContentFadeOutEndThreshold:(double)a3;
- (void)setSearchContentFadeOutStartThreshold:(double)a3;
- (void)setShortSwipeMaximumPercentageOfExpectedVelocity:(double)a3;
@end

@implementation SBHHomePullToSearchSettings

- (void)setDefaultValues
{
  [(SBHHomePullToSearchSettings *)self setPullTransitionDistance:24.0];
  [(SBHHomePullToSearchSettings *)self setPullTransitionActivationThreshold:75.0];
  [(SBHHomePullToSearchSettings *)self setPullTransitionRubberbandThreshold:24.0];
  [(SBHHomePullToSearchSettings *)self setPullGestureBeganFromTopLeeway:24.0];
  [(SBHHomePullToSearchSettings *)self setBackgroundBlurInteractiveTransitionDistance:150.0];
  [(SBHHomePullToSearchSettings *)self setBackgroundBlurStartThreshold:0.0];
  [(SBHHomePullToSearchSettings *)self setBackgroundBlurEndThreshold:0.75];
  [(SBHHomePullToSearchSettings *)self setBackgroundUnblurStartThreshold:1.0];
  [(SBHHomePullToSearchSettings *)self setBackgroundUnblurEndThreshold:0.0];
  [(SBHHomePullToSearchSettings *)self setSearchContentFadeInteractiveTransitionDistance:150.0];
  [(SBHHomePullToSearchSettings *)self setSearchContentFadeInStartThreshold:0.1];
  [(SBHHomePullToSearchSettings *)self setSearchContentFadeInEndThreshold:1.0];
  [(SBHHomePullToSearchSettings *)self setSearchContentFadeOutStartThreshold:1.0];
  [(SBHHomePullToSearchSettings *)self setSearchContentFadeOutEndThreshold:0.5];
  [(SBHHomePullToSearchSettings *)self setSearchAffordanceBackgroundMaterialFadeInteractiveTransitionDistance:150.0];
  [(SBHHomePullToSearchSettings *)self setSearchAffordanceBackgroundMaterialFadeStartThreshold:0.0];
  [(SBHHomePullToSearchSettings *)self setSearchAffordanceBackgroundMaterialFadeEndThreshold:0.1];
  [(SBHHomePullToSearchSettings *)self setSearchAffordanceContentFadeStartThreshold:0.0];
  [(SBHHomePullToSearchSettings *)self setSearchAffordanceContentFadeEndThreshold:0.6];
  [(SBHHomePullToSearchSettings *)self setSearchBarContentFadeStartThreshold:0.4];
  [(SBHHomePullToSearchSettings *)self setSearchBarContentFadeEndThreshold:1.0];
  [(SBHHomePullToSearchSettings *)self setScalesSearchAffordanceContentWhileFading:1];
  [(SBHHomePullToSearchSettings *)self setSearchAffordanceTransformStartThreshold:0.0];
  [(SBHHomePullToSearchSettings *)self setSearchAffordanceTransformEndThreshold:150.0];
  [(SBHHomePullToSearchSettings *)self setSearchAffordanceMaxScaleX:1.2];
  [(SBHHomePullToSearchSettings *)self setSearchAffordanceMaxScaleY:1.23];
  [(SBHHomePullToSearchSettings *)self setSearchAffordanceScaleRubberbandingRange:0.15];
  [(SBHHomePullToSearchSettings *)self setSearchAffordanceMaxOffset:75.0];
  [(SBHHomePullToSearchSettings *)self setSearchAffordanceOffsetRubberbandingRange:0.0];
  [(SBHHomePullToSearchSettings *)self setSearchAffordanceTransientFadeInThreshold:0.5];
  [(SBHHomePullToSearchSettings *)self setAllowsKeyboardWhileInteractive:1];
  [(SBHHomePullToSearchSettings *)self setAllowsKeyboardWhileInteractiveWithoutSearchAffordance:0];
  [(SBHHomePullToSearchSettings *)self setInteractiveKeyboardPresentationThreshold:75.0];
  [(SBHHomePullToSearchSettings *)self setInteractiveKeyboardPresentationOffset:0.0];
  [(SBHHomePullToSearchSettings *)self setKeyboardFollowsSpotlightContent:1];
  [(SBHHomePullToSearchSettings *)self setAppIconsFollowTranslation:1];
  [(SBHHomePullToSearchSettings *)self setAllowsVelocityInjection:1];
  [(SBHHomePullToSearchSettings *)self setInjectsVelocityOnlyForShortSwipes:1];
  [(SBHHomePullToSearchSettings *)self setShortSwipeMaximumPercentageOfExpectedVelocity:0.15];
  [(SBHHomePullToSearchSettings *)self setInjectedPercentageOfGestureVelocity:1.0];
  [(SBHHomePullToSearchSettings *)self setKeyboardInjectedVelocityPercentage:0.0];
  [(SBHHomePullToSearchSettings *)self setInjectsVelocityForNonInteractiveTransitions:0];
  [(SBHHomePullToSearchSettings *)self setInjectedVelocityForNonInteractiveTransitions:3000.0];
  [(SBHHomePullToSearchSettings *)self setKeyboardInjectedVelocityPercentageForNonInteractiveTransitions:0.0];
  id v3 = (id)[objc_alloc(MEMORY[0x1E4FA5F08]) initWithDefaultValues];
  [v3 setDampingRatio:0.8];
  [v3 setResponse:0.47];
  [v3 setTrackingDampingRatio:0.92];
  [v3 setTrackingResponse:0.08];
  CAFrameRateRange v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v3, "setFrameRateRange:highFrameRateReason:", 1114138, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
  [(SBHHomePullToSearchSettings *)self setPullTransitionAnimationSettings:v3];
}

+ (id)settingsControllerModule
{
  v96[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F940F8];
  id v3 = [MEMORY[0x1E4F94170] action];
  v75 = [v2 rowWithTitle:@"Restore Defaults" action:v3];

  v4 = (void *)MEMORY[0x1E4F94160];
  v96[0] = v75;
  CAFrameRateRange v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v96 count:1];
  v85 = [v4 sectionWithRows:v5];

  v74 = [MEMORY[0x1E4F94130] rowWithTitle:@"Pull Transition" childSettingsKeyPath:@"pullTransitionAnimationSettings"];
  v6 = (void *)MEMORY[0x1E4F94160];
  v95 = v74;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v95 count:1];
  v84 = [v6 sectionWithRows:v7 title:@"Animation Settings"];

  v73 = [MEMORY[0x1E4F94148] rowWithTitle:@"Pull Distance" valueKeyPath:@"pullTransitionDistance"];
  v72 = [MEMORY[0x1E4F94148] rowWithTitle:@"Activation Threshold" valueKeyPath:@"pullTransitionActivationThreshold"];
  v71 = [MEMORY[0x1E4F94148] rowWithTitle:@"Rubber-Band Threshold" valueKeyPath:@"pullTransitionRubberbandThreshold"];
  v70 = [MEMORY[0x1E4F94148] rowWithTitle:@"Began From Top Leeway" valueKeyPath:@"pullGestureBeganFromTopLeeway"];
  v8 = (void *)MEMORY[0x1E4F94160];
  v94[0] = v73;
  v94[1] = v72;
  v94[2] = v71;
  v94[3] = v70;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v94 count:4];
  v83 = [v8 sectionWithRows:v9 title:@"Pull Transition"];

  v69 = [MEMORY[0x1E4F94148] rowWithTitle:@"Interactive Blur Distance" valueKeyPath:@"backgroundBlurInteractiveTransitionDistance"];
  v68 = [MEMORY[0x1E4F94148] rowWithTitle:@"Blur Start" valueKeyPath:@"backgroundBlurStartThreshold"];
  v67 = [MEMORY[0x1E4F94148] rowWithTitle:@"Blur End" valueKeyPath:@"backgroundBlurEndThreshold"];
  v66 = [MEMORY[0x1E4F94148] rowWithTitle:@"Unblur Start" valueKeyPath:@"backgroundUnblurStartThreshold"];
  v65 = [MEMORY[0x1E4F94148] rowWithTitle:@"Unblur End" valueKeyPath:@"backgroundUnblurEndThreshold"];
  v10 = (void *)MEMORY[0x1E4F94160];
  v93[0] = v69;
  v93[1] = v68;
  v93[2] = v67;
  v93[3] = v66;
  v93[4] = v65;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v93 count:5];
  v82 = [v10 sectionWithRows:v11 title:@"Background Blur"];

  v64 = [MEMORY[0x1E4F94148] rowWithTitle:@"Interactive Fade-In Distance" valueKeyPath:@"searchContentFadeInteractiveTransitionDistance"];
  v63 = [MEMORY[0x1E4F94148] rowWithTitle:@"Fade-In Start" valueKeyPath:@"searchContentFadeInStartThreshold"];
  v62 = [MEMORY[0x1E4F94148] rowWithTitle:@"Fade-In End" valueKeyPath:@"searchContentFadeInEndThreshold"];
  v61 = [MEMORY[0x1E4F94148] rowWithTitle:@"Fade-Out Start" valueKeyPath:@"searchContentFadeOutStartThreshold"];
  v60 = [MEMORY[0x1E4F94148] rowWithTitle:@"Fade-Out End" valueKeyPath:@"searchContentFadeOutEndThreshold"];
  v12 = (void *)MEMORY[0x1E4F94160];
  v92[0] = v64;
  v92[1] = v63;
  v92[2] = v62;
  v92[3] = v61;
  v92[4] = v60;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v92 count:5];
  v81 = [v12 sectionWithRows:v13 title:@"Search Content"];

  v59 = [MEMORY[0x1E4F94148] rowWithTitle:@"Interactive Fade Distance" valueKeyPath:@"searchAffordanceBackgroundMaterialFadeInteractiveTransitionDistance"];
  v58 = [MEMORY[0x1E4F94148] rowWithTitle:@"Fade Start" valueKeyPath:@"searchAffordanceBackgroundMaterialFadeStartThreshold"];
  v57 = [MEMORY[0x1E4F94148] rowWithTitle:@"Fade End" valueKeyPath:@"searchAffordanceBackgroundMaterialFadeEndThreshold"];
  v14 = (void *)MEMORY[0x1E4F94160];
  v91[0] = v59;
  v91[1] = v58;
  v91[2] = v57;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v91 count:3];
  v77 = [v14 sectionWithRows:v15 title:@"Search Pill Background Material Fade"];

  v80 = [MEMORY[0x1E4F94148] rowWithTitle:@"Search Pill Text Fade Start" valueKeyPath:@"searchAffordanceContentFadeStartThreshold"];
  v79 = [MEMORY[0x1E4F94148] rowWithTitle:@"Search Pill Text Fade End" valueKeyPath:@"searchAffordanceContentFadeEndThreshold"];
  v78 = [MEMORY[0x1E4F94148] rowWithTitle:@"Search Bar Text Fade Start" valueKeyPath:@"searchBarContentFadeStartThreshold"];
  v76 = [MEMORY[0x1E4F94148] rowWithTitle:@"Search Bar Text Fade End" valueKeyPath:@"searchBarContentFadeEndThreshold"];
  v56 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Search Pill Text Scales While Fading" valueKeyPath:@"scalesSearchAffordanceContentWhileFading"];
  v55 = [MEMORY[0x1E4F94148] rowWithTitle:@"Search Pill Scale/Translate Start" valueKeyPath:@"searchAffordanceTransformStartThreshold"];
  v54 = [MEMORY[0x1E4F94148] rowWithTitle:@"Search Pill Scale/Translate End" valueKeyPath:@"searchAffordanceTransformEndThreshold"];
  v53 = [MEMORY[0x1E4F94148] rowWithTitle:@"Search Pill Max Scale X" valueKeyPath:@"searchAffordanceMaxScaleX"];
  v52 = [MEMORY[0x1E4F94148] rowWithTitle:@"Search Pill Max Scale Y" valueKeyPath:@"searchAffordanceMaxScaleY"];
  v51 = [MEMORY[0x1E4F94148] rowWithTitle:@"Scale Rubberbanding Range" valueKeyPath:@"searchAffordanceScaleRubberbandingRange"];
  v50 = [MEMORY[0x1E4F94148] rowWithTitle:@"Search Pill Max Offset" valueKeyPath:@"searchAffordanceMaxOffset"];
  v49 = [MEMORY[0x1E4F94148] rowWithTitle:@"Offset Rubberbanding Range" valueKeyPath:@"searchAffordanceOffsetRubberbandingRange"];
  v48 = [MEMORY[0x1E4F94148] rowWithTitle:@"Transient Search Pill Fade Threshold" valueKeyPath:@"searchAffordanceTransientFadeInThreshold"];
  v16 = (void *)MEMORY[0x1E4F94160];
  v90[0] = v80;
  v90[1] = v79;
  v90[2] = v78;
  v90[3] = v76;
  v90[4] = v56;
  v90[5] = v55;
  v90[6] = v54;
  v90[7] = v53;
  v90[8] = v52;
  v90[9] = v51;
  v90[10] = v50;
  v90[11] = v49;
  v90[12] = v48;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v90 count:13];
  v40 = [v16 sectionWithRows:v17 title:@"Search Pill / Bar"];

  v47 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Bring In While Interactive" valueKeyPath:@"allowsKeyboardWhileInteractive"];
  v46 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Interactive Keyboard Without Pill" valueKeyPath:@"allowsKeyboardWhileInteractiveWithoutSearchAffordance"];
  v45 = [MEMORY[0x1E4F94148] rowWithTitle:@"Interactive Keyboard Threshold" valueKeyPath:@"interactiveKeyboardPresentationThreshold"];
  v18 = [MEMORY[0x1E4F94148] rowWithTitle:@"Interactive Presentation Offset" valueKeyPath:@"interactiveKeyboardPresentationOffset"];
  [v18 setMinValue:-1000.0];
  v19 = v18;
  v44 = v18;
  [v18 setMaxValue:1000.0];
  v43 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Keyboard Follows Spotlight" valueKeyPath:@"keyboardFollowsSpotlightContent"];
  v20 = (void *)MEMORY[0x1E4F94160];
  v89[0] = v47;
  v89[1] = v46;
  v89[2] = v45;
  v89[3] = v19;
  v89[4] = v43;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v89 count:5];
  v41 = [v20 sectionWithRows:v21 title:@"Keyboard"];

  v42 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Icons Follow Translation" valueKeyPath:@"appIconsFollowTranslation"];
  v22 = (void *)MEMORY[0x1E4F94160];
  v88 = v42;
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v88 count:1];
  v39 = [v22 sectionWithRows:v23 title:@"App Icons"];

  v38 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Inject Velocity" valueKeyPath:@"allowsVelocityInjection"];
  v37 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Short Swipes Only" valueKeyPath:@"injectsVelocityOnlyForShortSwipes"];
  v36 = [MEMORY[0x1E4F94148] rowWithTitle:@"Short Swipe Max % Expected Velocity" valueKeyPath:@"shortSwipeMaximumPercentageOfExpectedVelocity"];
  v35 = [MEMORY[0x1E4F94148] rowWithTitle:@"Injected % Gesture Velocity" valueKeyPath:@"injectedPercentageOfGestureVelocity"];
  v24 = [MEMORY[0x1E4F94148] rowWithTitle:@"Keyboard % Velocity" valueKeyPath:@"keyboardInjectedVelocityPercentage"];
  [v24 setMinValue:-2.0];
  [v24 setMaxValue:2.0];
  v25 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Inject For Button Taps" valueKeyPath:@"injectsVelocityForNonInteractiveTransitions"];
  v26 = [MEMORY[0x1E4F94148] rowWithTitle:@"Button Tap Velocity" valueKeyPath:@"injectedVelocityForNonInteractiveTransitions"];
  v27 = [MEMORY[0x1E4F94148] rowWithTitle:@"Button Tap Keyboard % Velocity" valueKeyPath:@"keyboardInjectedVelocityPercentageForNonInteractiveTransitions"];
  [v27 setMinValue:-2.0];
  [v27 setMaxValue:2.0];
  v28 = (void *)MEMORY[0x1E4F94160];
  v87[0] = v38;
  v87[1] = v37;
  v87[2] = v36;
  v87[3] = v35;
  v87[4] = v24;
  v87[5] = v25;
  v87[6] = v26;
  v87[7] = v27;
  v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v87 count:8];
  v30 = [v28 sectionWithRows:v29 title:@"Velocity Injection"];

  v31 = (void *)MEMORY[0x1E4F94160];
  v86[0] = v84;
  v86[1] = v83;
  v86[2] = v82;
  v86[3] = v81;
  v86[4] = v77;
  v86[5] = v40;
  v86[6] = v41;
  v86[7] = v39;
  v86[8] = v30;
  v86[9] = v85;
  v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v86 count:10];
  v33 = [v31 moduleWithTitle:@"Pull To Search" contents:v32];

  return v33;
}

- (SBFFluidBehaviorSettings)pullTransitionAnimationSettings
{
  return self->_pullTransitionAnimationSettings;
}

- (void)setPullTransitionAnimationSettings:(id)a3
{
}

- (double)pullTransitionDistance
{
  return self->_pullTransitionDistance;
}

- (void)setPullTransitionDistance:(double)a3
{
  self->_pullTransitionDistance = a3;
}

- (double)pullTransitionActivationThreshold
{
  return self->_pullTransitionActivationThreshold;
}

- (void)setPullTransitionActivationThreshold:(double)a3
{
  self->_pullTransitionActivationThreshold = a3;
}

- (double)pullTransitionRubberbandThreshold
{
  return self->_pullTransitionRubberbandThreshold;
}

- (void)setPullTransitionRubberbandThreshold:(double)a3
{
  self->_pullTransitionRubberbandThreshold = a3;
}

- (double)pullGestureBeganFromTopLeeway
{
  return self->_pullGestureBeganFromTopLeeway;
}

- (void)setPullGestureBeganFromTopLeeway:(double)a3
{
  self->_pullGestureBeganFromTopLeeway = a3;
}

- (double)backgroundBlurInteractiveTransitionDistance
{
  return self->_backgroundBlurInteractiveTransitionDistance;
}

- (void)setBackgroundBlurInteractiveTransitionDistance:(double)a3
{
  self->_backgroundBlurInteractiveTransitionDistance = a3;
}

- (double)backgroundBlurStartThreshold
{
  return self->_backgroundBlurStartThreshold;
}

- (void)setBackgroundBlurStartThreshold:(double)a3
{
  self->_backgroundBlurStartThreshold = a3;
}

- (double)backgroundBlurEndThreshold
{
  return self->_backgroundBlurEndThreshold;
}

- (void)setBackgroundBlurEndThreshold:(double)a3
{
  self->_backgroundBlurEndThreshold = a3;
}

- (double)backgroundUnblurStartThreshold
{
  return self->_backgroundUnblurStartThreshold;
}

- (void)setBackgroundUnblurStartThreshold:(double)a3
{
  self->_backgroundUnblurStartThreshold = a3;
}

- (double)backgroundUnblurEndThreshold
{
  return self->_backgroundUnblurEndThreshold;
}

- (void)setBackgroundUnblurEndThreshold:(double)a3
{
  self->_backgroundUnblurEndThreshold = a3;
}

- (double)searchContentFadeInteractiveTransitionDistance
{
  return self->_searchContentFadeInteractiveTransitionDistance;
}

- (void)setSearchContentFadeInteractiveTransitionDistance:(double)a3
{
  self->_searchContentFadeInteractiveTransitionDistance = a3;
}

- (double)searchContentFadeInStartThreshold
{
  return self->_searchContentFadeInStartThreshold;
}

- (void)setSearchContentFadeInStartThreshold:(double)a3
{
  self->_searchContentFadeInStartThreshold = a3;
}

- (double)searchContentFadeInEndThreshold
{
  return self->_searchContentFadeInEndThreshold;
}

- (void)setSearchContentFadeInEndThreshold:(double)a3
{
  self->_searchContentFadeInEndThreshold = a3;
}

- (double)searchContentFadeOutStartThreshold
{
  return self->_searchContentFadeOutStartThreshold;
}

- (void)setSearchContentFadeOutStartThreshold:(double)a3
{
  self->_searchContentFadeOutStartThreshold = a3;
}

- (double)searchContentFadeOutEndThreshold
{
  return self->_searchContentFadeOutEndThreshold;
}

- (void)setSearchContentFadeOutEndThreshold:(double)a3
{
  self->_searchContentFadeOutEndThreshold = a3;
}

- (double)searchAffordanceBackgroundMaterialFadeInteractiveTransitionDistance
{
  return self->_searchAffordanceBackgroundMaterialFadeInteractiveTransitionDistance;
}

- (void)setSearchAffordanceBackgroundMaterialFadeInteractiveTransitionDistance:(double)a3
{
  self->_searchAffordanceBackgroundMaterialFadeInteractiveTransitionDistance = a3;
}

- (double)searchAffordanceBackgroundMaterialFadeStartThreshold
{
  return self->_searchAffordanceBackgroundMaterialFadeStartThreshold;
}

- (void)setSearchAffordanceBackgroundMaterialFadeStartThreshold:(double)a3
{
  self->_searchAffordanceBackgroundMaterialFadeStartThreshold = a3;
}

- (double)searchAffordanceBackgroundMaterialFadeEndThreshold
{
  return self->_searchAffordanceBackgroundMaterialFadeEndThreshold;
}

- (void)setSearchAffordanceBackgroundMaterialFadeEndThreshold:(double)a3
{
  self->_searchAffordanceBackgroundMaterialFadeEndThreshold = a3;
}

- (double)searchAffordanceContentFadeStartThreshold
{
  return self->_searchAffordanceContentFadeStartThreshold;
}

- (void)setSearchAffordanceContentFadeStartThreshold:(double)a3
{
  self->_searchAffordanceContentFadeStartThreshold = a3;
}

- (double)searchAffordanceContentFadeEndThreshold
{
  return self->_searchAffordanceContentFadeEndThreshold;
}

- (void)setSearchAffordanceContentFadeEndThreshold:(double)a3
{
  self->_searchAffordanceContentFadeEndThreshold = a3;
}

- (double)searchBarContentFadeStartThreshold
{
  return self->_searchBarContentFadeStartThreshold;
}

- (void)setSearchBarContentFadeStartThreshold:(double)a3
{
  self->_searchBarContentFadeStartThreshold = a3;
}

- (double)searchBarContentFadeEndThreshold
{
  return self->_searchBarContentFadeEndThreshold;
}

- (void)setSearchBarContentFadeEndThreshold:(double)a3
{
  self->_searchBarContentFadeEndThreshold = a3;
}

- (BOOL)scalesSearchAffordanceContentWhileFading
{
  return self->_scalesSearchAffordanceContentWhileFading;
}

- (void)setScalesSearchAffordanceContentWhileFading:(BOOL)a3
{
  self->_scalesSearchAffordanceContentWhileFading = a3;
}

- (double)searchAffordanceTransformStartThreshold
{
  return self->_searchAffordanceTransformStartThreshold;
}

- (void)setSearchAffordanceTransformStartThreshold:(double)a3
{
  self->_searchAffordanceTransformStartThreshold = a3;
}

- (double)searchAffordanceTransformEndThreshold
{
  return self->_searchAffordanceTransformEndThreshold;
}

- (void)setSearchAffordanceTransformEndThreshold:(double)a3
{
  self->_searchAffordanceTransformEndThreshold = a3;
}

- (double)searchAffordanceMaxScaleX
{
  return self->_searchAffordanceMaxScaleX;
}

- (void)setSearchAffordanceMaxScaleX:(double)a3
{
  self->_searchAffordanceMaxScaleX = a3;
}

- (double)searchAffordanceMaxScaleY
{
  return self->_searchAffordanceMaxScaleY;
}

- (void)setSearchAffordanceMaxScaleY:(double)a3
{
  self->_searchAffordanceMaxScaleY = a3;
}

- (double)searchAffordanceScaleRubberbandingRange
{
  return self->_searchAffordanceScaleRubberbandingRange;
}

- (void)setSearchAffordanceScaleRubberbandingRange:(double)a3
{
  self->_searchAffordanceScaleRubberbandingRange = a3;
}

- (double)searchAffordanceMaxOffset
{
  return self->_searchAffordanceMaxOffset;
}

- (void)setSearchAffordanceMaxOffset:(double)a3
{
  self->_searchAffordanceMaxOffset = a3;
}

- (double)searchAffordanceOffsetRubberbandingRange
{
  return self->_searchAffordanceOffsetRubberbandingRange;
}

- (void)setSearchAffordanceOffsetRubberbandingRange:(double)a3
{
  self->_searchAffordanceOffsetRubberbandingRange = a3;
}

- (double)searchAffordanceTransientFadeInThreshold
{
  return self->_searchAffordanceTransientFadeInThreshold;
}

- (void)setSearchAffordanceTransientFadeInThreshold:(double)a3
{
  self->_searchAffordanceTransientFadeInThreshold = a3;
}

- (BOOL)allowsKeyboardWhileInteractive
{
  return self->_allowsKeyboardWhileInteractive;
}

- (void)setAllowsKeyboardWhileInteractive:(BOOL)a3
{
  self->_allowsKeyboardWhileInteractive = a3;
}

- (BOOL)allowsKeyboardWhileInteractiveWithoutSearchAffordance
{
  return self->_allowsKeyboardWhileInteractiveWithoutSearchAffordance;
}

- (void)setAllowsKeyboardWhileInteractiveWithoutSearchAffordance:(BOOL)a3
{
  self->_allowsKeyboardWhileInteractiveWithoutSearchAffordance = a3;
}

- (double)interactiveKeyboardPresentationThreshold
{
  return self->_interactiveKeyboardPresentationThreshold;
}

- (void)setInteractiveKeyboardPresentationThreshold:(double)a3
{
  self->_interactiveKeyboardPresentationThreshold = a3;
}

- (double)interactiveKeyboardPresentationOffset
{
  return self->_interactiveKeyboardPresentationOffset;
}

- (void)setInteractiveKeyboardPresentationOffset:(double)a3
{
  self->_interactiveKeyboardPresentationOffset = a3;
}

- (BOOL)keyboardFollowsSpotlightContent
{
  return self->_keyboardFollowsSpotlightContent;
}

- (void)setKeyboardFollowsSpotlightContent:(BOOL)a3
{
  self->_keyboardFollowsSpotlightContent = a3;
}

- (BOOL)appIconsFollowTranslation
{
  return self->_appIconsFollowTranslation;
}

- (void)setAppIconsFollowTranslation:(BOOL)a3
{
  self->_appIconsFollowTranslation = a3;
}

- (BOOL)allowsVelocityInjection
{
  return self->_allowsVelocityInjection;
}

- (void)setAllowsVelocityInjection:(BOOL)a3
{
  self->_allowsVelocityInjection = a3;
}

- (BOOL)injectsVelocityOnlyForShortSwipes
{
  return self->_injectsVelocityOnlyForShortSwipes;
}

- (void)setInjectsVelocityOnlyForShortSwipes:(BOOL)a3
{
  self->_injectsVelocityOnlyForShortSwipes = a3;
}

- (double)shortSwipeMaximumPercentageOfExpectedVelocity
{
  return self->_shortSwipeMaximumPercentageOfExpectedVelocity;
}

- (void)setShortSwipeMaximumPercentageOfExpectedVelocity:(double)a3
{
  self->_shortSwipeMaximumPercentageOfExpectedVelocity = a3;
}

- (double)injectedPercentageOfGestureVelocity
{
  return self->_injectedPercentageOfGestureVelocity;
}

- (void)setInjectedPercentageOfGestureVelocity:(double)a3
{
  self->_injectedPercentageOfGestureVelocity = a3;
}

- (double)keyboardInjectedVelocityPercentage
{
  return self->_keyboardInjectedVelocityPercentage;
}

- (void)setKeyboardInjectedVelocityPercentage:(double)a3
{
  self->_keyboardInjectedVelocityPercentage = a3;
}

- (BOOL)injectsVelocityForNonInteractiveTransitions
{
  return self->_injectsVelocityForNonInteractiveTransitions;
}

- (void)setInjectsVelocityForNonInteractiveTransitions:(BOOL)a3
{
  self->_injectsVelocityForNonInteractiveTransitions = a3;
}

- (double)injectedVelocityForNonInteractiveTransitions
{
  return self->_injectedVelocityForNonInteractiveTransitions;
}

- (void)setInjectedVelocityForNonInteractiveTransitions:(double)a3
{
  self->_injectedVelocityForNonInteractiveTransitions = a3;
}

- (double)keyboardInjectedVelocityPercentageForNonInteractiveTransitions
{
  return self->_keyboardInjectedVelocityPercentageForNonInteractiveTransitions;
}

- (void)setKeyboardInjectedVelocityPercentageForNonInteractiveTransitions:(double)a3
{
  self->_keyboardInjectedVelocityPercentageForNonInteractiveTransitions = a3;
}

- (void).cxx_destruct
{
}

@end