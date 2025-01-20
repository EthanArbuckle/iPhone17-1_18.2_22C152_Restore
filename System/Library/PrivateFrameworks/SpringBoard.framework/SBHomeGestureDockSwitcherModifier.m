@interface SBHomeGestureDockSwitcherModifier
- (BOOL)_hasTraveledSufficientDistanceForHomeOrAppSwitcher;
- (BOOL)_rubberbandedOutOfDockHorizontally;
- (BOOL)_shouldPresentDockForFinalDestination:(int64_t)a3;
- (BOOL)isCurrentlyTrackingDock;
- (BOOL)wantsDockBehaviorAssertion;
- (BOOL)wantsDockWindowLevelAssertion;
- (CGPoint)adjustedTranslationForTranslation:(CGPoint)a3;
- (CGPoint)translationForAdjustedTranslation:(CGPoint)a3;
- (SBHomeGestureDockSwitcherModifier)initWithDelegate:(id)a3 startingEnvironmentMode:(int64_t)a4 requireVerticalSwipeToTrackDock:(BOOL)a5;
- (double)dockProgress;
- (id)_updateForGestureDidBeginWithEvent:(id)a3;
- (id)_updateForGestureDidChangeWithEvent:(id)a3;
- (id)_updateForGestureDidEndWithEvent:(id)a3;
- (id)debugDescription;
- (id)handleGestureEvent:(id)a3;
- (id)handleHomeGestureSettingsChangedEvent:(id)a3;
- (id)studyLogData;
- (int64_t)adjustedFinalDestinationForDestination:(int64_t)a3 withTranslation:(CGPoint)a4 velocity:(CGPoint)a5;
- (int64_t)dockUpdateMode;
- (unint64_t)dockWindowLevelPriority;
- (void)_applyPrototypeSettings;
- (void)_updateGestureTranslationAndVelocityWithEvent:(id)a3;
- (void)didMoveToParentModifier:(id)a3;
@end

@implementation SBHomeGestureDockSwitcherModifier

- (SBHomeGestureDockSwitcherModifier)initWithDelegate:(id)a3 startingEnvironmentMode:(int64_t)a4 requireVerticalSwipeToTrackDock:(BOOL)a5
{
  id v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBHomeGestureDockSwitcherModifier;
  v9 = [(SBSwitcherModifier *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_delegate, v8);
    v10->_startingEnvironmentMode = a4;
    v10->_requireVerticalSwipeToTrackDock = a5;
  }

  return v10;
}

- (void)didMoveToParentModifier:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBHomeGestureDockSwitcherModifier;
  -[SBChainableModifier didMoveToParentModifier:](&v5, sel_didMoveToParentModifier_);
  if (a3) {
    [(SBHomeGestureDockSwitcherModifier *)self _applyPrototypeSettings];
  }
}

- (id)handleHomeGestureSettingsChangedEvent:(id)a3
{
  id v4 = a3;
  [(SBHomeGestureDockSwitcherModifier *)self _applyPrototypeSettings];
  v7.receiver = self;
  v7.super_class = (Class)SBHomeGestureDockSwitcherModifier;
  objc_super v5 = [(SBSwitcherModifier *)&v7 handleHomeGestureSettingsChangedEvent:v4];

  return v5;
}

- (id)handleGestureEvent:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBHomeGestureDockSwitcherModifier;
  objc_super v5 = [(SBSwitcherModifier *)&v11 handleGestureEvent:v4];
  unint64_t v6 = [v4 phase];
  if (v6 < 2)
  {
    uint64_t v7 = [(SBHomeGestureDockSwitcherModifier *)self _updateForGestureDidBeginWithEvent:v4];
    goto LABEL_7;
  }
  if (v6 == 2)
  {
    uint64_t v7 = [(SBHomeGestureDockSwitcherModifier *)self _updateForGestureDidChangeWithEvent:v4];
    goto LABEL_7;
  }
  if (v6 == 3)
  {
    uint64_t v7 = [(SBHomeGestureDockSwitcherModifier *)self _updateForGestureDidEndWithEvent:v4];
LABEL_7:
    id v8 = (void *)v7;
    goto LABEL_9;
  }
  id v8 = 0;
