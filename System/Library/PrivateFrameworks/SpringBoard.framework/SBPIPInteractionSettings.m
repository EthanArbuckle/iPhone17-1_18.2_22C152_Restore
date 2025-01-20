@interface SBPIPInteractionSettings
+ (id)settingsControllerModule;
- (BOOL)alwaysStartAtSmallestSize;
- (BOOL)edgeResizeGestureEnabled;
- (BOOL)keyboardDismissesOnOutsideUserInteractionOnHomescreen;
- (BOOL)keyboardDismissesOnOutsideUserInteractionOutsideHomescreen;
- (BOOL)keyboardDismissesOnTransitionToHomescreen;
- (BOOL)panGestureEnabled;
- (BOOL)pinchGestureEnabled;
- (BOOL)rotationGestureEnabled;
- (BOOL)shouldStashOnAppToAppTransitions;
- (BOOL)shouldStashOnTransitionToHomescreen;
- (BOOL)shouldStashOnTransitionToSwitcher;
- (BOOL)shouldUnstashOnTransitionFromHomescreen;
- (BOOL)shouldUnstashOnTransitionFromSwitcher;
- (BOOL)stashingEnabled;
- (BOOL)usesKeyboards;
- (SBFFluidBehaviorSettings)interactiveFluidBehavior;
- (SBFFluidBehaviorSettings)regionUpdateFluidBehavior;
- (SBFFluidBehaviorSettings)rotationFluidBehavior;
- (SBFFluidBehaviorSettings)stashTabFluidBehavior;
- (SBPIPEdgeResizeSettings)edgeResizeSettings;
- (double)defaultContentSizeResetTimeout;
- (double)inFlightHitTestPadding;
- (double)maximumSizeSpanForPreferredSizeTuning;
- (double)minimumSizeSpanBetweenPreferredSizes;
- (double)positionDecelerationRate;
- (double)positionExtenderMaximumDistance;
- (double)positionVelocityYWeightOverVelocityX;
- (double)rotationExtenderMaximumDistance;
- (double)rotationPreRecognitionWeight;
- (double)rotationRubberBandCoefficient;
- (double)scaleDecelerationRate;
- (double)scaleExtenderMaximumDistance;
- (double)scaleLowPassFilterPreviousWeight;
- (double)stashProgressTabAppearanceThresholdX;
- (unint64_t)freePositioning;
- (void)setAlwaysStartAtSmallestSize:(BOOL)a3;
- (void)setDefaultContentSizeResetTimeout:(double)a3;
- (void)setDefaultValues;
- (void)setEdgeResizeGestureEnabled:(BOOL)a3;
- (void)setEdgeResizeSettings:(id)a3;
- (void)setFreePositioning:(unint64_t)a3;
- (void)setInFlightHitTestPadding:(double)a3;
- (void)setInteractiveFluidBehavior:(id)a3;
- (void)setKeyboardDismissesOnOutsideUserInteractionOnHomescreen:(BOOL)a3;
- (void)setKeyboardDismissesOnOutsideUserInteractionOutsideHomescreen:(BOOL)a3;
- (void)setKeyboardDismissesOnTransitionToHomescreen:(BOOL)a3;
- (void)setMaximumSizeSpanForPreferredSizeTuning:(double)a3;
- (void)setMinimumSizeSpanBetweenPreferredSizes:(double)a3;
- (void)setPanGestureEnabled:(BOOL)a3;
- (void)setPinchGestureEnabled:(BOOL)a3;
- (void)setPositionDecelerationRate:(double)a3;
- (void)setPositionExtenderMaximumDistance:(double)a3;
- (void)setPositionVelocityYWeightOverVelocityX:(double)a3;
- (void)setRegionUpdateFluidBehavior:(id)a3;
- (void)setRotationExtenderMaximumDistance:(double)a3;
- (void)setRotationFluidBehavior:(id)a3;
- (void)setRotationGestureEnabled:(BOOL)a3;
- (void)setRotationPreRecognitionWeight:(double)a3;
- (void)setRotationRubberBandCoefficient:(double)a3;
- (void)setScaleDecelerationRate:(double)a3;
- (void)setScaleExtenderMaximumDistance:(double)a3;
- (void)setScaleLowPassFilterPreviousWeight:(double)a3;
- (void)setShouldStashOnAppToAppTransitions:(BOOL)a3;
- (void)setShouldStashOnTransitionToHomescreen:(BOOL)a3;
- (void)setShouldStashOnTransitionToSwitcher:(BOOL)a3;
- (void)setShouldUnstashOnTransitionFromHomescreen:(BOOL)a3;
- (void)setShouldUnstashOnTransitionFromSwitcher:(BOOL)a3;
- (void)setStashProgressTabAppearanceThresholdX:(double)a3;
- (void)setStashTabFluidBehavior:(id)a3;
- (void)setStashingEnabled:(BOOL)a3;
- (void)setUsesKeyboards:(BOOL)a3;
@end

