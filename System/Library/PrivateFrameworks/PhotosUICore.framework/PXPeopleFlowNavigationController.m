@interface PXPeopleFlowNavigationController
- (CGSize)preferredContentSize;
- (PXPeopleFlowController)flowController;
- (PXPeopleFlowNavigationController)initWithFlowController:(id)a3;
- (PXPeopleFlowViewController)currentViewController;
- (UIBarButtonItem)backButton;
- (UIBarButtonItem)cancelButton;
- (UIBarButtonItem)doneButton;
- (UIBarButtonItem)nextButton;
- (void)_updateActions;
- (void)back:(id)a3;
- (void)cancel:(id)a3;
- (void)done:(id)a3;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
- (void)next:(id)a3;
- (void)requestAdvanceToNextInFlow;
- (void)requestCancel;
- (void)requestDone;
- (void)setAdvanceButtonEnabled:(BOOL)a3;
- (void)setBackButton:(id)a3;
- (void)setCancelButton:(id)a3;
- (void)setCurrentViewController:(id)a3;
- (void)setDoneButton:(id)a3;
- (void)setFlowController:(id)a3;
- (void)setNextButton:(id)a3;
- (void)viewDidLoad;
@end

@implementation PXPeopleFlowNavigationController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentViewController, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_nextButton, 0);
  objc_storeStrong((id *)&self->_backButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_flowController, 0);
}

- (void)setCurrentViewController:(id)a3
{
}

- (PXPeopleFlowViewController)currentViewController
{
  return self->_currentViewController;
}

- (void)setDoneButton:(id)a3
{
}

- (UIBarButtonItem)doneButton
{
  return self->_doneButton;
}

- (void)setNextButton:(id)a3
{
}

- (UIBarButtonItem)nextButton
{
  return self->_nextButton;
}

- (void)setBackButton:(id)a3
{
}

- (UIBarButtonItem)backButton
{
  return self->_backButton;
}

- (void)setCancelButton:(id)a3
{
}

- (UIBarButtonItem)cancelButton
{
  return self->_cancelButton;
}

- (void)setFlowController:(id)a3
{
}

- (PXPeopleFlowController)flowController
{
  return self->_flowController;
}

- (void)requestDone
{
}

- (void)requestCancel
{
}

- (void)requestAdvanceToNextInFlow
{
}

- (void)setAdvanceButtonEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(PXPeopleFlowNavigationController *)self nextButton];
  [v5 setEnabled:v3];

  id v6 = [(PXPeopleFlowNavigationController *)self doneButton];
  [v6 setEnabled:v3];
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  id v9 = a4;
  int v6 = [v9 conformsToProtocol:&unk_1F03357C0];
  v7 = v9;
  if (v6)
  {
    id v8 = v9;
    [(PXPeopleFlowNavigationController *)self setCurrentViewController:v8];
    if (objc_opt_respondsToSelector()) {
      [v8 setActionDelegate:self];
    }
    [(PXPeopleFlowNavigationController *)self _updateActions];

    v7 = v9;
  }
}

- (void)_updateActions
{
  id v7 = [(PXPeopleFlowNavigationController *)self flowController];
  if ([v7 hasPreviousViewController]) {
    [(PXPeopleFlowNavigationController *)self backButton];
  }
  else {
  BOOL v3 = [(PXPeopleFlowNavigationController *)self cancelButton];
  }
  if ([v7 hasNextViewController]) {
    [(PXPeopleFlowNavigationController *)self nextButton];
  }
  else {
  v4 = [(PXPeopleFlowNavigationController *)self doneButton];
  }
  v5 = [(PXPeopleFlowNavigationController *)self currentViewController];
  int v6 = [v5 navigationItem];

  [v6 setLeftBarButtonItem:v3];
  [v6 setRightBarButtonItem:v4];
}

- (void)back:(id)a3
{
  id v7 = [(PXPeopleFlowNavigationController *)self currentViewController];
  if (objc_opt_respondsToSelector()) {
    [v7 willTransitionToPreviousInFlow];
  }
  [(PXPeopleFlowNavigationController *)self setAdvanceButtonEnabled:1];
  v4 = [(PXPeopleFlowNavigationController *)self flowController];
  if ([v4 hasPreviousViewController])
  {
    v5 = [v4 previousViewController];
    if (v5) {
      id v6 = (id)[(PXPeopleFlowNavigationController *)self popViewControllerAnimated:1];
    }
  }
  else
  {
    [(PXPeopleFlowNavigationController *)self cancel:self];
  }
}

