@interface PKPeerPaymentTermsController
- (NSString)passUniqueID;
- (NSString)termsIdentifier;
- (NSURL)termsURL;
- (PKPeerPaymentTermsController)initWithTermsURL:(id)a3 termsIdentifier:(id)a4 passUniqueID:(id)a5 webService:(id)a6;
- (PKPeerPaymentWebService)webService;
- (RemoteUIController)remoteUIController;
- (UINavigationController)navigationController;
- (UIViewController)currentHostController;
- (id)customPresentationHandler;
- (int64_t)paymentSetupContext;
- (void)_presentRemoteUIController;
- (void)_presentRemoteUIControllerWithUpdatedTermsViewController:(id)a3;
- (void)peerPaymentUpdatedTermsViewController:(id)a3 didSelectContinue:(BOOL)a4;
- (void)presentTermsOverController:(id)a3 showInterstitialViewController:(BOOL)a4 withCompletionHandler:(id)a5;
- (void)remoteUIController:(id)a3 didReceiveObjectModel:(id)a4 actionSignal:(unint64_t *)a5;
- (void)setCurrentHostController:(id)a3;
- (void)setCustomPresentationHandler:(id)a3;
- (void)setNavigationController:(id)a3;
- (void)setPaymentSetupContext:(int64_t)a3;
@end

@implementation PKPeerPaymentTermsController

- (PKPeerPaymentTermsController)initWithTermsURL:(id)a3 termsIdentifier:(id)a4 passUniqueID:(id)a5 webService:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v29.receiver = self;
  v29.super_class = (Class)PKPeerPaymentTermsController;
  v15 = [(PKPeerPaymentTermsController *)&v29 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_termsURL, a3);
    uint64_t v17 = [v12 copy];
    termsIdentifier = v16->_termsIdentifier;
    v16->_termsIdentifier = (NSString *)v17;

    objc_storeStrong((id *)&v16->_passUniqueID, a5);
    objc_storeStrong((id *)&v16->_webService, a6);
    v19 = (RemoteUIController *)objc_alloc_init(MEMORY[0x1E4F95F70]);
    remoteUIController = v16->_remoteUIController;
    v16->_remoteUIController = v19;

    [(RemoteUIController *)v16->_remoteUIController setDelegate:v16];
    int v21 = PKUserInterfaceIdiomSupportsLargeLayouts();
    v22 = (Class *)0x1E4FB19E8;
    if (!v21) {
      v22 = (Class *)&off_1E59C4F60;
    }
    v23 = (UINavigationController *)objc_alloc_init(*v22);
    navigationController = v16->_navigationController;
    v16->_navigationController = v23;

    uint64_t v25 = 1;
    [(UINavigationController *)v16->_navigationController setModalInPresentation:1];
    [(RemoteUIController *)v16->_remoteUIController setNavigationController:v16->_navigationController];
    v26 = [(RemoteUIController *)v16->_remoteUIController loader];
    v27 = [(PKPeerPaymentWebService *)v16->_webService context];
    if (([v27 devSigned] & 1) == 0) {
      uint64_t v25 = os_variant_allows_internal_security_policies();
    }
    [v26 setAllowNonSecureHTTP:v25];
  }
  return v16;
}

- (void)presentTermsOverController:(id)a3 showInterstitialViewController:(BOOL)a4 withCompletionHandler:(id)a5
{
  BOOL v5 = a4;
  p_currentHostController = &self->_currentHostController;
  id v9 = a5;
  objc_storeWeak((id *)p_currentHostController, a3);
  v10 = (void *)[v9 copy];

  id completionHandler = self->_completionHandler;
  self->_id completionHandler = v10;

  if (v5)
  {
    id v12 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl(&dword_19F450000, v12, OS_LOG_TYPE_DEFAULT, "Presenting peer payment interstial terms view controller.", v17, 2u);
    }

    id v13 = objc_alloc_init(PKNavigationController);
    [(PKNavigationController *)v13 setModalInPresentation:1];
    id v14 = [[PKPeerPaymentUpdatedTermsViewController alloc] initWithPassUniqueID:self->_passUniqueID];
    [(PKPeerPaymentUpdatedTermsViewController *)v14 setDelegate:self];
    if ([(UIViewController *)v14 pkui_userInterfaceIdiomSupportsLargeLayouts])
    {
      [(PKNavigationController *)v13 setModalPresentationStyle:2];
    }
    [(PKNavigationController *)v13 pushViewController:v14 animated:0];
    customPresentationHandler = (void (**)(id, id, PKNavigationController *))self->_customPresentationHandler;
    id WeakRetained = objc_loadWeakRetained((id *)p_currentHostController);
    if (customPresentationHandler) {
      customPresentationHandler[2](customPresentationHandler, WeakRetained, v13);
    }
    else {
      [WeakRetained presentViewController:v13 animated:1 completion:0];
    }
  }
  else
  {
    [(PKPeerPaymentTermsController *)self _presentRemoteUIController];
  }
}

