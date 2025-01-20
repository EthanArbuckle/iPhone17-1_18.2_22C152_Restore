@interface PKPayLaterUserInfoViewController
- (PKPayLaterUserInfoViewController)initWithPayLaterAccount:(id)a3;
- (void)didUpdatePayLaterAccount:(id)a3;
- (void)nextViewControllerWithCompletion:(id)a3;
- (void)updateUserInfoForType:(int64_t)a3 completion:(id)a4;
- (void)viewDidLoad;
@end

@implementation PKPayLaterUserInfoViewController

- (PKPayLaterUserInfoViewController)initWithPayLaterAccount:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPayLaterUserInfoViewController;
  v5 = [(PKPayLaterViewController *)&v9 initWithPayLaterAccount:v4];
  if (v5)
  {
    v6 = [[PKPayLaterUserInfoSectionController alloc] initWithPayLaterAccount:v4 delegate:v5];
    sectionController = v5->_sectionController;
    v5->_sectionController = v6;

    [(PKPayLaterSectionController *)v5->_sectionController setDynamicCollectionDelegate:v5];
    [(PKDynamicCollectionViewController *)v5 setUseItemIdentityWhenUpdating:1];
  }

  return v5;
}

- (void)viewDidLoad
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)PKPayLaterUserInfoViewController;
  [(PKPayLaterViewController *)&v7 viewDidLoad];
  v8[0] = self->_sectionController;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  [(PKPaymentSetupOptionsViewController *)self setSections:v3 animated:0];

  id v4 = [(PKPayLaterUserInfoViewController *)self navigationItem];
  v5 = PKLocalizedCocoonString(&cfstr_PersonalInform_0.isa);
  [v4 setTitle:v5];

  v6 = [(PKPayLaterUserInfoViewController *)self view];
  [v6 setAccessibilityIdentifier:*MEMORY[0x1E4F85818]];
}

- (void)updateUserInfoForType:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F84BB8]);
    v8 = [MEMORY[0x1E4F84D50] sharedService];
    objc_super v9 = (void *)[v7 initWithWebService:v8];

    v10 = [[PKApplyControllerConfiguration alloc] initWithSetupDelegate:0 context:0 provisioningController:v9];
    v11 = [(PKPayLaterViewController *)self payLaterAccount];
    -[PKApplyControllerConfiguration setFeature:](v10, "setFeature:", [v11 feature]);

    [(PKApplyControllerConfiguration *)v10 setApplicationType:4];
    [(PKApplyControllerConfiguration *)v10 setUpdateUserInfoSubType:a3];
    v12 = [(PKPayLaterViewController *)self payLaterAccount];
    [(PKApplyControllerConfiguration *)v10 setAccount:v12];

    v13 = [[PKApplyController alloc] initWithApplyConfiguration:v10];
    applyController = self->_applyController;
    self->_applyController = v13;

    [(PKApplyController *)self->_applyController setParentFlowController:self];
    v15 = self->_applyController;
    v16 = [(PKPayLaterViewController *)self payLaterAccount];
    v17 = [v16 updateUserInfoBaseURL];
    [(PKApplyController *)v15 setApplyServiceURL:v17];

    objc_initWeak(&location, self);
    v18 = self->_applyController;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __69__PKPayLaterUserInfoViewController_updateUserInfoForType_completion___block_invoke;
    v19[3] = &unk_1E59D4040;
    objc_copyWeak(&v21, &location);
    id v20 = v6;
    [(PKApplyController *)v18 nextViewControllerWithCompletion:v19];

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
}

void __69__PKPayLaterUserInfoViewController_updateUserInfoForType_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v5)
    {
      v8 = [[PKNavigationController alloc] initWithRootViewController:v5];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __69__PKPayLaterUserInfoViewController_updateUserInfoForType_completion___block_invoke_2;
      v12[3] = &unk_1E59CAA98;
      id v13 = *(id *)(a1 + 32);
      [WeakRetained presentViewController:v8 animated:1 completion:v12];
      objc_super v9 = v13;
    }
    else
    {
      v8 = (PKNavigationController *)PKAlertForDisplayableErrorWithHandlers(v6, 0, 0, 0);
      if (!v8)
      {
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
        goto LABEL_7;
      }
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __69__PKPayLaterUserInfoViewController_updateUserInfoForType_completion___block_invoke_3;
      v10[3] = &unk_1E59CAA98;
      id v11 = *(id *)(a1 + 32);
      [WeakRetained presentViewController:v8 animated:1 completion:v10];
      objc_super v9 = v11;
    }

LABEL_7:
  }
}

uint64_t __69__PKPayLaterUserInfoViewController_updateUserInfoForType_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __69__PKPayLaterUserInfoViewController_updateUserInfoForType_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)nextViewControllerWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(PKPayLaterViewController *)self accountService];
  id v6 = [(PKPayLaterViewController *)self payLaterAccount];
  id v7 = [v6 accountIdentifier];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __69__PKPayLaterUserInfoViewController_nextViewControllerWithCompletion___block_invoke;
  v9[3] = &unk_1E59D4068;
  objc_copyWeak(&v11, &location);
  id v8 = v4;
  id v10 = v8;
  [v5 updateAccountWithIdentifier:v7 extended:0 completion:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __69__PKPayLaterUserInfoViewController_nextViewControllerWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__PKPayLaterUserInfoViewController_nextViewControllerWithCompletion___block_invoke_2;
  block[3] = &unk_1E59CA960;
  objc_copyWeak(&v10, (id *)(a1 + 40));
  id v5 = *(id *)(a1 + 32);
  id v8 = v4;
  id v9 = v5;
  id v6 = v4;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v10);
}

void __69__PKPayLaterUserInfoViewController_nextViewControllerWithCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id WeakRetained = v3;
  }
}

- (void)didUpdatePayLaterAccount:(id)a3
{
  [(PKPayLaterUserInfoSectionController *)self->_sectionController setPayLaterAccount:a3];

  [(PKDynamicCollectionViewController *)self reloadDataAnimated:1];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applyController, 0);

  objc_storeStrong((id *)&self->_sectionController, 0);
}

@end