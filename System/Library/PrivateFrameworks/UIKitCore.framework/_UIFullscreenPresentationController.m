@interface _UIFullscreenPresentationController
- (BOOL)_inheritsPresentingViewControllerThemeLevel;
- (BOOL)_invokesDelegatesOnOrientationChange;
- (BOOL)_shouldAnimateReenablingOfAutorotation;
- (BOOL)_shouldRespectDefinesPresentationContext;
- (BOOL)shouldPresentInFullscreen;
- (CGRect)frameOfPresentedViewInContainerView;
- (int64_t)presentationStyle;
- (void)_adjustOrientationIfNecessaryInWindow:(id)a3 forViewController:(id)a4 preservingViewController:(id)a5;
- (void)_applyCounterRotationToView:(id)a3 fromOrientation:(int64_t)a4 toOrientation:(int64_t)a5 withBounds:(CGRect)a6;
- (void)_placeCounterRotationViewWithView:(id)a3 inWindow:(id)a4 fromOrientation:(int64_t)a5 toOrientation:(int64_t)a6 force:(BOOL)a7;
- (void)_prepareForMixedOrientationTransitionIfNecessaryInWindow:(id)a3 fromViewController:(id)a4 toViewController:(id)a5;
- (void)_removeCounterRotationIfApplied;
- (void)_setPresentedViewController:(id)a3;
- (void)_transitionDidEnd:(BOOL)a3 isDismissal:(BOOL)a4;
- (void)dealloc;
- (void)dismissalTransitionDidEnd:(BOOL)a3;
- (void)presentationTransitionDidEnd:(BOOL)a3;
@end

@implementation _UIFullscreenPresentationController

- (int64_t)presentationStyle
{
  return 0;
}

- (void)dealloc
{
  [(_UIFullscreenPresentationController *)self _removeCounterRotationIfApplied];
  v3.receiver = self;
  v3.super_class = (Class)_UIFullscreenPresentationController;
  [(UIPresentationController *)&v3 dealloc];
}

- (BOOL)shouldPresentInFullscreen
{
  return 1;
}

- (BOOL)_shouldRespectDefinesPresentationContext
{
  return 0;
}

