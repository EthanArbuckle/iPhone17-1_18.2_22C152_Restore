@interface PKPaymentMethodSelectionViewController
- (PKPaymentMethodSelectionViewController)initWithPaymentRequest:(id)a3 selectedPass:(id)a4 paymentMethodName:(id)a5 paymentMethodIdentifier:(id)a6 allowAppleCashToggle:(BOOL)a7 useAppleCashBalance:(BOOL)a8 viewStyle:(int64_t)a9 delegate:(id)a10;
- (void)_handlePassUpdate:(id)a3;
- (void)_openPaymentSetupWithNetworkWhitelist:(id)a3 completion:(id)a4;
- (void)performedAddPaymentMethodWithCompletion:(id)a3;
- (void)requestOpenURL:(id)a3;
- (void)selectedPass:(id)a3;
- (void)toggledUseAppleCashBalance:(BOOL)a3;
@end

@implementation PKPaymentMethodSelectionViewController

- (PKPaymentMethodSelectionViewController)initWithPaymentRequest:(id)a3 selectedPass:(id)a4 paymentMethodName:(id)a5 paymentMethodIdentifier:(id)a6 allowAppleCashToggle:(BOOL)a7 useAppleCashBalance:(BOOL)a8 viewStyle:(int64_t)a9 delegate:(id)a10
{
  BOOL v10 = a8;
  BOOL v11 = a7;
  id v17 = a3;
  id v41 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a10;
  v42.receiver = self;
  v42.super_class = (Class)PKPaymentMethodSelectionViewController;
  v21 = [(PKDynamicCollectionViewController *)&v42 init];
  v22 = v21;
  if (v21)
  {
    id v40 = v17;
    p_paymentRequest = &v21->_paymentRequest;
    objc_storeStrong((id *)&v21->_paymentRequest, a3);
    objc_storeStrong((id *)&v22->_selectedPass, a4);
    objc_storeWeak((id *)&v22->_delegate, v20);
    v24 = [(PKPaymentMethodSelectionViewController *)v22 navigationItem];
    v25 = PKLocalizedPaymentString(&cfstr_AutoReloadPaym.isa);
    [v24 setTitle:v25];

    [v24 setLargeTitleDisplayMode:2];
    id v26 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (v11)
    {
      v27 = [[PKPaymentMethodPeerPaymentSectionController alloc] initWithDelegate:v22 request:*p_paymentRequest useAppleCashBalance:v10];
      peerPaymentController = v22->_peerPaymentController;
      v22->_peerPaymentController = v27;

      [v26 addObject:v22->_peerPaymentController];
    }
    v29 = [[PKPaymentMethodPassesSectionController alloc] initWithDelegate:v22 request:*p_paymentRequest selectedPass:v22->_selectedPass];
    passesController = v22->_passesController;
    v22->_passesController = v29;

    [v26 addObject:v22->_passesController];
    if (v18)
    {
      if (v19)
      {
        v31 = [MEMORY[0x1E4F84898] sharedInstance];
        v32 = [v31 passWithFPANIdentifier:v19];

        if (!v32)
        {
          v33 = [[PKPaymentMethodRemovedSectionController alloc] initWithPaymentMethodName:v18 paymentMethodIdentifier:v19];
          [v26 addObject:v33];
        }
      }
    }
    v34 = [[PKPaymentMethodActionSectionController alloc] initWithDelegate:v22];
    actionsController = v22->_actionsController;
    v22->_actionsController = v34;

    v36 = [MEMORY[0x1E4FB1618] linkColor];
    if (a9 == 2) {
      PKBridgeButtonTextColor();
    }
    else {
    v37 = [MEMORY[0x1E4FB1618] linkColor];
    }

    [(PKPaymentMethodActionSectionController *)v22->_actionsController setLinkTextColor:v37];
    [v26 addObject:v22->_actionsController];
    [(PKDynamicCollectionViewController *)v22 setSections:v26 animated:0];
    v38 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v38 addObserver:v22 selector:sel__handlePassUpdate_ name:*MEMORY[0x1E4F87558] object:0];

    id v17 = v40;
  }

  return v22;
}

- (void)performedAddPaymentMethodWithCompletion:(id)a3
{
}

- (void)selectedPass:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained paymentMethodSelectionViewController:self didSelectPaymentMethod:v5];
}

- (void)requestOpenURL:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F3AEB8];
  id v5 = a3;
  id v6 = (id)[[v4 alloc] initWithURL:v5];

  [v6 setModalPresentationStyle:2];
  [(PKPaymentMethodSelectionViewController *)self presentViewController:v6 animated:1 completion:0];
}

