@interface SBHomeGestureSwitcherModifier
- (BOOL)_hasPausedEnoughForFlyIn;
- (BOOL)_hasTraveledSufficientDistanceForHomeOrAppSwitcher;
- (BOOL)_inMultitaskingForLocation:(CGPoint)a3 translation:(CGPoint)a4;
- (BOOL)_isSelectedAppLayoutAtIndex:(unint64_t)a3;
- (BOOL)_isTranslationPastDistanceThresholdToUnconditionallyGoHome:(double)a3;
- (BOOL)_preventPositioningCardsOffscreenForFlatBottomEdgeSwipe;
- (BOOL)_shouldPositionAdjacentCardsOffscreenForFlyIn;
- (BOOL)_shouldResignActiveBasedOnCardScale;
- (BOOL)isContainerStatusBarVisible;
- (BOOL)isContentStatusBarVisibleForIndex:(unint64_t)a3;
- (BOOL)isHitTestBlockingViewVisible;
- (BOOL)isHomeScreenContentRequired;
- (BOOL)isShowingOrAnimatingCardsForFlyIn;
- (BOOL)isSwitcherWindowVisible;
- (BOOL)isWallpaperRequiredForSwitcher;
- (BOOL)laysOutNeighboringCards;
- (BOOL)providesHomeScreenDimmingAlpha;
- (BOOL)shouldPinLayoutRolesToSpace:(unint64_t)a3;
- (CGPoint)_frameOffsetForTranslation:(CGPoint)a3;
- (CGPoint)_rubberbandedTranslationForAdjacentCards;
- (CGPoint)_unadjustedGestureTranslation;
- (CGPoint)liftOffTranslationForGestureEnd;
- (CGPoint)liftOffVelocityForGestureEnd;
- (CGRect)frameForIndex:(unint64_t)a3;
- (NSString)debugDescription;
- (SBHomeGestureSwitcherModifier)initWithGestureID:(id)a3 selectedAppLayout:(id)a4 startingEnvironmentMode:(int64_t)a5 multitaskingModifier:(id)a6 scrunchInitiated:(BOOL)a7 continuingGesture:(BOOL)a8 lastGestureWasAnArcSwipe:(BOOL)a9;
- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3;
- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3;
- (double)_centerYOffsetDuringGesture;
- (double)_coplanarSpacing;
- (double)_distanceYToInSwitcherCardScale;
- (double)_distanceYToMaxTranslation;
- (double)_gestureProgressToMaxTranslationForTranslation:(double)a3;
- (double)_inSwitcherCenterYOffsetWhenPresented;
- (double)_scaleForAdjacentCards;
- (double)_scaleForOffscreenAdjacentCardsForFlyIn;
- (double)_scaleForTranslation:(CGPoint)a3;
- (double)_switcherCardScale;
- (double)dimmingAlphaForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (double)homeScreenAlpha;
- (double)homeScreenBackdropBlurProgress;
- (double)homeScreenDimmingAlpha;
- (double)homeScreenScale;
- (double)lighteningAlphaForIndex:(unint64_t)a3;
- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5;
- (double)scaleForIndex:(unint64_t)a3;
- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4;
- (double)titleAndIconOpacityForIndex:(unint64_t)a3;
- (double)titleOpacityForIndex:(unint64_t)a3;
- (double)unconditionalDistanceThresholdForHome;
- (double)wallpaperOverlayAlphaForIndex:(unint64_t)a3;
- (double)wallpaperScale;
- (id)_cornerRadiusSettings;
- (id)_layoutSettingsForAppLayout:(id)a3 layoutSettings:(id)a4;
- (id)_newDockModifierRequiringVerticalSwipeToTrackDock:(BOOL)a3 startingEnvironmentMode:(int64_t)a4;
- (id)_responseForActivatingFinalDestination:(int64_t)a3;
- (id)_responseForActivatingReachabilityIfNeededWithFinalDestination:(int64_t)a3;
- (id)_responseForCancelingSystemGesturesIfNeededWithFinalDestination:(int64_t)a3;
- (id)_responseForSBEventGestureBeganWithTimeDelta:(double)a3;
- (id)_responseForSBEventGestureEndWithEvent:(id)a3 finalDestination:(int64_t)a4;
- (id)_responseForStudyLogDidBeginGesture;
- (id)_responseForStudyLogDidEndGestureWithEvent:(id)a3 finalDestination:(int64_t)a4 destinationReason:(id)a5;
- (id)_responseForUpdatingIconViewVisibility:(BOOL)a3;
- (id)_responseForUpdatingLayoutForGestureBegan;
- (id)_updateForGestureDidBeginWithEvent:(id)a3;
- (id)_updateForGestureDidChangeWithEvent:(id)a3;
- (id)_updateForGestureDidEndWithEvent:(id)a3;
- (id)_updateInMultitaskingIfNeededWithEvent:(id)a3;
- (id)animationAttributesForLayoutElement:(id)a3;
- (id)appLayoutsToCacheFullsizeSnapshots;
- (id)appLayoutsToCacheSnapshots;
- (id)appLayoutsToResignActive;
- (id)handleGestureEvent:(id)a3;
- (id)handleHomeGestureSettingsChangedEvent:(id)a3;
- (id)handleRemovalEvent:(id)a3;
- (id)handleSwitcherSettingsChangedEvent:(id)a3;
- (id)handleTransitionEvent:(id)a3;
- (id)keyboardSuppressionMode;
- (id)selectedAppLayout;
- (id)visibleAppLayouts;
- (int64_t)currentFinalDestination;
- (int64_t)headerStyleForIndex:(unint64_t)a3;
- (int64_t)homeScreenBackdropBlurType;
- (int64_t)wallpaperStyle;
- (unint64_t)_selectedAppLayoutIndex;
- (void)_applyPrototypeSettings;
- (void)_beginAnimatingMultitaskingPropertyWithMode:(int64_t)a3 settings:(id)a4;
- (void)_displayLinkFired:(id)a3;
- (void)_updateFrameOffsetForXRubberbandingForTranslation:(CGPoint)a3;
- (void)_updateGestureTranslationVelocityAndProgressWithEvent:(id)a3;
- (void)_updateShouldResignActiveWithEvent:(id)a3;
- (void)_updateStackedProgress;
- (void)_updateTranslationAdjustmentForGestureFromHomeScreenIfNeededWithEvent:(id)a3;
- (void)dealloc;
- (void)didMoveToParentModifier:(id)a3;
- (void)setLaysOutNeighboringCards:(BOOL)a3;
- (void)setProvidesHomeScreenDimmingAlpha:(BOOL)a3;
@end

@implementation SBHomeGestureSwitcherModifier

- (SBHomeGestureSwitcherModifier)initWithGestureID:(id)a3 selectedAppLayout:(id)a4 startingEnvironmentMode:(int64_t)a5 multitaskingModifier:(id)a6 scrunchInitiated:(BOOL)a7 continuingGesture:(BOOL)a8 lastGestureWasAnArcSwipe:(BOOL)a9
{
  id v16 = a4;
  id v17 = a6;
  v25.receiver = self;
  v25.super_class = (Class)SBHomeGestureSwitcherModifier;
  v18 = [(SBGestureSwitcherModifier *)&v25 initWithGestureID:a3];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_selectedAppLayout, a4);
    v19->_startingEnvironmentMode = a5;
    v19->_scrunchInitiated = a7;
    v19->_continuingGesture = a8;
    v19->_lastGestureWasAnArcSwipe = a9;
    v19->_laysOutNeighboringCards = 0;
    v19->_providesHomeScreenDimmingAlpha = 1;
    objc_storeStrong((id *)&v19->_multitaskingModifier, a6);
    v20 = [[SBCoplanarSwitcherModifier alloc] initWithActiveAppLayout:v19->_selectedAppLayout];
    coplanarLayoutModifier = v19->_coplanarLayoutModifier;
    v19->_coplanarLayoutModifier = v20;

    [(SBCoplanarSwitcherModifier *)v19->_coplanarLayoutModifier setUsesContainerViewBoundsAsActiveFrame:1];
    [(SBCoplanarSwitcherModifier *)v19->_coplanarLayoutModifier setSpacingType:1];
    v22 = objc_alloc_init(SBDismissSiriSwitcherModifier);
    dismissSiriModifier = v19->_dismissSiriModifier;
    v19->_dismissSiriModifier = v22;

    [(SBChainableModifier *)v19 addChildModifier:v19->_dismissSiriModifier];
  }

  return v19;
}

- (void)dealloc
{
  [(CADisplayLink *)self->_displayLink invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBHomeGestureSwitcherModifier;
  [(SBChainableModifier *)&v3 dealloc];
}

- (void)didMoveToParentModifier:(id)a3
{
  v31.receiver = self;
  v31.super_class = (Class)SBHomeGestureSwitcherModifier;
  -[SBChainableModifier didMoveToParentModifier:](&v31, sel_didMoveToParentModifier_);
  if (!a3)
  {
    [(CADisplayLink *)self->_displayLink invalidate];
    return;
  }
  int v5 = [(SBHomeGestureSwitcherModifier *)self isChamoisWindowingUIEnabled];
  if (v5) {
    char v6 = [(SBHomeGestureSwitcherModifier *)self prefersStripHiddenAndDisabled];
  }
  else {
    char v6 = 1;
  }
  self->_laysOutNeighboringCards = v6;
  int64_t startingEnvironmentMode = self->_startingEnvironmentMode;
  if (startingEnvironmentMode != 1 && (startingEnvironmentMode != 3 || v5 == 0))
  {
    v9 = objc_alloc_init(SBHomeScreenSwitcherModifier);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __57__SBHomeGestureSwitcherModifier_didMoveToParentModifier___block_invoke_2;
    v27[3] = &unk_1E6AF5290;
    v27[4] = self;
    v28 = v9;
    v10 = v9;
    [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:v10 usingBlock:v27];

LABEL_15:
    goto LABEL_16;
  }
  multitaskingModifier = self->_multitaskingModifier;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __57__SBHomeGestureSwitcherModifier_didMoveToParentModifier___block_invoke;
  v30[3] = &unk_1E6AF4AC0;
  v30[4] = self;
  [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:multitaskingModifier usingBlock:v30];
  if (!self->_providesHomeScreenDimmingAlpha)
  {
    v29.receiver = self;
    v29.super_class = (Class)SBHomeGestureSwitcherModifier;
    [(SBHomeGestureSwitcherModifier *)&v29 homeScreenAlpha];
    self->_toHomeScreenAlpha = v12;
    v10 = [(SBHomeGestureSwitcherModifier *)self switcherSettings];
    v13 = [(SBHomeScreenSwitcherModifier *)v10 animationSettings];
    [v13 homeScreenBlurProgressForMode:2];
    self->_toHomeScreenBlurProgress = v14;

    goto LABEL_15;
  }
LABEL_16:
  if ([(SBHomeGestureSwitcherModifier *)self isFloatingDockSupported]) {
    BOOL v15 = !self->_scrunchInitiated;
  }
  else {
    BOOL v15 = 0;
  }
  BOOL v16 = self->_continuingGesture && self->_lastGestureWasAnArcSwipe;
  char v17 = !v15;
  if (self->_dockModifier) {
    char v17 = 1;
  }
  if ((v17 & 1) == 0)
  {
    v18 = [(SBHomeGestureSwitcherModifier *)self _newDockModifierRequiringVerticalSwipeToTrackDock:v16 startingEnvironmentMode:self->_startingEnvironmentMode];
    dockModifier = self->_dockModifier;
    self->_dockModifier = v18;

    [(SBChainableModifier *)self addChildModifier:self->_dockModifier atLevel:0 key:0];
  }
  if (!self->_finalDestinationModifier)
  {
    if (self->_startingEnvironmentMode == 2)
    {
      [(SBHomeGestureSwitcherModifier *)self _distanceYToInSwitcherCardScale];
      self->_translationAdjustmentForStartingFromSwitcher.y = -v20;
    }
    if (v15) {
      id v21 = [(SBHomeGestureSwitcherModifier *)self _newDockModifierRequiringVerticalSwipeToTrackDock:v16 startingEnvironmentMode:self->_startingEnvironmentMode];
    }
    else {
      id v21 = 0;
    }
    v22 = [SBHomeGestureFinalDestinationSwitcherModifier alloc];
    v23 = [(SBHomeGestureSwitcherModifier *)self homeGestureSettings];
    [v23 minimumYDistanceForHomeOrAppSwitcher];
    objc_super v25 = -[SBHomeGestureFinalDestinationSwitcherModifier initWithDelegate:initialTranslationAdjustment:minYDistanceForHomeOrSwitcher:startingEnvironmentMode:continuingGesture:dockModifier:](v22, "initWithDelegate:initialTranslationAdjustment:minYDistanceForHomeOrSwitcher:startingEnvironmentMode:continuingGesture:dockModifier:", self, self->_startingEnvironmentMode, self->_continuingGesture, v21, self->_translationAdjustmentForStartingFromSwitcher.x, self->_translationAdjustmentForStartingFromSwitcher.y, v24);
    finalDestinationModifier = self->_finalDestinationModifier;
    self->_finalDestinationModifier = v25;

    [(SBChainableModifier *)self addChildModifier:self->_finalDestinationModifier atLevel:1 key:0];
  }
  [(SBHomeGestureSwitcherModifier *)self _applyPrototypeSettings];
}

uint64_t __57__SBHomeGestureSwitcherModifier_didMoveToParentModifier___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 496) homeScreenAlpha];
  *(void *)(*(void *)(a1 + 32) + 456) = v2;
  [*(id *)(*(void *)(a1 + 32) + 496) homeScreenBackdropBlurProgress];
  *(void *)(*(void *)(a1 + 32) + 464) = v3;
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 496) homeScreenDimmingAlpha];
  *(void *)(*(void *)(a1 + 32) + 472) = v5;
  return result;
}

uint64_t __57__SBHomeGestureSwitcherModifier_didMoveToParentModifier___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 40) homeScreenAlpha];
  *(void *)(*(void *)(a1 + 32) + 456) = v2;
  [*(id *)(a1 + 40) homeScreenBackdropBlurProgress];
  *(void *)(*(void *)(a1 + 32) + 464) = v3;
  uint64_t result = [*(id *)(a1 + 40) homeScreenDimmingAlpha];
  *(void *)(*(void *)(a1 + 32) + 472) = v5;
  return result;
}

- (id)_newDockModifierRequiringVerticalSwipeToTrackDock:(BOOL)a3 startingEnvironmentMode:(int64_t)a4
{
  BOOL v5 = a3;
  v7 = [SBHomeGestureDockSwitcherModifier alloc];
  return [(SBHomeGestureDockSwitcherModifier *)v7 initWithDelegate:self startingEnvironmentMode:a4 requireVerticalSwipeToTrackDock:v5];
}

- (id)handleHomeGestureSettingsChangedEvent:(id)a3
{
  id v4 = a3;
  [(SBHomeGestureSwitcherModifier *)self _applyPrototypeSettings];
  v7.receiver = self;
  v7.super_class = (Class)SBHomeGestureSwitcherModifier;
  BOOL v5 = [(SBSwitcherModifier *)&v7 handleHomeGestureSettingsChangedEvent:v4];

  return v5;
}