@implementation SBPIPInteractionSettings

- (BOOL)shouldUnstashOnTransitionFromSwitcher
{
  return self->_shouldUnstashOnTransitionFromSwitcher;
}

- (BOOL)shouldUnstashOnTransitionFromHomescreen
{
  return self->_shouldUnstashOnTransitionFromHomescreen;
}

- (void)setDefaultValues
{
  v7.receiver = self;
  v7.super_class = (Class)SBPIPInteractionSettings;
  [(PTSettings *)&v7 setDefaultValues];
  [(SBPIPInteractionSettings *)self setShouldStashOnTransitionToSwitcher:1];
  [(SBPIPInteractionSettings *)self setShouldUnstashOnTransitionFromSwitcher:1];
  [(SBPIPInteractionSettings *)self setShouldStashOnTransitionToHomescreen:0];
  [(SBPIPInteractionSettings *)self setShouldUnstashOnTransitionFromHomescreen:0];
  [(SBPIPInteractionSettings *)self setShouldStashOnAppToAppTransitions:0];
  [(SBPIPInteractionSettings *)self setUsesKeyboards:0];
  [(SBPIPInteractionSettings *)self setKeyboardDismissesOnTransitionToHomescreen:0];
  [(SBPIPInteractionSettings *)self setKeyboardDismissesOnOutsideUserInteractionOnHomescreen:0];
  [(SBPIPInteractionSettings *)self setKeyboardDismissesOnOutsideUserInteractionOutsideHomescreen:0];
  [(SBPIPInteractionSettings *)self setAlwaysStartAtSmallestSize:0];
  [(SBPIPInteractionSettings *)self setPanGestureEnabled:1];
  [(SBPIPInteractionSettings *)self setEdgeResizeGestureEnabled:1];
  [(SBPIPInteractionSettings *)self setPinchGestureEnabled:1];
  [(SBPIPInteractionSettings *)self setRotationGestureEnabled:1];
  [(SBPIPInteractionSettings *)self setStashingEnabled:1];
  [(SBPIPInteractionSettings *)self setFreePositioning:0];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4FA5F08]) initWithDefaultValues];
  [v3 setName:@"PIP Behavior"];
  [v3 setBehaviorType:2];
  [v3 setRetargetImpulse:0.0];
  [v3 setTrackingRetargetImpulse:0.0];
  [v3 setDampingRatio:0.86];
  [v3 setResponse:0.55];
  [v3 setTrackingDampingRatio:0.92];
  [v3 setTrackingResponse:0.18];
  [(SBPIPInteractionSettings *)self setInteractiveFluidBehavior:v3];
  v4 = (void *)[v3 copy];
  [v4 setName:@"Region Update Behavior"];
  [(SBPIPInteractionSettings *)self setRegionUpdateFluidBehavior:v4];
  v5 = (void *)[objc_alloc(MEMORY[0x1E4FA5F08]) initWithDefaultValues];
  [v5 setName:@"Stash Tab Behavior"];
  [v5 setBehaviorType:2];
  [v5 setRetargetImpulse:0.0];
  [v5 setTrackingRetargetImpulse:0.0];
  [v5 setDampingRatio:0.92];
  [v5 setResponse:0.35];
  [v5 setTrackingDampingRatio:0.92];
  [v5 setTrackingResponse:0.18];
  [(SBPIPInteractionSettings *)self setStashTabFluidBehavior:v5];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4FA5F08]) initWithDefaultValues];
  [v6 setName:@"Rotation Behavior"];
  [v6 setBehaviorType:1];
  [v6 setRetargetImpulse:0.14];
  [v6 setTrackingRetargetImpulse:0.0];
  [v6 setDampingRatio:1.0];
  [v6 setResponse:0.8];
  [(SBPIPInteractionSettings *)self setRotationFluidBehavior:v6];
  [(SBPIPInteractionSettings *)self setDefaultContentSizeResetTimeout:8.0];
  [(SBPIPInteractionSettings *)self setInFlightHitTestPadding:50.0];
  [(SBPIPInteractionSettings *)self setMaximumSizeSpanForPreferredSizeTuning:0.5];
  [(SBPIPInteractionSettings *)self setMinimumSizeSpanBetweenPreferredSizes:0.2];
  [(SBPIPInteractionSettings *)self setPositionDecelerationRate:0.995];
  [(SBPIPInteractionSettings *)self setPositionExtenderMaximumDistance:50.0];
  [(SBPIPInteractionSettings *)self setPositionVelocityYWeightOverVelocityX:0.25];
  [(SBPIPInteractionSettings *)self setRotationExtenderMaximumDistance:1.57079633];
  [(SBPIPInteractionSettings *)self setRotationPreRecognitionWeight:1.0];
  [(SBPIPInteractionSettings *)self setRotationRubberBandCoefficient:0.3];
  [(SBPIPInteractionSettings *)self setScaleDecelerationRate:0.99];
  [(SBPIPInteractionSettings *)self setScaleExtenderMaximumDistance:1.0];
  [(SBPIPInteractionSettings *)self setScaleLowPassFilterPreviousWeight:0.25];
  [(SBPIPInteractionSettings *)self setStashProgressTabAppearanceThresholdX:0.85];
}

