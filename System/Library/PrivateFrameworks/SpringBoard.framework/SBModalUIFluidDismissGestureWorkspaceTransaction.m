@interface SBModalUIFluidDismissGestureWorkspaceTransaction
- (BOOL)_canBeInterrupted;
- (BOOL)_shouldDismissImmmediatelyAtFullGestureProgress;
- (BOOL)_shouldFinishImmediately;
- (BOOL)animateGestureCancelationOrFailure;
- (BOOL)canInterruptForTransitionRequest:(id)a3;
- (SBAssistantSceneControlling)assistantController;
- (SBMainWorkspaceTransaction)currentTransaction;
- (SBModalUIFluidDismissGestureWorkspaceTransaction)initWithTransitionRequest:(id)a3 windowScene:(id)a4 dismissalType:(int64_t)a5 initiatedFromBottomEdge:(BOOL)a6;
- (SBWindowScene)windowScene;
- (double)_backgroundWeightingForDismissal:(BOOL)a3;
- (double)_backgroundWeightingForGestureProgress;
- (double)_clientAnimationsDelay;
- (double)_hapticDelay;
- (double)_scaleForDismissal;
- (double)_scaleForGestureProgress;
- (double)_swipeUpGestureProgress;
- (double)_swipeUpGestureTranslation;
- (double)_yOffsetForGestureProgress;
- (double)_zoomOutDelay;
- (double)dismissalThreshold;
- (id)_dismissalFeedbackGenerator;
- (id)_homeScreenAnimator;
- (id)_layoutSettings;
- (id)_viewForGesture;
- (int64_t)_notificationFeedbackType;
- (int64_t)dismissalType;
- (void)_begin;
- (void)_cleanupHierarchyForDismissal:(BOOL)a3;
- (void)_didComplete;
- (void)_didInterruptWithReason:(id)a3;
- (void)_dismissClientAnimated:(BOOL)a3 completion:(id)a4;
- (void)_finishInteractionAndDismiss:(BOOL)a3 animated:(BOOL)a4;
- (void)_finishWithCompletionType:(int64_t)a3;
- (void)_finishWithGesture:(id)a3;
- (void)_setFluidDismissalState:(id)a3;
- (void)_updateDismissingViewLayoutAndStyleForGesture;
- (void)_updateWithGesture:(id)a3;
- (void)setAnimateGestureCancelationOrFailure:(BOOL)a3;
- (void)setAssistantController:(id)a3;
- (void)setCurrentTransaction:(id)a3;
- (void)setDismissalThreshold:(double)a3;
- (void)setWindowScene:(id)a3;
- (void)systemGestureStateChanged:(id)a3;
@end

@implementation SBModalUIFluidDismissGestureWorkspaceTransaction

- (SBModalUIFluidDismissGestureWorkspaceTransaction)initWithTransitionRequest:(id)a3 windowScene:(id)a4 dismissalType:(int64_t)a5 initiatedFromBottomEdge:(BOOL)a6
{
  id v10 = a4;
  v18.receiver = self;
  v18.super_class = (Class)SBModalUIFluidDismissGestureWorkspaceTransaction;
  v11 = [(SBSystemGestureWorkspaceTransaction *)&v18 initWithTransitionRequest:a3];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_windowScene, v10);
    uint64_t v13 = [v10 assistantController];
    assistantController = v12->_assistantController;
    v12->_assistantController = (SBAssistantSceneControlling *)v13;

    v12->_dismissalType = a5;
    v12->_initiatedFromBottomEdge = a6;
    uint64_t v15 = +[SBAppSwitcherDomain rootSettings];
    settings = v12->_settings;
    v12->_settings = (SBAppSwitcherSettings *)v15;

    v12->_animateGestureCancelationOrFailure = 0;
  }

  return v12;
}

- (BOOL)canInterruptForTransitionRequest:(id)a3
{
  return 1;
}

- (void)_didInterruptWithReason:(id)a3
{
  id v4 = a3;
  v5 = [(SBSystemGestureWorkspaceTransaction *)self gestureRecognizer];
  [v5 setEnabled:0];

  v6 = [(SBSystemGestureWorkspaceTransaction *)self gestureRecognizer];
  [v6 setEnabled:1];

  v7.receiver = self;
  v7.super_class = (Class)SBModalUIFluidDismissGestureWorkspaceTransaction;
  [(SBModalUIFluidDismissGestureWorkspaceTransaction *)&v7 _didInterruptWithReason:v4];
}