- (id)handleSwitcherSettingsChangedEvent:(id)a3
{
  id v4 = a3;
  [(SBHomeGestureSwitcherModifier *)self _applyPrototypeSettings];
  v7.receiver = self;
  v7.super_class = (Class)SBHomeGestureSwitcherModifier;
  BOOL v5 = [(SBSwitcherModifier *)&v7 handleSwitcherSettingsChangedEvent:v4];

  return v5;
}

- (id)handleTransitionEvent:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SBHomeGestureSwitcherModifier;
  id v4 = a3;
  BOOL v5 = [(SBGestureSwitcherModifier *)&v8 handleTransitionEvent:v4];
  unint64_t v6 = objc_msgSend(v4, "phase", v8.receiver, v8.super_class);

  if (v6 >= 2) {
    [(SBChainableModifier *)self setState:1];
  }
  return v5;
}

- (id)handleRemovalEvent:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBHomeGestureSwitcherModifier;
  BOOL v5 = [(SBSwitcherModifier *)&v10 handleRemovalEvent:v4];
  if ([v4 phase] == 1)
  {
    unint64_t v6 = [v4 appLayout];
    if ([(SBAppLayout *)self->_selectedAppLayout isEqual:v6])
    {
      objc_super v7 = objc_alloc_init(SBCompleteGestureSwitcherEventResponse);
      uint64_t v8 = +[SBChainableModifierEventResponse responseByAppendingResponse:v7 toResponse:v5];

      BOOL v5 = (void *)v8;
    }
  }
  return v5;
}

- (id)handleGestureEvent:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBHomeGestureSwitcherModifier;
  unint64_t v6 = [(SBGestureSwitcherModifier *)&v12 handleGestureEvent:v5];
  switch([v5 phase])
  {
    case 0:
      objc_super v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:a2 object:self file:@"SBHomeGestureSwitcherModifier.m" lineNumber:317 description:@"Should not be getting PhasePossible"];

      goto LABEL_3;
    case 1:
      uint64_t v9 = [(SBHomeGestureSwitcherModifier *)self _updateForGestureDidBeginWithEvent:v5];
      goto LABEL_7;
    case 2:
      uint64_t v9 = [(SBHomeGestureSwitcherModifier *)self _updateForGestureDidChangeWithEvent:v5];
      goto LABEL_7;
    case 3:
      uint64_t v9 = [(SBHomeGestureSwitcherModifier *)self _updateForGestureDidEndWithEvent:v5];
LABEL_7:
      uint64_t v8 = (void *)v9;
      break;
    default:
LABEL_3:
      uint64_t v8 = 0;
      break;
  }
  objc_super v10 = +[SBChainableModifierEventResponse responseByAppendingResponse:v8 toResponse:v6];

  return v10;
}

- (id)_updateForGestureDidBeginWithEvent:(id)a3
{
  id v5 = a3;
  if (self->_gestureHasBegun)
  {
    v38 = [MEMORY[0x1E4F28B00] currentHandler];
    [v38 handleFailureInMethod:a2 object:self file:@"SBHomeGestureSwitcherModifier.m" lineNumber:334 description:@"Can't begin a gesture that has already begun."];
  }
  if (self->_gestureHasEnded)
  {
    v39 = [MEMORY[0x1E4F28B00] currentHandler];
    [v39 handleFailureInMethod:a2 object:self file:@"SBHomeGestureSwitcherModifier.m" lineNumber:335 description:@"Can't begin a gesture that has already ended."];
  }
  self->_gestureHasBegun = 1;
  unint64_t v6 = objc_alloc_init(SBSwitcherModifierEventResponse);
  double v7 = CACurrentMediaTime();
  [v5 lastTouchTimestamp];
  double v9 = v8;
  objc_super v10 = [MEMORY[0x1E4F39B68] displayLinkWithTarget:self selector:sel__displayLinkFired_];
  displayLink = self->_displayLink;
  self->_displayLink = v10;

  objc_super v12 = self->_displayLink;
  v13 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
  [(CADisplayLink *)v12 addToRunLoop:v13 forMode:*MEMORY[0x1E4F1C4B0]];

  BOOL v14 = self->_startingEnvironmentMode == 2;
  self->_inMultitasking = v14;
  double v15 = 0.0;
  if (v14) {
    double v15 = 1.0;
  }
  self->_stackedProgress = v15;
  [(SBHomeGestureSwitcherModifier *)self containerViewBounds];
  double v17 = v16;
  double v19 = v18;
  [v5 locationInContainerView];
  double v21 = v20;
  double v23 = v22;
  UIRectGetCenter();
  self->_touchOffset.x = v21 - v24;
  self->_touchOffset.y = v23 - v25;
  self->_initialTouchLocation.x = v21;
  self->_initialTouchLocation.y = v23;
  self->_lastTouchLocation.x = v21;
  self->_lastTouchLocation.y = v23;
  if (self->_startingEnvironmentMode == 2) {
    self->_initialTouchLocation.y = v19;
  }
  self->_didPlayFlyInHaptic = self->_inMultitasking;
  [v5 translationInContainerView];
  double v27 = v26;
  [v5 hysteresis];
  self->_everTranslatedUpwards = v27 < -v28;
  self->_centroidAdjustment = (CGPoint)*MEMORY[0x1E4F1DAD8];
  if (self->_scrunchInitiated)
  {
    id v29 = v5;
    if ([v29 touchType] == 1)
    {
      [v29 initialCentroid];
      self->_centroidAdjustment.x = v17 * 0.5 - v30;
      self->_centroidAdjustment.y = v19 * 0.5 - v31;
    }
  }
  [(SBHomeGestureSwitcherModifier *)self _updateGestureTranslationVelocityAndProgressWithEvent:v5];
  [(SBHomeGestureSwitcherModifier *)self _updateShouldResignActiveWithEvent:v5];
  [(SBHomeGestureSwitcherModifier *)self _updateStackedProgress];
  v32 = [(SBHomeGestureSwitcherModifier *)self _responseForUpdatingLayoutForGestureBegan];
  [(SBChainableModifierEventResponse *)v6 addChildResponse:v32];
  v33 = [(SBHomeGestureSwitcherModifier *)self _responseForUpdatingIconViewVisibility:0];
  if (v33) {
    [(SBChainableModifierEventResponse *)v6 addChildResponse:v33];
  }
  double v34 = v7 - v9;
  v35 = [(SBHomeGestureSwitcherModifier *)self _responseForStudyLogDidBeginGesture];
  if (v35) {
    [(SBChainableModifierEventResponse *)v6 addChildResponse:v35];
  }
  v36 = [(SBHomeGestureSwitcherModifier *)self _responseForSBEventGestureBeganWithTimeDelta:v34];
  if (v36) {
    [(SBChainableModifierEventResponse *)v6 addChildResponse:v36];
  }

  return v6;
}

- (id)_updateForGestureDidChangeWithEvent:(id)a3
{
  id v5 = a3;
  if (!self->_gestureHasBegun)
  {
    double v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"SBHomeGestureSwitcherModifier.m" lineNumber:405 description:@"Can't update a gesture that has not begun."];
  }
  if (self->_gestureHasEnded)
  {
    double v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2 object:self file:@"SBHomeGestureSwitcherModifier.m" lineNumber:406 description:@"Can't update a gesture that has already ended."];
  }
  [(SBHomeGestureSwitcherModifier *)self _updateGestureTranslationVelocityAndProgressWithEvent:v5];
  [(SBHomeGestureSwitcherModifier *)self _updateShouldResignActiveWithEvent:v5];
  [(SBHomeGestureSwitcherModifier *)self _updateStackedProgress];
  [(SBHomeGestureSwitcherModifier *)self _unadjustedGestureTranslation];
  double v7 = v6;
  if ([(SBHomeGestureSwitcherModifier *)self _isTranslationPastDistanceThresholdToUnconditionallyGoHome:v6])
  {
    self->_gestureHoldTimer = 0;
  }
  double v8 = objc_alloc_init(SBSwitcherModifierEventResponse);
  [v5 locationInContainerView];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  v13 = [(SBHomeGestureSwitcherModifier *)self _updateInMultitaskingIfNeededWithEvent:v5];
  if (v13) {
    [(SBChainableModifierEventResponse *)v8 addChildResponse:v13];
  }
  if ((BSFloatIsZero() & 1) == 0) {
    [(SBCoplanarSwitcherModifier *)self->_coplanarLayoutModifier setSpacingType:0];
  }
  coplanarLayoutModifier = self->_coplanarLayoutModifier;
  [(SBHomeGestureSwitcherModifier *)self _scaleForAdjacentCards];
  -[SBCoplanarSwitcherModifier setScale:](coplanarLayoutModifier, "setScale:");
  -[SBHomeGestureSwitcherModifier _updateFrameOffsetForXRubberbandingForTranslation:](self, "_updateFrameOffsetForXRubberbandingForTranslation:", self->_translation.x, self->_translation.y);
  self->_lastTouchLocation.x = v10;
  self->_lastTouchLocation.y = v12;
  if (!self->_everTranslatedUpwards) {
    self->_everTranslatedUpwards = v7 < 0.0;
  }
  if (self->_startingEnvironmentMode == 1)
  {
    double v15 = [(SBHomeGestureSwitcherModifier *)self appLayouts];
    if (![(SBCompleteGestureSwitcherEventResponse *)v15 count])
    {
      BOOL inMultitasking = self->_inMultitasking;

      if (!inMultitasking) {
        goto LABEL_18;
      }
      self->_cancelledGestureForEmptySwitcher = 1;
      double v15 = objc_alloc_init(SBCompleteGestureSwitcherEventResponse);
      [(SBChainableModifierEventResponse *)v8 addChildResponse:v15];
    }
  }
LABEL_18:

  return v8;
}

- (id)_updateForGestureDidEndWithEvent:(id)a3
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!self->_gestureHasBegun)
  {
    v63 = [MEMORY[0x1E4F28B00] currentHandler];
    [v63 handleFailureInMethod:a2 object:self file:@"SBHomeGestureSwitcherModifier.m" lineNumber:451 description:@"Can't end a gesture that has not begun."];
  }
  if (self->_gestureHasEnded)
  {
    v64 = [MEMORY[0x1E4F28B00] currentHandler];
    [v64 handleFailureInMethod:a2 object:self file:@"SBHomeGestureSwitcherModifier.m" lineNumber:452 description:@"Can't end a gesture that has already ended."];
  }
  self->_gestureHasEnded = 1;
  [(SBHomeGestureSwitcherModifier *)self _updateGestureTranslationVelocityAndProgressWithEvent:v5];
  [(SBHomeGestureSwitcherModifier *)self _updateShouldResignActiveWithEvent:v5];
  [(CADisplayLink *)self->_displayLink invalidate];
  displayLink = self->_displayLink;
  self->_displayLink = 0;

  self->_gestureLiftOffVelocity = self->_velocity;
  self->_gestureLiftOffTranslation = self->_translation;
  [v5 locationInContainerView];
  self->_lastTouchLocation.x = v7;
  self->_lastTouchLocation.y = v8;
  unint64_t v9 = [(SBHomeGestureFinalDestinationSwitcherModifier *)self->_finalDestinationModifier currentFinalDestination];
  CGFloat v10 = [(SBHomeGestureFinalDestinationSwitcherModifier *)self->_finalDestinationModifier finalDestinationReason];
  double v11 = objc_alloc_init(SBSwitcherModifierEventResponse);
  if (v9 == 3 && !self->_didPlayFlyInHaptic)
  {
    CGFloat v12 = [(SBHomeGestureSwitcherModifier *)self appLayouts];
    uint64_t v13 = [v12 count];

    if (v13)
    {
      self->_didPlayFlyInHaptic = 1;
      BOOL v14 = [[SBHapticSwitcherEventResponse alloc] initWithHapticType:0 phase:1];
      -[SBHapticSwitcherEventResponse setHidEventSenderID:](v14, "setHidEventSenderID:", [v5 hidEventSenderID]);
      [(SBChainableModifierEventResponse *)v11 addChildResponse:v14];
    }
  }
  if (self->_didWarmupFlyInHaptic)
  {
    double v15 = [[SBHapticSwitcherEventResponse alloc] initWithHapticType:0 phase:2];
    [(SBChainableModifierEventResponse *)v11 addChildResponse:v15];
  }
  int v16 = [v5 isCanceled];
  char v17 = v16;
  if (!v16)
  {
    if (self->_startingEnvironmentMode == 1 && v9 == 4)
    {
      if (!self->_inMultitasking
        || (inMultitaskingChangedProperty = self->_inMultitaskingChangedProperty) != 0
        && ([(UIViewFloatAnimatableProperty *)inMultitaskingChangedProperty presentationValue],
            v19 <= 0.2))
      {
        unint64_t v9 = 4;
      }
      else
      {

        CGFloat v10 = @"AppSwitcherBecauseStartingFromHomeScreenAndShowingCards";
        unint64_t v9 = 3;
      }
    }
    uint64_t v21 = [v5 touchType];
    int v22 = [v5 isPointerTouch];
    if (self->_scrunchInitiated) {
      int v23 = 1;
    }
    else {
      int v23 = v22;
    }
    if (v23 != 1 || v21 == 1)
    {
      double v24 = [(SBHomeGestureSwitcherModifier *)self homeGestureSettings];
      double v25 = v24;
      if (v9 == 4 && self->_selectedAppLayout && [v24 injectGestureVelocityForZoomDown])
      {
        [v5 velocityInContainerView];
        double v27 = v26;
        double v29 = v28;
        [(SBHomeGestureSwitcherModifier *)self switcherViewBounds];
        double v31 = v30;
        v32 = [(SBHomeGestureSwitcherModifier *)self homeGestureSettings];
        v33 = [(SBHomeGestureSwitcherModifier *)self currentVelocityValueForVisibleAppLayout:self->_selectedAppLayout key:@"transform"];
        double v34 = v33;
        if (v33)
        {
          [v33 CATransform3DValue];
          CATransform3DGetAffineTransform(&v72, &v73);
          double a = v72.a;
        }
        else
        {
          double a = 0.0;
        }
        [v32 scaleVelocityPercentOfGestureVelocityYDividedByViewHeight];
        double v37 = v29 / v31 * v36;
        v70 = v32;
        if ([v32 onlyInjectVelocityForShortFlicks] && fabs(a / v37) >= 0.15)
        {
          v52 = 0;
        }
        else
        {
          v68 = v34;
          v69 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
          [v32 maximumScaleVelocity];
          long long v79 = 0u;
          long long v80 = 0u;
          long long v77 = 0u;
          long long v78 = 0u;
          long long v75 = 0u;
          long long v76 = 0u;
          memset(buf, 0, sizeof(buf));
          SBVelocityMatrixForUniform2DScaling();
          v38 = [SBInjectVelocitySwitcherEventResponse alloc];
          v71[4] = v77;
          v71[5] = v78;
          v71[6] = v79;
          v71[7] = v80;
          v71[0] = *(_OWORD *)buf;
          v71[1] = *(_OWORD *)&buf[16];
          v71[2] = v75;
          v71[3] = v76;
          v39 = [MEMORY[0x1E4F29238] valueWithCATransform3D:v71];
          v40 = [(SBInjectVelocitySwitcherEventResponse *)v38 initWithVelocity:v39 forKey:@"transform" appLayout:self->_selectedAppLayout];
          [v69 addObject:v40];

          v41 = [(SBHomeGestureSwitcherModifier *)self currentVelocityValueForVisibleAppLayout:self->_selectedAppLayout key:@"position"];
          v65 = v41;
          if (v41)
          {
            objc_msgSend(v41, "CGPointValue", v41);
          }
          else
          {
            double v42 = *MEMORY[0x1E4F1DAD8];
            double v43 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
          }
          double v44 = fabs(v42);
          if (fabs(v27) < v44) {
            double v27 = v42;
          }
          if (fabs(v27) >= v44) {
            double v45 = v29;
          }
          else {
            double v45 = v43;
          }
          objc_msgSend(v70, "positionVelocityXPercentOfGestureVelocityX", v65);
          double v47 = v46 * v27;
          [v70 positionVelocityYPercentOfGestureVelocityY];
          double v49 = v48 * v45;
          v50 = [SBInjectVelocitySwitcherEventResponse alloc];
          v67 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v47, v49);
          v51 = [(SBInjectVelocitySwitcherEventResponse *)v50 initWithVelocity:v67 forKey:@"position" appLayout:self->_selectedAppLayout];
          v52 = v69;
          [v69 addObject:v51];

          double v34 = v68;
        }
        if ([v52 count]) {
          [(SBChainableModifierEventResponse *)v11 addChildResponses:v52];
        }
      }
    }
    if (self->_startingEnvironmentMode != 1 || [(SBAppLayout *)self->_selectedAppLayout type] == 2 || v9 != 4) {
      goto LABEL_59;
    }
    v53 = objc_alloc_init(SBActivateHomeButtonSwitcherEventResponse);
    [(SBChainableModifierEventResponse *)v11 addChildResponse:v53];

