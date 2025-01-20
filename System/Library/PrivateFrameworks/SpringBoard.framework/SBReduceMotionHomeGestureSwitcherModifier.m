@interface SBReduceMotionHomeGestureSwitcherModifier
- (BOOL)isHomeScreenContentRequired;
- (BOOL)isSwitcherWindowVisible;
- (BOOL)isWallpaperRequiredForSwitcher;
- (BOOL)laysOutNeighboringCards;
- (BOOL)shouldProvideBlur;
- (BOOL)shouldRubberbandFullScreenHomeGrabberView;
- (CGRect)frameForIndex:(unint64_t)a3;
- (SBReduceMotionHomeGestureSwitcherModifier)initWithGestureID:(id)a3 selectedAppLayout:(id)a4 startingEnvironmentMode:(int64_t)a5 scrunchInitiated:(BOOL)a6 continuingGesture:(BOOL)a7 lastGestureWasAnArcSwipe:(BOOL)a8;
- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3;
- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3;
- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5;
- (double)scaleForIndex:(unint64_t)a3;
- (double)unconditionalDistanceThresholdForHome;
- (id)_newDockModifierRequiringVerticalSwipeToTrackDock:(BOOL)a3 startingEnvironmentMode:(int64_t)a4;
- (id)_responseForActivatingFinalDestination:(int64_t)a3;
- (id)_updateForGestureDidBeginWithEvent:(id)a3;
- (id)_updateForGestureDidChangeWithEvent:(id)a3;
- (id)_updateForGestureDidEndWithEvent:(id)a3;
- (id)_updateReduceMotionAxisIfNecessaryWithEvent:(id)a3;
- (id)appLayoutsToCacheFullsizeSnapshots;
- (id)appLayoutsToCacheSnapshots;
- (id)appLayoutsToResignActive;
- (id)handleGestureEvent:(id)a3;
- (id)handleHomeGestureSettingsChangedEvent:(id)a3;
- (id)handleTransitionEvent:(id)a3;
- (id)keyboardSuppressionMode;
- (id)visibleAppLayouts;
- (int64_t)currentFinalDestination;
- (int64_t)homeScreenBackdropBlurType;
- (int64_t)wallpaperStyle;
- (void)_applyPrototypeSettings;
- (void)_updateGestureTranslationAndVelocityWithEvent:(id)a3;
- (void)_updateTranslationAdjustmentForGestureFromHomeScreenIfNeededWithEvent:(id)a3;
- (void)didMoveToParentModifier:(id)a3;
- (void)setLaysOutNeighboringCards:(BOOL)a3;
- (void)setShouldProvideBlur:(BOOL)a3;
@end

@implementation SBReduceMotionHomeGestureSwitcherModifier

- (SBReduceMotionHomeGestureSwitcherModifier)initWithGestureID:(id)a3 selectedAppLayout:(id)a4 startingEnvironmentMode:(int64_t)a5 scrunchInitiated:(BOOL)a6 continuingGesture:(BOOL)a7 lastGestureWasAnArcSwipe:(BOOL)a8
{
  id v15 = a3;
  id v16 = a4;
  if (self->_startingEnvironmentMode == 2)
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2 object:self file:@"SBReduceMotionHomeGestureSwitcherModifier.m" lineNumber:71 description:@"SBReduceMotionHomeGestureSwitcherModifier doesn't gesturing from the app switcher."];
  }
  v25.receiver = self;
  v25.super_class = (Class)SBReduceMotionHomeGestureSwitcherModifier;
  v17 = [(SBGestureSwitcherModifier *)&v25 initWithGestureID:v15];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_selectedAppLayout, a4);
    v18->_startingEnvironmentMode = a5;
    v18->_continuingGesture = a7;
    v18->_lastGestureWasAnArcSwipe = a8;
    v18->_scrunchInitiated = a6;
    v19 = [[SBCoplanarSwitcherModifier alloc] initWithActiveAppLayout:v18->_selectedAppLayout];
    coplanarLayoutModifier = v18->_coplanarLayoutModifier;
    v18->_coplanarLayoutModifier = v19;

    [(SBCoplanarSwitcherModifier *)v18->_coplanarLayoutModifier setSpacingType:0];
    v21 = objc_alloc_init(SBDismissSiriSwitcherModifier);
    dismissSiriModifier = v18->_dismissSiriModifier;
    v18->_dismissSiriModifier = v21;

    [(SBChainableModifier *)v18 addChildModifier:v18->_dismissSiriModifier];
  }

  return v18;
}