- (CGRect)frameOfPresentedViewInContainerView
{
  v2 = [(UIPresentationController *)self containerView];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (BOOL)_invokesDelegatesOnOrientationChange
{
  return dyld_program_sdk_at_least();
}

- (void)_adjustOrientationIfNecessaryInWindow:(id)a3 forViewController:(id)a4 preservingViewController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int64_t presentingViewControllerHandledCounterRotation = [(UIPresentationController *)self state];
  if (presentingViewControllerHandledCounterRotation == 1) {
    self->_unint64_t originalOrientation = [v8 interfaceOrientation];
  }
  self->_disableAnimatedReenablingOfAutorotation = 0;
  if ([v8 _isWindowServerHostingManaged] && objc_msgSend(v8, "autorotates"))
  {
    uint64_t v35 = 0;
    v36 = &v35;
    uint64_t v37 = 0x2020000000;
    uint64_t v38 = 0;
    uint64_t v38 = [(id)UIApp _expectedViewOrientation];
    if (v10 && presentingViewControllerHandledCounterRotation == 1)
    {
      uint64_t v12 = v36[3];
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __120___UIFullscreenPresentationController__adjustOrientationIfNecessaryInWindow_forViewController_preservingViewController___block_invoke;
      v34[3] = &unk_1E52E7DF0;
      v34[4] = &v35;
      -[UIViewController __withSupportedInterfaceOrientation:apply:](v10, v12, v34);
    }
    uint64_t v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x2020000000;
    uint64_t v33 = 0;
    uint64_t v13 = [v8 interfaceOrientation];
    uint64_t v14 = v36[3];
    if (v13 != v14)
    {
      if (!v14)
      {
        if (dyld_program_sdk_at_least())
        {
          uint64_t v14 = v36[3];
        }
        else
        {
          uint64_t v14 = [(id)UIApp _expectedViewOrientation];
          v36[3] = v14;
        }
      }
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __120___UIFullscreenPresentationController__adjustOrientationIfNecessaryInWindow_forViewController_preservingViewController___block_invoke_2;
      v29[3] = &unk_1E52E7E18;
      v29[4] = &v30;
      v29[5] = &v35;
      -[UIViewController __withSupportedInterfaceOrientation:apply:](v9, v14, v29);
    }
    if (!v31[3])
    {
      uint64_t v15 = -[UIViewController _preferredInterfaceOrientationForPresentationInWindow:fromInterfaceOrientation:](v9, v8, v13);
      v31[3] = v15;
    }
    if (presentingViewControllerHandledCounterRotation != 1)
    {
      if ([(_UIFullscreenPresentationController *)self _invokesDelegatesOnOrientationChange])
      {
        v16 = [(UIPresentationController *)self presentedViewController];
        uint64_t v17 = [v16 supportedInterfaceOrientations];

        unint64_t originalOrientation = self->_originalOrientation;
        if (originalOrientation > 4 || (v17 & qword_186B94158[originalOrientation]) != 0)
        {
          uint64_t v19 = v31[3];
          switch(v19)
          {
            case 0:
              uint64_t v20 = v17 & 1;
              uint64_t v21 = 1;
              break;
            case 1:
              uint64_t v20 = v17 & 2;
              uint64_t v21 = 2;
              break;
            case 2:
              uint64_t v20 = v17 & 4;
              uint64_t v21 = 4;
              break;
            case 3:
              uint64_t v20 = v17 & 8;
              uint64_t v21 = 8;
              break;
            case 4:
              uint64_t v20 = v17 & 0x10;
              uint64_t v21 = 16;
              break;
            default:
              uint64_t v20 = 0;
              uint64_t v21 = 0;
              break;
          }
          BOOL v22 = v20 == v21;
        }
        else
        {
          BOOL v22 = 0;
          uint64_t v19 = v31[3];
        }
        int64_t presentingViewControllerHandledCounterRotation = 1;
        if (v19 != originalOrientation && !v22) {
          int64_t presentingViewControllerHandledCounterRotation = self->_presentingViewControllerHandledCounterRotation;
        }
      }
      else
      {
        int64_t presentingViewControllerHandledCounterRotation = 1;
      }
    }
    id v23 = [(UIPresentationController *)self presentedViewController];

    if (v23 == v10) {
      [v10 _setFreezeLayoutForOrientationChangeOnDismissal:1];
    }
    v24 = [v8 windowScene];
    unsigned __int8 v25 = -[UIScene _systemShellOwnsInterfaceOrientation](v24);

    if (v25)
    {
      v26 = [v8 windowScene];
      int v27 = [v26 _canDynamicallySpecifySupportedInterfaceOrientations];

      if (v27) {
        [(_UIFullscreenPresentationController *)self _prepareForMixedOrientationTransitionIfNecessaryInWindow:v8 fromViewController:v10 toViewController:v9];
      }
    }
    else
    {
      v28 = [v10 view];
      [(_UIFullscreenPresentationController *)self _placeCounterRotationViewWithView:v28 inWindow:v8 fromOrientation:v13 toOrientation:v31[3] force:presentingViewControllerHandledCounterRotation];
    }
    _Block_object_dispose(&v30, 8);
    _Block_object_dispose(&v35, 8);
  }
}

- (void)_prepareForMixedOrientationTransitionIfNecessaryInWindow:(id)a3 fromViewController:(id)a4 toViewController:(id)a5
{
  id v39 = a3;
  id v8 = a4;
  id v9 = a5;
  [(_UIFullscreenPresentationController *)self _removeCounterRotationIfApplied];
  BOOL v10 = [(_UICurrentContextPresentationController *)self shouldRemovePresentersView];
  if (v10)
  {
    [v8 _willBeginCounterRotationForPresentation];
    if ([(UIPresentationController *)self state] == 1) {
      self->_int64_t presentingViewControllerHandledCounterRotation = [v8 _handlesCounterRotationForPresentation];
    }
  }
  uint64_t v11 = [v39 interfaceOrientation];
  uint64_t v12 = [v8 view];
  [v12 bounds];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  uint64_t v21 = NSString;
  BOOL v22 = _NSStringForUIPresentationControllerState([(UIPresentationController *)self state]);
  id v23 = v8;
  if (v23)
  {
    v24 = NSString;
    unsigned __int8 v25 = (objc_class *)objc_opt_class();
    v26 = NSStringFromClass(v25);
    int v27 = [v24 stringWithFormat:@"<%@: %p>", v26, v23];
  }
  else
  {
    int v27 = @"(nil)";
  }

  id v28 = v9;
  if (v28)
  {
    v29 = NSString;
    uint64_t v30 = (objc_class *)objc_opt_class();
    v31 = NSStringFromClass(v30);
    uint64_t v32 = [v29 stringWithFormat:@"<%@: %p>", v31, v28];
  }
  else
  {
    uint64_t v32 = @"(nil)";
  }

  uint64_t v33 = [v21 stringWithFormat:@"Fullscreen transition (%@): fromVC=%@ toVC=%@;", v22, v27, v32];;

  objc_msgSend(v39, "_adjustWindowOrientationForTransitionWithSupportedOrientations:preferredOrientation:reason:", objc_msgSend(v28, "__supportedInterfaceOrientations"), objc_msgSend(v28, "preferredInterfaceOrientationForPresentation"), v33);
  v34 = (_UIForcedOrientationTransactionToken *)objc_claimAutoreleasedReturnValue();
  forcedOrientationToken = self->_forcedOrientationToken;
  self->_forcedOrientationToken = v34;

  self->_disableAnimatedReenablingOfAutorotation = 1;
  uint64_t v36 = [v39 interfaceOrientation];
  if (v10)
  {
    uint64_t v37 = v36;
    if (v11 == v36)
    {
      [v23 _didEndCounterRotationForPresentation];
    }
    else
    {
      uint64_t v38 = [v23 view];
      -[_UIFullscreenPresentationController _applyCounterRotationToView:fromOrientation:toOrientation:withBounds:](self, "_applyCounterRotationToView:fromOrientation:toOrientation:withBounds:", v38, v11, v37, v14, v16, v18, v20);
    }
  }
}