- (void)next:(id)a3
{
  id v6 = [(PXPeopleFlowNavigationController *)self currentViewController];
  if (objc_opt_respondsToSelector()) {
    [v6 willTransitionToNextInFlow];
  }
  [(PXPeopleFlowNavigationController *)self setAdvanceButtonEnabled:1];
  v4 = [(PXPeopleFlowNavigationController *)self flowController];
  if ([v4 hasNextViewController])
  {
    v5 = [v4 nextViewController];
    if (objc_opt_respondsToSelector()) {
      [v5 willTransitionIn];
    }
    [(PXPeopleFlowNavigationController *)self pushViewController:v5 animated:1];
  }
  else
  {
    [(PXPeopleFlowNavigationController *)self done:self];
  }
}

- (void)done:(id)a3
{
  id v5 = a3;
  id v6 = [(PXPeopleFlowNavigationController *)self currentViewController];
  if (objc_opt_respondsToSelector()) {
    [v6 willTransitionToNextInFlow];
  }
  if (objc_opt_respondsToSelector()) {
    char v7 = [v6 shouldConfirmAdvancement];
  }
  else {
    char v7 = 0;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __41__PXPeopleFlowNavigationController_done___block_invoke;
  aBlock[3] = &unk_1E5DD1068;
  aBlock[4] = self;
  id v8 = v5;
  id v34 = v8;
  id v9 = _Block_copy(aBlock);
  v10 = v9;
  if ((v7 & 1) == 0)
  {
    (*((void (**)(void *, void))v9 + 2))(v9, 0);
    goto LABEL_14;
  }
  v11 = [v6 bootstrapContext];
  v12 = [v11 localizedName];
  v32 = v11;
  v13 = [v11 sourcePerson];
  if (!v13)
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    v25 = (objc_class *)objc_opt_class();
    v26 = NSStringFromClass(v25);
    [v24 handleFailureInMethod:a2, self, @"PXPeopleFlowNavigationController.m", 99, @"%@ should be an instance inheriting from %@, but it is nil", @"context.sourcePerson", v26 object file lineNumber description];
LABEL_17:

    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    v27 = (objc_class *)objc_opt_class();
    v26 = NSStringFromClass(v27);
    v28 = objc_msgSend(v13, "px_descriptionForAssertionMessage");
    [v24 handleFailureInMethod:a2, self, @"PXPeopleFlowNavigationController.m", 99, @"%@ should be an instance inheriting from %@, but it is %@", @"context.sourcePerson", v26, v28 object file lineNumber description];

    goto LABEL_17;
  }
LABEL_9:
  v30 = v12;
  v31 = self;
  if ([v12 length])
  {
    v14 = PXLocalizedStringForPersonOrPetAndVisibility(v13, 0, @"PXPeopleBootstrapVerifyAlertMessageNamed");
    v15 = PXStringWithValidatedFormat();

    v16 = PXLocalizedStringForPersonOrPetAndVisibility(v13, 0, @"PXPeopleBootstrapVerifyAlertConfirmTitleNamed");
    v29 = v12;
    v17 = PXStringWithValidatedFormat();
  }
  else
  {
    v15 = PXLocalizedStringForPersonOrPetAndVisibility(v13, 0, @"PXPeopleBootstrapVerifyAlertMessageUnnamed");
    v17 = PXLocalizedStringForPersonOrPetAndVisibility(v13, 0, @"PXPeopleBootstrapVerifyAlertConfirmTitleUnnamed");
  }
  v18 = objc_msgSend(MEMORY[0x1E4FB1418], "alertControllerWithTitle:message:preferredStyle:", 0, v15, 0, v29);
  v19 = [MEMORY[0x1E4FB1410] actionWithTitle:v17 style:0 handler:v10];
  v20 = (void *)MEMORY[0x1E4FB1410];
  v21 = PXLocalizedStringFromTable(@"PXPeopleBootstrapVerifyAlertCancel", @"PhotosUICore");
  v22 = [v20 actionWithTitle:v21 style:1 handler:&__block_literal_global_136372];

  [v18 addAction:v19];
  [v18 addAction:v22];
  v23 = [v18 popoverPresentationController];
  [v23 setBarButtonItem:v8];

  [(PXPeopleFlowNavigationController *)v31 presentViewController:v18 animated:1 completion:0];
LABEL_14:
}

