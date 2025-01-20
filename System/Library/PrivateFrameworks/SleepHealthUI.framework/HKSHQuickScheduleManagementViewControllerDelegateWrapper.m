@interface HKSHQuickScheduleManagementViewControllerDelegateWrapper
- (HKSHQuickScheduleManagementViewController)viewController;
- (HKSHQuickScheduleManagementViewControllerDelegate)wrappedDelegate;
- (void)quickScheduleManagementViewController:(id)a3 didSave:(id)a4;
- (void)quickScheduleManagementViewController:(id)a3 shouldPresent:(id)a4;
- (void)quickScheduleManagementViewControllerDidCancel:(id)a3;
- (void)quickScheduleManagementViewControllerWillSave:(id)a3;
- (void)setViewController:(id)a3;
- (void)setWrappedDelegate:(id)a3;
@end

@implementation HKSHQuickScheduleManagementViewControllerDelegateWrapper

- (void)quickScheduleManagementViewController:(id)a3 didSave:(id)a4
{
  p_wrappedDelegate = &self->_wrappedDelegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_wrappedDelegate);
  id v7 = objc_loadWeakRetained((id *)&self->_viewController);
  [WeakRetained quickScheduleManagementViewController:v7 didSave:v6];
}

- (void)quickScheduleManagementViewControllerDidCancel:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_wrappedDelegate);
  id v4 = objc_loadWeakRetained((id *)&self->_viewController);
  [WeakRetained quickScheduleManagementViewControllerDidCancel:v4];
}

- (void)quickScheduleManagementViewController:(id)a3 shouldPresent:(id)a4
{
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_wrappedDelegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_wrappedDelegate);
    id v8 = objc_loadWeakRetained((id *)&self->_viewController);
    [v7 quickScheduleManagementViewController:v8 shouldPresent:v9];
  }
}

- (void)quickScheduleManagementViewControllerWillSave:(id)a3
{
  p_wrappedDelegate = &self->_wrappedDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_wrappedDelegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v8 = objc_loadWeakRetained((id *)p_wrappedDelegate);
    id v7 = objc_loadWeakRetained((id *)&self->_viewController);
    [v8 quickScheduleManagementViewControllerWillSave:v7];
  }
}

- (HKSHQuickScheduleManagementViewControllerDelegate)wrappedDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_wrappedDelegate);
  return (HKSHQuickScheduleManagementViewControllerDelegate *)WeakRetained;
}

- (void)setWrappedDelegate:(id)a3
{
}

- (HKSHQuickScheduleManagementViewController)viewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  return (HKSHQuickScheduleManagementViewController *)WeakRetained;
}

- (void)setViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_viewController);
  objc_destroyWeak((id *)&self->_wrappedDelegate);
}

@end