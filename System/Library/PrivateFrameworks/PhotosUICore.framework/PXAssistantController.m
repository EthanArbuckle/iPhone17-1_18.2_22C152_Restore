@interface PXAssistantController
- (BOOL)completed;
- (BOOL)presentationControllerShouldDismiss:(id)a3;
- (BOOL)shouldConfirmCancellationOfAssistantForStepContextWithIdentifier:(id)a3;
- (CGSize)preferredContentSize;
- (PXAssistantContext)context;
- (PXAssistantController)init;
- (PXAssistantController)initWithCoder:(id)a3;
- (PXAssistantController)initWithContext:(id)a3;
- (PXAssistantController)initWithNibName:(id)a3 bundle:(id)a4;
- (PXAssistantControllerDelegate)delegate;
- (id)_nextViewControllerFromViewController:(id)a3;
- (id)initialStepContexts;
- (id)nextStepContextForStepContextIdentifier:(id)a3;
- (void)_cancelBarButtonItemAction:(id)a3;
- (void)_completeAssistantWithError:(id)a3;
- (void)_completeBarButtonItemAction:(id)a3;
- (void)_confirmCancellationOfAssistantWithDestruction;
- (void)_presentInitialViewControllers;
- (void)_setStepContext:(id)a3;
- (void)_setUseTransparentBarAppearance:(BOOL)a3;
- (void)_stepForwardBarButtonItemAction:(id)a3;
- (void)_stepForwardInAssistantAnimated:(BOOL)a3 currentViewController:(id)a4;
- (void)_updateBarAppearance;
- (void)_updateNextStepContext:(id)a3;
- (void)_updateViewController:(id)a3 forChangesWithDescriptor:(unint64_t)a4;
- (void)assistantForAssistantViewController:(id)a3 failedWithError:(id)a4;
- (void)assistantViewController:(id)a3 dismissViewControllerAnimated:(BOOL)a4;
- (void)assistantViewController:(id)a3 presentAlertWithConfiguration:(id)a4 animated:(BOOL)a5;
- (void)assistantViewController:(id)a3 presentViewController:(id)a4 animated:(BOOL)a5;
- (void)assistantViewController:(id)a3 pushViewController:(id)a4 animated:(BOOL)a5;
- (void)cancelAssistantForAssistantViewController:(id)a3;
- (void)cancelAssistantWithDestruction:(BOOL)a3;
- (void)completeAssistantForAssistantViewController:(id)a3;
- (void)completeAssistantWithError:(id)a3;
- (void)loadView;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)setCompleted:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)stepContextWithIdentifier:(id)a3 confirmCancellationWithAlertProperties:(id)a4;
- (void)stepForwardInAssistantForAssistantViewController:(id)a3;
- (void)stepForwardInAssistantForAssistantViewControllerAsCurrentViewController:(id)a3;
@end

@implementation PXAssistantController

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_stepContext, 0);
  objc_storeStrong((id *)&self->_viewControllerToStepContext, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
}

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

- (BOOL)completed
{
  return self->_completed;
}

- (void)setDelegate:(id)a3
{
}

- (PXAssistantControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXAssistantControllerDelegate *)WeakRetained;
}

- (PXAssistantContext)context
{
  return self->_context;
}

- (void)presentationControllerDidDismiss:(id)a3
{
}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 1;
  }
  context = self->_context;
  v5 = [(PXAssistantStepContext *)self->_stepContext identifier];
  LOBYTE(context) = [(PXAssistantContext *)context shouldConfirmCancellationOfAssistantForStepContextWithIdentifier:v5];

  return context ^ 1;
}

- (void)assistantViewController:(id)a3 presentAlertWithConfiguration:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  v10 = [[PXAlert alloc] initWithConfiguration:v7];

  navigationController = self->_navigationController;
  v9 = [(PXAlert *)v10 alertController];
  [(UINavigationController *)navigationController presentViewController:v9 animated:v5 completion:0];
}

- (void)assistantViewController:(id)a3 dismissViewControllerAnimated:(BOOL)a4
{
}

- (void)assistantViewController:(id)a3 presentViewController:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v10 = v8;
  if (!v8)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PXAssistantController+iOS.m", 359, @"Invalid parameter not satisfying: %@", @"viewController" object file lineNumber description];

    id v8 = 0;
  }
  [(UINavigationController *)self->_navigationController presentViewController:v8 animated:v5 completion:0];
}