LABEL_58:
    unint64_t v9 = 4;
    goto LABEL_59;
  }
  if (self->_cancelledGestureForEmptySwitcher)
  {

    CGFloat v10 = @"CancelledGestureForEmptySwitcher";
LABEL_14:
    unint64_t v9 = 3;
    goto LABEL_59;
  }
  int64_t startingEnvironmentMode = self->_startingEnvironmentMode;
  if (startingEnvironmentMode == 1)
  {

    CGFloat v10 = @"CancelledGestureAndStayingHome";
    goto LABEL_58;
  }
  if (startingEnvironmentMode == 2)
  {

    CGFloat v10 = @"CancelledGestureAndStayingInSwitcher";
    goto LABEL_14;
  }

  unint64_t v9 = 0;
  CGFloat v10 = @"CancelledGestureAndStayingInApplication";
LABEL_59:
  v54 = SBLogSystemGestureAppSwitcher();
  if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
  {
    v55 = NSStringFromSBHomeGestureFinalDestination(v9);
    *(_DWORD *)buf = 138412802;
    *(void *)&buf[4] = v55;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v9;
    *(_WORD *)&buf[22] = 2112;
    *(void *)&buf[24] = v10;
    _os_log_impl(&dword_1D85BA000, v54, OS_LOG_TYPE_INFO, "Home Gesture Modifier - Final Response: %@ (%lu), Reason: %@", buf, 0x20u);
  }
  v56 = [(SBHomeGestureSwitcherModifier *)self _responseForUpdatingIconViewVisibility:1];
  if (v56) {
    [(SBChainableModifierEventResponse *)v11 addChildResponse:v56];
  }
  v57 = [(SBHomeGestureSwitcherModifier *)self _responseForActivatingFinalDestination:v9];
  [(SBChainableModifierEventResponse *)v11 addChildResponse:v57];
  if ((v17 & 1) == 0)
  {
    v58 = [(SBHomeGestureSwitcherModifier *)self _responseForActivatingReachabilityIfNeededWithFinalDestination:v9];
    if (v58) {
      [(SBChainableModifierEventResponse *)v11 addChildResponse:v58];
    }

    v59 = [(SBHomeGestureSwitcherModifier *)self _responseForCancelingSystemGesturesIfNeededWithFinalDestination:v9];
    if (v59) {
      [(SBChainableModifierEventResponse *)v11 addChildResponse:v59];
    }
  }
  v60 = [(SBHomeGestureSwitcherModifier *)self _responseForStudyLogDidEndGestureWithEvent:v5 finalDestination:v9 destinationReason:v10];
  if (v60) {
    [(SBChainableModifierEventResponse *)v11 addChildResponse:v60];
  }
  v61 = [(SBHomeGestureSwitcherModifier *)self _responseForSBEventGestureEndWithEvent:v5 finalDestination:v9];
  if (v61) {
    [(SBChainableModifierEventResponse *)v11 addChildResponse:v61];
  }

  return v11;
}

- (void)_updateFrameOffsetForXRubberbandingForTranslation:(CGPoint)a3
{
  if (self->_inMultitasking || self->_hasTriggeredCardFlyIn)
  {
    double v3 = a3.x - self->_translationXLostToRubberbanding;
  }
  else
  {
    double v3 = a3.x
       - self->_lastTranslationXForRubberbanding
       + -(a3.x - self->_lastTranslationXForRubberbanding - (a3.x - self->_lastTranslationXForRubberbanding) * 0.3)
       * fmin(fmax(-self->_velocity.y, 0.0), 6000.0)
       / 6000.0
       + self->_lastFrameOffsetX;
    self->_lastTranslationXForRubberbanding = a3.x;
  }
  double v4 = v3 + 0.0;
  self->_lastFrameOffsetX = v4;
  self->_translationXLostToRubberbanding = a3.x - v4;
}

- (void)_updateTranslationAdjustmentForGestureFromHomeScreenIfNeededWithEvent:(id)a3
{
  id v4 = a3;
  if (!self->_inMultitasking && self->_startingEnvironmentMode == 1)
  {
    double x = self->_lastTouchLocation.x;
    id v16 = v4;
    [v4 locationInContainerView];
    double v7 = v6;
    double v8 = v6 - x;
    unint64_t v9 = (id *)MEMORY[0x1E4F43630];
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
        || ((BOOL v12 = [*v9 userInterfaceLayoutDirection] == 1, v4 = v16, !v12)
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

- (CGPoint)_unadjustedGestureTranslation
{
  double x = self->_translation.x;
  double y = self->_translation.y;
  dockModifier = self->_dockModifier;
  if (dockModifier) {
    -[SBHomeGestureDockSwitcherModifier translationForAdjustedTranslation:](dockModifier, "translationForAdjustedTranslation:", x, y);
  }
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)_updateGestureTranslationVelocityAndProgressWithEvent:(id)a3
{
  id v33 = a3;
  [v33 translationInContainerView];
  double v5 = v4;
  double v7 = v6;
  [(SBHomeGestureSwitcherModifier *)self _updateTranslationAdjustmentForGestureFromHomeScreenIfNeededWithEvent:v33];
  double v8 = self->_translationAdjustmentForStartingFromSwitcher.y + self->_translationAdjustmentForStartingFromHomeScreen.y;
  double v9 = v5
     + self->_translationAdjustmentForStartingFromSwitcher.x
     + self->_translationAdjustmentForStartingFromHomeScreen.x;
  double v10 = v7 + v8;
  dockModifier = self->_dockModifier;
  if (dockModifier)
  {
    -[SBHomeGestureDockSwitcherModifier adjustedTranslationForTranslation:](dockModifier, "adjustedTranslationForTranslation:", v9, v7 + v8);
    double v9 = v12;
    double v10 = v13;
  }
  [v33 averageTouchVelocityOverTimeDuration:0.0416666667];
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  [(SBHomeGestureSwitcherModifier *)self _distanceYToInSwitcherCardScale];
  double v19 = -v10 / v18;
  [(SBHomeGestureSwitcherModifier *)self _gestureProgressToMaxTranslationForTranslation:v10];
  self->_translation.double x = v9;
  self->_translation.double y = v10;
  self->_velocity.double x = v15;
  self->_velocity.double y = v17;
  self->_progressToInSwitcherCardScale = v19;
  self->_progressToMaxTranslation = v20;
  [v33 lastTouchTimestamp];
  self->_lastTouchTimestamp = v21;
  if (self->_scrunchInitiated)
  {
    id v22 = v33;
    [v22 initialCentroid];
    self->_initialCentroid.double x = v23;
    self->_initialCentroid.double y = v24;
    [v22 centroid];
    self->_centroid.double x = v25;
    self->_centroid.double y = v26;
    self->_initialCentroid = (CGPoint)vaddq_f64((float64x2_t)self->_initialCentroid, (float64x2_t)self->_centroidAdjustment);
    self->_centroid = (CGPoint)vaddq_f64((float64x2_t)self->_centroid, (float64x2_t)self->_centroidAdjustment);
    [v22 absoluteScale];
    self->_absoluteScale = v27;
    p_translationWithoutScale = &self->_translationWithoutScale;
    [v22 translationWithoutScale];
    CGFloat v30 = v29;
    CGFloat v32 = v31;

    p_translationWithoutScale->double x = v30;
    p_translationWithoutScale->double y = v32;
  }
}

- (void)_updateStackedProgress
{
  if (self->_startingEnvironmentMode == 2)
  {
    int v3 = BSFloatLessThanOrEqualToFloat();
    double v4 = self->_progressToInSwitcherCardScale + -1.0;
    if (v3) {
      double v4 = -v4;
    }
    double v5 = v4 / -0.75 + 1.0;
    double v6 = fabs(self->_translation.x) * (0.0 - v5);
    [(SBHomeGestureSwitcherModifier *)self containerViewBounds];
    double v8 = fmin(fmax(v5 + v6 / (v7 * 0.25), 0.0), 1.0);
    if (self->_inMultitasking) {
      double v9 = v8;
    }
    else {
      double v9 = 0.0;
    }
    if (BSFloatIsZero() && !self->_hasBecomeCoplanarSinceGestureFromSwitcherBegan)
    {
      self->_hasBecomeCoplanarSinceGestureFromSwitcherBegan = 1;
      self->_hasTriggeredCardFlyIn = 1;
      self->_translationYWhenTriggeredCardFlyIn = self->_translation.y;
    }
    if (self->_hasBecomeCoplanarSinceGestureFromSwitcherBegan) {
      double v10 = 0.0;
    }
    else {
      double v10 = v9;
    }
    self->_stackedProgress = v10;
  }
}

- (int64_t)currentFinalDestination
{
  return [(SBHomeGestureFinalDestinationSwitcherModifier *)self->_finalDestinationModifier currentFinalDestination];
}

- (double)unconditionalDistanceThresholdForHome
{
  if (self->_startingEnvironmentMode == 1) {
    return 1.79769313e308;
  }
  BOOL scrunchInitiated = self->_scrunchInitiated;
  if (self->_scrunchInitiated) {
    double v5 = 0.4;
  }
  else {
    double v5 = *(double *)&kHomeGestureNormalizedDistanceYThresholdForUnconditionalHome;
  }
  uint64_t v6 = kHomeGestureNormalizedDistanceYThresholdRangeForUnconditionalHome;
  [(SBHomeGestureSwitcherModifier *)self containerViewBounds];
  double result = v5 * v7;
  if (self->_hasTriggeredCardFlyIn)
  {
    double v8 = 0.1;
    if (!scrunchInitiated) {
      double v8 = *(double *)&v6;
    }
    double v9 = result - v8 * v7;
    double result = result + v8 * v7;
    double v10 = 100.0 - self->_translationYWhenTriggeredCardFlyIn;
    if (v9 >= v10) {
      double v10 = v9;
    }
    if (result > v10) {
      double result = v10;
    }
    if (!self->_inMultitasking) {
      return result + -50.0;
    }
  }
  return result;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  uint64_t v30 = 0;
  double v31 = (CGRect *)&v30;
  uint64_t v32 = 0x4010000000;
  id v33 = &unk_1D90ED3C6;
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  coplanarLayoutModifier = self->_coplanarLayoutModifier;
  long long v34 = *MEMORY[0x1E4F1DB28];
  long long v35 = v5;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __47__SBHomeGestureSwitcherModifier_frameForIndex___block_invoke;
  v29[3] = &unk_1E6AF6358;
  v29[4] = self;
  v29[5] = &v30;
  v29[6] = a3;
  [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:coplanarLayoutModifier usingBlock:v29];
  v28.receiver = self;
  v28.super_class = (Class)SBHomeGestureSwitcherModifier;
  [(SBHomeGestureSwitcherModifier *)&v28 frameForIndex:a3];
  double v8 = v7;
  CGFloat v10 = v9;
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  v31[1].origin.CGFloat y = v9;
  if (BSFloatGreaterThanOrEqualToFloat()) {
    v31[1].origin.CGFloat x = v31[1].origin.x + self->_stackedProgress * (v8 - v31[1].origin.x);
  }
  if ([(SBHomeGestureSwitcherModifier *)self _isSelectedAppLayoutAtIndex:a3])
  {
    -[SBHomeGestureSwitcherModifier _frameOffsetForTranslation:](self, "_frameOffsetForTranslation:", self->_translation.x, self->_translation.y);
LABEL_8:
    CGFloat v17 = v15;
    CGFloat v18 = v16;
    goto LABEL_10;
  }
  CGFloat v17 = *MEMORY[0x1E4F1DAD8];
  CGFloat v18 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  if (!self->_laysOutNeighboringCards)
  {
    p_CGFloat x = &v31->origin.x;
    v31[1].origin.CGFloat x = v8;
    p_x[5] = v10;
    *((void *)p_x + 6) = v12;
    *((void *)p_x + 7) = v14;
    goto LABEL_10;
  }
  if (![(SBHomeGestureSwitcherModifier *)self _shouldPositionAdjacentCardsOffscreenForFlyIn])
  {
    [(SBHomeGestureSwitcherModifier *)self _rubberbandedTranslationForAdjacentCards];
    -[SBHomeGestureSwitcherModifier _frameOffsetForTranslation:](self, "_frameOffsetForTranslation:");
    goto LABEL_8;
  }
LABEL_10:
  CGRect v36 = CGRectOffset(v31[1], v17, v18);
  CGFloat x = v36.origin.x;
  CGFloat y = v36.origin.y;
  CGFloat width = v36.size.width;
  CGFloat height = v36.size.height;
  v31[1] = v36;
  _Block_object_dispose(&v30, 8);
  double v24 = x;
  double v25 = y;
  double v26 = width;
  double v27 = height;
  result.size.CGFloat height = v27;
  result.size.CGFloat width = v26;
  result.origin.CGFloat y = v25;
  result.origin.CGFloat x = v24;
  return result;
}

uint64_t __47__SBHomeGestureSwitcherModifier_frameForIndex___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 504) frameForIndex:a1[6]];
  int v3 = *(void **)(a1[5] + 8);
  v3[4] = v4;
  v3[5] = v5;
  v3[6] = v6;
  v3[7] = v7;
  return result;
}

