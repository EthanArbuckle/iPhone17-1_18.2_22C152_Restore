@interface SHSheetRouter
- (BOOL)activityPerformer:(id)a3 presentPopoverContentViewController:(id)a4;
- (BOOL)activityPerformerCanPresent:(id)a3;
- (BOOL)isPresentedWithinPopover;
- (BOOL)listenForDismissalTransition;
- (BOOL)presentationBlockingViewShouldPresentCloseButton;
- (BOOL)supportsModalPresentations;
- (SHSheetContentView)mainViewController;
- (SHSheetContentView)secondaryViewController;
- (SHSheetRouter)initWithRootViewController:(id)a3 mainNavigationController:(id)a4 supportsModalPresentations:(BOOL)a5;
- (SHSheetRouter)initWithRootViewController:(id)a3 supportsModalPresentations:(BOOL)a4;
- (UINavigationController)mainNavigationController;
- (UINavigationController)secondaryNavigationController;
- (UINavigationController)userDefaultsNavigationController;
- (UIViewController)collaborationParticipantsViewController;
- (UIViewController)currentViewControllerForActivityBeingListened;
- (UIViewController)optionsViewController;
- (UIViewController)presentationBlockingViewController;
- (UIViewController)presentationViewController;
- (UIViewController)rootViewController;
- (id)collaborationParticipantsDismissalHandler;
- (id)listenerCompletionHandler;
- (id)optionsViewControllerDismissalHandler;
- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5;
- (void)_configureAirdropViewController:(id)a3;
- (void)_configureMainViewController:(id)a3;
- (void)_didDismissCollaborationParticipantsViewController;
- (void)_didDismissOptionsViewController;
- (void)_dismissOptionsViewController;
- (void)_installChildViewController:(id)a3 forParentViewController:(id)a4;
- (void)_presentViewController:(id)a3;
- (void)_presentationControllerDismissalTransitionDidEndNotification:(id)a3;
- (void)activityPerformCleanUpPresentation:(id)a3;
- (void)activityPerformer:(id)a3 preparePresentationWithContext:(id)a4 completion:(id)a5;
- (void)activityPerformer:(id)a3 presentViewController:(id)a4 completion:(id)a5;
- (void)activityPerformer:(id)a3 startListeningForDismissalTransitionWithCompletion:(id)a4;
- (void)activityPerformerStopListeningForDismissalTransition:(id)a3;
- (void)dismissCollaborationParticipantsViewController;
- (void)dismissForActivityPerformerResult:(id)a3 didPresentFromShareSheet:(BOOL)a4 completionHandler:(id)a5;
- (void)dismissPresentationBlockingViewControllerIfNeeded;
- (void)dismissSecondaryViewControllerAnimated:(BOOL)a3;
- (void)dismissUserDefaultsViewControllerAnimated:(BOOL)a3;
- (void)handlePresentationBlockingViewControllerClose;
- (void)installAirdropViewController:(id)a3;
- (void)layoutPresentationBlockingViewController;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
- (void)presentAirdropViewController:(id)a3;
- (void)presentAlertController:(id)a3;
- (void)presentCollaborationParticipantsViewController:(id)a3 dismissalHandler:(id)a4;
- (void)presentMainViewController:(id)a3 withNavigationControllerSupport:(BOOL)a4;
- (void)presentOptionsViewController:(id)a3 dismissalHandler:(id)a4;
- (void)presentPresentationBlockingViewController;
- (void)presentSecondaryViewController:(id)a3;
- (void)presentUserDefaultsViewController:(id)a3;
- (void)setActivityPresentationController:(id)a3;
- (void)setCollaborationParticipantsDismissalHandler:(id)a3;
- (void)setCollaborationParticipantsViewController:(id)a3;
- (void)setCurrentViewControllerForActivityBeingListened:(id)a3;
- (void)setListenForDismissalTransition:(BOOL)a3;
- (void)setListenerCompletionHandler:(id)a3;
- (void)setMainNavigationController:(id)a3;
- (void)setMainViewController:(id)a3;
- (void)setOptionsViewController:(id)a3;
- (void)setOptionsViewControllerDismissalHandler:(id)a3;
- (void)setPresentationBlockingViewController:(id)a3;
- (void)setPresentationViewController:(id)a3;
- (void)setSecondaryNavigationController:(id)a3;
- (void)setSecondaryViewController:(id)a3;
- (void)setUserDefaultsNavigationController:(id)a3;
@end

@implementation SHSheetRouter

- (SHSheetRouter)initWithRootViewController:(id)a3 mainNavigationController:(id)a4 supportsModalPresentations:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SHSheetRouter;
  v10 = [(SHSheetRouter *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_rootViewController, v8);
    v11->_supportsModalPresentations = a5;
    [v9 setDelegate:v11];
    objc_storeStrong((id *)&v11->_mainNavigationController, a4);
  }

  return v11;
}

- (SHSheetRouter)initWithRootViewController:(id)a3 supportsModalPresentations:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v8 = [v7 userInterfaceIdiom];

  id v9 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithNavigationBarClass:objc_opt_class() toolbarClass:0];
  if ((dyld_program_sdk_at_least() & 1) == 0 && v8 != 1) {
    [v9 _setPreferredNavigationBarPosition:2];
  }
  v10 = [(SHSheetRouter *)self initWithRootViewController:v6 mainNavigationController:v9 supportsModalPresentations:v4];

  return v10;
}

- (BOOL)isPresentedWithinPopover
{
  v2 = [(SHSheetRouter *)self rootViewController];
  BOOL IsPresentedInPopover = SHSheetIsPresentedInPopover(v2);

  return IsPresentedInPopover;
}

