@interface SBHomeGestureSettings
+ (id)settingsControllerModule;
- (BOOL)injectGestureVelocityForZoomDown;
- (BOOL)isHomeGestureEnabled;
- (BOOL)onlyInjectVelocityForShortFlicks;
- (BOOL)preventMultipleEdgesAfterAppInteraction;
- (BOOL)recognizeAlongEdge;
- (BOOL)resetSwitcherListAfterAppInteraction;
- (BOOL)snapToMaxVelocityThresholdAfterAccelerationDip;
- (BOOL)useZStackResolverResults;
- (SBHomeGestureExclusionTrapezoidSettings)exclusionTrapezoidSettings;
- (double)adaptiveThresholdsDecreasingRateFraction;
- (double)appSwitcherVelocityThresholdIncreasingRateFraction;
- (double)cardFlyInDelayAfterEnteringAppSwitcher;
- (double)cardFlyInMaximumVelocityThreshold;
- (double)dockVelocityThresholdIncreasingRateFraction;
- (double)edgeAngleWindow;
- (double)edgeDistanceToCorrectGestureFinalDestination;
- (double)homeGestureCenterZoomDownCenterYOffsetFactor;
- (double)homeGestureMinimumCardScale;
- (double)homeGestureMinimumCardScaleRubberBandingRange;
- (double)homeGestureXOffsetFactor;
- (double)horizontalRubberbandDistance;
- (double)horizontalRubberbandEnd;
- (double)horizontalRubberbandExponent;
- (double)horizontalRubberbandStart;
- (double)hysteresis;
- (double)maximumAdaptivePauseVelocityThresholdForAppSwitcher;
- (double)maximumAdaptiveVelocityThresholdForDock;
- (double)maximumDistanceYThresholdToPresentDock;
- (double)maximumScaleVelocity;
- (double)maximumYDistanceToTriggerArcByDistance;
- (double)maximumYDistanceToTriggerArcByFlick;
- (double)minimumDistanceThresholdToScaleMultiplier;
- (double)minimumXDistanceForFirstArcSwipe;
- (double)minimumXDistanceToTriggerArcByDistanceLandscape;
- (double)minimumXDistanceToTriggerArcByDistancePortrait;
- (double)minimumYDistanceForHomeOrAppSwitcher;
- (double)minimumYDistanceToConsiderAccelerationDip;
- (double)minimumYVelocityForArcSwipe;
- (double)minimumYVelocityForHome;
- (double)normalizedDistanceYThresholdForUnconditionalHome;
- (double)normalizedDistanceYThresholdForUnconditionalHomeInSlideOver;
- (double)normalizedDistanceYThresholdRangeForUnconditionalHome;
- (double)normalizedDistanceYThresholdRangeForUnconditionalHomeInSlideOver;
- (double)pauseVelocityThresholdForAppSwitcher;
- (double)pauseVelocityThresholdForDefiniteAppSwitcher;
- (double)positionVelocityXPercentOfGestureVelocityX;
- (double)positionVelocityYPercentOfGestureVelocityY;
- (double)scaleVelocityPercentOfGestureVelocityYDividedByViewHeight;
- (double)secondsToAllowMultipleEdges;
- (double)secondsToResetSwitcherListAfterTransition;
- (double)travelDistanceForTranslatingScreenHeight;
- (double)velocitySlopeThresholdForBottomSwipeUpArc;
- (double)velocitySlopeThresholdForCurrentLayout;
- (double)velocitySlopeThresholdForScrunchArc;
- (double)velocityXThresholdForUnconditionalArcSwipe;
- (double)velocityYThresholdForUnconditionalHome;
- (double)verticalRubberbandDistance;
- (double)verticalRubberbandEnd;
- (double)verticalRubberbandExponent;
- (double)verticalRubberbandStart;
- (void)setAdaptiveThresholdsDecreasingRateFraction:(double)a3;
- (void)setAppSwitcherVelocityThresholdIncreasingRateFraction:(double)a3;
- (void)setCardFlyInDelayAfterEnteringAppSwitcher:(double)a3;
- (void)setCardFlyInMaximumVelocityThreshold:(double)a3;
- (void)setDefaultValues;
- (void)setDockVelocityThresholdIncreasingRateFraction:(double)a3;
- (void)setEdgeAngleWindow:(double)a3;
- (void)setEdgeDistanceToCorrectGestureFinalDestination:(double)a3;
- (void)setExclusionTrapezoidSettings:(id)a3;
- (void)setHomeGestureCenterZoomDownCenterYOffsetFactor:(double)a3;
- (void)setHomeGestureEnabled:(BOOL)a3;
- (void)setHomeGestureMinimumCardScale:(double)a3;
- (void)setHomeGestureMinimumCardScaleRubberBandingRange:(double)a3;
- (void)setHomeGestureTuningDefaults;
- (void)setHomeGestureXOffsetFactor:(double)a3;
- (void)setHorizontalRubberbandDistance:(double)a3;
- (void)setHorizontalRubberbandEnd:(double)a3;
- (void)setHorizontalRubberbandExponent:(double)a3;
- (void)setHorizontalRubberbandStart:(double)a3;
- (void)setHysteresis:(double)a3;
- (void)setInjectGestureVelocityForZoomDown:(BOOL)a3;
- (void)setLatchDefaults;
- (void)setMaximumAdaptivePauseVelocityThresholdForAppSwitcher:(double)a3;
- (void)setMaximumAdaptiveVelocityThresholdForDock:(double)a3;
- (void)setMaximumDistanceYThresholdToPresentDock:(double)a3;
- (void)setMaximumScaleVelocity:(double)a3;
- (void)setMaximumYDistanceToTriggerArcByDistance:(double)a3;
- (void)setMaximumYDistanceToTriggerArcByFlick:(double)a3;
- (void)setMinimumDistanceThresholdToScaleMultiplier:(double)a3;
- (void)setMinimumXDistanceForFirstArcSwipe:(double)a3;
- (void)setMinimumXDistanceToTriggerArcByDistanceLandscape:(double)a3;
- (void)setMinimumXDistanceToTriggerArcByDistancePortrait:(double)a3;
- (void)setMinimumYDistanceForHomeOrAppSwitcher:(double)a3;
- (void)setMinimumYDistanceToConsiderAccelerationDip:(double)a3;
- (void)setMinimumYVelocityForArcSwipe:(double)a3;
- (void)setMinimumYVelocityForHome:(double)a3;
- (void)setNormalizedDistanceYThresholdForUnconditionalHome:(double)a3;
- (void)setNormalizedDistanceYThresholdForUnconditionalHomeInSlideOver:(double)a3;
- (void)setNormalizedDistanceYThresholdRangeForUnconditionalHome:(double)a3;
- (void)setNormalizedDistanceYThresholdRangeForUnconditionalHomeInSlideOver:(double)a3;
- (void)setOnlyInjectVelocityForShortFlicks:(BOOL)a3;
- (void)setPauseVelocityThresholdForAppSwitcher:(double)a3;
- (void)setPauseVelocityThresholdForDefiniteAppSwitcher:(double)a3;
- (void)setPositionVelocityXPercentOfGestureVelocityX:(double)a3;
- (void)setPositionVelocityYPercentOfGestureVelocityY:(double)a3;
- (void)setPreventMultipleEdgesAfterAppInteraction:(BOOL)a3;
- (void)setRecognizeAlongEdge:(BOOL)a3;
- (void)setResetSwitcherListAfterAppInteraction:(BOOL)a3;
- (void)setScaleVelocityPercentOfGestureVelocityYDividedByViewHeight:(double)a3;
- (void)setSecondsToAllowMultipleEdges:(double)a3;
- (void)setSecondsToResetSwitcherListAfterTransition:(double)a3;
- (void)setSnapToMaxVelocityThresholdAfterAccelerationDip:(BOOL)a3;
- (void)setTravelDistanceForTranslatingScreenHeight:(double)a3;
- (void)setUseZStackResolverResults:(BOOL)a3;
- (void)setVelocitySlopeThresholdForBottomSwipeUpArc:(double)a3;
- (void)setVelocitySlopeThresholdForCurrentLayout:(double)a3;
- (void)setVelocitySlopeThresholdForScrunchArc:(double)a3;
- (void)setVelocityXThresholdForUnconditionalArcSwipe:(double)a3;
- (void)setVelocityYThresholdForUnconditionalHome:(double)a3;
- (void)setVerticalRubberbandDistance:(double)a3;
- (void)setVerticalRubberbandEnd:(double)a3;
- (void)setVerticalRubberbandExponent:(double)a3;
- (void)setVerticalRubberbandStart:(double)a3;
@end

