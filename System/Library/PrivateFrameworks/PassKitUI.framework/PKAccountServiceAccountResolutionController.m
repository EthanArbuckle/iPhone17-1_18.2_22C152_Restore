@interface PKAccountServiceAccountResolutionController
- (PKAccount)account;
- (PKAccountBillPaymentObserver)billPaymentObserver;
- (PKAccountServiceAccountResolutionController)initWithAccount:(id)a3 accountUserCollection:(id)a4 transactionSourceCollection:(id)a5;
- (PKAccountServiceAccountResolutionControllerDelegate)delegate;
- (PKAccountUserCollection)accountUserCollection;
- (PKTransactionSourceCollection)transactionSourceCollection;
- (UIViewController)presentingViewController;
- (id)_alertControllerForBusinessChatContext:(id)a3;
- (void)_callIssuer;
- (void)_handleAccountServiceAccountDidChangeNotification:(id)a3;
- (void)_openBusinessChatWithContext:(id)a3;
- (void)_presentAccountServiceAction:(unint64_t)a3 configuration:(id)a4 completion:(id)a5;
- (void)_presentViewController:(id)a3;
- (void)presentFlowForAccountResolution:(unint64_t)a3 configuration:(id)a4 completion:(id)a5;
- (void)setAccount:(id)a3;
- (void)setAccountUserCollection:(id)a3;
- (void)setBillPaymentObserver:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPresentingViewController:(id)a3;
- (void)setTransactionSourceCollection:(id)a3;
@end

@implementation PKAccountServiceAccountResolutionController

- (PKAccountServiceAccountResolutionController)initWithAccount:(id)a3 accountUserCollection:(id)a4 transactionSourceCollection:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PKAccountServiceAccountResolutionController;
  v12 = [(PKAccountServiceAccountResolutionController *)&v16 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_account, a3);
    objc_storeStrong((id *)&v13->_accountUserCollection, a4);
    objc_storeStrong((id *)&v13->_transactionSourceCollection, a5);
    v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v14 addObserver:v13 selector:sel__handleAccountServiceAccountDidChangeNotification_ name:*MEMORY[0x1E4F85BF8] object:0];
  }
  return v13;
}

- (void)presentFlowForAccountResolution:(unint64_t)a3 configuration:(id)a4 completion:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  if (!self->_isInPreflight)
  {
    objc_initWeak((id *)buf, self);
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    v15 = __104__PKAccountServiceAccountResolutionController_presentFlowForAccountResolution_configuration_completion___block_invoke;
    objc_super v16 = &unk_1E59CB0D8;
    objc_copyWeak(&v18, (id *)buf);
    id v9 = v9;
    id v17 = v9;
    id v11 = _Block_copy(&v13);
    v12 = v11;
    self->_isInPreflight = 1;
    if (a3 - 1 >= 3)
    {
      if (v9) {
        (*((void (**)(void *, void))v11 + 2))(v11, 0);
      }
    }
    else
    {
      -[PKAccountServiceAccountResolutionController _presentAccountServiceAction:configuration:completion:](self, "_presentAccountServiceAction:configuration:completion:", a3, v8, v11, v13, v14, v15, v16);

      id v9 = 0;
    }

    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)buf);
    goto LABEL_11;
  }
  id v10 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v20 = a3;
    _os_log_impl(&dword_19F450000, v10, OS_LOG_TYPE_DEFAULT, "Failed to present flow for resolution %lu as its already in preflight", buf, 0xCu);
  }

  if (v9)
  {
    (*((void (**)(id, void))v9 + 2))(v9, 0);
LABEL_11:
  }
}

void __104__PKAccountServiceAccountResolutionController_presentFlowForAccountResolution_configuration_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    *((unsigned char *)WeakRetained + 16) = 0;
    uint64_t v6 = *(void *)(a1 + 32);
    if (v6)
    {
      v7 = v5;
      (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, a2);
      v5 = v7;
    }
  }
}

