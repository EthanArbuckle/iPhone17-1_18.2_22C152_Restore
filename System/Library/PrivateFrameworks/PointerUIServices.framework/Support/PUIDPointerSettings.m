@interface PUIDPointerSettings
+ (id)settingsControllerModule;
- (BOOL)allowPositionToPositionAnimations;
- (BOOL)isDecelerationEnabled;
- (BOOL)isDecelerationTargetLookupEnabled;
- (BOOL)isPointerSlipEnabled;
- (BOOL)isUnderlappingContentAllowed;
- (BOOL)shouldAutohideAfterHitTestContextLoss;
- (BOOL)shouldHideWhileGesturing;
- (BOOL)shouldPeriodicallyRefreshClientTransform;
- (BOOL)shouldRecenterAfterDelayOnMouseMovement;
- (BOOL)shouldRecenterAfterLiftingFinger;
- (BOOL)shouldRecenterOnButtonDown;
- (BOOL)showDebugColors;
- (BOOL)supportsTeleporting;
- (SBFAnimationSettings)mouseRecenteringAnimationSettings;
- (SBFAnimationSettings)recenteringAnimationSettings;
- (SBFFluidBehaviorSettings)customShapeMorphAnimationSettings;
- (SBFFluidBehaviorSettings)focusedContentPositionAnimationSettings;
- (SBFFluidBehaviorSettings)focusedPointerPositionAnimationSettings;
- (SBFFluidBehaviorSettings)hiddenToVisibleAnimationSettings;
- (SBFFluidBehaviorSettings)hiddenToVisibleScaleAnimationSettings;
- (SBFFluidBehaviorSettings)hiddenToVisibleTeleportingAnimationSettings;
- (SBFFluidBehaviorSettings)materialTransitionAnimationSettings;
- (SBFFluidBehaviorSettings)pointerAccessoryAnimationSettings;
- (SBFFluidBehaviorSettings)pressedScaleAnimationSettings;
- (SBFFluidBehaviorSettings)rampingExitAnimationSettings;
- (SBFFluidBehaviorSettings)specularOpacityAnimationSettings;
- (SBFFluidBehaviorSettings)standardShapeAnimationSettings;
- (SBFFluidBehaviorSettings)systemPointerPositionAnimationSettings;
- (SBFFluidBehaviorSettings)systemPointerPositionHighQualityFrequencyAnimationSettings;
- (SBFFluidBehaviorSettings)textContentPointerPositionAnimationSettings;
- (SBFFluidBehaviorSettings)visibleIntensityAnimationSettings;
- (SBFFluidBehaviorSettings)visibleToHiddenAnimationSettings;
- (SBFFluidBehaviorSettings)visibleToHiddenScaleAnimationSettings;
- (SBFFluidBehaviorSettings)visibleToHiddenTeleportingAnimationSettings;
- (SBFFluidBehaviorSettings)zTransitionOpacityAnimationSettings;
- (double)autohideDurationForFocusedPointer;
- (double)autohideDurationForFocusedPointerMouse;
- (double)autohideDurationForSystemPointer;
- (double)autohideDurationForSystemPointerMouse;
- (double)automaticRegionExitDelayInterval;
- (double)axLargeSystemPointerCenterDotSize;
- (double)customMorphInitialVelocityProgressMultiplier;
- (double)decelerationTargetLookupConeAngleInDegrees;
- (double)decelerationTargetLookupRadius;
- (double)decelerationTargetLookupResolution;
- (double)delayBeforeRecenteringAfterMouseMovement;
- (double)delayBeforeUnhidingAfterGesturing;
- (double)delayBeforeUnhidingOnTrackpadTouchDown;
- (double)durationToAverageVelocityForClientInteractionThreshold;
- (double)flexibleRectIntensityReductionRange;
- (double)hiddenToVisiblePointerBlurRadius;
- (double)hiddenToVisiblePointerScale;
- (double)minFlexibleRectDarkLuminanceIntensity;
- (double)minFlexibleRectLightLuminanceIntensity;
- (double)minimumVelocityThresholdForDeceleration;
- (double)minimumVelocityThresholdForExpandedDecelerationLookup;
- (double)periodicClientTransformRefreshInterval;
- (double)pointerVelocitySmoothingWeight;
- (double)positionToPositionAnimationThreshold;
- (double)rampingMinimumSlipThreshold;
- (double)specularProminentLongestSideBaseMultiplier;
- (double)specularProminentOpacityMultiplier;
- (double)specularStandardLongestSideBaseMultiplier;
- (double)specularStandardOpacityMultiplier;
- (double)systemInteractionsDecelerationTargetLookupRadius;
- (double)systemPointerPressedScale;
- (double)systemPointerSize;
- (double)tapToClickButtonDownTime;
- (double)underlayingPointerPressedScaleFactor;
- (double)velocityThresholdForClientInteraction;
- (double)visibleToHiddenPointerBlurRadius;
- (double)visibleToHiddenPointerScale;
- (void)setAllowPositionToPositionAnimations:(BOOL)a3;
- (void)setAutohideDurationForFocusedPointer:(double)a3;
- (void)setAutohideDurationForFocusedPointerMouse:(double)a3;
- (void)setAutohideDurationForSystemPointer:(double)a3;
- (void)setAutohideDurationForSystemPointerMouse:(double)a3;
- (void)setAutomaticRegionExitDelayInterval:(double)a3;
- (void)setAxLargeSystemPointerCenterDotSize:(double)a3;
- (void)setCustomMorphInitialVelocityProgressMultiplier:(double)a3;
- (void)setCustomShapeMorphAnimationSettings:(id)a3;
- (void)setDecelerationEnabled:(BOOL)a3;
- (void)setDecelerationTargetLookupConeAngleInDegrees:(double)a3;
- (void)setDecelerationTargetLookupEnabled:(BOOL)a3;
- (void)setDecelerationTargetLookupRadius:(double)a3;
- (void)setDecelerationTargetLookupResolution:(double)a3;
- (void)setDefaultValues;
- (void)setDelayBeforeRecenteringAfterMouseMovement:(double)a3;
- (void)setDelayBeforeUnhidingAfterGesturing:(double)a3;
- (void)setDelayBeforeUnhidingOnTrackpadTouchDown:(double)a3;
- (void)setDurationToAverageVelocityForClientInteractionThreshold:(double)a3;
- (void)setFlexibleRectIntensityReductionRange:(double)a3;
- (void)setFocusedContentPositionAnimationSettings:(id)a3;
- (void)setFocusedPointerPositionAnimationSettings:(id)a3;
- (void)setHiddenToVisibleAnimationSettings:(id)a3;
- (void)setHiddenToVisiblePointerBlurRadius:(double)a3;
- (void)setHiddenToVisiblePointerScale:(double)a3;
- (void)setHiddenToVisibleScaleAnimationSettings:(id)a3;
- (void)setHiddenToVisibleTeleportingAnimationSettings:(id)a3;
- (void)setMaterialTransitionAnimationSettings:(id)a3;
- (void)setMinFlexibleRectDarkLuminanceIntensity:(double)a3;
- (void)setMinFlexibleRectLightLuminanceIntensity:(double)a3;
- (void)setMinimumVelocityThresholdForDeceleration:(double)a3;
- (void)setMinimumVelocityThresholdForExpandedDecelerationLookup:(double)a3;
- (void)setMouseRecenteringAnimationSettings:(id)a3;
- (void)setPeriodicClientTransformRefreshInterval:(double)a3;
- (void)setPointerAccessoryAnimationSettings:(id)a3;
- (void)setPointerSlipEnabled:(BOOL)a3;
- (void)setPointerVelocitySmoothingWeight:(double)a3;
- (void)setPositionToPositionAnimationThreshold:(double)a3;
- (void)setPressedScaleAnimationSettings:(id)a3;
- (void)setRampingExitAnimationSettings:(id)a3;
- (void)setRampingMinimumSlipThreshold:(double)a3;
- (void)setRecenteringAnimationSettings:(id)a3;
- (void)setShouldAutohideAfterHitTestContextLoss:(BOOL)a3;
- (void)setShouldHideWhileGesturing:(BOOL)a3;
- (void)setShouldPeriodicallyRefreshClientTransform:(BOOL)a3;
- (void)setShouldRecenterAfterDelayOnMouseMovement:(BOOL)a3;
- (void)setShouldRecenterAfterLiftingFinger:(BOOL)a3;
- (void)setShouldRecenterOnButtonDown:(BOOL)a3;
- (void)setShowDebugColors:(BOOL)a3;
- (void)setSpecularOpacityAnimationSettings:(id)a3;
- (void)setSpecularProminentLongestSideBaseMultiplier:(double)a3;
- (void)setSpecularProminentOpacityMultiplier:(double)a3;
- (void)setSpecularStandardLongestSideBaseMultiplier:(double)a3;
- (void)setSpecularStandardOpacityMultiplier:(double)a3;
- (void)setStandardShapeAnimationSettings:(id)a3;
- (void)setSupportsTeleporting:(BOOL)a3;
- (void)setSystemInteractionsDecelerationTargetLookupRadius:(double)a3;
- (void)setSystemPointerPositionAnimationSettings:(id)a3;
- (void)setSystemPointerPositionHighQualityFrequencyAnimationSettings:(id)a3;
- (void)setSystemPointerPressedScale:(double)a3;
- (void)setSystemPointerSize:(double)a3;
- (void)setTapToClickButtonDownTime:(double)a3;
- (void)setTextContentPointerPositionAnimationSettings:(id)a3;
- (void)setUnderlappingContentAllowed:(BOOL)a3;
- (void)setUnderlayingPointerPressedScaleFactor:(double)a3;
- (void)setVelocityThresholdForClientInteraction:(double)a3;
- (void)setVisibleIntensityAnimationSettings:(id)a3;
- (void)setVisibleToHiddenAnimationSettings:(id)a3;
- (void)setVisibleToHiddenPointerBlurRadius:(double)a3;
- (void)setVisibleToHiddenPointerScale:(double)a3;
- (void)setVisibleToHiddenScaleAnimationSettings:(id)a3;
- (void)setVisibleToHiddenTeleportingAnimationSettings:(id)a3;
- (void)setZTransitionOpacityAnimationSettings:(id)a3;
@end

