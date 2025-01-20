@interface MailDetailNavigationController
- (BOOL)_shouldHideBarsInCurrentLayout;
- (BOOL)containsTransferStackViewController;
- (MailDetailNavigationController)init;
- (MailDetailNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (MailDetailNavigationController)initWithRootViewController:(id)a3;
- (id)conversationViewController;
- (int64_t)ancestorSplitViewControllerDisplayMode;
- (void)_commonInit;
- (void)_updateBarHidingEnabled;
- (void)didMoveToParentViewController:(id)a3;
- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation MailDetailNavigationController

- (MailDetailNavigationController)initWithRootViewController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MailDetailNavigationController;
  v5 = [(MailDetailNavigationController *)&v8 initWithRootViewController:v4];
  v6 = v5;
  if (v5) {
    [(MailDetailNavigationController *)v5 _commonInit];
  }

  return v6;
}

- (void)_commonInit
{
  [(MailDetailNavigationController *)self setDelegate:self];
  v3 = +[UIColor clearColor];
  id v4 = [(MailDetailNavigationController *)self view];
  [v4 setBackgroundColor:v3];

  v5 = [(MailDetailNavigationController *)self view];
  [v5 setOpaque:0];

  [(MailDetailNavigationController *)self _setClipUnderlapWhileTransitioning:1];
  self->_ancestorSplitViewControllerDisplayMode = 0;
}

- (void)didMoveToParentViewController:(id)a3
{
  if (!a3) {
    self->_ancestorSplitViewControllerDisplayMode = 0;
  }
}

- (id)conversationViewController
{
  uint64_t v3 = objc_opt_class();

  return [(MailDetailNavigationController *)self mf_viewControllerOfClass:v3 startFromTopOfStack:0];
}

- (MailDetailNavigationController)init
{
  v5.receiver = self;
  v5.super_class = (Class)MailDetailNavigationController;
  v2 = [(MailDetailNavigationController *)&v5 init];
  uint64_t v3 = v2;
  if (v2) {
    [(MailDetailNavigationController *)v2 _commonInit];
  }
  return v3;
}

- (MailDetailNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  v7.receiver = self;
  v7.super_class = (Class)MailDetailNavigationController;
  id v4 = [(MailDetailNavigationController *)&v7 initWithNavigationBarClass:a3 toolbarClass:a4];
  objc_super v5 = v4;
  if (v4) {
    [(MailDetailNavigationController *)v4 _commonInit];
  }
  return v5;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MailDetailNavigationController;
  [(MailDetailNavigationController *)&v5 traitCollectionDidChange:v4];
  [(MailDetailNavigationController *)self _updateBarHidingEnabled];
}

- (void)_updateBarHidingEnabled
{
  id v3 = [(MailDetailNavigationController *)self topViewController];
  -[MailDetailNavigationController setHidesBarsOnSwipe:](self, "setHidesBarsOnSwipe:", [v3 wantsBarHidingWhenVerticallyCompact] & -[MailDetailNavigationController _shouldHideBarsInCurrentLayout](self, "_shouldHideBarsInCurrentLayout"));
}

- (BOOL)_shouldHideBarsInCurrentLayout
{
  v2 = [(MailDetailNavigationController *)self traitCollection];
  BOOL v3 = [v2 verticalSizeClass] == (id)1;

  return v3;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v9.receiver = self;
  v9.super_class = (Class)MailDetailNavigationController;
  -[MailDetailNavigationController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  objc_super v8 = [(MailDetailNavigationController *)self splitViewController];
  self->_ancestorSplitViewControllerDisplayMode = (int64_t)[v8 displayMode];
}

- (int64_t)ancestorSplitViewControllerDisplayMode
{
  id ancestorSplitViewControllerDisplayMode = self->_ancestorSplitViewControllerDisplayMode;
  if (!ancestorSplitViewControllerDisplayMode)
  {
    BOOL v3 = [(MailDetailNavigationController *)self splitViewController];
    id ancestorSplitViewControllerDisplayMode = [v3 displayMode];
  }
  return (int64_t)ancestorSplitViewControllerDisplayMode;
}

- (BOOL)containsTransferStackViewController
{
  v2 = [(MailDetailNavigationController *)self mf_viewControllerOfClass:objc_opt_class() startFromTopOfStack:1];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v6 = a3;
  if ([v6 isNavigationBarHidden]) {
    [v6 setNavigationBarHidden:0 animated:v5];
  }
}

@end