- (void)didMoveToParentModifier:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)SBReduceMotionHomeGestureSwitcherModifier;
  -[SBChainableModifier didMoveToParentModifier:](&v16, sel_didMoveToParentModifier_);
  if (a3)
  {
    if ([(SBReduceMotionHomeGestureSwitcherModifier *)self isFloatingDockSupported])BOOL v5 = !self->_scrunchInitiated; {
    else
    }
      BOOL v5 = 0;
    BOOL v6 = self->_continuingGesture && self->_lastGestureWasAnArcSwipe;
    char v7 = !v5;
    if (self->_dockModifier) {
      char v7 = 1;
    }
    if ((v7 & 1) == 0)
    {
      v8 = [(SBReduceMotionHomeGestureSwitcherModifier *)self _newDockModifierRequiringVerticalSwipeToTrackDock:v6 startingEnvironmentMode:self->_startingEnvironmentMode];
      dockModifier = self->_dockModifier;
      self->_dockModifier = v8;

      [(SBChainableModifier *)self addChildModifier:self->_dockModifier];
    }
    if (!self->_finalDestinationModifier)
    {
      if (v5) {
        id v10 = [(SBReduceMotionHomeGestureSwitcherModifier *)self _newDockModifierRequiringVerticalSwipeToTrackDock:v6 startingEnvironmentMode:self->_startingEnvironmentMode];
      }
      else {
        id v10 = 0;
      }
      v11 = [SBHomeGestureFinalDestinationSwitcherModifier alloc];
      v12 = [(SBReduceMotionHomeGestureSwitcherModifier *)self homeGestureSettings];
      [v12 minimumYDistanceForHomeOrAppSwitcher];
      v14 = -[SBHomeGestureFinalDestinationSwitcherModifier initWithDelegate:initialTranslationAdjustment:minYDistanceForHomeOrSwitcher:startingEnvironmentMode:continuingGesture:dockModifier:](v11, "initWithDelegate:initialTranslationAdjustment:minYDistanceForHomeOrSwitcher:startingEnvironmentMode:continuingGesture:dockModifier:", self, self->_startingEnvironmentMode, self->_continuingGesture, v10, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v13);
      finalDestinationModifier = self->_finalDestinationModifier;
      self->_finalDestinationModifier = v14;

      [(SBChainableModifier *)self addChildModifier:self->_finalDestinationModifier];
    }
    [(SBReduceMotionHomeGestureSwitcherModifier *)self _applyPrototypeSettings];
  }
}

- (id)_newDockModifierRequiringVerticalSwipeToTrackDock:(BOOL)a3 startingEnvironmentMode:(int64_t)a4
{
  BOOL v5 = a3;
  char v7 = [SBHomeGestureDockSwitcherModifier alloc];
  return [(SBHomeGestureDockSwitcherModifier *)v7 initWithDelegate:self startingEnvironmentMode:a4 requireVerticalSwipeToTrackDock:v5];
}

- (id)handleHomeGestureSettingsChangedEvent:(id)a3
{
  id v4 = a3;
  [(SBReduceMotionHomeGestureSwitcherModifier *)self _applyPrototypeSettings];
  v7.receiver = self;
  v7.super_class = (Class)SBReduceMotionHomeGestureSwitcherModifier;
  BOOL v5 = [(SBSwitcherModifier *)&v7 handleHomeGestureSettingsChangedEvent:v4];

  return v5;
}

- (id)handleTransitionEvent:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SBReduceMotionHomeGestureSwitcherModifier;
  id v4 = a3;
  BOOL v5 = [(SBGestureSwitcherModifier *)&v8 handleTransitionEvent:v4];
  unint64_t v6 = objc_msgSend(v4, "phase", v8.receiver, v8.super_class);

  if (v6 >= 2) {
    [(SBChainableModifier *)self setState:1];
  }
  return v5;
}