@implementation PUIDPointerSettings

- (void)setDefaultValues
{
  v77.receiver = self;
  v77.super_class = (Class)PUIDPointerSettings;
  [(PUIDPointerSettings *)&v77 setDefaultValues];
  [(PUIDPointerSettings *)self setSystemPointerSize:19.0];
  [(PUIDPointerSettings *)self setAxLargeSystemPointerCenterDotSize:9.5];
  [(PUIDPointerSettings *)self setShouldPeriodicallyRefreshClientTransform:0];
  [(PUIDPointerSettings *)self setPeriodicClientTransformRefreshInterval:0.25];
  [(PUIDPointerSettings *)self setUnderlappingContentAllowed:1];
  [(PUIDPointerSettings *)self setShouldRecenterOnButtonDown:1];
  [(PUIDPointerSettings *)self setShouldRecenterAfterLiftingFinger:1];
  [(PUIDPointerSettings *)self setShouldRecenterAfterDelayOnMouseMovement:1];
  [(PUIDPointerSettings *)self setDelayBeforeRecenteringAfterMouseMovement:0.04];
  [(PUIDPointerSettings *)self setSystemPointerPressedScale:0.9];
  [(PUIDPointerSettings *)self setUnderlayingPointerPressedScaleFactor:1.02];
  [(PUIDPointerSettings *)self setVisibleToHiddenPointerScale:0.96];
  [(PUIDPointerSettings *)self setVisibleToHiddenPointerBlurRadius:1.5];
  v3 = [(PUIDPointerSettings *)self visibleToHiddenAnimationSettings];
  [v3 setDefaultValues];

  v4 = [(PUIDPointerSettings *)self visibleToHiddenAnimationSettings];
  [v4 setDampingRatio:1.0];

  v5 = [(PUIDPointerSettings *)self visibleToHiddenAnimationSettings];
  [v5 setResponse:0.5];

  v6 = [(PUIDPointerSettings *)self visibleToHiddenScaleAnimationSettings];
  [v6 setDefaultValues];

  v7 = [(PUIDPointerSettings *)self visibleToHiddenScaleAnimationSettings];
  [v7 setDampingRatio:1.0];

  v8 = [(PUIDPointerSettings *)self visibleToHiddenScaleAnimationSettings];
  [v8 setResponse:0.5];

  [(PUIDPointerSettings *)self setHiddenToVisiblePointerScale:1.75];
  [(PUIDPointerSettings *)self setHiddenToVisiblePointerBlurRadius:10.0];
  [(PUIDPointerSettings *)self setSupportsTeleporting:0];
  v9 = [(PUIDPointerSettings *)self hiddenToVisibleAnimationSettings];
  [v9 setDefaultValues];

  v10 = [(PUIDPointerSettings *)self hiddenToVisibleAnimationSettings];
  [v10 setDampingRatio:1.0];

  v11 = [(PUIDPointerSettings *)self hiddenToVisibleAnimationSettings];
  [v11 setResponse:0.2];

  v12 = [(PUIDPointerSettings *)self hiddenToVisibleScaleAnimationSettings];
  [v12 setDefaultValues];

  v13 = [(PUIDPointerSettings *)self hiddenToVisibleScaleAnimationSettings];
  [v13 setDampingRatio:1.0];

  v14 = [(PUIDPointerSettings *)self hiddenToVisibleScaleAnimationSettings];
  [v14 setResponse:0.15];

  v15 = [(PUIDPointerSettings *)self visibleToHiddenTeleportingAnimationSettings];
  [v15 setDefaultValues];

  v16 = [(PUIDPointerSettings *)self visibleToHiddenTeleportingAnimationSettings];
  [v16 setDampingRatio:1.0];

  v17 = [(PUIDPointerSettings *)self visibleToHiddenTeleportingAnimationSettings];
  [v17 setResponse:0.1];

  v18 = [(PUIDPointerSettings *)self hiddenToVisibleTeleportingAnimationSettings];
  [v18 setDefaultValues];

  v19 = [(PUIDPointerSettings *)self hiddenToVisibleTeleportingAnimationSettings];
  [v19 setDampingRatio:0.5];

  v20 = [(PUIDPointerSettings *)self hiddenToVisibleTeleportingAnimationSettings];
  [v20 setResponse:0.1];

  v21 = [(PUIDPointerSettings *)self pressedScaleAnimationSettings];
  [v21 setDefaultValues];

  v22 = [(PUIDPointerSettings *)self pressedScaleAnimationSettings];
  [v22 setDampingRatio:1.0];

  v23 = [(PUIDPointerSettings *)self pressedScaleAnimationSettings];
  [v23 setResponse:0.11];

  [(PUIDPointerSettings *)self setTapToClickButtonDownTime:0.073];
  [(PUIDPointerSettings *)self setDelayBeforeUnhidingOnTrackpadTouchDown:0.125];
  [(PUIDPointerSettings *)self setAutohideDurationForSystemPointer:3.25];
  [(PUIDPointerSettings *)self setAutohideDurationForFocusedPointer:3.25];
  [(PUIDPointerSettings *)self setAutohideDurationForSystemPointerMouse:8.0];
  [(PUIDPointerSettings *)self setAutohideDurationForFocusedPointerMouse:8.0];
  [(PUIDPointerSettings *)self setShouldAutohideAfterHitTestContextLoss:0];
  [(PUIDPointerSettings *)self setShouldHideWhileGesturing:0];
  [(PUIDPointerSettings *)self setDelayBeforeUnhidingAfterGesturing:0.095];
  [(PUIDPointerSettings *)self setSpecularStandardOpacityMultiplier:0.0475];
  [(PUIDPointerSettings *)self setSpecularStandardLongestSideBaseMultiplier:0.05];
  [(PUIDPointerSettings *)self setSpecularProminentOpacityMultiplier:0.08];
  [(PUIDPointerSettings *)self setSpecularProminentLongestSideBaseMultiplier:0.05];
  v24 = [(PUIDPointerSettings *)self specularOpacityAnimationSettings];
  [v24 setDefaultValues];

  v25 = [(PUIDPointerSettings *)self specularOpacityAnimationSettings];
  [v25 setDampingRatio:1.0];

  v26 = [(PUIDPointerSettings *)self specularOpacityAnimationSettings];
  [v26 setResponse:0.17];

  [(PUIDPointerSettings *)self setCustomMorphInitialVelocityProgressMultiplier:20.0];
  v27 = [(PUIDPointerSettings *)self customShapeMorphAnimationSettings];
  [v27 setDefaultValues];

  v28 = [(PUIDPointerSettings *)self customShapeMorphAnimationSettings];
  [v28 setDampingRatio:1.0];

  v29 = [(PUIDPointerSettings *)self customShapeMorphAnimationSettings];
  [v29 setResponse:0.24];

  [(PUIDPointerSettings *)self setDecelerationEnabled:1];
  [(PUIDPointerSettings *)self setMinimumVelocityThresholdForDeceleration:250.0];
  [(PUIDPointerSettings *)self setPointerVelocitySmoothingWeight:0.75];
  [(PUIDPointerSettings *)self setDecelerationTargetLookupEnabled:1];
  [(PUIDPointerSettings *)self setDecelerationTargetLookupResolution:10.0];
  [(PUIDPointerSettings *)self setDecelerationTargetLookupRadius:60.0];
  [(PUIDPointerSettings *)self setDecelerationTargetLookupConeAngleInDegrees:30.0];
  [(PUIDPointerSettings *)self setSystemInteractionsDecelerationTargetLookupRadius:20.0];
  [(PUIDPointerSettings *)self setMinimumVelocityThresholdForExpandedDecelerationLookup:30.0];
  [(PUIDPointerSettings *)self setVelocityThresholdForClientInteraction:100000.0];
  [(PUIDPointerSettings *)self setDurationToAverageVelocityForClientInteractionThreshold:0.1];
  [(PUIDPointerSettings *)self setAutomaticRegionExitDelayInterval:0.2];
  [(PUIDPointerSettings *)self setPointerSlipEnabled:1];
  [(PUIDPointerSettings *)self setRampingMinimumSlipThreshold:0.15];
  v30 = [(PUIDPointerSettings *)self standardShapeAnimationSettings];
  [v30 setDefaultValues];

  v31 = [(PUIDPointerSettings *)self standardShapeAnimationSettings];
  [v31 setDampingRatio:0.9];

  v32 = [(PUIDPointerSettings *)self standardShapeAnimationSettings];
  [v32 setResponse:0.175];

  v33 = [(PUIDPointerSettings *)self zTransitionOpacityAnimationSettings];
  [v33 setDefaultValues];

  v34 = [(PUIDPointerSettings *)self zTransitionOpacityAnimationSettings];
  [v34 setDampingRatio:1.0];

  v35 = [(PUIDPointerSettings *)self zTransitionOpacityAnimationSettings];
  [v35 setResponse:0.15];

  v36 = [(PUIDPointerSettings *)self systemPointerPositionAnimationSettings];
  [v36 setDefaultValues];

  v37 = [(PUIDPointerSettings *)self systemPointerPositionAnimationSettings];
  [v37 setDampingRatio:1.0];

  v38 = [(PUIDPointerSettings *)self systemPointerPositionAnimationSettings];
  [v38 setResponse:0.017];

  v39 = [(PUIDPointerSettings *)self systemPointerPositionHighQualityFrequencyAnimationSettings];
  [v39 setDefaultValues];

  v40 = [(PUIDPointerSettings *)self systemPointerPositionHighQualityFrequencyAnimationSettings];
  [v40 setDampingRatio:1.0];

  v41 = [(PUIDPointerSettings *)self systemPointerPositionHighQualityFrequencyAnimationSettings];
  [v41 setResponse:0.0];

  v42 = [(PUIDPointerSettings *)self focusedPointerPositionAnimationSettings];
  [v42 setDefaultValues];

  v43 = [(PUIDPointerSettings *)self focusedPointerPositionAnimationSettings];
  [v43 setDampingRatio:1.0];

  v44 = [(PUIDPointerSettings *)self focusedPointerPositionAnimationSettings];
  [v44 setResponse:0.14];

  v45 = [(PUIDPointerSettings *)self textContentPointerPositionAnimationSettings];
  [v45 setDefaultValues];

  v46 = [(PUIDPointerSettings *)self textContentPointerPositionAnimationSettings];
  [v46 setDampingRatio:1.0];

  v47 = [(PUIDPointerSettings *)self textContentPointerPositionAnimationSettings];
  [v47 setResponse:0.075];

  v48 = [(PUIDPointerSettings *)self focusedContentPositionAnimationSettings];
  [v48 setDefaultValues];

  v49 = [(PUIDPointerSettings *)self focusedContentPositionAnimationSettings];
  [v49 setDampingRatio:1.0];

  v50 = [(PUIDPointerSettings *)self focusedContentPositionAnimationSettings];
  [v50 setResponse:0.25];

  v51 = [(PUIDPointerSettings *)self visibleIntensityAnimationSettings];
  [v51 setDefaultValues];

  v52 = [(PUIDPointerSettings *)self visibleIntensityAnimationSettings];
  [v52 setDampingRatio:1.0];

  v53 = [(PUIDPointerSettings *)self visibleIntensityAnimationSettings];
  [v53 setResponse:0.15];

  v54 = [(PUIDPointerSettings *)self rampingExitAnimationSettings];
  [v54 setDefaultValues];

  v55 = [(PUIDPointerSettings *)self rampingExitAnimationSettings];
  [v55 setDampingRatio:1.0];

  v56 = [(PUIDPointerSettings *)self rampingExitAnimationSettings];
  [v56 setResponse:0.125];

  v57 = [(PUIDPointerSettings *)self materialTransitionAnimationSettings];
  [v57 setDefaultValues];

  v58 = [(PUIDPointerSettings *)self materialTransitionAnimationSettings];
  [v58 setDampingRatio:1.0];

  v59 = [(PUIDPointerSettings *)self materialTransitionAnimationSettings];
  [v59 setResponse:0.5];

  v60 = [(PUIDPointerSettings *)self recenteringAnimationSettings];
  [v60 setAnimationType:1];

  v61 = [(PUIDPointerSettings *)self recenteringAnimationSettings];
  [v61 setDelay:0.0];

  v62 = [(PUIDPointerSettings *)self recenteringAnimationSettings];
  [v62 setDuration:0.5];

  v63 = [(PUIDPointerSettings *)self recenteringAnimationSettings];
  [v63 setMass:1.0];

  v64 = [(PUIDPointerSettings *)self recenteringAnimationSettings];
  [v64 setStiffness:3262.0];

  v65 = [(PUIDPointerSettings *)self recenteringAnimationSettings];
  [v65 setDamping:114.0];

  v66 = [(PUIDPointerSettings *)self recenteringAnimationSettings];
  [v66 setCurve:0];

  v67 = [(PUIDPointerSettings *)self mouseRecenteringAnimationSettings];
  [v67 setAnimationType:1];

  v68 = [(PUIDPointerSettings *)self mouseRecenteringAnimationSettings];
  [v68 setDelay:0.0];

  v69 = [(PUIDPointerSettings *)self mouseRecenteringAnimationSettings];
  [v69 setDuration:0.5];

  v70 = [(PUIDPointerSettings *)self mouseRecenteringAnimationSettings];
  [v70 setMass:1.0];

  v71 = [(PUIDPointerSettings *)self mouseRecenteringAnimationSettings];
  [v71 setStiffness:218.0];

  v72 = [(PUIDPointerSettings *)self mouseRecenteringAnimationSettings];
  [v72 setDamping:28.0];

  v73 = [(PUIDPointerSettings *)self mouseRecenteringAnimationSettings];
  [v73 setCurve:0];

  [(PUIDPointerSettings *)self setFlexibleRectIntensityReductionRange:300.0];
  [(PUIDPointerSettings *)self setMinFlexibleRectDarkLuminanceIntensity:0.25];
  [(PUIDPointerSettings *)self setMinFlexibleRectLightLuminanceIntensity:0.325];
  [(PUIDPointerSettings *)self setAllowPositionToPositionAnimations:1];
  [(PUIDPointerSettings *)self setPositionToPositionAnimationThreshold:90.0];
  v74 = [(PUIDPointerSettings *)self pointerAccessoryAnimationSettings];
  [v74 setDefaultValues];

  v75 = [(PUIDPointerSettings *)self pointerAccessoryAnimationSettings];
  [v75 setDampingRatio:1.0];

  v76 = [(PUIDPointerSettings *)self pointerAccessoryAnimationSettings];
  [v76 setResponse:0.3];

  [(PUIDPointerSettings *)self setShowDebugColors:0];
}

