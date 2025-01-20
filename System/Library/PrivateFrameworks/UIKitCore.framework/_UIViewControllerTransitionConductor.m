@interface _UIViewControllerTransitionConductor
- (BOOL)hasInterruptibleNavigationTransition;
- (BOOL)hostIsAppearingAnimated;
- (BOOL)isInteractiveTransition;
- (BOOL)needsDeferredTransition;
- (BOOL)shouldAnimateBottomBarVisibility;
- (BOOL)shouldCrossFadeBottomBars;
- (BOOL)shouldCrossFadeNavigationBar;
- (BOOL)shouldCrossFadeNavigationBarVisibility;
- (BOOL)willPerformCustomTransition;
- (UIView)transitionContainerView;
- (UIViewControllerAnimatedTransitioning)transitionController;
- (UIViewControllerInteractiveTransitioning)interactiveTransitionController;
- (UIViewControllerTransitionCoordinator)transitionCoordinator;
- (_UIViewControllerAnimatedTransitionHandoffData)pendingPreemptionHandoffData;
- (_UIViewControllerOneToOneTransitionContext)transitionContext;
- (_UIViewControllerTransitionConductor)initWithDelegate:(id)a3 transitionManager:(id)a4;
- (_UIViewControllerTransitionConductorDelegate)delegate;
- (_UIViewControllerTransitionManager)transitionManager;
- (double)customNavigationTransitionDuration;
- (double)navigationBarHidingDurationWithDefaultDuration:(double)a3;
- (id)interruptibleNavigationTransitionAnimator;
- (id)navigationBarTransitionOverlay;
- (id)navigationToolbarTransitionController;
- (int)deferredTransitionType;
- (int64_t)navigationBarTransitionVariant;
- (void)_beginAnimationTrackingInteractive:(BOOL)a3;
- (void)_finishAnimationTracking;
- (void)_startCustomTransition:(id)a3;
- (void)_startTransition:(int)a3 fromViewController:(id)a4 toViewController:(id)a5;
- (void)setCustomNavigationTransitionDuration:(double)a3;
- (void)setDeferredTransitionType:(int)a3;
- (void)setHostIsAppearingAnimated:(BOOL)a3;
- (void)setInteractiveTransition:(BOOL)a3;
- (void)setInteractiveTransitionController:(id)a3;
- (void)setNeedsDeferredTransition;
- (void)setNeedsDeferredTransition:(BOOL)a3;
- (void)setPendingPreemptionHandoffData:(id)a3;
- (void)setTransitionContainerView:(id)a3;
- (void)setTransitionController:(id)a3;
- (void)setTransitionManager:(id)a3;
- (void)startDeferredTransitionIfNeeded;
- (void)stopTransitionsImmediately;
@end

@implementation _UIViewControllerTransitionConductor

- (BOOL)needsDeferredTransition
{
  return self->_needsDeferredTransition;
}

- (BOOL)shouldAnimateBottomBarVisibility
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 1;
  }
  transitionController = self->_transitionController;
  return [(UIViewControllerAnimatedTransitioning *)transitionController _shouldAnimateBottomBarVisibility];
}

- (void)setHostIsAppearingAnimated:(BOOL)a3
{
  self->_hostIsAppearingAnimated = a3;
}

- (void)setTransitionContainerView:(id)a3
{
}

