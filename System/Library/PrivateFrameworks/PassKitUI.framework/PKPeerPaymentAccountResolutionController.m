@interface PKPeerPaymentAccountResolutionController
+ (BOOL)_canShowContactSupportForPass:(id)a3;
- (BOOL)_hasPeerPaymentPassProvisioned;
- (PKPaymentSetupDelegate)setupDelegate;
- (PKPeerPaymentAccount)account;
- (PKPeerPaymentAccountResolutionController)initWithAccount:(id)a3 webService:(id)a4 context:(int64_t)a5 delegate:(id)a6 passLibraryDataProvider:(id)a7;
- (PKPeerPaymentAccountResolutionControllerDelegate)delegate;
- (id)_contactAppleSupportAlertControllerForPass:(id)a3;
- (id)_paymentSetupNavigationControllerForProvisioningController:(id)a3;
- (id)_paymentWebService;
- (id)_peerPaymentPass;
- (unint64_t)currentPeerPaymentAccountResolution;
- (void)_callSupportWithPhoneNumber:(id)a3;
- (void)_dismissViewController;
- (void)_emailSupportWithEmailAddress:(id)a3;
- (void)_openSupportWebsiteWithWebsiteURL:(id)a3;
- (void)_peerPaymentAccountChanged:(id)a3;
- (void)_presentActivationFlowWithCompletion:(id)a3;
- (void)_presentActivationFlowWithConfiguration:(id)a3 completion:(id)a4;
- (void)_presentContactAppleSupportAlertWithCompletion:(id)a3;
- (void)_presentFlowForAccountResolution:(unint64_t)a3 configuration:(id)a4 completion:(id)a5;
- (void)_presentIdentityVerificationWithConfiguration:(id)a3 completion:(id)a4;
- (void)_presentPeerPaymentAction:(unint64_t)a3 withCompletion:(id)a4;
- (void)_presentReOpenFlowWithCompletion:(id)a3;
- (void)_presentViewController:(id)a3;
- (void)dealloc;
- (void)peerPaymentAccountResolutionController:(id)a3 requestsDismissCurrentViewControllerAnimated:(BOOL)a4;
- (void)peerPaymentAccountResolutionController:(id)a3 requestsPresentViewController:(id)a4 animated:(BOOL)a5;
- (void)peerPaymentActionViewControllerDidCancel:(id)a3;
- (void)peerPaymentActionViewControllerDidPerformAction:(id)a3;
- (void)presentResolutionForCurrentAccountStateWithCompletion:(id)a3;
- (void)setAccount:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSetupDelegate:(id)a3;
@end

@implementation PKPeerPaymentAccountResolutionController

- (PKPeerPaymentAccountResolutionController)initWithAccount:(id)a3 webService:(id)a4 context:(int64_t)a5 delegate:(id)a6 passLibraryDataProvider:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  v27.receiver = self;
  v27.super_class = (Class)PKPeerPaymentAccountResolutionController;
  v17 = [(PKPeerPaymentAccountResolutionController *)&v27 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_account, a3);
    objc_storeStrong((id *)&v18->_webService, a4);
    v18->_context = a5;
    id v19 = objc_storeWeak((id *)&v18->_delegate, v15);

    if (!v15) {
      objc_storeWeak((id *)&v18->_delegate, v18);
    }
    p_passLibraryDataProvider = (void **)&v18->_passLibraryDataProvider;
    objc_storeStrong((id *)&v18->_passLibraryDataProvider, a7);
    if (!v18->_passLibraryDataProvider)
    {
      id v21 = objc_alloc_init(MEMORY[0x1E4F848A0]);
      v22 = *p_passLibraryDataProvider;
      *p_passLibraryDataProvider = v21;
    }
    v23 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v24 = *MEMORY[0x1E4F87CC8];
    v25 = [(PKPeerPaymentWebService *)v18->_webService targetDevice];
    [v23 addObserver:v18 selector:sel__peerPaymentAccountChanged_ name:v24 object:v25];
  }
  return v18;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PKPeerPaymentAccountResolutionController;
  [(PKPeerPaymentAccountResolutionController *)&v4 dealloc];
}