+ (id)settingsControllerModule
{
  v80[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F94100];
  v3 = [MEMORY[0x1E4F94178] actionWithSettingsKeyPath:0];
  v75 = [v2 rowWithTitle:@"Restore Defaults" action:v3];

  v4 = (void *)MEMORY[0x1E4F94138];
  v5 = NSStringFromSelector(sel_edgeResizeSettings);
  v59 = [v4 rowWithTitle:@"Edge resize settings" childSettingsKeyPath:v5];

  v6 = (void *)MEMORY[0x1E4F94168];
  v80[0] = v59;
  objc_super v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v80 count:1];
  v74 = [v6 sectionWithRows:v7 title:@"Pointer Edge Resize Behavior"];

  v58 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Transition to Switcher Stashes PIP" valueKeyPath:@"shouldStashOnTransitionToSwitcher"];
  v57 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Transition from Switcher Unstashes PIP" valueKeyPath:@"shouldUnstashOnTransitionFromSwitcher"];
  v56 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Transition to Homescreen Stashes PIP" valueKeyPath:@"shouldStashOnTransitionToHomescreen"];
  v55 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Transition from Homescreen Unstashes PIP" valueKeyPath:@"shouldUnstashOnTransitionFromHomescreen"];
  v54 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Transition between Apps Stashes PIP" valueKeyPath:@"shouldStashOnAppToAppTransitions"];
  v8 = (void *)MEMORY[0x1E4F94168];
  v79[0] = v58;
  v79[1] = v57;
  v79[2] = v56;
  v79[3] = v55;
  v79[4] = v54;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v79 count:5];
  v73 = [v8 sectionWithRows:v9 title:@"Stashing Behavior"];

  v53 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Transition to Homescreen Dismisses Keyboards" valueKeyPath:@"keyboardDismissesOnTransitionToHomescreen"];
  v52 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Outside User Interaction on Homescreen Dismisses Keyboards" valueKeyPath:@"keyboardDismissesOnOutsideUserInteractionOnHomescreen"];
  v51 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Outside User Interaction Outside of Homescreen Dismisses Keyboards" valueKeyPath:@"keyboardDismissesOnOutsideUserInteractionOutsideHomescreen"];
  v10 = (void *)MEMORY[0x1E4F94168];
  v78[0] = v53;
  v78[1] = v52;
  v78[2] = v51;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v78 count:3];
  v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"usesKeyboards == YES"];
  v69 = [v10 sectionWithRows:v11 title:@"Keyboard Dismissal Behavior" condition:v12];

  v13 = (void *)MEMORY[0x1E4F94168];
  v14 = [MEMORY[0x1E4FA5F08] _moduleWithSectionTitle:@"Interaction Spring Behavior"];
  v50 = [v13 submoduleWithModule:v14 childSettingsKeyPath:@"interactiveFluidBehavior"];

  v15 = (void *)MEMORY[0x1E4F94168];
  v16 = [MEMORY[0x1E4FA5F08] _moduleWithSectionTitle:@"Stash Tab Spring Behavior"];
  v49 = [v15 submoduleWithModule:v16 childSettingsKeyPath:@"stashTabFluidBehavior"];

  v72 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Always Start Smallest Possible" valueKeyPath:@"alwaysStartAtSmallestSize"];
  v71 = [MEMORY[0x1E4F94110] rowWithTitle:@"Freely Positionable" valueKeyPath:@"freePositioning"];
  [v71 setPossibleTitles:&unk_1F3348918];
  [v71 setPossibleShortTitles:&unk_1F3348930];
  [v71 setPossibleValues:&unk_1F3348948];
  v70 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Pan Gesture Enabled" valueKeyPath:@"panGestureEnabled"];
  v68 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Pich Gesture Enabled" valueKeyPath:@"pinchGestureEnabled"];
  v67 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Rotation Gesture Enabled" valueKeyPath:@"rotationGestureEnabled"];
  v66 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Stashing Enabled" valueKeyPath:@"stashingEnabled"];
  v65 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Edge Resize Gesture Enabled" valueKeyPath:@"edgeResizeGestureEnabled"];
  v17 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Default Content Size Resize Timeout (minutes)" valueKeyPath:@"defaultContentSizeResetTimeout"];
  v18 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Gesture Retargeting Touch Inset" valueKeyPath:@"inFlightHitTestPadding"];
  v19 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Size Span Percentage for Preferred Size Tuning" valueKeyPath:@"maximumSizeSpanForPreferredSizeTuning"];
  v20 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Size Span Percentage between User Preferred Sizes" valueKeyPath:@"minimumSizeSpanBetweenPreferredSizes"];
  v21 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Position Extender Maximum Distance" valueKeyPath:@"positionExtenderMaximumDistance"];
  v22 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Position Deceleration Rate" valueKeyPath:@"positionDecelerationRate"];
  v23 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Position Velocity Y over Velocity X Weight" valueKeyPath:@"positionVelocityYWeightOverVelocityX"];
  v24 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Rotation Extender Maximum Distance" valueKeyPath:@"rotationExtenderMaximumDistance"];
  v43 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Rotation Pre-Recognition Weight" valueKeyPath:@"rotationPreRecognitionWeight"];
  v45 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Rotation Rubber Band Coefficient" valueKeyPath:@"rotationRubberBandCoefficient"];
  v46 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Scale Low Pass Filter Previous Weight" valueKeyPath:@"scaleLowPassFilterPreviousWeight"];
  v47 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Scale Extender Maximum Distance" valueKeyPath:@"scaleExtenderMaximumDistance"];
  v48 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Scale Deceleration Rate" valueKeyPath:@"scaleDecelerationRate"];
  v25 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Stash Progress Threshold for Tab Appearance" valueKeyPath:@"stashProgressTabAppearanceThresholdX"];
  v64 = [v17 minValue:0.0 maxValue:60.0];

  v62 = [v18 minValue:0.0 maxValue:300.0];

  v42 = [v19 minValue:0.0 maxValue:0.5];

  v63 = [v20 minValue:0.05 maxValue:0.8];

  v61 = [v21 minValue:0.0 maxValue:200.0];

  v60 = [v22 minValue:0.88 maxValue:1.0];

  v41 = [v23 minValue:0.0 maxValue:1.0];

  v40 = [v24 minValue:0.0 maxValue:1.57079633];

  v39 = [v43 minValue:0.0 maxValue:1.0];

  v44 = [v45 minValue:0.0 maxValue:1.0];

  v26 = [v46 minValue:0.0 maxValue:1.0];

  uint64_t v27 = [v47 minValue:0.0 maxValue:1.0];

  v28 = [v48 minValue:0.88 maxValue:1.0];

  v29 = v25;
  v30 = [v25 minValue:0.0 maxValue:1.0];

  v31 = (void *)MEMORY[0x1E4F94168];
  v77[0] = v75;
  v77[1] = v70;
  v77[2] = v68;
  v77[3] = v67;
  v77[4] = v65;
  v77[5] = v66;
  v77[6] = v71;
  v77[7] = v64;
  v77[8] = v72;
  v77[9] = v61;
  v77[10] = v60;
  v77[11] = v41;
  v77[12] = v62;
  v77[13] = v30;
  v77[14] = v63;
  v77[15] = v42;
  v77[16] = v40;
  v77[17] = v39;
  v77[18] = v44;
  v77[19] = v26;
  v77[20] = v27;
  v77[21] = v28;
  v32 = (void *)v27;
  v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v77 count:22];
  v34 = [v31 sectionWithRows:v33, @"Gestures, Projection, and Rubberbanding Behavior" title];

  v35 = (void *)MEMORY[0x1E4F94168];
  v76[0] = v74;
  v76[1] = v73;
  v76[2] = v69;
  v76[3] = v50;
  v76[4] = v49;
  v76[5] = v34;
  v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v76 count:6];
  v37 = [v35 moduleWithTitle:@"PIP Interaction Behavior" contents:v36];

  return v37;
}