- (void)assistantViewController:(id)a3 pushViewController:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v10 = v8;
  if (!v8)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PXAssistantController+iOS.m", 353, @"Invalid parameter not satisfying: %@", @"viewController" object file lineNumber description];

    id v8 = 0;
  }
  [(UINavigationController *)self->_navigationController pushViewController:v8 animated:v5];
}

- (void)assistantForAssistantViewController:(id)a3 failedWithError:(id)a4
{
}

- (void)completeAssistantForAssistantViewController:(id)a3
{
}

- (void)cancelAssistantForAssistantViewController:(id)a3
{
}

- (void)stepForwardInAssistantForAssistantViewControllerAsCurrentViewController:(id)a3
{
  id v5 = a3;
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
    id v4 = v5;
  }
  else {
    id v4 = 0;
  }

  [(PXAssistantController *)self _stepForwardInAssistantAnimated:1 currentViewController:v4];
}

- (void)stepForwardInAssistantForAssistantViewController:(id)a3
{
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  if ((void *)PXAssistantStepContextObservationContext == a5)
  {
    id v7 = [(UINavigationController *)self->_navigationController viewControllers];
    id v8 = [v7 lastObject];

    [(PXAssistantController *)self _updateViewController:v8 forChangesWithDescriptor:a4];
  }
}

- (void)_updateBarAppearance
{
  id v5 = objc_alloc_init(MEMORY[0x1E4FB19D8]);
  v3 = [v5 shadowColor];
  [v5 configureWithTransparentBackground];
  if (![(PXAssistantStepContext *)self->_stepContext useTransparentBarAppearance]) {
    [v5 setShadowColor:v3];
  }
  id v4 = [(UINavigationController *)self->_navigationController navigationBar];
  [v4 setStandardAppearance:v5];
}

- (void)_completeBarButtonItemAction:(id)a3
{
}

- (void)_cancelBarButtonItemAction:(id)a3
{
}

- (void)_stepForwardBarButtonItemAction:(id)a3
{
}

- (void)_confirmCancellationOfAssistantWithDestruction
{
  v3 = [(PXAssistantStepContext *)self->_stepContext identifier];
  if ([(PXAssistantController *)self shouldConfirmCancellationOfAssistantForStepContextWithIdentifier:v3])
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __71__PXAssistantController__confirmCancellationOfAssistantWithDestruction__block_invoke;
    v4[3] = &unk_1E5DB00C8;
    v4[4] = self;
    [(PXAssistantController *)self stepContextWithIdentifier:v3 confirmCancellationWithAlertProperties:v4];
  }
  else
  {
    [(PXAssistantController *)self cancelAssistantWithDestruction:0];
  }
}

void __71__PXAssistantController__confirmCancellationOfAssistantWithDestruction__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = a2;
  v18 = PLUIGetLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v28 = v19;
    _os_log_impl(&dword_1A9AE7000, v18, OS_LOG_TYPE_DEFAULT, "Will confirm request to cancel assistant controller: %@", buf, 0xCu);
  }

  v20 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v17 message:v16 preferredStyle:0];

  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __71__PXAssistantController__confirmCancellationOfAssistantWithDestruction__block_invoke_278;
  v26[3] = &unk_1E5DD0030;
  v26[4] = *(void *)(a1 + 32);
  v21 = [MEMORY[0x1E4FB1410] actionWithTitle:v15 style:2 handler:v26];

  [v20 addAction:v21];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __71__PXAssistantController__confirmCancellationOfAssistantWithDestruction__block_invoke_280;
  v25[3] = &unk_1E5DD0030;
  v25[4] = *(void *)(a1 + 32);
  v22 = [MEMORY[0x1E4FB1410] actionWithTitle:v14 style:1 handler:v25];

  [v20 addAction:v22];
  if (v13)
  {
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __71__PXAssistantController__confirmCancellationOfAssistantWithDestruction__block_invoke_281;
    v24[3] = &unk_1E5DB7860;
    v24[4] = *(void *)(a1 + 32);
    v24[5] = a7;
    v23 = [MEMORY[0x1E4FB1410] actionWithTitle:v13 style:0 handler:v24];
    [v20 addAction:v23];
  }
  [*(id *)(*(void *)(a1 + 32) + 976) presentViewController:v20 animated:1 completion:0];
}