- (void)_begin
{
  int64_t dismissalType = self->_dismissalType;
  if ((unint64_t)(dismissalType - 3) >= 4)
  {
    if ((unint64_t)(dismissalType - 1) >= 2)
    {
      if (dismissalType) {
        goto LABEL_14;
      }
      id v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2 object:self file:@"SBModalUIFluidDismissGestureWorkspaceTransaction.m" lineNumber:131 description:@"Invalid dismissal type for dismiss gesture workspace transaction"];
      goto LABEL_11;
    }
    objc_super v7 = [(SBAssistantSceneControlling *)self->_assistantController assistantRootViewController];
    uint64_t v8 = 256;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
    v5 = [WeakRetained transientOverlayPresenter];
    transientOverlayPresenter = self->_transientOverlayPresenter;
    self->_transientOverlayPresenter = v5;

    objc_super v7 = [(SBTransientOverlayPresenting *)self->_transientOverlayPresenter viewControllerForGestureDismissal];
    uint64_t v8 = 272;
  }
  v9 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v8);
  *(Class *)((char *)&self->super.super.super.super.super.super.isa + v8) = v7;

  if (!*(Class *)((char *)&self->super.super.super.super.super.super.isa + v8)) {
    goto LABEL_12;
  }
  [(SBModalUIFluidDismissGestureWorkspaceTransaction *)self addMilestone:@"SBModalUIFluidDismissGestureMilestone"];
  id v10 = [(SBModalUIFluidDismissGestureWorkspaceTransaction *)self _viewForGesture];
  v11 = [(SBSystemGestureWorkspaceTransaction *)self gestureRecognizer];
  _UISystemGestureLocationInView();
  double v13 = v12;
  double v15 = v14;

  [v10 bounds];
  CGFloat x = v31.origin.x;
  CGFloat y = v31.origin.y;
  CGFloat width = v31.size.width;
  CGFloat height = v31.size.height;
  double v20 = CGRectGetHeight(v31);
  if (v15 >= v20) {
    double v15 = v20;
  }
  UIRectGetCenter();
  self->_dismissingViewTouchOffset.CGFloat x = v13 - v21;
  self->_dismissingViewTouchOffset.CGFloat y = v15 - v22;
  self->_originalBounds.origin.CGFloat x = x;
  self->_originalBounds.origin.CGFloat y = y;
  self->_originalBounds.size.CGFloat width = width;
  self->_originalBounds.size.CGFloat height = height;
  UIRectGetCenter();
  self->_originalCenter.CGFloat x = v23;
  self->_originalCenter.CGFloat y = v24;
LABEL_11:

LABEL_12:
  if (self->_dismissalType == 3)
  {
    v26 = +[SBKeyboardSuppressionManager sharedInstance];
    v27 = [(SBWorkspaceTransaction *)self transitionRequest];
    v28 = [v27 displayIdentity];
    [v26 startSuppressingKeyboardWithReason:@"SBModalUIFluidDismissGestureKeyboardSuppressionReason" predicate:0 displayIdentity:v28];
  }
LABEL_14:
  v29 = [(SBModalUIFluidDismissGestureWorkspaceTransaction *)self _dismissalFeedbackGenerator];
  [v29 activateWithCompletionBlock:0];

  v30.receiver = self;
  v30.super_class = (Class)SBModalUIFluidDismissGestureWorkspaceTransaction;
  [(SBSystemGestureWorkspaceTransaction *)&v30 _begin];
}

- (void)_didComplete
{
  v6.receiver = self;
  v6.super_class = (Class)SBModalUIFluidDismissGestureWorkspaceTransaction;
  [(SBSystemGestureWorkspaceTransaction *)&v6 _didComplete];
  v3 = [(SBModalUIFluidDismissGestureWorkspaceTransaction *)self _dismissalFeedbackGenerator];
  [v3 deactivate];

  if (self->_dismissalType == 3)
  {
    id v4 = +[SBKeyboardSuppressionManager sharedInstance];
    [v4 stopSuppressingKeyboardWithReason:@"SBModalUIFluidDismissGestureKeyboardSuppressionReason"];
  }
  [(SBWindowSceneStatusBarSettingsAssertion *)self->_statusBarAssertion invalidate];
  statusBarAssertion = self->_statusBarAssertion;
  self->_statusBarAssertion = 0;
}

- (BOOL)_canBeInterrupted
{
  return !self->_isDismissing;
}

- (void)systemGestureStateChanged:(id)a3
{
  id v5 = a3;
  if ([(SBModalUIFluidDismissGestureWorkspaceTransaction *)self isRunning]
    && !self->_isDismissing)
  {
    uint64_t v4 = [v5 state];
    if (v4 == 2)
    {
      [(SBModalUIFluidDismissGestureWorkspaceTransaction *)self _updateWithGesture:v5];
    }
    else if (v4 == 1)
    {
      [(SBModalUIFluidDismissGestureWorkspaceTransaction *)self _beginWithGesture:v5];
    }
    else
    {
      [(SBModalUIFluidDismissGestureWorkspaceTransaction *)self _finishWithGesture:v5];
    }
  }
}

- (void)_finishWithCompletionType:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SBModalUIFluidDismissGestureWorkspaceTransaction;
  -[SBSystemGestureWorkspaceTransaction _finishWithCompletionType:](&v8, sel__finishWithCompletionType_);
  if (a3 == 1)
  {
    id v5 = +[SBKeyboardFocusCoordinator sharedInstance];
    objc_super v6 = [(SBModalUIFluidDismissGestureWorkspaceTransaction *)self windowScene];
    objc_super v7 = +[SBKeyboardFocusArbitrationReason modalUIFluidDismissGestureDidFinish];
    [v5 requestArbitrationForSBWindowScene:v6 forReason:v7];
  }
  [(SBModalUIFluidDismissGestureWorkspaceTransaction *)self removeMilestone:@"SBModalUIFluidDismissGestureMilestone"];
}