- (id)handleGestureEvent:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBReduceMotionHomeGestureSwitcherModifier;
  unint64_t v6 = [(SBGestureSwitcherModifier *)&v12 handleGestureEvent:v5];
  switch([v5 phase])
  {
    case 0:
      objc_super v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:a2 object:self file:@"SBReduceMotionHomeGestureSwitcherModifier.m" lineNumber:151 description:@"Should not be getting PhasePossible"];

      goto LABEL_3;
    case 1:
      uint64_t v9 = [(SBReduceMotionHomeGestureSwitcherModifier *)self _updateForGestureDidBeginWithEvent:v5];
      goto LABEL_7;
    case 2:
      uint64_t v9 = [(SBReduceMotionHomeGestureSwitcherModifier *)self _updateForGestureDidChangeWithEvent:v5];
      goto LABEL_7;
    case 3:
      uint64_t v9 = [(SBReduceMotionHomeGestureSwitcherModifier *)self _updateForGestureDidEndWithEvent:v5];
LABEL_7:
      objc_super v8 = (void *)v9;
      break;
    default:
LABEL_3:
      objc_super v8 = 0;
      break;
  }
  id v10 = +[SBChainableModifierEventResponse responseByAppendingResponse:v8 toResponse:v6];

  return v10;
}

- (id)_updateForGestureDidBeginWithEvent:(id)a3
{
  id v5 = a3;
  if (self->_gestureHasBegun)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"SBReduceMotionHomeGestureSwitcherModifier.m" lineNumber:168 description:@"Can't begin a gesture that has already begun."];
  }
  if (self->_gestureHasEnded)
  {
    objc_super v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"SBReduceMotionHomeGestureSwitcherModifier.m" lineNumber:169 description:@"Can't begin a gesture that has already ended."];
  }
  self->_gestureHasBegun = 1;
  self->_reduceMotionAxis = 0;
  [v5 locationInContainerView];
  self->_initialTouchLocation.x = v6;
  self->_initialTouchLocation.y = v7;
  self->_lastTouchLocation.x = v6;
  self->_lastTouchLocation.y = v7;
  objc_super v8 = objc_alloc_init(SBSwitcherModifierEventResponse);
  [(SBReduceMotionHomeGestureSwitcherModifier *)self _updateGestureTranslationAndVelocityWithEvent:v5];
  uint64_t v9 = [(SBReduceMotionHomeGestureSwitcherModifier *)self _updateReduceMotionAxisIfNecessaryWithEvent:v5];
  if (v9) {
    [(SBChainableModifierEventResponse *)v8 addChildResponse:v9];
  }

  return v8;
}

- (id)_updateForGestureDidChangeWithEvent:(id)a3
{
  id v5 = a3;
  if (!self->_gestureHasBegun)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"SBReduceMotionHomeGestureSwitcherModifier.m" lineNumber:191 description:@"Can't update a gesture that has not begun."];
  }
  if (self->_gestureHasEnded)
  {
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"SBReduceMotionHomeGestureSwitcherModifier.m" lineNumber:192 description:@"Can't update a gesture that has already ended."];
  }
  [(SBReduceMotionHomeGestureSwitcherModifier *)self _updateGestureTranslationAndVelocityWithEvent:v5];
  CGFloat v6 = objc_alloc_init(SBSwitcherModifierEventResponse);
  CGFloat v7 = [(SBReduceMotionHomeGestureSwitcherModifier *)self _updateReduceMotionAxisIfNecessaryWithEvent:v5];
  if (v7) {
    [(SBChainableModifierEventResponse *)v6 addChildResponse:v7];
  }
  if (self->_reduceMotionAxis == 2)
  {
    int64_t v8 = [(SBHomeGestureFinalDestinationSwitcherModifier *)self->_finalDestinationModifier currentFinalDestination];
    int v9 = BSFloatLessThanFloat();
    int v10 = v9 | [(SBHomeGestureFinalDestinationSwitcherModifier *)self->_finalDestinationModifier hasSeenAccelerationDipForAppSwitcher];
    if (v8 == 3 && v10 != 0)
    {
      self->_endingGestureForAppSwitcher = 1;
      objc_super v12 = objc_alloc_init(SBCompleteGestureSwitcherEventResponse);
      [(SBChainableModifierEventResponse *)v6 addChildResponse:v12];
    }
  }

  return v6;
}

