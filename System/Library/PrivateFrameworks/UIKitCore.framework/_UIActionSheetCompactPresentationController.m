@interface _UIActionSheetCompactPresentationController
- ($12108E44556860A125E570C4E6FEF4BB)_currentLayoutGeometry;
- (BOOL)_shouldDisableAvoidsKeyboard;
- (BOOL)_shouldOccludeDuringPresentation;
- (BOOL)_shouldPresentedViewControllerControlStatusBarAppearance;
- (BOOL)avoidsKeyboardDisabled;
- (BOOL)dismissActionUsesShorterHeightWhenCompactVertically;
- (BOOL)hasPendingAnimatedLayout;
- (BOOL)shouldAdoptPresentedAppearance;
- (BOOL)shouldPresentInFullscreen;
- (CGRect)frameOfPresentedViewInContainerView;
- (CGSize)_minimumSizeForDismissButton;
- (CGSize)preferredContentSize;
- (NSString)dismissActionTitle;
- (UIActionSheetPresentationControllerDismissActionView)dismissActionView;
- (UIActionSheetPresentationControllerVisualStyle)visualStyle;
- (UIEdgeInsets)_baseContentInsetsWithLeftMargin:(double *)a3 rightMargin:(double *)a4;
- (UILongPressGestureRecognizer)dismissActionViewGestureRecognizer;
- (UITapGestureRecognizer)dimmingViewDismissTapGestureRecognizer;
- (UIView)dimmingView;
- (_UIActionSheetCompactPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4 visualStyle:(id)a5;
- (_UIActionSheetCompactPresentationControllerDelegate)actionSheetDelegate;
- (_UIAnimationCoordinator)animationCoordinator;
- (_UIDimmingKnockoutBackdropView)backdropView;
- (double)_resizeAnimationDuration;
- (double)pseudoAlertPreferredTop;
- (void)_applyVisualAffordancesToViews;
- (void)_dismiss;
- (void)_handleDismiss:(id)a3;
- (void)_keyboardChanged:(id)a3;
- (void)_layoutViews;
- (void)_subscribeToKeyboardNotifications;
- (void)_transitionToPresentationController:(id)a3 withTransitionCoordinator:(id)a4;
- (void)_unsubscribeFromKeyboardNotifications;
- (void)_updateForKeyboardStartFrame:(CGRect)a3 endFrame:(CGRect)a4 duration:(double)a5 curve:(int64_t)a6;
- (void)_willRunTransitionForCurrentStateDeferred:(BOOL)a3;
- (void)beginPseudoAlertPresentationMode;
- (void)dealloc;
- (void)dismissalTransitionWillBegin;
- (void)endPseudoAlertPresentationMode;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)presentationTransitionWillBegin;
- (void)setActionSheetDelegate:(id)a3;
- (void)setAnimationCoordinator:(id)a3;
- (void)setAvoidsKeyboardDisabled:(BOOL)a3;
- (void)setBackdropView:(id)a3;
- (void)setDimmingView:(id)a3;
- (void)setDimmingViewDismissTapGestureRecognizer:(id)a3;
- (void)setDismissActionTitle:(id)a3;
- (void)setDismissActionUsesShorterHeightWhenCompactVertically:(BOOL)a3;
- (void)setDismissActionView:(id)a3;
- (void)setDismissActionViewGestureRecognizer:(id)a3;
- (void)setHasPendingAnimatedLayout:(BOOL)a3;
- (void)setPseudoAlertPreferredTop:(double)a3;
- (void)setShouldAdoptPresentedAppearance:(BOOL)a3;
- (void)setVisualStyle:(id)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation _UIActionSheetCompactPresentationController

