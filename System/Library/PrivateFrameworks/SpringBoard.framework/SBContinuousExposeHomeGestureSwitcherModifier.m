@interface SBContinuousExposeHomeGestureSwitcherModifier
- (BOOL)_hasPausedEnoughForFlyIn;
- (BOOL)_hasTraveledSufficientDistanceForHomeOrAppSwitcher;
- (BOOL)_isSelectedAppLayoutAtIndex:(unint64_t)a3;
- (BOOL)_isTranslationPastDistanceThresholdToUnconditionallyGoHome:(double)a3;
- (BOOL)_preventPositioningCardsOffscreenForFlatBottomEdgeSwipe;
- (BOOL)_shouldPositionAdjacentCardsOffscreenForFlyIn;
- (BOOL)_shouldResignActiveBasedOnCardScale;
- (BOOL)isContainerStatusBarVisible;
- (BOOL)isContentStatusBarVisibleForIndex:(unint64_t)a3;
- (BOOL)isHomeAffordanceSupportedForAppLayout:(id)a3;
- (BOOL)isHomeScreenContentRequired;
- (BOOL)isShowingOrAnimatingCardsForFlyIn;
- (BOOL)isSwitcherWindowVisible;
- (BOOL)isWallpaperRequiredForSwitcher;
- (BOOL)laysOutNeighboringCards;
- (BOOL)providesHomeScreenDimmingAlpha;
- (BOOL)shouldPinLayoutRolesToSpace:(unint64_t)a3;
- (BOOL)shouldUseAnchorPointToPinLayoutRolesToSpace:(unint64_t)a3;
- (CGPoint)_rubberbandedTranslationForAdjacentCards;
- (CGPoint)_unadjustedGestureTranslation;
- (CGPoint)adjustedSpaceAccessoryViewAnchorPoint:(CGPoint)a3 forAppLayout:(id)a4;
- (CGPoint)anchorPointForIndex:(unint64_t)a3;
- (CGPoint)liftOffTranslationForGestureEnd;
- (CGPoint)liftOffVelocityForGestureEnd;
- (CGRect)frameForIndex:(unint64_t)a3;
- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withBounds:(CGRect)a5;
- (NSString)debugDescription;
- (SBContinuousExposeHomeGestureSwitcherModifier)initWithGestureID:(id)a3 selectedAppLayout:(id)a4 startingEnvironmentMode:(int64_t)a5 scrunchInitiated:(BOOL)a6 continuingGesture:(BOOL)a7 lastGestureWasAnArcSwipe:(BOOL)a8;
- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3;
- (SBSwitcherWallpaperGradientAttributes)wallpaperGradientAttributesForIndex:(unint64_t)a3;
- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3;
- (double)_centerYOffsetDuringGesture;
- (double)_coplanarSpacing;
- (double)_distanceYToInSwitcherCardScale;
- (double)_distanceYToMaxTranslation;
- (double)_gestureProgressToMaxTranslationForTranslation:(double)a3;
- (double)_inSwitcherCenterYOffsetWhenPresented;
- (double)_maxPerspectiveAngleForSelectedAppLayout;
- (double)_rangeForPerspectiveAngleProgressOfAppLayout:(id)a3 outMin:(double)a4 outMax:(double)a5;
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
- (double)perspectiveAngleForAppLayout:(id)a3;
- (double)scaleForIndex:(unint64_t)a3;
- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4;
- (double)titleOpacityForIndex:(unint64_t)a3;
- (double)unconditionalDistanceThresholdForHome;
- (double)wallpaperOverlayAlphaForIndex:(unint64_t)a3;
- (double)wallpaperScale;
- (id)_cornerRadiusSettings;
- (id)_layoutSettingsForAppLayout:(id)a3 layoutSettings:(id)a4;
- (id)_newDockModifierRequiringVerticalSwipeToTrackDock:(BOOL)a3 startingEnvironmentMode:(int64_t)a4;
- (id)_nextRecentAppLayout;
- (id)_previousRecentAppLayout;
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
- (id)appLayoutToScrollToBeforeTransitioning;
- (id)appLayoutsForContinuousExposeIdentifier:(id)a3;
- (id)appLayoutsToCacheFullsizeSnapshots;
- (id)appLayoutsToCacheSnapshots;
- (id)appLayoutsToResignActive;
- (id)continuousExposeIdentifiersInSwitcher;
- (id)handleGestureEvent:(id)a3;
- (id)handleHomeGestureSettingsChangedEvent:(id)a3;
- (id)handleRemovalEvent:(id)a3;
- (id)handleSwitcherSettingsChangedEvent:(id)a3;
- (id)handleTransitionEvent:(id)a3;
- (id)keyboardSuppressionMode;
- (id)selectedAppLayout;
- (id)topMostLayoutElements;
- (id)visibleAppLayouts;
- (id)visibleHomeAffordanceLayoutElements;
- (int64_t)currentFinalDestination;
- (int64_t)homeScreenBackdropBlurType;
- (int64_t)shadowStyleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (int64_t)wallpaperStyle;
- (unint64_t)_selectedAppLayoutIndex;
- (void)_applyPrototypeSettings;
- (void)_beginAnimatingArcSwipePullingPropertyWithMode:(int64_t)a3 settings:(id)a4;
- (void)_beginAnimatingMultitaskingPropertyWithMode:(int64_t)a3 settings:(id)a4;
- (void)_displayLinkFired:(id)a3;
- (void)_updateGestureTranslationVelocityAndProgressWithEvent:(id)a3;
- (void)_updateShouldResignActiveWithEvent:(id)a3;
- (void)_updateStackedProgress;
- (void)_updateTranslationAdjustmentForGestureFromHomeScreenIfNeededWithEvent:(id)a3;
- (void)dealloc;
- (void)didMoveToParentModifier:(id)a3;
- (void)setLaysOutNeighboringCards:(BOOL)a3;
- (void)setProvidesHomeScreenDimmingAlpha:(BOOL)a3;
@end

@implementation SBContinuousExposeHomeGestureSwitcherModifier

- (SBContinuousExposeHomeGestureSwitcherModifier)initWithGestureID:(id)a3 selectedAppLayout:(id)a4 startingEnvironmentMode:(int64_t)a5 scrunchInitiated:(BOOL)a6 continuingGesture:(BOOL)a7 lastGestureWasAnArcSwipe:(BOOL)a8
{
  id v15 = a4;
  v23.receiver = self;
  v23.super_class = (Class)SBContinuousExposeHomeGestureSwitcherModifier;
  v16 = [(SBGestureSwitcherModifier *)&v23 initWithGestureID:a3];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_selectedAppLayout, a4);
    v17->_startingEnvironmentMode = a5;
    v17->_scrunchInitiated = a6;
    v17->_continuingGesture = a7;
    v17->_lastGestureWasAnArcSwipe = a8;
    v17->_providesHomeScreenDimmingAlpha = 1;
    v18 = objc_alloc_init(SBAppSwitcherContinuousExposeSwitcherModifier);
    appSwitcherModifier = v17->_appSwitcherModifier;
    v17->_appSwitcherModifier = v18;

    [(SBAppSwitcherContinuousExposeSwitcherModifier *)v17->_appSwitcherModifier setHandlesTapAppLayoutHeaderEvents:0];
    [(SBAppSwitcherContinuousExposeSwitcherModifier *)v17->_appSwitcherModifier setShowsActiveAppLayoutInSwitcher:0];
    [(SBAppSwitcherContinuousExposeSwitcherModifier *)v17->_appSwitcherModifier setHandlesTapAppLayoutEvents:0];
    v20 = objc_alloc_init(SBDismissSiriSwitcherModifier);
    dismissSiriModifier = v17->_dismissSiriModifier;
    v17->_dismissSiriModifier = v20;

    [(SBChainableModifier *)v17 addChildModifier:v17->_dismissSiriModifier];
  }

  return v17;
}

- (void)dealloc
{
  [(CADisplayLink *)self->_displayLink invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBContinuousExposeHomeGestureSwitcherModifier;
  [(SBChainableModifier *)&v3 dealloc];
}

- (void)didMoveToParentModifier:(id)a3
{
  v32.receiver = self;
  v32.super_class = (Class)SBContinuousExposeHomeGestureSwitcherModifier;
  -[SBChainableModifier didMoveToParentModifier:](&v32, sel_didMoveToParentModifier_);
  if (!a3)
  {
    [(CADisplayLink *)self->_displayLink invalidate];
    return;
  }
  int64_t startingEnvironmentMode = self->_startingEnvironmentMode;
  if (startingEnvironmentMode != 1)
  {
    if (startingEnvironmentMode != 3
      || ([(SBContinuousExposeHomeGestureSwitcherModifier *)self switcherSettings],
          v6 = objc_claimAutoreleasedReturnValue(),
          [v6 chamoisSettings],
          v7 = objc_claimAutoreleasedReturnValue(),
          char v8 = [v7 blurWallpaperInApps],
          v7,
          v6,
          (v8 & 1) != 0))
    {
      v9 = objc_alloc_init(SBHomeScreenSwitcherModifier);
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __73__SBContinuousExposeHomeGestureSwitcherModifier_didMoveToParentModifier___block_invoke_2;
      v28[3] = &unk_1E6AF5290;
      v28[4] = self;
      v29 = v9;
      v10 = v9;
      [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:v10 usingBlock:v28];

LABEL_9:
      goto LABEL_10;
    }
  }
  appSwitcherModifier = self->_appSwitcherModifier;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __73__SBContinuousExposeHomeGestureSwitcherModifier_didMoveToParentModifier___block_invoke;
  v31[3] = &unk_1E6AF4AC0;
  v31[4] = self;
  [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:appSwitcherModifier usingBlock:v31];
  if (!self->_providesHomeScreenDimmingAlpha)
  {
    v30.receiver = self;
    v30.super_class = (Class)SBContinuousExposeHomeGestureSwitcherModifier;
    [(SBContinuousExposeHomeGestureSwitcherModifier *)&v30 homeScreenAlpha];
    self->_toHomeScreenAlpha = v12;
    v10 = [(SBContinuousExposeHomeGestureSwitcherModifier *)self switcherSettings];
    v13 = [(SBHomeScreenSwitcherModifier *)v10 animationSettings];
    [v13 homeScreenBlurProgressForMode:2];
    self->_toHomeScreenBlurProgress = v14;

    goto LABEL_9;
  }
LABEL_10:
  if ([(SBContinuousExposeHomeGestureSwitcherModifier *)self isFloatingDockSupported])BOOL v15 = !self->_scrunchInitiated; {
  else
  }
    BOOL v15 = 0;
  BOOL v16 = self->_continuingGesture && self->_lastGestureWasAnArcSwipe;
  char v17 = !v15;
  if (self->_dockModifier) {
    char v17 = 1;
  }
  if ((v17 & 1) == 0)
  {
    v18 = [(SBContinuousExposeHomeGestureSwitcherModifier *)self _newDockModifierRequiringVerticalSwipeToTrackDock:v16 startingEnvironmentMode:self->_startingEnvironmentMode];
    dockModifier = self->_dockModifier;
    self->_dockModifier = v18;

    [(SBChainableModifier *)self addChildModifier:self->_dockModifier atLevel:0 key:0];
  }
  if (!self->_finalDestinationModifier)
  {
    if (self->_startingEnvironmentMode == 2)
    {
      [(SBContinuousExposeHomeGestureSwitcherModifier *)self _distanceYToInSwitcherCardScale];
      self->_translationAdjustmentForStartingFromSwitcher.y = -v20;
    }
    if (v15) {
      id v21 = [(SBContinuousExposeHomeGestureSwitcherModifier *)self _newDockModifierRequiringVerticalSwipeToTrackDock:v16 startingEnvironmentMode:self->_startingEnvironmentMode];
    }
    else {
      id v21 = 0;
    }
    v22 = [SBHomeGestureFinalDestinationSwitcherModifier alloc];
    objc_super v23 = [(SBContinuousExposeHomeGestureSwitcherModifier *)self switcherSettings];
    v24 = [v23 chamoisSettings];
    [v24 homeGestureMinimumYDistanceForHomeOrAppSwitcher];
    v26 = -[SBHomeGestureFinalDestinationSwitcherModifier initWithDelegate:initialTranslationAdjustment:minYDistanceForHomeOrSwitcher:startingEnvironmentMode:continuingGesture:dockModifier:](v22, "initWithDelegate:initialTranslationAdjustment:minYDistanceForHomeOrSwitcher:startingEnvironmentMode:continuingGesture:dockModifier:", self, self->_startingEnvironmentMode, self->_continuingGesture, v21, self->_translationAdjustmentForStartingFromSwitcher.x, self->_translationAdjustmentForStartingFromSwitcher.y, v25);
    finalDestinationModifier = self->_finalDestinationModifier;
    self->_finalDestinationModifier = v26;

    [(SBChainableModifier *)self addChildModifier:self->_finalDestinationModifier atLevel:1 key:0];
  }
  [(SBContinuousExposeHomeGestureSwitcherModifier *)self _applyPrototypeSettings];
}

uint64_t __73__SBContinuousExposeHomeGestureSwitcherModifier_didMoveToParentModifier___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 480) homeScreenAlpha];
  *(void *)(*(void *)(a1 + 32) + 432) = v2;
  [*(id *)(*(void *)(a1 + 32) + 480) homeScreenBackdropBlurProgress];
  *(void *)(*(void *)(a1 + 32) + 440) = v3;
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 480) homeScreenDimmingAlpha];
  *(void *)(*(void *)(a1 + 32) + 448) = v5;
  return result;
}