LABEL_9:
  v9 = +[SBChainableModifierEventResponse responseByAppendingResponse:v8 toResponse:v5];

  return v9;
}

- (id)_updateForGestureDidBeginWithEvent:(id)a3
{
  id v5 = a3;
  if (self->_gestureHasBegun)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"SBHomeGestureDockSwitcherModifier.m" lineNumber:98 description:@"Can't begin a gesture that has already begun."];
  }
  if (self->_gestureHasEnded)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"SBHomeGestureDockSwitcherModifier.m" lineNumber:99 description:@"Can't begin a gesture that has already ended."];
  }
  self->_gestureHasBegun = 1;
  if ([(SBHomeGestureDockSwitcherModifier *)self isFloatingDockFullyPresented]) {
    char v6 = 0;
  }
  else {
    char v6 = [(SBHomeGestureDockSwitcherModifier *)self isFloatingDockGesturePossible];
  }
  self->_BOOL wantsDockAssertion = v6;
  if ([v5 isPointerTouch]) {
    self->_BOOL wantsDockAssertion = 0;
  }
  if (self->_requireVerticalSwipeToTrackDock) {
    double v7 = 1.0;
  }
  else {
    double v7 = 0.2;
  }
  [v5 averageTouchVelocityOverTimeDuration:0.0416666667];
  BOOL wantsDockAssertion = self->_wantsDockAssertion;
  if (wantsDockAssertion)
  {
    double v11 = v8;
    double v12 = v9;
    BOOL wantsDockAssertion = (BSFloatIsZero() & 1) != 0 || fabs(v12 / v11) > v7;
  }
  self->_currentlyTrackingDock = wantsDockAssertion;
  self->_wasTrackingDockWhenGestureBegan = wantsDockAssertion;
  if ([(SBHomeGestureDockSwitcherModifier *)self homeScreenHasOpenFolderInLocation:*MEMORY[0x1E4FA6690]])char v13 = 1; {
  else
  }
    char v13 = [(SBHomeGestureDockSwitcherModifier *)self homeScreenHasOpenFolderInLocation:@"SBIconLocationFloatingDockSuggestions"];
  self->_hadOpenDockFolderWhenGestureBegan = v13;
  self->_hadOpenHomeScreenFolderWhenGestureBegan = [(SBHomeGestureDockSwitcherModifier *)self homeScreenHasOpenFolderInLocation:*MEMORY[0x1E4FA66D0]];
  self->_hadOpenForegroundLibraryWhenGestureBegan = [(SBHomeGestureDockSwitcherModifier *)self homeScreenHasModalLibraryOpenInForeground];
  [(SBHomeGestureDockSwitcherModifier *)self _updateGestureTranslationAndVelocityWithEvent:v5];

  return 0;
}