- (void)presentMainViewController:(id)a3 withNavigationControllerSupport:(BOOL)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(SHSheetRouter *)self setMainViewController:v6];
  v7 = share_sheet_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [(SHSheetRouter *)self rootViewController];
    int v13 = 138412546;
    id v14 = v6;
    __int16 v15 = 2112;
    v16 = v8;
    _os_log_impl(&dword_1A0AD8000, v7, OS_LOG_TYPE_DEFAULT, "Install main view:%@ parentViewController:%@", (uint8_t *)&v13, 0x16u);
  }
  id v9 = [(SHSheetRouter *)self mainNavigationController];
  [v9 pushViewController:v6 animated:0];

  if (a4)
  {
    id v10 = [(SHSheetRouter *)self mainNavigationController];
  }
  else
  {
    id v10 = v6;
  }
  v11 = v10;
  v12 = [(SHSheetRouter *)self rootViewController];
  [(SHSheetRouter *)self _installChildViewController:v11 forParentViewController:v12];

  [(SHSheetRouter *)self _configureMainViewController:v11];
}

- (void)presentSecondaryViewController:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(SHSheetRouter *)self setSecondaryViewController:v4];
  v5 = share_sheet_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(SHSheetRouter *)self rootViewController];
    int v10 = 138412546;
    id v11 = v4;
    __int16 v12 = 2112;
    int v13 = v6;
    _os_log_impl(&dword_1A0AD8000, v5, OS_LOG_TYPE_DEFAULT, "Present secondary view:%@ parentViewController:%@", (uint8_t *)&v10, 0x16u);
  }
  v7 = [[_UIActivityNavigationController alloc] initWithRootViewController:v4];
  [(_UIActivityNavigationController *)v7 setDelegate:self];
  [(_UIActivityNavigationController *)v7 setTransitioningDelegate:self];
  [(_UIActivityNavigationController *)v7 setModalPresentationStyle:4];
  [(_UIActivityNavigationController *)v7 setPreferredContentSize:_ShareSheetDefaultSheetSize()];
  uint64_t v8 = [(_UIActivityNavigationController *)v7 navigationBar];
  [v8 setRequestedContentSize:3];

  [(SHSheetRouter *)self setSecondaryNavigationController:v7];
  id v9 = [(SHSheetRouter *)self rootViewController];
  [v9 presentViewController:v7 animated:1 completion:0];
}

- (void)presentUserDefaultsViewController:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = share_sheet_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v4;
    _os_log_impl(&dword_1A0AD8000, v5, OS_LOG_TYPE_DEFAULT, "Present user defaults view controller:%@", (uint8_t *)&v12, 0xCu);
  }

  if ([(SHSheetRouter *)self supportsModalPresentations])
  {
    id v6 = [[_UIActivityNavigationController alloc] initWithRootViewController:v4];
    [(_UIActivityNavigationController *)v6 setDelegate:self];
    [(_UIActivityNavigationController *)v6 setModalPresentationStyle:2];
    [(SHSheetRouter *)self setUserDefaultsNavigationController:v6];
    v7 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v8 = [v7 userInterfaceIdiom];

    if (v8 == 1) {
      [(_UIActivityNavigationController *)v6 setPreferredContentSize:_ShareSheetFormSheetSize()];
    }
    [(SHSheetRouter *)self _presentViewController:v6];
  }
  else
  {
    id v9 = [(SHSheetRouter *)self secondaryNavigationController];
    int v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      id v11 = [(SHSheetRouter *)self mainNavigationController];
    }
    id v6 = v11;

    [(_UIActivityNavigationController *)v6 pushViewController:v4 animated:1];
    [(SHSheetRouter *)self setUserDefaultsNavigationController:v6];
  }
}

- (void)presentPresentationBlockingViewController
{
  v3 = [(SHSheetRouter *)self presentationBlockingViewController];

  if (!v3)
  {
    v5 = objc_alloc_init(SHSheetPresentationBlockingViewController);
    [(SHSheetPresentationBlockingViewController *)v5 setDelegate:self];
    [(SHSheetRouter *)self setPresentationBlockingViewController:v5];
    id v4 = [(SHSheetRouter *)self rootViewController];
    [v4 presentViewController:v5 animated:0 completion:0];
  }
}

- (void)dismissPresentationBlockingViewControllerIfNeeded
{
  v3 = [(SHSheetRouter *)self presentationBlockingViewController];

  if (v3)
  {
    id v4 = [(SHSheetRouter *)self presentationBlockingViewController];
    [v4 dismissViewControllerAnimated:0 completion:0];

    [(SHSheetRouter *)self setPresentationBlockingViewController:0];
  }
}

- (void)_presentViewController:(id)a3
{
  id v4 = a3;
  if ([(SHSheetRouter *)self supportsModalPresentations])
  {
    v5 = [(SHSheetRouter *)self secondaryNavigationController];
    id v6 = [(SHSheetRouter *)self mainViewController];
    v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v8 = [(SHSheetRouter *)self rootViewController];
    }
    int v10 = v8;
  }
  else
  {
    id v9 = [(SHSheetRouter *)self rootViewController];
    int v10 = [v9 presentingViewController];

    v5 = [(SHSheetRouter *)self rootViewController];
  }
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  uint64_t v17 = __40__SHSheetRouter__presentViewController___block_invoke;
  v18 = &unk_1E5A215A0;
  id v19 = v10;
  id v20 = v4;
  id v11 = v4;
  id v12 = v10;
  uint64_t v13 = MEMORY[0x1A6229A90](&v15);
  uint64_t v14 = (void *)v13;
  if (v5) {
    objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, v13, v15, v16, v17, v18, v19, v20);
  }
  else {
    (*(void (**)(uint64_t))(v13 + 16))(v13);
  }
}

uint64_t __40__SHSheetRouter__presentViewController___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
}

