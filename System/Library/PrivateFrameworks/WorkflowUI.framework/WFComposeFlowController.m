@interface WFComposeFlowController
- (BOOL)workflowHasContent;
- (UINavigationController)navigationController;
- (UIViewController)presenter;
- (WFComposeFlowController)initWithPresenter:(id)a3 navigationController:(id)a4 database:(id)a5 workflow:(id)a6;
- (WFComposeFlowControllerDelegate)delegate;
- (WFDatabase)database;
- (WFWizardNamePresentationManager)presentationManager;
- (WFWorkflow)workflow;
- (void)finishEditing:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setPresentationManager:(id)a3;
- (void)startCancelFlowWithButton:(id)a3;
- (void)startSaveFlow;
- (void)workflowWizardNameViewController:(id)a3 didFinishWithName:(id)a4;
@end

@implementation WFComposeFlowController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentationManager, 0);
  objc_destroyWeak((id *)&self->_workflow);
  objc_storeStrong((id *)&self->_database, 0);
  objc_destroyWeak((id *)&self->_navigationController);
  objc_destroyWeak((id *)&self->_presenter);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setPresentationManager:(id)a3
{
}

- (WFWizardNamePresentationManager)presentationManager
{
  return self->_presentationManager;
}

- (WFWorkflow)workflow
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_workflow);
  return (WFWorkflow *)WeakRetained;
}

- (WFDatabase)database
{
  return self->_database;
}

- (UINavigationController)navigationController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationController);
  return (UINavigationController *)WeakRetained;
}

- (UIViewController)presenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
  return (UIViewController *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (WFComposeFlowControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFComposeFlowControllerDelegate *)WeakRetained;
}

- (void)workflowWizardNameViewController:(id)a3 didFinishWithName:(id)a4
{
  id v5 = a4;
  v6 = [(WFComposeFlowController *)self database];
  v7 = [(WFComposeFlowController *)self workflow];
  v8 = [v7 reference];
  id v23 = 0;
  id v9 = (id)[v6 renameReference:v8 to:v5 error:&v23];
  id v10 = v23;

  if (v10)
  {
    v11 = [MEMORY[0x263F336E8] alertWithError:v10];
    v12 = [(WFComposeFlowController *)self presentationManager];
    v13 = [v12 wizardNameViewController];
    v14 = WFUserInterfaceFromViewController();
    [v14 presentAlert:v11];
  }
  else
  {
    v15 = [(WFComposeFlowController *)self workflow];
    v16 = [v15 record];
    [v16 addWatchWorkflowTypeIfEligible];

    v17 = [(WFComposeFlowController *)self database];
    v18 = [(WFComposeFlowController *)self workflow];
    v19 = [v18 record];
    v20 = [(WFComposeFlowController *)self workflow];
    v21 = [v20 reference];
    [v17 saveRecord:v19 withDescriptor:v21 error:0];

    v22 = [(WFComposeFlowController *)self presentationManager];
    [v22 dismiss];

    [(WFComposeFlowController *)self finishEditing:0];
  }
}

- (void)finishEditing:(BOOL)a3
{
  if (!a3)
  {
    id v18 = objc_alloc_init(MEMORY[0x263F868B8]);
    v19 = [(WFComposeFlowController *)self workflow];
    v20 = [v19 actions];
    objc_msgSend(v18, "setActionCount:", objc_msgSend(v20, "count"));

    [v18 setShortcutSource:@"ShortcutSourceOnDevice"];
    [v18 track];

LABEL_6:
    id v7 = [(WFComposeFlowController *)self delegate];
    [v7 composeFlowControllerDidFinishEditing:self];
    goto LABEL_7;
  }
  v4 = [(WFComposeFlowController *)self database];
  id v5 = [(WFComposeFlowController *)self workflow];
  v6 = [v5 reference];
  id v22 = 0;
  [v4 deleteReference:v6 error:&v22];
  id v7 = v22;

  id v8 = objc_alloc_init(MEMORY[0x263F86A90]);
  id v9 = [(WFComposeFlowController *)self workflow];
  id v10 = [v9 associatedAppBundleIdentifier];
  [v8 setAddToSiriBundleIdentifier:v10];

  v11 = [(WFComposeFlowController *)self workflow];
  v12 = [v11 galleryIdentifier];
  [v8 setGalleryIdentifier:v12];

  v13 = [(WFComposeFlowController *)self workflow];
  v14 = [v13 source];
  [v8 setShortcutSource:v14];

  [v8 track];
  if (!v7)
  {

    goto LABEL_6;
  }
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __41__WFComposeFlowController_finishEditing___block_invoke;
  v21[3] = &unk_2649CBF20;
  v21[4] = self;
  v15 = [MEMORY[0x263F336E8] alertWithError:v7 confirmationHandler:v21];
  v16 = [(WFComposeFlowController *)self presenter];
  v17 = WFUserInterfaceFromViewController();
  [v17 presentAlert:v15];

LABEL_7:
}