- (void)_presentAccountServiceAction:(unint64_t)a3 configuration:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(id, uint64_t))a5;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __101__PKAccountServiceAccountResolutionController__presentAccountServiceAction_configuration_completion___block_invoke;
  aBlock[3] = &unk_1E59CB178;
  objc_copyWeak(v26, &location);
  v26[1] = (id)a3;
  id v10 = (uint64_t (**)(void *, void *, void))_Block_copy(aBlock);
  switch(a3)
  {
    case 3uLL:
      id v13 = [v8 businessChatContext];
      if (v13)
      {
        [(PKAccountServiceAccountResolutionController *)self _openBusinessChatWithContext:v13];
        char v18 = 1;
        if (v9) {
          v9[2](v9, 1);
        }
LABEL_18:

        if (!v9) {
          goto LABEL_21;
        }
        goto LABEL_19;
      }
      goto LABEL_15;
    case 2uLL:
      id v13 = [v8 businessChatContext];
      if (v13)
      {
        v15 = [(PKAccountServiceAccountResolutionController *)self _alertControllerForBusinessChatContext:v13];
        uint64_t v19 = v10[2](v10, v15, 0);
        if (v9) {
          v9[2](v9, v19);
        }
        goto LABEL_12;
      }
LABEL_15:
      char v18 = 0;
      goto LABEL_18;
    case 1uLL:
      account = self->_account;
      id v24 = 0;
      BOOL v12 = +[PKAccountBillPaymentViewController canPayBillForAccount:account displayableError:&v24];
      id v13 = v24;
      if (!v12)
      {
        v15 = +[PKAccountBillPaymentViewController alertControllerForDisplayableError:v13];
        v10[2](v10, v15, 0);
        char v18 = 0;
        goto LABEL_17;
      }
      uint64_t v14 = [(PKTransactionSourceCollection *)self->_transactionSourceCollection transactionSourcesForType:0];
      v15 = [v14 anyObject];

      objc_super v16 = self->_account;
      accountUserCollection = self->_accountUserCollection;
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __101__PKAccountServiceAccountResolutionController__presentAccountServiceAction_configuration_completion___block_invoke_2;
      v20[3] = &unk_1E59CB1A0;
      objc_copyWeak(&v23, &location);
      uint64_t v21 = v10;
      v22 = v9;
      +[PKAccountBillPaymentViewController billPaymentViewControllerForAccount:v16 accountUserCollection:accountUserCollection transactionSource:v15 configuration:v8 withCompletion:v20];

      objc_destroyWeak(&v23);
LABEL_12:
      char v18 = 1;
LABEL_17:

      goto LABEL_18;
  }
  char v18 = 0;
  if (!v9) {
    goto LABEL_21;
  }
LABEL_19:
  if ((v18 & 1) == 0) {
    v9[2](v9, 0);
  }
LABEL_21:

  objc_destroyWeak(v26);
  objc_destroyWeak(&location);
}

BOOL __101__PKAccountServiceAccountResolutionController__presentAccountServiceAction_configuration_completion___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (a3)
    {
      v7 = [[PKNavigationController alloc] initWithRootViewController:v5];
      if (PKIsVision() && *(void *)(a1 + 40) == 1)
      {
        [(PKNavigationController *)v7 setPageSheetPresentation];
      }
      else if (objc_msgSend(0, "pkui_userInterfaceIdiomSupportsLargeLayouts"))
      {
        [(PKNavigationController *)v7 setModalPresentationStyle:2];
      }
    }
    else
    {
      v7 = (PKNavigationController *)v5;
    }
    [WeakRetained _presentViewController:v7];
  }
  return WeakRetained != 0;
}

void __101__PKAccountServiceAccountResolutionController__presentAccountServiceAction_configuration_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v4 = 0;
  if (v7 && WeakRetained)
  {
    id v5 = objc_loadWeakRetained(WeakRetained + 7);
    [v7 setObserver:v5];

    uint64_t v4 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, v4);
  }
}

- (void)_presentViewController:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __70__PKAccountServiceAccountResolutionController__presentViewController___block_invoke;
  v6[3] = &unk_1E59CA870;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __70__PKAccountServiceAccountResolutionController__presentViewController___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));

  uint64_t v3 = *(void *)(a1 + 32);
  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)(v3 + 64));
    [v5 presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
  }
  else
  {
    id v4 = objc_loadWeakRetained((id *)(v3 + 48));
    if (!v4) {
      goto LABEL_6;
    }
    id v5 = v4;
    [v4 accountServiceAccountResolutionController:*(void *)(a1 + 32) requestsPresentViewController:*(void *)(a1 + 40) animated:1];
  }
  id v4 = v5;
LABEL_6:
}

- (void)_handleAccountServiceAccountDidChangeNotification:(id)a3
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __97__PKAccountServiceAccountResolutionController__handleAccountServiceAccountDidChangeNotification___block_invoke;
  aBlock[3] = &unk_1E59CB1C8;
  void aBlock[4] = self;
  id v4 = _Block_copy(aBlock);
  if (self->_account)
  {
    id v5 = [MEMORY[0x1E4F84270] sharedInstance];
    uint64_t v6 = [(PKAccount *)self->_account accountIdentifier];
    [v5 accountWithIdentifier:v6 completion:v4];
  }
}

void __97__PKAccountServiceAccountResolutionController__handleAccountServiceAccountDidChangeNotification___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __97__PKAccountServiceAccountResolutionController__handleAccountServiceAccountDidChangeNotification___block_invoke_2;
  v6[3] = &unk_1E59CA870;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __97__PKAccountServiceAccountResolutionController__handleAccountServiceAccountDidChangeNotification___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (v1) {
    objc_storeStrong((id *)(*(void *)(a1 + 40) + 24), v1);
  }
}

