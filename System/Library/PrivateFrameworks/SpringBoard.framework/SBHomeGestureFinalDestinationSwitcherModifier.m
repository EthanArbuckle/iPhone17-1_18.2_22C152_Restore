@interface SBHomeGestureFinalDestinationSwitcherModifier
- (BOOL)_hasTraveledSufficientDistanceForHomeOrAppSwitcherForMouseEvent:(BOOL)a3;
- (BOOL)_isTranslationPastDistanceThresholdToUnconditionallyGoHome:(double)a3;
- (BOOL)hasSeenAccelerationDipForAppSwitcher;
- (NSString)finalDestinationReason;
- (SBHomeGestureFinalDestinationSwitcherModifier)initWithDelegate:(id)a3 initialTranslationAdjustment:(CGPoint)a4 minYDistanceForHomeOrSwitcher:(double)a5 startingEnvironmentMode:(int64_t)a6 continuingGesture:(BOOL)a7 dockModifier:(id)a8;
- (double)_unconditionalDistanceThresholdForHome;
- (id)debugDescription;
- (id)handleGestureEvent:(id)a3;
- (id)handleHomeGestureSettingsChangedEvent:(id)a3;
- (id)handleSwitcherSettingsChangedEvent:(id)a3;
- (id)studyLogData;
- (int64_t)_adjustedFinalDestinationAccountingForEdgeDataDistortion:(int64_t)a3 location:(CGPoint)a4;
- (int64_t)currentFinalDestination;
- (void)_applyPrototypeSettings;
- (void)_updateAdaptiveThresholdsForCurrentFinalDestination:(int64_t)a3 velocityAverage:(CGPoint)a4;
- (void)_updateForGestureDidBeginWithEvent:(id)a3;
- (void)_updateForGestureDidChangeWithEvent:(id)a3;
- (void)_updateForGestureDidEndWithEvent:(id)a3;
- (void)_updateGestureTranslationVelocityAndProgressWithEvent:(id)a3;
- (void)didMoveToParentModifier:(id)a3;
@end

@implementation SBHomeGestureFinalDestinationSwitcherModifier

- (SBHomeGestureFinalDestinationSwitcherModifier)initWithDelegate:(id)a3 initialTranslationAdjustment:(CGPoint)a4 minYDistanceForHomeOrSwitcher:(double)a5 startingEnvironmentMode:(int64_t)a6 continuingGesture:(BOOL)a7 dockModifier:(id)a8
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  id v15 = a3;
  id v16 = a8;
  v20.receiver = self;
  v20.super_class = (Class)SBHomeGestureFinalDestinationSwitcherModifier;
  v17 = [(SBSwitcherModifier *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeWeak((id *)&v17->_finalDestinationDelegate, v15);
    v18->_initialTranslationAdjustment.CGFloat x = x;
    v18->_initialTranslationAdjustment.CGFloat y = y;
    v18->_minYDistanceForHomeOrSwitcher = a5;
    v18->_startingEnvironmentMode = a6;
    v18->_continuingGesture = a7;
    objc_storeStrong((id *)&v18->_dockModifier, a8);
  }

  return v18;
}

- (void)didMoveToParentModifier:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBHomeGestureFinalDestinationSwitcherModifier;
  -[SBChainableModifier didMoveToParentModifier:](&v5, sel_didMoveToParentModifier_);
  if (a3)
  {
    [(SBHomeGestureFinalDestinationSwitcherModifier *)self _applyPrototypeSettings];
    if (self->_dockModifier) {
      -[SBChainableModifier addChildModifier:](self, "addChildModifier:");
    }
  }
}

- (id)handleHomeGestureSettingsChangedEvent:(id)a3
{
  id v4 = a3;
  [(SBHomeGestureFinalDestinationSwitcherModifier *)self _applyPrototypeSettings];
  v7.receiver = self;
  v7.super_class = (Class)SBHomeGestureFinalDestinationSwitcherModifier;
  objc_super v5 = [(SBSwitcherModifier *)&v7 handleHomeGestureSettingsChangedEvent:v4];

  return v5;
}

- (id)handleSwitcherSettingsChangedEvent:(id)a3
{
  id v4 = a3;
  [(SBHomeGestureFinalDestinationSwitcherModifier *)self _applyPrototypeSettings];
  v7.receiver = self;
  v7.super_class = (Class)SBHomeGestureFinalDestinationSwitcherModifier;
  objc_super v5 = [(SBSwitcherModifier *)&v7 handleSwitcherSettingsChangedEvent:v4];

  return v5;
}