- (void)_updateWithGesture:(id)a3
{
  id v5 = a3;
  if (!self->_hasPreservedInputViews)
  {
    self->_hasPreservedInputViews = 1;
    [(SBTransientOverlayViewController *)self->_transientOverlayViewController preserveInputViewsAnimated:1];
  }
  [(SBModalUIFluidDismissGestureWorkspaceTransaction *)self _updateDismissingViewLayoutAndStyleForGesture];
  if ([(SBModalUIFluidDismissGestureWorkspaceTransaction *)self _shouldDismissImmmediatelyAtFullGestureProgress])
  {
    [(SBModalUIFluidDismissGestureWorkspaceTransaction *)self _swipeUpGestureProgress];
    if (v4 >= 1.0) {
      [(SBModalUIFluidDismissGestureWorkspaceTransaction *)self _finishInteractionAndDismiss:1 animated:1];
    }
  }
}

- (void)_finishWithGesture:(id)a3
{
  id v5 = a3;
  id v13 = v5;
  if (!self->_assistantRootViewController && !self->_transientOverlayViewController)
  {
    double v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"SBModalUIFluidDismissGestureWorkspaceTransaction.m" lineNumber:213 description:@"We reached the end of a modal UI dismissal transaction with no _assistantRootViewController or _transientOverlayViewController..."];

    id v5 = v13;
  }
  if (([v5 state] & 0xFFFFFFFFFFFFFFFELL) == 4)
  {
    BOOL v6 = 0;
    BOOL animateGestureCancelationOrFailure = self->_animateGestureCancelationOrFailure;
  }
  else
  {
    objc_super v8 = [(SBModalUIFluidDismissGestureWorkspaceTransaction *)self _viewForGesture];
    [v13 velocityInView:v8];
    double v10 = v9;
    [v13 translationInView:v8];
    BOOL v6 = v11 + v10 * 0.15 <= self->_dismissalThreshold;

    BOOL animateGestureCancelationOrFailure = 1;
  }
  [(SBModalUIFluidDismissGestureWorkspaceTransaction *)self _finishInteractionAndDismiss:v6 animated:animateGestureCancelationOrFailure];
}

- (void)_finishInteractionAndDismiss:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  self->_isDismissing = a3;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  char v24 = 0;
  objc_super v7 = dispatch_group_create();
  objc_super v8 = v7;
  if (v5)
  {
    dispatch_group_enter(v7);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __90__SBModalUIFluidDismissGestureWorkspaceTransaction__finishInteractionAndDismiss_animated___block_invoke;
    v21[3] = &unk_1E6AF4AC0;
    double v22 = v8;
    [(SBModalUIFluidDismissGestureWorkspaceTransaction *)self _dismissClientAnimated:v4 completion:v21];
  }
  if (self->_isDismissing)
  {
    [(SBModalUIFluidDismissGestureWorkspaceTransaction *)self _zoomOutDelay];
    double v10 = v9;
  }
  else
  {
    double v10 = 0.0;
  }
  dispatch_group_enter(v8);
  dispatch_time_t v11 = dispatch_time(0, (uint64_t)(v10 * 1000000000.0));
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90__SBModalUIFluidDismissGestureWorkspaceTransaction__finishInteractionAndDismiss_animated___block_invoke_2;
  block[3] = &unk_1E6AFB0C0;
  BOOL v19 = v4;
  BOOL v20 = v5;
  block[4] = self;
  objc_super v18 = v23;
  double v12 = v8;
  v17 = v12;
  dispatch_after(v11, MEMORY[0x1E4F14428], block);
  if ([(SBModalUIFluidDismissGestureWorkspaceTransaction *)self _shouldFinishImmediately]) {
    dispatch_group_leave(v12);
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __90__SBModalUIFluidDismissGestureWorkspaceTransaction__finishInteractionAndDismiss_animated___block_invoke_5;
  v14[3] = &unk_1E6AF8D68;
  v14[4] = self;
  v14[5] = v23;
  BOOL v15 = v5;
  id v13 = (void *)MEMORY[0x1E4F14428];
  dispatch_group_notify(v12, MEMORY[0x1E4F14428], v14);

  _Block_object_dispose(v23, 8);
}

void __90__SBModalUIFluidDismissGestureWorkspaceTransaction__finishInteractionAndDismiss_animated___block_invoke(uint64_t a1)
{
}

void __90__SBModalUIFluidDismissGestureWorkspaceTransaction__finishInteractionAndDismiss_animated___block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F42FF0];
  v3 = [*(id *)(a1 + 32) _layoutSettings];
  if (*(unsigned char *)(a1 + 56)) {
    uint64_t v4 = 3;
  }
  else {
    uint64_t v4 = 2;
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __90__SBModalUIFluidDismissGestureWorkspaceTransaction__finishInteractionAndDismiss_animated___block_invoke_3;
  v10[3] = &unk_1E6AF5D38;
  uint64_t v11 = *(void *)(a1 + 32);
  char v12 = *(unsigned char *)(a1 + 57);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __90__SBModalUIFluidDismissGestureWorkspaceTransaction__finishInteractionAndDismiss_animated___block_invoke_4;
  v7[3] = &unk_1E6AFB098;
  v7[4] = v11;
  char v9 = v12;
  long long v6 = *(_OWORD *)(a1 + 40);
  id v5 = (id)v6;
  long long v8 = v6;
  objc_msgSend(v2, "sb_animateWithSettings:mode:animations:completion:", v3, v4, v10, v7);
}

