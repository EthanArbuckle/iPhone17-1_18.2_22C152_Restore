@interface SBSystemApertureSettings
+ (id)settingsControllerModule;
- (BOOL)activityKeyLineColorEnabled;
- (BOOL)backgroundBlurEnabled;
- (BOOL)elementShadowEnabled;
- (BOOL)hideRemotePrototypingFallbackPill;
- (BOOL)highlightTransitions;
- (BOOL)isContainerHitRectVisible;
- (BOOL)isSensorShadowVisible;
- (BOOL)keyLineEnabled;
- (BOOL)pulseIndicatorEnabled;
- (BOOL)shakeRingerBell;
- (BOOL)showQueryIterationLabel;
- (BOOL)suppressHidingInSnapshotsWhileEmpty;
- (BOOL)suppressHidingOnClonedDisplayWhileEmpty;
- (BOOL)suppressWhilePresentingControlCenter;
- (SBFCAColorMatrixSettings)adaptiveKeyLineColorMatrix;
- (SBFFluidBehaviorSettings)acceptanceBounceLayout;
- (SBFFluidBehaviorSettings)acceptanceBounceLayoutY;
- (SBFFluidBehaviorSettings)acceptanceBounceRebound;
- (SBFFluidBehaviorSettings)acceptanceBounceSideLayout;
- (SBFFluidBehaviorSettings)acceptanceBounceSideLayoutY;
- (SBFFluidBehaviorSettings)acceptanceBounceSideRebound;
- (SBFFluidBehaviorSettings)acceptanceBounceSideStretch;
- (SBFFluidBehaviorSettings)acceptanceBounceStretch;
- (SBFFluidBehaviorSettings)bumpAnimationScaleDownSettings;
- (SBFFluidBehaviorSettings)bumpAnimationScaleUpSettings;
- (SBFFluidBehaviorSettings)contentInteractionBeginBehaviorSettings;
- (SBFFluidBehaviorSettings)ejectionContractionSettings;
- (SBFFluidBehaviorSettings)ejectionStretchSettings;
- (SBFFluidBehaviorSettings)inflateAnimationScaleDownSettings;
- (SBFFluidBehaviorSettings)inflateAnimationScaleUpSettings;
- (SBFFluidBehaviorSettings)jindoAuthErrorShakeInitialKick;
- (SBFFluidBehaviorSettings)jindoAuthErrorShakeSettle;
- (SBFFluidBehaviorSettings)jindoAuthErrorStretchOut;
- (SBFFluidBehaviorSettings)jindoAuthErrorStretchSettle;
- (SBFFluidBehaviorSettings)jindoBoundsOval;
- (SBFFluidBehaviorSettings)keyLineAppearForSwoopTransition;
- (SBFFluidBehaviorSettings)keyLineDisappearToInertTransition;
- (SBFFluidBehaviorSettings)keyLineStyleTransition;
- (SBFFluidBehaviorSettings)mitosisSecondaryBoundsSettings;
- (SBFFluidBehaviorSettings)recombinationSecondaryBoundsYSettings;
- (SBFFluidBehaviorSettings)transitionToProminentPillSettings;
- (SBSAElementContentTransitionSettings)elementContentTransitionSettings;
- (SBSAInterfaceElementInertCollapsingTransitionSettings)inertCollapsingInterfaceElementTransitionSettings;
- (SBSAInterfaceElementInertCompensatingTransitionSettings)inertCompensatingInterfaceElementTransitionSettings;
- (SBSAInterfaceElementTransitionSettings)compactInterfaceElementTransitionSettings;
- (SBSAInterfaceElementTransitionSettings)customInterfaceElementTransitionSettings;
- (SBSAInterfaceElementTransitionSettings)defaultInterfaceElementTransitionSettings;
- (SBSAInterfaceElementTransitionSettings)inertInterfaceElementTransitionSettings;
- (SBSAInterfaceElementTransitionSettings)minimalInterfaceElementTransitionSettings;
- (SBSAInterfaceElementTransitionSettings)popToCustomInterfaceElementTransitionSettings;
- (SBSystemAperturePulseSettings)pulseIndicatorSettings;
- (SBSystemAperturePulseSettings)pulseNoActionSettings;
- (double)acceptanceSideBounceFinishingDelay;
- (double)acceptanceSideBounceItemAppearanceDelayOffset;
- (double)acceptanceSideBounceReboundDelay;
- (double)acceptanceSideBounceXSensorExpansion;
- (double)acceptanceSideBounceXSensorOffset;
- (double)acceptanceSideBounceXStretch;
- (double)acceptanceSideBounceXVelocityThreshold;
- (double)acceptanceSideBounceYPadding;
- (double)acceptanceUpBounceFinishingDelay;
- (double)acceptanceUpBounceFixedOvershootScaling;
- (double)acceptanceUpBounceItemAppearanceDelayOffset;
- (double)acceptanceUpBounceReboundDelay;
- (double)acceptanceUpBounceXPadding;
- (double)acceptanceUpBounceYDownStretch;
- (double)acceptanceUpBounceYStretch;
- (double)adaptiveKeyLineThickness;
- (double)alphaTransitionDurationOnClonedDisplay;
- (double)boundsCollapsingPhaseChangeProgress;
- (double)boundsCollisionProgress;
- (double)boundsCompensatingPhaseChangeProgress;
- (double)bumpAnimationXScale;
- (double)bumpAnimationYScale;
- (double)containerHitRectHorizontalLimit;
- (double)containerHitRectHorizontalMargin;
- (double)containerHitRectHorizontalMarginLimit;
- (double)containerHitRectTopMarginDefault;
- (double)containerHitRectTopMarginWide;
- (double)ejectionMaxCornerRadius;
- (double)ejectionStretchDuration;
- (double)ejectionXStretch;
- (double)ejectionYStretch;
- (double)ejectionYUpOffset;
- (double)expansionToCompactBeginInflationProgress;
- (double)firstShakeMilestone;
- (double)inflateAnimationContentScale;
- (double)inflateAnimationScale;
- (double)inflateVerticalOffsetProportion;
- (double)keyLineAlpha;
- (double)keyLineColorFixedLstar;
- (double)keyLineDarkToMixedMinLuma;
- (double)keyLineMixedToDarkMaxLuma;
- (double)keyLineThickness;
- (double)minimumRequiredSymmetryInCompactLayoutMode;
- (double)mitosisHeadstartDelay;
- (double)paddingFromScreenEdgeRequiringSymmetricLayout;
- (double)prominentPillContentScale;
- (double)prominentPillScale;
- (double)prominentPillVerticalOffsetProportion;
- (double)recombineGestureTranslateFactorCompress;
- (double)recombineGestureTranslateFactorStretch;
- (double)recombineGestureXRubberbandingCompress;
- (double)recombineGestureXRubberbandingStretch;
- (double)recombineGestureXScaleFactorCompress;
- (double)recombineGestureXScaleFactorStretch;
- (double)resizeGestureMinEdgePadding;
- (double)resizeGestureSensorXSafetyMargin;
- (double)resizeGestureUpOffsetFactor;
- (double)resizeGestureXRubberbanding;
- (double)resizeGestureYRangeBeginTracking;
- (double)resizeGestureYRangeEndTracking;
- (double)resizeGestureYRubberbandingCompress;
- (double)resizeGestureYRubberbandingStretch;
- (double)secondShakeMilestone;
- (double)sensorObscuringShadowApexProgress;
- (double)sensorShadowOpacityFactor;
- (double)shakeDisplacement;
- (double)shakeSensorExpansion;
- (double)shakeSensorOffset;
- (double)tallRectCornerRadius;
- (double)tallRectWidth;
- (void)setAcceptanceBounceLayout:(id)a3;
- (void)setAcceptanceBounceLayoutY:(id)a3;
- (void)setAcceptanceBounceRebound:(id)a3;
- (void)setAcceptanceBounceSideLayout:(id)a3;
- (void)setAcceptanceBounceSideLayoutY:(id)a3;
- (void)setAcceptanceBounceSideRebound:(id)a3;
- (void)setAcceptanceBounceSideStretch:(id)a3;
- (void)setAcceptanceBounceStretch:(id)a3;
- (void)setAcceptanceSideBounceFinishingDelay:(double)a3;
- (void)setAcceptanceSideBounceItemAppearanceDelayOffset:(double)a3;
- (void)setAcceptanceSideBounceReboundDelay:(double)a3;
- (void)setAcceptanceSideBounceXSensorExpansion:(double)a3;
- (void)setAcceptanceSideBounceXSensorOffset:(double)a3;
- (void)setAcceptanceSideBounceXStretch:(double)a3;
- (void)setAcceptanceSideBounceXVelocityThreshold:(double)a3;
- (void)setAcceptanceSideBounceYPadding:(double)a3;
- (void)setAcceptanceUpBounceFinishingDelay:(double)a3;
- (void)setAcceptanceUpBounceFixedOvershootScaling:(double)a3;
- (void)setAcceptanceUpBounceItemAppearanceDelayOffset:(double)a3;
- (void)setAcceptanceUpBounceReboundDelay:(double)a3;
- (void)setAcceptanceUpBounceXPadding:(double)a3;
- (void)setAcceptanceUpBounceYDownStretch:(double)a3;
- (void)setAcceptanceUpBounceYStretch:(double)a3;
- (void)setActivityKeyLineColorEnabled:(BOOL)a3;
- (void)setAdaptiveKeyLineColorMatrix:(id)a3;
- (void)setAdaptiveKeyLineThickness:(double)a3;
- (void)setAlphaTransitionDurationOnClonedDisplay:(double)a3;
- (void)setBackgroundBlurEnabled:(BOOL)a3;
- (void)setBoundsCollapsingPhaseChangeProgress:(double)a3;
- (void)setBoundsCollisionProgress:(double)a3;
- (void)setBoundsCompensatingPhaseChangeProgress:(double)a3;
- (void)setBumpAnimationScaleDownSettings:(id)a3;
- (void)setBumpAnimationScaleUpSettings:(id)a3;
- (void)setBumpAnimationXScale:(double)a3;
- (void)setBumpAnimationYScale:(double)a3;
- (void)setCompactInterfaceElementTransitionSettings:(id)a3;
- (void)setContainerHitRectHorizontalLimit:(double)a3;
- (void)setContainerHitRectHorizontalMargin:(double)a3;
- (void)setContainerHitRectHorizontalMarginLimit:(double)a3;
- (void)setContainerHitRectTopMarginDefault:(double)a3;
- (void)setContainerHitRectTopMarginWide:(double)a3;
- (void)setContainerHitRectVisible:(BOOL)a3;
- (void)setContentInteractionBeginBehaviorSettings:(id)a3;
- (void)setCustomInterfaceElementTransitionSettings:(id)a3;
- (void)setDefaultInterfaceElementTransitionSettings:(id)a3;
- (void)setDefaultValues;
- (void)setEjectionContractionSettings:(id)a3;
- (void)setEjectionMaxCornerRadius:(double)a3;
- (void)setEjectionStretchDuration:(double)a3;
- (void)setEjectionStretchSettings:(id)a3;
- (void)setEjectionXStretch:(double)a3;
- (void)setEjectionYStretch:(double)a3;
- (void)setEjectionYUpOffset:(double)a3;
- (void)setElementContentTransitionSettings:(id)a3;
- (void)setElementShadowEnabled:(BOOL)a3;
- (void)setExpansionToCompactBeginInflationProgress:(double)a3;
- (void)setFirstShakeMilestone:(double)a3;
- (void)setHideRemotePrototypingFallbackPill:(BOOL)a3;
- (void)setHighlightTransitions:(BOOL)a3;
- (void)setInertCollapsingInterfaceElementTransitionSettings:(id)a3;
- (void)setInertCompensatingInterfaceElementTransitionSettings:(id)a3;
- (void)setInertInterfaceElementTransitionSettings:(id)a3;
- (void)setInflateAnimationContentScale:(double)a3;
- (void)setInflateAnimationScale:(double)a3;
- (void)setInflateAnimationScaleDownSettings:(id)a3;
- (void)setInflateAnimationScaleUpSettings:(id)a3;
- (void)setInflateVerticalOffsetProportion:(double)a3;
- (void)setJindoAuthErrorShakeInitialKick:(id)a3;
- (void)setJindoAuthErrorShakeSettle:(id)a3;
- (void)setJindoAuthErrorStretchOut:(id)a3;
- (void)setJindoAuthErrorStretchSettle:(id)a3;
- (void)setJindoBoundsOval:(id)a3;
- (void)setKeyLineAlpha:(double)a3;
- (void)setKeyLineAppearForSwoopTransition:(id)a3;
- (void)setKeyLineColorFixedLstar:(double)a3;
- (void)setKeyLineDarkToMixedMinLuma:(double)a3;
- (void)setKeyLineDisappearToInertTransition:(id)a3;
- (void)setKeyLineEnabled:(BOOL)a3;
- (void)setKeyLineMixedToDarkMaxLuma:(double)a3;
- (void)setKeyLineStyleTransition:(id)a3;
- (void)setKeyLineThickness:(double)a3;
- (void)setMinimalInterfaceElementTransitionSettings:(id)a3;
- (void)setMinimumRequiredSymmetryInCompactLayoutMode:(double)a3;
- (void)setMitosisHeadstartDelay:(double)a3;
- (void)setMitosisSecondaryBoundsSettings:(id)a3;
- (void)setPaddingFromScreenEdgeRequiringSymmetricLayout:(double)a3;
- (void)setPopToCustomInterfaceElementTransitionSettings:(id)a3;
- (void)setProminentPillContentScale:(double)a3;
- (void)setProminentPillScale:(double)a3;
- (void)setProminentPillVerticalOffsetProportion:(double)a3;
- (void)setPulseIndicatorEnabled:(BOOL)a3;
- (void)setPulseIndicatorSettings:(id)a3;
- (void)setPulseNoActionSettings:(id)a3;
- (void)setRecombinationSecondaryBoundsYSettings:(id)a3;
- (void)setRecombineGestureTranslateFactorCompress:(double)a3;
- (void)setRecombineGestureTranslateFactorStretch:(double)a3;
- (void)setRecombineGestureXRubberbandingCompress:(double)a3;
- (void)setRecombineGestureXRubberbandingStretch:(double)a3;
- (void)setRecombineGestureXScaleFactorCompress:(double)a3;
- (void)setRecombineGestureXScaleFactorStretch:(double)a3;
- (void)setResizeGestureMinEdgePadding:(double)a3;
- (void)setResizeGestureSensorXSafetyMargin:(double)a3;
- (void)setResizeGestureUpOffsetFactor:(double)a3;
- (void)setResizeGestureXRubberbanding:(double)a3;
- (void)setResizeGestureYRangeBeginTracking:(double)a3;
- (void)setResizeGestureYRangeEndTracking:(double)a3;
- (void)setResizeGestureYRubberbandingCompress:(double)a3;
- (void)setResizeGestureYRubberbandingStretch:(double)a3;
- (void)setSecondShakeMilestone:(double)a3;
- (void)setSensorObscuringShadowApexProgress:(double)a3;
- (void)setSensorShadowOpacityFactor:(double)a3;
- (void)setSensorShadowVisible:(BOOL)a3;
- (void)setShakeDisplacement:(double)a3;
- (void)setShakeRingerBell:(BOOL)a3;
- (void)setShakeSensorExpansion:(double)a3;
- (void)setShakeSensorOffset:(double)a3;
- (void)setShowQueryIterationLabel:(BOOL)a3;
- (void)setSuppressHidingInSnapshotsWhileEmpty:(BOOL)a3;
- (void)setSuppressHidingOnClonedDisplayWhileEmpty:(BOOL)a3;
- (void)setSuppressWhilePresentingControlCenter:(BOOL)a3;
- (void)setTallRectCornerRadius:(double)a3;
- (void)setTallRectWidth:(double)a3;
- (void)setTransitionToProminentPillSettings:(id)a3;
@end

@implementation SBSystemApertureSettings

- (BOOL)hideRemotePrototypingFallbackPill
{
  return self->_hideRemotePrototypingFallbackPill;
}

- (double)sensorObscuringShadowApexProgress
{
  return self->_sensorObscuringShadowApexProgress;
}

- (SBSAInterfaceElementTransitionSettings)inertInterfaceElementTransitionSettings
{
  return self->_inertInterfaceElementTransitionSettings;
}

- (SBFFluidBehaviorSettings)keyLineStyleTransition
{
  return self->_keyLineStyleTransition;
}