- (void)toggledUseAppleCashBalance:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained paymentMethodSelectionViewController:self didToggleUseAppleCashBalance:v3];
}

- (void)_openPaymentSetupWithNetworkWhitelist:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = objc_alloc(MEMORY[0x1E4F84BB8]);
  v9 = [MEMORY[0x1E4F84D50] sharedService];
  BOOL v10 = (void *)[v8 initWithWebService:v9];

  [v10 setAllowedPaymentNetworks:v6];
  [v10 setAllowedCardTypes:&unk_1EF2BA068];
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
  [v10 setAllowedFeatureIdentifiers:v11];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __91__PKPaymentMethodSelectionViewController__openPaymentSetupWithNetworkWhitelist_completion___block_invoke;
  v14[3] = &unk_1E59D65A8;
  objc_copyWeak(&v18, &location);
  id v12 = v7;
  id v17 = v12;
  id v13 = v10;
  id v15 = v13;
  v16 = self;
  [v13 preflightWithCompletion:v14];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __91__PKPaymentMethodSelectionViewController__openPaymentSetupWithNetworkWhitelist_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __91__PKPaymentMethodSelectionViewController__openPaymentSetupWithNetworkWhitelist_completion___block_invoke_2;
  v9[3] = &unk_1E59D6580;
  objc_copyWeak(&v14, (id *)(a1 + 56));
  char v15 = a2;
  id v10 = v5;
  id v13 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  id v11 = v6;
  uint64_t v12 = v7;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v9);

  objc_destroyWeak(&v14);
}

void __91__PKPaymentMethodSelectionViewController__openPaymentSetupWithNetworkWhitelist_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    if (*(unsigned char *)(a1 + 72))
    {
      BOOL v3 = (void *)[objc_alloc(MEMORY[0x1E4F84ED0]) initWithEnvironment:0 provisioningController:*(void *)(a1 + 40) groupsController:0];
      v4 = [[PKPaymentSetupDismissibleNavigationController alloc] initWithContext:0];
      [(PKPaymentSetupDismissibleNavigationController *)v4 useStandardPlatformPresentationStyle];
      objc_initWeak(&location, *(id *)(a1 + 48));
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __91__PKPaymentMethodSelectionViewController__openPaymentSetupWithNetworkWhitelist_completion___block_invoke_3;
      v12[3] = &unk_1E59CB038;
      objc_copyWeak(&v15, &location);
      id v5 = v4;
      id v13 = v5;
      id v14 = *(id *)(a1 + 56);
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __91__PKPaymentMethodSelectionViewController__openPaymentSetupWithNetworkWhitelist_completion___block_invoke_4;
      v10[3] = &unk_1E59CA7F8;
      objc_copyWeak(&v11, &location);
      +[PKProvisioningFlowBridge startProvisionToPurchaseFlowWithNavController:v5 context:v3 onFirstViewControllerShown:v12 completion:v10];
      objc_destroyWeak(&v11);

      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
    else
    {
      id v6 = *(void **)(a1 + 32);
      if (v6)
      {
        id v7 = v6;
      }
      else
      {
        PKDisplayableErrorForCommonType();
        id v7 = (id)objc_claimAutoreleasedReturnValue();
      }
      BOOL v3 = v7;
      id v8 = +[PKPaymentSetupNavigationController viewControllerForPresentingPaymentError:v7];
      v9 = [WeakRetained navigationController];
      [v9 presentViewController:v8 animated:1 completion:*(void *)(a1 + 56)];
    }
  }
}

void __91__PKPaymentMethodSelectionViewController__openPaymentSetupWithNetworkWhitelist_completion___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    BOOL v3 = [WeakRetained navigationController];
    [v3 presentViewController:*(void *)(a1 + 32) animated:1 completion:*(void *)(a1 + 40)];

    id WeakRetained = v4;
  }
}

void __91__PKPaymentMethodSelectionViewController__openPaymentSetupWithNetworkWhitelist_completion___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained navigationController];
  [v1 dismissViewControllerAnimated:1 completion:0];
}

- (void)_handlePassUpdate:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__PKPaymentMethodSelectionViewController__handlePassUpdate___block_invoke;
  block[3] = &unk_1E59CA7D0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __60__PKPaymentMethodSelectionViewController__handlePassUpdate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadDataForSectionIdentifier:@"passes" animated:1];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerPaymentController, 0);
  objc_storeStrong((id *)&self->_passesController, 0);
  objc_storeStrong((id *)&self->_actionsController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_selectedPass, 0);

  objc_storeStrong((id *)&self->_paymentRequest, 0);
}

@end