- (id)handleGestureEvent:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBHomeGestureFinalDestinationSwitcherModifier;
  v6 = [(SBSwitcherModifier *)&v9 handleGestureEvent:v5];
  switch([v5 phase])
  {
    case 0:
      objc_super v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:a2 object:self file:@"SBHomeGestureFinalDestinationSwitcherModifier.m" lineNumber:156 description:@"Should not be getting PhasePossible"];

      break;
    case 1:
      [(SBHomeGestureFinalDestinationSwitcherModifier *)self _updateForGestureDidBeginWithEvent:v5];
      break;
    case 2:
      [(SBHomeGestureFinalDestinationSwitcherModifier *)self _updateForGestureDidChangeWithEvent:v5];
      break;
    case 3:
      [(SBHomeGestureFinalDestinationSwitcherModifier *)self _updateForGestureDidEndWithEvent:v5];
      break;
    default:
      break;
  }

  return v6;
}

- (void)_updateForGestureDidBeginWithEvent:(id)a3
{
  id v13 = a3;
  if (self->_gestureHasBegun)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"SBHomeGestureFinalDestinationSwitcherModifier.m" lineNumber:173 description:@"Can't begin a gesture that has already begun."];
  }
  if (self->_gestureHasEnded)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"SBHomeGestureFinalDestinationSwitcherModifier.m" lineNumber:174 description:@"Can't begin a gesture that has already ended."];
  }
  self->_gestureHasBegun = 1;
  self->_numberOfTouchSamples = 0;
  uint64_t v5 = [v13 type];
  self->_scrunchInitiated = v5 == 3;
  *(void *)&self->_adaptiveMinimumYVelocityForHome = kMinimumYVelocityForHome;
  *(void *)&self->_adaptivePauseVelocityThresholdForAppSwitcher = kPauseVelocityThresholdForAppSwitcher_0;
  v6 = &kVelocitySlopeThresholdForScrunchArc;
  if (v5 != 3) {
    v6 = &kVelocitySlopeThresholdForBottomSwipeUpArc;
  }
  *(void *)&self->_adaptiveVelocitySlopeThresholdForArc = *v6;
  self->_lastFinalDestination = 0.0;
  [v13 averageTouchVelocityOverTimeDuration:0.25];
  self->_lastAverageVelocityYForAcceleration = v7;
  [v13 locationInContainerView];
  self->_initialTouchLocation.CGFloat x = v8;
  self->_initialTouchLocation.CGFloat y = v9;
  self->_lastTouchLocation.CGFloat x = v8;
  self->_lastTouchLocation.CGFloat y = v9;
  if (self->_startingEnvironmentMode == 2)
  {
    [(SBHomeGestureFinalDestinationSwitcherModifier *)self containerViewBounds];
    self->_initialTouchLocation.CGFloat y = v10;
  }
  [(SBHomeGestureFinalDestinationSwitcherModifier *)self _updateGestureTranslationVelocityAndProgressWithEvent:v13];
}