@implementation SBHomeGestureSettings

- (BOOL)isHomeGestureEnabled
{
  return self->_homeGestureEnabled;
}

- (SBHomeGestureExclusionTrapezoidSettings)exclusionTrapezoidSettings
{
  return self->_exclusionTrapezoidSettings;
}

- (double)secondsToAllowMultipleEdges
{
  return self->_secondsToAllowMultipleEdges;
}

- (double)secondsToResetSwitcherListAfterTransition
{
  return self->_secondsToResetSwitcherListAfterTransition;
}

- (void)setDefaultValues
{
  v10.receiver = self;
  v10.super_class = (Class)SBHomeGestureSettings;
  [(PTSettings *)&v10 setDefaultValues];
  uint64_t v3 = SBFEffectiveHomeButtonType();
  [(SBHomeGestureSettings *)self setHomeGestureEnabled:SBIsHomeGestureEnabledByDefault()];
  BOOL v4 = v3 == 2;
  BOOL v5 = v3 == 2;
  double v6 = 10.0;
  if (v4) {
    double v6 = 5.0;
  }
  [(SBHomeGestureSettings *)self setHysteresis:v6];
  [(SBHomeGestureSettings *)self setRecognizeAlongEdge:v5];
  [(SBHomeGestureSettings *)self setUseZStackResolverResults:1];
  [(SBHomeGestureSettings *)self setHomeGestureTuningDefaults];
  [(SBHomeGestureSettings *)self setLatchDefaults];
  [(SBHomeGestureSettings *)self setSecondsToAllowMultipleEdges:1.5];
  [(SBHomeGestureSettings *)self setPreventMultipleEdgesAfterAppInteraction:1];
  [(SBHomeGestureSettings *)self setSecondsToResetSwitcherListAfterTransition:5.0];
  [(SBHomeGestureSettings *)self setResetSwitcherListAfterAppInteraction:1];
  [(SBHomeGestureSettings *)self setTravelDistanceForTranslatingScreenHeight:180.0];
  [(SBHomeGestureSettings *)self setMinimumDistanceThresholdToScaleMultiplier:32.0];
  v7 = [(SBHomeGestureSettings *)self exclusionTrapezoidSettings];
  [v7 setDefaultValues];

  [(SBHomeGestureSettings *)self setHomeGestureXOffsetFactor:1.0];
  v8 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v9 = [v8 userInterfaceIdiom];

  [(SBHomeGestureSettings *)self setHomeGestureCenterZoomDownCenterYOffsetFactor:dbl_1D8FD2020[(v9 & 0xFFFFFFFFFFFFFFFBLL) == 1]];
  [(SBHomeGestureSettings *)self setHomeGestureMinimumCardScale:0.4];
  [(SBHomeGestureSettings *)self homeGestureMinimumCardScale];
  -[SBHomeGestureSettings setHomeGestureMinimumCardScaleRubberBandingRange:](self, "setHomeGestureMinimumCardScaleRubberBandingRange:");
  [(SBHomeGestureSettings *)self setEdgeAngleWindow:2.70526034];
}

