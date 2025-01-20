@interface SFDialogController
+ (void)applicationDidEnterBackground;
- ($74EE3C8A9A83D7DA9DE4D87A9C9037E2)_currentSlot;
- (BOOL)_isPresentingDialog;
- (SFDialog)presentedDialog;
- (SFDialogController)init;
- (SFDialogControllerDelegate)delegate;
- (SFDialogViewControllerPresenting)viewControllerPresenter;
- (SFDialogViewPresenting)dialogPresenter;
- (id)_initWithDialogManager:(id)a3;
- (int)_currentWebProcessID;
- (int64_t)_presentDialog:(id)a3 forWebProcessID:(int)a4 withAdditionalAnimations:(id)a5;
- (void)_dismissCurrentDialogWithResponse:(id)a3;
- (void)_dismissDialogWithAdditionalAnimations:(id)a3;
- (void)cancelPresentedDialogIfNeeded;
- (void)dialogView:(id)a3 didSelectActionAtIndex:(unint64_t)a4 withInputText:(id)a5 passwordText:(id)a6;
- (void)owningTabWillClose;
- (void)owningWebViewDidChangeProcessID;
- (void)owningWebViewDidCommitNavigationWithURL:(id)a3;
- (void)owningWebViewWillBecomeActive;
- (void)owningWebViewWillNavigate;
- (void)presentDialog:(id)a3;
- (void)presentDialog:(id)a3 animateAlongsidePresentation:(id)a4 dismissal:(id)a5;
- (void)presentNextDialogIfNeeded;
- (void)setDelegate:(id)a3;
- (void)setDialogPresenter:(id)a3;
- (void)setViewControllerPresenter:(id)a3;
@end

@implementation SFDialogController

- (void)owningWebViewWillBecomeActive
{
  dialogManager = self->_dialogManager;
  uint64_t v4 = [(SFDialogController *)self _currentSlot];

  -[WBSTabDialogManager presentNextDialogForSlot:](dialogManager, "presentNextDialogForSlot:", v4, v3);
}

- (void)presentNextDialogIfNeeded
{
  dialogManager = self->_dialogManager;
  uint64_t v4 = [(SFDialogController *)self _currentSlot];

  -[WBSTabDialogManager presentNextDialogForSlot:](dialogManager, "presentNextDialogForSlot:", v4, v3);
}

- ($74EE3C8A9A83D7DA9DE4D87A9C9037E2)_currentSlot
{
  unsigned int v3 = [(SFDialogController *)self _currentWebProcessID];
  unint64_t v4 = [(SFDialogController *)self _tabID];
  uint64_t v5 = v3;
  result.var1 = v4;
  result.var0 = v5;
  return result;
}

- (int)_currentWebProcessID
{
  v2 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dialogPresenter);
  LODWORD(v2) = [WeakRetained webProcessIDForDialogController:v2];

  return (int)v2;
}

- (void)setViewControllerPresenter:(id)a3
{
}

- (void)setDialogPresenter:(id)a3
{
}

- (void)setDelegate:(id)a3
{
}

- (SFDialog)presentedDialog
{
  return self->_presentedDialog;
}

- (void)cancelPresentedDialogIfNeeded
{
  if (self->_presentedDialog) {
    [(SFDialogController *)self _dismissCurrentDialogWithResponse:0];
  }
}

- (SFDialogController)init
{
  if (!defaultDialogManager)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F98418]);
    unint64_t v4 = (void *)defaultDialogManager;
    defaultDialogManager = (uint64_t)v3;
  }

  return (SFDialogController *)-[SFDialogController _initWithDialogManager:](self, "_initWithDialogManager:");
}

- (id)_initWithDialogManager:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFDialogController;
  v6 = [(SFDialogController *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dialogManager, a3);
    v8 = v7;
  }

  return v7;
}

- (void)presentDialog:(id)a3
{
}