- (void)_updateForGestureDidChangeWithEvent:(id)a3
{
  id v25 = a3;
  if (!self->_gestureHasBegun)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2 object:self file:@"SBHomeGestureFinalDestinationSwitcherModifier.m" lineNumber:201 description:@"Can't update a gesture that has not begun."];
  }
  if (self->_gestureHasEnded)
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2 object:self file:@"SBHomeGestureFinalDestinationSwitcherModifier.m" lineNumber:202 description:@"Can't update a gesture that has already ended."];
  }
  double lastTouchTimestamp = self->_lastTouchTimestamp;
  [(SBHomeGestureFinalDestinationSwitcherModifier *)self _updateGestureTranslationVelocityAndProgressWithEvent:v25];
  if ([(SBHomeGestureFinalDestinationSwitcherModifier *)self _isTranslationPastDistanceThresholdToUnconditionallyGoHome:self->_translation.y])
  {
    self->_hasSeenAccelerationDipForAppSwitcher = 0;
    self->_double lastAverageVelocityYForAcceleration = 0.0;
  }
  v6 = [(SBHomeGestureFinalDestinationSwitcherModifier *)self switcherSettings];
  double v7 = [v6 animationSettings];

  [v25 averageTouchVelocityOverTimeDuration:0.25];
  double v9 = v8;
  unint64_t numberOfTouchSamples = self->_numberOfTouchSamples;
  if (numberOfTouchSamples > [v7 minimumTouchSamplesForAccelerationDip]
    && (BSFloatEqualToFloat() & 1) == 0)
  {
    [(SBHomeGestureFinalDestinationSwitcherModifier *)self containerViewBounds];
    double v12 = v11;
    [v25 locationInContainerView];
    if (v13 <= v12 - *(double *)&kMinimumYDistanceToConsiderAccelerationDip)
    {
      double lastAverageVelocityYForAcceleration = self->_lastAverageVelocityYForAcceleration;
      double v15 = self->_lastTouchTimestamp;
      [v7 cardFlyInAccelerationDipThreshold];
      if (!self->_hasSeenAccelerationDipForAppSwitcher
        && (v9 - lastAverageVelocityYForAcceleration) / (v15 - lastTouchTimestamp) > v16)
      {
        self->_hasSeenAccelerationDipForAppSwitcher = 1;
      }
    }
  }
  self->_double lastAverageVelocityYForAcceleration = v9;
  uint64_t v17 = [(SBHomeGestureFinalDestinationSwitcherModifier *)self currentFinalDestination];
  self->_updateEdgeRegionSampleCounter = 1;
  self->_lastFinalDestination = (double)v17;
  -[SBHomeGestureFinalDestinationSwitcherModifier _updateAdaptiveThresholdsForCurrentFinalDestination:velocityAverage:](self, "_updateAdaptiveThresholdsForCurrentFinalDestination:velocityAverage:", v17, self->_velocity.x, self->_velocity.y);
  self->_updateEdgeRegionSampleCounter = 0;
  [v25 locationInContainerView];
  double v19 = v18;
  CGFloat v21 = v20;
  [(SBHomeGestureFinalDestinationSwitcherModifier *)self isRTLEnabled];
  BOOL v22 = v19 > self->_lastTouchLocation.x;
  if (self->_movingTowardsNextLayoutState != v22)
  {
    self->_movingTowardsNextLayoutState = v22;
    self->_directionSwitchLocation.CGFloat x = v19;
    self->_directionSwitchLocation.CGFloat y = v21;
  }
  self->_lastTouchLocation.CGFloat x = v19;
  self->_lastTouchLocation.CGFloat y = v21;
}

- (void)_updateForGestureDidEndWithEvent:(id)a3
{
  id v5 = a3;
  id v11 = v5;
  if (!self->_gestureHasBegun)
  {
    double v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"SBHomeGestureFinalDestinationSwitcherModifier.m" lineNumber:252 description:@"Can't end a gesture that has not begun."];

    id v5 = v11;
  }
  if (self->_gestureHasEnded)
  {
    CGFloat v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"SBHomeGestureFinalDestinationSwitcherModifier.m" lineNumber:253 description:@"Can't end a gesture that has already ended."];

    id v5 = v11;
  }
  self->_gestureHasEnded = 1;
  [(SBHomeGestureFinalDestinationSwitcherModifier *)self _updateGestureTranslationVelocityAndProgressWithEvent:v5];
  p_lastTouchLocation = &self->_lastTouchLocation;
  [v11 locationInContainerView];
  p_lastTouchLocation->CGFloat x = v7;
  p_lastTouchLocation->CGFloat y = v8;
}

- (void)_updateGestureTranslationVelocityAndProgressWithEvent:(id)a3
{
  id v4 = a3;
  [v4 translationInContainerView];
  CGFloat v6 = v5 + self->_initialTranslationAdjustment.x;
  CGFloat v8 = v7 + self->_initialTranslationAdjustment.y;
  [v4 averageTouchVelocityOverTimeDuration:0.0416666667];
  self->_translation.CGFloat x = v6;
  self->_translation.CGFloat y = v8;
  self->_velocity.CGFloat x = v9;
  self->_velocity.CGFloat y = v10;
  [v4 lastTouchTimestamp];
  self->_double lastTouchTimestamp = v11;
  ++self->_numberOfTouchSamples;
  self->_touchType = [v4 touchType];
  char v12 = [v4 isMouseEvent];

  self->_isMouseEvent = v12;
}

