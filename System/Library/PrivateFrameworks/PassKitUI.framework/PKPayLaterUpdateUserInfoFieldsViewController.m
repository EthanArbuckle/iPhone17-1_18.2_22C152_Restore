@interface PKPayLaterUpdateUserInfoFieldsViewController
- (PKPayLaterUpdateUserInfoFieldsViewController)initWithPayLaterAccount:(id)a3 webService:(id)a4 context:(int64_t)a5 setupDelegate:(id)a6 encryptionCertificates:(id)a7 encryptionVerion:(id)a8 fieldsPage:(id)a9;
- (void)handleCancelTapped;
- (void)handleNextButtonTapped:(id)a3;
@end

@implementation PKPayLaterUpdateUserInfoFieldsViewController

- (PKPayLaterUpdateUserInfoFieldsViewController)initWithPayLaterAccount:(id)a3 webService:(id)a4 context:(int64_t)a5 setupDelegate:(id)a6 encryptionCertificates:(id)a7 encryptionVerion:(id)a8 fieldsPage:(id)a9
{
  id v23 = a3;
  id v16 = a7;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)PKPayLaterUpdateUserInfoFieldsViewController;
  v18 = [(PKDynamicProvisioningFieldsPageViewController *)&v24 initWithWebService:a4 context:a5 setupDelegate:a6 fieldsPage:a9];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_payLaterAccount, a3);
    uint64_t v20 = [MEMORY[0x1E4F84270] sharedInstance];
    accountService = v19->_accountService;
    v19->_accountService = (PKAccountService *)v20;

    objc_storeStrong((id *)&v19->_encryptionVerion, a8);
    objc_storeStrong((id *)&v19->_encryptionCertificates, a7);
  }

  return v19;
}

- (void)handleNextButtonTapped:(id)a3
{
  id v4 = a3;
  v5 = [(PKDynamicProvisioningFieldsPageViewController *)self fieldsPage];
  v6 = [v5 fieldModel];

  id v7 = objc_alloc_init(MEMORY[0x1E4F842D0]);
  uint64_t v8 = *MEMORY[0x1E4F870B8];
  v9 = [v6 submissionValuesForDestination:*MEMORY[0x1E4F870B8]];
  [v7 setOverlayParameters:v9];

  v10 = [v6 secureSubmissionValuesForDestination:v8];
  [v7 setSecureOverlayParameters:v10];

  [v7 setCertificates:self->_encryptionCertificates];
  [v7 setEncryptionVersion:self->_encryptionVerion];
  v11 = [(PKAccount *)self->_payLaterAccount accountIdentifier];
  [v7 setAccountIdentifier:v11];

  v12 = [(PKAccount *)self->_payLaterAccount accountBaseURL];
  [v7 setBaseURL:v12];

  objc_msgSend(v7, "setFeatureIdentifier:", -[PKAccount feature](self->_payLaterAccount, "feature"));
  [(PKDynamicProvisioningFieldsPageViewController *)self showSpinner:1];
  id v13 = objc_alloc_init(MEMORY[0x1E4F84518]);
  objc_initWeak(&location, self);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __71__PKPayLaterUpdateUserInfoFieldsViewController_handleNextButtonTapped___block_invoke;
  v21[3] = &unk_1E59CD438;
  v21[4] = self;
  id v14 = v7;
  id v22 = v14;
  objc_copyWeak(&v23, &location);
  [v13 addOperation:v21];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __71__PKPayLaterUpdateUserInfoFieldsViewController_handleNextButtonTapped___block_invoke_5;
  v19[3] = &unk_1E59D0108;
  v19[4] = self;
  objc_copyWeak(&v20, &location);
  [v13 addOperation:v19];
  v15 = [MEMORY[0x1E4F1CA98] null];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __71__PKPayLaterUpdateUserInfoFieldsViewController_handleNextButtonTapped___block_invoke_9;
  v17[3] = &unk_1E59D3CD8;
  objc_copyWeak(&v18, &location);
  id v16 = (id)[v13 evaluateWithInput:v15 completion:v17];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&v23);

  objc_destroyWeak(&location);
}

void __71__PKPayLaterUpdateUserInfoFieldsViewController_handleNextButtonTapped___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v10 = [*(id *)(a1 + 32) webService];
  uint64_t v11 = *(void *)(a1 + 40);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __71__PKPayLaterUpdateUserInfoFieldsViewController_handleNextButtonTapped___block_invoke_2;
  v14[3] = &unk_1E59DA6B8;
  objc_copyWeak(&v17, (id *)(a1 + 48));
  v14[4] = *(void *)(a1 + 32);
  id v12 = v9;
  id v16 = v12;
  id v13 = v8;
  id v15 = v13;
  [v10 accountUpdateUserInfoWithRequest:v11 completion:v14];

  objc_destroyWeak(&v17);
}

