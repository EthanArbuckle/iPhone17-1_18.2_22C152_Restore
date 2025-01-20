@interface _UIFormSheetPresentationController
+ (int64_t)_initialMode;
- (BOOL)_presentationPotentiallyUnderlapsStatusBar;
- (BOOL)_shouldHideBottomCorner;
- (BOOL)_shouldPresentedViewControllerControlStatusBarAppearance;
- (BOOL)shouldSubscribeToKeyboardNotifications;
- (CGRect)frameOfPresentedViewInContainerView;
- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4;
- (int64_t)_defaultPresentationStyleForTraitCollection:(id)a3;
- (void)_changeLayoutModeToAvoidKeyboard:(BOOL)a3 withOrigin:(double)a4;
- (void)_keyboardWillHide:(id)a3;
- (void)_keyboardWillShow:(id)a3;
- (void)dismissalTransitionWillBegin;
- (void)presentationTransitionWillBegin;
@end

@implementation _UIFormSheetPresentationController

- (BOOL)_shouldPresentedViewControllerControlStatusBarAppearance
{
  v3 = [(UIPresentationController *)self presentedViewController];
  int v4 = _UISheetPresentationControllerStylesSheetsAsCards(v3);

  if (v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)_UIFormSheetPresentationController;
    return [(UISheetPresentationController *)&v6 _shouldPresentedViewControllerControlStatusBarAppearance];
  }
  else
  {
    return [(UIPresentationController *)self _isAdapted];
  }
}

- (CGRect)frameOfPresentedViewInContainerView
{
  v3 = [(UIPresentationController *)self presentedViewController];
  int v4 = _UISheetPresentationControllerStylesSheetsAsCards(v3);

  if (v4)
  {
    v43.receiver = self;
    v43.super_class = (Class)_UIFormSheetPresentationController;
    [(UISheetPresentationController *)&v43 frameOfPresentedViewInContainerView];
    double v8 = v7;
    double v10 = v9;
  }
  else
  {
    v11 = [(UIPresentationController *)self containerView];
    [v11 bounds];
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;

    v20 = [(UIPresentationController *)self containerView];
    [v20 safeAreaInsets];

    v21 = [(UIPresentationController *)self presentingViewController];
    v22 = [(UIPresentationController *)self presentedViewController];
    double v23 = _UISheetContentContainerSize(v21, v22, v17, v19);
    double v25 = v24;

    v26 = [(UIPresentationController *)self presentedViewController];
    v27 = [(UIPresentationController *)self containerView];
    v28 = [v27 _screen];
    [v28 bounds];
    [v26 _formSheetSizeForWindowWithSize:v23 screenSize:v25];
    double v8 = v29;
    double v10 = v30;

    BOOL v31 = [(_UIFormSheetPresentationController *)self _shouldHideBottomCorner];
    v32 = [(UISheetPresentationController *)self dropShadowView];
    [v32 setMasksTopCornersOnly:v31];

    if ([(_UIFormSheetPresentationController *)self _shouldHideBottomCorner])
    {
      double v10 = v25 + -20.0;
      double v6 = 20.0;
    }
    else if (self->_layoutStateShouldAvoidKeyboard {
           && ([(UIPresentationController *)self presentedViewController],
    }
               v33 = objc_claimAutoreleasedReturnValue(),
               unint64_t v34 = [v33 interfaceOrientation] - 5,
               v33,
               v34 > 0xFFFFFFFFFFFFFFFDLL))
    {
      double v35 = v15 + (self->_keyboardYOrigin - v10) * 0.5;
      v36 = [(UIPresentationController *)self containerView];
      v37 = [v36 window];
      v38 = __UIStatusBarManagerForWindow(v37);
      [v38 defaultStatusBarHeightInOrientation:1];
      double v40 = v39;

      if (v40 >= v35) {
        double v6 = v40;
      }
      else {
        double v6 = v35;
      }
    }
    else
    {
      double v6 = v15 + (v25 - v10) * 0.5;
    }
    double v5 = v13 + (v23 - v8) * 0.5;
  }
  double v41 = v8;
  double v42 = v10;
  result.size.height = v42;
  result.size.width = v41;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (void)presentationTransitionWillBegin
{
  v10.receiver = self;
  v10.super_class = (Class)_UIFormSheetPresentationController;
  [(UISheetPresentationController *)&v10 presentationTransitionWillBegin];
  v3 = [(UIPresentationController *)self presentedViewController];
  char v4 = _UISheetPresentationControllerStylesSheetsAsCards(v3);

  if ((v4 & 1) == 0)
  {
    double v5 = [(UISheetPresentationController *)self dropShadowView];
    [v5 setAutoresizingMask:45];
  }
  double v6 = [(UIPresentationController *)self presentedViewController];
  int v7 = [v6 disablesAutomaticKeyboardDismissal];

  if (v7)
  {
    double v8 = [(UIPresentationController *)self presentedViewController];
    [v8 _beginPinningInputViews];
  }
  if ([(_UIFormSheetPresentationController *)self shouldSubscribeToKeyboardNotifications])
  {
    double v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 addObserver:self selector:sel__keyboardWillShow_ name:@"UIKeyboardPrivateWillShowNotification" object:0];
    [v9 addObserver:self selector:sel__keyboardWillHide_ name:@"UIKeyboardPrivateWillHideNotification" object:0];
  }
}