- (void)setHomeGestureTuningDefaults
{
  uint64_t v3 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  double v5 = 10.0;
  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v5 = 12.0;
  }
  [(SBHomeGestureSettings *)self setMinimumYDistanceForHomeOrAppSwitcher:v5];
  [(SBHomeGestureSettings *)self minimumYDistanceForHomeOrAppSwitcher];
  -[SBHomeGestureSettings setMinimumYDistanceToConsiderAccelerationDip:](self, "setMinimumYDistanceToConsiderAccelerationDip:");
  [(SBHomeGestureSettings *)self minimumYDistanceForHomeOrAppSwitcher];
  -[SBHomeGestureSettings setMinimumXDistanceForFirstArcSwipe:](self, "setMinimumXDistanceForFirstArcSwipe:");
  [(SBHomeGestureSettings *)self setMinimumXDistanceToTriggerArcByDistancePortrait:17.0];
  [(SBHomeGestureSettings *)self setMinimumXDistanceToTriggerArcByDistanceLandscape:37.0];
  [(SBHomeGestureSettings *)self setMaximumYDistanceToTriggerArcByDistance:9.0];
  [(SBHomeGestureSettings *)self setMaximumYDistanceToTriggerArcByFlick:21.0];
  [(SBHomeGestureSettings *)self setVelocityYThresholdForUnconditionalHome:-204.0];
  [(SBHomeGestureSettings *)self setMinimumYVelocityForHome:-51.0];
  [(SBHomeGestureSettings *)self setVelocityXThresholdForUnconditionalArcSwipe:208.0];
  [(SBHomeGestureSettings *)self setMinimumYVelocityForArcSwipe:51.0];
  double v6 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v7 = [v6 userInterfaceIdiom];

  [(SBHomeGestureSettings *)self setNormalizedDistanceYThresholdForUnconditionalHome:dbl_1D8FD2FC0[(v7 & 0xFFFFFFFFFFFFFFFBLL) == 1]];
  v8 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v9 = [v8 userInterfaceIdiom];

  if ((v9 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v10 = 0.1;
  }
  else {
    double v10 = 0.2;
  }
  [(SBHomeGestureSettings *)self setNormalizedDistanceYThresholdRangeForUnconditionalHome:v10];
  [(SBHomeGestureSettings *)self setNormalizedDistanceYThresholdForUnconditionalHomeInSlideOver:0.6];
  [(SBHomeGestureSettings *)self setNormalizedDistanceYThresholdRangeForUnconditionalHomeInSlideOver:0.2];
  [(SBHomeGestureSettings *)self setPauseVelocityThresholdForAppSwitcher:51.0];
  [(SBHomeGestureSettings *)self setPauseVelocityThresholdForDefiniteAppSwitcher:27.0];
  v11 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v12 = [v11 userInterfaceIdiom];

  [(SBHomeGestureSettings *)self setMaximumAdaptivePauseVelocityThresholdForAppSwitcher:dbl_1D8FD2FD0[(v12 & 0xFFFFFFFFFFFFFFFBLL) == 1]];
  [(SBHomeGestureSettings *)self setSnapToMaxVelocityThresholdAfterAccelerationDip:1];
  [(SBHomeGestureSettings *)self setMaximumAdaptiveVelocityThresholdForDock:308.0];
  [(SBHomeGestureSettings *)self setAppSwitcherVelocityThresholdIncreasingRateFraction:0.2];
  [(SBHomeGestureSettings *)self setDockVelocityThresholdIncreasingRateFraction:0.2];
  [(SBHomeGestureSettings *)self setAdaptiveThresholdsDecreasingRateFraction:0.142857143];
  [(SBHomeGestureSettings *)self setVelocitySlopeThresholdForBottomSwipeUpArc:0.5];
  [(SBHomeGestureSettings *)self setVelocitySlopeThresholdForScrunchArc:1.0];
  [(SBHomeGestureSettings *)self setVelocitySlopeThresholdForCurrentLayout:1.0];
  [(SBHomeGestureSettings *)self setEdgeDistanceToCorrectGestureFinalDestination:3.0];
  [(SBHomeGestureSettings *)self setCardFlyInMaximumVelocityThreshold:3.33];
  [(SBHomeGestureSettings *)self setCardFlyInDelayAfterEnteringAppSwitcher:0.1];
}

- (void)setLatchDefaults
{
  [(SBHomeGestureSettings *)self setMaximumDistanceYThresholdToPresentDock:260.0];
  [(SBHomeGestureSettings *)self setVerticalRubberbandStart:98.0];
  [(SBHomeGestureSettings *)self setVerticalRubberbandEnd:200.0];
  [(SBHomeGestureSettings *)self setVerticalRubberbandDistance:24.0];
  [(SBHomeGestureSettings *)self setVerticalRubberbandExponent:4.0];
  [(SBHomeGestureSettings *)self setHorizontalRubberbandStart:24.0];
  [(SBHomeGestureSettings *)self setHorizontalRubberbandEnd:92.0];
  [(SBHomeGestureSettings *)self setHorizontalRubberbandDistance:16.0];
  [(SBHomeGestureSettings *)self setHorizontalRubberbandExponent:4.0];
  [(SBHomeGestureSettings *)self setInjectGestureVelocityForZoomDown:1];
  uint64_t v3 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  [(SBHomeGestureSettings *)self setOnlyInjectVelocityForShortFlicks:(v4 & 0xFFFFFFFFFFFFFFFBLL) != 1];
  [(SBHomeGestureSettings *)self setPositionVelocityXPercentOfGestureVelocityX:1.0];
  double v5 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v6 = [v5 userInterfaceIdiom];

  double v7 = 0.3;
  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v7 = 0.5;
  }
  [(SBHomeGestureSettings *)self setPositionVelocityYPercentOfGestureVelocityY:v7];
  v8 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v9 = [v8 userInterfaceIdiom];

  double v10 = 1.4;
  if ((v9 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v10 = 1.5;
  }
  [(SBHomeGestureSettings *)self setScaleVelocityPercentOfGestureVelocityYDividedByViewHeight:v10];
  [(SBHomeGestureSettings *)self setMaximumScaleVelocity:10.0];
}