- (_UIActionSheetCompactPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4 visualStyle:(id)a5
{
  id v8 = a5;
  v20.receiver = self;
  v20.super_class = (Class)_UIActionSheetCompactPresentationController;
  v9 = [(UIPresentationController *)&v20 initWithPresentedViewController:a3 presentingViewController:a4];
  v10 = v9;
  if (v9)
  {
    v9->_pseudoAlertPreferredTop = -1.0;
    v11 = [v8 dismissActionView];
    [(_UIActionSheetCompactPresentationController *)v10 setDismissActionView:v11];
    v12 = [[UILongPressGestureRecognizer alloc] initWithTarget:v10 action:sel__handleDismiss_];
    [(UILongPressGestureRecognizer *)v12 setMinimumPressDuration:0.0];
    [(UIGestureRecognizer *)v12 setCancelsTouchesInView:1];
    [(UIGestureRecognizer *)v12 setDelaysTouchesBegan:1];
    [v11 addGestureRecognizer:v12];
    [(_UIActionSheetCompactPresentationController *)v10 setDismissActionViewGestureRecognizer:v12];
    v13 = objc_alloc_init(UIView);
    v14 = [v8 dimmingViewColor];
    [(UIView *)v13 setBackgroundColor:v14];

    [(_UIActionSheetCompactPresentationController *)v10 setDimmingView:v13];
    v15 = [[UITapGestureRecognizer alloc] initWithTarget:v10 action:sel__dismiss];
    dimmingViewDismissTapGestureRecognizer = v10->_dimmingViewDismissTapGestureRecognizer;
    v10->_dimmingViewDismissTapGestureRecognizer = v15;

    [(UIView *)v13 addGestureRecognizer:v10->_dimmingViewDismissTapGestureRecognizer];
    v17 = [[_UIDimmingKnockoutBackdropView alloc] initWithStyle:0];
    [v8 cornerRadius];
    -[_UIDimmingKnockoutBackdropView setCornerRadius:](v17, "setCornerRadius:");
    [(_UIActionSheetCompactPresentationController *)v10 setBackdropView:v17];
    v18 = [(UIPresentationController *)v10 presentedView];
    [v18 setAutoresizingMask:0];

    [(_UIActionSheetCompactPresentationController *)v10 setVisualStyle:v8];
  }

  return v10;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"UIKeyboardPrivateWillChangeFrameNotification" object:0];

  v4.receiver = self;
  v4.super_class = (Class)_UIActionSheetCompactPresentationController;
  [(UIPresentationController *)&v4 dealloc];
}

- (BOOL)shouldPresentInFullscreen
{
  v2 = self;
  v3 = [(_UIActionSheetCompactPresentationController *)self actionSheetDelegate];
  LOBYTE(v2) = [v3 actionSheetCompactPresentationControllerShouldPresentInCurrentContext:v2] ^ 1;

  return (char)v2;
}

- (BOOL)_shouldPresentedViewControllerControlStatusBarAppearance
{
  return 0;
}

- (BOOL)_shouldOccludeDuringPresentation
{
  return 1;
}