- (void)presentAirdropViewController:(id)a3
{
  id v4 = a3;
  [(SHSheetRouter *)self _configureAirdropViewController:v4];
  [(SHSheetRouter *)self _presentViewController:v4];
}

- (void)installAirdropViewController:(id)a3
{
  id v5 = a3;
  [(SHSheetRouter *)self _configureAirdropViewController:v5];
  id v4 = [(SHSheetRouter *)self rootViewController];
  [(SHSheetRouter *)self _installChildViewController:v5 forParentViewController:v4];

  [(SHSheetRouter *)self _configureMainViewController:v5];
}

- (void)presentAlertController:(id)a3
{
  id v12 = a3;
  id v4 = [(SHSheetRouter *)self userDefaultsNavigationController];
  id v5 = [v4 topViewController];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [(SHSheetRouter *)self rootViewController];
  }
  id v8 = v7;

  id v9 = [v8 presentedViewController];
  getSFAirDropViewControllerClass();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v11 = [v8 presentedViewController];

    id v8 = (void *)v11;
  }
  [v8 presentViewController:v12 animated:1 completion:0];
}

- (void)presentOptionsViewController:(id)a3 dismissalHandler:(id)a4
{
  id v23 = a3;
  id v6 = a4;
  [(SHSheetRouter *)self setOptionsViewController:v23];
  [(SHSheetRouter *)self setOptionsViewControllerDismissalHandler:v6];

  id v7 = [(SHSheetRouter *)self rootViewController];
  id v8 = [v7 traitCollection];
  uint64_t v9 = [v8 userInterfaceIdiom];

  if (v9 == 6 || [(SHSheetRouter *)self isPresentedWithinPopover])
  {
    int v10 = [(SHSheetRouter *)self mainNavigationController];
    uint64_t v11 = [v10 _window];

    if (v11)
    {
      id v12 = [(SHSheetRouter *)self mainNavigationController];
LABEL_7:
      uint64_t v14 = v12;
      [(_UIActivityNavigationController *)v12 pushViewController:v23 animated:1];
      goto LABEL_8;
    }
  }
  uint64_t v13 = [(SHSheetRouter *)self secondaryNavigationController];

  if (v13)
  {
    id v12 = [(SHSheetRouter *)self secondaryNavigationController];
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v14 = (_UIActivityNavigationController *)v23;
  }
  else
  {
    uint64_t v14 = [[_UIActivityNavigationController alloc] initWithRootViewController:v23];
    [(_UIActivityNavigationController *)v14 setDelegate:self];
    [(_UIActivityNavigationController *)v14 setModalPresentationStyle:2];
    uint64_t v15 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v16 = [v15 userInterfaceIdiom];

    if (v16 == 1) {
      [(_UIActivityNavigationController *)v14 setPreferredContentSize:_ShareSheetFormSheetSize()];
    }
  }
  id v17 = objc_alloc(MEMORY[0x1E4FB14A8]);
  v18 = _ShareSheetBundle();
  id v19 = [v18 localizedStringForKey:@"Done" value:@"Done" table:@"Localizable"];
  id v20 = (void *)[v17 initWithTitle:v19 style:2 target:self action:sel__dismissOptionsViewController];

  v21 = [v23 navigationItem];
  [v21 setRightBarButtonItem:v20];

  v22 = [(SHSheetRouter *)self mainViewController];
  [v22 presentViewController:v14 animated:1 completion:0];

LABEL_8:
}

- (void)_dismissOptionsViewController
{
  id location = 0;
  objc_initWeak(&location, self);
  v3 = [(SHSheetRouter *)self mainViewController];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__SHSheetRouter__dismissOptionsViewController__block_invoke;
  v4[3] = &unk_1E5A21998;
  objc_copyWeak(&v5, &location);
  [v3 dismissViewControllerAnimated:1 completion:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __46__SHSheetRouter__dismissOptionsViewController__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _didDismissOptionsViewController];
}

- (void)_didDismissOptionsViewController
{
  [(SHSheetRouter *)self setOptionsViewController:0];
  v3 = [(SHSheetRouter *)self optionsViewControllerDismissalHandler];
  if (v3)
  {
    [(SHSheetRouter *)self setOptionsViewControllerDismissalHandler:0];
    v3[2]();
  }
}

- (void)presentCollaborationParticipantsViewController:(id)a3 dismissalHandler:(id)a4
{
  id v20 = a3;
  id v6 = a4;
  [(SHSheetRouter *)self setCollaborationParticipantsViewController:v20];
  [(SHSheetRouter *)self setCollaborationParticipantsDismissalHandler:v6];

  id v7 = [(SHSheetRouter *)self rootViewController];
  id v8 = [v7 traitCollection];
  uint64_t v9 = [v8 userInterfaceIdiom];

  if (v9 == 6 || [(SHSheetRouter *)self isPresentedWithinPopover])
  {
    int v10 = [(SHSheetRouter *)self mainNavigationController];
    uint64_t v11 = [v10 _window];

    if (v11)
    {
      id v12 = [(SHSheetRouter *)self mainNavigationController];
LABEL_7:
      uint64_t v14 = v12;
      [(_UIActivityNavigationController *)v12 pushViewController:v20 animated:1];
      goto LABEL_8;
    }
  }
  uint64_t v13 = [(SHSheetRouter *)self secondaryNavigationController];

  if (v13)
  {
    id v12 = [(SHSheetRouter *)self secondaryNavigationController];
    goto LABEL_7;
  }
  uint64_t v14 = [[_UIActivityNavigationController alloc] initWithRootViewController:v20];
  [(_UIActivityNavigationController *)v14 setDelegate:self];
  [(_UIActivityNavigationController *)v14 setModalPresentationStyle:2];
  uint64_t v15 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v16 = [v15 userInterfaceIdiom];

  if (v16 == 1) {
    [(_UIActivityNavigationController *)v14 setPreferredContentSize:_ShareSheetFormSheetSize()];
  }
  id v17 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel_dismissCollaborationParticipantsViewController];
  v18 = [v20 navigationItem];
  [v18 setRightBarButtonItem:v17];

  id v19 = [(SHSheetRouter *)self mainViewController];
  [v19 presentViewController:v14 animated:1 completion:0];

