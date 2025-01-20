@interface NavigationDebugSplitViewController
- (BOOL)prefersStatusBarHidden;
- (id)shouldHideStatusBar;
- (void)setShouldHideStatusBar:(id)a3;
@end

@implementation NavigationDebugSplitViewController

- (BOOL)prefersStatusBarHidden
{
  v3 = [(NavigationDebugSplitViewController *)self shouldHideStatusBar];

  if (v3)
  {
    v4 = [(NavigationDebugSplitViewController *)self shouldHideStatusBar];
    char v5 = v4[2]();

    return v5;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)NavigationDebugSplitViewController;
    return [(NavigationDebugSplitViewController *)&v7 prefersStatusBarHidden];
  }
}

- (id)shouldHideStatusBar
{
  return self->_shouldHideStatusBar;
}

- (void)setShouldHideStatusBar:(id)a3
{
}

- (void).cxx_destruct
{
}

@end