+ (id)settingsControllerModule
{
  v192 = +[PTSwitchRow rowWithTitle:@"Underlapping Content Enabled" valueKeyPath:@"underlappingContentAllowed"];
  uint64_t v2 = +[NSPredicate predicateWithFormat:@"underlappingContentAllowed == YES"];
  v3 = +[PTEditFloatRow rowWithTitle:@"Size" valueKeyPath:@"systemPointerSize"];
  v191 = [v3 between:0.0 and:100.0];

  v4 = +[PTEditFloatRow rowWithTitle:@"System Pointer Pressed Scale" valueKeyPath:@"systemPointerPressedScale"];
  v5 = [v4 between:0.0 and:1.0];
  v190 = [v5 precision:3];

  v6 = +[PTEditFloatRow rowWithTitle:@"Underlaying Pointer Pressed Scale Factor" valueKeyPath:@"underlayingPointerPressedScaleFactor"];
  v7 = [v6 between:0.0 and:1.0];
  v8 = [v7 precision:3];
  v189 = [v8 condition:v2];

  v9 = +[PTEditFloatRow rowWithTitle:@"Tap To Click Duration" valueKeyPath:@"tapToClickButtonDownTime"];
  v10 = [v9 between:0.0 and:1.0];
  v11 = [v10 precision:3];
  v188 = [v11 condition:v2];

  v167 = +[PTSwitchRow rowWithTitle:@"Pointer Slip Enabled" valueKeyPath:@"pointerSlipEnabled"];
  v12 = +[PTEditFloatRow rowWithTitle:@"Ramping Minimum Slip" valueKeyPath:@"rampingMinimumSlipThreshold"];
  v13 = [v12 between:0.0 and:1.0];
  v14 = [v13 precision:3];
  v166 = [v14 condition:v2];

  v15 = +[PTEditFloatRow rowWithTitle:@"Automatic Region Exit Delay" valueKeyPath:@"automaticRegionExitDelayInterval"];
  v16 = [v15 between:0.0 and:2.0];
  v17 = [v16 precision:3];
  v165 = [v17 condition:v2];

  v164 = +[PTSwitchRow rowWithTitle:@"Periodically Refresh Client Transform" valueKeyPath:@"shouldPeriodicallyRefreshClientTransform"];
  v168 = +[NSPredicate predicateWithFormat:@"shouldPeriodicallyRefreshClientTransform == YES"];
  v18 = +[PTEditFloatRow rowWithTitle:@"Periodic Client Transform Refresh Interval" valueKeyPath:@"periodicClientTransformRefreshInterval"];
  v19 = [v18 between:0.0 and:10.0];
  v20 = [v19 precision:3];
  v163 = [v20 condition:v168];

  v206[0] = v192;
  v206[1] = v191;
  v206[2] = v190;
  v206[3] = v189;
  v206[4] = v188;
  v206[5] = v167;
  v206[6] = v166;
  v206[7] = v165;
  v206[8] = v164;
  v206[9] = v163;
  v21 = +[NSArray arrayWithObjects:v206 count:10];
  v187 = +[PTModule sectionWithRows:v21 title:@"System Pointer"];

  v22 = +[PTEditFloatRow rowWithTitle:@"Delay Before Unhiding On Trackpad Touch Down" valueKeyPath:@"delayBeforeUnhidingOnTrackpadTouchDown"];
  v23 = [v22 between:0.0 and:0.5];
  v186 = [v23 precision:3];

  v24 = +[PTEditFloatRow rowWithTitle:@"Autohide Duration (System)" valueKeyPath:@"autohideDurationForSystemPointer"];
  v185 = [v24 between:0.0 and:100.0];

  v25 = +[PTEditFloatRow rowWithTitle:@"Autohide Duration (Focused)" valueKeyPath:@"autohideDurationForFocusedPointer"];
  v26 = [v25 between:0.0 and:100.0];
  v193 = (void *)v2;
  v184 = [v26 condition:v2];

  v27 = +[PTEditFloatRow rowWithTitle:@"Autohide Duration - Mouse (System)" valueKeyPath:@"autohideDurationForSystemPointerMouse"];
  v183 = [v27 between:0.0 and:100.0];

  v28 = +[PTEditFloatRow rowWithTitle:@"Autohide Duration - Mouse (Focused)" valueKeyPath:@"autohideDurationForFocusedPointerMouse"];
  v29 = [v28 between:0.0 and:100.0];
  v182 = [v29 condition:v2];

  v30 = +[PTEditFloatRow rowWithTitle:@"Visible to Hidden Scale" valueKeyPath:@"visibleToHiddenPointerScale"];
  v181 = [v30 between:0.0 and:10.0];

  v31 = +[PTEditFloatRow rowWithTitle:@"Visible to Hidden Blur Radius" valueKeyPath:@"visibleToHiddenPointerBlurRadius"];
  v180 = [v31 between:0.0 and:100.0];

  v32 = +[PTEditFloatRow rowWithTitle:@"Hidden to Visible Scale" valueKeyPath:@"hiddenToVisiblePointerScale"];
  v179 = [v32 between:0.0 and:10.0];

  v33 = +[PTEditFloatRow rowWithTitle:@"Hidden to Visible Blur Radius" valueKeyPath:@"hiddenToVisiblePointerBlurRadius"];
  v178 = [v33 between:0.0 and:100.0];

  v161 = +[PTDrillDownRow rowWithTitle:@"Auto-hide (Visible to Hidden) Animation" childSettingsKeyPath:@"visibleToHiddenAnimationSettings"];
  v160 = +[PTDrillDownRow rowWithTitle:@"Auto-Hide Scale (Visible to Hidden) Animation" childSettingsKeyPath:@"visibleToHiddenScaleAnimationSettings"];
  v159 = +[PTDrillDownRow rowWithTitle:@"Auto-Hide (Hidden to Visible) Animation" childSettingsKeyPath:@"hiddenToVisibleAnimationSettings"];
  v158 = +[PTDrillDownRow rowWithTitle:@"Auto-Hide Scale (Hidden to Visible) Animation" childSettingsKeyPath:@"hiddenToVisibleScaleAnimationSettings"];
  v157 = +[PTSwitchRow rowWithTitle:@"Autohide after Contact lost" valueKeyPath:@"shouldAutohideAfterHitTestContextLoss"];
  v156 = +[PTSwitchRow rowWithTitle:@"Hide while performing gestures" valueKeyPath:@"shouldHideWhileGesturing"];
  v162 = +[NSPredicate predicateWithFormat:@"shouldHideWhileGesturing == YES"];
  v34 = +[PTEditFloatRow rowWithTitle:@"Delay Before Unhiding After Gesture" valueKeyPath:@"delayBeforeUnhidingAfterGesturing"];
  v35 = [v34 between:0.0 and:1.0];
  v36 = [v35 precision:3];
  v155 = [v36 condition:v162];

  v205[0] = v186;
  v205[1] = v185;
  v205[2] = v184;
  v205[3] = v183;
  v205[4] = v182;
  v205[5] = v181;
  v205[6] = v180;
  v205[7] = v179;
  v205[8] = v178;
  v205[9] = v161;
  v205[10] = v160;
  v205[11] = v159;
  v205[12] = v158;
  v205[13] = v157;
  v205[14] = v156;
  v205[15] = v155;
  v37 = +[NSArray arrayWithObjects:v205 count:16];
  v177 = +[PTModule sectionWithRows:v37 title:@"Pointer Autohide/Show"];

  v153 = +[PTSwitchRow rowWithTitle:@"Recenter on Button Down" valueKeyPath:@"shouldRecenterOnButtonDown"];
  v152 = +[PTSwitchRow rowWithTitle:@"Recenter after Lifting Finger" valueKeyPath:@"shouldRecenterAfterLiftingFinger"];
  v151 = +[PTSwitchRow rowWithTitle:@"Recenter after Mouse movement" valueKeyPath:@"shouldRecenterAfterDelayOnMouseMovement"];
  v154 = +[NSPredicate predicateWithFormat:@"shouldRecenterAfterDelayOnMouseMovement == YES"];
  v38 = +[PTEditFloatRow rowWithTitle:@"Delay before recentering after mouse movement" valueKeyPath:@"delayBeforeRecenteringAfterMouseMovement"];
  v39 = [v38 between:0.0 and:10.0];
  v40 = [v39 precision:3];
  v150 = [v40 condition:v154];

  v149 = +[PTDrillDownRow rowWithTitle:@"Trackpad Recentering Animation" childSettingsKeyPath:@"recenteringAnimationSettings"];
  v148 = +[PTDrillDownRow rowWithTitle:@"Mouse Recentering Animation" childSettingsKeyPath:@"mouseRecenteringAnimationSettings"];
  v204[0] = v153;
  v204[1] = v152;
  v204[2] = v151;
  v204[3] = v150;
  v204[4] = v149;
  v204[5] = v148;
  v41 = +[NSArray arrayWithObjects:v204 count:6];
  v176 = +[PTModule sectionWithRows:v41 title:@"Recentering"];

  v42 = +[PTDrillDownRow rowWithTitle:@"Custom Morph Transition Animation" childSettingsKeyPath:@"customShapeMorphAnimationSettings"];
  v147 = [v42 condition:v2];

  v43 = +[PTEditFloatRow rowWithTitle:@"Initial Velocity Progress Multiplier" valueKeyPath:@"customMorphInitialVelocityProgressMultiplier"];
  v44 = [v43 between:0.0 and:100.0];
  v146 = [v44 precision:2];

  v203[0] = v146;
  v203[1] = v147;
  v45 = +[NSArray arrayWithObjects:v203 count:2];
  v175 = +[PTModule sectionWithRows:v45 title:@"Custom Shape Morph"];

  v46 = +[PTEditFloatRow rowWithTitle:@"Specular (Pointer Background) Base Side Length Multiplier" valueKeyPath:@"specularStandardLongestSideBaseMultiplier"];
  v47 = [v46 between:0.0 and:0.1];
  v145 = [v47 precision:4];

  v48 = +[PTEditFloatRow rowWithTitle:@"Specular (Pointer Background) Opacity Multiplier" valueKeyPath:@"specularStandardOpacityMultiplier"];
  v49 = [v48 between:0.0 and:0.1];
  v144 = [v49 precision:4];

  v50 = +[PTEditFloatRow rowWithTitle:@"Specular (Solid Content Background) Base Side Length Multiplier" valueKeyPath:@"specularProminentLongestSideBaseMultiplier"];
  v51 = [v50 between:0.0 and:0.1];
  v143 = [v51 precision:4];

  v52 = +[PTEditFloatRow rowWithTitle:@"Specular (Solid Content Background) Opacity Multiplier" valueKeyPath:@"specularProminentOpacityMultiplier"];
  v53 = [v52 between:0.0 and:0.1];
  v142 = [v53 precision:4];

  v141 = +[PTDrillDownRow rowWithTitle:@"Specular Opacity Animation" childSettingsKeyPath:@"specularOpacityAnimationSettings"];
  v202[0] = v145;
  v202[1] = v144;
  v202[2] = v143;
  v202[3] = v142;
  v202[4] = v141;
  v54 = +[NSArray arrayWithObjects:v202 count:5];
  v174 = +[PTModule sectionWithRows:v54 title:@"Specular"];

  uint64_t v55 = +[NSPredicate predicateWithFormat:@"decelerationEnabled == YES"];
  v173 = +[PTSwitchRow rowWithTitle:@"Deceleration Enabled" valueKeyPath:@"decelerationEnabled"];
  v56 = +[PTEditFloatRow rowWithTitle:@"Minimum Velocity Threshold" valueKeyPath:@"minimumVelocityThresholdForDeceleration"];
  v57 = [v56 between:0.0 and:10000.0];
  v58 = [v57 precision:2];
  v140 = (void *)v55;
  v172 = [v58 condition:v55];

  v59 = +[PTEditFloatRow rowWithTitle:@"Velocity Smoothing Weight" valueKeyPath:@"pointerVelocitySmoothingWeight"];
  v60 = [v59 between:0.0 and:1.0];
  v171 = [v60 precision:2];

  uint64_t v61 = +[NSPredicate predicateWithFormat:@"decelerationEnabled == YES && decelerationTargetLookupEnabled == YES"];
  v62 = +[PTSwitchRow rowWithTitle:@"Deceleration Target Lookup" valueKeyPath:@"decelerationTargetLookupEnabled"];
  v138 = [v62 condition:v55];

  v63 = +[PTEditFloatRow rowWithTitle:@"Lookup Resolution" valueKeyPath:@"decelerationTargetLookupResolution"];
  v64 = [v63 between:0.0 and:100.0];
  v65 = [v64 precision:2];
  v137 = [v65 condition:v61];

  v66 = +[PTEditFloatRow rowWithTitle:@"Lookup Radius" valueKeyPath:@"decelerationTargetLookupRadius"];
  v67 = [v66 between:0.0 and:1000.0];
  v68 = [v67 precision:2];
  v136 = [v68 condition:v61];

  v69 = +[PTEditFloatRow rowWithTitle:@"Lookup Cone Angle (Degrees)" valueKeyPath:@"decelerationTargetLookupConeAngleInDegrees"];
  v70 = [v69 between:0.0 and:360.0];
  v71 = [v70 precision:2];
  v135 = [v71 condition:v61];

  v72 = +[PTEditFloatRow rowWithTitle:@"Lookup Radius (System Interactions)" valueKeyPath:@"systemInteractionsDecelerationTargetLookupRadius"];
  v73 = [v72 between:0.0 and:1000.0];
  v74 = [v73 precision:2];
  v139 = (void *)v61;
  v134 = [v74 condition:v61];

  v75 = +[PTEditFloatRow rowWithTitle:@"Velocity Threshold for Expanded Lookup" valueKeyPath:@"minimumVelocityThresholdForExpandedDecelerationLookup"];
  v76 = [v75 between:0.0 and:10000.0];
  objc_super v77 = [v76 precision:2];
  v133 = [v77 condition:v61];

  v201[0] = v173;
  v201[1] = v172;
  v201[2] = v171;
  v201[3] = v138;
  v201[4] = v137;
  v201[5] = v136;
  v201[6] = v135;
  v201[7] = v134;
  v201[8] = v133;
  v78 = +[NSArray arrayWithObjects:v201 count:9];
  v130 = +[PTModule sectionWithRows:v78 title:@"Deceleration"];

  v79 = +[PTEditFloatRow rowWithTitle:@"Velocity Threshold For Client Interaction (pixels/sec)" valueKeyPath:@"velocityThresholdForClientInteraction"];
  v80 = [v79 between:0.0 and:100000.0];
  v132 = [v80 precision:2];

  v81 = +[PTEditFloatRow rowWithTitle:@"Duration For Average For Velocity Threshold For Client Interaction (seconds)" valueKeyPath:@"durationToAverageVelocityForClientInteractionThreshold"];
  v82 = [v81 between:0.0 and:1.0];
  v131 = [v82 precision:2];

  v200[0] = v132;
  v200[1] = v131;
  v83 = +[NSArray arrayWithObjects:v200 count:2];
  v129 = +[PTModule sectionWithRows:v83 title:@"Velocity Threshold"];

  v170 = +[PTDrillDownRow rowWithTitle:@"Standard Shape Transition" childSettingsKeyPath:@"standardShapeAnimationSettings"];
  v169 = +[PTDrillDownRow rowWithTitle:@"System Pointer Position" childSettingsKeyPath:@"systemPointerPositionAnimationSettings"];
  v128 = +[PTDrillDownRow rowWithTitle:@"HQ System Pointer Position" childSettingsKeyPath:@"systemPointerPositionHighQualityFrequencyAnimationSettings"];
  v84 = +[PTDrillDownRow rowWithTitle:@"Focused Pointer Position" childSettingsKeyPath:@"focusedPointerPositionAnimationSettings"];
  v127 = [v84 condition:v2];

  v85 = +[PTDrillDownRow rowWithTitle:@"Focused Content Position" childSettingsKeyPath:@"focusedContentPositionAnimationSettings"];
  v126 = [v85 condition:v2];

  v125 = +[PTDrillDownRow rowWithTitle:@"Text Content Position" childSettingsKeyPath:@"textContentPointerPositionAnimationSettings"];
  v86 = +[PTDrillDownRow rowWithTitle:@"Ramping Exit" childSettingsKeyPath:@"rampingExitAnimationSettings"];
  v124 = [v86 condition:v2];

  v123 = +[PTDrillDownRow rowWithTitle:@"Pressed Scale" childSettingsKeyPath:@"pressedScaleAnimationSettings"];
  v122 = +[PTDrillDownRow rowWithTitle:@"Material Transition (dark/light)" childSettingsKeyPath:@"materialTransitionAnimationSettings"];
  v87 = +[PTDrillDownRow rowWithTitle:@"Z Transition Opacity" childSettingsKeyPath:@"zTransitionOpacityAnimationSettings"];
  v121 = [v87 condition:v2];

  v120 = +[PTDrillDownRow rowWithTitle:@"Intensity Animations (While Visible)" childSettingsKeyPath:@"visibleIntensityAnimationSettings"];
  v199[0] = v170;
  v199[1] = v169;
  v199[2] = v128;
  v199[3] = v127;
  v199[4] = v126;
  v199[5] = v125;
  v199[6] = v124;
  v199[7] = v120;
  v199[8] = v123;
  v199[9] = v122;
  v199[10] = v121;
  v88 = +[NSArray arrayWithObjects:v199 count:11];
  v119 = +[PTModule sectionWithRows:v88 title:@"Animation Settings"];

  v89 = +[PTEditFloatRow rowWithTitle:@"Intensity Reduction Range (in points)" valueKeyPath:@"flexibleRectIntensityReductionRange"];
  v90 = [v89 between:0.0 and:1000.0];
  v118 = [v90 precision:3];

  v91 = +[PTEditFloatRow rowWithTitle:@"Min Dark Luminance (Light Content) Intensity" valueKeyPath:@"minFlexibleRectDarkLuminanceIntensity"];
  v92 = [v91 between:0.0 and:1.0];
  v117 = [v92 precision:3];

  v93 = +[PTEditFloatRow rowWithTitle:@"Min Light Luminance (Dark Content) Intensity" valueKeyPath:@"minFlexibleRectLightLuminanceIntensity"];
  v94 = [v93 between:0.0 and:1.0];
  v116 = [v94 precision:3];

  v198[0] = v118;
  v198[1] = v117;
  v198[2] = v116;
  v95 = +[NSArray arrayWithObjects:v198 count:3];
  v115 = +[PTModule sectionWithRows:v95 title:@"Flexible Rect Pointer"];

  v114 = +[PTSwitchRow rowWithTitle:@"Allow Position to Position Animations" valueKeyPath:@"allowPositionToPositionAnimations"];
  v96 = +[PTEditFloatRow rowWithTitle:@"Position to Position Animation Threshold (in degrees)" valueKeyPath:@"positionToPositionAnimationThreshold"];
  v97 = [v96 between:0.0 and:360.0];
  v98 = [v97 precision:0];
  v99 = +[NSPredicate predicateWithFormat:@"allowPositionToPositionAnimations == YES"];
  v113 = [v98 condition:v99];

  v112 = +[PTDrillDownRow rowWithTitle:@"Pointer Accessory Appearance" childSettingsKeyPath:@"pointerAccessoryAnimationSettings"];
  v197[0] = v114;
  v197[1] = v113;
  v197[2] = v112;
  v100 = +[NSArray arrayWithObjects:v197 count:3];
  v101 = +[PTModule sectionWithRows:v100 title:@"Pointer Accessories"];

  v102 = +[PTSwitchRow rowWithTitle:@"Show Debug Colors" valueKeyPath:@"showDebugColors"];
  v196 = v102;
  v103 = +[NSArray arrayWithObjects:&v196 count:1];
  v104 = +[PTModule sectionWithRows:v103];

  v105 = +[PTRestoreDefaultSettingsRowAction actionWithSettingsKeyPath:0];
  v106 = +[PTButtonRow rowWithTitle:@"Restore Defaults" action:v105];

  v195 = v106;
  v107 = +[NSArray arrayWithObjects:&v195 count:1];
  v108 = +[PTModule sectionWithRows:v107];

  v194[0] = v108;
  v194[1] = v187;
  v194[2] = v115;
  v194[3] = v101;
  v194[4] = v175;
  v194[5] = v174;
  v194[6] = v177;
  v194[7] = v176;
  v194[8] = v130;
  v194[9] = v129;
  v194[10] = v119;
  v194[11] = v104;
  v109 = +[NSArray arrayWithObjects:v194 count:12];
  id v111 = +[PTModule moduleWithTitle:0 contents:v109];

  return v111;
}

