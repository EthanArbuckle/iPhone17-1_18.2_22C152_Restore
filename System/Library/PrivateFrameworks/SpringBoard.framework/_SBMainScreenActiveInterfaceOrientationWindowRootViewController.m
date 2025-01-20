@interface _SBMainScreenActiveInterfaceOrientationWindowRootViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)shouldAutorotate;
- (UIViewController)contentViewController;
- (unint64_t)supportedInterfaceOrientations;
- (void)setContentViewController:(id)a3;
- (void)setSupportedInterfaceOrientations:(unint64_t)a3;
@end

@implementation _SBMainScreenActiveInterfaceOrientationWindowRootViewController

- (BOOL)shouldAutorotate
{
  return 1;
}

- (void)setSupportedInterfaceOrientations:(unint64_t)a3
{
  if (self->_supportedInterfaceOrientations != a3)
  {
    self->_supportedInterfaceOrientations = a3;
    [(UIViewController *)self setNeedsUpdateOfSupportedInterfaceOrientations];
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  v3 = [(_SBMainScreenActiveInterfaceOrientationWindowRootViewController *)self contentViewController];
  if (!v3) {
    goto LABEL_4;
  }
  v4 = [(_SBMainScreenActiveInterfaceOrientationWindowRootViewController *)self view];
  v5 = [v4 window];
  v6 = [v5 _roleHint];
  int v7 = SBTraitsArbiterOrientationActuationEnabledForRole(v6);

  if (v7) {
    uint64_t supportedInterfaceOrientations = [v3 supportedInterfaceOrientations];
  }
  else {
LABEL_4:
  }
    uint64_t supportedInterfaceOrientations = self->_supportedInterfaceOrientations;

  return supportedInterfaceOrientations;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (UIViewController)contentViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentViewController);
  return (UIViewController *)WeakRetained;
}

- (void)setContentViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end