- (void)peerPaymentUpdatedTermsViewController:(id)a3 didSelectContinue:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4)
  {
    id v8 = v6;
    objc_storeWeak((id *)&self->_currentHostController, v6);
    [(PKPeerPaymentTermsController *)self setCustomPresentationHandler:&__block_literal_global_160];
    [(PKPeerPaymentTermsController *)self _presentRemoteUIControllerWithUpdatedTermsViewController:v8];
  }
  else
  {
    id completionHandler = (void (**)(id, uint64_t, void))self->_completionHandler;
    if (!completionHandler) {
      goto LABEL_6;
    }
    id v8 = v6;
    completionHandler[2](completionHandler, 1, 0);
  }
  id v6 = v8;
LABEL_6:
}

void __88__PKPeerPaymentTermsController_peerPaymentUpdatedTermsViewController_didSelectContinue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  [v5 setModalPresentationStyle:3];
  [v5 presentViewController:v4 withTransition:1 completion:0];
}

- (void)remoteUIController:(id)a3 didReceiveObjectModel:(id)a4 actionSignal:(unint64_t *)a5
{
  if (self->_remoteUIController == a3) {
    PKPaymentSetupApplyContextAppearance(self->_paymentSetupContext, a4);
  }
}

- (void)_presentRemoteUIController
{
}

- (void)_presentRemoteUIControllerWithUpdatedTermsViewController:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    termsURL = self->_termsURL;
    termsIdentifier = self->_termsIdentifier;
    *(_DWORD *)buf = 138412546;
    v16 = termsURL;
    __int16 v17 = 2112;
    v18 = termsIdentifier;
    _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Presenting peer payment terms with URL: %@, termsIdentifier: %@", buf, 0x16u);
  }

  [v4 showSpinner:1];
  objc_initWeak((id *)buf, self);
  remoteUIController = self->_remoteUIController;
  id v9 = self->_termsURL;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __89__PKPeerPaymentTermsController__presentRemoteUIControllerWithUpdatedTermsViewController___block_invoke;
  v11[3] = &unk_1E59CC710;
  objc_copyWeak(&v14, (id *)buf);
  id v10 = v4;
  id v12 = v10;
  id v13 = self;
  [(RemoteUIController *)remoteUIController loadURL:v9 postBody:0 completion:v11];

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
}

void __89__PKPeerPaymentTermsController__presentRemoteUIControllerWithUpdatedTermsViewController___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__PKPeerPaymentTermsController__presentRemoteUIControllerWithUpdatedTermsViewController___block_invoke_2;
  block[3] = &unk_1E59D9590;
  char v14 = a2;
  id v10 = v5;
  id v6 = v5;
  objc_copyWeak(&v13, (id *)(a1 + 48));
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  id v11 = v7;
  uint64_t v12 = v8;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v13);
}

