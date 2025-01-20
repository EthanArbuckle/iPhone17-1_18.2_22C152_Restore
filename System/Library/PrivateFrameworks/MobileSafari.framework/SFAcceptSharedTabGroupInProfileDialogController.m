@interface SFAcceptSharedTabGroupInProfileDialogController
+ (void)presentDialogInScene:(id)a3 forSharedTabGroupWithTitle:(id)a4 tabGroupManager:(id)a5 completionHandler:(id)a6;
- (id)_actionToOpenInProfile:(id)a3;
- (id)_initWithScene:(id)a3 sharedTabGroupTitle:(id)a4 tabGroupManager:(id)a5 completionHandler:(id)a6;
- (id)_makeDialog;
- (id)_presentationViewController;
- (int)webProcessIDForDialogController:(id)a3;
- (void)_presentDialog;
- (void)_showAllProfilesDialog;
- (void)cancel;
- (void)dialogController:(id)a3 dismissViewController:(id)a4 withAdditionalAnimations:(id)a5;
- (void)dialogController:(id)a3 presentViewController:(id)a4 withAdditionalAnimations:(id)a5;
- (void)selectProfile;
@end

@implementation SFAcceptSharedTabGroupInProfileDialogController

+ (void)presentDialogInScene:(id)a3 forSharedTabGroupWithTitle:(id)a4 tabGroupManager:(id)a5 completionHandler:(id)a6
{
  id v15 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = (void (**)(id, void))a6;
  if ([v11 hasMultipleProfiles])
  {
    uint64_t v13 = [objc_alloc((Class)a1) _initWithScene:v15 sharedTabGroupTitle:v10 tabGroupManager:v11 completionHandler:v12];
    v14 = (void *)_currentDialogController;
    _currentDialogController = v13;

    [(id)_currentDialogController _presentDialog];
  }
  else
  {
    v12[2](v12, *MEMORY[0x1E4F980C8]);
  }
}

- (id)_initWithScene:(id)a3 sharedTabGroupTitle:(id)a4 tabGroupManager:(id)a5 completionHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v23.receiver = self;
  v23.super_class = (Class)SFAcceptSharedTabGroupInProfileDialogController;
  id v15 = [(SFAcceptSharedTabGroupInProfileDialogController *)&v23 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_windowScene, a3);
    uint64_t v17 = [v12 copy];
    sharedTabGroupTitle = v16->_sharedTabGroupTitle;
    v16->_sharedTabGroupTitle = (NSString *)v17;

    objc_storeStrong((id *)&v16->_tabGroupManager, a5);
    uint64_t v19 = [v14 copy];
    id completionHandler = v16->_completionHandler;
    v16->_id completionHandler = (id)v19;

    v21 = v16;
  }

  return v16;
}

- (void)_presentDialog
{
  v3 = [(SFAcceptSharedTabGroupInProfileDialogController *)self _makeDialog];
  dialog = self->_dialog;
  self->_dialog = v3;

  v5 = objc_alloc_init(SFDialogController);
  dialogController = self->_dialogController;
  self->_dialogController = v5;

  [(SFDialogController *)self->_dialogController setDelegate:self];
  [(SFDialogController *)self->_dialogController setDialogPresenter:self];
  [(SFDialogController *)self->_dialogController setViewControllerPresenter:self];
  v8 = self->_dialog;
  v7 = self->_dialogController;

  [(SFDialogController *)v7 presentDialog:v8];
}