+ (id)settingsControllerModule
{
  v152[4] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Enable Home Gesture" valueKeyPath:@"homeGestureEnabled"];
  v152[0] = v2;
  uint64_t v3 = [MEMORY[0x1E4F94140] rowWithTitle:@"Hysteresis" valueKeyPath:@"hysteresis"];
  uint64_t v4 = [v3 between:0.0 and:25.0];
  double v5 = [v4 valueFormatter:&__block_literal_global_344];
  v152[1] = v5;
  uint64_t v6 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Recognize Along Edge" valueKeyPath:@"recognizeAlongEdge"];
  v152[2] = v6;
  double v7 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Use ZStackResolver Results" valueKeyPath:@"useZStackResolverResults"];
  v152[3] = v7;
  v137 = [MEMORY[0x1E4F1C978] arrayWithObjects:v152 count:4];

  v142 = [MEMORY[0x1E4F94168] sectionWithRows:v137];
  v8 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v9 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v10 = [v9 userInterfaceIdiom];

  uint64_t v11 = [v8 predicateWithValue:(v10 & 0xFFFFFFFFFFFFFFFBLL) == 1];
  v138 = [MEMORY[0x1E4F94140] rowWithTitle:@"Min Y Distance For Home Or Switcher" valueKeyPath:@"minimumYDistanceForHomeOrAppSwitcher"];
  v135 = [v138 between:0.0 and:500.0];
  v151[0] = v135;
  v132 = [MEMORY[0x1E4F94140] rowWithTitle:@"Min Y Distance To Consider Acceleration Dip" valueKeyPath:@"minimumYDistanceToConsiderAccelerationDip"];
  v129 = [v132 between:0.0 and:500.0];
  v151[1] = v129;
  v125 = [MEMORY[0x1E4F94140] rowWithTitle:@"Min X Distance For First Arc" valueKeyPath:@"minimumXDistanceForFirstArcSwipe"];
  v122 = [v125 between:0.0 and:500.0];
  v151[2] = v122;
  v119 = [MEMORY[0x1E4F94140] rowWithTitle:@"Min X Distance For Arc By Distance (Portrait)" valueKeyPath:@"minimumXDistanceToTriggerArcByDistancePortrait"];
  v116 = [v119 between:0.0 and:500.0];
  v151[3] = v116;
  v113 = [MEMORY[0x1E4F94140] rowWithTitle:@"Min X Distance For Arc By Distance (Landscape)" valueKeyPath:@"minimumXDistanceToTriggerArcByDistanceLandscape"];
  v111 = [v113 between:0.0 and:500.0];
  v151[4] = v111;
  v109 = [MEMORY[0x1E4F94140] rowWithTitle:@"Max Y Distance For Arc By Distance" valueKeyPath:@"maximumYDistanceToTriggerArcByDistance"];
  v107 = [v109 between:0.0 and:500.0];
  v151[5] = v107;
  v106 = [MEMORY[0x1E4F94140] rowWithTitle:@"Max Y Distance For Arc By Flick" valueKeyPath:@"maximumYDistanceToTriggerArcByFlick"];
  v105 = [v106 between:0.0 and:500.0];
  v151[6] = v105;
  v104 = [MEMORY[0x1E4F94140] rowWithTitle:@"Velocity Y For Unconditional Home" valueKeyPath:@"velocityYThresholdForUnconditionalHome"];
  v103 = [v104 between:-500.0 and:0.0];
  v151[7] = v103;
  v102 = [MEMORY[0x1E4F94140] rowWithTitle:@"Min Y Velocity For Home" valueKeyPath:@"minimumYVelocityForHome"];
  v101 = [v102 between:-500.0 and:0.0];
  v151[8] = v101;
  v100 = [MEMORY[0x1E4F94140] rowWithTitle:@"Velocity X For Unconditional Arc" valueKeyPath:@"velocityXThresholdForUnconditionalArcSwipe"];
  v99 = [v100 between:0.0 and:500.0];
  v151[9] = v99;
  v98 = [MEMORY[0x1E4F94140] rowWithTitle:@"Min Y Velocity For Arc" valueKeyPath:@"minimumYVelocityForArcSwipe"];
  v97 = [v98 between:0.0 and:500.0];
  v151[10] = v97;
  v96 = [MEMORY[0x1E4F94140] rowWithTitle:@"Normalized Distance Y For Unconditional Home" valueKeyPath:@"normalizedDistanceYThresholdForUnconditionalHome"];
  v95 = [v96 between:0.0 and:500.0];
  v151[11] = v95;
  v94 = [MEMORY[0x1E4F94140] rowWithTitle:@"Normalized Distance Y Range For Unconditional Home" valueKeyPath:@"normalizedDistanceYThresholdRangeForUnconditionalHome"];
  v93 = [v94 between:0.0 and:500.0];
  v151[12] = v93;
  v92 = [MEMORY[0x1E4F94140] rowWithTitle:@"Normalized Distance Y For Unconditional Home In SlideOver" valueKeyPath:@"normalizedDistanceYThresholdForUnconditionalHomeInSlideOver"];
  v91 = [v92 between:0.0 and:500.0];
  v151[13] = v91;
  v90 = [MEMORY[0x1E4F94140] rowWithTitle:@"Normalized Distance Y Range For Unconditional Home In SlideOver" valueKeyPath:@"normalizedDistanceYThresholdRangeForUnconditionalHomeInSlideOver"];
  v89 = [v90 between:0.0 and:500.0];
  v151[14] = v89;
  v88 = [MEMORY[0x1E4F94140] rowWithTitle:@"Pause Velocity For Switcher" valueKeyPath:@"pauseVelocityThresholdForAppSwitcher"];
  v87 = [v88 between:0.0 and:500.0];
  v151[15] = v87;
  v86 = [MEMORY[0x1E4F94140] rowWithTitle:@"Pause Velocity For Definite Switcher" valueKeyPath:@"pauseVelocityThresholdForDefiniteAppSwitcher"];
  v85 = [v86 between:0.0 and:500.0];
  v151[16] = v85;
  v84 = [MEMORY[0x1E4F94140] rowWithTitle:@"Max Adaptive Pause Velocity For Switcher" valueKeyPath:@"maximumAdaptivePauseVelocityThresholdForAppSwitcher"];
  v83 = [v84 between:0.0 and:500.0];
  v151[17] = v83;
  v82 = [MEMORY[0x1E4F94140] rowWithTitle:@"Snap To Max Velocity After Acceleration Dip" valueKeyPath:@"snapToMaxVelocityThresholdAfterAccelerationDip"];
  v81 = [v82 between:0.0 and:500.0];
  v151[18] = v81;
  v80 = [MEMORY[0x1E4F94140] rowWithTitle:@"Max Adaptive Velocity For Dock" valueKeyPath:@"maximumAdaptiveVelocityThresholdForDock"];
  v79 = [v80 between:0.0 and:500.0];
  v78 = [v79 condition:v11];
  v151[19] = v78;
  v77 = [MEMORY[0x1E4F94140] rowWithTitle:@"Switcher Velocity Increasing Rate Fraction" valueKeyPath:@"appSwitcherVelocityThresholdIncreasingRateFraction"];
  v76 = [v77 between:0.0 and:500.0];
  v151[20] = v76;
  v75 = [MEMORY[0x1E4F94140] rowWithTitle:@"Dock Velocity Increasing Rate Fraction" valueKeyPath:@"dockVelocityThresholdIncreasingRateFraction"];
  v74 = [v75 between:0.0 and:500.0];
  uint64_t v12 = v11;
  v141 = (void *)v11;
  v73 = [v74 condition:v11];
  v151[21] = v73;
  v72 = [MEMORY[0x1E4F94140] rowWithTitle:@"Adaptive Thresholds Decreasing Rate Fraction" valueKeyPath:@"adaptiveThresholdsDecreasingRateFraction"];
  v71 = [v72 between:0.0 and:500.0];
  v151[22] = v71;
  v70 = [MEMORY[0x1E4F94140] rowWithTitle:@"Velocity Slope For Bottom Swipe Up Arc" valueKeyPath:@"velocitySlopeThresholdForBottomSwipeUpArc"];
  v69 = [v70 between:0.0 and:500.0];
  v151[23] = v69;
  v68 = [MEMORY[0x1E4F94140] rowWithTitle:@"Velocity Slope For Scrunch Arc" valueKeyPath:@"velocitySlopeThresholdForScrunchArc"];
  v67 = [v68 between:0.0 and:500.0];
  v151[24] = v67;
  v66 = [MEMORY[0x1E4F94140] rowWithTitle:@"Velocity Slope For Current Layout" valueKeyPath:@"velocitySlopeThresholdForCurrentLayout"];
  v13 = [v66 between:0.0 and:500.0];
  v151[25] = v13;
  v14 = [MEMORY[0x1E4F94140] rowWithTitle:@"Edge Distance To Correct Gesture Final Action" valueKeyPath:@"edgeDistanceToCorrectGestureFinalDestination"];
  v15 = [v14 between:0.0 and:500.0];
  v151[26] = v15;
  v16 = [MEMORY[0x1E4F94140] rowWithTitle:@"Card Fly In Max Velocity Threshold" valueKeyPath:@"cardFlyInMaximumVelocityThreshold"];
  v17 = [v16 between:0.0 and:500.0];
  v151[27] = v17;
  v18 = [MEMORY[0x1E4F94140] rowWithTitle:@"Card Fly In Delay After Entering Switcher" valueKeyPath:@"cardFlyInDelayAfterEnteringAppSwitcher"];
  v19 = [v18 between:0.0 and:500.0];
  v151[28] = v19;
  v20 = [MEMORY[0x1E4F94140] rowWithTitle:@"Max Distance Y To Present Dock" valueKeyPath:@"maximumDistanceYThresholdToPresentDock"];
  v21 = [v20 between:0.0 and:500.0];
  v22 = [v21 condition:v12];
  v151[29] = v22;
  v140 = [MEMORY[0x1E4F1C978] arrayWithObjects:v151 count:30];

  v139 = [MEMORY[0x1E4F94168] sectionWithRows:v140];
  v133 = [MEMORY[0x1E4F94140] rowWithTitle:@"Vertical Rubberband Start" valueKeyPath:@"verticalRubberbandStart"];
  v130 = [v133 between:0.0 and:500.0];
  v150[0] = v130;
  v126 = [MEMORY[0x1E4F94140] rowWithTitle:@"Vertical Rubberband End" valueKeyPath:@"verticalRubberbandEnd"];
  v123 = [v126 between:0.0 and:500.0];
  v150[1] = v123;
  v120 = [MEMORY[0x1E4F94140] rowWithTitle:@"Vertical Rubberband Distance" valueKeyPath:@"verticalRubberbandDistance"];
  v117 = [v120 between:0.0 and:500.0];
  v150[2] = v117;
  v114 = [MEMORY[0x1E4F94140] rowWithTitle:@"Vertical Rubberband Exponent" valueKeyPath:@"verticalRubberbandExponent"];
  v23 = [v114 between:0.0 and:10.0];
  v150[3] = v23;
  v24 = [MEMORY[0x1E4F94140] rowWithTitle:@"Horizontal Rubberband Start" valueKeyPath:@"horizontalRubberbandStart"];
  v25 = [v24 between:0.0 and:500.0];
  v150[4] = v25;
  v26 = [MEMORY[0x1E4F94140] rowWithTitle:@"Horizontal Rubberband End" valueKeyPath:@"horizontalRubberbandEnd"];
  v27 = [v26 between:0.0 and:500.0];
  v150[5] = v27;
  v28 = [MEMORY[0x1E4F94140] rowWithTitle:@"Horizontal Rubberband Distance" valueKeyPath:@"horizontalRubberbandDistance"];
  v29 = [v28 between:0.0 and:500.0];
  v150[6] = v29;
  v30 = [MEMORY[0x1E4F94140] rowWithTitle:@"Horizontal Rubberband Exponent" valueKeyPath:@"horizontalRubberbandExponent"];
  v31 = [v30 between:0.0 and:10.0];
  v150[7] = v31;
  v136 = [MEMORY[0x1E4F1C978] arrayWithObjects:v150 count:8];

  v134 = [MEMORY[0x1E4F94168] sectionWithRows:v136 title:@"Latch" condition:v141];
  v127 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Inject Velocity For Zoom Down" valueKeyPath:@"injectGestureVelocityForZoomDown"];
  v149[0] = v127;
  v32 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Only for Short Flicks" valueKeyPath:@"onlyInjectVelocityForShortFlicks"];
  v149[1] = v32;
  v33 = [MEMORY[0x1E4F94140] rowWithTitle:@"Position Velocity X Percent of Gesture Velocity X" valueKeyPath:@"positionVelocityXPercentOfGestureVelocityX"];
  v34 = [v33 between:0.0 and:500.0];
  v149[2] = v34;
  v35 = [MEMORY[0x1E4F94140] rowWithTitle:@"Position Velocity Y Percent Of Gesture Velocity Y" valueKeyPath:@"positionVelocityYPercentOfGestureVelocityY"];
  v36 = [v35 between:0.0 and:500.0];
  v149[3] = v36;
  v37 = [MEMORY[0x1E4F94140] rowWithTitle:@"Scale Velocity Percent Of Gesture Velocity Y Divided By View Height" valueKeyPath:@"scaleVelocityPercentOfGestureVelocityYDividedByViewHeight"];
  v38 = [v37 between:0.0 and:10.0];
  v149[4] = v38;
  v39 = [MEMORY[0x1E4F94140] rowWithTitle:@"Maximum Scale Velocity" valueKeyPath:@"maximumScaleVelocity"];
  v40 = [v39 between:0.0 and:20.0];
  v149[5] = v40;
  v131 = [MEMORY[0x1E4F1C978] arrayWithObjects:v149 count:6];

  v128 = [MEMORY[0x1E4F94168] sectionWithRows:v131 title:@"Velocity Injection"];
  v41 = [MEMORY[0x1E4F94140] rowWithTitle:@"Seconds to Allow Multiple Edges" valueKeyPath:@"secondsToAllowMultipleEdges"];
  v42 = [v41 between:0.0 and:10.0];
  v43 = [v42 valueFormatter:&__block_literal_global_344];
  v148[0] = v43;
  v44 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Reset After App Interaction" valueKeyPath:@"preventMultipleEdgesAfterAppInteraction"];
  v148[1] = v44;
  v124 = [MEMORY[0x1E4F1C978] arrayWithObjects:v148 count:2];

  v121 = [MEMORY[0x1E4F94168] sectionWithRows:v124 title:@"Orientation"];
  v45 = [MEMORY[0x1E4F94140] rowWithTitle:@"Seconds to Reset Switcher List After Transition" valueKeyPath:@"secondsToResetSwitcherListAfterTransition"];
  v46 = [v45 between:0.0 and:10.0];
  v47 = [v46 valueFormatter:&__block_literal_global_344];
  v147[0] = v47;
  v48 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Reset After App Interaction" valueKeyPath:@"resetSwitcherListAfterAppInteraction"];
  v147[1] = v48;
  v118 = [MEMORY[0x1E4F1C978] arrayWithObjects:v147 count:2];

  v115 = [MEMORY[0x1E4F94168] sectionWithRows:v118 title:@"Switcher Model Changes"];
  v49 = [MEMORY[0x1E4F94140] rowWithTitle:@"Travel Distance For Translating Screen Height" valueKeyPath:@"travelDistanceForTranslatingScreenHeight"];
  v50 = [v49 precision:2];
  v146[0] = v50;
  v51 = [MEMORY[0x1E4F94140] rowWithTitle:@"Minimum Distance Threshold To Scale Multiplier" valueKeyPath:@"minimumDistanceThresholdToScaleMultiplier"];
  v52 = [v51 precision:2];
  v146[1] = v52;
  v112 = [MEMORY[0x1E4F1C978] arrayWithObjects:v146 count:2];

  v53 = [MEMORY[0x1E4F94168] sectionWithRows:v112 title:@"Trackpad"];
  v110 = [MEMORY[0x1E4F94138] rowWithTitle:@"Exclusion Trapezoids" childSettingsKeyPath:@"exclusionTrapezoidSettings"];
  v54 = (void *)MEMORY[0x1E4F94168];
  v145 = v110;
  v55 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v145 count:1];
  v108 = [v54 sectionWithRows:v55];

  v56 = (void *)MEMORY[0x1E4F94100];
  v57 = [MEMORY[0x1E4F94178] actionWithSettingsKeyPath:0];
  v58 = [v56 rowWithTitle:@"Restore Defaults" action:v57];

  v59 = (void *)MEMORY[0x1E4F94168];
  v144 = v58;
  v60 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v144 count:1];
  v61 = [v59 sectionWithRows:v60];

  v62 = (void *)MEMORY[0x1E4F94168];
  v143[0] = v142;
  v143[1] = v139;
  v143[2] = v134;
  v143[3] = v128;
  v143[4] = v121;
  v143[5] = v115;
  v143[6] = v53;
  v143[7] = v108;
  v143[8] = v61;
  v63 = [MEMORY[0x1E4F1C978] arrayWithObjects:v143 count:9];
  v64 = [v62 moduleWithTitle:0 contents:v63];

  return v64;
}