void __90__SBModalUIFluidDismissGestureWorkspaceTransaction__finishInteractionAndDismiss_animated___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) _backgroundWeightingForDismissal:*(unsigned __int8 *)(a1 + 40)];
  double v35 = v2;
  int v3 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned char *)(a1 + 40))
  {
    [*(id *)(a1 + 32) _scaleForDismissal];
    CGFloat v5 = v4;
  }
  else
  {
    CGFloat v5 = 1.0;
  }
  long long v6 = [*(id *)(a1 + 32) _viewForGesture];
  [v6 bounds];
  CGAffineTransformMakeScale(&v37, v5, v5);
  UIRectGetCenter();
  BSRectWithSize();
  UIRectCenteredAboutPoint();
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  uint64_t v15 = [*(id *)(a1 + 32) dismissalType];
  double v16 = v12;
  double v17 = v8;
  double v18 = v10;
  double v19 = v12;
  double v20 = v14;
  if (v15 == 3)
  {
    double v21 = objc_msgSend(*(id *)(a1 + 32), "_homeScreenAnimator", v8, v10, v12, v14);
    [v21 setHomeScreenScale:3 behaviorMode:0 completion:1.0];

    double v16 = v12;
    double v17 = v8;
    double v18 = v10;
    double v19 = v12;
    double v20 = v14;
    if (*(unsigned char *)(a1 + 40))
    {
      double v22 = *(unsigned char **)(a1 + 32);
      double v17 = v8;
      double v18 = v10;
      double v19 = v12;
      double v20 = v14;
      if (v22[344])
      {
        objc_msgSend(v22, "_scaleForGestureProgress", v8, v10, v12, v14);
        CGAffineTransformMakeScale(&v36, v23 * 0.95, v23 * 0.95);
        UIRectGetCenter();
        BSRectWithSize();
        UIRectCenteredAboutPoint();
        double v16 = v12;
      }
    }
  }
  double v34 = v20;
  double v24 = v8;
  double v25 = v10;
  if (v3) {
    double v26 = 0.0;
  }
  else {
    double v26 = 1.0;
  }
  double v27 = v16;
  double v28 = v14;
  double v29 = v17;
  double v30 = v18;
  double v31 = v19;
  v32 = objc_alloc_init(SBFluidDismissalState);
  [(SBFluidDismissalState *)v32 setBackgroundWeighting:v35];
  [(SBFluidDismissalState *)v32 setContentWeighting:v26];
  -[SBFluidDismissalState setContentRect:](v32, "setContentRect:", v24, v25, v27, v28);
  -[SBFluidDismissalState setHomeGrabberContentRect:](v32, "setHomeGrabberContentRect:", v29, v30, v31, v34);
  -[SBFluidDismissalState setDismissalType:](v32, "setDismissalType:", [*(id *)(a1 + 32) dismissalType]);
  if (*(unsigned char *)(a1 + 40)) {
    uint64_t v33 = 1;
  }
  else {
    uint64_t v33 = 2;
  }
  [(SBFluidDismissalState *)v32 setTransitionPhase:v33];
  [*(id *)(a1 + 32) _setFluidDismissalState:v32];
}

void __90__SBModalUIFluidDismissGestureWorkspaceTransaction__finishInteractionAndDismiss_animated___block_invoke_4(uint64_t a1, int a2, char a3)
{
  if (a2)
  {
    if ([*(id *)(*(void *)(a1 + 32) + 368) isSystemAssistantExperienceEnabled])
    {
      uint64_t v5 = *(void *)(a1 + 32);
      long long v6 = *(void **)(v5 + 256);
      if (v6)
      {
        if ((unint64_t)(*(void *)(v5 + 376) - 1) <= 1)
        {
          double v7 = [v6 siriPresentationViewController];
          [v7 noteFluidDismissalCompletedWithSuccess:*(unsigned __int8 *)(a1 + 56)];
        }
      }
    }
  }
  if (*(unsigned char *)(a1 + 56)) {
    char v8 = 0;
  }
  else {
    char v8 = a3;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v8;
  if (([*(id *)(a1 + 32) _shouldFinishImmediately] & 1) == 0)
  {
    double v9 = *(NSObject **)(a1 + 40);
    dispatch_group_leave(v9);
  }
}

uint64_t __90__SBModalUIFluidDismissGestureWorkspaceTransaction__finishInteractionAndDismiss_animated___block_invoke_5(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 346) = 0;
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24))
  {
    uint64_t v1 = result;
    [*(id *)(result + 32) _cleanupHierarchyForDismissal:*(unsigned __int8 *)(result + 48)];
    double v2 = *(void **)(v1 + 32);
    if (*(unsigned char *)(v1 + 48)) {
      uint64_t v3 = 1;
    }
    else {
      uint64_t v3 = -1;
    }
    return [v2 finishWithCompletionType:v3];
  }
  return result;
}