- (void)presentDialog:(id)a3 animateAlongsidePresentation:(id)a4 dismissal:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [(SFDialogController *)self _currentWebProcessID];
  if (v11)
  {
    unsigned int v12 = v11;
    objc_initWeak(location, self);
    objc_initWeak(&from, self->_dialogManager);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __75__SFDialogController_presentDialog_animateAlongsidePresentation_dismissal___block_invoke;
    aBlock[3] = &unk_1E54ECF88;
    objc_copyWeak(&v32, location);
    id v13 = v8;
    id v30 = v13;
    unsigned int v33 = v12;
    id v31 = v9;
    v14 = _Block_copy(aBlock);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __75__SFDialogController_presentDialog_animateAlongsidePresentation_dismissal___block_invoke_2;
    v24[3] = &unk_1E54ECFB0;
    objc_copyWeak(&v27, location);
    objc_copyWeak(&v28, &from);
    id v26 = v10;
    id v15 = v13;
    id v25 = v15;
    v16 = _Block_copy(v24);
    v23 = v14;
    v17 = [MEMORY[0x1E4F98400] tabDialogWithPresentationBlock:v14 dismissalBlock:v16];
    objc_msgSend(v17, "setBlocksWebProcessUntilDismissed:", objc_msgSend(v15, "completionHandlerBlocksWebProcess"));
    v18 = [MEMORY[0x1E4F1CA48] array];
    if (([v15 canceledOnProvisionalNavigation] & 1) == 0)
    {
      v19 = [MEMORY[0x1E4F98410] provisionalNavigationExemption];
      [v18 addObject:v19];
    }
    if (([v15 canceledOnCommittedNavigation] & 1) == 0)
    {
      v20 = [MEMORY[0x1E4F98410] committedNavigationExemption];
      [v18 addObject:v20];
    }
    if (([v15 canceledOnApplicationBackground] & 1) == 0)
    {
      v21 = (void *)[objc_alloc(MEMORY[0x1E4F98410]) initWithCancellationHandler:&__block_literal_global_54];
      [v18 addObject:v21];
    }
    v22 = [v15 additionalCancellationExemptions];
    [v18 addObjectsFromArray:v22];

    [v17 setCancellationExemptions:v18];
    -[WBSTabDialogManager enqueueOrPresentDialog:inSlot:](self->_dialogManager, "enqueueOrPresentDialog:inSlot:", v17, v12, [(SFDialogController *)self _tabID]);

    objc_destroyWeak(&v28);
    objc_destroyWeak(&v27);

    objc_destroyWeak(&v32);
    objc_destroyWeak(&from);
    objc_destroyWeak(location);
  }
  else
  {
    [v8 completeWithResponse:0];
  }
}

uint64_t __75__SFDialogController_presentDialog_animateAlongsidePresentation_dismissal___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = [WeakRetained _presentDialog:*(void *)(a1 + 32) forWebProcessID:*(unsigned int *)(a1 + 56) withAdditionalAnimations:*(void *)(a1 + 40)];

  return v3;
}

void __75__SFDialogController_presentDialog_animateAlongsidePresentation_dismissal___block_invoke_2(uint64_t a1, void *a2, int a3)
{
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v6 = objc_loadWeakRetained((id *)(a1 + 56));
  if (a3) {
    [WeakRetained _dismissDialogWithAdditionalAnimations:*(void *)(a1 + 40)];
  }
  [*(id *)(a1 + 32) completeWithResponse:v9];
  uint64_t v7 = [WeakRetained _currentSlot];
  objc_msgSend(v6, "presentNextDialogForSlot:", v7, v8);
}

uint64_t __75__SFDialogController_presentDialog_animateAlongsidePresentation_dismissal___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 reason];
  uint64_t v3 = [v2 isEqualToString:@"SFTabDialogCancellationReasonApplicationBackground"];

  return v3;
}

- (void)owningTabWillClose
{
  dialogManager = self->_dialogManager;
  unint64_t v3 = [(SFDialogController *)self _tabID];
  id v4 = [MEMORY[0x1E4F98408] tabClosedContext];
  [(WBSTabDialogManager *)dialogManager cancelAllDialogsForTabID:v3 context:v4];
}