uint64_t __49__SBHomeGestureSettings_settingsControllerModule__block_invoke(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  [a2 floatValue];
  double v4 = roundf(v3 + v3) * 0.5;
  return [v2 numberWithDouble:v4];
}

- (void)setHomeGestureEnabled:(BOOL)a3
{
  self->_homeGestureEnabled = a3;
}

- (double)hysteresis
{
  return self->_hysteresis;
}

- (void)setHysteresis:(double)a3
{
  self->_hysteresis = a3;
}

- (BOOL)recognizeAlongEdge
{
  return self->_recognizeAlongEdge;
}

- (void)setRecognizeAlongEdge:(BOOL)a3
{
  self->_recognizeAlongEdge = a3;
}

- (BOOL)useZStackResolverResults
{
  return self->_useZStackResolverResults;
}

- (void)setUseZStackResolverResults:(BOOL)a3
{
  self->_useZStackResolverResults = a3;
}

- (double)minimumYDistanceForHomeOrAppSwitcher
{
  return self->_minimumYDistanceForHomeOrAppSwitcher;
}

- (void)setMinimumYDistanceForHomeOrAppSwitcher:(double)a3
{
  self->_minimumYDistanceForHomeOrAppSwitcher = a3;
}

- (double)minimumYDistanceToConsiderAccelerationDip
{
  return self->_minimumYDistanceToConsiderAccelerationDip;
}