uint64_t __73__SBContinuousExposeHomeGestureSwitcherModifier_didMoveToParentModifier___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 40) homeScreenAlpha];
  *(void *)(*(void *)(a1 + 32) + 432) = v2;
  [*(id *)(a1 + 40) homeScreenBackdropBlurProgress];
  *(void *)(*(void *)(a1 + 32) + 440) = v3;
  uint64_t result = [*(id *)(a1 + 40) homeScreenDimmingAlpha];
  *(void *)(*(void *)(a1 + 32) + 448) = v5;
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
  [(SBContinuousExposeHomeGestureSwitcherModifier *)self _applyPrototypeSettings];
  v7.receiver = self;
  v7.super_class = (Class)SBContinuousExposeHomeGestureSwitcherModifier;
  BOOL v5 = [(SBSwitcherModifier *)&v7 handleHomeGestureSettingsChangedEvent:v4];

  return v5;
}

- (id)handleSwitcherSettingsChangedEvent:(id)a3
{
  id v4 = a3;
  [(SBContinuousExposeHomeGestureSwitcherModifier *)self _applyPrototypeSettings];
  v7.receiver = self;
  v7.super_class = (Class)SBContinuousExposeHomeGestureSwitcherModifier;
  BOOL v5 = [(SBSwitcherModifier *)&v7 handleSwitcherSettingsChangedEvent:v4];

  return v5;
}

- (id)handleTransitionEvent:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SBContinuousExposeHomeGestureSwitcherModifier;
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
  v10.super_class = (Class)SBContinuousExposeHomeGestureSwitcherModifier;
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
  v12.super_class = (Class)SBContinuousExposeHomeGestureSwitcherModifier;
  unint64_t v6 = [(SBGestureSwitcherModifier *)&v12 handleGestureEvent:v5];
  switch([v5 phase])
  {
    case 0:
      objc_super v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:a2 object:self file:@"SBContinuousExposeHomeGestureSwitcherModifier.m" lineNumber:311 description:@"Should not be getting PhasePossible"];

      goto LABEL_3;
    case 1:
      uint64_t v9 = [(SBContinuousExposeHomeGestureSwitcherModifier *)self _updateForGestureDidBeginWithEvent:v5];
      goto LABEL_7;
    case 2:
      uint64_t v9 = [(SBContinuousExposeHomeGestureSwitcherModifier *)self _updateForGestureDidChangeWithEvent:v5];
      goto LABEL_7;
    case 3:
      uint64_t v9 = [(SBContinuousExposeHomeGestureSwitcherModifier *)self _updateForGestureDidEndWithEvent:v5];
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
    [v38 handleFailureInMethod:a2 object:self file:@"SBContinuousExposeHomeGestureSwitcherModifier.m" lineNumber:328 description:@"Can't begin a gesture that has already begun."];
  }
  if (self->_gestureHasEnded)
  {
    v39 = [MEMORY[0x1E4F28B00] currentHandler];
    [v39 handleFailureInMethod:a2 object:self file:@"SBContinuousExposeHomeGestureSwitcherModifier.m" lineNumber:329 description:@"Can't begin a gesture that has already ended."];
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
  [(SBContinuousExposeHomeGestureSwitcherModifier *)self containerViewBounds];
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
  [(SBContinuousExposeHomeGestureSwitcherModifier *)self _updateGestureTranslationVelocityAndProgressWithEvent:v5];
  [(SBContinuousExposeHomeGestureSwitcherModifier *)self _updateShouldResignActiveWithEvent:v5];
  [(SBContinuousExposeHomeGestureSwitcherModifier *)self _updateStackedProgress];
  objc_super v32 = [(SBContinuousExposeHomeGestureSwitcherModifier *)self _responseForUpdatingLayoutForGestureBegan];
  [(SBChainableModifierEventResponse *)v6 addChildResponse:v32];
  v33 = [(SBContinuousExposeHomeGestureSwitcherModifier *)self _responseForUpdatingIconViewVisibility:0];
  if (v33) {
    [(SBChainableModifierEventResponse *)v6 addChildResponse:v33];
  }
  double v34 = v7 - v9;
  v35 = [(SBContinuousExposeHomeGestureSwitcherModifier *)self _responseForStudyLogDidBeginGesture];
  if (v35) {
    [(SBChainableModifierEventResponse *)v6 addChildResponse:v35];
  }
  v36 = [(SBContinuousExposeHomeGestureSwitcherModifier *)self _responseForSBEventGestureBeganWithTimeDelta:v34];
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
    double v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"SBContinuousExposeHomeGestureSwitcherModifier.m" lineNumber:399 description:@"Can't update a gesture that has not begun."];
  }
  if (self->_gestureHasEnded)
  {
    double v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"SBContinuousExposeHomeGestureSwitcherModifier.m" lineNumber:400 description:@"Can't update a gesture that has already ended."];
  }
  [(SBContinuousExposeHomeGestureSwitcherModifier *)self _updateGestureTranslationVelocityAndProgressWithEvent:v5];
  [(SBContinuousExposeHomeGestureSwitcherModifier *)self _updateShouldResignActiveWithEvent:v5];
  [(SBContinuousExposeHomeGestureSwitcherModifier *)self _updateStackedProgress];
  [(SBContinuousExposeHomeGestureSwitcherModifier *)self _unadjustedGestureTranslation];
  double v7 = v6;
  if ([(SBContinuousExposeHomeGestureSwitcherModifier *)self _isTranslationPastDistanceThresholdToUnconditionallyGoHome:v6])
  {
    self->_gestureHoldTimer = 0;
  }
  double v8 = objc_alloc_init(SBSwitcherModifierEventResponse);
  [v5 locationInContainerView];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  v13 = [(SBContinuousExposeHomeGestureSwitcherModifier *)self _updateInMultitaskingIfNeededWithEvent:v5];
  if (v13) {
    [(SBChainableModifierEventResponse *)v8 addChildResponse:v13];
  }
  self->_lastTouchLocation.x = v10;
  self->_lastTouchLocation.y = v12;
  if (!self->_everTranslatedUpwards) {
    self->_everTranslatedUpwards = v7 < 0.0;
  }
  if (self->_startingEnvironmentMode == 1)
  {
    BOOL v14 = [(SBContinuousExposeHomeGestureSwitcherModifier *)self appLayouts];
    if (![(SBCompleteGestureSwitcherEventResponse *)v14 count])
    {
      BOOL inMultitasking = self->_inMultitasking;

      if (!inMultitasking) {
        goto LABEL_16;
      }
      self->_cancelledGestureForEmptySwitcher = 1;
      BOOL v14 = objc_alloc_init(SBCompleteGestureSwitcherEventResponse);
      [(SBChainableModifierEventResponse *)v8 addChildResponse:v14];
    }
  }
LABEL_16:

  return v8;
}

- (id)_updateForGestureDidEndWithEvent:(id)a3
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!self->_gestureHasBegun)
  {
    v63 = [MEMORY[0x1E4F28B00] currentHandler];
    [v63 handleFailureInMethod:a2 object:self file:@"SBContinuousExposeHomeGestureSwitcherModifier.m" lineNumber:437 description:@"Can't end a gesture that has not begun."];
  }
  if (self->_gestureHasEnded)
  {
    v64 = [MEMORY[0x1E4F28B00] currentHandler];
    [v64 handleFailureInMethod:a2 object:self file:@"SBContinuousExposeHomeGestureSwitcherModifier.m" lineNumber:438 description:@"Can't end a gesture that has already ended."];
  }
  self->_gestureHasEnded = 1;
  [(SBContinuousExposeHomeGestureSwitcherModifier *)self _updateGestureTranslationVelocityAndProgressWithEvent:v5];
  [(SBContinuousExposeHomeGestureSwitcherModifier *)self _updateShouldResignActiveWithEvent:v5];
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
    CGFloat v12 = [(SBContinuousExposeHomeGestureSwitcherModifier *)self appLayouts];
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
      double v24 = [(SBContinuousExposeHomeGestureSwitcherModifier *)self homeGestureSettings];
      double v25 = v24;
      if (v9 == 4 && self->_selectedAppLayout && [v24 injectGestureVelocityForZoomDown])
      {
        [v5 velocityInContainerView];
        double v27 = v26;
        double v29 = v28;
        [(SBContinuousExposeHomeGestureSwitcherModifier *)self switcherViewBounds];
        double v31 = v30;
        objc_super v32 = [(SBContinuousExposeHomeGestureSwitcherModifier *)self homeGestureSettings];
        v33 = [(SBContinuousExposeHomeGestureSwitcherModifier *)self currentVelocityValueForVisibleAppLayout:self->_selectedAppLayout key:@"transform"];
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

          v41 = [(SBContinuousExposeHomeGestureSwitcherModifier *)self currentVelocityValueForVisibleAppLayout:self->_selectedAppLayout key:@"position"];
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
  v56 = [(SBContinuousExposeHomeGestureSwitcherModifier *)self _responseForUpdatingIconViewVisibility:1];
  if (v56) {
    [(SBChainableModifierEventResponse *)v11 addChildResponse:v56];
  }
  v57 = [(SBContinuousExposeHomeGestureSwitcherModifier *)self _responseForActivatingFinalDestination:v9];
  [(SBChainableModifierEventResponse *)v11 addChildResponse:v57];
  if ((v17 & 1) == 0)
  {
    v58 = [(SBContinuousExposeHomeGestureSwitcherModifier *)self _responseForActivatingReachabilityIfNeededWithFinalDestination:v9];
    if (v58) {
      [(SBChainableModifierEventResponse *)v11 addChildResponse:v58];
    }

    v59 = [(SBContinuousExposeHomeGestureSwitcherModifier *)self _responseForCancelingSystemGesturesIfNeededWithFinalDestination:v9];
    if (v59) {
      [(SBChainableModifierEventResponse *)v11 addChildResponse:v59];
    }
  }
  v60 = [(SBContinuousExposeHomeGestureSwitcherModifier *)self _responseForStudyLogDidEndGestureWithEvent:v5 finalDestination:v9 destinationReason:v10];
  if (v60) {
    [(SBChainableModifierEventResponse *)v11 addChildResponse:v60];
  }
  v61 = [(SBContinuousExposeHomeGestureSwitcherModifier *)self _responseForSBEventGestureEndWithEvent:v5 finalDestination:v9];
  if (v61) {
    [(SBChainableModifierEventResponse *)v11 addChildResponse:v61];
  }

  return v11;
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
  [(SBContinuousExposeHomeGestureSwitcherModifier *)self _updateTranslationAdjustmentForGestureFromHomeScreenIfNeededWithEvent:v33];
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
  [(SBContinuousExposeHomeGestureSwitcherModifier *)self _distanceYToInSwitcherCardScale];
  double v19 = -v10 / v18;
  [(SBContinuousExposeHomeGestureSwitcherModifier *)self _gestureProgressToMaxTranslationForTranslation:v10];
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
    double v6 = 0.0;
    double v7 = fabs(self->_translation.x) * (0.0 - v5);
    [(SBContinuousExposeHomeGestureSwitcherModifier *)self containerViewBounds];
    double v9 = fmin(fmax(v5 + v7 / (v8 * 0.25), 0.0), 1.0);
    if (self->_inMultitasking) {
      double v10 = v9;
    }
    else {
      double v10 = 0.0;
    }
    if (BSFloatIsZero())
    {
      if (!self->_hasBecomeCoplanarSinceGestureFromSwitcherBegan)
      {
        self->_hasBecomeCoplanarSinceGestureFromSwitcherBegan = 1;
        self->_translationYWhenTriggeredMultitasking = self->_translation.y;
      }
    }
    else if (!self->_hasBecomeCoplanarSinceGestureFromSwitcherBegan)
    {
      double v6 = v10;
    }
    self->_stackedProgress = v6;
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
    double v5 = *(double *)&kHomeGestureNormalizedDistanceYThresholdForUnconditionalHome_1;
  }
  uint64_t v6 = kHomeGestureNormalizedDistanceYThresholdRangeForUnconditionalHome_1;
  [(SBContinuousExposeHomeGestureSwitcherModifier *)self containerViewBounds];
  double result = v5 * v7;
  if (self->_inMultitasking)
  {
    double v8 = 0.1;
    if (!scrunchInitiated) {
      double v8 = *(double *)&v6;
    }
    double v9 = result - v8 * v7;
    double result = result + v8 * v7;
    double v10 = 100.0 - self->_translationYWhenTriggeredMultitasking;
    if (v9 >= v10) {
      double v10 = v9;
    }
    if (result > v10) {
      return v10;
    }
  }
  return result;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x4010000000;
  v59 = &unk_1D90ED3C6;
  long long v60 = 0u;
  long long v61 = 0u;
  v55.receiver = self;
  v55.super_class = (Class)SBContinuousExposeHomeGestureSwitcherModifier;
  -[SBContinuousExposeHomeGestureSwitcherModifier frameForIndex:](&v55, sel_frameForIndex_);
  *(void *)&long long v60 = v5;
  *((void *)&v60 + 1) = v6;
  *(void *)&long long v61 = v7;
  *((void *)&v61 + 1) = v8;
  if ([(SBContinuousExposeHomeGestureSwitcherModifier *)self _isSelectedAppLayoutAtIndex:a3])
  {
    UIRectGetCenter();
    [(SBContinuousExposeHomeGestureSwitcherModifier *)self containerViewBounds];
    double v10 = v9;
    double v11 = [(SBContinuousExposeHomeGestureSwitcherModifier *)self appLayouts];
    double v12 = [v11 objectAtIndex:a3];
    [(SBContinuousExposeHomeGestureSwitcherModifier *)self _rangeForPerspectiveAngleProgressOfAppLayout:v12 outMin:0.0 outMax:v10];

    double v13 = (id *)MEMORY[0x1E4F43630];
    [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection];
    uint64_t v14 = [*v13 userInterfaceLayoutDirection];
    double x = self->_translation.x;
    uint64_t v16 = v57[4];
    uint64_t v17 = v57[5];
    uint64_t v18 = v57[6];
    uint64_t v19 = v57[7];
    if (v14 == 1)
    {
      if (x >= 0.0)
      {
        CGRectGetMaxX(*(CGRect *)&v16);
        [(SBContinuousExposeHomeGestureSwitcherModifier *)self scaleForIndex:a3];
      }
      else
      {
        CGRectGetMinX(*(CGRect *)&v16);
      }
      long long v53 = 0u;
      long long v54 = 0u;
      BYTE8(v53) = 1;
      BYTE8(v54) = 1;
      BSUIConstrainValueToIntervalWithRubberBand();
    }
    else
    {
      if (x <= 0.0)
      {
        CGRectGetMinX(*(CGRect *)&v16);
        [(SBContinuousExposeHomeGestureSwitcherModifier *)self scaleForIndex:a3];
      }
      else
      {
        CGRectGetMaxX(*(CGRect *)&v16);
      }
      long long v51 = 0u;
      long long v52 = 0u;
      BYTE8(v51) = 1;
      BYTE8(v52) = 1;
      BSUIConstrainValueToIntervalWithRubberBand();
    }
    SBUnintegralizedRectCenteredAboutPoint();
    goto LABEL_18;
  }
  if (self->_inMultitasking)
  {
    [(SBContinuousExposeHomeGestureSwitcherModifier *)self _rubberbandedTranslationForAdjacentCards];
    -[SBContinuousExposeHomeGestureSwitcherModifier _scaleForTranslation:](self, "_scaleForTranslation:");
    v50[4] = 0x3FE3333333333333;
    v50[6] = 0x3FF0000000000000;
    v50[5] = 1;
    v50[7] = 1;
    BSUIConstrainValueToIntervalWithRubberBand();
    double v21 = v20;
    -[SBAppSwitcherContinuousExposeSwitcherModifier setScaleFactor:](self->_appSwitcherModifier, "setScaleFactor:");
    [(SBAppSwitcherContinuousExposeSwitcherModifier *)self->_appSwitcherModifier setHorizontalEdgeSpacingScaleFactor:0.75 / v21];
    v50[0] = 0;
    v50[1] = v50;
    v50[2] = 0x2020000000;
    v50[3] = 0;
    appSwitcherModifier = self->_appSwitcherModifier;
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __63__SBContinuousExposeHomeGestureSwitcherModifier_frameForIndex___block_invoke;
    v49[3] = &unk_1E6AFFE90;
    v49[4] = self;
    v49[5] = &v56;
    v49[6] = v50;
    v49[7] = a3;
    [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:appSwitcherModifier usingBlock:v49];
    UIRectGetCenter();
    CGFloat v23 = (id *)MEMORY[0x1E4F43630];
    if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] != 1)
    {
      CGFloat v24 = [(SBContinuousExposeHomeGestureSwitcherModifier *)self scrollViewAttributes];
      [v24 contentSize];
    }
    [(SBContinuousExposeHomeGestureSwitcherModifier *)self containerViewBounds];
    [*v23 userInterfaceLayoutDirection];
    [(SBContinuousExposeHomeGestureSwitcherModifier *)self containerViewBounds];
    SBUnintegralizedRectCenteredAboutPoint();
    CGFloat v25 = v57;
    v57[4] = v26;
    v25[5] = v27;
    v25[6] = v28;
    v25[7] = v29;
    _Block_object_dispose(v50, 8);
    CGFloat v30 = (double *)v57;
  }
  else
  {
    arcSwipePulledStripAppLayout = self->_arcSwipePulledStripAppLayout;
    CGFloat v32 = [(SBContinuousExposeHomeGestureSwitcherModifier *)self appLayouts];
    id v33 = [v32 objectAtIndex:a3];
    LODWORD(arcSwipePulledStripAppLayout) = [(SBAppLayout *)arcSwipePulledStripAppLayout isEqual:v33];

    CGFloat v30 = (double *)v57;
    if (arcSwipePulledStripAppLayout)
    {
      UIRectGetCenter();
      double v34 = [(SBContinuousExposeHomeGestureSwitcherModifier *)self chamoisLayoutAttributes];
      [v34 stripWidth];
      double v36 = v35 / 1.2;

      [(SBContinuousExposeHomeGestureSwitcherModifier *)self _rangeForPerspectiveAngleProgressOfAppLayout:self->_arcSwipePulledStripAppLayout outMin:0.0 outMax:v36];
      [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection];
      BSUIConstrainValueToIntervalWithRubberBand();
      SBUnintegralizedRectCenteredAboutPoint();
LABEL_18:
      CGFloat v30 = (double *)v57;
      v57[4] = v37;
      *((void *)v30 + 5) = v38;
      *((void *)v30 + 6) = v39;
      *((void *)v30 + 7) = v40;
    }
  }
  double v41 = v30[4];
  double v42 = v30[5];
  double v43 = v30[6];
  double v44 = v30[7];
  _Block_object_dispose(&v56, 8);
  double v45 = v41;
  double v46 = v42;
  double v47 = v43;
  double v48 = v44;
  result.size.height = v48;
  result.size.width = v47;
  result.origin.double y = v46;
  result.origin.double x = v45;
  return result;
}

