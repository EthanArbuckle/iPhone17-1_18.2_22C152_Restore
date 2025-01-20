@interface PKEditPassesNavigationController
- (PKEditPassesNavigationController)init;
- (PKEditPassesNavigationController)initWithExistingGroupsController:(id)a3;
- (PKEditPassesNavigationController)initWithExistingGroupsController:(id)a3 specificGroup:(id)a4 isForWatch:(BOOL)a5 delegate:(id)a6;
- (void)_done;
@end

@implementation PKEditPassesNavigationController

- (PKEditPassesNavigationController)init
{
  return [(PKEditPassesNavigationController *)self initWithExistingGroupsController:0];
}

- (PKEditPassesNavigationController)initWithExistingGroupsController:(id)a3
{
  id v4 = a3;
  id v5 = [[PKEditGroupsViewController alloc] initInEditingMode:1 existingGroupsController:v4 isForWatch:0];
  v6 = [v5 navigationItem];
  id v7 = objc_alloc(MEMORY[0x1E4FB14A8]);
  v8 = PKLocalizedString(&cfstr_PassEditingDon.isa);
  v9 = (void *)[v7 initWithTitle:v8 style:2 target:self action:sel__done];
  [v6 setRightBarButtonItem:v9];

  v18.receiver = self;
  v18.super_class = (Class)PKEditPassesNavigationController;
  v10 = [(PKNavigationController *)&v18 init];
  v11 = v10;
  if (v10) {
    [(PKEditPassesNavigationController *)v10 pushViewController:v5 animated:0];
  }
  [(PKEditPassesNavigationController *)v11 _beginDelayingPresentation:0 cancellationHandler:2.0];
  objc_initWeak(&location, v11);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __69__PKEditPassesNavigationController_initWithExistingGroupsController___block_invoke;
  v14[3] = &unk_1E59CD6F8;
  objc_copyWeak(&v16, &location);
  id v12 = v5;
  id v15 = v12;
  +[PKEditTableViewController loadPlaceholdersWithCompletion:v14];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v11;
}

void __69__PKEditPassesNavigationController_initWithExistingGroupsController___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__PKEditPassesNavigationController_initWithExistingGroupsController___block_invoke_2;
  block[3] = &unk_1E59CB378;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v6 = *(id *)(a1 + 32);
  id v7 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v8);
}

void __69__PKEditPassesNavigationController_initWithExistingGroupsController___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    [*(id *)(a1 + 32) setPlaceholders:*(void *)(a1 + 40)];
    [WeakRetained _endDelayingPresentation];
  }
}

- (PKEditPassesNavigationController)initWithExistingGroupsController:(id)a3 specificGroup:(id)a4 isForWatch:(BOOL)a5 delegate:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = [[PKEditGroupViewController alloc] initWithGroup:v11 existingGroupsController:v10 style:1 placeholders:0 isForWatch:v7 delegate:v12];
  v14 = [(PKEditGroupViewController *)v13 navigationItem];
  id v15 = objc_alloc(MEMORY[0x1E4FB14A8]);
  id v16 = PKLocalizedString(&cfstr_PassEditingDon.isa);
  v17 = (void *)[v15 initWithTitle:v16 style:2 target:self action:sel__done];
  [v14 setRightBarButtonItem:v17];

  v26.receiver = self;
  v26.super_class = (Class)PKEditPassesNavigationController;
  objc_super v18 = [(PKNavigationController *)&v26 init];
  v19 = v18;
  if (v18) {
    [(PKEditPassesNavigationController *)v18 pushViewController:v13 animated:0];
  }
  [(PKEditPassesNavigationController *)v19 _beginDelayingPresentation:0 cancellationHandler:2.0];
  objc_initWeak(&location, v19);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __103__PKEditPassesNavigationController_initWithExistingGroupsController_specificGroup_isForWatch_delegate___block_invoke;
  v22[3] = &unk_1E59CD6F8;
  objc_copyWeak(&v24, &location);
  v20 = v13;
  v23 = v20;
  +[PKEditTableViewController loadPlaceholdersWithCompletion:v22];

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

  return v19;
}

void __103__PKEditPassesNavigationController_initWithExistingGroupsController_specificGroup_isForWatch_delegate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __103__PKEditPassesNavigationController_initWithExistingGroupsController_specificGroup_isForWatch_delegate___block_invoke_2;
  block[3] = &unk_1E59CB378;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v6 = *(id *)(a1 + 32);
  id v7 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v8);
}

void __103__PKEditPassesNavigationController_initWithExistingGroupsController_specificGroup_isForWatch_delegate___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    [*(id *)(a1 + 32) setPlaceholders:*(void *)(a1 + 40)];
    [WeakRetained _endDelayingPresentation];
  }
}

- (void)_done
{
  id v2 = [(PKEditPassesNavigationController *)self presentingViewController];
  [v2 dismissViewControllerAnimated:1 completion:0];
}

@end