- (id)_updateForGestureDidEndWithEvent:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!self->_gestureHasBegun)
  {
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2 object:self file:@"SBReduceMotionHomeGestureSwitcherModifier.m" lineNumber:222 description:@"Can't end a gesture that has not begun."];
  }
  if (self->_gestureHasEnded)
  {
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2 object:self file:@"SBReduceMotionHomeGestureSwitcherModifier.m" lineNumber:223 description:@"Can't end a gesture that has already ended."];
  }
  self->_gestureHasEnded = 1;
  CGFloat v6 = objc_alloc_init(SBSwitcherModifierEventResponse);
  unint64_t v7 = [(SBHomeGestureFinalDestinationSwitcherModifier *)self->_finalDestinationModifier currentFinalDestination];
  int64_t v8 = [(SBHomeGestureFinalDestinationSwitcherModifier *)self->_finalDestinationModifier finalDestinationReason];
  int v9 = v8;
  unint64_t reduceMotionAxis = self->_reduceMotionAxis;
  if (reduceMotionAxis == 1)
  {
    if (v7 - 3 > 1) {
      goto LABEL_12;
    }
    v11 = @"CurrentLayoutBecauseLockedHorizontallyAndTriedToGoHomeOrAppSwitcher";
    goto LABEL_11;
  }
  if (reduceMotionAxis == 2 && v7 - 1 < 2)
  {
    v11 = @"CurrentLayoutBecauseLockedVerticallyAndTriedToArc";
LABEL_11:

    unint64_t v7 = 0;
    int v9 = v11;
  }
LABEL_12:
  if ([v5 isCanceled])
  {
    if (!self->_endingGestureForAppSwitcher) {
      goto LABEL_23;
    }
    objc_super v12 = (SBActivateHomeButtonSwitcherEventResponse *)v9;
    int v9 = @"EndedGestureForAppSwitcher";
    unint64_t v7 = 3;
    goto LABEL_22;
  }
  if (self->_startingEnvironmentMode == 1 && [(SBAppLayout *)self->_selectedAppLayout type] != 2 && v7 == 4)
  {
    objc_super v12 = objc_alloc_init(SBActivateHomeButtonSwitcherEventResponse);
    [(SBChainableModifierEventResponse *)v6 addChildResponse:v12];
    unint64_t v7 = 4;
LABEL_22:
  }
LABEL_23:
  v14 = SBLogSystemGestureAppSwitcher();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    id v15 = NSStringFromSBHomeGestureFinalDestination(v7);
    *(_DWORD *)buf = 138412802;
    v33 = v15;
    __int16 v34 = 2048;
    unint64_t v35 = v7;
    __int16 v36 = 2112;
    v37 = v9;
    _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_INFO, "Reduce Motion Home Gesture Modifier - Final Response: %@ (%lu), Reason: %@", buf, 0x20u);
  }
  objc_super v16 = [(SBReduceMotionHomeGestureSwitcherModifier *)self _responseForActivatingFinalDestination:v7];
  [(SBChainableModifierEventResponse *)v6 addChildResponse:v16];
  if (v7 - 3 <= 1)
  {
    objc_initWeak((id *)buf, self);
    v17 = [(SBReduceMotionHomeGestureSwitcherModifier *)self switcherSettings];
    v18 = [v17 animationSettings];
    [v18 reduceMotionTriggerDelay];
    double v20 = v19;

    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __78__SBReduceMotionHomeGestureSwitcherModifier__updateForGestureDidEndWithEvent___block_invoke;
    v29[3] = &unk_1E6AF90F0;
    objc_copyWeak(&v30, (id *)buf);
    [v16 setDelay:v29 withValidator:v20];
    objc_destroyWeak(&v30);
    objc_destroyWeak((id *)buf);
  }
  if (v7 == 4)
  {
    v21 = [[SBHapticSwitcherEventResponse alloc] initWithHapticType:2 phase:1];
    -[SBHapticSwitcherEventResponse setHidEventSenderID:](v21, "setHidEventSenderID:", [v5 hidEventSenderID]);
    [(SBChainableModifierEventResponse *)v6 addChildResponse:v21];
  }
  else
  {
    if (v7 != 3) {
      goto LABEL_32;
    }
    v21 = [[SBHapticSwitcherEventResponse alloc] initWithHapticType:0 phase:0];
    v22 = [[SBHapticSwitcherEventResponse alloc] initWithHapticType:0 phase:1];
    -[SBHapticSwitcherEventResponse setHidEventSenderID:](v22, "setHidEventSenderID:", [v5 hidEventSenderID]);
    v23 = [[SBHapticSwitcherEventResponse alloc] initWithHapticType:0 phase:2];
    v31[0] = v21;
    v31[1] = v22;
    v31[2] = v23;
    v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:3];
    [(SBChainableModifierEventResponse *)v6 addChildResponses:v24];
  }