void __63__SBContinuousExposeHomeGestureSwitcherModifier_frameForIndex___block_invoke(void *a1)
{
  [*(id *)(a1[4] + 480) frameForIndex:a1[7]];
  uint64_t v2 = *(void **)(a1[5] + 8);
  v2[4] = v3;
  v2[5] = v4;
  v2[6] = v5;
  v2[7] = v6;
  id v8 = [*(id *)(a1[4] + 480) scrollViewAttributes];
  [v8 contentSize];
  *(void *)(*(void *)(a1[6] + 8) + 24) = v7;
}

- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withBounds:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v11 = a4;
  double v12 = v11;
  uint64_t v36 = 0;
  uint64_t v37 = (double *)&v36;
  uint64_t v38 = 0x4010000000;
  uint64_t v39 = &unk_1D90ED3C6;
  long long v40 = 0u;
  long long v41 = 0u;
  if (self->_inMultitasking && ([v11 isEqual:self->_selectedAppLayout] & 1) == 0)
  {
    appSwitcherModifier = self->_appSwitcherModifier;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __91__SBContinuousExposeHomeGestureSwitcherModifier_frameForLayoutRole_inAppLayout_withBounds___block_invoke;
    v28[3] = &unk_1E6AF63A8;
    CGFloat v30 = &v36;
    int64_t v31 = a3;
    v28[4] = self;
    id v29 = v12;
    double v32 = x;
    double v33 = y;
    double v34 = width;
    double v35 = height;
    [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:appSwitcherModifier usingBlock:v28];

    double v14 = v37[4];
    double v16 = v37[5];
    double v18 = v37[6];
    double v20 = v37[7];
  }
  else
  {
    v27.receiver = self;
    v27.super_class = (Class)SBContinuousExposeHomeGestureSwitcherModifier;
    -[SBContinuousExposeHomeGestureSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v27, sel_frameForLayoutRole_inAppLayout_withBounds_, a3, v12, x, y, width, height);
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v21 = v37;
    v37[4] = v13;
    v21[5] = v15;
    v21[6] = v17;
    v21[7] = v19;
  }
  _Block_object_dispose(&v36, 8);

  double v23 = v14;
  double v24 = v16;
  double v25 = v18;
  double v26 = v20;
  result.size.double height = v26;
  result.size.double width = v25;
  result.origin.double y = v24;
  result.origin.double x = v23;
  return result;
}

uint64_t __91__SBContinuousExposeHomeGestureSwitcherModifier_frameForLayoutRole_inAppLayout_withBounds___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 480), "frameForLayoutRole:inAppLayout:withBounds:", *(void *)(a1 + 56), *(void *)(a1 + 40), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  uint64_t v3 = *(void **)(*(void *)(a1 + 48) + 8);
  v3[4] = v4;
  v3[5] = v5;
  v3[6] = v6;
  v3[7] = v7;
  return result;
}

- (double)scaleForIndex:(unint64_t)a3
{
  uint64_t v20 = 0;
  double v21 = (double *)&v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  if ([(SBContinuousExposeHomeGestureSwitcherModifier *)self _isSelectedAppLayoutAtIndex:"_isSelectedAppLayoutAtIndex:"])
  {
    -[SBContinuousExposeHomeGestureSwitcherModifier _scaleForTranslation:](self, "_scaleForTranslation:", self->_translation.x, self->_translation.y);
    double v6 = v5;
    [(SBContinuousExposeHomeGestureSwitcherModifier *)self _rangeForPerspectiveAngleProgressOfAppLayout:self->_selectedAppLayout outMin:1.0 outMax:0.5];
    double v8 = v6 * v7;
    double v9 = v21;
  }
  else
  {
    if (self->_inMultitasking)
    {
      appSwitcherModifier = self->_appSwitcherModifier;
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __63__SBContinuousExposeHomeGestureSwitcherModifier_scaleForIndex___block_invoke;
      v19[3] = &unk_1E6AF6358;
      v19[4] = self;
      v19[5] = &v20;
      v19[6] = a3;
      [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:appSwitcherModifier usingBlock:v19];
      goto LABEL_8;
    }
    v18.receiver = self;
    v18.super_class = (Class)SBContinuousExposeHomeGestureSwitcherModifier;
    [(SBContinuousExposeHomeGestureSwitcherModifier *)&v18 scaleForIndex:a3];
    *((void *)v21 + 3) = v11;
    arcSwipePulledStripAppLayout = self->_arcSwipePulledStripAppLayout;
    double v13 = [(SBContinuousExposeHomeGestureSwitcherModifier *)self appLayouts];
    double v14 = [v13 objectAtIndex:a3];
    LODWORD(arcSwipePulledStripAppLayout) = [(SBAppLayout *)arcSwipePulledStripAppLayout isEqual:v14];

    if (!arcSwipePulledStripAppLayout) {
      goto LABEL_8;
    }
    [(SBContinuousExposeHomeGestureSwitcherModifier *)self _rangeForPerspectiveAngleProgressOfAppLayout:self->_arcSwipePulledStripAppLayout outMin:1.0 outMax:1.6];
    double v9 = v21;
    double v8 = v15 * v21[3];
  }
  v9[3] = v8;
LABEL_8:
  double v16 = v21[3];
  _Block_object_dispose(&v20, 8);
  return v16;
}

uint64_t __63__SBContinuousExposeHomeGestureSwitcherModifier_scaleForIndex___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 480) scaleForIndex:a1[6]];
  *(void *)(*(void *)(a1[5] + 8) + 24) = v3;
  return result;
}

- (double)perspectiveAngleForAppLayout:(id)a3
{
  id v4 = a3;
  if ([v4 isEqual:self->_selectedAppLayout])
  {
    [(SBContinuousExposeHomeGestureSwitcherModifier *)self containerViewBounds];
    [(SBContinuousExposeHomeGestureSwitcherModifier *)self _maxPerspectiveAngleForSelectedAppLayout];
    BSDegreesToRadians();
    double v6 = v5;
  }
  else
  {
    double v6 = 0.0;
    if (!self->_inMultitasking)
    {
      v28.receiver = self;
      v28.super_class = (Class)SBContinuousExposeHomeGestureSwitcherModifier;
      [(SBContinuousExposeHomeGestureSwitcherModifier *)&v28 perspectiveAngleForAppLayout:v4];
      double v6 = v8;
      double x = self->_translation.x;
      if (x != 0.0)
      {
        double v10 = (id *)MEMORY[0x1E4F43630];
        uint64_t v11 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection];
        double v12 = -x;
        if (v11 != 1) {
          double v12 = x;
        }
        if (v12 <= 0.0) {
          [(SBContinuousExposeHomeGestureSwitcherModifier *)self _previousRecentAppLayout];
        }
        else {
        double v13 = [(SBContinuousExposeHomeGestureSwitcherModifier *)self _nextRecentAppLayout];
        }
        objc_storeStrong((id *)&self->_arcSwipePulledStripAppLayout, v13);

        if ([(SBAppLayout *)self->_arcSwipePulledStripAppLayout isEqual:v4])
        {
          BSRadiansToDegrees();
          double v15 = v14;
          [(SBContinuousExposeHomeGestureSwitcherModifier *)self containerViewBounds];
          double v17 = fabs(self->_translation.x) - v16 / 6.0;
          double v18 = 0.0;
          if (v17 > 0.0) {
            double v18 = fmin(fmax(v17 / (v16 - v16 / 6.0) + 0.0, 0.0), 1.0);
          }
          uint64_t v19 = [*v10 userInterfaceLayoutDirection];
          double v20 = 1.0;
          if (v19 == 1) {
            double v20 = -1.0;
          }
          double v21 = v15 + v18 * -(v15 - v20 * 25.0);
          BSDegreesToRadians();
          double v6 = v22;
          if (fabs(v21) >= fabs(v15)) {
            uint64_t v23 = 0;
          }
          else {
            uint64_t v23 = v4;
          }
          id v24 = v23;
          if ((BSEqualObjects() & 1) == 0)
          {
            double v25 = [(SBContinuousExposeHomeGestureSwitcherModifier *)self switcherSettings];
            double v26 = [v25 animationSettings];
            objc_super v27 = [v26 arcSwipeSwitcherGlancingSettings];

            [(SBContinuousExposeHomeGestureSwitcherModifier *)self _beginAnimatingArcSwipePullingPropertyWithMode:3 settings:v27];
            objc_storeStrong((id *)&self->_arcSwipePulledStripAppLayout, v23);
          }
        }
      }
    }
  }

  return v6;
}