- (double)scaleForIndex:(unint64_t)a3
{
  if ([(SBHomeGestureSwitcherModifier *)self _isSelectedAppLayoutAtIndex:"_isSelectedAppLayoutAtIndex:"])
  {
    -[SBHomeGestureSwitcherModifier _scaleForTranslation:](self, "_scaleForTranslation:", self->_translation.x, self->_translation.y);
    double v6 = v5;
    if ((BSFloatGreaterThanOrEqualToFloat() & 1) == 0) {
      return v6;
    }
    goto LABEL_9;
  }
  if (self->_laysOutNeighboringCards)
  {
    [(SBHomeGestureSwitcherModifier *)self _scaleForAdjacentCards];
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SBHomeGestureSwitcherModifier;
    [(SBHomeGestureSwitcherModifier *)&v11 scaleForIndex:a3];
  }
  double v6 = v7;
  if ((BSFloatGreaterThanOrEqualToFloat() & 1) != 0 && self->_laysOutNeighboringCards)
  {
LABEL_9:
    v10.receiver = self;
    v10.super_class = (Class)SBHomeGestureSwitcherModifier;
    [(SBHomeGestureSwitcherModifier *)&v10 scaleForIndex:a3];
    [(SBHomeGestureSwitcherModifier *)self _switcherCardScale];
    BSFloatByLinearlyInterpolatingFloats();
    return v8;
  }
  return v6;
}

- (id)visibleAppLayouts
{
  int v3 = +[SBSetupManager sharedInstance];
  int v4 = [v3 isInSetupMode];

  if (v4)
  {
    if (self->_selectedAppLayout) {
      [MEMORY[0x1E4F1CAD0] setWithObjects:0];
    }
    else {
    double v6 = [MEMORY[0x1E4F1CAD0] set];
    }
  }
  else
  {
    v41.receiver = self;
    v41.super_class = (Class)SBHomeGestureSwitcherModifier;
    double v5 = [(SBHomeGestureSwitcherModifier *)&v41 visibleAppLayouts];
    double v6 = (void *)[v5 mutableCopy];

    if (self->_selectedAppLayout) {
      objc_msgSend(v6, "addObject:");
    }
    unint64_t v7 = [(SBHomeGestureSwitcherModifier *)self _selectedAppLayoutIndex];
    if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
      unint64_t v8 = 0;
    }
    else {
      unint64_t v8 = v7;
    }
    CGFloat v9 = [(SBHomeGestureSwitcherModifier *)self appLayouts];
    if ((![(SBHomeGestureDockSwitcherModifier *)self->_dockModifier isCurrentlyTrackingDock]
       || self->_shouldResignActive
       || self->_hasTriggeredCardFlyIn
       || self->_startingEnvironmentMode == 2)
      && [v9 count])
    {
      if (self->_hasTriggeredCardFlyIn || (uint64_t v10 = self->_startingEnvironmentMode != 1, (BSFloatIsZero() & 1) == 0))
      {
        [(SBHomeGestureSwitcherModifier *)self containerViewBounds];
        double v13 = v12;
        double v39 = v12;
        [(SBHomeGestureSwitcherModifier *)self _rubberbandedTranslationForAdjacentCards];
        -[SBHomeGestureSwitcherModifier _scaleForTranslation:](self, "_scaleForTranslation:");
        double v15 = v14;
        [(SBHomeGestureSwitcherModifier *)self _coplanarSpacing];
        double v17 = v15 * v16;
        double v18 = v15 * v16 + v13 * v15;
        [(SBHomeGestureSwitcherModifier *)self frameForIndex:v8];
        CGFloat v20 = v19;
        CGFloat v22 = v21;
        CGFloat v24 = v23;
        CGFloat v26 = v25;
        UIRectGetCenter();
        -[SBHomeGestureSwitcherModifier _scaleForTranslation:](self, "_scaleForTranslation:", self->_translation.x, self->_translation.y);
        CGAffineTransformMakeScale(&v40, v27, v27);
        v43.origin.CGFloat x = v20;
        v43.origin.CGFloat y = v22;
        v43.size.CGFloat width = v24;
        v43.size.CGFloat height = v26;
        CGRectApplyAffineTransform(v43, &v40);
        SBUnintegralizedRectCenteredAboutPoint();
        double v29 = v28 - v17;
        double v31 = v39 - (v28 + v30) - v17;
        if ([(SBHomeGestureSwitcherModifier *)self isRTLEnabled]) {
          double v32 = v31;
        }
        else {
          double v32 = v29;
        }
        uint64_t v10 = vcvtpd_s64_f64(v32 / v18);
        if ([(SBHomeGestureSwitcherModifier *)self isRTLEnabled]) {
          double v33 = v29;
        }
        else {
          double v33 = v31;
        }
        uint64_t v11 = vcvtpd_s64_f64(v33 / v18);
        if (v11 <= 1) {
          uint64_t v11 = 1;
        }
        if (v10 <= 1) {
          uint64_t v10 = 1;
        }
      }
      else
      {
        uint64_t v11 = 1;
      }
      unint64_t v34 = (v8 - v11) & ~((uint64_t)(v8 - v11) >> 63);
      unint64_t v35 = v10 + v8;
      uint64_t v36 = [v9 count];
      if (v35 >= v36 - 1) {
        unint64_t v35 = v36 - 1;
      }
      if (v34 < [v9 count] && (v35 & 0x8000000000000000) == 0)
      {
        double v37 = objc_msgSend(v9, "subarrayWithRange:", v34, v35 - v34 + 1);
        [v6 addObjectsFromArray:v37];
      }
    }
  }
  return v6;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBHomeGestureSwitcherModifier;
  double v5 = [(SBGestureSwitcherModifier *)&v11 animationAttributesForLayoutElement:v4];
  if (![v4 switcherLayoutElementType])
  {
    double v6 = (void *)[v5 mutableCopy];
    unint64_t v7 = [v5 layoutSettings];
    unint64_t v8 = [(SBHomeGestureSwitcherModifier *)self _layoutSettingsForAppLayout:v4 layoutSettings:v7];
    [v6 setLayoutSettings:v8];

    CGFloat v9 = [(SBHomeGestureSwitcherModifier *)self _cornerRadiusSettings];
    [v6 setCornerRadiusSettings:v9];

    double v5 = v6;
  }

  return v5;
}

- (id)_cornerRadiusSettings
{
  uint64_t v2 = [(SBHomeGestureSwitcherModifier *)self switcherSettings];
  int v3 = [v2 animationSettings];
  id v4 = [v3 appToSwitcherCornerRadiusSettings];

  return v4;
}

- (id)_layoutSettingsForAppLayout:(id)a3 layoutSettings:(id)a4
{
  id v6 = a4;
  if ([(SBAppLayout *)self->_selectedAppLayout isEqual:a3])
  {
LABEL_2:
    if (self->_startingEnvironmentMode != 2 || !BSFloatGreaterThanFloat())
    {
      id v9 = v6;
      goto LABEL_17;
    }
    unint64_t v7 = [(SBHomeGestureSwitcherModifier *)self switcherSettings];
    unint64_t v8 = [v7 animationSettings];
    id v9 = [v8 stackedSwitcherTrackingSettings];

    goto LABEL_16;
  }
  if (!self->_inMultitaskingChangedProperty)
  {
    if (!self->_inMultitasking)
    {
      id v9 = objc_alloc_init(MEMORY[0x1E4FA5F08]);
      [v9 setDefaultValues];
      [v9 setTrackingResponse:0.0];
      CAFrameRateRange v26 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
      objc_msgSend(v9, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v26.minimum, *(double *)&v26.maximum, *(double *)&v26.preferred);
      goto LABEL_17;
    }
    goto LABEL_2;
  }
  uint64_t v10 = [(SBHomeGestureSwitcherModifier *)self switcherSettings];
  objc_super v11 = [v10 animationSettings];
  unint64_t v7 = [v11 cardFlyInSettings];

  id v9 = objc_alloc_init(MEMORY[0x1E4FA5F08]);
  [v9 setDefaultValues];
  if (self->_inMultitasking)
  {
    [(UIViewFloatAnimatableProperty *)self->_inMultitaskingChangedProperty presentationValue];
    double v13 = v12;
    double v14 = fabs(self->_translation.x);
    [(SBHomeGestureSwitcherModifier *)self containerViewBounds];
    double v16 = fmax(v14 / v15 + 0.0, 0.0);
    if (v16 >= 1.0) {
      double v17 = 0.0;
    }
    else {
      double v17 = 1.0 - v16;
    }
    double v18 = fmin(fmax(1.0 - (1.0 - v13) * v17, 0.0), 1.0);
  }
  else
  {
    double v18 = 0.0;
  }
  [v6 trackingResponse];
  double v20 = v19;
  [v7 response];
  double v22 = v18 * (v20 - v21);
  [v7 response];
  [v9 setTrackingResponse:v23 + v22];
  [v6 dampingRatio];
  objc_msgSend(v9, "setTrackingDampingRatio:");
  CAFrameRateRange v27 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v9, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v27.minimum, *(double *)&v27.maximum, *(double *)&v27.preferred);
LABEL_16:

LABEL_17:
  return v9;
}

- (BOOL)shouldPinLayoutRolesToSpace:(unint64_t)a3
{
  double v5 = [(SBHomeGestureSwitcherModifier *)self appLayouts];
  id v6 = [v5 objectAtIndex:a3];

  if ([v6 isOrContainsAppLayout:self->_selectedAppLayout])
  {
    BOOL v7 = 1;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBHomeGestureSwitcherModifier;
    BOOL v7 = [(SBHomeGestureSwitcherModifier *)&v9 shouldPinLayoutRolesToSpace:a3];
  }

  return v7;
}

- (CGPoint)_frameOffsetForTranslation:(CGPoint)a3
{
  double y = a3.y;
  double v5 = (double *)MEMORY[0x1E4F1DAD8];
  double v6 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  if (self->_startingEnvironmentMode == 1)
  {
    if (+[SBFloatingDockController isFloatingDockSupported])
    {
      [(SBHomeGestureSwitcherModifier *)self floatingDockHeight];
      double v6 = v7 * -0.5;
      if (self->_scrunchInitiated)
      {
        double v8 = (v6 * 0.25 - v6) * self->_centroid.y;
        [(SBHomeGestureSwitcherModifier *)self containerViewBounds];
        double v6 = v6 + v8 / v9;
      }
    }
  }
  double v10 = *v5;
  if (self->_scrunchInitiated)
  {
    if (self->_startingEnvironmentMode != 1)
    {
      [(SBHomeGestureSwitcherModifier *)self containerViewBounds];
      double v12 = v11;
      double x = self->_initialCentroid.x;
      double v14 = self->_centroid.x;
      double v15 = x - v14;
      CGFloat v17 = (self->_initialCentroid.y - self->_centroid.y) * (vabdd_f64(x, v14) / (v16 * -0.8) + 1.0);
      double v18 = v6 - v17;
      UIRectGetCenter();
      double v20 = v19;
      double v22 = v21;
      -[SBHomeGestureSwitcherModifier _scaleForTranslation:](self, "_scaleForTranslation:", v15, v17);
      double v24 = v23;
      double v10 = v10 - (v20 - self->_initialCentroid.x) * (1.0 - v23);
      double v6 = v18 - (v22 - self->_initialCentroid.y) * (1.0 - v23);
      double v25 = v12 * ((1.0 - v23) * 0.5);
      [(SBHomeGestureSwitcherModifier *)self _centerYOffsetDuringGesture];
      double v27 = v26 * (v24 / self->_homeGestureMinimumCardScale);
      if (v6 > v25 || v6 < v27)
      {
        BSUIConstrainValueToIntervalWithRubberBand();
        double v6 = v29;
      }
    }
  }
  else
  {
    [(SBHomeGestureSwitcherModifier *)self _gestureProgressToMaxTranslationForTranslation:y];
    double v31 = v30;
    if (self->_startingEnvironmentMode == 2 && v30 < 0.0)
    {
      double progressToInSwitcherCardScale = self->_progressToInSwitcherCardScale;
      [(SBHomeGestureSwitcherModifier *)self _inSwitcherCenterYOffsetWhenPresented];
      double v34 = progressToInSwitcherCardScale * (0.0 - v33);
      [(SBHomeGestureSwitcherModifier *)self _inSwitcherCenterYOffsetWhenPresented];
      double v6 = v6 - (v35 + v34);
    }
    else
    {
      [(SBHomeGestureSwitcherModifier *)self _centerYOffsetDuringGesture];
      double v6 = v6 + v31 * v36 + 0.0;
    }
    if (self->_startingEnvironmentMode != 1)
    {
      -[SBHomeGestureSwitcherModifier _scaleForTranslation:](self, "_scaleForTranslation:", self->_translation.x, self->_translation.y);
      double v38 = v37;
      [(SBHomeGestureSwitcherModifier *)self containerViewBounds];
      double v40 = v39;
      double v41 = 1.0;
      if (self->_startingEnvironmentMode == 2) {
        [(SBHomeGestureSwitcherModifier *)self _switcherCardScale];
      }
      double v10 = v10 + (v40 * v41 - v40 * v38) * 0.5 * (self->_touchOffset.x / (v40 * 0.5));
    }
  }
  double v42 = (v10 + self->_lastFrameOffsetX) * self->_homeGestureXOffsetFactor;
  double v43 = v6;
  result.double y = v43;
  result.double x = v42;
  return result;
}

- (double)_scaleForTranslation:(CGPoint)a3
{
  if (self->_scrunchInitiated)
  {
    double x = self->_translationWithoutScale.x;
    double y = self->_translationWithoutScale.y;
    [(SBHomeGestureSwitcherModifier *)self containerViewBounds];
    double v8 = self->_initialCentroid.y;
    if (v8 < v7 * 0.5) {
      double v8 = v7 * 0.5;
    }
    double v9 = (fabs(x) / (v6 * -0.8) + 1.0) * (y * (v7 / v8));
  }
  else
  {
    double v9 = a3.y;
  }
  [(SBHomeGestureSwitcherModifier *)self _gestureProgressToMaxTranslationForTranslation:v9];
  double v11 = v10;
  int64_t startingEnvironmentMode = self->_startingEnvironmentMode;
  if (startingEnvironmentMode == 1)
  {
    [(SBHomeGestureSwitcherModifier *)self _switcherCardScale];
    double homeGestureMinimumCardScale = v13;
  }
  else
  {
    double homeGestureMinimumCardScale = self->_homeGestureMinimumCardScale;
  }
  int64_t v15 = self->_startingEnvironmentMode;
  if (v15 == 2 && v11 < 0.0)
  {
    double progressToInSwitcherCardScale = self->_progressToInSwitcherCardScale;
    [(SBHomeGestureSwitcherModifier *)self _switcherCardScale];
    double v18 = progressToInSwitcherCardScale * (v17 + -1.0) + 1.0;
  }
  else
  {
    double v19 = 1.0;
    if (v15 == 2) {
      [(SBHomeGestureSwitcherModifier *)self _switcherCardScale];
    }
    double v20 = v19 + v11 * (0.0 - v19);
    if (v20 >= 0.0) {
      double v18 = v20;
    }
    else {
      double v18 = 0.0;
    }
  }
  if (self->_scrunchInitiated) {
    double v18 = v18 * self->_absoluteScale;
  }
  if (v18 >= homeGestureMinimumCardScale)
  {
    if (v18 > 1.0)
    {
      BSUIConstrainValueWithRubberBand();
      double v18 = v21 + 1.0;
    }
  }
  else
  {
    BSUIConstrainValueWithRubberBand();
    double v18 = homeGestureMinimumCardScale - v22;
  }
  if (startingEnvironmentMode == 1)
  {
    if (+[SBFloatingDockController isFloatingDockSupported])
    {
      double v23 = [(SBHomeGestureSwitcherModifier *)self switcherSettings];
      [v23 offscreenCardScaleForFlyIn];
    }
    BSUIConstrainValueToIntervalWithRubberBand();
    return v24;
  }
  return v18;
}