LABEL_8:
}

- (void)dismissCollaborationParticipantsViewController
{
  id location = 0;
  objc_initWeak(&location, self);
  v3 = [(SHSheetRouter *)self mainViewController];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63__SHSheetRouter_dismissCollaborationParticipantsViewController__block_invoke;
  v4[3] = &unk_1E5A21998;
  objc_copyWeak(&v5, &location);
  [v3 dismissViewControllerAnimated:1 completion:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __63__SHSheetRouter_dismissCollaborationParticipantsViewController__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _didDismissCollaborationParticipantsViewController];
}

- (void)_didDismissCollaborationParticipantsViewController
{
  [(SHSheetRouter *)self setCollaborationParticipantsViewController:0];
  v3 = [(SHSheetRouter *)self collaborationParticipantsDismissalHandler];
  if (v3)
  {
    [(SHSheetRouter *)self setCollaborationParticipantsDismissalHandler:0];
    v3[2]();
  }
}

- (void)dismissSecondaryViewControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = [(SHSheetRouter *)self secondaryNavigationController];

  if (v5)
  {
    id v6 = share_sheet_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [(SHSheetRouter *)self secondaryNavigationController];
      int v9 = 138412290;
      int v10 = v7;
      _os_log_impl(&dword_1A0AD8000, v6, OS_LOG_TYPE_DEFAULT, "Dismiss secondary navigation controller:%@", (uint8_t *)&v9, 0xCu);
    }
    id v8 = [(SHSheetRouter *)self secondaryNavigationController];
    [v8 dismissViewControllerAnimated:v3 completion:0];
  }
}

- (void)dismissUserDefaultsViewControllerAnimated:(BOOL)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = [(SHSheetRouter *)self userDefaultsNavigationController];

  if (v4)
  {
    id v5 = share_sheet_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [(SHSheetRouter *)self userDefaultsNavigationController];
      int v8 = 138412290;
      int v9 = v6;
      _os_log_impl(&dword_1A0AD8000, v5, OS_LOG_TYPE_DEFAULT, "Dismiss user defaults navigation controller:%@", (uint8_t *)&v8, 0xCu);
    }
    id v7 = [(SHSheetRouter *)self userDefaultsNavigationController];
    [v7 dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)dismissForActivityPerformerResult:(id)a3 didPresentFromShareSheet:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = [v9 activity];
  uint64_t v11 = [v10 activityViewController];
  uint64_t v12 = [v9 completedState];

  if (v12 != 5)
  {
    v18 = [v10 _embeddedActivityViewController];

    if (!v10 || v18)
    {
      id v19 = [(SHSheetRouter *)self rootViewController];
      id v20 = [v19 traitCollection];
      uint64_t v21 = [v20 userInterfaceIdiom];

      if (v21 == 6)
      {
        v22 = [v10 activityViewController];
        id v23 = [v22 presentingViewController];
        v24 = v23;
        if (v23)
        {
          id v25 = v23;
        }
        else
        {
          id v25 = [(SHSheetRouter *)self rootViewController];
        }
        id v17 = v25;

        uint64_t v11 = v22;
        goto LABEL_26;
      }
      uint64_t v26 = [(SHSheetRouter *)self rootViewController];
      goto LABEL_23;
    }
    if (([v10 _managesOwnPresentation] & 1) == 0) {
      goto LABEL_28;
    }
LABEL_13:
    id v17 = 0;
LABEL_26:

    goto LABEL_27;
  }
  if (!v5) {
    goto LABEL_13;
  }
  uint64_t v13 = [v11 presentingViewController];

  if (!v13)
  {
    uint64_t v14 = [(SHSheetRouter *)self rootViewController];

    uint64_t v11 = (void *)v14;
  }
  if (([v11 isBeingDismissed] & 1) != 0
    || ([v11 presentingViewController],
        uint64_t v15 = objc_claimAutoreleasedReturnValue(),
        v15,
        !v15))
  {

    uint64_t v11 = 0;
  }
  uint64_t v16 = [v11 presentingViewController];

  if (v16)
  {
    id v17 = [v11 presentingViewController];
  }
  else
  {
    id v17 = v11;
  }
  uint64_t v27 = [(SHSheetRouter *)self rootViewController];
  if (v17 != (void *)v27)
  {
    uint64_t v11 = (void *)v27;
    goto LABEL_26;
  }
  v28 = [v17 presentingViewController];

  if (v28)
  {
    uint64_t v26 = [v17 presentingViewController];
    uint64_t v11 = v17;
LABEL_23:
    id v17 = (void *)v26;
    goto LABEL_26;
  }
LABEL_27:
  uint64_t v11 = v17;