- (int64_t)currentFinalDestination
{
  [(SBHomeGestureFinalDestinationSwitcherModifier *)self containerViewBounds];
  double v68 = v3;
  double v5 = v4;
  double x = self->_translation.x;
  double y = self->_translation.y;
  p_initialTouchLocation = &self->_initialTouchLocation;
  double v10 = self->_initialTouchLocation.x;
  double v9 = self->_initialTouchLocation.y;
  uint64_t v11 = [(SBHomeGestureFinalDestinationSwitcherModifier *)self switcherInterfaceOrientation];
  double adaptiveMinimumYVelocityForHome = self->_adaptiveMinimumYVelocityForHome;
  if (self->_scrunchInitiated)
  {
    BOOL v13 = 0;
    double v14 = self->_velocity.y;
  }
  else
  {
    if (adaptiveMinimumYVelocityForHome <= *(double *)&kVelocityYThresholdForUnconditionalHome) {
      double v15 = self->_adaptiveMinimumYVelocityForHome;
    }
    else {
      double v15 = *(double *)&kVelocityYThresholdForUnconditionalHome;
    }
    double v14 = self->_velocity.y;
    BOOL v13 = v14 < v15;
  }
  p_velocitdouble y = &self->_velocity;
  BOOL v17 = v14 < adaptiveMinimumYVelocityForHome
     && v14 < -(self->_adaptiveVelocitySlopeThresholdForArc * fabs(p_velocity->x));
  BOOL v18 = [(SBHomeGestureFinalDestinationSwitcherModifier *)self _isTranslationPastDistanceThresholdToUnconditionallyGoHome:y];
  double v19 = self->_velocity.y;
  double v20 = fabs(p_velocity->x);
  double v21 = fabs(v19);
  BOOL v22 = v20 > *(double *)&kVelocityXThresholdForUnconditionalArcSwipe_0
     && v21 < v20 * self->_adaptiveVelocitySlopeThresholdForArc;
  if ((unint64_t)(v11 - 3) >= 2) {
    v23 = &kMinimumXDistanceToTriggerArcByDistancePortrait;
  }
  else {
    v23 = &kMinimumXDistanceToTriggerArcByDistanceLandscape;
  }
  double v24 = *(double *)v23;
  double v25 = fabs(y);
  double v26 = *(double *)&kMaximumYDistanceToTriggerArcByDistance;
  double v27 = fabs(x);
  double adaptivePauseVelocityThresholdForAppSwitcher = self->_adaptivePauseVelocityThresholdForAppSwitcher;
  BOOL v29 = v27 > *(double *)v23 && v25 < *(double *)&kMaximumYDistanceToTriggerArcByDistance;
  BOOL v30 = v20 < adaptivePauseVelocityThresholdForAppSwitcher;
  if (v21 >= adaptivePauseVelocityThresholdForAppSwitcher) {
    BOOL v30 = 0;
  }
  if (v19 <= adaptivePauseVelocityThresholdForAppSwitcher)
  {
    BOOL v31 = 0;
  }
  else
  {
    BOOL v31 = v27 < v24;
    if (v20 * *(double *)&kVelocitySlopeThresholdForCurrentLayout > v21) {
      BOOL v31 = 0;
    }
  }
  BOOL v32 = self->_touchType != 1 || self->_scrunchInitiated;
  double v33 = v9 + y;
  if (!v13 && !v17)
  {
    if (v18)
    {
      char v34 = 0;
      finalDestinationReason = self->_finalDestinationReason;
      v36 = @"HomeByDistanceThreshold";
      goto LABEL_33;
    }
    if (v22 && v32)
    {
      if (([(SBHomeGestureFinalDestinationSwitcherModifier *)self isDevicePad] & 1) == 0
        && v33 + v19 * 0.15 <= v5 - *(double *)&kMaximumYDistanceToTriggerArcByFlick
        && v25 >= v26)
      {
        char v34 = 0;
        finalDestinationReason = self->_finalDestinationReason;
        v65 = @"AppSwitcherByHorizontalMotion";
LABEL_97:
        self->_finalDestinationReason = &v65->isa;
        uint64_t v37 = 3;
        goto LABEL_34;
      }
      int v56 = [(SBHomeGestureFinalDestinationSwitcherModifier *)self isRTLEnabled];
      double v57 = p_velocity->x;
      if (v56)
      {
        if (p_velocity->x <= 0.0)
        {
LABEL_67:
          int v58 = [(SBHomeGestureFinalDestinationSwitcherModifier *)self isRTLEnabled];
          double v59 = self->_directionSwitchLocation.x - p_initialTouchLocation->x;
          if (v58) {
            double v59 = -v59;
          }
          finalDestinationReason = self->_finalDestinationReason;
          if (v59 < v68 * -0.25)
          {
            uint64_t v37 = 0;
            v60 = @"CurrentLayoutByRetractingFromBottomSwipeToNextLayout";
LABEL_84:
            self->_finalDestinationReason = &v60->isa;
            char v34 = 1;
            goto LABEL_34;
          }
          v66 = @"NextLayoutByFastBottomSwipe";
LABEL_90:
          self->_finalDestinationReason = &v66->isa;
          char v34 = 1;
          uint64_t v37 = 2;
          goto LABEL_34;
        }
      }
      else if (p_velocity->x >= 0.0)
      {
        goto LABEL_67;
      }
      int v63 = [(SBHomeGestureFinalDestinationSwitcherModifier *)self isRTLEnabled];
      double v64 = self->_directionSwitchLocation.x - p_initialTouchLocation->x;
      if (v63) {
        double v64 = -v64;
      }
      finalDestinationReason = self->_finalDestinationReason;
      if (v64 > v68 * 0.25)
      {
        uint64_t v37 = 0;
        v60 = @"CurrentLayoutByRetractingFromBottomSwipeToPreviousLayout";
        goto LABEL_84;
      }
      v62 = @"PreviousLayoutByFastBottomSwipe";
LABEL_92:
      self->_finalDestinationReason = &v62->isa;
      uint64_t v37 = 1;
      char v34 = 1;
      goto LABEL_34;
    }
    if (v29 && v32)
    {
      if ([(SBHomeGestureFinalDestinationSwitcherModifier *)self isRTLEnabled]) {
        BOOL v61 = x > 0.0;
      }
      else {
        BOOL v61 = x < 0.0;
      }
      finalDestinationReason = self->_finalDestinationReason;
      if (!v61)
      {
        v66 = @"NextLayoutByLowArcOrBottomSwipePastXDistanceThreshold";
        goto LABEL_90;
      }
      v62 = @"PreviousLayoutByLowArcOrBottomSwipePastXDistanceThreshold";
      goto LABEL_92;
    }
    if (v30)
    {
      char v34 = 0;
      finalDestinationReason = self->_finalDestinationReason;
      v65 = @"AppSwitcherByPausing";
      goto LABEL_97;
    }
    if (v31)
    {
      uint64_t v37 = 0;
      finalDestinationReason = self->_finalDestinationReason;
      v67 = @"CurrentLayoutByMovingDownwardWithinSlope";
LABEL_88:
      self->_finalDestinationReason = &v67->isa;
      char v34 = 1;
      goto LABEL_34;
    }
    if (!v32
      || v19 <= *(double *)&kMinimumYVelocityForArcSwipe && v25 >= *(double *)&kMaximumYDistanceToTriggerArcByFlick)
    {
      char v34 = 0;
      finalDestinationReason = self->_finalDestinationReason;
      v65 = @"AppSwitcherByNotFulfillingArcThresholds";
      goto LABEL_97;
    }
    if (v27 < *(double *)&kMinimumXDistanceForFirstArcSwipe && !self->_continuingGesture)
    {
      uint64_t v37 = 0;
      finalDestinationReason = self->_finalDestinationReason;
      v67 = @"CurrentLayoutInsteadOfArcBecauseAtLeastOneGestureNotCompleted?";
      goto LABEL_88;
    }
    if ([(SBHomeGestureFinalDestinationSwitcherModifier *)self isRTLEnabled])
    {
      if (p_velocity->x <= 0.0)
      {
LABEL_102:
        finalDestinationReason = self->_finalDestinationReason;
        self->_finalDestinationReason = (NSString *)@"NextLayoutByArc";
        char v34 = 1;
        uint64_t v37 = 2;
        goto LABEL_34;
      }
    }
    else if (p_velocity->x >= 0.0)
    {
      goto LABEL_102;
    }
    finalDestinationReason = self->_finalDestinationReason;
    self->_finalDestinationReason = (NSString *)@"PreviousLayoutByArc";
    char v34 = 1;
    uint64_t v37 = 1;
    goto LABEL_34;
  }
  char v34 = 0;
  finalDestinationReason = self->_finalDestinationReason;
  v36 = @"HomeByUnconditionalOrVerticalMotionVelocityThreshold";
LABEL_33:
  self->_finalDestinationReason = &v36->isa;
  uint64_t v37 = 4;
LABEL_34:

  BOOL isMouseEvent = self->_isMouseEvent;
  BOOL v39 = [(SBHomeGestureFinalDestinationSwitcherModifier *)self _hasTraveledSufficientDistanceForHomeOrAppSwitcherForMouseEvent:self->_isMouseEvent];
  if ((v34 & 1) == 0 && !v39)
  {
    v40 = self->_finalDestinationReason;
    self->_finalDestinationReason = (NSString *)@"CurrentLayoutByNotTravelingSufficientYDistance";

    uint64_t v37 = 0;
  }
  if (isMouseEvent)
  {
    int64_t startingEnvironmentMode = self->_startingEnvironmentMode;
    if (v37 == 3 && startingEnvironmentMode != 1)
    {
      v42 = self->_finalDestinationReason;
      self->_finalDestinationReason = (NSString *)@"HomeByIndirectMousePanGesture";
      uint64_t v37 = 4;
LABEL_44:

      goto LABEL_45;
    }
    if (v37 == 4 && startingEnvironmentMode == 1)
    {
      v42 = self->_finalDestinationReason;
      self->_finalDestinationReason = (NSString *)@"AppSwitcherByIndirectMousePanGestureOnHomeScreen";
      uint64_t v37 = 3;
      goto LABEL_44;
    }
  }
LABEL_45:
  dockModifier = self->_dockModifier;
  if (dockModifier)
  {
    uint64_t v44 = -[SBHomeGestureDockSwitcherModifier adjustedFinalDestinationForDestination:withTranslation:velocity:](dockModifier, "adjustedFinalDestinationForDestination:withTranslation:velocity:", v37, x, y, self->_velocity.x, self->_velocity.y);
    if (v37 != v44)
    {
      uint64_t v45 = v44;
      v46 = self->_finalDestinationReason;
      self->_finalDestinationReason = (NSString *)@"CurrentLayoutByNotTravelingSufficientYDistanceForDock";

      uint64_t v37 = v45;
    }
  }
  double v47 = x + v10;
  char v48 = self->_startingEnvironmentMode != 2 || v29;
  if ((unint64_t)(v37 - 3) >= 0xFFFFFFFFFFFFFFFELL && (v48 & 1) == 0)
  {
    v49 = self->_finalDestinationReason;
    self->_finalDestinationReason = (NSString *)@"AppSwitcherBecauseAlreadyInAppSwitcher";

    uint64_t v37 = 3;
  }
  int64_t v50 = -[SBHomeGestureFinalDestinationSwitcherModifier _adjustedFinalDestinationAccountingForEdgeDataDistortion:location:](self, "_adjustedFinalDestinationAccountingForEdgeDataDistortion:location:", v37, v47, v33);
  v51 = +[SBSetupManager sharedInstance];
  int v52 = [v51 isInSetupMode];

  if (v52 && v50 != 4)
  {
    v53 = self->_finalDestinationReason;
    self->_finalDestinationReason = (NSString *)@"CurrentLayoutInBuddyBecauseHomeFailed";

    return 0;
  }
  return v50;
}