- (void)_updateDismissingViewLayoutAndStyleForGesture
{
  [(SBModalUIFluidDismissGestureWorkspaceTransaction *)self _scaleForGestureProgress];
  uint64_t v4 = v3;
  [(SBModalUIFluidDismissGestureWorkspaceTransaction *)self _yOffsetForGestureProgress];
  uint64_t v6 = v5;
  [(SBModalUIFluidDismissGestureWorkspaceTransaction *)self _swipeUpGestureTranslation];
  double v7 = (void *)MEMORY[0x1E4F42FF0];
  char v8 = [(SBModalUIFluidDismissGestureWorkspaceTransaction *)self _layoutSettings];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __97__SBModalUIFluidDismissGestureWorkspaceTransaction__updateDismissingViewLayoutAndStyleForGesture__block_invoke;
  v13[3] = &unk_1E6AF4AE8;
  v13[4] = self;
  v13[5] = v4;
  v13[6] = v6;
  objc_msgSend(v7, "sb_animateWithSettings:mode:animations:completion:", v8, 5, v13, 0);

  if (self->_dismissalType == 3 && !SBReduceMotion())
  {
    if (BSFloatGreaterThanFloat())
    {
      double v9 = +[SBSpotlightDomain rootSettings];
      [v9 maxTranslationForHomeScreenScale];
      [v9 homeScreenScaleRubberbandingMin];
      [v9 homeScreenScaleRubberbandingMax];
      [v9 homeScreenScaleRubberbandingRange];
      BSUIConstrainValueToIntervalWithRubberBand();
      double v11 = v10;
      double v12 = [(SBModalUIFluidDismissGestureWorkspaceTransaction *)self _homeScreenAnimator];
      [v12 setHomeScreenScale:5 behaviorMode:0 completion:v11];
    }
    else
    {
      double v9 = [(SBModalUIFluidDismissGestureWorkspaceTransaction *)self _homeScreenAnimator];
      [v9 setHomeScreenScale:5 behaviorMode:0 completion:1.0];
    }
  }
}

void __97__SBModalUIFluidDismissGestureWorkspaceTransaction__updateDismissingViewLayoutAndStyleForGesture__block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) _viewForGesture];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  CGAffineTransformMakeScale(&v45, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 40));
  double v41 = v4;
  double v43 = v6;
  UIRectGetCenter();
  BSRectWithSize();
  UIRectCenteredAboutPoint();
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  [*(id *)(a1 + 32) _backgroundWeightingForGestureProgress];
  double v20 = v19;
  double v21 = 1.0;
  if ([*(id *)(a1 + 32) dismissalType] == 3)
  {
    double v22 = *(unsigned char **)(a1 + 32);
    if (v22[344])
    {
      [v22 _swipeUpGestureProgress];
      double v39 = 1.0 - v23;
      double v40 = 0.0;
      double v37 = v14;
      double v38 = v12;
      double v35 = v18;
      double v36 = v16;
      double v24 = v18;
      double v25 = v16;
      double v26 = v14;
      double v27 = v12;
      double v28 = v41;
      double v29 = v43;
    }
    else
    {
      double v40 = v20;
      double v24 = v18;
      double v25 = v16;
      double v26 = v14;
      double v27 = v12;
      double v28 = v41;
      double v29 = v43;
      double v37 = v43;
      double v38 = v41;
      double v35 = v10;
      double v36 = v8;
      double v39 = 1.0;
    }
    BOOL v30 = SBReduceMotion();
    if (v30)
    {
      double v27 = v28;
      double v26 = v29;
      double v25 = v8;
      double v24 = v10;
      double v31 = v28;
    }
    else
    {
      double v31 = v38;
    }
    double v32 = v37;
    if (v30) {
      double v32 = v29;
    }
    double v42 = v32;
    double v44 = v31;
    if (v30)
    {
      double v21 = 1.0;
    }
    else
    {
      double v8 = v36;
      double v10 = v35;
      double v21 = v39;
    }
    double v33 = v40;
    if (v30) {
      double v33 = 0.0;
    }
    double v12 = v27;
    double v14 = v26;
    double v16 = v25;
    double v18 = v24;
    double v20 = v33;
  }
  else
  {
    double v42 = v14;
    double v44 = v12;
    double v8 = v16;
    double v10 = v18;
  }
  double v34 = objc_alloc_init(SBFluidDismissalState);
  [(SBFluidDismissalState *)v34 setBackgroundWeighting:v20];
  [(SBFluidDismissalState *)v34 setContentWeighting:v21];
  -[SBFluidDismissalState setContentRect:](v34, "setContentRect:", v12, v14, v16, v18);
  -[SBFluidDismissalState setHomeGrabberContentRect:](v34, "setHomeGrabberContentRect:", v44, v42, v8, v10);
  -[SBFluidDismissalState setDismissalType:](v34, "setDismissalType:", [*(id *)(a1 + 32) dismissalType]);
  [(SBFluidDismissalState *)v34 setTransitionPhase:0];
  [*(id *)(a1 + 32) _setFluidDismissalState:v34];
}

- (id)_dismissalFeedbackGenerator
{
  dismissalFeedbackGenerator = self->_dismissalFeedbackGenerator;
  if (!dismissalFeedbackGenerator)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F42C10]);
    double v5 = (void *)MEMORY[0x1E4F43268];
    double v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1F3349980, &unk_1F3349998, 0);
    double v7 = [v5 privateConfigurationForTypes:v6];
    double v8 = (UINotificationFeedbackGenerator *)[v4 initWithConfiguration:v7];
    double v9 = self->_dismissalFeedbackGenerator;
    self->_dismissalFeedbackGenerator = v8;

    dismissalFeedbackGenerator = self->_dismissalFeedbackGenerator;
  }
  return dismissalFeedbackGenerator;
}