- (id)_updateForGestureDidChangeWithEvent:(id)a3
{
  id v5 = a3;
  if (!self->_gestureHasBegun)
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2 object:self file:@"SBHomeGestureDockSwitcherModifier.m" lineNumber:127 description:@"Can't update a gesture that has not begun."];
  }
  if (self->_gestureHasEnded)
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2 object:self file:@"SBHomeGestureDockSwitcherModifier.m" lineNumber:128 description:@"Can't update a gesture that has already ended."];
  }
  [(SBHomeGestureDockSwitcherModifier *)self _updateGestureTranslationAndVelocityWithEvent:v5];
  double x = self->_unadjustedGestureTranslation.x;
  double y = self->_unadjustedGestureTranslation.y;
  double v8 = [(SBHomeGestureDockSwitcherModifier *)self homeGestureSettings];
  double v9 = v8;
  if (!self->_currentlyTrackingDock)
  {
    [v8 verticalRubberbandEnd];
    uint64_t v21 = 167;
    if (self->_highEnoughToShowDock) {
      goto LABEL_18;
    }
    BOOL v22 = v20 + v20 < -y;
LABEL_17:
    *((unsigned char *)&self->super.super.super.isa + v21) = v22;
    goto LABEL_18;
  }
  [v8 maximumDistanceYThresholdToPresentDock];
  double v11 = v10;
  [v9 horizontalRubberbandStart];
  double v13 = v12;
  [v9 horizontalRubberbandEnd];
  double v15 = v14;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v17 = [WeakRetained currentFinalDestination];

  double v18 = fabs(x);
  BOOL v19 = v18 <= v13 || (unint64_t)(v17 - 1) > 1;
  if (v19 && v18 <= v15)
  {
    if (v11 >= -y) {
      goto LABEL_18;
    }
    self->_currentlyTrackingDock = 0;
    uint64_t v21 = 165;
    BOOL v22 = 1;
    goto LABEL_17;
  }
  self->_currentlyTrackingDock = 0;
LABEL_18:

  return 0;
}

- (id)_updateForGestureDidEndWithEvent:(id)a3
{
  id v5 = a3;
  if (!self->_gestureHasBegun)
  {
    double v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"SBHomeGestureDockSwitcherModifier.m" lineNumber:163 description:@"Can't end a gesture that has not begun."];
  }
  if (self->_gestureHasEnded)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"SBHomeGestureDockSwitcherModifier.m" lineNumber:164 description:@"Can't end a gesture that has already ended."];
  }
  self->_gestureHasEnded = 1;
  if ([v5 isCanceled]) {
    goto LABEL_16;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v7 = [WeakRetained currentFinalDestination];

  if (v7)
  {
    if (self->_startingEnvironmentMode != 1 || v7 != 4) {
      goto LABEL_16;
    }
LABEL_12:
    double v9 = objc_alloc_init(SBPresentDockSwitcherEventResponse);
    goto LABEL_17;
  }
  if ([(SBHomeGestureDockSwitcherModifier *)self _hasTraveledSufficientDistanceForHomeOrAppSwitcher])
  {
    if (![(SBHomeGestureDockSwitcherModifier *)self _rubberbandedOutOfDockHorizontally])
    {
      double v10 = self->_lastTouchLocation.y + self->_velocity.y * 0.15;
      [(SBHomeGestureDockSwitcherModifier *)self switcherViewBounds];
      double v12 = v11;
      [(SBHomeGestureDockSwitcherModifier *)self floatingDockHeight];
      if (v10 < v12 + v13 * -0.25) {
        goto LABEL_12;
      }
    }
  }
LABEL_16:
  double v9 = 0;
LABEL_17:

  return v9;
}

