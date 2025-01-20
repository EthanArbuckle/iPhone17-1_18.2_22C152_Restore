@interface PasscodeChangeNavigationController
- (PasscodeChangeNavigationControllerDelegate)customDelegate;
- (void)pushViewController:(id)a3 animated:(BOOL)a4;
- (void)setCustomDelegate:(id)a3;
@end

@implementation PasscodeChangeNavigationController

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  v6.receiver = self;
  v6.super_class = (Class)PasscodeChangeNavigationController;
  [(PasscodeChangeNavigationController *)&v6 pushViewController:a3 animated:a4];
  if (!self->_hasReportedFirstPush)
  {
    self->_hasReportedFirstPush = 1;
    v5 = [(PasscodeChangeNavigationController *)self customDelegate];
    [v5 navigationControllerDidPushFirstController:self];
  }
}

- (PasscodeChangeNavigationControllerDelegate)customDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_customDelegate);
  return (PasscodeChangeNavigationControllerDelegate *)WeakRetained;
}

- (void)setCustomDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end