- (id)studyLogData
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  double v4 = [NSNumber numberWithDouble:self->_adaptiveMinimumYVelocityForHome];
  [v3 setObject:v4 forKeyedSubscript:@"adaptiveMinimumYVelocityForHome"];

  double v5 = [NSNumber numberWithDouble:self->_adaptivePauseVelocityThresholdForAppSwitcher];
  [v3 setObject:v5 forKeyedSubscript:@"adaptiveVelocityAbsForAppSwitcher"];

  CGFloat v6 = [NSNumber numberWithDouble:self->_adaptiveVelocitySlopeThresholdForArc];
  [v3 setObject:v6 forKeyedSubscript:@"adaptiveVelocitySlopeThresholdForArc"];

  return v3;
}

- (id)debugDescription
{
  id v3 = [(SBChainableModifier *)self descriptionBuilderWithMultilinePrefix:&stru_1F3084718];
  id v4 = (id)[v3 appendSuper];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  double v10 = __65__SBHomeGestureFinalDestinationSwitcherModifier_debugDescription__block_invoke;
  uint64_t v11 = &unk_1E6AF5290;
  id v12 = v3;
  BOOL v13 = self;
  id v5 = v3;
  [v5 appendBodySectionWithName:0 multilinePrefix:@"\t" block:&v8];
  CGFloat v6 = objc_msgSend(v5, "build", v8, v9, v10, v11);

  return v6;
}