- (id)_layoutSettings
{
  switch([(SBModalUIFluidDismissGestureWorkspaceTransaction *)self dismissalType])
  {
    case 0:
      id v4 = [MEMORY[0x1E4F28B00] currentHandler];
      [v4 handleFailureInMethod:a2 object:self file:@"SBModalUIFluidDismissGestureWorkspaceTransaction.m" lineNumber:406 description:@"Invalid dismissal type for dismiss gesture workspace transaction"];
      double v6 = 0;
      goto LABEL_8;
    case 1:
      id v4 = [(SBAppSwitcherSettings *)self->_settings animationSettings];
      uint64_t v5 = [v4 siriSwipeDismissalSettings];
      goto LABEL_7;
    case 2:
    case 3:
    case 4:
      id v4 = [(SBAppSwitcherSettings *)self->_settings animationSettings];
      uint64_t v5 = [v4 alertCardifiedDismissalSettings];
      goto LABEL_7;
    case 5:
    case 6:
      id v4 = [(SBAppSwitcherSettings *)self->_settings animationSettings];
      uint64_t v5 = [v4 alertBarSwipeDismissalSettings];
LABEL_7:
      double v6 = (void *)v5;
LABEL_8:

      break;
    default:
      double v6 = 0;
      break;
  }
  return v6;
}

- (double)_zoomOutDelay
{
  double v3 = 0.0;
  switch([(SBModalUIFluidDismissGestureWorkspaceTransaction *)self dismissalType])
  {
    case 1:
      id v4 = [(SBAppSwitcherSettings *)self->_settings animationSettings];
      [v4 siriSwipeDismissZoomOutDelay];
      goto LABEL_5;
    case 2:
    case 4:
      id v4 = [(SBAppSwitcherSettings *)self->_settings animationSettings];
      [v4 alertCardifiedDismissZoomOutDelay];
      goto LABEL_5;
    case 5:
    case 6:
      id v4 = [(SBAppSwitcherSettings *)self->_settings animationSettings];
      [v4 alertBarSwipeDismissZoomOutDelay];
LABEL_5:
      double v3 = v5;

      break;
    default:
      return v3;
  }
  return v3;
}

- (double)_clientAnimationsDelay
{
  double v3 = 0.0;
  switch([(SBModalUIFluidDismissGestureWorkspaceTransaction *)self dismissalType])
  {
    case 1:
      id v4 = [(SBAppSwitcherSettings *)self->_settings animationSettings];
      [v4 siriSwipeDismissClientAnimationsDelay];
      goto LABEL_5;
    case 2:
    case 4:
      id v4 = [(SBAppSwitcherSettings *)self->_settings animationSettings];
      [v4 alertCardifiedDismissClientAnimationsDelay];
      goto LABEL_5;
    case 5:
    case 6:
      id v4 = [(SBAppSwitcherSettings *)self->_settings animationSettings];
      [v4 alertBarSwipeDismissClientAnimationsDelay];
LABEL_5:
      double v3 = v5;

      break;
    default:
      return v3;
  }
  return v3;
}

- (double)_hapticDelay
{
  double v3 = 0.0;
  switch([(SBModalUIFluidDismissGestureWorkspaceTransaction *)self dismissalType])
  {
    case 1:
      id v4 = [(SBAppSwitcherSettings *)self->_settings animationSettings];
      [v4 siriSwipeDismissHapticDelay];
      goto LABEL_5;
    case 2:
    case 4:
      id v4 = [(SBAppSwitcherSettings *)self->_settings animationSettings];
      [v4 alertCardifiedDismissHapticDelay];
      goto LABEL_5;
    case 5:
    case 6:
      id v4 = [(SBAppSwitcherSettings *)self->_settings animationSettings];
      [v4 alertBarSwipeDismissHapticDelay];
LABEL_5:
      double v3 = v5;

      break;
    default:
      return v3;
  }
  return v3;
}

- (int64_t)_notificationFeedbackType
{
  unint64_t v2 = [(SBModalUIFluidDismissGestureWorkspaceTransaction *)self dismissalType];
  if (v2 > 6) {
    return 0;
  }
  else {
    return qword_1D8FD0D38[v2];
  }
}

- (void)_dismissClientAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v7 = a4;
  double v8 = 0.0;
  double v9 = 0.0;
  if (v4)
  {
    [(SBModalUIFluidDismissGestureWorkspaceTransaction *)self _clientAnimationsDelay];
    double v9 = v10;
  }
  dispatch_time_t v11 = dispatch_time(0, (uint64_t)(v9 * 1000000000.0));
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__SBModalUIFluidDismissGestureWorkspaceTransaction__dismissClientAnimated_completion___block_invoke;
  block[3] = &unk_1E6AFB0E8;
  BOOL v20 = v4;
  block[4] = self;
  void block[5] = a2;
  dispatch_after(v11, MEMORY[0x1E4F14428], block);
  if (v4)
  {
    [(SBModalUIFluidDismissGestureWorkspaceTransaction *)self _hapticDelay];
    double v8 = v12;
    dispatch_time_t v13 = dispatch_time(0, (uint64_t)(v12 * 1000000000.0));
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __86__SBModalUIFluidDismissGestureWorkspaceTransaction__dismissClientAnimated_completion___block_invoke_2;
    v18[3] = &unk_1E6AF4AC0;
    v18[4] = self;
    double v14 = (void *)MEMORY[0x1E4F14428];
    dispatch_after(v13, MEMORY[0x1E4F14428], v18);
  }
  if (v9 >= v8) {
    double v15 = v9;
  }
  else {
    double v15 = v8;
  }
  dispatch_time_t v16 = dispatch_time(0, (uint64_t)(v15 * 1000000000.0));
  double v17 = (void *)MEMORY[0x1E4F14428];
  dispatch_after(v16, MEMORY[0x1E4F14428], v7);
}