LABEL_32:
  if (self->_didWarmupReduceMotionHaptic)
  {
    self->_didWarmupReduceMotionHaptic = 0;
    objc_super v25 = [[SBHapticSwitcherEventResponse alloc] initWithHapticType:2 phase:2];
    [(SBChainableModifierEventResponse *)v6 addChildResponse:v25];
  }
  return v6;
}

BOOL __78__SBReduceMotionHomeGestureSwitcherModifier__updateForGestureDidEndWithEvent___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained parentModifier];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)_updateGestureTranslationAndVelocityWithEvent:(id)a3
{
  id v16 = a3;
  [v16 translationInContainerView];
  double v5 = v4;
  double v7 = v6;
  [(SBReduceMotionHomeGestureSwitcherModifier *)self _updateTranslationAdjustmentForGestureFromHomeScreenIfNeededWithEvent:v16];
  double v8 = v5 + self->_translationAdjustmentForStartingFromHomeScreen.x;
  double v9 = v7 + self->_translationAdjustmentForStartingFromHomeScreen.y;
  dockModifier = self->_dockModifier;
  if (dockModifier) {
    -[SBHomeGestureDockSwitcherModifier adjustedTranslationForTranslation:](dockModifier, "adjustedTranslationForTranslation:", v8, v9);
  }
  self->_translation.x = v8;
  self->_translation.y = v9;
  [v16 averageTouchVelocityOverTimeDuration:0.0416666667];
  self->_velocity.x = v11;
  self->_velocity.y = v12;
  p_lastTouchLocation = &self->_lastTouchLocation;
  [v16 locationInContainerView];
  p_lastTouchLocation->x = v14;
  p_lastTouchLocation->y = v15;
}

- (void)_updateTranslationAdjustmentForGestureFromHomeScreenIfNeededWithEvent:(id)a3
{
  id v4 = a3;
  if (self->_reduceMotionAxis != 2 && self->_startingEnvironmentMode == 1)
  {
    double x = self->_lastTouchLocation.x;
    id v16 = v4;
    [v4 locationInContainerView];
    double v7 = v6;
    double v8 = v6 - x;
    double v9 = (id *)MEMORY[0x1E4F43630];
    uint64_t v10 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection];
    double v11 = -v8;
    BOOL v12 = v10 == 1;
    id v4 = v16;
    if (!v12) {
      double v11 = v8;
    }
    if (v11 < 0.0)
    {
      double v13 = self->_initialTouchLocation.x - self->_translationAdjustmentForStartingFromHomeScreen.x;
      BOOL v12 = [*v9 userInterfaceLayoutDirection] == 1;
      id v4 = v16;
      BOOL v14 = !v12 || v7 <= v13;
      if (!v14
        || ((v12 = [*v9 userInterfaceLayoutDirection] == 1, id v4 = v16, !v12)
          ? (BOOL v15 = v7 < v13)
          : (BOOL v15 = 0),
            v15))
      {
        self->_translationAdjustmentForStartingFromHomeScreen.double x = self->_translationAdjustmentForStartingFromHomeScreen.x
                                                                - v8;
      }
    }
  }
}

- (int64_t)currentFinalDestination
{
  return [(SBHomeGestureFinalDestinationSwitcherModifier *)self->_finalDestinationModifier currentFinalDestination];
}

- (double)unconditionalDistanceThresholdForHome
{
  return 1.79769313e308;
}