- (SBPIPEdgeResizeSettings)edgeResizeSettings
{
  return self->_edgeResizeSettings;
}

- (void)setEdgeResizeSettings:(id)a3
{
}

- (BOOL)shouldStashOnTransitionToSwitcher
{
  return self->_shouldStashOnTransitionToSwitcher;
}

- (void)setShouldStashOnTransitionToSwitcher:(BOOL)a3
{
  self->_shouldStashOnTransitionToSwitcher = a3;
}

- (void)setShouldUnstashOnTransitionFromSwitcher:(BOOL)a3
{
  self->_shouldUnstashOnTransitionFromSwitcher = a3;
}

- (BOOL)shouldStashOnTransitionToHomescreen
{
  return self->_shouldStashOnTransitionToHomescreen;
}

- (void)setShouldStashOnTransitionToHomescreen:(BOOL)a3
{
  self->_shouldStashOnTransitionToHomescreen = a3;
}

- (void)setShouldUnstashOnTransitionFromHomescreen:(BOOL)a3
{
  self->_shouldUnstashOnTransitionFromHomescreen = a3;
}

- (BOOL)shouldStashOnAppToAppTransitions
{
  return self->_shouldStashOnAppToAppTransitions;
}

- (void)setShouldStashOnAppToAppTransitions:(BOOL)a3
{
  self->_shouldStashOnAppToAppTransitions = a3;
}