- (id)_alertControllerForBusinessChatContext:(id)a3
{
  id v20 = a3;
  uint64_t v4 = [(PKTransactionSourceCollection *)self->_transactionSourceCollection paymentPass];
  id v5 = [v4 localizedValueForFieldKey:*MEMORY[0x1E4F87A58]];
  uint64_t v6 = [v4 businessChatIdentifier];
  id v7 = [v4 organizationName];
  uint64_t v8 = PKLocalizedPaymentString(&cfstr_ContactIssuer.isa, &stru_1EF1B4C70.isa, v7);
  id v9 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v8 message:0 preferredStyle:0];
  if (v5)
  {
    id v10 = (void *)MEMORY[0x1E4FB1410];
    id v11 = PKLocalizedPaymentString(&cfstr_Call_0.isa);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __86__PKAccountServiceAccountResolutionController__alertControllerForBusinessChatContext___block_invoke;
    v23[3] = &unk_1E59CB1F0;
    v23[4] = self;
    BOOL v12 = [v10 actionWithTitle:v11 style:0 handler:v23];
    [v9 addAction:v12];
  }
  if (v6
    && +[PKBusinessChatController deviceSupportsBusinessChat])
  {
    id v13 = (void *)MEMORY[0x1E4FB1410];
    uint64_t v14 = PKLocalizedPaymentString(&cfstr_Message_0.isa);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __86__PKAccountServiceAccountResolutionController__alertControllerForBusinessChatContext___block_invoke_2;
    v21[3] = &unk_1E59CB218;
    v21[4] = self;
    id v22 = v20;
    v15 = [v13 actionWithTitle:v14 style:0 handler:v21];
    [v9 addAction:v15];
  }
  objc_super v16 = (void *)MEMORY[0x1E4FB1410];
  id v17 = PKLocalizedString(&cfstr_Cancel.isa);
  char v18 = [v16 actionWithTitle:v17 style:1 handler:0];
  [v9 addAction:v18];

  return v9;
}

uint64_t __86__PKAccountServiceAccountResolutionController__alertControllerForBusinessChatContext___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _callIssuer];
}

uint64_t __86__PKAccountServiceAccountResolutionController__alertControllerForBusinessChatContext___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _openBusinessChatWithContext:*(void *)(a1 + 40)];
}

- (void)_callIssuer
{
  id v5 = [(PKTransactionSourceCollection *)self->_transactionSourceCollection paymentPass];
  v2 = [v5 localizedValueForFieldKey:*MEMORY[0x1E4F87A58]];
  id v3 = PKTelephoneURLFromPhoneNumber();
  uint64_t v4 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v4 openSensitiveURL:v3 withOptions:0];
}

- (void)_openBusinessChatWithContext:(id)a3
{
  id v4 = a3;
  if (+[PKBusinessChatController deviceSupportsBusinessChat])
  {
    if (!self->_businessChatController)
    {
      id v5 = objc_alloc_init(PKBusinessChatController);
      businessChatController = self->_businessChatController;
      self->_businessChatController = v5;
    }
    objc_initWeak(&location, self);
    id v7 = self->_businessChatController;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __76__PKAccountServiceAccountResolutionController__openBusinessChatWithContext___block_invoke;
    v8[3] = &unk_1E59CB240;
    objc_copyWeak(&v9, &location);
    [(PKBusinessChatController *)v7 openBusinessChatWithContext:v4 completion:v8];
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __76__PKAccountServiceAccountResolutionController__openBusinessChatWithContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __76__PKAccountServiceAccountResolutionController__openBusinessChatWithContext___block_invoke_2;
  v5[3] = &unk_1E59CB010;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __76__PKAccountServiceAccountResolutionController__openBusinessChatWithContext___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = *(void **)(a1 + 32);
    if (v3)
    {
      id v5 = WeakRetained;
      id v4 = PKAlertForDisplayableErrorWithHandlers(v3, 0, 0, 0);
      [v5 _presentViewController:v4];

      id WeakRetained = v5;
    }
  }
}

- (PKAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (PKAccountUserCollection)accountUserCollection
{
  return self->_accountUserCollection;
}

- (void)setAccountUserCollection:(id)a3
{
}

- (PKTransactionSourceCollection)transactionSourceCollection
{
  return self->_transactionSourceCollection;
}

- (void)setTransactionSourceCollection:(id)a3
{
}

- (PKAccountServiceAccountResolutionControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKAccountServiceAccountResolutionControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PKAccountBillPaymentObserver)billPaymentObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_billPaymentObserver);

  return (PKAccountBillPaymentObserver *)WeakRetained;
}

- (void)setBillPaymentObserver:(id)a3
{
}

- (UIViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);

  return (UIViewController *)WeakRetained;
}

- (void)setPresentingViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_destroyWeak((id *)&self->_billPaymentObserver);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_transactionSourceCollection, 0);
  objc_storeStrong((id *)&self->_accountUserCollection, 0);
  objc_storeStrong((id *)&self->_account, 0);

  objc_storeStrong((id *)&self->_businessChatController, 0);
}

@end