- (void)presentResolutionForCurrentAccountStateWithCompletion:(id)a3
{
  id v4 = a3;
  [(PKPeerPaymentAccountResolutionController *)self presentFlowForAccountResolution:[(PKPeerPaymentAccountResolutionController *)self currentPeerPaymentAccountResolution] configuration:0 completion:v4];
}

- (void)_presentFlowForAccountResolution:(unint64_t)a3 configuration:(id)a4 completion:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  v9 = (void (**)(id, void))a5;
  v10 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = PKPeerPaymentAccountResolutionStateToString();
    int v12 = 138412546;
    id v13 = v11;
    __int16 v14 = 2112;
    id v15 = v8;
    _os_log_impl(&dword_19F450000, v10, OS_LOG_TYPE_DEFAULT, "Presenting flow for peer payment account resolution: \"%@\" configuration: %@.", (uint8_t *)&v12, 0x16u);
  }
  switch(a3)
  {
    case 1uLL:
      [(PKPeerPaymentAccountResolutionController *)self _presentActivationFlowWithConfiguration:v8 completion:v9];
      break;
    case 2uLL:
      [(PKPeerPaymentAccountResolutionController *)self _presentIdentityVerificationWithConfiguration:v8 completion:v9];
      break;
    case 3uLL:
      [(PKPeerPaymentAccountResolutionController *)self _presentContactAppleSupportAlertWithCompletion:v9];
      break;
    case 4uLL:
      [(PKPeerPaymentAccountResolutionController *)self _presentReOpenFlowWithCompletion:v9];
      break;
    case 5uLL:
      [(PKPeerPaymentAccountResolutionController *)self _presentPeerPaymentAction:1 withCompletion:v9];
      break;
    default:
      if (v9) {
        v9[2](v9, 0);
      }
      break;
  }
}

- (unint64_t)currentPeerPaymentAccountResolution
{
  v2 = [MEMORY[0x1E4F84DB8] _peerPaymentPassForAccount:self->_account passLibraryDataProvider:self->_passLibraryDataProvider];
  unint64_t v3 = PKPeerPaymentAccountResolutionForAccountAndPeerPaymentPass();

  return v3;
}

- (void)peerPaymentAccountResolutionController:(id)a3 requestsPresentViewController:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  v6 = (void *)MEMORY[0x1E4FB1438];
  id v7 = a4;
  id v8 = [v6 sharedApplication];
  v9 = [v8 keyWindow];
  id v10 = [v9 rootViewController];

  [v10 presentViewController:v7 animated:v5 completion:0];
}

- (void)peerPaymentAccountResolutionController:(id)a3 requestsDismissCurrentViewControllerAnimated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = objc_msgSend(MEMORY[0x1E4FB1438], "sharedApplication", a3);
  v6 = [v5 keyWindow];
  id v7 = [v6 rootViewController];

  [v7 dismissViewControllerAnimated:v4 completion:0];
}

- (BOOL)_hasPeerPaymentPassProvisioned
{
  return [MEMORY[0x1E4F84DB8] _hasPeerPaymentPassProvisionedForAccount:self->_account passLibraryDataProvider:self->_passLibraryDataProvider];
}

- (id)_peerPaymentPass
{
  return (id)[MEMORY[0x1E4F84DB8] _peerPaymentPassForAccount:self->_account passLibraryDataProvider:self->_passLibraryDataProvider];
}

+ (BOOL)_canShowContactSupportForPass:(id)a3
{
  id v3 = a3;
  uint64_t v4 = PKUserInterfaceIdiom();
  BOOL v5 = [v3 localizedValueForFieldKey:*MEMORY[0x1E4F87A48]];
  v6 = [v3 localizedValueForFieldKey:*MEMORY[0x1E4F87A58]];
  id v7 = [v3 localizedValueForFieldKey:*MEMORY[0x1E4F87A60]];

  BOOL v11 = (v4 & 0xFFFFFFFFFFFFFFFBLL) == 0 && v6 != 0 || v5 != 0 || v7 != 0;
  return v11;
}

- (id)_paymentWebService
{
  if (PKPaymentSetupContextIsBridge()) {
    [(objc_class *)getNPKCompanionAgentConnectionClass_0() watchPaymentWebService];
  }
  else {
  v2 = [MEMORY[0x1E4F84D50] sharedService];
  }

  return v2;
}

- (void)_presentActivationFlowWithCompletion:(id)a3
{
}