- (void)owningWebViewDidChangeProcessID
{
  dialogManager = self->_dialogManager;
  unint64_t v3 = [(SFDialogController *)self _tabID];
  id v4 = [MEMORY[0x1E4F98408] tabClosedContext];
  [(WBSTabDialogManager *)dialogManager cancelAllDialogsForTabID:v3 context:v4];
}

- (void)owningWebViewWillNavigate
{
  uint64_t v3 = [(SFDialogController *)self _currentSlot];
  uint64_t v5 = v4;
  -[WBSTabDialogManager cancelAllDialogsBlockingSlot:](self->_dialogManager, "cancelAllDialogsBlockingSlot:", v3, v4);
  dialogManager = self->_dialogManager;
  id v7 = [MEMORY[0x1E4F98408] provisionalNavigationContext];
  [(WBSTabDialogManager *)dialogManager cancelAllDialogsForTabID:v5 context:v7];
}

- (void)owningWebViewDidCommitNavigationWithURL:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SFDialogController *)self _currentSlot];
  uint64_t v7 = v6;
  -[WBSTabDialogManager cancelAllDialogsBlockingSlot:](self->_dialogManager, "cancelAllDialogsBlockingSlot:", v5, v6);
  dialogManager = self->_dialogManager;
  id v9 = [MEMORY[0x1E4F98408] committedNavigationContextWithURL:v4];

  [(WBSTabDialogManager *)dialogManager cancelAllDialogsForTabID:v7 context:v9];
}

+ (void)applicationDidEnterBackground
{
  v2 = (void *)defaultDialogManager;
  id v3 = [MEMORY[0x1E4F98408] cancellationContextWithReason:@"SFTabDialogCancellationReasonApplicationBackground" userInfo:0];
  [v2 cancelAllDialogsWithContext:v3];
}

- (BOOL)_isPresentingDialog
{
  return self->_webProcessID != 0;
}

- (int64_t)_presentDialog:(id)a3 forWebProcessID:(int)a4 withAdditionalAnimations:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  objc_initWeak(&location, self);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_5;
  }
  uint64_t v12 = [WeakRetained dialogController:self presentationPolicyForDialog:v9];
  if (v12 != 2)
  {
    if (v12 == 1)
    {
      [(WBSTabDialogManager *)self->_dialogManager cancelAllDialogsForTabID:[(SFDialogController *)self _tabID]];
    }
    else if (!v12)
    {
LABEL_5:
      objc_storeStrong((id *)&self->_presentedDialog, a3);
      self->_webProcessID = a4;
      if (objc_opt_respondsToSelector()) {
        [WeakRetained dialogController:self willPresentDialog:v9];
      }
      uint64_t v13 = [v9 presentationStyle];
      if (v13 == 1)
      {
        uint64_t v22 = MEMORY[0x1E4F143A8];
        uint64_t v23 = 3221225472;
        v24 = __78__SFDialogController__presentDialog_forWebProcessID_withAdditionalAnimations___block_invoke;
        id v25 = &unk_1E54ECFF8;
        objc_copyWeak(&v26, &location);
        v17 = (UIViewController *)[v9 newViewControllerRepresentationWithCompletionHandler:&v22];
        dialogViewController = self->_dialogViewController;
        self->_dialogViewController = v17;

        id v19 = objc_loadWeakRetained((id *)&self->_viewControllerPresenter);
        objc_msgSend(v19, "dialogController:presentViewController:withAdditionalAnimations:", self, self->_dialogViewController, v10, v22, v23, v24, v25);

        objc_destroyWeak(&v26);
      }
      else if (!v13)
      {
        v14 = (SFDialogView *)[v9 newDialogViewRepresentation];
        dialogView = self->_dialogView;
        self->_dialogView = v14;

        [(SFDialogView *)self->_dialogView setDelegate:self];
        id v16 = objc_loadWeakRetained((id *)&self->_dialogPresenter);
        [v16 presentDialogView:self->_dialogView withAdditionalAnimations:v10 forDialogController:self];
      }
    }
    int64_t v20 = 0;
    goto LABEL_14;
  }
  int64_t v20 = 1;