- (BOOL)elementShadowEnabled
{
  return self->_elementShadowEnabled;
}

- (BOOL)suppressHidingOnClonedDisplayWhileEmpty
{
  return self->_suppressHidingOnClonedDisplayWhileEmpty;
}

- (BOOL)suppressHidingInSnapshotsWhileEmpty
{
  return self->_suppressHidingInSnapshotsWhileEmpty;
}

- (double)tallRectCornerRadius
{
  return self->_tallRectCornerRadius;
}

- (SBSAInterfaceElementInertCollapsingTransitionSettings)inertCollapsingInterfaceElementTransitionSettings
{
  return self->_inertCollapsingInterfaceElementTransitionSettings;
}

- (BOOL)backgroundBlurEnabled
{
  return self->_backgroundBlurEnabled;
}

- (SBSAInterfaceElementTransitionSettings)defaultInterfaceElementTransitionSettings
{
  return self->_defaultInterfaceElementTransitionSettings;
}

- (BOOL)pulseIndicatorEnabled
{
  return self->_pulseIndicatorEnabled;
}

- (void)setDefaultValues
{
  v304.receiver = self;
  v304.super_class = (Class)SBSystemApertureSettings;
  [(PTSettings *)&v304 setDefaultValues];
  v3 = [(SBSystemApertureSettings *)self jindoBoundsOval];
  [v3 setDefaultValues];

  v4 = [(SBSystemApertureSettings *)self jindoBoundsOval];
  [v4 setBehaviorType:1];

  v5 = [(SBSystemApertureSettings *)self jindoBoundsOval];
  [v5 setDampingRatio:1.0];

  v6 = [(SBSystemApertureSettings *)self jindoBoundsOval];
  [v6 setResponse:0.6];

  v7 = [(SBSystemApertureSettings *)self jindoBoundsOval];
  [v7 setName:@"Jindo Bounds Oval"];

  v8 = [(SBSystemApertureSettings *)self jindoBoundsOval];
  CAFrameRateRange v305 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v8, "setFrameRateRange:highFrameRateReason:", 1114137, *(double *)&v305.minimum, *(double *)&v305.maximum, *(double *)&v305.preferred);

  [(SBSystemApertureSettings *)self setSensorShadowVisible:0];
  [(SBSystemApertureSettings *)self setSensorShadowOpacityFactor:1.6];
  [(SBSystemApertureSettings *)self setHighlightTransitions:0];
  [(SBSystemApertureSettings *)self setBoundsCollisionProgress:0.77];
  [(SBSystemApertureSettings *)self setBoundsCollapsingPhaseChangeProgress:0.95];
  [(SBSystemApertureSettings *)self setBoundsCompensatingPhaseChangeProgress:0.75];
  [(SBSystemApertureSettings *)self setSensorObscuringShadowApexProgress:0.5];
  v9 = [(SBSystemApertureSettings *)self defaultInterfaceElementTransitionSettings];
  [v9 setDefaultValues];

  v10 = [(SBSystemApertureSettings *)self inertInterfaceElementTransitionSettings];
  [v10 setDefaultValues];

  v11 = [(SBSystemApertureSettings *)self inertInterfaceElementTransitionSettings];
  v12 = [v11 defaultBehaviorSettings];
  [v12 setDampingRatio:0.6];

  v13 = [(SBSystemApertureSettings *)self inertInterfaceElementTransitionSettings];
  v14 = [v13 centerBehaviorSettings];
  [v14 setDampingRatio:0.6];

  v15 = [(SBSystemApertureSettings *)self inertInterfaceElementTransitionSettings];
  v16 = [v15 boundsBehaviorSettings];
  [v16 setDampingRatio:0.6];

  v17 = [(SBSystemApertureSettings *)self inertInterfaceElementTransitionSettings];
  v18 = [v17 cornerRadiusBehaviorSettings];
  [v18 setDampingRatio:0.6];

  v19 = [(SBSystemApertureSettings *)self inertInterfaceElementTransitionSettings];
  v20 = [v19 alphaBehaviorSettings];
  [v20 setDampingRatio:0.6];

  v21 = [(SBSystemApertureSettings *)self inertInterfaceElementTransitionSettings];
  v22 = [v21 backgroundColorBehaviorSettings];
  [v22 setDampingRatio:0.6];

  v23 = [(SBSystemApertureSettings *)self inertInterfaceElementTransitionSettings];
  [v23 setChildBehaviorSettingsNamePrefix:@"Inert Transition"];

  v24 = [(SBSystemApertureSettings *)self inertCollapsingInterfaceElementTransitionSettings];
  [v24 setDefaultValues];

  v25 = [(SBSystemApertureSettings *)self inertCollapsingInterfaceElementTransitionSettings];
  v26 = [v25 defaultBehaviorSettings];
  [v26 setResponse:0.45];

  v27 = [(SBSystemApertureSettings *)self inertCollapsingInterfaceElementTransitionSettings];
  v28 = [v27 centerBehaviorSettings];
  [v28 setResponse:0.45];

  v29 = [(SBSystemApertureSettings *)self inertCollapsingInterfaceElementTransitionSettings];
  v30 = [v29 boundsBehaviorSettings];
  [v30 setResponse:0.45];

  v31 = [(SBSystemApertureSettings *)self inertCollapsingInterfaceElementTransitionSettings];
  v32 = [v31 cornerRadiusBehaviorSettings];
  [v32 setResponse:0.45];

  v33 = [(SBSystemApertureSettings *)self inertCollapsingInterfaceElementTransitionSettings];
  v34 = [v33 alphaBehaviorSettings];
  [v34 setResponse:0.45];

  v35 = [(SBSystemApertureSettings *)self inertCollapsingInterfaceElementTransitionSettings];
  v36 = [v35 backgroundColorBehaviorSettings];
  [v36 setResponse:0.45];

  v37 = [(SBSystemApertureSettings *)self inertCollapsingInterfaceElementTransitionSettings];
  [v37 setChildBehaviorSettingsNamePrefix:@"Inert Collapsing Transition"];

  v38 = [(SBSystemApertureSettings *)self inertCompensatingInterfaceElementTransitionSettings];
  [v38 setDefaultValues];

  v39 = [(SBSystemApertureSettings *)self inertCompensatingInterfaceElementTransitionSettings];
  v40 = [v39 defaultBehaviorSettings];
  [v40 setResponse:0.45];

  v41 = [(SBSystemApertureSettings *)self inertCompensatingInterfaceElementTransitionSettings];
  v42 = [v41 centerBehaviorSettings];
  [v42 setResponse:0.45];

  v43 = [(SBSystemApertureSettings *)self inertCompensatingInterfaceElementTransitionSettings];
  v44 = [v43 boundsBehaviorSettings];
  [v44 setResponse:0.45];

  v45 = [(SBSystemApertureSettings *)self inertCompensatingInterfaceElementTransitionSettings];
  v46 = [v45 cornerRadiusBehaviorSettings];
  [v46 setResponse:0.45];

  v47 = [(SBSystemApertureSettings *)self inertCompensatingInterfaceElementTransitionSettings];
  v48 = [v47 alphaBehaviorSettings];
  [v48 setResponse:0.45];

  v49 = [(SBSystemApertureSettings *)self inertCompensatingInterfaceElementTransitionSettings];
  v50 = [v49 backgroundColorBehaviorSettings];
  [v50 setResponse:0.45];

  v51 = [(SBSystemApertureSettings *)self inertCompensatingInterfaceElementTransitionSettings];
  [v51 setChildBehaviorSettingsNamePrefix:@"Inert Compensating Transition"];

  v52 = [(SBSystemApertureSettings *)self compactInterfaceElementTransitionSettings];
  [v52 setDefaultValues];

  v53 = [(SBSystemApertureSettings *)self compactInterfaceElementTransitionSettings];
  [v53 setChildBehaviorSettingsNamePrefix:@"Compact Transition"];

  v54 = [(SBSystemApertureSettings *)self minimalInterfaceElementTransitionSettings];
  [v54 setDefaultValues];

  v55 = [(SBSystemApertureSettings *)self minimalInterfaceElementTransitionSettings];
  [v55 setChildBehaviorSettingsNamePrefix:@"Minimal Transition"];

  v56 = [(SBSystemApertureSettings *)self customInterfaceElementTransitionSettings];
  [v56 setDefaultValues];

  v57 = [(SBSystemApertureSettings *)self customInterfaceElementTransitionSettings];
  [v57 setChildBehaviorSettingsNamePrefix:@"Custom Transition"];

  v58 = [(SBSystemApertureSettings *)self popToCustomInterfaceElementTransitionSettings];
  [v58 setDefaultValues];

  v59 = [(SBSystemApertureSettings *)self popToCustomInterfaceElementTransitionSettings];
  [v59 setChildBehaviorSettingsNamePrefix:@"Pop To Custom Transition"];

  v60 = [(SBSystemApertureSettings *)self popToCustomInterfaceElementTransitionSettings];
  v61 = [v60 defaultBehaviorSettings];
  [v61 setResponse:0.4];

  v62 = [(SBSystemApertureSettings *)self popToCustomInterfaceElementTransitionSettings];
  v63 = [v62 defaultBehaviorSettings];
  [v63 setDampingRatio:0.78];

  v64 = [(SBSystemApertureSettings *)self popToCustomInterfaceElementTransitionSettings];
  v65 = [v64 centerBehaviorSettings];
  [v65 setResponse:0.4];

  v66 = [(SBSystemApertureSettings *)self popToCustomInterfaceElementTransitionSettings];
  v67 = [v66 centerBehaviorSettings];
  [v67 setDampingRatio:0.78];

  v68 = [(SBSystemApertureSettings *)self popToCustomInterfaceElementTransitionSettings];
  v69 = [v68 boundsBehaviorSettings];
  [v69 setResponse:0.4];

  v70 = [(SBSystemApertureSettings *)self popToCustomInterfaceElementTransitionSettings];
  v71 = [v70 boundsBehaviorSettings];
  [v71 setDampingRatio:0.78];

  v72 = [(SBSystemApertureSettings *)self elementContentTransitionSettings];
  [v72 setDefaultValues];

  v73 = [(SBSystemApertureSettings *)self elementContentTransitionSettings];
  v74 = [v73 customContentBehaviorSettings];
  [v74 setResponse:0.6];

  v75 = [(SBSystemApertureSettings *)self elementContentTransitionSettings];
  v76 = [v75 snapshotBehaviorSettings];
  [v76 setResponse:0.3];

  v77 = [(SBSystemApertureSettings *)self elementContentTransitionSettings];
  [v77 setChildBehaviorSettingsNamePrefix:@"Element Content"];

  v78 = [(SBSystemApertureSettings *)self contentInteractionBeginBehaviorSettings];
  [v78 setDefaultValues];

  v79 = [(SBSystemApertureSettings *)self contentInteractionBeginBehaviorSettings];
  [v79 setBehaviorType:1];

  v80 = [(SBSystemApertureSettings *)self contentInteractionBeginBehaviorSettings];
  objc_msgSend(v80, "setDampingRatio:");

  v81 = [(SBSystemApertureSettings *)self contentInteractionBeginBehaviorSettings];
  objc_msgSend(v81, "setResponse:");

  v82 = [(SBSystemApertureSettings *)self contentInteractionBeginBehaviorSettings];
  objc_msgSend(v82, "setRetargetImpulse:");

  v83 = [(SBSystemApertureSettings *)self contentInteractionBeginBehaviorSettings];
  CAFrameRateRange v306 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v83, "setFrameRateRange:highFrameRateReason:", 1114137, *(double *)&v306.minimum, *(double *)&v306.maximum, *(double *)&v306.preferred);

  v84 = [(SBSystemApertureSettings *)self contentInteractionBeginBehaviorSettings];
  [v84 setName:@"Content Interation Settings"];

  v85 = [(SBSystemApertureSettings *)self transitionToProminentPillSettings];
  [v85 setDefaultValues];

  v86 = [(SBSystemApertureSettings *)self transitionToProminentPillSettings];
  [v86 setBehaviorType:1];

  v87 = [(SBSystemApertureSettings *)self transitionToProminentPillSettings];
  [v87 setDampingRatio:0.55];

  v88 = [(SBSystemApertureSettings *)self transitionToProminentPillSettings];
  [v88 setResponse:0.45];

  v89 = [(SBSystemApertureSettings *)self transitionToProminentPillSettings];
  [v89 setName:@"Jindo Prominent Pill Transition"];

  v90 = [(SBSystemApertureSettings *)self transitionToProminentPillSettings];
  CAFrameRateRange v307 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v90, "setFrameRateRange:highFrameRateReason:", 1114137, *(double *)&v307.minimum, *(double *)&v307.maximum, *(double *)&v307.preferred);

  [(SBSystemApertureSettings *)self setProminentPillScale:1.55454545];
  [(SBSystemApertureSettings *)self setProminentPillContentScale:1.3];
  [(SBSystemApertureSettings *)self setProminentPillVerticalOffsetProportion:0.5];
  [(SBSystemApertureSettings *)self setTallRectWidth:166.0];
  [(SBSystemApertureSettings *)self setTallRectCornerRadius:71.3333333];
  [(SBSystemApertureSettings *)self setContainerHitRectVisible:0];
  [(SBSystemApertureSettings *)self setContainerHitRectTopMarginDefault:10.0];
  [(SBSystemApertureSettings *)self setContainerHitRectTopMarginWide:10.0];
  [(SBSystemApertureSettings *)self setContainerHitRectHorizontalMargin:10.0];
  [(SBSystemApertureSettings *)self setContainerHitRectHorizontalMarginLimit:75.0];
  [(SBSystemApertureSettings *)self setContainerHitRectHorizontalLimit:45.0];
  v91 = [(SBSystemApertureSettings *)self mitosisSecondaryBoundsSettings];
  [v91 setDefaultValues];

  v92 = [(SBSystemApertureSettings *)self mitosisSecondaryBoundsSettings];
  [v92 setBehaviorType:1];

  uint64_t v303 = 0;
  uint64_t v302 = 0;
  convertDampingMassAndStiffnessToDampingRatioAndResponse();
  v93 = [(SBSystemApertureSettings *)self mitosisSecondaryBoundsSettings];
  [v93 setDampingRatio:0.141];

  v94 = [(SBSystemApertureSettings *)self mitosisSecondaryBoundsSettings];
  [v94 setResponse:0.222];

  v95 = [(SBSystemApertureSettings *)self mitosisSecondaryBoundsSettings];
  [v95 setRetargetImpulse:0.0];

  v96 = [(SBSystemApertureSettings *)self mitosisSecondaryBoundsSettings];
  CAFrameRateRange v308 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v96, "setFrameRateRange:highFrameRateReason:", 1114137, *(double *)&v308.minimum, *(double *)&v308.maximum, *(double *)&v308.preferred);

  v97 = [(SBSystemApertureSettings *)self mitosisSecondaryBoundsSettings];
  [v97 setName:@"Mitosis Secondary Bounds"];

  [(SBSystemApertureSettings *)self setMitosisHeadstartDelay:0.13];
  v98 = [(SBSystemApertureSettings *)self recombinationSecondaryBoundsYSettings];
  [v98 setDefaultValues];

  v99 = [(SBSystemApertureSettings *)self recombinationSecondaryBoundsYSettings];
  [v99 setDampingRatio:0.6];

  v100 = [(SBSystemApertureSettings *)self recombinationSecondaryBoundsYSettings];
  [v100 setResponse:0.222];

  v101 = [(SBSystemApertureSettings *)self recombinationSecondaryBoundsYSettings];
  [v101 setRetargetImpulse:0.008];

  v102 = [(SBSystemApertureSettings *)self recombinationSecondaryBoundsYSettings];
  CAFrameRateRange v309 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v102, "setFrameRateRange:highFrameRateReason:", 1114137, *(double *)&v309.minimum, *(double *)&v309.maximum, *(double *)&v309.preferred);

  v103 = [(SBSystemApertureSettings *)self recombinationSecondaryBoundsYSettings];
  [v103 setName:@"Recombination Secondary Y-Bounds"];

  v104 = [(SBSystemApertureSettings *)self jindoAuthErrorShakeInitialKick];
  [v104 setDefaultValues];

  v105 = [(SBSystemApertureSettings *)self jindoAuthErrorShakeInitialKick];
  [v105 setBehaviorType:1];

  v106 = [(SBSystemApertureSettings *)self jindoAuthErrorShakeInitialKick];
  [v106 setDampingRatio:0.141];

  v107 = [(SBSystemApertureSettings *)self jindoAuthErrorShakeInitialKick];
  [v107 setResponse:0.222];

  v108 = [(SBSystemApertureSettings *)self jindoAuthErrorShakeInitialKick];
  [v108 setRetargetImpulse:0.02];

  v109 = [(SBSystemApertureSettings *)self jindoAuthErrorShakeInitialKick];
  CAFrameRateRange v310 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v109, "setFrameRateRange:highFrameRateReason:", 1114137, *(double *)&v310.minimum, *(double *)&v310.maximum, *(double *)&v310.preferred);

  v110 = [(SBSystemApertureSettings *)self jindoAuthErrorShakeInitialKick];
  [v110 setName:@"Shake Kick"];

  v111 = [(SBSystemApertureSettings *)self jindoAuthErrorShakeSettle];
  [v111 setDefaultValues];

  v112 = [(SBSystemApertureSettings *)self jindoAuthErrorShakeSettle];
  [v112 setBehaviorType:1];

  v113 = [(SBSystemApertureSettings *)self jindoAuthErrorShakeSettle];
  [v113 setDampingRatio:0.141];

  v114 = [(SBSystemApertureSettings *)self jindoAuthErrorShakeSettle];
  [v114 setResponse:0.222];

  v115 = [(SBSystemApertureSettings *)self jindoAuthErrorShakeSettle];
  [v115 setRetargetImpulse:0.02];

  v116 = [(SBSystemApertureSettings *)self jindoAuthErrorShakeSettle];
  CAFrameRateRange v311 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v116, "setFrameRateRange:highFrameRateReason:", 1114137, *(double *)&v311.minimum, *(double *)&v311.maximum, *(double *)&v311.preferred);

  v117 = [(SBSystemApertureSettings *)self jindoAuthErrorShakeSettle];
  [v117 setName:@"Shake Settle"];

  v118 = [(SBSystemApertureSettings *)self jindoAuthErrorStretchOut];
  [v118 setDefaultValues];

  v119 = [(SBSystemApertureSettings *)self jindoAuthErrorStretchOut];
  [v119 setBehaviorType:1];

  v120 = [(SBSystemApertureSettings *)self jindoAuthErrorStretchOut];
  [v120 setDampingRatio:1.0];

  v121 = [(SBSystemApertureSettings *)self jindoAuthErrorStretchOut];
  [v121 setResponse:0.23];

  v122 = [(SBSystemApertureSettings *)self jindoAuthErrorStretchOut];
  [v122 setRetargetImpulse:0.02];

  v123 = [(SBSystemApertureSettings *)self jindoAuthErrorStretchOut];
  CAFrameRateRange v312 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v123, "setFrameRateRange:highFrameRateReason:", 1114137, *(double *)&v312.minimum, *(double *)&v312.maximum, *(double *)&v312.preferred);

  v124 = [(SBSystemApertureSettings *)self jindoAuthErrorStretchOut];
  [v124 setName:@"Shake Stretch Out"];

  v125 = [(SBSystemApertureSettings *)self jindoAuthErrorStretchSettle];
  [v125 setDefaultCriticallyDampedValues];

  v126 = [(SBSystemApertureSettings *)self jindoAuthErrorStretchSettle];
  [v126 setBehaviorType:1];

  v127 = [(SBSystemApertureSettings *)self jindoAuthErrorStretchSettle];
  [v127 setDampingRatio:1.0];

  v128 = [(SBSystemApertureSettings *)self jindoAuthErrorStretchSettle];
  [v128 setResponse:0.732];

  v129 = [(SBSystemApertureSettings *)self jindoAuthErrorStretchSettle];
  CAFrameRateRange v313 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v129, "setFrameRateRange:highFrameRateReason:", 1114137, *(double *)&v313.minimum, *(double *)&v313.maximum, *(double *)&v313.preferred);

  v130 = [(SBSystemApertureSettings *)self jindoAuthErrorStretchSettle];
  [v130 setName:@"Shake Stretch Settle"];

  [(SBSystemApertureSettings *)self setShakeDisplacement:8.0];
  [(SBSystemApertureSettings *)self setShakeSensorExpansion:22.0];
  [(SBSystemApertureSettings *)self setShakeSensorOffset:3.0];
  [(SBSystemApertureSettings *)self setFirstShakeMilestone:0.923];
  [(SBSystemApertureSettings *)self setSecondShakeMilestone:0.756];
  [(SBSystemApertureSettings *)self setShakeRingerBell:1];
  v131 = [(SBSystemApertureSettings *)self bumpAnimationScaleUpSettings];
  [v131 setDefaultValues];

  v132 = [(SBSystemApertureSettings *)self bumpAnimationScaleUpSettings];
  [v132 setBehaviorType:1];

  v133 = [(SBSystemApertureSettings *)self bumpAnimationScaleUpSettings];
  [v133 setDampingRatio:0.4];

  v134 = [(SBSystemApertureSettings *)self bumpAnimationScaleUpSettings];
  [v134 setResponse:0.4];

  v135 = [(SBSystemApertureSettings *)self bumpAnimationScaleUpSettings];
  CAFrameRateRange v314 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v135, "setFrameRateRange:highFrameRateReason:", 1114137, *(double *)&v314.minimum, *(double *)&v314.maximum, *(double *)&v314.preferred);

  v136 = [(SBSystemApertureSettings *)self bumpAnimationScaleUpSettings];
  [v136 setName:@"Bump Scale Up"];

  v137 = [(SBSystemApertureSettings *)self bumpAnimationScaleDownSettings];
  [v137 setDefaultValues];

  v138 = [(SBSystemApertureSettings *)self bumpAnimationScaleDownSettings];
  [v138 setBehaviorType:1];

  v139 = [(SBSystemApertureSettings *)self bumpAnimationScaleDownSettings];
  [v139 setDampingRatio:1.0];

  v140 = [(SBSystemApertureSettings *)self bumpAnimationScaleDownSettings];
  [v140 setResponse:0.85];

  v141 = [(SBSystemApertureSettings *)self bumpAnimationScaleDownSettings];
  CAFrameRateRange v315 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v141, "setFrameRateRange:highFrameRateReason:", 1114137, *(double *)&v315.minimum, *(double *)&v315.maximum, *(double *)&v315.preferred);

  v142 = [(SBSystemApertureSettings *)self bumpAnimationScaleDownSettings];
  [v142 setName:@"Bump Scale Down"];

  [(SBSystemApertureSettings *)self setBumpAnimationXScale:1.015];
  [(SBSystemApertureSettings *)self setBumpAnimationYScale:1.03];
  v143 = [(SBSystemApertureSettings *)self pulseNoActionSettings];
  [v143 setDefaultValues];

  v144 = [(SBSystemApertureSettings *)self pulseNoActionSettings];
  v145 = [v144 expandBehaviorSettings];
  [v145 setBehaviorType:1];

  v146 = [(SBSystemApertureSettings *)self pulseNoActionSettings];
  v147 = [v146 expandBehaviorSettings];
  [v147 setDampingRatio:0.694];

  v148 = [(SBSystemApertureSettings *)self pulseNoActionSettings];
  v149 = [v148 expandBehaviorSettings];
  [v149 setResponse:0.525];

  v150 = [(SBSystemApertureSettings *)self pulseNoActionSettings];
  v151 = [v150 expandBehaviorSettings];
  [v151 setRetargetImpulse:0.02];

  v152 = [(SBSystemApertureSettings *)self pulseNoActionSettings];
  v153 = [v152 expandBehaviorSettings];
  [v153 setName:@"Pulse No Action Expand"];

  v154 = [(SBSystemApertureSettings *)self pulseNoActionSettings];
  v155 = [v154 expandBehaviorSettings];
  CAFrameRateRange v316 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v155, "setFrameRateRange:highFrameRateReason:", 1114137, *(double *)&v316.minimum, *(double *)&v316.maximum, *(double *)&v316.preferred);

  v156 = [(SBSystemApertureSettings *)self pulseNoActionSettings];
  [v156 setExpandDuration:0.2];

  v157 = [(SBSystemApertureSettings *)self pulseNoActionSettings];
  [v157 setExpandScale:1.25];

  v158 = [(SBSystemApertureSettings *)self pulseNoActionSettings];
  [v158 setExpandDelay:0.0];

  v159 = [(SBSystemApertureSettings *)self pulseNoActionSettings];
  v160 = [v159 contractBehaviorSettings];
  [v160 setDefaultValues];

  v161 = [(SBSystemApertureSettings *)self pulseNoActionSettings];
  v162 = [v161 contractBehaviorSettings];
  [v162 setDampingRatio:1.0];

  v163 = [(SBSystemApertureSettings *)self pulseNoActionSettings];
  v164 = [v163 contractBehaviorSettings];
  [v164 setResponse:0.8];

  v165 = [(SBSystemApertureSettings *)self pulseNoActionSettings];
  v166 = [v165 contractBehaviorSettings];
  [v166 setTrackingDampingRatio:0.86];

  v167 = [(SBSystemApertureSettings *)self pulseNoActionSettings];
  v168 = [v167 contractBehaviorSettings];
  [v168 setTrackingResponse:0.15];

  v169 = [(SBSystemApertureSettings *)self pulseNoActionSettings];
  v170 = [v169 contractBehaviorSettings];
  [v170 setName:@"Pulse No Action Contract"];

  v171 = [(SBSystemApertureSettings *)self pulseNoActionSettings];
  v172 = [v171 contractBehaviorSettings];
  CAFrameRateRange v317 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v172, "setFrameRateRange:highFrameRateReason:", 1114137, *(double *)&v317.minimum, *(double *)&v317.maximum, *(double *)&v317.preferred);

  [(SBSystemApertureSettings *)self setPulseIndicatorEnabled:0];
  v173 = [(SBSystemApertureSettings *)self pulseIndicatorSettings];
  [v173 setDefaultValues];

  v174 = [(SBSystemApertureSettings *)self pulseIndicatorSettings];
  v175 = [v174 expandBehaviorSettings];
  [v175 setBehaviorType:1];

  v176 = [(SBSystemApertureSettings *)self pulseIndicatorSettings];
  v177 = [v176 expandBehaviorSettings];
  [v177 setDampingRatio:0.694];

  v178 = [(SBSystemApertureSettings *)self pulseIndicatorSettings];
  v179 = [v178 expandBehaviorSettings];
  [v179 setResponse:0.525];

  v180 = [(SBSystemApertureSettings *)self pulseIndicatorSettings];
  v181 = [v180 expandBehaviorSettings];
  [v181 setRetargetImpulse:0.02];

  v182 = [(SBSystemApertureSettings *)self pulseIndicatorSettings];
  v183 = [v182 expandBehaviorSettings];
  [v183 setName:@"Pulse Indicator Expand"];

  v184 = [(SBSystemApertureSettings *)self pulseIndicatorSettings];
  v185 = [v184 expandBehaviorSettings];
  CAFrameRateRange v318 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v185, "setFrameRateRange:highFrameRateReason:", 1114137, *(double *)&v318.minimum, *(double *)&v318.maximum, *(double *)&v318.preferred);

  v186 = [(SBSystemApertureSettings *)self pulseIndicatorSettings];
  [v186 setExpandDuration:0.2];

  v187 = [(SBSystemApertureSettings *)self pulseIndicatorSettings];
  [v187 setExpandScale:1.125];

  v188 = [(SBSystemApertureSettings *)self pulseIndicatorSettings];
  [v188 setExpandDelay:0.1];

  v189 = [(SBSystemApertureSettings *)self pulseIndicatorSettings];
  v190 = [v189 contractBehaviorSettings];
  [v190 setDefaultValues];

  v191 = [(SBSystemApertureSettings *)self pulseNoActionSettings];
  v192 = [v191 contractBehaviorSettings];
  [v192 setDampingRatio:1.0];

  v193 = [(SBSystemApertureSettings *)self pulseNoActionSettings];
  v194 = [v193 contractBehaviorSettings];
  [v194 setResponse:0.8];

  v195 = [(SBSystemApertureSettings *)self pulseNoActionSettings];
  v196 = [v195 contractBehaviorSettings];
  [v196 setTrackingDampingRatio:0.86];

  v197 = [(SBSystemApertureSettings *)self pulseNoActionSettings];
  v198 = [v197 contractBehaviorSettings];
  [v198 setTrackingResponse:0.15];

  v199 = [(SBSystemApertureSettings *)self pulseIndicatorSettings];
  v200 = [v199 contractBehaviorSettings];
  [v200 setName:@"Pulse Indicator Contract"];

  v201 = [(SBSystemApertureSettings *)self pulseIndicatorSettings];
  v202 = [v201 contractBehaviorSettings];
  CAFrameRateRange v319 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v202, "setFrameRateRange:highFrameRateReason:", 1114137, *(double *)&v319.minimum, *(double *)&v319.maximum, *(double *)&v319.preferred);

  v203 = [(SBSystemApertureSettings *)self inflateAnimationScaleUpSettings];
  [v203 setDefaultValues];

  v204 = [(SBSystemApertureSettings *)self inflateAnimationScaleUpSettings];
  [v204 setBehaviorType:1];

  v205 = [(SBSystemApertureSettings *)self inflateAnimationScaleUpSettings];
  [v205 setDampingRatio:1.0];

  v206 = [(SBSystemApertureSettings *)self inflateAnimationScaleUpSettings];
  [v206 setResponse:2.0];

  v207 = [(SBSystemApertureSettings *)self inflateAnimationScaleUpSettings];
  CAFrameRateRange v320 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v207, "setFrameRateRange:highFrameRateReason:", 1114137, *(double *)&v320.minimum, *(double *)&v320.maximum, *(double *)&v320.preferred);

  v208 = [(SBSystemApertureSettings *)self inflateAnimationScaleUpSettings];
  [v208 setName:@"Inflate Scale Up"];

  v209 = [(SBSystemApertureSettings *)self inflateAnimationScaleDownSettings];
  [v209 setDefaultValues];

  v210 = [(SBSystemApertureSettings *)self inflateAnimationScaleDownSettings];
  [v210 setBehaviorType:1];

  v211 = [(SBSystemApertureSettings *)self inflateAnimationScaleDownSettings];
  [v211 setDampingRatio:1.0];

  v212 = [(SBSystemApertureSettings *)self inflateAnimationScaleDownSettings];
  [v212 setResponse:0.35];

  v213 = [(SBSystemApertureSettings *)self inflateAnimationScaleDownSettings];
  CAFrameRateRange v321 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v213, "setFrameRateRange:highFrameRateReason:", 1114137, *(double *)&v321.minimum, *(double *)&v321.maximum, *(double *)&v321.preferred);

  v214 = [(SBSystemApertureSettings *)self inflateAnimationScaleDownSettings];
  [v214 setName:@"Inflate Scale Down"];

  [(SBSystemApertureSettings *)self setInflateAnimationScale:1.4];
  [(SBSystemApertureSettings *)self setInflateAnimationContentScale:1.295];
  [(SBSystemApertureSettings *)self setInflateVerticalOffsetProportion:0.0];
  [(SBSystemApertureSettings *)self setExpansionToCompactBeginInflationProgress:0.2];
  [(SBSystemApertureSettings *)self setResizeGestureXRubberbanding:0.8];
  [(SBSystemApertureSettings *)self setResizeGestureYRubberbandingStretch:0.08];
  [(SBSystemApertureSettings *)self setResizeGestureYRubberbandingCompress:0.25];
  [(SBSystemApertureSettings *)self setResizeGestureYRangeBeginTracking:0.8];
  [(SBSystemApertureSettings *)self setResizeGestureYRangeEndTracking:1.0];
  [(SBSystemApertureSettings *)self setResizeGestureUpOffsetFactor:16.0];
  [(SBSystemApertureSettings *)self setResizeGestureMinEdgePadding:0.333333333];
  [(SBSystemApertureSettings *)self setResizeGestureSensorXSafetyMargin:1.1];
  [(SBSystemApertureSettings *)self setRecombineGestureXRubberbandingStretch:0.1];
  [(SBSystemApertureSettings *)self setRecombineGestureXRubberbandingCompress:0.25];
  [(SBSystemApertureSettings *)self setRecombineGestureXScaleFactorStretch:0.5];
  [(SBSystemApertureSettings *)self setRecombineGestureXScaleFactorCompress:0.5];
  [(SBSystemApertureSettings *)self setRecombineGestureTranslateFactorStretch:100.0];
  [(SBSystemApertureSettings *)self setRecombineGestureTranslateFactorCompress:100.0];
  [(SBSystemApertureSettings *)self setAcceptanceUpBounceReboundDelay:0.12];
  [(SBSystemApertureSettings *)self setAcceptanceUpBounceItemAppearanceDelayOffset:0.08];
  [(SBSystemApertureSettings *)self setAcceptanceUpBounceFinishingDelay:1.0];
  [(SBSystemApertureSettings *)self setAcceptanceUpBounceYStretch:17.0];
  [(SBSystemApertureSettings *)self setAcceptanceUpBounceYDownStretch:9.0];
  [(SBSystemApertureSettings *)self setAcceptanceUpBounceXPadding:8.0];
  [(SBSystemApertureSettings *)self setAcceptanceUpBounceFixedOvershootScaling:1.06];
  v215 = [(SBSystemApertureSettings *)self acceptanceBounceStretch];
  [v215 setDefaultValues];

  v216 = [(SBSystemApertureSettings *)self acceptanceBounceStretch];
  [v216 setBehaviorType:1];

  v217 = [(SBSystemApertureSettings *)self acceptanceBounceStretch];
  [v217 setDampingRatio:0.714];

  v218 = [(SBSystemApertureSettings *)self acceptanceBounceStretch];
  [v218 setResponse:0.5];

  v219 = [(SBSystemApertureSettings *)self acceptanceBounceStretch];
  [v219 setRetargetImpulse:0.02];

  v220 = [(SBSystemApertureSettings *)self acceptanceBounceStretch];
  CAFrameRateRange v322 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v220, "setFrameRateRange:highFrameRateReason:", 1114137, *(double *)&v322.minimum, *(double *)&v322.maximum, *(double *)&v322.preferred);

  v221 = [(SBSystemApertureSettings *)self acceptanceBounceStretch];
  [v221 setName:@"Acceptance Bounce Stretch"];

  v222 = [(SBSystemApertureSettings *)self acceptanceBounceRebound];
  [v222 setDefaultCriticallyDampedValues];

  v223 = [(SBSystemApertureSettings *)self acceptanceBounceRebound];
  [v223 setBehaviorType:1];

  v224 = [(SBSystemApertureSettings *)self acceptanceBounceRebound];
  [v224 setDampingRatio:1.0];

  v225 = [(SBSystemApertureSettings *)self acceptanceBounceRebound];
  [v225 setResponse:0.35];

  v226 = [(SBSystemApertureSettings *)self acceptanceBounceRebound];
  [v226 setRetargetImpulse:0.016];

  v227 = [(SBSystemApertureSettings *)self acceptanceBounceRebound];
  CAFrameRateRange v323 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v227, "setFrameRateRange:highFrameRateReason:", 1114137, *(double *)&v323.minimum, *(double *)&v323.maximum, *(double *)&v323.preferred);

  v228 = [(SBSystemApertureSettings *)self acceptanceBounceRebound];
  [v228 setName:@"Acceptance Bounce Rebound"];

  v229 = [(SBSystemApertureSettings *)self acceptanceBounceLayout];
  [v229 setDefaultValues];

  v230 = [(SBSystemApertureSettings *)self acceptanceBounceLayout];
  [v230 setBehaviorType:1];

  v231 = [(SBSystemApertureSettings *)self acceptanceBounceLayout];
  [v231 setDampingRatio:0.525];

  v232 = [(SBSystemApertureSettings *)self acceptanceBounceLayout];
  [v232 setResponse:0.513];

  v233 = [(SBSystemApertureSettings *)self acceptanceBounceLayout];
  [v233 setRetargetImpulse:0.02];

  v234 = [(SBSystemApertureSettings *)self acceptanceBounceLayout];
  CAFrameRateRange v324 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v234, "setFrameRateRange:highFrameRateReason:", 1114137, *(double *)&v324.minimum, *(double *)&v324.maximum, *(double *)&v324.preferred);

  v235 = [(SBSystemApertureSettings *)self acceptanceBounceLayout];
  [v235 setName:@"Acceptance Bounce Layout"];

  v236 = [(SBSystemApertureSettings *)self acceptanceBounceLayoutY];
  [v236 setDefaultValues];

  v237 = [(SBSystemApertureSettings *)self acceptanceBounceLayoutY];
  [v237 setBehaviorType:1];

  v238 = [(SBSystemApertureSettings *)self acceptanceBounceLayoutY];
  [v238 setDampingRatio:1.0];

  v239 = [(SBSystemApertureSettings *)self acceptanceBounceLayoutY];
  [v239 setResponse:0.513];

  v240 = [(SBSystemApertureSettings *)self acceptanceBounceLayoutY];
  CAFrameRateRange v325 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v240, "setFrameRateRange:highFrameRateReason:", 1114137, *(double *)&v325.minimum, *(double *)&v325.maximum, *(double *)&v325.preferred);

  v241 = [(SBSystemApertureSettings *)self acceptanceBounceLayoutY];
  [v241 setName:@"Acceptance Bounce LayoutY"];

  [(SBSystemApertureSettings *)self setAcceptanceSideBounceXVelocityThreshold:300.0];
  [(SBSystemApertureSettings *)self setAcceptanceSideBounceReboundDelay:0.12];
  [(SBSystemApertureSettings *)self setAcceptanceSideBounceItemAppearanceDelayOffset:0.1];
  [(SBSystemApertureSettings *)self setAcceptanceSideBounceFinishingDelay:1.0];
  [(SBSystemApertureSettings *)self setAcceptanceSideBounceXStretch:80.0];
  [(SBSystemApertureSettings *)self setAcceptanceSideBounceYPadding:9.0];
  [(SBSystemApertureSettings *)self setAcceptanceSideBounceXSensorExpansion:10.0];
  [(SBSystemApertureSettings *)self setAcceptanceSideBounceXSensorOffset:-5.0];
  v242 = [(SBSystemApertureSettings *)self acceptanceBounceSideStretch];
  [v242 setDefaultCriticallyDampedValues];

  v243 = [(SBSystemApertureSettings *)self acceptanceBounceSideStretch];
  [v243 setBehaviorType:1];

  v244 = [(SBSystemApertureSettings *)self acceptanceBounceSideStretch];
  [v244 setDampingRatio:1.0];

  v245 = [(SBSystemApertureSettings *)self acceptanceBounceSideStretch];
  [v245 setResponse:0.6];

  v246 = [(SBSystemApertureSettings *)self acceptanceBounceSideStretch];
  [v246 setRetargetImpulse:0.02];

  v247 = [(SBSystemApertureSettings *)self acceptanceBounceSideStretch];
  CAFrameRateRange v326 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v247, "setFrameRateRange:highFrameRateReason:", 1114137, *(double *)&v326.minimum, *(double *)&v326.maximum, *(double *)&v326.preferred);

  v248 = [(SBSystemApertureSettings *)self acceptanceBounceSideStretch];
  [v248 setName:@"Acceptance Bounce Side Stretch"];

  v249 = [(SBSystemApertureSettings *)self acceptanceBounceSideRebound];
  [v249 setDefaultCriticallyDampedValues];

  v250 = [(SBSystemApertureSettings *)self acceptanceBounceSideRebound];
  [v250 setBehaviorType:1];

  v251 = [(SBSystemApertureSettings *)self acceptanceBounceSideRebound];
  [v251 setDampingRatio:0.65];

  v252 = [(SBSystemApertureSettings *)self acceptanceBounceSideRebound];
  [v252 setResponse:0.62];

  v253 = [(SBSystemApertureSettings *)self acceptanceBounceSideRebound];
  [v253 setRetargetImpulse:0.0];

  v254 = [(SBSystemApertureSettings *)self acceptanceBounceSideRebound];
  CAFrameRateRange v327 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v254, "setFrameRateRange:highFrameRateReason:", 1114137, *(double *)&v327.minimum, *(double *)&v327.maximum, *(double *)&v327.preferred);

  v255 = [(SBSystemApertureSettings *)self acceptanceBounceSideRebound];
  [v255 setName:@"Acceptance Bounce Side Rebound"];

  v256 = [(SBSystemApertureSettings *)self acceptanceBounceSideLayout];
  [v256 setDefaultValues];

  v257 = [(SBSystemApertureSettings *)self acceptanceBounceSideLayout];
  [v257 setBehaviorType:1];

  v258 = [(SBSystemApertureSettings *)self acceptanceBounceSideLayout];
  [v258 setDampingRatio:0.512];

  v259 = [(SBSystemApertureSettings *)self acceptanceBounceSideLayout];
  [v259 setResponse:0.513];

  v260 = [(SBSystemApertureSettings *)self acceptanceBounceSideLayout];
  [v260 setRetargetImpulse:0.0];

  v261 = [(SBSystemApertureSettings *)self acceptanceBounceSideLayout];
  CAFrameRateRange v328 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v261, "setFrameRateRange:highFrameRateReason:", 1114137, *(double *)&v328.minimum, *(double *)&v328.maximum, *(double *)&v328.preferred);

  v262 = [(SBSystemApertureSettings *)self acceptanceBounceSideLayout];
  [v262 setName:@"Acceptance Bounce Side Layout"];

  v263 = [(SBSystemApertureSettings *)self acceptanceBounceSideLayoutY];
  [v263 setDefaultValues];

  v264 = [(SBSystemApertureSettings *)self acceptanceBounceSideLayoutY];
  [v264 setBehaviorType:1];

  v265 = [(SBSystemApertureSettings *)self acceptanceBounceSideLayoutY];
  [v265 setDampingRatio:1.0];

  v266 = [(SBSystemApertureSettings *)self acceptanceBounceSideLayoutY];
  [v266 setResponse:0.513];

  v267 = [(SBSystemApertureSettings *)self acceptanceBounceSideLayoutY];
  CAFrameRateRange v329 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v267, "setFrameRateRange:highFrameRateReason:", 1114137, *(double *)&v329.minimum, *(double *)&v329.maximum, *(double *)&v329.preferred);

  v268 = [(SBSystemApertureSettings *)self acceptanceBounceSideLayoutY];
  [v268 setName:@"Acceptance Bounce Side Layout Y"];

  [(SBSystemApertureSettings *)self setEjectionXStretch:5.33333333];
  [(SBSystemApertureSettings *)self setEjectionYStretch:40.0];
  [(SBSystemApertureSettings *)self setEjectionYUpOffset:5.33333333];
  [(SBSystemApertureSettings *)self setEjectionStretchDuration:0.15];
  [(SBSystemApertureSettings *)self setEjectionMaxCornerRadius:38.6666667];
  v269 = [(SBSystemApertureSettings *)self ejectionStretchSettings];
  [v269 setDefaultCriticallyDampedValues];

  v270 = [(SBSystemApertureSettings *)self ejectionStretchSettings];
  [v270 setBehaviorType:1];

  v271 = [(SBSystemApertureSettings *)self ejectionStretchSettings];
  CAFrameRateRange v330 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v271, "setFrameRateRange:highFrameRateReason:", 1114137, *(double *)&v330.minimum, *(double *)&v330.maximum, *(double *)&v330.preferred);

  v272 = [(SBSystemApertureSettings *)self ejectionStretchSettings];
  [v272 setName:@"Ejection Stretch"];

  v273 = [(SBSystemApertureSettings *)self ejectionContractionSettings];
  [v273 setDefaultCriticallyDampedValues];

  v274 = [(SBSystemApertureSettings *)self ejectionContractionSettings];
  [v274 setBehaviorType:1];

  v275 = [(SBSystemApertureSettings *)self ejectionContractionSettings];
  [v275 setDampingRatio:1.0];

  v276 = [(SBSystemApertureSettings *)self ejectionContractionSettings];
  [v276 setResponse:0.513];

  v277 = [(SBSystemApertureSettings *)self ejectionContractionSettings];
  CAFrameRateRange v331 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v277, "setFrameRateRange:highFrameRateReason:", 1114137, *(double *)&v331.minimum, *(double *)&v331.maximum, *(double *)&v331.preferred);

  v278 = [(SBSystemApertureSettings *)self ejectionContractionSettings];
  [v278 setName:@"Ejection Contraction"];

  [(SBSystemApertureSettings *)self setKeyLineEnabled:1];
  v279 = [(SBSystemApertureSettings *)self keyLineStyleTransition];
  [v279 setDefaultValues];

  v280 = [(SBSystemApertureSettings *)self keyLineStyleTransition];
  [v280 setBehaviorType:1];

  v281 = [(SBSystemApertureSettings *)self keyLineStyleTransition];
  [v281 setDampingRatio:1.0];

  v282 = [(SBSystemApertureSettings *)self keyLineStyleTransition];
  [v282 setResponse:1.0];

  v283 = [(SBSystemApertureSettings *)self keyLineDisappearToInertTransition];
  [v283 setDefaultValues];

  v284 = [(SBSystemApertureSettings *)self keyLineDisappearToInertTransition];
  [v284 setBehaviorType:1];

  v285 = [(SBSystemApertureSettings *)self keyLineDisappearToInertTransition];
  [v285 setDampingRatio:1.0];

  v286 = [(SBSystemApertureSettings *)self keyLineDisappearToInertTransition];
  [v286 setResponse:1.2];

  v287 = [(SBSystemApertureSettings *)self keyLineAppearForSwoopTransition];
  [v287 setDefaultValues];

  v288 = [(SBSystemApertureSettings *)self keyLineAppearForSwoopTransition];
  [v288 setBehaviorType:1];

  v289 = [(SBSystemApertureSettings *)self keyLineAppearForSwoopTransition];
  [v289 setDampingRatio:1.0];

  v290 = [(SBSystemApertureSettings *)self keyLineAppearForSwoopTransition];
  [v290 setResponse:0.75];

  [(SBSystemApertureSettings *)self setActivityKeyLineColorEnabled:1];
  [(SBSystemApertureSettings *)self setKeyLineAlpha:0.35];
  [(SBSystemApertureSettings *)self setKeyLineThickness:1.66666667];
  [(SBSystemApertureSettings *)self setAdaptiveKeyLineThickness:1.66666667];
  v291 = [(SBSystemApertureSettings *)self adaptiveKeyLineColorMatrix];
  [v291 setDefaultValues];

  v292 = [(SBSystemApertureSettings *)self adaptiveKeyLineColorMatrix];
  v293[0] = 0;
  v293[1] = 0;
  int v294 = 1064396915;
  uint64_t v295 = 0;
  uint64_t v296 = 0;
  int v297 = 1064396915;
  uint64_t v298 = 0;
  uint64_t v299 = 0;
  long long v300 = xmmword_1D8FD2EE0;
  uint64_t v301 = 1039516303;
  [v292 setColorMatrix:v293];

  [(SBSystemApertureSettings *)self setKeyLineDarkToMixedMinLuma:0.05];
  [(SBSystemApertureSettings *)self setKeyLineMixedToDarkMaxLuma:0.05];
  [(SBSystemApertureSettings *)self setKeyLineColorFixedLstar:50.0];
  [(SBSystemApertureSettings *)self setSuppressHidingOnClonedDisplayWhileEmpty:0];
  [(SBSystemApertureSettings *)self setSuppressHidingInSnapshotsWhileEmpty:0];
  [(SBSystemApertureSettings *)self setAlphaTransitionDurationOnClonedDisplay:0.15];
  [(SBSystemApertureSettings *)self setHideRemotePrototypingFallbackPill:0];
  [(SBSystemApertureSettings *)self setMinimumRequiredSymmetryInCompactLayoutMode:0.75];
  [(SBSystemApertureSettings *)self setPaddingFromScreenEdgeRequiringSymmetricLayout:46.0];
  [(SBSystemApertureSettings *)self setSuppressWhilePresentingControlCenter:0];
  [(SBSystemApertureSettings *)self setElementShadowEnabled:1];
  [(SBSystemApertureSettings *)self setBackgroundBlurEnabled:1];
}