uint64_t __71__PXAssistantController__confirmCancellationOfAssistantWithDestruction__block_invoke_278(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = PLUIGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1A9AE7000, v2, OS_LOG_TYPE_DEFAULT, "Did confirm request to cancel assistant controller: %@", (uint8_t *)&v5, 0xCu);
  }

  return [*(id *)(a1 + 32) cancelAssistantWithDestruction:1];
}

void __71__PXAssistantController__confirmCancellationOfAssistantWithDestruction__block_invoke_280(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = PLUIGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_1A9AE7000, v2, OS_LOG_TYPE_DEFAULT, "User canceled confirmation of request to cancel assistant controller: %@", (uint8_t *)&v4, 0xCu);
  }
}

uint64_t __71__PXAssistantController__confirmCancellationOfAssistantWithDestruction__block_invoke_281(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = PLUIGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v6 = 138412290;
    uint64_t v7 = v3;
    _os_log_impl(&dword_1A9AE7000, v2, OS_LOG_TYPE_DEFAULT, "User chose to continue when requested to cancel assistant controller: %@", (uint8_t *)&v6, 0xCu);
  }

  int v4 = *(void **)(a1 + 32);
  if (*(void *)(a1 + 40)) {
    return [v4 cancelAssistantWithDestruction:0];
  }
  else {
    return [v4 _stepForwardInAssistantAnimated:1 currentViewController:0];
  }
}

- (void)_setUseTransparentBarAppearance:(BOOL)a3
{
  if (self->_useTransparentBarAppearance != a3)
  {
    self->_useTransparentBarAppearance = a3;
    [(PXAssistantController *)self _updateBarAppearance];
  }
}

- (void)_stepForwardInAssistantAnimated:(BOOL)a3 currentViewController:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (!v6)
  {
    uint64_t v7 = [(UINavigationController *)self->_navigationController viewControllers];
    id v9 = [v7 lastObject];

    id v6 = v9;
  }
  id v10 = v6;
  uint64_t v8 = [(PXAssistantController *)self _nextViewControllerFromViewController:v6];
  [(UINavigationController *)self->_navigationController pushViewController:v8 animated:v4];
  if ([v8 conformsToProtocol:&unk_1F0321158]) {
    [v8 setAssistantViewControllerDelegate:self];
  }
}

- (void)_updateViewController:(id)a3 forChangesWithDescriptor:(unint64_t)a4
{
  __int16 v4 = a4;
  id v19 = a3;
  if ((v4 & 5) != 0)
  {
    id v6 = 0;
    switch([(PXAssistantStepContext *)self->_stepContext firstButtonType])
    {
      case 0:
        uint64_t v7 = PXLocalizedStringFromTable(@"PXAssistant_ButtonTitle_Next", @"PhotosUICore");
        uint64_t v8 = &selRef__stepForwardBarButtonItemAction_;
        goto LABEL_8;
      case 1:
        uint64_t v9 = PXLocalizedStringFromTable(@"PXAssistant_ButtonTitle_Done", @"PhotosUICore");
        goto LABEL_6;
      case 2:
        uint64_t v9 = [(PXAssistantStepContext *)self->_stepContext firstButtonTitle];
LABEL_6:
        uint64_t v7 = (void *)v9;
        uint64_t v8 = &selRef__completeBarButtonItemAction_;
        goto LABEL_8;
      case 4:
        uint64_t v7 = PXLocalizedStringFromTable(@"PXAssistant_ButtonTitle_Cancel", @"PhotosUICore");
        uint64_t v8 = &selRef__cancelBarButtonItemDestructiveAction_;
LABEL_8:
        id v6 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:v7 style:0 target:self action:*v8];

        break;
      default:
        break;
    }
    id v10 = [v19 navigationItem];
    [v10 setRightBarButtonItem:v6];
  }
  if ((v4 & 4) != 0)
  {
    BOOL v11 = [(PXAssistantStepContext *)self->_stepContext firstButtonEnabled];
    v12 = [v19 navigationItem];
    id v13 = [v12 rightBarButtonItem];

    [v13 setEnabled:v11];
    if ((v4 & 0x200) == 0)
    {
LABEL_12:
      if ((v4 & 8) == 0) {
        goto LABEL_21;
      }
      goto LABEL_16;
    }
  }
  else if ((v4 & 0x200) == 0)
  {
    goto LABEL_12;
  }
  [(PXAssistantController *)self _setUseTransparentBarAppearance:[(PXAssistantStepContext *)self->_stepContext useTransparentBarAppearance]];
  if ((v4 & 8) == 0) {
    goto LABEL_21;
  }