- (double)_rangeForPerspectiveAngleProgressOfAppLayout:(id)a3 outMin:(double)a4 outMax:(double)a5
{
  id v8 = a3;
  [(SBContinuousExposeHomeGestureSwitcherModifier *)self perspectiveAngleForAppLayout:v8];
  BSRadiansToDegrees();
  double v10 = v9;
  char v11 = [v8 isEqual:self->_selectedAppLayout];
  double v12 = 0.0;
  double v13 = (id *)MEMORY[0x1E4F43630];
  if ((v11 & 1) == 0)
  {
    [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection];
    double v14 = [(SBContinuousExposeHomeGestureSwitcherModifier *)self chamoisLayoutAttributes];
    [v14 stripTiltAngle];
    BSRadiansToDegrees();
    double v12 = v15;
  }
  if ([v8 isEqual:self->_selectedAppLayout])
  {
    [(SBContinuousExposeHomeGestureSwitcherModifier *)self _maxPerspectiveAngleForSelectedAppLayout];
  }
  else
  {
    uint64_t v17 = [*v13 userInterfaceLayoutDirection];
    double v16 = 25.0;
    if (v17 == 1) {
      double v16 = -25.0;
    }
  }
  double v18 = (a5 - a4) * (v10 - v12) / (v16 - v12) + a4;

  return v18;
}

- (double)_maxPerspectiveAngleForSelectedAppLayout
{
  uint64_t v3 = (id *)MEMORY[0x1E4F43630];
  uint64_t v4 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection];
  double x = self->_translation.x;
  uint64_t v6 = [*v3 userInterfaceLayoutDirection];
  double v7 = -x;
  if (v6 != 1) {
    double v7 = x;
  }
  BOOL v8 = v7 <= 0.0;
  double result = 45.0;
  if (v8) {
    double result = 23.0;
  }
  if (v4 == 1) {
    return -result;
  }
  return result;
}

- (CGPoint)anchorPointForIndex:(unint64_t)a3
{
  uint64_t v15 = 0;
  double v16 = (double *)&v15;
  uint64_t v17 = 0x3010000000;
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  double v18 = &unk_1D90ED3C6;
  if (self->_inMultitasking
    && ![(SBContinuousExposeHomeGestureSwitcherModifier *)self _isSelectedAppLayoutAtIndex:a3])
  {
    appSwitcherModifier = self->_appSwitcherModifier;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __69__SBContinuousExposeHomeGestureSwitcherModifier_anchorPointForIndex___block_invoke;
    v14[3] = &unk_1E6AF6358;
    v14[4] = self;
    v14[5] = &v15;
    v14[6] = a3;
    [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:appSwitcherModifier usingBlock:v14];
    double v6 = v16[4];
    double v8 = v16[5];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SBContinuousExposeHomeGestureSwitcherModifier;
    [(SBContinuousExposeHomeGestureSwitcherModifier *)&v13 anchorPointForIndex:a3];
    double v6 = v5;
    double v8 = v7;
    double v9 = v16;
    v16[4] = v5;
    v9[5] = v7;
  }
  _Block_object_dispose(&v15, 8);
  double v11 = v6;
  double v12 = v8;
  result.double y = v12;
  result.double x = v11;
  return result;
}

uint64_t __69__SBContinuousExposeHomeGestureSwitcherModifier_anchorPointForIndex___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 480) anchorPointForIndex:a1[6]];
  uint64_t v3 = *(void *)(a1[5] + 8);
  *(void *)(v3 + 32) = v4;
  *(void *)(v3 + 40) = v5;
  return result;
}

- (BOOL)shouldPinLayoutRolesToSpace:(unint64_t)a3
{
  uint64_t v5 = [(SBContinuousExposeHomeGestureSwitcherModifier *)self appLayouts];
  double v6 = [v5 objectAtIndex:a3];

  double v7 = [(SBContinuousExposeHomeGestureSwitcherModifier *)self selectedAppLayout];
  char v8 = [v6 isOrContainsAppLayout:v7];

  if (v8)
  {
    BOOL v9 = 1;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SBContinuousExposeHomeGestureSwitcherModifier;
    BOOL v9 = [(SBContinuousExposeHomeGestureSwitcherModifier *)&v11 shouldPinLayoutRolesToSpace:a3];
  }

  return v9;
}

- (BOOL)shouldUseAnchorPointToPinLayoutRolesToSpace:(unint64_t)a3
{
  uint64_t v5 = [(SBContinuousExposeHomeGestureSwitcherModifier *)self appLayouts];
  double v6 = [v5 objectAtIndex:a3];

  double v7 = [(SBContinuousExposeHomeGestureSwitcherModifier *)self selectedAppLayout];
  char v8 = [v6 isOrContainsAppLayout:v7];

  if (v8)
  {
    BOOL v9 = 1;
  }
  else if (self->_gestureHasEnded || !self->_inMultitasking)
  {
    v11.receiver = self;
    v11.super_class = (Class)SBContinuousExposeHomeGestureSwitcherModifier;
    BOOL v9 = [(SBContinuousExposeHomeGestureSwitcherModifier *)&v11 shouldUseAnchorPointToPinLayoutRolesToSpace:a3];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (CGPoint)adjustedSpaceAccessoryViewAnchorPoint:(CGPoint)a3 forAppLayout:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  uint64_t v22 = 0;
  uint64_t v23 = (double *)&v22;
  uint64_t v24 = 0x3010000000;
  uint64_t v26 = 0;
  uint64_t v27 = 0;
  double v25 = &unk_1D90ED3C6;
  if (self->_inMultitasking && ![(SBAppLayout *)self->_selectedAppLayout isEqual:v7])
  {
    appSwitcherModifier = self->_appSwitcherModifier;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __100__SBContinuousExposeHomeGestureSwitcherModifier_adjustedSpaceAccessoryViewAnchorPoint_forAppLayout___block_invoke;
    v17[3] = &unk_1E6AF63F8;
    uint64_t v19 = &v22;
    v17[4] = self;
    double v20 = x;
    double v21 = y;
    id v18 = v7;
    [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:appSwitcherModifier usingBlock:v17];

    double v9 = v23[4];
    double v11 = v23[5];
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)SBContinuousExposeHomeGestureSwitcherModifier;
    -[SBContinuousExposeHomeGestureSwitcherModifier adjustedSpaceAccessoryViewAnchorPoint:forAppLayout:](&v16, sel_adjustedSpaceAccessoryViewAnchorPoint_forAppLayout_, v7, x, y);
    double v9 = v8;
    double v11 = v10;
    double v12 = v23;
    v23[4] = v8;
    v12[5] = v10;
  }
  _Block_object_dispose(&v22, 8);

  double v14 = v9;
  double v15 = v11;
  result.double y = v15;
  result.double x = v14;
  return result;
}

uint64_t __100__SBContinuousExposeHomeGestureSwitcherModifier_adjustedSpaceAccessoryViewAnchorPoint_forAppLayout___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 480), "adjustedSpaceAccessoryViewAnchorPoint:forAppLayout:", *(void *)(a1 + 40), *(double *)(a1 + 56), *(double *)(a1 + 64));
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  *(void *)(v3 + 32) = v4;
  *(void *)(v3 + 40) = v5;
  return result;
}

- (id)continuousExposeIdentifiersInSwitcher
{
  uint64_t v8 = 0;
  double v9 = &v8;
  uint64_t v10 = 0x3032000000;
  double v11 = __Block_byref_object_copy__99;
  double v12 = __Block_byref_object_dispose__99;
  v7.receiver = self;
  v7.super_class = (Class)SBContinuousExposeHomeGestureSwitcherModifier;
  id v13 = [(SBContinuousExposeHomeGestureSwitcherModifier *)&v7 continuousExposeIdentifiersInSwitcher];
  if (self->_inMultitasking && self->_selectedAppLayout)
  {
    appSwitcherModifier = self->_appSwitcherModifier;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __86__SBContinuousExposeHomeGestureSwitcherModifier_continuousExposeIdentifiersInSwitcher__block_invoke;
    v6[3] = &unk_1E6AF4B88;
    v6[4] = self;
    v6[5] = &v8;
    [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:appSwitcherModifier usingBlock:v6];
  }
  id v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

void __86__SBContinuousExposeHomeGestureSwitcherModifier_continuousExposeIdentifiersInSwitcher__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = (void *)v2[60];
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v8 = [v2 continuousExposeIdentifiersInStrip];
  uint64_t v5 = [v3 adjustedContinuousExposeIdentifiersInSwitcherFromPreviousIdentifiersInSwitcher:v4 identifiersInStrip:v8];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  objc_super v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)appLayoutsForContinuousExposeIdentifier:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBContinuousExposeHomeGestureSwitcherModifier;
  uint64_t v5 = [(SBContinuousExposeHomeGestureSwitcherModifier *)&v11 appLayoutsForContinuousExposeIdentifier:v4];
  uint64_t v6 = v5;
  if (self->_inMultitasking && (unint64_t)[v5 count] >= 2)
  {
    objc_super v7 = [(SBAppLayout *)self->_selectedAppLayout continuousExposeIdentifier];
    int v8 = [v7 isEqualToString:v4];

    if (v8)
    {
      double v9 = [MEMORY[0x1E4F1CA48] arrayWithArray:v6];
      [v9 removeObject:self->_selectedAppLayout];
      [v9 addObject:self->_selectedAppLayout];

      uint64_t v6 = v9;
    }
  }

  return v6;
}

- (id)topMostLayoutElements
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000;
  objc_super v28 = __Block_byref_object_copy__99;
  id v29 = __Block_byref_object_dispose__99;
  id v30 = 0;
  if ([(SBContinuousExposeHomeGestureSwitcherModifier *)self isShowingOrAnimatingCardsForFlyIn])
  {
    appSwitcherModifier = self->_appSwitcherModifier;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __70__SBContinuousExposeHomeGestureSwitcherModifier_topMostLayoutElements__block_invoke;
    v24[3] = &unk_1E6AF4B88;
    v24[4] = self;
    v24[5] = &v25;
    [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:appSwitcherModifier usingBlock:v24];
  }
  else
  {
    id v4 = (void *)MEMORY[0x1E4F1CA48];
    v23.receiver = self;
    v23.super_class = (Class)SBContinuousExposeHomeGestureSwitcherModifier;
    uint64_t v5 = [(SBContinuousExposeHomeGestureSwitcherModifier *)&v23 topMostLayoutElements];
    uint64_t v6 = [v4 arrayWithArray:v5];
    objc_super v7 = (void *)v26[5];
    v26[5] = v6;
  }
  if (self->_arcSwipePulledStripAppLayout || self->_arcSwipePullingChangedProperty)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v8 = (id)v26[5];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v31 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(v8);
          }
          double v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          uint64_t v13 = objc_opt_class();
          double v14 = SBSafeCast(v13, v12);
          double v15 = v14;
          if (v14 && objc_msgSend(v14, "isEqual:", self->_arcSwipePulledStripAppLayout, (void)v19))
          {
            [(id)v26[5] removeObject:v15];
            [(id)v26[5] insertObject:v15 atIndex:0];

            goto LABEL_17;
          }
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v31 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_17:
  }
  selectedAppLayout = self->_selectedAppLayout;
  if (selectedAppLayout) {
    [(id)v26[5] insertObject:selectedAppLayout atIndex:0];
  }
  id v17 = (id)v26[5];
  _Block_object_dispose(&v25, 8);

  return v17;
}

