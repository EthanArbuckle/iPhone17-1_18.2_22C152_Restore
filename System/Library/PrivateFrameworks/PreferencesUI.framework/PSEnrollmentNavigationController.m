@interface PSEnrollmentNavigationController
- (BOOL)canBeShownFromSuspendedState;
- (CGSize)preferredContentSize;
- (PSEnrollmentNavigationController)initWithNibName:(id)a3 bundle:(id)a4;
- (PSEnrollmentNavigationControllerDismissalDelegate)dismissalDelegate;
- (id)_backgroundColorForModalFormSheet;
- (int64_t)preferredStatusBarStyle;
- (unint64_t)supportedInterfaceOrientations;
- (void)setDismissalDelegate:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PSEnrollmentNavigationController

- (PSEnrollmentNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PSEnrollmentNavigationController;
  v8 = [(PSEnrollmentNavigationController *)&v13 initWithNibName:v6 bundle:v7];
  if (v8)
  {
    uint64_t v15 = 0;
    v16 = &v15;
    uint64_t v17 = 0x2050000000;
    v9 = (void *)getBFFStyleClass_softClass;
    uint64_t v18 = getBFFStyleClass_softClass;
    if (!getBFFStyleClass_softClass)
    {
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __getBFFStyleClass_block_invoke;
      v14[3] = &unk_264E95420;
      v14[4] = &v15;
      __getBFFStyleClass_block_invoke((uint64_t)v14);
      v9 = (void *)v16[3];
    }
    id v10 = v9;
    _Block_object_dispose(&v15, 8);
    v11 = [v10 sharedStyle];
    [v11 applyThemeToNavigationController:v8];
  }
  return v8;
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = [MEMORY[0x263F82670] currentDevice];
  if (objc_msgSend(v2, "sf_isiPad")) {
    unint64_t v3 = 30;
  }
  else {
    unint64_t v3 = 2;
  }

  return v3;
}

- (BOOL)canBeShownFromSuspendedState
{
  return 0;
}

- (int64_t)preferredStatusBarStyle
{
  v2 = [(PSEnrollmentNavigationController *)self topViewController];
  int64_t v3 = [v2 preferredStatusBarStyle];

  return v3;
}

- (CGSize)preferredContentSize
{
  v2 = [(PSEnrollmentNavigationController *)self topViewController];
  [v2 preferredContentSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (id)_backgroundColorForModalFormSheet
{
  return (id)[MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.75];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PSEnrollmentNavigationController;
  [(PSEnrollmentNavigationController *)&v5 viewWillDisappear:a3];
  double v4 = [(PSEnrollmentNavigationController *)self dismissalDelegate];
  [v4 enrollmentNavigationControllerWillDismiss:self];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PSEnrollmentNavigationController;
  [(PSEnrollmentNavigationController *)&v5 viewDidDisappear:a3];
  double v4 = [(PSEnrollmentNavigationController *)self dismissalDelegate];
  [v4 enrollmentNavigationControllerDidDismiss:self];
}

- (PSEnrollmentNavigationControllerDismissalDelegate)dismissalDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dismissalDelegate);
  return (PSEnrollmentNavigationControllerDismissalDelegate *)WeakRetained;
}

- (void)setDismissalDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end