LABEL_16:
  id v14 = [v19 navigationItem];
  if ([(PXAssistantStepContext *)self->_stepContext secondButtonType] == 2)
  {
    [v14 setLeftBarButtonItem:0];
    [v14 setHidesBackButton:1];
  }
  else
  {
    id v15 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:&stru_1F00B0030 style:0 target:0 action:0];
    [v14 setBackBarButtonItem:v15];

    id v16 = [(UINavigationController *)self->_navigationController viewControllers];
    uint64_t v17 = [v16 count];

    if (!v17)
    {
      v18 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel__cancelBarButtonItemAction_];
      [v14 setLeftBarButtonItem:v18];
    }
  }
  [v14 setBackButtonTitle:&stru_1F00B0030];

LABEL_21:
}

- (void)_setStepContext:(id)a3
{
  BOOL v11 = (PXAssistantStepContext *)a3;
  if (!v11)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PXAssistantController+iOS.m", 155, @"Invalid parameter not satisfying: %@", @"stepContext" object file lineNumber description];
  }
  p_stepContext = &self->_stepContext;
  uint64_t v7 = self->_stepContext;
  if (v7 == v11)
  {
  }
  else
  {
    uint64_t v8 = v11;
    char v9 = [(PXAssistantStepContext *)v8 isEqual:v7];

    if ((v9 & 1) == 0)
    {
      [(PXAssistantStepContext *)*p_stepContext unregisterChangeObserver:self context:PXAssistantStepContextObservationContext];
      objc_storeStrong((id *)&self->_stepContext, a3);
      [(PXAssistantStepContext *)*p_stepContext registerChangeObserver:self context:PXAssistantStepContextObservationContext];
      [(PXAssistantController *)self _setUseTransparentBarAppearance:[(PXAssistantStepContext *)v8 useTransparentBarAppearance]];
    }
  }
}

- (void)_presentInitialViewControllers
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PXAssistantController *)self initialStepContexts];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        [(PXAssistantController *)self _updateNextStepContext:v8];
        char v9 = [v8 viewController];
        navigationController = self->_navigationController;
        BOOL v11 = [v8 viewController];
        [(UINavigationController *)navigationController pushViewController:v11 animated:0];

        if ([v9 conformsToProtocol:&unk_1F0321158]) {
          [v9 setAssistantViewControllerDelegate:self];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
}

- (id)_nextViewControllerFromViewController:(id)a3
{
  uint64_t v4 = [(NSMapTable *)self->_viewControllerToStepContext objectForKey:a3];
  uint64_t v5 = [v4 identifier];
  uint64_t v6 = [(PXAssistantController *)self nextStepContextForStepContextIdentifier:v5];
  [(PXAssistantController *)self _updateNextStepContext:v6];
  uint64_t v7 = [v6 viewController];

  return v7;
}

- (void)_updateNextStepContext:(id)a3
{
  id v4 = a3;
  id v5 = [v4 viewController];
  [(NSMapTable *)self->_viewControllerToStepContext setObject:v4 forKey:v5];
  [(PXAssistantController *)self _setStepContext:v4];

  [(PXAssistantController *)self _updateViewController:v5 forChangesWithDescriptor:13];
}