void __70__SBContinuousExposeHomeGestureSwitcherModifier_topMostLayoutElements__block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1CA48];
  id v6 = [*(id *)(*(void *)(a1 + 32) + 480) topMostLayoutElements];
  uint64_t v3 = [v2 arrayWithArray:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x4010000000;
  uint64_t v32 = &unk_1D90ED3C6;
  long long v33 = 0u;
  long long v34 = 0u;
  if ([(SBContinuousExposeHomeGestureSwitcherModifier *)self _isSelectedAppLayoutAtIndex:"_isSelectedAppLayoutAtIndex:"])
  {
    uint64_t v5 = [(SBContinuousExposeHomeGestureSwitcherModifier *)self switcherSettings];
    id v6 = [(SBContinuousExposeHomeGestureSwitcherModifier *)self chamoisLayoutAttributes];
    [(SBContinuousExposeHomeGestureSwitcherModifier *)self displayCornerRadius];
    [v6 stageCornerRadii];
    objc_super v7 = [v5 chamoisSettings];
    [v7 switcherCornerRadius];

    if (self->_startingEnvironmentMode != 1
      && [(SBContinuousExposeHomeGestureSwitcherModifier *)self appLayoutContainsAnUnoccludedMaximizedDisplayItem:self->_selectedAppLayout])
    {
      BSFloatIsZero();
    }
    [(SBContinuousExposeHomeGestureSwitcherModifier *)self scaleForIndex:a3];
    SBRectCornerRadiiForRadius();
    id v8 = v30;
    v30[4] = v9;
    v8[5] = v10;
    v8[6] = v11;
    v8[7] = v12;
  }
  else if (self->_inMultitasking)
  {
    appSwitcherModifier = self->_appSwitcherModifier;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __69__SBContinuousExposeHomeGestureSwitcherModifier_cornerRadiiForIndex___block_invoke;
    v28[3] = &unk_1E6AF6358;
    v28[4] = self;
    void v28[5] = &v29;
    v28[6] = a3;
    [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:appSwitcherModifier usingBlock:v28];
  }
  else
  {
    v27.receiver = self;
    v27.super_class = (Class)SBContinuousExposeHomeGestureSwitcherModifier;
    [(SBContinuousExposeHomeGestureSwitcherModifier *)&v27 cornerRadiiForIndex:a3];
    double v14 = v30;
    v30[4] = v15;
    v14[5] = v16;
    v14[6] = v17;
    void v14[7] = v18;
  }
  double v19 = *((double *)v30 + 4);
  double v20 = *((double *)v30 + 5);
  double v21 = *((double *)v30 + 6);
  double v22 = *((double *)v30 + 7);
  _Block_object_dispose(&v29, 8);
  double v23 = v19;
  double v24 = v20;
  double v25 = v21;
  double v26 = v22;
  result.topRight = v26;
  result.bottomRight = v25;
  result.bottomLeft = v24;
  result.topLeft = v23;
  return result;
}

uint64_t __69__SBContinuousExposeHomeGestureSwitcherModifier_cornerRadiiForIndex___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 480) cornerRadiiForIndex:a1[6]];
  uint64_t v3 = *(void **)(a1[5] + 8);
  v3[4] = v4;
  v3[5] = v5;
  v3[6] = v6;
  v3[7] = v7;
  return result;
}

- (int64_t)shadowStyleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 5;
}

- (SBSwitcherWallpaperGradientAttributes)wallpaperGradientAttributesForIndex:(unint64_t)a3
{
  if ([(SBContinuousExposeHomeGestureSwitcherModifier *)self _isSelectedAppLayoutAtIndex:"_isSelectedAppLayoutAtIndex:"]|| (v6 = 0.0, double v5 = 0.0, !self->_inMultitasking))
  {
    uint64_t v7 = [(SBContinuousExposeHomeGestureSwitcherModifier *)self appLayouts];
    id v8 = [v7 objectAtIndex:a3];
    char v9 = [v8 isEqual:self->_arcSwipePulledStripAppLayout];

    double v6 = 0.0;
    double v5 = 0.0;
    if ((v9 & 1) == 0)
    {
      v10.receiver = self;
      v10.super_class = (Class)SBContinuousExposeHomeGestureSwitcherModifier;
      -[SBContinuousExposeHomeGestureSwitcherModifier wallpaperGradientAttributesForIndex:](&v10, sel_wallpaperGradientAttributesForIndex_, a3, 0.0, 0.0);
    }
  }
  result.trailingAlphdouble a = v6;
  result.leadingAlphdouble a = v5;
  return result;
}

- (double)dimmingAlphaForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  if (([v6 isEqual:self->_selectedAppLayout] & 1) != 0 || (double v7 = 0.0, !self->_inMultitasking))
  {
    double v7 = 0.0;
    if (([v6 isEqual:self->_arcSwipePulledStripAppLayout] & 1) == 0)
    {
      v10.receiver = self;
      v10.super_class = (Class)SBContinuousExposeHomeGestureSwitcherModifier;
      [(SBContinuousExposeHomeGestureSwitcherModifier *)&v10 dimmingAlphaForLayoutRole:a3 inAppLayout:v6];
      double v7 = v8;
      if (BSFloatIsZero()) {
        double v7 = v7 * self->_stackedProgress + 0.0;
      }
    }
  }

  return v7;
}

- (id)visibleAppLayouts
{
  uint64_t v3 = +[SBSetupManager sharedInstance];
  int v4 = [v3 isInSetupMode];

  if (v4)
  {
    if (self->_selectedAppLayout) {
      [MEMORY[0x1E4F1CAD0] setWithObjects:0];
    }
    else {
    id v6 = [MEMORY[0x1E4F1CAD0] set];
    }
  }
  else
  {
    v42.receiver = self;
    v42.super_class = (Class)SBContinuousExposeHomeGestureSwitcherModifier;
    double v5 = [(SBContinuousExposeHomeGestureSwitcherModifier *)&v42 visibleAppLayouts];
    id v6 = (void *)[v5 mutableCopy];

    if (self->_selectedAppLayout) {
      objc_msgSend(v6, "addObject:");
    }
    unint64_t v7 = [(SBContinuousExposeHomeGestureSwitcherModifier *)self _selectedAppLayoutIndex];
    if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
      unint64_t v8 = 0;
    }
    else {
      unint64_t v8 = v7;
    }
    char v9 = [(SBContinuousExposeHomeGestureSwitcherModifier *)self appLayouts];
    objc_super v10 = v9;
    if ((self->_shouldResignActive || self->_inMultitasking || self->_startingEnvironmentMode == 2)
      && [v9 count])
    {
      if (self->_inMultitasking || (uint64_t v11 = self->_startingEnvironmentMode != 1, (BSFloatIsZero() & 1) == 0))
      {
        [(SBContinuousExposeHomeGestureSwitcherModifier *)self containerViewBounds];
        double v14 = v13;
        double v40 = v13;
        [(SBContinuousExposeHomeGestureSwitcherModifier *)self _rubberbandedTranslationForAdjacentCards];
        -[SBContinuousExposeHomeGestureSwitcherModifier _scaleForTranslation:](self, "_scaleForTranslation:");
        double v16 = v15;
        [(SBContinuousExposeHomeGestureSwitcherModifier *)self _coplanarSpacing];
        double v18 = v16 * v17;
        double v19 = v16 * v17 + v14 * v16;
        [(SBContinuousExposeHomeGestureSwitcherModifier *)self frameForIndex:v8];
        CGFloat v21 = v20;
        CGFloat v23 = v22;
        CGFloat v25 = v24;
        CGFloat v27 = v26;
        UIRectGetCenter();
        -[SBContinuousExposeHomeGestureSwitcherModifier _scaleForTranslation:](self, "_scaleForTranslation:", self->_translation.x, self->_translation.y);
        CGAffineTransformMakeScale(&v41, v28, v28);
        v44.origin.double x = v21;
        v44.origin.double y = v23;
        v44.size.double width = v25;
        v44.size.double height = v27;
        CGRectApplyAffineTransform(v44, &v41);
        SBUnintegralizedRectCenteredAboutPoint();
        double v30 = v29 - v18;
        double v32 = v40 - (v29 + v31) - v18;
        if ([(SBContinuousExposeHomeGestureSwitcherModifier *)self isRTLEnabled]) {
          double v33 = v32;
        }
        else {
          double v33 = v30;
        }
        uint64_t v11 = vcvtpd_s64_f64(v33 / v19);
        if ([(SBContinuousExposeHomeGestureSwitcherModifier *)self isRTLEnabled]) {
          double v34 = v30;
        }
        else {
          double v34 = v32;
        }
        uint64_t v12 = vcvtpd_s64_f64(v34 / v19);
        if (v12 <= 1) {
          uint64_t v12 = 1;
        }
        if (v11 <= 1) {
          uint64_t v11 = 1;
        }
      }
      else
      {
        uint64_t v12 = 1;
      }
      unint64_t v35 = (v8 - v12) & ~((uint64_t)(v8 - v12) >> 63);
      unint64_t v36 = v11 + v8;
      uint64_t v37 = [v10 count];
      if (v36 >= v37 - 1) {
        unint64_t v36 = v37 - 1;
      }
      if (v35 < [v10 count] && (v36 & 0x8000000000000000) == 0)
      {
        uint64_t v38 = objc_msgSend(v10, "subarrayWithRange:", v35, v36 - v35 + 1);
        [v6 addObjectsFromArray:v38];
      }
    }
  }
  return v6;
}

- (id)appLayoutToScrollToBeforeTransitioning
{
  return 0;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBContinuousExposeHomeGestureSwitcherModifier;
  double v5 = [(SBGestureSwitcherModifier *)&v12 animationAttributesForLayoutElement:v4];
  if (![v4 switcherLayoutElementType])
  {
    id v6 = (void *)[v5 mutableCopy];
    unint64_t v7 = [v5 layoutSettings];
    unint64_t v8 = [(SBContinuousExposeHomeGestureSwitcherModifier *)self _layoutSettingsForAppLayout:v4 layoutSettings:v7];
    [v6 setLayoutSettings:v8];

    char v9 = [v6 opacitySettings];
    [v6 setOpacitySettings:v9];

    objc_super v10 = [(SBContinuousExposeHomeGestureSwitcherModifier *)self _cornerRadiusSettings];
    [v6 setCornerRadiusSettings:v10];

    double v5 = v6;
  }

  return v5;
}

- (id)_cornerRadiusSettings
{
  uint64_t v2 = [(SBContinuousExposeHomeGestureSwitcherModifier *)self switcherSettings];
  uint64_t v3 = [v2 animationSettings];
  id v4 = [v3 appToSwitcherCornerRadiusSettings];

  return v4;
}

- (id)_layoutSettingsForAppLayout:(id)a3 layoutSettings:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(SBAppLayout *)self->_selectedAppLayout isEqual:v6])
  {
    id v8 = v7;
  }
  else if (-[SBContinuousExposeHomeGestureSwitcherModifier isShowingOrAnimatingCardsForFlyIn](self, "isShowingOrAnimatingCardsForFlyIn")|| self->_arcSwipePullingChangedProperty|| [v6 isEqual:self->_arcSwipePulledStripAppLayout])
  {
    char v9 = [(SBContinuousExposeHomeGestureSwitcherModifier *)self switcherSettings];
    objc_super v10 = [v9 animationSettings];
    id v8 = [v10 arcSwipeSwitcherGlancingSettings];
  }
  else
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4FA5F08]);
    [v8 setDefaultValues];
    [v8 setTrackingResponse:0.0];
    CAFrameRateRange v13 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
    objc_msgSend(v8, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v13.minimum, *(double *)&v13.maximum, *(double *)&v13.preferred);
  }

  return v8;
}

- (double)_scaleForTranslation:(CGPoint)a3
{
  if (self->_scrunchInitiated)
  {
    double x = self->_translationWithoutScale.x;
    double y = self->_translationWithoutScale.y;
    [(SBContinuousExposeHomeGestureSwitcherModifier *)self containerViewBounds];
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
  [(SBContinuousExposeHomeGestureSwitcherModifier *)self _gestureProgressToMaxTranslationForTranslation:v9];
  double v11 = v10;
  int64_t startingEnvironmentMode = self->_startingEnvironmentMode;
  if (startingEnvironmentMode == 1)
  {
    [(SBContinuousExposeHomeGestureSwitcherModifier *)self _switcherCardScale];
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
    [(SBContinuousExposeHomeGestureSwitcherModifier *)self _switcherCardScale];
    double v18 = progressToInSwitcherCardScale * (v17 + -1.0) + 1.0;
  }
  else
  {
    double v19 = 1.0;
    if (v15 == 2) {
      [(SBContinuousExposeHomeGestureSwitcherModifier *)self _switcherCardScale];
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
      CGFloat v23 = [(SBContinuousExposeHomeGestureSwitcherModifier *)self switcherSettings];
      [v23 offscreenCardScaleForFlyIn];
    }
    BSUIConstrainValueToIntervalWithRubberBand();
    return v24;
  }
  return v18;
}

- (double)_scaleForOffscreenAdjacentCardsForFlyIn
{
  uint64_t v3 = [(SBContinuousExposeHomeGestureSwitcherModifier *)self switcherSettings];
  [v3 offscreenCardScaleForFlyIn];
  double v5 = v4;
  -[SBContinuousExposeHomeGestureSwitcherModifier _scaleForTranslation:](self, "_scaleForTranslation:", self->_translation.x, self->_translation.y);
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
    [(SBContinuousExposeHomeGestureSwitcherModifier *)self unconditionalDistanceThresholdForHome];
    double translationYWhenTriggeredMultitasking = self->_translationYWhenTriggeredMultitasking;
    if (translationYWhenTriggeredMultitasking > 100.0 - v5) {
      double translationYWhenTriggeredMultitasking = 100.0 - v5;
    }
    double v7 = y;
    if (y < translationYWhenTriggeredMultitasking) {
      double v7 = translationYWhenTriggeredMultitasking
    }
         + (1.0
          - ((translationYWhenTriggeredMultitasking - y) / (v5 + translationYWhenTriggeredMultitasking) * 2.0 + -1.0)
          * ((translationYWhenTriggeredMultitasking - y) / (v5 + translationYWhenTriggeredMultitasking) * 2.0 + -1.0))
         * -0.25
         * (v5 + translationYWhenTriggeredMultitasking);
    [(SBContinuousExposeHomeGestureSwitcherModifier *)self containerViewBounds];
    double y = v7 + (y - v7) * fmin(fmax(fabs(x) / (v8 * 0.25) + 0.0, 0.0), 1.0);
  }
  double v9 = x;
  double v10 = y;
  result.double y = v10;
  result.double x = v9;
  return result;
}