- (id)_responseForActivatingFinalDestination:(int64_t)a3
{
  double v5 = [(SBReduceMotionHomeGestureSwitcherModifier *)self appLayouts];
  double v6 = v5;
  switch(a3)
  {
    case 0:
      double v7 = self->_selectedAppLayout;
      goto LABEL_20;
    case 1:
      uint64_t v8 = [v5 indexOfObject:self->_selectedAppLayout];
      if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_16;
      }
      uint64_t v9 = v8;
      if (![v6 count]) {
        goto LABEL_16;
      }
      if (v9 <= 1) {
        uint64_t v10 = 1;
      }
      else {
        uint64_t v10 = v9;
      }
      uint64_t v11 = v10 - 1;
      goto LABEL_15;
    case 2:
      if (self->_selectedAppLayout)
      {
        uint64_t v12 = objc_msgSend(v5, "indexOfObject:");
        if (v12 == 0x7FFFFFFFFFFFFFFFLL || (uint64_t v13 = v12, ![v6 count]))
        {
LABEL_16:
          BOOL v15 = 0;
          goto LABEL_21;
        }
        uint64_t v14 = [v6 count];
        if (v13 + 1 < v14 - 1) {
          uint64_t v11 = v13 + 1;
        }
        else {
          uint64_t v11 = v14 - 1;
        }
LABEL_15:
        double v7 = [v6 objectAtIndex:v11];
      }
      else
      {
        double v7 = [v5 firstObject];
      }
LABEL_20:
      BOOL v15 = v7;
LABEL_21:
      uint64_t v16 = 0;
LABEL_22:
      v17 = objc_alloc_init(SBMutableSwitcherTransitionRequest);
      [(SBSwitcherTransitionRequest *)v17 setAppLayout:v15];
      [(SBSwitcherTransitionRequest *)v17 setUnlockedEnvironmentMode:v16];
      v18 = [[SBPerformTransitionSwitcherEventResponse alloc] initWithTransitionRequest:v17 gestureInitiated:1];

      return v18;
    case 3:
      BOOL v15 = 0;
      uint64_t v16 = 2;
      goto LABEL_22;
    case 4:
      double v7 = +[SBAppLayout homeScreenAppLayout];
      goto LABEL_20;
    default:
      goto LABEL_16;
  }
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  uint64_t v16 = 0;
  v17 = (double *)&v16;
  uint64_t v18 = 0x4010000000;
  double v19 = &unk_1D90ED3C6;
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  coplanarLayoutModifier = self->_coplanarLayoutModifier;
  long long v20 = *MEMORY[0x1E4F1DB28];
  long long v21 = v4;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __59__SBReduceMotionHomeGestureSwitcherModifier_frameForIndex___block_invoke;
  v15[3] = &unk_1E6AF6358;
  v15[4] = self;
  v15[5] = &v16;
  v15[6] = a3;
  [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:coplanarLayoutModifier usingBlock:v15];
  double v6 = v17;
  if (self->_reduceMotionAxis == 1)
  {
    double v7 = self->_translation.x + v17[4];
    v17[4] = v7;
  }
  else
  {
    double v7 = v17[4];
  }
  double v8 = v6[5];
  double v9 = v6[6];
  double v10 = v6[7];
  _Block_object_dispose(&v16, 8);
  double v11 = v7;
  double v12 = v8;
  double v13 = v9;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.double x = v11;
  return result;
}

uint64_t __59__SBReduceMotionHomeGestureSwitcherModifier_frameForIndex___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 120) frameForIndex:a1[6]];
  BOOL v3 = *(void **)(a1[5] + 8);
  v3[4] = v4;
  v3[5] = v5;
  v3[6] = v6;
  v3[7] = v7;
  return result;
}

- (double)scaleForIndex:(unint64_t)a3
{
  double result = 1.0;
  if (!self->_laysOutNeighboringCards)
  {
    v4.receiver = self;
    v4.super_class = (Class)SBReduceMotionHomeGestureSwitcherModifier;
    -[SBReduceMotionHomeGestureSwitcherModifier scaleForIndex:](&v4, sel_scaleForIndex_, a3, 1.0);
  }
  return result;
}

