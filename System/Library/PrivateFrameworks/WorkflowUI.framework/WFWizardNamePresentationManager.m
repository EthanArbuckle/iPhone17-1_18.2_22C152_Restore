@interface WFWizardNamePresentationManager
- (BOOL)presentsModally;
- (UINavigationController)navigationController;
- (WFWizardNamePresentationManager)initWithNavigationController:(id)a3 wizardNameViewController:(id)a4;
- (WFWorkflowWizardNameViewController)wizardNameViewController;
- (void)dismiss;
- (void)present;
- (void)presentModal;
@end

@implementation WFWizardNamePresentationManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wizardNameViewController, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
}

- (BOOL)presentsModally
{
  return self->_presentsModally;
}

- (WFWorkflowWizardNameViewController)wizardNameViewController
{
  return self->_wizardNameViewController;
}

- (UINavigationController)navigationController
{
  return self->_navigationController;
}

- (void)dismiss
{
  if ([(WFWizardNamePresentationManager *)self presentsModally])
  {
    id v3 = [(WFWizardNamePresentationManager *)self navigationController];
    [v3 dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)presentModal
{
  id v3 = objc_alloc(MEMORY[0x263F829B8]);
  v4 = [(WFWizardNamePresentationManager *)self wizardNameViewController];
  id v9 = (id)[v3 initWithRootViewController:v4];

  [v9 setModalPresentationStyle:2];
  v5 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:self action:sel_dismiss];
  v6 = [(WFWizardNamePresentationManager *)self wizardNameViewController];
  v7 = [v6 navigationItem];
  [v7 setLeftBarButtonItem:v5];

  v8 = [(WFWizardNamePresentationManager *)self navigationController];
  [v8 presentViewController:v9 animated:1 completion:0];
}

- (void)present
{
  if ([(WFWizardNamePresentationManager *)self presentsModally])
  {
    [(WFWizardNamePresentationManager *)self presentModal];
  }
  else
  {
    id v4 = [(WFWizardNamePresentationManager *)self navigationController];
    id v3 = [(WFWizardNamePresentationManager *)self wizardNameViewController];
    [v4 pushViewController:v3 animated:1];
  }
}

- (WFWizardNamePresentationManager)initWithNavigationController:(id)a3 wizardNameViewController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WFWizardNamePresentationManager;
  id v9 = [(WFWizardNamePresentationManager *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_navigationController, a3);
    objc_storeStrong((id *)&v10->_wizardNameViewController, a4);
    v11 = [MEMORY[0x263F82670] currentDevice];
    if ([v11 userInterfaceIdiom])
    {
      v10->_presentsModally = 1;
    }
    else
    {
      v12 = [MEMORY[0x263F82670] currentDevice];
      v10->_presentsModally = (unint64_t)([v12 orientation] - 3) < 2;
    }
    v13 = v10;
  }

  return v10;
}

@end