- (void)_placeCounterRotationViewWithView:(id)a3 inWindow:(id)a4 fromOrientation:(int64_t)a5 toOrientation:(int64_t)a6 force:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  id v13 = a4;
  if (a6 == a5)
  {
    if (!v7)
    {
      [(_UIFullscreenPresentationController *)self _removeCounterRotationIfApplied];
      int64_t originalOrientation = self->_originalOrientation;
      if (originalOrientation)
      {
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __118___UIFullscreenPresentationController__placeCounterRotationViewWithView_inWindow_fromOrientation_toOrientation_force___block_invoke;
        v27[3] = &unk_1E52E7E40;
        id v28 = v13;
        int64_t v29 = originalOrientation;
        int64_t v30 = a6;
        BOOL v31 = v7;
        double v15 = (void *)[v27 copy];
        id finalRotationBlock = self->_finalRotationBlock;
        self->_id finalRotationBlock = v15;
      }
    }
  }
  else
  {
    [(_UIFullscreenPresentationController *)self _removeCounterRotationIfApplied];
    [v12 bounds];
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    if ([(_UICurrentContextPresentationController *)self shouldRemovePresentersView])
    {
      unsigned __int8 v25 = -[UIView __viewDelegate]((id *)v12);
      [v25 _willBeginCounterRotationForPresentation];

      if ([(UIPresentationController *)self state] == 1)
      {
        v26 = -[UIView __viewDelegate]((id *)v12);
        self->_int64_t presentingViewControllerHandledCounterRotation = [v26 _handlesCounterRotationForPresentation];
      }
      -[UIWindow _internal_setRotatableViewOrientation:updateStatusBar:duration:force:]((id *)v13, a6, 1, v7, 0.0);
      -[_UIFullscreenPresentationController _applyCounterRotationToView:fromOrientation:toOrientation:withBounds:](self, "_applyCounterRotationToView:fromOrientation:toOrientation:withBounds:", v12, a5, a6, v18, v20, v22, v24);
    }
    else
    {
      -[UIWindow _internal_setRotatableViewOrientation:updateStatusBar:duration:force:]((id *)v13, a6, 1, v7, 0.0);
    }
  }
}

- (void)_applyCounterRotationToView:(id)a3 fromOrientation:(int64_t)a4 toOrientation:(int64_t)a5 withBounds:(CGRect)a6
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  id v13 = (UIView *)a3;
  double v14 = v13;
  memset(&v22, 0, sizeof(v22));
  if (v13) {
    [(UIView *)v13 transform];
  }
  double v15 = 0.0;
  double v16 = 0.0;
  if (a4 != 1)
  {
    if (a4 == 3)
    {
      double v16 = 1.57079633;
    }
    else if (a4 == 4)
    {
      double v16 = -1.57079633;
    }
    else
    {
      double v16 = 3.14159265;
      if (a4 != 2) {
        double v16 = 0.0;
      }
    }
  }
  if (a5 != 1)
  {
    if (a5 == 3)
    {
      double v15 = 1.57079633;
    }
    else if (a5 == 4)
    {
      double v15 = -1.57079633;
    }
    else
    {
      double v15 = 3.14159265;
      if (a5 != 2) {
        double v15 = 0.0;
      }
    }
  }
  double v17 = v16 - v15;
  CGAffineTransform v20 = v22;
  CGAffineTransformRotate(&v21, &v20, v16 - v15);
  CGAffineTransform v22 = v21;
  CGAffineTransform v19 = v21;
  [(UIView *)v14 setTransform:&v19];
  self->_counterRotatedAngle = v17;
  self->_counterRotatedOriginalBounds.origin.double x = x;
  self->_counterRotatedOriginalBounds.origin.double y = y;
  self->_counterRotatedOriginalBounds.size.double width = width;
  self->_counterRotatedOriginalBounds.size.double height = height;
  -[UIView setBounds:](v14, "setBounds:", x, y, width, height);
  counterRotatedView = self->_counterRotatedView;
  self->_counterRotatedView = v14;
}