- (id)visibleAppLayouts
{
  if (self->_reduceMotionAxis == 1)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    selectedAppLayout = self->_selectedAppLayout;
    uint64_t v5 = [(SBReduceMotionHomeGestureSwitcherModifier *)self appLayouts];
    uint64_t v6 = v5;
    if (selectedAppLayout)
    {
      uint64_t v7 = [v5 indexOfObject:self->_selectedAppLayout];
      uint64_t v8 = v7;
      if (v7 <= 1) {
        uint64_t v9 = 1;
      }
      else {
        uint64_t v9 = v7;
      }
      unint64_t v10 = v7 + 1;
      unint64_t v11 = [v6 count] - 1;
      if (v10 < v11) {
        unint64_t v11 = v8 + 1;
      }
      double v12 = objc_msgSend(v6, "subarrayWithRange:", v9 - 1, v11 - v9 + 2);
      [v3 addObjectsFromArray:v12];
    }
    else
    {
      uint64_t v13 = [v5 firstObject];

      if (v13) {
        [v3 addObject:v13];
      }
      uint64_t v6 = (void *)v13;
    }
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)SBReduceMotionHomeGestureSwitcherModifier;
    id v3 = [(SBReduceMotionHomeGestureSwitcherModifier *)&v15 visibleAppLayouts];
  }
  return v3;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  return 1.0;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  if (self->_laysOutNeighboringCards)
  {
    [(SBReduceMotionHomeGestureSwitcherModifier *)self displayCornerRadius];
    SBRectCornerRadiiForRadius();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBReduceMotionHomeGestureSwitcherModifier;
    [(SBReduceMotionHomeGestureSwitcherModifier *)&v7 cornerRadiiForIndex:a3];
  }
  result.topRight = v6;
  result.bottomRight = v5;
  result.bottomLeft = v4;
  result.topLeft = v3;
  return result;
}

- (int64_t)homeScreenBackdropBlurType
{
  if (self->_shouldProvideBlur)
  {
    if (self->_reduceMotionAxis == 1) {
      return 2;
    }
    else {
      return 1;
    }
  }
  else
  {
    v3.receiver = self;
    v3.super_class = (Class)SBReduceMotionHomeGestureSwitcherModifier;
    return [(SBReduceMotionHomeGestureSwitcherModifier *)&v3 homeScreenBackdropBlurType];
  }
}

- (BOOL)isWallpaperRequiredForSwitcher
{
  return 1;
}

- (int64_t)wallpaperStyle
{
  return 1;
}

- (BOOL)isHomeScreenContentRequired
{
  return self->_reduceMotionAxis == 1;
}

- (BOOL)isSwitcherWindowVisible
{
  return 1;
}

- (id)appLayoutsToCacheSnapshots
{
  objc_super v3 = [(SBReduceMotionHomeGestureSwitcherModifier *)self appLayouts];
  if ([v3 count])
  {
    if (self->_selectedAppLayout)
    {
      double v4 = [(SBReduceMotionHomeGestureSwitcherModifier *)self appLayouts];
      uint64_t v5 = [v4 indexOfObject:self->_selectedAppLayout];
    }
    else
    {
      uint64_t v5 = 0;
    }
    objc_super v7 = [(SBReduceMotionHomeGestureSwitcherModifier *)self switcherSettings];
    uint64_t v8 = [v7 numberOfSnapshotsToAlwaysKeepAround];
    if (!v8) {
      uint64_t v8 = [v7 numberOfSnapshotsToCacheInSwitcher];
    }
    double v6 = -[SBSwitcherModifier appLayoutsToCacheSnapshotsWithVisibleRange:numberOfSnapshotsToCache:biasForward:](self, "appLayoutsToCacheSnapshotsWithVisibleRange:numberOfSnapshotsToCache:biasForward:", v5, 1, v8, 1);
  }
  else
  {
    double v6 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v6;
}

- (id)appLayoutsToCacheFullsizeSnapshots
{
  objc_super v3 = [(SBReduceMotionHomeGestureSwitcherModifier *)self appLayouts];
  if (self->_selectedAppLayout)
  {
    double v4 = [(SBReduceMotionHomeGestureSwitcherModifier *)self appLayouts];
    NSUInteger v5 = [v4 indexOfObject:self->_selectedAppLayout];

    if (v5)
    {
      --v5;
      NSUInteger v6 = 3;
    }
    else
    {
      NSUInteger v6 = 2;
    }
  }
  else
  {
    NSUInteger v5 = 0;
    NSUInteger v6 = 1;
  }
  v12.length = [v3 count];
  v11.location = v5;
  v11.length = v6;
  v12.location = 0;
  NSRange v7 = NSIntersectionRange(v11, v12);
  uint64_t v8 = objc_msgSend(v3, "subarrayWithRange:", v7.location, v7.length);

  return v8;
}

- (id)appLayoutsToResignActive
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ([(SBHomeGestureDockSwitcherModifier *)self->_dockModifier isCurrentlyTrackingDock])
  {
    v20.receiver = self;
    v20.super_class = (Class)SBReduceMotionHomeGestureSwitcherModifier;
    objc_super v3 = [(SBReduceMotionHomeGestureSwitcherModifier *)&v20 appLayoutsToResignActive];
    double v4 = objc_opt_new();
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    NSUInteger v5 = objc_msgSend(v3, "allValues", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          unint64_t v10 = [*(id *)(*((void *)&v16 + 1) + 8 * i) allObjects];
          [v4 addObjectsFromArray:v10];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v7);
    }

    NSRange v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v4 forKey:&unk_1F334B0C0];
  }
  else
  {
    NSRange v12 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v13 = (void *)MEMORY[0x1E4F1CAD0];
    objc_super v3 = [(SBReduceMotionHomeGestureSwitcherModifier *)self appLayouts];
    double v14 = [v13 setWithArray:v3];
    NSRange v11 = [v12 dictionaryWithObject:v14 forKey:&unk_1F334B0C0];
  }
  return v11;
}