- (BOOL)isHomeAffordanceSupportedForAppLayout:(id)a3
{
  return 0;
}

- (id)visibleHomeAffordanceLayoutElements
{
  return (id)[MEMORY[0x1E4F1CAD0] set];
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  return 1.0;
}

- (double)wallpaperOverlayAlphaForIndex:(unint64_t)a3
{
  double stackedProgress = self->_stackedProgress;
  v6.receiver = self;
  v6.super_class = (Class)SBContinuousExposeHomeGestureSwitcherModifier;
  [(SBContinuousExposeHomeGestureSwitcherModifier *)&v6 wallpaperOverlayAlphaForIndex:a3];
  return stackedProgress * v4 + 0.0;
}

- (double)lighteningAlphaForIndex:(unint64_t)a3
{
  double stackedProgress = self->_stackedProgress;
  v6.receiver = self;
  v6.super_class = (Class)SBContinuousExposeHomeGestureSwitcherModifier;
  [(SBContinuousExposeHomeGestureSwitcherModifier *)&v6 lighteningAlphaForIndex:a3];
  return stackedProgress * v4 + 0.0;
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
    v5.super_class = (Class)SBContinuousExposeHomeGestureSwitcherModifier;
    -[SBContinuousExposeHomeGestureSwitcherModifier shadowOpacityForLayoutRole:atIndex:](&v5, sel_shadowOpacityForLayoutRole_atIndex_, a3, a4, 1.0);
  }
  return result;
}

- (double)homeScreenAlpha
{
  if (self->_startingEnvironmentMode == 1)
  {
    if (!self->_inMultitasking)
    {
      v11.receiver = self;
      v11.super_class = (Class)SBContinuousExposeHomeGestureSwitcherModifier;
      [(SBContinuousExposeHomeGestureSwitcherModifier *)&v11 homeScreenAlpha];
      return result;
    }
  }
  else if (![(SBContinuousExposeHomeGestureSwitcherModifier *)self homeScreenHasOpenFolder]|| [(SBContinuousExposeHomeGestureSwitcherModifier *)self homeScreenBackdropBlurType] == 3)
  {
    double progressToMaxTranslation = self->_progressToMaxTranslation;
    toHomeScreenAlphdouble a = self->_toHomeScreenAlpha;
    v10.receiver = self;
    v10.super_class = (Class)SBContinuousExposeHomeGestureSwitcherModifier;
    [(SBContinuousExposeHomeGestureSwitcherModifier *)&v10 homeScreenAlpha];
    double v7 = progressToMaxTranslation * (toHomeScreenAlpha - v6);
    v9.receiver = self;
    v9.super_class = (Class)SBContinuousExposeHomeGestureSwitcherModifier;
    [(SBContinuousExposeHomeGestureSwitcherModifier *)&v9 homeScreenAlpha];
    return v7 + v8;
  }
  return self->_toHomeScreenAlpha;
}

- (double)homeScreenScale
{
  v9.receiver = self;
  v9.super_class = (Class)SBContinuousExposeHomeGestureSwitcherModifier;
  [(SBContinuousExposeHomeGestureSwitcherModifier *)&v9 homeScreenScale];
  if (self->_startingEnvironmentMode == 1)
  {
    double y = self->_translation.y;
    [(SBContinuousExposeHomeGestureSwitcherModifier *)self containerViewBounds];
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
  v9.super_class = (Class)SBContinuousExposeHomeGestureSwitcherModifier;
  [(SBContinuousExposeHomeGestureSwitcherModifier *)&v9 wallpaperScale];
  double v4 = v3;
  if (self->_startingEnvironmentMode == 1 && self->_inMultitasking)
  {
    double v5 = [(SBContinuousExposeHomeGestureSwitcherModifier *)self switcherSettings];
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
        v12.super_class = (Class)SBContinuousExposeHomeGestureSwitcherModifier;
        [(SBContinuousExposeHomeGestureSwitcherModifier *)&v12 homeScreenDimmingAlpha];
      }
    }
    else
    {
      double progressToMaxTranslation = self->_progressToMaxTranslation;
      toHomeScreenDimmingAlphdouble a = self->_toHomeScreenDimmingAlpha;
      v11.receiver = self;
      v11.super_class = (Class)SBContinuousExposeHomeGestureSwitcherModifier;
      [(SBContinuousExposeHomeGestureSwitcherModifier *)&v11 homeScreenDimmingAlpha];
      double v7 = progressToMaxTranslation * (toHomeScreenDimmingAlpha - v6);
      v10.receiver = self;
      v10.super_class = (Class)SBContinuousExposeHomeGestureSwitcherModifier;
      [(SBContinuousExposeHomeGestureSwitcherModifier *)&v10 homeScreenDimmingAlpha];
      double result = v7 + v8;
      if (result < 0.2) {
        return 0.2;
      }
    }
  }
  else
  {
    [(SBContinuousExposeHomeGestureSwitcherModifier *)&v9 homeScreenDimmingAlpha];
  }
  return result;
}

- (int64_t)homeScreenBackdropBlurType
{
  if (self->_startingEnvironmentMode == 1
    || ![(SBContinuousExposeHomeGestureSwitcherModifier *)self homeScreenHasOpenFolder]|| SBFEffectiveHomeButtonType() == 2)
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
      v16.receiver = self;
      v16.super_class = (Class)SBContinuousExposeHomeGestureSwitcherModifier;
      [(SBContinuousExposeHomeGestureSwitcherModifier *)&v16 homeScreenBackdropBlurProgress];
      double toHomeScreenBlurProgress = v9;
    }
  }
  else
  {
    if ([(SBContinuousExposeHomeGestureSwitcherModifier *)self homeScreenHasOpenFolder]&& [(SBContinuousExposeHomeGestureSwitcherModifier *)self homeScreenBackdropBlurType] != 3)
    {
      double toHomeScreenBlurProgress = self->_toHomeScreenBlurProgress;
    }
    else
    {
      double progressToMaxTranslation = self->_progressToMaxTranslation;
      double v5 = self->_toHomeScreenBlurProgress;
      v15.receiver = self;
      v15.super_class = (Class)SBContinuousExposeHomeGestureSwitcherModifier;
      [(SBContinuousExposeHomeGestureSwitcherModifier *)&v15 homeScreenBackdropBlurProgress];
      double v7 = progressToMaxTranslation * (v5 - v6);
      v14.receiver = self;
      v14.super_class = (Class)SBContinuousExposeHomeGestureSwitcherModifier;
      [(SBContinuousExposeHomeGestureSwitcherModifier *)&v14 homeScreenBackdropBlurProgress];
      double toHomeScreenBlurProgress = v7 + v8;
    }
    objc_super v10 = [(SBContinuousExposeHomeGestureSwitcherModifier *)self switcherSettings];
    objc_super v11 = [v10 chamoisSettings];
    if ([v11 blurWallpaperInApps])
    {
      int64_t startingEnvironmentMode = self->_startingEnvironmentMode;

      if (startingEnvironmentMode == 3 && toHomeScreenBlurProgress < 0.5) {
        double toHomeScreenBlurProgress = 0.5;
      }
    }
    else
    {
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
      uint64_t v2 = [(SBContinuousExposeHomeGestureSwitcherModifier *)self appLayouts];
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
    v5.super_class = (Class)SBContinuousExposeHomeGestureSwitcherModifier;
    return [(SBContinuousExposeHomeGestureSwitcherModifier *)&v5 isContainerStatusBarVisible];
  }
  return v3;
}

- (BOOL)isContentStatusBarVisibleForIndex:(unint64_t)a3
{
  return ![(SBContinuousExposeHomeGestureSwitcherModifier *)self _shouldResignActiveBasedOnCardScale];
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
  BOOL v3 = [(SBContinuousExposeHomeGestureSwitcherModifier *)self appLayouts];
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
    double v7 = [(SBContinuousExposeHomeGestureSwitcherModifier *)self switcherSettings];
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
  BOOL v3 = [(SBContinuousExposeHomeGestureSwitcherModifier *)self appLayouts];
  if (!self->_selectedAppLayout) {
    goto LABEL_4;
  }
  uint64_t v4 = [(SBContinuousExposeHomeGestureSwitcherModifier *)self appLayouts];
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
    uint64_t v4 = [(SBContinuousExposeHomeGestureSwitcherModifier *)self appLayouts];
    NSUInteger v5 = [v3 setWithArray:v4];
    NSUInteger v6 = [v2 dictionaryWithObject:v5 forKey:&unk_1F334B2E8];
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)SBContinuousExposeHomeGestureSwitcherModifier;
    NSRange v7 = [(SBContinuousExposeHomeGestureSwitcherModifier *)&v20 appLayoutsToResignActive];
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
          objc_super v14 = [*(id *)(*((void *)&v16 + 1) + 8 * i) allObjects];
          [v8 addObjectsFromArray:v14];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v11);
    }

    NSUInteger v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v8 forKey:&unk_1F334B2E8];
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
    v4.super_class = (Class)SBContinuousExposeHomeGestureSwitcherModifier;
    uint64_t v2 = [(SBContinuousExposeHomeGestureSwitcherModifier *)&v4 keyboardSuppressionMode];
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
    v5.super_class = (Class)SBContinuousExposeHomeGestureSwitcherModifier;
    unsigned int v3 = [(SBContinuousExposeHomeGestureSwitcherModifier *)&v5 asyncRenderingAttributesForAppLayout:a3] & 1;
  }
  return (SBSwitcherAsyncRenderingAttributes)SBSwitcherAsyncRenderingAttributesMake(v3, 1);
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
  uint64_t v10 = __65__SBContinuousExposeHomeGestureSwitcherModifier_debugDescription__block_invoke;
  uint64_t v11 = &unk_1E6AF5290;
  id v12 = v3;
  double v13 = self;
  id v5 = v3;
  [v5 appendBodySectionWithName:0 multilinePrefix:@"\t" block:&v8];
  NSUInteger v6 = objc_msgSend(v5, "build", v8, v9, v10, v11);

  return (NSString *)v6;
}

