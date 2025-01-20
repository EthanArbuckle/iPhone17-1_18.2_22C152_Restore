@interface _PortraitOnlyNavigationController
- (int64_t)preferredInterfaceOrientationForPresentation;
- (unint64_t)supportedInterfaceOrientations;
- (void)dealloc;
- (void)viewWillMoveToWindow:(id)a3;
@end

@implementation _PortraitOnlyNavigationController

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (int64_t)preferredInterfaceOrientationForPresentation
{
  return 1;
}

- (void)viewWillMoveToWindow:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    v6 = [(_PortraitOnlyNavigationController *)self presentedViewController];
    BOOL v5 = v6 != 0;
  }
  [MEMORY[0x1E4FB3C90] enablePortraitLock:v5];
  v7.receiver = self;
  v7.super_class = (Class)_PortraitOnlyNavigationController;
  [(_PortraitOnlyNavigationController *)&v7 viewWillMoveToWindow:v4];
}

- (void)dealloc
{
  [MEMORY[0x1E4FB3C90] enablePortraitLock:0];
  v3.receiver = self;
  v3.super_class = (Class)_PortraitOnlyNavigationController;
  [(_PortraitOnlyNavigationController *)&v3 dealloc];
}

@end