- (void)startDeferredTransitionIfNeeded
{
  BOOL v3 = [(_UIViewControllerTransitionConductor *)self needsDeferredTransition];
  if (!self->_transitionController)
  {
    [(_UIViewControllerTransitionConductor *)self setInteractiveTransition:0];
    v4 = 0;
    if (v3) {
      goto LABEL_3;
    }
LABEL_9:
    uint64_t v8 = 0;
    uint64_t v6 = 0;
    goto LABEL_17;
  }
  v4 = [(_UIViewControllerTransitionConductor *)self transitionContext];
  if (!v3) {
    goto LABEL_9;
  }
LABEL_3:
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v6 = [WeakRetained disappearingViewControllerForTransitionConductor:self];

  id v7 = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v8 = [v7 topViewControllerForTransitionConductor:self];

  if (!(v6 | v8) || v6 != v8)
  {
    if (v6 | v8)
    {
      int v12 = 1;
      if (!v4) {
        goto LABEL_12;
      }
      goto LABEL_18;
    }
    goto LABEL_16;
  }
  v9 = [(id)v6 view];
  v10 = [(_UIViewControllerTransitionConductor *)self transitionContainerView];
  char v11 = [v9 isDescendantOfView:v10];

  if (v11)
  {
LABEL_16:
    [(_UIViewControllerTransitionConductor *)self setNeedsDeferredTransition:0];
LABEL_17:
    int v12 = 0;
    if (!v4) {
      goto LABEL_12;
    }
LABEL_18:
    uint64_t v13 = [v4 _state];
    if (!v12) {
      goto LABEL_13;
    }
    goto LABEL_19;
  }
  int v12 = 1;
  uint64_t v8 = v6;
  if (v4) {
    goto LABEL_18;
  }
LABEL_12:
  uint64_t v13 = 0;
  if (!v12)
  {
LABEL_13:
    v14 = objc_loadWeakRetained((id *)&self->_delegate);
    [v14 transitionConductor:self didStartDeferredTransition:0 context:v4];
    goto LABEL_14;
  }
LABEL_19:
  [(_UIViewControllerTransitionConductor *)self setNeedsDeferredTransition:0];
  id v16 = objc_loadWeakRetained((id *)&self->_delegate);
  [v16 transitionConductor:self willTransitionFromViewController:v6 toViewController:v8];

  char v17 = dyld_program_sdk_at_least();
  v18 = objc_loadWeakRetained((id *)&self->_delegate);
  v19 = v18;
  if (v17)
  {
    if (v18) {
      BOOL v20 = ((v18[94] >> 1) & 3u) - 3 < 0xFFFFFFFE;
    }
    else {
      BOOL v20 = 1;
    }
  }
  else
  {
    BOOL v20 = [v18 _appearState] != 2;
  }

  if (self->_transitionController && v6 && v8 && v8 != v6 && !v20)
  {
    -[_UIViewControllerTransitionConductor _startCustomTransition:](self, "_startCustomTransition:");
  }
  else
  {
    v21 = [(_UIViewControllerTransitionConductor *)self transitionContext];
    [v21 _setInteractor:0];
    [v21 _setAnimator:0];
    transitionController = self->_transitionController;
    self->_transitionController = 0;

    id v23 = objc_loadWeakRetained((id *)&self->_delegate);
    [v23 transitionConductorWillStartImmediateTransition:self];

    [(_UIViewControllerTransitionConductor *)self _startTransition:[(_UIViewControllerTransitionConductor *)self deferredTransitionType] fromViewController:v6 toViewController:v8];
    id v24 = objc_loadWeakRetained((id *)&self->_delegate);
    [v24 transitionConductorDidStartImmediateTransition:self];
  }
  id v25 = objc_loadWeakRetained((id *)&self->_delegate);
  [v25 transitionConductor:self didStartDeferredTransition:1 context:v4];

  if (v13 == 3)
  {
    int has_internal_diagnostics = os_variant_has_internal_diagnostics();
    v31 = [(_UIViewControllerTransitionConductor *)self interactiveTransitionController];

    if (has_internal_diagnostics)
    {
      if (!v31)
      {
        v35 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v39 = 0;
          _os_log_fault_impl(&dword_1853B0000, v35, OS_LOG_TYPE_FAULT, "We should only get in the deferred state if interaction controller is present", v39, 2u);
        }
      }
    }
    else if (!v31)
    {
      v37 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB263118) + 8);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v38 = 0;
        _os_log_impl(&dword_1853B0000, v37, OS_LOG_TYPE_ERROR, "We should only get in the deferred state if interaction controller is present", v38, 2u);
      }
    }
    v32 = [(_UIViewControllerTransitionConductor *)self interactiveTransitionController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      [v4 finishInteractiveTransition];
      goto LABEL_15;
    }
    v14 = [(_UIViewControllerTransitionConductor *)self interactiveTransitionController];
    [v14 finishInteractiveTransition];
  }
  else
  {
    if (v13 != 2) {
      goto LABEL_15;
    }
    int v26 = os_variant_has_internal_diagnostics();
    v27 = [(_UIViewControllerTransitionConductor *)self interactiveTransitionController];

    if (v26)
    {
      if (!v27)
      {
        v34 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v41 = 0;
          _os_log_fault_impl(&dword_1853B0000, v34, OS_LOG_TYPE_FAULT, "We should only get in the deferred state if interaction controller is present", v41, 2u);
        }
      }
    }
    else if (!v27)
    {
      v36 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_MergedGlobals_1234) + 8);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1853B0000, v36, OS_LOG_TYPE_ERROR, "We should only get in the deferred state if interaction controller is present", buf, 2u);
      }
    }
    v28 = [(_UIViewControllerTransitionConductor *)self interactiveTransitionController];
    objc_opt_class();
    char v29 = objc_opt_isKindOfClass();

    if ((v29 & 1) == 0)
    {
      [v4 cancelInteractiveTransition];
      goto LABEL_15;
    }
    v14 = [(_UIViewControllerTransitionConductor *)self interactiveTransitionController];
    [v14 cancelInteractiveTransition];
  }