- (double)systemPointerSize
{
  return self->_systemPointerSize;
}

- (void)setSystemPointerSize:(double)a3
{
  self->_systemPointerSize = a3;
}

- (double)axLargeSystemPointerCenterDotSize
{
  return self->_axLargeSystemPointerCenterDotSize;
}

- (void)setAxLargeSystemPointerCenterDotSize:(double)a3
{
  self->_axLargeSystemPointerCenterDotSize = a3;
}

- (double)systemPointerPressedScale
{
  return self->_systemPointerPressedScale;
}

- (void)setSystemPointerPressedScale:(double)a3
{
  self->_systemPointerPressedScale = a3;
}

- (double)tapToClickButtonDownTime
{
  return self->_tapToClickButtonDownTime;
}

- (void)setTapToClickButtonDownTime:(double)a3
{
  self->_tapToClickButtonDownTime = a3;
}

- (BOOL)shouldPeriodicallyRefreshClientTransform
{
  return self->_shouldPeriodicallyRefreshClientTransform;
}

- (void)setShouldPeriodicallyRefreshClientTransform:(BOOL)a3
{
  self->_shouldPeriodicallyRefreshClientTransform = a3;
}

- (double)periodicClientTransformRefreshInterval
{
  return self->_periodicClientTransformRefreshInterval;
}