LABEL_28:
  v29 = share_sheet_log();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v58 = v11;
    _os_log_impl(&dword_1A0AD8000, v29, OS_LOG_TYPE_DEFAULT, "View controller to dismiss from:%@", buf, 0xCu);
  }

  uint64_t v30 = [v11 presentedViewController];
  v31 = (void *)v30;
  if (v30) {
    v32 = (void *)v30;
  }
  else {
    v32 = v11;
  }
  id v33 = v32;

  v34 = share_sheet_log();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v58 = v33;
    _os_log_impl(&dword_1A0AD8000, v34, OS_LOG_TYPE_DEFAULT, "View controller to dismiss:%@", buf, 0xCu);
  }

  if (v33)
  {
    v35 = [v33 _window];
    if (v35) {
      uint64_t v36 = [v33 isBeingDismissed] ^ 1;
    }
    else {
      uint64_t v36 = 0;
    }
  }
  else
  {
    uint64_t v36 = 1;
  }
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __94__SHSheetRouter_dismissForActivityPerformerResult_didPresentFromShareSheet_completionHandler___block_invoke;
  v54[3] = &unk_1E5A23820;
  BOOL v56 = v5;
  v54[4] = self;
  id v37 = v8;
  id v55 = v37;
  char v38 = [v10 _dismissActivityFromViewController:v11 animated:v36 completion:v54];
  v39 = share_sheet_log();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    v40 = NSStringFromBOOL();
    *(_DWORD *)buf = 138412290;
    id v58 = v40;
    _os_log_impl(&dword_1A0AD8000, v39, OS_LOG_TYPE_DEFAULT, "Use custom presentation:%@", buf, 0xCu);
  }
  if ((v38 & 1) == 0)
  {
    if (v11) {
      int v41 = v36;
    }
    else {
      int v41 = 0;
    }
    if (v41 == 1)
    {
      v42 = share_sheet_log();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v58 = v33;
        _os_log_impl(&dword_1A0AD8000, v42, OS_LOG_TYPE_DEFAULT, "Dismiss view controller manually:%@", buf, 0xCu);
      }

      v52[0] = MEMORY[0x1E4F143A8];
      v52[1] = 3221225472;
      v52[2] = __94__SHSheetRouter_dismissForActivityPerformerResult_didPresentFromShareSheet_completionHandler___block_invoke_15;
      v52[3] = &unk_1E5A22578;
      v52[4] = self;
      id v53 = v37;
      [v11 dismissViewControllerAnimated:1 completion:v52];
    }
    else
    {
      if (v5)
      {
        v43 = [(SHSheetRouter *)self rootViewController];
        v44 = [v43 _window];
        if (v44)
        {
          v45 = [(SHSheetRouter *)self rootViewController];
          if ([v45 isBeingDismissed])
          {
            BOOL v46 = 1;
          }
          else
          {
            v47 = [(SHSheetRouter *)self rootViewController];
            v48 = [v47 presentingViewController];
            BOOL v46 = v48 == 0;
          }
        }
        else
        {
          BOOL v46 = 1;
        }
      }
      else
      {
        BOOL v46 = 1;
      }
      v49 = share_sheet_log();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        v50 = [(SHSheetRouter *)self rootViewController];
        v51 = NSStringFromBOOL();
        *(_DWORD *)buf = 138412546;
        id v58 = v50;
        __int16 v59 = 2112;
        v60 = v51;
        _os_log_impl(&dword_1A0AD8000, v49, OS_LOG_TYPE_DEFAULT, "didDismissRootViewController:%@ = %@", buf, 0x16u);
      }
      (*((void (**)(id, BOOL))v37 + 2))(v37, v46);
    }
  }
}

uint64_t __94__SHSheetRouter_dismissForActivityPerformerResult_didPresentFromShareSheet_completionHandler___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    v2 = [*(id *)(a1 + 32) rootViewController];
    BOOL v3 = [v2 _window];
    if (v3)
    {
      id v4 = [*(id *)(a1 + 32) rootViewController];
      [v4 presentingViewController];
    }
  }
  BOOL v5 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v5();
}

uint64_t __94__SHSheetRouter_dismissForActivityPerformerResult_didPresentFromShareSheet_completionHandler___block_invoke_15(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) rootViewController];
  BOOL v3 = [v2 _window];
  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) rootViewController];
    [v4 presentingViewController];
  }
  BOOL v5 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v5();
}

- (void)_configureMainViewController:(id)a3
{
  v26[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [v4 view];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v6 = [(SHSheetRouter *)self rootViewController];
  id v7 = [v6 view];

  v18 = (void *)MEMORY[0x1E4F28DC8];
  id v25 = [v4 view];
  v24 = [v25 leadingAnchor];
  id v23 = [v7 leadingAnchor];
  v22 = [v24 constraintEqualToAnchor:v23];
  v26[0] = v22;
  uint64_t v21 = [v4 view];
  id v20 = [v21 trailingAnchor];
  id v19 = [v7 trailingAnchor];
  id v17 = [v20 constraintEqualToAnchor:v19];
  v26[1] = v17;
  id v8 = [v4 view];
  id v9 = [v8 topAnchor];
  uint64_t v10 = [v7 topAnchor];
  uint64_t v11 = [v9 constraintEqualToAnchor:v10];
  v26[2] = v11;
  uint64_t v12 = [v4 view];

  uint64_t v13 = [v12 bottomAnchor];
  uint64_t v14 = [v7 bottomAnchor];
  uint64_t v15 = [v13 constraintEqualToAnchor:v14];
  v26[3] = v15;
  uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:4];
  [v18 activateConstraints:v16];
}

- (void)_configureAirdropViewController:(id)a3
{
  id v3 = a3;
  [v3 setModalPresentationStyle:2];
  if (_ShareSheetPlatformPrefersPopover()) {
    [v3 setPreferredContentSize:_ShareSheetFormSheetSize()];
  }
}

- (void)_installChildViewController:(id)a3 forParentViewController:(id)a4
{
  id v5 = a4;
  id v8 = a3;
  [v8 willMoveToParentViewController:v5];
  [v5 addChildViewController:v8];
  id v6 = [v5 view];
  id v7 = [v8 view];
  [v6 addSubview:v7];

  [v8 didMoveToParentViewController:v5];
}

- (BOOL)activityPerformerCanPresent:(id)a3
{
  id v4 = [(SHSheetRouter *)self rootViewController];
  id v5 = [v4 parentModalViewController];
  if (v5)
  {
    BOOL v6 = 1;
  }
  else
  {
    id v7 = [(SHSheetRouter *)self rootViewController];
    id v8 = [v7 parentViewController];
    if (v8) {
      BOOL v6 = 1;
    }
    else {
      BOOL v6 = [(SHSheetRouter *)self isPresentedWithinPopover];
    }
  }
  return v6;
}