LABEL_14:

  objc_destroyWeak(&location);
  return v20;
}

void __78__SFDialogController__presentDialog_forWebProcessID_withAdditionalAnimations___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _dismissCurrentDialogWithResponse:v3];
}

- (void)_dismissDialogWithAdditionalAnimations:(id)a3
{
  id v4 = a3;
  if ([(SFDialogController *)self _isPresentingDialog])
  {
    uint64_t v5 = self->_presentedDialog;
    presentedDialog = self->_presentedDialog;
    self->_presentedDialog = 0;

    uint64_t v7 = self->_dialogView;
    dialogView = self->_dialogView;
    self->_dialogView = 0;

    id v9 = self->_dialogViewController;
    dialogViewController = self->_dialogViewController;
    self->_dialogViewController = 0;

    self->_webProcessID = 0;
    if (v7)
    {
      [(SFDialogView *)v7 setDelegate:0];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_dialogPresenter);
      [WeakRetained dismissDialogView:v7 withAdditionalAnimations:v4 forDialogController:self];
    }
    if (v9)
    {
      uint64_t v12 = [(UIViewController *)v9 presentingViewController];

      if (!v12)
      {
        uint64_t v13 = WBS_LOG_CHANNEL_PREFIXTabDialogs();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          -[SFDialogController _dismissDialogWithAdditionalAnimations:](v13);
        }
      }
      id v14 = objc_loadWeakRetained((id *)&self->_viewControllerPresenter);
      [v14 dialogController:self dismissViewController:v9 withAdditionalAnimations:v4];
    }
    id v15 = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      [v15 dialogController:self didDismissDialog:v5];
    }
  }
}

- (void)_dismissCurrentDialogWithResponse:(id)a3
{
  dialogManager = self->_dialogManager;
  id v5 = a3;
  [(WBSTabDialogManager *)dialogManager dismissCurrentDialogForTabID:[(SFDialogController *)self _tabID] withResponse:v5];
}

- (void)dialogView:(id)a3 didSelectActionAtIndex:(unint64_t)a4 withInputText:(id)a5 passwordText:(id)a6
{
  id v13 = a5;
  id v9 = a6;
  id v10 = (void *)MEMORY[0x1E4F1CA60];
  int v11 = [NSNumber numberWithUnsignedInteger:a4];
  uint64_t v12 = [v10 dictionaryWithObject:v11 forKey:@"selectedActionIndex"];

  if (v13) {
    [v12 setObject:v13 forKeyedSubscript:@"text"];
  }
  if (v9) {
    [v12 setObject:v9 forKeyedSubscript:@"password"];
  }
  [(SFDialogController *)self _dismissCurrentDialogWithResponse:v12];
}

- (SFDialogControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SFDialogControllerDelegate *)WeakRetained;
}

- (SFDialogViewPresenting)dialogPresenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dialogPresenter);

  return (SFDialogViewPresenting *)WeakRetained;
}

- (SFDialogViewControllerPresenting)viewControllerPresenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewControllerPresenter);

  return (SFDialogViewControllerPresenting *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentedDialog, 0);
  objc_destroyWeak((id *)&self->_viewControllerPresenter);
  objc_destroyWeak((id *)&self->_dialogPresenter);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dialogViewController, 0);
  objc_storeStrong((id *)&self->_dialogView, 0);

  objc_storeStrong((id *)&self->_dialogManager, 0);
}

- (void)_dismissDialogWithAdditionalAnimations:(void *)a1 .cold.1(void *a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v1 = a1;
  int v2 = 138543618;
  uint64_t v3 = objc_opt_class();
  __int16 v4 = 2114;
  uint64_t v5 = objc_opt_class();
  _os_log_error_impl(&dword_18C354000, v1, OS_LOG_TYPE_ERROR, "Dialog %{public}@'s view controller %{public}@ was dismissed out of band of the SFDialogController", (uint8_t *)&v2, 0x16u);
}

@end