uint64_t __41__PXPeopleFlowNavigationController_done___block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = [*(id *)(a1 + 32) flowController];
  [v4 done:*(void *)(a1 + 40)];

  uint64_t result = [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
  if (a2)
  {
    id v6 = (void *)MEMORY[0x1E4F56658];
    uint64_t v7 = MEMORY[0x1E4F1CC08];
    return [v6 sendEvent:@"com.apple.photos.CPAnalytics.people.bootstrap.speedbump.advance" withPayload:v7];
  }
  return result;
}

uint64_t __41__PXPeopleFlowNavigationController_done___block_invoke_2()
{
  return [MEMORY[0x1E4F56658] sendEvent:@"com.apple.photos.CPAnalytics.people.bootstrap.speedbump.cancel" withPayload:MEMORY[0x1E4F1CC08]];
}

- (void)cancel:(id)a3
{
  id v4 = a3;
  id v5 = [(PXPeopleFlowNavigationController *)self flowController];
  [v5 cancel:v4];

  [(PXPeopleFlowNavigationController *)self dismissViewControllerAnimated:1 completion:0];
}

- (CGSize)preferredContentSize
{
  double v2 = 540.0;
  double v3 = 700.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)viewDidLoad
{
  v20[1] = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)PXPeopleFlowNavigationController;
  [(PXPeopleFlowNavigationController *)&v16 viewDidLoad];
  double v3 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel_cancel_];
  [(PXPeopleFlowNavigationController *)self setCancelButton:v3];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel_done_];
  uint64_t v19 = *MEMORY[0x1E4FB06F8];
  uint64_t v5 = v19;
  id v6 = (void *)MEMORY[0x1E4FB08E0];
  [MEMORY[0x1E4FB08E0] buttonFontSize];
  uint64_t v7 = objc_msgSend(v6, "systemFontOfSize:weight:");
  v20[0] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
  [v4 setTitleTextAttributes:v8 forState:0];

  [(PXPeopleFlowNavigationController *)self setDoneButton:v4];
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:101 target:self action:sel_back_];
  [(PXPeopleFlowNavigationController *)self setBackButton:v9];
  id v10 = objc_alloc(MEMORY[0x1E4FB14A8]);
  v11 = PXLocalizedStringFromTable(@"PXNext", @"PhotosUICore");
  v12 = (void *)[v10 initWithTitle:v11 style:0 target:self action:sel_next_];

  uint64_t v17 = v5;
  v13 = (void *)MEMORY[0x1E4FB08E0];
  [MEMORY[0x1E4FB08E0] buttonFontSize];
  v14 = objc_msgSend(v13, "systemFontOfSize:weight:");
  v18 = v14;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  [v12 setTitleTextAttributes:v15 forState:0];

  [(PXPeopleFlowNavigationController *)self setNextButton:v12];
  [(PXPeopleFlowNavigationController *)self setDelegate:self];
}

- (PXPeopleFlowNavigationController)initWithFlowController:(id)a3
{
  id v5 = a3;
  if ([v5 hasNextViewController])
  {
    id v6 = [v5 nextViewController];
    v10.receiver = self;
    v10.super_class = (Class)PXPeopleFlowNavigationController;
    uint64_t v7 = [(PXPeopleFlowNavigationController *)&v10 initWithRootViewController:v6];

    if (!v7) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  v9.receiver = self;
  v9.super_class = (Class)PXPeopleFlowNavigationController;
  uint64_t v7 = [(PXPeopleFlowNavigationController *)&v9 init];
  if (v7) {
LABEL_5:
  }
    objc_storeStrong((id *)&v7->_flowController, a3);
LABEL_6:

  return v7;
}

@end