- (void)_removeCounterRotationIfApplied
{
  counterRotatedView = self->_counterRotatedView;
  if (counterRotatedView)
  {
    memset(&v10, 0, sizeof(v10));
    [(UIView *)counterRotatedView transform];
    CGFloat v4 = -self->_counterRotatedAngle;
    CGAffineTransform v8 = v10;
    CGAffineTransformRotate(&v9, &v8, v4);
    CGAffineTransform v10 = v9;
    CGAffineTransform v7 = v9;
    [(UIView *)self->_counterRotatedView setTransform:&v7];
    -[UIView setBounds:](self->_counterRotatedView, "setBounds:", self->_counterRotatedOriginalBounds.origin.x, self->_counterRotatedOriginalBounds.origin.y, self->_counterRotatedOriginalBounds.size.width, self->_counterRotatedOriginalBounds.size.height);
    double v5 = -[UIView __viewDelegate]((id *)&self->_counterRotatedView->super.super.isa);
    [v5 _didEndCounterRotationForPresentation];

    double v6 = self->_counterRotatedView;
    self->_counterRotatedView = 0;
  }
}

- (void)presentationTransitionDidEnd:(BOOL)a3
{
  BOOL v3 = a3;
  [(_UIFullscreenPresentationController *)self _transitionDidEnd:a3 isDismissal:0];
  v5.receiver = self;
  v5.super_class = (Class)_UIFullscreenPresentationController;
  [(UIPresentationController *)&v5 presentationTransitionDidEnd:v3];
}

- (void)dismissalTransitionDidEnd:(BOOL)a3
{
  BOOL v3 = a3;
  [(_UIFullscreenPresentationController *)self _transitionDidEnd:a3 isDismissal:1];
  v5.receiver = self;
  v5.super_class = (Class)_UIFullscreenPresentationController;
  [(UIPresentationController *)&v5 dismissalTransitionDidEnd:v3];
}

- (void)_transitionDidEnd:(BOOL)a3 isDismissal:(BOOL)a4
{
  BOOL v4 = a4;
  forcedOrientationToken = self->_forcedOrientationToken;
  if (forcedOrientationToken) {
    BOOL v7 = !a3;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (forcedOrientationToken)
    {
      [(_UIForcedOrientationTransactionToken *)forcedOrientationToken cancel];
      CGAffineTransform v8 = self->_forcedOrientationToken;
      self->_forcedOrientationToken = 0;
    }
    [(_UIFullscreenPresentationController *)self _removeCounterRotationIfApplied];
    if (v4)
    {
      id finalRotationBlock = (void (**)(void))self->_finalRotationBlock;
      if (finalRotationBlock)
      {
        finalRotationBlock[2]();
        id v10 = self->_finalRotationBlock;
        self->_id finalRotationBlock = 0;
      }
      id v12 = [(UIPresentationController *)self presentedViewController];
      [v12 _setFreezeLayoutForOrientationChangeOnDismissal:0];
    }
  }
  else
  {
    objc_initWeak(&location, self);
    uint64_t v11 = self->_forcedOrientationToken;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __69___UIFullscreenPresentationController__transitionDidEnd_isDismissal___block_invoke;
    v13[3] = &unk_1E52E7E68;
    objc_copyWeak(&v14, &location);
    BOOL v15 = v4;
    [(_UIForcedOrientationTransactionToken *)v11 commitAnimated:0 completionBlock:v13];
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

- (void)_setPresentedViewController:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIFullscreenPresentationController;
  id v3 = a3;
  [(UIPresentationController *)&v5 _setPresentedViewController:v3];
  BOOL v4 = objc_msgSend(v3, "view", v5.receiver, v5.super_class);

  if (![v4 _wantsAutolayout]
    || [v4 translatesAutoresizingMaskIntoConstraints])
  {
    [v4 setAutoresizingMask:18];
  }
}

- (BOOL)_inheritsPresentingViewControllerThemeLevel
{
  return 0;
}

- (BOOL)_shouldAnimateReenablingOfAutorotation
{
  return !self->_disableAnimatedReenablingOfAutorotation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_forcedOrientationToken, 0);
  objc_storeStrong(&self->_finalRotationBlock, 0);
  objc_storeStrong((id *)&self->_counterRotatedView, 0);
}

@end