- (BOOL)usesKeyboards
{
  return self->_usesKeyboards;
}

- (void)setUsesKeyboards:(BOOL)a3
{
  self->_usesKeyboards = a3;
}

- (BOOL)keyboardDismissesOnTransitionToHomescreen
{
  return self->_keyboardDismissesOnTransitionToHomescreen;
}

- (void)setKeyboardDismissesOnTransitionToHomescreen:(BOOL)a3
{
  self->_keyboardDismissesOnTransitionToHomescreen = a3;
}

- (BOOL)keyboardDismissesOnOutsideUserInteractionOnHomescreen
{
  return self->_keyboardDismissesOnOutsideUserInteractionOnHomescreen;
}

- (void)setKeyboardDismissesOnOutsideUserInteractionOnHomescreen:(BOOL)a3
{
  self->_keyboardDismissesOnOutsideUserInteractionOnHomescreen = a3;
}

- (BOOL)keyboardDismissesOnOutsideUserInteractionOutsideHomescreen
{
  return self->_keyboardDismissesOnOutsideUserInteractionOutsideHomescreen;
}

- (void)setKeyboardDismissesOnOutsideUserInteractionOutsideHomescreen:(BOOL)a3
{
  self->_keyboardDismissesOnOutsideUserInteractionOutsideHomescreen = a3;
}