void __71__PKPayLaterUpdateUserInfoFieldsViewController_handleNextButtonTapped___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__PKPayLaterUpdateUserInfoFieldsViewController_handleNextButtonTapped___block_invoke_3;
  block[3] = &unk_1E59CD3E8;
  objc_copyWeak(&v12, (id *)(a1 + 56));
  uint64_t v5 = *(void *)(a1 + 32);
  id v8 = v4;
  uint64_t v9 = v5;
  id v11 = *(id *)(a1 + 48);
  id v10 = *(id *)(a1 + 40);
  id v6 = v4;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v12);
}

void __71__PKPayLaterUpdateUserInfoFieldsViewController_handleNextButtonTapped___block_invoke_3(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 8);
  if (WeakRetained)
  {
    v3 = PKAccountDisplayableError();
    id v4 = PKAlertForDisplayableErrorWithHandlers(v3, 0, 0, 0);

    if (v4)
    {
      uint64_t v5 = [a1[5] navigationController];
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __71__PKPayLaterUpdateUserInfoFieldsViewController_handleNextButtonTapped___block_invoke_4;
      v6[3] = &unk_1E59CAD68;
      id v8 = a1[7];
      id v7 = a1[6];
      [v5 presentViewController:v4 animated:1 completion:v6];
    }
    else
    {
      (*((void (**)(void))a1[7] + 2))();
    }
  }
}

uint64_t __71__PKPayLaterUpdateUserInfoFieldsViewController_handleNextButtonTapped___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 1);
}

void __71__PKPayLaterUpdateUserInfoFieldsViewController_handleNextButtonTapped___block_invoke_5(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = *(void **)(v10 + 1288);
  id v12 = [*(id *)(v10 + 1280) accountIdentifier];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __71__PKPayLaterUpdateUserInfoFieldsViewController_handleNextButtonTapped___block_invoke_6;
  v15[3] = &unk_1E59DA6E0;
  objc_copyWeak(&v18, (id *)(a1 + 40));
  v15[4] = *(void *)(a1 + 32);
  id v13 = v9;
  id v17 = v13;
  id v14 = v8;
  id v16 = v14;
  [v11 updateAccountWithIdentifier:v12 extended:0 completion:v15];

  objc_destroyWeak(&v18);
}

void __71__PKPayLaterUpdateUserInfoFieldsViewController_handleNextButtonTapped___block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__PKPayLaterUpdateUserInfoFieldsViewController_handleNextButtonTapped___block_invoke_7;
  block[3] = &unk_1E59CD3E8;
  objc_copyWeak(&v12, (id *)(a1 + 56));
  uint64_t v5 = *(void *)(a1 + 32);
  id v8 = v4;
  uint64_t v9 = v5;
  id v11 = *(id *)(a1 + 48);
  id v10 = *(id *)(a1 + 40);
  id v6 = v4;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v12);
}

void __71__PKPayLaterUpdateUserInfoFieldsViewController_handleNextButtonTapped___block_invoke_7(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 8);
  if (WeakRetained)
  {
    v3 = PKAccountDisplayableError();
    id v4 = PKAlertForDisplayableErrorWithHandlers(v3, 0, 0, 0);

    if (v4)
    {
      uint64_t v5 = [a1[5] navigationController];
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __71__PKPayLaterUpdateUserInfoFieldsViewController_handleNextButtonTapped___block_invoke_8;
      v6[3] = &unk_1E59CAD68;
      id v8 = a1[7];
      id v7 = a1[6];
      [v5 presentViewController:v4 animated:1 completion:v6];
    }
    else
    {
      (*((void (**)(void))a1[7] + 2))();
    }
  }
}

uint64_t __71__PKPayLaterUpdateUserInfoFieldsViewController_handleNextButtonTapped___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 1);
}

void __71__PKPayLaterUpdateUserInfoFieldsViewController_handleNextButtonTapped___block_invoke_9(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__PKPayLaterUpdateUserInfoFieldsViewController_handleNextButtonTapped___block_invoke_10;
  v7[3] = &unk_1E59CB010;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);

  objc_destroyWeak(&v9);
}

void __71__PKPayLaterUpdateUserInfoFieldsViewController_handleNextButtonTapped___block_invoke_10(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    [WeakRetained showSpinner:0];
    char v4 = [*(id *)(a1 + 32) isCanceled];
    v3 = v5;
    if ((v4 & 1) == 0)
    {
      [v5 dismissViewControllerAnimated:1 completion:0];
      v3 = v5;
    }
  }
}

- (void)handleCancelTapped
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptionVerion, 0);
  objc_storeStrong((id *)&self->_encryptionCertificates, 0);
  objc_storeStrong((id *)&self->_accountService, 0);

  objc_storeStrong((id *)&self->_payLaterAccount, 0);
}

@end