- (void)_presentActivationFlowWithConfiguration:(id)a3 completion:(id)a4
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PKPeerPaymentAccountResolutionController *)self _paymentWebService];
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F84BB8]) initWithWebService:v8];
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F84D90]) initWithPeerPaymentAccount:self->_account];
  if (v6)
  {
    BOOL v11 = [v6 currencyAmount];
    [v10 setAmount:v11];
    objc_msgSend(v10, "setFlowState:", objc_msgSend(v6, "registrationFlowState"));
    int v12 = [v6 senderAddress];
    [v10 setPendingPaymentSenderAddress:v12];
    objc_msgSend(v10, "setPaymentMode:", objc_msgSend(v6, "paymentMode"));
  }
  if (v10)
  {
    objc_initWeak(location, self);
    v22[0] = v10;
    id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __95__PKPeerPaymentAccountResolutionController__presentActivationFlowWithConfiguration_completion___block_invoke;
    v15[3] = &unk_1E59D2698;
    objc_copyWeak(&v20, location);
    id v16 = v9;
    v17 = self;
    id v18 = v10;
    id v19 = v7;
    [v16 associateCredentials:v13 withCompletionHandler:v15];

    objc_destroyWeak(&v20);
    objc_destroyWeak(location);
  }
  else
  {
    __int16 v14 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_19F450000, v14, OS_LOG_TYPE_DEFAULT, "Cannot present setup flow with a nil peer payment credential", (uint8_t *)location, 2u);
    }

    if (v7) {
      (*((void (**)(id, void))v7 + 2))(v7, 0);
    }
  }
}

void __95__PKPeerPaymentAccountResolutionController__presentActivationFlowWithConfiguration_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __95__PKPeerPaymentAccountResolutionController__presentActivationFlowWithConfiguration_completion___block_invoke_2;
  block[3] = &unk_1E59D2670;
  objc_copyWeak(&v16, (id *)(a1 + 64));
  char v17 = a2;
  id v11 = v5;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  id v8 = *(void **)(a1 + 48);
  id v12 = v6;
  uint64_t v13 = v7;
  id v14 = v8;
  id v15 = *(id *)(a1 + 56);
  id v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v16);
}

void __95__PKPeerPaymentAccountResolutionController__presentActivationFlowWithConfiguration_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    if (*(unsigned char *)(a1 + 80) && !*(void *)(a1 + 32))
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F848A0]);
      id v6 = [[PKPeerPaymentExplanationViewController alloc] initWithProvisoningController:*(void *)(a1 + 40) setupDelegate:*(void *)(a1 + 48) passLibraryDataProvider:v5 context:*(void *)(*(void *)(a1 + 48) + 24) credential:*(void *)(a1 + 56)];
      uint64_t v7 = [[PKNavigationController alloc] initWithRootViewController:v6];
      [(PKNavigationController *)v7 setCustomFormSheetPresentationStyleForiPad];
      [*(id *)(a1 + 48) _presentViewController:v7];
    }
    else
    {
      id v3 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v4 = [*(id *)(a1 + 32) description];
        int v9 = 138412290;
        id v10 = v4;
        _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Peer Payment associateCredential failed for local device with error:%@", (uint8_t *)&v9, 0xCu);
      }
      id v5 = +[PKPaymentSetupNavigationController viewControllerForPresentingPaymentError:*(void *)(a1 + 32)];
      [*(id *)(a1 + 48) _presentViewController:v5];
    }

    uint64_t v8 = *(void *)(a1 + 64);
    if (v8) {
      (*(void (**)(uint64_t, uint64_t))(v8 + 16))(v8, 1);
    }
  }
}

- (void)_presentIdentityVerificationWithConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, uint64_t))a4;
  if (PKDeviceSupportsPeerPaymentIdentityVerification())
  {
    if ([v6 isGraduation])
    {
      uint64_t v8 = [[PKPeerPaymentGraduationExplanationViewController alloc] initWithPeerPaymentWebService:self->_webService peerPaymentAccount:self->_account passLibraryDataProvider:self->_passLibraryDataProvider setupDelegate:self context:self->_context];
      int v9 = [[PKNavigationController alloc] initWithRootViewController:v8];
      [(PKNavigationController *)v9 setModalInPresentation:1];
      [(PKNavigationController *)v9 setSupportedInterfaceOrientations:2];
      PKPaymentSetupApplyContextAppearance(self->_context, v9);
      [(PKPeerPaymentAccountResolutionController *)self _presentViewController:v9];
      if (v7) {
        v7[2](v7, 1);
      }
    }
    else
    {
      uint64_t v8 = [[PKPeerPaymentIdentityVerificationController alloc] initWithPeerPaymentWebService:self->_webService identityVerificationResponse:0 setupDelegate:self hideInitialSplashScreen:0 context:self->_context];
      id v10 = [[PKPeerPaymentIdentityVerificationExplanationViewController alloc] initWithContext:0 setupDelegate:0 identityVerificationController:v8];
      [(PKPeerPaymentIdentityVerificationExplanationViewController *)v10 setShowSpinner:1];
      uint64_t v11 = [[PKNavigationController alloc] initWithRootViewController:v10];
      [(PKNavigationController *)v11 setModalInPresentation:1];
      [(PKNavigationController *)v11 setSupportedInterfaceOrientations:2];
      PKPaymentSetupApplyContextAppearance(self->_context, v11);
      [(PKPeerPaymentAccountResolutionController *)self _presentViewController:v11];
      id v12 = objc_alloc_init(MEMORY[0x1E4F84DA0]);
      uint64_t v13 = [(PKPeerPaymentWebService *)self->_webService context];
      objc_msgSend(v12, "setDevSigned:", objc_msgSend(v13, "devSigned"));

      objc_msgSend(v12, "setVerificationContext:", objc_msgSend(v6, "verificationContext"));
      objc_initWeak(&location, self);
      webService = self->_webService;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __101__PKPeerPaymentAccountResolutionController__presentIdentityVerificationWithConfiguration_completion___block_invoke;
      v17[3] = &unk_1E59D26C0;
      objc_copyWeak(&v21, &location);
      id v15 = v10;
      id v18 = v15;
      id v19 = v6;
      id v16 = v11;
      id v20 = v16;
      [(PKPeerPaymentWebService *)webService peerPaymentIdentityVerificationRequest:v12 completion:v17];
      if (v7) {
        v7[2](v7, 1);
      }

      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    PKCreateAlertControllerForPeerPaymentIdentityVerificationNotSupported(0);
    uint64_t v8 = (PKPeerPaymentGraduationExplanationViewController *)objc_claimAutoreleasedReturnValue();
    [(PKPeerPaymentAccountResolutionController *)self _presentViewController:v8];
    if (v7) {
      v7[2](v7, 1);
    }
  }
}

void __101__PKPeerPaymentAccountResolutionController__presentIdentityVerificationWithConfiguration_completion___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __101__PKPeerPaymentAccountResolutionController__presentIdentityVerificationWithConfiguration_completion___block_invoke_2;
  v9[3] = &unk_1E59D10E8;
  objc_copyWeak(&v15, a1 + 7);
  id v10 = a1[4];
  id v11 = v5;
  id v12 = v6;
  id v13 = a1[5];
  id v14 = a1[6];
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v9);

  objc_destroyWeak(&v15);
}

void __101__PKPeerPaymentAccountResolutionController__presentIdentityVerificationWithConfiguration_completion___block_invoke_2(uint64_t a1)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    [*(id *)(a1 + 32) setShowSpinner:0];
    id v3 = *(void **)(a1 + 40);
    if (v3) {
      BOOL v4 = *(void *)(a1 + 48) == 0;
    }
    else {
      BOOL v4 = 0;
    }
    if (v4)
    {
      objc_msgSend(v3, "setVerificationContext:", objc_msgSend(*(id *)(a1 + 56), "verificationContext"));
      id v5 = [[PKPeerPaymentIdentityVerificationController alloc] initWithPeerPaymentWebService:WeakRetained[4] identityVerificationResponse:*(void *)(a1 + 40) setupDelegate:WeakRetained hideInitialSplashScreen:0 context:WeakRetained[3]];
      id v7 = [(PKPeerPaymentIdentityVerificationController *)v5 firstViewController];
      id v8 = *(void **)(a1 + 64);
      v12[0] = v7;
      int v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
      [v8 setViewControllers:v9];
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F84D80], "displayableErrorForError:");
      id v5 = (PKPeerPaymentIdentityVerificationController *)objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __101__PKPeerPaymentAccountResolutionController__presentIdentityVerificationWithConfiguration_completion___block_invoke_3;
      v10[3] = &unk_1E59CA7D0;
      id v11 = *(id *)(a1 + 64);
      id v6 = PKAlertForDisplayableErrorWithHandlers(v5, 0, v10, 0);
      [*(id *)(a1 + 64) presentViewController:v6 animated:1 completion:0];

      id v7 = v11;
    }
  }
}