id __65__SBHomeGestureFinalDestinationSwitcherModifier_debugDescription__block_invoke(uint64_t a1)
{
  id v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendPoint:withName:", @"initialTranslationAdjustment", *(double *)(*(void *)(a1 + 40) + 96), *(double *)(*(void *)(a1 + 40) + 104));
  id v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendPoint:withName:", @"translation", *(double *)(*(void *)(a1 + 40) + 120), *(double *)(*(void *)(a1 + 40) + 128));
  id v4 = (id)objc_msgSend(*(id *)(a1 + 32), "appendPoint:withName:", @"velocity", *(double *)(*(void *)(a1 + 40) + 136), *(double *)(*(void *)(a1 + 40) + 144));
  id v5 = (id)[*(id *)(a1 + 32) appendFloat:@"lastTouchTimestamp" withName:*(double *)(*(void *)(a1 + 40) + 152)];
  id v6 = (id)[*(id *)(a1 + 32) appendFloat:@"lastAverageVelocityYForAcceleration" withName:*(double *)(*(void *)(a1 + 40) + 160)];
  id v7 = (id)objc_msgSend(*(id *)(a1 + 32), "appendPoint:withName:", @"initialTouchLocation", *(double *)(*(void *)(a1 + 40) + 168), *(double *)(*(void *)(a1 + 40) + 176));
  id v8 = (id)objc_msgSend(*(id *)(a1 + 32), "appendPoint:withName:", @"lastTouchLocation", *(double *)(*(void *)(a1 + 40) + 184), *(double *)(*(void *)(a1 + 40) + 192));
  id v9 = (id)objc_msgSend(*(id *)(a1 + 32), "appendPoint:withName:", @"directionSwitchLocation", *(double *)(*(void *)(a1 + 40) + 200), *(double *)(*(void *)(a1 + 40) + 208));
  id v10 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 216) withName:@"movingTowardsNextLayoutState"];
  id v11 = (id)[*(id *)(a1 + 32) appendFloat:@"adaptiveMinimumYVelocityForHome" withName:*(double *)(*(void *)(a1 + 40) + 224)];
  id v12 = (id)[*(id *)(a1 + 32) appendFloat:@"adaptivePauseVelocityThresholdForAppSwitcher" withName:*(double *)(*(void *)(a1 + 40) + 232)];
  id v13 = (id)[*(id *)(a1 + 32) appendFloat:@"adaptiveVelocitySlopeThresholdForArc" withName:*(double *)(*(void *)(a1 + 40) + 240)];
  id v14 = (id)[*(id *)(a1 + 32) appendFloat:@"lastFinalDestination" withName:*(double *)(*(void *)(a1 + 40) + 248)];
  id v15 = (id)[*(id *)(a1 + 32) appendInteger:*(void *)(*(void *)(a1 + 40) + 256) withName:@"edgeRegionSampleCounter"];
  id v16 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 264) withName:@"updateEdgeRegionSampleCounter"];
  id v17 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 296) withName:@"scrunchInitiated"];
  id v18 = (id)[*(id *)(a1 + 32) appendBool:*(void *)(*(void *)(a1 + 40) + 288) == 2 withName:@"startingInAppSwitcher"];
  return (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 297) withName:@"continuingGesture"];
}