- (void)setPeriodicClientTransformRefreshInterval:(double)a3
{
  self->_periodicClientTransformRefreshInterval = a3;
}

- (BOOL)isUnderlappingContentAllowed
{
  return self->_underlappingContentAllowed;
}

- (void)setUnderlappingContentAllowed:(BOOL)a3
{
  self->_underlappingContentAllowed = a3;
}

- (BOOL)shouldRecenterOnButtonDown
{
  return self->_shouldRecenterOnButtonDown;
}

- (void)setShouldRecenterOnButtonDown:(BOOL)a3
{
  self->_shouldRecenterOnButtonDown = a3;
}

- (BOOL)shouldRecenterAfterLiftingFinger
{
  return self->_shouldRecenterAfterLiftingFinger;
}

- (void)setShouldRecenterAfterLiftingFinger:(BOOL)a3
{
  self->_shouldRecenterAfterLiftingFinger = a3;
}

- (BOOL)shouldRecenterAfterDelayOnMouseMovement
{
  return self->_shouldRecenterAfterDelayOnMouseMovement;
}

- (void)setShouldRecenterAfterDelayOnMouseMovement:(BOOL)a3
{
  self->_shouldRecenterAfterDelayOnMouseMovement = a3;
}

- (double)delayBeforeRecenteringAfterMouseMovement
{
  return self->_delayBeforeRecenteringAfterMouseMovement;
}