+ (id)settingsControllerModule
{
  v360[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F94100];
  v3 = [MEMORY[0x1E4F94178] actionWithSettingsKeyPath:0];
  int v294 = [v2 rowWithTitle:@"Restore Defaults" action:v3];

  v4 = (void *)MEMORY[0x1E4F94168];
  v360[0] = v294;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v360 count:1];
  v336 = [v4 sectionWithRows:v5];

  v334 = (void *)MEMORY[0x1E4F94168];
  v332 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Highlight Transitions" valueKeyPath:@"highlightTransitions"];
  v359[0] = v332;
  CAFrameRateRange v330 = [MEMORY[0x1E4F94140] rowWithTitle:@"Collision Progress" valueKeyPath:@"boundsCollisionProgress"];
  CAFrameRateRange v327 = [v330 between:0.0 and:1.0];
  CAFrameRateRange v324 = [v327 precision:2];
  v359[1] = v324;
  CAFrameRateRange v322 = [MEMORY[0x1E4F94140] rowWithTitle:@"Inert Collapsing Layout Progress" valueKeyPath:@"boundsCollapsingPhaseChangeProgress"];
  CAFrameRateRange v320 = [v322 between:0.0 and:1.0];
  CAFrameRateRange v318 = [v320 precision:2];
  v359[2] = v318;
  CAFrameRateRange v315 = [MEMORY[0x1E4F94140] rowWithTitle:@"Inert Compensating Layout Progress" valueKeyPath:@"boundsCompensatingPhaseChangeProgress"];
  CAFrameRateRange v311 = [v315 between:0.0 and:1.0];
  CAFrameRateRange v306 = [v311 precision:2];
  v359[3] = v306;
  uint64_t v301 = [MEMORY[0x1E4F94140] rowWithTitle:@"Sensor Shadow Apex Progress" valueKeyPath:@"sensorObscuringShadowApexProgress"];
  uint64_t v295 = [v301 between:0.0 and:1.0];
  v292 = [v295 precision:2];
  v359[4] = v292;
  v6 = [MEMORY[0x1E4F94138] rowWithTitle:@"Default Behavior Settings" childSettingsKeyPath:@"defaultInterfaceElementTransitionSettings"];
  v359[5] = v6;
  v7 = [MEMORY[0x1E4F94138] rowWithTitle:@"Inert Default Behavior Settings" childSettingsKeyPath:@"inertInterfaceElementTransitionSettings"];
  v359[6] = v7;
  v8 = [MEMORY[0x1E4F94138] rowWithTitle:@"Inert Collapsing Behavior Settings" childSettingsKeyPath:@"inertCollapsingInterfaceElementTransitionSettings"];
  v359[7] = v8;
  v9 = [MEMORY[0x1E4F94138] rowWithTitle:@"Inert Compensating Behavior Settings" childSettingsKeyPath:@"inertCompensatingInterfaceElementTransitionSettings"];
  v359[8] = v9;
  v10 = [MEMORY[0x1E4F94138] rowWithTitle:@"*->Compact Behavior Settings" childSettingsKeyPath:@"compactInterfaceElementTransitionSettings"];
  v359[9] = v10;
  v11 = [MEMORY[0x1E4F94138] rowWithTitle:@"*->Minimal Behavior Settings" childSettingsKeyPath:@"minimalInterfaceElementTransitionSettings"];
  v359[10] = v11;
  v12 = [MEMORY[0x1E4F94138] rowWithTitle:@"*->Custom Behavior Settings" childSettingsKeyPath:@"customInterfaceElementTransitionSettings"];
  v359[11] = v12;
  v13 = [MEMORY[0x1E4F94138] rowWithTitle:@"User Pop to Custom Behavior Settings" childSettingsKeyPath:@"popToCustomInterfaceElementTransitionSettings"];
  v359[12] = v13;
  v14 = [MEMORY[0x1E4F94138] rowWithTitle:@"Element Content Behavior Settings" childSettingsKeyPath:@"elementContentTransitionSettings"];
  v359[13] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v359 count:14];
  v335 = [v334 sectionWithRows:v15 title:@"Interface Element Transitions"];

  v16 = (void *)MEMORY[0x1E4F94168];
  v17 = [MEMORY[0x1E4F94138] rowWithTitle:@"Oval Layout Animation Settings" childSettingsKeyPath:@"jindoBoundsOval"];
  v358 = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v358 count:1];
  v333 = [v16 sectionWithRows:v18 title:@"Resize Settings"];

  v19 = (void *)MEMORY[0x1E4F94168];
  v20 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Make Sensor Shadow Visible" valueKeyPath:@"sensorShadowVisible"];
  v357[0] = v20;
  v21 = [MEMORY[0x1E4F94140] rowWithTitle:@"Sensor Shadow Opacity Factor" valueKeyPath:@"sensorShadowOpacityFactor"];
  v22 = [v21 between:0.0 and:100.0];
  v23 = [v22 precision:2];
  v357[1] = v23;
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v357 count:2];
  CAFrameRateRange v331 = [v19 sectionWithRows:v24 title:@"Content Settings"];

  CAFrameRateRange v328 = (void *)MEMORY[0x1E4F94168];
  CAFrameRateRange v325 = [MEMORY[0x1E4F94138] rowWithTitle:@"Transition To Prominent Pill Settings" childSettingsKeyPath:@"transitionToProminentPillSettings"];
  v356[0] = v325;
  v25 = [MEMORY[0x1E4F94140] rowWithTitle:@"Prominent Pill Scale" valueKeyPath:@"prominentPillScale"];
  v26 = [v25 between:0.0 and:10.0];
  v27 = [v26 precision:2];
  v356[1] = v27;
  v28 = [MEMORY[0x1E4F94140] rowWithTitle:@"Prominent Pill Content Scale" valueKeyPath:@"prominentPillContentScale"];
  v29 = [v28 between:0.0 and:10.0];
  v30 = [v29 precision:2];
  v356[2] = v30;
  v31 = [MEMORY[0x1E4F94140] rowWithTitle:@"Prominent Pill Vertical Offset" valueKeyPath:@"prominentPillVerticalOffsetProportion"];
  v32 = [v31 between:-1.0 and:1.0];
  v33 = [v32 precision:2];
  v356[3] = v33;
  v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v356 count:4];
  CAFrameRateRange v329 = [v328 sectionWithRows:v34 title:@"Prominent Pill"];

  v35 = (void *)MEMORY[0x1E4F94168];
  v36 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Corner Radius" valueKeyPath:@"tallRectCornerRadius"];
  v37 = [v36 minValue:39.0 maxValue:56.0];
  v355[0] = v37;
  v38 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Width" valueKeyPath:@"tallRectWidth"];
  v39 = [v38 minValue:160.0 maxValue:180.0];
  v355[1] = v39;
  v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v355 count:2];
  CAFrameRateRange v326 = [v35 sectionWithRows:v40 title:@"Tall Rect"];

  v293 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Make Hit Rects Visible" valueKeyPath:@"containerHitRectVisible"];
  v41 = [MEMORY[0x1E4F94140] rowWithTitle:@"Default Top Margin" valueKeyPath:@"containerHitRectTopMarginDefault"];
  v42 = [v41 between:0.0 and:10.0];
  v291 = [v42 precision:2];

  v43 = [MEMORY[0x1E4F94140] rowWithTitle:@"Wide Top Margin" valueKeyPath:@"containerHitRectTopMarginWide"];
  v44 = [v43 between:0.0 and:10.0];
  v290 = [v44 precision:2];

  v45 = [MEMORY[0x1E4F94140] rowWithTitle:@"Horizontal Margin" valueKeyPath:@"containerHitRectHorizontalMargin"];
  v46 = [v45 between:0.0 and:100.0];
  v289 = [v46 precision:2];

  v47 = [MEMORY[0x1E4F94140] rowWithTitle:@"Horizontal Margin Limit" valueKeyPath:@"containerHitRectHorizontalMarginLimit"];
  v48 = [v47 between:0.0 and:100.0];
  v288 = [v48 precision:2];

  v49 = [MEMORY[0x1E4F94140] rowWithTitle:@"Horizontal Limit" valueKeyPath:@"containerHitRectHorizontalLimit"];
  v50 = [v49 between:0.0 and:100.0];
  v287 = [v50 precision:2];

  v51 = (void *)MEMORY[0x1E4F94168];
  v354[0] = v293;
  v354[1] = v291;
  v354[2] = v290;
  v354[3] = v289;
  v354[4] = v288;
  v354[5] = v287;
  v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:v354 count:6];
  CAFrameRateRange v323 = [v51 sectionWithRows:v52 title:@"Content Hit Testing"];

  v53 = (void *)MEMORY[0x1E4F94168];
  v54 = [MEMORY[0x1E4F94138] rowWithTitle:@"Baby Split Bounds Settings" childSettingsKeyPath:@"mitosisSecondaryBoundsSettings"];
  v353[0] = v54;
  v55 = [MEMORY[0x1E4F94140] rowWithTitle:@"Baby Headstart Delay" valueKeyPath:@"mitosisHeadstartDelay"];
  v56 = [v55 between:0.0 and:1.0];
  v57 = [v56 precision:2];
  v353[1] = v57;
  v58 = [MEMORY[0x1E4F1C978] arrayWithObjects:v353 count:2];
  CAFrameRateRange v321 = [v53 sectionWithRows:v58 title:@"Mitosis"];

  v59 = (void *)MEMORY[0x1E4F94168];
  v60 = [MEMORY[0x1E4F94138] rowWithTitle:@"Baby Recombination Y Bounds Settings" childSettingsKeyPath:@"recombinationSecondaryBoundsYSettings"];
  v352 = v60;
  v61 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v352 count:1];
  CAFrameRateRange v319 = [v59 sectionWithRows:v61 title:@"Mitosis Recombination"];

  CAFrameRateRange v316 = (void *)MEMORY[0x1E4F94168];
  CAFrameRateRange v312 = [MEMORY[0x1E4F94138] rowWithTitle:@"Shake Initial Kick Animation Settings" childSettingsKeyPath:@"jindoAuthErrorShakeInitialKick"];
  v351[0] = v312;
  CAFrameRateRange v307 = [MEMORY[0x1E4F94138] rowWithTitle:@"Shake Settle Animation Settings" childSettingsKeyPath:@"jindoAuthErrorShakeSettle"];
  v351[1] = v307;
  uint64_t v302 = [MEMORY[0x1E4F94138] rowWithTitle:@"Shake Stretch Out Animation Settings" childSettingsKeyPath:@"jindoAuthErrorStretchOut"];
  v351[2] = v302;
  uint64_t v296 = [MEMORY[0x1E4F94138] rowWithTitle:@"Shake Stretch Settle Animation Settings" childSettingsKeyPath:@"jindoAuthErrorStretchSettle"];
  v351[3] = v296;
  v283 = [MEMORY[0x1E4F94140] rowWithTitle:@"Shake X Displacement" valueKeyPath:@"shakeDisplacement"];
  v279 = [v283 between:-100.0 and:100.0];
  v274 = [v279 precision:3];
  v351[4] = v274;
  v269 = [MEMORY[0x1E4F94140] rowWithTitle:@"Shake Sensor Expand Width" valueKeyPath:@"shakeSensorExpansion"];
  v262 = [v269 between:0.0 and:100.0];
  v255 = [v262 precision:3];
  v351[5] = v255;
  v249 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Shake Sensor Expand Width" valueKeyPath:@"shakeSensorExpansion"];
  v242 = [v249 minValue:-50.0 maxValue:50.0];
  v351[6] = v242;
  id v235 = [MEMORY[0x1E4F94140] rowWithTitle:@"Shake Sensor Expand Offset" valueKeyPath:@"shakeSensorOffset"];
  v229 = [v235 between:-100.0 and:100.0];
  v223 = [v229 precision:3];
  v351[7] = v223;
  v62 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Shake Sensor Expand Offset" valueKeyPath:@"shakeSensorOffset"];
  v63 = [v62 minValue:-50.0 maxValue:50.0];
  v351[8] = v63;
  v64 = [MEMORY[0x1E4F94140] rowWithTitle:@"First Shake Milestone" valueKeyPath:@"firstShakeMilestone"];
  v65 = [v64 between:0.0 and:1.0];
  v66 = [v65 precision:2];
  v351[9] = v66;
  v67 = [MEMORY[0x1E4F94140] rowWithTitle:@"Second Shake Milestone" valueKeyPath:@"secondShakeMilestone"];
  v68 = [v67 between:0.0 and:1.0];
  v69 = [v68 precision:2];
  v351[10] = v69;
  v70 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Shake Ringer Bell" valueKeyPath:@"shakeRingerBell"];
  v351[11] = v70;
  v71 = [MEMORY[0x1E4F1C978] arrayWithObjects:v351 count:12];
  CAFrameRateRange v317 = [v316 sectionWithRows:v71 title:@"Shake (Auth Error) Settings"];

  CAFrameRateRange v313 = (void *)MEMORY[0x1E4F94168];
  CAFrameRateRange v308 = [MEMORY[0x1E4F94138] rowWithTitle:@"Bump ScaleUp Anim. Settings" childSettingsKeyPath:@"bumpAnimationScaleUpSettings"];
  v350[0] = v308;
  uint64_t v303 = [MEMORY[0x1E4F94138] rowWithTitle:@"Bump ScaleDown Anim. Settings" childSettingsKeyPath:@"bumpAnimationScaleDownSettings"];
  v350[1] = v303;
  int v297 = [MEMORY[0x1E4F94140] rowWithTitle:@"Bump Scale X" valueKeyPath:@"bumpAnimationXScale"];
  v72 = [v297 between:0.1 and:1.5];
  v73 = [v72 precision:4];
  v350[2] = v73;
  v74 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Bump Scale X" valueKeyPath:@"bumpAnimationXScale"];
  v75 = [v74 minValue:0.1 maxValue:1.5];
  v350[3] = v75;
  v76 = [MEMORY[0x1E4F94140] rowWithTitle:@"Bump Scale Y" valueKeyPath:@"bumpAnimationYScale"];
  v77 = [v76 between:0.1 and:1.5];
  v78 = [v77 precision:4];
  v350[4] = v78;
  v79 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Bump Scale Y" valueKeyPath:@"bumpAnimationYScale"];
  v80 = [v79 minValue:0.1 maxValue:1.5];
  v350[5] = v80;
  v81 = [MEMORY[0x1E4F1C978] arrayWithObjects:v350 count:6];
  CAFrameRateRange v314 = [v313 sectionWithRows:v81 title:@"Bump Animation"];

  CAFrameRateRange v309 = (void *)MEMORY[0x1E4F94168];
  objc_super v304 = [MEMORY[0x1E4F94138] rowWithTitle:@"Inflate ScaleUp Anim. Settings" childSettingsKeyPath:@"inflateAnimationScaleUpSettings"];
  v349[0] = v304;
  uint64_t v298 = [MEMORY[0x1E4F94138] rowWithTitle:@"Inflate ScaleDown Anim. Settings" childSettingsKeyPath:@"inflateAnimationScaleDownSettings"];
  v349[1] = v298;
  v284 = [MEMORY[0x1E4F94140] rowWithTitle:@"Inflate Scale" valueKeyPath:@"inflateAnimationScale"];
  v280 = [v284 between:0.1 and:5.0];
  v275 = [v280 precision:2];
  v349[2] = v275;
  v82 = [MEMORY[0x1E4F94140] rowWithTitle:@"Inflate Vertical Offset" valueKeyPath:@"inflateVerticalOffsetProportion"];
  v83 = [v82 between:-1.0 and:1.0];
  v84 = [v83 precision:2];
  v349[3] = v84;
  v85 = [MEMORY[0x1E4F94140] rowWithTitle:@"Inflate Content Scale" valueKeyPath:@"inflateAnimationContentScale"];
  v86 = [v85 between:0.1 and:5.0];
  v87 = [v86 precision:2];
  v349[4] = v87;
  v88 = [MEMORY[0x1E4F94140] rowWithTitle:@"Expansion Begin Inflate Milestone" valueKeyPath:@"expansionToCompactBeginInflationProgress"];
  v89 = [v88 between:0.01 and:1.0];
  v90 = [v89 precision:2];
  v349[5] = v90;
  v91 = [MEMORY[0x1E4F1C978] arrayWithObjects:v349 count:6];
  CAFrameRateRange v310 = [v309 sectionWithRows:v91 title:@"Inflate Animation"];

  v92 = (void *)MEMORY[0x1E4F94168];
  v93 = [MEMORY[0x1E4F94138] rowWithTitle:@"Pulse No Action Settings" childSettingsKeyPath:@"pulseNoActionSettings"];
  v348[0] = v93;
  v94 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Pulse Indicator Enabled" valueKeyPath:@"pulseIndicatorEnabled"];
  v348[1] = v94;
  v95 = [MEMORY[0x1E4F94138] rowWithTitle:@"Pulse Indicator Settings" childSettingsKeyPath:@"pulseIndicatorSettings"];
  v348[2] = v95;
  v96 = [MEMORY[0x1E4F1C978] arrayWithObjects:v348 count:3];
  CAFrameRateRange v305 = [v92 sectionWithRows:v96 title:@"Pulse Animation"];

  uint64_t v299 = (void *)MEMORY[0x1E4F94168];
  v285 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Key Line" valueKeyPath:@"keyLineEnabled"];
  v347[0] = v285;
  v281 = [MEMORY[0x1E4F94138] rowWithTitle:@"Key Line Transition Animation Settings" childSettingsKeyPath:@"keyLineStyleTransition"];
  v347[1] = v281;
  v276 = [MEMORY[0x1E4F94138] rowWithTitle:@"[disabled?] Key Line Disappear to Inert Anim. Settings" childSettingsKeyPath:@"keyLineDisappearToInertTransition"];
  v347[2] = v276;
  v270 = [MEMORY[0x1E4F94138] rowWithTitle:@"Key Line Appear for Swoop Anim. Settings" childSettingsKeyPath:@"keyLineAppearForSwoopTransition"];
  v347[3] = v270;
  v263 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Key Line Session/Activity Colors" valueKeyPath:@"activityKeyLineColorEnabled"];
  v347[4] = v263;
  v256 = [MEMORY[0x1E4F94140] rowWithTitle:@"Key Line Alpha" valueKeyPath:@"keyLineAlpha"];
  v250 = [v256 between:0.0 and:1.0];
  v243 = [v250 precision:2];
  v347[5] = v243;
  id v236 = [MEMORY[0x1E4F94110] rowWithTitle:@"Key Line Thickness" valueKeyPath:@"keyLineThickness"];
  v230 = [v236 possibleValues:&unk_1F3348510 titles:&unk_1F3348528];
  v347[6] = v230;
  v224 = [MEMORY[0x1E4F94110] rowWithTitle:@"Adaptive Key Line Thickness" valueKeyPath:@"adaptiveKeyLineThickness"];
  v218 = [v224 possibleValues:&unk_1F3348510 titles:&unk_1F3348528];
  v347[7] = v218;
  v213 = [MEMORY[0x1E4F94138] rowWithTitle:@"Adaptive Key Line Color Matrix" childSettingsKeyPath:@"adaptiveKeyLineColorMatrix"];
  v347[8] = v213;
  v97 = [MEMORY[0x1E4F94140] rowWithTitle:@"Dark To Mixed Min Luma" valueKeyPath:@"keyLineDarkToMixedMinLuma"];
  v98 = [v97 between:0.0 and:1.0];
  v99 = [v98 precision:2];
  v347[9] = v99;
  v100 = [MEMORY[0x1E4F94140] rowWithTitle:@"Mixed to Dark Max Luma" valueKeyPath:@"keyLineMixedToDarkMaxLuma"];
  v101 = [v100 between:0.0 and:1.0];
  v102 = [v101 precision:2];
  v347[10] = v102;
  v103 = [MEMORY[0x1E4F94140] rowWithTitle:@"Color Key Fixed Lightness" valueKeyPath:@"keyLineColorFixedLstar"];
  v104 = [v103 between:0.0 and:100.0];
  v105 = [v104 precision:1];
  v347[11] = v105;
  v106 = [MEMORY[0x1E4F1C978] arrayWithObjects:v347 count:12];
  long long v300 = [v299 sectionWithRows:v106 title:@"Key Line"];

  v107 = (void *)MEMORY[0x1E4F94168];
  v108 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Suppress Hiding for Mirroring/Recording" valueKeyPath:@"suppressHidingOnClonedDisplayWhileEmpty"];
  v346[0] = v108;
  v109 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Suppress Hiding for Screenshots" valueKeyPath:@"suppressHidingInSnapshotsWhileEmpty"];
  v346[1] = v109;
  v110 = [MEMORY[0x1E4F94140] rowWithTitle:@"Alpha Transition Duration" valueKeyPath:@"alphaTransitionDurationOnClonedDisplay"];
  v111 = [v110 between:0.0 and:1.0];
  v112 = [v111 precision:2];
  v346[2] = v112;
  v113 = [MEMORY[0x1E4F1C978] arrayWithObjects:v346 count:3];
  v286 = [v107 sectionWithRows:v113 title:@"Screen Recording/Mirroring/Screenshots"];

  v114 = (void *)MEMORY[0x1E4F94168];
  v115 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Suppress Fallback Pill for Remote Prototyping" valueKeyPath:@"hideRemotePrototypingFallbackPill"];
  v345 = v115;
  v116 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v345 count:1];
  v282 = [v114 sectionWithRows:v116 title:@"Remote Prototyping"];

  v277 = (void *)MEMORY[0x1E4F94168];
  v271 = [MEMORY[0x1E4F94140] rowWithTitle:@"X Rubberbanding" valueKeyPath:@"resizeGestureXRubberbanding"];
  v264 = [v271 between:0.0 and:2.0];
  v257 = [v264 precision:2];
  v344[0] = v257;
  v251 = [MEMORY[0x1E4F94140] rowWithTitle:@"Y Rubberbanding (Stretch)" valueKeyPath:@"resizeGestureYRubberbandingStretch"];
  v244 = [v251 between:0.0 and:2.0];
  id v237 = [v244 precision:2];
  v344[1] = v237;
  v231 = [MEMORY[0x1E4F94140] rowWithTitle:@"Y Rubberbanding (Compress)" valueKeyPath:@"resizeGestureYRubberbandingCompress"];
  v225 = [v231 between:0.0 and:2.0];
  v219 = [v225 precision:2];
  v344[2] = v219;
  v214 = [MEMORY[0x1E4F94140] rowWithTitle:@"Y Begin 1-1 Tracking" valueKeyPath:@"resizeGestureYRangeBeginTracking"];
  v210 = [v214 between:0.0 and:2.0];
  v208 = [v210 precision:2];
  v344[3] = v208;
  v206 = [MEMORY[0x1E4F94140] rowWithTitle:@"Y End 1-1 Tracking" valueKeyPath:@"resizeGestureYRangeEndTracking"];
  v204 = [v206 between:0.0 and:2.0];
  v202 = [v204 precision:2];
  v344[4] = v202;
  v117 = [MEMORY[0x1E4F94140] rowWithTitle:@"Slide Up Factor" valueKeyPath:@"resizeGestureUpOffsetFactor"];
  v118 = [v117 between:0.0 and:100.0];
  v119 = [v118 precision:2];
  v344[5] = v119;
  v120 = [MEMORY[0x1E4F94140] rowWithTitle:@"Min Edge Padding" valueKeyPath:@"resizeGestureMinEdgePadding"];
  v121 = [v120 between:0.0 and:100.0];
  v122 = [v121 precision:2];
  v344[6] = v122;
  v123 = [MEMORY[0x1E4F94140] rowWithTitle:@"Compress Sensor X Safety Margin" valueKeyPath:@"resizeGestureSensorXSafetyMargin"];
  v124 = [v123 between:0.0 and:100.0];
  v125 = [v124 precision:2];
  v344[7] = v125;
  v126 = [MEMORY[0x1E4F1C978] arrayWithObjects:v344 count:8];
  v278 = [v277 sectionWithRows:v126 title:@"Resize Gesture"];

  v272 = (void *)MEMORY[0x1E4F94168];
  v265 = [MEMORY[0x1E4F94140] rowWithTitle:@"Baby Translate Stretch" valueKeyPath:@"recombineGestureTranslateFactorStretch"];
  v258 = [v265 between:0.0 and:300.0];
  v252 = [v258 precision:2];
  v343[0] = v252;
  v245 = [MEMORY[0x1E4F94140] rowWithTitle:@"Baby Translate Compress" valueKeyPath:@"recombineGestureTranslateFactorCompress"];
  id v238 = [v245 between:0.0 and:300.0];
  v232 = [v238 precision:2];
  v343[1] = v232;
  v226 = [MEMORY[0x1E4F94140] rowWithTitle:@"Baby X Scale Stretch" valueKeyPath:@"recombineGestureXScaleFactorStretch"];
  v220 = [v226 between:0.0 and:1.0];
  v215 = [v220 precision:2];
  v343[2] = v215;
  v127 = [MEMORY[0x1E4F94140] rowWithTitle:@"Baby X Scale Compress" valueKeyPath:@"recombineGestureXScaleFactorCompress"];
  v128 = [v127 between:0.0 and:1.0];
  v129 = [v128 precision:2];
  v343[3] = v129;
  v130 = [MEMORY[0x1E4F94140] rowWithTitle:@"Baby Rubberbanding Stretch" valueKeyPath:@"recombineGestureXRubberbandingStretch"];
  v131 = [v130 between:0.0 and:1.0];
  v132 = [v131 precision:2];
  v343[4] = v132;
  v133 = [MEMORY[0x1E4F94140] rowWithTitle:@"Baby Rubberbanding Compress" valueKeyPath:@"recombineGestureXRubberbandingCompress"];
  v134 = [v133 between:0.0 and:1.0];
  v135 = [v134 precision:2];
  v343[5] = v135;
  v136 = [MEMORY[0x1E4F1C978] arrayWithObjects:v343 count:6];
  v273 = [v272 sectionWithRows:v136 title:@"Recombine Gesture"];

  v253 = (void *)MEMORY[0x1E4F94168];
  v266 = [MEMORY[0x1E4F94140] rowWithTitle:@"Up Rebound Delay" valueKeyPath:@"acceptanceUpBounceReboundDelay"];
  v259 = [v266 between:0.0 and:2.0];
  v246 = [v259 precision:2];
  v342[0] = v246;
  id v239 = [MEMORY[0x1E4F94140] rowWithTitle:@"Up Item Appearance Delay Offset" valueKeyPath:@"acceptanceUpBounceItemAppearanceDelayOffset"];
  v233 = [v239 between:0.0 and:2.0];
  v227 = [v233 precision:2];
  v342[1] = v227;
  v221 = [MEMORY[0x1E4F94140] rowWithTitle:@"Up Finishing Delay" valueKeyPath:@"acceptanceUpBounceFinishingDelay"];
  v216 = [v221 between:0.0 and:2.0];
  v211 = [v216 precision:2];
  v342[2] = v211;
  v209 = [MEMORY[0x1E4F94140] rowWithTitle:@"Up Y Stretch" valueKeyPath:@"acceptanceUpBounceYStretch"];
  v207 = [v209 between:0.0 and:500.0];
  v205 = [v207 precision:1];
  v342[3] = v205;
  v203 = [MEMORY[0x1E4F94140] rowWithTitle:@"Up Y Down Stretch" valueKeyPath:@"acceptanceUpBounceYDownStretch"];
  v201 = [v203 between:0.0 and:500.0];
  v200 = [v201 precision:1];
  v342[4] = v200;
  v199 = [MEMORY[0x1E4F94140] rowWithTitle:@"Up X Padding" valueKeyPath:@"acceptanceUpBounceXPadding"];
  v198 = [v199 between:0.0 and:500.0];
  v197 = [v198 precision:1];
  v342[5] = v197;
  v196 = [MEMORY[0x1E4F94140] rowWithTitle:@"Up Overshoot Scale" valueKeyPath:@"acceptanceUpBounceFixedOvershootScaling"];
  v195 = [v196 between:0.0 and:2.0];
  v194 = [v195 precision:3];
  v342[6] = v194;
  v193 = [MEMORY[0x1E4F94138] rowWithTitle:@"Up Stretch Settings" childSettingsKeyPath:@"acceptanceBounceStretch"];
  v342[7] = v193;
  v192 = [MEMORY[0x1E4F94138] rowWithTitle:@"Up Rebound Settings" childSettingsKeyPath:@"acceptanceBounceRebound"];
  v342[8] = v192;
  v191 = [MEMORY[0x1E4F94138] rowWithTitle:@"Up Layout Settings" childSettingsKeyPath:@"acceptanceBounceLayout"];
  v342[9] = v191;
  v190 = [MEMORY[0x1E4F94140] rowWithTitle:@"Up/Side Velocity Threshld" valueKeyPath:@"acceptanceSideBounceXVelocityThreshold"];
  v189 = [v190 between:0.0 and:10000.0];
  v188 = [v189 precision:1];
  v342[10] = v188;
  v187 = [MEMORY[0x1E4F94140] rowWithTitle:@"Side Rebound Delay" valueKeyPath:@"acceptanceSideBounceReboundDelay"];
  v186 = [v187 between:0.0 and:2.0];
  v185 = [v186 precision:2];
  v342[11] = v185;
  v184 = [MEMORY[0x1E4F94140] rowWithTitle:@"Side Item Appearance Delay Offset" valueKeyPath:@"acceptanceSideBounceItemAppearanceDelayOffset"];
  v183 = [v184 between:0.0 and:2.0];
  v182 = [v183 precision:2];
  v342[12] = v182;
  v181 = [MEMORY[0x1E4F94140] rowWithTitle:@"Side Finishing Delay" valueKeyPath:@"acceptanceSideBounceFinishingDelay"];
  v180 = [v181 between:0.0 and:2.0];
  v179 = [v180 precision:2];
  v342[13] = v179;
  v178 = [MEMORY[0x1E4F94140] rowWithTitle:@"Side X Stretch" valueKeyPath:@"acceptanceSideBounceXStretch"];
  v177 = [v178 between:0.0 and:500.0];
  v176 = [v177 precision:1];
  v342[14] = v176;
  v175 = [MEMORY[0x1E4F94140] rowWithTitle:@"Side Y Padding" valueKeyPath:@"acceptanceSideBounceYPadding"];
  v174 = [v175 between:0.0 and:500.0];
  v173 = [v174 precision:1];
  v342[15] = v173;
  v137 = [MEMORY[0x1E4F94140] rowWithTitle:@"Side X Shake Sensor Expansion" valueKeyPath:@"acceptanceSideBounceXSensorExpansion"];
  v138 = [v137 between:-500.0 and:500.0];
  v139 = [v138 precision:1];
  v342[16] = v139;
  v140 = [MEMORY[0x1E4F94140] rowWithTitle:@"Side X Shake Sensor Offset" valueKeyPath:@"acceptanceSideBounceXSensorOffset"];
  v141 = [v140 between:-500.0 and:500.0];
  v142 = [v141 precision:1];
  v342[17] = v142;
  v143 = [MEMORY[0x1E4F94138] rowWithTitle:@"Side Stretch Settings" childSettingsKeyPath:@"acceptanceBounceSideStretch"];
  v342[18] = v143;
  v144 = [MEMORY[0x1E4F94138] rowWithTitle:@"Side Rebound Settings" childSettingsKeyPath:@"acceptanceBounceSideRebound"];
  v342[19] = v144;
  v145 = [MEMORY[0x1E4F94138] rowWithTitle:@"Side Layout Settings" childSettingsKeyPath:@"acceptanceBounceSideLayout"];
  v342[20] = v145;
  v146 = [MEMORY[0x1E4F1C978] arrayWithObjects:v342 count:21];
  v254 = [v253 sectionWithRows:v146 title:@"Acceptance Bounce"];

  v267 = (void *)MEMORY[0x1E4F94168];
  v260 = [MEMORY[0x1E4F94140] rowWithTitle:@"X increase" valueKeyPath:@"ejectionXStretch"];
  v247 = [v260 between:0.0 and:300.0];
  id v240 = [v247 precision:2];
  v341[0] = v240;
  v234 = [MEMORY[0x1E4F94140] rowWithTitle:@"Y increase" valueKeyPath:@"ejectionYStretch"];
  v228 = [v234 between:0.0 and:300.0];
  v222 = [v228 precision:2];
  v341[1] = v222;
  v217 = [MEMORY[0x1E4F94140] rowWithTitle:@"Y Up Offset" valueKeyPath:@"ejectionYUpOffset"];
  v212 = [v217 between:-300.0 and:300.0];
  v147 = [v212 precision:2];
  v341[2] = v147;
  v148 = [MEMORY[0x1E4F94140] rowWithTitle:@"Duration" valueKeyPath:@"ejectionStretchDuration"];
  v149 = [v148 between:0.0 and:1.0];
  v150 = [v149 precision:2];
  v341[3] = v150;
  v151 = [MEMORY[0x1E4F94140] rowWithTitle:@"Max Corner Radius" valueKeyPath:@"ejectionMaxCornerRadius"];
  v152 = [v151 between:0.0 and:200.0];
  v153 = [v152 precision:2];
  v341[4] = v153;
  v154 = [MEMORY[0x1E4F94138] rowWithTitle:@"Stretch Settings" childSettingsKeyPath:@"ejectionStretchSettings"];
  v341[5] = v154;
  v155 = [MEMORY[0x1E4F94138] rowWithTitle:@"Contraction Settings" childSettingsKeyPath:@"ejectionContractionSettings"];
  v341[6] = v155;
  v156 = [MEMORY[0x1E4F1C978] arrayWithObjects:v341 count:7];
  v268 = [v267 sectionWithRows:v156 title:@"Ejection Stretch"];

  v157 = (void *)MEMORY[0x1E4F94168];
  v158 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Min. required" valueKeyPath:@"minimumRequiredSymmetryInCompactLayoutMode"];
  v159 = [v158 minValue:0.25 maxValue:1.0];
  v340[0] = v159;
  v160 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Max symmetric padding" valueKeyPath:@"paddingFromScreenEdgeRequiringSymmetricLayout"];
  v161 = [v160 minValue:0.0 maxValue:100.0];
  v340[1] = v161;
  v162 = [MEMORY[0x1E4F1C978] arrayWithObjects:v340 count:2];
  v261 = [v157 sectionWithRows:v162 title:@"Compact Layout Symmetry"];

  v163 = (void *)MEMORY[0x1E4F94168];
  v164 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Suppress during Control Center Presentation" valueKeyPath:@"suppressWhilePresentingControlCenter"];
  v339 = v164;
  v165 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v339 count:1];
  v248 = [v163 sectionWithRows:v165 title:@"Suppression"];

  v166 = (void *)MEMORY[0x1E4F94168];
  v167 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Element Shadow" valueKeyPath:@"elementShadowEnabled"];
  v338[0] = v167;
  v168 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Background Blur" valueKeyPath:@"backgroundBlurEnabled"];
  v338[1] = v168;
  v169 = [MEMORY[0x1E4F1C978] arrayWithObjects:v338 count:2];
  v170 = [v166 sectionWithRows:v169 title:@"Background Separation"];

  v337[0] = v336;
  v337[1] = v335;
  v337[2] = v333;
  v337[3] = v331;
  v337[4] = v329;
  v337[5] = v326;
  v337[6] = v323;
  v337[7] = v321;
  v337[8] = v319;
  v337[9] = v317;
  v337[10] = v314;
  v337[11] = v310;
  v337[12] = v305;
  v337[13] = v300;
  v337[14] = v286;
  v337[15] = v282;
  v337[16] = v278;
  v337[17] = v273;
  v337[18] = v254;
  v337[19] = v268;
  v337[20] = v261;
  v337[21] = v248;
  v337[22] = v170;
  v171 = [MEMORY[0x1E4F1C978] arrayWithObjects:v337 count:23];
  id v241 = [MEMORY[0x1E4F94168] moduleWithTitle:@"System Aperture" contents:v171];

  return v241;
}