- (BOOL)activityPerformer:(id)a3 presentPopoverContentViewController:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SHSheetRouter *)self rootViewController];
  id v9 = [v8 _popoverController];

  if (!v9
    || ([v9 contentViewController],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        [(SHSheetRouter *)self rootViewController],
        uint64_t v11 = objc_claimAutoreleasedReturnValue(),
        v11,
        v10,
        v10 == v11))
  {
    uint64_t v13 = share_sheet_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 138412290;
      id v22 = v7;
      _os_log_impl(&dword_1A0AD8000, v13, OS_LOG_TYPE_DEFAULT, "Present popover content view controller:%@", (uint8_t *)&v21, 0xCu);
    }

    if (v9)
    {
      BOOL v12 = 1;
      [v9 setContentViewController:v7 animated:1];
    }
    else
    {
      if ([(SHSheetRouter *)self isPresentedWithinPopover])
      {
        uint64_t v14 = [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
        uint64_t v15 = [v7 view];
        [v15 setBackgroundColor:v14];

        [v7 setModalPresentationStyle:6];
        [v7 setModalTransitionStyle:2];
        uint64_t v16 = [(SHSheetRouter *)self rootViewController];
        id v17 = v16;
        BOOL v12 = 1;
      }
      else
      {
        [v7 setModalPresentationStyle:2];
        v18 = [v7 view];
        BOOL v12 = 1;
        [v18 setTintAdjustmentMode:1];

        id v19 = [v6 activity];
        [v19 _willPresentAsFormSheet];

        uint64_t v16 = [(SHSheetRouter *)self rootViewController];
        id v17 = v16;
      }
      [v16 presentViewController:v7 animated:1 completion:0];
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (void)activityPerformer:(id)a3 preparePresentationWithContext:(id)a4 completion:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  id v9 = [(SHSheetRouter *)self rootViewController];
  uint64_t v10 = [v9 presentingViewController];
  uint64_t v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    uint64_t v13 = [MEMORY[0x1E4FB1F48] keyWindow];
    id v12 = [v13 rootViewController];
  }
  if ([v7 shouldPresentOverCurrentContext]
    && ![v7 isCloudSharing])
  {
    id v14 = [(SHSheetRouter *)self mainViewController];
  }
  else
  {
    id v14 = v12;
  }
  uint64_t v15 = v14;
  uint64_t v16 = share_sheet_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v35 = v7;
    __int16 v36 = 2112;
    id v37 = v15;
    _os_log_impl(&dword_1A0AD8000, v16, OS_LOG_TYPE_DEFAULT, "Prepare presentation with context:%@ presentationViewController:%@", buf, 0x16u);
  }

  if ([v7 shouldDismissBeforePresentation])
  {
    id v17 = [(SHSheetRouter *)self rootViewController];
    if ([v7 shouldPresentOverCurrentContext])
    {

      uint64_t v18 = [(SHSheetRouter *)self rootViewController];

      id v17 = 0;
      id v12 = (id)v18;
    }
    uint64_t v19 = [(SHSheetRouter *)self secondaryNavigationController];
    id v20 = (void *)v19;
    if (v19) {
      int v21 = (void *)v19;
    }
    else {
      int v21 = v17;
    }
    id v22 = v21;
  }
  else
  {
    id v22 = 0;
  }
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __77__SHSheetRouter_activityPerformer_preparePresentationWithContext_completion___block_invoke;
  v31[3] = &unk_1E5A21D20;
  v31[4] = self;
  id v23 = v15;
  id v32 = v23;
  id v24 = v8;
  id v33 = v24;
  uint64_t v25 = MEMORY[0x1A6229A90](v31);
  uint64_t v26 = (void *)v25;
  if (v22)
  {
    uint64_t v27 = share_sheet_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v35 = v22;
      _os_log_impl(&dword_1A0AD8000, v27, OS_LOG_TYPE_DEFAULT, "Dismiss view controller before presentation:%@", buf, 0xCu);
    }

    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __77__SHSheetRouter_activityPerformer_preparePresentationWithContext_completion___block_invoke_20;
    v28[3] = &unk_1E5A21D20;
    v28[4] = self;
    id v29 = v12;
    id v30 = v26;
    [v22 dismissViewControllerAnimated:1 completion:v28];
  }
  else
  {
    (*(void (**)(uint64_t))(v25 + 16))(v25);
  }
}

uint64_t __77__SHSheetRouter_activityPerformer_preparePresentationWithContext_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setPresentationViewController:*(void *)(a1 + 40)];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v2();
}

void __77__SHSheetRouter_activityPerformer_preparePresentationWithContext_completion___block_invoke_20(id *a1)
{
  v2 = [a1[4] rootViewController];
  id v3 = [v2 presentingViewController];
  id v4 = v3;
  if (v3 != a1[5])
  {

LABEL_7:
    id v8 = (void (*)(void))*((void *)a1[6] + 2);
    v8();
    return;
  }
  int v5 = [a1[4] isPresentedWithinPopover];

  if (!v5) {
    goto LABEL_7;
  }
  id v6 = share_sheet_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A0AD8000, v6, OS_LOG_TYPE_DEFAULT, "Dismiss activity view controller before presentation", buf, 2u);
  }

  id v7 = [a1[4] rootViewController];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __77__SHSheetRouter_activityPerformer_preparePresentationWithContext_completion___block_invoke_21;
  v9[3] = &unk_1E5A21760;
  id v10 = a1[6];
  [v7 dismissViewControllerAnimated:0 completion:v9];
}