- (void)setDelayBeforeRecenteringAfterMouseMovement:(double)a3
{
  self->_delayBeforeRecenteringAfterMouseMovement = a3;
}

- (double)underlayingPointerPressedScaleFactor
{
  return self->_underlayingPointerPressedScaleFactor;
}

- (void)setUnderlayingPointerPressedScaleFactor:(double)a3
{
  self->_underlayingPointerPressedScaleFactor = a3;
}

- (double)specularStandardLongestSideBaseMultiplier
{
  return self->_specularStandardLongestSideBaseMultiplier;
}

- (void)setSpecularStandardLongestSideBaseMultiplier:(double)a3
{
  self->_specularStandardLongestSideBaseMultiplier = a3;
}

- (double)specularStandardOpacityMultiplier
{
  return self->_specularStandardOpacityMultiplier;
}

- (void)setSpecularStandardOpacityMultiplier:(double)a3
{
  self->_specularStandardOpacityMultiplier = a3;
}

- (double)specularProminentLongestSideBaseMultiplier
{
  return self->_specularProminentLongestSideBaseMultiplier;
}

- (void)setSpecularProminentLongestSideBaseMultiplier:(double)a3
{
  self->_specularProminentLongestSideBaseMultiplier = a3;
}

- (double)specularProminentOpacityMultiplier
{
  return self->_specularProminentOpacityMultiplier;
}

