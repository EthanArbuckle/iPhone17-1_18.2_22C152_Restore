@interface CRLNavigationController
- (BOOL)allowTextInputWhilePresenting;
- (BOOL)crl_optsIntoDoneButtonManagement;
- (BOOL)crl_preserveEditorSelection;
- (BOOL)hasPreferredPartialScreenPresentationStatusBarStyle;
- (BOOL)wantsAppearanceUpdateAfterNextMoveToParentVC;
- (CGSize)preferredContentSize;
- (CRLNavigationController)initWithRootViewController:(id)a3;
- (NSNumber)preferredPartialScreenPresentationStatusBarStyleNumber;
- (UIResponder)nextResponderOverride;
- (double)preferredContentHeightOverride;
- (id)childViewControllerForStatusBarHidden;
- (id)nextResponder;
- (id)popViewControllerAnimated:(BOOL)a3;
- (int64_t)preferredPartialScreenPresentationStatusBarStyle;
- (int64_t)preferredStatusBarStyle;
- (void)didMoveToParentViewController:(id)a3;
- (void)setAllowTextInputWhilePresenting:(BOOL)a3;
- (void)setNextResponderOverride:(id)a3;
- (void)setPreferredContentHeightOverride:(double)a3;
- (void)setPreferredPartialScreenPresentationStatusBarStyle:(int64_t)a3;
- (void)setPreferredPartialScreenPresentationStatusBarStyleNumber:(id)a3;
- (void)setWantsAppearanceUpdateAfterNextMoveToParentVC:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation CRLNavigationController

- (CRLNavigationController)initWithRootViewController:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CRLNavigationController;
  v11 = [(CRLNavigationController *)&v15 initWithRootViewController:v4];
  if (v11)
  {
    v12 = sub_100246AC8(v4, 1, v5, v6, v7, v8, v9, v10, (uint64_t)&OBJC_PROTOCOL___CRLNextResponderOverrider);
    v13 = v12;
    if (v12) {
      [v12 setNextResponderOverride:0];
    }
  }
  return v11;
}

- (id)nextResponder
{
  v3 = [(CRLNavigationController *)self nextResponderOverride];

  if (v3)
  {
    id v4 = [(CRLNavigationController *)self nextResponderOverride];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)CRLNavigationController;
    id v4 = [(CRLNavigationController *)&v6 nextResponder];
  }

  return v4;
}

- (id)popViewControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(CRLNavigationController *)self topViewController];
  v12 = sub_100246AC8(v5, 1, v6, v7, v8, v9, v10, v11, (uint64_t)&OBJC_PROTOCOL___CRLFirstResponderResigning);
  [v12 resignFirstResponderForAnyDescendent];
  v15.receiver = self;
  v15.super_class = (Class)CRLNavigationController;
  v13 = [(CRLNavigationController *)&v15 popViewControllerAnimated:v3];

  return v13;
}

- (void)didMoveToParentViewController:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CRLNavigationController;
  [(CRLNavigationController *)&v7 didMoveToParentViewController:a3];
  if (self->_wantsAppearanceUpdateAfterNextMoveToParentVC)
  {
    id v4 = [(CRLNavigationController *)self navigationBar];
    [v4 setTranslucent:0];

    [(CRLNavigationController *)self setExtendedLayoutIncludesOpaqueBars:1];
    uint64_t v5 = +[UIColor systemBackgroundColor];
    uint64_t v6 = [(CRLNavigationController *)self view];
    [v6 setBackgroundColor:v5];

    self->_wantsAppearanceUpdateAfterNextMoveToParentVC = 0;
  }
}

- (BOOL)crl_optsIntoDoneButtonManagement
{
  return 1;
}

- (BOOL)crl_preserveEditorSelection
{
  v2 = [(CRLNavigationController *)self topViewController];
  unsigned __int8 v3 = [v2 crl_preserveEditorSelection];

  return v3;
}