- (UIEdgeInsets)_baseContentInsetsWithLeftMargin:(double *)a3 rightMargin:(double *)a4
{
  v34.receiver = self;
  v34.super_class = (Class)_UIActionSheetCompactPresentationController;
  [(UIPresentationController *)&v34 _baseContentInsetsWithLeftMargin:a3 rightMargin:a4];
  if (self->_hasPendingAnimatedLayout)
  {
    id v8 = [(UIPresentationController *)self presentedViewController];
    [v8 _contentOverlayInsets];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
  }
  else
  {
    double v17 = v5;
    double v12 = v6;
    double v16 = v7;
    [(_UIActionSheetCompactPresentationController *)self frameOfPresentedViewInContainerView];
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    CGFloat v23 = v22;
    CGFloat v25 = v24;
    v26 = [(UIPresentationController *)self containerView];
    v27 = [v26 window];
    [v27 bounds];
    double v33 = v28;

    v35.origin.x = v19;
    v35.origin.y = v21;
    v35.size.width = v23;
    v35.size.height = v25;
    double v10 = fmax(v17 - CGRectGetMinY(v35), 0.0);
    v36.origin.x = v19;
    v36.origin.y = v21;
    v36.size.width = v23;
    v36.size.height = v25;
    double v14 = fmax(CGRectGetMaxY(v36) - (v33 - v10), 0.0);
  }
  double v29 = v10;
  double v30 = v12;
  double v31 = v14;
  double v32 = v16;
  result.right = v32;
  result.bottom = v31;
  result.left = v30;
  result.top = v29;
  return result;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  self->_hasPendingAnimatedLayout = 1;
  v9.receiver = self;
  v9.super_class = (Class)_UIActionSheetCompactPresentationController;
  id v7 = a4;
  -[UIPresentationController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __98___UIActionSheetCompactPresentationController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E52DA598;
  v8[4] = self;
  [v7 animateAlongsideTransition:v8 completion:0];
}

- (void)_transitionToPresentationController:(id)a3 withTransitionCoordinator:(id)a4
{
  self->_pseudoAlertPreferredTop = -1.0;
  v4.receiver = self;
  v4.super_class = (Class)_UIActionSheetCompactPresentationController;
  [(UIPresentationController *)&v4 _transitionToPresentationController:a3 withTransitionCoordinator:a4];
}

- (CGRect)frameOfPresentedViewInContainerView
{
  v3 = [(UIPresentationController *)self containerView];
  objc_super v4 = [v3 window];
  double v5 = [v4 screen];

  [(_UIActionSheetCompactPresentationController *)self _currentLayoutGeometry];
  double v6 = [(UIPresentationController *)self containerView];
  id v7 = [v5 coordinateSpace];
  double v8 = UIActionSheetPresentationControllerCurrentKeyboardFrame(v5);
  CGFloat v12 = UIActionSheetPresentationControllerFrameForPresentedView(&v23, v6, v7, v8, v9, v10, v11);
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  double v19 = v12;
  double v20 = v14;
  double v21 = v16;
  double v22 = v18;
  result.size.double height = v22;
  result.size.double width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (void)_layoutViews
{
  v3 = [(UIPresentationController *)self containerView];
  objc_super v4 = [v3 window];
  double v5 = [v4 screen];

  double v6 = [(UIPresentationController *)self presentedView];
  id v7 = [(_UIActionSheetCompactPresentationController *)self backdropView];
  double v8 = [(_UIActionSheetCompactPresentationController *)self dismissActionView];
  double v9 = [(_UIActionSheetCompactPresentationController *)self dimmingView];
  double v10 = [(UIPresentationController *)self containerView];
  double v11 = [v5 coordinateSpace];
  [(_UIActionSheetCompactPresentationController *)self _currentLayoutGeometry];
  double v12 = UIActionSheetPresentationControllerCurrentKeyboardFrame(v5);
  UIActionSheetPresentationControllerLayoutViews(v6, v7, v8, v9, v10, v11, v16, v12, v13, v14, v15);
}

- (void)_applyVisualAffordancesToViews
{
  [(_UIActionSheetCompactPresentationController *)self _currentLayoutGeometry];
  v3 = [(_UIActionSheetCompactPresentationController *)self dimmingView];
  objc_super v4 = v3;
  double v5 = 1.0;
  if (!v6) {
    double v5 = 0.0;
  }
  [v3 setAlpha:v5];
}

- (CGSize)preferredContentSize
{
  [(_UIActionSheetCompactPresentationController *)self _currentLayoutGeometry];
  double v2 = v4;
  double v3 = v5;
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (void)presentationTransitionWillBegin
{
  [(_UIActionSheetCompactPresentationController *)self _subscribeToKeyboardNotifications];
  double v3 = [(UIPresentationController *)self containerView];
  double v4 = [(_UIActionSheetCompactPresentationController *)self dimmingView];
  double v5 = [(UIPresentationController *)self presentedView];
  char v6 = [(_UIActionSheetCompactPresentationController *)self backdropView];
  id v7 = [(_UIActionSheetCompactPresentationController *)self dismissActionView];
  UIActionSheetPresentationControllerAddViewsToContainerView(v3, v4, v5, v6, v7);

  double v8 = [(UIPresentationController *)self presentedView];
  [v8 setClipsToBounds:1];

  double v9 = [(UIPresentationController *)self presentedView];
  double v10 = [(_UIActionSheetCompactPresentationController *)self visualStyle];
  [v10 cornerRadius];
  objc_msgSend(v9, "_setContinuousCornerRadius:");

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __78___UIActionSheetCompactPresentationController_presentationTransitionWillBegin__block_invoke;
  aBlock[3] = &unk_1E52DC3A0;
  aBlock[4] = self;
  double v11 = _Block_copy(aBlock);
  double v12 = [(UIPresentationController *)self presentedViewController];
  LODWORD(v5) = [v12 isBeingPresented];

  double v13 = (void (*)(void *, uint64_t))v11[2];
  if (v5)
  {
    v13(v11, 0);
    double v14 = [(UIPresentationController *)self presentedViewController];
    double v15 = [v14 transitionCoordinator];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __78___UIActionSheetCompactPresentationController_presentationTransitionWillBegin__block_invoke_2;
    v16[3] = &unk_1E52DA110;
    double v17 = v11;
    [v15 animateAlongsideTransition:v16 completion:0];
  }
  else
  {
    v13(v11, 1);
  }
}

- (void)_willRunTransitionForCurrentStateDeferred:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UIActionSheetCompactPresentationController;
  [(UIPresentationController *)&v4 _willRunTransitionForCurrentStateDeferred:a3];
  if (![(UIPresentationController *)self presenting]) {
    [(_UIActionSheetCompactPresentationController *)self _unsubscribeFromKeyboardNotifications];
  }
}

- (void)dismissalTransitionWillBegin
{
  [(_UIActionSheetCompactPresentationController *)self _unsubscribeFromKeyboardNotifications];
  [(_UIActionSheetCompactPresentationController *)self setShouldAdoptPresentedAppearance:0];
  double v3 = [(UIPresentationController *)self presentedViewController];
  objc_super v4 = [v3 transitionCoordinator];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __75___UIActionSheetCompactPresentationController_dismissalTransitionWillBegin__block_invoke;
  v5[3] = &unk_1E52DA598;
  v5[4] = self;
  [v4 animateAlongsideTransition:v5 completion:0];
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)_UIActionSheetCompactPresentationController;
  [(UIPresentationController *)&v33 preferredContentSizeDidChangeForChildContentContainer:v4];
  double v5 = [(UIPresentationController *)self containerView];

  if (v5)
  {
    objc_initWeak(&location, self);
    [v4 preferredContentSize];
    id v7 = v6;
    double v9 = v8;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __101___UIActionSheetCompactPresentationController_preferredContentSizeDidChangeForChildContentContainer___block_invoke;
    aBlock[3] = &unk_1E52E6A08;
    objc_copyWeak(v31, &location);
    v31[1] = v7;
    v31[2] = v9;
    double v10 = _Block_copy(aBlock);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __101___UIActionSheetCompactPresentationController_preferredContentSizeDidChangeForChildContentContainer___block_invoke_2;
    v28[3] = &unk_1E52DC308;
    objc_copyWeak(&v29, &location);
    double v11 = _Block_copy(v28);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __101___UIActionSheetCompactPresentationController_preferredContentSizeDidChangeForChildContentContainer___block_invoke_3;
    v26[3] = &unk_1E52DC308;
    objc_copyWeak(&v27, &location);
    double v12 = _Block_copy(v26);
    [(_UIActionSheetCompactPresentationController *)self frameOfPresentedViewInContainerView];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v21 = [(UIPresentationController *)self presentedView];
    double v22 = [(UIPresentationController *)self containerView];
    double v23 = [(UIPresentationController *)self presentedViewController];
    [(_UIActionSheetCompactPresentationController *)self _resizeAnimationDuration];
    CGFloat v25 = UIActionSheetPresentationControllerAnimationCoordinatorForFrameChangeOfView(v21, v22, v23, v10, v11, v12, v14, v16, v18, v20, v24);

    [(_UIActionSheetCompactPresentationController *)self setAnimationCoordinator:v25];
    [v25 animate];

    objc_destroyWeak(&v27);
    objc_destroyWeak(&v29);

    objc_destroyWeak(v31);
    objc_destroyWeak(&location);
  }
}

- (void)_subscribeToKeyboardNotifications
{
  double v3 = [(UIPresentationController *)self containerView];
  id v4 = [v3 window];
  id v6 = [v4 screen];

  double v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 addObserver:self selector:sel__keyboardChanged_ name:@"UIKeyboardPrivateWillChangeFrameNotification" object:v6];
}