- (double)_scaleForAdjacentCards
{
  if ([(SBHomeGestureSwitcherModifier *)self _shouldPositionAdjacentCardsOffscreenForFlyIn])
  {
    [(SBHomeGestureSwitcherModifier *)self _scaleForOffscreenAdjacentCardsForFlyIn];
  }
  else
  {
    [(SBHomeGestureSwitcherModifier *)self _rubberbandedTranslationForAdjacentCards];
    -[SBHomeGestureSwitcherModifier _scaleForTranslation:](self, "_scaleForTranslation:");
  }
  return result;
}

- (double)_scaleForOffscreenAdjacentCardsForFlyIn
{
  int v3 = [(SBHomeGestureSwitcherModifier *)self switcherSettings];
  [v3 offscreenCardScaleForFlyIn];
  double v5 = v4;
  -[SBHomeGestureSwitcherModifier _scaleForTranslation:](self, "_scaleForTranslation:", self->_translation.x, self->_translation.y);
  double v7 = v6;

  if (v5 >= v7) {
    return v5;
  }
  else {
    return v7;
  }
}

- (CGPoint)_rubberbandedTranslationForAdjacentCards
{
  double x = self->_translation.x;
  double y = self->_translation.y;
  if (self->_startingEnvironmentMode != 1)
  {
    [(SBHomeGestureSwitcherModifier *)self unconditionalDistanceThresholdForHome];
    double translationYWhenTriggeredCardFlyIn = self->_translationYWhenTriggeredCardFlyIn;
    if (translationYWhenTriggeredCardFlyIn > 100.0 - v5) {
      double translationYWhenTriggeredCardFlyIn = 100.0 - v5;
    }
    double v7 = y;
    if (y < translationYWhenTriggeredCardFlyIn) {
      double v7 = translationYWhenTriggeredCardFlyIn
    }
         + (1.0
          - ((translationYWhenTriggeredCardFlyIn - y) / (v5 + translationYWhenTriggeredCardFlyIn) * 2.0 + -1.0)
          * ((translationYWhenTriggeredCardFlyIn - y) / (v5 + translationYWhenTriggeredCardFlyIn) * 2.0 + -1.0))
         * -0.25
         * (v5 + translationYWhenTriggeredCardFlyIn);
    [(SBHomeGestureSwitcherModifier *)self containerViewBounds];
    double y = v7 + (y - v7) * fmin(fmax(fabs(x) / (v8 * 0.25) + 0.0, 0.0), 1.0);
  }
  double v9 = x;
  double v10 = y;
  result.double y = v10;
  result.double x = v9;
  return result;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  return 1.0;
}

- (double)dimmingAlphaForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)SBHomeGestureSwitcherModifier;
  [(SBHomeGestureSwitcherModifier *)&v8 dimmingAlphaForLayoutRole:a3 inAppLayout:a4];
  double v6 = v5;
  if (BSFloatIsZero()) {
    return v6 * self->_stackedProgress + 0.0;
  }
  return v6;
}

- (double)wallpaperOverlayAlphaForIndex:(unint64_t)a3
{
  double stackedProgress = self->_stackedProgress;
  v6.receiver = self;
  v6.super_class = (Class)SBHomeGestureSwitcherModifier;
  [(SBHomeGestureSwitcherModifier *)&v6 wallpaperOverlayAlphaForIndex:a3];
  return stackedProgress * v4 + 0.0;
}

- (double)lighteningAlphaForIndex:(unint64_t)a3
{
  double stackedProgress = self->_stackedProgress;
  v6.receiver = self;
  v6.super_class = (Class)SBHomeGestureSwitcherModifier;
  [(SBHomeGestureSwitcherModifier *)&v6 lighteningAlphaForIndex:a3];
  return stackedProgress * v4 + 0.0;
}

- (int64_t)headerStyleForIndex:(unint64_t)a3
{
  if (self->_laysOutNeighboringCards) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SBHomeGestureSwitcherModifier;
  return [(SBHomeGestureSwitcherModifier *)&v4 headerStyleForIndex:a3];
}

- (double)titleAndIconOpacityForIndex:(unint64_t)a3
{
  double result = 0.0;
  if (!self->_laysOutNeighboringCards)
  {
    v4.receiver = self;
    v4.super_class = (Class)SBHomeGestureSwitcherModifier;
    -[SBHomeGestureSwitcherModifier titleAndIconOpacityForIndex:](&v4, sel_titleAndIconOpacityForIndex_, a3, 0.0);
  }
  return result;
}

- (double)titleOpacityForIndex:(unint64_t)a3
{
  return 0.0;
}

- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4
{
  double result = 1.0;
  if (!self->_inMultitasking)
  {
    v5.receiver = self;
    v5.super_class = (Class)SBHomeGestureSwitcherModifier;
    -[SBHomeGestureSwitcherModifier shadowOpacityForLayoutRole:atIndex:](&v5, sel_shadowOpacityForLayoutRole_atIndex_, a3, a4, 1.0);
  }
  return result;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  objc_super v6 = [(SBHomeGestureSwitcherModifier *)self appLayouts];
  double v7 = [v6 objectAtIndex:a3];

  if (([v7 isEqual:self->_selectedAppLayout] & 1) != 0 || self->_laysOutNeighboringCards)
  {
    uint64_t v36 = 0;
    double v37 = (double *)&v36;
    uint64_t v38 = 0x2020000000;
    uint64_t v39 = 0;
    objc_super v8 = [(SBHomeGestureSwitcherModifier *)self switcherSettings];
    [(SBHomeGestureSwitcherModifier *)self displayCornerRadius];
    double v10 = v9;
    [v8 deckSwitcherPageScale];
    double v12 = v11;
    if (__sb__runningInSpringBoard())
    {
      if (SBFEffectiveDeviceClass() == 2) {
        double v13 = 15.0;
      }
      else {
        double v13 = 5.0;
      }
    }
    else
    {
      double v14 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v14 userInterfaceIdiom] == 1) {
        double v13 = 15.0;
      }
      else {
        double v13 = 5.0;
      }
    }
    if (!BSFloatIsZero()) {
      double v13 = v10 * v12;
    }
    if (self->_startingEnvironmentMode == 1)
    {
      multitaskingModifier = self->_multitaskingModifier;
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __53__SBHomeGestureSwitcherModifier_cornerRadiiForIndex___block_invoke;
      v35[3] = &unk_1E6AFBE48;
      v35[4] = &v36;
      *(double *)&v35[5] = v13;
      *(double *)&v35[6] = v12;
      [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:multitaskingModifier usingBlock:v35];
LABEL_29:
      SBRectCornerRadiiForRadius();
      double v20 = v27;
      double v22 = v28;
      double v24 = v29;
      double v26 = v30;

      _Block_object_dispose(&v36, 8);
      goto LABEL_30;
    }
    int v16 = __sb__runningInSpringBoard();
    char v17 = v16;
    if (v16)
    {
      if (SBFEffectiveDeviceClass() != 2) {
        goto LABEL_28;
      }
    }
    else
    {
      int v3 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v3 userInterfaceIdiom] != 1) {
        goto LABEL_27;
      }
    }
    [(SBHomeGestureSwitcherModifier *)self displayCornerRadius];
    if (BSFloatIsZero() && [v8 shouldRoundCornersDuringSwipeUp])
    {
      BOOL v18 = [(SBHomeGestureSwitcherModifier *)self isContentStatusBarVisibleForIndex:a3];
      if ((v17 & 1) == 0) {

      }
      if (!v18)
      {
        v37[3] = v13;
        goto LABEL_29;
      }
LABEL_28:
      v37[3] = v10;
      goto LABEL_29;
    }
    if (v17) {
      goto LABEL_28;
    }
LABEL_27:

    goto LABEL_28;
  }
  v40.receiver = self;
  v40.super_class = (Class)SBHomeGestureSwitcherModifier;
  [(SBHomeGestureSwitcherModifier *)&v40 cornerRadiiForIndex:a3];
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
LABEL_30:

  double v31 = v20;
  double v32 = v22;
  double v33 = v24;
  double v34 = v26;
  result.topRight = v34;
  result.bottomRight = v33;
  result.bottomLeft = v32;
  result.topLeft = v31;
  return result;
}

double __53__SBHomeGestureSwitcherModifier_cornerRadiiForIndex___block_invoke(uint64_t a1)
{
  double result = *(double *)(a1 + 40) / *(double *)(a1 + 48);
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (double)homeScreenAlpha
{
  if (self->_startingEnvironmentMode == 1)
  {
    if (!self->_inMultitasking)
    {
      v11.receiver = self;
      v11.super_class = (Class)SBHomeGestureSwitcherModifier;
      [(SBHomeGestureSwitcherModifier *)&v11 homeScreenAlpha];
      return result;
    }
  }
  else if (![(SBHomeGestureSwitcherModifier *)self homeScreenHasOpenFolder] {
         || [(SBHomeGestureSwitcherModifier *)self homeScreenBackdropBlurType] == 3)
  }
  {
    double progressToMaxTranslation = self->_progressToMaxTranslation;
    toHomeScreenAlphdouble a = self->_toHomeScreenAlpha;
    v10.receiver = self;
    v10.super_class = (Class)SBHomeGestureSwitcherModifier;
    [(SBHomeGestureSwitcherModifier *)&v10 homeScreenAlpha];
    double v7 = progressToMaxTranslation * (toHomeScreenAlpha - v6);
    v9.receiver = self;
    v9.super_class = (Class)SBHomeGestureSwitcherModifier;
    [(SBHomeGestureSwitcherModifier *)&v9 homeScreenAlpha];
    return v7 + v8;
  }
  return self->_toHomeScreenAlpha;
}

- (double)homeScreenScale
{
  v9.receiver = self;
  v9.super_class = (Class)SBHomeGestureSwitcherModifier;
  [(SBHomeGestureSwitcherModifier *)&v9 homeScreenScale];
  if (self->_startingEnvironmentMode == 1)
  {
    double y = self->_translation.y;
    [(SBHomeGestureSwitcherModifier *)self containerViewBounds];
    if (y / (v5 * 0.5) + 1.0 >= 1.0)
    {
      BSUIConstrainValueWithRubberBand();
      double v3 = v7 + 1.0;
    }
    else
    {
      BSUIConstrainValueWithRubberBand();
      double v3 = 1.0 - v6;
    }
  }
  return fmin(fmax(v3, 0.0), 1.1);
}

- (double)wallpaperScale
{
  v9.receiver = self;
  v9.super_class = (Class)SBHomeGestureSwitcherModifier;
  [(SBHomeGestureSwitcherModifier *)&v9 wallpaperScale];
  double v4 = v3;
  if (self->_startingEnvironmentMode == 1 && self->_inMultitasking)
  {
    double v5 = [(SBHomeGestureSwitcherModifier *)self switcherSettings];
    double v6 = [v5 animationSettings];
    [v6 wallpaperScaleInSwitcher];
    double v4 = v7;
  }
  return v4;
}

- (double)homeScreenDimmingAlpha
{
  if (self->_providesHomeScreenDimmingAlpha)
  {
    if (self->_startingEnvironmentMode == 1)
    {
      if (self->_inMultitasking)
      {
        return self->_toHomeScreenDimmingAlpha;
      }
      else
      {
        v12.receiver = self;
        v12.super_class = (Class)SBHomeGestureSwitcherModifier;
        [(SBHomeGestureSwitcherModifier *)&v12 homeScreenDimmingAlpha];
      }
    }
    else
    {
      double progressToMaxTranslation = self->_progressToMaxTranslation;
      toHomeScreenDimmingAlphdouble a = self->_toHomeScreenDimmingAlpha;
      v11.receiver = self;
      v11.super_class = (Class)SBHomeGestureSwitcherModifier;
      [(SBHomeGestureSwitcherModifier *)&v11 homeScreenDimmingAlpha];
      double v7 = progressToMaxTranslation * (toHomeScreenDimmingAlpha - v6);
      v10.receiver = self;
      v10.super_class = (Class)SBHomeGestureSwitcherModifier;
      [(SBHomeGestureSwitcherModifier *)&v10 homeScreenDimmingAlpha];
      double result = v7 + v8;
      if (result < 0.2) {
        return 0.2;
      }
    }
  }
  else
  {
    [(SBHomeGestureSwitcherModifier *)&v9 homeScreenDimmingAlpha];
  }
  return result;
}

- (int64_t)homeScreenBackdropBlurType
{
  if (self->_startingEnvironmentMode == 1
    || ![(SBHomeGestureSwitcherModifier *)self homeScreenHasOpenFolder]
    || SBFEffectiveHomeButtonType() == 2)
  {
    return 3;
  }
  else
  {
    return 2;
  }
}

- (double)homeScreenBackdropBlurProgress
{
  if (self->_startingEnvironmentMode == 1)
  {
    if (self->_inMultitasking)
    {
      double toHomeScreenBlurProgress = self->_toHomeScreenBlurProgress;
    }
    else
    {
      v13.receiver = self;
      v13.super_class = (Class)SBHomeGestureSwitcherModifier;
      [(SBHomeGestureSwitcherModifier *)&v13 homeScreenBackdropBlurProgress];
      double toHomeScreenBlurProgress = v9;
    }
  }
  else
  {
    if ([(SBHomeGestureSwitcherModifier *)self homeScreenHasOpenFolder]
      && [(SBHomeGestureSwitcherModifier *)self homeScreenBackdropBlurType] != 3)
    {
      double toHomeScreenBlurProgress = self->_toHomeScreenBlurProgress;
    }
    else
    {
      double progressToMaxTranslation = self->_progressToMaxTranslation;
      double v5 = self->_toHomeScreenBlurProgress;
      v12.receiver = self;
      v12.super_class = (Class)SBHomeGestureSwitcherModifier;
      [(SBHomeGestureSwitcherModifier *)&v12 homeScreenBackdropBlurProgress];
      double v7 = progressToMaxTranslation * (v5 - v6);
      v11.receiver = self;
      v11.super_class = (Class)SBHomeGestureSwitcherModifier;
      [(SBHomeGestureSwitcherModifier *)&v11 homeScreenBackdropBlurProgress];
      double toHomeScreenBlurProgress = v7 + v8;
    }
    if ((![(SBHomeGestureSwitcherModifier *)self isChamoisWindowingUIEnabled]|| self->_startingEnvironmentMode != 3)&& toHomeScreenBlurProgress < 0.5)
    {
      double toHomeScreenBlurProgress = 0.5;
    }
  }
  return fmin(fmax(toHomeScreenBlurProgress, 0.0), 1.0);
}

- (BOOL)isContainerStatusBarVisible
{
  if (self->_startingEnvironmentMode == 1)
  {
    if (self->_inMultitasking)
    {
      uint64_t v2 = [(SBHomeGestureSwitcherModifier *)self appLayouts];
      BOOL v3 = [v2 count] == 0;
    }
    else
    {
      return 1;
    }
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)SBHomeGestureSwitcherModifier;
    return [(SBHomeGestureSwitcherModifier *)&v5 isContainerStatusBarVisible];
  }
  return v3;
}