- (void)setSpecularProminentOpacityMultiplier:(double)a3
{
  self->_specularProminentOpacityMultiplier = a3;
}

- (BOOL)isDecelerationEnabled
{
  return self->_decelerationEnabled;
}

- (void)setDecelerationEnabled:(BOOL)a3
{
  self->_decelerationEnabled = a3;
}

- (double)minimumVelocityThresholdForDeceleration
{
  return self->_minimumVelocityThresholdForDeceleration;
}

- (void)setMinimumVelocityThresholdForDeceleration:(double)a3
{
  self->_minimumVelocityThresholdForDeceleration = a3;
}

- (double)pointerVelocitySmoothingWeight
{
  return self->_pointerVelocitySmoothingWeight;
}

- (void)setPointerVelocitySmoothingWeight:(double)a3
{
  self->_pointerVelocitySmoothingWeight = a3;
}

- (BOOL)isDecelerationTargetLookupEnabled
{
  return self->_decelerationTargetLookupEnabled;
}

- (void)setDecelerationTargetLookupEnabled:(BOOL)a3
{
  self->_decelerationTargetLookupEnabled = a3;
}

- (double)decelerationTargetLookupResolution
{
  return self->_decelerationTargetLookupResolution;
}

- (void)setDecelerationTargetLookupResolution:(double)a3
{
  self->_decelerationTargetLookupResolution = a3;
}

- (double)decelerationTargetLookupRadius
{
  return self->_decelerationTargetLookupRadius;
}

- (void)setDecelerationTargetLookupRadius:(double)a3
{
  self->_decelerationTargetLookupRadius = a3;
}

- (double)decelerationTargetLookupConeAngleInDegrees
{
  return self->_decelerationTargetLookupConeAngleInDegrees;
}

- (void)setDecelerationTargetLookupConeAngleInDegrees:(double)a3
{
  self->_decelerationTargetLookupConeAngleInDegrees = a3;
}

- (double)systemInteractionsDecelerationTargetLookupRadius
{
  return self->_systemInteractionsDecelerationTargetLookupRadius;
}

- (void)setSystemInteractionsDecelerationTargetLookupRadius:(double)a3
{
  self->_systemInteractionsDecelerationTargetLookupRadius = a3;
}

- (double)minimumVelocityThresholdForExpandedDecelerationLookup
{
  return self->_minimumVelocityThresholdForExpandedDecelerationLookup;
}

- (void)setMinimumVelocityThresholdForExpandedDecelerationLookup:(double)a3
{
  self->_minimumVelocityThresholdForExpandedDecelerationLookup = a3;
}

- (double)customMorphInitialVelocityProgressMultiplier
{
  return self->_customMorphInitialVelocityProgressMultiplier;
}

- (void)setCustomMorphInitialVelocityProgressMultiplier:(double)a3
{
  self->_customMorphInitialVelocityProgressMultiplier = a3;
}

- (SBFFluidBehaviorSettings)customShapeMorphAnimationSettings
{
  return self->_customShapeMorphAnimationSettings;
}

- (void)setCustomShapeMorphAnimationSettings:(id)a3
{
}

- (double)velocityThresholdForClientInteraction
{
  return self->_velocityThresholdForClientInteraction;
}

- (void)setVelocityThresholdForClientInteraction:(double)a3
{
  self->_velocityThresholdForClientInteraction = a3;
}

- (double)durationToAverageVelocityForClientInteractionThreshold
{
  return self->_durationToAverageVelocityForClientInteractionThreshold;
}

- (void)setDurationToAverageVelocityForClientInteractionThreshold:(double)a3
{
  self->_durationToAverageVelocityForClientInteractionThreshold = a3;
}

- (double)automaticRegionExitDelayInterval
{
  return self->_automaticRegionExitDelayInterval;
}

- (void)setAutomaticRegionExitDelayInterval:(double)a3
{
  self->_automaticRegionExitDelayInterval = a3;
}

- (BOOL)isPointerSlipEnabled
{
  return self->_pointerSlipEnabled;
}

- (void)setPointerSlipEnabled:(BOOL)a3
{
  self->_pointerSlipEnabled = a3;
}

- (double)rampingMinimumSlipThreshold
{
  return self->_rampingMinimumSlipThreshold;
}

- (void)setRampingMinimumSlipThreshold:(double)a3
{
  self->_rampingMinimumSlipThreshold = a3;
}

- (SBFFluidBehaviorSettings)standardShapeAnimationSettings
{
  return self->_standardShapeAnimationSettings;
}

- (void)setStandardShapeAnimationSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)systemPointerPositionAnimationSettings
{
  return self->_systemPointerPositionAnimationSettings;
}

- (void)setSystemPointerPositionAnimationSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)systemPointerPositionHighQualityFrequencyAnimationSettings
{
  return self->_systemPointerPositionHighQualityFrequencyAnimationSettings;
}

- (void)setSystemPointerPositionHighQualityFrequencyAnimationSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)focusedContentPositionAnimationSettings
{
  return self->_focusedContentPositionAnimationSettings;
}

- (void)setFocusedContentPositionAnimationSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)focusedPointerPositionAnimationSettings
{
  return self->_focusedPointerPositionAnimationSettings;
}

- (void)setFocusedPointerPositionAnimationSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)textContentPointerPositionAnimationSettings
{
  return self->_textContentPointerPositionAnimationSettings;
}

- (void)setTextContentPointerPositionAnimationSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)rampingExitAnimationSettings
{
  return self->_rampingExitAnimationSettings;
}

- (void)setRampingExitAnimationSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)zTransitionOpacityAnimationSettings
{
  return self->_zTransitionOpacityAnimationSettings;
}

- (void)setZTransitionOpacityAnimationSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)specularOpacityAnimationSettings
{
  return self->_specularOpacityAnimationSettings;
}

- (void)setSpecularOpacityAnimationSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)pressedScaleAnimationSettings
{
  return self->_pressedScaleAnimationSettings;
}

- (void)setPressedScaleAnimationSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)materialTransitionAnimationSettings
{
  return self->_materialTransitionAnimationSettings;
}

- (void)setMaterialTransitionAnimationSettings:(id)a3
{
}

- (SBFAnimationSettings)recenteringAnimationSettings
{
  return self->_recenteringAnimationSettings;
}

- (void)setRecenteringAnimationSettings:(id)a3
{
}

- (SBFAnimationSettings)mouseRecenteringAnimationSettings
{
  return self->_mouseRecenteringAnimationSettings;
}

- (void)setMouseRecenteringAnimationSettings:(id)a3
{
}

- (double)visibleToHiddenPointerScale
{
  return self->_visibleToHiddenPointerScale;
}

- (void)setVisibleToHiddenPointerScale:(double)a3
{
  self->_visibleToHiddenPointerScale = a3;
}

- (double)visibleToHiddenPointerBlurRadius
{
  return self->_visibleToHiddenPointerBlurRadius;
}