void __89__PKPeerPaymentTermsController__presentRemoteUIControllerWithUpdatedTermsViewController___block_invoke_2(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (*(unsigned char *)(a1 + 64)) {
      id v4 = @"YES";
    }
    else {
      id v4 = @"NO";
    }
    *(_DWORD *)buf = 138412546;
    int v21 = v4;
    __int16 v22 = 2112;
    uint64_t v23 = v3;
    _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "Presented terms with success: %@, error %@.", buf, 0x16u);
  }

  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    [*(id *)(a1 + 40) showSpinner:0];
    if (*(unsigned char *)(a1 + 64))
    {
      PKPaymentSetupApplyContextAppearance([WeakRetained paymentSetupContext], WeakRetained[10]);
      id v6 = (void (**)(id, id, id))WeakRetained[8];
      id v7 = objc_loadWeakRetained(WeakRetained + 9);
      if (v6) {
        v6[2](v6, v7, WeakRetained[10]);
      }
      else {
        [v7 presentViewController:WeakRetained[10] animated:1 completion:0];
      }

      id v11 = WeakRetained[6];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __89__PKPeerPaymentTermsController__presentRemoteUIControllerWithUpdatedTermsViewController___block_invoke_24;
      v18[3] = &unk_1E59D9518;
      objc_copyWeak(&v19, (id *)(a1 + 56));
      v18[4] = *(void *)(a1 + 48);
      [v11 setHandlerForElementName:@"agree" handler:v18];
      id v12 = WeakRetained[6];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __89__PKPeerPaymentTermsController__presentRemoteUIControllerWithUpdatedTermsViewController___block_invoke_35;
      v16[3] = &unk_1E59D9540;
      v16[4] = *(void *)(a1 + 48);
      id v17 = *(id *)(a1 + 32);
      [v12 setHandlerForElementName:@"disagree" handler:v16];
      id v13 = WeakRetained[6];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __89__PKPeerPaymentTermsController__presentRemoteUIControllerWithUpdatedTermsViewController___block_invoke_2_39;
      v14[3] = &unk_1E59D9568;
      objc_copyWeak(&v15, (id *)(a1 + 56));
      [v13 setHandlerForElementName:@"emailTerms" handler:v14];
      objc_destroyWeak(&v15);

      objc_destroyWeak(&v19);
    }
    else
    {
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = *(__CFString **)(*(void *)(a1 + 48) + 16);
        uint64_t v9 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        int v21 = v8;
        __int16 v22 = 2112;
        uint64_t v23 = v9;
        _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "Error Failed to load termsURL %@ with error %@", buf, 0x16u);
      }

      uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
      if (v10) {
        (*(void (**)(uint64_t, void, void))(v10 + 16))(v10, 0, *(void *)(a1 + 32));
      }
    }
  }
}

void __89__PKPeerPaymentTermsController__presentRemoteUIControllerWithUpdatedTermsViewController___block_invoke_24(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentAct_3.isa);
    [v3 startNavigationBarSpinnerWithTitle:v5];
    id v6 = (void *)WeakRetained[5];
    uint64_t v7 = WeakRetained[3];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __89__PKPeerPaymentTermsController__presentRemoteUIControllerWithUpdatedTermsViewController___block_invoke_2_28;
    v10[3] = &unk_1E59CDC80;
    id v8 = v3;
    uint64_t v9 = *(void *)(a1 + 32);
    id v11 = v8;
    uint64_t v12 = v9;
    [v6 peerPaymentAcceptTermsWithIdentifier:v7 completion:v10];
  }
}

void __89__PKPeerPaymentTermsController__presentRemoteUIControllerWithUpdatedTermsViewController___block_invoke_2_28(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __89__PKPeerPaymentTermsController__presentRemoteUIControllerWithUpdatedTermsViewController___block_invoke_3;
  v8[3] = &unk_1E59CDC58;
  id v6 = *(id *)(a1 + 32);
  char v12 = a2;
  id v9 = v6;
  id v10 = v5;
  uint64_t v11 = *(void *)(a1 + 40);
  id v7 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v8);
}

uint64_t __89__PKPeerPaymentTermsController__presentRemoteUIControllerWithUpdatedTermsViewController___block_invoke_3(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) stopNavigationBarSpinner];
  v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    if (*(unsigned char *)(a1 + 56)) {
      id v4 = @"YES";
    }
    else {
      id v4 = @"NO";
    }
    int v6 = 138412546;
    id v7 = v4;
    __int16 v8 = 2112;
    uint64_t v9 = v3;
    _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "Accepted terms with success: %@, error %@.", (uint8_t *)&v6, 0x16u);
  }

  uint64_t result = *(void *)(*(void *)(a1 + 48) + 8);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 2, *(void *)(a1 + 40));
  }
  return result;
}

uint64_t __89__PKPeerPaymentTermsController__presentRemoteUIControllerWithUpdatedTermsViewController___block_invoke_35(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 8);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 1, *(void *)(a1 + 40));
  }
  return result;
}