- (void)_unsubscribeFromKeyboardNotifications
{
  double v3 = [(UIPresentationController *)self containerView];
  id v4 = [v3 window];
  id v6 = [v4 screen];

  double v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self name:@"UIKeyboardPrivateWillChangeFrameNotification" object:v6];
}

- (void)_keyboardChanged:(id)a3
{
  id v4 = a3;
  double v5 = [v4 userInfo];
  id v6 = [v5 valueForKey:@"UIKeyboardFrameBeginUserInfoKey"];
  [v6 CGRectValue];
  double v31 = v7;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = [v4 userInfo];
  double v15 = [v14 valueForKey:@"UIKeyboardFrameEndUserInfoKey"];
  [v15 CGRectValue];
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;

  double v24 = [v4 userInfo];
  CGFloat v25 = [v24 valueForKey:@"UIKeyboardAnimationDurationUserInfoKey"];
  [v25 doubleValue];
  uint64_t v27 = v26;

  double v28 = [v4 userInfo];

  id v29 = [v28 valueForKey:@"UIKeyboardAnimationCurveUserInfoKey"];
  uint64_t v30 = [v29 integerValue];

  -[_UIActionSheetCompactPresentationController _updateForKeyboardStartFrame:endFrame:duration:curve:](self, "_updateForKeyboardStartFrame:endFrame:duration:curve:", v30, v31, v9, v11, v13, v17, v19, v21, v23, v27);
}