- (void)setVisibleToHiddenPointerBlurRadius:(double)a3
{
  self->_visibleToHiddenPointerBlurRadius = a3;
}

- (double)hiddenToVisiblePointerScale
{
  return self->_hiddenToVisiblePointerScale;
}

- (void)setHiddenToVisiblePointerScale:(double)a3
{
  self->_hiddenToVisiblePointerScale = a3;
}

- (double)hiddenToVisiblePointerBlurRadius
{
  return self->_hiddenToVisiblePointerBlurRadius;
}

- (void)setHiddenToVisiblePointerBlurRadius:(double)a3
{
  self->_hiddenToVisiblePointerBlurRadius = a3;
}

- (double)delayBeforeUnhidingOnTrackpadTouchDown
{
  return self->_delayBeforeUnhidingOnTrackpadTouchDown;
}

- (void)setDelayBeforeUnhidingOnTrackpadTouchDown:(double)a3
{
  self->_delayBeforeUnhidingOnTrackpadTouchDown = a3;
}

- (double)autohideDurationForSystemPointer
{
  return self->_autohideDurationForSystemPointer;
}

- (void)setAutohideDurationForSystemPointer:(double)a3
{
  self->_autohideDurationForSystemPointer = a3;
}

- (double)autohideDurationForFocusedPointer
{
  return self->_autohideDurationForFocusedPointer;
}

- (void)setAutohideDurationForFocusedPointer:(double)a3
{
  self->_autohideDurationForFocusedPointer = a3;
}

- (double)autohideDurationForSystemPointerMouse
{
  return self->_autohideDurationForSystemPointerMouse;
}

- (void)setAutohideDurationForSystemPointerMouse:(double)a3
{
  self->_autohideDurationForSystemPointerMouse = a3;
}

- (double)autohideDurationForFocusedPointerMouse
{
  return self->_autohideDurationForFocusedPointerMouse;
}

- (void)setAutohideDurationForFocusedPointerMouse:(double)a3
{
  self->_autohideDurationForFocusedPointerMouse = a3;
}

- (SBFFluidBehaviorSettings)visibleToHiddenAnimationSettings
{
  return self->_visibleToHiddenAnimationSettings;
}

- (void)setVisibleToHiddenAnimationSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)visibleToHiddenScaleAnimationSettings
{
  return self->_visibleToHiddenScaleAnimationSettings;
}

- (void)setVisibleToHiddenScaleAnimationSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)hiddenToVisibleAnimationSettings
{
  return self->_hiddenToVisibleAnimationSettings;
}

- (void)setHiddenToVisibleAnimationSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)hiddenToVisibleScaleAnimationSettings
{
  return self->_hiddenToVisibleScaleAnimationSettings;
}

- (void)setHiddenToVisibleScaleAnimationSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)visibleIntensityAnimationSettings
{
  return self->_visibleIntensityAnimationSettings;
}

- (void)setVisibleIntensityAnimationSettings:(id)a3
{
}

- (BOOL)shouldAutohideAfterHitTestContextLoss
{
  return self->_shouldAutohideAfterHitTestContextLoss;
}

- (void)setShouldAutohideAfterHitTestContextLoss:(BOOL)a3
{
  self->_shouldAutohideAfterHitTestContextLoss = a3;
}

- (BOOL)shouldHideWhileGesturing
{
  return self->_shouldHideWhileGesturing;
}

- (void)setShouldHideWhileGesturing:(BOOL)a3
{
  self->_shouldHideWhileGesturing = a3;
}

- (double)delayBeforeUnhidingAfterGesturing
{
  return self->_delayBeforeUnhidingAfterGesturing;
}

- (void)setDelayBeforeUnhidingAfterGesturing:(double)a3
{
  self->_delayBeforeUnhidingAfterGesturing = a3;
}

- (BOOL)supportsTeleporting
{
  return self->_supportsTeleporting;
}

- (void)setSupportsTeleporting:(BOOL)a3
{
  self->_supportsTeleporting = a3;
}

- (SBFFluidBehaviorSettings)visibleToHiddenTeleportingAnimationSettings
{
  return self->_visibleToHiddenTeleportingAnimationSettings;
}

- (void)setVisibleToHiddenTeleportingAnimationSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)hiddenToVisibleTeleportingAnimationSettings
{
  return self->_hiddenToVisibleTeleportingAnimationSettings;
}

- (void)setHiddenToVisibleTeleportingAnimationSettings:(id)a3
{
}

- (double)flexibleRectIntensityReductionRange
{
  return self->_flexibleRectIntensityReductionRange;
}

- (void)setFlexibleRectIntensityReductionRange:(double)a3
{
  self->_flexibleRectIntensityReductionRange = a3;
}

- (double)minFlexibleRectLightLuminanceIntensity
{
  return self->_minFlexibleRectLightLuminanceIntensity;
}

- (void)setMinFlexibleRectLightLuminanceIntensity:(double)a3
{
  self->_minFlexibleRectLightLuminanceIntensity = a3;
}

- (double)minFlexibleRectDarkLuminanceIntensity
{
  return self->_minFlexibleRectDarkLuminanceIntensity;
}

- (void)setMinFlexibleRectDarkLuminanceIntensity:(double)a3
{
  self->_minFlexibleRectDarkLuminanceIntensity = a3;
}

- (BOOL)allowPositionToPositionAnimations
{
  return self->_allowPositionToPositionAnimations;
}

- (void)setAllowPositionToPositionAnimations:(BOOL)a3
{
  self->_allowPositionToPositionAnimations = a3;
}

- (double)positionToPositionAnimationThreshold
{
  return self->_positionToPositionAnimationThreshold;
}

- (void)setPositionToPositionAnimationThreshold:(double)a3
{
  self->_positionToPositionAnimationThreshold = a3;
}

- (SBFFluidBehaviorSettings)pointerAccessoryAnimationSettings
{
  return self->_pointerAccessoryAnimationSettings;
}

- (void)setPointerAccessoryAnimationSettings:(id)a3
{
}

- (BOOL)showDebugColors
{
  return self->_showDebugColors;
}

- (void)setShowDebugColors:(BOOL)a3
{
  self->_showDebugColors = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pointerAccessoryAnimationSettings, 0);
  objc_storeStrong((id *)&self->_hiddenToVisibleTeleportingAnimationSettings, 0);
  objc_storeStrong((id *)&self->_visibleToHiddenTeleportingAnimationSettings, 0);
  objc_storeStrong((id *)&self->_visibleIntensityAnimationSettings, 0);
  objc_storeStrong((id *)&self->_hiddenToVisibleScaleAnimationSettings, 0);
  objc_storeStrong((id *)&self->_hiddenToVisibleAnimationSettings, 0);
  objc_storeStrong((id *)&self->_visibleToHiddenScaleAnimationSettings, 0);
  objc_storeStrong((id *)&self->_visibleToHiddenAnimationSettings, 0);
  objc_storeStrong((id *)&self->_mouseRecenteringAnimationSettings, 0);
  objc_storeStrong((id *)&self->_recenteringAnimationSettings, 0);
  objc_storeStrong((id *)&self->_materialTransitionAnimationSettings, 0);
  objc_storeStrong((id *)&self->_pressedScaleAnimationSettings, 0);
  objc_storeStrong((id *)&self->_specularOpacityAnimationSettings, 0);
  objc_storeStrong((id *)&self->_zTransitionOpacityAnimationSettings, 0);
  objc_storeStrong((id *)&self->_rampingExitAnimationSettings, 0);
  objc_storeStrong((id *)&self->_textContentPointerPositionAnimationSettings, 0);
  objc_storeStrong((id *)&self->_focusedPointerPositionAnimationSettings, 0);
  objc_storeStrong((id *)&self->_focusedContentPositionAnimationSettings, 0);
  objc_storeStrong((id *)&self->_systemPointerPositionHighQualityFrequencyAnimationSettings, 0);
  objc_storeStrong((id *)&self->_systemPointerPositionAnimationSettings, 0);
  objc_storeStrong((id *)&self->_standardShapeAnimationSettings, 0);
  objc_storeStrong((id *)&self->_customShapeMorphAnimationSettings, 0);
}

@end