void __101__PKPeerPaymentAccountResolutionController__presentIdentityVerificationWithConfiguration_completion___block_invoke_3(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) presentingViewController];
  [v1 dismissViewControllerAnimated:1 completion:0];
}

- (id)_contactAppleSupportAlertControllerForPass:(id)a3
{
  id v4 = a3;
  if ([(id)objc_opt_class() _canShowContactSupportForPass:v4])
  {
    unint64_t v5 = PKUserInterfaceIdiom() & 0xFFFFFFFFFFFFFFFBLL;
    id v6 = [v4 localizedValueForFieldKey:*MEMORY[0x1E4F87A48]];
    id v7 = [v4 localizedValueForFieldKey:*MEMORY[0x1E4F87A58]];
    id v8 = [v4 localizedValueForFieldKey:*MEMORY[0x1E4F87A60]];
    int v9 = [v4 organizationName];
    uint64_t v10 = PKLocalizedPaymentString(&cfstr_ContactIssuer.isa, &stru_1EF1B4C70.isa, v9);
    id v11 = 0;
    if (v5 && v7)
    {
      id v11 = PKLocalizedPaymentString(&cfstr_ContactIssuerB.isa, &cfstr_12.isa, v9, v7);
    }
    objc_super v27 = (void *)v10;
    id v12 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v10 message:v11 preferredStyle:v5 != 0];
    if (v7) {
      BOOL v13 = v5 == 0;
    }
    else {
      BOOL v13 = 0;
    }
    if (v13)
    {
      id v14 = (void *)MEMORY[0x1E4FB1410];
      id v15 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentCon.isa);
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __87__PKPeerPaymentAccountResolutionController__contactAppleSupportAlertControllerForPass___block_invoke;
      v32[3] = &unk_1E59CB218;
      v32[4] = self;
      id v33 = v7;
      id v16 = [v14 actionWithTitle:v15 style:0 handler:v32];
      [v12 addAction:v16];
    }
    if (v6)
    {
      char v17 = (void *)MEMORY[0x1E4FB1410];
      id v18 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentCon_0.isa);
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __87__PKPeerPaymentAccountResolutionController__contactAppleSupportAlertControllerForPass___block_invoke_2;
      v30[3] = &unk_1E59CB218;
      v30[4] = self;
      id v31 = v6;
      id v19 = [v17 actionWithTitle:v18 style:0 handler:v30];
      [v12 addAction:v19];
    }
    if (v8)
    {
      id v20 = (void *)MEMORY[0x1E4FB1410];
      id v21 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentCon_1.isa);
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __87__PKPeerPaymentAccountResolutionController__contactAppleSupportAlertControllerForPass___block_invoke_3;
      v28[3] = &unk_1E59CB218;
      v28[4] = self;
      id v29 = v8;
      v22 = [v20 actionWithTitle:v21 style:0 handler:v28];
      [v12 addAction:v22];
    }
    v23 = (void *)MEMORY[0x1E4FB1410];
    uint64_t v24 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentCon_2.isa);
    v25 = [v23 actionWithTitle:v24 style:1 handler:0];
    [v12 addAction:v25];
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

uint64_t __87__PKPeerPaymentAccountResolutionController__contactAppleSupportAlertControllerForPass___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _callSupportWithPhoneNumber:*(void *)(a1 + 40)];
}

uint64_t __87__PKPeerPaymentAccountResolutionController__contactAppleSupportAlertControllerForPass___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _emailSupportWithEmailAddress:*(void *)(a1 + 40)];
}

uint64_t __87__PKPeerPaymentAccountResolutionController__contactAppleSupportAlertControllerForPass___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _openSupportWebsiteWithWebsiteURL:*(void *)(a1 + 40)];
}