void __89__PKPeerPaymentTermsController__presentRemoteUIControllerWithUpdatedTermsViewController___block_invoke_2_39(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __89__PKPeerPaymentTermsController__presentRemoteUIControllerWithUpdatedTermsViewController___block_invoke_3_40;
  v5[3] = &unk_1E59CB010;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __89__PKPeerPaymentTermsController__presentRemoteUIControllerWithUpdatedTermsViewController___block_invoke_3_40(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentEma_1.isa);
    id v4 = PKPrimaryAppleAccountFormattedUsername();
    id v5 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentEma_2.isa, &stru_1EF1B4C70.isa, v4);

    id v6 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v3 message:v5 preferredStyle:1];
    id v7 = (void *)MEMORY[0x1E4FB1410];
    __int16 v8 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentEma_3.isa);
    uint64_t v9 = [v7 actionWithTitle:v8 style:1 handler:0];

    uint64_t v10 = (void *)MEMORY[0x1E4FB1410];
    uint64_t v11 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentEma_4.isa);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __89__PKPeerPaymentTermsController__presentRemoteUIControllerWithUpdatedTermsViewController___block_invoke_4;
    v13[3] = &unk_1E59CB218;
    id v14 = *(id *)(a1 + 32);
    id v15 = WeakRetained;
    char v12 = [v10 actionWithTitle:v11 style:0 handler:v13];

    [v6 addAction:v9];
    [v6 addAction:v12];
    [v6 setPreferredAction:v12];
    [WeakRetained[10] presentViewController:v6 animated:1 completion:0];
  }
}

void __89__PKPeerPaymentTermsController__presentRemoteUIControllerWithUpdatedTermsViewController___block_invoke_4(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentEma_5.isa);
  [v2 startNavigationBarSpinnerWithTitle:v3];

  id v4 = *(void **)(*(void *)(a1 + 40) + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __89__PKPeerPaymentTermsController__presentRemoteUIControllerWithUpdatedTermsViewController___block_invoke_5;
  v7[3] = &unk_1E59CDC80;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v8 = v5;
  uint64_t v9 = v6;
  [v4 peerPaymentEmailTermsWithCompletion:v7];
}

void __89__PKPeerPaymentTermsController__presentRemoteUIControllerWithUpdatedTermsViewController___block_invoke_5(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __89__PKPeerPaymentTermsController__presentRemoteUIControllerWithUpdatedTermsViewController___block_invoke_6;
  v8[3] = &unk_1E59CDC58;
  id v6 = *(id *)(a1 + 32);
  char v12 = a2;
  id v9 = v6;
  id v10 = v5;
  uint64_t v11 = *(void *)(a1 + 40);
  id v7 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v8);
}

void __89__PKPeerPaymentTermsController__presentRemoteUIControllerWithUpdatedTermsViewController___block_invoke_6(uint64_t a1)
{
  [*(id *)(a1 + 32) stopNavigationBarSpinner];
  if (!*(unsigned char *)(a1 + 56) && *(void *)(a1 + 40))
  {
    objc_msgSend(MEMORY[0x1E4F84D80], "displayableErrorForError:");
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    id v2 = PKAlertForDisplayableErrorWithHandlers(v3, 0, 0, 0);
    [*(id *)(*(void *)(a1 + 48) + 80) presentViewController:v2 animated:1 completion:0];
  }
}

- (NSURL)termsURL
{
  return self->_termsURL;
}

- (NSString)termsIdentifier
{
  return self->_termsIdentifier;
}

- (NSString)passUniqueID
{
  return self->_passUniqueID;
}

- (PKPeerPaymentWebService)webService
{
  return self->_webService;
}

- (RemoteUIController)remoteUIController
{
  return self->_remoteUIController;
}

- (int64_t)paymentSetupContext
{
  return self->_paymentSetupContext;
}

- (void)setPaymentSetupContext:(int64_t)a3
{
  self->_paymentSetupContext = a3;
}

- (id)customPresentationHandler
{
  return self->_customPresentationHandler;
}

- (void)setCustomPresentationHandler:(id)a3
{
}

- (UIViewController)currentHostController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentHostController);

  return (UIViewController *)WeakRetained;
}

- (void)setCurrentHostController:(id)a3
{
}

- (UINavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_destroyWeak((id *)&self->_currentHostController);
  objc_storeStrong(&self->_customPresentationHandler, 0);
  objc_storeStrong((id *)&self->_remoteUIController, 0);
  objc_storeStrong((id *)&self->_webService, 0);
  objc_storeStrong((id *)&self->_passUniqueID, 0);
  objc_storeStrong((id *)&self->_termsIdentifier, 0);
  objc_storeStrong((id *)&self->_termsURL, 0);

  objc_storeStrong(&self->_completionHandler, 0);
}

@end