id __65__SBContinuousExposeHomeGestureSwitcherModifier_debugDescription__block_invoke(uint64_t a1)
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
  id v8 = (id)objc_msgSend(*(id *)(a1 + 32), "appendPoint:withName:", @"touchOffset", *(double *)(v4 + 144), *(double *)(v4 + 152));
  id v9 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 520) withName:@"arcSwipePulledStripAppLayout" skipIfNil:1];
  id v10 = (id)[*(id *)(a1 + 32) appendFloat:@"translationYWhenTriggeredCardFlyIn" withName:*(double *)(*(void *)(a1 + 40) + 160)];
  id v11 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 168) withName:@"hasBecomeCoplanarSinceGestureFromSwitcherBegan"];
  id v12 = (id)objc_msgSend(*(id *)(a1 + 32), "appendPoint:withName:", @"gestureLiftOffVelocity", *(double *)(*(void *)(a1 + 40) + 176), *(double *)(*(void *)(a1 + 40) + 184));
  id v13 = (id)objc_msgSend(*(id *)(a1 + 32), "appendPoint:withName:", @"gestureLiftOffTranslation", *(double *)(*(void *)(a1 + 40) + 192), *(double *)(*(void *)(a1 + 40) + 200));
  id v14 = (id)objc_msgSend(*(id *)(a1 + 32), "appendPoint:withName:", @"translationAdjustmentForStartingFromSwitcher", *(double *)(*(void *)(a1 + 40) + 208), *(double *)(*(void *)(a1 + 40) + 216));
  id v15 = (id)objc_msgSend(*(id *)(a1 + 32), "appendPoint:withName:", @"translationAdjustmentForStartingFromHomeScreen", *(double *)(*(void *)(a1 + 40) + 224), *(double *)(*(void *)(a1 + 40) + 232));
  id v16 = (id)[*(id *)(a1 + 32) appendFloat:@"progressToInSwitcherCardScale" withName:*(double *)(*(void *)(a1 + 40) + 240)];
  id v17 = (id)[*(id *)(a1 + 32) appendFloat:@"progressToMaxTranslation" withName:*(double *)(*(void *)(a1 + 40) + 248)];
  id v18 = (id)objc_msgSend(*(id *)(a1 + 32), "appendPoint:withName:", @"translation", *(double *)(*(void *)(a1 + 40) + 256), *(double *)(*(void *)(a1 + 40) + 264));
  id v19 = (id)objc_msgSend(*(id *)(a1 + 32), "appendPoint:withName:", @"velocity", *(double *)(*(void *)(a1 + 40) + 272), *(double *)(*(void *)(a1 + 40) + 280));
  id v20 = (id)[*(id *)(a1 + 32) appendFloat:@"stackedProgress" withName:*(double *)(*(void *)(a1 + 40) + 288)];
  id v21 = (id)objc_msgSend(*(id *)(a1 + 32), "appendPoint:withName:", @"initialCentroid", *(double *)(*(void *)(a1 + 40) + 296), *(double *)(*(void *)(a1 + 40) + 304));
  id v22 = (id)objc_msgSend(*(id *)(a1 + 32), "appendPoint:withName:", @"centroid", *(double *)(*(void *)(a1 + 40) + 312), *(double *)(*(void *)(a1 + 40) + 320));
  id v23 = (id)[*(id *)(a1 + 32) appendFloat:@"absoluteScale" withName:*(double *)(*(void *)(a1 + 40) + 344)];
  id v24 = (id)objc_msgSend(*(id *)(a1 + 32), "appendPoint:withName:", @"translationWithoutScale", *(double *)(*(void *)(a1 + 40) + 352), *(double *)(*(void *)(a1 + 40) + 360));
  id v25 = (id)[*(id *)(a1 + 32) appendFloat:@"lastTouchTimestamp" withName:*(double *)(*(void *)(a1 + 40) + 376)];
  id v26 = (id)[*(id *)(a1 + 32) appendInteger:*(void *)(*(void *)(a1 + 40) + 384) withName:@"gestureHoldTimer"];
  id v27 = (id)objc_msgSend(*(id *)(a1 + 32), "appendPoint:withName:", @"initialTouchLocation", *(double *)(*(void *)(a1 + 40) + 392), *(double *)(*(void *)(a1 + 40) + 400));
  id v28 = (id)objc_msgSend(*(id *)(a1 + 32), "appendPoint:withName:", @"lastTouchLocation", *(double *)(*(void *)(a1 + 40) + 408), *(double *)(*(void *)(a1 + 40) + 416));
  id v29 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 424) withName:@"everTranslatedUpwards"];
  id v30 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 425) withName:@"cancelledGestureForEmptySwitcher"];
  id v31 = (id)[*(id *)(a1 + 32) appendFloat:@"toHomeScreenAlpha" withName:*(double *)(*(void *)(a1 + 40) + 432)];
  id v32 = (id)[*(id *)(a1 + 32) appendFloat:@"toHomeScreenBlurProgress" withName:*(double *)(*(void *)(a1 + 40) + 440)];
  id v33 = (id)[*(id *)(a1 + 32) appendFloat:@"toHomeScreenDimmingAlpha" withName:*(double *)(*(void *)(a1 + 40) + 448)];
  id v34 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 472) withName:@"didWarmupFlyInHaptic"];
  id v35 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 473) withName:@"didPlayFlyInHaptic"];
  id v36 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 512) withName:@"selectedAppLayout"];
  uint64_t v37 = *(void **)(a1 + 32);
  uint64_t v38 = SBStringForUnlockedEnvironmentMode(*(void *)(*(void *)(a1 + 40) + 528));
  [v37 appendString:v38 withName:@"startingEnvironmentMode"];

  id v39 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 536) withName:@"scrunchInitiated"];
  id v40 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 537) withName:@"continuingGesture"];
  id v41 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 538) withName:@"lastGestureWasAnArcSwipe"];
  return (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 539) withName:@"shouldResignActive"];
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
      if ([(SBHomeGestureDockSwitcherModifier *)self->_dockModifier isCurrentlyTrackingDock]) {
        BOOL v4 = [(SBContinuousExposeHomeGestureSwitcherModifier *)self _shouldResignActiveBasedOnCardScale];
      }
      else {
        BOOL v4 = 1;
      }
      self->_shouldResignActive = v4;
    }
  }
}

- (BOOL)_shouldResignActiveBasedOnCardScale
{
  [(SBContinuousExposeHomeGestureSwitcherModifier *)self _rubberbandedTranslationForAdjacentCards];
  -[SBContinuousExposeHomeGestureSwitcherModifier _scaleForTranslation:](self, "_scaleForTranslation:");
  if (BSFloatLessThanOrEqualToFloat()) {
    return 1;
  }
  double v4 = fabs(self->_translation.x);
  [(SBContinuousExposeHomeGestureSwitcherModifier *)self _coplanarSpacing];
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
      double v5 = [(SBContinuousExposeHomeGestureSwitcherModifier *)self switcherSettings];
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
  switch(a3)
  {
    case 0:
      BOOL v4 = self->_selectedAppLayout;
      uint64_t v5 = [(SBContinuousExposeHomeGestureSwitcherModifier *)self switcherInterfaceOrientation];
      break;
    case 1:
      uint64_t v6 = [(SBContinuousExposeHomeGestureSwitcherModifier *)self _previousRecentAppLayout];
      goto LABEL_8;
    case 2:
      uint64_t v6 = [(SBContinuousExposeHomeGestureSwitcherModifier *)self _nextRecentAppLayout];
      goto LABEL_8;
    case 3:
      uint64_t v5 = [(SBContinuousExposeHomeGestureSwitcherModifier *)self switcherInterfaceOrientation];
      BOOL v4 = 0;
      uint64_t v7 = 2;
      goto LABEL_10;
    case 4:
      uint64_t v6 = +[SBAppLayout homeScreenAppLayout];
LABEL_8:
      BOOL v4 = (SBAppLayout *)v6;
      uint64_t v5 = 0;
      break;
    default:
      uint64_t v5 = 0;
      BOOL v4 = 0;
      break;
  }
  uint64_t v7 = 0;
LABEL_10:
  BOOL v8 = objc_alloc_init(SBMutableSwitcherTransitionRequest);
  [(SBSwitcherTransitionRequest *)v8 setAppLayout:v4];
  [(SBSwitcherTransitionRequest *)v8 setUnlockedEnvironmentMode:v7];
  [(SBSwitcherTransitionRequest *)v8 setPreferredInterfaceOrientation:v5];
  BOOL v9 = [[SBPerformTransitionSwitcherEventResponse alloc] initWithTransitionRequest:v8 gestureInitiated:1];

  return v9;
}

- (id)_nextRecentAppLayout
{
  id v3 = [(SBContinuousExposeHomeGestureSwitcherModifier *)self appLayouts];
  BOOL v4 = v3;
  if (self->_selectedAppLayout)
  {
    uint64_t v5 = objc_msgSend(v3, "indexOfObject:");
    if (v5 == 0x7FFFFFFFFFFFFFFFLL || (uint64_t v6 = v5, ![v4 count]))
    {
      id v10 = 0;
      goto LABEL_11;
    }
    uint64_t v7 = [v4 count];
    if (v6 + 1 < v7 - 1) {
      uint64_t v8 = v6 + 1;
    }
    else {
      uint64_t v8 = v7 - 1;
    }
    uint64_t v9 = [v4 objectAtIndex:v8];
  }
  else
  {
    uint64_t v9 = [v3 firstObject];
  }
  id v10 = (void *)v9;
LABEL_11:

  return v10;
}

- (id)_previousRecentAppLayout
{
  id v3 = [(SBContinuousExposeHomeGestureSwitcherModifier *)self appLayouts];
  uint64_t v4 = [v3 indexOfObject:self->_selectedAppLayout];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL || (uint64_t v5 = v4, ![v3 count]))
  {
    uint64_t v7 = 0;
  }
  else
  {
    if (v5 <= 1) {
      uint64_t v6 = 1;
    }
    else {
      uint64_t v6 = v5;
    }
    uint64_t v7 = [v3 objectAtIndex:v6 - 1];
  }

  return v7;
}

- (id)_responseForStudyLogDidBeginGesture
{
  v27[2] = *MEMORY[0x1E4F143B8];
  if ([(SBContinuousExposeHomeGestureSwitcherModifier *)self isStudyLogEnabled])
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(SBContinuousExposeHomeGestureSwitcherModifier *)self containerViewBounds];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    v26[0] = @"x";
    p_lastTouchLocation = &self->_lastTouchLocation;
    id v13 = [NSNumber numberWithDouble:self->_lastTouchLocation.x];
    v26[1] = @"y";
    v27[0] = v13;
    id v14 = [NSNumber numberWithDouble:p_lastTouchLocation->y];
    v27[1] = v14;
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:2];
    [v3 setObject:v15 forKeyedSubscript:@"locationInView"];
    v24[0] = @"x";
    id v16 = [NSNumber numberWithDouble:v5];
    v25[0] = v16;
    v24[1] = @"y";
    id v17 = [NSNumber numberWithDouble:v7];
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
  if ([(SBContinuousExposeHomeGestureSwitcherModifier *)self isStudyLogEnabled])
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v8 averageTouchPathAngleOverTimeDuration:0.0416666667];
    double v12 = v11;
    [v8 velocityInContainerView];
    double v14 = v13;
    double v16 = v15;
    v36[0] = @"x";
    id v17 = [NSNumber numberWithDouble:self->_lastTouchLocation.x];
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
    id v27 = objc_msgSend(NSNumber, "numberWithBool:", -[SBContinuousExposeHomeGestureSwitcherModifier _hasPausedEnoughForFlyIn](self, "_hasPausedEnoughForFlyIn"));
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
  double v7 = objc_msgSend(NSNumber, "numberWithInteger:", -[SBContinuousExposeHomeGestureSwitcherModifier switcherInterfaceOrientation](self, "switcherInterfaceOrientation"));
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
  id v17 = [NSNumber numberWithDouble:v8];
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
    [(SBContinuousExposeHomeGestureSwitcherModifier *)self containerViewBounds];
    uint64_t v8 = v7;
    uint64_t v10 = v9;
    uint64_t v12 = v11;
    uint64_t v14 = v13;
    char v15 = -[SBContinuousExposeHomeGestureSwitcherModifier isLocationInSafeArea:](self, "isLocationInSafeArea:", self->_initialTouchLocation.x, self->_initialTouchLocation.y);
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
    && [(SBContinuousExposeHomeGestureSwitcherModifier *)self isSystemAssistantExperienceEnabled])
  {
    id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", &unk_1F334B300, &unk_1F334B318, 0);
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
  double v5 = objc_alloc_init(SBSwitcherModifierEventResponse);
  int64_t v6 = [(SBHomeGestureFinalDestinationSwitcherModifier *)self->_finalDestinationModifier currentFinalDestination];
  uint64_t v7 = [(SBContinuousExposeHomeGestureSwitcherModifier *)self appLayouts];
  uint64_t v8 = [v7 count];

  int inMultitasking = self->_inMultitasking;
  BOOL v10 = inMultitasking;
  if (v6 == 3)
  {
    if (!self->_didWarmupFlyInHaptic)
    {
      uint64_t v11 = [[SBHapticSwitcherEventResponse alloc] initWithHapticType:0 phase:0];
      [(SBChainableModifierEventResponse *)v5 addChildResponse:v11];
      self->_didWarmupFlyInHaptic = 1;
    }
    if (inMultitasking)
    {
      BOOL v12 = self->_didPlayFlyInHaptic || v8 == 0;
      if (!v12
        && fabs(self->_velocity.x) < *(double *)&kPauseVelocityThresholdForAppSwitcher_1
        && fabs(self->_velocity.y) < *(double *)&kPauseVelocityThresholdForAppSwitcher_1)
      {
        uint64_t v13 = [[SBHapticSwitcherEventResponse alloc] initWithHapticType:0 phase:1];
        -[SBHapticSwitcherEventResponse setHidEventSenderID:](v13, "setHidEventSenderID:", [v4 hidEventSenderID]);
        [(SBChainableModifierEventResponse *)v5 addChildResponse:v13];
        self->_didPlayFlyInHaptic = 1;
      }
    }
  }
  int64_t v14 = [(SBHomeGestureFinalDestinationSwitcherModifier *)self->_finalDestinationModifier currentFinalDestination];
  int v15 = v14 == 3;
  self->_int inMultitasking = v15;
  if (inMultitasking != v15)
  {
    if (v14 == 3)
    {
      self->_double translationYWhenTriggeredMultitasking = self->_translation.y;
    }
    else
    {
      self->_didPlayFlyInHaptic = 0;
      if (!self->_inMultitasking)
      {
LABEL_22:
        id v18 = [(SBContinuousExposeHomeGestureSwitcherModifier *)self switcherSettings];
        uint64_t v19 = [v18 animationSettings];
        uint64_t v20 = [v19 arcSwipeSwitcherGlancingSettings];

        [(SBContinuousExposeHomeGestureSwitcherModifier *)self _beginAnimatingMultitaskingPropertyWithMode:3 settings:v20];
        BOOL v10 = self->_inMultitasking;
        goto LABEL_23;
      }
    }
    BOOL v16 = self->_didPlayFlyInHaptic || v8 == 0;
    if (!v16 && fabs(self->_velocity.x) < *(double *)&kVelocityXThresholdForUnconditionalArcSwipe_1)
    {
      id v17 = [[SBHapticSwitcherEventResponse alloc] initWithHapticType:0 phase:1];
      -[SBHapticSwitcherEventResponse setHidEventSenderID:](v17, "setHidEventSenderID:", [v4 hidEventSenderID]);
      [(SBChainableModifierEventResponse *)v5 addChildResponse:v17];
      self->_didPlayFlyInHaptic = 1;
    }
    goto LABEL_22;
  }
LABEL_23:
  if (inMultitasking) {
    BOOL v21 = 1;
  }
  else {
    BOOL v21 = !v10;
  }
  if (!v21 && self->_startingEnvironmentMode != 1)
  {
    uint64_t v22 = [(SBContinuousExposeHomeGestureSwitcherModifier *)self continuousExposeIdentifiersInSwitcher];
    if ([v22 count])
    {
      char v23 = [v22 firstObject];
      BOOL v24 = [(SBContinuousExposeHomeGestureSwitcherModifier *)self appLayoutsForContinuousExposeIdentifier:v23];
      int v25 = [v24 firstObject];

      if (v25)
      {
        __int16 v26 = [[SBScrollToAppLayoutSwitcherEventResponse alloc] initWithAppLayout:v25 alignment:0 animated:0];
        [(SBChainableModifierEventResponse *)v5 addChildResponse:v26];
      }
    }
  }
  return v5;
}