- (double)resizeGestureXRubberbanding
{
  return self->_resizeGestureXRubberbanding;
}

- (void)setResizeGestureXRubberbanding:(double)a3
{
  self->_resizeGestureXRubberbanding = a3;
}

- (double)resizeGestureYRubberbandingStretch
{
  return self->_resizeGestureYRubberbandingStretch;
}

- (void)setResizeGestureYRubberbandingStretch:(double)a3
{
  self->_resizeGestureYRubberbandingStretch = a3;
}

- (double)resizeGestureYRubberbandingCompress
{
  return self->_resizeGestureYRubberbandingCompress;
}

- (void)setResizeGestureYRubberbandingCompress:(double)a3
{
  self->_resizeGestureYRubberbandingCompress = a3;
}

- (double)resizeGestureYRangeBeginTracking
{
  return self->_resizeGestureYRangeBeginTracking;
}

- (void)setResizeGestureYRangeBeginTracking:(double)a3
{
  self->_resizeGestureYRangeBeginTracking = a3;
}

- (double)resizeGestureYRangeEndTracking
{
  return self->_resizeGestureYRangeEndTracking;
}

- (void)setResizeGestureYRangeEndTracking:(double)a3
{
  self->_resizeGestureYRangeEndTracking = a3;
}

- (double)resizeGestureUpOffsetFactor
{
  return self->_resizeGestureUpOffsetFactor;
}