- (id)_makeDialog
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v3 = objc_alloc_init(SFBasicDialog);
  v4 = NSString;
  v5 = _WBSLocalizedString();
  v6 = objc_msgSend(v4, "stringWithFormat:", v5, self->_sharedTabGroupTitle);
  [(SFBasicDialog *)v3 setTitle:v6];

  v7 = _WBSLocalizedString();
  [(SFBasicDialog *)v3 setMessage:v7];

  v8 = [(WBTabGroupManager *)self->_tabGroupManager profiles];
  v9 = [MEMORY[0x1E4F1CA48] array];
  id v10 = [v8 objectAtIndexedSubscript:0];
  id v11 = [(SFAcceptSharedTabGroupInProfileDialogController *)self _actionToOpenInProfile:v10];
  [v9 addObject:v11];

  if ((unint64_t)[v8 count] > 3)
  {
    v18 = NSString;
    uint64_t v19 = _WBSLocalizedString();
    v20 = objc_msgSend(v18, "stringWithFormat:", v19, self->_sharedTabGroupTitle);
    v21 = +[SFDialogAction actionWithTitle:v20 activatingKeyboardShortcut:0 type:0];
    [v9 addObject:v21];
  }
  else
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v12 = objc_msgSend(v8, "subarrayWithRange:", 1, objc_msgSend(v8, "count") - 1);
    uint64_t v13 = [v12 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v31 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = [(SFAcceptSharedTabGroupInProfileDialogController *)self _actionToOpenInProfile:*(void *)(*((void *)&v30 + 1) + 8 * i)];
          [v9 addObject:v17];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v14);
    }
  }
  v22 = _WBSLocalizedString();
  objc_super v23 = +[SFDialogAction actionWithTitle:v22 activatingKeyboardShortcut:1 type:1];
  [v9 addObject:v23];

  [(SFBasicDialog *)v3 setActions:v9];
  [(SFBasicDialog *)v3 setPresentationStyle:1];
  [(SFBasicDialog *)v3 setAlertControllerPresentsAsActionSheet:0];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __62__SFAcceptSharedTabGroupInProfileDialogController__makeDialog__block_invoke;
  v27[3] = &unk_1E54EC600;
  v27[4] = self;
  id v28 = v9;
  id v29 = v8;
  id v24 = v8;
  id v25 = v9;
  [(SFBasicDialog *)v3 setCompletionHandler:v27];

  return v3;
}

void __62__SFAcceptSharedTabGroupInProfileDialogController__makeDialog__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v15 = a3;
  id v7 = a4;
  if (!a2)
  {
    v8 = *(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 32) + 16);
    goto LABEL_5;
  }
  if ([*(id *)(a1 + 40) count] - 1 == a2)
  {
    v8 = *(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 32) + 16);
LABEL_5:
    v8();
LABEL_6:
    v9 = (void *)_currentDialogController;
    _currentDialogController = 0;

    goto LABEL_7;
  }
  unint64_t v10 = [*(id *)(a1 + 48) count];
  id v11 = *(void **)(a1 + 32);
  if (v10 <= 3)
  {
    uint64_t v12 = v11[4];
    uint64_t v13 = [*(id *)(a1 + 48) objectAtIndexedSubscript:a2];
    uint64_t v14 = [v13 identifier];
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v14);

    goto LABEL_6;
  }
  [v11 _showAllProfilesDialog];
LABEL_7:
}

- (id)_actionToOpenInProfile:(id)a3
{
  v4 = NSString;
  id v5 = a3;
  v6 = _WBSLocalizedString();
  sharedTabGroupTitle = self->_sharedTabGroupTitle;
  v8 = [v5 title];
  v9 = objc_msgSend(v4, "stringWithFormat:", v6, sharedTabGroupTitle, v8);

  unint64_t v10 = [v5 identifier];

  uint64_t v11 = [v10 isEqualToString:*MEMORY[0x1E4F980C8]];
  if (v11) {
    uint64_t v12 = 2;
  }
  else {
    uint64_t v12 = 0;
  }
  uint64_t v13 = +[SFDialogAction actionWithTitle:v9 activatingKeyboardShortcut:v12 type:0 isPreferredAction:v11];

  return v13;
}