- (void)_updateForKeyboardStartFrame:(CGRect)a3 endFrame:(CGRect)a4 duration:(double)a5 curve:(int64_t)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v9 = a3.size.height;
  double v10 = a3.size.width;
  double v11 = a3.origin.y;
  double v12 = a3.origin.x;
  double v14 = [(UIPresentationController *)self presentedView];
  double v15 = [(_UIActionSheetCompactPresentationController *)self backdropView];
  double v16 = [(_UIActionSheetCompactPresentationController *)self dismissActionView];
  double v17 = [(_UIActionSheetCompactPresentationController *)self dimmingView];
  double v18 = [(UIPresentationController *)self containerView];
  double v19 = [(UIPresentationController *)self containerView];
  double v20 = [v19 window];
  double v21 = [v20 screen];
  double v22 = [v21 coordinateSpace];
  [(_UIActionSheetCompactPresentationController *)self _currentLayoutGeometry];
  UIActionSheetPresentationControllerAdjustForKeyboardNotification(v14, v15, v16, v17, v18, v22, v25, a6, v12, v11, v10, v9, x, y, width, height, a5);
}

- (void)setDismissActionTitle:(id)a3
{
  id v4 = &stru_1ED0E84C0;
  if (a3) {
    id v4 = (__CFString *)a3;
  }
  double v5 = v4;
  id v7 = [(_UIActionSheetCompactPresentationController *)self visualStyle];
  id v6 = [v7 dismissActionView];
  [v6 setTitle:v5];
}

- (NSString)dismissActionTitle
{
  double v2 = [(_UIActionSheetCompactPresentationController *)self visualStyle];
  double v3 = [v2 dismissActionView];
  id v4 = [v3 title];

  return (NSString *)v4;
}

- (void)beginPseudoAlertPresentationMode
{
  id v6 = [(UIPresentationController *)self presentedView];
  if (![(UIPresentationController *)self _isAdapted])
  {
    [v6 frame];
    self->_pseudoAlertPreferredTop = CGRectGetMinY(v8);
  }
  double v3 = [(_UIActionSheetCompactPresentationController *)self visualStyle];
  id v4 = [v3 dismissActionView];
  [v4 setHidden:1];

  double v5 = [(_UIActionSheetCompactPresentationController *)self dimmingViewDismissTapGestureRecognizer];
  [v5 setEnabled:0];
}