void __86__SBModalUIFluidDismissGestureWorkspaceTransaction__dismissClientAnimated_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) dismissalType];
  if ((unint64_t)(v2 - 3) >= 4)
  {
    if ((unint64_t)(v2 - 1) >= 2)
    {
      if (!v2)
      {
        id v6 = [MEMORY[0x1E4F28B00] currentHandler];
        [v6 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"SBModalUIFluidDismissGestureWorkspaceTransaction.m" lineNumber:537 description:@"Invalid dismissal type for dismiss gesture workspace transaction"];
      }
    }
    else
    {
      BOOL v4 = *(void **)(*(void *)(a1 + 32) + 368);
      uint64_t v5 = *(unsigned __int8 *)(a1 + 48);
      [v4 dismissAssistantViewIfNecessaryWithAnimation:v5];
    }
  }
  else
  {
    double v3 = *(void **)(*(void *)(a1 + 32) + 272);
    [v3 handleGestureDismissal];
  }
}

void __86__SBModalUIFluidDismissGestureWorkspaceTransaction__dismissClientAnimated_completion___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _dismissalFeedbackGenerator];
  objc_msgSend(v2, "_privateNotificationOccurred:", objc_msgSend(*(id *)(a1 + 32), "_notificationFeedbackType"));
}

- (double)_scaleForDismissal
{
  unint64_t v2 = [(SBModalUIFluidDismissGestureWorkspaceTransaction *)self dismissalType];
  double result = 0.0;
  if (v2 <= 6) {
    return dbl_1D8FD0D70[v2];
  }
  return result;
}

- (double)_backgroundWeightingForDismissal:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v4 = [(SBModalUIFluidDismissGestureWorkspaceTransaction *)self dismissalType];
  if (v4 > 6) {
    return 0.0;
  }
  if (v4 == 3)
  {
    id v7 = +[SBLockScreenManager sharedInstance];
    int v8 = [v7 isUILocked];

    double v9 = +[SBSpotlightDomain rootSettings];
    double v10 = v9;
    double v5 = 0.0;
    if (v8) {
      BOOL v11 = !v3;
    }
    else {
      BOOL v11 = 0;
    }
    if (v11)
    {
      [v9 dimmingViewRubberbandingMax];
      double v5 = v12;
    }
  }
  else if (v3)
  {
    return 0.0;
  }
  else
  {
    return 1.0;
  }
  return v5;
}

- (double)_scaleForGestureProgress
{
  [(SBModalUIFluidDismissGestureWorkspaceTransaction *)self _swipeUpGestureProgress];
  double v4 = v3;
  unint64_t v5 = [(SBModalUIFluidDismissGestureWorkspaceTransaction *)self dismissalType];
  if (v5 > 6) {
    return 0.0;
  }
  if (((1 << v5) & 0x1E) != 0) {
    return v4 * -0.145 + 1.0;
  }
  return 1.0;
}

- (double)_backgroundWeightingForGestureProgress
{
  [(SBModalUIFluidDismissGestureWorkspaceTransaction *)self _swipeUpGestureProgress];
  double v4 = v3;
  unint64_t v5 = [(SBModalUIFluidDismissGestureWorkspaceTransaction *)self dismissalType];
  if (v5 > 6) {
    return 0.0;
  }
  if (((1 << v5) & 0x16) != 0) {
    return v4 * -0.1 + 0.9;
  }
  if (((1 << v5) & 0x61) != 0) {
    return 1.0;
  }
  [(SBModalUIFluidDismissGestureWorkspaceTransaction *)self _swipeUpGestureTranslation];
  double v6 = 0.0;
  if (BSFloatGreaterThanFloat())
  {
    id v7 = +[SBSpotlightDomain rootSettings];
    [v7 maxTranslationForDimmingView];
    [v7 dimmingViewRubberbandingMin];
    uint64_t v9 = v8;
    [v7 dimmingViewRubberbandingMax];
    objc_msgSend(v7, "dimmingViewRubberbandingRange", v9, 1, v10, 1);
    BSUIConstrainValueToIntervalWithRubberBand();
    double v6 = v11;
  }
  return v6;
}

- (double)_yOffsetForGestureProgress
{
  [(SBModalUIFluidDismissGestureWorkspaceTransaction *)self _swipeUpGestureProgress];
  double v4 = v3;
  unint64_t v5 = [(SBModalUIFluidDismissGestureWorkspaceTransaction *)self dismissalType];
  if (v5 > 6) {
    return 0.0;
  }
  if (((1 << v5) & 0x1D) != 0)
  {
    double v6 = -10.0;
  }
  else if (((1 << v5) & 0x60) != 0)
  {
    double v6 = -15.0;
  }
  else
  {
    double v6 = -25.0;
  }
  return v4 * v6 + 0.0;
}

- (double)_swipeUpGestureTranslation
{
  double v3 = [(SBSystemGestureWorkspaceTransaction *)self gestureRecognizer];
  uint64_t v4 = [v3 state];

  double v5 = 0.0;
  if (v4 != 1)
  {
    double v6 = [(SBModalUIFluidDismissGestureWorkspaceTransaction *)self _viewForGesture];
    int64_t dismissalType = self->_dismissalType;
    uint64_t v8 = [(SBSystemGestureWorkspaceTransaction *)self gestureRecognizer];
    uint64_t v9 = v8;
    if (dismissalType == 3)
    {
      [v8 translationInView:v6];
      double v5 = v10;
    }
    else
    {
      _UISystemGestureTranslationInView();
      double v12 = v11;

      double v5 = fmin(v12, 0.0);
    }
  }
  return v5;
}