- (void)setResizeGestureUpOffsetFactor:(double)a3
{
  self->_resizeGestureUpOffsetFactor = a3;
}

- (double)resizeGestureMinEdgePadding
{
  return self->_resizeGestureMinEdgePadding;
}

- (void)setResizeGestureMinEdgePadding:(double)a3
{
  self->_resizeGestureMinEdgePadding = a3;
}

- (double)resizeGestureSensorXSafetyMargin
{
  return self->_resizeGestureSensorXSafetyMargin;
}

- (void)setResizeGestureSensorXSafetyMargin:(double)a3
{
  self->_resizeGestureSensorXSafetyMargin = a3;
}

- (double)recombineGestureXRubberbandingStretch
{
  return self->_recombineGestureXRubberbandingStretch;
}

- (void)setRecombineGestureXRubberbandingStretch:(double)a3
{
  self->_recombineGestureXRubberbandingStretch = a3;
}

- (double)recombineGestureXRubberbandingCompress
{
  return self->_recombineGestureXRubberbandingCompress;
}

- (void)setRecombineGestureXRubberbandingCompress:(double)a3
{
  self->_recombineGestureXRubberbandingCompress = a3;
}

- (double)recombineGestureXScaleFactorStretch
{
  return self->_recombineGestureXScaleFactorStretch;
}