- (void)setMinimumYDistanceToConsiderAccelerationDip:(double)a3
{
  self->_minimumYDistanceToConsiderAccelerationDip = a3;
}

- (double)minimumXDistanceForFirstArcSwipe
{
  return self->_minimumXDistanceForFirstArcSwipe;
}

- (void)setMinimumXDistanceForFirstArcSwipe:(double)a3
{
  self->_minimumXDistanceForFirstArcSwipe = a3;
}

- (double)minimumXDistanceToTriggerArcByDistancePortrait
{
  return self->_minimumXDistanceToTriggerArcByDistancePortrait;
}

- (void)setMinimumXDistanceToTriggerArcByDistancePortrait:(double)a3
{
  self->_minimumXDistanceToTriggerArcByDistancePortrait = a3;
}

- (double)minimumXDistanceToTriggerArcByDistanceLandscape
{
  return self->_minimumXDistanceToTriggerArcByDistanceLandscape;
}

- (void)setMinimumXDistanceToTriggerArcByDistanceLandscape:(double)a3
{
  self->_minimumXDistanceToTriggerArcByDistanceLandscape = a3;
}

- (double)maximumYDistanceToTriggerArcByDistance
{
  return self->_maximumYDistanceToTriggerArcByDistance;
}

- (void)setMaximumYDistanceToTriggerArcByDistance:(double)a3
{
  self->_maximumYDistanceToTriggerArcByDistance = a3;
}

- (double)maximumYDistanceToTriggerArcByFlick
{
  return self->_maximumYDistanceToTriggerArcByFlick;
}

- (void)setMaximumYDistanceToTriggerArcByFlick:(double)a3
{
  self->_maximumYDistanceToTriggerArcByFlick = a3;
}

- (double)velocityYThresholdForUnconditionalHome
{
  return self->_velocityYThresholdForUnconditionalHome;
}

- (void)setVelocityYThresholdForUnconditionalHome:(double)a3
{
  self->_velocityYThresholdForUnconditionalHome = a3;
}

- (double)minimumYVelocityForHome
{
  return self->_minimumYVelocityForHome;
}

- (void)setMinimumYVelocityForHome:(double)a3
{
  self->_minimumYVelocityForHome = a3;
}

- (double)velocityXThresholdForUnconditionalArcSwipe
{
  return self->_velocityXThresholdForUnconditionalArcSwipe;
}