- (int64_t)_adjustedFinalDestinationAccountingForEdgeDataDistortion:(int64_t)a3 location:(CGPoint)a4
{
  double x = a4.x;
  [(SBHomeGestureFinalDestinationSwitcherModifier *)self containerViewBounds];
  BOOL v7 = x >= *(double *)&kEdgeDistanceToCorrectGestureFinalDestination;
  if (vabdd_f64(v8, x) < *(double *)&kEdgeDistanceToCorrectGestureFinalDestination) {
    BOOL v7 = 0;
  }
  if ((unint64_t)(a3 - 1) < 2 || v7 || self->_lastFinalDestination != 3.0 || self->_edgeRegionSampleCounter > 10)
  {
    if (self->_updateEdgeRegionSampleCounter) {
      self->_edgeRegionSampleCounter = 0;
    }
  }
  else
  {
    finalDestinationReason = self->_finalDestinationReason;
    self->_finalDestinationReason = (NSString *)@"AppSwitcherBecauseLatchedByEdgeDistortionCompensation";

    if (self->_updateEdgeRegionSampleCounter) {
      ++self->_edgeRegionSampleCounter;
    }
    return 3;
  }
  return a3;
}

- (BOOL)_hasTraveledSufficientDistanceForHomeOrAppSwitcherForMouseEvent:(BOOL)a3
{
  BOOL v3 = a3;
  [(SBHomeGestureFinalDestinationSwitcherModifier *)self containerViewBounds];
  id v6 = &kMinimumYDistanceForHomeOrAppSwitcherForMouseEvent;
  if (!v3) {
    id v6 = &kMinimumYDistanceForHomeOrAppSwitcher_0;
  }
  return self->_lastTouchLocation.y <= v5 - *(double *)v6;
}

- (void)_updateAdaptiveThresholdsForCurrentFinalDestination:(int64_t)a3 velocityAverage:(CGPoint)a4
{
  [(SBHomeGestureDockSwitcherModifier *)self->_dockModifier isCurrentlyTrackingDock];
  BSFloatByLinearlyInterpolatingFloats();
  self->_double adaptiveMinimumYVelocityForHome = v5;
  self->_double adaptivePauseVelocityThresholdForAppSwitcher = fabs(v5);
}

- (BOOL)_isTranslationPastDistanceThresholdToUnconditionallyGoHome:(double)a3
{
  double v3 = -a3;
  [(SBHomeGestureFinalDestinationSwitcherModifier *)self _unconditionalDistanceThresholdForHome];
  return v4 < v3;
}