- (void)setRecombineGestureXScaleFactorStretch:(double)a3
{
  self->_recombineGestureXScaleFactorStretch = a3;
}

- (double)recombineGestureXScaleFactorCompress
{
  return self->_recombineGestureXScaleFactorCompress;
}

- (void)setRecombineGestureXScaleFactorCompress:(double)a3
{
  self->_recombineGestureXScaleFactorCompress = a3;
}

- (double)recombineGestureTranslateFactorStretch
{
  return self->_recombineGestureTranslateFactorStretch;
}

- (void)setRecombineGestureTranslateFactorStretch:(double)a3
{
  self->_recombineGestureTranslateFactorStretch = a3;
}

- (double)recombineGestureTranslateFactorCompress
{
  return self->_recombineGestureTranslateFactorCompress;
}

- (void)setRecombineGestureTranslateFactorCompress:(double)a3
{
  self->_recombineGestureTranslateFactorCompress = a3;
}

- (double)acceptanceUpBounceReboundDelay
{
  return self->_acceptanceUpBounceReboundDelay;
}

- (void)setAcceptanceUpBounceReboundDelay:(double)a3
{
  self->_acceptanceUpBounceReboundDelay = a3;
}

- (double)acceptanceUpBounceItemAppearanceDelayOffset
{
  return self->_acceptanceUpBounceItemAppearanceDelayOffset;
}