- (void)endPseudoAlertPresentationMode
{
  self->_pseudoAlertPreferredTop = -1.0;
  double v3 = [(_UIActionSheetCompactPresentationController *)self visualStyle];
  id v4 = [v3 dismissActionView];
  [v4 setHidden:0];

  id v5 = [(_UIActionSheetCompactPresentationController *)self dimmingViewDismissTapGestureRecognizer];
  [v5 setEnabled:1];
}

- (void)setDismissActionUsesShorterHeightWhenCompactVertically:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(_UIActionSheetCompactPresentationController *)self visualStyle];
  id v4 = [v5 dismissActionView];
  [v4 setUsesShortCompactVerticalLayout:v3];
}

- (BOOL)dismissActionUsesShorterHeightWhenCompactVertically
{
  double v2 = [(_UIActionSheetCompactPresentationController *)self visualStyle];
  BOOL v3 = [v2 dismissActionView];
  char v4 = [v3 usesShortCompactVerticalLayout];

  return v4;
}

- (void)_dismiss
{
  BOOL v3 = [(_UIActionSheetCompactPresentationController *)self actionSheetDelegate];
  char v4 = [(UIPresentationController *)self presentedViewController];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55___UIActionSheetCompactPresentationController__dismiss__block_invoke;
  v6[3] = &unk_1E52D9F98;
  id v7 = v3;
  CGRect v8 = self;
  id v5 = v3;
  [v4 dismissViewControllerAnimated:1 completion:v6];
}

- (void)_handleDismiss:(id)a3
{
  id v4 = a3;
  id v8 = [(_UIActionSheetCompactPresentationController *)self dismissActionView];
  [v4 locationInView:v8];
  uint64_t v5 = objc_msgSend(v8, "pointInside:withEvent:", 0);
  uint64_t v6 = [v4 state];

  switch(v6)
  {
    case 1:
      uint64_t v7 = 1;
      goto LABEL_7;
    case 2:
      uint64_t v7 = v5;
      goto LABEL_7;
    case 3:
      [v8 setHighlighted:0];
      if (v5) {
        [(_UIActionSheetCompactPresentationController *)self _dismiss];
      }
      break;
    case 4:
    case 5:
      uint64_t v7 = 0;
LABEL_7:
      [v8 setHighlighted:v7];
      break;
    default:
      break;
  }
}

- ($12108E44556860A125E570C4E6FEF4BB)_currentLayoutGeometry
{
  id v24 = [(_UIActionSheetCompactPresentationController *)self visualStyle];
  *(_OWORD *)&retstr->var0 = 0u;
  retstr->var2.origin = 0u;
  retstr->var2.size = 0u;
  retstr->var3 = 0u;
  *(_OWORD *)&retstr->var4.top = 0u;
  *(_OWORD *)&retstr->var4.bottom = 0u;
  *(_OWORD *)&retstr->var5 = 0u;
  retstr->var8 = 0u;
  retstr->var0 = [(_UIActionSheetCompactPresentationController *)self shouldAdoptPresentedAppearance];
  uint64_t v5 = [(UIPresentationController *)self containerView];
  [v5 bounds];
  retstr->var2.origin.double x = v6;
  retstr->var2.origin.double y = v7;
  retstr->var2.size.double width = v8;
  retstr->var2.size.double height = v9;

  double v10 = [(UIPresentationController *)self presentedViewController];
  [v10 preferredContentSize];
  retstr->var3.double width = v11;
  retstr->var3.double height = v12;

  [(_UIActionSheetCompactPresentationController *)self pseudoAlertPreferredTop];
  retstr->var1 = v13;
  double v14 = [(UIPresentationController *)self containerView];
  [v24 contentInsetsForContainerView:v14];
  retstr->var4.top = v15;
  retstr->var4.left = v16;
  retstr->var4.bottom = v17;
  retstr->var4.right = v18;

  [v24 dismissToContentSpacing];
  retstr->var5 = v19;
  [(_UIActionSheetCompactPresentationController *)self _minimumSizeForDismissButton];
  retstr->var8.double width = v20;
  retstr->var8.double height = v21;
  double v22 = [(_UIActionSheetCompactPresentationController *)self dismissActionView];
  retstr->var7 = [v22 isHidden];

  retstr->var6 = [(_UIActionSheetCompactPresentationController *)self _shouldDisableAvoidsKeyboard];

  return result;
}