- (void)_updateGestureTranslationAndVelocityWithEvent:(id)a3
{
  p_lastTouchLocation = &self->_lastTouchLocation;
  id v5 = a3;
  [v5 locationInContainerView];
  p_lastTouchLocation->double x = v6;
  p_lastTouchLocation->double y = v7;
  p_unadjustedGestureTranslation = &self->_unadjustedGestureTranslation;
  [v5 translationInContainerView];
  self->_unadjustedGestureTranslation.double x = v9;
  self->_unadjustedGestureTranslation.double y = v10;
  [v5 velocityInContainerView];
  CGFloat v12 = v11;
  CGFloat v14 = v13;

  self->_velocity.double x = v12;
  self->_velocity.double y = v14;
  if (self->_currentlyTrackingDock)
  {
    double x = p_unadjustedGestureTranslation->x;
    double y = self->_unadjustedGestureTranslation.y;
    id v42 = [(SBHomeGestureDockSwitcherModifier *)self homeGestureSettings];
    [v42 verticalRubberbandStart];
    double v18 = v17;
    [v42 verticalRubberbandEnd];
    double v20 = v19;
    double v40 = v19;
    [v42 verticalRubberbandDistance];
    double v41 = v21;
    [v42 verticalRubberbandExponent];
    __double y = v22;
    [v42 horizontalRubberbandStart];
    double v24 = v23;
    [v42 horizontalRubberbandEnd];
    double v26 = v25;
    [v42 horizontalRubberbandDistance];
    double v28 = v27;
    [v42 horizontalRubberbandExponent];
    long double v30 = v29;
    double v31 = fmin(fmax(pow(fmin(fmax((-y - v18) / (v20 - v18) + 0.0, 0.0), 1.0), __y), 0.0), 1.0);
    double v32 = fmin(fmax(pow(fmin(fmax((fabs(x) - v24) / (v26 - v24) + 0.0, 0.0), 1.0), v30), 0.0), 1.0);
    double v33 = x + v26;
    if (x + v26 > 0.0) {
      double v33 = 0.0;
    }
    double v34 = v33 - v32 * v28;
    double v35 = x - v26;
    if (x - v26 < 0.0) {
      double v35 = 0.0;
    }
    double v36 = v35 + v32 * v28;
    if (x <= 0.0) {
      double v36 = v34;
    }
    double v37 = y + v40;
    if (y + v40 > 0.0) {
      double v37 = 0.0;
    }
    CGFloat v38 = self->_unadjustedGestureTranslation.y - (v37 - v31 * v41);
    self->_translationAdjustmentForFloatingDock.double x = p_unadjustedGestureTranslation->x - v36;
    self->_translationAdjustmentForFloatingDock.double y = v38;
  }
}

- (CGPoint)adjustedTranslationForTranslation:(CGPoint)a3
{
  double v3 = a3.x - self->_translationAdjustmentForFloatingDock.x;
  double v4 = a3.y - self->_translationAdjustmentForFloatingDock.y;
  result.double y = v4;
  result.double x = v3;
  return result;
}

- (CGPoint)translationForAdjustedTranslation:(CGPoint)a3
{
  double v3 = a3.x + self->_translationAdjustmentForFloatingDock.x;
  double v4 = a3.y + self->_translationAdjustmentForFloatingDock.y;
  result.double y = v4;
  result.double x = v3;
  return result;
}

- (int64_t)adjustedFinalDestinationForDestination:(int64_t)a3 withTranslation:(CGPoint)a4 velocity:(CGPoint)a5
{
  double y = a5.y;
  double v6 = a4.y;
  [(SBHomeGestureDockSwitcherModifier *)self floatingDockHeight];
  double v10 = v9;
  int64_t startingEnvironmentMode = self->_startingEnvironmentMode;
  double v12 = *(double *)&kVelocityYThresholdForUnconditionalHome_0;
  if (self->_wasTrackingDockWhenGestureBegan) {
    int v13 = ![(SBHomeGestureDockSwitcherModifier *)self _rubberbandedOutOfDockHorizontally];
  }
  else {
    int v13 = 0;
  }
  if (self->_hadOpenDockFolderWhenGestureBegan || self->_hadOpenForegroundLibraryWhenGestureBegan)
  {
    int v14 = 0;
    BOOL v15 = 0;
  }
  else
  {
    BOOL v15 = !self->_hadOpenHomeScreenFolderWhenGestureBegan;
    int v14 = 1;
  }
  [(SBHomeGestureDockSwitcherModifier *)self switcherViewBounds];
  BOOL v17 = startingEnvironmentMode != 1;
  int v18 = startingEnvironmentMode != 1 || v15;
  if (y >= v12) {
    BOOL v17 = 1;
  }
  double v19 = *(double *)&kMaximumDistanceYThresholdToPresentDock;
  int v20 = v14 | v13 ^ 1;
  if (y >= v12) {
    int v20 = 1;
  }
  if (!v17) {
    double v19 = v16;
  }
  BOOL v21 = a3 != 3 || !self->_wasTrackingDockWhenGestureBegan;
  int v22 = !v21;
  char v23 = v20 ^ 1;
  if (!v21) {
    char v23 = 1;
  }
  if ((v22 & v13) != 0) {
    double v24 = v19;
  }
  else {
    double v24 = v10;
  }
  if (!v20) {
    double v24 = v19;
  }
  if (!v13) {
    double v19 = v24;
  }
  char v25 = v13 | v23;
  if (v18)
  {
    double v19 = v24;
    char v25 = v23;
  }
  if (v19 >= -v6) {
    int64_t v26 = 0;
  }
  else {
    int64_t v26 = a3;
  }
  if (v25) {
    return v26;
  }
  else {
    return a3;
  }
}