- (void)setVelocityXThresholdForUnconditionalArcSwipe:(double)a3
{
  self->_velocityXThresholdForUnconditionalArcSwipe = a3;
}

- (double)minimumYVelocityForArcSwipe
{
  return self->_minimumYVelocityForArcSwipe;
}

- (void)setMinimumYVelocityForArcSwipe:(double)a3
{
  self->_minimumYVelocityForArcSwipe = a3;
}

- (double)normalizedDistanceYThresholdForUnconditionalHome
{
  return self->_normalizedDistanceYThresholdForUnconditionalHome;
}

- (void)setNormalizedDistanceYThresholdForUnconditionalHome:(double)a3
{
  self->_normalizedDistanceYThresholdForUnconditionalHome = a3;
}

- (double)normalizedDistanceYThresholdRangeForUnconditionalHome
{
  return self->_normalizedDistanceYThresholdRangeForUnconditionalHome;
}

- (void)setNormalizedDistanceYThresholdRangeForUnconditionalHome:(double)a3
{
  self->_normalizedDistanceYThresholdRangeForUnconditionalHome = a3;
}

- (double)normalizedDistanceYThresholdForUnconditionalHomeInSlideOver
{
  return self->_normalizedDistanceYThresholdForUnconditionalHomeInSlideOver;
}

- (void)setNormalizedDistanceYThresholdForUnconditionalHomeInSlideOver:(double)a3
{
  self->_normalizedDistanceYThresholdForUnconditionalHomeInSlideOver = a3;
}

- (double)normalizedDistanceYThresholdRangeForUnconditionalHomeInSlideOver
{
  return self->_normalizedDistanceYThresholdRangeForUnconditionalHomeInSlideOver;
}

- (void)setNormalizedDistanceYThresholdRangeForUnconditionalHomeInSlideOver:(double)a3
{
  self->_normalizedDistanceYThresholdRangeForUnconditionalHomeInSlideOver = a3;
}

- (double)pauseVelocityThresholdForAppSwitcher
{
  return self->_pauseVelocityThresholdForAppSwitcher;
}

- (void)setPauseVelocityThresholdForAppSwitcher:(double)a3
{
  self->_pauseVelocityThresholdForAppSwitcher = a3;
}

- (double)pauseVelocityThresholdForDefiniteAppSwitcher
{
  return self->_pauseVelocityThresholdForDefiniteAppSwitcher;
}

- (void)setPauseVelocityThresholdForDefiniteAppSwitcher:(double)a3
{
  self->_pauseVelocityThresholdForDefiniteAppSwitcher = a3;
}

- (double)maximumAdaptivePauseVelocityThresholdForAppSwitcher
{
  return self->_maximumAdaptivePauseVelocityThresholdForAppSwitcher;
}

- (void)setMaximumAdaptivePauseVelocityThresholdForAppSwitcher:(double)a3
{
  self->_maximumAdaptivePauseVelocityThresholdForAppSwitcher = a3;
}

- (BOOL)snapToMaxVelocityThresholdAfterAccelerationDip
{
  return self->_snapToMaxVelocityThresholdAfterAccelerationDip;
}

- (void)setSnapToMaxVelocityThresholdAfterAccelerationDip:(BOOL)a3
{
  self->_snapToMaxVelocityThresholdAfterAccelerationDip = a3;
}

- (double)maximumAdaptiveVelocityThresholdForDock
{
  return self->_maximumAdaptiveVelocityThresholdForDock;
}

- (void)setMaximumAdaptiveVelocityThresholdForDock:(double)a3
{
  self->_maximumAdaptiveVelocityThresholdForDock = a3;
}

- (double)appSwitcherVelocityThresholdIncreasingRateFraction
{
  return self->_appSwitcherVelocityThresholdIncreasingRateFraction;
}

- (void)setAppSwitcherVelocityThresholdIncreasingRateFraction:(double)a3
{
  self->_appSwitcherVelocityThresholdIncreasingRateFraction = a3;
}

- (double)dockVelocityThresholdIncreasingRateFraction
{
  return self->_dockVelocityThresholdIncreasingRateFraction;
}

- (void)setDockVelocityThresholdIncreasingRateFraction:(double)a3
{
  self->_dockVelocityThresholdIncreasingRateFraction = a3;
}

- (double)adaptiveThresholdsDecreasingRateFraction
{
  return self->_adaptiveThresholdsDecreasingRateFraction;
}

- (void)setAdaptiveThresholdsDecreasingRateFraction:(double)a3
{
  self->_adaptiveThresholdsDecreasingRateFraction = a3;
}

- (double)velocitySlopeThresholdForBottomSwipeUpArc
{
  return self->_velocitySlopeThresholdForBottomSwipeUpArc;
}

- (void)setVelocitySlopeThresholdForBottomSwipeUpArc:(double)a3
{
  self->_velocitySlopeThresholdForBottomSwipeUpArc = a3;
}

- (double)velocitySlopeThresholdForScrunchArc
{
  return self->_velocitySlopeThresholdForScrunchArc;
}

- (void)setVelocitySlopeThresholdForScrunchArc:(double)a3
{
  self->_velocitySlopeThresholdForScrunchArc = a3;
}

- (double)velocitySlopeThresholdForCurrentLayout
{
  return self->_velocitySlopeThresholdForCurrentLayout;
}

- (void)setVelocitySlopeThresholdForCurrentLayout:(double)a3
{
  self->_velocitySlopeThresholdForCurrentLayout = a3;
}

- (double)edgeDistanceToCorrectGestureFinalDestination
{
  return self->_edgeDistanceToCorrectGestureFinalDestination;
}

- (void)setEdgeDistanceToCorrectGestureFinalDestination:(double)a3
{
  self->_edgeDistanceToCorrectGestureFinalDestination = a3;
}

- (double)edgeAngleWindow
{
  return self->_edgeAngleWindow;
}

- (void)setEdgeAngleWindow:(double)a3
{
  self->_edgeAngleWindow = a3;
}

- (double)cardFlyInMaximumVelocityThreshold
{
  return self->_cardFlyInMaximumVelocityThreshold;
}

- (void)setCardFlyInMaximumVelocityThreshold:(double)a3
{
  self->_cardFlyInMaximumVelocityThreshold = a3;
}

- (double)cardFlyInDelayAfterEnteringAppSwitcher
{
  return self->_cardFlyInDelayAfterEnteringAppSwitcher;
}

- (void)setCardFlyInDelayAfterEnteringAppSwitcher:(double)a3
{
  self->_cardFlyInDelayAfterEnteringAppSwitcher = a3;
}