- (BOOL)isContentStatusBarVisibleForIndex:(unint64_t)a3
{
  return ![(SBHomeGestureSwitcherModifier *)self _shouldResignActiveBasedOnCardScale];
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
  return 1;
}

- (BOOL)isSwitcherWindowVisible
{
  return 1;
}

- (id)appLayoutsToCacheSnapshots
{
  BOOL v3 = [(SBHomeGestureSwitcherModifier *)self appLayouts];
  if ([v3 count])
  {
    if (self->_selectedAppLayout)
    {
      uint64_t v4 = objc_msgSend(v3, "indexOfObject:");
      if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v5 = 0;
      }
      else {
        uint64_t v5 = v4;
      }
    }
    else
    {
      uint64_t v5 = 0;
    }
    double v7 = [(SBHomeGestureSwitcherModifier *)self switcherSettings];
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
  BOOL v3 = [(SBHomeGestureSwitcherModifier *)self appLayouts];
  if (!self->_selectedAppLayout) {
    goto LABEL_4;
  }
  uint64_t v4 = [(SBHomeGestureSwitcherModifier *)self appLayouts];
  NSUInteger v5 = [v4 indexOfObject:self->_selectedAppLayout];

  if (v5)
  {
    if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    {
LABEL_4:
      NSUInteger v5 = 0;
      NSUInteger v6 = 1;
      goto LABEL_7;
    }
    --v5;
    NSUInteger v6 = 3;
  }
  else
  {
    NSUInteger v6 = 2;
  }
LABEL_7:
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
  if (self->_shouldResignActive)
  {
    uint64_t v2 = (void *)MEMORY[0x1E4F1C9E8];
    BOOL v3 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v4 = [(SBHomeGestureSwitcherModifier *)self appLayouts];
    NSUInteger v5 = [v3 setWithArray:v4];
    NSUInteger v6 = [v2 dictionaryWithObject:v5 forKey:&unk_1F3349B60];
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)SBHomeGestureSwitcherModifier;
    NSRange v7 = [(SBHomeGestureSwitcherModifier *)&v20 appLayoutsToResignActive];
    uint64_t v8 = objc_opt_new();
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    double v9 = objc_msgSend(v7, "allValues", 0);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          double v14 = [*(id *)(*((void *)&v16 + 1) + 8 * i) allObjects];
          [v8 addObjectsFromArray:v14];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v11);
    }

    NSUInteger v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v8 forKey:&unk_1F3349B60];
  }
  return v6;
}

- (id)keyboardSuppressionMode
{
  if (self->_shouldResignActive)
  {
    uint64_t v2 = +[SBSwitcherKeyboardSuppressionMode suppressionModeForAllScenes];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)SBHomeGestureSwitcherModifier;
    uint64_t v2 = [(SBHomeGestureSwitcherModifier *)&v4 keyboardSuppressionMode];
  }
  return v2;
}

- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3
{
  if (self->_shouldResignActive)
  {
    unsigned int v3 = 1;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)SBHomeGestureSwitcherModifier;
    unsigned int v3 = [(SBHomeGestureSwitcherModifier *)&v5 asyncRenderingAttributesForAppLayout:a3] & 1;
  }
  return (SBSwitcherAsyncRenderingAttributes)SBSwitcherAsyncRenderingAttributesMake(v3, 1);
}

- (BOOL)isHitTestBlockingViewVisible
{
  return self->_shouldResignActive;
}

- (CGPoint)liftOffVelocityForGestureEnd
{
  double x = self->_gestureLiftOffVelocity.x;
  double y = self->_gestureLiftOffVelocity.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)liftOffTranslationForGestureEnd
{
  double x = self->_gestureLiftOffTranslation.x;
  double y = self->_gestureLiftOffTranslation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (BOOL)isShowingOrAnimatingCardsForFlyIn
{
  return self->_inMultitasking || self->_inMultitaskingChangedProperty != 0;
}

- (id)selectedAppLayout
{
  return self->_selectedAppLayout;
}

- (NSString)debugDescription
{
  unsigned int v3 = [(SBGestureSwitcherModifier *)self descriptionBuilderWithMultilinePrefix:&stru_1F3084718];
  id v4 = (id)[v3 appendSuper];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __49__SBHomeGestureSwitcherModifier_debugDescription__block_invoke;
  uint64_t v11 = &unk_1E6AF5290;
  id v12 = v3;
  objc_super v13 = self;
  id v5 = v3;
  [v5 appendBodySectionWithName:0 multilinePrefix:@"\t" block:&v8];
  NSUInteger v6 = objc_msgSend(v5, "build", v8, v9, v10, v11);

  return (NSString *)v6;
}

id __49__SBHomeGestureSwitcherModifier_debugDescription__block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 120) withName:@"inMultitasking"];
  id v3 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 128) withName:@"inMultitaskingChangedProperty"];
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = *(void **)(v4 + 128);
  if (v5)
  {
    NSUInteger v6 = *(void **)(a1 + 32);
    [v5 presentationValue];
    id v7 = (id)objc_msgSend(v6, "appendFloat:withName:", @"inMultitaskingChangedProperty.presentationValue");
    uint64_t v4 = *(void *)(a1 + 40);
  }
  id v8 = (id)objc_msgSend(*(id *)(a1 + 32), "appendPoint:withName:", @"touchOffset", *(double *)(v4 + 136), *(double *)(v4 + 144));
  id v9 = (id)[*(id *)(a1 + 32) appendFloat:@"lastFrameOffsetX" withName:*(double *)(*(void *)(a1 + 40) + 152)];
  id v10 = (id)[*(id *)(a1 + 32) appendFloat:@"lastTranslationXForRubberbanding" withName:*(double *)(*(void *)(a1 + 40) + 160)];
  id v11 = (id)[*(id *)(a1 + 32) appendFloat:@"translationXLostToRubberbanding" withName:*(double *)(*(void *)(a1 + 40) + 168)];
  id v12 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 176) withName:@"hasTriggeredCardFlyIn"];
  id v13 = (id)[*(id *)(a1 + 32) appendFloat:@"translationYWhenTriggeredCardFlyIn" withName:*(double *)(*(void *)(a1 + 40) + 184)];
  id v14 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 192) withName:@"hasBecomeCoplanarSinceGestureFromSwitcherBegan"];
  id v15 = (id)objc_msgSend(*(id *)(a1 + 32), "appendPoint:withName:", @"gestureLiftOffVelocity", *(double *)(*(void *)(a1 + 40) + 200), *(double *)(*(void *)(a1 + 40) + 208));
  id v16 = (id)objc_msgSend(*(id *)(a1 + 32), "appendPoint:withName:", @"gestureLiftOffTranslation", *(double *)(*(void *)(a1 + 40) + 216), *(double *)(*(void *)(a1 + 40) + 224));
  id v17 = (id)objc_msgSend(*(id *)(a1 + 32), "appendPoint:withName:", @"translationAdjustmentForStartingFromSwitcher", *(double *)(*(void *)(a1 + 40) + 232), *(double *)(*(void *)(a1 + 40) + 240));
  id v18 = (id)objc_msgSend(*(id *)(a1 + 32), "appendPoint:withName:", @"translationAdjustmentForStartingFromHomeScreen", *(double *)(*(void *)(a1 + 40) + 248), *(double *)(*(void *)(a1 + 40) + 256));
  id v19 = (id)[*(id *)(a1 + 32) appendFloat:@"progressToInSwitcherCardScale" withName:*(double *)(*(void *)(a1 + 40) + 264)];
  id v20 = (id)[*(id *)(a1 + 32) appendFloat:@"progressToMaxTranslation" withName:*(double *)(*(void *)(a1 + 40) + 272)];
  id v21 = (id)objc_msgSend(*(id *)(a1 + 32), "appendPoint:withName:", @"translation", *(double *)(*(void *)(a1 + 40) + 280), *(double *)(*(void *)(a1 + 40) + 288));
  id v22 = (id)objc_msgSend(*(id *)(a1 + 32), "appendPoint:withName:", @"velocity", *(double *)(*(void *)(a1 + 40) + 296), *(double *)(*(void *)(a1 + 40) + 304));
  id v23 = (id)[*(id *)(a1 + 32) appendFloat:@"stackedProgress" withName:*(double *)(*(void *)(a1 + 40) + 312)];
  id v24 = (id)objc_msgSend(*(id *)(a1 + 32), "appendPoint:withName:", @"initialCentroid", *(double *)(*(void *)(a1 + 40) + 320), *(double *)(*(void *)(a1 + 40) + 328));
  id v25 = (id)objc_msgSend(*(id *)(a1 + 32), "appendPoint:withName:", @"centroid", *(double *)(*(void *)(a1 + 40) + 336), *(double *)(*(void *)(a1 + 40) + 344));
  id v26 = (id)[*(id *)(a1 + 32) appendFloat:@"absoluteScale" withName:*(double *)(*(void *)(a1 + 40) + 368)];
  id v27 = (id)objc_msgSend(*(id *)(a1 + 32), "appendPoint:withName:", @"translationWithoutScale", *(double *)(*(void *)(a1 + 40) + 376), *(double *)(*(void *)(a1 + 40) + 384));
  id v28 = (id)[*(id *)(a1 + 32) appendFloat:@"lastTouchTimestamp" withName:*(double *)(*(void *)(a1 + 40) + 400)];
  id v29 = (id)[*(id *)(a1 + 32) appendInteger:*(void *)(*(void *)(a1 + 40) + 408) withName:@"gestureHoldTimer"];
  id v30 = (id)objc_msgSend(*(id *)(a1 + 32), "appendPoint:withName:", @"initialTouchLocation", *(double *)(*(void *)(a1 + 40) + 416), *(double *)(*(void *)(a1 + 40) + 424));
  id v31 = (id)objc_msgSend(*(id *)(a1 + 32), "appendPoint:withName:", @"lastTouchLocation", *(double *)(*(void *)(a1 + 40) + 432), *(double *)(*(void *)(a1 + 40) + 440));
  id v32 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 448) withName:@"everTranslatedUpwards"];
  id v33 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 449) withName:@"cancelledGestureForEmptySwitcher"];
  id v34 = (id)[*(id *)(a1 + 32) appendFloat:@"toHomeScreenAlpha" withName:*(double *)(*(void *)(a1 + 40) + 456)];
  id v35 = (id)[*(id *)(a1 + 32) appendFloat:@"toHomeScreenBlurProgress" withName:*(double *)(*(void *)(a1 + 40) + 464)];
  id v36 = (id)[*(id *)(a1 + 32) appendFloat:@"toHomeScreenDimmingAlpha" withName:*(double *)(*(void *)(a1 + 40) + 472)];
  id v37 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 488) withName:@"didWarmupFlyInHaptic"];
  id v38 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 489) withName:@"didPlayFlyInHaptic"];
  id v39 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 536) withName:@"selectedAppLayout"];
  objc_super v40 = *(void **)(a1 + 32);
  double v41 = SBStringForUnlockedEnvironmentMode(*(void *)(*(void *)(a1 + 40) + 544));
  [v40 appendString:v41 withName:@"startingEnvironmentMode"];

  id v42 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 552) withName:@"scrunchInitiated"];
  id v43 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 553) withName:@"continuingGesture"];
  id v44 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 554) withName:@"lastGestureWasAnArcSwipe"];
  return (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 555) withName:@"shouldResignActive"];
}

- (void)_updateShouldResignActiveWithEvent:(id)a3
{
  if ((unint64_t)[a3 phase] < 2 || !self->_shouldResignActive)
  {
    if ([(SBAppLayout *)self->_selectedAppLayout type])
    {
      self->_shouldResignActive = 1;
    }
    else
    {
      if (self->_gestureHasEnded) {
        self->_shouldResignActive = [(SBHomeGestureFinalDestinationSwitcherModifier *)self->_finalDestinationModifier currentFinalDestination] != 0;
      }
      dockModifier = self->_dockModifier;
      BOOL v5 = dockModifier
        && ![(SBHomeGestureDockSwitcherModifier *)dockModifier isCurrentlyTrackingDock]
        || [(SBHomeGestureSwitcherModifier *)self _shouldResignActiveBasedOnCardScale];
      self->_shouldResignActive = v5;
    }
  }
}

- (BOOL)_shouldResignActiveBasedOnCardScale
{
  [(SBHomeGestureSwitcherModifier *)self _scaleForAdjacentCards];
  if (BSFloatLessThanOrEqualToFloat()) {
    return 1;
  }
  double v4 = fabs(self->_translation.x);
  [(SBHomeGestureSwitcherModifier *)self _coplanarSpacing];
  return v4 > v5;
}

- (id)_responseForUpdatingLayoutForGestureBegan
{
  id v3 = objc_alloc_init(SBSwitcherModifierEventResponse);
  double v4 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:2 updateMode:2];
  [(SBChainableModifierEventResponse *)v3 addChildResponse:v4];

  int64_t startingEnvironmentMode = self->_startingEnvironmentMode;
  BOOL v7 = !self->_continuingGesture && startingEnvironmentMode == 3;
  if (startingEnvironmentMode == 2)
  {
    BOOL v8 = 0;
    BOOL v9 = 0;
  }
  else
  {
    BOOL v9 = [(SBAppLayout *)self->_selectedAppLayout type] == 2;
    BOOL v8 = self->_startingEnvironmentMode == 1;
  }
  if (v7 || v9 || v8)
  {
    id v10 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:8 updateMode:2];
    [(SBChainableModifierEventResponse *)v3 addChildResponse:v10];

    if (v8 || v9 && !self->_continuingGesture) {
      uint64_t v11 = 2;
    }
    else {
      uint64_t v11 = 4;
    }
    id v12 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:4 updateMode:v11];
    [(SBChainableModifierEventResponse *)v3 addChildResponse:v12];
  }
  return v3;
}

- (id)_responseForUpdatingIconViewVisibility:(BOOL)a3
{
  if (self->_selectedAppLayout && self->_startingEnvironmentMode == 3)
  {
    BOOL v4 = a3;
    if (a3)
    {
      double v5 = [(SBHomeGestureSwitcherModifier *)self switcherSettings];
      NSUInteger v6 = [v5 animationSettings];
      BOOL v7 = [v6 iconFadeInSettings];
    }
    else
    {
      BOOL v7 = 0;
    }
    BOOL v9 = [SBIconViewVisibilitySwitcherEventResponse alloc];
    selectedAppLayout = self->_selectedAppLayout;
    uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *MEMORY[0x1E4FA6690], @"SBIconLocationFloatingDockSuggestions", 0);
    BOOL v8 = [(SBIconViewVisibilitySwitcherEventResponse *)v9 initWithAppLayout:selectedAppLayout visible:v4 animationSettings:v7 excludedIconLocations:v11];
  }
  else
  {
    BOOL v8 = 0;
  }
  return v8;
}