- (CGSize)preferredContentSize
{
  if (self->_navigationController
    && ([MEMORY[0x1E4FB16C8] currentDevice],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        uint64_t v4 = [v3 userInterfaceIdiom],
        v3,
        v4 == 1))
  {
    navigationController = self->_navigationController;
    [(UINavigationController *)navigationController preferredContentSize];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PXAssistantController;
    [(PXAssistantController *)&v8 preferredContentSize];
  }
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)loadView
{
  v29[4] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  [(PXAssistantController *)self setView:v3];
  uint64_t v4 = (UINavigationController *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithNibName:0 bundle:0];
  navigationController = self->_navigationController;
  self->_navigationController = v4;

  double v6 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v7 = [v6 userInterfaceIdiom];

  if (v7 == 1) {
    [(UINavigationController *)self->_navigationController setModalPresentationStyle:2];
  }
  [(PXAssistantController *)self _updateBarAppearance];
  [(PXAssistantController *)self addChildViewController:self->_navigationController];
  objc_super v8 = [(UINavigationController *)self->_navigationController view];
  char v9 = [(UINavigationController *)self->_navigationController view];
  [v3 addSubview:v9];

  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  v22 = (void *)MEMORY[0x1E4F28DC8];
  v27 = [v8 topAnchor];
  v26 = [v3 topAnchor];
  v25 = [v27 constraintEqualToAnchor:v26];
  v29[0] = v25;
  v24 = [v8 leadingAnchor];
  v23 = [v3 leadingAnchor];
  id v10 = [v24 constraintEqualToAnchor:v23];
  v29[1] = v10;
  BOOL v11 = [v8 bottomAnchor];
  long long v12 = [v3 bottomAnchor];
  long long v13 = [v11 constraintEqualToAnchor:v12];
  v29[2] = v13;
  uint64_t v28 = v8;
  long long v14 = [v8 trailingAnchor];
  [v3 trailingAnchor];
  v16 = long long v15 = v3;
  uint64_t v17 = [v14 constraintEqualToAnchor:v16];
  v29[3] = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:4];
  [v22 activateConstraints:v18];

  if (objc_opt_respondsToSelector())
  {
    objc_msgSend(v15, "px_screenScale");
    v20 = -[PXAssistantTraitCollection initWithDisplayScale:isRTL:]([PXAssistantTraitCollection alloc], "initWithDisplayScale:isRTL:", [v15 effectiveUserInterfaceLayoutDirection] == 1, v19);
    [(PXAssistantContext *)self->_context setAssistantTraitCollection:v20];
  }
  [(PXAssistantController *)self _presentInitialViewControllers];
  v21 = [(PXAssistantController *)self presentationController];
  [v21 setDelegate:self];
}

- (PXAssistantController)initWithContext:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    long long v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PXAssistantController+iOS.m", 53, @"Invalid parameter not satisfying: %@", @"context" object file lineNumber description];
  }
  v15.receiver = self;
  v15.super_class = (Class)PXAssistantController;
  uint64_t v7 = [(PXAssistantController *)&v15 initWithNibName:0 bundle:0];
  objc_super v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_context, a3);
    uint64_t v9 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    viewControllerToStepContext = v8->_viewControllerToStepContext;
    v8->_viewControllerToStepContext = (NSMapTable *)v9;

    v8->_useTransparentBarAppearance = 1;
    BOOL v11 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v12 = [v11 userInterfaceIdiom];

    if (v12 == 1) {
      [(PXAssistantController *)v8 setModalPresentationStyle:2];
    }
  }

  return v8;
}

- (PXAssistantController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXAssistantController+iOS.m", 49, @"%s is not available as initializer", "-[PXAssistantController initWithNibName:bundle:]");

  abort();
}

- (PXAssistantController)initWithCoder:(id)a3
{
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXAssistantController+iOS.m", 45, @"%s is not available as initializer", "-[PXAssistantController initWithCoder:]");

  abort();
}

- (PXAssistantController)init
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXAssistantController+iOS.m", 41, @"%s is not available as initializer", "-[PXAssistantController init]");

  abort();
}

- (void)stepContextWithIdentifier:(id)a3 confirmCancellationWithAlertProperties:(id)a4
{
  id v11 = a3;
  id v7 = a4;
  if (v11)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PXAssistantController_Internal.m", 102, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];

    if (v7) {
      goto LABEL_3;
    }
  }
  id v10 = [MEMORY[0x1E4F28B00] currentHandler];
  [v10 handleFailureInMethod:a2, self, @"PXAssistantController_Internal.m", 103, @"Invalid parameter not satisfying: %@", @"alertProperties" object file lineNumber description];