- (void)_showAllProfilesDialog
{
  v3 = objc_alloc_init(_SFProfileSelectionTableViewController);
  selectionViewController = self->_selectionViewController;
  self->_selectionViewController = v3;

  id v5 = _WBSLocalizedString();
  [(_SFProfileSelectionTableViewController *)self->_selectionViewController setTitle:v5];

  v6 = [(WBTabGroupManager *)self->_tabGroupManager profiles];
  [(_SFProfileSelectionTableViewController *)self->_selectionViewController setProfiles:v6];

  id v7 = objc_alloc(MEMORY[0x1E4FB14A8]);
  v8 = _WBSLocalizedString();
  id v17 = (id)[v7 initWithTitle:v8 style:2 target:self action:sel_selectProfile];

  id v9 = objc_alloc(MEMORY[0x1E4FB14A8]);
  unint64_t v10 = _WBSLocalizedString();
  uint64_t v11 = (void *)[v9 initWithTitle:v10 style:0 target:self action:sel_cancel];

  uint64_t v12 = [(_SFProfileSelectionTableViewController *)self->_selectionViewController navigationItem];
  [v12 setRightBarButtonItem:v17];

  uint64_t v13 = [(_SFProfileSelectionTableViewController *)self->_selectionViewController navigationItem];
  [v13 setLeftBarButtonItem:v11];

  uint64_t v14 = (UINavigationController *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:self->_selectionViewController];
  navigationController = self->_navigationController;
  self->_navigationController = v14;

  [(UINavigationController *)self->_navigationController setModalPresentationStyle:2];
  v16 = [(SFAcceptSharedTabGroupInProfileDialogController *)self _presentationViewController];
  [v16 presentViewController:self->_navigationController animated:1 completion:0];
}

- (void)selectProfile
{
  v3 = [(UINavigationController *)self->_navigationController presentingViewController];
  [v3 dismissViewControllerAnimated:self->_navigationController != 0 completion:&__block_literal_global_40];

  id completionHandler = (void (**)(id, void *))self->_completionHandler;
  id v5 = [(_SFProfileSelectionTableViewController *)self->_selectionViewController selectedProfile];
  v6 = [v5 identifier];
  completionHandler[2](completionHandler, v6);

  id v7 = (void *)_currentDialogController;
  _currentDialogController = 0;
}

- (void)cancel
{
  v3 = [(UINavigationController *)self->_navigationController presentingViewController];
  [v3 dismissViewControllerAnimated:self->_navigationController != 0 completion:&__block_literal_global_36];

  (*((void (**)(void))self->_completionHandler + 2))();
  v4 = (void *)_currentDialogController;
  _currentDialogController = 0;
}

- (id)_presentationViewController
{
  v2 = [(UIWindowScene *)self->_windowScene keyWindow];
  v3 = [v2 rootViewController];

  uint64_t v4 = [v3 presentedViewController];
  if (v4)
  {
    id v5 = (void *)v4;
    while (1)
    {
      v6 = [v3 presentedViewController];
      char v7 = [v6 isBeingDismissed];

      if (v7) {
        break;
      }
      v8 = [v3 presentedViewController];

      id v5 = [v8 presentedViewController];
      v3 = v8;
      if (!v5) {
        goto LABEL_7;
      }
    }
  }
  v8 = v3;
LABEL_7:

  return v8;
}

- (int)webProcessIDForDialogController:(id)a3
{
  return 1;
}

- (void)dialogController:(id)a3 presentViewController:(id)a4 withAdditionalAnimations:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(SFAcceptSharedTabGroupInProfileDialogController *)self _presentationViewController];
  [v9 presentViewController:v8 animated:1 completion:0];
  objc_msgSend(v8, "_sf_animateAlongsideTransitionOrPerform:", v7);
}

- (void)dialogController:(id)a3 dismissViewController:(id)a4 withAdditionalAnimations:(id)a5
{
  id v6 = a5;
  id v8 = a4;
  id v7 = [v8 presentingViewController];
  [v7 dismissViewControllerAnimated:1 completion:0];

  objc_msgSend(v8, "_sf_animateAlongsideTransitionOrPerform:", v6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionViewController, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_dialogController, 0);
  objc_storeStrong((id *)&self->_dialog, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_tabGroupManager, 0);
  objc_storeStrong((id *)&self->_sharedTabGroupTitle, 0);

  objc_storeStrong((id *)&self->_windowScene, 0);
}

@end