- (id)_responseForActivatingFinalDestination:(int64_t)a3
{
  double v5 = [(SBHomeGestureSwitcherModifier *)self appLayouts];
  NSUInteger v6 = v5;
  switch(a3)
  {
    case 0:
      BOOL v7 = self->_selectedAppLayout;
      uint64_t v8 = [(SBHomeGestureSwitcherModifier *)self switcherInterfaceOrientation];
      goto LABEL_21;
    case 1:
      uint64_t v9 = [v5 indexOfObject:self->_selectedAppLayout];
      if (v9 == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_16;
      }
      uint64_t v10 = v9;
      if (![v6 count]) {
        goto LABEL_16;
      }
      if (v10 <= 1) {
        uint64_t v11 = 1;
      }
      else {
        uint64_t v11 = v10;
      }
      uint64_t v12 = v11 - 1;
      goto LABEL_15;
    case 2:
      if (self->_selectedAppLayout)
      {
        uint64_t v13 = objc_msgSend(v5, "indexOfObject:");
        if (v13 == 0x7FFFFFFFFFFFFFFFLL || (uint64_t v14 = v13, ![v6 count]))
        {
LABEL_16:
          uint64_t v8 = 0;
          BOOL v7 = 0;
          goto LABEL_21;
        }
        uint64_t v15 = [v6 count];
        if (v14 + 1 < v15 - 1) {
          uint64_t v12 = v14 + 1;
        }
        else {
          uint64_t v12 = v15 - 1;
        }
LABEL_15:
        uint64_t v16 = [v6 objectAtIndex:v12];
      }
      else
      {
        uint64_t v16 = [v5 firstObject];
      }
LABEL_20:
      BOOL v7 = (SBAppLayout *)v16;
      uint64_t v8 = 0;
LABEL_21:
      uint64_t v17 = 0;
LABEL_22:
      id v18 = objc_alloc_init(SBMutableSwitcherTransitionRequest);
      [(SBSwitcherTransitionRequest *)v18 setAppLayout:v7];
      [(SBSwitcherTransitionRequest *)v18 setUnlockedEnvironmentMode:v17];
      [(SBSwitcherTransitionRequest *)v18 setPreferredInterfaceOrientation:v8];
      id v19 = [[SBPerformTransitionSwitcherEventResponse alloc] initWithTransitionRequest:v18 gestureInitiated:1];

      return v19;
    case 3:
      uint64_t v8 = [(SBHomeGestureSwitcherModifier *)self switcherInterfaceOrientation];
      BOOL v7 = 0;
      uint64_t v17 = 2;
      goto LABEL_22;
    case 4:
      uint64_t v16 = +[SBAppLayout homeScreenAppLayout];
      goto LABEL_20;
    default:
      goto LABEL_16;
  }
}

- (id)_responseForStudyLogDidBeginGesture
{
  v27[2] = *MEMORY[0x1E4F143B8];
  if ([(SBHomeGestureSwitcherModifier *)self isStudyLogEnabled])
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(SBHomeGestureSwitcherModifier *)self containerViewBounds];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    v26[0] = @"x";
    p_lastTouchLocation = &self->_lastTouchLocation;
    uint64_t v13 = [NSNumber numberWithDouble:self->_lastTouchLocation.x];
    v26[1] = @"y";
    v27[0] = v13;
    uint64_t v14 = [NSNumber numberWithDouble:p_lastTouchLocation->y];
    v27[1] = v14;
    uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:2];
    [v3 setObject:v15 forKeyedSubscript:@"locationInView"];
    v24[0] = @"x";
    uint64_t v16 = [NSNumber numberWithDouble:v5];
    v25[0] = v16;
    v24[1] = @"y";
    uint64_t v17 = [NSNumber numberWithDouble:v7];
    v25[1] = v17;
    v24[2] = @"width";
    id v18 = [NSNumber numberWithDouble:v9];
    v25[2] = v18;
    v24[3] = @"height";
    id v19 = [NSNumber numberWithDouble:v11];
    v25[3] = v19;
    id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:4];
    [v3 setObject:v20 forKeyedSubscript:@"switcherViewBounds"];

    id v21 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:v3];
    id v22 = [[SBEmitStudyLogSwitcherEventResponse alloc] initWithStudyLogWithName:@"[SBDeckSwitcherPanGestureWorkspaceTransresponse _beginWithGesture:]" payload:v21];
  }
  else
  {
    id v22 = 0;
  }
  return v22;
}

- (id)_responseForStudyLogDidEndGestureWithEvent:(id)a3 finalDestination:(int64_t)a4 destinationReason:(id)a5
{
  v37[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  double v9 = (__CFString *)a5;
  if ([(SBHomeGestureSwitcherModifier *)self isStudyLogEnabled])
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v8 averageTouchPathAngleOverTimeDuration:0.0416666667];
    double v12 = v11;
    [v8 velocityInContainerView];
    double v14 = v13;
    double v16 = v15;
    v36[0] = @"x";
    uint64_t v17 = [NSNumber numberWithDouble:self->_lastTouchLocation.x];
    v36[1] = @"y";
    v37[0] = v17;
    id v18 = [NSNumber numberWithDouble:self->_lastTouchLocation.y];
    v37[1] = v18;
    id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:2];
    [v10 setObject:v19 forKeyedSubscript:@"location"];

    v34[0] = @"x";
    id v20 = [NSNumber numberWithDouble:v14];
    v34[1] = @"y";
    v35[0] = v20;
    id v21 = [NSNumber numberWithDouble:v16];
    v35[1] = v21;
    id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:2];
    [v10 setObject:v22 forKeyedSubscript:@"velocity"];

    id v23 = [NSNumber numberWithDouble:v12];
    [v10 setObject:v23 forKeyedSubscript:@"touchPathAngleAverage"];

    id v24 = [NSNumber numberWithInteger:a4];
    [v10 setObject:v24 forKeyedSubscript:@"finalDestination"];

    id v25 = NSStringFromSBHomeGestureFinalDestination(a4);
    [v10 setObject:v25 forKeyedSubscript:@"finalDestinationString"];

    if (v9) {
      id v26 = v9;
    }
    else {
      id v26 = &stru_1F3084718;
    }
    [v10 setObject:v26 forKeyedSubscript:@"finalDestinationReason"];
    id v27 = objc_msgSend(NSNumber, "numberWithBool:", -[SBHomeGestureSwitcherModifier _hasPausedEnoughForFlyIn](self, "_hasPausedEnoughForFlyIn"));
    [v10 setObject:v27 forKeyedSubscript:@"hasPausedEnoughForCardFlyIn"];

    dockModifier = self->_dockModifier;
    if (dockModifier)
    {
      id v29 = [(SBHomeGestureDockSwitcherModifier *)dockModifier studyLogData];
      [v10 addEntriesFromDictionary:v29];
    }
    id v30 = [(SBHomeGestureFinalDestinationSwitcherModifier *)self->_finalDestinationModifier studyLogData];
    [v10 addEntriesFromDictionary:v30];

    id v31 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:v10];
    id v32 = [[SBEmitStudyLogSwitcherEventResponse alloc] initWithStudyLogWithName:@"[SBDeckSwitcherPanGestureWorkspaceTransresponse _finishWithGesture:]" payload:v31];
  }
  else
  {
    id v32 = 0;
  }

  return v32;
}

- (id)_responseForSBEventGestureBeganWithTimeDelta:(double)a3
{
  v13[4] = *MEMORY[0x1E4F143B8];
  v12[0] = *MEMORY[0x1E4FA7660];
  double v5 = [NSNumber numberWithDouble:self->_initialTouchLocation.x];
  v13[0] = v5;
  v12[1] = *MEMORY[0x1E4FA7668];
  double v6 = [NSNumber numberWithDouble:self->_initialTouchLocation.y];
  v13[1] = v6;
  v12[2] = *MEMORY[0x1E4FA7648];
  double v7 = objc_msgSend(NSNumber, "numberWithInteger:", -[SBHomeGestureSwitcherModifier switcherInterfaceOrientation](self, "switcherInterfaceOrientation"));
  v13[2] = v7;
  v12[3] = *MEMORY[0x1E4FA7658];
  id v8 = [NSNumber numberWithDouble:a3];
  v13[3] = v8;
  double v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:4];

  id v10 = [[SBEmitSBEventSwitcherEventResponse alloc] initWithSBEventWithEventType:33 payload:v9];
  return v10;
}

- (id)_responseForSBEventGestureEndWithEvent:(id)a3 finalDestination:(int64_t)a4
{
  v23[7] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [v6 averageTouchPathAngleOverTimeDuration:0.0416666667];
  double v8 = fmin(fmax(v7, 2.22507386e-308), 1.79769313e308);
  [v6 peakSpeed];
  double v10 = v9;

  v22[0] = *MEMORY[0x1E4FA7628];
  double v11 = [NSNumber numberWithInteger:a4];
  v23[0] = v11;
  v22[1] = *MEMORY[0x1E4FA7660];
  double v12 = [NSNumber numberWithDouble:self->_lastTouchLocation.x];
  v23[1] = v12;
  v22[2] = *MEMORY[0x1E4FA7668];
  double v13 = [NSNumber numberWithDouble:self->_lastTouchLocation.y];
  v23[2] = v13;
  v22[3] = *MEMORY[0x1E4FA7638];
  p_velocitdouble y = &self->_velocity;
  double v15 = [NSNumber numberWithDouble:self->_velocity.x];
  v23[3] = v15;
  v22[4] = *MEMORY[0x1E4FA7640];
  double v16 = [NSNumber numberWithDouble:p_velocity->y];
  v23[4] = v16;
  v22[5] = *MEMORY[0x1E4FA7630];
  uint64_t v17 = [NSNumber numberWithDouble:v8];
  v23[5] = v17;
  v22[6] = *MEMORY[0x1E4FA7650];
  id v18 = objc_msgSend(NSNumber, "numberWithDouble:", fmin(fmax(v10, 2.22507386e-308), 1.79769313e308));
  v23[6] = v18;
  id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:7];

  id v20 = [[SBEmitSBEventSwitcherEventResponse alloc] initWithSBEventWithEventType:34 payload:v19];
  return v20;
}

- (id)_responseForActivatingReachabilityIfNeededWithFinalDestination:(int64_t)a3
{
  double v4 = 0;
  if (!a3 && self->_startingEnvironmentMode != 2)
  {
    __int16 v26 = 0;
    CGPoint lastTouchLocation = self->_lastTouchLocation;
    int v25 = 0;
    CGPoint translation = self->_translation;
    CGPoint v27 = lastTouchLocation;
    CGPoint v28 = translation;
    velocitdouble y = self->_velocity;
    [(SBHomeGestureSwitcherModifier *)self containerViewBounds];
    uint64_t v8 = v7;
    uint64_t v10 = v9;
    uint64_t v12 = v11;
    uint64_t v14 = v13;
    char v15 = -[SBHomeGestureSwitcherModifier isLocationInSafeArea:](self, "isLocationInSafeArea:", self->_initialTouchLocation.x, self->_initialTouchLocation.y);
    BOOL everTranslatedUpwards = self->_everTranslatedUpwards;
    v18[0] = v27;
    v18[1] = v28;
    v18[2] = velocity;
    uint64_t v19 = v8;
    uint64_t v20 = v10;
    uint64_t v21 = v12;
    uint64_t v22 = v14;
    char v23 = v15;
    BOOL v24 = everTranslatedUpwards;
    double v4 = [[SBActivateReachabilitySwitcherEventResponse alloc] initWithReachabilityContext:v18];
  }
  return v4;
}

- (id)_responseForCancelingSystemGesturesIfNeededWithFinalDestination:(int64_t)a3
{
  if (a3
    && [(SBHomeGestureSwitcherModifier *)self isSystemAssistantExperienceEnabled])
  {
    id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", &unk_1F3349B78, &unk_1F3349B90, 0);
    double v4 = [[SBCancelSystemGesturesSwitcherEventResponse alloc] initWithSystemGestureTypes:v3];
  }
  else
  {
    double v4 = 0;
  }
  return v4;
}

- (id)_updateInMultitaskingIfNeededWithEvent:(id)a3
{
  id v4 = a3;
  [v4 locationInContainerView];
  double v6 = v5;
  double v8 = v7;
  uint64_t v9 = objc_alloc_init(SBSwitcherModifierEventResponse);
  int64_t v10 = [(SBHomeGestureFinalDestinationSwitcherModifier *)self->_finalDestinationModifier currentFinalDestination];
  uint64_t v11 = [(SBHomeGestureSwitcherModifier *)self appLayouts];
  uint64_t v12 = [v11 count];

  int inMultitasking = self->_inMultitasking;
  if (v10 == 3)
  {
    if (!self->_didWarmupFlyInHaptic)
    {
      uint64_t v14 = [[SBHapticSwitcherEventResponse alloc] initWithHapticType:0 phase:0];
      [(SBChainableModifierEventResponse *)v9 addChildResponse:v14];
      self->_didWarmupFlyInHaptic = 1;
    }
    if (inMultitasking)
    {
      BOOL v15 = self->_didPlayFlyInHaptic || v12 == 0;
      if (!v15
        && fabs(self->_velocity.x) < *(double *)&kPauseVelocityThresholdForAppSwitcher
        && fabs(self->_velocity.y) < *(double *)&kPauseVelocityThresholdForAppSwitcher)
      {
        double v16 = [[SBHapticSwitcherEventResponse alloc] initWithHapticType:0 phase:1];
        -[SBHapticSwitcherEventResponse setHidEventSenderID:](v16, "setHidEventSenderID:", [v4 hidEventSenderID]);
        [(SBChainableModifierEventResponse *)v9 addChildResponse:v16];
        self->_didPlayFlyInHaptic = 1;
      }
    }
  }
  [(SBHomeGestureSwitcherModifier *)self _unadjustedGestureTranslation];
  int v19 = -[SBHomeGestureSwitcherModifier _inMultitaskingForLocation:translation:](self, "_inMultitaskingForLocation:translation:", v6, v8, v17, v18);
  self->_int inMultitasking = v19;
  if (inMultitasking != v19)
  {
    if (v19)
    {
      uint64_t v20 = 0;
      self->_hasTriggeredCardFlyIn = 1;
      self->_double translationYWhenTriggeredCardFlyIn = self->_translation.y;
    }
    else
    {
      self->_didPlayFlyInHaptic = 0;
      uint64_t v20 = 1;
    }
    [(SBCoplanarSwitcherModifier *)self->_coplanarLayoutModifier setSpacingType:v20];
    if (![(SBHomeGestureSwitcherModifier *)self _preventPositioningCardsOffscreenForFlatBottomEdgeSwipe])
    {
      if (self->_inMultitasking
        && !self->_didPlayFlyInHaptic
        && v12
        && fabs(self->_velocity.x) < *(double *)&kVelocityXThresholdForUnconditionalArcSwipe)
      {
        uint64_t v21 = [[SBHapticSwitcherEventResponse alloc] initWithHapticType:0 phase:1];
        -[SBHapticSwitcherEventResponse setHidEventSenderID:](v21, "setHidEventSenderID:", [v4 hidEventSenderID]);
        [(SBChainableModifierEventResponse *)v9 addChildResponse:v21];
        self->_didPlayFlyInHaptic = 1;
      }
      uint64_t v22 = [(SBHomeGestureSwitcherModifier *)self switcherSettings];
      char v23 = [v22 animationSettings];
      BOOL v24 = [v23 layoutSettings];
      [(SBHomeGestureSwitcherModifier *)self _beginAnimatingMultitaskingPropertyWithMode:3 settings:v24];
    }
  }

  return v9;
}