LABEL_3:
  id v8 = [(PXAssistantController *)self context];
  [v8 stepContextWithIdentifier:v11 confirmCancellationWithAlertProperties:v7];
}

- (BOOL)shouldConfirmCancellationOfAssistantForStepContextWithIdentifier:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PXAssistantController_Internal.m", 90, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }
  id v6 = [(PXAssistantController *)self context];
  if (objc_opt_respondsToSelector()) {
    char v7 = [v6 shouldConfirmCancellationOfAssistantForStepContextWithIdentifier:v5];
  }
  else {
    char v7 = 0;
  }

  return v7;
}

- (id)nextStepContextForStepContextIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(PXAssistantController *)self context];
  id v6 = [v5 nextStepContextIdentifierFromStepContextIdentifier:v4];

  char v7 = [v5 stepContextForStepContextIdentifier:v6];

  return v7;
}

- (id)initialStepContexts
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = [(PXAssistantController *)self context];
  id v3 = [v2 initialStepContextIdentifiers];
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = objc_msgSend(v2, "stepContextForStepContextIdentifier:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)completeAssistantWithError:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(PXAssistantController *)self completed])
  {
    id v5 = PLUIGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412546;
      uint64_t v9 = self;
      __int16 v10 = 2112;
      id v11 = v4;
      _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_ERROR, "Ignoring attempt to complete already completed assistant controller: %@, error: %@", (uint8_t *)&v8, 0x16u);
    }
  }
  else
  {
    uint64_t v6 = PLUIGetLog();
    uint64_t v7 = v6;
    if (v4)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        int v8 = 138412546;
        uint64_t v9 = self;
        __int16 v10 = 2112;
        id v11 = v4;
        _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_ERROR, "Assistant controller: %@, failed with error: %@", (uint8_t *)&v8, 0x16u);
      }

      id v5 = objc_msgSend(MEMORY[0x1E4F28C58], "px_errorWithDomain:code:underlyingError:debugDescription:", @"PXAssistantErrorDomain", -1000, v4, @"Assistant failed with an error");
    }
    else
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 138412290;
        uint64_t v9 = self;
        _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_DEFAULT, "Assistant completed successfully: %@", (uint8_t *)&v8, 0xCu);
      }

      id v5 = 0;
    }
    [(PXAssistantController *)self _completeAssistantWithError:v5];
  }
}

- (void)cancelAssistantWithDestruction:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([(PXAssistantController *)self completed])
  {
    id v5 = PLUIGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138412290;
      long long v13 = self;
      _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_ERROR, "Ignoring attempt to cancel already completed assistant controller: %@", (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    uint64_t v6 = [(PXAssistantController *)self context];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      int v8 = [(PXAssistantController *)self context];
      [v8 willCancelAssistant];
    }
    uint64_t v9 = PLUIGetLog();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v10)
      {
        int v12 = 138412290;
        long long v13 = self;
        _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_DEFAULT, "Assistant cancelled with destruction by the user: %@", (uint8_t *)&v12, 0xCu);
      }
      uint64_t v11 = -1002;
    }
    else
    {
      if (v10)
      {
        int v12 = 138412290;
        long long v13 = self;
        _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_DEFAULT, "Assistant cancelled by the user: %@", (uint8_t *)&v12, 0xCu);
      }
      uint64_t v11 = -1001;
    }

    id v5 = objc_msgSend(MEMORY[0x1E4F28C58], "px_errorWithDomain:code:debugDescription:", @"PXAssistantErrorDomain", v11, @"Assistant was cancelled by the user");
    [(PXAssistantController *)self _completeAssistantWithError:v5];
  }
}

- (void)_completeAssistantWithError:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([(PXAssistantController *)self completed])
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PXAssistantController_Internal.m", 22, @"Invalid parameter not satisfying: %@", @"!self.completed" object file lineNumber description];
  }
  [(PXAssistantController *)self setCompleted:1];
  uint64_t v6 = [(PXAssistantController *)self delegate];
  char v7 = v6;
  if (v6)
  {
    [v6 assistantController:self completedWithError:v5];
  }
  else
  {
    int v8 = PLUIGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v11 = self;
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_ERROR, "No PXAssistantControllerDelegate available to handle assistantController: %@ completedWithError: %@", buf, 0x16u);
    }
  }
}

@end