- (void)_presentContactAppleSupportAlertWithCompletion:(id)a3
{
  id v6 = (void (**)(id, BOOL))a3;
  id v4 = [(PKPeerPaymentAccountResolutionController *)self _peerPaymentPass];
  unint64_t v5 = [(PKPeerPaymentAccountResolutionController *)self _contactAppleSupportAlertControllerForPass:v4];

  if (v5) {
    [(PKPeerPaymentAccountResolutionController *)self _presentViewController:v5];
  }
  if (v6) {
    v6[2](v6, v5 != 0);
  }
}

- (void)_presentReOpenFlowWithCompletion:(id)a3
{
  id v4 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__PKPeerPaymentAccountResolutionController__presentReOpenFlowWithCompletion___block_invoke;
  aBlock[3] = &unk_1E59D2738;
  aBlock[4] = self;
  unint64_t v5 = _Block_copy(aBlock);
  id v6 = v5;
  if (self->_context == 3)
  {
    id v7 = (void *)MEMORY[0x1E4FB1418];
    id v8 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentAcc.isa);
    int v9 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentAcc_0.isa);
    uint64_t v10 = [v7 alertControllerWithTitle:v8 message:v9 preferredStyle:1];

    id v11 = (void *)MEMORY[0x1E4FB1410];
    id v12 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentAcc_1.isa);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __77__PKPeerPaymentAccountResolutionController__presentReOpenFlowWithCompletion___block_invoke_3;
    v24[3] = &unk_1E59CB150;
    id v13 = v4;
    id v25 = v13;
    id v14 = [v11 actionWithTitle:v12 style:1 handler:v24];
    [v10 addAction:v14];

    id v15 = (void *)MEMORY[0x1E4FB1410];
    id v16 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentAcc_2.isa);
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    id v20 = __77__PKPeerPaymentAccountResolutionController__presentReOpenFlowWithCompletion___block_invoke_4;
    id v21 = &unk_1E59D2760;
    id v22 = v6;
    id v23 = v13;
    char v17 = [v15 actionWithTitle:v16 style:0 handler:&v18];
    objc_msgSend(v10, "addAction:", v17, v18, v19, v20, v21);

    [(PKPeerPaymentAccountResolutionController *)self _presentViewController:v10];
  }
  else
  {
    (*((void (**)(void *, id))v5 + 2))(v5, v4);
  }
}

void __77__PKPeerPaymentAccountResolutionController__presentReOpenFlowWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = __Block_byref_object_copy__17;
  void v10[4] = __Block_byref_object_dispose__17;
  id v11 = [*(id *)(*(void *)(a1 + 32) + 48) cloudStoreZoneNames];
  uint64_t v4 = *(void *)(a1 + 32);
  unint64_t v5 = *(void **)(v4 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __77__PKPeerPaymentAccountResolutionController__presentReOpenFlowWithCompletion___block_invoke_59;
  v7[3] = &unk_1E59D2710;
  int v9 = v10;
  v7[4] = v4;
  id v6 = v3;
  id v8 = v6;
  [v5 peerPaymentReOpenAccountWithCompletion:v7];

  _Block_object_dispose(v10, 8);
}

void __77__PKPeerPaymentAccountResolutionController__presentReOpenFlowWithCompletion___block_invoke_59(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__PKPeerPaymentAccountResolutionController__presentReOpenFlowWithCompletion___block_invoke_2;
  block[3] = &unk_1E59D26E8;
  char v12 = a2;
  void block[4] = *(void *)(a1 + 32);
  long long v8 = *(_OWORD *)(a1 + 40);
  id v6 = (id)v8;
  long long v11 = v8;
  id v10 = v5;
  id v7 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __77__PKPeerPaymentAccountResolutionController__presentReOpenFlowWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 64))
  {
    v2 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v18 = v3;
      _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "Reseting cloud store container for zone names %@...", buf, 0xCu);
    }

    id v4 = objc_alloc_init(MEMORY[0x1E4F845A8]);
    id v5 = PKCurrentCloudStoreApplePayContainerName();
    uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __77__PKPeerPaymentAccountResolutionController__presentReOpenFlowWithCompletion___block_invoke_61;
    v15[3] = &unk_1E59CD2D0;
    void v15[4] = *(void *)(a1 + 32);
    id v16 = *(id *)(a1 + 48);
    [v4 resetContainerWithIdentifier:v5 zoneNames:v6 completion:v15];
  }
  else
  {
    id v4 = [MEMORY[0x1E4F84D80] displayableErrorForError:*(void *)(a1 + 40)];
    id v7 = PKTitleForDisplayableError();
    long long v8 = MEMORY[0x1A6221F20](v4);
    int v9 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v7 message:v8 preferredStyle:1];
    id v10 = (void *)MEMORY[0x1E4FB1410];
    long long v11 = PKLocalizedString(&cfstr_OkButtonTitle.isa);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __77__PKPeerPaymentAccountResolutionController__presentReOpenFlowWithCompletion___block_invoke_2_73;
    v13[3] = &unk_1E59CB150;
    id v14 = *(id *)(a1 + 48);
    char v12 = [v10 actionWithTitle:v11 style:0 handler:v13];
    [v9 addAction:v12];

    [*(id *)(a1 + 32) _presentViewController:v9];
  }
}