LABEL_14:

LABEL_15:
  pendingPreemptionHandoffData = self->_pendingPreemptionHandoffData;
  self->_pendingPreemptionHandoffData = 0;
}

- (void)setInteractiveTransition:(BOOL)a3
{
  self->_interactiveTransition = a3;
}

- (UIViewControllerTransitionCoordinator)transitionCoordinator
{
  v2 = [(_UIViewControllerTransitionConductor *)self transitionContext];
  BOOL v3 = [v2 _transitionCoordinator];

  return (UIViewControllerTransitionCoordinator *)v3;
}

- (_UIViewControllerOneToOneTransitionContext)transitionContext
{
  return (_UIViewControllerOneToOneTransitionContext *)+[_UIViewControllerTransitionContext _associatedTransitionContextForAnimationController:self->_transitionController];
}

- (BOOL)isInteractiveTransition
{
  return self->_interactiveTransition;
}

- (int)deferredTransitionType
{
  return self->_deferredTransitionType;
}

- (void)_startTransition:(int)a3 fromViewController:(id)a4 toViewController:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v75 = a4;
  id v8 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v10 = [WeakRetained topViewControllerForTransitionConductor:self];

  if (v10 != v8)
  {
    id v11 = v10;

    id v8 = v11;
  }
  id v12 = objc_loadWeakRetained((id *)&self->_delegate);
  [v12 transitionConductor:self frameForViewController:v8];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  id v21 = objc_loadWeakRetained((id *)&self->_delegate);
  [v21 transitionConductor:self frameForWrapperViewForViewController:v8];
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;

  v30 = [v8 view];
  v31 = [v8 childModalViewController];

  if (!v31
    || (+[UIViewControllerWrapperView existingWrapperViewForView:]((uint64_t)UIViewControllerWrapperView, v30), (v32 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v32 = +[UIViewControllerWrapperView wrapperViewForView:wrapperFrame:viewFrame:](v23, v25, v27, v29, v14, v16, v18, v20, (uint64_t)UIViewControllerWrapperView, v30);
  }
  id v33 = objc_loadWeakRetained((id *)&self->_delegate);
  v34 = [v33 transitionConductor:self retargetedToViewControllerForTransitionFromViewController:v75 toViewController:v8 transition:v6];

  if (!v30
    || ([v34 view], v35 = objc_claimAutoreleasedReturnValue(), v35, v30 != v35))
  {
    v36 = [v34 view];

    id v37 = objc_loadWeakRetained((id *)&self->_delegate);
    [v37 transitionConductor:self frameForViewController:v34];
    double v39 = v38;
    double v41 = v40;
    double v43 = v42;
    double v45 = v44;

    id v46 = objc_loadWeakRetained((id *)&self->_delegate);
    [v46 transitionConductor:self frameForWrapperViewForViewController:v34];
    double v48 = v47;
    double v50 = v49;
    double v52 = v51;
    double v54 = v53;

    uint64_t v55 = +[UIViewControllerWrapperView wrapperViewForView:wrapperFrame:viewFrame:](v48, v50, v52, v54, v39, v41, v43, v45, (uint64_t)UIViewControllerWrapperView, v36);

    v32 = (void *)v55;
    v30 = v36;
  }
  id v56 = objc_loadWeakRetained((id *)&self->_delegate);
  v57 = [v56 navigationTransitionView];

  if (v34)
  {
    v58 = [v75 view];
    v59 = +[UIViewControllerWrapperView existingWrapperViewForView:]((uint64_t)UIViewControllerWrapperView, v58);
    v60 = v59;
    id v73 = v10;
    uint64_t v61 = v6;
    if (v59)
    {
      id v62 = v59;
    }
    else
    {
      id v62 = [v75 view];
    }
    id v65 = v62;

    v66 = [v65 superview];
    if (v66 == v57) {
      v67 = v65;
    }
    else {
      v67 = 0;
    }
    id v68 = v67;

    if (!v68)
    {
      v69 = [v57 subviews];
      v70 = [v69 lastObject];

      if (v70 == v32 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
        id v65 = 0;
      }
      else {
        id v65 = v70;
      }
    }
    objc_msgSend(v57, "addSubview:", v32, v73);
    id v71 = objc_loadWeakRetained((id *)&self->_delegate);
    [v71 transitionConductor:self beginPinningInputViewsForTransitionFromViewController:v75 toViewController:v34 forTransitionType:v61];

    id v72 = objc_loadWeakRetained((id *)&self->_delegate);
    [v72 transitionConductor:self didEndTransitionFromView:v65 toView:v32];

    id v10 = v74;
  }
  else
  {
    id v63 = [v75 view];
    v64 = [v57 subviews];
    [v64 makeObjectsPerformSelector:sel_removeFromSuperview];

    id v65 = objc_loadWeakRetained((id *)&self->_delegate);
    [v65 transitionConductor:self didEndTransitionFromView:v63 toView:0];
  }
}

- (BOOL)hostIsAppearingAnimated
{
  return self->_hostIsAppearingAnimated;
}

- (void)setNeedsDeferredTransition:(BOOL)a3
{
  self->_needsDeferredTransition = a3;
}

- (void)setDeferredTransitionType:(int)a3
{
  self->_deferredTransitionType = a3;
}

- (_UIViewControllerTransitionConductor)initWithDelegate:(id)a3 transitionManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_UIViewControllerTransitionConductor;
  id v8 = [(_UIViewControllerTransitionConductor *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeStrong((id *)&v9->_transitionManager, a4);
  }

  return v9;
}

- (BOOL)shouldCrossFadeBottomBars
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  transitionController = self->_transitionController;
  return [(UIViewControllerAnimatedTransitioning *)transitionController _shouldCrossFadeBottomBars];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionManager, 0);
  objc_storeStrong((id *)&self->_pendingPreemptionHandoffData, 0);
  objc_storeStrong((id *)&self->_transitionContainerView, 0);
  objc_storeStrong((id *)&self->_interactiveTransitionController, 0);
  objc_storeStrong((id *)&self->_transitionController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (BOOL)hasInterruptibleNavigationTransition
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 1;
  }
  transitionController = self->_transitionController;
  v4 = [(_UIViewControllerTransitionConductor *)self transitionContainerView];
  v5 = [v4 traitCollection];
  LOBYTE(transitionController) = [(UIViewControllerAnimatedTransitioning *)transitionController _shouldUseInterruptibleAnimatorWithTraitCollection:v5];

  return (char)transitionController;
}