uint64_t __77__SHSheetRouter_activityPerformer_preparePresentationWithContext_completion___block_invoke_21(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)activityPerformer:(id)a3 presentViewController:(id)a4 completion:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  id v9 = [(SHSheetRouter *)self rootViewController];
  id v10 = share_sheet_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v38 = 138412290;
    id v39 = v7;
    _os_log_impl(&dword_1A0AD8000, v10, OS_LOG_TYPE_DEFAULT, "Present view controller for activity:%@", (uint8_t *)&v38, 0xCu);
  }

  uint64_t v11 = [v9 popoverPresentationController];
  if (v11)
  {
    id v12 = (void *)v11;
    uint64_t v13 = [v7 popoverPresentationController];

    if (v13)
    {
      id v14 = [v9 popoverPresentationController];
      uint64_t v15 = [v14 barButtonItem];
      uint64_t v16 = [v7 popoverPresentationController];
      [v16 setBarButtonItem:v15];

      id v17 = [v9 popoverPresentationController];
      [v17 sourceRect];
      double v19 = v18;
      double v21 = v20;
      double v23 = v22;
      double v25 = v24;
      uint64_t v26 = [v7 popoverPresentationController];
      objc_msgSend(v26, "setSourceRect:", v19, v21, v23, v25);

      uint64_t v27 = [v9 popoverPresentationController];
      v28 = [v27 sourceView];
      id v29 = [v7 popoverPresentationController];
      [v29 setSourceView:v28];
    }
  }
  id v30 = [v7 view];
  [v30 setTintAdjustmentMode:1];

  v31 = [MEMORY[0x1E4F28B50] mainBundle];
  id v32 = [v31 bundleIdentifier];
  int v33 = [v32 isEqualToString:@"com.apple.mobilesafari"];

  v34 = [(SHSheetRouter *)self rootViewController];
  id v35 = [v34 traitCollection];
  if ([v35 horizontalSizeClass] == 1 && v33)
  {
    uint64_t v36 = [v7 modalPresentationStyle];

    if (v36 == 7) {
      [v7 setModalPresentationStyle:2];
    }
  }
  else
  {
  }
  id v37 = [(SHSheetRouter *)self presentationViewController];
  [v37 presentViewController:v7 animated:1 completion:v8];
}

- (void)activityPerformCleanUpPresentation:(id)a3
{
  id v4 = share_sheet_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[SHSheetRouter activityPerformCleanUpPresentation:](v4, v5, v6, v7, v8, v9, v10, v11);
  }

  [(SHSheetRouter *)self setPresentationViewController:0];
}

- (void)activityPerformer:(id)a3 startListeningForDismissalTransitionWithCompletion:(id)a4
{
  if (!self->_listenForDismissalTransition)
  {
    id v6 = a4;
    id v7 = a3;
    uint64_t v8 = share_sheet_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[SHSheetRouter activityPerformer:startListeningForDismissalTransitionWithCompletion:](v8, v9, v10, v11, v12, v13, v14, v15);
    }

    self->_listenForDismissalTransition = 1;
    [(SHSheetRouter *)self setListenerCompletionHandler:v6];

    uint64_t v16 = [v7 activity];

    id v17 = [v16 activityViewController];
    [(SHSheetRouter *)self setCurrentViewControllerForActivityBeingListened:v17];

    double v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v18 addObserver:self selector:sel__presentationControllerDismissalTransitionDidEndNotification_ name:*MEMORY[0x1E4FB2E60] object:0];
  }
}

- (void)activityPerformerStopListeningForDismissalTransition:(id)a3
{
  if (self->_listenForDismissalTransition)
  {
    id v4 = share_sheet_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      -[SHSheetRouter activityPerformerStopListeningForDismissalTransition:](v4, v5, v6, v7, v8, v9, v10, v11);
    }

    self->_listenForDismissalTransition = 0;
    [(SHSheetRouter *)self setListenerCompletionHandler:0];
    [(SHSheetRouter *)self setCurrentViewControllerForActivityBeingListened:0];
    uint64_t v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 removeObserver:self name:*MEMORY[0x1E4FB2E60] object:0];
  }
}

- (void)_presentationControllerDismissalTransitionDidEndNotification:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 userInfo];
  uint64_t v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4FB2E58]];
  int v7 = [v6 BOOLValue];

  if (self->_listenForDismissalTransition && v7)
  {
    uint64_t v8 = [(SHSheetRouter *)self currentViewControllerForActivityBeingListened];
    uint64_t v9 = [(SHSheetRouter *)self presentationViewController];
    uint64_t v10 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v11 = [v10 userInterfaceIdiom];

    if (!v8 && v9)
    {
      if (v11 == 1)
      {
        uint64_t v8 = [v9 presentedViewController];
      }
      else
      {
        uint64_t v8 = 0;
      }
    }
    uint64_t v12 = [v4 object];

    if (v12 == v8)
    {
      uint64_t v13 = share_sheet_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138412290;
        uint64_t v16 = v8;
        _os_log_impl(&dword_1A0AD8000, v13, OS_LOG_TYPE_DEFAULT, "Presentation controller dismissal detected for %@", (uint8_t *)&v15, 0xCu);
      }

      uint64_t v14 = [(SHSheetRouter *)self listenerCompletionHandler];
      v14[2]();
    }
  }
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(SHSheetRouter *)self secondaryNavigationController];

  if (v9 == v7)
  {
    uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4FB2130]) initWithPresentedViewController:v7 presentingViewController:v8];
    uint64_t v11 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v11 _referenceBounds];
    double v13 = v12;
    double v15 = v14;

    BOOL v16 = v13 != 320.0 || v15 != 568.0;
    [v10 _setWantsBottomAttachedInCompactHeight:v16];
    [v10 _setWidthFollowsPreferredContentSizeWhenBottomAttached:1];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  id v14 = a3;
  uint64_t v6 = [v14 disappearingViewController];

  id v7 = v14;
  if (v6)
  {
    id v8 = [v14 disappearingViewController];
    id v9 = [(SHSheetRouter *)self collaborationParticipantsViewController];
    if (v8 == v9)
    {
      double v12 = [(SHSheetRouter *)self collaborationParticipantsDismissalHandler];

      if (v12)
      {
        [(SHSheetRouter *)self _didDismissCollaborationParticipantsViewController];
LABEL_10:
        id v7 = v14;
        goto LABEL_11;
      }
    }
    else
    {
    }
    uint64_t v10 = [v14 disappearingViewController];
    uint64_t v11 = [(SHSheetRouter *)self optionsViewController];
    if (v10 == v11)
    {
      double v13 = [(SHSheetRouter *)self optionsViewControllerDismissalHandler];

      id v7 = v14;
      if (!v13) {
        goto LABEL_11;
      }
      [(SHSheetRouter *)self _didDismissOptionsViewController];
    }
    else
    {
    }
    goto LABEL_10;
  }
