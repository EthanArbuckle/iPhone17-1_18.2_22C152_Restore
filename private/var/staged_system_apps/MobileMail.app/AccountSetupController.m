@interface AccountSetupController
- (AccountSetupController)initWithNibName:(id)a3 bundle:(id)a4;
- (AccountSetupControllerDelegate)accountSetupDelegate;
- (BOOL)accountSetupInProgress;
- (BOOL)shouldSnapshot;
- (MailMainScene)scene;
- (id)customDefaultPNGName;
- (void)_accountSetupDidChange:(BOOL)a3;
- (void)_accountSetupDidFinish:(id)a3;
- (void)dealloc;
- (void)didDismissFormSheetView;
- (void)loadView;
- (void)setAccountSetupDelegate:(id)a3;
- (void)setScene:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AccountSetupController

- (AccountSetupController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AccountSetupController;
  v8 = [(AccountSetupController *)&v11 initWithNibName:v6 bundle:v7];
  if (v8)
  {
    v9 = +[NSNotificationCenter defaultCenter];
    [v9 addObserver:v8 selector:"_accountSetupDidFinish:" name:ACUIAccountSetupDidFinish object:0];
  }
  return v8;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:ACUIAccountSetupDidFinish object:0];

  v4.receiver = self;
  v4.super_class = (Class)AccountSetupController;
  [(AccountSetupController *)&v4 dealloc];
}

- (void)loadView
{
  v5.receiver = self;
  v5.super_class = (Class)AccountSetupController;
  [(AccountSetupController *)&v5 loadView];
  v3 = (ACUIAddAccountViewController *)objc_alloc_init((Class)ACUIAddMailAccountViewController);
  addTypeController = self->_addTypeController;
  self->_addTypeController = v3;

  [(AccountSetupController *)self showController:self->_addTypeController];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AccountSetupController;
  [(AccountSetupController *)&v6 viewWillAppear:a3];
  objc_super v4 = [(AccountSetupController *)self scene];
  objc_super v5 = [v4 extendedLaunchTracker];
  [v5 observeViewController:self scene:v4];

  self->_setupWasInProgress = [(AccountSetupController *)self accountSetupInProgress];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AccountSetupController;
  [(AccountSetupController *)&v6 viewDidAppear:a3];
  if (self->_setupWasInProgress)
  {
    self->_setupWasInProgress = 0;
    [(AccountSetupController *)self _accountSetupDidChange:0];
  }
  objc_super v4 = [(AccountSetupController *)self scene];
  objc_super v5 = [v4 extendedLaunchTracker];
  [v5 didFinishLoadViewController:self scene:v4];
}

- (void)didDismissFormSheetView
{
  v3.receiver = self;
  v3.super_class = (Class)AccountSetupController;
  [(AccountSetupController *)&v3 didDismissFormSheetView];
  [(AccountSetupController *)self _accountSetupDidChange:0];
}

- (BOOL)shouldSnapshot
{
  v2 = self;
  objc_super v3 = [(AccountSetupController *)self visibleViewController];
  LOBYTE(v2) = v3 == v2->_addTypeController;

  return (char)v2;
}

- (id)customDefaultPNGName
{
  if ((+[UIDevice mf_isPad] & 1) != 0
    || ![(AccountSetupController *)self shouldSnapshot])
  {
    objc_super v3 = @"Default-AccountSetup";
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)AccountSetupController;
    objc_super v3 = [(AccountSetupController *)&v5 customDefaultPNGName];
  }

  return v3;
}

- (void)_accountSetupDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(AccountSetupController *)self accountSetupDelegate];
  if (objc_opt_respondsToSelector()) {
    [v5 accountSetupControllerDidChange:self finished:v3];
  }
}

- (void)_accountSetupDidFinish:(id)a3
{
}

- (BOOL)accountSetupInProgress
{
  v2 = self;
  BOOL v3 = [(AccountSetupController *)self visibleViewController];
  LOBYTE(v2) = v3 != v2->_addTypeController;

  return (char)v2;
}

- (AccountSetupControllerDelegate)accountSetupDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accountSetupDelegate);

  return (AccountSetupControllerDelegate *)WeakRetained;
}

- (void)setAccountSetupDelegate:(id)a3
{
}

- (MailMainScene)scene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);

  return (MailMainScene *)WeakRetained;
}

- (void)setScene:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scene);
  objc_destroyWeak((id *)&self->_accountSetupDelegate);

  objc_storeStrong((id *)&self->_addTypeController, 0);
}

@end