void __41__WFComposeFlowController_finishEditing___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 composeFlowControllerDidFinishEditing:*(void *)(a1 + 32)];
}

- (void)startSaveFlow
{
  v3 = [WFWorkflowWizardNameViewController alloc];
  v4 = [(WFComposeFlowController *)self workflow];
  id v5 = +[WFWorkflowWizardNameConfiguration newWorkflowConfiguration];
  v12 = [(WFWorkflowWizardNameViewController *)v3 initWithWorkflow:v4 configuration:v5];

  [(WFWorkflowWizardNameViewController *)v12 setDelegate:self];
  v6 = [(WFComposeFlowController *)self workflow];
  id v7 = [v6 record];
  [v7 setSource:@"ShortcutSourceOnDevice"];

  id v8 = [WFWizardNamePresentationManager alloc];
  id v9 = [(WFComposeFlowController *)self navigationController];
  id v10 = [(WFWizardNamePresentationManager *)v8 initWithNavigationController:v9 wizardNameViewController:v12];
  [(WFComposeFlowController *)self setPresentationManager:v10];

  v11 = [(WFComposeFlowController *)self presentationManager];
  [v11 present];
}

- (void)startCancelFlowWithButton:(id)a3
{
  id v4 = a3;
  if ([(WFComposeFlowController *)self workflowHasContent])
  {
    id v5 = [MEMORY[0x263F82418] alertControllerWithTitle:0 message:0 preferredStyle:0];
    v6 = [v5 popoverPresentationController];
    [v6 setBarButtonItem:v4];

    id v7 = (void *)MEMORY[0x263F82400];
    id v8 = WFLocalizedString(@"Delete Shortcut");
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __53__WFComposeFlowController_startCancelFlowWithButton___block_invoke;
    v18[3] = &unk_2649CB860;
    v18[4] = self;
    id v9 = [v7 actionWithTitle:v8 style:2 handler:v18];
    [v5 addAction:v9];

    id v10 = (void *)MEMORY[0x263F82400];
    v11 = WFLocalizedString(@"Save Shortcut");
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __53__WFComposeFlowController_startCancelFlowWithButton___block_invoke_2;
    v17[3] = &unk_2649CB860;
    v17[4] = self;
    v12 = [v10 actionWithTitle:v11 style:0 handler:v17];
    [v5 addAction:v12];

    v13 = (void *)MEMORY[0x263F82400];
    v14 = WFLocalizedString(@"Cancel");
    v15 = [v13 actionWithTitle:v14 style:1 handler:0];
    [v5 addAction:v15];

    v16 = [(WFComposeFlowController *)self presenter];
    [v16 presentViewController:v5 animated:1 completion:0];
  }
  else
  {
    [(WFComposeFlowController *)self finishEditing:1];
  }
}

uint64_t __53__WFComposeFlowController_startCancelFlowWithButton___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishEditing:1];
}

uint64_t __53__WFComposeFlowController_startCancelFlowWithButton___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) startSaveFlow];
}

- (BOOL)workflowHasContent
{
  v3 = [(WFComposeFlowController *)self workflow];
  id v4 = [v3 actions];
  if ([v4 count])
  {
    char v5 = 1;
  }
  else
  {
    v6 = [(WFComposeFlowController *)self workflow];
    id v7 = [v6 workflowTypes];
    char v5 = [v7 containsObject:*MEMORY[0x263F85AD0]];
  }
  return v5;
}

- (WFComposeFlowController)initWithPresenter:(id)a3 navigationController:(id)a4 database:(id)a5 workflow:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)WFComposeFlowController;
  v14 = [(WFComposeFlowController *)&v18 init];
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_presenter, v10);
    objc_storeWeak((id *)&v15->_navigationController, v11);
    objc_storeStrong((id *)&v15->_database, a5);
    objc_storeWeak((id *)&v15->_workflow, v13);
    v16 = v15;
  }

  return v15;
}

@end