- (void)setAcceptanceUpBounceItemAppearanceDelayOffset:(double)a3
{
  self->_acceptanceUpBounceItemAppearanceDelayOffset = a3;
}

- (double)acceptanceUpBounceXPadding
{
  return self->_acceptanceUpBounceXPadding;
}

- (void)setAcceptanceUpBounceXPadding:(double)a3
{
  self->_acceptanceUpBounceXPadding = a3;
}

- (double)acceptanceUpBounceYStretch
{
  return self->_acceptanceUpBounceYStretch;
}

- (void)setAcceptanceUpBounceYStretch:(double)a3
{
  self->_acceptanceUpBounceYStretch = a3;
}

- (double)acceptanceUpBounceYDownStretch
{
  return self->_acceptanceUpBounceYDownStretch;
}

- (void)setAcceptanceUpBounceYDownStretch:(double)a3
{
  self->_acceptanceUpBounceYDownStretch = a3;
}

- (double)acceptanceUpBounceFixedOvershootScaling
{
  return self->_acceptanceUpBounceFixedOvershootScaling;
}

- (void)setAcceptanceUpBounceFixedOvershootScaling:(double)a3
{
  self->_acceptanceUpBounceFixedOvershootScaling = a3;
}

- (double)acceptanceUpBounceFinishingDelay
{
  return self->_acceptanceUpBounceFinishingDelay;
}

- (void)setAcceptanceUpBounceFinishingDelay:(double)a3
{
  self->_acceptanceUpBounceFinishingDelay = a3;
}

- (SBFFluidBehaviorSettings)acceptanceBounceStretch
{
  return self->_acceptanceBounceStretch;
}

- (void)setAcceptanceBounceStretch:(id)a3
{
}

- (SBFFluidBehaviorSettings)acceptanceBounceRebound
{
  return self->_acceptanceBounceRebound;
}

- (void)setAcceptanceBounceRebound:(id)a3
{
}

- (SBFFluidBehaviorSettings)acceptanceBounceLayout
{
  return self->_acceptanceBounceLayout;
}

- (void)setAcceptanceBounceLayout:(id)a3
{
}

- (SBFFluidBehaviorSettings)acceptanceBounceLayoutY
{
  return self->_acceptanceBounceLayoutY;
}

- (void)setAcceptanceBounceLayoutY:(id)a3
{
}

- (double)acceptanceSideBounceReboundDelay
{
  return self->_acceptanceSideBounceReboundDelay;
}

- (void)setAcceptanceSideBounceReboundDelay:(double)a3
{
  self->_acceptanceSideBounceReboundDelay = a3;
}

- (double)acceptanceSideBounceItemAppearanceDelayOffset
{
  return self->_acceptanceSideBounceItemAppearanceDelayOffset;
}

- (void)setAcceptanceSideBounceItemAppearanceDelayOffset:(double)a3
{
  self->_acceptanceSideBounceItemAppearanceDelayOffset = a3;
}

- (double)acceptanceSideBounceXStretch
{
  return self->_acceptanceSideBounceXStretch;
}

- (void)setAcceptanceSideBounceXStretch:(double)a3
{
  self->_acceptanceSideBounceXStretch = a3;
}

- (double)acceptanceSideBounceYPadding
{
  return self->_acceptanceSideBounceYPadding;
}

- (void)setAcceptanceSideBounceYPadding:(double)a3
{
  self->_acceptanceSideBounceYPadding = a3;
}

- (double)acceptanceSideBounceXVelocityThreshold
{
  return self->_acceptanceSideBounceXVelocityThreshold;
}

- (void)setAcceptanceSideBounceXVelocityThreshold:(double)a3
{
  self->_acceptanceSideBounceXVelocityThreshold = a3;
}

- (double)acceptanceSideBounceXSensorExpansion
{
  return self->_acceptanceSideBounceXSensorExpansion;
}

- (void)setAcceptanceSideBounceXSensorExpansion:(double)a3
{
  self->_acceptanceSideBounceXSensorExpansion = a3;
}

- (double)acceptanceSideBounceXSensorOffset
{
  return self->_acceptanceSideBounceXSensorOffset;
}

- (void)setAcceptanceSideBounceXSensorOffset:(double)a3
{
  self->_acceptanceSideBounceXSensorOffset = a3;
}

- (double)acceptanceSideBounceFinishingDelay
{
  return self->_acceptanceSideBounceFinishingDelay;
}

- (void)setAcceptanceSideBounceFinishingDelay:(double)a3
{
  self->_acceptanceSideBounceFinishingDelay = a3;
}

- (SBFFluidBehaviorSettings)acceptanceBounceSideStretch
{
  return self->_acceptanceBounceSideStretch;
}

- (void)setAcceptanceBounceSideStretch:(id)a3
{
}

- (SBFFluidBehaviorSettings)acceptanceBounceSideRebound
{
  return self->_acceptanceBounceSideRebound;
}

- (void)setAcceptanceBounceSideRebound:(id)a3
{
}

- (SBFFluidBehaviorSettings)acceptanceBounceSideLayout
{
  return self->_acceptanceBounceSideLayout;
}

- (void)setAcceptanceBounceSideLayout:(id)a3
{
}

- (SBFFluidBehaviorSettings)acceptanceBounceSideLayoutY
{
  return self->_acceptanceBounceSideLayoutY;
}

- (void)setAcceptanceBounceSideLayoutY:(id)a3
{
}

- (double)ejectionXStretch
{
  return self->_ejectionXStretch;
}

- (void)setEjectionXStretch:(double)a3
{
  self->_ejectionXStretch = a3;
}

- (double)ejectionYStretch
{
  return self->_ejectionYStretch;
}

- (void)setEjectionYStretch:(double)a3
{
  self->_ejectionYStretch = a3;
}

- (double)ejectionYUpOffset
{
  return self->_ejectionYUpOffset;
}

- (void)setEjectionYUpOffset:(double)a3
{
  self->_ejectionYUpOffset = a3;
}

- (double)ejectionStretchDuration
{
  return self->_ejectionStretchDuration;
}

- (void)setEjectionStretchDuration:(double)a3
{
  self->_ejectionStretchDuration = a3;
}

- (double)ejectionMaxCornerRadius
{
  return self->_ejectionMaxCornerRadius;
}

- (void)setEjectionMaxCornerRadius:(double)a3
{
  self->_ejectionMaxCornerRadius = a3;
}

- (SBFFluidBehaviorSettings)ejectionStretchSettings
{
  return self->_ejectionStretchSettings;
}

- (void)setEjectionStretchSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)ejectionContractionSettings
{
  return self->_ejectionContractionSettings;
}

- (void)setEjectionContractionSettings:(id)a3
{
}

- (BOOL)highlightTransitions
{
  return self->_highlightTransitions;
}

- (void)setHighlightTransitions:(BOOL)a3
{
  self->_highlightTransitions = a3;
}

- (double)boundsCollisionProgress
{
  return self->_boundsCollisionProgress;
}

- (void)setBoundsCollisionProgress:(double)a3
{
  self->_boundsCollisionProgress = a3;
}

- (double)boundsCollapsingPhaseChangeProgress
{
  return self->_boundsCollapsingPhaseChangeProgress;
}

- (void)setBoundsCollapsingPhaseChangeProgress:(double)a3
{
  self->_boundsCollapsingPhaseChangeProgress = a3;
}

- (double)boundsCompensatingPhaseChangeProgress
{
  return self->_boundsCompensatingPhaseChangeProgress;
}

- (void)setBoundsCompensatingPhaseChangeProgress:(double)a3
{
  self->_boundsCompensatingPhaseChangeProgress = a3;
}

- (void)setSensorObscuringShadowApexProgress:(double)a3
{
  self->_sensorObscuringShadowApexProgress = a3;
}

- (void)setDefaultInterfaceElementTransitionSettings:(id)a3
{
}

- (void)setInertInterfaceElementTransitionSettings:(id)a3
{
}

- (void)setInertCollapsingInterfaceElementTransitionSettings:(id)a3
{
}

- (SBSAInterfaceElementInertCompensatingTransitionSettings)inertCompensatingInterfaceElementTransitionSettings
{
  return self->_inertCompensatingInterfaceElementTransitionSettings;
}

- (void)setInertCompensatingInterfaceElementTransitionSettings:(id)a3
{
}

- (SBSAInterfaceElementTransitionSettings)compactInterfaceElementTransitionSettings
{
  return self->_compactInterfaceElementTransitionSettings;
}

- (void)setCompactInterfaceElementTransitionSettings:(id)a3
{
}

- (SBSAInterfaceElementTransitionSettings)minimalInterfaceElementTransitionSettings
{
  return self->_minimalInterfaceElementTransitionSettings;
}

- (void)setMinimalInterfaceElementTransitionSettings:(id)a3
{
}

- (SBSAInterfaceElementTransitionSettings)customInterfaceElementTransitionSettings
{
  return self->_customInterfaceElementTransitionSettings;
}

- (void)setCustomInterfaceElementTransitionSettings:(id)a3
{
}

- (SBSAInterfaceElementTransitionSettings)popToCustomInterfaceElementTransitionSettings
{
  return self->_popToCustomInterfaceElementTransitionSettings;
}

- (void)setPopToCustomInterfaceElementTransitionSettings:(id)a3
{
}

- (SBSAElementContentTransitionSettings)elementContentTransitionSettings
{
  return self->_elementContentTransitionSettings;
}

- (void)setElementContentTransitionSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)contentInteractionBeginBehaviorSettings
{
  return self->_contentInteractionBeginBehaviorSettings;
}

- (void)setContentInteractionBeginBehaviorSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)jindoBoundsOval
{
  return self->_jindoBoundsOval;
}

- (void)setJindoBoundsOval:(id)a3
{
}

- (BOOL)isSensorShadowVisible
{
  return self->_sensorShadowVisible;
}

- (void)setSensorShadowVisible:(BOOL)a3
{
  self->_sensorShadowVisible = a3;
}

- (double)sensorShadowOpacityFactor
{
  return self->_sensorShadowOpacityFactor;
}

- (void)setSensorShadowOpacityFactor:(double)a3
{
  self->_sensorShadowOpacityFactor = a3;
}

- (BOOL)isContainerHitRectVisible
{
  return self->_containerHitRectVisible;
}

- (void)setContainerHitRectVisible:(BOOL)a3
{
  self->_containerHitRectVisible = a3;
}

- (double)containerHitRectTopMarginDefault
{
  return self->_containerHitRectTopMarginDefault;
}

- (void)setContainerHitRectTopMarginDefault:(double)a3
{
  self->_containerHitRectTopMarginDefault = a3;
}

- (double)containerHitRectTopMarginWide
{
  return self->_containerHitRectTopMarginWide;
}

- (void)setContainerHitRectTopMarginWide:(double)a3
{
  self->_containerHitRectTopMarginWide = a3;
}

- (double)containerHitRectHorizontalMargin
{
  return self->_containerHitRectHorizontalMargin;
}

- (void)setContainerHitRectHorizontalMargin:(double)a3
{
  self->_containerHitRectHorizontalMargin = a3;
}

- (double)containerHitRectHorizontalMarginLimit
{
  return self->_containerHitRectHorizontalMarginLimit;
}

- (void)setContainerHitRectHorizontalMarginLimit:(double)a3
{
  self->_containerHitRectHorizontalMarginLimit = a3;
}

- (double)containerHitRectHorizontalLimit
{
  return self->_containerHitRectHorizontalLimit;
}

- (void)setContainerHitRectHorizontalLimit:(double)a3
{
  self->_containerHitRectHorizontalLimit = a3;
}

- (SBFFluidBehaviorSettings)mitosisSecondaryBoundsSettings
{
  return self->_mitosisSecondaryBoundsSettings;
}

- (void)setMitosisSecondaryBoundsSettings:(id)a3
{
}

- (double)mitosisHeadstartDelay
{
  return self->_mitosisHeadstartDelay;
}

- (void)setMitosisHeadstartDelay:(double)a3
{
  self->_mitosisHeadstartDelay = a3;
}

- (SBFFluidBehaviorSettings)recombinationSecondaryBoundsYSettings
{
  return self->_recombinationSecondaryBoundsYSettings;
}

- (void)setRecombinationSecondaryBoundsYSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)jindoAuthErrorShakeInitialKick
{
  return self->_jindoAuthErrorShakeInitialKick;
}

- (void)setJindoAuthErrorShakeInitialKick:(id)a3
{
}

- (SBFFluidBehaviorSettings)jindoAuthErrorShakeSettle
{
  return self->_jindoAuthErrorShakeSettle;
}

- (void)setJindoAuthErrorShakeSettle:(id)a3
{
}

- (SBFFluidBehaviorSettings)jindoAuthErrorStretchOut
{
  return self->_jindoAuthErrorStretchOut;
}

- (void)setJindoAuthErrorStretchOut:(id)a3
{
}

- (SBFFluidBehaviorSettings)jindoAuthErrorStretchSettle
{
  return self->_jindoAuthErrorStretchSettle;
}

- (void)setJindoAuthErrorStretchSettle:(id)a3
{
}

- (double)shakeDisplacement
{
  return self->_shakeDisplacement;
}

- (void)setShakeDisplacement:(double)a3
{
  self->_shakeDisplacement = a3;
}

- (double)shakeSensorExpansion
{
  return self->_shakeSensorExpansion;
}

- (void)setShakeSensorExpansion:(double)a3
{
  self->_shakeSensorExpansion = a3;
}

- (double)shakeSensorOffset
{
  return self->_shakeSensorOffset;
}

- (void)setShakeSensorOffset:(double)a3
{
  self->_shakeSensorOffset = a3;
}

- (double)firstShakeMilestone
{
  return self->_firstShakeMilestone;
}

- (void)setFirstShakeMilestone:(double)a3
{
  self->_firstShakeMilestone = a3;
}

- (double)secondShakeMilestone
{
  return self->_secondShakeMilestone;
}

- (void)setSecondShakeMilestone:(double)a3
{
  self->_secondShakeMilestone = a3;
}

- (BOOL)shakeRingerBell
{
  return self->_shakeRingerBell;
}

- (void)setShakeRingerBell:(BOOL)a3
{
  self->_shakeRingerBell = a3;
}

- (SBFFluidBehaviorSettings)bumpAnimationScaleUpSettings
{
  return self->_bumpAnimationScaleUpSettings;
}

- (void)setBumpAnimationScaleUpSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)bumpAnimationScaleDownSettings
{
  return self->_bumpAnimationScaleDownSettings;
}

- (void)setBumpAnimationScaleDownSettings:(id)a3
{
}

- (double)bumpAnimationXScale
{
  return self->_bumpAnimationXScale;
}

- (void)setBumpAnimationXScale:(double)a3
{
  self->_bumpAnimationXScale = a3;
}

- (double)bumpAnimationYScale
{
  return self->_bumpAnimationYScale;
}

- (void)setBumpAnimationYScale:(double)a3
{
  self->_bumpAnimationYScale = a3;
}

- (SBFFluidBehaviorSettings)inflateAnimationScaleUpSettings
{
  return self->_inflateAnimationScaleUpSettings;
}

- (void)setInflateAnimationScaleUpSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)inflateAnimationScaleDownSettings
{
  return self->_inflateAnimationScaleDownSettings;
}

- (void)setInflateAnimationScaleDownSettings:(id)a3
{
}

- (double)inflateAnimationScale
{
  return self->_inflateAnimationScale;
}

- (void)setInflateAnimationScale:(double)a3
{
  self->_inflateAnimationScale = a3;
}

- (double)inflateAnimationContentScale
{
  return self->_inflateAnimationContentScale;
}

- (void)setInflateAnimationContentScale:(double)a3
{
  self->_inflateAnimationContentScale = a3;
}

- (double)inflateVerticalOffsetProportion
{
  return self->_inflateVerticalOffsetProportion;
}

- (void)setInflateVerticalOffsetProportion:(double)a3
{
  self->_inflateVerticalOffsetProportion = a3;
}

- (double)expansionToCompactBeginInflationProgress
{
  return self->_expansionToCompactBeginInflationProgress;
}

- (void)setExpansionToCompactBeginInflationProgress:(double)a3
{
  self->_expansionToCompactBeginInflationProgress = a3;
}

- (SBFFluidBehaviorSettings)transitionToProminentPillSettings
{
  return self->_transitionToProminentPillSettings;
}

- (void)setTransitionToProminentPillSettings:(id)a3
{
}

- (double)prominentPillScale
{
  return self->_prominentPillScale;
}

- (void)setProminentPillScale:(double)a3
{
  self->_prominentPillScale = a3;
}

- (double)prominentPillContentScale
{
  return self->_prominentPillContentScale;
}

- (void)setProminentPillContentScale:(double)a3
{
  self->_prominentPillContentScale = a3;
}

- (double)prominentPillVerticalOffsetProportion
{
  return self->_prominentPillVerticalOffsetProportion;
}

- (void)setProminentPillVerticalOffsetProportion:(double)a3
{
  self->_prominentPillVerticalOffsetProportion = a3;
}

- (void)setTallRectCornerRadius:(double)a3
{
  self->_tallRectCornerRadius = a3;
}

- (double)tallRectWidth
{
  return self->_tallRectWidth;
}

- (void)setTallRectWidth:(double)a3
{
  self->_tallRectWidth = a3;
}

- (SBSystemAperturePulseSettings)pulseNoActionSettings
{
  return self->_pulseNoActionSettings;
}

- (void)setPulseNoActionSettings:(id)a3
{
}

- (void)setPulseIndicatorEnabled:(BOOL)a3
{
  self->_pulseIndicatorEnabled = a3;
}

- (SBSystemAperturePulseSettings)pulseIndicatorSettings
{
  return self->_pulseIndicatorSettings;
}

- (void)setPulseIndicatorSettings:(id)a3
{
}

- (BOOL)keyLineEnabled
{
  return self->_keyLineEnabled;
}

- (void)setKeyLineEnabled:(BOOL)a3
{
  self->_keyLineEnabled = a3;
}

- (void)setKeyLineStyleTransition:(id)a3
{
}

- (SBFFluidBehaviorSettings)keyLineDisappearToInertTransition
{
  return self->_keyLineDisappearToInertTransition;
}

- (void)setKeyLineDisappearToInertTransition:(id)a3
{
}

- (SBFFluidBehaviorSettings)keyLineAppearForSwoopTransition
{
  return self->_keyLineAppearForSwoopTransition;
}

- (void)setKeyLineAppearForSwoopTransition:(id)a3
{
}

- (BOOL)activityKeyLineColorEnabled
{
  return self->_activityKeyLineColorEnabled;
}

- (void)setActivityKeyLineColorEnabled:(BOOL)a3
{
  self->_activityKeyLineColorEnabled = a3;
}

- (double)keyLineAlpha
{
  return self->_keyLineAlpha;
}

- (void)setKeyLineAlpha:(double)a3
{
  self->_keyLineAlpha = a3;
}

- (double)keyLineThickness
{
  return self->_keyLineThickness;
}

- (void)setKeyLineThickness:(double)a3
{
  self->_keyLineThickness = a3;
}

- (double)adaptiveKeyLineThickness
{
  return self->_adaptiveKeyLineThickness;
}

- (void)setAdaptiveKeyLineThickness:(double)a3
{
  self->_adaptiveKeyLineThickness = a3;
}

- (SBFCAColorMatrixSettings)adaptiveKeyLineColorMatrix
{
  return self->_adaptiveKeyLineColorMatrix;
}

- (void)setAdaptiveKeyLineColorMatrix:(id)a3
{
}

- (double)keyLineDarkToMixedMinLuma
{
  return self->_keyLineDarkToMixedMinLuma;
}

- (void)setKeyLineDarkToMixedMinLuma:(double)a3
{
  self->_keyLineDarkToMixedMinLuma = a3;
}

- (double)keyLineMixedToDarkMaxLuma
{
  return self->_keyLineMixedToDarkMaxLuma;
}

- (void)setKeyLineMixedToDarkMaxLuma:(double)a3
{
  self->_keyLineMixedToDarkMaxLuma = a3;
}

- (double)keyLineColorFixedLstar
{
  return self->_keyLineColorFixedLstar;
}

- (void)setKeyLineColorFixedLstar:(double)a3
{
  self->_keyLineColorFixedLstar = a3;
}

- (void)setSuppressHidingOnClonedDisplayWhileEmpty:(BOOL)a3
{
  self->_suppressHidingOnClonedDisplayWhileEmpty = a3;
}

- (void)setSuppressHidingInSnapshotsWhileEmpty:(BOOL)a3
{
  self->_suppressHidingInSnapshotsWhileEmpty = a3;
}

- (double)alphaTransitionDurationOnClonedDisplay
{
  return self->_alphaTransitionDurationOnClonedDisplay;
}

- (void)setAlphaTransitionDurationOnClonedDisplay:(double)a3
{
  self->_alphaTransitionDurationOnClonedDisplay = a3;
}

- (void)setHideRemotePrototypingFallbackPill:(BOOL)a3
{
  self->_hideRemotePrototypingFallbackPill = a3;
}

- (double)minimumRequiredSymmetryInCompactLayoutMode
{
  return self->_minimumRequiredSymmetryInCompactLayoutMode;
}

- (void)setMinimumRequiredSymmetryInCompactLayoutMode:(double)a3
{
  self->_minimumRequiredSymmetryInCompactLayoutMode = a3;
}

- (double)paddingFromScreenEdgeRequiringSymmetricLayout
{
  return self->_paddingFromScreenEdgeRequiringSymmetricLayout;
}

- (void)setPaddingFromScreenEdgeRequiringSymmetricLayout:(double)a3
{
  self->_paddingFromScreenEdgeRequiringSymmetricLayout = a3;
}

- (BOOL)suppressWhilePresentingControlCenter
{
  return self->_suppressWhilePresentingControlCenter;
}

- (void)setSuppressWhilePresentingControlCenter:(BOOL)a3
{
  self->_suppressWhilePresentingControlCenter = a3;
}

- (void)setElementShadowEnabled:(BOOL)a3
{
  self->_elementShadowEnabled = a3;
}

- (void)setBackgroundBlurEnabled:(BOOL)a3
{
  self->_backgroundBlurEnabled = a3;
}

- (BOOL)showQueryIterationLabel
{
  return self->_showQueryIterationLabel;
}

- (void)setShowQueryIterationLabel:(BOOL)a3
{
  self->_showQueryIterationLabel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adaptiveKeyLineColorMatrix, 0);
  objc_storeStrong((id *)&self->_keyLineAppearForSwoopTransition, 0);
  objc_storeStrong((id *)&self->_keyLineDisappearToInertTransition, 0);
  objc_storeStrong((id *)&self->_keyLineStyleTransition, 0);
  objc_storeStrong((id *)&self->_pulseIndicatorSettings, 0);
  objc_storeStrong((id *)&self->_pulseNoActionSettings, 0);
  objc_storeStrong((id *)&self->_transitionToProminentPillSettings, 0);
  objc_storeStrong((id *)&self->_inflateAnimationScaleDownSettings, 0);
  objc_storeStrong((id *)&self->_inflateAnimationScaleUpSettings, 0);
  objc_storeStrong((id *)&self->_bumpAnimationScaleDownSettings, 0);
  objc_storeStrong((id *)&self->_bumpAnimationScaleUpSettings, 0);
  objc_storeStrong((id *)&self->_jindoAuthErrorStretchSettle, 0);
  objc_storeStrong((id *)&self->_jindoAuthErrorStretchOut, 0);
  objc_storeStrong((id *)&self->_jindoAuthErrorShakeSettle, 0);
  objc_storeStrong((id *)&self->_jindoAuthErrorShakeInitialKick, 0);
  objc_storeStrong((id *)&self->_recombinationSecondaryBoundsYSettings, 0);
  objc_storeStrong((id *)&self->_mitosisSecondaryBoundsSettings, 0);
  objc_storeStrong((id *)&self->_jindoBoundsOval, 0);
  objc_storeStrong((id *)&self->_contentInteractionBeginBehaviorSettings, 0);
  objc_storeStrong((id *)&self->_elementContentTransitionSettings, 0);
  objc_storeStrong((id *)&self->_popToCustomInterfaceElementTransitionSettings, 0);
  objc_storeStrong((id *)&self->_customInterfaceElementTransitionSettings, 0);
  objc_storeStrong((id *)&self->_minimalInterfaceElementTransitionSettings, 0);
  objc_storeStrong((id *)&self->_compactInterfaceElementTransitionSettings, 0);
  objc_storeStrong((id *)&self->_inertCompensatingInterfaceElementTransitionSettings, 0);
  objc_storeStrong((id *)&self->_inertCollapsingInterfaceElementTransitionSettings, 0);
  objc_storeStrong((id *)&self->_inertInterfaceElementTransitionSettings, 0);
  objc_storeStrong((id *)&self->_defaultInterfaceElementTransitionSettings, 0);
  objc_storeStrong((id *)&self->_ejectionContractionSettings, 0);
  objc_storeStrong((id *)&self->_ejectionStretchSettings, 0);
  objc_storeStrong((id *)&self->_acceptanceBounceSideLayoutY, 0);
  objc_storeStrong((id *)&self->_acceptanceBounceSideLayout, 0);
  objc_storeStrong((id *)&self->_acceptanceBounceSideRebound, 0);
  objc_storeStrong((id *)&self->_acceptanceBounceSideStretch, 0);
  objc_storeStrong((id *)&self->_acceptanceBounceLayoutY, 0);
  objc_storeStrong((id *)&self->_acceptanceBounceLayout, 0);
  objc_storeStrong((id *)&self->_acceptanceBounceRebound, 0);
  objc_storeStrong((id *)&self->_acceptanceBounceStretch, 0);
}

@end