- (BOOL)alwaysStartAtSmallestSize
{
  return self->_alwaysStartAtSmallestSize;
}

- (void)setAlwaysStartAtSmallestSize:(BOOL)a3
{
  self->_alwaysStartAtSmallestSize = a3;
}

- (BOOL)panGestureEnabled
{
  return self->_panGestureEnabled;
}

- (void)setPanGestureEnabled:(BOOL)a3
{
  self->_panGestureEnabled = a3;
}

- (BOOL)edgeResizeGestureEnabled
{
  return self->_edgeResizeGestureEnabled;
}

- (void)setEdgeResizeGestureEnabled:(BOOL)a3
{
  self->_edgeResizeGestureEnabled = a3;
}

- (BOOL)pinchGestureEnabled
{
  return self->_pinchGestureEnabled;
}

- (void)setPinchGestureEnabled:(BOOL)a3
{
  self->_pinchGestureEnabled = a3;
}

- (BOOL)rotationGestureEnabled
{
  return self->_rotationGestureEnabled;
}

- (void)setRotationGestureEnabled:(BOOL)a3
{
  self->_rotationGestureEnabled = a3;
}

- (BOOL)stashingEnabled
{
  return self->_stashingEnabled;
}

- (void)setStashingEnabled:(BOOL)a3
{
  self->_stashingEnabled = a3;
}

- (unint64_t)freePositioning
{
  return self->_freePositioning;
}

- (void)setFreePositioning:(unint64_t)a3
{
  self->_freePositioning = a3;
}

- (double)defaultContentSizeResetTimeout
{
  return self->_defaultContentSizeResetTimeout;
}

- (void)setDefaultContentSizeResetTimeout:(double)a3
{
  self->_defaultContentSizeResetTimeout = a3;
}

- (double)inFlightHitTestPadding
{
  return self->_inFlightHitTestPadding;
}

- (void)setInFlightHitTestPadding:(double)a3
{
  self->_inFlightHitTestPadding = a3;
}

- (double)maximumSizeSpanForPreferredSizeTuning
{
  return self->_maximumSizeSpanForPreferredSizeTuning;
}

- (void)setMaximumSizeSpanForPreferredSizeTuning:(double)a3
{
  self->_maximumSizeSpanForPreferredSizeTuning = a3;
}