void __77__PKPeerPaymentAccountResolutionController__presentReOpenFlowWithCompletion___block_invoke_61(uint64_t a1, char a2)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__PKPeerPaymentAccountResolutionController__presentReOpenFlowWithCompletion___block_invoke_2_62;
  block[3] = &unk_1E59CF278;
  char v5 = a2;
  v2 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v4 = v2;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __77__PKPeerPaymentAccountResolutionController__presentReOpenFlowWithCompletion___block_invoke_2_62(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 48);
  uint64_t v3 = PKLogFacilityTypeGetObject();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Cloud store reset succuessful. Presenting activation flow.", buf, 2u);
    }

    [*(id *)(a1 + 32) _presentActivationFlowWithCompletion:*(void *)(a1 + 40)];
  }
  else
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Error reseting the cloud store container.", buf, 2u);
    }

    char v5 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentAct_1.isa);
    uint64_t v6 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentAct_2.isa);
    id v7 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v5 message:v6 preferredStyle:1];
    long long v8 = (void *)MEMORY[0x1E4FB1410];
    int v9 = PKLocalizedString(&cfstr_OkButtonTitle.isa);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __77__PKPeerPaymentAccountResolutionController__presentReOpenFlowWithCompletion___block_invoke_72;
    v11[3] = &unk_1E59CB150;
    id v12 = *(id *)(a1 + 40);
    id v10 = [v8 actionWithTitle:v9 style:0 handler:v11];
    [v7 addAction:v10];

    [*(id *)(a1 + 32) _presentViewController:v7];
  }
}