- (BOOL)shouldSubscribeToKeyboardNotifications
{
  v2 = [(UIPresentationController *)self presentedViewController];
  char v3 = _UISheetPresentationControllerStylesSheetsAsCards(v2) ^ 1;

  return v3;
}

+ (int64_t)_initialMode
{
  return 1;
}

- (int64_t)_defaultPresentationStyleForTraitCollection:(id)a3
{
  id v4 = a3;
  double v5 = [(UIPresentationController *)self presentedViewController];
  if (_UISheetPresentationControllerStylesSheetsAsCards(v5))
  {

LABEL_5:
    v9.receiver = self;
    v9.super_class = (Class)_UIFormSheetPresentationController;
    id v7 = [(UIPresentationController *)&v9 _defaultPresentationStyleForTraitCollection:v4];
    goto LABEL_6;
  }
  uint64_t v6 = [v4 horizontalSizeClass];

  if (v6 != 1) {
    goto LABEL_5;
  }
  id v7 = 0;
LABEL_6:

  return (int64_t)v7;
}

- (void)dismissalTransitionWillBegin
{
  v7.receiver = self;
  v7.super_class = (Class)_UIFormSheetPresentationController;
  [(UISheetPresentationController *)&v7 dismissalTransitionWillBegin];
  if ([(_UIFormSheetPresentationController *)self shouldSubscribeToKeyboardNotifications])
  {
    char v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 removeObserver:self name:@"UIKeyboardPrivateWillShowNotification" object:0];
    [v3 removeObserver:self name:@"UIKeyboardPrivateWillHideNotification" object:0];
  }
  id v4 = [(UIPresentationController *)self presentedViewController];
  int v5 = [v4 disablesAutomaticKeyboardDismissal];

  if (v5)
  {
    uint64_t v6 = [(UIPresentationController *)self presentedViewController];
    [v6 _endPinningInputViews];
  }
}

- (void)_keyboardWillShow:(id)a3
{
  id v4 = [a3 userInfo];
  int v5 = [v4 valueForKey:@"UIKeyboardFrameEndUserInfoKey"];
  [v5 CGRectValue];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;

  v16.origin.x = v7;
  v16.origin.y = v9;
  v16.size.width = v11;
  v16.size.height = v13;
  double MinY = CGRectGetMinY(v16);
  [(_UIFormSheetPresentationController *)self _changeLayoutModeToAvoidKeyboard:1 withOrigin:MinY];
}

- (void)_keyboardWillHide:(id)a3
{
}

- (void)_changeLayoutModeToAvoidKeyboard:(BOOL)a3 withOrigin:(double)a4
{
  if (self->_layoutStateShouldAvoidKeyboard != a3 || self->_keyboardYOrigin != a4)
  {
    self->_layoutStateShouldAvoidKeyboard = a3;
    self->_keyboardYOrigin = a4;
    int v5 = [(UIPresentationController *)self containerView];
    [v5 setNeedsLayout];

    if ([(UIPresentationController *)self presented])
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __82___UIFormSheetPresentationController__changeLayoutModeToAvoidKeyboard_withOrigin___block_invoke;
      v6[3] = &unk_1E52D9F70;
      v6[4] = self;
      +[UIView animateWithDuration:v6 animations:0.25];
    }
  }
}

- (BOOL)_shouldHideBottomCorner
{
  v2 = [(UIPresentationController *)self traitCollection];
  BOOL v3 = [v2 userInterfaceIdiom] == 0;

  return v3;
}

- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  id v8 = [(UIPresentationController *)self presentedViewController];

  if (v8 == v7)
  {
    CGFloat v13 = [(UIPresentationController *)self presentedViewController];
    double v14 = [(UIPresentationController *)self containerView];
    double v15 = [v14 _screen];
    [v15 bounds];
    [v13 _formSheetSizeForWindowWithSize:width screenSize:height];
    double v10 = v16;
    double v12 = v17;
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)_UIFormSheetPresentationController;
    -[UIPresentationController sizeForChildContentContainer:withParentContainerSize:](&v20, sel_sizeForChildContentContainer_withParentContainerSize_, v7, width, height);
    double v10 = v9;
    double v12 = v11;
  }

  double v18 = v10;
  double v19 = v12;
  result.double height = v19;
  result.double width = v18;
  return result;
}

- (BOOL)_presentationPotentiallyUnderlapsStatusBar
{
  v2 = [(UIPresentationController *)self presentedViewController];
  char v3 = _UISheetPresentationControllerStylesSheetsAsCards(v2);

  return v3;
}

@end