- (BOOL)_preventPositioningCardsOffscreenForFlatBottomEdgeSwipe
{
  -[SBContinuousExposeHomeGestureSwitcherModifier _scaleForTranslation:](self, "_scaleForTranslation:", self->_translation.x, self->_translation.y);
  double v4 = v3;
  [(SBContinuousExposeHomeGestureSwitcherModifier *)self containerViewBounds];
  double v6 = (1.0 - v4) * v5;
  [(SBContinuousExposeHomeGestureSwitcherModifier *)self _coplanarSpacing];
  return v6 < v7 * 0.75;
}

- (BOOL)_hasPausedEnoughForFlyIn
{
  if ([(SBHomeGestureFinalDestinationSwitcherModifier *)self->_finalDestinationModifier hasSeenAccelerationDipForAppSwitcher])
  {
    return 1;
  }
  double v4 = *(double *)&kCardFlyInDelayAfterEnteringAppSwitcher_1;
  return self->_gestureHoldTimer > (unint64_t)(v4 * SBScreenMaximumFramesPerSecond());
}

- (BOOL)_hasTraveledSufficientDistanceForHomeOrAppSwitcher
{
  [(SBContinuousExposeHomeGestureSwitcherModifier *)self containerViewBounds];
  return self->_lastTouchLocation.y <= v3 - *(double *)&kMinimumYDistanceForHomeOrAppSwitcher_3;
}

- (void)_displayLinkFired:(id)a3
{
  if ([(SBGestureSwitcherModifier *)self gesturePhase] == 2
    && [(SBChainableModifier *)self state] != 1)
  {
    [(SBContinuousExposeHomeGestureSwitcherModifier *)self gestureHandlingModifier:self averageVelocityOverDuration:0.0416666667];
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
      && [(SBContinuousExposeHomeGestureSwitcherModifier *)self _hasPausedEnoughForFlyIn])
    {
      [(SBContinuousExposeHomeGestureSwitcherModifier *)self gestureHandlingModifierRequestsUpdate:self];
    }
  }
}

- (BOOL)_shouldPositionAdjacentCardsOffscreenForFlyIn
{
  BOOL v3 = [(SBContinuousExposeHomeGestureSwitcherModifier *)self _preventPositioningCardsOffscreenForFlatBottomEdgeSwipe];
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
    uint64_t v8 = self->_inMultitaskingChangedProperty;
    self->_inMultitaskingChangedPropertdouble y = 0;
  }
  uint64_t v9 = (UIViewFloatAnimatableProperty *)objc_alloc_init(MEMORY[0x1E4F43000]);
  BOOL v10 = self->_inMultitaskingChangedProperty;
  self->_inMultitaskingChangedPropertdouble y = v9;

  [(UIViewFloatAnimatableProperty *)self->_inMultitaskingChangedProperty setValue:0.0];
  uint64_t v11 = (void *)[v6 copy];
  LODWORD(v12) = *MEMORY[0x1E4F39AF0];
  LODWORD(v13) = *(_DWORD *)(MEMORY[0x1E4F39AF0] + 4);
  LODWORD(v14) = *(_DWORD *)(MEMORY[0x1E4F39AF0] + 8);
  objc_msgSend(v11, "setFrameRateRange:highFrameRateReason:", 0, v12, v13, v14);
  id v15 = v11;

  objc_initWeak(&location, self);
  BOOL v16 = self->_inMultitaskingChangedProperty;
  id v17 = (void *)MEMORY[0x1E4F42FF0];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __102__SBContinuousExposeHomeGestureSwitcherModifier__beginAnimatingMultitaskingPropertyWithMode_settings___block_invoke;
  v22[3] = &unk_1E6AF4AC0;
  v22[4] = self;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __102__SBContinuousExposeHomeGestureSwitcherModifier__beginAnimatingMultitaskingPropertyWithMode_settings___block_invoke_2;
  v19[3] = &unk_1E6AFBE70;
  objc_copyWeak(&v21, &location);
  id v18 = v16;
  uint64_t v20 = v18;
  objc_msgSend(v17, "sb_animateWithSettings:mode:animations:completion:", v15, a3, v22, v19);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

uint64_t __102__SBContinuousExposeHomeGestureSwitcherModifier__beginAnimatingMultitaskingPropertyWithMode_settings___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 128) setValue:1.0];
}

void __102__SBContinuousExposeHomeGestureSwitcherModifier__beginAnimatingMultitaskingPropertyWithMode_settings___block_invoke_2(uint64_t a1)
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

- (void)_beginAnimatingArcSwipePullingPropertyWithMode:(int64_t)a3 settings:(id)a4
{
  id v6 = a4;
  arcSwipePullingChangedPropertdouble y = self->_arcSwipePullingChangedProperty;
  if (arcSwipePullingChangedProperty)
  {
    [(UIViewFloatAnimatableProperty *)arcSwipePullingChangedProperty invalidate];
    uint64_t v8 = self->_arcSwipePullingChangedProperty;
    self->_arcSwipePullingChangedPropertdouble y = 0;
  }
  uint64_t v9 = (UIViewFloatAnimatableProperty *)objc_alloc_init(MEMORY[0x1E4F43000]);
  BOOL v10 = self->_arcSwipePullingChangedProperty;
  self->_arcSwipePullingChangedPropertdouble y = v9;

  [(UIViewFloatAnimatableProperty *)self->_arcSwipePullingChangedProperty setValue:0.0];
  uint64_t v11 = (void *)[v6 copy];
  LODWORD(v12) = *MEMORY[0x1E4F39AF0];
  LODWORD(v13) = *(_DWORD *)(MEMORY[0x1E4F39AF0] + 4);
  LODWORD(v14) = *(_DWORD *)(MEMORY[0x1E4F39AF0] + 8);
  objc_msgSend(v11, "setFrameRateRange:highFrameRateReason:", 0, v12, v13, v14);
  id v15 = v11;

  objc_initWeak(&location, self);
  BOOL v16 = self->_arcSwipePullingChangedProperty;
  id v17 = (void *)MEMORY[0x1E4F42FF0];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __105__SBContinuousExposeHomeGestureSwitcherModifier__beginAnimatingArcSwipePullingPropertyWithMode_settings___block_invoke;
  v22[3] = &unk_1E6AF4AC0;
  v22[4] = self;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __105__SBContinuousExposeHomeGestureSwitcherModifier__beginAnimatingArcSwipePullingPropertyWithMode_settings___block_invoke_2;
  v19[3] = &unk_1E6AFBE70;
  objc_copyWeak(&v21, &location);
  id v18 = v16;
  uint64_t v20 = v18;
  objc_msgSend(v17, "sb_animateWithSettings:mode:animations:completion:", v15, a3, v22, v19);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

uint64_t __105__SBContinuousExposeHomeGestureSwitcherModifier__beginAnimatingArcSwipePullingPropertyWithMode_settings___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 136) setValue:1.0];
}

void __105__SBContinuousExposeHomeGestureSwitcherModifier__beginAnimatingArcSwipePullingPropertyWithMode_settings___block_invoke_2(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    id v3 = WeakRetained[17];
    int64_t v4 = v3;
    if (v3 && v3 == *(id *)(a1 + 32))
    {
      id v5 = v6[17];
      v6[17] = 0;
    }
    WeakRetained = v6;
  }
}

- (BOOL)_isTranslationPastDistanceThresholdToUnconditionallyGoHome:(double)a3
{
  double v3 = -a3;
  [(SBContinuousExposeHomeGestureSwitcherModifier *)self unconditionalDistanceThresholdForHome];
  return v4 < v3;
}

- (double)_gestureProgressToMaxTranslationForTranslation:(double)a3
{
  [(SBContinuousExposeHomeGestureSwitcherModifier *)self _distanceYToMaxTranslation];
  double v6 = v5;
  if (self->_startingEnvironmentMode == 2 && !self->_scrunchInitiated)
  {
    [(SBContinuousExposeHomeGestureSwitcherModifier *)self _distanceYToInSwitcherCardScale];
    a3 = v7 + a3;
    double v6 = v6 - v7;
  }
  return -a3 / v6;
}

- (double)_distanceYToInSwitcherCardScale
{
  [(SBContinuousExposeHomeGestureSwitcherModifier *)self _switcherCardScale];
  double v4 = v3;
  [(SBContinuousExposeHomeGestureSwitcherModifier *)self _inSwitcherCenterYOffsetWhenPresented];
  double v6 = v5;
  [(SBContinuousExposeHomeGestureSwitcherModifier *)self containerViewBounds];
  return (1.0 - v4) * v7 * 0.5 - v6;
}

- (double)_distanceYToMaxTranslation
{
  [(SBContinuousExposeHomeGestureSwitcherModifier *)self containerViewBounds];
  double v4 = v3;
  [(SBContinuousExposeHomeGestureSwitcherModifier *)self _centerYOffsetDuringGesture];
  return v4 * 0.5 - v5;
}

- (double)_inSwitcherCenterYOffsetWhenPresented
{
  double v3 = [(SBContinuousExposeHomeGestureSwitcherModifier *)self switcherSettings];
  [v3 switcherCenterYOffsetPercentOfScreenHeight];

  [(SBContinuousExposeHomeGestureSwitcherModifier *)self containerViewBounds];
  [(SBContinuousExposeHomeGestureSwitcherModifier *)self screenScale];
  BSFloatRoundForScale();
  return result;
}

- (double)_centerYOffsetDuringGesture
{
  if (self->_startingEnvironmentMode == 1)
  {
    [(SBContinuousExposeHomeGestureSwitcherModifier *)self _inSwitcherCenterYOffsetWhenPresented];
  }
  else
  {
    double v4 = [(SBContinuousExposeHomeGestureSwitcherModifier *)self homeGestureSettings];
    [v4 homeGestureCenterZoomDownCenterYOffsetFactor];
    [(SBContinuousExposeHomeGestureSwitcherModifier *)self containerViewBounds];
    [(SBContinuousExposeHomeGestureSwitcherModifier *)self screenScale];
    BSFloatRoundForScale();
    double v6 = v5;

    return v6;
  }
  return result;
}

- (double)_switcherCardScale
{
  id v2 = [(SBContinuousExposeHomeGestureSwitcherModifier *)self switcherSettings];
  [v2 deckSwitcherPageScale];
  double v4 = v3;

  return v4;
}

- (unint64_t)_selectedAppLayoutIndex
{
  double v3 = [(SBContinuousExposeHomeGestureSwitcherModifier *)self appLayouts];
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
  unint64_t v5 = [(SBContinuousExposeHomeGestureSwitcherModifier *)self appLayouts];
  double v6 = [v5 objectAtIndex:a3];

  LOBYTE(v4) = [v6 isEqual:v4->_selectedAppLayout];
  return (char)v4;
}

- (double)_coplanarSpacing
{
  double v3 = [(SBContinuousExposeHomeGestureSwitcherModifier *)self switcherSettings];
  if ([(SBContinuousExposeHomeGestureSwitcherModifier *)self isDevicePad]) {
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
  id v13 = [(SBContinuousExposeHomeGestureSwitcherModifier *)self homeGestureSettings];
  [v13 homeGestureMinimumCardScale];
  self->_double homeGestureMinimumCardScale = v4;
  [v13 homeGestureMinimumCardScaleRubberBandingRange];
  self->_homeGestureMinimumCardScaleRubberBandingRange = v5;
  [v13 normalizedDistanceYThresholdForUnconditionalHome];
  kHomeGestureNormalizedDistanceYThresholdForUnconditionalHome_1 = v6;
  [v13 normalizedDistanceYThresholdRangeForUnconditionalHome];
  kHomeGestureNormalizedDistanceYThresholdRangeForUnconditionalHome_1 = v7;
  [v13 pauseVelocityThresholdForAppSwitcher];
  *(double *)&kPauseVelocityThresholdForAppSwitcher_1 = v3 * v8;
  [v13 velocityXThresholdForUnconditionalArcSwipe];
  *(double *)&kVelocityXThresholdForUnconditionalArcSwipe_1 = v3 * v9;
  [v13 minimumYDistanceForHomeOrAppSwitcher];
  *(double *)&kMinimumYDistanceForHomeOrAppSwitcher_3 = v3 * v10;
  [v13 cardFlyInMaximumVelocityThreshold];
  *(double *)&kCardFlyInMaximumVelocityThreshold_1 = v3 * v11;
  [v13 cardFlyInDelayAfterEnteringAppSwitcher];
  kCardFlyInDelayAfterEnteringAppSwitcher_1 = v12;
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
  objc_storeStrong((id *)&self->_arcSwipePulledStripAppLayout, 0);
  objc_storeStrong((id *)&self->_selectedAppLayout, 0);
  objc_storeStrong((id *)&self->_dismissSiriModifier, 0);
  objc_storeStrong((id *)&self->_finalDestinationModifier, 0);
  objc_storeStrong((id *)&self->_dockModifier, 0);
  objc_storeStrong((id *)&self->_appSwitcherModifier, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_arcSwipePullingChangedProperty, 0);
  objc_storeStrong((id *)&self->_inMultitaskingChangedProperty, 0);
}

@end