- (BOOL)_preventPositioningCardsOffscreenForFlatBottomEdgeSwipe
{
  -[SBHomeGestureSwitcherModifier _scaleForTranslation:](self, "_scaleForTranslation:", self->_translation.x, self->_translation.y);
  double v4 = v3;
  [(SBHomeGestureSwitcherModifier *)self containerViewBounds];
  double v6 = (1.0 - v4) * v5;
  [(SBHomeGestureSwitcherModifier *)self _coplanarSpacing];
  return v6 < v7 * 0.75;
}

- (BOOL)_hasPausedEnoughForFlyIn
{
  if ([(SBHomeGestureFinalDestinationSwitcherModifier *)self->_finalDestinationModifier hasSeenAccelerationDipForAppSwitcher])
  {
    return 1;
  }
  double v4 = *(double *)&kCardFlyInDelayAfterEnteringAppSwitcher;
  return self->_gestureHoldTimer > (unint64_t)(v4 * SBScreenMaximumFramesPerSecond());
}

- (BOOL)_hasTraveledSufficientDistanceForHomeOrAppSwitcher
{
  [(SBHomeGestureSwitcherModifier *)self containerViewBounds];
  return self->_lastTouchLocation.y <= v3 - *(double *)&kMinimumYDistanceForHomeOrAppSwitcher;
}

- (void)_displayLinkFired:(id)a3
{
  if ([(SBGestureSwitcherModifier *)self gesturePhase] == 2
    && [(SBChainableModifier *)self state] != 1)
  {
    [(SBHomeGestureSwitcherModifier *)self gestureHandlingModifier:self averageVelocityOverDuration:0.0416666667];
    int64_t v4 = [(SBHomeGestureFinalDestinationSwitcherModifier *)self->_finalDestinationModifier currentFinalDestination];
    if (v4) {
      BOOL v5 = v4 == 4;
    }
    else {
      BOOL v5 = 1;
    }
    if (v5)
    {
      self->_gestureHoldTimer = 0;
    }
    else if (v4 == 3 && BSFloatLessThanFloat())
    {
      ++self->_gestureHoldTimer;
    }
    if (!self->_inMultitasking
      && [(SBHomeGestureSwitcherModifier *)self _hasPausedEnoughForFlyIn])
    {
      [(SBHomeGestureSwitcherModifier *)self gestureHandlingModifierRequestsUpdate:self];
    }
  }
}

- (BOOL)_shouldPositionAdjacentCardsOffscreenForFlyIn
{
  BOOL v3 = [(SBHomeGestureSwitcherModifier *)self _preventPositioningCardsOffscreenForFlatBottomEdgeSwipe];
  if (self->_inMultitasking) {
    return 0;
  }
  if (self->_startingEnvironmentMode == 1) {
    return 1;
  }
  return !v3;
}

- (void)_beginAnimatingMultitaskingPropertyWithMode:(int64_t)a3 settings:(id)a4
{
  id v6 = a4;
  inMultitaskingChangedPropertdouble y = self->_inMultitaskingChangedProperty;
  if (inMultitaskingChangedProperty)
  {
    [(UIViewFloatAnimatableProperty *)inMultitaskingChangedProperty invalidate];
    double v8 = self->_inMultitaskingChangedProperty;
    self->_inMultitaskingChangedPropertdouble y = 0;
  }
  uint64_t v9 = (UIViewFloatAnimatableProperty *)objc_alloc_init(MEMORY[0x1E4F43000]);
  int64_t v10 = self->_inMultitaskingChangedProperty;
  self->_inMultitaskingChangedPropertdouble y = v9;

  [(UIViewFloatAnimatableProperty *)self->_inMultitaskingChangedProperty setValue:0.0];
  uint64_t v11 = (void *)[v6 copy];
  LODWORD(v12) = *MEMORY[0x1E4F39AF0];
  LODWORD(v13) = *(_DWORD *)(MEMORY[0x1E4F39AF0] + 4);
  LODWORD(v14) = *(_DWORD *)(MEMORY[0x1E4F39AF0] + 8);
  objc_msgSend(v11, "setFrameRateRange:highFrameRateReason:", 0, v12, v13, v14);
  id v15 = v11;

  objc_initWeak(&location, self);
  double v16 = self->_inMultitaskingChangedProperty;
  double v17 = (void *)MEMORY[0x1E4F42FF0];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __86__SBHomeGestureSwitcherModifier__beginAnimatingMultitaskingPropertyWithMode_settings___block_invoke;
  v22[3] = &unk_1E6AF4AC0;
  v22[4] = self;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __86__SBHomeGestureSwitcherModifier__beginAnimatingMultitaskingPropertyWithMode_settings___block_invoke_2;
  v19[3] = &unk_1E6AFBE70;
  objc_copyWeak(&v21, &location);
  double v18 = v16;
  uint64_t v20 = v18;
  objc_msgSend(v17, "sb_animateWithSettings:mode:animations:completion:", v15, a3, v22, v19);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

uint64_t __86__SBHomeGestureSwitcherModifier__beginAnimatingMultitaskingPropertyWithMode_settings___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 128) setValue:1.0];
}

void __86__SBHomeGestureSwitcherModifier__beginAnimatingMultitaskingPropertyWithMode_settings___block_invoke_2(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    id v3 = WeakRetained[16];
    int64_t v4 = v3;
    if (v3 && v3 == *(id *)(a1 + 32))
    {
      id v5 = v6[16];
      v6[16] = 0;
    }
    WeakRetained = v6;
  }
}

- (BOOL)_inMultitaskingForLocation:(CGPoint)a3 translation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  BOOL inMultitasking = self->_inMultitasking;
  int64_t startingEnvironmentMode = self->_startingEnvironmentMode;
  uint64_t v9 = +[SBSetupManager sharedInstance];
  char v10 = [v9 isInSetupMode];

  if (v10) {
    return 0;
  }
  int64_t v12 = [(SBHomeGestureFinalDestinationSwitcherModifier *)self->_finalDestinationModifier currentFinalDestination];
  int v14 = inMultitasking || (unint64_t)(v12 - 1) < 2;
  [(SBHomeGestureSwitcherModifier *)self _coplanarSpacing];
  double v16 = v15;
  if (self->_selectedAppLayout) {
    unint64_t v17 = [(SBHomeGestureSwitcherModifier *)self _selectedAppLayoutIndex];
  }
  else {
    unint64_t v17 = 0;
  }
  double v18 = [(SBHomeGestureSwitcherModifier *)self appLayouts];
  uint64_t v19 = [v18 count];

  if (v19)
  {
    [(SBHomeGestureSwitcherModifier *)self scaleForIndex:v17];
    if (fabs(x) > v16 / v20 && v12 != 4) {
      int v14 = 1;
    }
  }
  if ([(SBHomeGestureSwitcherModifier *)self _hasPausedEnoughForFlyIn]) {
    v14 |= ![(SBHomeGestureDockSwitcherModifier *)self->_dockModifier isCurrentlyTrackingDock];
  }
  BOOL v22 = [(SBHomeGestureSwitcherModifier *)self _isTranslationPastDistanceThresholdToUnconditionallyGoHome:y];
  if (startingEnvironmentMode == 1) {
    char v23 = v14;
  }
  else {
    char v23 = 0;
  }
  if (v22) {
    char v11 = v23;
  }
  else {
    char v11 = v14;
  }
  BOOL v24 = [(SBHomeGestureSwitcherModifier *)self _hasTraveledSufficientDistanceForHomeOrAppSwitcher];
  if (startingEnvironmentMode == 1)
  {
    BOOL v25 = v24;
    int v26 = [(SBHomeGestureSwitcherModifier *)self isRTLEnabled];
    double v27 = -x;
    if (!v26) {
      double v27 = x;
    }
    if (v27 < v16) {
      return v25 & v11;
    }
  }
  return v11;
}

- (BOOL)_isTranslationPastDistanceThresholdToUnconditionallyGoHome:(double)a3
{
  double v3 = -a3;
  [(SBHomeGestureSwitcherModifier *)self unconditionalDistanceThresholdForHome];
  return v4 < v3;
}

- (double)_gestureProgressToMaxTranslationForTranslation:(double)a3
{
  [(SBHomeGestureSwitcherModifier *)self _distanceYToMaxTranslation];
  double v6 = v5;
  if (self->_startingEnvironmentMode == 2 && !self->_scrunchInitiated)
  {
    [(SBHomeGestureSwitcherModifier *)self _distanceYToInSwitcherCardScale];
    a3 = v7 + a3;
    double v6 = v6 - v7;
  }
  return -a3 / v6;
}

- (double)_distanceYToInSwitcherCardScale
{
  [(SBHomeGestureSwitcherModifier *)self _switcherCardScale];
  double v4 = v3;
  [(SBHomeGestureSwitcherModifier *)self _inSwitcherCenterYOffsetWhenPresented];
  double v6 = v5;
  [(SBHomeGestureSwitcherModifier *)self containerViewBounds];
  return (1.0 - v4) * v7 * 0.5 - v6;
}

- (double)_distanceYToMaxTranslation
{
  [(SBHomeGestureSwitcherModifier *)self containerViewBounds];
  double v4 = v3;
  [(SBHomeGestureSwitcherModifier *)self _centerYOffsetDuringGesture];
  return v4 * 0.5 - v5;
}

- (double)_inSwitcherCenterYOffsetWhenPresented
{
  double v3 = [(SBHomeGestureSwitcherModifier *)self switcherSettings];
  [v3 switcherCenterYOffsetPercentOfScreenHeight];

  [(SBHomeGestureSwitcherModifier *)self containerViewBounds];
  [(SBHomeGestureSwitcherModifier *)self screenScale];
  BSFloatRoundForScale();
  return result;
}

- (double)_centerYOffsetDuringGesture
{
  if (self->_startingEnvironmentMode == 1)
  {
    [(SBHomeGestureSwitcherModifier *)self _inSwitcherCenterYOffsetWhenPresented];
  }
  else
  {
    double v4 = [(SBHomeGestureSwitcherModifier *)self homeGestureSettings];
    [v4 homeGestureCenterZoomDownCenterYOffsetFactor];
    [(SBHomeGestureSwitcherModifier *)self containerViewBounds];
    [(SBHomeGestureSwitcherModifier *)self screenScale];
    BSFloatRoundForScale();
    double v6 = v5;

    return v6;
  }
  return result;
}

- (double)_switcherCardScale
{
  id v2 = [(SBHomeGestureSwitcherModifier *)self switcherSettings];
  [v2 deckSwitcherPageScale];
  double v4 = v3;

  return v4;
}

- (unint64_t)_selectedAppLayoutIndex
{
  double v3 = [(SBHomeGestureSwitcherModifier *)self appLayouts];
  double v4 = v3;
  if (v3 && self->_selectedAppLayout) {
    unint64_t v5 = objc_msgSend(v3, "indexOfObject:");
  }
  else {
    unint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v5;
}

- (BOOL)_isSelectedAppLayoutAtIndex:(unint64_t)a3
{
  double v4 = self;
  unint64_t v5 = [(SBHomeGestureSwitcherModifier *)self appLayouts];
  double v6 = [v5 objectAtIndex:a3];

  LOBYTE(v4) = [v6 isEqual:v4->_selectedAppLayout];
  return (char)v4;
}

- (double)_coplanarSpacing
{
  double v3 = [(SBHomeGestureSwitcherModifier *)self switcherSettings];
  if ([(SBHomeGestureSwitcherModifier *)self isDevicePad]) {
    [v3 coplanarSpacingPad];
  }
  else {
    [v3 coplanarSpacingPhone];
  }
  double v5 = v4;

  return v5;
}

- (void)_applyPrototypeSettings
{
  double v3 = SBMainScreenPointsPerMillimeter();
  id v14 = [(SBHomeGestureSwitcherModifier *)self homeGestureSettings];
  [v14 homeGestureMinimumCardScale];
  self->_double homeGestureMinimumCardScale = v4;
  [v14 homeGestureMinimumCardScaleRubberBandingRange];
  self->_homeGestureMinimumCardScaleRubberBandingRange = v5;
  [v14 homeGestureXOffsetFactor];
  self->_homeGestureXOffsetFactor = v6;
  [v14 normalizedDistanceYThresholdForUnconditionalHome];
  kHomeGestureNormalizedDistanceYThresholdForUnconditionalHome = v7;
  [v14 normalizedDistanceYThresholdRangeForUnconditionalHome];
  kHomeGestureNormalizedDistanceYThresholdRangeForUnconditionalHome = v8;
  [v14 pauseVelocityThresholdForAppSwitcher];
  *(double *)&kPauseVelocityThresholdForAppSwitcher = v3 * v9;
  [v14 velocityXThresholdForUnconditionalArcSwipe];
  *(double *)&kVelocityXThresholdForUnconditionalArcSwipe = v3 * v10;
  [v14 minimumYDistanceForHomeOrAppSwitcher];
  *(double *)&kMinimumYDistanceForHomeOrAppSwitcher = v3 * v11;
  [v14 cardFlyInMaximumVelocityThreshold];
  *(double *)&kCardFlyInMaximumVelocityThreshold = v3 * v12;
  [v14 cardFlyInDelayAfterEnteringAppSwitcher];
  kCardFlyInDelayAfterEnteringAppSwitcher = v13;
}

- (BOOL)laysOutNeighboringCards
{
  return self->_laysOutNeighboringCards;
}

- (void)setLaysOutNeighboringCards:(BOOL)a3
{
  self->_laysOutNeighboringCards = a3;
}

- (BOOL)providesHomeScreenDimmingAlpha
{
  return self->_providesHomeScreenDimmingAlpha;
}

- (void)setProvidesHomeScreenDimmingAlpha:(BOOL)a3
{
  self->_providesHomeScreenDimmingAlphdouble a = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedAppLayout, 0);
  objc_storeStrong((id *)&self->_dismissSiriModifier, 0);
  objc_storeStrong((id *)&self->_finalDestinationModifier, 0);
  objc_storeStrong((id *)&self->_dockModifier, 0);
  objc_storeStrong((id *)&self->_coplanarLayoutModifier, 0);
  objc_storeStrong((id *)&self->_multitaskingModifier, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_inMultitaskingChangedProperty, 0);
}

@end