- (id)studyLogData
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  double v4 = [NSNumber numberWithBool:self->_wasTrackingDockWhenGestureBegan];
  [v3 setObject:v4 forKeyedSubscript:@"wasTrackingDockWhenGestureBegan"];

  id v5 = [NSNumber numberWithBool:self->_currentlyTrackingDock];
  [v3 setObject:v5 forKeyedSubscript:@"isTrackingDockWhenGestureEnded"];

  double v6 = objc_msgSend(NSNumber, "numberWithBool:", -[SBHomeGestureDockSwitcherModifier _rubberbandedOutOfDockHorizontally](self, "_rubberbandedOutOfDockHorizontally"));
  [v3 setObject:v6 forKeyedSubscript:@"rubberbandedOutOfDockHorizontally"];

  CGFloat v7 = NSNumber;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  double v9 = objc_msgSend(v7, "numberWithBool:", -[SBHomeGestureDockSwitcherModifier _shouldPresentDockForFinalDestination:](self, "_shouldPresentDockForFinalDestination:", objc_msgSend(WeakRetained, "currentFinalDestination")));
  [v3 setObject:v9 forKeyedSubscript:@"didPresentDock"];

  return v3;
}

- (BOOL)wantsDockBehaviorAssertion
{
  return self->_wantsDockAssertion;
}

- (int64_t)dockUpdateMode
{
  if (self->_currentlyTrackingDock) {
    return 5;
  }
  else {
    return 3;
  }
}

- (double)dockProgress
{
  if (self->_wantsDockAssertion && self->_currentlyTrackingDock)
  {
    [(SBHomeGestureDockSwitcherModifier *)self floatingDockViewTopMargin];
    [(SBHomeGestureDockSwitcherModifier *)self floatingDockHeight];
  }
  BSUIConstrainValueToIntervalWithRubberBand();
  return result;
}

- (BOOL)wantsDockWindowLevelAssertion
{
  return 1;
}

- (unint64_t)dockWindowLevelPriority
{
  return 2;
}

- (id)debugDescription
{
  id v3 = [(SBChainableModifier *)self descriptionBuilderWithMultilinePrefix:&stru_1F3084718];
  id v4 = (id)[v3 appendSuper];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  double v10 = __53__SBHomeGestureDockSwitcherModifier_debugDescription__block_invoke;
  double v11 = &unk_1E6AF5290;
  id v12 = v3;
  int v13 = self;
  id v5 = v3;
  [v5 appendBodySectionWithName:0 multilinePrefix:@"\t" block:&v8];
  double v6 = objc_msgSend(v5, "build", v8, v9, v10, v11);

  return v6;
}