- (id)keyboardSuppressionMode
{
  if ([(SBHomeGestureDockSwitcherModifier *)self->_dockModifier isCurrentlyTrackingDock])
  {
    v5.receiver = self;
    v5.super_class = (Class)SBReduceMotionHomeGestureSwitcherModifier;
    objc_super v3 = [(SBReduceMotionHomeGestureSwitcherModifier *)&v5 keyboardSuppressionMode];
  }
  else
  {
    objc_super v3 = +[SBSwitcherKeyboardSuppressionMode suppressionModeForAllScenes];
  }
  return v3;
}

- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SBReduceMotionHomeGestureSwitcherModifier;
  unsigned __int8 v4 = [(SBReduceMotionHomeGestureSwitcherModifier *)&v6 asyncRenderingAttributesForAppLayout:a3];
  if ([(SBHomeGestureDockSwitcherModifier *)self->_dockModifier isCurrentlyTrackingDock]) {
    return (SBSwitcherAsyncRenderingAttributes)257;
  }
  else {
    return (SBSwitcherAsyncRenderingAttributes)(v4 | 0x100);
  }
}

- (BOOL)shouldRubberbandFullScreenHomeGrabberView
{
  return !self->_dockModifier && self->_reduceMotionAxis == 2;
}

- (id)_updateReduceMotionAxisIfNecessaryWithEvent:(id)a3
{
  if (self->_reduceMotionAxis) {
    goto LABEL_11;
  }
  [a3 velocityInContainerView];
  double v6 = v5;
  double v7 = v4;
  BOOL v8 = v5 == *MEMORY[0x1E4F1DAD8] && v4 == *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  if (v8
    || [(SBHomeGestureDockSwitcherModifier *)self->_dockModifier isCurrentlyTrackingDock])
  {
    goto LABEL_11;
  }
  unint64_t v9 = 2;
  if (fabs(v7 / v6) < 0.5) {
    unint64_t v9 = 1;
  }
  self->_unint64_t reduceMotionAxis = v9;
  self->_endingGestureForAppSwitcher = 0;
  if (self->_reduceMotionAxis != 2)
  {
LABEL_11:
    unint64_t v10 = 0;
  }
  else
  {
    self->_didWarmupReduceMotionHaptic = 1;
    unint64_t v10 = [[SBHapticSwitcherEventResponse alloc] initWithHapticType:2 phase:0];
  }
  return v10;
}

- (void)_applyPrototypeSettings
{
  double v3 = SBMainScreenPointsPerMillimeter();
  id v5 = [(SBReduceMotionHomeGestureSwitcherModifier *)self homeGestureSettings];
  [v5 cardFlyInMaximumVelocityThreshold];
  *(double *)&kEndGestureForAppSwitcherMaximumVelocityThreshold = v3 * v4;
}

- (BOOL)shouldProvideBlur
{
  return self->_shouldProvideBlur;
}

- (void)setShouldProvideBlur:(BOOL)a3
{
  self->_shouldProvideBlur = a3;
}

- (BOOL)laysOutNeighboringCards
{
  return self->_laysOutNeighboringCards;
}

- (void)setLaysOutNeighboringCards:(BOOL)a3
{
  self->_laysOutNeighboringCards = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedAppLayout, 0);
  objc_storeStrong((id *)&self->_dismissSiriModifier, 0);
  objc_storeStrong((id *)&self->_finalDestinationModifier, 0);
  objc_storeStrong((id *)&self->_dockModifier, 0);
  objc_storeStrong((id *)&self->_coplanarLayoutModifier, 0);
}

@end