- (double)_unconditionalDistanceThresholdForHome
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_finalDestinationDelegate);
  [WeakRetained unconditionalDistanceThresholdForHome];
  double v4 = v3;

  return v4;
}

- (void)_applyPrototypeSettings
{
  double v3 = SBMainScreenPointsPerMillimeter();
  id v26 = [(SBHomeGestureFinalDestinationSwitcherModifier *)self homeGestureSettings];
  [v26 pauseVelocityThresholdForAppSwitcher];
  *(double *)&kPauseVelocityThresholdForAppSwitcher_0 = v3 * v4;
  [v26 velocityXThresholdForUnconditionalArcSwipe];
  *(double *)&kVelocityXThresholdForUnconditionalArcSwipe_0 = v3 * v5;
  [v26 maximumYDistanceToTriggerArcByDistance];
  *(double *)&kMaximumYDistanceToTriggerArcByDistance = v3 * v6;
  *(double *)&kMinimumYDistanceForHomeOrAppSwitcher_0 = v3 * self->_minYDistanceForHomeOrSwitcher;
  [v26 minimumYDistanceForHomeOrAppSwitcher];
  *(double *)&kMinimumYDistanceForHomeOrAppSwitcherForMouseEvent = v3 * v7;
  [v26 minimumYDistanceToConsiderAccelerationDip];
  *(double *)&kMinimumYDistanceToConsiderAccelerationDip = v3 * v8;
  [v26 minimumXDistanceForFirstArcSwipe];
  *(double *)&kMinimumXDistanceForFirstArcSwipe = v3 * v9;
  [v26 minimumXDistanceToTriggerArcByDistancePortrait];
  *(double *)&kMinimumXDistanceToTriggerArcByDistancePortrait = v3 * v10;
  [v26 minimumXDistanceToTriggerArcByDistanceLandscape];
  *(double *)&kMinimumXDistanceToTriggerArcByDistanceLandscape = v3 * v11;
  [v26 maximumYDistanceToTriggerArcByFlick];
  *(double *)&kMaximumYDistanceToTriggerArcByFlick = v3 * v12;
  [v26 velocityYThresholdForUnconditionalHome];
  *(double *)&kVelocityYThresholdForUnconditionalHome = v3 * v13;
  [v26 minimumYVelocityForHome];
  *(double *)&kMinimumYVelocityForHome = v3 * v14;
  [v26 minimumYVelocityForArcSwipe];
  *(double *)&kMinimumYVelocityForArcSwipe = v3 * v15;
  [v26 pauseVelocityThresholdForDefiniteAppSwitcher];
  *(double *)&kPauseVelocityThresholdForDefiniteAppSwitcher = v3 * v16;
  [v26 maximumAdaptivePauseVelocityThresholdForAppSwitcher];
  *(double *)&kMaximumAdaptivePauseVelocityThresholdForAppSwitcher = v3 * v17;
  kSnapToMaxVelocityThresholdAfterAccelerationDip = [v26 snapToMaxVelocityThresholdAfterAccelerationDip];
  [v26 maximumAdaptiveVelocityThresholdForDock];
  *(double *)&kMaximumAdaptiveVelocityThresholdForDock = v3 * v18;
  [v26 appSwitcherVelocityThresholdIncreasingRateFraction];
  kAppSwitcherVelocityThresholdIncreasingRateFraction = v19;
  [v26 dockVelocityThresholdIncreasingRateFraction];
  kDockVelocityThresholdIncreasingRateFraction = v20;
  [v26 adaptiveThresholdsDecreasingRateFraction];
  kAdaptiveThresholdsDecreasingRateFraction = v21;
  [v26 velocitySlopeThresholdForBottomSwipeUpArc];
  kVelocitySlopeThresholdForBottomSwipeUpArc = v22;
  [v26 velocitySlopeThresholdForScrunchArc];
  kVelocitySlopeThresholdForScrunchArc = v23;
  [v26 velocitySlopeThresholdForCurrentLayout];
  kVelocitySlopeThresholdForCurrentLayout = v24;
  [v26 edgeDistanceToCorrectGestureFinalDestination];
  *(double *)&kEdgeDistanceToCorrectGestureFinalDestination = v3 * v25;
}

- (NSString)finalDestinationReason
{
  return self->_finalDestinationReason;
}

- (BOOL)hasSeenAccelerationDipForAppSwitcher
{
  return self->_hasSeenAccelerationDipForAppSwitcher;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finalDestinationReason, 0);
  objc_destroyWeak((id *)&self->_finalDestinationDelegate);
  objc_storeStrong((id *)&self->_dockModifier, 0);
}

@end