LABEL_11:
}

- (void)handlePresentationBlockingViewControllerClose
{
  id v3 = [(SHSheetRouter *)self mainViewController];
  v2 = [v3 presenter];
  [v2 handleClose];
}

- (BOOL)presentationBlockingViewShouldPresentCloseButton
{
  v2 = [(SHSheetRouter *)self mainViewController];
  BOOL v3 = [v2 effectivePresentationStyle] != 7;

  return v3;
}

- (void)layoutPresentationBlockingViewController
{
  id v3 = [(SHSheetRouter *)self presentationBlockingViewController];
  v2 = [v3 view];
  [v2 setNeedsLayout];
}

- (UIViewController)rootViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rootViewController);
  return (UIViewController *)WeakRetained;
}

- (SHSheetContentView)mainViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mainViewController);
  return (SHSheetContentView *)WeakRetained;
}

- (void)setMainViewController:(id)a3
{
}

- (void)setActivityPresentationController:(id)a3
{
}

- (UINavigationController)mainNavigationController
{
  return self->_mainNavigationController;
}

- (void)setMainNavigationController:(id)a3
{
}

- (UINavigationController)secondaryNavigationController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_secondaryNavigationController);
  return (UINavigationController *)WeakRetained;
}

- (void)setSecondaryNavigationController:(id)a3
{
}

- (UINavigationController)userDefaultsNavigationController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_userDefaultsNavigationController);
  return (UINavigationController *)WeakRetained;
}

- (void)setUserDefaultsNavigationController:(id)a3
{
}

- (SHSheetContentView)secondaryViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_secondaryViewController);
  return (SHSheetContentView *)WeakRetained;
}

- (void)setSecondaryViewController:(id)a3
{
}

- (UIViewController)presentationBlockingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationBlockingViewController);
  return (UIViewController *)WeakRetained;
}

- (void)setPresentationBlockingViewController:(id)a3
{
}

- (UIViewController)presentationViewController
{
  return self->_presentationViewController;
}

- (void)setPresentationViewController:(id)a3
{
}

- (UIViewController)currentViewControllerForActivityBeingListened
{
  return self->_currentViewControllerForActivityBeingListened;
}

- (void)setCurrentViewControllerForActivityBeingListened:(id)a3
{
}

- (BOOL)listenForDismissalTransition
{
  return self->_listenForDismissalTransition;
}

- (void)setListenForDismissalTransition:(BOOL)a3
{
  self->_listenForDismissalTransition = a3;
}

- (id)listenerCompletionHandler
{
  return self->_listenerCompletionHandler;
}

- (void)setListenerCompletionHandler:(id)a3
{
}

- (UIViewController)collaborationParticipantsViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collaborationParticipantsViewController);
  return (UIViewController *)WeakRetained;
}

- (void)setCollaborationParticipantsViewController:(id)a3
{
}

- (id)collaborationParticipantsDismissalHandler
{
  return self->_collaborationParticipantsDismissalHandler;
}

- (void)setCollaborationParticipantsDismissalHandler:(id)a3
{
}

- (BOOL)supportsModalPresentations
{
  return self->_supportsModalPresentations;
}

- (UIViewController)optionsViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_optionsViewController);
  return (UIViewController *)WeakRetained;
}

- (void)setOptionsViewController:(id)a3
{
}

- (id)optionsViewControllerDismissalHandler
{
  return self->_optionsViewControllerDismissalHandler;
}

- (void)setOptionsViewControllerDismissalHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_optionsViewControllerDismissalHandler, 0);
  objc_destroyWeak((id *)&self->_optionsViewController);
  objc_storeStrong(&self->_collaborationParticipantsDismissalHandler, 0);
  objc_destroyWeak((id *)&self->_collaborationParticipantsViewController);
  objc_storeStrong(&self->_listenerCompletionHandler, 0);
  objc_storeStrong((id *)&self->_currentViewControllerForActivityBeingListened, 0);
  objc_storeStrong((id *)&self->_presentationViewController, 0);
  objc_destroyWeak((id *)&self->_presentationBlockingViewController);
  objc_destroyWeak((id *)&self->_secondaryViewController);
  objc_destroyWeak((id *)&self->_userDefaultsNavigationController);
  objc_destroyWeak((id *)&self->_secondaryNavigationController);
  objc_storeStrong((id *)&self->_mainNavigationController, 0);
  objc_storeStrong((id *)&self->_activityPresentationController, 0);
  objc_destroyWeak((id *)&self->_mainViewController);
  objc_destroyWeak((id *)&self->_rootViewController);
}

- (void)activityPerformCleanUpPresentation:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)activityPerformer:(uint64_t)a3 startListeningForDismissalTransitionWithCompletion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)activityPerformerStopListeningForDismissalTransition:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end