- (id)navigationToolbarTransitionController
{
  if (objc_opt_respondsToSelector())
  {
    BOOL v3 = +[_UIViewControllerTransitionContext _associatedTransitionContextForAnimationController:self->_transitionController];
    v4 = [(UIViewControllerAnimatedTransitioning *)self->_transitionController _navigationToolbarTransitionControllerForContext:v3];
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)setTransitionController:(id)a3
{
}

- (void)setInteractiveTransitionController:(id)a3
{
}

- (int64_t)navigationBarTransitionVariant
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return [(_UIViewControllerTransitionConductor *)self shouldCrossFadeNavigationBar];
  }
  transitionController = self->_transitionController;
  return [(UIViewControllerAnimatedTransitioning *)transitionController _navigationBarTransitionVariant];
}

- (id)navigationBarTransitionOverlay
{
  if (objc_opt_respondsToSelector())
  {
    BOOL v3 = [(UIViewControllerAnimatedTransitioning *)self->_transitionController _navigationBarTransitionOverlay];
  }
  else
  {
    BOOL v3 = 0;
  }
  return v3;
}

- (BOOL)shouldCrossFadeNavigationBar
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  transitionController = self->_transitionController;
  return [(UIViewControllerAnimatedTransitioning *)transitionController _shouldCrossFadeNavigationBar];
}