- (BOOL)_shouldDisableAvoidsKeyboard
{
  if ([(_UIActionSheetCompactPresentationController *)self avoidsKeyboardDisabled]) {
    return 1;
  }
  id v4 = [(UIPresentationController *)self containerView];
  uint64_t v5 = [v4 window];

  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  char v7 = [v5 _isSceneSized];
  if (UIKeyboardAutomaticIsOnScreen())
  {
    CGFloat v8 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
    int v9 = [v8 keyboardActive] ^ 1;
  }
  else
  {
    LOBYTE(v9) = 0;
  }
  char v3 = isKindOfClass & v7 & v9;

  return v3;
}

- (CGSize)_minimumSizeForDismissButton
{
  double v2 = [(_UIActionSheetCompactPresentationController *)self visualStyle];
  char v3 = [v2 dismissActionView];
  objc_msgSend(v3, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.double height = v9;
  result.double width = v8;
  return result;
}

- (double)_resizeAnimationDuration
{
  return 0.35;
}

- (BOOL)avoidsKeyboardDisabled
{
  return self->_avoidsKeyboardDisabled;
}

- (void)setAvoidsKeyboardDisabled:(BOOL)a3
{
  self->_avoidsKeyboardDisabled = a3;
}

- (_UIActionSheetCompactPresentationControllerDelegate)actionSheetDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionSheetDelegate);
  return (_UIActionSheetCompactPresentationControllerDelegate *)WeakRetained;
}

- (void)setActionSheetDelegate:(id)a3
{
}

- (BOOL)shouldAdoptPresentedAppearance
{
  return self->_shouldAdoptPresentedAppearance;
}

- (void)setShouldAdoptPresentedAppearance:(BOOL)a3
{
  self->_shouldAdoptPresentedAppearance = a3;
}

- (UIActionSheetPresentationControllerDismissActionView)dismissActionView
{
  return self->_dismissActionView;
}

- (void)setDismissActionView:(id)a3
{
}

- (UILongPressGestureRecognizer)dismissActionViewGestureRecognizer
{
  return self->_dismissActionViewGestureRecognizer;
}

- (void)setDismissActionViewGestureRecognizer:(id)a3
{
}

- (UITapGestureRecognizer)dimmingViewDismissTapGestureRecognizer
{
  return self->_dimmingViewDismissTapGestureRecognizer;
}

- (void)setDimmingViewDismissTapGestureRecognizer:(id)a3
{
}

- (UIView)dimmingView
{
  return self->_dimmingView;
}

- (void)setDimmingView:(id)a3
{
}

- (_UIDimmingKnockoutBackdropView)backdropView
{
  return self->_backdropView;
}

- (void)setBackdropView:(id)a3
{
}

- (_UIAnimationCoordinator)animationCoordinator
{
  return self->_animationCoordinator;
}

- (void)setAnimationCoordinator:(id)a3
{
}

- (UIActionSheetPresentationControllerVisualStyle)visualStyle
{
  return self->_visualStyle;
}

- (void)setVisualStyle:(id)a3
{
}

- (double)pseudoAlertPreferredTop
{
  return self->_pseudoAlertPreferredTop;
}

- (void)setPseudoAlertPreferredTop:(double)a3
{
  self->_pseudoAlertPreferredTop = a3;
}

- (BOOL)hasPendingAnimatedLayout
{
  return self->_hasPendingAnimatedLayout;
}

- (void)setHasPendingAnimatedLayout:(BOOL)a3
{
  self->_hasPendingAnimatedLayout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualStyle, 0);
  objc_storeStrong((id *)&self->_animationCoordinator, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_dimmingView, 0);
  objc_storeStrong((id *)&self->_dimmingViewDismissTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_dismissActionViewGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_dismissActionView, 0);
  objc_destroyWeak((id *)&self->_actionSheetDelegate);
}

@end