uint64_t __77__PKPeerPaymentAccountResolutionController__presentReOpenFlowWithCompletion___block_invoke_72(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __77__PKPeerPaymentAccountResolutionController__presentReOpenFlowWithCompletion___block_invoke_2_73(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __77__PKPeerPaymentAccountResolutionController__presentReOpenFlowWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __77__PKPeerPaymentAccountResolutionController__presentReOpenFlowWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (void)_presentPeerPaymentAction:(unint64_t)a3 withCompletion:(id)a4
{
  uint64_t v6 = (void (**)(id, BOOL))a4;
  id v7 = [(PKPeerPaymentAccountResolutionController *)self _peerPaymentPass];
  id v14 = 0;
  uint64_t v15 = 0;
  BOOL v8 = +[PKPeerPaymentActionController canPerformPeerPaymentAction:a3 account:self->_account unableReason:&v15 displayableError:&v14];
  id v9 = v14;
  if (v8)
  {
    id v10 = +[PKPeerPaymentActionViewController peerPaymentActionViewControllerForAction:a3 paymentPass:v7 webService:self->_webService passLibraryDataProvider:self->_passLibraryDataProvider context:self->_context];
    [(PKPeerPaymentActionViewController *)v10 setDelegate:self];
    peerPaymentActionViewController = self->_peerPaymentActionViewController;
    self->_peerPaymentActionViewController = v10;
    id v12 = v10;

    id v13 = [[PKNavigationController alloc] initWithRootViewController:v12];
    [(PKNavigationController *)v13 setSupportedInterfaceOrientations:2];
    if ([(UIViewController *)v13 pkui_userInterfaceIdiomSupportsLargeLayouts])
    {
      [(PKNavigationController *)v13 setModalPresentationStyle:2];
    }
  }
  else
  {
    id v13 = +[PKPeerPaymentActionController alertControllerForPeerPaymentActionUnableReason:v15 displayableError:v9 addCardActionHandler:0];
  }
  [(PKPeerPaymentAccountResolutionController *)self _presentViewController:v13];
  if (v6) {
    v6[2](v6, v8);
  }
}

- (void)peerPaymentActionViewControllerDidCancel:(id)a3
{
  [(PKPeerPaymentAccountResolutionController *)self _dismissViewController];
  peerPaymentActionViewController = self->_peerPaymentActionViewController;
  self->_peerPaymentActionViewController = 0;
}

- (void)peerPaymentActionViewControllerDidPerformAction:(id)a3
{
  [(PKPeerPaymentAccountResolutionController *)self _dismissViewController];
  peerPaymentActionViewController = self->_peerPaymentActionViewController;
  self->_peerPaymentActionViewController = 0;
}

- (id)_paymentSetupNavigationControllerForProvisioningController:(id)a3
{
  id v4 = a3;
  char v5 = [[PKPaymentSetupNavigationController alloc] initWithProvisioningController:v4 context:self->_context];

  [(PKPaymentSetupNavigationController *)v5 setPaymentSetupMode:1];
  [(PKNavigationController *)v5 setCustomFormSheetPresentationStyleForiPad];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);
  [(PKPaymentSetupNavigationController *)v5 setSetupDelegate:WeakRetained];

  [(PKPaymentSetupNavigationController *)v5 setShowsWelcomeViewController:0];
  [(PKPaymentSetupNavigationController *)v5 setAllowsManualEntry:0];

  return v5;
}

- (void)_presentViewController:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained peerPaymentAccountResolutionController:self requestsPresentViewController:v5 animated:1];
}

- (void)_dismissViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained peerPaymentAccountResolutionController:self requestsDismissCurrentViewControllerAnimated:1];
}

- (void)_peerPaymentAccountChanged:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__PKPeerPaymentAccountResolutionController__peerPaymentAccountChanged___block_invoke;
  block[3] = &unk_1E59CA7D0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __71__PKPeerPaymentAccountResolutionController__peerPaymentAccountChanged___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(*(void *)(a1 + 32) + 32) targetDevice];
  uint64_t v3 = [v2 account];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 48);
  *(void *)(v4 + 48) = v3;

  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 40);
  uint64_t v8 = *(void *)(v6 + 48);

  return [v7 setAccount:v8];
}

- (void)_emailSupportWithEmailAddress:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (Class (__cdecl *)())getMFMailComposeViewControllerClass;
  id v5 = a3;
  if ([(objc_class *)v4() canSendMail])
  {
    id v6 = objc_alloc_init((Class)getMFMailComposeViewControllerClass());
    [v6 setMailComposeDelegate:self];
    v12[0] = v5;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];

    [v6 setToRecipients:v7];
    [(PKPeerPaymentAccountResolutionController *)self _presentViewController:v6];
  }
  else
  {
    id v11 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    uint64_t v8 = (void *)MEMORY[0x1E4F1CB10];
    id v9 = [NSString stringWithFormat:@"mailto:%@", v5];
    id v10 = [v8 URLWithString:v9];

    [v11 openURL:v10 withOptions:0];
  }
}

- (void)_callSupportWithPhoneNumber:(id)a3
{
  PKTelephoneURLFromPhoneNumber();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v3 openSensitiveURL:v4 withOptions:0];
}

- (void)_openSupportWebsiteWithWebsiteURL:(id)a3
{
  id v4 = [MEMORY[0x1E4F1CB10] URLWithString:a3];
  if (v4)
  {
    uint64_t v3 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    [v3 openURL:v4 withOptions:0];
  }
}

- (PKPeerPaymentAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (PKPeerPaymentAccountResolutionControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPeerPaymentAccountResolutionControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PKPaymentSetupDelegate)setupDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);

  return (PKPaymentSetupDelegate *)WeakRetained;
}

- (void)setSetupDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_setupDelegate);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_peerPaymentActionViewController, 0);
  objc_storeStrong((id *)&self->_webService, 0);
  objc_storeStrong((id *)&self->_passLibraryDataProvider, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end