- (double)minimumSizeSpanBetweenPreferredSizes
{
  return self->_minimumSizeSpanBetweenPreferredSizes;
}

- (void)setMinimumSizeSpanBetweenPreferredSizes:(double)a3
{
  self->_minimumSizeSpanBetweenPreferredSizes = a3;
}

- (double)positionDecelerationRate
{
  return self->_positionDecelerationRate;
}

- (void)setPositionDecelerationRate:(double)a3
{
  self->_positionDecelerationRate = a3;
}

- (double)positionExtenderMaximumDistance
{
  return self->_positionExtenderMaximumDistance;
}

- (void)setPositionExtenderMaximumDistance:(double)a3
{
  self->_positionExtenderMaximumDistance = a3;
}

- (double)positionVelocityYWeightOverVelocityX
{
  return self->_positionVelocityYWeightOverVelocityX;
}

- (void)setPositionVelocityYWeightOverVelocityX:(double)a3
{
  self->_positionVelocityYWeightOverVelocityX = a3;
}

- (double)rotationExtenderMaximumDistance
{
  return self->_rotationExtenderMaximumDistance;
}

- (void)setRotationExtenderMaximumDistance:(double)a3
{
  self->_rotationExtenderMaximumDistance = a3;
}

- (double)rotationPreRecognitionWeight
{
  return self->_rotationPreRecognitionWeight;
}

- (void)setRotationPreRecognitionWeight:(double)a3
{
  self->_rotationPreRecognitionWeight = a3;
}

- (double)rotationRubberBandCoefficient
{
  return self->_rotationRubberBandCoefficient;
}

- (void)setRotationRubberBandCoefficient:(double)a3
{
  self->_rotationRubberBandCoefficient = a3;
}

- (double)scaleDecelerationRate
{
  return self->_scaleDecelerationRate;
}

- (void)setScaleDecelerationRate:(double)a3
{
  self->_scaleDecelerationRate = a3;
}

- (double)scaleExtenderMaximumDistance
{
  return self->_scaleExtenderMaximumDistance;
}

- (void)setScaleExtenderMaximumDistance:(double)a3
{
  self->_scaleExtenderMaximumDistance = a3;
}

- (double)scaleLowPassFilterPreviousWeight
{
  return self->_scaleLowPassFilterPreviousWeight;
}

- (void)setScaleLowPassFilterPreviousWeight:(double)a3
{
  self->_scaleLowPassFilterPreviousWeight = a3;
}

- (double)stashProgressTabAppearanceThresholdX
{
  return self->_stashProgressTabAppearanceThresholdX;
}

- (void)setStashProgressTabAppearanceThresholdX:(double)a3
{
  self->_stashProgressTabAppearanceThresholdX = a3;
}

- (SBFFluidBehaviorSettings)interactiveFluidBehavior
{
  return self->_interactiveFluidBehavior;
}

- (void)setInteractiveFluidBehavior:(id)a3
{
}

- (SBFFluidBehaviorSettings)stashTabFluidBehavior
{
  return self->_stashTabFluidBehavior;
}

- (void)setStashTabFluidBehavior:(id)a3
{
}

- (SBFFluidBehaviorSettings)rotationFluidBehavior
{
  return self->_rotationFluidBehavior;
}

- (void)setRotationFluidBehavior:(id)a3
{
}

- (SBFFluidBehaviorSettings)regionUpdateFluidBehavior
{
  return self->_regionUpdateFluidBehavior;
}

- (void)setRegionUpdateFluidBehavior:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regionUpdateFluidBehavior, 0);
  objc_storeStrong((id *)&self->_rotationFluidBehavior, 0);
  objc_storeStrong((id *)&self->_stashTabFluidBehavior, 0);
  objc_storeStrong((id *)&self->_interactiveFluidBehavior, 0);
  objc_storeStrong((id *)&self->_edgeResizeSettings, 0);
}

@end