- (double)_swipeUpGestureProgress
{
  [(SBModalUIFluidDismissGestureWorkspaceTransaction *)self _swipeUpGestureTranslation];
  double v4 = -v3;
  unint64_t v5 = [(SBModalUIFluidDismissGestureWorkspaceTransaction *)self dismissalType];
  if (v5 < 5)
  {
    double v6 = fabs(v4);
    long double v7 = pow((v6 + v6) / 500.0 + 0.0, 0.7);
    tanh(v7 * 0.6);
LABEL_4:
    BSIntervalMap();
    return result;
  }
  if (v5 - 5 < 2) {
    goto LABEL_4;
  }
  return 0.0;
}

- (BOOL)_shouldDismissImmmediatelyAtFullGestureProgress
{
  int64_t v4 = [(SBModalUIFluidDismissGestureWorkspaceTransaction *)self dismissalType];
  if ((unint64_t)(v4 - 5) < 2) {
    return 1;
  }
  if (!v4)
  {
    double v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"SBModalUIFluidDismissGestureWorkspaceTransaction.m" lineNumber:742 description:@"Invalid dismissal type for dismiss gesture workspace transaction"];

    return 0;
  }
  if (v4 != 3) {
    return 0;
  }
  return SBReduceMotion();
}

- (BOOL)_shouldFinishImmediately
{
  int64_t v2 = [(SBModalUIFluidDismissGestureWorkspaceTransaction *)self dismissalType];
  return v2 == 3 || v2 == 6;
}

- (void)_setFluidDismissalState:(id)a3
{
  id v4 = a3;
  assistantRootViewController = self->_assistantRootViewController;
  if (assistantRootViewController && (unint64_t)(self->_dismissalType - 1) <= 1)
  {
    id v7 = v4;
    [(SBAssistantRootViewController *)assistantRootViewController setFluidDismissalState:v4];
LABEL_7:
    id v4 = v7;
    goto LABEL_8;
  }
  if (self->_transientOverlayViewController)
  {
    transientOverlayPresenter = self->_transientOverlayPresenter;
    if (transientOverlayPresenter)
    {
      id v7 = v4;
      -[SBTransientOverlayPresenting setFluidDismissalState:forViewController:](transientOverlayPresenter, "setFluidDismissalState:forViewController:", v4);
      goto LABEL_7;
    }
  }
LABEL_8:
}

- (id)_viewForGesture
{
  if (self->_transientOverlayViewController) {
    transientOverlayViewController = self->_transientOverlayViewController;
  }
  else {
    transientOverlayViewController = self->_assistantRootViewController;
  }
  double v3 = [transientOverlayViewController view];
  return v3;
}

- (void)_cleanupHierarchyForDismissal:(BOOL)a3
{
  if (self->_hasPreservedInputViews)
  {
    self->_hasPreservedInputViews = 0;
    [(SBTransientOverlayViewController *)self->_transientOverlayViewController restoreInputViewsAnimated:1];
  }
  [(SBWindowSceneStatusBarSettingsAssertion *)self->_statusBarAssertion invalidate];
  statusBarAssertion = self->_statusBarAssertion;
  self->_statusBarAssertion = 0;

  assistantRootViewController = self->_assistantRootViewController;
  self->_assistantRootViewController = 0;

  transientOverlayViewController = self->_transientOverlayViewController;
  self->_transientOverlayViewController = 0;

  transientOverlayPresenter = self->_transientOverlayPresenter;
  self->_transientOverlayPresenter = 0;
}

- (id)_homeScreenAnimator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  double v3 = [WeakRetained homeScreenController];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = +[SBUIController sharedInstance];
  }
  double v6 = v5;

  return v6;
}

- (SBWindowScene)windowScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  return (SBWindowScene *)WeakRetained;
}

- (void)setWindowScene:(id)a3
{
}

- (double)dismissalThreshold
{
  return self->_dismissalThreshold;
}

- (void)setDismissalThreshold:(double)a3
{
  self->_dismissalThreshold = a3;
}

- (BOOL)animateGestureCancelationOrFailure
{
  return self->_animateGestureCancelationOrFailure;
}

- (void)setAnimateGestureCancelationOrFailure:(BOOL)a3
{
  self->_BOOL animateGestureCancelationOrFailure = a3;
}

- (SBAssistantSceneControlling)assistantController
{
  return self->_assistantController;
}

- (void)setAssistantController:(id)a3
{
}

- (int64_t)dismissalType
{
  return self->_dismissalType;
}

- (SBMainWorkspaceTransaction)currentTransaction
{
  return self->_currentTransaction;
}

- (void)setCurrentTransaction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTransaction, 0);
  objc_storeStrong((id *)&self->_assistantController, 0);
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong((id *)&self->_transientOverlayViewController, 0);
  objc_storeStrong((id *)&self->_transientOverlayPresenter, 0);
  objc_storeStrong((id *)&self->_assistantRootViewController, 0);
  objc_storeStrong((id *)&self->_dismissalFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_statusBarAssertion, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

@end