- (int64_t)preferredStatusBarStyle
{
  if ([(CRLNavigationController *)self hasPreferredPartialScreenPresentationStatusBarStyle])
  {
    return [(CRLNavigationController *)self preferredPartialScreenPresentationStatusBarStyle];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)CRLNavigationController;
    return [(CRLNavigationController *)&v4 preferredStatusBarStyle];
  }
}

- (id)childViewControllerForStatusBarHidden
{
  v2 = [(CRLNavigationController *)self viewControllers];
  unsigned __int8 v3 = [v2 firstObject];

  return v3;
}

- (CGSize)preferredContentSize
{
  v11.receiver = self;
  v11.super_class = (Class)CRLNavigationController;
  [(CRLNavigationController *)&v11 preferredContentSize];
  double v4 = v3;
  double v6 = v5;
  [(CRLNavigationController *)self preferredContentHeightOverride];
  if (v7 != 0.0)
  {
    [(CRLNavigationController *)self preferredContentHeightOverride];
    double v6 = v8;
  }
  double v9 = v4;
  double v10 = v6;
  result.height = v10;
  result.width = v9;
  return result;
}

- (int64_t)preferredPartialScreenPresentationStatusBarStyle
{
  v2 = [(CRLNavigationController *)self preferredPartialScreenPresentationStatusBarStyleNumber];
  double v3 = v2;
  if (v2) {
    id v4 = [v2 integerValue];
  }
  else {
    id v4 = 0;
  }

  return (int64_t)v4;
}

- (void)setPreferredPartialScreenPresentationStatusBarStyle:(int64_t)a3
{
  id v4 = +[NSNumber numberWithInteger:a3];
  [(CRLNavigationController *)self setPreferredPartialScreenPresentationStatusBarStyleNumber:v4];
}

- (BOOL)hasPreferredPartialScreenPresentationStatusBarStyle
{
  v2 = [(CRLNavigationController *)self preferredPartialScreenPresentationStatusBarStyleNumber];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(CRLNavigationController *)self viewControllers];
  double v6 = [v5 firstObject];

  if ([v6 conformsToProtocol:&OBJC_PROTOCOL___CRLDismissBlockPopover])
  {
    id v7 = v6;
    double v8 = [v7 onDismiss];

    if (v8)
    {
      double v9 = [v7 onDismiss];
      v9[2]();

      [v7 setOnDismiss:0];
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)CRLNavigationController;
  [(CRLNavigationController *)&v10 viewDidDisappear:v3];
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)CRLNavigationController;
  id v6 = a4;
  [(CRLNavigationController *)&v8 willTransitionToTraitCollection:a3 withTransitionCoordinator:v6];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1003858A0;
  v7[3] = &unk_1014D98D0;
  v7[4] = self;
  [v6 animateAlongsideTransition:v7 completion:0];
}

- (UIResponder)nextResponderOverride
{
  return self->_nextResponderOverride;
}

- (void)setNextResponderOverride:(id)a3
{
}

- (BOOL)allowTextInputWhilePresenting
{
  return self->_allowTextInputWhilePresenting;
}

- (void)setAllowTextInputWhilePresenting:(BOOL)a3
{
  self->_allowTextInputWhilePresenting = a3;
}

- (BOOL)wantsAppearanceUpdateAfterNextMoveToParentVC
{
  return self->_wantsAppearanceUpdateAfterNextMoveToParentVC;
}

- (void)setWantsAppearanceUpdateAfterNextMoveToParentVC:(BOOL)a3
{
  self->_wantsAppearanceUpdateAfterNextMoveToParentVC = a3;
}

- (double)preferredContentHeightOverride
{
  return self->_preferredContentHeightOverride;
}

- (void)setPreferredContentHeightOverride:(double)a3
{
  self->_preferredContentHeightOverride = a3;
}

- (NSNumber)preferredPartialScreenPresentationStatusBarStyleNumber
{
  return self->_preferredPartialScreenPresentationStatusBarStyleNumber;
}

- (void)setPreferredPartialScreenPresentationStatusBarStyleNumber:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredPartialScreenPresentationStatusBarStyleNumber, 0);

  objc_storeStrong((id *)&self->_nextResponderOverride, 0);
}

@end