- (BOOL)shouldCrossFadeNavigationBarVisibility
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  transitionController = self->_transitionController;
  return [(UIViewControllerAnimatedTransitioning *)transitionController _shouldCrossFadeNavigationBarVisibility];
}

- (double)navigationBarHidingDurationWithDefaultDuration:(double)a3
{
  if (objc_opt_respondsToSelector())
  {
    transitionController = self->_transitionController;
    id v6 = [(_UIViewControllerTransitionConductor *)self transitionContext];
    [(UIViewControllerAnimatedTransitioning *)transitionController _customNavigationBarHidingDuration:v6];
    a3 = v7;
  }
  return a3;
}

- (BOOL)willPerformCustomTransition
{
  return self->_transitionController != 0;
}

- (id)interruptibleNavigationTransitionAnimator
{
  if ([(_UIViewControllerTransitionConductor *)self hasInterruptibleNavigationTransition])
  {
    transitionController = self->_transitionController;
    v4 = [(_UIViewControllerTransitionConductor *)self transitionContext];
    v5 = [(UIViewControllerAnimatedTransitioning *)transitionController interruptibleAnimatorForTransition:v4];
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)setNeedsDeferredTransition
{
  self->_needsDeferredTransition = 1;
}

- (void)_beginAnimationTrackingInteractive:(BOOL)a3
{
  BOOL v3 = a3;
  if (+[UIViewPropertyAnimator _canEnableTrackingAnimationsWithAnimators])
  {
    if (!+[UIViewPropertyAnimator _trackingAnimationsCurrentlyEnabled])
    {
      id v4 = +[UIViewPropertyAnimator _startTrackingAnimations];
      +[UIViewPropertyAnimator _setTrackedAnimationsStartPaused:v3];
    }
  }
  else
  {
    id v5 = +[UIView _startAnimationTracking];
  }
}

- (void)_finishAnimationTracking
{
  if (+[UIViewPropertyAnimator _trackingAnimationsCurrentlyEnabled])
  {
    +[UIViewPropertyAnimator _finishTrackingAnimations];
  }
  else
  {
    +[UIView _finishAnimationTracking];
  }
}

- (void)_startCustomTransition:(id)a3
{
  id v52 = a3;
  id v5 = +[_UIViewControllerTransitionContext _associatedTransitionContextForAnimationController:](_UIViewControllerTransitionContext, "_associatedTransitionContextForAnimationController:");
  id v6 = [v5 toViewController];
  double v7 = [v5 fromViewController];
  id v8 = [(_UIViewControllerTransitionConductor *)self interactiveTransitionController];
  [(_UIViewControllerTransitionConductor *)self customNavigationTransitionDuration];
  objc_msgSend(v5, "_setDuration:");
  uint64_t v9 = [(_UIViewControllerTransitionConductor *)self isInteractiveTransition];
  if ((v9 & 1) == 0 && v8)
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v9 = [v8 wantsInteractiveStart];
    }
    else {
      uint64_t v9 = 1;
    }
  }
  [(_UIViewControllerTransitionConductor *)self setInteractiveTransition:v9];
  if (!v7 || !v6)
  {
    double v48 = [MEMORY[0x1E4F28B00] currentHandler];
    [v48 handleFailureInMethod:a2 object:self file:@"_UIViewControllerTransitionConductor.m" lineNumber:374 description:@"custom transitions require both a fromViewController and toViewController!"];
  }
  uint64_t v10 = [v6 view];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained transitionConductor:self frameForViewController:v6];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  double v50 = (void *)v10;
  objc_msgSend((id)v10, "setFrame:", v13, v15, v17, v19);
  id v20 = objc_loadWeakRetained((id *)&self->_delegate);
  [v20 transitionConductor:self didStartCustomTransitionWithContext:v5];

  id v21 = objc_loadWeakRetained((id *)&self->_delegate);
  [v21 transitionConductor:self frameForViewController:v6];
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;

  v30 = [v6 view];
  [v30 frame];
  v61.origin.x = v31;
  v61.origin.y = v32;
  v61.size.width = v33;
  v61.size.height = v34;
  v60.origin.x = v23;
  v60.origin.y = v25;
  v60.size.width = v27;
  v60.size.height = v29;
  LOBYTE(v10) = CGRectEqualToRect(v60, v61);

  if ((v10 & 1) == 0)
  {
    v35 = [v6 view];
    objc_msgSend(v35, "setFrame:", v23, v25, v27, v29);
  }
  objc_msgSend(v5, "_setToEndFrame:", v23, v25, v27, v29);
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __63___UIViewControllerTransitionConductor__startCustomTransition___block_invoke;
  v59[3] = &unk_1E52EA9D8;
  v59[4] = self;
  [v5 _setCompletionHandler:v59];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __63___UIViewControllerTransitionConductor__startCustomTransition___block_invoke_2;
  aBlock[3] = &unk_1E5307F30;
  aBlock[4] = self;
  double v51 = _Block_copy(aBlock);
  if (v8) {
    [(_UIViewControllerTransitionConductor *)self _beginAnimationTrackingInteractive:v9];
  }
  int v36 = [(_UIViewControllerTransitionConductor *)self deferredTransitionType];
  id v37 = objc_loadWeakRetained((id *)&self->_delegate);
  double v49 = [v37 navigationTransitionView];

  id v38 = objc_loadWeakRetained((id *)&self->_delegate);
  double v39 = [v38 inputViewAnimationStyleForTransitionConductor:self];

  objc_initWeak(&location, self);
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __63___UIViewControllerTransitionConductor__startCustomTransition___block_invoke_3;
  v53[3] = &unk_1E5307C38;
  v53[4] = self;
  id v40 = v7;
  id v54 = v40;
  id v41 = v6;
  id v55 = v41;
  int v56 = v36;
  double v42 = _Block_copy(v53);
  double v43 = [_UIViewControllerTransitionRequest alloc];
  id v44 = objc_loadWeakRetained((id *)&self->_delegate);
  double v45 = [(_UIViewControllerTransitionRequest *)v43 initWithTransitionContext:v5 animator:v52 interactor:v8 interactiveUpdateHandler:v51 keyboardShouldAnimateAlongsideForInteractiveTransitions:1 keyboardAnimationStyle:v39 pinningInputViewsResponder:v44 extraPinningInputViewsBlock:v42 handoffData:self->_pendingPreemptionHandoffData];

  id v46 = [(_UIViewControllerTransitionConductor *)self transitionManager];

  if (v46)
  {
    double v47 = [(_UIViewControllerTransitionConductor *)self transitionManager];
    [v47 performAnimatedTransitionWithRequest:v45];
  }
  else
  {
    _UIViewControllerTransitioningRunCustomTransitionWithRequest(v45);
  }
  if (v8) {
    [(_UIViewControllerTransitionConductor *)self _finishAnimationTracking];
  }
  [v5 _setTransitionIsInFlight:1];

  objc_destroyWeak(&location);
}

- (void)stopTransitionsImmediately
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    transitionController = self->_transitionController;
    [(UIViewControllerAnimatedTransitioning *)transitionController _stopTransitionImmediately];
  }
}

- (_UIViewControllerTransitionConductorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UIViewControllerTransitionConductorDelegate *)WeakRetained;
}

- (UIViewControllerAnimatedTransitioning)transitionController
{
  return self->_transitionController;
}

- (UIViewControllerInteractiveTransitioning)interactiveTransitionController
{
  return self->_interactiveTransitionController;
}

- (double)customNavigationTransitionDuration
{
  return self->_customNavigationTransitionDuration;
}

- (void)setCustomNavigationTransitionDuration:(double)a3
{
  self->_customNavigationTransitionDuration = a3;
}

- (UIView)transitionContainerView
{
  return self->_transitionContainerView;
}

- (_UIViewControllerAnimatedTransitionHandoffData)pendingPreemptionHandoffData
{
  return self->_pendingPreemptionHandoffData;
}

- (void)setPendingPreemptionHandoffData:(id)a3
{
}

- (_UIViewControllerTransitionManager)transitionManager
{
  return self->_transitionManager;
}

- (void)setTransitionManager:(id)a3
{
}

@end