- (double)maximumDistanceYThresholdToPresentDock
{
  return self->_maximumDistanceYThresholdToPresentDock;
}

- (void)setMaximumDistanceYThresholdToPresentDock:(double)a3
{
  self->_maximumDistanceYThresholdToPresentDock = a3;
}

- (double)homeGestureXOffsetFactor
{
  return self->_homeGestureXOffsetFactor;
}

- (void)setHomeGestureXOffsetFactor:(double)a3
{
  self->_homeGestureXOffsetFactor = a3;
}

- (double)homeGestureCenterZoomDownCenterYOffsetFactor
{
  return self->_homeGestureCenterZoomDownCenterYOffsetFactor;
}

- (void)setHomeGestureCenterZoomDownCenterYOffsetFactor:(double)a3
{
  self->_homeGestureCenterZoomDownCenterYOffsetFactor = a3;
}

- (double)homeGestureMinimumCardScale
{
  return self->_homeGestureMinimumCardScale;
}

- (void)setHomeGestureMinimumCardScale:(double)a3
{
  self->_homeGestureMinimumCardScale = a3;
}

- (double)homeGestureMinimumCardScaleRubberBandingRange
{
  return self->_homeGestureMinimumCardScaleRubberBandingRange;
}

- (void)setHomeGestureMinimumCardScaleRubberBandingRange:(double)a3
{
  self->_homeGestureMinimumCardScaleRubberBandingRange = a3;
}

- (double)verticalRubberbandStart
{
  return self->_verticalRubberbandStart;
}

- (void)setVerticalRubberbandStart:(double)a3
{
  self->_verticalRubberbandStart = a3;
}

- (double)verticalRubberbandEnd
{
  return self->_verticalRubberbandEnd;
}

- (void)setVerticalRubberbandEnd:(double)a3
{
  self->_verticalRubberbandEnd = a3;
}

- (double)verticalRubberbandDistance
{
  return self->_verticalRubberbandDistance;
}

- (void)setVerticalRubberbandDistance:(double)a3
{
  self->_verticalRubberbandDistance = a3;
}

- (double)verticalRubberbandExponent
{
  return self->_verticalRubberbandExponent;
}

- (void)setVerticalRubberbandExponent:(double)a3
{
  self->_verticalRubberbandExponent = a3;
}

- (double)horizontalRubberbandStart
{
  return self->_horizontalRubberbandStart;
}

- (void)setHorizontalRubberbandStart:(double)a3
{
  self->_horizontalRubberbandStart = a3;
}

- (double)horizontalRubberbandEnd
{
  return self->_horizontalRubberbandEnd;
}

- (void)setHorizontalRubberbandEnd:(double)a3
{
  self->_horizontalRubberbandEnd = a3;
}

- (double)horizontalRubberbandDistance
{
  return self->_horizontalRubberbandDistance;
}

- (void)setHorizontalRubberbandDistance:(double)a3
{
  self->_horizontalRubberbandDistance = a3;
}

- (double)horizontalRubberbandExponent
{
  return self->_horizontalRubberbandExponent;
}

- (void)setHorizontalRubberbandExponent:(double)a3
{
  self->_horizontalRubberbandExponent = a3;
}

- (BOOL)injectGestureVelocityForZoomDown
{
  return self->_injectGestureVelocityForZoomDown;
}

- (void)setInjectGestureVelocityForZoomDown:(BOOL)a3
{
  self->_injectGestureVelocityForZoomDown = a3;
}

- (BOOL)onlyInjectVelocityForShortFlicks
{
  return self->_onlyInjectVelocityForShortFlicks;
}

- (void)setOnlyInjectVelocityForShortFlicks:(BOOL)a3
{
  self->_onlyInjectVelocityForShortFlicks = a3;
}

- (double)positionVelocityXPercentOfGestureVelocityX
{
  return self->_positionVelocityXPercentOfGestureVelocityX;
}

- (void)setPositionVelocityXPercentOfGestureVelocityX:(double)a3
{
  self->_positionVelocityXPercentOfGestureVelocityX = a3;
}

- (double)positionVelocityYPercentOfGestureVelocityY
{
  return self->_positionVelocityYPercentOfGestureVelocityY;
}

- (void)setPositionVelocityYPercentOfGestureVelocityY:(double)a3
{
  self->_positionVelocityYPercentOfGestureVelocityY = a3;
}

- (double)scaleVelocityPercentOfGestureVelocityYDividedByViewHeight
{
  return self->_scaleVelocityPercentOfGestureVelocityYDividedByViewHeight;
}

- (void)setScaleVelocityPercentOfGestureVelocityYDividedByViewHeight:(double)a3
{
  self->_scaleVelocityPercentOfGestureVelocityYDividedByViewHeight = a3;
}

- (double)maximumScaleVelocity
{
  return self->_maximumScaleVelocity;
}

- (void)setMaximumScaleVelocity:(double)a3
{
  self->_maximumScaleVelocity = a3;
}

- (void)setSecondsToAllowMultipleEdges:(double)a3
{
  self->_secondsToAllowMultipleEdges = a3;
}

- (BOOL)preventMultipleEdgesAfterAppInteraction
{
  return self->_preventMultipleEdgesAfterAppInteraction;
}

- (void)setPreventMultipleEdgesAfterAppInteraction:(BOOL)a3
{
  self->_preventMultipleEdgesAfterAppInteraction = a3;
}

- (void)setSecondsToResetSwitcherListAfterTransition:(double)a3
{
  self->_secondsToResetSwitcherListAfterTransition = a3;
}

- (BOOL)resetSwitcherListAfterAppInteraction
{
  return self->_resetSwitcherListAfterAppInteraction;
}

- (void)setResetSwitcherListAfterAppInteraction:(BOOL)a3
{
  self->_resetSwitcherListAfterAppInteraction = a3;
}

- (double)travelDistanceForTranslatingScreenHeight
{
  return self->_travelDistanceForTranslatingScreenHeight;
}

- (void)setTravelDistanceForTranslatingScreenHeight:(double)a3
{
  self->_travelDistanceForTranslatingScreenHeight = a3;
}

- (double)minimumDistanceThresholdToScaleMultiplier
{
  return self->_minimumDistanceThresholdToScaleMultiplier;
}

- (void)setMinimumDistanceThresholdToScaleMultiplier:(double)a3
{
  self->_minimumDistanceThresholdToScaleMultiplier = a3;
}

- (void)setExclusionTrapezoidSettings:(id)a3
{
}

- (void).cxx_destruct
{
}

@end