id __53__SBHomeGestureDockSwitcherModifier_debugDescription__block_invoke(uint64_t a1)
{
  id v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendPoint:withName:", @"lastTouchLocation", *(double *)(*(void *)(a1 + 40) + 96), *(double *)(*(void *)(a1 + 40) + 104));
  id v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendPoint:withName:", @"unadjustedGestureTranslation", *(double *)(*(void *)(a1 + 40) + 112), *(double *)(*(void *)(a1 + 40) + 120));
  id v4 = (id)objc_msgSend(*(id *)(a1 + 32), "appendPoint:withName:", @"velocity", *(double *)(*(void *)(a1 + 40) + 128), *(double *)(*(void *)(a1 + 40) + 136));
  id v5 = (id)objc_msgSend(*(id *)(a1 + 32), "appendPoint:withName:", @"translationAdjustmentForFloatingDock", *(double *)(*(void *)(a1 + 40) + 144), *(double *)(*(void *)(a1 + 40) + 152));
  id v6 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 160) withName:@"currentlyTrackingDock"];
  id v7 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 161) withName:@"wasTrackingDockWhenGestureBegan"];
  id v8 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 162) withName:@"hadOpenDockFolderWhenGestureBegan"];
  id v9 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 163) withName:@"hadOpenHomeScreenFolderWhenGestureBegan"];
  id v10 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 164) withName:@"hadOpenForegroundLibraryWhenGestureBegan"];
  id v11 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 165) withName:@"verticallyRubberbandedOutOfDock"];
  id v12 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 166) withName:@"wantsDockAssertion"];
  id v13 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 167) withName:@"highEnoughToShowDock"];
  int v14 = *(void **)(a1 + 32);
  BOOL v15 = SBStringForUnlockedEnvironmentMode(*(void *)(*(void *)(a1 + 40) + 184));
  [v14 appendString:v15 withName:@"startingEnvironmentMode"];

  return (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 192) withName:@"requireVerticalSwipeToTrackDock"];
}

- (BOOL)_shouldPresentDockForFinalDestination:(int64_t)a3
{
  if (a3)
  {
    LOBYTE(v5) = a3 == 4 && self->_startingEnvironmentMode == 1;
  }
  else
  {
    BOOL v5 = [(SBHomeGestureDockSwitcherModifier *)self _hasTraveledSufficientDistanceForHomeOrAppSwitcher];
    if (v5)
    {
      if ([(SBHomeGestureDockSwitcherModifier *)self _rubberbandedOutOfDockHorizontally])
      {
        LOBYTE(v5) = 0;
      }
      else
      {
        double v6 = self->_lastTouchLocation.y + self->_velocity.y * 0.15;
        [(SBHomeGestureDockSwitcherModifier *)self switcherViewBounds];
        double v8 = v7;
        [(SBHomeGestureDockSwitcherModifier *)self floatingDockHeight];
        LOBYTE(v5) = v6 < v8 + v9 * -0.25;
      }
    }
  }
  return v5;
}

- (BOOL)_rubberbandedOutOfDockHorizontally
{
  return self->_wasTrackingDockWhenGestureBegan
      && !self->_currentlyTrackingDock
      && !self->_verticallyRubberbandedOutOfDock;
}

- (BOOL)_hasTraveledSufficientDistanceForHomeOrAppSwitcher
{
  [(SBHomeGestureDockSwitcherModifier *)self switcherViewBounds];
  return self->_lastTouchLocation.y <= v3 - *(double *)&kMinimumYDistanceForHomeOrAppSwitcher_2;
}

- (void)_applyPrototypeSettings
{
  double v3 = SBMainScreenPointsPerMillimeter();
  id v7 = [(SBHomeGestureDockSwitcherModifier *)self homeGestureSettings];
  [v7 minimumYDistanceForHomeOrAppSwitcher];
  *(double *)&kMinimumYDistanceForHomeOrAppSwitcher_2 = v3 * v4;
  [v7 velocityYThresholdForUnconditionalHome];
  *(double *)&kVelocityYThresholdForUnconditionalHome_0 = v3 * v5;
  [v7 maximumDistanceYThresholdToPresentDock];
  kMaximumDistanceYThresholdToPresentDock = v6;
}

- (BOOL)isCurrentlyTrackingDock
{
  return self->_currentlyTrackingDock;
}

- (void).cxx_destruct
{
}

@end